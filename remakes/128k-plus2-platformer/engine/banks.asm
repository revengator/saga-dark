; =============================================================================
; +2 128K — bank paging utilities (port 0x7FFD)
; -----------------------------------------------------------------------------
; Used by milestone 4.1B (Dark 1 → Dark 2 transition). Empty for 4.1A.
;
; Port 0x7FFD bit layout (write-only):
;   bits 0-2: RAM bank at 0xC000 (0..7)
;   bit 3:    Display screen — 0 = bank 5 (normal), 1 = bank 7 (shadow)
;   bit 4:    ROM select — 0 = 128K editor ROM, 1 = 48K BASIC ROM
;   bit 5:    Lock paging (CAUTION: machine must be reset to undo)
;
; The OS keeps the last value written at 0x5B5C (SYSVAR BANKM on +2).
; We mirror it locally because writing 0x7FFD is otherwise write-only.
; =============================================================================

PORT_7FFD       EQU 0x7FFD

; -----------------------------------------------------------------------------
; set_ram_bank: page bank A (0-7) into 0xC000, preserving ROM/screen flags
; -----------------------------------------------------------------------------
; In:  A = bank number (0..7); upper bits ignored
; Out: bank A paged at 0xC000
; Clobbers: A, BC; preserves all others
; -----------------------------------------------------------------------------
set_ram_bank:
        and 0x07
        ld bc, .last_value + 0          ; HL would be cleaner but stay clobber-light
        push hl
        ld hl, .last_value
        ld c, (hl)
        and 0x07
        ld b, a
        ld a, c
        and ~0x07 & 0xFF                ; clear bank bits, keep ROM/screen/lock
        or b
        ld (hl), a
        pop hl
        ld bc, PORT_7FFD
        out (c), a
        ret

.last_value:
        defb 0x10                       ; default: 48K ROM, bank 0, screen=bank5
