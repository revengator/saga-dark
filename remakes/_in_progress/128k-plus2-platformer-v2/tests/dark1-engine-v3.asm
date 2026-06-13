; =============================================================================
; SAGA DARK — Test wrapper v3 — Phase 1 STANDALONE on the UNIFIED hook-mode loop
; -----------------------------------------------------------------------------
; FIRST of the two isolated convergence risks (user decision: loop first, vars
; later). Runs Phase 1 under the canonical hook-mode loop (engine/game-loop.asm,
; UNIFIED_HOOKS=1) while its state vars STILL live at the Dark 1 addresses — so
; this isolates the "Phase 1 under the canonical loop" behaviour change from the
; "converge vars to the common block" edit, which comes next.
;
; Composition (mirrors dark2-engine-v3.asm but Phase 1 + Dark 1 layout):
;   motor[Dark 1 defines] + Phase 1 enemies + data (vars at Dark 1 addrs)
;   + engine/game-loop.asm built -DUNIFIED_HOOKS=1
;   + levels/phase1/hooks.asm  (INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET + MUERTE…)
;   + engine/bichos.asm        (table-driven dispatcher, already Phase 1)
;   + Phase 1 handlers + engine sound + data-tail + HUD + faces
;
; NOT byte-perfect by design. data-tail (0xAAA1) and HUD/faces (0xD606) are
; ORG-pinned (VAR0/PAN_PAD pointers target the 0xD6xx faces region); the code
; floats in the gap above, guarded by an ASSERT.
;
; Assemble with -DUNIFIED_HOOKS=1. Output: a runnable +2 128K snapshot that
; boots straight into Phase 1 under the unified loop, for visual validation.
; =============================================================================

        DEVICE ZXSPECTRUM128

SNA_HEADER  EQU 27
PORT_7FFD   EQU 0x7FFD
PORT_BORDER EQU 0xFE

    IFNDEF INFINITE_ENERGY
INFINITE_ENERGY EQU 0
    ENDIF

; --- CONVERGED var layout: state vars at the canonical (high-zone) addresses.
; POD4_VAR/ABUELO_OFF have no label (offsets into VAR_PRE) so they are EQU'd to
; canonical here; every other state var is a label in data.asm and lands on its
; canonical address when the block is placed at 0xA6A1 below (uniform +0x95).
; (Not engine/state.inc, which also EQUs VAR10/VAR1/PEDD1/TP0 — those ARE labels
;  in Phase 1's data.asm and converge via the move.)
POD4_VAR    EQU 0xA6A2
ABUELO_OFF  EQU 0xA6A7
        INCLUDE "../levels/phase1/defines.inc"

; --- 128K slot/page map: slot1=bank5, slot2=bank2, slot3=bank0 --------------
        SLOT 1
        PAGE 5
        SLOT 2
        PAGE 2
        SLOT 3
        PAGE 0

; --- Bank 5: screen + boot stub + pre-loaded tables -------------------------
        SLOT 1
        ORG 0x4000
        INCBIN "../levels/phase1/data/screen.bin"        ; 0x4000-0x5AFF (6912 B)

        ORG 0x5B00
boot_start:
        di
        xor a
        out (PORT_BORDER), a
        ld sp, 0x5BFF
        ld bc, PORT_7FFD
        ld a, 0x10                                       ; 48K ROM, bank 0 in slot 3
        out (c), a
        jp STAR                                          ; hook-mode loop entry

        ORG 0x5C00
        INCBIN "../levels/phase1/data/preload.bin"       ; 0x5C00-0x6A9A (3739 B)

; --- Converge PANTAL's hardcoded Dark 1 VAR0 refs ---------------------------
; The preload's code tail at 0x6A8B (PANTAL entry) has two `LD HL,VAR0` with
; the Dark 1 address baked in (0xA633 / 0xA632). After convergence VAR0 lives
; at 0xA6C8, so PANTAL was reading garbage → crash painting screen 0. preload.bin
; is shared with the legacy platformer (needs Dark 1), so patch here, not the .bin.
        ORG 0x6A8C
        DW 0xA6C8                                        ; PANTAL: LD HL,VAR0   (was 0xA633)
        ORG 0x6A99
        DW 0xA6C7                                        ; PANTAL: LD HL,VAR0-1 (was 0xA632)

; --- Engine motor (0x6A9B onward; spills into bank 2 at 0x8000) -------------
        ORG 0x6A9B
        INCLUDE "../engine/mapper.asm"
        INCLUDE "../engine/colas.asm"
        INCLUDE "../engine/abuelo.asm"
        INCLUDE "../engine/hres-printing.asm"
        INCLUDE "../engine/player.asm"
        INCLUDE "../engine/powers.asm"
        INCLUDE "../engine/collisions.asm"

; --- Phase 1 enemies (local sources; INCBIN sprite blobs as in main.asm) ----
        INCLUDE "../levels/phase1/enemies/piranha.asm"
        INCBIN  "../levels/phase1/data/piranha_sprite.bin"
        INCLUDE "../levels/phase1/enemies/gaseodoptero.asm"
        INCBIN  "../levels/phase1/data/gaseodoptero_sprite.bin"
        INCLUDE "../levels/phase1/enemies/viscosa.asm"
        INCLUDE "../levels/phase1/enemies/chicle.asm"
        INCBIN  "../levels/phase1/data/chicle_sprite.bin"
        INCLUDE "../levels/phase1/enemies/stone-blocks.asm"
        INCLUDE "../levels/phase1/enemies/speedy.asm"
        INCLUDE "../levels/phase1/enemies/dragons.asm"
        INCLUDE "../levels/phase1/enemies/explosion.asm"
        INCLUDE "../levels/phase1/enemies/final-boss.asm"

; --- CONVERGED layout: canonical loop goes in the hole the smaller Phase 1
; enemies leave (0xA60C-0xA6A0), then the data block at the canonical 0xA6A1
; (state vars land on D2 addrs via the +0x95 move), then the rest of the code. -
        INCLUDE "../engine/game-loop.asm"            ; hook-mode loop (in the 0xA60C enemy hole)
        DS 0xA6A1 - $, 0                             ; pad the rest of the hole up to the canonical block
        INCLUDE "../levels/phase1/data.asm"          ; state vars now at canonical 0xA6A1+ (VAR0=0xA6C8, T0=0xA6E7…)
        INCLUDE "../levels/phase1/hooks.asm"         ; INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET + MUERTE…
        INCLUDE "../levels/phase1/e123.asm"          ; E1/E2/E3
        INCLUDE "../engine/bichos.asm"               ; table-driven BICHOS (Phase 1)
        INCLUDE "../levels/phase1/handlers.asm"      ; PA00..PAD + PA0D9 + PUUP
        INCLUDE "../engine/sound-fade-carga.asm"     ; SONI/FMA/CARGA(PICHO2)

V3_CODE_END:
        ASSERT V3_CODE_END <= 0xAAA1                 ; code must not overrun pinned data-tail

; --- Pinned data tables (VAR0/PAN_PAD pointers target the 0xD6xx faces) -----
        ORG 0xAAA1
        INCLUDE "../levels/phase1/data-tail.asm"     ; sprites/screens/maps
        ORG 0xD606
        INCLUDE "../engine/hud.asm"                  ; HUD code + TAIL_PAD
        INCLUDE "../levels/phase1/faces-data.asm"    ; HAY_DATA + sprites
        INCLUDE "../engine/cara-perso.asm"           ; CARA_PERSO
        INCLUDE "../levels/phase1/faces-tail.asm"    ; CARA_MALO/NINJA + GRAFIC_FIN

; --- Extra data tail 0xE696-0xFFFF (buffers/tables) -------------------------
        ORG 0xE696
        INCBIN "../levels/phase1/data/tail.bin"      ; 0xE696-0xFFFF (6506 B)

        PAGE 0
        SAVESNA "build/saga-dark1-engine-v3.sna", boot_start
