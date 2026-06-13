; =============================================================================
; ABUELO — NPC del intro (rutinas + sprite header)
; -----------------------------------------------------------------------------
; Range:  0x6E3B - 0x7262 (1064 bytes)
; Estructura:
;   0x6E3B - 0x6F4A : código (272 bytes)
;   0x6F4B - 0x6F54 : ABU sprite header (10 bytes en source)
;   0x6F55 - 0x6F58 : ABU1, ABU2 punteros DEFW (4 bytes)
;   0x6F59 - 0x7262 : 3 frames sprite (yayo1, yayo2, yayo2B) → INCBIN
;
; Variables:
;   VAR12 (0xA612) — abuelo_off (1=abuelo desactivado tras hablar)
;   VAR10 (0xA613) — contador interno
;   VAR13 (0xA615) — estado del abuelo (0=quieto, !=0=activo)
;   VAR2  (0xA619) — guarda copia previa de la fase de poderes
;   VAR1  (0xA614) — variable de fase poderes
;   TP0   (0xA6E8) — tabla de pasos del abuelo (3 bytes × 64 pantallas)
; =============================================================================

; --- SOUND2 — beeper de tono variable, paso 2 -------------------------------

SOUND2   LD     L,0
         LD     H,255
         CALL   SOUND1
         LD     L,1
         LD     H,1
         CALL   SOUND1
         RET


; --- SOUND1 — bucle de beeper para diálogo del abuelo -----------------------

SOUND1   LD     B,0xC8         ; 200 ciclos
         LD     C,1
BULE1    DEC    C
         JR     NZ,BULE1
         LD     A,%00011000    ; sonido alto
         OUT    (0xFE),A
         LD     C,H
BULE2    DEC    C
         JR     NZ,BULE2
         LD     A,0
         OUT    (0xFE),A
         CALL   PARI
         LD     C,H
         DJNZ   BULE1
         RET


; --- PARI — varía pitch según L (0=baja H, !=0=sube H) ----------------------

PARI     LD     A,L
         CP     0
         JP     Z,PARIPH
         INC    H
         RET

PARIPH   DEC    H
         RET


; --- PODER — controla si el abuelo aparece este frame -----------------------

PODER    LD     A,(0xA612)     ; VAR12 (abuelo_off)
         CP     0
         RET    NZ
         CALL   NOSAL          ; pantalla salvada?
         RET    Z
         LD     A,(DAS)
         DEC    A
         LD     (DAS),A
         CP     0
         RET    NZ
         LD     A,2
         LD     (DAS),A
         LD     A,(0xA613)     ; VAR10 (counter)
         DEC    A
         LD     (0xA613),A
         CP     0
         RET    NZ
         LD     A,40
         LD     (0xA613),A     ; reset counter a 40
         LD     HL,0xA6E8      ; TP0 (tabla pasos abuelo)
         LD     A,(VAR0)
         AND    %00111111
         LD     B,0
         LD     C,A
         ADD    HL,BC
         ADD    HL,BC
         ADD    HL,BC          ; HL = TP0 + VAR0*3
         LD     A,(HL)
         CP     0
         JP     Z,STOP
         LD     (0xA615),A     ; VAR13 = primer byte de TP0[VAR0]
         LD     (0xA619),A     ; VAR2 = lo mismo
         CALL   STOP           ; marca abuelo activado (VAR12=1)
         INC    HL
         LD     A,(HL)
         LD     (ABU),A        ; ABU = segundo byte (Y posición)
         INC    HL
         LD     A,(HL)
         LD     (ABU+1),A      ; ABU+1 = tercer byte (X posición)
         LD     DE,ABU
         CALL   MUPP           ; mete sprite ABU en cola
         LD     HL,(ABU)
         LD     (ABU+2),HL     ; copia history
         RET


; --- DAS — contador de tics entre frames del abuelo (data) ------------------

DAS      DEFB   2


; --- STOP — marca abuelo como aparecido --------------------------------------

STOP     LD     A,1
         LD     (0xA612),A     ; VAR12 = 1
         RET


; --- ABUELO — main loop del NPC abuelo --------------------------------------

ABUELO   LD     A,(0xA615)     ; VAR13
         CP     0
         RET    Z
         CALL   PONSAL         ; marca pantalla salvada
         LD     A,(DASI)
         DEC    A
         LD     (DASI),A
         CP     0
         RET    NZ
         LD     A,3
         LD     (DASI),A
         LD     A,(DASO)
         DEC    A
         LD     (DASO),A
         CP     4
         JP     Z,JU
         CP     3
         JP     Z,SOUND2
         CP     2
         JP     Z,JU2
         BIT    0,A
         JP     Z,ARRI
ABAJ     LD     A,(ABU)        ; ABAJ: mover hacia abajo
         SUB    2
         LD     (ABU),A
         RET

ARRI     LD     A,(ABU)        ; ARRI: mover hacia arriba
         INC    A
         INC    A
         LD     (ABU),A
         RET


; --- DASO/DASI — contadores (data) -----------------------------------------

DASO     DEFB   25
DASI     DEFB   3


; --- FIN — termina secuencia del abuelo (saca de cola) ---------------------

FIN      LD     A,0
         LD     (0xA615),A     ; VAR13 = 0
         LD     A,25
         LD     (DASO),A
         LD     A,4
         LD     (DASI),A
         LD     A,(ABU)
         SUB    2
         LD     (ABU),A
         CALL   AAAAAA
         CALL   T0DEC
         RET


; --- JU — anima frame 2 del abuelo -----------------------------------------

JU       LD     A,2
         LD     (ABU+8),A      ; sprite frame index = 2
         RET


; --- JU2 — anima frame 1 del abuelo y termina secuencia --------------------

JU2      LD     A,1
         LD     (ABU+8),A      ; sprite frame = 1
         LD     A,(0xA619)     ; VAR2
         LD     (0xA614),A     ; VAR1 = VAR2
         JP     FIN
         RET                   ; (orphan unreachable)


; --- ABU — sprite del abuelo (header + datos en data/abuelo_sprite.bin) ----
; ABU es la "instancia" del sprite con posición y estado actuales.

ABU      DEFB   100,130        ; Y, X actual
         DEFB   100,130        ; Y, X anterior (history)
         DEFB   0,0,0,2        ; spare + N frames (=2)
         DEFB   1,0            ; flags

; Punteros DEFW a los frames del sprite + datos del sprite (~ 778 bytes):
         INCBIN "data/abuelo_sprite.bin"
