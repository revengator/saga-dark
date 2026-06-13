; =============================================================================
; SAGA DARK — +2 128K — Platformer (Dark 1 + Dark 2 on a UNIFIED engine)
; -----------------------------------------------------------------------------
; Single motor — Level A (2026-05-25). Phase 1 = canonical hook-mode loop in the
; 0xA60C enemy hole + converged state vars at 0xA6A1 + PANTAL preload patch.
; Phase 2 is stashed as a converged binary image (build/phase2-converged.bin,
; built off phase2-build.asm) in banks 1/3/4 — drops the cassette `dark2.sna`
; runtime dependency.
;
; Boot: pages bank 0 in slot 3, patches PICHO2 (= CARGA stub in unified mode)
; to JP transition_routine, jumps to STAR (Phase 1 canonical loop entry,
; in the 0xA60C hole). When the engine fires CARGA at end of Phase 1
; (FRAME_CHECK returns A=2 on DAMA1==0x14), the patched stub jumps to the
; transition routine, which LDIRs bank 1 → bank 5, bank 3 → bank 2, pages
; bank 4 into slot 3, then JPs 0xA7AA (Phase 2's canonical STAR address —
; same layout because Phase 2 vars/loop also live in the canonical block).
;
; Memory map (Phase 1 active; identical layout in Phase 2 after transition):
;   0x0000-0x3FFF  ROM (48K Spectrum BASIC, paged via 0x7FFD bit 4 = 1)
;   0x4000-0x5AFF  Screen pixels + attrs (bank 5, fixed)
;   0x5B00-0x5BFF  Bootstrap + transition_routine (NEVER overwritten by LDIR)
;   0x5C00-0x6A9A  Pre-loaded data tables + patched PANTAL VAR0 refs
;   0x6A9B-0xA60B  Engine motor + Phase N enemies
;   0xA60C-0xA6A0  Canonical hook-mode loop (in the hole the enemies leave)
;   0xA6A1-0xA7A9  Canonical shared state-var block (engine/state.inc map)
;   0xA7AA-onward  Per-phase hooks/e123/bichos/handlers/sound (floats; ASSERT
;                  guards against overrun of pinned data-tail at 0xAAA1)
;   0xAAA1-0xD605  Data tail (pinned; absolute pointers in VAR0/T0 target it)
;   0xD606-0xE695  HUD + faces + cara-perso (pinned)
;   0xE696-0xFFFF  Extra data (TEF1, RAM buffers)
;
; Banks at SAVESNA time:
;   bank 5/2/0: Phase 1 (active at boot, default slot mapping)
;   bank 1/3/4: Phase 2 stash (linear 0x4000-0xFFFF of phase2-converged.bin)
;   bank 6/7:   free (reserved for Phase 5, Super Film extensions)
; =============================================================================

        DEVICE ZXSPECTRUM128

PORT_7FFD       EQU 0x7FFD
PORT_BORDER     EQU 0xFE

    IFNDEF INFINITE_ENERGY
INFINITE_ENERGY EQU 0
    ENDIF

; --- CONVERGED var layout: state vars at the canonical (high-zone) addresses.
; POD4_VAR/ABUELO_OFF are offsets into VAR_PRE with no labels of their own, so
; they are EQU'd to canonical here; every other state var is a label in
; levels/phase1/data.asm and lands on its canonical address when the block is
; placed at 0xA6A1 below (uniform +0x95 from the Dark 1 originals).
POD4_VAR        EQU 0xA6A2
ABUELO_OFF      EQU 0xA6A7
        INCLUDE "levels/phase1/defines.inc"

; --- Slot/page map: slot1=bank5, slot2=bank2, slot3=bank0 -------------------
        SLOT 1
        PAGE 5
        SLOT 2
        PAGE 2
        SLOT 3
        PAGE 0

; --- Bank 5: 0x4000-0x5AFF screen + 0x5B00 bootstrap + 0x5C00 pre-loaded ----
        SLOT 1
        ORG 0x4000
        INCBIN "levels/phase1/data/screen.bin"          ; 6912 B

        ORG 0x5B00
boot_start:
        di
    IFDEF DEBUG_INTERMEDIATE
        ld a, 6                                         ; YELLOW border = boot_start ran (debug only)
    ELSE
        xor a                                           ; black border
    ENDIF
        out (PORT_BORDER), a
        ; Stack at 0xAF90 — high in bank 2 (slot 2, fixed), inside the 691-byte
        ; zero region 0xACDF-0xAF91 of the pinned data tail. Phase 1's runtime
        ; doesn't reset SP itself, so it inherits this all the way through
        ; gameplay; original Dark 1 .sna runs with SP=0xAFAC nearby, confirming
        ; this region is stack-safe. **MUST NOT be in 0x5B00-0x5BFF**: Phase 1
        ; CALL/PUSH chains dip below 0x5BFF and corrupt print_str (which lives
        ; at 0x5BCE-0x5BFA); the corruption only manifests at level-end when
        ; intermediate_screen tries to draw "ENHORABUENA / NIVEL 1…" and the
        ; bytecode-replaced print_str runs garbage. Symptom: black screen with
        ; no text + Phase 2 corrupto + reset.
        ld sp, 0xAF90
        ld bc, PORT_7FFD
        ld a, 0x10                                      ; 48K ROM in slot 0, bank 0 in slot 3
        out (c), a

        ; --- Patch CARGA (= PICHO2 stub, 3 bytes DI;JR $) → JP transition_routine
        ; In unified mode the engine does `JP CARGA` on level-end (FRAME_CHECK
        ; returns A=2). sound-fade-carga.asm under UNIFIED_HOOKS stubs PICHO2
        ; as `DI; JR $` (3 bytes) — exactly the footprint of a `JP nnnn`, so we
        ; overwrite it at boot to dispatch to the in-memory transition instead.
        ld a, 0xC3                                      ; JP opcode
        ld (PICHO2), a
        ld hl, transition_routine
        ld (PICHO2 + 1), hl

        ; --- Music: init PT3 player + install IM 2 trampoline.
        ; music_init pages bank 7 (player+module), CALLs INIT + MUTE, pages bank 0
        ; back, and LEAVES music_paused=1 → the AY stays silent through the
        ; control-select menu. Phase 1's INIT_LEVEL calls music_resume so playback
        ; begins exactly at gameplay start. master_im2 lives in bank 2 (slot 2,
        ; fixed) so the IM 2 vector + handler are stable across bank swaps.
        call music_init
        ld a, 0xAD                                      ; I = 0xAD → vector @ 0xADXX
        ld i, a
        im 2
        ei                                              ; enable IRQs → music ticks at 50 Hz

    IFDEF DEBUG_INTERMEDIATE
        jp transition_routine                           ; debug: skip Phase 1 entirely. music_paused
                                                        ; starts 0 in this build (see master_im2), so
                                                        ; the Phase 1 theme plays on the completion
                                                        ; screen and Mars after the transition switch.
    ELSE
        jp STAR                                         ; Phase 1 canonical STAR (in hole at 0xA60C)
    ENDIF

; --- Phase 1 → Phase 2 transition (lives in 0x5B00 bootstrap area) ----------
; Bootstrap runs once and is never executed again, so its bytes are reusable.
; transition_routine itself (+ intermediate_screen + print_str) must NOT be
; overwritten by the LDIR that copies bank 1 into bank 5 — we skip
; 0x5B00-0x5BFF in the source range. The 3 message strings live in the
; canonical-loop padding (0xA65E+, bank 2) — accessed only BEFORE the LDIR,
; so they're safe to live in pageable space.
transition_routine:
        ; NOTE: IRQs stay ON through intermediate_screen so the PT3 music keeps
        ; ticking while the "Nivel 1 completado" text waits for a key — a `di`
        ; here froze the AY on its last note for the whole screen (stuck-note
        ; bug). We DI only just before the bank swaps below. music_tick is safe
        ; during the screen: current_7ffd is still 0x10 (bank 0 in slot 3) and
        ; intermediate_screen never reads slot 3.
        ; SP must be outside 0x5B00-0x5BFF (boot-area code lives here, with
        ; print_str ending at 0x5BFE — a CALL at SP=0x5BFF would PUSH right on
        ; top of the `jr print_str` opcode and corrupt the loop on its 2nd char).
        ; 0x6000 sits in Phase 1's preload data, which is about to be overwritten
        ; by the bank-1 LDIR below anyway, so we don't lose anything live (IM2
        ; pushes onto it during the screen, but only before the LDIR runs).
        ld sp, 0x6000

        ; "Nivel 1 completado" screen + wait-for-key. Runs while Phase 1's
        ; bytes are still mapped in banks 5/2/0, so msg1/msg2/msg3 (which
        ; live at 0xA6xx in bank 2) are readable.
        call intermediate_screen

        di                                              ; IRQs off from here: bank swaps must be atomic
        ; --- Switch in-game music to Phase 2's track (Mars). Safe here: IRQs off,
        ; slot 3 still holds bank 0 (current_7ffd=0x10, set below to 0x14), and we
        ; run from bank 5 (slot 1) so music_set_track can page bank 7 in slot 3.
        ; INIT happens now; the first PT3 PLAY fires when Phase 2 re-EIs. The Phase
        ; 1 completion screen above keeps Phase 1's theme; Mars starts with Phase 2.
        ld hl, song_phase2_data
        call music_play_track
        ; bank 1 (Phase 2 bank-5 image) → slot 3, LDIR → bank 5.
        ; We DON'T copy 0x4000-0x5AFF: Phase 2's saved screen+attrs there is
        ; vestigial dark2.sna intro (the "DARK / PULSA ENTER" bitmap), which
        ; would flash briefly before PANTAL repaints. Phase 2's runtime
        ; doesn't read from 0x4000-0x5AFF, only writes (via PANTAL + sprites).
        ; Skip 0x5B00-0x5BFF too — this routine + intermediate_screen live there.
        ld bc, PORT_7FFD
        ld a, 0x11
        out (c), a
        ; Preserve the player's chosen controls (set by Phase 1's MENU/REDE) so
        ; they survive the LDIR below. VAR16+0..4 at 0x6A85-0x6A89 hold the 5
        ; key codes; VAR14 at 0x6A8A is the driver flag. The bank-1 stash slot
        ; for live 0x6A85 is 0xEA85 (the LDIR below maps src 0xDC00 → dest
        ; 0x5C00, a +0x8000 shift). Copying the live controls over Phase 2's
        ; cassette defaults makes the upcoming LDIR write the player's choice
        ; back into bank 5. Helper lives in bank 1 at 0xDB0C (Phase 2 boot-stub
        ; padding zone — unused).
        call save_controls_helper
        ; Copy Phase 2's HUD bitmap + attrs (0x5000-0x5AFF, bottom 1/3 pixels +
        ; HUD attrs). Standalone Phase 2's INICIO would paint these, but we skip
        ; INICIO (UNIFIED_PLATFORMER). Without this copy the HUD frame around
        ; the face icons is invisible (DPERSO/DMALO paint the faces but not the
        ; surrounding decoration).
        ld hl, 0xD000                                   ; bank1 + 0x1000 (Phase 2's 0x5000)
        ld de, 0x5000
        ld bc, 0x0B00                                   ; 2816 B (pixels + HUD attrs)
        ldir
        ld hl, 0xDC00                                   ; src = bank1 + 0x1C00 (Phase 2's 0x5C00)
        ld de, 0x5C00
        ld bc, 0x2400                                   ; 0x5C00-0x7FFF: preload + motor head
        ldir

        ; bank 3 (Phase 2 bank-2 image) → slot 3, LDIR → bank 2 — but SKIP
        ; 0xAD00-0xAEFF (512 B) so the IM 2 table + master_im2 trampoline +
        ; music helpers survive. Phase 2's image at 0xAD00-0xAEFF is all-zeros
        ; (unused), so skipping loses nothing. Restoring 0xAF00-0xBFFF is
        ; CRITICAL though: Phase 2's SPRI1 sprite-table lookup for VAR0=0 wraps
        ; through 0xFFFE+2=0x0000 (ROM = F3 AF → HL=0xAFF3) and reads sprite
        ; data at 0xAFF3 — if that's Phase 1 leftover instead of Phase 2 data,
        ; the queue gets a bogus sprite pointer and a later RODE call writes
        ; into code (crash to PC=0x1304 / IM 0).
        ld bc, PORT_7FFD
        ld a, 0x13
        out (c), a
        ld hl, 0xC000
        ld de, 0x8000
        ld bc, 0x2D00
        ldir                                            ; copy 0x8000-0xACFF
        ld bc, 0x0200
        add hl, bc
        ex de, hl
        add hl, bc
        ex de, hl                                       ; skip 0x200 in both
        ld bc, 0x1100                                   ; 0xAF00-0xBFFF = 4352 B
        ldir                                            ; copy 0xAF00-0xBFFF

        ; bank 4 (Phase 2 bank-0 image) → slot 3 (visible at 0xC000-0xFFFF).
        ; transition_finish lives in bank 4 itself (it has to — boot area is
        ; tight, and the tail belongs to Phase 2's lifetime anyway). It updates
        ; the current_7ffd shadow, sets up Phase 2's stack, re-EIs and jumps
        ; to Phase 2 STAR. Hardcoded address: see main.asm bank-4 stash override.
        ld bc, PORT_7FFD
        ld a, 0x14
        out (c), a
        jp transition_finish                            ; tail in bank 4 (now visible in slot 3)

; --- "Nivel 1 completado" screen ---------------------------------------------
; Black border, white-on-black text, wait-any-key. Strings (msg1/msg2/msg3)
; live in the canonical-loop padding at 0xA65E+ (bank 2) — accessed only
; while Phase 1's bytes are still mapped, before the LDIR fires.
intermediate_screen:
        xor a
        out (PORT_BORDER), a                            ; black border
        ; clear pixel area 0x4000-0x5AFF (6912 B)
        ld hl, 0x4000
        ld de, 0x4001
        ld (hl), 0
        ld bc, 0x1AFF
        ldir
        ; set attrs to ink white on paper black (0x07) over 0x5800-0x5AFF.
        ; Byte-by-byte (no LDIR) — LDIR on this range left the last attr byte
        ; (0x5AFF) untouched in cheat (empirically), giving a visible artifact
        ; corner. B=0 → DJNZ runs 256 iters; 3 writes/iter = 768 B.
        ld a, 0x07
        ld hl, 0x5800
        ld b, 0
attr_loop:
        ld (hl), a
        inc hl
        ld (hl), a
        inc hl
        ld (hl), a
        inc hl
        djnz attr_loop
        ; print 3 lines (B=char_row, C=col, DE=ASCIIZ ptr)
        ld bc, 0x090A                                   ; row 9,  col 10
        ld de, msg1
        call print_str
        ld bc, 0x0B07                                   ; row 11, col 7
        ld de, msg2
        call print_str
        ld bc, 0x0E08                                   ; row 14, col 8
        ld de, msg3
        call print_str
        ; Minimum visible time (~0.5s) before accepting input — prevents the
        ; screen flashing past when player holds fire to kill NINJA.
        ld de, 0xFFFF
intro_delay:
        dec de
        ld a, d
        or e
        jr nz, intro_delay

        ; Wait for any key, with debounce: NINJA is killed by holding fire,
        ; so we must first wait for ALL keys released, then wait for a fresh
        ; press. Row pattern 0x00 reads OR of all 8 keyboard rows in bits 0-4.
wait_release:
        xor a
        in a, (0xFE)
        and 0x1F
        cp 0x1F
        jr nz, wait_release                             ; some key still held
wait_press:
        xor a
        in a, (0xFE)
        and 0x1F
        cp 0x1F
        jr z, wait_press                                ; no key yet
        ret

; print_str — render an ASCIIZ string into the pixel area from charset ROM
; In:  B = char_row 0-23, C = col 0-31, DE = ASCIIZ ptr
; Clobbers: AF, BC, DE, HL. No wrap; caller positions each line.
print_str:
        ld a, (de)
        or a
        ret z
        push de                                         ; save string ptr
        sub 0x20                                        ; A = ascii - 0x20
        ld l, a
        ld h, 0
        add hl, hl
        add hl, hl
        add hl, hl                                      ; HL = (ascii-0x20) * 8
        ld de, 0x3D00
        add hl, de                                      ; HL = charset src
        ld a, b                                         ; screen dest in DE
        and 0x18
        or 0x40
        ld d, a                                         ; D = 0x40 | (row & 0x18)
        ld a, b
        and 0x07
        rrca
        rrca
        rrca                                            ; A = (row & 7) << 5
        or c
        ld e, a                                         ; E = col | ((row & 7) << 5)
        push bc                                         ; save row/col
        ld b, 8                                         ; 8 scanlines per char
ps_cp:
        ld a, (hl)
        ld (de), a
        inc hl
        inc d                                           ; next scanline = +0x100 (same third)
        djnz ps_cp
        pop bc
        inc c                                           ; advance to next column
        pop de                                          ; restore string ptr
        inc de
        jr print_str

BOOT_AREA_END:
        ASSERT BOOT_AREA_END <= 0x5C00                  ; intermediate_screen + print_str must fit before preload.bin

        ORG 0x5C00
        INCBIN "levels/phase1/data/preload.bin"         ; 3739 B (0x5C00-0x6A9A)

; --- Converge PANTAL's hardcoded Dark 1 VAR0 refs ---------------------------
; The preload's code tail at 0x6A8B (PANTAL entry) has two `LD HL,VAR0` with
; the Dark 1 address baked in (0xA633 / 0xA632). After convergence VAR0 lives
; at 0xA6C8, so PANTAL was reading garbage → crash painting screen 0. preload.bin
; is shared with the legacy/v2 builds (which need Dark 1), so patch in the
; wrapper, not the .bin.
        ORG 0x6A8C
        DW 0xA6C8                                       ; PANTAL: LD HL,VAR0   (was 0xA633)
        ORG 0x6A99
        DW 0xA6C7                                       ; PANTAL: LD HL,VAR0-1 (was 0xA632)

; --- Engine motor (0x6A9B onward; spills into bank 2 at 0x8000) -------------
        ORG 0x6A9B
        INCLUDE "engine/mapper.asm"
        INCLUDE "engine/colas.asm"
        INCLUDE "engine/abuelo.asm"
        INCLUDE "engine/hres-printing.asm"
        INCLUDE "engine/player.asm"
        INCLUDE "engine/powers.asm"
        INCLUDE "engine/collisions.asm"

; --- Phase 1 enemies (local sources; INCBIN sprite blobs as before) ---------
        INCLUDE "levels/phase1/enemies/piranha.asm"
        INCBIN  "levels/phase1/data/piranha_sprite.bin"
        INCLUDE "levels/phase1/enemies/gaseodoptero.asm"
        INCBIN  "levels/phase1/data/gaseodoptero_sprite.bin"
        INCLUDE "levels/phase1/enemies/viscosa.asm"
        INCLUDE "levels/phase1/enemies/chicle.asm"
        INCBIN  "levels/phase1/data/chicle_sprite.bin"
        INCLUDE "levels/phase1/enemies/stone-blocks.asm"
        INCLUDE "levels/phase1/enemies/speedy.asm"
        INCLUDE "levels/phase1/enemies/dragons.asm"
        INCLUDE "levels/phase1/enemies/explosion.asm"
        INCLUDE "levels/phase1/enemies/final-boss.asm"

; --- Canonical loop in the 0xA60C hole, then canonical state block at 0xA6A1
        INCLUDE "engine/game-loop.asm"                  ; hook-mode loop (UNIFIED_HOOKS=1 via cmdline)
; intermediate_screen's 3 message strings live in this hole padding (bank 2,
; pre-LDIR). Read only before the transition LDIR fires, so post-transition
; overwrite by Phase 2 data is harmless.
msg1    DEFB "ENHORABUENA!", 0                          ; row 9,  col 10 (12 chars)
msg2    DEFB "NIVEL 1 COMPLETADO", 0                    ; row 11, col 7  (18 chars)
msg3    DEFB "PULSA UNA TECLA", 0                       ; row 14, col 8  (15 chars)
; hit-confirm beep (hit_beep + hit_latch, 16 B) tucked into this stack-safe
; loop-hole pad. HIT_BEEP_CORE = the distinctive two-tone hit_sfx_core in bank 2
; (master_im2.asm, ORG 0xAE80) — NOT SONI1_LP, whose fixed pitch made the hit
; confirm blend in with every other engine blip.
HIT_BEEP_CORE   EQU hit_sfx_core
        INCLUDE "engine/hit-sfx-beep.asm"
        DS 0xA6A1 - $, 0                                ; pad the rest of the hole up to the block
        INCLUDE "levels/phase1/data.asm"                ; vars at canonical 0xA6A1+ (VAR0=0xA6C8, …)
        INCLUDE "levels/phase1/hooks.asm"               ; INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET + MUERTE…
        INCLUDE "levels/phase1/e123.asm"                ; E1/E2/E3
        INCLUDE "engine/bichos.asm"                     ; table-driven BICHOS (Phase 1)
        INCLUDE "levels/phase1/handlers.asm"            ; PA00..PAD + PA0D9 + PUUP
        INCLUDE "engine/sound-fade-carga.asm"           ; SONI/FMA + stubbed CARGA(PICHO2) — patched at boot
        INCLUDE "engine/hit-sfx-tramp.asm"              ; palo_tramp (19 B) in the code-end pad

PLATFORMER_CODE_END:
        ASSERT PLATFORMER_CODE_END <= 0xAAA1            ; code must not overrun pinned data-tail

; --- Pinned data tables (VAR0/PAN_PAD pointers target the 0xD6xx faces) -----
        ORG 0xAAA1
        INCLUDE "levels/phase1/data-tail.asm"           ; sprites/screens/maps
        ORG 0xD606
        INCLUDE "engine/hud.asm"                        ; HUD code + TAIL_PAD
        INCLUDE "levels/phase1/faces-data.asm"          ; HAY_DATA + sprites
        INCLUDE "engine/cara-perso.asm"                 ; CARA_PERSO
        INCLUDE "levels/phase1/faces-tail.asm"          ; CARA_MALO/NINJA + GRAFIC_FIN

; --- Extra data tail 0xE696-0xFFFF (buffers/tables) -------------------------
        ORG 0xE696
        INCBIN "levels/phase1/data/tail.bin"            ; 6506 B

; --- IM 2 + master_im2 + PT3 helpers (bank 2 zero region) ------------------
; Lives in slot 2 (fixed) so the IM 2 vector + handler are always reachable
; regardless of which bank is paged in slot 3 (Phase 2 transition cycles
; through banks 1/3/4; music_tick pages bank 7). See src/music/master_im2.asm
; for the full layout (0xACDF helpers + 0xAD00 IM 2 table + 0xADAD JP).
        INCLUDE "src/music/master_im2.asm"

; =============================================================================
; Phase 2 stash — converged Dark 2 RAM image in pageable banks 1, 3, 4.
; -----------------------------------------------------------------------------
; phase2-converged.bin is the linear 0x4000-0xFFFF (48 KB) of saga-dark2-engine-
; v3.sna, i.e. Phase 2 already converged onto the canonical loop + state block.
; Regenerated by build.sh from phase2-build.asm — no more dark2.sna runtime
; dependency here. Split 16K/16K/16K across the three stash banks; the
; transition routine LDIRs them into banks 5/2 and pages bank 4 into slot 3.
; =============================================================================

; bank 1: Phase 2 0x4000-0x7FFF
        SLOT 3
        PAGE 1
        ORG 0xC000
    IF INFINITE_ENERGY
        INCBIN "build/phase2-converged-cheat.bin", 0x0000, 0x4000
    ELSE
        INCBIN "build/phase2-converged.bin",       0x0000, 0x4000
    ENDIF

; --- save_controls_helper — overrides Phase 2's boot stub padding ------------
; Phase 2 standalone's boot stub (phase2-build.asm) occupies 0x5B00-0x5B0B
; (~12 bytes: di/xor/out/ld sp/ld bc/ld a/out/jp STAR). The rest of that 256-B
; boot page (0x5B0C-0x5BFF) is zero filler from the SLOT 1 INCBIN. In bank 1
; the same offset is 0xDB0C, which we override with the controls-preservation
; helper. Called from transition_routine while bank 1 is paged in slot 3.
;
; The bank-1 → bank-5 LDIR in transition_routine maps src 0xDC00 → dest 0x5C00
; (a +0x8000 shift), so the stash byte that lands at live 0x6A85 lives at
; 0xEA85 in bank 1 (= 0x6A85 + 0x8000), NOT at 0xDC85. Writing to 0xDC85 would
; land at live 0x5C85 (top of preload) and leave the controls bytes pulled
; from Phase 2's defaults.
        ORG 0xDB0C
save_controls_helper:
        ld hl, 0x6A85                                   ; live controls (slot 1 = bank 5)
        ld de, 0xEA85                                   ; bank-1 stash slot for live 0x6A85
        ld bc, 6                                        ; VAR16+0..4 (5 keys) + VAR14 (driver)
        ldir
        ret

; bank 3: Phase 2 0x8000-0xBFFF
        PAGE 3
        ORG 0xC000
    IF INFINITE_ENERGY
        INCBIN "build/phase2-converged-cheat.bin", 0x4000, 0x4000
    ELSE
        INCBIN "build/phase2-converged.bin",       0x4000, 0x4000
    ENDIF

; bank 4: Phase 2 0xC000-0xFFFF
        PAGE 4
        ORG 0xC000
    IF INFINITE_ENERGY
        INCBIN "build/phase2-converged-cheat.bin", 0x8000, 0x4000
    ELSE
        INCBIN "build/phase2-converged.bin",       0x8000, 0x4000
    ENDIF

; --- end_of_demo_screen — replaces Phase 2's cassette-CARGA at level-end -----
; Phase 2's sound.asm under -DUNIFIED_PLATFORMER turns CARGA into `JP 0xE30D`.
; This routine lives in bank 4 (slot 3 after the Phase 1 → Phase 2 transition)
; at 0xE30D, which sits inside Phase 2's 770-byte zero region 0xE30D-0xE60E
; (verified empty in phase2-converged.bin). After paging the bank-4 stash,
; sjasmplus places this code at the override address; the LDIRs in
; transition_routine never touch slot 3 (it's a page swap, not a copy), so
; these bytes survive intact and are visible at 0xE30D when CARGA fires.
;
; Uses its OWN printer (eod_print, below) — NOT the boot-area print_str, which
; Phase 2's SP=0x5BFF stack corrupts during gameplay (the old blank/black bug).
; Shows a static "ENHORABUENA! / RESETEA Y CORRE, / ESCAPA HACIA LA LIBERTAD"
; screen and HANGS there with the PT3 music alive (EI + HALT loop). NO key input:
; the earlier "press a key → soft-reset to the +2 menu" reset the whole machine
; (jp 0 from this paged state isn't a clean menu return) — a real return to the
; in-game control menu needs Phase 1's overwritten banks back from a compressed
; stash (follow-up task). The player resets the machine to play again.
        ORG 0xE30D
end_of_demo_screen:
        di                                              ; IRQs off while printing:
                                                        ; eod_print runs from bank 4
                                                        ; (slot 3); an IM 2 would page
                                                        ; bank 7 over slot 3 mid-print.
        ld sp, 0x5BFF                                   ; Phase 2 stack (boot area)
        xor a
        out (PORT_BORDER), a                            ; black border
        ; wipe pixel area 0x4000-0x5AFF (6912 B)
        ld hl, 0x4000
        ld de, 0x4001
        ld (hl), 0
        ld bc, 0x1AFF
        ldir
        ; attrs to ink white on paper black (0x07) over 0x5800-0x5AFF
        ld hl, 0x5800
        ld (hl), 0x07
        ld d, h
        ld e, l
        inc de
        ld bc, 0x02FF
        ldir
        ; print 3 lines via eod_print — a PRIVATE copy of print_str. The boot-area
        ; print_str (0x5BCA) is corrupted by Phase 2's SP=0x5BFF stack dipping into
        ; it during gameplay (Phase 2 never calls it, so never noticed) — that is
        ; exactly why this end screen used to come up blank/black.
        ld bc, 0x090A                                   ; row 9,  col 10 ("ENHORABUENA!", 12 ch)
        ld de, end_msg1
        call eod_print
        ld bc, 0x0C08                                   ; row 12, col 8 ("RESETEA Y CORRE,", 16 ch)
        ld de, end_msg2
        call eod_print
        ld bc, 0x0E04                                   ; row 14, col 4 ("ESCAPA HACIA LA LIBERTAD", 24 ch)
        ld de, end_msg3
        call eod_print
        ; Static end screen — NO input. The demo ends here; the message stays up and
        ; the PT3 music keeps playing: EI + HALT wakes on each IM 2 tick
        ; (current_7ffd=0x14, so music_tick restores bank 4 into slot 3). The player
        ; resets the machine to play again. (The old "press a key → jp 0" reset the
        ; WHOLE machine from this paged state, not a clean menu return — a real
        ; return to the control menu needs Phase 1's banks back from a compressed
        ; stash, a follow-up task.)
        ei
eod_hang:
        halt
        jr eod_hang
end_msg1:
        DEFB "ENHORABUENA!", 0                          ; 12 chars
end_msg2:
        DEFB "RESETEA Y CORRE,", 0                       ; 16 chars
end_msg3:
        DEFB "ESCAPA HACIA LA LIBERTAD", 0              ; 24 chars

; eod_print — private bank-4 copy of print_str (the boot-area one is corrupted by
; Phase 2's stack, see above). In: B=char_row, C=col, DE=ASCIIZ. Charset from ROM
; 0x3D00 (slot 0, 48K ROM under 0x14) → pixel area 0x4000 (bank 5, slot 1).
eod_print:
        ld a, (de)
        or a
        ret z
        push de
        sub 0x20
        ld l, a
        ld h, 0
        add hl, hl
        add hl, hl
        add hl, hl
        ld de, 0x3D00
        add hl, de
        ld a, b
        and 0x18
        or 0x40
        ld d, a
        ld a, b
        and 0x07
        rrca
        rrca
        rrca
        or c
        ld e, a
        push bc
        ld b, 8
eod_cp:
        ld a, (hl)
        ld (de), a
        inc hl
        inc d
        djnz eod_cp
        pop bc
        inc c
        pop de
        inc de
        jr eod_print

; --- transition_finish — tail of transition_routine, relocated to bank 4 -----
; Moved out of boot area (which is at its 256-B limit) into Phase 2's zero
; region. Reached via the `jp transition_finish` in transition_routine right
; after bank 4 is paged into slot 3. Updates current_7ffd (the shadow read by
; music_tick to restore slot 3 after paging bank 7) so PT3 stops corrupting
; Phase 2's slot-3 mapping. CRITICAL: 0x5BFF stack — see transition_routine
; comment on bug #21 (SP=0x6000 corrupts SPRI1's sprite-pointer reads).
transition_finish:
        ld (current_7ffd), a                            ; A=0x14, slot 3 = bank 4 from now on
        xor a
        out (PORT_BORDER), a                            ; black border
        ld sp, 0x5BFF                                   ; Phase 2 stack (boot-area zero region)
        ei                                              ; PT3 IM 2 keeps ticking in Phase 2
        jp 0xA7AA                                       ; Phase 2 canonical STAR
        ASSERT $ <= 0xE60F                              ; stay inside Phase 2's zero region

; =============================================================================
; Bank 7 — PT3 player (Bulba VTII10bG) + tracks.
; -----------------------------------------------------------------------------
; The player exports START/INIT/PLAY/MUTE as fixed entry points at 0xC000+3/5/8
; (the player's first opcodes are JPs into the implementation). master_im2's
; music_init/tick/pause helpers call those absolute addresses.
; Bank 6 is reserved for Phase 3 (Kamuir's Fortress) — DO NOT use it here.
; =============================================================================

        SLOT 3
        PAGE 7
        ORG 0xC000
        MODULE pt3
        INCLUDE "src/music/pt3_play.asm"
        ENDMODULE

; Per-level PT3 tracks in bank 7. The Bulba player at 0xC000 is shared; each
; track is just its own ~1 KB of data (≈13 KB free here). music_init INITs the
; Phase 1 track at boot (leaves it paused; phase1 INIT_LEVEL resumes at gameplay);
; transition_routine calls music_play_track to switch to the Phase 2 track when
; entering Phase 2. To add Level 5: drop song_level5_data here + a music_play_track
; call at that level's entry.
;   Phase 1 = ORIGINAL Follin-STYLE heroic theme (tools/pt3-compose-heroic-theme.py).
;             Our own composition (style homage, NOT a Follin tune) -> no third-
;             party permission problem.
;   Phase 2 = Holst "Mars, the Bringer of War" (tools/pt3-compose-mars.py).
;             PUBLIC DOMAIN -> also public-release-safe.
; See CONTEXT.md PT3 licensing doctrine. barbarian.pt3 (original "Barbarian
; War-March") retired from the build but kept in src/music/ for reference.
song_pt3_data:                          ; music_init reads this label = Phase 1 track
song_phase1_data:
        INCBIN "src/music/heroic-theme.pt3"
song_phase2_data:
        INCBIN "src/music/mars.pt3"

; --- Restore bank 0 in slot 3 so SAVESNA records bank 0 as the current
;     slot-3 bank (matches the boot stub's `out (c), 0x10`). Without this,
;     the .sna would freeze bank 7 in slot 3 — Phase 1 would crash because
;     its 0xC000+ data lives in bank 0, not bank 7.
        PAGE 0

; --- Save 128K snapshot ------------------------------------------------------
    IFDEF DEBUG_INTERMEDIATE
        SAVESNA "saga-platformer-128k-debug.sna", boot_start
    ELSE
      IF INFINITE_ENERGY
        SAVESNA "saga-platformer-128k-cheat.sna", boot_start
      ELSE
        SAVESNA "saga-platformer-128k.sna", boot_start
      ENDIF
    ENDIF
