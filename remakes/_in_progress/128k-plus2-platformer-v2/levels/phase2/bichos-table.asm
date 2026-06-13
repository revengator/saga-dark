; =============================================================================
; SAGA DARK — Phase 2 — BICHOS dispatcher (table-driven, unified-engine form)
; -----------------------------------------------------------------------------
; Same table-walk as engine/bichos.asm (E3) but with Phase 2's prefix and
; handler set, supplied as the per-level dispatcher for the hook-mode loop.
; Logic-equivalent to levels/phase2/bichos.asm's CP-chain (NOT byte-perfect):
;   prefix : sound trigger on TABLA1+8 (0x5D32) == 5 -> SONI1   (Phase 2 used
;            SONI1, not Phase 1's SONI; and has no PA0D9 pre-handler)
;   walk   : screen index VAR0 in 0..13 -> PA00..PA13 via jump table
;            screen index >= 14         -> PA14 (default / out-of-range)
;
; At E4 the prefix + table move into the per-level descriptor; this stays as
; the Phase 2 instance for the standalone proof.
; =============================================================================

BICHOS:
         LD a,(0x5D32)          ; TABLA1+8 screen-attr byte
         CP 0x05
         CALL z,SONI1
         LD a,(VAR0)            ; current screen index
         CP 0x0E                ; 14 screens (0..13); >=14 -> default
         JR nc,BICHOS_DEF
         ADD a,a                ; index*2
         LD e,a
         LD d,0x00
         LD hl,BICHOS_TABLE
         ADD hl,de
         LD a,(hl)              ; low byte of handler addr
         INC hl
         LD h,(hl)              ; high byte
         LD l,a
         JP (hl)                ; tail-jump to handler (RETs to loop)
BICHOS_DEF:
         JP PA14                ; default handler (screen >= 14)

BICHOS_TABLE:                   ; 14 entries (screens 0..13)
         DEFW PA00, PA01, PA02, PA03, PA04, PA05, PA06, PA07
         DEFW PA08, PA09, PA10, PA11, PA12, PA13
