// GENERATED CODE - DO NOT EDIT.
// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs
//
// Source: Python 3.14.6 standard-library codecs
// Unicode database: 16.0.0
// Mapping SHA-256: 3dd926236500ab85621dec54407be39448f1996fa0ad53893393f00003b14b75
// Generator: tool/generate_single_byte_codecs.py
//
// Each decoder table was produced with strict one-byte Python decodes. Each
// encoder map was produced with strict Python encodes, preserving Python's
// canonical byte selection for duplicate decoder mappings.

import 'single_byte_codec.dart';

/// The Python `cp037` single-byte encoding.
class Cp037Codec extends SingleByteCodec {
  const Cp037Codec({bool allowInvalid = false})
      : super(
          name: 'cp037',
          decodingTable: _cp037DecodingTable,
          encodingOverrides: _cp037EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp037DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    '  âäàáãåçñ¢.<(+|&éêëèíîïìß!\$*);¬'
    '-/ÂÄÀÁÃÅÇÑ¦,%_>?øÉÊËÈÍÎÏÌ`:#@\'="'
    'Øabcdefghi«»ðýþ±°jklmnopqrªºæ¸Æ¤'
    'µ~stuvwxyz¡¿ÐÝÞ®^£¥·©§¶¼½¾[]¯¨´×'
    '{ABCDEFGHI\u{ad}ôöòóõ}JKLMNOPQR¹ûüùúÿ'
    '\\÷STUVWXYZ²ÔÖÒÓÕ0123456789³ÛÜÙÚ\u{9f}';

const Map<int, int> _cp037EncodingOverrides = <int, int>{};

/// The Python `cp1006` single-byte encoding.
class Cp1006Codec extends SingleByteCodec {
  const Cp1006Codec({bool allowInvalid = false})
      : super(
          name: 'cp1006',
          decodingTable: _cp1006DecodingTable,
          encodingOverrides: _cp1006EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp1006DecodingTable =
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{85}\u{86}\u{87}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{8d}\u{8e}\u{8f}\u{90}\u{91}\u{92}\u{93}\u{94}\u{95}\u{96}\u{97}\u{98}\u{99}\u{9a}\u{9b}\u{9c}\u{9d}\u{9e}\u{9f}'
    ' ۰۱۲۳۴۵۶۷۸۹،؛\u{ad}؟ﺁﺍﺎﺎﺏﺑﭖﭘﺓﺕﺗﭦﭨﺙﺛﺝﺟ'
    'ﭺﭼﺡﺣﺥﺧﺩﮄﺫﺭﮌﺯﮊﺱﺳﺵﺷﺹﺻﺽﺿﻁﻅﻉﻊﻋﻌﻍﻎﻏﻐﻑ'
    'ﻓﻕﻗﻙﻛﮒﮔﻝﻟﻠﻡﻣﮞﻥﻧﺅﻭﮦﮨﮩﮪﺀﺉﺊﺋﻱﻲﻳﮰﮮﹼﹽ';

const Map<int, int> _cp1006EncodingOverrides = <int, int>{
  0xfe8e: 0xb2,
};

/// The Python `cp1026` single-byte encoding.
class Cp1026Codec extends SingleByteCodec {
  const Cp1026Codec({bool allowInvalid = false})
      : super(
          name: 'cp1026',
          decodingTable: _cp1026DecodingTable,
          encodingOverrides: _cp1026EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp1026DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    '  âäàáãå{ñÇ.<(+!&éêëèíîïìßĞİ*);^'
    '-/ÂÄÀÁÃÅ[Ñş,%_>?øÉÊËÈÍÎÏÌı:ÖŞ\'=Ü'
    'Øabcdefghi«»}`¦±°jklmnopqrªºæ¸Æ¤'
    'µöstuvwxyz¡¿]\$@®¢£¥·©§¶¼½¾¬|¯¨´×'
    'çABCDEFGHI\u{ad}ô~òóõğJKLMNOPQR¹û\\ùúÿ'
    'ü÷STUVWXYZ²Ô#ÒÓÕ0123456789³Û"ÙÚ\u{9f}';

const Map<int, int> _cp1026EncodingOverrides = <int, int>{};

/// The Python `cp1125` single-byte encoding.
class Cp1125Codec extends SingleByteCodec {
  const Cp1125Codec({bool allowInvalid = false})
      : super(
          name: 'cp1125',
          decodingTable: _cp1125DecodingTable,
          encodingOverrides: _cp1125EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp1125DecodingTable = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    'абвгдежзийклмноп░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'рстуфхцчшщъыьэюяЁёҐґЄєІіЇї·√№¤■ ';

const Map<int, int> _cp1125EncodingOverrides = <int, int>{};

/// The Python `cp1140` single-byte encoding.
class Cp1140Codec extends SingleByteCodec {
  const Cp1140Codec({bool allowInvalid = false})
      : super(
          name: 'cp1140',
          decodingTable: _cp1140DecodingTable,
          encodingOverrides: _cp1140EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp1140DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    '  âäàáãåçñ¢.<(+|&éêëèíîïìß!\$*);¬'
    '-/ÂÄÀÁÃÅÇÑ¦,%_>?øÉÊËÈÍÎÏÌ`:#@\'="'
    'Øabcdefghi«»ðýþ±°jklmnopqrªºæ¸Æ€'
    'µ~stuvwxyz¡¿ÐÝÞ®^£¥·©§¶¼½¾[]¯¨´×'
    '{ABCDEFGHI\u{ad}ôöòóõ}JKLMNOPQR¹ûüùúÿ'
    '\\÷STUVWXYZ²ÔÖÒÓÕ0123456789³ÛÜÙÚ\u{9f}';

const Map<int, int> _cp1140EncodingOverrides = <int, int>{};

/// The Python `cp1255` single-byte encoding.
class Cp1255Codec extends SingleByteCodec {
  const Cp1255Codec({bool allowInvalid = false})
      : super(
          name: 'cp1255',
          decodingTable: _cp1255DecodingTable,
          encodingOverrides: _cp1255EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp1255DecodingTable =
    '€\u{ffff}‚ƒ„…†‡ˆ‰\u{ffff}‹\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}‘’“”•–—˜™\u{ffff}›\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    ' ¡¢£₪¥¦§¨©×«¬\u{ad}®¯°±²³´µ¶·¸¹÷»¼½¾¿'
    'ְֱֲֳִֵֶַָֹ\u{ffff}ֻּֽ־ֿ׀ׁׂ׃װױײ׳״\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    'אבגדהוזחטיךכלםמןנסעףפץצקרשת\u{ffff}\u{ffff}\u{200e}\u{200f}\u{ffff}';

const Map<int, int> _cp1255EncodingOverrides = <int, int>{};

/// The Python `cp1257` single-byte encoding.
class Cp1257Codec extends SingleByteCodec {
  const Cp1257Codec({bool allowInvalid = false})
      : super(
          name: 'cp1257',
          decodingTable: _cp1257DecodingTable,
          encodingOverrides: _cp1257EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp1257DecodingTable =
    '€\u{ffff}‚\u{ffff}„…†‡\u{ffff}‰\u{ffff}‹\u{ffff}¨ˇ¸\u{ffff}‘’“”•–—\u{ffff}™\u{ffff}›\u{ffff}¯˛\u{ffff}'
    ' \u{ffff}¢£¤\u{ffff}¦§Ø©Ŗ«¬\u{ad}®Æ°±²³´µ¶·ø¹ŗ»¼½¾æ'
    'ĄĮĀĆÄÅĘĒČÉŹĖĢĶĪĻŠŃŅÓŌÕÖ×ŲŁŚŪÜŻŽß'
    'ąįāćäåęēčéźėģķīļšńņóōõö÷ųłśūüżž˙';

const Map<int, int> _cp1257EncodingOverrides = <int, int>{};

/// The Python `cp1258` single-byte encoding.
class Cp1258Codec extends SingleByteCodec {
  const Cp1258Codec({bool allowInvalid = false})
      : super(
          name: 'cp1258',
          decodingTable: _cp1258DecodingTable,
          encodingOverrides: _cp1258EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp1258DecodingTable =
    '€\u{ffff}‚ƒ„…†‡ˆ‰\u{ffff}‹Œ\u{ffff}\u{ffff}\u{ffff}\u{ffff}‘’“”•–—˜™\u{ffff}›œ\u{ffff}\u{ffff}Ÿ'
    ' ¡¢£¤¥¦§¨©ª«¬\u{ad}®¯°±²³´µ¶·¸¹º»¼½¾¿'
    'ÀÁÂĂÄÅÆÇÈÉÊË̀ÍÎÏĐÑ̉ÓÔƠÖ×ØÙÚÛÜỮß'
    'àáâăäåæçèéêë́íîïđṇ̃óôơö÷øùúûüư₫ÿ';

const Map<int, int> _cp1258EncodingOverrides = <int, int>{};

/// The Python `cp273` single-byte encoding.
class Cp273Codec extends SingleByteCodec {
  const Cp273Codec({bool allowInvalid = false})
      : super(
          name: 'cp273',
          decodingTable: _cp273DecodingTable,
          encodingOverrides: _cp273EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp273DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    '  â{àáãåçñÄ.<(+!&éêëèíîïì~Ü\$*);^'
    '-/Â[ÀÁÃÅÇÑö,%_>?øÉÊËÈÍÎÏÌ`:#§\'="'
    'Øabcdefghi«»ðýþ±°jklmnopqrªºæ¸Æ¤'
    'µßstuvwxyz¡¿ÐÝÞ®¢£¥·©@¶¼½¾¬|‾¨´×'
    'äABCDEFGHI\u{ad}ô¦òóõüJKLMNOPQR¹û}ùúÿ'
    'Ö÷STUVWXYZ²Ô\\ÒÓÕ0123456789³Û]ÙÚ\u{9f}';

const Map<int, int> _cp273EncodingOverrides = <int, int>{};

/// The Python `cp424` single-byte encoding.
class Cp424Codec extends SingleByteCodec {
  const Cp424Codec({bool allowInvalid = false})
      : super(
          name: 'cp424',
          decodingTable: _cp424DecodingTable,
          encodingOverrides: _cp424EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp424DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    ' אבגדהוזחט¢.<(+|&יךכלםמןנס!\$*);¬'
    '-/עףפץצקרש¦,%_>?\u{ffff}ת\u{ffff}\u{ffff} \u{ffff}\u{ffff}\u{ffff}‗`:#@\'="'
    '\u{ffff}abcdefghi«»\u{ffff}\u{ffff}\u{ffff}±°jklmnopqr\u{ffff}\u{ffff}\u{ffff}¸\u{ffff}¤'
    'µ~stuvwxyz\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}®^£¥·©§¶¼½¾[]¯¨´×'
    '{ABCDEFGHI\u{ad}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}}JKLMNOPQR¹\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\\÷STUVWXYZ²\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}0123456789³\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{9f}';

const Map<int, int> _cp424EncodingOverrides = <int, int>{};

/// The Python `cp437` single-byte encoding.
class Cp437Codec extends SingleByteCodec {
  const Cp437Codec({bool allowInvalid = false})
      : super(
          name: 'cp437',
          decodingTable: _cp437DecodingTable,
          encodingOverrides: _cp437EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp437DecodingTable = 'ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥₧ƒ'
    'áíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp437EncodingOverrides = <int, int>{};

/// The Python `cp500` single-byte encoding.
class Cp500Codec extends SingleByteCodec {
  const Cp500Codec({bool allowInvalid = false})
      : super(
          name: 'cp500',
          decodingTable: _cp500DecodingTable,
          encodingOverrides: _cp500EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp500DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    '  âäàáãåçñ[.<(+!&éêëèíîïìß]\$*);^'
    '-/ÂÄÀÁÃÅÇÑ¦,%_>?øÉÊËÈÍÎÏÌ`:#@\'="'
    'Øabcdefghi«»ðýþ±°jklmnopqrªºæ¸Æ¤'
    'µ~stuvwxyz¡¿ÐÝÞ®¢£¥·©§¶¼½¾¬|¯¨´×'
    '{ABCDEFGHI\u{ad}ôöòóõ}JKLMNOPQR¹ûüùúÿ'
    '\\÷STUVWXYZ²ÔÖÒÓÕ0123456789³ÛÜÙÚ\u{9f}';

const Map<int, int> _cp500EncodingOverrides = <int, int>{};

/// The Python `cp720` single-byte encoding.
class Cp720Codec extends SingleByteCodec {
  const Cp720Codec({bool allowInvalid = false})
      : super(
          name: 'cp720',
          decodingTable: _cp720DecodingTable,
          encodingOverrides: _cp720EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp720DecodingTable =
    '\u{80}\u{81}éâ\u{84}à\u{86}çêëèïî\u{8d}\u{8e}\u{8f}\u{90}ّْô¤ـûùءآأؤ£إئا'
    'بةتثجحخدذرزسشص«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'ضطظعغفµقكلمنهوىي≡ًٌٍَُِ≈°∙·√ⁿ²■ ';

const Map<int, int> _cp720EncodingOverrides = <int, int>{};

/// The Python `cp737` single-byte encoding.
class Cp737Codec extends SingleByteCodec {
  const Cp737Codec({bool allowInvalid = false})
      : super(
          name: 'cp737',
          decodingTable: _cp737DecodingTable,
          encodingOverrides: _cp737EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp737DecodingTable = 'ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθ'
    'ικλμνξοπρσςτυφχψ░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'ωάέήϊίόύϋώΆΈΉΊΌΎΏ±≥≤ΪΫ÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp737EncodingOverrides = <int, int>{};

/// The Python `cp775` single-byte encoding.
class Cp775Codec extends SingleByteCodec {
  const Cp775Codec({bool allowInvalid = false})
      : super(
          name: 'cp775',
          decodingTable: _cp775DecodingTable,
          encodingOverrides: _cp775EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp775DecodingTable = 'ĆüéāäģåćłēŖŗīŹÄÅÉæÆōöĢ¢ŚśÖÜø£Ø×¤'
    'ĀĪóŻżź”¦©®¬½¼Ł«»░▒▓│┤ĄČĘĖ╣║╗╝ĮŠ┐'
    '└┴┬├─┼ŲŪ╚╔╩╦╠═╬Žąčęėįšųūž┘┌█▄▌▐▀'
    'ÓßŌŃõÕµńĶķĻļņĒŅ’\u{ad}±“¾¶§÷„°∙·¹³²■ ';

const Map<int, int> _cp775EncodingOverrides = <int, int>{};

/// The Python `cp852` single-byte encoding.
class Cp852Codec extends SingleByteCodec {
  const Cp852Codec({bool allowInvalid = false})
      : super(
          name: 'cp852',
          decodingTable: _cp852DecodingTable,
          encodingOverrides: _cp852EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp852DecodingTable = 'ÇüéâäůćçłëŐőîŹÄĆÉĹĺôöĽľŚśÖÜŤťŁ×č'
    'áíóúĄąŽžĘę¬źČş«»░▒▓│┤ÁÂĚŞ╣║╗╝Żż┐'
    '└┴┬├─┼Ăă╚╔╩╦╠═╬¤đĐĎËďŇÍÎě┘┌█▄ŢŮ▀'
    'ÓßÔŃńňŠšŔÚŕŰýÝţ´\u{ad}˝˛ˇ˘§÷¸°¨˙űŘř■ ';

const Map<int, int> _cp852EncodingOverrides = <int, int>{};

/// The Python `cp855` single-byte encoding.
class Cp855Codec extends SingleByteCodec {
  const Cp855Codec({bool allowInvalid = false})
      : super(
          name: 'cp855',
          decodingTable: _cp855DecodingTable,
          encodingOverrides: _cp855EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp855DecodingTable = 'ђЂѓЃёЁєЄѕЅіІїЇјЈљЉњЊћЋќЌўЎџЏюЮъЪ'
    'аАбБцЦдДеЕфФгГ«»░▒▓│┤хХиИ╣║╗╝йЙ┐'
    '└┴┬├─┼кК╚╔╩╦╠═╬¤лЛмМнНоОп┘┌█▄Пя▀'
    'ЯрРсСтТуУжЖвВьЬ№\u{ad}ыЫзЗшШэЭщЩчЧ§■ ';

const Map<int, int> _cp855EncodingOverrides = <int, int>{};

/// The Python `cp856` single-byte encoding.
class Cp856Codec extends SingleByteCodec {
  const Cp856Codec({bool allowInvalid = false})
      : super(
          name: 'cp856',
          decodingTable: _cp856DecodingTable,
          encodingOverrides: _cp856EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp856DecodingTable =
    'אבגדהוזחטיךכלםמןנסעףפץצקרשת\u{ffff}£\u{ffff}×\u{ffff}'
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}®¬½¼\u{ffff}«»░▒▓│┤\u{ffff}\u{ffff}\u{ffff}©╣║╗╝¢¥┐'
    '└┴┬├─┼\u{ffff}\u{ffff}╚╔╩╦╠═╬¤\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}┘┌█▄¦\u{ffff}▀'
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}µ\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}¯´\u{ad}±‗¾¶§÷¸°¨·¹³²■ ';

const Map<int, int> _cp856EncodingOverrides = <int, int>{};

/// The Python `cp857` single-byte encoding.
class Cp857Codec extends SingleByteCodec {
  const Cp857Codec({bool allowInvalid = false})
      : super(
          name: 'cp857',
          decodingTable: _cp857DecodingTable,
          encodingOverrides: _cp857EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp857DecodingTable = 'ÇüéâäàåçêëèïîıÄÅÉæÆôöòûùİÖÜø£ØŞş'
    'áíóúñÑĞğ¿®¬½¼¡«»░▒▓│┤ÁÂÀ©╣║╗╝¢¥┐'
    '└┴┬├─┼ãÃ╚╔╩╦╠═╬¤ºªÊËÈ\u{ffff}ÍÎÏ┘┌█▄¦Ì▀'
    'ÓßÔÒõÕµ\u{ffff}×ÚÛÙìÿ¯´\u{ad}±\u{ffff}¾¶§÷¸°¨·¹³²■ ';

const Map<int, int> _cp857EncodingOverrides = <int, int>{};

/// The Python `cp858` single-byte encoding.
class Cp858Codec extends SingleByteCodec {
  const Cp858Codec({bool allowInvalid = false})
      : super(
          name: 'cp858',
          decodingTable: _cp858DecodingTable,
          encodingOverrides: _cp858EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp858DecodingTable = 'ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜø£Ø×ƒ'
    'áíóúñÑªº¿®¬½¼¡«»░▒▓│┤ÁÂÀ©╣║╗╝¢¥┐'
    '└┴┬├─┼ãÃ╚╔╩╦╠═╬¤ðÐÊËÈ€ÍÎÏ┘┌█▄¦Ì▀'
    'ÓßÔÒõÕµþÞÚÛÙýÝ¯´\u{ad}±‗¾¶§÷¸°¨·¹³²■ ';

const Map<int, int> _cp858EncodingOverrides = <int, int>{};

/// The Python `cp860` single-byte encoding.
class Cp860Codec extends SingleByteCodec {
  const Cp860Codec({bool allowInvalid = false})
      : super(
          name: 'cp860',
          decodingTable: _cp860DecodingTable,
          encodingOverrides: _cp860EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp860DecodingTable = 'ÇüéâãàÁçêÊèÍÔìÃÂÉÀÈôõòÚùÌÕÜ¢£Ù₧Ó'
    'áíóúñÑªº¿Ò¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp860EncodingOverrides = <int, int>{};

/// The Python `cp861` single-byte encoding.
class Cp861Codec extends SingleByteCodec {
  const Cp861Codec({bool allowInvalid = false})
      : super(
          name: 'cp861',
          decodingTable: _cp861DecodingTable,
          encodingOverrides: _cp861EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp861DecodingTable = 'ÇüéâäàåçêëèÐðÞÄÅÉæÆôöþûÝýÖÜø£Ø₧ƒ'
    'áíóúÁÍÓÚ¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp861EncodingOverrides = <int, int>{};

/// The Python `cp862` single-byte encoding.
class Cp862Codec extends SingleByteCodec {
  const Cp862Codec({bool allowInvalid = false})
      : super(
          name: 'cp862',
          decodingTable: _cp862DecodingTable,
          encodingOverrides: _cp862EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp862DecodingTable = 'אבגדהוזחטיךכלםמןנסעףפץצקרשת¢£¥₧ƒ'
    'áíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp862EncodingOverrides = <int, int>{};

/// The Python `cp863` single-byte encoding.
class Cp863Codec extends SingleByteCodec {
  const Cp863Codec({bool allowInvalid = false})
      : super(
          name: 'cp863',
          decodingTable: _cp863DecodingTable,
          encodingOverrides: _cp863EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp863DecodingTable = 'ÇüéâÂà¶çêëèïî‗À§ÉÈÊôËÏûù¤ÔÜ¢£ÙÛƒ'
    '¦´óú¨¸³¯Î⌐¬½¼¾«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp863EncodingOverrides = <int, int>{};

/// The Python `cp864` single-byte encoding.
class Cp864Codec extends SingleByteCodec {
  const Cp864Codec({bool allowInvalid = false})
      : super(
          name: 'cp864',
          decodingTable: _cp864DecodingTable,
          encodingOverrides: _cp864EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp864DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{4}\u{5}\u{6}\u{7}\u{8}\u{9}\u{a}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{14}\u{15}\u{16}\u{17}\u{18}\u{19}\u{1a}\u{1b}\u{1c}\u{1d}\u{1e}\u{1f}'
    ' !"#\$٪&\'()*+,-./0123456789:;<=>?'
    '@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_'
    '`abcdefghijklmnopqrstuvwxyz{|}~\u{7f}'
    '°·∙√▒─│┼┤┬├┴┐┌└┘β∞φ±½¼≈«»ﻷﻸ\u{ffff}\u{ffff}ﻻﻼ\u{ffff}'
    ' \u{ad}ﺂ£¤ﺄ\u{ffff}\u{ffff}ﺎﺏﺕﺙ،ﺝﺡﺥ٠١٢٣٤٥٦٧٨٩ﻑ؛ﺱﺵﺹ؟'
    '¢ﺀﺁﺃﺅﻊﺋﺍﺑﺓﺗﺛﺟﺣﺧﺩﺫﺭﺯﺳﺷﺻﺿﻁﻅﻋﻏ¦¬÷×ﻉ'
    'ـﻓﻗﻛﻟﻣﻧﻫﻭﻯﻳﺽﻌﻎﻍﻡﹽّﻥﻩﻬﻰﻲﻐﻕﻵﻶﻝﻙﻱ■\u{ffff}';

const Map<int, int> _cp864EncodingOverrides = <int, int>{};

/// The Python `cp865` single-byte encoding.
class Cp865Codec extends SingleByteCodec {
  const Cp865Codec({bool allowInvalid = false})
      : super(
          name: 'cp865',
          decodingTable: _cp865DecodingTable,
          encodingOverrides: _cp865EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp865DecodingTable = 'ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜø£Ø₧ƒ'
    'áíóúñÑªº¿⌐¬½¼¡«¤░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';

const Map<int, int> _cp865EncodingOverrides = <int, int>{};

/// The Python `cp866` single-byte encoding.
class Cp866Codec extends SingleByteCodec {
  const Cp866Codec({bool allowInvalid = false})
      : super(
          name: 'cp866',
          decodingTable: _cp866DecodingTable,
          encodingOverrides: _cp866EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp866DecodingTable = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    'абвгдежзийклмноп░▒▓│┤╡╢╖╕╣║╗╝╜╛┐'
    '└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀'
    'рстуфхцчшщъыьэюяЁёЄєЇїЎў°∙·√№¤■ ';

const Map<int, int> _cp866EncodingOverrides = <int, int>{};

/// The Python `cp869` single-byte encoding.
class Cp869Codec extends SingleByteCodec {
  const Cp869Codec({bool allowInvalid = false})
      : super(
          name: 'cp869',
          decodingTable: _cp869DecodingTable,
          encodingOverrides: _cp869EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp869DecodingTable =
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}Ά\u{ffff}·¬¦‘’Έ―ΉΊΪΌ\u{ffff}\u{ffff}ΎΫ©Ώ²³ά£έήί'
    'ϊΐόύΑΒΓΔΕΖΗ½ΘΙ«»░▒▓│┤ΚΛΜΝ╣║╗╝ΞΟ┐'
    '└┴┬├─┼ΠΡ╚╔╩╦╠═╬ΣΤΥΦΧΨΩαβγ┘┌█▄δε▀'
    'ζηθικλμνξοπρσςτ΄\u{ad}±υφχ§ψ΅°¨ωϋΰώ■ ';

const Map<int, int> _cp869EncodingOverrides = <int, int>{};

/// The Python `cp874` single-byte encoding.
class Cp874Codec extends SingleByteCodec {
  const Cp874Codec({bool allowInvalid = false})
      : super(
          name: 'cp874',
          decodingTable: _cp874DecodingTable,
          encodingOverrides: _cp874EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _cp874DecodingTable =
    '€\u{ffff}\u{ffff}\u{ffff}\u{ffff}…\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}‘’“”•–—\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    ' กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟ'
    'ภมยรฤลฦวศษสหฬอฮฯะัาำิีึืฺุู\u{ffff}\u{ffff}\u{ffff}\u{ffff}฿'
    'เแโใไๅๆ็่้๊๋์ํ๎๏๐๑๒๓๔๕๖๗๘๙๚๛\u{ffff}\u{ffff}\u{ffff}\u{ffff}';

const Map<int, int> _cp874EncodingOverrides = <int, int>{};

/// The Python `cp875` single-byte encoding.
class Cp875Codec extends SingleByteCodec {
  const Cp875Codec({bool allowInvalid = false})
      : super(
          name: 'cp875',
          decodingTable: _cp875DecodingTable,
          encodingOverrides: _cp875EncodingOverrides,
          replacementByte: 0x6f,
          asciiCompatible: false,
          allowInvalid: allowInvalid,
        );
}

const String _cp875DecodingTable =
    '\u{0}\u{1}\u{2}\u{3}\u{9c}\u{9}\u{86}\u{7f}\u{97}\u{8d}\u{8e}\u{b}\u{c}\u{d}\u{e}\u{f}\u{10}\u{11}\u{12}\u{13}\u{9d}\u{85}\u{8}\u{87}\u{18}\u{19}\u{92}\u{8f}\u{1c}\u{1d}\u{1e}\u{1f}'
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{a}\u{17}\u{1b}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{5}\u{6}\u{7}\u{90}\u{91}\u{16}\u{93}\u{94}\u{95}\u{96}\u{4}\u{98}\u{99}\u{9a}\u{9b}\u{14}\u{15}\u{9e}\u{1a}'
    ' ΑΒΓΔΕΖΗΘΙ[.<(+!&ΚΛΜΝΞΟΠΡΣ]\$*);^'
    '-/ΤΥΦΧΨΩΪΫ|,%_>?¨ΆΈΉ ΊΌΎΏ`:#@\'="'
    '΅abcdefghiαβγδεζ°jklmnopqrηθικλμ'
    '´~stuvwxyzνξοπρσ£άέήϊίόύϋώςτυφχψ'
    '{ABCDEFGHI\u{ad}ωΐΰ‘―}JKLMNOPQR±½\u{1a}·’¦'
    '\\\u{1a}STUVWXYZ²§\u{1a}\u{1a}«¬0123456789³©\u{1a}\u{1a}»\u{9f}';

const Map<int, int> _cp875EncodingOverrides = <int, int>{
  0x1a: 0xfd,
};

/// The Python `hp_roman8` single-byte encoding.
class HpRoman8Codec extends SingleByteCodec {
  const HpRoman8Codec({bool allowInvalid = false})
      : super(
          name: 'hp-roman8',
          decodingTable: _hpRoman8DecodingTable,
          encodingOverrides: _hpRoman8EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _hpRoman8DecodingTable =
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{85}\u{86}\u{87}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{8d}\u{8e}\u{8f}\u{90}\u{91}\u{92}\u{93}\u{94}\u{95}\u{96}\u{97}\u{98}\u{99}\u{9a}\u{9b}\u{9c}\u{9d}\u{9e}\u{9f}'
    ' ÀÂÈÊËÎÏ´ˋˆ¨˜ÙÛ₤¯Ýý°ÇçÑñ¡¿¤£¥§ƒ¢'
    'âêôûáéóúàèòùäëöüÅîØÆåíøæÄìÖÜÉïßÔ'
    'ÁÃãÐðÍÌÓÒÕõŠšÚŸÿÞþ·µ¶¾—¼½ªº«■»±\u{ffff}';

const Map<int, int> _hpRoman8EncodingOverrides = <int, int>{};

/// The Python `iso8859_1` single-byte encoding.
class Iso88591Codec extends SingleByteCodec {
  const Iso88591Codec({bool allowInvalid = false})
      : super(
          name: 'iso-8859-1',
          decodingTable: _iso88591DecodingTable,
          encodingOverrides: _iso88591EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _iso88591DecodingTable =
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{85}\u{86}\u{87}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{8d}\u{8e}\u{8f}\u{90}\u{91}\u{92}\u{93}\u{94}\u{95}\u{96}\u{97}\u{98}\u{99}\u{9a}\u{9b}\u{9c}\u{9d}\u{9e}\u{9f}'
    ' ¡¢£¤¥¦§¨©ª«¬\u{ad}®¯°±²³´µ¶·¸¹º»¼½¾¿'
    'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß'
    'àáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ';

const Map<int, int> _iso88591EncodingOverrides = <int, int>{};

/// The Python `koi8_t` single-byte encoding.
class Koi8TCodec extends SingleByteCodec {
  const Koi8TCodec({bool allowInvalid = false})
      : super(
          name: 'koi8-t',
          decodingTable: _koi8TDecodingTable,
          encodingOverrides: _koi8TEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _koi8TDecodingTable =
    'қғ‚Ғ„…†‡\u{ffff}‰ҳ‹ҲҷҶ\u{ffff}Қ‘’“”•–—\u{ffff}™\u{ffff}›\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\u{ffff}ӯӮё¤ӣ¦§\u{ffff}\u{ffff}\u{ffff}«¬\u{ad}®\u{ffff}°±²Ё\u{ffff}Ӣ¶·\u{ffff}№\u{ffff}»\u{ffff}\u{ffff}\u{ffff}©'
    'юабцдефгхийклмнопярстужвьызшэщчъ'
    'ЮАБЦДЕФГХИЙКЛМНОПЯРСТУЖВЬЫЗШЭЩЧЪ';

const Map<int, int> _koi8TEncodingOverrides = <int, int>{};

/// The Python `kz1048` single-byte encoding.
class Kz1048Codec extends SingleByteCodec {
  const Kz1048Codec({bool allowInvalid = false})
      : super(
          name: 'kz1048',
          decodingTable: _kz1048DecodingTable,
          encodingOverrides: _kz1048EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _kz1048DecodingTable = 'ЂЃ‚ѓ„…†‡€‰Љ‹ЊҚҺЏђ‘’“”•–—\u{ffff}™љ›њқһџ'
    ' ҰұӘ¤Ө¦§Ё©Ғ«¬\u{ad}®Ү°±Ііөµ¶·ё№ғ»әҢңү'
    'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    'абвгдежзийклмнопрстуфхцчшщъыьэюя';

const Map<int, int> _kz1048EncodingOverrides = <int, int>{};

/// The Python `mac_arabic` single-byte encoding.
class MacArabicCodec extends SingleByteCodec {
  const MacArabicCodec({bool allowInvalid = false})
      : super(
          name: 'mac-arabic',
          decodingTable: _macArabicDecodingTable,
          encodingOverrides: _macArabicEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macArabicDecodingTable = 'Ä ÇÉÑÖÜáàâäں«çéèêëí…îïñó»ôö÷úùûü'
    ' !"#\$٪&\'()*+،-./٠١٢٣٤٥٦٧٨٩:؛<=>؟'
    '❊ءآأؤإئابةتثجحخدذرزسشصضطظعغ[\\]^_'
    'ـفقكلمنهوىيًٌٍَُِّْپٹچەڤگڈڑ{|}ژے';

const Map<int, int> _macArabicEncodingOverrides = <int, int>{
  0x20: 0xa0,
  0x21: 0xa1,
  0x22: 0xa2,
  0x23: 0xa3,
  0x24: 0xa4,
  0x26: 0xa6,
  0x27: 0xa7,
  0x28: 0xa8,
  0x29: 0xa9,
  0x2a: 0xaa,
  0x2b: 0xab,
  0x2d: 0xad,
  0x2e: 0xae,
  0x2f: 0xaf,
  0x3a: 0xba,
  0x3c: 0xbc,
  0x3d: 0xbd,
  0x3e: 0xbe,
  0x5b: 0xdb,
  0x5c: 0xdc,
  0x5d: 0xdd,
  0x5e: 0xde,
  0x5f: 0xdf,
  0x7b: 0xfb,
  0x7c: 0xfc,
  0x7d: 0xfd,
};

/// The Python `mac_croatian` single-byte encoding.
class MacCroatianCodec extends SingleByteCodec {
  const MacCroatianCodec({bool allowInvalid = false})
      : super(
          name: 'mac-croatian',
          decodingTable: _macCroatianDecodingTable,
          encodingOverrides: _macCroatianEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macCroatianDecodingTable = 'ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü'
    '†°¢£§•¶ß®Š™´¨≠ŽØ∞±≤≥∆µ∂∑∏š∫ªºΩžø'
    '¿¡¬√ƒ≈Ć«Č… ÀÃÕŒœĐ—“”‘’÷◊\u{f8ff}©⁄€‹›Æ»'
    '–·‚„‰ÂćÁčÈÍÎÏÌÓÔđÒÚÛÙıˆ˜¯πË˚¸Êæˇ';

const Map<int, int> _macCroatianEncodingOverrides = <int, int>{};

/// The Python `mac_cyrillic` single-byte encoding.
class MacCyrillicCodec extends SingleByteCodec {
  const MacCyrillicCodec({bool allowInvalid = false})
      : super(
          name: 'mac-cyrillic',
          decodingTable: _macCyrillicDecodingTable,
          encodingOverrides: _macCyrillicEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macCyrillicDecodingTable = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    '†°Ґ£§•¶І®©™Ђђ≠Ѓѓ∞±≤≥іµґЈЄєЇїЉљЊњ'
    'јЅ¬√ƒ≈∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№Ёёя'
    'абвгдежзийклмнопрстуфхцчшщъыьэю€';

const Map<int, int> _macCyrillicEncodingOverrides = <int, int>{};

/// The Python `mac_farsi` single-byte encoding.
class MacFarsiCodec extends SingleByteCodec {
  const MacFarsiCodec({bool allowInvalid = false})
      : super(
          name: 'mac-farsi',
          decodingTable: _macFarsiDecodingTable,
          encodingOverrides: _macFarsiEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macFarsiDecodingTable = 'Ä ÇÉÑÖÜáàâäں«çéèêëí…îïñó»ôö÷úùûü'
    ' !"#\$٪&\'()*+،-./۰۱۲۳۴۵۶۷۸۹:؛<=>؟'
    '❊ءآأؤإئابةتثجحخدذرزسشصضطظعغ[\\]^_'
    'ـفقكلمنهوىيًٌٍَُِّْپٹچەڤگڈڑ{|}ژے';

const Map<int, int> _macFarsiEncodingOverrides = <int, int>{
  0x20: 0xa0,
  0x21: 0xa1,
  0x22: 0xa2,
  0x23: 0xa3,
  0x24: 0xa4,
  0x26: 0xa6,
  0x27: 0xa7,
  0x28: 0xa8,
  0x29: 0xa9,
  0x2a: 0xaa,
  0x2b: 0xab,
  0x2d: 0xad,
  0x2e: 0xae,
  0x2f: 0xaf,
  0x3a: 0xba,
  0x3c: 0xbc,
  0x3d: 0xbd,
  0x3e: 0xbe,
  0x5b: 0xdb,
  0x5c: 0xdc,
  0x5d: 0xdd,
  0x5e: 0xde,
  0x5f: 0xdf,
  0x7b: 0xfb,
  0x7c: 0xfc,
  0x7d: 0xfd,
};

/// The Python `mac_greek` single-byte encoding.
class MacGreekCodec extends SingleByteCodec {
  const MacGreekCodec({bool allowInvalid = false})
      : super(
          name: 'mac-greek',
          decodingTable: _macGreekDecodingTable,
          encodingOverrides: _macGreekEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macGreekDecodingTable = 'Ä¹²É³ÖÜ΅àâä΄¨çéèêë£™îï•½‰ôö¦€ùûü'
    '†ΓΔΘΛΞΠß®©ΣΪ§≠°·Α±≤≥¥ΒΕΖΗΙΚΜΦΫΨΩ'
    'άΝ¬ΟΡ≈Τ«»… ΥΧΆΈœ–―“”‘’÷ΉΊΌΎέήίόΏ'
    'ύαβψδεφγηιξκλμνοπώρστθωςχυζϊϋΐΰ\u{ad}';

const Map<int, int> _macGreekEncodingOverrides = <int, int>{};

/// The Python `mac_iceland` single-byte encoding.
class MacIcelandCodec extends SingleByteCodec {
  const MacIcelandCodec({bool allowInvalid = false})
      : super(
          name: 'mac-iceland',
          decodingTable: _macIcelandDecodingTable,
          encodingOverrides: _macIcelandEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macIcelandDecodingTable = 'ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü'
    'Ý°¢£§•¶ß®©™´¨≠ÆØ∞±≤≥¥µ∂∑∏π∫ªºΩæø'
    '¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€ÐðÞþ'
    'ý·‚„‰ÂÊÁËÈÍÎÏÌÓÔ\u{f8ff}ÒÚÛÙıˆ˜¯˘˙˚¸˝˛ˇ';

const Map<int, int> _macIcelandEncodingOverrides = <int, int>{};

/// The Python `mac_latin2` single-byte encoding.
class MacLatin2Codec extends SingleByteCodec {
  const MacLatin2Codec({bool allowInvalid = false})
      : super(
          name: 'mac-latin2',
          decodingTable: _macLatin2DecodingTable,
          encodingOverrides: _macLatin2EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macLatin2DecodingTable = 'ÄĀāÉĄÖÜáąČäčĆćéŹźĎíďĒēĖóėôöõúĚěü'
    '†°Ę£§•¶ß®©™ę¨≠ģĮįĪ≤≥īĶ∂∑łĻļĽľĹĺŅ'
    'ņŃ¬√ńŇ∆«»… ňŐÕőŌ–—“”‘’÷◊ōŔŕŘ‹›řŖ'
    'ŗŠ‚„šŚśÁŤťÍŽžŪÓÔūŮÚůŰűŲųÝýķŻŁżĢˇ';

const Map<int, int> _macLatin2EncodingOverrides = <int, int>{};

/// The Python `mac_roman` single-byte encoding.
class MacRomanCodec extends SingleByteCodec {
  const MacRomanCodec({bool allowInvalid = false})
      : super(
          name: 'mac-roman',
          decodingTable: _macRomanDecodingTable,
          encodingOverrides: _macRomanEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macRomanDecodingTable = 'ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü'
    '†°¢£§•¶ß®©™´¨≠ÆØ∞±≤≥¥µ∂∑∏π∫ªºΩæø'
    '¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›ﬁﬂ'
    '‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔ\u{f8ff}ÒÚÛÙıˆ˜¯˘˙˚¸˝˛ˇ';

const Map<int, int> _macRomanEncodingOverrides = <int, int>{};

/// The Python `mac_romanian` single-byte encoding.
class MacRomanianCodec extends SingleByteCodec {
  const MacRomanianCodec({bool allowInvalid = false})
      : super(
          name: 'mac-romanian',
          decodingTable: _macRomanianDecodingTable,
          encodingOverrides: _macRomanianEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macRomanianDecodingTable = 'ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü'
    '†°¢£§•¶ß®©™´¨≠ĂȘ∞±≤≥¥µ∂∑∏π∫ªºΩăș'
    '¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›Țț'
    '‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔ\u{f8ff}ÒÚÛÙıˆ˜¯˘˙˚¸˝˛ˇ';

const Map<int, int> _macRomanianEncodingOverrides = <int, int>{};

/// The Python `mac_turkish` single-byte encoding.
class MacTurkishCodec extends SingleByteCodec {
  const MacTurkishCodec({bool allowInvalid = false})
      : super(
          name: 'mac-turkish',
          decodingTable: _macTurkishDecodingTable,
          encodingOverrides: _macTurkishEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _macTurkishDecodingTable = 'ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü'
    '†°¢£§•¶ß®©™´¨≠ÆØ∞±≤≥¥µ∂∑∏π∫ªºΩæø'
    '¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸĞğİıŞş'
    '‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔ\u{f8ff}ÒÚÛÙ\u{f8a0}ˆ˜¯˘˙˚¸˝˛ˇ';

const Map<int, int> _macTurkishEncodingOverrides = <int, int>{};

/// The Python `palmos` single-byte encoding.
class PalmosCodec extends SingleByteCodec {
  const PalmosCodec({bool allowInvalid = false})
      : super(
          name: 'palmos',
          decodingTable: _palmosDecodingTable,
          encodingOverrides: _palmosEncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _palmosDecodingTable =
    '€\u{81}‚ƒ„…†‡ˆ‰Š‹Œ♦♣♥♠‘’“”•–—˜™š›œ\u{9d}\u{9e}Ÿ'
    ' ¡¢£¤¥¦§¨©ª«¬\u{ad}®¯°±²³´µ¶·¸¹º»¼½¾¿'
    'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß'
    'àáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ';

const Map<int, int> _palmosEncodingOverrides = <int, int>{};

/// The Python `ptcp154` single-byte encoding.
class Ptcp154Codec extends SingleByteCodec {
  const Ptcp154Codec({bool allowInvalid = false})
      : super(
          name: 'ptcp154',
          decodingTable: _ptcp154DecodingTable,
          encodingOverrides: _ptcp154EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _ptcp154DecodingTable = 'ҖҒӮғ„…ҶҮҲүҠӢҢҚҺҸҗ‘’“”•–—ҳҷҡӣңқһҹ'
    ' ЎўЈӨҘҰ§Ё©Ә«¬ӯ®Ҝ°ұІіҙө¶·ё№ә»јҪҫҝ'
    'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    'абвгдежзийклмнопрстуфхцчшщъыьэюя';

const Map<int, int> _ptcp154EncodingOverrides = <int, int>{};

/// The Python `tis_620` single-byte encoding.
class Tis620Codec extends SingleByteCodec {
  const Tis620Codec({bool allowInvalid = false})
      : super(
          name: 'tis-620',
          decodingTable: _tis620DecodingTable,
          encodingOverrides: _tis620EncodingOverrides,
          replacementByte: 0x3f,
          asciiCompatible: true,
          allowInvalid: allowInvalid,
        );
}

const String _tis620DecodingTable =
    '\u{80}\u{81}\u{82}\u{83}\u{84}\u{85}\u{86}\u{87}\u{88}\u{89}\u{8a}\u{8b}\u{8c}\u{8d}\u{8e}\u{8f}\u{90}\u{91}\u{92}\u{93}\u{94}\u{95}\u{96}\u{97}\u{98}\u{99}\u{9a}\u{9b}\u{9c}\u{9d}\u{9e}\u{9f}'
    '\u{ffff}กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟ'
    'ภมยรฤลฦวศษสหฬอฮฯะัาำิีึืฺุู\u{ffff}\u{ffff}\u{ffff}\u{ffff}฿'
    'เแโใไๅๆ็่้๊๋์ํ๎๏๐๑๒๓๔๕๖๗๘๙๚๛\u{ffff}\u{ffff}\u{ffff}\u{ffff}';

const Map<int, int> _tis620EncodingOverrides = <int, int>{};

/// The 47 generated codecs in stable Python module-name order.
const List<SingleByteCodec> generatedSingleByteCodecs = <SingleByteCodec>[
  Cp037Codec(),
  Cp1006Codec(),
  Cp1026Codec(),
  Cp1125Codec(),
  Cp1140Codec(),
  Cp1255Codec(),
  Cp1257Codec(),
  Cp1258Codec(),
  Cp273Codec(),
  Cp424Codec(),
  Cp437Codec(),
  Cp500Codec(),
  Cp720Codec(),
  Cp737Codec(),
  Cp775Codec(),
  Cp852Codec(),
  Cp855Codec(),
  Cp856Codec(),
  Cp857Codec(),
  Cp858Codec(),
  Cp860Codec(),
  Cp861Codec(),
  Cp862Codec(),
  Cp863Codec(),
  Cp864Codec(),
  Cp865Codec(),
  Cp866Codec(),
  Cp869Codec(),
  Cp874Codec(),
  Cp875Codec(),
  HpRoman8Codec(),
  Iso88591Codec(),
  Koi8TCodec(),
  Kz1048Codec(),
  MacArabicCodec(),
  MacCroatianCodec(),
  MacCyrillicCodec(),
  MacFarsiCodec(),
  MacGreekCodec(),
  MacIcelandCodec(),
  MacLatin2Codec(),
  MacRomanCodec(),
  MacRomanianCodec(),
  MacTurkishCodec(),
  PalmosCodec(),
  Ptcp154Codec(),
  Tis620Codec(),
];

/// Finds a generated codec by its canonical Python standard-library name.
///
/// Returns `null` for names outside the generated 47-codec inventory.
SingleByteCodec? generatedSingleByteCodec(
  String pythonName, {
  bool allowInvalid = false,
}) {
  switch (pythonName) {
    case 'cp037':
      return Cp037Codec(allowInvalid: allowInvalid);
    case 'cp1006':
      return Cp1006Codec(allowInvalid: allowInvalid);
    case 'cp1026':
      return Cp1026Codec(allowInvalid: allowInvalid);
    case 'cp1125':
      return Cp1125Codec(allowInvalid: allowInvalid);
    case 'cp1140':
      return Cp1140Codec(allowInvalid: allowInvalid);
    case 'cp1255':
      return Cp1255Codec(allowInvalid: allowInvalid);
    case 'cp1257':
      return Cp1257Codec(allowInvalid: allowInvalid);
    case 'cp1258':
      return Cp1258Codec(allowInvalid: allowInvalid);
    case 'cp273':
      return Cp273Codec(allowInvalid: allowInvalid);
    case 'cp424':
      return Cp424Codec(allowInvalid: allowInvalid);
    case 'cp437':
      return Cp437Codec(allowInvalid: allowInvalid);
    case 'cp500':
      return Cp500Codec(allowInvalid: allowInvalid);
    case 'cp720':
      return Cp720Codec(allowInvalid: allowInvalid);
    case 'cp737':
      return Cp737Codec(allowInvalid: allowInvalid);
    case 'cp775':
      return Cp775Codec(allowInvalid: allowInvalid);
    case 'cp852':
      return Cp852Codec(allowInvalid: allowInvalid);
    case 'cp855':
      return Cp855Codec(allowInvalid: allowInvalid);
    case 'cp856':
      return Cp856Codec(allowInvalid: allowInvalid);
    case 'cp857':
      return Cp857Codec(allowInvalid: allowInvalid);
    case 'cp858':
      return Cp858Codec(allowInvalid: allowInvalid);
    case 'cp860':
      return Cp860Codec(allowInvalid: allowInvalid);
    case 'cp861':
      return Cp861Codec(allowInvalid: allowInvalid);
    case 'cp862':
      return Cp862Codec(allowInvalid: allowInvalid);
    case 'cp863':
      return Cp863Codec(allowInvalid: allowInvalid);
    case 'cp864':
      return Cp864Codec(allowInvalid: allowInvalid);
    case 'cp865':
      return Cp865Codec(allowInvalid: allowInvalid);
    case 'cp866':
      return Cp866Codec(allowInvalid: allowInvalid);
    case 'cp869':
      return Cp869Codec(allowInvalid: allowInvalid);
    case 'cp874':
      return Cp874Codec(allowInvalid: allowInvalid);
    case 'cp875':
      return Cp875Codec(allowInvalid: allowInvalid);
    case 'hp_roman8':
      return HpRoman8Codec(allowInvalid: allowInvalid);
    case 'iso8859_1':
      return Iso88591Codec(allowInvalid: allowInvalid);
    case 'koi8_t':
      return Koi8TCodec(allowInvalid: allowInvalid);
    case 'kz1048':
      return Kz1048Codec(allowInvalid: allowInvalid);
    case 'mac_arabic':
      return MacArabicCodec(allowInvalid: allowInvalid);
    case 'mac_croatian':
      return MacCroatianCodec(allowInvalid: allowInvalid);
    case 'mac_cyrillic':
      return MacCyrillicCodec(allowInvalid: allowInvalid);
    case 'mac_farsi':
      return MacFarsiCodec(allowInvalid: allowInvalid);
    case 'mac_greek':
      return MacGreekCodec(allowInvalid: allowInvalid);
    case 'mac_iceland':
      return MacIcelandCodec(allowInvalid: allowInvalid);
    case 'mac_latin2':
      return MacLatin2Codec(allowInvalid: allowInvalid);
    case 'mac_roman':
      return MacRomanCodec(allowInvalid: allowInvalid);
    case 'mac_romanian':
      return MacRomanianCodec(allowInvalid: allowInvalid);
    case 'mac_turkish':
      return MacTurkishCodec(allowInvalid: allowInvalid);
    case 'palmos':
      return PalmosCodec(allowInvalid: allowInvalid);
    case 'ptcp154':
      return Ptcp154Codec(allowInvalid: allowInvalid);
    case 'tis_620':
      return Tis620Codec(allowInvalid: allowInvalid);
    default:
      return null;
  }
}
