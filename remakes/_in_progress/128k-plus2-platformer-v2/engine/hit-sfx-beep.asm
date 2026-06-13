; =============================================================================
; SAGA DARK — platformer — hit-confirm beep (UNIFIED_PLATFORMER only)
; -----------------------------------------------------------------------------
; hit_beep + hit_latch. Fires a short "tick" on the beeper (port 0xFE) when the
; spear deals damage to an enemy, latched to once per spear contact.
;
; Placement: a stack-safe slot-2 engine hole (Phase 1: the canonical-loop pad
; ~0xA68E; Phase 2: the code-end pad after sound.asm). Both holes sit far below
; the live stacks (Phase 1 SP=0xAF90 low-water ~0xAF6C; Phase 2 SP=0x5BFF), so
; — unlike the bank-2 music region 0xAE76+ — they are never clobbered by the
; deep movement/IM2 call chain.
;
; Reuses each build's existing beeper CORE via HIT_BEEP_CORE (defined by the
; wrapper): Phase 1 = SONI1_LP (fixed pitch 0x14, B = duration); Phase 2 = SONI
; core (LD c,b → pitch = duration = B). B = HIT_BEEP_N → a tick distinct from
; the spawn/explosion SONIx values. A self-contained custom beeper would need
; ~33 B of contiguous stack-safe space, which the fragmented 19+19 B engine
; holes don't offer — hence the core reuse.
;
; Latch: hit_latch = 0 (armed) / 1 (already beeped this contact). palo_tramp
; (hit-sfx-tramp.asm) re-arms it while the spear is inactive (DAT2 != 1).
; Carry (= hit, for the caller's RET NC) is preserved by palo_tramp's push/pop.
; =============================================================================

    IFNDEF HIT_BEEP_N
HIT_BEEP_N      EQU 0x0C                ; tick length / pitch — tunable per build
    ENDIF

; NOTE on IY: this beep runs out of PALO_IMPL's RCPE/SWAP (which leaves IY = the
; enemy sprite box), and the unified build keeps IRQs on for music — so an IM 2
; fires mid-beep and master_im2 chains `jp 0x0038` (ROM IM 1), which addresses
; sysvars via (IY+n). master_im2 now forces IY=0x5C3A right before that jp, so
; this routine (and every other collision/RCPE site) is safe regardless of IY.
hit_beep:
        ld a, (hit_latch)
        or a
        ret nz                          ; already beeped this contact
        ld a, 1
        ld (hit_latch), a
        ld b, HIT_BEEP_N
        jp HIT_BEEP_CORE                ; beep (clobbers AF/BC) then RET to caller

hit_latch:
        DEFB 0                          ; 0 = armed, 1 = beeped this contact
