import 'dart:convert' as dart_convert;

import 'cjk_codec.dart';

part 'shift_jis_table.dart';

/// Ready-to-use Shift_JIS codec, replacing invalid input with U+FFFD.
const ShiftJisCodec shiftJis = ShiftJisCodec(allowInvalid: true);

/// Looks up a WHATWG `index jis0208` code point by [pointer].
///
/// The package's CP932-backed Shift_JIS table exactly covers index jis0208.
/// Converting the pointer to its Shift_JIS byte pair lets ISO-2022-JP reuse
/// that table with no second 7,336-entry mapping in the application binary.
int? lookupJis0208CodePoint(int pointer) {
  if (pointer < 0 || pointer >= 94 * 94) {
    return null;
  }
  final leading = pointer ~/ 188;
  final leadingOffset = leading < 0x1F ? 0x81 : 0xC1;
  final trailing = pointer % 188;
  final trailingOffset = trailing < 0x3F ? 0x40 : 0x41;
  final code = ((leading + leadingOffset) << 8) | (trailing + trailingOffset);
  return _decodeTable[code];
}

/// Looks up the first WHATWG `index jis0208` pointer for [codePoint].
///
/// Returns null when the code point is not reachable by ISO-2022-JP's two
/// 94-byte JIS bytes.
int? lookupJis0208Pointer(int codePoint) {
  final code = _shiftJisEncode[codePoint];
  if (code == null || code < 0x100) {
    return null;
  }
  final leadingByte = code >> 8;
  final trailingByte = code & 0xFF;
  final leadingOffset = leadingByte < 0xA0 ? 0x81 : 0xC1;
  final trailingOffset = trailingByte < 0x7F ? 0x40 : 0x41;
  final pointer =
      (leadingByte - leadingOffset) * 188 + trailingByte - trailingOffset;
  return pointer < 94 * 94 ? pointer : null;
}

/// Japanese Shift_JIS, absent from `dart:convert`.
///
/// Without it a Shift_JIS message cannot be rendered at all: the caller is left
/// to guess, and UTF-8 is the usual wrong guess. Single-byte half-width
/// katakana (0xA1-0xDF) and the two-byte planes are both covered.
class ShiftJisCodec extends dart_convert.Encoding {
  /// Creates a Shift_JIS codec.
  const ShiftJisCodec({this.allowInvalid = false});

  /// Should invalid input be replaced rather than throwing?
  final bool allowInvalid;

  @override
  String get name => 'shift_jis';

  @override
  CjkDecoder get decoder =>
      CjkDecoder(_decodeTable, allowInvalid: allowInvalid);

  @override
  CjkEncoder get encoder =>
      CjkEncoder(_shiftJisEncode, allowInvalid: allowInvalid);
}

/// Inverse of the decode table, built on first use, with the asymmetric cases
/// overlaid.
///
/// Inversion alone is not a complete encoder: a few code points encode to a
/// sequence that decodes back to a *different* code point, so no inverse can
/// produce them. [_encodeOverrides] carries exactly those, generated from the
/// source encoder. See [invertDecodeTable].
final Map<int, int> _shiftJisEncode = {
  ...invertDecodeTable(_decodeTable),
  ..._encodeOverrides,
};
