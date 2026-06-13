# SAGA DARK — Screen Artwork Catalog
## ZX Spectrum 48K | Triton Software | 1990
### Reference for 128K Reconstruction Project

Each entry documents a distinct background screen or full-screen graphic, noting its origin, frames where it appears, colour palette, and dominant visual elements.

---

## SCREEN 01 — TITLE SCREEN

**Type:** Full-screen static artwork (in-game)
**Origin:** ORIGINAL (present in dark1.sna)
**Frames:** snap1_titulo.png; implied frames 0001 area before video launcher takes over

### Visual Description
- Pure **black** background
- Top-centre: Word "SAGA" in small green pixel letters above the main logo
- Main logo: "DarK" rendered in large white pixel art — the letter "D" is formed from a circular skull motif (a round white skull with hollow eyes forms the "D" curve), remaining letters "arK" in white pixel bold

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| "SAGA" text | Green (bright) |
| "DarK" logo | White |
| Skull in D | White |

### Notes
- The logo style is distinctly ZX Spectrum pixel art — not the red gothic font of the third-party launcher menu
- Bottom-right area: text `PULSE UNA TEC[LA]` in yellow (press any key prompt)
- No HUD/status bar visible on this screen

---

## SCREEN 02 — MAIN MENU

**Type:** Full-screen static screen (in-game)
**Origin:** ORIGINAL (present in dark1.sna)
**Files:** dark1_menu.png, snap2_menu.png (identical content)
**Frames:** ~0001 area in original game; visible in captures

### Visual Description
- Pure **black** background, full play area
- Title line top-centre: `SAGA--DARK` in white, ZX system font (uppercase)
- Menu options (left-aligned, colour-coded):
  - `0 ...... EMPEZAR` — **Red**
  - `1 ...... TECLADO` — **Yellow**
  - `2 ...... KEMPSTON` — **Green**
  - `3 ...... SINCLAIR` — **Cyan**
  - `4 .... REDEFINIR` — **Magenta**
- Credits block below (green/yellow/red):
  - `PROGRAMA` (green)
  - `MIGUEL ANGEL ESTEVE MARCO` (yellow)
  - `GRAFICOS` (green)
  - `ANTONIO JUAN HERNANDEZ CUELLAR` (yellow)
  - `© COPYRIGHT TRITON SOFTWARE 1990` (red)
- **Status bar** is visible at the bottom (green vines, skull corners, magenta inner panel)

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Title `SAGA--DARK` | White |
| EMPEZAR (0) | Red (bright) |
| TECLADO (1) | Yellow (bright) |
| KEMPSTON (2) | Green (bright) |
| SINCLAIR (3) | Cyan (bright) |
| REDEFINIR (4) | Magenta (bright) |
| `PROGRAMA` / `GRAFICOS` labels | Green (bright) |
| Programmer/artist names | Yellow (bright) |
| Copyright line | Red (bright) |

### Notes
- This is the true original menu from the .sna files
- The video launcher (Screen 03 below) replaced this with an English-language menu in the video recording

---

## SCREEN 03 — VIDEO LAUNCHER MENU (THIRD PARTY)

**Type:** Full-screen static overlay
**Origin:** THIRD PARTY (not in .sna files)
**Frames:** 0001–0019 (video only)

### Visual Description
- Pure **black** background
- Top: `SAGA DARK` in large **red** gothic/horror-style font — notably different from original pixel logo
- Centre: Abstract **blue** logo/symbol — a stylised tribal eye or shield shape, rendered in blue attribute cells. Oval/almond shaped with internal curved lines suggesting an iris or a stylised wing/eye motif. This is approximately 128×64 pixels.
- Below logo: Three menu options in small **white** monospace-ish text:
  - `1. START INTRO`
  - `2. START GAME`
  - `3. INFINITE ENERGY`

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Title font | Red (bright) |
| Blue logo/symbol | Blue (bright) |
| Menu options | White |

### Notes
- The blue logo appears to be a custom pixel graphic not present in the original game — it animates slightly across frames (the eye/oval shape shifts slightly, possibly a spinning animation)
- "INFINITE ENERGY" is a cheat/debug option added by the video uploader
- This screen should NOT be replicated in the 128K reconstruction

---

## SCREEN 04 — TRANSITION / "ENTER" SCREEN

**Type:** In-game loading/transition screen
**Origin:** ORIGINAL (present in dark2.sna)
**Files:** dark2_transicion.png, snap3_transicion.png (identical)
**Frames:** Between menu and level 1 start; after key press

### Visual Description
- Pure **black** background in the play area
- Centre-screen: Text `| ENTER |` in **yellow** — two cyan/green vertical bar characters flanking the word "ENTER" in yellow. Stylised prompt.
- The text is partially garbled/stylised in appearance — the colour bars (| ) appear in green/cyan, the ENTER text in yellow
- **Status bar** is fully visible at the bottom (same as all gameplay screens)
- The status bar energy/health indicator shows as a narrow green bar

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Bar characters | | Green/Cyan |
| `ENTER` text | Yellow (bright) |
| Status bar | Green + Magenta |

### Notes
- This appears when the game is waiting for player input before loading Level 1
- The energy bar in the status bar appears at minimum (thin green sliver) — this is the player's current energy state display

---

## SCREEN 05 — INTRO CREDITS (FILM STRIP)

**Type:** Full-screen static (no status bar, pure illustration)
**Origin:** ORIGINAL
**Frames:** 0027–0030; 0030 is the most complete frame

### Visual Description
- **Black** background
- Left side: Film-strip graphic — vertical strip with sprocket-hole circles on both sides (black and white stipple). Inside the strip are three portrait panels showing character faces in dithered black-and-white ZX Spectrum art:
  - Top panel: A male face with distinctive features (bearded or stylised)
  - Middle panel: A second male face (younger, different features)
  - Bottom panel: A third face (possibly female or rounder features)
- Right of film strip: Text in two colours:
  - A small **blue** pixel sprite/icon (appears to be the same book-icon used in the status bar) precedes the text
  - `IGOR TRIVALDO:` in yellow
  - `MAPEADO` in white (on separate line)
- Frame 0025–0026 shows earlier state: `ESTAS SON LAS PERSONAS / QUE HAN HECHO POSIBLE QUE / PUEDAS PASAR UN BUEN RATO` in **cyan** on black — a different text frame preceding the film strip

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Film strip border | White |
| Portrait art | White (dithered) |
| Blue sprite | Cyan/Blue (bright) |
| Name label | Yellow (bright) |
| Role label | White |
| Intro text | Cyan (bright) |

### Notes
- The film-strip style is original and distinctive — it establishes a cinematic language for the credit sequence
- Only one credit visible in available frames (IGOR TRIVALDO: MAPEADO). Other credits may exist in earlier or later frames not captured.
- The blue sprite that precedes the text is the same "book" icon seen in the HUD status bar centre position

---

## SCREEN 06 — CUTSCENE 1: "THE MENTOR"

**Type:** Full-screen illustration with text caption
**Origin:** ORIGINAL
**Frames:** 0040 (approximately frames 0035–0045 based on timeline)

### Visual Description
**Illustration (occupies top ~75% of screen):**
- Black-and-white detailed artwork — fully monochrome, using dithering/stipple for shading
- **Left figure:** Young muscular hero — bare-chested, athletic build, seen from the side/three-quarter angle, seated or crouching by the fire
- **Right figure:** Old robed warrior/sage — a hooded robed elder figure holding a tall staff, seated by the fire. The robe has flowing folds. A small glowing orb or light element near the staff tip (rendered in blue pixel).
- **Centre:** A campfire between them — rendered as a pointed flame shape in white
- **Background:** Cave interior — rough stone walls visible, a skull decoration mounted on the right wall, cave opening or alcove shapes
- **Border:** A thin black border around the illustration panel; below is a black text area

**Text caption (bottom ~25% of screen):**
```
HIJO MIO... HAN SIDO LARGOS ANOS
DE DURO ENTRENAMIENTO, AHORA
ESCUCHA LA HISTORIA QUE VOY A
NARRARTE, LUEGO, DE TI DEPENDERA
```
White text on black background. Standard ZX Spectrum system font.

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Illustration background | Black |
| All illustration art | White (dithered) |
| Staff orb | Cyan/Blue |
| Text area background | Black |
| Caption text | White |

### Notes
- The monochrome treatment is intentional — this is a "past tale" told in sepia/black-and-white
- The skull on the cave wall is a recurring motif throughout the game
- The narrator voice is the old warrior speaking to the young hero (first person, the story he tells becomes cutscenes 2–4)

---

## SCREEN 07 — CUTSCENE 2: "THE APOCALYPSE"

**Type:** Full-screen colour illustration with text caption
**Origin:** ORIGINAL
**Frames:** 0050 (approximately frames 0045–0055)

### Visual Description
**Illustration (top ~75%):**
- Full-colour ZX Spectrum art — vivid palette showing destruction
- **Upper background:** Magenta/purple city ruins and towers silhouette against an implied sky
- **Mid-ground:** Yellow/gold ground/rubble; various wreckage elements
- **Debris details:**
  - Mechanical spider-like shapes (mech insects?)
  - Skeletal remains visible lower-centre
  - A newspaper/document visible (text "TURBO ARIN" or similar — possibly a in-universe newspaper name)
  - Explosion/fire plumes in yellow-orange upper centre and right
  - Blue debris elements
- The overall composition is busy and chaotic — destruction rendered in every colour the ZX Spectrum offers simultaneously

**Text caption (bottom ~25%):**
```
SOLO UNOS POCOS SOBREVIVIERON,
AQUELLOS ELEGIDOS EMPRENDIERON
UNA D[IFICIL MISION]...
```
White text on black. The text is partially cut off at the right edge.

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky/background | Magenta (bright) |
| Ground | Yellow (bright) |
| Explosion fire | Yellow (bright) |
| Mechanical debris | Cyan + Blue |
| Skeletal remains | White |
| Newspaper | White |
| Caption background | Black |
| Caption text | White |

### Notes
- This is the most chaotic/colourful illustration in the game — deliberately overwhelming
- The yellow ground and magenta ruins are the dominant colour pairing
- This cutscene establishes the post-apocalyptic setting of the game world

---

## SCREEN 08 — CUTSCENE 3: "KAMUIR"

**Type:** Full-screen colour illustration with text caption
**Origin:** ORIGINAL
**Frames:** 0060 (approximately frames 0055–0065)

### Visual Description
**Illustration (top ~75%):**
- Full-colour, intense palette — predominantly red with cyan energy bursts
- **Background:** Solid red fill; jagged cyan/white lightning or energy spike shapes emanating from behind central figure; volcanic landscape shapes on the horizon; additional creature silhouettes on either side
- **Central figure — KAMUIR:**
  - Towering humanoid warrior standing centre
  - Head: Elaborate headdress or flaming crown — blue/purple/white plumes or flames around the head
  - Torso: Bare muscular yellow-toned chest
  - Lower body: Dark green armoured kilt or skirt
  - Arms: Outstretched to the sides, commanding/intimidating pose
  - The figure is the largest element and clearly the dominant visual focus
- **Flanking creatures:** Strange bipedal creatures or humanoids on left and right edges of the illustration — rendered in muted colours against the red

**Text caption (bottom ~25%):**
```
KAMUIR, EL SEGUNDO -DARK-, NO SE
HIZO ESPERAR, TRAS LA MUERTE DE
SU PADRE SAQUEO NUESTR[A TIERRA]
```
White text on black.

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Red (bright) |
| Lightning/energy | Cyan (bright) |
| Kamuir headdress | Blue + White |
| Kamuir torso | Yellow (bright) |
| Kamuir kilt | Green (dark) |
| Flanking creatures | Mixed dark tones |
| Caption background | Black |
| Caption text | White |

### Notes
- This is the villain's introduction — visually the most dramatic screen
- Kamuir's colour scheme (yellow torso, red bg, blue headdress) is unique and distinctive — should be preserved when designing the final boss sprite
- The "-DARK-" title in the text establishes the franchise name within the fiction (Kamuir is "the second Dark")

---

## SCREEN 09 — CUTSCENE 4: "PARADISE LOST"

**Type:** Full-screen colour illustration with text caption
**Origin:** ORIGINAL
**Frames:** 0070 (approximately frames 0065–0075)

### Visual Description
**Illustration (top ~75%):**
- Full-colour, lush tropical palette
- **Upper left:** Yellow/orange sun or explosion — hot colours suggesting destruction entering this paradise
- **Sky:** Bright cyan/blue sky with white cloud textures
- **Background landscape:** Green jungle hills and cyan sea/lake
- **Vegetation (foreground):** Very lush — magenta/pink large tropical flower shapes (foreground left), green palm fronds, yellow and green mixed vegetation
- **Central figure:** Dark silhouette of the hero walking through this scene — rendered as a solid black or very dark shape against the bright colours (only figure without colour detail)
- **Water:** Turquoise/cyan flat water area mid-image
- **Trees:** Green palm tree centre-background

**Text caption (bottom ~25%):**
```
POR SEGUNDA VEZ DESTRUYO TODO
AQUELLO POR LO QUE YO HABIA
LUCHADO, MI FAMILIA Y MI LIBRO
DEL CUAL SE APODERO
```
White text on black.

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky | Cyan (bright) |
| Jungle hills | Green (bright) |
| Tropical flowers | Magenta (bright) |
| Sun/explosion | Yellow (bright) + Red |
| Water | Cyan (bright) |
| Hero silhouette | Black |
| Caption background | Black |
| Caption text | White |

### Notes
- The "libro" (book) mentioned here is the MacGuffin the player must recover — this is its first explicit reference
- The hero silhouette technique (black figure on coloured background) is elegant and avoids colour clash
- The contrasting hot colours (orange sun, top left) vs. cool paradise colours creates the sense of encroaching doom

---

## SCREEN 10 — LEVEL 1 INSTRUCTION / INTRO SCREEN

**Type:** Split-screen (in-engine view + text box)
**Origin:** ORIGINAL (present in dark2.sna or dark3.sna transition)
**Files:** dark3_nivel1_intro.png, snap4_nivel1_intro.png (identical)
**Frames:** Approximately frame 0075–0080 in video; captured in .sna files

### Visual Description
**Top ~65% — In-engine view:**
- Rendered using the actual Level 1 game engine — this is NOT a static illustration
- The scene shown is an unusual viewpoint: hero crouching inside a cave/grotto with the:
  - **Top:** Massive green cave-mouth / creature maw — bright green with white tooth shapes along the upper edge. This reads as either a giant cave entrance or the jaws of a giant beast. Red totem-like shapes visible upper-left corner.
  - **Background:** Grey mountain silhouettes, small dark green tree line
  - **Mid-ground:** Green column/stalagmite zone; a thin cyan water strip; magenta/yellow/purple layered floor platforms in the foreground
  - **Hero:** Crouching figure with spear, rendered in monochrome white/grey

**Bottom ~30% — Instruction text box:**
- White rectangular border on black background
- Text in white, ZX system font:
  ```
  ¡Cuidado valiente guerrero! Un
  gran peligro se cierne sobre
  ti. Utiliza las teclas "R-T"
  para correr e "Y" para saltar.
  (PULSA ENTER PARA EMPEZAR)
  ```

### Colour Palette (in-engine view)
| Element | ZX Colour |
|---------|-----------|
| Cave/maw ceiling | Green (bright) |
| Maw teeth | White |
| Red totem (corner) | Red (bright) |
| Mountain bg | Grey/White |
| Tree line | Green (bright) |
| Cyan water strip | Cyan (bright) |
| Floor platforms | Magenta + Yellow |
| Hero | White/Grey |
| Text box background | Black |
| Text box border | White |
| Text | White |

### Notes
- This screen reveals Level 2's visual language before Level 1 even begins — the cave ceiling with teeth is Level 2's stalactite zone
- The instruction text is the only screen with explicit control instructions for the player
- The controls confirmed: R-T to run, Y to jump (not Q-W or cursor keys)

---

## SCREEN 11 — TRANSITION SCREEN ("ENTER" PROMPT)

**Type:** Minimal in-game screen
**Origin:** ORIGINAL
**Files:** dark2_transicion.png, snap3_transicion.png
**Frames:** Between menu and levels

(See Screen 04 — this is the same screen documented there.)

---

## SCREEN 12 — LEVEL 1 BACKGROUND: "THE WASTELAND"

**Type:** Scrolling gameplay background (tile-based)
**Origin:** ORIGINAL
**Frames:** 0078–0088 (in-engine demo then gameplay)

### Visual Description
The Level 1 scrolling background is composed of multiple vertical layers:

**Layer 1 — Sky (top ~35% of play area):**
- Pure black with no gradient
- Occasional white fluffy cloud formations (simple pixel blobs)

**Layer 2 — Mountains (mid ~20%):**
- Yellow/bright yellow jagged silhouette mountain range
- Fine stipple texture suggesting rough rock surface
- Drawn as a continuous jagged line with peaks and valleys

**Layer 3 — Tree line (below mountains, ~10%):**
- Dense dark green silhouette row of small trees (palms and pines)
- Uniform height, packed tightly

**Layer 4 — Ground (~20%):**
- Light grey flat plane
- Debris texture: small scattered round pebbles, rubble shapes
- Some areas have skull-like rock shapes mixed in

**Background objects (appear at specific scroll positions):**
- Castle/tower ruin silhouette in the far mountain background (frame 0081)
- White cloud formations varying in position

**Foreground/midground scrollable objects:**
- Magenta/pink totem columns (recurring)
- Green carnivorous plant
- Grey boulders
- Grey stone rocks

**Red Cave Zone (Level 1 end area):**
- Grey cliff wall appears, splitting the screen vertically
- To the right of the cliff: Solid bright red block fills the area — stark, flat colour
- This is the visual transition/gate to Level 2

### Colour Palette
| Layer/Element | ZX Colour |
|---------------|-----------|
| Sky | Black (ink=Black, paper=Black) |
| Mountains | Yellow (bright) |
| Trees | Green (dark/bright) |
| Ground | White (paper=Black, creates grey) |
| Totem columns | Magenta (bright) |
| Carnivorous plant | Green (bright) |
| Clouds | White |
| Boulder/rocks | White/Grey |
| Red cave zone | Red (bright) |

---

## SCREEN 13 — LEVEL 2 BACKGROUND: "THE CAVE / GREEN HELL"

**Type:** Scrolling gameplay background (tile-based)
**Origin:** ORIGINAL
**Frames:** 0090–0112

### Sub-zone A: Open Cave (frames 0090–0107)

**Layer 1 — Ceiling (top ~30%):**
- Dense array of downward-pointing dark green spike/stalactite shapes
- Uniform height, serrated appearance like teeth or a monster's maw
- Black void behind the stalactites

**Layer 2 — Void (mid ~30%):**
- Pure black — open cave interior

**Layer 3 — Ground (bottom ~25%):**
- Solid bright green band — thick, vivid green
- Slight texture suggesting grass or moss

**Ground objects:**
- Bright blue/cyan horizontal wavy line running just above the green ground (river/magic boundary)
- Magenta vertical columns rising from the green ground

**Background objects:**
- Small palm tree silhouettes (frame 0090, left side)
- Grey dead/gnarled tree (twisted bare branches)

### Sub-zone B: Skull Floor (frames 0107–0112)

Ground transitions from bright green to:
- **Skull field:** White/grey packed skull texture — hundreds of skull shapes densely arranged, covering the entire lower portion of the play area

Ceiling additions:
- Yellow flowering vine shapes hanging alongside the green stalactites

Additional foreground:
- Stone arch/doorway (grey stonework, gothic arch) visible at right edge — the exit

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background/void | Black |
| Stalactite ceiling | Green (bright) |
| Ground (sub-A) | Green (bright) |
| Blue accent line | Cyan (bright) |
| Magenta columns | Magenta (bright) |
| Skull floor (sub-B) | White |
| Yellow vine flowers | Yellow (bright) |
| Stone arch | White/Grey |

---

## SCREEN 14 — LEVEL 3 BACKGROUND: "THE DARK TEMPLE"

**Type:** Scrolling gameplay background (tile-based)
**Origin:** ORIGINAL
**Frames:** 0114–0135

### Visual Description

**Layer 1 — Upper background (top ~40%):**
- Light grey / off-white fill — heavy overcast sky or crumbling plaster wall interior
- Fine texture suggesting clouds or plaster grain

**Layer 2 — Cyan ceiling detail (top edge ~5%):**
- Jagged cyan/turquoise shapes along the very top — could be stormy clouds visible through ceiling holes, or decorative stonework in cyan

**Layer 3 — Floor (bottom ~20%):**
- Bright yellow-gold tile — a distinctive cobbled/flagstone floor
- Diagonal tile pattern rendered in yellow (bright) on black grid lines
- This is the most distinctive visual marker of Level 3

**Architecture objects (appearing at scroll positions):**
1. **Gothic arcade arch gate** (frames 0122–0123): Decorative archway with repeating stonework pattern ("DRESCU" or similar text/ornament at top) — thin grey columns support the arch. Very elaborate.
2. **Cylindrical stone columns/pillars** (frames 0114, 0125, 0134): Tall thin columns rising from floor toward ceiling
3. **Gothic windows** (frames 0127–0131): Cross-bar rectangular windows set in the grey stone wall — two cross-bars, gothic proportion
4. **Hanging chain + gibbet** (frames 0131–0133): Iron chain hanging from above with a cage or gibbet contraption
5. **Dead bare trees** (frames 0127–0130): Black gnarled bare tree shapes inside the hall
6. **Brazier/fire cauldron on stand** (frames 0127–0130): Decorative fire holder with white/yellow flame
7. **Shield/crest on wall** (frames 0114–0116): Rectangular heraldic element on the stone wall

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Upper background | White (on black = grey texture) |
| Cyan ceiling accent | Cyan (bright) |
| Stone walls | White/Grey |
| Floor tiles | Yellow (bright) |
| Columns | White/Grey |
| Gothic windows | White/Grey (bars) |
| Dead trees | Black/Grey |
| Brazier stand | White/Grey |
| Brazier flame | Yellow/White |
| Chain/gibbet | White/Grey |

---

## SCREEN 15 — LEVEL 3B BACKGROUND: "SKULL PLAINS"

**Type:** Scrolling gameplay background (tile-based)
**Origin:** ORIGINAL
**Frames:** 0136–0164

### Visual Description

**Layer 1 — Sky (top ~35%):**
- Pure black

**Layer 2 — Mountains (mid ~25%):**
- White/grey stipple mountain range — 3–5 distinct jagged peaks
- Rendered in fine white pixel stipple/dithering suggesting snow or moonlight
- Mountain silhouettes are reflected below in a thin watery strip

**Layer 3 — Water/lake (thin strip ~5%):**
- Pale white/grey horizontal strip — a reflective lake or river between the mountains and the skull field

**Layer 4 — Skull ground (bottom ~25%):**
- Identical texture to Level 2's skull floor sub-zone
- White/grey packed skull shapes, densely arranged
- The field is wider/deeper than Level 2's skull section

**Unique foreground objects:**
- Small stone post/marker (frames 0139–0145): A short single stone pillar, about 16×24 pixels
- Long stepped staircase (frames 0145–0164): Ancient diagonal staircase extending to the right and upward — multi-step stone structure in grey/white. This is the most distinctive element of the zone.

### Colour Palette
This level is effectively **monochrome** (black and white/grey):

| Element | ZX Colour |
|---------|-----------|
| Sky | Black |
| Mountains | White (stippled on black) |
| Water strip | White/Grey |
| Skull ground | White (on black = grey) |
| Stone post | White/Grey |
| Staircase | White/Grey |
| Player | White/Grey |
| All enemies | White/Grey |
| Status bar only | Green (bright) + Magenta |

---

## SCREEN 16 — LEVEL 4 BACKGROUND: "THE BRIDGE"

**Type:** Scrolling gameplay background + platform (tile-based)
**Origin:** ORIGINAL
**Frames:** 0165–0188

### Visual Description

**Layer 1 — Sky (upper ~55%):**
- Pure black — night sky
- No stars, no additional detail

**Static element — Moon (upper right, ~15% of screen):**
- White/grey circle (full moon)
- Surrounded by cloud wisps — small grey cloud shapes to the left and below the moon
- Static — does not scroll
- The health bar is displayed adjacent to the moon (upper right)

**Bridge structure (lower ~30%):**
- **Top surface:** Magenta/pink stone — regular carved pattern with face/skull motifs visible in each tile (the bridge surface tiles appear to have a decorative skull or gargoyle face repeated across them)
- **Arches:** Three or more semicircular arches visible below the bridge roadway — magenta/pink stone arches with dark void through them
- **Pillars:** Pink/magenta stone pillars supporting the arches, rising from the water below
- As the bridge progresses (scrolling right), stone sections start dripping — magenta stone drips hang from the edges, increasing in number toward the end
- Gaps appear between bridge sections — open air with the river visible below

**River (bottom ~10%):**
- Bright cyan flat water — two or three pixel rows of solid cyan forming the river
- Slight ripple texture visible

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky | Black |
| Moon | White/Grey |
| Moon clouds | Grey/White |
| Bridge stone | Magenta (bright) |
| Bridge arches | Magenta (bright) |
| Bridge drips | Magenta (bright) |
| River | Cyan (bright) |
| Health bar: full | Green (bright) |
| Health bar: medium | Cyan (bright) |
| Health bar: critical | Yellow (bright) |
| Player | White/Grey |

---

## SCREEN 17 — LEVEL 4 INTRO MESSAGE: "CORRE O MUERE!"

**Type:** In-game interstitial screen
**Origin:** ORIGINAL
**Frames:** 0165

### Visual Description
- Black background — full screen
- Moon in upper right (same as Level 4 background)
- Bridge visible in lower portion (same as Level 4 background) — the game engine is running, just the player hasn't spawned yet
- Centre-screen text in **cyan**:
  `Corre o Muere!`
  (standard ZX system font, lowercase)
- No health bar displayed yet
- No status bar visible in this frame? (or status bar is below the visible video capture area)

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Text | Cyan (bright) |
| Moon | White/Grey |
| Bridge | Magenta (bright) |
| River | Cyan (bright) |

---

## SCREEN 18 — END SCREEN ILLUSTRATION

**Type:** Full-screen static illustration
**Origin:** THIRD PARTY (not original to .sna files)
**Frames:** 0188/0189–0209 (static, held ~1 min 40 sec)

### Visual Description
A full 256×192 pixel colour illustration in a painterly style:

- **Background:** Deep blue — with black bare tree branch silhouettes filling the background (dead winter forest canopy pattern, extending from edges inward)
- **Central figure:** Large robed figure, centred slightly left — Death/Grim Reaper aesthetic:
  - White/grey voluminous robes, spread wide like a cape or shroud
  - Hooded — head bowed forward, face partially obscured
  - **Open chest cavity:** The torso area of the robes is open, revealing a bright **red/orange flame** (fire heart motif) — the only pure red element in the image
  - The figure fills approximately the left 60% of the screen height
- **Staff:** A tall dark staff topped with a **grey skull** — held on the figure's left side (screen right of centre)
- **White dove/bird:** A small white bird near the figure's lower robes/base
- **Yellow flower:** A small yellow flower near the bird
- **Computer:** Lower right area — a grey home computer of the 1980s-90s era: a keyboard unit and a monitor displaying the letters `CA` on screen. The monitor is rendered in grey/white line art style.
- **Signature:** Lower right corner — stylised artist signature: **"S.D.imedrol"** (or similar) in small white text

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Blue (bright) |
| Tree branches | Black |
| Robes | White/Grey |
| Flame heart | Red (bright) + Yellow |
| Staff/skull topper | White/Grey |
| Bird | White |
| Flower | Yellow (bright) |
| Computer | White/Grey |
| Computer screen text | White/Grey |

### Notes
- This screen is confirmed **THIRD PARTY** by:
  1. Artist signature ("S.D.imedrol") — not credited in the original game
  2. The computer reference is anachronistic and out of character for the game's fantasy setting
  3. Style is a full-screen painting, not ZX attribute-constrained gameplay art
  4. Not present in any of the .sna snapshot files (dark1/2/3)
- This screen should NOT be used in the 128K reconstruction as an ending screen
- The game's original ending (if it existed) is unknown — likely would have been a victory cutscene showing the hero recovering the book and defeating Kamuir

---

## SCREEN 19 — STATUS BAR (Permanent HUD Element)

**Type:** Fixed-position HUD, redrawn every frame
**Origin:** ORIGINAL
**Frames:** Visible in all gameplay frames (0078–0188)

### Visual Description
The status bar occupies the bottom 4 character rows (32 pixels) of the 192-pixel screen.

**Left-to-right composition:**
1. **Skull icon** (far left corner): White skull on black/green — decorative corner element
2. **Demon face tile** (left): Grotesque monster/demon face in white on green. Round head, angry or pained expression, multiple "eyes" or decorative elements. This tile appears to change state during gameplay (represents lives or status).
3. **Green vine body** (left centre): Snake/vine pattern in bright green — the vine writhes across the panel; small magenta/red elements (possibly toads, lizards, or flowers) visible within the vine section
4. **Book icon** (centre): Small square white/grey icon representing the book artifact — the game's MacGuffin. In the darkened version (dark2_transicion) it appears as a narrow green bar indicating energy.
5. **Green vine body** (right centre): Mirror of left section
6. **Demon face tile** (right): Mirror of left demon face tile
7. **Skull icon** (far right corner): Mirror of left skull

**Energy/health indicator:**
- A horizontal green bar element is visible within the status bar area (in the transition screen, it appears as a thin sliver)

### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background | Black |
| Vine/snake | Green (bright) |
| Demon faces | White (on Green) |
| Skull corners | White (on Black) |
| Inner panel accent | Magenta (bright) |
| Book icon | White/Grey |
| Red decorative elements | Red (bright) |

---

## SUMMARY TABLE — All Screens

| # | Screen Name | Origin | Key Colours |
|---|-------------|--------|-------------|
| 01 | Title Screen | Original | Black, White, Green |
| 02 | Main Menu | Original | Black, White, Red, Yellow, Green, Cyan, Magenta |
| 03 | Video Launcher Menu | Third Party | Black, Red, Blue, White |
| 04 | "ENTER" Transition | Original | Black, Yellow, Cyan, Green |
| 05 | Intro Credits (Film Strip) | Original | Black, White, Yellow, Cyan |
| 06 | Cutscene 1: The Mentor | Original | Black, White (monochrome) |
| 07 | Cutscene 2: The Apocalypse | Original | Magenta, Yellow, Cyan, White |
| 08 | Cutscene 3: Kamuir | Original | Red, Yellow, Cyan, Blue, Green |
| 09 | Cutscene 4: Paradise Lost | Original | Cyan, Green, Magenta, Yellow, Black |
| 10 | Level 1 Instruction Screen | Original | Green, Magenta, Cyan, Yellow, White |
| 11 | (same as 04) | Original | — |
| 12 | Level 1: The Wasteland | Original | Black, Yellow, Green, Grey, Magenta, Red |
| 13 | Level 2: The Cave | Original | Black, Green, Magenta, Cyan, Yellow, White |
| 14 | Level 3: The Dark Temple | Original | Grey/White, Cyan, Yellow, Black |
| 15 | Level 3B: Skull Plains | Original | Black, White/Grey (monochrome) |
| 16 | Level 4: The Bridge | Original | Black, Magenta, Cyan, White |
| 17 | Level 4 Intro: "Corre o Muere!" | Original | Black, Cyan, Magenta, White |
| 18 | End Screen Illustration | Third Party | Blue, White, Red, Grey, Yellow |
| 19 | Status Bar HUD | Original | Black, Green, Magenta, White, Red |

---

*Document created 2026-04-25 from direct visual analysis of 209 video frames and 7 original .sna capture screenshots.*
*All frame numbers refer to frames extracted at 1 frame per 5 seconds from the gameplay video.*
