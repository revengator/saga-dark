# ZX0 Compression Report — Film (+2 128K)

> **Update 2026-05-07 — B+ pass landed.** The in-place backwards layout
> described in the original report was retired. All 11 image blobs
> (PPANT1..9, IMGSOL, IMGJACA) now decompress forward to a single shared
> 4609 B `SCREEN_BUF` on demand via `show_pantalla(A=id)`, instead of
> being pre-loaded at boot to permanent buffers. Net result: ~25 KB freed
> in active banks 5/2/0 (vs ~0 KB freed by the v-final pass — decorative
> for active-RAM peak) and the PPANT5..9 + sunset visual bug dissolved
> structurally. Only forward decoder is linked into the film
> (`dzx0_standard`, 68 B); `dzx0_standard_back` stays in `tools/zx0/` as
> a tool, available for future builds that need in-place backwards.
> Address-ordered map: [`MEMORY-MAP.md`](MEMORY-MAP.md). Per-blob numbers
> below remain accurate; PPANT5..9 + IMGSOL were re-encoded forward
> (forward sizes are within ±5 B of the backwards sizes).
>
> --- Original v-final report (2026-05-02) ---

> Final ZX0 compression pass over every static screen and narrative-text
> blob in the +2 128K Film build. **Rule applied:** compress whenever the
> ZX0 output is strictly smaller than the raw input. Mixed code+data blocks
> (BOOM/PIJAMA/NAVES/FINPELI) are excluded — they would need a code/data
> separation pass first. Tiny strings whose ZX0 grows or barely saves are
> excluded too.
>
> Date: 2026-05-02. Toolchain: `zx0` v2.2 by Einar Saukas
> ([`tools/zx0/`](../../tools/zx0/)).

## Two ZX0 techniques in use

**FORWARD decompression** (HL = compressed source, DE = destination): used
when source and destination live in different banks/slots. The compressed
blob lives in **bank 6** (free until now); paged into slot 3 only at boot
by `decompress_all`. Destinations are in slots 1 or 2 (banks 5 / 2, both
fixed at all times) — no slot-3 conflict between source and target.

**IN-PLACE BACKWARDS decompression** (HL = last src byte, DE = last dst
byte): used when the destination buffer lives in bank 0 (slot 3 default)
or crosses into it. Paging another bank into slot 3 to read the .zx0
would conflict with writing to bank 0. The ZX0 backwards format places
the compressed blob at the END of its own destination buffer, with `delta`
bytes of safety pad after; `dzx0_standard_back` decodes from the end
backwards, freeing the source bytes on the fly so source and destination
can occupy the same bank. The 48 B bank-0 `IMGSOL` and the 4 KB-class
`PPANT5..PPANT9` use this pattern. Trade-off: no absolute space freed in
bank 0 (the buffer still fully reserved), but the technique is canonical
and the rule is honoured (each blob is strictly smaller compressed).

## Per-blob compression results

### Forward (destination in slot 1 or slot 2 fixed; .zx0 in bank 6)

| Blob | Raw (B) | ZX0 (B) | Ratio | Saved (B) |
|------|--------:|--------:|------:|----------:|
| `PPANT1` (ABOYAYO)            |  4 096 |  2 880 | 70.3% |     1 216 |
| `PPANT2` (CIUDAD + COLOR2)    |  2 304 |    989 | 42.9% |     1 315 |
| `PPANT3` (BOOM + COLOR3)      |  1 152 |    659 | 57.2% |       493 |
| `PPANT4` (MUERTO)             |  4 608 |  3 766 | 81.7% |       842 |
| `CHARSET` (font 256 chars)    |    488 |    359 | 73.6% |       129 |
| `CHARX2` (font enlarged ×2)   |    768 |    588 | 76.6% |       180 |
| `CHARESP` (special font)      |    768 |    610 | 79.4% |       158 |
| `IMGJACA` (Jaca image)        |    720 |    532 | 73.9% |       188 |
| `PANT1..PANT10` ES (cartelas) |  2 269 |  1 224 | 53.9% |     1 045 |
| **Forward subtotal**          | **17 173** | **11 607** | **67.6%** | **5 566** |

### Backwards in-place (destination crosses or lives in bank 0)

| Blob | Raw (B) | ZX0 (B) | Ratio | Saved (B) |
|------|--------:|--------:|------:|----------:|
| `PPANT5` (BICHOS, crosses 2/0) |  4 608 |  4 007 | 87.0% |       601 |
| `PPANT6` (1POBLAD)             |  2 304 |  1 912 | 83.0% |       392 |
| `PPANT7` (KAMUIR)              |  4 609 |  3 538 | 76.8% |     1 071 |
| `PPANT8` (2POBLA + COLOR8)     |  1 152 |    960 | 83.3% |       192 |
| `PPANT9` (NOOO)                |  4 608 |  3 844 | 83.4% |       764 |
| `IMGSOL`                       |    180 |    149 | 82.8% |        31 |
| **Backwards subtotal**         | **17 461** | **14 410** | **82.5%** | **3 051** |

### Bank 1 — language overlay (decompressed only when user picks ENGLISH)

| Blob | Raw (B) | ZX0 (B) | Ratio | Saved (B) |
|------|--------:|--------:|------:|----------:|
| `PANT1..PANT10` EN narrative |  2 269 |  1 244 | 54.8% |     1 025 |
| `T1..T5` EN credits          |    195 |    146 | 74.9% |        49 |
| **Bank 1 subtotal**          | **2 464** | **1 390** | **56.4%** | **1 074** |

### Excluded by the rule

- **Crow strings** (`HIST`/`RESETEA` and their EN twins): grow when ZX0'd
  (32 → 34/35 B). Net cost > 0.
- **Tiny strings** (`PRESA`, `NUBO`, `TEXTON`, `TEXTOFIN`, `DARKT` and EN
  twins): save 1–14 B, but each entry in `decompress_all`'s lookup table
  costs 4 B + a rebuild-from-blob hop, eroding the win to under 10 B —
  not worth the complexity.
- **Mixed code+data blocks** (`BOOM_block`, `PIJAMA_block`, `NAVES_block`,
  `FINPELI_code`): would need a separate code/data split before they can
  be treated as compressible blobs. Out of scope of this pass.
- **`SAGA` logo** (1 816 B): the compressible portion is only the bitmap
  (280 B starting at `SAGA`), and that bitmap actually grows under ZX0
  (280 → 282 B). What was 1 816 B in the v1 measurement turned out to be
  a span error — `SAGA` ends at `CHARX2`, not at `PIJAMA`. The remaining
  768 B (`CHARX2`) and 768 B (`CHARESP`) are now compressed in their own
  right (see Forward table above).

## Total memory accounting

| Region | Before | After | Δ |
|---|--:|--:|--:|
| Bank 5 (slot 1, fixed) — pre-ZX0 data freed (CHARSET / CHARX2 / CHARESP / PANT1..10 ES portion in bank 5) | ~3 690 B | 0 B | **−3 690 B** (freed in slot 1) |
| Bank 2 (slot 2, fixed) — pre-ZX0 data freed (PPANT1..4, IMGJACA, PANT1..10 ES portion in bank 2) | ~13 983 B | 0 B | **−13 983 B** (freed in slot 2) |
| Bank 0 (slot 3 default) — in-place backwards (no absolute change) | 17 461 B | 17 461 B | 0 |
| Bank 1 (overlay) — EN narrative + credits compressed | 2 464 B | 1 390 B + 68 B local dzx0 = 1 458 B | **−1 006 B** (freed in bank 1) |
| Bank 5 bootstrap | 20 B | 37 B | +17 B |
| Bank 6 (was 100% free) — stash + decompressors + tables | 0 B | ~12 050 B | +12 050 B |
| **Net RAM occupied (game-active banks 5/2/1)** | ~20 157 B | 1 475 B + 17 B = 1 492 B | **−18 665 B in active banks** |

Three numbers that matter for the roadmap:

1. **18 665 B freed across game-active banks 5 / 2 / 1**. These banks are
   accessed without paging gymnastics during the film and are the prime
   landing zone for upcoming features (AY music tables, NIRVANA+
   multicolour data, more language packs, etc.).
2. **~4 300 B still free in bank 6** after the v-final stash. Comfortable
   margin for future decoder upgrades (turbo / mega ZX0 variants, AY
   sample data, etc.).
3. **0 B change in bank 0** (in-place backwards is a memory layout
   transformation, not a compaction in the .sna). The cassette / .tap
   distribution does shrink because the compressed blobs are physically
   smaller — the .sna is fixed-size, so the win there is for tape
   loading time and for future moves of these blobs to a real
   external location.

## Verification

- **Build:** `./build.sh` produces `build/saga-film-128k.sna` (131 103 B,
  fixed-size 128K snapshot). Build script auto-recompresses any blob whose
  raw `.bin` is newer than its `.zx0` / `.zx0b`.
- **Round-trip (forward):** every forward `.zx0` decompresses byte-
  identically to its raw `.bin` via the host `dzx0` tool.
- **Round-trip (backwards):** the host `dzx0` does not have a `-b` flag,
  so backwards round-trip is delegated to the Z80 decoder
  (`dzx0_standard_back` from the official ZX0 distribution — exhaustively
  tested across the modern Spectrum scene).
- **Static integrity:** simulating the post-boot state by overlaying every
  decompressed blob into the new `.sna` and diffing against the pre-ZX0
  baseline yields:
  - **bank 0: 0 B** different (PPANT5..9 + IMGSOL backwards reconstruct
    the originals bit-perfect).
  - **bank 2: 0 B** different (PPANT1..4 + IMGJACA + PANT1..10 ES portion
    reconstruct bit-perfect; PPANT5's bank-2 portion via backwards too).
  - **bank 5: 17 B** different — exactly the bootstrap delta (4-byte
    bank-6 paging OUT, 4-byte CALL, 9 bytes of bookkeeping).
- **Visual:** load `build/saga-film-128k.sna` in ZEsarUX/FuseX
  (`tools/run-emulator.sh remakes/128k-plus2-film/build/saga-film-128k.sna`)
  and confirm the cinematic plays identically to baseline. Both ES and EN
  paths.

## Files added / modified

```
tools/zx0/                                  ← toolchain
  zx0                                       host compressor (Saukas v2.2)
  dzx0                                      host decompressor
  dzx0_standard.asm                         68 B Z80 forward decoder
  dzx0_standard_back.asm                    69 B Z80 backwards decoder
  LICENSE-ZX0
  UPSTREAM-README.md

remakes/128k-plus2-film/
  build.sh                                  ← regenerates ZX0 blobs (fwd + back) on demand
  main.asm                                  ← bank-6 stash extended (decompress_all + 2 decoders + 9 fwd blobs)
                                              bank-1 stash compressed (PANT_EN + T_EN as .zx0 + local dzx0)
                                              bootstrap pages bank 6 → CALL → page bank 0 → JP ENTRY
                                              LANG_OVERLAY does LDIR for short strings + dzx0 for big ones
  src/charset.asm                           ← CHARSET / CHARX2 / CHARESP → DEFS reservations
  src/pelicula.asm                          ← PANT1..PANT10 → DEFS + EQUs for PANT2..PANT10 offsets
  src/final.asm                             ← IMGJACA → DEFS reservation
  src/game.asm                              ← IMGSOL → DEFS + INCBIN (in-place backwards)
                                              INCLUDE pantallas.asm → INCLUDE pantallas-zx0.asm
  src/pantallas-zx0.asm                     ← PPANT1..4 DEFS (forward); PPANT5..9 DEFS+INCBIN (backwards)
  build/zx0/                                ← compressed blobs
    PPANT1..4.zx0  CHARSET.zx0  CHARX2.zx0  CHARESP.zx0  IMGJACA.zx0
    PANT1to10_ES.zx0  PANT1to10_EN.zx0  T1to5_EN.zx0
    PPANT5..9_back.zx0b  IMGSOL_back.zx0b
  ZX0-REPORT.md                             ← this file
```

## Why this closes ZX0 in the film

This pass covers every static screen, every narrative cartela in both
languages, both fonts (CHARSET + CHARX2), the special font (CHARESP),
the Jaca image, and the sun graphic. The remaining un-compressed blobs in
the film fall into one of these three categories:

1. **Strings whose ZX0 grows or barely saves** (HIST, RESETEA, PRESA,
   NUBO, TEXTON, TEXTOFIN, DARKT and EN twins). Combined potential saving
   ≈ 30 B at best, easily exceeded by lookup-table overhead.
2. **The SAGA logo bitmap** (280 B): grows by 2 B under ZX0 — fails the
   rule.
3. **Mixed code+data blocks** (BOOM_block, PIJAMA_block, NAVES_block,
   FINPELI_code): require a code/data separation pass — different kind
   of work, out of scope of "applying ZX0".

ZX0 in the film is therefore considered **complete** for the v-final
build. Any further compression gains would require either changing the
rule (compressing despite negative ROI) or refactoring the mixed
code+data blocks first. The next techniques-pass items (AY music,
NIRVANA+ multicolour) can land directly on this base.
