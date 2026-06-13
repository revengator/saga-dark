; =============================================================================
; RUTINA DE CONTROL DE LA ARMADURA — M.F2
; Módulo: dark2-armadura
; Páginas escaneadas: 4 (dark2-armadura-{1..4}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis HISOFT GENS3M2 (ZX Spectrum). '; [?]' = lectura dudosa.
; =============================================================================

; *HISOFT GENS3M2 ASSEMBLER*
;     ZX SPECTRUM
; Copyright HISOFT 1983,4
; All rights reserved.

; Pass 1 errors: 00

         *D+
         ORG    1                ; [?] (placeholder ORG 1 — el módulo se ensambla
                                 ;     y se enlaza con el resto)


; --- [PÁGINA 1] ARMADU + ARUP -----------------------------------------------

ARMADU   LD     A,(E1)
         CP     0
         JR     Z,ARUP
         CP     255
         JP     Z,ARMUER
         CALL   ARFASE
         CALL   ARMOVI           ; [?]
         CALL   ARMCHO           ; [?] (ARCHO)
         CALL   ARMATA
         RET


ARUP     LD     A,R
         AND    31
         RET    NZ
         LD     A,128
         LD     (ARMA),A
         LD     A,R
         AND    1
         JR     Z,ARDE
         LD     A,(ARMA+1),A     ; [?]
         LD     A,1
         LD     (ARMA),A
         LD     IX,ARMA
         CALL   SIZQUI

; --- [PÁGINA 2] ARDE + ARFASE/ARFUER + ARMOVI/ARMODI ----------------------

ARDE     LD     A,216
         LD     (ARMA+1),A
         LD     IX,ARMA
         CALL   SDERE
         JR     ARCONT


ARMO     DEFB   0
ARFUER   DEFB   0
AR1      DEFB   0


ARFASE   LD     A,(AR1)
         CP     1
         JR     Z,ARF1
         LD     A,(ARMA+8)
         INC    A
         RET    NZ               ; [?]
         LD     (ARMA+8),A
         CP     3
         RET    NZ
         LD     A,1
         LD     (ARMA+8),A
         RET


ARF1     LD     A,(ARFASE)       ; [?]
         INC    A
         LD     (ARFASE+8),A     ; [?]
         CP     3
         RET    NZ
         LD     A,(AR1)          ; [?]
         RET


ARMOVI   LD     A,(ARMO)
         CP     0
         JP     Z,ARMODI
         LD     A,(ARMA+1)
         ADD    A,8
         LD     (ARMA+1),A
         CP     216
         RET    NZ
         LD     A,(ARMA+1),A     ; [?]
         LD     A,0
         LD     (ARMO),A
         LD     IX,ARMA
         CALL   SDERE
         RET


ARMODI   LD     A,(ARMA+1)
         SUB    4

; --- [PÁGINA 3] ARMUER + ARCHO + ARMATA + ARMA data + ARMA1 ----------------

         LD     (ARMA+1),A
         CP     0
         RET    NZ
         LD     IX,ARMA
         CALL   SIZQUI
         RET


ARMUER   CALL   SONI3
         CALL   SONI2
         LD     A,(ARMA)
         ADD    A,16
         LD     (ARMA),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (E1),A
         CALL   MDOWN
         RET


ARCHO    LD     IY,ARMA
         LD     H,56
         LD     L,32
         CALL   CHOQUE
         JP     C,MUERTE


ARMATA   LD     IY,ARMA
         LD     H,56
         LD     L,32
         CALL   PALO
         RET    NC
         LD     A,(VARB)
         LD     B,A
         LD     A,(ARFUER)
         ADD    A,B
         LD     (ARFUER),A
         AND    A
         SBC    A,9              ; [?]
         RET    C
         LD     A,255
         LD     (E1),A
         RET


ARMA     DEFB   0,0,0,0,0,0,0,0,3,1,0
         DEFW   ARMA1,ARMA2,ARMA3


ARMA1    DEFB   8,5,0
ARFIN1   DEFB   254,000,255,000,000,000,000,000,063,000,255,000
         DEFB   252,001,000,255,000,015,192,255,000
         DEFB   248,003,000,253,000,007,224,255,000
         DEFB   240,007,000,159,000,003,240,255,000
         DEFB   240,007,000,255,000,003,240,255,000
         DEFB   240,007,000,201,000,003,240,255,000
         DEFB   240,007,000,205,000,003,240,255,000
         DEFB   224,015,000,255,000,001,248,255,000
         DEFB   224,011,000,159,000,003,248,063,128
         DEFB   224,015,000,255,000,003,248,063,128
         DEFB   240,007,000,063,000,001,248,063,128
         DEFB   224,015,000,255,000,003,248,063,128
         DEFB   240,007,000,255,000,001,248,063,128
         DEFB   224,011,000,109,000,189,015,015,224
         DEFB   224,015,000,255,000,189,015,015,224
         DEFB   224,011,000,109,000,182,015,015,224

; --- [PÁGINA 4] ARFIN1 datos (sprite continúa) ---------------------------

         DEFB   224,011,000,109,000,182,015,015,224
         DEFB   224,011,000,109,000,182,015,031,192
         DEFB   192,026,000,255,000,255,000,015,096
         DEFB   192,031,000,255,000,255,000,015,096
         DEFB   192,031,000,255,000,255,000,015,096
         DEFB   224,011,000,109,000,182,015,015,224
         DEFB   192,031,000,255,000,255,000,015,096
         DEFB   240,007,000,083,000,159,000,031,128
         DEFB   192,031,000,255,000,156,000,031,128
         DEFB   240,007,032,003,000,255,000,206,031,128
         DEFB   192,026,000,255,000,182,000,127,000,015,224
         DEFB   192,015,000,255,000,255,000,170,015,015,224
         DEFB   128,063,000,255,000,201,000,255,015,015,224
         DEFB   128,043,000,255,000,255,000,255,015,015,224
         DEFB   128,055,000,251,000,127,000,254,001,015,224
         DEFB   128,055,000,255,000,255,000,255,015,015,224
         DEFB   128,043,000,255,000,255,000,255,015,015,224
         DEFB   128,055,000,255,000,127,000,255,031,031,128
         DEFB   128,043,000,255,000,254,000,255,063,063,128
         DEFB   192,029,000,255,000,182,000,255,015,031,192
         DEFB   128,055,000,255,000,255,000,255,000,159,127,000
         DEFB   192,031,000,063,000,251,000,255,000,070,015,128
         DEFB   192,031,000,063,000,251,000,255,000,255,000,255,000


; =============================================================================
; FIN — dark2-armadura
; -----------------------------------------------------------------------------
; ARMADURA — enemigo "caballero con armadura" de Fase 2.
;   ARMADU  → entrada principal (despacho según E1: 0=spawn, 255=morir)
;   ARUP    → respawn aleatorio (R AND 31, lado IZQ/DER según R AND 1)
;   ARDE    → spawn por la derecha (X=216 → SDERE)
;   ARFASE  → animación 3 fases (campo +8 del sprite)
;   ARF1    → variante de animación (cuando AR1=1)
;   ARMOVI  → mueve a la derecha (ADD A,8 / hasta CP 216)
;   ARMODI  → mueve a la izquierda (SUB 4 / hasta CP 0)
;   ARMUER  → muere (cae con ADD A,16 hasta Y=192) + sonidos SONI3+SONI2
;   ARCHO   → choque con personaje (H=56, L=32)
;   ARMATA  → recibe palo (umbral 9 = 9 golpes para matarlo, más resistente
;             que los enemigos de Fase 1 que aguantaban menos)
; ARMA = sprite header (3 frames: ARMA1/ARMA2/ARMA3)
; =============================================================================
