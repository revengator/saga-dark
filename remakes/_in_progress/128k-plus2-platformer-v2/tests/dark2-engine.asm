; =============================================================================
; SAGA DARK — Test wrapper — Dark 2 with the new engine/ modules
; -----------------------------------------------------------------------------
; Validates that the same refactored engine reassembles to dark2.bin
; byte-perfect against original-48k/snapshots/dark2/dark2.sna when
; given Dark 2's per-phase data and the Dark 2 layout overrides.
;
; Proves the engine is layout-parametrizable: same source files, two
; different .bin outputs depending on the symbol layout.
; =============================================================================

; --- Dark 2 layout (full inline, NOT including engine/defines.inc) ---------
; All shifted +0x95 from Dark 1, except MUERTE_K (+0xBC — main_tail grows
; non-uniformly between the two phases).
POD4_VAR    EQU 0xA6A2
ABUELO_OFF  EQU 0xA6A7
VAR10       EQU 0xA6A8
VAR1        EQU 0xA6A9
; VAR13, VAR2, VAR25 are now labels in dark2/main.asm — no EQU needed
PEDD1       EQU 0xA6FA
TP0         EQU 0xA77D
MUERTE_K    EQU 0xA89F

         INCLUDE "../../../../original-48k/src/dark2/defines.inc"        ; T0, TABLA1, TABLA2, INFINITE_ENERGY
         INCLUDE "../../../../original-48k/src/dark2/enemy_stubs.inc"

         ORG 0x6A9B

; --- Engine modules (same source as Dark 1) ---------------------------------
         INCLUDE "../engine/mapper.asm"            ; 785B (0x6A9B-0x6DAB)
         INCLUDE "../engine/colas.asm"             ; 143B (0x6DAC-0x6E3A)
         INCLUDE "../engine/abuelo.asm"            ; 1064B (0x6E3B-0x7262)
         INCLUDE "../engine/hres-printing.asm"     ; 1121B (0x7263-0x76C3)
         INCLUDE "../engine/player.asm"            ; 1239B (0x76C4-0x7B9A)
         INCLUDE "../engine/powers.asm"            ; 150B (0x7B9B-0x7C30)
         INCLUDE "../engine/collisions.asm"        ; 500B (0x7C31-0x7E24)

; --- Dark 2 specific: 1B padding between collisions and armadura ------------
         DEFB 0                                    ; 0x7E25

; --- Per-phase: Dark 2 enemies + main + faces (unchanged from original) -----
         INCLUDE "../../../../original-48k/src/dark2/armadura.asm"
         INCLUDE "../../../../original-48k/src/dark2/trimonster.asm"
         INCLUDE "../../../../original-48k/src/dark2/fuego.asm"
         INCLUDE "../../../../original-48k/src/dark2/sierra.asm"
         INCLUDE "../../../../original-48k/src/dark2/diablo.asm"
         INCLUDE "../../../../original-48k/src/dark2/pincho.asm"
         INCLUDE "../../../../original-48k/src/dark2/saltaron.asm"
         INCLUDE "../../../../original-48k/src/dark2/llamaron.asm"
         INCLUDE "../../../../original-48k/src/dark2/globman.asm"
         INCLUDE "../../../../original-48k/src/dark2/main.asm"
         INCLUDE "../../../../original-48k/src/dark2/faces-and-enemy.asm"
