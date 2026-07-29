# WHATWG encoding index inputs

The authoritative WHATWG indexes used by the generated codecs are vendored so
normal generation, exhaustive tests, and `--check` work offline.

| File | WHATWG Identifier | SHA-256 |
|---|---|---|
| `index-big5.txt` | `8dfc771062e7be0810919082c2c06baa2236147909e0ecc235b1cb9ad782ac82` | `08e24270c8e95d998c994c03f907e972480dc01f58743e078654cc466203c8ff` |
| `index-gb18030.txt` | `ff1c9a923b5d24f9761b3a2de2c0f07b395f9f6f36519508944de4f0415be81c` | `746b3c55f1a8ec4b90b451f384437a17fd37cd51cd668456a28071a758d10784` |
| `index-gb18030-ranges.txt` | `f963aaa1653f630c523e7b04729fb4e4458f35806c45eb5c179445623138f0c0` | `874c6b6f6f74cf7d427ad228d5b41ddd9354fffd92a2259bf429f86e6baa7a1e` |
| `index-jis0208.txt` | `cbaa91f3deb7d0841faf5ed75c8da7c6087d47083a1a2b3ed558bfd5bef9468` | `341dcde7e8b984e9c7bbf5ed75c8da7c6087d47083a1a2b3ed558bfd5bef9468` |
| `index-iso-2022-jp-katakana.txt` | `6ffc12c11f6eab1ccb3dada740d9b0db096ef0b0783c3bd5ec951dcb4a44b95e` | `185c3c20c896eca514cde0aabf570523d3ae3624d0a3d39f71455f2d3ff0e207` |

All files have WHATWG date `2024-09-18`. Run the corresponding generator with
`--check` to verify both the pinned inputs and generated Dart. Network access is
used only with `--refresh`, which still rejects any source whose reviewed hash
or Identifier has not first been updated in the generator.

The generated index is page-local delta coded into one-byte Dart strings.
Its checked-in payload is 30,871 bytes and lookup examines at most 32 varints,
avoiding a const `Map` and its per-entry AOT objects.

The WHATWG Encoding Standard states that portions incorporated into source
code are available under the BSD 3-Clause License.
