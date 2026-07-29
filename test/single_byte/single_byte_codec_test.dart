import 'dart:async';

import 'package:mime_convert/single_byte.dart';
import 'package:test/test.dart';

void main() {
  group('generated Python single-byte codecs', () {
    test('inventory has 39 high-half and 8 full tables', () {
      expect(generatedSingleByteCodecs, hasLength(47));
      final tableLengths = generatedSingleByteCodecs
          .map((codec) => codec.decoder.decodingTable.length)
          .toList();
      expect(tableLengths.where((length) => length == 128), hasLength(39));
      expect(tableLengths.where((length) => length == 256), hasLength(8));
    });

    test('every defined mapping round-trips through its canonical byte', () {
      for (final codec in generatedSingleByteCodecs) {
        final decoder = codec.decoder;
        final table = decoder.decodingTable;
        final tableOffset = table.length == 128 ? 0x80 : 0;
        for (var index = 0; index < table.length; index++) {
          final codePoint = table.codeUnitAt(index);
          if (codePoint == 0xffff) {
            continue;
          }
          final decoded = decoder.convert(<int>[index + tableOffset]);
          expect(
            decoded.runes.single,
            codePoint,
            reason: '${codec.name} byte 0x'
                '${(index + tableOffset).toRadixString(16)}',
          );
          final canonicalByte = codec.encoder.convert(decoded).single;
          expect(
            decoder.convert(<int>[canonicalByte]),
            decoded,
            reason: '${codec.name} canonical U+'
                '${codePoint.toRadixString(16)}',
          );
        }
      }
    });

    test('representative mappings match Python stdlib fixtures', () {
      const fixtures = <String, List<int>>{
        'cp037': <int>[0x80, 0xd8],
        'cp1006': <int>[0xa1, 0x6f0],
        'cp1026': <int>[0x80, 0xd8],
        'cp1125': <int>[0x80, 0x410],
        'cp1140': <int>[0x9f, 0x20ac],
        'cp1255': <int>[0x80, 0x20ac],
        'cp1257': <int>[0x80, 0x20ac],
        'cp1258': <int>[0x80, 0x20ac],
        'cp273': <int>[0x80, 0xd8],
        'cp424': <int>[0x81, 0x61],
        'cp437': <int>[0x80, 0xc7],
        'cp500': <int>[0x80, 0xd8],
        'cp720': <int>[0x82, 0xe9],
        'cp737': <int>[0x80, 0x391],
        'cp775': <int>[0x80, 0x106],
        'cp852': <int>[0x80, 0xc7],
        'cp855': <int>[0x80, 0x452],
        'cp856': <int>[0x80, 0x5d0],
        'cp857': <int>[0x80, 0xc7],
        'cp858': <int>[0xd5, 0x20ac],
        'cp860': <int>[0x80, 0xc7],
        'cp861': <int>[0x80, 0xc7],
        'cp862': <int>[0x80, 0x5d0],
        'cp863': <int>[0x80, 0xc7],
        'cp864': <int>[0x80, 0xb0],
        'cp865': <int>[0x80, 0xc7],
        'cp866': <int>[0x80, 0x410],
        'cp869': <int>[0x86, 0x386],
        'cp874': <int>[0x80, 0x20ac],
        'cp875': <int>[0x80, 0x385],
        'hp-roman8': <int>[0xa1, 0xc0],
        'iso-8859-1': <int>[0xa3, 0xa3],
        'koi8-t': <int>[0x80, 0x49b],
        'kz1048': <int>[0x80, 0x402],
        'mac-arabic': <int>[0x80, 0xc4],
        'mac-croatian': <int>[0x80, 0xc4],
        'mac-cyrillic': <int>[0x80, 0x410],
        'mac-farsi': <int>[0x80, 0xc4],
        'mac-greek': <int>[0x80, 0xc4],
        'mac-iceland': <int>[0x80, 0xc4],
        'mac-latin2': <int>[0x80, 0xc4],
        'mac-roman': <int>[0x80, 0xc4],
        'mac-romanian': <int>[0x80, 0xc4],
        'mac-turkish': <int>[0x80, 0xc4],
        'palmos': <int>[0x80, 0x20ac],
        'ptcp154': <int>[0x80, 0x496],
        'tis-620': <int>[0xa1, 0xe01],
      };

      for (final codec in generatedSingleByteCodecs) {
        final fixture = fixtures[codec.name]!;
        expect(
          codec.decode(<int>[fixture[0]]).runes.single,
          fixture[1],
          reason: codec.name,
        );
      }
    });

    test('undefined bytes honor allowInvalid', () {
      for (final codec in generatedSingleByteCodecs) {
        final decoder = codec.decoder;
        final undefinedIndex = decoder.decodingTable.indexOf('\uffff');
        if (undefinedIndex < 0) {
          continue;
        }
        final byte =
            undefinedIndex + (decoder.decodingTable.length == 128 ? 0x80 : 0);
        expect(
          () => decoder.convert(<int>[byte]),
          throwsFormatException,
          reason: codec.name,
        );
        final lenient = SingleByteDecoder(
          decoder.decodingTable,
          asciiCompatible: decoder.asciiCompatible,
          allowInvalid: true,
        );
        expect(lenient.convert(<int>[byte]), '\ufffd', reason: codec.name);
      }
    });

    test('out-of-range bytes honor allowInvalid', () {
      const strict = Cp1255Codec();
      const lenient = Cp1255Codec(allowInvalid: true);
      expect(() => strict.decode(<int>[-1]), throwsFormatException);
      expect(() => strict.decode(<int>[256]), throwsFormatException);
      expect(lenient.decode(<int>[-1, 256]), '\ufffd\ufffd');
    });

    test('unencodable input uses the charset question-mark byte', () {
      expect(
        const Cp037Codec(allowInvalid: true).encode('\u{1f600}'),
        <int>[0x6f],
      );
      expect(
        const Cp037Codec(allowInvalid: true).decode(<int>[0x6f]),
        '?',
      );
      expect(
        () => const Cp037Codec().encode('\u{1f600}'),
        throwsFormatException,
      );
    });

    test('duplicate decoder mappings use Python canonical encoder choices', () {
      expect(const Cp1006Codec().encode('\ufe8e'), <int>[0xb2]);
      expect(const Cp875Codec().encode('\u001a'), <int>[0xfd]);
      expect(const MacArabicCodec().encode(' '), <int>[0xa0]);
      expect(const MacFarsiCodec().encode('!'), <int>[0xa1]);
    });

    test('generated lookup covers Python names and rejects unknown names', () {
      for (final codec in generatedSingleByteCodecs) {
        final pythonName = codec.name == 'iso-8859-1'
            ? 'iso8859_1'
            : codec.name.replaceAll('-', '_');
        final found = generatedSingleByteCodec(pythonName);
        expect(found, isNotNull, reason: pythonName);
        expect(found!.name, codec.name);
      }
      expect(generatedSingleByteCodec('x_user_defined'), isNull);
    });

    test('chunked conversion preserves split scalar input', () async {
      const codec = Cp1255Codec(allowInvalid: true);
      final decoded = await Stream<List<int>>.fromIterable(
        const <List<int>>[
          <int>[0x41],
          <int>[0xe0, 0xe1],
        ],
      ).transform(codec.decoder).join();
      expect(decoded, 'Aאב');

      final chunks = await Stream<String>.fromIterable(
        <String>[
          'A',
          String.fromCharCode(0xd83d),
          String.fromCharCode(0xde00),
        ],
      ).transform(codec.encoder).toList();
      expect(chunks.expand((chunk) => chunk), <int>[0x41, 0x3f]);
    });
  });
}
