# SAGA DARK — Complete Game Flow Document
## ZX Spectrum 48K | Triton Software | 1990
### Reference for 128K Reconstruction Project

---

## 1. COMPLETE GAME FLOW (ASCII DIAGRAM)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        POWER ON / LOAD                              │
└─────────────────────────────┬───────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  TITLE SCREEN (snap1_titulo.png)                                    │
│  "SAGA" (green) + "DarK" (white pixel logo, skull-in-letter style)  │
│  Black background. Text bottom: "PULSE UNA TEC[LA]"                 │
│  [Press any key]                                                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ any key
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  MAIN MENU (dark1_menu.png / snap2_menu.png)                        │
│  Title: "SAGA--DARK" (white, ZX system font, centered)              │
│  0 ...... EMPEZAR        (red)                                      │
│  1 ...... TECLADO        (yellow)                                   │
│  2 ...... KEMPSTON       (green)                                    │
│  3 ...... SINCLAIR       (cyan)                                     │
│  4 .... REDEFINIR        (magenta)                                  │
│                                                                     │
│  Credits block (green/yellow/red):                                  │
│    PROGRAMA                                                         │
│    MIGUEL ANGEL ESTEVE MARCO                                        │
│    GRAFICOS                                                         │
│    ANTONIO JUAN HERNANDEZ CUELLAR                                   │
│    © COPYRIGHT TRITON SOFTWARE 1990                                 │
│                                                                     │
│  Status bar visible at bottom (permanent throughout game)           │
└──────┬────────────────────┬───────────────────────────────────────┬─┘
       │ 0 (EMPEZAR)        │ 1/2/3 (control config)                │ 4 (redefine keys)
       │                    │ [loops back to menu]                  │ [loops back]
       ▼                    └───────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────────────┐
│  NOTE: The video recording uses a DIFFERENT launcher menu           │
│  (frames 0001–0019) with options:                                   │
│    1. START INTRO                                                   │
│    2. START GAME                                                    │
│    3. INFINITE ENERGY                                               │
│  Red gothic title "SAGA DARK", blue abstract logo (tribal eye/      │
│  shield shape). This menu is NOT from the .sna originals —         │
│  it is added by the video uploader / third party.                  │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ START INTRO
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  INTRO CREDITS SEQUENCE (frames 0021–0039)                          │
│  Black screen, cyan text:                                           │
│    "ESTAS SON LAS PERSONAS"                                         │
│    "QUE HAN HECHO POSIBLE QUE"                                      │
│    "PUEDAS PASAR UN BUEN RATO"                                      │
│  Then film-strip graphic appears (black/white):                     │
│    Three portrait panels in film-strip border                       │
│    Text: "IGOR TRIVALDO: MAPEADO"  (yellow)                        │
│    Blue pixel character sprite next to text                         │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto-advance
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  CUTSCENE 1 — "THE MENTOR" (frame 0040)                             │
│  Black-and-white detailed illustration (full screen art, ~3/4 up)  │
│  Scene: Cave interior. Old robed warrior (right) with staff,        │
│  young muscular hero (left), campfire between them, skull on wall   │
│  Text (white on black, below illustration):                         │
│  "HIJO MIO... HAN SIDO LARGOS ANOS DE DURO ENTRENAMIENTO,          │
│   AHORA ESCUCHA LA HISTORIA QUE VOY A NARRARTE,                    │
│   LUEGO, DE TI DEPENDERA"                                          │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto-advance
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  CUTSCENE 2 — "THE APOCALYPSE" (frame 0050)                         │
│  Full-colour ZX Spectrum illustration                               │
│  Scene: Devastated city — magenta/purple ruins, yellow ground,      │
│  orange fire plumes, mechanical spider-shapes, skeletal remains,    │
│  newspaper "TURBO ARIN" or similar                                  │
│  Text (white on black, below):                                      │
│  "SOLO UNOS POCOS SOBREVIVIERON,"                                   │
│  "AQUELLOS ELEGIDOS EMPRENDIERON"                                   │
│  "UNA D[IFICIL MISION]..."                                          │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto-advance
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  CUTSCENE 3 — "KAMUIR" (frame 0060)                                 │
│  Full-colour illustration: red background, cyan lightning bursts    │
│  Central figure: KAMUIR — tall warrior, flame/feathered headdress  │
│  (blue/purple/white), yellow-toned muscular torso, dark green       │
│  armoured skirt, outstretched arms, menacing pose                   │
│  Flanked by strange creatures on volcanic landscape                 │
│  Text (white on black, below):                                      │
│  "KAMUIR, EL SEGUNDO -DARK-, NO SE"                                 │
│  "HIZO ESPERAR, TRAS LA MUERTE DE"                                  │
│  "SU PADRE SAQUEO NUESTR[A TIERRA]"                                 │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto-advance
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  CUTSCENE 4 — "PARADISE LOST" (frame 0070)                          │
│  Full-colour illustration: cyan sky, turquoise sea/lake,            │
│  yellow/orange sun-blasted mountains (top left), green jungle,      │
│  lush magenta/green tropical plants (foreground),                   │
│  dark silhouette of hero walking through paradise                   │
│  Text (white on black, below):                                      │
│  "POR SEGUNDA VEZ DESTRUYO TODO"                                    │
│  "AQUELLO POR LO QUE YO HABIA"                                      │
│  "LUCHADO, MI FAMILIA Y MI LIBRO"                                   │
│  "DEL CUAL SE APODERO"                                              │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto-advance
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  PRE-LEVEL 1 DEMO / IN-ENGINE INTRO (frames 0078–0079)              │
│  Uses actual Level 1 game engine and assets                         │
│  Frame 0078: Dinosaur (left), hero (centre), boulder (right),       │
│              green palm tree (far right), yellow mountains bg       │
│  Frame 0079: Hero beside magenta totem column and green             │
│              carnivorous plant, mountain background with clouds     │
│  This appears to be an attract-mode demo or in-engine cutscene     │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ key press / auto
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 1 INTRO SCREEN (dark3_nivel1_intro.png / snap4_nivel1_intro) │
│  SPLIT SCREEN:                                                      │
│  Top ~60%: Level 1 game-engine view                                 │
│    - Hero kneeling with spear, inside cave/grotto                   │
│    - Giant green maw/mouth of cave ceiling with teeth (top)         │
│    - Red totem shapes upper-left, grey mountain silhouette bg       │
│    - Bright green stalagmite/column zone, cyan water strip,         │
│      magenta/yellow layered floor platform                          │
│  Bottom ~30%: White-bordered text box (black bg):                   │
│    "¡Cuidado valiente guerrero! Un                                  │
│     gran peligro se cierne sobre                                    │
│     ti. Utiliza las teclas "R-T"                                    │
│     para correr e "Y" para saltar.                                  │
│     (PULSA ENTER PARA EMPEZAR)"                                     │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ ENTER
                              ▼
═══════════════════════════════════════════════════════════════════════
                          BLACK SCREEN
                      (loading transition)
═══════════════════════════════════════════════════════════════════════
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 1 — "THE WASTELAND" (frames 0081–0088/0112)                  │
│  [Horizontally scrolling, left to right]                            │
│  [See Section 4 for detailed visual description]                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ player reaches end (red zone)
                              ▼
═══════════════════════════════════════════════════════════════════════
                          BLACK SCREEN
                      (loading transition)
═══════════════════════════════════════════════════════════════════════
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 2 — "THE CAVE / GREEN HELL" (frames 0090–0112)               │
│  [Horizontally scrolling, left to right]                            │
│  Sub-zones: Open cave → Skull-floor cave                            │
│  [See Section 4 for detailed visual description]                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ through stone arch exit
                              ▼
═══════════════════════════════════════════════════════════════════════
                          BLACK SCREEN
                      (loading transition)
═══════════════════════════════════════════════════════════════════════
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 3 — "THE DARK TEMPLE" (frames 0114–0135)                     │
│  [Horizontally scrolling, left to right]                            │
│  Sub-zones: Temple entrance → Interior nave → Inner sanctum         │
│  [See Section 4 for detailed visual description]                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ temple ends, open landscape visible
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 3B — "SKULL PLAINS / MOUNTAIN PASS" (frames 0136–0164)       │
│  [Horizontally scrolling, left to right]                            │
│  Visually distinct from Level 3 — may be a separate loaded segment │
│  [See Section 4 for detailed visual description]                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ staircase section ends
                              ▼
═══════════════════════════════════════════════════════════════════════
                          BLACK SCREEN
                      (loading transition)
═══════════════════════════════════════════════════════════════════════
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 4 INTRO MESSAGE (frame 0165)                                 │
│  Black background + moon (upper right)                              │
│  Bridge visible below (magenta, arches, cyan water)                 │
│  Text centre-screen (cyan):  "Corre o Muere!"                       │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ auto / key
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  LEVEL 4 — "THE BRIDGE / RIO DE LAS ALMAS" (frames 0166–0188)       │
│  [Horizontally scrolling, left to right — platformer]               │
│  UNIQUE: Health bar visible (upper right)                           │
│  [See Section 4 for detailed visual description]                    │
└─────────────────────────────┬───────────────────────────────────────┘
                              │ player falls / reaches end
                              ▼
═══════════════════════════════════════════════════════════════════════
                       ** GAME INCOMPLETE **
               Expected: LEVEL 5 — KAMUIR'S FORTRESS
               Expected: FINAL BOSS ENCOUNTER
               Expected: VICTORY CUTSCENE
                     (none present in video)
═══════════════════════════════════════════════════════════════════════
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  END SCREEN / CREDITS ILLUSTRATION (frames 0189–0209)               │
│  Static full-colour illustration — THIRD PARTY ADDED                │
│  [See Section 6 for detailed description]                           │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 2. STATUS BAR (Permanent HUD — All Levels)

The status bar occupies the bottom ~32 pixels of the screen (last 4 character rows). It does NOT scroll and is redrawn every frame.

### Visual Composition (left to right)
- **Far left:** Grotesque demon/troll face tile in white/green (changes state during gameplay — likely represents lives)
- **Left section:** Green snake/vine body with pattern; small magenta/red decorative elements (toad? flower?)
- **Centre:** Small square/box icon in white/grey — represents the book artifact (the MacGuffin of the story)
- **Right section:** Mirror of left — green vine/snake body, magenta decorations
- **Far right:** Same grotesque demon/troll face tile (mirror of left)
- **Four corners:** White skull icons, one at each corner of the bar

### Colour Breakdown
| Element | ZX Colour |
|---------|-----------|
| Background behind bar | Black |
| Vine/snake/border | Bright Green |
| Demon face tiles | White on Green |
| Inner panel accent | Magenta/Purple |
| Skull corners | White |
| Book icon | White/Grey |
| Red decorative elements | Bright Red |

### Special State (Level 4 Health Bar)
In Level 4 only, an additional HUD element appears in the UPPER RIGHT of the play area (not the status bar):
- Horizontal three-segment bar: **Green** (left, full) | **Cyan** (centre) | **Yellow** (right, low/critical)
- Decreases left-to-right as damage is taken (green disappears first, then cyan, leaving yellow)
- A moon/orb graphic sits to the right of the bar (same moon as the level background)
- This health bar is NOT present in Levels 1–3

---

## 3. PLAYER CHARACTER

**Visual:** Muscular barbarian/warrior, approximately 16×24 pixels
- Rendered in white/grey (monochrome within colour cell — no personal colour)
- Bare torso, loincloth or short armoured kilt
- Runs continuously in direction of scroll (left to right)
- **Weapon:** Spear or blowgun held horizontally at chest level
  - Melee thrust animation (Level 1): arm extends forward with spear
  - Ranged projectile (Levels 2–3): fires small projectile to the right
  - **The weapon appears consistent throughout all levels**

**Controls (from instruction screen):**
- R / T — run (left / right)
- Y — jump
- (Fire button inferred for weapon)

**Jump animation:** Clearly visible in Level 4 bridge sequences (frames 0166–0188). The character leaps upward in an arc. Jump is also present but less prominent in earlier levels.

---

## 4. LEVEL-BY-LEVEL VISUAL DESCRIPTION

---

### LEVEL 1 — "THE WASTELAND"
**Frames:** 0078–0088 (in-engine demo/intro) then main play from ~0081 onward
**Video time:** ~6:40 to ~7:30
**Transitions:** Black screen before; black screen after

#### Background Layers (back to front)
1. **Sky:** Pure black (void — no gradient, no stars)
2. **Mountains:** Yellow/golden jagged silhouette mountain range, mid-screen height; drawn with fine yellow pixel stipple suggesting rocky texture
3. **Tree line:** Dark green (bright green, dimmed) — dense small palm/pine tree silhouettes running below the mountains
4. **Clouds:** White fluffy cloud formations in the black sky area (appear sporadically)
5. **Ground:** Flat grey plane — light grey, dusty, with pebble/rubble texture — scattered small round rocks, debris

#### Foreground/Interactive Elements
- **Magenta/pink totem columns:** Tall vertical columns (approx. 16px wide × 80px tall), decorated with carved face/symbol patterns. Appear frequently as landmarks. Bright magenta / ink black pattern.
- **Carnivorous plant:** Large green fan-shaped carnivorous plant (approx. 32×48px). Bright green. Stationary.
- **Boulders/skull-rocks:** Grey rounded boulder shapes on the ground.
- **Ruins silhouette:** Small castle/tower silhouette in the far background (frame 0081), drawn in yellow/dark tone against mountain band.

#### Red Zone Sub-area (frames 0084–0088)
Near the end of Level 1, a large bright **red** block fills the right portion of the screen:
- Grey cliff/rock wall on the left side of the transition
- Red fill on the right — appears to be a cave interior (lava? hell-zone entry?)
- On the mountain above the red zone: a large frog/toad creature visible as a silhouette
- A large white amorphous blob creature is visible at ground level near the red zone
- This serves as the visual transition/end marker for Level 1

#### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky | Black |
| Mountains | Bright Yellow |
| Tree line | Green (bright) |
| Ground | White (on black attr) = grey |
| Totem columns | Magenta (bright) |
| Carnivorous plant | Green (bright) |
| Red cave zone | Red (bright) |
| Clouds | White |
| Player | White/grey |

#### Enemies — Level 1
See Enemy Catalog (Section 5).

---

### LEVEL 2 — "THE CAVE / GREEN HELL"
**Frames:** ~0090–0112
**Video time:** ~7:30 to ~9:20
**Transitions:** Black screen before; direct continuation to Level 2B (skull floor)

This level is a cave/underground setting.

#### Background Layers
1. **Ceiling/upper area:** Pure black background
2. **Stalactites:** Dense row of dark green downward-pointing spike shapes (like teeth), uniform height, running the full width at the top of the play area
3. **Cave walls:** Black flanks
4. **Ground:** Bright solid green — a thick band of vivid green covering the lower quarter of the play area

#### Foreground/Interactive Elements
- **Magenta columns:** Tall magenta vertical shafts rising from the green ground — same family as Level 1 totem columns
- **Dead/gnarled tree:** Grey-white dead tree with twisted bare branches (approx. centre-right of some screens)
- **Small palm silhouettes:** At far left of entry frames
- **Blue wavy accent line:** A thin horizontal blue/cyan wavy line runs just above the green ground — a river, mist, or magical boundary

#### Sub-zone 2B: Skull Floor (frames ~0107–0112)
The bright green floor transitions to a **field of packed skulls**:
- Grey/white texture composed of hundreds of individual skull shapes densely packed
- The stalactite ceiling continues but changes: adds yellow flowering vine shapes hanging alongside the green stalactites
- An additional magenta vertical column (same type) still present
- **Stone arch/doorway** appears at the right side (grey stonework arch) — this is the exit to the next level

#### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Background/sky | Black |
| Stalactites | Green (bright) |
| Ground (sub-zone A) | Green (bright) |
| Skull floor (sub-zone B) | White/grey |
| Magenta columns | Magenta (bright) |
| Blue accent line | Cyan |
| Yellow vine flowers | Yellow (bright) |
| Stone arch | White/grey |
| Player | White/grey |

#### Enemies — Level 2
See Enemy Catalog (Section 5).

---

### LEVEL 3 — "THE DARK TEMPLE"
**Frames:** ~0114–0135
**Video time:** ~9:30 to ~11:20
**Transitions:** Black screen before; direct scroll into Level 3B (Skull Plains)

This is the richest level visually — an interior castle/temple.

#### Background Layers
1. **Upper background:** Light grey/white — overcast sky or crumbling plaster wall
2. **Ceiling detail:** Bright cyan jagged cloud/crack formations along the very top edge of the play area
3. **Walls:** Grey stone texture with visible cracks
4. **Floor:** Bright yellow-gold tile — a broad cobbled/flagstone floor rendered in vivid yellow, distinctive diagonal tile pattern

#### Foreground/Interactive Elements (appearing left to right through the level)
- **Decorated stone arch gate:** Ornate gothic arcade arch with repeating decorative elements ("DRESCU" pattern text or decorative stonework) across the top, thin grey columns (frames 0122–0123)
- **Stone cylindrical columns/pillars:** Tall thin columns, multiple visible simultaneously (frames 0125, 0134–0135)
- **Gothic windows:** Cross-bar rectangular gothic windows set into the grey walls (frames 0127–0131)
- **Hanging chain with gibbet/cage:** Iron chain with a suspended cage or hanging element (frame 0131–0133)
- **Dead trees:** Bare, black, gnarled tree shapes inside the hall (frames 0127–0130)
- **Brazier/fire cauldron:** Decorative brazier on a stand with flame rendered in white/yellow (frames 0127–0130)
- **Triangular pyramid/altar:** A small pyramid shape on the floor (frames 0122–0123)
- **Shield/crest on wall:** Rectangular decorative element on the stone wall (frame 0114–0116)
- **Mountain peaks** visible through windows or far background (frames 0134–0136 — transition to Level 3B)

#### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Upper background | White/Light Grey |
| Cyan cloud/cracks | Cyan (bright) |
| Stone walls | White (on grey attr) |
| Floor tiles | Yellow (bright) |
| Columns/pillars | White/Grey |
| Dead trees | Black/Grey |
| Brazier flames | Yellow/White |
| Player | White/grey |
| Enemies | White/grey (monochrome) |

#### Enemies — Level 3
See Enemy Catalog (Section 5).

---

### LEVEL 3B — "SKULL PLAINS / MOUNTAIN PASS"
**Frames:** 0136–0164
**Video time:** ~11:20 to ~13:40
**Note:** This section may be a second half of Level 3 (same loaded segment) or a separate small segment. Visually it is completely distinct.

#### Background Layers
1. **Sky:** Pure black
2. **Mountains:** White/grey stipple-drawn mountain range — 3–5 jagged peaks, reflected/mirrored below in a thin water/lake line
3. **Water/lake:** Thin reflective horizontal strip between mountains and skull ground
4. **Ground:** Entirely composed of packed skulls — dense white/grey skull field, identical texture to Level 2's sub-zone B

#### Foreground/Interactive Elements
- **Small stone post/pillar:** A short stone marker post in the centre-left of early frames (frames 0139–0145) — possibly a milestone
- **Long staircase structure:** An ancient stepped structure (ruins of a staircase or aqueduct) extending diagonally to the right, starting low and rising, in the right-centre and far right of the zone (frames 0145–0164). Grey/white stone.

#### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky | Black |
| Mountains | White (on black = grey stipple) |
| Water strip | White/grey |
| Skull ground | White/grey |
| Stone post/staircase | White/grey |
| Player | White/grey |
| Enemies | White/grey |
| Status bar (only colour) | Green (bright) + Magenta |

This is effectively a **monochrome level** — almost entirely black and white/grey, with only the status bar providing colour.

#### Enemies — Level 3B
See Enemy Catalog (Section 5).

---

### LEVEL 4 — "THE BRIDGE / CORRE O MUERE"
**Frames:** 0165–0188
**Video time:** ~13:45 to ~15:40
**Transitions:** Black screen before; end screen immediately after

#### Intro Message (frame 0165)
Before gameplay begins, a title card appears:
- Black background
- Moon (upper right, same as gameplay)
- Bridge visible in lower portion (magenta stone, arched, cyan water below)
- Centre-screen text in cyan: **"Corre o Muere!"**
- No health bar shown yet (it appears with gameplay)

#### Background Layers
1. **Sky:** Pure black (night)
2. **Moon:** White/grey sphere with cloud wisps, upper right quadrant, static throughout the level
3. **Bridge:** Magenta/pink stone bridge — regular arched structure with decorative carved stone pattern on the roadway surface. Arches visible below (pink pillars, pink arch curves).
4. **River:** Bright cyan "water" — flat horizontal bands of cyan below the bridge. Ripple texture visible.

#### Bridge Condition (progressing left to right)
- **Section 1 (frames 0166–0174):** Bridge is mostly intact. Regular arched spans. Player runs across.
- **Section 2 (frames 0175–0185):** Bridge becomes progressively damaged. Magenta stone DRIPS hanging from edges of bridge sections (like melting or crumbling stone). Gaps appear — player must jump across.
- **Section 3 (frames 0185–0188):** Bridge is severely broken — mostly detached vertical pillars/stalks remaining, wide gaps, player is airborne/jumping.

#### Colour Palette
| Element | ZX Colour |
|---------|-----------|
| Sky | Black |
| Moon | White/Grey |
| Bridge stone | Magenta (bright) |
| Bridge arches | Magenta (bright) |
| River water | Cyan (bright) |
| Health bar: full | Green (bright) |
| Health bar: half | Cyan (bright) |
| Health bar: critical | Yellow (bright) |
| Player | White/grey |

#### Enemies — Level 4
None observed. The level is a pure platforming/survival challenge. The bridge gaps and the river (instant death) are the only hazards.

---

## 5. ENEMY CATALOG

### Enemy 01 — DINOSAUR / PREHISTORIC LIZARD
- **Level:** 1 (Wasteland) — in-engine demo (frame 0078) and possibly early Level 1
- **Visual:** Large quadruped lizard/dinosaur creature, approx. 48×32 pixels. White/grey monochrome rendering. Round head, stocky body, short legs, thick tail. Somewhat comical proportions.
- **Behaviour:** Walks toward the player at ground level. Appears to patrol or pace.
- **Size class:** Large

### Enemy 02 — LARGE CARNIVOROUS PLANT
- **Level:** 1 (Wasteland) — frames 0079, visible in Level 1
- **Visual:** Tall green fan/frond-shaped plant, approximately 32×48 pixels. Bright green. Stationary decorative hazard more than an active enemy.
- **Behaviour:** Stationary. Player must navigate around or attack it.
- **Size class:** Large, stationary

### Enemy 03 — FROG / TOAD CREATURE
- **Level:** 1 (Wasteland red zone) — visible as silhouette on mountain tops frames 0084, 0087
- **Visual:** Squat round-bodied frog creature sitting atop the mountain background. Grey/white monochrome. Relatively large. Appears to be a background element or descending hazard.
- **Behaviour:** Unclear — may jump down or act as a background element.
- **Size class:** Large

### Enemy 04 — WHITE AMORPHOUS BLOB
- **Level:** 1 (Wasteland, red zone transition) — frames 0086–0087
- **Visual:** A large white/grey amorphous blob creature with a face. Fills significant screen space (approx. 48×48). Could also be interpreted as a troll or cave creature crouching.
- **Behaviour:** Appears at ground level in the red zone at the Level 1 end. Specific behaviour unclear.
- **Size class:** Large

### Enemy 05 — GIANT INSECTOID / MANTIS-CEPHALOPOD (Level 2 Mini-Boss)
- **Level:** 2 (Cave) — frames 0092–0100
- **Visual:** A large grey creature with a round head (like a mantis shrimp or alien), segmented green/grey body and a long tail or tentacle trailing behind. Approximately 48×48 pixels. A distinct boss-tier creature.
- **Behaviour:** Occupies the right side of the screen. Multiple frames show sustained combat with it — this appears to be a mid-level mini-boss or major encounter.
- **Size class:** Very large (boss-tier)

### Enemy 06 — SMALL FROG / HOP CREATURE
- **Level:** 2 (Cave) — frames 0093–0094
- **Visual:** Small green creature, approximately 16×16 pixels. Appears alongside the Level 2 mini-boss.
- **Behaviour:** Hops/jumps. Possibly spawned by the larger creature.
- **Size class:** Small

### Enemy 07 — CRAB / BOULDER-FACE CREATURE
- **Level:** 2 (Cave, transition to skull floor) — frame 0105
- **Visual:** A large rounded grey boulder-shaped creature with a prominent beak-like face. Approximately 48×32 pixels. White/grey monochrome.
- **Behaviour:** Appears at the transition zone. Occupies much of the screen height.
- **Size class:** Large

### Enemy 08 — SKELETON WARRIOR
- **Level:** 2 (Cave, skull floor sub-zone) — frames 0109, 0111; Level 3 — frames 0127–0128; Level 3B (frame 0155, 0163)
- **Visual:** Upright humanoid skeleton figure with visible rib cage, limb bones. Approximately 24×40 pixels. White/grey. Carries a weapon or has arms raised.
- **Behaviour:** Walks toward the player. Standard patrol enemy.
- **Size class:** Medium
- **Note:** Appears in multiple levels — this is a recurring enemy type

### Enemy 09 — GIANT TROLL / MUSCULAR MONSTER (Level 3 Major Enemy)
- **Level:** 3 (Dark Temple) — frames 0117–0122
- **Visual:** A massive creature filling most of the screen height (approximately 64×128 pixels equivalent). Large round head with prominent features (horns, wide mouth). Muscular body. Holds head/face in both hands in one pose (distressed or attacking). White/grey monochrome.
- **Behaviour:** Multiple animation poses visible — walking, crouching, attacking. Very large screen presence. Appears to be a major encounter.
- **Size class:** Very large (boss-tier)

### Enemy 10 — ARMOURED KNIGHT
- **Level:** 3 (Dark Temple) — frame 0122
- **Visual:** A fully armoured medieval knight figure. Angular solid armour plates. White/grey monochrome rendering. Approximately 24×40 pixels. The player is actively fighting it in frame 0122.
- **Behaviour:** Combat-oriented melee enemy. Walks toward player.
- **Size class:** Medium

### Enemy 11 — WINGED DEMON / GARGOYLE
- **Level:** 3 (Dark Temple) — frame 0124
- **Visual:** A large creature with spread wings — horned head, broad wingspan, bat-like or dragon-like form. Fills most of the screen's upper play area. White/grey monochrome. Very detailed pixel art.
- **Behaviour:** Flying — appears at height above the yellow floor. The player must attack upward or wait for it to descend.
- **Size class:** Very large (boss-tier)

### Enemy 12 — DEMON / IMP WITH RAISED ARMS
- **Level:** 3 (Dark Temple, inner sanctum) — frames 0127–0130
- **Visual:** A horned creature (demon/imp) with both arms raised above its head in a threatening pose. Approximately 24×40 pixels. White/grey. Small horns visible on head.
- **Behaviour:** Walks or dances toward the player. Appears multiple times in the inner sanctum section.
- **Size class:** Medium

### Enemy 13 — WOLF / LARGE DOG
- **Level:** 3 (Dark Temple, inner sanctum) — frames 0129–0130
- **Visual:** A four-legged animal creature, approximately wolf or large dog. White/grey. On the left side of the frame. Low to the ground posture.
- **Behaviour:** Runs toward the player at ground level.
- **Size class:** Medium

### Enemy 14 — CENTIPEDE / CHAIN CREATURE
- **Level:** 3 (Dark Temple, inner sanctum) — frames 0131–0133
- **Visual:** A large segmented creature appearing to hang from chains or a gibbet. Multiple body segments, potentially serpentine. White/grey. Approximately 32×64 pixels.
- **Behaviour:** Hangs in place or swings. Player must pass under or around it.
- **Size class:** Large

### Enemy 15 — LARGE TROLL / CLAWED HUMANOID (Level 3 End-Boss)
- **Level:** 3 (Dark Temple, end) — frames 0131–0135
- **Visual:** A very tall muscular humanoid with a massive body — distinct from Enemy 09 in pose and design. Clawed hands, horned head, approximately 48×96 pixels. White/grey monochrome. Appears in a cage/gibbet contraption frame 0131.
- **Behaviour:** Major encounter near the end of Level 3. Multiple combat frames visible.
- **Size class:** Very large (boss-tier)

### Enemy 16 — GORILLA / YETI / APE CREATURE
- **Level:** 3B (Skull Plains) — frames 0139–0164
- **Visual:** A large white/grey creature with a round head, hunched shoulders, stocky ape-like body. Approximately 48×48 pixels. Monochrome.
- **Behaviour:** The dominant enemy of Level 3B. Chases the player across many frames. Clearly animated with multiple poses. Can JUMP — frame 0150 shows it fully airborne. Very persistent enemy.
- **Size class:** Large

---

## 6. END SCREEN / CREDITS ILLUSTRATION

**Frames:** 0188/0189–0209 (static, held for ~1 min 40 sec)

### Visual Description
A full-screen colour illustration:
- **Background:** Dark blue, filled with bare black tree branch silhouettes (reminiscent of a dead winter forest)
- **Central figure:** A large robed figure in white/grey robes (Death / Grim Reaper aesthetic) — hooded, skeletal face partially visible. The robes are spread wide.
- **Staff:** A tall staff topped with a **skull** on the left side of the figure
- **Open chest:** The figure's chest/torso is open, revealing a bright **red/orange flame** heart — a striking colour contrast against the grey robes
- **Small bird:** A small white bird/dove near the figure's lower robes
- **Yellow flower:** A small yellow flower near the bird
- **Computer:** A home computer (ZX Spectrum-era machine — keyboard, monitor) rendered in grey/white in the lower right corner. The monitor screen shows the letters **"CA"** (likely standing for Computers / Amstrad / or initialism of the creator's signature)
- **Artist signature:** Lower right: **"S.D.imedrol"** or similar stylised signature — the graphic artist's credit

### Assessment
This illustration is THIRD PARTY ADDED (not original to the 1990 .sna release):
- Style differs from in-game artwork (uses full-screen 256×192 as a portrait painting, not ZX attribute-constrained gameplay art)
- References a computer which is out of character for the game's fantasy/post-apocalyptic setting
- The artist signature suggests it was created separately and added to the video recording or a patched version

---

## 7. COMPLETE SPANISH TEXT STRINGS

All text visible across all screens, in order of appearance:

### Title / Menu (Original .sna)
| Screen | Text | Language |
|--------|------|----------|
| Main menu | `SAGA--DARK` | — |
| Main menu | `0 ...... EMPEZAR` | ES: Start |
| Main menu | `1 ...... TECLADO` | ES: Keyboard |
| Main menu | `2 ...... KEMPSTON` | Kempston joystick |
| Main menu | `3 ...... SINCLAIR` | Sinclair joystick |
| Main menu | `4 .... REDEFINIR` | ES: Redefine |
| Main menu | `PROGRAMA` | ES: Program(mer) |
| Main menu | `MIGUEL ANGEL ESTEVE MARCO` | Programmer credit |
| Main menu | `GRAFICOS` | ES: Graphics |
| Main menu | `ANTONIO JUAN HERNANDEZ CUELLAR` | Graphics credit |
| Main menu | `© COPYRIGHT TRITON SOFTWARE 1990` | Copyright |
| Title screen | `PULSE UNA TEC[LA]` | ES: Press any key |

### Third-Party Added Menu (video launcher)
| Screen | Text |
|--------|------|
| Video menu | `SAGA DARK` |
| Video menu | `1. START INTRO` |
| Video menu | `2. START GAME` |
| Video menu | `3. INFINITE ENERGY` |

### Intro Credits (Original)
| Screen | Text |
|--------|------|
| Intro credits | `ESTAS SON LAS PERSONAS` |
| Intro credits | `QUE HAN HECHO POSIBLE QUE` |
| Intro credits | `PUEDAS PASAR UN BUEN RATO` |
| Intro credits (film strip) | `IGOR TRIVALDO: MAPEADO` |

### Cutscene 1 (Original)
```
HIJO MIO... HAN SIDO LARGOS ANOS DE DURO ENTRENAMIENTO,
AHORA ESCUCHA LA HISTORIA QUE VOY A NARRARTE,
LUEGO, DE TI DEPENDERA
```

### Cutscene 2 (Original)
```
SOLO UNOS POCOS SOBREVIVIERON,
AQUELLOS ELEGIDOS EMPRENDIERON
UNA D[IFICIL MISION]...
```
*(Text is cut off at right edge of visible area — full text unknown)*

### Cutscene 3 (Original)
```
KAMUIR, EL SEGUNDO -DARK-, NO SE
HIZO ESPERAR, TRAS LA MUERTE DE
SU PADRE SAQUEO NUESTR[A TIERRA]
```
*(Text cut off — full text unknown)*

### Cutscene 4 (Original)
```
POR SEGUNDA VEZ DESTRUYO TODO
AQUELLO POR LO QUE YO HABIA
LUCHADO, MI FAMILIA Y MI LIBRO
DEL CUAL SE APODERO
```

### Level 1 Intro Screen (Original)
```
¡Cuidado valiente guerrero! Un
gran peligro se cierne sobre
ti. Utiliza las teclas "R-T"
para correr e "Y" para saltar.
(PULSA ENTER PARA EMPEZAR)
```

### Level 4 Intro Message (Original)
```
Corre o Muere!
```

---

## 8. ORIGINALITY ASSESSMENT

| Content | Origin | Evidence |
|---------|--------|----------|
| Main menu (0..EMPEZAR, credits) | ORIGINAL | Present in dark1.sna snapshot |
| Title screen (SAGA DarK logo) | ORIGINAL | Present in dark1.sna snapshot |
| Intro cutscenes 1–4 | ORIGINAL | Consistent with story, present in .sna |
| Intro credits sequence (IGOR TRIVALDO) | ORIGINAL | In-engine, same font/style |
| Level 1 gameplay | ORIGINAL | Present in dark2.sna snapshot |
| Level 2 gameplay | ORIGINAL | Present in dark2/dark3.sna |
| Level 3 gameplay | ORIGINAL | Present in dark3.sna |
| Level 3B (Skull Plains) | ORIGINAL | Seamless continuation |
| Level 4 gameplay | ORIGINAL | Present in dark3.sna |
| "Corre o Muere!" message | ORIGINAL | In-engine, consistent style |
| Status bar (permanent HUD) | ORIGINAL | Present in all .sna snapshots |
| Level 1 intro/instruction screen | ORIGINAL | Same font, Spanish, in-engine |
| Video launcher menu (START INTRO/GAME) | THIRD PARTY | Not in .sna files, different visual style |
| "INFINITE ENERGY" menu option | THIRD PARTY | Cheat feature, absent from .sna |
| End screen illustration (robed figure) | THIRD PARTY | Signed "S.D.imedrol", computer reference |
| Music (if any in video) | THIRD PARTY | Confirmed by user — original has no music |
| Final boss encounter with Kamuir | MISSING | Expected from story but not present |
| Victory cutscene | MISSING | Expected but not present |

---

## 9. GAME MECHANICS SUMMARY

### Core Loop
1. Player moves right across horizontally-scrolling single-plane environment
2. Enemies spawn and walk toward player from the right
3. Player uses spear/blowgun to attack enemies at range or in melee
4. Player reaches right edge of level → black screen transition → next level

### Health / Lives
- Levels 1–3: No visible health bar. Lives represented by demon face tiles in status bar.
- Level 4: Three-segment health bar (green/cyan/yellow) in upper right.
- "INFINITE ENERGY" option on third-party menu confirms finite energy mechanic exists.

### Platforming
- Jump mechanic (key "Y") exists throughout but is only essential in Level 4.
- Level 4 is a dedicated platformer level with gaps, crumbling bridge, instant-death river.

### Scrolling
- Smooth horizontal left-to-right scrolling throughout all levels.
- Status bar is fixed (redrawn separately, does not scroll).

### Transitions
- Level end: Black screen (several seconds) — tape load or bank switch.
- Pre-Level message: Full-screen text/illustration (Level 1 instruction, Level 4 "Corre o Muere!").

---

*Document created 2026-04-25 from direct analysis of 209 gameplay video frames and 7 original .sna capture screenshots.*
*Primary sources: dark1.sna, dark2.sna, dark3.sna (ZX Spectrum snapshots), gameplay video at 1 frame/5 seconds.*
