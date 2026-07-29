import 'dart:convert' as dart_convert;

/// Replacement character emitted for undecodable input when `allowInvalid`.
const int runeError = 0xFFFD;

/// Shared decoder for the variable-width CJK charsets in this package.
///
/// All three (Shift_JIS, EUC-JP, EUC-KR) are lookup tables over byte sequences
/// of one to three bytes, so they differ only in their table — not their
/// algorithm. Sequence length is discovered from the table rather than encoded
/// as per-charset lead-byte rules, which keeps the charset-specific knowledge
/// entirely inside the generated data.
///
/// Key packing (see tool/generate_cjk_tables.py):
///   single byte -> b
///   two bytes   -> lead * 256 + trail
///   three bytes -> 0x1000000 + (b1 << 16 | b2 << 8 | b3)
class CjkDecoder extends dart_convert.Converter<List<int>, String> {
  /// Creates a decoder over [table].
  const CjkDecoder(this.table, {this.allowInvalid = false});

  /// Byte sequence -> code point.
  final Map<int, int> table;

  /// Should invalid byte sequences be replaced with U+FFFD?
  ///
  /// When `false`, an undecodable sequence throws [FormatException].
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final buffer = StringBuffer();

    var i = start;
    while (i < usedEnd) {
      final b0 = input[i];

      final single = table[b0];
      if (single != null) {
        buffer.writeCharCode(single);
        i += 1;
        continue;
      }

      if (i + 1 < usedEnd) {
        final double = table[b0 * 256 + input[i + 1]];
        if (double != null) {
          buffer.writeCharCode(double);
          i += 2;
          continue;
        }
      }

      // EUC-JP reaches JIS X 0212 through a three-byte 0x8F prefix. Tried
      // after two bytes because a three-byte lead never has a two-byte
      // mapping, so the order costs one failed lookup and avoids a
      // per-charset special case.
      if (i + 2 < usedEnd) {
        final triple = table[0x1000000 +
            ((b0 << 16) | (input[i + 1] << 8) | input[i + 2])];
        if (triple != null) {
          buffer.writeCharCode(triple);
          i += 3;
          continue;
        }
      }

      if (!allowInvalid) {
        throw FormatException('Encountered invalid byte '
            '0x${b0.toRadixString(16)} at position $i');
      }
      buffer.writeCharCode(runeError);
      i += 1;
    }

    return buffer.toString();
  }
}

/// Shared encoder, driven by the inverse of a decode table.
class CjkEncoder extends dart_convert.Converter<String, List<int>> {
  /// Creates an encoder over [table], which maps code point -> byte sequence
  /// using the same packing as [CjkDecoder].
  const CjkEncoder(this.table, {this.allowInvalid = false});

  /// Code point -> packed byte sequence.
  final Map<int, int> table;

  /// Should unmappable characters be replaced with `?`?
  ///
  /// When `false`, an unmappable character throws [FormatException].
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final runes = input.runes.toList(growable: false);
    final usedEnd = RangeError.checkValidRange(start, end, runes.length);
    final out = <int>[];

    for (var i = start; i < usedEnd; i++) {
      final rune = runes[i];
      final packed = table[rune];
      if (packed == null) {
        if (!allowInvalid) {
          throw FormatException('Cannot encode U+'
              '${rune.toRadixString(16).toUpperCase()} at position $i');
        }
        out.add(0x3F); // '?'
        continue;
      }

      if (packed < 0x100) {
        out.add(packed);
      } else if (packed < 0x1000000) {
        out..add(packed >> 8)..add(packed & 0xFF);
      } else {
        final v = packed - 0x1000000;
        out..add((v >> 16) & 0xFF)..add((v >> 8) & 0xFF)..add(v & 0xFF);
      }
    }

    return out;
  }
}

/// Inverts a decode table for use by [CjkEncoder].
///
/// Built lazily by each codec rather than generated, so the package ships one
/// const map per charset instead of two. These charsets are read far more often
/// than written, and the existing Big5/GBK tables already cost ~80k lines of
/// source between them by shipping both directions.
///
/// Where several byte sequences decode to the same code point the lowest wins,
/// which prefers the shorter, more canonical encoding.
///
/// **This is not a complete encoder on its own.** Inversion assumes encode and
/// decode are symmetric, and they are not: a handful of code points encode to a
/// sequence that decodes back to a *different* code point, so no inverse can
/// reach them — U+2212 MINUS SIGN in cp932, U+00A5 YEN and U+203E OVERLINE in
/// EUC-JP, among others. Each codec overlays its generated `_encodeOverrides`
/// on this result to cover them.
///
/// Duplicate resolution follows CPython, the same source the decode tables come
/// from, so the two directions agree with each other. The WHATWG Encoding
/// Standard canonicalises some cp932 duplicates differently; that divergence is
/// deliberate and affects only which of several equivalent byte sequences is
/// emitted when encoding, never decoding.
Map<int, int> invertDecodeTable(Map<int, int> decodeTable) {
  final inverted = <int, int>{};
  for (final entry in decodeTable.entries) {
    final existing = inverted[entry.value];
    if (existing == null || entry.key < existing) {
      inverted[entry.value] = entry.key;
    }
  }
  return inverted;
}
