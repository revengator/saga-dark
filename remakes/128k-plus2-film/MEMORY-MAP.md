# Memory Map — `saga-film-128k.sna`

<!-- AUTO-MAP:BEGIN -->
_Regenerate with `tools/film-memory-map.py --update` after every `build.sh` that changes code/data layout._

| Range | First | Last | Size | Bank/slot |
|---|---|---|---:|---|
| `0x00005B00-0x00005B98` | `boot_start` | `wipe_menu` |   152 B | bank 5 (slot 1) |
| `0x00005B98-0x00005DC4` | _gap_ | _gap_ | **  556 B free** | — |
| `0x00005DC4-0x00006244` | `MAIN` | `CHARSET` |  1152 B | bank 5 (slot 1) |
| `0x00006244-0x0000642C` | _gap_ | _gap_ | **  488 B free** | — |
| `0x0000642C-0x0000642C` | `SAGA` | `SAGA` | single | bank 5 (slot 1) |
| `0x0000642C-0x00006544` | _gap_ | _gap_ | **  280 B free** | — |
| `0x00006544-0x00006544` | `CHARX2` | `CHARX2` | single | bank 5 (slot 1) |
| `0x00006544-0x00006844` | _gap_ | _gap_ | **  768 B free** | — |
| `0x00006844-0x00006844` | `CHARESP` | `CHARESP` | single | bank 5 (slot 1) |
| `0x00006844-0x00006B44` | _gap_ | _gap_ | **  768 B free** | — |
| `0x00006B44-0x000074A3` | `PIJAMA` | `CORDIL` |  2399 B | bank 5 (slot 1) |
| `0x000074A3-0x00007653` | _gap_ | _gap_ | **  432 B free** | — |
| `0x00007653-0x00007E10` | `GRUTA1` | `PANT4` |  1981 B | bank 5 (slot 1) |
| `0x00007E10-0x00007F13` | _gap_ | _gap_ | **  259 B free** | — |
| `0x00007F13-0x00007FF6` | `PANT5` | `PANT6` |   227 B | bank 5 (slot 1) |
| `0x00007FF6-0x000080F9` | _gap_ | _gap_ | **  259 B free** | — |
| `0x000080F9-0x000080F9` | `PANT7` | `PANT7` | single | bank 2 (slot 2) |
| `0x000080F9-0x0000827D` | _gap_ | _gap_ | **  388 B free** | — |
| `0x0000827D-0x0000827D` | `PANT8` | `PANT8` | single | bank 2 (slot 2) |
| `0x0000827D-0x00008380` | _gap_ | _gap_ | **  259 B free** | — |
| `0x00008380-0x000084CD` | `PANT9` | `CIUPE` |   333 B | bank 2 (slot 2) |
| `0x000084CD-0x0000867D` | _gap_ | _gap_ | **  432 B free** | — |
| `0x0000867D-0x00008868` | `IMGFUEGO` | `SCREEN_BUF` |   491 B | bank 2 (slot 2) |
| `0x00008868-0x00008C68` | _gap_ | _gap_ | ** 1024 B free** | — |
| `0x00008C68-0x00008C68` | `COLOR3` | `COLOR8` | single | bank 2 (slot 2) |
| `0x00008C68-0x00009068` | _gap_ | _gap_ | ** 1024 B free** | — |
| `0x00009068-0x00009068` | `COLOR2` | `COLOR2` | single | bank 2 (slot 2) |
| `0x00009068-0x0000BC00` | _gap_ | _gap_ | **11160 B free** | — |
| `0x0000BC00-0x0000BC53` | `current_anim` | `anim_off` |    83 B | bank 2 (slot 2) |
| `0x0000BC53-0x0000BE00` | _gap_ | _gap_ | **  429 B free** | — |
| `0x0000BE00-0x0000BE4C` | `show_pantalla` | `dzx0_standard` |    76 B | bank 2 (slot 2) |
| `0x0000BE4C-0x0000C000` | _gap_ | _gap_ | **  436 B free** | — |
| `0x0000C000-0x0000C8B2` | `PPANT4_ZX0` | `CHARESP_ZX0` |  2226 B | bank @ slot 3 (default: bank 0) |
| `0x0000C8B2-0x0000CB00` | _gap_ | _gap_ | **  590 B free** | — |
| `0x0000CB00-0x0000CBAE` | `LANG_OVERLAY` | `IMGJACA_ZX0` |   174 B | bank @ slot 3 (default: bank 0) |
| `0x0000CBAE-0x0000CDC2` | _gap_ | _gap_ | **  532 B free** | — |
| `0x0000CDC2-0x0000CEB6` | `PPANT3_ZX0` | `PPANT5_ZX0` |   244 B | bank @ slot 3 (default: bank 0) |
| `0x0000CEB6-0x0000D055` | _gap_ | _gap_ | **  415 B free** | — |
| `0x0000D055-0x0000D055` | `PPANT8_ZX0` | `PPANT8_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000D055-0x0000D410` | _gap_ | _gap_ | **  955 B free** | — |
| `0x0000D410-0x0000D410` | `PPANT2_ZX0` | `PPANT2_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000D410-0x0000D7ED` | _gap_ | _gap_ | **  989 B free** | — |
| `0x0000D7ED-0x0000D7ED` | `PPANT6_ZX0` | `PPANT6_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000D7ED-0x0000DE5A` | _gap_ | _gap_ | ** 1645 B free** | — |
| `0x0000DE5A-0x0000DE5A` | `PPANT9_ZX0` | `PPANT9_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000DE5A-0x0000DF5F` | _gap_ | _gap_ | **  261 B free** | — |
| `0x0000DF5F-0x0000DF5F` | `PPANT1_ZX0` | `PPANT1_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000DF5F-0x0000EA9F` | _gap_ | _gap_ | ** 2880 B free** | — |
| `0x0000EA9F-0x0000EA9F` | `PPANT7_ZX0` | `PPANT7_ZX0` | single | bank @ slot 3 (default: bank 0) |
| `0x0000EA9F-0x0000FF01` | _gap_ | _gap_ | ** 5218 B free** | — |
| `0x0000FF01-0x0000FF01` | `TEXTOFIN` | `TEXTOFIN` | single | bank @ slot 3 (default: bank 0) |
<!-- AUTO-MAP:END -->

> Auto-extracted from `sjasmplus --sym=film.sym main.asm` (refresh after every meaningful structural change). Used to avoid stepping on data when adding new code/blocks (e.g. the language overlay).

## Slot layout (Spectrum +2 128K)

| Slot | Z80 range | Active bank during the film |
|---|---|---|
| 0 | `0x0000-0x3FFF` | 48K BASIC ROM (paged at boot via `0x7FFD` bit 4 = 1) |
| 1 | `0x4000-0x7FFF` | bank 5 (always — the "fixed" bank with screen) |
| 2 | `0x8000-0xBFFF` | bank 2 (always) |
| 3 | `0xC000-0xFFFF` | bank 0 (default; **bank 6 paged at boot for ZX0 decompress; banks 6/7 paged on demand by `show_pantalla`; bank 1 during the language overlay; bank 3 every IM2 music tick**) |

Pageable banks: **3** hosts the PT3 player + both AY modules (see below); **6** and **7** host the ZX0 stash + boot decoder (bank 7 takes the PPANT4/5/9 overflow); **4** is the only fully free bank — reserved for future subversions (NIRVANA+ buffers, more language packs, etc.).

---

## Free space summary (post AY soundtrack + Track A swap, 2026-06-12)

Available room for new features (NIRVANA+ multicolour tables, more language packs, additional ZX0 blobs, etc.). Numbers measured directly from `build/saga-film-128k.sna` (trailing-zero scan per bank, validated against the source layout). "Hard free" excludes runtime-filled buffers (PPANT/IMGJACA/`SCREEN_BUF`/PANT1..10 regions are DEFS-zeroed in the snapshot but get filled by `decompress_all` / `show_pantalla` — not usable).

| Bank | Slot use | Used (live) | Free (hard) | Notes |
|---|---|---:|---:|---|
| 0 | slot 3 default | 16 384 B | ~0 B | IM2 vector at 0xFDFD + film data/buffers. Internal zero runs are runtime-filled — not usable. |
| 1 | slot 3 (lang overlay) | 2 985 B | **14 499 B** | 13 399 B free tail (0xCBA9..0xFFFF) + 1 100 B gap (0xC6B4..0xCAFF) between ZX0 blobs and `LANG_OVERLAY @0xCB00`. |
| 2 | slot 2 (always) | 16 384 B | ~0 B | Live film code + buffers; `master_im2` + `music_*` at 0xBC02+, `show_pantalla` + `dzx0_standard` fill the tail through 0xBE8F. |
| 3 | slot 3 (music tick) | 9 408 B | **6 976 B** | PT3 player r.7 + VARS (0xC000..0xC87F) + Track A `entertainer.pt3` (5 188 B @0xC880) + Track B `bushido.pt3` (2 044 B @0xDCC4). Free tail 0xE4C0..0xFFFF. |
| 4 | pageable | 0 B | **16 384 B** | Completely free. |
| 5 | slot 1 (always) | 16 384 B | ~0 B | Content runs to 0x7BAE; from `PANT1 @0x7BAF` the ES-cartela runtime region (2 269 B, crosses into bank 2). Screen RAM at 0x4000..0x5AFF. |
| 6 | slot 3 (boot + on-demand) | 14 448 B | **1 936 B** | Free tail at 0xF870..0xFFFF (above the ZX0 forward blobs — see the bank 6 section). |
| 7 | slot 3 (on-demand) | 11 610 B | **4 774 B** | PPANT4/5/9 ZX0 overflow stash; free tail at 0xED5A..0xFFFF. Doubles as shadow-screen target if `0x7FFD` bit 3 set. |
| | | | **~45 KB** | Total **hard-free** across the 128 KB. |

**Practical landing zones** for the upcoming techniques pass:

- **AY tracker:** ✅ delivered (2026-05) — Bulba PT3 player r.7 + Track A + Track B in bank 3, ~6.8 KB margin left.
- **NIRVANA+ multicolour for the narrative cartelas:** bank 4 (16 KB for the multicolour line tables + intermediate buffers — fits comfortably).
- **More language packs (FR, IT, …):** bank 1 tail (13.5 KB) is the cleanest fit since the LDIR + ZX0 infrastructure is already there.
- **Additional ZX0 blobs:** bank 7 tail (4.7 KB) or bank 6 tail (1.9 KB) — extend `show_pantalla`'s bank table if the blob is on-demand.

---

## Bank 5 (slot 1, `0x4000-0x7FFF`)

| Range | Content | Notes |
|---|---|---|
| `0x4000-0x57FF` | Screen pixels (6912 B) | Initialised to `0x00` in main.asm via DEFS so the emulator doesn't show 0xFF flash before TART clears |
| `0x5800-0x5AFF` | Screen attributes (768 B) | Same — DEFS-zeroed |
| `0x5B00-0x5B13` | Bootstrap code (~20 B) | DI / paging / IM 1 / EI / `JP ENTRY` |
| `0x5B14-0x5BFF` | Free (~235 B in printer-buffer area) | Available for future bootstrap extensions |
| `0x5C00-0x5DBF` | BASIC system vars area | Spectrum standard (CHANS at 0x5C4F, CHARS at 0x5C36, FLAGS at 0x5C3B). The Film uses 0x5C36/0x5C3B (CHARS, FLAGS) explicitly |
| `0x5DBF` | `STACK_BASE` / `PILA` | Stack top — Z80 SP at boot |
| `0x5DC0` | `INICIO` / Film entry | First instruction of game.asm |
| `0x5DC4` | `MAIN` | Main cinematic flow start |

### game.asm code & data (`0x5DC0-0x5F??`)
| Addr | Label | Notes |
|---|---|---|
| `0x5DC0` | `INICIO` | Border 0; falls into MAIN |
| `0x5DC4` | `MAIN` | POKSET / CLS / TEXTO / BORDE / DARKT / LANG_MENU / wait / overlay / RAINM2 / cinematic |
| `0x5E05` | `NUBE` | HALT loop (rainbow timing) |
| `0x5E13` | `ESPERA` | Wait-for-key bridge |
| `0x5E18` | `GUSANO` | Worm scrolling routine |
| `0x5E36` | `CONT8` | Continuation |
| `0x5E4A` | `ESTASS` | "Estas son las personas..." sequence |
| `0x5E81` | `HIST` (DEFM, 32 B) | "LA HISTORIA COMIENZA ..." text block |
| `0x5EA1` | `NUBO` (DEFM, 83 B) | "Estas son las personas..." 3 lines |
| `0x5EF4` | `RAINM2` | IM 2 raindrops setup (`LD A,254; LD I,A; IM 2; RET`) |
| `0x5EFB` | `OUTM2` | IM 1 reset (`IM 1; RET`) |
| `0x5F28` | `DARKT` (data, 76 B) | DARK logo char codes |
| `0x5F74` | `PRESA` (DEFM, 32 B) | "PULSE  UNA  TECLA              " — scrolled by TONI |
| `0x5F94` | `LANG_MENU` (~37 B) | "1 - ESPANOL / 2 - ENGLISH" |

### libreria.asm code (`0x5FB9-0x?`) and various data
| Addr | Label |
|---|---|
| `0x5FB9` | `IMPREC` / `IMPROC` (print routine) |
| `0x5FC8` | `IMPRE2` |
| `0x5FE3` | `IMPRE3` |
| `0x5FFB` | `IMPRE4` |
| `0x601A` | `IMPRE5` |
| `0x6066` | `POKSET` |
| `0x609D` | `BORDE` |
| `0x60BD` | `SCROLL` |
| `0x60EA` | `TONI` (scrolls PRESA) |
| `0x61B3` | `GOTAS` (IM2 raindrop handler) |

### charset.asm (`0x6245-0x?`)
| Addr | Label |
|---|---|
| `0x6245` | `CHARSET` (custom 256-char font) |
| `0x642D` | `SAGA` (logo bitmap data) |

### pijama.asm (`0x6B45-0x?`)
| Addr | Label |
|---|---|
| `0x6B45` | `PIJAMA` (entry of pyjama scene) |
| `0x6E14` | `CCDAT` |
| `0x6EA6` | `TONII` |
| `~0x6F??` | `CERO` / `T1` / `T2` / `T3` / `T4` / `T5` (credits) — contiguous block ~195 B for T1..T5 |

### jaca.asm (`0x7086-0x?`)
| Addr | Label |
|---|---|
| `0x7086` | `LAJACA` |
| `0x70B0` | `TEXTON` (DEFM block, 82 B) — "UNA ESBELTA FIGURA AVANZA POR / LA ARIDEZ DEL DESIERTO." |

---

## Bank 2 (slot 2, `0x8000-0xBFFF`)

The cursor crosses from bank 5 into bank 2 mid-pelicula.asm. Bank 2 contains the rest of the film code/data.

| Addr | Label / content | Notes |
|---|---|---|
| `0x7711` | `PELICULA` | Start of pelicula.asm code |
| `0x7727` | `CIUDAD1` | Screen 2 — futuristic city |
| `0x777B` | `BOOM` | Screen 3 — explosion |
| `0x7B73` | `PANT1` (195 B) | "Hijo mio... han sido largos años..." (4 + 2 lines) |
| `0x7C36` | `PANT2` (227 B) | "Hace muchos años..." (4 + 3 lines) |
| `0x7D19` | `PANT3` (195 B) | "Gigantescos arboles..." (4 + 2 lines) |
| `0x7DDC` | `PANT4` (259 B) | "Solo unos pocos..." (4 + 4 lines) |
| `0x7EDF` | `PANT5` (227 B) | "Los remotos y olvidados tiempos..." (4 + 3 lines) |
| `0x7FC2` | `PANT6` (259 B) | "El y su tropa..." (4 + 4 lines) |
| `0x80C5` | `PANT7` (388 B) | "Kamuir, el segundo dark..." (3 pages × 4 lines) |
| `0x8249` | `PANT8` (259 B) | "Estuve al borde de la muerte..." (4 + 4) |
| `0x834C` | `PANT9` (130 B) | "Por segunda vez destruyo todo..." (4 lines) |
| `0x83CE` | `PANT10` (130 B) | "Fue sobre la tumba..." (4 lines) |
| `0x8450` | `NAVES` | UFO sprite control bytes |
| `0x845D` | `NAVES2` | UFO sprite data |
| `0x8499` | `CIUPE` | City sprite tile |
| `0x86FD` | `FINPELI` | Final scene routine |
| `0x873E` | `BUFIN` | Final loop |
| `0x8741` | `IMPREFIN` | Final print routine |
| `0x8762` | `EX2` | E ampliada control bytes |
| `0x8773` | `TXTSOL` | Sun graphic control bytes |
| `0x8778` | `TXTJACA` | Jaca graphic control bytes |
| `0x877D` | `RESETEA` (32 B) | "RESETEA Y CARGA EL JUEGO" |
| `0x879D` | `CARASFIN` | Faces of the team at the end |
| `0x882A` | `IMGJACA` | Jaca image data |
| `0x8AFA` | `PPANT1` | Screen 1 (abuelo) sprite data — start of `pantallas-zx0.asm` buffer reservations (filled at boot by `decompress_all` from the bank-6 `PPANT1.zx0` blob; original `pantallas.asm` kept in `src/` as uncompressed reference, no longer INCLUDE'd) |
| `0x9AFA` | `PPANT2` | Screen 2 sprite (city) |
| `0xA3FA` | `PPANT3` | Screen 3 sprite (boom) |
| `0xA87A` | `PPANT4` | Screen 4 sprite |
| `0xBA7A` | `PPANT5` | Screen 5 sprite |

(Bank 2 ends at `0xBFFF`.)

---

## Bank 0 (slot 3 default, `0xC000-0xFFFF`)

| Addr | Label / content |
|---|---|
| `0xCC7A` | `PPANT6` (continues `pantallas-zx0.asm`) |
| `0xD57A` | `PPANT7` |
| `0xE77B` | `PPANT8` |
| `0xEBFB` | `PPANT9` |
| `0xFDFB` | `FINCODIGO` (zero pad ends here) |
| `0xFDFD` | **IM2 vector trampoline** — `JP GOTAS`. Critical: Z80 IM 2 jumps here when interrupts fire |
| `0xFE00-0xFEFF` | IM 2 fill table (256+ B of `0xFD`) — required for the Z80 interrupt vector lookup |
| `0xFF01` | `IMGSOL` (180 B) — sun graphic data |
| `0xFFB5` | `TEXTOFIN` (65 B) | "STE ES EL FINAL DE LA HISTORIA / LO DEMAS ES COSA TUYA." |
| `0xFFF6` | `FINCODIGO2` (1 B `0`) — last byte of film |

**Hard limit:** `0xFFFF`. Any code/data beyond this overflows. Adding code in `game.asm`/`pelicula.asm`/etc. shifts everything; if the cursor crosses `0xFDFD` before reaching the IM 2 vector, sjasmplus emits `Negative BLOCK moves PC backwards` warning AND the IM 2 mechanism corrupts.

---

## Bank 1 (pageable, ENGLISH stash + overlay routine — ZX0-compressed)

Paged into slot 3 only during the language overlay (game.asm INICIO when user picks "2"). Otherwise dormant.

| Range | Block | Notes |
|---|---|---|
| `0xC000-0xC01F` | `PRESA_EN` (32 B raw) | Short — LDIR'd over `PRESA` (`0x5F74`) |
| `0xC020-0xC03F` | `HIST_EN` (32 B raw) | LDIR'd over `HIST` (`0x5E81`) |
| `0xC040-0xC092` | `NUBO_EN` (83 B raw) | LDIR'd over `NUBO` (`0x5EA1`) |
| `0xC093-0xC0D3` | `TEXTOFIN_EN` (65 B raw) | Staged to bank 5, then `lang_final` LDIRs to `TEXTOFIN` (`0xFFB5`) |
| `0xC0D4-0xC125` | `TEXTON_EN` (82 B raw) | LDIR'd over `TEXTON` (`0x70B0`, jaca.asm) |
| `0xC126-0xC145` | `RESETEA_EN` (32 B raw) | LDIR'd over `RESETEA` (`0x877D`, final.asm) |
| `0xC146-0xC1D7` | `T_EN_ZX0` (146 B) | **ZX0** → `T1` (`0x6D50`, pijama.asm — 195 B raw) |
| `0xC1D8-0xC6B3` | `PANT_EN_ZX0` (1 244 B) | **ZX0** → `PANT1` (`0x7B72`, pelicula.asm — 2 269 B raw) |
| `0xC6B4-0xCAFF` | Free (~1 100 B) | |
| `0xCB00-0xCB40` | `LANG_OVERLAY` (65 B) | LDIRs short EN strings + CALLs `dzx0_local` for the 2 big blobs |
| `0xCB41-0xCB64` | `LANG_TABLE` (5 entries × 6 + terminator = 36 B) | Now only short EN strings — big ones go through dzx0 |
| `0xCB65-0xCBA8` | `dzx0_local` (68 B) | Local copy of `dzx0_standard` (`MODULE bank1` to avoid label clash with bank-6 copy) |
| `0xCBA9-0xFFFF` | Free (~13.5 KB) | Available for additional language packs, NIRVANA+ AY data, etc. |

### LANG_OVERLAY behaviour
1. Game.asm pages bank 1 in slot 3 (`OUT 0x7FFD, 0x11`).
2. `CALL 0xCB00` → stages `TEXTOFIN_EN` to bank 5, LDIRs the 5 small EN strings, then ZX0-decompresses `T_EN_ZX0` → `T1` and `PANT_EN_ZX0` → `PANT1` via the local `dzx0_standard` copy.
3. Returns. Game.asm pages bank 0 back in slot 3 (`OUT 0x7FFD, 0x10`) and `lang_final` (in bank 5) finishes the `TEXTOFIN` staging copy.

---

## Bank 6 (pageable, boot decoder + ZX0 stash)

Post-B+ layout — all blobs are FORWARD; the in-place backwards scheme was retired (see [`ZX0-REPORT.md`](ZX0-REPORT.md)). At boot the bootstrap pages bank 6 and calls `decompress_all @0xC000`, which decompresses only the **resident** blobs (ES cartelas + the three fonts) by calling `dzx0_standard` in bank 2 (slot 2 fixed). Everything else is decompressed **on demand** by `show_pantalla @0xBE00` (bank 2), which pages bank 6 or 7 per its bank table and decodes into `SCREEN_BUF=0x8870`.

| Range | Block | Notes |
|---|---|---|
| `0xC000-0xC036` | `decompress_all` (35 B) + resident table (5 × 4 B) | `(src_zx0, dst_logical)`, zero-terminated |
| `0xC037-0xC4FE` | `PANT_ES.zx0` (1 224 B) | boot → `PANT1=0x7BAF` (2 269 B; `PANT2..PANT10` via EQU offsets) |
| `0xC4FF-0xC665` | `CHARSET.zx0` (359 B)  | boot → `CHARSET=0x6244` (488 B) |
| `0xC666-0xC8B1` | `CHARX2.zx0` (588 B)   | boot → `CHARX2=0x6544` (768 B) |
| `0xC8B2-0xCB13` | `CHARESP.zx0` (610 B)  | boot → `CHARESP=0x6844` (768 B) |
| `0xCB14-0xCBAD` | `IMGSOL.zx0` (154 B)   | on demand |
| `0xCBAE-0xCDC1` | `IMGJACA.zx0` (532 B)  | on demand |
| `0xCDC2-0xD054` | `PPANT3.zx0` (659 B)   | on demand |
| `0xD055-0xD40F` | `PPANT8.zx0` (955 B)   | on demand |
| `0xD410-0xD7EC` | `PPANT2.zx0` (989 B)   | on demand |
| `0xD7ED-0xDF5E` | `PPANT6.zx0` (1 906 B) | on demand |
| `0xDF5F-0xEA9E` | `PPANT1.zx0` (2 880 B) | on demand |
| `0xEA9F-0xF86F` | `PPANT7.zx0` (3 537 B) | on demand |
| `0xF870-0xFFFF` | Free (1 936 B) | Available for future blobs |

See [`ZX0-REPORT.md`](ZX0-REPORT.md) for the full compression report and per-blob byte savings.

## Bank 7 (pageable, ZX0 overflow stash)

The three largest blobs overflow here (~26 KB of ZX0 total does not fit in bank 6 alone). All on-demand via `show_pantalla`. Bank 7 also doubles as the shadow screen (bit 3 of `0x7FFD`) — unused by the film.

| Range | Block |
|---|---|
| `0xC000-0xCEB5` | `PPANT4.zx0` (3 766 B) |
| `0xCEB6-0xDE59` | `PPANT5.zx0` (4 004 B) |
| `0xDE5A-0xED59` | `PPANT9.zx0` (3 840 B) |
| `0xED5A-0xFFFF` | Free (4 774 B) |

## Bank 3 (pageable, AY soundtrack)

Paged into slot 3 by `music_init` / `music_switch_b` and on every IM2 `music_tick`. See [`SOUNDTRACK.md`](SOUNDTRACK.md).

| Range | Block |
|---|---|
| `0xC000-0xC87F` | Bulba PT3 player r.7 + VARS (`INIT=0xC003`, `PLAY=0xC005`, `MUTE=0xC008`; ROUT_A0 volume right-shift disabled → full volume) |
| `0xC880-0xDCC3` | Track A — `entertainer.pt3` (5 188 B; The Entertainer, Joplin, PD; dynamics + tempo remaster) |
| `0xDCC4-0xE4BF` | Track B — `bushido.pt3` (2 044 B; Bushido (Vispera), original 2026; v5 extended to 18 patterns / ~92 s) |
| `0xE4C0-0xFFFF` | Free (6 976 B) |

## Bank 4

**Completely free** (16 384 B) — the landing zone for future subversions: NIRVANA+ multicolour buffers, additional language packs, etc.

---

## Critical "do not touch" zones

Avoid placing new code/data on top of these (regardless of bank):

1. **`0xFDFD`** — IM 2 trampoline. The Film registers `LD I, 0xFE; IM 2` so any interrupt jumps to address `(databus_byte<<8) + 0xFE`. The 256+ B fill table at `0xFE00-0xFF00` ensures the lookup returns `0xFDFD` regardless of databus byte.
2. **Bank 5 0x4000-0x5AFF** — screen. Anything written here is visible on display.
3. **Bank 5 `0x5B00-0x5DBF`** is mostly safe (printer buffer + system vars) but be careful — the bootstrap and a few system vars (`0x5C36 CHARS`, `0x5C3B FLAGS`) are used.
4. **PANT1..PANT10 (`0x7BAF-0x848B`, 2269 B contiguous)** — narrative blocks. The English overlay LDIRs over this region. Any new content must respect the 2269 byte total.

---

## Refreshing this map

When you change `main.asm`, `src/game.asm`, or any include, regenerate:

```bash
cd remakes/128k-plus2-film
sjasmplus --sym=/tmp/film.sym main.asm
grep -E "^(PANT|TEXT|HIST|NUBO|PRESA|DARKT|RESETEA|...)" /tmp/film.sym
```

Then update the tables above. The map is structural documentation — the source of truth is always the `.sym` output.

The "Free space summary" table at the top is generated from the built `.sna` (trailing-zero scan per bank). Refresh it whenever the build grows by a non-trivial amount.
