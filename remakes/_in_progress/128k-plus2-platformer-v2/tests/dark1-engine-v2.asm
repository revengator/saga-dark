; =============================================================================
; SAGA DARK — Test wrapper v2 — Dark 1 with full engine/ + levels/phase1/ split
; -----------------------------------------------------------------------------
; Validates that the deeper refactor (game-loop / bichos / sound-fade-carga
; extracted from main.asm into engine/, and per-phase data + handlers split
; into levels/phase1/) reassembles to dark1.bin byte-perfect against
; original-48k/snapshots/dark1/dark1.sna.
; =============================================================================

         INCLUDE "../engine/defines.inc"
         INCLUDE "../../../../original-48k/src/dark1/defines.inc"

         ORG 0x6A9B

; --- Engine motor modules (parametrized by symbols) -------------------------
         INCLUDE "../engine/mapper.asm"            ; 785B (0x6A9B-0x6DAB)
         INCLUDE "../engine/colas.asm"             ; 143B (0x6DAC-0x6E3A)
         INCLUDE "../engine/abuelo.asm"            ; 1064B (0x6E3B-0x7262)
         INCLUDE "../engine/hres-printing.asm"     ; 1121B (0x7263-0x76C3)
         INCLUDE "../engine/player.asm"            ; 1239B (0x76C4-0x7B9A)
         INCLUDE "../engine/powers.asm"            ; 150B (0x7B9B-0x7C30)
         INCLUDE "../engine/collisions.asm"        ; 500B (0x7C31-0x7E24)

; --- Phase 1 enemies (still from original dark1 — extraction in 3d) ---------
         INCLUDE "../../../../original-48k/src/dark1/piranha.asm"
         INCBIN  "../../../../original-48k/src/dark1/data/piranha_sprite.bin"
         INCLUDE "../../../../original-48k/src/dark1/gaseodoptero.asm"
         INCBIN  "../../../../original-48k/src/dark1/data/gaseodoptero_sprite.bin"
         INCLUDE "../../../../original-48k/src/dark1/viscosa.asm"
         INCLUDE "../../../../original-48k/src/dark1/chicle.asm"
         INCBIN  "../../../../original-48k/src/dark1/data/chicle_sprite.bin"
         INCLUDE "../../../../original-48k/src/dark1/stone-blocks.asm"
         INCLUDE "../../../../original-48k/src/dark1/speedy.asm"
         INCLUDE "../../../../original-48k/src/dark1/dragons.asm"
         INCLUDE "../../../../original-48k/src/dark1/explosion.asm"
         INCLUDE "../../../../original-48k/src/dark1/final-boss.asm"

; --- Per-phase data + game loop (refactored split of main.asm) --------------
         INCLUDE "../levels/phase1/data.asm"          ; vars 0xA60C-0xA714
         INCLUDE "../engine/game-loop.asm"            ; STAR/MAIN/MORTE/MUERTE/NUEVO 0xA715-0xA84A
         INCLUDE "../levels/phase1/e123.asm"          ; E1/E2/E3 0xA84B-0xA84D
         INCLUDE "../engine/bichos.asm"               ; BICHOS dispatcher 0xA84E-0xA8A4
         INCLUDE "../levels/phase1/handlers.asm"      ; PA00..PAD 0xA8A5-0xA977
         INCLUDE "../engine/sound-fade-carga.asm"     ; SONI/FMA/CARGA 0xA978-0xAAA5
         INCLUDE "../levels/phase1/data-tail.asm"     ; sprites/maps 0xAAA6-0xD605

; --- HUD (engine) + per-phase faces data (refactored split) -----------------
         INCLUDE "../engine/hud.asm"                   ; HUD code + TAIL_PAD (0xD606-0xD6D7, 210 B)
         INCLUDE "../levels/phase1/faces-data.asm"     ; HAY_DATA + sprites (0xD6D8-0xE52D, 3670 B)
         INCLUDE "../engine/cara-perso.asm"            ; CARA_PERSO sprite (0xE52E-0xE575, 72 B)
         INCLUDE "../levels/phase1/faces-tail.asm"     ; CARA_MALO/CARA_NINJA + GRAFIC_FIN (0xE576-0xE695, 288 B)
