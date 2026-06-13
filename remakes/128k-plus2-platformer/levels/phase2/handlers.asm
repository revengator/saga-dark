; SAGA DARK — Phase 2 — per-screen handlers PA00..PA14.

PA00:
         JP TRIVI    ;A94F
PA01:
         CALL DEMON    ;A952
         JP SALTA    ;A955
PA02:
         CALL TRIVI    ;A958
         JP DEMON    ;A95B
PA03:
         CALL ARMADU    ;A95E
         JP LLAMAS    ;A961
PA04:
         CALL DEMON    ;A964
         JP LLAMAS    ;A967
PA05:
         CALL DEMON    ;A96A
         JP SALTA    ;A96D
PA06:
         JP DEMON    ;A970
PA07:
         CALL ARMADU    ;A973
         JP TRIVI    ;A976
PA08:
         CALL FUEGO    ;A979
         CALL PINCHO    ;A97C
         JP 0x8EA6    ;A97F
PA09:
         CALL FUEGO    ;A982
         JP 0x8EA6    ;A985
PA10:
         CALL FUEGO    ;A988
         CALL PINCHO    ;A98B
         JP 0x8EA6    ;A98E
PA11:
         CALL ARMADU    ;A991
         JP LLAMAS    ;A994
PA12:
         CALL FUEGO    ;A997
         CALL SALTA    ;A99A
         JP ARMADU    ;A99D
PA13:
         JP PINCHO    ;A9A0
PA14:
         JP GLOBO    ;A9A3
