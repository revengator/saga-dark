; =============================================================================
; saga-film-test-music — standalone PT3 sanity check (NOT the film).
; -----------------------------------------------------------------------------
; Builds an isolated .sna that boots, sets up IM2 at 50 Hz, and plays
; src/music/bushido.pt3 through Sergey Bulba's Vortex Tracker II PT3 player
; (src/music/pt3_play.asm). The visible result is just a black screen with
; a slowly cycling bottom border; the audible result is the chiptune.
;
; Purpose: validate that (a) the player code compiles + links cleanly, (b)
; the AY chip outputs sound on the +2 128K target, and (c) a real PT3 module
; plays end-to-end. Uses the film's own Track B (Bushido) as the target so
; the test bundles only public-domain / original music (see SOUNDTRACK.md).
;
; Layout:
;   slot 1 / bank 5 (fixed): bootstrap + IM2 handler (live in 0x5B00 area).
;   slot 2 / bank 2 (fixed): unused.
;   slot 3 / bank 0:         PT3 player at 0xC000 + module data after it +
;                            IM2 vector at 0xFDFD + IM2 fill table at 0xFE00.
;
; Run: bash test-music.sh, then load build/saga-film-test-music.sna in Fuse.
; =============================================================================

        DEVICE ZXSPECTRUM128

PORT_7FFD       EQU 0x7FFD
PORT_BORDER     EQU 0xFE
STACK_BASE      EQU 0x5DBF

        SLOT 1
        PAGE 5
        SLOT 2
        PAGE 2
        SLOT 3
        PAGE 0
        SLOT 1

; --- Screen zeros so the .sna doesn't flash white at boot --------------------
        ORG 0x4000
        DEFS 0x1B00, 0

; --- Bootstrap + IM2 handler in bank 5 (slot 1, fixed) -----------------------
        ORG 0x5B00
boot_start:
        di
        ld a, 1                         ; blue   = bootstrap entered
        out (PORT_BORDER), a
        ld sp, STACK_BASE
        ld bc, PORT_7FFD
        ld a, 0x10                      ; 48K ROM in slot 0, bank 0 in slot 3
        out (c), a
        ld a, 2                         ; red    = paging OK
        out (PORT_BORDER), a

        ; --- Direct AY beep ~1 s on channel A to verify AY emulation works
        ;     before we even touch the PT3 player. If you DON'T hear a tone
        ;     during the magenta border, the emulator isn't in 128K mode or
        ;     AY emulation is off — fix that before debugging the player.
        ld a, 7                         ; AY reg 7 = mixer
        ld bc, 0xFFFD : out (c), a
        ld a, 0b00111110                ; tone A enabled, B+C+all noise off
        ld bc, 0xBFFD : out (c), a
        ld a, 0                         ; reg 0 = ch A tone period lo
        ld bc, 0xFFFD : out (c), a
        ld a, 0xDD                      ; ~750 Hz with 1.77 MHz clock
        ld bc, 0xBFFD : out (c), a
        ld a, 1                         ; reg 1 = ch A tone period hi
        ld bc, 0xFFFD : out (c), a
        ld a, 0
        ld bc, 0xBFFD : out (c), a
        ld a, 8                         ; reg 8 = ch A volume
        ld bc, 0xFFFD : out (c), a
        ld a, 15                        ; max volume, no envelope
        ld bc, 0xBFFD : out (c), a
        ld a, 3                         ; magenta = AY tone playing
        out (PORT_BORDER), a
        ; ~1.5 s busy-loop wait (DI throughout — no IM/ROM dependency).
        ld c, 3
.beep_outer:
        ld de, 0xFFFF
.beep_inner:
        dec de
        ld a, d : or e
        jr nz, .beep_inner
        dec c
        jr nz, .beep_outer
        ; Mute channel A.
        ld a, 8                         ; reg 8 = ch A volume
        ld bc, 0xFFFD : out (c), a
        xor a                           ; volume 0
        ld bc, 0xBFFD : out (c), a

        ; Init the PT3 player with module pointer in HL.
        ld hl, song_pt3_data
        call START + 3                  ; INIT entry point (module in HL)
        ld a, 4                         ; green  = player INIT returned OK
        out (PORT_BORDER), a
        ; Set up IM 2: I=0xFE, vector at 0xFDFD, fill table at 0xFE00.
        ld a, 0xFE
        ld i, a
        im 2
        ei
        ld a, 5                         ; cyan   = IM2 armed, before first HALT
        out (PORT_BORDER), a
.loop:
        halt                            ; wait for next interrupt (IM2 fires)
        jr .loop                        ; border now driven by handler instead

; IM2 handler — pushes every register the player might touch, calls PLAY,
; restores. The PT3 player documents that no interrupts are expected during
; PLAY and that it uses up to ~9500 T-states; at 50 Hz one frame is
; ~70 000 T-states, so we have plenty of margin even with full register save.
im2_handler:
        push af
        push bc
        push de
        push hl
        push ix
        push iy
        exx
        push hl
        push de
        push bc
        ex af, af'
        push af
        ld a, 7                         ; white = entered handler
        out (PORT_BORDER), a
        call START + 5                  ; PLAY one frame
        ld a, 2                         ; red   = PLAY returned this frame
        out (PORT_BORDER), a
        pop af
        ex af, af'
        pop bc
        pop de
        pop hl
        exx
        pop iy
        pop ix
        pop hl
        pop de
        pop bc
        pop af
        ei
        ret

; --- PT3 player + module data in bank 0 (slot 3) -----------------------------
; The player hardcodes ORG #C000 internally and places its VARS after the
; code; song_pt3_data follows. Total: ~2.2 KB player + ~2 KB module = ~4 KB,
; comfortably inside bank 0's 16 KB.
        SLOT 3
        PAGE 0
        ORG 0xC000

        INCLUDE "src/music/pt3_play.asm"

song_pt3_data:
        INCBIN "src/music/bushido.pt3"

; --- IM2 vector trampoline at 0xFDFD (bank 0) --------------------------------
; The Z80 IM2 lookup with I=0xFE picks up bytes at (0xFEFD..0xFEFE) from the
; fill table below. Both contain 0xFD, so the lookup yields address 0xFDFD,
; where this 3-byte JP lives.
        ORG 0xFDFD
        jp im2_handler

; --- IM2 fill table: 257 bytes of 0xFD at 0xFE00..0xFF00 ---------------------
; Need 257 (not 256) so that with I=0xFE and any data-bus byte 0..255, BOTH
; lookup bytes (lo at 0xFE??, hi at 0xFE??+1) land inside the table. With
; only 256 bytes ending at 0xFEFF, data-bus=0xFF would read hi from 0xFF00
; (uninitialised → likely 0x00) and the Z80 would jump to 0x00FD = ROM.
        ORG 0xFE00
        DEFS 257, 0xFD

        SAVESNA "saga-film-test-music.sna", boot_start
