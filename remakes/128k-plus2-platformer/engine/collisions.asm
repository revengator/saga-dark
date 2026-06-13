; =============================================================================
; CHOQUES — Detector de colisiones + cambios de pantalla + cola sprites tail
; -----------------------------------------------------------------------------
; Range:  0x7C31 - 0x7E24 (500 bytes)
; Detección rectangular de colisión + transiciones entre pantallas + utilidades
; finales del manager de cola (MUPP, T0DEC).
;
; Variables:
;   TABLA1+1 (0x5D2B) — posición X del personaje
;   VAR0     (0xA633) — pantalla actual
;   VAR25    (0xA61F) — array de pantallas salvadas (1 byte por pantalla)
;   DAT2     (0x7831) — estado de la lanza
;   T0       (0xA652) — cabeza de cola
; =============================================================================

; --- SALIR — comprueba si player sale por la izda/dcha de la pantalla -------

; UNIFIED build: read the LEGS X (TABLA2+1 = the true world position). The body
; X (TABLA1+1) is shifted each frame by pf_correct (= legs + facing/phase offset,
; down to -24 when facing left at the spear-thrust phase), so keying the screen-
; edge test off the body made turning/firing near a boundary trigger a spurious
; screen change. Byte-perfect builds (no flip) keep TABLA1+1 — same 3-byte LD,
; zero-shift. (Original game: body==legs in X, so TABLA1+1 was the true position.)
SALIR:
    IFDEF UNIFIED_PLATFORMER
         LD     A,(TABLA2+1)
    ELSE
         LD     A,(TABLA1+1)
    ENDIF
         SBC    A,8
         JP     C,ANTES
    IFDEF UNIFIED_PLATFORMER
         LD     A,(TABLA2+1)
    ELSE
         LD     A,(TABLA1+1)
    ENDIF
         SBC    A,200
         JP     NC,DESPU
         RET


; --- SALVAR — guarda pantalla a cinta vía ROM SA-BYTES (0x04C2) -------------

SALVAR   LD     A,0
         CALL   COMPR          ; comprueba tecla
         RET    NZ
         LD     DE,6912        ; tamaño screen
         LD     IX,16384       ; pixel area
         LD     A,255          ; flag
         EI
         CALL   0x04C2         ; ROM SA-BYTES
         DI
         RET


; --- ANTES — cambio a pantalla anterior -------------------------------------

ANTES    LD     A,(TABLA1+8)
         CP     5
         RET    Z
         LD     A,(VAR0)
         CP     0
         JP     Z,PALLA
         CALL   PAQUI
         LD     A,(VAR0)
         DEC    A
         LD     (VAR0),A
         JP     NUEVO          ; NUEVO (en main)


; --- DESPU — cambio a pantalla posterior ------------------------------------

DESPU    LD     A,(0x5D32)     ; TABLA1+8 alternative
         CP     5
         RET    Z
         LD     A,(VAR0)
         CP     14
         JP     Z,PAQUI
         CALL   PALLA
         LD     A,(VAR0)
         INC    A
         LD     (VAR0),A
         JP     NUEVO          ; NUEVO


; --- NEGRO — limpia el área de atributos (768 bytes desde 0x5800) -----------

NEGRO    LD     HL,0x5800
         LD     BC,608
NEGRO1   LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,NEGRO1
         RET


; --- PALLA / PAQUI — variantes pequeñas que llaman a PONCO con A diferente --

PALLA    LD     A,8
         CALL   PONCO
         RET

PAQUI    LD     A,196
         CALL   PONCO
         RET


; --- PONCO — guarda posiciones actuales en sus campos +2 (history) ----------

PONCO    LD     (0x5D2B),A     ; TABLA1+1
         LD     (0x5D2D),A     ; TABLA1+3
         LD     (0x5D3F),A     ; TABLA2+1
         LD     (0x5D41),A     ; TABLA2+3
         LD     A,(0x5D2A)     ; TABLA1
         LD     (0x5D2C),A     ; TABLA1+2
         LD     A,(0x5D3E)     ; TABLA2
         LD     (0x5D40),A     ; TABLA2+2
         LD     HL,(0x5D52)    ; SIDE1
         LD     (0x5D54),HL    ; SIDE1+2
         LD     HL,(0x5D66)    ; SIDE2
         LD     (0x5D68),HL    ; SIDE2+2
         LD     HL,(0x5D7A)    ; WIND1
         LD     (0x5D7C),HL    ; WIND1+2
         LD     HL,(0x5D86)    ; (algún otro sprite)
         LD     (0x5D88),HL
         RET


; --- BORRA — limpia attr backup + pixels + attr live ------------------------

BORRA    LD     HL,0xFA86      ; backup attr area (PANTA+5000)
         LD     BC,608
BORRA1   LD     A,7            ; blanco
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BORRA1

         LD     HL,0x4000      ; pixel area
         LD     BC,0x1000      ; 4096 bytes
BORRA2   LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BORRA2

         LD     B,8
         LD     A,0
BORRA3   PUSH   HL
         LD     C,0x60         ; 96 bytes
BORRA4   LD     (HL),A
         INC    HL
         DEC    C
         JR     NZ,BORRA4
         POP    HL
         INC    H
         DJNZ   BORRA3
         RET


; --- PSIDE — dead code (never called; the disasm flagged it "alcanzable desde
;     main_tail" but nothing CALLs/JPs it). ----------------------------------
; Under the platformer build we reuse PSIDE's 43-byte slot for pf_correct: the
; per-frame body-X recenter that finishes the player sprite flip. The player is
; TWO sprites — body (TABLA1) + legs (TABLA2) — with per-frame-varying box widths
; (body bpr 6,6,4,4,7 vs legs bpr 5); the engine's SPEJO mirrors each about its
; OWN box, so the body lands a whole-char off the legs by an amount that depends
; on both the animation phase and the facing. pf_correct sets body.X absolutely
; (= legs.X + offset[facing][phase]) every frame, so it is self-correcting (no
; accumulation) and survives re-seed. Driven once per frame by player_face
; (master_im2.asm). Lives here (and in the Phase 2 stash, also built
; -DUNIFIED_PLATFORMER) so it exists in both phases. MUST stay EXACTLY 43 B
; (PSIDE's size) so VUELCA/CHOQUE/... never shift. Byte-perfect dark1/dark2/
; dark2-v2 (no flag) keep the original PSIDE in the ELSE branch.
;
; UNITS ARE PIXELS — TABLA+1 X is a pixel coord (movement steps 4px; SALIR
; thresholds 8/200), so offsets need NOT be whole chars. Alignment principle
; (the author's original scheme, confirmed by the user): RIGHT-facing draws every
; player sprite at the SAME X (shared LEFT edge) — the man's back sits at a fixed
; column and his spear/width grows rightward. The mirror must therefore share the
; RIGHT edge. SPEJO reflects each frame about its OWN box, and body box widths
; differ per phase (bpr 6,6,4,4,7). RIGHT-facing fire is perfect: the man's WAIST
; (body bottom row, where the legs attach) sits exactly on the legs (body-legs = 0)
; for every phase, and the spear grows rightward. The LEFT table is the exact
; mirror of that — body.X chosen so the mirrored waist again sits on the legs:
; oL = 41 - 8*bpr (rounded to the measured whole-char values). Rendered composites
; confirm the waist stays planted; only the spear extends left.
; NOTE: this only works because pf_correct is now called from the main loop AFTER
; ANTIC2 (which sets the anim phase) and before BBBBBB (which draws) — earlier it
; ran a frame late, so phase N was drawn with phase N-1's offset = the "dance".
;   RIGHT: 0,0,0,0,+8   (+8 = phase-5 spear thrust, matches original SIG)
;   LEFT : -8,-8,+8,+8,-24   (mirror; waist stays on the legs, spear extends left)
    IFDEF UNIFIED_PLATFORMER
pf_correct:
         LD     A,(TABLA1+6)   ; facing: 0=right, 1=left
         LD     HL,pf_tbl_R-1  ; right-facing offsets (1-based phase index)
         OR     A
         JR     Z,pfc_go
         LD     HL,pf_tbl_L-1  ; left-facing offsets
pfc_go:
         LD     A,(TABLA1+8)   ; current animation phase (1..5)
         LD     E,A
         LD     D,0
         ADD    HL,DE
         LD     A,(TABLA2+1)   ; legs X = the alignment reference
         ADD    A,(HL)         ; + per-facing, per-phase body offset
         LD     (TABLA1+1),A   ; body X (absolute)
         RET
pf_tbl_R:
         DEFB   0x00,0x00,0x00,0x00,0x08
pf_tbl_L:
         DEFB   0xF8,0xF8,0x08,0x08,0xE8
         DEFS   43 - ($ - pf_correct), 0   ; pad to PSIDE's original size (ZERO-SHIFT)
    ELSE
PSIDE    LD     A,(VAR1)
         CP     2
         RET    NZ
         CALL   MUP
         LD     HL,0x5D52      ; SIDE1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D66      ; SIDE2
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D7A      ; WIND1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D86      ; (otro sprite)
         LD     (T0+1),HL
         RET
    ENDIF


; --- VUELCA — copia attr backup → attrs live, y pixels live → PANTA backup --

VUELCA   LD     HL,0xFA86      ; backup attrs
         LD     DE,0x5800      ; live attrs
         LD     BC,608
         LDIR
         LD     HL,0x4000      ; live pixels
         LD     DE,0xE6FE      ; PANTA backup
         LD     BC,0x1000
         LDIR
         RET


; --- NOSAL — comprueba si pantalla actual está marcada como salvada ---------

NOSAL    LD     A,(VAR0)
         LD     C,A
         LD     B,0
         LD     HL,VAR25       ; VAR25
         ADD    HL,BC
         LD     A,(HL)
         CP     1
         RET                    ; Z si A=1, NZ otherwise


; --- PONSAL — marca pantalla actual como salvada ----------------------------

PONSAL   LD     B,0
         LD     A,(VAR0)
         LD     C,A
         LD     HL,VAR25       ; VAR25
         ADD    HL,BC
         LD     A,1
         LD     (HL),A
         RET


; --- CHOQUE — colisión rectangular player vs sprite (D=56, E=24) ------------
; IY = sprite enemy; usa TABLA1 (player) como segunda caja.

CHOQUE   LD     IX,TABLA1
         LD     D,0x38         ; 56 (ancho)
         LD     E,0x18         ; 24 (alto)
         CALL   RCPE
         RET


CHO_NC   AND    A              ; clear carry y volver
         RET


; --- PALO — colisión lanza (cuando DAT2=1) ----------------------------------
; D=32, E=56. Verifica también colisión con SIDE1/SIDE2.
;
; UNIFIED_PLATFORMER: PALO is redirected to palo_tramp (engine/hit-sfx-tramp.asm,
; placed in a stack-safe engine hole) which adds the latched hit-confirm beep.
; The collision body below stays put as PALO_IMPL — NOTHING shifts, so the
; hardcoded BICHOS_TABLE 0x970E entry + preload/tail refs into the enemy region
; stay valid. Byte-perfect builds (no flag) keep PALO as the body verbatim.

    IFDEF UNIFIED_PLATFORMER
PALO            EQU palo_tramp
PALO_IMPL:
    ELSE
PALO:
    ENDIF
         LD     A,(DAT2)
         CP     1
         JP     NZ,CHO_NC      ; si lanza no activa, no choque
         LD     A,(VAR1)
         CP     2
         JP     Z,PALO_SIDES   ; si VAR=2, comprobar SIDE1/2 también
         LD     IX,TABLA1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET

PALO_SIDES
         LD     IX,0x5D52      ; SIDE1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET    C              ; si choque con SIDE1, return C
         LD     IX,0x5D66      ; SIDE2
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET    C
         LD     IX,TABLA1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET


; --- RCPE — núcleo de detección de colisión rectangular --------------------
; IX = caja A (player o lanza), IY = caja B (enemy).
; D = ancho (con margen), E = alto.
; Devuelve C=1 si hay colisión, C=0 si no.

RCPE     LD     A,D
         SBC    A,H
         CALL   NC,SWAP        ; intercambia IX/IY si necesario (orden)
         LD     A,(IX+0)
         LD     C,4            ; margen
         ADD    A,D
         ADD    A,C
         LD     D,A
         LD     A,(IY+0)
         ADD    A,H
         ADD    A,C
         LD     H,A
         LD     A,(IX+0)
         ADD    A,C
         SBC    A,H
         JR     NC,RCPE_NC     ; no choque
         LD     A,(IY+0)
         ADD    A,C
         LD     H,A
         LD     A,D
         SBC    A,H
         JR     C,RCPE_NC

         LD     A,E
         SBC    A,L
         CALL   C,SWAP
         LD     A,(IX+1)
         ADD    A,E
         ADD    A,C
         LD     E,A
         LD     A,(IY+1)
         ADD    A,L
         ADD    A,C
         LD     L,A
         LD     A,(IX+1)
         ADD    A,C
         SBC    A,L
         JR     NC,RCPE_NC
         LD     A,(IY+1)
         ADD    A,C
         LD     L,A
         LD     A,E
         SBC    A,L
         JR     C,RCPE_NC
         SCF                    ; choque
RCPE_END RET

RCPE_NC  AND    A              ; no choque
         RET


; --- SWAP — intercambia IX↔IY y DE↔HL (helper de RCPE) ---------------------

SWAP     PUSH   IX
         PUSH   IY
         POP    IX
         POP    IY
         EX     DE,HL
         RET


; --- MUPP — Insert sprite en cola (variante con DE como puntero) ------------

MUPP     LD     A,(T0)
         ADD    A,A
         LD     B,0
         LD     C,A
         LD     HL,T0+1
         ADD    HL,BC
         LD     (HL),E
         INC    HL
         LD     (HL),D
         LD     A,(T0)
         INC    A
         LD     (T0),A
         RET


; --- T0DEC (= MDOWNN en scan) — decrementa T0 (head) -----------------------

T0DEC    LD     A,(T0)
         DEC    A
         LD     (T0),A
         RET
