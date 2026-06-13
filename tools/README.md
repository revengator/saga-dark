# tools/ — Auxiliary scripts

Utilities for OCR cleanup, byte-perfect validation, memory dumping and emulator launching.

## Subdirectories

- **`validation/`** — OCR cleanup pipeline + byte-perfect build verification (Pasmo→pyz80, compare `.bin` against `.sna`, DEFB conversion, dark1↔dark2 variable translation). See [`validation/README.md`](validation/README.md).
- **`zx_dumper/`** — Python visualiser for memory blocks of a `.sna`. See [`zx_dumper/README.md`](zx_dumper/README.md).

## Scripts at the root

- **`run-emulator.sh`** — wrapper that launches Fuse or ZEsarUX (`--debug`) detecting the machine (48K / +2 128K) from the file path. Usage:

  ```bash
  tools/run-emulator.sh original-48k/build/dark1.sna
  tools/run-emulator.sh remakes/_in_progress/128k-plus2-original/build/saga128.tap
  tools/run-emulator.sh --debug original-48k/snapshots/dark2/dark2.sna
  ```

  Requires Fuse (`brew install --cask fredm-fuse`) and/or ZEsarUX (`brew install --cask zesarux`). Details in [`docs/emulator.md`](../docs/emulator.md).

## Conventions

- Python scripts are standard CLIs — `<script>.py --help` shows options.
- Outputs go to `original-48k/build/` (gitignored) or to stdout for `build.sh` integration.
- No script modifies the `.sna` files in `original-48k/snapshots/` or the PDFs in `scan/`.
