; =============================================================================
; SAGA DARK — Test wrapper — Dark 1 with the new engine/ modules
; -----------------------------------------------------------------------------
; Validates that the refactored engine (literals → symbols) reassembles to
; dark1.bin byte-perfect against original-48k/snapshots/dark1/dark1.sna.
;
; Build:    sjasmplus --raw=build/dark1-engine.bin dark1-engine.asm
; Compare:  cmp build/dark1-engine.bin <(dd if=dark1.sna bs=1 skip=10934 count=31739)
; =============================================================================

         INCLUDE "../engine/defines.inc"
         INCLUDE "../../../../original-48k/src/dark1/defines.inc"

         ORG 0x6A9B

; --- Engine modules (refactored, literals replaced by symbols) --------------
         INCLUDE "../engine/mapper.asm"            ; 785B (0x6A9B-0x6DAB)
         INCLUDE "../engine/colas.asm"             ; 143B (0x6DAC-0x6E3A)
         INCLUDE "../engine/abuelo.asm"            ; 1064B (0x6E3B-0x7262)
         INCLUDE "../engine/hres-printing.asm"     ; 1121B (0x7263-0x76C3)
         INCLUDE "../engine/player.asm"            ; 1239B (0x76C4-0x7B9A)
         INCLUDE "../engine/powers.asm"            ; 150B (0x7B9B-0x7C30)
         INCLUDE "../engine/collisions.asm"        ; 500B (0x7C31-0x7E24)

; --- Per-phase: Dark 1 enemies + main + faces (unchanged from original) -----
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
         INCLUDE "../../../../original-48k/src/dark1/main.asm"
         INCLUDE "../../../../original-48k/src/dark1/faces-and-enemy.asm"
