; =============================================================================
; SAGA DARK — Phase 1 — Per-screen handlers (PA00..PAD)
; -----------------------------------------------------------------------------
; Range: 0xA8A5-0xA977 (~211 B). Per-phase code. Each PAxx handler corresponds
; to a screen group and invokes the enemies present (PEZ, GASEO, PIEDRA,
; DRAGON, SPEDY, VISCO, EXPO — all Dark 1 enemies). Dark 2 has its own
; equivalent (PA00..PA14) calling its own enemies (ARMADU, TRIVI, FUEGO,
; SIERRA, DEMON, etc.).
; =============================================================================

PA00:
         JP 0x8603    ;A8A5
PA01:
         CALL 0x8603    ;A8A8
         CALL SPEDY    ;A8AB
         RET    ;A8AE
PA03:
         CALL 0x8603    ;A8AF
         JP 0x970E    ;A8B2
         RET    ;A8B5
PA04:
         CALL PIEDRA    ;A8B6
         CALL 0x8603    ;A8B9
         CALL DRAGON    ;A8BC
         RET    ;A8BF
PA05:
         CALL PIEDRA    ;A8C0
         CALL DRAGON    ;A8C3
         RET    ;A8C6
PA06:
         CALL PIEDRA    ;A8C7
         CALL 0x8603    ;A8CA
         CALL SPEDY    ;A8CD
         RET    ;A8D0
PA08:
         CALL PEZ    ;A8D1
         RET    ;A8D4
PA010:
         CALL PEZ    ;A8D5
         CALL 0x8603    ;A8D8
         LD a,(PUUP)    ;A8DB
         CP 0xFF    ;A8DE
         CALL z,PA02    ;A8E0
         RET    ;A8E3
PA09:
         CALL VISCO    ;A8E4
         CALL EXPO    ;A8E7
         RET    ;A8EA
PA02:
         CALL DPERSO    ;A8EB
         LD a,0x00    ;A8EE
         LD (NU2),a    ;A8F0
         LD a,NRG_FULL    ;A8F3  (was 0x60; tunable, see defines.inc)
         LD (NU1),a    ;A8F5
         LD a,0x01    ;A8F8
         LD (PUUP),a    ;A8FA
         RET    ;A8FD
PUUP:
         NOP    ;A8FE
PA0D9:
         LD a,(VAR0)    ;A8FF
         CP 0x09    ;A902
         JP z,FMA    ;A904
         CP 0x02    ;A907
         JP z,SONI_LP    ;A909
         LD a,(E3)    ;A90C
         CP 0x01    ;A90F
         RET z    ;A911
         LD a,0x01    ;A912
         LD (E3),a    ;A914
         LD a,(VAR0)    ;A917
         CP 0x04    ;A91A
         JP z,PUUP_END    ;A91C
         CP 0x05    ;A91F
         JP z,PAD    ;A921
         CP 0x06    ;A924
         RET nz    ;A926
         LD de,0xA157    ;A927
         CALL MUPP    ;A92A
         LD a,0xA8    ;A92D
         LD (0xA157),a    ;A92F
         LD a,0xB0    ;A932
         LD (PEDD_X),a    ;A934
         RET    ;A937
PUUP_END:
         LD de,0xA133    ;A938
         CALL MUPP    ;A93B
         LD a,0xA8    ;A93E
         LD (0xA133),a    ;A940
         LD a,0xB0    ;A943
         LD (PEDD2),a    ;A945
         LD de,0xDD6C    ;A948
         CALL MUPP    ;A94B
         RET    ;A94E
PAD:
         LD de,0xA13F    ;A94F
         CALL MUPP    ;A952
         LD de,0xA14B    ;A955
         CALL MUPP    ;A958
         LD a,0xA8    ;A95B
         LD (0xA13F),a    ;A95D
         LD (0xA14B),a    ;A960
         LD a,0xB0    ;A963
         LD (PEDD3),a    ;A965
         LD (0xA740),a    ;A968
         LD de,0xDD6C    ;A96B
         CALL MUPP    ;A96E
         LD de,0xDD78    ;A971
         CALL MUPP    ;A974
         RET    ;A977
