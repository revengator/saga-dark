; =============================================================================
; CONTROL DE LA VISCOSA — M.F1
; Módulo: dark1-viscosa
; Páginas escaneadas: 2 (dark1-viscosa-{1..2}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Boss/enemigo grande compuesto por 3 sprites: BOCA1 + BOCA2 + OJO1.
;        Cuando muere lanza explosión EXP1/EXP2/EXP3.
; =============================================================================

; --- [PÁGINA 1] VISCO + CHOOJO + PATRAS + PALBOC ----------------------------

VISCO    LD     A,(BAJAR5)
         CP     0
         RET    NZ
         LD     A,(EXP)
         CP     2
         JP     Z,VISC2
         CP     1
         RET    Z
         CALL   MOVOJO
         CALL   PALBOC
         CALL   CHOOJO           ; [?] CHBOJO/CHOOJO
         LD     A,(BOCA1+8)
         INC    A
         LD     (BOCA1+8),A
         CP     3
         RET    NZ
         LD     A,1
         LD     (BOCA1+8),A
         RET


CHOOJO   LD     IY,OJO1
         LD     H,68
         LD     L,50
         CALL   CHOQUE
         CALL   C,PATRAS
         CALL   C,MUERTE
         LD     A,160
         LD     (BOCA1+1),A
         LD     IY,BOCA1
         LD     H,48
         LD     L,50
         CALL   CHOQUE
         CALL   C,PATRAS
         CALL   C,MUERTE
         LD     A,128
         LD     (BOCA1+1),A
         RET


PATRAS   CALL   MUERTE
         LD     A,(TABLA1+1)
         SUB    24
         LD     (TABLA1+1),A
         LD     A,(TABLA2+1)
         SUB    24
         LD     (TABLA2+1),A
         SCF
         RET


PALBOC   LD     IY,BOCA1
         LD     H,48
         LD     L,50
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(VARB)
         LD     B,A
         INC    B
         LD     A,(PALOS5)
         ADD    A,B
         LD     (PALOS5),A
         AND    A
         SBC    A,65             ; [?]

; --- [PÁGINA 2] (resto PALBOC) + flags + MOVOJO + MD1OJO + VISC2 + datos ---

         RET    C
         LD     HL,TDE
         LD     (DIEXP),HL
         LD     A,1
         LD     (EXP),A
         LD     A,0
         LD     (NEXP),A
         LD     DE,EXP1
         CALL   MUPP
         LD     DE,EXP2
         CALL   MUPP
         LD     DE,EXP3
         CALL   MUPP
         RET


BAJAR5   DEFB   0
PALOS5   DEFB   0


MOVOJO   LD     A,R
         AND    7
         CP     0
         JR     Z,MD1OJO
         LD     A,120
         LD     (OJO1+1),A
         LD     A,(OJO1+8)
         INC    A
         LD     (OJO1+8),A
         AND    A
         SBC    A,3
         RET    Z
         LD     A,1
         LD     (OJO1+8),A
         RET


MD1OJO   LD     A,3
         LD     (OJO1+8),A
         LD     A,96
         LD     (OJO1+1),A
         RET


VISC2    LD     A,1
         LD     (BAJAR5),A
         CALL   RESET
         CALL   SPRIPE
         CALL   MUP
         LD     HL,BOCA2
         LD     (T0+1),HL
         RET


; --- Datos de cabecera y sprites de la viscosa -----------------------------

BOCA1    DEFB   152,128,0,0,0,0,0,2,1,7
         DEFW   BOCAS1,BOCAS2
BOCA2    DEFB   136,160,0,0,0,0,0,1,1,7
         DEFW   BOCAS3
OJO1     DEFB   112,120,0,0,0,0,0,3,1,7
         DEFW   OJOS2,OJOS3,OJOS1

BOCAS1   DEFB   5,6,0
FBOCA1   DEFB   255,000,255,000,128,063,000,247,000,123,000,159
         DEFB   248,063,000,255,000,123,000,255,000,187,000,138
         DEFB   240,007,032,003,000,231,000,153,000,177,000,165
         DEFB   192,031,000,031,000,158,000,225,000,142,000,178
         DEFB   128,063,000,254,000,127,000,166,000,126,000,158
         DEFB   000,127,000,253,000,254,000,087,000,255,000,118
         DEFB   000,113,000,251,000,254,000,159,000,251,000,207
         DEFB   000,015,000,087,000,243,000,062,000,186,000,251,000,207
         DEFB   000,114,000,175,000,251,000,062,000,245,000,239
         DEFB   ...              ; [?] continúa


; =============================================================================
; FIN — dark1-viscosa
; -----------------------------------------------------------------------------
; Boss/enemigo "viscosa" compuesto por 3 sprites:
;   BOCA1 (152,128) + BOCA2 (136,160) + OJO1 (112,120)
;   VISCO   → entrada (depende de BAJAR5 y EXP)
;   CHOOJO  → choque (en OJO y en BOCA, con efecto PATRAS)
;   PATRAS  → empuja al personaje 24 píxeles atrás
;   PALBOC  → recibe palo en la BOCA (umbral 65)
;   MOVOJO  → movimiento del ojo (entre Y=96 y Y=120, con animación 3 frames)
;   VISC2   → al morir: lanza explosión EXP1+EXP2+EXP3 (vía DIEXP/EXP/NEXP)
; PALOS5 contador de daño; BAJAR5 flag de "muriendo".
; Datos gráficos truncados — ver scan original para los frames completos.
; =============================================================================
