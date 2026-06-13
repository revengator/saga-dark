# tools/validation/ — OCR cleanup + byte-perfect verification pipeline

Python scripts that compose the source reconstruction pipeline: from paper listing (PDF) → OCR → cleanup → editable `.asm` → byte-perfect `.bin` against the original `.sna`.

## Scripts

| Script | Function |
|---|---|
| `preprocess.py` | Pasmo → pyz80: adds `:` to labels, converts `#F MODULE` → `INCLUDE "module.asm"`. |
| `compare.py` | Compares `<bin>` against `<sna>` byte-by-byte. Emits a summary + first divergent offset. |
| `disasm_to_pasmo.py` | Generates a Pasmo-style `.asm` from a raw disasm by applying a label map (entry+sub-routines labelled from OCR). |
| `range_to_defb.py` | Converts a byte range from the original `.sna` into an editable `DEFB` block, including header/EQUs. Used to clean up data tables decoded as code. |
| `bytes_to_defb.py` | Helper: converts a byte sequence into a single `DEFB` line. |
| `extract_tails.py` | Extracts the "tails" (final data) of each module to insert at the end of the `.asm`. |
| `match_labels.py` | Cross-references OCR label addresses against binary ranges to validate the OCR↔real mapping. |
| `relabel.py` | Applies a `{auto_label: human_label}` dictionary over an `.asm` (mass rename). |
| `translate_dark1_to_dark2.py` | Maps the 77 variables that change between Dark 1 and Dark 2 (see [`engine_reference.md`](../../docs/engine_reference.md) §2). |
| `dark2_labels.json` | Complete OCR↔address label dictionary for Dark 2. |
| `validate.sh` | Wrapper that orchestrates `compare.py` for the 4 builds (dark1/2/3/film). |

## Typical workflow — adding a clean module

1. `disasm_to_pasmo.py original-48k/disasm/dark2_raw.asm --range 0x7E26-0x86DD --labels dark2_labels.json > armadura_raw.asm`
2. Cross-check by hand against `ocr/dark2 ocr/armadura.asm` and `scan/dark2 scan/dark2-armadura.pdf` for human names.
3. `range_to_defb.py` for sprite/data ranges.
4. `original-48k/src/dark2/build.sh` — `compare.py` automatically validates byte-perfect.
5. Test in an emulator with `tools/run-emulator.sh original-48k/build/dark2.sna`.

## Dependencies

- Python 3.8+
- `pyz80` (`pip install pyz80`) — used occasionally for cross-validation.
- `sjasmplus` 1.23+ — official project assembler (not in this directory, in PATH).

## Conventions

- Standard CLI arguments; `--help` shows options.
- Default output to stdout; redirect with `>` to files.
- No script modifies `original-48k/snapshots/`, `original-48k/scan/` or `original-48k/disasm/` (read-only).
