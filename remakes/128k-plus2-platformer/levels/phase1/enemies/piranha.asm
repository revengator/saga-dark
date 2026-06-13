; =============================================================================
; PIRAÑA — enemigo nivel 1 (PEZ)
; -----------------------------------------------------------------------------
; Entry:   PEZ (0x7E25)
; Sprite:  PEZ1 (0x7F29) — datos en data/piranha_sprite.bin
; Estado:  E1 (0xA84B). Si E1=0: spawn aleatorio (RENO1). Si E1=1: activo.
; Mecánica: nada hasta que el personaje toca el lateral; entonces sale por
;           la izquierda, persigue, y desaparece al borde opuesto (FINISH).
;           La lanza la mata (PAL1 → CHOQUE → MUERTE).
; Externos: E1, T0, BAJAR1, DERE1, PALOS1 (locales), CHOQUE, PALO, MUERTE,
;           MUP, MDOWN, SIZQUI, SDERE (ver defines.inc).
; =============================================================================

PEZ      LD     A,(E1)
         CP     0
         JP     Z,RENO1
         LD     IY,PEZ1
         CALL   MOV1
         CALL   CHO1
         CALL   PAL1
         RET


MOV1     CALL   CAMFA1
         LD     A,(BAJAR1)
         CP     1
         JP     Z,CONT2
         LD     A,(IY)
         CP     144
         JP     Z,CONT1
         SUB    4
         LD     (IY),A
         RET


CONT1    LD     A,(DERE1)
         CP     0
         JP     NZ,DE1
         LD     A,(IY+1)
         CP     0
         JR     Z,CDE
         SUB    4
         LD     (IY+1),A
         RET


DE1      LD     A,(IY+1)
         CP     184
         JR     Z,CIZ
         ADD    A,4
         LD     (IY+1),A
         RET


CDE      LD     IX,PEZ1
         CALL   SIZQUI
         LD     A,1
         LD     (DERE1),A
         RET


CIZ      LD     IX,PEZ1
         CALL   SDERE
         LD     A,0
         LD     (DERE1),A
         RET


CAMFA1   LD     A,(IY+8)
         INC    A
         CP     3
         CALL   Z,PON1
         LD     (IY+8),A
         RET


PON1     LD     A,1
         RET


BAJAR1   DEFB   0
DERE1    DEFB   0
PALOS1   DEFB   0


; --- [PÁGINA 2] CONT2 + RENO1 + FINISH + CHO1 + PAL1 + datos PEZ1 -------

CONT2    LD     A,(IY)
         CP     192
         JP     Z,FINISH
         ADD    A,4
         LD     (IY),A
         RET


RENO1    LD     A,R
         AND    31
         CP     0
         RET    NZ
         LD     A,1
         LD     (E1),A
         LD     IX,PEZ1
         CALL   SDERE
         LD     A,0
         LD     (DERE1),A
         LD     (PALOS1),A
         LD     (BAJAR1),A
         LD     A,176
         LD     (IX+1),A
         LD     A,192
         LD     (IX+0),A
         CALL   MUP
         LD     HL,PEZ1
         LD     (T0+1),HL
         RET


FINISH   CALL   MDOWN
         LD     A,0
         LD     (E1),A
         RET


CHO1     LD     A,(BAJAR1)
         CP     1
         RET    Z
         LD     IY,PEZ1
         LD     H,48
         LD     L,72
         CALL   CHOQUE
         RET    NC
         CALL   MUERTE
         RET


PAL1     LD     IY,PEZ1
         LD     H,40
         LD     L,64
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(VARB)
         LD     B,A
         INC    B
         LD     A,(PALOS1)
         ADD    A,B
         LD     (PALOS1),A
         SBC    A,14
         RET    C
         LD     A,1
         LD     (BAJAR1),A
         RET

; --- [SPRITE DATA EXTRAÍDO A data/piranha_sprite.bin] -----------------------
; PEZ1 (header), PEZF1, PEZF2 (frames). 1754 bytes (0x7F29 - 0x8602).
; El INCBIN se hace desde dark1.asm para evitar contaminar este módulo
; con bytes binarios. PEZ1 está EQU'd en defines.inc como 0x7F29.
; =============================================================================
