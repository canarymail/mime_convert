import 'dart:convert';

part 'table.dart';

/// Big5 codec instance.
///
/// This follows the WHATWG Big5 encoding, which combines Big5 with the Hong
/// Kong Supplementary Character Set and other extensions used on the web and
/// in real-world mail.
const Big5Codec big5 = Big5Codec();

const int _replacementCodePoint = 0xFFFD;
const int _encoderPointerFloor = (0xA1 - 0x81) * 157;

const Map<int, List<int>> _doubleCodePointMappings = {
  1133: <int>[0x00CA, 0x0304],
  1135: <int>[0x00CA, 0x030C],
  1164: <int>[0x00EA, 0x0304],
  1166: <int>[0x00EA, 0x030C],
};

const Set<int> _lastPointerCodePoints = {
  0x2550,
  0x255E,
  0x2561,
  0x256A,
  0x5341,
  0x5345,
};

// Top-level variables are initialized lazily. The inverse therefore costs
// nothing unless encoding is actually requested.
final Map<int, int> _big5EncodeIndex = _buildBig5EncodeIndex();

Map<int, int> _buildBig5EncodeIndex() {
  final result = <int, int>{};
  _forEachBig5IndexEntry((pointer, codePoint) {
    if (pointer < _encoderPointerFloor) {
      return;
    }
    if (_lastPointerCodePoints.contains(codePoint)) {
      // WHATWG requires the last pointer for these six duplicate mappings.
      result[codePoint] = pointer;
    } else {
      result.putIfAbsent(codePoint, () => pointer);
    }
  });
  return result;
}

/// Visits the packed index once in pointer order.
///
/// Unlike repeated [_big5IndexCodePoint] lookups, this preserves each page's
/// delta state and decodes every varint exactly once. Building the lazy encoder
/// index is therefore O(n), not O(n * pageSize).
void _forEachBig5IndexEntry(void Function(int pointer, int codePoint) visit) {
  const pageSize = 1 << _big5IndexPageShift;
  const pointerCount = _big5IndexLastPointer - _big5IndexFirstPointer + 1;
  const pageCount = (pointerCount + pageSize - 1) >> _big5IndexPageShift;

  for (var page = 0; page < pageCount; page++) {
    final pageOffsetIndex = page * 2;
    var dataOffset = _big5IndexPageOffsets.codeUnitAt(pageOffsetIndex) |
        (_big5IndexPageOffsets.codeUnitAt(pageOffsetIndex + 1) << 8);
    var previousCodePoint = 0;
    final pageStart = page * pageSize;
    final entriesInPage = (pointerCount - pageStart).clamp(0, pageSize).toInt();

    for (var position = 0; position < entriesInPage; position++) {
      var byte = _big5IndexData.codeUnitAt(dataOffset++);
      if (byte == 0) {
        continue;
      }

      var encodedDelta = byte & 0x7F;
      var shift = 7;
      while ((byte & 0x80) != 0) {
        byte = _big5IndexData.codeUnitAt(dataOffset++);
        encodedDelta |= (byte & 0x7F) << shift;
        shift += 7;
      }

      final zigzag = encodedDelta - 1;
      final delta = (zigzag >> 1) ^ -(zigzag & 1);
      previousCodePoint += delta;
      visit(
        _big5IndexFirstPointer + pageStart + position,
        previousCodePoint,
      );
    }
  }
}

/// Looks up one WHATWG Big5 pointer in the generated packed index.
///
/// The page size is fixed at generation time, so lookup is O(1), with at most
/// 32 small varints decoded. Page-local deltas keep the AOT payload near 30 KiB
/// while avoiding a const Dart map object and one object per mapping.
int? _big5IndexCodePoint(int pointer) {
  if (pointer < _big5IndexFirstPointer || pointer > _big5IndexLastPointer) {
    return null;
  }

  final relativePointer = pointer - _big5IndexFirstPointer;
  final page = relativePointer >> _big5IndexPageShift;
  final pageOffsetIndex = page * 2;
  var dataOffset = _big5IndexPageOffsets.codeUnitAt(pageOffsetIndex) |
      (_big5IndexPageOffsets.codeUnitAt(pageOffsetIndex + 1) << 8);
  final positionInPage = relativePointer & ((1 << _big5IndexPageShift) - 1);
  var previousCodePoint = 0;

  for (var position = 0; position <= positionInPage; position++) {
    var byte = _big5IndexData.codeUnitAt(dataOffset++);
    if (byte == 0) {
      if (position == positionInPage) {
        return null;
      }
      continue;
    }

    var encodedDelta = byte & 0x7F;
    var shift = 7;
    while ((byte & 0x80) != 0) {
      byte = _big5IndexData.codeUnitAt(dataOffset++);
      encodedDelta |= (byte & 0x7F) << shift;
      shift += 7;
    }

    final zigzag = encodedDelta - 1;
    final delta = (zigzag >> 1) ^ -(zigzag & 1);
    previousCodePoint += delta;
    if (position == positionInPage) {
      return previousCodePoint;
    }
  }
  return null;
}

/// A WHATWG Big5 compatible codec.
class Big5Codec extends Encoding {
  /// Creates a new [Big5Codec].
  ///
  /// Set [allowInvalid] to `true` to replace malformed input with U+FFFD when
  /// decoding and unmappable characters with `?` when encoding.
  const Big5Codec({this.allowInvalid = false});

  /// Whether invalid input is replaced instead of throwing [FormatException].
  final bool allowInvalid;

  @override
  Converter<List<int>, String> get decoder => allowInvalid
      ? const Big5Decoder(allowInvalid: true)
      : const Big5Decoder();

  @override
  Converter<String, List<int>> get encoder => allowInvalid
      ? const Big5Encoder(allowInvalid: true)
      : const Big5Encoder();

  @override
  String get name => 'Big5';
}

/// A WHATWG Big5 compatible encoder.
class Big5Encoder extends Converter<String, List<int>> {
  /// Creates a new [Big5Encoder].
  const Big5Encoder({this.allowInvalid = false});

  /// Whether unmappable characters are replaced with ASCII `?`.
  ///
  /// When `false`, an unmappable character throws [FormatException].
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final state = _Big5EncoderState(allowInvalid: allowInvalid);
    return state.convert(input, start, usedEnd, isLast: true);
  }

  @override
  StringConversionSink startChunkedConversion(Sink<List<int>> sink) {
    // Ownership is transferred to the returned conversion sink.
    // ignore: close_sinks
    final byteSink =
        sink is ByteConversionSink ? sink : ByteConversionSink.from(sink);
    return _Big5EncoderSink(
      byteSink,
      _Big5EncoderState(allowInvalid: allowInvalid),
    );
  }
}

class _Big5EncoderState {
  _Big5EncoderState({required this.allowInvalid});

  final bool allowInvalid;
  int? _pendingHighSurrogate;

  List<int> convert(
    String input,
    int start,
    int end, {
    required bool isLast,
  }) {
    final output = <int>[];
    var index = start;

    final pendingHighSurrogate = _pendingHighSurrogate;
    if (pendingHighSurrogate != null) {
      _pendingHighSurrogate = null;
      if (index < end && _isLowSurrogate(input.codeUnitAt(index))) {
        final codePoint =
            _combineSurrogates(pendingHighSurrogate, input.codeUnitAt(index));
        _writeCodePoint(output, codePoint, index - 1);
        index++;
      } else {
        _writeCodePoint(output, _replacementCodePoint, index - 1);
      }
    }

    while (index < end) {
      final codeUnit = input.codeUnitAt(index);
      if (_isHighSurrogate(codeUnit)) {
        if (index + 1 < end) {
          final next = input.codeUnitAt(index + 1);
          if (_isLowSurrogate(next)) {
            _writeCodePoint(
              output,
              _combineSurrogates(codeUnit, next),
              index,
            );
            index += 2;
            continue;
          }
        } else if (!isLast) {
          _pendingHighSurrogate = codeUnit;
          index++;
          continue;
        }
        _writeCodePoint(output, _replacementCodePoint, index);
      } else if (_isLowSurrogate(codeUnit)) {
        _writeCodePoint(output, _replacementCodePoint, index);
      } else {
        _writeCodePoint(output, codeUnit, index);
      }
      index++;
    }

    if (isLast && _pendingHighSurrogate != null) {
      _pendingHighSurrogate = null;
      _writeCodePoint(output, _replacementCodePoint, end);
    }
    return output;
  }

  void _writeCodePoint(List<int> output, int codePoint, int position) {
    if (codePoint < 0x80) {
      output.add(codePoint);
      return;
    }

    final pointer = _big5EncodeIndex[codePoint];
    if (pointer == null) {
      if (!allowInvalid) {
        throw FormatException(
          'Cannot encode U+${codePoint.toRadixString(16).toUpperCase()} '
          'as Big5 at position $position',
        );
      }
      output.add(0x3F);
      return;
    }

    final leading = pointer ~/ 157 + 0x81;
    final trailing = pointer % 157;
    final offset = trailing < 0x3F ? 0x40 : 0x62;
    output
      ..add(leading)
      ..add(trailing + offset);
  }
}

class _Big5EncoderSink extends StringConversionSinkBase {
  _Big5EncoderSink(this._sink, this._state);

  final ByteConversionSink _sink;
  final _Big5EncoderState _state;
  bool _isClosed = false;

  @override
  void add(String chunk) {
    addSlice(chunk, 0, chunk.length, false);
  }

  @override
  void addSlice(String chunk, int start, int end, bool isLast) {
    if (_isClosed) {
      throw StateError('Cannot add to a closed Big5 encoder sink');
    }
    RangeError.checkValidRange(start, end, chunk.length);
    final output = _state.convert(chunk, start, end, isLast: isLast);
    _emit(output, isLast);
  }

  @override
  void close() {
    if (_isClosed) {
      return;
    }
    final output = _state.convert('', 0, 0, isLast: true);
    _emit(output, true);
  }

  void _emit(List<int> output, bool isLast) {
    if (output.isNotEmpty) {
      _sink.addSlice(output, 0, output.length, isLast);
    } else if (isLast) {
      _sink.close();
    }
    if (isLast) {
      _isClosed = true;
    }
  }
}

/// A WHATWG Big5 compatible decoder.
class Big5Decoder extends Converter<List<int>, String> {
  /// Creates a new [Big5Decoder].
  const Big5Decoder({this.allowInvalid = false});

  /// Whether malformed input is replaced with U+FFFD.
  ///
  /// When `false`, malformed input throws [FormatException].
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final state = _Big5DecoderState(allowInvalid: allowInvalid);
    return state.convert(input, start, usedEnd, isLast: true);
  }

  @override
  ByteConversionSink startChunkedConversion(Sink<String> sink) {
    // Ownership is transferred to the returned conversion sink.
    // ignore: close_sinks
    final stringSink =
        sink is StringConversionSink ? sink : StringConversionSink.from(sink);
    return _Big5DecoderSink(
      stringSink,
      _Big5DecoderState(allowInvalid: allowInvalid),
    );
  }
}

class _Big5DecoderState {
  _Big5DecoderState({required this.allowInvalid});

  final bool allowInvalid;
  int? _leading;

  String convert(
    List<int> input,
    int start,
    int end, {
    required bool isLast,
  }) {
    final output = StringBuffer();
    var index = start;

    while (index < end) {
      final byte = input[index];
      final leading = _leading;

      if (leading != null) {
        _leading = null;
        if (!_isByte(byte)) {
          _writeError(output, index);
          index++;
          continue;
        }

        int? pointer;
        if ((byte >= 0x40 && byte <= 0x7E) || (byte >= 0xA1 && byte <= 0xFE)) {
          final offset = byte < 0x7F ? 0x40 : 0x62;
          pointer = (leading - 0x81) * 157 + byte - offset;
        }

        if (pointer != null) {
          final doubleMapping = _doubleCodePointMappings[pointer];
          if (doubleMapping != null) {
            output.write(String.fromCharCodes(doubleMapping));
            index++;
            continue;
          }

          final codePoint = _big5IndexCodePoint(pointer);
          if (codePoint != null) {
            output.writeCharCode(codePoint);
            index++;
            continue;
          }
        }

        _writeError(output, index);
        // WHATWG restores an ASCII trail after a malformed sequence, so it is
        // processed again as ASCII on the next iteration.
        if (byte < 0x80) {
          continue;
        }
        index++;
        continue;
      }

      if (!_isByte(byte)) {
        _writeError(output, index);
        index++;
      } else if (byte < 0x80) {
        output.writeCharCode(byte);
        index++;
      } else if (byte >= 0x81 && byte <= 0xFE) {
        _leading = byte;
        index++;
      } else {
        _writeError(output, index);
        index++;
      }
    }

    if (isLast && _leading != null) {
      _leading = null;
      _writeError(output, end);
    }
    return output.toString();
  }

  void _writeError(StringBuffer output, int position) {
    if (!allowInvalid) {
      throw FormatException(
        'Malformed Big5 byte sequence at position $position',
      );
    }
    output.writeCharCode(_replacementCodePoint);
  }
}

class _Big5DecoderSink extends ByteConversionSinkBase {
  _Big5DecoderSink(this._sink, this._state);

  final StringConversionSink _sink;
  final _Big5DecoderState _state;
  bool _isClosed = false;

  @override
  void add(List<int> chunk) {
    addSlice(chunk, 0, chunk.length, false);
  }

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {
    if (_isClosed) {
      throw StateError('Cannot add to a closed Big5 decoder sink');
    }
    RangeError.checkValidRange(start, end, chunk.length);
    final output = _state.convert(chunk, start, end, isLast: isLast);
    _emit(output, isLast);
  }

  @override
  void close() {
    if (_isClosed) {
      return;
    }
    final output = _state.convert(const <int>[], 0, 0, isLast: true);
    _emit(output, true);
  }

  void _emit(String output, bool isLast) {
    if (output.isNotEmpty) {
      _sink.addSlice(output, 0, output.length, isLast);
    } else if (isLast) {
      _sink.close();
    }
    if (isLast) {
      _isClosed = true;
    }
  }
}

bool _isByte(int value) => value >= 0 && value <= 0xFF;

bool _isHighSurrogate(int codeUnit) => codeUnit >= 0xD800 && codeUnit <= 0xDBFF;

bool _isLowSurrogate(int codeUnit) => codeUnit >= 0xDC00 && codeUnit <= 0xDFFF;

int _combineSurrogates(int high, int low) =>
    0x10000 + ((high - 0xD800) << 10) + low - 0xDC00;
