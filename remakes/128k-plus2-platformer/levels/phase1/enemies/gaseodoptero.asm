; =============================================================================
; GASEODÓPTERO — enemigo nivel 1 (GASEO)
; -----------------------------------------------------------------------------
; Entry:   GASEO (0x8603)
; Sprite:  GASEO1 (0x875A) — datos en data/gaseodoptero_sprite.bin (2 frames).
; Estado:  E2 (0xA84C). Variables internas: BAJAR2 (caída), BAJAR3 (secundario),
;          DERE2 (dirección X), PALOS2 (palos recibidos antes de morir).
; Mecánica: criatura voladora. Se mueve en X y baja. Al ciclo de muerte llama
;          a T0DEC (decrementa cola — NO es MDOWN aunque el OCR del scan
;          original ponía esa etiqueta).
; Externos: E2, T0, DAT2, VARB (defines.inc); CHOQUE, PALO, MUPP, T0DEC,
;          SIZQUI, SDERE, PON1.
; =============================================================================

GASEO    LD     A,(E2)
         CP     0
         JP     Z,RENO2
         CALL   MOV2
         CALL   CHO2
         CALL   PAL2
         RET


MOV2     CALL   CAMFA2
         LD     A,(BAJAR2)
         CP     1
         JP     Z,ABA2
         LD     A,(DERE2)
         CP     0
         JP     NZ,DE2
         LD     A,(GASEO1+1)
         SUB    4
         LD     (GASEO1+1),A
         CP     0
         JR     Z,CDE2
         JR     ARAB1


DE2      LD     A,(GASEO1+1)
         CP     208
         JR     Z,CIZ2
         ADD    A,4
         LD     (GASEO1+1),A
         JR     ARAB1


CDE2     LD     A,1
         LD     (DERE2),A
         LD     IX,GASEO1
         CALL   SIZQUI
         JR     ARAB1


CIZ2     LD     A,0
         LD     (DERE2),A
         LD     IX,GASEO1
         CALL   SDERE


ARAB1    LD     A,(BAJAR3)
         CP     1
         JP     Z,SUB1
         LD     A,(GASEO1)
         CP     168
         JR     Z,CSUB2
         ADD    A,4
         LD     (GASEO1),A
         RET


CSUB2    LD     A,1
         LD     (BAJAR3),A
         RET


CBAJ2    LD     A,0
         LD     (BAJAR3),A
         RET


SUB1     LD     A,(GASEO1)
         CP     60
         JR     Z,CBAJ2
         SUB    4
         LD     (GASEO1),A
         RET

; --- [PÁGINA 2] CHO2 + PAL2 + ABA2 + RENO2 + FINIS2 + CAFA --------------

DERE2    DEFB   0
BAJAR2   DEFB   0
BAJAR3   DEFB   0
PALOS2   DEFB   0


CHO2     LD     A,(BAJAR2)
         CP     1
         RET    Z
         LD     IY,GASEO1
         LD     H,16
         LD     L,40
         CALL   CHOQUE
         JP     C,MUERTE


PAL2     LD     IY,GASEO1
         LD     H,16
         LD     L,40
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(VARB)
         LD     B,A
         INC    B
         LD     A,(PALOS2)
         ADD    A,B
         LD     (PALOS2),A
         AND    A
         SBC    A,16
         RET    C
         LD     A,1
         LD     (BAJAR2),A
         RET


ABA2     LD     A,(GASEO1)
         CP     192
         JR     Z,FINIS2
         ADD    A,4
         LD     (GASEO1),A
         RET


FINIS2   CALL   T0DEC          ; (era 'MDOWN' en scan, pero binario va a 0x7E1D)
         LD     A,0
         LD     (E2),A
         RET


RENO2    LD     A,R
         AND    31
         CP     0
         RET    NZ
         LD     A,1
         LD     (E2),A
         LD     A,0
         LD     (PALOS2),A
         LD     (DERE2),A
         LD     (BAJAR2),A
         LD     (BAJAR3),A
         LD     A,R
         AND    16
         CP     1
         JP     Z,CAFA
         LD     A,56
CAFAS    LD     (GASEO1),A
         LD     A,208
         LD     (GASEO1+1),A
         LD     IX,GASEO1
         CALL   SDERE


; --- [PÁGINA 3] CAFO + CAFA + ESCA + CAMFA2 + GASEO1 + GAS1 ------------

         LD     DE,GASEO1
         CALL   MUPP
         LD     A,R
         AND    32
         CP     0
         JP     NZ,CAFO
         RET


CAFO     LD     IX,GASEO1
         CALL   SIZQUI
         LD     A,0
         LD     (GASEO1+1),A
         LD     A,1
         LD     (DERE2),A
         RET


CAFA     LD     A,120
         JP     CAFAS


ESCA     DEFB   0


CAMFA2   LD     A,(ESCA)
         INC    A
         LD     (ESCA),A
         CP     2
         RET    NZ
         LD     A,0
         LD     (ESCA),A
         LD     A,(GASEO1+8)
         INC    A
         CP     3
         CALL   Z,PON1
         LD     (GASEO1+8),A
         RET

; --- [SPRITE DATA EXTRAÍDO A data/gaseodoptero_sprite.bin] -------------------
; GASEO1 (header), GAS1, GAS2 (frames). 600 bytes (0x875A - 0x89B1).
; INCBIN desde dark1.asm. GASEO1 está EQU'd en defines.inc.
; =============================================================================
