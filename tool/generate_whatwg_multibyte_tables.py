"""Generate ISO-2022-JP and GB18030 indexes from vendored WHATWG data.

Run from ``packages/mime_convert``:

    python3 tool/generate_whatwg_multibyte_tables.py
    python3 tool/generate_whatwg_multibyte_tables.py --check
    python3 tool/generate_whatwg_multibyte_tables.py --refresh

Normal generation and checks are offline. ``--refresh`` is the only networked
mode and still refuses content whose SHA-256 and WHATWG Identifier have not
first been reviewed and updated in this script.
"""

from __future__ import annotations

import argparse
import hashlib
import pathlib
import re
import urllib.request


ROOT = pathlib.Path(__file__).resolve().parents[1]
BASE_URL = "https://encoding.spec.whatwg.org/"
DEFAULT_DATA_DIR = ROOT / "tool" / "data"

SOURCES = {
    "index-gb18030.txt": (
        "ff1c9a923b5d24f9761b3a2de2c0f07b395f9f6f36519508944de4f0415be81c"
    ),
    "index-gb18030-ranges.txt": (
        "f963aaa1653f630c523e7b04729fb4e4458f35806c45eb5c179445623138f0c0"
    ),
    "index-jis0208.txt": (
        "cbaa91f3deb7d0841faf5c33041fc15a285da0e87e64ab802c4bf04b7c4da861"
    ),
    "index-iso-2022-jp-katakana.txt": (
        "6ffc12c11f6eab1ccb3dada740d9b0db096ef0b0783c3bd5ec951dcb4a44b95e"
    ),
}

CONTENT_SHA256 = {
    "index-gb18030.txt": (
        "746b3c55f1a8ec4b90b451f384437a17fd37cd51cd668456a28071a758d10784"
    ),
    "index-gb18030-ranges.txt": (
        "874c6b6f6f74cf7d427ad228d5b41ddd9354fffd92a2259bf429f86e6baa7a1e"
    ),
    "index-jis0208.txt": (
        "341dcde7e8b984e9c7bbf5ed75c8da7c6087d47083a1a2b3ed558bfd5bef9468"
    ),
    "index-iso-2022-jp-katakana.txt": (
        "185c3c20c896eca514cde0aabf570523d3ae3624d0a3d39f71455f2d3ff0e207"
    ),
}


def verify(name: str, content: bytes) -> str:
    content_hash = hashlib.sha256(content).hexdigest()
    if content_hash != CONTENT_SHA256[name]:
        raise RuntimeError(
            f"{name}: expected SHA-256 {CONTENT_SHA256[name]}, "
            f"found {content_hash}"
        )
    text = content.decode("utf-8")

    match = re.search(r"^# Identifier: ([0-9a-f]{64})$", text, re.MULTILINE)
    actual = match.group(1) if match else None
    expected = SOURCES[name]
    if actual != expected:
        raise RuntimeError(
            f"{name}: expected WHATWG identifier {expected}, found {actual}"
        )
    return text


def load(name: str, data_dir: pathlib.Path, *, refresh: bool) -> str:
    path = data_dir / name
    if refresh:
        with urllib.request.urlopen(BASE_URL + name, timeout=30) as response:
            content = response.read()
        text = verify(name, content)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)
        return text
    if not path.exists():
        raise RuntimeError(
            f"{path} is missing; restore the vendored input or run --refresh"
        )
    return verify(name, path.read_bytes())


def parse_index(text: str) -> dict[int, int]:
    result: dict[int, int] = {}
    for line in text.splitlines():
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        result[int(fields[0].strip())] = int(fields[1], 16)
    return result


def dart_switch(name: str, values: dict[int, int]) -> list[str]:
    lines = [f"int? {name}(int value) {{", "  switch (value) {"]
    for key, result in sorted(values.items()):
        lines.extend((f"    case 0x{key:X}:", f"      return 0x{result:X};"))
    lines.extend(("  }", "  return null;", "}"))
    return lines


def jis_pointer_to_shift_jis(pointer: int) -> bytes:
    leading = pointer // 188
    leading_offset = 0x81 if leading < 0x1F else 0xC1
    trailing = pointer % 188
    trailing_offset = 0x40 if trailing < 0x3F else 0x41
    return bytes((leading + leading_offset, trailing + trailing_offset))


def gb_pointer_to_code(pointer: int) -> int:
    trailing = pointer % 190
    trailing_offset = 0x40 if trailing < 0x3F else 0x41
    return ((pointer // 190 + 0x81) << 8) | (trailing + trailing_offset)


def parse_decimal_dart_map(path: pathlib.Path) -> dict[int, int]:
    return {
        int(key): int(value)
        for key, value in re.findall(
            r"^  (\d+): (\d+),$", path.read_text(encoding="utf-8"), re.MULTILINE
        )
    }


def write_generated(path: pathlib.Path, content: str, *, check: bool) -> None:
    if check:
        if not path.exists() or path.read_text(encoding="utf-8") != content:
            raise RuntimeError(
                f"{path} is stale; run tool/generate_whatwg_multibyte_tables.py"
            )
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def emit_iso2022jp(
    jis0208: dict[int, int],
    katakana: dict[int, int],
    *,
    check: bool,
) -> None:
    # ISO-2022-JP has two 94-byte JIS bytes, so later Shift_JIS-only extension
    # rows in index jis0208 are unreachable and must not be included.
    jis0208 = {pointer: cp for pointer, cp in jis0208.items() if pointer < 94 * 94}
    for pointer in range(94 * 94):
        expected = jis0208.get(pointer)
        try:
            decoded = jis_pointer_to_shift_jis(pointer).decode("cp932")
            actual = ord(decoded) if len(decoded) == 1 else None
        except UnicodeDecodeError:
            actual = None
        if actual != expected:
            raise RuntimeError(
                "The shipped CPython/CP932 Shift_JIS mapping no longer matches "
                f"WHATWG index jis0208 at pointer {pointer}: "
                f"{actual!r} != {expected!r}"
            )

    lines = [
        "part of 'iso2022jp.dart';",
        "",
        "// GENERATED — do not edit by hand.",
        "// Source: WHATWG Encoding Standard indexes, via",
        "// tool/generate_whatwg_multibyte_tables.py.",
        "// index jis0208 identifier:",
        f"// {SOURCES['index-jis0208.txt']}",
        f"// All {len(jis0208)} reachable JIS mappings were verified identical",
        "// to CPython's CP932 table and reuse shift_jis.dart at runtime.",
        "",
        "// Half-width katakana -> full-width code point mapping used only by",
        "// the WHATWG ISO-2022-JP encoder.",
        f"// {len(katakana)} mappings.",
        "const List<int> _katakanaEncode = <int>[",
        *(f"  0x{katakana[pointer]:X}," for pointer in sorted(katakana)),
        "];",
        "",
    ]
    path = ROOT / "lib" / "src" / "iso2022jp" / "table.dart"
    write_generated(path, "\n".join(lines), check=check)


def emit_gb18030(
    index: dict[int, int],
    ranges: dict[int, int],
    *,
    check: bool,
) -> None:
    decoder_path = ROOT / "lib" / "src" / "gbk" / "gbk_decoder_map.dart"
    encoder_path = ROOT / "lib" / "src" / "gbk" / "gbk_encoder_map.dart"
    existing_decode = parse_decimal_dart_map(decoder_path)
    existing_encode = parse_decimal_dart_map(encoder_path)

    whatwg_decode = {
        gb_pointer_to_code(pointer): code_point
        for pointer, code_point in index.items()
    }
    if whatwg_decode.keys() != existing_decode.keys():
        raise RuntimeError(
            "The existing GBK table and WHATWG index gb18030 no longer have "
            "the same two-byte key set"
        )
    decode_overlay = {
        code: code_point
        for code, code_point in whatwg_decode.items()
        if existing_decode[code] != code_point
    }

    whatwg_encode: dict[int, int] = {}
    for code, code_point in whatwg_decode.items():
        whatwg_encode.setdefault(code_point, code)
    encode_overlay = {
        code_point: code
        for code_point, code in whatwg_encode.items()
        if existing_encode.get(code_point) != code
    }

    lines = [
        "part of 'gb18030.dart';",
        "",
        "// GENERATED — do not edit by hand.",
        "// Source: WHATWG Encoding Standard indexes, via",
        "// tool/generate_whatwg_multibyte_tables.py.",
        "// index gb18030 identifier:",
        f"// {SOURCES['index-gb18030.txt']}",
        f"// All {len(index)} two-byte mappings reuse gbk.dart. These",
        f"// {len(decode_overlay)} entries are the GB18030-2022 decode changes.",
        *dart_switch("_twoByteDecodeOverlay", decode_overlay),
        "",
        "// Code points added to the two-byte index by GB18030-2022. Existing",
        "// unchanged encodings are looked up in gbk.dart and validated by",
        "// decoding them through the WHATWG overlay.",
        f"// {len(encode_overlay)} entries.",
        *dart_switch("_twoByteEncodeOverlay", encode_overlay),
        "",
        "// index gb18030 ranges identifier:",
        f"// {SOURCES['index-gb18030-ranges.txt']}",
        f"// {len(ranges)} four-byte range boundaries.",
        "const List<int> _rangePointers = <int>[",
        *(f"  {pointer}," for pointer in sorted(ranges)),
        "];",
        "",
        "const List<int> _rangeCodePoints = <int>[",
        *(f"  0x{ranges[pointer]:X}," for pointer in sorted(ranges)),
        "];",
        "",
    ]
    path = ROOT / "lib" / "src" / "gb18030" / "table.dart"
    write_generated(path, "\n".join(lines), check=check)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail if the checked-in Dart tables differ from pinned WHATWG data",
    )
    parser.add_argument(
        "--refresh",
        action="store_true",
        help="refresh vendored inputs after reviewing their pinned identifiers",
    )
    parser.add_argument(
        "--data-dir",
        type=pathlib.Path,
        default=DEFAULT_DATA_DIR,
        help="directory containing the vendored WHATWG index files",
    )
    args = parser.parse_args()
    if args.check and args.refresh:
        parser.error("--check and --refresh are mutually exclusive")

    parsed = {
        name: parse_index(load(name, args.data_dir, refresh=args.refresh))
        for name in SOURCES
    }
    emit_iso2022jp(
        parsed["index-jis0208.txt"],
        parsed["index-iso-2022-jp-katakana.txt"],
        check=args.check,
    )
    emit_gb18030(
        parsed["index-gb18030.txt"],
        parsed["index-gb18030-ranges.txt"],
        check=args.check,
    )
    verb = "Verified" if args.check else "Generated"
    print(f"{verb} pinned WHATWG ISO-2022-JP and GB18030 tables.")


if __name__ == "__main__":
    main()
