# Saga Dark Film — Soundtrack

> The +2 128K Film adds a two-track AY soundtrack to the cinematic (the
> original 1987 cassette intro had none). **Format:** Vortex Tracker II
> `.pt3`, played by Sergey Bulba's PT3 player (`pt3_play.asm`) hooked into
> IM2 via `master_im2`; the player + both modules live in bank 3 (`0xC000..`
> — see `MEMORY-MAP.md`). Music plays at full volume; the only SFX is the
> text-typing beeper, on a separate channel.

## Shipped tracks

> Both tracks are our own: Track A is a public-domain arrangement, Track B
> an original composition. The standalone `test-music.asm` smoke test plays
> Track B.

| Slot | Title | Author | Year | Source | Size | Licence status |
|---|---|---|---|---|---:|---|
| **Track A** (language choice → jaca-scroll) | *The Entertainer* | Scott Joplin | 1902 | [Mutopia piece 263](https://www.mutopiaproject.org/cgibin/piece-info.cgi?id=263) (Public Domain typeset), arranged with [spectrumizer](https://github.com/revengator/spectrumizer) `--style chiptune`, then re-voiced for dynamics + ~94 BPM tempo ([`tools/pt3-remaster-entertainer.py`](../../tools/pt3-remaster-entertainer.py)) | 5188 B | **Public domain** (Joplin †1917; pre-1929). Sequencing + re-voicing ours. |
| **Track B** (post-jaca → end credits) | *Bushido (Vispera)* | Saga Dark project | 2026 | Original composition — samurai-era eve-of-battle cue, miyako-bushi scale on D (shakuhachi / koto / taiko); composed natively for the AY by [`tools/pt3-compose-bushido.py`](../../tools/pt3-compose-bushido.py); v5 extended to 18 patterns / ~92 s (lyrical *recuerdo* theme + deeper first half) | 2044 B | **Original work.** Loops the whole module (loop pos 0). |

Music is silent during the language menu: `music_paused` boots as 1 and
`wipe_menu` (the moment a language is chosen) performs the first
`music_resume`, so Track A starts exactly as the film proper begins.

Track switch happens at `jaca.asm:12` — `CALL music_switch_b` does
`PT3 INIT(HL=song_pt3_track_b)` + clears the pause flag set by
`music_pause` at jaca scene entry. AY chip is muted during the SCROL
animation in between.

## Format target (historical, kept for reference)

## Technical constraints

| Field | Value |
|---|---|
| Sound chip | AY-3-8912 (the +2 has it; +2A/+3 also have it) |
| Tracker | Vortex Tracker II (`.pt3`) |
| Replayer | `pt3_play.asm` (Sergey Bulba, public domain) — ~1.8 KB Z80 |
| Replayer location | bank 7 (currently empty, 16 KB free) |
| Music data location | bank 7 tail + bank 3 (also empty) |
| Tick rate | 50 Hz (one call per IM2 frame) |
| Channels | A / B / C (free assignment per piece) |
| **Total budget** | ~30 KB across banks 7 + 3, replayer included |
| Per-piece typical | 2-4 KB |
| Loop strategy | each piece loops until the scene advances; no fade-out needed (scene transitions clear the screen and we re-init) |

The scene driver in `game.asm` / `pelicula.asm` already advances on key
press or on a timed `HALT` loop, so the music engine doesn't need a
"length" — it just plays until the next scene does `CALL music_init` with
a new track ID.

## Cinematic catalogue (full play-through)

The Film runs ~4-5 minutes in total. Below is every distinct on-screen
beat in chronological order, with the Spanish text the game actually
displays (from `original-48k/src/film/`). In-game text quotes are kept
in Spanish per project convention; mood notes are in English.

### Phase A — Titles (`game.asm`)

| ID | Beat | Display | Mood |
|---|---|---|---|
| **A0** | Copyright + SAGA DARK logo + language menu | `(C) COPYRIGHT 1987 TRITON SOFTWARE` / green "SAGA" + white "DARK" tile-art / `1 - ESPAÑOL  /  2 - ENGLISH` | Identity card, ceremonial, brand impact |
| **A1** | Rain + "press a key" scroll (IM2 `GOTAS` raindrop animation) | `PULSE  UNA  TECLA` (scrolling) | Mysterious calm, waiting, tense quiet |
| **A2** | Pijama / team credits — faces of the authors with funny aliases | `CARLOF PEREZTROIKO: TOCATECLAS` / `ESTEVE WONDER: TOCATECLAS` / `SUPER AJO DALTONIUS: GARABATOS` / `IGOR TRIVALDO: MAPEADOR DE CAMINOS` / `JOSELITO MENOR: TOCAPELOTOSQUIS` | **Comedy interlude** — only humorous moment in the whole film |
| **A3** | "And the story begins..." | `LA HISTORIA COMIENZA ...` (with giant Y) | Pre-narrative fanfare, transition |

### Phase B — The horse rider (`jaca.asm`)

| ID | Beat | Display | Mood |
|---|---|---|---|
| **B1** | Rider crosses the desert with scrolling mountains | `UNA ESBELTA FIGURA AVANZA POR LA ARIDEZ DEL DESIERTO` (scroll) | Epic traveller, arid landscape, lone journey |
| **B2** | Rider arrives at the cave (Grandfather's home) | (no text — arrival animation) | Mysterious arrival, anticipation |

### Phase C — The narrative (`pelicula.asm`, `PPANT1..9` + `PANT1..10`)

| ID | Beat | Image | Text (Spanish, verbatim) | Mood |
|---|---|---|---|---|
| **C1** | Grandfather by the fire (`PPANT1` + animated FUEGO IM2) | Old wise man, hearth flames | `HIJO MIO... HAN SIDO LARGOS AÑOS DE DURO ENTRENAMIENTO, AHORA ESCUCHA LA HISTORIA QUE VOY A NARRARTE, LUEGO, DE TI DEPENDERA MI FUTURO... Y EL DE LO QUE QUEDA DE HUMANIDAD.` | **Intimate, sage elder, hearth solemnity, transmission of legacy** |
| **C2** | Futuristic city with flying ships (`PPANT2`, IM23 anim) | Skyscrapers + UFOs | `HACE MUCHOS AÑOS EN ESTE MALDITO PLANETA EXISTIO UNA GRAN CULTURA. NUESTROS ANTEPASADOS VIVIAN EN GIGANTESCAS CONSTRUCCIONES QUE LLEGABAN AL CIELO, PERO LA CODICIA DE ESTOS LES CONDUJO A SU PROPIA EXTINCION.` | Majestic futurism, hope laced with foreboding |
| **C3** | Apocalypse / atomic bomb (`PPANT3` + scroll-up BOMBA) | Explosion shrinking city | `GIGANTESCOS ARBOLES DE FUEGO, ACABARON CON LA BRILLANTE CIVILIZACION, LOS GRANDES ARBOLES TRANSFORMARON EN CENIZAS CONSTRUCCIONES, HOMBRES Y ANIMALES POR IGUAL.` | **Cataclysm, apocalyptic fire, terror** |
| **C4** | Death / post-apocalypse (`PPANT4`) | Corpse in desolation | `SOLO UNOS POCOS SOBREVIVIERON... JAMAS LO CONSIGUIERON. LAS EPIDEMIAS SE SUCEDIERON Y DIEZMARON AUN MAS LA YA AZOTADA CIVILIZACION.` | Lament, despair, dark melancholy |
| **C5** | Return of magic (`PPANT5`) | Malevolent creatures | `LOS REMOTOS Y OLVIDADOS TIEMPOS DE BRUJOS, DRAGONES Y HECHICEROS REGRESARON. FUE ENTONCES CUANDO APARECIO EL PRIMER -DARK- ESTE NO TARDO EN RECLUTAR Y ADIESTRAR FUERTES Y MALEVOLOS SERES.` | **Dark mythology, sorcery, return of the occult** |
| **C6** | Village 1 — sacking (`PPANT6`) | Destroyed village | `EL Y SU TROPA SAQUEARON, MATARON Y VIOLARON A LOS INDEFENSOS HABITANTES DE LOS POBLADOS POR DONDE PASABAN. PRIMERO FUERON LAS ALDEAS DE LA COSTA Y DESPUES LAS DEL INTERIOR. TODOS ERAN SOMETIDOS BAJO SU CRUEL Y SANGRIENTA MIRADA.` | Brutal violence, oppression, terror |
| **C7** ⭐ | **KAMUIR** (`PPANT7` — longest cartela, 3 pages) | The villain himself | `KAMUIR, EL SEGUNDO -DARK-, NO SE HIZO ESPERAR, TRAS LA MUERTE DE SU PADRE SAQUEO NUESTRO POBLADO Y SEGO LA VIDA DE MI FAMILIA. CON FRIA SONRISA LENTAMENTE BAJO SU CABEZA Y ME MIRO, YO PORTABA EN MIS BRAZOS EL LIBRO MISTICO. EL CONTENIDO DE ESE LIBRO LO ERA TODO PARA MI. ERA MI PROTECTOR CONTRA LAS FUERZAS OCULTAS DE LAS TINIEBLAS. PUDE ESCAPAR DE AQUEL INFIERNO.` | **The Kamuir motif — demonic main villain, cold, central to the whole project. Reusable as boss theme in Phase 5.** |
| **C8** | Village 2 — refuge + return of evil (`PPANT8`) | Another village, shadow | `ESTUVE AL BORDE DE LA MUERTE EN VARIAS OCASIONES... PASARON LOS AÑOS Y CUANDO TODO ERA RECORDADO COMO UNA LEJANA PESADILLA, KAMUIR REGRESO CON SU ODIO HACIA TODO LO VIVO.` | Cautious relief + foreboding, evil returns |
| **C9** ⭐ | NOOOOOOOO climax (`PPANT9`) | Total loss | `POR SEGUNDA VEZ DESTRUYO TODO AQUELLO POR LO QUE YO HABIA LUCHADO, MI FAMILIA Y MI LIBRO DEL CUAL SE APODERO.` | **Dramatic climax, extreme grief, scream of despair** |
| **C10** | Oath of vengeance (back to `PPANT1`) | Grandfather again | `FUE SOBRE LA TUMBA DE TU MADRE DONDE YO JURE VENGANZA, Y AHORA TU SERAS EL ENCARGADO DE LLEVARLA A CABO.` | **Solemn oath, transmission of the mission, call to vengeance** |

### Phase D — Final (`final.asm`)

| ID | Beat | Display | Mood |
|---|---|---|---|
| **D1** | Sun + horse + heroes' faces + reset prompt | Rising sun (`IMGSOL`), horse (`IMGJACA`), team faces (`CARASFIN`) / `STE ES EL FINAL DE LA HISTORIA, LO DEMAS ES COSA TUYA` / `RESETEA Y CARGA EL JUEGO` | **Heroic call to action, epic-melancholic closure** |

---

## Theme assignment (recommended scenario, 6 pieces)

| # | Theme | Covers | Approx. duration in-film |
|---|---|---|---|
| 1 | **MAIN TITLE — "Saga Dark"** | A0 + A1 + A3 | ~30-40 s of screen time |
| 2 | **PIJAMA JINGLE** | A2 | ~25-30 s |
| 3 | **THE JOURNEY** | B1 + B2 + C1 + C10 | ~60-80 s total (B1+B2 + grandfather framing scenes) |
| 4 | **THE FALL** (civilisation → apocalypse) | C2 + C3 + C4 | ~60 s (C2 majestic → C3 sudden break → C4 lament) |
| 5 | ⭐ **THE KAMUIR THEME** | C5 + C6 + C7 + C8 + C9 | ~90-120 s — longest theme; the whole "evil rising → climax" act |
| 6 | **FINAL — "Vengeance"** | D1 | ~30-40 s, ideally with a clear opening hit |

Total expected runtime ≈ 5-6 min — matches the Film's actual playthrough.

If 6 pieces is too many for the composer or budget, the fallback is the
4-piece minimum: drop *The Journey* (use *Main Title* across A+B), and
fold *The Fall* into *The Kamuir Theme* as a long crescendo build.

---

## Per-theme briefs

Each brief is self-contained: a composer or curator can read just one
section and have everything needed.

---

### Theme 1 — MAIN TITLE: "Saga Dark"

**Used in:** A0 (logo + language menu), A1 (rain wait), A3 ("the story begins"). Covers the opening ~40 s before the rider appears.

**Target duration:** ~45-60 s loop. Should sound complete enough that hearing it twice during the language-menu wait isn't tedious.

**Tempo:** 80-95 BPM. Slow enough that the player has time to read the menu, fast enough to feel like a film score, not a screensaver.

**Mood:** Mysterious, ceremonial, dark-but-inviting. Same archetype as the title screen of *Lyra II* (Tim Follin) or the boot music of *Robocop* — establishes "this is a serious, dramatic story." The rain animation continues over A1, so the music should leave room for that texture rather than fight it.

**AY channel suggestion:**
- **A (melody):** Sustained lead, square wave with envelope decay. Slow rising motif that resolves on a minor chord.
- **B (harmony):** Slow arpeggio (5th + minor 3rd) underneath. Could use the SID-style envelope tricks for a "string pad" feel.
- **C (bass + percussion):** Sparse low pulse on beats 1 and 3. No drums during the menu — drums kick in at A3 ("the story begins") if a separate intro variant is feasible; otherwise skip.

**Structure:** Intro (4 bars) → loop (16 bars) → loop. No outro — the next scene's `music_init` cuts it.

**References (mood):**
- Tim Follin — *Lyra II* title
- Wally Beben — *Galactic Patrol* intro
- Yerzmyey — "Strange Light Under My Bed" (feel, not literally)
- Cinematic: *Conan the Barbarian* (1982) opening, *Blade Runner* end credits — the "dark fantasy with hope" colour

**Avoid:**
- Fast arpeggios or busy textures (the rain handles that visually)
- Major-key resolution (this is *dark* fantasy)
- Anything chiptune-cheery (no Mario, no Sonic)

---

### Theme 2 — PIJAMA JINGLE

**Used in:** A2 only — the comedic team-credits sequence with photos of the developers and joke aliases.

**Target duration:** ~25 s. Could be one full pass with no loop, or a 12 s loop heard twice.

**Tempo:** 130-150 BPM. Fast and bouncy.

**Mood:** Pure 80s sitcom-credits comedy. The whole rest of the film is grim; A2 is the **deliberate comic relief** where the authors put their own faces with absurd Spanish nicknames (`TOCATECLAS` = "key-tapper", `TOCAPELOTOSQUIS` = literally "ball-toucher" with a Russian-sounding suffix as a joke). The music must lean into that and clearly contrast with everything around it. Think **vaudeville circus** + **8-bit cartoon**.

**AY channel suggestion:**
- **A (melody):** Bouncy staccato pulses with vibrato. Major-key, with cheeky tritone substitutions for the punchline beats.
- **B (counter-melody):** "Oompah" alternating bass line on every beat (think tuba in a marching band).
- **C (percussion):** Kick + snare + open hi-hat using AY noise channel. The percussion sells the comedy.

**Structure:** Intro flourish → 8-bar phrase → repeat with a "wrong note" variation on the second pass for comic effect → out.

**References (mood):**
- Tim Follin — *Bionic Commando* "wacky" tracks
- Factor6 — "Cloud 9", "Lamerina"
- Cinematic: *The Benny Hill Show* theme, *Pink Panther* — but in chiptune
- Could even nod to *Tetris*-style folk-bouncy

**Avoid:**
- Dark / serious / atmospheric — the contrast with Themes 1, 4, 5 must be loud and obvious
- Slow tempo — it must read as "comedy" within the first 2 seconds

---

### Theme 3 — THE JOURNEY

**Used in:** B1 (rider crosses the desert), B2 (arrival at the cave), C1 (Grandfather by the fire — frame opening of the narrative), C10 (oath of vengeance — frame close of the narrative). It's the **family theme** — wherever the rider or the grandfather are on screen.

**Target duration:** 60-80 s loop. The rider scroll alone is ~30 s; with the grandfather framing scenes it adds up.

**Tempo:** 100-110 BPM. A walking horse cadence — not too fast, not dragging.

**Mood:** Epic-but-intimate. Lone wanderer crossing an arid landscape, then sitting down by a fire to listen to a story. **Not** action-epic — this is *Lawrence of Arabia* meets *The Hobbit*. Carries hope and resolve. When it returns at C10 ("now you will be the one to carry out the vengeance") it should feel like the same theme but more determined — composer can request the C10 cue use the same melody with a small variation (key shift up, fuller orchestration) as a callback. If the .pt3 budget allows two variants, that's ideal; otherwise one piece does both.

**AY channel suggestion:**
- **A (melody):** Folk-style modal melody (Dorian or Phrygian — that "ancient" colour). Square lead with light vibrato. Phrases breathe — leave gaps so the listener feels the space of the desert.
- **B (counter / pad):** Sustained 5ths underneath, slow movement. Sometimes drops out entirely to let the melody sit alone (especially during C1's text-print pauses).
- **C (bass):** Walking quarter-note bass on the tonic and 5th. Subtle. Adds the "journey forward" feel.

**Structure:** No big intro hit (B1 cuts to it from a black screen). Just start playing — 4-bar lead-in → A section (16 bars) → B section (variation, 16 bars) → return to A → loop.

**References (mood):**
- Tim Follin — *The NeverEnding Story* on Spectrum
- Yerzmyey — *Astral Combat* (the slower passages)
- Cinematic: Howard Shore — *LOTR* "Concerning Hobbits"; Jerry Goldsmith — *The 13th Warrior*
- Game: *Solstice* (NES, Tim Follin) — that exact ancient-quest texture

**Avoid:**
- Heavy percussion (saves it for The Kamuir Theme)
- Modern chord progressions — keep modal/medieval
- Anything that competes with the dialogue text being printed on screen

---

### Theme 4 — THE FALL (civilisation → apocalypse)

**Used in:** C2 (futuristic city), C3 (apocalypse / atomic explosion), C4 (post-apocalyptic death). One continuous narrative beat: prosperity → cataclysm → mourning. Ideally one piece with three distinct sections that the music engine can sync to scene changes, or two short pieces (C2 = "majestic city", C3+C4 = "after the fall") if simpler.

**Target duration:** ~60 s for the complete sweep.

**Tempo:** Variable. C2: 100 BPM, stately. C3: tempo break / hit / silence — chaos. C4: 70 BPM, dragging dirge.

**Mood:**
- **C2 (city):** Wonder, scale, optimism — but in a minor key, so it foreshadows. Like the opening of *Aliens* or the Atlantis theme — vast and beautiful but doomed.
- **C3 (explosion):** A cataclysmic hit. Brass-stab equivalent in AY — all three channels playing a dissonant cluster, noise channel on full white noise burst, then sudden silence/sparseness. The "trees of fire" line in the text should land on this cue.
- **C4 (death):** Funeral pace. Slow descending bass line. Solo melodic line, lots of space. Ends unresolved, leading into Theme 5.

**AY channel suggestion (C2):**
- A: Long sustained notes, slow arpeggio outline. Square + slight envelope sweep.
- B: Triadic pad, building.
- C: Slow bass on the tonic.

**AY channel suggestion (C3):**
- All three channels: cluster chord (root + b2 + tritone). Use noise channel for the bomb impact. Then drop to silence for ~2 s before C4 starts.

**AY channel suggestion (C4):**
- A: Solo melody, mournful, descending phrases.
- B: Mostly silent, occasional held note.
- C: Funeral march bass — slow, half-tempo of C2.

**Structure:** A-B-C three-section piece. Composer can deliver as one big through-composed file or three short loops chained by `music_init` calls in `pelicula.asm`. Three-loops is simpler to drive but eats more bytes (3× headers).

**References (mood):**
- Tim Follin — *Star Wars* on Spectrum (the imperial-style stately)
- Wally Beben — generic boss / dramatic tracks
- Cinematic: Hans Zimmer — *Inception* "Time"; Vangelis — *Blade Runner* end titles; for C3 specifically, the brass-cluster moment in Bernard Herrmann — *Psycho*
- Game: *R-Type* on Spectrum, the title sequence

**Avoid:**
- Major-key resolution at C4 — it stays in mourning, hands off to the next theme
- "Heroic" feel — this theme is the *fall*, not the *rise*

---

### Theme 5 ⭐ — THE KAMUIR THEME

**Used in:** C5 (return of magic), C6 (sacking the villages), C7 (Kamuir himself — 3 pages), C8 (return of evil), C9 (NOOOOOO climax). The single longest theme of the soundtrack — covers ~90-120 s of screen time and the entire dramatic ascent of the villain.

**Crucially:** this theme will be **reused** outside the film. Kamuir is the final boss of Phase 5 ("Kamuir's Fortress") in the project roadmap. So this piece is not just film music — it's the **leitmotif of the antagonist for the whole game project**. Treat it accordingly.

**Target duration:** 90 s loop minimum. Should have an A-B structure that feels like it's building, so it can ride under C5 (introduction of dark forces), peak at C7 (Kamuir on screen), and pay off at C9 (the scream).

**Tempo:** 90-100 BPM. Heavy, deliberate, threatening. Faster than Theme 4's dirge but not action-fast — Kamuir is *menace*, not panic.

**Mood:** **Demonic, cold, regal, malevolent**. Imagine Sauron's theme from *LOTR*, or Darth Vader's Imperial March, but for a chiptune. This is a villain who *strolls*, who *smiles coldly* (the text literally says `CON FRIA SONRISA LENTAMENTE BAJO SU CABEZA`). The music should embody:
- *Power* — heavy bass, deliberate rhythm
- *Cold* — minor key with chromatic descents
- *Ritual* — repetitive ostinato pattern (like a chant)
- *Inevitability* — the same motif keeps returning, getting bigger

**AY channel suggestion:**
- **A (melody):** A short, memorable 4-note motif (the "Kamuir motif") — chromatic, ominous, returns throughout. Square wave, no vibrato, harsh attack. This is the hook everyone remembers.
- **B (harmony / counter-line):** Sustained minor-chord pads, occasional dissonant counter-melody that snakes around the main motif.
- **C (bass + percussion):** Heavy drum-machine pattern using noise + low-frequency square. Tom-toms on the off-beats. The percussion is *military*, like an army marching.

**Structure:**
- Bars 1-8: Introduce the motif (channel A alone with bass)
- Bars 9-16: Add harmony and percussion
- Bars 17-24: Variation — pitch up a step, more aggressive
- Bars 25-32: Return to bars 9-16 louder
- Bars 33-40 (climax for C9): Full intensity — all channels at maximum, dissonant cluster on the last bar
- Loop point back to bar 17 (so the climax can repeat for the NOOOOOO if needed) or bar 9

If we have `music_set_section` capability in the replayer, the `pelicula.asm` driver can jump to a specific section per cartela:
- C5 → bars 1-8 (introduction)
- C6 → bars 9-24 (build)
- C7 → bars 25-32 (Kamuir on screen, full theme)
- C8 → bars 17-24 (variation, presaging return)
- C9 → bars 33-40 (climax)
This is the optimal use but adds replayer complexity. Fallback: just loop the whole thing and let it cycle.

**References (mood):**
- Tim Follin — *Cobra* on Spectrum (the verses)
- Yerzmyey — "Death Squad", "Haunted Mansion"
- Factor6 — "Fearzone"
- Cinematic: John Williams — Imperial March; Howard Shore — Sauron's theme; Goblin — *Suspiria*
- Game: *Castlevania II* — Bloody Tears (mood), *Final Fantasy VI* — Kefka's theme (cold malevolence)

**Avoid:**
- Heroic / triumphant feel (that's Theme 6's job)
- Frantic / panic — Kamuir is in control, not in a hurry
- Major key — pure minor / Phrygian / Locrian
- Soft dynamics — this needs presence

---

### Theme 6 — FINAL: "Vengeance"

**Used in:** D1 only — the closing screen with sun, horse, heroes' faces, and the call to action `RESETEA Y CARGA EL JUEGO`.

**Target duration:** 30-45 s, ideally one full piece without an obvious loop point. Or a 20 s piece that loops once gracefully.

**Tempo:** 110-125 BPM. Determined, forward-driving — but not yet action-game-fast.

**Mood:** **Heroic call to action, epic-melancholic closure**. The grandfather has just told the player they will avenge the family. The screen shows the rising sun, the horse, the team's faces. This is the **passing of the torch**. Feel of: end credits of a great fantasy film where the survivors ride toward a quest. There's still grief (Theme 5 just finished with the climax), but now there's resolve.

**AY channel suggestion:**
- **A (melody):** Soaring lead, square wave with light envelope. Major or modal-major (Mixolydian works) for the resolution. Could quote the Theme 3 "Journey" melody in a triumphant key — that creates a satisfying through-line.
- **B (counter-melody):** Triadic harmony. Builds with the melody.
- **C (bass + percussion):** Driving quarter-note bass. Snare backbeat + occasional fill. Less heavy than Theme 5 — this is forward motion, not menace.

**Structure:** Big opening hit (the sun appears) → melody A (16 bars) → bridge (8 bars) → melody A repeat with full instrumentation (16 bars) → out. Composer can choose to land on the last note as a sustain that holds while `RESETEA Y CARGA EL JUEGO` is printed.

**References (mood):**
- Tim Follin — *The Last Ninja* end theme
- Matt Gray — *Last Ninja 2* "The Mansion" finale
- Factor6 — "Bits-Intro" (energy)
- Yerzmyey — "Astral Combat" climax
- Cinematic: John Williams — *Star Wars* end of *A New Hope* throne-room scene; Howard Shore — *LOTR* "The Grey Havens"
- Game: *Mega Man 2* — Dr Wily's Castle Stage 1, but heroic instead of menacing

**Avoid:**
- Resolving to a full major chord too early — keep some minor/melancholy until the last 8 bars
- Sounding like victory after a battle — this is *the start* of the player's quest, not the end

---

## Sourcing strategy

Three paths, in order of recommendation:

### 1. Commission an existing chiptune composer (recommended)

The brief above is detailed enough to send to any active ZX scene
composer. Suggested approach:
- Pick **one** composer for all 6 pieces — gives the soundtrack a coherent sonic identity.
- Email politely with: project context (preservation of Saga Dark, Triton Software 1990, CC BY-NC-SA 4.0), this `SOUNDTRACK.md`, link to the GitHub repo, expected timeline, and any compensation arrangement.
- Most active scene composers will reply within a week.

**Composers worth contacting** (based on style fit):

| Composer | Why | Contact |
|---|---|---|
| **Yerzmyey** | Polish, prolific, deeply atmospheric. *Death Squad*, *Haunted Mansion* are tonally a perfect match for Themes 4-5. | [yerzmyey.bandcamp.com](https://yerzmyey.bandcamp.com/), [Hooy-Program](http://hooyprogram.i-demo.pl/) |
| **Factor6** | Czech, top-tier modern AY production. Wide range — could cover comedy (Theme 2) and dark (Themes 4-5) equally well. | Demozoo, ChipMusic.org |
| **Gasman (Matthew Westcott)** | UK, also author of jsspeccy3 (which the project's roadmap §8 plans to embed). Doubly fitting. | [zxtunes.com/author.php?id=701](https://zxtunes.com/author.php?id=701) |
| **C-Jeff** | Modern, cinematic feel. Good for Theme 6. | Demozoo |
| **Aki** | Czech, 292 tracks across 28 years, very versatile. | Demozoo, zxtunes.com |

### 2. Curate from existing archives

If commissioning falls through, search:
- [zxart.ee/eng/music/database/](https://zxart.ee/eng/music/database/) — filter by `format = PT3`, `rating ≥ 4`, then by author
- [zxtunes.com](https://zxtunes.com/) — browse by composer
- [bulba.untergrund.net/music_e.htm](https://bulba.untergrund.net/music_e.htm) — `Tr_Songs.7z` mega-archive (29,300 modules)
- [archive.org/details/ZX_Spectrum_is_Alive-4030](https://archive.org/details/ZX_Spectrum_is_Alive-4030) — AY Riders compilation, **CC BY-NC-ND** (only usable as-is, no edits — incompatible with the project's CC BY-NC-SA if we'd need to modify)

For each candidate track: confirm it's a `.pt3` (not just an MP3 render), then **email the author for permission** before using.

### 3. Compose ourselves

If we go this route, we'd need to:
1. Install Vortex Tracker II ([bulba.untergrund.net/vortex_e.htm](https://bulba.untergrund.net/vortex_e.htm))
2. Work through one of the existing tutorials (e.g. [zxspectrumcoding.wordpress.com — Vortex Tracker part 1](https://zxspectrumcoding.wordpress.com/2022/01/01/128k-programming-basics-vortex-tracker-part-1/))
3. Compose against this brief

Realistic only if someone on the team has musical training; the briefs above act as the "composer's guide" in that case.

## Integration sketch (when the music files arrive)

```asm
; In bank 7, at e.g. 0xC000:
;   pt3_play.asm        ~1.8 KB Z80 replayer
;   theme1.pt3          ~3 KB
;   theme2.pt3          ~2 KB
;   ... etc

; In game.asm, hook the IM2 vector chain:
;   GOTAS handler → after handling rain → JP pt3_play
;   (or before — ordering matters only for cycle budget)

; Per-scene:
MAIN    CALL POKSET
        CALL CLS
        LD HL,TEXTO
        CALL IMPREC
        CALL music_init        ; <-- new: theme 1
        DEFW theme1
        ...

ESTASS  CALL AMPLI_E
        CALL music_init        ; <-- new: theme 2 (pijama jingle)
        DEFW theme2
        LD HL,NUBO
        CALL IMPRE4
        ...
```

`music_init` pages in bank 7, points the replayer at the chosen track,
re-pages slot 3 to whatever was active, sets a flag the IM2 handler
checks, and returns. Detail to be specified once the replayer is in.

## Open questions

- **Theme 5 sectioned playback:** is the ROI of `music_set_section` worth the replayer complexity, vs just looping the whole Kamuir track and letting it cycle? Decision deferred until we have the first `.pt3` in hand.
- **Cross-fades vs hard cuts** between scenes: AY doesn't naturally cross-fade. Likely accept hard cuts (matches the cassette's own scene-cut aesthetic).
- **Volume balance:** the rain `GOTAS` handler doesn't currently use the AY — but if we add beeper SFX later (item 3 of the techniques pass) they'll fight the AY for perceived loudness. Defer to that subversion.

---

Last updated: 2026-06-13 (Track B → Bushido (Vispera), original; both tracks
PD/original). This file evolves as the AY-music subversion progresses.
