"""
Generate Dart decode tables for the CJK charsets from CPython's own codecs.

CPython ships the Unicode Consortium mappings, so enumerating every valid byte
sequence and asking it to decode gives an authoritative table without fetching
anything. Run:

    python3 tool/generate_cjk_tables.py

Key packing, matching the existing Big5 table in this package:
    single byte    -> key = b                (< 0x100)
    two bytes      -> key = lead * 256 + trail
    three bytes    -> key = 0x1000000 + (b1 << 16 | b2 << 8 | b3)

Only a decode table is emitted. The encoder inverts it lazily at runtime —
these messages are overwhelmingly read rather than written, and shipping a
second const map of this size would roughly double the cost in app binary
size for something almost never exercised. Big5 and GBK in this package ship
both directions and cost ~80k lines of source between them.
"""
import os

OUT_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "lib", "src", "cjk")

# Dart file stem -> CPython codec to generate the table from.
#
# The source codec is deliberately the vendor superset, not the strict national
# standard, because that is what the label means in practice and what every
# browser does (WHATWG Encoding Standard maps `shift_jis` -> Windows-31J and
# `euc-kr` -> UHC):
#
#   shift_jis -> cp932 : strict JIS X 0208 is missing 2,725 two-byte mappings
#                        that real mail uses. Outlook labels cp932 content
#                        "Shift_JIS", and the gap includes everyday characters
#                        such as (1)(2)(3), No., TEL and the surname kanji in
#                        Takahashi. Decoding those strictly yields U+FFFD.
#   euc_kr    -> cp949 : UHC adds 8,823 mappings over EUC-KR, covering the
#                        Hangul syllables outside the original Wansung set.
#   euc_jp    -> euc_jp: already the full set, including the JIS X 0212 plane
#                        reached through the three-byte 0x8F prefix.
#
# The codecs still report their MIME labels (shift_jis, euc-kr); only the table
# behind them is the superset.
CODECS = {
    "shift_jis": "cp932",
    "euc_jp": "euc_jp",
    "euc_kr": "cp949",
}


def build_table(codec: str) -> dict:
    """Every byte sequence that decodes to exactly one character."""
    table = {}

    # single byte
    for b in range(0x100):
        try:
            s = bytes([b]).decode(codec)
        except UnicodeDecodeError:
            continue
        if len(s) == 1:
            table[b] = ord(s)

    # two bytes — only for leads that are not already valid alone
    for lead in range(0x81, 0x100):
        if lead in table:
            continue
        for trail in range(0x21, 0x100):
            try:
                s = bytes([lead, trail]).decode(codec)
            except UnicodeDecodeError:
                continue
            if len(s) == 1:
                table[lead * 256 + trail] = ord(s)

    # three bytes — EUC-JP's JIS X 0212 plane behind the 0x8F prefix
    if codec in ("euc_jp", "eucjp"):
        for b2 in range(0xA1, 0xFF):
            for b3 in range(0xA1, 0xFF):
                try:
                    s = bytes([0x8F, b2, b3]).decode(codec)
                except UnicodeDecodeError:
                    continue
                if len(s) == 1:
                    table[0x1000000 + (0x8F << 16 | b2 << 8 | b3)] = ord(s)

    return table


def build_encode_overrides(codec: str, table: dict) -> dict:
    """
    Code points whose encoding cannot be recovered by inverting the decode table.

    Inversion assumes encode and decode are symmetric. They are not: several code
    points encode to a byte sequence that decodes back to a *different* code
    point, so no inverse of the decode table can produce them. In cp932 that
    covers U+2212 MINUS SIGN, U+00A2/A3/AC, U+2016 and U+301C; in EUC-JP,
    U+00A5 YEN and U+203E OVERLINE.

    Without these the encoder throws (or emits '?') for characters the charset
    can represent perfectly well. They are few enough to carry as an overlay
    rather than shipping a second full table.
    """
    inverted = {}
    for key, code_point in table.items():
        existing = inverted.get(code_point)
        if existing is None or key < existing:
            inverted[code_point] = key

    overrides = {}
    for code_point in range(0x110000):
        if code_point in inverted:
            continue
        try:
            encoded = chr(code_point).encode(codec)
        except (UnicodeEncodeError, ValueError):
            continue
        if len(encoded) == 1:
            packed = encoded[0]
        elif len(encoded) == 2:
            packed = encoded[0] << 8 | encoded[1]
        else:
            packed = 0x1000000 + (encoded[0] << 16 | encoded[1] << 8 | encoded[2])
        overrides[code_point] = packed
    return overrides


def emit(codec: str, stem: str, table: dict, overrides: dict) -> str:
    lines = [
        f"part of '{stem}.dart';",
        "",
        "// GENERATED — do not edit by hand.",
        f"// Source: CPython's '{codec}' codec, via tool/generate_cjk_tables.py",
        "//",
        "// Key packing:",
        "//   single byte -> b",
        "//   two bytes   -> lead * 256 + trail",
        "//   three bytes -> 0x1000000 + (b1 << 16 | b2 << 8 | b3)",
        f"// {len(table)} mappings.",
        "const Map<int, int> _decodeTable = {",
    ]
    for key in sorted(table):
        lines.append(f"  0x{key:X}: 0x{table[key]:X},")
    lines.append("};")
    lines.append("")
    lines.extend([
        "// Code points whose encoding the inverted decode table cannot produce,",
        "// because they encode to a sequence that decodes back to a different",
        "// code point. Overlaid on the inverse — see invertDecodeTable.",
        f"// {len(overrides)} entries.",
        "const Map<int, int> _encodeOverrides = {",
    ])
    for key in sorted(overrides):
        lines.append(f"  0x{key:X}: 0x{overrides[key]:X},")
    lines.append("};")
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    os.makedirs(OUT_DIR, exist_ok=True)
    for stem, codec in CODECS.items():
        table = build_table(codec)
        overrides = build_encode_overrides(codec, table)
        path = os.path.join(OUT_DIR, f"{stem}_table.dart")
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(emit(codec, stem, table, overrides))
        singles = sum(1 for k in table if k < 0x100)
        doubles = sum(1 for k in table if 0x100 <= k < 0x1000000)
        triples = sum(1 for k in table if k >= 0x1000000)
        print(
            f"{codec:<10} {len(table):>6} mappings "
            f"({singles} single, {doubles} double, {triples} triple, "
            f"{len(overrides)} encode overrides) -> {os.path.basename(path)}"
        )


if __name__ == "__main__":
    main()
