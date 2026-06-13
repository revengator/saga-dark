# Dark 3 OCR — text from the original paper listing

OCR transcription of the PDF in `original-48k/scan/dark3 scan/`.
Contains the **author's human names** for the Dragon engine (END, MOVI,
MOVE, VEL1, TDO, TECLA2, UNA, OOAA, MIS, MENUS, MENES, COMPR, BEVOL1,
B_CAM, B_CAM2, INICIO, IMPRE2, TEB1, TEB2, VDRA, VDRA1, ATBO, ATCOL,
BOCAS, PERSO, SELO, LUNA, GRAF, DRAGON, CARGADOR…) and `; [?]` markers.

## How to use these files

When something in the clean `.asm` of `original-48k/src/dark3/` is not clear,
consult **in order**:

1. **`original-48k/ocr/dark3 ocr/dragon.asm`** (this directory) — for
   the author's human names and original comments.
2. **`original-48k/disasm/dark3_raw.asm`** — byte-perfect disassembly
   (authoritative for the actual bytes).
3. **`original-48k/scan/dark3 scan/<module>.pdf`** — paper scan.

## Cleanup status

The OCR cleanup is already **applied** in `original-48k/src/dark3/`:

- 2 files (`dark3.asm` + `dragon.asm`) compile to a byte-perfect `dark3.bin`
  (25536/25536 bytes against `snapshots/dark3/dark3.sna`).
- ~20 human labels + 9 data-table labels mapped automatically.
- 292 spurious auto-labels removed (data garbage-decoded as code).
- Status: 13% human (25/193 labels). OCR vs DEFB verification: 0 collisions.

Unlike Dark 1 and Dark 2, the Dragon engine is **monolithic** and
unique — it does not share modules with the other engines (see
[`engine-architecture.md`](../../../docs/engine-architecture.md) §2 and
[`dark3-memory-map.md`](../../../docs/dark3-memory-map.md)).

## Available files

Only `dragon.asm` — the phase is a single binary of ~3K code + 22K data.
