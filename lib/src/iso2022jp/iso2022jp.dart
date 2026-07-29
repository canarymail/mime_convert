import 'dart:convert' as dart_convert;

import '../cjk/shift_jis.dart';

part 'table.dart';

/// Ready-to-use WHATWG ISO-2022-JP codec.
///
/// Invalid input is replaced with U+FFFD and unmappable output with `?`.
const Iso2022JpCodec iso2022Jp = Iso2022JpCodec(allowInvalid: true);

/// ISO-2022-JP as defined by the WHATWG Encoding Standard.
///
/// Unlike a lookup-only multibyte codec, ISO-2022-JP is stateful. Decoder and
/// encoder sinks retain escape and lead-byte state across chunk boundaries.
class Iso2022JpCodec extends dart_convert.Encoding {
  /// Creates an ISO-2022-JP codec.
  const Iso2022JpCodec({this.allowInvalid = false});

  /// Whether malformed input is replaced instead of throwing.
  final bool allowInvalid;

  @override
  String get name => 'iso-2022-jp';

  @override
  Iso2022JpDecoder get decoder => Iso2022JpDecoder(allowInvalid: allowInvalid);

  @override
  Iso2022JpEncoder get encoder => Iso2022JpEncoder(allowInvalid: allowInvalid);
}

/// Converts ISO-2022-JP bytes to Unicode.
class Iso2022JpDecoder extends dart_convert.Converter<List<int>, String> {
  /// Creates an ISO-2022-JP decoder.
  const Iso2022JpDecoder({this.allowInvalid = false});

  /// Whether malformed input is replaced with U+FFFD.
  final bool allowInvalid;

  @override
  String convert(List<int> input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = StringBuffer();
    _Iso2022JpDecoderMachine(
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
    return _Iso2022JpDecoderSink(stringSink, allowInvalid: allowInvalid);
  }
}

/// Converts Unicode to WHATWG ISO-2022-JP bytes.
class Iso2022JpEncoder extends dart_convert.Converter<String, List<int>> {
  /// Creates an ISO-2022-JP encoder.
  const Iso2022JpEncoder({this.allowInvalid = false});

  /// Whether unmappable input is replaced with `?`.
  final bool allowInvalid;

  @override
  List<int> convert(String input, [int start = 0, int? end]) {
    final usedEnd = RangeError.checkValidRange(start, end, input.length);
    final output = <int>[];
    _Iso2022JpEncoderMachine(
      output,
      allowInvalid: allowInvalid,
    )
      ..add(input.substring(start, usedEnd))
      ..finish();
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
    return _Iso2022JpEncoderSink(byteSink, allowInvalid: allowInvalid);
  }
}

enum _DecoderState {
  ascii,
  roman,
  katakana,
  leadingByte,
  trailingByte,
  escapeStart,
  escape,
}

class _Iso2022JpDecoderMachine {
  _Iso2022JpDecoderMachine(this.output, {required this.allowInvalid});

  final StringSink output;
  final bool allowInvalid;

  _DecoderState state = _DecoderState.ascii;
  _DecoderState outputState = _DecoderState.ascii;
  int leading = 0;
  bool escapeOutput = false;

  void add(List<int> bytes, int start, int end) {
    for (var index = start; index < end; index++) {
      final byte = bytes[index];
      if (byte < 0 || byte > 0xFF) {
        _error(bytes, index, 'Input is not an unsigned byte');
        continue;
      }
      _process(byte, bytes, index);
    }
  }

  void _process(int byte, List<int>? source, int offset) {
    switch (state) {
      case _DecoderState.ascii:
        if (byte == 0x1B) {
          state = _DecoderState.escapeStart;
        } else if (byte <= 0x7F && byte != 0x0E && byte != 0x0F) {
          escapeOutput = false;
          output.writeCharCode(byte);
        } else {
          escapeOutput = false;
          _error(source, offset, 'Invalid ISO-2022-JP ASCII byte');
        }
        return;
      case _DecoderState.roman:
        if (byte == 0x1B) {
          state = _DecoderState.escapeStart;
        } else if (byte == 0x5C) {
          escapeOutput = false;
          output.writeCharCode(0x00A5);
        } else if (byte == 0x7E) {
          escapeOutput = false;
          output.writeCharCode(0x203E);
        } else if (byte <= 0x7F && byte != 0x0E && byte != 0x0F) {
          escapeOutput = false;
          output.writeCharCode(byte);
        } else {
          escapeOutput = false;
          _error(source, offset, 'Invalid ISO-2022-JP Roman byte');
        }
        return;
      case _DecoderState.katakana:
        if (byte == 0x1B) {
          state = _DecoderState.escapeStart;
        } else if (byte >= 0x21 && byte <= 0x5F) {
          escapeOutput = false;
          output.writeCharCode(0xFF61 - 0x21 + byte);
        } else {
          escapeOutput = false;
          _error(source, offset, 'Invalid ISO-2022-JP katakana byte');
        }
        return;
      case _DecoderState.leadingByte:
        if (byte == 0x1B) {
          state = _DecoderState.escapeStart;
        } else if (byte >= 0x21 && byte <= 0x7E) {
          escapeOutput = false;
          leading = byte;
          state = _DecoderState.trailingByte;
        } else {
          escapeOutput = false;
          _error(source, offset, 'Invalid ISO-2022-JP leading byte');
        }
        return;
      case _DecoderState.trailingByte:
        if (byte == 0x1B) {
          state = _DecoderState.escapeStart;
          _error(source, offset, 'Incomplete ISO-2022-JP double byte');
        } else if (byte >= 0x21 && byte <= 0x7E) {
          state = _DecoderState.leadingByte;
          final pointer = (leading - 0x21) * 94 + byte - 0x21;
          final codePoint = lookupJis0208CodePoint(pointer);
          if (codePoint == null) {
            _error(source, offset, 'Unmapped ISO-2022-JP double byte');
          } else {
            output.writeCharCode(codePoint);
          }
        } else {
          state = _DecoderState.leadingByte;
          _error(source, offset, 'Invalid ISO-2022-JP trailing byte');
        }
        return;
      case _DecoderState.escapeStart:
        if (byte == 0x24 || byte == 0x28) {
          leading = byte;
          state = _DecoderState.escape;
        } else {
          escapeOutput = false;
          state = outputState;
          _error(source, offset, 'Invalid ISO-2022-JP escape');
          _process(byte, source, offset);
        }
        return;
      case _DecoderState.escape:
        final escapeLeading = leading;
        _DecoderState? nextState;
        if (escapeLeading == 0x28 && byte == 0x42) {
          nextState = _DecoderState.ascii;
        } else if (escapeLeading == 0x28 && byte == 0x4A) {
          nextState = _DecoderState.roman;
        } else if (escapeLeading == 0x28 && byte == 0x49) {
          nextState = _DecoderState.katakana;
        } else if (escapeLeading == 0x24 && (byte == 0x40 || byte == 0x42)) {
          nextState = _DecoderState.leadingByte;
        }

        if (nextState != null) {
          state = nextState;
          outputState = nextState;
          final consecutiveEscape = escapeOutput;
          escapeOutput = true;
          if (consecutiveEscape) {
            _error(source, offset, 'Consecutive ISO-2022-JP escapes');
          }
        } else {
          escapeOutput = false;
          state = outputState;
          _error(source, offset, 'Invalid ISO-2022-JP escape');
          _process(escapeLeading, source, offset);
          _process(byte, source, offset);
        }
        return;
    }
  }

  void finish([List<int>? source, int? offset]) {
    if (state == _DecoderState.trailingByte) {
      state = _DecoderState.leadingByte;
      _error(source, offset, 'Incomplete ISO-2022-JP double byte');
    } else if (state == _DecoderState.escapeStart) {
      state = outputState;
      _error(source, offset, 'Incomplete ISO-2022-JP escape');
    } else if (state == _DecoderState.escape) {
      final escapeLeading = leading;
      state = outputState;
      _error(source, offset, 'Incomplete ISO-2022-JP escape');
      _process(escapeLeading, source, offset ?? 0);
    }
  }

  void _error(List<int>? source, int? offset, String message) {
    if (!allowInvalid) {
      throw FormatException(message, source, offset);
    }
    output.writeCharCode(0xFFFD);
  }
}

class _Iso2022JpDecoderSink extends dart_convert.ByteConversionSinkBase {
  _Iso2022JpDecoderSink(this.sink, {required bool allowInvalid})
      : buffer = StringBuffer() {
    machine = _Iso2022JpDecoderMachine(buffer, allowInvalid: allowInvalid);
  }

  final dart_convert.StringConversionSink sink;
  final StringBuffer buffer;
  late final _Iso2022JpDecoderMachine machine;
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

enum _EncoderState { ascii, roman, jis0208 }

class _Iso2022JpEncoderMachine {
  _Iso2022JpEncoderMachine(this.output, {required this.allowInvalid});

  final List<int> output;
  final bool allowInvalid;
  _EncoderState state = _EncoderState.ascii;

  void add(String input) {
    input.runes.forEach(_encode);
  }

  void _encode(int originalRune) {
    var rune = originalRune;
    while (true) {
      if ((state == _EncoderState.ascii || state == _EncoderState.roman) &&
          (rune == 0x0E || rune == 0x0F || rune == 0x1B)) {
        _unmappable(originalRune);
        return;
      }

      if (state == _EncoderState.ascii && rune <= 0x7F) {
        output.add(rune);
        return;
      }

      if (state == _EncoderState.roman &&
          ((rune <= 0x7F && rune != 0x5C && rune != 0x7E) ||
              rune == 0x00A5 ||
              rune == 0x203E)) {
        output.add(rune == 0x00A5
            ? 0x5C
            : rune == 0x203E
                ? 0x7E
                : rune);
        return;
      }

      if (rune <= 0x7F && state != _EncoderState.ascii) {
        output.addAll(const <int>[0x1B, 0x28, 0x42]);
        state = _EncoderState.ascii;
        continue;
      }

      if ((rune == 0x00A5 || rune == 0x203E) && state != _EncoderState.roman) {
        output.addAll(const <int>[0x1B, 0x28, 0x4A]);
        state = _EncoderState.roman;
        continue;
      }

      if (rune == 0x2212) {
        rune = 0xFF0D;
      }
      if (rune >= 0xFF61 && rune <= 0xFF9F) {
        rune = _katakanaEncode[rune - 0xFF61];
      }

      final pointer = lookupJis0208Pointer(rune);
      if (pointer == null) {
        if (state == _EncoderState.jis0208) {
          output.addAll(const <int>[0x1B, 0x28, 0x42]);
          state = _EncoderState.ascii;
          continue;
        }
        _unmappable(originalRune);
        return;
      }

      if (state != _EncoderState.jis0208) {
        output.addAll(const <int>[0x1B, 0x24, 0x42]);
        state = _EncoderState.jis0208;
        continue;
      }
      output
        ..add(pointer ~/ 94 + 0x21)
        ..add(pointer % 94 + 0x21);
      return;
    }
  }

  void _unmappable(int rune) {
    if (!allowInvalid) {
      throw FormatException(
        'Cannot encode U+${rune.toRadixString(16).toUpperCase()} '
        'as ISO-2022-JP',
      );
    }
    output.add(0x3F);
  }

  void finish() {
    if (state != _EncoderState.ascii) {
      output.addAll(const <int>[0x1B, 0x28, 0x42]);
      state = _EncoderState.ascii;
    }
  }
}

class _Iso2022JpEncoderSink with dart_convert.StringConversionSinkMixin {
  _Iso2022JpEncoderSink(this.sink, {required bool allowInvalid})
      : output = <int>[] {
    machine = _Iso2022JpEncoderMachine(output, allowInvalid: allowInvalid);
  }

  final dart_convert.ByteConversionSink sink;
  final List<int> output;
  late final _Iso2022JpEncoderMachine machine;
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
    machine.finish();
    closed = true;
    _flush(true);
  }
}
