; =============================================================================
; CHICLE — enemigo nivel 1 (MOMI / "momia")
; -----------------------------------------------------------------------------
; Entry:   CHICLE (0x970E)
; Sprite:  MOMI (0x9835) — datos en data/chicle_sprite.bin (3 frames de animación)
; Estado:  E1 (0xA84B), VAR0 (0xA633 — debe valer 12 para activarse).
; Mecánica: cuando VAR0=12, hace de barrera horizontal (rebota entre 120 y
;           216 en eje X). 4 frames de animación. La lanza lo mata.
; Externos: E1, VAR0, T0, DAT2, VARB (defines.inc); locales: BAJAR6, DERE6,
;           PALOS6 + rutinas MOVMOM, CHOMOM, PALMOM, CAMFA6.
; =============================================================================

CHICLE   LD     A,(E1)
         CP     0
         JP     Z,RENO6
         LD     IY,MOMI
         CALL   MOVMOM
         CALL   CHOMOM
         CALL   PALMOM
         RET

MOVMOM   CALL   CAMFA6
         LD     A,(BAJAR6)
         CP     1
         JP     Z,CONT6
         LD     A,(DERE6)
         CP     0
         JP     NZ,DE6
         LD     A,(IY+1)
         CP     0
         JR     Z,CDE6
         LD     A,(VAR0)
         CP     12
         JR     NZ,CCIZ6
         LD     A,(IY+1)
         CP     120
         JR     Z,CDE6
CCIZ6    LD     A,(IY+1)
         SUB    4
         LD     (IY+1),A
         RET


DE6      LD     A,(IY+1)
         CP     216
         JR     Z,CIZ6
         ADD    A,4
         LD     (IY+1),A
         RET


CDE6     LD     IX,MOMI
         LD     A,3
         LD     (IY+7),A
         CALL   SIZQUI
         LD     A,1
         LD     (DERE6),A
         LD     A,4
         LD     (IY+7),A
         RET


CIZ6     LD     IX,MOMI
         LD     A,3
         LD     (IY+7),A
         CALL   SDERE
         LD     A,0
         LD     (DERE6),A
         LD     A,4
         LD     (IY+7),A
         RET


CAMFA6   LD     A,(IY+8)
         INC    A
         CP     5
         CALL   Z,PON1
         LD     (IY+8),A
         RET

; --- [PÁGINA 2] DERE6 + PALOS6 + CONT6 + FINIS6 + CHOMOM + PALMOM -------

BAJAR6   DEFB   0
DERE6    DEFB   0
PALOS6   DEFB   0


CONT6    LD     A,(IY)
         CP     192
         JP     Z,FINIS6
         ADD    A,8
         LD     (IY),A
         RET


FINIS6   CALL   MDOWN
         LD     A,0
         LD     (E1),A
         RET


CHOMOM   LD     IY,MOMI
         LD     H,56
         LD     L,32
         CALL   CHOQUE
         JP     C,MUERTE
         RET


PALMOM   LD     IY,MOMI
         LD     H,56
         LD     L,32
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(VARB)
         LD     B,A
         INC    B
         LD     A,(PALOS6)
         ADD    A,B
         LD     (PALOS6),A
         AND    A
         SBC    A,9
         RET    C
         LD     A,1
         LD     (BAJAR6),A
         RET


RENO6    LD     A,R
         AND    31
         CP     0
         RET    NZ
         LD     A,1
         LD     (E1),A
         LD     A,3
         LD     (MOMI+7),A
         LD     IX,MOMI
         CALL   SDERE
         LD     A,4
         LD     (MOMI+7),A
         LD     A,0
         LD     (DERE6),A
         LD     (BAJAR6),A
         LD     (PALOS6),A
         LD     A,216
         LD     (MOMI+1),A
         LD     A,128
         LD     (MOMI),A
         CALL   MUP
         LD     HL,MOMI
         LD     (T0+1),HL

; --- [PÁGINA 3] datos de MOMI + MOM1 ------------------------------------

         LD     A,(VAR0)
         CP     7
         RET    NZ
         LD     A,144
         LD     (MOMI),A
         RET

; --- [SPRITE DATA EXTRAÍDO A data/chicle_sprite.bin] ------------------------
; MOMI (header), MOM1, MOM2, MOM3 (frames). 1953 bytes (0x9835 - 0x9FD5).
; INCBIN desde dark1.asm. MOMI está EQU'd en defines.inc.
; =============================================================================
