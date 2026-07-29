import 'dart:convert' as dart_convert;

import '../gbk/gbk.dart';

part 'table.dart';

/// Ready-to-use WHATWG GB18030 codec.
///
/// Invalid input is replaced with U+FFFD and unmappable output with `?`.
const Gb18030Codec gb18030 = Gb18030Codec(allowInvalid: true);

/// GB18030 as defined by the WHATWG Encoding Standard.
///
/// The two-byte repertoire comes from `index gb18030`; the full Unicode
/// repertoire uses the standard's compact 207-boundary four-byte range table.
class Gb18030Codec extends dart_convert.Encoding {
  /// Creates a GB18030 codec.
  const Gb18030Codec({this.allowInvalid = false});

  /// Whether malformed input is replaced rather than throwing.
  final bool allowInvalid;

  @override
  String get name => 'gb18030';

  @override
  Gb18030Decoder get decoder => Gb18030Decoder(allowInvalid: allowInvalid);

  @override
  Gb18030Encoder get encoder => Gb18030Encoder(allowInvalid: allowInvalid);
}

/// Converts GB18030 bytes to Unicode.
class Gb18030Decoder extends dart_convert.Converter<List<int>, String> {
  /// Creates a GB18030 decoder.
  const Gb18030Decoder({this.allowInvalid = false});

  /// Whether malformed input is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = StringBuffer();
    _Gb18030DecoderMachine(
      output,
      allowInvalid: allowInvalid,
    )
      ..add(input, start, usedEnd)
      ..finish(input, usedEnd);
    return output.toString();
  }

  @override
  dart_convert.ByteConversionSink startChunkedConversion(Sink<String> sink) {
    // The returned conversion sink owns and closes this adapter.
    // ignore: close_sinks
    final stringSink = sink is dart_convert.StringConversionSink
        ? sink
        : dart_convert.StringConversionSink.from(sink);
    return _Gb18030DecoderSink(stringSink, allowInvalid: allowInvalid);
  }
}

/// Converts Unicode to GB18030 bytes.
class Gb18030Encoder extends dart_convert.Converter<String, List<int>> {
  /// Creates a GB18030 encoder.
  const Gb18030Encoder({this.allowInvalid = false});

  /// Whether unmappable input is replaced with `?`.
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = <int>[];
    _Gb18030EncoderMachine(
      output,
      allowInvalid: allowInvalid,
    ).add(input.substring(start, usedEnd));
    return output;
  }

  @override
  dart_convert.StringConversionSink startChunkedConversion(
    Sink<List<int>> sink,
  ) {
    // The returned conversion sink owns and closes this adapter.
    // ignore: close_sinks
    final byteSink = sink is dart_convert.ByteConversionSink
        ? sink
        : dart_convert.ByteConversionSink.from(sink);
    return _Gb18030EncoderSink(byteSink, allowInvalid: allowInvalid);
  }
}

class _Gb18030DecoderMachine {
  _Gb18030DecoderMachine(this.output, {required this.allowInvalid});

  final StringSink output;
  final bool allowInvalid;

  int first = 0;
  int second = 0;
  int third = 0;

  void add(List<int> bytes, int start, int end) {
    final pending = <int>[];
    var sourceIndex = start;
    while (sourceIndex < end || pending.isNotEmpty) {
      final int byte;
      final int offset;
      if (pending.isNotEmpty) {
        byte = pending.removeAt(0);
        offset = sourceIndex;
      } else {
        byte = bytes[sourceIndex];
        offset = sourceIndex;
        sourceIndex++;
      }

      if (byte < 0 || byte > 0xFF) {
        _error(bytes, offset, 'Input is not an unsigned byte');
        continue;
      }

      if (third != 0) {
        if (byte >= 0x30 && byte <= 0x39) {
          final pointer = (first - 0x81) * 12600 +
              (second - 0x30) * 1260 +
              (third - 0x81) * 10 +
              byte -
              0x30;
          first = 0;
          second = 0;
          third = 0;
          final codePoint = _rangeCodePoint(pointer);
          if (codePoint == null) {
            _error(bytes, offset, 'Unmapped GB18030 four-byte sequence');
          } else {
            output.writeCharCode(codePoint);
          }
        } else {
          final restoreSecond = second;
          final restoreThird = third;
          first = 0;
          second = 0;
          third = 0;
          _error(bytes, offset, 'Invalid GB18030 fourth byte');
          pending.insertAll(0, <int>[restoreSecond, restoreThird, byte]);
        }
        continue;
      }

      if (second != 0) {
        if (byte >= 0x81 && byte <= 0xFE) {
          third = byte;
        } else {
          final restoreSecond = second;
          first = 0;
          second = 0;
          _error(bytes, offset, 'Invalid GB18030 third byte');
          pending.insertAll(0, <int>[restoreSecond, byte]);
        }
        continue;
      }

      if (first != 0) {
        final leading = first;
        first = 0;
        if (byte >= 0x30 && byte <= 0x39) {
          first = leading;
          second = byte;
          continue;
        }

        int? code;
        if ((byte >= 0x40 && byte <= 0x7E) || (byte >= 0x80 && byte <= 0xFE)) {
          code = (leading << 8) | byte;
        }
        final codePoint = code == null ? null : _decodeTwoByte(code);
        if (codePoint != null) {
          output.writeCharCode(codePoint);
        } else {
          _error(bytes, offset, 'Invalid GB18030 two-byte sequence');
          if (byte <= 0x7F) {
            pending.insert(0, byte);
          }
        }
        continue;
      }

      if (byte <= 0x7F) {
        output.writeCharCode(byte);
      } else if (byte == 0x80) {
        output.writeCharCode(0x20AC);
      } else if (byte >= 0x81 && byte <= 0xFE) {
        first = byte;
      } else {
        _error(bytes, offset, 'Invalid GB18030 byte');
      }
    }
  }

  void finish([List<int>? source, int? offset]) {
    if (first != 0 || second != 0 || third != 0) {
      first = 0;
      second = 0;
      third = 0;
      _error(source, offset, 'Incomplete GB18030 sequence');
    }
  }

  void _error(List<int>? source, int? offset, String message) {
    if (!allowInvalid) {
      throw FormatException(message, source, offset);
    }
    output.writeCharCode(0xFFFD);
  }
}

class _Gb18030DecoderSink extends dart_convert.ByteConversionSinkBase {
  _Gb18030DecoderSink(this.sink, {required bool allowInvalid})
      : buffer = StringBuffer() {
    machine = _Gb18030DecoderMachine(buffer, allowInvalid: allowInvalid);
  }

  final dart_convert.StringConversionSink sink;
  final StringBuffer buffer;
  late final _Gb18030DecoderMachine machine;
  bool closed = false;

  @override
  void add(List<int> chunk) => addSlice(chunk, 0, chunk.length, false);

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {
    if (closed) {
      throw StateError('Sink is closed');
    }
    RangeError.checkValidRange(start, end, chunk.length);
    machine.add(chunk, start, end);
    if (isLast) {
      close();
    } else {
      _flush(false);
    }
  }

  void _flush(bool isLast) {
    if (buffer.isNotEmpty) {
      final value = buffer.toString();
      buffer.clear();
      sink.addSlice(value, 0, value.length, isLast);
    } else if (isLast) {
      sink.close();
    }
  }

  @override
  void close() {
    if (closed) {
      return;
    }
    machine.finish();
    closed = true;
    _flush(true);
  }
}

/// GB18030-2005 Private Use mappings preserved by the WHATWG encoder.
int? _privateUseTwoByte(int codePoint) {
  switch (codePoint) {
    case 0xE78D:
      return 0xA6D9;
    case 0xE78E:
      return 0xA6DA;
    case 0xE78F:
      return 0xA6DB;
    case 0xE790:
      return 0xA6DC;
    case 0xE791:
      return 0xA6DD;
    case 0xE792:
      return 0xA6DE;
    case 0xE793:
      return 0xA6DF;
    case 0xE794:
      return 0xA6EC;
    case 0xE795:
      return 0xA6ED;
    case 0xE796:
      return 0xA6F3;
    case 0xE81E:
      return 0xFE59;
    case 0xE826:
      return 0xFE61;
    case 0xE82B:
      return 0xFE66;
    case 0xE82C:
      return 0xFE67;
    case 0xE832:
      return 0xFE6D;
    case 0xE843:
      return 0xFE7E;
    case 0xE854:
      return 0xFE90;
    case 0xE864:
      return 0xFEA0;
  }
  return null;
}

int? _decodeTwoByte(int code) =>
    _twoByteDecodeOverlay(code) ?? lookupGbkCodePoint(code);

int? _rangeCodePoint(int pointer) {
  if ((pointer > 39419 && pointer < 189000) || pointer > 1237575) {
    return null;
  }
  if (pointer == 7457) {
    return 0xE7C7;
  }
  final index = _lastLessThanOrEqual(_rangePointers, pointer);
  if (index < 0) {
    return null;
  }
  return _rangeCodePoints[index] + pointer - _rangePointers[index];
}

int? _rangePointer(int codePoint) {
  if (codePoint == 0xE7C7) {
    return 7457;
  }
  final index = _lastLessThanOrEqual(_rangeCodePoints, codePoint);
  if (index < 0) {
    return null;
  }
  return _rangePointers[index] + codePoint - _rangeCodePoints[index];
}

int _lastLessThanOrEqual(List<int> sorted, int value) {
  var low = 0;
  var high = sorted.length - 1;
  var result = -1;
  while (low <= high) {
    final middle = (low + high) >> 1;
    if (sorted[middle] <= value) {
      result = middle;
      low = middle + 1;
    } else {
      high = middle - 1;
    }
  }
  return result;
}

class _Gb18030EncoderMachine {
  _Gb18030EncoderMachine(this.output, {required this.allowInvalid});

  final List<int> output;
  final bool allowInvalid;

  void add(String input) {
    input.runes.forEach(_encode);
  }

  void _encode(int rune) {
    if (rune <= 0x7F) {
      output.add(rune);
      return;
    }
    if (rune == 0xE5E5 || rune > 0x10FFFF) {
      _unmappable(rune);
      return;
    }

    final privateUse = _privateUseTwoByte(rune);
    if (privateUse != null) {
      output
        ..add(privateUse >> 8)
        ..add(privateUse & 0xFF);
      return;
    }

    final twoByteCode = _twoByteEncodeOverlay(rune) ?? lookupGbkCode(rune);
    if (twoByteCode != null && _decodeTwoByte(twoByteCode) == rune) {
      output
        ..add(twoByteCode >> 8)
        ..add(twoByteCode & 0xFF);
      return;
    }

    var pointer = _rangePointer(rune);
    if (pointer == null) {
      _unmappable(rune);
      return;
    }
    final byte1 = pointer ~/ 12600;
    pointer %= 12600;
    final byte2 = pointer ~/ 1260;
    pointer %= 1260;
    final byte3 = pointer ~/ 10;
    final byte4 = pointer % 10;
    output
      ..add(byte1 + 0x81)
      ..add(byte2 + 0x30)
      ..add(byte3 + 0x81)
      ..add(byte4 + 0x30);
  }

  void _unmappable(int rune) {
    if (!allowInvalid) {
      throw FormatException(
        'Cannot encode U+${rune.toRadixString(16).toUpperCase()} as GB18030',
      );
    }
    output.add(0x3F);
  }
}

class _Gb18030EncoderSink with dart_convert.StringConversionSinkMixin {
  _Gb18030EncoderSink(this.sink, {required bool allowInvalid})
      : output = <int>[] {
    machine = _Gb18030EncoderMachine(output, allowInvalid: allowInvalid);
  }

  final dart_convert.ByteConversionSink sink;
  final List<int> output;
  late final _Gb18030EncoderMachine machine;
  int? pendingLeadSurrogate;
  bool closed = false;

  @override
  void addSlice(String input, int start, int end, bool isLast) {
    if (closed) {
      throw StateError('Sink is closed');
    }
    RangeError.checkValidRange(start, end, input.length);
    var value = input.substring(start, end);
    if (pendingLeadSurrogate != null) {
      value = String.fromCharCode(pendingLeadSurrogate!) + value;
      pendingLeadSurrogate = null;
    }
    if (!isLast &&
        value.isNotEmpty &&
        _isLeadingSurrogate(value.codeUnitAt(value.length - 1))) {
      pendingLeadSurrogate = value.codeUnitAt(value.length - 1);
      value = value.substring(0, value.length - 1);
    }
    if (value.isNotEmpty) {
      machine.add(value);
    }
    if (isLast) {
      close();
    } else {
      _flush(false);
    }
  }

  bool _isLeadingSurrogate(int codeUnit) =>
      codeUnit >= 0xD800 && codeUnit <= 0xDBFF;

  void _flush(bool isLast) {
    if (output.isNotEmpty) {
      final bytes = List<int>.from(output);
      output.clear();
      sink.addSlice(bytes, 0, bytes.length, isLast);
    } else if (isLast) {
      sink.close();
    }
  }

  @override
  void close() {
    if (closed) {
      return;
    }
    if (pendingLeadSurrogate != null) {
      machine.add(String.fromCharCode(pendingLeadSurrogate!));
      pendingLeadSurrogate = null;
    }
    closed = true;
    _flush(true);
  }
}
