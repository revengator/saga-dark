# Top ideas for Saga Dark 128K

Curated catalogue of modern (2020-2026) and classic techniques and tools applicable to the +2 128K remake of Saga Dark. Each block references the historical game/demo where the technique stands out and links to the resource or reusable engine.

> **Philosophy:** a Spectrum +2 128K game in 2026 can aim to look like a +2A/+3 without losing the soul of the 48K. The two metrics that matter are: *colours on screen* and *scroll smoothness*. The rest follows.

---

## 1. Graphics — colour without colour clash

### NIRVANA+ (Einar Saukas, 2017)
Multicolour with 2 attributes per character cell, changing every 2 lines (16 attributes per 8×8 cell). Allows large multi-coloured sprites with no visible "colour clash".

- **Open-source engine:** https://github.com/einar-saukas/Nirvana
- **Reference demo:** *NirvanaSlideShow* (Saukas, 2017).
- **Game using it:** *Sentinel* (2020), *Driller +* (amateur port), multiple modern demos.
- **Cost:** ~80% CPU when used over the whole area. For Saga Dark — use it in the **intro/Super Film** and in **boss screens** (Kamuir).

### Bifröst*2 (Einar Saukas, 2019)
"Lite" version of NIRVANA: 8×4 multicolour (change every 4 lines). Much lower CPU cost (~20%) — usable during normal gameplay.

- **Engine:** https://github.com/einar-saukas/Bifrost
- **Recommendation:** graphics engine for static screens + Level 5 HUD.

### Rainbow Processor (RZX, classic)
Changes the border and paper on every scanline through interrupts. Useful for fancy effects in menus.

- **Historic demo:** *Shock Megademo* (1991) — Excess.
- **Saga Dark application:** transitions between Super Film cutscenes.

### Compiled sprites (Lerm, ~1988)
Convert each sprite frame into pure Z80 code (`LD (HL),val ; INC L ; LD (HL),val …`) instead of loops + data. **3-5× faster**, at the cost of RAM.

- **Pioneering game:** *R-Type* (Activision/Bits Studios, 1988) — the best Spectrum scroller used it for large sprites.
- **Modern tool:** `boriel-spritec` or custom pipelines with sjasmplus + macros.
- **Saga Dark application:** Kamuir boss sprite (following the tradition of the Dark 3 dragon, 12 KB).

### Pre-shifted sprites
8 copies of the sprite, one per pixel offset, eliminating runtime shift calculation. RAM cost ×8 — the 128K allows this.

- **Game:** *Cobra* (Ocean, 1986), *Renegade* (Imagine, 1987).
- **Application:** main character and fast enemies (saltarón, llamarón).

---

## 2. Smooth scroll — the Spectrum's holy grail

### Bidirectional software pixel-scroll
Horizontal + vertical pixel-by-pixel scroll via 128K double buffering.

- **Historical reference:** *Stormlord* (Hewson, 1989) — multi-direction smooth.
- **Best 8-bit scroller:** *R-Type* (Bits Studios, 1988) — pixel-perfect at 25 fps.

### LDIR-unrolled scroll (the Dragon technique)
Manually unroll 32-50 consecutive LDIs. Saga Dark **already does this** in `dragon.asm` (as confirmed by the byte-perfect scan analysis). Keep it in the remake.

- **Pioneering game on Spectrum:** *Quazatron* (Hewson, 1986).

### Software parallax (2 layers)
Slow sky/mountains layer + fast game layer. Possible on 128K using banks.

- **Game:** *Mr. Heli* (Firebird, 1989), *Vector Patrol* (modern homebrew, 2017).

---

## 3. Sound — AY + beeper, the best of both worlds

### Vortex Tracker II — AY music (`.pt3` format)
Standard tracker of the modern scene. Open editor, optimised replayer code.

- **Tool:** http://bulba.untergrund.net/vortex_e.htm
- **Z80 replayer:** ~1KB, supports Spectrum Beta-128 and +2/+2A.
- **Modern games using it:** *Cliff Diver* (2024), *Lala* (2022), *Mister Kung-Fu* (2018).

### Phaser1 / Phaser3 — beeper engine (Tim Follin / Octode lineage)
Three synchronised beeper channels — without an AY chip. Supports polyphonic dual-tone.

- **Origin:** Tim Follin (1985-1990) — probably the best 8-bit composer in history. Listen to *Chronos* (1987) or *Agent X II* (1987) to grasp what a 1-bit speaker can do.
- **Open engines:** *Octode 2k15*, *Tritone*, *Savage* (all at https://shiru.untergrund.net/).
- **Saga Dark application:** keep the original engine (beeper) during gameplay to preserve the 48K soul. AY only for intro + boss fight + ending.

### Beepola
Beeper tracker with Win/Mac UI. Supports several engines (Special FX, Music Box, Phaser1).

- **Tool:** https://www.kasoft.talktalk.net/beepola.html

### "Hybrid mode" — AY + beeper simultaneously
Rarely used but possible: AY melody + polyphonic beeper bass. Takes advantage of both chips on the +2.

- **Demo:** *Glaurung* (Saukas / Andy Green) if you want to try it.

---

## 4. 128K architecture — making the most of the RAM

### Disciplined bank switching
The +2 128K has 8 16 KB banks at 0xC000. Typical scheme:

| Bank | Contents |
|---|---|
| 0 | Game loop + variables (always paged) |
| 1 | Shadow screen (screen 7 — for double buffer) |
| 2 | Common data (engine sprites, tables) |
| 3..6 | Per-level data (graphics, maps, enemy data) |
| 7 | Music + SFX engine |

- **Pioneering game:** *Where Time Stood Still* (Ocean, 1988) — the first really ambitious 128K-only.
- **Comparable:** *La Abadía del Crimen* (Opera Soft, 1987) — more data than 48K could hold.

### Triple buffering with banks 5 / 7
Screens at 0x4000 (bank 5) and 0xC000 (bank 7). Alternating render, swap via port 0x7FFD.

- **Historical demo:** *Chasing the Mirage* (4Mat / Hooy-Program, 2000).
- **Game:** *Sentinel 128* (homebrew, 2020).

### Level streaming from TR-DOS / +D
Load Level 5 (Kamuir) from disk on "Start" — useful if you also do a `.trd` version alongside `.tap`.

- **Game:** *Black Crypt* (Beta-128, 1991).

---

## 5. Modern compression — Z80 friendly

### ZX0 (Einar Saukas, 2021)
Modern LZ77 compressor with a super-fast Z80 replayer (~30% faster than ZX7, ratio comparable to aplib).

- **Tool:** https://github.com/einar-saukas/ZX0
- **Replayer:** 68 bytes in Z80.
- **Games:** *Lala* (2022), *Wonderful Dizzy* (Codemasters, 2020).
- **Saga Dark recommendation:** compress all bank assets with ZX0; decompress on bank load.

### MegaLZ
A '90s classic, still usable. Slower than ZX0 but sometimes a better ratio on repetitive data.

### thrust-packer v1.3 (HRUST)
What the original used. Keep compatibility if you want to reuse blocks without re-packing.

---

## 6. Reusable modern engines / tools

### Boriel BASIC + ZX BASIC Compiler
BASIC with advanced syntax → Z80 asm. Useful for *prototyping* high-level logic (cutscenes, menus) and later optimising.

- **Tool:** https://zxbasic.readthedocs.io/

### z88dk — C for Z80
C toolchain with Spectrum-specific library. Useful for auxiliary tools and possibly non-critical logic.

- **Tool:** https://z88dk.org/

### sjasmplus (already in use)
Modern macro-assembler with conditionals, loops, structs, INCBIN, modules. Already the project's assembler.

### CSpect Plug-ins (advanced debug)
CSpect is closed-source but with a plugin SDK for custom hardware emulation. Useful for testing Next features.

---

## 7. Advanced Z80 techniques

### Stack-pointer rendering (PUSH/POP)
Use `LD SP,addr ; POP HL ; POP DE` to read 4 bytes in 21 T-states (vs 28 with LD HL,(addr)). And `PUSH` for fast block writes.

- **Demo:** *Shock Megademo* — full-screen lookup.
- **Cost:** interrupts must be disabled (`DI`).

### Self-modifying code
Modify instruction operands at runtime. Saves registers and control memory.

- **Game:** practically all the greats (*Knight Lore*, *Head Over Heels*, *Lords of Midnight*).
- **Caveat:** don't use in ROM-shadow or in code that will be compressed/encrypted.

### Interrupt mode 2 (IM2)
Custom interrupt vector — allows music and game in parallel. Saga Dark **already uses** this in the Film (`game.asm` with `ORG 65021`).

### LDI/LDIR-friendly memory layout
Align graphic/tile blocks to multiples of 256 so the blitter only uses INC L (4 T-states) without touching H.

---

## 8. Spanish historical inspiration — cultural references

Saga Dark belongs to the **Golden Age of Spanish software** (1985-1992). Aim for the era's quality standard:

| Game | Studio / Year | What to take |
|---|---|---|
| *La Abadía del Crimen* | Opera Soft / Paco Menéndez, 1987 | NPC AI, event scripting, atmosphere |
| *Sir Fred* | Made in Spain, 1986 | Platforming + action, similar to Saga Dark gameplay |
| *Abu Simbel Profanation* | Dinamic / Iván & Nacho Ruiz, 1985 | Legendary difficulty, level design |
| *Game Over* | Dinamic / Snatcho, 1987 | Multi-load, animated intro (a reference for Saga Film) |
| *La Espada Sagrada* | Topo Soft, 1990 | Same era, side-scrolling with platforms |
| *El Capitán Trueno* | Dinamic, 1989 | End-of-level boss fights |
| *Mot* | Opera Soft, 1989 | NIRVANA-like multi-colour avant-la-lettre |

## 9. Modern inspiration — 2018-2026 scene

| Game | Year | Notable technique |
|---|---|---|
| *Mister Kung-Fu* | 2018 (Sanchez) | Large sprites + smooth scroll + AY |
| *Lala the Magical* | 2022 (RetroSouls) | Bifröst + ZX0 + polished cutscenes |
| *Cliff Diver* | 2024 (Spectrum Computing) | Polyphonic beeper + 128K intro |
| *Wonderful Dizzy* | 2020 (Codemasters revisited) | 128K bank-switched + AY + multi-colour |
| *Sword of Ianna* | 2017 (RetroWorks) | Platforming + boss + animated intro — **the closest one to Saga Dark** |

---

## 10. Recommended plan for Saga Dark 128K

5-phase prioritisation for the remake:

1. **Phase A — Perfect 48K compatibility on 128K**
   Port the original engine (dark1/2/3) without visible changes, structure banks. Result: the original game runs identically on +2.

2. **Phase B — Super Film with NIRVANA+ + Vortex AY**
   Rewrite the intro using NIRVANA+ and AY music (Vortex Tracker). Keep the original script.

3. **Phase C — Level 5 (Kamuir's Fortress)**
   - Sprites with compiled-sprites (Kamuir boss).
   - Bifröst*2 in static scenes.
   - Boss fight with multiple patterns (reference: *Abu Simbel*, *Sir Fred*).

4. **Phase D — Polish**
   - Polyphonic beeper Octode/Phaser during gameplay (preserve the 48K soul).
   - AY only for boss fight + ending.
   - Level streaming if a TR-DOS version is made.

5. **Phase E — Distribution**
   - `.tap` 128K (tape) + `.trd` (TR-DOS) + `.dsk` (+3).
   - Web playback with qaop / JSSpeccy.
   - Upload to World of Spectrum, Spectrum Computing, itch.io.

---

## References and active community

- **World of Spectrum** — https://worldofspectrum.org/
- **Spectrum Computing** (active forum) — https://spectrumcomputing.co.uk/
- **Einar Saukas (NIRVANA, ZX0, Bifröst)** — https://github.com/einar-saukas
- **Shiru's homepage (beeper/AY engines)** — https://shiru.untergrund.net/
- **MicroHobby (historical magazine)** — https://microhobby.org/
- **Pousse** — modern Spectrum demoscene.
- **YouTube — Hooy-Program / 4Mat** — visual demos showing what is possible.
