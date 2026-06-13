; =============================================================================
; CHOQUES — Detector de colisiones + cambios de pantalla + cola sprites tail
; -----------------------------------------------------------------------------
; Range:  0x7C31 - 0x7E24 (500 bytes)
; Detección rectangular de colisión + transiciones entre pantallas + utilidades
; finales del manager de cola (MUPP, T0DEC).
;
; Variables:
;   TABLA1+1 (0x5D2B) — posición X del personaje
;   VAR0     (0xA6C8) — pantalla actual
;   VAR25    (0xA6B4) — array de pantallas salvadas (1 byte por pantalla)
;   DAT2     (0x7831) — estado de la lanza
;   T0       (0xA6E7) — cabeza de cola
; =============================================================================

; --- SALIR — comprueba si player sale por la izda/dcha de la pantalla -------

SALIR    LD     A,(TABLA1+1)
         SBC    A,8
         JP     C,ANTES
         LD     A,(TABLA1+1)
         SBC    A,200
         JP     NC,DESPU
         RET


; --- SALVAR — guarda pantalla a cinta vía ROM SA-BYTES (0x04C2) -------------

SALVAR   LD     A,0
         CALL   COMPR          ; comprueba tecla
         RET    NZ
         LD     DE,6912        ; tamaño screen
         LD     IX,16384       ; pixel area
         LD     A,255          ; flag
         EI
         CALL   0x04C2         ; ROM SA-BYTES
         DI
         RET


; --- ANTES — cambio a pantalla anterior -------------------------------------

ANTES    LD     A,(TABLA1+8)
         CP     5
         RET    Z
         LD     A,(VAR0)
         CP     0
         JP     Z,PALLA
         CALL   PAQUI
         LD     A,(VAR0)
         DEC    A
         LD     (VAR0),A
         JP     0xA8D7         ; NUEVO (en main)


; --- DESPU — cambio a pantalla posterior ------------------------------------

DESPU    LD     A,(0x5D32)     ; TABLA1+8 alternative
         CP     5
         RET    Z
         LD     A,(VAR0)
         CP     14
         JP     Z,PAQUI
         CALL   PALLA
         LD     A,(VAR0)
         INC    A
         LD     (VAR0),A
         JP     0xA8D7         ; NUEVO


; --- NEGRO — limpia el área de atributos (768 bytes desde 0x5800) -----------

NEGRO    LD     HL,0x5800
         LD     BC,608
NEGRO1   LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,NEGRO1
         RET


; --- PALLA / PAQUI — variantes pequeñas que llaman a PONCO con A diferente --

PALLA    LD     A,8
         CALL   PONCO
         RET

PAQUI    LD     A,196
         CALL   PONCO
         RET


; --- PONCO — guarda posiciones actuales en sus campos +2 (history) ----------

PONCO    LD     (0x5D2B),A     ; TABLA1+1
         LD     (0x5D2D),A     ; TABLA1+3
         LD     (0x5D3F),A     ; TABLA2+1
         LD     (0x5D41),A     ; TABLA2+3
         LD     A,(0x5D2A)     ; TABLA1
         LD     (0x5D2C),A     ; TABLA1+2
         LD     A,(0x5D3E)     ; TABLA2
         LD     (0x5D40),A     ; TABLA2+2
         LD     HL,(0x5D52)    ; SIDE1
         LD     (0x5D54),HL    ; SIDE1+2
         LD     HL,(0x5D66)    ; SIDE2
         LD     (0x5D68),HL    ; SIDE2+2
         LD     HL,(0x5D7A)    ; WIND1
         LD     (0x5D7C),HL    ; WIND1+2
         LD     HL,(0x5D86)    ; (algún otro sprite)
         LD     (0x5D88),HL
         RET


; --- BORRA — limpia attr backup + pixels + attr live ------------------------

BORRA    LD     HL,0xFA86      ; backup attr area (PANTA+5000)
         LD     BC,608
BORRA1   LD     A,7            ; blanco
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BORRA1

         LD     HL,0x4000      ; pixel area
         LD     BC,0x1000      ; 4096 bytes
BORRA2   LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BORRA2

         LD     B,8
         LD     A,0
BORRA3   PUSH   HL
         LD     C,0x60         ; 96 bytes
BORRA4   LD     (HL),A
         INC    HL
         DEC    C
         JR     NZ,BORRA4
         POP    HL
         INC    H
         DJNZ   BORRA3
         RET


; --- PSIDE — (no llamado en el motor; código alcanzable desde main_tail) ----

PSIDE    LD     A,(0xA6A9)
         CP     2
         RET    NZ
         CALL   MUP
         LD     HL,0x5D52      ; SIDE1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D66      ; SIDE2
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D7A      ; WIND1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,0x5D86      ; (otro sprite)
         LD     (T0+1),HL
         RET


; --- VUELCA — copia attr backup → attrs live, y pixels live → PANTA backup --

VUELCA   LD     HL,0xFA86      ; backup attrs
         LD     DE,0x5800      ; live attrs
         LD     BC,608
         LDIR
         LD     HL,0x4000      ; live pixels
         LD     DE,0xE6FE      ; PANTA backup
         LD     BC,0x1000
         LDIR
         RET


; --- NOSAL — comprueba si pantalla actual está marcada como salvada ---------

NOSAL    LD     A,(VAR0)
         LD     C,A
         LD     B,0
         LD     HL,0xA6B4      ; VAR25
         ADD    HL,BC
         LD     A,(HL)
         CP     1
         RET                    ; Z si A=1, NZ otherwise


; --- PONSAL — marca pantalla actual como salvada ----------------------------

PONSAL   LD     B,0
         LD     A,(VAR0)
         LD     C,A
         LD     HL,0xA6B4      ; VAR25
         ADD    HL,BC
         LD     A,1
         LD     (HL),A
         RET


; --- CHOQUE — colisión rectangular player vs sprite (D=56, E=24) ------------
; IY = sprite enemy; usa TABLA1 (player) como segunda caja.

CHOQUE   LD     IX,TABLA1
         LD     D,0x38         ; 56 (ancho)
         LD     E,0x18         ; 24 (alto)
         CALL   RCPE
         RET


CHO_NC   AND    A              ; clear carry y volver
         RET


; --- PALO — colisión lanza (cuando DAT2=1) ----------------------------------
; D=32, E=56. Verifica también colisión con SIDE1/SIDE2.

PALO     LD     A,(DAT2)
         CP     1
         JP     NZ,CHO_NC      ; si lanza no activa, no choque
         LD     A,(0xA6A9)
         CP     2
         JP     Z,PALO_SIDES   ; si VAR=2, comprobar SIDE1/2 también
         LD     IX,TABLA1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET

PALO_SIDES
         LD     IX,0x5D52      ; SIDE1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET    C              ; si choque con SIDE1, return C
         LD     IX,0x5D66      ; SIDE2
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET    C
         LD     IX,TABLA1
         LD     D,0x20
         LD     E,0x38
         CALL   RCPE
         RET


; --- RCPE — núcleo de detección de colisión rectangular --------------------
; IX = caja A (player o lanza), IY = caja B (enemy).
; D = ancho (con margen), E = alto.
; Devuelve C=1 si hay colisión, C=0 si no.

RCPE     LD     A,D
         SBC    A,H
         CALL   NC,SWAP        ; intercambia IX/IY si necesario (orden)
         LD     A,(IX+0)
         LD     C,4            ; margen
         ADD    A,D
         ADD    A,C
         LD     D,A
         LD     A,(IY+0)
         ADD    A,H
         ADD    A,C
         LD     H,A
         LD     A,(IX+0)
         ADD    A,C
         SBC    A,H
         JR     NC,RCPE_NC     ; no choque
         LD     A,(IY+0)
         ADD    A,C
         LD     H,A
         LD     A,D
         SBC    A,H
         JR     C,RCPE_NC

         LD     A,E
         SBC    A,L
         CALL   C,SWAP
         LD     A,(IX+1)
         ADD    A,E
         ADD    A,C
         LD     E,A
         LD     A,(IY+1)
         ADD    A,L
         ADD    A,C
         LD     L,A
         LD     A,(IX+1)
         ADD    A,C
         SBC    A,L
         JR     NC,RCPE_NC
         LD     A,(IY+1)
         ADD    A,C
         LD     L,A
         LD     A,E
         SBC    A,L
         JR     C,RCPE_NC
         SCF                    ; choque
RCPE_END RET

RCPE_NC  AND    A              ; no choque
         RET


; --- SWAP — intercambia IX↔IY y DE↔HL (helper de RCPE) ---------------------

SWAP     PUSH   IX
         PUSH   IY
         POP    IX
         POP    IY
         EX     DE,HL
         RET


; --- MUPP — Insert sprite en cola (variante con DE como puntero) ------------

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


; --- T0DEC (= MDOWNN en scan) — decrementa T0 (head) -----------------------

T0DEC    LD     A,(T0)
         DEC    A
         LD     (T0),A
         RET
