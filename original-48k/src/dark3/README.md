# Dark 3 — Dragon Phase

Reconstructed source code — **compiles byte-perfect against
`snapshots/dark3/dark3.sna`** (25536/25536 bytes match).

## Architecture: special endless-runner engine

Unlike Dark 1 and Dark 2 (which share a side-scroller platformer engine), Dark 3 uses its **own engine** for the Dragon
Phase. It's not a side-scroller — it's an *endless runner / dodge the dragon*. Details in [
`docs/engine-architecture.md`](../../../docs/engine-architecture.md) §2 and full memory map in [
`docs/dark3-memory-map.md`](../../../docs/dark3-memory-map.md).

**Why it's different:**

- The dragon sprite occupies **12 KB** (96 wide × 16 tall) — the largest in the project.
- LDI blocks hand-unrolled (32-50 consecutive LDIs) instead of LDIR+DJNZ — maximum speed to move the huge sprite each
  frame.
- Main loop `TEB2` with its own routines: SCROLL → ABRIRS → FUEGOS → VOLTA → ANDA → SALTOS → SALTMO → IMPRES → CAMBIO →
  IMPRE → MOVI → RELOJ → VDRA → VER → ESPERA → OKS.

## Structure

```
src/dark3/
├── dark3.asm                ← MASTER build file — main code
├── dragon.asm               ← code + dragon data (12K sprite + attributes + mouths)
└── build.sh                 ← script: source → .bin + .sna
```

Binary range: 0x9C40–0xFFFF (program + data + loader, 25536 bytes). Does NOT include the 0x8140–0x9C3F screen bitmap (
loaded from tape).

Internal layout:

- Code: 0x9C40–0xA7B2 (~2995 B)
- Data: 0xA7B3–0xFEFE (DEFB)
- Loader: 0xFEFF–0xFFFF
- Entry point: `INICIO = 0x9F7E`

## Build

```bash
./build.sh                     # normal binary
./build.sh cheat               # cheat version (not necessary — the Dragon
                               # phase doesn't have a traditional lives system)
```

Produces:

- `original-48k/build/dark3.bin` — 25536 raw bytes (ORG 0x9C40 → 0xFFFF)
- `original-48k/build/dark3.sna` — runs in Fuse/ZEsarUX

## Byte-perfect verification

`build.sh` automatically compares against `snapshots/dark3/dark3.sna`:

```
dark3.bin: 25536B (25536/25536 byte-perfect vs original)
```

## OCR cleanup applied (2026-04-29)

- ~20 human labels mapped: END, MOVI, MOVE, VEL1, TDO, TECLA2, UNA, OOAA, MIS, MENUS, MENES, COMPR, BEVOL1, B_CAM,
  B_CAM2, INICIO, IMPRE2, TEB1, TEB2, VDRA, VDRA1.
- 9 data-table labels: ATBO, ATCOL, BOCAS, PERSO, SELO, LUNA, GRAF, DRAGON, CARGADOR.
- 292 spurious auto-labels removed (from data garbage-decoded as code).
- Status: 13% human (25/193 labels). OCR vs DEFB verification: 0 collisions.

## Auxiliary folders (at the `original-48k/` level)

- **`scan/dark3 scan/`** — PDFs of the original paper listing.
- **`ocr/dark3 ocr/`** — OCR text (`dragon.asm`) with `; [?]` markers.
- **`disasm/dark3_raw.asm`** — byte-perfect disassembly of `dark3.sna` (authoritative).

## Verified in emulator

`dark3.sna` boots and runs correctly in FuseX (confirmed 2026-04-29).

# Memory map — Dragon Phase

> Source: original paper scan from the author, page `scan/png/dark3-memory-map-1.png`
> (PDF `scan/dark3/dark3-memory-map.pdf`).
> Transcribed 2026-04-27.

## Memory addresses

| Address |        Size | Description                                                                                          |
|--------:|------------:|------------------------------------------------------------------------------------------------------|
| `33087` |           — | CLEAR (lower bound — the BASIC `CLEAR 33087` reserves memory)                                        |
| `33088` |  6912 bytes | **STARTING SCREEN** — full bitmap of the main screen (loaded when the phase starts, copied to 16384) |
| `40000` |  2995 bytes | **PROGRAM** — Z80 code of the phase (ORG 40000)                                                      |
| `42995` |   360 bytes | **MOUTH PHASE COLOURS** — attributes of the dragon's various mouths (?)                              |
| `43355` |  1536 bytes | **DRAGON COLOURS** — dragon attribute table (referenced as `43355+63`, `43355+16` in code)           |
| `44892` |   576 bytes | **DRAGON MOUTH PHASES** — mouth sprites, **8 tall × 9 wide**                                         |
| `47772` |  1345 bytes | **CHARACTER ANIMATION FRAMES** — 3 animation frames                                                  |
| `49117` |   256 bytes | **FINAL BRIDGE GRAPHIC** — sprite of the final bridge                                                |
| `49373` |   288 bytes | **MOON GRAPHIC** — **4 tall × 9 wide**                                                               |
| `51966` |  1024 bytes | **BRIDGE GRAPHIC** — main bridge sprite (4 frames × 256 bytes)                                       |
| `52991` | 12288 bytes | **DRAGON GRAPHIC** — huge dragon sprite, **96 wide × 16 tall** (in cells; 96×16×8 = 12288 bytes)     |
| `65279` |   256 bytes | **DRAGON PHASE LOADER** — tape bootstrap (`TRITONCODE`)                                              |

## How it matches the source code

Cross-referenced with `original-48k/src/dark3/dark3.asm` and `original-48k/src/dark3/dragon.asm` (both source-perfect
byte-perfect against `snapshots/dark3/dark3.sna`):

| Constant in code                                         | Map                                | Comment                                 |
|----------------------------------------------------------|------------------------------------|-----------------------------------------|
| `LD HL,33088 / LD DE,16384 / LD BC,6912 / LDIR` (INICIO) | 33088 = screen                     | Copies the full screen to video RAM     |
| `ORG 40000 / JP INICIO`                                  | 40000 = program                    | Code entry point                        |
| `LD HL,43355+63` (CPASO/CA)                              | 43355 = dragon colours             | Dragon attributes on screen             |
| `LD HL,43355+16` (CFIN)                                  | 43355 = dragon colours             | Same, first row                         |
| `BOCAS DEFW 45668,46044,46420,46796,...` (in scan)       | 44892 = mouth phases, +N×376       | Pointers to mouth frames                |
| `LD HL,47772` (not literal but PERSO)                    | 47772 = character animation        | 3 frames                                |
| `LD HL,49117` (SELO)                                     | 49117 = final bridge               | 256 bytes                               |
| `LD HL,49373` (LUNA)                                     | 49373 = moon                       | 288 bytes                               |
| `LD DE,49662` (VOLCA1)                                   | inside the bridge/moon data        | Scroll destination buffer               |
| `LD HL,51709`, `LD DE,51965` (SCROLL)                    | 51966-256-1 = 51710                | Bridge margin (255 bytes earlier)       |
| `LD DE,51966` (BEVOL1)                                   | 51966 = bridge                     | Dump to bridge buffer                   |
| `GRAF DEFW 51966,52222,52478,52734,49117` (scan)         | 51966+256×{0,1,2,3} + final bridge | 4 animated bridge frames + final        |
| `LD HL,52991+64` (VDRA)                                  | 52991 = dragon                     | Dragon sprite with offset 64 per D_DRAC |
| `JP 65279` (CARGADORP)                                   | 65279 = loader                     | Bootstrap                               |

## RAM usage diagram

```
0000  ┌─────────────────┐
      │   ROM           │
      │                 │
4000  ├─────────────────┤  16384 = SCREEN$
      │   SCREEN        │
      │   16384..23295  │  6144 bytes bitmap
5800  ├─────────────────┤
      │   ATTRIBUTES    │
      │   22528..23295  │  768 bytes
5B00  ├─────────────────┤  23296 = printer buffer
      │   SYSTEM        │
8127  ├─────────────────┤  33087 = CLEAR
      │ screen copy     │  6912 bytes (33088..40000)
9C40  ├─────────────────┤  40000 = ORG
      │ code            │  2995 bytes
A7B3  ├─────────────────┤  42995
      │ mouth attrs     │  360
A8FB  ├─────────────────┤  43355
      │ dragon attrs    │  1536
AEFB  ├─────────────────┤  44892
      │ mouth frames    │  576 (8 frames × 72)
B11C  ├─────────────────┤  47772
      │ char animation  │  1345 (3 frames)
BBFD  ├─────────────────┤  49117
      │ final bridge    │  256
BCFD  ├─────────────────┤  49373
      │ moon            │  288
CAFE  ├─────────────────┤  51966
      │ bridge (4 fr.)  │  1024
CFFF  ├─────────────────┤  52991
      │ DRAGON          │  12288 (the biggest!)
FF00  ├─────────────────┤  65279
      │ loader          │  256
FFFF  └─────────────────┘
```

## Notes

- **The dragon sprite occupies 12 KB**, almost 18% of the total RAM — confirms the `sagadark` README's claim: *"the
  largest sprite ever seen on the Spectrum"*.
- The addresses match the scan code perfectly; reinforces the conclusion that **the scan is the original**. The
  decompilation imported from the `sagadark` repo, previously at `dragon/src/game.asm`, was a recreation with errors (
  already removed from the repo).
- Gap between `42995+360 = 43355` ✅ exact.
- Gap between `43355+1536 = 44891` ≈ `44892` ✅ (1-byte difference, possible separator).
- Gap between `49117+256 = 49373` ✅ exact.
- Gap between `49373+288 = 49661` and `51966` → 2305 unused bytes (free zone).
- Gap between `51966+1024 = 52990` and `52991` ✅ exact (1-byte margin).
- Gap between `52991+12288 = 65279` ✅ exact.
- Millimetre-precise packing! Almost zero waste.
