; =============================================================================
; SAGA DARK — engine — HUD code (DPERSO/DMALO/MUERE/VIVE + helpers)
; -----------------------------------------------------------------------------
; Range: 0xD606-0xD6D7 (210 B = 172 B HUD code + 38 B TAIL_PAD zeros).
; Extracted from dark1/faces-and-enemy.asm. Engine-shared:
;   DPERSO    paints player face on HUD (uses CARA_PERSO sprite)
;   DMALO     paints enemy face on HUD (uses CARA_MALO — per-phase alias)
;   SUB_D655H/SUB_D692H   (named MUERE/VIVE in dark2): face fade routines
;
; Substitutions vs dark1 source:
;   LD hl,LE52EH  →  LD hl,CARA_PERSO   (engine sprite, shared)
;   LD hl,LE576H  →  LD hl,CARA_MALO    (per-phase alias)
; =============================================================================

DPERSO:
         LD hl,CARA_PERSO    ;D606
         LD de,0x5082    ;D609
         CALL SUB_D630H    ;D60C
         LD a,0x00    ;D60F
         LD (LD652H),a    ;D611
         LD hl,0x5082    ;D614
         LD (LD653H),hl    ;D617
         RET    ;D61A
DMALO:
         LD hl,CARA_MALO    ;D61B
         LD de,0x509B    ;D61E
         CALL SUB_D630H    ;D621
         LD a,0x00    ;D624
         LD (LD68FH),a    ;D626
         LD hl,0x509B    ;D629
         LD (LD690H),hl    ;D62C
         RET    ;D62F
SUB_D630H:
         LD b,0x03    ;D630
LD632H:
         LD c,0x08    ;D632
LD634H:
         PUSH bc    ;D634
         PUSH de    ;D635
         LD bc,0x0003    ;D636
         LDIR    ;D639
         POP de    ;D63B
         INC d    ;D63C
         POP bc    ;D63D
         DEC c    ;D63E
         JR nz,LD634H    ;D63F
         CALL SUB_D647H    ;D641
         DJNZ LD632H    ;D644
         RET    ;D646
SUB_D647H:
         PUSH hl    ;D647
         LD hl,0x07E0    ;D648
         EX de,hl    ;D64B
         AND a    ;D64C
         SBC hl,de    ;D64D
         EX de,hl    ;D64F
         POP hl    ;D650
         RET    ;D651
LD652H:
         NOP    ;D652
LD653H:
         ADD a,d    ;D653
         LD d,b    ;D654
SUB_D655H:
         LD de,(LD653H)    ;D655
         LD a,(LD652H)    ;D659
         INC a    ;D65C
         LD (LD652H),a    ;D65D
         CP 0x09    ;D660
         CALL z,SUB_D679H    ;D662
         PUSH de    ;D665
         LD b,0x03    ;D666
         LD a,0x00    ;D668
LD66AH:
         LD (de),a    ;D66A
         INC de    ;D66B
         DJNZ LD66AH    ;D66C
         POP de    ;D66E
         INC d    ;D66F
         LD (LD653H),de    ;D670
         LD bc,(LD653H)    ;D674
         RET    ;D678
SUB_D679H:
         LD a,0x01    ;D679
         LD (LD652H),a    ;D67B
LD67EH:
         LD hl,0x07E0    ;D67E
         EX de,hl    ;D681
         AND a    ;D682
         SBC hl,de    ;D683
         EX de,hl    ;D685
         RET    ;D686
SUB_D687H:
         LD a,0x01    ;D687
         LD (LD68FH),a    ;D689
         JP LD67EH    ;D68C
LD68FH:
         NOP    ;D68F
LD690H:
         SBC a,e    ;D690
         LD d,b    ;D691
SUB_D692H:
         LD de,(LD690H)    ;D692
         LD a,(LD68FH)    ;D696
         INC a    ;D699
         LD (LD68FH),a    ;D69A
         CP 0x09    ;D69D
         CALL z,SUB_D687H    ;D69F
         PUSH de    ;D6A2
         LD b,0x03    ;D6A3
         LD a,0x00    ;D6A5
LD6A7H:
         LD (de),a    ;D6A7
         INC de    ;D6A8
         DJNZ LD6A7H    ;D6A9
         POP de    ;D6AB
         INC d    ;D6AC
         LD (LD690H),de    ;D6AD
         RET    ;D6B1

; --- TAIL_PAD (0xD6B2-0xD6D7, 38 B zeros) ---
         DEFB   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00    ;0xD6B2
         DEFB   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00    ;0xD6C2
         DEFB   0x00,0x00,0x00,0x00,0x00,0x00    ;0xD6D2

