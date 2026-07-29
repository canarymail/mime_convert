import 'package:mime_convert/iso2022jp.dart';
import 'package:test/test.dart';

void main() {
  group('ISO-2022-JP WHATWG codec', () {
    test('matches Python for ordinary JIS X 0208 text', () {
      // Python 3: '日本語'.encode('iso2022_jp')
      const expected = <int>[
        0x1B,
        0x24,
        0x42,
        0x46,
        0x7C,
        0x4B,
        0x5C,
        0x38,
        0x6C,
        0x1B,
        0x28,
        0x42,
      ];

      expect(iso2022Jp.encode('日本語'), expected);
      expect(iso2022Jp.decode(expected), '日本語');
    });

    test('handles ASCII, Roman, katakana, and JIS 1978 escapes', () {
      expect(
        iso2022Jp.decode(<int>[0x1B, 0x28, 0x4A, 0x5C, 0x7E]),
        '¥‾',
      );
      expect(
        iso2022Jp.decode(
          <int>[0x1B, 0x28, 0x49, 0x31, 0x32, 0x33, 0x34, 0x35],
        ),
        'ｱｲｳｴｵ',
      );
      expect(
        iso2022Jp.decode(
          <int>[0x1B, 0x24, 0x40, 0x46, 0x7C, 0x4B, 0x5C],
        ),
        '日本',
      );
    });

    test('encoder implements WHATWG Roman and compatibility mappings', () {
      expect(
        iso2022Jp.encode('¥‾'),
        <int>[0x1B, 0x28, 0x4A, 0x5C, 0x7E, 0x1B, 0x28, 0x42],
      );
      // WHATWG maps U+2212 to U+FF0D before looking in index jis0208.
      expect(
        iso2022Jp.encode('−'),
        <int>[0x1B, 0x24, 0x42, 0x21, 0x5D, 0x1B, 0x28, 0x42],
      );
      // Half-width katakana is normalized through the standard's dedicated
      // encoder index. ISO-2022-JP encoding is therefore intentionally lossy.
      expect(iso2022Jp.decode(iso2022Jp.encode('ｱｲｳｴｵ')), 'アイウエオ');
    });

    test('matches WHATWG malformed escape and lead-byte behavior', () {
      final vectors = <List<int>, String>{
        <int>[0x1B, 0x24, 0x42, 0x46]: '�',
        <int>[0x1B, 0x24, 0x42, 0x46, 0x1B]: '��',
        <int>[0x1B, 0x24, 0x42, 0x46, 0x20]: '�',
        <int>[0x1B, 0x24, 0x42, 0x46, 0x1B, 0x28, 0x42]: '�',
        <int>[0x1B, 0x28, 0x42, 0x1B, 0x28, 0x42, 0x41]: '�A',
        <int>[0x1B, 0x28, 0x58, 0x41]: '�(XA',
        <int>[0x0E, 0x41]: '�A',
        // End-of-queue restores the pending '$' before reporting the escape
        // error, so the restored byte is then decoded in the output state.
        <int>[0x1B, 0x24]: '�\$',
      };

      for (final vector in vectors.entries) {
        expect(iso2022Jp.decode(vector.key), vector.value);
      }
    });

    test('strict decoder and encoder surface malformed input', () {
      const strict = Iso2022JpCodec();

      expect(
        () => strict.decode(<int>[0x1B, 0x24]),
        throwsFormatException,
      );
      expect(() => strict.encode('😀'), throwsFormatException);
      expect(() => strict.encode('\u001B'), throwsFormatException);
    });

    test('chunked decoder retains every state across byte boundaries',
        () async {
      const input = <int>[
        0x41,
        0x1B,
        0x28,
        0x4A,
        0x5C,
        0x1B,
        0x24,
        0x42,
        0x46,
        0x7C,
        0x1B,
        0x28,
        0x42,
        0x42,
      ];
      final chunks = input.map((byte) => <int>[byte]);

      final actual =
          await iso2022Jp.decoder.bind(Stream.fromIterable(chunks)).join();

      expect(actual, 'A¥日B');
    });

    test('chunked encoder retains shifts and split surrogate pairs', () async {
      final chunks = <String>['A日', '本\uD83D', '\uDE00B'];

      final encodedChunks =
          await iso2022Jp.encoder.bind(Stream.fromIterable(chunks)).toList();
      final encoded = encodedChunks.expand((chunk) => chunk).toList();

      expect(iso2022Jp.decode(encoded), 'A日本?B');
      expect(
        encoded.sublist(encoded.length - 5),
        <int>[0x1B, 0x28, 0x42, 0x3F, 0x42],
      );
    });

    test('exhaustively covers all 94 by 94 decoder pointers', () {
      final input = <int>[0x1B, 0x24, 0x42];
      for (var pointer = 0; pointer < 94 * 94; pointer++) {
        input
          ..add(pointer ~/ 94 + 0x21)
          ..add(pointer % 94 + 0x21);
      }
      input.addAll(<int>[0x1B, 0x28, 0x42]);

      final runes = iso2022Jp.decode(input).runes.toList();
      final mapped = runes.where((rune) => rune != 0xFFFD).toList();

      // Pinned WHATWG index-jis0208.txt aggregate. This detects omissions,
      // additions, and mapping changes without checking in a second table.
      expect(runes.length, 8836);
      expect(mapped.length, 7336);
      expect(mapped.fold<int>(0, (sum, rune) => sum + rune), 211671756);

      final text = String.fromCharCodes(mapped);
      expect(iso2022Jp.decode(iso2022Jp.encode(text)), text);

      final firstPointer = <int, int>{};
      for (var pointer = 0; pointer < runes.length; pointer++) {
        final rune = runes[pointer];
        if (rune != 0xFFFD) {
          firstPointer.putIfAbsent(rune, () => pointer);
        }
      }
      final expectedEncoding = <int>[0x1B, 0x24, 0x42];
      for (final rune in mapped) {
        final pointer = firstPointer[rune]!;
        expectedEncoding
          ..add(pointer ~/ 94 + 0x21)
          ..add(pointer % 94 + 0x21);
      }
      expectedEncoding.addAll(<int>[0x1B, 0x28, 0x42]);
      expect(iso2022Jp.encode(text), expectedEncoding);
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}
