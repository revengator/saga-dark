; =============================================================================
; SAGA DARK — Phase 1 — unified-engine hooks
; -----------------------------------------------------------------------------
; Per-level hooks for the canonical hook-mode loop (engine/game-loop.asm,
; UNIFIED_HOOKS=1), mirroring levels/phase2/hooks.asm. Logic extracted (logic-
; preserving, NOT byte-perfect) from the LEGACY Phase 1 loop in the ELSE branch
; of engine/game-loop.asm.
;
; This file is the FIRST of two isolated risks: it runs Phase 1 under the
; canonical loop while its state vars STILL live at the Dark 1 addresses
; (convergence to the common block is the second, separate step). So the motor
; symbols here resolve via engine/defines.inc + levels/phase1/defines.inc (Dark
; 1), NOT engine/state.inc.
;
; Naming vs Phase 2 (the swap): Phase 1's death FLAG is CASIRA and its PODER2
; callback routine is MUERTE_K (powers.asm CALLs MUERTE_K). FRAME_CHECK reads
; CASIRA; the level-end trigger is DAMA1; the TABLA2 death value is 0xC0.
;
; KNOWN UNKNOWN (the whole point of this sandbox): Phase 1 shipped with its own
; idiosyncratic loop, never this canonical one. The canonical MAIN calls
; PODER+PODERS (Phase 1's loop called powers once), ABUELO once (Phase 1 called
; abuelo helpers twice), and runs a PREAMBLE repaint that Phase 1's loop lacked.
; Both phases' OCR listings use the canonical order, so this is the intended
; configuration — but it MUST be emulator-validated.
; =============================================================================

CARGA   EQU PICHO2             ; Phase 1 level-end target (legacy JP 0xAA4B)

; --- INIT_LEVEL — Phase 1 boot/init (legacy STAR body) ----------------------
INIT_LEVEL:
         LD a,0x02
         CALL 0x1601           ; ROM CHAN-OPEN
         LD a,0x00
         LD (0x6A8A),a         ; mapper internal flag
         CALL 0xE6FE           ; per-phase init (in tail.bin)
    IFNDEF UNIFIED_PLATFORMER
; The original game has DI here (no music; IRQs unused). In the unified
; platformer build we want IM 2 master_im2 → music_tick firing throughout
; gameplay, so the DI is suppressed. Standalone dark1-engine-v3 tests don't
; install IM 2 and stay on DI for the original behaviour.
         DI
    ENDIF
         CALL 0x766E           ; hres-printing init
         LD a,0x08
         CALL 0x7CA9           ; player init (A=8)
         CALL 0xD606           ; HUD paint
    IFDEF UNIFIED_PLATFORMER
         CALL hud_then_music   ; 0xD61B HUD paint + music_resume → start music at gameplay.
                               ; Zero-shift: same 3-byte CALL as the original 0xD61B, just a
                               ; different target (trampoline lives in master_im2's slack
                               ; region). music_init left music paused so the control-select
                               ; menu stays SILENT; this is where playback begins.
    ELSE
         CALL 0xD61B           ; HUD paint (standalone test: no music)
    ENDIF
         RET

; --- FRAME_CHECK — Phase 1's post-BICHOS checks, encoded A=0/1/2 -------------
FRAME_CHECK:
         LD a,(DAMA1)
         CP 0x14
         JR z,FC_CARGA         ; level-end (boss / phase transition)
         LD a,(CASIRA)
         CP 0x01
         JR z,FC_DEATH
         LD a,(0x5D3E)         ; TABLA2 status byte
         CP 0xC0
         JR z,FC_DEATH
         XOR a                 ; A=0 — continue
         RET
FC_DEATH:
         LD a,0x01             ; A=1 — death reset
         RET
FC_CARGA:
         LD a,0x02             ; A=2 — end of level
         RET

; --- MORTE_RESET — clear level state on death (legacy MORTE_K body) ----------
MORTE_RESET:
         LD a,0x00
         LD (PUUP),a
         LD (0x7C61),a
         LD (VARMAL),a
         LD (CASIRA),a
         LD (VAR0),a
         LD (PALOS5),a
         LD (BAJAR5),a
         LD a,0xA0
         LD (0x5D3E),a
         LD (0x5D40),a
         LD a,0x3C
         LD (0x5D3F),a
         LD (0x5D41),a
         LD a,0x81
         LD (TABLA1),a         ; 0x5D2A
         LD (0x5D2C),a
         LD a,0x3C
         LD (0x5D2B),a
         LD (0x5D2D),a
         LD a,0x02
         LD (0x5D32),a
         LD (0x5D46),a
         LD a,NRG_FULL
         LD (NU1),a
         LD a,0x00
         LD (NU2),a
         CALL 0xA9E4           ; FMA1 (sound-fade-carga)
         CALL 0xD606           ; HUD
         CALL 0xD61B           ; HUD
         LD hl,VAR25
         LD b,0x14
         LD a,0x00
MR_CLR:
         LD (hl),a
         INC hl
         DJNZ MR_CLR
         LD (VAR7),a
         RET

; --- NUEVO_RESET — re-arm Phase 1 enemies on respawn (legacy NUEVO body) -----
NUEVO_RESET:
         LD a,0x00
         LD (E1),a
         LD (E2),a
         LD (E3),a
         LD (EXP),a            ; explosion.asm
         LD (SUBIR9),a         ; dragons.asm
         LD (VAR47),a
         LD (SUBI10),a         ; dragons.asm
         LD (VAR47+3),a        ; last byte of VAR47 (no symbol of its own)
         LD (VAR49),a
         LD (VAR13),a
         LD (ABUELO_OFF),a     ; VAR12
         LD a,0x19
         LD (DASO),a           ; abuelo step counter
         RET

; --- MUERTE — energy decrement on player hit (Phase 1) ----------------------
; Per-tick model (see defines.inc): NU1 (= damage ticks left) drops ONCE every
; NRG_TICK contact-frames, on the same beat as the MUERE bar/face, so the bar
; draws exactly NRG_FULL segments and empties at death; life is stretched by
; NRG_TICK (not NU1), avoiding byte overflow. ZERO-SHIFT: only the NU1 decrement
; moved below the cadence gate (`LD a,(NU2)/INC a` now balances the cheat's
; RET+3 NOP — same 45 B). Phase 1 also refills NU1 on death for the next life.
MUERTE:
    IF INFINITE_ENERGY
         RET                   ; CHEAT: no life deduction
         NOP
         NOP
         NOP
    ELSE
         LD a,(NU2)
         INC a
    ENDIF
         LD (NU2),a
         CP NRG_TICK            ; only every NRG_TICK contact-frames is a damage tick
         RET nz
         LD a,0x00
         LD (NU2),a
         LD a,(NU1)
         DEC a
         LD (NU1),a            ; NU1-- once per tick -> life = NU1 * NRG_TICK frames
         CALL 0xD655           ; HUD (lose-life face)
         CALL SONI1
         LD a,(NU1)
         CP 0x00
         RET nz
         LD a,NRG_FULL
         LD (NU1),a
         LD a,0x01
         LD (CASIRA),a         ; raise death flag
         RET
NU1:
         DEFB NRG_FULL          ; damage ticks to die (24 = bar segments; see defines.inc)
NU2:
         DEFB 0x00
CASIRA:
         DEFB 0x00             ; death flag (Phase 2 calls this MUER)

; --- MUERTE_K — PODER2 callback (powers.asm CALLs it) -----------------------
MUERTE_K:
         CALL 0xD606           ; HUD
         LD a,0x00
         LD (NU2),a
         LD a,NRG_FULL
         LD (NU1),a
         RET
