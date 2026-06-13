; =============================================================================
; SAGA DARK — Phase 2 — unified-engine hooks
; -----------------------------------------------------------------------------
; Per-level hooks consumed by the canonical hook-mode loop
; (engine/game-loop.asm, built with UNIFIED_HOOKS=1). The loop body is the
; shared motor; everything Phase-2-specific lives here. Extracted (logic-
; preserving, NOT byte-perfect) from levels/phase2/game-loop.asm:
;
;   INIT_LEVEL  — one-shot level init      (Phase 2 TART + STAR bodies)
;   FRAME_CHECK — post-BICHOS dispatch      (A=0 continue / 1 death / 2 level-end)
;   MORTE_RESET — clear level state on death (Phase 2 MORTE body, RET-terminated)
;   NUEVO_RESET — re-arm enemies on respawn  (Phase 2 NUEVO body, RET-terminated)
;
; Plus the death-energy machinery the motor + enemies reference by symbol:
;   MUERTE   — energy decrement on hit (collisions / enemies CALL it)
;   NU1/NU2  — energy + hit counters     (data bytes)
;   MUER     — death flag                 (data byte; Phase 1 calls this CASIRA)
;   MUERTE_K — PODER2 callback            (powers.asm CALLs it; Phase 2 named it CASIRA)
;   TRUCO/TRUCOD — cheat-code latch
;
; NOTE on the naming swap vs Phase 1: Phase 1's death FLAG is CASIRA and its
; PODER2 callback is MUERTE_K; Phase 2 swapped the two (flag MUER, routine
; CASIRA). The motor (powers.asm) calls MUERTE_K, so this file exports the
; routine under that name.
;
; KNOWN GAP (intentional for the standalone proof): the loop's PREAMBLE does
; not re-run Dark 2's STAR2 truco-restore tail (the cheat-entry persistence
; after a respawn). TRUCO itself is still wired through FRAME_CHECK.
; =============================================================================

; --- TART alias — data-tail.asm's game-over path does `JP TART` to restart.
; In hook mode the full-init entry is STAR (CALL INIT_LEVEL -> PREAMBLE -> MAIN).
TART     EQU STAR

; --- INIT_LEVEL — Phase 2 TART (clear screen / init) + STAR (sprites) -------
; INICIO is the "DARK" title screen + ENTER prompt + scroll/border-stripes
; loop — vestigial cassette-load UX. When this build is part of the unified
; platformer (Phase 1 → Phase 2 in-memory transition, no tape involved),
; skip it: -DUNIFIED_PLATFORMER=1 (set by the platformer's build.sh). The
; standalone dark2-engine-v3 build keeps the title screen.
INIT_LEVEL:
         CALL NEGRO
         LD a,0x00
         LD hl,0x4000
         LD (hl),a
         LD de,0x4001
         LD bc,0x0FFF
         LDIR
    IFNDEF UNIFIED_PLATFORMER
         CALL INICIO
    ENDIF
    IFNDEF UNIFIED_PLATFORMER
; See Phase 1's INIT_LEVEL: DI silences PT3 in the unified build, so we
; suppress it there. Standalone dark2-engine-v3 keeps the original behaviour.
         DI
    ENDIF
         CALL PONLIS
         LD a,0x08              ; A=8 consumed by PONCO
         CALL PONCO
         CALL DPERSO
         CALL DMALO
         RET

; --- FRAME_CHECK — Phase 2's post-BICHOS checks, encoded as A=0/1/2 ----------
FRAME_CHECK:
         LD a,(0x5D3E)          ; player Y (0x5D3E struct ix+0)
         CP 0xE0
         JR z,FC_DEATH          ; fell off the bottom -> death
         CP 0xA4
         CALL z,TRUCO           ; cheat-code latch (neutralised under UNIFIED_PLATFORMER, see TRUCO)
         LD a,(MUER)
         CP 0x01
         JR z,FC_DEATH
         LD a,(DAMA3)
         CP 0x14
         JR z,FC_CARGA
         XOR a                  ; A=0 — continue this frame
         RET
FC_DEATH:
         LD a,0x01              ; A=1 — death reset (loop -> MORTE)
         RET
FC_CARGA:
         LD a,0x02              ; A=2 — end of level (loop -> CARGA)
         RET

; --- TRUCO — cheat-code latch -----------------------------------------------
; Vestigial cassette-era cheat: when the player's Y (0x5D3E) momentarily hits
; 0xA4, this sacrifices the JUMP key (writes 0xFF into 0x6A85) as the "code
; entry" gesture; Dark 2's STAR2 then restored it + armed the cheat on the next
; respawn. The unified hook-mode loop's PREAMBLE never ported that STAR2 restore
; (documented KNOWN GAP above), so under the platformer the jump key would stay
; 0xFF forever after a respawn (MORTE_RESET drops the player at Y=0xA0, gravity
; bumps it to 0xA4 -> TRUCO fires). The platformer ships its cheat via the
; INFINITE_ENERGY build flag, so the in-game poke-cheat is redundant: redirect
; the final store to the (unused-here) TRUCOD scratch so the jump key is left
; intact. ZERO-SHIFT: `LD (0x6A85),a` and `LD (TRUCOD),a` are both 3 bytes, so
; every symbol below stays put (enemies hold hardcoded refs to E1/E2/E3 etc.).
; The standalone dark2-engine-v3 smoke test keeps the original clobber.
TRUCO:
         LD a,(0x6A85)
         LD (TRUCOD),a
         LD a,0xFF
    IFNDEF UNIFIED_PLATFORMER
         LD (0x6A85),a          ; cheat entry: sacrifice the jump key (STAR2 restores it)
    ELSE
         LD (TRUCOD),a          ; platformer: no STAR2 restore exists -> leave the jump key alone
    ENDIF
         RET
TRUCOD:
         DEFB 0x00

; --- MORTE_RESET — clear level state on death (Phase 2 MORTE body) ----------
MORTE_RESET:
         LD a,0x00
         LD (0x7C61),a
         LD (0xA571),a
         LD (MUER),a
         LD (VAR0),a
         LD a,0xA0
         LD (0x5D3E),a
         LD (0x5D40),a
         LD a,0x3C
         LD (0x5D3F),a
         LD (0x5D41),a
         LD a,0x81
         LD (0x5D2A),a
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
         CALL FMA
         CALL DPERSO
         CALL DMALO
         LD hl,VAR25
         LD b,0x14
         LD a,0x00
MR_CLR:
         LD (hl),a
         INC hl
         DJNZ MR_CLR
         LD (VAR7),a
         RET

; --- NUEVO_RESET — re-arm this level's enemies on respawn (Phase 2 NUEVO) ----
NUEVO_RESET:
         LD a,0x00
         LD (E1),a
         LD (E2),a
         LD (E3),a
         LD (VARMA),a
         LD (VAR47),a
         LD (0xA6B2),a
         LD (VAR49),a
         LD (VAR13),a
         LD (0xA6A7),a
         RET

; --- MUERTE — energy decrement on player hit (Phase 2) ----------------------
; Per-tick model (see defines.inc): NU1 (= damage ticks left) is decremented
; ONCE every NRG_TICK contact-frames, on the same beat as the MUERE bar/face, so
; the bar draws exactly NRG_FULL segments and empties at death. Life is stretched
; by raising NRG_TICK (not NU1), so NU1 can't overflow a byte. ZERO-SHIFT: the
; only change vs the original is moving the NU1 decrement below the cadence gate
; (the `LD a,(NU2)/INC a` pair now balances the cheat's RET+3 NOP — same 40 B).
MUERTE:
    IF INFINITE_ENERGY
         RET                    ; CHEAT: no life deduction
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
         LD (NU1),a             ; NU1-- once per tick -> life = NU1 * NRG_TICK frames
         CALL MUERE
         CALL SONI2
         LD a,(NU1)
         CP 0x00
         RET nz
         LD a,0x01
         LD (MUER),a
         RET
NU1:
         DEFB NRG_FULL          ; damage ticks to die (24 = bar segments; see defines.inc)
NU2:
         DEFB 0x00
MUER:
         DEFB 0x00

; --- MUERTE_K — PODER2 callback (Phase 2 named this CASIRA) ------------------
MUERTE_K:
         CALL DPERSO
         LD a,0x00
         LD (NU2),a
         LD a,NRG_FULL
         LD (NU1),a
         RET
