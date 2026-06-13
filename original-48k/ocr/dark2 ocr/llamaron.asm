; =============================================================================
; RUTINA DE CONTROL DEL LANZADOR DE LLAMAS — M.F2
; Módulo: dark2-llamaron (parte de dark2-varios.pdf, páginas 10-13)
; Páginas escaneadas: 4 (dark2-varios-{10..13}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 10] LLAMAS + LLAUP + LLAMU + LLAMOV + LLAFAS ----------------

LLAMAS   LD     A,(E2)
         CP     0
         JP     Z,LLAUP
         CP     255
         JP     Z,LLAMU
         CALL   LLAMAT
         CALL   LLAMOV
         CALL   LLAMUERTE        ; [?]
         CALL   LLAFAS
         RET


LLAUP    LD     A,R
         AND    31
         RET    NZ

; --- [PÁGINA 11] LLAUP cont + LLAMU + LLABABU + LLAMA dispatch + LABA -----

         LD     A,1
         LD     (E2),A
         CALL   MUPP
         LD     DE,LLAMON
         CALL   MUPP
         LD     A,192-48
         LD     (LLAMON),A
         LD     A,256             ; [?]
         LD     (LLAMON+1),A
         LD     A,100
         LD     (LLAMA),A
         LD     A,(LLAMA+1),A     ; [?]
         RET


LLABA    DEFB   0
LLAMON   DEFB   0


LLABA    CALL   SONI4             ; [?]
         LD     A,(LLAMON)
         ADD    A,9
         SBC    A,9              ; [?]
         CP     C
         LD     A,255
         LD     (LLAMON),A       ; [?]


LABABU   LD     A,192


LLAMAT   LD     IY,LLAMON
         LD     H,40
         LD     L,32
         CALL   CHOQUE
         C,MUERTE
         C,MUERTE                 ; [?]


LLAMOV   LD     A,(VARB)
         LD     B,A
         INC    B
         LD     A,(LLAFU)        ; [?]
         ADD    A,B
         LD     (LLAFU),A
         AND    A
         SBC    A,9
         RET    C
         LD     A,255
         LD     (E2),A
         RET


LLAFU    DEFB   0
LLAFAS   LD     A,(LLAMON+8)
         INC    A
         LD     (LLAMON+8),A
         CP     3
         RET    NZ
         LD     A,0
         LD     (LLAMON+8),A
         RET

; --- [PÁGINA 12] LLAFU + LLAMAT + FASLLA + FASLLA1 + LLAMOV + PONLLA ----

LLAMAS   LD     A,(LLAAT)
         CP     1
         RET    Z
         LD     A,(LLAMON+1)
         ADD    A,15
         CP     A,B              ; [?]
         JP     Z,PONLLA          ; [?]


PONLLA   LD     A,(LLAMA),A
         CP     1
         RET    Z
         LD     A,4              ; [?]
         JP     Z,FASLLA1


FASLLA   LD     A,(LLAMON+1)
         SUB    A,15
         LD     A,A,(LLAMA+1),A   ; [?]


FASLLA1  LD     A,2
         JP     Z,FASLLA          ; [?]
         LD     A,(LLAMON+1)
         CP     C
         RET    NZ
         LD     A,0
         LD     (LLAAT),A
         RET


LLAAT    DEFB   0


LLAMA    LD     A,(LLAAT)
         CP     1
         RET    NZ
         LD     A,(LLAFAS)
         JP     Z,LABABU         ; [?]
         JR     Z,LABABU
         LD     A,(LLAMA+1)
         INC    A
         LD     (LLAMA+1),A
         CP     192
         RET    NZ
         LD     A,(LLAMA+1)      ; [?]
         CP     A,255            ; [?]


LLAMA1   DEFB   0
LLAMA    DEFB   0,0,0,0,0,0,0,3,1,0
         DEFW   LLAMA1,LLAMA2

LLAMA1_  DEFB   6,5,0
LAFIN1   DEFB   255,000,254,000,031,000,255,000,255,000

; --- [PÁGINA 13] LLAMO1/LLAMO2 datos --------------------------------------

LLAMON   DEFB   0,0,0,0,0,0,0,3,1,0
         DEFW   LLAMO1,LLAMO2

LLAMO1   DEFB   6,5,0
LAFIN1_  DEFB   255,000,254,000,031,000,255,000,255,000
         DEFB   254,000,001,000,007,224,255,000,255,000
         DEFB   248,000,001,000,000,223,000,255,000,255,000
         DEFB   240,000,007,000,255,000,251,000,255,000,255,000
         DEFB   240,000,007,000,255,000,127,000,255,000,255,000
         DEFB   248,000,001,000,255,000,127,000,255,000,255,000
         DEFB   254,000,000,255,000,255,000,191,000,255,000
         DEFB   192,030,000,254,000,255,000,255,000,255,000
         DEFB   192,015,000,255,000,254,000,255,000,255,000
         DEFB   192,030,000,031,000,031,000,255,000,255,000
         DEFB   128,061,000,255,000,254,000,255,000,255,000
         DEFB   128,047,000,254,000,254,000,127,000,255,000
         DEFB   128,031,000,255,000,255,000,254,000,127,000
         DEFB   254,000,255,000,255,000,254,000,127,000
         DEFB   128,015,000,063,000,254,000,127,000,255,000
         DEFB   192,015,000,255,000,255,000,063,000,255,000
         DEFB   192,015,000,255,000,255,000,191,000,255,000
         DEFB   128,031,000,094,000,094,000,255,000,191,000
         DEFB   192,015,000,254,000,254,000,255,000,254,000
         DEFB   128,047,000,254,000,254,000,255,000,255,000
         DEFB   128,047,000,255,000,255,000,255,000,255,000
         DEFB   128,031,000,254,000,254,000,255,000,255,000
         DEFB   128,031,000,254,000,254,000,255,000,255,000
         DEFB   128,038,000,254,000,254,000,191,000,255,000
         DEFB   192,031,000,255,000,127,000,255,000,255,000
         DEFB   128,030,000,094,000,094,000,255,000,191,000
         DEFB   192,015,000,254,000,254,000,255,000,255,000

LLAMO2   DEFB   6,5,0
LAFIN2   DEFB   192,015,000,254,000,254,000,255,000,255,000
         DEFB   128,047,000,255,000,255,000,255,000,255,000
         DEFB   192,031,000,254,000,254,000,255,000,255,000
         DEFB   192,031,000,254,000,254,000,255,000,255,000
         DEFB   192,031,000,254,000,254,000,191,000,255,000
         DEFB   192,031,000,255,000,127,000,255,000,255,000
         DEFB   192,030,000,031,000,063,000,255,000,255,000
         DEFB   192,030,000,063,000,255,000,255,000,255,000
         DEFB   240,007,000,255,000,255,000,255,000,255,000
         DEFB   240,007,000,255,000,255,000,255,000,255,000


; =============================================================================
; FIN — dark2-llamaron
; -----------------------------------------------------------------------------
; LLAMARON — Lanzador de Llamas (enemigo de Fase 2 que lanza fuego al jugador).
;   LLAMAS  → entrada (despacho según E2)
;   LLAUP   → spawn aleatorio (R AND 31, MUPP de LLAMON, posición Y=192-48)
;   LLABA   → sonido de lanzamiento (SONI4) y disparo
;   LLAMAT  → choque con personaje (40×32)
;   LLAMOV  → recibe palo (acumula LLAFU, umbral 9)
;   LLAFAS  → animación 3 frames del campo +8
;   FASLLA/FASLLA1/PONLLA/LLAMA → control del proyectil/llama
;   LLAAT   → flag "atacando"
; LLAMA = sprite del lanzador (frames LLAMA1, LLAMA2).
; LLAMON = sprite de la llama (frames LLAMO1, LLAMO2).
; =============================================================================
