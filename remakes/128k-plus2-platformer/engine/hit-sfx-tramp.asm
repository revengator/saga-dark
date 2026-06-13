; =============================================================================
; SAGA DARK — platformer — PALO trampoline (UNIFIED_PLATFORMER only)
; -----------------------------------------------------------------------------
; collisions.asm sets `PALO EQU palo_tramp` and relabels the original collision
; body PALO_IMPL, leaving the body UNMOVED at its original address — so the
; enemy region never shifts and BICHOS_TABLE's hardcoded screen-12 entry
; (DEFW 0x970E) + the preload/tail code refs into that region stay valid.
;
; palo_tramp runs the real collision check (PALO_IMPL), fires the latched hit
; beep on a damaging hit (carry set), and re-arms hit_latch while the spear is
; inactive (DAT2 != 1) so the next throw beeps again. The hit-carry (which the
; caller tests via RET NC) is preserved across the latch bookkeeping.
;
; Lives in a stack-safe slot-2 engine hole (see hit-sfx-beep.asm). 19 B.
; =============================================================================

palo_tramp:
        call PALO_IMPL                  ; carry = damaging spear hit
        push af                         ; preserve hit-carry for caller's RET NC
        call c, hit_beep                ; beep once per contact (latched)
        ld a, (DAT2)                    ; re-arm latch while spear inactive
        dec a                           ; A=0 iff DAT2==1 (spear active)
        jr z, .pt_active
        xor a
        ld (hit_latch), a               ; spear inactive → next throw can beep
.pt_active:
        pop af
        ret
