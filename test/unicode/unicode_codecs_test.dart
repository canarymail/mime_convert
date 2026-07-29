import 'dart:async';

import 'package:mime_convert/unicode.dart';
import 'package:test/test.dart';

void main() {
  const sample = 'A\u20ac\u{1f600}';

  group('UTF-16', () {
    const codec = Utf16Codec();

    test('sniffs and consumes either BOM', () {
      expect(codec.decode(<int>[0xfe, 0xff, 0x00, 0x41]), 'A');
      expect(codec.decode(<int>[0xff, 0xfe, 0x41, 0x00]), 'A');
    });

    test('defaults to little-endian without a BOM', () {
      expect(codec.decode(<int>[0x41, 0x00]), 'A');
    });

    test('encoder emits one little-endian BOM', () {
      expect(codec.encode('A'), <int>[0xff, 0xfe, 0x41, 0x00]);
    });

    test('chunked decoder recognizes a split BOM', () async {
      final decoded = await Stream<List<int>>.fromIterable(
        const <List<int>>[
          <int>[0xfe],
          <int>[0xff, 0x00],
          <int>[0x41],
        ],
      ).transform(const Utf16Decoder()).join();
      expect(decoded, 'A');
    });

    test('chunked encoder emits exactly one BOM', () async {
      final chunks = await Stream<String>.fromIterable(
        const <String>['A', 'B'],
      ).transform(const Utf16Encoder()).toList();
      expect(
        chunks.expand((chunk) => chunk),
        <int>[0xff, 0xfe, 0x41, 0x00, 0x42, 0x00],
      );
    });
  });

  group('UTF-16LE', () {
    const codec = Utf16LeCodec();

    test('encodes and decodes BMP and supplementary scalars', () {
      const bytes = <int>[
        0x41,
        0x00,
        0xac,
        0x20,
        0x3d,
        0xd8,
        0x00,
        0xde,
      ];
      expect(codec.encode(sample), bytes);
      expect(codec.decode(bytes), sample);
    });

    test('does not add or consume a BOM', () {
      expect(codec.encode('\ufeffA'), <int>[0xff, 0xfe, 0x41, 0x00]);
      expect(codec.decode(<int>[0xff, 0xfe, 0x41, 0x00]), '\ufeffA');
    });

    test('BOM-aware mode consumes and honors either BOM', () {
      const bomAware = Utf16LeCodec(bomAware: true);
      expect(bomAware.decode(<int>[0xff, 0xfe, 0x41, 0x00]), 'A');
      expect(bomAware.decode(<int>[0xfe, 0xff, 0x00, 0x41]), 'A');
    });
  });

  group('UTF-16BE', () {
    const codec = Utf16BeCodec();

    test('encodes and decodes BMP and supplementary scalars', () {
      const bytes = <int>[
        0x00,
        0x41,
        0x20,
        0xac,
        0xd8,
        0x3d,
        0xde,
        0x00,
      ];
      expect(codec.encode(sample), bytes);
      expect(codec.decode(bytes), sample);
    });

    test('does not add or consume a BOM', () {
      expect(codec.encode('\ufeffA'), <int>[0xfe, 0xff, 0x00, 0x41]);
      expect(codec.decode(<int>[0xfe, 0xff, 0x00, 0x41]), '\ufeffA');
    });

    test('BOM-aware mode consumes and honors either BOM', () {
      const bomAware = Utf16BeCodec(bomAware: true);
      expect(bomAware.decode(<int>[0xfe, 0xff, 0x00, 0x41]), 'A');
      expect(bomAware.decode(<int>[0xff, 0xfe, 0x41, 0x00]), 'A');
    });
  });

  group('UTF-16 malformed input', () {
    test('strict codecs reject odd bytes and unpaired surrogates', () {
      expect(
        () => const Utf16LeCodec().decode(<int>[0x41]),
        throwsFormatException,
      );
      expect(
        () => const Utf16LeCodec().decode(<int>[0x00, 0xd8]),
        throwsFormatException,
      );
      expect(
        () => const Utf16BeCodec().decode(<int>[0xdc, 0x00]),
        throwsFormatException,
      );
      expect(
        () => const Utf16LeCodec().encode(String.fromCharCode(0xd800)),
        throwsFormatException,
      );
    });

    test('lenient codecs replace each malformed value', () {
      expect(
        const Utf16LeCodec(allowInvalid: true)
            .decode(<int>[0x00, 0xd8, 0x41, 0x00, 0xff]),
        '\ufffdA\ufffd',
      );
      expect(
        const Utf16BeCodec(allowInvalid: true).decode(<int>[0xdc, 0x00]),
        '\ufffd',
      );
      expect(
        const Utf16LeCodec(allowInvalid: true)
            .encode(String.fromCharCode(0xd800)),
        <int>[0xfd, 0xff],
      );
    });

    test('out-of-range values honor allowInvalid', () {
      expect(
        () => const Utf16LeCodec().decode(<int>[256]),
        throwsFormatException,
      );
      expect(
        const Utf16LeCodec(allowInvalid: true).decode(<int>[256]),
        '\ufffd',
      );
    });
  });

  group('UTF-16 chunked conversion', () {
    test('decoder preserves byte and surrogate state across chunks', () async {
      final decoded = await Stream<List<int>>.fromIterable(
        const <List<int>>[
          <int>[0x41],
          <int>[0x00, 0x3d, 0xd8],
          <int>[0x00],
          <int>[0xde],
        ],
      ).transform(const Utf16LeDecoder()).join();
      expect(decoded, 'A\u{1f600}');
    });

    test('encoder preserves a split surrogate pair', () async {
      final chunks = await Stream<String>.fromIterable(
        <String>[
          String.fromCharCode(0xd83d),
          String.fromCharCode(0xde00),
        ],
      ).transform(const Utf16BeEncoder()).toList();
      expect(
        chunks.expand((chunk) => chunk),
        <int>[0xd8, 0x3d, 0xde, 0x00],
      );
    });
  });

  group('UTF-8-SIG', () {
    test('encoder always emits a signature', () {
      expect(const Utf8SigCodec().encode(''), <int>[0xef, 0xbb, 0xbf]);
      expect(
        const Utf8SigCodec().encode('A\u20ac'),
        <int>[0xef, 0xbb, 0xbf, 0x41, 0xe2, 0x82, 0xac],
      );
    });

    test('decoder consumes only one leading signature', () {
      const codec = Utf8SigCodec();
      expect(codec.decode(<int>[0xef, 0xbb, 0xbf, 0x41]), 'A');
      expect(codec.decode(<int>[0x41, 0xef, 0xbb, 0xbf]), 'A\ufeff');
      expect(
        codec.decode(<int>[0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf]),
        '\ufeff',
      );
    });

    test('malformed UTF-8 honors allowInvalid', () {
      expect(
        () => const Utf8SigCodec().decode(<int>[0xef, 0xbb, 0xbf, 0xff]),
        throwsFormatException,
      );
      expect(
        const Utf8SigCodec(allowInvalid: true)
            .decode(<int>[0xef, 0xbb, 0xbf, 0xff]),
        '\ufffd',
      );
      expect(
        () => const Utf8SigCodec().encode(String.fromCharCode(0xd800)),
        throwsFormatException,
      );
      expect(
        const Utf8SigCodec(
          allowInvalid: true,
        ).encode(String.fromCharCode(0xd800)),
        <int>[0xef, 0xbb, 0xbf, 0xef, 0xbf, 0xbd],
      );
    });

    test('chunked decoder recognizes a signature split three ways', () async {
      final decoded = await Stream<List<int>>.fromIterable(
        const <List<int>>[
          <int>[0xef],
          <int>[0xbb],
          <int>[0xbf, 0x41],
        ],
      ).transform(const Utf8SigDecoder()).join();
      expect(decoded, 'A');
    });

    test('chunked encoder emits exactly one signature', () async {
      final chunks = await Stream<String>.fromIterable(
        const <String>['A', '\u20ac'],
      ).transform(const Utf8SigEncoder()).toList();
      expect(
        chunks.expand((chunk) => chunk),
        <int>[0xef, 0xbb, 0xbf, 0x41, 0xe2, 0x82, 0xac],
      );
    });

    test('chunked encoder preserves a split surrogate pair', () async {
      final chunks = await Stream<String>.fromIterable(
        <String>[
          String.fromCharCode(0xd83d),
          String.fromCharCode(0xde00),
        ],
      ).transform(const Utf8SigEncoder()).toList();
      expect(
        chunks.expand((chunk) => chunk),
        <int>[0xef, 0xbb, 0xbf, 0xf0, 0x9f, 0x98, 0x80],
      );
    });
  });
}
