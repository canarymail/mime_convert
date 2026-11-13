import 'dart:convert' as dart_convert;

import 'package:mime_convert/mime_convert.dart';
import 'package:test/test.dart';

void main() {
  group('CodePage850TextCodec', () {
    // Python's cp850 decoding of bytes 0x00-0xFF:
    // `bytes([b]).decode('cp850')`.
    const expected =
        '\u{0000}\u{0001}\u{0002}\u{0003}\u{0004}\u{0005}\u{0006}\u{0007}'
        '\u{0008}\u{0009}\u{000A}\u{000B}\u{000C}\u{000D}\u{000E}\u{000F}'
        '\u{0010}\u{0011}\u{0012}\u{0013}\u{0014}\u{0015}\u{0016}\u{0017}'
        '\u{0018}\u{0019}\u{001A}\u{001B}\u{001C}\u{001D}\u{001E}\u{001F}'
        '\u{0020}\u{0021}\u{0022}\u{0023}\u{0024}\u{0025}\u{0026}\u{0027}'
        '\u{0028}\u{0029}\u{002A}\u{002B}\u{002C}\u{002D}\u{002E}\u{002F}'
        '\u{0030}\u{0031}\u{0032}\u{0033}\u{0034}\u{0035}\u{0036}\u{0037}'
        '\u{0038}\u{0039}\u{003A}\u{003B}\u{003C}\u{003D}\u{003E}\u{003F}'
        '\u{0040}\u{0041}\u{0042}\u{0043}\u{0044}\u{0045}\u{0046}\u{0047}'
        '\u{0048}\u{0049}\u{004A}\u{004B}\u{004C}\u{004D}\u{004E}\u{004F}'
        '\u{0050}\u{0051}\u{0052}\u{0053}\u{0054}\u{0055}\u{0056}\u{0057}'
        '\u{0058}\u{0059}\u{005A}\u{005B}\u{005C}\u{005D}\u{005E}\u{005F}'
        '\u{0060}\u{0061}\u{0062}\u{0063}\u{0064}\u{0065}\u{0066}\u{0067}'
        '\u{0068}\u{0069}\u{006A}\u{006B}\u{006C}\u{006D}\u{006E}\u{006F}'
        '\u{0070}\u{0071}\u{0072}\u{0073}\u{0074}\u{0075}\u{0076}\u{0077}'
        '\u{0078}\u{0079}\u{007A}\u{007B}\u{007C}\u{007D}\u{007E}\u{007F}'
        '\u{00C7}\u{00FC}\u{00E9}\u{00E2}\u{00E4}\u{00E0}\u{00E5}\u{00E7}'
        '\u{00EA}\u{00EB}\u{00E8}\u{00EF}\u{00EE}\u{00EC}\u{00C4}\u{00C5}'
        '\u{00C9}\u{00E6}\u{00C6}\u{00F4}\u{00F6}\u{00F2}\u{00FB}\u{00F9}'
        '\u{00FF}\u{00D6}\u{00DC}\u{00F8}\u{00A3}\u{00D8}\u{00D7}\u{0192}'
        '\u{00E1}\u{00ED}\u{00F3}\u{00FA}\u{00F1}\u{00D1}\u{00AA}\u{00BA}'
        '\u{00BF}\u{00AE}\u{00AC}\u{00BD}\u{00BC}\u{00A1}\u{00AB}\u{00BB}'
        '\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{00C1}\u{00C2}\u{00C0}'
        '\u{00A9}\u{2563}\u{2551}\u{2557}\u{255D}\u{00A2}\u{00A5}\u{2510}'
        '\u{2514}\u{2534}\u{252C}\u{251C}\u{2500}\u{253C}\u{00E3}\u{00C3}'
        '\u{255A}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256C}\u{00A4}'
        '\u{00F0}\u{00D0}\u{00CA}\u{00CB}\u{00C8}\u{0131}\u{00CD}\u{00CE}'
        '\u{00CF}\u{2518}\u{250C}\u{2588}\u{2584}\u{00A6}\u{00CC}\u{2580}'
        '\u{00D3}\u{00DF}\u{00D4}\u{00D2}\u{00F5}\u{00D5}\u{00B5}\u{00FE}'
        '\u{00DE}\u{00DA}\u{00DB}\u{00D9}\u{00FD}\u{00DD}\u{00AF}\u{00B4}'
        '\u{00AD}\u{00B1}\u{2017}\u{00BE}\u{00B6}\u{00A7}\u{00F7}\u{00B8}'
        '\u{00B0}\u{00A8}\u{00B7}\u{00B9}\u{00B3}\u{00B2}\u{25A0}\u{00A0}';

    test('decodes every byte as the standard cp850 table', () {
      expect(
        const CodePage850TextDecoder()
            .convert(List<int>.generate(256, (index) => index)),
        expected,
      );
    });

    test('keeps control characters that the glyph codec draws', () {
      expect(
        const CodePage850TextDecoder().convert([0x0C, 0x0E, 0x7F, 0x9D]),
        '\u000C\u000E\u007FØ',
      );
      expect(
        const CodePage850Decoder().convert([0x0C, 0x0E, 0x7F, 0x9D]),
        '♀♫⌂Ø',
      );
    });

    test('round-trips text with line breaks and tabs', () {
      const text = 'Grüße\r\nZeile 2\tmotörhead ruleß ok ô\u0000';
      const codec = CodePage850TextCodec();
      expect(codec.decode(codec.encode(text)), text);
    });

    test('does not encode the DOS glyphs', () {
      expect(
        () => CodePage850TextEncoder().convert('♪'),
        throwsFormatException,
      );
      expect(CodePage850TextEncoder(allowInvalid: true).convert('♪'), [0x3F]);
    });
  });

  group('NUL decodes as U+0000', () {
    final codecs = <String, dart_convert.Encoding>{
      'windows-1252': const Windows1252Codec(),
      'iso-8859-2': const Latin2Codec(),
      'iso-8859-15': const Latin15Codec(),
      'koi8-r': const Koi8rCodec(),
      'cp850 glyphs': const CodePage850Codec(),
      'cp850 text': const CodePage850TextCodec(),
    };
    for (final entry in codecs.entries) {
      test(entry.key, () {
        // The start block lookup used to read index -1 for NUL, or crash on
        // `startBlock!` in a codec without one.
        expect(entry.value.decode([0x61, 0x00, 0x62]), 'a\u0000b');
      });
    }
  });
}
