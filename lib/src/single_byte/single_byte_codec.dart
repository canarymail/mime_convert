// ignore_for_file: close_sinks

import 'dart:convert' as dart_convert;
import 'dart:typed_data';

/// A codec for a generated, single-byte character encoding.
///
/// The decoding table contains either the complete 256-byte mapping, or only
/// the high half for an ASCII-compatible encoding. U+FFFF marks undefined
/// bytes.
class SingleByteCodec extends dart_convert.Encoding {
  /// Creates a single-byte codec backed by a generated decoding table.
  const SingleByteCodec({
    required String name,
    required String decodingTable,
    required Map<int, int> encodingOverrides,
    required int replacementByte,
    required bool asciiCompatible,
    this.allowInvalid = false,
  })  : _name = name,
        _decodingTable = decodingTable,
        _encodingOverrides = encodingOverrides,
        _replacementByte = replacementByte,
        _asciiCompatible = asciiCompatible;

  final String _name;
  final String _decodingTable;
  final Map<int, int> _encodingOverrides;
  final int _replacementByte;
  final bool _asciiCompatible;

  /// Whether malformed bytes and unencodable characters are replaced.
  final bool allowInvalid;

  @override
  SingleByteDecoder get decoder => SingleByteDecoder(
        _decodingTable,
        asciiCompatible: _asciiCompatible,
        allowInvalid: allowInvalid,
      );

  @override
  SingleByteEncoder get encoder => SingleByteEncoder(
        _decodingTable,
        encodingOverrides: _encodingOverrides,
        replacementByte: _replacementByte,
        asciiCompatible: _asciiCompatible,
        allowInvalid: allowInvalid,
      );

  @override
  String get name => _name;
}

/// Decodes bytes using a generated single-byte mapping.
class SingleByteDecoder extends dart_convert.Converter<List<int>, String> {
  /// Creates a decoder backed by a complete or high-half mapping string.
  const SingleByteDecoder(
    this.decodingTable, {
    required this.asciiCompatible,
    this.allowInvalid = false,
  }) : assert(
          decodingTable.length == (asciiCompatible ? 128 : 256),
          'The decoding table has the wrong length',
        );

  /// The complete mapping, or its high half for ASCII-compatible encodings.
  final String decodingTable;

  /// Whether bytes `0x00` through `0x7f` map to the same Unicode scalar.
  final bool asciiCompatible;

  /// Whether invalid input is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final codePoints = <int>[];
    for (var index = start; index < usedEnd; index++) {
      final byte = input[index];
      int codePoint;
      if (byte < 0 || byte > 0xff) {
        codePoint = -1;
      } else if (asciiCompatible && byte < 0x80) {
        codePoint = byte;
      } else {
        codePoint =
            decodingTable.codeUnitAt(asciiCompatible ? byte - 0x80 : byte);
      }

      if (codePoint < 0 || codePoint == 0xffff) {
        if (!allowInvalid) {
          throw FormatException(
            'Invalid byte 0x${byte.toRadixString(16)} at offset $index',
            input,
            index,
          );
        }
        codePoint = 0xfffd;
      }
      codePoints.add(codePoint);
    }
    return String.fromCharCodes(codePoints);
  }

  @override
  dart_convert.ByteConversionSink startChunkedConversion(Sink<String> sink) {
    final stringSink = sink is dart_convert.StringConversionSink
        ? sink
        : dart_convert.StringConversionSink.from(sink);
    return _SingleByteDecoderSink(stringSink, this);
  }
}

/// Encodes Unicode text using a generated single-byte mapping.
class SingleByteEncoder extends dart_convert.Converter<String, List<int>> {
  /// Creates an encoder that lazily reverses [decodingTable].
  SingleByteEncoder(
    this.decodingTable, {
    required this.encodingOverrides,
    required this.replacementByte,
    required this.asciiCompatible,
    this.allowInvalid = false,
  });

  /// The complete mapping, or its high half for ASCII-compatible encodings.
  final String decodingTable;

  /// Python byte choices that differ from the lowest mapped byte.
  final Map<int, int> encodingOverrides;

  /// The encoded form of `?`, used when [allowInvalid] is true.
  final int replacementByte;

  /// Whether ASCII scalars can be emitted directly.
  final bool asciiCompatible;

  /// Whether unencodable input is replaced with an encoded question mark.
  final bool allowInvalid;

  late final Map<int, int> _encodingMap = _createEncodingMap();

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = <int>[];
    for (final codePoint in input.substring(start, usedEnd).runes) {
      var byte = _encodingMap[codePoint];
      if (byte == null) {
        if (!allowInvalid) {
          throw FormatException(
            'Character U+${codePoint.toRadixString(16).toUpperCase()} '
            'cannot be encoded',
            input,
          );
        }
        byte = replacementByte;
      }
      output.add(byte);
    }
    return output;
  }

  Map<int, int> _createEncodingMap() {
    final result = <int, int>{};
    if (asciiCompatible) {
      for (var byte = 0; byte < 0x80; byte++) {
        result[byte] = byte;
      }
    }
    final offset = asciiCompatible ? 0x80 : 0;
    for (var index = 0; index < decodingTable.length; index++) {
      final codePoint = decodingTable.codeUnitAt(index);
      if (codePoint != 0xffff) {
        result.putIfAbsent(codePoint, () => index + offset);
      }
    }
    result.addAll(encodingOverrides);
    return result;
  }

  @override
  dart_convert.StringConversionSink startChunkedConversion(
    Sink<List<int>> sink,
  ) {
    final byteSink = sink is dart_convert.ByteConversionSink
        ? sink
        : dart_convert.ByteConversionSink.from(sink);
    return _SingleByteEncoderSink(byteSink, this);
  }
}

class _SingleByteDecoderSink extends dart_convert.ByteConversionSinkBase {
  _SingleByteDecoderSink(this.sink, this.decoder);

  final dart_convert.StringConversionSink sink;
  final SingleByteDecoder decoder;
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
    if (start < end) {
      sink.add(decoder.convert(chunk, start, end));
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
    _closed = true;
    sink.close();
  }
}

class _SingleByteEncoderSink extends dart_convert.StringConversionSinkBase {
  _SingleByteEncoderSink(this.sink, this.encoder);

  final dart_convert.ByteConversionSink sink;
  final SingleByteEncoder encoder;
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
      if (last >= 0xd800 && last <= 0xdbff) {
        _pendingHighSurrogate = last;
        text = text.substring(0, text.length - 1);
      }
    }
    if (text.isNotEmpty) {
      sink.add(Uint8List.fromList(encoder.convert(text)));
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
