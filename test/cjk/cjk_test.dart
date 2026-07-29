import 'package:mime_convert/cjk.dart';
import 'package:test/test.dart';

/// Expected values are produced by CPython's codecs, which ship the Unicode
/// Consortium mappings — the same source the tables are generated from, checked
/// here against an independent hand-written expectation rather than a
/// regeneration of the same data.
void main() {
  group('Shift_JIS', () {
    test('decodes two-byte Japanese', () {
      // 日本語 in Shift_JIS
      final input = [0x93, 0xFA, 0x96, 0x7B, 0x8C, 0xEA];

      expect(shiftJis.decode(input), '日本語');
    });

    test('decodes single-byte half-width katakana', () {
      // 0xB1..0xB5 -> U+FF71..U+FF75
      final input = [0xB1, 0xB2, 0xB3, 0xB4, 0xB5];

      expect(shiftJis.decode(input), 'ｱｲｳｴｵ');
    });

    test('passes ASCII through unchanged', () {
      expect(shiftJis.decode('Subject: hi'.codeUnits), 'Subject: hi');
    });

    test('decodes mixed ASCII and Japanese', () {
      final input = [0x41, 0x42, 0x93, 0xFA, 0x43];

      expect(shiftJis.decode(input), 'AB日C');
    });

    test('round-trips through the lazily inverted encode table', () {
      const original = '日本語のテキストです。';

      expect(shiftJis.decode(shiftJis.encode(original)), original);
    });

    test('decodes the cp932 extensions real mail actually contains', () {
      // Strict JIS X 0208 has none of these, yet Outlook labels cp932 content
      // "Shift_JIS" and Japanese business mail is full of them. Decoding
      // strictly would yield U+FFFD for every one.
      expect(shiftJis.decode([0x87, 0x40]), '①');
      expect(shiftJis.decode([0x87, 0x82]), '№');
      expect(shiftJis.decode([0x87, 0x84]), '℡');
      // IBM-extended kanji: the surname variant in 髙橋 (Takahashi).
      expect(shiftJis.decode([0xFB, 0xFC]), '髙');
    });

    test('replaces an invalid trail byte when allowInvalid', () {
      // 0x93 is a valid lead; 0x20 is not a valid trail.
      final actual = shiftJis.decode([0x93, 0x20]);

      expect(actual, contains('�'));
    });

    test('throws on invalid input when not allowInvalid', () {
      const strict = ShiftJisCodec();

      expect(() => strict.decode([0x93, 0x20]), throwsFormatException);
    });

    test('a truncated lead byte at end of input does not overrun', () {
      expect(() => shiftJis.decode([0x41, 0x93]), returnsNormally);
    });
  });

  group('EUC-JP', () {
    test('decodes two-byte Japanese', () {
      // 日本語 in EUC-JP
      final input = [0xC6, 0xFC, 0xCB, 0xDC, 0xB8, 0xEC];

      expect(eucJp.decode(input), '日本語');
    });

    test('decodes the 0x8E half-width katakana prefix', () {
      // 0x8E 0xB1 -> U+FF71
      expect(eucJp.decode([0x8E, 0xB1]), 'ｱ');
    });

    test('decodes the three-byte 0x8F JIS X 0212 plane', () {
      // 0x8F 0xB0 0xA1 -> U+4E02, 0x8F 0xA2 0xAF -> U+02D8.
      // Note 0x8F 0xA1 0xA1 is *not* valid EUC-JP despite looking plausible —
      // the 0x8F plane is sparse, so pick sequences that genuinely map.
      expect(eucJp.decode([0x8F, 0xB0, 0xA1]), '丂');
      expect(eucJp.decode([0x8F, 0xA2, 0xAF]), '˘');
    });

    test('a three-byte sequence is consumed whole, not byte by byte', () {
      final actual = eucJp.decode([0x41, 0x8F, 0xB0, 0xA1, 0x42]);

      expect(actual, 'A丂B');
    });

    test('round-trips', () {
      const original = '日本語テキスト';

      expect(eucJp.decode(eucJp.encode(original)), original);
    });
  });

  group('EUC-KR', () {
    test('decodes two-byte Hangul', () {
      // 한글 in EUC-KR
      final input = [0xC7, 0xD1, 0xB1, 0xDB];

      expect(eucKr.decode(input), '한글');
    });

    test('passes ASCII through unchanged', () {
      expect(eucKr.decode('hello'.codeUnits), 'hello');
    });

    test('decodes the UHC extensions beyond the Wansung set', () {
      // cp949 adds 8,823 mappings over strict EUC-KR — the Hangul syllables
      // outside Wansung. Strict EUC-KR returns U+FFFD for these.
      expect(eucKr.decode([0x94, 0x62]), isNot(contains('�')));
      expect(eucKr.decode([0x94, 0x62]).runes.length, 1);
    });

    test('round-trips', () {
      const original = '한글 텍스트';

      expect(eucKr.decode(eucKr.encode(original)), original);
    });
  });

  group('encoder covers the asymmetric cases', () {
    // Inverting the decode table cannot produce these: each encodes to a
    // sequence that decodes back to a *different* code point, so the inverse
    // never contains them. They come from the generated _encodeOverrides.
    test('Shift_JIS U+2212 MINUS SIGN', () {
      expect(shiftJis.encode('−'), [0x81, 0x7C]);
    });

    test('Shift_JIS cent, pound and not signs', () {
      expect(shiftJis.encode('¢'), [0x81, 0x91]);
      expect(shiftJis.encode('£'), [0x81, 0x92]);
      expect(shiftJis.encode('¬'), [0x81, 0xCA]);
    });

    test('Shift_JIS U+301C WAVE DASH and U+2016', () {
      expect(shiftJis.encode('〜'), [0x81, 0x60]);
      expect(shiftJis.encode('‖'), [0x81, 0x61]);
    });

    test('EUC-JP yen and overline', () {
      expect(eucJp.encode('¥'), [0x5C]);
      expect(eucJp.encode('‾'), [0x7E]);
    });

    test('these deliberately do not round-trip', () {
      // Encoding is defined for them; decoding the result yields the canonical
      // code point for those bytes, which is a different character. That is the
      // charset's behaviour, not a defect in this implementation.
      expect(shiftJis.decode(shiftJis.encode('−')), '－');
      expect(eucJp.decode(eucJp.encode('¥')), r'\');
    });
  });

  group('codec identity', () {
    test('names match the charset labels used in MIME headers', () {
      expect(shiftJis.name, 'shift_jis');
      expect(eucJp.name, 'euc-jp');
      expect(eucKr.name, 'euc-kr');
    });
  });
}
