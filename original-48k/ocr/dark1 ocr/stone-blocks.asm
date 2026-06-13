; =============================================================================
; RUTINA DE CONTROL DE LOS BLOQUES DE PIEDRA
; Módulo: dark1-stone-blocks
; Páginas escaneadas: 3 (dark1-stone-blocks-{1..3}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 1] PIEDRA + PIEE3 + PIPI11 + PIF11/12/13/14 + PISU1/2 ------

PIEDRA   LD     A,(VARO)
         CP     4
         JP     Z,PIEE1
         CP     5
         JP     Z,PIEE2


PIEE3    LD     IY,PED4
         LD     H,32
         LD     L,40
         CALL   CHOQUE
         JP     NC,PISU1
         LD     A,(PIPI1)
         DEC    A
         LD     (PIPI1),A
         CP     0
         RET    NZ
         LD     A,2
         LD     (PIPI1),A
         LD     A,(PED4)
         CP     192
         JP     Z,PIFI1
         ADD    A,4
         LD     (PED4),A
         LD     A,(PEDD4)
         ADD    A,4
         LD     (PEDD4),A
         RET


PIPI1    DEFB   2
PIPI2    DEFB   2
PIPI3    DEFB   2
PIPI4    DEFB   2


PISU1    LD     A,(PED4)
         CP     168
         RET    Z
         SUB    4
         LD     (PED4),A
         LD     A,(PEDD4)
         SUB    4
         LD     (PEDD4),A
         RET


PIFI1    LD     A,40
         LD     (PED4),A
         LD     A,40
         LD     (PEDD4),A
         RET


PIEE1    LD     IY,PED1
         LD     H,32
         LD     L,40
         CALL   CHOQUE
         LD     A,(PIPI1)
         DEC    A
         LD     (PIPI1),A
         CP     0
         RET    NZ
         LD     A,2

; --- [PÁGINA 2] PISU2 + PIPI2 + PIFI2 + PIFI3 + PIFI4 ------------------

         LD     A,2
         LD     (PIPI2),A
         LD     A,(PED1)
         CP     192
         JP     Z,PIFI2
         ADD    A,4
         LD     (PED1),A
         LD     A,(PEDD1)
         ADD    A,4
         LD     (PEDD1),A
         RET


PISU2    LD     A,(PED1)
         CP     168
         RET    Z
         SUB    4
         LD     (PED1),A
         LD     A,(PEDD1)
         SUB    4
         LD     (PEDD1),A
         RET


PIFI2    LD     A,40
         LD     (PED1),A
         LD     A,40
         LD     (PEDD1),A
         RET


PIFI3    LD     A,40
         LD     (PED2),A
         LD     A,40
         LD     (PEDD2),A
         RET


PIFI4    LD     A,40
         LD     (PED3),A
         LD     A,40
         LD     (PEDD3),A
         RET


PIEE2    LD     IY,PED2
         LD     H,32
         LD     L,40
         CALL   CHOQUE
         JP     C,PEPE
         LD     IY,PED3
         LD     H,32
         CALL   CHOQUE
         JP     C,PEPE2


PIEU3    LD     A,(PIPI3)
         DEC    A
         LD     (PIPI3),A
         CP     0
         RET    NZ
         LD     A,2
         LD     (PIPI3),A
         LD     A,(PED2)
         CP     192
         JP     Z,PIFI3
         ADD    A,4
         LD     (PED2),A
         LD     A,(PEDD2)
         ADD    A,4
         LD     (PEDD2),A
         RET


; --- [PÁGINA 3] PEPE + PEPE2 + PED1..PED4 datos + PEI1..PEI4 datos -----

PEPE     LD     A,(PIPI3)
         DEC    A
         LD     (PIPI3),A
         CP     0
         RET    NZ
         LD     A,2
         LD     (PIPI3),A
         LD     A,(PED2)
         CP     192
         JP     Z,PIFI3
         ADD    A,4
         LD     (PED2),A
         LD     A,(PEDD2)
         ADD    A,4
         LD     (PEDD2),A
         RET


PEPE2    LD     A,(PIPI4)
         DEC    A
         LD     (PIPI4),A
         CP     0
         RET    NZ
         LD     A,2
         LD     (PIPI4),A
         LD     A,(PED3)
         CP     192
         JP     Z,PIFI4
         ADD    A,4
         LD     (PED3),A
         LD     A,(PEDD3)
         ADD    A,4
         LD     (PEDD3),A
         RET


; Datos de cabecera de los 4 bloques de piedra
PED1     DEFB   168,208,0,0,0,0,0,1,1,7
         DEFW   PE1
PED2     DEFB   168,24,0,0,0,0,0,1,1,7
         DEFW   PE1
PED3     DEFB   168,128,0,0,0,0,0,1,1,7
         DEFW   PE1
PED4     DEFB   168,16,0,0,0,0,0,1,1,7
         DEFW   PE1


PE1      DEFB   3,5,0
PFE      DEFB   255,000,255,000,255,000,255,000,255,000
         DEFB   255,000,255,000,227,000,255,000,255,000
         DEFB   255,000,255,000,128,028,031,000,255,000
         DEFB   254,000,000,030,000,127,003,224,255,000
         DEFB   240,001,000,051,000,252,000,124,127,000
         DEFB   224,015,000,253,000,255,000,191,031,128
         DEFB   192,031,000,255,000,255,000,255,015,224
         DEFB   128,061,000,255,000,255,000,255,003,240
         DEFB   000,127,000,255,000,255,000,255,001,252
         DEFB   000,095,000,255,000,255,000,255,001,252
         DEFB   128,047,000,247,000,255,000,255,001,252
         DEFB   128,055,000,254,000,127,000,255,000,250
         DEFB   128,043,000,255,000,255,000,254,001,116
         DEFB   128,052,000,255,000,254,000,119,000,202
         DEFB   192,027,000,031,000,241,000,156,000,082
         DEFB   192,029,000,231,000,199,000,207,001,172
         DEFB   192,027,000,168,000,055,000,247,003,248
         DEFB   192,023,000,215,000,247,000,255,001,244
         DEFB   224,011,000,247,000,239,000,255,003,248


; =============================================================================
; FIN — dark1-stone-blocks
; -----------------------------------------------------------------------------
; 4 bloques de piedra (PED1..PED4) que caen.
; Cada uno: PIEE/PISU/PIFI = entrada/sube/finaliza.
; El sprite PE1 se comparte entre los 4 (sólo cambian las coordenadas iniciales).
; =============================================================================
