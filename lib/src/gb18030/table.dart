part of 'gb18030.dart';

// GENERATED — do not edit by hand.
// Source: WHATWG Encoding Standard indexes, via
// tool/generate_whatwg_multibyte_tables.py.
// index gb18030 identifier:
// ff1c9a923b5d24f9761b3a2de2c0f07b395f9f6f36519508944de4f0415be81c
// All 23940 two-byte mappings reuse gbk.dart. These
// 20 entries are the GB18030-2022 decode changes.
int? _twoByteDecodeOverlay(int value) {
  switch (value) {
    case 0xA3A0:
      return 0x3000;
    case 0xA6D9:
      return 0xFE10;
    case 0xA6DA:
      return 0xFE12;
    case 0xA6DB:
      return 0xFE11;
    case 0xA6DC:
      return 0xFE13;
    case 0xA6DD:
      return 0xFE14;
    case 0xA6DE:
      return 0xFE15;
    case 0xA6DF:
      return 0xFE16;
    case 0xA6EC:
      return 0xFE17;
    case 0xA6ED:
      return 0xFE18;
    case 0xA6F3:
      return 0xFE19;
    case 0xA8BC:
      return 0x1E3F;
    case 0xFE59:
      return 0x9FB4;
    case 0xFE61:
      return 0x9FB5;
    case 0xFE66:
      return 0x9FB6;
    case 0xFE67:
      return 0x9FB7;
    case 0xFE6D:
      return 0x9FB8;
    case 0xFE7E:
      return 0x9FB9;
    case 0xFE90:
      return 0x9FBA;
    case 0xFEA0:
      return 0x9FBB;
  }
  return null;
}

// Code points added to the two-byte index by GB18030-2022. Existing
// unchanged encodings are looked up in gbk.dart and validated by
// decoding them through the WHATWG overlay.
// 19 entries.
int? _twoByteEncodeOverlay(int value) {
  switch (value) {
    case 0x1E3F:
      return 0xA8BC;
    case 0x9FB4:
      return 0xFE59;
    case 0x9FB5:
      return 0xFE61;
    case 0x9FB6:
      return 0xFE66;
    case 0x9FB7:
      return 0xFE67;
    case 0x9FB8:
      return 0xFE6D;
    case 0x9FB9:
      return 0xFE7E;
    case 0x9FBA:
      return 0xFE90;
    case 0x9FBB:
      return 0xFEA0;
    case 0xFE10:
      return 0xA6D9;
    case 0xFE11:
      return 0xA6DB;
    case 0xFE12:
      return 0xA6DA;
    case 0xFE13:
      return 0xA6DC;
    case 0xFE14:
      return 0xA6DD;
    case 0xFE15:
      return 0xA6DE;
    case 0xFE16:
      return 0xA6DF;
    case 0xFE17:
      return 0xA6EC;
    case 0xFE18:
      return 0xA6ED;
    case 0xFE19:
      return 0xA6F3;
  }
  return null;
}

// index gb18030 ranges identifier:
// f963aaa1653f630c523e7b04729fb4e4458f35806c45eb5c179445623138f0c0
// 207 four-byte range boundaries.
const List<int> _rangePointers = <int>[
  0,
  36,
  38,
  45,
  50,
  81,
  89,
  95,
  96,
  100,
  103,
  104,
  105,
  109,
  126,
  133,
  148,
  172,
  175,
  179,
  208,
  306,
  307,
  308,
  309,
  310,
  311,
  312,
  313,
  341,
  428,
  443,
  544,
  545,
  558,
  741,
  742,
  749,
  750,
  805,
  819,
  820,
  7922,
  7924,
  7925,
  7927,
  7934,
  7943,
  7944,
  7945,
  7950,
  8062,
  8148,
  8149,
  8152,
  8164,
  8174,
  8236,
  8240,
  8262,
  8264,
  8374,
  8380,
  8381,
  8384,
  8388,
  8390,
  8392,
  8393,
  8394,
  8396,
  8401,
  8406,
  8416,
  8419,
  8424,
  8437,
  8439,
  8445,
  8482,
  8485,
  8496,
  8521,
  8603,
  8936,
  8946,
  9046,
  9050,
  9063,
  9066,
  9076,
  9092,
  9100,
  9108,
  9111,
  9113,
  9131,
  9162,
  9164,
  9218,
  9219,
  11329,
  11331,
  11334,
  11336,
  11346,
  11361,
  11363,
  11366,
  11370,
  11372,
  11375,
  11389,
  11682,
  11686,
  11687,
  11692,
  11694,
  11714,
  11716,
  11723,
  11725,
  11730,
  11736,
  11982,
  11989,
  12102,
  12336,
  12348,
  12350,
  12384,
  12393,
  12395,
  12397,
  12510,
  12553,
  12851,
  12962,
  12973,
  13738,
  13823,
  13919,
  13933,
  14080,
  14298,
  14585,
  14698,
  15583,
  15847,
  16318,
  16434,
  16438,
  16481,
  16729,
  17102,
  17122,
  17315,
  17320,
  17402,
  17418,
  17859,
  17909,
  17911,
  17915,
  17916,
  17936,
  17939,
  17961,
  18664,
  18703,
  18814,
  18962,
  19043,
  33469,
  33470,
  33471,
  33484,
  33485,
  33490,
  33497,
  33501,
  33505,
  33513,
  33520,
  33536,
  33550,
  37845,
  37921,
  37948,
  38029,
  38038,
  38064,
  38065,
  38066,
  38069,
  38075,
  38076,
  38078,
  39108,
  39109,
  39113,
  39114,
  39115,
  39116,
  39265,
  39394,
  189000,
];

const List<int> _rangeCodePoints = <int>[
  0x80,
  0xA5,
  0xA9,
  0xB2,
  0xB8,
  0xD8,
  0xE2,
  0xEB,
  0xEE,
  0xF4,
  0xF8,
  0xFB,
  0xFD,
  0x102,
  0x114,
  0x11C,
  0x12C,
  0x145,
  0x149,
  0x14E,
  0x16C,
  0x1CF,
  0x1D1,
  0x1D3,
  0x1D5,
  0x1D7,
  0x1D9,
  0x1DB,
  0x1DD,
  0x1FA,
  0x252,
  0x262,
  0x2C8,
  0x2CC,
  0x2DA,
  0x3A2,
  0x3AA,
  0x3C2,
  0x3CA,
  0x402,
  0x450,
  0x452,
  0x2011,
  0x2017,
  0x201A,
  0x201E,
  0x2027,
  0x2031,
  0x2034,
  0x2036,
  0x203C,
  0x20AD,
  0x2104,
  0x2106,
  0x210A,
  0x2117,
  0x2122,
  0x216C,
  0x217A,
  0x2194,
  0x219A,
  0x2209,
  0x2210,
  0x2212,
  0x2216,
  0x221B,
  0x2221,
  0x2224,
  0x2226,
  0x222C,
  0x222F,
  0x2238,
  0x223E,
  0x2249,
  0x224D,
  0x2253,
  0x2262,
  0x2268,
  0x2270,
  0x2296,
  0x229A,
  0x22A6,
  0x22C0,
  0x2313,
  0x246A,
  0x249C,
  0x254C,
  0x2574,
  0x2590,
  0x2596,
  0x25A2,
  0x25B4,
  0x25BE,
  0x25C8,
  0x25CC,
  0x25D0,
  0x25E6,
  0x2607,
  0x260A,
  0x2641,
  0x2643,
  0x2E82,
  0x2E85,
  0x2E89,
  0x2E8D,
  0x2E98,
  0x2EA8,
  0x2EAB,
  0x2EAF,
  0x2EB4,
  0x2EB8,
  0x2EBC,
  0x2ECB,
  0x2FFC,
  0x3004,
  0x3018,
  0x301F,
  0x302A,
  0x303F,
  0x3094,
  0x309F,
  0x30F7,
  0x30FF,
  0x312A,
  0x322A,
  0x3232,
  0x32A4,
  0x3390,
  0x339F,
  0x33A2,
  0x33C5,
  0x33CF,
  0x33D3,
  0x33D6,
  0x3448,
  0x3474,
  0x359F,
  0x360F,
  0x361B,
  0x3919,
  0x396F,
  0x39D1,
  0x39E0,
  0x3A74,
  0x3B4F,
  0x3C6F,
  0x3CE1,
  0x4057,
  0x4160,
  0x4338,
  0x43AD,
  0x43B2,
  0x43DE,
  0x44D7,
  0x464D,
  0x4662,
  0x4724,
  0x472A,
  0x477D,
  0x478E,
  0x4948,
  0x497B,
  0x497E,
  0x4984,
  0x4987,
  0x499C,
  0x49A0,
  0x49B8,
  0x4C78,
  0x4CA4,
  0x4D1A,
  0x4DAF,
  0x9FA6,
  0xE76C,
  0xE7C8,
  0xE7E7,
  0xE815,
  0xE819,
  0xE81F,
  0xE827,
  0xE82D,
  0xE833,
  0xE83C,
  0xE844,
  0xE856,
  0xE865,
  0xF92D,
  0xF97A,
  0xF996,
  0xF9E8,
  0xF9F2,
  0xFA10,
  0xFA12,
  0xFA15,
  0xFA19,
  0xFA22,
  0xFA25,
  0xFA2A,
  0xFE32,
  0xFE45,
  0xFE53,
  0xFE58,
  0xFE67,
  0xFE6C,
  0xFF5F,
  0xFFE6,
  0x10000,
];
