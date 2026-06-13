; =============================================================================
; SAGA DARK — +2 128K — Dragon — IM 2 + master_im2 + PT3 helpers
; -----------------------------------------------------------------------------
; F1: infrastructure scaffold. master_im2 always JPs to ROM 0x0038 (IM 1 frame
; handler — FRAMES++, keyboard scan) so the dragon behaves identically to its
; IM 1 baseline. music_paused defaults to 1, so music_tick is never called —
; safe even though PT3 player + module are not yet bundled (F2 lands those).
;
; Layout (assembled into bank 5 zero gap reserved by src/sysvars-data.asm):
;   0x7777-0x7779: JP master_im2 (IM 2 vector target)
;   0x777A-0x77FF: DEFS 0 (134 B unused — outside the 257-B IM 2 table)
;   0x7800-0x7900: 257 B 0x77 (IM 2 table — I=0x78, target = 0x7777)
;   0x7901-...   : master_im2 + music_tick/init/pause/resume
;
; IM 2 mechanics:
;   ld a, 0x78 ; ld i, a ; im 2  →  vector address = I*256 + DataBus.
;   On +2 128K DataBus is 0xFF (bus floating), so vector @ 0x78FF and 0x7900,
;   both 0x77 → JP target = 0x7777. Even if bus floats to other values, the
;   full 257-B 0x77 table guarantees JP target stays at 0x7777.
;
; Why I=0x78 and target 0x7777 (not the film's I=0xFE / target 0xFDFD):
;   The film's table at 0xFE00 / target 0xFDFD lives in bank 0 (slot 3),
;   which paged out during music_tick would break the IM 2 vector chain.
;   The dragon's bank 2 has no free tail and bank 0 is paged out by
;   music_tick too. Bank 5 (slot 1, fixed) is the only stable home, and
;   the only large zero gap there is 0x61A9-0x812E (sysvars-data fill).
;   We pick I=0x78 to land the table + target + handler inside that gap.
; =============================================================================

; --- 1) JP master_im2 at 0x7777 (the IM 2 vector target) -------------------
        ORG 0x7777
        jp master_im2

; --- 2) IM 2 table at 0x7800-0x7900 (257 B 0x77) ---------------------------
        ORG 0x7800
        DEFS 257, 0x77

; --- 3) master_im2 + music_* helpers at 0x7901 -----------------------------
        ORG 0x7901

; music_paused — when non-zero, master_im2 skips music_tick.
; F2: PT3 player + Mountain King module bundled in bank 3. boot_start calls
; music_init which clears this flag. Defaulting it to 0 here is redundant
; (music_init does it) but documents intent.
music_paused:
        DEFB 0

; victory_mode — when non-zero, music_tick takes a simplified PLAY-only path:
; no D_DRAC dynamic tempo, no death-sting state machine. Set to 1 by
; victory_handler while the victory PT3 module is loaded; cleared before
; returning to the main game. Lets the victory module play at its own
; native speed regardless of D_DRAC's value at the moment of winning.
victory_mode:
        DEFB 0

; master_im2 — single IM 2 handler. Calls music_tick when not paused, then
; jumps to ROM 0x0038 (IM 1 frame handler: FRAMES++, keyboard scan, EI, RET).
; Preserves full register set (main + shadow) because PT3 PLAY uses
; EX AF,AF' and EXX heavily — and the ROM frame handler may run mid-RST 16
; PRINT inside the dragon's title-typewriter loop (which uses AF' as the
; char-being-printed scratch).
master_im2:
        push af
        push bc
        push de
        push hl
        push ix
        ld a, (music_paused)
        or a
        jr nz, .skip_tick
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
        jp 0x0038                       ; ROM IM 1 handler (chains EI; RET)

; music_tick — per-frame music handler. Three branches:
;
;   (A) death_state == 0xFF → jingle finished, stay silent.
;   (B) death_state != 0   → death sting in progress, advance state machine
;                            (1 frame per call → non-blocking; runs in parallel
;                            with the game's death animation).
;   (C) death_state == 0:
;        - read D_DRAC.
;        - D_DRAC == 0 → kick off the death sting (call start_death_sting).
;        - D_DRAC != 0 → F4 dynamic-tempo path:
;            >= 30 → delay 5 (~70 BPM, calm — title screen / D_DRAC=32)
;            20-29 → delay 3 (~117 BPM, tense — dragon visible)
;            10-19 → delay 2 (~175 BPM, frenetic)
;             < 10 → delay 1 (~350 BPM, panic)
;          Page bank 3, write pt3.Delay (0xC545), CALL PT3 PLAY (0xC005),
;          restore bank 0.
music_tick:
        ld a, (victory_mode)
        or a
        jr nz, .victory_play_only       ; victory PT3 → PLAY at native tempo
        ld a, (death_state)
        or a
        jr nz, .death_branch            ; jingle in progress or finished
        ; --- death_state == 0: idle music path
        ld a, (0xA0F0)                  ; D_DRAC
        or a
        jp z, start_death_sting         ; D_DRAC=0 → kick off the sting
        ; --- Alive path: page bank 3, dynamic-tempo update, PLAY one frame.
        ld bc, PORT_7FFD
        ld a, 0x13                      ; bank 3 in slot 3
        out (c), a
        ld a, (0xA0F0)
        ld b, 1                         ; default = panic (< 10)
        cp 10
        jr c, .have_delay
        ld b, 2                         ; 10-19 = frenetic
        cp 20
        jr c, .have_delay
        ld b, 3                         ; 20-29 = tense
        cp 30
        jr c, .have_delay
        ld b, 5                         ; >= 30 = calm (title screen)
.have_delay:
        ld a, b
        ld (0xC545), a                  ; pt3.Delay
        call 0xC005                     ; PT3 PLAY one frame
        ld bc, PORT_7FFD
        ld a, 0x10                      ; bank 0 back
        out (c), a
        ret
.death_branch:
        cp 0xFF
        ret z                           ; jingle done → stay silent
        jp advance_death_sting          ; advance one frame of the jingle
.victory_play_only:
        ; Victory PT3 path: page bank 3, PLAY one frame at the module's
        ; native speed (Delay was set by INIT), restore bank 0.
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        call 0xC005                     ; PT3 PLAY
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        ret

; music_init — page bank 3, CALL PT3 INIT(HL=module), page bank 0 back.
; F1: never called from boot. F2 wires this into the bootstrap or INICI2.
music_init:
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        ld hl, song_pt3_data
        call 0xC003                     ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        xor a
        ld (music_paused), a            ; clear pause flag → ticks resume
        ret

; music_pause — silence AY and tell master_im2 to skip music_tick.
music_pause:
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        call 0xC008                     ; PT3 player START+8 = MUTE
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        ld a, 1
        ld (music_paused), a
        ret

; music_resume — re-enable music ticking. Next IM 2 fire calls PT3 PLAY,
; which restores AY register state from the song's current position.
music_resume:
        xor a
        ld (music_paused), a
        ret

; ============================================================================
; End-of-game handlers (v5): death sting + victory screen.
;
; Both are reached from patched sites in the dragon.asm ENDED routine:
;   0x9C48  JP z,death_handler    (player lost — LA26EH == 0)
;   0x9C4B  JP victory_handler    (player won  — LA26EH != 0)
;
; Both pause PT3 (music_paused=1 + MUTE), then:
;   death_handler   — waits for the death sting state machine to finish,
;                     then re-inits music and JPs INICIO.
;   victory_handler — paints the title image, typewriter-prints the
;                     congratulations text, plays the AY fanfare, waits for
;                     a keypress, re-inits music and JPs INICIO.
; ============================================================================

; death_handler — called from patched ENDED (0x9C48) once the game-side
; death animation finishes and OK==0. By this point the music_tick state
; machine already started the death sting (when D_DRAC first hit 0) and may
; still be playing it. Block here until the sting finishes (death_state ==
; 0xFF or has been reset to 0), then re-init music and restart.
death_handler:
.wait_for_jingle:
        ld a, (death_state)
        cp 0xFF
        jr z, .jingle_done
        or a
        jr z, .jingle_done
        halt                            ; advance one frame (music_tick runs the SM)
        jr .wait_for_jingle
.jingle_done:
        xor a
        ld (death_state), a             ; reset for next death
        ld (death_frames), a
        call init_main_music
        jp INICIO

; victory_handler — reached from the patched ENDED win path (0x9C4B). Builds
; the victory screen, INITs the victory PT3 module (which plays via music_tick
; under victory_mode), waits for the title key, switches back to the main
; PT3 module and returns to the title screen.
victory_handler:
        ld a, 1
        ld (music_paused), a
        call mute_pt3
        ; --- Title image (offscreen buffer 0x8140) → screen 0x4000.
        ld hl, 0x8140
        ld de, 0x4000
        ld bc, 0x1B00
        ldir
        ; --- Clear the bottom third of the screen so the congratulations text
        ;     reads on a clean black panel instead of overlapping the painted
        ;     "TEO, THE DRAGON" caption that sits in the title's lower third.
        ;     Bottom-third bitmap: 0x5000-0x57FF (2048 B) → 0.
        ;     Bottom-third attrs:  0x5A00-0x5AFF (256 B) → PAPER 0, INK 7.
        ld hl, 0x5000
        ld d, h
        ld e, l
        inc de
        ld bc, 2047
        ld (hl), 0
        ldir
        ld hl, 0x5A00
        ld d, h
        ld e, l
        inc de
        ld bc, 255
        ld (hl), 0x07
        ldir
        ; --- Switch the PT3 player onto the victory module and enable the
        ;     play-only branch in music_tick so it runs at its native tempo
        ;     (ignoring D_DRAC which is meaningless on the win screen).
        ld a, 1
        ld (victory_mode), a
        call music_init_victory         ; INITs victory.pt3 and clears music_paused
        ; --- Congratulations text, typewriter-printed via the game's own
        ;     routine at 0x9EAF (opens channel 2; per char: RST 16, beep,
        ;     1-frame HALT). The victory PT3 plays under it.
        ld hl, victory_text
        call 0x9EAF
        ; --- Hold the victory screen until the player presses the title
        ;     key (0x1D) — same key INICI2 waits on. PT3 loops meanwhile.
.wait_key:
        ld a, 0x1D
        call COMPR
        jr nz, .wait_key
        ; --- Pause + mute, leave victory mode, switch back to main module.
        ld a, 1
        ld (music_paused), a
        call mute_pt3
        xor a
        ld (victory_mode), a
        call init_main_music
        jp INICIO

; victory_text — typewriter string for the 0x9EAF print routine. ZX print
; control codes: 0x16 row col = AT, 0x10 n = INK, 0x11 n = PAPER,
; 0x12 n = FLASH, 0x13 n = BRIGHT. Terminator: 0xFF. Same structure as the
; game's original L9C6CH ("PULSA PLAY") string.
victory_text:
        DEFB 0x16, 18, 10               ; AT row 18, col 10 (bottom third)
        DEFB 0x13, 1                    ; BRIGHT 1
        DEFB 0x12, 0                    ; FLASH 0
        DEFB 0x10, 6                    ; INK 6 (yellow)
        DEFB 0x11, 0                    ; PAPER 0 (black)
        DEFB "FELICIDADES!"
        DEFB 0x16, 20, 4                ; AT row 20, col 4 (bottom third)
        DEFB 0x10, 7                    ; INK 7 (white)
        DEFB "HAS ESCAPADO DEL DRAGON"
        DEFB 0xFF                       ; terminator

; --- Death sting periods — used by the state machine in music_tick.
; Classic sad trombone: Bb4→A4→Ab4→G4 chromatic descent. G4 held ~700 ms.
; Period = 1773400 / (16 * freq_Hz).
death_periods:
        DEFB 0xEE, 0x00, 8              ; 1. Bb4 (466 Hz) — "na"
        DEFB 0xFC, 0x00, 8              ; 2. A4  (440 Hz) — "na"
        DEFB 0x0B, 0x01, 8              ; 3. Ab4 (415 Hz) — "na"
        DEFB 0x1B, 0x01, 35             ; 4. G4  (392 Hz) — "naaaaaa" (sustained)
DEATH_NUM_NOTES EQU 4

; --- Death sting state machine ------------------------------------------
; death_state:   0=idle, 1-4=current note (1-based), 0xFF=jingle finished.
; death_frames:  frames remaining in the current note.
death_state:    DEFB 0
death_frames:   DEFB 0

; start_death_sting — called from music_tick when D_DRAC drops to 0 and
; death_state == 0. Mutes PT3, sets up AY channel A (tone, max amplitude),
; loads the first note's period, sets state=1. Returns; subsequent music_tick
; calls advance the state machine one frame at a time.
start_death_sting:
        call mute_pt3
        ; --- Mixer: tone A only.
        ld bc, 0xFFFD
        ld a, 7
        out (c), a
        ld bc, 0xBFFD
        ld a, 0xFE
        out (c), a
        ; --- Amplitude A = 15.
        ld bc, 0xFFFD
        ld a, 8
        out (c), a
        ld bc, 0xBFFD
        ld a, 15
        out (c), a
        ; --- Load note 1 (period at death_periods+0).
        ld hl, death_periods
        call ay_write_note
        ld a, 1
        ld (death_state), a
        ret

; advance_death_sting — called from music_tick when death_state in 1..4.
; Decrements frames; on rollover, advances to next note (or finishes).
advance_death_sting:
        ld a, (death_frames)
        dec a
        ld (death_frames), a
        ret nz                          ; still in current note
        ; --- Move to next note.
        ld a, (death_state)
        inc a
        cp DEATH_NUM_NOTES + 1          ; 5 = past last note
        jr nc, .finish_jingle
        ld (death_state), a
        ; --- HL = death_periods + (state-1) * 3
        dec a
        ld c, a
        add a, a                        ; ×2
        add a, c                        ; ×3
        ld c, a
        ld b, 0
        ld hl, death_periods
        add hl, bc
        call ay_write_note
        ret
.finish_jingle:
        ld a, 0xFF
        ld (death_state), a
        ; --- Silence channel A (amplitude 0).
        ld bc, 0xFFFD
        ld a, 8
        out (c), a
        ld bc, 0xBFFD
        xor a
        out (c), a
        ret

; ay_write_note — HL points to 3 bytes (period_lo, period_hi, frames).
; If period == (0,0): write amplitude 0 (REST). Otherwise: write amplitude 15
; and the period to AY regs 0+1. Stores frames in death_frames.
ay_write_note:
        ld a, (hl)                      ; period lo
        inc hl
        ld d, a
        ld a, (hl)                      ; period hi
        inc hl
        ld e, a
        ld a, (hl)                      ; frames
        inc hl
        ld (death_frames), a
        ; --- Check for rest (period == 0,0)
        ld a, d
        or e
        jr z, .write_rest
        ; --- Tone: amplitude A = 15
        ld bc, 0xFFFD
        ld a, 8
        out (c), a
        ld bc, 0xBFFD
        ld a, 15
        out (c), a
        ; --- AY reg 0 (period lo)
        ld bc, 0xFFFD
        ld a, 0
        out (c), a
        ld a, d
        ld bc, 0xBFFD
        out (c), a
        ; --- AY reg 1 (period hi)
        ld bc, 0xFFFD
        ld a, 1
        out (c), a
        ld a, e
        ld bc, 0xBFFD
        out (c), a
        ret
.write_rest:
        ; --- Silence channel A by zeroing its amplitude.
        ld bc, 0xFFFD
        ld a, 8
        out (c), a
        ld bc, 0xBFFD
        xor a
        out (c), a
        ret

; --- mute_pt3 — page bank 3, MUTE (zeros AY volumes), restore bank 0 ----
mute_pt3:
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        call 0xC008                     ; PT3 player START+8 = MUTE
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        ret

; --- init_main_music — page bank 3, re-INIT player on main module,
;     restore bank 0, clear music_paused. Called after a jingle so the next
;     game restart has music ready.
init_main_music:
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        ld hl, song_pt3_data
        call 0xC003                     ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        xor a
        ld (music_paused), a
        ret

; --- music_init_victory — switch to the victory PT3 module. Same paging
;     dance as init_main_music but with HL=victory_pt3_data. Called from
;     victory_handler instead of the previous mute_pt3 + fanfare AY combo.
music_init_victory:
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        ld hl, victory_pt3_data
        call 0xC003                     ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, 0x10
        out (c), a
        xor a
        ld (music_paused), a
        ret

; song_pt3_data and victory_pt3_data are defined in main.asm where their
; .pt3 INCBINs sit inside bank 3.
