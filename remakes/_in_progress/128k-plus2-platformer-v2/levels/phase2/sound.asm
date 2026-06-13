; SAGA DARK — Phase 2 — SONI/FMA/CARGA (own; -> engine sound-fade-carga at 2c).

SONI1:
         LD b,0x0A    ;A9A6
         JP SONI    ;A9A8
SONI2:
         LD b,0x14    ;A9AB
         JP SONI    ;A9AD
SONI3:
         LD b,0x1E    ;A9B0
         JP SONI    ;A9B2
SONI4:
         LD b,0x28    ;A9B5
         JP SONI    ;A9B7
         LD b,0x32    ;A9BA
         JP SONI    ;A9BC
SONI:
         LD c,b    ;A9BF
LA9C0H:
         LD a,0xF8    ;A9C0
         OUT (0xFE),a    ;A9C2
         PUSH bc    ;A9C4
         LD b,c    ;A9C5
SONIM4:
         DJNZ SONIM4    ;A9C6
         POP bc    ;A9C8
         LD a,0x00    ;A9C9
         OUT (0xFE),a    ;A9CB
         PUSH bc    ;A9CD
         LD b,c    ;A9CE
SONIM3:
         DJNZ SONIM3    ;A9CF
         POP bc    ;A9D1
         DJNZ LA9C0H    ;A9D2
         RET    ;A9D4
FMA:
         LD bc,0x0260    ;A9D5
         LD hl,0x5800    ;A9D8
FMA1:
         LD a,0x00    ;A9DB
         LD (hl),a    ;A9DD
         INC hl    ;A9DE
         DEC bc    ;A9DF
         LD a,b    ;A9E0
         OR c    ;A9E1
         JP nz,FMA1    ;A9E2
         LD b,0x02    ;A9E5
FMA2:
         LD de,LFFFFH    ;A9E7
FMA3:
         DEC de    ;A9EA
         LD a,e    ;A9EB
         OR d    ;A9EC
         JP nz,FMA3    ;A9ED
         DJNZ FMA2    ;A9F0
         LD de,0x480E    ;A9F2
         LD hl,LE69DH    ;A9F5
         LD b,0x03    ;A9F8
FMA4:
         PUSH bc    ;A9FA
         PUSH de    ;A9FB
         LD b,0x08    ;A9FC
FMA5:
         PUSH bc    ;A9FE
         PUSH de    ;A9FF
         LD bc,0x0004    ;AA00
         LDIR    ;AA03
         POP de    ;AA05
         INC d    ;AA06
         POP bc    ;AA07
         DJNZ FMA5    ;AA08
         POP de    ;AA0A
         LD bc,0x0020    ;AA0B
         EX de,hl    ;AA0E
         ADD hl,bc    ;AA0F
         EX de,hl    ;AA10
         POP bc    ;AA11
         DJNZ FMA4    ;AA12
         LD hl,0x590E    ;AA14
FMA6:
         LD a,0x07    ;AA17
         LD b,0x03    ;AA19
FMA7:
         PUSH bc    ;AA1B
         LD b,0x04    ;AA1C
FMA8:
         LD (hl),a    ;AA1E
         INC hl    ;AA1F
         DJNZ FMA8    ;AA20
         LD de,0x001C    ;AA22
         ADD hl,de    ;AA25
         POP bc    ;AA26
         DJNZ FMA7    ;AA27
         LD b,0x03    ;AA29
FMA9:
         LD de,LFFFFH    ;AA2B
FMA10:
         DEC de    ;AA2E
         LD a,e    ;AA2F
         OR d    ;AA30
         JP nz,FMA10    ;AA31
         DJNZ FMA9    ;AA34
    IFNDEF UNIFIED_PLATFORMER
; Original cassette-load wait-key: in standalone Phase 2 the user pressed any
; key to confirm before the next-level tape load. In the unified platformer
; there is no tape — death → respawn must continue automatically. Skipping the
; wait-key falls through to the RET, so FMA returns and MORTE_RESET continues
; into DPERSO/DMALO/VAR25-clear/NUEVO_RESET/PREAMBLE.
LAA36H:
         LD a,(0x6A89)    ;AA36
         CALL COMPR    ;AA39
         JP nz,LAA36H    ;AA3C
    ENDIF
         RET    ;AA3F
CARGA:
    IFDEF UNIFIED_PLATFORMER
; In the unified platformer build there is no Phase 3 yet and no tape. Phase 2
; level-end jumps to end_of_demo_screen (lives in bank 4 = slot 3 after the
; Phase 1 → Phase 2 transition, placed at 0xE30D by main.asm — see the bank-4
; stash override at the end of main.asm). Hardcoded so this file stays
; independent of the wrapper.
         JP 0xE30D
    ELSE
         LD hl,0x594B    ;AA40
CARGA1:
         LD b,0x0A    ;AA43
         LD a,0xFA    ;AA45
LAA47H:
         LD (hl),a    ;AA47
         INC hl    ;AA48
         DJNZ LAA47H    ;AA49
         LD hl,0x484B    ;AA4B
         LD de,PLAY    ;AA4E
         LD c,0x08    ;AA51
CARGA2:
         PUSH hl    ;AA53
         LD b,0x0A    ;AA54
CARGA3:
         LD a,(de)    ;AA56
         LD (hl),a    ;AA57
         INC hl    ;AA58
         INC de    ;AA59
         DJNZ CARGA3    ;AA5A
         POP hl    ;AA5C
         INC h    ;AA5D
         DEC c    ;AA5E
         JR nz,CARGA2    ;AA5F
         LD de,0x1BC8    ;AA61
         LD ix,LE337H    ;AA64
         LD a,0xFF    ;AA68
         SCF    ;AA6A
         EI    ;AA6B
         CALL 0x0556    ;AA6C
         DI    ;AA6F
         LD hl,LE337H    ;AA70
         LD de,0x4000    ;AA73
         LD bc,0x1B00    ;AA76
         LDIR    ;AA79
         JP LFE37H    ;AA7B
    ENDIF
