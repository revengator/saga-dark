; =============================================================================
; SAGA DARK — engine — Symbol layout (state-space)
; -----------------------------------------------------------------------------
; The engine modules reference symbols of the game state-space. Most are also
; defined as labels in the per-phase main.asm (per-phase data block). Two
; addresses (POD4_VAR, ABUELO_OFF) sit inside VAR_PRE and have no named label
; in main.asm — declared here.
;
; Symbol values match the Dark 1 layout (the chosen unified layout for the
; +2 128K platformer remake).
; =============================================================================

; This file holds the Dark 1 default layout. A wrapper for a different
; layout (e.g. Dark 2) must NOT include this file — it should define all
; the symbols inline. (sjasmplus EQU is not redefinable, and IFNDEF is
; evaluated before EQUs are seen by the preprocessor.)
POD4_VAR    EQU 0xA60D    ; (1B) variable used by PODER4/POD44/PODERS in powers.asm
ABUELO_OFF  EQU 0xA612    ; (1B) abuelo deactivation flag (1=after talking)

; --- Tunable balance: starting/respawn/refill energy (NU1) -------------------
; Used by levels/phase1/handlers.asm (PA02) + hooks.asm. Original = 0x60; the
; unified platformer doubles it (0xC0) so the base game lasts ~2x longer (life
; drains ~50% slower), making the INFINITE_ENERGY cheat largely unnecessary.
; Pure immediate/DEFB value -> never shifts layout. This (engine) copy serves the
; standalone dark1 smoke tests that pull engine/defines.inc but not the per-phase
; defines.inc; they don't set UNIFIED_PLATFORMER, so they keep the original 0x60
; (dark1 byte-perfect preserved). main.asm / dark2-engine-v3 get 0xC0 from their
; own per-phase defines.inc. No build includes both files, so no redefinition.
; Hook-mode MUERTE (levels/*/hooks.asm) decrements NU1 ONCE per damage tick
; (every NRG_TICK contact-frames) and ticks MUERE (the energy "face"/bar) on the
; same beat, so the bar draws exactly NRG_FULL segments over a life and empties
; right at death. Survival = NRG_FULL * NRG_TICK contact-frames.
;   NRG_FULL = hits/segments to die (24 = the bar's natural length).
;   NRG_TICK = contact-frames per hit (the survivability knob).
; Platformer: 24*12 = 288 frames, ~3x the original 96 (=24*4) -> base game is
; playable without the INFINITE_ENERGY cheat. Legacy byte-perfect dark1 keeps its
; OWN every-frame MUERTE with NU1=0x60 (no UNIFIED_HOOKS); handlers.asm PA02 there
; must stay 0x60 too. NRG_TICK is unused by the legacy MUERTE (it has a literal).
    IFDEF UNIFIED_HOOKS
NRG_FULL    EQU 0x18
    ELSE
NRG_FULL    EQU 0x60
    ENDIF
    IFDEF UNIFIED_PLATFORMER
NRG_TICK    EQU 0x0C
    ELSE
NRG_TICK    EQU 0x04
    ENDIF

; =============================================================================
; Interface contract
; -----------------------------------------------------------------------------
; The engine references these labels. Per-phase data (main.asm) MUST define
; them. Layout values (Dark 1 — the chosen unified layout):
;
;   Variables (DEFB labels in main.asm):
;     VAR0     0xA633    (12B) current screen + PAN_PAD entries
;     VAR1     0xA614    (1B)  power-up phase
;     VAR2     0xA619    (1B)  copy of VAR1
;     VAR7     0xA616    (1B)  player strength
;     VAR10    0xA613    (1B)  abuelo internal counter
;     VAR13    0xA615    (1B)  abuelo state (0=idle, !=0=active)
;     VAR25    0xA61F    (16B) per-screen "saved" flag array
;     VARB     0xA617    (2B)  power-up counter
;     T0       0xA652    (1B)  sprite queue head
;     E1/E2/E3 0xA84B-D  (1B)  enemy state slots
;     PEDD1    0xA665    pointer table to player step tables
;     TP0      0xA6E8    (22B) abuelo step table (3B × 64 screens)
;
;   Note: hres-printing.asm contains a literal `LD de,0xA6FE` that is
;   byte-identical between Dark 1 and Dark 2 — it is an engine constant,
;   NOT a per-phase pointer. Do not symbol-substitute it.
;
;   Routines (in main.asm):
;     MUERTE   0xA7F1    death handler
;     MUERTE_K 0xA7E3    restore enemy face + lives (PODER2 callback)
;     NUEVO    0xA820    init new screen
;     BICHOS   0xA84E    enemy dispatcher (called from MAIN game loop)
; =============================================================================
