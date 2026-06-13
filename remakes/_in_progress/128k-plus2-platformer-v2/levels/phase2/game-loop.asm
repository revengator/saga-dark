; SAGA DARK — Phase 2 — init (TART) + game loop (STAR/MAIN/MORTE/MUERTE/NUEVO).
; Phase 2 own loop, kept byte-perfect; replaced by engine/game-loop.asm (hook mode) at 2c.

TART:
         CALL NEGRO    ;A7AA
         LD a,0x00    ;A7AD
         LD hl,0x4000    ;A7AF
         LD (hl),a    ;A7B2
         LD de,0x4001    ;A7B3
         LD bc,0x0FFF    ;A7B6
         LDIR    ;A7B9
         CALL INICIO    ;A7BB
         DI    ;A7BE
         CALL PONLIS    ;A7BF
         LD a,0x08    ;A7C2
STAR:
         CALL PONCO    ;A7C4
         CALL DPERSO    ;A7C7
         CALL DMALO    ;A7CA
STAR2:
         CALL NEGRO    ;A7CD
         CALL BORRA    ;A7D0
         CALL RESET    ;A7D3
         CALL SPRIPE    ;A7D6
         CALL 0x6A8B    ;A7D9
         CALL VUELCA    ;A7DC
         CALL BBBBBB    ;A7DF
         LD a,(0x6A85)    ;A7E2
         CP 0xFF    ;A7E5
         JR nz,MAIN    ;A7E7
         LD a,(TRUCOD)    ;A7E9
         LD (0x6A85),a    ;A7EC
         LD a,0x01    ;A7EF
         LD (L6F53H),a    ;A7F1
         LD a,0x19    ;A7F4
         LD (DASO),a    ;A7F6
MAIN:
         CALL AAAAAA    ;A7F9
         CALL PODER    ;A7FC
         CALL PODERS    ;A7FF
         CALL ABUELO    ;A802
         CALL ANTIC2    ;A805
         CALL SALIR    ;A808
         CALL BICHOS    ;A80B
         LD a,(0x5D3E)    ;A80E
         CP 0xE0    ;A811
         JP z,MORTE    ;A813
         CP 0xA4    ;A816
         CALL z,TRUCO    ;A818
         LD a,(MUER)    ;A81B
         CP 0x01    ;A81E
         JP z,MORTE    ;A820
         LD a,(DAMA3)    ;A823
         CP 0x14    ;A826
         JP z,CARGA    ;A828
         CALL BBBBBB    ;A82B
         CALL ESPEJ    ;A82E
         CALL DDDDDD    ;A831
TOMAIN:
         JP MAIN    ;A834
TRUCO:
         LD a,(0x6A85)    ;A837
         LD (TRUCOD),a    ;A83A
         LD a,0xFF    ;A83D
         LD (0x6A85),a    ;A83F
         RET    ;A842
TRUCOD:
         NOP    ;A843
MORTE:
         LD a,0x00    ;A844
         LD (0x7C61),a    ;A846
         LD (0xA571),a    ;A849
         LD (MUER),a    ;A84C
         LD (VAR0),a    ;A84F
         LD a,0xA0    ;A852
         LD (0x5D3E),a    ;A854
         LD (0x5D40),a    ;A857
         LD a,0x3C    ;A85A
         LD (0x5D3F),a    ;A85C
         LD (0x5D41),a    ;A85F
         LD a,0x81    ;A862
         LD (0x5D2A),a    ;A864
         LD (0x5D2C),a    ;A867
         LD a,0x3C    ;A86A
         LD (0x5D2B),a    ;A86C
         LD (0x5D2D),a    ;A86F
         LD a,0x02    ;A872
         LD (0x5D32),a    ;A874
         LD (0x5D46),a    ;A877
         LD a,0x60    ;A87A
         LD (NU1),a    ;A87C
         LD a,0x00    ;A87F
         LD (NU2),a    ;A881
         CALL FMA    ;A884
         CALL DPERSO    ;A887
         CALL DMALO    ;A88A
         LD hl,VAR25    ;A88D
         LD b,0x14    ;A890
         LD a,0x00    ;A892
BABU1:
         LD (hl),a    ;A894
         INC hl    ;A895
         DJNZ BABU1    ;A896
         LD (VAR7),a    ;A898
         JP NUEVO    ;A89B
MUER:
         NOP    ;A89E
CASIRA:
         CALL DPERSO    ;A89F
         LD a,0x00    ;A8A2
         LD (NU2),a    ;A8A4
         LD a,0x60    ;A8A7
         LD (NU1),a    ;A8A9
         RET    ;A8AC
MUERTE:
    IF INFINITE_ENERGY
         RET                ; CHEAT: salida inmediata sin restar vida
         NOP                ; padding (4 bytes — preserva layout)
         NOP
         NOP
    ELSE
         LD a,(NU1)    ;A8AD
         DEC a    ;A8B0
    ENDIF
         LD (NU1),a    ;A8B1
         LD a,(NU2)    ;A8B4
         INC a    ;A8B7
         LD (NU2),a    ;A8B8
         CP 0x04    ;A8BB
         RET nz    ;A8BD
         LD a,0x00    ;A8BE
         LD (NU2),a    ;A8C0
         CALL MUERE    ;A8C3
         CALL SONI2    ;A8C6
         LD a,(NU1)    ;A8C9
         CP 0x00    ;A8CC
         RET nz    ;A8CE
         LD a,0x01    ;A8CF
         LD (MUER),a    ;A8D1
         RET    ;A8D4
NU1:
         LD h,b    ;A8D5
NU2:
         NOP    ;A8D6
NUEVO:
         LD a,0x00    ;A8D7
         LD (E1),a    ;A8D9
         LD (E2),a    ;A8DC
         LD (E3),a    ;A8DF
         LD (VARMA),a    ;A8E2
         LD (VAR47),a    ;A8E5
         LD (0xA6B2),a    ;A8E8
         LD (VAR49),a    ;A8EB
         LD (VAR13),a    ;A8EE
         LD (0xA6A7),a    ;A8F1
         JP STAR2    ;A8F4
