; =============================================================================
; SAGA DARK — engine — BICHOS enemy dispatcher (table-driven, E3)
; -----------------------------------------------------------------------------
; Range: 0xA84E-0xA8A4 (87 B, unchanged size). Reads VAR0 (current screen) and
; jumps to the per-screen handler via a jump table, replacing the old
; CP n / JP z,PAnn chain. Behaviour is identical to the Dark 1 chain for
; screens 0..14 (verified by targeted compare against dark1.sna: only the
; dispatch bytes 0xA859-0xA8A4 differ; handlers/sound/data-tail/faces stay
; byte-identical).
;
; Kept at exactly 87 B (DEFS pad) so nothing below it moves — the VAR0/PAN_PAD
; data tables hold absolute pointers into the 0xD6xx-0xDDxx sprite region, so
; that region must not shift.
;
; The prefix (sound trigger + PA0D9 pre-handler) and BICHOS_TABLE are Phase 1
; specific and live here for now; at E4 they move into the per-level descriptor
; so a level just supplies its own table + prefix. The table-walk code itself
; is the reusable engine part.
; =============================================================================

BICHOS:
         ; --- per-frame prefix (Phase 1: sound trigger + PA0D9 pre-handler) ---
         LD a,(0x5D32)          ;A84E — TABLA1+8 screen-attr byte
         CP 0x05                ;A851
         CALL z,SONI            ;A853
         CALL PA0D9             ;A856 — Phase 1 pre-dispatch handler
         ; --- jump-table dispatch by current screen index (VAR0) ------------
         LD a,(VAR0)            ;A859
         CP 0x0F                ;A85C — 15 screens (0..14); >=15 -> default
         JR nc,BICHOS_DEF       ;A85E
         ADD a,a                ;A860 — index*2
         LD e,a                 ;A861
         LD d,0x00              ;A862
         LD hl,BICHOS_TABLE     ;A864
         ADD hl,de              ;A867
         LD a,(hl)              ;A868 — low byte of handler addr
         INC hl                 ;A869
         LD h,(hl)              ;A86A — high byte
         LD l,a                 ;A86B
         JP (hl)                ;A86C — tail-jump to handler (it RETs to loop)
BICHOS_DEF:
         JP PA03                ;A86D — default handler (screen 13 + out-of-range)

BICHOS_TABLE:                   ;A870 — 15 entries (screens 0..14)
         DEFW PA00, PA01, PA01, PA03, PA04, PA05, PA06, PA03   ; 0..7
         DEFW PA08, PA09, PA010, PA010, 0x970E, PA03, NINJA    ; 8..14

         ; In byte-perfect builds (UNIFIED_HOOKS=0) pad to exactly 87 B so
         ; handlers.asm stays at 0xA8A5. Unified builds aren't byte-perfect and
         ; are space-constrained (Phase 1's map is full), so drop the pad there.
    IF UNIFIED_HOOKS
         ; no pad — reclaim the slack for the larger canonical loop + hooks
    ELSE
         DEFS 87 - ($ - BICHOS), 0x00
    ENDIF
