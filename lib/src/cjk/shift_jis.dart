import 'dart:convert' as dart_convert;

import 'cjk_codec.dart';

part 'shift_jis_table.dart';

/// Ready-to-use Shift_JIS codec, replacing invalid input with U+FFFD.
const ShiftJisCodec shiftJis = ShiftJisCodec(allowInvalid: true);

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
