; =============================================================================
; SAGA DARK — +2 128K — Film (intro/cinematic) as standalone minigame
; -----------------------------------------------------------------------------
; The Film is a single-shot 41527-byte intro program that lives at
; ORG 0x5DC0 (INICIO = 24000) in 48K mode. It uses port 0xFE for border/sound
; and calls a few ROM routines (PAUSE-1 at 0x1F3D), so it needs the 48K BASIC
; ROM paged in slot 0. The Film itself sets up IM 2 internally (CALL RAINM2)
; so we only need to leave it in IM 1 + interrupts enabled at boot, and let
; the Film configure IM 2 when it runs.
;
; Memory map:
;   0x0000-0x3FFF  ROM (48K BASIC, paged via 0x7FFD bit 4 = 1)
;   0x4000-0x5AFF  Screen (initially zeros; Film clears it via custom CLS)
;   0x5B00-0x5BFF  Bootstrap (this file)
;   0x5C00-0x5DBF  System vars area (unused by the Film proper)
;   0x5DC0-0xFFF6  Film code + data (41 527 B), spans banks 5/2/0
; =============================================================================

        DEVICE ZXSPECTRUM128

PORT_7FFD       EQU 0x7FFD
PORT_BORDER     EQU 0xFE
ENTRY           EQU 0x5DC0       ; 24000 — Film entry point (= INICIO in game.asm)
STACK_BASE      EQU 0x5DBF       ; 23999 — Film's stack base (= PILA in game.asm)

; --- Configure the 3 slots so cursor crossings land in the right bank -------
        SLOT 1
        PAGE 5
        SLOT 2
        PAGE 2
        SLOT 3
        PAGE 0
        SLOT 1

; --- Initialize screen area to zeros (else SAVESNA leaves it as 0xFF and the
;     emulator shows a white screen for a frame before the Film clears it) ---
        ORG 0x4000
        DEFS 0x1B00, 0                  ; pixels (6144 B) + attrs (768 B) = 0

; --- Bootstrap at 0x5B00 (printer buffer; never used by the Film) -----------
; B+ pass: every PPANT/IMGSOL/IMGJACA is decompressed on-demand to a single
; shared SCREEN_BUF — only fonts and ES cartelas need to live resident.
;
; Boot order:
;   1) Set up stack, black border.
;   2) Page bank 6 in slot 3 → CALL decompress_all (loads CHARSET/CHARX2/
;      CHARESP + PANT1to10_ES into their permanent buffers).
;   3) Page bank 0 in slot 3 (Film's normal config).
;   4) IM 1, EI, JP ENTRY = 0x5DC0 (Film start).
;
; Paging via the canonical `ld bc, 0x7FFD; out (c), a` form: on +2A/+3 the
; paging hardware requires A1=0 + A14=1 + A15=0 (to distinguish 0x7FFD from
; 0x1FFD), so a shorter `out (0xFD), a` with A=0x10 lands on port 0x10FD
; (A14=0) and is silently ignored.
        ORG 0x5B00
boot_start:
        di
        xor a
        out (PORT_BORDER), a            ; black border (matches Film's first instr.)
        ld sp, STACK_BASE
        ld bc, PORT_7FFD
        ld a, 0x16                      ; 48K ROM in slot 0, bank 6 in slot 3
        out (c), a
        call 0xC000                     ; decompress_all (bank 6)
        ld bc, PORT_7FFD                ; (decompress_all clobbers BC)
        ld a, 0x10                      ; 48K ROM in slot 0, bank 0 in slot 3
        out (c), a
        ; --- Music init: page bank 3, INIT player with HL=module, page bank 0 back.
        ; Playback does NOT start here: music_paused boots as 1, so the AY stays
        ; silent through the language menu; wipe_menu (the moment a language is
        ; chosen) does the first music_resume.
        call music_init
        ; --- IM 2 from boot to end. master_im2 calls music_tick every frame and
        ;     then jumps to (current_anim) if non-zero, otherwise to ROM 0x0038.
        ld a, 0xFE
        ld i, a
        im 2
        ei
        jp ENTRY

; --- LANG_FINAL helper at 0x5B55 (printer buffer, bank 5 — fixed in slot 1) -
; Called by game.asm after LANG_OVERLAY returns, while bank 1 is still paged
; in slot 3. Does three EN-mode-only fixups:
;   1) Pages bank 0 back into slot 3 and copies staged TEXTOFIN_EN (65 B from
;      0x5B14) over TEXTOFIN at 0xFFB5 — see LANG_OVERLAY for why staged.
;   2) Patches the `CALL AMPLI_Y` at PATCH_Y to NOP NOP NOP. The big "Y"
;      glyph reads as part of "Y LA HISTORIA" in ES, but is gibberish in
;      front of "THE STORY BEGINS" in EN — so we suppress it.
;   3) Writes 0xFF to the first byte of EX2 (the big "E" tile string in
;      final.asm). IMPREX2 stops on 0xFF, so this turns the call into a
;      no-op. In ES, EX2 + "STE ES EL FINAL..." reads "ESTE ES EL FINAL...";
;      in EN we already say "AND HERE THE STORY..." so we don't want the E.
; Living in bank 5 means the bank switch in step 1 does NOT pull this code
; out from under us — slot 1 is fixed.
; Placed past the 65-byte staging buffer (0x5B14..0x5B54) to avoid overlap.
        ORG 0x5B55
lang_final:
        ; --- 1) page bank 0, copy staged TEXTOFIN_EN over TEXTOFIN ---------
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back in slot 3
        out (c), a
        ld hl, 0x5B14                   ; staged TEXTOFIN_EN
        ld de, TEXTOFIN                 ; = 0xFFB5 in bank 0 (now in slot 3)
        ld bc, 65
        ldir
        ; --- 2) NOP-out PATCH_Y so AMPLI_Y is not called -------------------
        xor a
        ld (PATCH_Y), a                 ; CD → 00
        ld (PATCH_Y+1), a               ; lo  → 00
        ld (PATCH_Y+2), a               ; hi  → 00
        ; --- 3) Make EX2 print as empty (first byte 0xFF stops IMPREX2) ----
        ld a, 0xFF
        ld (EX2), a
        ret

; --- LANG_BLANK + wipe_menu (printer buffer, bank 5 — fixed in slot 1) ----
; LANG_BLANK is a two-line string of spaces with the same AT positions as
; LANG_MENU. wipe_menu loads it into HL and tail-jumps to IMPREC, so the
; visible "1 - ESPANOL / 2 - ENGLISH" gets blanked once a choice is made.
; Living in bank 5 (slot 1, fixed) means the string is readable regardless
; of what is paged into slot 3 right now. The whole indirection saves
; 3 bytes inside game.asm (one CALL vs LD HL+CALL inline) — we need that
; to keep the cursor under the IM2 vector at 0xFDFD.
LANG_BLANK:
        DEFB 22,14,10           ; AT 14,10 (matches LANG_MENU line 1)
        DEFB 16,7,17,0          ; INK 7, PAPER 0 (so the wipe's attrs match)
        DEFM '           '      ; 11 spaces — covers '1 - ESPANOL'
        DEFB 22,16,10           ; AT 16,10 (matches LANG_MENU line 2)
        DEFM '           '      ; 11 spaces — covers '2 - ENGLISH'
        DEFB 255

wipe_menu:
        call music_resume       ; language chosen → first un-pause; Track A
                                ; starts on the next IM2 tick (boot leaves
                                ; music_paused=1 so the menu is silent)
        ld hl, LANG_BLANK
        jp IMPREC               ; tail-jump: IMPREC's RET returns to caller

; show_pantalla + dzx0_standard live in the bank 5 free tail (0x7972+,
; placed AFTER `INCLUDE src/game.asm` below). They cannot live here in
; the bootstrap area: 0x5C00-0x5DBF is the 48K ROM System Vars region
; (the ROM overwrites it at runtime — pantalla negra at boot).

; --- Film code at 0x5DC0 (spans bank 5 → bank 2 → bank 0) -------------------
; Source is now LOCAL to this folder (src/) — divergent from original 48K.
; The 128K version is the base for future feature subversions (multi-language,
; NIRVANA+, AY music, ZX0 compression, etc.). game.asm has had `END INICIO`
; removed in our local copy so the wrapper can append SAVESNA below.
        ORG ENTRY
        INCLUDE "src/game.asm"

; --- Music helpers in bank 2 (slot 2 fixed) at 0xBC00 ----------------------
; Live in slot 2 (fixed) so master_im2 + the per-frame music_tick are always
; reachable regardless of which bank is paged in slot 3. The PT3 player
; itself + song module live in bank 3 (paged in slot 3 only during the
; ~9500 T-states of music_tick — bracketed by DI from the IM2 entry).
;
; Memory budget here ≈ 100 B; full bank 2 free room from 0x9065 to 0xBE00 is
; ~11.7 KB so there is plenty of margin for future SFX or replayer growth.
        SLOT 2
        PAGE 2
        ORG 0xBC00

; current_anim — pointer to the active per-scene IM2 animation handler, or 0
; for "no animation". Patched by RAINM2 / OUTM2 / anim_off and by the per-
; scene installer code in pelicula.asm (formerly the ones writing to 0xFDFE).
current_anim:
        DEFW 0

; music_paused — when non-zero, master_im2 skips the call to music_tick.
; Used by long anim handlers (e.g. SCROL during the jaca scene) where calling
; music_tick mid-handler would either stretch the animation or pitch the music.
; Set via music_pause (which also MUTEs the AY chip), cleared via music_resume.
; Boots as 1 so the language menu is silent: wipe_menu (called the moment a
; language is chosen) does the first music_resume and playback starts there.
music_paused:
        DEFB 1

; master_im2 — single IM2 handler installed at 0xFDFD. Always calls music_tick,
; then dispatches to the current animation handler (or to the ROM IM 1 routine
; at 0x0038 if no animation is set). The original handlers (GOTAS/FUEGO/IM23)
; already end with `JP 0x38` so they chain straight into the ROM frame work
; (FRAMES counter, keyboard scan) and back to RETI.
master_im2:
        ; Save the regs PT3 PLAY clobbers — main set (AF/BC/DE/HL/IX).
        push af
        push bc
        push de
        push hl
        push ix
        ld a, (music_paused)
        or a
        jr nz, .skip_tick
        ; PT3 PLAY uses `EX AF,AF'` heavily and may use the alt BC/DE/HL set.
        ; If we interrupted ROM PRINT (RST 16) during PIJAMA credits, the ROM
        ; uses AF' as scratch for the char being printed; clobbering it from
        ; the IM2 path corrupts the resumed print → attribute/pixel glitches
        ; (e.g. visible around the "SUPER AJO DALTONIUS" credit). Save the
        ; full shadow set around music_tick.
        ex af, af'
        push af
        ex af, af'
        exx
        push bc
        push de
        push hl
        exx
        call music_tick
        exx
        pop hl
        pop de
        pop bc
        exx
        ex af, af'
        pop af
        ex af, af'
.skip_tick:
        pop ix
        pop hl
        pop de
        pop bc
        pop af
        ; Dispatch to current_anim handler (or ROM IM 1) WHILE PRESERVING AF & HL.
        ; The `or l` test clobbers F flags → ROM CLS / BEEPER routines that resume
        ; mid-flag-check after the handler return get the wrong branch → reset.
        ; Save AF and HL on stack, do the test, then restore both before jumping
        ; to the handler via self-modified `jp NN` (no stack tricks needed).
        push af                          ; save AF
        push hl                          ; save original HL
        ld hl, (current_anim)
        ld a, h
        or l
        jr nz, .anim
        ; current_anim = 0 → ROM IM 1 path
        pop hl                           ; restore HL
        pop af                           ; restore AF
        jp 0x0038                        ; ROM IM 1 handler (FRAMES, keyboard, RETI)
.anim:
        ; current_anim != 0 → patch the JP target + restore regs + jump.
        ld (.dispatch_jp+1), hl          ; self-modify the JP NN below
        pop hl                           ; restore HL = original
        pop af                           ; restore AF = original
.dispatch_jp:
        jp 0x0000                        ; <-- patched to jp <current_anim handler>
                                         ; Handler ends with JP 0x38 → ROM → EI; RET

; music_init — page bank 3, CALL the PT3 player INIT with HL=song module
; address, page bank 0 back. Called once from boot_start.
music_init:
        ld bc, PORT_7FFD
        ld a, 0x13                      ; 48K ROM, bank 3 in slot 3
        out (c), a
        ld hl, song_pt3_data
        call 0xC003                      ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back in slot 3
        out (c), a
        ret

; music_tick — page bank 3, CALL the PT3 player PLAY entry, page bank 0 back.
; Called once per IM2 frame from master_im2. The bracketing DI-during-IM2
; ensures we don't get re-entered while bank 3 is paged.
; CLOBBERS AF, BC, DE, HL, IX. Use music_tick_safe (below) when calling from
; non-IM2 context (e.g. inside long-running anim handlers that want to keep
; the AY chip ticking at 50 Hz).
music_tick:
        ld bc, PORT_7FFD
        ld a, 0x13                      ; bank 3 in slot 3
        out (c), a
        call 0xC005                      ; PT3 player START+5 = PLAY one frame
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back in slot 3
        out (c), a
        ret

; music_pause — silence the AY chip and tell master_im2 to stop ticking PT3
; PLAY until music_resume is called. Used around long anim handlers (SCROL
; in jaca scene) where ticking music inside would either stretch the animation
; or pitch-shift the song.
music_pause:
        ld bc, PORT_7FFD
        ld a, 0x13                      ; bank 3 in slot 3
        out (c), a
        call 0xC008                      ; PT3 player START+8 = MUTE (zeros AY volumes)
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back in slot 3
        out (c), a
        ld a, 1
        ld (music_paused), a
        ret

; music_resume — re-enable music ticking. Next IM2 entry will call PT3 PLAY,
; which restores the AY register state from the song's current position.
music_resume:
        xor a
        ld (music_paused), a
        ret

; music_switch_b — replaces music_resume at jaca.asm:12 (post-scroll point).
; INITs the PT3 player on Track B (the "epic" module), then clears the pause
; flag so the next master_im2 fire ticks Track B. Entry assumption: AY is
; already muted (LAJACA called music_pause at jaca.asm:6) and music_paused=1
; — so master_im2 skips music_tick while we're swapping bank 3 in. DI/EI
; bracket guards against an IM2 fire while bank 3 is paged: the IM2 vector
; points at 0xFDFD (trampoline lives in bank 0) and bank 3 contents at that
; offset would jump to PT3 data → crash. CLOBBERS AF, BC, HL.
music_switch_b:
        di
        ld bc, PORT_7FFD
        ld a, 0x13                      ; bank 3 in slot 3
        out (c), a
        ld hl, song_pt3_track_b
        call 0xC003                      ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back in slot 3
        out (c), a
        xor a
        ld (music_paused), a            ; clear pause flag → tick resumes
        ei
        ret

; anim_off — set current_anim = 0. Replacement for the old `IM 1` lines in
; pelicula.asm (which used to disable IM2 when the scene didn't want any
; animation; now we just clear the anim pointer and keep IM 2 alive for music).
anim_off:
        ld hl, 0
        ld (current_anim), hl
        ret

; --- show_pantalla + dzx0_standard in bank 2 tail (0xBE00..0xBFFF) ---------
; Lives in slot 2 (fixed) so it remains reachable while slot 3 swaps between
; banks 6 / 7 / 0. Placed at 0xBE00, well past SCREEN_BUF (ends at 0x9A66)
; and pelicula.asm/final.asm code that crosses from bank 5 into bank 2
; (which extended further than the pre-B+ MEMORY-MAP indicated thanks to
; the 11 inserted `LD A,id; CALL show_pantalla` sites).
;
; Cannot live in bank 5 free tail anymore: pelicula.asm's growth in B+ now
; collides with the previously free 0x7972..0x7DEF region — that region is
; full of pelicula.asm code (FUEGO/BOMBA/IM23/SNAVE etc.) post-insertion.
        SLOT 2
        PAGE 2
        ORG 0xBE00

; show_pantalla(A=id) — decompress one ZX0 blob to SCREEN_BUF on demand.
;   - Blobs split between banks 6 and 7 (~26 KB total). The wrapper pages
;     the right bank in slot 3 per call.
;   - dzx0_standard reads HL (blob src in slot 3) and writes DE (SCREEN_BUF
;     in bank 2, slot 2 fixed). Both source and destination valid throughout.
;   - The OUT to swap slot 3 must execute from a non-slot-3 bank — bank 5
;     is slot 1, fixed, so safe.
show_pantalla:
        di
        push af                          ; save id for second lookup
        ; --- Look up bank in .sp_banks (1 B per entry, indexed by id) ---
        ld d, 0
        ld e, a                          ; DE = id
        ld hl, .sp_banks
        add hl, de
        ld a, (hl)                       ; A = 0x10 | bank
        ld bc, PORT_7FFD
        out (c), a                       ; page bank in slot 3
        ; --- Look up blob src in .sp_addrs (2 B per entry, indexed by id*2) ---
        pop af                           ; A = id
        add a, a                         ; id*2
        ld d, 0
        ld e, a
        ld hl, .sp_addrs
        add hl, de
        ld e, (hl) : inc hl : ld d, (hl) ; DE = blob src
        ex de, hl                        ; HL = blob src (now safe — DE was index)
        ld de, SCREEN_BUF                ; dst in bank 2 (slot 2, fixed)
        call dzx0_standard
        ld bc, PORT_7FFD
        ld a, 0x10                       ; bank 0 back in slot 3 (Film default)
        out (c), a
        ei
        ret

; Per-id blob source addresses. Order MUST match SP_* equates.
.sp_addrs:
        DW PPANT1_ZX0           ; SP_PPANT1   = 0
        DW PPANT2_ZX0           ; SP_PPANT2   = 1
        DW PPANT3_ZX0           ; SP_PPANT3   = 2
        DW PPANT4_ZX0           ; SP_PPANT4   = 3
        DW PPANT5_ZX0           ; SP_PPANT5   = 4
        DW PPANT6_ZX0           ; SP_PPANT6   = 5
        DW PPANT7_ZX0           ; SP_PPANT7   = 6
        DW PPANT8_ZX0           ; SP_PPANT8   = 7
        DW PPANT9_ZX0           ; SP_PPANT9   = 8
        DW IMGSOL_ZX0           ; SP_IMGSOL   = 9
        DW IMGJACA_ZX0          ; SP_IMGJACA  = 10

; Per-id slot-3 paging value (`0x10 | bank`).
.sp_banks:
        DEFB 0x16, 0x16, 0x16   ; SP_PPANT1..3 in bank 6
        DEFB 0x17, 0x17         ; SP_PPANT4..5 in bank 7
        DEFB 0x16, 0x16, 0x16   ; SP_PPANT6..8 in bank 6
        DEFB 0x17               ; SP_PPANT9   in bank 7
        DEFB 0x16, 0x16         ; SP_IMGSOL, SP_IMGJACA in bank 6

; ZX0 standard decompressor (68 B) — Saukas & Urusergi.
        INCLUDE "../../tools/zx0/dzx0_standard.asm"

; --- Bank 6 stash: boot decompressor + most blobs ---------------------------
; B+ pass: only fonts + ES cartelas are decompressed at boot by
; `decompress_all`. PPANT/IMGSOL/IMGJACA are on-demand via `show_pantalla`.
;
; Bank split: ~26 KB of ZX0 blobs don't fit in 16 KB. Most go in bank 6;
; the two largest (PPANT5, PPANT9) overflow into bank 7. The boot decoder
; just calls `dzx0_standard` in bank 5 (slot 1 fixed) — no need for a local
; copy because slot 1 stays paged regardless of what's in slot 3.
        SLOT 3
        PAGE 6
        ORG 0xC000
decompress_all:
        ld ix, .table_resident
.lp_fwd:
        ld l, (ix+0) : ld h, (ix+1)         ; src in bank 6 (currently in slot 3)
        ld a, h : or l : jr z, .done
        ld e, (ix+2) : ld d, (ix+3)         ; dst (slot 1 or slot 2 fixed)
        push ix
        call dzx0_standard                  ; lives in bank 5, slot 1 fixed
        pop ix
        ld bc, 4
        add ix, bc
        jr .lp_fwd
.done:
        ret

.table_resident:
        DW PANT_ES_ZX0,   PANT1
        DW CHARSET_ZX0,   CHARSET
        DW CHARX2_ZX0,    CHARX2
        DW CHARESP_ZX0,   CHARESP
        DW 0, 0

; --- ZX0 forward blobs (bank 6) ---------------------------------------------
; Bank 6 holds resident assets + smaller PPANTs. Total ~14.4 KB / 16 KB.
PANT_ES_ZX0:    INCBIN "build/zx0/PANT1to10_ES.zx0"  ; 1224 B (resident)
CHARSET_ZX0:    INCBIN "build/zx0/CHARSET.zx0"        ;  359 B (resident)
CHARX2_ZX0:     INCBIN "build/zx0/CHARX2.zx0"         ;  588 B (resident)
CHARESP_ZX0:    INCBIN "build/zx0/CHARESP.zx0"        ;  610 B (resident)
IMGSOL_ZX0:     INCBIN "build/zx0/IMGSOL.zx0"         ;  154 B
IMGJACA_ZX0:    INCBIN "build/zx0/IMGJACA.zx0"        ;  532 B
PPANT3_ZX0:     INCBIN "build/zx0/PPANT3.zx0"         ;  659 B
PPANT8_ZX0:     INCBIN "build/zx0/PPANT8.zx0"         ;  955 B
PPANT2_ZX0:     INCBIN "build/zx0/PPANT2.zx0"         ;  989 B
PPANT6_ZX0:     INCBIN "build/zx0/PPANT6.zx0"         ; 1906 B
PPANT1_ZX0:     INCBIN "build/zx0/PPANT1.zx0"         ; 2880 B
PPANT7_ZX0:     INCBIN "build/zx0/PPANT7.zx0"         ; 3537 B

; --- Bank 7 stash: overflow blobs (PPANT4, PPANT5, PPANT9) ------------------
; ~11.6 KB / 16 KB used.
        SLOT 3
        PAGE 7
        ORG 0xC000
PPANT4_ZX0:     INCBIN "build/zx0/PPANT4.zx0"         ; 3766 B
PPANT5_ZX0:     INCBIN "build/zx0/PPANT5.zx0"         ; 4004 B
PPANT9_ZX0:     INCBIN "build/zx0/PPANT9.zx0"         ; 3840 B

; --- English-strings stash in bank 1 (free pageable) ------------------------
; Each block below MUST be byte-length-equal to its ES counterpart so it can
; be LDIR'd in place. Layout positions/colors (control bytes 16/17/22) are
; preserved verbatim; only the DEFM text is translated (with leading/trailing
; spaces to keep the visual centering identical to ES).
        SLOT 3
        PAGE 1
        ORG 0xC000

; PRESA (32 B = 31 chars + 0xFF). Scroll shows chars 0-23 at cols 7-30.
PRESA_EN:
        DEFM '    PRESS A KEY                '
        DEFB 255

; HIST (32 B): control AT 11,6 + INK 9 + PAPER 0 + 24 chars + 0xFF
HIST_EN:
        DEFB 22,11,6
        DEFB 16,9
        DEFB 17,0
        DEFM 'THE STORY BEGINS NOW... '   ; 24 chars
        DEFB 255

; NUBO (83 B): INK 7 + AT 10,6 + 21 chars + AT 12,3 + 25 chars + AT 14,3 + 25 chars + 0xFF
; Line 1 starts with 2nd letter so the giant 'E' from AMPLI_E reads as the
; first letter (parallel to ES: AMPLI_E + 'STAS' = 'ESTAS' → AMPLI_E + 'VERYONE' = 'EVERYONE').
; The phrasing diverges from the literal ES sentence on purpose: a literal
; "ALL THE PEOPLE WHO MADE IT POSSIBLE FOR YOU TO HAVE A GOOD TIME" reads
; awkwardly. Reads as: "EVERYONE WHO HELPED / BUILD THIS GAME HOPES YOU /
; HAVE FUN PLAYING IT."
NUBO_EN:
        DEFB 16,7
        DEFB 22,10,6
        DEFM 'VERYONE WHO HELPED   '          ; 21 chars (giant E + 'VERYONE...' = 'EVERYONE')
        DEFB 22,12,3
        DEFM 'BUILD THIS GAME HOPES YOU'      ; 25 chars
        DEFB 22,14,3
        DEFM 'HAVE FUN PLAYING IT.     '      ; 25 chars
        DEFB 255

; TEXTOFIN (65 B): AT 12,2 + BRIGHT 1 + INK 5 + PAPER 0 + 30 chars + AT 14,5 + 22 chars + 0xFF
; First letter is NOT a big-letter prefix in EN: lang_final pokes 0xFF into
; EX2 to suppress the original E grande, so the visible text must start with
; the 'A' of "AND HERE..." — not "ND HERE..." like the ES counterpart did
; (where the big E + 'STE...' rendered as 'ESTE...').
TEXTOFIN_EN:
        DEFB 22,12,2
        DEFB 19,1,16,5,17,0
        DEFM 'AND HERE THE STORY SIMPLY ENDS'   ; 30 chars (no period — 30 char budget)
        DEFB 22,14,5
        DEFM 'THE REST IS UP TO YOU.'           ; 22 chars
        DEFB 255

; TEXTON (82 B in jaca.asm): AT 22,9 + 0 + 14 chars + AT 8,0 + INK 6 + BRIGHT 1 + 30 chars + AT 10,5 + 23 chars + 0xFF
TEXTON_EN:
        DEFB 22,22,9,0
        DEFM '              '                    ; 14 spaces
        DEFB 22,8,0,16,6,19,1
        DEFM ' A SLENDER FIGURE WALKS ACROSS'    ; 30 chars
        DEFB 22,10,5
        DEFM 'THE BARREN DESERT LANDS'           ; 23 chars
        DEFB 255

; RESETEA (32 B in final.asm): 7 control bytes + 24 chars + 0xFF
RESETEA_EN:
        DEFB $16,$01,$04,$10,$06,$13,$01
        DEFM 'RESET AND LOAD THE GAME '          ; 24 chars
        DEFB 255

; pijama.asm credits T1..T5 EN — ZX0-compressed (was 195 B raw, now 146 B).
; LANG_OVERLAY decompresses this blob to T1 (in pijama.asm, bank 5 fixed)
; using the local dzx0 copy below.
T_EN_ZX0:       INCBIN "build/zx0/T1to5_EN.zx0"  ; 146 B

; pelicula.asm narrative cartelas PANT1..PANT10 EN — ZX0-compressed
; (was 2269 B raw, now 1244 B). LANG_OVERLAY decompresses to PANT1
; (in pelicula.asm, crosses bank 5/2 fixed) using the local dzx0 copy.
PANT_EN_ZX0:    INCBIN "build/zx0/PANT1to10_EN.zx0"  ; 1244 B

; --- Language overlay routine (lives at 0xCB00 in bank 1) -----------------
; Called from game.asm when the user picks ENGLISH. Stages TEXTOFIN_EN, LDIRs
; the small per-line EN strings (HIST/NUBO/PRESA/TEXTON/RESETEA), then ZX0-
; decompresses T_EN_ZX0 (146 B → T1, 195 B) and PANT_EN_ZX0 (1244 B → PANT1,
; 2269 B) using the local dzx0 copy below.
;
; TEXTOFIN special case: it lives at 0xFFB5 in bank 0 (slot 3). While we are
; running this routine, slot 3 holds bank 1 (so the EN strings are readable).
; We can NOT LDIR directly to 0xFFB5 — workaround: stage TEXTOFIN_EN to bank 5
; (slot 1, fixed) and let game.asm finish the copy after paging bank 0 back.
        ORG 0xCB00              ; safely past all EN string blocks
LANG_OVERLAY:
        ; --- Stage TEXTOFIN_EN → bank 5 free area (0x5B14) ---
        LD   HL,0xC093          ; TEXTOFIN_EN in bank 1 (current slot 3 page)
        LD   DE,0x5B14          ; bank 5 (slot 1, fixed)
        LD   BC,65
        LDIR
        ; --- LDIR small per-line EN strings ---
        LD   IX,LANG_TABLE
.lp:
        LD   E,(IX+0)
        LD   D,(IX+1)
        LD   A,D
        OR   E
        JR   Z,.decomp
        LD   L,(IX+2)
        LD   H,(IX+3)
        LD   C,(IX+4)
        LD   B,(IX+5)
        LDIR
        LD   BC,6
        ADD  IX,BC
        JR   .lp
.decomp:
        ; --- ZX0-decompress T_EN_ZX0 → T1 (in pijama.asm, bank 5 fixed) ---
        LD   HL, T_EN_ZX0
        LD   DE, T1
        CALL dzx0_local
        ; --- ZX0-decompress PANT_EN_ZX0 → PANT1 (pelicula.asm, bank 5/2 fixed) ---
        LD   HL, PANT_EN_ZX0
        LD   DE, PANT1
        CALL dzx0_local
        RET

; Language overlay table: dst, src, len triplets (6 bytes each, terminator 0,0,0).
; T1..5 and PANT1..10 are NOT in this table — handled by ZX0 in .decomp above.
; TEXTOFIN is NOT in this table — staged + finished by game.asm.
LANG_TABLE:
        DW PRESA,    0xC000, 32
        DW HIST,     0xC020, 32
        DW NUBO,     0xC040, 83
        DW TEXTON,   0xC0D4, 82
        DW RESETEA,  0xC126, 32
        DW 0,        0,      0         ; end marker

; --- Local copy of dzx0_standard (68 B) -----------------------------------
; Bank 1 is paged into slot 3 during LANG_OVERLAY, so we cannot reach the
; bank-6 copy of dzx0. Carry a local copy here. MODULE prefix avoids a label
; collision with the bank-6 copy of the same file.
dzx0_local:
        MODULE bank1
        INCLUDE "../../tools/zx0/dzx0_standard.asm"
        ENDMODULE

; --- Bank 3: PT3 player + song modules (paged in slot 3 only during music_tick) -
; The Vortex Tracker II PT3 player by Sergey Bulba (2004-2007). Hardcodes
; ORG 0xC000 internally; we honour that and place the modules right after the
; player + its VARS so the player's INIT (called via music_init in bank 2)
; finds the module at song_pt3_data and initialises tone/volume tables in
; the VARS area (between code end and module start). Sized: ~2.2 KB player +
; Track A 5188 B + Track B 2044 B → tail ends 0xE4C0, ~6.8 KB margin.
        SLOT 3
        PAGE 3
        ORG 0xC000

; MODULE encapsulation: the player exports `START`, `INIT`, `PLAY`, `MUTE`,
; `MODADDR`, etc. as global labels, several of which collide with film data
; labels (notably `START` in pijama.asm). Wrapping in MODULE pt3 prefixes
; them all (pt3.START, pt3.INIT, …) so no clash. Our code calls the player
; via the absolute addresses 0xC003 (INIT) and 0xC005 (PLAY) so we don't
; need the label names — only the ORG #C000 inside the include matters.
        MODULE pt3
        INCLUDE "src/music/pt3_play.asm"
        ENDMODULE

; Track A — plays from boot until LAJACA's music_pause (start of jaca-scroll).
; "The Entertainer" (Scott Joplin 1902, public domain), 5188 B. Our own
; sequencing: Mutopia typeset (piece 263, Public Domain) arranged with
; spectrumizer --style chiptune, then re-voiced for dynamics (accented
; melody over a stride-bass plane) + ~94 BPM tempo by
; tools/pt3-remaster-entertainer.py (regenerate + rebuild to change it).
; Loops the whole module (loop pos 0).
song_pt3_data:
song_pt3_track_a:
        INCBIN "src/music/entertainer.pt3"

; Track B — starts at jaca.asm:12 (post-scroll, music_switch_b) and runs to
; end credits. "Bushido (Vispera)" (our own original composition, 2026),
; 2044 B (v5: extended to 18 patterns / ~92 s with a lyrical "recuerdo"
; theme). Samurai-era eve-of-battle cue in the miyako-bushi scale on D:
; shakuhachi + koto + taiko, slow tension build that never breaks into the
; battle. Generated by tools/pt3-compose-bushido.py (regenerate + rebuild
; to change it). Loops the whole module (loop pos 0).
song_pt3_track_b:
        INCBIN "src/music/bushido.pt3"

; Restore bank 0 in slot 3 so SAVESNA records bank 0 as the slot 3 current.
        PAGE 0

; --- Save 128K snapshot ------------------------------------------------------
        SAVESNA "saga-film-128k.sna", boot_start
