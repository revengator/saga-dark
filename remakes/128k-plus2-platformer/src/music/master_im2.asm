; =============================================================================
; SAGA DARK — +2 128K — Platformer — IM 2 + master_im2 + PT3 helpers
; -----------------------------------------------------------------------------
; Adapted from remakes/128k-plus2-dragon/src/music/master_im2.asm (commit
; ccdc880 root-cause fixes). Simpler — no current_anim dispatch (game loop is
; polling-based) and no death-sting state machine. Just: per-frame music_tick
; from IM 2, plus pause/resume/init helpers for transition_routine.
;
; Layout (assembled into bank 2 zero region 0xACDF-0xAF91, fixed in slot 2):
;   0xAD00-0xAE00: IM 2 table (257 B of 0xAD — vector target = 0xADAD)
;   0xADAD       : JP master_im2 (overwrites one slot of the table)
;   0xAE02-?     : master_im2 + music_init/tick/pause/resume + music_paused flag
;   ?-0xAF8F     : free padding (kept zero by the data-tail INCBIN)
;   0xAF90       : SP target (boot_start sets here)
;
; IM 2 mechanics:
;   ld a, 0xAD ; ld i, a ; im 2  →  vector address = I*256 + DataBus.
;   On +2 128K DataBus floats to 0xFF, so vector @ 0xADFF and 0xAE00 — both
;   land in our 0xAD-filled table → JP target = 0xADAD. Even if bus floats
;   to other values, the full 257-B table guarantees JP target = 0xADAD.
;
; Why bank 2 (slot 2 fixed) and not bank 0 (slot 3 default):
;   music_tick pages bank 7 into slot 3 to call the PT3 player. While bank 7
;   is paged, an IM 2 interrupt firing from a vector in bank 0 would read
;   garbage from bank 7 at the vector address → wrong jump. Slot 2 (bank 2)
;   is fixed across the whole platformer lifetime, so the IM 2 vector +
;   trampoline are always reachable.
; =============================================================================

        SLOT 2
        PAGE 2

; --- 1) IM 2 table at 0xAD00-0xAE00 (257 B of 0xAD) ------------------------
        ORG 0xAD00
        DEFS 257, 0xAD

; --- 2) JP master_im2 at vector target 0xADAD ------------------------------
; The IM 2 table sets every vector entry to 0xAD; the CPU reads vector at
; (I=0xAD)*256 + DataBus, so target = 0xAD00 + 0xAD = 0xADAD. We overwrite
; that one slot with a JP.
        ORG 0xADAD
        JP master_im2

; --- 3) master_im2 + helpers at 0xAE02 (after the IM 2 table) --------------
        ORG 0xAE02

; music_paused — when non-zero, master_im2 skips music_tick (AY untouched).
; Starts at 1 so music stays SILENT from boot through the control-select menu;
; phase1 INIT_LEVEL calls music_resume at gameplay start to begin playback.
; (The Phase 1→2 transition silences music via DI/EI around the bank swaps, not
; this flag; it lives in 0xAE02 which the transition's bank-2 LDIR skips, so the
; resumed value survives into Phase 2. music_pause/resume below are the API.)
music_paused:
    IFDEF DEBUG_INTERMEDIATE
        DEFB 0                          ; debug boot jumps straight to transition_routine (no
                                        ; control-select menu, no Phase 1 INIT_LEVEL/resume), so
                                        ; start UN-paused → Phase 1 theme plays on the completion
                                        ; screen, then music_play_track switches it to Mars.
    ELSE
        DEFB 1                          ; start paused → music_resume starts it at gameplay
    ENDIF

; current_7ffd — shadow of the last value written to port 0x7FFD by user code
; (boot_start / transition_routine). 0x7FFD is write-only, so the music helpers
; can't read the slot-3 bank back from the port — they restore from here after
; paging bank 7 for PT3 PLAY. Phase 1 lifetime: bank 0 in slot 3 → shadow=0x10
; (default). Phase 2 lifetime: bank 4 in slot 3 → shadow=0x14 (set by
; transition_finish in bank 4 just before jumping to Phase 2 STAR).
current_7ffd:
        DEFB 0x10                       ; bank 0 in slot 3 — boot default

; master_im2 — single IM 2 handler. Calls music_tick when not paused, then
; jumps to ROM 0x0038 (IM 1 frame handler: FRAMES++, keyboard scan, EI, RET).
; Preserves full register set (main + shadow) because PT3 PLAY uses
; EX AF,AF' and EXX heavily.
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
        ; ROM IM 1 (0x0038: FRAMES++, keyboard scan) addresses every sysvar via
        ; (IY+n) and assumes IY=0x5C3A. The unified build keeps IRQs ON for music,
        ; so an IM 2 can fire mid-collision when the engine's RCPE/SWAP has left
        ; IY = the enemy sprite box → the ROM would write sysvars over the sprite
        ; box → RAM corruption + reset (#17). Force the correct IY for the ROM,
        ; then restore the interrupted IY so no collision check is disturbed.
        push iy                         ; save interrupted code's IY
        ld iy, 0x5C3A                    ; ROM sysvar base
        call 0x0038                     ; ROM IM 1 (FRAMES++, kbd scan, EI, RET)
        pop iy                          ; restore interrupted IY
        ret                             ; → interrupted code (IRQs re-enabled by ROM EI)

; music_init — boot entry: INIT the PT3 player on the Phase 1 track and leave it
; PAUSED (music_paused stays 1 = its DEFB), so master_im2 skips music_tick → no
; PT3 PLAY → AY untouched (volumes 0 at .sna load = SILENT) through the control-
; select menu. Phase 1 gameplay start (INIT_LEVEL → hud_then_music) resumes it.
; Called once from boot_start.
;
; music_play_track — PER-LEVEL music switch (HL = a bank-7 PT3 module): RESUMES
; and re-INITs the player on that track. Used by transition_routine to switch to
; the Phase 2 track; future Level 5 entry can call it the same way. MUST be CALLed
; from a fixed slot (1/2), never slot 3 (it pages bank 7 into slot 3).
;
; music_play_track — label in the middle of music_init (zero extra bytes): the
; shared "page bank 7, INIT(HL), restore the caller's slot-3 bank" body, entered
; with HL already set to a bank-7 PT3 module. Does NOT touch music_paused, so it
; relies on music already being resumed (it is, by phase1 INIT_LEVEL, by the time
; the Phase 1→2 transition calls it). MUST be CALLed from a fixed slot (1/2).
music_init:
        ld hl, song_pt3_data            ; Phase 1 track (declared in main.asm bank 7)
music_play_track:
        ld bc, PORT_7FFD
        ld a, 0x17                      ; 48K ROM in slot 0, bank 7 in slot 3
        out (c), a
        call 0xC003                     ; PT3 player START+3 = INIT(HL=module)
        ld bc, PORT_7FFD
        ld a, (current_7ffd)            ; restore caller's slot-3 bank
        out (c), a
        ret

; music_tick — page bank 7, CALL PT3 PLAY (one frame), page bank 0 back.
; Called once per IM 2 frame from master_im2.
music_tick:
        ld bc, PORT_7FFD
        ld a, 0x17                      ; bank 7 in slot 3
        out (c), a
        call 0xC005                     ; PT3 player START+5 = PLAY one frame
        ld bc, PORT_7FFD
        ld a, (current_7ffd)            ; restore caller's slot-3 bank
        out (c), a
        ret

; music_pause — mute AY + set pause flag. Called by transition_routine before
; the bank-swap dance (slot 3 cycles through banks 1/3/4, so music_tick can't
; safely page bank 7 in that window).
music_pause:
        ld bc, PORT_7FFD
        ld a, 0x17                      ; bank 7 in slot 3
        out (c), a
        call 0xC008                     ; PT3 player START+8 = MUTE (zeros AY volumes)
        ld bc, PORT_7FFD
        ld a, (current_7ffd)            ; restore caller's slot-3 bank
        out (c), a
        ld a, 1
        ld (music_paused), a
        ret

; hud_then_music — Phase 1 INIT_LEVEL redirects its final HUD-paint CALL here
; (zero-shift trampoline) so playback starts the instant the control-select menu
; + level init finish, instead of from boot. Does the HUD paint it replaced, then
; FALLS THROUGH into music_resume to unpause. A=0 on return (harmless: STAR's
; PREAMBLE doesn't read it).
hud_then_music:
        call 0xD61B                     ; the HUD paint INIT_LEVEL used to call directly
        ; fall through into music_resume

; music_resume — re-enable music ticking. Next IM 2 fire calls PT3 PLAY,
; which restores AY register state from the song's current position.
music_resume:
        xor a
        ld (music_paused), a
        ret

MUSIC_HELPERS_END:
        ASSERT MUSIC_HELPERS_END <= 0xAE80      ; must not collide with hit_sfx_core below

; --- hit-confirm SFX core (#17) — distinctive descending two-tone "dewp" -----
; Beeper (port 0xFE) hit confirm. ORG-pinned at 0xAE80 so Phase 2 can call it by
; the same fixed address: the 0xAD00-0xAEFF window is PRESERVED across the
; Phase 1 -> 2 transition (the bank3->2 LDIR skips it), so this ONE core serves
; both phases (Phase 2 has no master_im2 of its own — it inherits this copy).
; Sits far below the live stack (Phase 1 idle low-water ~0xAF6C; this ends
; ~0xAE9E, >0xC0 B of headroom. Phase 2 runs SP=0x5BFF, no conflict).
;
; Why a CUSTOM core instead of reusing SONI1_LP: the engine's SONI family is
; hardwired to one pitch (0x14, ~6 kHz), so every engine blip sounds the same
; and the hit confirm was indistinct. This sweeps two pitches (high -> low) for
; an unmistakable "you hit it" zap. Pitches/durations below are tunable by ear.
;
; Entry: no params (self-contained). Clobbers AF, BC. IY-safe via master_im2's
; global IY guard. Reached through HIT_BEEP_CORE from hit_beep (latched 1/contact).
HIT_SFX_T1_PITCH    EQU 0x18        ; tone 1 half-period delay (smaller = higher)
HIT_SFX_T1_CYC      EQU 0x18        ; tone 1 length in square-wave cycles
HIT_SFX_T2_PITCH    EQU 0x30        ; tone 2 (lower pitch -> descending "dewp")
HIT_SFX_T2_CYC      EQU 0x14        ; tone 2 length
        ORG 0xAE80
hit_sfx_core:
        ld c, HIT_SFX_T1_PITCH
        ld b, HIT_SFX_T1_CYC
        call .tone
        ld c, HIT_SFX_T2_PITCH
        ld b, HIT_SFX_T2_CYC
        ; fall through into .tone; its RET then returns to hit_beep's caller
.tone:                              ; B = cycles, C = half-period delay
        ld a, 0xF8                  ; speaker high (border black, same as SONI)
        out (0xFE), a
        push bc
        ld b, c
.th:    djnz .th
        pop bc
        xor a                       ; speaker low
        out (0xFE), a
        push bc
        ld b, c
.tl:    djnz .tl
        pop bc
        djnz .tone
        ret
HIT_SFX_CORE_END:
        ASSERT HIT_SFX_CORE_END <= 0xAEB0       ; stay far below the Phase 1 stack

; --- player-damage border flash (#19-ish "more visible") ---------------------
; dmg_border — called ONCE per frame from the canonical MAIN loop (both phases).
; Makes the border flash red while the player is taking damage (and a short
; afterglow after). Self-contained in bank 2 so the single copy serves both
; phases (preserved by the transition LDIR's 0xAD00-0xAEFF skip). ORG-pinned at
; 0xAEA0 so Phase 2 (no master_im2 of its own) can CALL it by fixed address.
;
; Detection without touching the byte-packed per-phase code: watch the player
; energy counter NU1 — MUERTE decrements it on every contact frame, so a drop
; since last frame == "took damage". NU1 lives at a DIFFERENT address per phase
; (P1 0xA89A, P2 0xA8EC), so pick the right one from current_7ffd (0x10 = bank 0
; = Phase 1; 0x14 = bank 4 = Phase 2). This build only assembles Phase 1's NU1
; symbol, so Phase 2's address is the literal DMG_NU1_P2 (asserted in v3 build).
;
; Note: in the INFINITE_ENERGY cheat build MUERTE never decrements NU1, so this
; never flashes — test damage feedback with the NORMAL build (you can't observe
; damage while invincible anyway). Clobbers AF, HL. IY-safe via master_im2's
; global guard (this runs from the main loop, not an IRQ, but IRQs are on).
DMG_FLASH_N         EQU 0x08        ; afterglow frames once contact stops (tunable)
DMG_BORDER_RED      EQU 0x02        ; port 0xFE bits 0-2 = red border
DMG_NU1_P2          EQU 0xA8EC      ; Phase 2's NU1 (asserted in dark2-engine-v3.asm)
        ORG 0xAEA0
dmg_border:
        ld a, (current_7ffd)
        cp 0x14                     ; 0x14 = Phase 2 (bank 4 in slot 3)
        ld hl, NU1                  ; default: Phase 1 energy (LD preserves Z flag)
        jr nz, .have_nrg
        ld hl, DMG_NU1_P2           ; Phase 2 energy
.have_nrg:
        ld a, (hl)                  ; current energy
        ld hl, dmg_nrg_shadow
        cp (hl)
        ld (hl), a                  ; shadow := current energy
        jr nc, .flash_tick          ; energy didn't drop -> no new damage
        ld a, DMG_FLASH_N           ; energy dropped -> (re)arm the flash
        ld (dmg_flash), a
.flash_tick:
        ld a, (dmg_flash)
        or a
        jr z, .border_black
        dec a
        ld (dmg_flash), a
        ld a, DMG_BORDER_RED
        jr .set_border
.border_black:
        xor a                       ; black border (the game's normal border)
.set_border:
        out (0xFE), a
        ; fall through into player_face (the per-frame player-facing hook)

; --- player_face — per-frame: flip the player sprite to match L/R movement ---
; The engine already mirrors any sprite IN PLACE (SPEJO, reached via SDERE/SIZQUI,
; tracking facing in descriptor+6) and EVERY enemy uses it. The player is TWO
; queued sprites — TABLA1 (body) + TABLA2 (legs), each with frame count at +7 (=5)
; so both are flip-ready; the player movement code simply never called the flip
; (that — flipping a 2-sprite player and keeping body+legs aligned — is what was
; "abandoned"). We drive it here, chained (fall-through) off dmg_border, the one
; per-frame hook we own in bank 2 (preserved into Phase 2 by the 0xAD00-0xAEFF
; LDIR skip, so it runs in both phases). On a horizontal key we flip BOTH the
; body and the legs via the engine's SDERE/SIZQUI; SPEJO only runs on the frame
; the direction actually changes (otherwise a cheap compare+RET). Because
; SDERE/SIZQUI set descriptor+6, the spear (reads TABLA1+6) auto-throws to the
; faced side. 0x6A87 = right key, 0x6A88 = left (redefinable — swap if reversed).
player_face:
        ld a, (0x6A87)
        call COMPR                  ; Z = pressed
        jr z, .pf_right
        ld a, (0x6A88)
        call COMPR
        jr nz, .pf_corr             ; no L/R key -> still recenter (phase may change)
.pf_left:
        ld ix, TABLA1
        call SIZQUI                 ; flip body left (mirror only if changed)
        ld ix, TABLA2
        call SIZQUI                 ; flip legs left
        jr .pf_corr
.pf_right:
        ld ix, TABLA1
        call SDERE                  ; flip body right
        ld ix, TABLA2
        call SDERE                  ; flip legs right
.pf_corr:
    IFDEF UNIFIED_PLATFORMER
        jp pf_correct               ; body-X recenter. dmg_border (this chain) is now called
                                    ; from the loop BEFORE BBBBBB, so pf_correct sees the anim
                                    ; phase ANTIC2 just set and the facing the flip just set —
                                    ; the drawn frame and its offset finally agree.
    ELSE
        ret
    ENDIF
dmg_flash:
        DEFB 0                      ; >0 while flashing; counts down per frame
dmg_nrg_shadow:
        DEFB 0                      ; last frame's NU1 (0 = primed, no false flash)
DMG_BORDER_END:
        ASSERT DMG_BORDER_END <= 0xAEFF         ; bank-2 49 B hole (0xAECF-0xAEFF); Phase 1 stack is 0xAF00+
