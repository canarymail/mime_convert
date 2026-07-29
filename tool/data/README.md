# WHATWG encoding index inputs

`index-big5.txt` is the authoritative
[WHATWG index Big5](https://encoding.spec.whatwg.org/index-big5.txt), vendored
so codec generation and exhaustive tests are deterministic and work offline.

- WHATWG Identifier:
  `8dfc771062e7be0810919082c2c06baa2236147909e0ecc235b1cb9ad782ac82`
- WHATWG Date: `2024-09-18`
- File SHA-256:
  `08e24270c8e95d998c994c03f907e972480dc01f58743e078654cc466203c8ff`

Run `python3 tool/generate_big5_table.py --check` from the package directory to
verify that the input and generated Dart table match. See that script for the
intentional upstream refresh workflow.

The generated index is page-local delta coded into one-byte Dart strings.
Its checked-in payload is 30,871 bytes and lookup examines at most 32 varints,
avoiding a const `Map` and its per-entry AOT objects.

The WHATWG Encoding Standard states that portions incorporated into source
code are available under the BSD 3-Clause License.
