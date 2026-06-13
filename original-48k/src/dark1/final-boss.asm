; =============================================================================
; FINAL BOSS — Ninja KAMUIR (boss del nivel 1)
; -----------------------------------------------------------------------------
; Range:  0xA4B0 - 0xA60B (348 bytes)
; Variables al inicio del módulo (data, NO código):
;   POSDAT  (0xA4B0)  DEFW TEF1 — puntero a tabla de pasos
;   VARMAL  (0xA4B2)  DEFB 0   — estado del boss (0=inicio, 0xFF=muriendo)
;   VMALO   (0xA4B3)  DEFB 0   — variable secundaria
;
; Entry: NINJA (0xA4B4) — main del boss
; TEF1 = 0xE696 (PASOS) tabla de movimientos del NINJA en faces.bin (104B).
; =============================================================================

POSDAT   DEFW   TEF1
VARMAL   DEFB   0
VMALO    DEFB   0

NINJA:
         CALL CAMBIO    ;A4B4
         LD a,(0xA4B2)    ;A4B7
         CP 0x00    ;A4BA
         JP z,STARUP    ;A4BC
         CP 0xFF    ;A4BF
         JP z,MALOMU+1    ;A4C1
         CALL MOVACT    ;A4C4
         CALL MATA    ;A4C7
         CALL MATA2    ;A4CA
         RET    ;A4CD
STARUP:
         LD a,0x01    ;A4CE
         LD (MALOMU),a    ;A4D0
         LD (0xA4B2),a    ;A4D3
         LD hl,TEF1    ;A4D6
         LD (POSDAT),hl    ;A4D9
         LD a,0x00    ;A4DC
         LD (VMALO),a    ;A4DE
         LD a,0x0E    ;A4E1
         LD (0x7C61),a    ;A4E3
         LD de,ENEMI1    ;A4E6
         CALL MUPP    ;A4E9
         LD de,0xD22F    ;A4EC
         CALL MUPP    ;A4EF
         CALL DMALO    ;A4F2
         LD a,0xC0    ;A4F5
         LD (ENEMI1),a    ;A4F7
         LD (0xD22F),a    ;A4FA
         RET    ;A4FD
DAMA1:
         NOP    ;A4FE
MALOMU:
         LD bc,0xFE3A    ;A4FF
         AND h    ;A502
         INC a    ;A503
         LD (DAMA1),a    ;A504
         LD a,(MALOMU)    ;A507
         INC a    ;A50A
         LD (MALOMU),a    ;A50B
         CP 0x02    ;A50E
         JP z,NUTD    ;A510
         LD de,ENEMI1    ;A513
         CALL MUPP    ;A516
         LD de,0xD22F    ;A519
         CALL MUPP    ;A51C
         RET    ;A51F
NUTD:
         CALL T0DEC    ;A520
         CALL T0DEC    ;A523
         LD a,0x00    ;A526
         LD (MALOMU),a    ;A528
         CALL 0xA97D    ;A52B
         CALL 0xA978    ;A52E
         CALL 0xA97D    ;A531
         RET    ;A534
DADA:
         NOP    ;A535
MOVACT:
         LD a,(DADA)    ;A536
         INC a    ;A539
         LD (DADA),a    ;A53A
         CP 0x02    ;A53D
         RET nz    ;A53F
         LD a,0x00    ;A540
         LD (DADA),a    ;A542
         LD ix,(POSDAT)    ;A545
         LD a,(ix+0x00)    ;A549
         CP 0x71    ;A54C
         CALL z,MOVACT_K    ;A54E
         CP 0x00    ;A551
         JP z,DAMA3    ;A553
         LD (ENEMI1),a    ;A556
         ADD a,0x40    ;A559
         LD (0xD22F),a    ;A55B
         LD a,(ix+0x01)    ;A55E
         LD (0xD224),a    ;A561
         LD (0xD230),a    ;A564
         INC ix    ;A567
         INC ix    ;A569
         LD (POSDAT),ix    ;A56B
         RET    ;A56F
DAMA3:
         LD ix,TEF1    ;A570
         LD (POSDAT),ix    ;A574
         JP MOVACT    ;A578
MOVACT_K:
         PUSH af    ;A57B
         LD a,(0x5D3E)    ;A57C
         AND a    ;A57F
         SBC a,0x90    ;A580
         CALL nc,SUP1    ;A582
         POP af    ;A585
         RET    ;A586
SUP1:
         LD a,(0x5D2A)    ;A587
         SUB 0x10    ;A58A
         LD (0x5D2A),a    ;A58C
         LD a,(0x5D3E)    ;A58F
         SUB 0x10    ;A592
         LD (0x5D3E),a    ;A594
         CALL 0xA97D    ;A597
         RET    ;A59A
MATA:
         LD iy,ENEMI1    ;A59B
         LD h,0x48    ;A59F
         LD l,0x28    ;A5A1
         CALL CHOQUE    ;A5A3
         RET nc    ;A5A6
         JP MUERTE    ;A5A7
DAMA4:
         NOP    ;A5AA
MATA2:
         LD iy,ENEMI1    ;A5AB
         LD h,0x48    ;A5AF
         LD l,0x28    ;A5B1
         CALL PALO    ;A5B3
         RET nc    ;A5B6
         LD a,(DAT2)    ;A5B7
         CP 0x01    ;A5BA
         RET nz    ;A5BC
         LD a,(DAMA4)    ;A5BD
         INC a    ;A5C0
         LD (DAMA4),a    ;A5C1
         CP 0x02    ;A5C4
         RET nz    ;A5C6
         LD a,0x00    ;A5C7
         LD (DAMA4),a    ;A5C9
         LD a,(VARB)    ;A5CC
         INC a    ;A5CF
         LD b,a    ;A5D0
         CP 0x02    ;A5D1
         JR z,SUP_K    ;A5D3
         LD a,(0xA60C)    ;A5D5
         INC a    ;A5D8
         LD (0xA60C),a    ;A5D9
         CP 0x02    ;A5DC
         JR z,SUP    ;A5DE
         LD a,(VMALO)    ;A5E0
         ADD a,b    ;A5E3
         LD (VMALO),a    ;A5E4
         RET    ;A5E7
SUP:
         LD a,0x00    ;A5E8
         LD (0xA60C),a    ;A5EA
SUP_K:
         PUSH bc    ;A5ED
         CALL 0xD692    ;A5EE
         CALL 0xA978    ;A5F1
         CALL 0xA97D    ;A5F4
         CALL 0xA978    ;A5F7
         POP bc    ;A5FA
         LD a,(VMALO)    ;A5FB
         ADD a,b    ;A5FE
         LD (VMALO),a    ;A5FF
         AND a    ;A602
         SBC a,0x2F    ;A603
         RET c    ;A605
         LD a,0xFF    ;A606
         LD (0xA4B2),a    ;A608
         RET    ;A60B
