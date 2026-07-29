import 'package:mime_convert/cjk.dart';
import 'package:test/test.dart';

/// Invariants the generated tables must hold for [CjkDecoder] to be correct.
///
/// The decoder resolves sequence length by trying one, then two, then three
/// bytes and taking the first table hit, instead of encoding per-charset
/// lead-byte rules. That is only sound while the tables satisfy the properties
/// below. They hold for cp932, EUC-JP and cp949 today; these tests fail loudly
/// if a regenerated table ever breaks one, rather than leaving the decoder
/// silently truncating multi-byte characters.
void main() {
  final codecs = <String, dynamic>{
    'Shift_JIS': shiftJis,
    'EUC-JP': eucJp,
    'EUC-KR': eucKr,
  };

  codecs.forEach((name, codec) {
    group(name, () {
      test('no byte is both valid alone and a valid lead', () {
        // If a byte could be both, the single-byte branch would shadow the
        // multi-byte reading and silently truncate every such character.
        final singles = <int>[];
        for (var b = 0x80; b < 0x100; b++) {
          try {
            if (codec.decode([b]).length == 1 && !codec.decode([b]).contains('�')) {
              singles.add(b);
            }
          } on FormatException {
            // not a valid single byte — fine
          }
        }

        for (final lead in singles) {
          var actsAsLead = false;
          for (var trail = 0x40; trail < 0x100; trail++) {
            final decoded = codec.decode([lead, trail]);
            // A genuine two-byte mapping yields one character. A single byte
            // followed by another single byte yields two.
            if (decoded.length == 1 && !decoded.contains('�')) {
              actsAsLead = true;
              break;
            }
          }
          expect(actsAsLead, isFalse,
              reason: '0x${lead.toRadixString(16)} is valid alone AND as a '
                  'lead — the decoder would truncate multi-byte sequences');
        }
      });

      test('ASCII is never a multi-byte lead', () {
        for (var b = 0x00; b < 0x80; b++) {
          expect(codec.decode([b, 0x41]).length, 2,
              reason: '0x${b.toRadixString(16)} should stay single-byte');
        }
      });
    });
  });

  group('EUC-JP three-byte plane', () {
    test('the 0x8F lead has no two-byte mapping', () {
      // The three-byte branch is only reachable because 0x8F never resolves at
      // two bytes. If it ever did, JIS X 0212 would decode as garbage.
      var resolvedAtTwoBytes = false;
      for (var trail = 0x21; trail < 0x100; trail++) {
        final decoded = eucJp.decode([0x8F, trail]);
        if (decoded.length == 1 && !decoded.contains('�')) {
          resolvedAtTwoBytes = true;
          break;
        }
      }

      expect(resolvedAtTwoBytes, isFalse);
    });
  });
}
