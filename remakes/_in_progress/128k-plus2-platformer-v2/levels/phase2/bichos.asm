; SAGA DARK — Phase 2 — BICHOS dispatcher (own; -> engine table-driven at 2c).

BICHOS:
         LD a,(0x5D32)    ;A8FB
         CP 0x05    ;A8FE
         CALL z,SONI1    ;A900
         LD a,(VAR0)    ;A903
         CP 0x00    ;A906
         JP z,PA00    ;A908
         CP 0x01    ;A90B
         JP z,PA01    ;A90D
         CP 0x02    ;A910
         JP z,PA02    ;A912
         CP 0x03    ;A915
         JP z,PA03    ;A917
         CP 0x04    ;A91A
         JP z,PA04    ;A91C
         CP 0x05    ;A91F
         JP z,PA05    ;A921
         CP 0x06    ;A924
         JP z,PA06    ;A926
         CP 0x07    ;A929
         JP z,PA07    ;A92B
         CP 0x08    ;A92E
         JP z,PA08    ;A930
         CP 0x09    ;A933
         JP z,PA09    ;A935
         CP 0x0A    ;A938
         JP z,PA10    ;A93A
         CP 0x0B    ;A93D
         JP z,PA11    ;A93F
         CP 0x0C    ;A942
         JP z,PA12    ;A944
         CP 0x0D    ;A947
         JP z,PA13    ;A949
         JP PA14    ;A94C
