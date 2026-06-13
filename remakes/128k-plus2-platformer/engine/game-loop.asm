; =============================================================================
; SAGA DARK — engine — game-loop block 1: STAR / MAIN / MORTE / MUERTE / NUEVO
; -----------------------------------------------------------------------------
; Range: 0xA715-0xA84A (~310 B). Extracted from dark1/main.asm lines 79-150.
; Engine code. References engine module entry-points (kept as 0xXXXX literals
; pending a later cleanup that introduces named labels for the per-engine
; subroutines — see comments) and per-phase symbols defined in
; levels/phaseN/{enemies/*.asm, handlers.asm, data.asm}.
;
; E2a (2026-05-20): the first 4 sections (STAR/MAIN/MORTE/MORTE_K) were
; converted from DEFB byte-streams to human asm.
; E2b (2026-05-20): per-phase literals replaced by symbols defined in the
; level-side modules (DAMA1/PUUP/VARMAL/BAJAR5/PALOS5/EXP/SUBIR9/SUBI10) +
; engine symbols (ABUELO_OFF/DASO/VAR47). Phase 1 byte-perfect preserved
; because the new symbols resolve to the original Dark 1 addresses; layout-
; parametrization for Phase 2 (rewriting levels/phase2/main.asm to use the
; Phase 1 layout) is deferred to E2c — that step will break byte-perfect-
; vs-dark2.sna for the dark2-v2 wrapper, by design.
; =============================================================================

; Unified-engine mode selector. Phase 1 builds with UNIFIED_HOOKS=0 (the legacy
; inline Dark 1 loop in the ELSE branch — byte-identical to the validated build,
; because Phase 1's data layout is pinned by absolute screen pointers and must
; not shift). Phase 2 and future levels build with -DUNIFIED_HOOKS=1 to get the
; canonical hook-based loop and supply per-level hooks. See UNIFIED-ENGINE.md.
        IFNDEF UNIFIED_HOOKS
UNIFIED_HOOKS   EQU 0
        ENDIF

    IF UNIFIED_HOOKS
; =============================================================================
; Canonical unified game loop (hook mode) — Phase 2 + future levels
; -----------------------------------------------------------------------------
; Loop body = shared motor (AAAAAA/PODER/PODERS/ABUELO/ANTIC2/SALIR + display
; BBBBBB/ESPEJ/DDDDDD), proven identical across phases by the symbol map.
; Per-level behaviour comes from hooks the level module must define:
;   INIT_LEVEL  — one-shot init at level entry (screen/colours/faces/HUD)
;   FRAME_CHECK — post-BICHOS check; A = 0 continue / 1 death-reset / 2 level-end
;   MORTE_RESET — clear this level's per-enemy state on death, RET (-> NUEVO)
;   NUEVO_RESET — re-arm this level's enemies on respawn, RET (-> PREAMBLE)
; BICHOS is the table-driven dispatcher (engine/bichos.asm); CARGA is the
; level's end-of-level transition routine (symbol resolved per level).
; NUEVO re-runs PREAMBLE (not INIT_LEVEL) — matches both originals' respawn path.
; TODO: Dark 2's truco/cheat-code entry (in its STAR2) not yet ported.
; =============================================================================
; Optional border trace (assemble -DTRACE_BORDER): each loop step sets a unique
; border colour, so a crash freezes the border on the culprit routine's colour.
        IFDEF TRACE_BORDER
        MACRO TB col
        LD a,col
        OUT (0xFE),a
        ENDM
        ELSE
        MACRO TB col
        ENDM
        ENDIF
STAR:
        TB 2                    ; red — INIT_LEVEL (menu/init) running
        CALL INIT_LEVEL
PREAMBLE:
        TB 1                    ; blue — NEGRO (clear attrs)
        CALL NEGRO
        TB 2                    ; red — BORRA
        CALL BORRA
        TB 3                    ; magenta — RESET (clear queue)
        CALL RESET
        TB 4                    ; green — SPRIPE (seed queue)
        CALL SPRIPE
        TB 5                    ; cyan — PANTAL (paint map)
        CALL 0x6A8B
        TB 6                    ; yellow — VUELCA
        CALL VUELCA
        TB 7                    ; white — BBBBBB (display)
        CALL BBBBBB
MAIN:
        TB 0                    ; black — MAIN reached (past PREAMBLE)
        CALL AAAAAA
        CALL PODER
        CALL PODERS
        CALL ABUELO
        CALL ANTIC2
        CALL SALIR
        CALL BICHOS
        CALL FRAME_CHECK
        OR a
        JR nz,UNI_ACTION
    IFDEF UNIFIED_PLATFORMER
        CALL dmg_border         ; border flash + player_face flip + pf_correct (master_im2.asm
                                ; @0xAEA0). MUST run here: after ANTIC2 (sets the anim phase)
                                ; and after BICHOS (collisions keep the pre-correct X), but
                                ; BEFORE BBBBBB (draws) so the body-X offset matches the frame
                                ; being drawn — running it after the draw lagged it one phase
                                ; (= the firing "dance"). Moved, not added: byte-count unchanged
                                ; (NU1 stays at 0xA8EC for the Phase-2 stash).
    ENDIF
        CALL BBBBBB
        CALL ESPEJ
        CALL DDDDDD
        JP MAIN
UNI_ACTION:
        DEC a
        JP z,MORTE
        JP CARGA                ; A=2 -> end-of-level transition
MORTE:
        CALL MORTE_RESET
        JP NUEVO
NUEVO:
        CALL NUEVO_RESET
        JP PREAMBLE
    ELSE
; =============================================================================
; Legacy Phase 1 loop (inline mode) — byte-identical to the validated build.
; New levels use the hook mode above; Phase 1 stays here (its layout is pinned).
; =============================================================================

STAR:
         LD a,0x02              ;A715
         CALL 0x1601            ;A717 — ROM CHAN-OPEN
         LD a,0x00              ;A71A
         LD (0x6A8A),a          ;A71C — mapper internal flag
         CALL 0xE6FE            ;A71F — per-phase init in tail.bin
         DI                     ;A722
         CALL 0x766E            ;A723 — hres-printing entry
         LD a,0x08              ;A726
         CALL 0x7CA9            ;A728 — player init
         CALL 0xD606            ;A72B — HUD paint
         CALL 0xD61B            ;A72E — HUD paint
MAIN:
         CALL 0x7C8D            ;A731 — player input
         CALL 0x7CDA            ;A734 — player update
         CALL 0x6E35            ;A737 — colas MDOWN
         CALL 0x6E22            ;A73A — colas MUP
         CALL 0x6A8B            ;A73D — mapper PANTAL
         CALL 0x7D34            ;A740 — collisions
         CALL 0x72FB            ;A743 — abuelo
MORTE:
         CALL 0x7263            ;A746 — hres-printing AAAAAA
         CALL 0x6E6E            ;A749 — colas
         CALL 0x7C14            ;A74C — player
         CALL 0x6ED1            ;A74F — abuelo
         CALL 0x79A2            ;A752 — player
         CALL 0x7C31            ;A755 — SALIR (collisions)
         LD a,(DAMA1)           ;A758 — per-phase (final-boss.asm)
         CP 0x14                ;A75B
         JP z,0xAA4B            ;A75D — CARGA (sound-fade-carga)
         CALL BICHOS            ;A760
         LD a,(CASIRA)          ;A763
         CP 0x01                ;A766
         JP z,MORTE_K           ;A768
         LD a,(0x5D3E)          ;A76B — TABLA2 byte
         CP 0xC0                ;A76E
         JP z,MORTE_K           ;A770
         CALL 0x72FB            ;A773 — abuelo
         CALL 0x7393            ;A776 — abuelo SOUND2
         CALL 0x757A            ;A779 — hres-printing
         JP MORTE               ;A77C
MORTE_K:
         LD a,0x00              ;A77F
         LD (PUUP),a            ;A781 — per-phase handler (handlers.asm)
         LD (0x7C61),a          ;A784 — player internal
         LD (VARMAL),a          ;A787 — per-phase boss state (final-boss.asm)
         LD (CASIRA),a          ;A78A
         LD (VAR0),a            ;A78D
         LD (PALOS5),a          ;A790 — per-phase (viscosa.asm)
         LD (BAJAR5),a          ;A793 — per-phase (viscosa.asm)
         LD a,0xA0              ;A796
         LD (0x5D3E),a          ;A798 — TABLA2
         LD (0x5D40),a          ;A79B
         LD a,0x3C              ;A79E
         LD (0x5D3F),a          ;A7A0
         LD (0x5D41),a          ;A7A3
         LD a,0x81              ;A7A6
         LD (TABLA1),a          ;A7A8 — 0x5D2A
         LD (0x5D2C),a          ;A7AB
         LD a,0x3C              ;A7AE
         LD (0x5D2B),a          ;A7B0
         LD (0x5D2D),a          ;A7B3
         LD a,0x02              ;A7B6
         LD (0x5D32),a          ;A7B8 — TABLA1+8
         LD (0x5D46),a          ;A7BB
         LD a,0x60              ;A7BE
         LD (NU1),a             ;A7C0
         LD a,0x00              ;A7C3
         LD (NU2),a             ;A7C5
         CALL 0xA9E4            ;A7C8 — sound-fade-carga
         CALL 0xD606            ;A7CB — HUD
         CALL 0xD61B            ;A7CE — HUD
         LD hl,VAR25            ;A7D1
         LD b,0x14              ;A7D4 — 20 bytes (clear VAR25 block)
         LD a,0x00              ;A7D6
MUER_DATA:
         LD (hl),a              ;A7D8
         INC hl                 ;A7D9
         DJNZ MUER_DATA         ;A7DA
         LD (VAR7),a            ;A7DC
         JP NUEVO               ;A7DF
CASIRA:
         NOP                    ;A7E2
MUERTE_K:
         CALL 0xD606            ;A7E3 — HUD
         LD a,0x00              ;A7E6
         LD (NU2),a             ;A7E8
         LD a,0x60              ;A7EB
         LD (NU1),a             ;A7ED
         RET                    ;A7F0
MUERTE:
    IF INFINITE_ENERGY
         RET                 ; CHEAT: salida inmediata, no resta vida
         NOP                 ; padding (3A 1E A8 3D = 4 bytes original)
         NOP
         NOP
    ELSE
         LD a,(NU1)    ;A7F1
         DEC a    ;A7F4
    ENDIF
         LD (NU1),a    ;A7F5
         LD a,(NU2)    ;A7F8
         INC a    ;A7FB
         LD (NU2),a    ;A7FC
         CP 0x04    ;A7FF
         RET nz    ;A801
         LD a,0x00    ;A802
         LD (NU2),a    ;A804
         CALL 0xD655    ;A807
         CALL SONI1    ;A80A
         LD a,(NU1)    ;A80D
         CP 0x00    ;A810
         RET nz    ;A812
         LD a,0x60    ;A813
         LD (NU1),a    ;A815
         LD a,0x01    ;A818
         LD (CASIRA),a    ;A81A
         RET    ;A81D
NU1:
         LD h,b    ;A81E
NU2:
         NOP    ;A81F
NUEVO:
         LD a,0x00    ;A820
         LD (E1),a    ;A822
         LD (E2),a    ;A825
         LD (E3),a    ;A828
         LD (EXP),a    ;A82B — per-phase (explosion.asm)
         LD (SUBIR9),a    ;A82E — per-phase (dragons.asm)
         LD (VAR47),a    ;A831
         LD (SUBI10),a    ;A834 — per-phase (dragons.asm)
         LD (VAR47+3),a    ;A837 — last byte of VAR47 (no symbol of its own)
         LD (VAR49),a    ;A83A
         LD (VAR13),a    ;A83D
         LD (ABUELO_OFF),a    ;A840 — VAR12
         LD a,0x19    ;A843
         LD (DASO),a    ;A845 — abuelo step counter (abuelo.asm)
         JP MAIN    ;A848
    ENDIF
