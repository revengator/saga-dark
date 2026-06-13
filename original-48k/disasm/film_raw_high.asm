; z80dasm 1.2.0
; command line: z80dasm -a -l -g 0xFE0D /tmp/film_code2.bin

	org 0fe0dh

	jr nz,$-68		;fe0d
	ld a,007h		;fe0f
	add a,d			;fe11
	ld d,a			;fe12
	ld a,c			;fe13
	cp 001h			;fe14
	jr nz,$-77		;fe16
	pop de			;fe18
	pop bc			;fe19
	ret			;fe1a
	ld hl,07e55h		;fe1b
	dec h			;fe1e
	ld (05c36h),hl		;fe1f
	ret			;fe22
	ld hl,05d2ah		;fe23
	dec h			;fe26
	ld (05c36h),hl		;fe27
	ret			;fe2a
	call 07e1bh		;fe2b
	ld hl,07e38h		;fe2e
	call 0611dh		;fe31
	call 07e23h		;fe34
	ret			;fe37
	ld d,001h		;fe38
	nop			;fe3a
	djnz lfe44h		;fe3b
	ld de,01300h		;fe3d
	nop			;fe40
	jr nz,lfe65h		;fe41
	inc h			;fe43
lfe44h:
	ld h,028h		;fe44
	ld d,002h		;fe46
	nop			;fe48
	ld hl,02523h		;fe49
	daa			;fe4c
	add hl,hl		;fe4d
	ld d,000h		;fe4e
	dec e			;fe50
	ld hl,(02c2bh)		;fe51
	rst 38h			;fe54
	nop			;fe55
	nop			;fe56
	nop			;fe57
	inc b			;fe58
	dec e			;fe59
	inc d			;fe5a
	inc d			;fe5b
	dec e			;fe5c
	dec b			;fe5d
	ld bc,00001h		;fe5e
	nop			;fe61
	nop			;fe62
	nop			;fe63
	nop			;fe64
lfe65h:
	nop			;fe65
	or d			;fe66
	ld b,d			;fe67
	ld c,(hl)		;fe68
	nop			;fe69
	rst 38h			;fe6a
lfe6bh:
	sbc a,a			;fe6b
	ret po			;fe6c
	defb 0fdh,0a7h,0c0h ;illegal sequence	;fe6d
	nop			;fe70
	nop			;fe71
	nop			;fe72
	nop			;fe73
	nop			;fe74
	nop			;fe75
	ret nz			;fe76
	ld (hl),b		;fe77
	inc bc			;fe78
	ld a,(hl)		;fe79
	rst 38h			;fe7a
	rst 38h			;fe7b
	nop			;fe7c
	inc l			;fe7d
	call m,00007h		;fe7e
	nop			;fe81
	nop			;fe82
lfe83h:
	nop			;fe83
	nop			;fe84
	nop			;fe85
	nop			;fe86
	nop			;fe87
	nop			;fe88
	inc a			;fe89
	jp 0ff5fh		;fe8a
	call m,sub_ff00h	;fe8d
	nop			;fe90
	nop			;fe91
	nop			;fe92
	nop			;fe93
	nop			;fe94
	nop			;fe95
	nop			;fe96
	nop			;fe97
	nop			;fe98
lfe99h:
	nop			;fe99
lfe9ah:
	nop			;fe9a
	jr lfe83h		;fe9b
	ld e,01ch		;fe9d
	ret po			;fe9f
	nop			;fea0
	nop			;fea1
	nop			;fea2
	nop			;fea3
	nop			;fea4
	nop			;fea5
	nop			;fea6
	nop			;fea7
	nop			;fea8
	nop			;fea9
	inc c			;feaa
	rst 38h			;feab
	nop			;feac
	nop			;fead
	nop			;feae
	nop			;feaf
	rrca			;feb0
	di			;feb1
	inc bc			;feb2
	rst 38h			;feb3
	nop			;feb4
	nop			;feb5
	ld b,b			;feb6
	cp a			;feb7
	cp (hl)			;feb8
	cp l			;feb9
	defb 0fdh,0feh,000h ;illegal sequence	;feba
	rst 38h			;febd
	add a,b			;febe
	rst 38h			;febf
	and h			;fec0
	defb 0edh ;next byte illegal after ed	;fec1
	and h			;fec2
	rst 38h			;fec3
	and h			;fec4
lfec5h:
	jr c,lfe6bh		;fec5
	defb 0edh ;next byte illegal after ed	;fec7
	and h			;fec8
	rst 38h			;fec9
	and h			;feca
	and h			;fecb
	defb 0edh ;next byte illegal after ed	;fecc
	and h			;fecd
lfeceh:
	jr c,$+1		;fece
	and h			;fed0
	and h			;fed1
	defb 0edh ;next byte illegal after ed	;fed2
	and h			;fed3
	rst 38h			;fed4
	and h			;fed5
	xor l			;fed6
	jr c,$+1		;fed7
	ccf			;fed9
	cp (hl)			;feda
	cp l			;fedb
	cp h			;fedc
	cp e			;fedd
	cp b			;fede
	cp b			;fedf
	jr c,lfe9ah		;fee0
	cp a			;fee2
	cp h			;fee3
lfee4h:
	cp (hl)			;fee4
	cp (hl)			;fee5
	cp (hl)			;fee6
	cp (hl)			;fee7
	or d			;fee8
	jr c,lfe99h		;fee9
	sub d			;feeb
	and d			;feec
	and d			;feed
	and d			;feee
	and d			;feef
	and d			;fef0
	cp (hl)			;fef1
	jr c,$+1		;fef2
	ei			;fef4
	ld a,e			;fef5
	dec sp			;fef6
	cp e			;fef7
	ld d,c			;fef8
	ld de,03815h		;fef9
	ld sp,035f1h		;fefc
	ld (hl),l		;feff
sub_ff00h:
	ld (hl),l		;ff00
	ld (hl),c		;ff01
	ld sp,hl		;ff02
	rst 0			;ff03
	jr c,$+109		;ff04
	push de			;ff06
	jp c,0ca54h		;ff07
	ld b,h			;ff0a
	jp nz,0387ch		;ff0b
	rst 38h			;ff0e
	cp a			;ff0f
	cp a			;ff10
	cp a			;ff11
	cp a			;ff12
	ld e,a			;ff13
	inc e			;ff14
	jr lff4fh		;ff15
	ld e,b			;ff17
	jr $+26			;ff18
	jr lff6ch		;ff1a
	djnz lff2eh		;ff1c
	djnz lff58h		;ff1e
	djnz lff43h		;ff20
	and e			;ff22
	and c			;ff23
	and b			;ff24
	and b			;ff25
	ret nz			;ff26
	ret nz			;ff27
	jr c,$+1		;ff28
	rst 38h			;ff2a
	rst 38h			;ff2b
	rst 38h			;ff2c
	rst 38h			;ff2d
lff2eh:
	rst 38h			;ff2e
	inc bc			;ff2f
	ld d,l			;ff30
	jr c,lff5ch		;ff31
	dec b			;ff33
	ld bc,062f4h		;ff34
	ld h,h			;ff37
	ld (bc),a		;ff38
	inc b			;ff39
	jr c,lfeceh		;ff3a
	sbc a,b			;ff3c
	sbc a,l			;ff3d
	ex af,af'		;ff3e
	ld bc,00100h		;ff3f
	nop			;ff4Warning: Code might not be 8080 compatible!
2
lff43h:
	jr c,lfec5h		;ff43
	sub l			;ff45
	adc a,e			;ff46
	add a,(hl)		;ff47
	add a,l			;ff48
	adc a,e			;ff49
	adc a,d			;ff4a
	adc a,d			;ff4b
	jr c,$-116		;ff4c
	adc a,d			;ff4e
lff4fh:
	adc a,e			;ff4f
	add a,l			;ff50
	add a,(hl)		;ff51
	add a,a			;ff52
	add a,l			;ff53
	add a,(hl)		;ff54
	jr c,lfee4h		;ff55
	ld e,d			;ff57
lff58h:
	ld d,l			;ff58
	ld e,b			;ff59
	ld d,e			;ff5a
	ld e,d			;ff5b
lff5ch:
	or d			;ff5c
	xor d			;ff5d
	jr c,lff9fh		;ff5e
	ccf			;ff60
	cp (hl)			;ff61
	inc bc			;ff62
	push af			;ff63
	ld a,(bc)		;ff64
	ld b,h			;ff65
	add a,d			;ff66
	jr c,lff6dh		;ff67
	ld (bc),a		;ff69
	inc b			;ff6a
	ld sp,hl		;ff6b
lff6ch:
	inc bc			;ff6c
lff6dh:
	xor a			;ff6d
lff6eh:
	ld b,(hl)		;ff6e
	and e			;ff6f
lff70h:
	jr c,$+51		;ff70
	cp b			;ff72
	inc a			;ff73
	ld (bc),a		;ff74
	rst 38h			;ff75
	xor e			;ff76
	xor e			;ff77
	xor e			;ff78
	jr c,$+1		;ff79
	rst 38h			;ff7b
	rra			;ff7c
	jr nc,lff6eh		;ff7d
	ret c			;ff7f
	jp nc,038d4h		;ff80
	ret nc			;ff83
	ret nc			;ff84
	ret nc			;ff85
	rst 28h			;ff86
	ret p			;ff87
	dec a			;ff88
	jr lffbch		;ff89
	jr c,lff70h		;ff8b
lff8dh:
	dec b			;ff8d
	add hl,bc		;ff8e
	rra			;ff8f
	jr nc,$+57		;ff90
	dec (hl)		;ff92
	dec (hl)		;ff93
	jr c,$+1		;ff94
	ret m			;ff96
	ret m			;ff97
	jr c,lfff3h		;ff98
	xor b			;ff9a
	ld c,b			;ff9b
	add hl,hl		;ff9c
	jr c,lffe7h		;ff9d
lff9fh:
	jr z,lffeah		;ff9f
	sbc a,b			;ffa1
	jr c,lff8dh		;ffa2
	adc a,b			;ffa4
	ret m			;ffa5
	jr c,lffa9h		;ffa6
	ld a,b			;ffa8
lffa9h:
	ld c,b			;ffa9
	ld e,c			;ffaa
	ld l,b			;ffab
	ld c,b			;ffac
	ld c,c			;ffad
	ld c,b			;ffae
	jr c,$+1		;ffaf
	ld a,031h		;ffb1
	ld l,031h		;ffb3
	ld a,(03a3dh)		;ffb5
	jr c,lffebh		;ffb8
	ld l,031h		;ffba
lffbch:
	ld a,(03a3dh)		;ffbc
	ld sp,0382eh		;ffbf
	ld sp,03d3ah		;ffc2
	ld a,(02e31h)		;ffc5
	ld sp,0383ah		;ffc8
	rst 38h			;ffcb
	nop			;ffcc
	rst 38h			;ffcd
	djnz $+1		;ffce
	nop			;ffd0
	ld d,l			;ffd1
	nop			;ffd2
	jr c,$+1		;ffd3
	djnz $+1		;ffd5
lffd7h:
	nop			;ffd7
	ld d,l			;ffd8
	nop			;ffd9
	rst 38h			;ffda
	ex af,af'		;ffdb
	jr c,$+1		;ffdc
	nop			;ffde
	ld d,l			;ffdf
	nop			;ffe0
	rst 38h			;ffe1
	inc b			;ffe2
	rst 38h			;ffe3
	nop			;ffe4
	jr c,lffd7h		;ffe5
lffe7h:
	rst 30h			;ffe7
	dec d			;ffe8
	rst 28h			;ffe9
lffeah:
	dec d			;ffea
lffebh:
	or l			;ffeb
	ld (hl),a		;ffec
	or l			;ffed
	jr c,$+23		;ffee
	rst 28h			;fff0
	dec d			;fff1
	or l			;fff2
lfff3h:
	ld (hl),a		;fff3
	or l			;fff4
	dec d			;fff5
	rst 28h			;fff6
	jr c,$+23		;fff7
	or l			;fff9
	ld (hl),a		;fffa
	or l			;fffb
	dec d			;fffc
	rst 28h			;fffd
	dec d			;fffe
	or l			;ffff
