; =============================================================================
; SAGA DARK — Test wrapper v3 — Phase 2 STANDALONE on the UNIFIED hook-mode loop
; -----------------------------------------------------------------------------
; Path (B) of the unified-engine rollout (see CONTEXT.md / UNIFIED-ENGINE.md):
; prove the canonical hook-mode loop (engine/game-loop.asm, UNIFIED_HOOKS=1)
; can host Phase 2 *with Phase 2's own addresses*, before tackling the
; convergence-to-Dark1-addresses + paging work (E5).
;
; Composition:
;   motor[Phase 2 EQUs]  (same as dark2-engine-v2.asm)
;   + engine/game-loop.asm  built in hook mode (UNIFIED_HOOKS=1)
;   + levels/phase2/hooks.asm        (INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET
;                                      + MUERTE/NU1/NU2/MUER/MUERTE_K/TRUCO)
;   + levels/phase2/bichos-table.asm (table-driven dispatcher)
;   + the unchanged Phase 2 enemies / data / e123 / handlers / sound / data-tail / faces
;
; NOT byte-perfect by design. The hook-mode loop + separate hooks are larger
; than Phase 2's old inline loop, so everything below the loop would shift and
; break the absolute pointers baked into the VAR0/T01 tables. Fix: keep the
; data tables PINNED at their original addresses (ORG data-tail @ 0xAA7E and
; faces @ 0xD606) and let the code region float in the gap above them. An
; ASSERT guards against the code overrunning the pinned data.
;
; Output: a runnable +2 128K snapshot (saga-dark2-engine-v3.sna) that boots
; straight into Phase 2 under the unified loop, for visual validation.
; =============================================================================

        DEVICE ZXSPECTRUM128

SNA_HEADER  EQU 27
PORT_7FFD   EQU 0x7FFD
PORT_BORDER EQU 0xFE

; --- Build the engine game-loop in hook mode --------------------------------
; Assemble with -DUNIFIED_HOOKS=1 so game-loop.asm's IFNDEF guard selects the
; canonical hook-mode loop (the IF branch). INFINITE_ENERGY is defaulted by
; phase2/defines.inc; pass -DINFINITE_ENERGY=1 for the cheat build.

; --- Canonical shared state-var block (E4) ----------------------------------
; The Dark 2 layout EQUs (POD4_VAR/ABUELO_OFF/VAR10/VAR1/PEDD1/TP0) now live in
; engine/state.inc, the single source of truth shared by every level. The anchor
; addresses == Dark 2's, so Phase 2 is already converged.
; NOTE: dark2-engine-v2.asm also defined `MUERTE_K EQU 0xA89F` because Phase 2's
; old loop named that routine CASIRA. In v3 MUERTE_K is a real label in
; hooks.asm, so the EQU is intentionally dropped here.
        INCLUDE "../engine/state.inc"                   ; POD4_VAR/ABUELO_OFF/VAR10/VAR1/PEDD1/TP0 + map
        INCLUDE "../levels/phase2/defines.inc"          ; T0, TABLA1, TABLA2, INFINITE_ENERGY
        INCLUDE "../levels/phase2/enemy_stubs.inc"

; --- 128K slot/page map: slot1=bank5, slot2=bank2, slot3=bank0 (Phase 2 = 48K
;     image laid out linearly across the three default banks) -----------------
        SLOT 1
        PAGE 5
        SLOT 2
        PAGE 2
        SLOT 3
        PAGE 0

; --- Bank 5: screen + boot stub + pre-loaded tables -------------------------
        SLOT 1
        ORG 0x4000
        INCBIN "../../../../original-48k/snapshots/dark2/dark2.sna", SNA_HEADER, 0x1B00   ; 0x4000-0x5AFF screen (6912 B)

        ORG 0x5B00
boot_start:
        di
        xor a
        out (PORT_BORDER), a                        ; black border
        ld sp, 0x5BFF
        ld bc, PORT_7FFD
        ld a, 0x10                                  ; 48K ROM in slot 0, bank 0 in slot 3
        out (c), a
        jp STAR                                     ; hook-mode loop entry (engine/game-loop.asm)

        ORG 0x5C00
        INCBIN "../../../../original-48k/snapshots/dark2/dark2.sna", SNA_HEADER + 0x1C00, 0x0E9B   ; 0x5C00-0x6A9A pre-loaded (3739 B)

; --- Engine motor (0x6A9B onward; spills into bank 2 at 0x8000) -------------
        ORG 0x6A9B
        INCLUDE "../engine/mapper.asm"               ; 0x6A9B-0x6DAB
        INCLUDE "../engine/colas.asm"                ; 0x6DAC-0x6E3A
        INCLUDE "../engine/abuelo.asm"               ; 0x6E3B-0x7262
        INCLUDE "../engine/hres-printing.asm"        ; 0x7263-0x76C3
        INCLUDE "../engine/player.asm"               ; 0x76C4-0x7B9A
        INCLUDE "../engine/powers.asm"               ; 0x7B9B-0x7C30
        INCLUDE "../engine/collisions.asm"           ; 0x7C31-0x7E24

        DEFB 0                                       ; 0x7E25 padding (as in v2)

; --- Phase 2 enemies (9, unchanged) -----------------------------------------
        INCLUDE "../levels/phase2/enemies/armadura.asm"
        INCLUDE "../levels/phase2/enemies/trimonster.asm"
        INCLUDE "../levels/phase2/enemies/fuego.asm"
        INCLUDE "../levels/phase2/enemies/sierra.asm"
        INCLUDE "../levels/phase2/enemies/diablo.asm"
        INCLUDE "../levels/phase2/enemies/pincho.asm"
        INCLUDE "../levels/phase2/enemies/saltaron.asm"
        INCLUDE "../levels/phase2/enemies/llamaron.asm"
        INCLUDE "../levels/phase2/enemies/globman.asm"

; --- Per-phase data + UNIFIED loop + Phase 2 hooks --------------------------
    IFDEF UNIFIED_PLATFORMER
; dmg_border (player-damage border flash) is the shared bank-2 routine Phase 1's
; master_im2.asm assembles at ORG 0xAEA0; Phase 2 inherits it (transition LDIR
; skips 0xAD00-0xAEFF) and the canonical loop CALLs it — reference by address.
dmg_border EQU 0xAEA0
    ENDIF
        INCLUDE "../levels/phase2/data.asm"          ; var block 0xA6A1-0xA7A9
        INCLUDE "../engine/game-loop.asm"            ; hook-mode loop (STAR/PREAMBLE/MAIN/...)
        INCLUDE "../levels/phase2/hooks.asm"         ; INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET + MUERTE...
        INCLUDE "../levels/phase2/e123.asm"          ; E1/E2/E3/VARMA
        INCLUDE "../levels/phase2/bichos-table.asm"  ; table-driven BICHOS
        INCLUDE "../levels/phase2/handlers.asm"      ; PA00..PA14
        INCLUDE "../levels/phase2/sound.asm"         ; SONI/FMA/CARGA
    IFDEF UNIFIED_PLATFORMER
; hit-confirm beep (same sources as Phase 1). HIT_BEEP_CORE = the shared
; distinctive hit_sfx_core that Phase 1's master_im2.asm assembles into bank 2 at
; ORG 0xAE80. Phase 2 has no master_im2 of its own, but that 0xAD00-0xAEFF window
; is PRESERVED across the transition (the bank3->2 LDIR skips it), so 0xAE80 holds
; the real core at Phase 2 runtime — reference it by fixed address. hit_beep +
; palo_tramp land in the code-end pad (stack-safe; Phase 2 runs SP=0x5BFF). The
; smoke-test build (no UNIFIED_PLATFORMER) skips these — PALO stays the body.
HIT_BEEP_CORE EQU 0xAE80
        INCLUDE "../engine/hit-sfx-beep.asm"
        INCLUDE "../engine/hit-sfx-tramp.asm"
; dmg_border (master_im2.asm) hardcodes Phase 2's NU1 address as DMG_NU1_P2;
; keep it in sync — this build is where Phase 2's NU1 symbol actually exists.
        ASSERT NU1 == 0xA8EC
    ENDIF

V3_CODE_END:
        ASSERT V3_CODE_END <= 0xAA7E                 ; code must not overrun pinned data-tail

; --- Pinned data tables (absolute pointers in VAR0/T01 target these) --------
        ORG 0xAA7E
        INCLUDE "../levels/phase2/data-tail.asm"     ; PLAY.. sprites/screens
        ORG 0xD606
        INCLUDE "../levels/phase2/faces-and-enemy.asm"

; --- Extra data tail 0xE696-0xFFFF (buffers/tables from dark2.sna) ----------
        ORG 0xE696
        INCBIN "../../../../original-48k/snapshots/dark2/dark2.sna", SNA_HEADER + 0xA696, 0x196A   ; 0xE696-0xFFFF (6506 B)

; --- Restore bank 0 in slot 3 so SAVESNA records it as current --------------
        PAGE 0

        SAVESNA "build/saga-dark2-engine-v3.sna", boot_start
