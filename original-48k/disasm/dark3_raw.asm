; z80dasm 1.2.0
; command line: z80dasm -a -l -g 0x9C40 /tmp/dark3_code.bin

	org 09c40h

l9c40h:
	jp l9f7eh		;9c40
l9c43h:
	ld a,(la26eh)		;9c43
	cp 000h			;9c46
	jp z,l9f7eh		;9c48
	ld hl,l9c6ch		;9c4b
	call 09eafh		;9c4e
	ld ix,lafc8h		;9c51
	ld de,01bc8h		;9c55
	ld a,0ffh		;9c58
	scf			;9c5a
	call 00556h		;9c5b
	ld hl,lafc8h		;9c5e
	ld de,04000h		;9c61
	ld bc,01b00h		;9c64
	ldir			;9c67
	jp lcac8h		;9c69
l9c6ch:
	ld d,007h		;9c6c
	dec bc			;9c6e
	inc de			;9c6f
	nop			;9c70
	ld (de),a		;9c71
	ld bc,00210h		;9c72
	ld de,05007h		;9c75
	ld d,l			;9c78
	ld c,h			;9c79
sub_9c7ah:
	ld d,e			;9c7a
	ld b,c			;9c7b
	jr nz,l9cceh		;9c7c
	ld c,h			;9c7e
	ld b,c			;9c7f
	ld e,c			;9c80
	rst 38h			;9c81
sub_9c82h:
	call sub_9d32h		;9c82
	call sub_9cd6h		;9c85
sub_9c88h:
	ld a,(l9cb6h)		;9c88
	ld c,a			;9c8b
	ld a,(la26fh)		;9c8c
	cp 001h			;9c8f
	call z,sub_9cb3h	;9c91
	ld a,c			;9c94
	ld b,000h		;9c95
	ld hl,l9cb7h		;9c97
	ld de,05811h		;9c9a
	cp 000h			;9c9d
	jr z,l9ca3h		;9c9f
	ldir			;9ca1
l9ca3h:
	ld b,a			;9ca3
	ld a,00fh		;9ca4
	sub b			;9ca6
	cp 000h			;9ca7
	ret z			;9ca9
	ld c,a			;9caa
	ld b,000h		;9cab
	ld hl,l9cc6h		;9cad
	ldir			;9cb0
	ret			;9cb2
sub_9cb3h:
	ld c,00fh		;9cb3
	ret			;9cb5
l9cb6h:
	nop			;9cb6
l9cb7h:
	ld h,b			;9cb7
	ld h,b			;9cb8
	ld h,b			;9cb9
	ld h,b			;9cba
	ld h,b			;9cbb
	ld h,b			;9cbc
	ld l,b			;9cbd
	ld l,b			;9cbe
	ld l,b			;9cbf
	ld l,b			;9cc0
	ld l,b			;9cc1
	ld (hl),b		;9cc2
	ld (hl),b		;9cc3
	ld (hl),b		;9cc4
	ld (hl),b		;9cc5
l9cc6h:
	rlca			;9cc6
	rlca			;9cc7
	rlca			;9cc8
	rlca			;9cc9
	rlca			;9cca
	rlca			;9ccb
	rlca			;9ccc
	rlca			;9ccd
l9cceh:
	rlca			;9cce
	rlca			;9ccf
	rlca			;9cd0
	rlca			;9cd1
	rlca			;9cd2
	rlca			;9cd3
	rlca			;9cd4
	rlca			;9cd5
sub_9cd6h:
	ld a,(l9d13h)		;9cd6
	cp 000h			;9cd9
	jr z,l9cf7h		;9cdb
	ld a,(l9d85h)		;9cdd
	call sub_9d87h		;9ce0
	jp nz,l9d14h		;9ce3
	ld a,(l9d84h)		;9ce6
	call sub_9d87h		;9ce9
	jp z,l9d14h		;9cec
	ld a,000h		;9cef
	ld (l9d13h),a		;9cf1
	jp l9d08h		;9cf4
l9cf7h:
	ld a,(l9d85h)		;9cf7
	call sub_9d87h		;9cfa
	jp z,l9d14h		;9cfd
	ld a,001h		;9d00
	ld (l9d13h),a		;9d02
	jp l9d08h		;9d05
l9d08h:
	ld a,(l9cb6h)		;9d08
	cp 00fh			;9d0b
	ret z			;9d0d
	inc a			;9d0e
	ld (l9cb6h),a		;9d0f
	ret			;9d12
l9d13h:
	nop			;9d13
l9d14h:
	ld a,(l9d31h)		;9d14
	dec a			;9d17
	cp 000h			;9d18
	jp z,l9d21h		;9d1a
	ld (l9d31h),a		;9d1d
	ret			;9d20
l9d21h:
	ld a,001h		;9d21
	ld (l9d31h),a		;9d23
	ld a,(l9cb6h)		;9d26
	cp 000h			;9d29
	ret z			;9d2b
	dec a			;9d2c
	ld (l9cb6h),a		;9d2d
	ret			;9d30
l9d31h:
	inc bc			;9d31
sub_9d32h:
	ld a,(l9d83h)		;9d32
	cp 000h			;9d35
	jr z,l9d4ah		;9d37
	ld a,(l9d84h)		;9d39
	call sub_9d87h		;9d3c
	jp nz,l9d66h		;9d3f
	ld a,000h		;9d42
	ld (l9d83h),a		;9d44
	jp l9d5bh		;9d47
l9d4ah:
	ld a,(l9d84h)		;9d4a
	call sub_9d87h		;9d4d
	jp z,l9d66h		;9d50
	ld a,001h		;9d53
	ld (l9d83h),a		;9d55
	jp l9d5bh		;9d58
l9d5bh:
	ld a,(l9cb6h)		;9d5b
	cp 00fh			;9d5e
	ret z			;9d60
	inc a			;9d61
	ld (l9cb6h),a		;9d62
	ret			;9d65
l9d66h:
	ld a,(l9d82h)		;9d66
	dec a			;9d69
	cp 000h			;9d6a
	jr z,l9d72h		;9d6c
	ld (l9d82h),a		;9d6e
	ret			;9d71
l9d72h:
	ld a,002h		;9d72
	ld (l9d82h),a		;9d74
	ld a,(l9cb6h)		;9d77
	cp 000h			;9d7a
	ret z			;9d7c
	dec a			;9d7d
	ld (l9cb6h),a		;9d7e
	ret			;9d81
l9d82h:
	ld (bc),a		;9d82
l9d83h:
	nop			;9d83
l9d84h:
	dec c			;9d84
l9d85h:
	ld c,00fh		;9d85
sub_9d87h:
	ld de,l9d95h		;9d87
	ld l,a			;9d8a
	ld h,000h		;9d8b
	add hl,hl		;9d8d
l9d8eh:
	add hl,de		;9d8e
l9d8fh:
	ld a,(hl)		;9d8f
	inc hl			;9d90
l9d91h:
	in a,(0feh)		;9d91
l9d93h:
	and (hl)		;9d93
	ret			;9d94
l9d95h:
	rst 30h			;9d95
	ld bc,002f7h		;9d96
	rst 30h			;9d99
	inc b			;9d9a
	rst 30h			;9d9b
	ex af,af'		;9d9c
	rst 30h			;9d9d
	djnz l9d8fh		;9d9e
	djnz l9d91h		;9da0
	ex af,af'		;9da2
	rst 28h			;9da3
	inc b			;9da4
	rst 28h			;9da5
	ld (bc),a		;9da6
	rst 28h			;9da7
	ld bc,001fbh		;9da8
	ei			;9dab
	ld (bc),a		;9dac
	ei			;9dad
	inc b			;9dae
	ei			;9daf
	ex af,af'		;9db0
	ei			;9db1
	djnz l9d93h		;9db2
	djnz l9d95h		;9db4
	ex af,af'		;9db6
	rst 18h			;9db7
	inc b			;9db8
	rst 18h			;9db9
	ld (bc),a		;9dba
	rst 18h			;9dbb
	ld bc,001fdh		;9dbc
	defb 0fdh,002h,0fdh ;illegal sequence	;9dbf
	inc b			;9dc2
	defb 0fdh,008h,0fdh ;illegal sequence	;9dc3
	djnz sub_9d87h		;9dc6
	djnz $-63		;9dc8
	ex af,af'		;9dca
	cp a			;9dcb
	inc b			;9dcc
	cp a			;9dcd
	ld (bc),a		;9dce
	cp a			;9dcf
	ld bc,001feh		;9dd0
	cp 002h			;9dd3
	cp 004h			;9dd5
	cp 008h			;9dd7
	cp 010h			;9dd9
	ld a,a			;9ddb
	djnz l9e5dh		;9ddc
	ex af,af'		;9dde
	ld a,a			;9ddf
	inc b			;9de0
	ld a,a			;9de1
	ld (bc),a		;9de2
	ld a,a			;9de3
	ld bc,0b63ah		;9de4
	sbc a,h			;9de7
	cp 000h			;9de8
	ret z			;9dea
	ld hl,lc9fdh		;9deb
	ld de,lcafdh		;9dee
	ld c,040h		;9df1
l9df3h:
	ld a,000h		;9df3
	ld b,004h		;9df5
	ex de,hl		;9df7
l9df8h:
	rld			;9df8
	dec hl			;9dfa
	djnz l9df8h		;9dfb
	ex de,hl		;9dfd
	ld b,020h		;9dfe
l9e00h:
	rld			;9e00
	dec hl			;9e02
	djnz l9e00h		;9e03
	dec c			;9e05
	jr nz,l9df3h		;9e06
	ld a,(l9e13h)		;9e08
	dec a			;9e0b
	ld (l9e13h),a		;9e0c
	call l9e15h+1		;9e0f
	ret			;9e12
l9e13h:
	djnz $+4		;9e13
l9e15h:
	ld bc,lfe21h		;9e15
	pop bc			;9e18
	ld de,05000h		;9e19
	exx			;9e1c
	ld b,040h		;9e1d
	halt			;9e1f
l9e20h:
	exx			;9e20
	ldi			;9e21
	ldi			;9e23
	ldi			;9e25
	ldi			;9e27
	ldi			;9e29
	ldi			;9e2b
	ldi			;9e2d
	ldi			;9e2f
	ldi			;9e31
	ldi			;9e33
	ldi			;9e35
	ldi			;9e37
	ldi			;9e39
	ldi			;9e3b
	ldi			;9e3d
	ldi			;9e3f
	ldi			;9e41
	ldi			;9e43
	ldi			;9e45
	ldi			;9e47
	ldi			;9e49
	ldi			;9e4b
	ldi			;9e4d
	ldi			;9e4f
	ldi			;9e51
	ldi			;9e53
	ldi			;9e55
	ldi			;9e57
	ldi			;9e59
	ldi			;9e5b
l9e5dh:
	ldi			;9e5d
	ldi			;9e5f
	exx			;9e61
	djnz l9e20h		;9e62
	exx			;9e64
	ret			;9e65
l9e66h:
	ld a,(l9e13h+1)		;9e66
	jp l9e7fh		;9e69
sub_9e6ch:
	ld a,(l9e13h)		;9e6c
	cp 008h			;9e6f
	jp z,l9e66h		;9e71
	cp 000h			;9e74
	ret nz			;9e76
	ld a,010h		;9e77
	ld (l9e13h),a		;9e79
	ld a,(l9e15h)		;9e7c
l9e7fh:
	add a,a			;9e7f
	ld ix,09ea3h		;9e80
	ld b,000h		;9e84
	ld c,a			;9e86
	add ix,bc		;9e87
	ld l,(ix+000h)		;9e89
	ld h,(ix+001h)		;9e8c
	ld de,00100h		;9e8f
	add hl,de		;9e92
	ld de,lcafeh		;9e93
	ld b,040h		;9e96
l9e98h:
	push bc			;9e98
	ldd			;9e99
	ldd			;9e9b
	ldd			;9e9d
	ldd			;9e9f
	pop bc			;9ea1
	djnz l9e98h		;9ea2
	ret			;9ea4
	cp 0cah			;9ea5
	cp 0cbh			;9ea7
	cp 0cch			;9ea9
	cp 0cdh			;9eab
	defb 0ddh,0bfh,0e5h ;illegal sequence	;9ead
	ld a,002h		;9eb0
	call 01601h		;9eb2
	pop hl			;9eb5
l9eb6h:
	ld a,(hl)		;9eb6
	cp 0ffh			;9eb7
	ret z			;9eb9
	rst 10h			;9eba
	inc hl			;9ebb
	push hl			;9ebc
	ld hl,0000ah		;9ebd
	ld de,00032h		;9ec0
	call 003b5h		;9ec3
	pop hl			;9ec6
	halt			;9ec7
	jr l9eb6h		;9ec8
sub_9ecah:
	ld hl,05a00h		;9eca
	ld b,0c0h		;9ecd
	ld a,003h		;9ecf
l9ed1h:
	ld (hl),a		;9ed1
	inc hl			;9ed2
	djnz l9ed1h		;9ed3
	ld b,040h		;9ed5
	ld a,005h		;9ed7
l9ed9h:
	ld (hl),a		;9ed9
	inc hl			;9eda
	djnz l9ed9h		;9edb
	ret			;9edd
l9edeh:
	ld d,007h		;9ede
	add hl,bc		;9ee0
	jr nz,l9f03h		;9ee1
	jr nz,l9f05h		;9ee3
	jr nz,l9f07h		;9ee5
	jr nz,l9f09h		;9ee7
	jr nz,l9f0bh		;9ee9
	jr nz,l9f0dh		;9eeb
	jr nz,$+34		;9eed
	rst 38h			;9eef
l9ef0h:
	ld d,007h		;9ef0
	add hl,bc		;9ef2
	djnz l9efah		;9ef3
	inc de			;9ef5
	ld bc,02221h		;9ef6
	inc hl			;9ef9
l9efah:
	inc hl			;9efa
	inc h			;9efb
	jr nz,l9f20h		;9efc
	jr nz,l9f25h		;9efe
	ld h,024h		;9f00
	inc hl			;9f02
l9f03h:
	inc h			;9f03
	daa			;9f04
l9f05h:
	rst 38h			;9f05
l9f06h:
	nop			;9f06
l9f07h:
	nop			;9f07
	nop			;9f08
l9f09h:
	nop			;9f09
	nop			;9f0a
l9f0bh:
	nop			;9f0b
	nop			;9f0c
l9f0dh:
	nop			;9f0d
	ld a,07dh		;9f0e
	ret p			;9f10
	ret nz			;9f11
	ret nz			;9f12
	ret nz			;9f13
	pop hl			;9f14
	ld a,(hl)		;9f15
	nop			;9f16
	nop			;9f17
	inc a			;9f18
	ld (hl),d		;9f19
	ld h,d			;9f1a
	ld h,d			;9f1b
	ld (hl),d		;9f1c
	inc a			;9f1d
	nop			;9f1e
	nop			;9f1f
l9f20h:
	ld e,h			;9f20
	ld (hl),d		;9f21
	ld h,b			;9f22
	ld h,b			;9f23
	ld b,b			;9f24
l9f25h:
	ld b,b			;9f25
	nop			;9f26
	nop			;9f27
	inc a			;9f28
	ld h,d			;9f29
	ld a,h			;9f2a
	ld b,b			;9f2b
	ld h,b			;9f2c
	inc a			;9f2d
	ld b,d			;9f2e
	ld h,d			;9f2f
	halt			;9f30
	ld a,(hl)		;9f31
	ld e,d			;9f32
	ld b,d			;9f33
	ld b,d			;9f34
	ld b,d			;9f35
	nop			;9f36
	nop			;9f37
	ld b,b			;9f38
	ld h,d			;9f39
	ld h,d			;9f3a
	ld h,d			;9f3b
	ld (hl),d		;9f3c
	inc a			;9f3d
	ex af,af'		;9f3e
	inc e			;9f3f
	jr l9f7ah		;9f40
	jr nc,l9f44h		;9f42
l9f44h:
	ld h,b			;9f44
	ld h,b			;9f45
sub_9f46h:
	ld a,(l9e13h)		;9f46
	cp 000h			;9f49
	ret nz			;9f4b
	ld hl,(la036h)		;9f4c
	ld a,(hl)		;9f4f
	inc hl			;9f50
	ld (la036h),hl		;9f51
	cp 000h			;9f54
	jp z,l9f74h		;9f56
	cp 002h			;9f59
	jp z,l9f69h		;9f5b
	ld a,002h		;9f5e
	ld (l9e13h+1),a		;9f60
	ld a,001h		;9f63
	ld (l9e15h),a		;9f65
	ret			;9f68
l9f69h:
	ld a,004h		;9f69
	ld (l9e13h+1),a		;9f6b
	ld a,003h		;9f6e
	ld (l9e15h),a		;9f70
	ret			;9f73
l9f74h:
	ld a,002h		;9f74
	ld (la26eh),a		;9f76
	dec hl			;9f79
l9f7ah:
	ld (la036h),hl		;9f7a
	ret			;9f7d
l9f7eh:
	ld hl,08140h		;9f7e
	ld de,04000h		;9f81
	ld bc,01b00h		;9f84
	ldir			;9f87
l9f89h:
	ld a,01dh		;9f89
	call sub_9d87h		;9f8b
	jr nz,l9f89h		;9f8e
	call 00d6bh		;9f90
	call sub_a52bh		;9f93
	call sub_a24ah		;9f96
	ld a,000h		;9f99
	ld (la2a8h),a		;9f9b
	ld (la26eh),a		;9f9e
	ld (la26fh),a		;9fa1
	ld (la0a8h),a		;9fa4
	ld (la22eh),a		;9fa7
	ld (la035h),a		;9faa
	ld a,005h		;9fad
	ld (l9cb6h),a		;9faf
	ld hl,l9f06h		;9fb2
	dec h			;9fb5
	ld (05c36h),hl		;9fb6
	ld hl,l9ef0h		;9fb9
	call 09eafh		;9fbc
	ld h,03ch		;9fbf
	ld l,000h		;9fc1
	ld (05c36h),hl		;9fc3
	call sub_9ecah		;9fc6
	ld a,002h		;9fc9
	ld (l9e13h+1),a		;9fcb
	ld a,001h		;9fce
	ld (l9e15h),a		;9fd0
	ld a,000h		;9fd3
	ld (l9e13h),a		;9fd5
	call sub_9e6ch		;9fd8
	ld b,040h		;9fdb
l9fddh:
	push bc			;9fdd
	call 09de5h		;9fde
	call sub_9e6ch		;9fe1
	pop bc			;9fe4
	djnz l9fddh		;9fe5
	ld hl,l9edeh		;9fe7
	call 09eafh		;9fea
	ld a,000h		;9fed
	ld (l9cb6h),a		;9fef
	call sub_9e6ch		;9ff2
	ld hl,la038h		;9ff5
	ld (la036h),hl		;9ff8
l9ffbh:
	call 09de5h		;9ffb
	call la4d6h+1		;9ffe
	call sub_a43eh		;a001
	call sub_a50ch		;a004
	call sub_a30bh		;a007
	call sub_a371h		;a00a
	call sub_a397h		;a00d
	call sub_a2bah		;a010
	call sub_9f46h		;a013
	call sub_9e6ch		;a016
	call sub_9c82h		;a019
	call sub_a221h		;a01c
	call sub_a0a9h		;a01f
	call la0f0h+1		;a022
	call sub_a23ah		;a025
	call sub_a270h		;a028
	ld a,(la0a8h)		;a02b
	cp 001h			;a02e
	jp z,l9c43h		;a030
	jr l9ffbh		;a033
la035h:
	nop			;a035
la036h:
	nop			;a036
	nop			;a037
la038h:
	ld bc,00101h		;a038
	ld (bc),a		;a03b
	ld bc,00101h		;a03c
	ld bc,00102h		;a03f
	ld bc,00101h		;a042
	ld bc,00102h		;a045
	ld bc,00201h		;a048
	ld bc,00101h		;a04b
	ld bc,00101h		;a04e
	ld bc,00201h		;a051
	ld bc,00101h		;a054
	ld (bc),a		;a057
	ld bc,00101h		;a058
	ld bc,00102h		;a05b
	ld bc,00201h		;a05e
	ld (bc),a		;a061
	ld bc,00101h		;a062
	ld (bc),a		;a065
	ld bc,00201h		;a066
	ld (bc),a		;a069
	ld bc,00101h		;a06a
	ld bc,00202h		;a06d
	ld bc,00101h		;a070
	ld bc,00201h		;a073
	ld bc,00101h		;a076
	ld (bc),a		;a079
	ld (bc),a		;a07a
	ld bc,00101h		;a07b
	ld (bc),a		;a07e
	ld bc,00201h		;a07f
	ld bc,00201h		;a082
	ld bc,00101h		;a085
	ld (bc),a		;a088
	ld bc,00102h		;a089
	ld (bc),a		;a08c
	ld bc,00201h		;a08d
	ld (bc),a		;a090
	ld (bc),a		;a091
	ld (bc),a		;a092
	ld bc,00101h		;a093
	ld (bc),a		;a096
	ld (bc),a		;a097
	ld (bc),a		;a098
	ld (bc),a		;a099
	ld (bc),a		;a09a
	ld (bc),a		;a09b
	ld (bc),a		;a09c
	ld (bc),a		;a09d
	ld bc,00101h		;a09e
	ld bc,00102h		;a0a1
	nop			;a0a4
	nop			;a0a5
	nop			;a0a6
	nop			;a0a7
la0a8h:
	nop			;a0a8
sub_a0a9h:
	ld hl,lcf3fh		;a0a9
	ld a,(la0f0h)		;a0ac
	and a			;a0af
	rr a			;a0b0
	ld b,000h		;a0b2
	ld c,a			;a0b4
	add hl,bc		;a0b5
	ld de,04000h		;a0b6
	exx			;a0b9
	ld b,080h		;a0ba
la0bch:
	exx			;a0bc
	ldi			;a0bd
	ldi			;a0bf
	ldi			;a0c1
	ldi			;a0c3
	ldi			;a0c5
	ldi			;a0c7
	ldi			;a0c9
	ldi			;a0cb
	ldi			;a0cd
	ldi			;a0cf
	ldi			;a0d1
	ldi			;a0d3
	ldi			;a0d5
	ldi			;a0d7
	ldi			;a0d9
	ldi			;a0db
	ld bc,00050h		;a0dd
	add hl,bc		;a0e0
	ld bc,00010h		;a0e1
	ex de,hl		;a0e4
	add hl,bc		;a0e5
	ex de,hl		;a0e6
	exx			;a0e7
	djnz la0bch		;a0e8
	exx			;a0ea
	call sub_a568h		;a0eb
	ret			;a0ee
la0efh:
	inc c			;a0ef
la0f0h:
	jr nz,la12ch		;a0f0
	dec (hl)		;a0f2
	and b			;a0f3
	cp 000h			;a0f4
	ret z			;a0f6
	ld a,(l9cb6h)		;a0f7
	sbc a,007h		;a0fa
	jp c,la11fh		;a0fc
	ld a,(l9cb6h)		;a0ff
	sbc a,00bh		;a102
	ret c			;a104
	ld a,(la0efh)		;a105
	dec a			;a108
	cp 000h			;a109
	ld (la0efh),a		;a10b
	ret nz			;a10e
	ld a,008h		;a10f
	ld (la0efh),a		;a111
	ld a,(la0f0h)		;a114
	cp 020h			;a117
	ret z			;a119
	inc a			;a11a
	ld (la0f0h),a		;a11b
	ret			;a11e
la11fh:
	ld a,(la0f0h)		;a11f
	dec a			;a122
	cp 0ffh			;a123
	jp z,la12ch		;a125
	ld (la0f0h),a		;a128
	ret			;a12b
la12ch:
	ld a,000h		;a12c
	ld (l9cb6h),a		;a12e
	ld a,001h		;a131
	ld (la3e4h),a		;a133
	call sub_a3e5h		;a136
	call sub_9c88h		;a139
	ld hl,lcf3eh		;a13c
	ld b,040h		;a13f
	ld a,000h		;a141
	ld (la21fh),a		;a143
la146h:
	push bc			;a146
	push hl			;a147
	ld de,04000h		;a148
	exx			;a14b
	ld b,080h		;a14c
	push hl			;a14e
	ld hl,00352h		;a14f
	halt			;a152
la153h:
	dec hl			;a153
	ld a,h			;a154
	or l			;a155
	jr nz,la153h		;a156
	pop hl			;a158
la159h:
	exx			;a159
	ldi			;a15a
	ldi			;a15c
	ldi			;a15e
	ldi			;a160
	ldi			;a162
	ldi			;a164
	ldi			;a166
	ldi			;a168
	ldi			;a16a
	ldi			;a16c
	ldi			;a16e
	ldi			;a170
	ldi			;a172
	ldi			;a174
	ldi			;a176
	ldi			;a178
	ldi			;a17a
	ldi			;a17c
	ldi			;a17e
	ldi			;a180
	ldi			;a182
	ldi			;a184
	ldi			;a186
	ldi			;a188
	ldi			;a18a
	ldi			;a18c
	ldi			;a18e
	ldi			;a190
	ldi			;a192
	ldi			;a194
	ldi			;a196
	ldi			;a198
	ld bc,00040h		;a19a
	add hl,bc		;a19d
	exx			;a19e
	djnz la159h		;a19f
	exx			;a1a1
	call sub_a48eh		;a1a2
	push de			;a1a5
	call sub_a549h		;a1a6
	ld a,(la21fh)		;a1a9
	inc a			;a1ac
	ld (la21fh),a		;a1ad
	pop de			;a1b0
	pop hl			;a1b1
	dec hl			;a1b2
	pop bc			;a1b3
	djnz la146h		;a1b4
	ld a,020h		;a1b6
	ld (la0f0h),a		;a1b8
	ld b,010h		;a1bb
	ld hl,lcf0eh		;a1bd
	ld a,000h		;a1c0
	ld (la220h),a		;a1c2
la1c5h:
	push bc			;a1c5
	push hl			;a1c6
	ld b,080h		;a1c7
	ld de,04010h		;a1c9
	push de			;a1cc
	halt			;a1cd
	ld de,00352h		;a1ce
la1d1h:
	dec de			;a1d1
	ld a,d			;a1d2
	or e			;a1d3
	jr nz,la1d1h		;a1d4
	pop de			;a1d6
la1d7h:
	push bc			;a1d7
	ldi			;a1d8
	ldi			;a1da
	ldi			;a1dc
	ldi			;a1de
	ldi			;a1e0
	ldi			;a1e2
	ldi			;a1e4
	ldi			;a1e6
	ldi			;a1e8
	ldi			;a1ea
	ldi			;a1ec
	ldi			;a1ee
	ldi			;a1f0
	ldi			;a1f2
	ldi			;a1f4
	ldi			;a1f6
	ld bc,00050h		;a1f8
	add hl,bc		;a1fb
	ld bc,00010h		;a1fc
	ex de,hl		;a1ff
	add hl,bc		;a200
	ex de,hl		;a201
	pop bc			;a202
	djnz la1d7h		;a203
	push de			;a205
	call sub_a58eh		;a206
	ld a,(la220h)		;a209
	inc a			;a20c
	ld (la220h),a		;a20d
	pop de			;a210
	pop hl			;a211
	pop bc			;a212
	dec hl			;a213
	djnz la1c5h		;a214
	ld a,001h		;a216
	ld (la0a8h),a		;a218
	call sub_a4b1h		;a21b
	ret			;a21e
la21fh:
	nop			;a21f
la220h:
	nop			;a220
sub_a221h:
	ld a,(la22eh)		;a221
	inc a			;a224
	cp 0ffh			;a225
	jp z,la22fh		;a227
	ld (la22eh),a		;a22a
	ret			;a22d
la22eh:
	nop			;a22e
la22fh:
	ld a,001h		;a22f
	ld (la035h),a		;a231
	ld a,000h		;a234
	ld (la22eh),a		;a236
	ret			;a239
sub_a23ah:
	ld a,(l9cb6h)		;a23a
	cp 000h			;a23d
	ret nz			;a23f
	ld hl,00384h		;a240
	halt			;a243
la244h:
	dec hl			;a244
	ld a,h			;a245
	or l			;a246
	jr nz,la244h		;a247
	ret			;a249
sub_a24ah:
	ld de,lc0ddh		;a24a
	ld b,004h		;a24d
	ld hl,04037h		;a24f
la252h:
	push bc			;a252
	push hl			;a253
	ld b,008h		;a254
la256h:
	push bc			;a256
	push hl			;a257
	ld b,000h		;a258
	ld c,009h		;a25a
	ex de,hl		;a25c
	ldir			;a25d
	ex de,hl		;a25f
	pop hl			;a260
	pop bc			;a261
	inc h			;a262
	djnz la256h		;a263
	pop hl			;a265
	ld bc,00020h		;a266
	add hl,bc		;a269
	pop bc			;a26a
	djnz la252h		;a26b
	ret			;a26d
la26eh:
	nop			;a26e
la26fh:
	nop			;a26f
sub_a270h:
	ld a,(la26eh)		;a270
	cp 000h			;a273
	ret z			;a275
	ld a,001h		;a276
	ld (la26fh),a		;a278
	ld a,00fh		;a27b
	ld (l9cb6h),a		;a27d
	ld a,(la0f0h)		;a280
	cp 020h			;a283
	ret nz			;a285
	ld a,005h		;a286
	ld (l9e13h+1),a		;a288
	ld a,005h		;a28b
	ld (l9e15h),a		;a28d
	ld a,(la2a8h)		;a290
	inc a			;a293
	cp 064h			;a294
	jp z,la29dh		;a296
	ld (la2a8h),a		;a299
	ret			;a29c
la29dh:
	ld a,001h		;a29d
	ld (la0a8h),a		;a29f
	ld a,000h		;a2a2
	ld (la2a8h),a		;a2a4
	ret			;a2a7
la2a8h:
	nop			;a2a8
	rlca			;a2a9
la2aah:
	inc b			;a2aa
la2abh:
	ld bc,lba9ch		;a2ab
	ld a,h			;a2ae
	cp e			;a2af
	ld e,h			;a2b0
	cp h			;a2b1
	inc a			;a2b2
	cp l			;a2b3
	inc e			;a2b4
	cp (hl)			;a2b5
la2b6h:
	call m,011beh		;a2b6
la2b9h:
	ld a,(bc)		;a2b9
sub_a2bah:
	ld a,(la2abh)		;a2ba
	ld b,a			;a2bd
	ld de,la2aah		;a2be
la2c1h:
	inc de			;a2c1
	inc de			;a2c2
	djnz la2c1h		;a2c3
	ld a,(de)		;a2c5
	ld l,a			;a2c6
	inc de			;a2c7
	ld a,(de)		;a2c8
	ld h,a			;a2c9
	ex de,hl		;a2ca
	ld hl,(la2b6h+2)	;a2cb
	ex de,hl		;a2ce
	ld b,007h		;a2cf
la2d1h:
	push bc			;a2d1
	push de			;a2d2
	push hl			;a2d3
	call sub_a2efh		;a2d4
	ex de,hl		;a2d7
	pop hl			;a2d8
	ld b,008h		;a2d9
la2dbh:
	push de			;a2db
	ld c,004h		;a2dc
la2deh:
	ld a,(hl)		;a2de
	ld (de),a		;a2df
	inc hl			;a2e0
	inc de			;a2e1
	dec c			;a2e2
	jr nz,la2deh		;a2e3
	pop de			;a2e5
	inc d			;a2e6
	djnz la2dbh		;a2e7
	pop de			;a2e9
	inc d			;a2ea
	pop bc			;a2eb
	djnz la2d1h		;a2ec
	ret			;a2ee
sub_a2efh:
	ld a,d			;a2ef
	sbc a,010h		;a2f0
	jp nc,la304h		;a2f2
	ld a,d			;a2f5
	and 018h		;a2f6
	add a,040h		;a2f8
	ld h,a			;a2fa
	ld a,d			;a2fb
	rrca			;a2fc
	rrca			;a2fd
	rrca			;a2fe
	and 0e0h		;a2ff
	add a,e			;a301
	ld l,a			;a302
	ret			;a303
la304h:
	ld hl,00000h		;a304
	ret			;a307
la308h:
	nop			;a308
la309h:
	rlca			;a309
la30ah:
	rlca			;a30a
sub_a30bh:
	ld a,(l9cb6h)		;a30b
	cp 000h			;a30e
	ret z			;a310
	ld a,(la308h)		;a311
	cp 000h			;a314
	ret nz			;a316
	ld a,(la50bh)		;a317
	cp 000h			;a31a
	ret nz			;a31c
	ld a,(la2abh)		;a31d
	cp 004h			;a320
	call z,sub_a33ch	;a322
la325h:
	ld a,(la35ah)		;a325
	cp 001h			;a328
	jr z,la34ch		;a32a
	ld a,(la2abh)		;a32c
	inc a			;a32f
	cp 004h			;a330
	call z,sub_a33ch	;a332
	ld (la2abh),a		;a335
la338h:
	cp 002h			;a338
	ret nz			;a33a
	ret			;a33b
sub_a33ch:
	ld a,001h		;a33c
	ld (la35ah),a		;a33e
	ld a,002h		;a341
	ret			;a343
sub_a344h:
	ld a,000h		;a344
	ld (la35ah),a		;a346
	ld a,002h		;a349
	ret			;a34b
la34ch:
	ld a,(la2abh)		;a34c
	dec a			;a34f
	cp 000h			;a350
	call z,sub_a344h	;a352
	ld (la2abh),a		;a355
	jr la338h		;a358
la35ah:
	nop			;a35a
la35bh:
	ld a,(la308h)		;a35b
	cp 001h			;a35e
	ret z			;a360
	ld a,001h		;a361
	ld (l9cb6h),a		;a363
	ld a,004h		;a366
	ld (la2abh),a		;a368
	ld a,006h		;a36b
	ld (la50bh),a		;a36d
	ret			;a370
sub_a371h:
	ld a,(05311h)		;a371
	cp 000h			;a374
	jp z,la35bh		;a376
	ld a,(l9d85h+1)		;a379
	call sub_9d87h		;a37c
	ret nz			;a37f
	ld a,001h		;a380
	ld (la308h),a		;a382
	ld a,(la2abh)		;a385
	cp 001h			;a388
	ret z			;a38a
	cp 002h			;a38b
	ret z			;a38d
	cp 005h			;a38e
	ret z			;a390
	ld a,002h		;a391
	ld (la2abh),a		;a393
	ret			;a396
sub_a397h:
	ld a,(la308h)		;a397
	cp 000h			;a39a
	ret z			;a39c
	ld a,(la309h)		;a39d
	cp 000h			;a3a0
	jp z,la3b1h		;a3a2
	dec a			;a3a5
	ld (la309h),a		;a3a6
	ld a,(la2b9h)		;a3a9
	dec a			;a3ac
	ld (la2b9h),a		;a3ad
	ret			;a3b0
la3b1h:
	ld a,(la30ah)		;a3b1
	dec a			;a3b4
	cp 000h			;a3b5
	call z,sub_a3c5h	;a3b7
	ld (la30ah),a		;a3ba
	ld a,(la2b9h)		;a3bd
	inc a			;a3c0
	ld (la2b9h),a		;a3c1
	ret			;a3c4
sub_a3c5h:
	ld a,000h		;a3c5
	ld (la308h),a		;a3c7
	ld a,007h		;a3ca
	ld (la309h),a		;a3cc
	ld (la30ah),a		;a3cf
	ld a,002h		;a3d2
	ld (la2abh),a		;a3d4
	ld a,007h		;a3d7
	ret			;a3d9
	sbc a,h			;a3da
	or c			;a3db
	call c,01cb3h		;a3dc
	or (hl)			;a3df
	ld e,h			;a3e0
	cp b			;a3e1
	ld e,h			;a3e2
	xor a			;a3e3
la3e4h:
	dec b			;a3e4
sub_a3e5h:
	ld a,(la3e4h)		;a3e5
	ld b,a			;a3e8
	ld de,0a3d8h		;a3e9
la3ech:
	inc de			;a3ec
	inc de			;a3ed
	djnz la3ech		;a3ee
	ld a,(de)		;a3f0
	ld l,a			;a3f1
	inc de			;a3f2
	ld a,(de)		;a3f3
	ld h,a			;a3f4
	ld de,0e746h		;a3f5
	ld b,040h		;a3f8
la3fah:
	push bc			;a3fa
	ldi			;a3fb
	ldi			;a3fd
	ldi			;a3ff
	ldi			;a401
	ldi			;a403
	ldi			;a405
	ldi			;a407
	ldi			;a409
	ldi			;a40b
	ex de,hl		;a40d
	ld bc,00057h		;a40e
	add hl,bc		;a411
	ex de,hl		;a412
	pop bc			;a413
	djnz la3fah		;a414
	call sub_a548h		;a416
	ret			;a419
sub_a41ah:
	ld a,(la42fh)		;a41a
	inc a			;a41d
	ld (la42fh),a		;a41e
	cp 002h			;a421
	jp z,la430h		;a423
	ld a,002h		;a426
	ld (la3e4h),a		;a428
	call sub_a3e5h		;a42b
	ret			;a42e
la42fh:
	nop			;a42f
la430h:
	ld a,000h		;a430
	ld (la42fh),a		;a432
	ld a,003h		;a435
	ld (la3e4h),a		;a437
	call sub_a3e5h		;a43a
	ret			;a43d
sub_a43eh:
	call sub_a468h		;a43e
	ld a,(la0f0h)		;a441
	sbc a,006h		;a444
	jp nc,la453h		;a446
	ld a,(la3e4h)		;a449
	cp 001h			;a44c
	ret z			;a44e
	call sub_a41ah		;a44f
	ret			;a452
la453h:
	ld a,(la3e4h)		;a453
	cp 001h			;a456
	ret z			;a458
	cp 004h			;a459
	ret z			;a45b
	cp 005h			;a45c
	ret z			;a45e
la45fh:
	ld a,004h		;a45f
	ld (la3e4h),a		;a461
	call sub_a3e5h		;a464
	ret			;a467
sub_a468h:
	ld a,(la3e4h)		;a468
	cp 001h			;a46b
	ret z			;a46d
	cp 004h			;a46e
	ret z			;a470
	cp 005h			;a471
	ret z			;a473
	ld a,(la308h)		;a474
	cp 001h			;a477
	ret z			;a479
	ld a,(la2abh)		;a47a
	cp 004h			;a47d
	ret z			;a47f
	cp 005h			;a480
	ret z			;a482
	ld a,001h		;a483
	ld (la308h),a		;a485
	ld a,006h		;a488
	ld (la2abh),a		;a48a
	ret			;a48d
sub_a48eh:
	ld a,(la4d6h)		;a48e
	cp 000h			;a491
	ret z			;a493
	call sub_a24ah		;a494
	ld a,000h		;a497
	ld (la4d6h),a		;a499
	ld a,00ah		;a49c
	ld (l9cb6h),a		;a49e
	ld b,01eh		;a4a1
la4a3h:
	push bc			;a4a3
	call 09de5h		;a4a4
	call sub_9e6ch		;a4a7
	call sub_9f46h		;a4aa
	pop bc			;a4ad
	djnz la4a3h		;a4ae
	ret			;a4b0
sub_a4b1h:
	ld a,005h		;a4b1
	ld (la3e4h),a		;a4b3
	call sub_a3e5h		;a4b6
	ld a,00ah		;a4b9
	ld (la2b9h),a		;a4bb
	ld a,001h		;a4be
	ld (la4d6h),a		;a4c0
	ld a,000h		;a4c3
	ld (la308h),a		;a4c5
	ld a,007h		;a4c8
	ld (la30ah),a		;a4ca
	ld (la309h),a		;a4cd
	ld a,002h		;a4d0
	ld (la2abh),a		;a4d2
	ret			;a4d5
la4d6h:
	ld bc,lf03ah		;a4d6
	and b			;a4d9
	sbc a,008h		;a4da
	ret c			;a4dc
	call la4e1h+1		;a4dd
	ret			;a4e0
la4e1h:
	ld (le13ah),a		;a4e1
	and h			;a4e4
	dec a			;a4e5
	ld (la4e1h),a		;a4e6
	cp 000h			;a4e9
	jp z,la4fdh		;a4eb
	ld (la4e1h),a		;a4ee
	cp 019h			;a4f1
	ret nz			;a4f3
	ld a,004h		;a4f4
	ld (la3e4h),a		;a4f6
	call sub_a3e5h		;a4f9
	ret			;a4fc
la4fdh:
	ld a,032h		;a4fd
	ld (la4e1h),a		;a4ff
	ld a,005h		;a502
	ld (la3e4h),a		;a504
	call sub_a3e5h		;a507
	ret			;a50a
la50bh:
	nop			;a50b
sub_a50ch:
	ld a,(la50bh)		;a50c
	cp 000h			;a50f
	ret z			;a511
	dec a			;a512
	ld (la50bh),a		;a513
	ld a,002h		;a516
	ld (l9cb6h),a		;a518
	ld a,(la2abh)		;a51b
	inc a			;a51e
	ld (la2abh),a		;a51f
	cp 006h			;a522
	ret nz			;a524
	ld a,004h		;a525
	ld (la2abh),a		;a527
	ret			;a52a
sub_a52bh:
	ld hl,lbfddh		;a52b
	ld de,lc1feh		;a52e
	ld b,040h		;a531
la533h:
	ld c,008h		;a533
la535h:
	push hl			;a535
	push bc			;a536
	ld bc,00004h		;a537
	ldir			;a53a
	pop bc			;a53c
	pop hl			;a53d
	dec c			;a53e
	jr nz,la535h		;a53f
	inc hl			;a541
	inc hl			;a542
	inc hl			;a543
	inc hl			;a544
	djnz la533h		;a545
	ret			;a547
sub_a548h:
	ret			;a548
sub_a549h:
	ld de,05800h		;a549
	ld hl,la99ah		;a54c
sub_a54fh:
	ld a,(la21fh)		;a54f
	ld c,a			;a552
	ld b,000h		;a553
	and a			;a555
	sbc hl,bc		;a556
	ld b,010h		;a558
la55ah:
	push bc			;a55a
	ld bc,00020h		;a55b
	ldir			;a55e
	ld bc,00040h		;a560
	add hl,bc		;a563
	pop bc			;a564
	djnz la55ah		;a565
	ret			;a567
sub_a568h:
	ld de,05800h		;a568
	ld hl,la99ah		;a56b
	ld a,(la0f0h)		;a56e
	and a			;a571
	rr a			;a572
	ld c,a			;a574
	ld b,000h		;a575
	add hl,bc		;a577
	ld b,010h		;a578
la57ah:
	push bc			;a57a
	ld bc,00011h		;a57b
	ldir			;a57e
	ex de,hl		;a580
	ld bc,0000fh		;a581
	add hl,bc		;a584
	ex de,hl		;a585
	ld bc,0004fh		;a586
	add hl,bc		;a589
	pop bc			;a58a
	djnz la57ah		;a58b
	ret			;a58d
sub_a58eh:
	ld de,05810h		;a58e
	ld hl,la96bh		;a591
	ld a,(la220h)		;a594
	ld c,a			;a597
	ld b,000h		;a598
	and a			;a59a
	sbc hl,bc		;a59b
	ld b,010h		;a59d
la59fh:
	push bc			;a59f
	ld bc,00010h		;a5a0
	ldir			;a5a3
	ld bc,00010h		;a5a5
	ex de,hl		;a5a8
	add hl,bc		;a5a9
la5aah:
	ex de,hl		;a5aa
	ld bc,00050h		;a5ab
	add hl,bc		;a5ae
	pop bc			;a5af
	djnz la59fh		;a5b0
	ret			;a5b2
	ex de,hl		;a5b3
	add hl,bc		;a5b4
	ex de,hl		;a5b5
	ld bc,00050h		;a5b6
	add hl,bc		;a5b9
	pop bc			;a5ba
	djnz la5aah		;a5bb
	ret			;a5bd
	add hl,hl		;a5be
	dec c			;a5bf
	cp d			;a5c0
	dec e			;a5c1
	add hl,bc		;a5c2
	ld b,e			;a5c3
	ld d,b			;a5c4
	add hl,bc		;a5c5
	inc (hl)		;a5c6
	dec c			;a5c7
	call nz,0091dh		;a5c8
	ld b,e			;a5cb
	ld b,c			;a5cc
	ld c,h			;a5cd
	ld c,h			;a5ce
	add hl,bc		;a5cf
	ld e,d			;a5d0
	inc l			;a5d1
	ld d,b			;a5d2
	ld c,a			;a5d3
	ld c,(hl)		;a5d4
	ld c,a			;a5d5
	dec c			;a5d6
	adc a,01dh		;a5d7
	add hl,bc		;a5d9
	ld c,h			;a5da
	ld b,h			;a5db
	add hl,bc		;a5dc
	ld b,c			;a5dd
	inc l			;a5de
	jr z,la627h		;a5df
	ld b,c			;a5e1
	ld d,e			;a5e2
	add hl,hl		;a5e3
	dec c			;a5e4
	ret c			;a5e5
	dec e			;a5e6
	add hl,bc		;a5e7
	ld b,e			;a5e8
	ld d,b			;a5e9
	add hl,bc		;a5ea
	ld sp,le20dh		;a5eb
	dec e			;a5ee
	add hl,bc		;a5ef
	ld c,d			;a5f0
	ld d,d			;a5f1
	add hl,bc		;a5f2
	ld e,d			;a5f3
	inc l			;a5f4
	ld b,d			;a5f5
	ld b,c			;a5f6
	ld c,d			;a5f7
	dec c			;a5f8
	call pe,0091dh		;a5f9
	ld c,h			;a5fc
	ld b,h			;a5fd
	add hl,bc		;a5fe
la5ffh:
	ld b,c			;a5ff
	inc l			;a600
	jr z,la649h		;a601
	ld b,c			;a603
	ld d,e			;a604
	ld b,l			;a605
	add hl,hl		;a606
	dec c			;a607
	or 01dh			;a608
	add hl,bc		;a60a
	ld c,c			;a60b
	ld c,(hl)		;a60c
	ld b,e			;a60d
	add hl,bc		;a60e
	ld b,c			;a60f
	dec c			;a610
	nop			;a611
	ld e,009h		;a612
	ld b,e			;a614
	ld d,b			;a615
	add hl,bc		;a616
	inc (hl)		;a617
	dec c			;a618
	ld a,(bc)		;a619
	ld e,009h		;a61a
	ld b,e			;a61c
	ld b,c			;a61d
	ld c,h			;a61e
	ld c,h			;a61f
	add hl,bc		;a620
	ld e,d			;a621
	inc l			;a622
	ld d,b			;a623
	ld c,a			;a624
	ld c,(hl)		;a625
	ld c,a			;a626
la627h:
	dec c			;a627
	inc d			;a628
	ld e,009h		;a629
	ld c,h			;a62b
	ld b,h			;a62c
	add hl,bc		;a62d
	jr z,la676h		;a62e
	ld b,c			;a630
	ld d,e			;a631
	ld b,l			;a632
	add hl,hl		;a633
	inc l			;a634
	ld b,c			;a635
	dec c			;a636
	ld e,01eh		;a637
	ld b,e			;a639
	ld c,a			;a63a
	ld c,(hl)		;a63b
	ld d,h			;a63c
	ld sp,04309h		;a63d
	ld d,b			;a640
	add hl,bc		;a641
	ld (0280dh),a		;a642
	ld e,009h		;a645
	ld d,d			;a647
	ld b,l			;a648
la649h:
	ld d,h			;a649
	add hl,bc		;a64a
	ld c,(hl)		;a64b
	ld e,d			;a64c
	dec c			;a64d
	ld (0091eh),a		;a64e
	ld d,d			;a651
	ld b,l			;a652
	ld d,h			;a653
	dec c			;a654
	inc a			;a655
	ld e,050h		;a656
	ld c,a			;a658
	ld c,(hl)		;a659
	ld c,a			;a65a
	add hl,bc		;a65b
	ld c,h			;a65c
	ld b,h			;a65d
	add hl,bc		;a65e
	ld b,c			;a65f
	inc l			;a660
	ld sp,0460dh		;a661
	ld e,009h		;a664
	ld c,h			;a666
	ld b,h			;a667
	add hl,bc		;a668
	jr z,$+72		;a669
	ld b,c			;a66b
	ld d,e			;a66c
	add hl,hl		;a66d
	inc l			;a66e
	ld b,c			;a66f
	dec c			;a670
	ld d,b			;a671
	ld e,009h		;a672
	ld c,h			;a674
	ld b,h			;a675
la676h:
	add hl,bc		;a676
	ld b,c			;a677
	inc l			;a678
	ld (05a0dh),a		;a679
	ld e,009h		;a67c
	ld d,d			;a67e
	ld b,l			;a67f
	ld d,h			;a680
	dec c			;a681
	ld h,h			;a682
	ld e,050h		;a683
	ld c,a			;a685
	ld c,(hl)		;a686
	ld b,c			;a687
	add hl,bc		;a688
	ld c,h			;a689
	ld b,h			;a68a
	add hl,bc		;a68b
	ld b,c			;a68c
	inc l			;a68d
	jr nc,la69dh		;a68e
	ld l,(hl)		;a690
	ld e,009h		;a691
	ld c,h			;a693
	ld b,h			;a694
	add hl,bc		;a695
	jr z,la6deh		;a696
	ld b,c			;a698
	ld d,e			;a699
	add hl,hl		;a69a
	inc l			;a69b
	ld b,c			;a69c
la69dh:
	dec c			;a69d
	ld a,b			;a69e
	ld e,009h		;a69f
	ld c,h			;a6a1
	ld b,h			;a6a2
	add hl,bc		;a6a3
	ld b,c			;a6a4
	inc l			;a6a5
	ld (0820dh),a		;a6a6
	ld e,009h		;a6a9
	ld d,d			;a6ab
	ld b,l			;a6ac
	ld d,h			;a6ad
	dec c			;a6ae
	adc a,h			;a6af
	ld e,042h		;a6b0
	ld b,c			;a6b2
	ld c,d			;a6b3
	add hl,bc		;a6b4
	ld c,h			;a6b5
	ld b,h			;a6b6
	add hl,bc		;a6b7
	ld b,c			;a6b8
	inc l			;a6b9
	jr z,la702h		;a6ba
	ld b,c			;a6bc
	ld d,e			;a6bd
	ld b,l			;a6be
	add hl,hl		;a6bf
	dec c			;a6c0
	sub (hl)		;a6c1
	ld e,009h		;a6c2
	ld b,h			;a6c4
	ld b,l			;a6c5
	ld b,e			;a6c6
	add hl,bc		;a6c7
	ld b,c			;a6c8
	dec c			;a6c9
	and b			;a6ca
	ld e,009h		;a6cb
	ld b,e			;a6cd
	ld d,b			;a6ce
	add hl,bc		;a6cf
	jr nc,la6dfh		;a6d0
	xor d			;a6d2
	ld e,009h		;a6d3
	ld b,e			;a6d5
	ld b,c			;a6d6
	ld c,h			;a6d7
	ld c,h			;a6d8
	add hl,bc		;a6d9
	ld e,d			;a6da
	inc l			;a6db
	ld d,b			;a6dc
sub_a6ddh:
	ld c,a			;a6dd
la6deh:
	ld c,(hl)		;a6de
la6dfh:
	ld b,c			;a6df
	dec c			;a6e0
	or h			;a6e1
	ld e,009h		;a6e2
	ld c,h			;a6e4
	ld b,h			;a6e5
	add hl,bc		;a6e6
	jr z,la72fh		;a6e7
	ld b,c			;a6e9
	ld d,e			;a6ea
	ld b,l			;a6eb
	add hl,hl		;a6ec
	inc l			;a6ed
	ld b,c			;a6ee
	dec c			;a6ef
	cp (hl)			;a6f0
	ld e,009h		;a6f1
	ld c,d			;a6f3
	ld d,d			;a6f4
	add hl,bc		;a6f5
	ld b,e			;a6f6
	ld c,a			;a6f7
	ld c,(hl)		;a6f8
	ld d,h			;a6f9
	ld sp,lc80dh		;a6fa
	ld e,046h		;a6fd
	ld b,c			;a6ff
	ld d,e			;a700
	add hl,bc		;a701
la702h:
	ld b,h			;a702
	ld b,l			;a703
	ld b,(hl)		;a704
	ld b,d			;a705
	add hl,bc		;a706
	jr nc,la716h		;a707
	jp nc,00d1eh		;a709
	call c,0501eh		;a70c
	ld d,l			;a70f
	ld d,b			;a710
	ld b,c			;a711
	add hl,bc		;a712
	ld c,h			;a713
	ld b,h			;a714
	add hl,bc		;a715
la716h:
	ld b,c			;a716
	inc l			;a717
	jr z,la76dh		;a718
	ld b,c			;a71a
	ld c,h			;a71b
	ld d,h			;a71c
	ld c,a			;a71d
	add hl,hl		;a71e
	dec c			;a71f
	and 01eh		;a720
	add hl,bc		;a722
	ld b,e			;a723
	ld d,b			;a724
	add hl,bc		;a725
	ld sp,lf00dh		;a726
	ld e,009h		;a729
	ld d,d			;a72b
	ld b,l			;a72c
	ld d,h			;a72d
	add hl,bc		;a72e
la72fh:
	ld e,d			;a72f
	dec c			;a730
	jp m,0091eh		;a731
	ld c,h			;a734
	ld b,h			;a735
	add hl,bc		;a736
	ld b,c			;a737
	inc l			;a738
	ld sp,0040dh		;a739
	rra			;a73c
	add hl,bc		;a73d
	ld c,h			;a73e
	ld b,h			;a73f
	add hl,bc		;a740
	jr z,la799h		;a741
	ld b,l			;a743
	ld c,h			;a744
	ld c,a			;a745
	add hl,hl		;a746
	inc l			;a747
	ld b,c			;a748
	dec c			;a749
	ld c,01fh		;a74a
	add hl,bc		;a74c
	ld c,h			;a74d
	ld b,h			;a74e
	add hl,bc		;a74f
	ld b,c			;a750
	inc l			;a751
	inc (hl)		;a752
	dec c			;a753
	jr la775h		;a754
	add hl,bc		;a756
	ld c,h			;a757
	ld b,h			;a758
	add hl,bc		;a759
	jr z,$+72		;a75a
	ld b,c			;a75c
	ld d,e			;a75d
	ld b,l			;a75e
	add hl,hl		;a75f
	inc l			;a760
	ld b,c			;a761
	dec c			;a762
	ld (0091fh),hl		;a763
	ld c,h			;a766
	ld b,h			;a767
	add hl,bc		;a768
	ld b,c			;a769
	inc l			;a76a
	ld (hl),00dh		;a76b
la76dh:
	inc l			;a76d
	rra			;a76e
	add hl,bc		;a76f
	ld c,h			;a770
	ld b,h			;a771
	add hl,bc		;a772
	jr z,la7cbh		;a773
la775h:
	ld c,a			;a775
	ld c,h			;a776
	add hl,hl		;a777
	inc l			;a778
	ld b,c			;a779
	dec c			;a77a
	ld (hl),01fh		;a77b
	add hl,bc		;a77d
	ld d,d			;a77e
	ld b,l			;a77f
	ld d,h			;a780
	dec c			;a781
	ld b,b			;a782
	rra			;a783
	dec c			;a784
	ld c,d			;a785
	rra			;a786
	ld d,e			;a787
	ld b,c			;a788
	ld c,h			;a789
	ld d,h			;a78a
	ld c,a			;a78b
	ld d,e			;a78c
	add hl,bc		;a78d
	ld c,h			;a78e
	ld b,h			;a78f
	add hl,bc		;a790
	ld b,c			;a791
	inc l			;a792
	jr z,la7c7h		;a793
	ld sp,03632h		;a795
	inc (hl)		;a798
la799h:
	add hl,hl		;a799
	dec c			;a79a
	ld d,h			;a79b
	rra			;a79c
	add hl,bc		;a79d
	ld b,e			;a79e
	ld d,b			;a79f
	add hl,bc		;a7a0
	jr nc,la7b0h		;a7a1
	ld e,(hl)		;a7a3
	rra			;a7a4
	add hl,bc		;a7a5
	ld c,d			;a7a6
	ld d,b			;a7a7
	add hl,bc		;a7a8
	ld e,d			;a7a9
	inc l			;a7aa
	ld d,b			;a7ab
	ld d,l			;a7ac
	ld d,b			;a7ad
	ld b,c			;a7ae
	dec c			;a7af
la7b0h:
	ld l,b			;a7b0
	rra			;a7b1
	add hl,bc		;a7b2
	ld c,h			;a7b3
	ld b,h			;a7b4
	add hl,bc		;a7b5
	ld b,c			;a7b6
	inc l			;a7b7
	jr z,la80eh		;a7b8
	ld e,a			;a7ba
	ld d,e			;a7bb
	ld b,c			;a7bc
	ld c,h			;a7bd
	add hl,hl		;a7be
la7bfh:
	dec c			;a7bf
	ld (hl),d		;a7c0
	rra			;a7c1
	add hl,bc		;a7c2
	ld b,e			;a7c3
	ld b,c			;a7c4
	ld c,h			;a7c5
	ld c,h			;a7c6
la7c7h:
	add hl,bc		;a7c7
	ld b,e			;a7c8
	ld c,a			;a7c9
	ld c,l			;a7ca
la7cbh:
	ld d,b			;a7cb
	ld d,d			;a7cc
	dec c			;a7cd
	ld a,h			;a7ce
	rra			;a7cf
	add hl,bc		;a7d0
	ld d,d			;a7d1
	ld b,l			;a7d2
	ld d,h			;a7d3
	add hl,bc		;a7d4
	ld c,(hl)		;a7d5
	ld e,d			;a7d6
	dec c			;a7d7
	add a,(hl)		;a7d8
	rra			;a7d9
	add hl,bc		;a7da
	ld c,h			;a7db
	ld b,h			;a7dc
	add hl,bc		;a7dd
	ld b,c			;a7de
	inc l			;a7df
	ld sp,0900dh		;a7e0
	rra			;a7e3
	add hl,bc		;a7e4
	ld c,h			;a7e5
	ld b,h			;a7e6
	add hl,bc		;a7e7
	jr z,la83dh		;a7e8
	ld b,c			;a7ea
	ld c,h			;a7eb
	ld d,h			;a7ec
	ld c,a			;a7ed
	add hl,hl		;a7ee
	inc l			;a7ef
	ld b,c			;a7f0
	dec c			;a7f1
	sbc a,d			;a7f2
	inc b			;a7f3
	inc b			;a7f4
	inc b			;a7f5
	inc b			;a7f6
	inc b			;a7f7
	inc b			;a7f8
	inc b			;a7f9
	ld b,006h		;a7fa
	inc b			;a7fc
	inc b			;a7fd
	ld (bc),a		;a7fe
	ld (bc),a		;a7ff
	inc b			;a800
	inc b			;a801
	inc b			;a802
	inc b			;a803
	inc b			;a804
	inc b			;a805
	inc b			;a806
	inc b			;a807
	ld (bc),a		;a808
	ld (bc),a		;a809
	rlca			;a80a
	rlca			;a80b
	inc b			;a80c
	inc b			;a80d
la80eh:
	inc b			;a80e
	inc b			;a80f
	inc b			;a810
	inc b			;a811
	ld (bc),a		;a812
	ld (bc),a		;a813
	rlca			;a814
	rlca			;a815
	rlca			;a816
	inc b			;a817
	inc b			;a818
	inc b			;a819
	inc b			;a81a
	inc b			;a81b
	inc b			;a81c
	rlca			;a81d
	rlca			;a81e
	rlca			;a81f
	inc b			;a820
	inc b			;a821
	inc b			;a822
	inc b			;a823
	inc b			;a824
	inc b			;a825
	rlca			;a826
	rlca			;a827
	rlca			;a828
	rlca			;a829
	rlca			;a82a
	rlca			;a82b
	rlca			;a82c
	rlca			;a82d
	rlca			;a82e
	rlca			;a82f
	rlca			;a830
	rlca			;a831
	rlca			;a832
	rlca			;a833
	rlca			;a834
	rlca			;a835
	rlca			;a836
	rlca			;a837
	rlca			;a838
	rlca			;a839
	rlca			;a83a
	inc b			;a83b
	inc b			;a83c
la83dh:
	inc b			;a83d
	inc b			;a83e
	inc b			;a83f
	inc b			;a840
	inc b			;a841
	ld b,006h		;a842
	inc b			;a844
	inc b			;a845
	rlca			;a846
	rlca			;a847
	inc b			;a848
	inc b			;a849
	inc b			;a84a
	inc b			;a84b
	inc b			;a84c
	inc b			;a84d
	inc b			;a84e
	inc b			;a84f
	rlca			;a850
	rlca			;a851
	rlca			;a852
	rlca			;a853
	inc b			;a854
	inc b			;a855
	inc b			;a856
	inc b			;a857
	inc b			;a858
	inc b			;a859
	rlca			;a85a
	rlca			;a85b
	rlca			;a85c
	rlca			;a85d
	rlca			;a85e
	rlca			;a85f
	rlca			;a860
	inc b			;a861
	inc b			;a862
	inc b			;a863
	inc b			;a864
	rlca			;a865
	rlca			;a866
	rlca			;a867
	rlca			;a868
	rlca			;a869
	rlca			;a86a
	rlca			;a86b
	rlca			;a86c
	rlca			;a86d
	rlca			;a86e
	rlca			;a86f
	rlca			;a870
	ld b,c			;a871
	ld b,c			;a872
	rlca			;a873
	rlca			;a874
	rlca			;a875
	rlca			;a876
	rlca			;a877
	rlca			;a878
	rlca			;a879
	rlca			;a87a
	rlca			;a87b
	rlca			;a87c
	rlca			;a87d
	rlca			;a87e
	rlca			;a87f
	rlca			;a880
	rlca			;a881
	rlca			;a882
	inc b			;a883
	inc b			;a884
	inc b			;a885
	inc b			;a886
	inc b			;a887
	inc b			;a888
	inc b			;a889
	ld b,006h		;a88a
	inc b			;a88c
	inc b			;a88d
	rlca			;a88e
	rlca			;a88f
	rlca			;a890
	inc b			;a891
	inc b			;a892
	inc b			;a893
	inc b			;a894
	inc b			;a895
	inc b			;a896
	inc b			;a897
	rlca			;a898
	rlca			;a899
	rlca			;a89a
	inc b			;a89b
	inc b			;a89c
	inc b			;a89d
	inc b			;a89e
	inc b			;a89f
	inc b			;a8a0
	inc b			;a8a1
	rlca			;a8a2
	rlca			;a8a3
	rlca			;a8a4
	rlca			;a8a5
	rlca			;a8a6
	ld b,c			;a8a7
	ld b,c			;a8a8
	inc b			;a8a9
la8aah:
	inc b			;a8aa
	inc b			;a8ab
	inc b			;a8ac
	rlca			;a8ad
	rlca			;a8ae
	rlca			;a8af
	ld b,c			;a8b0
	ld b,c			;a8b1
	rlca			;a8b2
	rlca			;a8b3
	rlca			;a8b4
	rlca			;a8b5
	rlca			;a8b6
	rlca			;a8b7
	rlca			;a8b8
	ld b,c			;a8b9
	ld b,c			;a8ba
	ld b,c			;a8bb
	ld b,007h		;a8bc
	rlca			;a8be
	rlca			;a8bf
	rlca			;a8c0
	rlca			;a8c1
	rlca			;a8c2
	rlca			;a8c3
	rlca			;a8c4
	rlca			;a8c5
	rlca			;a8c6
	rlca			;a8c7
	rlca			;a8c8
	rlca			;a8c9
	rlca			;a8ca
	inc b			;a8cb
	inc b			;a8cc
	inc b			;a8cd
	inc b			;a8ce
	inc b			;a8cf
	inc b			;a8d0
	inc b			;a8d1
	ld b,006h		;a8d2
	inc b			;a8d4
	inc b			;a8d5
	ld b,d			;a8d6
	ld b,d			;a8d7
	inc b			;a8d8
	inc b			;a8d9
	inc b			;a8da
	inc b			;a8db
	inc b			;a8dc
	inc b			;a8dd
	inc b			;a8de
	inc b			;a8df
	ld b,d			;a8e0
	ld b,d			;a8e1
	inc b			;a8e2
	inc b			;a8e3
	inc b			;a8e4
	inc b			;a8e5
	inc b			;a8e6
	inc b			;a8e7
	inc b			;a8e8
	inc b			;a8e9
la8eah:
	ld b,d			;a8ea
	ld b,d			;a8eb
	inc b			;a8ec
	inc b			;a8ed
la8eeh:
	inc b			;a8ee
	inc b			;a8ef
	inc b			;a8f0
	inc b			;a8f1
	inc b			;a8f2
	inc b			;a8f3
	inc b			;a8f4
	inc b			;a8f5
	inc b			;a8f6
	inc b			;a8f7
	inc b			;a8f8
	inc b			;a8f9
	inc b			;a8fa
	inc b			;a8fb
	inc b			;a8fc
	inc b			;a8fd
	inc b			;a8fe
sub_a8ffh:
	inc b			;a8ff
	inc b			;a900
	rlca			;a901
	rlca			;a902
	rlca			;a903
	rlca			;a904
	rlca			;a905
	rlca			;a906
	rlca			;a907
	rlca			;a908
	rlca			;a909
	rlca			;a90a
	rlca			;a90b
	rlca			;a90c
	rlca			;a90d
	rlca			;a90e
	rlca			;a90f
	rlca			;a910
	rlca			;a911
	rlca			;a912
	inc b			;a913
	inc b			;a914
	inc b			;a915
	inc b			;a916
	inc b			;a917
	inc b			;a918
	inc b			;a919
	ld b,006h		;a91a
	inc b			;a91c
	inc b			;a91d
	inc b			;a91e
	inc b			;a91f
	inc b			;a920
	inc b			;a921
	inc b			;a922
	ld b,006h		;a923
	inc b			;a925
	inc b			;a926
	inc b			;a927
	inc b			;a928
	inc b			;a929
	inc b			;a92a
	inc b			;a92b
	inc b			;a92c
	inc b			;a92d
	ld b,h			;a92e
	inc b			;a92f
	inc b			;a930
	inc b			;a931
	inc b			;a932
	inc b			;a933
	inc b			;a934
	inc b			;a935
	inc b			;a936
	rlca			;a937
	inc b			;a938
	inc b			;a939
	inc b			;a93a
	inc b			;a93b
	inc b			;a93c
	inc b			;a93d
	inc b			;a93e
	inc b			;a93f
	rlca			;a940
	rlca			;a941
	rlca			;a942
	rlca			;a943
	rlca			;a944
	rlca			;a945
	rlca			;a946
	rlca			;a947
	rlca			;a948
	nop			;a949
	nop			;a94a
	nop			;a94b
	nop			;a94c
	nop			;a94d
	nop			;a94e
	nop			;a94f
	nop			;a950
	nop			;a951
	nop			;a952
	nop			;a953
	nop			;a954
	nop			;a955
	nop			;a956
	nop			;a957
	nop			;a958
	nop			;a959
	nop			;a95a
	nop			;a95b
	nop			;a95c
	nop			;a95d
	nop			;a95e
	nop			;a95f
	nop			;a960
	nop			;a961
	nop			;a962
	nop			;a963
	nop			;a964
	nop			;a965
	nop			;a966
	nop			;a967
	nop			;a968
	nop			;a969
	nop			;a96a
la96bh:
	inc b			;a96b
	inc b			;a96c
	inc b			;a96d
	inc b			;a96e
	inc b			;a96f
	inc b			;a970
	ld b,006h		;a971
	ld b,006h		;a973
	ld b,006h		;a975
	ld b,006h		;a977
	ld b,006h		;a979
	ld b,006h		;a97b
	ld b,006h		;a97d
	ld b,006h		;a97f
	ld b,006h		;a981
	inc b			;a983
	inc b			;a984
	ld b,h			;a985
	ld b,h			;a986
	ld b,h			;a987
	ld b,h			;a988
	ld b,h			;a989
	inc b			;a98a
	ld b,h			;a98b
	ld b,h			;a98c
	ld b,h			;a98d
	ld b,h			;a98e
la98fh:
	ld b,h			;a98f
	ld b,h			;a990
	ld b,h			;a991
	ld b,h			;a992
	ld b,h			;a993
	inc b			;a994
	inc b			;a995
	inc b			;a996
	inc b			;a997
	ld b,004h		;a998
la99ah:
	inc b			;a99a
	ld b,006h		;a99b
	rlca			;a99d
	rlca			;a99e
	rlca			;a99f
	rlca			;a9a0
	rlca			;a9a1
	rlca			;a9a2
	ld b,006h		;a9a3
	rlca			;a9a5
	rlca			;a9a6
	rlca			;a9a7
	rlca			;a9a8
	rlca			;a9a9
	rlca			;a9aa
	nop			;a9ab
	nop			;a9ac
	nop			;a9ad
	nop			;a9ae
	nop			;a9af
	nop			;a9b0
	nop			;a9b1
	nop			;a9b2
	nop			;a9b3
	nop			;a9b4
	nop			;a9b5
	nop			;a9b6
	nop			;a9b7
	nop			;a9b8
	nop			;a9b9
	nop			;a9ba
	nop			;a9bb
	nop			;a9bc
	nop			;a9bd
	nop			;a9be
	nop			;a9bf
	nop			;a9c0
	nop			;a9c1
	nop			;a9c2
	nop			;a9c3
	nop			;a9c4
	nop			;a9c5
la9c6h:
	nop			;a9c6
	nop			;a9c7
	nop			;a9c8
	nop			;a9c9
	nop			;a9ca
	inc b			;a9cb
	inc b			;a9cc
	inc b			;a9cd
	inc b			;a9ce
	inc b			;a9cf
	inc b			;a9d0
	ld b,006h		;a9d1
	ld b,006h		;a9d3
	ld b,006h		;a9d5
	ld b,006h		;a9d7
	ld b,006h		;a9d9
	ld b,006h		;a9db
	ld b,006h		;a9dd
	inc b			;a9df
	inc b			;a9e0
	ld b,006h		;a9e1
	inc b			;a9e3
	ld b,h			;a9e4
	ld b,h			;a9e5
	ld b,h			;a9e6
	ld b,h			;a9e7
	ld b,h			;a9e8
	ld b,h			;a9e9
	ld b,h			;a9ea
	ld b,h			;a9eb
	ld b,h			;a9ec
	ld b,h			;a9ed
	ld b,h			;a9ee
	ld b,h			;a9ef
	ld b,h			;a9f0
	ld b,h			;a9f1
	ld b,h			;a9f2
	ld b,h			;a9f3
	inc b			;a9f4
	inc b			;a9f5
	inc b			;a9f6
	inc b			;a9f7
	inc b			;a9f8
	inc b			;a9f9
	inc b			;a9fa
	ld b,006h		;a9fb
	rlca			;a9fd
	rlca			;a9fe
	rlca			;a9ff
	ld b,h			;aa00
	ld b,h			;aa01
	ld b,h			;aa02
	ld b,h			;aa03
	ld b,007h		;aa04
	rlca			;aa06
	rlca			;aa07
	rlca			;aa08
	rlca			;aa09
	rlca			;aa0a
	nop			;aa0b
	nop			;aa0c
	nop			;aa0d
	nop			;aa0e
	nop			;aa0f
	nop			;aa10
	nop			;aa11
	nop			;aa12
	nop			;aa13
	nop			;aa14
	nop			;aa15
	nop			;aa16
	nop			;aa17
	nop			;aa18
	nop			;aa19
	nop			;aa1a
	nop			;aa1b
	nop			;aa1c
	nop			;aa1d
	nop			;aa1e
	nop			;aa1f
	nop			;aa20
	nop			;aa21
	nop			;aa22
	nop			;aa23
	nop			;aa24
	nop			;aa25
	nop			;aa26
	nop			;aa27
	nop			;aa28
	nop			;aa29
	nop			;aa2a
	inc b			;aa2b
	inc b			;aa2c
	inc b			;aa2d
	inc b			;aa2e
	inc b			;aa2f
	ld b,006h		;aa30
	ld b,006h		;aa32
	ld b,006h		;aa34
	ld b,006h		;aa36
	ld b,006h		;aa38
	ld b,006h		;aa3a
	inc b			;aa3c
	inc b			;aa3d
	inc b			;aa3e
	inc b			;aa3f
	inc b			;aa40
	inc b			;aa41
	inc b			;aa42
	ld b,h			;aa43
	ld b,h			;aa44
	ld b,h			;aa45
	ld b,h			;aa46
	ld b,h			;aa47
	ld b,h			;aa48
	ld b,h			;aa49
	ld b,h			;aa4a
	ld b,h			;aa4b
	ld b,h			;aa4c
	ld b,006h		;aa4d
	ld b,h			;aa4f
	ld b,h			;aa50
	ld b,h			;aa51
	ld b,h			;aa52
	ld b,h			;aa53
	ld b,h			;aa54
	inc b			;aa55
	inc b			;aa56
	inc b			;aa57
	inc b			;aa58
	inc b			;aa59
	inc b			;aa5a
	ld b,006h		;aa5b
	ld b,006h		;aa5d
	ld b,h			;aa5f
	ld b,h			;aa60
	ld b,h			;aa61
	ld b,h			;aa62
	ld b,h			;aa63
	ld b,h			;aa64
	ld b,007h		;aa65
	rlca			;aa67
	rlca			;aa68
	rlca			;aa69
	rlca			;aa6a
	nop			;aa6b
	nop			;aa6c
	nop			;aa6d
	nop			;aa6e
	nop			;aa6f
	nop			;aa70
	nop			;aa71
	nop			;aa72
	nop			;aa73
	nop			;aa74
	nop			;aa75
	nop			;aa76
	nop			;aa77
	nop			;aa78
	nop			;aa79
sub_aa7ah:
	nop			;aa7a
	nop			;aa7b
	nop			;aa7c
	nop			;aa7d
	nop			;aa7e
	nop			;aa7f
	nop			;aa80
	nop			;aa81
	nop			;aa82
	nop			;aa83
	nop			;aa84
	nop			;aa85
	nop			;aa86
	nop			;aa87
	nop			;aa88
	nop			;aa89
	nop			;aa8a
	inc b			;aa8b
	inc b			;aa8c
	inc b			;aa8d
	inc b			;aa8e
	inc b			;aa8f
	ld b,006h		;aa90
	ld b,006h		;aa92
	ld b,006h		;aa94
	ld b,006h		;aa96
	ld b,006h		;aa98
	ld b,004h		;aa9a
	inc b			;aa9c
	inc b			;aa9d
	inc b			;aa9e
	inc b			;aa9f
	inc b			;aaa0
	inc b			;aaa1
laaa2h:
	ld b,h			;aaa2
	ld b,h			;aaa3
	ld b,h			;aaa4
	ld b,h			;aaa5
	ld b,h			;aaa6
	ld b,h			;aaa7
	ld b,h			;aaa8
	ld b,h			;aaa9
laaaah:
	ld b,h			;aaaa
	ld b,h			;aaab
	ld b,h			;aaac
	ld b,h			;aaad
sub_aaaeh:
	ld b,006h		;aaae
	ld b,006h		;aab0
	ld b,h			;aab2
	ld b,h			;aab3
	ld b,h			;aab4
	inc b			;aab5
	inc b			;aab6
	inc b			;aab7
	inc b			;aab8
	inc b			;aab9
	inc b			;aaba
	rlca			;aabb
	ld b,006h		;aabc
	ld b,044h		;aabe
	ld b,h			;aac0
	ld b,h			;aac1
	ld b,h			;aac2
	ld b,h			;aac3
	ld b,h			;aac4
	ld b,h			;aac5
	ld b,h			;aac6
	ld b,h			;aac7
	rlca			;aac8
	rlca			;aac9
	rlca			;aaca
	nop			;aacb
	nop			;aacc
	nop			;aacd
	nop			;aace
	nop			;aacf
	nop			;aad0
	nop			;aad1
	nop			;aad2
	nop			;aad3
	nop			;aad4
	nop			;aad5
	nop			;aad6
	nop			;aad7
	nop			;aad8
	nop			;aad9
	nop			;aada
	nop			;aadb
	nop			;aadc
	nop			;aadd
	nop			;aade
	nop			;aadf
	nop			;aae0
	nop			;aae1
	nop			;aae2
	nop			;aae3
	nop			;aae4
	nop			;aae5
	nop			;aae6
	nop			;aae7
	nop			;aae8
	nop			;aae9
laaeah:
	nop			;aaea
	inc b			;aaeb
	inc b			;aaec
	inc b			;aaed
	inc b			;aaee
	inc b			;aaef
	ld b,006h		;aaf0
	ld b,006h		;aaf2
	ld b,006h		;aaf4
	ld b,006h		;aaf6
	ld b,006h		;aaf8
	inc b			;aafa
	inc b			;aafb
	inc b			;aafc
	inc b			;aafd
	inc b			;aafe
	inc b			;aaff
	ld b,h			;ab00
	ld b,h			;ab01
	ld b,h			;ab02
	ld b,h			;ab03
	ld b,h			;ab04
	ld b,h			;ab05
	ld b,h			;ab06
	ld b,h			;ab07
	ld b,h			;ab08
	ld b,h			;ab09
	ld b,h			;ab0a
	ld b,h			;ab0b
	ld b,h			;ab0c
	ld b,h			;ab0d
	ld b,h			;ab0e
	ld b,h			;ab0f
	ld b,006h		;ab10
	ld b,006h		;ab12
	ld b,h			;ab14
	inc b			;ab15
	inc b			;ab16
	inc b			;ab17
	inc b			;ab18
	inc b			;ab19
	inc b			;ab1a
	ld b,h			;ab1b
	ld b,h			;ab1c
	ld b,006h		;ab1d
	ld b,044h		;ab1f
	ld b,h			;ab21
	ld b,h			;ab22
	ld b,h			;ab23
	ld b,h			;ab24
	ld b,h			;ab25
	ld b,h			;ab26
	ld b,h			;ab27
	rlca			;ab28
	rlca			;ab29
	rlca			;ab2a
	nop			;ab2b
	nop			;ab2c
	nop			;ab2d
	nop			;ab2e
	nop			;ab2f
	nop			;ab30
	nop			;ab31
	nop			;ab32
	nop			;ab33
	nop			;ab34
	nop			;ab35
	nop			;ab36
	nop			;ab37
	nop			;ab38
sub_ab39h:
	nop			;ab39
	nop			;ab3a
	nop			;ab3b
	nop			;ab3c
	nop			;ab3d
lab3eh:
	nop			;ab3e
	nop			;ab3f
	nop			;ab40
	nop			;ab41
	nop			;ab42
	nop			;ab43
	nop			;ab44
	nop			;ab45
lab46h:
	nop			;ab46
	nop			;ab47
	nop			;ab48
	nop			;ab49
	nop			;ab4a
	inc b			;ab4b
	inc b			;ab4c
	inc b			;ab4d
	inc b			;ab4e
	ld b,006h		;ab4f
	ld b,006h		;ab51
	ld b,006h		;ab53
	ld b,006h		;ab55
	ld b,004h		;ab57
	inc b			;ab59
	inc b			;ab5a
	inc b			;ab5b
	inc b			;ab5c
	inc b			;ab5d
	inc b			;ab5e
	ld b,h			;ab5f
	ld b,h			;ab60
	ld b,h			;ab61
	ld b,h			;ab62
	ld b,h			;ab63
	ld b,h			;ab64
	ld b,h			;ab65
	ld b,h			;ab66
	ld b,h			;ab67
	ld b,h			;ab68
	ld b,h			;ab69
	inc b			;ab6a
	inc b			;ab6b
	inc b			;ab6c
	ld b,h			;ab6d
	ld b,h			;ab6e
	ld b,h			;ab6f
	ld b,h			;ab70
	ld b,006h		;ab71
	ld b,006h		;ab73
	inc b			;ab75
	inc b			;ab76
	inc b			;ab77
	inc b			;ab78
	inc b			;ab79
	inc b			;ab7a
	inc b			;ab7b
	inc b			;ab7c
	ld b,h			;ab7d
	ld b,h			;ab7e
	ld b,004h		;ab7f
	ld b,h			;ab81
	ld b,h			;ab82
	ld b,h			;ab83
	ld b,h			;ab84
	ld b,d			;ab85
	ld b,d			;ab86
	ld b,h			;ab87
	rlca			;ab88
	rlca			;ab89
	rlca			;ab8a
	nop			;ab8b
	nop			;ab8c
	nop			;ab8d
	nop			;ab8e
	nop			;ab8f
	nop			;ab90
	nop			;ab91
	nop			;ab92
	nop			;ab93
	nop			;ab94
	nop			;ab95
	nop			;ab96
	nop			;ab97
	nop			;ab98
	nop			;ab99
	nop			;ab9a
	nop			;ab9b
	nop			;ab9c
	nop			;ab9d
	nop			;ab9e
	nop			;ab9f
	nop			;aba0
	nop			;aba1
	nop			;aba2
	nop			;aba3
	nop			;aba4
	nop			;aba5
	nop			;aba6
	nop			;aba7
	nop			;aba8
	nop			;aba9
	nop			;abaa
	inc b			;abab
	inc b			;abac
	inc b			;abad
	inc b			;abae
	inc b			;abaf
	ld b,006h		;abb0
	ld b,006h		;abb2
	ld b,006h		;abb4
	inc b			;abb6
	inc b			;abb7
	inc b			;abb8
	inc b			;abb9
	inc b			;abba
	inc b			;abbb
	inc b			;abbc
	inc b			;abbd
	ld b,h			;abbe
	ld b,h			;abbf
	ld b,h			;abc0
	ld b,h			;abc1
	ld b,h			;abc2
	ld b,h			;abc3
	ld b,h			;abc4
	ld b,h			;abc5
	ld b,h			;abc6
	ld b,h			;abc7
	ld b,h			;abc8
	ld b,h			;abc9
	inc b			;abca
	inc b			;abcb
	inc b			;abcc
	inc b			;abcd
	ld b,h			;abce
	ld b,h			;abcf
	ld b,h			;abd0
	ld b,h			;abd1
	ld b,006h		;abd2
	ld b,006h		;abd4
	ld b,006h		;abd6
	ld b,006h		;abd8
	ld b,044h		;abda
	ld b,h			;abdc
	ld b,h			;abdd
	ld b,h			;abde
	ld b,h			;abdf
	inc b			;abe0
	ld b,d			;abe1
	ld b,d			;abe2
	ld b,d			;abe3
	inc b			;abe4
	inc b			;abe5
	inc b			;abe6
	rlca			;abe7
	rlca			;abe8
	ld b,006h		;abe9
	nop			;abeb
	nop			;abec
	nop			;abed
	nop			;abee
	nop			;abef
	nop			;abf0
	nop			;abf1
	nop			;abf2
	nop			;abf3
	nop			;abf4
	nop			;abf5
	nop			;abf6
	nop			;abf7
	nop			;abf8
	nop			;abf9
	nop			;abfa
	nop			;abfb
	nop			;abfc
	nop			;abfd
	nop			;abfe
	nop			;abff
	nop			;ac00
	nop			;ac01
	nop			;ac02
	nop			;ac03
	nop			;ac04
	nop			;ac05
	nop			;ac06
	nop			;ac07
	nop			;ac08
	nop			;ac09
	nop			;ac0a
	inc b			;ac0b
	inc b			;ac0c
	inc b			;ac0d
	inc b			;ac0e
	inc b			;ac0f
	ld b,006h		;ac10
	ld b,006h		;ac12
	ld b,004h		;ac14
	inc b			;ac16
	inc b			;ac17
	inc b			;ac18
	inc b			;ac19
	inc b			;ac1a
	inc b			;ac1b
	inc b			;ac1c
	ld b,h			;ac1d
	ld b,h			;ac1e
	ld b,h			;ac1f
	ld b,h			;ac20
	ld b,h			;ac21
	ld b,h			;ac22
	ld b,h			;ac23
	ld b,h			;ac24
	ld b,h			;ac25
	ld b,h			;ac26
	ld b,h			;ac27
	ld b,h			;ac28
	ld b,h			;ac29
	inc b			;ac2a
	inc b			;ac2b
	inc b			;ac2c
	inc b			;ac2d
	inc b			;ac2e
	ld b,h			;ac2f
	ld b,h			;ac30
	ld b,h			;ac31
	ld b,h			;ac32
	ld b,h			;ac33
	ld b,006h		;ac34
	ld b,006h		;ac36
	ld b,006h		;ac38
	ld b,004h		;ac3a
	inc b			;ac3c
	inc b			;ac3d
sub_ac3eh:
	ld b,h			;ac3e
	ld b,h			;ac3f
	inc b			;ac40
	inc b			;ac41
	inc b			;ac42
	inc b			;ac43
	inc b			;ac44
	inc b			;ac45
	inc b			;ac46
	inc b			;ac47
	rlca			;ac48
	ld b,006h		;ac49
	nop			;ac4b
	nop			;ac4c
	nop			;ac4d
	nop			;ac4e
	nop			;ac4f
	nop			;ac50
	nop			;ac51
	nop			;ac52
	nop			;ac53
	nop			;ac54
	nop			;ac55
	nop			;ac56
	nop			;ac57
	nop			;ac58
	nop			;ac59
	nop			;ac5a
	nop			;ac5b
	nop			;ac5c
	nop			;ac5d
	nop			;ac5e
	nop			;ac5f
	nop			;ac60
	nop			;ac61
	nop			;ac62
	nop			;ac63
	nop			;ac64
	nop			;ac65
	nop			;ac66
	nop			;ac67
	nop			;ac68
	nop			;ac69
	nop			;ac6a
	inc b			;ac6b
	inc b			;ac6c
	inc b			;ac6d
	inc b			;ac6e
	inc b			;ac6f
	inc b			;ac70
	inc b			;ac71
	inc b			;ac72
	inc b			;ac73
	inc b			;ac74
	inc b			;ac75
	inc b			;ac76
	inc b			;ac77
	inc b			;ac78
	inc b			;ac79
	inc b			;ac7a
	ld b,h			;ac7b
	inc b			;ac7c
	ld b,h			;ac7d
	ld b,h			;ac7e
	ld b,h			;ac7f
	ld b,h			;ac80
	ld b,h			;ac81
	ld b,h			;ac82
	ld b,h			;ac83
	ld b,h			;ac84
	ld b,h			;ac85
	ld b,h			;ac86
	ld b,h			;ac87
	ld b,h			;ac88
	ld b,h			;ac89
	inc b			;ac8a
	inc b			;ac8b
	inc b			;ac8c
	inc b			;ac8d
	inc b			;ac8e
	ld b,h			;ac8f
	ld b,h			;ac90
	ld b,h			;ac91
	ld b,h			;ac92
	ld b,h			;ac93
	ld b,h			;ac94
	inc b			;ac95
	inc b			;ac96
	inc b			;ac97
	inc b			;ac98
	inc b			;ac99
	inc b			;ac9a
	inc b			;ac9b
	inc b			;ac9c
	inc b			;ac9d
	inc b			;ac9e
	inc b			;ac9f
	inc b			;aca0
	inc b			;aca1
	inc b			;aca2
	inc b			;aca3
	inc b			;aca4
	inc b			;aca5
	inc b			;aca6
	inc b			;aca7
	inc b			;aca8
	inc b			;aca9
	inc b			;acaa
	nop			;acab
	nop			;acac
	nop			;acad
	nop			;acae
	nop			;acaf
	nop			;acb0
	nop			;acb1
	nop			;acb2
	nop			;acb3
	nop			;acb4
	nop			;acb5
	nop			;acb6
	nop			;acb7
	nop			;acb8
	nop			;acb9
	nop			;acba
	nop			;acbb
	nop			;acbc
	nop			;acbd
	nop			;acbe
	nop			;acbf
	nop			;acc0
	nop			;acc1
	nop			;acc2
	nop			;acc3
	nop			;acc4
	nop			;acc5
	nop			;acc6
	nop			;acc7
	nop			;acc8
	nop			;acc9
	nop			;acca
	inc b			;accb
	inc b			;accc
	inc b			;accd
	inc b			;acce
	inc b			;accf
	inc b			;acd0
	inc b			;acd1
	inc b			;acd2
	inc b			;acd3
	inc b			;acd4
	inc b			;acd5
	inc b			;acd6
	inc b			;acd7
	inc b			;acd8
	inc b			;acd9
	inc b			;acda
	ld b,h			;acdb
	ld b,h			;acdc
	ld b,h			;acdd
	ld b,h			;acde
	ld b,h			;acdf
	ld b,h			;ace0
	ld b,h			;ace1
	ld b,h			;ace2
	ld b,h			;ace3
	ld b,h			;ace4
	ld b,h			;ace5
	ld b,h			;ace6
	ld b,h			;ace7
	ld b,h			;ace8
	inc b			;ace9
	inc b			;acea
	inc b			;aceb
	inc b			;acec
	inc b			;aced
	inc b			;acee
	inc b			;acef
	inc b			;acf0
	inc b			;acf1
	inc b			;acf2
	inc b			;acf3
	inc b			;acf4
	inc b			;acf5
	inc b			;acf6
	inc b			;acf7
	inc b			;acf8
	inc b			;acf9
	inc b			;acfa
	inc b			;acfb
	inc b			;acfc
	inc b			;acfd
	inc b			;acfe
	ld b,h			;acff
	ld b,h			;ad00
	inc b			;ad01
	inc b			;ad02
	inc b			;ad03
	inc b			;ad04
	inc b			;ad05
	inc b			;ad06
	inc b			;ad07
	inc b			;ad08
	inc b			;ad09
	inc b			;ad0a
	nop			;ad0b
	nop			;ad0c
	nop			;ad0d
	nop			;ad0e
	nop			;ad0f
	nop			;ad10
	nop			;ad11
	nop			;ad12
	nop			;ad13
	nop			;ad14
	nop			;ad15
	nop			;ad16
	nop			;ad17
	nop			;ad18
	nop			;ad19
	nop			;ad1a
	nop			;ad1b
	nop			;ad1c
	nop			;ad1d
	nop			;ad1e
	nop			;ad1f
	nop			;ad20
	nop			;ad21
	nop			;ad22
	nop			;ad23
	nop			;ad24
	nop			;ad25
	nop			;ad26
	nop			;ad27
	nop			;ad28
	nop			;ad29
	nop			;ad2a
	inc b			;ad2b
	inc b			;ad2c
	inc b			;ad2d
	inc b			;ad2e
	inc b			;ad2f
	inc b			;ad30
	inc b			;ad31
	inc b			;ad32
	inc b			;ad33
	inc b			;ad34
	inc b			;ad35
	inc b			;ad36
	inc b			;ad37
	inc b			;ad38
	inc b			;ad39
	inc b			;ad3a
	ld b,h			;ad3b
	ld b,h			;ad3c
	ld b,h			;ad3d
	ld b,h			;ad3e
	ld b,h			;ad3f
	ld b,h			;ad40
	ld b,h			;ad41
	ld b,h			;ad42
	ld b,h			;ad43
	ld b,h			;ad44
	ld b,h			;ad45
	ld b,h			;ad46
	ld b,h			;ad47
	ld b,h			;ad48
	inc b			;ad49
	inc b			;ad4a
	inc b			;ad4b
	inc b			;ad4c
	inc b			;ad4d
	inc b			;ad4e
	inc b			;ad4f
	dec b			;ad50
	inc b			;ad51
	inc b			;ad52
	inc b			;ad53
	inc b			;ad54
	inc b			;ad55
	inc b			;ad56
	inc b			;ad57
	inc b			;ad58
	inc b			;ad59
	inc b			;ad5a
	inc b			;ad5b
	inc b			;ad5c
	inc b			;ad5d
	ld b,h			;ad5e
	ld b,h			;ad5f
	ld b,004h		;ad60
	inc b			;ad62
	inc b			;ad63
	inc b			;ad64
	inc b			;ad65
	inc b			;ad66
	inc b			;ad67
	inc b			;ad68
	inc b			;ad69
	inc b			;ad6a
	nop			;ad6b
	nop			;ad6c
	nop			;ad6d
	nop			;ad6e
	nop			;ad6f
	nop			;ad70
	nop			;ad71
	nop			;ad72
	nop			;ad73
	nop			;ad74
	nop			;ad75
	nop			;ad76
	nop			;ad77
	nop			;ad78
	nop			;ad79
	nop			;ad7a
	nop			;ad7b
	nop			;ad7c
	nop			;ad7d
	nop			;ad7e
	nop			;ad7f
	nop			;ad80
	nop			;ad81
	nop			;ad82
	nop			;ad83
	nop			;ad84
	nop			;ad85
	nop			;ad86
	nop			;ad87
	nop			;ad88
	nop			;ad89
	nop			;ad8a
	inc b			;ad8b
	inc b			;ad8c
	inc b			;ad8d
	inc b			;ad8e
	inc b			;ad8f
	inc b			;ad90
	inc b			;ad91
	inc b			;ad92
	inc b			;ad93
	inc b			;ad94
	inc b			;ad95
	inc b			;ad96
	inc b			;ad97
	inc b			;ad98
	inc b			;ad99
	inc b			;ad9a
	ld b,h			;ad9b
	ld b,h			;ad9c
	ld b,h			;ad9d
	ld b,h			;ad9e
	ld b,h			;ad9f
	ld b,h			;ada0
	ld b,h			;ada1
	ld b,h			;ada2
	ld b,h			;ada3
	ld b,h			;ada4
	ld b,h			;ada5
	ld b,h			;ada6
	ld b,h			;ada7
	ld b,h			;ada8
	inc b			;ada9
	inc b			;adaa
	inc b			;adab
	inc b			;adac
	inc b			;adad
	inc b			;adae
	inc b			;adaf
	dec b			;adb0
	dec b			;adb1
	inc b			;adb2
	inc b			;adb3
	inc b			;adb4
	inc b			;adb5
	inc b			;adb6
	inc b			;adb7
	dec b			;adb8
	dec b			;adb9
	dec b			;adba
	ld b,h			;adbb
	ld b,h			;adbc
	ld b,h			;adbd
	ld b,h			;adbe
	inc b			;adbf
	inc b			;adc0
	inc b			;adc1
	inc b			;adc2
	inc b			;adc3
	inc b			;adc4
	inc b			;adc5
	inc b			;adc6
	inc b			;adc7
	inc b			;adc8
	inc b			;adc9
	inc b			;adca
	nop			;adcb
	nop			;adcc
	nop			;adcd
	nop			;adce
	nop			;adcf
	nop			;add0
	nop			;add1
	nop			;add2
	nop			;add3
	nop			;add4
	nop			;add5
	nop			;add6
	nop			;add7
	nop			;add8
	nop			;add9
	nop			;adda
	nop			;addb
	nop			;addc
	nop			;addd
	nop			;adde
	nop			;addf
	nop			;ade0
	nop			;ade1
	nop			;ade2
	nop			;ade3
	nop			;ade4
	nop			;ade5
	nop			;ade6
	nop			;ade7
	nop			;ade8
	nop			;ade9
	nop			;adea
	inc b			;adeb
	inc b			;adec
	inc b			;aded
	inc b			;adee
	inc b			;adef
	inc b			;adf0
	inc b			;adf1
	inc b			;adf2
	inc b			;adf3
	inc b			;adf4
	inc b			;adf5
	inc b			;adf6
	inc b			;adf7
	inc b			;adf8
	inc b			;adf9
	inc b			;adfa
	nop			;adfb
	nop			;adfc
	nop			;adfd
	nop			;adfe
	nop			;adff
	nop			;ae00
	nop			;ae01
	nop			;ae02
	nop			;ae03
	nop			;ae04
	nop			;ae05
	nop			;ae06
	nop			;ae07
	nop			;ae08
	nop			;ae09
	nop			;ae0a
	inc b			;ae0b
	inc b			;ae0c
	inc b			;ae0d
	inc b			;ae0e
	inc b			;ae0f
	inc b			;ae10
	inc b			;ae11
	dec b			;ae12
	dec b			;ae13
	dec b			;ae14
	dec b			;ae15
	dec b			;ae16
	dec b			;ae17
	dec b			;ae18
	dec b			;ae19
	dec b			;ae1a
	ld b,h			;ae1b
	rlca			;ae1c
	rlca			;ae1d
	inc b			;ae1e
	inc b			;ae1f
	inc b			;ae20
	inc b			;ae21
	inc b			;ae22
	inc b			;ae23
	inc b			;ae24
	inc b			;ae25
	inc b			;ae26
	inc b			;ae27
	inc b			;ae28
	inc b			;ae29
	inc b			;ae2a
	nop			;ae2b
	nop			;ae2c
	nop			;ae2d
	nop			;ae2e
	nop			;ae2f
	nop			;ae30
	nop			;ae31
	nop			;ae32
	nop			;ae33
	nop			;ae34
	nop			;ae35
	nop			;ae36
	nop			;ae37
	nop			;ae38
	nop			;ae39
	nop			;ae3a
	nop			;ae3b
	nop			;ae3c
	nop			;ae3d
	nop			;ae3e
	nop			;ae3f
	nop			;ae40
	nop			;ae41
	nop			;ae42
	nop			;ae43
	nop			;ae44
	nop			;ae45
	nop			;ae46
	nop			;ae47
	nop			;ae48
	nop			;ae49
	nop			;ae4a
	inc b			;ae4b
	inc b			;ae4c
	inc b			;ae4d
	inc b			;ae4e
	inc b			;ae4f
	inc b			;ae50
	inc b			;ae51
	inc b			;ae52
	inc b			;ae53
	inc b			;ae54
	inc b			;ae55
	inc b			;ae56
	inc b			;ae57
	inc b			;ae58
	inc b			;ae59
	inc b			;ae5a
	nop			;ae5b
	nop			;ae5c
	nop			;ae5d
	nop			;ae5e
	nop			;ae5f
	nop			;ae60
	nop			;ae61
	nop			;ae62
	nop			;ae63
	nop			;ae64
	nop			;ae65
	nop			;ae66
	nop			;ae67
	nop			;ae68
	nop			;ae69
	nop			;ae6a
	inc b			;ae6b
	inc b			;ae6c
	inc b			;ae6d
	ld b,d			;ae6e
	inc b			;ae6f
	inc b			;ae70
	inc b			;ae71
	dec b			;ae72
	dec b			;ae73
	dec b			;ae74
	dec b			;ae75
	dec b			;ae76
	dec b			;ae77
	dec b			;ae78
	dec b			;ae79
	dec b			;ae7a
	rlca			;ae7b
	rlca			;ae7c
	inc b			;ae7d
	inc b			;ae7e
	inc b			;ae7f
	inc b			;ae80
	inc b			;ae81
	inc b			;ae82
	inc b			;ae83
	inc b			;ae84
	inc b			;ae85
	inc b			;ae86
	inc b			;ae87
	inc b			;ae88
	inc b			;ae89
	inc b			;ae8a
	nop			;ae8b
	nop			;ae8c
	nop			;ae8d
	nop			;ae8e
	nop			;ae8f
	nop			;ae90
	nop			;ae91
	nop			;ae92
	nop			;ae93
	nop			;ae94
	nop			;ae95
	nop			;ae96
	nop			;ae97
	nop			;ae98
	nop			;ae99
	nop			;ae9a
	nop			;ae9b
	nop			;ae9c
	nop			;ae9d
	nop			;ae9e
	nop			;ae9f
	nop			;aea0
	nop			;aea1
	nop			;aea2
	nop			;aea3
	nop			;aea4
	nop			;aea5
	nop			;aea6
	nop			;aea7
	nop			;aea8
	nop			;aea9
laeaah:
	nop			;aeaa
	nop			;aeab
	nop			;aeac
	nop			;aead
	nop			;aeae
	nop			;aeaf
	nop			;aeb0
	nop			;aeb1
	nop			;aeb2
	nop			;aeb3
	nop			;aeb4
	nop			;aeb5
	nop			;aeb6
	nop			;aeb7
	nop			;aeb8
	nop			;aeb9
	nop			;aeba
	nop			;aebb
	nop			;aebc
	nop			;aebd
	nop			;aebe
	nop			;aebf
	nop			;aec0
	nop			;aec1
	nop			;aec2
	nop			;aec3
	nop			;aec4
	nop			;aec5
	nop			;aec6
	nop			;aec7
	nop			;aec8
	nop			;aec9
	nop			;aeca
	nop			;aecb
	nop			;aecc
	nop			;aecd
	nop			;aece
	nop			;aecf
	nop			;aed0
	nop			;aed1
	nop			;aed2
	nop			;aed3
	nop			;aed4
	nop			;aed5
	nop			;aed6
	nop			;aed7
	nop			;aed8
	nop			;aed9
	nop			;aeda
	nop			;aedb
	rlca			;aedc
	rlca			;aedd
	rlca			;aede
	rlca			;aedf
	rlca			;aee0
	inc b			;aee1
	inc b			;aee2
	inc b			;aee3
	inc b			;aee4
	inc b			;aee5
	inc b			;aee6
	inc b			;aee7
	inc b			;aee8
	inc b			;aee9
	inc b			;aeea
	nop			;aeeb
	nop			;aeec
	nop			;aeed
	nop			;aeee
	nop			;aeef
	nop			;aef0
	nop			;aef1
	nop			;aef2
	nop			;aef3
	nop			;aef4
	nop			;aef5
	nop			;aef6
	nop			;aef7
	nop			;aef8
	nop			;aef9
	nop			;aefa
	nop			;aefb
	nop			;aefc
	nop			;aefd
	nop			;aefe
laeffh:
	nop			;aeff
	nop			;af00
	nop			;af01
	nop			;af02
	nop			;af03
	nop			;af04
	nop			;af05
	nop			;af06
	nop			;af07
	nop			;af08
	nop			;af09
	nop			;af0a
	nop			;af0b
	nop			;af0c
	nop			;af0d
	nop			;af0e
	nop			;af0f
	nop			;af10
	nop			;af11
	nop			;af12
	nop			;af13
	nop			;af14
	nop			;af15
	nop			;af16
	nop			;af17
	nop			;af18
	nop			;af19
	nop			;af1a
	nop			;af1b
	nop			;af1c
	nop			;af1d
	nop			;af1e
	nop			;af1f
	nop			;af20
	nop			;af21
	nop			;af22
	nop			;af23
	nop			;af24
	nop			;af25
	nop			;af26
	nop			;af27
	nop			;af28
	nop			;af29
	nop			;af2a
	nop			;af2b
	nop			;af2c
	nop			;af2d
	nop			;af2e
	nop			;af2f
	nop			;af30
	nop			;af31
	nop			;af32
	nop			;af33
	nop			;af34
	nop			;af35
	nop			;af36
	nop			;af37
	nop			;af38
	nop			;af39
	nop			;af3a
	nop			;af3b
	nop			;af3c
	nop			;af3d
	nop			;af3e
	nop			;af3f
	nop			;af40
	inc b			;af41
	inc b			;af42
	inc b			;af43
	inc b			;af44
	inc b			;af45
	inc b			;af46
	inc b			;af47
	inc b			;af48
	inc b			;af49
	inc b			;af4a
	nop			;af4b
	nop			;af4c
	nop			;af4d
	nop			;af4e
	nop			;af4f
	nop			;af50
	nop			;af51
	nop			;af52
	nop			;af53
	nop			;af54
	nop			;af55
	nop			;af56
	nop			;af57
	nop			;af58
	nop			;af59
	nop			;af5a
	nop			;af5b
	ld a,a			;af5c
	rst 38h			;af5d
	rst 38h			;af5e
	rst 38h			;af5f
	rst 38h			;af60
	push af			;af61
	nop			;af62
	ld a,(bc)		;af63
	nop			;af64
	rst 38h			;af65
	cp a			;af66
	rst 38h			;af67
	rst 38h			;af68
	rst 38h			;af69
	rst 38h			;af6a
	rst 38h			;af6b
	add hl,sp		;af6c
	ld b,b			;af6d
	ld e,a			;af6e
	rst 38h			;af6f
	call m,sub_ff7fh	;af70
	rst 38h			;af73
	rst 38h			;af74
	ld a,a			;af75
	cp b			;af76
	add a,e			;af77
	rst 38h			;af78
	rst 38h			;af79
	rst 38h			;af7a
	rst 38h			;af7b
	ret m			;af7c
	rst 38h			;af7d
	rst 38h			;af7e
	ret m			;af7f
	nop			;af80
	ld bc,lffffh		;af81
	rst 38h			;af84
	rst 38h			;af85
	add a,b			;af86
	inc a			;af87
	nop			;af88
	nop			;af89
	nop			;af8a
	nop			;af8b
	nop			;af8c
	nop			;af8d
	nop			;af8e
	nop			;af8f
	nop			;af90
	nop			;af91
	nop			;af92
	nop			;af93
	nop			;af94
	nop			;af95
	nop			;af96
	nop			;af97
	nop			;af98
	nop			;af99
	nop			;af9a
	nop			;af9b
	nop			;af9c
	nop			;af9d
	nop			;af9e
	nop			;af9f
	nop			;afa0
	nop			;afa1
	nop			;afa2
	nop			;afa3
	ld a,e			;afa4
	rst 38h			;afa5
	rst 38h			;afa6
	rst 38h			;afa7
	rst 38h			;afa8
	jp pe,01f80h		;afa9
	nop			;afac
	rst 38h			;afad
	rst 18h			;afae
	rst 38h			;afaf
	rst 38h			;afb0
	rst 38h			;afb1
	rst 38h			;afb2
	rst 38h			;afb3
	and (hl)		;afb4
	ret nz			;afb5
	xor a			;afb6
	rst 38h			;afb7
	rst 38h			;afb8
	inc bc			;afb9
	rst 38h			;afba
	rst 38h			;afbb
	rst 38h			;afbc
	cp (hl)			;afbd
	ld a,b			;afbe
	add a,c			;afbf
	rst 38h			;afc0
	rst 38h			;afc1
	rst 38h			;afc2
	rst 38h			;afc3
	cp 01fh			;afc4
	rst 38h			;afc6
	ret m			;afc7
lafc8h:
	nop			;afc8
	nop			;afc9
	ld a,a			;afca
	rst 38h			;afcb
	rst 38h			;afcc
	cp 000h			;afcd
	jr nc,lafd1h		;afcf
lafd1h:
	nop			;afd1
	nop			;afd2
	nop			;afd3
	nop			;afd4
	nop			;afd5
	nop			;afd6
	nop			;afd7
	nop			;afd8
	nop			;afd9
	nop			;afda
	nop			;afdb
	nop			;afdc
	nop			;afdd
	nop			;afde
	nop			;afdf
	nop			;afe0
	nop			;afe1
	nop			;afe2
	nop			;afe3
	nop			;afe4
	nop			;afe5
	nop			;afe6
	nop			;afe7
	nop			;afe8
	nop			;afe9
	nop			;afea
	nop			;afeb
	add hl,sp		;afec
	rst 38h			;afed
	rst 38h			;afee
	rst 38h			;afef
	rst 38h			;aff0
	rst 38h			;aff1
	ret nz			;aff2
	inc e			;aff3
	nop			;aff4
	rst 38h			;aff5
	rst 20h			;aff6
	rst 38h			;aff7
	rst 38h			;aff8
	rst 38h			;aff9
	rst 38h			;affa
	rst 38h			;affb
	rst 18h			;affc
	and b			;affd
laffeh:
	ld l,a			;affe
	rst 38h			;afff
	rst 38h			;b000
	ret m			;b001
	ccf			;b002
	rst 38h			;b003
	rst 38h			;b004
	pop bc			;b005
	call m,sub_ff81h	;b006
	rst 38h			;b009
	rst 38h			;b00a
	rst 38h			;b00b
	rst 38h			;b00c
	jp lf8ffh		;b00d
	nop			;b010
	nop			;b011
	rrca			;b012
	rst 38h			;b013
	rst 38h			;b014
	nop			;b015
	nop			;b016
	nop			;b017
	nop			;b018
	nop			;b019
	nop			;b01a
	nop			;b01b
	nop			;b01c
	nop			;b01d
	nop			;b01e
	nop			;b01f
	nop			;b020
	nop			;b021
	nop			;b022
	nop			;b023
	nop			;b024
	nop			;b025
	nop			;b026
	nop			;b027
	nop			;b028
	nop			;b029
	nop			;b02a
	nop			;b02b
	nop			;b02c
	nop			;b02d
	nop			;b02e
	nop			;b02f
	nop			;b030
	nop			;b031
	nop			;b032
	nop			;b033
	inc a			;b034
	rst 38h			;b035
	rst 38h			;b036
	rst 38h			;b037
	rst 38h			;b038
	rst 38h			;b039
	ld b,b			;b03a
	ld (bc),a		;b03b
	add a,b			;b03c
	rst 38h			;b03d
	ld sp,hl		;b03e
	rst 38h			;b03f
	rst 38h			;b040
	rst 38h			;b041
	rst 38h			;b042
	rst 38h			;b043
	cp a			;b044
	ld h,b			;b045
	cpl			;b046
	rst 38h			;b047
	rst 38h			;b048
	rst 38h			;b049
	adc a,a			;b04a
	rst 38h			;b04b
	rst 38h			;b04c
	rst 38h			;b04d
	call m,0ff00h		;b04e
	rst 38h			;b051
	rst 38h			;b052
	rst 38h			;b053
	rst 38h			;b054
	ret m			;b055
	rst 38h			;b056
	ret p			;b057
	nop			;b058
	nop			;b059
	nop			;b05a
	nop			;b05b
	nop			;b05c
	nop			;b05d
	nop			;b05e
	nop			;b05f
	nop			;b060
	nop			;b061
	nop			;b062
	nop			;b063
	nop			;b064
	nop			;b065
	nop			;b066
	nop			;b067
	nop			;b068
	nop			;b069
	nop			;b06a
	nop			;b06b
	nop			;b06c
	nop			;b06d
	nop			;b06e
	nop			;b06f
	nop			;b070
	nop			;b071
	nop			;b072
	nop			;b073
	nop			;b074
	nop			;b075
	nop			;b076
	nop			;b077
	nop			;b078
	nop			;b079
	nop			;b07a
	nop			;b07b
	ld a,0ffh		;b07c
	rst 38h			;b07e
	rst 38h			;b07f
	rst 38h			;b080
	rst 38h			;b081
	and b			;b082
	dec e			;b083
	add a,b			;b084
	ld a,a			;b085
	call m,lffffh		;b086
	rst 38h			;b089
	rst 38h			;b08a
	rst 38h			;b08b
	cp (hl)			;b08c
	and b			;b08d
	ld d,a			;b08e
	rst 38h			;b08f
	rst 38h			;b090
	rst 38h			;b091
	ret p			;b092
	ld a,a			;b093
	rst 38h			;b094
	rst 38h			;b095
	call m,07f00h		;b096
	rst 38h			;b099
	rst 38h			;b09a
	rst 38h			;b09b
	rst 38h			;b09c
	cp 07fh			;b09d
	ret p			;b09f
	nop			;b0a0
	nop			;b0a1
	nop			;b0a2
	nop			;b0a3
	nop			;b0a4
	nop			;b0a5
	nop			;b0a6
	nop			;b0a7
	nop			;b0a8
	nop			;b0a9
	nop			;b0aa
	nop			;b0ab
	nop			;b0ac
	nop			;b0ad
	nop			;b0ae
	nop			;b0af
	nop			;b0b0
	nop			;b0b1
	nop			;b0b2
	nop			;b0b3
	nop			;b0b4
	nop			;b0b5
	nop			;b0b6
	nop			;b0b7
	nop			;b0b8
	nop			;b0b9
	nop			;b0ba
	nop			;b0bb
	nop			;b0bc
	nop			;b0bd
	nop			;b0be
	nop			;b0bf
	nop			;b0c0
	nop			;b0c1
	nop			;b0c2
	nop			;b0c3
	sbc a,(hl)		;b0c4
	rst 38h			;b0c5
	rst 38h			;b0c6
	rst 38h			;b0c7
	rst 38h			;b0c8
	defb 0fdh,050h,03eh ;illegal sequence	;b0c9
	add a,b			;b0cc
	cp a			;b0cd
	rst 38h			;b0ce
	ccf			;b0cf
	rst 38h			;b0d0
	rst 38h			;b0d1
	rst 38h			;b0d2
	rst 38h			;b0d3
	ld e,c			;b0d4
	ld h,b			;b0d5
	dec hl			;b0d6
	rst 38h			;b0d7
	rst 38h			;b0d8
	rst 38h			;b0d9
	rst 38h			;b0da
	rra			;b0db
	rst 38h			;b0dc
	rst 38h			;b0dd
lb0deh:
	call m,03f00h		;b0de
	rst 38h			;b0e1
	rst 38h			;b0e2
	rst 38h			;b0e3
	rst 38h			;b0e4
	call m,sub_f07fh	;b0e5
	nop			;b0e8
	nop			;b0e9
	nop			;b0ea
	nop			;b0eb
	nop			;b0ec
	nop			;b0ed
	nop			;b0ee
	nop			;b0ef
	nop			;b0f0
	nop			;b0f1
	nop			;b0f2
	nop			;b0f3
	nop			;b0f4
	nop			;b0f5
	nop			;b0f6
	nop			;b0f7
	nop			;b0f8
	nop			;b0f9
	nop			;b0fa
	nop			;b0fb
	nop			;b0fc
	nop			;b0fd
	nop			;b0fe
	nop			;b0ff
	nop			;b100
	nop			;b101
	nop			;b102
	nop			;b103
	nop			;b104
	nop			;b105
	nop			;b106
	nop			;b107
	nop			;b108
	nop			;b109
	nop			;b10a
	nop			;b10b
	rst 18h			;b10c
	ld a,a			;b10d
	rst 38h			;b10e
	rst 38h			;b10f
	rst 38h			;b110
	rst 38h			;b111
	ret pe			;b112
	ccf			;b113
	ld b,b			;b114
	cp a			;b115
	rst 38h			;b116
	add a,a			;b117
	rst 38h			;b118
	rst 38h			;b119
	rst 38h			;b11a
	rst 38h			;b11b
	ld h,(hl)		;b11c
	and b			;b11d
	ld (hl),l		;b11e
	rst 38h			;b11f
	rst 38h			;b120
	rst 38h			;b121
	rst 38h			;b122
	rst 8			;b123
	rst 38h			;b124
	rst 38h			;b125
	call m,01f00h		;b126
	rst 38h			;b129
	rst 38h			;b12a
	rst 38h			;b12b
	rst 38h			;b12c
	ret p			;b12d
	ccf			;b12e
	ret po			;b12f
	nop			;b130
	nop			;b131
	nop			;b132
	nop			;b133
	nop			;b134
	nop			;b135
	nop			;b136
	nop			;b137
	nop			;b138
	nop			;b139
	nop			;b13a
	nop			;b13b
	nop			;b13c
	nop			;b13d
	nop			;b13e
	nop			;b13f
	nop			;b140
	nop			;b141
	nop			;b142
	nop			;b143
	nop			;b144
	nop			;b145
	nop			;b146
	nop			;b147
	nop			;b148
	nop			;b149
	nop			;b14a
	nop			;b14b
	nop			;b14c
	nop			;b14d
	nop			;b14e
	nop			;b14f
	nop			;b150
	nop			;b151
	nop			;b152
	nop			;b153
	rst 28h			;b154
	ccf			;b155
	rst 38h			;b156
	rst 38h			;b157
	rst 38h			;b158
	rst 38h			;b159
	call m,0c03eh		;b15a
	cp a			;b15d
	rst 38h			;b15e
	pop af			;b15f
	rst 38h			;b160
	rst 38h			;b161
	rst 38h			;b162
	rst 38h			;b163
	ld a,a			;b164
	ret nc			;b165
	ld c,l			;b166
	rst 38h			;b167
	rst 38h			;b168
	rst 38h			;b169
	rst 38h			;b16a
	ex (sp),hl		;b16b
	rst 38h			;b16c
	rst 38h			;b16d
	call m,00700h		;b16e
	rst 38h			;b171
	rst 38h			;b172
	rst 38h			;b173
	rst 38h			;b174
	ret po			;b175
	ccf			;b176
	nop			;b177
	nop			;b178
	nop			;b179
	nop			;b17a
	nop			;b17b
	nop			;b17c
	nop			;b17d
	nop			;b17e
	nop			;b17f
	nop			;b180
	nop			;b181
	nop			;b182
	nop			;b183
	nop			;b184
	nop			;b185
	nop			;b186
	nop			;b187
	nop			;b188
	nop			;b189
	nop			;b18a
	nop			;b18b
	nop			;b18c
	nop			;b18d
	nop			;b18e
	nop			;b18f
	nop			;b190
	nop			;b191
	nop			;b192
	nop			;b193
	nop			;b194
	nop			;b195
	nop			;b196
	nop			;b197
	nop			;b198
	nop			;b199
	nop			;b19a
	nop			;b19b
	rst 38h			;b19c
	cp a			;b19d
	rst 38h			;b19e
	rst 38h			;b19f
	rst 38h			;b1a0
	rst 38h			;b1a1
	rst 38h			;b1a2
	add hl,sp		;b1a3
	ld b,b			;b1a4
	ld e,a			;b1a5
	call m,000feh		;b1a6
	rst 38h			;b1a9
	rst 38h			;b1aa
	rst 38h			;b1ab
	ld a,a			;b1ac
	cp b			;b1ad
	add a,e			;b1ae
	rst 38h			;b1af
	and d			;b1b0
	defb 0ddh,078h,018h ;illegal sequence	;b1b1
	rst 20h			;b1b4
	or l			;b1b5
	ret m			;b1b6
	nop			;b1b7
	rra			;b1b8
	cp 055h			;b1b9
	ld e,d			;b1bb
	ld bc,lddfdh		;b1bc
	and b			;b1bf
	nop			;b1c0
	nop			;b1c1
	rra			;b1c2
	rst 38h			;b1c3
	rrca			;b1c4
	jp m,lf1dfh		;b1c5
	ld (00000h),hl		;b1c8
	nop			;b1cb
	nop			;b1cc
	nop			;b1cd
	nop			;b1ce
	jr nc,lb1e4h		;b1cf
	ret nz			;b1d1
	nop			;b1d2
	nop			;b1d3
	nop			;b1d4
	nop			;b1d5
	nop			;b1d6
	nop			;b1d7
	nop			;b1d8
	nop			;b1d9
	nop			;b1da
	nop			;b1db
	nop			;b1dc
	nop			;b1dd
	nop			;b1de
	nop			;b1df
	nop			;b1e0
	nop			;b1e1
	nop			;b1e2
	nop			;b1e3
lb1e4h:
	rst 38h			;b1e4
	rst 18h			;b1e5
	rst 38h			;b1e6
	rst 38h			;b1e7
	rst 38h			;b1e8
	rst 38h			;b1e9
	rst 38h			;b1ea
	and (hl)		;b1eb
	ret nz			;b1ec
	xor a			;b1ed
	call m,lffffh		;b1ee
	rra			;b1f1
	rst 38h			;b1f2
	rst 38h			;b1f3
	cp (hl)			;b1f4
	ld a,b			;b1f5
	add a,c			;b1f6
	rst 38h			;b1f7
	push bc			;b1f8
	jp pe,01ca8h		;b1f9
	ld a,(bc)		;b1fc
	cp d			;b1fd
	ret m			;b1fe
	nop			;b1ff
	rra			;b200
	cp 068h			;b201
	xor d			;b203
	nop			;b204
	defb 0fdh,0d3h,0a0h ;illegal sequence	;b205
	nop			;b208
	nop			;b209
	rlca			;b20a
	rst 38h			;b20b
	rst 8			;b20c
	sub l			;b20d
	defb 0edh ;next byte illegal after ed	;b20e
	call m,00092h		;b20f
	nop			;b212
	nop			;b213
	nop			;b214
	nop			;b215
	nop			;b216
	inc c			;b217
	ld de,000a0h		;b218
	nop			;b21b
	nop			;b21c
	nop			;b21d
	nop			;b21e
	nop			;b21f
	nop			;b220
	nop			;b221
	nop			;b222
	nop			;b223
	nop			;b224
	nop			;b225
	nop			;b226
	nop			;b227
	nop			;b228
	nop			;b229
	nop			;b22a
	nop			;b22b
	rst 38h			;b22c
	rst 20h			;b22d
	rst 38h			;b22e
	rst 38h			;b22f
	rst 38h			;b230
	rst 38h			;b231
	rst 38h			;b232
	rst 18h			;b233
	and b			;b234
	ld l,a			;b235
	defb 0fdh,07fh,0b5h ;illegal sequence	;b236
	ld c,a			;b239
	sbc a,a			;b23a
	rst 38h			;b23b
	pop bc			;b23c
	call m,sub_ff81h	;b23d
	jp pe,028edh		;b240
	ld e,01ah		;b243
	jp c,000f8h		;b245
	rrca			;b248
	rst 38h			;b249
	ld d,l			;b24a
	ld e,c			;b24b
	nop			;b24c
	ld (hl),d		;b24d
	ex (sp),hl		;b24e
	sub b			;b24f
	nop			;b250
	nop			;b251
	inc bc			;b252
	rst 38h			;b253
	di			;b254
	adc a,a			;b255
	xor 0feh		;b256
	ld d,b			;b258
	nop			;b259
	nop			;b25a
	nop			;b25b
	nop			;b25c
	nop			;b25d
	nop			;b25e
	ld bc,06ee1h		;b25f
	nop			;b262
	nop			;b263
	nop			;b264
	nop			;b265
	nop			;b266
	nop			;b267
	nop			;b268
	nop			;b269
	nop			;b26a
	nop			;b26b
	nop			;b26c
	nop			;b26d
	nop			;b26e
	nop			;b26f
	nop			;b270
	nop			;b271
	nop			;b272
	nop			;b273
	rst 38h			;b274
	ld sp,hl		;b275
	rst 38h			;b276
	rst 38h			;b277
	rst 38h			;b278
	rst 38h			;b279
	rst 38h			;b27a
	cp a			;b27b
	ld h,b			;b27c
	cpl			;b27d
	cp 0bfh			;b27e
	xor e			;b280
	and a			;b281
	xor a			;b282
	rst 38h			;b283
	rst 38h			;b284
	call m,0ff00h		;b285
	push af			;b288
	xor 0a8h		;b289
	ld e,01eh		;b28b
	ld (ix+000h),b		;b28d
	rrca			;b290
	rst 38h			;b291
	or h			;b292
	ld l,l			;b293
	nop			;b294
	ccf			;b295
	rst 30h			;b296
	djnz lb299h		;b297
lb299h:
	nop			;b299
	nop			;b29a
	rst 38h			;b29b
	call m,sub_f743h	;b29c
	ccf			;b29f
	ld b,b			;b2a0
	nop			;b2a1
	nop			;b2a2
	nop			;b2a3
	nop			;b2a4
	nop			;b2a5
	nop			;b2a6
	nop			;b2a7
	nop			;b2a8
	defb 0fdh,000h,000h ;illegal sequence	;b2a9
	nop			;b2ac
	nop			;b2ad
	nop			;b2ae
	nop			;b2af
	nop			;b2b0
	nop			;b2b1
	nop			;b2b2
	nop			;b2b3
	nop			;b2b4
	nop			;b2b5
	nop			;b2b6
	nop			;b2b7
	nop			;b2b8
	nop			;b2b9
	nop			;b2ba
	nop			;b2bb
	ld a,a			;b2bc
	or 0ffh			;b2bd
	rst 38h			;b2bf
	rst 38h			;b2c0
	rst 38h			;b2c1
	rst 38h			;b2c2
	cp (hl)			;b2c3
	and b			;b2c4
	ld d,a			;b2c5
	cp 0bfh			;b2c6
	or l			;b2c8
	ld d,b			;b2c9
	ld (hl),a		;b2ca
	rst 38h			;b2cb
	rst 38h			;b2cc
	call m,0ff00h		;b2cd
	jp m,05cf5h		;b2d0
	rrca			;b2d3
	rra			;b2d4
	cp a			;b2d5
	jr nc,lb2d8h		;b2d6
lb2d8h:
	inc bc			;b2d8
	rst 38h			;b2d9
	jp c,le056h		;b2da
	dec c			;b2dd
	or a			;b2de
	ex af,af'		;b2df
	nop			;b2e0
	nop			;b2e1
	nop			;b2e2
	ccf			;b2e3
	rst 38h			;b2e4
	ret nc			;b2e5
	rst 38h			;b2e6
	sbc a,a			;b2e7
	nop			;b2e8
	nop			;b2e9
	nop			;b2ea
	nop			;b2eb
	nop			;b2ec
	nop			;b2ed
	nop			;b2ee
	nop			;b2ef
	nop			;b2f0
	rst 38h			;b2f1
	nop			;b2f2
	nop			;b2f3
	nop			;b2f4
	nop			;b2f5
	nop			;b2f6
	nop			;b2f7
	nop			;b2f8
	nop			;b2f9
	nop			;b2fa
	nop			;b2fb
	nop			;b2fc
	nop			;b2fd
	nop			;b2fe
	nop			;b2ff
	nop			;b300
	nop			;b301
	nop			;b302
	nop			;b303
	cp a			;b304
	ld sp,hl		;b305
	ccf			;b306
	rst 38h			;b307
	rst 38h			;b308
	rst 38h			;b309
	rst 38h			;b30a
	ld e,c			;b30b
	ld h,b			;b30c
	dec hl			;b30d
	rst 38h			;b30e
	ld e,a			;b30f
	jp c,07ba0h		;b310
	defb 0fdh,0ffh,0fch ;illegal sequence	;b313
	nop			;b316
	ld a,a			;b317
	jp m,la2b6h		;b318
	rrca			;b31b
	sbc a,b			;b31c
	cp (hl)			;b31d
	or b			;b31e
	nop			;b31f
	ld bc,leeffh		;b320
	xor l			;b323
	ret nc			;b324
	rla			;b325
	ld e,008h		;b326
	nop			;b328
	nop			;b329
	nop			;b32a
	rlca			;b32b
	rst 38h			;b32c
	ret p			;b32d
	ccf			;b32e
	rst 8			;b32f
	add a,b			;b330
	nop			;b331
	nop			;b332
	nop			;b333
	nop			;b334
	nop			;b335
	nop			;b336
	nop			;b337
	inc b			;b338
	rst 38h			;b339
	nop			;b33a
	nop			;b33b
	nop			;b33c
	nop			;b33d
	nop			;b33e
	nop			;b33f
	nop			;b340
	nop			;b341
	nop			;b342
	nop			;b343
	nop			;b344
	nop			;b345
	nop			;b346
	nop			;b347
	nop			;b348
	nop			;b349
	nop			;b34a
	nop			;b34b
	cp a			;b34c
	call p,sub_ff47h	;b34d
	rst 38h			;b350
	rst 38h			;b351
	rst 38h			;b352
	ld h,(hl)		;b353
	and b			;b354
	ld (hl),l		;b355
	rst 38h			;b356
	xor e			;b357
	push de			;b358
	ld c,b			;b359
	ld a,e			;b35a
	jp m,lfcbbh		;b35b
	nop			;b35e
	ld a,a			;b35f
	defb 0fdh,03bh,064h ;illegal sequence	;b360
	rlca			;b363
	call pe,sub_c0bdh	;b364
	nop			;b367
	nop			;b368
	rst 38h			;b369
	call p,0a8d3h		;b36a
	ld a,(0048ch)		;b36d
	nop			;b370
	nop			;b371
	nop			;b372
	nop			;b373
	ld a,a			;b374
	ret po			;b375
	rrca			;b376
	rst 0			;b377
	add a,b			;b378
	nop			;b379
	nop			;b37a
	nop			;b37b
	nop			;b37c
	nop			;b37d
	nop			;b37e
	nop			;b37f
	inc b			;b380
	ld a,(hl)		;b381
	nop			;b382
	nop			;b383
	nop			;b384
	nop			;b385
	nop			;b386
lb387h:
	nop			;b387
	nop			;b388
	nop			;b389
	nop			;b38a
	nop			;b38b
	nop			;b38c
	nop			;b38d
	nop			;b38e
	nop			;b38f
	nop			;b390
	nop			;b391
	nop			;b392
	nop			;b393
	cp a			;b394
	ei			;b395
	add hl,hl		;b396
	rst 38h			;b397
	rst 38h			;b398
	rst 38h			;b399
	rst 38h			;b39a
	ld a,a			;b39b
	ret nc			;b39c
	ld c,l			;b39d
	rst 38h			;b39e
	out (0dah),a		;b39f
	sub b			;b3a1
	dec sp			;b3a2
	rst 30h			;b3a3
	ld (hl),l		;b3a4
	call m,03f00h		;b3a5
	defb 0fdh,03bh,0bah ;illegal sequence	;b3a8
	inc bc			;b3ab
	rst 38h			;b3ac
	sbc a,l			;b3ad
	ret nz			;b3ae
	nop			;b3af
	nop			;b3b0
	ld a,a			;b3b1
	jp m,0fce7h		;b3b2
	dec a			;b3b5
	ret nz			;b3b6
	inc b			;b3b7
	nop			;b3b8
	nop			;b3b9
	nop			;b3ba
	nop			;b3bb
	inc bc			;b3bc
	ret nz			;b3bd
	inc bc			;b3be
	add a,e			;b3bf
	ret nz			;b3c0
	nop			;b3c1
	nop			;b3c2
	nop			;b3c3
	nop			;b3c4
	nop			;b3c5
	nop			;b3c6
	nop			;b3c7
	ld (bc),a		;b3c8
	inc e			;b3c9
	nop			;b3ca
	nop			;b3cb
	nop			;b3cc
	nop			;b3cd
	nop			;b3ce
	nop			;b3cf
	nop			;b3d0
	nop			;b3d1
	nop			;b3d2
	nop			;b3d3
	nop			;b3d4
	nop			;b3d5
	nop			;b3d6
	nop			;b3d7
	nop			;b3d8
	nop			;b3d9
	nop			;b3da
	nop			;b3db
	rst 38h			;b3dc
	cp a			;b3dd
	rst 38h			;b3de
	rst 38h			;b3df
	rst 38h			;b3e0
	rst 38h			;b3e1
	rst 38h			;b3e2
	add hl,sp		;b3e3
	ld b,b			;b3e4
	ld e,a			;b3e5
	call m,000feh		;b3e6
	rst 38h			;b3e9
	rst 38h			;b3ea
	rst 38h			;b3eb
	ld a,a			;b3ec
	cp b			;b3ed
	add a,e			;b3ee
	rst 38h			;b3ef
	and e			;b3f0
	call c,078bdh		;b3f1
	rst 18h			;b3f4
	rst 38h			;b3f5
	ret m			;b3f6
	nop			;b3f7
	rra			;b3f8
	cp 05dh			;b3f9
	ld b,(hl)		;b3fb
	ei			;b3fc
	rst 38h			;b3fd
	inc a			;b3fe
	ld de,00000h		;b3ff
	rra			;b402
	rst 38h			;b403
	dec e			;b404
	inc sp			;b405
	xor e			;b406
	ld d,l			;b407
	sub a			;b408
	nop			;b409
	nop			;b40a
	djnz lb47dh		;b40b
	nop			;b40d
	nop			;b40e
	ld (hl),e		;b40f
	in a,(0abh)		;b410
	nop			;b412
	nop			;b413
	rlca			;b414
	ret po			;b415
	nop			;b416
	in a,(0f3h)		;b417
	sbc a,a			;b419
	ld a,h			;b41a
	nop			;b41b
	nop			;b41c
	nop			;b41d
	nop			;b41e
	nop			;b41f
	nop			;b420
	nop			;b421
	nop			;b422
	nop			;b423
	rst 38h			;b424
	rst 18h			;b425
	rst 38h			;b426
	rst 38h			;b427
	rst 38h			;b428
	rst 38h			;b429
	rst 38h			;b42a
	and (hl)		;b42b
	ret nz			;b42c
	xor a			;b42d
	call m,leeffh		;b42e
	rra			;b431
	rst 38h			;b432
	rst 38h			;b433
	cp (hl)			;b434
	ld a,b			;b435
	add a,c			;b436
	rst 38h			;b437
	rst 0			;b438
	jp pe,0767fh		;b439
	dec d			;b43c
	rst 38h			;b43d
	ret m			;b43e
	nop			;b43f
	rra			;b440
	cp 06dh			;b441
	and d			;b443
	ld e,a			;b444
	ld a,l			;b445
	jr nc,lb449h		;b446
	nop			;b448
lb449h:
	ex af,af'		;b449
	rlca			;b44a
	rst 38h			;b44b
	add a,089h		;b44c
	ld e,a			;b44e
	ex (sp),hl		;b44f
	cp 000h			;b450
	nop			;b452
	nop			;b453
	ld a,000h		;b454
	nop			;b456
	ld e,(hl)		;b457
	sbc a,(hl)		;b458
	cp h			;b459
	nop			;b45a
	nop			;b45b
	inc bc			;b45c
	ret m			;b45d
	nop			;b45e
	rst 38h			;b45f
	jp m,0bca7h		;b460
	nop			;b463
	nop			;b464
	nop			;b465
	nop			;b466
	nop			;b467
	nop			;b468
	nop			;b469
	nop			;b46a
	nop			;b46b
	rst 38h			;b46c
	rst 20h			;b46d
	rst 38h			;b46e
	rst 38h			;b46f
	rst 38h			;b470
	rst 38h			;b471
	rst 38h			;b472
	rst 18h			;b473
	and b			;b474
	ld l,a			;b475
	defb 0fdh,07fh,0a7h ;illegal sequence	;b476
	rst 8			;b479
	rst 38h			;b47a
	rst 38h			;b47b
	pop bc			;b47c
lb47dh:
	call m,sub_ff81h	;b47d
	ex de,hl		;b480
	defb 0edh ;next byte illegal after ed	;b481
	ld a,a			;b482
	defb 0ddh,082h,0ffh ;illegal sequence	;b483
	ret m			;b486
	nop			;b487
	rrca			;b488
	rst 38h			;b489
	ld d,l			;b48a
	ld e,c			;b48b
	ld l,e			;b48c
	ld sp,hl		;b48d
	nop			;b48e
	ld b,c			;b48f
	nop			;b490
	nop			;b491
	inc bc			;b492
	rst 38h			;b493
	di			;b494
	sub e			;b495
	or a			;b496
	ld a,a			;b497
	ld c,(hl)		;b498
	nop			;b499
	nop			;b49a
	nop			;b49b
	nop			;b49c
	nop			;b49d
	ld hl,06966h		;b49e
	defb 0edh ;next byte illegal after ed	;b4a1
	nop			;b4a2
	nop			;b4a3
	nop			;b4a4
	cp 000h			;b4a5
	ld a,a			;b4a7
	and d			;b4a8
	ld e,0ech		;b4a9
	nop			;b4ab
	nop			;b4ac
	nop			;b4ad
	nop			;b4ae
	nop			;b4af
	nop			;b4b0
	nop			;b4b1
	nop			;b4b2
	nop			;b4b3
	rst 38h			;b4b4
	ld sp,hl		;b4b5
	rst 38h			;b4b6
	rst 38h			;b4b7
	rst 38h			;b4b8
	rst 38h			;b4b9
	rst 38h			;b4ba
	cp a			;b4bb
	ld h,b			;b4bc
	cpl			;b4bd
	cp 0bfh			;b4be
	and e			;b4c0
	ld h,a			;b4c1
	rst 38h			;b4c2
	rst 38h			;b4c3
	rst 38h			;b4c4
	call m,0ff00h		;b4c5
	rst 30h			;b4c8
	xor 03eh		;b4c9
	di			;b4cb
	add a,b			;b4cc
	rst 38h			;b4cd
	jp p,00f00h		;b4ce
	rst 38h			;b4d1
	or l			;b4d2
	ld l,l			;b4d3
	sbc a,0cdh		;b4d4
	inc bc			;b4d6
	ret nz			;b4d7
	nop			;b4d8
	nop			;b4d9
	nop			;b4da
	rst 38h			;b4db
	call m,0b651h		;b4dc
	jp m,000feh		;b4df
	nop			;b4e2
	nop			;b4e3
	nop			;b4e4
	ld e,b			;b4e5
	ld bc,lb6afh		;b4e6
	ld (hl),h		;b4e9
	nop			;b4ea
	nop			;b4eb
	nop			;b4ec
	inc c			;b4ed
	ld (bc),a		;b4ee
	ld a,e			;b4ef
	scf			;b4f0
	ld l,c			;b4f1
	ret c			;b4f2
	nop			;b4f3
	nop			;b4f4
	nop			;b4f5
	nop			;b4f6
	nop			;b4f7
	nop			;b4f8
	nop			;b4f9
	nop			;b4fa
	nop			;b4fb
	ld a,a			;b4fc
	or 0ffh			;b4fd
	rst 38h			;b4ff
	rst 38h			;b500
	rst 38h			;b501
	rst 38h			;b502
	cp (hl)			;b503
	and b			;b504
	ld d,a			;b505
	cp 0bfh			;b506
	or c			;b508
	or b			;b509
	ld a,a			;b50a
	rst 38h			;b50b
	rst 38h			;b50c
	call m,0ff00h		;b50d
	ei			;b510
	push af			;b511
	ccf			;b512
	call pe,07f80h		;b513
	ret p			;b516
	nop			;b517
	inc bc			;b518
	rst 38h			;b519
	jp c,08955h		;b51a
	ld a,e			;b51d
	rst 18h			;b51e
	nop			;b51f
	nop			;b520
	nop			;b521
	nop			;b522
	ccf			;b523
	rst 38h			;b524
	ret nc			;b525
	ex de,hl		;b526
	rst 28h			;b527
	ld a,d			;b528
	ld bc,lc0c1h		;b529
	nop			;b52c
	ld (hl),006h		;b52d
	dec hl			;b52f
	ei			;b530
	xor (hl)		;b531
	nop			;b532
	nop			;b533
	nop			;b534
	nop			;b535
	nop			;b536
	ex de,hl		;b537
	sub d			;b538
	xor (hl)		;b539
	and b			;b53a
	nop			;b53b
	nop			;b53c
	nop			;b53d
	nop			;b53e
	nop			;b53f
	nop			;b540
	nop			;b541
	nop			;b542
	nop			;b543
	cp a			;b544
	ld sp,hl		;b545
	ccf			;b546
	rst 38h			;b547
	rst 38h			;b548
	rst 38h			;b549
	rst 38h			;b54a
	ld e,c			;b54b
	ld h,b			;b54c
	dec hl			;b54d
	rst 38h			;b54e
	ld e,a			;b54f
	in a,(0dfh)		;b550
	rra			;b552
	rst 38h			;b553
	rst 38h			;b554
	call m,07f00h		;b555
	jp m,0beb6h		;b558
	jp m,07ff0h		;b55b
	ret p			;b55e
	nop			;b55f
	ld bc,leeffh		;b560
	xor h			;b563
	rst 20h			;b564
	in a,(0b6h)		;b565
	nop			;b567
	nop			;b568
	nop			;b569
	jr lb573h		;b56a
	rst 38h			;b56c
	ret p			;b56d
	ld a,a			;b56e
	xor a			;b56f
	ld l,h			;b570
	rrca			;b571
	ld a,b			;b572
lb573h:
	ld a,h			;b573
	nop			;b574
	dec c			;b575
	ret nz			;b576
	rra			;b577
	sbc a,(hl)		;b578
	rst 38h			;b579
	nop			;b57a
	nop			;b57b
	nop			;b57c
	nop			;b57d
	nop			;b57e
	dec sp			;b57f
	cp c			;b580
	adc a,080h		;b581
	nop			;b583
	nop			;b584
	nop			;b585
	nop			;b586
	nop			;b587
	nop			;b588
	nop			;b589
	nop			;b58a
	nop			;b58b
	cp a			;b58c
	call p,sub_ffc7h	;b58d
	rst 38h			;b590
	rst 38h			;b591
	rst 38h			;b592
	ld h,(hl)		;b593
	and b			;b594
	ld (hl),l		;b595
	rst 38h			;b596
	xor e			;b597
	ld d,b			;b598
	and 08fh		;b599
	rst 38h			;b59b
	rst 38h			;b59c
	call m,07f00h		;b59d
	dec iy			;b5a0
	inc e			;b5a2
	defb 0fdh,076h,03fh ;illegal sequence	;b5a3
	jp po,00000h		;b5a6
	rst 38h			;b5a9
	call p,0edd4h		;b5aa
	add hl,sp		;b5ad
	cp c			;b5ae
	ld bc,00202h		;b5af
	ld h,a			;b5b2
	nop			;b5b3
	ld a,a			;b5b4
	ret po			;b5b5
	dec a			;b5b6
	rst 10h			;b5b7
	xor a			;b5b8
	inc a			;b5b9
	inc e			;b5ba
	rra			;b5bb
	add a,b			;b5bc
	ld bc,025f0h		;b5bd
	ld a,d			;b5c0
	jp c,00000h		;b5c1
	nop			;b5c4
	nop			;b5c5
	nop			;b5c6
	nop			;b5c7
	ld a,a			;b5c8
	ld h,e			;b5c9
	add a,b			;b5ca
	nop			;b5cb
	nop			;b5cc
	nop			;b5cd
	nop			;b5ce
	nop			;b5cf
	nop			;b5d0
	nop			;b5d1
	nop			;b5d2
	nop			;b5d3
	cp a			;b5d4
	ei			;b5d5
	ld a,c			;b5d6
	rst 38h			;b5d7
	rst 38h			;b5d8
	rst 38h			;b5d9
	rst 38h			;b5da
	ld a,a			;b5db
	ret nc			;b5dc
	ld c,l			;b5dd
	rst 38h			;b5de
	out (099h),a		;b5df
	ld a,a			;b5e1
	ex (sp),hl		;b5e2
	rst 38h			;b5e3
	rst 38h			;b5e4
	call m,03f00h		;b5e5
	defb 0fdh,03bh,09fh ;illegal sequence	;b5e8
	ld a,a			;b5eb
	ld l,d			;b5ec
	ccf			;b5ed
	inc bc			;b5ee
	nop			;b5ef
	nop			;b5f0
	ld a,a			;b5f1
	jp m,07feah		;b5f2
	rst 18h			;b5f5
	rst 38h			;b5f6
	dec b			;b5f7
	nop			;b5f8
	nop			;b5f9
	add a,e			;b5fa
	ret nz			;b5fb
	inc bc			;b5fc
	ret nz			;b5fd
	daa			;b5fe
	push hl			;b5ff
	exx			;b600
	nop			;b601
	rlca			;b602
	rrca			;b603
	ret nz			;b604
	nop			;b605
	ld (hl),c		;b606
	ei			;b607
	cp (hl)			;b608
	jp pe,00000h		;b609
	nop			;b60c
	nop			;b60d
	nop			;b60e
	nop			;b60f
	inc bc			;b610
	ret nz			;b611
	nop			;b612
	nop			;b613
	nop			;b614
	nop			;b615
	nop			;b616
	nop			;b617
	nop			;b618
	nop			;b619
	nop			;b61a
	nop			;b61b
	rst 38h			;b61c
	cp a			;b61d
	rst 38h			;b61e
	rst 38h			;b61f
	rst 38h			;b620
	rst 38h			;b621
	rst 38h			;b622
	add hl,sp		;b623
	ld b,b			;b624
	ld e,a			;b625
	call m,000feh		;b626
	rst 38h			;b629
	rst 38h			;b62a
	rst 38h			;b62b
	ld a,a			;b62c
	cp b			;b62d
	add a,e			;b62e
	rst 38h			;b62f
	and e			;b630
	call c,sub_f0bch	;b631
	rst 38h			;b634
	rst 38h			;b635
	ret m			;b636
	nop			;b637
	rra			;b638
	cp 05dh			;b639
	ld c,d			;b63b
	ld a,e			;b63c
	ret m			;b63d
	inc a			;b63e
	nop			;b63f
	nop			;b640
	nop			;b641
	rra			;b642
	rst 38h			;b643
	dec e			;b644
	ld hl,led4ah		;b645
	adc a,e			;b648
	nop			;b649
	nop			;b64a
	add a,b			;b64b
	nop			;b64c
	nop			;b64d
	ld (bc),a		;b64e
	defb 0fdh,03bh,0a5h ;illegal sequence	;b64f
	nop			;b652
	nop			;b653
	ld bc,lfbc3h		;b654
	in a,(0f7h)		;b657
	ld a,c			;b659
	ld (hl),h		;b65a
	nop			;b65b
	nop			;b65c
	nop			;b65d
	nop			;b65e
	nop			;b65f
	nop			;b660
	nop			;b661
	nop			;b662
	nop			;b663
	rst 38h			;b664
	rst 18h			;b665
	rst 38h			;b666
	rst 38h			;b667
	rst 38h			;b668
	rst 38h			;b669
	rst 38h			;b66a
	and (hl)		;b66b
	ret nz			;b66c
	xor a			;b66d
	call m,leeffh		;b66e
	rra			;b671
	rst 38h			;b672
	rst 38h			;b673
	cp (hl)			;b674
	ld a,b			;b675
	add a,c			;b676
	rst 38h			;b677
	rst 0			;b678
	jp pe,lbe7ch+1		;b679
	rra			;b67c
	rst 38h			;b67d
	ret m			;b67e
	nop			;b67f
	rra			;b680
	cp 06dh			;b681
	and c			;b683
	ld e,a			;b684
	ld (hl),h		;b685
	jr nc,lb6a0h		;b686
	nop			;b688
	nop			;b689
	rlca			;b68a
	rst 38h			;b68b
	add a,0a1h		;b68c
	rst 10h			;b68e
	rst 30h			;b68f
	sbc a,000h		;b690
	nop			;b692
	nop			;b693
	rlca			;b694
	nop			;b695
	inc bc			;b696
	dec de			;b697
	sbc a,(hl)		;b698
	cp d			;b699
	nop			;b69a
	nop			;b69b
	nop			;b69c
	pop hl			;b69d
	rst 38h			;b69e
	rst 38h			;b69f
lb6a0h:
	adc a,l			;b6a0
	rst 38h			;b6a1
	call c,00000h		;b6a2
	nop			;b6a5
	nop			;b6a6
	nop			;b6a7
	nop			;b6a8
	nop			;b6a9
	nop			;b6aa
	nop			;b6ab
	rst 38h			;b6ac
	rst 20h			;b6ad
	rst 38h			;b6ae
lb6afh:
	rst 38h			;b6af
	rst 38h			;b6b0
	rst 38h			;b6b1
	rst 38h			;b6b2
	rst 18h			;b6b3
	and b			;b6b4
	ld l,a			;b6b5
	defb 0fdh,07fh,0a7h ;illegal sequence	;b6b6
	rst 8			;b6b9
	rst 38h			;b6ba
	rst 38h			;b6bb
	pop bc			;b6bc
	call m,sub_ff81h	;b6bd
	ex de,hl		;b6c0
	defb 0edh ;next byte illegal after ed	;b6c1
	ld a,a			;b6c2
	dec a			;b6c3
	add a,e			;b6c4
	rst 38h			;b6c5
	ret m			;b6c6
	nop			;b6c7
	rrca			;b6c8
	rst 38h			;b6c9
	ld d,l			;b6ca
	ld e,b			;b6cb
	dec hl			;b6cc
	xor 000h		;b6cd
	inc c			;b6cf
	nop			;b6d0
	nop			;b6d1
	inc bc			;b6d2
	rst 38h			;b6d3
	di			;b6d4
	sub c			;b6d5
	jp (hl)			;b6d6
	sbc a,e			;b6d7
	ld l,h			;b6d8
	nop			;b6d9
	nop			;b6da
	nop			;b6db
	ld bc,000c0h		;b6dc
	defb 0edh ;next byte illegal after ed	;b6df
	ld sp,hl		;b6e0
	jp m,00000h		;b6e1
	nop			;b6e4
	jr $+1			;b6e5
	rst 38h			;b6e7
	ld a,d			;b6e8
	rst 30h			;b6e9
	call pe,00000h		;b6ea
	nop			;b6ed
lb6eeh:
	nop			;b6ee
	nop			;b6ef
	nop			;b6f0
	nop			;b6f1
	nop			;b6f2
	nop			;b6f3
	rst 38h			;b6f4
	ld sp,hl		;b6f5
	rst 38h			;b6f6
	rst 38h			;b6f7
	rst 38h			;b6f8
	rst 38h			;b6f9
	rst 38h			;b6fa
	cp a			;b6fb
	ld h,b			;b6fc
	cpl			;b6fd
	cp 0bfh			;b6fe
	and e			;b700
	rst 20h			;b701
	rst 38h			;b702
	rst 38h			;b703
	rst 38h			;b704
	call m,0ff00h		;b705
	rst 30h			;b708
	xor 03fh		;b709
	ret p			;b70b
	nop			;b70c
	rst 38h			;b70d
	ret p			;b70e
	nop			;b70f
	rrca			;b710
	rst 38h			;b711
	or l			;b712
	ld l,l			;b713
	dec e			;b714
	defb 0fdh,000h,000h ;illegal sequence	;b715
	nop			;b718
	nop			;b719
	nop			;b71a
	rst 38h			;b71b
	call m,sub_ff51h	;b71c
	sub (hl)		;b71f
	call nc,00000h		;b720
	ld bc,lfc00h		;b723
	nop			;b726
	dec l			;b727
	rst 10h			;b728
	defb 0fdh,000h,000h ;illegal sequence	;b729
	nop			;b72c
	nop			;b72d
	ccf			;b72e
	ei			;b72f
	rst 8			;b730
	defb 0ddh,038h,000h ;illegal sequence	;b731
	nop			;b734
	nop			;b735
	nop			;b736
	nop			;b737
	nop			;b738
	nop			;b739
	nop			;b73a
	nop			;b73b
	ld a,a			;b73c
	or 0ffh			;b73d
	rst 38h			;b73f
	rst 38h			;b740
	rst 38h			;b741
	rst 38h			;b742
	cp (hl)			;b743
	and b			;b744
	ld d,a			;b745
	cp 0bfh			;b746
	or c			;b748
	jr nc,lb7cah		;b749
	rst 38h			;b74b
	rst 38h			;b74c
	call m,0ff00h		;b74d
	ei			;b750
	push af			;b751
	ccf			;b752
	call pe,07f70h		;b753
	ret p			;b756
	nop			;b757
	inc bc			;b758
	rst 38h			;b759
	jp z,08b56h		;b75a
	ex de,hl		;b75d
	ret c			;b75e
	ld b,000h		;b75f
	nop			;b761
	nop			;b762
	ccf			;b763
	rst 38h			;b764
	ret nc			;b765
	defb 0fdh,0b7h,074h ;illegal sequence	;b766
	nop			;b769
	ld bc,030c0h		;b76a
	jr nc,lb76fh		;b76d
lb76fh:
	cpl			;b76f
	rst 38h			;b770
	pop af			;b771
	nop			;b772
	nop			;b773
	nop			;b774
	nop			;b775
	ld c,00ch		;b776
	rrca			;b778
	and a			;b779
	nop			;b77a
	nop			;b77b
	nop			;b77c
	nop			;b77d
	nop			;b77e
	nop			;b77f
	nop			;b780
	nop			;b781
	nop			;b782
	nop			;b783
	cp a			;b784
	ld sp,hl		;b785
	ccf			;b786
	rst 38h			;b787
	rst 38h			;b788
	rst 38h			;b789
	rst 38h			;b78a
	ld e,c			;b78b
	ld h,b			;b78c
	dec hl			;b78d
	rst 38h			;b78e
	ld e,a			;b78f
	in a,(0bch)		;b790
	rra			;b792
	rst 38h			;b793
	rst 38h			;b794
	call m,07f00h		;b795
	jp m,0beb6h		;b798
	jp m,07fech		;b79b
	ret p			;b79e
	nop			;b79f
	ld bc,leeffh		;b7a0
	xor h			;b7a3
	add a,a			;b7a4
	or 064h			;b7a5
	ld d,000h		;b7a7
	nop			;b7a9
	nop			;b7aa
	rlca			;b7ab
	rst 38h			;b7ac
	ret p			;b7ad
	ld a,a			;b7ae
	cp 09ah			;b7af
	nop			;b7b1
	nop			;b7b2
	jr c,lb7d1h		;b7b3
	nop			;b7b5
	nop			;b7b6
	rla			;b7b7
	in a,(0efh)		;b7b8
	nop			;b7ba
	nop			;b7bb
	nop			;b7bc
	nop			;b7bd
	nop			;b7be
	inc bc			;b7bf
	cp (hl)			;b7c0
	ld l,h			;b7c1
	nop			;b7c2
	nop			;b7c3
	nop			;b7c4
	nop			;b7c5
	nop			;b7c6
	nop			;b7c7
	nop			;b7c8
	nop			;b7c9
lb7cah:
	nop			;b7ca
	nop			;b7cb
	cp a			;b7cc
	call p,sub_ffc7h	;b7cd
	rst 38h			;b7d0
lb7d1h:
	rst 38h			;b7d1
	rst 38h			;b7d2
	ld h,(hl)		;b7d3
	and b			;b7d4
	ld (hl),l		;b7d5
	rst 38h			;b7d6
	xor e			;b7d7
	ret nc			;b7d8
	sbc a,00fh		;b7d9
	rst 38h			;b7db
	rst 38h			;b7dc
	call m,07f00h		;b7dd
	defb 0fdh,03bh,01ch ;illegal sequence	;b7e0
	defb 0fdh,082h,03fh ;illegal sequence	;b7e3
	ret po			;b7e6
	nop			;b7e7
	nop			;b7e8
	rst 38h			;b7e9
	call p,047d5h		;b7ea
	ei			;b7ed
	cp c			;b7ee
	rla			;b7ef
	nop			;b7f0
	nop			;b7f1
	nop			;b7f2
	ld b,b			;b7f3
	ld a,a			;b7f4
	ret po			;b7f5
	ccf			;b7f6
	ld d,l			;b7f7
	ld l,(hl)		;b7f8
	nop			;b7f9
	nop			;b7fa
	rra			;b7fb
	inc bc			;b7fc
	nop			;b7fd
	ret nz			;b7fe
	dec hl			;b7ff
	xor l			;b800
	ld l,d			;b801
	nop			;b802
	nop			;b803
	nop			;b804
	nop			;b805
	nop			;b806
	nop			;b807
	ld a,a			;b808
	ld h,b			;b809
	nop			;b80a
	nop			;b80b
	nop			;b80c
	nop			;b80d
	nop			;b80e
	nop			;b80f
	nop			;b810
	nop			;b811
	nop			;b812
	nop			;b813
	cp a			;b814
	ei			;b815
	ld a,c			;b816
	rst 38h			;b817
	rst 38h			;b818
	rst 38h			;b819
	rst 38h			;b81a
	ld a,a			;b81b
	ret nc			;b81c
	ld c,l			;b81d
	rst 38h			;b81e
	out (0d9h),a		;b81f
	ld l,a			;b821
	jp lffffh		;b822
	call m,03f00h		;b825
	defb 0fdh,03bh,09eh ;illegal sequence	;b828
	ld a,a			;b82b
	ld (hl),b		;b82c
	ccf			;b82d
	nop			;b82e
	nop			;b82f
	nop			;b830
	ld a,a			;b831
	jp m,043ebh		;b832
	xor 0dfh		;b835
	ccf			;b837
	nop			;b838
	nop			;b839
	nop			;b83a
	nop			;b83b
	inc bc			;b83c
	call nz,0793fh		;b83d
	jp c,00000h		;b840
	rlca			;b843
	add a,a			;b844
	or c			;b845
	sub c			;b846
	rst 30h			;b847
	xor a			;b848
	jp c,00000h		;b849
	nop			;b84c
	nop			;b84d
	nop			;b84e
	nop			;b84f
	inc bc			;b850
	ret nz			;b851
	nop			;b852
	nop			;b853
	nop			;b854
	nop			;b855
	nop			;b856
	nop			;b857
	nop			;b858
	nop			;b859
	nop			;b85a
	nop			;b85b
	rst 38h			;b85c
	cp a			;b85d
	rst 38h			;b85e
	rst 38h			;b85f
	rst 38h			;b860
	rst 38h			;b861
	rst 38h			;b862
	add hl,sp		;b863
lb864h:
	ld b,b			;b864
	ld e,a			;b865
	call m,000feh		;b866
	rst 38h			;b869
	rst 38h			;b86a
	rst 38h			;b86b
	ld a,a			;b86c
	cp b			;b86d
	add a,e			;b86e
	rst 38h			;b86f
	and c			;b870
	defb 0ddh,078h,000h ;illegal sequence	;b871
	rst 38h			;b874
	rst 38h			;b875
	ret m			;b876
	nop			;b877
	rra			;b878
lb879h:
	cp 055h			;b879
	ld e,d			;b87b
	nop			;b87c
	nop			;b87d
	inc a			;b87e
	nop			;b87f
	nop			;b880
	nop			;b881
	rra			;b882
	rst 38h			;b883
	dec e			;b884
	jr nz,lb887h		;b885
lb887h:
	nop			;b887
	nop			;b888
	nop			;b889
	nop			;b88a
	nop			;b88b
	nop			;b88c
	nop			;b88d
	nop			;b88e
	nop			;b88f
	nop			;b890
	nop			;b891
	nop			;b892
	nop			;b893
	nop			;b894
	nop			;b895
	nop			;b896
	nop			;b897
	nop			;b898
	nop			;b899
	nop			;b89a
	nop			;b89b
	nop			;b89c
	nop			;b89d
	nop			;b89e
	nop			;b89f
	nop			;b8a0
	nop			;b8a1
	nop			;b8a2
	nop			;b8a3
	rst 38h			;b8a4
	rst 18h			;b8a5
	rst 38h			;b8a6
	rst 38h			;b8a7
	rst 38h			;b8a8
	rst 38h			;b8a9
	rst 38h			;b8aa
	and (hl)		;b8ab
	ret nz			;b8ac
	xor a			;b8ad
	call m,lffffh		;b8ae
	rra			;b8b1
	rst 38h			;b8b2
	rst 38h			;b8b3
	cp (hl)			;b8b4
	ld a,b			;b8b5
	add a,c			;b8b6
	rst 38h			;b8b7
	jp nz,la8eah		;b8b8
	nop			;b8bb
	rra			;b8bc
	rst 38h			;b8bd
	ret m			;b8be
	nop			;b8bf
	rra			;b8c0
	cp 068h			;b8c1
	xor d			;b8c3
	nop			;b8c4
	nop			;b8c5
	jr nc,lb8c8h		;b8c6
lb8c8h:
	nop			;b8c8
	nop			;b8c9
	rlca			;b8ca
	rst 38h			;b8cb
	add a,0a0h		;b8cc
	nop			;b8ce
	nop			;b8cf
	nop			;b8d0
	nop			;b8d1
	nop			;b8d2
	nop			;b8d3
	nop			;b8d4
	nop			;b8d5
	nop			;b8d6
	nop			;b8d7
	nop			;b8d8
	nop			;b8d9
	nop			;b8da
	nop			;b8db
	nop			;b8dc
	nop			;b8dd
	nop			;b8de
	nop			;b8df
	nop			;b8e0
	nop			;b8e1
	nop			;b8e2
	nop			;b8e3
	nop			;b8e4
	nop			;b8e5
	nop			;b8e6
	nop			;b8e7
	nop			;b8e8
	nop			;b8e9
	nop			;b8ea
	nop			;b8eb
	rst 38h			;b8ec
	rst 20h			;b8ed
	rst 38h			;b8ee
	rst 38h			;b8ef
	rst 38h			;b8f0
	rst 38h			;b8f1
	rst 38h			;b8f2
	rst 18h			;b8f3
	and b			;b8f4
	ld l,a			;b8f5
	defb 0fdh,07fh,0b5h ;illegal sequence	;b8f6
	rst 28h			;b8f9
	rst 38h			;b8fa
	rst 38h			;b8fb
	pop bc			;b8fc
	call m,sub_ff81h	;b8fd
	push hl			;b900
	defb 0edh ;next byte illegal after ed	;b901
	jr z,lb904h		;b902
lb904h:
	inc bc			;b904
	rst 38h			;b905
	ret m			;b906
	nop			;b907
	rrca			;b908
	rst 38h			;b909
	ld d,l			;b90a
	ld e,c			;b90b
	nop			;b90c
	nop			;b90d
	nop			;b90e
	nop			;b90f
	nop			;b910
	nop			;b911
	inc bc			;b912
	rst 38h			;b913
	di			;b914
	sub b			;b915
	nop			;b916
	nop			;b917
	nop			;b918
	nop			;b919
	nop			;b91a
	nop			;b91b
	nop			;b91c
	nop			;b91d
	nop			;b91e
	nop			;b91f
	nop			;b920
	nop			;b921
	nop			;b922
	nop			;b923
	nop			;b924
	nop			;b925
	nop			;b926
	nop			;b927
	nop			;b928
	nop			;b929
	nop			;b92a
	nop			;b92b
	nop			;b92c
	nop			;b92d
	nop			;b92e
	nop			;b92f
	nop			;b930
	nop			;b931
	nop			;b932
	nop			;b933
	rst 38h			;b934
	ld sp,hl		;b935
	rst 38h			;b936
	rst 38h			;b937
	rst 38h			;b938
	rst 38h			;b939
	rst 38h			;b93a
	cp a			;b93b
	ld h,b			;b93c
	cpl			;b93d
	cp 0bfh			;b93e
	xor e			;b940
	or a			;b941
	rst 38h			;b942
	rst 38h			;b943
	rst 38h			;b944
	call m,0ff00h		;b945
	jp p,la8eeh		;b948
	nop			;b94b
	nop			;b94c
	rst 38h			;b94d
	ret p			;b94e
	nop			;b94f
	rrca			;b950
	rst 38h			;b951
	or h			;b952
	ld l,l			;b953
	nop			;b954
	nop			;b955
	nop			;b956
	nop			;b957
	nop			;b958
	nop			;b959
	nop			;b95a
	rst 38h			;b95b
	call m,00050h		;b95c
	nop			;b95f
	nop			;b960
	nop			;b961
	nop			;b962
	nop			;b963
	nop			;b964
	nop			;b965
	nop			;b966
	nop			;b967
	nop			;b968
	nop			;b969
	nop			;b96a
	nop			;b96b
	nop			;b96c
	nop			;b96d
	nop			;b96e
	nop			;b96f
	nop			;b970
	nop			;b971
	nop			;b972
	nop			;b973
	nop			;b974
	nop			;b975
	nop			;b976
	nop			;b977
	nop			;b978
	nop			;b979
	nop			;b97a
	nop			;b97b
	ld a,a			;b97c
	or 0ffh			;b97d
	rst 38h			;b97f
	rst 38h			;b980
	rst 38h			;b981
	rst 38h			;b982
	cp (hl)			;b983
	and b			;b984
	ld d,a			;b985
	cp 0bfh			;b986
	cp l			;b988
	ret nc			;b989
	ld a,a			;b98a
	rst 38h			;b98b
	rst 38h			;b98c
	call m,0ff00h		;b98d
	ld sp,hl		;b990
	push af			;b991
	ld e,h			;b992
lb993h:
	nop			;b993
	nop			;b994
	ld a,a			;b995
	ret p			;b996
	nop			;b997
	inc bc			;b998
	rst 38h			;b999
	ld a,(de)		;b99a
	ld d,(hl)		;b99b
	add a,b			;b99c
	nop			;b99d
	nop			;b99e
	nop			;b99f
	nop			;b9a0
	nop			;b9a1
	nop			;b9a2
	ccf			;b9a3
	rst 38h			;b9a4
	ret nc			;b9a5
	nop			;b9a6
	nop			;b9a7
	nop			;b9a8
	nop			;b9a9
	nop			;b9aa
	nop			;b9ab
	nop			;b9ac
	nop			;b9ad
	nop			;b9ae
	nop			;b9af
	nop			;b9b0
	nop			;b9b1
	nop			;b9b2
	nop			;b9b3
	nop			;b9b4
	nop			;b9b5
	nop			;b9b6
	nop			;b9b7
	nop			;b9b8
	nop			;b9b9
	nop			;b9ba
	nop			;b9bb
	nop			;b9bc
	nop			;b9bd
	nop			;b9be
	nop			;b9bf
	nop			;b9c0
	nop			;b9c1
	nop			;b9c2
	nop			;b9c3
	cp a			;b9c4
	ld sp,hl		;b9c5
	ccf			;b9c6
	rst 38h			;b9c7
	rst 38h			;b9c8
	rst 38h			;b9c9
	rst 38h			;b9ca
	ld e,c			;b9cb
	ld h,b			;b9cc
	dec hl			;b9cd
	rst 38h			;b9ce
	ld e,a			;b9cf
	jp c,01ff0h		;b9d0
	rst 38h			;b9d3
	rst 38h			;b9d4
	call m,07f00h		;b9d5
	jp m,la2b6h		;b9d8
	nop			;b9db
	nop			;b9dc
	ld a,a			;b9dd
	ret p			;b9de
	nop			;b9df
	ld bc,laeffh		;b9e0
	xor h			;b9e3
	add a,b			;b9e4
	nop			;b9e5
	nop			;b9e6
	nop			;b9e7
	nop			;b9e8
	nop			;b9e9
	nop			;b9ea
	rlca			;b9eb
	rst 38h			;b9ec
	ret p			;b9ed
	nop			;b9ee
	nop			;b9ef
	nop			;b9f0
	nop			;b9f1
	nop			;b9f2
	nop			;b9f3
	nop			;b9f4
	nop			;b9f5
	nop			;b9f6
	nop			;b9f7
	nop			;b9f8
	nop			;b9f9
	nop			;b9fa
	nop			;b9fb
	nop			;b9fc
	nop			;b9fd
	nop			;b9fe
	nop			;b9ff
	nop			;ba00
	nop			;ba01
	nop			;ba02
	nop			;ba03
	nop			;ba04
	nop			;ba05
	nop			;ba06
	nop			;ba07
	nop			;ba08
	nop			;ba09
	nop			;ba0a
	nop			;ba0b
	cp a			;ba0c
	call p,sub_ffc7h	;ba0d
	rst 38h			;ba10
	rst 38h			;ba11
	rst 38h			;ba12
	ld h,(hl)		;ba13
	and b			;ba14
	ld (hl),l		;ba15
	rst 38h			;ba16
	xor e			;ba17
	push de			;ba18
	ld c,b			;ba19
	rrca			;ba1a
	rst 38h			;ba1b
	rst 38h			;ba1c
	call m,07f00h		;ba1d
	defb 0fdh,03bh,064h ;illegal sequence	;ba20
	nop			;ba23
	nop			;ba24
	ccf			;ba25
	ret po			;ba26
	nop			;ba27
	nop			;ba28
	rst 38h			;ba29
	ld d,h			;ba2a
	push de			;ba2b
	ld b,b			;ba2c
	nop			;ba2d
	nop			;ba2e
	nop			;ba2f
	nop			;ba30
	nop			;ba31
	nop			;ba32
	nop			;ba33
	ld a,a			;ba34
	ret po			;ba35
	nop			;ba36
	nop			;ba37
	nop			;ba38
	nop			;ba39
	nop			;ba3a
	nop			;ba3b
	nop			;ba3c
	nop			;ba3d
	nop			;ba3e
	nop			;ba3f
	nop			;ba40
	nop			;ba41
	nop			;ba42
	nop			;ba43
	nop			;ba44
	nop			;ba45
	nop			;ba46
	nop			;ba47
	nop			;ba48
	nop			;ba49
	nop			;ba4a
	nop			;ba4b
	nop			;ba4c
	nop			;ba4d
	nop			;ba4e
	nop			;ba4f
	nop			;ba50
	nop			;ba51
	nop			;ba52
	nop			;ba53
	cp a			;ba54
	ei			;ba55
	ld a,c			;ba56
	rst 38h			;ba57
	rst 38h			;ba58
	rst 38h			;ba59
	rst 38h			;ba5a
	ld a,a			;ba5b
	ret nc			;ba5c
	ld c,l			;ba5d
	rst 38h			;ba5e
	out (0dah),a		;ba5f
	ret c			;ba61
	inc bc			;ba62
	rst 38h			;ba63
	rst 38h			;ba64
	call m,03f00h		;ba65
	defb 0fdh,03bh,0bah ;illegal sequence	;ba68
	nop			;ba6b
	nop			;ba6c
	ccf			;ba6d
	nop			;ba6e
	nop			;ba6f
	nop			;ba70
	ld a,a			;ba71
	jp pe,040ebh		;ba72
	nop			;ba75
	nop			;ba76
	nop			;ba77
	nop			;ba78
	nop			;ba79
	nop			;ba7a
	nop			;ba7b
	inc bc			;ba7c
	ret nz			;ba7d
	nop			;ba7e
	nop			;ba7f
	nop			;ba80
	nop			;ba81
	nop			;ba82
	nop			;ba83
	nop			;ba84
	nop			;ba85
	nop			;ba86
	nop			;ba87
	nop			;ba88
	nop			;ba89
	nop			;ba8a
	nop			;ba8b
	nop			;ba8c
	nop			;ba8d
	nop			;ba8e
	nop			;ba8f
	nop			;ba90
	nop			;ba91
	nop			;ba92
	nop			;ba93
	nop			;ba94
	nop			;ba95
	nop			;ba96
	nop			;ba97
	nop			;ba98
	nop			;ba99
	nop			;ba9a
	nop			;ba9b
lba9ch:
	nop			;ba9c
	nop			;ba9d
	nop			;ba9e
	nop			;ba9f
	nop			;baa0
	nop			;baa1
	nop			;baa2
	nop			;baa3
	nop			;baa4
	nop			;baa5
	nop			;baa6
	nop			;baa7
	nop			;baa8
	nop			;baa9
	nop			;baaa
	nop			;baab
	nop			;baac
	nop			;baad
	nop			;baae
	nop			;baaf
	nop			;bab0
	nop			;bab1
	nop			;bab2
	nop			;bab3
	nop			;bab4
	nop			;bab5
	nop			;bab6
	nop			;bab7
	nop			;bab8
	nop			;bab9
	nop			;baba
	nop			;babb
	nop			;babc
	nop			;babd
	nop			;babe
	nop			;babf
	nop			;bac0
	nop			;bac1
	nop			;bac2
	nop			;bac3
	nop			;bac4
	ld bc,00040h		;bac5
	nop			;bac8
	dec b			;bac9
	ld b,b			;baca
	nop			;bacb
	nop			;bacc
	ld b,0c0h		;bacd
	nop			;bacf
	jr nz,lbad7h		;bad0
	ld h,b			;bad2
	nop			;bad3
	jr nz,lbaddh		;bad4
	ret p			;bad6
lbad7h:
	nop			;bad7
	djnz lbaddh		;bad8
	xor b			;bada
	nop			;badb
	rla			;badc
lbaddh:
	add a,c			;badd
	call m,00f00h		;bade
	pop af			;bae1
	call m,01f00h		;bae2
	ld sp,hl		;bae5
	call po,01a00h		;bae6
	ld a,l			;bae9
	call m,01400h		;baea
	ccf			;baed
	ret m			;baee
	nop			;baef
	inc b			;baf0
	ld e,0e0h		;baf1
	nop			;baf3
	ld (bc),a		;baf4
	rrca			;baf5
	and b			;baf6
	nop			;baf7
	ld (bc),a		;baf8
	rlca			;baf9
	and b			;bafa
	nop			;bafb
	ld bc,0b00fh		;bafc
lbaffh:
	ret po			;baff
	ld bc,0780eh		;bb00
	ld h,b			;bb03
	nop			;bb04
	adc a,a			;bb05
	cp h			;bb06
	ret po			;bb07
	nop			;bb08
	adc a,(hl)		;bb09
	rst 18h			;bb0a
	ret nz			;bb0b
lbb0ch:
	nop			;bb0c
	ld d,a			;bb0d
	sbc a,a			;bb0e
	add a,b			;bb0f
	nop			;bb10
	ld c,d			;bb11
	adc a,a			;bb12
	nop			;bb13
	nop			;bb14
	dec d			;bb15
	ld b,b			;bb16
	nop			;bb17
	nop			;bb18
	rrca			;bb19
	add a,b			;bb1a
	nop			;bb1b
	nop			;bb1c
	ld e,0c0h		;bb1d
	nop			;bb1f
	nop			;bb20
	ld c,0e0h		;bb21
	nop			;bb23
	nop			;bb24
	inc e			;bb25
	ret p			;bb26
	nop			;bb27
	ld bc,lf0ddh		;bb28
	nop			;bb2b
	inc bc			;bb2c
	cp e			;bb2d
	ret po			;bb2e
	nop			;bb2f
	inc bc			;bb30
	ld a,e			;bb31
	ret nz			;bb32
	nop			;bb33
	nop			;bb34
	ld (hl),b		;bb35
	nop			;bb36
	nop			;bb37
	ld bc,00088h		;bb38
	nop			;bb3b
	inc bc			;bb3c
	ret c			;bb3d
	nop			;bb3e
	nop			;bb3f
	inc bc			;bb40
	ret z			;bb41
	nop			;bb42
	nop			;bb43
	inc bc			;bb44
	ret nz			;bb45
	nop			;bb46
	nop			;bb47
	inc bc			;bb48
	ret po			;bb49
	nop			;bb4a
	nop			;bb4b
	ld bc,000f0h		;bb4c
	nop			;bb4f
	ld bc,000f0h		;bb50
	nop			;bb53
	nop			;bb54
	ret p			;bb55
	nop			;bb56
	nop			;bb57
	nop			;bb58
	nop			;bb59
	nop			;bb5a
	nop			;bb5b
	nop			;bb5c
	nop			;bb5d
	nop			;bb5e
	nop			;bb5f
	nop			;bb60
sub_bb61h:
	nop			;bb61
	nop			;bb62
	nop			;bb63
	nop			;bb64
	nop			;bb65
	nop			;bb66
	nop			;bb67
	nop			;bb68
	nop			;bb69
	nop			;bb6a
	nop			;bb6b
	nop			;bb6c
	nop			;bb6d
	nop			;bb6e
	nop			;bb6f
	nop			;bb70
	nop			;bb71
	nop			;bb72
	nop			;bb73
	nop			;bb74
	nop			;bb75
	nop			;bb76
	nop			;bb77
	nop			;bb78
	nop			;bb79
	nop			;bb7a
	nop			;bb7b
	nop			;bb7c
	nop			;bb7d
	nop			;bb7e
	nop			;bb7f
	nop			;bb80
	nop			;bb81
	nop			;bb82
	nop			;bb83
	nop			;bb84
	nop			;bb85
	nop			;bb86
	nop			;bb87
	nop			;bb88
	nop			;bb89
	nop			;bb8a
	nop			;bb8b
	nop			;bb8c
	nop			;bb8d
	nop			;bb8e
	nop			;bb8f
	nop			;bb90
	nop			;bb91
	nop			;bb92
	nop			;bb93
	nop			;bb94
	nop			;bb95
	nop			;bb96
	nop			;bb97
	nop			;bb98
	nop			;bb99
	nop			;bb9a
	nop			;bb9b
	nop			;bb9c
	nop			;bb9d
	nop			;bb9e
	nop			;bb9f
	nop			;bba0
	nop			;bba1
	nop			;bba2
	nop			;bba3
	nop			;bba4
	ld bc,00040h		;bba5
	nop			;bba8
	dec b			;bba9
	ld b,b			;bbaa
	nop			;bbab
	nop			;bbac
	ld b,0c0h		;bbad
	nop			;bbaf
	nop			;bbb0
	dec b			;bbb1
	ld h,b			;bbb2
	nop			;bbb3
	nop			;bbb4
	rlca			;bbb5
	ret p			;bbb6
	nop			;bbb7
	nop			;bbb8
	inc bc			;bbb9
	xor b			;bbba
	nop			;bbbb
	nop			;bbbc
	ld bc,000fch		;bbbd
	nop			;bbc0
	ld bc,000fch		;bbc1
	nop			;bbc4
	ld bc,000e4h		;bbc5
	nop			;bbc8
	ld bc,000fch		;bbc9
	nop			;bbcc
	rrca			;bbcd
	ret m			;bbce
	nop			;bbcf
	nop			;bbd0
	rra			;bbd1
	ret po			;bbd2
	nop			;bbd3
	nop			;bbd4
	ccf			;bbd5
	ret p			;bbd6
	nop			;bbd7
	nop			;bbd8
	ccf			;bbd9
	ret p			;bbda
	nop			;bbdb
	nop			;bbdc
	add hl,sp		;bbdd
	ret p			;bbde
	inc e			;bbdf
	nop			;bbe0
	ld a,c			;bbe1
	ret p			;bbe2
	ret po			;bbe3
	nop			;bbe4
	ld a,c			;bbe5
	add a,a			;bbe6
	nop			;bbe7
	nop			;bbe8
	ld a,h			;bbe9
	jr c,lbbech		;bbea
lbbech:
	nop			;bbec
	dec a			;bbed
	ret nz			;bbee
	nop			;bbef
	nop			;bbf0
	ld a,00ch		;bbf1
	nop			;bbf3
	nop			;bbf4
	sbc a,0eeh		;bbf5
	nop			;bbf7
	nop			;bbf8
	nop			;bbf9
	add a,000h		;bbfa
	nop			;bbfc
	dec b			;bbfd
	ld b,b			;bbfe
	nop			;bbff
	nop			;bc00
	ld (bc),a		;bc01
	and b			;bc02
	nop			;bc03
	nop			;bc04
	ld bc,000f0h		;bc05
	nop			;bc08
	ld (bc),a		;bc09
	ret m			;bc0a
	nop			;bc0b
	nop			;bc0c
	inc bc			;bc0d
	jr c,lbc10h		;bc0e
lbc10h:
	nop			;bc10
	inc bc			;bc11
	cp h			;bc12
	nop			;bc13
	nop			;bc14
	inc bc			;bc15
	sbc a,h			;bc16
	nop			;bc17
	nop			;bc18
	rlca			;bc19
	inc e			;bc1a
	nop			;bc1b
	nop			;bc1c
	ld a,(bc)		;bc1d
	inc e			;bc1e
	nop			;bc1f
	nop			;bc20
	dec e			;bc21
	inc h			;bc22
	nop			;bc23
	nop			;bc24
	rra			;bc25
	jr lbc28h		;bc26
lbc28h:
	nop			;bc28
	rra			;bc29
	cp h			;bc2a
	nop			;bc2b
	nop			;bc2c
	rrca			;bc2d
	cp (hl)			;bc2e
	nop			;bc2f
	nop			;bc30
	rlca			;bc31
	cp a			;bc32
	nop			;bc33
	nop			;bc34
	nop			;bc35
	ccf			;bc36
	nop			;bc37
	nop			;bc38
	nop			;bc39
	rra			;bc3a
	nop			;bc3b
	nop			;bc3c
	nop			;bc3d
	nop			;bc3e
	nop			;bc3f
	nop			;bc40
	nop			;bc41
	nop			;bc42
	nop			;bc43
	nop			;bc44
	nop			;bc45
	nop			;bc46
	nop			;bc47
	nop			;bc48
	nop			;bc49
	nop			;bc4a
	nop			;bc4b
	nop			;bc4c
	nop			;bc4d
	nop			;bc4e
	nop			;bc4f
	nop			;bc50
	nop			;bc51
	nop			;bc52
	nop			;bc53
	nop			;bc54
	nop			;bc55
	nop			;bc56
	nop			;bc57
	nop			;bc58
	nop			;bc59
	nop			;bc5a
	nop			;bc5b
	nop			;bc5c
	nop			;bc5d
	nop			;bc5e
	nop			;bc5f
	nop			;bc60
	nop			;bc61
	nop			;bc62
	nop			;bc63
	nop			;bc64
	nop			;bc65
	nop			;bc66
	nop			;bc67
	nop			;bc68
	nop			;bc69
	nop			;bc6a
	nop			;bc6b
	nop			;bc6c
	nop			;bc6d
	nop			;bc6e
	nop			;bc6f
	nop			;bc70
	nop			;bc71
	nop			;bc72
	nop			;bc73
	nop			;bc74
	nop			;bc75
	nop			;bc76
	nop			;bc77
	nop			;bc78
	nop			;bc79
	nop			;bc7a
	nop			;bc7b
	nop			;bc7c
	nop			;bc7d
	nop			;bc7e
	nop			;bc7f
	nop			;bc80
	nop			;bc81
	and b			;bc82
	nop			;bc83
	nop			;bc84
	ld (bc),a		;bc85
	and b			;bc86
	nop			;bc87
	nop			;bc88
	inc bc			;bc89
	ld h,b			;bc8a
	nop			;bc8b
	nop			;bc8c
	ld (bc),a		;bc8d
	or b			;bc8e
	nop			;bc8f
	nop			;bc90
	inc bc			;bc91
	ret m			;bc92
	nop			;bc93
	nop			;bc94
	ld bc,000d4h		;bc95
	nop			;bc98
	nop			;bc99
	cp 000h			;bc9a
	nop			;bc9c
	nop			;bc9d
	cp 000h			;bc9e
	nop			;bca0
	nop			;bca1
	jp p,00020h		;bca2
	nop			;bca5
	cp 020h			;bca6
	nop			;bca8
	rlca			;bca9
	call m,00040h		;bcaa
	rrca			;bcad
	ld (hl),b		;bcae
	ld b,b			;bcaf
	nop			;bcb0
	rra			;bcb1
	ret nc			;bcb2
	add a,b			;bcb3
	nop			;bcb4
	rra			;bcb5
	ret c			;bcb6
	add a,b			;bcb7
	nop			;bcb8
	inc a			;bcb9
	defb 0ddh,000h,000h ;illegal sequence	;bcba
	dec sp			;bcbd
	dec a			;bcbe
	nop			;bcbf
	nop			;bcc0
	dec sp			;bcc1
	jp z,00000h		;bcc2
	inc e			;bcc5
	ld (hl),d		;bcc6
	nop			;bcc7
	nop			;bcc8
	rrca			;bcc9
	add a,h			;bcca
	nop			;bccb
	nop			;bccc
	rlca			;bccd
	call po,00000h		;bcce
	ld a,(bc)		;bcd1
	cp b			;bcd2
	nop			;bcd3
	nop			;bcd4
	dec b			;bcd5
	ld e,b			;bcd6
	nop			;bcd7
	nop			;bcd8
	dec bc			;bcd9
	ret nz			;bcda
	nop			;bcdb
	nop			;bcdc
	rlca			;bcdd
	and b			;bcde
	nop			;bcdf
	nop			;bce0
	rlca			;bce1
	ret nc			;bce2
	nop			;bce3
	nop			;bce4
	inc bc			;bce5
	ret po			;bce6
	nop			;bce7
	nop			;bce8
	inc bc			;bce9
	ret po			;bcea
	nop			;bceb
	nop			;bcec
	dec b			;bced
	ret p			;bcee
	nop			;bcef
	nop			;bcf0
	ld c,0f0h		;bcf1
	nop			;bcf3
	nop			;bcf4
	rra			;bcf5
	ld (hl),b		;bcf6
	nop			;bcf7
	nop			;bcf8
	inc e			;bcf9
	ret po			;bcfa
	nop			;bcfb
	nop			;bcfc
	dec a			;bcfd
	ret nz			;bcfe
	nop			;bcff
	nop			;bd00
	ld a,(00080h)		;bd01
	nop			;bd04
	dec sp			;bd05
	nop			;bd06
	nop			;bd07
	nop			;bd08
	rlca			;bd09
	add a,b			;bd0a
	nop			;bd0b
	nop			;bd0c
	rrca			;bd0d
	ret nz			;bd0e
	nop			;bd0f
	nop			;bd10
	rrca			;bd11
	ret po			;bd12
	nop			;bd13
	nop			;bd14
	rlca			;bd15
	ret po			;bd16
	nop			;bd17
	nop			;bd18
	inc bc			;bd19
	ret nz			;bd1a
	nop			;bd1b
	nop			;bd1c
	nop			;bd1d
	nop			;bd1e
	nop			;bd1f
	nop			;bd20
	nop			;bd21
	nop			;bd22
	nop			;bd23
	nop			;bd24
	nop			;bd25
	nop			;bd26
	nop			;bd27
	nop			;bd28
	nop			;bd29
	nop			;bd2a
	nop			;bd2b
	nop			;bd2c
	nop			;bd2d
	nop			;bd2e
	nop			;bd2f
	nop			;bd30
	nop			;bd31
	nop			;bd32
	nop			;bd33
	nop			;bd34
	nop			;bd35
	nop			;bd36
	nop			;bd37
	nop			;bd38
	nop			;bd39
	nop			;bd3a
	nop			;bd3b
	nop			;bd3c
	nop			;bd3d
	nop			;bd3e
	nop			;bd3f
	nop			;bd40
	nop			;bd41
	nop			;bd42
	nop			;bd43
	nop			;bd44
	nop			;bd45
	nop			;bd46
	nop			;bd47
	nop			;bd48
	nop			;bd49
	nop			;bd4a
	nop			;bd4b
	nop			;bd4c
	nop			;bd4d
	nop			;bd4e
	nop			;bd4f
	nop			;bd50
	nop			;bd51
	nop			;bd52
	nop			;bd53
	nop			;bd54
	nop			;bd55
	nop			;bd56
	nop			;bd57
	nop			;bd58
	nop			;bd59
	nop			;bd5a
	nop			;bd5b
	nop			;bd5c
	nop			;bd5d
	nop			;bd5e
	nop			;bd5f
	nop			;bd60
	nop			;bd61
	ld c,000h		;bd62
	nop			;bd64
	nop			;bd65
	dec c			;bd66
	nop			;bd67
	nop			;bd68
	inc c			;bd69
	rrca			;bd6a
	nop			;bd6b
	nop			;bd6c
	djnz $+8		;bd6d
	add a,b			;bd6f
	nop			;bd70
	inc de			;bd71
	rst 0			;bd72
	add a,b			;bd73
	ld bc,lb387h		;bd74
	ld b,b			;bd77
	inc bc			;bd78
	add a,0bbh		;bd79
	adc a,b			;bd7b
	inc bc			;bd7c
	add a,07bh		;bd7d
	ld c,b			;bd7f
	ld (03de7h),a		;bd80
	ret z			;bd83
	ld b,d			;bd84
	rst 20h			;bd85
	ld e,012h		;bd86
	inc bc			;bd88
	ld (hl),a		;bd89
	nop			;bd8a
	ld h,d			;bd8b
	dec de			;bd8c
	ld (hl),e		;bd8d
	nop			;bd8e
	inc b			;bd8f
	dec sp			;bd90
	dec sp			;bd91
	nop			;bd92
	jr lbdd1h		;bd93
	sbc a,d			;bd95
	nop			;bd96
	nop			;bd97
	rra			;bd98
	sub l			;bd99
	nop			;bd9a
	nop			;bd9b
	rlca			;bd9c
	ld a,(bc)		;bd9d
	add a,b			;bd9e
	nop			;bd9f
	nop			;bda0
	rla			;bda1
	ld b,b			;bda2
	ret po			;bda3
	jr nc,lbdbeh		;bda4
	and c			;bda6
	or b			;bda7
	ld a,h			;bda8
	rlca			;bda9
	ld h,c			;bdaa
	ld d,b			;bdab
	ld a,(hl)		;bdac
	rlca			;bdad
	and e			;bdae
	ld d,b			;bdaf
	ld a,a			;bdb0
lbdb1h:
	rlca			;bdb1
	jp nc,07338h		;bdb2
	add a,a			;bdb5
	or h			;bdb6
	cp b			;bdb7
	ld (hl),b		;bdb8
	jp 0bad9h		;bdb9
	ld (hl),e		;bdbc
	inc sp			;bdbd
lbdbeh:
	ei			;bdbe
	jr lbdf2h		;bdbf
	rst 8			;bdc1
	or a			;bdc2
	jr lbdfdh		;bdc3
	ld (hl),e		;bdc5
	ld d,(hl)		;bdc6
	nop			;bdc7
	jr c,lbe06h		;bdc8
	xor 002h		;bdca
	jr c,$+33		;bdcc
	cp 004h			;bdce
	inc a			;bdd0
lbdd1h:
	rrca			;bdd1
	rst 38h			;bdd2
	jr lbdb1h		;bdd3
	rlca			;bdd5
	exx			;bdd6
	ret p			;bdd7
	inc (hl)		;bdd8
	ld b,a			;bdd9
	cp (hl)			;bdda
	ret po			;bddb
	dec de			;bddc
	rrca			;bddd
	xor d			;bdde
	ret po			;bddf
	nop			;bde0
	rst 0			;bde1
	cp (hl)			;bde2
	ret nz			;bde3
	nop			;bde4
	ld sp,ld0ddh		;bde5
	nop			;bde8
	adc a,h			;bde9
	ld a,a			;bdea
	jp nz,le300h		;bdeb
	inc sp			;bdee
	ret nz			;bdef
	inc bc			;bdf0
	ex af,af'		;bdf1
lbdf2h:
	and b			;bdf2
	ret po			;bdf3
	nop			;bdf4
	ld c,020h		;bdf5
	jr nc,lbdf9h		;bdf7
lbdf9h:
	ex af,af'		;bdf9
	nop			;bdfa
	djnz lbdfdh		;bdfb
lbdfdh:
	nop			;bdfd
	nop			;bdfe
	nop			;bdff
	nop			;be00
	nop			;be01
	nop			;be02
	nop			;be03
	nop			;be04
	nop			;be05
lbe06h:
	nop			;be06
	nop			;be07
	nop			;be08
	nop			;be09
	nop			;be0a
	nop			;be0b
	nop			;be0c
	nop			;be0d
	nop			;be0e
	nop			;be0f
	nop			;be10
	nop			;be11
	nop			;be12
	nop			;be13
	nop			;be14
	nop			;be15
	nop			;be16
	nop			;be17
	nop			;be18
	nop			;be19
	nop			;be1a
	nop			;be1b
	nop			;be1c
	nop			;be1d
	nop			;be1e
	nop			;be1f
	nop			;be20
	nop			;be21
	nop			;be22
	nop			;be23
	nop			;be24
	nop			;be25
	nop			;be26
	nop			;be27
	nop			;be28
	nop			;be29
	nop			;be2a
	nop			;be2b
	nop			;be2c
	nop			;be2d
	nop			;be2e
	nop			;be2f
	nop			;be30
	nop			;be31
	nop			;be32
	nop			;be33
	nop			;be34
	nop			;be35
	nop			;be36
	nop			;be37
	nop			;be38
	nop			;be39
	nop			;be3a
	nop			;be3b
	nop			;be3c
	nop			;be3d
	nop			;be3e
	nop			;be3f
	nop			;be40
	inc d			;be41
	nop			;be42
	nop			;be43
	nop			;be44
	dec d			;be45
	nop			;be46
	nop			;be47
	nop			;be48
	dec de			;be49
	nop			;be4a
	nop			;be4b
	nop			;be4c
	dec (hl)		;be4d
	nop			;be4e
	nop			;be4f
	nop			;be50
	ld a,a			;be51
	nop			;be52
	nop			;be53
	nop			;be54
	xor (hl)		;be55
	nop			;be56
	nop			;be57
	ld bc,030fch		;be58
	nop			;be5b
	ld bc,078fch		;be5c
	nop			;be5f
	ld bc,lfc3ch		;be60
	nop			;be63
	ld bc,lfc3dh		;be64
	nop			;be67
	nop			;be68
	rst 38h			;be69
	call z,00e00h		;be6a
	ccf			;be6d
	adc a,h			;be6e
	nop			;be6f
	rra			;be70
	cp a			;be71
	inc e			;be72
	nop			;be73
	rra			;be74
	rst 38h			;be75
	inc e			;be76
	nop			;be77
	dec a			;be78
	rst 38h			;be79
	inc h			;be7a
	nop			;be7b
lbe7ch:
	jr c,lbe7ch		;be7c
	ld e,b			;be7e
	nop			;be7f
	ld a,b			;be80
	ld a,l			;be81
	or b			;be82
	nop			;be83
	ld (hl),b		;be84
	ld (hl),d		;be85
	nop			;be86
	nop			;be87
	ld (hl),b		;be88
	ld c,(hl)		;be89
	nop			;be8a
	nop			;be8b
	ld a,c			;be8c
	cp (hl)			;be8d
	nop			;be8e
	nop			;be8f
	ld a,07ch		;be90
	nop			;be92
	nop			;be93
	inc e			;be94
	xor e			;be95
	add a,b			;be96
	nop			;be97
	ld l,h			;be98
	rst 10h			;be99
	ret po			;be9a
	nop			;be9b
	ld bc,lf0abh		;be9c
	nop			;be9f
	ld bc,lfcd0h		;bea0
	nop			;bea3
	inc bc			;bea4
	ret nz			;bea5
	ld a,000h		;bea6
	rlca			;bea8
	ret nz			;bea9
	ld e,000h		;beaa
	rrca			;beac
	add a,(hl)		;bead
	inc de			;beae
	nop			;beaf
	rrca			;beb0
	jp m,0000dh		;beb1
	rlca			;beb4
	defb 0fdh,01eh,000h ;illegal sequence	;beb5
	inc bc			;beb8
	defb 0fdh,01eh,000h ;illegal sequence	;beb9
	nop			;bebc
	ld a,(bc)		;bebd
	ld a,000h		;bebe
	nop			;bec0
	ld d,07ch		;bec1
	nop			;bec3
	nop			;bec4
	ld a,h			;bec5
	ld a,b			;bec6
	nop			;bec7
	nop			;bec8
	ld a,b			;bec9
	ld a,b			;beca
	nop			;becb
	nop			;becc
	nop			;becd
	jr nc,lbed0h		;bece
lbed0h:
	nop			;bed0
	nop			;bed1
	nop			;bed2
	nop			;bed3
	nop			;bed4
	nop			;bed5
	nop			;bed6
	nop			;bed7
	nop			;bed8
	nop			;bed9
	nop			;beda
	nop			;bedb
	nop			;bedc
	nop			;bedd
	nop			;bede
	nop			;bedf
	nop			;bee0
	nop			;bee1
	nop			;bee2
	nop			;bee3
	nop			;bee4
	nop			;bee5
	nop			;bee6
	nop			;bee7
	nop			;bee8
	nop			;bee9
	nop			;beea
	nop			;beeb
	nop			;beec
	nop			;beed
	nop			;beee
	nop			;beef
	nop			;bef0
	nop			;bef1
	nop			;bef2
	nop			;bef3
	nop			;bef4
	nop			;bef5
	nop			;bef6
	nop			;bef7
	nop			;bef8
	nop			;bef9
	nop			;befa
	nop			;befb
	nop			;befc
	nop			;befd
	nop			;befe
lbeffh:
	nop			;beff
	nop			;bf00
	nop			;bf01
	nop			;bf02
	nop			;bf03
	nop			;bf04
	nop			;bf05
	nop			;bf06
	nop			;bf07
	nop			;bf08
	nop			;bf09
	nop			;bf0a
	nop			;bf0b
	nop			;bf0c
	nop			;bf0d
	nop			;bf0e
	nop			;bf0f
	nop			;bf10
	nop			;bf11
	nop			;bf12
	nop			;bf13
	nop			;bf14
	nop			;bf15
	nop			;bf16
	nop			;bf17
	nop			;bf18
	nop			;bf19
	nop			;bf1a
	nop			;bf1b
sub_bf1ch:
	nop			;bf1c
lbf1dh:
	nop			;bf1d
	nop			;bf1e
	nop			;bf1f
	nop			;bf20
	ld (bc),a		;bf21
	add a,b			;bf22
	nop			;bf23
	nop			;bf24
	ld a,(bc)		;bf25
	add a,b			;bf26
	nop			;bf27
	nop			;bf28
	dec c			;bf29
	add a,b			;bf2a
	nop			;bf2b
	nop			;bf2c
	ld a,(bc)		;bf2d
	ret nz			;bf2e
	nop			;bf2f
	nop			;bf30
	rrca			;bf31
	ret po			;bf32
	nop			;bf33
	ld (bc),a		;bf34
	rrca			;bf35
	ld d,b			;bf36
	nop			;bf37
	ld (bc),a		;bf38
	rlca			;bf39
	ld d,b			;bf3a
	inc c			;bf3b
	ld bc,lf807h		;bf3c
	jr nc,lbf42h		;bf3f
	rlca			;bf41
lbf42h:
	xor b			;bf42
	ret nz			;bf43
	nop			;bf44
	add a,e			;bf45
	ld bc,00000h		;bf46
	add a,a			;bf49
	nop			;bf4a
	jr nz,lbf4dh		;bf4b
lbf4dh:
	ld c,a			;bf4d
	dec a			;bf4e
	ld b,000h		;bf4f
	ld e,a			;bf51
	ld a,(hl)		;bf52
	sbc a,b			;bf53
	nop			;bf54
	ccf			;bf55
	add a,(hl)		;bf56
	add a,b			;bf57
	nop			;bf58
	ld a,(hl)		;bf59
	jp p,00080h		;bf5a
	ld a,a			;bf5d
	inc bc			;bf5e
	nop			;bf5f
	nop			;bf60
	rst 30h			;bf61
	and b			;bf62
	jr lbf65h		;bf63
lbf65h:
	rst 20h			;bf65
	and c			;bf66
	ld b,000h		;bf67
	rst 10h			;bf69
	ld h,b			;bf6a
	ld b,c			;bf6b
	nop			;bf6c
	rst 10h			;bf6d
	ret nz			;bf6e
	nop			;bf6f
	jr nz,lbfddh		;bf70
	ret po			;bf72
	nop			;bf73
	ex af,af'		;bf74
	ld (hl),l		;bf75
	ld d,b			;bf76
	nop			;bf77
	ld (bc),a		;bf78
	ld (hl),0b0h		;bf79
	nop			;bf7b
	nop			;bf7c
lbf7dh:
	sub l			;bf7d
	ld e,b			;bf7e
	nop			;bf7f
	nop			;bf80
	ld a,(bc)		;bf81
	cp h			;bf82
	nop			;bf83
	nop			;bf84
	daa			;bf85
	ld e,h			;bf86
	nop			;bf87
	djnz lbf1dh		;bf88
	xor 000h		;bf8a
	ld (bc),a		;bf8c
	ld b,c			;bf8d
	sub 000h		;bf8e
	ex af,af'		;bf90
	jr nz,lbf7dh		;bf91
lbf93h:
	nop			;bf93
	ld hl,07a00h		;bf94
	nop			;bf97
	nop			;bf98
	ld b,b			;bf99
	ld l,d			;bf9a
	nop			;bf9b
	inc b			;bf9c
sub_bf9dh:
	nop			;bf9d
	call p,00000h		;bf9e
	add a,c			;bfa1
	ret pe			;bfa2
	nop			;bfa3
	djnz lbfa9h		;bfa4
	ret nc			;bfa6
	nop			;bfa7
	nop			;bfa8
lbfa9h:
	inc c			;bfa9
lbfaah:
	cp b			;bfaa
	nop			;bfab
	nop			;bfac
	rra			;bfad
	inc a			;bfae
	nop			;bfaf
	nop			;bfb0
	ld a,01eh		;bfb1
	nop			;bfb3
	nop			;bfb4
	ccf			;bfb5
	nop			;bfb6
	nop			;bfb7
	nop			;bfb8
	rra			;bfb9
	add a,b			;bfba
	nop			;bfbb
	nop			;bfbc
	nop			;bfbd
	nop			;bfbe
	nop			;bfbf
	nop			;bfc0
	nop			;bfc1
	nop			;bfc2
	nop			;bfc3
	nop			;bfc4
	nop			;bfc5
	nop			;bfc6
	nop			;bfc7
	nop			;bfc8
	nop			;bfc9
	nop			;bfca
	nop			;bfcb
	nop			;bfcc
	nop			;bfcd
	nop			;bfce
	nop			;bfcf
	nop			;bfd0
	nop			;bfd1
	nop			;bfd2
	nop			;bfd3
	nop			;bfd4
	nop			;bfd5
	nop			;bfd6
	nop			;bfd7
	nop			;bfd8
	nop			;bfd9
	nop			;bfda
	nop			;bfdb
	nop			;bfdc
lbfddh:
	rst 38h			;bfdd
	rst 38h			;bfde
	rst 38h			;bfdf
	rst 38h			;bfe0
	ret m			;bfe1
	ret m			;bfe2
	ld a,b			;bfe3
	rrca			;bfe4
	ld a,a			;bfe5
	rst 20h			;bfe6
lbfe7h:
	call p,sub_ffc1h	;bfe7
	pop af			;bfea
	rra			;bfeb
	ld e,06eh		;bfec
	sbc a,0edh		;bfee
	call p,079f7h		;bff0
	ld a,09fh		;bff3
	jr z,lbf93h		;bff5
lbff7h:
	adc a,b			;bff7
	sub d			;bff8
	rst 38h			;bff9
sub_bffah:
	rst 38h			;bffa
lbffbh:
	rst 38h			;bffb
	rst 38h			;bffc
	add a,h			;bffd
	nop			;bffe
	nop			;bfff
	jr lbffbh		;c000
	pop iy			;c002
	rst 20h			;c004
	ld a,a			;c005
	rst 30h			;c006
	pop af			;c007
	di			;c008
	ld a,a			;c009
	call p,0484eh		;c00a
	ld l,09eh		;c00d
	call z,sub_f7f1h	;c00f
	ld a,b			;c012
	ld a,(hl)		;c013
	rra			;c014
	add a,h			;c015
	ld e,012h		;c016
	ld e,b			;c018
	rst 38h			;c019
	rst 38h			;c01a
	rst 38h			;c01b
	rst 38h			;c01c
	ld sp,lf557h		;c01d
	ld b,c			;c020
	ret p			;c021
	defb 0fdh,0cch,0f3h ;illegal sequence	;c022
	rst 38h			;c025
	rst 30h			;c026
	di			;c027
	ld sp,hl		;c028
	ccf			;c029
	call p,sub_eb66h	;c02a
	xor (hl)		;c02d
	inc a			;c02e
	sbc a,0e7h		;c02f
	rst 30h			;c031
	ld a,d			;c032
	ld a,(hl)		;c033
	rra			;c034
	and b			;c035
	cp a			;c036
	rr d			;c037
	rst 38h			;c039
	rst 38h			;c03a
	rst 38h			;c03b
	rst 38h			;c03c
	jp m,lfeafh		;c03d
	xor e			;c040
	add a,03ch		;c041
	ld e,07bh		;c043
	rst 38h			;c045
	di			;c046
	ex (sp),hl		;c047
	defb 0fdh,09fh,0f6h ;illegal sequence	;c048
	call p,08ee3h		;c04b
	ld a,h			;c04e
	sbc a,(hl)		;c04f
	rst 28h			;c050
	di			;c051
	jr c,lc0d2h		;c052
	sub a			;c054
	adc a,(hl)		;c055
	ccf			;c056
	ex (sp),hl		;c057
	ret m			;c058
	rst 38h			;c059
	rst 38h			;c05a
	rst 38h			;c05b
	rst 38h			;c05c
	rst 38h			;c05d
	rst 38h			;c05e
	rst 38h			;c05f
	rst 38h			;c060
	sbc a,a			;c061
	add hl,de		;c062
	sbc a,a			;c063
	ld a,c			;c064
	rst 38h			;c065
	ei			;c066
	set 7,h			;c067
lc069h:
	rst 8			;c069
	and 0f5h		;c06a
	rst 30h			;c06c
	rst 8			;c06d
	ld a,l			;c06e
	cp (hl)			;c06f
	ld c,a			;c070
	cp c			;c071
	ld (lab46h),a		;c072
	xor a			;c075
	rst 38h			;c076
	ex de,hl		;c077
	rst 38h			;c078
	rst 38h			;c079
	rst 38h			;c07a
	rst 38h			;c07b
	rst 38h			;c07c
	rst 18h			;c07d
	rst 38h			;c07e
	rst 38h			;c07f
	cp 0bfh			;c080
	sbc a,e			;c082
	rst 8			;c083
	ld a,l			;c084
	rst 38h			;c085
	ei			;c086
lc087h:
	exx			;c087
	cp 0e1h			;c088
	xor 0f5h		;c08a
	rst 30h			;c08c
	rst 8			;c08d
	ld a,c			;c08e
	cp a			;c08f
	ld e,a			;c090
	ld e,h			;c091
lc092h:
	inc d			;c092
	ld d,055h		;c093
	adc a,a			;c095
	rst 38h			;c096
	ex (sp),hl		;c097
	rst 38h			;c098
	rst 38h			;c099
	rst 38h			;c09a
	rst 38h			;c09b
	rst 38h			;c09c
	cpl			;c09d
	rlca			;c09e
	ret po			;c09f
	ld b,b			;c0a0
	ccf			;c0a1
	set 5,(hl)		;c0a2
	dec a			;c0a4
	rst 38h			;c0a5
	ei			;c0a6
	call c,sub_e5feh	;c0a7
	adc a,0f1h		;c0aa
	rst 30h			;c0ac
	rst 28h			;c0ad
	ld a,c			;c0ae
	cp a			;c0af
	ld e,a			;c0b0
	xor d			;c0b1
	add a,d			;c0b2
	and h			;c0b3
	add a,d			;c0b4
	xor a			;c0b5
	rst 38h			;c0b6
	rst 38h			;c0b7
	rst 38h			;c0b8
	rst 38h			;c0b9
	rst 38h			;c0ba
	rst 38h			;c0bb
	rst 38h			;c0bc
sub_c0bdh:
	add a,d			;c0bd
	ld (hl),e		;c0be
	rrca			;c0bf
	dec e			;c0c0
lc0c1h:
	ld a,a			;c0c1
	ex (sp),hl		;c0c2
	and 01ch		;c0c3
	rst 38h			;c0c5
	ei			;c0c6
	sbc a,07eh		;c0c7
	call po,sub_e1deh	;c0c9
	rst 30h			;c0cc
	rst 20h			;c0cd
	ld a,c			;c0ce
	cp (hl)			;c0cf
	rra			;c0d0
	ld d,l			;c0d1
lc0d2h:
	ld e,c			;c0d2
	ld d,c			;c0d3
	ld d,l			;c0d4
	adc a,a			;c0d5
	rst 38h			;c0d6
	rst 38h			;c0d7
	rst 38h			;c0d8
	rst 38h			;c0d9
	rst 38h			;c0da
	rst 38h			;c0db
	rst 38h			;c0dc
lc0ddh:
	nop			;c0dd
	nop			;c0de
	nop			;c0df
	nop			;c0e0
	nop			;c0e1
	nop			;c0e2
	nop			;c0e3
	nop			;c0e4
	nop			;c0e5
	nop			;c0e6
	nop			;c0e7
	nop			;c0e8
	nop			;c0e9
	nop			;c0ea
	nop			;c0eb
	nop			;c0ec
	nop			;c0ed
	nop			;c0ee
	nop			;c0ef
	nop			;c0f0
	nop			;c0f1
	nop			;c0f2
	nop			;c0f3
	nop			;c0f4
	nop			;c0f5
	ld (bc),a		;c0f6
	xor b			;c0f7
	nop			;c0f8
	nop			;c0f9
	nop			;c0fa
	nop			;c0fb
	rra			;c0fc
	ret nz			;c0fd
	nop			;c0fe
	nop			;c0ff
	nop			;c100
	nop			;c101
	nop			;c102
	nop			;c103
	nop			;c104
	ld a,a			;c105
	ret p			;c106
	inc bc			;c107
	ret po			;c108
	nop			;c109
	nop			;c10a
	nop			;c10b
	nop			;c10c
	ld bc,lfcffh		;c10d
	dec d			;c110
	ld d,b			;c111
	nop			;c112
	nop			;c113
	nop			;c114
	nop			;c115
	inc bc			;c116
	rst 38h			;c117
	jp pe,laaaah		;c118
	ret po			;c11b
	nop			;c11c
	nop			;c11d
	nop			;c11e
	rlca			;c11f
	rst 38h			;c120
	ld d,l			;c121
	rra			;c122
	dec d			;c123
	ld d,h			;c124
	nop			;c125
	nop			;c126
	rst 38h			;c127
	rrca			;c128
	rst 38h			;c129
	rst 38h			;c12a
	add a,b			;c12b
	nop			;c12c
	nop			;c12d
	nop			;c12e
	dec bc			;c12f
	ld d,b			;c130
	rra			;c131
	rst 38h			;c132
	rst 38h			;c133
	add a,b			;c134
	nop			;c135
	nop			;c136
	nop			;c137
	inc d			;c138
	xor d			;c139
	xor d			;c13a
	rst 38h			;c13b
	rst 38h			;c13c
	ret nz			;c13d
	nop			;c13e
	nop			;c13f
	dec b			;c140
	xor a			;c141
	ret nz			;c142
	ld d,l			;c143
	ld d,l			;c144
	rst 38h			;c145
	ret nz			;c146
	nop			;c147
	nop			;c148
	nop			;c149
	ret p			;c14a
	nop			;c14b
	ld hl,(lbfaah)		;c14c
	ret po			;c14f
	nop			;c150
	nop			;c151
	or l			;c152
	nop			;c153
	nop			;c154
	ccf			;c155
	rst 38h			;c156
	rst 38h			;c157
	jp po,000a0h		;c158
	ld a,(bc)		;c15b
	ret m			;c15c
	nop			;c15d
	ccf			;c15e
	rst 38h			;c15f
	rst 38h			;c160
	push hl			;c161
	ld d,h			;c162
	nop			;c163
	nop			;c164
	ld b,000h		;c165
	ccf			;c167
	rst 38h			;c168
	rst 38h			;c169
	xor d			;c16a
	nop			;c16b
	nop			;c16c
	nop			;c16d
	ld bc,05f55h		;c16e
	rst 38h			;c171
	rst 38h			;c172
	ld d,b			;c173
	nop			;c174
	nop			;c175
	nop			;c176
	inc d			;c177
	add a,b			;c178
	ccf			;c179
	rst 38h			;c17a
	rst 38h			;c17b
	rst 28h			;c17c
	pop bc			;c17d
	ret nz			;c17e
	nop			;c17f
	ld l,e			;c180
	ld a,(de)		;c181
	ccf			;c182
	rst 38h			;c183
	rst 38h			;c184
	sub 0a2h		;c185
	or b			;c187
	nop			;c188
	nop			;c189
	dec b			;c18a
	inc bc			;c18b
	rst 38h			;c18c
	cp 0afh			;c18d
	ld d,l			;c18f
	ld l,h			;c190
	ld l,h			;c191
	ret nz			;c192
	sbc a,(hl)		;c193
	call m,0553dh		;c194
	ld e,a			;c197
	rst 20h			;c198
	rst 10h			;c199
	nop			;c19a
	nop			;c19b
	nop			;c19c
	ld (bc),a		;c19d
	adc a,a			;c19e
	jp pe,003ach		;c19f
	jp pe,00000h		;c1a2
	nop			;c1a5
	rrca			;c1a6
	rst 38h			;c1a7
	rst 38h			;c1a8
	cp (hl)			;c1a9
	inc b			;c1aa
	cp l			;c1ab
	nop			;c1ac
	nop			;c1ad
	nop			;c1ae
	rlca			;c1af
	jp 05fffh		;c1b0
	ld a,c			;c1b3
	ld c,000h		;c1b4
	nop			;c1b6
	nop			;c1b7
	inc bc			;c1b8
	or l			;c1b9
	xor d			;c1ba
	xor e			;c1bb
	adc a,007h		;c1bc
	nop			;c1be
	nop			;c1bf
	nop			;c1c0
	ld a,(bc)		;c1c1
	ld a,(de)		;c1c2
	ld a,l			;c1c3
	ld d,a			;c1c4
	cp d			;c1c5
	and l			;c1c6
	nop			;c1c7
	nop			;c1c8
	nop			;c1c9
	dec d			;c1ca
	ld a,l			;c1cb
	ld (le0aah),a		;c1cc
	ld a,(de)		;c1cf
	nop			;c1d0
	nop			;c1d1
	nop			;c1d2
	xor b			;c1d3
	rst 18h			;c1d4
	push bc			;c1d5
	ld d,l			;c1d6
	or l			;c1d7
	ld c,a			;c1d8
	nop			;c1d9
	nop			;c1da
	dec d			;c1db
	ld d,l			;c1dc
	ld hl,(laaa2h)		;c1dd
	nop			;c1e0
	nop			;c1e1
	nop			;c1e2
	nop			;c1e3
	nop			;c1e4
	ld (bc),a		;c1e5
	sbc a,0ddh		;c1e6
	ld e,b			;c1e8
	nop			;c1e9
	nop			;c1ea
	nop			;c1eb
	nop			;c1ec
	nop			;c1ed
	nop			;c1ee
	nop			;c1ef
	nop			;c1f0
	nop			;c1f1
	nop			;c1f2
	nop			;c1f3
	nop			;c1f4
	nop			;c1f5
	nop			;c1f6
	nop			;c1f7
	nop			;c1f8
	nop			;c1f9
	nop			;c1fa
	nop			;c1fb
	nop			;c1fc
	nop			;c1fd
lc1feh:
	add a,b			;c1fe
	ex af,af'		;c1ff
	inc a			;c200
	ld a,h			;c201
	jr nc,lc20ch		;c202
	ld (hl),c		;c204
	rst 0			;c205
	ret nz			;c206
	ex af,af'		;c207
	inc a			;c208
	ld a,h			;c209
	jr nc,lc214h		;c20a
lc20ch:
	ld (hl),c		;c20c
	rst 0			;c20d
	ret nz			;c20e
	ex af,af'		;c20f
	inc a			;c210
	ld a,h			;c211
	jr nc,lc21ch		;c212
lc214h:
	ld (hl),c		;c214
	rst 0			;c215
	ret nz			;c216
	ex af,af'		;c217
	inc a			;c218
	ld a,h			;c219
	jr nc,lc224h		;c21a
lc21ch:
	ld (hl),c		;c21c
	rst 0			;c21d
	ld h,e			;c21e
	inc (hl)		;c21f
	cp (hl)			;c220
	cp (hl)			;c221
	or (hl)			;c222
	xor l			;c223
lc224h:
	or l			;c224
	ld c,a			;c225
	or e			;c226
	inc (hl)		;c227
	cp (hl)			;c228
	cp (hl)			;c229
	or (hl)			;c22a
	xor l			;c22b
	or l			;c22c
	ld c,a			;c22d
	or e			;c22e
	inc (hl)		;c22f
	cp (hl)			;c230
	cp (hl)			;c231
	or (hl)			;c232
	xor l			;c233
	or l			;c234
	ld c,a			;c235
	or e			;c236
	inc (hl)		;c237
	cp (hl)			;c238
	cp (hl)			;c239
	or (hl)			;c23a
	xor l			;c23b
	or l			;c23c
	ld c,a			;c23d
	inc a			;c23e
	rrca			;c23f
	nop			;c240
	nop			;c241
	nop			;c242
	nop			;c243
	djnz lc2aeh		;c244
	inc c			;c246
	rrca			;c247
	nop			;c248
	nop			;c249
	nop			;c24a
	nop			;c24b
	djnz lc2b6h		;c24c
	inc c			;c24e
	rrca			;c24f
	nop			;c250
	nop			;c251
	nop			;c252
	nop			;c253
	djnz lc2beh		;c254
	inc c			;c256
	rrca			;c257
	nop			;c258
	nop			;c259
	nop			;c25a
	nop			;c25b
	djnz lc2c6h		;c25c
	cp 010h			;c25e
	nop			;c260
	nop			;c261
	nop			;c262
	nop			;c263
	nop			;c264
	dec de			;c265
	cp 010h			;c266
	nop			;c268
	nop			;c269
	nop			;c26a
	nop			;c26b
	nop			;c26c
	dec de			;c26d
	cp 010h			;c26e
	nop			;c270
	nop			;c271
	nop			;c272
	nop			;c273
	nop			;c274
	dec de			;c275
	cp 010h			;c276
	nop			;c278
	nop			;c279
	nop			;c27a
	nop			;c27b
	nop			;c27c
	dec de			;c27d
	ld d,c			;c27e
	ret p			;c27f
	nop			;c280
	nop			;c281
	nop			;c282
	nop			;c283
	nop			;c284
	dec b			;c285
	and c			;c286
	ret p			;c287
	nop			;c288
	nop			;c289
	nop			;c28a
	nop			;c28b
	nop			;c28c
	dec b			;c28d
	and c			;c28e
	ret p			;c28f
	nop			;c290
	nop			;c291
	nop			;c292
	nop			;c293
	nop			;c294
	dec b			;c295
	and c			;c296
	ret p			;c297
	nop			;c298
	nop			;c299
	nop			;c29a
	nop			;c29b
	nop			;c29c
	dec b			;c29d
	rst 38h			;c29e
	ret p			;c29f
	nop			;c2a0
	nop			;c2a1
	nop			;c2a2
	nop			;c2a3
	nop			;c2a4
	rrca			;c2a5
	rst 38h			;c2a6
	ret p			;c2a7
	nop			;c2a8
	nop			;c2a9
	nop			;c2aa
	nop			;c2ab
	nop			;c2ac
	rrca			;c2ad
lc2aeh:
	rst 38h			;c2ae
	ret p			;c2af
	nop			;c2b0
	nop			;c2b1
	nop			;c2b2
	nop			;c2b3
	nop			;c2b4
	rrca			;c2b5
lc2b6h:
	rst 38h			;c2b6
	ret p			;c2b7
	nop			;c2b8
	nop			;c2b9
	nop			;c2ba
	nop			;c2bb
	nop			;c2bc
	rrca			;c2bd
lc2beh:
	nop			;c2be
	ld d,b			;c2bf
	nop			;c2c0
	ld bc,00100h		;c2c1
	nop			;c2c4
	rrca			;c2c5
lc2c6h:
	nop			;c2c6
	ld d,b			;c2c7
	nop			;c2c8
	ld bc,00100h		;c2c9
	nop			;c2cc
	rrca			;c2cd
	nop			;c2ce
	ld d,b			;c2cf
	nop			;c2d0
	ld bc,00100h		;c2d1
	nop			;c2d4
	rrca			;c2d5
	nop			;c2d6
	ld d,b			;c2d7
	nop			;c2d8
	ld bc,00100h		;c2d9
	nop			;c2dc
	rrca			;c2dd
	rst 38h			;c2de
	rst 38h			;c2df
	ret m			;c2e0
	rst 38h			;c2e1
	rst 38h			;c2e2
	ld a,a			;c2e3
	cp 0abh			;c2e4
	rst 38h			;c2e6
	rst 38h			;c2e7
	ret m			;c2e8
	rst 38h			;c2e9
	rst 38h			;c2ea
	ld a,a			;c2eb
	cp 0abh			;c2ec
	rst 38h			;c2ee
	rst 38h			;c2ef
	ret m			;c2f0
	rst 38h			;c2f1
	rst 38h			;c2f2
	ld a,a			;c2f3
	cp 0abh			;c2f4
	rst 38h			;c2f6
	rst 38h			;c2f7
	ret m			;c2f8
	rst 38h			;c2f9
	rst 38h			;c2fa
	ld a,a			;c2fb
	cp 0abh			;c2fc
	ld b,e			;c2fe
	ld d,h			;c2ff
	ld l,d			;c300
	jp pe,0746ah		;c301
	ex de,hl		;c304
	ld c,(hl)		;c305
	and e			;c306
	ld d,h			;c307
	ld l,d			;c308
	jp pe,0746ah		;c309
	ex de,hl		;c30c
	ld c,(hl)		;c30d
	and e			;c30e
	ld d,h			;c30f
	ld l,d			;c310
	jp pe,0746ah		;c311
	ex de,hl		;c314
	ld c,(hl)		;c315
	and e			;c316
	ld d,h			;c317
	ld l,d			;c318
	jp pe,0746ah		;c319
	ex de,hl		;c31c
	ld c,(hl)		;c31d
	and 0eeh		;c31e
	rst 18h			;c320
	ld l,c			;c321
	xor 0edh		;c322
	xor d			;c324
	ex de,hl		;c325
	halt			;c326
	xor 0dfh		;c327
	ld l,c			;c329
	xor 0edh		;c32a
	xor d			;c32c
	ex de,hl		;c32d
	halt			;c32e
	xor 0dfh		;c32f
	ld l,c			;c331
	xor 0edh		;c332
	xor d			;c334
	ex de,hl		;c335
	halt			;c336
	xor 0dfh		;c337
	ld l,c			;c339
	xor 0edh		;c33a
	xor d			;c33c
	ex de,hl		;c33d
	rst 38h			;c33e
	ccf			;c33f
	ret nz			;c340
	nop			;c341
	nop			;c342
	nop			;c343
	rrca			;c344
	rst 20h			;c345
	rst 38h			;c346
	ccf			;c347
	ret nz			;c348
	nop			;c349
	nop			;c34a
	nop			;c34b
	rrca			;c34c
	rst 20h			;c34d
	rst 38h			;c34e
	ccf			;c34f
	ret nz			;c350
	nop			;c351
	nop			;c352
	nop			;c353
	rrca			;c354
	rst 20h			;c355
	rst 38h			;c356
	ccf			;c357
	ret nz			;c358
	nop			;c359
	nop			;c35a
	nop			;c35b
	rrca			;c35c
	rst 20h			;c35d
	rst 38h			;c35e
	ret pe			;c35f
	nop			;c360
	nop			;c361
	nop			;c362
	nop			;c363
	nop			;c364
	rrca			;c365
	rst 38h			;c366
	ret pe			;c367
	nop			;c368
	nop			;c369
	nop			;c36a
	nop			;c36b
	nop			;c36c
	rrca			;c36d
	rst 38h			;c36e
	ret pe			;c36f
	nop			;c370
	nop			;c371
	nop			;c372
	nop			;c373
	nop			;c374
	rrca			;c375
	rst 38h			;c376
	ret pe			;c377
	nop			;c378
	nop			;c379
	nop			;c37a
	nop			;c37b
	nop			;c37c
	rrca			;c37d
	cp a			;c37e
	ret p			;c37f
	nop			;c380
	nop			;c381
	nop			;c382
	nop			;c383
	nop			;c384
	dec bc			;c385
	rst 18h			;c386
	ret p			;c387
	nop			;c388
	nop			;c389
	nop			;c38a
	nop			;c38b
	nop			;c38c
	dec bc			;c38d
	rst 18h			;c38e
	ret p			;c38f
	nop			;c390
	nop			;c391
	nop			;c392
	nop			;c393
	nop			;c394
	dec bc			;c395
	rst 18h			;c396
	ret p			;c397
	nop			;c398
	nop			;c399
	nop			;c39a
	nop			;c39b
	nop			;c39c
	dec bc			;c39d
	rst 38h			;c39e
	or b			;c39f
	nop			;c3a0
	nop			;c3a1
	nop			;c3a2
	nop			;c3a3
	nop			;c3a4
	rrca			;c3a5
	rst 38h			;c3a6
	or b			;c3a7
	nop			;c3a8
	nop			;c3a9
	nop			;c3aa
	nop			;c3ab
	nop			;c3ac
	rrca			;c3ad
	rst 38h			;c3ae
	or b			;c3af
	nop			;c3b0
	nop			;c3b1
	nop			;c3b2
	nop			;c3b3
	nop			;c3b4
	rrca			;c3b5
	rst 38h			;c3b6
	or b			;c3b7
	nop			;c3b8
	nop			;c3b9
	nop			;c3ba
	nop			;c3bb
	nop			;c3bc
	rrca			;c3bd
	xor (hl)		;c3be
	ld (bc),a		;c3bf
	nop			;c3c0
	ld (bc),a		;c3c1
	and d			;c3c2
	ld hl,(00eb4h)		;c3c3
	ld e,(hl)		;c3c6
	ld (bc),a		;c3c7
	nop			;c3c8
	ld (bc),a		;c3c9
	and d			;c3ca
	ld hl,(00eb4h)		;c3cb
	ld e,(hl)		;c3ce
	ld (bc),a		;c3cf
	nop			;c3d0
	ld (bc),a		;c3d1
	and d			;c3d2
	ld hl,(00eb4h)		;c3d3
	ld e,(hl)		;c3d6
	ld (bc),a		;c3d7
	nop			;c3d8
	ld (bc),a		;c3d9
	and d			;c3da
	ld hl,(00eb4h)		;c3db
	rst 38h			;c3de
	rst 38h			;c3df
	push bc			;c3e0
	rra			;c3e1
	rst 38h			;c3e2
	push af			;c3e3
	ld a,a			;c3e4
lc3e5h:
	rst 38h			;c3e5
	rst 38h			;c3e6
	rst 38h			;c3e7
	push bc			;c3e8
	rra			;c3e9
	rst 38h			;c3ea
	push af			;c3eb
	ld a,a			;c3ec
	rst 38h			;c3ed
	rst 38h			;c3ee
	rst 38h			;c3ef
	push bc			;c3f0
	rra			;c3f1
	rst 38h			;c3f2
	push af			;c3f3
	ld a,a			;c3f4
	rst 38h			;c3f5
	rst 38h			;c3f6
	rst 38h			;c3f7
	push bc			;c3f8
	rra			;c3f9
	rst 38h			;c3fa
	push af			;c3fb
	ld a,a			;c3fc
	rst 38h			;c3fd
	and a			;c3fe
	jp pe,0f676h		;c3ff
	or 0fah			;c402
	in a,(0afh)		;c404
	ld d,a			;c406
	jp pe,0f676h		;c407
	or 0fah			;c40a
	in a,(0afh)		;c40c
	ld d,a			;c40e
	jp pe,0f676h		;c40f
	or 0fah			;c412
	in a,(0afh)		;c414
	ld d,a			;c416
	jp pe,0f676h		;c417
	or 0fah			;c41a
	in a,(0afh)		;c41c
	rst 20h			;c41e
	sbc a,0bdh		;c41f
	ld (hl),a		;c421
	ld l,a			;c422
	ld e,l			;c423
	add hl,sp		;c424
	rst 28h			;c425
	ld (hl),a		;c426
	sbc a,0bdh		;c427
	ld (hl),a		;c429
	ld l,a			;c42a
	ld e,l			;c42b
	add hl,sp		;c42c
	rst 28h			;c42d
	ld (hl),a		;c42e
	sbc a,0bdh		;c42f
	ld (hl),a		;c431
	ld l,a			;c432
	ld e,l			;c433
	add hl,sp		;c434
	rst 28h			;c435
	ld (hl),a		;c436
	sbc a,0bdh		;c437
	ld (hl),a		;c439
	ld l,a			;c43a
	ld e,l			;c43b
	add hl,sp		;c43c
	rst 28h			;c43d
	ld a,(hl)		;c43e
	ld e,a			;c43f
	add a,b			;c440
	nop			;c441
	nop			;c442
	nop			;c443
	rlca			;c444
	jp pe,05fbeh		;c445
	add a,b			;c448
	nop			;c449
	nop			;c44a
	nop			;c44b
	rlca			;c44c
	jp pe,05fbeh		;c44d
	add a,b			;c450
	nop			;c451
	nop			;c452
	nop			;c453
	rlca			;c454
	jp pe,05fbeh		;c455
	add a,b			;c458
	nop			;c459
	nop			;c45a
	nop			;c45b
	rlca			;c45c
	jp pe,008ffh		;c45d
	nop			;c460
	nop			;c461
	nop			;c462
	nop			;c463
	nop			;c464
	rla			;c465
	rst 38h			;c466
	ex af,af'		;c467
	nop			;c468
	nop			;c469
	nop			;c46a
	nop			;c46b
	nop			;c46c
	rla			;c46d
	rst 38h			;c46e
	ex af,af'		;c46f
	nop			;c470
	nop			;c471
	nop			;c472
	nop			;c473
	nop			;c474
	rla			;c475
	rst 38h			;c476
	ex af,af'		;c477
	nop			;c478
	nop			;c479
	nop			;c47a
	nop			;c47b
	nop			;c47c
	rla			;c47d
	rst 38h			;c47e
	ret p			;c47f
	nop			;c480
	nop			;c481
	nop			;c482
	nop			;c483
	nop			;c484
	rlca			;c485
	rst 38h			;c486
	ret p			;c487
	nop			;c488
	nop			;c489
	nop			;c48a
	nop			;c48b
	nop			;c48c
	rlca			;c48d
	rst 38h			;c48e
	ret p			;c48f
	nop			;c490
	nop			;c491
	nop			;c492
	nop			;c493
	nop			;c494
	rlca			;c495
	rst 38h			;c496
	ret p			;c497
	nop			;c498
	nop			;c499
	nop			;c49a
	nop			;c49b
	nop			;c49c
	rlca			;c49d
	rst 38h			;c49e
	ret nc			;c49f
	nop			;c4a0
	nop			;c4a1
	nop			;c4a2
	nop			;c4a3
	nop			;c4a4
	rrca			;c4a5
	rst 38h			;c4a6
	ret nc			;c4a7
	nop			;c4a8
	nop			;c4a9
	nop			;c4aa
	nop			;c4ab
	nop			;c4ac
	rrca			;c4ad
	rst 38h			;c4ae
	ret nc			;c4af
	nop			;c4b0
	nop			;c4b1
	nop			;c4b2
	nop			;c4b3
	nop			;c4b4
	rrca			;c4b5
	rst 38h			;c4b6
	ret nc			;c4b7
	nop			;c4b8
	nop			;c4b9
	nop			;c4ba
	nop			;c4bb
	nop			;c4bc
	rrca			;c4bd
	ld e,a			;c4be
	sub l			;c4bf
	ld d,b			;c4c0
	dec d			;c4c1
	ld d,l			;c4c2
	push de			;c4c3
	ld l,e			;c4c4
	and b			;c4c5
	xor a			;c4c6
	sub l			;c4c7
	ld d,b			;c4c8
	dec d			;c4c9
	ld d,l			;c4ca
	push de			;c4cb
	ld l,e			;c4cc
	and b			;c4cd
	xor a			;c4ce
	sub l			;c4cf
	ld d,b			;c4d0
	dec d			;c4d1
	ld d,l			;c4d2
	push de			;c4d3
	ld l,e			;c4d4
	and b			;c4d5
	xor a			;c4d6
	sub l			;c4d7
	ld d,b			;c4d8
	dec d			;c4d9
	ld d,l			;c4da
	push de			;c4db
	ld l,e			;c4dc
	and b			;c4dd
	cp 08fh			;c4de
	ld hl,(lbfe7h)		;c4e0
	jp pe,lffbfh		;c4e3
	cp 08fh			;c4e6
	ld hl,(lbfe7h)		;c4e8
	jp pe,lffbfh		;c4eb
	cp 08fh			;c4ee
	ld hl,(lbfe7h)		;c4f0
	jp pe,lffbfh		;c4f3
	cp 08fh			;c4f6
	ld hl,(lbfe7h)		;c4f8
	jp pe,lffbfh		;c4fb
	rst 0			;c4fe
	call p,sub_fafah	;c4ff
	jp m,lebfeh		;c502
	rst 28h			;c505
	rst 20h			;c506
	call p,sub_fafah	;c507
	jp m,lebfeh		;c50a
	rst 28h			;c50d
	rst 20h			;c50e
	call p,sub_fafah	;c50f
	jp m,lebfeh		;c512
	rst 28h			;c515
	rst 20h			;c516
	call p,sub_fafah	;c517
	jp m,lebfeh		;c51a
	rst 28h			;c51d
	push hl			;c51e
	cp (hl)			;c51f
	defb 0edh ;next byte illegal after ed	;c520
	rst 28h			;c521
	sub a			;c522
	cp l			;c523
	cp e			;c524
	sub 0f5h		;c525
	cp (hl)			;c527
	defb 0edh ;next byte illegal after ed	;c528
	rst 28h			;c529
	sub a			;c52a
	cp l			;c52b
	cp e			;c52c
	sub 0f5h		;c52d
	cp (hl)			;c52f
	defb 0edh ;next byte illegal after ed	;c530
	rst 28h			;c531
	sub a			;c532
	cp l			;c533
	cp e			;c534
	sub 0f5h		;c535
	cp (hl)			;c537
	defb 0edh ;next byte illegal after ed	;c538
	rst 28h			;c539
	sub a			;c53a
	cp l			;c53b
	cp e			;c53c
	sub 0fch		;c53d
	cp a			;c53f
	nop			;c540
	nop			;c541
	nop			;c542
	nop			;c543
	inc bc			;c544
	push hl			;c545
	call m,000bfh		;c546
	nop			;c549
	nop			;c54a
	nop			;c54b
	inc bc			;c54c
	push hl			;c54d
	call m,000bfh		;c54e
	nop			;c551
	nop			;c552
	nop			;c553
	inc bc			;c554
	push hl			;c555
	call m,000bfh		;c556
	nop			;c559
	nop			;c55a
	nop			;c55b
	inc bc			;c55c
	push hl			;c55d
	ret p			;c55e
lc55fh:
	ld d,b			;c55f
	nop			;c560
	nop			;c561
	nop			;c562
	nop			;c563
	nop			;c564
	djnz $-14		;c565
lc567h:
	ld d,b			;c567
	nop			;c568
	nop			;c569
	nop			;c56a
	nop			;c56b
	nop			;c56c
	djnz lc55fh		;c56d
	ld d,b			;c56f
	nop			;c570
	nop			;c571
	nop			;c572
	nop			;c573
	nop			;c574
	djnz lc567h		;c575
	ld d,b			;c577
	nop			;c578
	nop			;c579
	nop			;c57a
	nop			;c57b
	nop			;c57c
	djnz $+1		;c57d
	ret p			;c57f
	nop			;c580
	nop			;c581
	nop			;c582
	nop			;c583
	nop			;c584
	dec bc			;c585
	rst 38h			;c586
	ret p			;c587
	nop			;c588
	nop			;c589
	nop			;c58a
	nop			;c58b
	nop			;c58c
	dec bc			;c58d
	rst 38h			;c58e
	ret p			;c58f
	nop			;c590
	nop			;c591
	nop			;c592
	nop			;c593
	nop			;c594
	dec bc			;c595
	rst 38h			;c596
	ret p			;c597
	nop			;c598
	nop			;c599
	nop			;c59a
	nop			;c59b
	nop			;c59c
	dec bc			;c59d
	rst 38h			;c59e
	or b			;c59f
	nop			;c5a0
	nop			;c5a1
	nop			;c5a2
	nop			;c5a3
	nop			;c5a4
	rrca			;c5a5
	rst 38h			;c5a6
	or b			;c5a7
	nop			;c5a8
	nop			;c5a9
	nop			;c5aa
	nop			;c5ab
	nop			;c5ac
	rrca			;c5ad
	rst 38h			;c5ae
	or b			;c5af
	nop			;c5b0
	nop			;c5b1
	nop			;c5b2
	nop			;c5b3
	nop			;c5b4
	rrca			;c5b5
	rst 38h			;c5b6
	or b			;c5b7
	nop			;c5b8
	nop			;c5b9
	nop			;c5ba
	nop			;c5bb
	nop			;c5bc
	rrca			;c5bd
	xor a			;c5be
	ld l,d			;c5bf
	xor d			;c5c0
	ld l,e			;c5c1
	rst 28h			;c5c2
	jp pe,ld7f5h		;c5c3
	ld e,a			;c5c6
	ld l,d			;c5c7
	xor d			;c5c8
	ld l,e			;c5c9
	rst 28h			;c5ca
	jp pe,ld7f5h		;c5cb
	ld e,a			;c5ce
	ld l,d			;c5cf
	xor d			;c5d0
	ld l,e			;c5d1
	rst 28h			;c5d2
	jp pe,ld7f5h		;c5d3
	ld e,a			;c5d6
	ld l,d			;c5d7
	xor d			;c5d8
	ld l,e			;c5d9
	rst 28h			;c5da
	jp pe,ld7f5h		;c5db
	add hl,sp		;c5de
	ld d,a			;c5df
	rst 10h			;c5e0
	rst 38h			;c5e1
	rst 38h			;c5e2
	rst 38h			;c5e3
	ld d,l			;c5e4
	rst 38h			;c5e5
	add hl,de		;c5e6
	ld d,a			;c5e7
	rst 10h			;c5e8
	rst 38h			;c5e9
	rst 38h			;c5ea
	rst 38h			;c5eb
	ld d,l			;c5ec
	rst 38h			;c5ed
	add hl,de		;c5ee
	ld d,a			;c5ef
	rst 10h			;c5f0
	rst 38h			;c5f1
	rst 38h			;c5f2
	rst 38h			;c5f3
	ld d,l			;c5f4
	rst 38h			;c5f5
	add hl,de		;c5f6
	ld d,a			;c5f7
	rst 10h			;c5f8
	rst 38h			;c5f9
	rst 38h			;c5fa
	rst 38h			;c5fb
	ld d,l			;c5fc
	rst 38h			;c5fd
	rst 20h			;c5fe
	jp m,lfefeh		;c5ff
	cp 0fah			;c602
	ei			;c604
	xor a			;c605
	rst 30h			;c606
	jp m,lfefeh		;c607
	cp 0fah			;c60a
	ei			;c60c
	xor a			;c60d
	rst 30h			;c60e
	jp m,lfefeh		;c60f
	cp 0fah			;c612
	ei			;c614
	xor a			;c615
	rst 30h			;c616
lc617h:
	jp m,lfefeh		;c617
	cp 0fah			;c61a
	ei			;c61c
	xor a			;c61d
	push hl			;c61e
	cp h			;c61f
	defb 0edh ;next byte illegal after ed	;c620
	ld l,(hl)		;c621
	rst 30h			;c622
	ld a,(hl)		;c623
	exx			;c624
	ld d,a			;c625
	ld (hl),l		;c626
	cp h			;c627
	defb 0edh ;next byte illegal after ed	;c628
	ld l,(hl)		;c629
	rst 30h			;c62a
	ld a,(hl)		;c62b
	exx			;c62c
	ld d,a			;c62d
	ld (hl),l		;c62e
	cp h			;c62f
	defb 0edh ;next byte illegal after ed	;c630
	ld l,(hl)		;c631
	rst 30h			;c632
	ld a,(hl)		;c633
	exx			;c634
	ld d,a			;c635
	ld (hl),l		;c636
	cp h			;c637
	defb 0edh ;next byte illegal after ed	;c638
	ld l,(hl)		;c639
	rst 30h			;c63a
	ld a,(hl)		;c63b
	exx			;c63c
	ld d,a			;c63d
	defb 0fdh,07ch ;ld a,iyh	;c63e
	nop			;c640
	nop			;c641
	nop			;c642
	nop			;c643
	ld bc,lfdeah		;c644
	ld a,h			;c647
	nop			;c648
	nop			;c649
	nop			;c64a
	nop			;c64b
	ld bc,lfdeah		;c64c
	ld a,h			;c64f
	nop			;c650
	nop			;c651
	nop			;c652
	nop			;c653
	ld bc,lfdeah		;c654
	ld a,h			;c657
	nop			;c658
	nop			;c659
	nop			;c65a
	nop			;c65b
	ld bc,01aeah		;c65c
	ret pe			;c65f
	nop			;c660
	nop			;c661
	nop			;c662
	nop			;c663
	nop			;c664
	ld a,(bc)		;c665
	ld a,(bc)		;c666
	ret pe			;c667
	nop			;c668
	nop			;c669
	nop			;c66a
	nop			;c66b
	nop			;c66c
	ld a,(bc)		;c66d
	ld a,(bc)		;c66e
	ret pe			;c66f
	nop			;c670
	nop			;c671
	nop			;c672
	nop			;c673
	nop			;c674
	ld a,(bc)		;c675
	ld a,(bc)		;c676
	ret pe			;c677
	nop			;c678
	nop			;c679
	nop			;c67a
	nop			;c67b
	nop			;c67c
	ld a,(bc)		;c67d
	rst 38h			;c67e
	ret p			;c67f
	nop			;c680
	nop			;c681
	nop			;c682
	nop			;c683
	nop			;c684
	rlca			;c685
	rst 38h			;c686
	ret p			;c687
	nop			;c688
	nop			;c689
	nop			;c68a
	nop			;c68b
	nop			;c68c
	rlca			;c68d
	rst 38h			;c68e
	ret p			;c68f
	nop			;c690
	nop			;c691
	nop			;c692
	nop			;c693
	nop			;c694
	rlca			;c695
	rst 38h			;c696
	ret p			;c697
	nop			;c698
	nop			;c699
	nop			;c69a
	nop			;c69b
	nop			;c69c
	rlca			;c69d
	rst 38h			;c69e
	ret nc			;c69f
	nop			;c6a0
	nop			;c6a1
	nop			;c6a2
	nop			;c6a3
	nop			;c6a4
	rrca			;c6a5
	rst 38h			;c6a6
	ret nc			;c6a7
	nop			;c6a8
	nop			;c6a9
	nop			;c6aa
	nop			;c6ab
	nop			;c6ac
	rrca			;c6ad
	rst 38h			;c6ae
	ret nc			;c6af
	nop			;c6b0
	nop			;c6b1
	nop			;c6b2
	nop			;c6b3
	nop			;c6b4
	rrca			;c6b5
	rst 38h			;c6b6
	ret nc			;c6b7
	nop			;c6b8
	nop			;c6b9
	nop			;c6ba
	nop			;c6bb
	nop			;c6bc
	rrca			;c6bd
	ld e,a			;c6be
	push af			;c6bf
	rst 10h			;c6c0
	rst 38h			;c6c1
	rst 38h			;c6c2
	rst 38h			;c6c3
	ld a,a			;c6c4
	xor a			;c6c5
	xor a			;c6c6
	push af			;c6c7
	rst 10h			;c6c8
	rst 38h			;c6c9
	rst 38h			;c6ca
	rst 38h			;c6cb
	ld a,a			;c6cc
	xor a			;c6cd
	xor a			;c6ce
	push af			;c6cf
	rst 10h			;c6d0
	rst 38h			;c6d1
	rst 38h			;c6d2
	rst 38h			;c6d3
	ld a,a			;c6d4
	xor a			;c6d5
	xor a			;c6d6
	push af			;c6d7
	rst 10h			;c6d8
	rst 38h			;c6d9
	rst 38h			;c6da
	rst 38h			;c6db
	ld a,a			;c6dc
	xor a			;c6dd
	ld b,d			;c6de
	cp a			;c6df
	rst 38h			;c6e0
	rst 38h			;c6e1
	rst 38h			;c6e2
	rst 38h			;c6e3
	rst 38h			;c6e4
	cp 0a2h			;c6e5
	cp a			;c6e7
	rst 38h			;c6e8
	rst 38h			;c6e9
	rst 38h			;c6ea
	rst 38h			;c6eb
	rst 38h			;c6ec
	cp 0a2h			;c6ed
	cp a			;c6ef
	rst 38h			;c6f0
	rst 38h			;c6f1
	rst 38h			;c6f2
	rst 38h			;c6f3
	rst 38h			;c6f4
	cp 0a2h			;c6f5
	cp a			;c6f7
	rst 38h			;c6f8
	rst 38h			;c6f9
	rst 38h			;c6fa
	rst 38h			;c6fb
	rst 38h			;c6fc
	cp 067h			;c6fd
	add a,(hl)		;c6ff
	jp po,0c2c2h		;c700
	adc a,0fbh		;c703
	ret pe			;c705
	scf			;c706
	add a,(hl)		;c707
	jp po,0c2c2h		;c708
	adc a,0fbh		;c70b
	ret pe			;c70d
	scf			;c70e
	add a,(hl)		;c70f
	jp po,0c2c2h		;c710
	adc a,0fbh		;c713
	ret pe			;c715
	scf			;c716
	add a,(hl)		;c717
	jp po,0c2c2h		;c718
	adc a,0fbh		;c71b
	ret pe			;c71d
	rst 20h			;c71e
	ld a,l			;c71f
	ld (hl),l		;c720
	cp (hl)			;c721
	ei			;c722
	cp l			;c723
	in a,(05bh)		;c724
	ld (hl),a		;c726
	ld a,l			;c727
	ld (hl),l		;c728
	cp (hl)			;c729
	ei			;c72a
	cp l			;c72b
	in a,(05bh)		;c72c
	ld (hl),a		;c72e
	ld a,l			;c72f
	ld (hl),l		;c730
	cp (hl)			;c731
	ei			;c732
	cp l			;c733
	in a,(05bh)		;c734
	ld (hl),a		;c736
	ld a,l			;c737
	ld (hl),l		;c738
	cp (hl)			;c739
	ei			;c73a
	cp l			;c73b
	in a,(05bh)		;c73c
	jp m,000f8h		;c73e
	nop			;c741
	nop			;c742
	nop			;c743
	nop			;c744
	push hl			;c745
	jp m,000f8h		;c746
	nop			;c749
	nop			;c74a
	nop			;c74b
	nop			;c74c
	push hl			;c74d
	jp m,000f8h		;c74e
	nop			;c751
	nop			;c752
	nop			;c753
	nop			;c754
	push hl			;c755
	jp m,000f8h		;c756
	nop			;c759
	nop			;c75a
	nop			;c75b
	nop			;c75c
	push hl			;c75d
	ld c,a			;c75e
	ex af,af'		;c75f
	nop			;c760
	nop			;c761
	nop			;c762
	nop			;c763
	nop			;c764
	rla			;c765
	xor a			;c766
	ex af,af'		;c767
	nop			;c768
	nop			;c769
	nop			;c76a
	nop			;c76b
	nop			;c76c
	rla			;c76d
	xor a			;c76e
	ex af,af'		;c76f
	nop			;c770
	nop			;c771
	nop			;c772
	nop			;c773
	nop			;c774
	rla			;c775
	xor a			;c776
	ex af,af'		;c777
	nop			;c778
	nop			;c779
	nop			;c77a
	nop			;c77b
	nop			;c77c
	rla			;c77d
	rst 38h			;c77e
	or b			;c77f
	nop			;c780
	nop			;c781
	nop			;c782
	nop			;c783
	nop			;c784
	rrca			;c785
	rst 38h			;c786
	or b			;c787
	nop			;c788
	nop			;c789
	nop			;c78a
	nop			;c78b
	nop			;c78c
	rrca			;c78d
	rst 38h			;c78e
	or b			;c78f
	nop			;c790
	nop			;c791
	nop			;c792
	nop			;c793
	nop			;c794
	rrca			;c795
	rst 38h			;c796
	or b			;c797
	nop			;c798
	nop			;c799
	nop			;c79a
	nop			;c79b
	nop			;c79c
	rrca			;c79d
	rst 38h			;c79e
	or b			;c79f
	nop			;c7a0
	nop			;c7a1
	nop			;c7a2
	nop			;c7a3
	nop			;c7a4
	rrca			;c7a5
	rst 38h			;c7a6
	or b			;c7a7
	nop			;c7a8
	nop			;c7a9
	nop			;c7aa
	nop			;c7ab
	nop			;c7ac
	rrca			;c7ad
	rst 38h			;c7ae
	or b			;c7af
	nop			;c7b0
	nop			;c7b1
	nop			;c7b2
	nop			;c7b3
	nop			;c7b4
	rrca			;c7b5
	rst 38h			;c7b6
	or b			;c7b7
	nop			;c7b8
	nop			;c7b9
	nop			;c7ba
	nop			;c7bb
	nop			;c7bc
	rrca			;c7bd
lc7beh:
	rst 38h			;c7be
	rst 38h			;c7bf
lc7c0h:
	rst 38h			;c7c0
	rst 38h			;c7c1
	rst 38h			;c7c2
	rst 38h			;c7c3
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c7c4
	rst 38h			;c7c7
	rst 38h			;c7c8
	rst 38h			;c7c9
	rst 38h			;c7ca
	rst 38h			;c7cb
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c7cc
	rst 38h			;c7cf
	rst 38h			;c7d0
	rst 38h			;c7d1
	rst 38h			;c7d2
	rst 38h			;c7d3
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c7d4
	rst 38h			;c7d7
	rst 38h			;c7d8
	rst 38h			;c7d9
	rst 38h			;c7da
	rst 38h			;c7db
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c7dc
	rst 38h			;c7df
	rst 38h			;c7e0
	jp pe,lffefh		;c7e1
	rst 38h			;c7e4
	jp (hl)			;c7e5
	ld a,a			;c7e6
	rst 38h			;c7e7
	rst 38h			;c7e8
	jp pe,lffefh		;c7e9
	rst 38h			;c7ec
	jp (hl)			;c7ed
	ld a,a			;c7ee
	rst 38h			;c7ef
	rst 38h			;c7f0
	jp pe,lffefh		;c7f1
	rst 38h			;c7f4
	jp (hl)			;c7f5
	ld a,a			;c7f6
	rst 38h			;c7f7
	rst 38h			;c7f8
	jp pe,lffefh		;c7f9
	rst 38h			;c7fc
	jp (hl)			;c7fd
	and h			;c7fe
	ld a,d			;c7ff
	sbc a,h			;c800
	cp h			;c801
	cp l			;c802
	or (hl)			;c803
	inc d			;c804
	ld h,a			;c805
	call nc,sub_9c7ah	;c806
	cp h			;c809
	cp l			;c80a
	or (hl)			;c80b
	inc d			;c80c
lc80dh:
	ld h,a			;c80d
	call nc,sub_9c7ah	;c80e
	cp h			;c811
	cp l			;c812
	or (hl)			;c813
	inc d			;c814
	ld h,a			;c815
	call nc,sub_9c7ah	;c816
	cp h			;c819
	cp l			;c81a
	or (hl)			;c81b
	inc d			;c81c
	ld h,a			;c81d
	jp lb879h		;c81e
	call m,sub_fd7eh	;c821
	rst 30h			;c824
	rst 8			;c825
	ex (sp),hl		;c826
	ld a,c			;c827
	cp b			;c828
	call m,sub_fd7eh	;c829
	rst 30h			;c82c
	rst 8			;c82d
	ex (sp),hl		;c82e
	ld a,c			;c82f
	cp b			;c830
	call m,sub_fd7eh	;c831
	rst 30h			;c834
	rst 8			;c835
	ex (sp),hl		;c836
	ld a,c			;c837
	cp b			;c838
	call m,sub_fd7eh	;c839
	rst 30h			;c83c
	rst 8			;c83d
	ld sp,hl		;c83e
	ret p			;c83f
	nop			;c840
	nop			;c841
	nop			;c842
	nop			;c843
	nop			;c844
	ld l,e			;c845
	ld sp,hl		;c846
	ret p			;c847
	nop			;c848
	nop			;c849
	nop			;c84a
	nop			;c84b
	nop			;c84c
	ld l,e			;c84d
	ld sp,hl		;c84e
	ret p			;c84f
	nop			;c850
	nop			;c851
	nop			;c852
	nop			;c853
	nop			;c854
	ld l,e			;c855
	ld sp,hl		;c856
lc857h:
	ret p			;c857
	nop			;c858
	nop			;c859
	nop			;c85a
	nop			;c85b
	nop			;c85c
	ld l,e			;c85d
	ret p			;c85e
lc85fh:
	ld d,b			;c85f
	nop			;c860
	nop			;c861
	nop			;c862
	nop			;c863
	nop			;c864
	djnz lc857h		;c865
lc867h:
	ld d,b			;c867
	nop			;c868
	nop			;c869
	nop			;c86a
	nop			;c86b
	nop			;c86c
	djnz lc85fh		;c86d
	ld d,b			;c86f
	nop			;c870
	nop			;c871
	nop			;c872
	nop			;c873
	nop			;c874
	djnz lc867h		;c875
	ld d,b			;c877
	nop			;c878
	nop			;c879
	nop			;c87a
	nop			;c87b
	nop			;c87c
	djnz $+1		;c87d
	ret p			;c87f
	nop			;c880
	nop			;c881
	nop			;c882
	nop			;c883
	nop			;c884
	rrca			;c885
	rst 38h			;c886
	ret p			;c887
	nop			;c888
	nop			;c889
	nop			;c88a
	nop			;c88b
	nop			;c88c
	rrca			;c88d
	rst 38h			;c88e
	ret p			;c88f
	nop			;c890
	nop			;c891
	nop			;c892
	nop			;c893
	nop			;c894
	rrca			;c895
	rst 38h			;c896
	ret p			;c897
	nop			;c898
	nop			;c899
	nop			;c89a
	nop			;c89b
	nop			;c89c
	rrca			;c89d
	rst 38h			;c89e
	ld d,b			;c89f
	nop			;c8a0
	nop			;c8a1
	nop			;c8a2
	nop			;c8a3
	nop			;c8a4
	rrca			;c8a5
	rst 38h			;c8a6
	ld d,b			;c8a7
	nop			;c8a8
	nop			;c8a9
	nop			;c8aa
	nop			;c8ab
	nop			;c8ac
	rrca			;c8ad
	rst 38h			;c8ae
	ld d,b			;c8af
	nop			;c8b0
	nop			;c8b1
	nop			;c8b2
	nop			;c8b3
	nop			;c8b4
	rrca			;c8b5
	rst 38h			;c8b6
sub_c8b7h:
	ld d,b			;c8b7
	nop			;c8b8
	nop			;c8b9
	nop			;c8ba
	nop			;c8bb
	nop			;c8bc
	rrca			;c8bd
	rst 38h			;c8be
	rst 38h			;c8bf
	rst 38h			;c8c0
	rst 38h			;c8c1
	rst 38h			;c8c2
	ld a,a			;c8c3
	jp p,sub_ff7fh		;c8c4
	rst 38h			;c8c7
	rst 38h			;c8c8
	rst 38h			;c8c9
	rst 38h			;c8ca
	ld a,a			;c8cb
	jp p,sub_ff7fh		;c8cc
	rst 38h			;c8cf
	rst 38h			;c8d0
	rst 38h			;c8d1
	rst 38h			;c8d2
	ld a,a			;c8d3
	jp p,sub_ff7fh		;c8d4
	rst 38h			;c8d7
	rst 38h			;c8d8
	rst 38h			;c8d9
	rst 38h			;c8da
	ld a,a			;c8db
	jp p,sub_ff7fh		;c8dc
	rst 38h			;c8df
	defb 0fdh,055h ;ld d,iyl	;c8e0
	rst 30h			;c8e2
	rst 38h			;c8e3
	rst 38h			;c8e4
	rst 38h			;c8e5
	rst 38h			;c8e6
	rst 38h			;c8e7
	defb 0fdh,055h ;ld d,iyl	;c8e8
	rst 30h			;c8ea
	rst 38h			;c8eb
	rst 38h			;c8ec
	rst 38h			;c8ed
	rst 38h			;c8ee
	rst 38h			;c8ef
	defb 0fdh,055h ;ld d,iyl	;c8f0
	rst 30h			;c8f2
	rst 38h			;c8f3
	rst 38h			;c8f4
	rst 38h			;c8f5
	rst 38h			;c8f6
	rst 38h			;c8f7
	defb 0fdh,055h ;ld d,iyl	;c8f8
	rst 30h			;c8fa
	rst 38h			;c8fb
	rst 38h			;c8fc
	rst 38h			;c8fd
	jp 06efch		;c8fe
	ld e,(hl)		;c901
	ld d,(hl)		;c902
	ld a,d			;c903
	ex (sp),hl		;c904
	xor e			;c905
	ex (sp),hl		;c906
	call m,05e6eh		;c907
	ld d,(hl)		;c90a
	ld a,d			;c90b
	ex (sp),hl		;c90c
	xor e			;c90d
	ex (sp),hl		;c90e
	call m,05e6eh		;c90f
	ld d,(hl)		;c912
	ld a,d			;c913
	ex (sp),hl		;c914
	xor e			;c915
	ex (sp),hl		;c916
	call m,05e6eh		;c917
	ld d,(hl)		;c91a
	ld a,d			;c91b
	ex (sp),hl		;c91c
	xor e			;c91d
	ret			;c91e
	or 0f0h			;c91f
	ld a,b			;c921
	inc a			;c922
	ld a,e			;c923
	rst 28h			;c924
	sub a			;c925
	jp (hl)			;c926
	or 0f0h			;c927
	ld a,b			;c929
	inc a			;c92a
	ld a,e			;c92b
	rst 28h			;c92c
	sub a			;c92d
	jp (hl)			;c92e
	or 0f0h			;c92f
	ld a,b			;c931
	inc a			;c932
	ld a,e			;c933
	rst 28h			;c934
	sub a			;c935
	jp (hl)			;c936
	or 0f0h			;c937
	ld a,b			;c939
	inc a			;c93a
	ld a,e			;c93b
	rst 28h			;c93c
	sub a			;c93d
	call m,000e0h		;c93e
	nop			;c941
	nop			;c942
	nop			;c943
	nop			;c944
	daa			;c945
	call m,000e0h		;c946
	nop			;c949
	nop			;c94a
	nop			;c94b
	nop			;c94c
	daa			;c94d
	call m,000e0h		;c94e
	nop			;c951
	nop			;c952
	nop			;c953
	nop			;c954
	daa			;c955
	call m,000e0h		;c956
	nop			;c959
	nop			;c95a
	nop			;c95b
	nop			;c95c
	daa			;c95d
	ld a,(bc)		;c95e
	add a,b			;c95f
	nop			;c960
	nop			;c961
	nop			;c962
	nop			;c963
	nop			;c964
	dec bc			;c965
	ld a,(bc)		;c966
	add a,b			;c967
	nop			;c968
	nop			;c969
	nop			;c96a
	nop			;c96b
	nop			;c96c
	dec bc			;c96d
	ld a,(bc)		;c96e
	add a,b			;c96f
	nop			;c970
	nop			;c971
	nop			;c972
	nop			;c973
	nop			;c974
	dec bc			;c975
	ld a,(bc)		;c976
	add a,b			;c977
	nop			;c978
	nop			;c979
	nop			;c97a
	nop			;c97b
	nop			;c97c
	dec bc			;c97d
	rst 38h			;c97e
	or b			;c97f
	nop			;c980
	nop			;c981
	nop			;c982
	nop			;c983
	nop			;c984
	rrca			;c985
	rst 38h			;c986
	or b			;c987
	nop			;c988
	nop			;c989
	nop			;c98a
	nop			;c98b
	nop			;c98c
	rrca			;c98d
	rst 38h			;c98e
	or b			;c98f
	nop			;c990
	nop			;c991
	nop			;c992
	nop			;c993
	nop			;c994
	rrca			;c995
	rst 38h			;c996
	or b			;c997
	nop			;c998
	nop			;c999
	nop			;c99a
	nop			;c99b
	nop			;c99c
	rrca			;c99d
	jp m,000b0h		;c99e
	nop			;c9a1
	nop			;c9a2
	nop			;c9a3
	nop			;c9a4
	rrca			;c9a5
	jp m,000b0h		;c9a6
	nop			;c9a9
	nop			;c9aa
	nop			;c9ab
	nop			;c9ac
	rrca			;c9ad
	jp m,000b0h		;c9ae
	nop			;c9b1
	nop			;c9b2
	nop			;c9b3
	nop			;c9b4
	rrca			;c9b5
	jp m,000b0h		;c9b6
	nop			;c9b9
	nop			;c9ba
	nop			;c9bb
	nop			;c9bc
	rrca			;c9bd
	rst 38h			;c9be
	rst 38h			;c9bf
	ei			;c9c0
	rst 38h			;c9c1
	cp 0bfh			;c9c2
	call sub_ff1fh		;c9c4
	rst 38h			;c9c7
	ei			;c9c8
	rst 38h			;c9c9
	cp 0bfh			;c9ca
	call sub_ff1fh		;c9cc
	rst 38h			;c9cf
	ei			;c9d0
	rst 38h			;c9d1
	cp 0bfh			;c9d2
	call sub_ff1fh		;c9d4
	rst 38h			;c9d7
	ei			;c9d8
	rst 38h			;c9d9
	cp 0bfh			;c9da
	call sub_ff1fh		;c9dc
	rst 38h			;c9df
	rst 38h			;c9e0
	rst 38h			;c9e1
	rst 38h			;c9e2
	rst 38h			;c9e3
	rst 38h			;c9e4
	rst 38h			;c9e5
	rst 38h			;c9e6
	rst 38h			;c9e7
	rst 38h			;c9e8
	rst 38h			;c9e9
	rst 38h			;c9ea
	rst 38h			;c9eb
	rst 38h			;c9ec
	rst 38h			;c9ed
	rst 38h			;c9ee
	rst 38h			;c9ef
	rst 38h			;c9f0
	rst 38h			;c9f1
	rst 38h			;c9f2
	rst 38h			;c9f3
	rst 38h			;c9f4
	rst 38h			;c9f5
	rst 38h			;c9f6
	rst 38h			;c9f7
	rst 38h			;c9f8
	rst 38h			;c9f9
	rst 38h			;c9fa
	rst 38h			;c9fb
	rst 38h			;c9fc
lc9fdh:
	rst 38h			;c9fd
	ret nz			;c9fe
	nop			;c9ff
	nop			;ca00
	nop			;ca01
	or b			;ca02
	nop			;ca03
	nop			;ca04
	nop			;ca05
	nop			;ca06
	nop			;ca07
	nop			;ca08
	nop			;ca09
	ret p			;ca0a
	nop			;ca0b
	nop			;ca0c
	nop			;ca0d
	and b			;ca0e
	nop			;ca0f
	nop			;ca10
	nop			;ca11
	ret p			;ca12
	nop			;ca13
	nop			;ca14
	nop			;ca15
	nop			;ca16
	nop			;ca17
	nop			;ca18
	nop			;ca19
	ret p			;ca1a
	nop			;ca1b
	nop			;ca1c
	nop			;ca1d
	and b			;ca1e
	nop			;ca1f
	nop			;ca20
	nop			;ca21
	ld (hl),b		;ca22
	nop			;ca23
	nop			;ca24
	nop			;ca25
	ret p			;ca26
	nop			;ca27
	nop			;ca28
	nop			;ca29
	ret p			;ca2a
	nop			;ca2b
	nop			;ca2c
	nop			;ca2d
	ret nc			;ca2e
	nop			;ca2f
	nop			;ca30
	nop			;ca31
	ret p			;ca32
	nop			;ca33
	nop			;ca34
	nop			;ca35
	ld d,b			;ca36
	nop			;ca37
	nop			;ca38
	nop			;ca39
	ret p			;ca3a
	nop			;ca3b
	nop			;ca3c
	nop			;ca3d
	ld d,b			;ca3e
	nop			;ca3f
	nop			;ca40
	nop			;ca41
	ld (hl),b		;ca42
	nop			;ca43
	nop			;ca44
	nop			;ca45
	or b			;ca46
	nop			;ca47
	nop			;ca48
	nop			;ca49
	ret p			;ca4a
	nop			;ca4b
	nop			;ca4c
	nop			;ca4d
	ret p			;ca4e
	nop			;ca4f
	nop			;ca50
	nop			;ca51
	ret p			;ca52
	nop			;ca53
	nop			;ca54
	nop			;ca55
	and b			;ca56
lca57h:
	nop			;ca57
	nop			;ca58
	nop			;ca59
	ret p			;ca5a
	nop			;ca5b
	nop			;ca5c
	nop			;ca5d
	ret po			;ca5e
	nop			;ca5f
	nop			;ca60
	nop			;ca61
	ret p			;ca62
	nop			;ca63
	nop			;ca64
	nop			;ca65
	ret p			;ca66
	nop			;ca67
	nop			;ca68
	nop			;ca69
	ret p			;ca6a
	nop			;ca6b
	nop			;ca6c
	nop			;ca6d
	ret p			;ca6e
	nop			;ca6f
	nop			;ca70
	nop			;ca71
	ret p			;ca72
	nop			;ca73
	nop			;ca74
	nop			;ca75
	ld d,b			;ca76
	nop			;ca77
	nop			;ca78
	nop			;ca79
	djnz lca7ch		;ca7a
lca7ch:
	nop			;ca7c
	nop			;ca7d
	ret p			;ca7e
	nop			;ca7f
	nop			;ca80
	nop			;ca81
	ld (hl),b		;ca82
	nop			;ca83
	nop			;ca84
	nop			;ca85
	ret p			;ca86
	nop			;ca87
	nop			;ca88
	nop			;ca89
	nop			;ca8a
	nop			;ca8b
	nop			;ca8c
	nop			;ca8d
	ret p			;ca8e
	nop			;ca8f
	nop			;ca90
	nop			;ca91
	ret p			;ca92
	nop			;ca93
	nop			;ca94
	nop			;ca95
	and b			;ca96
	nop			;ca97
	nop			;ca98
	nop			;ca99
	and b			;ca9a
	nop			;ca9b
	nop			;ca9c
	nop			;ca9d
	jr nc,lcaa0h		;ca9e
lcaa0h:
	nop			;caa0
	nop			;caa1
	ld (hl),b		;caa2
	nop			;caa3
	nop			;caa4
	nop			;caa5
	ret p			;caa6
	nop			;caa7
	nop			;caa8
	nop			;caa9
	and b			;caaa
	nop			;caab
	nop			;caac
	nop			;caad
	ret p			;caae
	nop			;caaf
	nop			;cab0
	nop			;cab1
	ret p			;cab2
	nop			;cab3
	nop			;cab4
	nop			;cab5
	ret p			;cab6
	nop			;cab7
	nop			;cab8
	nop			;cab9
	ld (hl),b		;caba
	nop			;cabb
	nop			;cabc
	nop			;cabd
	ret nc			;cabe
	nop			;cabf
	nop			;cac0
	nop			;cac1
	ret po			;cac2
	nop			;cac3
	nop			;cac4
	nop			;cac5
	ret p			;cac6
	nop			;cac7
lcac8h:
	nop			;cac8
	nop			;cac9
	ret p			;caca
	nop			;cacb
	nop			;cacc
	nop			;cacd
	ret p			;cace
	nop			;cacf
	nop			;cad0
	nop			;cad1
	ret p			;cad2
	nop			;cad3
	nop			;cad4
	nop			;cad5
	ret p			;cad6
	nop			;cad7
	nop			;cad8
	nop			;cad9
	ret p			;cada
	nop			;cadb
	nop			;cadc
	nop			;cadd
	ret po			;cade
	nop			;cadf
	nop			;cae0
	nop			;cae1
	ret po			;cae2
	nop			;cae3
	nop			;cae4
	nop			;cae5
	ret p			;cae6
	nop			;cae7
	nop			;cae8
	nop			;cae9
	nop			;caea
	nop			;caeb
	nop			;caec
	nop			;caed
	ret p			;caee
	nop			;caef
	nop			;caf0
	nop			;caf1
	ret p			;caf2
	nop			;caf3
	nop			;caf4
	nop			;caf5
	ret p			;caf6
	nop			;caf7
	nop			;caf8
	nop			;caf9
	ret p			;cafa
	nop			;cafb
	nop			;cafc
lcafdh:
	nop			;cafd
lcafeh:
	ld a,a			;cafe
	add a,e			;caff
	rst 0			;cb00
	jp 04b33h		;cb01
	ex de,hl		;cb04
	ex de,hl		;cb05
	ret nz			;cb06
	ret p			;cb07
	nop			;cb08
	nop			;cb09
	pop hl			;cb0a
	nop			;cb0b
	nop			;cb0c
	nop			;cb0d
	rra			;cb0e
	nop			;cb0f
	nop			;cb10
	nop			;cb11
	rst 38h			;cb12
	nop			;cb13
	nop			;cb14
	nop			;cb15
	dec b			;cb16
	nop			;cb17
	nop			;cb18
	djnz $+1		;cb19
	rst 38h			;cb1b
	adc a,a			;cb1c
	rst 38h			;cb1d
	dec (hl)		;cb1e
	ld b,(hl)		;cb1f
	xor (hl)		;cb20
	and (hl)		;cb21
	ld l,(hl)		;cb22
	defb 0edh ;next byte illegal after ed	;cb23
	or 09eh			;cb24
	di			;cb26
	call m,00000h		;cb27
	cp 080h			;cb2a
	nop			;cb2c
	nop			;cb2d
	rst 38h			;cb2e
	nop			;cb2f
	nop			;cb30
	nop			;cb31
	ei			;cb32
	nop			;cb33
	nop			;cb34
	nop			;cb35
	ret po			;cb36
	jr nz,lcb39h		;cb37
lcb39h:
	ld hl,(lfcffh)		;cb39
	ld d,c			;cb3c
	rst 38h			;cb3d
	ld a,(hl)		;cb3e
	and a			;cb3f
	ld l,a			;cb40
	ld l,a			;cb41
	ld a,l			;cb42
	ex de,hl		;cb43
	rst 10h			;cb44
	halt			;cb45
	push hl			;cb46
	ret m			;cb47
	nop			;cb48
	nop			;cb49
	ret p			;cb4a
	add a,b			;cb4b
	nop			;cb4c
	nop			;cb4d
	rst 38h			;cb4e
	nop			;cb4f
	nop			;cb50
	nop			;cb51
	defb 0fdh,000h,000h ;illegal sequence	;cb52
lcb55h:
	nop			;cb55
	ld sp,hl		;cb56
	ld d,l			;cb57
	ld bc,le855h		;cb58
	jp p,07baeh		;cb5b
	ld a,a			;cb5e
	ld c,a			;cb5f
	xor a			;cb60
	xor a			;cb61
	ld e,e			;cb62
	xor 0deh		;cb63
	ld sp,hl		;cb65
	set 6,b			;cb66
	nop			;cb68
	nop			;cb69
	dec b			;cb6a
	nop			;cb6b
	nop			;cb6c
	nop			;cb6d
	rst 38h			;cb6e
	nop			;cb6f
	nop			;cb70
	nop			;cb71
	ei			;cb72
	nop			;cb73
	nop			;cb74
	nop			;cb75
	or 0aah			;cb76
	and (hl)		;cb78
	cp (hl)			;cb79
	sub l			;cb7a
	ld a,l			;cb7b
	ld a,a			;cb7c
	rst 38h			;cb7d
	ld a,a			;cb7e
	xor a			;cb7f
	rst 28h			;cb80
	rst 28h			;cb81
	ld e,e			;cb82
	adc a,0d6h		;cb83
	rst 28h			;cb85
	rst 10h			;cb86
	ret nz			;cb87
	nop			;cb88
	nop			;cb89
	xor (hl)		;cb8a
	add a,b			;cb8b
	nop			;cb8c
	nop			;cb8d
	rst 38h			;cb8e
	nop			;cb8f
	nop			;cb90
	nop			;cb91
	defb 0fdh,000h,000h ;illegal sequence	;cb92
	nop			;cb95
	rst 38h			;cb96
	ld e,l			;cb97
	ld a,a			;cb98
	rst 38h			;cb99
	dec hl			;cb9a
	rst 38h			;cb9b
	rst 38h			;cb9c
	rst 38h			;cb9d
	ld a,b			;cb9e
	ld l,(hl)		;cb9f
	inc l			;cba0
	inc l			;cba1
	ld (hl),a		;cba2
	rst 10h			;cba3
	ld e,e			;cba4
	rst 28h			;cba5
	xor a			;cba6
	add a,b			;cba7
	nop			;cba8
	nop			;cba9
	ret p			;cbaa
	add a,b			;cbab
	nop			;cbac
	nop			;cbad
	ei			;cbae
	nop			;cbaf
	nop			;cbb0
	nop			;cbb1
	ei			;cbb2
	nop			;cbb3
	nop			;cbb4
	nop			;cbb5
	rst 38h			;cbb6
	rst 38h			;cbb7
	rst 38h			;cbb8
	rst 38h			;cbb9
	rst 38h			;cbba
	rst 38h			;cbbb
	cp 0aeh			;cbbc
	ld b,a			;cbbe
	xor c			;cbbf
	set 1,e			;cbc0
	scf			;cbc2
	sbc a,e			;cbc3
	adc a,a			;cbc4
	rst 0			;cbc5
	sbc a,a			;cbc6
	nop			;cbc7
	nop			;cbc8
	nop			;cbc9
	dec b			;cbca
	nop			;cbcb
	nop			;cbcc
	nop			;cbcd
	rst 38h			;cbce
	nop			;cbcf
	nop			;cbd0
	nop			;cbd1
	push af			;cbd2
	nop			;cbd3
	nop			;cbd4
	nop			;cbd5
	rst 38h			;cbd6
	rst 38h			;cbd7
	rst 38h			;cbd8
	rst 38h			;cbd9
	rst 38h			;cbda
	rst 38h			;cbdb
	push de			;cbdc
	ld e,a			;cbdd
	ccf			;cbde
	add a,0e5h		;cbdf
	push hl			;cbe1
	sbc a,a			;cbe2
	ld l,a			;cbe3
	rlca			;cbe4
	add a,e			;cbe5
	adc a,000h		;cbe6
	nop			;cbe8
	nop			;cbe9
	xor b			;cbea
	nop			;cbeb
	nop			;cbec
	nop			;cbed
	ei			;cbee
	nop			;cbef
	nop			;cbf0
	nop			;cbf1
	xor e			;cbf2
	nop			;cbf3
	nop			;cbf4
	nop			;cbf5
	rst 38h			;cbf6
	rst 38h			;cbf7
	cp a			;cbf8
	rst 38h			;cbf9
	rst 38h			;cbfa
	rst 38h			;cbfb
	rst 38h			;cbfc
	rst 38h			;cbfd
	rst 0			;cbfe
	add a,a			;cbff
	inc e			;cc00
	ld a,h			;cc01
	ld l,d			;cc02
	in a,(054h)		;cc03
	ei			;cc05
	nop			;cc06
	ld bc,08006h		;cc07
	nop			;cc0a
	nop			;cc0b
	ld bc,000bfh		;cc0c
	nop			;cc0f
	nop			;cc10
	ld e,d			;cc11
	nop			;cc12
	nop			;cc13
	nop			;cc14
	rst 38h			;cc15
	nop			;cc16
	djnz lcc19h		;cc17
lcc19h:
	ret p			;cc19
	rst 30h			;cc1a
	rst 38h			;cc1b
	jp pe,la7bfh		;cc1c
	ld c,(hl)		;cc1f
	or h			;cc20
	jp pe,0daeeh		;cc21
	xor (hl)		;cc24
	or a			;cc25
	nop			;cc26
	nop			;cc27
	cp 07fh			;cc28
	nop			;cc2a
	nop			;cc2b
	nop			;cc2c
	rst 38h			;cc2d
	nop			;cc2e
	nop			;cc2f
	nop			;cc30
	cp l			;cc31
	nop			;cc32
	nop			;cc33
	nop			;cc34
	rst 38h			;cc35
	ld (040abh),hl		;cc36
	push hl			;cc39
	rst 38h			;cc3a
	ld d,a			;cc3b
	rst 38h			;cc3c
	rst 38h			;cc3d
	ld l,a			;cc3e
	xor l			;cc3f
	cp d			;cc40
	push af			;cc41
	push af			;cc42
	out (09eh),a		;cc43
	rst 30h			;cc45
	nop			;cc46
	nop			;cc47
	ld a,(hl)		;cc48
	xor e			;cc49
	nop			;cc4a
	nop			;cc4b
	ld bc,0007fh		;cc4c
	nop			;cc4f
	nop			;cc50
	ld a,a			;cc51
	nop			;cc52
	nop			;cc53
	nop			;cc54
	rst 38h			;cc55
	ld e,l			;cc56
	ld d,(hl)		;cc57
	cp d			;cc58
	ld a,(bc)		;cc59
	cp 0abh			;cc5a
	rst 38h			;cc5c
	rst 38h			;cc5d
	xor a			;cc5e
	xor 0beh		;cc5f
	cp 07bh			;cc61
	in a,(0bdh)		;cc63
	ld l,a			;cc65
	nop			;cc66
	nop			;cc67
	ld a,05fh		;cc68
	nop			;cc6a
	nop			;cc6b
	ld bc,0000fh		;cc6c
	nop			;cc6f
	nop			;cc70
	cp a			;cc71
	nop			;cc72
	nop			;cc73
	nop			;cc74
	rst 38h			;cc75
	cp 0afh			;cc76
	ld e,l			;cc78
	ld (hl),l		;cc79
	rst 38h			;cc7a
	push af			;cc7b
	ld e,a			;cc7c
	pop af			;cc7d
	rst 28h			;cc7e
	xor a			;cc7f
	cp d			;cc80
	rst 38h			;cc81
	ld (hl),a		;cc82
	defb 0edh ;next byte illegal after ed	;cc83
	sub l			;cc84
	ld (hl),a		;cc85
	nop			;cc86
	nop			;cc87
	ld e,0afh		;cc88
	nop			;cc8a
	nop			;cc8b
	nop			;cc8c
	and b			;cc8d
	nop			;cc8e
	nop			;cc8f
	nop			;cc90
	ld a,a			;cc91
	nop			;cc92
	nop			;cc93
	nop			;cc94
	rst 38h			;cc95
	rst 38h			;cc96
	rst 30h			;cc97
	jp m,lfffah		;cc98
	rst 38h			;cc9b
	rst 38h			;cc9c
	jp pe,lef2ch		;cc9d
	cp (hl)			;cca0
	add a,e			;cca1
	cp e			;cca2
	defb 0ddh,0b5h ;or ixl	;cca3
	or a			;cca5
	nop			;cca6
	nop			;cca7
	ld c,05fh		;cca8
	nop			;ccaa
	nop			;ccab
	ld bc,0007ah		;ccac
	nop			;ccaf
	nop			;ccb0
	rst 38h			;ccb1
	nop			;ccb2
	nop			;ccb3
	nop			;ccb4
	rst 38h			;ccb5
	rst 38h			;ccb6
	rst 38h			;ccb7
	rst 18h			;ccb8
	rst 38h			;ccb9
	rst 38h			;ccba
	rst 38h			;ccbb
	cp 097h			;ccbc
	in a,(061h)		;ccbe
	ld b,(hl)		;ccc0
	ld a,l			;ccc1
	rst 28h			;ccc2
	rst 18h			;ccc3
	ld a,h			;ccc4
	cp 000h			;ccc5
	nop			;ccc7
	ld b,0bfh		;ccc8
	nop			;ccca
	nop			;cccb
	ld bc,0000fh		;cccc
	nop			;cccf
	nop			;ccd0
	rst 38h			;ccd1
	nop			;ccd2
	nop			;ccd3
	nop			;ccd4
	rst 38h			;ccd5
	rst 30h			;ccd6
	rst 38h			;ccd7
	daa			;ccd8
	rst 38h			;ccd9
	ld a,a			;ccda
	rst 38h			;ccdb
	rst 38h			;ccdc
	rst 38h			;ccdd
	ld h,a			;ccde
	xor (hl)		;ccdf
	ld a,(lc7beh)		;cce0
	cp (hl)			;cce3
	ld sp,hl		;cce4
	ld a,(hl)		;cce5
sub_cce6h:
	nop			;cce6
	nop			;cce7
	ld (bc),a		;cce8
	ld a,a			;cce9
	nop			;ccea
	nop			;cceb
	nop			;ccec
	or b			;cced
	nop			;ccee
	nop			;ccef
	nop			;ccf0
	rst 38h			;ccf1
	nop			;ccf2
	nop			;ccf3
	nop			;ccf4
	rst 38h			;ccf5
	ex de,hl		;ccf6
	call m,sub_ffd1h	;ccf7
	rst 38h			;ccfa
	rst 38h			;ccfb
	rst 38h			;ccfc
	rst 38h			;ccfd
	ld a,a			;ccfe
	nop			;ccff
	nop			;cd00
	nop			;cd01
	ld h,(hl)		;cd02
	and a			;cd03
	cp h			;cd04
	nop			;cd05
	add a,c			;cd06
	ex (sp),hl		;cd07
	ld a,d			;cd08
	nop			;cd09
	jp nz,07605h		;cd0a
	nop			;cd0d
	ld a,000h		;cd0e
	nop			;cd10
	nop			;cd11
	cp 000h			;cd12
	nop			;cd14
	nop			;cd15
	ld a,(bc)		;cd16
	nop			;cd17
	nop			;cd18
	jr nz,$+1		;cd19
	rst 38h			;cd1b
	rra			;cd1c
	rst 38h			;cd1d
	ld l,d			;cd1e
	add a,b			;cd1f
	nop			;cd20
	nop			;cd21
	rst 18h			;cd22
	ld e,d			;cd23
	or h			;cd24
	nop			;cd25
	rst 20h			;cd26
	ld a,(iy+000h)		;cd27
	defb 0fdh,003h,076h ;illegal sequence	;cd2a
	nop			;cd2d
	cp 000h			;cd2e
	nop			;cd30
	nop			;cd31
	or 000h			;cd32
	nop			;cd34
	nop			;cd35
	ret nz			;cd36
	ld b,b			;cd37
	nop			;cd38
	ld d,h			;cd39
	rst 38h			;cd3a
	ret m			;cd3b
	and e			;cd3c
	rst 38h			;cd3d
	ld c,(iy+000h)		;cd3e
	nop			;cd41
	ei			;cd42
	ld l,a			;cd43
	ld l,000h		;cd44
	set 6,d			;cd46
	cp (hl)			;cd48
	nop			;cd49
	pop hl			;cd4a
	ld bc,0007ah		;cd4b
	cp 000h			;cd4e
	nop			;cd50
	nop			;cd51
	jp m,00000h		;cd52
	nop			;cd55
	jp p,002aah		;cd56
	xor d			;cd59
	pop de			;cd5a
	push hl			;cd5b
	ld e,h			;cd5c
	rst 30h			;cd5d
	jp m,lc092h		;cd5e
	nop			;cd61
	or l			;cd62
	ld (hl),a		;cd63
	sbc a,(hl)		;cd64
	nop			;cd65
	sub a			;cd66
	defb 0edh ;next byte illegal after ed	;cd67
	ld e,h			;cd68
	nop			;cd69
	ld a,(bc)		;cd6a
	ld bc,000beh		;cd6b
	cp 000h			;cd6e
	nop			;cd70
	nop			;cd71
	or 000h			;cd72
	nop			;cd74
	nop			;cd75
	defb 0edh ;next byte illegal after ed	;cd76
	ld d,l			;cd77
	ld c,l			;cd78
	ld a,l			;cd79
	ld hl,(lfffah)		;cd7a
	rst 38h			;cd7d
	rst 38h			;cd7e
	ld e,l			;cd7f
	ld h,b			;cd80
	nop			;cd81
	or (hl)			;cd82
	xor a			;cd83
	and d			;cd84
	nop			;cd85
	xor a			;cd86
	adc a,(hl)		;cd87
	ret z			;cd88
	nop			;cd89
	ld e,l			;cd8a
	nop			;cd8b
	or h			;cd8c
	nop			;cd8d
	cp 000h			;cd8e
	nop			;cd90
	nop			;cd91
	jp m,00000h		;cd92
	nop			;cd95
	cp 0bah			;cd96
	rst 38h			;cd98
	rst 38h			;cd99
	ld d,a			;cd9a
	rst 38h			;cd9b
	rst 38h			;cd9c
	rst 38h			;cd9d
	ret p			;cd9e
	cp 098h			;cd9f
	nop			;cda1
	jp pe,05cbbh		;cda2
	nop			;cda5
	ld e,a			;cda6
	rrca			;cda7
	or h			;cda8
	nop			;cda9
	pop hl			;cdaa
	nop			;cdab
	ld e,b			;cdac
	nop			;cdad
	or 000h			;cdae
	nop			;cdb0
	nop			;cdb1
	or 000h			;cdb2
	nop			;cdb4
	nop			;cdb5
	rst 38h			;cdb6
	rst 38h			;cdb7
	rst 38h			;cdb8
	rst 38h			;cdb9
	rst 38h			;cdba
	rst 38h			;cdbb
	defb 0fdh,05dh ;ld e,iyl	;cdbc
	adc a,a			;cdbe
	ld a,a			;cdbf
	cp h			;cdc0
	nop			;cdc1
	ld l,l			;cdc2
	dec sp			;cdc3
	halt			;cdc4
	nop			;cdc5
	ld a,007h		;cdc6
	ld e,b			;cdc8
	nop			;cdc9
	ld a,(bc)		;cdca
	nop			;cdcb
	jr nc,lcdceh		;cdcc
lcdceh:
	cp 000h			;cdce
	nop			;cdd0
	nop			;cdd1
	jp pe,00000h		;cdd2
	nop			;cdd5
	rst 38h			;cdd6
	rst 38h			;cdd7
	rst 38h			;cdd8
	rst 38h			;cdd9
	rst 38h			;cdda
	rst 38h			;cddb
	xor d			;cddc
	cp (hl)			;cddd
	ld a,l			;cdde
	cp b			;cddf
	or h			;cde0
	nop			;cde1
	ld a,0dch		;cde2
	cp d			;cde4
	nop			;cde5
	sbc a,h			;cde6
	ld b,0ach		;cde7
	nop			;cde9
	ld d,b			;cdea
	nop			;cdeb
	nop			;cdec
	nop			;cded
	or 000h			;cdee
	nop			;cdf0
	nop			;cdf1
	ld d,(hl)		;cdf2
	nop			;cdf3
	nop			;cdf4
	nop			;cdf5
	rst 38h			;cdf6
	rst 38h			;cdf7
	ld a,a			;cdf8
	rst 38h			;cdf9
	rst 38h			;cdfa
	rst 38h			;cdfb
	rst 38h			;cdfc
	rst 38h			;cdfd
	nop			;cdfe
	nop			;cdff
	nop			;ce00
	ret m			;ce01
	nop			;ce02
	ld a,l			;ce03
	ld de,000f6h		;ce04
	push af			;ce07
	defb 0fdh,003h,000h ;illegal sequence	;ce08
	ld b,h			;ce0b
	sbc a,e			;ce0c
	ld a,a			;ce0d
	ld bc,000ech		;ce0e
	or l			;ce11
	nop			;ce12
	or (hl)			;ce13
	ld bc,000ffh		;ce14
	jr nz,lce1ah		;ce17
	ret po			;ce19
lce1ah:
	rst 28h			;ce1a
	rst 38h			;ce1b
	push de			;ce1c
	ld a,a			;ce1d
	nop			;ce1e
	nop			;ce1f
	ld bc,000d4h		;ce20
	ld a,b			;ce23
	push hl			;ce24
	ld l,(hl)		;ce25
	nop			;ce26
	rst 30h			;ce27
	call pe,000ffh		;ce28
	ld b,l			;ce2b
	add hl,de		;ce2c
	rst 38h			;ce2d
	ld bc,001f4h		;ce2e
	ld a,e			;ce31
	nop			;ce32
	call z,0ff01h		;ce33
	ld b,l			;ce36
	ld d,(hl)		;ce37
	add a,c			;ce38
	jp z,laffeh		;ce39
	rst 38h			;ce3c
	rst 38h			;ce3d
	nop			;ce3e
	inc c			;ce3f
	ld (hl),l		;ce40
	jp pe,04500h		;ce41
	ld d,l			;ce44
	xor 000h		;ce45
	cp d			;ce47
	defb 0fdh,057h,000h ;illegal sequence	;ce48
	ld b,h			;ce4b
	ld a,(de)		;ce4c
	rst 38h			;ce4d
	ld bc,000f8h		;ce4e
	rst 38h			;ce51
	nop			;ce52
	ld a,h			;ce53
	ld bc,lbaffh		;ce54
	xor l			;ce57
	ld (hl),h		;ce58
	dec d			;ce59
	defb 0fdh,057h,0ffh ;illegal sequence	;ce5a
	rst 38h			;ce5d
	nop			;ce5e
	ld a,0d5h		;ce5f
	call m,03a00h		;ce61
	or d			;ce64
	sbc a,000h		;ce65
	ld (hl),l		;ce67
	ld a,h			;ce68
	cp a			;ce69
	nop			;ce6a
	ld b,h			;ce6b
	ld a,(bc)		;ce6c
	rra			;ce6d
	ld bc,0018ch		;ce6e
	ld a,a			;ce71
	nop			;ce72
	inc b			;ce73
	ld bc,lfdffh		;ce74
	ld e,(hl)		;ce77
	cp d			;ce78
	jp pe,leaffh		;ce79
	cp a			;ce7c
	ex (sp),hl		;ce7d
	nop			;ce7e
	ld a,0e5h		;ce7f
	cp 000h			;ce81
	ld l,072h		;ce83
	xor 000h		;ce85
	ld b,h			;ce87
	cp l			;ce88
	ld e,a			;ce89
	nop			;ce8a
	ld b,h			;ce8b
	add hl,bc		;ce8c
	ld b,c			;ce8d
	ld bc,00074h		;ce8e
	rst 38h			;ce91
	nop			;ce92
	inc b			;ce93
	ld bc,lffffh		;ce94
	rst 28h			;ce97
	push af			;ce98
	push af			;ce99
	rst 38h			;ce9a
	rst 38h			;ce9b
	rst 38h			;ce9c
	call nc,03a00h		;ce9d
	push af			;cea0
	ld b,000h		;cea1
	ld l,(hl)		;cea3
	di			;cea4
	ld l,(hl)		;cea5
	nop			;cea6
	ld b,l			;cea7
	ld e,h			;cea8
	cp a			;cea9
	nop			;ceaa
	and h			;ceab
	ld a,(bc)		;ceac
	call p,sub_da01h	;cead
	ld bc,000ffh		;ceb0
	nop			;ceb3
	ld bc,lffffh		;ceb4
	rst 38h			;ceb7
	cp a			;ceb8
	rst 38h			;ceb9
	rst 38h			;ceba
	rst 38h			;cebb
	defb 0fdh,02fh,000h ;illegal sequence	;cebc
	halt			;cebf
	call po,000fah		;cec0
	ld c,(hl)		;cec3
	ld d,c			;cec4
	call m,04400h		;cec5
	xor l			;cec8
	ld a,a			;cec9
	ld bc,00ae4h		;ceca
	rra			;cecd
	ld bc,0016ah		;cece
	rst 38h			;ced1
	nop			;ced2
	nop			;ced3
	ld bc,lefffh		;ced4
	cp 04fh			;ced7
	rst 38h			;ced9
	rst 38h			;ceda
	rst 38h			;cedb
	rst 38h			;cedc
	rst 38h			;cedd
	nop			;cede
	ld a,(hl)		;cedf
	push af			;cee0
	ld a,h			;cee1
	nop			;cee2
	xor 0d2h		;cee3
	call m,04500h		;cee5
	inc d			;cee8
	rst 38h			;cee9
	ld bc,009d4h		;ceea
	ld h,b			;ceed
	ld bc,001fah		;ceee
	rst 38h			;cef1
	nop			;cef2
	nop			;cef3
	ld bc,ld7ffh		;cef4
	ld sp,hl		;cef7
	and e			;cef8
	rst 38h			;cef9
	rst 38h			;cefa
	rst 38h			;cefb
	rst 38h			;cefc
	rst 38h			;cefd
	nop			;cefe
	nop			;ceff
	nop			;cf00
	nop			;cf01
	nop			;cf02
	nop			;cf03
	nop			;cf04
	nop			;cf05
	nop			;cf06
	nop			;cf07
	nop			;cf08
	nop			;cf09
	nop			;cf0a
	nop			;cf0b
	nop			;cf0c
	nop			;cf0d
lcf0eh:
	nop			;cf0e
	nop			;cf0f
	nop			;cf10
	nop			;cf11
	nop			;cf12
	nop			;cf13
	nop			;cf14
	nop			;cf15
	nop			;cf16
	nop			;cf17
	nop			;cf18
	nop			;cf19
	nop			;cf1a
	nop			;cf1b
	nop			;cf1c
	nop			;cf1d
	nop			;cf1e
	nop			;cf1f
	nop			;cf20
	nop			;cf21
	nop			;cf22
	nop			;cf23
	pop hl			;cf24
	nop			;cf25
	nop			;cf26
	nop			;cf27
	nop			;cf28
	cpl			;cf29
	cp 0eeh			;cf2a
	sub l			;cf2c
	ld e,h			;cf2d
	rst 38h			;cf2e
	rst 38h			;cf2f
	rst 38h			;cf30
	rst 38h			;cf31
	rst 38h			;cf32
	rst 38h			;cf33
	rst 38h			;cf34
	rst 38h			;cf35
	cp 0aah			;cf36
	add a,b			;cf38
	nop			;cf39
	nop			;cf3a
	nop			;cf3b
	nop			;cf3c
	nop			;cf3d
lcf3eh:
	nop			;cf3e
lcf3fh:
	nop			;cf3f
	nop			;cf40
	nop			;cf41
	nop			;cf42
	nop			;cf43
	nop			;cf44
	nop			;cf45
	nop			;cf46
	nop			;cf47
	nop			;cf48
	nop			;cf49
	nop			;cf4a
	nop			;cf4b
	nop			;cf4c
	nop			;cf4d
	nop			;cf4e
	nop			;cf4f
	nop			;cf50
	nop			;cf51
	nop			;cf52
	nop			;cf53
	nop			;cf54
	nop			;cf55
	nop			;cf56
	nop			;cf57
	nop			;cf58
	nop			;cf59
	nop			;cf5a
	nop			;cf5b
	nop			;cf5c
	nop			;cf5d
	nop			;cf5e
	nop			;cf5f
	nop			;cf60
	nop			;cf61
	nop			;cf62
	nop			;cf63
	nop			;cf64
	nop			;cf65
	nop			;cf66
	nop			;cf67
	nop			;cf68
	nop			;cf69
	nop			;cf6a
	nop			;cf6b
	nop			;cf6c
	nop			;cf6d
	nop			;cf6e
	inc bc			;cf6f
	nop			;cf70
	nop			;cf71
	nop			;cf72
	nop			;cf73
	nop			;cf74
	nop			;cf75
	nop			;cf76
	nop			;cf77
	nop			;cf78
	nop			;cf79
	nop			;cf7a
	nop			;cf7b
	nop			;cf7c
	nop			;cf7d
	nop			;cf7e
	nop			;cf7f
	nop			;cf80
	dec c			;cf81
	ld c,0beh		;cf82
	cp d			;cf84
	ld a,h			;cf85
	or b			;cf86
	nop			;cf87
	and e			;cf88
	call m,sub_e6efh	;cf89
	ld a,a			;cf8c
	rst 38h			;cf8d
	ld c,h			;cf8e
	adc a,a			;cf8f
	rst 38h			;cf90
	rst 38h			;cf91
	rst 38h			;cf92
	rst 38h			;cf93
	rst 38h			;cf94
	rst 38h			;cf95
	rst 38h			;cf96
	jp pe,000d0h		;cf97
	nop			;cf9a
	nop			;cf9b
	nop			;cf9c
	nop			;cf9d
	nop			;cf9e
	ld bc,00020h		;cf9f
	nop			;cfa2
	nop			;cfa3
	nop			;cfa4
	rst 38h			;cfa5
	ret nz			;cfa6
	nop			;cfa7
	ld l,h			;cfa8
	nop			;cfa9
	nop			;cfaa
	nop			;cfab
	nop			;cfac
	nop			;cfad
	nop			;cfae
	nop			;cfaf
	nop			;cfb0
	nop			;cfb1
	nop			;cfb2
	nop			;cfb3
	nop			;cfb4
	nop			;cfb5
	nop			;cfb6
	nop			;cfb7
	nop			;cfb8
	nop			;cfb9
	nop			;cfba
	nop			;cfbb
	nop			;cfbc
	nop			;cfbd
	nop			;cfbe
	nop			;cfbf
	nop			;cfc0
	nop			;cfc1
	nop			;cfc2
	nop			;cfc3
	nop			;cfc4
	nop			;cfc5
	nop			;cfc6
	nop			;cfc7
	nop			;cfc8
	nop			;cfc9
	nop			;cfca
	nop			;cfcb
	nop			;cfcc
	nop			;cfcd
	nop			;cfce
	dec bc			;cfcf
	ld h,b			;cfd0
	nop			;cfd1
	nop			;cfd2
	nop			;cfd3
	nop			;cfd4
	nop			;cfd5
	nop			;cfd6
	nop			;cfd7
	nop			;cfd8
	nop			;cfd9
	nop			;cfda
	nop			;cfdb
	nop			;cfdc
	nop			;cfdd
	nop			;cfde
	nop			;cfdf
	ei			;cfe0
	and a			;cfe1
	cp 005h			;cfe2
	call m,07bc7h		;cfe4
	adc a,a			;cfe7
	ld sp,hl		;cfe8
	rst 28h			;cfe9
	rst 38h			;cfea
	or c			;cfeb
	rst 38h			;cfec
	rst 38h			;cfed
	rst 38h			;cfee
	rst 8			;cfef
	and e			;cff0
	ret m			;cff1
	dec bc			;cff2
	rst 38h			;cff3
	rst 38h			;cff4
	rst 38h			;cff5
	rst 38h			;cff6
	jp pe,0009dh		;cff7
	nop			;cffa
	nop			;cffb
	nop			;cffc
	nop			;cffd
	nop			;cffe
	nop			;cfff
	jp p,00000h		;d000
	nop			;d003
	nop			;d004
	rrca			;d005
	cp a			;d006
	ret pe			;d007
	ld d,080h		;d008
	nop			;d00a
	nop			;d00b
	nop			;d00c
	nop			;d00d
	nop			;d00e
	nop			;d00f
	nop			;d010
	nop			;d011
	nop			;d012
	nop			;d013
	nop			;d014
	nop			;d015
	nop			;d016
	nop			;d017
	nop			;d018
	nop			;d019
	nop			;d01a
	nop			;d01b
	nop			;d01c
	nop			;d01d
	nop			;d01e
	nop			;d01f
	nop			;d020
	nop			;d021
	nop			;d022
	nop			;d023
	nop			;d024
	nop			;d025
	nop			;d026
	nop			;d027
	nop			;d028
	nop			;d029
	nop			;d02a
	nop			;d02b
	nop			;d02c
	nop			;d02d
	nop			;d02e
	add hl,de		;d02f
	and h			;d030
	nop			;d031
	nop			;d032
	nop			;d033
	nop			;d034
	nop			;d035
	nop			;d036
	nop			;d037
	nop			;d038
	nop			;d039
	nop			;d03a
	nop			;d03b
	nop			;d03c
	nop			;d03d
	ld b,066h		;d03e
	ld a,c			;d040
	ld sp,hl		;d041
	adc a,h			;d042
	adc a,01fh		;d043
	ld c,03fh		;d045
	ld sp,hl		;d047
	rst 28h			;d048
	rst 38h			;d049
	ld sp,hl		;d04a
	sbc a,a			;d04b
	rst 38h			;d04c
	rst 38h			;d04d
	rst 38h			;d04e
	rst 38h			;d04f
	rst 0			;d050
	call po,0633fh		;d051
	sbc a,(hl)		;d054
	adc a,a			;d055
	rst 38h			;d056
	rst 38h			;d057
	and e			;d058
	ret po			;d059
	nop			;d05a
	nop			;d05b
	nop			;d05c
	nop			;d05d
	nop			;d05e
	nop			;d05f
	dec b			;d060
	or 080h			;d061
	rra			;d063
ld064h:
	rst 38h			;d064
	rst 20h			;d065
	ld (hl),a		;d066
	rst 38h			;d067
	cpl			;d068
	ld b,b			;d069
	nop			;d06a
	nop			;d06b
	nop			;d06c
	nop			;d06d
	nop			;d06e
	nop			;d06f
	nop			;d070
	nop			;d071
	nop			;d072
	nop			;d073
	nop			;d074
	nop			;d075
	nop			;d076
	nop			;d077
	nop			;d078
	nop			;d079
	nop			;d07a
	nop			;d07b
	nop			;d07c
	nop			;d07d
	nop			;d07e
	nop			;d07f
	nop			;d080
	nop			;d081
	nop			;d082
	nop			;d083
	nop			;d084
	nop			;d085
	nop			;d086
	nop			;d087
	nop			;d088
	nop			;d089
	nop			;d08a
	nop			;d08b
	nop			;d08c
	nop			;d08d
	nop			;d08e
	ld e,068h		;d08f
	nop			;d091
	nop			;d092
	nop			;d093
ld094h:
	nop			;d094
	nop			;d095
	nop			;d096
	nop			;d097
	nop			;d098
	nop			;d099
	nop			;d09a
	nop			;d09b
	nop			;d09c
	push bc			;d09d
	ld a,e			;d09e
	or e			;d09f
	ld e,c			;d0a0
	jr ld094h		;d0a1
	ld de,lff39h		;d0a3
	ld sp,hl		;d0a6
	rst 28h			;d0a7
	rst 38h			;d0a8
	rst 38h			;d0a9
	call pe,sub_ff7fh	;d0aa
	rst 38h			;d0ad
	rst 38h			;d0ae
	rst 38h			;d0af
	rst 38h			;d0b0
	out (07eh),a		;d0b1
	inc a			;d0b3
	sbc a,a			;d0b4
	ex de,hl		;d0b5
	sbc a,e			;d0b6
	ccf			;d0b7
	jp m,0003ah		;d0b8
	nop			;d0bb
	nop			;d0bc
	nop			;d0bd
	nop			;d0be
	nop			;d0bf
	nop			;d0c0
	dec bc			;d0c1
	rst 10h			;d0c2
	jr z,ld064h		;d0c3
	rst 38h			;d0c5
	rst 38h			;d0c6
	rst 28h			;d0c7
	push de			;d0c8
	call nc,02007h		;d0c9
	nop			;d0cc
	nop			;d0cd
	nop			;d0ce
	nop			;d0cf
	nop			;d0d0
	nop			;d0d1
	nop			;d0d2
	nop			;d0d3
	nop			;d0d4
	nop			;d0d5
	nop			;d0d6
	nop			;d0d7
	nop			;d0d8
	nop			;d0d9
	nop			;d0da
	nop			;d0db
	nop			;d0dc
ld0ddh:
	nop			;d0dd
	nop			;d0de
	nop			;d0df
	nop			;d0e0
	nop			;d0e1
	nop			;d0e2
	nop			;d0e3
	nop			;d0e4
	nop			;d0e5
	nop			;d0e6
	nop			;d0e7
	nop			;d0e8
	nop			;d0e9
	nop			;d0ea
	nop			;d0eb
	nop			;d0ec
	nop			;d0ed
	nop			;d0ee
	jr nc,ld11bh		;d0ef
	nop			;d0f1
	nop			;d0f2
	nop			;d0f3
	nop			;d0f4
	nop			;d0f5
	nop			;d0f6
	nop			;d0f7
	nop			;d0f8
	nop			;d0f9
	nop			;d0fa
	add a,a			;d0fb
	ld l,(hl)		;d0fc
	in a,(0d9h)		;d0fd
	sbc a,0f8h		;d0ff
	ld h,b			;d101
	ret p			;d102
	rst 20h			;d103
	rst 38h			;d104
	cp 07bh			;d105
	rst 38h			;d107
	rst 38h			;d108
	cp 067h			;d109
	rst 38h			;d10b
	rst 38h			;d10c
	rst 38h			;d10d
	jp nc,lb993h		;d10e
	rst 38h			;d111
	call m,09fffh		;d112
	jp m,la98fh		;d115
	and e			;d118
	and a			;d119
	ld b,b			;d11a
ld11bh:
	nop			;d11b
	nop			;d11c
	nop			;d11d
	nop			;d11e
	dec d			;d11f
	dec e			;d120
	add a,b			;d121
	dec b			;d122
	cp 0d8h			;d123
	inc bc			;d125
	rst 38h			;d126
	rst 38h			;d127
	call p,04fabh		;d128
	jr nz,ld12dh		;d12b
ld12dh:
	nop			;d12d
	nop			;d12e
	nop			;d12f
	nop			;d130
	nop			;d131
	nop			;d132
	nop			;d133
	nop			;d134
	nop			;d135
	nop			;d136
	nop			;d137
	nop			;d138
	nop			;d139
	nop			;d13a
	nop			;d13b
	nop			;d13c
	nop			;d13d
	nop			;d13e
	nop			;d13f
	nop			;d140
	nop			;d141
	nop			;d142
	nop			;d143
	nop			;d144
	nop			;d145
	nop			;d146
	nop			;d147
	nop			;d148
	nop			;d149
	nop			;d14a
	nop			;d14b
	nop			;d14c
	nop			;d14d
	nop			;d14e
	nop			;d14f
	ld d,080h		;d150
	nop			;d152
	nop			;d153
	nop			;d154
	nop			;d155
	nop			;d156
	nop			;d157
	nop			;d158
	ld b,077h		;d159
	ld a,e			;d15b
	dec h			;d15c
	nop			;d15d
	rst 20h			;d15e
	pop bc			;d15f
	rst 18h			;d160
	add a,08fh		;d161
	rst 38h			;d163
	cp 02bh			;d164
	rst 38h			;d166
	rst 38h			;d167
	rst 38h			;d168
	ei			;d169
	ld a,a			;d16a
	rst 38h			;d16b
	rst 38h			;d16c
	rst 38h			;d16d
	cpl			;d16e
	ld sp,hl		;d16f
	rst 38h			;d170
	and l			;d171
	rst 38h			;d172
	call p,sub_eb7fh	;d173
	rst 38h			;d176
	jp (hl)			;d177
	cp 039h			;d178
	inc c			;d17a
	nop			;d17b
	nop			;d17c
	nop			;d17d
	ld e,01bh		;d17e
	ld d,l			;d180
	ld d,l			;d181
	ld b,e			;d182
	ld (hl),07ch		;d183
	ret nz			;d185
	pop bc			;d186
	ld bc,lf8afh		;d187
	and (hl)		;d18a
	nop			;d18b
	nop			;d18c
	nop			;d18d
	nop			;d18e
	nop			;d18f
	nop			;d190
	nop			;d191
	nop			;d192
	nop			;d193
	nop			;d194
	nop			;d195
	nop			;d196
	nop			;d197
	nop			;d198
	nop			;d199
	nop			;d19a
	nop			;d19b
	nop			;d19c
	nop			;d19d
	nop			;d19e
	nop			;d19f
	nop			;d1a0
	nop			;d1a1
	nop			;d1a2
	nop			;d1a3
	nop			;d1a4
	nop			;d1a5
	nop			;d1a6
	nop			;d1a7
	nop			;d1a8
	nop			;d1a9
	nop			;d1aa
	nop			;d1ab
	nop			;d1ac
	nop			;d1ad
	nop			;d1ae
	nop			;d1af
	dec b			;d1b0
	ld h,b			;d1b1
	nop			;d1b2
	nop			;d1b3
	nop			;d1b4
	nop			;d1b5
	nop			;d1b6
	nop			;d1b7
	rlca			;d1b8
	ld l,(hl)		;d1b9
	ld a,e			;d1ba
	call c,09706h		;d1bb
	ccf			;d1be
	add a,b			;d1bf
	nop			;d1c0
	inc hl			;d1c1
	rst 38h			;d1c2
	rst 38h			;d1c3
	and 0bfh		;d1c4
	rst 38h			;d1c6
	rst 38h			;d1c7
	rst 38h			;d1c8
	sbc a,c			;d1c9
	rst 38h			;d1ca
	rst 38h			;d1cb
	rst 38h			;d1cc
	rst 38h			;d1cd
	call 062fch		;d1ce
	sbc a,01eh		;d1d1
	ld a,a			;d1d3
	call nc,sub_fb7fh	;d1d4
	ld c,a			;d1d7
	jp m,01e7fh		;d1d8
	adc a,a			;d1db
	sbc a,(hl)		;d1dc
	ccf			;d1dd
	adc a,a			;d1de
	rst 0			;d1df
	ld hl,(03ea0h)		;d1e0
	jp pe,07c5bh		;d1e3
	nop			;d1e6
	dec (hl)		;d1e7
	ld e,d			;d1e8
	defb 0ddh,054h ;ld d,ixh	;d1e9
	nop			;d1eb
	nop			;d1ec
	jr nz,ld1efh		;d1ed
ld1efh:
	nop			;d1ef
	nop			;d1f0
	nop			;d1f1
	nop			;d1f2
	nop			;d1f3
	nop			;d1f4
	nop			;d1f5
	nop			;d1f6
	nop			;d1f7
	nop			;d1f8
	nop			;d1f9
	nop			;d1fa
	nop			;d1fb
	nop			;d1fc
	nop			;d1fd
	nop			;d1fe
	nop			;d1ff
	nop			;d200
	nop			;d201
	nop			;d202
	nop			;d203
	nop			;d204
	nop			;d205
	nop			;d206
	nop			;d207
	nop			;d208
	nop			;d209
	nop			;d20a
	nop			;d20b
	nop			;d20c
	nop			;d20d
	nop			;d20e
	ld (bc),a		;d20f
	nop			;d210
	nop			;d211
	nop			;d212
	nop			;d213
	nop			;d214
	nop			;d215
	nop			;d216
	nop			;d217
	nop			;d218
	nop			;d219
	nop			;d21a
	nop			;d21b
	nop			;d21c
	nop			;d21d
	nop			;d21e
	nop			;d21f
	nop			;d220
	nop			;d221
	nop			;d222
	nop			;d223
	ld (hl),c		;d224
	add a,b			;d225
	nop			;d226
	nop			;d227
	nop			;d228
	ld e,a			;d229
	defb 0fdh,0dch,0cah ;illegal sequence	;d22a
	add a,(hl)		;d22d
	ccf			;d22e
	rst 38h			;d22f
	rst 38h			;d230
	rst 38h			;d231
	rst 38h			;d232
	rst 38h			;d233
	rst 38h			;d234
	rst 38h			;d235
	rst 38h			;d236
	ld d,d			;d237
	add a,b			;d238
	nop			;d239
	nop			;d23a
	nop			;d23b
	nop			;d23c
	nop			;d23d
	nop			;d23e
	nop			;d23f
	djnz ld242h		;d240
ld242h:
	nop			;d242
	nop			;d243
	nop			;d244
	nop			;d245
	nop			;d246
	nop			;d247
	nop			;d248
	nop			;d249
	nop			;d24a
	nop			;d24b
	nop			;d24c
	nop			;d24d
	nop			;d24e
	nop			;d24f
	nop			;d250
	nop			;d251
	nop			;d252
	nop			;d253
	nop			;d254
	nop			;d255
	nop			;d256
	nop			;d257
	nop			;d258
	nop			;d259
	nop			;d25a
	nop			;d25b
	nop			;d25c
	nop			;d25d
	nop			;d25e
	nop			;d25f
	nop			;d260
	nop			;d261
	nop			;d262
	nop			;d263
	nop			;d264
	nop			;d265
	nop			;d266
	nop			;d267
	nop			;d268
	nop			;d269
	nop			;d26a
	nop			;d26b
	nop			;d26c
	nop			;d26d
	nop			;d26e
	dec b			;d26f
	nop			;d270
	nop			;d271
	nop			;d272
	nop			;d273
	nop			;d274
	nop			;d275
	nop			;d276
	nop			;d277
	nop			;d278
	nop			;d279
	nop			;d27a
	nop			;d27b
	nop			;d27c
	nop			;d27d
	nop			;d27e
ld27fh:
	nop			;d27f
	nop			;d280
	ld b,087h		;d281
	rst 8			;d283
	cp (hl)			;d284
	ld (hl),h		;d285
	ret nc			;d286
	ld bc,lf347h		;d287
	rst 18h			;d28a
	or 0ffh			;d28b
	cp 0e7h			;d28d
	ld b,a			;d28f
	rst 38h			;d290
	rst 38h			;d291
	rst 38h			;d292
	rst 38h			;d293
	rst 38h			;d294
	rst 38h			;d295
	rst 38h			;d296
	call nc,00068h		;d297
	nop			;d29a
	nop			;d29b
	nop			;d29c
	nop			;d29d
	nop			;d29e
	ld bc,000f0h		;d29f
	nop			;d2a2
	nop			;d2a3
	inc bc			;d2a4
	rst 38h			;d2a5
	ret p			;d2a6
	nop			;d2a7
	ld a,d			;d2a8
	nop			;d2a9
	nop			;d2aa
	nop			;d2ab
	nop			;d2ac
	nop			;d2ad
	nop			;d2ae
	nop			;d2af
	nop			;d2b0
	nop			;d2b1
	nop			;d2b2
	nop			;d2b3
	nop			;d2b4
	nop			;d2b5
	nop			;d2b6
	nop			;d2b7
	nop			;d2b8
	nop			;d2b9
	nop			;d2ba
	nop			;d2bb
	nop			;d2bc
	nop			;d2bd
	nop			;d2be
	nop			;d2bf
	nop			;d2c0
	nop			;d2c1
	nop			;d2c2
	nop			;d2c3
	nop			;d2c4
	nop			;d2c5
	nop			;d2c6
	nop			;d2c7
	nop			;d2c8
	nop			;d2c9
	nop			;d2ca
	nop			;d2cb
	nop			;d2cc
	nop			;d2cd
	nop			;d2ce
	dec bc			;d2cf
	ld h,b			;d2d0
	nop			;d2d1
	nop			;d2d2
	nop			;d2d3
	nop			;d2d4
	nop			;d2d5
	nop			;d2d6
	nop			;d2d7
	nop			;d2d8
	nop			;d2d9
	nop			;d2da
	nop			;d2db
	nop			;d2dc
	nop			;d2dd
	nop			;d2de
	nop			;d2df
	ld l,h			;d2e0
	ld e,b			;d2e1
	ret m			;d2e2
	jp m,0397bh		;d2e3
	add a,a			;d2e6
	rra			;d2e7
	di			;d2e8
	rst 18h			;d2e9
	rst 38h			;d2ea
	inc sp			;d2eb
	rst 38h			;d2ec
	rst 38h			;d2ed
	rst 38h			;d2ee
	rst 20h			;d2ef
	exx			;d2f0
	pop iy			;d2f1
	rst 38h			;d2f3
	rst 38h			;d2f4
	rst 38h			;d2f5
	rst 38h			;d2f6
	push af			;d2f7
	ld c,l			;d2f8
	nop			;d2f9
	nop			;d2fa
	nop			;d2fb
	nop			;d2fc
	nop			;d2fd
	nop			;d2fe
	nop			;d2ff
	ld l,e			;d300
	nop			;d301
	nop			;d302
	nop			;d303
	nop			;d304
	ld c,0bfh		;d305
	call p,0801dh		;d307
	nop			;d30a
	nop			;d30b
	nop			;d30c
	nop			;d30d
	nop			;d30e
	nop			;d30f
	nop			;d310
	nop			;d311
	nop			;d312
	nop			;d313
	nop			;d314
	nop			;d315
	nop			;d316
	nop			;d317
	nop			;d318
	nop			;d319
	nop			;d31a
	nop			;d31b
	nop			;d31c
	nop			;d31d
	nop			;d31e
	nop			;d31f
	nop			;d320
	nop			;d321
	nop			;d322
	nop			;d323
	nop			;d324
	nop			;d325
	nop			;d326
	nop			;d327
	nop			;d328
	nop			;d329
	nop			;d32a
	nop			;d32b
	nop			;d32c
	nop			;d32d
	nop			;d32e
	rra			;d32f
	ld d,b			;d330
	nop			;d331
	nop			;d332
	nop			;d333
	nop			;d334
	nop			;d335
	nop			;d336
	nop			;d337
	nop			;d338
	nop			;d339
	nop			;d33a
	nop			;d33b
	nop			;d33c
	nop			;d33d
	rlca			;d33e
	call z,096e3h		;d33f
	ld (hl),c		;d342
	rst 28h			;d343
	rst 8			;d344
	call c,sub_f37fh	;d345
	rst 18h			;d348
	rst 38h			;d349
	defb 0fdh,0bfh,0ffh ;illegal sequence	;d34a
	rst 38h			;d34d
	rst 38h			;d34e
	rst 38h			;d34f
	rst 20h			;d350
	jp m,lf73fh		;d351
	rst 8			;d354
	ld e,a			;d355
	rst 38h			;d356
	rst 38h			;d357
	out (0d0h),a		;d358
	nop			;d35a
	nop			;d35b
	nop			;d35c
	nop			;d35d
	nop			;d35e
	nop			;d35f
	inc bc			;d360
	rst 28h			;d361
	nop			;d362
	rrca			;d363
	rst 38h			;d364
	call m,07fedh		;d365
	sub a			;d368
	ld b,b			;d369
	nop			;d36a
	nop			;d36b
	nop			;d36c
	nop			;d36d
	nop			;d36e
	nop			;d36f
	nop			;d370
	nop			;d371
	nop			;d372
	nop			;d373
	nop			;d374
	nop			;d375
	nop			;d376
	nop			;d377
	nop			;d378
	nop			;d379
	nop			;d37a
sub_d37bh:
	nop			;d37b
	nop			;d37c
	nop			;d37d
	nop			;d37e
	nop			;d37f
	nop			;d380
	nop			;d381
	nop			;d382
	nop			;d383
	nop			;d384
	nop			;d385
	nop			;d386
	nop			;d387
	nop			;d388
	nop			;d389
	nop			;d38a
	nop			;d38b
	nop			;d38c
	nop			;d38d
	nop			;d38e
	ld hl,(00058h)		;d38f
	nop			;d392
	nop			;d393
	nop			;d394
	nop			;d395
	nop			;d396
	nop			;d397
	nop			;d398
	nop			;d399
	nop			;d39a
	nop			;d39b
	nop			;d39c
	rst 28h			;d39d
	dec sp			;d39e
	ret z			;d39f
	adc a,h			;d3a0
	inc a			;d3a1
	ld b,08ch		;d3a2
	ld (hl),e		;d3a4
	rst 38h			;d3a5
	di			;d3a6
	rst 18h			;d3a7
	rst 38h			;d3a8
	rst 38h			;d3a9
	call z,lffffh		;d3aa
	rst 38h			;d3ad
	rst 38h			;d3ae
	rst 38h			;d3af
	rst 38h			;d3b0
	ret m			;d3b1
	ccf			;d3b2
	defb 0ddh,0dfh,0e9h ;illegal sequence	;d3b3
	defb 0ddh,01fh,0f5h ;illegal sequence	;d3b6
	ld a,(00000h)		;d3b9
	nop			;d3bc
	nop			;d3bd
	inc c			;d3be
	nop			;d3bf
	nop			;d3c0
	rlca			;d3c1
	or 094h			;d3c2
	rst 0			;d3c4
	rst 38h			;d3c5
	rst 38h			;d3c6
	sbc a,a			;d3c7
	push hl			;d3c8
	jp nc,05018h		;d3c9
	nop			;d3cc
	nop			;d3cd
	nop			;d3ce
	nop			;d3cf
	nop			;d3d0
	nop			;d3d1
	nop			;d3d2
	nop			;d3d3
	nop			;d3d4
	nop			;d3d5
	nop			;d3d6
	nop			;d3d7
	nop			;d3d8
	nop			;d3d9
	nop			;d3da
	nop			;d3db
	nop			;d3dc
	nop			;d3dd
	nop			;d3de
	nop			;d3df
	nop			;d3e0
	nop			;d3e1
	nop			;d3e2
	nop			;d3e3
	nop			;d3e4
	nop			;d3e5
	nop			;d3e6
	nop			;d3e7
	nop			;d3e8
	nop			;d3e9
	nop			;d3ea
	nop			;d3eb
	nop			;d3ec
	nop			;d3ed
	nop			;d3ee
	jr nz,$+24		;d3ef
	nop			;d3f1
	nop			;d3f2
	nop			;d3f3
	nop			;d3f4
	nop			;d3f5
	nop			;d3f6
	nop			;d3f7
	nop			;d3f8
	nop			;d3f9
	nop			;d3fa
	ld h,e			;d3fb
	ret			;d3fc
	inc a			;d3fd
	ld h,0b0h		;d3fe
	ld a,l			;d400
	sbc a,l			;d401
	dec c			;d402
	adc a,a			;d403
	rst 38h			;d404
	call m,sub_fff7h	;d405
	rst 38h			;d408
	rst 38h			;d409
	ld l,a			;d40a
	rst 38h			;d40b
	rst 38h			;d40c
	rst 38h			;d40d
	and l			;d40e
	ld b,l			;d40f
	ld d,h			;d410
	rst 38h			;d411
	cp 07fh			;d412
	rst 8			;d414
	jp m,la45fh		;d415
	rst 10h			;d418
	ld d,a			;d419
	ret po			;d41a
	nop			;d41b
	nop			;d41c
	nop			;d41d
	nop			;d41e
	ld a,(bc)		;d41f
	add a,e			;d420
	ld (hl),b		;d421
	inc bc			;d422
	call m,000c8h		;d423
	rst 38h			;d426
	rst 38h			;d427
	jp m,ld8afh		;d428
	ld b,b			;d42b
	nop			;d42c
	nop			;d42d
	nop			;d42e
	nop			;d42f
	nop			;d430
	nop			;d431
	nop			;d432
	nop			;d433
	nop			;d434
	nop			;d435
	nop			;d436
	nop			;d437
	nop			;d438
	nop			;d439
	nop			;d43a
	nop			;d43b
	nop			;d43c
	nop			;d43d
	nop			;d43e
	nop			;d43f
	nop			;d440
	nop			;d441
	nop			;d442
	nop			;d443
	nop			;d444
	nop			;d445
	nop			;d446
	nop			;d447
	nop			;d448
	nop			;d449
	nop			;d44a
	nop			;d44b
	nop			;d44c
	nop			;d44d
	nop			;d44e
	nop			;d44f
	ld a,(bc)		;d450
	ret nz			;d451
	nop			;d452
	nop			;d453
	nop			;d454
	nop			;d455
	nop			;d456
	nop			;d457
	nop			;d458
	rrca			;d459
	cpl			;d45a
	ld h,(hl)		;d45b
	jp m,ld8fdh		;d45c
	call 001fch		;d45f
	sbc a,a			;d462
	rst 38h			;d463
	call m,sub_ff57h	;d464
	rst 38h			;d467
	rst 38h			;d468
	di			;d469
	ccf			;d46a
	rst 38h			;d46b
	rst 38h			;d46c
	rst 38h			;d46d
	sub a			;d46e
	push af			;d46f
	rst 38h			;d470
	ret nc			;d471
	rst 38h			;d472
	jp m,lf47fh		;d473
	rst 38h			;d476
	ld sp,hl		;d477
	jp m,0643dh		;d478
	nop			;d47b
	nop			;d47c
	ret po			;d47d
	rrca			;d47e
	ld d,0aah		;d47f
	xor d			;d481
	xor b			;d482
	call 0416eh		;d483
	add a,e			;d486
	ret nz			;d487
	push de			;d488
	ld d,(hl)		;d489
	xor b			;d48a
	nop			;d48b
	nop			;d48c
	nop			;d48d
	nop			;d48e
	nop			;d48f
	nop			;d490
	nop			;d491
	nop			;d492
	nop			;d493
	nop			;d494
	nop			;d495
	nop			;d496
	nop			;d497
	nop			;d498
	nop			;d499
	nop			;d49a
	nop			;d49b
	nop			;d49c
	nop			;d49d
	nop			;d49e
	nop			;d49f
	nop			;d4a0
	nop			;d4a1
	nop			;d4a2
	nop			;d4a3
	nop			;d4a4
	nop			;d4a5
	nop			;d4a6
	nop			;d4a7
	nop			;d4a8
	nop			;d4a9
	nop			;d4aa
	nop			;d4ab
	nop			;d4ac
	nop			;d4ad
	nop			;d4ae
	nop			;d4af
	ld b,028h		;d4b0
	nop			;d4b2
	nop			;d4b3
	nop			;d4b4
	nop			;d4b5
	nop			;d4b6
	nop			;d4b7
	ld h,0b5h		;d4b8
	dec h			;d4ba
	ret pe			;d4bb
	ld sp,hl		;d4bc
	add a,a			;d4bd
	cp a			;d4be
	nop			;d4bf
	nop			;d4c0
	ld h,a			;d4c1
	rst 38h			;d4c2
	rst 38h			;d4c3
	rst 30h			;d4c4
	ld a,a			;d4c5
	rst 38h			;d4c6
	rst 38h			;d4c7
	rst 38h			;d4c8
	in a,(0ffh)		;d4c9
	rst 38h			;d4cb
	rst 38h			;d4cc
	rst 38h			;d4cd
	xor l			;d4ce
	di			;d4cf
	call p,sub_e258h	;d4d0
	rst 38h			;d4d3
	jp pe,lfc3fh		;d4d4
	or a			;d4d7
	call m,03e7fh		;d4d8
	ld c,09eh		;d4db
	ccf			;d4dd
	rst 8			;d4de
	rst 20h			;d4df
	or l			;d4e0
	ld d,l			;d4e1
	ld bc,06ef5h		;d4e2
	cp a			;d4e5
	rst 38h			;d4e6
	rrca			;d4e7
	xor l			;d4e8
	or (hl)			;d4e9
	xor e			;d4ea
	add a,b			;d4eb
	nop			;d4ec
	jr nc,ld4efh		;d4ed
ld4efh:
	nop			;d4ef
	nop			;d4f0
	nop			;d4f1
	nop			;d4f2
	nop			;d4f3
	nop			;d4f4
	nop			;d4f5
	nop			;d4f6
	nop			;d4f7
	nop			;d4f8
	nop			;d4f9
	nop			;d4fa
	nop			;d4fb
	nop			;d4fc
	nop			;d4fd
	nop			;d4fe
	nop			;d4ff
	nop			;d500
	nop			;d501
	nop			;d502
	nop			;d503
	nop			;d504
	nop			;d505
	nop			;d506
	nop			;d507
	nop			;d508
	nop			;d509
	nop			;d50a
ld50bh:
	nop			;d50b
	nop			;d50c
	nop			;d50d
	nop			;d50e
	ld (bc),a		;d50f
	nop			;d510
	nop			;d511
	nop			;d512
	nop			;d513
	nop			;d514
	nop			;d515
	nop			;d516
	nop			;d517
	nop			;d518
	nop			;d519
	nop			;d51a
	nop			;d51b
	nop			;d51c
	nop			;d51d
	nop			;d51e
	nop			;d51f
	nop			;d520
	nop			;d521
	nop			;d522
	jr c,ld57dh		;d523
	jp nz,00000h		;d525
	ld bc,lfbefh		;d528
	cp c			;d52b
	ld d,a			;d52c
	ld d,e			;d52d
	adc a,a			;d52e
	rst 38h			;d52f
	rst 38h			;d530
	rst 38h			;d531
	rst 38h			;d532
	rst 38h			;d533
	rst 38h			;d534
	rst 38h			;d535
	rst 38h			;d536
	xor e			;d537
	ld b,b			;d538
	nop			;d539
	nop			;d53a
	nop			;d53b
	nop			;d53c
	nop			;d53d
	nop			;d53e
	nop			;d53f
	jr nc,ld542h		;d540
ld542h:
	nop			;d542
	nop			;d543
	nop			;d544
	nop			;d545
	nop			;d546
	nop			;d547
	nop			;d548
	nop			;d549
	nop			;d54a
	nop			;d54b
	nop			;d54c
	nop			;d54d
	nop			;d54e
	nop			;d54f
	nop			;d550
	nop			;d551
	nop			;d552
	nop			;d553
	nop			;d554
	nop			;d555
	nop			;d556
	nop			;d557
	nop			;d558
	nop			;d559
	nop			;d55a
	nop			;d55b
	nop			;d55c
	nop			;d55d
	nop			;d55e
	nop			;d55f
	nop			;d560
	nop			;d561
	nop			;d562
	nop			;d563
	nop			;d564
	nop			;d565
	nop			;d566
	nop			;d567
	nop			;d568
	nop			;d569
	nop			;d56a
	nop			;d56b
	nop			;d56c
	nop			;d56d
	nop			;d56e
	rlca			;d56f
	nop			;d570
	nop			;d571
	nop			;d572
	nop			;d573
	nop			;d574
	nop			;d575
	nop			;d576
	nop			;d577
	nop			;d578
	nop			;d579
	nop			;d57a
	nop			;d57b
	nop			;d57c
ld57dh:
	nop			;d57d
	nop			;d57e
	nop			;d57f
	nop			;d580
	rlca			;d581
	ld c,(hl)		;d582
	and a			;d583
	dec e			;d584
	call m,007d8h		;d585
	adc a,a			;d588
	rst 20h			;d589
	cp a			;d58a
	jp pe,sub_ff7fh		;d58b
	ld d,e			;d58e
	or e			;d58f
	rst 38h			;d590
	rst 38h			;d591
	rst 38h			;d592
	rst 38h			;d593
	rst 38h			;d594
	rst 38h			;d595
	rst 38h			;d596
	jp pe,00068h		;d597
	nop			;d59a
	nop			;d59b
	nop			;d59c
	nop			;d59d
	nop			;d59e
	ld bc,000d0h		;d59f
	nop			;d5a2
	nop			;d5a3
	rrca			;d5a4
	rst 38h			;d5a5
	cp 000h			;d5a6
	ld (hl),000h		;d5a8
	nop			;d5aa
	nop			;d5ab
	nop			;d5ac
	nop			;d5ad
	nop			;d5ae
	nop			;d5af
	nop			;d5b0
	nop			;d5b1
	nop			;d5b2
	nop			;d5b3
	nop			;d5b4
	nop			;d5b5
	nop			;d5b6
	nop			;d5b7
	nop			;d5b8
	nop			;d5b9
	nop			;d5ba
	nop			;d5bb
	nop			;d5bc
	nop			;d5bd
	nop			;d5be
	nop			;d5bf
	nop			;d5c0
	nop			;d5c1
	nop			;d5c2
	nop			;d5c3
	nop			;d5c4
	nop			;d5c5
	nop			;d5c6
	nop			;d5c7
	nop			;d5c8
	nop			;d5c9
	nop			;d5ca
	nop			;d5cb
	nop			;d5cc
	nop			;d5cd
	nop			;d5ce
	ld c,070h		;d5cf
	nop			;d5d1
	nop			;d5d2
	nop			;d5d3
	nop			;d5d4
	nop			;d5d5
	nop			;d5d6
	nop			;d5d7
	nop			;d5d8
	nop			;d5d9
	nop			;d5da
	nop			;d5db
	nop			;d5dc
sub_d5ddh:
	nop			;d5dd
	nop			;d5de
	inc c			;d5df
	dec sp			;d5e0
	cp (hl)			;d5e1
	inc d			;d5e2
	ld (hl),a		;d5e3
	sbc a,e			;d5e4
	sbc a,0dch		;d5e5
	ccf			;d5e7
	rst 20h			;d5e8
	cp a			;d5e9
	cp 057h			;d5ea
	rst 38h			;d5ec
	rst 38h			;d5ed
	rst 38h			;d5ee
	rst 30h			;d5ef
	call m,0b8b9h		;d5f0
	rst 38h			;d5f3
	xor e			;d5f4
	rst 38h			;d5f5
	rst 38h			;d5f6
	cp 0aeh			;d5f7
	add a,b			;d5f9
	nop			;d5fa
	nop			;d5fb
	nop			;d5fc
	nop			;d5fd
	nop			;d5fe
	nop			;d5ff
	halt			;d600
	ret nz			;d601
	nop			;d602
	nop			;d603
	nop			;d604
	ld b,0bfh		;d605
	call p,0002fh		;d607
	nop			;d60a
	nop			;d60b
	nop			;d60c
	nop			;d60d
	nop			;d60e
	nop			;d60f
	nop			;d610
	nop			;d611
	nop			;d612
	nop			;d613
	nop			;d614
	nop			;d615
	nop			;d616
	nop			;d617
	nop			;d618
	nop			;d619
	nop			;d61a
	nop			;d61b
	nop			;d61c
	nop			;d61d
	nop			;d61e
	nop			;d61f
	nop			;d620
	nop			;d621
	nop			;d622
	nop			;d623
	nop			;d624
	nop			;d625
	nop			;d626
	nop			;d627
	nop			;d628
	nop			;d629
	nop			;d62a
	nop			;d62b
	nop			;d62c
	nop			;d62d
	nop			;d62e
	ld d,0b0h		;d62f
	nop			;d631
	nop			;d632
	nop			;d633
	nop			;d634
	nop			;d635
	nop			;d636
	nop			;d637
	nop			;d638
	nop			;d639
	nop			;d63a
	nop			;d63b
	nop			;d63c
	ld bc,03983h		;d63d
	rla			;d640
	ld h,e			;d641
	ld b,e			;d642
	rst 20h			;d643
	rst 20h			;d644
	jr nc,$+1		;d645
	rst 20h			;d647
	cp a			;d648
	rst 38h			;d649
	ei			;d64a
	rra			;d64b
	rst 38h			;d64c
	rst 38h			;d64d
	rst 38h			;d64e
	rst 38h			;d64f
	pop af			;d650
	defb 0fdh,03fh,073h ;illegal sequence	;d651
	rst 28h			;d654
	ld c,a			;d655
	rst 38h			;d656
	rst 38h			;d657
	xor c			;d658
	ret nc			;d659
	nop			;d65a
	nop			;d65b
	nop			;d65c
	nop			;d65d
	nop			;d65e
	nop			;d65f
	ld bc,lb0deh		;d660
	rlca			;d663
	rst 38h			;d664
	rst 38h			;d665
	defb 0ddh,0ffh,057h ;illegal sequence	;d666
	ld h,b			;d669
	nop			;d66a
	nop			;d66b
	nop			;d66c
	nop			;d66d
	nop			;d66e
	nop			;d66f
	nop			;d670
	nop			;d671
	nop			;d672
	nop			;d673
	nop			;d674
	nop			;d675
	nop			;d676
	nop			;d677
	nop			;d678
	nop			;d679
	nop			;d67a
	nop			;d67b
	nop			;d67c
	nop			;d67d
	nop			;d67e
	nop			;d67f
	nop			;d680
	nop			;d681
	nop			;d682
	nop			;d683
	nop			;d684
	nop			;d685
	nop			;d686
	nop			;d687
	nop			;d688
	nop			;d689
	nop			;d68a
	nop			;d68b
	nop			;d68c
	nop			;d68d
	nop			;d68e
	inc l			;d68f
	ld l,b			;d690
	nop			;d691
	nop			;d692
	nop			;d693
	nop			;d694
	nop			;d695
	nop			;d696
	nop			;d697
	nop			;d698
	nop			;d699
	nop			;d69a
	nop			;d69b
	inc c			;d69c
	ld a,b			;d69d
	jp 053dfh		;d69e
	out (08bh),a		;d6a1
	ret m			;d6a3
	rst 0			;d6a4
	rst 38h			;d6a5
	ei			;d6a6
	cp a			;d6a7
	rst 38h			;d6a8
	rst 38h			;d6a9
	sbc a,c			;d6aa
	rst 38h			;d6ab
	rst 38h			;d6ac
	rst 38h			;d6ad
	rst 38h			;d6ae
	rst 38h			;d6af
	rst 38h			;d6b0
	call m,sub_ac3eh	;d6b1
	sbc a,a			;d6b4
	call pe,sub_bf9dh	;d6b5
	jp m,000bdh		;d6b8
	nop			;d6bb
	nop			;d6bc
	nop			;d6bd
	inc bc			;d6be
	add a,b			;d6bf
	nop			;d6c0
	inc bc			;d6c1
	rst 28h			;d6c2
	ld hl,(lff43h)		;d6c3
	rst 38h			;d6c6
	rst 28h			;d6c7
	jp p,lf2eah		;d6c8
	and b			;d6cb
	nop			;d6cc
	nop			;d6cd
	nop			;d6ce
sub_d6cfh:
	nop			;d6cf
	nop			;d6d0
	nop			;d6d1
	nop			;d6d2
	nop			;d6d3
	nop			;d6d4
	nop			;d6d5
	nop			;d6d6
	nop			;d6d7
	nop			;d6d8
	nop			;d6d9
	nop			;d6da
	nop			;d6db
	nop			;d6dc
	nop			;d6dd
	nop			;d6de
	nop			;d6df
	nop			;d6e0
	nop			;d6e1
	nop			;d6e2
	nop			;d6e3
	nop			;d6e4
	nop			;d6e5
	nop			;d6e6
	nop			;d6e7
	nop			;d6e8
	nop			;d6e9
	nop			;d6ea
	nop			;d6eb
	nop			;d6ec
	nop			;d6ed
	nop			;d6ee
	jr nz,ld70bh		;d6ef
	nop			;d6f1
	nop			;d6f2
	nop			;d6f3
	nop			;d6f4
	nop			;d6f5
	nop			;d6f6
	nop			;d6f7
	nop			;d6f8
	nop			;d6f9
	nop			;d6fa
	ld (hl),e		;d6fb
	cp l			;d6fc
	di			;d6fd
	xor (hl)		;d6fe
	rst 30h			;d6ff
	inc sp			;d700
	jp nz,03f53h		;d701
	rst 38h			;d704
	ld sp,hl		;d705
	rst 28h			;d706
	rst 38h			;d707
	rst 38h			;d708
	cp 0c7h			;d709
ld70bh:
	rst 38h			;d70b
	rst 38h			;d70c
	rst 38h			;d70d
	ld c,(hl)		;d70e
	jp pe,07faah		;d70f
	defb 0fdh,03fh,0e7h ;illegal sequence	;d712
	jp m,le29fh		;d715
	jp nc,0a0a3h		;d718
	nop			;d71b
	nop			;d71c
	nop			;d71d
	nop			;d71e
	dec b			;d71f
	ld d,b			;d720
	adc a,000h		;d721
	call m,000ech		;d723
	rra			;d726
	rst 38h			;d727
	call m,sub_ead6h	;d728
	add a,b			;d72b
	nop			;d72c
	nop			;d72d
	nop			;d72e
	nop			;d72f
	nop			;d730
	nop			;d731
	nop			;d732
	nop			;d733
	nop			;d734
	nop			;d735
	nop			;d736
	nop			;d737
	nop			;d738
	nop			;d739
	nop			;d73a
	nop			;d73b
	nop			;d73c
	nop			;d73d
	nop			;d73e
	nop			;d73f
	nop			;d740
	nop			;d741
	nop			;d742
	nop			;d743
	nop			;d744
	nop			;d745
	nop			;d746
	nop			;d747
	nop			;d748
	nop			;d749
	nop			;d74a
	nop			;d74b
	nop			;d74c
	nop			;d74d
	nop			;d74e
	nop			;d74f
	dec bc			;d750
	ld b,b			;d751
	nop			;d752
	nop			;d753
	nop			;d754
	nop			;d755
	nop			;d756
	nop			;d757
	nop			;d758
	rlca			;d759
	inc (hl)		;d75a
	dec e			;d75b
	ld a,b			;d75c
	dec sp			;d75d
	rst 20h			;d75e
	adc a,(hl)		;d75f
	ret po			;d760
	inc bc			;d761
	ccf			;d762
	rst 38h			;d763
	cp 02fh			;d764
	rst 38h			;d766
	rst 38h			;d767
	rst 38h			;d768
	and 07fh		;d769
	rst 38h			;d76b
	rst 38h			;d76c
	rst 38h			;d76d
	ld d,a			;d76e
	jp m,le8ffh		;d76f
	ld a,a			;d772
	defb 0fdh,03fh,0fbh ;illegal sequence	;d773
	ld a,a			;d776
	rst 30h			;d777
	rst 38h			;d778
	dec e			;d779
	inc (hl)		;d77a
	jr c,ld77dh		;d77b
ld77dh:
	ld a,b			;d77d
	rrca			;d77e
	dec c			;d77f
	dec d			;d780
	ld d,l			;d781
	ld d,h			;d782
	inc sp			;d783
	ld a,a			;d784
	ld h,c			;d785
	add a,a			;d786
	ret p			;d787
	ld d,(hl)		;d788
	ex de,hl		;d789
	ld e,b			;d78a
	nop			;d78b
	nop			;d78c
	nop			;d78d
	nop			;d78e
	nop			;d78f
	nop			;d790
	nop			;d791
	nop			;d792
	nop			;d793
	nop			;d794
	nop			;d795
	nop			;d796
	nop			;d797
	nop			;d798
	nop			;d799
	nop			;d79a
	nop			;d79b
	nop			;d79c
	nop			;d79d
	nop			;d79e
	nop			;d79f
	nop			;d7a0
	nop			;d7a1
	nop			;d7a2
	nop			;d7a3
	nop			;d7a4
	nop			;d7a5
	nop			;d7a6
	nop			;d7a7
	nop			;d7a8
	nop			;d7a9
	nop			;d7aa
	nop			;d7ab
	nop			;d7ac
	nop			;d7ad
	nop			;d7ae
	nop			;d7af
	inc b			;d7b0
	ret nc			;d7b1
	nop			;d7b2
	nop			;d7b3
	nop			;d7b4
	nop			;d7b5
	nop			;d7b6
	nop			;d7b7
	inc de			;d7b8
	ld e,b			;d7b9
	rst 30h			;d7ba
	daa			;d7bb
	ld (hl),a		;d7bc
	or a			;d7bd
	call z,00000h		;d7be
	ld c,a			;d7c1
	rst 38h			;d7c2
	rst 38h			;d7c3
	and 0ffh		;d7c4
	rst 38h			;d7c6
	rst 38h			;d7c7
	rst 38h			;d7c8
	or c			;d7c9
	rst 38h			;d7ca
	rst 38h			;d7cb
	rst 38h			;d7cc
	rst 38h			;d7cd
	call 012cch		;d7ce
	ld (hl),e		;d7d1
	jp m,lfd7fh		;d7d2
	ccf			;d7d5
	rst 38h			;d7d6
	ld c,c			;d7d7
	ld a,d			;d7d8
	rst 38h			;d7d9
	ld a,01fh		;d7da
	ld e,(hl)		;d7dc
	ld a,a			;d7dd
	rst 18h			;d7de
	rst 20h			;d7df
	jp c,la8aah		;d7e0
	ld c,0dfh		;d7e3
	rst 38h			;d7e5
	rst 20h			;d7e6
	or 0f5h			;d7e7
	rst 38h			;d7e9
	push de			;d7ea
	ld b,b			;d7eb
	nop			;d7ec
	jr z,ld7efh		;d7ed
ld7efh:
	nop			;d7ef
	nop			;d7f0
	nop			;d7f1
	nop			;d7f2
	nop			;d7f3
	nop			;d7f4
ld7f5h:
	nop			;d7f5
	nop			;d7f6
	nop			;d7f7
	nop			;d7f8
	nop			;d7f9
	nop			;d7fa
	nop			;d7fb
	nop			;d7fc
	nop			;d7fd
	nop			;d7fe
ld7ffh:
	nop			;d7ff
	nop			;d800
	nop			;d801
	nop			;d802
	nop			;d803
	nop			;d804
	nop			;d805
	nop			;d806
	nop			;d807
	nop			;d808
	nop			;d809
	nop			;d80a
	nop			;d80b
	nop			;d80c
	nop			;d80d
	nop			;d80e
	nop			;d80f
	nop			;d810
	nop			;d811
	nop			;d812
	nop			;d813
	nop			;d814
	nop			;d815
	nop			;d816
	nop			;d817
	nop			;d818
	nop			;d819
	nop			;d81a
	nop			;d81b
	nop			;d81c
	nop			;d81d
	nop			;d81e
	nop			;d81f
	nop			;d820
	nop			;d821
	nop			;d822
	inc d			;d823
	ld (hl),h		;d824
	and e			;d825
	nop			;d826
	nop			;d827
	ld (bc),a		;d828
	sbc a,a			;d829
	rst 30h			;d82a
	ld a,l			;d82b
	adc a,a			;d82c
	xor b			;d82d
	rst 0			;d82e
	rst 38h			;d82f
	rst 38h			;d830
	rst 38h			;d831
	rst 38h			;d832
	rst 38h			;d833
	rst 38h			;d834
	rst 38h			;d835
	rst 38h			;d836
	out (040h),a		;d837
	nop			;d839
	nop			;d83a
	nop			;d83b
	nop			;d83c
	nop			;d83d
	nop			;d83e
	nop			;d83f
	ld (hl),b		;d840
	nop			;d841
	nop			;d842
	nop			;d843
	nop			;d844
	nop			;d845
	nop			;d846
	dec b			;d847
	add a,b			;d848
	nop			;d849
	nop			;d84a
	nop			;d84b
	nop			;d84c
	nop			;d84d
	nop			;d84e
	nop			;d84f
	nop			;d850
	nop			;d851
	nop			;d852
	nop			;d853
	nop			;d854
	nop			;d855
	nop			;d856
	nop			;d857
	nop			;d858
	nop			;d859
	nop			;d85a
	nop			;d85b
	nop			;d85c
	nop			;d85d
	nop			;d85e
	nop			;d85f
	nop			;d860
	nop			;d861
	nop			;d862
	nop			;d863
	nop			;d864
	nop			;d865
	nop			;d866
	nop			;d867
	nop			;d868
	nop			;d869
	nop			;d86a
	nop			;d86b
	nop			;d86c
	nop			;d86d
	nop			;d86e
	dec b			;d86f
	nop			;d870
	nop			;d871
	nop			;d872
	nop			;d873
	nop			;d874
	nop			;d875
	nop			;d876
	nop			;d877
	nop			;d878
	nop			;d879
	nop			;d87a
	nop			;d87b
	nop			;d87c
	nop			;d87d
	nop			;d87e
	nop			;d87f
	inc bc			;d880
	inc bc			;d881
	ld (hl),a		;d882
	ld a,b			;d883
	jp po,lf87dh		;d884
	ld c,01fh		;d887
	rst 8			;d889
	ld a,a			;d88a
	call z,lffffh		;d88b
	xor c			;d88e
	ret			;d88f
	ld a,a			;d890
	rst 38h			;d891
	rst 38h			;d892
	rst 38h			;d893
	rst 38h			;d894
	rst 38h			;d895
	rst 38h			;d896
	push af			;d897
	inc (hl)		;d898
	nop			;d899
	nop			;d89a
	nop			;d89b
	nop			;d89c
	nop			;d89d
	nop			;d89e
	ld bc,000a8h		;d89f
	nop			;d8a2
	nop			;d8a3
	ld bc,lffffh		;d8a4
	add a,b			;d8a7
	dec hl			;d8a8
	nop			;d8a9
	nop			;d8aa
	nop			;d8ab
	nop			;d8ac
	nop			;d8ad
	nop			;d8ae
ld8afh:
	nop			;d8af
	nop			;d8b0
	nop			;d8b1
	nop			;d8b2
	nop			;d8b3
	nop			;d8b4
	nop			;d8b5
	nop			;d8b6
	nop			;d8b7
	nop			;d8b8
	nop			;d8b9
	nop			;d8ba
	nop			;d8bb
	nop			;d8bc
	nop			;d8bd
	nop			;d8be
	nop			;d8bf
	nop			;d8c0
	nop			;d8c1
	nop			;d8c2
	nop			;d8c3
	nop			;d8c4
	nop			;d8c5
	nop			;d8c6
	nop			;d8c7
	nop			;d8c8
	nop			;d8c9
	nop			;d8ca
	nop			;d8cb
	nop			;d8cc
	nop			;d8cd
	nop			;d8ce
	dec c			;d8cf
	or b			;d8d0
	nop			;d8d1
	nop			;d8d2
	nop			;d8d3
	nop			;d8d4
	nop			;d8d5
	nop			;d8d6
	nop			;d8d7
	nop			;d8d8
	nop			;d8d9
	nop			;d8da
	nop			;d8db
	nop			;d8dc
	nop			;d8dd
	nop			;d8de
	ld b,0c7h		;d8df
	ld bc,08fcbh		;d8e1
	defb 0edh ;next byte illegal after ed	;d8e4
	rst 20h			;d8e5
	add hl,sp		;d8e6
	ld a,a			;d8e7
	rst 8			;d8e8
	ld a,a			;d8e9
	rst 38h			;d8ea
	ld h,e			;d8eb
	rst 38h			;d8ec
	rst 38h			;d8ed
	rst 38h			;d8ee
	ex (sp),hl		;d8ef
	cp 01ch			;d8f0
	xor 05fh		;d8f2
	ld bc,lffffh		;d8f4
	ld b,(iy-080h)		;d8f7
	nop			;d8fa
	nop			;d8fb
	nop			;d8fc
ld8fdh:
	nop			;d8fd
	nop			;d8fe
	nop			;d8ff
	ld c,a			;d900
	jr nz,ld903h		;d901
ld903h:
	nop			;d903
	nop			;d904
	ld b,0dfh		;d905
	jp m,080f1h		;d907
	nop			;d90a
	nop			;d90b
	nop			;d90c
	nop			;d90d
	nop			;d90e
	nop			;d90f
	nop			;d910
	nop			;d911
	nop			;d912
	nop			;d913
	nop			;d914
	nop			;d915
	nop			;d916
	nop			;d917
	nop			;d918
	nop			;d919
	nop			;d91a
	nop			;d91b
	nop			;d91c
	nop			;d91d
	nop			;d91e
	nop			;d91f
	nop			;d920
	nop			;d921
	nop			;d922
	nop			;d923
	nop			;d924
	nop			;d925
	nop			;d926
	nop			;d927
	nop			;d928
	nop			;d929
	nop			;d92a
	nop			;d92b
	nop			;d92c
	nop			;d92d
	nop			;d92e
	dec d			;d92f
	ld d,b			;d930
	nop			;d931
	nop			;d932
	nop			;d933
	nop			;d934
	nop			;d935
	nop			;d936
	nop			;d937
	nop			;d938
	nop			;d939
	nop			;d93a
	nop			;d93b
	nop			;d93c
	nop			;d93d
	add a,075h		;d93e
	jp nz,09bd0h		;d940
	pop af			;d943
	jp p,lffe5h		;d944
	rst 8			;d947
	ld a,a			;d948
	rst 38h			;d949
	di			;d94a
	ccf			;d94b
	rst 38h			;d94c
	rst 38h			;d94d
	rst 38h			;d94e
	rst 38h			;d94f
	ld sp,hl		;d950
	cp 0dfh			;d951
	or c			;d953
	rst 8			;d954
	and a			;d955
	ld d,a			;d956
	rst 38h			;d957
	push de			;d958
	ret pe			;d959
	nop			;d95a
	nop			;d95b
	nop			;d95c
	nop			;d95d
	nop			;d95e
	nop			;d95f
	ld bc,0683dh		;d960
	inc bc			;d963
	rst 38h			;d964
	rst 38h			;d965
	dec hl			;d966
	ld a,a			;d967
	xor e			;d968
	and b			;d969
	nop			;d96a
	nop			;d96b
	nop			;d96c
	nop			;d96d
	nop			;d96e
	nop			;d96f
	nop			;d970
	nop			;d971
	nop			;d972
	nop			;d973
	nop			;d974
	nop			;d975
	nop			;d976
	nop			;d977
	nop			;d978
	nop			;d979
	nop			;d97a
	nop			;d97b
	nop			;d97c
	nop			;d97d
	nop			;d97e
	nop			;d97f
	nop			;d980
	nop			;d981
	nop			;d982
	nop			;d983
	nop			;d984
	nop			;d985
	nop			;d986
	nop			;d987
	nop			;d988
	nop			;d989
	nop			;d98a
	nop			;d98b
	nop			;d98c
	nop			;d98d
	nop			;d98e
	inc (hl)		;d98f
	ld e,b			;d990
	nop			;d991
	nop			;d992
	nop			;d993
	nop			;d994
	nop			;d995
	nop			;d996
	nop			;d997
	nop			;d998
	nop			;d999
	nop			;d99a
	nop			;d99b
	ld b,073h		;d99c
	defb 0ddh,098h,03fh ;illegal sequence	;d99e
	cp h			;d9a1
	ld h,(hl)		;d9a2
	ld h,e			;d9a3
	sbc a,a			;d9a4
	rst 38h			;d9a5
	rst 30h			;d9a6
	ld a,a			;d9a7
	rst 38h			;d9a8
	rst 38h			;d9a9
	in a,(0ffh)		;d9aa
	rst 38h			;d9ac
	rst 38h			;d9ad
	rst 38h			;d9ae
	rst 38h			;d9af
	rst 38h			;d9b0
	cp 01fh			;d9b1
	pop de			;d9b3
	ccf			;d9b4
	push af			;d9b5
	sbc a,09dh		;d9b6
	ld a,l			;d9b8
	dec a			;d9b9
	nop			;d9ba
	nop			;d9bb
	nop			;d9bc
	nop			;d9bd
	nop			;d9be
	ret po			;d9bf
	nop			;d9c0
	ld bc,lb6eeh		;d9c1
	ld h,c			;d9c4
	rst 38h			;d9c5
	rst 38h			;d9c6
	ld sp,hl		;d9c7
	jp pe,045e9h		;d9c8
	ld b,b			;d9cb
	nop			;d9cc
	nop			;d9cd
	nop			;d9ce
	nop			;d9cf
	nop			;d9d0
	nop			;d9d1
	nop			;d9d2
	nop			;d9d3
	nop			;d9d4
	nop			;d9d5
	nop			;d9d6
	nop			;d9d7
	nop			;d9d8
	nop			;d9d9
	nop			;d9da
	nop			;d9db
	nop			;d9dc
	nop			;d9dd
	nop			;d9de
	nop			;d9df
	nop			;d9e0
	nop			;d9e1
	nop			;d9e2
	nop			;d9e3
	nop			;d9e4
	nop			;d9e5
	nop			;d9e6
	nop			;d9e7
	nop			;d9e8
	nop			;d9e9
	nop			;d9ea
	nop			;d9eb
	nop			;d9ec
	nop			;d9ed
	nop			;d9ee
	nop			;d9ef
	dec d			;d9f0
	nop			;d9f1
	nop			;d9f2
	nop			;d9f3
	nop			;d9f4
	nop			;d9f5
	nop			;d9f6
	nop			;d9f7
	nop			;d9f8
	nop			;d9f9
	jr $+120		;d9fa
	ld d,a			;d9fc
	inc bc			;d9fd
	pop bc			;d9fe
	xor a			;d9ff
	inc c			;da00
sub_da01h:
	add hl,de		;da01
	xor 07fh		;da02
	rst 38h			;da04
	di			;da05
	rst 18h			;da06
	rst 38h			;da07
	rst 38h			;da08
	call m,sub_ffcfh	;da09
	rst 38h			;da0c
	rst 38h			;da0d
	adc a,a			;da0e
	xor l			;da0f
	halt			;da10
	ccf			;da11
	cp 09fh			;da12
	ld sp,hl		;da14
	jp m,lf41fh		;da15
	ret pe			;da18
	inc de			;da19
	ret po			;da1a
	nop			;da1b
	nop			;da1c
	nop			;da1d
	nop			;da1e
	halt			;da1f
	xor d			;da20
	scf			;da21
	pop bc			;da22
	ld a,c			;da23
	and h			;da24
	nop			;da25
	rrca			;da26
	rst 38h			;da27
	jp m,055d4h		;da28
	ld b,b			;da2b
	nop			;da2c
	nop			;da2d
	nop			;da2e
	nop			;da2f
	nop			;da30
	nop			;da31
	nop			;da32
	nop			;da33
	nop			;da34
	nop			;da35
	nop			;da36
	nop			;da37
	nop			;da38
	nop			;da39
	nop			;da3a
	nop			;da3b
	nop			;da3c
	nop			;da3d
	nop			;da3e
	nop			;da3f
	nop			;da40
	nop			;da41
	nop			;da42
	nop			;da43
	nop			;da44
	nop			;da45
	nop			;da46
	nop			;da47
	nop			;da48
	nop			;da49
	nop			;da4a
	nop			;da4b
	nop			;da4c
	nop			;da4d
	nop			;da4e
	nop			;da4f
	dec bc			;da50
	ld b,b			;da51
	nop			;da52
	nop			;da53
	nop			;da54
	nop			;da55
	nop			;da56
	nop			;da57
	nop			;da58
	jp 07a6ah		;da59
	pop af			;da5c
	inc sp			;da5d
	cp (hl)			;da5e
	cpl			;da5f
	add a,b			;da60
	ld (bc),a		;da61
	ld a,a			;da62
	rst 38h			;da63
	call m,sub_ffd7h	;da64
	rst 38h			;da67
	rst 38h			;da68
	or 0ffh			;da69
	rst 38h			;da6b
	rst 38h			;da6c
	rst 38h			;da6d
	sub a			;da6e
	or 08fh			;da6f
	cp 02fh			;da71
	cp 09fh			;da73
	call m,sub_e3afh	;da75
	defb 0fdh,01eh,0bah ;illegal sequence	;da78
	ld (hl),h		;da7b
	ld h,b			;da7c
	ld a,h			;da7d
	rrca			;da7e
	sbc a,a			;da7f
	add a,b			;da80
	ld hl,(08caah)		;da81
	ld l,a			;da84
	ld sp,lf883h		;da85
	sub l			;da88
	cp h			;da89
	cp b			;da8a
	nop			;da8b
	nop			;da8c
	nop			;da8d
	nop			;da8e
	nop			;da8f
	nop			;da90
	nop			;da91
	nop			;da92
	nop			;da93
	nop			;da94
	nop			;da95
	nop			;da96
	nop			;da97
	nop			;da98
	nop			;da99
	nop			;da9a
	nop			;da9b
	nop			;da9c
	nop			;da9d
	nop			;da9e
	nop			;da9f
	nop			;daa0
	nop			;daa1
	nop			;daa2
	nop			;daa3
	nop			;daa4
	nop			;daa5
	nop			;daa6
	nop			;daa7
	nop			;daa8
	nop			;daa9
	nop			;daaa
	nop			;daab
	nop			;daac
	nop			;daad
	nop			;daae
	nop			;daaf
	dec b			;dab0
	call nc,00000h		;dab1
	nop			;dab4
	nop			;dab5
	nop			;dab6
	ld bc,0673fh		;dab7
	ld b,d			;daba
	ld d,e			;dabb
	sbc a,h			;dabc
	ld (hl),a		;dabd
	ret p			;dabe
	nop			;dabf
	nop			;dac0
	sbc a,a			;dac1
	rst 38h			;dac2
	rst 38h			;dac3
	call lffffh		;dac4
	rst 38h			;dac7
	rst 38h			;dac8
	inc sp			;dac9
	rst 38h			;daca
	rst 38h			;dacb
	rst 38h			;dacc
	rst 38h			;dacd
	xor l			;dace
	cp c			;dacf
	ret			;dad0
	ld h,a			;dad1
	call z,sub_faffh	;dad2
	sbc a,a			;dad5
	rst 38h			;dad6
	or (hl)			;dad7
	add a,(hl)		;dad8
	rst 38h			;dad9
	rst 38h			;dada
	rra			;dadb
	rst 18h			;dadc
	ld a,a			;dadd
	rst 18h			;dade
	rst 20h			;dadf
	defb 0edh ;next byte illegal after ed	;dae0
	ld d,l			;dae1
	ld d,l			;dae2
	ld b,c			;dae3
	sbc a,e			;dae4
	rst 38h			;dae5
	pop bc			;dae6
	ld sp,hl		;dae7
	ld e,d			;dae8
	rst 18h			;dae9
	jp m,000a0h		;daea
	jr z,ldaefh		;daed
ldaefh:
	nop			;daef
	nop			;daf0
	nop			;daf1
	nop			;daf2
	nop			;daf3
	nop			;daf4
	nop			;daf5
	nop			;daf6
	nop			;daf7
	nop			;daf8
	nop			;daf9
	nop			;dafa
	nop			;dafb
	nop			;dafc
	nop			;dafd
	nop			;dafe
	nop			;daff
	nop			;db00
	nop			;db01
	nop			;db02
	nop			;db03
	nop			;db04
	nop			;db05
	nop			;db06
	nop			;db07
	nop			;db08
	nop			;db09
	nop			;db0a
	nop			;db0b
	nop			;db0c
	nop			;db0d
	nop			;db0e
	ld (bc),a		;db0f
	nop			;db10
	nop			;db11
	nop			;db12
	nop			;db13
	nop			;db14
	nop			;db15
	nop			;db16
	nop			;db17
	nop			;db18
	nop			;db19
	nop			;db1a
	nop			;db1b
	nop			;db1c
	nop			;db1d
	nop			;db1e
	nop			;db1f
	nop			;db20
	nop			;db21
	ld c,01eh		;db22
	inc a			;db24
	out (080h),a		;db25
	nop			;db27
	dec b			;db28
	ccf			;db29
	xor 0fah		;db2a
	sbc a,a			;db2c
	call nc,sub_ffb3h	;db2d
	rst 38h			;db30
	rst 38h			;db31
	rst 38h			;db32
	rst 38h			;db33
	rst 38h			;db34
	rst 38h			;db35
	rst 38h			;db36
	jp (hl)			;db37
	and b			;db38
	nop			;db39
	nop			;db3a
	nop			;db3b
	nop			;db3c
	nop			;db3d
	nop			;db3e
	nop			;db3f
	ld h,b			;db40
	nop			;db41
	nop			;db42
	nop			;db43
	nop			;db44
	nop			;db45
	nop			;db46
	inc bc			;db47
	ld h,b			;db48
	nop			;db49
	nop			;db4a
	nop			;db4b
	nop			;db4c
	nop			;db4d
	nop			;db4e
	nop			;db4f
	nop			;db50
	nop			;db51
	nop			;db52
	nop			;db53
	nop			;db54
	nop			;db55
	nop			;db56
	nop			;db57
	nop			;db58
	nop			;db59
	nop			;db5a
	nop			;db5b
	nop			;db5c
	nop			;db5d
	nop			;db5e
	nop			;db5f
	nop			;db60
	nop			;db61
	nop			;db62
	nop			;db63
	nop			;db64
	nop			;db65
	nop			;db66
	nop			;db67
	nop			;db68
	nop			;db69
	nop			;db6a
	nop			;db6b
	nop			;db6c
	nop			;db6d
	nop			;db6e
	ld b,080h		;db6f
	nop			;db71
	nop			;db72
	nop			;db73
	nop			;db74
	nop			;db75
	nop			;db76
	nop			;db77
	nop			;db78
	nop			;db79
	nop			;db7a
	nop			;db7b
	nop			;db7c
	nop			;db7d
	nop			;db7e
	nop			;db7f
	ld (bc),a		;db80
	jp lf9a9h		;db81
	di			;db84
	ld a,l			;db85
	call pe,sub_bf1ch	;db86
	sbc a,(hl)		;db89
	rst 38h			;db8a
	sub l			;db8b
	rst 38h			;db8c
	rst 38h			;db8d
	call p,03ff4h		;db8e
	rst 38h			;db91
	rst 38h			;db92
	rst 38h			;db93
	rst 38h			;db94
	rst 38h			;db95
	rst 38h			;db96
	jp m,000b4h		;db97
	nop			;db9a
	nop			;db9b
	nop			;db9c
	nop			;db9d
	nop			;db9e
	ld bc,000c8h		;db9f
	nop			;dba2
	nop			;dba3
	nop			;dba4
	scf			;dba5
	rst 38h			;dba6
	ld b,b			;dba7
	dec a			;dba8
	nop			;dba9
	nop			;dbaa
	nop			;dbab
	nop			;dbac
	nop			;dbad
	nop			;dbae
	nop			;dbaf
	nop			;dbb0
	nop			;dbb1
	nop			;dbb2
	nop			;dbb3
	nop			;dbb4
	nop			;dbb5
	nop			;dbb6
	nop			;dbb7
	nop			;dbb8
	nop			;dbb9
	nop			;dbba
	nop			;dbbb
	nop			;dbbc
	nop			;dbbd
	nop			;dbbe
	nop			;dbbf
	nop			;dbc0
	nop			;dbc1
	nop			;dbc2
	nop			;dbc3
	nop			;dbc4
	nop			;dbc5
	nop			;dbc6
	nop			;dbc7
	nop			;dbc8
	nop			;dbc9
	nop			;dbca
	nop			;dbcb
	nop			;dbcc
ldbcdh:
	nop			;dbcd
	nop			;dbce
	dec bc			;dbcf
	cp b			;dbd0
	nop			;dbd1
	nop			;dbd2
	nop			;dbd3
	nop			;dbd4
	nop			;dbd5
	nop			;dbd6
	nop			;dbd7
	nop			;dbd8
	nop			;dbd9
	nop			;dbda
	nop			;dbdb
	nop			;dbdc
	nop			;dbdd
	nop			;dbde
	rlca			;dbdf
	jr c,ldbcdh		;dbe0
	ld sp,hl		;dbe2
	rst 0			;dbe3
	call nz,0733bh		;dbe4
	rst 38h			;dbe7
	sbc a,(hl)		;dbe8
	rst 38h			;dbe9
	cp 0a7h			;dbea
	rst 38h			;dbec
	rst 38h			;dbed
	rst 38h			;dbee
	pop af			;dbef
	adc a,(iy-005h)		;dbf0
	ld c,078h		;dbf3
	rst 38h			;dbf5
	rst 38h			;dbf6
	cp 0a7h			;dbf7
	ld b,b			;dbf9
	nop			;dbfa
	nop			;dbfb
	nop			;dbfc
	nop			;dbfd
	nop			;dbfe
	nop			;dbff
	ld a,0a8h		;dc00
	nop			;dc02
	add a,b			;dc03
	nop			;dc04
	rrca			;dc05
	rst 18h			;dc06
	ld a,(iy-080h)		;dc07
	nop			;dc0a
	nop			;dc0b
	nop			;dc0c
	nop			;dc0d
	nop			;dc0e
	nop			;dc0f
	nop			;dc10
	nop			;dc11
	nop			;dc12
	nop			;dc13
	nop			;dc14
	nop			;dc15
	nop			;dc16
	nop			;dc17
	nop			;dc18
	nop			;dc19
	nop			;dc1a
	nop			;dc1b
	nop			;dc1c
	nop			;dc1d
	nop			;dc1e
	nop			;dc1f
	nop			;dc20
	nop			;dc21
	nop			;dc22
	nop			;dc23
	nop			;dc24
	nop			;dc25
	nop			;dc26
	nop			;dc27
	nop			;dc28
	nop			;dc29
	nop			;dc2a
	nop			;dc2b
	nop			;dc2c
	nop			;dc2d
	nop			;dc2e
	dec de			;dc2f
	or b			;dc30
	nop			;dc31
	nop			;dc32
	nop			;dc33
	nop			;dc34
	nop			;dc35
	nop			;dc36
	nop			;dc37
	nop			;dc38
	nop			;dc39
	nop			;dc3a
	nop			;dc3b
	nop			;dc3c
	nop			;dc3d
	defb 0edh ;next byte illegal after ed	;dc3e
	di			;dc3f
	sbc a,d			;dc40
	ld l,0fbh		;dc41
	add a,(hl)		;dc43
	add a,c			;dc44
	rst 8			;dc45
	rst 38h			;dc46
	sbc a,(hl)		;dc47
	rst 38h			;dc48
	rst 38h			;dc49
	push hl			;dc4a
	ld a,a			;dc4b
	rst 38h			;dc4c
	rst 38h			;dc4d
	rst 38h			;dc4e
	rst 38h			;dc4f
	call m,02f7fh		;dc50
	cp e			;dc53
	rst 28h			;dc54
	jp nc,0ff03h		;dc55
	ret pe			;dc58
	ret pe			;dc59
	nop			;dc5a
	nop			;dc5b
	nop			;dc5c
	nop			;dc5d
	nop			;dc5e
	nop			;dc5f
	nop			;dc60
	rst 38h			;dc61
	ld (hl),h		;dc62
	ld bc,lffffh		;dc63
	rst 30h			;dc66
	ld e,a			;dc67
	res 4,b			;dc68
	nop			;dc6a
	nop			;dc6b
	nop			;dc6c
	nop			;dc6d
	nop			;dc6e
	nop			;dc6f
	nop			;dc70
	nop			;dc71
	nop			;dc72
	nop			;dc73
	nop			;dc74
	nop			;dc75
	nop			;dc76
	nop			;dc77
	nop			;dc78
	nop			;dc79
	nop			;dc7a
ldc7bh:
	nop			;dc7b
	nop			;dc7c
	nop			;dc7d
	nop			;dc7e
	nop			;dc7f
	nop			;dc80
	nop			;dc81
	nop			;dc82
	nop			;dc83
	nop			;dc84
	nop			;dc85
	nop			;dc86
	nop			;dc87
	nop			;dc88
	nop			;dc89
	nop			;dc8a
	nop			;dc8b
	nop			;dc8c
	nop			;dc8d
	nop			;dc8e
	jr c,ldcbdh		;dc8f
	nop			;dc91
	nop			;dc92
	nop			;dc93
	nop			;dc94
	nop			;dc95
	nop			;dc96
	nop			;dc97
	nop			;dc98
	nop			;dc99
	nop			;dc9a
	nop			;dc9b
	ld b,a			;dc9c
	ex de,hl		;dc9d
	cp (hl)			;dc9e
	ld l,e			;dc9f
	rrca			;dca0
	ld sp,lc7c0h		;dca1
	ccf			;dca4
	rst 38h			;dca5
	and 0ffh		;dca6
	rst 38h			;dca8
	rst 38h			;dca9
	xor c			;dcaa
	rst 38h			;dcab
	rst 38h			;dcac
	rst 38h			;dcad
	rst 38h			;dcae
	rst 38h			;dcaf
	rst 38h			;dcb0
	rst 38h			;dcb1
	rrca			;dcb2
	call pe,sub_f43fh	;dcb3
	sbc a,(hl)		;dcb6
	ret z			;dcb7
	ld a,0bdh		;dcb8
	nop			;dcba
	nop			;dcbb
ldcbch:
	nop			;dcbc
ldcbdh:
	nop			;dcbd
	nop			;dcbe
	ld a,h			;dcbf
	nop			;dcc0
	nop			;dcc1
	sbc a,a			;dcc2
	cp d			;dcc3
	jr nz,ldd45h		;dcc4
	rst 38h			;dcc6
	cp 0f5h			;dcc7
	ld l,c			;dcc9
	ld l,d			;dcca
	and b			;dccb
	nop			;dccc
	nop			;dccd
	nop			;dcce
	nop			;dccf
	nop			;dcd0
	nop			;dcd1
	nop			;dcd2
	nop			;dcd3
	nop			;dcd4
	nop			;dcd5
	nop			;dcd6
	nop			;dcd7
	nop			;dcd8
	nop			;dcd9
	nop			;dcda
	nop			;dcdb
	nop			;dcdc
	nop			;dcdd
	nop			;dcde
	nop			;dcdf
	nop			;dce0
	nop			;dce1
	nop			;dce2
	nop			;dce3
	nop			;dce4
	nop			;dce5
ldce6h:
	nop			;dce6
	nop			;dce7
	nop			;dce8
	nop			;dce9
	nop			;dcea
	nop			;dceb
	nop			;dcec
	nop			;dced
	nop			;dcee
	nop			;dcef
	dec e			;dcf0
	nop			;dcf1
	nop			;dcf2
	nop			;dcf3
	nop			;dcf4
	nop			;dcf5
	nop			;dcf6
	nop			;dcf7
	nop			;dcf8
	nop			;dcf9
	inc c			;dcfa
	dec sp			;dcfb
	jr z,ldce6h		;dcfc
	dec a			;dcfe
	sbc a,(hl)		;dcff
	jp ldcbch		;dd00
	rst 38h			;dd03
	rst 38h			;dd04
	rst 20h			;dd05
	cp a			;dd06
	rst 38h			;dd07
	rst 38h			;dd08
	ld sp,hl		;dd09
	ld e,a			;dd0a
	rst 38h			;dd0b
	rst 38h			;dd0c
	rst 38h			;dd0d
	ld e,a			;dd0e
	ld d,(hl)		;dd0f
	defb 0fdh,01fh,0ffh ;illegal sequence	;dd10
	ld c,a			;dd13
	call m,sub_bffah	;dd14
	jp nc,08be8h		;dd17
	ret nc			;dd1a
	nop			;dd1b
	nop			;dd1c
	nop			;dd1d
	nop			;dd1e
	inc sp			;dd1f
	ld d,l			;dd20
	ld c,0b9h		;dd21
	add a,c			;dd23
	or h			;dd24
	nop			;dd25
	inc bc			;dd26
	rst 38h			;dd27
	call p,07ad4h		;dd28
	add a,b			;dd2b
	nop			;dd2c
	nop			;dd2d
	nop			;dd2e
	nop			;dd2f
	nop			;dd30
	nop			;dd31
	nop			;dd32
	nop			;dd33
	nop			;dd34
	nop			;dd35
	nop			;dd36
	nop			;dd37
	nop			;dd38
	nop			;dd39
	nop			;dd3a
	nop			;dd3b
	nop			;dd3c
	nop			;dd3d
	nop			;dd3e
	nop			;dd3f
	nop			;dd40
	nop			;dd41
	nop			;dd42
	nop			;dd43
	nop			;dd44
ldd45h:
	nop			;dd45
	nop			;dd46
	nop			;dd47
	nop			;dd48
	nop			;dd49
	nop			;dd4a
	nop			;dd4b
	nop			;dd4c
	nop			;dd4d
	nop			;dd4e
	nop			;dd4f
	dec c			;dd50
	ld b,b			;dd51
	nop			;dd52
	nop			;dd53
	nop			;dd54
	nop			;dd55
	nop			;dd56
	nop			;dd57
	nop			;dd58
	ld h,d			;dd59
	add a,h			;dd5a
	pop af			;dd5b
	adc a,0d8h		;dd5c
	ld d,h			;dd5e
	or 000h			;dd5f
	inc b			;dd61
	rst 38h			;dd62
	rst 38h			;dd63
	ld sp,hl		;dd64
	ld c,a			;dd65
	rst 38h			;dd66
	rst 38h			;dd67
	rst 38h			;dd68
	jp pe,sub_ff7fh		;dd69
	rst 38h			;dd6c
	rst 38h			;dd6d
	ld c,e			;dd6e
	defb 0fdh,043h,0fbh ;illegal sequence	;dd6f
	add a,l			;dd72
	defb 0fdh,04fh,0ffh ;illegal sequence	;dd73
	ld d,a			;dd76
	rst 10h			;dd77
	rst 38h			;dd78
	ld e,03ah		;dd79
	ld a,(03f30h)		;dd7b
	rlca			;dd7e
	add a,d			;dd7f
	rst 38h			;dd80
	add a,b			;dd81
	dec d			;dd82
	ld b,b			;dd83
	rst 10h			;dd84
	sbc a,b			;dd85
	pop bc			;dd86
	rst 0			;dd87
	ld h,0f7h		;dd88
	ld d,b			;dd8a
	nop			;dd8b
	nop			;dd8c
	nop			;dd8d
	nop			;dd8e
	nop			;dd8f
	nop			;dd90
	nop			;dd91
	nop			;dd92
	nop			;dd93
	nop			;dd94
	nop			;dd95
	nop			;dd96
	nop			;dd97
	nop			;dd98
	nop			;dd99
	nop			;dd9a
	nop			;dd9b
	nop			;dd9c
	nop			;dd9d
	nop			;dd9e
	nop			;dd9f
	nop			;dda0
	nop			;dda1
	nop			;dda2
	nop			;dda3
	nop			;dda4
	nop			;dda5
	nop			;dda6
	nop			;dda7
	nop			;dda8
	nop			;dda9
	nop			;ddaa
	nop			;ddab
	nop			;ddac
	nop			;ddad
	nop			;ddae
	nop			;ddaf
	inc b			;ddb0
	xor l			;ddb1
	nop			;ddb2
	nop			;ddb3
	nop			;ddb4
	nop			;ddb5
	nop			;ddb6
	nop			;ddb7
	cp e			;ddb8
	out (08dh),a		;ddb9
	cp l			;ddbb
	jr c,lde39h		;ddbc
	ret nz			;ddbe
	nop			;ddbf
	ld bc,lff3fh		;ddc0
	rst 38h			;ddc3
	adc a,d			;ddc4
	rst 38h			;ddc5
	rst 38h			;ddc6
	rst 38h			;ddc7
	cp 057h			;ddc8
	rst 38h			;ddca
	rst 38h			;ddcb
	rst 38h			;ddcc
	rst 38h			;ddcd
	push bc			;ddce
	rst 20h			;ddcf
	ld l,d			;ddd0
	scf			;ddd1
	call po,lfd7fh		;ddd2
	ld c,a			;ddd5
	rst 38h			;ddd6
	ret			;ddd7
	ld hl,(07f7eh)		;ddd8
	ccf			;dddb
	ld e,a			;dddc
	ld a,a			;dddd
	cp a			;ddde
	rst 20h			;dddf
	jp pe,laaaah		;dde0
	add a,c			;dde3
	and 07fh		;dde4
	sbc a,h			;dde6
	ld a,(hl)		;dde7
	xor l			;dde8
	rst 38h			;dde9
	push af			;ddea
	ld d,b			;ddeb
	nop			;ddec
	inc (hl)		;dded
	nop			;ddee
	nop			;ddef
	nop			;ddf0
	nop			;ddf1
	nop			;ddf2
	nop			;ddf3
	nop			;ddf4
	nop			;ddf5
	nop			;ddf6
	nop			;ddf7
	nop			;ddf8
	nop			;ddf9
	nop			;ddfa
	nop			;ddfb
	nop			;ddfc
lddfdh:
	nop			;ddfd
	nop			;ddfe
	nop			;ddff
	nop			;de00
	nop			;de01
	nop			;de02
	nop			;de03
	nop			;de04
	nop			;de05
	nop			;de06
	nop			;de07
	nop			;de08
	nop			;de09
	nop			;de0a
	nop			;de0b
	nop			;de0c
	nop			;de0d
	nop			;de0e
	ld (bc),a		;de0f
	nop			;de10
	nop			;de11
	nop			;de12
	nop			;de13
	nop			;de14
	nop			;de15
	nop			;de16
	nop			;de17
	nop			;de18
	nop			;de19
	nop			;de1a
	nop			;de1b
	nop			;de1c
	nop			;de1d
	nop			;de1e
	nop			;de1f
	nop			;de20
	nop			;de21
	dec de			;de22
	dec e			;de23
	ld (hl),0f1h		;de24
	ld b,b			;de26
	nop			;de27
	ld a,(bc)		;de28
	ld a,a			;de29
	defb 0ddh,0f3h,03fh ;illegal sequence	;de2a
	xor d			;de2d
	ld l,c			;de2e
	ld a,a			;de2f
	rst 38h			;de30
	rst 38h			;de31
	rst 38h			;de32
	rst 38h			;de33
	rst 38h			;de34
	rst 38h			;de35
	rst 38h			;de36
	push de			;de37
	and b			;de38
lde39h:
	nop			;de39
	nop			;de3a
	nop			;de3b
	nop			;de3c
	nop			;de3d
	nop			;de3e
	nop			;de3f
	ret nc			;de40
	nop			;de41
	nop			;de42
	nop			;de43
	nop			;de44
	nop			;de45
	nop			;de46
	ld bc,000d0h		;de47
	nop			;de4a
	nop			;de4b
	nop			;de4c
	nop			;de4d
	nop			;de4e
	nop			;de4f
	nop			;de50
	nop			;de51
	nop			;de52
	nop			;de53
	nop			;de54
	nop			;de55
	nop			;de56
	nop			;de57
	nop			;de58
	nop			;de59
	nop			;de5a
	nop			;de5b
	nop			;de5c
	nop			;de5d
	nop			;de5e
	nop			;de5f
	nop			;de60
	nop			;de61
	nop			;de62
	nop			;de63
	nop			;de64
	nop			;de65
	nop			;de66
	nop			;de67
	nop			;de68
	nop			;de69
	nop			;de6a
	nop			;de6b
	nop			;de6c
	nop			;de6d
	nop			;de6e
	rlca			;de6f
	add a,b			;de70
	nop			;de71
	nop			;de72
	nop			;de73
	nop			;de74
	nop			;de75
	nop			;de76
	nop			;de77
	nop			;de78
	nop			;de79
	nop			;de7a
	nop			;de7b
	nop			;de7c
	nop			;de7d
	nop			;de7e
	nop			;de7f
	ld bc,05d6fh		;de80
	call nz,03b2ch		;de83
	call p,lff39h		;de86
	dec a			;de89
	rst 38h			;de8a
	ret c			;de8b
	rst 38h			;de8c
	rst 38h			;de8d
	jp m,01f7bh		;de8e
	rst 38h			;de91
	rst 38h			;de92
	rst 38h			;de93
	rst 38h			;de94
	rst 38h			;de95
	rst 38h			;de96
	defb 0fdh,03ah,000h ;illegal sequence	;de97
	nop			;de9a
	nop			;de9b
	nop			;de9c
	nop			;de9d
	nop			;de9e
	nop			;de9f
	ret nc			;dea0
	nop			;dea1
	nop			;dea2
	nop			;dea3
	nop			;dea4
	dec sp			;dea5
	rst 38h			;dea6
	and b			;dea7
	rra			;dea8
	nop			;dea9
	nop			;deaa
	nop			;deab
	nop			;deac
	nop			;dead
	nop			;deae
	nop			;deaf
	nop			;deb0
	nop			;deb1
	nop			;deb2
	nop			;deb3
	nop			;deb4
	nop			;deb5
	nop			;deb6
	nop			;deb7
	nop			;deb8
	nop			;deb9
	nop			;deba
	nop			;debb
	nop			;debc
	nop			;debd
	nop			;debe
	nop			;debf
	nop			;dec0
	nop			;dec1
	nop			;dec2
	nop			;dec3
	nop			;dec4
	nop			;dec5
	nop			;dec6
	nop			;dec7
	nop			;dec8
	nop			;dec9
	nop			;deca
	nop			;decb
	nop			;decc
	nop			;decd
	nop			;dece
	ld a,(bc)		;decf
	ret c			;ded0
	nop			;ded1
	nop			;ded2
	nop			;ded3
	nop			;ded4
	nop			;ded5
	nop			;ded6
	nop			;ded7
	nop			;ded8
	nop			;ded9
	nop			;deda
	nop			;dedb
	nop			;dedc
	nop			;dedd
	nop			;dede
	adc a,0f9h		;dedf
	ret pe			;dee1
	ret m			;dee2
	jr c,ldf20h		;dee3
	call c,sub_ffe7h	;dee5
	dec a			;dee8
	rst 38h			;dee9
	call m,sub_ffcfh	;deea
	rst 38h			;deed
	rst 38h			;deee
	ret m			;deef
	ld a,(hl)		;def0
	ld b,h			;def1
	ld a,l			;def2
	rst 18h			;def3
	ld (hl),07fh		;def4
	rst 38h			;def6
	defb 0fdh,057h,040h ;illegal sequence	;def7
	nop			;defa
	nop			;defb
	nop			;defc
	nop			;defd
	nop			;defe
	nop			;deff
	dec e			;df00
	ld (hl),h		;df01
	nop			;df02
	ret po			;df03
sub_df04h:
	nop			;df04
	ld c,0dfh		;df05
	cp 0beh			;df07
	ret nz			;df09
	nop			;df0a
	nop			;df0b
	nop			;df0c
	nop			;df0d
	nop			;df0e
	nop			;df0f
	nop			;df10
	nop			;df11
	nop			;df12
	nop			;df13
	nop			;df14
	nop			;df15
	nop			;df16
	nop			;df17
	nop			;df18
	nop			;df19
	nop			;df1a
	nop			;df1b
	nop			;df1c
	nop			;df1d
	nop			;df1e
	nop			;df1f
ldf20h:
	nop			;df20
	nop			;df21
	nop			;df22
	nop			;df23
	nop			;df24
	nop			;df25
	nop			;df26
	nop			;df27
	nop			;df28
	nop			;df29
	nop			;df2a
	nop			;df2b
	nop			;df2c
	nop			;df2d
	nop			;df2e
	ld d,0d0h		;df2f
	nop			;df31
	nop			;df32
	nop			;df33
	nop			;df34
	nop			;df35
	nop			;df36
	nop			;df37
	nop			;df38
	nop			;df39
	nop			;df3a
	nop			;df3b
	nop			;df3c
	jr ldfb2h		;df3d
	call pe,sub_eb37h	;df3f
	or d			;df42
	ld e,a			;df43
	ld e,e			;df44
	sbc a,a			;df45
	rst 38h			;df46
	dec a			;df47
	rst 38h			;df48
	rst 38h			;df49
	or 03fh			;df4a
	rst 38h			;df4c
	rst 38h			;df4d
	rst 38h			;df4e
	rst 38h			;df4f
	cp 03fh			;df50
	ld d,e			;df52
	exx			;df53
	rst 8			;df54
	pop de			;df55
	ld a,c			;df56
	rst 38h			;df57
	call p,00068h		;df58
	nop			;df5b
	nop			;df5c
	nop			;df5d
	nop			;df5e
	nop			;df5f
	nop			;df60
	ld a,(hl)		;df61
	jp pe,0ff00h		;df62
	rst 38h			;df65
	xor 0dfh		;df66
	ex de,hl		;df68
	and b			;df69
	nop			;df6a
	djnz ldf6dh		;df6b
ldf6dh:
	nop			;df6d
	nop			;df6e
	nop			;df6f
	nop			;df70
	nop			;df71
	nop			;df72
	nop			;df73
	nop			;df74
	nop			;df75
	nop			;df76
	nop			;df77
	nop			;df78
	nop			;df79
	nop			;df7a
	nop			;df7b
	nop			;df7c
	nop			;df7d
	nop			;df7e
	nop			;df7f
	nop			;df80
	nop			;df81
	nop			;df82
	nop			;df83
	nop			;df84
	nop			;df85
	nop			;df86
	nop			;df87
	nop			;df88
	nop			;df89
	nop			;df8a
	nop			;df8b
	nop			;df8c
	nop			;df8d
	nop			;df8e
	jr z,ldfc5h		;df8f
	nop			;df91
	nop			;df92
	nop			;df93
	nop			;df94
	nop			;df95
	nop			;df96
	nop			;df97
	nop			;df98
	nop			;df99
	nop			;df9a
	nop			;df9b
	daa			;df9c
	ld d,b			;df9d
	ld b,a			;df9e
	jp pe,lc3e5h		;df9f
	ei			;dfa2
	xor h			;dfa3
	ld a,a			;dfa4
	rst 38h			;dfa5
	rst 8			;dfa6
	ld a,a			;dfa7
	rst 38h			;dfa8
	rst 38h			;dfa9
	or e			;dfaa
	rst 38h			;dfab
	rst 38h			;dfac
	rst 38h			;dfad
	rst 38h			;dfae
	cp (hl)			;dfaf
	xor a			;dfb0
	rst 38h			;dfb1
ldfb2h:
	ld b,e			;dfb2
	jp p,lf57fh		;dfb3
	rst 18h			;dfb6
	ld b,l			;dfb7
	sbc a,l			;dfb8
	ld e,080h		;dfb9
	nop			;dfbb
	nop			;dfbc
	nop			;dfbd
	nop			;dfbe
	ld l,a			;dfbf
	add a,b			;dfc0
	nop			;dfc1
	ld a,a			;dfc2
	halt			;dfc3
	and b			;dfc4
ldfc5h:
	ccf			;dfc5
	rst 38h			;dfc6
	rst 38h			;dfc7
	ld sp,hl		;dfc8
	ld l,b			;dfc9
	sub l			;dfca
	ld b,b			;dfcb
	nop			;dfcc
	nop			;dfcd
	nop			;dfce
	nop			;dfcf
	nop			;dfd0
	nop			;dfd1
	nop			;dfd2
	nop			;dfd3
	nop			;dfd4
	nop			;dfd5
	nop			;dfd6
	nop			;dfd7
	nop			;dfd8
	nop			;dfd9
	nop			;dfda
	nop			;dfdb
	nop			;dfdc
	nop			;dfdd
	nop			;dfde
	nop			;dfdf
	nop			;dfe0
	nop			;dfe1
	nop			;dfe2
	nop			;dfe3
	nop			;dfe4
	nop			;dfe5
	nop			;dfe6
	nop			;dfe7
	nop			;dfe8
	nop			;dfe9
	nop			;dfea
	nop			;dfeb
	nop			;dfec
	nop			;dfed
	nop			;dfee
	nop			;dfef
	dec de			;dff0
	nop			;dff1
	nop			;dff2
	nop			;dff3
	nop			;dff4
	nop			;dff5
	nop			;dff6
	nop			;dff7
	nop			;dff8
	nop			;dff9
	adc a,03eh		;dffa
	ret nc			;dffc
	rst 20h			;dffd
	ld a,d			;dffe
	ret po			;dfff
	cp e			;e000
	cp a			;e001
	ld sp,lffffh		;e002
	rst 8			;e005
	ld a,a			;e006
	rst 38h			;e007
	rst 38h			;e008
	defb 0fdh,08fh,0ffh ;illegal sequence	;e009
	rst 38h			;e00c
	rst 38h			;e00d
	sbc a,a			;e00e
	or e			;e00f
	cp 08fh			;e010
	rst 38h			;e012
	and a			;e013
	cp 0fah			;e014
	ccf			;e016
	ret p			;e017
	call p,sub_f061h	;e018
	nop			;e01b
	nop			;e01c
	nop			;e01d
	nop			;e01e
	ld a,(0a1aah)		;e01f
	or (hl)			;e022
	dec bc			;e023
	ld (hl),d		;e024
	nop			;e025
	inc e			;e026
	ld a,a			;e027
	jp z,035d7h		;e028
	nop			;e02b
	nop			;e02c
	nop			;e02d
	nop			;e02e
	nop			;e02f
	nop			;e030
	nop			;e031
	nop			;e032
	nop			;e033
	nop			;e034
	nop			;e035
	nop			;e036
	nop			;e037
	nop			;e038
	nop			;e039
	nop			;e03a
	nop			;e03b
	nop			;e03c
	nop			;e03d
	nop			;e03e
	nop			;e03f
	nop			;e040
	nop			;e041
	nop			;e042
	nop			;e043
	nop			;e044
	nop			;e045
	nop			;e046
	nop			;e047
	nop			;e048
	nop			;e049
	nop			;e04a
	nop			;e04b
	nop			;e04c
	nop			;e04d
	nop			;e04e
	nop			;e04f
	ld a,(bc)		;e050
	ret nz			;e051
	nop			;e052
	nop			;e053
	nop			;e054
	nop			;e055
le056h:
	nop			;e056
	nop			;e057
	inc b			;e058
	ld (hl),e		;e059
	add hl,sp		;e05a
	call pe,0731eh		;e05b
	xor d			;e05e
	call m,00d00h		;e05f
	rst 38h			;e062
	rst 38h			;e063
	pop af			;e064
	rst 18h			;e065
	rst 38h			;e066
	rst 38h			;e067
	rst 38h			;e068
	call z,lffffh		;e069
	rst 38h			;e06c
	rst 38h			;e06d
	xor e			;e06e
	ei			;e06f
	ld d,c			;e070
	call m,0ff50h		;e071
	and a			;e074
	rst 38h			;e075
	inc (hl)		;e076
	xor a			;e077
	rst 38h			;e078
	ccf			;e079
	dec a			;e07a
	dec e			;e07b
	jr c,le0bdh		;e07c
	rlca			;e07e
	adc a,l			;e07f
	rra			;e080
	ld a,a			;e081
	add a,b			;e082
	dec hl			;e083
	xor a			;e084
	adc a,070h		;e085
	inc a			;e087
	ld c,l			;e088
	defb 0ddh,0a0h,000h ;illegal sequence	;e089
	nop			;e08c
	nop			;e08d
	nop			;e08e
	nop			;e08f
	nop			;e090
	nop			;e091
	nop			;e092
	nop			;e093
	nop			;e094
	nop			;e095
	nop			;e096
	nop			;e097
	nop			;e098
	nop			;e099
	nop			;e09a
	nop			;e09b
	nop			;e09c
	nop			;e09d
	nop			;e09e
	nop			;e09f
	nop			;e0a0
	nop			;e0a1
	nop			;e0a2
	nop			;e0a3
	nop			;e0a4
	nop			;e0a5
	nop			;e0a6
	nop			;e0a7
	nop			;e0a8
	nop			;e0a9
le0aah:
	nop			;e0aa
	nop			;e0ab
	nop			;e0ac
	nop			;e0ad
	nop			;e0ae
	nop			;e0af
	ld (bc),a		;e0b0
	in a,(0a0h)		;e0b1
	nop			;e0b3
	nop			;e0b4
	nop			;e0b5
	nop			;e0b6
	ld de,08eaeh		;e0b7
	scf			;e0ba
	ld a,l			;e0bb
	ld sp,hl		;e0bc
le0bdh:
	ld a,l			;e0bd
le0beh:
	add a,b			;e0be
	nop			;e0bf
	inc bc			;e0c0
	ld a,a			;e0c1
	rst 38h			;e0c2
	rst 38h			;e0c3
	defb 0ddh,0ffh,0ffh ;illegal sequence	;e0c4
	rst 38h			;e0c7
	rst 38h			;e0c8
	ld d,e			;e0c9
	rst 38h			;e0ca
	rst 38h			;e0cb
	rst 38h			;e0cc
	rst 38h			;e0cd
	and l			;e0ce
	ld l,a			;e0cf
	or c			;e0d0
	daa			;e0d1
	and 0ffh		;e0d2
	rst 38h			;e0d4
	and a			;e0d5
	rst 38h			;e0d6
	ex (sp),hl		;e0d7
	ld d,l			;e0d8
	ld b,b			;e0d9
	rst 38h			;e0da
	ccf			;e0db
	sbc a,a			;e0dc
	ld a,a			;e0dd
	cp a			;e0de
	rst 20h			;e0df
	push hl			;e0e0
	ld d,l			;e0e1
	ld b,b			;e0e2
	ld a,059h		;e0e3
	rst 18h			;e0e5
	sbc a,a			;e0e6
	cp e			;e0e7
	ld a,e			;e0e8
	rst 38h			;e0e9
	jp m,000a8h		;e0ea
	inc e			;e0ed
	nop			;e0ee
	nop			;e0ef
	nop			;e0f0
	nop			;e0f1
	nop			;e0f2
	nop			;e0f3
	nop			;e0f4
	nop			;e0f5
	nop			;e0f6
	nop			;e0f7
	nop			;e0f8
	nop			;e0f9
	nop			;e0fa
	nop			;e0fb
	nop			;e0fc
	nop			;e0fd
	nop			;e0fe
le0ffh:
	nop			;e0ff
	nop			;e100
	nop			;e101
	nop			;e102
	nop			;e103
	nop			;e104
	nop			;e105
	nop			;e106
	nop			;e107
	nop			;e108
	nop			;e109
	nop			;e10a
	nop			;e10b
	nop			;e10c
	nop			;e10d
	nop			;e10e
	ld (bc),a		;e10f
	nop			;e110
	nop			;e111
	nop			;e112
	nop			;e113
	nop			;e114
	nop			;e115
	nop			;e116
	nop			;e117
	nop			;e118
	nop			;e119
	nop			;e11a
	nop			;e11b
	nop			;e11c
	nop			;e11d
	nop			;e11e
	nop			;e11f
	nop			;e120
	nop			;e121
	dec a			;e122
	rrca			;e123
	ld a,(lc069h)		;e124
	nop			;e127
	inc a			;e128
	rst 38h			;e129
	cp e			;e12a
	ei			;e12b
	ld a,a			;e12c
	inc (ix+03fh)		;e12d
	rst 38h			;e130
	rst 38h			;e131
	rst 38h			;e132
	rst 38h			;e133
	rst 38h			;e134
	rst 38h			;e135
	rst 38h			;e136
	ret pe			;e137
	ret nc			;e138
	nop			;e139
le13ah:
	nop			;e13a
	nop			;e13b
	nop			;e13c
	nop			;e13d
	nop			;e13e
	nop			;e13f
	ret po			;e140
	nop			;e141
	nop			;e142
	nop			;e143
	nop			;e144
	nop			;e145
	nop			;e146
	nop			;e147
	ret z			;e148
	nop			;e149
	nop			;e14a
	nop			;e14b
	nop			;e14c
	nop			;e14d
	nop			;e14e
	nop			;e14f
	nop			;e150
	nop			;e151
	nop			;e152
	nop			;e153
	nop			;e154
	nop			;e155
	nop			;e156
	nop			;e157
	nop			;e158
	nop			;e159
	nop			;e15a
	nop			;e15b
	nop			;e15c
	nop			;e15d
	nop			;e15e
	nop			;e15f
	nop			;e160
	nop			;e161
	nop			;e162
	nop			;e163
	nop			;e164
	nop			;e165
	nop			;e166
	nop			;e167
	nop			;e168
	nop			;e169
	nop			;e16a
	nop			;e16b
	nop			;e16c
	nop			;e16d
	nop			;e16e
	ld b,0c0h		;e16f
	nop			;e171
	nop			;e172
	nop			;e173
	nop			;e174
	nop			;e175
	nop			;e176
	nop			;e177
	nop			;e178
	nop			;e179
	nop			;e17a
	nop			;e17b
	nop			;e17c
	nop			;e17d
	nop			;e17e
	nop			;e17f
	ld bc,lf0bah		;e180
	ccf			;e183
	rst 8			;e184
	add a,c			;e185
	call p,sub_fee3h	;e186
	ld a,e			;e189
	rst 38h			;e18a
	sbc a,c			;e18b
	rst 38h			;e18c
	rst 38h			;e18d
	defb 0fdh,03ch,08fh ;illegal sequence	;e18e
	rst 38h			;e191
	rst 38h			;e192
	rst 38h			;e193
	rst 38h			;e194
	rst 38h			;e195
	rst 38h			;e196
	jp m,0009eh		;e197
	nop			;e19a
	nop			;e19b
	nop			;e19c
	nop			;e19d
	nop			;e19e
	nop			;e19f
	jr z,le1a2h		;e1a0
le1a2h:
	nop			;e1a2
	nop			;e1a3
	nop			;e1a4
	dec e			;e1a5
	ld a,a			;e1a6
	ret nc			;e1a7
	ld e,080h		;e1a8
	nop			;e1aa
	nop			;e1ab
	nop			;e1ac
	nop			;e1ad
	nop			;e1ae
	nop			;e1af
	nop			;e1b0
	nop			;e1b1
	nop			;e1b2
	nop			;e1b3
	nop			;e1b4
	nop			;e1b5
	nop			;e1b6
	nop			;e1b7
	nop			;e1b8
	nop			;e1b9
	nop			;e1ba
	nop			;e1bb
	nop			;e1bc
	nop			;e1bd
	nop			;e1be
	nop			;e1bf
	nop			;e1c0
	nop			;e1c1
	nop			;e1c2
	nop			;e1c3
	nop			;e1c4
	nop			;e1c5
	nop			;e1c6
	nop			;e1c7
	nop			;e1c8
	nop			;e1c9
	nop			;e1ca
	nop			;e1cb
	nop			;e1cc
	nop			;e1cd
	nop			;e1ce
	ld d,0a8h		;e1cf
	nop			;e1d1
	nop			;e1d2
	nop			;e1d3
	nop			;e1d4
	nop			;e1d5
	nop			;e1d6
	nop			;e1d7
	nop			;e1d8
	nop			;e1d9
	nop			;e1da
	nop			;e1db
	nop			;e1dc
	nop			;e1dd
sub_e1deh:
	nop			;e1de
	ld a,b			;e1df
	rst 20h			;e1e0
	rst 0			;e1e1
	rlca			;e1e2
	ld a,l			;e1e3
	di			;e1e4
	ex de,hl		;e1e5
	adc a,a			;e1e6
	cp 07bh			;e1e7
	rst 38h			;e1e9
	cp 0dfh			;e1ea
	rst 38h			;e1ec
	rst 38h			;e1ed
	rst 38h			;e1ee
	defb 0fdh,03fh,0a2h ;illegal sequence	;e1ef
	ld a,(hl)		;e1f2
	rst 8			;e1f3
	cp c			;e1f4
	ccf			;e1f5
	rst 38h			;e1f6
	cp 0a7h			;e1f7
	ld b,b			;e1f9
	nop			;e1fa
	nop			;e1fb
	nop			;e1fc
	nop			;e1fd
	nop			;e1fe
	nop			;e1ff
	rrca			;e200
	ld l,d			;e201
	nop			;e202
	ld a,b			;e203
	nop			;e204
	ld a,h			;e205
	rst 10h			;e206
	defb 0fdh,05fh,040h ;illegal sequence	;e207
	nop			;e20a
	nop			;e20b
	nop			;e20c
le20dh:
	nop			;e20d
	nop			;e20e
	nop			;e20f
	nop			;e210
	nop			;e211
	nop			;e212
	nop			;e213
	nop			;e214
	nop			;e215
	nop			;e216
	nop			;e217
	nop			;e218
	nop			;e219
	nop			;e21a
	nop			;e21b
	nop			;e21c
	nop			;e21d
	nop			;e21e
	nop			;e21f
	nop			;e220
	nop			;e221
	nop			;e222
	nop			;e223
	nop			;e224
	nop			;e225
	nop			;e226
	nop			;e227
	nop			;e228
	nop			;e229
	nop			;e22a
	nop			;e22b
	nop			;e22c
	nop			;e22d
	nop			;e22e
	ld d,0b0h		;e22f
	nop			;e231
	nop			;e232
	nop			;e233
	nop			;e234
	nop			;e235
	nop			;e236
	nop			;e237
	nop			;e238
	nop			;e239
	nop			;e23a
	nop			;e23b
	nop			;e23c
	inc c			;e23d
	call po,sub_a6ddh	;e23e
	call m,sub_df04h	;e241
	and 03fh		;e244
	cp 07bh			;e246
	rst 38h			;e248
	rst 38h			;e249
	and 07fh		;e24a
	rst 38h			;e24c
	rst 38h			;e24d
	rst 38h			;e24e
	rst 38h			;e24f
	rst 38h			;e250
	rra			;e251
	and l			;e252
	ret c			;e253
	adc a,a			;e254
	jp c,lff34h		;e255
sub_e258h:
	jp pe,00074h		;e258
	nop			;e25b
	nop			;e25c
	nop			;e25d
	nop			;e25e
	nop			;e25f
	nop			;e260
	ld a,0dbh		;e261
	inc c			;e263
	rst 38h			;e264
	rst 38h			;e265
	ld sp,hl		;e266
	cp a			;e267
	set 2,b			;e268
	nop			;e26a
	ld h,b			;e26b
	nop			;e26c
	nop			;e26d
	nop			;e26e
	nop			;e26f
	nop			;e270
	nop			;e271
	nop			;e272
	nop			;e273
	nop			;e274
	nop			;e275
	nop			;e276
	nop			;e277
	nop			;e278
	nop			;e279
	nop			;e27a
	nop			;e27b
	nop			;e27c
	nop			;e27d
	nop			;e27e
	nop			;e27f
	nop			;e280
	nop			;e281
	nop			;e282
	nop			;e283
	nop			;e284
	nop			;e285
	nop			;e286
	nop			;e287
	nop			;e288
	nop			;e289
	nop			;e28a
	nop			;e28b
	nop			;e28c
	nop			;e28d
	nop			;e28e
	jr z,le2bdh		;e28f
	nop			;e291
	nop			;e292
	nop			;e293
	nop			;e294
	nop			;e295
	nop			;e296
	nop			;e297
	nop			;e298
	nop			;e299
	nop			;e29a
	inc c			;e29b
	halt			;e29c
	sbc a,l			;e29d
	ret m			;e29e
le29fh:
	pop de			;e29f
	pop af			;e2a0
	ld c,0a1h		;e2a1
	sbc a,c			;e2a3
	rst 38h			;e2a4
	rst 38h			;e2a5
	sbc a,(hl)		;e2a6
	rst 38h			;e2a7
	rst 38h			;e2a8
	rst 38h			;e2a9
	or a			;e2aa
	rst 38h			;e2ab
	rst 38h			;e2ac
	rst 38h			;e2ad
	push af			;e2ae
	inc e			;e2af
	rlca			;e2b0
	rst 38h			;e2b1
	xor c			;e2b2
	defb 0fdh,07fh,0f4h ;illegal sequence	;e2b3
	sbc a,a			;e2b6
	ld l,c			;e2b7
	ld c,(hl)		;e2b8
	sbc a,(hl)		;e2b9
	add a,b			;e2ba
	nop			;e2bb
	nop			;e2bc
le2bdh:
	nop			;e2bd
	nop			;e2be
	ld hl,000f0h		;e2bf
	ccf			;e2c2
	ld a,d			;e2c3
	sub b			;e2c4
	rrca			;e2c5
	rst 38h			;e2c6
	rst 38h			;e2c7
	or l			;e2c8
	ld l,b			;e2c9
	xor d			;e2ca
	and b			;e2cb
	nop			;e2cc
	nop			;e2cd
	nop			;e2ce
	nop			;e2cf
	nop			;e2d0
	nop			;e2d1
	nop			;e2d2
	nop			;e2d3
	nop			;e2d4
	nop			;e2d5
	nop			;e2d6
	nop			;e2d7
	nop			;e2d8
	nop			;e2d9
	nop			;e2da
	nop			;e2db
	nop			;e2dc
	nop			;e2dd
	nop			;e2de
	nop			;e2df
	nop			;e2e0
	nop			;e2e1
	nop			;e2e2
	nop			;e2e3
	nop			;e2e4
	nop			;e2e5
	nop			;e2e6
	nop			;e2e7
	nop			;e2e8
	nop			;e2e9
	nop			;e2ea
	nop			;e2eb
	nop			;e2ec
	nop			;e2ed
	nop			;e2ee
	nop			;e2ef
	dec d			;e2f0
	nop			;e2f1
	nop			;e2f2
	nop			;e2f3
	nop			;e2f4
	nop			;e2f5
	nop			;e2f6
	nop			;e2f7
	nop			;e2f8
	nop			;e2f9
	ld h,(hl)		;e2fa
	ld e,b			;e2fb
	ei			;e2fc
	di			;e2fd
	halt			;e2fe
	ret c			;e2ff
le300h:
	dec sp			;e300
	rst 18h			;e301
	ld h,e			;e302
	rst 38h			;e303
	rst 38h			;e304
	sbc a,(hl)		;e305
	rst 38h			;e306
	rst 38h			;e307
	rst 38h			;e308
	ret m			;e309
	sbc a,a			;e30a
	rst 38h			;e30b
	rst 38h			;e30c
	rst 38h			;e30d
	cpl			;e30e
	ex de,hl		;e30f
	rst 38h			;e310
	ld e,a			;e311
	rst 38h			;e312
	ld d,e			;e313
	rst 38h			;e314
	ld a,a			;e315
	ld a,a			;e316
	jp pe,071f6h		;e317
	ret pe			;e31a
	nop			;e31b
	nop			;e31c
	nop			;e31d
	jr c,le35bh		;e31e
	ld d,l			;e320
	ld d,h			;e321
	ld l,e			;e322
	push de			;e323
	ld sp,hl		;e324
	nop			;e325
	ld (hl),b		;e326
	ld e,025h		;e327
	ld l,e			;e329
	ld e,d			;e32a
	add a,b			;e32b
	nop			;e32c
	nop			;e32d
	nop			;e32e
	nop			;e32f
	nop			;e330
	nop			;e331
	nop			;e332
	nop			;e333
	nop			;e334
	nop			;e335
	nop			;e336
	nop			;e337
	nop			;e338
	nop			;e339
	nop			;e33a
	nop			;e33b
	nop			;e33c
	nop			;e33d
	nop			;e33e
	nop			;e33f
	nop			;e340
	nop			;e341
	nop			;e342
	nop			;e343
	nop			;e344
	nop			;e345
	nop			;e346
	nop			;e347
	nop			;e348
	nop			;e349
	nop			;e34a
	nop			;e34b
	nop			;e34c
	nop			;e34d
	nop			;e34e
	nop			;e34f
	dec bc			;e350
	jr nz,le353h		;e351
le353h:
	nop			;e353
	nop			;e354
	nop			;e355
	nop			;e356
	nop			;e357
	ld (bc),a		;e358
	ld a,h			;e359
	ld a,l			;e35a
le35bh:
	rla			;e35b
	ld c,h			;e35c
	ld b,a			;e35d
	call c,000f0h		;e35e
	jr $+1			;e361
	rst 38h			;e363
	jp m,lffbfh		;e364
	rst 38h			;e367
	rst 38h			;e368
	defb 0edh ;next byte illegal after ed	;e369
	rst 38h			;e36a
	rst 38h			;e36b
	rst 38h			;e36c
	rst 38h			;e36d
	ld c,e			;e36e
	cp 089h			;e36f
	ei			;e371
	xor c			;e372
	rst 38h			;e373
	out (0ffh),a		;e374
	adc a,e			;e376
	ld e,a			;e377
	defb 0fdh,03fh,03dh ;illegal sequence	;e378
	dec c			;e37b
	inc a			;e37c
	rra			;e37d
	rrca			;e37e
	call z,sub_f9a0h	;e37f
	ld a,a			;e382
	add a,c			;e383
	ei			;e384
	ex (sp),hl		;e385
	nop			;e386
	pop hl			;e387
	sub e			;e388
	ld (hl),a		;e389
	ld d,b			;e38a
	nop			;e38b
	nop			;e38c
	nop			;e38d
	nop			;e38e
	nop			;e38f
	nop			;e390
	nop			;e391
	nop			;e392
	nop			;e393
	nop			;e394
	nop			;e395
	nop			;e396
	nop			;e397
	nop			;e398
	nop			;e399
	nop			;e39a
	nop			;e39b
	nop			;e39c
	nop			;e39d
	nop			;e39e
	nop			;e39f
	nop			;e3a0
	nop			;e3a1
	nop			;e3a2
	nop			;e3a3
	nop			;e3a4
	nop			;e3a5
	nop			;e3a6
	nop			;e3a7
	nop			;e3a8
	nop			;e3a9
	nop			;e3aa
	nop			;e3ab
	nop			;e3ac
	nop			;e3ad
	nop			;e3ae
sub_e3afh:
	nop			;e3af
	inc bc			;e3b0
	ld c,h			;e3b1
	call po,00000h		;e3b2
	nop			;e3b5
	ld (bc),a		;e3b6
	dec sp			;e3b7
	exx			;e3b8
	dec (hl)		;e3b9
	call m,033b8h		;e3ba
	cp (hl)			;e3bd
	nop			;e3be
	nop			;e3bf
	ld (bc),a		;e3c0
	rst 38h			;e3c1
	rst 38h			;e3c2
	rst 38h			;e3c3
	sbc a,e			;e3c4
	rst 38h			;e3c5
	rst 38h			;e3c6
	rst 38h			;e3c7
	cp 067h			;e3c8
	rst 38h			;e3ca
	rst 38h			;e3cb
	rst 38h			;e3cc
	rst 38h			;e3cd
	push de			;e3ce
	ld l,a			;e3cf
	out (097h),a		;e3d0
	jp p,sub_ff7fh		;e3d2
	rst 10h			;e3d5
	rst 38h			;e3d6
	call p,09a2ah		;e3d7
	rst 38h			;e3da
	rst 38h			;e3db
	cp a			;e3dc
	ld a,a			;e3dd
	cp a			;e3de
	exx			;e3df
	sub 0a8h		;e3e0
	rrca			;e3e2
	rst 10h			;e3e3
	ld h,a			;e3e4
	cp a			;e3e5
	ccf			;e3e6
	call m,sub_ffdfh	;e3e7
	rst 38h			;e3ea
	ld d,h			;e3eb
	nop			;e3ec
	inc e			;e3ed
	nop			;e3ee
	nop			;e3ef
	nop			;e3f0
	nop			;e3f1
	nop			;e3f2
	nop			;e3f3
	nop			;e3f4
	nop			;e3f5
	nop			;e3f6
	nop			;e3f7
	nop			;e3f8
	nop			;e3f9
	nop			;e3fa
	nop			;e3fb
	nop			;e3fc
	nop			;e3fd
	nop			;e3fe
	nop			;e3ff
	nop			;e400
	nop			;e401
	nop			;e402
	nop			;e403
	nop			;e404
	nop			;e405
	nop			;e406
	nop			;e407
	nop			;e408
	nop			;e409
	nop			;e40a
	nop			;e40b
	nop			;e40c
	nop			;e40d
	nop			;e40e
	inc bc			;e40f
	nop			;e410
	nop			;e411
	nop			;e412
	nop			;e413
	nop			;e414
	nop			;e415
	nop			;e416
	nop			;e417
	nop			;e418
	nop			;e419
	nop			;e41a
	nop			;e41b
	nop			;e41c
	nop			;e41d
	nop			;e41e
	nop			;e41f
	nop			;e420
	ld b,00dh		;e421
	adc a,(hl)		;e423
	cp (hl)			;e424
	ld l,c			;e425
	ret po			;e426
	nop			;e427
	ld (hl),c		;e428
	rst 38h			;e429
	ld (hl),a		;e42a
	push af			;e42b
	ccf			;e42c
	or 09bh			;e42d
	rra			;e42f
	rst 38h			;e430
	rst 38h			;e431
	rst 38h			;e432
	rst 38h			;e433
	rst 38h			;e434
	rst 38h			;e435
	rst 38h			;e436
	call p,000d0h		;e437
	nop			;e43a
	nop			;e43b
	nop			;e43c
	nop			;e43d
	nop			;e43e
	nop			;e43f
	ret nc			;e440
	nop			;e441
	nop			;e442
	nop			;e443
	nop			;e444
	nop			;e445
	nop			;e446
	nop			;e447
	or h			;e448
	nop			;e449
	nop			;e44a
	nop			;e44b
	nop			;e44c
	nop			;e44d
	nop			;e44e
	nop			;e44f
	nop			;e450
	nop			;e451
	nop			;e452
	nop			;e453
	nop			;e454
	nop			;e455
	nop			;e456
	nop			;e457
	nop			;e458
	nop			;e459
	nop			;e45a
	nop			;e45b
	nop			;e45c
	nop			;e45d
	nop			;e45e
	nop			;e45f
	nop			;e460
	nop			;e461
	nop			;e462
	nop			;e463
	nop			;e464
	nop			;e465
	nop			;e466
	nop			;e467
	nop			;e468
	nop			;e469
	nop			;e46a
	nop			;e46b
	nop			;e46c
	nop			;e46d
	nop			;e46e
	dec c			;e46f
	ret nz			;e470
	nop			;e471
	nop			;e472
	nop			;e473
	nop			;e474
	nop			;e475
	nop			;e476
	nop			;e477
	nop			;e478
	nop			;e479
	nop			;e47a
	nop			;e47b
	nop			;e47c
	nop			;e47d
	nop			;e47e
	nop			;e47f
	ret nz			;e480
	push de			;e481
	rst 28h			;e482
	ld a,e			;e483
	rst 30h			;e484
	sbc a,0fdh		;e485
	rst 0			;e487
	call m,sub_fff7h	;e488
	dec hl			;e48b
	rst 38h			;e48c
	rst 38h			;e48d
	rst 38h			;e48e
	sbc a,a			;e48f
	ld b,a			;e490
	defb 0fdh,05fh,0ffh ;illegal sequence	;e491
	rst 38h			;e494
	rst 38h			;e495
	rst 38h			;e496
	defb 0fdh,05ah,000h ;illegal sequence	;e497
	nop			;e49a
	nop			;e49b
	nop			;e49c
	nop			;e49d
	nop			;e49e
	nop			;e49f
	call p,00000h		;e4a0
	nop			;e4a3
	nop			;e4a4
	dec c			;e4a5
	cp a			;e4a6
	ret p			;e4a7
	add hl,de		;e4a8
	add a,b			;e4a9
	nop			;e4aa
	nop			;e4ab
	nop			;e4ac
	nop			;e4ad
	nop			;e4ae
	nop			;e4af
	nop			;e4b0
	nop			;e4b1
	nop			;e4b2
	nop			;e4b3
	nop			;e4b4
	nop			;e4b5
	nop			;e4b6
	nop			;e4b7
	nop			;e4b8
	nop			;e4b9
	nop			;e4ba
	nop			;e4bb
	nop			;e4bc
	nop			;e4bd
	nop			;e4be
	nop			;e4bf
	nop			;e4c0
	nop			;e4c1
	nop			;e4c2
	nop			;e4c3
	nop			;e4c4
	nop			;e4c5
	nop			;e4c6
	nop			;e4c7
	nop			;e4c8
	nop			;e4c9
	nop			;e4ca
	nop			;e4cb
	nop			;e4cc
	nop			;e4cd
	nop			;e4ce
	dec d			;e4cf
	ld l,h			;e4d0
	nop			;e4d1
	nop			;e4d2
	nop			;e4d3
	nop			;e4d4
	nop			;e4d5
	nop			;e4d6
	nop			;e4d7
	nop			;e4d8
	nop			;e4d9
	nop			;e4da
	nop			;e4db
	nop			;e4dc
	nop			;e4dd
	inc c			;e4de
	ld (hl),a		;e4df
	ld c,038h		;e4e0
	cp 000h			;e4e2
	call pe,01ff7h		;e4e4
	call m,sub_fff7h	;e4e7
	defb 0fdh,04fh,0ffh ;illegal sequence	;e4ea
	rst 38h			;e4ed
	rst 38h			;e4ee
	rst 38h			;e4ef
	sbc a,a			;e4f0
	ld e,c			;e4f1
	ld a,0e7h		;e4f2
	ld d,09fh		;e4f4
	rst 38h			;e4f6
	rst 38h			;e4f7
	ld d,a			;e4f8
	and b			;e4f9
	nop			;e4fa
	nop			;e4fb
	nop			;e4fc
	nop			;e4fd
	nop			;e4fe
	nop			;e4ff
	ld c,0fbh		;e500
	nop			;e502
	ld a,01fh		;e503
	ld sp,hl		;e505
	or a			;e506
	cp 0afh			;e507
	ld b,b			;e509
	nop			;e50a
	nop			;e50b
	nop			;e50c
	nop			;e50d
	nop			;e50e
	nop			;e50f
	nop			;e510
	nop			;e511
	nop			;e512
	nop			;e513
	nop			;e514
	nop			;e515
	nop			;e516
	nop			;e517
	nop			;e518
	nop			;e519
	nop			;e51a
	nop			;e51b
	nop			;e51c
	nop			;e51d
	nop			;e51e
	nop			;e51f
	nop			;e520
	nop			;e521
	nop			;e522
	nop			;e523
	nop			;e524
	nop			;e525
	nop			;e526
	nop			;e527
	nop			;e528
	nop			;e529
	nop			;e52a
	nop			;e52b
	nop			;e52c
	nop			;e52d
	nop			;e52e
	dec d			;e52f
	ld d,b			;e530
	nop			;e531
	nop			;e532
	nop			;e533
	nop			;e534
	nop			;e535
	nop			;e536
	nop			;e537
	nop			;e538
	nop			;e539
	nop			;e53a
	nop			;e53b
	ld bc,l9d8eh		;e53c
	add hl,sp		;e53f
	adc a,(hl)		;e540
	dec b			;e541
	adc a,067h		;e542
	call c,lfcffh		;e544
	rst 30h			;e547
	rst 38h			;e548
	rst 38h			;e549
	jp z,lffffh		;e54a
	rst 38h			;e54d
	rst 38h			;e54e
	rst 38h			;e54f
	rst 38h			;e550
	add a,a			;e551
	ld c,d			;e552
	defb 0fdh,0dfh,0e9h ;illegal sequence	;e553
	ld a,07fh		;e556
	push af			;e558
	ld (hl),h		;e559
	nop			;e55a
	nop			;e55b
	nop			;e55c
	nop			;e55d
	nop			;e55e
	nop			;e55f
	nop			;e560
	dec e			;e561
	and 0d3h		;e562
	cp a			;e564
	rst 38h			;e565
	rst 38h			;e566
	ld (hl),a		;e567
	push hl			;e568
	ret c			;e569
	ld bc,000d0h		;e56a
	nop			;e56d
	nop			;e56e
	nop			;e56f
	nop			;e570
	nop			;e571
	nop			;e572
	nop			;e573
	nop			;e574
	nop			;e575
	nop			;e576
	nop			;e577
	nop			;e578
	nop			;e579
	nop			;e57a
	nop			;e57b
	nop			;e57c
	nop			;e57d
	nop			;e57e
	nop			;e57f
	nop			;e580
	nop			;e581
	nop			;e582
	nop			;e583
	nop			;e584
	nop			;e585
	nop			;e586
	nop			;e587
	nop			;e588
	nop			;e589
	nop			;e58a
	nop			;e58b
	nop			;e58c
	nop			;e58d
	nop			;e58e
	jr nc,le5c7h		;e58f
	nop			;e591
	nop			;e592
	nop			;e593
	nop			;e594
	nop			;e595
	nop			;e596
	nop			;e597
	nop			;e598
	nop			;e599
	nop			;e59a
	ld b,07dh		;e59b
	ld h,e			;e59d
	ex (sp),hl		;e59e
	or a			;e59f
	rrca			;e5a0
	cp a			;e5a1
	jp c,lff73h		;e5a2
	rst 38h			;e5a5
	dec a			;e5a6
	rst 38h			;e5a7
	rst 38h			;e5a8
	rst 38h			;e5a9
	ld h,e			;e5aa
	rst 38h			;e5ab
	rst 38h			;e5ac
	rst 38h			;e5ad
	ret pe			;e5ae
	jr c,le5f4h		;e5af
	rst 38h			;e5b1
	ld d,l			;e5b2
	cp 0ffh			;e5b3
	call m,sub_a54fh	;e5b5
	rst 20h			;e5b8
	ld c,a			;e5b9
	ld b,b			;e5ba
	nop			;e5bb
	nop			;e5bc
	nop			;e5bd
	nop			;e5be
	jr le62fh		;e5bf
	nop			;e5c1
	ld c,0f6h		;e5c2
	ret nc			;e5c4
	rlca			;e5c5
	rst 38h			;e5c6
le5c7h:
	rst 38h			;e5c7
	exx			;e5c8
	xor b			;e5c9
	ld d,l			;e5ca
	ret p			;e5cb
	nop			;e5cc
	nop			;e5cd
	nop			;e5ce
	nop			;e5cf
	nop			;e5d0
	nop			;e5d1
	nop			;e5d2
	nop			;e5d3
	nop			;e5d4
	nop			;e5d5
	nop			;e5d6
	nop			;e5d7
	nop			;e5d8
	nop			;e5d9
	nop			;e5da
	nop			;e5db
	nop			;e5dc
	nop			;e5dd
	nop			;e5de
	nop			;e5df
	nop			;e5e0
	nop			;e5e1
	nop			;e5e2
	nop			;e5e3
	nop			;e5e4
	nop			;e5e5
	nop			;e5e6
	nop			;e5e7
	nop			;e5e8
	nop			;e5e9
	nop			;e5ea
	nop			;e5eb
	nop			;e5ec
	nop			;e5ed
	nop			;e5ee
	nop			;e5ef
	ld (de),a		;e5f0
	add a,b			;e5f1
	nop			;e5f2
	nop			;e5f3
le5f4h:
	nop			;e5f4
	nop			;e5f5
	nop			;e5f6
	nop			;e5f7
	nop			;e5f8
	nop			;e5f9
	ld h,a			;e5fa
	or l			;e5fb
	in a,(0beh)		;e5fc
sub_e5feh:
	inc b			;e5fe
	cp l			;e5ff
	cp l			;e600
	rst 38h			;e601
	ld d,a			;e602
	rst 38h			;e603
	rst 38h			;e604
	dec a			;e605
	rst 38h			;e606
	rst 38h			;e607
	rst 38h			;e608
	di			;e609
	ccf			;e60a
	rst 38h			;e60b
	rst 38h			;e60c
	rst 38h			;e60d
	xor a			;e60e
	out (0ffh),a		;e60f
	adc a,a			;e611
	rst 38h			;e612
	xor b			;e613
	rst 38h			;e614
	sbc a,h			;e615
	rst 38h			;e616
	ret pe			;e617
	jp m,lf839h		;e618
	nop			;e61b
	nop			;e61c
	nop			;e61d
	inc e			;e61e
	ld a,(laaaah)		;e61f
	inc e			;e622
	ret m			;e623
	defb 0fdh,080h,0c0h ;illegal sequence	;e624
	ld bc,09bf0h		;e627
	ld d,l			;e62a
	add a,b			;e62b
	nop			;e62c
	nop			;e62d
	nop			;e62e
le62fh:
	nop			;e62f
	nop			;e630
	nop			;e631
	nop			;e632
	nop			;e633
	nop			;e634
	nop			;e635
	nop			;e636
	nop			;e637
	nop			;e638
	nop			;e639
	nop			;e63a
	nop			;e63b
	nop			;e63c
	nop			;e63d
	nop			;e63e
	nop			;e63f
	nop			;e640
	nop			;e641
	nop			;e642
	nop			;e643
	nop			;e644
	nop			;e645
	nop			;e646
	nop			;e647
	nop			;e648
	nop			;e649
	nop			;e64a
	nop			;e64b
	nop			;e64c
	nop			;e64d
	nop			;e64e
	nop			;e64f
	dec b			;e650
	ret p			;e651
	nop			;e652
	nop			;e653
	nop			;e654
	nop			;e655
	nop			;e656
	nop			;e657
	inc bc			;e658
	ld (de),a		;e659
	call m,063afh		;e65a
	ld hl,(le0beh)		;e65d
	nop			;e660
	dec d			;e661
	rst 38h			;e662
	rst 38h			;e663
	di			;e664
	ld a,a			;e665
	rst 38h			;e666
	rst 38h			;e667
	rst 38h			;e668
	ret c			;e669
	rst 38h			;e66a
	rst 38h			;e66b
	rst 38h			;e66c
	rst 38h			;e66d
	xor e			;e66e
	rst 38h			;e66f
	add a,h			;e670
	rst 20h			;e671
	call p,sub_a8ffh	;e672
	rst 38h			;e675
	ld d,h			;e676
	cp a			;e677
	cp 0bfh			;e678
	inc e			;e67a
	adc a,a			;e67b
	cp h			;e67c
	ccf			;e67d
	adc a,a			;e67e
	add a,054h		;e67f
	rlca			;e681
	defb 0ddh,07ch ;ld a,ixh	;e682
	rst 28h			;e684
	ld sp,hl		;e685
	rst 38h			;e686
	adc a,(hl)		;e687
	and l			;e688
	cp d			;e689
	xor b			;e68a
	nop			;e68b
	nop			;e68c
	nop			;e68d
	nop			;e68e
	nop			;e68f
	nop			;e690
	nop			;e691
	nop			;e692
	nop			;e693
	nop			;e694
	nop			;e695
	nop			;e696
	nop			;e697
	nop			;e698
	nop			;e699
	nop			;e69a
	nop			;e69b
	nop			;e69c
	nop			;e69d
	nop			;e69e
	nop			;e69f
	nop			;e6a0
	nop			;e6a1
	nop			;e6a2
	nop			;e6a3
	nop			;e6a4
	nop			;e6a5
	nop			;e6a6
	nop			;e6a7
	nop			;e6a8
	nop			;e6a9
	nop			;e6aa
	nop			;e6ab
	nop			;e6ac
	nop			;e6ad
	nop			;e6ae
	nop			;e6af
	ld (bc),a		;e6b0
	push af			;e6b1
	ld (00000h),a		;e6b2
	nop			;e6b5
	ld bc,07a3bh		;e6b6
	defb 0fdh,0c3h,02fh ;illegal sequence	;e6b9
	ex (sp),hl		;e6bc
	ret c			;e6bd
	nop			;e6be
	nop			;e6bf
	dec b			;e6c0
	rst 38h			;e6c1
	rst 38h			;e6c2
	rst 38h			;e6c3
	scf			;e6c4
	rst 38h			;e6c5
	rst 38h			;e6c6
	rst 38h			;e6c7
	rst 38h			;e6c8
	ld l,a			;e6c9
	rst 38h			;e6ca
	rst 38h			;e6cb
	rst 38h			;e6cc
	rst 38h			;e6cd
	and (hl)		;e6ce
	rst 18h			;e6cf
	exx			;e6d0
	out (0fah),a		;e6d1
	rst 38h			;e6d3
	rst 38h			;e6d4
	pop hl			;e6d5
	rst 38h			;e6d6
	rst 38h			;e6d7
	or l			;e6d8
	ld h,l			;e6d9
	ld a,a			;e6da
	ld a,a			;e6db
	cp a			;e6dc
	ld a,a			;e6dd
	ld e,a			;e6de
	ld hl,(00325h)		;e6df
	push af			;e6e2
	ld a,e			;e6e3
	ld e,e			;e6e4
	sub 03fh		;e6e5
	rst 38h			;e6e7
	rst 38h			;e6e8
	rst 38h			;e6e9
	rst 38h			;e6ea
	jp pe,01200h		;e6eb
	nop			;e6ee
sub_e6efh:
	nop			;e6ef
	nop			;e6f0
	nop			;e6f1
	nop			;e6f2
	nop			;e6f3
	nop			;e6f4
	nop			;e6f5
	nop			;e6f6
	nop			;e6f7
	nop			;e6f8
	nop			;e6f9
	nop			;e6fa
	nop			;e6fb
	nop			;e6fc
	nop			;e6fd
	nop			;e6fe
sub_e6ffh:
	nop			;e6ff
	nop			;e700
	nop			;e701
	nop			;e702
	nop			;e703
	nop			;e704
	nop			;e705
	nop			;e706
	nop			;e707
	nop			;e708
	nop			;e709
	nop			;e70a
	nop			;e70b
	nop			;e70c
	nop			;e70d
	nop			;e70e
	nop			;e70f
	ld bc,06eebh		;e710
	ld b,b			;e713
	nop			;e714
	nop			;e715
	inc de			;e716
	cp l			;e717
	ld sp,hl		;e718
	ld sp,hl		;e719
	rra			;e71a
	rst 10h			;e71b
	set 6,b			;e71c
	nop			;e71e
	nop			;e71f
	dec bc			;e720
	rst 38h			;e721
	rst 38h			;e722
	rst 38h			;e723
	and e			;e724
	rst 38h			;e725
	rst 38h			;e726
	rst 38h			;e727
	cp 0a7h			;e728
	rst 38h			;e72a
	rst 38h			;e72b
	rst 38h			;e72c
	rst 38h			;e72d
	sub 0dfh		;e72e
	ex de,hl		;e730
	sbc a,e			;e731
	jp m,sub_ff7fh		;e732
	call nc,lffffh		;e735
	ret			;e738
	cp e			;e739
	cp (hl)			;e73a
	ld a,a			;e73b
	ld a,(hl)		;e73c
	ld a,(hl)		;e73d
	and b			;e73e
	ld d,l			;e73f
	ld c,d			;e740
	ld a,a			;e741
	rst 38h			;e742
	add a,b			;e743
	cp h			;e744
	or 07fh			;e745
	rst 38h			;e747
	rst 38h			;e748
	rst 38h			;e749
	rst 38h			;e74a
	push af			;e74b
	nop			;e74c
	ld a,(bc)		;e74d
	nop			;e74e
	nop			;e74f
	nop			;e750
	nop			;e751
	nop			;e752
	nop			;e753
	nop			;e754
	nop			;e755
	nop			;e756
	nop			;e757
	nop			;e758
	nop			;e759
	nop			;e75a
	nop			;e75b
	nop			;e75c
	nop			;e75d
	nop			;e75e
	nop			;e75f
	nop			;e760
	nop			;e761
	nop			;e762
	nop			;e763
	nop			;e764
	nop			;e765
	nop			;e766
	nop			;e767
	nop			;e768
	nop			;e769
	nop			;e76a
	nop			;e76b
	nop			;e76c
	nop			;e76d
	nop			;e76e
	nop			;e76f
	nop			;e770
	ld b,0fdh		;e771
	sbc a,d			;e773
	add a,a			;e774
	ld a,e			;e775
	ld hl,lbeffh		;e776
	in a,(090h)		;e779
	cp 000h			;e77b
	nop			;e77d
	nop			;e77e
	nop			;e77f
	nop			;e780
	nop			;e781
	cp a			;e782
	cp e			;e783
	cp a			;e784
	rst 38h			;e785
	rst 38h			;e786
	rst 38h			;e787
	ld sp,hl		;e788
	sbc a,a			;e789
	rst 38h			;e78a
	dec sp			;e78b
	ld h,b			;e78c
	rra			;e78d
	pop af			;e78e
	ret pe			;e78f
	ld a,h			;e790
	ld bc,003f2h		;e791
	ld (hl),b		;e794
	rra			;e795
	defb 0fdh,0fbh,0aah ;illegal sequence	;e796
	ld a,(bc)		;e799
	daa			;e79a
	ld (hl),a		;e79b
	adc a,c			;e79c
	ld (hl),093h		;e79d
	dec a			;e79f
	call po,sub_eacdh	;e7a0
	xor d			;e7a3
	xor c			;e7a4
	push af			;e7a5
	rst 38h			;e7a6
	cp a			;e7a7
	rst 38h			;e7a8
	rst 38h			;e7a9
	rst 38h			;e7aa
	rst 38h			;e7ab
	rst 38h			;e7ac
	add hl,sp		;e7ad
	ld b,b			;e7ae
	nop			;e7af
	nop			;e7b0
	nop			;e7b1
	nop			;e7b2
	nop			;e7b3
	nop			;e7b4
	nop			;e7b5
	nop			;e7b6
	nop			;e7b7
	nop			;e7b8
	nop			;e7b9
	nop			;e7ba
	nop			;e7bb
	nop			;e7bc
	nop			;e7bd
	nop			;e7be
	nop			;e7bf
	nop			;e7c0
	nop			;e7c1
	nop			;e7c2
	nop			;e7c3
	nop			;e7c4
	nop			;e7c5
	nop			;e7c6
	nop			;e7c7
	nop			;e7c8
	nop			;e7c9
	nop			;e7ca
	nop			;e7cb
	nop			;e7cc
	nop			;e7cd
	nop			;e7ce
	nop			;e7cf
	nop			;e7d0
	nop			;e7d1
	nop			;e7d2
	dec a			;e7d3
	ld a,h			;e7d4
	and a			;e7d5
	dec (hl)		;e7d6
	bit 7,a			;e7d7
	inc a			;e7d9
	nop			;e7da
	nop			;e7db
	nop			;e7dc
	nop			;e7dd
	nop			;e7de
	nop			;e7df
	nop			;e7e0
	nop			;e7e1
	ld b,09ah		;e7e2
	rst 18h			;e7e4
	cp c			;e7e5
	cp 0ffh			;e7e6
	and 07ah		;e7e8
	jr nz,le7ech		;e7ea
le7ech:
	nop			;e7ec
	nop			;e7ed
	ld a,l			;e7ee
	pop af			;e7ef
	nop			;e7f0
	nop			;e7f1
	ccf			;e7f2
	rst 28h			;e7f3
	add a,e			;e7f4
	cp d			;e7f5
	cpl			;e7f6
	jp (hl)			;e7f7
	ld a,e			;e7f8
	ld l,l			;e7f9
	ex de,hl		;e7fa
	xor (hl)		;e7fb
	rst 30h			;e7fc
	dec de			;e7fd
	or e			;e7fe
le7ffh:
	inc sp			;e7ff
	ex de,hl		;e800
sub_e801h:
	xor (hl)		;e801
	xor d			;e802
	xor b			;e803
	push hl			;e804
	adc a,(hl)		;e805
	ld e,a			;e806
	rst 38h			;e807
	call m,sub_ff7fh	;e808
	rst 38h			;e80b
	rst 38h			;e80c
	ld a,a			;e80d
	cp b			;e80e
	nop			;e80f
	nop			;e810
	nop			;e811
	nop			;e812
	nop			;e813
	nop			;e814
	nop			;e815
	nop			;e816
	nop			;e817
	nop			;e818
	nop			;e819
	nop			;e81a
	nop			;e81b
	nop			;e81c
	nop			;e81d
	nop			;e81e
	nop			;e81f
	nop			;e820
	nop			;e821
	nop			;e822
	nop			;e823
	nop			;e824
	nop			;e825
	nop			;e826
	nop			;e827
	nop			;e828
	nop			;e829
	nop			;e82a
	nop			;e82b
	nop			;e82c
	nop			;e82d
	nop			;e82e
	nop			;e82f
	nop			;e830
	nop			;e831
	nop			;e832
	nop			;e833
	nop			;e834
	nop			;e835
	nop			;e836
	nop			;e837
	nop			;e838
	nop			;e839
	nop			;e83a
	nop			;e83b
	nop			;e83c
	nop			;e83d
	nop			;e83e
	nop			;e83f
	nop			;e840
	nop			;e841
	ld bc,082bah		;e842
	djnz le859h		;e845
	and e			;e847
	rst 10h			;e848
	ld b,b			;e849
	nop			;e84a
	nop			;e84b
	nop			;e84c
	nop			;e84d
	rlca			;e84e
	rst 38h			;e84f
	or b			;e850
	nop			;e851
	rrca			;e852
	ret m			;e853
	ld a,a			;e854
le855h:
	call m,sub_ed6bh	;e855
	rst 10h			;e858
le859h:
	dec h			;e859
	cp c			;e85a
	and l			;e85b
	ret p			;e85c
	rra			;e85d
	rst 30h			;e85e
	call p,lbfaah		;e85f
	jp pe,053e5h		;e862
	ld l,083h		;e865
	rst 38h			;e867
	rst 38h			;e868
	rst 38h			;e869
	rst 38h			;e86a
	ret m			;e86b
	rst 38h			;e86c
	rst 38h			;e86d
	ret m			;e86e
	nop			;e86f
	nop			;e870
	nop			;e871
	nop			;e872
	nop			;e873
	nop			;e874
	nop			;e875
	nop			;e876
	nop			;e877
	nop			;e878
	nop			;e879
	nop			;e87a
	nop			;e87b
	nop			;e87c
	nop			;e87d
	nop			;e87e
	nop			;e87f
	nop			;e880
	nop			;e881
	nop			;e882
	nop			;e883
	nop			;e884
	nop			;e885
	nop			;e886
	nop			;e887
	nop			;e888
	nop			;e889
	nop			;e88a
	nop			;e88b
	nop			;e88c
	nop			;e88d
	nop			;e88e
	nop			;e88f
	nop			;e890
	nop			;e891
	nop			;e892
	nop			;e893
	nop			;e894
	nop			;e895
	nop			;e896
	nop			;e897
	nop			;e898
	nop			;e899
	nop			;e89a
	nop			;e89b
	nop			;e89c
	nop			;e89d
	nop			;e89e
	nop			;e89f
	nop			;e8a0
	nop			;e8a1
	nop			;e8a2
	nop			;e8a3
	nop			;e8a4
	nop			;e8a5
	nop			;e8a6
	nop			;e8a7
	nop			;e8a8
	nop			;e8a9
	nop			;e8aa
	nop			;e8ab
	nop			;e8ac
	nop			;e8ad
	nop			;e8ae
	rlca			;e8af
	ret p			;e8b0
	inc bc			;e8b1
	ret nc			;e8b2
	call m,sub_d37bh	;e8b3
	ld a,a			;e8b6
	ld sp,hl		;e8b7
	adc a,a			;e8b8
	ret m			;e8b9
	rst 38h			;e8ba
	rst 20h			;e8bb
	rst 38h			;e8bc
	rst 18h			;e8bd
	jp m,00098h		;e8be
	nop			;e8c1
	nop			;e8c2
	nop			;e8c3
	nop			;e8c4
	nop			;e8c5
	nop			;e8c6
	ld bc,lffffh		;e8c7
	rst 38h			;e8ca
	rst 38h			;e8cb
	add a,b			;e8cc
	inc a			;e8cd
	nop			;e8ce
	nop			;e8cf
	nop			;e8d0
	nop			;e8d1
	nop			;e8d2
	nop			;e8d3
	nop			;e8d4
	nop			;e8d5
	nop			;e8d6
	nop			;e8d7
	nop			;e8d8
	nop			;e8d9
	nop			;e8da
	nop			;e8db
	nop			;e8dc
	nop			;e8dd
	nop			;e8de
	nop			;e8df
	nop			;e8e0
	nop			;e8e1
	nop			;e8e2
	nop			;e8e3
	nop			;e8e4
	nop			;e8e5
	nop			;e8e6
	nop			;e8e7
	nop			;e8e8
	nop			;e8e9
	nop			;e8ea
	nop			;e8eb
	nop			;e8ec
	nop			;e8ed
	nop			;e8ee
	nop			;e8ef
	nop			;e8f0
	nop			;e8f1
	nop			;e8f2
	nop			;e8f3
	nop			;e8f4
	nop			;e8f5
	nop			;e8f6
	nop			;e8f7
	nop			;e8f8
	nop			;e8f9
	nop			;e8fa
	nop			;e8fb
	nop			;e8fc
	nop			;e8fd
	nop			;e8fe
le8ffh:
	nop			;e8ff
	nop			;e900
	nop			;e901
	nop			;e902
	nop			;e903
	nop			;e904
	nop			;e905
	nop			;e906
	nop			;e907
	nop			;e908
	nop			;e909
	nop			;e90a
	nop			;e90b
	nop			;e90c
	nop			;e90d
	nop			;e90e
	nop			;e90f
	rst 30h			;e910
	ld a,(hl)		;e911
	add a,b			;e912
	inc a			;e913
	rst 38h			;e914
	cp 001h			;e915
	rst 38h			;e917
	rst 8			;e918
	rst 38h			;e919
	sbc a,a			;e91a
	rst 38h			;e91b
	ccf			;e91c
	xor l			;e91d
	nop			;e91e
	nop			;e91f
	nop			;e920
	nop			;e921
	nop			;e922
	nop			;e923
	nop			;e924
	nop			;e925
	nop			;e926
	nop			;e927
	nop			;e928
	nop			;e929
	nop			;e92a
	nop			;e92b
	nop			;e92c
	nop			;e92d
	nop			;e92e
	nop			;e92f
	nop			;e930
	nop			;e931
	nop			;e932
	nop			;e933
	nop			;e934
	nop			;e935
	nop			;e936
	nop			;e937
	nop			;e938
	nop			;e939
	nop			;e93a
	nop			;e93b
	nop			;e93c
	nop			;e93d
	nop			;e93e
	nop			;e93f
	nop			;e940
	nop			;e941
	nop			;e942
	nop			;e943
	nop			;e944
	nop			;e945
	nop			;e946
	nop			;e947
	nop			;e948
	nop			;e949
	nop			;e94a
	nop			;e94b
	nop			;e94c
	nop			;e94d
	nop			;e94e
	nop			;e94f
	nop			;e950
	nop			;e951
	nop			;e952
	nop			;e953
	nop			;e954
	nop			;e955
	nop			;e956
	nop			;e957
	nop			;e958
	nop			;e959
	nop			;e95a
	nop			;e95b
	nop			;e95c
	nop			;e95d
	nop			;e95e
	nop			;e95f
	nop			;e960
	nop			;e961
	nop			;e962
	nop			;e963
	nop			;e964
	nop			;e965
	nop			;e966
	nop			;e967
	nop			;e968
	nop			;e969
	nop			;e96a
le96bh:
	nop			;e96b
	nop			;e96c
	nop			;e96d
	nop			;e96e
	nop			;e96f
	nop			;e970
	nop			;e971
	nop			;e972
	nop			;e973
	nop			;e974
	nop			;e975
	nop			;e976
	nop			;e977
	nop			;e978
	nop			;e979
	nop			;e97a
	nop			;e97b
	nop			;e97c
	nop			;e97d
	nop			;e97e
	nop			;e97f
	nop			;e980
	nop			;e981
	nop			;e982
	nop			;e983
	nop			;e984
	nop			;e985
	nop			;e986
	nop			;e987
	nop			;e988
	nop			;e989
	nop			;e98a
	nop			;e98b
	nop			;e98c
	nop			;e98d
	nop			;e98e
	nop			;e98f
	nop			;e990
	nop			;e991
	nop			;e992
	nop			;e993
	nop			;e994
	nop			;e995
	nop			;e996
	nop			;e997
	nop			;e998
	nop			;e999
	nop			;e99a
	nop			;e99b
	nop			;e99c
	nop			;e99d
	nop			;e99e
	nop			;e99f
	nop			;e9a0
	nop			;e9a1
	nop			;e9a2
	nop			;e9a3
	nop			;e9a4
	nop			;e9a5
	nop			;e9a6
	nop			;e9a7
	nop			;e9a8
	nop			;e9a9
	nop			;e9aa
	nop			;e9ab
	nop			;e9ac
	nop			;e9ad
	nop			;e9ae
	nop			;e9af
	nop			;e9b0
	nop			;e9b1
	nop			;e9b2
	nop			;e9b3
	nop			;e9b4
	nop			;e9b5
	nop			;e9b6
	nop			;e9b7
	nop			;e9b8
	nop			;e9b9
	nop			;e9ba
	nop			;e9bb
	nop			;e9bc
	nop			;e9bd
	nop			;e9be
	nop			;e9bf
	nop			;e9c0
	nop			;e9c1
	nop			;e9c2
	nop			;e9c3
	nop			;e9c4
	nop			;e9c5
	nop			;e9c6
	nop			;e9c7
	nop			;e9c8
	nop			;e9c9
	nop			;e9ca
	nop			;e9cb
	nop			;e9cc
	nop			;e9cd
	nop			;e9ce
	nop			;e9cf
	nop			;e9d0
	nop			;e9d1
	nop			;e9d2
	nop			;e9d3
	nop			;e9d4
	nop			;e9d5
	nop			;e9d6
	nop			;e9d7
	nop			;e9d8
	nop			;e9d9
	nop			;e9da
	nop			;e9db
	nop			;e9dc
	nop			;e9dd
	nop			;e9de
	nop			;e9df
	nop			;e9e0
	nop			;e9e1
	nop			;e9e2
	nop			;e9e3
	nop			;e9e4
	nop			;e9e5
	nop			;e9e6
	nop			;e9e7
	nop			;e9e8
	nop			;e9e9
	nop			;e9ea
	nop			;e9eb
	nop			;e9ec
	nop			;e9ed
	nop			;e9ee
	nop			;e9ef
	nop			;e9f0
	nop			;e9f1
	nop			;e9f2
	nop			;e9f3
	nop			;e9f4
	nop			;e9f5
	nop			;e9f6
	nop			;e9f7
	nop			;e9f8
	nop			;e9f9
	nop			;e9fa
	nop			;e9fb
	nop			;e9fc
	nop			;e9fd
	nop			;e9fe
	nop			;e9ff
	nop			;ea00
	nop			;ea01
	nop			;ea02
	nop			;ea03
	nop			;ea04
	nop			;ea05
	nop			;ea06
	nop			;ea07
	nop			;ea08
	nop			;ea09
	nop			;ea0a
	nop			;ea0b
	nop			;ea0c
	nop			;ea0d
	nop			;ea0e
	nop			;ea0f
	ld bc,lbb0ch		;ea10
	jr nz,lea15h		;ea13
lea15h:
	nop			;ea15
	adc a,e			;ea16
	jp nc,le96bh		;ea17
	rst 18h			;ea1a
	add a,(hl)		;ea1b
	dec de			;ea1c
	ret nz			;ea1d
	nop			;ea1e
	nop			;ea1f
	rra			;ea20
	rst 18h			;ea21
	rst 38h			;ea22
	rst 38h			;ea23
	scf			;ea24
	rst 38h			;ea25
	rst 38h			;ea26
	rst 38h			;ea27
	call m,sub_ffafh	;ea28
	rst 38h			;ea2b
	rst 38h			;ea2c
	rst 38h			;ea2d
	and (hl)		;ea2e
	rst 28h			;ea2f
	jp (hl)			;ea30
	call 0fff6h		;ea31
	rst 38h			;ea34
	jp pe,lffffh		;ea35
	or 0feh			;ea38
	ld b,b			;ea3a
	ld a,(hl)		;ea3b
	ld a,(hl)		;ea3c
	call m,sub_aa7ah	;ea3d
	rst 18h			;ea40
	ret po			;ea41
	nop			;ea42
	dec (hl)		;ea43
	ld c,e			;ea44
	or (hl)			;ea45
	ld a,e			;ea46
	rst 38h			;ea47
	rst 38h			;ea48
	rst 38h			;ea49
	rst 38h			;ea4a
	jp pe,01f80h		;ea4b
	nop			;ea4e
	nop			;ea4f
	nop			;ea50
	nop			;ea51
	nop			;ea52
	nop			;ea53
	nop			;ea54
	nop			;ea55
	nop			;ea56
	nop			;ea57
	nop			;ea58
	nop			;ea59
	nop			;ea5a
	nop			;ea5b
	nop			;ea5c
	nop			;ea5d
	nop			;ea5e
	nop			;ea5f
	nop			;ea60
	nop			;ea61
	nop			;ea62
	nop			;ea63
	nop			;ea64
	nop			;ea65
	nop			;ea66
	nop			;ea67
	nop			;ea68
	nop			;ea69
	nop			;ea6a
	nop			;ea6b
	nop			;ea6c
	nop			;ea6d
	nop			;ea6e
	nop			;ea6f
	nop			;ea70
	ld bc,09bfbh		;ea71
	defb 0edh ;next byte illegal after ed	;ea74
	dec d			;ea75
	jp z,lb864h		;ea76
	defb 0edh ;next byte illegal after ed	;ea79
	ld l,078h		;ea7a
	nop			;ea7c
	nop			;ea7d
	nop			;ea7e
	nop			;ea7f
	nop			;ea80
	inc b			;ea81
	ld d,a			;ea82
	di			;ea83
	ld (hl),a		;ea84
	rst 38h			;ea85
	rst 38h			;ea86
	rst 38h			;ea87
	pop af			;ea88
	or a			;ea89
	rst 38h			;ea8a
	ld (hl),080h		;ea8b
	rrca			;ea8d
	ld sp,hl		;ea8e
	call p,0017ch		;ea8f
	di			;ea92
	call po,0c089h		;ea93
	ld a,d			;ea96
	rst 38h			;ea97
	ld (hl),h		;ea98
	push af			;ea99
	ex af,af'		;ea9a
	adc a,a			;ea9b
	ld (hl),e		;ea9c
	xor c			;ea9d
	ld l,a			;ea9e
	add a,05fh		;ea9f
	dec sp			;eaa1
	push de			;eaa2
	ld d,l			;eaa3
	ld d,e			;eaa4
	ld a,d			;eaa5
	rst 38h			;eaa6
	rst 18h			;eaa7
	rst 38h			;eaa8
	rst 38h			;eaa9
	rst 38h			;eaaa
	rst 38h			;eaab
	rst 38h			;eaac
	and (hl)		;eaad
	ret nz			;eaae
	nop			;eaaf
	nop			;eab0
	nop			;eab1
	nop			;eab2
	nop			;eab3
	nop			;eab4
	nop			;eab5
	nop			;eab6
	nop			;eab7
	nop			;eab8
	nop			;eab9
	nop			;eaba
	nop			;eabb
	nop			;eabc
	nop			;eabd
	nop			;eabe
	nop			;eabf
	nop			;eac0
	nop			;eac1
	nop			;eac2
	nop			;eac3
	nop			;eac4
	nop			;eac5
	nop			;eac6
	nop			;eac7
	nop			;eac8
	nop			;eac9
	nop			;eaca
	nop			;eacb
	nop			;eacc
sub_eacdh:
	nop			;eacd
	nop			;eace
	nop			;eacf
	nop			;ead0
	nop			;ead1
	nop			;ead2
	dec bc			;ead3
	cp d			;ead4
	pop de			;ead5
sub_ead6h:
	call c,sub_bb61h	;ead6
	ret nz			;ead9
	nop			;eada
	nop			;eadb
	nop			;eadc
	nop			;eadd
	nop			;eade
	nop			;eadf
	nop			;eae0
	nop			;eae1
	dec b			;eae2
	push de			;eae3
	rst 18h			;eae4
	ret m			;eae5
	defb 0fdh,0ffh,0f6h ;illegal sequence	;eae6
	defb 0fdh,000h,000h ;illegal sequence	;eae9
	nop			;eaec
	nop			;eaed
	ld a,l			;eaee
	cp 000h			;eaef
	nop			;eaf1
	ccf			;eaf2
	rst 28h			;eaf3
	add hl,sp		;eaf4
	defb 0ddh,0ddh,096h ;illegal sequence	;eaf5
	add a,h			;eaf8
	sbc a,(hl)		;eaf9
	inc de			;eafa
	ret			;eafb
	rst 8			;eafc
	or h			;eafd
	ld l,(hl)		;eafe
leaffh:
	call m,05505h		;eaff
	ld d,l			;eb02
	ld d,l			;eb03
	ret			;eb04
	add a,(hl)		;eb05
	xor a			;eb06
	rst 38h			;eb07
	rst 38h			;eb08
	inc bc			;eb09
	rst 38h			;eb0a
	rst 38h			;eb0b
	rst 38h			;eb0c
	cp (hl)			;eb0d
	ld a,b			;eb0e
	nop			;eb0f
	nop			;eb10
	nop			;eb11
	nop			;eb12
	nop			;eb13
	nop			;eb14
	nop			;eb15
	nop			;eb16
	nop			;eb17
	nop			;eb18
	nop			;eb19
	nop			;eb1a
	nop			;eb1b
	nop			;eb1c
	nop			;eb1d
	nop			;eb1e
	nop			;eb1f
	nop			;eb20
	nop			;eb21
	nop			;eb22
	nop			;eb23
	nop			;eb24
	nop			;eb25
	nop			;eb26
	nop			;eb27
	nop			;eb28
	nop			;eb29
	nop			;eb2a
	nop			;eb2b
	nop			;eb2c
	nop			;eb2d
	nop			;eb2e
	nop			;eb2f
	nop			;eb30
	nop			;eb31
	nop			;eb32
	nop			;eb33
	nop			;eb34
	nop			;eb35
	nop			;eb36
sub_eb37h:
	nop			;eb37
	nop			;eb38
	nop			;eb39
	nop			;eb3a
	nop			;eb3b
	nop			;eb3c
	nop			;eb3d
	nop			;eb3e
	nop			;eb3f
	nop			;eb40
	nop			;eb41
	ld bc,080d0h		;eb42
	jr nz,leb4ah		;eb45
	inc de			;eb47
	sbc a,080h		;eb48
leb4ah:
	nop			;eb4a
	nop			;eb4b
	nop			;eb4c
	nop			;eb4d
	inc bc			;eb4e
	rst 38h			;eb4f
	ret nc			;eb50
	nop			;eb51
	adc a,a			;eb52
	ret m			;eb53
	ccf			;eb54
	call m,09295h		;eb55
	ld (hl),0fah		;eb58
	ld b,(hl)		;eb5a
	cp d			;eb5b
	jp lf79fh		;eb5c
	defb 0fdh,05fh,0e0h ;illegal sequence	;eb5f
	dec a			;eb62
	jp z,071abh		;eb63
sub_eb66h:
	add a,c			;eb66
sub_eb67h:
	rst 38h			;eb67
	rst 38h			;eb68
	rst 38h			;eb69
	rst 38h			;eb6a
	cp 01fh			;eb6b
	rst 38h			;eb6d
	ret m			;eb6e
	nop			;eb6f
	nop			;eb70
	nop			;eb71
	nop			;eb72
	nop			;eb73
	nop			;eb74
	nop			;eb75
	nop			;eb76
	nop			;eb77
	nop			;eb78
	nop			;eb79
	nop			;eb7a
	nop			;eb7b
	nop			;eb7c
	nop			;eb7d
	nop			;eb7e
sub_eb7fh:
	nop			;eb7f
	nop			;eb80
	nop			;eb81
	nop			;eb82
	nop			;eb83
	nop			;eb84
	nop			;eb85
	nop			;eb86
	nop			;eb87
	nop			;eb88
	nop			;eb89
	nop			;eb8a
	nop			;eb8b
	nop			;eb8c
	nop			;eb8d
	nop			;eb8e
	nop			;eb8f
	nop			;eb90
	nop			;eb91
	nop			;eb92
	nop			;eb93
	nop			;eb94
	nop			;eb95
	nop			;eb96
	nop			;eb97
	nop			;eb98
	nop			;eb99
	nop			;eb9a
	nop			;eb9b
	nop			;eb9c
	nop			;eb9d
	nop			;eb9e
	nop			;eb9f
	nop			;eba0
	nop			;eba1
	nop			;eba2
	nop			;eba3
	nop			;eba4
	nop			;eba5
	nop			;eba6
	nop			;eba7
	nop			;eba8
	nop			;eba9
	nop			;ebaa
	nop			;ebab
	nop			;ebac
	nop			;ebad
	nop			;ebae
	inc bc			;ebaf
	ret m			;ebb0
	ld (hl),a		;ebb1
	ret nc			;ebb2
	cp 077h			;ebb3
	defb 0edh ;next byte illegal after ed	;ebb5
	ld a,a			;ebb6
	call m,sub_fe3fh	;ebb7
	rst 38h			;ebba
	rst 30h			;ebbb
	rst 38h			;ebbc
	rst 18h			;ebbd
	push af			;ebbe
	ld h,b			;ebbf
	nop			;ebc0
	nop			;ebc1
	nop			;ebc2
	nop			;ebc3
	nop			;ebc4
	nop			;ebc5
	nop			;ebc6
	nop			;ebc7
	ld a,a			;ebc8
	rst 38h			;ebc9
	rst 38h			;ebca
	cp 000h			;ebcb
	jr nc,lebcfh		;ebcd
lebcfh:
	nop			;ebcf
	nop			;ebd0
	nop			;ebd1
	nop			;ebd2
	nop			;ebd3
	nop			;ebd4
	nop			;ebd5
	nop			;ebd6
	nop			;ebd7
	nop			;ebd8
	nop			;ebd9
	nop			;ebda
	nop			;ebdb
	nop			;ebdc
	nop			;ebdd
	nop			;ebde
	nop			;ebdf
	nop			;ebe0
	nop			;ebe1
	nop			;ebe2
	nop			;ebe3
	nop			;ebe4
	nop			;ebe5
	nop			;ebe6
	nop			;ebe7
	nop			;ebe8
	nop			;ebe9
	nop			;ebea
	nop			;ebeb
	nop			;ebec
	nop			;ebed
	nop			;ebee
	nop			;ebef
	nop			;ebf0
	nop			;ebf1
	nop			;ebf2
	nop			;ebf3
	nop			;ebf4
	nop			;ebf5
	nop			;ebf6
	nop			;ebf7
	nop			;ebf8
	nop			;ebf9
	nop			;ebfa
	nop			;ebfb
	nop			;ebfc
	nop			;ebfd
lebfeh:
	nop			;ebfe
	nop			;ebff
	nop			;ec00
	nop			;ec01
	nop			;ec02
	nop			;ec03
	nop			;ec04
	nop			;ec05
	nop			;ec06
	nop			;ec07
	nop			;ec08
	nop			;ec09
	nop			;ec0a
	nop			;ec0b
	nop			;ec0c
	nop			;ec0d
	nop			;ec0e
	nop			;ec0f
	ei			;ec10
	cp h			;ec11
	add a,b			;ec12
	nop			;ec13
	rra			;ec14
	call m,06f00h		;ec15
	rst 20h			;ec18
	rst 38h			;ec19
	rst 8			;ec1a
	rst 38h			;ec1b
	sbc a,a			;ec1c
	ld d,(hl)		;ec1d
	nop			;ec1e
	nop			;ec1f
	nop			;ec20
	nop			;ec21
	nop			;ec22
	nop			;ec23
	nop			;ec24
	nop			;ec25
	nop			;ec26
	nop			;ec27
	nop			;ec28
	nop			;ec29
	nop			;ec2a
	nop			;ec2b
	nop			;ec2c
	nop			;ec2d
	nop			;ec2e
	nop			;ec2f
	nop			;ec30
	nop			;ec31
	nop			;ec32
	nop			;ec33
	nop			;ec34
	nop			;ec35
	nop			;ec36
	nop			;ec37
	nop			;ec38
	nop			;ec39
	nop			;ec3a
	nop			;ec3b
	nop			;ec3c
	nop			;ec3d
	nop			;ec3e
	nop			;ec3f
	nop			;ec40
	nop			;ec41
	nop			;ec42
	nop			;ec43
	nop			;ec44
	nop			;ec45
	nop			;ec46
	nop			;ec47
	nop			;ec48
	nop			;ec49
	nop			;ec4a
	nop			;ec4b
	nop			;ec4c
	nop			;ec4d
	nop			;ec4e
	nop			;ec4f
	nop			;ec50
	nop			;ec51
	nop			;ec52
	nop			;ec53
	nop			;ec54
	nop			;ec55
	nop			;ec56
	nop			;ec57
	nop			;ec58
	nop			;ec59
	nop			;ec5a
	nop			;ec5b
	nop			;ec5c
	nop			;ec5d
	nop			;ec5e
	nop			;ec5f
	nop			;ec60
	nop			;ec61
	nop			;ec62
	nop			;ec63
	nop			;ec64
	nop			;ec65
	nop			;ec66
	nop			;ec67
	nop			;ec68
	nop			;ec69
	nop			;ec6a
	nop			;ec6b
	nop			;ec6c
	nop			;ec6d
	nop			;ec6e
	nop			;ec6f
	nop			;ec70
	nop			;ec71
	nop			;ec72
	nop			;ec73
	nop			;ec74
	nop			;ec75
	nop			;ec76
	nop			;ec77
	nop			;ec78
	nop			;ec79
	nop			;ec7a
	nop			;ec7b
	nop			;ec7c
	nop			;ec7d
	nop			;ec7e
	nop			;ec7f
	nop			;ec80
	nop			;ec81
	nop			;ec82
	nop			;ec83
	nop			;ec84
	nop			;ec85
	nop			;ec86
	nop			;ec87
	nop			;ec88
	nop			;ec89
	nop			;ec8a
	nop			;ec8b
	nop			;ec8c
	nop			;ec8d
	nop			;ec8e
	nop			;ec8f
	nop			;ec90
	nop			;ec91
	nop			;ec92
	nop			;ec93
	nop			;ec94
	nop			;ec95
	nop			;ec96
	nop			;ec97
	nop			;ec98
	nop			;ec99
	nop			;ec9a
	nop			;ec9b
	nop			;ec9c
	nop			;ec9d
	nop			;ec9e
	nop			;ec9f
	nop			;eca0
	nop			;eca1
	nop			;eca2
	nop			;eca3
	nop			;eca4
	nop			;eca5
	nop			;eca6
	nop			;eca7
	nop			;eca8
	nop			;eca9
	nop			;ecaa
	nop			;ecab
	nop			;ecac
	nop			;ecad
	nop			;ecae
	nop			;ecaf
	nop			;ecb0
	nop			;ecb1
	nop			;ecb2
	nop			;ecb3
	nop			;ecb4
	nop			;ecb5
	nop			;ecb6
	nop			;ecb7
	nop			;ecb8
	nop			;ecb9
	nop			;ecba
	nop			;ecbb
	nop			;ecbc
	nop			;ecbd
	nop			;ecbe
	nop			;ecbf
	nop			;ecc0
	nop			;ecc1
	nop			;ecc2
	nop			;ecc3
	nop			;ecc4
	nop			;ecc5
	nop			;ecc6
	nop			;ecc7
	nop			;ecc8
	nop			;ecc9
	nop			;ecca
	nop			;eccb
	nop			;eccc
	nop			;eccd
	nop			;ecce
	nop			;eccf
	nop			;ecd0
	nop			;ecd1
	nop			;ecd2
	nop			;ecd3
	nop			;ecd4
	nop			;ecd5
	nop			;ecd6
	nop			;ecd7
	nop			;ecd8
	nop			;ecd9
	nop			;ecda
	nop			;ecdb
	nop			;ecdc
	nop			;ecdd
	nop			;ecde
	nop			;ecdf
	nop			;ece0
	nop			;ece1
	nop			;ece2
	nop			;ece3
	nop			;ece4
	nop			;ece5
	nop			;ece6
	nop			;ece7
	nop			;ece8
	nop			;ece9
	nop			;ecea
	nop			;eceb
	nop			;ecec
	nop			;eced
	nop			;ecee
	nop			;ecef
	nop			;ecf0
	nop			;ecf1
	nop			;ecf2
	nop			;ecf3
	nop			;ecf4
	nop			;ecf5
	nop			;ecf6
	nop			;ecf7
	nop			;ecf8
	nop			;ecf9
	nop			;ecfa
	nop			;ecfb
	nop			;ecfc
	nop			;ecfd
	nop			;ecfe
	nop			;ecff
	nop			;ed00
	nop			;ed01
	nop			;ed02
	nop			;ed03
	nop			;ed04
	nop			;ed05
	nop			;ed06
	nop			;ed07
	nop			;ed08
	nop			;ed09
	nop			;ed0a
	nop			;ed0b
	nop			;ed0c
	nop			;ed0d
	nop			;ed0e
	nop			;ed0f
	nop			;ed10
	xor a			;ed11
	ld c,l			;ed12
	call po,00400h		;ed13
	sbc a,0e7h		;ed16
	sub a			;ed18
	rst 20h			;ed19
	sbc a,l			;ed1a
	ld l,03dh		;ed1b
	add a,b			;ed1d
	nop			;ed1e
	nop			;ed1f
	rra			;ed20
	rst 28h			;ed21
	rst 38h			;ed22
	cp 06ah			;ed23
	rst 38h			;ed25
	rst 38h			;ed26
	rst 38h			;ed27
	cp 0c7h			;ed28
	rst 38h			;ed2a
	rst 38h			;ed2b
	rst 38h			;ed2c
	rst 38h			;ed2d
	rst 10h			;ed2e
	ld l,a			;ed2f
	ret m			;ed30
	pop hl			;ed31
	call m,sub_ff7fh	;ed32
	push af			;ed35
	ld a,a			;ed36
	rst 38h			;ed37
	rst 38h			;ed38
	ld d,e			;ed39
	or a			;ed3a
	ld c,0fdh		;ed3b
	ld bc,03de7h		;ed3d
	ld h,b			;ed40
	ld c,0efh		;ed41
	rst 18h			;ed43
	or c			;ed44
	ld (hl),a		;ed45
	add hl,sp		;ed46
	rst 38h			;ed47
	rst 38h			;ed48
	rst 38h			;ed49
led4ah:
	rst 38h			;ed4a
	rst 38h			;ed4b
	ret nz			;ed4c
	inc e			;ed4d
	nop			;ed4e
	nop			;ed4f
	nop			;ed50
	nop			;ed51
	nop			;ed52
	nop			;ed53
	nop			;ed54
	nop			;ed55
	nop			;ed56
	nop			;ed57
	nop			;ed58
	nop			;ed59
	nop			;ed5a
	nop			;ed5b
	nop			;ed5c
	nop			;ed5d
	nop			;ed5e
	nop			;ed5f
	nop			;ed60
	nop			;ed61
	nop			;ed62
	nop			;ed63
	nop			;ed64
	nop			;ed65
	nop			;ed66
	nop			;ed67
	nop			;ed68
	nop			;ed69
	nop			;ed6a
sub_ed6bh:
	nop			;ed6b
	nop			;ed6c
	nop			;ed6d
	nop			;ed6e
	nop			;ed6f
	nop			;ed70
	nop			;ed71
	ld c,c			;ed72
	ld h,e			;ed73
	ret nz			;ed74
	cp (hl)			;ed75
	add hl,sp		;ed76
	or 0f5h			;ed77
	sub 0cfh		;ed79
	jr nz,led7dh		;ed7b
led7dh:
	nop			;ed7d
	nop			;ed7e
	nop			;ed7f
	nop			;ed80
	nop			;ed81
	and a			;ed82
	cp d			;ed83
	xor a			;ed84
	rst 38h			;ed85
	rst 38h			;ed86
	rst 38h			;ed87
	ei			;ed88
	rra			;ed89
	defb 0edh ;next byte illegal after ed	;ed8a
	ret c			;ed8b
	nop			;ed8c
	rlca			;ed8d
	cp 0ech			;ed8e
	inc a			;ed90
	inc bc			;ed91
	push af			;ed92
	di			;ed93
	halt			;ed94
	ld (05a0dh),hl		;ed95
	xor e			;ed98
	dec bc			;ed99
	or a			;ed9a
	ld h,h			;ed9b
	rst 30h			;ed9c
	rst 0			;ed9d
	sub d			;ed9e
	add hl,sp		;ed9f
	cp (hl)			;eda0
	call m,sub_aaaeh	;eda1
	and a			;eda4
	jp pe,le7ffh		;eda5
	rst 38h			;eda8
	rst 38h			;eda9
	rst 38h			;edaa
	rst 38h			;edab
	rst 38h			;edac
	rst 18h			;edad
	and b			;edae
	nop			;edaf
	nop			;edb0
	nop			;edb1
	nop			;edb2
	nop			;edb3
	nop			;edb4
	nop			;edb5
	nop			;edb6
	nop			;edb7
	nop			;edb8
	nop			;edb9
	nop			;edba
	nop			;edbb
	nop			;edbc
	nop			;edbd
	nop			;edbe
	nop			;edbf
	nop			;edc0
	nop			;edc1
	nop			;edc2
	nop			;edc3
	nop			;edc4
	nop			;edc5
	nop			;edc6
	nop			;edc7
	nop			;edc8
	nop			;edc9
	nop			;edca
	nop			;edcb
	nop			;edcc
	nop			;edcd
	nop			;edce
	nop			;edcf
	nop			;edd0
	nop			;edd1
	nop			;edd2
	ld b,0d4h		;edd3
	dec sp			;edd5
	di			;edd6
	ld a,0fch		;edd7
	nop			;edd9
	nop			;edda
	nop			;eddb
	nop			;eddc
	nop			;eddd
	nop			;edde
	nop			;eddf
	nop			;ede0
	nop			;ede1
	ld b,0b7h		;ede2
	or (hl)			;ede4
	or h			;ede5
	cp 0ffh			;ede6
	call po,000e8h		;ede8
	nop			;edeb
	nop			;edec
	nop			;eded
	dec sp			;edee
	rst 38h			;edef
	add a,b			;edf0
	nop			;edf1
	ld a,a			;edf2
	or 0fch			;edf3
	inc hl			;edf5
	jp pe,0776fh		;edf6
	dec a			;edf9
	ld a,l			;edfa
	or 037h			;edfb
	ld a,e			;edfd
	sub e			;edfe
	dec sp			;edff
	ld d,b			;ee00
	cp d			;ee01
	xor d			;ee02
	xor c			;ee03
	sub l			;ee04
	and (hl)		;ee05
	ld l,a			;ee06
	rst 38h			;ee07
	rst 38h			;ee08
	ret m			;ee09
	ccf			;ee0a
	rst 38h			;ee0b
	rst 38h			;ee0c
	pop bc			;ee0d
	call m,00000h		;ee0e
	nop			;ee11
	nop			;ee12
	nop			;ee13
	nop			;ee14
	nop			;ee15
	nop			;ee16
	nop			;ee17
	nop			;ee18
	nop			;ee19
	nop			;ee1a
	nop			;ee1b
	nop			;ee1c
	nop			;ee1d
	nop			;ee1e
	nop			;ee1f
	nop			;ee20
	nop			;ee21
	nop			;ee22
	nop			;ee23
	nop			;ee24
	nop			;ee25
	nop			;ee26
	nop			;ee27
	nop			;ee28
	nop			;ee29
	nop			;ee2a
	nop			;ee2b
	nop			;ee2c
	nop			;ee2d
	nop			;ee2e
	nop			;ee2f
	nop			;ee30
	nop			;ee31
	nop			;ee32
	nop			;ee33
	nop			;ee34
	nop			;ee35
	nop			;ee36
	nop			;ee37
	nop			;ee38
	nop			;ee39
	nop			;ee3a
	nop			;ee3b
	nop			;ee3c
	nop			;ee3d
	nop			;ee3e
	nop			;ee3f
	nop			;ee40
	nop			;ee41
	ld bc,00020h		;ee42
	nop			;ee45
	ld bc,ld50bh		;ee46
	nop			;ee49
	nop			;ee4a
	nop			;ee4b
	nop			;ee4c
	nop			;ee4d
	inc bc			;ee4e
	rst 38h			;ee4f
	ret p			;ee50
	nop			;ee51
	ld b,a			;ee52
	call m,sub_fe13h	;ee53
	ld l,d			;ee56
	ld (hl),c		;ee57
	exx			;ee58
	dec h			;ee59
	cp a			;ee5a
	ld c,a			;ee5b
	rrca			;ee5c
	sbc a,a			;ee5d
	rst 30h			;ee5e
	jp m,000f4h		;ee5f
	ld b,09fh		;ee62
	out (040h),a		;ee64
	add a,c			;ee66
	rst 38h			;ee67
	rst 38h			;ee68
	rst 38h			;ee69
	rst 38h			;ee6a
	rst 38h			;ee6b
	jp lf8ffh		;ee6c
	nop			;ee6f
	nop			;ee70
	nop			;ee71
	nop			;ee72
	nop			;ee73
	nop			;ee74
	nop			;ee75
	nop			;ee76
	nop			;ee77
	nop			;ee78
	nop			;ee79
	nop			;ee7a
	nop			;ee7b
	nop			;ee7c
	nop			;ee7d
	nop			;ee7e
	nop			;ee7f
	nop			;ee80
	nop			;ee81
	nop			;ee82
	nop			;ee83
	nop			;ee84
	nop			;ee85
	nop			;ee86
	nop			;ee87
	nop			;ee88
	nop			;ee89
	nop			;ee8a
	nop			;ee8b
	nop			;ee8c
	nop			;ee8d
	nop			;ee8e
	nop			;ee8f
	nop			;ee90
	nop			;ee91
	nop			;ee92
	nop			;ee93
	nop			;ee94
	nop			;ee95
	nop			;ee96
	nop			;ee97
	nop			;ee98
	nop			;ee99
	nop			;ee9a
	nop			;ee9b
	nop			;ee9c
	nop			;ee9d
	nop			;ee9e
	nop			;ee9f
	nop			;eea0
	nop			;eea1
	nop			;eea2
	nop			;eea3
	nop			;eea4
	nop			;eea5
	nop			;eea6
	nop			;eea7
	nop			;eea8
	nop			;eea9
	nop			;eeaa
	nop			;eeab
	nop			;eeac
	nop			;eead
	nop			;eeae
	inc bc			;eeaf
	defb 0fdh,0efh,0d0h ;illegal sequence	;eeb0
	rst 38h			;eeb3
	or a			;eeb4
	di			;eeb5
	ccf			;eeb6
	cp 07fh			;eeb7
	cp 0ffh			;eeb9
	rst 30h			;eebb
	rst 38h			;eebc
	rst 18h			;eebd
	jp m,00080h		;eebe
	nop			;eec1
	nop			;eec2
	nop			;eec3
	nop			;eec4
	nop			;eec5
	nop			;eec6
	nop			;eec7
	rrca			;eec8
	rst 38h			;eec9
	rst 38h			;eeca
	nop			;eecb
	nop			;eecc
	nop			;eecd
	nop			;eece
	nop			;eecf
	nop			;eed0
	nop			;eed1
	nop			;eed2
	nop			;eed3
	nop			;eed4
	nop			;eed5
	nop			;eed6
	nop			;eed7
	nop			;eed8
	nop			;eed9
	nop			;eeda
	nop			;eedb
	nop			;eedc
	nop			;eedd
	nop			;eede
	nop			;eedf
	nop			;eee0
	nop			;eee1
	nop			;eee2
	nop			;eee3
	nop			;eee4
	nop			;eee5
	nop			;eee6
	nop			;eee7
	nop			;eee8
	nop			;eee9
	nop			;eeea
	nop			;eeeb
	nop			;eeec
	nop			;eeed
	nop			;eeee
	nop			;eeef
	nop			;eef0
	nop			;eef1
	nop			;eef2
	nop			;eef3
	nop			;eef4
	nop			;eef5
	nop			;eef6
	nop			;eef7
	nop			;eef8
	nop			;eef9
	nop			;eefa
	nop			;eefb
	nop			;eefc
	nop			;eefd
	nop			;eefe
leeffh:
	nop			;eeff
	nop			;ef00
	nop			;ef01
	nop			;ef02
	nop			;ef03
	nop			;ef04
	nop			;ef05
	nop			;ef06
	nop			;ef07
	nop			;ef08
	nop			;ef09
	nop			;ef0a
	nop			;ef0b
	nop			;ef0c
	nop			;ef0d
	nop			;ef0e
	nop			;ef0f
	ei			;ef10
	sbc a,a			;ef11
	nop			;ef12
	nop			;ef13
	inc bc			;ef14
	add a,b			;ef15
	nop			;ef16
	dec e			;ef17
	pop af			;ef18
	rst 38h			;ef19
	rst 20h			;ef1a
	rst 38h			;ef1b
	ld d,(hl)		;ef1c
	cp b			;ef1d
	nop			;ef1e
	nop			;ef1f
	nop			;ef20
	nop			;ef21
	nop			;ef22
	nop			;ef23
	nop			;ef24
	nop			;ef25
	nop			;ef26
	nop			;ef27
	nop			;ef28
	nop			;ef29
	nop			;ef2a
	nop			;ef2b
lef2ch:
	nop			;ef2c
	nop			;ef2d
	nop			;ef2e
	nop			;ef2f
	nop			;ef30
	nop			;ef31
	nop			;ef32
	nop			;ef33
	nop			;ef34
	nop			;ef35
	nop			;ef36
	nop			;ef37
	nop			;ef38
	nop			;ef39
	nop			;ef3a
	nop			;ef3b
	nop			;ef3c
	nop			;ef3d
	nop			;ef3e
	nop			;ef3f
	nop			;ef40
	nop			;ef41
	nop			;ef42
	nop			;ef43
	nop			;ef44
	nop			;ef45
	nop			;ef46
	nop			;ef47
	nop			;ef48
	nop			;ef49
	nop			;ef4a
	nop			;ef4b
	nop			;ef4c
	nop			;ef4d
	nop			;ef4e
	nop			;ef4f
	nop			;ef50
	nop			;ef51
	nop			;ef52
	nop			;ef53
	nop			;ef54
	nop			;ef55
	nop			;ef56
	nop			;ef57
	nop			;ef58
	nop			;ef59
	nop			;ef5a
	nop			;ef5b
	nop			;ef5c
	nop			;ef5d
	nop			;ef5e
	nop			;ef5f
	nop			;ef60
	nop			;ef61
	nop			;ef62
	nop			;ef63
	nop			;ef64
	nop			;ef65
	nop			;ef66
	nop			;ef67
	nop			;ef68
	nop			;ef69
	nop			;ef6a
	nop			;ef6b
	nop			;ef6c
	nop			;ef6d
	nop			;ef6e
	nop			;ef6f
	nop			;ef70
	nop			;ef71
	nop			;ef72
	nop			;ef73
	nop			;ef74
	nop			;ef75
	nop			;ef76
	nop			;ef77
	nop			;ef78
	nop			;ef79
	nop			;ef7a
	nop			;ef7b
	nop			;ef7c
	nop			;ef7d
	nop			;ef7e
	nop			;ef7f
	nop			;ef80
	nop			;ef81
	nop			;ef82
	nop			;ef83
	nop			;ef84
	nop			;ef85
	nop			;ef86
	nop			;ef87
	nop			;ef88
	nop			;ef89
	nop			;ef8a
	nop			;ef8b
	nop			;ef8c
	nop			;ef8d
	nop			;ef8e
	nop			;ef8f
	nop			;ef90
	nop			;ef91
	nop			;ef92
	nop			;ef93
	nop			;ef94
	nop			;ef95
	nop			;ef96
	nop			;ef97
	nop			;ef98
	nop			;ef99
	nop			;ef9a
	nop			;ef9b
	nop			;ef9c
	nop			;ef9d
	nop			;ef9e
	nop			;ef9f
	nop			;efa0
	nop			;efa1
	nop			;efa2
	nop			;efa3
	nop			;efa4
	nop			;efa5
	nop			;efa6
	nop			;efa7
	nop			;efa8
	nop			;efa9
	nop			;efaa
	nop			;efab
	nop			;efac
	nop			;efad
	nop			;efae
	nop			;efaf
	nop			;efb0
	nop			;efb1
	nop			;efb2
	nop			;efb3
	nop			;efb4
	nop			;efb5
	nop			;efb6
	nop			;efb7
	nop			;efb8
	nop			;efb9
	nop			;efba
	nop			;efbb
	nop			;efbc
	nop			;efbd
	nop			;efbe
	nop			;efbf
	nop			;efc0
	nop			;efc1
	nop			;efc2
	nop			;efc3
	nop			;efc4
	nop			;efc5
	nop			;efc6
	nop			;efc7
	nop			;efc8
	nop			;efc9
	nop			;efca
	nop			;efcb
	nop			;efcc
	nop			;efcd
	nop			;efce
	nop			;efcf
	nop			;efd0
	nop			;efd1
	nop			;efd2
	nop			;efd3
	nop			;efd4
	nop			;efd5
	nop			;efd6
	nop			;efd7
	nop			;efd8
	nop			;efd9
	nop			;efda
	nop			;efdb
	nop			;efdc
	nop			;efdd
	nop			;efde
	nop			;efdf
	nop			;efe0
	nop			;efe1
	nop			;efe2
	nop			;efe3
	nop			;efe4
	nop			;efe5
	nop			;efe6
	nop			;efe7
	nop			;efe8
	nop			;efe9
	nop			;efea
	nop			;efeb
	nop			;efec
	nop			;efed
	nop			;efee
	nop			;efef
	nop			;eff0
	nop			;eff1
	nop			;eff2
	nop			;eff3
	nop			;eff4
	nop			;eff5
	nop			;eff6
	nop			;eff7
	nop			;eff8
	nop			;eff9
	nop			;effa
	nop			;effb
	nop			;effc
	nop			;effd
	nop			;effe
lefffh:
	nop			;efff
	nop			;f000
	nop			;f001
	nop			;f002
	nop			;f003
	nop			;f004
	nop			;f005
	nop			;f006
	nop			;f007
	nop			;f008
	nop			;f009
	nop			;f00a
	nop			;f00b
	nop			;f00c
lf00dh:
	nop			;f00d
	nop			;f00e
	nop			;f00f
	nop			;f010
	cp a			;f011
	ld l,h			;f012
	jp p,04200h		;f013
	or h			;f016
	ex de,hl		;f017
	ld a,h			;f018
	ld c,a			;f019
	cp d			;f01a
	sub l			;f01b
	cp (hl)			;f01c
	nop			;f01d
	nop			;f01e
	nop			;f01f
	dec l			;f020
	ld e,(hl)		;f021
	rst 38h			;f022
	call m,sub_ff67h	;f023
	rst 38h			;f026
	rst 38h			;f027
	call m,sub_ffcfh	;f028
	rst 38h			;f02b
	rst 28h			;f02c
	rst 38h			;f02d
	and e			;f02e
	or a			;f02f
	defb 0fdh,0f4h,0fch ;illegal sequence	;f030
	rst 38h			;f033
	rst 38h			;f034
	jp m,0ff9fh		;f035
	defb 0fdh,0adh ;xor iyl	;f038
lf03ah:
	adc a,c			;f03a
	and b			;f03b
	jp m,05fdah		;f03c
	jp nz,0f99bh		;f03f
	di			;f042
	dec h			;f043
	ld c,(hl)		;f044
	scf			;f045
	inc a			;f046
	rst 38h			;f047
	rst 38h			;f048
	rst 38h			;f049
	rst 38h			;f04a
	rst 38h			;f04b
	ld b,b			;f04c
	ld (bc),a		;f04d
	add a,b			;f04e
	nop			;f04f
	nop			;f050
	nop			;f051
	nop			;f052
	nop			;f053
	nop			;f054
	nop			;f055
	nop			;f056
	nop			;f057
	nop			;f058
	nop			;f059
	nop			;f05a
	nop			;f05b
	nop			;f05c
	nop			;f05d
	nop			;f05e
	nop			;f05f
	nop			;f060
sub_f061h:
	nop			;f061
	nop			;f062
	nop			;f063
	nop			;f064
	nop			;f065
	nop			;f066
	nop			;f067
	nop			;f068
	nop			;f069
	nop			;f06a
	nop			;f06b
	nop			;f06c
	nop			;f06d
	nop			;f06e
	nop			;f06f
	nop			;f070
	nop			;f071
	scf			;f072
	ld a,b			;f073
	xor a			;f074
	dec (hl)		;f075
	or e			;f076
	sbc a,l			;f077
	defb 0fdh,0e0h,0efh ;illegal sequence	;f078
	ret nz			;f07b
	nop			;f07c
	nop			;f07d
	nop			;f07e
sub_f07fh:
	nop			;f07f
	nop			;f080
	nop			;f081
	cpl			;f082
	halt			;f083
	ld (hl),a		;f084
	rst 38h			;f085
	rst 38h			;f086
	rst 38h			;f087
	di			;f088
	scf			;f089
	jp (hl)			;f08a
	and b			;f08b
	nop			;f08c
	inc bc			;f08d
	cp 0f4h			;f08e
	inc a			;f090
	inc bc			;f091
	and 0f8h		;f092
	cp l			;f094
	ld e,l			;f095
	ret nz			;f096
	cp a			;f097
	call nc,sub_c8b7h	;f098
	ld sp,hl		;f09b
	jp pe,07d3fh		;f09c
	rst 30h			;f09f
	push bc			;f0a0
	adc a,e			;f0a1
	push de			;f0a2
	ld d,l			;f0a3
	ld c,a			;f0a4
	jp pe,lf9ffh		;f0a5
	rst 38h			;f0a8
	rst 38h			;f0a9
	rst 38h			;f0aa
lf0abh:
	rst 38h			;f0ab
	rst 38h			;f0ac
	cp a			;f0ad
	ld h,b			;f0ae
	nop			;f0af
	nop			;f0b0
	nop			;f0b1
	nop			;f0b2
	nop			;f0b3
	nop			;f0b4
	nop			;f0b5
	nop			;f0b6
	nop			;f0b7
	nop			;f0b8
	nop			;f0b9
lf0bah:
	nop			;f0ba
	nop			;f0bb
sub_f0bch:
	nop			;f0bc
	nop			;f0bd
	nop			;f0be
	nop			;f0bf
	nop			;f0c0
	nop			;f0c1
	nop			;f0c2
	nop			;f0c3
	nop			;f0c4
	nop			;f0c5
	nop			;f0c6
	nop			;f0c7
	nop			;f0c8
	nop			;f0c9
	nop			;f0ca
	nop			;f0cb
	nop			;f0cc
	nop			;f0cd
	nop			;f0ce
	nop			;f0cf
	nop			;f0d0
	nop			;f0d1
	nop			;f0d2
	ld bc,0532eh		;f0d3
	add hl,de		;f0d6
	xor e			;f0d7
	add a,b			;f0d8
	nop			;f0d9
	nop			;f0da
	nop			;f0db
	nop			;f0dc
lf0ddh:
	nop			;f0dd
	nop			;f0de
	nop			;f0df
	nop			;f0e0
	nop			;f0e1
	dec c			;f0e2
	daa			;f0e3
	rst 20h			;f0e4
	ld l,l			;f0e5
	cp l			;f0e6
	rst 38h			;f0e7
	call pe,000c0h		;f0e8
	nop			;f0eb
	nop			;f0ec
	nop			;f0ed
	dec sp			;f0ee
	rst 38h			;f0ef
	add a,b			;f0f0
	nop			;f0f1
	ld a,a			;f0f2
	or 0feh			;f0f3
	dec e			;f0f5
	push de			;f0f6
	or 0beh			;f0f7
	jp c,04afah		;f0f9
	ret pe			;f0fc
	call po,047ech		;f0fd
	add a,l			;f100
	ld d,l			;f101
	ld d,l			;f102
	ld d,e			;f103
	add hl,hl		;f104
	sub d			;f105
	cpl			;f106
	rst 38h			;f107
	rst 38h			;f108
	rst 38h			;f109
	adc a,a			;f10a
	rst 38h			;f10b
	rst 38h			;f10c
	rst 38h			;f10d
	call m,00000h		;f10e
	nop			;f111
	nop			;f112
	nop			;f113
	nop			;f114
	nop			;f115
	nop			;f116
	nop			;f117
	nop			;f118
	nop			;f119
	nop			;f11a
	nop			;f11b
	nop			;f11c
	nop			;f11d
	nop			;f11e
	nop			;f11f
	nop			;f120
	nop			;f121
	nop			;f122
	nop			;f123
	nop			;f124
	nop			;f125
	nop			;f126
	nop			;f127
	nop			;f128
	nop			;f129
	nop			;f12a
	nop			;f12b
	nop			;f12c
	nop			;f12d
	nop			;f12e
	nop			;f12f
	nop			;f130
	nop			;f131
	nop			;f132
	nop			;f133
	nop			;f134
	nop			;f135
	nop			;f136
	nop			;f137
	nop			;f138
	nop			;f139
	nop			;f13a
	nop			;f13b
	nop			;f13c
	nop			;f13d
	nop			;f13e
	nop			;f13f
	nop			;f140
	nop			;f141
	nop			;f142
	nop			;f143
	nop			;f144
	nop			;f145
	ld (bc),a		;f146
	dec b			;f147
	exx			;f148
	nop			;f149
	nop			;f14a
	nop			;f14b
	nop			;f14c
	nop			;f14d
	ld bc,le0ffh		;f14e
	nop			;f151
	rst 0			;f152
	call m,sub_fe0dh	;f153
	ld e,a			;f156
	cp a			;f157
	and a			;f158
	in a,(0c7h)		;f159
	cp (hl)			;f15b
	ccf			;f15c
	cp a			;f15d
	ei			;f15e
	di			;f15f
	jr lf162h		;f160
lf162h:
	ld bc,03a70h		;f162
	add a,b			;f165
	nop			;f166
	rst 38h			;f167
	rst 38h			;f168
	rst 38h			;f169
	rst 38h			;f16a
	rst 38h			;f16b
	ret m			;f16c
	rst 38h			;f16d
	ret p			;f16e
	nop			;f16f
	nop			;f170
	nop			;f171
	nop			;f172
	nop			;f173
	nop			;f174
	nop			;f175
	nop			;f176
	nop			;f177
	nop			;f178
	nop			;f179
	nop			;f17a
	nop			;f17b
	nop			;f17c
	nop			;f17d
	nop			;f17e
	nop			;f17f
	nop			;f180
	nop			;f181
	nop			;f182
	nop			;f183
	nop			;f184
	nop			;f185
	nop			;f186
	nop			;f187
	nop			;f188
	nop			;f189
	nop			;f18a
	nop			;f18b
	nop			;f18c
	nop			;f18d
	nop			;f18e
	nop			;f18f
	nop			;f190
	nop			;f191
	nop			;f192
	nop			;f193
	nop			;f194
	nop			;f195
	nop			;f196
	nop			;f197
	nop			;f198
	nop			;f199
	nop			;f19a
	nop			;f19b
	nop			;f19c
	nop			;f19d
	nop			;f19e
	nop			;f19f
	nop			;f1a0
	nop			;f1a1
	nop			;f1a2
	nop			;f1a3
	nop			;f1a4
	nop			;f1a5
	nop			;f1a6
	nop			;f1a7
	nop			;f1a8
	nop			;f1a9
	nop			;f1aa
	nop			;f1ab
	nop			;f1ac
	nop			;f1ad
	nop			;f1ae
	inc bc			;f1af
	defb 0fdh,0dfh,0a0h ;illegal sequence	;f1b0
	ld a,a			;f1b3
	in a,(0f5h)		;f1b4
	cp a			;f1b6
	rst 38h			;f1b7
	ld a,a			;f1b8
	cp 07fh			;f1b9
	di			;f1bb
	rst 38h			;f1bc
	rst 8			;f1bd
	rst 30h			;f1be
	nop			;f1bf
	nop			;f1c0
	nop			;f1c1
	nop			;f1c2
	nop			;f1c3
	nop			;f1c4
	nop			;f1c5
	nop			;f1c6
	nop			;f1c7
	nop			;f1c8
	nop			;f1c9
	nop			;f1ca
	nop			;f1cb
	nop			;f1cc
	nop			;f1cd
	nop			;f1ce
	nop			;f1cf
	nop			;f1d0
	nop			;f1d1
	nop			;f1d2
	nop			;f1d3
	nop			;f1d4
	nop			;f1d5
	nop			;f1d6
	nop			;f1d7
	nop			;f1d8
	nop			;f1d9
	nop			;f1da
	nop			;f1db
	nop			;f1dc
	nop			;f1dd
	nop			;f1de
lf1dfh:
	nop			;f1df
	nop			;f1e0
	nop			;f1e1
	nop			;f1e2
	nop			;f1e3
	nop			;f1e4
	nop			;f1e5
	nop			;f1e6
	nop			;f1e7
	nop			;f1e8
	nop			;f1e9
	nop			;f1ea
	nop			;f1eb
	nop			;f1ec
	nop			;f1ed
	nop			;f1ee
	nop			;f1ef
	nop			;f1f0
	nop			;f1f1
sub_f1f2h:
	nop			;f1f2
	nop			;f1f3
	nop			;f1f4
	nop			;f1f5
	nop			;f1f6
	nop			;f1f7
	nop			;f1f8
	nop			;f1f9
	nop			;f1fa
	nop			;f1fb
	nop			;f1fc
	nop			;f1fd
	nop			;f1fe
	nop			;f1ff
	nop			;f200
	nop			;f201
	nop			;f202
	nop			;f203
	nop			;f204
	nop			;f205
	nop			;f206
	nop			;f207
	nop			;f208
	nop			;f209
	nop			;f20a
	nop			;f20b
	nop			;f20c
	nop			;f20d
	nop			;f20e
	nop			;f20f
	ld a,l			;f210
	ret po			;f211
	add a,b			;f212
	nop			;f213
	nop			;f214
	nop			;f215
	nop			;f216
	inc bc			;f217
	cp h			;f218
	ld a,a			;f219
	pop af			;f21a
	cp 0adh			;f21b
	ret po			;f21d
	nop			;f21e
	nop			;f21f
	nop			;f220
	nop			;f221
	nop			;f222
	nop			;f223
	nop			;f224
	nop			;f225
	nop			;f226
	nop			;f227
	nop			;f228
	nop			;f229
	nop			;f22a
	nop			;f22b
	nop			;f22c
	nop			;f22d
	nop			;f22e
	nop			;f22f
	nop			;f230
	nop			;f231
	nop			;f232
	nop			;f233
	nop			;f234
	nop			;f235
	nop			;f236
	nop			;f237
	nop			;f238
	nop			;f239
	nop			;f23a
	nop			;f23b
	nop			;f23c
	nop			;f23d
	nop			;f23e
	nop			;f23f
	nop			;f240
	nop			;f241
	nop			;f242
	nop			;f243
	nop			;f244
	nop			;f245
	nop			;f246
	nop			;f247
	nop			;f248
	nop			;f249
	nop			;f24a
	nop			;f24b
	nop			;f24c
	nop			;f24d
	nop			;f24e
	nop			;f24f
	nop			;f250
	nop			;f251
	nop			;f252
	nop			;f253
	nop			;f254
	nop			;f255
	nop			;f256
	nop			;f257
	nop			;f258
	nop			;f259
	nop			;f25a
	nop			;f25b
	nop			;f25c
	nop			;f25d
	nop			;f25e
	nop			;f25f
	nop			;f260
	nop			;f261
	nop			;f262
	nop			;f263
	nop			;f264
	nop			;f265
	nop			;f266
	nop			;f267
	nop			;f268
	nop			;f269
	nop			;f26a
	nop			;f26b
	nop			;f26c
	nop			;f26d
	nop			;f26e
	nop			;f26f
	nop			;f270
	nop			;f271
	nop			;f272
	nop			;f273
	nop			;f274
	nop			;f275
	nop			;f276
	nop			;f277
	nop			;f278
	nop			;f279
	nop			;f27a
	nop			;f27b
	nop			;f27c
	nop			;f27d
	nop			;f27e
	nop			;f27f
	nop			;f280
	nop			;f281
	nop			;f282
	nop			;f283
	nop			;f284
	nop			;f285
	nop			;f286
	nop			;f287
	nop			;f288
	nop			;f289
	nop			;f28a
	nop			;f28b
	nop			;f28c
	nop			;f28d
	nop			;f28e
	nop			;f28f
	nop			;f290
	nop			;f291
	nop			;f292
	nop			;f293
	nop			;f294
	nop			;f295
	nop			;f296
	nop			;f297
	nop			;f298
	nop			;f299
	nop			;f29a
	nop			;f29b
	nop			;f29c
	nop			;f29d
	nop			;f29e
	nop			;f29f
	nop			;f2a0
	nop			;f2a1
	nop			;f2a2
	nop			;f2a3
	nop			;f2a4
	nop			;f2a5
	nop			;f2a6
	nop			;f2a7
	nop			;f2a8
	nop			;f2a9
	nop			;f2aa
	nop			;f2ab
	nop			;f2ac
	nop			;f2ad
	nop			;f2ae
	nop			;f2af
	nop			;f2b0
	nop			;f2b1
	nop			;f2b2
	nop			;f2b3
	nop			;f2b4
	nop			;f2b5
	nop			;f2b6
	nop			;f2b7
	nop			;f2b8
	nop			;f2b9
	nop			;f2ba
	nop			;f2bb
	nop			;f2bc
	nop			;f2bd
	nop			;f2be
	nop			;f2bf
	nop			;f2c0
	nop			;f2c1
	nop			;f2c2
	nop			;f2c3
	nop			;f2c4
	nop			;f2c5
	nop			;f2c6
	nop			;f2c7
	nop			;f2c8
	nop			;f2c9
	nop			;f2ca
	nop			;f2cb
	nop			;f2cc
	nop			;f2cd
	nop			;f2ce
	nop			;f2cf
	nop			;f2d0
	nop			;f2d1
	nop			;f2d2
	nop			;f2d3
	nop			;f2d4
	nop			;f2d5
	nop			;f2d6
	nop			;f2d7
	nop			;f2d8
	nop			;f2d9
	nop			;f2da
	nop			;f2db
	nop			;f2dc
	nop			;f2dd
	nop			;f2de
	nop			;f2df
	nop			;f2e0
	nop			;f2e1
	nop			;f2e2
	nop			;f2e3
	nop			;f2e4
	nop			;f2e5
	nop			;f2e6
	nop			;f2e7
	nop			;f2e8
	nop			;f2e9
lf2eah:
	nop			;f2ea
	nop			;f2eb
	nop			;f2ec
	nop			;f2ed
	nop			;f2ee
	nop			;f2ef
	nop			;f2f0
	nop			;f2f1
	nop			;f2f2
	nop			;f2f3
	nop			;f2f4
	nop			;f2f5
	nop			;f2f6
	nop			;f2f7
	nop			;f2f8
	nop			;f2f9
	nop			;f2fa
	nop			;f2fb
	nop			;f2fc
	nop			;f2fd
	nop			;f2fe
	nop			;f2ff
	nop			;f300
	nop			;f301
	nop			;f302
	nop			;f303
	nop			;f304
	nop			;f305
	nop			;f306
	nop			;f307
	nop			;f308
	nop			;f309
	nop			;f30a
	nop			;f30b
	nop			;f30c
	nop			;f30d
	nop			;f30e
	nop			;f30f
	nop			;f310
	ld e,d			;f311
	or a			;f312
	ld e,(hl)		;f313
	ld b,h			;f314
	cpl			;f315
	xor d			;f316
	call m,067ffh		;f317
	dec l			;f31a
	ld c,c			;f31b
	cp b			;f31c
	nop			;f31d
	nop			;f31e
	nop			;f31f
	ld (bc),a		;f320
	cp h			;f321
	rst 38h			;f322
	cp 0eeh			;f323
	rst 38h			;f325
	rst 38h			;f326
	rst 38h			;f327
	cp 0dfh			;f328
	rst 38h			;f32a
	rst 38h			;f32b
	rst 28h			;f32c
	rst 38h			;f32d
	ld a,a			;f32e
	set 6,h			;f32f
	cp 0f5h			;f331
	rst 38h			;f333
	rst 38h			;f334
	rst 38h			;f335
	ld c,a			;f336
	rst 38h			;f337
	cp (hl)			;f338
	jp m,lf4d7h		;f339
	ld bc,la325h		;f33c
	cp l			;f33f
	call po,sub_cce6h	;f340
	sbc a,0a1h		;f343
	in a,(03eh)		;f345
lf347h:
	rst 38h			;f347
	rst 38h			;f348
	rst 38h			;f349
	rst 38h			;f34a
	rst 38h			;f34b
	and b			;f34c
	dec e			;f34d
	add a,b			;f34e
	nop			;f34f
	nop			;f350
	nop			;f351
	nop			;f352
	nop			;f353
	nop			;f354
	nop			;f355
	nop			;f356
	nop			;f357
	nop			;f358
	nop			;f359
	nop			;f35a
	nop			;f35b
	nop			;f35c
	nop			;f35d
	nop			;f35e
	nop			;f35f
	nop			;f360
	nop			;f361
	nop			;f362
	nop			;f363
	nop			;f364
	nop			;f365
	nop			;f366
	nop			;f367
	nop			;f368
	nop			;f369
	nop			;f36a
	nop			;f36b
	nop			;f36c
	nop			;f36d
	nop			;f36e
	nop			;f36f
	nop			;f370
	nop			;f371
	dec bc			;f372
	push af			;f373
	adc a,0dbh		;f374
	call z,06be3h		;f376
	ld b,0f7h		;f379
	nop			;f37b
	nop			;f37c
	nop			;f37d
	nop			;f37e
sub_f37fh:
	nop			;f37f
	nop			;f380
	nop			;f381
	rra			;f382
	and (hl)		;f383
	xor a			;f384
	rst 38h			;f385
	rst 38h			;f386
	rst 38h			;f387
	ei			;f388
	ld l,a			;f389
	sub 000h		;f38a
	nop			;f38c
	inc bc			;f38d
	cp 0fch			;f38e
	inc a			;f390
	inc bc			;f391
	and 0feh		;f392
	ld (hl),d		;f394
	cp d			;f395
	jr c,lf406h		;f396
	ex de,hl		;f398
	ld c,(hl)		;f399
	or a			;f39a
	and 045h		;f39b
	in a,(092h)		;f39d
	add hl,sp		;f39f
	jr c,lf418h		;f3a0
	jp m,laeaah		;f3a2
	push de			;f3a5
	ld a,a			;f3a6
	call m,lffffh		;f3a7
	rst 38h			;f3aa
	rst 38h			;f3ab
	rst 38h			;f3ac
	cp (hl)			;f3ad
	and b			;f3ae
	nop			;f3af
	nop			;f3b0
	nop			;f3b1
	nop			;f3b2
	nop			;f3b3
	nop			;f3b4
	nop			;f3b5
	nop			;f3b6
	nop			;f3b7
	nop			;f3b8
	nop			;f3b9
	nop			;f3ba
	nop			;f3bb
	nop			;f3bc
	nop			;f3bd
	nop			;f3be
	nop			;f3bf
	nop			;f3c0
	nop			;f3c1
	nop			;f3c2
	nop			;f3c3
	nop			;f3c4
	nop			;f3c5
	nop			;f3c6
	nop			;f3c7
	nop			;f3c8
	nop			;f3c9
	nop			;f3ca
	nop			;f3cb
	nop			;f3cc
	nop			;f3cd
	nop			;f3ce
	nop			;f3cf
	nop			;f3d0
	nop			;f3d1
	nop			;f3d2
	nop			;f3d3
	res 0,h			;f3d4
	defb 0ddh,0f0h,000h ;illegal sequence	;f3d6
	nop			;f3d9
	nop			;f3da
	nop			;f3db
	nop			;f3dc
	nop			;f3dd
	nop			;f3de
	nop			;f3df
	nop			;f3e0
	nop			;f3e1
	ld (bc),a		;f3e2
	ld l,l			;f3e3
	and d			;f3e4
	rst 10h			;f3e5
	ld e,d			;f3e6
	rst 38h			;f3e7
	in d,(c)		;f3e8
	nop			;f3ea
	nop			;f3eb
	nop			;f3ec
	nop			;f3ed
	dec de			;f3ee
	ret m			;f3ef
	ld b,b			;f3f0
	nop			;f3f1
	ld a,a			;f3f2
	jp p,00affh		;f3f3
	ld hl,(07f69h)		;f3f6
	dec hl			;f3f9
	ld a,l			;f3fa
	or l			;f3fb
	ld (hl),a		;f3fc
	dec de			;f3fd
	add hl,bc		;f3fe
	rst 10h			;f3ff
	xor d			;f400
	xor d			;f401
	xor d			;f402
	and (hl)		;f403
	ld d,l			;f404
	xor e			;f405
lf406h:
	ld d,a			;f406
	rst 38h			;f407
	rst 38h			;f408
	rst 38h			;f409
	ret p			;f40a
	ld a,a			;f40b
	rst 38h			;f40c
	rst 38h			;f40d
	call m,00000h		;f40e
	nop			;f411
	nop			;f412
	nop			;f413
	nop			;f414
	nop			;f415
	nop			;f416
	nop			;f417
lf418h:
	nop			;f418
	nop			;f419
	nop			;f41a
	nop			;f41b
	nop			;f41c
	nop			;f41d
	nop			;f41e
lf41fh:
	nop			;f41f
	nop			;f420
	nop			;f421
	nop			;f422
	nop			;f423
	nop			;f424
	nop			;f425
	nop			;f426
	nop			;f427
	nop			;f428
	nop			;f429
	nop			;f42a
	nop			;f42b
	nop			;f42c
	nop			;f42d
	nop			;f42e
	nop			;f42f
	nop			;f430
	nop			;f431
	nop			;f432
	nop			;f433
	nop			;f434
	nop			;f435
	nop			;f436
	nop			;f437
	nop			;f438
	nop			;f439
	nop			;f43a
	nop			;f43b
	nop			;f43c
	nop			;f43d
	nop			;f43e
sub_f43fh:
	nop			;f43f
	nop			;f440
	nop			;f441
	nop			;f442
	nop			;f443
	nop			;f444
	nop			;f445
	nop			;f446
	nop			;f447
	sub d			;f448
	nop			;f449
	nop			;f44a
	nop			;f44b
	nop			;f44c
	nop			;f44d
	nop			;f44e
	rst 38h			;f44f
	ret nz			;f450
	nop			;f451
	ex (sp),hl		;f452
	call m,sub_fe02h	;f453
	xor 071h		;f456
	cp a			;f458
	ccf			;f459
	cp c			;f45a
	ld d,h			;f45b
	rst 38h			;f45c
	ccf			;f45d
	ei			;f45e
	call pe,00060h		;f45f
	nop			;f462
	nop			;f463
	rlca			;f464
	nop			;f465
	nop			;f466
	ld a,a			;f467
	rst 38h			;f468
	rst 38h			;f469
	rst 38h			;f46a
	rst 38h			;f46b
	cp 07fh			;f46c
	ret p			;f46e
	nop			;f46f
	nop			;f470
	nop			;f471
	nop			;f472
	nop			;f473
	nop			;f474
	nop			;f475
	nop			;f476
	nop			;f477
	nop			;f478
	nop			;f479
	nop			;f47a
	nop			;f47b
	nop			;f47c
	nop			;f47d
	nop			;f47e
lf47fh:
	nop			;f47f
	nop			;f480
	nop			;f481
	nop			;f482
	nop			;f483
	nop			;f484
	nop			;f485
	nop			;f486
	nop			;f487
	nop			;f488
	nop			;f489
	nop			;f48a
	nop			;f48b
	nop			;f48c
	nop			;f48d
	nop			;f48e
	nop			;f48f
	nop			;f490
	nop			;f491
	nop			;f492
	nop			;f493
	nop			;f494
	nop			;f495
	nop			;f496
	nop			;f497
	nop			;f498
	nop			;f499
	nop			;f49a
	nop			;f49b
	nop			;f49c
	nop			;f49d
	nop			;f49e
	nop			;f49f
	nop			;f4a0
	nop			;f4a1
	nop			;f4a2
	nop			;f4a3
	nop			;f4a4
	nop			;f4a5
	nop			;f4a6
	nop			;f4a7
	nop			;f4a8
	nop			;f4a9
	nop			;f4aa
	nop			;f4ab
	nop			;f4ac
	nop			;f4ad
	nop			;f4ae
	ld bc,lbffbh		;f4af
	and b			;f4b2
	ld a,a			;f4b3
	defb 0ddh,0f4h,09fh ;illegal sequence	;f4b4
	rst 38h			;f4b7
	ld a,a			;f4b8
	rst 38h			;f4b9
	ld a,a			;f4ba
	ld sp,hl		;f4bb
	rst 38h			;f4bc
	rst 28h			;f4bd
	call pe,00000h		;f4be
	nop			;f4c1
	nop			;f4c2
	nop			;f4c3
	nop			;f4c4
	nop			;f4c5
	nop			;f4c6
	nop			;f4c7
	nop			;f4c8
	nop			;f4c9
	nop			;f4ca
	nop			;f4cb
	nop			;f4cc
	nop			;f4cd
	nop			;f4ce
	nop			;f4cf
	nop			;f4d0
	nop			;f4d1
	nop			;f4d2
	nop			;f4d3
	nop			;f4d4
	nop			;f4d5
	nop			;f4d6
lf4d7h:
	nop			;f4d7
	nop			;f4d8
	nop			;f4d9
	nop			;f4da
	nop			;f4db
	nop			;f4dc
	nop			;f4dd
	nop			;f4de
	nop			;f4df
	nop			;f4e0
	nop			;f4e1
	nop			;f4e2
	nop			;f4e3
	nop			;f4e4
	nop			;f4e5
	nop			;f4e6
	nop			;f4e7
	nop			;f4e8
	nop			;f4e9
	nop			;f4ea
	nop			;f4eb
	nop			;f4ec
	nop			;f4ed
	nop			;f4ee
	nop			;f4ef
	nop			;f4f0
	nop			;f4f1
	nop			;f4f2
	nop			;f4f3
	nop			;f4f4
	nop			;f4f5
	nop			;f4f6
	nop			;f4f7
	nop			;f4f8
	nop			;f4f9
	nop			;f4fa
	nop			;f4fb
	nop			;f4fc
	nop			;f4fd
	nop			;f4fe
	nop			;f4ff
	nop			;f500
	nop			;f501
	nop			;f502
	nop			;f503
	nop			;f504
	nop			;f505
	nop			;f506
	nop			;f507
	nop			;f508
	nop			;f509
	nop			;f50a
	nop			;f50b
	nop			;f50c
	nop			;f50d
	nop			;f50e
	nop			;f50f
	ld a,l			;f510
	push de			;f511
	add a,b			;f512
	nop			;f513
	nop			;f514
	nop			;f515
	nop			;f516
	nop			;f517
	ld a,a			;f518
	rra			;f519
	defb 0fdh,079h,07eh ;illegal sequence	;f51a
	nop			;f51d
	nop			;f51e
	nop			;f51f
	nop			;f520
	nop			;f521
	nop			;f522
	nop			;f523
	nop			;f524
	nop			;f525
	nop			;f526
	nop			;f527
	nop			;f528
	nop			;f529
	nop			;f52a
	nop			;f52b
	nop			;f52c
	nop			;f52d
	nop			;f52e
	nop			;f52f
	nop			;f530
	nop			;f531
	nop			;f532
	nop			;f533
	nop			;f534
	nop			;f535
	nop			;f536
	nop			;f537
	nop			;f538
	nop			;f539
	nop			;f53a
	nop			;f53b
	nop			;f53c
	nop			;f53d
	nop			;f53e
	nop			;f53f
	nop			;f540
	nop			;f541
	nop			;f542
	nop			;f543
	nop			;f544
	nop			;f545
	nop			;f546
	nop			;f547
	nop			;f548
	nop			;f549
	nop			;f54a
	nop			;f54b
	nop			;f54c
	nop			;f54d
	nop			;f54e
	nop			;f54f
	nop			;f550
	nop			;f551
	nop			;f552
	nop			;f553
	nop			;f554
	nop			;f555
	nop			;f556
lf557h:
	nop			;f557
	nop			;f558
	nop			;f559
	nop			;f55a
	nop			;f55b
	nop			;f55c
	nop			;f55d
	nop			;f55e
	nop			;f55f
	nop			;f560
	nop			;f561
	nop			;f562
	nop			;f563
	nop			;f564
	nop			;f565
	nop			;f566
	nop			;f567
	nop			;f568
	nop			;f569
	nop			;f56a
	nop			;f56b
	nop			;f56c
	nop			;f56d
	nop			;f56e
	nop			;f56f
	nop			;f570
	nop			;f571
	nop			;f572
	nop			;f573
	nop			;f574
	nop			;f575
	nop			;f576
	nop			;f577
	nop			;f578
	nop			;f579
	nop			;f57a
	nop			;f57b
	nop			;f57c
	nop			;f57d
	nop			;f57e
lf57fh:
	nop			;f57f
	nop			;f580
	nop			;f581
	nop			;f582
	nop			;f583
	nop			;f584
	nop			;f585
	nop			;f586
	nop			;f587
	nop			;f588
	nop			;f589
	nop			;f58a
	nop			;f58b
	nop			;f58c
	nop			;f58d
	nop			;f58e
	nop			;f58f
	nop			;f590
	nop			;f591
	nop			;f592
	nop			;f593
	nop			;f594
	nop			;f595
	nop			;f596
	nop			;f597
	nop			;f598
	nop			;f599
	nop			;f59a
	nop			;f59b
	nop			;f59c
	nop			;f59d
	nop			;f59e
	nop			;f59f
	nop			;f5a0
	nop			;f5a1
	nop			;f5a2
	nop			;f5a3
	nop			;f5a4
	nop			;f5a5
	nop			;f5a6
	nop			;f5a7
	nop			;f5a8
	nop			;f5a9
	nop			;f5aa
	nop			;f5ab
	nop			;f5ac
	nop			;f5ad
	nop			;f5ae
	nop			;f5af
	nop			;f5b0
	nop			;f5b1
	nop			;f5b2
	nop			;f5b3
	nop			;f5b4
	nop			;f5b5
	nop			;f5b6
	nop			;f5b7
	nop			;f5b8
	nop			;f5b9
	nop			;f5ba
	nop			;f5bb
	nop			;f5bc
	nop			;f5bd
	nop			;f5be
	nop			;f5bf
	nop			;f5c0
	nop			;f5c1
	nop			;f5c2
	nop			;f5c3
	nop			;f5c4
	nop			;f5c5
	nop			;f5c6
	nop			;f5c7
	nop			;f5c8
	nop			;f5c9
	nop			;f5ca
	nop			;f5cb
	nop			;f5cc
	nop			;f5cd
	nop			;f5ce
	nop			;f5cf
	nop			;f5d0
	nop			;f5d1
	nop			;f5d2
	nop			;f5d3
	nop			;f5d4
	nop			;f5d5
	nop			;f5d6
	nop			;f5d7
	nop			;f5d8
	nop			;f5d9
	nop			;f5da
	nop			;f5db
	nop			;f5dc
	nop			;f5dd
	nop			;f5de
	nop			;f5df
	nop			;f5e0
	nop			;f5e1
	nop			;f5e2
	nop			;f5e3
	nop			;f5e4
	nop			;f5e5
	nop			;f5e6
	nop			;f5e7
	nop			;f5e8
	nop			;f5e9
	nop			;f5ea
	nop			;f5eb
	nop			;f5ec
	nop			;f5ed
	nop			;f5ee
	nop			;f5ef
	nop			;f5f0
	nop			;f5f1
	nop			;f5f2
	nop			;f5f3
	nop			;f5f4
	nop			;f5f5
	nop			;f5f6
	nop			;f5f7
	nop			;f5f8
	nop			;f5f9
	nop			;f5fa
	nop			;f5fb
	nop			;f5fc
	nop			;f5fd
	nop			;f5fe
	nop			;f5ff
	nop			;f600
	nop			;f601
	nop			;f602
	nop			;f603
	nop			;f604
	nop			;f605
	nop			;f606
	nop			;f607
	nop			;f608
	nop			;f609
	nop			;f60a
	nop			;f60b
	nop			;f60c
	nop			;f60d
	nop			;f60e
	nop			;f60f
	nop			;f610
	ccf			;f611
	ld e,e			;f612
	sla d			;f613
	halt			;f615
	ld e,c			;f616
	defb 0ddh,090h,0fah ;illegal sequence	;f617
	ld e,e			;f61a
	or e			;f61b
	ret p			;f61c
	nop			;f61d
	nop			;f61e
	nop			;f61f
	ex af,af'		;f620
	jr c,$+1		;f621
	call m,sub_ffd5h	;f623
	rst 38h			;f626
	rst 38h			;f627
	defb 0fdh,04fh,0ffh ;illegal sequence	;f628
	rst 38h			;f62b
	adc a,0ffh		;f62c
	jp lfcd9h		;f62e
	ret p			;f631
	call m,lff3fh		;f632
	cp 0afh			;f635
	defb 0fdh,0f7h,0f4h ;illegal sequence	;f637
	ret			;f63a
	adc a,e			;f63b
	ld l,(hl)		;f63c
	jp c,04eech		;f63d
	ld e,a			;f640
	rra			;f641
	inc sp			;f642
	cp l			;f643
	call nc,09e6bh		;f644
	rst 38h			;f647
	rst 38h			;f648
	rst 38h			;f649
	rst 38h			;f64a
	defb 0fdh,050h,03eh ;illegal sequence	;f64b
	add a,b			;f64e
	nop			;f64f
	nop			;f650
	nop			;f651
	nop			;f652
	nop			;f653
	nop			;f654
	nop			;f655
	nop			;f656
	nop			;f657
	nop			;f658
	nop			;f659
	nop			;f65a
	nop			;f65b
	nop			;f65c
	nop			;f65d
	nop			;f65e
	nop			;f65f
	nop			;f660
	nop			;f661
	nop			;f662
	nop			;f663
	nop			;f664
	nop			;f665
	nop			;f666
	nop			;f667
	nop			;f668
	nop			;f669
	nop			;f66a
	nop			;f66b
	nop			;f66c
	nop			;f66d
	nop			;f66e
	nop			;f66f
	nop			;f670
	nop			;f671
	ld b,0a7h		;f672
	ld a,c			;f674
	call po,sub_ab39h	;f675
	rst 8			;f678
	ld h,a			;f679
	ld a,(hl)		;f67a
	nop			;f67b
	nop			;f67c
	nop			;f67d
	nop			;f67e
	nop			;f67f
	nop			;f680
	nop			;f681
	dec e			;f682
	ld c,l			;f683
	ld a,a			;f684
	rst 38h			;f685
	rst 38h			;f686
	rst 38h			;f687
	di			;f688
	scf			;f689
	ret m			;f68a
	nop			;f68b
	nop			;f68c
	ld bc,lfafeh		;f68d
	inc e			;f690
	inc bc			;f691
	rst 8			;f692
	ld a,a			;f693
lf694h:
	dec c			;f694
	defb 0ddh,0dch,075h ;illegal sequence	;f695
	ld d,a			;f698
	or d			;f699
	ld c,(hl)		;f69a
	sbc a,a			;f69b
	cp e			;f69c
	and h			;f69d
	xor a			;f69e
	add a,0f7h		;f69f
	defb 0fdh,055h ;ld d,iyl	;f6a1
	ld d,l			;f6a3
	ld e,l			;f6a4
	ld e,h			;f6a5
	cp a			;f6a6
	rst 38h			;f6a7
	ccf			;f6a8
	rst 38h			;f6a9
	rst 38h			;f6aa
	rst 38h			;f6ab
	rst 38h			;f6ac
	ld e,c			;f6ad
	ld h,b			;f6ae
	nop			;f6af
	nop			;f6b0
	nop			;f6b1
	nop			;f6b2
	nop			;f6b3
	nop			;f6b4
	nop			;f6b5
	nop			;f6b6
	nop			;f6b7
	nop			;f6b8
	nop			;f6b9
	nop			;f6ba
	nop			;f6bb
	nop			;f6bc
	nop			;f6bd
	nop			;f6be
	nop			;f6bf
	nop			;f6c0
	nop			;f6c1
	nop			;f6c2
	nop			;f6c3
	nop			;f6c4
	nop			;f6c5
	nop			;f6c6
	nop			;f6c7
	nop			;f6c8
	nop			;f6c9
	nop			;f6ca
	nop			;f6cb
	nop			;f6cc
	nop			;f6cd
lf6ceh:
	nop			;f6ce
	nop			;f6cf
	nop			;f6d0
	nop			;f6d1
	nop			;f6d2
	nop			;f6d3
	scf			;f6d4
	ld e,(hl)		;f6d5
	rst 30h			;f6d6
	nop			;f6d7
	nop			;f6d8
	nop			;f6d9
	nop			;f6da
	nop			;f6db
	nop			;f6dc
	nop			;f6dd
	nop			;f6de
	nop			;f6df
	nop			;f6e0
	nop			;f6e1
	inc bc			;f6e2
	ld e,l			;f6e3
	dec d			;f6e4
	jr nz,lf694h		;f6e5
	ld a,a			;f6e7
	call z,000e0h		;f6e8
	nop			;f6eb
	nop			;f6ec
	nop			;f6ed
	rra			;f6ee
	rst 20h			;f6ef
	and b			;f6f0
	nop			;f6f1
	ld a,a			;f6f2
	jp nz,la5ffh		;f6f3
	ld sp,hl		;f6f6
	sub d			;f6f7
	jr lf6ceh		;f6f8
	sub d			;f6fa
	ld e,(hl)		;f6fb
	ex de,hl		;f6fc
	call pe,sub_eb67h	;f6fd
	add a,l			;f700
	ld d,l			;f701
	ld d,l			;f702
	ld c,h			;f703
	xor c			;f704
	inc de			;f705
	dec hl			;f706
lf707h:
	rst 38h			;f707
	rst 38h			;f708
	rst 38h			;f709
	rst 38h			;f70a
	rra			;f70b
	rst 38h			;f70c
	rst 38h			;f70d
	call m,00000h		;f70e
	nop			;f711
	nop			;f712
	nop			;f713
	nop			;f714
	nop			;f715
	nop			;f716
	nop			;f717
	nop			;f718
	nop			;f719
	nop			;f71a
	nop			;f71b
	nop			;f71c
	nop			;f71d
	nop			;f71e
	nop			;f71f
	nop			;f720
	nop			;f721
	nop			;f722
	nop			;f723
	nop			;f724
	nop			;f725
	nop			;f726
	nop			;f727
	nop			;f728
	nop			;f729
	nop			;f72a
	nop			;f72b
	nop			;f72c
	nop			;f72d
	nop			;f72e
	nop			;f72f
	nop			;f730
	nop			;f731
	nop			;f732
	nop			;f733
	nop			;f734
	nop			;f735
	nop			;f736
	nop			;f737
	nop			;f738
	nop			;f739
	nop			;f73a
	nop			;f73b
	nop			;f73c
	nop			;f73d
	nop			;f73e
lf73fh:
	nop			;f73f
	nop			;f740
	nop			;f741
	nop			;f742
sub_f743h:
	nop			;f743
	nop			;f744
	nop			;f745
	nop			;f746
	nop			;f747
	ld (hl),b		;f748
	nop			;f749
	nop			;f74a
	nop			;f74b
	nop			;f74c
	nop			;f74d
	nop			;f74e
	rra			;f74f
	ret po			;f750
	ld bc,lf8a3h		;f751
	ld bc,0403eh		;f754
	ld c,076h		;f757
	jp c,la9c6h		;f759
	rst 38h			;f75c
	cp a			;f75d
	di			;f75e
	ret p			;f75f
	add a,b			;f760
	nop			;f761
	nop			;f762
	nop			;f763
	ld (bc),a		;f764
	nop			;f765
	nop			;f766
	ccf			;f767
	rst 38h			;f768
	rst 38h			;f769
	rst 38h			;f76a
	rst 38h			;f76b
	call m,sub_f07fh	;f76c
	nop			;f76f
	nop			;f770
	nop			;f771
	nop			;f772
	nop			;f773
	nop			;f774
	nop			;f775
	nop			;f776
	nop			;f777
	nop			;f778
	nop			;f779
	nop			;f77a
	nop			;f77b
	nop			;f77c
	nop			;f77d
	nop			;f77e
	nop			;f77f
	nop			;f780
	nop			;f781
	nop			;f782
	nop			;f783
	nop			;f784
	nop			;f785
	nop			;f786
	nop			;f787
	nop			;f788
	nop			;f789
	nop			;f78a
	nop			;f78b
	nop			;f78c
	nop			;f78d
	nop			;f78e
	nop			;f78f
	nop			;f790
	nop			;f791
	nop			;f792
	nop			;f793
	nop			;f794
	nop			;f795
	nop			;f796
	nop			;f797
	nop			;f798
	nop			;f799
	nop			;f79a
	nop			;f79b
	nop			;f79c
	nop			;f79d
	nop			;f79e
lf79fh:
	nop			;f79f
	nop			;f7a0
	nop			;f7a1
	nop			;f7a2
	nop			;f7a3
	nop			;f7a4
	nop			;f7a5
	nop			;f7a6
	nop			;f7a7
	nop			;f7a8
	nop			;f7a9
	nop			;f7aa
	nop			;f7ab
	nop			;f7ac
	nop			;f7ad
	nop			;f7ae
	ld bc,lbffbh		;f7af
	ld h,b			;f7b2
	ld a,a			;f7b3
	defb 0fdh,0ech,06fh ;illegal sequence	;f7b4
	rst 38h			;f7b7
	ccf			;f7b8
	rst 38h			;f7b9
	ld a,a			;f7ba
	ld sp,hl		;f7bb
	rst 38h			;f7bc
	rst 28h			;f7bd
	ld e,b			;f7be
	nop			;f7bf
	nop			;f7c0
	nop			;f7c1
	nop			;f7c2
	nop			;f7c3
	nop			;f7c4
	nop			;f7c5
	nop			;f7c6
	nop			;f7c7
	nop			;f7c8
	nop			;f7c9
	nop			;f7ca
	nop			;f7cb
	nop			;f7cc
	nop			;f7cd
	nop			;f7ce
	nop			;f7cf
	nop			;f7d0
	nop			;f7d1
	nop			;f7d2
	nop			;f7d3
	nop			;f7d4
	nop			;f7d5
	nop			;f7d6
	nop			;f7d7
	nop			;f7d8
	nop			;f7d9
	nop			;f7da
	nop			;f7db
	nop			;f7dc
	nop			;f7dd
	nop			;f7de
	nop			;f7df
	nop			;f7e0
	nop			;f7e1
	nop			;f7e2
	nop			;f7e3
	nop			;f7e4
	nop			;f7e5
	nop			;f7e6
	nop			;f7e7
	nop			;f7e8
	nop			;f7e9
	nop			;f7ea
	nop			;f7eb
	nop			;f7ec
	nop			;f7ed
	nop			;f7ee
	nop			;f7ef
	nop			;f7f0
sub_f7f1h:
	nop			;f7f1
	nop			;f7f2
	nop			;f7f3
	nop			;f7f4
	nop			;f7f5
	nop			;f7f6
	nop			;f7f7
	nop			;f7f8
	nop			;f7f9
	nop			;f7fa
	nop			;f7fb
	nop			;f7fc
	nop			;f7fd
	nop			;f7fe
	nop			;f7ff
	nop			;f800
	nop			;f801
	nop			;f802
	nop			;f803
	nop			;f804
	nop			;f805
	nop			;f806
lf807h:
	nop			;f807
	nop			;f808
	nop			;f809
	nop			;f80a
	nop			;f80b
	nop			;f80c
	nop			;f80d
	nop			;f80e
	nop			;f80f
	ld a,a			;f810
	rst 28h			;f811
	nop			;f812
	nop			;f813
	nop			;f814
	nop			;f815
	nop			;f816
	nop			;f817
	inc bc			;f818
	rst 0			;f819
	jp pe,lc087h		;f81a
	nop			;f81d
	nop			;f81e
	nop			;f81f
	nop			;f820
	nop			;f821
	nop			;f822
	nop			;f823
	nop			;f824
	nop			;f825
	nop			;f826
	nop			;f827
	nop			;f828
	nop			;f829
	nop			;f82a
	nop			;f82b
	nop			;f82c
	nop			;f82d
	nop			;f82e
	nop			;f82f
	nop			;f830
	nop			;f831
	nop			;f832
	nop			;f833
	nop			;f834
	nop			;f835
	nop			;f836
	nop			;f837
	nop			;f838
lf839h:
	nop			;f839
	nop			;f83a
	nop			;f83b
	nop			;f83c
	nop			;f83d
	nop			;f83e
	nop			;f83f
	nop			;f840
	nop			;f841
	nop			;f842
	nop			;f843
	nop			;f844
	nop			;f845
	nop			;f846
	nop			;f847
	nop			;f848
	nop			;f849
	nop			;f84a
	nop			;f84b
	nop			;f84c
	nop			;f84d
	nop			;f84e
	nop			;f84f
	nop			;f850
	nop			;f851
	nop			;f852
	nop			;f853
	nop			;f854
	nop			;f855
	nop			;f856
	nop			;f857
	nop			;f858
	nop			;f859
	nop			;f85a
	nop			;f85b
	nop			;f85c
	nop			;f85d
	nop			;f85e
	nop			;f85f
	nop			;f860
	nop			;f861
	nop			;f862
	nop			;f863
	nop			;f864
	nop			;f865
	nop			;f866
	nop			;f867
	nop			;f868
	nop			;f869
	nop			;f86a
	nop			;f86b
	nop			;f86c
	nop			;f86d
	nop			;f86e
	nop			;f86f
	nop			;f870
	nop			;f871
	nop			;f872
	nop			;f873
	nop			;f874
	nop			;f875
	nop			;f876
	nop			;f877
	nop			;f878
	nop			;f879
	nop			;f87a
	nop			;f87b
	nop			;f87c
lf87dh:
	nop			;f87d
	nop			;f87e
	nop			;f87f
	nop			;f880
	nop			;f881
	nop			;f882
lf883h:
	nop			;f883
	nop			;f884
	nop			;f885
	nop			;f886
	nop			;f887
	nop			;f888
	nop			;f889
	nop			;f88a
	nop			;f88b
	nop			;f88c
	nop			;f88d
	nop			;f88e
	nop			;f88f
	nop			;f890
	nop			;f891
	nop			;f892
	nop			;f893
	nop			;f894
	nop			;f895
	nop			;f896
	nop			;f897
	nop			;f898
	nop			;f899
	nop			;f89a
	nop			;f89b
	nop			;f89c
	nop			;f89d
	nop			;f89e
	nop			;f89f
	nop			;f8a0
	nop			;f8a1
	nop			;f8a2
lf8a3h:
	nop			;f8a3
	nop			;f8a4
	nop			;f8a5
	nop			;f8a6
	nop			;f8a7
	nop			;f8a8
	nop			;f8a9
	nop			;f8aa
	nop			;f8ab
	nop			;f8ac
	nop			;f8ad
	nop			;f8ae
lf8afh:
	nop			;f8af
	nop			;f8b0
lf8b1h:
	nop			;f8b1
	nop			;f8b2
	nop			;f8b3
	nop			;f8b4
	nop			;f8b5
	nop			;f8b6
	nop			;f8b7
	nop			;f8b8
	nop			;f8b9
	nop			;f8ba
	nop			;f8bb
	nop			;f8bc
	nop			;f8bd
	nop			;f8be
	nop			;f8bf
	nop			;f8c0
	nop			;f8c1
	nop			;f8c2
	nop			;f8c3
	nop			;f8c4
	nop			;f8c5
	nop			;f8c6
	nop			;f8c7
	nop			;f8c8
	nop			;f8c9
	nop			;f8ca
	nop			;f8cb
	nop			;f8cc
	nop			;f8cd
	nop			;f8ce
	nop			;f8cf
	nop			;f8d0
	nop			;f8d1
	nop			;f8d2
	nop			;f8d3
	nop			;f8d4
	nop			;f8d5
	nop			;f8d6
	nop			;f8d7
	nop			;f8d8
	nop			;f8d9
	nop			;f8da
	nop			;f8db
	nop			;f8dc
	nop			;f8dd
	nop			;f8de
	nop			;f8df
	nop			;f8e0
	nop			;f8e1
	nop			;f8e2
	nop			;f8e3
	nop			;f8e4
	nop			;f8e5
	nop			;f8e6
	nop			;f8e7
	nop			;f8e8
	nop			;f8e9
	nop			;f8ea
	nop			;f8eb
	nop			;f8ec
	nop			;f8ed
	nop			;f8ee
	nop			;f8ef
	nop			;f8f0
	nop			;f8f1
	nop			;f8f2
	nop			;f8f3
	nop			;f8f4
	nop			;f8f5
	nop			;f8f6
	nop			;f8f7
	nop			;f8f8
	nop			;f8f9
	nop			;f8fa
	nop			;f8fb
	nop			;f8fc
	nop			;f8fd
	nop			;f8fe
lf8ffh:
	nop			;f8ff
	nop			;f900
	nop			;f901
	nop			;f902
	nop			;f903
	nop			;f904
	nop			;f905
	nop			;f906
	nop			;f907
	nop			;f908
	nop			;f909
	nop			;f90a
	nop			;f90b
	nop			;f90c
	nop			;f90d
	nop			;f90e
	nop			;f90f
	nop			;f910
	inc e			;f911
	sbc a,(hl)		;f912
	jp p,lbff7h		;f913
	or e			;f916
	and l			;f917
	daa			;f918
	exx			;f919
	ld e,b			;f91a
	ld a,e			;f91b
	ret nz			;f91c
	nop			;f91d
	nop			;f91e
	nop			;f91f
	nop			;f920
	dec c			;f921
	ld a,a			;f922
	ld sp,hl		;f923
	xor (hl)		;f924
	rst 38h			;f925
	rst 38h			;f926
	rst 38h			;f927
	ld sp,hl		;f928
	sbc a,a			;f929
	rst 38h			;f92a
	rst 38h			;f92b
	sub a			;f92c
	ld a,b			;f92d
	ld hl,lfce9h		;f92e
	ld bc,000f8h		;f931
	rst 38h			;f934
	rst 38h			;f935
	ld d,a			;f936
	rst 38h			;f937
	cp d			;f938
	xor d			;f939
	ld d,a			;f93a
	ld (hl),b		;f93b
	sbc a,a			;f93c
	ld (hl),a		;f93d
	dec de			;f93e
	pop af			;f93f
	and h			;f940
	ld sp,hl		;f941
	ret m			;f942
	jp z,lfbaah		;f943
	rst 18h			;f946
	ld a,a			;f947
	rst 38h			;f948
	rst 38h			;f949
	rst 38h			;f94a
	rst 38h			;f94b
	ret pe			;f94c
	ccf			;f94d
	ld b,b			;f94e
	nop			;f94f
	nop			;f950
	nop			;f951
	nop			;f952
	nop			;f953
	nop			;f954
	nop			;f955
	nop			;f956
	nop			;f957
	nop			;f958
	nop			;f959
	nop			;f95a
	nop			;f95b
	nop			;f95c
	nop			;f95d
	nop			;f95e
	nop			;f95f
	nop			;f960
	nop			;f961
	nop			;f962
	nop			;f963
	nop			;f964
	nop			;f965
	nop			;f966
	nop			;f967
	nop			;f968
	nop			;f969
	nop			;f96a
	nop			;f96b
	nop			;f96c
	nop			;f96d
	nop			;f96e
	nop			;f96f
	nop			;f970
lf971h:
	nop			;f971
	ld bc,lcb55h		;f972
	sub a			;f975
	and d			;f976
	di			;f977
	sub (hl)		;f978
	ld (hl),a		;f979
	ret p			;f97a
	nop			;f97b
	nop			;f97c
	nop			;f97d
	nop			;f97e
	nop			;f97f
	nop			;f980
	nop			;f981
	jr z,lf971h		;f982
	cp a			;f984
	rst 38h			;f985
	rst 38h			;f986
	rst 38h			;f987
	and 06dh		;f988
	ld h,b			;f98a
	nop			;f98b
	nop			;f98c
	nop			;f98d
	defb 0fdh,0feh,008h ;illegal sequence	;f98e
	rlca			;f991
	adc a,a			;f992
	cp a			;f993
	sub e			;f994
	inc hl			;f995
	jp pe,lab3eh		;f996
	ld c,l			;f999
	call pe,07d7eh		;f99a
	in a,(073h)		;f99d
	ccf			;f99f
sub_f9a0h:
	add hl,sp		;f9a0
	jp pe,laaeah		;f9a1
	add hl,sp		;f9a4
	ld d,l			;f9a5
	cp a			;f9a6
	rst 38h			;f9a7
	add a,a			;f9a8
lf9a9h:
	rst 38h			;f9a9
	rst 38h			;f9aa
	rst 38h			;f9ab
	rst 38h			;f9ac
	ld h,(hl)		;f9ad
	and b			;f9ae
	nop			;f9af
	nop			;f9b0
	nop			;f9b1
	nop			;f9b2
	nop			;f9b3
	nop			;f9b4
	nop			;f9b5
	nop			;f9b6
	nop			;f9b7
	nop			;f9b8
	nop			;f9b9
	nop			;f9ba
	nop			;f9bb
	nop			;f9bc
	nop			;f9bd
	nop			;f9be
	nop			;f9bf
	nop			;f9c0
	nop			;f9c1
	nop			;f9c2
	nop			;f9c3
	nop			;f9c4
	nop			;f9c5
	nop			;f9c6
	nop			;f9c7
	nop			;f9c8
	nop			;f9c9
	nop			;f9ca
	nop			;f9cb
	nop			;f9cc
	nop			;f9cd
	nop			;f9ce
	nop			;f9cf
	nop			;f9d0
	nop			;f9d1
	nop			;f9d2
	nop			;f9d3
	ld a,(bc)		;f9d4
	xor a			;f9d5
	ret po			;f9d6
	nop			;f9d7
	nop			;f9d8
	nop			;f9d9
	nop			;f9da
	nop			;f9db
	nop			;f9dc
	nop			;f9dd
	nop			;f9de
	nop			;f9df
	nop			;f9e0
	nop			;f9e1
	ld (bc),a		;f9e2
	in a,(0b9h)		;f9e3
	inc b			;f9e5
	ld b,(hl)		;f9e6
	or a			;f9e7
	jp (hl)			;f9e8
	ld b,b			;f9e9
	nop			;f9ea
	nop			;f9eb
	nop			;f9ec
	nop			;f9ed
	rrca			;f9ee
	rst 18h			;f9ef
	ret po			;f9f0
	nop			;f9f1
	ld a,(hl)		;f9f2
	ld sp,ld27fh		;f9f3
	ld a,(hl)		;f9f6
	ld l,l			;f9f7
	ex (sp),hl		;f9f8
	ex (sp),hl		;f9f9
	xor a			;f9fa
	cp a			;f9fb
	rla			;f9fc
	ld d,c			;f9fd
	rst 30h			;f9fe
lf9ffh:
	di			;f9ff
	jp p,laaaah		;fa00
	sbc a,c			;fa03
	ld d,c			;fa04
	add hl,hl		;fa05
	ld (hl),l		;fa06
	rst 38h			;fa07
	rst 38h			;fa08
	rst 38h			;fa09
	rst 38h			;fa0a
	rst 8			;fa0b
	rst 38h			;fa0c
	rst 38h			;fa0d
	call m,00000h		;fa0e
	nop			;fa11
	nop			;fa12
	nop			;fa13
	nop			;fa14
	nop			;fa15
	nop			;fa16
	nop			;fa17
	nop			;fa18
	nop			;fa19
	nop			;fa1a
	nop			;fa1b
	nop			;fa1c
	nop			;fa1d
	nop			;fa1e
	nop			;fa1f
	nop			;fa20
	nop			;fa21
	nop			;fa22
	nop			;fa23
	nop			;fa24
	nop			;fa25
	nop			;fa26
	nop			;fa27
	nop			;fa28
	nop			;fa29
	nop			;fa2a
	nop			;fa2b
	nop			;fa2c
	nop			;fa2d
	nop			;fa2e
	nop			;fa2f
	nop			;fa30
	nop			;fa31
	nop			;fa32
	nop			;fa33
	nop			;fa34
	nop			;fa35
	nop			;fa36
	nop			;fa37
	nop			;fa38
	nop			;fa39
	nop			;fa3a
	nop			;fa3b
	nop			;fa3c
	nop			;fa3d
	nop			;fa3e
	nop			;fa3f
	nop			;fa40
	nop			;fa41
	nop			;fa42
	nop			;fa43
	nop			;fa44
	nop			;fa45
	nop			;fa46
	nop			;fa47
	jr nz,lfa4ah		;fa48
lfa4ah:
	nop			;fa4a
	nop			;fa4b
	nop			;fa4c
	nop			;fa4d
	nop			;fa4e
	rrca			;fa4f
	ret po			;fa50
	ld bc,lf8b1h		;fa51
	ld e,0dfh		;fa54
	rrca			;fa56
	pop bc			;fa57
	cp b			;fa58
	dec b			;fa59
	add a,b			;fa5a
	ld d,e			;fa5b
	rst 38h			;fa5c
	cp a			;fa5d
	ld sp,hl		;fa5e
	ei			;fa5f
	nop			;fa60
	nop			;fa61
	nop			;fa62
	nop			;fa63
	nop			;fa64
	nop			;fa65
	nop			;fa66
	rra			;fa67
	rst 38h			;fa68
	rst 38h			;fa69
	rst 38h			;fa6a
	rst 38h			;fa6b
	ret p			;fa6c
	ccf			;fa6d
	ret po			;fa6e
	nop			;fa6f
	nop			;fa70
	nop			;fa71
	nop			;fa72
	nop			;fa73
	nop			;fa74
	nop			;fa75
	nop			;fa76
	nop			;fa77
	nop			;fa78
	nop			;fa79
	nop			;fa7a
	nop			;fa7b
	nop			;fa7c
	nop			;fa7d
	nop			;fa7e
	nop			;fa7f
	nop			;fa80
	nop			;fa81
	nop			;fa82
	nop			;fa83
	nop			;fa84
	nop			;fa85
	nop			;fa86
	nop			;fa87
	nop			;fa88
	nop			;fa89
	nop			;fa8a
	nop			;fa8b
	nop			;fa8c
	nop			;fa8d
	nop			;fa8e
	nop			;fa8f
	nop			;fa90
	nop			;fa91
	nop			;fa92
	nop			;fa93
	nop			;fa94
	nop			;fa95
	nop			;fa96
	nop			;fa97
	nop			;fa98
	nop			;fa99
	nop			;fa9a
	nop			;fa9b
	nop			;fa9c
	nop			;fa9d
	nop			;fa9e
	nop			;fa9f
	nop			;faa0
	nop			;faa1
	nop			;faa2
	nop			;faa3
	nop			;faa4
	nop			;faa5
	nop			;faa6
	nop			;faa7
	nop			;faa8
	nop			;faa9
	nop			;faaa
	nop			;faab
	nop			;faac
	nop			;faad
	nop			;faae
	ld bc,07ff7h		;faaf
	ld b,b			;fab2
	ld a,a			;fab3
	cp 07ah			;fab4
	rla			;fab6
	rst 38h			;fab7
	cp a			;fab8
	rst 38h			;fab9
	ccf			;faba
	call m,sub_e6ffh	;fabb
	ret po			;fabe
	nop			;fabf
	nop			;fac0
	nop			;fac1
	nop			;fac2
	nop			;fac3
	nop			;fac4
	nop			;fac5
	nop			;fac6
	nop			;fac7
	nop			;fac8
	nop			;fac9
	nop			;faca
	nop			;facb
	nop			;facc
	nop			;facd
	nop			;face
	nop			;facf
	nop			;fad0
	nop			;fad1
	nop			;fad2
	nop			;fad3
	nop			;fad4
	nop			;fad5
	nop			;fad6
	nop			;fad7
	nop			;fad8
	nop			;fad9
	nop			;fada
	nop			;fadb
	nop			;fadc
	nop			;fadd
	nop			;fade
	nop			;fadf
	nop			;fae0
	nop			;fae1
	nop			;fae2
	nop			;fae3
	nop			;fae4
	nop			;fae5
	nop			;fae6
	nop			;fae7
	nop			;fae8
	nop			;fae9
	nop			;faea
	nop			;faeb
	nop			;faec
	nop			;faed
	nop			;faee
	nop			;faef
	nop			;faf0
	nop			;faf1
	nop			;faf2
	nop			;faf3
	nop			;faf4
	nop			;faf5
	nop			;faf6
	nop			;faf7
	nop			;faf8
	nop			;faf9
sub_fafah:
	nop			;fafa
	nop			;fafb
	nop			;fafc
	nop			;fafd
lfafeh:
	nop			;fafe
sub_faffh:
	nop			;faff
	nop			;fb00
	nop			;fb01
	nop			;fb02
	nop			;fb03
	nop			;fb04
	nop			;fb05
	nop			;fb06
	nop			;fb07
	nop			;fb08
	nop			;fb09
	nop			;fb0a
	nop			;fb0b
	nop			;fb0c
	nop			;fb0d
	nop			;fb0e
	nop			;fb0f
	ccf			;fb10
	call m,00000h		;fb11
	nop			;fb14
	nop			;fb15
	nop			;fb16
	nop			;fb17
	nop			;fb18
	ccf			;fb19
	rst 10h			;fb1a
	ret m			;fb1b
	nop			;fb1c
	nop			;fb1d
	nop			;fb1e
	nop			;fb1f
	nop			;fb20
	nop			;fb21
	nop			;fb22
	nop			;fb23
	nop			;fb24
	nop			;fb25
	nop			;fb26
	nop			;fb27
	nop			;fb28
	nop			;fb29
	nop			;fb2a
	nop			;fb2b
	nop			;fb2c
	nop			;fb2d
	nop			;fb2e
	nop			;fb2f
	nop			;fb30
	nop			;fb31
	nop			;fb32
	nop			;fb33
	nop			;fb34
	nop			;fb35
	nop			;fb36
	nop			;fb37
	nop			;fb38
	nop			;fb39
	nop			;fb3a
	nop			;fb3b
	nop			;fb3c
	nop			;fb3d
	nop			;fb3e
	nop			;fb3f
	nop			;fb40
	nop			;fb41
	nop			;fb42
	nop			;fb43
	nop			;fb44
	nop			;fb45
	nop			;fb46
	nop			;fb47
	nop			;fb48
	nop			;fb49
	nop			;fb4a
	nop			;fb4b
	nop			;fb4c
	nop			;fb4d
	nop			;fb4e
	nop			;fb4f
	nop			;fb50
	nop			;fb51
	nop			;fb52
	nop			;fb53
	nop			;fb54
	nop			;fb55
	nop			;fb56
	nop			;fb57
	nop			;fb58
	nop			;fb59
	nop			;fb5a
	nop			;fb5b
	nop			;fb5c
	nop			;fb5d
	nop			;fb5e
	nop			;fb5f
	nop			;fb60
	nop			;fb61
	nop			;fb62
	nop			;fb63
	nop			;fb64
	nop			;fb65
	nop			;fb66
	nop			;fb67
	nop			;fb68
	nop			;fb69
	nop			;fb6a
	nop			;fb6b
	nop			;fb6c
	nop			;fb6d
	nop			;fb6e
	nop			;fb6f
	nop			;fb70
	nop			;fb71
	nop			;fb72
	nop			;fb73
	nop			;fb74
	nop			;fb75
	nop			;fb76
	nop			;fb77
	nop			;fb78
	nop			;fb79
	nop			;fb7a
	nop			;fb7b
	nop			;fb7c
	nop			;fb7d
	nop			;fb7e
sub_fb7fh:
	nop			;fb7f
	nop			;fb80
	nop			;fb81
	nop			;fb82
	nop			;fb83
	nop			;fb84
	nop			;fb85
	nop			;fb86
	nop			;fb87
	nop			;fb88
	nop			;fb89
	nop			;fb8a
	nop			;fb8b
	nop			;fb8c
	nop			;fb8d
	nop			;fb8e
	nop			;fb8f
	nop			;fb90
	nop			;fb91
	nop			;fb92
	nop			;fb93
	nop			;fb94
	nop			;fb95
	nop			;fb96
	nop			;fb97
	nop			;fb98
	nop			;fb99
	nop			;fb9a
	nop			;fb9b
	nop			;fb9c
	nop			;fb9d
	nop			;fb9e
	nop			;fb9f
	nop			;fba0
	nop			;fba1
	nop			;fba2
	nop			;fba3
	nop			;fba4
	nop			;fba5
	nop			;fba6
	nop			;fba7
	nop			;fba8
	nop			;fba9
lfbaah:
	nop			;fbaa
	nop			;fbab
	nop			;fbac
	nop			;fbad
	nop			;fbae
	nop			;fbaf
	nop			;fbb0
	nop			;fbb1
	nop			;fbb2
	nop			;fbb3
	nop			;fbb4
	nop			;fbb5
	nop			;fbb6
	nop			;fbb7
	nop			;fbb8
	nop			;fbb9
	nop			;fbba
	nop			;fbbb
	nop			;fbbc
	nop			;fbbd
	nop			;fbbe
	nop			;fbbf
	nop			;fbc0
	nop			;fbc1
	nop			;fbc2
lfbc3h:
	nop			;fbc3
	nop			;fbc4
	nop			;fbc5
	nop			;fbc6
	nop			;fbc7
	nop			;fbc8
	nop			;fbc9
	nop			;fbca
	nop			;fbcb
	nop			;fbcc
	nop			;fbcd
	nop			;fbce
	nop			;fbcf
	nop			;fbd0
	nop			;fbd1
	nop			;fbd2
	nop			;fbd3
	nop			;fbd4
	nop			;fbd5
	nop			;fbd6
	nop			;fbd7
	nop			;fbd8
	nop			;fbd9
	nop			;fbda
	nop			;fbdb
	nop			;fbdc
	nop			;fbdd
	nop			;fbde
	nop			;fbdf
	nop			;fbe0
	nop			;fbe1
	nop			;fbe2
	nop			;fbe3
	nop			;fbe4
	nop			;fbe5
	nop			;fbe6
	nop			;fbe7
	nop			;fbe8
	nop			;fbe9
	nop			;fbea
	nop			;fbeb
	nop			;fbec
	nop			;fbed
	nop			;fbee
lfbefh:
	nop			;fbef
	nop			;fbf0
	nop			;fbf1
	nop			;fbf2
	nop			;fbf3
	nop			;fbf4
	nop			;fbf5
	nop			;fbf6
	nop			;fbf7
	nop			;fbf8
	nop			;fbf9
	nop			;fbfa
	nop			;fbfb
	nop			;fbfc
	nop			;fbfd
	nop			;fbfe
	nop			;fbff
lfc00h:
	nop			;fc00
	nop			;fc01
	nop			;fc02
	nop			;fc03
	nop			;fc04
	nop			;fc05
	nop			;fc06
	nop			;fc07
	nop			;fc08
	nop			;fc09
	nop			;fc0a
	nop			;fc0b
	nop			;fc0c
	nop			;fc0d
	nop			;fc0e
	nop			;fc0f
	nop			;fc10
	add hl,bc		;fc11
	or 03fh			;fc12
	add hl,sp		;fc14
	and l			;fc15
	jp c,ldc7bh		;fc16
	cp h			;fc19
	ld (hl),h		;fc1a
	ei			;fc1b
	nop			;fc1c
	nop			;fc1d
	nop			;fc1e
	nop			;fc1f
	nop			;fc20
	inc de			;fc21
	rst 10h			;fc22
	defb 0fdh,09dh ;sbc a,iyl	;fc23
	rst 38h			;fc25
	rst 38h			;fc26
	rst 38h			;fc27
	defb 0fdh,0bfh,0ffh ;illegal sequence	;fc28
	sbc a,a			;fc2b
	call c,0e187h		;fc2c
	ret c			;fc2f
	call m,sub_e801h	;fc30
	inc e			;fc33
	inc bc			;fc34
	rst 38h			;fc35
	ex de,hl		;fc36
	rst 30h			;fc37
	ld d,l			;fc38
	ld d,l			;fc39
	ld c,(hl)		;fc3a
	ei			;fc3b
lfc3ch:
	ld a,(hl)		;fc3c
lfc3dh:
	ld sp,hl		;fc3d
	ld a,h			;fc3e
lfc3fh:
	adc a,05bh		;fc3f
	or 01fh			;fc41
	ld d,l			;fc43
	ld d,l			;fc44
	ld l,e			;fc45
	rst 28h			;fc46
	ccf			;fc47
	rst 38h			;fc48
	rst 38h			;fc49
	rst 38h			;fc4a
	rst 38h			;fc4b
	call m,0c03eh		;fc4c
	nop			;fc4f
	nop			;fc50
	nop			;fc51
	nop			;fc52
	nop			;fc53
	nop			;fc54
	nop			;fc55
	nop			;fc56
	nop			;fc57
	nop			;fc58
	nop			;fc59
	nop			;fc5a
	nop			;fc5b
	nop			;fc5c
	nop			;fc5d
	nop			;fc5e
	nop			;fc5f
	nop			;fc60
	nop			;fc61
	nop			;fc62
	nop			;fc63
	nop			;fc64
	nop			;fc65
	nop			;fc66
	nop			;fc67
	nop			;fc68
	nop			;fc69
	nop			;fc6a
	nop			;fc6b
	nop			;fc6c
	nop			;fc6d
	nop			;fc6e
	nop			;fc6f
	nop			;fc70
	nop			;fc71
	nop			;fc72
	jp m,04e73h		;fc73
	pop de			;fc76
	call z,07367h		;fc77
	nop			;fc7a
	nop			;fc7b
	nop			;fc7c
	nop			;fc7d
	nop			;fc7e
	nop			;fc7f
	nop			;fc80
	nop			;fc81
	add hl,bc		;fc82
	in a,(07fh)		;fc83
	defb 0fdh,0ffh,0ffh ;illegal sequence	;fc85
	or 0fdh			;fc88
	add a,b			;fc8a
	nop			;fc8b
	nop			;fc8c
	nop			;fc8d
	defb 0fdh,0feh,008h ;illegal sequence	;fc8e
	ld c,00fh		;fc91
	rst 18h			;fc93
	call sub_d5ddh		;fc94
	sub a			;fc97
	call po,sub_f1f2h	;fc98
	sbc a,h			;fc9b
	ret m			;fc9c
	push hl			;fc9d
	call z,sub_d6cfh	;fc9e
	dec a			;fca1
	ld d,l			;fca2
	ld d,h			;fca3
	ld (hl),c		;fca4
	ld c,h			;fca5
	cp a			;fca6
	rst 38h			;fca7
	pop af			;fca8
	rst 38h			;fca9
	rst 38h			;fcaa
	rst 38h			;fcab
	rst 38h			;fcac
	ld a,a			;fcad
	ret nc			;fcae
	nop			;fcaf
	nop			;fcb0
	nop			;fcb1
	nop			;fcb2
	nop			;fcb3
	nop			;fcb4
	nop			;fcb5
	nop			;fcb6
	nop			;fcb7
	nop			;fcb8
	nop			;fcb9
	nop			;fcba
lfcbbh:
	nop			;fcbb
	nop			;fcbc
	nop			;fcbd
	nop			;fcbe
	nop			;fcbf
	nop			;fcc0
	nop			;fcc1
	nop			;fcc2
	nop			;fcc3
	nop			;fcc4
	nop			;fcc5
	nop			;fcc6
	nop			;fcc7
	nop			;fcc8
	nop			;fcc9
	nop			;fcca
	nop			;fccb
	nop			;fccc
	nop			;fccd
	nop			;fcce
	nop			;fccf
lfcd0h:
	nop			;fcd0
	nop			;fcd1
	nop			;fcd2
	nop			;fcd3
	ld bc,000f0h		;fcd4
	nop			;fcd7
	nop			;fcd8
lfcd9h:
	nop			;fcd9
	nop			;fcda
	nop			;fcdb
	nop			;fcdc
	nop			;fcdd
	nop			;fcde
	nop			;fcdf
	nop			;fce0
	nop			;fce1
	ld (bc),a		;fce2
	sbc a,l			;fce3
	ld b,c			;fce4
	nop			;fce5
	ld bc,lca57h		;fce6
lfce9h:
	add a,b			;fce9
	nop			;fcea
	nop			;fceb
	nop			;fcec
	nop			;fced
	rrca			;fcee
	rst 38h			;fcef
	ret nc			;fcf0
	nop			;fcf1
	ccf			;fcf2
	ret m			;fcf3
	rst 38h			;fcf4
	jp (hl)			;fcf5
	or c			;fcf6
	sbc a,a			;fcf7
	adc a,a			;fcf8
	rst 18h			;fcf9
	sbc a,04eh		;fcfa
	jp m,lf707h		;fcfc
lfcffh:
	jp (hl)			;fcff
	ld bc,05555h		;fd00
	ld (055abh),a		;fd03
	ld c,l			;fd06
	rst 38h			;fd07
	rst 38h			;fd08
	rst 38h			;fd09
	rst 38h			;fd0a
	ex (sp),hl		;fd0b
	rst 38h			;fd0c
	rst 38h			;fd0d
	call m,00000h		;fd0e
	nop			;fd11
	nop			;fd12
	nop			;fd13
	nop			;fd14
	nop			;fd15
	nop			;fd16
	nop			;fd17
	nop			;fd18
	nop			;fd19
	nop			;fd1a
	nop			;fd1b
	nop			;fd1c
	nop			;fd1d
	nop			;fd1e
	nop			;fd1f
	nop			;fd20
	nop			;fd21
	nop			;fd22
	nop			;fd23
	nop			;fd24
	nop			;fd25
	nop			;fd26
	nop			;fd27
	nop			;fd28
	nop			;fd29
	nop			;fd2a
	nop			;fd2b
	nop			;fd2c
	nop			;fd2d
	nop			;fd2e
	nop			;fd2f
	nop			;fd30
	nop			;fd31
	nop			;fd32
	nop			;fd33
	nop			;fd34
	nop			;fd35
	nop			;fd36
	nop			;fd37
	nop			;fd38
	nop			;fd39
	nop			;fd3a
	nop			;fd3b
	nop			;fd3c
	nop			;fd3d
	nop			;fd3e
	nop			;fd3f
	nop			;fd40
	nop			;fd41
	nop			;fd42
	nop			;fd43
	nop			;fd44
	nop			;fd45
	nop			;fd46
	nop			;fd47
	jr nz,lfd4ah		;fd48
lfd4ah:
	nop			;fd4a
	nop			;fd4b
	nop			;fd4c
	nop			;fd4d
	nop			;fd4e
	rlca			;fd4f
	ret p			;fd50
	inc bc			;fd51
	sub c			;fd52
	call m,02f3dh		;fd53
	ccf			;fd56
	ex (sp),hl		;fd57
	ret nz			;fd58
	ret po			;fd59
	ld a,007h		;fd5a
	rst 38h			;fd5c
	sbc a,a			;fd5d
	push af			;fd5e
	call po,00000h		;fd5f
	nop			;fd62
	nop			;fd63
	nop			;fd64
	nop			;fd65
	nop			;fd66
	rlca			;fd67
	rst 38h			;fd68
	rst 38h			;fd69
	rst 38h			;fd6a
	rst 38h			;fd6b
	ret po			;fd6c
	ccf			;fd6d
	nop			;fd6e
	nop			;fd6f
	nop			;fd70
	nop			;fd71
	nop			;fd72
	nop			;fd73
	nop			;fd74
	nop			;fd75
	nop			;fd76
	nop			;fd77
	nop			;fd78
	nop			;fd79
	nop			;fd7a
	nop			;fd7b
	nop			;fd7c
	nop			;fd7d
sub_fd7eh:
	nop			;fd7e
lfd7fh:
	nop			;fd7f
	nop			;fd80
	nop			;fd81
	nop			;fd82
	nop			;fd83
	nop			;fd84
	nop			;fd85
	nop			;fd86
	nop			;fd87
	nop			;fd88
	nop			;fd89
	nop			;fd8a
	nop			;fd8b
	nop			;fd8c
	nop			;fd8d
	nop			;fd8e
	nop			;fd8f
	nop			;fd90
	nop			;fd91
	nop			;fd92
	nop			;fd93
	nop			;fd94
	nop			;fd95
	nop			;fd96
	nop			;fd97
	nop			;fd98
	nop			;fd99
	nop			;fd9a
	nop			;fd9b
	nop			;fd9c
	nop			;fd9d
	nop			;fd9e
	nop			;fd9f
	nop			;fda0
	nop			;fda1
	nop			;fda2
	nop			;fda3
	nop			;fda4
	nop			;fda5
	nop			;fda6
	nop			;fda7
	nop			;fda8
	nop			;fda9
	nop			;fdaa
	nop			;fdab
	nop			;fdac
	nop			;fdad
	nop			;fdae
	nop			;fdaf
	rst 30h			;fdb0
	ld a,(hl)		;fdb1
	ret nz			;fdb2
	ccf			;fdb3
	rst 38h			;fdb4
	add a,(hl)		;fdb5
	ld c,0ffh		;fdb6
	sbc a,a			;fdb8
	rst 38h			;fdb9
	cp a			;fdba
	cp 07fh			;fdbb
	jp nc,00080h		;fdbd
	nop			;fdc0
	nop			;fdc1
	nop			;fdc2
	nop			;fdc3
	nop			;fdc4
	nop			;fdc5
	nop			;fdc6
	nop			;fdc7
	nop			;fdc8
	nop			;fdc9
	nop			;fdca
	nop			;fdcb
	nop			;fdcc
	nop			;fdcd
	nop			;fdce
	nop			;fdcf
	nop			;fdd0
	nop			;fdd1
	nop			;fdd2
	nop			;fdd3
	nop			;fdd4
	nop			;fdd5
	nop			;fdd6
	nop			;fdd7
	nop			;fdd8
	nop			;fdd9
	nop			;fdda
	nop			;fddb
	nop			;fddc
	nop			;fddd
	nop			;fdde
	nop			;fddf
	nop			;fde0
	nop			;fde1
	nop			;fde2
	nop			;fde3
	nop			;fde4
	nop			;fde5
	nop			;fde6
	nop			;fde7
	nop			;fde8
	nop			;fde9
lfdeah:
	nop			;fdea
	nop			;fdeb
	nop			;fdec
	nop			;fded
	nop			;fdee
	nop			;fdef
	nop			;fdf0
	nop			;fdf1
	nop			;fdf2
	nop			;fdf3
	nop			;fdf4
	nop			;fdf5
	nop			;fdf6
	nop			;fdf7
	nop			;fdf8
	nop			;fdf9
	nop			;fdfa
	nop			;fdfb
	nop			;fdfc
	nop			;fdfd
	nop			;fdfe
lfdffh:
	nop			;fdff
	nop			;fe00
	nop			;fe01
sub_fe02h:
	nop			;fe02
	nop			;fe03
	nop			;fe04
	nop			;fe05
	nop			;fe06
	nop			;fe07
	nop			;fe08
	nop			;fe09
	nop			;fe0a
	nop			;fe0b
	nop			;fe0c
sub_fe0dh:
	nop			;fe0d
	nop			;fe0e
	nop			;fe0f
	rrca			;fe10
	add a,b			;fe11
	nop			;fe12
sub_fe13h:
	nop			;fe13
	nop			;fe14
	nop			;fe15
	nop			;fe16
	nop			;fe17
	nop			;fe18
	ld bc,000fch		;fe19
	nop			;fe1c
	nop			;fe1d
	nop			;fe1e
	nop			;fe1f
	nop			;fe20
lfe21h:
	nop			;fe21
	nop			;fe22
	nop			;fe23
	nop			;fe24
	nop			;fe25
	nop			;fe26
	nop			;fe27
	nop			;fe28
	nop			;fe29
	nop			;fe2a
	nop			;fe2b
	nop			;fe2c
	nop			;fe2d
	nop			;fe2e
	nop			;fe2f
	nop			;fe30
	nop			;fe31
	nop			;fe32
	nop			;fe33
	nop			;fe34
	nop			;fe35
	nop			;fe36
	nop			;fe37
	nop			;fe38
	nop			;fe39
	nop			;fe3a
	nop			;fe3b
	nop			;fe3c
	nop			;fe3d
	nop			;fe3e
sub_fe3fh:
	nop			;fe3f
	nop			;fe40
	nop			;fe41
	nop			;fe42
	nop			;fe43
	nop			;fe44
	nop			;fe45
	nop			;fe46
	nop			;fe47
	nop			;fe48
	nop			;fe49
	nop			;fe4a
	nop			;fe4b
	nop			;fe4c
	nop			;fe4d
	nop			;fe4e
	nop			;fe4f
	nop			;fe50
	nop			;fe51
	nop			;fe52
	nop			;fe53
	nop			;fe54
	nop			;fe55
	nop			;fe56
	nop			;fe57
	nop			;fe58
	nop			;fe59
	nop			;fe5a
	nop			;fe5b
	nop			;fe5c
	nop			;fe5d
	nop			;fe5e
	nop			;fe5f
	nop			;fe60
	nop			;fe61
	nop			;fe62
	nop			;fe63
	nop			;fe64
	nop			;fe65
	nop			;fe66
	nop			;fe67
	nop			;fe68
	nop			;fe69
	nop			;fe6a
	nop			;fe6b
	nop			;fe6c
	nop			;fe6d
	nop			;fe6e
	nop			;fe6f
	nop			;fe70
	nop			;fe71
	nop			;fe72
	nop			;fe73
	nop			;fe74
	nop			;fe75
	nop			;fe76
	nop			;fe77
	nop			;fe78
	nop			;fe79
	nop			;fe7a
	nop			;fe7b
	nop			;fe7c
	nop			;fe7d
	nop			;fe7e
	nop			;fe7f
	nop			;fe80
	nop			;fe81
	nop			;fe82
	nop			;fe83
	nop			;fe84
	nop			;fe85
	nop			;fe86
	nop			;fe87
	nop			;fe88
	nop			;fe89
	nop			;fe8a
	nop			;fe8b
	nop			;fe8c
	nop			;fe8d
	nop			;fe8e
	nop			;fe8f
	nop			;fe90
	nop			;fe91
	nop			;fe92
	nop			;fe93
	nop			;fe94
	nop			;fe95
	nop			;fe96
	nop			;fe97
	nop			;fe98
	nop			;fe99
	nop			;fe9a
	nop			;fe9b
	nop			;fe9c
	nop			;fe9d
	nop			;fe9e
	nop			;fe9f
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
	nop			;feaa
	nop			;feab
	nop			;feac
	nop			;fead
	nop			;feae
lfeafh:
	nop			;feaf
	nop			;feb0
	nop			;feb1
	nop			;feb2
	nop			;feb3
	nop			;feb4
	nop			;feb5
	nop			;feb6
	nop			;feb7
	nop			;feb8
	nop			;feb9
	nop			;feba
	nop			;febb
	nop			;febc
	nop			;febd
	nop			;febe
	nop			;febf
	nop			;fec0
	nop			;fec1
	nop			;fec2
	nop			;fec3
	nop			;fec4
	nop			;fec5
	nop			;fec6
	nop			;fec7
	nop			;fec8
	nop			;fec9
	nop			;feca
	nop			;fecb
	nop			;fecc
	nop			;fecd
	nop			;fece
	nop			;fecf
	nop			;fed0
	nop			;fed1
	nop			;fed2
	nop			;fed3
	nop			;fed4
	nop			;fed5
	nop			;fed6
	nop			;fed7
	nop			;fed8
	nop			;fed9
	nop			;feda
	nop			;fedb
	nop			;fedc
	nop			;fedd
	nop			;fede
	nop			;fedf
	nop			;fee0
	nop			;fee1
	nop			;fee2
sub_fee3h:
	nop			;fee3
	nop			;fee4
	nop			;fee5
	nop			;fee6
	nop			;fee7
	nop			;fee8
	nop			;fee9
	nop			;feea
	nop			;feeb
	nop			;feec
	nop			;feed
	nop			;feee
	nop			;feef
	nop			;fef0
	nop			;fef1
	nop			;fef2
	nop			;fef3
	nop			;fef4
	nop			;fef5
	nop			;fef6
	nop			;fef7
	nop			;fef8
	nop			;fef9
	nop			;fefa
	nop			;fefb
	nop			;fefc
	nop			;fefd
lfefeh:
	nop			;fefe
	ld sp,0813fh		;feff
	ld ix,08140h		;ff02
	ld de,07dbfh		;ff06
	ld a,0ffh		;ff09
	scf			;ff0b
	ei			;ff0c
	call 00556h		;ff0d
	jp l9c40h		;ff10
	ld d,d			;ff13
	nop			;ff14
	nop			;ff15
	ld (bc),a		;ff16
	dec a			;ff17
	di			;ff18
	dec c			;ff19
	adc a,00bh		;ff1a
	jp po,0ce50h		;ff1c
sub_ff1fh:
	dec bc			;ff1f
	ex (sp),hl		;ff20
	ld d,b			;ff21
	ld e,017h		;ff22
	call c,0ce0ah		;ff24
	dec bc			;ff27
	call po,01d50h		;ff28
	rla			;ff2b
	call c,0d70ah		;ff2c
	jr $+4			;ff2f
	nop			;ff31
	jr c,lff34h		;ff32
lff34h:
	dec c			;ff34
	add hl,de		;ff35
	in a,(002h)		;ff36
	ld c,l			;ff38
lff39h:
	nop			;ff39
	and a			;ff3a
	ld c,a			;ff3b
	ld e,c			;ff3c
	nop			;ff3d
	and (hl)		;ff3e
lff3fh:
	ld c,a			;ff3f
	adc a,h			;ff40
	djnz $+94		;ff41
lff43h:
	ld c,000h		;ff43
	ld b,a			;ff45
	ret nz			;ff46
sub_ff47h:
	ld d,a			;ff47
	ld (hl),c		;ff48
	ld c,0f3h		;ff49
	dec c			;ff4b
	ld hl,lc617h		;ff4c
	ld e,0a8h		;ff4f
sub_ff51h:
	ld h,c			;ff51
	halt			;ff52
	dec de			;ff53
	inc bc			;ff54
	inc de			;ff55
	nop			;ff56
sub_ff57h:
	ld a,000h		;ff57
	inc a			;ff59
	ld b,d			;ff5a
	ld b,d			;ff5b
	ld a,(hl)		;ff5c
	ld b,d			;ff5d
	ld b,d			;ff5e
	nop			;ff5f
	nop			;ff60
	ld a,h			;ff61
	ld b,d			;ff62
	ld a,h			;ff63
	ld b,d			;ff64
	ld b,d			;ff65
	ld a,h			;ff66
sub_ff67h:
	nop			;ff67
	nop			;ff68
	inc a			;ff69
	ld b,d			;ff6a
	ld b,b			;ff6b
	ld b,b			;ff6c
	ld b,d			;ff6d
	inc a			;ff6e
	nop			;ff6f
	nop			;ff70
	ld a,b			;ff71
	ld b,h			;ff7Warning: Code might not be 8080 compatible!
Warning: Self modifying code detected!
2
lff73h:
	ld b,d			;ff73
	ld b,d			;ff74
	ld b,h			;ff75
	ld a,b			;ff76
	nop			;ff77
	nop			;ff78
	ld a,(hl)		;ff79
	ld b,b			;ff7a
	ld a,h			;ff7b
	ld b,b			;ff7c
	ld b,b			;ff7d
	ld a,(hl)		;ff7e
sub_ff7fh:
	nop			;ff7f
	nop			;ff80
sub_ff81h:
	ld a,(hl)		;ff81
	ld b,b			;ff82
	ld a,h			;ff83
	ld b,b			;ff84
	ld b,b			;ff85
	ld b,b			;ff86
	nop			;ff87
	nop			;ff88
	inc a			;ff89
	ld b,d			;ff8a
	ld b,b			;ff8b
	ld c,(hl)		;ff8c
	ld b,d			;ff8d
	inc a			;ff8e
	nop			;ff8f
	nop			;ff90
	ld b,d			;ff91
	ld b,d			;ff92
	ld a,(hl)		;ff93
	ld b,d			;ff94
	ld b,d			;ff95
	ld b,d			;ff96
	nop			;ff97
	nop			;ff98
	ld a,008h		;ff99
	ex af,af'		;ff9b
	ex af,af'		;ff9c
	ex af,af'		;ff9d
	ld a,000h		;ff9e
	nop			;ffa0
	ld (bc),a		;ffa1
	ld (bc),a		;ffa2
	ld (bc),a		;ffa3
	ld b,d			;ffa4
	ld b,d			;ffa5
	inc a			;ffa6
	nop			;ffa7
	nop			;ffa8
	ld b,h			;ffa9
	ld c,b			;ffaa
	ld (hl),b		;ffab
	ld c,b			;ffac
	ld b,h			;ffad
	ld b,d			;ffae
sub_ffafh:
	nop			;ffaf
	nop			;ffb0
	ld b,b			;ffb1
	ld b,b			;ffb2
sub_ffb3h:
	ld b,b			;ffb3
	ld b,b			;ffb4
	ld b,b			;ffb5
	ld a,(hl)		;ffb6
	nop			;ffb7
	nop			;ffb8
	ld b,d			;ffb9
	ld h,(hl)		;ffba
	ld e,d			;ffbb
	ld b,d			;ffbc
	ld b,d			;ffbd
	ld b,d			;ffbe
lffbfh:
	nop			;ffbf
	nop			;ffc0
sub_ffc1h:
	ld b,d			;ffc1
	ld h,d			;ffc2
	ld d,d			;ffc3
	ld c,d			;ffc4
	ld b,(hl)		;ffc5
	ld b,d			;ffc6
sub_ffc7h:
	nop			;ffc7
	nop			;ffc8
	inc a			;ffc9
	ld b,d			;ffca
	ld b,d			;ffcb
	ld b,d			;ffcc
	ld b,d			;ffcd
	inc a			;ffce
sub_ffcfh:
	nop			;ffcf
	nop			;ffd0
sub_ffd1h:
	ld a,h			;ffd1
	ld b,d			;ffd2
	ld b,d			;ffd3
	ld a,h			;ffd4
sub_ffd5h:
	ld b,b			;ffd5
	ld b,b			;ffd6
sub_ffd7h:
	nop			;ffd7
	nop			;ffd8
	inc a			;ffd9
	ld b,d			;ffda
	ld b,d			;ffdb
	ld d,d			;ffdc
	ld c,d			;ffdd
	inc a			;ffde
sub_ffdfh:
	nop			;ffdf
	nop			;ffe0
	ld a,h			;ffe1
	ld b,d			;ffe2
	ld b,d			;ffe3
	ld a,h			;ffe4
lffe5h:
	ld b,h			;ffe5
	ld b,d			;ffe6
sub_ffe7h:
	nop			;ffe7
	nop			;ffe8
	inc a			;ffe9
	ld b,b			;ffea
	inc a			;ffeb
	ld (bc),a		;ffec
	ld b,d			;ffed
	inc a			;ffee
lffefh:
	nop			;ffef
	nop			;fff0
	cp 010h			;fff1
	djnz $+18		;fff3
	djnz $+18		;fff5
sub_fff7h:
	nop			;fff7
	nop			;fff8
	ld b,d			;fff9
lfffah:
	ld b,d			;fffa
	ld b,d			;fffb
	ld b,d			;fffc
	ld b,d			;fffd
	inc a			;fffe
lffffh:
	nop			;ffff
