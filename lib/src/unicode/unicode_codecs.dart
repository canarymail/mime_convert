// ignore_for_file: close_sinks

import 'dart:convert' as dart_convert;

/// BOM-aware UTF-16, defaulting to little-endian when no BOM is present.
///
/// The decoder consumes a leading UTF-16 BOM and lets it override the default
/// byte order. The encoder emits a little-endian BOM followed by UTF-16LE.
class Utf16Codec extends dart_convert.Encoding {
  /// Creates a BOM-aware UTF-16 codec.
  const Utf16Codec({this.allowInvalid = false});

  /// Whether malformed input is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  Utf16Decoder get decoder => Utf16Decoder(allowInvalid: allowInvalid);

  @override
  Utf16Encoder get encoder => Utf16Encoder(allowInvalid: allowInvalid);

  @override
  String get name => 'utf-16';
}

/// UTF-16 little-endian without implicit BOM handling.
class Utf16LeCodec extends dart_convert.Encoding {
  /// Creates a UTF-16LE codec.
  const Utf16LeCodec({
    this.allowInvalid = false,
    this.bomAware = false,
  });

  /// Whether malformed input is replaced with U+FFFD.
  final bool allowInvalid;

  /// Whether a leading UTF-16 BOM is consumed and may override byte order.
  final bool bomAware;

  @override
  Utf16LeDecoder get decoder => Utf16LeDecoder(
        allowInvalid: allowInvalid,
        bomAware: bomAware,
      );

  @override
  Utf16LeEncoder get encoder => Utf16LeEncoder(allowInvalid: allowInvalid);

  @override
  String get name => 'utf-16le';
}

/// UTF-16 big-endian without implicit BOM handling.
class Utf16BeCodec extends dart_convert.Encoding {
  /// Creates a UTF-16BE codec.
  const Utf16BeCodec({
    this.allowInvalid = false,
    this.bomAware = false,
  });

  /// Whether malformed input is replaced with U+FFFD.
  final bool allowInvalid;

  /// Whether a leading UTF-16 BOM is consumed and may override byte order.
  final bool bomAware;

  @override
  Utf16BeDecoder get decoder => Utf16BeDecoder(
        allowInvalid: allowInvalid,
        bomAware: bomAware,
      );

  @override
  Utf16BeEncoder get encoder => Utf16BeEncoder(allowInvalid: allowInvalid);

  @override
  String get name => 'utf-16be';
}

/// Decodes BOM-aware UTF-16, defaulting to little-endian without a BOM.
class Utf16Decoder extends _Utf16Decoder {
  /// Creates a BOM-aware UTF-16 decoder.
  const Utf16Decoder({bool allowInvalid = false})
      : super(
          defaultLittleEndian: true,
          allowInvalid: allowInvalid,
          bomAware: true,
        );
}

/// Decodes UTF-16 little-endian bytes.
class Utf16LeDecoder extends _Utf16Decoder {
  /// Creates a UTF-16LE decoder.
  const Utf16LeDecoder({
    bool allowInvalid = false,
    bool bomAware = false,
  }) : super(
          defaultLittleEndian: true,
          allowInvalid: allowInvalid,
          bomAware: bomAware,
        );
}

/// Decodes UTF-16 big-endian bytes.
class Utf16BeDecoder extends _Utf16Decoder {
  /// Creates a UTF-16BE decoder.
  const Utf16BeDecoder({
    bool allowInvalid = false,
    bool bomAware = false,
  }) : super(
          defaultLittleEndian: false,
          allowInvalid: allowInvalid,
          bomAware: bomAware,
        );
}

/// Encodes UTF-16 with a little-endian BOM.
class Utf16Encoder extends dart_convert.Converter<String, List<int>> {
  /// Creates a BOM-emitting UTF-16 encoder.
  const Utf16Encoder({this.allowInvalid = false});

  /// Whether malformed UTF-16 input is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) => <int>[
        0xff,
        0xfe,
        ...Utf16LeEncoder(allowInvalid: allowInvalid).convert(
          input,
          start,
          end,
        ),
      ];

  @override
  dart_convert.StringConversionSink startChunkedConversion(
    Sink<List<int>> sink,
  ) {
    final byteSink = (sink is dart_convert.ByteConversionSink
        ? sink
        : dart_convert.ByteConversionSink.from(sink))
      ..add(const <int>[0xff, 0xfe]);
    return Utf16LeEncoder(
      allowInvalid: allowInvalid,
    ).startChunkedConversion(byteSink);
  }
}

/// Encodes UTF-16 little-endian bytes without adding a BOM.
class Utf16LeEncoder extends _Utf16Encoder {
  /// Creates a UTF-16LE encoder.
  const Utf16LeEncoder({bool allowInvalid = false})
      : super(littleEndian: true, allowInvalid: allowInvalid);
}

/// Encodes UTF-16 big-endian bytes without adding a BOM.
class Utf16BeEncoder extends _Utf16Encoder {
  /// Creates a UTF-16BE encoder.
  const Utf16BeEncoder({bool allowInvalid = false})
      : super(littleEndian: false, allowInvalid: allowInvalid);
}

abstract class _Utf16Decoder extends dart_convert.Converter<List<int>, String> {
  const _Utf16Decoder({
    required this.defaultLittleEndian,
    required this.allowInvalid,
    required this.bomAware,
  });

  final bool defaultLittleEndian;
  final bool allowInvalid;
  final bool bomAware;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final processor = _Utf16DecoderProcessor(
      defaultLittleEndian: defaultLittleEndian,
      allowInvalid: allowInvalid,
      bomAware: bomAware,
    );
    return processor.add(input, start, usedEnd, isLast: true);
  }

  @override
  dart_convert.ByteConversionSink startChunkedConversion(Sink<String> sink) {
    final stringSink = sink is dart_convert.StringConversionSink
        ? sink
        : dart_convert.StringConversionSink.from(sink);
    return _Utf16DecoderSink(
      stringSink,
      _Utf16DecoderProcessor(
        defaultLittleEndian: defaultLittleEndian,
        allowInvalid: allowInvalid,
        bomAware: bomAware,
      ),
    );
  }
}

class _Utf16Encoder extends dart_convert.Converter<String, List<int>> {
  const _Utf16Encoder({
    required this.littleEndian,
    required this.allowInvalid,
  });

  final bool littleEndian;
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = <int>[];
    var index = start;
    while (index < usedEnd) {
      var codeUnit = input.codeUnitAt(index);
      if (_isHighSurrogate(codeUnit)) {
        if (index + 1 < usedEnd &&
            _isLowSurrogate(input.codeUnitAt(index + 1))) {
          _writeCodeUnit(output, codeUnit, littleEndian);
          _writeCodeUnit(output, input.codeUnitAt(index + 1), littleEndian);
          index += 2;
          continue;
        }
        codeUnit = _replacementForInvalid(input, index, allowInvalid);
      } else if (_isLowSurrogate(codeUnit)) {
        codeUnit = _replacementForInvalid(input, index, allowInvalid);
      }
      _writeCodeUnit(output, codeUnit, littleEndian);
      index++;
    }
    return output;
  }

  @override
  dart_convert.StringConversionSink startChunkedConversion(
    Sink<List<int>> sink,
  ) {
    final byteSink = sink is dart_convert.ByteConversionSink
        ? sink
        : dart_convert.ByteConversionSink.from(sink);
    return _Utf16EncoderSink(byteSink, this);
  }
}

/// UTF-8 with a signature: encoders prepend a BOM and decoders consume one.
class Utf8SigCodec extends dart_convert.Encoding {
  /// Creates a UTF-8-SIG codec.
  const Utf8SigCodec({this.allowInvalid = false});

  /// Whether malformed UTF-8 or invalid UTF-16 input is replaced.
  final bool allowInvalid;

  @override
  Utf8SigDecoder get decoder => Utf8SigDecoder(allowInvalid: allowInvalid);

  @override
  Utf8SigEncoder get encoder => Utf8SigEncoder(allowInvalid: allowInvalid);

  @override
  String get name => 'utf-8-sig';
}

/// Decodes UTF-8, consuming one leading UTF-8 BOM when present.
class Utf8SigDecoder extends dart_convert.Converter<List<int>, String> {
  /// Creates a UTF-8-SIG decoder.
  const Utf8SigDecoder({this.allowInvalid = false});

  /// Whether malformed UTF-8 is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    return dart_convert.Utf8Decoder(allowMalformed: allowInvalid)
        .convert(input, start, usedEnd);
  }

  @override
  dart_convert.ByteConversionSink startChunkedConversion(Sink<String> sink) {
    final stringSink = sink is dart_convert.StringConversionSink
        ? sink
        : dart_convert.StringConversionSink.from(sink);
    return dart_convert.Utf8Decoder(allowMalformed: allowInvalid)
        .startChunkedConversion(stringSink);
  }
}

/// Encodes UTF-8 and prepends the UTF-8 BOM.
class Utf8SigEncoder extends dart_convert.Converter<String, List<int>> {
  /// Creates a UTF-8-SIG encoder.
  const Utf8SigEncoder({this.allowInvalid = false});

  /// Whether unpaired UTF-16 surrogates are replaced with U+FFFD.
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    if (!allowInvalid) {
      _validateUtf16(input, start, usedEnd);
    }
    final encoded =
        const dart_convert.Utf8Encoder().convert(input, start, usedEnd);
    return <int>[0xef, 0xbb, 0xbf, ...encoded];
  }

  @override
  dart_convert.StringConversionSink startChunkedConversion(
    Sink<List<int>> sink,
  ) {
    final byteSink = sink is dart_convert.ByteConversionSink
        ? sink
        : dart_convert.ByteConversionSink.from(sink);
    final utf8Sink = const dart_convert.Utf8Encoder().startChunkedConversion(
      byteSink..add(const <int>[0xef, 0xbb, 0xbf]),
    );
    return _Utf8ValidatingEncoderSink(utf8Sink, allowInvalid: allowInvalid);
  }
}

class _Utf16DecoderProcessor {
  _Utf16DecoderProcessor({
    required this.defaultLittleEndian,
    required this.allowInvalid,
    required this.bomAware,
  })  : _littleEndian = defaultLittleEndian,
        _bomResolved = !bomAware;

  final bool defaultLittleEndian;
  final bool allowInvalid;
  final bool bomAware;
  bool _littleEndian;
  bool _bomResolved;
  final List<int> _initialBytes = <int>[];
  final List<int> _initialByteOffsets = <int>[];
  int? _pendingByte;
  int? _pendingByteOffset;
  int? _pendingHighSurrogate;
  int? _pendingHighSurrogateOffset;
  var _streamOffset = 0;

  String add(List<int> input, int start, int end, {required bool isLast}) {
    final output = <int>[];
    for (var index = start; index < end; index++) {
      final byte = input[index];
      final absoluteOffset = _streamOffset + index - start;
      if (!_bomResolved) {
        _initialBytes.add(byte);
        _initialByteOffsets.add(absoluteOffset);
        if (_initialBytes.length == 2) {
          _resolveBom(output);
        }
      } else {
        _addByte(output, byte, absoluteOffset);
      }
    }
    _streamOffset += end - start;
    if (isLast) {
      if (!_bomResolved) {
        _bomResolved = true;
        for (var index = 0; index < _initialBytes.length; index++) {
          _addByte(
            output,
            _initialBytes[index],
            _initialByteOffsets[index],
          );
        }
        _initialBytes.clear();
        _initialByteOffsets.clear();
      }
      final high = _pendingHighSurrogate;
      if (high != null) {
        _addInvalid(output, _pendingHighSurrogateOffset!, high);
        _pendingHighSurrogate = null;
        _pendingHighSurrogateOffset = null;
      }
      final pendingByte = _pendingByte;
      if (pendingByte != null) {
        _addInvalid(output, _pendingByteOffset!, pendingByte);
        _pendingByte = null;
        _pendingByteOffset = null;
      }
    }
    return String.fromCharCodes(output);
  }

  void _resolveBom(List<int> output) {
    final first = _initialBytes[0];
    final firstOffset = _initialByteOffsets[0];
    final second = _initialBytes[1];
    final secondOffset = _initialByteOffsets[1];
    _bomResolved = true;
    _initialBytes.clear();
    _initialByteOffsets.clear();
    if (first == 0xfe && second == 0xff) {
      _littleEndian = false;
      return;
    }
    if (first == 0xff && second == 0xfe) {
      _littleEndian = true;
      return;
    }
    _littleEndian = defaultLittleEndian;
    _addByte(output, first, firstOffset);
    _addByte(output, second, secondOffset);
  }

  void _addByte(List<int> output, int byte, int absoluteOffset) {
    if (byte < 0 || byte > 0xff) {
      final high = _pendingHighSurrogate;
      if (high != null) {
        _addInvalid(output, _pendingHighSurrogateOffset!, high);
        _pendingHighSurrogate = null;
        _pendingHighSurrogateOffset = null;
      }
      final pendingByte = _pendingByte;
      if (pendingByte != null) {
        _addInvalid(output, _pendingByteOffset!, pendingByte);
        _pendingByte = null;
        _pendingByteOffset = null;
      }
      _addInvalid(output, absoluteOffset, byte);
      return;
    }
    final firstByte = _pendingByte;
    if (firstByte == null) {
      _pendingByte = byte;
      _pendingByteOffset = absoluteOffset;
      return;
    }
    final unitOffset = _pendingByteOffset!;
    _pendingByte = null;
    _pendingByteOffset = null;
    final codeUnit =
        _littleEndian ? firstByte | (byte << 8) : (firstByte << 8) | byte;
    _addCodeUnit(output, codeUnit, unitOffset);
  }

  void _addCodeUnit(List<int> output, int codeUnit, int offset) {
    final high = _pendingHighSurrogate;
    if (high != null) {
      if (_isLowSurrogate(codeUnit)) {
        output
          ..add(high)
          ..add(codeUnit);
        _pendingHighSurrogate = null;
        _pendingHighSurrogateOffset = null;
        return;
      }
      _addInvalid(output, _pendingHighSurrogateOffset!, high);
      _pendingHighSurrogate = null;
      _pendingHighSurrogateOffset = null;
    }
    if (_isHighSurrogate(codeUnit)) {
      _pendingHighSurrogate = codeUnit;
      _pendingHighSurrogateOffset = offset;
    } else if (_isLowSurrogate(codeUnit)) {
      _addInvalid(output, offset, codeUnit);
    } else {
      output.add(codeUnit);
    }
  }

  void _addInvalid(List<int> output, int offset, int value) {
    if (!allowInvalid) {
      throw FormatException(
        'Malformed UTF-16 value 0x${value.toRadixString(16)} at byte $offset',
      );
    }
    output.add(0xfffd);
  }
}

class _Utf16DecoderSink extends dart_convert.ByteConversionSinkBase {
  _Utf16DecoderSink(this.sink, this.processor);

  final dart_convert.StringConversionSink sink;
  final _Utf16DecoderProcessor processor;
  var _closed = false;

  @override
  void add(List<int> chunk) {
    addSlice(chunk, 0, chunk.length, false);
  }

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {
    if (_closed) {
      throw StateError('Sink is closed');
    }
    RangeError.checkValidRange(start, end, chunk.length);
    final text = processor.add(chunk, start, end, isLast: isLast);
    if (text.isNotEmpty) {
      sink.add(text);
    }
    if (isLast) {
      close();
    }
  }

  @override
  void close() {
    if (_closed) {
      return;
    }
    final text = processor.add(const <int>[], 0, 0, isLast: true);
    if (text.isNotEmpty) {
      sink.add(text);
    }
    _closed = true;
    sink.close();
  }
}

class _Utf16EncoderSink extends dart_convert.StringConversionSinkBase {
  _Utf16EncoderSink(this.sink, this.encoder);

  final dart_convert.ByteConversionSink sink;
  final _Utf16Encoder encoder;
  int? _pendingHighSurrogate;
  var _closed = false;

  @override
  void add(String str) {
    addSlice(str, 0, str.length, false);
  }

  @override
  void addSlice(String str, int start, int end, bool isLast) {
    if (_closed) {
      throw StateError('Sink is closed');
    }
    RangeError.checkValidRange(start, end, str.length);
    var text = str.substring(start, end);
    final pending = _pendingHighSurrogate;
    if (pending != null) {
      text = String.fromCharCode(pending) + text;
      _pendingHighSurrogate = null;
    }
    if (!isLast && text.isNotEmpty) {
      final last = text.codeUnitAt(text.length - 1);
      if (_isHighSurrogate(last)) {
        _pendingHighSurrogate = last;
        text = text.substring(0, text.length - 1);
      }
    }
    if (text.isNotEmpty) {
      sink.add(encoder.convert(text));
    }
    if (isLast) {
      close();
    }
  }

  @override
  void close() {
    if (_closed) {
      return;
    }
    final pending = _pendingHighSurrogate;
    if (pending != null) {
      _pendingHighSurrogate = null;
      sink.add(encoder.convert(String.fromCharCode(pending)));
    }
    _closed = true;
    sink.close();
  }
}

class _Utf8ValidatingEncoderSink extends dart_convert.StringConversionSinkBase {
  _Utf8ValidatingEncoderSink(this.sink, {required this.allowInvalid});

  final dart_convert.StringConversionSink sink;
  final bool allowInvalid;
  int? _pendingHighSurrogate;
  var _closed = false;

  @override
  void add(String str) {
    addSlice(str, 0, str.length, false);
  }

  @override
  void addSlice(String str, int start, int end, bool isLast) {
    if (_closed) {
      throw StateError('Sink is closed');
    }
    RangeError.checkValidRange(start, end, str.length);
    var text = str.substring(start, end);
    final pending = _pendingHighSurrogate;
    if (pending != null) {
      text = String.fromCharCode(pending) + text;
      _pendingHighSurrogate = null;
    }
    if (!isLast && text.isNotEmpty) {
      final last = text.codeUnitAt(text.length - 1);
      if (_isHighSurrogate(last)) {
        _pendingHighSurrogate = last;
        text = text.substring(0, text.length - 1);
      }
    }
    if (text.isNotEmpty) {
      if (!allowInvalid) {
        _validateUtf16(text, 0, text.length);
      }
      sink.add(text);
    }
    if (isLast) {
      close();
    }
  }

  @override
  void close() {
    if (_closed) {
      return;
    }
    final pending = _pendingHighSurrogate;
    if (pending != null) {
      _pendingHighSurrogate = null;
      if (!allowInvalid) {
        throw const FormatException(
          'Unpaired UTF-16 surrogate at end of input',
        );
      }
      sink.add(String.fromCharCode(pending));
    }
    _closed = true;
    sink.close();
  }
}

bool _isHighSurrogate(int codeUnit) => codeUnit >= 0xd800 && codeUnit <= 0xdbff;

bool _isLowSurrogate(int codeUnit) => codeUnit >= 0xdc00 && codeUnit <= 0xdfff;

int _replacementForInvalid(String input, int index, bool allowInvalid) {
  if (!allowInvalid) {
    throw FormatException('Unpaired UTF-16 surrogate at index $index', input);
  }
  return 0xfffd;
}

void _writeCodeUnit(List<int> output, int codeUnit, bool littleEndian) {
  final low = codeUnit & 0xff;
  final high = codeUnit >> 8;
  if (littleEndian) {
    output
      ..add(low)
      ..add(high);
  } else {
    output
      ..add(high)
      ..add(low);
  }
}

void _validateUtf16(String input, int start, int end) {
  var index = start;
  while (index < end) {
    final codeUnit = input.codeUnitAt(index);
    if (_isHighSurrogate(codeUnit)) {
      if (index + 1 >= end || !_isLowSurrogate(input.codeUnitAt(index + 1))) {
        throw FormatException('Unpaired UTF-16 surrogate at index $index');
      }
      index += 2;
    } else if (_isLowSurrogate(codeUnit)) {
      throw FormatException('Unpaired UTF-16 surrogate at index $index');
    } else {
      index++;
    }
  }
}
