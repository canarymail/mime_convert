import 'dart:convert' as dart_convert;

import 'cjk_codec.dart';

part 'euc_jp_table.dart';

/// Ready-to-use EUC-JP codec, replacing invalid input with U+FFFD.
const EucJpCodec eucJp = EucJpCodec(allowInvalid: true);

/// Japanese EUC-JP, absent from `dart:convert`.
///
/// Without it a EUC-JP message cannot be rendered at all: the caller is left to
/// guess, and UTF-8 is the usual wrong guess. Covers the two-byte plane, the
/// 0x8E half-width katakana prefix, and the three-byte 0x8F JIS X 0212 plane.
class EucJpCodec extends dart_convert.Encoding {
  /// Creates a EUC-JP codec.
  const EucJpCodec({this.allowInvalid = false});

  /// Should invalid input be replaced rather than throwing?
  final bool allowInvalid;

  @override
  String get name => 'euc-jp';

  @override
  CjkDecoder get decoder =>
      CjkDecoder(_decodeTable, allowInvalid: allowInvalid);

  @override
  CjkEncoder get encoder =>
      CjkEncoder(_eucJpEncode, allowInvalid: allowInvalid);
}

/// Inverse of the decode table, built on first use. See [invertDecodeTable].
final Map<int, int> _eucJpEncode = invertDecodeTable(_decodeTable);
