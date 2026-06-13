GLOBO:
         CALL CAMBIO    ;A573
         LD a,(0xA571)    ;A576
         CP 0x00    ;A579
         JP z,STARUP    ;A57B
         CP 0xFF    ;A57E
         JP z,DAMA4+1    ;A580
         CALL GLOPIE    ;A583
         CALL DAMA2    ;A586
         CALL DAMA1    ;A589
         RET    ;A58C
STARUP:
         LD a,0x01    ;A58D
         LD (DAMA4),a    ;A58F
         LD (0xA571),a    ;A592
         LD hl,LD300H    ;A595
         LD (LA56FH),hl    ;A598
         LD a,0x00    ;A59B
         LD (LA572H),a    ;A59D
         LD a,0x0E    ;A5A0
         LD (0x7C61),a    ;A5A2
         LD de,ENEMI1    ;A5A5
         CALL MUPP    ;A5A8
         CALL DMALO    ;A5AB
         LD a,0xC0    ;A5AE
         LD (ENEMI1),a    ;A5B0
         RET    ;A5B3
DAMA3:
         NOP    ;A5B4
DAMA4:
         LD bc,LB43AH    ;A5B5
         AND l    ;A5B8
         INC a    ;A5B9
         LD (DAMA3),a    ;A5BA
         LD a,(DAMA4)    ;A5BD
         INC a    ;A5C0
         LD (DAMA4),a    ;A5C1
         CP 0x02    ;A5C4
         JP z,MALOMU    ;A5C6
         LD de,ENEMI1    ;A5C9
         CALL MUPP    ;A5CC
         RET    ;A5CF
MALOMU:
         CALL T0DEC    ;A5D0
         LD a,0x00    ;A5D3
         LD (DAMA4),a    ;A5D5
         CALL SONI2    ;A5D8
         CALL SONI1    ;A5DB
         CALL SONI2    ;A5DE
         RET    ;A5E1
NUTD:
         NOP    ;A5E2
GLOPIE:
         LD a,(NUTD)    ;A5E3
         INC a    ;A5E6
         LD (NUTD),a    ;A5E7
         CP 0x02    ;A5EA
         RET nz    ;A5EC
         LD a,0x00    ;A5ED
         LD (NUTD),a    ;A5EF
         LD a,0x02    ;A5F2
         LD (LDBFEH),a    ;A5F4
         LD ix,(LA56FH)    ;A5F7
         LD a,(ix+0x00)    ;A5FB
         CP 0x80    ;A5FE
LA600H:
         CALL z,MATA    ;A600
         CP 0x00    ;A603
         JP z,LA61AH    ;A605
         LD (ENEMI1),a    ;A608
         LD a,(ix+0x01)    ;A60B
         LD (LDBF7H),a    ;A60E
         INC ix    ;A611
         INC ix    ;A613
         LD (LA56FH),ix    ;A615
         RET    ;A619
LA61AH:
         LD ix,LD300H    ;A61A
         LD (LA56FH),ix    ;A61E
         JP GLOPIE    ;A622
MATA:
         PUSH af    ;A625
         LD a,0x01    ;A626
         LD (LDBFEH),a    ;A628
         POP af    ;A62B
         RET    ;A62C
DAMA2:
         LD iy,ENEMI1    ;A62D
         LD h,0x38    ;A631
         LD l,0x38    ;A633
         CALL CHOQUE    ;A635
         RET nc    ;A638
         CALL MUERTE    ;A639
         JP MUERTE    ;A63C
MATA2:
         NOP    ;A63F
DAMA1:
         LD iy,ENEMI1    ;A640
         LD h,0x38    ;A644
         LD l,0x38    ;A646
         CALL PALO    ;A648
         RET nc    ;A64B
         LD a,(DAT2)    ;A64C
         CP 0x01    ;A64F
         RET nz    ;A651
         LD a,(MATA2)    ;A652
         INC a    ;A655
         LD (MATA2),a    ;A656
         CP 0x06    ;A659
         RET nz    ;A65B
         LD a,0x00    ;A65C
         LD (MATA2),a    ;A65E
         LD a,(VARB)    ;A661
         INC a    ;A664
         LD b,a    ;A665
         CP 0x02    ;A666
    IFDEF UNIFIED_PLATFORMER
         JR SININ    ;A668   TUNED: was JR z,SININ. Now UNCONDITIONAL so SININ (and thus VIVE, the HUD face-erase) runs EVERY round, not every 2nd. 28->18, ZERO-SHIFT. The VARB/VAR_PRE every-other-round gate below (A66A-A67F) is now dead code; VARB power-up scaling is intentionally dropped so the face-erase rate is decoupled from power-ups (see SININ / A693).
    ELSE
         JR z,SININ    ;A668   original shipped boss (byte-perfect path: dark2 / dark2-v2)
    ENDIF
         LD a,(VAR_PRE)    ;A66A
         INC a    ;A66D
         LD (VAR_PRE),a    ;A66E
         CP 0x02    ;A671
         JR z,MOVACT    ;A673
         LD a,(LA572H)    ;A675
         ADD a,b    ;A678
         LD (LA572H),a    ;A679
         RET    ;A67C
MOVACT:
         LD a,0x00    ;A67D
         LD (VAR_PRE),a    ;A67F
SININ:
         PUSH bc    ;A682
         CALL VIVE    ;A683
         CALL SONI1    ;A686
         CALL SONI2    ;A689
         CALL SONI3    ;A68C
         POP bc    ;A68F
         LD a,(LA572H)    ;A690
    IFDEF UNIFIED_PLATFORMER
         INC a    ;A693   TUNED: was ADD a,b (VARB+1). Now +1 per round so VMALO counts ROUNDS directly: with SININ every round (A668) and VIVE erasing 1 of the face's 24 scanlines per call, VMALO == round == VIVE-call-count. 80->3C, ZERO-SHIFT.
    ELSE
         ADD a,b    ;A693   original shipped boss (byte-perfect path)
    ENDIF
         LD (LA572H),a    ;A694
         AND a    ;A697
    IFDEF UNIFIED_PLATFORMER
         SBC a,0x18    ;A698   TUNED death threshold: VMALO (= round count = VIVE-call count, see A693) >= 0x18 (24). The HUD boss-face is 3 chars = 24 scanlines and VIVE erases 1 per call, so 24 rounds empties it EXACTLY at death (fixes "face barely drops"). Original 0x2F (47) also gave 24 VIVE calls but on every-OTHER round across 48 rounds; SININ now runs every round (A668) so 24 rounds = HALF the original duration with the same full face-drop at death. One-byte tunable; ZERO-SHIFT.
    ELSE
         SBC a,0x2F    ;A698   original shipped boss (byte-perfect path)
    ENDIF
         RET c    ;A69A
         LD a,0xFF    ;A69B   -> walking state = already-defeated exit anim (DAMA4 path counts DAMA3 up to 0x14 -> level end). Damage only lands in the floating state above (DAMA1/PALO).
         LD (0xA571),a    ;A69D
         RET    ;A6A0
