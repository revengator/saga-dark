# Memory Map — `saga-dragon-128k.sna`

<!-- AUTO-MAP:BEGIN -->
_Regenerate with `tools/dragon-memory-map.py --update` after every `build.sh` that changes code/data layout._

| Range | First | Last | Size | Bank/slot |
|---|---|---|---:|---|
| `0x00005B00-0x00005B00` | `boot_start` | `boot_start` | single | bank 5 (slot 1) |
| `0x00005B00-0x00007901` | _gap_ | _gap_ | ** 7681 B free** | — |
| `0x00007901-0x00007B39` | `music_paused` | `music_init_victory` |   568 B | bank 5 (slot 1) |
| `0x00007B39-0x0000813D` | _gap_ | _gap_ | ** 1540 B free** | — |
| `0x0000813D-0x0000813D` | `PILA` | `PILA` | single | bank 2 (slot 2) |
| `0x0000813D-0x00009C40` | _gap_ | _gap_ | ** 6915 B free** | — |
| `0x00009C40-0x00009D87` | `ENTRY` | `COMPR` |   327 B | bank 2 (slot 2) |
| `0x00009D87-0x00009E98` | _gap_ | _gap_ | **  273 B free** | — |
| `0x00009E98-0x0000A23A` | `BEVOL1` | `ESPERA` |   930 B | bank 2 (slot 2) |
| `0x0000A23A-0x0000A549` | _gap_ | _gap_ | **  783 B free** | — |
| `0x0000A549-0x0000A59F` | `CPASO` | `CF1` |    86 B | bank 2 (slot 2) |
| `0x0000A59F-0x0000A7B3` | _gap_ | _gap_ | **  532 B free** | — |
| `0x0000A7B3-0x0000A7B3` | `ATBO` | `ATBO` | single | bank 2 (slot 2) |
| `0x0000A7B3-0x0000A8FB` | _gap_ | _gap_ | **  328 B free** | — |
| `0x0000A8FB-0x0000A8FB` | `ATCOL` | `ATCOL` | single | bank 2 (slot 2) |
| `0x0000A8FB-0x0000AEFC` | _gap_ | _gap_ | ** 1537 B free** | — |
| `0x0000AEFC-0x0000AEFC` | `BOCAS` | `BOCAS` | single | bank 2 (slot 2) |
| `0x0000AEFC-0x0000BA9C` | _gap_ | _gap_ | ** 2976 B free** | — |
| `0x0000BA9C-0x0000BA9C` | `PERSO` | `PERSO` | single | bank 2 (slot 2) |
| `0x0000BA9C-0x0000BFDD` | _gap_ | _gap_ | ** 1345 B free** | — |
| `0x0000BFDD-0x0000C882` | `SELO` | `song_pt3_data` |  2213 B | bank 2 (slot 2) |
| `0x0000C882-0x0000CAD6` | _gap_ | _gap_ | **  596 B free** | — |
| `0x0000CAD6-0x0000CAFE` | `victory_pt3_data` | `GRAF` |    40 B | bank 0 (slot 3 default) |
| `0x0000CAFE-0x0000CEFF` | _gap_ | _gap_ | ** 1025 B free** | — |
| `0x0000CEFF-0x0000CEFF` | `DRAGON` | `DRAGON` | single | bank 0 (slot 3 default) |
| `0x0000CEFF-0x0000FEFF` | _gap_ | _gap_ | **12288 B free** | — |
| `0x0000FEFF-0x0000FEFF` | `CARGADOR` | `CARGADOR` | single | bank 0 (slot 3 default) |
<!-- AUTO-MAP:END -->

> Auto-extracted from `sjasmplus --sym=dragon.sym main.asm` after filtering the
> `LXXXXh` / `SUB_xxxxh` auto-generated labels (they are noise in a
> disassembled source — only the human-named labels matter). The "free"
> column in the auto-table only measures **distance between labels**, not
> actual free RAM: ranges covered by INCBIN / DEFB without a label still show
> up as gaps. See the structural section below for the authoritative layout.

## Slot layout (Spectrum +2 128K)

| Slot | Z80 range | Active bank during the dragon |
|---|---|---|
| 0 | `0x0000-0x3FFF` | 48K BASIC ROM (paged at boot via `0x7FFD` bit 4 = 1) |
| 1 | `0x4000-0x7FFF` | bank 5 (always — the "fixed" bank with screen + bootstrap + sysvars) |
| 2 | `0x8000-0xBFFF` | bank 2 (always — first half of dark3 code) |
| 3 | `0xC000-0xFFFF` | bank 0 (default — second half of dark3 code) |

**Pageable banks 1, 3, 4, 6, 7: entirely free in this build (80 KB total).**
The dragon is a self-contained minigame so they sit empty inside the `.sna`.
Reserved for future subversions (AY music, multicolour, language overlays).

---

## Authoritative layout (`0x4000-0xFFFF`)

| Range | Content | Source | Notes |
|---|---|---|---|
| `0x4000-0x57FF` | Screen pixels (6 144 B) | `src/screen.bin` (INCBIN) | Same bitmap as the offscreen title — byte-identical to `src/offscreen-title.bin`. Visible at boot; INICIO LDIRs the offscreen over it (no-op visually since both have the same content). |
| `0x5800-0x5AFF` | Screen attributes (768 B) | `src/screen.bin` (tail) | |
| `0x5B00` | `boot_start` — bootstrap entry (~10 B) | `main.asm` | DI / paging / IM 1 / EI / `JP ENTRY` |
| `0x5B0A-0x5BFF` | Free (~245 B, printer-buffer area) | — | Available for future bootstrap extensions |
| `0x5C00-0x7776` | System vars + Dark 3 boot tables (pre-IM2 zone, 7 543 B) | `src/sysvars-data.asm` | Islands 1-5: BASIC sysvars (0x5C00/0x5C37/0x5C74), leftover BASIC program (0x5CB2), init scratch (0x6187), inside `DEFS` zero fill. |
| `0x7777-0x7AFF` | **IM 2 + master_im2 + PT3 helpers (905 B reserved)** | `src/music/master_im2.asm` | `JP master_im2` @ 0x7777 (3 B), IM 2 table @ 0x7800-0x7900 (257 B 0x77), `master_im2` + `music_paused` + `music_tick/init/pause/resume` + `song_pt3_data` EQU @ 0x7901-0x796C (107 B). I=0x78 → vector reads (0x78FF, 0x7900) = (0x77, 0x77) → JP target = 0x7777. |
| `0x7B00-0x813F` | System vars + Dark 3 boot tables (post-IM2 zone, 1 600 B) | `src/sysvars-data.asm` | Island 6: pointer table at 0x812F (17 B incl. `PILA`'s pre-pushed return-to-`INICI2` at 0x813D-0x813E) inside `DEFS` zero fill. **`PILA` = stack base = `0x813D`** — stack grows down into this region. |
| `0x8140-0x9C3F` | Offscreen title buffer (6 912 B) | `src/offscreen-title.bin` (INCBIN) | ⚠️ **DO NOT RECLAIM.** Empirically (2026-05-12) the gameplay engine reuses this region as a sprite/tile source for sky / ground / dragon-body rendering. References from `dragon.asm` are computed (IX+disp, table lookups), not literal hex operands, so static grep misses them. Reclaiming the region corrupts gameplay (title screen still looks fine, but post-INICI2 the dragon body / sky / ground come out from zero'd bytes). See user-memory `feedback_dragon_offscreen_sprite_source.md`. |
| `0x9C40-0xBFFF` | Dark 3 code + data + sprites (first half) | `src/dragon.asm` | Bank 2. Includes `ENTRY=0x9C40`, `INICIO=0x9F7E`, `INICI2=0x9F89`, the main game loop and sprite tables. See the auto-section above for the address-ordered label list. |
| `0xC000-0xFEFE` | Dark 3 code + data + sprites (second half) | `src/dragon.asm` | Bank 0 (slot 3). |
| `0xFEFF-0xFFFF` | `CARGADOR` — original cassette loader | `src/dragon.asm` | Dead code from the +2 perspective (the `.sna` is loaded directly into memory; `CALL 0x0556` LOAD-BYTES is never executed). Kept byte-for-byte for fork-purity. |

---

## Bank-by-bank summary

| Bank | Slot | Used | Free (hard) | Notes |
|---|---|---:|---:|---|
| 5 | slot 1 (always) | ~16 384 B | ~245 B | Screen + bootstrap + sysvars. The 6 912 B "zero" at 0x4000-0x5AFF is screen RAM (not free). The 9 KB of zeros at 0x5C00-0x813F are sysvars/system area, not generic free space (the stack lives at the tail). |
| 2 | slot 2 (always) | ~16 384 B | ~0 B | Offscreen title buffer + dark3 code (first half). Offscreen is **load-bearing during gameplay** (see warning above). |
| 0 | slot 3 (default) | ~16 384 B | ~0 B | Dark 3 code + data + sprites (second half) + cassette loader. |
| 1, 3, 4, 6, 7 | pageable | 0 B | **80 KB total** | Completely free. Available for future subversions. |

---

## Critical "do not touch" zones

1. **`0x8140-0x9C3F`** — offscreen title buffer, also a sprite/tile source during gameplay. Cannot be reclaimed without breaking the dragon's renderer. See the dedicated comment in `main.asm` and `feedback_dragon_offscreen_sprite_source.md`.
2. **`0x813D` (PILA)** — stack base. The pointer table at `0x812F-0x813F` contains a pre-pushed return-to-`INICI2` at `0x813D-0x813E` that Dark 3 relies on for the "return to title" flow. Don't change `PILA` without rewriting that table.
3. **`0x9C40`** (ENTRY) — fixed entry. `JP ENTRY` is the bootstrap target; the original cassette loader also re-enters here on game restart via `CARGADOR`'s `JP L9C40H`.
4. **`0x7777-0x7AFF` (IM 2 zone)** — moving any of: the `JP master_im2` trampoline (0x7777-0x7779), the IM 2 table (0x7800-0x7900, 257 B 0x77), or the handler (0x7901+) requires re-deriving the I register value in `boot_start` and the table-fill byte. The three are tied: I = table_byte + 1; vector target = table_byte × 0x101.

---

## Refreshing this map

When `main.asm`, `src/dragon.asm`, `src/sysvars-data.asm` or any include changes:

```bash
cd remakes/128k-plus2-dragon
./build.sh                                # rebuilds + emits dragon.sym
python3 ../../../tools/dragon-memory-map.py --update
```

The auto-section between the `AUTO-MAP:BEGIN` / `AUTO-MAP:END` markers is
regenerated. Hand-edited sections (this whole document outside those markers)
are preserved.
