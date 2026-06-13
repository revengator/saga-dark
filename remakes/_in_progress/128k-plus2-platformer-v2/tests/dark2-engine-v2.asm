; =============================================================================
; SAGA DARK — Test wrapper v2 — Dark 2 with engine/ + levels/phase2/
; -----------------------------------------------------------------------------
; Validates that the divergent Phase 2 source tree at levels/phase2/ still
; reassembles to dark2.bin byte-perfect against
; original-48k/snapshots/dark2/dark2.sna. Mirrors tests/dark1-engine-v2.asm.
;
; Phase 2 keeps main.asm and faces-and-enemy.asm as monolithic copies of the
; Dark 2 originals — the splits (data/e123/handlers/data-tail/faces-data/
; faces-tail) follow once the engine's game-loop/bichos/sound-fade-carga
; become layout-parametrized. They currently hold DEFB literals with Dark 1
; addresses, so Phase 2 cannot intercalate them without breaking byte-perfect.
; =============================================================================

; --- Dark 2 layout overrides (inline, NOT including engine/defines.inc) -----
; engine/defines.inc holds Dark 1 values for POD4_VAR / ABUELO_OFF; for the
; Dark 2 layout we define all the symbols inline and skip that include.
POD4_VAR    EQU 0xA6A2
ABUELO_OFF  EQU 0xA6A7
VAR10       EQU 0xA6A8
VAR1        EQU 0xA6A9
PEDD1       EQU 0xA6FA
TP0         EQU 0xA77D
MUERTE_K    EQU 0xA89F

         INCLUDE "../levels/phase2/defines.inc"         ; T0, TABLA1, TABLA2, INFINITE_ENERGY
         INCLUDE "../levels/phase2/enemy_stubs.inc"

         ORG 0x6A9B

; --- Engine motor (same source as Dark 1, layout-parametrized) --------------
         INCLUDE "../engine/mapper.asm"            ; 0x6A9B-0x6DAB
         INCLUDE "../engine/colas.asm"             ; 0x6DAC-0x6E3A
         INCLUDE "../engine/abuelo.asm"            ; 0x6E3B-0x7262
         INCLUDE "../engine/hres-printing.asm"     ; 0x7263-0x76C3
         INCLUDE "../engine/player.asm"            ; 0x76C4-0x7B9A
         INCLUDE "../engine/powers.asm"            ; 0x7B9B-0x7C30
         INCLUDE "../engine/collisions.asm"        ; 0x7C31-0x7E24

; --- Dark 2 specific: 1B padding between collisions and armadura -----------
         DEFB 0                                    ; 0x7E25

; --- Per-phase: Phase 2 enemies (9, monolithic copies of Dark 2) -----------
         INCLUDE "../levels/phase2/enemies/armadura.asm"
         INCLUDE "../levels/phase2/enemies/trimonster.asm"
         INCLUDE "../levels/phase2/enemies/fuego.asm"
         INCLUDE "../levels/phase2/enemies/sierra.asm"
         INCLUDE "../levels/phase2/enemies/diablo.asm"
         INCLUDE "../levels/phase2/enemies/pincho.asm"
         INCLUDE "../levels/phase2/enemies/saltaron.asm"
         INCLUDE "../levels/phase2/enemies/llamaron.asm"
         INCLUDE "../levels/phase2/enemies/globman.asm"

; --- Per-phase data + Phase 2's own loop/bichos/sound (split from main.asm,
;     byte-perfect reorg; loop/bichos/sound become engine hook-mode at 2c) -----
         INCLUDE "../levels/phase2/data.asm"        ; var block 0xA6A1-0xA7A9
         INCLUDE "../levels/phase2/game-loop.asm"   ; TART init + STAR..NUEVO
         INCLUDE "../levels/phase2/e123.asm"        ; E1/E2/E3/VARMA
         INCLUDE "../levels/phase2/bichos.asm"      ; BICHOS dispatcher
         INCLUDE "../levels/phase2/handlers.asm"    ; PA00..PA14
         INCLUDE "../levels/phase2/sound.asm"       ; SONI/FMA/CARGA
         INCLUDE "../levels/phase2/data-tail.asm"   ; PLAY.. sprites/screens
         INCLUDE "../levels/phase2/faces-and-enemy.asm"
