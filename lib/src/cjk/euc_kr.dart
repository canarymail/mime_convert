import 'dart:convert' as dart_convert;

import 'cjk_codec.dart';

part 'euc_kr_table.dart';

/// Ready-to-use EUC-KR codec, replacing invalid input with U+FFFD.
const EucKrCodec eucKr = EucKrCodec(allowInvalid: true);

/// Korean EUC-KR, absent from `dart:convert`.
///
/// Without it a EUC-KR message cannot be rendered at all: the caller is left to
/// guess, and UTF-8 is the usual wrong guess. Covers the two-byte Hangul and
/// Hanja planes.
class EucKrCodec extends dart_convert.Encoding {
  /// Creates a EUC-KR codec.
  const EucKrCodec({this.allowInvalid = false});

  /// Should invalid input be replaced rather than throwing?
  final bool allowInvalid;

  @override
  String get name => 'euc-kr';

  @override
  CjkDecoder get decoder =>
      CjkDecoder(_decodeTable, allowInvalid: allowInvalid);

  @override
  CjkEncoder get encoder =>
      CjkEncoder(_eucKrEncode, allowInvalid: allowInvalid);
}

/// Inverse of the decode table, built on first use. See [invertDecodeTable].
final Map<int, int> _eucKrEncode = invertDecodeTable(_decodeTable);
