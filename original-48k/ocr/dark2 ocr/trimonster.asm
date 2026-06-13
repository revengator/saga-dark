; =============================================================================
; RUTINA DE CONTROL DEL TRIMONSTER — M.F2
; Módulo: dark2-trimonster
; Páginas escaneadas: 2 (parciales) — dark2-main-{11,12}.png
; Fecha de transcripción: 2026-04-27
; Completado con disasm: 2026-04-28 (extraído de dark2.sna, ORG=0x6A9B)
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        TRIMO=0x8C40, TRIMO1=0x8C5C (293 bytes), TRIMO2=0x8D81 (293 bytes).
;        Bytes 3-4 de TRIMO1/TRIMO2 son ptr de runtime (auto-actualizados).
;        No existe TRIMO3 — sólo 2 frames de animación.
;        La línea `TRIMO1 DEFB 6,5,0` del scan era OCR erróneo (binary: 3,6,0).
;        El TRIMONSTER (¿"trimonstruo" — 3 cuerpos? mascota Triton?) es
;        el enemigo característico de Fase 2 que probablemente da nombre
;        a TRITON SOFTWARE.
; =============================================================================

; --- [PÁGINA 11 (= dark2-main-11.png)] TRIVI + TRUP + TRDE + TRFASE ------

         ;CONTROL TRIMONSTER

TRIVI    LD     A,(E2)
         CP     0
         JP     Z,TRUP
         CP     255
         JP     Z,TRMUER         ; [?]
         CALL   TRFASE
         CALL   TRMOVI
         CALL   TRCHO
         CALL   TRIMOT
         RET


TRUP     LD     A,R
         AND    31
         RET    NZ
         LD     A,128+16
         LD     (TRIMO),A
         LD     A,R
         AND    1
         JR     Z,TRDE
         LD     IX,TRIMO
         CALL   SIZQUI           ; [?]
         LD     A,0
         LD     (TRIMO+1),A
         LD     IX,TRIMO
         LD     A,1
         LD     (TR1),A
         LD     A,0
         LD     (TRMO),A
         JR     TRCONT


TRDE     LD     A,216
         LD     (TRIMO+1),A
         LD     IX,TRIMO
         LD     A,0
         LD     (TR1),A
         LD     A,(TRMO),A       ; [?]
         CALL   SDERE
         LD     A,0
         LD     (TRMO),A
TRCONT   LD     A,1
         LD     (E2),A
         LD     A,(TRIMO+1),A    ; [?]
         CP     0
         LD     A,(TRFUER),A     ; [?]
         LD     A,0
         LD     (TR1),A
         LD     A,(TRMO),A       ; [?]
         JR     TRCDNT           ; [?]


TRMO     DEFB   0
TRFUER   DEFB   0
TR1      DEFB   0


TRFASE   LD     A,(TRIMO+8)
         INC    A
         LD     (TRIMO+8),A
         CP     3
         RET    NZ
         LD     A,1
         LD     (TRIMO+8),A
         RET


TRMOVI   LD     A,(TRMO)

; --- [PÁGINA 12 (= dark2-main-12.png)] TRMODI + TRMUER + TRCHO + TRIMOT --

         JP     Z,TRMODIZ        ; [?]
         LD     A,(TRIMO+1)
         ADD    A,4
         LD     (TRIMO+1),A
         CP     216
         RET    NZ
         LD     A,(TRIMO+1),A    ; [?]
         LD     A,0
         LD     (TRMO),A
         LD     IX,TRIMO
         CALL   SDERE
         RET


TRMODI   LD     A,(TRIMO+1)
         SUB    4
         LD     (TRIMO+1),A
         CP     0
         RET    NZ
         LD     A,1
         LD     (TRMO),A
         LD     IX,TRIMO
         CALL   SIZQUI
         RET


TRMUER   CALL   SONI2
         LD     A,(TRIMO)
         ADD    A,4
         LD     (TRIMO),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (E2),A
         RET


TRCHO    LD     IY,TRIMO
         LD     H,40
         LD     L,32
         CALL   CHOQUE
         JP     C,MUERTE
         RET


TRIMOT   LD     IY,TRIMO
         LD     H,40
         LD     L,32
         CALL   PALO
         RET    NC
         LD     A,(VARB)
         INC    A
         LD     B,A
         ADD    A,(TRFUER),A     ; [?]
         ADD    A,B
         AND    A,15
         RET    C
         LD     A,255
         LD     (E2),A
         RET


TRIMO    DEFB   0,0,0,0,0,0,0,2,1,0
         DEFW   TRIMO1,TRIMO2

; --- DATOS GRÁFICOS SPRITE TRIMONSTER (extraídos de dark2.sna) ---------------
; Formato: width_cells(3), height_cells(6), flags(0), ptr_runtime(2B), pixel+mask_data
; Los bytes 3-4 (ptr_runtime) son modificados en tiempo de ejecución por el motor.

TRIMO1   DEFB     3,  6,  0,128,141,239,  0,255,  0,255,  0,255,  0,254,  0,223
         DEFB     0,199, 16,255,  0,255,  0,255,  0,252,  1, 15, 32,239,  0,247
         DEFB     0,251,  0,255,  0,252,  1, 31,  0,255,  0,227,  8,241,  4,255
         DEFB     0,254,  0, 63,128,255,  0,225,  8,251,  0,255,  0,254,  0, 63
         DEFB   128,255,  0,224, 14,127,  0,223,  0,240,  1, 63,128,255,  0,224
         DEFB    11, 63,128,143, 32,224, 15, 63,128,255,  0,240,  5, 31, 64,135
         DEFB    48,192, 27,127,  0,255,  0,248,  0, 31, 64,135, 48,128, 54,255
         DEFB     0,255,  0,248,  2, 15, 96,135, 16,129, 36,255,  0,255,  0,240
         DEFB     6, 15, 96, 15, 96,129, 44,191,  0,253,  0,208,  4, 30,128, 15
         DEFB   160,131, 40, 31, 64,248,  2,  0, 36, 30,192, 31,192,  0,116, 31
         DEFB    64,252,  0,  0,233, 14,224, 59,  0,  0,124, 31,192,252,  1,  0
         DEFB   153,  4, 49, 49,132,  0,105, 63,128,254,  0,  0, 56,  0, 90, 24
         DEFB   192,  0,235, 63,128,248,  0,  0,116,  0,163, 28,193,  0,227,127
         DEFB     0,240,  6,  0, 92,  0, 83,  0,225,  0, 71, 31,  0,248,  3,  0
         DEFB    78,  0, 35,  0, 63,  0,197,  3,224,240,  5,  0,203,  0,141,  0
         DEFB    42,  0,134,  1, 92,224,  6,  0,194,  0,123,  0,  5,  0, 13,  1
         DEFB   244,128, 31,  0,240,  0,106,  0, 10,  0, 59,  0, 14,  0, 91,  0
         DEFB   103,  0,182,  0,127,  0, 85,  0,110,164,  0,152,  0, 73,  0,140
         DEFB     0,123,  0,159,  0

TRIMO2   DEFB     3,  6,  0,165,142,255,  0,255,  0,223,  0,253,  0,255,  0,255
         DEFB     0,255,  0,191,  0,143, 32,248,  2,255,  0,255,  0,255,  0, 31
         DEFB    64, 31, 64,248,  2,255,  0,255,  0,255,  0,191,  0, 31, 64,248
         DEFB     3, 63,  0,191,  0,255,  0,255,  0, 15, 96,252,  1,  7, 64, 31
         DEFB    64,255,  0,255,  0,143, 32,126,  0,  3,248,191,  0,255,  0,255
         DEFB     0,198, 16, 55,128,  1,108,255,  0,255,  0,247,  0,199, 16, 99
         DEFB     8,129, 44,231,  0,255,  0,227,  8,135, 16,227,  8,  3,120,195
         DEFB    24,255,  0,227,  8,  7,112,194,  8,  7,208,193, 28,255,  0,194
         DEFB    24, 14,160,  6, 32,  7,176,225, 12,255,  0,134, 48, 12,225,  6
         DEFB   240, 15,160,225, 12,255,  0,140, 33, 24, 66,  0,177,  7,176,128
         DEFB    26,255,  0,132, 49,  0,101,  0,238,  6,208,  0,122,255,  0,128
         DEFB    49,  0, 55,  0,118,  0, 89,  0,218,255,  0,192, 11, 64, 27,  0
         DEFB   244,  0,234,  0,118,223,  0,192, 26,224, 11,  0, 56,  0, 37,  1
         DEFB   108,143, 32,  0, 63,112,  1,  0,191,  0, 28,  3,248,132, 32,  0
         DEFB   221,  0,128,  0,153,  0,151,  1,188,192, 27,  0,106,  0,131,  0
         DEFB   142,  0,138,  1, 52,224, 13,  0,207,  0,223,  0,  1,  0,200,  0
         DEFB    62,128, 22,  0,131,  0,119,  0,  2,  0,240,  0, 42,  0,111,  0
         DEFB   211,  0, 77,  0,189,  0,214,  0,222,144,  0, 44,  0,178,  0, 66
         DEFB     0, 41,  0, 33,  0


; =============================================================================
; FIN — dark2-trimonster (COMPLETO — código + datos de sprite)
; -----------------------------------------------------------------------------
; TRIMONSTER — enemigo "tri-monstruo" característico de Fase 2.
;   TRIVI    → entrada principal (despacho según E2: 0=spawn, 255=morir)
;   TRUP     → spawn aleatorio (R AND 31, lado IZQ/DER según R AND 1)
;   TRDE     → spawn por la derecha (X=216 → SDERE)
;   TRCONT   → continuación del spawn (configura E2=1 y reinicia flags)
;   TRFASE   → animación 3 fases (campo +8 del sprite)
;   TRMOVI   → mueve a la derecha (ADD 4 hasta CP 216)
;   TRMODI   → mueve a la izquierda (SUB 4 hasta CP 0)
;   TRMUER   → muere (cae con ADD 4 hasta Y=192) + sonido SONI2
;   TRCHO    → choque con personaje (40×32)
;   TRIMOT   → recibe palo (TRFUER+VARB+1, umbral con AND 15)
;   TRIMO    → instancia en memoria (10 bytes estado + DEFW TRIMO1,TRIMO2)
;   TRIMO1   → sprite frame 1 (293 bytes: header 3,6,0 + ptr_runtime + datos)
;   TRIMO2   → sprite frame 2 (293 bytes: header 3,6,0 + ptr_runtime + datos)
; =============================================================================
