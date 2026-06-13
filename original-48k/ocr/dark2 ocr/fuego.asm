; =============================================================================
; RUTINA DE CONTROL DEL FUEGO DEL DECORADO — M.F2
; Módulo: dark2-fuego (parte de dark2-varios.pdf, páginas 1-2)
; Páginas escaneadas: 2 (dark2-varios-{01..02}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 1] FUEGO + FUCONT + FUUP + FUE3/FUE4 + FUE1/FUE5/FUE2 -------

FUEGO    LD     A,(E3)
         CP     0
         JP     Z,FUUP
         LD     A,(FUCONT)
         INC    A
         CP     2
         RET    NZ
         LD     A,0
         LD     (FUCONT),A
         LD     A,(FUEGO1+B),A   ; [?]
         LD     A,(FUEGO2+B),A   ; [?]
         INC    A
         CP     3
         RET    NZ
         LD     A,1
         LD     (FUEGO1+B),A     ; [?]
         LD     (FUEGO2+B),A     ; [?]
         RET


FUCONT   DEFB   0


FUUP     LD     A,1
         LD     (E3),A
         LD     A,(VAR0)
         CP     8
         JP     Z,FUE1
         CP     9
         JP     Z,FUE2
         CP     10
         JP     Z,FUE3


FUE3     LD     A,68
         LD     (FUEGO1),A
         LD     (FUEGO1+1),A
         JP     ONLY1


FUE4     LD     A,112
         LD     (FUEGO1),A
         LD     (FUEGO1+1),A
         JP     ONLY1


FUE5     LD     A,48
         LD     (FUEGO1),A
         LD     A,72
         LD     (FUEGO1+1),A
         JP     ONLY1


ONLY1    CALL   MUP
         LD     HL,FUEGO1
         LD     (T0+1),HL
         RET


FUE2     LD     A,104
         LD     (FUEGO1),A
         LD     A,72
         LD     (FUEGO1+1),A
         LD     A,112

; --- [PÁGINA 2] FUE2 cont + FUEGO1/FUEGO2/FUEB1 datos ---------------------

         LD     A,192
         LD     (FUEGO2+1),A
         CALL   ONLY1
         CALL   MUP
         LD     HL,FUEGO2
         RET


FUEGO1   DEFB   0,0,0,0,0,0,0,2,1,0
         DEFW   FUEB1,FUEB2

FUEGO2   DEFB   0,0,0,0,0,0,0,2,1,0
         DEFW   FUEB1,FUEB2

FUEB1    DEFB   3,6,0
FUFIN1   DEFB   229,000,255,000,255,000,255,000,254,000,223,000
         DEFB   199,016,255,000,251,000,255,000,252,001,031,032
         DEFB   239,000,247,000,251,000,255,000,255,000,253,001
         DEFB   255,000,227,000,128,251,000,143,143,032,015,063,128
         DEFB   255,000,224,000,224,031,000,063,000,143,143,032,015,063,128
         DEFB   255,000,224,000,255,000,255,000,255,000,015,128,015,063,128
         DEFB   255,000,255,000,224,015,000,051,032,032,015,063,128
         DEFB   255,000,255,000,224,015,000,251,000,191,000,063,128
         DEFB   248,000,255,000,255,000,031,000,255,000,255,000,255,000
         DEFB   248,000,255,000,255,000,251,000,255,000,000,255,000
         DEFB   248,000,000,000,000,000,000,127,000,255,000,255,000
         DEFB   254,000,000,153,000,067,000,054,000,063,000,255,000
         DEFB   258,000,255,000,153,000,054,000,127,000,255,000   ; [?] 258 (¿258 ó 252?)
         DEFB   048,000,255,000,255,000,054,000,255,000,255,000   ; [?]
         DEFB   080,000,255,000,255,000,255,000,255,000,255,000   ; [?]
         DEFB   254,000,10                                           ; [?]


; =============================================================================
; FIN — dark2-fuego
; -----------------------------------------------------------------------------
; FUEGO — animación del fuego del decorado (antorchas/braseros).
;   FUEGO   → entrada principal (E3 controla activación)
;   FUUP    → spawn según VAR0 (8/9/10 → posiciones distintas)
;   FUE2/3/4/5 → cuatro variantes de coordenadas (Y,X)
;   ONLY1   → encolar FUEGO1
; FUEGO1/FUEGO2 = headers de sprite con frames FUEB1, FUEB2.
; =============================================================================
