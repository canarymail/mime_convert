import 'package:mime_convert/gb18030.dart';
import 'package:test/test.dart';

void main() {
  group('GB18030 WHATWG codec', () {
    test('matches Python GB18030 vectors', () {
      final vectors = <String, List<int>>{
        '中文': <int>[0xD6, 0xD0, 0xCE, 0xC4],
        '𠀀': <int>[0x95, 0x32, 0x82, 0x36],
        '😀': <int>[0x94, 0x39, 0xFC, 0x36],
        '€': <int>[0xA2, 0xE3],
        '\u{10FFFF}': <int>[0xE3, 0x32, 0x9A, 0x35],
      };

      for (final vector in vectors.entries) {
        expect(gb18030.encode(vector.key), vector.value);
        expect(gb18030.decode(vector.value), vector.key);
      }
    });

    test('implements WHATWG single-byte Euro and GB18030-2022 behavior', () {
      expect(gb18030.decode(<int>[0x80]), '€');
      expect(gb18030.decode(<int>[0xA3, 0xA0]), '\u3000');

      // WHATWG deliberately rejects U+E5E5 because A3 A0 decodes to U+3000.
      expect(
        () => const Gb18030Codec().encode('\uE5E5'),
        throwsFormatException,
      );
      expect(gb18030.encode('\uE5E5'), <int>[0x3F]);

      // Compatibility mappings retained from GB18030-2005.
      expect(gb18030.encode('\uE78D'), <int>[0xA6, 0xD9]);
      expect(gb18030.encode('\uE864'), <int>[0xFE, 0xA0]);
      expect(gb18030.decode(gb18030.encode('\uE78D')), '\uFE10');
    });

    test('decodes all four-byte range boundaries', () {
      final vectors = <int, int?>{
        0: 0x0080,
        35: 0x00A3,
        36: 0x00A5,
        7456: 0x1E3E,
        7457: 0xE7C7,
        7458: 0x1E40,
        39419: 0xFFFF,
        39420: null,
        188999: null,
        189000: 0x10000,
        1237575: 0x10FFFF,
        1237576: null,
      };

      for (final vector in vectors.entries) {
        final actual = gb18030.decode(_bytesForPointer(vector.key));
        expect(
          actual,
          vector.value == null ? '�' : String.fromCharCode(vector.value!),
          reason: 'pointer ${vector.key}',
        );
      }
    });

    test('matches WHATWG malformed sequence recovery', () {
      final vectors = <List<int>, String>{
        <int>[0x81]: '�',
        <int>[0x81, 0x30]: '�',
        <int>[0x81, 0x30, 0x81]: '�',
        <int>[0x81, 0x30, 0x81, 0x20]: '�0� ',
        <int>[0x81, 0x20]: '� ',
        <int>[0x81, 0x7F]: '�\u007F',
        <int>[0xFF]: '�',
      };

      for (final vector in vectors.entries) {
        expect(gb18030.decode(vector.key), vector.value);
      }
    });

    test('strict decoder rejects malformed and truncated sequences', () {
      const strict = Gb18030Codec();

      expect(() => strict.decode(<int>[0x81]), throwsFormatException);
      expect(
        () => strict.decode(<int>[0x81, 0x30, 0x81, 0x20]),
        throwsFormatException,
      );
      expect(() => strict.decode(<int>[256]), throwsFormatException);
    });

    test('chunked decoder retains all four bytes across boundaries', () async {
      const input = <int>[
        0x41,
        0x94,
        0x39,
        0xFC,
        0x36,
        0xD6,
        0xD0,
        0x42,
      ];
      final chunks = input.map((byte) => <int>[byte]);

      final actual =
          await gb18030.decoder.bind(Stream.fromIterable(chunks)).join();

      expect(actual, 'A😀中B');
    });

    test('chunked encoder retains split surrogate pairs', () async {
      final chunks = <String>['A\uD83D', '\uDE00中'];

      final encodedChunks =
          await gb18030.encoder.bind(Stream.fromIterable(chunks)).toList();
      final encoded = encodedChunks.expand((chunk) => chunk).toList();

      expect(encoded, <int>[0x41, 0x94, 0x39, 0xFC, 0x36, 0xD6, 0xD0]);
    });

    test('exhaustively covers the complete WHATWG two-byte index', () {
      final input = <int>[];
      for (var lead = 0x81; lead <= 0xFE; lead++) {
        for (var trail = 0x40; trail <= 0xFE; trail++) {
          if (trail == 0x7F) {
            continue;
          }
          input
            ..add(lead)
            ..add(trail);
        }
      }

      final runes = gb18030.decode(input).runes.toList();

      // Pinned WHATWG index-gb18030.txt aggregates. Every possible two-byte
      // pointer is mapped in the current index.
      expect(runes.length, 23940);
      expect(runes.fold<int>(0, (sum, rune) => sum + rune), 775028624);
      var weighted = 0;
      for (var pointer = 0; pointer < runes.length; pointer++) {
        weighted += (pointer + 1) * runes[pointer];
      }
      expect(weighted, 9982382016702);

      final firstCode = <int, List<int>>{};
      for (var pointer = 0; pointer < runes.length; pointer++) {
        final trailing = pointer % 190;
        firstCode.putIfAbsent(
          runes[pointer],
          () => <int>[
            pointer ~/ 190 + 0x81,
            trailing + (trailing < 0x3F ? 0x40 : 0x41),
          ],
        );
      }
      final expectedEncoding = <int>[];
      for (final rune in runes) {
        expectedEncoding.addAll(firstCode[rune]!);
      }
      expect(gb18030.encode(String.fromCharCodes(runes)), expectedEncoding);
    }, timeout: const Timeout(Duration(minutes: 2)));

    test('round-trips every Unicode scalar value WHATWG can round-trip', () {
      const asymmetric = <int>{
        0xE5E5,
        0xE78D,
        0xE78E,
        0xE78F,
        0xE790,
        0xE791,
        0xE792,
        0xE793,
        0xE794,
        0xE795,
        0xE796,
        0xE81E,
        0xE826,
        0xE82B,
        0xE82C,
        0xE832,
        0xE843,
        0xE854,
        0xE864,
      };
      final batch = <int>[];

      void verifyBatch() {
        if (batch.isEmpty) {
          return;
        }
        final text = String.fromCharCodes(batch);
        expect(gb18030.decode(gb18030.encode(text)), text);
        batch.clear();
      }

      for (var codePoint = 0; codePoint <= 0x10FFFF; codePoint++) {
        if (codePoint >= 0xD800 && codePoint <= 0xDFFF ||
            asymmetric.contains(codePoint)) {
          continue;
        }
        batch.add(codePoint);
        if (batch.length == 4096) {
          verifyBatch();
        }
      }
      verifyBatch();
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}

List<int> _bytesForPointer(int pointer) {
  var value = pointer;
  final byte1 = value ~/ 12600;
  value %= 12600;
  final byte2 = value ~/ 1260;
  value %= 1260;
  final byte3 = value ~/ 10;
  final byte4 = value % 10;
  return <int>[byte1 + 0x81, byte2 + 0x30, byte3 + 0x81, byte4 + 0x30];
}
