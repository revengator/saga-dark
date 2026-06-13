; =============================================================================
; RUTINA DE CONTROL DE LOS PINCHOS — M.F2
; Módulo: dark2-pincho (parte de dark2-varios.pdf, páginas 7-8)
; Páginas escaneadas: 2 (dark2-varios-{07..08}.png — secciones inferiores)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 7] PINCHO + MATAPI + MOVPI + PISI/PIBA + PUA1/PINUP ---------

PINCHO   LD     A,(E1)
         CP     0
         JP     Z,PINUP
         CALL   MATAPI
         CALL   MOVPI
         RET


MATAPI   LD     IY,PUA
         LD     H,56
         LD     L,24
         CALL   CHOQUE
         JP     C,MUERTE
         RET


MOVPI    LD     A,(PIPI1)
         CP     0
         JP     Z,PISI
         LD     A,(POPO)
         CP     1
         JP     Z,PIBA
         LD     A,(PUA)
         SUB    8
         LD     (PUA),A
         CP     128
         RET    NZ
         LD     A,1
         LD     (POPO),A
         RET


PIBA     LD     A,(PUA)
         ADD    A,8
         LD     (PUA),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (POPO),A
         RET


PIPI     DEFB   0
POPO     DEFB   0


PIBA_    LD     A,(PUA)          ; [?] (PIBA duplicado)
         ADD    A,4
         LD     (PUA),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (POPO),A
         RET


PINUP    CALL   MUP
         LD     HL,PUA
         LD     (T0+1),HL
         LD     A,192
         LD     (PUA),A
         LD     A,1
         LD     (E1),A
         LD     A,0
         LD     (PIPI1),A
         LD     (POPO),A
         RET


PISI     LD     A,(TABLA1+1)
         AND    A
         SBC    A,176-16         ; [?]
         RET    NC
         LD     A,(TABLA1+1)
         ADD    A,48+16          ; [?]
         LD     (PUA+16),A       ; [?]
         LD     (PIPI1),A        ; [?]
         RET


PUA      DEFB   0,0,0,0,0,0,0,1,1,0
         DEFW   PUA1

PUA1     DEFB   8,4,0
FINPUA   DEFB   255,000,252,000,063,000,255,000,
         DEFB   241,000,240,000,031,000,031,000,064,000,255,000,
         DEFB   224,032,015,000,032,015,160,000,255,000,
         DEFB   240,000,032,015,007,208,000,255,000,
         DEFB   258,000,211,000,007,208,000,255,000,   ; [?] 258
         DEFB   240,000,007,000,237,000,127,000,255,000,
         DEFB   252,000,054,000,007,000,255,000,255,000,


; =============================================================================
; FIN — dark2-pincho
; -----------------------------------------------------------------------------
; PINCHOS — trampa de pinchos verticales en Fase 2.
;   PINCHO  → entrada (E1)
;   PINUP   → spawn (Y=192, encolado)
;   MOVPI   → movimiento (sube de 192→128 y baja de 128→192 en POPO)
;   PISI    → activa cuando el personaje está cerca (TABLA1+1 vs ventana)
;   MATAPI  → choque con personaje (56×24, área alta)
; PUA = sprite header con un frame PUA1.
; =============================================================================
