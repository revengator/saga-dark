; =============================================================================
; SAGA DARK — DARK2 — Stubs EQU para labels referenciados por enemy modules
; =============================================================================
; Auto-generado durante el build inicial. Estas direcciones quedan
; pendientes de identificar (algunas son rutinas en main, otras tablas en
; RAM alta 0xE696+ usadas como buffers en runtime). Cuando se limpie main.asm
; muchos de estos se reemplazarán por nombres humanos.
; =============================================================================

; --- Refs en motor (pre-program 0x6A9B) o middle motor ----------------------
SUB_7001H      EQU 0x7001
SUB_7007H      EQU 0x7007
L7104H         EQU 0x7104
L7831H         EQU 0x7831
L7B00H         EQU 0x7B00
SUB_7BE2H      EQU 0x7BE2

; --- Refs en main_tail (0xA6A1-0xE695) — pendiente cleanup OCR -------------

; --- Refs en RAM alta (0xE696+, tablas dinámicas) --------------------------
LE700H         EQU 0xE700
SUB_EA00H      EQU 0xEA00
LEC18H         EQU 0xEC18
LEF00H         EQU 0xEF00
LF078H         EQU 0xF078
LF0F8H         EQU 0xF0F8
LF600H         EQU 0xF600
LF800H         EQU 0xF800
LF878H         EQU 0xF878
LF900H         EQU 0xF900
LFA00H         EQU 0xFA00
LFCBCH         EQU 0xFCBC
LFCCCH         EQU 0xFCCC
LFCDCH         EQU 0xFCDC
SUB_FD00H      EQU 0xFD00
LFE00H         EQU 0xFE00
LFECCH         EQU 0xFECC
LFF18H         EQU 0xFF18
LFF54H         EQU 0xFF54
LFF64H         EQU 0xFF64
LFF6CH         EQU 0xFF6C
LFF70H         EQU 0xFF70
LFF90H         EQU 0xFF90
LFFACH         EQU 0xFFAC
LFFB0H         EQU 0xFFB0
LFFBCH         EQU 0xFFBC
LFFCCH         EQU 0xFFCC
LFFD0H         EQU 0xFFD0
LFFD4H         EQU 0xFFD4
LFFECH         EQU 0xFFEC
LFFF4H         EQU 0xFFF4

; --- MUERTE (referenciada por globman) — definida en main.asm pero stub aquí
; MUERTE EQU 0xA8AD   ; ya en defines.inc

; --- Stubs adicionales auto-generados (main + faces refs) -----------------
L6F53H         EQU 0x6F53
L6FD6H         EQU 0x6FD6
SUB_7454H      EQU 0x7454
L7800H         EQU 0x7800
SUB_7CF4H      EQU 0x7CF4
SUB_7CFAH      EQU 0x7CFA
L7DF9H         EQU 0x7DF9
LE69DH         EQU 0xE69D
LE7A8H         EQU 0xE7A8
SUB_E800H      EQU 0xE800
SUB_E801H      EQU 0xE801
LE803H         EQU 0xE803
SUB_E900H      EQU 0xE900
SUB_E9EAH      EQU 0xE9EA
LEAE9H         EQU 0xEAE9
LEB00H         EQU 0xEB00
SUB_ECFAH      EQU 0xECFA
LED00H         EQU 0xED00
LED7BH         EQU 0xED7B
LEDB9H         EQU 0xEDB9
SUB_EDDAH      EQU 0xEDDA
SUB_EDEBH      EQU 0xEDEB
LEE56H         EQU 0xEE56
SUB_F000H      EQU 0xF000
LF001H         EQU 0xF001
LF0D4H         EQU 0xF0D4
SUB_F0E8H      EQU 0xF0E8
LF0FCH         EQU 0xF0FC
SUB_F3F9H      EQU 0xF3F9
SUB_F4FBH      EQU 0xF4FB
LF5F7H         EQU 0xF5F7
SUB_F6EAH      EQU 0xF6EA
LF6F5H         EQU 0xF6F5
SUB_F7FBH      EQU 0xF7FB
SUB_F801H      EQU 0xF801
SUB_F803H      EQU 0xF803
SUB_F8E4H      EQU 0xF8E4
SUB_F8F8H      EQU 0xF8F8
SUB_F9F4H      EQU 0xF9F4
SUB_F9FCH      EQU 0xF9FC
LFA07H         EQU 0xFA07
SUB_FAD7H      EQU 0xFAD7
SUB_FAF4H      EQU 0xFAF4
SUB_FAF6H      EQU 0xFAF6
SUB_FAF9H      EQU 0xFAF9
LFAFAH         EQU 0xFAFA
LFAFCH         EQU 0xFAFC
LFAFEH         EQU 0xFAFE
LFBFDH         EQU 0xFBFD
SUB_FC01H      EQU 0xFC01
SUB_FCF2H      EQU 0xFCF2
SUB_FCF8H      EQU 0xFCF8
LFCF9H         EQU 0xFCF9
SUB_FCFDH      EQU 0xFCFD
SUB_FCFEH      EQU 0xFCFE
SUB_FD7AH      EQU 0xFD7A
SUB_FDF4H      EQU 0xFDF4
SUB_FDF6H      EQU 0xFDF6
SUB_FE01H      EQU 0xFE01
LFE37H         EQU 0xFE37
LFE95H         EQU 0xFE95
SUB_FEC0H      EQU 0xFEC0
SUB_FEEAH      EQU 0xFEEA
LFEF5H         EQU 0xFEF5
LFEF6H         EQU 0xFEF6
LFEFAH         EQU 0xFEFA
LFEFDH         EQU 0xFEFD
LFEFFH         EQU 0xFEFF
LFF1FH         EQU 0xFF1F
LFF3FH         EQU 0xFF3F
LFF44H         EQU 0xFF44
LFF55H         EQU 0xFF55
LFF7CH         EQU 0xFF7C
LFFA8H         EQU 0xFFA8
SUB_FFFCH      EQU 0xFFFC
LFFFDH         EQU 0xFFFD
LFFFFH         EQU 0xFFFF

; --- Sprite FIN screen (0xE69D, preservado del .sna original) -----------
GRAFIC_FIN     EQU 0xE69D
