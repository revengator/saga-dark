# SAGA DARK — Project Context

> Living file. Updated after every action — this is the only context that persists across sessions.
> Last update: 2026-06-13 — **Film Track B → *Bushido (Vispera)*, original (F1 ✅).** User judged the interim *Vigilia* not up to par; after auditioning native originals composed on spectrumizer's pt3 library (`pt3-compose-toccata.py` Bach BWV 565 PD, `pt3-compose-bushido.py` samurai war suite), the user kept the samurai suite's first movement expanded to a full piece: **`tools/pt3-compose-bushido.py` → `src/music/bushido.pt3`** (2044 B, miyako-bushi on D, shakuhachi/koto/taiko eve-of-battle build + resignación movement, seamless loop; v5 2026-06-13 extended to 18 patterns / ~92 s + full-volume player). `vigilia.pt3` removed (git history); `test-music.asm` repointed; doc sweep README/film-README/SOUNDTRACK/MEMORY-MAP (bank 3: 6 976 B free; ~45 KB hard-free). Previous 2026-06-12: Track A → *The Entertainer* (Joplin PD, our Mutopia arrangement, re-voiced 2026-06-13 for dynamics + ~94 BPM tempo via `tools/pt3-remaster-entertainer.py`, 5188 B), verified in ZEsarUX. Previous 2026-06-08 (Platformer — **player left/right facing flip DONE + verified visually in Phase 1 AND Phase 2.** The player is TWO queued sprites (TABLA1 body + TABLA2 legs); the engine already mirrors any sprite in place via `SDERE`/`SIZQUI`→`SPEJO` (reads the bit-reverse table at 0xFF00 → needs bank 0 in slot 3, fine in the main loop). New `player_face` (master_im2.asm, chained off `dmg_border`) flips BOTH tables on the L/R key. Body box widths vary per anim phase (bpr 6,6,4,4,7) vs legs bpr 5, so the mirrored body lands off the legs; **`pf_correct`** (reuses the dead 43-byte `PSIDE` slot in `collisions.asm`, `IFDEF UNIFIED_PLATFORMER`; byte-perfect builds keep PSIDE in the ELSE) sets `body.X = legs.X + pf_tbl[facing][phase]` absolutely each frame. Tables (X is PIXELS — move steps 4px, SALIR 8/200): **R = 0,0,0,0,+8**, **L = -8,-8,+8,+8,-24** (exact mirror of the perfect right-facing fire — the body waist stays on the legs, spear extends left; +8/-24 at phase 5 = the SIG spear thrust). **THE fix that made firing stop "dancing": timing, not values** — `dmg_border` (border flash + `player_face` flip + `pf_correct`) was MOVED in the UNIFIED loop (`game-loop.asm`) from after `DDDDDD` to before `BBBBBB`, so `pf_correct` sees the anim phase `ANTIC2` just set instead of running a frame late (phase N drawn with phase N-1's offset). Moved not added → byte-count unchanged → `NU1` stays 0xA8EC (Phase-2 stash ASSERT). Validation/format tool: `tools/flip-player-sprite.py`. **Screen-edge fix (2026-06-04):** `SALIR` (collisions.asm) keyed screen transitions off the BODY X (`TABLA1+1`), which `pf_correct` shifts (−24 facing left at the thrust phase) → turning/firing near a boundary triggered a spurious screen change (appeared on the adjacent screen's far edge); now reads the LEGS X (`TABLA2+1` = the true world position) under `IFDEF UNIFIED_PLATFORMER` (zero-shift, both reads; dark1/dark2 stay byte-perfect). NOT an original bug — introduced by the flip's body-X offset. **VISCOSA boss (Phase 1) tuned (ed53775); Phase-2 final boss GLOBMAN ('Viscosa del Pantano') tuned 2026-06-04** — was near-unkillable (VMALO threshold 0x2F + 6-frame gate + hidden VARB power-up scaling ≈ 288 contact-frames); 3 zero-shift operand edits in `levels/phase2/enemies/globman.asm` halve it (≈144) AND sync the HUD face: `JR z,SININ`→`JR SININ` (VIVE face-erase runs every round not every 2nd), `ADD a,b`→`INC a` (VMALO = round count, VARB-decoupled), `SBC a,0x2F`→`SBC a,0x18` (24 rounds = 24 VIVE calls = the 24-scanline boss face empties exactly at death). GLOBMAN is only damageable in its FLOATING state; the 'walking' state is the already-defeated exit anim (DAMA3→0x14 ends the level). base ~3x life via per-tick energy + end-of-Phase-2 screen (b5e3e95); Phase-2 bug fixes (b71cfc1); damage border flash (c8db2df); hit-confirm SFX + global IY/IM2 fix (f1eece3, see [[reference_iy_im2_rom_im1]]). **In-game PT3 theme DONE 2026-06-04** — original 'Barbarian War-March' (6/8 gallop; AY-noise war-drums = noise+tone timpani bass + pure-noise snare; octave-doubled horn on SHORT notes only — the octave ornament warbles on held notes; fully diatonic D natural minor, i-bVI-bVII-i vamp + modal-v cadences) via `tools/pt3-compose-barbarian.py` → `src/music/barbarian.pt3` in bank 7 (replaced the mountain-king placeholder; dragon keeps its own copy). An original sword-and-sorcery homage, NOT a transcription — user wanted a 'Conan' feel; delivered via non-copyrightable style/meter/instrumentation, not the Poledouris melody (clean licence; see [[project_pt3_license]]). **2026-06-04 (later): in-game track now an ORIGINAL Follin-STYLE heroic theme** (`tools/pt3-compose-heroic-theme.py` → `src/music/heroic-theme.pt3`; renamed from the misleading `black-lamp.pt3` on 2026-06-05 — it is NOT the real Black Lamp tune, just a style homage). A minor; the Follin polyphony trick = PT3 ORNAMENT cycling triad offsets [0,3,7]/[0,4,7] at 50 Hz on a held chord-root (ch B) under a heroic lead (ch A) + root-fifth bass (ch C). v2 expanded per user ("work it more / longer"): 9 patterns (~36 bars then 32-bar loop skipping the intro) — INTRO, A1/A2 theme, B1/B2 lift, C1/C2 fast-run development (eighth bass), D1/D2 lyrical bridge; loop pos = 1 (header byte 0x66). LICENCE: the composition is **original (ours)**; Follin's STYLE is a non-copyrightable homage → no third-party permission problem (unlike a transcription). `main.asm` bank 7 INCBINs BOTH `heroic-theme.pt3` (`song_phase1_data`) and `mars.pt3` (`song_phase2_data`); `barbarian.pt3` stays commented for one-line revert (per-level music wiring below). Holst 'Mars, the Bringer of War' (`pt3-compose-mars.py`/`mars.pt3`, 5/4 war ostinato + tritone clash) is **public-domain (shippeable)** and is now Phase 2's track; original 'Barbarian War-March' (`barbarian.pt3`) remains a ready alternative. Scene-PT3 path explored & parked: real Black Lamp exists only as `.ay` (no PT3 to drop in like the film); native-PT3 candidates from zxart were shortlisted but the user chose to develop the home-made arrangement. **Music now starts at GAMEPLAY, not boot** (user req): `music_init` leaves `music_paused=1` so the AY is silent through the control-select menu; phase1 `INIT_LEVEL` redirects its final HUD-paint `CALL 0xD61B` to the **zero-shift `hud_then_music` trampoline** (in master_im2's slack region) which falls through to `music_resume` → playback begins as the level paints. Zero byte-shift in the pinned <0xAAA1 region; dark1/dark2 stay byte-perfect. **PER-LEVEL music DONE + verified 2026-06-05** — Phase 1 = heroic-theme (original, Follin-style), Phase 2 = Mars (Holst, public-domain→shippeable). `music_play_track` = a label *inside* `music_init` (+0 bytes: the shared 'page bank 7 / INIT(HL) / restore caller's slot-3 bank' body, entered with HL=track); `transition_routine` calls it with HL=`song_phase2_data` right after its `di` (runs from bank 5/slot 1, IRQs off → safe to page bank 7 into slot 3). Phase 2 keeps `paused=0` inherited from Phase 1's resume (transition's bank-2 LDIR skips 0xAD00-0xAEFF). Extensible for Level 5: add a `song_level5_data` INCBIN + one `music_play_track` call at its entry. Byte budget was exhausted (`hit_sfx_core` pinned at 0xAE80, only 2 B slack), so audibility in the `debug-intermediate` build (which skips Phase 1's resume) is handled by a **build-conditional `music_paused` DEFB 0** (zero-cost) → it boots straight to the transition with the Phase 1 theme on the completion screen, then Mars. **dark2-v2 mismatch RESOLVED 2026-06-05** — root cause was the 3 GLOBMAN boss-tuning edits (2026-06-04) in `levels/phase2/enemies/globman.asm` (A668 `JR z,SININ`→`JR SININ`, A693 `ADD a,b`→`INC a`, A698 `SBC a,0x2F`→`SBC a,0x18`) which were left UNGUARDED, so dark2-v2 (compiles Phase 2 vs the original `dark2.sna`, no `UNIFIED_PLATFORMER`) saw exactly those 3 bytes. Fix: wrap each in `IFDEF UNIFIED_PLATFORMER` (ELSE = original opcode) — zero-shift in both paths. Game keeps the tuned boss (both `main.asm` AND `build.sh`'s phase2-converged.bin assemble with `-DUNIFIED_PLATFORMER=1`, verified: tuned bytes 18/3C/18 present in the shipped bin); dark2-v2 is byte-perfect again. All 6 tests pass.** **PUBLISHED as v1 2026-06-05, then DE-SCAFFOLDED 2026-06-08** — platformer moved out of `_in_progress/` to `remakes/128k-plus2-platformer/`, then trimmed to match dragon/film's clean layout: `tests/`, `tools/`, `IDEAS.md`, `UNIFIED-ENGINE.md` removed (they live only in v2 now). The Phase-2 image now builds from a single root **`phase2-build.asm`** (renamed from `tests/dark2-engine-v3.asm`; intermediate snapshot → `phase2-build.sna`). Rebuilt + verified both shipped `.sna` byte-identical. v1 = Dark 1 + Dark 2 + static ending; music = heroic-theme (original) + Mars (Holst PD). **v2 WIP created 2026-06-05** — `remakes/_in_progress/128k-plus2-platformer-v2/` is a pristine `git archive` copy of published v1 (depth-relative paths re-bumped +1 level: tests/*.asm 3→4, build-tests REPO_ROOT, README tools/original-48k 2→3 + dragon/film 1→2; `.gitignore` mirrored). v1 stays FROZEN; v2 = where E7/Kamuir lands. **⚠️ physical copy (user's call over a branch/tag) → engine fixes do NOT cross between v1 and v2; reconcile by hand.** git log is authoritative for the rest. Address map + free holes: [`MEMORY-MAP.md`](remakes/128k-plus2-platformer/MEMORY-MAP.md). **RESUME** → (1) E7 — Level 5 Kamuir / Book / ending (build it in the `_in_progress/` v2 copy). (Phase 3 & Phase 6 dropped by user 2026-06-03; Phase-2-end return-to-control-menu dropped 2026-06-04; platformer in-game PT3 theme done 2026-06-04 — the static end-of-Phase-2 screen stays as the ending.))
>
> **Maintenance:** keep this file under ~350 lines (loaded into every Claude session). Compaction policy in
> [`CLAUDE.md §"Workflow rules"`](CLAUDE.md). When trimming: preserve `RESUME HERE`, conventions, current state,
> engine reference, structure, phase plan, open questions. Old housekeeping sessions are the first to go —
> `git log` is authoritative for what changed and when.

## 📖 Source consultation rules

When the clean `.asm` is unclear, consult **in priority order**:

1. **`original-48k/src/dark{1,2,3}/ocr/<module>.asm`** — OCR of the paper listing. Has the **author's human names** (PANTAL, BUJA, MUERTE, BICHOS, MUP, MDOWN, COLAS, etc.), original Spanish comments, and `; [?]` markers indicating doubtful readings. Useful for understanding the INTENT of the code.
2. **`original-48k/disasm/dark{1,2,3}_raw.asm`** — byte-perfect disassembly. **Authoritative for the bytes.** Auto-generated labels (`LXXXXH`, `SUB_XXXXH`) — do NOT use these as names in clean source.
3. **`original-48k/scan/dark{1,2,3} scan/*.pdf`** — paper listing scan. Definitive visual reference.

The three sources complement the clean `.asm` in `original-48k/src/dark{1,2,3}/`.

---

## 🛠️ Project conventions

These apply to any contribution to this repo (any agent or human collaborator):

- **Byte-perfect verification.** Every change in `original-48k/src/dark{1,2,3}/` must pass the corresponding `build.sh` check (compile + byte-by-byte compare against the original `.sna`). If it breaks, do not mark the task as done.
- **Do not touch the `.sna` files in `original-48k/snapshots/`** — they are the surviving source of truth and the byte-perfect reference target.
- **`.asm` identifiers:** the author's human names from the paper listing (uppercase, ≤8 chars: `PANTAL`, `BICHOS`, `MUERTE`, `COLAS`, `MUP`, `MDOWN`, …). Do **not** introduce new `sub_xxxxh` / `LXXXXH` labels in clean source. Auto-generated labels live only in `original-48k/disasm/`.
- **Editable `DEFB` data** (not `INCBIN`) whenever the bytes are reasonably interpretable as data tables.
- **`.asm` comments:** respect the originals from the paper scan; add `; [?]` on any line where the OCR reading is doubtful.
- **Documentation language:** project documentation (READMEs, `CONTEXT.md`, `docs/*.md`, code comments, commit messages) is written in **English**. In-game text quotes stay in Spanish — they reflect what the ROM actually displays.
- **Memory map up to date — every phase, every layout change.** After ANY structural change (new code, new INCBIN, moved ORG, added/removed buffers, new bank stash) refresh the build's address-ordered MEMORY-MAP.md before considering the change done. Stale memory maps cause silent overlap bugs (last seen 2026-05-07: `show_pantalla` placed at `0x7972` based on a pre-B+ "free tail" annotation that was no longer free → black screen / reset). Tooling: `tools/film-memory-map.py --update` for the film build (regenerates the auto-section from `film.sym`). When introducing ZX0 / new code in `platformer/` or `dragon/`, add an equivalent `tools/<build>-memory-map.py` and a `MEMORY-MAP.md` for that build.
- **Working style with Claude (set 2026-05-09): autonomous debugging with agent teams during long tasks.** When a task is large (closing the film, deep debugging, multi-thread research), Claude spawns `Agent` calls in parallel and works autonomously without intermediate progress reports. Claude only stops and asks the user when (a) it needs an aesthetic/design decision it cannot infer, (b) it needs assets/files not present in the repo, (c) the next action is irreversible or seriously ambiguous, or (d) it's truly technically blocked. Otherwise it iterates to completion and reports the verified result.

### Key commands

```bash
# Byte-perfect builds (each prints "[OK] N/N B byte-perfect" on success)
original-48k/src/dark1/build.sh [normal|cheat|all]
original-48k/src/dark2/build.sh [normal|cheat|all]
original-48k/src/dark3/build.sh [normal|cheat|all]
original-48k/src/film/build.sh

# Emulator (auto-detects 48K vs +2 by path; --debug uses ZEsarUX)
tools/run-emulator.sh [--debug] <snapshot-or-tap-path>

# Validation helpers
tools/validation/compare.py <bin> <sna>           # byte-by-byte diff
tools/validation/range_to_defb.py                 # convert a range to DEFB
tools/validation/translate_dark1_to_dark2.py      # variable mapping
```

---

## ⚡ Current state (2026-05-08)

All four original pieces compile **byte-perfect** against the surviving snapshots, from editable `.asm` (no INCBIN of large code blocks):

| Piece | Source | Output | Snapshot |
|---|---|---:|---|
| Dark 1 (Phase 1) | `original-48k/src/dark1/` | 31739 B ✓ | `dark1.sna` |
| Dark 2 (Phase 2) | `original-48k/src/dark2/` | 31739 B ✓ | `dark2.sna` |
| Dark 3 (Dragon Phase) | `original-48k/src/dark3/` | 25536 B ✓ | `dark3.sna` |
| Film (intro) | `original-48k/src/film/`  | 41527 B ✓ | `game-sagadark.tap` |

Each `src/<phase>/build.sh [normal|cheat|all]` produces the raw `.bin` + an executable `.sna` and verifies byte-exact match. Verified visually in FuseX/ZEsarUX. Dark 1 and Dark 2 support the `cheat` flag (`INFINITE_ENERGY` = 4-byte patch on `MUERTE`: `RET; NOP×3`).

The Film build needed one fix: `DEFS 65021-$,0` before `ORG 65021` (IM2 vector) — sjasmplus did not fill the 71-byte gap with `--raw`, leaving the IM2 routine 71 bytes off.

Documentation, license, and the `remakes/_in_progress/` layout are finalised — see "Recent housekeeping" below.

### ✅ Phase 4.1B — DONE (verified visually 2026-05-02)

### ✅ Film 128K visual bugs — fixed by B+ pass (2026-05-07)

PPANT5..9 + IMGSOL rendered corrupt (image + colours) in the ZX0 v-final
build because of the backwards-in-place layout (blob + destination buffer
sharing memory with delta padding). The B+ pass replaced the layout with
a single shared SCREEN_BUF + forward-only on-demand decompression — root
cause disappeared structurally without ever being diagnosed in detail.

### 🛑 AY music PoC — abandoned (2026-05-03)

A custom `.stm` mini-tracker + Z80 replayer was prototyped (commits `52366fd`
"music1" → `21a5069` "music" → `30edc61` "music"). All three commits ship the
film with structural music bugs:

1. **GO SUB crash** at the BOMBA→MUERTO transition (mid-film). Caused by
   re-initialising the player mid-frame from inside `music_play_core` when
   DTPANT changes scene.
2. **Music dies during BOMBA → PABUELO2** (~30 s mid-film silence). Caused by
   the film's `IM 1` instructions after each per-scene animation handler —
   they kill IM 2 entirely, and the music replayer is IM2-driven.
3. **Music plays at ~1/4 speed during the jaca scroll**. SCROL handler takes
   ~4 frames per call, so music ticks once per ~80 ms instead of 20 ms.

Multiple parch-style fixes attempted (re-init defer, `IM 1`→`IM 2` runtime patch,
mid-handler `music_tick_only` calls, single-theme simplification) all introduced
regressions (cartelas corrupted by byte shifts, "out of memory 0 0" boot crash,
black-screen at boot). Root cause is architectural: the film mixes IM 1/IM 2 as
animation on/off switches, which is incompatible with always-on music IM2.

**Status:** all music work stash'd in `stash@{0}` ("On main: all-current-changes").
Working tree reset to `7db9b60` (pre-music compressed state). The `.sna` is
byte-identical to the committed one. Three "music" commits stay in history but
should be considered failed PoCs; do **not** branch from them.

**Plan for a future dedicated music session (~half-day, fresh start):**

1. **Land the SCREEN_BUF B+ pass first** (see RESUME HERE). It fixes the
   PPANT5..9 + sunset bugs structurally and frees ~25 KB in banks 5/2/0 — the
   real landing zone for the music payload.
2. **Migrate the film's IM2 architecture to "Patrón A" — single unified handler
   with sub-routine dispatch via flag.**
   - One `music_only_handler` permanently installed at `(65022)`.
   - The handler always ticks music, then optionally calls `current_anim` if
     a flag (`anim_active`) is set.
   - Each per-scene animation (FUEGO/IM23/SCROL/GOTAS) is a synchronous
     sub-routine, not its own IM2 handler.
   - The film's `IM 1` instructions become `XOR A; LD (anim_active),A` (4 B
     vs 2 — accept the +6 B film-wide shift, validate cartelas survive it
     before committing).
3. **Consider VGZ over the homemade `.stm`**: agent investigation 2026-05-03
   confirmed `magicland1.vgz` is viable as a single-theme cinematic backing
   track (134 s AY-only, ~2 KB after gzip-equivalent compression on the
   register dump). Tooling `tools/music/vgm_to_regdump.py` is in `stash@{0}`.
   Blocker: ZX0 native macOS encoder. Workaround: write a minimal LZ77
   encoder in Python or rebuild ZX0 from source.
4. **Validate incrementally**: each handler conversion as a separate test.
   Don't compose changes that haven't been validated individually.

### 🔜 Techniques pass on existing builds (parallel track, before Phase 5)

**Decision (2026-05-02, revised 2026-05-20):** the `_in_progress/128k-plus2-extended/` folder was retired; the platformer becomes the single destination for the full game (4 classic levels unified + Level 5 / Kamuir / Book / ending). Apply a curated set of classic + modern (2018-2026) ZX Spectrum techniques to the existing builds (platformer / dragon / film) to raise the technical floor along the way. Source catalogue + phased plan A→E now live at [`remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md`](remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md). Discarded for now: NIRVANA+ in platformer gameplay (80% CPU), software parallax (would force map-format redesign), triple buffering banks 5/7 (no visible win), stack-pointer rendering (premature micro-opt), TR-DOS streaming (only if .trd becomes a target).

**Agreed priority order (high-ROI → polish):**

1. **ZX0 compression on per-bank assets (all 3 builds)** — enabler. Frees room in banks 5/2/0/1/3/4 for the music + multicolour tables that come next. Replayer 68 B in Z80 (forward) + 69 B (backwards). No engine change.
   - 1a ⚠️ **Film v-final partial (2026-05-02)** — every static screen (PPANT1..9), fonts, IMGJACA, cartelas ES+EN, T1..5 credits compressed. Two ZX0 patterns: forward (bank 6 → fixed buffer) and in-place backwards (bank 0). Toolchain `tools/zx0/`. Caveat discovered 2026-05-07 (auditing `pelicula.asm`+`final.asm`): **the descompresión is pre-load a buffers RESIDENTES**, not on-demand — the 9 PPANT + IMGSOL + IMGJACA buffers (~30 KB) stay live in banks 5/2/0 the whole film. The "18 KB freed" only applies to bank 6 (paged, free post-boot anyway). Active-RAM peak = same as without ZX0. **Step 1a-bis below is the real fix.** Image-wide accounting (banks 3/4/7 empty + tails) = ~68 KB hard-free, see [`MEMORY-MAP.md`](remakes/128k-plus2-film/MEMORY-MAP.md) free-space table. Per-blob table in [`ZX0-REPORT.md`](remakes/128k-plus2-film/ZX0-REPORT.md). `src/pantallas.asm` kept as uncompressed reference; `src/pantallas-zx0.asm` is the live one.
   - 1a-bis ✅ **Film SCREEN_BUF B+ pass DONE (2026-05-07).** Single shared 4609 B buffer + on-demand `show_pantalla(A=id)` in bank 2 tail (0xBE00). Blobs split bank 6 (PPANT1..3, 6..8 + IMGSOL + IMGJACA + boot fonts/cartelas) and bank 7 (PPANT4, 5, 9). User-confirmed visually OK on +2 — PPANT5..9 + sunset bug dissolved by removing in-place backwards entirely. ZX0 native macOS encoder built from source (tools/zx0/src/, gitignored binary). Memory map auto-tooling: `tools/film-memory-map.py --update` regenerates the address-ordered summary in `MEMORY-MAP.md`. Artifacts retired: `dzx0_standard_back` from film build (kept in `tools/zx0/` as a tool); `_back.zx0b` blobs.
   - 1b ⏳ Same pass on platformer (Dark 1+2 unified) and dragon (Dark 3) builds. **Apply lesson from 1a:** verify each compressed asset is on-demand-decompressible (or that its buffer can be retired post-load), don't just compress and pre-load to permanent buffers — that doesn't lower the active-RAM peak.
2. **AY music via Vortex `.pt3` + IM2-hooked replayer in bank 7 (all 3 builds)** — biggest perceptual jump. Reuses the IM2 pattern already proven in Film (`ORG 65021`). Targets: title jingle / per-phase loops / death sting / transition / victory fanfare / dragon fight tune / film backing track.
3. **Polyphonic beeper SFX (Phaser1 / Octode 2k15) for in-game** — preserves 48K soul. AY stays reserved for intro / death / boss / victory per IDEAS §10 doctrine.
4. **Pre-shifted player sprite in platformer (8 copies)** — kills the hottest CPU path (`SDERE`/`SIZQUI`), buys headroom for (2)+(3) without tearing.
5. **NIRVANA+ in dragon (static camera, viable).** Multicolour where it doesn't pay scroll cost. **Film cartelas: discarded 2026-05-10** after a conceptual mockup pass on PANT7 (Kamuir): the original art is already cromatically resolved within the 8×8 attribute language and the visible color clash is stylistically intentional. Bifröst*2 would only refine cell borders (marginal/regressive when applied as zone-recolour); NIRVANA+ would require pausing PT3 (incompatible IM2) and the music loss does not compensate the chromatic gain. Cartelas in B&W (PANT1/PANT10) would also lose their deliberate narrative contrast vs the rest. Lesson preserved in user-memory: never propose multicolour as a "visual upgrade" on already-resolved 8×8 art without a pixel-perfect mockup from the raw bitmap.
6. **Bifröst*2 selectively in platformer HUD + per-phase HUD theme** — `levels/phaseN/faces-data.asm` already supports per-phase faces; Dark 2 currently reuses Dark 1 palette.
7. **Phase 1 → Phase 2 cinematic transition (1 s, Kamuir silhouette + lightning SFX) + pause key + in-game options menu** — narrative + UX.
8. **Distribution: `.tap` / `.trd` / `.dsk` / `.nex` builds + JSSpeccy embed (`index.html`)** — no engine change, broadens reach. ⚙️ Web menu DONE 2026-06-16: root `index.html` lists all 10 snapshots in two era panels (Originales 48K 1989-1990 / Remakes +2 128K 1989-2026), each split into 3 phase columns (Pelicula / Platformer+Dark1+2 / Dragon); inmortal variants as visually subordinate dashed buttons. JSSpeccy auto-switches 48K↔128K. Served via GitHub Pages (`.github/workflows/pages.yml`). Virtual on-screen gamepad on touch devices: number row 0-4 + ENTER + D-pad + fire button; per-game keymaps applied dynamically; events sent directly as `{message:keyDown, row, mask}` to the JSSpeccy Web Worker (bypasses synthetic KeyboardEvent entirely). Zoom 100%, sandbox mode.

### ✅ Film closed (verified visually 2026-05-09)

- **(F1) Two-track soundtrack.** Track A = *The Entertainer* (Scott Joplin 1902, **public domain** — Joplin †1917; our own sequencing of the [Mutopia piece 263](https://www.mutopiaproject.org/cgibin/piece-info.cgi?id=263) PD typeset, arranged with spectrumizer `--style chiptune`, then re-voiced 2026-06-13 for dynamics + ~94 BPM tempo (`tools/pt3-remaster-entertainer.py`); 5188 B → `src/music/entertainer.pt3`) — language choice through jaca-scroll; the menu is silent (`music_paused` boots 1, `wipe_menu` does the first `music_resume`). Track B = *Bushido (Vispera)* (our own original composition, 2026, 2044 B; samurai-era eve-of-battle cue, miyako-bushi scale on D, shakuhachi/koto/taiko voices; loops the whole module at loop pos 0; generated by `tools/pt3-compose-bushido.py` → `src/music/bushido.pt3`) — MJAC through end credits. Switching: `jaca.asm:12` calls `music_switch_b` (DI/EI bracketed INIT+clear-pause). Both modules + player + VARS in bank 3 (~6.8 KB margin; music at full volume — see (F2)). See [`SOUNDTRACK.md`](remakes/128k-plus2-film/SOUNDTRACK.md) for credits. **Licensing:** Track A is PD (composition + typeset + our own arrangement), Track B is our own original work. **Track B (2026-06-13):** native originals composed on spectrumizer's pt3 library (`pt3-compose-toccata.py` Bach BWV 565 PD, `pt3-compose-bushido.py`); the user picked **Bushido**, keeping the samurai suite's first movement expanded to a full piece (v2: 8 patterns; later v5 2026-06-13: 18 patterns / ~92 s, adding a lyrical *recuerdo* theme + a deeper first half, after the user asked to lengthen it). Lesson kept: MIDI→spectrumizer conversions of orchestral music fail on 3 AY channels ("suena fatal") — compose natively.
- **(F2) Music at full volume (2026-06-13).** The `pt3_play.asm:ROUT_A0` volume right-shift (single `SRL A`, /2 — a leftover from the platformer, where the player fires with SFX) is now **disabled**: the film's only SFX is the text-typing beeper (`libreria.asm` → ROM BEEPER `CALL 949`), a separate channel that needs no music ducking, and the /2 truncation was crushing the new per-note dynamics (vol 15/14→7, 13/12→6…) — the user noticed "se pierden los detalles". The `ROUTVH` loop now passes the volume nibble through unchanged; re-enable by uncommenting the `SRL A`. Removing the 2-byte opcode shifted the bank-3 layout −2 (track_a 0xC882→0xC880).
- **(F3) PIJAMA credits glitch fixed.** `master_im2` was only saving the main register set; PT3 PLAY uses `EX AF,AF'` heavily and ROM `RST 16` (PRINT) — used by `IMPRE4` during PIJAMA — also uses AF' as the char-being-printed scratch. IM2 firing inside ROM-PRINT clobbered AF' → attribute corruption on long credit lines (T3 "SUPER AJO DALTONIUS" reaches col 31). Fix: wrap `music_tick` with `ex af,af'/push af` + `exx/push bc-de-hl/exx` and symmetric restore.
- AY music root-cause fixes from initial integration (commit `ccdc880`): master_im2 dispatch preserves AF+HL via self-modified `jp NN`; DI/EI bracket the LANG_OVERLAY bank-1 swap; `jaca.asm` SCROL installer writes to `current_anim`. `test-music.asm` (the smoke-test target) points at the shipping Track B.

**Next — film closed; pick the next thread:**
- **(B) Item 1b — propagate ZX0 + B+ infra to platformer + dragon.** Toolchain is ready (native ZX0 encoder, `tools/zx0/`). Apply the lesson from 1a/1a-bis: identify which assets can be retired post-load or aliased to a shared buffer BEFORE compressing — don't repeat the pre-load-to-permanent-buffers mistake. Each build needs its own `MEMORY-MAP.md` + `tools/<build>-memory-map.py`.
  - **B-dragon zeros-pass ✅ 2026-05-12.** `src/preload.bin` (23 616 B) split into `src/screen.bin` (`0x4000-0x5AFF`) + `src/sysvars-data.asm` (`0x5C00-0x813F`, 6 DEFB islands + DEFS fill) + `src/offscreen-title.bin` (`0x8140-0x9C3F`). Byte-perfect against the pre-split build. Helper `tools/dragon-split-preload.py` regenerates the three pieces from any `dark3.sna` reference. Structural editability gain; no RAM impact.
  - **B-dragon B+ on-demand ❌ 2026-05-12 NOT VIABLE.** Attempted ZX0 + on-demand decompression of `offscreen-title.bin`; visual test in ZEsarUX revealed that the gameplay engine reuses 0x8140-0x9C3F as a sprite/tile source for sky/ground/dragon-body — only protagonist + dragon's head come from `dragon.asm`. Reclaiming the region corrupts the gameplay. Lesson saved to user-memory (`feedback_dragon_offscreen_sprite_source.md`); references in dragon.asm are computed (IX+disp, table lookups), so static grep missed them. Compress-and-preload-at-same-address yields zero active-RAM gain (1a-bis lesson) — not pursued. Build is back byte-identical against the post-zeros-pass baseline.
  - **B-platformer Phase 2 stash — SUPERSEDED 2026-05-20** by the broader (E) unified-engine refactor below: once the engine is unified, the 48 KB LDIR stash disappears entirely (Phase 2 enemies and data live alongside Phase 1 from boot, not as a swappable image), so there is nothing left to compress at that level. ZX0 may still apply to individual large assets (per-level maps, sprite sheets) once the new layout is in place.
- **Dragon AY music — DONE 2026-05-20.** Full F1-F4 thread closed.
  - **F1 ✅ 2026-05-13.** IM 2 + `master_im2` + PT3 helpers scaffold in bank 5 zero gap. I=0x78, table @ 0x7800-0x7900 (257 B × 0x77), JP trampoline @ 0x7777, handler @ 0x7901+.
  - **F2 ✅ 2026-05-17.** `mountain-king.pt3` (596 B) generated by `tools/pt3-compose-mountain-king.py` (A minor, 6 patterns of chromatic-modulating motif statements, Grieg PD by age). PT3 player (Bulba) + module bundled in bank 3 (ORG 0xC000) wrapped in `MODULE pt3` to avoid symbol collisions.
  - **F3 ✅ 2026-05-17.** Wiring: `boot_start` calls `music_init`; `dragon.asm` ENDED death path now `JP z,death_handler` (chromatic AY sad-trombone state machine before restart); WIN path now `JP victory_handler` (replaces meaningless cassette-load original).
  - **F4 ✅ 2026-05-13 (already in F1).** Dynamic tempo in `music_tick.alive_path` reads `D_DRAC` (0xA0F0) and writes `pt3.Delay` (0xC545) per frame: <10 → delay=1 (panic), 10-19 → 2 (frenetic), 20-29 → 3 (tense), ≥30 → 5 (calm). Tempo scales with dragon proximity.
  - **Victory screen polish ✅ 2026-05-20.** `victory_handler` paints the title image, clears bottom third to PAPER 0/INK 7, typewriter-prints "FELICIDADES! / HAS ESCAPADO DEL DRAGON" at rows 18/20, INITs `victory.pt3` (458 B, A major, ~117 BPM, fanfare + Grieg-motif-in-major + cadence — generated by `tools/pt3-compose-victory.py`), waits for key 0x1D, then switches back to Mountain King and returns to title. New `victory_mode` flag makes `music_tick` skip the dynamic-tempo path so the victory module plays at its native speed regardless of D_DRAC at win-time.
- **(C) Items (5)–(8) polish** (NIRVANA+ cartelas / Bifröst*2 HUD / Phase 1→2 cinematic / distribution targets) — non-blocking, reorderable.
- **(E) 🔥 Unified engine refactor on `platformer/` — primary active thread, 2026-05-20+.** Goal: turn the platformer from "two phases swapped via LDIR" into a single continuous game (Dark 1 + Dark 2 levels flow into each other) and the host of the missing end-game content (Level 5 Kamuir / Book / ending). The `_in_progress/128k-plus2-extended/` folder was retired into the platformer on this date; technique catalogue moved to `remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md`.
  - **E1/E2a/E2b ✅ (2026-05-20→21).** Phase 2 source diverged into `levels/phase2/` (9 enemies + monolithic `main.asm`/`faces-and-enemy.asm` + `data/`); `engine/game-loop.asm` DEFB blocks disassembled + per-phase literals EQU-ified. 4 byte-perfect tests (dark1, dark2, dark1-v2, dark2-v2). Detail in `git log`.
  - **E2c → UNIFIED ENGINE (reframed 2026-05-22).** Analysis: the `engine/` game-loop/bichos/sound hold the *shipped* Dark 1 logic, which diverges from Dark 2 in operations (not just addresses; labels misalign — Dark 1 `MORTE`==Dark 2 `MAIN`). **But** the author's **paper listings (OCR) for both phases share ONE clean MAIN loop** (`AAAAAA→PODER→PODERS→ABUELO→MOVI→SALIR→BICHOS→checks→BBBBBB/CCCCCC/DDDDDD`), and shipped `dark2.sna` matches it — only shipped `dark1.sna` drifted. **User decision:** one engine for all levels; the unified build is intentionally **not byte-perfect** (net = v1 original-source tests + emulator). Canonical loop = Dark 2's; per-level differences (death constants / dispatch table / init hook / enemy+screen+faces+music) move into a per-level **descriptor** — this folds in the old E3 (table-driven BICHOS) + E4 (descriptor) + E5 (drop the 48 KB LDIR). Full design + loop-alignment table + rollout: [`UNIFIED-ENGINE.md`](remakes/_in_progress/128k-plus2-platformer-v2/UNIFIED-ENGINE.md).
    - **✅ Table-driven BICHOS (E3 core) DONE 2026-05-22.** `engine/bichos.asm` rewritten as a jump table, kept exactly 87 B (DEFS pad) so nothing below it moves — VAR0/PAN_PAD hold absolute sprite pointers into 0xD6xx+. Verified surgical: `dark1-v2` assembles to 31739 B and only `0xA85D-0xA8A4` differ vs `dark1.sna` (handlers/sound/data-tail/faces byte-identical). Shared-var layout fixed to **Dark 1 addresses** (user-confirmed). Phase 1 dispatch table embedded in `bichos.asm` for now → externalised to the per-level descriptor at E4. `dark1-v2` test is now a smoke test (assemble+size); `dark1`/`dark2`/`dark2-v2` stay byte-perfect. **Emulator-validated 2026-05-22** (full Phase 1 playthrough + NINJA boss on the cheat build; Phase 1→2 LDIR transition still fine).
    - **Unified game-loop —** the loop *body* is already shared motor (symbol map proves PODER/PODERS/ABUELO/ANTIC2/BBBBBB/ESPEJ/DDDDDD identical in both phases); the per-level bits are init, the death/transition checks, and the `MORTE`/`NUEVO` reset var-sets (different enemies). Factoring those into hooks adds ~24 B of CALL/RET → the loop no longer fits its 310 B → shifts everything below, and Phase 1's layout is pinned by ~15 absolute screen pointers (VAR0/PAN_PAD) + others with **no labels at the targets** — full relocatability = big/risky (dragon-lesson territory: computed refs). **Resolved approach:** do NOT refactor Phase 1's loop (it works, validated). Make `engine/game-loop.asm` a single **conditionally-parametrized** source: Phase 1 = inline mode (current bytes, no shift), Phase 2+ = hook mode (built fresh, clean layout, symbolic pointers).
      - **✅ Loop parametrized 2026-05-22.** `engine/game-loop.asm` now has `IFNDEF UNIFIED_HOOKS` + a canonical hook-mode loop (`STAR→INIT_LEVEL`, shared `PREAMBLE`, shared `MAIN` body, `FRAME_CHECK`→action dispatch, `MORTE_RESET`/`NUEVO_RESET` hooks) in the `IF` branch; the legacy Phase 1 loop is the `ELSE` branch. Phase 1 (`UNIFIED_HOOKS=0`) verified **byte-identical** to the validated build.
      - **✅ 2a — phase2 split DONE 2026-05-22.** `phase2/main.asm` (1217-line monolith) split into `data`/`game-loop`/`e123`/`bichos`/`handlers`/`sound`/`data-tail` (+ existing `faces-and-enemy`), byte-perfect reorg at clean label boundaries; `main.asm` removed (content in the 7 modules + git). `dark2-v2` stays byte-perfect; all 4 tests pass.
      - **⚠️ 2b finding 2026-05-22 — convergence is entangled with paging (E5).** Phase 2's enemy code ends at 0xA6A0 (0x95 = 149 B bigger than Phase 1's, which end at 0xA60B), so the Dark 1 scalar addresses (VAR0 0xA633, T0 0xA652) are **physically occupied by Phase 2's enemies**. Converging Phase 2's vars to Dark 1 first requires relocating its enemies (paging into another bank) — i.e. the coexistence/descriptor design, not a standalone data restructure. **Re-sequence — pick before continuing:** (A) design E4/E5 (per-level descriptor + which bank holds each level's enemies/data) first, then converge; or (B) first prove the hook-mode loop runs Phase 2 **standalone with Phase 2's own addresses** — proves the shared loop hosts Phase 2 without paging — then do convergence+paging together. Recommend (B).
      - **✅ (B) BUILT 2026-05-22 — assembles + runnable snapshot; awaiting emulator.** New `levels/phase2/hooks.asm` (INIT_LEVEL=`TART`+`STAR`body / FRAME_CHECK=post-BICHOS checks encoded A=0 cont·1 death·2 level-end / MORTE_RESET / NUEVO_RESET + MUERTE·NU1·NU2·MUER·MUERTE_K·TRUCO, logic from `phase2/game-loop.asm`) + `levels/phase2/bichos-table.asm` (table-driven: SONI1 trigger + PA00..PA13 table, PA14 default for screen≥14). Wrapper `tests/dark2-engine-v3.asm` = motor[Phase 2 EQUs] + enemies + data + `engine/game-loop.asm` built `-DUNIFIED_HOOKS=1` + hooks + e123 + bichos-table + handlers + sound, with **data-tail ORG-pinned @0xAA7E and faces @0xD606** (the VAR0/T01 absolute pointers target those) and a 128K boot stub→`STAR` + `SAVESNA`. **Why pinning works:** grep proved *no* hardcoded numeric refs enter the loop region (0xA7AA-0xA94E) from other modules — all E1/E2/E3/VARMA/MUERTE/BICHOS/MUER refs are by symbol — so the loop region can be rebuilt at a new size as long as the data tables stay put. Code ends 0xAA6C (18 B slack before the pin); ASSERT guards it. **Naming swap handled:** Phase 1's death flag is `CASIRA`+callback `MUERTE_K`; Phase 2 swapped them (flag `MUER`, routine `CASIRA`) — `powers.asm` calls `MUERTE_K` by symbol, so hooks.asm exports Phase 2's CASIRA body under that name. `data-tail.asm`'s `JP TART` aliased to `STAR`. 5th smoke target in `build-tests.sh` (`dark2-engine-v3`, asserts 131103 B); snapshot at `tests/build/saga-dark2-engine-v3.sna` (gitignored). All 5 tests pass; dark1/dark2/dark2-v2 stay byte-perfect.
      - **✅ (B) emulator-validated 2026-05-22.** User confirmed Phase 2 plays correctly under the unified hook-mode loop (boot → init → enemies per screen → movement/fire → death/respawn) on the `dark2-engine-v3` +2 128K snapshot. **The shared canonical loop is proven to host Phase 2 standalone with Phase 2's own addresses — no paging needed for the loop itself.** Known gaps (don't block): STAR2 truco-restore tail not ported; CARGA (level-end) still does the original cassette load.
      - **🔜 RESUME HERE → convergence + coexistence (E4/E5).** Make Phase 1 + Phase 2 coexist on the unified engine. **Decisions (user, 2026-05-22):** (1) **converge state vars to a NEW common layout** (clean block in the common-free zone, both phases re-linked — not "adopt Dark 1/Dark 2 as-is"); (2) coexistence mechanism delegated to Claude → **target = hybrid** (motor + common state fixed in slots 1/2; per-level faces/sprites paged in slot 3 at common 0xC000+ addresses, no copy; enemies LDIR-swapped), reached **incrementally** (first common-state + single motor keeping the current LDIR, emulator-validate, *then* optimise to slot-3 paging). Constraint: only slot 3 is pageable; per-level data ≈ 36 KB > 16 KB so pure paging is impossible. Full memory-map analysis + the state-var inventory + rollout: [`UNIFIED-ENGINE.md`](remakes/_in_progress/128k-plus2-platformer-v2/UNIFIED-ENGINE.md) §"Convergence + coexistence (E4/E5)". **Progress 2026-05-22:** ✅ shared-state inventory (~18 vars; refs mostly by-symbol, ~31 hardcoded-hex literals total, all grep-able — medium-risk, NOT dragon-territory); ✅ design + decision: canonical block anchored at the high zone (== Dark 2 addresses, so dark2-v2 stays byte-perfect; Phase 1 moves up); ✅ `engine/state.inc` created (single source of truth: POD4_VAR/ABUELO_OFF/VAR10/VAR1/PEDD1/TP0 EQUs + the full canonical address map) and wired into the v3 wrapper byte-identically (5 tests pass). **Phase 1 split into 2 isolated risks (user 2026-05-22): loop first, vars later.**
      - **✅ Risk 1 DONE (emulator-validated 2026-05-22) — Phase 1 under the canonical loop.** `tests/dark1-engine-v3.asm` + `levels/phase1/hooks.asm` (extracted from the legacy ELSE-branch); vars still at Dark 1 addrs. **Space finding:** Phase 1's map is FULL (vs Phase 2's 18 B slack) — canonical loop + hooks overran the data-tail pin by 30 B; fixed with two `IF UNIFIED_HOOKS` conditionals that keep byte-perfect builds unchanged: drop `engine/bichos.asm`'s 87-B pad (−23 B) + stub the unused cassette `CARGA` tail in `engine/sound-fade-carga.asm` (−90 B). User confirmed Phase 1 plays under the canonical loop.
      - **✅ Risk 2 DONE (emulator-validated 2026-05-22) — Phase 1 vars converged.** Phase 1's external refs to block vars / E1/E2/E3 were all by symbol; convergence reduced to: (1) `phase1/data.asm`'s 15 internal pointers DEFB→`DEFW sym+offset` (byte-perfect → relocatable); (2) wrapper places the canonical loop in the enemy hole (`STAR=0xA60C`) + pads to 0xA6A1 + data block there (VAR0=0xA6C8, T0=0xA6E7, POD4_VAR=0xA6A2…); (3) EQU POD4_VAR/ABUELO_OFF canonical; (4) `+0x95` 25 hardcoded refs in enemies/handlers. **Reset-on-start bug → ROOT CAUSE:** `preload.bin` tail at 0x6A8B is PANTAL's entry CODE with two `LD HL,VAR0` baked at the Dark 1 addr (0xA633/0xA632); located by **border-colour tracing** (`-DTRACE_BORDER` macro in game-loop.asm). Patched in the wrapper. **LESSON: `preload.bin` AND `tail.bin` hold CODE with Dark-1 var refs — scan them on any convergence; the static grep of .asm misses them.**
      - **✅ Single motor — Level A wired (2026-05-25).** `main.asm` rewritten to the dark1-engine-v3 layout (canonical loop in hole + converged vars + PANTAL preload patch). Phase 2 stash built from `tests/dark2-engine-v3.asm` via `build/phase2-converged{,-cheat}.bin` (drops `dark2.sna` INCBIN). Boot patches `PICHO2`(=CARGA stub) → `JP transition_routine`; transition LDIRs banks 1→5 (skip 0x5B00-0x5BFF) + 3→2 + pages 4→slot3 + `JP 0xA7AA` (Phase 2 STAR). `build.sh` regenerates the .bin (sjasmplus + `dd skip=27 count=49152`) before assembling `main.asm`. Each phase keeps its own loop location (P1@0xA60C, P2@0xA7AA — single fixed addr overflows P1 by 64 B; that's Level B). Phase 1 plays + transitions to Phase 2 (emulator-confirmed). Level B (later): true single motor + slot-3 paging.
      - **✅ E6 — Inter-level screen + Phase 2 transition FIXED (2026-05-26 via ZRCP).** `intermediate_screen` + `print_str` in `main.asm` (0x5B00 boot area). Symptom (cheat build, full Phase 1 playthrough): black screen at level-end (no text), Phase 2 corrupto, eventual reset. **ROOT CAUSE**: `boot_start` set `SP=0x5BFF`. Phase 1 inherits that SP (engine never re-sets SP) and its CALL/PUSH chains push down through `print_str`'s code area (0x5BCE-0x5BFA). The first deep CALL dipped to ~0x5BE5, replacing `print_str`'s tail-loop opcodes (`7E 12 23 14 10 FA C1 0C D1 13 18 D3`) with return-address bytes. When level-end fired `JP CARGA → transition_routine → intermediate_screen → CALL print_str`, the corrupt opcodes ran → no chars drawn, then garbage execution skipped through wait loops into the LDIRs → Phase 2 ran with corrupt sprite state → eventual reset. Bug was INVISIBLE in DEBUG_INTERMEDIATE mode because boot jumps straight to transition_routine, never letting Phase 1 push down. **FIX**: `boot_start` now sets `SP=0xAF90` (top of the 691-byte zero region 0xACDF-0xAF91 in bank 2 data tail, slot 2 — fixed, no paging interference). Original Dark 1 standalone runs with SP=0xAFAC nearby (verified by reading its .sna header), confirming the area is stack-safe. transition_routine still sets SP=0x6000 explicitly when it fires. **Verified end-to-end via ZRCP**: cheat build, menu→1→0→idle 20s, patched DAMA1=0x14 to force level-end → pantalla intermedia rendered perfectly ("ENHORABUENA! / NIVEL 1 COMPLETADO / PULSA UNA TECLA"), wait_press exits, transition LDIRs complete, JP 0xA7AA, Phase 2 runs clean 20s+ no reset (screenshots at `/tmp/fix-inter-level.ppm.png` and `/tmp/fix-phase2-{entry,real-10s,real-20s,free-10s}.ppm.png`).
  - **E6 — Inter-level cutscene screen.** Narrative beat between levels — single static screen + key press.
  - **E7 — Level 5 / Kamuir's Fortress + final boss + Book pickup + victory cutscene.** The endgame content.

**Sequencing note:** items (1)–(4) ship on the existing builds as motivation dictates; the (E) thread is independent and on its own track. Items (5)–(8) of the original techniques pass (NIRVANA+ / Bifröst*2 / distribution) layer onto (E) once the unified engine stabilises.

### Phase 4 archive — `.sna` +2 128K ports

Phase 4 closed 2026-05-02. Film and dragon stay as standalone +2 128K loads. Platformer started as "Dark 1 + Dark 2 swapped via LDIR" — now being refactored (2026-05-20+) into a single continuous game that will also host Level 5 / Kamuir (the missing end-game content).

| Folder | Status |
|---|---|
| `remakes/128k-plus2-film/` (intro) | ✅ bilingual ES/EN, source diverged from `original-48k/src/film/` to local `src/` for feature subversions. See [`README.md`](remakes/128k-plus2-film/README.md) + [`MEMORY-MAP.md`](remakes/128k-plus2-film/MEMORY-MAP.md). |
| `remakes/128k-plus2-platformer/` (full platformer game) | ✅ **v1 RELEASED 2026-06-05** (moved out of `_in_progress/`). Dark 1 + Dark 2 unified into one continuous game (Phase 1 → inter-level screen → Phase 2 → static ending); player turn/flip, per-tick energy + damage flash, tuned bosses, per-level AY music (heroic-theme + Mars). Both normal + cheat `.sna` ship in `build/`. 🔜 v2 = Level 5 / Kamuir's Fortress / Book / ending — WIP copy at `remakes/_in_progress/128k-plus2-platformer-v2/` (the unified engine + free banks 6/7 host it). Catalogue: [`IDEAS.md`](remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md). |
| `remakes/128k-plus2-dragon/` (Dark 3) | ✅ done 2026-04-30 — `INCBIN` system + `INCLUDE dragon.asm`. Stack `PILA=0x813D`, `JP ENTRY=0x9C40`. Graduated to `remakes/` on 2026-05-20 after the AY music + victory polish thread closed. Renamed from `128k-plus2-original-dragon` on 2026-05-20. |

Notes still load-bearing for future work:
- **`dark1.bin` incomplete** — recovered 31 739 B is only the main code block. Full RAM image (incl. `0x5C00-0x6A9A` TABLA1/2 + `0xE700+` live code) is the real reference. Any port must use the `.sna`.
- **Phase 2 deaths re-trigger transition** — some death paths in Dark 2 set `DAMA3=0x14` and `JP CARGA`; cheat dies → re-runs LDIR swap → restarts Phase 2 (functional infinite loop). When Phase 5 ships, transition target will need a phase counter.

---

## 📁 Repository structure

```
saga-dark/
├── original-48k/                ← original ZX Spectrum 48K version (1989-1990)
│   ├── src/
│   │   ├── dark1/               ← Phase 1
│   │   ├── dark2/               ← Phase 2 (main + 9 enemies, shares Dark 1 engine)
│   │   ├── dark3/               ← Dragon Phase (special engine)
│   │   └── film/                ← intro/cutscene
│   ├── disasm/                  ← z80dasm disassemblies (authoritative for bytes)
│   ├── ocr/                     ← OCR text of paper listings (with human names)
│   ├── scan/                    ← PDF scans of paper listings
│   ├── snapshots/               ← original .sna + .z80 + audio
│   └── build/                   ← gitignored
├── remakes/
│   ├── 128k-plus2-film/                  ← Film (intro) ✅ — bilingual ES/EN, divergent fork
│   ├── 128k-plus2-dragon/                ← Dragon Phase (Dark 3) ✅ — Mountain King PT3 + victory screen
│   ├── 128k-plus2-platformer/            ← Full platformer ✅ v1 released (Dark 1 + 2 unified)
│   └── _in_progress/128k-plus2-platformer-v2/ ← v2 WIP — copy of v1, adds Level 5/Kamuir endgame
├── docs/                        ← engine-architecture, data-formats, emulator, etc.
├── resources/                   ← fonts, gameplay video frames + analysis
├── tools/
│   ├── validation/              ← OCR cleanup + byte-perfect verification scripts
│   ├── zx_dumper/               ← Python visualiser for .sna memory blocks
│   └── run-emulator.sh          ← Fuse/ZEsarUX wrapper (auto-detects machine)
├── CLAUDE.md                    ← model-specific instructions
├── CONTEXT.md                   ← this file (live project context)
├── README.md                    ← public summary
└── LICENSE                      ← CC BY-NC-SA 4.0
```

> **`spectrumizer`** (MIDI → AY/PT3 generator) was extracted to its own repo: <https://github.com/revengator/spectrumizer>.

---

## Game overview

ZX Spectrum 48K side-scrolling action/arcade game by **TRITON SOFTWARE / TRITON MULTIMEDIA**, copyright 1989-1990. Distributed on cassette as 4 separate loads (Film + Dark 1/2/3). No music in the original — only beeper sound effects (no AY chip).

The game was **left unfinished**: the intro presents Kamuir as the main antagonist who steals the protagonist's Book, but in-game gameplay ends on the bridge with no final confrontation.

### Existing levels (from a 17 m 25 s gameplay video, 209 frames at 1 / 5 s)

| Level | Setting | Enemies |
|---|---|---|
| Level 1: The Wasteland | Grey ground, yellow mountains, black sky | Dinosaurs, carnivorous plant |
| Level 2: Green Cave (catacombs) | Black cave, green ground, magenta columns | Giant insect (boss?), frog, rock-crab, skeletons |
| Level 3: The Dark Temple | Gothic interior, gold-yellow floor | Troll, armoured knight, demon, gargoyle |
| Level 3B: Skull Plains | Black sky, ground of skulls | Yeti, skeleton |
| Level 4: The Bridge | Night, magenta bridge, cyan river, moon | (no enemies — pure platforming) |

HUD: fixed status bar with face icons and corner skulls. Health bar visible only on Level 4. Single weapon (spear/blowgun) used the whole game.

### What is missing (the project's end goal)

1. **Level 5: Kamuir's Fortress** — volcanic/demonic interior with Kamuir's guardians.
2. **Final boss: Kamuir** — tall warrior with flame headdress, as in the intro.
3. **Picking up the Book** — central story object.
4. **Victory cutscene** — story resolution.

Completing these is the project's end goal. The +2 128K reconstruction lives across sibling folders under `remakes/` (see *Phase 4* table below); the new end-game content (Phase 5 Kamuir / Book / ending) lands inside the unified `128k-plus2-platformer/` rather than a separate folder.

---

## Engine reference (for the Phase 4 port)

Confirmed external symbol addresses against `dark1.sna`:

| Symbol | Address | Module | Notes |
|---|---|---|---|
| `MUERTE` | 0xA7F1 | main | character death routine |
| `MUP` | 0x6DAC | colas | move up |
| `MDOWN` | 0x6DD2 | colas | move down |
| `SIZQUI` | 0x7609 | colas | shift sprite left |
| `SDERE` | 0x75EE | colas | shift sprite right |
| `CHOQUE` | 0x7D67 | collisions | player vs enemy |
| `PALO` | 0x7D75 | collisions | weapon vs enemy |
| `E1` | 0xA84B | main | piranha state variable |
| `T0` | 0xA652 | main | T0+1 = 0xA653 |
| `VARB` | 0xA617 | main | power-up counter |
| `DAT2` | 0x7831 | collisions | used in PAL routines |

Engine module boundaries (verified against disasm):

| Module | Start | End | Human entry |
|---|---|---|---|
| mapper | 0x6A9B | 0x6DAB | `PANTAL` |
| colas | 0x6DAC | 0x6E3A | `MUP` |
| abuelo | 0x6E3B | 0x7262 | `SOUND2` |
| hres-printing | 0x7263 | 0x76C3 | `AAAAAA` |
| player | 0x76C4 | 0x7B9A | `COMPR` |
| powers | 0x7B9B | 0x7C30 | `PODER1` |
| collisions | 0x7C31 | 0x7E24 | `SALIR` |

`dark1` → `dark2` variable relocations (all "variable operands"):

`VAR0 0xA633→0xA6C8 · T0 0xA652→0xA6E7 · VAR7 0xA616→0xA6AB · E1 0xA84B→0xA8F7 · E2 0xA84C→0xA8F8 · E3 0xA84D→0xA8F9 · MUERTE 0xA7F1→0xA8AD · NUEVO 0xA820→0xA8D7 · BICHOS 0xA84E→0xA8FB`

Mapping helper: `tools/validation/translate_dark1_to_dark2.py`.

---

## Phase plan (high-level)

| Phase | Goal | State |
|---|---|---|
| 1 | Recover original sources from paper listings, byte-perfect | ✅ DONE |
| 2 | Documentation + toolchain ready | ✅ DONE |
| 3 | Super Film 128K (NIRVANA+ multicolour intro + AY music) | ❌ DROPPED (user 2026-06-03 — not doing it) |
| 4 | Port originals to 128K (3 separate loads: levels, dragon, film) | ✅ DONE (2026-05-02) |
| 5 | Level 5 Kamuir's Fortress + boss + Book pickup + ending | ⏳ pending |
| 6 | Polish, hardware testing, `.tap` + `.trd` distribution | ❌ DROPPED (user 2026-06-03 — not doing it) |

Detailed 5-phase plan A→E (techniques, milestones, references): [`remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md`](remakes/_in_progress/128k-plus2-platformer-v2/IDEAS.md).

---

## Open questions

- **Music scope:** AY in the game proper, or only in the Super Film? (Beeper for in-game = more authentic to the original.)
- **Multicolour scope:** apply NIRVANA+ to existing levels, or only to new content?
- **Boss layout:** does Kamuir's boss take a separate load, or fit inside the Level 5 bank?
- **Ending:** victory cutscene, or a static end screen like the original?

---

## External references

- World of Spectrum: https://worldofspectrum.org/archive/software/games/saga-dark-
- OpenRetro: https://openretro.org/game/33124f51-a72f-4bb8-b720-0d200c5ea9cc/files
- Gameplay walkthrough (1990 unreleased / recovered): https://www.youtube.com/watch?v=oWv56K0tYvg
- 2024 multiload-fixed version walkthrough: https://www.youtube.com/watch?v=BEbEV7aEiow

### Toolchain references for the 128K remake

- [sjasmplus](https://github.com/z00m128/sjasmplus) — modern Z80 assembler.
- **NIRVANA+** — 48K multicolour engine.
- **ZX0** — modern Spectrum compressor.
- [DeZog](https://github.com/maziac/DeZog) — Z80 source-level debug in VS Code.
- [CSpect](http://www.cspect.org/) — modern emulator with debugger.
- [z88dk](https://github.com/z88dk/z88dk) — C compiler for ZX Spectrum.
