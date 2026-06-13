; =============================================================================
; RUTINA DE CONTROL DEL DIABLO — M.F2
; Módulo: dark2-diablo (parte de dark2-varios.pdf, páginas 4-7)
; Páginas escaneadas: 4 (dark2-varios-{04..07}.png — secciones intermedias)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 4] DEMON + DIAUP + DIMUMU + ATAQ ------------------------------

DEMON    LD     A,(E1)
         CP     0
         JP     Z,DIAUP
         CP     255
         JP     Z,DIMUMU
         CALL   DIAFASE
         CALL   DIAMOV
         CALL   DIAMAT
         CALL   DIAMU            ; [?]
         RET


DIAUP    DEFB   0
ATAQ     DEFB   0


DIAUP_   LD     A,1              ; [?] (segundo DIAUP, etiqueta routine)
         LD     (E1),A
         LD     A,64
         LD     (DIABLO),A
         LD     A,128
         LD     (DIABLO+1),A
         LD     IX,DIABLO
         CALL   SDERE
         LD     A,0
         LD     (DIAFU),A
         LD     (ATAQ),A
         CALL   MUP
         LD     HL,DIABLO
         LD     (T0+1),HL
         RET


DIMUMU   LD     A,(DIABLO)
         ADD    A,4
         LD     (DIABLO),A
         CP     192

; --- [PÁGINA 5] DIDI + DIAFAS + DIASPE + DIDIRE + DIDIAR + DIAIZ + DIADE --

         RET    NZ
         LD     A,0
         LD     (E1),A
         CALL   MDOWN
         RET


DIDI     CALL   DIASPE
         LD     A,(DIDI),A       ; [?]
         INC    A
         CP     2
         RET    NZ
         LD     A,0
         LD     (DIDI),A
         CP     2
         RET    NZ
         JR     Z,DIAAB
         LD     A,(DIABLO+1)
         CP     150              ; [?]
         JR     Z,DIAAB
         LD     A,(TABLA1+1)
         CP     A,(TABLA1+1)
         JR     Z,DIAAR
         JR     C,DIAIZ
         JR     Z,DIADE
         CP     0
         JR     NZ,DIAIZ


DIAAB    LD     A,(DIABLO)
         CP     152
         RET    Z
         ADD    A,4
         LD     (DIABLO),A
         RET


DIAAR    LD     A,(DIABLO)
         CP     64
         RET    Z
         SUB    4
         LD     (DIABLO),A
         RET


DIAIZ    LD     A,(DIABLO+1)
         CP     0
         RET    Z
         SUB    8
         LD     (DIABLO+1),A
         RET


DIADE    LD     A,(DIABLO+1)
         CP     216
         RET    Z
         ADD    A,8
         LD     (DIABLO+1),A
         RET


DIABXE   LD     A,B
         AND    A
         SBC    A,B
         RET    C
         LD     A,B
         SUB    8
         LD     (DIABLO+1),A
         RET


DIABLO   DEFB   0,0,0,0,0,0,0,3,1,0
         DEFW   DIABL1,DIABL2,DIABL3

DIABL1   DEFB   4,5,0
DIFIN1   DEFB   255,000,191,000,247,000,255,000,255,000,
         DEFB   255,000,031,064,227,008,255,000,255,000,

; --- [PÁGINA 6] DIBL1 datos + ATACA + DIAMEN + ATACA1 + DIAXME -----------

         DEFB   255,000,191,000,247,000,255,000,255,000

ATACA    LD     A,(DIABLO)
         LD     B,A
         LD     A,(TABLA1)
         AND    A
         SBC    HL,DE             ; [?]
         CP     C,DIAMEN          ; [?]


DIAMEN   JP     ATACA1


ATACA1   LD     A,(DIABLO+1)
         LD     B,A
         JP     ATACA1            ; [?]
         INC    A
         LD     (DIABLO+1),A
         CP     B
         RET    NZ
         RET    Z


DIAXME   LD     A,B
         SBC    A,B
         RET    C
         LD     A,B
         SUB    8
         LD     (DIABLO+1),A
         RET

; --- [PÁGINA 7] DIAMAT (no totalmente legible) + DIAFU/DIABL1 datos ------

DIAMAT   LD     IY,DIABLO
         LD     H,40
         LD     L,32
         CALL   CHOQUE
         JP     C,MUERTE
         RET


DIABL1_  DEFB   4,5,0            ; [?]
DIFIN1_  DEFB   255,000,191,000,247,000,255,000,255,000   ; [?]
         DEFB   255,000,031,064,227,008,255,000,255,000


; =============================================================================
; FIN — dark2-diablo
; -----------------------------------------------------------------------------
; DIABLO — enemigo "diablo/demonio" volador de Fase 2.
;   DEMON   → entrada (despacho según E1: 0=spawn, 255=morir)
;   DIAUP   → spawn (Y=64 X=128, SDERE, encolado)
;   DIMUMU  → muere (cae con ADD 4 hasta Y=192)
;   DIDI    → controla movimiento (cada 2 frames, persigue al jugador)
;   DIAAB/DIAAR → mueve abajo/arriba según TABLA1+0
;   DIAIZ/DIADE → mueve izquierda/derecha según TABLA1+1
;   ATACA   → ataque (acercarse al jugador con XOR)
;   DIAMAT  → choque con personaje (40×32)
; DIABLO = sprite header con 3 frames DIABL1/DIABL2/DIABL3.
; =============================================================================
