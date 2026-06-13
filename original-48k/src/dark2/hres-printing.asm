; =============================================================================
; IMPRESION (hres-printing) — Blitter de alta resolución con máscaras
; -----------------------------------------------------------------------------
; Range:  0x7263 - 0x76C3 (1121 bytes)
; Sistema de impresión de sprites con mask + sprite (cookie-cutter), rotaciones
; (SDERE/SIZQUI), espejo y buffer doble (PANTA en RAM alta + 0x4000 screen).
;
; Etiquetas externas conocidas:
;   AAAAAA (0x7263) — entry blitter principal (cola → BUFFER)
;   BBBBBB (0x72FB) — variante con offsets
;   ESPEJ  (0x7393) — versión con espejo horizontal
;   SDERE  (0x75EE) — desplaza sprite a la derecha
;   SIZQUI (0x7609) — desplaza sprite a la izquierda
;   DDDDDD (0x757A) — copia BUFFER → screen (32 LDIs unrolled × 128)
;
; NOTA: las etiquetas auto-generadas (BUCLE0, IMP1, etc.) son de
; z80dasm y se han mantenido para preservar la estructura. Pueden renombrarse
; con nombres significativos a medida que se entienda mejor el código.
; =============================================================================

AAAAAA:
         LD hl,0xF6FE    ;7263
         LD ix,T0    ;7266
         LD b,(ix+0x00)    ;726A
         DEC ix    ;726D
BUCLE0:
         PUSH bc    ;726F
         INC ix    ;7270
         INC ix    ;7272
         LD d,(ix+0x01)    ;7274
         LD e,(ix+0x00)    ;7277
         PUSH ix    ;727A
         PUSH de    ;727C
         POP ix    ;727D
         PUSH de    ;727F
         POP iy    ;7280
         CALL IMP1    ;7282
         POP ix    ;7285
         POP bc    ;7287
         DJNZ BUCLE0    ;7288
         RET    ;728A
IMP1:
         LD b,(ix+0x08)    ;728B
         LD c,0x08    ;728E
IMP1_LP1:
         INC ix    ;7290
         DEC c    ;7292
         JR nz,IMP1_LP1    ;7293
BUPO2:
         INC ix    ;7295
         INC ix    ;7297
         DJNZ BUPO2    ;7299
         LD e,(ix+0x00)    ;729B
         LD d,(ix+0x01)    ;729E
         PUSH de    ;72A1
         POP ix    ;72A2
         LD d,(iy+0x02)    ;72A4
         LD a,0x00    ;72A7
         LD b,0x03    ;72A9
USUS:
         AND a    ;72AB
         RR d    ;72AC
         RR a    ;72AE
         DJNZ USUS    ;72B0
         LD b,0x05    ;72B2
USUS_LP:
         AND a    ;72B4
         RR a    ;72B5
         DJNZ USUS_LP    ;72B7
         LD c,a    ;72B9
         LD a,d    ;72BA
         LD (iy+0x04),a    ;72BB
         LD e,(iy+0x03)    ;72BE
         LD a,0x00    ;72C1
         LD b,0x03    ;72C3
UJUJ:
         AND a    ;72C5
         RR e    ;72C6
         RR a    ;72C8
         DJNZ UJUJ    ;72CA
         LD a,e    ;72CC
         LD (iy+0x05),a    ;72CD
         LD b,(ix+0x00)    ;72D0
         LD a,c    ;72D3
         CP 0x00    ;72D4
         CALL nz,PONMAS    ;72D6
         PUSH de    ;72D9
BUCLE1:
         PUSH bc    ;72DA
         PUSH de    ;72DB
         PUSH hl    ;72DC
         CALL DIR1    ;72DD
         EX de,hl    ;72E0
         POP hl    ;72E1
         LD b,0x08    ;72E2
BUCLE1_LP:
         PUSH bc    ;72E4
         PUSH de    ;72E5
         LD b,0x00    ;72E6
         LD c,(ix+0x01)    ;72E8
         LDIR    ;72EB
         POP de    ;72ED
         POP bc    ;72EE
         INC d    ;72EF
         DJNZ BUCLE1_LP    ;72F0
         POP de    ;72F2
         POP bc    ;72F3
         INC d    ;72F4
         DJNZ BUCLE1    ;72F5
         POP de    ;72F7
         RET    ;72F8
PONMAS:
         INC b    ;72F9
         RET    ;72FA
BBBBBB:
         LD hl,0xF6FE    ;72FB
         LD ix,T0    ;72FE
         LD b,(ix+0x00)    ;7302
         DEC ix    ;7305
BUCLE0B:
         PUSH bc    ;7307
         INC ix    ;7308
         INC ix    ;730A
         LD d,(ix+0x01)    ;730C
         LD e,(ix+0x00)    ;730F
         PUSH ix    ;7312
         PUSH de    ;7314
         POP ix    ;7315
         PUSH de    ;7317
         POP iy    ;7318
         CALL IMP2    ;731A
         POP ix    ;731D
         POP bc    ;731F
         DJNZ BUCLE0B    ;7320
         RET    ;7322
IMP2:
         LD b,(ix+0x08)    ;7323
         LD c,0x08    ;7326
IMP2_LP1:
         INC ix    ;7328
         DEC c    ;732A
         JR nz,IMP2_LP1    ;732B
BPO2:
         INC ix    ;732D
         INC ix    ;732F
         DJNZ BPO2    ;7331
         LD e,(ix+0x00)    ;7333
         LD d,(ix+0x01)    ;7336
         PUSH de    ;7339
         POP ix    ;733A
         LD d,(iy+0x00)    ;733C
         LD a,0x00    ;733F
         LD b,0x03    ;7341
UUU2:
         AND a    ;7343
         RR d    ;7344
         RR a    ;7346
         DJNZ UUU2    ;7348
         LD b,0x05    ;734A
UUU2_LP:
         AND a    ;734C
         RR a    ;734D
         DJNZ UUU2_LP    ;734F
         LD c,a    ;7351
         LD a,d    ;7352
         LD (iy+0x04),a    ;7353
         LD e,(iy+0x01)    ;7356
         LD a,0x00    ;7359
         LD b,0x03    ;735B
UJUJ2:
         AND a    ;735D
         RR e    ;735E
         RR a    ;7360
         DJNZ UJUJ2    ;7362
         LD a,e    ;7364
         LD (iy+0x05),a    ;7365
         LD b,(ix+0x00)    ;7368
         LD a,c    ;736B
         CP 0x00    ;736C
         CALL nz,PONMAS    ;736E
         PUSH de    ;7371
BCLE1:
         PUSH bc    ;7372
         PUSH de    ;7373
         PUSH hl    ;7374
         CALL DIR1    ;7375
         EX de,hl    ;7378
         POP hl    ;7379
         LD b,0x08    ;737A
BCLE1_LP:
         PUSH bc    ;737C
         PUSH de    ;737D
         LD c,(ix+0x01)    ;737E
         LD b,0x00    ;7381
         EX de,hl    ;7383
         LDIR    ;7384
         EX de,hl    ;7386
         POP de    ;7387
         POP bc    ;7388
         INC d    ;7389
         DJNZ BCLE1_LP    ;738A
         POP de    ;738C
         POP bc    ;738D
         INC d    ;738E
         DJNZ BCLE1    ;738F
         POP de    ;7391
         RET    ;7392
ESPEJ:
         LD ix,T0    ;7393
         LD b,(ix+0x00)    ;7397
         DEC ix    ;739A
ESPEJ_LP:
         PUSH bc    ;739C
         INC ix    ;739D
         INC ix    ;739F
         LD d,(ix+0x01)    ;73A1
         LD e,(ix+0x00)    ;73A4
         PUSH ix    ;73A7
ESPEJ_LP2:
         PUSH de    ;73A9
         POP ix    ;73AA
         CALL CALGRA    ;73AC
         POP ix    ;73AF
         POP bc    ;73B1
         DJNZ ESPEJ_LP    ;73B2
         RET    ;73B4
CALGRA:
         PUSH ix    ;73B5
         LD b,(ix+0x08)    ;73B7
         PUSH ix    ;73BA
         POP iy    ;73BC
         INC iy    ;73BE
         INC iy    ;73C0
         INC iy    ;73C2
         INC iy    ;73C4
         INC iy    ;73C6
         INC iy    ;73C8
         INC iy    ;73CA
         INC iy    ;73CC
CALGRA_LP:
         INC iy    ;73CE
         INC iy    ;73D0
         DJNZ CALGRA_LP    ;73D2
         LD l,(iy+0x00)    ;73D4
         LD h,(iy+0x01)    ;73D7
         PUSH hl    ;73DA
         POP iy    ;73DB
         PUSH iy    ;73DD
         LD d,(ix+0x00)    ;73DF
         LD (ix+0x02),d    ;73E2
         LD a,0x00    ;73E5
         LD b,0x03    ;73E7
RIACM_LP:
         AND a    ;73E9
         RR d    ;73EA
         RR a    ;73EC
         DJNZ RIACM_LP    ;73EE
         LD b,0x05    ;73F0
BSBS:
         AND a    ;73F2
         RR a    ;73F3
         DJNZ BSBS    ;73F5
         LD (BUFER),a    ;73F7
         LD (COMPI),a    ;73FA
         LD (DATO27),a    ;73FD
         LD a,d    ;7400
BJBJ:
         LD (DATO25),a    ;7401
         LD e,(ix+0x01)    ;7404
         LD (ix+0x03),e    ;7407
         LD a,0x00    ;740A
         LD b,0x03    ;740C
BKL:
         AND a    ;740E
         RR e    ;740F
         RR a    ;7411
         DJNZ BKL    ;7413
         LD b,0x05    ;7415
BKL_LP:
         AND a    ;7417
         RR a    ;7418
         DJNZ BKL_LP    ;741A
         LD (BUUS),a    ;741C
         LD a,e    ;741F
         LD (DATO26),a    ;7420
         LD b,(iy+0x02)    ;7423
         LD a,(BUUS)    ;7426
         CP b    ;7429
         JP z,BHJB    ;742A
         JP p,RODE_PRE    ;742D
         LD h,a    ;7430
         LD a,b    ;7431
         LD b,h    ;7432
         SUB b    ;7433
         LD b,a    ;7434
         INC b    ;7435
         CALL COBNN    ;7436
BHJB:
         LD a,(BUUS)    ;7439
         LD (iy+0x02),a    ;743C
         CALL ROBE    ;743F
         POP iy    ;7442
         POP ix    ;7444
         RET    ;7446
RODE_PRE:
         SUB b    ;7447
         LD b,a    ;7448
         CALL RODE    ;7449
         JP BHJB    ;744C
DATO25:
         NOP    ;744F
DATO26:
         NOP    ;7450
RODE:
         LD b,0x01    ;7451
         PUSH de    ;7453
         PUSH iy    ;7454
         PUSH ix    ;7456
         PUSH iy    ;7458
         POP ix    ;745A
         LD de,0x0005    ;745C
         ADD iy,de    ;745F
RODE_LP:
         PUSH bc    ;7461
         PUSH iy    ;7462
         POP hl    ;7464
         LD b,0x02    ;7465
RODE_LP2:
         LD d,b    ;7467
         PUSH bc    ;7468
         PUSH hl    ;7469
         LD b,(ix+0x00)    ;746A
         AND a    ;746D
         RL b    ;746E
         RL b    ;7470
         RL b    ;7472
RODE_LP3:
         PUSH bc    ;7474
         LD b,(ix+0x01)    ;7475
         LD a,d    ;7478
         CP 0x02    ;7479
         CALL z,PONFF    ;747B
         CALL nz,PON00    ;747E
RODE_LP4:
         RRD    ;7481
         INC hl    ;7483
         INC hl    ;7484
         DJNZ RODE_LP4    ;7485
         POP bc    ;7487
         DJNZ RODE_LP3    ;7488
         POP hl    ;748A
         POP bc    ;748B
         INC hl    ;748C
         DJNZ RODE_LP2    ;748D
         POP bc    ;748F
         DJNZ RODE_LP    ;7490
         POP ix    ;7492
         POP iy    ;7494
         POP de    ;7496
         RET    ;7497
COBNN:
         LD b,0x01    ;7498
         PUSH de    ;749A
         LD h,(iy+0x04)    ;749B
         LD l,(iy+0x03)    ;749E
COBNN_LP:
         PUSH bc    ;74A1
         PUSH hl    ;74A2
         LD b,0x02    ;74A3
COBNN_LP2:
         LD d,b    ;74A5
         PUSH bc    ;74A6
         PUSH hl    ;74A7
         LD b,(iy+0x00)    ;74A8
         AND a    ;74AB
         RL b    ;74AC
         RL b    ;74AE
         RL b    ;74B0
COBNN_LP3:
         PUSH bc    ;74B2
         LD b,(iy+0x01)    ;74B3
         LD a,d    ;74B6
         CP 0x01    ;74B7
         CALL z,PONFF    ;74B9
         CALL nz,PON00    ;74BC
COBNN_LP4:
         RLD    ;74BF
         DEC hl    ;74C1
         DEC hl    ;74C2
         DJNZ COBNN_LP4    ;74C3
         POP bc    ;74C5
         DJNZ COBNN_LP3    ;74C6
         POP hl    ;74C8
         POP bc    ;74C9
         DEC hl    ;74CA
         DJNZ COBNN_LP2    ;74CB
         POP hl    ;74CD
         POP bc    ;74CE
         DJNZ COBNN_LP    ;74CF
         POP de    ;74D1
         RET    ;74D2
         NOP    ;74D3
DATO27:
         NOP    ;74D4
PONFF:
         LD a,0xFF    ;74D5
         RET    ;74D7
PON00:
         LD a,0x00    ;74D8
         RET    ;74DA
ROBE:
         LD b,(iy+0x00)    ;74DB
         PUSH de    ;74DE
         LD c,(iy+0x01)    ;74DF
         PUSH bc    ;74E2
         LD de,0x0005    ;74E3
         ADD iy,de    ;74E6
         POP bc    ;74E8
         POP de    ;74E9
ROBE_LP:
         PUSH bc    ;74EA
         PUSH de    ;74EB
         CALL DIR1    ;74EC
         LD b,0x08    ;74EF
         CALL DIRES    ;74F1
ROBE_LP2:
         PUSH bc    ;74F4
         PUSH hl    ;74F5
         LD b,c    ;74F6
ROBE_LP3:
         LD a,(iy+0x00)    ;74F7
         AND (hl)    ;74FA
         INC iy    ;74FB
         OR (iy+0x00)    ;74FD
ROBE_LP4:
         LD (hl),a    ;7500
         INC iy    ;7501
         INC hl    ;7503
         INC ix    ;7504
         DJNZ ROBE_LP3    ;7506
         POP hl    ;7508
         POP bc    ;7509
         INC h    ;750A
         INC d    ;750B
         DJNZ ROBE_LP2    ;750C
         POP de    ;750E
         INC d    ;750F
         POP bc    ;7510
         DJNZ ROBE_LP    ;7511
         LD a,(COMPI)    ;7513
         CP 0x00    ;7516
         JR nz,DIRES_K    ;7518
         RET    ;751A
DIR1:
         PUSH bc    ;751B
         PUSH de    ;751C
         POP bc    ;751D
         CALL COMPI2    ;751E
         LD a,h    ;7521
         CP 0x00    ;7522
         JR z,DIR1_K    ;7524
         LD de,0xA6FE    ;7526
         ADD hl,de    ;7529
DIR1_K:
         POP bc    ;752A
         RET    ;752B
DIRES:
         LD a,(BUFER)    ;752C
         CP 0x00    ;752F
         RET z    ;7531
         LD b,a    ;7532
DIRES_LP:
         INC d    ;7533
         INC h    ;7534
         DJNZ DIRES_LP    ;7535
         LD b,a    ;7537
         LD a,0x08    ;7538
         SUB b    ;753A
         LD b,a    ;753B
         LD a,0x00    ;753C
         LD (BUFER),a    ;753E
         RET    ;7541
DIRES_K:
         LD b,0x01    ;7542
         PUSH bc    ;7544
         PUSH de    ;7545
         CALL DIR1    ;7546
         LD a,(COMPI)    ;7549
         LD b,a    ;754C
         LD a,0x00    ;754D
         LD (COMPI),a    ;754F
         JP ROBE_LP2    ;7552
BUFER:
         NOP    ;7555
BUUS:
         NOP    ;7556
COMPI:
         NOP    ;7557
COMPI2:
         LD a,b    ;7558
         SBC a,0x08    ;7559
         JR c,COMPI2_NULL    ;755B
         LD a,b    ;755D
         SBC a,0x18    ;755E
         JR nc,COMPI2_NULL    ;7560
         LD a,b    ;7562
COMPI2_LP:
         SUB 0x08    ;7563
         LD b,a    ;7565
         LD h,0x40    ;7566
         LD a,b    ;7568
         AND 0x18    ;7569
         ADD a,h    ;756B
         LD h,a    ;756C
         LD a,b    ;756D
         AND 0x07    ;756E
         RRCA    ;7570
         RRCA    ;7571
         RRCA    ;7572
         ADD a,c    ;7573
         LD l,a    ;7574
         RET    ;7575
COMPI2_NULL:
         LD hl,0x0000    ;7576
         RET    ;7579
DDDDDD:
         LD hl,0xE6FE    ;757A
         LD de,0x4000    ;757D
         EXX    ;7580
         LD b,0x80    ;7581
DDDDDD_LP:
         EXX    ;7583
         LDI    ;7584
         LDI    ;7586
         LDI    ;7588
         LDI    ;758A
         LDI    ;758C
         LDI    ;758E
         LDI    ;7590
         LDI    ;7592
         LDI    ;7594
         LDI    ;7596
         LDI    ;7598
         LDI    ;759A
         LDI    ;759C
         LDI    ;759E
         LDI    ;75A0
         LDI    ;75A2
         LDI    ;75A4
         LDI    ;75A6
         LDI    ;75A8
         LDI    ;75AA
         LDI    ;75AC
         LDI    ;75AE
         LDI    ;75B0
         LDI    ;75B2
         LDI    ;75B4
         LDI    ;75B6
         LDI    ;75B8
         LDI    ;75BA
         LDI    ;75BC
         LDI    ;75BE
         LDI    ;75C0
         LDI    ;75C2
         EXX    ;75C4
         DJNZ DDDDDD_LP    ;75C5
         EXX    ;75C7
         RET    ;75C8
SPEJO:
         LD b,(ix+0x07)    ;75C9
SPEJO_LP:
         PUSH bc    ;75CC
         PUSH ix    ;75CD
         CALL CALG_HEAD    ;75CF
         LD a,(ix+0x02)    ;75D2
         CP 0x00    ;75D5
         JR z,SDERE_DEC    ;75D7
         LD a,0x00    ;75D9
         LD (ix+0x02),a    ;75DB
SPEJO_LP2:
         PUSH ix    ;75DE
         POP hl    ;75E0
         LD de,0x0005    ;75E1
         ADD hl,de    ;75E4
         CALL SPEJO2    ;75E5
         POP ix    ;75E8
         POP bc    ;75EA
         DJNZ SPEJO_LP    ;75EB
         RET    ;75ED
SDERE:
         PUSH ix    ;75EE
         LD a,(ix+0x06)    ;75F0
         CP 0x00    ;75F3
         JR z,SDERE_END    ;75F5
         CALL SPEJO    ;75F7
         LD a,0x00    ;75FA
SDERE_END:
         POP ix    ;75FC
         LD (ix+0x06),a    ;75FE
         RET    ;7601
SDERE_DEC:
         LD a,0x04    ;7602
         LD (ix+0x02),a    ;7604
         JR SPEJO_LP2    ;7607
SIZQUI:
         PUSH ix    ;7609
         LD a,(ix+0x06)    ;760B
         CP 0x01    ;760E
         JR z,SIZQUI_END    ;7610
         CALL SPEJO    ;7612
         LD a,0x01    ;7615
SIZQUI_END:
         POP ix    ;7617
         LD (ix+0x06),a    ;7619
         RET    ;761C
SPEJO2:
         LD b,(ix+0x00)    ;761D
         AND a    ;7620
         RL b    ;7621
         RL b    ;7623
         RL b    ;7625
SPEJO2_LP:
         LD c,(ix+0x01)    ;7627
         AND a    ;762A
         RL c    ;762B
         LD de,SPEJO_TBL    ;762D
         PUSH hl    ;7630
         PUSH bc    ;7631
         LD b,0x00    ;7632
         LDIR    ;7634
         POP bc    ;7636
         POP hl    ;7637
         CALL SPEJO2_DOIT    ;7638
         DEC hl    ;763B
         DJNZ SPEJO2_LP    ;763C
         RET    ;763E
SPEJO2_DOIT:
         PUSH hl    ;763F
         PUSH de    ;7640
         DEC de    ;7641
         DEC de    ;7642
         LD c,(ix+0x01)    ;7643
GRAFIC:
         PUSH hl    ;7646
         LD a,(de)    ;7647
         LD h,0xFF    ;7648
         LD l,a    ;764A
         LD a,(hl)    ;764B
         POP hl    ;764C
         LD (hl),a    ;764D
         INC hl    ;764E
         INC hl    ;764F
         DEC de    ;7650
         DEC de    ;7651
         DEC c    ;7652
         JP nz,GRAFIC    ;7653
         POP de    ;7656
         POP hl    ;7657
         DEC de    ;7658
         INC hl    ;7659
         LD c,(ix+0x01)    ;765A
MASK:
         PUSH hl    ;765D
         LD a,(de)    ;765E
         LD h,0xFF    ;765F
         LD l,a    ;7661
         LD a,(hl)    ;7662
         POP hl    ;7663
         LD (hl),a    ;7664
         INC hl    ;7665
         INC hl    ;7666
         DEC de    ;7667
         DEC de    ;7668
         DEC c    ;7669
         JP nz,MASK    ;766A
         RET    ;766D
PONLIS:
         LD c,0x00    ;766E
         LD h,0xFF    ;7670
         LD l,0x00    ;7672
         LD b,0xFF    ;7674
BUBU:
         PUSH bc    ;7676
         LD b,0x08    ;7677
         AND a    ;7679
         LD a,c    ;767A
BUBO:
         SRA a    ;767B
         RL c    ;767D
         DJNZ BUBO    ;767F
         LD (hl),c    ;7681
         INC hl    ;7682
         POP bc    ;7683
         INC c    ;7684
         DJNZ BUBU    ;7685
         LD a,0xFF    ;7687
         LD (hl),a    ;7689
         RET    ;768A
CALG_HEAD:
         LD c,0x08    ;768B
CALG_HEAD_LP1:
         INC ix    ;768D
         DEC c    ;768F
         JP nz,CALG_HEAD_LP1    ;7690
CALG_HEAD_LP2:
         INC ix    ;7693
         INC ix    ;7695
         DJNZ CALG_HEAD_LP2    ;7697
         LD e,(ix+0x00)    ;7699
         LD d,(ix+0x01)    ;769C
         PUSH de    ;769F
         POP ix    ;76A0
         RET    ;76A2

; --- SPEJO_TBL — tabla de espejo de bytes (33 bytes de relleno) ------------
; Inicializada a 0; se rellena con bits invertidos por la rutina PONLIS.

SPEJO_TBL:
         DEFB   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00    ;0x76A3
         DEFB   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00    ;0x76B3
         DEFB   0x00    ;0x76C3
