; =============================================================================
; SAGA DARK — engine — SONI* / FMA* / CARGA (sound, fade, cassette load)
; -----------------------------------------------------------------------------
; Range: 0xA978-0xAAA5 (~302 B). Extracted from dark1/main.asm lines 292-473.
; Engine code. SONI/SONI1/SONI*/SONI_LP = beeper sound. FMA*/LAA3BH/PICHO1/2 =
; fade routines. PAA1/PAA2/PAA1B/LAA5EH = CARGA (cassette load), equivalent
; to CARGA1/2/3 in dark2/main.asm.
; =============================================================================

SONI:
         LD b,0x0A    ;A978
         JP SONI1_LP    ;A97A
SONI1:
         LD b,0x32    ;A97D
         JP SONI1_LP    ;A97F
SONI1_LP:
         LD a,0xF8    ;A982
         OUT (0xFE),a    ;A984
         PUSH bc    ;A986
         LD b,0x14    ;A987
SONI2_BLK:
         DJNZ SONI2_BLK    ;A989
         POP bc    ;A98B
         LD a,0x00    ;A98C
         OUT (0xFE),a    ;A98E
         PUSH bc    ;A990
         LD b,0x14    ;A991
SONI_VAR:
         DJNZ SONI_VAR    ;A993
         POP bc    ;A995
         DJNZ SONI1_LP    ;A996
         RET    ;A998
SONI_LP:
         LD iy,FMA_DEC    ;A999
         LD h,0x10    ;A99D
         LD l,0x30    ;A99F
         CALL CHOQUE    ;A9A1
         CALL c,MUERTE    ;A9A4
         LD iy,0xA9B8    ;A9A7
         LD h,0x10    ;A9AB
         LD l,0x30    ;A9AD
         CALL CHOQUE    ;A9AF
         JP c,MUERTE    ;A9B2
         RET    ;A9B5
FMA_DEC:
         XOR b    ;A9B6
         JR nc,$-86    ;A9B7
         OR b    ;A9B9
FMA:
         LD a,(E1)    ;A9BA
         CP 0x00    ;A9BD
         RET nz    ;A9BF
         LD a,0x01    ;A9C0
         LD (E1),a    ;A9C2
         LD a,(0x8A63)    ;A9C5
         CP 0x01    ;A9C8
         JP z,0x8A8E    ;A9CA
         LD de,0x8ABD    ;A9CD
         CALL MUPP    ;A9D0
         LD de,0x8AA3    ;A9D3
         CALL MUPP    ;A9D6
         LD a,0x01    ;A9D9
         LD (0x8AC5),a    ;A9DB
         LD a,0x78    ;A9DE
         LD (0x8ABE),a    ;A9E0
         RET    ;A9E3
FMA1:
         LD bc,0x0260    ;A9E4
         LD hl,0x5800    ;A9E7
FMA2:
         LD a,0x00    ;A9EA
         LD (hl),a    ;A9EC
         INC hl    ;A9ED
         DEC bc    ;A9EE
         LD a,b    ;A9EF
         OR c    ;A9F0
         JR nz,FMA2    ;A9F1
         LD b,0x02    ;A9F3
FMA3:
         LD de,0xFFFF    ;A9F5
FMA4:
         DEC de    ;A9F8
         LD a,e    ;A9F9
         OR d    ;A9FA
         JR nz,FMA4    ;A9FB
         DJNZ FMA3    ;A9FD
         LD de,0x480E    ;A9FF
         LD hl,0xE636    ;AA02
         LD b,0x03    ;AA05
FMA5:
         PUSH bc    ;AA07
         PUSH de    ;AA08
         LD b,0x08    ;AA09
FMA6:
         PUSH bc    ;AA0B
         PUSH de    ;AA0C
         LD bc,0x0004    ;AA0D
         LDIR    ;AA10
         POP de    ;AA12
         INC d    ;AA13
         POP bc    ;AA14
         DJNZ FMA6    ;AA15
         POP de    ;AA17
         LD bc,0x0020    ;AA18
         EX de,hl    ;AA1B
         ADD hl,bc    ;AA1C
         EX de,hl    ;AA1D
         POP bc    ;AA1E
         DJNZ FMA5    ;AA1F
         LD hl,0x590E    ;AA21
         LD a,0x07    ;AA24
         LD b,0x03    ;AA26
FMA_X:
         PUSH bc    ;AA28
         LD b,0x04    ;AA29
FMA10:
         LD (hl),a    ;AA2B
         INC hl    ;AA2C
         DJNZ FMA10    ;AA2D
         LD de,0x001C    ;AA2F
         ADD hl,de    ;AA32
         POP bc    ;AA33
         DJNZ FMA_X    ;AA34
         LD b,0x03    ;AA36
FMA_END:
         LD de,0xFFFF    ;AA38
LAA3BH:
         DEC de    ;AA3B
         LD a,e    ;AA3C
         OR d    ;AA3D
         JR nz,LAA3BH    ;AA3E
         DJNZ FMA_END    ;AA40
    IF UNIFIED_HOOKS
; CARGA (cassette load of the next level) is unused in a unified standalone
; sandbox, and Phase 1's map is full under the canonical loop + hooks — stub it
; to reclaim ~90 B. PICHO2 is the level-end target (hooks: CARGA EQU PICHO2).
PICHO1:
PICHO2:
         DI
         JR $
    ELSE
PICHO1:
         LD a,(0x6A89)    ;AA42
         CALL COMPR    ;AA45
         JR nz,PICHO1    ;AA48
         RET    ;AA4A
PICHO2:
         LD hl,0x594B    ;AA4B
         LD b,0x0A    ;AA4E
         LD a,0xFA    ;AA50
FMA_LP1:
         LD (hl),a    ;AA52
         INC hl    ;AA53
         DJNZ FMA_LP1    ;AA54
         LD hl,0x484B    ;AA56
         LD de,PLAY    ;AA59
FMA_LP2:
         LD c,0x08    ;AA5C
LAA5EH:
         PUSH hl    ;AA5E
         LD b,0x0A    ;AA5F
PAA1:
         LD a,(de)    ;AA61
         LD (hl),a    ;AA62
         INC hl    ;AA63
         INC de    ;AA64
         DJNZ PAA1    ;AA65
         POP hl    ;AA67
         INC h    ;AA68
         DEC c    ;AA69
         JR nz,LAA5EH    ;AA6A
         LD de,0x1628    ;AA6C
         LD ix,0xE6FE    ;AA6F
         LD a,0xFF    ;AA73
         SCF    ;AA75
         EI    ;AA76
         CALL 0x0556    ;AA77
         DI    ;AA7A
         LD hl,0xE6FE    ;AA7B
         LD de,0x4000    ;AA7E
         LD bc,0x1000    ;AA81
         LDIR    ;AA84
         LD c,0x08    ;AA86
PAA2:
         PUSH de    ;AA88
         LD b,0x60    ;AA89
PAA1B:
         LD a,(hl)    ;AA8B
         LD (de),a    ;AA8C
         INC hl    ;AA8D
         INC de    ;AA8E
         DJNZ PAA1B    ;AA8F
         POP de    ;AA91
         INC d    ;AA92
         DEC c    ;AA93
         JR nz,PAA2    ;AA94
         LD de,0x5800    ;AA96
         LD bc,0x0260    ;AA99
         LDIR    ;AA9C
         JP 0xFC5E    ;AA9E
    ENDIF
