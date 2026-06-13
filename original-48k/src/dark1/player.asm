; =============================================================================
; PERSO (player) — Control del jugador
; -----------------------------------------------------------------------------
; Range:  0x76C4 - 0x7B9A (1239 bytes)
; Lectura de teclado/Kempston, control de movimiento del personaje, saltos,
; disparo de la lanza, animación del sprite, gestión de las vidas.
;
; Etiquetas conocidas:
;   COMPR (0x76C4) — comprueba teclado (entry: A=código, salida Z=pulsada)
;
; Variables externas:
;   VAR0 (0xA633), VAR7 (0xA616), E1 (0xA84B), T0 (0xA652)
;
; NOTA: las etiquetas auto-generadas (LXXXXH, SUB_XXXXH) son del z80dasm,
; pueden renombrarse a medida que se entienda mejor el código.
; =============================================================================

COMPR:
         LD d,a    ;76C4
         LD a,(0x6A8A)    ;76C5
         CP 0x00    ;76C8
         JP nz,KEM_X    ;76CA
         LD a,d    ;76CD
         LD l,a    ;76CE
         LD h,0x00    ;76CF
         LD de,KEM_Z    ;76D1
         ADD hl,hl    ;76D4
KEM_LP:
         ADD hl,de    ;76D5
         LD a,(hl)    ;76D6
         INC hl    ;76D7
         IN a,(0xFE)    ;76D8
         AND (hl)    ;76DA
KEM_TBL:
         RET    ;76DB
KEM_X:
         IN a,(0x1F)    ;76DC
         AND d    ;76DE
KEM_Y:
         CP d    ;76DF
         RET    ;76E0
KEM_Z:
         RST 30h    ;76E1
         LD bc,0x02F7    ;76E2
         RST 30h    ;76E5
         INC b    ;76E6
         RST 30h    ;76E7
         EX af,af'    ;76E8
         RST 30h    ;76E9
TABLA:
         DJNZ KEM_TBL    ;76EA
         DJNZ $-15    ;76EC
         EX af,af'    ;76EE
         RST 28h    ;76EF
         INC b    ;76F0
         RST 28h    ;76F1
         LD (bc),a    ;76F2
         RST 28h    ;76F3
         LD bc,0x01FB    ;76F4
         EI    ;76F7
         LD (bc),a    ;76F8
         EI    ;76F9
         INC b    ;76FA
         EI    ;76FB
         EX af,af'    ;76FC
         EI    ;76FD
         DJNZ KEM_Y    ;76FE
VAR18M:
         DJNZ KEM_Z    ;7700
         EX af,af'    ;7702
         RST 18h    ;7703
         INC b    ;7704
         RST 18h    ;7705
         LD (bc),a    ;7706
         RST 18h    ;7707
         LD bc,0x01FD    ;7708
         DEFB 0xFD,0x02,0xFD ;illegal sequence    ;770B
         INC b    ;770E
         DEFB 0xFD,0x08,0xFD ;illegal sequence    ;770F
         DJNZ $-63    ;7712
         DJNZ KEM_LP    ;7714
         EX af,af'    ;7716
         CP a    ;7717
         INC b    ;7718
         CP a    ;7719
         LD (bc),a    ;771A
         CP a    ;771B
         LD bc,0x01FE    ;771C
         CP 0x02    ;771F
         CP 0x04    ;7721
         CP 0x08    ;7723
         CP 0x10    ;7725
         LD a,a    ;7727
         DJNZ $+129    ;7728
         EX af,af'    ;772A
         LD a,a    ;772B
         INC b    ;772C
         LD a,a    ;772D
         LD (bc),a    ;772E
         LD a,a    ;772F
         LD bc,0xCD00    ;7730
         LD l,(hl)    ;7733
         LD (hl),a    ;7734
         RET z    ;7735
         LD ix,0x5D2A    ;7736
         LD a,(ix+0x01)    ;773A
         ADD a,0x04    ;773D
         LD (ix+0x01),a    ;773F
         LD ix,0x5D3E    ;7742
         LD a,(ix+0x01)    ;7746
         ADD a,0x04    ;7749
         LD (ix+0x01),a    ;774B
         CALL POWERX_K    ;774E
         JP c,ANTIC0    ;7751
         RET    ;7754
ANTIC0:
         LD ix,0x5D2A    ;7755
         LD a,(ix+0x01)    ;7759
         SUB 0x04    ;775C
         LD (ix+0x01),a    ;775E
         LD ix,0x5D3E    ;7761
         LD a,(ix+0x01)    ;7765
         SUB 0x04    ;7768
         LD (ix+0x01),a    ;776A
         RET    ;776D
FASE:
         LD ix,0x5D3E    ;776E
         LD a,(ix+0x08)    ;7772
         CP 0x01    ;7775
         RET z    ;7777
         LD ix,0x5D2A    ;7778
         LD a,(ix+0x08)    ;777C
         CP 0x03    ;777F
         JP p,MPIES    ;7781
         CP 0x02    ;7784
         JR z,MPI    ;7786
         INC a    ;7788
         JR MPIES    ;7789
MPI:
         LD a,0x01    ;778B
MPIES:
         LD (ix+0x08),a    ;778D
         LD ix,0x5D3E    ;7790
         LD a,(MP1B_END)    ;7794
         CP 0x00    ;7797
         JR nz,MP3    ;7799
         LD a,(ix+0x08)    ;779B
         CP 0x05    ;779E
         JR z,MP1B    ;77A0
         INC a    ;77A2
MP1:
         LD (ix+0x08),a    ;77A3
         LD a,0x02    ;77A6
         CP 0x00    ;77A8
         RET    ;77AA
MP3:
         LD a,(ix+0x08)    ;77AB
         CP 0x02    ;77AE
         JR z,MP4    ;77B0
         DEC a    ;77B2
         JR MP1    ;77B3
MP4:
         LD a,0x00    ;77B5
         LD (MP1B_END),a    ;77B7
         LD a,0x03    ;77BA
         JR MP1    ;77BC
MP1B:
         LD a,0x01    ;77BE
         LD (MP1B_END),a    ;77C0
         LD a,0x04    ;77C3
         JR MP1    ;77C5
MP1B_END:
         NOP    ;77C7
CARGAS:
         LD a,(0x7731)    ;77C8
         CP 0x00    ;77CB
         RET nz    ;77CD
         LD ix,0x5D3E    ;77CE
         LD a,(ix+0x08)    ;77D2
         CP 0x01    ;77D5
         RET z    ;77D7
         LD a,(ix+0x00)    ;77D8
         ADD a,0x04    ;77DB
         LD (ix+0x00),a    ;77DD
         CALL POWERX_K    ;77E0
         JP nc,ANTI1    ;77E3
         LD a,0x01    ;77E6
         LD (ix+0x08),a    ;77E8
         LD ix,0x5D2A    ;77EB
         LD a,(ix+0x00)    ;77EF
         ADD a,0x10    ;77F2
         LD (ix+0x00),a    ;77F4
         LD ix,0x5D3E    ;77F7
         LD a,(ix+0x00)    ;77FB
         ADD a,0x0C    ;77FE
         LD (ix+0x00),a    ;7800
         RET    ;7803
ANTI1:
         LD a,(ix+0x00)    ;7804
         SUB 0x04    ;7807
         LD (ix+0x00),a    ;7809
         RET    ;780C
FINITO:
         LD ix,0x5D3E    ;780D
         LD a,(ix+0x08)    ;7811
         CP 0x01    ;7814
         RET nz    ;7816
         LD a,0x02    ;7817
         LD (ix+0x08),a    ;7819
         LD a,(ix+0x00)    ;781C
         SUB 0x10    ;781F
         LD (ix+0x00),a    ;7821
         LD ix,0x5D2A    ;7824
         LD a,(ix+0x00)    ;7828
         SUB 0x10    ;782B
         LD (ix+0x00),a    ;782D
         RET    ;7830
DAT2:
         NOP    ;7831
DAT1:
         NOP    ;7832
DISPAM:
         LD a,(DAT2)    ;7833
         CP 0x01    ;7836
         RET nz    ;7838
         CALL DESINT    ;7839
         LD ix,0x5D2A    ;783C
         LD a,(ix+0x08)    ;7840
         CP 0x03    ;7843
         JP m,DISA    ;7845
         LD a,(DAT1)    ;7848
         CP 0x00    ;784B
         JR z,SIG6    ;784D
         LD a,(ix+0x08)    ;784F
         INC a    ;7852
         CP 0x06    ;7853
         JR z,DIS    ;7855
         LD (ix+0x08),a    ;7857
         CP 0x05    ;785A
         CALL z,SIG    ;785C
         RET    ;785F
SIG6:
         LD a,(ix+0x08)    ;7860
         DEC a    ;7863
         CP 0x02    ;7864
         JR z,SIGB    ;7866
         LD (ix+0x08),a    ;7868
         RET    ;786B
SIGB:
         LD (ix+0x08),a    ;786C
         LD a,0x00    ;786F
         LD (DAT2),a    ;7871
         LD (POWERX),a    ;7874
         RET    ;7877
SIG:
         LD a,(ix+0x06)    ;7878
         CP 0x00    ;787B
         JR z,SIG1    ;787D
         LD a,(ix+0x01)    ;787F
         SUB 0x08    ;7882
         LD (ix+0x01),a    ;7884
T1:
         LD a,0x01    ;7887
         LD (T3),a    ;7889
         RET    ;788C
SIG1:
         LD a,(ix+0x01)    ;788D
         ADD a,0x08    ;7890
         LD (ix+0x01),a    ;7892
         JR T1    ;7895
T3:
         NOP    ;7897
POWER:
         LD a,0x00    ;7898
         LD (T3),a    ;789A
         LD a,(ix+0x06)    ;789D
         CP 0x00    ;78A0
         JR z,CERO    ;78A2
         LD a,(ix+0x01)    ;78A4
         ADD a,0x08    ;78A7
         LD (ix+0x01),a    ;78A9
         RET    ;78AC
CERO:
         LD a,(ix+0x01)    ;78AD
         SUB 0x08    ;78B0
         LD (ix+0x01),a    ;78B2
         RET    ;78B5
DIS:
         SUB 0x02    ;78B6
         LD (ix+0x08),a    ;78B8
         LD a,0x00    ;78BB
         LD (DAT1),a    ;78BD
         LD a,(T3)    ;78C0
         CP 0x01    ;78C3
         CALL z,POWER    ;78C5
         RET    ;78C8
DISA:
         LD a,0x03    ;78C9
         LD (ix+0x08),a    ;78CB
         LD a,0x01    ;78CE
         LD (DAT1),a    ;78D0
         RET    ;78D3
VAR19M:
         CALL FASE    ;78D4
         RET z    ;78D7
         LD ix,0x5D2A    ;78D8
         LD a,(ix+0x01)    ;78DC
         SUB 0x04    ;78DF
         LD (ix+0x01),a    ;78E1
         LD ix,0x5D3E    ;78E4
         LD a,(ix+0x01)    ;78E8
         SUB 0x04    ;78EB
         LD (ix+0x01),a    ;78ED
         CALL POWERX_K    ;78F0
         JP c,ANTICM    ;78F3
         RET    ;78F6
ANTICM:
         LD ix,0x5D2A    ;78F7
         LD a,(ix+0x01)    ;78FB
         ADD a,0x04    ;78FE
ANTICM_K:
         LD (ix+0x01),a    ;7900
         LD ix,0x5D3E    ;7903
         LD a,(ix+0x01)    ;7907
         ADD a,0x04    ;790A
         LD (ix+0x01),a    ;790C
         RET    ;790F
SALTO1:
         LD a,(0x7731)    ;7910
         CP 0x01    ;7913
         RET nz    ;7915
         LD a,(SS3)    ;7916
         CP 0x01    ;7919
         JR z,PART1    ;791B
         LD a,(DAT3)    ;791D
         CP 0x0E    ;7920
         CALL z,FINITO    ;7922
         LD a,(DAT3)    ;7925
         DEC a    ;7928
         CP 0x00    ;7929
         JR z,PART2    ;792B
         LD (DAT3),a    ;792D
         LD ix,0x5D2A    ;7930
         LD a,(ix+0x00)    ;7934
         SUB 0x04    ;7937
         LD (ix+0x00),a    ;7939
         LD ix,0x5D3E    ;793C
         LD a,(ix+0x00)    ;7940
         SUB 0x04    ;7943
         LD (ix+0x00),a    ;7945
         RET    ;7948
PART1:
         LD ix,0x5D2A    ;7949
         LD a,(ix+0x00)    ;794D
         ADD a,0x04    ;7950
         LD (ix+0x00),a    ;7952
         LD ix,0x5D3E    ;7955
         LD a,(ix+0x00)    ;7959
         ADD a,0x04    ;795C
         LD (ix+0x00),a    ;795E
         CALL POWERX_K    ;7961
         JP c,FINP1    ;7964
         LD ix,0x5D2A    ;7967
         CALL POWERX_K    ;796B
         JP c,FINP1    ;796E
         RET    ;7971
FINP1:
         LD ix,0x5D2A    ;7972
         LD a,(ix+0x00)    ;7976
         SUB 0x04    ;7979
         LD (ix+0x00),a    ;797B
         LD ix,0x5D3E    ;797E
         LD a,(ix+0x00)    ;7982
         SUB 0x04    ;7985
         LD (ix+0x00),a    ;7987
         JP SS1    ;798A
PART2:
         LD a,0x01    ;798D
         LD (SS3),a    ;798F
         RET    ;7992
SS1:
         LD a,0x00    ;7993
         LD (SS3),a    ;7995
         LD (0x7731),a    ;7998
         CALL CARGAS    ;799B
         RET    ;799E
SS3:
         NOP    ;799F
DAT3:
         LD c,0x0E    ;79A0
ANTIC2:
         LD a,(0x6A85)    ;79A2
         CALL COMPR    ;79A5
         JR z,S1    ;79A8
MOVI:
         LD a,(0x6A87)    ;79AA
         CALL COMPR    ;79AD
         JP z,VAR18M_R    ;79B0
         LD a,(0x6A88)    ;79B3
         CALL COMPR    ;79B6
         JP z,VAR19M_R    ;79B9
         LD a,(0x6A86)    ;79BC
         CALL COMPR    ;79BF
         JP z,GRAVE_K    ;79C2
S5:
         CALL FINITO    ;79C5
S3:
         CALL DISPAM    ;79C8
         LD a,(0x6A89)    ;79CB
         CALL COMPR    ;79CE
         PUSH af    ;79D1
         CALL z,DISPA    ;79D2
         POP af    ;79D5
         CALL nz,S2    ;79D6
         CALL GRAVE1    ;79D9
         CALL SALTO1    ;79DC
         CALL S10    ;79DF
         RET    ;79E2
VAR18M_R:
         CALL 0x7732    ;79E3
         JR S5    ;79E6
VAR19M_R:
         CALL VAR19M    ;79E8
         JR S5    ;79EB
DISPA:
         LD a,(DAT2)    ;79ED
         CP 0x01    ;79F0
         RET z    ;79F2
         CALL BSSI1    ;79F3
         CALL BSSI1    ;79F6
         CALL BSSI1    ;79F9
         LD a,0x01    ;79FC
         LD (DAT030),a    ;79FE
         LD (POWERX),a    ;7A01
         RET    ;7A04
S1:
         LD a,(0x7731)    ;7A05
         CP 0x01    ;7A08
         JP z,MOVI    ;7A0A
         LD a,0x0E    ;7A0D
         LD (DAT3+1),a    ;7A0F
         LD (DAT3),a    ;7A12
         CALL CARGAS    ;7A15
         LD a,0x01    ;7A18
         LD (0x7731),a    ;7A1A
         JR S3    ;7A1D
S10:
         LD a,(0x7731)    ;7A1F
         CP 0x01    ;7A22
         RET z    ;7A24
         LD ix,0x5D3E    ;7A25
         LD a,(ix+0x00)    ;7A29
         ADD a,0x04    ;7A2C
         LD (ix+0x00),a    ;7A2E
         CALL POWERX_K    ;7A31
         JP c,GRAVE    ;7A34
         LD ix,0x5D2A    ;7A37
         LD a,(ix+0x00)    ;7A3B
         ADD a,0x04    ;7A3E
         LD (ix+0x00),a    ;7A40
         RET    ;7A43
GRAVE:
         LD ix,0x5D3E    ;7A44
         LD a,(ix+0x00)    ;7A48
         SUB 0x04    ;7A4B
         LD (ix+0x00),a    ;7A4D
         RET    ;7A50
GRAVE_K:
         CALL CARGAS    ;7A51
         JP S3    ;7A54
         NOP    ;7A57
GRAVE1:
         LD a,(DAT030)    ;7A58
         CP 0x01    ;7A5B
         RET z    ;7A5D
         LD a,(POWERX)    ;7A5E
         CP 0x00    ;7A61
         RET z    ;7A63
         LD a,0x01    ;7A64
         LD (DAT2),a    ;7A66
         RET    ;7A69
S2:
         LD a,0x00    ;7A6A
         LD (DAT030),a    ;7A6C
         RET    ;7A6F
DAT030:
         NOP    ;7A70
POWERX:
         NOP    ;7A71
POWERX_K:
         LD ix,0x5D3E    ;7A72
         LD a,(ix+0x00)    ;7A76
         ADD a,0x20    ;7A79
         LD d,a    ;7A7B
         LD a,(ix+0x01)    ;7A7C
         ADD a,0x20    ;7A7F
         LD e,a    ;7A81
         LD a,(VAR0)    ;7A82
         AND 0x3F    ;7A85
         INC a    ;7A87
         LD iy,0xA665    ;7A88
DIS2:
         INC iy    ;7A8C
         INC iy    ;7A8E
         DEC a    ;7A90
         JR nz,DIS2    ;7A91
         LD h,(iy+0x01)    ;7A93
         LD l,(iy+0x00)    ;7A96
         PUSH hl    ;7A99
         POP iy    ;7A9A
         LD b,(iy+0x00)    ;7A9C
         INC iy    ;7A9F
SUELO:
         LD a,(iy+0x01)    ;7AA1
         ADD a,(iy+0x03)    ;7AA4
         LD h,a    ;7AA7
         LD a,(ix+0x01)    ;7AA8
         ADD a,0x08    ;7AAB
         SBC a,h    ;7AAD
         JR nc,SUELO_K    ;7AAE
         LD a,e    ;7AB0
         SBC a,(iy+0x01)    ;7AB1
         JR c,SUELO_K    ;7AB4
         LD a,(iy+0x00)    ;7AB6
         ADD a,(iy+0x02)    ;7AB9
         LD h,a    ;7ABC
         LD a,(ix+0x00)    ;7ABD
         SBC a,h    ;7AC0
         JR nc,SUELO_K    ;7AC1
         LD a,d    ;7AC3
         SBC a,(iy+0x00)    ;7AC4
         JR c,SUELO_K    ;7AC7
         SCF    ;7AC9
         RET    ;7ACA
SUELO_K:
         INC iy    ;7ACB
         INC iy    ;7ACD
         INC iy    ;7ACF
         INC iy    ;7AD1
         DJNZ SUELO    ;7AD3
         AND a    ;7AD5
         RET    ;7AD6
BSSI1:
         LD hl,0x5187    ;7AD7
         LD de,0x0800    ;7ADA
         LD b,0x01    ;7ADD
         LD c,0x30    ;7ADF
BSSI2:
         PUSH de    ;7AE1
         PUSH bc    ;7AE2
         LD de,0x00EE    ;7AE3
         LD c,0x06    ;7AE6
BSSI2_LP:
         LD b,0x12    ;7AE8
         SET 7,(hl)    ;7AEA
BSSI2_K:
         RR (hl)    ;7AEC
         INC hl    ;7AEE
         DJNZ BSSI2_K    ;7AEF
         ADD hl,de    ;7AF1
         DEC c    ;7AF2
         JP nz,BSSI2_LP    ;7AF3
         POP bc    ;7AF6
         POP de    ;7AF7
         AND a    ;7AF8
         SBC hl,de    ;7AF9
         PUSH bc    ;7AFB
         LD b,0x00    ;7AFC
         ADD hl,bc    ;7AFE
         POP bc    ;7AFF
CONTT1:
         DJNZ BSSI2    ;7B00
         LD a,(FUERZA)    ;7B02
         CP 0x30    ;7B05
         JP z,PERSO    ;7B07
         INC a    ;7B0A
         LD (FUERZA),a    ;7B0B
         RET    ;7B0E
PERSO:
         LD a,(0xA617)    ;7B0F
         CP 0x03    ;7B12
         RET z    ;7B14
         INC a    ;7B15
         LD (0xA617),a    ;7B16
         LD a,0x00    ;7B19
         LD (FUERZA),a    ;7B1B
         RET    ;7B1E
DESINT:
         LD a,(VAR7)    ;7B1F
         CP 0x00    ;7B22
         LD (POW),a    ;7B24
         CP 0x01    ;7B27
         JP nz,UK    ;7B29
         LD a,0x06    ;7B2C
         LD (POW),a    ;7B2E
UK:
         CP 0x02    ;7B31
         JP nz,ER    ;7B33
         LD a,0x0C    ;7B36
         LD (POW),a    ;7B38
ER:
         CP 0x03    ;7B3B
         JP nz,ER_K    ;7B3D
         RET z    ;7B40
         LD (POW),a    ;7B41
ER_K:
         LD hl,0x5198    ;7B44
         LD de,0x0800    ;7B47
         LD b,0x01    ;7B4A
         LD c,0x20    ;7B4C
OTE:
         PUSH de    ;7B4E
         PUSH bc    ;7B4F
         LD de,0x0112    ;7B50
         LD a,(POW)    ;7B53
         CP 0x00    ;7B56
         JP z,TR3    ;7B58
PUNTOS:
         DEC de    ;7B5B
         DEC a    ;7B5C
         JP nz,PUNTOS    ;7B5D
TR3:
         LD c,0x06    ;7B60
QUESE:
         LD b,0x12    ;7B62
         LD a,(POW)    ;7B64
         CP 0x00    ;7B67
         JP z,DOS    ;7B69
LEFT:
         DEC b    ;7B6C
         DEC a    ;7B6D
         JP nz,LEFT    ;7B6E
DOS:
         LD a,r    ;7B71
         AND (hl)    ;7B73
         OR a    ;7B74
         LD (hl),a    ;7B75
         RL (hl)    ;7B76
         RL (hl)    ;7B78
         DEC hl    ;7B7A
         DJNZ DOS    ;7B7B
         ADD hl,de    ;7B7D
         DEC c    ;7B7E
         JP nz,QUESE    ;7B7F
         POP bc    ;7B82
         POP de    ;7B83
         AND a    ;7B84
         SBC hl,de    ;7B85
         PUSH bc    ;7B87
         LD b,0x00    ;7B88
         ADD hl,bc    ;7B8A
         POP bc    ;7B8B
         DJNZ OTE    ;7B8C
         LD a,(VAR7)    ;7B8E
         LD (0xA617),a    ;7B91
         LD (FUERZA),a    ;7B94
         RET    ;7B97
POW:
         NOP    ;7B98
         NOP    ;7B99
FUERZA:
         NOP    ;7B9A
