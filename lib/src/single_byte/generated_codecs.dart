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
    ' \u{a0}\u{e2}\u{e4}\u{e0}\u{e1}\u{e3}\u{e5}\u{e7}\u{f1}\u{a2}.<(+|&\u{e9}\u{ea}\u{eb}\u{e8}\u{ed}\u{ee}\u{ef}\u{ec}\u{df}!\$*);\u{ac}'
    '-/\u{c2}\u{c4}\u{c0}\u{c1}\u{c3}\u{c5}\u{c7}\u{d1}\u{a6},%_>?\u{f8}\u{c9}\u{ca}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}`:#@\'="'
    '\u{d8}abcdefghi\u{ab}\u{bb}\u{f0}\u{fd}\u{fe}\u{b1}\u{b0}jklmnopqr\u{aa}\u{ba}\u{e6}\u{b8}\u{c6}\u{a4}'
    '\u{b5}~stuvwxyz\u{a1}\u{bf}\u{d0}\u{dd}\u{de}\u{ae}^\u{a3}\u{a5}\u{b7}\u{a9}\u{a7}\u{b6}\u{bc}\u{bd}\u{be}[]\u{af}\u{a8}\u{b4}\u{d7}'
    '{ABCDEFGHI\u{ad}\u{f4}\u{f6}\u{f2}\u{f3}\u{f5}}JKLMNOPQR\u{b9}\u{fb}\u{fc}\u{f9}\u{fa}\u{ff}'
    '\\\u{f7}STUVWXYZ\u{b2}\u{d4}\u{d6}\u{d2}\u{d3}\u{d5}0123456789\u{b3}\u{db}\u{dc}\u{d9}\u{da}\u{9f}';

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
    '\u{a0}\u{6f0}\u{6f1}\u{6f2}\u{6f3}\u{6f4}\u{6f5}\u{6f6}\u{6f7}\u{6f8}\u{6f9}\u{60c}\u{61b}\u{ad}\u{61f}\u{fe81}\u{fe8d}\u{fe8e}\u{fe8e}\u{fe8f}\u{fe91}\u{fb56}\u{fb58}\u{fe93}\u{fe95}\u{fe97}\u{fb66}\u{fb68}\u{fe99}\u{fe9b}\u{fe9d}\u{fe9f}'
    '\u{fb7a}\u{fb7c}\u{fea1}\u{fea3}\u{fea5}\u{fea7}\u{fea9}\u{fb84}\u{feab}\u{fead}\u{fb8c}\u{feaf}\u{fb8a}\u{feb1}\u{feb3}\u{feb5}\u{feb7}\u{feb9}\u{febb}\u{febd}\u{febf}\u{fec1}\u{fec5}\u{fec9}\u{feca}\u{fecb}\u{fecc}\u{fecd}\u{fece}\u{fecf}\u{fed0}\u{fed1}'
    '\u{fed3}\u{fed5}\u{fed7}\u{fed9}\u{fedb}\u{fb92}\u{fb94}\u{fedd}\u{fedf}\u{fee0}\u{fee1}\u{fee3}\u{fb9e}\u{fee5}\u{fee7}\u{fe85}\u{feed}\u{fba6}\u{fba8}\u{fba9}\u{fbaa}\u{fe80}\u{fe89}\u{fe8a}\u{fe8b}\u{fef1}\u{fef2}\u{fef3}\u{fbb0}\u{fbae}\u{fe7c}\u{fe7d}';

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
    ' \u{a0}\u{e2}\u{e4}\u{e0}\u{e1}\u{e3}\u{e5}{\u{f1}\u{c7}.<(+!&\u{e9}\u{ea}\u{eb}\u{e8}\u{ed}\u{ee}\u{ef}\u{ec}\u{df}\u{11e}\u{130}*);^'
    '-/\u{c2}\u{c4}\u{c0}\u{c1}\u{c3}\u{c5}[\u{d1}\u{15f},%_>?\u{f8}\u{c9}\u{ca}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{131}:\u{d6}\u{15e}\'=\u{dc}'
    '\u{d8}abcdefghi\u{ab}\u{bb}}`\u{a6}\u{b1}\u{b0}jklmnopqr\u{aa}\u{ba}\u{e6}\u{b8}\u{c6}\u{a4}'
    '\u{b5}\u{f6}stuvwxyz\u{a1}\u{bf}]\$@\u{ae}\u{a2}\u{a3}\u{a5}\u{b7}\u{a9}\u{a7}\u{b6}\u{bc}\u{bd}\u{be}\u{ac}|\u{af}\u{a8}\u{b4}\u{d7}'
    '\u{e7}ABCDEFGHI\u{ad}\u{f4}~\u{f2}\u{f3}\u{f5}\u{11f}JKLMNOPQR\u{b9}\u{fb}\\\u{f9}\u{fa}\u{ff}'
    '\u{fc}\u{f7}STUVWXYZ\u{b2}\u{d4}#\u{d2}\u{d3}\u{d5}0123456789\u{b3}\u{db}"\u{d9}\u{da}\u{9f}';

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

const String _cp1125DecodingTable =
    '\u{410}\u{411}\u{412}\u{413}\u{414}\u{415}\u{416}\u{417}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{420}\u{421}\u{422}\u{423}\u{424}\u{425}\u{426}\u{427}\u{428}\u{429}\u{42a}\u{42b}\u{42c}\u{42d}\u{42e}\u{42f}'
    '\u{430}\u{431}\u{432}\u{433}\u{434}\u{435}\u{436}\u{437}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{440}\u{441}\u{442}\u{443}\u{444}\u{445}\u{446}\u{447}\u{448}\u{449}\u{44a}\u{44b}\u{44c}\u{44d}\u{44e}\u{44f}\u{401}\u{451}\u{490}\u{491}\u{404}\u{454}\u{406}\u{456}\u{407}\u{457}\u{b7}\u{221a}\u{2116}\u{a4}\u{25a0}\u{a0}';

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
    ' \u{a0}\u{e2}\u{e4}\u{e0}\u{e1}\u{e3}\u{e5}\u{e7}\u{f1}\u{a2}.<(+|&\u{e9}\u{ea}\u{eb}\u{e8}\u{ed}\u{ee}\u{ef}\u{ec}\u{df}!\$*);\u{ac}'
    '-/\u{c2}\u{c4}\u{c0}\u{c1}\u{c3}\u{c5}\u{c7}\u{d1}\u{a6},%_>?\u{f8}\u{c9}\u{ca}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}`:#@\'="'
    '\u{d8}abcdefghi\u{ab}\u{bb}\u{f0}\u{fd}\u{fe}\u{b1}\u{b0}jklmnopqr\u{aa}\u{ba}\u{e6}\u{b8}\u{c6}\u{20ac}'
    '\u{b5}~stuvwxyz\u{a1}\u{bf}\u{d0}\u{dd}\u{de}\u{ae}^\u{a3}\u{a5}\u{b7}\u{a9}\u{a7}\u{b6}\u{bc}\u{bd}\u{be}[]\u{af}\u{a8}\u{b4}\u{d7}'
    '{ABCDEFGHI\u{ad}\u{f4}\u{f6}\u{f2}\u{f3}\u{f5}}JKLMNOPQR\u{b9}\u{fb}\u{fc}\u{f9}\u{fa}\u{ff}'
    '\\\u{f7}STUVWXYZ\u{b2}\u{d4}\u{d6}\u{d2}\u{d3}\u{d5}0123456789\u{b3}\u{db}\u{dc}\u{d9}\u{da}\u{9f}';

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
    '\u{20ac}\u{ffff}\u{201a}\u{192}\u{201e}\u{2026}\u{2020}\u{2021}\u{2c6}\u{2030}\u{ffff}\u{2039}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{2dc}\u{2122}\u{ffff}\u{203a}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\u{a0}\u{a1}\u{a2}\u{a3}\u{20aa}\u{a5}\u{a6}\u{a7}\u{a8}\u{a9}\u{d7}\u{ab}\u{ac}\u{ad}\u{ae}\u{af}\u{b0}\u{b1}\u{b2}\u{b3}\u{b4}\u{b5}\u{b6}\u{b7}\u{b8}\u{b9}\u{f7}\u{bb}\u{bc}\u{bd}\u{be}\u{bf}'
    '\u{5b0}\u{5b1}\u{5b2}\u{5b3}\u{5b4}\u{5b5}\u{5b6}\u{5b7}\u{5b8}\u{5b9}\u{ffff}\u{5bb}\u{5bc}\u{5bd}\u{5be}\u{5bf}\u{5c0}\u{5c1}\u{5c2}\u{5c3}\u{5f0}\u{5f1}\u{5f2}\u{5f3}\u{5f4}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\u{5d0}\u{5d1}\u{5d2}\u{5d3}\u{5d4}\u{5d5}\u{5d6}\u{5d7}\u{5d8}\u{5d9}\u{5da}\u{5db}\u{5dc}\u{5dd}\u{5de}\u{5df}\u{5e0}\u{5e1}\u{5e2}\u{5e3}\u{5e4}\u{5e5}\u{5e6}\u{5e7}\u{5e8}\u{5e9}\u{5ea}\u{ffff}\u{ffff}\u{200e}\u{200f}\u{ffff}';

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
    '\u{20ac}\u{ffff}\u{201a}\u{ffff}\u{201e}\u{2026}\u{2020}\u{2021}\u{ffff}\u{2030}\u{ffff}\u{2039}\u{ffff}\u{a8}\u{2c7}\u{b8}\u{ffff}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{ffff}\u{2122}\u{ffff}\u{203a}\u{ffff}\u{af}\u{2db}\u{ffff}'
    '\u{a0}\u{ffff}\u{a2}\u{a3}\u{a4}\u{ffff}\u{a6}\u{a7}\u{d8}\u{a9}\u{156}\u{ab}\u{ac}\u{ad}\u{ae}\u{c6}\u{b0}\u{b1}\u{b2}\u{b3}\u{b4}\u{b5}\u{b6}\u{b7}\u{f8}\u{b9}\u{157}\u{bb}\u{bc}\u{bd}\u{be}\u{e6}'
    '\u{104}\u{12e}\u{100}\u{106}\u{c4}\u{c5}\u{118}\u{112}\u{10c}\u{c9}\u{179}\u{116}\u{122}\u{136}\u{12a}\u{13b}\u{160}\u{143}\u{145}\u{d3}\u{14c}\u{d5}\u{d6}\u{d7}\u{172}\u{141}\u{15a}\u{16a}\u{dc}\u{17b}\u{17d}\u{df}'
    '\u{105}\u{12f}\u{101}\u{107}\u{e4}\u{e5}\u{119}\u{113}\u{10d}\u{e9}\u{17a}\u{117}\u{123}\u{137}\u{12b}\u{13c}\u{161}\u{144}\u{146}\u{f3}\u{14d}\u{f5}\u{f6}\u{f7}\u{173}\u{142}\u{15b}\u{16b}\u{fc}\u{17c}\u{17e}\u{2d9}';

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
    '\u{20ac}\u{ffff}\u{201a}\u{192}\u{201e}\u{2026}\u{2020}\u{2021}\u{2c6}\u{2030}\u{ffff}\u{2039}\u{152}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{2dc}\u{2122}\u{ffff}\u{203a}\u{153}\u{ffff}\u{ffff}\u{178}'
    '\u{a0}\u{a1}\u{a2}\u{a3}\u{a4}\u{a5}\u{a6}\u{a7}\u{a8}\u{a9}\u{aa}\u{ab}\u{ac}\u{ad}\u{ae}\u{af}\u{b0}\u{b1}\u{b2}\u{b3}\u{b4}\u{b5}\u{b6}\u{b7}\u{b8}\u{b9}\u{ba}\u{bb}\u{bc}\u{bd}\u{be}\u{bf}'
    '\u{c0}\u{c1}\u{c2}\u{102}\u{c4}\u{c5}\u{c6}\u{c7}\u{c8}\u{c9}\u{ca}\u{cb}\u{300}\u{cd}\u{ce}\u{cf}\u{110}\u{d1}\u{309}\u{d3}\u{d4}\u{1a0}\u{d6}\u{d7}\u{d8}\u{d9}\u{da}\u{db}\u{dc}\u{1af}\u{303}\u{df}'
    '\u{e0}\u{e1}\u{e2}\u{103}\u{e4}\u{e5}\u{e6}\u{e7}\u{e8}\u{e9}\u{ea}\u{eb}\u{301}\u{ed}\u{ee}\u{ef}\u{111}\u{f1}\u{323}\u{f3}\u{f4}\u{1a1}\u{f6}\u{f7}\u{f8}\u{f9}\u{fa}\u{fb}\u{fc}\u{1b0}\u{20ab}\u{ff}';

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
    ' \u{a0}\u{e2}{\u{e0}\u{e1}\u{e3}\u{e5}\u{e7}\u{f1}\u{c4}.<(+!&\u{e9}\u{ea}\u{eb}\u{e8}\u{ed}\u{ee}\u{ef}\u{ec}~\u{dc}\$*);^'
    '-/\u{c2}[\u{c0}\u{c1}\u{c3}\u{c5}\u{c7}\u{d1}\u{f6},%_>?\u{f8}\u{c9}\u{ca}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}`:#\u{a7}\'="'
    '\u{d8}abcdefghi\u{ab}\u{bb}\u{f0}\u{fd}\u{fe}\u{b1}\u{b0}jklmnopqr\u{aa}\u{ba}\u{e6}\u{b8}\u{c6}\u{a4}'
    '\u{b5}\u{df}stuvwxyz\u{a1}\u{bf}\u{d0}\u{dd}\u{de}\u{ae}\u{a2}\u{a3}\u{a5}\u{b7}\u{a9}@\u{b6}\u{bc}\u{bd}\u{be}\u{ac}|\u{203e}\u{a8}\u{b4}\u{d7}'
    '\u{e4}ABCDEFGHI\u{ad}\u{f4}\u{a6}\u{f2}\u{f3}\u{f5}\u{fc}JKLMNOPQR\u{b9}\u{fb}}\u{f9}\u{fa}\u{ff}'
    '\u{d6}\u{f7}STUVWXYZ\u{b2}\u{d4}\\\u{d2}\u{d3}\u{d5}0123456789\u{b3}\u{db}]\u{d9}\u{da}\u{9f}';

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
    ' \u{5d0}\u{5d1}\u{5d2}\u{5d3}\u{5d4}\u{5d5}\u{5d6}\u{5d7}\u{5d8}\u{a2}.<(+|&\u{5d9}\u{5da}\u{5db}\u{5dc}\u{5dd}\u{5de}\u{5df}\u{5e0}\u{5e1}!\$*);\u{ac}'
    '-/\u{5e2}\u{5e3}\u{5e4}\u{5e5}\u{5e6}\u{5e7}\u{5e8}\u{5e9}\u{a6},%_>?\u{ffff}\u{5ea}\u{ffff}\u{ffff}\u{a0}\u{ffff}\u{ffff}\u{ffff}\u{2017}`:#@\'="'
    '\u{ffff}abcdefghi\u{ab}\u{bb}\u{ffff}\u{ffff}\u{ffff}\u{b1}\u{b0}jklmnopqr\u{ffff}\u{ffff}\u{ffff}\u{b8}\u{ffff}\u{a4}'
    '\u{b5}~stuvwxyz\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ae}^\u{a3}\u{a5}\u{b7}\u{a9}\u{a7}\u{b6}\u{bc}\u{bd}\u{be}[]\u{af}\u{a8}\u{b4}\u{d7}'
    '{ABCDEFGHI\u{ad}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}}JKLMNOPQR\u{b9}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\\\u{f7}STUVWXYZ\u{b2}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}0123456789\u{b3}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{9f}';

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

const String _cp437DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{e0}\u{e5}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{ec}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{f4}\u{f6}\u{f2}\u{fb}\u{f9}\u{ff}\u{d6}\u{dc}\u{a2}\u{a3}\u{a5}\u{20a7}\u{192}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{aa}\u{ba}\u{bf}\u{2310}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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
    ' \u{a0}\u{e2}\u{e4}\u{e0}\u{e1}\u{e3}\u{e5}\u{e7}\u{f1}[.<(+!&\u{e9}\u{ea}\u{eb}\u{e8}\u{ed}\u{ee}\u{ef}\u{ec}\u{df}]\$*);^'
    '-/\u{c2}\u{c4}\u{c0}\u{c1}\u{c3}\u{c5}\u{c7}\u{d1}\u{a6},%_>?\u{f8}\u{c9}\u{ca}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}`:#@\'="'
    '\u{d8}abcdefghi\u{ab}\u{bb}\u{f0}\u{fd}\u{fe}\u{b1}\u{b0}jklmnopqr\u{aa}\u{ba}\u{e6}\u{b8}\u{c6}\u{a4}'
    '\u{b5}~stuvwxyz\u{a1}\u{bf}\u{d0}\u{dd}\u{de}\u{ae}\u{a2}\u{a3}\u{a5}\u{b7}\u{a9}\u{a7}\u{b6}\u{bc}\u{bd}\u{be}\u{ac}|\u{af}\u{a8}\u{b4}\u{d7}'
    '{ABCDEFGHI\u{ad}\u{f4}\u{f6}\u{f2}\u{f3}\u{f5}}JKLMNOPQR\u{b9}\u{fb}\u{fc}\u{f9}\u{fa}\u{ff}'
    '\\\u{f7}STUVWXYZ\u{b2}\u{d4}\u{d6}\u{d2}\u{d3}\u{d5}0123456789\u{b3}\u{db}\u{dc}\u{d9}\u{da}\u{9f}';

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
    '\u{80}\u{81}\u{e9}\u{e2}\u{84}\u{e0}\u{86}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{8d}\u{8e}\u{8f}\u{90}\u{651}\u{652}\u{f4}\u{a4}\u{640}\u{fb}\u{f9}\u{621}\u{622}\u{623}\u{624}\u{a3}\u{625}\u{626}\u{627}'
    '\u{628}\u{629}\u{62a}\u{62b}\u{62c}\u{62d}\u{62e}\u{62f}\u{630}\u{631}\u{632}\u{633}\u{634}\u{635}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{636}\u{637}\u{638}\u{639}\u{63a}\u{641}\u{b5}\u{642}\u{643}\u{644}\u{645}\u{646}\u{647}\u{648}\u{649}\u{64a}\u{2261}\u{64b}\u{64c}\u{64d}\u{64e}\u{64f}\u{650}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp737DecodingTable =
    '\u{391}\u{392}\u{393}\u{394}\u{395}\u{396}\u{397}\u{398}\u{399}\u{39a}\u{39b}\u{39c}\u{39d}\u{39e}\u{39f}\u{3a0}\u{3a1}\u{3a3}\u{3a4}\u{3a5}\u{3a6}\u{3a7}\u{3a8}\u{3a9}\u{3b1}\u{3b2}\u{3b3}\u{3b4}\u{3b5}\u{3b6}\u{3b7}\u{3b8}'
    '\u{3b9}\u{3ba}\u{3bb}\u{3bc}\u{3bd}\u{3be}\u{3bf}\u{3c0}\u{3c1}\u{3c3}\u{3c2}\u{3c4}\u{3c5}\u{3c6}\u{3c7}\u{3c8}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3c9}\u{3ac}\u{3ad}\u{3ae}\u{3ca}\u{3af}\u{3cc}\u{3cd}\u{3cb}\u{3ce}\u{386}\u{388}\u{389}\u{38a}\u{38c}\u{38e}\u{38f}\u{b1}\u{2265}\u{2264}\u{3aa}\u{3ab}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp775DecodingTable =
    '\u{106}\u{fc}\u{e9}\u{101}\u{e4}\u{123}\u{e5}\u{107}\u{142}\u{113}\u{156}\u{157}\u{12b}\u{179}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{14d}\u{f6}\u{122}\u{a2}\u{15a}\u{15b}\u{d6}\u{dc}\u{f8}\u{a3}\u{d8}\u{d7}\u{a4}'
    '\u{100}\u{12a}\u{f3}\u{17b}\u{17c}\u{17a}\u{201d}\u{a6}\u{a9}\u{ae}\u{ac}\u{bd}\u{bc}\u{141}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{104}\u{10c}\u{118}\u{116}\u{2563}\u{2551}\u{2557}\u{255d}\u{12e}\u{160}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{172}\u{16a}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{17d}\u{105}\u{10d}\u{119}\u{117}\u{12f}\u{161}\u{173}\u{16b}\u{17e}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{d3}\u{df}\u{14c}\u{143}\u{f5}\u{d5}\u{b5}\u{144}\u{136}\u{137}\u{13b}\u{13c}\u{146}\u{112}\u{145}\u{2019}\u{ad}\u{b1}\u{201c}\u{be}\u{b6}\u{a7}\u{f7}\u{201e}\u{b0}\u{2219}\u{b7}\u{b9}\u{b3}\u{b2}\u{25a0}\u{a0}';

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

const String _cp852DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{16f}\u{107}\u{e7}\u{142}\u{eb}\u{150}\u{151}\u{ee}\u{179}\u{c4}\u{106}\u{c9}\u{139}\u{13a}\u{f4}\u{f6}\u{13d}\u{13e}\u{15a}\u{15b}\u{d6}\u{dc}\u{164}\u{165}\u{141}\u{d7}\u{10d}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{104}\u{105}\u{17d}\u{17e}\u{118}\u{119}\u{ac}\u{17a}\u{10c}\u{15f}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{c1}\u{c2}\u{11a}\u{15e}\u{2563}\u{2551}\u{2557}\u{255d}\u{17b}\u{17c}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{102}\u{103}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{a4}\u{111}\u{110}\u{10e}\u{cb}\u{10f}\u{147}\u{cd}\u{ce}\u{11b}\u{2518}\u{250c}\u{2588}\u{2584}\u{162}\u{16e}\u{2580}'
    '\u{d3}\u{df}\u{d4}\u{143}\u{144}\u{148}\u{160}\u{161}\u{154}\u{da}\u{155}\u{170}\u{fd}\u{dd}\u{163}\u{b4}\u{ad}\u{2dd}\u{2db}\u{2c7}\u{2d8}\u{a7}\u{f7}\u{b8}\u{b0}\u{a8}\u{2d9}\u{171}\u{158}\u{159}\u{25a0}\u{a0}';

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

const String _cp855DecodingTable =
    '\u{452}\u{402}\u{453}\u{403}\u{451}\u{401}\u{454}\u{404}\u{455}\u{405}\u{456}\u{406}\u{457}\u{407}\u{458}\u{408}\u{459}\u{409}\u{45a}\u{40a}\u{45b}\u{40b}\u{45c}\u{40c}\u{45e}\u{40e}\u{45f}\u{40f}\u{44e}\u{42e}\u{44a}\u{42a}'
    '\u{430}\u{410}\u{431}\u{411}\u{446}\u{426}\u{434}\u{414}\u{435}\u{415}\u{444}\u{424}\u{433}\u{413}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{445}\u{425}\u{438}\u{418}\u{2563}\u{2551}\u{2557}\u{255d}\u{439}\u{419}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{43a}\u{41a}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{a4}\u{43b}\u{41b}\u{43c}\u{41c}\u{43d}\u{41d}\u{43e}\u{41e}\u{43f}\u{2518}\u{250c}\u{2588}\u{2584}\u{41f}\u{44f}\u{2580}'
    '\u{42f}\u{440}\u{420}\u{441}\u{421}\u{442}\u{422}\u{443}\u{423}\u{436}\u{416}\u{432}\u{412}\u{44c}\u{42c}\u{2116}\u{ad}\u{44b}\u{42b}\u{437}\u{417}\u{448}\u{428}\u{44d}\u{42d}\u{449}\u{429}\u{447}\u{427}\u{a7}\u{25a0}\u{a0}';

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
    '\u{5d0}\u{5d1}\u{5d2}\u{5d3}\u{5d4}\u{5d5}\u{5d6}\u{5d7}\u{5d8}\u{5d9}\u{5da}\u{5db}\u{5dc}\u{5dd}\u{5de}\u{5df}\u{5e0}\u{5e1}\u{5e2}\u{5e3}\u{5e4}\u{5e5}\u{5e6}\u{5e7}\u{5e8}\u{5e9}\u{5ea}\u{ffff}\u{a3}\u{ffff}\u{d7}\u{ffff}'
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ae}\u{ac}\u{bd}\u{bc}\u{ffff}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{ffff}\u{ffff}\u{ffff}\u{a9}\u{2563}\u{2551}\u{2557}\u{255d}\u{a2}\u{a5}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{ffff}\u{ffff}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{a4}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{2518}\u{250c}\u{2588}\u{2584}\u{a6}\u{ffff}\u{2580}'
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{b5}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{af}\u{b4}\u{ad}\u{b1}\u{2017}\u{be}\u{b6}\u{a7}\u{f7}\u{b8}\u{b0}\u{a8}\u{b7}\u{b9}\u{b3}\u{b2}\u{25a0}\u{a0}';

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

const String _cp857DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{e0}\u{e5}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{131}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{f4}\u{f6}\u{f2}\u{fb}\u{f9}\u{130}\u{d6}\u{dc}\u{f8}\u{a3}\u{d8}\u{15e}\u{15f}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{11e}\u{11f}\u{bf}\u{ae}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{c1}\u{c2}\u{c0}\u{a9}\u{2563}\u{2551}\u{2557}\u{255d}\u{a2}\u{a5}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{e3}\u{c3}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{a4}\u{ba}\u{aa}\u{ca}\u{cb}\u{c8}\u{ffff}\u{cd}\u{ce}\u{cf}\u{2518}\u{250c}\u{2588}\u{2584}\u{a6}\u{cc}\u{2580}'
    '\u{d3}\u{df}\u{d4}\u{d2}\u{f5}\u{d5}\u{b5}\u{ffff}\u{d7}\u{da}\u{db}\u{d9}\u{ec}\u{ff}\u{af}\u{b4}\u{ad}\u{b1}\u{ffff}\u{be}\u{b6}\u{a7}\u{f7}\u{b8}\u{b0}\u{a8}\u{b7}\u{b9}\u{b3}\u{b2}\u{25a0}\u{a0}';

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

const String _cp858DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{e0}\u{e5}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{ec}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{f4}\u{f6}\u{f2}\u{fb}\u{f9}\u{ff}\u{d6}\u{dc}\u{f8}\u{a3}\u{d8}\u{d7}\u{192}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{aa}\u{ba}\u{bf}\u{ae}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{c1}\u{c2}\u{c0}\u{a9}\u{2563}\u{2551}\u{2557}\u{255d}\u{a2}\u{a5}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{e3}\u{c3}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{a4}\u{f0}\u{d0}\u{ca}\u{cb}\u{c8}\u{20ac}\u{cd}\u{ce}\u{cf}\u{2518}\u{250c}\u{2588}\u{2584}\u{a6}\u{cc}\u{2580}'
    '\u{d3}\u{df}\u{d4}\u{d2}\u{f5}\u{d5}\u{b5}\u{fe}\u{de}\u{da}\u{db}\u{d9}\u{fd}\u{dd}\u{af}\u{b4}\u{ad}\u{b1}\u{2017}\u{be}\u{b6}\u{a7}\u{f7}\u{b8}\u{b0}\u{a8}\u{b7}\u{b9}\u{b3}\u{b2}\u{25a0}\u{a0}';

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

const String _cp860DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e3}\u{e0}\u{c1}\u{e7}\u{ea}\u{ca}\u{e8}\u{cd}\u{d4}\u{ec}\u{c3}\u{c2}\u{c9}\u{c0}\u{c8}\u{f4}\u{f5}\u{f2}\u{da}\u{f9}\u{cc}\u{d5}\u{dc}\u{a2}\u{a3}\u{d9}\u{20a7}\u{d3}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{aa}\u{ba}\u{bf}\u{d2}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp861DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{e0}\u{e5}\u{e7}\u{ea}\u{eb}\u{e8}\u{d0}\u{f0}\u{de}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{f4}\u{f6}\u{fe}\u{fb}\u{dd}\u{fd}\u{d6}\u{dc}\u{f8}\u{a3}\u{d8}\u{20a7}\u{192}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{c1}\u{cd}\u{d3}\u{da}\u{bf}\u{2310}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp862DecodingTable =
    '\u{5d0}\u{5d1}\u{5d2}\u{5d3}\u{5d4}\u{5d5}\u{5d6}\u{5d7}\u{5d8}\u{5d9}\u{5da}\u{5db}\u{5dc}\u{5dd}\u{5de}\u{5df}\u{5e0}\u{5e1}\u{5e2}\u{5e3}\u{5e4}\u{5e5}\u{5e6}\u{5e7}\u{5e8}\u{5e9}\u{5ea}\u{a2}\u{a3}\u{a5}\u{20a7}\u{192}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{aa}\u{ba}\u{bf}\u{2310}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp863DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{c2}\u{e0}\u{b6}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{2017}\u{c0}\u{a7}\u{c9}\u{c8}\u{ca}\u{f4}\u{cb}\u{cf}\u{fb}\u{f9}\u{a4}\u{d4}\u{dc}\u{a2}\u{a3}\u{d9}\u{db}\u{192}'
    '\u{a6}\u{b4}\u{f3}\u{fa}\u{a8}\u{b8}\u{b3}\u{af}\u{ce}\u{2310}\u{ac}\u{bd}\u{bc}\u{be}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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
    ' !"#\$\u{66a}&\'()*+,-./0123456789:;<=>?'
    '@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_'
    '`abcdefghijklmnopqrstuvwxyz{|}~\u{7f}'
    '\u{b0}\u{b7}\u{2219}\u{221a}\u{2592}\u{2500}\u{2502}\u{253c}\u{2524}\u{252c}\u{251c}\u{2534}\u{2510}\u{250c}\u{2514}\u{2518}\u{3b2}\u{221e}\u{3c6}\u{b1}\u{bd}\u{bc}\u{2248}\u{ab}\u{bb}\u{fef7}\u{fef8}\u{ffff}\u{ffff}\u{fefb}\u{fefc}\u{ffff}'
    '\u{a0}\u{ad}\u{fe82}\u{a3}\u{a4}\u{fe84}\u{ffff}\u{ffff}\u{fe8e}\u{fe8f}\u{fe95}\u{fe99}\u{60c}\u{fe9d}\u{fea1}\u{fea5}\u{660}\u{661}\u{662}\u{663}\u{664}\u{665}\u{666}\u{667}\u{668}\u{669}\u{fed1}\u{61b}\u{feb1}\u{feb5}\u{feb9}\u{61f}'
    '\u{a2}\u{fe80}\u{fe81}\u{fe83}\u{fe85}\u{feca}\u{fe8b}\u{fe8d}\u{fe91}\u{fe93}\u{fe97}\u{fe9b}\u{fe9f}\u{fea3}\u{fea7}\u{fea9}\u{feab}\u{fead}\u{feaf}\u{feb3}\u{feb7}\u{febb}\u{febf}\u{fec1}\u{fec5}\u{fecb}\u{fecf}\u{a6}\u{ac}\u{f7}\u{d7}\u{fec9}'
    '\u{640}\u{fed3}\u{fed7}\u{fedb}\u{fedf}\u{fee3}\u{fee7}\u{feeb}\u{feed}\u{feef}\u{fef3}\u{febd}\u{fecc}\u{fece}\u{fecd}\u{fee1}\u{fe7d}\u{651}\u{fee5}\u{fee9}\u{feec}\u{fef0}\u{fef2}\u{fed0}\u{fed5}\u{fef5}\u{fef6}\u{fedd}\u{fed9}\u{fef1}\u{25a0}\u{ffff}';

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

const String _cp865DecodingTable =
    '\u{c7}\u{fc}\u{e9}\u{e2}\u{e4}\u{e0}\u{e5}\u{e7}\u{ea}\u{eb}\u{e8}\u{ef}\u{ee}\u{ec}\u{c4}\u{c5}\u{c9}\u{e6}\u{c6}\u{f4}\u{f6}\u{f2}\u{fb}\u{f9}\u{ff}\u{d6}\u{dc}\u{f8}\u{a3}\u{d8}\u{20a7}\u{192}'
    '\u{e1}\u{ed}\u{f3}\u{fa}\u{f1}\u{d1}\u{aa}\u{ba}\u{bf}\u{2310}\u{ac}\u{bd}\u{bc}\u{a1}\u{ab}\u{a4}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{3b1}\u{df}\u{393}\u{3c0}\u{3a3}\u{3c3}\u{b5}\u{3c4}\u{3a6}\u{398}\u{3a9}\u{3b4}\u{221e}\u{3c6}\u{3b5}\u{2229}\u{2261}\u{b1}\u{2265}\u{2264}\u{2320}\u{2321}\u{f7}\u{2248}\u{b0}\u{2219}\u{b7}\u{221a}\u{207f}\u{b2}\u{25a0}\u{a0}';

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

const String _cp866DecodingTable =
    '\u{410}\u{411}\u{412}\u{413}\u{414}\u{415}\u{416}\u{417}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{420}\u{421}\u{422}\u{423}\u{424}\u{425}\u{426}\u{427}\u{428}\u{429}\u{42a}\u{42b}\u{42c}\u{42d}\u{42e}\u{42f}'
    '\u{430}\u{431}\u{432}\u{433}\u{434}\u{435}\u{436}\u{437}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{2561}\u{2562}\u{2556}\u{2555}\u{2563}\u{2551}\u{2557}\u{255d}\u{255c}\u{255b}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{255e}\u{255f}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{2567}\u{2568}\u{2564}\u{2565}\u{2559}\u{2558}\u{2552}\u{2553}\u{256b}\u{256a}\u{2518}\u{250c}\u{2588}\u{2584}\u{258c}\u{2590}\u{2580}'
    '\u{440}\u{441}\u{442}\u{443}\u{444}\u{445}\u{446}\u{447}\u{448}\u{449}\u{44a}\u{44b}\u{44c}\u{44d}\u{44e}\u{44f}\u{401}\u{451}\u{404}\u{454}\u{407}\u{457}\u{40e}\u{45e}\u{b0}\u{2219}\u{b7}\u{221a}\u{2116}\u{a4}\u{25a0}\u{a0}';

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
    '\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{386}\u{ffff}\u{b7}\u{ac}\u{a6}\u{2018}\u{2019}\u{388}\u{2015}\u{389}\u{38a}\u{3aa}\u{38c}\u{ffff}\u{ffff}\u{38e}\u{3ab}\u{a9}\u{38f}\u{b2}\u{b3}\u{3ac}\u{a3}\u{3ad}\u{3ae}\u{3af}'
    '\u{3ca}\u{390}\u{3cc}\u{3cd}\u{391}\u{392}\u{393}\u{394}\u{395}\u{396}\u{397}\u{bd}\u{398}\u{399}\u{ab}\u{bb}\u{2591}\u{2592}\u{2593}\u{2502}\u{2524}\u{39a}\u{39b}\u{39c}\u{39d}\u{2563}\u{2551}\u{2557}\u{255d}\u{39e}\u{39f}\u{2510}'
    '\u{2514}\u{2534}\u{252c}\u{251c}\u{2500}\u{253c}\u{3a0}\u{3a1}\u{255a}\u{2554}\u{2569}\u{2566}\u{2560}\u{2550}\u{256c}\u{3a3}\u{3a4}\u{3a5}\u{3a6}\u{3a7}\u{3a8}\u{3a9}\u{3b1}\u{3b2}\u{3b3}\u{2518}\u{250c}\u{2588}\u{2584}\u{3b4}\u{3b5}\u{2580}'
    '\u{3b6}\u{3b7}\u{3b8}\u{3b9}\u{3ba}\u{3bb}\u{3bc}\u{3bd}\u{3be}\u{3bf}\u{3c0}\u{3c1}\u{3c3}\u{3c2}\u{3c4}\u{384}\u{ad}\u{b1}\u{3c5}\u{3c6}\u{3c7}\u{a7}\u{3c8}\u{385}\u{b0}\u{a8}\u{3c9}\u{3cb}\u{3b0}\u{3ce}\u{25a0}\u{a0}';

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
    '\u{20ac}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{2026}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\u{a0}\u{e01}\u{e02}\u{e03}\u{e04}\u{e05}\u{e06}\u{e07}\u{e08}\u{e09}\u{e0a}\u{e0b}\u{e0c}\u{e0d}\u{e0e}\u{e0f}\u{e10}\u{e11}\u{e12}\u{e13}\u{e14}\u{e15}\u{e16}\u{e17}\u{e18}\u{e19}\u{e1a}\u{e1b}\u{e1c}\u{e1d}\u{e1e}\u{e1f}'
    '\u{e20}\u{e21}\u{e22}\u{e23}\u{e24}\u{e25}\u{e26}\u{e27}\u{e28}\u{e29}\u{e2a}\u{e2b}\u{e2c}\u{e2d}\u{e2e}\u{e2f}\u{e30}\u{e31}\u{e32}\u{e33}\u{e34}\u{e35}\u{e36}\u{e37}\u{e38}\u{e39}\u{e3a}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{e3f}'
    '\u{e40}\u{e41}\u{e42}\u{e43}\u{e44}\u{e45}\u{e46}\u{e47}\u{e48}\u{e49}\u{e4a}\u{e4b}\u{e4c}\u{e4d}\u{e4e}\u{e4f}\u{e50}\u{e51}\u{e52}\u{e53}\u{e54}\u{e55}\u{e56}\u{e57}\u{e58}\u{e59}\u{e5a}\u{e5b}\u{ffff}\u{ffff}\u{ffff}\u{ffff}';

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
    ' \u{391}\u{392}\u{393}\u{394}\u{395}\u{396}\u{397}\u{398}\u{399}[.<(+!&\u{39a}\u{39b}\u{39c}\u{39d}\u{39e}\u{39f}\u{3a0}\u{3a1}\u{3a3}]\$*);^'
    '-/\u{3a4}\u{3a5}\u{3a6}\u{3a7}\u{3a8}\u{3a9}\u{3aa}\u{3ab}|,%_>?\u{a8}\u{386}\u{388}\u{389}\u{a0}\u{38a}\u{38c}\u{38e}\u{38f}`:#@\'="'
    '\u{385}abcdefghi\u{3b1}\u{3b2}\u{3b3}\u{3b4}\u{3b5}\u{3b6}\u{b0}jklmnopqr\u{3b7}\u{3b8}\u{3b9}\u{3ba}\u{3bb}\u{3bc}'
    '\u{b4}~stuvwxyz\u{3bd}\u{3be}\u{3bf}\u{3c0}\u{3c1}\u{3c3}\u{a3}\u{3ac}\u{3ad}\u{3ae}\u{3ca}\u{3af}\u{3cc}\u{3cd}\u{3cb}\u{3ce}\u{3c2}\u{3c4}\u{3c5}\u{3c6}\u{3c7}\u{3c8}'
    '{ABCDEFGHI\u{ad}\u{3c9}\u{390}\u{3b0}\u{2018}\u{2015}}JKLMNOPQR\u{b1}\u{bd}\u{1a}\u{387}\u{2019}\u{a6}'
    '\\\u{1a}STUVWXYZ\u{b2}\u{a7}\u{1a}\u{1a}\u{ab}\u{ac}0123456789\u{b3}\u{a9}\u{1a}\u{1a}\u{bb}\u{9f}';

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
    '\u{a0}\u{c0}\u{c2}\u{c8}\u{ca}\u{cb}\u{ce}\u{cf}\u{b4}\u{2cb}\u{2c6}\u{a8}\u{2dc}\u{d9}\u{db}\u{20a4}\u{af}\u{dd}\u{fd}\u{b0}\u{c7}\u{e7}\u{d1}\u{f1}\u{a1}\u{bf}\u{a4}\u{a3}\u{a5}\u{a7}\u{192}\u{a2}'
    '\u{e2}\u{ea}\u{f4}\u{fb}\u{e1}\u{e9}\u{f3}\u{fa}\u{e0}\u{e8}\u{f2}\u{f9}\u{e4}\u{eb}\u{f6}\u{fc}\u{c5}\u{ee}\u{d8}\u{c6}\u{e5}\u{ed}\u{f8}\u{e6}\u{c4}\u{ec}\u{d6}\u{dc}\u{c9}\u{ef}\u{df}\u{d4}'
    '\u{c1}\u{c3}\u{e3}\u{d0}\u{f0}\u{cd}\u{cc}\u{d3}\u{d2}\u{d5}\u{f5}\u{160}\u{161}\u{da}\u{178}\u{ff}\u{de}\u{fe}\u{b7}\u{b5}\u{b6}\u{be}\u{2014}\u{bc}\u{bd}\u{aa}\u{ba}\u{ab}\u{25a0}\u{bb}\u{b1}\u{ffff}';

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
    '\u{a0}\u{a1}\u{a2}\u{a3}\u{a4}\u{a5}\u{a6}\u{a7}\u{a8}\u{a9}\u{aa}\u{ab}\u{ac}\u{ad}\u{ae}\u{af}\u{b0}\u{b1}\u{b2}\u{b3}\u{b4}\u{b5}\u{b6}\u{b7}\u{b8}\u{b9}\u{ba}\u{bb}\u{bc}\u{bd}\u{be}\u{bf}'
    '\u{c0}\u{c1}\u{c2}\u{c3}\u{c4}\u{c5}\u{c6}\u{c7}\u{c8}\u{c9}\u{ca}\u{cb}\u{cc}\u{cd}\u{ce}\u{cf}\u{d0}\u{d1}\u{d2}\u{d3}\u{d4}\u{d5}\u{d6}\u{d7}\u{d8}\u{d9}\u{da}\u{db}\u{dc}\u{dd}\u{de}\u{df}'
    '\u{e0}\u{e1}\u{e2}\u{e3}\u{e4}\u{e5}\u{e6}\u{e7}\u{e8}\u{e9}\u{ea}\u{eb}\u{ec}\u{ed}\u{ee}\u{ef}\u{f0}\u{f1}\u{f2}\u{f3}\u{f4}\u{f5}\u{f6}\u{f7}\u{f8}\u{f9}\u{fa}\u{fb}\u{fc}\u{fd}\u{fe}\u{ff}';

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
    '\u{49b}\u{493}\u{201a}\u{492}\u{201e}\u{2026}\u{2020}\u{2021}\u{ffff}\u{2030}\u{4b3}\u{2039}\u{4b2}\u{4b7}\u{4b6}\u{ffff}\u{49a}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{ffff}\u{2122}\u{ffff}\u{203a}\u{ffff}\u{ffff}\u{ffff}\u{ffff}'
    '\u{ffff}\u{4ef}\u{4ee}\u{451}\u{a4}\u{4e3}\u{a6}\u{a7}\u{ffff}\u{ffff}\u{ffff}\u{ab}\u{ac}\u{ad}\u{ae}\u{ffff}\u{b0}\u{b1}\u{b2}\u{401}\u{ffff}\u{4e2}\u{b6}\u{b7}\u{ffff}\u{2116}\u{ffff}\u{bb}\u{ffff}\u{ffff}\u{ffff}\u{a9}'
    '\u{44e}\u{430}\u{431}\u{446}\u{434}\u{435}\u{444}\u{433}\u{445}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{44f}\u{440}\u{441}\u{442}\u{443}\u{436}\u{432}\u{44c}\u{44b}\u{437}\u{448}\u{44d}\u{449}\u{447}\u{44a}'
    '\u{42e}\u{410}\u{411}\u{426}\u{414}\u{415}\u{424}\u{413}\u{425}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{42f}\u{420}\u{421}\u{422}\u{423}\u{416}\u{412}\u{42c}\u{42b}\u{417}\u{428}\u{42d}\u{429}\u{427}\u{42a}';

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

const String _kz1048DecodingTable =
    '\u{402}\u{403}\u{201a}\u{453}\u{201e}\u{2026}\u{2020}\u{2021}\u{20ac}\u{2030}\u{409}\u{2039}\u{40a}\u{49a}\u{4ba}\u{40f}\u{452}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{ffff}\u{2122}\u{459}\u{203a}\u{45a}\u{49b}\u{4bb}\u{45f}'
    '\u{a0}\u{4b0}\u{4b1}\u{4d8}\u{a4}\u{4e8}\u{a6}\u{a7}\u{401}\u{a9}\u{492}\u{ab}\u{ac}\u{ad}\u{ae}\u{4ae}\u{b0}\u{b1}\u{406}\u{456}\u{4e9}\u{b5}\u{b6}\u{b7}\u{451}\u{2116}\u{493}\u{bb}\u{4d9}\u{4a2}\u{4a3}\u{4af}'
    '\u{410}\u{411}\u{412}\u{413}\u{414}\u{415}\u{416}\u{417}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{420}\u{421}\u{422}\u{423}\u{424}\u{425}\u{426}\u{427}\u{428}\u{429}\u{42a}\u{42b}\u{42c}\u{42d}\u{42e}\u{42f}'
    '\u{430}\u{431}\u{432}\u{433}\u{434}\u{435}\u{436}\u{437}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{440}\u{441}\u{442}\u{443}\u{444}\u{445}\u{446}\u{447}\u{448}\u{449}\u{44a}\u{44b}\u{44c}\u{44d}\u{44e}\u{44f}';

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

const String _macArabicDecodingTable =
    '\u{c4}\u{a0}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{6ba}\u{ab}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{2026}\u{ee}\u{ef}\u{f1}\u{f3}\u{bb}\u{f4}\u{f6}\u{f7}\u{fa}\u{f9}\u{fb}\u{fc}'
    ' !"#\$\u{66a}&\'()*+\u{60c}-./\u{660}\u{661}\u{662}\u{663}\u{664}\u{665}\u{666}\u{667}\u{668}\u{669}:\u{61b}<=>\u{61f}'
    '\u{274a}\u{621}\u{622}\u{623}\u{624}\u{625}\u{626}\u{627}\u{628}\u{629}\u{62a}\u{62b}\u{62c}\u{62d}\u{62e}\u{62f}\u{630}\u{631}\u{632}\u{633}\u{634}\u{635}\u{636}\u{637}\u{638}\u{639}\u{63a}[\\]^_'
    '\u{640}\u{641}\u{642}\u{643}\u{644}\u{645}\u{646}\u{647}\u{648}\u{649}\u{64a}\u{64b}\u{64c}\u{64d}\u{64e}\u{64f}\u{650}\u{651}\u{652}\u{67e}\u{679}\u{686}\u{6d5}\u{6a4}\u{6af}\u{688}\u{691}{|}\u{698}\u{6d2}';

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

const String _macCroatianDecodingTable =
    '\u{c4}\u{c5}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{e3}\u{e5}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{ec}\u{ee}\u{ef}\u{f1}\u{f3}\u{f2}\u{f4}\u{f6}\u{f5}\u{fa}\u{f9}\u{fb}\u{fc}'
    '\u{2020}\u{b0}\u{a2}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{160}\u{2122}\u{b4}\u{a8}\u{2260}\u{17d}\u{d8}\u{221e}\u{b1}\u{2264}\u{2265}\u{2206}\u{b5}\u{2202}\u{2211}\u{220f}\u{161}\u{222b}\u{aa}\u{ba}\u{3a9}\u{17e}\u{f8}'
    '\u{bf}\u{a1}\u{ac}\u{221a}\u{192}\u{2248}\u{106}\u{ab}\u{10c}\u{2026}\u{a0}\u{c0}\u{c3}\u{d5}\u{152}\u{153}\u{110}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{f8ff}\u{a9}\u{2044}\u{20ac}\u{2039}\u{203a}\u{c6}\u{bb}'
    '\u{2013}\u{b7}\u{201a}\u{201e}\u{2030}\u{c2}\u{107}\u{c1}\u{10d}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{d3}\u{d4}\u{111}\u{d2}\u{da}\u{db}\u{d9}\u{131}\u{2c6}\u{2dc}\u{af}\u{3c0}\u{cb}\u{2da}\u{b8}\u{ca}\u{e6}\u{2c7}';

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

const String _macCyrillicDecodingTable =
    '\u{410}\u{411}\u{412}\u{413}\u{414}\u{415}\u{416}\u{417}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{420}\u{421}\u{422}\u{423}\u{424}\u{425}\u{426}\u{427}\u{428}\u{429}\u{42a}\u{42b}\u{42c}\u{42d}\u{42e}\u{42f}'
    '\u{2020}\u{b0}\u{490}\u{a3}\u{a7}\u{2022}\u{b6}\u{406}\u{ae}\u{a9}\u{2122}\u{402}\u{452}\u{2260}\u{403}\u{453}\u{221e}\u{b1}\u{2264}\u{2265}\u{456}\u{b5}\u{491}\u{408}\u{404}\u{454}\u{407}\u{457}\u{409}\u{459}\u{40a}\u{45a}'
    '\u{458}\u{405}\u{ac}\u{221a}\u{192}\u{2248}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{40b}\u{45b}\u{40c}\u{45c}\u{455}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{201e}\u{40e}\u{45e}\u{40f}\u{45f}\u{2116}\u{401}\u{451}\u{44f}'
    '\u{430}\u{431}\u{432}\u{433}\u{434}\u{435}\u{436}\u{437}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{440}\u{441}\u{442}\u{443}\u{444}\u{445}\u{446}\u{447}\u{448}\u{449}\u{44a}\u{44b}\u{44c}\u{44d}\u{44e}\u{20ac}';

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

const String _macFarsiDecodingTable =
    '\u{c4}\u{a0}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{6ba}\u{ab}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{2026}\u{ee}\u{ef}\u{f1}\u{f3}\u{bb}\u{f4}\u{f6}\u{f7}\u{fa}\u{f9}\u{fb}\u{fc}'
    ' !"#\$\u{66a}&\'()*+\u{60c}-./\u{6f0}\u{6f1}\u{6f2}\u{6f3}\u{6f4}\u{6f5}\u{6f6}\u{6f7}\u{6f8}\u{6f9}:\u{61b}<=>\u{61f}'
    '\u{274a}\u{621}\u{622}\u{623}\u{624}\u{625}\u{626}\u{627}\u{628}\u{629}\u{62a}\u{62b}\u{62c}\u{62d}\u{62e}\u{62f}\u{630}\u{631}\u{632}\u{633}\u{634}\u{635}\u{636}\u{637}\u{638}\u{639}\u{63a}[\\]^_'
    '\u{640}\u{641}\u{642}\u{643}\u{644}\u{645}\u{646}\u{647}\u{648}\u{649}\u{64a}\u{64b}\u{64c}\u{64d}\u{64e}\u{64f}\u{650}\u{651}\u{652}\u{67e}\u{679}\u{686}\u{6d5}\u{6a4}\u{6af}\u{688}\u{691}{|}\u{698}\u{6d2}';

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

const String _macGreekDecodingTable =
    '\u{c4}\u{b9}\u{b2}\u{c9}\u{b3}\u{d6}\u{dc}\u{385}\u{e0}\u{e2}\u{e4}\u{384}\u{a8}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{a3}\u{2122}\u{ee}\u{ef}\u{2022}\u{bd}\u{2030}\u{f4}\u{f6}\u{a6}\u{20ac}\u{f9}\u{fb}\u{fc}'
    '\u{2020}\u{393}\u{394}\u{398}\u{39b}\u{39e}\u{3a0}\u{df}\u{ae}\u{a9}\u{3a3}\u{3aa}\u{a7}\u{2260}\u{b0}\u{b7}\u{391}\u{b1}\u{2264}\u{2265}\u{a5}\u{392}\u{395}\u{396}\u{397}\u{399}\u{39a}\u{39c}\u{3a6}\u{3ab}\u{3a8}\u{3a9}'
    '\u{3ac}\u{39d}\u{ac}\u{39f}\u{3a1}\u{2248}\u{3a4}\u{ab}\u{bb}\u{2026}\u{a0}\u{3a5}\u{3a7}\u{386}\u{388}\u{153}\u{2013}\u{2015}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{389}\u{38a}\u{38c}\u{38e}\u{3ad}\u{3ae}\u{3af}\u{3cc}\u{38f}'
    '\u{3cd}\u{3b1}\u{3b2}\u{3c8}\u{3b4}\u{3b5}\u{3c6}\u{3b3}\u{3b7}\u{3b9}\u{3be}\u{3ba}\u{3bb}\u{3bc}\u{3bd}\u{3bf}\u{3c0}\u{3ce}\u{3c1}\u{3c3}\u{3c4}\u{3b8}\u{3c9}\u{3c2}\u{3c7}\u{3c5}\u{3b6}\u{3ca}\u{3cb}\u{390}\u{3b0}\u{ad}';

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

const String _macIcelandDecodingTable =
    '\u{c4}\u{c5}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{e3}\u{e5}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{ec}\u{ee}\u{ef}\u{f1}\u{f3}\u{f2}\u{f4}\u{f6}\u{f5}\u{fa}\u{f9}\u{fb}\u{fc}'
    '\u{dd}\u{b0}\u{a2}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{a9}\u{2122}\u{b4}\u{a8}\u{2260}\u{c6}\u{d8}\u{221e}\u{b1}\u{2264}\u{2265}\u{a5}\u{b5}\u{2202}\u{2211}\u{220f}\u{3c0}\u{222b}\u{aa}\u{ba}\u{3a9}\u{e6}\u{f8}'
    '\u{bf}\u{a1}\u{ac}\u{221a}\u{192}\u{2248}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{c0}\u{c3}\u{d5}\u{152}\u{153}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{ff}\u{178}\u{2044}\u{20ac}\u{d0}\u{f0}\u{de}\u{fe}'
    '\u{fd}\u{b7}\u{201a}\u{201e}\u{2030}\u{c2}\u{ca}\u{c1}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{d3}\u{d4}\u{f8ff}\u{d2}\u{da}\u{db}\u{d9}\u{131}\u{2c6}\u{2dc}\u{af}\u{2d8}\u{2d9}\u{2da}\u{b8}\u{2dd}\u{2db}\u{2c7}';

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

const String _macLatin2DecodingTable =
    '\u{c4}\u{100}\u{101}\u{c9}\u{104}\u{d6}\u{dc}\u{e1}\u{105}\u{10c}\u{e4}\u{10d}\u{106}\u{107}\u{e9}\u{179}\u{17a}\u{10e}\u{ed}\u{10f}\u{112}\u{113}\u{116}\u{f3}\u{117}\u{f4}\u{f6}\u{f5}\u{fa}\u{11a}\u{11b}\u{fc}'
    '\u{2020}\u{b0}\u{118}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{a9}\u{2122}\u{119}\u{a8}\u{2260}\u{123}\u{12e}\u{12f}\u{12a}\u{2264}\u{2265}\u{12b}\u{136}\u{2202}\u{2211}\u{142}\u{13b}\u{13c}\u{13d}\u{13e}\u{139}\u{13a}\u{145}'
    '\u{146}\u{143}\u{ac}\u{221a}\u{144}\u{147}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{148}\u{150}\u{d5}\u{151}\u{14c}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{14d}\u{154}\u{155}\u{158}\u{2039}\u{203a}\u{159}\u{156}'
    '\u{157}\u{160}\u{201a}\u{201e}\u{161}\u{15a}\u{15b}\u{c1}\u{164}\u{165}\u{cd}\u{17d}\u{17e}\u{16a}\u{d3}\u{d4}\u{16b}\u{16e}\u{da}\u{16f}\u{170}\u{171}\u{172}\u{173}\u{dd}\u{fd}\u{137}\u{17b}\u{141}\u{17c}\u{122}\u{2c7}';

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

const String _macRomanDecodingTable =
    '\u{c4}\u{c5}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{e3}\u{e5}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{ec}\u{ee}\u{ef}\u{f1}\u{f3}\u{f2}\u{f4}\u{f6}\u{f5}\u{fa}\u{f9}\u{fb}\u{fc}'
    '\u{2020}\u{b0}\u{a2}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{a9}\u{2122}\u{b4}\u{a8}\u{2260}\u{c6}\u{d8}\u{221e}\u{b1}\u{2264}\u{2265}\u{a5}\u{b5}\u{2202}\u{2211}\u{220f}\u{3c0}\u{222b}\u{aa}\u{ba}\u{3a9}\u{e6}\u{f8}'
    '\u{bf}\u{a1}\u{ac}\u{221a}\u{192}\u{2248}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{c0}\u{c3}\u{d5}\u{152}\u{153}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{ff}\u{178}\u{2044}\u{20ac}\u{2039}\u{203a}\u{fb01}\u{fb02}'
    '\u{2021}\u{b7}\u{201a}\u{201e}\u{2030}\u{c2}\u{ca}\u{c1}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{d3}\u{d4}\u{f8ff}\u{d2}\u{da}\u{db}\u{d9}\u{131}\u{2c6}\u{2dc}\u{af}\u{2d8}\u{2d9}\u{2da}\u{b8}\u{2dd}\u{2db}\u{2c7}';

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

const String _macRomanianDecodingTable =
    '\u{c4}\u{c5}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{e3}\u{e5}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{ec}\u{ee}\u{ef}\u{f1}\u{f3}\u{f2}\u{f4}\u{f6}\u{f5}\u{fa}\u{f9}\u{fb}\u{fc}'
    '\u{2020}\u{b0}\u{a2}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{a9}\u{2122}\u{b4}\u{a8}\u{2260}\u{102}\u{218}\u{221e}\u{b1}\u{2264}\u{2265}\u{a5}\u{b5}\u{2202}\u{2211}\u{220f}\u{3c0}\u{222b}\u{aa}\u{ba}\u{3a9}\u{103}\u{219}'
    '\u{bf}\u{a1}\u{ac}\u{221a}\u{192}\u{2248}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{c0}\u{c3}\u{d5}\u{152}\u{153}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{ff}\u{178}\u{2044}\u{20ac}\u{2039}\u{203a}\u{21a}\u{21b}'
    '\u{2021}\u{b7}\u{201a}\u{201e}\u{2030}\u{c2}\u{ca}\u{c1}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{d3}\u{d4}\u{f8ff}\u{d2}\u{da}\u{db}\u{d9}\u{131}\u{2c6}\u{2dc}\u{af}\u{2d8}\u{2d9}\u{2da}\u{b8}\u{2dd}\u{2db}\u{2c7}';

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

const String _macTurkishDecodingTable =
    '\u{c4}\u{c5}\u{c7}\u{c9}\u{d1}\u{d6}\u{dc}\u{e1}\u{e0}\u{e2}\u{e4}\u{e3}\u{e5}\u{e7}\u{e9}\u{e8}\u{ea}\u{eb}\u{ed}\u{ec}\u{ee}\u{ef}\u{f1}\u{f3}\u{f2}\u{f4}\u{f6}\u{f5}\u{fa}\u{f9}\u{fb}\u{fc}'
    '\u{2020}\u{b0}\u{a2}\u{a3}\u{a7}\u{2022}\u{b6}\u{df}\u{ae}\u{a9}\u{2122}\u{b4}\u{a8}\u{2260}\u{c6}\u{d8}\u{221e}\u{b1}\u{2264}\u{2265}\u{a5}\u{b5}\u{2202}\u{2211}\u{220f}\u{3c0}\u{222b}\u{aa}\u{ba}\u{3a9}\u{e6}\u{f8}'
    '\u{bf}\u{a1}\u{ac}\u{221a}\u{192}\u{2248}\u{2206}\u{ab}\u{bb}\u{2026}\u{a0}\u{c0}\u{c3}\u{d5}\u{152}\u{153}\u{2013}\u{2014}\u{201c}\u{201d}\u{2018}\u{2019}\u{f7}\u{25ca}\u{ff}\u{178}\u{11e}\u{11f}\u{130}\u{131}\u{15e}\u{15f}'
    '\u{2021}\u{b7}\u{201a}\u{201e}\u{2030}\u{c2}\u{ca}\u{c1}\u{cb}\u{c8}\u{cd}\u{ce}\u{cf}\u{cc}\u{d3}\u{d4}\u{f8ff}\u{d2}\u{da}\u{db}\u{d9}\u{f8a0}\u{2c6}\u{2dc}\u{af}\u{2d8}\u{2d9}\u{2da}\u{b8}\u{2dd}\u{2db}\u{2c7}';

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
    '\u{20ac}\u{81}\u{201a}\u{192}\u{201e}\u{2026}\u{2020}\u{2021}\u{2c6}\u{2030}\u{160}\u{2039}\u{152}\u{2666}\u{2663}\u{2665}\u{2660}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{2dc}\u{2122}\u{161}\u{203a}\u{153}\u{9d}\u{9e}\u{178}'
    '\u{a0}\u{a1}\u{a2}\u{a3}\u{a4}\u{a5}\u{a6}\u{a7}\u{a8}\u{a9}\u{aa}\u{ab}\u{ac}\u{ad}\u{ae}\u{af}\u{b0}\u{b1}\u{b2}\u{b3}\u{b4}\u{b5}\u{b6}\u{b7}\u{b8}\u{b9}\u{ba}\u{bb}\u{bc}\u{bd}\u{be}\u{bf}'
    '\u{c0}\u{c1}\u{c2}\u{c3}\u{c4}\u{c5}\u{c6}\u{c7}\u{c8}\u{c9}\u{ca}\u{cb}\u{cc}\u{cd}\u{ce}\u{cf}\u{d0}\u{d1}\u{d2}\u{d3}\u{d4}\u{d5}\u{d6}\u{d7}\u{d8}\u{d9}\u{da}\u{db}\u{dc}\u{dd}\u{de}\u{df}'
    '\u{e0}\u{e1}\u{e2}\u{e3}\u{e4}\u{e5}\u{e6}\u{e7}\u{e8}\u{e9}\u{ea}\u{eb}\u{ec}\u{ed}\u{ee}\u{ef}\u{f0}\u{f1}\u{f2}\u{f3}\u{f4}\u{f5}\u{f6}\u{f7}\u{f8}\u{f9}\u{fa}\u{fb}\u{fc}\u{fd}\u{fe}\u{ff}';

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

const String _ptcp154DecodingTable =
    '\u{496}\u{492}\u{4ee}\u{493}\u{201e}\u{2026}\u{4b6}\u{4ae}\u{4b2}\u{4af}\u{4a0}\u{4e2}\u{4a2}\u{49a}\u{4ba}\u{4b8}\u{497}\u{2018}\u{2019}\u{201c}\u{201d}\u{2022}\u{2013}\u{2014}\u{4b3}\u{4b7}\u{4a1}\u{4e3}\u{4a3}\u{49b}\u{4bb}\u{4b9}'
    '\u{a0}\u{40e}\u{45e}\u{408}\u{4e8}\u{498}\u{4b0}\u{a7}\u{401}\u{a9}\u{4d8}\u{ab}\u{ac}\u{4ef}\u{ae}\u{49c}\u{b0}\u{4b1}\u{406}\u{456}\u{499}\u{4e9}\u{b6}\u{b7}\u{451}\u{2116}\u{4d9}\u{bb}\u{458}\u{4aa}\u{4ab}\u{49d}'
    '\u{410}\u{411}\u{412}\u{413}\u{414}\u{415}\u{416}\u{417}\u{418}\u{419}\u{41a}\u{41b}\u{41c}\u{41d}\u{41e}\u{41f}\u{420}\u{421}\u{422}\u{423}\u{424}\u{425}\u{426}\u{427}\u{428}\u{429}\u{42a}\u{42b}\u{42c}\u{42d}\u{42e}\u{42f}'
    '\u{430}\u{431}\u{432}\u{433}\u{434}\u{435}\u{436}\u{437}\u{438}\u{439}\u{43a}\u{43b}\u{43c}\u{43d}\u{43e}\u{43f}\u{440}\u{441}\u{442}\u{443}\u{444}\u{445}\u{446}\u{447}\u{448}\u{449}\u{44a}\u{44b}\u{44c}\u{44d}\u{44e}\u{44f}';

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
    '\u{ffff}\u{e01}\u{e02}\u{e03}\u{e04}\u{e05}\u{e06}\u{e07}\u{e08}\u{e09}\u{e0a}\u{e0b}\u{e0c}\u{e0d}\u{e0e}\u{e0f}\u{e10}\u{e11}\u{e12}\u{e13}\u{e14}\u{e15}\u{e16}\u{e17}\u{e18}\u{e19}\u{e1a}\u{e1b}\u{e1c}\u{e1d}\u{e1e}\u{e1f}'
    '\u{e20}\u{e21}\u{e22}\u{e23}\u{e24}\u{e25}\u{e26}\u{e27}\u{e28}\u{e29}\u{e2a}\u{e2b}\u{e2c}\u{e2d}\u{e2e}\u{e2f}\u{e30}\u{e31}\u{e32}\u{e33}\u{e34}\u{e35}\u{e36}\u{e37}\u{e38}\u{e39}\u{e3a}\u{ffff}\u{ffff}\u{ffff}\u{ffff}\u{e3f}'
    '\u{e40}\u{e41}\u{e42}\u{e43}\u{e44}\u{e45}\u{e46}\u{e47}\u{e48}\u{e49}\u{e4a}\u{e4b}\u{e4c}\u{e4d}\u{e4e}\u{e4f}\u{e50}\u{e51}\u{e52}\u{e53}\u{e54}\u{e55}\u{e56}\u{e57}\u{e58}\u{e59}\u{e5a}\u{e5b}\u{ffff}\u{ffff}\u{ffff}\u{ffff}';

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
