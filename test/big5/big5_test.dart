@TestOn('vm')
// ignore_for_file: cascade_invocations, close_sinks, lines_longer_than_80_chars

import 'dart:convert' as dart_convert;
import 'dart:io';

import 'package:mime_convert/mime_convert.dart';
import 'package:test/test.dart';

const _replacementCharacter = '\uFFFD';
const _encoderPointerFloor = (0xA1 - 0x81) * 157;
const _lastPointerCodePoints = <int>{
  0x2550,
  0x255E,
  0x2561,
  0x256A,
  0x5341,
  0x5345,
};

void main() {
  final index = _readWhatwgIndex();

  group('codec', () {
    test('keeps the public API stable', () {
      expect(big5, isA<Big5Codec>());
      expect(const Big5Codec().name, 'Big5');
      expect(const Big5Codec().encoder, isA<Big5Encoder>());
      expect(const Big5Codec().decoder, isA<Big5Decoder>());
    });

    test('propagates allowInvalid to both converters', () {
      expect(
        const Big5Codec(allowInvalid: true).decode(const <int>[0x80]),
        _replacementCharacter,
      );
      expect(
        const Big5Codec(allowInvalid: true).encode(_replacementCharacter),
        const <int>[0x3F],
      );
    });
  });

  group('WHATWG index', () {
    test('decodes every pointer in the authoritative index', () {
      final input = <int>[];
      final expected = StringBuffer();
      for (final entry in index) {
        input.addAll(_pointerBytes(entry.pointer));
        expected.writeCharCode(entry.codePoint);
      }

      expect(const Big5Decoder().convert(input), expected.toString());
    });

    test('encodes every representable code point to its canonical pointer', () {
      final canonical = _canonicalEncodeIndex(index);
      final input = String.fromCharCodes(canonical.keys);
      final expected = <int>[
        for (final pointer in canonical.values) ..._pointerBytes(pointer),
      ];

      expect(const Big5Encoder().convert(input), expected);
    });

    test('decodes the complete index across one-byte chunks', () {
      final input = <int>[];
      final expected = StringBuffer();
      for (final entry in index) {
        input.addAll(_pointerBytes(entry.pointer));
        expected.writeCharCode(entry.codePoint);
      }

      final collected = <String>[];
      final outputSink = _CollectSink<String>(collected);
      final conversionSink =
          const Big5Decoder().startChunkedConversion(outputSink);
      for (final byte in input) {
        conversionSink.add(<int>[byte]);
      }
      conversionSink.close();

      expect(collected.join(), expected.toString());
      expect(outputSink.isClosed, isTrue);
    });

    test('encodes the complete canonical index across UTF-16 chunks', () {
      final canonical = _canonicalEncodeIndex(index);
      final input = String.fromCharCodes(canonical.keys);
      final expected = <int>[
        for (final pointer in canonical.values) ..._pointerBytes(pointer),
      ];
      final collected = <List<int>>[];
      final outputSink = _CollectSink<List<int>>(collected);
      final conversionSink =
          const Big5Encoder().startChunkedConversion(outputSink);
      for (var index = 0; index < input.length; index++) {
        conversionSink.add(input.substring(index, index + 1));
      }
      conversionSink.close();

      expect(collected.expand((chunk) => chunk), expected);
      expect(outputSink.isClosed, isTrue);
    });
  });

  group('decoder', () {
    test('decodes ASCII and common CP950-compatible characters', () {
      final ascii = dart_convert.ascii.encode('hello world');
      expect(const Big5Decoder().convert(ascii), 'hello world');
      expect(const Big5Decoder().convert(const <int>[0xA4, 0x40]), '一');
    });

    test('decodes HKSCS extensions from the combined WHATWG index', () {
      // Pointer 942 is the first entry in index Big5 and maps to U+43F0.
      expect(const Big5Decoder().convert(const <int>[0x87, 0x40]), '\u43F0');

      final nonBmpEntry = index.firstWhere((entry) => entry.codePoint > 0xFFFF);
      expect(
        const Big5Decoder().convert(_pointerBytes(nonBmpEntry.pointer)),
        String.fromCharCode(nonBmpEntry.codePoint),
      );
    });

    test('handles the four two-code-point mappings', () {
      expect(
        const Big5Decoder().convert(const <int>[0x88, 0x62]),
        '\u00CA\u0304',
      );
      expect(
        const Big5Decoder().convert(const <int>[0x88, 0x64]),
        '\u00CA\u030C',
      );
      expect(
        const Big5Decoder().convert(const <int>[0x88, 0xA3]),
        '\u00EA\u0304',
      );
      expect(
        const Big5Decoder().convert(const <int>[0x88, 0xA5]),
        '\u00EA\u030C',
      );
    });

    test('restores an ASCII trail after an invalid lead sequence', () {
      expect(
        const Big5Decoder(allowInvalid: true).convert(const <int>[0x81, 0x20]),
        '$_replacementCharacter ',
      );
      expect(
        const Big5Decoder(allowInvalid: true).convert(const <int>[0x81, 0x40]),
        '$_replacementCharacter@',
      );
      expect(
        const Big5Decoder(allowInvalid: true).convert(const <int>[0x81, 0x7F]),
        '$_replacementCharacter\u007F',
      );
    });

    test('consumes a non-ASCII trail after an invalid lead sequence', () {
      expect(
        const Big5Decoder(allowInvalid: true)
            .convert(const <int>[0x81, 0x80, 0x41]),
        '${_replacementCharacter}A',
      );
    });

    test('replaces malformed and unfinished input only when allowed', () {
      for (final input in <List<int>>[
        <int>[0x80],
        <int>[0xFF],
        <int>[0x81],
        <int>[0x81, 0x40],
        <int>[-1],
        <int>[0x100],
      ]) {
        expect(
          () => const Big5Decoder().convert(input),
          throwsA(isA<FormatException>()),
          reason: 'strict input $input',
        );
      }

      expect(
        const Big5Decoder(allowInvalid: true)
            .convert(const <int>[0x80, 0xFF, -1, 0x100]),
        '$_replacementCharacter$_replacementCharacter'
        '$_replacementCharacter$_replacementCharacter',
      );
      expect(
        const Big5Decoder(allowInvalid: true).convert(const <int>[0x81]),
        _replacementCharacter,
      );
    });

    test('honors start and end without reading outside the slice', () {
      expect(
        const Big5Decoder().convert(const <int>[0x81, 0xA4, 0x40, 0x81], 1, 3),
        '一',
      );
      expect(
        () => const Big5Decoder().convert(const <int>[0x41, 0x81, 0x40], 1, 2),
        throwsA(isA<FormatException>()),
      );
    });

    test('preserves a lead byte across chunks', () {
      final collected = <String>[];
      final outputSink = _CollectSink<String>(collected);
      final conversionSink =
          const Big5Decoder().startChunkedConversion(outputSink);
      conversionSink.add(const <int>[0x41, 0xA4]);
      conversionSink.addSlice(const <int>[0x40, 0x42], 0, 2, true);

      expect(collected.join(), 'A一B');
      expect(outputSink.isClosed, isTrue);
    });

    test('applies ASCII restoration across chunks', () {
      final collected = <String>[];
      final conversionSink = const Big5Decoder(allowInvalid: true)
          .startChunkedConversion(_CollectSink<String>(collected));
      conversionSink.add(const <int>[0x81]);
      conversionSink.addSlice(const <int>[0x20], 0, 1, true);

      expect(collected.join(), '$_replacementCharacter ');
    });

    test('handles an unfinished final chunk according to allowInvalid', () {
      final strictSink = const Big5Decoder()
          .startChunkedConversion(_CollectSink<String>(<String>[]));
      strictSink.add(const <int>[0x81]);
      expect(strictSink.close, throwsA(isA<FormatException>()));

      final collected = <String>[];
      final permissiveSink = const Big5Decoder(allowInvalid: true)
          .startChunkedConversion(_CollectSink<String>(collected));
      permissiveSink.add(const <int>[0x81]);
      permissiveSink.close();
      expect(collected.join(), _replacementCharacter);
    });
  });

  group('encoder', () {
    test('encodes ASCII and common CP950-compatible characters', () {
      expect(
        const Big5Encoder().convert('hello world'),
        dart_convert.ascii.encode('hello world'),
      );
      expect(const Big5Encoder().convert('一'), const <int>[0xA4, 0x40]);
      expect(const Big5Encoder().convert('傳統'),
          const <int>[0xB6, 0xC7, 0xB2, 0xCE]);
    });

    test('uses the WHATWG last-pointer exceptions', () {
      final canonical = _canonicalEncodeIndex(index);
      for (final codePoint in _lastPointerCodePoints) {
        final matchingPointers = index
            .where((entry) => entry.codePoint == codePoint)
            .map((entry) => entry.pointer)
            .where((pointer) => pointer >= _encoderPointerFloor)
            .toList();
        expect(matchingPointers.length, greaterThan(1));
        final expectedPointer = matchingPointers.last;
        expect(canonical[codePoint], expectedPointer);
        expect(
          const Big5Encoder().convert(String.fromCharCode(codePoint)),
          _pointerBytes(expectedPointer),
        );
      }
    });

    test('does not encode low HKSCS pointers literally', () {
      // WHATWG encoder index lookup excludes pointers below 5024.
      expect(
        () => const Big5Encoder().convert('\u43F0'),
        throwsA(isA<FormatException>()),
      );
      expect(
        const Big5Encoder(allowInvalid: true).convert('\u43F0'),
        const <int>[0x3F],
      );
    });

    test('replaces unmappable characters only when allowed', () {
      expect(
        () => const Big5Encoder().convert(_replacementCharacter),
        throwsA(isA<FormatException>()),
      );
      final actual = const Big5Encoder(allowInvalid: true)
          .convert('錶$_replacementCharacter');
      expect(actual.last, 0x3F);
    });

    test('uses UTF-16 start and end positions', () {
      expect(
        const Big5Encoder().convert('x傳統y', 1, 3),
        const <int>[0xB6, 0xC7, 0xB2, 0xCE],
      );
    });

    test('preserves a surrogate pair across chunks', () {
      final canonical = _canonicalEncodeIndex(index);
      final entry = canonical.entries.firstWhere((entry) => entry.key > 0xFFFF);
      final character = String.fromCharCode(entry.key);
      final collected = <List<int>>[];
      final outputSink = _CollectSink<List<int>>(collected);
      final conversionSink =
          const Big5Encoder().startChunkedConversion(outputSink);
      conversionSink.add(character.substring(0, 1));
      conversionSink.addSlice(character, 1, 2, true);

      expect(collected.expand((chunk) => chunk), _pointerBytes(entry.value));
      expect(outputSink.isClosed, isTrue);
    });

    test('handles an unfinished surrogate according to allowInvalid', () {
      const highSurrogate = '\uD840';
      final strictSink = const Big5Encoder()
          .startChunkedConversion(_CollectSink<List<int>>(<List<int>>[]));
      strictSink.add(highSurrogate);
      expect(strictSink.close, throwsA(isA<FormatException>()));

      final collected = <List<int>>[];
      final permissiveSink = const Big5Encoder(allowInvalid: true)
          .startChunkedConversion(_CollectSink<List<int>>(collected));
      permissiveSink.add(highSurrogate);
      permissiveSink.close();
      expect(collected.expand((chunk) => chunk), const <int>[0x3F]);
    });
  });
}

List<_IndexEntry> _readWhatwgIndex() {
  final candidates = <File>[
    File('tool/data/index-big5.txt'),
    File('packages/mime_convert/tool/data/index-big5.txt'),
  ];
  final source = candidates.firstWhere(
    (candidate) => candidate.existsSync(),
    orElse: () => throw StateError('Cannot find vendored WHATWG index Big5'),
  );
  return <_IndexEntry>[
    for (final line in source.readAsLinesSync())
      if (line.isNotEmpty && !line.startsWith('#')) _parseIndexLine(line),
  ];
}

_IndexEntry _parseIndexLine(String line) {
  final fields = line.split('\t');
  return _IndexEntry(
    int.parse(fields[0].trim()),
    int.parse(fields[1].substring(2), radix: 16),
  );
}

Map<int, int> _canonicalEncodeIndex(List<_IndexEntry> index) {
  final result = <int, int>{};
  for (final entry in index) {
    if (entry.pointer < _encoderPointerFloor) {
      continue;
    }
    if (_lastPointerCodePoints.contains(entry.codePoint)) {
      result[entry.codePoint] = entry.pointer;
    } else {
      result.putIfAbsent(entry.codePoint, () => entry.pointer);
    }
  }
  return result;
}

List<int> _pointerBytes(int pointer) {
  final leading = pointer ~/ 157 + 0x81;
  final trailing = pointer % 157;
  final offset = trailing < 0x3F ? 0x40 : 0x62;
  return <int>[leading, trailing + offset];
}

class _IndexEntry {
  const _IndexEntry(this.pointer, this.codePoint);

  final int pointer;
  final int codePoint;
}

class _CollectSink<T> implements Sink<T> {
  _CollectSink(this.values);

  final List<T> values;
  bool isClosed = false;

  @override
  void add(T value) {
    if (isClosed) {
      throw StateError('Cannot add to a closed test sink');
    }
    values.add(value);
  }

  @override
  void close() {
    isClosed = true;
  }
}
