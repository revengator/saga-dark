; =============================================================================
; CHOQUES — RUTINA DE COLISIONES
; Módulo: dark1-collisions
; Páginas escaneadas: 5 (dark1-collisions-{1..5}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 1] SALIR + SALVAR + ANTES + POKEI + DESPU + NEGRO + PALLA ----

SALIR    LD     A,(TABLA1+1)
         SBC    A,B
         JP     C,ANTES
         LD     A,(TABLA1+1)
         SBC    A,200
         JP     NC,DESPU
         RET

SALVAR   LD     A,0
         CALL   COMPR
         RET    NZ
         LD     DE,6912
         LD     IX,16384
         LD     A,255
         EI
         CALL   1218
         DI
         RET


ANTES    LD     A,(TABLA1+8)
         CP     5
         RET    Z
         LD     A,(VAR0)
         JP     Z,PAQUI         ; [?]


POKEI    LD     A,(VAR0)
         DEC    A
         JP     NZ,PAQUI        ; [?]
         LD     (VAR0),A
         JP     NUEVO


DESPU    LD     A,(TABLA1+8)
         CP     5
         RET    Z
         LD     A,(VAR0)
         CP     14
         JP     Z,PAQUI         ; [?]
         INC    A
         LD     (VAR0),A
         JP     NUEVO


NEGRO    LD     HL,22528
         LD     BC,608
         LD     (HL),0
         LD     DE,(HL)         ; [?]
         LD     (DE),A          ; [?] o LD (HL),A
         LDIR
         RET


NEGRO1   LD     HL,16384
         LD     BC,6144
         LD     (HL),0          ; [?]
         LD     DE,16385
         LDIR
         RET


PALLA    LD     A,B
         CALL   PONCO


PAQUI    LD     A,196           ; [?]

; --- [PÁGINA 2] PONCO + BORRA + BORRA1 + NE6 + NE7 + PSIDE -------------

PONCO    LD     L,(TABLA1+1),A  ; [?]
         LD     L,(TABLA1+3),A  ; [?]
         LD     L,(TABLA2+1),A  ; [?]
         LD     L,(TABLA2+3),A  ; [?]
         LD     L,(TABLA1+2),A  ; [?]
         LD     L,(TABLA1+4),A  ; [?]
         LD     A,(SIDE2)       ; [?]
         LD     A,(SIDE2+2)
         LD     L,(SIDE2),A
         LD     L,(WIND1)
         LD     L,(WIND2)
         LD     L,(WIND2+2),A
         RET


BORRA    LD     HL,PANTA+5000
         LD     DE,22528
         LD     BC,608
         LDIR
         LD     HL,16384
         LD     DE,PANTA
         BC,6144                ; [?]
BORRA1   DEC    BC
         LD     A,B
         CP     A,7             ; [?]
         JP     NZ,BORRA1
         LD     A,(HL),A        ; [?]
         AND    %00111000
         RR     A
         RR     A
         RR     A
         OR     %01000000       ; [?]
         LD     (HL),A
         INC    HL
         DJNZ   BORRA1
         RET


NE6      PUSH   HL
         LD     A,B
         POP    HL
         RET


NE7      LD     A,(HL)
         POP    HL
         INC    HL
         RET


PSIDE    LD     A,(DAT2)        ; [?]
         CP     1
         RET    Z
         LD     A,(VAR1)
         CP     1
         JP     Z,SIDEON
         LD     A,(PAFIN)
         CP     1
         JP     Z,SIDEON

         RET


SIDEON   ; (continúa)

; --- [PÁGINA 3] VUELCA + NOSAL + PONSAL + CHOQUE + PALO + PAFIN + SIDEON --

VUELCA   LD     HL,16384
         LD     DE,22528
         LD     BC,608
         LDIR
         LD     HL,DE,16384     ; [?]
         LD     DE,PANTA
         BC,4096
         LDIR
         RET


NOSAL    LD     A,(VAR0)
         LD     C,A
         LD     B,0
         LD     HL,VAR25
         ADD    HL,BC
         LD     A,(HL)
         CP     1
         RET


PONSAL   LD     B,0
         LD     A,(VAR0)
         LD     C,A
         LD     HL,VAR25
         ADD    HL,BC
         LD     A,1
         LD     (HL),A
         RET


CHOQUE   LD     IX,TABLA1
         LD     D,56
         LD     E,24
         CALL   RCPE
         RET    C


PAFIN    AND    A
         RET    NZ
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(VAAR1)        ; [?]
         CP     2
         JP     Z,SIDEON
         LD     A,(PAFIN)
         CP     1
         JP     Z,SIDEON
         RET


SIDEON   LD     IX,SIDE1        ; [?]
         LD     D,32
         LD     E,56
         CALL   RCPE
         RET    C
         LD     IX,TABLA1
         LD     D,32
         LD     E,56
         CALL   RCPE
         RET


PALO     LD     A,(DAT2)
         CP     1
         JP     NZ,PAFIN        ; [?]
         LD     A,(VAAR1)
         CP     2
         JP     Z,SIDEON
         LD     IX,TABLA1
         LD     D,32
         LD     E,56
         CALL   RCPE
         RET


SIDEON1  LD     IX,SIDE1        ; [?]
         LD     D,32

; --- [PÁGINA 4] RCPE + CAMB1 + CONFIN + MUPP -----------------------------

RCPE     LD     A,D
         SBC    A,H
         LD     A,C,4 ;MARGEN   ; [?]
         LD     ADD A,D         ; [?]
         ADD    A,C
         LD     D,A
         LD     A,(IY)
         ADD    A,H
         LD     A,H
         LD     A,(IY)
         ADD    A,A
         ADD    A,C
         LD     A,H
         ADD    A,A
         LD     ADD A,A         ; [?]
         ADD    A,A
         LD     ADD A,H         ; [?]
         LD     A,A             ; [?]
         LD     ADD A,(IY)      ; [?]
         NC,CONFIN              ; [?]
         LD     A,(IY)
         LLD                    ; [?]
         SBC    A,A             ; [?]
         A,H                    ; [?]
         JR     NC,CONFIN
         CCF                    ; [?]
         JR     A,(IY)          ; [?]
         A,C                    ; [?]
         LD     A,(IY+1)        ; [?]
         JR     C,CAMB1         ; [?]
         LD     A,A,(IY)        ; [?]
         A,L                    ; [?]
CAMB1    CALL   A,(IY+1)        ; [?]
         A,L                    ; [?]
         LD     A,A,L           ; [?]
         JR     C,CONFIN
         CCF


CONFIN   PUSH   IY
         LD     A,(IY+1)
         A,L                    ; [?]
         LD     A,A             ; [?]
         JR     A,(IY+1)        ; [?]
         A,L                    ; [?]
         A,L                    ; [?]
         JR     C,CONFIN        ; [?]


CAMB1B   CALL   A,(IY+1)        ; [?]
         JR     A,L             ; [?]
         A,A                    ; [?]
         JR     A,A             ; [?]
         JR     C,CONFIN
         SCF


CONFIN2  AND    A
         RET


CAMB1C   CALL   CONFIN          ; [?]
         JR     CONFIN          ; [?]


CAMB1D   CALL   A,(IY+1)        ; [?]
         JR     A,L
         A,A                    ; [?]
         JR     C,CONFIN

; --- [PÁGINA 5] MUPP + MDOWNN ----------------------------------------------

         POP    IY
         EX     DE,HL
         RET


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


MDOWNN   LD     A,(T0)
         DEC    A
         LD     (T0),A
         RET


; =============================================================================
; FIN — dark1-collisions
; -----------------------------------------------------------------------------
; Rutinas principales:
;   SALIR   → comprueba si el personaje sale por la izquierda/derecha
;   ANTES   → cambio a pantalla anterior
;   DESPU   → cambio a pantalla posterior
;   NEGRO / NEGRO1 → limpia pantalla
;   PONCO   → pone color (atributos)
;   BORRA / BORRA1 → borra pantalla
;   VUELCA  → copia buffer → pantalla
;   NOSAL / PONSAL → marca pantalla salvada (para no respawnear)
;   CHOQUE  → detector de colisión rectangular (D=ancho, E=alto)
;   RCPE    → núcleo de colisión (muy borroso)
;   MUPP    → añade entrada a la tabla T0 (sprites a dibujar)
;   MDOWNN  → quita entrada de la tabla T0
; =============================================================================
