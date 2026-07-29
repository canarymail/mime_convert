#!/usr/bin/env python3
"""Generate Dart single-byte codecs from Python's standard-library tables.

The decoder mapping is obtained by strictly decoding each byte independently.
The encoder mapping is obtained by asking Python to strictly encode every
decoded Unicode scalar, so duplicate decoder entries use Python's canonical
encoding rather than a guessed first/last-byte policy.
"""

from __future__ import annotations

import argparse
import hashlib
import pathlib
import subprocess
import sys
import tempfile
import unicodedata


PACKAGE_ROOT = pathlib.Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = PACKAGE_ROOT / "lib/src/single_byte/generated_codecs.dart"
EXPECTED_PYTHON_VERSION = (3, 14, 6)
EXPECTED_UNICODE_VERSION = "16.0.0"

# This is the exact missing set relative to mime_convert 1.6.0's 23 existing
# Python-charmap-equivalent codecs.
CODECS = (
    "cp037",
    "cp1006",
    "cp1026",
    "cp1125",
    "cp1140",
    "cp1255",
    "cp1257",
    "cp1258",
    "cp273",
    "cp424",
    "cp437",
    "cp500",
    "cp720",
    "cp737",
    "cp775",
    "cp852",
    "cp855",
    "cp856",
    "cp857",
    "cp858",
    "cp860",
    "cp861",
    "cp862",
    "cp863",
    "cp864",
    "cp865",
    "cp866",
    "cp869",
    "cp874",
    "cp875",
    "hp_roman8",
    "iso8859_1",
    "koi8_t",
    "kz1048",
    "mac_arabic",
    "mac_croatian",
    "mac_cyrillic",
    "mac_farsi",
    "mac_greek",
    "mac_iceland",
    "mac_latin2",
    "mac_roman",
    "mac_romanian",
    "mac_turkish",
    "palmos",
    "ptcp154",
    "tis_620",
)

FULL_TABLE_CODECS = {
    "cp037",
    "cp1026",
    "cp1140",
    "cp273",
    "cp424",
    "cp500",
    "cp875",
    "cp864",
}

CANONICAL_NAMES = {
    "hp_roman8": "hp-roman8",
    "iso8859_1": "iso-8859-1",
    "koi8_t": "koi8-t",
    "mac_arabic": "mac-arabic",
    "mac_croatian": "mac-croatian",
    "mac_cyrillic": "mac-cyrillic",
    "mac_farsi": "mac-farsi",
    "mac_greek": "mac-greek",
    "mac_iceland": "mac-iceland",
    "mac_latin2": "mac-latin2",
    "mac_roman": "mac-roman",
    "mac_romanian": "mac-romanian",
    "mac_turkish": "mac-turkish",
    "tis_620": "tis-620",
}


def class_stem(codec: str) -> str:
    return "".join(part[0].upper() + part[1:] for part in codec.split("_"))


def variable_stem(codec: str) -> str:
    stem = class_stem(codec)
    return stem[0].lower() + stem[1:]


def decode_table(codec: str) -> list[int]:
    result: list[int] = []
    for byte in range(256):
        try:
            text = bytes((byte,)).decode(codec, "strict")
        except UnicodeDecodeError:
            result.append(-1)
            continue
        if len(text) != 1:
            raise RuntimeError(
                f"{codec}: byte 0x{byte:02x} decoded to {len(text)} scalars"
            )
        result.append(ord(text))
    return result


def encoding_overrides(
    codec: str, table: list[int], ascii_compatible: bool
) -> dict[int, int]:
    first_bytes: dict[int, int] = {}
    if ascii_compatible:
        first_bytes.update((byte, byte) for byte in range(128))
    start = 128 if ascii_compatible else 0
    for byte in range(start, 256):
        code_point = table[byte]
        if code_point >= 0:
            first_bytes.setdefault(code_point, byte)

    result: dict[int, int] = {}
    for code_point in sorted(set(table) - {-1}):
        encoded = chr(code_point).encode(codec, "strict")
        if len(encoded) != 1:
            raise RuntimeError(
                f"{codec}: U+{code_point:04X} encoded to {len(encoded)} bytes"
            )
        byte = encoded[0]
        if byte != first_bytes[code_point]:
            result[code_point] = byte
    return result


def dart_string_code_point(value: int) -> str:
    if value < 0:
        return r"\u{ffff}"
    if value > 0xFFFF:
        raise RuntimeError(
            f"U+{value:06X} cannot be represented in a one-code-unit Dart table"
        )
    if value < 0x20 or value > 0x7E:
        return rf"\u{{{value:x}}}"
    character = chr(value)
    if character == "'":
        return r"\'"
    if character == "\\":
        return r"\\"
    if character == "$":
        return r"\$"
    return character


def render_string(name: str, values: list[int]) -> str:
    lines = [f"const String _{name}DecodingTable ="]
    for offset in range(0, len(values), 32):
        text = "".join(
            dart_string_code_point(value) for value in values[offset : offset + 32]
        )
        suffix = ";" if offset + 32 >= len(values) else ""
        lines.append(f"    '{text}'{suffix}")
    return "\n".join(lines)


def render_map(name: str, values: dict[int, int]) -> str:
    lines = [f"const Map<int, int> _{name}EncodingOverrides = <int, int>{{"]
    for code_point, byte in values.items():
        lines.append(f"  0x{code_point:x}: 0x{byte:02x},")
    lines.append("};")
    return "\n".join(lines)


def render_codec(codec: str, table: list[int]) -> str:
    stem = class_stem(codec)
    variable = variable_stem(codec)
    ascii_compatible = codec not in FULL_TABLE_CODECS
    stored_table = table[128:] if ascii_compatible else table
    overrides = encoding_overrides(codec, table, ascii_compatible)
    replacement = "?".encode(codec, "strict")[0]
    canonical_name = CANONICAL_NAMES.get(codec, codec)
    dart_bool = "true" if ascii_compatible else "false"

    return f"""
/// The Python `{codec}` single-byte encoding.
class {stem}Codec extends SingleByteCodec {{
  const {stem}Codec({{bool allowInvalid = false}})
      : super(
          name: '{canonical_name}',
          decodingTable: _{variable}DecodingTable,
          encodingOverrides: _{variable}EncodingOverrides,
          replacementByte: 0x{replacement:02x},
          asciiCompatible: {dart_bool},
          allowInvalid: allowInvalid,
        );
}}

{render_string(variable, stored_table)}

{render_map(variable, overrides)}
""".strip()


def generate() -> str:
    sections: list[str] = []
    instances: list[str] = []
    digest = hashlib.sha256()
    ascii_count = 0
    for codec in CODECS:
        table = decode_table(codec)
        ascii_compatible = table[:128] == list(range(128))
        expected_ascii = codec not in FULL_TABLE_CODECS
        if ascii_compatible != expected_ascii:
            raise RuntimeError(
                f"{codec}: ASCII compatibility changed "
                f"(expected {expected_ascii}, found {ascii_compatible})"
            )
        ascii_count += int(ascii_compatible)
        digest.update(codec.encode("ascii") + b"\0")
        for value in table:
            digest.update(value.to_bytes(4, "big", signed=True))
        sections.append(render_codec(codec, table))
        instances.append(f"  {class_stem(codec)}Codec(),")

    if ascii_count != 39 or len(CODECS) != 47:
        raise RuntimeError(
            f"Inventory invariant failed: {len(CODECS)} codecs, "
            f"{ascii_count} ASCII-compatible"
        )

    version = sys.version.split()[0]
    lookup_cases = "\n".join(
        f"    case '{codec}':\n"
        f"      return {class_stem(codec)}Codec(allowInvalid: allowInvalid);"
        for codec in CODECS
    )
    return f"""// GENERATED CODE - DO NOT EDIT.
// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs
//
// Source: Python {version} standard-library codecs
// Unicode database: {unicodedata.unidata_version}
// Mapping SHA-256: {digest.hexdigest()}
// Generator: tool/generate_single_byte_codecs.py
//
// Each decoder table was produced with strict one-byte Python decodes. Each
// encoder map was produced with strict Python encodes, preserving Python's
// canonical byte selection for duplicate decoder mappings.

import 'single_byte_codec.dart';

{chr(10).join(sections)}

/// The 47 generated codecs in stable Python module-name order.
const List<SingleByteCodec> generatedSingleByteCodecs = <SingleByteCodec>[
{chr(10).join(instances)}
];

/// Finds a generated codec by its canonical Python standard-library name.
///
/// Returns `null` for names outside the generated 47-codec inventory.
SingleByteCodec? generatedSingleByteCodec(
  String pythonName, {{
  bool allowInvalid = false,
}}) {{
  switch (pythonName) {{
{lookup_cases}
    default:
      return null;
  }}
}}
"""


def dart_format(source: str) -> str:
    # Keep the temporary file under the package root so dart format applies
    # this package's language version rather than the SDK's latest default.
    with tempfile.TemporaryDirectory(dir=PACKAGE_ROOT) as directory:
        path = pathlib.Path(directory) / "generated_codecs.dart"
        path.write_text(source)
        subprocess.run(
            ("dart", "format", str(path)),
            check=True,
            stdout=subprocess.DEVNULL,
        )
        return path.read_text()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=pathlib.Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail if the checked-in generated file differs",
    )
    args = parser.parse_args()
    if sys.version_info[:3] != EXPECTED_PYTHON_VERSION:
        expected = ".".join(str(value) for value in EXPECTED_PYTHON_VERSION)
        actual = ".".join(str(value) for value in sys.version_info[:3])
        raise SystemExit(
            f"Python {expected} is required for reproducible codec tables; "
            f"found {actual}"
        )
    if unicodedata.unidata_version != EXPECTED_UNICODE_VERSION:
        raise SystemExit(
            f"Unicode {EXPECTED_UNICODE_VERSION} is required for reproducible "
            f"codec tables; found {unicodedata.unidata_version}"
        )
    generated = dart_format(generate())
    if args.check:
        if not args.output.exists() or args.output.read_text() != generated:
            raise SystemExit(f"{args.output} is stale; run {pathlib.Path(__file__).name}")
        return
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(generated)


if __name__ == "__main__":
    main()
