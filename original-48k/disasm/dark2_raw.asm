; z80dasm 1.2.0
; command line: z80dasm -a -l -g 0x6A9B /tmp/dark2_code.bin

	org 06a9bh

	ld a,(la6c8h)		;6a9b
	and 03fh		;6a9e
	ld b,a			;6aa0
	inc b			;6aa1
l6aa2h:
	inc hl			;6aa2
	inc hl			;6aa3
	djnz l6aa2h		;6aa4
	ld e,(hl)		;6aa6
	inc hl			;6aa7
	ld d,(hl)		;6aa8
	push de			;6aa9
	pop iy			;6aaa
	ld b,(iy+000h)		;6aac
	inc iy			;6aaf
l6ab1h:
	push bc			;6ab1
	ld a,000h		;6ab2
	ld (l6bbch),a		;6ab4
	call sub_6ac4h		;6ab7
	call sub_6ae0h		;6aba
	call sub_6af1h		;6abd
	pop bc			;6ac0
	djnz l6ab1h		;6ac1
	ret			;6ac3
sub_6ac4h:
	ld hl,labdbh		;6ac4
	bit 5,(iy+003h)		;6ac7
	call nz,sub_6adch	;6acb
	ld b,(iy+000h)		;6ace
	inc b			;6ad1
	ld de,00005h		;6ad2
l6ad5h:
	add hl,de		;6ad5
	djnz l6ad5h		;6ad6
	push hl			;6ad8
	pop ix			;6ad9
	ret			;6adb
sub_6adch:
	ld hl,lfffbh		;6adc
	ret			;6adf
sub_6ae0h:
	bit 1,(iy+003h)		;6ae0
	jp nz,l6b2ah		;6ae4
	bit 2,(iy+003h)		;6ae7
	jp nz,l6bc5h		;6aeb
	jp l6b67h		;6aee
sub_6af1h:
	push iy			;6af1
	pop ix			;6af3
	ld b,004h		;6af5
l6af7h:
	inc iy			;6af7
	djnz l6af7h		;6af9
	bit 7,(ix+003h)		;6afb
	call nz,sub_6b0dh	;6aff
	bit 1,(ix+003h)		;6b02
	call nz,sub_6b0dh	;6b06
	call nz,sub_6b0dh	;6b09
	ret			;6b0c
sub_6b0dh:
	inc iy			;6b0d
	ret			;6b0f
	ld a,(la6c8h)		;6b10
	and 03fh		;6b13
	cp 000h			;6b15
	ret z			;6b17
	dec a			;6b18
	ld (la6c8h),a		;6b19
	ret			;6b1c
	ld a,(la6c8h)		;6b1d
	and 03fh		;6b20
	cp 03fh			;6b22
	ret z			;6b24
	inc a			;6b25
	ld (la6c8h),a		;6b26
	ret			;6b29
l6b2ah:
	ld d,(iy+004h)		;6b2a
	ld e,(iy+005h)		;6b2d
	bit 7,(iy+003h)		;6b30
	call nz,sub_6b60h	;6b34
	ld h,(iy+001h)		;6b37
	ld l,(iy+002h)		;6b3a
	push hl			;6b3d
	ld b,d			;6b3e
l6b3fh:
	push bc			;6b3f
	ld b,e			;6b40
l6b41h:
	push bc			;6b41
	push de			;6b42
	call l6b67h		;6b43
	call sub_6b71h		;6b46
	pop de			;6b49
	pop bc			;6b4a
	djnz l6b41h		;6b4b
	call sub_6b9eh		;6b4d
	pop bc			;6b50
	pop hl			;6b51
	ld (iy+002h),l		;6b52
	push hl			;6b55
	djnz l6b3fh		;6b56
	pop hl			;6b58
	ld (iy+001h),h		;6b59
	ld (iy+002h),l		;6b5c
	ret			;6b5f
sub_6b60h:
	ld d,(iy+005h)		;6b60
	ld e,(iy+006h)		;6b63
	ret			;6b66
l6b67h:
	bit 2,(iy+003h)		;6b67
	jp nz,l6bc5h		;6b6b
	jp l6c48h		;6b6e
sub_6b71h:
	ld a,(iy+003h)		;6b71
	and 005h		;6b74
	cp 000h			;6b76
	jp z,l6b8ch		;6b78
	cp 005h			;6b7b
	jp z,l6b97h		;6b7d
	ld a,(ix+001h)		;6b80
l6b83h:
	add a,a			;6b83
	ld d,(iy+002h)		;6b84
	add a,d			;6b87
	ld (iy+002h),a		;6b88
	ret			;6b8b
l6b8ch:
	ld a,(ix+001h)		;6b8c
	ld d,(iy+002h)		;6b8f
	add a,d			;6b92
	ld (iy+002h),a		;6b93
	ret			;6b96
l6b97h:
	ld a,(ix+001h)		;6b97
	add a,a			;6b9a
	jp l6b83h		;6b9b
sub_6b9eh:
	bit 2,(iy+003h)		;6b9e
	jp nz,l6bb0h		;6ba2
	ld a,(iy+001h)		;6ba5
	ld d,(ix+000h)		;6ba8
	add a,d			;6bab
	ld (iy+001h),a		;6bac
	ret			;6baf
l6bb0h:
	ld a,(ix+000h)		;6bb0
	add a,a			;6bb3
	ld d,(iy+001h)		;6bb4
	add a,d			;6bb7
	ld (iy+001h),a		;6bb8
	ret			;6bbb
l6bbch:
	nop			;6bbc
l6bbdh:
	ld a,001h		;6bbd
	ld (l6bbch),a		;6bbf
	jp l6c48h		;6bc2
l6bc5h:
	ld h,(ix+003h)		;6bc5
	ld l,(ix+002h)		;6bc8
	ld a,(l6bbch)		;6bcb
	inc a			;6bce
	ld (l6bbch),a		;6bcf
	cp 002h			;6bd2
	jr z,l6bbdh		;6bd4
	push ix			;6bd6
	push iy			;6bd8
	ld d,(ix+001h)		;6bda
	ld e,(ix+000h)		;6bdd
	ld (l6d53h),de		;6be0
	ld b,(ix+000h)		;6be4
	push hl			;6be7
	ld de,00010h		;6be8
	ld hl,le6feh		;6beb
l6beeh:
	add hl,de		;6bee
	djnz l6beeh		;6bef
	push hl			;6bf1
	pop iy			;6bf2
	pop hl			;6bf4
	ld b,(ix+001h)		;6bf5
	ld ix,le6feh		;6bf8
l6bfch:
	push bc			;6bfc
	ld a,(l6d53h)		;6bfd
	ld b,a			;6c00
l6c01h:
	push bc			;6c01
	ld c,008h		;6c02
l6c04h:
	ld a,(hl)		;6c04
	ld b,008h		;6c05
l6c07h:
	rra			;6c07
	rr d			;6c08
	rr e			;6c0a
	sra d			;6c0c
	rr e			;6c0e
	djnz l6c07h		;6c10
	ld (ix+000h),d		;6c12
	ld (iy+000h),e		;6c15
	ld (iy+001h),e		;6c18
	ld (ix+001h),d		;6c1b
	inc hl			;6c1e
	inc ix			;6c1f
	inc iy			;6c21
	inc iy			;6c23
	inc ix			;6c25
	dec c			;6c27
	jr nz,l6c04h		;6c28
	pop bc			;6c2a
	djnz l6c01h		;6c2b
	ld a,(l6d53h)		;6c2d
	ld b,a			;6c30
l6c31h:
	push bc			;6c31
	ld b,010h		;6c32
l6c34h:
	inc ix			;6c34
	inc iy			;6c36
	djnz l6c34h		;6c38
	pop bc			;6c3a
	djnz l6c31h		;6c3b
	pop bc			;6c3d
	djnz l6bfch		;6c3e
	pop iy			;6c40
	pop ix			;6c42
	call l6c48h		;6c44
	ret			;6c47
l6c48h:
	ld b,(iy+001h)		;6c48
	ld d,(ix+003h)		;6c4b
	ld e,(ix+002h)		;6c4e
	bit 2,(iy+003h)		;6c51
	call nz,sub_6ce4h	;6c55
	ld c,(iy+002h)		;6c58
	ld a,c			;6c5b
	cp 021h			;6c5c
	ret p			;6c5e
	ld a,(ix+001h)		;6c5f
	bit 2,(iy+003h)		;6c62
	call nz,sub_6cb2h	;6c66
l6c69h:
	push af			;6c69
	ld a,(ix+000h)		;6c6a
	bit 2,(iy+003h)		;6c6d
	call nz,sub_6cb2h	;6c71
l6c74h:
	push af			;6c74
	call sub_6d56h		;6c75
	push bc			;6c78
	ld b,008h		;6c79
l6c7bh:
	ld a,(de)		;6c7b
	call sub_6cb4h		;6c7c
	ld (hl),a		;6c7f
	inc de			;6c80
	inc h			;6c81
	djnz l6c7bh		;6c82
	pop bc			;6c84
	ld a,b			;6c85
	sra a			;6c86
	sra a			;6c88
	sra a			;6c8a
	add a,058h		;6c8c
	ld h,a			;6c8e
	push de			;6c8f
	ld de,la286h		;6c90
	add hl,de		;6c93
	pop de			;6c94
	call sub_6ccdh		;6c95
	ld (hl),a		;6c98
	pop af			;6c99
	inc b			;6c9a
	dec a			;6c9b
	jr nz,l6c74h		;6c9c
l6c9eh:
	pop af			;6c9e
	ld b,(iy+001h)		;6c9f
	inc c			;6ca2
	push af			;6ca3
	ld a,c			;6ca4
	cp 020h			;6ca5
	jp p,l6d6bh		;6ca7
	pop af			;6caa
	dec a			;6cab
	jr nz,l6c69h		;6cac
	call sub_6cefh		;6cae
	ret			;6cb1
sub_6cb2h:
	add a,a			;6cb2
	ret			;6cb3
sub_6cb4h:
	bit 4,(iy+003h)		;6cb4
	jr nz,l6cc1h		;6cb8
	bit 3,(iy+003h)		;6cba
	jr nz,l6cc7h		;6cbe
	ret			;6cc0
l6cc1h:
	cpl			;6cc1
	and (hl)		;6cc2
	ex de,hl		;6cc3
	or (hl)			;6cc4
	ex de,hl		;6cc5
	ret			;6cc6
l6cc7h:
	and (hl)		;6cc7
	inc de			;6cc8
	ex de,hl		;6cc9
	or (hl)			;6cca
	ex de,hl		;6ccb
	ret			;6ccc
sub_6ccdh:
	bit 7,(iy+003h)		;6ccd
	jr nz,l6cddh		;6cd1
	bit 6,(iy+003h)		;6cd3
	jr nz,l6ce1h		;6cd7
	ld a,(ix+004h)		;6cd9
	ret			;6cdc
l6cddh:
	ld a,(iy+004h)		;6cdd
	ret			;6ce0
l6ce1h:
	ld a,(de)		;6ce1
	inc de			;6ce2
	ret			;6ce3
sub_6ce4h:
	ld de,le6feh		;6ce4
	ret			;6ce7
sub_6ce8h:
	and a			;6ce8
	rl d			;6ce9
	and a			;6ceb
	rl e			;6cec
	ret			;6cee
sub_6cefh:
	bit 0,(iy+003h)		;6cef
	ret z			;6cf3
	ld d,(ix+000h)		;6cf4
	ld e,(ix+001h)		;6cf7
	bit 2,(iy+003h)		;6cfa
	call nz,sub_6ce8h	;6cfe
	ld (l6d51h),de		;6d01
	push ix			;6d05
	ld a,(iy+001h)		;6d07
	ld (l6d53h),a		;6d0a
	ld a,(l6d52h)		;6d0d
	ld b,a			;6d10
l6d11h:
	push bc			;6d11
	ld a,(l6d53h)		;6d12
	ld b,a			;6d15
	ld c,(iy+002h)		;6d16
	call sub_6d56h		;6d19
	ld b,008h		;6d1c
l6d1eh:
	push bc			;6d1e
	push hl			;6d1f
	push hl			;6d20
	pop ix			;6d21
	ld a,(l6d51h)		;6d23
	add a,a			;6d26
	dec a			;6d27
	ld b,a			;6d28
l6d29h:
	inc hl			;6d29
	djnz l6d29h		;6d2a
	ld d,0ffh		;6d2c
	ld a,(l6d51h)		;6d2e
	ld b,a			;6d31
l6d32h:
	ld e,(ix+000h)		;6d32
	ld a,(de)		;6d35
	ld (hl),a		;6d36
	inc ix			;6d37
	dec hl			;6d39
	djnz l6d32h		;6d3a
	pop hl			;6d3c
	pop bc			;6d3d
	inc h			;6d3e
	djnz l6d1eh		;6d3f
	ld a,(l6d53h)		;6d41
	inc a			;6d44
	ld (l6d53h),a		;6d45
	pop bc			;6d48
	djnz l6d11h		;6d49
	call sub_6d74h		;6d4b
	pop ix			;6d4e
	ret			;6d50
l6d51h:
	nop			;6d51
l6d52h:
	nop			;6d52
l6d53h:
	nop			;6d53
	nop			;6d54
	nop			;6d55
sub_6d56h:
	ld h,040h		;6d56
	ld a,b			;6d58
	and 018h		;6d59
	add a,h			;6d5b
	ld h,a			;6d5c
	ld a,b			;6d5d
	and 007h		;6d5e
	rrc a			;6d60
	rrc a			;6d62
	rrc a			;6d64
	add a,c			;6d66
	ld l,a			;6d67
	push de			;6d68
	pop de			;6d69
	ret			;6d6a
l6d6bh:
	pop af			;6d6b
	call sub_6cefh		;6d6c
	ret			;6d6f
	pop af			;6d70
	jp l6c9eh		;6d71
sub_6d74h:
	ld a,(iy+001h)		;6d74
	ld hl,lfa66h		;6d77
	ld de,00020h		;6d7a
	inc a			;6d7d
	ld b,a			;6d7e
l6d7fh:
	add hl,de		;6d7f
	djnz l6d7fh		;6d80
	ld d,000h		;6d82
	ld e,(iy+002h)		;6d84
	add hl,de		;6d87
	ld a,(l6d52h)		;6d88
	ld b,a			;6d8b
l6d8ch:
	push bc			;6d8c
	push hl			;6d8d
	push hl			;6d8e
	pop de			;6d8f
	ld a,(l6d51h)		;6d90
	add a,a			;6d93
	dec a			;6d94
	ld b,a			;6d95
l6d96h:
	inc hl			;6d96
	djnz l6d96h		;6d97
	ld a,(l6d51h)		;6d99
	ld b,a			;6d9c
l6d9dh:
	ld a,(de)		;6d9d
	ld (hl),a		;6d9e
	inc de			;6d9f
	dec hl			;6da0
	djnz l6d9dh		;6da1
	pop hl			;6da3
	ld de,00020h		;6da4
	add hl,de		;6da7
	pop bc			;6da8
	djnz l6d8ch		;6da9
	ret			;6dab
sub_6dach:
	push hl			;6dac
	push de			;6dad
	push bc			;6dae
	ld a,(0a6e7h)		;6daf
	cp 000h			;6db2
	jr z,l6dc7h		;6db4
	add a,a			;6db6
	ld c,a			;6db7
	ld b,000h		;6db8
	ld hl,0a6e7h		;6dba
	ld d,000h		;6dbd
	ld e,c			;6dbf
	add hl,de		;6dc0
	push hl			;6dc1
	pop de			;6dc2
	inc de			;6dc3
	inc de			;6dc4
	lddr			;6dc5
l6dc7h:
	ld a,(0a6e7h)		;6dc7
	inc a			;6dca
	ld (0a6e7h),a		;6dcb
	pop bc			;6dce
	pop de			;6dcf
	pop hl			;6dd0
	ret			;6dd1
sub_6dd2h:
	push hl			;6dd2
	push de			;6dd3
	push bc			;6dd4
	ld hl,la6eah		;6dd5
	ld de,la6e8h		;6dd8
	ld a,(0a6e7h)		;6ddb
	dec a			;6dde
	ld (0a6e7h),a		;6ddf
	add a,a			;6de2
	ld c,a			;6de3
	ld b,000h		;6de4
	ldir			;6de6
	pop bc			;6de8
	pop de			;6de9
	pop hl			;6dea
	ret			;6deb
	ld a,(la6c8h)		;6dec
	and 03fh		;6def
	ld b,a			;6df1
	inc b			;6df2
	ld ix,lfffeh		;6df3
l6df7h:
	inc ix			;6df7
	inc ix			;6df9
	djnz l6df7h		;6dfb
	ld l,(ix+000h)		;6dfd
	ld h,(ix+001h)		;6e00
	push hl			;6e03
	pop ix			;6e04
	ld b,(ix+000h)		;6e06
	inc ix			;6e09
	ld a,b			;6e0b
	cp 000h			;6e0c
	ret z			;6e0e
l6e0fh:
	call sub_6dach		;6e0f
	ld h,(ix+001h)		;6e12
	ld l,(ix+000h)		;6e15
	ld (la6e8h),hl		;6e18
	inc ix			;6e1b
	inc ix			;6e1d
	djnz l6e0fh		;6e1f
	ret			;6e21
sub_6e22h:
	call sub_6dach		;6e22
	ld hl,05d2ah		;6e25
	ld (la6e8h),hl		;6e28
	call sub_6dach		;6e2b
	ld hl,05d3eh		;6e2e
	ld (la6e8h),hl		;6e31
	ret			;6e34
sub_6e35h:
	ld a,000h		;6e35
	ld (0a6e7h),a		;6e37
	ret			;6e3a
l6e3bh:
	ld l,000h		;6e3b
	ld h,0ffh		;6e3d
	call sub_6e4ah		;6e3f
	ld l,001h		;6e42
	ld h,001h		;6e44
	call sub_6e4ah		;6e46
	ret			;6e49
sub_6e4ah:
	ld b,0c8h		;6e4a
	ld c,001h		;6e4c
l6e4eh:
	dec c			;6e4e
	jr nz,l6e4eh		;6e4f
	ld a,018h		;6e51
	out (0feh),a		;6e53
	ld c,h			;6e55
l6e56h:
	dec c			;6e56
	jr nz,l6e56h		;6e57
	ld a,000h		;6e59
	out (0feh),a		;6e5b
	call sub_6e64h		;6e5d
	ld c,h			;6e60
	djnz l6e4eh		;6e61
	ret			;6e63
sub_6e64h:
	ld a,l			;6e64
	cp 000h			;6e65
	jp z,l6e6ch		;6e67
	inc h			;6e6a
	ret			;6e6b
l6e6ch:
	dec h			;6e6c
	ret			;6e6d
sub_6e6eh:
	ld a,(0a6a7h)		;6e6e
	cp 000h			;6e71
	ret nz			;6e73
	call sub_7d4bh		;6e74
	ret z			;6e77
	ld a,(l6ecah)		;6e78
	dec a			;6e7b
	ld (l6ecah),a		;6e7c
	cp 000h			;6e7f
	ret nz			;6e81
	ld a,002h		;6e82
	ld (l6ecah),a		;6e84
	ld a,(la6a8h)		;6e87
	dec a			;6e8a
	ld (la6a8h),a		;6e8b
	cp 000h			;6e8e
	ret nz			;6e90
	ld a,028h		;6e91
	ld (la6a8h),a		;6e93
	ld hl,la77dh		;6e96
	ld a,(la6c8h)		;6e99
	and 03fh		;6e9c
	ld b,000h		;6e9e
	ld c,a			;6ea0
	add hl,bc		;6ea1
	add hl,bc		;6ea2
	add hl,bc		;6ea3
	ld a,(hl)		;6ea4
	cp 000h			;6ea5
	jp z,l6ecbh		;6ea7
	ld (la6aah),a		;6eaa
	ld (la6aeh),a		;6ead
	call l6ecbh		;6eb0
	inc hl			;6eb3
	ld a,(hl)		;6eb4
	ld (l6f4bh),a		;6eb5
	inc hl			;6eb8
	ld a,(hl)		;6eb9
	ld (l6f4ch),a		;6eba
	ld de,l6f4bh		;6ebd
	call sub_7e07h		;6ec0
	ld hl,(l6f4bh)		;6ec3
	ld (l6f4dh),hl		;6ec6
	ret			;6ec9
l6ecah:
	ld (bc),a		;6eca
l6ecbh:
	ld a,001h		;6ecb
	ld (0a6a7h),a		;6ecd
	ret			;6ed0
sub_6ed1h:
	ld a,(la6aah)		;6ed1
	cp 000h			;6ed4
	ret z			;6ed6
	call sub_7d59h		;6ed7
	ld a,(l6f17h)		;6eda
	dec a			;6edd
	ld (l6f17h),a		;6ede
	cp 000h			;6ee1
	ret nz			;6ee3
	ld a,003h		;6ee4
	ld (l6f17h),a		;6ee6
	ld a,(l6f16h)		;6ee9
	dec a			;6eec
	ld (l6f16h),a		;6eed
	cp 004h			;6ef0
	jp z,l6f36h		;6ef2
	cp 003h			;6ef5
	jp z,l6e3bh		;6ef7
	cp 002h			;6efa
	jp z,l6f3ch		;6efc
	bit 0,a			;6eff
	jp z,l6f0dh		;6f01
	ld a,(l6f4bh)		;6f04
	sub 002h		;6f07
	ld (l6f4bh),a		;6f09
	ret			;6f0c
l6f0dh:
	ld a,(l6f4bh)		;6f0d
	inc a			;6f10
	inc a			;6f11
	ld (l6f4bh),a		;6f12
	ret			;6f15
l6f16h:
	add hl,de		;6f16
l6f17h:
	inc bc			;6f17
l6f18h:
	ld a,000h		;6f18
	ld (la6aah),a		;6f1a
	ld a,019h		;6f1d
	ld (l6f16h),a		;6f1f
	ld a,004h		;6f22
	ld (l6f17h),a		;6f24
	ld a,(l6f4bh)		;6f27
	sub 002h		;6f2a
	ld (l6f4bh),a		;6f2c
	call sub_7263h		;6f2f
	call sub_7e1dh		;6f32
	ret			;6f35
l6f36h:
	ld a,002h		;6f36
	ld (l6f53h),a		;6f38
	ret			;6f3b
l6f3ch:
	ld a,001h		;6f3c
	ld (l6f53h),a		;6f3e
	ld a,(la6aeh)		;6f41
	ld (la6a9h),a		;6f44
	jp l6f18h		;6f47
	ret			;6f4a
l6f4bh:
	ld h,h			;6f4b
l6f4ch:
	add a,d			;6f4c
l6f4dh:
	ld h,h			;6f4d
	add a,d			;6f4e
	nop			;6f4f
	nop			;6f50
	nop			;6f51
	ld (bc),a		;6f52
l6f53h:
	ld bc,05900h		;6f53
	ld l,a			;6f56
	sbc a,070h		;6f57
	ld b,004h		;6f59
	nop			;6f5b
	ld (ix-001h),b		;6f5c
	nop			;6f5f
	rst 38h			;6f60
	nop			;6f61
	ld (de),a		;6f62
	nop			;6f63
	rst 38h			;6f64
	nop			;6f65
	rst 38h			;6f66
	nop			;6f67
	ret m			;6f68
	nop			;6f69
	nop			;6f6a
	defb 0edh ;next byte illegal after ed	;6f6b
	ld a,a			;6f6c
	nop			;6f6d
	rst 38h			;6f6e
	nop			;6f6f
	ret p			;6f70
	rlca			;6f71
	nop			;6f72
	ld d,d			;6f73
	ccf			;6f74
	add a,b			;6f75
	rst 38h			;6f76
	nop			;6f77
	ret po			;6f78
	ld a,(bc)		;6f79
	nop			;6f7a
	xor c			;6f7b
	rra			;6f7c
	ld b,b			;6f7d
	rst 38h			;6f7e
	nop			;6f7f
	ret po			;6f80
	inc c			;6f81
	nop			;6f82
	ld (bc),a		;6f83
	rrca			;6f84
	and b			;6f85
	rst 38h			;6f86
	nop			;6f87
	ret nz			;6f88
	add hl,de		;6f89
	nop			;6f8a
	pop af			;6f8b
	rlca			;6f8c
	ret nc			;6f8d
	rst 38h			;6f8e
	nop			;6f8f
	ret nz			;6f90
	inc de			;6f91
	nop			;6f92
	ld e,b			;6f93
	rlca			;6f94
	or b			;6f95
	rst 38h			;6f96
	nop			;6f97
	add a,b			;6f98
	ld a,(lad00h)		;6f99
	rlca			;6f9c
	ld d,b			;6f9d
	rst 38h			;6f9e
	nop			;6f9f
	add a,b			;6fa0
	inc sp			;6fa1
	nop			;6fa2
	ld e,h			;6fa3
	inc bc			;6fa4
	ret z			;6fa5
	rst 38h			;6fa6
	nop			;6fa7
	add a,b			;6fa8
	ld hl,(lf900h)		;6fa9
	inc bc			;6fac
	ret z			;6fad
	rst 38h			;6fae
	nop			;6faf
	ret nz			;6fb0
	dec d			;6fb1
	nop			;6fb2
	jp m,l8007h		;6fb3
	rst 38h			;6fb6
	nop			;6fb7
	ret po			;6fb8
	dec bc			;6fb9
	nop			;6fba
	ld sp,hl		;6fbb
	rrca			;6fbc
	ld b,b			;6fbd
	rst 38h			;6fbe
	nop			;6fbf
	ret po			;6fc0
	inc bc			;6fc1
	nop			;6fc2
	push af			;6fc3
	rlca			;6fc4
	ld d,b			;6fc5
	rst 38h			;6fc6
	nop			;6fc7
	ret po			;6fc8
	add hl,bc		;6fc9
	nop			;6fca
	call nz,sub_d803h	;6fcb
	rst 38h			;6fce
	nop			;6fcf
	ret p			;6fd0
	nop			;6fd1
	nop			;6fd2
	ld a,(bc)		;6fd3
	inc bc			;6fd4
	cp h			;6fd5
l6fd6h:
	rst 20h			;6fd6
	nop			;6fd7
	call m,00001h		;6fd8
	ld d,d			;6fdb
	ld bc,lc344h		;6fdc
l6fdfh:
	jr l6fdfh		;6fdf
	nop			;6fe1
	nop			;6fe2
	xor h			;6fe3
	ld bc,0819ch		;6fe4
	inc l			;6fe7
	cp 000h			;6fe8
	nop			;6fea
	xor b			;6feb
	ld bc,l808ch		;6fec
	ld a,(001fch)		;6fef
	nop			;6ff2
	ld (hl),l		;6ff3
	nop			;6ff4
	ld d,080h		;6ff5
	ld h,0f8h		;6ff7
	ld (bc),a		;6ff9
	nop			;6ffa
	add a,b			;6ffb
	nop			;6ffc
	ld hl,(07a00h)		;6ffd
	ret m			;7000
sub_7001h:
	inc bc			;7001
	nop			;7002
	nop			;7003
	nop			;7004
	ld (hl),000h		;7005
sub_7007h:
	ld d,(hl)		;7007
	ret m			;7008
	ld (bc),a		;7009
	nop			;700a
	ld a,(00200h)		;700b
	add a,b			;700e
	ld h,0f8h		;700f
	ld (bc),a		;7011
	nop			;7012
	dec a			;7013
	nop			;7014
	ld l,d			;7015
	ret nz			;7016
	ld a,(de)		;7017
	call m,00001h		;7018
	ld b,000h		;701b
	xor d			;701d
	pop hl			;701e
	inc c			;701f
	ret m			;7020
	ld (bc),a		;7021
	nop			;7022
	ld b,000h		;7023
	xor d			;7025
	ret p			;7026
l7027h:
	ld (bc),a		;7027
	call m,00000h		;7028
	ccf			;702b
	nop			;702c
	ld d,(hl)		;702d
	ret m			;702e
	inc bc			;702f
	ld a,b			;7030
	ld (bc),a		;7031
	nop			;7032
	rst 38h			;7033
	nop			;7034
	ld e,d			;7035
	ret m			;7036
	inc bc			;7037
	ld a,b			;7038
	ld (bc),a		;7039
	nop			;703a
	rst 0			;703b
	nop			;703c
	ld d,(hl)		;703d
	call m,sub_7001h	;703e
	ld b,000h		;7041
l7043h:
	ld c,000h		;7043
	xor d			;7045
	call m,00001h		;7046
	add a,(hl)		;7049
	nop			;704a
	dec e			;704b
	nop			;704c
	or d			;704d
	call m,00001h		;704e
	or h			;7051
	nop			;7052
	adc a,c			;7053
	nop			;7054
	xor d			;7055
	cp 000h			;7056
	nop			;7058
	pop af			;7059
	nop			;705a
	ld b,e			;705b
	nop			;705c
	ld d,d			;705d
	call m,00001h		;705e
	adc a,000h		;7061
	ld bc,l6c01h		;7063
	ret m			;7066
	inc bc			;7067
	nop			;7068
	pop af			;7069
	nop			;706a
	ld bc,04401h		;706b
	call m,00001h		;706e
	jp p,l8500h		;7071
	ld bc,lfc04h		;7074
	ld bc,01e00h		;7077
	nop			;707a
	ld b,b			;707b
	nop			;707c
	or 0feh			;707d
	nop			;707f
	nop			;7080
	ret pe			;7081
	nop			;7082
	djnz l7085h		;7083
l7085h:
	ld a,(bc)		;7085
	rst 38h			;7086
	nop			;7087
	ld b,030h		;7088
	nop			;708a
	add hl,hl		;708b
	ld bc,lff1ch		;708c
	nop			;708f
	add a,h			;7090
	ld sp,01040h		;7091
	ld bc,0ff04h		;7094
	nop			;7097
	add a,010h		;7098
	ret po			;709a
	nop			;709b
	inc bc			;709c
	xor b			;709d
	rst 38h			;709e
	nop			;709f
	rst 0			;70a0
	djnz l7043h		;70a1
	inc b			;70a3
	inc bc			;70a4
	djnz $+1		;70a5
	nop			;70a7
	xor 000h		;70a8
	nop			;70aa
	ld c,(hl)		;70ab
	ld bc,0ff04h		;70ac
	nop			;70af
	call m,00001h		;70b0
	inc b			;70b3
	nop			;70b4
	ld hl,(000ffh)		;70b5
	cp 000h			;70b8
	add a,d			;70ba
	jr nz,l70ceh		;70bb
	add a,h			;70bd
	rst 38h			;70be
	nop			;70bf
	rst 38h			;70c0
	nop			;70c1
	rlca			;70c2
	ld d,b			;70c3
	ld a,e			;70c4
	nop			;70c5
	rst 38h			;70c6
	nop			;70c7
	rst 38h			;70c8
	nop			;70c9
	adc a,a			;70ca
	jr nz,$+1		;70cb
	nop			;70cd
l70ceh:
	rst 38h			;70ce
	nop			;70cf
	rst 38h			;70d0
	nop			;70d1
	rst 18h			;70d2
	nop			;70d3
	rst 38h			;70d4
	nop			;70d5
	rst 38h			;70d6
	nop			;70d7
	rst 38h			;70d8
	nop			;70d9
	rst 38h			;70da
	nop			;70db
	rst 38h			;70dc
	nop			;70dd
	ld b,004h		;70de
	nop			;70e0
	ld h,d			;70e1
	ld (hl),d		;70e2
	rst 38h			;70e3
	nop			;70e4
	rst 38h			;70e5
	nop			;70e6
	rst 38h			;70e7
	nop			;70e8
	rst 38h			;70e9
	nop			;70ea
	rst 38h			;70eb
	nop			;70ec
	rst 38h			;70ed
	nop			;70ee
	rst 38h			;70ef
	nop			;70f0
	rst 38h			;70f1
	nop			;70f2
	rst 38h			;70f3
	nop			;70f4
	rst 38h			;70f5
	nop			;70f6
	ld (de),a		;70f7
	nop			;70f8
	rst 38h			;70f9
	nop			;70fa
	rst 38h			;70fb
	nop			;70fc
	ret m			;70fd
	nop			;70fe
	nop			;70ff
	defb 0edh ;next byte illegal after ed	;7100
	ld a,a			;7101
	nop			;7102
	rst 38h			;7103
l7104h:
	nop			;7104
	ret p			;7105
	rlca			;7106
	nop			;7107
	ld d,d			;7108
	ccf			;7109
	add a,b			;710a
	rst 38h			;710b
	nop			;710c
	ret po			;710d
	ld a,(bc)		;710e
	nop			;710f
	xor c			;7110
	rra			;7111
	ld b,b			;7112
	rst 38h			;7113
	nop			;7114
	ret po			;7115
	inc c			;7116
	nop			;7117
	ld (bc),a		;7118
	rrca			;7119
	and b			;711a
	rst 38h			;711b
	nop			;711c
	ret nz			;711d
	add hl,de		;711e
	nop			;711f
	pop af			;7120
	rlca			;7121
	ret nc			;7122
	rst 38h			;7123
	nop			;7124
	ret nz			;7125
	inc de			;7126
	nop			;7127
	ret m			;7128
	inc bc			;7129
	cp b			;712a
	rst 38h			;712b
	nop			;712c
	add a,b			;712d
	ld a,(04d00h)		;712e
	inc bc			;7131
	ld e,b			;7132
	rst 38h			;7133
	nop			;7134
	add a,b			;7135
	inc sp			;7136
	nop			;7137
	inc l			;7138
	rlca			;7139
	ret nz			;713a
	rst 38h			;713b
	nop			;713c
	add a,b			;713d
	ld hl,(ld900h)		;713e
	rra			;7141
	ret nz			;7142
	rst 38h			;7143
	nop			;7144
	ret nz			;7145
	dec d			;7146
	nop			;7147
	jp m,l803fh		;7148
	rst 38h			;714b
	nop			;714c
	ret po			;714d
	dec bc			;714e
	nop			;714f
	ld sp,hl		;7150
	rra			;7151
	ld b,b			;7152
	rst 38h			;7153
	nop			;7154
	ret p			;7155
	inc bc			;7156
	nop			;7157
	push af			;7158
	rrca			;7159
	ld h,b			;715a
	rst 38h			;715b
	nop			;715c
	call m,00001h		;715d
	call nz,sub_d007h	;7160
	rst 38h			;7163
	nop			;7164
	cp 000h			;7165
	nop			;7167
	ld a,(bc)		;7168
	rlca			;7169
	or b			;716a
	rst 38h			;716b
	nop			;716c
	call m,00001h		;716d
	ld d,d			;7170
	inc bc			;7171
	ld c,b			;7172
	rst 38h			;7173
	nop			;7174
	cp 000h			;7175
	nop			;7177
	xor h			;7178
	ld bc,lfff4h		;7179
	nop			;717c
	call m,00000h		;717d
	xor c			;7180
	nop			;7181
	ld c,d			;7182
	rst 38h			;7183
l7184h:
	nop			;7184
	ret m			;7185
	inc bc			;7186
	nop			;7187
	ld (bc),a		;7188
	nop			;7189
	ld h,0ffh		;718a
	nop			;718c
	ret m			;718d
	ld (bc),a		;718e
	nop			;718f
	ld e,000h		;7190
	ld (000ffh),hl		;7192
	ret m			;7195
	ld (bc),a		;7196
	nop			;7197
	ccf			;7198
	nop			;7199
	ld (bc),a		;719a
	rst 38h			;719b
	nop			;719c
	call m,00001h		;719d
	ld (hl),e		;71a0
	nop			;71a1
	ld c,d			;71a2
	rst 38h			;71a3
	nop			;71a4
	ret m			;71a5
	ld (bc),a		;71a6
	nop			;71a7
	ld h,a			;71a8
	nop			;71a9
	xor d			;71aa
	rst 38h			;71ab
	nop			;71ac
	ret pe			;71ad
	nop			;71ae
	nop			;71af
	rrca			;71b0
	nop			;71b1
	ld d,(hl)		;71b2
	rst 38h			;71b3
	nop			;71b4
	ret nz			;71b5
	ld d,000h		;71b6
	inc e			;71b8
	nop			;71b9
	cp d			;71ba
	rst 38h			;71bb
	nop			;71bc
	add a,b			;71bd
	ld a,(01800h)		;71be
	nop			;71c1
	ld d,(hl)		;71c2
	rst 38h			;71c3
	nop			;71c4
	nop			;71c5
	ld l,d			;71c6
	nop			;71c7
	nop			;71c8
	nop			;71c9
	ld hl,(000feh)		;71ca
	nop			;71cd
	jp m,00400h		;71ce
	nop			;71d1
	ld (000feh),a		;71d2
	nop			;71d5
	cp l			;71d6
	nop			;71d7
	add a,c			;71d8
	nop			;71d9
	ld hl,(000ffh)		;71da
	nop			;71dd
	ld e,l			;71de
	nop			;71df
	ld c,b			;71e0
	nop			;71e1
	ld d,d			;71e2
	rst 38h			;71e3
	nop			;71e4
	nop			;71e5
	ld a,(l8000h)		;71e6
	ld bc,lfe6ch		;71e9
	nop			;71ec
	nop			;71ed
	push de			;71ee
	nop			;71ef
	nop			;71f0
	ld bc,lfc44h		;71f1
	ld bc,l8e20h		;71f4
	nop			;71f7
	and l			;71f8
	ld bc,lfc04h		;71f9
	ld bc,00270h		;71fc
	nop			;71ff
	ld b,b			;7200
	nop			;7201
	or (hl)			;7202
	ret m			;7203
	inc bc			;7204
	ld a,b			;7205
	nop			;7206
	nop			;7207
	djnz l720ah		;7208
l720ah:
	ld c,d			;720a
	ret m			;720b
	inc bc			;720c
	ld a,(hl)		;720d
	nop			;720e
	nop			;720f
	add hl,hl		;7210
	ld bc,le014h		;7211
	ld b,0fch		;7214
	ld bc,01000h		;7216
	ld bc,lc104h		;7219
	inc e			;721c
	cp 000h			;721d
	nop			;721f
	inc b			;7220
	inc bc			;7221
	sub b			;7222
	add a,b			;7223
	ld (hl),0ffh		;7224
	nop			;7226
	nop			;7227
	ld c,(hl)		;7228
	ld l,a			;7229
	nop			;722a
	add a,b			;722b
	ld hl,(000ffh)		;722c
	sub c			;722f
	inc b			;7230
	rst 38h			;7231
	nop			;7232
	nop			;7233
	ld b,(hl)		;7234
	rst 38h			;7235
	nop			;7236
	in a,(000h)		;7237
	ld a,a			;7239
	nop			;723a
	nop			;723b
	ld (hl),d		;723c
	rst 38h			;723d
	nop			;723e
	adc a,(hl)		;723f
	jr nz,$+65		;7240
	add a,b			;7242
	nop			;7243
	ld e,(hl)		;7244
	rst 38h			;7245
	nop			;7246
	rlca			;7247
	ld d,b			;7248
	ld a,a			;7249
	nop			;724a
	ld bc,lff4ch		;724b
	nop			;724e
	adc a,a			;724f
	jr nz,$+1		;7250
	nop			;7252
	add a,e			;7253
	jr nc,$+1		;7254
	nop			;7256
	rst 18h			;7257
	nop			;7258
	rst 38h			;7259
	nop			;725a
	rst 8			;725b
	nop			;725c
	rst 38h			;725d
	nop			;725e
	rst 38h			;725f
	nop			;7260
	rst 38h			;7261
	nop			;7262
sub_7263h:
	ld hl,lf6feh		;7263
	ld ix,0a6e7h		;7266
	ld b,(ix+000h)		;726a
	dec ix			;726d
l726fh:
	push bc			;726f
	inc ix			;7270
	inc ix			;7272
	ld d,(ix+001h)		;7274
	ld e,(ix+000h)		;7277
	push ix			;727a
	push de			;727c
	pop ix			;727d
	push de			;727f
	pop iy			;7280
	call sub_728bh		;7282
	pop ix			;7285
	pop bc			;7287
	djnz l726fh		;7288
	ret			;728a
sub_728bh:
	ld b,(ix+008h)		;728b
	ld c,008h		;728e
l7290h:
	inc ix			;7290
	dec c			;7292
	jr nz,l7290h		;7293
l7295h:
	inc ix			;7295
	inc ix			;7297
	djnz l7295h		;7299
	ld e,(ix+000h)		;729b
	ld d,(ix+001h)		;729e
	push de			;72a1
	pop ix			;72a2
	ld d,(iy+002h)		;72a4
	ld a,000h		;72a7
	ld b,003h		;72a9
l72abh:
	and a			;72ab
	rr d			;72ac
	rr a			;72ae
	djnz l72abh		;72b0
	ld b,005h		;72b2
l72b4h:
	and a			;72b4
	rr a			;72b5
	djnz l72b4h		;72b7
	ld c,a			;72b9
	ld a,d			;72ba
	ld (iy+004h),a		;72bb
	ld e,(iy+003h)		;72be
	ld a,000h		;72c1
	ld b,003h		;72c3
l72c5h:
	and a			;72c5
	rr e			;72c6
	rr a			;72c8
	djnz l72c5h		;72ca
	ld a,e			;72cc
	ld (iy+005h),a		;72cd
	ld b,(ix+000h)		;72d0
	ld a,c			;72d3
	cp 000h			;72d4
	call nz,sub_72f9h	;72d6
	push de			;72d9
l72dah:
	push bc			;72da
	push de			;72db
	push hl			;72dc
	call sub_751bh		;72dd
	ex de,hl		;72e0
	pop hl			;72e1
	ld b,008h		;72e2
l72e4h:
	push bc			;72e4
	push de			;72e5
	ld b,000h		;72e6
	ld c,(ix+001h)		;72e8
	ldir			;72eb
	pop de			;72ed
	pop bc			;72ee
	inc d			;72ef
	djnz l72e4h		;72f0
	pop de			;72f2
	pop bc			;72f3
	inc d			;72f4
	djnz l72dah		;72f5
	pop de			;72f7
	ret			;72f8
sub_72f9h:
	inc b			;72f9
	ret			;72fa
sub_72fbh:
	ld hl,lf6feh		;72fb
	ld ix,0a6e7h		;72fe
	ld b,(ix+000h)		;7302
	dec ix			;7305
l7307h:
	push bc			;7307
	inc ix			;7308
	inc ix			;730a
	ld d,(ix+001h)		;730c
	ld e,(ix+000h)		;730f
	push ix			;7312
	push de			;7314
	pop ix			;7315
	push de			;7317
	pop iy			;7318
	call sub_7323h		;731a
	pop ix			;731d
	pop bc			;731f
	djnz l7307h		;7320
	ret			;7322
sub_7323h:
	ld b,(ix+008h)		;7323
	ld c,008h		;7326
l7328h:
	inc ix			;7328
	dec c			;732a
	jr nz,l7328h		;732b
l732dh:
	inc ix			;732d
	inc ix			;732f
	djnz l732dh		;7331
	ld e,(ix+000h)		;7333
	ld d,(ix+001h)		;7336
	push de			;7339
	pop ix			;733a
	ld d,(iy+000h)		;733c
	ld a,000h		;733f
	ld b,003h		;7341
l7343h:
	and a			;7343
	rr d			;7344
	rr a			;7346
	djnz l7343h		;7348
	ld b,005h		;734a
l734ch:
	and a			;734c
	rr a			;734d
	djnz l734ch		;734f
	ld c,a			;7351
	ld a,d			;7352
	ld (iy+004h),a		;7353
	ld e,(iy+001h)		;7356
	ld a,000h		;7359
	ld b,003h		;735b
l735dh:
	and a			;735d
	rr e			;735e
	rr a			;7360
	djnz l735dh		;7362
	ld a,e			;7364
	ld (iy+005h),a		;7365
	ld b,(ix+000h)		;7368
	ld a,c			;736b
	cp 000h			;736c
	call nz,sub_72f9h	;736e
	push de			;7371
l7372h:
	push bc			;7372
	push de			;7373
	push hl			;7374
	call sub_751bh		;7375
	ex de,hl		;7378
	pop hl			;7379
	ld b,008h		;737a
l737ch:
	push bc			;737c
	push de			;737d
	ld c,(ix+001h)		;737e
	ld b,000h		;7381
	ex de,hl		;7383
	ldir			;7384
	ex de,hl		;7386
	pop de			;7387
	pop bc			;7388
	inc d			;7389
	djnz l737ch		;738a
	pop de			;738c
	pop bc			;738d
	inc d			;738e
	djnz l7372h		;738f
	pop de			;7391
	ret			;7392
sub_7393h:
	ld ix,0a6e7h		;7393
	ld b,(ix+000h)		;7397
	dec ix			;739a
l739ch:
	push bc			;739c
	inc ix			;739d
	inc ix			;739f
	ld d,(ix+001h)		;73a1
	ld e,(ix+000h)		;73a4
	push ix			;73a7
	push de			;73a9
	pop ix			;73aa
	call sub_73b5h		;73ac
	pop ix			;73af
	pop bc			;73b1
	djnz l739ch		;73b2
	ret			;73b4
sub_73b5h:
	push ix			;73b5
	ld b,(ix+008h)		;73b7
	push ix			;73ba
	pop iy			;73bc
	inc iy			;73be
	inc iy			;73c0
	inc iy			;73c2
	inc iy			;73c4
	inc iy			;73c6
	inc iy			;73c8
	inc iy			;73ca
	inc iy			;73cc
l73ceh:
	inc iy			;73ce
	inc iy			;73d0
	djnz l73ceh		;73d2
	ld l,(iy+000h)		;73d4
	ld h,(iy+001h)		;73d7
	push hl			;73da
	pop iy			;73db
	push iy			;73dd
	ld d,(ix+000h)		;73df
	ld (ix+002h),d		;73e2
	ld a,000h		;73e5
	ld b,003h		;73e7
l73e9h:
	and a			;73e9
	rr d			;73ea
	rr a			;73ec
	djnz l73e9h		;73ee
	ld b,005h		;73f0
l73f2h:
	and a			;73f2
	rr a			;73f3
	djnz l73f2h		;73f5
	ld (l7555h),a		;73f7
	ld (l7557h),a		;73fa
	ld (l74d4h),a		;73fd
	ld a,d			;7400
	ld (l744fh),a		;7401
	ld e,(ix+001h)		;7404
	ld (ix+003h),e		;7407
	ld a,000h		;740a
	ld b,003h		;740c
l740eh:
	and a			;740e
	rr e			;740f
	rr a			;7411
	djnz l740eh		;7413
	ld b,005h		;7415
l7417h:
	and a			;7417
	rr a			;7418
	djnz l7417h		;741a
	ld (l7556h),a		;741c
	ld a,e			;741f
	ld (l7450h),a		;7420
	ld b,(iy+002h)		;7423
	ld a,(l7556h)		;7426
	cp b			;7429
	jp z,l7439h		;742a
	jp p,l7447h		;742d
	ld h,a			;7430
	ld a,b			;7431
	ld b,h			;7432
	sub b			;7433
	ld b,a			;7434
	inc b			;7435
	call sub_7498h		;7436
l7439h:
	ld a,(l7556h)		;7439
	ld (iy+002h),a		;743c
	call sub_74dbh		;743f
	pop iy			;7442
	pop ix			;7444
	ret			;7446
l7447h:
	sub b			;7447
	ld b,a			;7448
	call sub_7451h		;7449
	jp l7439h		;744c
l744fh:
	nop			;744f
l7450h:
	nop			;7450
sub_7451h:
	ld b,001h		;7451
	push de			;7453
sub_7454h:
	push iy			;7454
	push ix			;7456
	push iy			;7458
	pop ix			;745a
	ld de,00005h		;745c
	add iy,de		;745f
l7461h:
	push bc			;7461
	push iy			;7462
	pop hl			;7464
	ld b,002h		;7465
l7467h:
	ld d,b			;7467
	push bc			;7468
	push hl			;7469
	ld b,(ix+000h)		;746a
	and a			;746d
	rl b			;746e
	rl b			;7470
	rl b			;7472
l7474h:
	push bc			;7474
	ld b,(ix+001h)		;7475
	ld a,d			;7478
	cp 002h			;7479
	call z,sub_74d5h	;747b
	call nz,sub_74d8h	;747e
l7481h:
	rrd			;7481
	inc hl			;7483
	inc hl			;7484
	djnz l7481h		;7485
	pop bc			;7487
	djnz l7474h		;7488
	pop hl			;748a
	pop bc			;748b
	inc hl			;748c
	djnz l7467h		;748d
	pop bc			;748f
	djnz l7461h		;7490
	pop ix			;7492
	pop iy			;7494
	pop de			;7496
	ret			;7497
sub_7498h:
	ld b,001h		;7498
	push de			;749a
	ld h,(iy+004h)		;749b
	ld l,(iy+003h)		;749e
l74a1h:
	push bc			;74a1
	push hl			;74a2
	ld b,002h		;74a3
l74a5h:
	ld d,b			;74a5
	push bc			;74a6
	push hl			;74a7
	ld b,(iy+000h)		;74a8
	and a			;74ab
	rl b			;74ac
	rl b			;74ae
	rl b			;74b0
l74b2h:
	push bc			;74b2
	ld b,(iy+001h)		;74b3
	ld a,d			;74b6
	cp 001h			;74b7
	call z,sub_74d5h	;74b9
	call nz,sub_74d8h	;74bc
l74bfh:
	rld			;74bf
	dec hl			;74c1
	dec hl			;74c2
	djnz l74bfh		;74c3
	pop bc			;74c5
	djnz l74b2h		;74c6
	pop hl			;74c8
	pop bc			;74c9
	dec hl			;74ca
	djnz l74a5h		;74cb
	pop hl			;74cd
	pop bc			;74ce
	djnz l74a1h		;74cf
	pop de			;74d1
	ret			;74d2
	nop			;74d3
l74d4h:
	nop			;74d4
sub_74d5h:
	ld a,0ffh		;74d5
	ret			;74d7
sub_74d8h:
	ld a,000h		;74d8
	ret			;74da
sub_74dbh:
	ld b,(iy+000h)		;74db
	push de			;74de
	ld c,(iy+001h)		;74df
	push bc			;74e2
	ld de,00005h		;74e3
	add iy,de		;74e6
	pop bc			;74e8
	pop de			;74e9
l74eah:
	push bc			;74ea
	push de			;74eb
	call sub_751bh		;74ec
	ld b,008h		;74ef
	call sub_752ch		;74f1
l74f4h:
	push bc			;74f4
	push hl			;74f5
	ld b,c			;74f6
l74f7h:
	ld a,(iy+000h)		;74f7
	and (hl)		;74fa
	inc iy			;74fb
	or (iy+000h)		;74fd
	ld (hl),a		;7500
	inc iy			;7501
	inc hl			;7503
	inc ix			;7504
	djnz l74f7h		;7506
	pop hl			;7508
	pop bc			;7509
	inc h			;750a
	inc d			;750b
	djnz l74f4h		;750c
	pop de			;750e
	inc d			;750f
	pop bc			;7510
	djnz l74eah		;7511
	ld a,(l7557h)		;7513
	cp 000h			;7516
	jr nz,l7542h		;7518
	ret			;751a
sub_751bh:
	push bc			;751b
	push de			;751c
	pop bc			;751d
	call sub_7558h		;751e
	ld a,h			;7521
	cp 000h			;7522
	jr z,l752ah		;7524
	ld de,la6feh		;7526
	add hl,de		;7529
l752ah:
	pop bc			;752a
	ret			;752b
sub_752ch:
	ld a,(l7555h)		;752c
	cp 000h			;752f
	ret z			;7531
	ld b,a			;7532
l7533h:
	inc d			;7533
	inc h			;7534
	djnz l7533h		;7535
	ld b,a			;7537
	ld a,008h		;7538
	sub b			;753a
	ld b,a			;753b
	ld a,000h		;753c
	ld (l7555h),a		;753e
	ret			;7541
l7542h:
	ld b,001h		;7542
	push bc			;7544
	push de			;7545
	call sub_751bh		;7546
	ld a,(l7557h)		;7549
	ld b,a			;754c
	ld a,000h		;754d
	ld (l7557h),a		;754f
	jp l74f4h		;7552
l7555h:
	nop			;7555
l7556h:
	nop			;7556
l7557h:
	nop			;7557
sub_7558h:
	ld a,b			;7558
	sbc a,008h		;7559
	jr c,l7576h		;755b
	ld a,b			;755d
	sbc a,018h		;755e
	jr nc,l7576h		;7560
	ld a,b			;7562
	sub 008h		;7563
	ld b,a			;7565
	ld h,040h		;7566
	ld a,b			;7568
	and 018h		;7569
	add a,h			;756b
	ld h,a			;756c
	ld a,b			;756d
	and 007h		;756e
	rrca			;7570
	rrca			;7571
	rrca			;7572
	add a,c			;7573
	ld l,a			;7574
	ret			;7575
l7576h:
	ld hl,00000h		;7576
	ret			;7579
sub_757ah:
	ld hl,le6feh		;757a
	ld de,04000h		;757d
	exx			;7580
	ld b,080h		;7581
l7583h:
	exx			;7583
	ldi			;7584
	ldi			;7586
	ldi			;7588
	ldi			;758a
	ldi			;758c
	ldi			;758e
	ldi			;7590
	ldi			;7592
	ldi			;7594
	ldi			;7596
	ldi			;7598
	ldi			;759a
	ldi			;759c
	ldi			;759e
	ldi			;75a0
	ldi			;75a2
	ldi			;75a4
	ldi			;75a6
	ldi			;75a8
	ldi			;75aa
	ldi			;75ac
	ldi			;75ae
	ldi			;75b0
	ldi			;75b2
	ldi			;75b4
	ldi			;75b6
	ldi			;75b8
	ldi			;75ba
	ldi			;75bc
	ldi			;75be
	ldi			;75c0
	ldi			;75c2
	exx			;75c4
	djnz l7583h		;75c5
	exx			;75c7
	ret			;75c8
sub_75c9h:
	ld b,(ix+007h)		;75c9
l75cch:
	push bc			;75cc
	push ix			;75cd
	call sub_768bh		;75cf
	ld a,(ix+002h)		;75d2
	cp 000h			;75d5
	jr z,l7602h		;75d7
	ld a,000h		;75d9
	ld (ix+002h),a		;75db
l75deh:
	push ix			;75de
	pop hl			;75e0
	ld de,00005h		;75e1
	add hl,de		;75e4
	call sub_761dh		;75e5
	pop ix			;75e8
	pop bc			;75ea
	djnz l75cch		;75eb
	ret			;75ed
sub_75eeh:
	push ix			;75ee
	ld a,(ix+006h)		;75f0
	cp 000h			;75f3
	jr z,l75fch		;75f5
	call sub_75c9h		;75f7
	ld a,000h		;75fa
l75fch:
	pop ix			;75fc
	ld (ix+006h),a		;75fe
	ret			;7601
l7602h:
	ld a,004h		;7602
	ld (ix+002h),a		;7604
	jr l75deh		;7607
sub_7609h:
	push ix			;7609
	ld a,(ix+006h)		;760b
	cp 001h			;760e
	jr z,l7617h		;7610
	call sub_75c9h		;7612
	ld a,001h		;7615
l7617h:
	pop ix			;7617
	ld (ix+006h),a		;7619
	ret			;761c
sub_761dh:
	ld b,(ix+000h)		;761d
	and a			;7620
	rl b			;7621
	rl b			;7623
	rl b			;7625
l7627h:
	ld c,(ix+001h)		;7627
	and a			;762a
	rl c			;762b
	ld de,l76a3h		;762d
	push hl			;7630
	push bc			;7631
	ld b,000h		;7632
	ldir			;7634
	pop bc			;7636
	pop hl			;7637
	call sub_763fh		;7638
	dec hl			;763b
	djnz l7627h		;763c
	ret			;763e
sub_763fh:
	push hl			;763f
	push de			;7640
	dec de			;7641
	dec de			;7642
	ld c,(ix+001h)		;7643
l7646h:
	push hl			;7646
	ld a,(de)		;7647
	ld h,0ffh		;7648
	ld l,a			;764a
	ld a,(hl)		;764b
	pop hl			;764c
	ld (hl),a		;764d
	inc hl			;764e
	inc hl			;764f
	dec de			;7650
	dec de			;7651
	dec c			;7652
	jp nz,l7646h		;7653
	pop de			;7656
	pop hl			;7657
	dec de			;7658
	inc hl			;7659
	ld c,(ix+001h)		;765a
l765dh:
	push hl			;765d
	ld a,(de)		;765e
	ld h,0ffh		;765f
	ld l,a			;7661
	ld a,(hl)		;7662
	pop hl			;7663
	ld (hl),a		;7664
	inc hl			;7665
	inc hl			;7666
	dec de			;7667
	dec de			;7668
	dec c			;7669
	jp nz,l765dh		;766a
	ret			;766d
sub_766eh:
	ld c,000h		;766e
	ld h,0ffh		;7670
	ld l,000h		;7672
	ld b,0ffh		;7674
l7676h:
	push bc			;7676
	ld b,008h		;7677
	and a			;7679
	ld a,c			;767a
l767bh:
	sra a			;767b
	rl c			;767d
	djnz l767bh		;767f
	ld (hl),c		;7681
	inc hl			;7682
	pop bc			;7683
	inc c			;7684
	djnz l7676h		;7685
	ld a,0ffh		;7687
	ld (hl),a		;7689
	ret			;768a
sub_768bh:
	ld c,008h		;768b
l768dh:
	inc ix			;768d
	dec c			;768f
	jp nz,l768dh		;7690
l7693h:
	inc ix			;7693
	inc ix			;7695
	djnz l7693h		;7697
	ld e,(ix+000h)		;7699
	ld d,(ix+001h)		;769c
	push de			;769f
	pop ix			;76a0
	ret			;76a2
l76a3h:
	nop			;76a3
	nop			;76a4
	nop			;76a5
	nop			;76a6
	nop			;76a7
	nop			;76a8
	nop			;76a9
	nop			;76aa
	nop			;76ab
	nop			;76ac
	nop			;76ad
	nop			;76ae
	nop			;76af
	nop			;76b0
	nop			;76b1
	nop			;76b2
	nop			;76b3
	nop			;76b4
	nop			;76b5
	nop			;76b6
	nop			;76b7
	nop			;76b8
	nop			;76b9
	nop			;76ba
	nop			;76bb
	nop			;76bc
	nop			;76bd
	nop			;76be
	nop			;76bf
	nop			;76c0
	nop			;76c1
	nop			;76c2
	nop			;76c3
sub_76c4h:
	ld d,a			;76c4
	ld a,(06a8ah)		;76c5
	cp 000h			;76c8
	jp nz,l76dch		;76ca
	ld a,d			;76cd
	ld l,a			;76ce
	ld h,000h		;76cf
	ld de,l76e1h		;76d1
	add hl,hl		;76d4
l76d5h:
	add hl,de		;76d5
	ld a,(hl)		;76d6
	inc hl			;76d7
	in a,(0feh)		;76d8
	and (hl)		;76da
l76dbh:
	ret			;76db
l76dch:
	in a,(01fh)		;76dc
	and d			;76de
l76dfh:
	cp d			;76df
	ret			;76e0
l76e1h:
	rst 30h			;76e1
	ld bc,002f7h		;76e2
	rst 30h			;76e5
	inc b			;76e6
	rst 30h			;76e7
	ex af,af'		;76e8
	rst 30h			;76e9
	djnz l76dbh		;76ea
	djnz $-15		;76ec
	ex af,af'		;76ee
	rst 28h			;76ef
	inc b			;76f0
	rst 28h			;76f1
	ld (bc),a		;76f2
	rst 28h			;76f3
	ld bc,001fbh		;76f4
	ei			;76f7
	ld (bc),a		;76f8
	ei			;76f9
	inc b			;76fa
	ei			;76fb
	ex af,af'		;76fc
	ei			;76fd
	djnz l76dfh		;76fe
	djnz l76e1h		;7700
	ex af,af'		;7702
	rst 18h			;7703
	inc b			;7704
	rst 18h			;7705
	ld (bc),a		;7706
	rst 18h			;7707
	ld bc,001fdh		;7708
	defb 0fdh,002h,0fdh ;illegal sequence	;770b
	inc b			;770e
	defb 0fdh,008h,0fdh ;illegal sequence	;770f
	djnz $-63		;7712
	djnz l76d5h		;7714
	ex af,af'		;7716
	cp a			;7717
	inc b			;7718
	cp a			;7719
	ld (bc),a		;771a
	cp a			;771b
	ld bc,001feh		;771c
	cp 002h			;771f
	cp 004h			;7721
	cp 008h			;7723
	cp 010h			;7725
	ld a,a			;7727
	djnz $+129		;7728
	ex af,af'		;772a
	ld a,a			;772b
	inc b			;772c
	ld a,a			;772d
	ld (bc),a		;772e
	ld a,a			;772f
	ld bc,lcd00h		;7730
	ld l,(hl)		;7733
	ld (hl),a		;7734
	ret z			;7735
	ld ix,05d2ah		;7736
	ld a,(ix+001h)		;773a
	add a,004h		;773d
	ld (ix+001h),a		;773f
	ld ix,05d3eh		;7742
	ld a,(ix+001h)		;7746
	add a,004h		;7749
	ld (ix+001h),a		;774b
	call sub_7a72h		;774e
	jp c,l7755h		;7751
	ret			;7754
l7755h:
	ld ix,05d2ah		;7755
	ld a,(ix+001h)		;7759
	sub 004h		;775c
	ld (ix+001h),a		;775e
	ld ix,05d3eh		;7761
	ld a,(ix+001h)		;7765
	sub 004h		;7768
	ld (ix+001h),a		;776a
	ret			;776d
sub_776eh:
	ld ix,05d3eh		;776e
	ld a,(ix+008h)		;7772
	cp 001h			;7775
	ret z			;7777
	ld ix,05d2ah		;7778
	ld a,(ix+008h)		;777c
	cp 003h			;777f
	jp p,l778dh		;7781
	cp 002h			;7784
	jr z,l778bh		;7786
	inc a			;7788
	jr l778dh		;7789
l778bh:
	ld a,001h		;778b
l778dh:
	ld (ix+008h),a		;778d
	ld ix,05d3eh		;7790
	ld a,(l77c7h)		;7794
	cp 000h			;7797
	jr nz,l77abh		;7799
	ld a,(ix+008h)		;779b
	cp 005h			;779e
	jr z,l77beh		;77a0
	inc a			;77a2
l77a3h:
	ld (ix+008h),a		;77a3
	ld a,002h		;77a6
	cp 000h			;77a8
	ret			;77aa
l77abh:
	ld a,(ix+008h)		;77ab
	cp 002h			;77ae
	jr z,l77b5h		;77b0
	dec a			;77b2
	jr l77a3h		;77b3
l77b5h:
	ld a,000h		;77b5
	ld (l77c7h),a		;77b7
	ld a,003h		;77ba
	jr l77a3h		;77bc
l77beh:
	ld a,001h		;77be
	ld (l77c7h),a		;77c0
	ld a,004h		;77c3
	jr l77a3h		;77c5
l77c7h:
	nop			;77c7
sub_77c8h:
	ld a,(07731h)		;77c8
	cp 000h			;77cb
	ret nz			;77cd
	ld ix,05d3eh		;77ce
	ld a,(ix+008h)		;77d2
	cp 001h			;77d5
	ret z			;77d7
	ld a,(ix+000h)		;77d8
	add a,004h		;77db
	ld (ix+000h),a		;77dd
	call sub_7a72h		;77e0
	jp nc,l7804h		;77e3
	ld a,001h		;77e6
	ld (ix+008h),a		;77e8
	ld ix,05d2ah		;77eb
	ld a,(ix+000h)		;77ef
	add a,010h		;77f2
	ld (ix+000h),a		;77f4
	ld ix,05d3eh		;77f7
	ld a,(ix+000h)		;77fb
	add a,00ch		;77fe
l7800h:
	ld (ix+000h),a		;7800
	ret			;7803
l7804h:
	ld a,(ix+000h)		;7804
	sub 004h		;7807
	ld (ix+000h),a		;7809
	ret			;780c
sub_780dh:
	ld ix,05d3eh		;780d
	ld a,(ix+008h)		;7811
	cp 001h			;7814
	ret nz			;7816
	ld a,002h		;7817
	ld (ix+008h),a		;7819
	ld a,(ix+000h)		;781c
	sub 010h		;781f
	ld (ix+000h),a		;7821
	ld ix,05d2ah		;7824
	ld a,(ix+000h)		;7828
	sub 010h		;782b
	ld (ix+000h),a		;782d
	ret			;7830
l7831h:
	nop			;7831
l7832h:
	nop			;7832
sub_7833h:
	ld a,(l7831h)		;7833
	cp 001h			;7836
	ret nz			;7838
	call sub_7b1fh		;7839
	ld ix,05d2ah		;783c
	ld a,(ix+008h)		;7840
	cp 003h			;7843
	jp m,l78c9h		;7845
	ld a,(l7832h)		;7848
	cp 000h			;784b
	jr z,l7860h		;784d
	ld a,(ix+008h)		;784f
	inc a			;7852
	cp 006h			;7853
	jr z,l78b6h		;7855
	ld (ix+008h),a		;7857
	cp 005h			;785a
	call z,sub_7878h	;785c
	ret			;785f
l7860h:
	ld a,(ix+008h)		;7860
	dec a			;7863
	cp 002h			;7864
	jr z,l786ch		;7866
	ld (ix+008h),a		;7868
	ret			;786b
l786ch:
	ld (ix+008h),a		;786c
	ld a,000h		;786f
	ld (l7831h),a		;7871
	ld (l7a71h),a		;7874
	ret			;7877
sub_7878h:
	ld a,(ix+006h)		;7878
	cp 000h			;787b
	jr z,l788dh		;787d
	ld a,(ix+001h)		;787f
	sub 008h		;7882
	ld (ix+001h),a		;7884
l7887h:
	ld a,001h		;7887
	ld (l7897h),a		;7889
	ret			;788c
l788dh:
	ld a,(ix+001h)		;788d
	add a,008h		;7890
	ld (ix+001h),a		;7892
	jr l7887h		;7895
l7897h:
	nop			;7897
sub_7898h:
	ld a,000h		;7898
	ld (l7897h),a		;789a
	ld a,(ix+006h)		;789d
	cp 000h			;78a0
	jr z,l78adh		;78a2
	ld a,(ix+001h)		;78a4
	add a,008h		;78a7
	ld (ix+001h),a		;78a9
	ret			;78ac
l78adh:
	ld a,(ix+001h)		;78ad
	sub 008h		;78b0
	ld (ix+001h),a		;78b2
	ret			;78b5
l78b6h:
	sub 002h		;78b6
	ld (ix+008h),a		;78b8
	ld a,000h		;78bb
	ld (l7832h),a		;78bd
	ld a,(l7897h)		;78c0
	cp 001h			;78c3
	call z,sub_7898h	;78c5
	ret			;78c8
l78c9h:
	ld a,003h		;78c9
	ld (ix+008h),a		;78cb
	ld a,001h		;78ce
	ld (l7832h),a		;78d0
	ret			;78d3
sub_78d4h:
	call sub_776eh		;78d4
	ret z			;78d7
	ld ix,05d2ah		;78d8
	ld a,(ix+001h)		;78dc
	sub 004h		;78df
	ld (ix+001h),a		;78e1
	ld ix,05d3eh		;78e4
	ld a,(ix+001h)		;78e8
	sub 004h		;78eb
	ld (ix+001h),a		;78ed
	call sub_7a72h		;78f0
	jp c,l78f7h		;78f3
	ret			;78f6
l78f7h:
	ld ix,05d2ah		;78f7
	ld a,(ix+001h)		;78fb
	add a,004h		;78fe
	ld (ix+001h),a		;7900
	ld ix,05d3eh		;7903
	ld a,(ix+001h)		;7907
	add a,004h		;790a
	ld (ix+001h),a		;790c
	ret			;790f
sub_7910h:
	ld a,(07731h)		;7910
	cp 001h			;7913
	ret nz			;7915
	ld a,(l799fh)		;7916
	cp 001h			;7919
	jr z,l7949h		;791b
	ld a,(l79a0h)		;791d
	cp 00eh			;7920
	call z,sub_780dh	;7922
	ld a,(l79a0h)		;7925
	dec a			;7928
	cp 000h			;7929
	jr z,l798dh		;792b
	ld (l79a0h),a		;792d
	ld ix,05d2ah		;7930
	ld a,(ix+000h)		;7934
	sub 004h		;7937
	ld (ix+000h),a		;7939
	ld ix,05d3eh		;793c
	ld a,(ix+000h)		;7940
	sub 004h		;7943
	ld (ix+000h),a		;7945
	ret			;7948
l7949h:
	ld ix,05d2ah		;7949
	ld a,(ix+000h)		;794d
	add a,004h		;7950
	ld (ix+000h),a		;7952
	ld ix,05d3eh		;7955
	ld a,(ix+000h)		;7959
	add a,004h		;795c
	ld (ix+000h),a		;795e
	call sub_7a72h		;7961
	jp c,l7972h		;7964
	ld ix,05d2ah		;7967
	call sub_7a72h		;796b
	jp c,l7972h		;796e
	ret			;7971
l7972h:
	ld ix,05d2ah		;7972
	ld a,(ix+000h)		;7976
	sub 004h		;7979
	ld (ix+000h),a		;797b
	ld ix,05d3eh		;797e
	ld a,(ix+000h)		;7982
	sub 004h		;7985
	ld (ix+000h),a		;7987
	jp l7993h		;798a
l798dh:
	ld a,001h		;798d
	ld (l799fh),a		;798f
	ret			;7992
l7993h:
	ld a,000h		;7993
	ld (l799fh),a		;7995
	ld (07731h),a		;7998
	call sub_77c8h		;799b
	ret			;799e
l799fh:
	nop			;799f
l79a0h:
	ld c,00eh		;79a0
sub_79a2h:
	ld a,(06a85h)		;79a2
	call sub_76c4h		;79a5
	jr z,l7a05h		;79a8
l79aah:
	ld a,(06a87h)		;79aa
	call sub_76c4h		;79ad
	jp z,l79e3h		;79b0
	ld a,(06a88h)		;79b3
	call sub_76c4h		;79b6
	jp z,l79e8h		;79b9
	ld a,(06a86h)		;79bc
	call sub_76c4h		;79bf
	jp z,l7a51h		;79c2
l79c5h:
	call sub_780dh		;79c5
l79c8h:
	call sub_7833h		;79c8
	ld a,(06a89h)		;79cb
	call sub_76c4h		;79ce
	push af			;79d1
	call z,sub_79edh	;79d2
	pop af			;79d5
	call nz,sub_7a6ah	;79d6
	call sub_7a58h		;79d9
	call sub_7910h		;79dc
	call sub_7a1fh		;79df
	ret			;79e2
l79e3h:
	call 07732h		;79e3
	jr l79c5h		;79e6
l79e8h:
	call sub_78d4h		;79e8
	jr l79c5h		;79eb
sub_79edh:
	ld a,(l7831h)		;79ed
	cp 001h			;79f0
	ret z			;79f2
	call sub_7ad7h		;79f3
	call sub_7ad7h		;79f6
	call sub_7ad7h		;79f9
	ld a,001h		;79fc
	ld (l7a70h),a		;79fe
	ld (l7a71h),a		;7a01
	ret			;7a04
l7a05h:
	ld a,(07731h)		;7a05
	cp 001h			;7a08
	jp z,l79aah		;7a0a
	ld a,00eh		;7a0d
	ld (l79a0h+1),a		;7a0f
	ld (l79a0h),a		;7a12
	call sub_77c8h		;7a15
	ld a,001h		;7a18
	ld (07731h),a		;7a1a
	jr l79c8h		;7a1d
sub_7a1fh:
	ld a,(07731h)		;7a1f
	cp 001h			;7a22
	ret z			;7a24
	ld ix,05d3eh		;7a25
	ld a,(ix+000h)		;7a29
	add a,004h		;7a2c
	ld (ix+000h),a		;7a2e
	call sub_7a72h		;7a31
	jp c,l7a44h		;7a34
	ld ix,05d2ah		;7a37
	ld a,(ix+000h)		;7a3b
	add a,004h		;7a3e
	ld (ix+000h),a		;7a40
	ret			;7a43
l7a44h:
	ld ix,05d3eh		;7a44
	ld a,(ix+000h)		;7a48
	sub 004h		;7a4b
	ld (ix+000h),a		;7a4d
	ret			;7a50
l7a51h:
	call sub_77c8h		;7a51
	jp l79c8h		;7a54
	nop			;7a57
sub_7a58h:
	ld a,(l7a70h)		;7a58
	cp 001h			;7a5b
	ret z			;7a5d
	ld a,(l7a71h)		;7a5e
	cp 000h			;7a61
	ret z			;7a63
	ld a,001h		;7a64
	ld (l7831h),a		;7a66
	ret			;7a69
sub_7a6ah:
	ld a,000h		;7a6a
	ld (l7a70h),a		;7a6c
	ret			;7a6f
l7a70h:
	nop			;7a70
l7a71h:
	nop			;7a71
sub_7a72h:
	ld ix,05d3eh		;7a72
	ld a,(ix+000h)		;7a76
	add a,020h		;7a79
	ld d,a			;7a7b
	ld a,(ix+001h)		;7a7c
	add a,020h		;7a7f
	ld e,a			;7a81
	ld a,(la6c8h)		;7a82
	and 03fh		;7a85
	inc a			;7a87
	ld iy,la6fah		;7a88
l7a8ch:
	inc iy			;7a8c
	inc iy			;7a8e
	dec a			;7a90
	jr nz,l7a8ch		;7a91
	ld h,(iy+001h)		;7a93
	ld l,(iy+000h)		;7a96
	push hl			;7a99
	pop iy			;7a9a
	ld b,(iy+000h)		;7a9c
	inc iy			;7a9f
l7aa1h:
	ld a,(iy+001h)		;7aa1
	add a,(iy+003h)		;7aa4
	ld h,a			;7aa7
	ld a,(ix+001h)		;7aa8
	add a,008h		;7aab
	sbc a,h			;7aad
	jr nc,l7acbh		;7aae
	ld a,e			;7ab0
	sbc a,(iy+001h)		;7ab1
	jr c,l7acbh		;7ab4
	ld a,(iy+000h)		;7ab6
	add a,(iy+002h)		;7ab9
	ld h,a			;7abc
	ld a,(ix+000h)		;7abd
	sbc a,h			;7ac0
	jr nc,l7acbh		;7ac1
	ld a,d			;7ac3
	sbc a,(iy+000h)		;7ac4
	jr c,l7acbh		;7ac7
	scf			;7ac9
	ret			;7aca
l7acbh:
	inc iy			;7acb
	inc iy			;7acd
	inc iy			;7acf
	inc iy			;7ad1
	djnz l7aa1h		;7ad3
	and a			;7ad5
	ret			;7ad6
sub_7ad7h:
	ld hl,05187h		;7ad7
	ld de,00800h		;7ada
	ld b,001h		;7add
	ld c,030h		;7adf
l7ae1h:
	push de			;7ae1
	push bc			;7ae2
	ld de,000eeh		;7ae3
	ld c,006h		;7ae6
l7ae8h:
	ld b,012h		;7ae8
	set 7,(hl)		;7aea
l7aech:
	rr (hl)			;7aec
	inc hl			;7aee
	djnz l7aech		;7aef
	add hl,de		;7af1
	dec c			;7af2
l7af3h:
	jp nz,l7ae8h		;7af3
	pop bc			;7af6
	pop de			;7af7
	and a			;7af8
	sbc hl,de		;7af9
	push bc			;7afb
	ld b,000h		;7afc
	add hl,bc		;7afe
	pop bc			;7aff
l7b00h:
	djnz l7ae1h		;7b00
	ld a,(l7b9ah)		;7b02
	cp 030h			;7b05
	jp z,l7b0fh		;7b07
	inc a			;7b0a
	ld (l7b9ah),a		;7b0b
	ret			;7b0e
l7b0fh:
	ld a,(la6ach)		;7b0f
	cp 003h			;7b12
	ret z			;7b14
	inc a			;7b15
	ld (la6ach),a		;7b16
	ld a,000h		;7b19
	ld (l7b9ah),a		;7b1b
	ret			;7b1e
sub_7b1fh:
	ld a,(la6abh)		;7b1f
	cp 000h			;7b22
	ld (l7b98h),a		;7b24
	cp 001h			;7b27
	jp nz,l7b31h		;7b29
	ld a,006h		;7b2c
	ld (l7b98h),a		;7b2e
l7b31h:
	cp 002h			;7b31
	jp nz,l7b3bh		;7b33
	ld a,00ch		;7b36
	ld (l7b98h),a		;7b38
l7b3bh:
	cp 003h			;7b3b
	jp nz,l7b44h		;7b3d
	ret z			;7b40
	ld (l7b98h),a		;7b41
l7b44h:
	ld hl,05198h		;7b44
	ld de,00800h		;7b47
	ld b,001h		;7b4a
	ld c,020h		;7b4c
l7b4eh:
	push de			;7b4e
	push bc			;7b4f
	ld de,00112h		;7b50
	ld a,(l7b98h)		;7b53
	cp 000h			;7b56
	jp z,l7b60h		;7b58
l7b5bh:
	dec de			;7b5b
	dec a			;7b5c
	jp nz,l7b5bh		;7b5d
l7b60h:
	ld c,006h		;7b60
l7b62h:
	ld b,012h		;7b62
	ld a,(l7b98h)		;7b64
	cp 000h			;7b67
	jp z,l7b71h		;7b69
l7b6ch:
	dec b			;7b6c
	dec a			;7b6d
	jp nz,l7b6ch		;7b6e
l7b71h:
	ld a,r			;7b71
	and (hl)		;7b73
	or a			;7b74
	ld (hl),a		;7b75
	rl (hl)			;7b76
	rl (hl)			;7b78
	dec hl			;7b7a
	djnz l7b71h		;7b7b
	add hl,de		;7b7d
	dec c			;7b7e
	jp nz,l7b62h		;7b7f
	pop bc			;7b82
	pop de			;7b83
	and a			;7b84
	sbc hl,de		;7b85
	push bc			;7b87
	ld b,000h		;7b88
	add hl,bc		;7b8a
	pop bc			;7b8b
	djnz l7b4eh		;7b8c
	ld a,(la6abh)		;7b8e
	ld (la6ach),a		;7b91
	ld (l7b9ah),a		;7b94
	ret			;7b97
l7b98h:
	nop			;7b98
	nop			;7b99
l7b9ah:
	nop			;7b9a
l7b9bh:
	ld a,(la6abh)		;7b9b
	cp 003h			;7b9e
	ret z			;7ba0
	inc a			;7ba1
	ld (la6abh),a		;7ba2
	call sub_7ba9h		;7ba5
	ret			;7ba8
sub_7ba9h:
	ld a,(la6abh)		;7ba9
	ld d,a			;7bac
	add a,a			;7bad
	add a,d			;7bae
	add a,d			;7baf
	add a,d			;7bb0
	add a,d			;7bb1
	ld d,a			;7bb2
	ld hl,05187h		;7bb3
	ld b,006h		;7bb6
	ld a,0ffh		;7bb8
l7bbah:
	push hl			;7bba
	ld c,d			;7bbb
l7bbch:
	ld (hl),a		;7bbc
	inc hl			;7bbd
	dec c			;7bbe
	jr nz,l7bbch		;7bbf
	pop hl			;7bc1
	inc h			;7bc2
	djnz l7bbah		;7bc3
	ret			;7bc5
l7bc6h:
	call sub_a89fh		;7bc6
sub_7bc9h:
	ld a,007h		;7bc9
	call sub_7bd5h		;7bcb
	ret			;7bce
sub_7bcfh:
	ld a,042h		;7bcf
	call sub_7bd5h		;7bd1
	ret			;7bd4
sub_7bd5h:
	ld (05acfh),a		;7bd5
	ld (05ad0h),a		;7bd8
	ld (05aefh),a		;7bdb
	ld (05af0h),a		;7bde
	ret			;7be1
sub_7be2h:
	ld a,(l7bfbh)		;7be2
	dec a			;7be5
	ld (l7bfbh),a		;7be6
	cp 000h			;7be9
	jp z,l7bf2h		;7beb
	call sub_7bcfh		;7bee
	ret			;7bf1
l7bf2h:
	ld a,002h		;7bf2
	ld (l7bfbh),a		;7bf4
	call sub_7bc9h		;7bf7
	ret			;7bfa
l7bfbh:
	ld (bc),a		;7bfb
l7bfch:
	ld a,(la6a2h)		;7bfc
	inc a			;7bff
	ld (la6a2h),a		;7c00
	cp 002h			;7c03
	call z,sub_7c09h	;7c05
	ret			;7c08
sub_7c09h:
	ld a,001h		;7c09
	ld (la6a2h),a		;7c0b
	ld a,000h		;7c0e
	ld (la6a9h),a		;7c10
	ret			;7c13
sub_7c14h:
	ld a,(la6a9h)		;7c14
	cp 000h			;7c17
	ret z			;7c19
	cp 004h			;7c1a
	jp z,l7bfch		;7c1c
	push af			;7c1f
	ld a,000h		;7c20
	ld (la6a9h),a		;7c22
	pop af			;7c25
	cp 003h			;7c26
	jp z,l7b9bh		;7c28
	cp 005h			;7c2b
	jp z,l7bc6h		;7c2d
	ret			;7c30
sub_7c31h:
	ld a,(05d2bh)		;7c31
	sbc a,008h		;7c34
	jp c,l7c57h		;7c36
	ld a,(05d2bh)		;7c39
	sbc a,0c8h		;7c3c
	jp nc,l7c72h		;7c3e
	ret			;7c41
	ld a,000h		;7c42
	call sub_76c4h		;7c44
	ret nz			;7c47
	ld de,01b00h		;7c48
	ld ix,04000h		;7c4b
	ld a,0ffh		;7c4f
	ei			;7c51
	call 004c2h		;7c52
	di			;7c55
	ret			;7c56
l7c57h:
	ld a,(05d32h)		;7c57
	cp 005h			;7c5a
	ret z			;7c5c
	ld a,(la6c8h)		;7c5d
	cp 000h			;7c60
	jp z,l7c9dh		;7c62
	call sub_7ca3h		;7c65
	ld a,(la6c8h)		;7c68
	dec a			;7c6b
	ld (la6c8h),a		;7c6c
	jp la8d7h		;7c6f
l7c72h:
	ld a,(05d32h)		;7c72
	cp 005h			;7c75
	ret z			;7c77
l7c78h:
	ld a,(la6c8h)		;7c78
	cp 00eh			;7c7b
	jp z,sub_7ca3h		;7c7d
	call l7c9dh		;7c80
	ld a,(la6c8h)		;7c83
	inc a			;7c86
	ld (la6c8h),a		;7c87
	jp la8d7h		;7c8a
sub_7c8dh:
	ld hl,05800h		;7c8d
	ld bc,00260h		;7c90
l7c93h:
	ld a,000h		;7c93
	ld (hl),a		;7c95
	inc hl			;7c96
	dec bc			;7c97
	ld a,b			;7c98
	or c			;7c99
	jr nz,l7c93h		;7c9a
	ret			;7c9c
l7c9dh:
	ld a,008h		;7c9d
	call sub_7ca9h		;7c9f
	ret			;7ca2
sub_7ca3h:
	ld a,0c4h		;7ca3
	call sub_7ca9h		;7ca5
	ret			;7ca8
sub_7ca9h:
	ld (05d2bh),a		;7ca9
	ld (05d2dh),a		;7cac
	ld (05d3fh),a		;7caf
	ld (05d41h),a		;7cb2
	ld a,(05d2ah)		;7cb5
	ld (05d2ch),a		;7cb8
	ld a,(05d3eh)		;7cbb
	ld (05d40h),a		;7cbe
	ld hl,(05d52h)		;7cc1
	ld (05d54h),hl		;7cc4
	ld hl,(05d66h)		;7cc7
	ld (05d68h),hl		;7cca
	ld hl,(05d7ah)		;7ccd
	ld (05d7ch),hl		;7cd0
	ld hl,(05d86h)		;7cd3
	ld (05d88h),hl		;7cd6
	ret			;7cd9
sub_7cdah:
	ld hl,lfa86h		;7cda
	ld bc,00260h		;7cdd
l7ce0h:
	ld a,007h		;7ce0
	ld (hl),a		;7ce2
	inc hl			;7ce3
	dec bc			;7ce4
	ld a,b			;7ce5
	or c			;7ce6
	jr nz,l7ce0h		;7ce7
	ld hl,04000h		;7ce9
	ld bc,01000h		;7cec
l7cefh:
	ld a,000h		;7cef
	ld (hl),a		;7cf1
	inc hl			;7cf2
	dec bc			;7cf3
sub_7cf4h:
	ld a,b			;7cf4
	or c			;7cf5
	jr nz,l7cefh		;7cf6
l7cf8h:
	ld b,008h		;7cf8
sub_7cfah:
	ld a,000h		;7cfa
l7cfch:
	push hl			;7cfc
	ld c,060h		;7cfd
l7cffh:
	ld (hl),a		;7cff
	inc hl			;7d00
	dec c			;7d01
	jr nz,l7cffh		;7d02
	pop hl			;7d04
	inc h			;7d05
	djnz l7cfch		;7d06
	ret			;7d08
	ld a,(la6a9h)		;7d09
	cp 002h			;7d0c
	ret nz			;7d0e
	call sub_6dach		;7d0f
	ld hl,05d52h		;7d12
	ld (la6e8h),hl		;7d15
	call sub_6dach		;7d18
	ld hl,05d66h		;7d1b
	ld (la6e8h),hl		;7d1e
	call sub_6dach		;7d21
	ld hl,05d7ah		;7d24
	ld (la6e8h),hl		;7d27
	call sub_6dach		;7d2a
	ld hl,05d86h		;7d2d
	ld (la6e8h),hl		;7d30
	ret			;7d33
sub_7d34h:
	ld hl,lfa86h		;7d34
	ld de,05800h		;7d37
	ld bc,00260h		;7d3a
	ldir			;7d3d
	ld hl,04000h		;7d3f
	ld de,le6feh		;7d42
	ld bc,01000h		;7d45
	ldir			;7d48
	ret			;7d4a
sub_7d4bh:
	ld a,(la6c8h)		;7d4b
	ld c,a			;7d4e
	ld b,000h		;7d4f
	ld hl,la6b4h		;7d51
	add hl,bc		;7d54
	ld a,(hl)		;7d55
	cp 001h			;7d56
	ret			;7d58
sub_7d59h:
	ld b,000h		;7d59
	ld a,(la6c8h)		;7d5b
	ld c,a			;7d5e
	ld hl,la6b4h		;7d5f
	add hl,bc		;7d62
	ld a,001h		;7d63
	ld (hl),a		;7d65
	ret			;7d66
sub_7d67h:
	ld ix,05d2ah		;7d67
	ld d,038h		;7d6b
	ld e,018h		;7d6d
	call sub_7db5h		;7d6f
	ret			;7d72
l7d73h:
	and a			;7d73
	ret			;7d74
sub_7d75h:
	ld a,(l7831h)		;7d75
	cp 001h			;7d78
	jp nz,l7d73h		;7d7a
	ld a,(la6a9h)		;7d7d
	cp 002h			;7d80
	jp z,l7d91h		;7d82
	ld ix,05d2ah		;7d85
	ld d,020h		;7d89
	ld e,038h		;7d8b
	call sub_7db5h		;7d8d
	ret			;7d90
l7d91h:
	ld ix,05d52h		;7d91
	ld d,020h		;7d95
	ld e,038h		;7d97
	call sub_7db5h		;7d99
	ret c			;7d9c
	ld ix,05d66h		;7d9d
	ld d,020h		;7da1
	ld e,038h		;7da3
	call sub_7db5h		;7da5
	ret c			;7da8
	ld ix,05d2ah		;7da9
	ld d,020h		;7dad
	ld e,038h		;7daf
	call sub_7db5h		;7db1
	ret			;7db4
sub_7db5h:
	ld a,d			;7db5
	sbc a,h			;7db6
	call nc,sub_7dfdh	;7db7
	ld a,(ix+000h)		;7dba
	ld c,004h		;7dbd
	add a,d			;7dbf
l7dc0h:
	add a,c			;7dc0
	ld d,a			;7dc1
	ld a,(iy+000h)		;7dc2
	add a,h			;7dc5
	add a,c			;7dc6
	ld h,a			;7dc7
	ld a,(ix+000h)		;7dc8
	add a,c			;7dcb
	sbc a,h			;7dcc
	jr nc,l7dfbh		;7dcd
	ld a,(iy+000h)		;7dcf
	add a,c			;7dd2
	ld h,a			;7dd3
	ld a,d			;7dd4
	sbc a,h			;7dd5
	jr c,l7dfbh		;7dd6
	ld a,e			;7dd8
	sbc a,l			;7dd9
	call c,sub_7dfdh	;7dda
	ld a,(ix+001h)		;7ddd
	add a,e			;7de0
	add a,c			;7de1
	ld e,a			;7de2
	ld a,(iy+001h)		;7de3
	add a,l			;7de6
	add a,c			;7de7
	ld l,a			;7de8
	ld a,(ix+001h)		;7de9
	add a,c			;7dec
	sbc a,l			;7ded
	jr nc,l7dfbh		;7dee
	ld a,(iy+001h)		;7df0
	add a,c			;7df3
	ld l,a			;7df4
	ld a,e			;7df5
	sbc a,l			;7df6
	jr c,l7dfbh		;7df7
l7df9h:
	scf			;7df9
	ret			;7dfa
l7dfbh:
	and a			;7dfb
	ret			;7dfc
sub_7dfdh:
	push ix			;7dfd
	push iy			;7dff
	pop ix			;7e01
	pop iy			;7e03
	ex de,hl		;7e05
	ret			;7e06
sub_7e07h:
	ld a,(0a6e7h)		;7e07
	add a,a			;7e0a
	ld b,000h		;7e0b
	ld c,a			;7e0d
	ld hl,la6e8h		;7e0e
	add hl,bc		;7e11
	ld (hl),e		;7e12
	inc hl			;7e13
	ld (hl),d		;7e14
	ld a,(0a6e7h)		;7e15
	inc a			;7e18
	ld (0a6e7h),a		;7e19
	ret			;7e1c
sub_7e1dh:
	ld a,(0a6e7h)		;7e1d
	dec a			;7e20
	ld (0a6e7h),a		;7e21
	ret			;7e24
	nop			;7e25
sub_7e26h:
	ld a,(la8f7h)		;7e26
	cp 000h			;7e29
	jr z,l7e3fh		;7e2b
	cp 0ffh			;7e2d
	jp z,l7ef4h		;7e2f
	call sub_7e90h		;7e32
	call sub_7ebch		;7e35
	call sub_7f0eh		;7e38
	call sub_7f1dh		;7e3b
	ret			;7e3e
l7e3fh:
	ld a,r			;7e3f
	and 01fh		;7e41
	ret nz			;7e43
	ld a,080h		;7e44
	ld (l7f3fh),a		;7e46
	ld a,r			;7e49
	and 001h		;7e4b
	jr nz,l7e77h		;7e4d
	ld a,000h		;7e4f
	ld (l7f40h),a		;7e51
	ld ix,l7f3fh		;7e54
	call sub_7609h		;7e58
	ld a,001h		;7e5b
	ld (l7e8dh),a		;7e5d
l7e60h:
	call sub_6dach		;7e60
	ld hl,l7f3fh		;7e63
	ld (la6e8h),hl		;7e66
	ld a,001h		;7e69
	ld (la8f7h),a		;7e6b
	ld (l7f47h),a		;7e6e
	ld a,000h		;7e71
	ld (l7e8eh),a		;7e73
	ret			;7e76
l7e77h:
	ld a,0d8h		;7e77
	ld (l7f40h),a		;7e79
	ld ix,l7f3fh		;7e7c
	call sub_75eeh		;7e80
	ld a,000h		;7e83
	ld (l7e8fh),a		;7e85
	ld (l7e8dh),a		;7e88
	jr l7e60h		;7e8b
l7e8dh:
	nop			;7e8d
l7e8eh:
	nop			;7e8e
l7e8fh:
	nop			;7e8f
sub_7e90h:
	ld a,(l7e8fh)		;7e90
	cp 001h			;7e93
	jr z,l7ea7h		;7e95
	ld a,(l7f47h)		;7e97
	inc a			;7e9a
	ld (l7f47h),a		;7e9b
	cp 003h			;7e9e
	ret nz			;7ea0
	ld a,001h		;7ea1
	ld (l7e8fh),a		;7ea3
	ret			;7ea6
l7ea7h:
	ld a,(l7f47h)		;7ea7
	dec a			;7eaa
	ld (l7f47h),a		;7eab
	cp 000h			;7eae
	ret nz			;7eb0
	ld a,000h		;7eb1
	ld (l7e8fh),a		;7eb3
	ld a,001h		;7eb6
	ld (l7f47h),a		;7eb8
	ret			;7ebb
sub_7ebch:
	ld a,(l7e8dh)		;7ebc
	cp 000h			;7ebf
	jp z,l7edch		;7ec1
	ld a,(l7f40h)		;7ec4
	add a,008h		;7ec7
	ld (l7f40h),a		;7ec9
	cp 0d8h			;7ecc
	ret nz			;7ece
	ld a,000h		;7ecf
	ld (l7e8dh),a		;7ed1
	ld ix,l7f3fh		;7ed4
	call sub_75eeh		;7ed8
	ret			;7edb
l7edch:
	ld a,(l7f40h)		;7edc
	sub 004h		;7edf
	ld (l7f40h),a		;7ee1
	cp 000h			;7ee4
	ret nz			;7ee6
	ld a,001h		;7ee7
	ld (l7e8dh),a		;7ee9
	ld ix,l7f3fh		;7eec
	call sub_7609h		;7ef0
	ret			;7ef3
l7ef4h:
	call sub_a9b0h		;7ef4
	call sub_a9abh		;7ef7
	ld a,(l7f3fh)		;7efa
	add a,010h		;7efd
	ld (l7f3fh),a		;7eff
	cp 0c0h			;7f02
	ret nz			;7f04
l7f05h:
	ld a,000h		;7f05
	ld (la8f7h),a		;7f07
	call sub_6dd2h		;7f0a
	ret			;7f0d
sub_7f0eh:
	ld iy,l7f3fh		;7f0e
	ld h,038h		;7f12
	ld l,020h		;7f14
	call sub_7d67h		;7f16
	jp c,la8adh		;7f19
	ret			;7f1c
sub_7f1dh:
	ld iy,l7f3fh		;7f1d
	ld h,038h		;7f21
	ld l,020h		;7f23
	call sub_7d75h		;7f25
	ret nc			;7f28
	ld a,(la6ach)		;7f29
	inc a			;7f2c
	ld b,a			;7f2d
	ld a,(l7e8eh)		;7f2e
	add a,b			;7f31
	ld (l7e8eh),a		;7f32
	and a			;7f35
	sbc a,009h		;7f36
	ret c			;7f38
	ld a,0ffh		;7f39
	ld (la8f7h),a		;7f3b
	ret			;7f3e
l7f3fh:
	nop			;7f3f
l7f40h:
	nop			;7f40
	nop			;7f41
	nop			;7f42
	nop			;7f43
	nop			;7f44
	nop			;7f45
	inc bc			;7f46
l7f47h:
	ld bc,04f00h		;7f47
	ld a,a			;7f4a
	call nc,05981h		;7f4b
	add a,h			;7f4e
	ex af,af'		;7f4f
	dec b			;7f50
	nop			;7f51
	out (081h),a		;7f52
	cp 000h			;7f54
	rst 38h			;7f56
	nop			;7f57
	nop			;7f58
	nop			;7f59
	ccf			;7f5a
	nop			;7f5b
	rst 38h			;7f5c
	nop			;7f5d
	call m,07c01h		;7f5e
	nop			;7f61
	nop			;7f62
	rst 38h			;7f63
	rrca			;7f64
	ret nz			;7f65
	rst 38h			;7f66
	nop			;7f67
	ret m			;7f68
	inc bc			;7f69
	ld (hl),b		;7f6a
	inc bc			;7f6b
l7f6ch:
	nop			;7f6c
	jp nc,03007h		;7f6d
	rst 38h			;7f70
	nop			;7f71
	ret m			;7f72
	ld (bc),a		;7f73
	jr nz,l7f05h		;7f74
	nop			;7f76
	rst 38h			;7f77
	inc bc			;7f78
	ex af,af'		;7f79
	rst 38h			;7f7a
	nop			;7f7b
	ret p			;7f7c
	ld b,000h		;7f7d
	sbc a,a			;7f7f
	nop			;7f80
	cp 001h			;7f81
	and h			;7f83
	rst 38h			;7f84
	nop			;7f85
	ret p			;7f86
	ld b,000h		;7f87
	sbc a,a			;7f89
	nop			;7f8a
	rst 38h			;7f8b
	ld bc,lffd4h		;7f8c
	nop			;7f8f
	ret p			;7f90
	dec b			;7f91
	nop			;7f92
	cp a			;7f93
	nop			;7f94
	rst 38h			;7f95
	nop			;7f96
	jp po,000ffh		;7f97
	ret po			;7f9a
	dec c			;7f9b
	nop			;7f9c
	ld a,a			;7f9d
	nop			;7f9e
	rst 38h			;7f9f
	nop			;7fa0
	jp p,000ffh		;7fa1
	ret po			;7fa4
	inc c			;7fa5
	nop			;7fa6
	rrca			;7fa7
	nop			;7fa8
	rst 38h			;7fa9
	nop			;7faa
	jp po,000ffh		;7fab
	ret po			;7fae
	ld c,000h		;7faf
	ret po			;7fb1
	nop			;7fb2
	rra			;7fb3
	nop			;7fb4
	jp m,000ffh		;7fb5
	ret po			;7fb8
	dec c			;7fb9
	nop			;7fba
	ccf			;7fbb
	nop			;7fbc
	jp 00e00h		;7fbd
	rst 38h			;7fc0
	nop			;7fc1
	ret po			;7fc2
	dec bc			;7fc3
	nop			;7fc4
	ld h,(hl)		;7fc5
	nop			;7fc6
	ret m			;7fc7
	nop			;7fc8
	ld h,(hl)		;7fc9
	rst 38h			;7fca
	nop			;7fcb
	ret po			;7fcc
	dec bc			;7fcd
	nop			;7fce
	ld l,l			;7fcf
	nop			;7fd0
	rst 18h			;7fd1
	nop			;7fd2
	sub h			;7fd3
	rst 38h			;7fd4
	nop			;7fd5
	ret po			;7fd6
	dec bc			;7fd7
	nop			;7fd8
	ld l,l			;7fd9
	nop			;7fda
	cp d			;7fdb
	nop			;7fdc
	sub l			;7fdd
	ld a,a			;7fde
	nop			;7fdf
	ret po			;7fe0
	dec bc			;7fe1
	nop			;7fe2
	ld l,l			;7fe3
	nop			;7fe4
	or (hl)			;7fe5
	nop			;7fe6
	call po,l803fh		;7fe7
	ret po			;7fea
	dec bc			;7feb
	nop			;7fec
	ld l,l			;7fed
	nop			;7fee
	or (hl)			;7fef
	nop			;7ff0
	adc a,b			;7ff1
	ccf			;7ff2
	add a,b			;7ff3
	ret po			;7ff4
	dec bc			;7ff5
	nop			;7ff6
	ld l,l			;7ff7
l7ff8h:
	nop			;7ff8
	cp e			;7ff9
	nop			;7ffa
	add hl,sp		;7ffb
	rra			;7ffc
	ret nz			;7ffd
	ret po			;7ffe
	dec bc			;7fff
l8000h:
	nop			;8000
	ld l,l			;8001
	nop			;8002
	call c,07300h		;8003
	rra			;8006
l8007h:
	ret nz			;8007
	ret po			;8008
	dec c			;8009
	nop			;800a
	ld h,000h		;800b
	ld sp,hl		;800d
	nop			;800e
	rst 20h			;800f
	rra			;8010
	ret nz			;8011
	ret nz			;8012
	ld a,(de)		;8013
	nop			;8014
	rst 38h			;8015
	nop			;8016
	inc bc			;8017
	nop			;8018
	adc a,01fh		;8019
	ret nz			;801b
	ret nz			;801c
	dec de			;801d
	nop			;801e
l801fh:
	nop			;801f
	nop			;8020
	cp 000h			;8021
	dec a			;8023
	rra			;8024
	ret nz			;8025
	ret nz			;8026
	dec de			;8027
	ld (hl),b		;8028
	inc b			;8029
	nop			;802a
	ld sp,lf900h		;802b
	rrca			;802e
	ld h,b			;802f
	ret nz			;8030
	dec de			;8031
	ld (hl),b		;8032
	rlca			;8033
	nop			;8034
	rrca			;8035
	nop			;8036
	jp p,le00fh		;8037
	ret nz			;803a
	dec d			;803b
sub_803ch:
	ld (hl),b		;803c
	rlca			;803d
	nop			;803e
l803fh:
	rst 38h			;803f
	nop			;8040
	push bc			;8041
	rrca			;8042
	ld h,b			;8043
l8044h:
	add a,b			;8044
	dec c			;8045
	ld (hl),b		;8046
	rlca			;8047
	nop			;8048
	cp 000h			;8049
	ld a,(le00fh)		;804b
	nop			;804e
	ld h,(hl)		;804f
	ld (hl),b		;8050
	inc bc			;8051
	nop			;8052
	ld (hl),b		;8053
	nop			;8054
	defb 0fdh,00fh,060h ;illegal sequence	;8055
	nop			;8058
	ld a,c			;8059
	nop			;805a
	add a,e			;805b
	nop			;805c
	rlca			;805d
	nop			;805e
	cp 00fh			;805f
	ret po			;8061
	nop			;8062
	ld a,a			;8063
	nop			;8064
	sbc a,e			;8065
	nop			;8066
	ccf			;8067
	nop			;8068
	sbc a,a			;8069
	rrca			;806a
	ld h,b			;806b
	add a,b			;806c
	rra			;806d
	nop			;806e
	cp l			;806f
	nop			;8070
	cp (hl)			;8071
	nop			;8072
	ld (hl),a		;8073
	rrca			;8074
	ret po			;8075
	add a,b			;8076
	ld h,000h		;8077
	dec a			;8079
	nop			;807a
	cp h			;807b
	nop			;807c
l807dh:
	rst 38h			;807d
	rrca			;807e
	ld h,b			;807f
	nop			;8080
	ld a,c			;8081
	nop			;8082
	cp l			;8083
	nop			;8084
	sbc a,h			;8085
	nop			;8086
	ei			;8087
	rrca			;8088
	ret po			;8089
	nop			;808a
	ld (hl),a		;808b
l808ch:
	nop			;808c
	cp l			;808d
	nop			;808e
	sbc a,l			;808f
	nop			;8090
	ei			;8091
	rrca			;8092
	ld h,b			;8093
	nop			;8094
	ld b,(hl)		;8095
	nop			;8096
	or (hl)			;8097
l8098h:
	nop			;8098
	exx			;8099
	nop			;809a
	sbc a,a			;809b
	rrca			;809c
	ret po			;809d
	nop			;809e
	halt			;809f
	nop			;80a0
	add a,000h		;80a1
	exx			;80a3
	nop			;80a4
	ld l,a			;80a5
	rrca			;80a6
	ld h,b			;80a7
	nop			;80a8
	jr nc,l80dbh		;80a9
	add a,(hl)		;80ab
	nop			;80ac
	ret			;80ad
	nop			;80ae
	ld (hl),a		;80af
	rrca			;80b0
	ld h,b			;80b1
	add a,b			;80b2
	cpl			;80b3
	ld (hl),b		;80b4
	inc b			;80b5
	nop			;80b6
	ld l,c			;80b7
	nop			;80b8
	cp d			;80b9
	rra			;80ba
	ret nz			;80bb
	ret nz			;80bc
	ld e,0f0h		;80bd
	inc bc			;80bf
	nop			;80c0
	ld h,h			;80c1
	nop			;80c2
	add a,01fh		;80c3
	ret nz			;80c5
	pop hl			;80c6
	nop			;80c7
	ret po			;80c8
	rrca			;80c9
	nop			;80ca
	or h			;80cb
	nop			;80cc
	cp 01fh			;80cd
	ret nz			;80cf
	rst 38h			;80d0
	nop			;80d1
	ret po			;80d2
	rrca			;80d3
	nop			;80d4
	ld (hl),000h		;80d5
	cp 01fh			;80d7
	ret nz			;80d9
	rst 38h			;80da
l80dbh:
	nop			;80db
	ret po			;80dc
	rrca			;80dd
	nop			;80de
	or d			;80df
	nop			;80e0
	ld a,d			;80e1
	rra			;80e2
	ret nz			;80e3
	rst 38h			;80e4
	nop			;80e5
	ret nz			;80e6
	rra			;80e7
	nop			;80e8
	ld e,e			;80e9
l80eah:
	nop			;80ea
	ld a,(hl)		;80eb
l80ech:
	rra			;80ec
	ret nz			;80ed
	rst 38h			;80ee
	nop			;80ef
	ret nz			;80f0
	rra			;80f1
	nop			;80f2
	exx			;80f3
l80f4h:
	nop			;80f4
	adc a,(hl)		;80f5
	rra			;80f6
	ret nz			;80f7
	rst 38h			;80f8
	nop			;80f9
	ret nz			;80fa
	rra			;80fb
l80fch:
	nop			;80fc
	dec c			;80fd
	nop			;80fe
sub_80ffh:
	cp 01fh			;80ff
	ret nz			;8101
	rst 38h			;8102
	nop			;8103
	ret nz			;8104
	ld e,020h		;8105
	adc a,h			;8107
	nop			;8108
	defb 0fdh,03fh,080h ;illegal sequence	;8109
	rst 38h			;810c
	nop			;810d
	ret nz			;810e
	rra			;810f
	jr nc,l8098h		;8110
	nop			;8112
	defb 0fdh,03fh,080h ;illegal sequence	;8113
	rst 38h			;8116
	nop			;8117
	ret nz			;8118
	inc de			;8119
	ld (hl),b		;811a
	ld b,000h		;811b
	ld a,l			;811d
	ccf			;811e
	add a,b			;811f
	rst 38h			;8120
	nop			;8121
	add a,b			;8122
	dec l			;8123
	ld a,b			;8124
	inc bc			;8125
	nop			;8126
	dec a			;8127
	ccf			;8128
	add a,b			;8129
	rst 38h			;812a
	nop			;812b
	nop			;812c
	ld e,(hl)		;812d
	call m,00001h		;812e
	sbc a,c			;8131
	ccf			;8132
	add a,b			;8133
	cp 000h			;8134
	ld bc,lfcdch		;8136
	nop			;8139
	nop			;813a
	call 0007fh		;813b
	cp 000h			;813e
	nop			;8140
	cp d			;8141
	call m,00001h		;8142
	ld (hl),e		;8145
	ld a,a			;8146
	nop			;8147
	cp 000h			;8148
	ld bc,lfcbch		;814a
	ld bc,lbe00h		;814d
	rst 38h			;8150
	nop			;8151
	and 000h		;8152
	nop			;8154
	jp m,000feh		;8155
	nop			;8158
	call z,000ffh		;8159
	jp nz,00118h		;815c
	call m,000feh		;815f
	nop			;8162
	jp p,000ffh		;8163
	add a,b			;8166
	dec a			;8167
	nop			;8168
	jp m,000ffh		;8169
	nop			;816c
	ld a,a			;816d
	ld a,a			;816e
	nop			;816f
	nop			;8170
	ld a,(hl)		;8171
	nop			;8172
	cp 0ffh			;8173
	nop			;8175
	nop			;8176
	ld a,h			;8177
	ld a,a			;8178
	nop			;8179
	nop			;817a
	ld a,a			;817b
	nop			;817c
	ld a,(000ffh)		;817d
	add a,b			;8180
	add hl,sp		;8181
	ccf			;8182
	add a,b			;8183
	nop			;8184
	ld a,a			;8185
	ld bc,0f8dch		;8186
	nop			;8189
	nop			;818a
	inc hl			;818b
	rra			;818c
	ld b,b			;818d
	add a,b			;818e
	ccf			;818f
	inc bc			;8190
	xor b			;8191
	ret p			;8192
	rlca			;8193
	nop			;8194
	sbc a,l			;8195
	rrca			;8196
	and b			;8197
	ret nz			;8198
	rra			;8199
	ld bc,0e09ch		;819a
	rrca			;819d
	nop			;819e
	rst 38h			;819f
	rrca			;81a0
	ld h,b			;81a1
	ret po			;81a2
	rrca			;81a3
	ld bc,le0fch		;81a4
	rrca			;81a7
	nop			;81a8
	rst 38h			;81a9
	rrca			;81aa
	and b			;81ab
	ret p			;81ac
	rlca			;81ad
	inc bc			;81ae
	ret m			;81af
	ret po			;81b0
	rrca			;81b1
	nop			;81b2
	cp 01fh			;81b3
	ret nz			;81b5
	ret m			;81b6
	inc bc			;81b7
	rlca			;81b8
	ret p			;81b9
	ret po			;81ba
	rrca			;81bb
	nop			;81bc
	ex de,hl		;81bd
	ccf			;81be
	nop			;81bf
	call m,00f01h		;81c0
	ret po			;81c3
	ret p			;81c4
	rlca			;81c5
	nop			;81c6
	call m,000ffh		;81c7
	cp 000h			;81ca
	rra			;81cc
	nop			;81cd
	ret m			;81ce
	nop			;81cf
	inc bc			;81d0
	nop			;81d1
	rst 38h			;81d2
	nop			;81d3
	ex af,af'		;81d4
	dec b			;81d5
	nop			;81d6
	ld e,b			;81d7
	add a,h			;81d8
	rst 38h			;81d9
	nop			;81da
	rst 38h			;81db
	nop			;81dc
	nop			;81dd
	nop			;81de
	ccf			;81df
	nop			;81e0
	rst 38h			;81e1
	nop			;81e2
	cp 000h			;81e3
	call m,00000h		;81e5
	rst 38h			;81e8
	rrca			;81e9
	ret nz			;81ea
	rst 38h			;81eb
	nop			;81ec
	call m,sub_7001h	;81ed
	inc bc			;81f0
	nop			;81f1
	jp nc,03007h		;81f2
	rst 38h			;81f5
	nop			;81f6
	ret m			;81f7
	inc bc			;81f8
	ld h,b			;81f9
	rrca			;81fa
	nop			;81fb
	rst 38h			;81fc
	inc bc			;81fd
	ex af,af'		;81fe
	rst 38h			;81ff
l8200h:
	nop			;8200
	ret m			;8201
	ld (bc),a		;8202
	nop			;8203
	sbc a,a			;8204
	nop			;8205
	cp 001h			;8206
	and h			;8208
	rst 38h			;8209
	nop			;820a
	ret p			;820b
	ld b,000h		;820c
	sbc a,a			;820e
	nop			;820f
	rst 38h			;8210
	ld bc,lffd4h		;8211
	nop			;8214
	ret p			;8215
	ld b,000h		;8216
	daa			;8218
	nop			;8219
	rst 38h			;821a
	nop			;821b
	jp po,000ffh		;821c
	ret p			;821f
	inc b			;8220
	nop			;8221
	ret m			;8222
	nop			;8223
	rst 38h			;8224
	nop			;8225
	jp p,000ffh		;8226
	ret po			;8229
	dec c			;822a
	nop			;822b
	daa			;822c
	nop			;822d
	rra			;822e
	nop			;822f
	jp po,000ffh		;8230
	ret po			;8233
	dec c			;8234
	nop			;8235
	ld l,(hl)		;8236
	nop			;8237
	ex (sp),hl		;8238
	nop			;8239
	jp m,000ffh		;823a
	ret po			;823d
	dec c			;823e
	nop			;823f
	ld l,l			;8240
	nop			;8241
	call c,00e00h		;8242
	rst 38h			;8245
	nop			;8246
	ret po			;8247
	add hl,bc		;8248
	nop			;8249
	ld l,l			;824a
	nop			;824b
	cp e			;824c
	nop			;824d
	and 0ffh		;824e
	nop			;8250
	ret po			;8251
	dec bc			;8252
	nop			;8253
	ld l,l			;8254
	nop			;8255
	or (hl)			;8256
	nop			;8257
	sub h			;8258
	ld a,a			;8259
	nop			;825a
	ret po			;825b
	add hl,bc		;825c
	nop			;825d
	ld l,l			;825e
	nop			;825f
	or (hl)			;8260
	nop			;8261
	sub l			;8262
	ld a,a			;8263
	nop			;8264
	ret po			;8265
	dec bc			;8266
	nop			;8267
	ld l,l			;8268
	nop			;8269
	or (hl)			;826a
	nop			;826b
	call po,l803fh		;826c
	ret po			;826f
	add hl,bc		;8270
	nop			;8271
	dec l			;8272
	nop			;8273
	cp e			;8274
	nop			;8275
	adc a,b			;8276
	ccf			;8277
	add a,b			;8278
	ret po			;8279
	ld a,(bc)		;827a
	nop			;827b
	and 000h		;827c
	sbc a,000h		;827e
	add hl,sp		;8280
	rra			;8281
	ret nz			;8282
	ret po			;8283
	dec bc			;8284
	nop			;8285
	ccf			;8286
	nop			;8287
	ret p			;8288
	nop			;8289
	ld (hl),e		;828a
	rra			;828b
	ret nz			;828c
	ret po			;828d
	dec bc			;828e
	nop			;828f
	nop			;8290
	nop			;8291
	ld bc,le700h		;8292
	rra			;8295
	ret nz			;8296
	ret po			;8297
	dec c			;8298
	ld a,(hl)		;8299
	nop			;829a
	nop			;829b
	inc bc			;829c
	nop			;829d
	adc a,01fh		;829e
	ret nz			;82a0
	ret nz			;82a1
	ld a,(de)		;82a2
	ret m			;82a3
	ld bc,lfe00h		;82a4
	nop			;82a7
	dec a			;82a8
	rra			;82a9
	ret nz			;82aa
	ret nz			;82ab
	dec de			;82ac
	ld (hl),b		;82ad
	inc b			;82ae
	nop			;82af
	ld sp,lf900h		;82b0
	rrca			;82b3
	ld h,b			;82b4
	ret nz			;82b5
	dec de			;82b6
	ld (hl),b		;82b7
	rlca			;82b8
	nop			;82b9
	rrca			;82ba
	nop			;82bb
	jp p,le00fh		;82bc
	ret nz			;82bf
	dec de			;82c0
	ld (hl),b		;82c1
	rlca			;82c2
	nop			;82c3
	rst 38h			;82c4
	nop			;82c5
	push bc			;82c6
	rrca			;82c7
	ld h,b			;82c8
	ret nz			;82c9
	dec d			;82ca
	ld (hl),b		;82cb
	rlca			;82cc
	nop			;82cd
	cp 000h			;82ce
	ld a,(le00fh)		;82d0
	add a,b			;82d3
	dec c			;82d4
	ld a,b			;82d5
	inc bc			;82d6
	nop			;82d7
	ld (hl),b		;82d8
	nop			;82d9
	defb 0fdh,00fh,060h ;illegal sequence	;82da
	nop			;82dd
	ld h,(hl)		;82de
	ld a,b			;82df
	inc bc			;82e0
	nop			;82e1
	rlca			;82e2
	nop			;82e3
	cp 00fh			;82e4
	ret po			;82e6
	nop			;82e7
	ld a,c			;82e8
	jr nz,$-123		;82e9
	nop			;82eb
	ccf			;82ec
	nop			;82ed
	sbc a,a			;82ee
	rrca			;82ef
	ld h,b			;82f0
	nop			;82f1
	ld a,a			;82f2
	nop			;82f3
	sbc a,l			;82f4
	nop			;82f5
	cp (hl)			;82f6
	nop			;82f7
	ld (hl),a		;82f8
	rrca			;82f9
	ret po			;82fa
	add a,b			;82fb
	rra			;82fc
	nop			;82fd
	cp l			;82fe
	nop			;82ff
	cp h			;8300
	nop			;8301
	rst 38h			;8302
	rrca			;8303
	ld h,b			;8304
	add a,b			;8305
	ld h,000h		;8306
	dec a			;8308
	nop			;8309
	sbc a,h			;830a
	nop			;830b
	ei			;830c
	rrca			;830d
	ret po			;830e
	nop			;830f
	ld a,c			;8310
	nop			;8311
	cp l			;8312
	nop			;8313
	sbc a,l			;8314
	nop			;8315
	ei			;8316
	rrca			;8317
	ld h,b			;8318
	nop			;8319
	ld (hl),a		;831a
	nop			;831b
	cp (hl)			;831c
	nop			;831d
	exx			;831e
	nop			;831f
	sbc a,a			;8320
	rrca			;8321
	ret po			;8322
	nop			;8323
	ld b,(hl)		;8324
	nop			;8325
	or (hl)			;8326
	nop			;8327
	exx			;8328
	nop			;8329
	ld l,a			;832a
	rrca			;832b
	ld h,b			;832c
	nop			;832d
	halt			;832e
	nop			;832f
	add a,000h		;8330
	ret			;8332
	nop			;8333
	ld (hl),a		;8334
	rrca			;8335
	ld h,b			;8336
	add a,b			;8337
	jr nc,l836ah		;8338
	add a,l			;833a
	nop			;833b
	ld l,c			;833c
	nop			;833d
	cp d			;833e
	rra			;833f
	ret nz			;8340
	add a,b			;8341
	cpl			;8342
	ld a,b			;8343
	ld bc,06400h		;8344
	nop			;8347
	add a,01fh		;8348
	ret nz			;834a
	ret nz			;834b
	ld e,0fch		;834c
	ld bc,lb400h		;834e
	nop			;8351
	cp 01fh			;8352
	ret nz			;8354
	pop hl			;8355
	nop			;8356
	call m,00001h		;8357
	or (hl)			;835a
	nop			;835b
	cp 01fh			;835c
	ret nz			;835e
	rst 38h			;835f
	nop			;8360
	call m,00001h		;8361
	or d			;8364
	nop			;8365
	ld a,d			;8366
	rra			;8367
	ret nz			;8368
	rst 38h			;8369
l836ah:
	nop			;836a
	call m,00001h		;836b
	in a,(000h)		;836e
	ld a,(hl)		;8370
	rra			;8371
	ret nz			;8372
	rst 38h			;8373
	nop			;8374
	ret m			;8375
	inc bc			;8376
	nop			;8377
	exx			;8378
	nop			;8379
	adc a,(hl)		;837a
	rra			;837b
	ret nz			;837c
	rst 38h			;837d
	nop			;837e
	ret m			;837f
	inc bc			;8380
	nop			;8381
	defb 0edh ;next byte illegal after ed	;8382
	nop			;8383
	cp 01fh			;8384
	ret nz			;8386
	rst 38h			;8387
	nop			;8388
	ret m			;8389
	inc bc			;838a
	nop			;838b
	xor h			;838c
	nop			;838d
	defb 0fdh,03fh,080h ;illegal sequence	;838e
	rst 38h			;8391
	nop			;8392
	ret m			;8393
	inc bc			;8394
	nop			;8395
	sub 000h		;8396
	defb 0fdh,03fh,080h ;illegal sequence	;8398
	rst 38h			;839b
	nop			;839c
	call m,00001h		;839d
	add a,000h		;83a0
	ld a,l			;83a2
	ccf			;83a3
	add a,b			;83a4
	rst 38h			;83a5
	nop			;83a6
	ret m			;83a7
	ld (bc),a		;83a8
	nop			;83a9
	or e			;83aa
	nop			;83ab
	dec a			;83ac
	ccf			;83ad
	add a,b			;83ae
	rst 38h			;83af
	nop			;83b0
	ret m			;83b1
	inc bc			;83b2
	nop			;83b3
	ld (hl),l		;83b4
	nop			;83b5
	sbc a,c			;83b6
	ccf			;83b7
	add a,b			;83b8
	rst 38h			;83b9
	nop			;83ba
	ret m			;83bb
	inc bc			;83bc
	nop			;83bd
	and 000h		;83be
	call 0007fh		;83c0
	rst 38h			;83c3
	nop			;83c4
	ret m			;83c5
	inc bc			;83c6
	nop			;83c7
	rst 30h			;83c8
	nop			;83c9
	ld (hl),e		;83ca
	ld a,a			;83cb
	nop			;83cc
	rst 38h			;83cd
	nop			;83ce
sub_83cfh:
	ret m			;83cf
	inc bc			;83d0
	nop			;83d1
	rst 20h			;83d2
	nop			;83d3
	cp (hl)			;83d4
	rst 38h			;83d5
	nop			;83d6
	rst 38h			;83d7
	nop			;83d8
	ret m			;83d9
	inc bc			;83da
	nop			;83db
	rst 30h			;83dc
	ld bc,lffcch		;83dd
	nop			;83e0
	rst 38h			;83e1
	nop			;83e2
	call m,00001h		;83e3
	ex de,hl		;83e6
	inc bc			;83e7
	and b			;83e8
sub_83e9h:
	rst 38h			;83e9
	nop			;83ea
	rst 38h			;83eb
	nop			;83ec
	call m,00001h		;83ed
	di			;83f0
	rrca			;83f1
	ret po			;83f2
	rst 38h			;83f3
l83f4h:
	nop			;83f4
	rst 38h			;83f5
	nop			;83f6
	call m,00001h		;83f7
	ex de,hl		;83fa
	rlca			;83fb
	and b			;83fc
	rst 38h			;83fd
	nop			;83fe
l83ffh:
	rst 38h			;83ff
l8400h:
	nop			;8400
	cp 000h			;8401
	nop			;8403
	ei			;8404
	inc bc			;8405
	ret c			;8406
	rst 38h			;8407
	nop			;8408
	rst 38h			;8409
	nop			;840a
	ret nz			;840b
	ld bc,00200h		;840c
	ld bc,lff54h		;840f
	nop			;8412
	rst 38h			;8413
	nop			;8414
	add a,b			;8415
	ld a,000h		;8416
	ld sp,hl		;8418
	nop			;8419
	ld a,(de)		;841a
	rst 38h			;841b
	nop			;841c
	rst 38h			;841d
	nop			;841e
	nop			;841f
	ld a,l			;8420
	nop			;8421
	rst 38h			;8422
	nop			;8423
	or 0ffh			;8424
	nop			;8426
	rst 38h			;8427
	nop			;8428
	nop			;8429
	ld a,l			;842a
	nop			;842b
	rst 38h			;842c
	nop			;842d
	jp m,000ffh		;842e
l8431h:
	rst 38h			;8431
	nop			;8432
	nop			;8433
	ld a,l			;8434
	nop			;8435
	rst 38h			;8436
	ld bc,lffech		;8437
	nop			;843a
	rst 38h			;843b
	nop			;843c
	nop			;843d
	ld a,l			;843e
	nop			;843f
	cp 003h			;8440
	or b			;8442
	rst 38h			;8443
	nop			;8444
	rst 38h			;8445
	nop			;8446
	add a,b			;8447
	ld a,000h		;8448
	rst 38h			;844a
sub_844bh:
	rrca			;844b
	ret nz			;844c
	rst 38h			;844d
	nop			;844e
	rst 38h			;844f
	nop			;8450
	ret nz			;8451
	nop			;8452
	nop			;8453
	nop			;8454
	ccf			;8455
	nop			;8456
	rst 38h			;8457
	nop			;8458
	ex af,af'		;8459
	dec b			;845a
	nop			;845b
	add a,(ix-001h)		;845c
	nop			;845f
	rst 38h			;8460
	nop			;8461
	nop			;8462
	nop			;8463
l8464h:
	ccf			;8464
	nop			;8465
	rst 38h			;8466
	nop			;8467
	rst 38h			;8468
	nop			;8469
	call m,00000h		;846a
	rst 38h			;846d
	rrca			;846e
	ret nz			;846f
	rst 38h			;8470
	nop			;8471
	cp 000h			;8472
	ret p			;8474
	inc bc			;8475
	nop			;8476
	jp nc,03007h		;8477
	rst 38h			;847a
	nop			;847b
	call m,06001h		;847c
	inc c			;847f
	nop			;8480
	rst 38h			;8481
	inc bc			;8482
	ex af,af'		;8483
	rst 38h			;8484
	nop			;8485
	ret m			;8486
	inc bc			;8487
	ld b,b			;8488
	ld (de),a		;8489
	nop			;848a
	ld a,001h		;848b
	and h			;848d
	rst 38h			;848e
	nop			;848f
	ret m			;8490
	ld (bc),a		;8491
	nop			;8492
	or h			;8493
	nop			;8494
	rst 8			;8495
	ld bc,lffd4h		;8496
	nop			;8499
	ret p			;849a
	ld b,000h		;849b
	xor l			;849d
	nop			;849e
	or a			;849f
	nop			;84a0
	jp po,000ffh		;84a1
	ret p			;84a4
	ld b,000h		;84a5
	xor e			;84a7
	nop			;84a8
	ld (hl),c		;84a9
	nop			;84aa
	jp p,000ffh		;84ab
	ret p			;84ae
	ld b,000h		;84af
	xor e			;84b1
	nop			;84b2
	ld l,(hl)		;84b3
	nop			;84b4
	ld h,d			;84b5
	rst 38h			;84b6
	nop			;84b7
	ret po			;84b8
	ld c,000h		;84b9
	xor e			;84bb
	nop			;84bc
	ld l,l			;84bd
	nop			;84be
	cp d			;84bf
	rst 38h			;84c0
	nop			;84c1
	ret po			;84c2
	ld c,000h		;84c3
	xor l			;84c5
	nop			;84c6
	or l			;84c7
	nop			;84c8
	adc a,0ffh		;84c9
	nop			;84cb
	ret po			;84cc
	dec c			;84cd
	nop			;84ce
	sub h			;84cf
	nop			;84d0
	rst 38h			;84d1
	nop			;84d2
	and 0ffh		;84d3
	nop			;84d5
	ret po			;84d6
	dec c			;84d7
	nop			;84d8
	adc a,a			;84d9
	nop			;84da
	ret p			;84db
	nop			;84dc
	sub h			;84dd
	rst 38h			;84de
	nop			;84df
	ret po			;84e0
	dec c			;84e1
	jr nz,l8464h		;84e2
	nop			;84e4
	ld (bc),a		;84e5
	nop			;84e6
	sub l			;84e7
	ld a,a			;84e8
	nop			;84e9
	ret po			;84ea
	dec c			;84eb
	inc (hl)		;84ec
	add a,c			;84ed
	nop			;84ee
	inc de			;84ef
	nop			;84f0
	ld h,h			;84f1
	ccf			;84f2
	add a,b			;84f3
	ret po			;84f4
	dec c			;84f5
	inc a			;84f6
	add a,c			;84f7
	nop			;84f8
	inc de			;84f9
	nop			;84fa
	adc a,b			;84fb
	ccf			;84fc
	add a,b			;84fd
	ret po			;84fe
l84ffh:
	dec c			;84ff
l8500h:
	ld a,080h		;8500
	nop			;8502
	rst 28h			;8503
	nop			;8504
	sbc a,c			;8505
	rra			;8506
	ret nz			;8507
	ret po			;8508
	dec c			;8509
	ld a,(hl)		;850a
	nop			;850b
	nop			;850c
	cp 000h			;850d
	inc sp			;850f
	rra			;8510
	ret nz			;8511
	ret po			;8512
	dec c			;8513
	ld a,(hl)		;8514
	nop			;8515
	nop			;8516
	xor d			;8517
	nop			;8518
	rst 20h			;8519
	rra			;851a
	ret nz			;851b
	ret po			;851c
	dec c			;851d
	ld a,a			;851e
	nop			;851f
	nop			;8520
	ld bc,lce00h		;8521
	rra			;8524
	ret nz			;8525
	ret po			;8526
	dec c			;8527
	ld a,d			;8528
	nop			;8529
	nop			;852a
	xor d			;852b
	nop			;852c
	dec a			;852d
	rra			;852e
	ret nz			;852f
	ret nz			;8530
	dec de			;8531
	ld (hl),b		;8532
	inc b			;8533
	nop			;8534
	ld (hl),c		;8535
	nop			;8536
	ld sp,hl		;8537
	rrca			;8538
	ld h,b			;8539
	ret nz			;853a
	dec de			;853b
	ld (hl),b		;853c
	rlca			;853d
	nop			;853e
	rrca			;853f
	nop			;8540
	jp p,le00fh		;8541
	ret nz			;8544
	dec de			;8545
	ld (hl),b		;8546
	rlca			;8547
	nop			;8548
	rst 38h			;8549
	nop			;854a
	push bc			;854b
	rrca			;854c
	ld h,b			;854d
	ret nz			;854e
	dec de			;854f
	ld (hl),b		;8550
	rlca			;8551
	nop			;8552
	cp 000h			;8553
	ld a,(le00fh)		;8555
	ret nz			;8558
	dec d			;8559
	ld a,b			;855a
	inc bc			;855b
	nop			;855c
	ld (hl),b		;855d
	nop			;855e
	defb 0fdh,00fh,060h ;illegal sequence	;855f
	add a,b			;8562
	dec c			;8563
	ld a,b			;8564
l8565h:
	inc bc			;8565
	nop			;8566
	rlca			;8567
	nop			;8568
	cp 00fh			;8569
	ret po			;856b
	nop			;856c
	ld h,(hl)		;856d
	ld a,b			;856e
	inc bc			;856f
	nop			;8570
	ccf			;8571
	nop			;8572
	sbc a,a			;8573
	rrca			;8574
	ld h,b			;8575
	nop			;8576
	ld a,c			;8577
	jr nz,l84ffh		;8578
	nop			;857a
	cp (hl)			;857b
	nop			;857c
	ld (hl),a		;857d
	rrca			;857e
	ret po			;857f
	nop			;8580
	ld a,a			;8581
	nop			;8582
	sbc a,l			;8583
	nop			;8584
	cp h			;8585
	nop			;8586
	rst 38h			;8587
	rrca			;8588
	ld h,b			;8589
	add a,b			;858a
	rra			;858b
	nop			;858c
	cp l			;858d
	nop			;858e
	sbc a,h			;858f
	nop			;8590
	ei			;8591
	rrca			;8592
	ret po			;8593
	add a,b			;8594
	ld h,000h		;8595
	dec a			;8597
	nop			;8598
	sbc a,l			;8599
	nop			;859a
	ei			;859b
	rrca			;859c
	ld h,b			;859d
	nop			;859e
	ld a,c			;859f
	nop			;85a0
	cp (hl)			;85a1
	nop			;85a2
	exx			;85a3
	nop			;85a4
	sbc a,a			;85a5
	rrca			;85a6
	ret po			;85a7
	nop			;85a8
	ld (hl),a		;85a9
	nop			;85aa
	cp (hl)			;85ab
	nop			;85ac
	exx			;85ad
	nop			;85ae
	ld l,a			;85af
	rrca			;85b0
	ld h,b			;85b1
	nop			;85b2
	ld b,(hl)		;85b3
	nop			;85b4
	or (hl)			;85b5
	nop			;85b6
	ret			;85b7
	nop			;85b8
	ld (hl),a		;85b9
	rrca			;85ba
	ld h,b			;85bb
	nop			;85bc
	halt			;85bd
	nop			;85be
	push bc			;85bf
	nop			;85c0
	ld l,c			;85c1
	nop			;85c2
	cp d			;85c3
	rra			;85c4
	ret nz			;85c5
	add a,b			;85c6
	jr nc,l8601h		;85c7
	add a,c			;85c9
	nop			;85ca
	ld h,h			;85cb
	nop			;85cc
	add a,01fh		;85cd
	ret nz			;85cf
	add a,b			;85d0
	cpl			;85d1
	ld a,h			;85d2
	ld bc,lb400h		;85d3
	nop			;85d6
	cp 01fh			;85d7
	ret nz			;85d9
	ret nz			;85da
	ld e,0fch		;85db
	ld bc,lb600h		;85dd
	nop			;85e0
	cp 01fh			;85e1
	ret nz			;85e3
	pop hl			;85e4
	nop			;85e5
	call m,00001h		;85e6
	or d			;85e9
	nop			;85ea
	ld a,d			;85eb
	rra			;85ec
	ret nz			;85ed
	rst 38h			;85ee
	nop			;85ef
	call m,00001h		;85f0
	in a,(000h)		;85f3
	ld a,(hl)		;85f5
	rra			;85f6
	ret nz			;85f7
	rst 38h			;85f8
	nop			;85f9
	call m,00001h		;85fa
	exx			;85fd
	nop			;85fe
	adc a,(hl)		;85ff
l8600h:
	rra			;8600
l8601h:
	ret nz			;8601
	rst 38h			;8602
	nop			;8603
	call m,00001h		;8604
	defb 0edh ;next byte illegal after ed	;8607
	nop			;8608
	cp 01fh			;8609
	ret nz			;860b
	rst 38h			;860c
	nop			;860d
	cp 000h			;860e
	nop			;8610
	call pe,sub_fd00h	;8611
	ccf			;8614
	add a,b			;8615
	rst 38h			;8616
	nop			;8617
	cp 000h			;8618
	nop			;861a
	sub 000h		;861b
	defb 0fdh,03fh,080h ;illegal sequence	;861d
	rst 38h			;8620
	nop			;8621
	cp 000h			;8622
	nop			;8624
	sub 000h		;8625
	ld a,l			;8627
	ccf			;8628
	add a,b			;8629
	rst 38h			;862a
	nop			;862b
	cp 000h			;862c
	nop			;862e
	in a,(000h)		;862f
	dec a			;8631
	ccf			;8632
	add a,b			;8633
	rst 38h			;8634
	nop			;8635
	cp 000h			;8636
	nop			;8638
	defb 0ddh,000h,099h ;illegal sequence	;8639
	ccf			;863c
	add a,b			;863d
	rst 38h			;863e
	nop			;863f
	call m,00001h		;8640
	cp (hl)			;8643
	nop			;8644
	call 0007fh		;8645
	rst 38h			;8648
	nop			;8649
	call m,00001h		;864a
	cp d			;864d
	nop			;864e
	ld (hl),e		;864f
	ld a,a			;8650
	nop			;8651
	rst 38h			;8652
	nop			;8653
	cp 000h			;8654
	nop			;8656
	cp (hl)			;8657
	add a,b			;8658
	ld a,0ffh		;8659
	nop			;865b
	rst 38h			;865c
	nop			;865d
	cp 000h			;865e
	nop			;8660
	cp d			;8661
	pop bc			;8662
	inc c			;8663
	rst 38h			;8664
	nop			;8665
	rst 38h			;8666
	nop			;8667
	rst 38h			;8668
	nop			;8669
	ld bc,0f374h		;866a
	nop			;866d
	rst 38h			;866e
	nop			;866f
	rst 38h			;8670
	nop			;8671
	rrca			;8672
	nop			;8673
	nop			;8674
	ld a,b			;8675
	rst 38h			;8676
	nop			;8677
	rst 38h			;8678
	nop			;8679
	cp 000h			;867a
	nop			;867c
	ret p			;867d
	nop			;867e
	push af			;867f
	ld a,a			;8680
	nop			;8681
	rst 38h			;8682
	nop			;8683
	call m,00001h		;8684
	cp 000h			;8687
	ld a,e			;8689
	ld a,a			;868a
	nop			;868b
	rst 38h			;868c
	nop			;868d
	ret m			;868e
	inc bc			;868f
	nop			;8690
	defb 0fdh,000h,0adh ;illegal sequence	;8691
	ccf			;8694
	add a,b			;8695
	rst 38h			;8696
	nop			;8697
	ret m			;8698
	inc bc			;8699
	nop			;869a
	rst 38h			;869b
	nop			;869c
	ld d,l			;869d
	rra			;869e
	ret nz			;869f
	rst 38h			;86a0
	nop			;86a1
	call m,00001h		;86a2
	rst 38h			;86a5
	nop			;86a6
	cp e			;86a7
	rra			;86a8
	ret nz			;86a9
	rst 38h			;86aa
	nop			;86ab
	cp 000h			;86ac
	nop			;86ae
	rst 38h			;86af
	nop			;86b0
	ex de,hl		;86b1
	rra			;86b2
	ret nz			;86b3
	rst 38h			;86b4
	nop			;86b5
	rst 38h			;86b6
	nop			;86b7
	nop			;86b8
	ccf			;86b9
	nop			;86ba
	ei			;86bb
	ccf			;86bc
	add a,b			;86bd
	rst 38h			;86be
	nop			;86bf
	rst 38h			;86c0
	nop			;86c1
	ret nz			;86c2
	rrca			;86c3
	nop			;86c4
	dec hl			;86c5
	ld a,a			;86c6
	nop			;86c7
	rst 38h			;86c8
	nop			;86c9
	rst 38h			;86ca
	nop			;86cb
	ret p			;86cc
	inc bc			;86cd
	nop			;86ce
	ret p			;86cf
	rst 38h			;86d0
	nop			;86d1
	rst 38h			;86d2
	nop			;86d3
	rst 38h			;86d4
	nop			;86d5
	call m,00f00h		;86d6
	nop			;86d9
	rst 38h			;86da
	nop			;86db
	rst 38h			;86dc
	nop			;86dd
l86deh:
	ld a,(la8f8h)		;86de
	cp 000h			;86e1
	jr z,l86f7h		;86e3
	cp 0ffh			;86e5
	jp z,l878dh		;86e7
	call sub_8745h		;86ea
	call sub_8755h		;86ed
	call sub_87a4h		;86f0
	call sub_87b3h		;86f3
	ret			;86f6
l86f7h:
	ld a,r			;86f7
	and 01fh		;86f9
	ret nz			;86fb
	ld a,090h		;86fc
	ld (l87d5h),a		;86fe
	ld a,r			;8701
	and 001h		;8703
	jr z,l872ch		;8705
	ld a,000h		;8707
	ld (l87d6h),a		;8709
	ld ix,l87d5h		;870c
	call sub_7609h		;8710
	ld a,001h		;8713
	ld (l8742h),a		;8715
l8718h:
	ld de,l87d5h		;8718
	call sub_7e07h		;871b
	ld a,001h		;871e
	ld (la8f8h),a		;8720
	ld (l87ddh),a		;8723
	ld a,000h		;8726
	ld (l8743h),a		;8728
	ret			;872b
l872ch:
	ld a,0d8h		;872c
	ld (l87d6h),a		;872e
	ld ix,l87d5h		;8731
	call sub_75eeh		;8735
	ld a,000h		;8738
	ld (l8744h),a		;873a
	ld (l8742h),a		;873d
	jr l8718h		;8740
l8742h:
	nop			;8742
l8743h:
	nop			;8743
l8744h:
	nop			;8744
sub_8745h:
	ld a,(l87ddh)		;8745
	inc a			;8748
	ld (l87ddh),a		;8749
	cp 003h			;874c
	ret nz			;874e
	ld a,001h		;874f
	ld (l87ddh),a		;8751
	ret			;8754
sub_8755h:
	ld a,(l8742h)		;8755
	cp 000h			;8758
	jp z,l8775h		;875a
	ld a,(l87d6h)		;875d
	add a,004h		;8760
	ld (l87d6h),a		;8762
	cp 0d8h			;8765
	ret nz			;8767
	ld a,000h		;8768
	ld (l8742h),a		;876a
	ld ix,l87d5h		;876d
	call sub_75eeh		;8771
	ret			;8774
l8775h:
	ld a,(l87d6h)		;8775
	sub 004h		;8778
	ld (l87d6h),a		;877a
	cp 000h			;877d
	ret nz			;877f
	ld a,001h		;8780
	ld (l8742h),a		;8782
	ld ix,l87d5h		;8785
	call sub_7609h		;8789
	ret			;878c
l878dh:
	call sub_a9abh		;878d
	ld a,(l87d5h)		;8790
	add a,004h		;8793
	ld (l87d5h),a		;8795
	cp 0c0h			;8798
	ret nz			;879a
	ld a,000h		;879b
	ld (la8f8h),a		;879d
	call sub_7e1dh		;87a0
	ret			;87a3
sub_87a4h:
	ld iy,l87d5h		;87a4
	ld h,028h		;87a8
	ld l,020h		;87aa
	call sub_7d67h		;87ac
	jp c,la8adh		;87af
	ret			;87b2
sub_87b3h:
	ld iy,l87d5h		;87b3
	ld h,028h		;87b7
	ld l,020h		;87b9
	call sub_7d75h		;87bb
	ret nc			;87be
	ld a,(la6ach)		;87bf
	inc a			;87c2
	ld b,a			;87c3
	ld a,(l8743h)		;87c4
	add a,b			;87c7
	ld (l8743h),a		;87c8
	and a			;87cb
	sbc a,00fh		;87cc
	ret c			;87ce
	ld a,0ffh		;87cf
	ld (la8f8h),a		;87d1
	ret			;87d4
l87d5h:
	nop			;87d5
l87d6h:
	nop			;87d6
	nop			;87d7
	nop			;87d8
	nop			;87d9
	nop			;87da
	nop			;87db
	ld (bc),a		;87dc
l87ddh:
	ld bc,le300h		;87dd
	add a,a			;87e0
	ret z			;87e1
	adc a,c			;87e2
	ld b,005h		;87e3
	nop			;87e5
	rst 0			;87e6
	adc a,c			;87e7
	rst 38h			;87e8
	nop			;87e9
	rst 38h			;87ea
	nop			;87eb
	rst 38h			;87ec
	nop			;87ed
	rst 38h			;87ee
	nop			;87ef
	rst 38h			;87f0
	nop			;87f1
	ret p			;87f2
	nop			;87f3
	ld b,d			;87f4
	nop			;87f5
	rlca			;87f6
	nop			;87f7
	adc a,a			;87f8
	nop			;87f9
	rst 38h			;87fa
	nop			;87fb
	ret po			;87fc
	rrca			;87fd
	nop			;87fe
	cp l			;87ff
	ld (bc),a		;8800
	ret m			;8801
	ld bc,lff70h		;8802
	nop			;8805
	ret nz			;8806
	jr l8809h		;8807
l8809h:
	ld a,e			;8809
	nop			;880a
	defb 0fdh,000h,0deh ;illegal sequence	;880b
	ld a,a			;880e
	nop			;880f
	add a,b			;8810
	scf			;8811
	nop			;8812
	ld h,l			;8813
	nop			;8814
	adc a,a			;8815
	nop			;8816
	inc hl			;8817
	ccf			;8818
	add a,b			;8819
	nop			;881a
	ld l,l			;881b
	nop			;881c
	ld e,d			;881d
	nop			;881e
	halt			;881f
	nop			;8820
	ld d,h			;8821
	rra			;8822
	ret nz			;8823
	nop			;8824
	ld l,(hl)		;8825
	nop			;8826
	cp l			;8827
	nop			;8828
	jp m,lbf00h		;8829
	rra			;882c
	ld b,b			;882d
	nop			;882e
	ld a,a			;882f
	nop			;8830
	ld a,e			;8831
	nop			;8832
	defb 0fdh,000h,07fh ;illegal sequence	;8833
	rrca			;8836
	and b			;8837
	nop			;8838
	ld a,a			;8839
	nop			;883a
	ld c,d			;883b
	nop			;883c
	ld a,h			;883d
	nop			;883e
	cp a			;883f
	rrca			;8840
	ret po			;8841
	nop			;8842
	ld a,a			;8843
	nop			;8844
	ld c,d			;8845
	nop			;8846
	ld a,h			;8847
	nop			;8848
	ld a,a			;8849
	rrca			;884a
	ret po			;884b
	nop			;884c
	ld (hl),b		;884d
	nop			;884e
	ld a,l			;884f
	nop			;8850
	ei			;8851
	nop			;8852
	ccf			;8853
	rrca			;8854
	ret po			;8855
	add a,b			;8856
	cpl			;8857
	nop			;8858
	add a,d			;8859
	nop			;885a
	push hl			;885b
	nop			;885c
	ld a,a			;885d
	rrca			;885e
	ret po			;885f
	ret nz			;8860
	rra			;8861
	nop			;8862
	call m,00f00h		;8863
	nop			;8866
	rst 38h			;8867
	rra			;8868
	ret nz			;8869
	add a,b			;886a
	ccf			;886b
	nop			;886c
	rst 38h			;886d
	nop			;886e
	cp c			;886f
	nop			;8870
	ld a,a			;8871
	ccf			;8872
l8873h:
	add a,b			;8873
	add a,b			;8874
	ccf			;8875
	nop			;8876
	rst 20h			;8877
	nop			;8878
	and 000h		;8879
	adc a,(hl)		;887b
	ld a,a			;887c
	nop			;887d
	nop			;887e
	ld a,a			;887f
	nop			;8880
	in a,(000h)		;8881
	or 030h			;8883
	add a,b			;8885
	ccf			;8886
	nop			;8887
sub_8888h:
	nop			;8888
	ld a,a			;8889
	nop			;888a
	rst 38h			;888b
	nop			;888c
	sub 01ch		;888d
	ld b,b			;888f
	rra			;8890
	ret nz			;8891
	nop			;8892
	ld a,a			;8893
	nop			;8894
	rst 20h			;8895
	nop			;8896
	add a,c			;8897
	djnz l88ddh		;8898
	rrca			;889a
	ret po			;889b
	nop			;889c
	ld a,a			;889d
	jr l88a0h		;889e
l88a0h:
	nop			;88a0
	ld d,(hl)		;88a1
	nop			;88a2
	adc a,a			;88a3
	rrca			;88a4
	ld h,b			;88a5
	add a,b			;88a6
	jr c,$-14		;88a7
	ld bc,0d700h		;88a9
	nop			;88ac
	ld a,00fh		;88ad
	ret po			;88af
	rst 0			;88b0
	nop			;88b1
	ret po			;88b2
	inc c			;88b3
	nop			;88b4
	ld c,000h		;88b5
	ret m			;88b7
	rrca			;88b8
	ret po			;88b9
	rst 38h			;88ba
	nop			;88bb
	ret nz			;88bc
	rra			;88bd
	nop			;88be
	jp m,0e006h		;88bf
	rrca			;88c2
	ret po			;88c3
	rst 38h			;88c4
	nop			;88c5
	add a,b			;88c6
	ld (hl),000h		;88c7
	rlca			;88c9
	inc e			;88ca
	ld b,c			;88cb
	rrca			;88cc
	ret po			;88cd
	rst 38h			;88ce
	nop			;88cf
	nop			;88d0
	ld (hl),a		;88d1
	nop			;88d2
	rst 38h			;88d3
	inc a			;88d4
	add a,c			;88d5
	rra			;88d6
	ret nz			;88d7
	cp 000h			;88d8
	nop			;88da
	rst 20h			;88db
	nop			;88dc
l88ddh:
	cp 038h			;88dd
	add a,d			;88df
	rra			;88e0
	ld b,b			;88e1
	call m,01001h		;88e2
	rst 0			;88e5
	nop			;88e6
	cp 020h			;88e7
	add a,c			;88e9
	ccf			;88ea
	add a,b			;88eb
	ret m			;88ec
	inc bc			;88ed
	jr c,l8873h		;88ee
	nop			;88f0
	xor l			;88f1
	nop			;88f2
	sbc a,l			;88f3
	rra			;88f4
	ret nz			;88f5
	ret p			;88f6
	rlca			;88f7
	ld a,b			;88f8
	inc bc			;88f9
	nop			;88fa
	ld (hl),l		;88fb
	nop			;88fc
	ld a,01fh		;88fd
	ld b,b			;88ff
	ret po			;8900
	ld c,0f8h		;8901
	inc bc			;8903
	nop			;8904
	ei			;8905
	nop			;8906
	rra			;8907
	ccf			;8908
l8909h:
	add a,b			;8909
	ret nz			;890a
	djnz l8909h		;890b
	ld bc,lda00h		;890d
	nop			;8910
	ld l,a			;8911
	ccf			;8912
	add a,b			;8913
	ret nz			;8914
	ld c,0fch		;8915
	ld bc,lf600h		;8917
	nop			;891a
	ld (hl),a		;891b
	rra			;891c
	ret nz			;891d
	add a,b			;891e
	ccf			;891f
	ld a,h			;8920
	ld bc,lbc00h		;8921
	nop			;8924
	jr c,l8946h		;8925
	ret nz			;8927
	nop			;8928
	ld a,a			;8929
	ld a,h			;892a
	ld bc,l8200h		;892b
	nop			;892e
	ld e,a			;892f
	rra			;8930
	ret nz			;8931
	nop			;8932
	ld a,(hl)		;8933
	call m,02001h		;8934
	adc a,(hl)		;8937
	nop			;8938
	rst 28h			;8939
	rra			;893a
	ret nz			;893b
	add a,b			;893c
	add hl,sp		;893d
	ld a,h			;893e
l893fh:
	ld bc,00c60h		;893f
	nop			;8942
	ld (hl),c		;8943
	ccf			;8944
	add a,b			;8945
l8946h:
	ret nz			;8946
	rlca			;8947
	inc a			;8948
	add a,c			;8949
	ld h,b			;894a
	inc c			;894b
	nop			;894c
	rrca			;894d
	ccf			;894e
	add a,b			;894f
	add a,b			;8950
	ccf			;8951
	inc a			;8952
	add a,c			;8953
	ld (hl),b		;8954
	add hl,bc		;8955
	nop			;8956
	add a,b			;8957
	ld a,a			;8958
	nop			;8959
	add a,b			;895a
	ld a,078h		;895b
	ld (bc),a		;895d
	ret p			;895e
	dec bc			;895f
	rlca			;8960
	or b			;8961
	rst 38h			;8962
	nop			;8963
	ret nz			;8964
	ld bc,08630h		;8965
	ret p			;8968
	inc bc			;8969
l896ah:
	inc bc			;896a
	ret m			;896b
	rst 38h			;896c
	nop			;896d
	ret po			;896e
	rrca			;896f
	ld a,b			;8970
	inc bc			;8971
	djnz $+9		;8972
	inc bc			;8974
	ret m			;8975
	rst 38h			;8976
	nop			;8977
	ret p			;8978
	nop			;8979
	call m,00001h		;897a
	ld h,a			;897d
	inc bc			;897e
	ret m			;897f
	rst 38h			;8980
	nop			;8981
	rst 38h			;8982
	nop			;8983
	ret z			;8984
	nop			;8985
	nop			;8986
	rst 20h			;8987
	rlca			;8988
	ret p			;8989
	rst 38h			;898a
	nop			;898b
	rst 38h			;898c
	nop			;898d
	add a,b			;898e
	scf			;898f
	nop			;8990
	rst 8			;8991
	rrca			;8992
	ret po			;8993
	rst 38h			;8994
	nop			;8995
	rst 38h			;8996
	nop			;8997
	nop			;8998
	ld l,a			;8999
	nop			;899a
	rst 8			;899b
	rra			;899c
	ret nz			;899d
	rst 38h			;899e
	nop			;899f
	rst 38h			;89a0
	nop			;89a1
	nop			;89a2
	ld l,a			;89a3
	jr nz,$-111		;89a4
	rra			;89a6
	ret nz			;89a7
	rst 38h			;89a8
	nop			;89a9
	rst 38h			;89aa
	nop			;89ab
	nop			;89ac
	ld l,a			;89ad
	jr nz,l893fh		;89ae
	ccf			;89b0
	add a,b			;89b1
	rst 38h			;89b2
	nop			;89b3
	rst 38h			;89b4
	nop			;89b5
	nop			;89b6
	ld l,a			;89b7
	ld (hl),b		;89b8
	rlca			;89b9
	ld a,a			;89ba
	nop			;89bb
	rst 38h			;89bc
	nop			;89bd
	rst 38h			;89be
	nop			;89bf
	sub b			;89c0
	nop			;89c1
	ret m			;89c2
	nop			;89c3
	rst 38h			;89c4
	nop			;89c5
	rst 38h			;89c6
	nop			;89c7
	ld b,005h		;89c8
	nop			;89ca
	xor h			;89cb
	adc a,e			;89cc
	rst 38h			;89cd
	nop			;89ce
	rst 38h			;89cf
	nop			;89d0
	rst 38h			;89d1
	nop			;89d2
	rst 38h			;89d3
	nop			;89d4
	rst 38h			;89d5
	nop			;89d6
	ret p			;89d7
	nop			;89d8
	ld b,b			;89d9
	nop			;89da
	rst 0			;89db
	nop			;89dc
	rrca			;89dd
	nop			;89de
	rst 38h			;89df
	nop			;89e0
	ret po			;89e1
	rrca			;89e2
	nop			;89e3
	cp a			;89e4
	ld (bc),a		;89e5
	jr c,l89e9h		;89e6
	ret p			;89e8
l89e9h:
	rst 38h			;89e9
	nop			;89ea
	ret nz			;89eb
	jr l89eeh		;89ec
l89eeh:
	ld a,h			;89ee
	nop			;89ef
	defb 0fdh,000h,09eh ;illegal sequence	;89f0
	ld a,a			;89f3
	nop			;89f4
	add a,b			;89f5
	scf			;89f6
	nop			;89f7
	ld h,e			;89f8
	nop			;89f9
	rst 38h			;89fa
	nop			;89fb
	ld b,e			;89fc
	ccf			;89fd
sub_89feh:
	add a,b			;89fe
	nop			;89ff
	ld l,l			;8a00
	nop			;8a01
	ld e,e			;8a02
	nop			;8a03
	and 000h		;8a04
	xor h			;8a06
	rra			;8a07
	ret nz			;8a08
	nop			;8a09
	ld l,(hl)		;8a0a
	nop			;8a0b
	cp l			;8a0c
	nop			;8a0d
	sbc a,d			;8a0e
	nop			;8a0f
	ld e,a			;8a10
	rrca			;8a11
	ld b,b			;8a12
	nop			;8a13
	ld a,a			;8a14
	nop			;8a15
	ld a,d			;8a16
	nop			;8a17
	ld a,h			;8a18
	nop			;8a19
	rst 38h			;8a1a
	rrca			;8a1b
	ret po			;8a1c
	nop			;8a1d
	ld a,a			;8a1e
	nop			;8a1f
	ld c,e			;8a20
	nop			;8a21
	defb 0fdh,000h,07fh ;illegal sequence	;8a22
	rrca			;8a25
	ret po			;8a26
	nop			;8a27
	ld a,a			;8a28
	nop			;8a29
	ld c,d			;8a2a
	nop			;8a2b
	ld a,h			;8a2c
	nop			;8a2d
	cp a			;8a2e
	rrca			;8a2f
	ret po			;8a30
	nop			;8a31
	ld (hl),b		;8a32
	nop			;8a33
	ld a,l			;8a34
	nop			;8a35
	ld a,e			;8a36
	nop			;8a37
	ld e,a			;8a38
	rrca			;8a39
	ret po			;8a3a
	add a,b			;8a3b
	cpl			;8a3c
	nop			;8a3d
	add a,d			;8a3e
	nop			;8a3f
l8a40h:
	push hl			;8a40
	nop			;8a41
	ld a,a			;8a42
	rra			;8a43
	ret nz			;8a44
	ret nz			;8a45
	rra			;8a46
	nop			;8a47
	call m,00f00h		;8a48
	nop			;8a4b
	cp a			;8a4c
	ccf			;8a4d
	add a,b			;8a4e
	add a,b			;8a4f
	ccf			;8a50
	nop			;8a51
	rst 38h			;8a52
	nop			;8a53
	cp c			;8a54
	nop			;8a55
	rra			;8a56
	ld a,a			;8a57
	nop			;8a58
	add a,b			;8a59
	ccf			;8a5a
	nop			;8a5b
	rst 38h			;8a5c
	nop			;8a5d
	add a,020h		;8a5e
	add a,(hl)		;8a60
	rst 38h			;8a61
	nop			;8a62
	nop			;8a63
	ld a,a			;8a64
	nop			;8a65
	rst 0			;8a66
	nop			;8a67
	sub 039h		;8a68
	add a,b			;8a6a
	rst 38h			;8a6b
l8a6ch:
	nop			;8a6c
	nop			;8a6d
	ld a,a			;8a6e
	nop			;8a6f
	ei			;8a70
	nop			;8a71
	sub 01fh		;8a72
	ld b,b			;8a74
	rst 38h			;8a75
	nop			;8a76
	nop			;8a77
	ld a,a			;8a78
	nop			;8a79
	adc a,a			;8a7a
	nop			;8a7b
	add a,c			;8a7c
	rra			;8a7d
	ld b,b			;8a7e
	rst 38h			;8a7f
	nop			;8a80
	nop			;8a81
	ld a,a			;8a82
	nop			;8a83
	nop			;8a84
	nop			;8a85
	ld d,(hl)		;8a86
	ccf			;8a87
	add a,b			;8a88
	rst 38h			;8a89
	nop			;8a8a
	add a,b			;8a8b
	jr c,l8a8eh		;8a8c
l8a8eh:
	add hl,de		;8a8e
	nop			;8a8f
	rst 10h			;8a90
	ccf			;8a91
	nop			;8a92
	rst 38h			;8a93
	nop			;8a94
	ret nz			;8a95
	inc bc			;8a96
	nop			;8a97
	call m,00c00h		;8a98
	rra			;8a9b
	ret nz			;8a9c
	rst 38h			;8a9d
	nop			;8a9e
	ret po			;8a9f
	rrca			;8aa0
	nop			;8aa1
	rst 30h			;8aa2
	nop			;8aa3
	ei			;8aa4
	rrca			;8aa5
	ret po			;8aa6
	rst 38h			;8aa7
	nop			;8aa8
	ret nz			;8aa9
	dec e			;8aaa
	nop			;8aab
	cp b			;8aac
	nop			;8aad
	dec b			;8aae
	rrca			;8aaf
	ret po			;8ab0
	rst 38h			;8ab1
l8ab2h:
	nop			;8ab2
	add a,d			;8ab3
	jr c,l8ab6h		;8ab4
l8ab6h:
	ld e,a			;8ab6
	nop			;8ab7
	call m,sub_7007h	;8ab8
	rst 38h			;8abb
	nop			;8abc
	add a,a			;8abd
	jr nc,l8a40h		;8abe
	rra			;8ac0
	ld bc,l83f4h		;8ac1
	jr c,$+1		;8ac4
	nop			;8ac6
	nop			;8ac7
	ld h,b			;8ac8
	ret nz			;8ac9
	rra			;8aca
	ld bc,l83f4h		;8acb
	jr c,$+1		;8ace
	nop			;8ad0
	nop			;8ad1
	ld h,a			;8ad2
	ld h,b			;8ad3
l8ad4h:
	ld c,003h		;8ad4
	jr z,$-61		;8ad6
	inc e			;8ad8
	rst 38h			;8ad9
	nop			;8ada
	nop			;8adb
	ld e,a			;8adc
	jr nz,l8a6ch		;8add
	inc bc			;8adf
	ret z			;8ae0
l8ae1h:
	ret po			;8ae1
	ld c,0ffh		;8ae2
	nop			;8ae4
	add a,b			;8ae5
	ccf			;8ae6
	jr nz,l8af4h		;8ae7
	inc bc			;8ae9
	ret pe			;8aea
	ret p			;8aeb
	ld b,0ffh		;8aec
	nop			;8aee
	add a,b			;8aef
	ld a,000h		;8af0
	rst 8			;8af2
	rlca			;8af3
l8af4h:
	ld (hl),b		;8af4
	pop af			;8af5
	nop			;8af6
	rst 38h			;8af7
	nop			;8af8
	nop			;8af9
	ld a,l			;8afa
	nop			;8afb
	rst 8			;8afc
	rlca			;8afd
l8afeh:
	ret p			;8afe
	ret po			;8aff
	ld c,07fh		;8b00
	nop			;8b02
	nop			;8b03
	ld h,e			;8b04
	nop			;8b05
	add a,a			;8b06
	rlca			;8b07
	or b			;8b08
	ret nz			;8b09
	rra			;8b0a
	ccf			;8b0b
	add a,b			;8b0c
	nop			;8b0d
	ld a,a			;8b0e
	nop			;8b0f
	ld c,b			;8b10
	rlca			;8b11
	jr nc,l8ad4h		;8b12
	rra			;8b14
	rra			;8b15
	ret nz			;8b16
	nop			;8b17
	ld a,(hl)		;8b18
	nop			;8b19
	adc a,087h		;8b1a
	jr nc,l8afeh		;8b1c
	rrca			;8b1e
	rra			;8b1f
	ret nz			;8b20
	add a,b			;8b21
	ld sp,l8600h		;8b22
	rst 0			;8b25
	djnz $-62		;8b26
	inc de			;8b28
	ccf			;8b29
	add a,b			;8b2a
	add a,b			;8b2b
	ld a,000h		;8b2c
	ld b,0c7h		;8b2e
	djnz l8ab2h		;8b30
	inc a			;8b32
	ccf			;8b33
	nop			;8b34
	ret nz			;8b35
	nop			;8b36
	nop			;8b37
	ld (010c7h),a		;8b38
	add a,b			;8b3b
	ccf			;8b3c
	ccf			;8b3d
	add a,b			;8b3e
	call m,00001h		;8b3f
	cp d			;8b42
	ex (sp),hl		;8b43
	ex af,af'		;8b44
	add a,b			;8b45
	rrca			;8b46
	ccf			;8b47
	add a,b			;8b48
	ret m			;8b49
	inc bc			;8b4a
	nop			;8b4b
	ret m			;8b4c
	pop hl			;8b4d
	inc c			;8b4e
	add a,b			;8b4f
	jr nc,l8bd1h		;8b50
	nop			;8b52
	ret m			;8b53
	inc bc			;8b54
	nop			;8b55
	call m,01803h		;8b56
	ret nz			;8b59
	ld e,0ffh		;8b5a
	nop			;8b5c
	ret m			;8b5d
	inc bc			;8b5e
	nop			;8b5f
	call m,sub_d007h	;8b60
	pop hl			;8b63
	nop			;8b64
	rst 38h			;8b65
	nop			;8b66
	call m,00001h		;8b67
	call m,sub_e002h	;8b6a
	ld a,a			;8b6d
	nop			;8b6e
	rst 38h			;8b6f
	nop			;8b70
	cp 000h			;8b71
	nop			;8b73
	cp 000h			;8b74
	ld a,l			;8b76
	ccf			;8b77
	add a,b			;8b78
	rst 38h			;8b79
	nop			;8b7a
	rst 38h			;8b7b
	nop			;8b7c
	nop			;8b7d
	ld a,(hl)		;8b7e
	nop			;8b7f
	ld a,(hl)		;8b80
	rra			;8b81
	ret nz			;8b82
	rst 38h			;8b83
	nop			;8b84
	rst 38h			;8b85
	nop			;8b86
	nop			;8b87
	ld a,(hl)		;8b88
	add a,b			;8b89
	ld a,01fh		;8b8a
	ret nz			;8b8c
	rst 38h			;8b8d
	nop			;8b8e
	rst 38h			;8b8f
	nop			;8b90
	add a,b			;8b91
	ld a,080h		;8b92
	ld a,01fh		;8b94
	ret nz			;8b96
	rst 38h			;8b97
	nop			;8b98
	rst 38h			;8b99
	nop			;8b9a
	pop bc			;8b9b
	inc e			;8b9c
	ret nz			;8b9d
	ld e,01fh		;8b9e
	ret nz			;8ba0
	rst 38h			;8ba1
	nop			;8ba2
	rst 38h			;8ba3
	nop			;8ba4
	ex (sp),hl		;8ba5
	nop			;8ba6
	ret po			;8ba7
	nop			;8ba8
	ccf			;8ba9
	nop			;8baa
	rst 38h			;8bab
	nop			;8bac
sub_8badh:
	ld a,(la8f9h)		;8bad
	cp 000h			;8bb0
	jp z,l8bdbh		;8bb2
	ld a,(l8bdah)		;8bb5
	inc a			;8bb8
	ld (l8bdah),a		;8bb9
	cp 002h			;8bbc
	ret nz			;8bbe
	ld a,000h		;8bbf
	ld (l8bdah),a		;8bc1
	ld a,(l8c48h)		;8bc4
	inc a			;8bc7
	ld (l8c48h),a		;8bc8
	ld (l8c56h),a		;8bcb
	cp 003h			;8bce
	ret nz			;8bd0
l8bd1h:
	ld a,001h		;8bd1
	ld (l8c48h),a		;8bd3
	ld (l8c56h),a		;8bd6
	ret			;8bd9
l8bdah:
	nop			;8bda
l8bdbh:
	ld a,001h		;8bdb
	ld (la8f9h),a		;8bdd
	ld a,(la6c8h)		;8be0
	cp 008h			;8be3
	jp z,l8bfdh		;8be5
	cp 009h			;8be8
	jp z,l8c1fh		;8bea
	cp 00ah			;8bed
	jp z,l8c08h		;8bef
	ld a,030h		;8bf2
	ld (l8c40h),a		;8bf4
	ld (l8c41h),a		;8bf7
	jp l8c15h		;8bfa
l8bfdh:
	ld a,070h		;8bfd
	ld (l8c40h),a		;8bff
	ld (l8c41h),a		;8c02
	jp l8c15h		;8c05
l8c08h:
	ld a,030h		;8c08
	ld (l8c40h),a		;8c0a
	ld a,048h		;8c0d
	ld (l8c41h),a		;8c0f
	jp l8c15h		;8c12
l8c15h:
	call sub_6dach		;8c15
	ld hl,l8c40h		;8c18
	ld (la6e8h),hl		;8c1b
	ret			;8c1e
l8c1fh:
	ld a,068h		;8c1f
	ld (l8c40h),a		;8c21
	ld a,048h		;8c24
	ld (l8c41h),a		;8c26
	ld a,070h		;8c29
	ld (l8c4eh),a		;8c2b
	ld a,0c0h		;8c2e
	ld (l8c4fh),a		;8c30
	call l8c15h		;8c33
	call sub_6dach		;8c36
	ld hl,l8c4eh		;8c39
	ld (la6e8h),hl		;8c3c
	ret			;8c3f
l8c40h:
	nop			;8c40
l8c41h:
	nop			;8c41
	nop			;8c42
	nop			;8c43
	nop			;8c44
	nop			;8c45
	nop			;8c46
	ld (bc),a		;8c47
l8c48h:
	ld bc,05c00h		;8c48
	adc a,h			;8c4b
	add a,c			;8c4c
	adc a,l			;8c4d
l8c4eh:
	nop			;8c4e
l8c4fh:
	nop			;8c4f
	nop			;8c50
	nop			;8c51
	nop			;8c52
	nop			;8c53
	nop			;8c54
	ld (bc),a		;8c55
l8c56h:
	ld bc,05c00h		;8c56
	adc a,h			;8c59
	add a,c			;8c5a
	adc a,l			;8c5b
	inc bc			;8c5c
	ld b,000h		;8c5d
	add a,b			;8c5f
	adc a,l			;8c60
	rst 28h			;8c61
	nop			;8c62
	rst 38h			;8c63
	nop			;8c64
	rst 38h			;8c65
	nop			;8c66
	rst 38h			;8c67
	nop			;8c68
l8c69h:
	cp 000h			;8c69
	rst 18h			;8c6b
	nop			;8c6c
	rst 0			;8c6d
	djnz $+1		;8c6e
	nop			;8c70
	rst 38h			;8c71
	nop			;8c72
	rst 38h			;8c73
	nop			;8c74
	call m,00f01h		;8c75
	jr nz,l8c69h		;8c78
	nop			;8c7a
	rst 30h			;8c7b
	nop			;8c7c
	ei			;8c7d
l8c7eh:
	nop			;8c7e
	rst 38h			;8c7f
	nop			;8c80
	call m,01f01h		;8c81
	nop			;8c84
	rst 38h			;8c85
	nop			;8c86
	ex (sp),hl		;8c87
	ex af,af'		;8c88
	pop af			;8c89
	inc b			;8c8a
	rst 38h			;8c8b
	nop			;8c8c
	cp 000h			;8c8d
	ccf			;8c8f
	add a,b			;8c90
	rst 38h			;8c91
l8c92h:
	nop			;8c92
	pop hl			;8c93
	ex af,af'		;8c94
	ei			;8c95
	nop			;8c96
	rst 38h			;8c97
	nop			;8c98
	cp 000h			;8c99
	ccf			;8c9b
	add a,b			;8c9c
	rst 38h			;8c9d
	nop			;8c9e
	ret po			;8c9f
	ld c,07fh		;8ca0
	nop			;8ca2
	rst 18h			;8ca3
	nop			;8ca4
	ret p			;8ca5
	ld bc,l803fh		;8ca6
	rst 38h			;8ca9
	nop			;8caa
	ret po			;8cab
	dec bc			;8cac
	ccf			;8cad
	add a,b			;8cae
	adc a,a			;8caf
	jr nz,l8c92h		;8cb0
	rrca			;8cb2
	ccf			;8cb3
	add a,b			;8cb4
	rst 38h			;8cb5
	nop			;8cb6
	ret p			;8cb7
	dec b			;8cb8
	rra			;8cb9
	ld b,b			;8cba
	add a,a			;8cbb
	jr nc,l8c7eh		;8cbc
	dec de			;8cbe
	ld a,a			;8cbf
	nop			;8cc0
	rst 38h			;8cc1
	nop			;8cc2
	ret m			;8cc3
	nop			;8cc4
	rra			;8cc5
	ld b,b			;8cc6
	add a,a			;8cc7
	jr nc,$-126		;8cc8
	ld (hl),0ffh		;8cca
	nop			;8ccc
	rst 38h			;8ccd
	nop			;8cce
	ret m			;8ccf
	ld (bc),a		;8cd0
	rrca			;8cd1
	ld h,b			;8cd2
	add a,a			;8cd3
	djnz $-125		;8cd4
	inc h			;8cd6
	rst 38h			;8cd7
	nop			;8cd8
	rst 38h			;8cd9
	nop			;8cda
	ret p			;8cdb
	ld b,00fh		;8cdc
	ld h,b			;8cde
	rrca			;8cdf
	ld h,b			;8ce0
	add a,c			;8ce1
	inc l			;8ce2
	cp a			;8ce3
	nop			;8ce4
	defb 0fdh,000h,0d0h ;illegal sequence	;8ce5
	inc b			;8ce8
	ld e,080h		;8ce9
	rrca			;8ceb
	and b			;8cec
	add a,e			;8ced
	jr z,$+33		;8cee
	ld b,b			;8cf0
	ret m			;8cf1
	ld (bc),a		;8cf2
	nop			;8cf3
	inc h			;8cf4
	ld e,0c0h		;8cf5
	rra			;8cf7
	ret nz			;8cf8
	nop			;8cf9
	ld (hl),h		;8cfa
	rra			;8cfb
	ld b,b			;8cfc
	call m,00000h		;8cfd
	jp (hl)			;8d00
	ld c,0e0h		;8d01
	dec sp			;8d03
	nop			;8d04
	nop			;8d05
	ld a,h			;8d06
	rra			;8d07
	ret nz			;8d08
	call m,00001h		;8d09
	sbc a,c			;8d0c
	inc b			;8d0d
	ld sp,l8431h		;8d0e
	nop			;8d11
	ld l,c			;8d12
	ccf			;8d13
	add a,b			;8d14
	cp 000h			;8d15
	nop			;8d17
	jr c,l8d1ah		;8d18
l8d1ah:
	ld e,d			;8d1a
	jr $-62			;8d1b
	nop			;8d1d
	ex de,hl		;8d1e
	ccf			;8d1f
	add a,b			;8d20
	ret m			;8d21
	nop			;8d22
	nop			;8d23
	ld (hl),h		;8d24
	nop			;8d25
	and e			;8d26
	inc e			;8d27
	pop bc			;8d28
	nop			;8d29
	ex (sp),hl		;8d2a
	ld a,a			;8d2b
	nop			;8d2c
	ret p			;8d2d
	ld b,000h		;8d2e
	ld e,h			;8d30
	nop			;8d31
	ld d,e			;8d32
	nop			;8d33
	pop hl			;8d34
	nop			;8d35
	ld b,a			;8d36
	rra			;8d37
	nop			;8d38
	ret m			;8d39
	inc bc			;8d3a
	nop			;8d3b
	ld c,(hl)		;8d3c
	nop			;8d3d
	inc hl			;8d3e
	nop			;8d3f
	ccf			;8d40
	nop			;8d41
	push bc			;8d42
	inc bc			;8d43
	ret po			;8d44
	ret p			;8d45
	dec b			;8d46
	nop			;8d47
	rlc b			;8d48
	adc a,l			;8d4a
	nop			;8d4b
	ld hl,(l8600h)		;8d4c
	ld bc,0e05ch		;8d4f
	ld b,000h		;8d52
	jp nz,l7b00h		;8d54
	nop			;8d57
	dec b			;8d58
	nop			;8d59
	dec c			;8d5a
	ld bc,l80f4h		;8d5b
	rra			;8d5e
	nop			;8d5f
	ret p			;8d60
	nop			;8d61
	ld l,d			;8d62
	nop			;8d63
	ld a,(bc)		;8d64
	nop			;8d65
	dec sp			;8d66
	nop			;8d67
	ld c,000h		;8d68
	ld e,e			;8d6a
	nop			;8d6b
	ld h,a			;8d6c
	nop			;8d6d
	or (hl)			;8d6e
	nop			;8d6f
	ld a,a			;8d70
	nop			;8d71
	ld d,l			;8d72
	nop			;8d73
	ld l,(hl)		;8d74
	and h			;8d75
	nop			;8d76
	sbc a,b			;8d77
	nop			;8d78
	ld c,c			;8d79
	nop			;8d7a
	adc a,h			;8d7b
	nop			;8d7c
	ld a,e			;8d7d
	nop			;8d7e
	sbc a,a			;8d7f
	nop			;8d80
	inc bc			;8d81
	ld b,000h		;8d82
	and l			;8d84
	adc a,(hl)		;8d85
	rst 38h			;8d86
	nop			;8d87
	rst 38h			;8d88
	nop			;8d89
	rst 18h			;8d8a
	nop			;8d8b
	defb 0fdh,000h,0ffh ;illegal sequence	;8d8c
	nop			;8d8f
	rst 38h			;8d90
l8d91h:
	nop			;8d91
	rst 38h			;8d92
	nop			;8d93
	cp a			;8d94
	nop			;8d95
	adc a,a			;8d96
	jr nz,l8d91h		;8d97
	ld (bc),a		;8d99
	rst 38h			;8d9a
	nop			;8d9b
	rst 38h			;8d9c
	nop			;8d9d
	rst 38h			;8d9e
	nop			;8d9f
	rra			;8da0
	ld b,b			;8da1
	rra			;8da2
	ld b,b			;8da3
	ret m			;8da4
	ld (bc),a		;8da5
	rst 38h			;8da6
	nop			;8da7
	rst 38h			;8da8
	nop			;8da9
	rst 38h			;8daa
	nop			;8dab
	cp a			;8dac
	nop			;8dad
	rra			;8dae
	ld b,b			;8daf
	ret m			;8db0
	inc bc			;8db1
	ccf			;8db2
	nop			;8db3
	cp a			;8db4
	nop			;8db5
	rst 38h			;8db6
	nop			;8db7
	rst 38h			;8db8
	nop			;8db9
	rrca			;8dba
	ld h,b			;8dbb
	call m,00701h		;8dbc
	ld b,b			;8dbf
	rra			;8dc0
	ld b,b			;8dc1
	rst 38h			;8dc2
	nop			;8dc3
	rst 38h			;8dc4
	nop			;8dc5
	adc a,a			;8dc6
	jr nz,l8e47h		;8dc7
	nop			;8dc9
	inc bc			;8dca
	ret m			;8dcb
	cp a			;8dcc
	nop			;8dcd
	rst 38h			;8dce
	nop			;8dcf
l8dd0h:
	rst 38h			;8dd0
	nop			;8dd1
	add a,010h		;8dd2
	scf			;8dd4
	add a,b			;8dd5
	ld bc,lff6ch		;8dd6
	nop			;8dd9
	rst 38h			;8dda
	nop			;8ddb
	rst 30h			;8ddc
	nop			;8ddd
	rst 0			;8dde
	djnz l8e44h		;8ddf
	ex af,af'		;8de1
	add a,c			;8de2
	inc l			;8de3
	rst 20h			;8de4
	nop			;8de5
	rst 38h			;8de6
	nop			;8de7
	ex (sp),hl		;8de8
	ex af,af'		;8de9
	add a,a			;8dea
	djnz l8dd0h		;8deb
	ex af,af'		;8ded
	inc bc			;8dee
	ld a,b			;8def
	jp lff18h		;8df0
	nop			;8df3
	ex (sp),hl		;8df4
	ex af,af'		;8df5
	rlca			;8df6
	ld (hl),b		;8df7
	jp nz,00708h		;8df8
	ret nc			;8dfb
	pop bc			;8dfc
	inc e			;8dfd
	rst 38h			;8dfe
	nop			;8dff
l8e00h:
	jp nz,00e18h		;8e00
	and b			;8e03
	ld b,020h		;8e04
	rlca			;8e06
	or b			;8e07
	pop hl			;8e08
	inc c			;8e09
	rst 38h			;8e0a
	nop			;8e0b
	add a,(hl)		;8e0c
	jr nc,$+14		;8e0d
	pop hl			;8e0f
	ld b,0f0h		;8e10
sub_8e12h:
	rrca			;8e12
	and b			;8e13
	pop hl			;8e14
	inc c			;8e15
	rst 38h			;8e16
	nop			;8e17
	adc a,h			;8e18
	ld hl,04218h		;8e19
	nop			;8e1c
	or c			;8e1d
	rlca			;8e1e
	or b			;8e1f
l8e20h:
	add a,b			;8e20
	ld a,(de)		;8e21
	rst 38h			;8e22
	nop			;8e23
	add a,h			;8e24
	ld sp,06500h		;8e25
	nop			;8e28
	xor 006h		;8e29
	ret nc			;8e2b
	nop			;8e2c
	ld a,d			;8e2d
	rst 38h			;8e2e
	nop			;8e2f
	add a,b			;8e30
	ld sp,03700h		;8e31
	nop			;8e34
	halt			;8e35
	nop			;8e36
	ld e,c			;8e37
	nop			;8e38
	jp c,000ffh		;8e39
	ret nz			;8e3c
	dec bc			;8e3d
	ld b,b			;8e3e
	dec de			;8e3f
	nop			;8e40
	call p,sub_ea00h	;8e41
l8e44h:
	nop			;8e44
	halt			;8e45
	rst 18h			;8e46
l8e47h:
	nop			;8e47
	ret nz			;8e48
	ld a,(de)		;8e49
	ret po			;8e4a
	dec bc			;8e4b
	nop			;8e4c
	jr c,l8e4fh		;8e4d
l8e4fh:
	dec h			;8e4f
	ld bc,08f6ch		;8e50
	jr nz,l8e55h		;8e53
l8e55h:
	ccf			;8e55
	ld (hl),b		;8e56
	ld bc,lbf00h		;8e57
	nop			;8e5a
	inc e			;8e5b
	inc bc			;8e5c
	ret m			;8e5d
	add a,h			;8e5e
	jr nz,l8e61h		;8e5f
l8e61h:
	defb 0ddh,000h,080h ;illegal sequence	;8e61
	nop			;8e64
	sbc a,c			;8e65
	nop			;8e66
	sub a			;8e67
	ld bc,lc0bch		;8e68
	dec de			;8e6b
	nop			;8e6c
	ld l,d			;8e6d
	nop			;8e6e
	add a,e			;8e6f
	nop			;8e70
	adc a,(hl)		;8e71
	nop			;8e72
	adc a,d			;8e73
	ld bc,le034h		;8e74
	dec c			;8e77
	nop			;8e78
	rst 8			;8e79
	nop			;8e7a
	rst 18h			;8e7b
	nop			;8e7c
	ld bc,0c800h		;8e7d
	nop			;8e80
	ld a,080h		;8e81
	ld d,000h		;8e83
	add a,e			;8e85
	nop			;8e86
	ld (hl),a		;8e87
	nop			;8e88
	ld (bc),a		;8e89
l8e8ah:
	nop			;8e8a
	ret p			;8e8b
	nop			;8e8c
	ld hl,(06f00h)		;8e8d
	nop			;8e90
	out (000h),a		;8e91
	ld c,l			;8e93
	nop			;8e94
	cp l			;8e95
	nop			;8e96
	sub 000h		;8e97
	sbc a,090h		;8e99
	nop			;8e9b
	inc l			;8e9c
	nop			;8e9d
	or d			;8e9e
	nop			;8e9f
	ld b,d			;8ea0
	nop			;8ea1
	add hl,hl		;8ea2
	nop			;8ea3
	ld hl,03a00h		;8ea4
	ret m			;8ea7
	xor b			;8ea8
	cp 000h			;8ea9
	jp z,l8ebbh		;8eab
	call sub_8eebh		;8eae
	call sub_8f0dh		;8eb1
	call sub_8efbh		;8eb4
	call sub_8f63h		;8eb7
	ret			;8eba
l8ebbh:
	ld a,001h		;8ebb
	ld (la8f8h),a		;8ebd
	ld de,l8f74h		;8ec0
	call sub_7e07h		;8ec3
	ld de,l8f80h		;8ec6
	call sub_7e07h		;8ec9
	ld a,040h		;8ecc
	ld (l8f74h),a		;8ece
	ld a,080h		;8ed1
	ld (l8f80h),a		;8ed3
	ld a,0e8h		;8ed6
	ld (l8f75h),a		;8ed8
	ld a,0e0h		;8edb
	ld (l8f81h),a		;8edd
	ld a,000h		;8ee0
	ld (l8ee9h),a		;8ee2
	ld (l8eeah),a		;8ee5
	ret			;8ee8
l8ee9h:
	nop			;8ee9
l8eeah:
	nop			;8eea
sub_8eebh:
	ld a,(l8f88h)		;8eeb
	inc a			;8eee
	ld (l8f88h),a		;8eef
	cp 003h			;8ef2
	ret nz			;8ef4
	ld a,001h		;8ef5
	ld (l8f88h),a		;8ef7
	ret			;8efa
sub_8efbh:
	ld iy,l8f80h		;8efb
	ld h,020h		;8eff
	ld l,018h		;8f01
	call sub_7d67h		;8f03
	ret nc			;8f06
	call la8adh		;8f07
	jp la8adh		;8f0a
sub_8f0dh:
	call sub_8f39h		;8f0d
	ld a,(l8ee9h)		;8f10
	cp 001h			;8f13
	jr z,l8f28h		;8f15
	ld a,(l8f75h)		;8f17
	sub 004h		;8f1a
	ld (l8f75h),a		;8f1c
	cp 008h			;8f1f
	ret nz			;8f21
	ld a,001h		;8f22
	ld (l8ee9h),a		;8f24
	ret			;8f27
l8f28h:
	ld a,(l8f75h)		;8f28
	add a,004h		;8f2b
	ld (l8f75h),a		;8f2d
	cp 0e0h			;8f30
	ret nz			;8f32
	ld a,000h		;8f33
	ld (l8ee9h),a		;8f35
	ret			;8f38
sub_8f39h:
	ld a,(l8eeah)		;8f39
	cp 001h			;8f3c
	jp z,l8f52h		;8f3e
	ld a,(l8f74h)		;8f41
	sub 004h		;8f44
	ld (l8f74h),a		;8f46
	cp 010h			;8f49
	ret nz			;8f4b
	ld a,001h		;8f4c
	ld (l8eeah),a		;8f4e
	ret			;8f51
l8f52h:
	ld a,(l8f74h)		;8f52
	add a,004h		;8f55
	ld (l8f74h),a		;8f57
	cp 040h			;8f5a
	ret nz			;8f5c
	ld a,000h		;8f5d
	ld (l8eeah),a		;8f5f
	ret			;8f62
sub_8f63h:
	ld a,(l8f74h)		;8f63
	add a,040h		;8f66
	ld (l8f80h),a		;8f68
	ld a,(l8f75h)		;8f6b
	sub 008h		;8f6e
	ld (l8f81h),a		;8f70
	ret			;8f73
l8f74h:
	nop			;8f74
l8f75h:
	nop			;8f75
	nop			;8f76
	nop			;8f77
	nop			;8f78
	nop			;8f79
	nop			;8f7a
	ld bc,00001h		;8f7b
	jr $-108		;8f7e
l8f80h:
	nop			;8f80
l8f81h:
	nop			;8f81
	nop			;8f82
	nop			;8f83
	nop			;8f84
	nop			;8f85
	nop			;8f86
	ld (bc),a		;8f87
l8f88h:
	ld bc,l8e00h		;8f88
	adc a,a			;8f8b
	out (090h),a		;8f8c
	dec b			;8f8e
	inc b			;8f8f
	nop			;8f90
	jp nc,lff90h		;8f91
	nop			;8f94
	ret po			;8f95
	dec c			;8f96
	ld a,a			;8f97
	nop			;8f98
	rst 38h			;8f99
	nop			;8f9a
	rst 38h			;8f9b
	nop			;8f9c
	ret po			;8f9d
	rrca			;8f9e
	ld a,a			;8f9f
	nop			;8fa0
	rst 38h			;8fa1
	nop			;8fa2
	rst 38h			;8fa3
	nop			;8fa4
	ret po			;8fa5
	rrca			;8fa6
	ld a,a			;8fa7
	nop			;8fa8
	rst 38h			;8fa9
	nop			;8faa
	rst 38h			;8fab
	nop			;8fac
	ret po			;8fad
	dec c			;8fae
	ld a,a			;8faf
	nop			;8fb0
	rst 38h			;8fb1
	nop			;8fb2
	rst 38h			;8fb3
	nop			;8fb4
	ret po			;8fb5
	dec c			;8fb6
	ld a,a			;8fb7
	nop			;8fb8
	rst 38h			;8fb9
	nop			;8fba
	rst 38h			;8fbb
	nop			;8fbc
	ret po			;8fbd
	add hl,bc		;8fbe
	ld a,a			;8fbf
	nop			;8fc0
	rst 38h			;8fc1
	nop			;8fc2
	rst 38h			;8fc3
	nop			;8fc4
	ret nz			;8fc5
	rra			;8fc6
	ccf			;8fc7
	add a,b			;8fc8
	rst 38h			;8fc9
	nop			;8fca
	rst 38h			;8fcb
	nop			;8fcc
	add a,b			;8fcd
	dec h			;8fce
	rra			;8fcf
	ld b,b			;8fd0
	rst 38h			;8fd1
	nop			;8fd2
	rst 38h			;8fd3
	nop			;8fd4
	ret nz			;8fd5
	rra			;8fd6
	ccf			;8fd7
	add a,b			;8fd8
	rst 38h			;8fd9
	nop			;8fda
	call m,00000h		;8fdb
	ld (lc01fh),hl		;8fde
	rst 38h			;8fe1
	nop			;8fe2
	ret p			;8fe3
	inc bc			;8fe4
	nop			;8fe5
	sbc a,a			;8fe6
	inc sp			;8fe7
	add a,b			;8fe8
	rst 38h			;8fe9
	nop			;8fea
	ret po			;8feb
	inc c			;8fec
	nop			;8fed
	dec bc			;8fee
	jr nz,l8ffdh		;8fef
	rst 38h			;8ff1
	nop			;8ff2
	jp 00010h		;8ff3
	dec bc			;8ff6
	jr nc,l8ffah		;8ff7
	ld a,a			;8ff9
l8ffah:
	nop			;8ffa
	adc a,(hl)		;8ffb
	nop			;8ffc
l8ffdh:
	nop			;8ffd
	rr b			;8ffe
sub_9000h:
	ld b,b			;9000
	ccf			;9001
	nop			;9002
	rra			;9003
	ld b,b			;9004
	nop			;9005
	ld h,e			;9006
	nop			;9007
	ld h,h			;9008
	rra			;9009
	ld b,b			;900a
	or c			;900b
	nop			;900c
l900dh:
	nop			;900d
	ld a,e			;900e
	nop			;900f
	ld (000bfh),hl		;9010
	ret po			;9013
	ld c,000h		;9014
	ei			;9016
	nop			;9017
	ld l,(hl)		;9018
	rst 38h			;9019
	nop			;901a
	ret nz			;901b
	rla			;901c
	nop			;901d
	ei			;901e
	ld bc,lff54h		;901f
	nop			;9022
	ret po			;9023
	inc bc			;9024
	nop			;9025
	cp e			;9026
	ld bc,l7f6ch		;9027
	nop			;902a
	ret nz			;902b
	rlca			;902c
	nop			;902d
	ei			;902e
	nop			;902f
	ld e,h			;9030
	ccf			;9031
	add a,b			;9032
	add a,b			;9033
	ld a,000h		;9034
	ei			;9036
	nop			;9037
	ld l,(hl)		;9038
	rra			;9039
	ret nz			;903a
	nop			;903b
	ld e,l			;903c
	nop			;903d
	ei			;903e
	nop			;903f
	ld e,a			;9040
	rra			;9041
	ret nz			;9042
	add a,b			;9043
	dec e			;9044
	nop			;9045
	rst 30h			;9046
	nop			;9047
	xor a			;9048
	ccf			;9049
	add a,b			;904a
	ret nz			;904b
	rrca			;904c
	nop			;904d
	rst 28h			;904e
	nop			;904f
	rst 18h			;9050
	ld a,a			;9051
	nop			;9052
	add a,b			;9053
	ccf			;9054
	nop			;9055
	call c,06f00h		;9056
	rra			;9059
	add a,b			;905a
	add a,b			;905b
	dec sp			;905c
	nop			;905d
	in a,(000h)		;905e
	xor a			;9060
	rrca			;9061
	and b			;9062
	nop			;9063
	ld e,e			;9064
	nop			;9065
	call nc,06f00h		;9066
	rra			;9069
	ret nz			;906a
	add a,b			;906b
	dec de			;906c
	nop			;906d
	rst 10h			;906e
	nop			;906f
	dec l			;9070
	ccf			;9071
	add a,b			;9072
	ret nz			;9073
	dec e			;9074
	nop			;9075
	add a,000h		;9076
	adc a,l			;9078
	rra			;9079
	nop			;907a
	add a,b			;907b
	dec a			;907c
	nop			;907d
	defb 0fdh,000h,07fh ;illegal sequence	;907e
	rrca			;9081
	and b			;9082
	add a,b			;9083
	ccf			;9084
	nop			;9085
	cp 000h			;9086
	cp a			;9088
	rra			;9089
	ret nz			;908a
	nop			;908b
	ld h,(hl)		;908c
	nop			;908d
	defb 0fdh,000h,07ch ;illegal sequence	;908e
	ccf			;9091
	nop			;9092
	add a,b			;9093
	inc hl			;9094
	nop			;9095
	cp d			;9096
	nop			;9097
	or 03fh			;9098
	add a,b			;909a
	ret nz			;909b
	rlca			;909c
	nop			;909d
	push af			;909e
	nop			;909f
	ld l,a			;90a0
	ld a,a			;90a1
	nop			;90a2
	ret po			;90a3
	ld c,000h		;90a4
	jp m,lf800h		;90a6
	rst 38h			;90a9
	nop			;90aa
	pop hl			;90ab
	ex af,af'		;90ac
	nop			;90ad
	ld (hl),l		;90ae
	ld bc,lffb0h		;90af
	nop			;90b2
	pop af			;90b3
	inc b			;90b4
	ex af,af'		;90b5
	ld h,e			;90b6
	ld b,c			;90b7
	inc d			;90b8
	rst 38h			;90b9
	nop			;90ba
	ei			;90bb
	nop			;90bc
	jr l9101h		;90bd
	ex (sp),hl		;90bf
	ex af,af'		;90c0
	rst 38h			;90c1
	nop			;90c2
	rst 38h			;90c3
	nop			;90c4
	adc a,h			;90c5
	ld hl,00077h		;90c6
	rst 38h			;90c9
	nop			;90ca
	rst 38h			;90cb
	nop			;90cc
	sbc a,000h		;90cd
	rst 38h			;90cf
	nop			;90d0
	rst 38h			;90d1
	nop			;90d2
	dec b			;90d3
	inc b			;90d4
	nop			;90d5
	rla			;90d6
	sub d			;90d7
	rst 38h			;90d8
	nop			;90d9
	ret po			;90da
	dec c			;90db
	ld a,a			;90dc
	nop			;90dd
	rst 38h			;90de
	nop			;90df
	rst 38h			;90e0
	nop			;90e1
	ret po			;90e2
	rrca			;90e3
	ld a,a			;90e4
	nop			;90e5
	rst 38h			;90e6
	nop			;90e7
	rst 38h			;90e8
	nop			;90e9
	ret po			;90ea
	rrca			;90eb
	ld a,a			;90ec
	nop			;90ed
	rst 38h			;90ee
	nop			;90ef
	rst 38h			;90f0
	nop			;90f1
	ret po			;90f2
	add hl,bc		;90f3
	ld a,a			;90f4
	nop			;90f5
	rst 38h			;90f6
	nop			;90f7
	rst 38h			;90f8
l90f9h:
	nop			;90f9
	ret nz			;90fa
	rra			;90fb
	ccf			;90fc
	add a,b			;90fd
	rst 38h			;90fe
	nop			;90ff
	rst 38h			;9100
l9101h:
	nop			;9101
	add a,b			;9102
	dec h			;9103
	rra			;9104
	ld b,b			;9105
	rst 38h			;9106
	nop			;9107
	rst 38h			;9108
	nop			;9109
	ret nz			;910a
	rra			;910b
	ccf			;910c
	add a,b			;910d
	rst 38h			;910e
	nop			;910f
	rst 38h			;9110
	nop			;9111
	add a,b			;9112
	ld (lc01fh),hl		;9113
	rst 38h			;9116
	nop			;9117
	rst 38h			;9118
	nop			;9119
	ret nz			;911a
	rra			;911b
	inc sp			;911c
	add a,b			;911d
	rst 38h			;911e
	nop			;911f
	rst 38h			;9120
	nop			;9121
	ret po			;9122
	dec bc			;9123
	ld h,c			;9124
	inc c			;9125
	rst 38h			;9126
	nop			;9127
	call c,06000h		;9128
	dec bc			;912b
	ld b,b			;912c
	ld (bc),a		;912d
	rst 38h			;912e
	nop			;912f
	adc a,b			;9130
	inc hl			;9131
	nop			;9132
	add a,e			;9133
	ld bc,0ff10h		;9134
	nop			;9137
	djnz l917ah		;9138
	nop			;913a
	cp e			;913b
	nop			;913c
	ld c,b			;913d
	rst 38h			;913e
	nop			;913f
	and b			;9140
	rrca			;9141
	nop			;9142
	ei			;9143
	nop			;9144
	ld a,c			;9145
	ld a,a			;9146
	nop			;9147
	ret nz			;9148
	rla			;9149
	nop			;914a
	di			;914b
	nop			;914c
	ld l,h			;914d
	ccf			;914e
	add a,b			;914f
	ret po			;9150
	inc bc			;9151
	nop			;9152
	in a,(000h)		;9153
	ld d,l			;9155
	ccf			;9156
	add a,b			;9157
	ret po			;9158
	inc bc			;9159
	nop			;915a
	ei			;915b
	nop			;915c
	ld l,a			;915d
	ld a,a			;915e
	nop			;915f
	ret nz			;9160
	rra			;9161
	nop			;9162
	ei			;9163
	nop			;9164
	ld e,a			;9165
	ld a,a			;9166
	nop			;9167
	add a,b			;9168
	ccf			;9169
	nop			;916a
	ei			;916b
	nop			;916c
	ld l,d			;916d
	rst 18h			;916e
	nop			;916f
	nop			;9170
	ld c,a			;9171
	nop			;9172
	ei			;9173
	nop			;9174
	ld e,e			;9175
	rrca			;9176
	jr nz,l90f9h		;9177
	rra			;9179
l917ah:
	nop			;917a
	rst 30h			;917b
	nop			;917c
	xor a			;917d
	rra			;917e
	ret nz			;917f
	add a,b			;9180
	ccf			;9181
	nop			;9182
	rst 28h			;9183
	nop			;9184
l9185h:
	rst 18h			;9185
	rra			;9186
	ret nz			;9187
	nop			;9188
	ld e,a			;9189
	nop			;918a
	call c,06f00h		;918b
	ccf			;918e
	add a,b			;918f
	add a,b			;9190
	rra			;9191
	nop			;9192
	in a,(000h)		;9193
	xor a			;9195
	rra			;9196
	add a,b			;9197
	ret nz			;9198
	rra			;9199
	nop			;919a
	call nc,06f00h		;919b
	rrca			;919e
	and b			;919f
	ret nz			;91a0
	dec e			;91a1
	nop			;91a2
	rst 10h			;91a3
	nop			;91a4
	cpl			;91a5
	rra			;91a6
	ret nz			;91a7
	add a,b			;91a8
	dec a			;91a9
	nop			;91aa
	add a,000h		;91ab
	adc a,a			;91ad
	rra			;91ae
	ret nz			;91af
	nop			;91b0
	ld a,a			;91b1
	nop			;91b2
	defb 0fdh,000h,07fh ;illegal sequence	;91b3
	ccf			;91b6
	add a,b			;91b7
	nop			;91b8
	ld c,(hl)		;91b9
	nop			;91ba
	cp 000h			;91bb
	cp a			;91bd
	rra			;91be
	nop			;91bf
	or b			;91c0
	ld b,000h		;91c1
	defb 0fdh,000h,07fh ;illegal sequence	;91c3
	rrca			;91c6
	and b			;91c7
	ret po			;91c8
	rrca			;91c9
	nop			;91ca
	ld a,d			;91cb
	nop			;91cc
	rst 38h			;91cd
	rra			;91ce
	ret nz			;91cf
	ret nz			;91d0
	rra			;91d1
	nop			;91d2
	sub l			;91d3
	nop			;91d4
	ld a,a			;91d5
l91d6h:
	ccf			;91d6
	nop			;91d7
	add a,b			;91d8
	ld hl,lfa00h		;91d9
	nop			;91dc
	cp a			;91dd
	ld a,a			;91de
	nop			;91df
	ret nz			;91e0
	inc de			;91e1
	nop			;91e2
	push af			;91e3
	nop			;91e4
	ld a,c			;91e5
	ccf			;91e6
	add a,b			;91e7
	ret pe			;91e8
	inc bc			;91e9
	nop			;91ea
	ld hl,(la006h)		;91eb
	ld a,a			;91ee
	nop			;91ef
	cp b			;91f0
	ld (bc),a		;91f1
	ret nz			;91f2
	inc c			;91f3
	rlca			;91f4
	jr nc,l91d6h		;91f5
	nop			;91f7
	dec c			;91f8
	ld b,b			;91f9
	ret p			;91fa
	ld b,0c2h		;91fb
sub_91fdh:
	jr $+17			;91fd
	jr nz,l9185h		;91ff
	jr nc,$+123		;9201
	nop			;9203
	ret po			;9204
	ld bc,l801fh		;9205
	ret z			;9208
	inc bc			;9209
	ccf			;920a
	add a,b			;920b
l920ch:
	ret po			;920c
	ld c,07fh		;920d
	nop			;920f
	call m,07f00h		;9210
	nop			;9213
	pop af			;9214
	nop			;9215
	rst 38h			;9216
	nop			;9217
	ex af,af'		;9218
	inc bc			;9219
	nop			;921a
	sbc a,h			;921b
	sub e			;921c
	rst 38h			;921d
	nop			;921e
	nop			;921f
	ld a,a			;9220
	rrca			;9221
	ret po			;9222
	rst 38h			;9223
	nop			;9224
	nop			;9225
	ld a,l			;9226
	rrca			;9227
	jr nz,$+1		;9228
	nop			;922a
	nop			;922b
	ld a,(hl)		;922c
	rrca			;922d
	and b			;922e
	rst 38h			;922f
	nop			;9230
	nop			;9231
	ld a,a			;9232
	rra			;9233
	ld b,b			;9234
	rst 38h			;9235
	nop			;9236
	nop			;9237
	ld a,(hl)		;9238
	rra			;9239
	ld b,b			;923a
	rst 38h			;923b
	nop			;923c
	nop			;923d
	ld a,l			;923e
	rra			;923f
	ld b,b			;9240
	rst 38h			;9241
	nop			;9242
	nop			;9243
	ld a,(hl)		;9244
	rra			;9245
	ld b,b			;9246
	cp 000h			;9247
	nop			;9249
	defb 0fdh,01fh,040h ;illegal sequence	;924a
	cp 000h			;924d
	nop			;924f
	cp 01fh			;9250
	ld b,b			;9252
	cp 000h			;9253
	nop			;9255
	call m,l803fh		;9256
	cp 000h			;9259
	nop			;925b
	cp 03fh			;925c
	add a,b			;925e
	cp 000h			;925f
	nop			;9261
	call m,l803fh		;9262
	cp 000h			;9265
	nop			;9267
	cp 03fh			;9268
l926ah:
	add a,b			;926a
	cp 000h			;926b
	nop			;926d
	call m,l803fh		;926e
	cp 000h			;9271
	nop			;9273
	ld sp,hl		;9274
	ld a,a			;9275
	nop			;9276
	cp 000h			;9277
	nop			;9279
	defb 0fdh,07fh,000h ;illegal sequence	;927a
	cp 000h			;927d
	nop			;927f
	ld sp,hl		;9280
	ld a,a			;9281
	nop			;9282
	cp 000h			;9283
	nop			;9285
	defb 0fdh,07fh,000h ;illegal sequence	;9286
	cp 000h			;9289
	nop			;928b
	ld sp,hl		;928c
	ld a,a			;928d
	nop			;928e
	cp 000h			;928f
	nop			;9291
	jp p,000ffh		;9292
	cp 000h			;9295
	nop			;9297
	jp m,000ffh		;9298
	call m,00001h		;929b
	jp p,000ffh		;929e
	call m,00001h		;92a1
	jp m,000ffh		;92a4
	call m,00001h		;92a7
	jp m,000ffh		;92aa
	call m,00001h		;92ad
	jp p,000ffh		;92b0
	call m,00101h		;92b3
	call po,000ffh		;92b6
	call m,00101h		;92b9
	call p,000ffh		;92bc
	call m,00101h		;92bf
	call po,000ffh		;92c2
	call m,00101h		;92c5
	call p,000ffh		;92c8
	call m,00101h		;92cb
	call po,000ffh		;92ce
	call m,00301h		;92d1
	ret z			;92d4
	rst 38h			;92d5
	nop			;92d6
	call m,00301h		;92d7
	ret pe			;92da
	rst 38h			;92db
	nop			;92dc
	call m,00301h		;92dd
	ret z			;92e0
	rst 38h			;92e1
	nop			;92e2
	call m,00301h		;92e3
	ret pe			;92e6
	rst 38h			;92e7
	nop			;92e8
	ret m			;92e9
	inc bc			;92ea
	inc bc			;92eb
	ret z			;92ec
	rst 38h			;92ed
	nop			;92ee
	ret m			;92ef
	inc bc			;92f0
	inc bc			;92f1
	xor b			;92f2
	rst 38h			;92f3
	nop			;92f4
	ret m			;92f5
	inc bc			;92f6
	rlca			;92f7
	ret nc			;92f8
	rst 38h			;92f9
	nop			;92fa
	ret m			;92fb
	inc bc			;92fc
	rlca			;92fd
	sub b			;92fe
	rst 38h			;92ff
	nop			;9300
	ret m			;9301
	inc bc			;9302
	rlca			;9303
	ret nc			;9304
	rst 38h			;9305
	nop			;9306
	ret m			;9307
	inc bc			;9308
	rlca			;9309
	sub b			;930a
	rst 38h			;930b
	nop			;930c
	ret m			;930d
	inc bc			;930e
	rlca			;930f
	ld d,b			;9310
	rst 38h			;9311
	nop			;9312
	ret m			;9313
	inc bc			;9314
	rrca			;9315
	and b			;9316
	rst 38h			;9317
	nop			;9318
	ret m			;9319
	inc bc			;931a
	rrca			;931b
	jr nz,$+1		;931c
	nop			;931e
	ret m			;931f
	inc bc			;9320
	rrca			;9321
	and b			;9322
	rst 38h			;9323
	nop			;9324
	ret m			;9325
	inc bc			;9326
	rrca			;9327
	jr nz,$+1		;9328
	nop			;932a
	ret m			;932b
	inc bc			;932c
	rrca			;932d
	and b			;932e
	rst 38h			;932f
	nop			;9330
	ret m			;9331
	inc bc			;9332
	rra			;9333
	ld b,b			;9334
	rst 38h			;9335
	nop			;9336
	ret m			;9337
	inc bc			;9338
	rra			;9339
	ld b,b			;933a
	rst 38h			;933b
	nop			;933c
	ret p			;933d
	ld b,01fh		;933e
	ld b,b			;9340
	rst 38h			;9341
	nop			;9342
	ret p			;9343
	rlca			;9344
	rra			;9345
	ld b,b			;9346
	rst 38h			;9347
	nop			;9348
	ret p			;9349
	ld b,01fh		;934a
	ld b,b			;934c
	rst 38h			;934d
	nop			;934e
	ret p			;934f
	rlca			;9350
	rra			;9351
	ld b,b			;9352
	rst 38h			;9353
	nop			;9354
	ret p			;9355
	ld b,03fh		;9356
	add a,b			;9358
	rst 38h			;9359
	nop			;935a
	ret p			;935b
	ld b,03fh		;935c
	add a,b			;935e
	rst 38h			;935f
	nop			;9360
	ret p			;9361
	ld b,03fh		;9362
	add a,b			;9364
	rst 38h			;9365
	nop			;9366
	ret po			;9367
	dec c			;9368
	ld a,a			;9369
	nop			;936a
	rst 38h			;936b
	nop			;936c
	ret nz			;936d
	djnz $+65		;936e
	add a,b			;9370
	rst 38h			;9371
	nop			;9372
	add a,b			;9373
	cpl			;9374
	rra			;9375
	ld b,b			;9376
	rst 38h			;9377
	nop			;9378
	add a,b			;9379
	add hl,hl		;937a
	rra			;937b
	ld b,b			;937c
	rst 38h			;937d
	nop			;937e
	add a,b			;937f
	cpl			;9380
	rra			;9381
	ld b,b			;9382
	rst 38h			;9383
	nop			;9384
	ret nz			;9385
	djnz $+65		;9386
	add a,b			;9388
	rst 38h			;9389
	nop			;938a
	ret po			;938b
	rrca			;938c
	ld a,a			;938d
	nop			;938e
	rst 38h			;938f
	nop			;9390
	ret nz			;9391
	djnz $+65		;9392
	add a,b			;9394
	rst 38h			;9395
	nop			;9396
	ret po			;9397
	rrca			;9398
	ld a,a			;9399
	nop			;939a
	rst 38h			;939b
	nop			;939c
sub_939dh:
	ld a,(la8f7h)		;939d
	cp 000h			;93a0
	jp z,l93b9h		;93a2
	cp 0ffh			;93a5
	jp z,l93e1h		;93a7
	call sub_93f6h		;93aa
	call sub_9465h		;93ad
	call sub_9434h		;93b0
	call sub_9443h		;93b3
	ret			;93b6
l93b7h:
	nop			;93b7
l93b8h:
	nop			;93b8
l93b9h:
	ld a,001h		;93b9
	ld (la8f7h),a		;93bb
	ld a,040h		;93be
	ld (l94f9h),a		;93c0
	ld a,080h		;93c3
	ld (l94fah),a		;93c5
	ld ix,l94f9h		;93c8
	call sub_75eeh		;93cc
	ld a,000h		;93cf
	ld (l93b7h),a		;93d1
	ld (l93b8h),a		;93d4
	call sub_6dach		;93d7
	ld hl,l94f9h		;93da
	ld (la6e8h),hl		;93dd
	ret			;93e0
l93e1h:
	ld a,(l94f9h)		;93e1
	add a,004h		;93e4
	ld (l94f9h),a		;93e6
	cp 0c0h			;93e9
	ret nz			;93eb
	ld a,000h		;93ec
	ld (la8f7h),a		;93ee
	call sub_6dd2h		;93f1
	ret			;93f4
l93f5h:
	nop			;93f5
sub_93f6h:
	call sub_9418h		;93f6
	ld a,(l93f5h)		;93f9
	inc a			;93fc
	ld (l93f5h),a		;93fd
	cp 002h			;9400
	ret nz			;9402
	ld a,000h		;9403
	ld (l93f5h),a		;9405
	ld a,(l9501h)		;9408
	inc a			;940b
	ld (l9501h),a		;940c
	cp 004h			;940f
	ret nz			;9411
	ld a,001h		;9412
	ld (l9501h),a		;9414
	ret			;9417
sub_9418h:
	ld a,(l94fah)		;9418
	ld b,a			;941b
	ld a,(05d2bh)		;941c
	and a			;941f
	sbc a,b			;9420
	jp c,l942ch		;9421
	ld ix,l94f9h		;9424
	call sub_7609h		;9428
	ret			;942b
l942ch:
	ld ix,l94f9h		;942c
	call sub_75eeh		;9430
	ret			;9433
sub_9434h:
	ld iy,l94f9h		;9434
	ld h,018h		;9438
	ld l,020h		;943a
	call sub_7d67h		;943c
	jp c,la8adh		;943f
	ret			;9442
sub_9443h:
	ld iy,l94f9h		;9443
	ld h,018h		;9447
	ld l,020h		;9449
	call sub_7d75h		;944b
	ret nc			;944e
	ld a,(la6ach)		;944f
	inc a			;9452
	ld b,a			;9453
	ld a,(l93b7h)		;9454
	add a,b			;9457
	ld (l93b7h),a		;9458
	and a			;945b
	sbc a,009h		;945c
	ret c			;945e
	ld a,0ffh		;945f
	ld (la8f7h),a		;9461
	ret			;9464
sub_9465h:
	ld a,(l93b8h)		;9465
	cp 001h			;9468
	jp z,l94c1h		;946a
	ld a,r			;946d
	and 07fh		;946f
	cp 000h			;9471
	jp z,l94bbh		;9473
	bit 0,a			;9476
	jp z,l948bh		;9478
	bit 1,a			;947b
	jp z,l9497h		;947d
	bit 2,a			;9480
	jp z,l94a3h		;9482
	bit 3,a			;9485
	jp z,l94afh		;9487
	ret			;948a
l948bh:
	ld a,(l94f9h)		;948b
	cp 098h			;948e
	ret z			;9490
	add a,004h		;9491
	ld (l94f9h),a		;9493
	ret			;9496
l9497h:
	ld a,(l94f9h)		;9497
	cp 040h			;949a
	ret z			;949c
	sub 004h		;949d
	ld (l94f9h),a		;949f
	ret			;94a2
l94a3h:
	ld a,(l94fah)		;94a3
	cp 000h			;94a6
	ret z			;94a8
	sub 004h		;94a9
	ld (l94fah),a		;94ab
	ret			;94ae
l94afh:
	ld a,(l94fah)		;94af
	cp 0d8h			;94b2
	ret z			;94b4
	add a,004h		;94b5
	ld (l94fah),a		;94b7
	ret			;94ba
l94bbh:
	ld a,001h		;94bb
	ld (l93b8h),a		;94bd
	ret			;94c0
l94c1h:
	ld a,(l94f9h)		;94c1
	ld b,a			;94c4
	ld a,(05d2ah)		;94c5
	and a			;94c8
	sbc a,b			;94c9
	jr c,l94d5h		;94ca
	ld a,b			;94cc
	add a,004h		;94cd
	ld (l94f9h),a		;94cf
	jp l94dbh		;94d2
l94d5h:
	ld a,b			;94d5
	sub 004h		;94d6
	ld (l94f9h),a		;94d8
l94dbh:
	ld a,(l94fah)		;94db
	ld b,a			;94de
	ld a,(05d2bh)		;94df
	and a			;94e2
	sbc a,b			;94e3
	jr c,l94edh		;94e4
	ld a,b			;94e6
	add a,004h		;94e7
	ld (l94fah),a		;94e9
	ret			;94ec
l94edh:
	ld a,b			;94ed
	and a			;94ee
	sbc a,008h		;94ef
	ret c			;94f1
	ld a,b			;94f2
	sub 008h		;94f3
l94f5h:
	ld (l94fah),a		;94f5
	ret			;94f8
l94f9h:
	nop			;94f9
l94fah:
	nop			;94fa
	nop			;94fb
	nop			;94fc
sub_94fdh:
	nop			;94fd
	nop			;94fe
	nop			;94ff
	inc bc			;9500
l9501h:
	ld bc,00900h		;9501
	sub l			;9504
	ld c,(hl)		;9505
	sub (hl)		;9506
	sub e			;9507
	sub a			;9508
	inc b			;9509
	dec b			;950a
	nop			;950b
	ld c,l			;950c
	sub (hl)		;950d
	rst 38h			;950e
	nop			;950f
	cp a			;9510
	nop			;9511
	rst 30h			;9512
	nop			;9513
	rst 38h			;9514
	nop			;9515
	rst 38h			;9516
	nop			;9517
	rst 38h			;9518
	nop			;9519
	rra			;951a
	ld b,b			;951b
	ex (sp),hl		;951c
	ex af,af'		;951d
	rst 38h			;951e
	nop			;951f
	rst 38h			;9520
	nop			;9521
	cp 000h			;9522
	ccf			;9524
	add a,b			;9525
	pop af			;9526
	inc b			;9527
	rst 38h			;9528
	nop			;9529
	rst 38h			;952a
	nop			;952b
	cp 000h			;952c
	ccf			;952e
	add a,b			;952f
	ret p			;9530
	ld b,0ffh		;9531
	nop			;9533
	ld a,a			;9534
	nop			;9535
	call m,03e01h		;9536
	add a,b			;9539
	ld (hl),b		;953a
	ld b,0feh		;953b
	nop			;953d
	ccf			;953e
	add a,b			;953f
	call m,01001h		;9540
	pop bc			;9543
	jr nz,$-112		;9544
	rst 38h			;9546
	nop			;9547
	rra			;9548
l9549h:
	ld b,b			;9549
	call m,00001h		;954a
	rst 8			;954d
	ld bc,lfccch		;954e
l9551h:
	nop			;9551
	rra			;9552
	ld b,b			;9553
	call p,00001h		;9554
	rst 30h			;9557
	ld bc,0f8bch		;9558
	inc bc			;955b
	rrca			;955c
	jr nz,$-28		;955d
	ex af,af'		;955f
	nop			;9560
	rst 28h			;9561
	inc bc			;9562
	ld a,b			;9563
	call m,00f00h		;9564
	and b			;9567
	rst 0			;9568
	djnz l956bh		;9569
l956bh:
	ld d,e			;956b
	inc bc			;956c
	ld a,b			;956d
	rst 38h			;956e
	nop			;956f
	rra			;9570
	ld b,b			;9571
	add a,e			;9572
	jr nz,l94f5h		;9573
	add hl,hl		;9575
	rlca			;9576
	or b			;9577
	cp 000h			;9578
	ccf			;957a
	add a,b			;957b
	add a,c			;957c
	inc h			;957d
	nop			;957e
	ld b,e			;957f
	rrca			;9580
l9581h:
	ret nz			;9581
	call m,01f01h		;9582
	ret nz			;9585
	add a,b			;9586
	jr z,l9589h		;9587
l9589h:
	rst 38h			;9589
	rrca			;958a
	ret po			;958b
	ret m			;958c
	ld (bc),a		;958d
	rrca			;958e
	jr nz,l9551h		;958f
	ld de,ld500h		;9591
	rra			;9594
	ret nz			;9595
	pop hl			;9596
	inc b			;9597
	rst 18h			;9598
	nop			;9599
	ret po			;959a
	add hl,bc		;959b
	nop			;959c
	dec d			;959d
	ld e,080h		;959e
	inc bc			;95a0
	jr $+1			;95a1
	nop			;95a3
	ret nz			;95a4
	inc d			;95a5
	nop			;95a6
	inc bc			;95a7
	nop			;95a8
	and c			;95a9
	rlca			;95aa
	ret p			;95ab
	ld a,a			;95ac
	nop			;95ad
	adc a,b			;95ae
	inc hl			;95af
	nop			;95b0
	rrca			;95b1
	nop			;95b2
	ld a,a			;95b3
	ld c,0e0h		;95b4
	ccf			;95b6
	add a,b			;95b7
	call c,00000h		;95b8
	ret po			;95bb
	nop			;95bc
	rst 38h			;95bd
	rra			;95be
	nop			;95bf
	rra			;95c0
	ld b,b			;95c1
	rst 38h			;95c2
	nop			;95c3
	nop			;95c4
	ccf			;95c5
	nop			;95c6
	ld a,d			;95c7
	di			;95c8
	nop			;95c9
	rra			;95ca
	ld b,b			;95cb
	rst 38h			;95cc
	nop			;95cd
	ret nz			;95ce
	rrca			;95cf
	nop			;95d0
	cp l			;95d1
	ld h,b			;95d2
	inc c			;95d3
	ccf			;95d4
	add a,b			;95d5
	rst 38h			;95d6
	nop			;95d7
	ret p			;95d8
	inc bc			;95d9
	nop			;95da
	call 01b40h		;95db
	ld a,a			;95de
	nop			;95df
	rst 38h			;95e0
	nop			;95e1
	call m,00001h		;95e2
	cp (hl)			;95e5
	nop			;95e6
	or b			;95e7
	rst 38h			;95e8
	nop			;95e9
	rst 38h			;95ea
	nop			;95eb
	cp 000h			;95ec
	nop			;95ee
	rst 38h			;95ef
	nop			;95f0
	ret po			;95f1
	ld a,a			;95f2
	nop			;95f3
	rst 38h			;95f4
	nop			;95f5
	cp 000h			;95f6
	nop			;95f8
	rst 30h			;95f9
	nop			;95fa
	call nz,l803fh		;95fb
	rst 38h			;95fe
	nop			;95ff
l9600h:
	rst 38h			;9600
	nop			;9601
	nop			;9602
	ccf			;9603
	nop			;9604
	add hl,bc		;9605
	ccf			;9606
	add a,b			;9607
	rst 38h			;9608
	nop			;9609
	rst 38h			;960a
	nop			;960b
	add a,b			;960c
	ld h,000h		;960d
	sub e			;960f
	rra			;9610
	ld b,b			;9611
	rst 38h			;9612
	nop			;9613
	rst 38h			;9614
	nop			;9615
	ret nz			;9616
	add hl,bc		;9617
	nop			;9618
l9619h:
	and 01fh		;9619
	ld b,b			;961b
	rst 38h			;961c
	nop			;961d
	rst 38h			;961e
	nop			;961f
	ret p			;9620
	ld b,000h		;9621
	ld a,l			;9623
	rrca			;9624
	jr nz,$+1		;9625
	nop			;9627
	rst 38h			;9628
	nop			;9629
	ld sp,hl		;962a
	nop			;962b
	add a,b			;962c
	ld bc,0200fh		;962d
	rst 38h			;9630
	nop			;9631
	rst 38h			;9632
	nop			;9633
	rst 38h			;9634
	nop			;9635
	cp 000h			;9636
	sbc a,a			;9638
	nop			;9639
	rst 38h			;963a
	nop			;963b
	rst 38h			;963c
	nop			;963d
	rst 38h			;963e
	nop			;963f
	rst 38h			;9640
	nop			;9641
	rst 38h			;9642
	nop			;9643
	rst 38h			;9644
	nop			;9645
	rst 38h			;9646
	nop			;9647
	rst 38h			;9648
	nop			;9649
	rst 38h			;964a
	nop			;964b
	rst 38h			;964c
	nop			;964d
	inc b			;964e
	dec b			;964f
	nop			;9650
	sub d			;9651
	sub a			;9652
	rst 38h			;9653
	nop			;9654
	cp a			;9655
	nop			;9656
	rst 30h			;9657
	nop			;9658
	rst 38h			;9659
	nop			;965a
	rst 38h			;965b
	nop			;965c
	rst 38h			;965d
	nop			;965e
	rra			;965f
	ld b,b			;9660
	ex (sp),hl		;9661
	ex af,af'		;9662
	rst 38h			;9663
	nop			;9664
	rst 38h			;9665
	nop			;9666
	cp 000h			;9667
	ccf			;9669
	add a,b			;966a
	pop af			;966b
l966ch:
	inc b			;966c
l966dh:
	rst 38h			;966d
	nop			;966e
	rst 38h			;966f
	nop			;9670
	cp 000h			;9671
	ccf			;9673
	add a,b			;9674
	ret p			;9675
	ld b,0ffh		;9676
	nop			;9678
	rst 38h			;9679
	nop			;967a
	call m,03001h		;967b
	add a,b			;967e
	ld (hl),b		;967f
	ld b,0ffh		;9680
	nop			;9682
	rst 38h			;9683
	nop			;9684
	call m,00001h		;9685
	rst 8			;9688
	jr nz,l9619h		;9689
	rst 38h			;968b
	nop			;968c
	ld a,a			;968d
	nop			;968e
	call m,00001h		;968f
	rst 10h			;9692
	ld bc,lfecch		;9693
	nop			;9696
	ccf			;9697
	add a,b			;9698
	call m,00001h		;9699
	rst 28h			;969c
	ld bc,lffbch		;969d
	nop			;96a0
	rra			;96a1
	ld b,b			;96a2
	cp 000h			;96a3
	nop			;96a5
	out (003h),a		;96a6
	ld a,b			;96a8
	call m,01f00h		;96a9
	ld b,b			;96ac
	rst 38h			;96ad
	nop			;96ae
	nop			;96af
	ld c,c			;96b0
	inc bc			;96b1
	ld a,b			;96b2
	ret m			;96b3
	inc bc			;96b4
	rrca			;96b5
	jr nz,$+1		;96b6
	nop			;96b8
	nop			;96b9
	inc sp			;96ba
	rlca			;96bb
	or b			;96bc
	call m,00f00h		;96bd
	and b			;96c0
	cp 000h			;96c1
	nop			;96c3
	rst 38h			;96c4
	rrca			;96c5
	ret nz			;96c6
	rst 38h			;96c7
	nop			;96c8
	rra			;96c9
l96cah:
	ld b,b			;96ca
	call p,00001h		;96cb
	push de			;96ce
	rrca			;96cf
	ret po			;96d0
	cp 000h			;96d1
	ccf			;96d3
	add a,b			;96d4
	ret po			;96d5
	add hl,bc		;96d6
	nop			;96d7
	dec d			;96d8
	rra			;96d9
	ret nz			;96da
	call m,01f01h		;96db
	ret nz			;96de
	jp nz,lc010h		;96df
	ld bc,l801fh		;96e2
	ret p			;96e5
	ld (bc),a		;96e6
	rrca			;96e7
	jr nz,l966dh		;96e8
	jr nz,l966ch		;96ea
	inc hl			;96ec
	nop			;96ed
	and b			;96ee
	ld bc,l9f0ch		;96ef
	nop			;96f2
	add a,c			;96f3
	inc h			;96f4
	ret nz			;96f5
	rra			;96f6
	nop			;96f7
	ld a,a			;96f8
	inc bc			;96f9
	ret m			;96fa
	rra			;96fb
	ld b,b			;96fc
	add a,e			;96fd
	jr z,$-30		;96fe
	nop			;9700
	nop			;9701
	rst 38h			;9702
	rlca			;9703
	add a,b			;9704
	rra			;9705
	ld b,b			;9706
	pop bc			;9707
	djnz l96cah		;9708
	rlca			;970a
	nop			;970b
	ld a,d			;970c
	ld a,h			;970d
	nop			;970e
	ccf			;970f
	add a,b			;9710
	add a,b			;9711
	ld l,000h		;9712
	ccf			;9714
	nop			;9715
	cp l			;9716
	ld (hl),b		;9717
	inc bc			;9718
	ld a,a			;9719
	nop			;971a
	ret nc			;971b
	inc bc			;971c
	nop			;971d
	rst 38h			;971e
	nop			;971f
	call 00c60h		;9720
	rst 38h			;9723
	nop			;9724
	call m,00000h		;9725
	ld bc,lbe00h		;9728
	inc bc			;972b
	sbc a,b			;972c
	rst 38h			;972d
	nop			;972e
	rst 38h			;972f
	nop			;9730
	cp 000h			;9731
	nop			;9733
	rst 38h			;9734
	rlca			;9735
	ret p			;9736
	rst 38h			;9737
	nop			;9738
	rst 38h			;9739
l973ah:
	nop			;973a
	rst 38h			;973b
	nop			;973c
	nop			;973d
	ld (hl),a		;973e
	ld b,0e0h		;973f
	rst 38h			;9741
	nop			;9742
	rst 38h			;9743
	nop			;9744
	rst 38h			;9745
	nop			;9746
	add a,b			;9747
	ccf			;9748
	nop			;9749
	add hl,bc		;974a
	ld a,a			;974b
l974ch:
	nop			;974c
	rst 38h			;974d
	nop			;974e
	rst 38h			;974f
	nop			;9750
	ret nz			;9751
	rlca			;9752
	nop			;9753
	in a,(03fh)		;9754
	add a,b			;9756
	rst 38h			;9757
	nop			;9758
	rst 38h			;9759
	nop			;975a
	ret p			;975b
	dec b			;975c
	nop			;975d
	and 03fh		;975e
	add a,b			;9760
	rst 38h			;9761
	nop			;9762
	rst 38h			;9763
	nop			;9764
	ret m			;9765
	ld (bc),a		;9766
	nop			;9767
	inc a			;9768
	rra			;9769
	ld b,b			;976a
	rst 38h			;976b
	nop			;976c
	rst 38h			;976d
	nop			;976e
	defb 0fdh,000h,0c0h ;illegal sequence	;976f
	ld (bc),a		;9772
	rra			;9773
	ld b,b			;9774
	rst 38h			;9775
	nop			;9776
	rst 38h			;9777
	nop			;9778
	rst 38h			;9779
	nop			;977a
	defb 0fdh,000h,0bfh ;illegal sequence	;977b
	nop			;977e
	rst 38h			;977f
	nop			;9780
	rst 38h			;9781
	nop			;9782
	rst 38h			;9783
	nop			;9784
	rst 38h			;9785
	nop			;9786
	rst 38h			;9787
	nop			;9788
	rst 38h			;9789
	nop			;978a
	rst 38h			;978b
	nop			;978c
	rst 38h			;978d
	nop			;978e
	rst 38h			;978f
	nop			;9790
	rst 38h			;9791
	nop			;9792
	inc b			;9793
	dec b			;9794
	nop			;9795
	rst 10h			;9796
	sbc a,b			;9797
	rst 38h			;9798
	nop			;9799
	cp a			;979a
	nop			;979b
	rst 30h			;979c
	nop			;979d
	rst 38h			;979e
	nop			;979f
	rst 38h			;97a0
	nop			;97a1
	rst 38h			;97a2
	nop			;97a3
	rra			;97a4
	ld b,b			;97a5
	ex (sp),hl		;97a6
	ex af,af'		;97a7
	rst 38h			;97a8
	nop			;97a9
	rst 38h			;97aa
	nop			;97ab
	cp 000h			;97ac
	ccf			;97ae
	add a,b			;97af
	pop af			;97b0
	inc b			;97b1
	rst 38h			;97b2
	nop			;97b3
	rst 38h			;97b4
	nop			;97b5
	cp 000h			;97b6
	jr c,l973ah		;97b8
	ld (hl),b		;97ba
	ld b,0ffh		;97bb
	nop			;97bd
	rst 38h			;97be
	nop			;97bf
	call m,03001h		;97c0
	add a,a			;97c3
	djnz l974ch		;97c4
	rst 38h			;97c6
	nop			;97c7
	rst 38h			;97c8
	nop			;97c9
	call m,00001h		;97ca
	rst 8			;97cd
	nop			;97ce
	xor 0ffh		;97cf
	nop			;97d1
	rst 38h			;97d2
	nop			;97d3
	call m,00001h		;97d4
	rst 30h			;97d7
	ld bc,lffcch		;97d8
	nop			;97db
	rst 38h			;97dc
	nop			;97dd
	call m,00001h		;97de
	out (001h),a		;97e1
	cp h			;97e3
	rst 38h			;97e4
	nop			;97e5
	rst 38h			;97e6
	nop			;97e7
	cp 000h			;97e8
	nop			;97ea
	xor c			;97eb
	inc bc			;97ec
	ld a,b			;97ed
	rst 38h			;97ee
	nop			;97ef
	rst 38h			;97f0
	nop			;97f1
	rst 38h			;97f2
	nop			;97f3
	nop			;97f4
	ld d,e			;97f5
	inc bc			;97f6
	ld a,b			;97f7
	rst 38h			;97f8
	nop			;97f9
	rst 38h			;97fa
	nop			;97fb
	cp 000h			;97fc
	nop			;97fe
l97ffh:
	rst 38h			;97ff
	rlca			;9800
	or b			;9801
	rst 38h			;9802
	nop			;9803
	rst 38h			;9804
	nop			;9805
	call m,00001h		;9806
	push de			;9809
	rrca			;980a
	ret nz			;980b
	rst 38h			;980c
	nop			;980d
	rst 38h			;980e
	nop			;980f
	call m,00001h		;9810
	dec d			;9813
l9814h:
	rrca			;9814
	ret po			;9815
	rst 38h			;9816
	nop			;9817
	rst 38h			;9818
l9819h:
	nop			;9819
	cp 000h			;981a
	ret pe			;981c
	nop			;981d
	rra			;981e
l981fh:
	ret nz			;981f
	rst 38h			;9820
	nop			;9821
	ld a,a			;9822
	nop			;9823
	rst 38h			;9824
	nop			;9825
	call c,01f01h		;9826
	add a,b			;9829
	cp 000h			;982a
	ccf			;982c
	add a,b			;982d
	rst 38h			;982e
l982fh:
	nop			;982f
	add a,b			;9830
	inc hl			;9831
	nop			;9832
	and b			;9833
	ld a,a			;9834
	nop			;9835
	rra			;9836
	ld b,b			;9837
	rst 30h			;9838
	nop			;9839
	ret nz			;983a
	rra			;983b
	nop			;983c
	ld a,a			;983d
	ld e,080h		;983e
	rra			;9840
	ld b,b			;9841
	ex (sp),hl		;9842
	ex af,af'		;9843
	ret po			;9844
	nop			;9845
	nop			;9846
	rst 38h			;9847
	inc b			;9848
	pop hl			;9849
	rrca			;984a
	jr nz,l9814h		;984b
	djnz l982fh		;984d
	rlca			;984f
	nop			;9850
	ld a,d			;9851
	nop			;9852
	sbc a,b			;9853
	rrca			;9854
	and b			;9855
	add a,e			;9856
	jr nz,l9819h		;9857
	rra			;9859
	nop			;985a
	cp l			;985b
	nop			;985c
	ld b,01fh		;985d
	ld b,b			;985f
	add a,c			;9860
	inc h			;9861
	nop			;9862
	ccf			;9863
	nop			;9864
	call 00100h		;9865
	ccf			;9868
	add a,b			;9869
	add a,b			;986a
	jr z,l986dh		;986b
l986dh:
	pop hl			;986d
	nop			;986e
	cp (hl)			;986f
	ld (bc),a		;9870
	sbc a,b			;9871
	rra			;9872
	ld b,b			;9873
	ret nz			;9874
	inc de			;9875
	ld e,000h		;9876
	nop			;9878
	rst 38h			;9879
	rlca			;987a
	ret p			;987b
	adc a,a			;987c
	jr nz,l97ffh		;987d
	inc l			;987f
	rst 38h			;9880
	nop			;9881
	nop			;9882
	ld (hl),a		;9883
	ld b,0e0h		;9884
	rst 18h			;9886
	nop			;9887
	out (000h),a		;9888
	rst 38h			;988a
	nop			;988b
	add a,b			;988c
	ccf			;988d
	nop			;988e
	add hl,bc		;988f
	ld a,a			;9890
	nop			;9891
	rst 38h			;9892
	nop			;9893
	rst 38h			;9894
	nop			;9895
	ret nz			;9896
	rlca			;9897
	nop			;9898
	in a,(03fh)		;9899
	add a,b			;989b
sub_989ch:
	rst 38h			;989c
	nop			;989d
	rst 38h			;989e
	nop			;989f
	ret p			;98a0
	dec b			;98a1
	nop			;98a2
	and 03fh		;98a3
	add a,b			;98a5
	rst 38h			;98a6
	nop			;98a7
	rst 38h			;98a8
	nop			;98a9
	ret m			;98aa
	ld (bc),a		;98ab
	nop			;98ac
	inc a			;98ad
	rra			;98ae
	ld b,b			;98af
	rst 38h			;98b0
	nop			;98b1
	rst 38h			;98b2
	nop			;98b3
	defb 0fdh,000h,0c0h ;illegal sequence	;98b4
	ld (bc),a		;98b7
	rra			;98b8
	ld b,b			;98b9
	rst 38h			;98ba
	nop			;98bb
	rst 38h			;98bc
	nop			;98bd
	rst 38h			;98be
	nop			;98bf
	defb 0fdh,000h,0bfh ;illegal sequence	;98c0
	nop			;98c3
	rst 38h			;98c4
	nop			;98c5
	rst 38h			;98c6
	nop			;98c7
	rst 38h			;98c8
	nop			;98c9
	rst 38h			;98ca
	nop			;98cb
	rst 38h			;98cc
	nop			;98cd
	rst 38h			;98ce
	nop			;98cf
	rst 38h			;98d0
	nop			;98d1
	rst 38h			;98d2
	nop			;98d3
	rst 38h			;98d4
	nop			;98d5
	rst 38h			;98d6
	nop			;98d7
sub_98d8h:
	ld a,(la8f7h)		;98d8
	cp 000h			;98db
	jp z,l9930h		;98dd
	call sub_98e7h		;98e0
	call sub_98f6h		;98e3
	ret			;98e6
sub_98e7h:
	ld iy,l995fh		;98e7
	ld h,038h		;98eb
	ld l,018h		;98ed
	call sub_7d67h		;98ef
	jp c,la8adh		;98f2
	ret			;98f5
sub_98f6h:
	ld a,(l991ah)		;98f6
	cp 000h			;98f9
	jp z,l994ch		;98fb
	ld a,(l991bh)		;98fe
	cp 001h			;9901
	jp z,l991ch		;9903
	ld a,(l995fh)		;9906
	sub 008h		;9909
	ld (l995fh),a		;990b
	cp 080h			;990e
	ret nz			;9910
	ld a,001h		;9911
	ld (l991bh),a		;9913
	call sub_a9b0h		;9916
	ret			;9919
l991ah:
	nop			;991a
l991bh:
	nop			;991b
l991ch:
	ld a,(l995fh)		;991c
	add a,004h		;991f
	ld (l995fh),a		;9921
	cp 0c0h			;9924
	ret nz			;9926
	ld a,000h		;9927
	ld (l991bh),a		;9929
	ld (l991ah),a		;992c
	ret			;992f
l9930h:
	call sub_6dach		;9930
	ld hl,l995fh		;9933
	ld (la6e8h),hl		;9936
	ld a,0c0h		;9939
	ld (l995fh),a		;993b
	ld a,001h		;993e
	ld (la8f7h),a		;9940
	ld a,000h		;9943
	ld (l991ah),a		;9945
	ld (l991bh),a		;9948
	ret			;994b
l994ch:
	ld a,(05d2bh)		;994c
	and a			;994f
	sbc a,0a0h		;9950
	ret nc			;9952
	ld a,(05d2bh)		;9953
	add a,040h		;9956
	ld (l9960h),a		;9958
	ld (l991ah),a		;995b
	ret			;995e
l995fh:
	nop			;995f
l9960h:
	nop			;9960
	nop			;9961
	nop			;9962
	nop			;9963
	nop			;9964
	nop			;9965
	ld bc,00001h		;9966
	ld l,e			;9969
	sbc a,c			;996a
	ex af,af'		;996b
	inc b			;996c
	nop			;996d
	ld l,a			;996e
	sbc a,e			;996f
	rst 38h			;9970
	nop			;9971
	call m,03f00h		;9972
	nop			;9975
	rst 38h			;9976
	nop			;9977
	pop af			;9978
	nop			;9979
	ret p			;997a
	inc bc			;997b
	rra			;997c
	ld b,b			;997d
	rst 38h			;997e
	nop			;997f
	ret po			;9980
	ld c,020h		;9981
	rrca			;9983
	rrca			;9984
	and b			;9985
	rst 38h			;9986
	nop			;9987
	ret p			;9988
	inc bc			;9989
	nop			;998a
l998bh:
	out (007h),a		;998b
	ret nc			;998d
	rst 38h			;998e
	nop			;998f
	call m,00000h		;9990
	defb 0edh ;next byte illegal after ed	;9993
	rrca			;9994
	ret po			;9995
	rst 38h			;9996
	nop			;9997
	rst 38h			;9998
	nop			;9999
	nop			;999a
	ld (hl),007h		;999b
	ret nc			;999d
	rst 38h			;999e
	nop			;999f
	rst 38h			;99a0
	nop			;99a1
	ret nz			;99a2
	ld e,003h		;99a3
	ret pe			;99a5
	rst 38h			;99a6
	nop			;99a7
	rst 38h			;99a8
	nop			;99a9
	add a,b			;99aa
	ld hl,ld401h		;99ab
	rst 38h			;99ae
	nop			;99af
	rst 38h			;99b0
	nop			;99b1
	add a,b			;99b2
	ccf			;99b3
	inc bc			;99b4
	ret pe			;99b5
	rst 38h			;99b6
	nop			;99b7
	rst 38h			;99b8
	nop			;99b9
	add a,b			;99ba
	ccf			;99bb
	nop			;99bc
	add a,b			;99bd
	rrca			;99be
	nop			;99bf
	rst 8			;99c0
	nop			;99c1
	ret nz			;99c2
	rra			;99c3
	nop			;99c4
	ld l,e			;99c5
	rlca			;99c6
	ret p			;99c7
	add a,b			;99c8
	jr nc,l998bh		;99c9
	ld e,000h		;99cb
	rst 18h			;99cd
	rrca			;99ce
	ret nz			;99cf
	ret nz			;99d0
	rra			;99d1
	nop			;99d2
	ccf			;99d3
	nop			;99d4
	ld a,h			;99d5
	ccf			;99d6
	nop			;99d7
	ret po			;99d8
	ld b,000h		;99d9
	ei			;99db
	inc bc			;99dc
	ld h,b			;99dd
	rst 38h			;99de
	nop			;99df
	ret m			;99e0
	inc bc			;99e1
	nop			;99e2
	ld (hl),l		;99e3
	inc bc			;99e4
	sbc a,b			;99e5
	rst 38h			;99e6
	nop			;99e7
	call m,00000h		;99e8
	defb 0edh ;next byte illegal after ed	;99eb
	ld bc,lfff4h		;99ec
	nop			;99ef
	rst 38h			;99f0
	nop			;99f1
	nop			;99f2
	ld (hl),e		;99f3
	nop			;99f4
	sbc a,d			;99f5
	rst 38h			;99f6
	nop			;99f7
	rst 38h			;99f8
	nop			;99f9
	nop			;99fa
	ld a,a			;99fb
	ld bc,lff64h		;99fc
sub_99ffh:
	nop			;99ff
	cp 000h			;9a00
	nop			;9a02
	rst 30h			;9a03
	nop			;9a04
	ld e,d			;9a05
	rst 38h			;9a06
	nop			;9a07
	cp 000h			;9a08
	nop			;9a0a
	ex de,hl		;9a0b
	nop			;9a0c
	ld a,h			;9a0d
	ld a,a			;9a0e
	nop			;9a0f
	rst 38h			;9a10
	nop			;9a11
	nop			;9a12
	ld (hl),a		;9a13
	nop			;9a14
	adc a,a			;9a15
	rra			;9a16
	add a,b			;9a17
	rst 8			;9a18
	nop			;9a19
	nop			;9a1a
	ld a,a			;9a1b
	nop			;9a1c
	ret nc			;9a1d
	rrca			;9a1e
	ret po			;9a1f
	add a,c			;9a20
	jr nc,l9a23h		;9a21
l9a23h:
	ld a,a			;9a23
	nop			;9a24
	call p,0001fh		;9a25
	ret nz			;9a28
	ld e,000h		;9a29
	rst 38h			;9a2b
	nop			;9a2c
	jp m,000ffh		;9a2d
	ret po			;9a30
	rrca			;9a31
	nop			;9a32
	ld a,a			;9a33
	ld bc,lffbch		;9a34
	nop			;9a37
	ret p			;9a38
	inc bc			;9a39
	nop			;9a3a
	rst 38h			;9a3b
	nop			;9a3c
	ld e,d			;9a3d
	ld bc,lf800h		;9a3e
	inc bc			;9a41
	nop			;9a42
	rst 8			;9a43
	nop			;9a44
	ld l,h			;9a45
	nop			;9a46
	cp 0f8h			;9a47
	inc bc			;9a49
	nop			;9a4a
	or a			;9a4b
	nop			;9a4c
	sbc a,l			;9a4d
	ld bc,lf878h		;9a4e
	inc bc			;9a51
	nop			;9a52
	cp e			;9a53
	nop			;9a54
	ei			;9a55
	rlca			;9a56
	ret po			;9a57
	call m,00001h		;9a58
	ld h,a			;9a5b
	nop			;9a5c
	cp 01fh			;9a5d
	add a,b			;9a5f
	call m,00001h		;9a60
	sbc a,a			;9a63
	nop			;9a64
	defb 0edh ;next byte illegal after ed	;9a65
	rra			;9a66
	ld b,b			;9a67
	call m,00001h		;9a68
	rst 38h			;9a6b
	nop			;9a6c
	or 03fh			;9a6d
	add a,b			;9a6f
	call m,00000h		;9a70
	ccf			;9a73
	nop			;9a74
	cp e			;9a75
	ld a,a			;9a76
	nop			;9a77
	ret p			;9a78
	inc bc			;9a79
	nop			;9a7a
	ld e,a			;9a7b
	nop			;9a7c
	ld d,(hl)		;9a7d
	ccf			;9a7e
	add a,b			;9a7f
	add a,b			;9a80
	ld c,000h		;9a81
	xor 000h		;9a83
	xor e			;9a85
	ld de,00000h		;9a86
	ld a,a			;9a89
	nop			;9a8a
	sbc a,000h		;9a8b
	sub 000h		;9a8d
	xor 080h		;9a8f
	nop			;9a91
	nop			;9a92
	ld a,000h		;9a93
	ex de,hl		;9a95
	ld bc,lf078h		;9a96
	rlca			;9a99
	nop			;9a9a
	rst 38h			;9a9b
	nop			;9a9c
	ld (hl),l		;9a9d
	rlca			;9a9e
	add a,b			;9a9f
	ret p			;9aa0
	rlca			;9aa1
	nop			;9aa2
	rst 38h			;9aa3
	nop			;9aa4
	sbc a,(hl)		;9aa5
	rra			;9aa6
	ret nz			;9aa7
	ret p			;9aa8
	rlca			;9aa9
	nop			;9aaa
	rst 20h			;9aab
	nop			;9aac
	rst 20h			;9aad
	rra			;9aae
	ld b,b			;9aaf
	ret po			;9ab0
	rrca			;9ab1
	nop			;9ab2
	dec de			;9ab3
	nop			;9ab4
	ld sp,hl		;9ab5
	rrca			;9ab6
	and b			;9ab7
	ret po			;9ab8
	inc c			;9ab9
	nop			;9aba
	cp e			;9abb
	nop			;9abc
	jp m,0000fh		;9abd
	ret po			;9ac0
	inc bc			;9ac1
	nop			;9ac2
	ld (hl),e		;9ac3
	nop			;9ac4
	defb 0fdh,00fh,0a0h ;illegal sequence	;9ac5
	add a,b			;9ac8
	rra			;9ac9
	nop			;9aca
	adc a,a			;9acb
	nop			;9acc
	rst 38h			;9acd
	rra			;9ace
	ld b,b			;9acf
	nop			;9ad0
	ld (hl),b		;9ad1
	nop			;9ad2
	ld a,(hl)		;9ad3
	nop			;9ad4
	rst 30h			;9ad5
	rrca			;9ad6
	and b			;9ad7
	add a,b			;9ad8
	rlca			;9ad9
	nop			;9ada
	defb 0fdh,000h,069h ;illegal sequence	;9adb
	rra			;9ade
	ld b,b			;9adf
	ret p			;9ae0
	rlca			;9ae1
	nop			;9ae2
	ld a,(hl)		;9ae3
	nop			;9ae4
	sbc a,01fh		;9ae5
	nop			;9ae7
	ret m			;9ae8
	ld (bc),a		;9ae9
	nop			;9aea
	cp a			;9aeb
	nop			;9aec
	defb 0ddh,01fh,0c0h ;illegal sequence	;9aed
	ret p			;9af0
	rlca			;9af1
	nop			;9af2
	ld l,a			;9af3
	nop			;9af4
	rst 28h			;9af5
	rlca			;9af6
	and b			;9af7
	ret po			;9af8
	dec bc			;9af9
	nop			;9afa
	out (000h),a		;9afb
	di			;9afd
	ld bc,lf0f8h		;9afe
	rlca			;9b01
	nop			;9b02
	cp l			;9b03
	nop			;9b04
	call m,03e00h		;9b05
	ret po			;9b08
	dec bc			;9b09
	nop			;9b0a
	ld e,e			;9b0b
	nop			;9b0c
	ld e,001h		;9b0d
	add a,b			;9b0f
	ret nz			;9b10
	ld d,000h		;9b11
	or 000h			;9b13
	rst 20h			;9b15
	rlca			;9b16
	ld d,b			;9b17
	ret po			;9b18
	dec c			;9b19
	nop			;9b1a
	call ld900h		;9b1b
	rrca			;9b1e
	and b			;9b1f
	ret nz			;9b20
	inc de			;9b21
	nop			;9b22
	cp (hl)			;9b23
	nop			;9b24
	halt			;9b25
	rrca			;9b26
	ld h,b			;9b27
	ret po			;9b28
	dec bc			;9b29
	nop			;9b2a
	ld a,a			;9b2b
	nop			;9b2c
	adc a,a			;9b2d
	rrca			;9b2e
	add a,b			;9b2f
	ret nz			;9b30
	ld d,000h		;9b31
	rst 38h			;9b33
	nop			;9b34
	ret p			;9b35
	rlca			;9b36
	ret po			;9b37
	ret po			;9b38
	dec c			;9b39
	nop			;9b3a
	ld a,a			;9b3b
	nop			;9b3c
	rst 38h			;9b3d
	inc bc			;9b3e
	ex af,af'		;9b3f
	ret nz			;9b40
	ld a,(de)		;9b41
	nop			;9b42
	cp a			;9b43
	nop			;9b44
	jp p,0f007h		;9b45
	add a,b			;9b48
	dec h			;9b49
	nop			;9b4a
	ld d,a			;9b4b
	nop			;9b4c
	defb 0edh ;next byte illegal after ed	;9b4d
	rrca			;9b4e
	ld h,b			;9b4f
	ret c			;9b50
	inc bc			;9b51
	nop			;9b52
	jp pe,lde00h		;9b53
	rra			;9b56
	nop			;9b57
	ret m			;9b58
	inc bc			;9b59
	nop			;9b5a
	push af			;9b5b
	nop			;9b5c
	ld e,a			;9b5d
	ld a,a			;9b5e
	nop			;9b5f
	call m,00001h		;9b60
	ld c,(hl)		;9b63
	nop			;9b64
	call pe,000ffh		;9b65
	cp 000h			;9b68
	or c			;9b6a
	nop			;9b6b
	inc de			;9b6c
	nop			;9b6d
	rst 38h			;9b6e
	nop			;9b6f
l9b70h:
	ld a,(la8f8h)		;9b70
	cp 000h			;9b73
	jp z,l9b87h		;9b75
	cp 0ffh			;9b78
	jp z,l9be1h		;9b7a
	call sub_9bb0h		;9b7d
	call sub_9bbfh		;9b80
	call sub_9c1bh		;9b83
	ret			;9b86
l9b87h:
	ld a,r			;9b87
	and 01fh		;9b89
	ret nz			;9b8b
	ld a,001h		;9b8c
	ld (la8f8h),a		;9b8e
	ld de,l9c64h		;9b91
	call sub_7e07h		;9b94
	ld a,040h		;9b97
	ld (l9c64h),a		;9b99
	ld a,0d8h		;9b9c
	ld (l9c65h),a		;9b9e
	ld a,000h		;9ba1
	ld (l9baeh),a		;9ba3
	ld (l9badh),a		;9ba6
	ld (l9bafh),a		;9ba9
	ret			;9bac
l9badh:
	nop			;9bad
l9baeh:
	nop			;9bae
l9bafh:
	nop			;9baf
sub_9bb0h:
	ld iy,l9c64h		;9bb0
	ld h,020h		;9bb4
	ld l,020h		;9bb6
	call sub_7d67h		;9bb8
	jp c,la8adh		;9bbb
	ret			;9bbe
sub_9bbfh:
	ld iy,l9c64h		;9bbf
	ld h,020h		;9bc3
	ld l,020h		;9bc5
	call sub_7d75h		;9bc7
	ret nc			;9bca
	ld a,(la6ach)		;9bcb
	inc a			;9bce
	ld b,a			;9bcf
	ld a,(l9baeh)		;9bd0
	add a,b			;9bd3
	ld (l9baeh),a		;9bd4
l9bd7h:
	and a			;9bd7
	sbc a,009h		;9bd8
	ret c			;9bda
	ld a,0ffh		;9bdb
	ld (la8f8h),a		;9bdd
	ret			;9be0
l9be1h:
	call sub_9c09h		;9be1
	ld a,(l9c64h)		;9be4
	add a,004h		;9be7
	ld (l9c64h),a		;9be9
	cp 0c0h			;9bec
	ret nz			;9bee
	ld a,000h		;9bef
	ld (la8f8h),a		;9bf1
	call sub_7e1dh		;9bf4
	ret			;9bf7
l9bf8h:
	ld a,(l9c64h)		;9bf8
	add a,008h		;9bfb
	ld (l9c64h),a		;9bfd
	cp 098h			;9c00
	ret nz			;9c02
	ld a,001h		;9c03
	ld (l9bafh),a		;9c05
	ret			;9c08
sub_9c09h:
	call sub_a9a6h		;9c09
	call sub_a9abh		;9c0c
	ld a,(l9c65h)		;9c0f
	cp 0d8h			;9c12
	ret z			;9c14
	add a,004h		;9c15
	ld (l9c65h),a		;9c17
	ret			;9c1a
sub_9c1bh:
	ld a,(l9bafh)		;9c1b
	cp 000h			;9c1e
	jp z,l9bf8h		;9c20
	call sub_9c3ah		;9c23
	ld a,(l9c65h)		;9c26
	sub 004h		;9c29
	ld (l9c65h),a		;9c2b
	cp 000h			;9c2e
	ret nz			;9c30
	ld a,000h		;9c31
	ld (la8f8h),a		;9c33
	call sub_7e1dh		;9c36
	ret			;9c39
sub_9c3ah:
	ld a,(l9badh)		;9c3a
	cp 001h			;9c3d
	jp z,l9c53h		;9c3f
	ld a,(l9c64h)		;9c42
	sub 004h		;9c45
	ld (l9c64h),a		;9c47
	cp 070h			;9c4a
	ret nz			;9c4c
	ld a,001h		;9c4d
	ld (l9badh),a		;9c4f
	ret			;9c52
l9c53h:
	ld a,(l9c64h)		;9c53
	add a,004h		;9c56
	ld (l9c64h),a		;9c58
	cp 098h			;9c5b
	ret nz			;9c5d
	ld a,000h		;9c5e
	ld (l9badh),a		;9c60
	ret			;9c63
l9c64h:
	nop			;9c64
l9c65h:
	nop			;9c65
	nop			;9c66
	nop			;9c67
	nop			;9c68
	nop			;9c69
l9c6ah:
	nop			;9c6a
	ld bc,00001h		;9c6b
	ld (hl),b		;9c6e
	sbc a,h			;9c6f
	dec b			;9c70
	dec b			;9c71
	nop			;9c72
	inc b			;9c73
	sbc a,(hl)		;9c74
	rst 20h			;9c75
	nop			;9c76
	ccf			;9c77
	nop			;9c78
	rst 38h			;9c79
	nop			;9c7a
	rst 38h			;9c7b
	nop			;9c7c
	rst 38h			;9c7d
	nop			;9c7e
	jp nz,00318h		;9c7f
	ret nz			;9c82
	rst 38h			;9c83
	nop			;9c84
	rst 38h			;9c85
	nop			;9c86
	rst 38h			;9c87
	nop			;9c88
	add a,d			;9c89
	jr nz,l9c8dh		;9c8a
	inc l			;9c8c
l9c8dh:
	rst 38h			;9c8d
	nop			;9c8e
	rst 38h			;9c8f
	nop			;9c90
	rst 38h			;9c91
	nop			;9c92
	ret nz			;9c93
	add hl,bc		;9c94
	nop			;9c95
	adc a,(hl)		;9c96
	rst 38h			;9c97
	nop			;9c98
	rst 38h			;9c99
	nop			;9c9a
	rst 38h			;9c9b
	nop			;9c9c
	ret nz			;9c9d
	dec de			;9c9e
	nop			;9c9f
	add a,0ffh		;9ca0
	nop			;9ca2
	ld sp,hl		;9ca3
	nop			;9ca4
	rst 38h			;9ca5
	nop			;9ca6
	add a,b			;9ca7
	scf			;9ca8
	nop			;9ca9
	push hl			;9caa
	rra			;9cab
	nop			;9cac
	ret po			;9cad
	ld b,0ffh		;9cae
	nop			;9cb0
	add a,b			;9cb1
	inc (hl)		;9cb2
	nop			;9cb3
	rst 20h			;9cb4
	rrca			;9cb5
	ret po			;9cb6
	ret nz			;9cb7
	rra			;9cb8
	ld a,a			;9cb9
	nop			;9cba
	add a,b			;9cbb
	inc h			;9cbc
	nop			;9cbd
	ex de,hl		;9cbe
	inc bc			;9cbf
	ld d,b			;9cc0
	add a,b			;9cc1
	ccf			;9cc2
	ccf			;9cc3
	add a,b			;9cc4
	add a,b			;9cc5
	dec hl			;9cc6
	nop			;9cc7
	rst 28h			;9cc8
	ld bc,l80ech		;9cc9
	dec sp			;9ccc
	rra			;9ccd
	ret nz			;9cce
	ret nz			;9ccf
	dec de			;9cd0
	nop			;9cd1
	rst 28h			;9cd2
	nop			;9cd3
	jp m,l7104h		;9cd4
	rra			;9cd7
	ret nz			;9cd8
	ret nz			;9cd9
	dec de			;9cda
	nop			;9cdb
	sbc a,000h		;9cdc
	or 00ch			;9cde
	pop hl			;9ce0
	rrca			;9ce1
	ret po			;9ce2
	ret po			;9ce3
	dec c			;9ce4
	nop			;9ce5
	cp (hl)			;9ce6
	nop			;9ce7
l9ce8h:
	call m,sub_e00eh	;9ce8
	rrca			;9ceb
	ret po			;9cec
	ret p			;9ced
	inc b			;9cee
	nop			;9cef
	ld l,(hl)		;9cf0
	nop			;9cf1
	ld a,e			;9cf2
	ld e,0c0h		;9cf3
	rrca			;9cf5
	ret po			;9cf6
	ret po			;9cf7
	dec bc			;9cf8
	nop			;9cf9
	defb 0ddh,000h,07bh ;illegal sequence	;9cfa
	inc e			;9cfd
	add a,c			;9cfe
	rrca			;9cff
	ret po			;9d00
	ret nz			;9d01
	ld e,000h		;9d02
	inc a			;9d04
	add a,b			;9d05
	dec sp			;9d06
	inc c			;9d07
	and c			;9d08
	rra			;9d09
	ret nz			;9d0a
	add a,b			;9d0b
	dec hl			;9d0c
	ld bc,l80fch		;9d0d
	inc a			;9d10
	nop			;9d11
	ld d,e			;9d12
	rra			;9d13
	ret nz			;9d14
	add a,b			;9d15
	dec sp			;9d16
	nop			;9d17
	jp m,01fc0h		;9d18
	nop			;9d1b
	di			;9d1c
	rra			;9d1d
	ret nz			;9d1e
	add a,b			;9d1f
	rrca			;9d20
	nop			;9d21
	rst 30h			;9d22
	ld h,b			;9d23
	rrca			;9d24
	nop			;9d25
	ex de,hl		;9d26
	ccf			;9d27
	add a,b			;9d28
	add a,b			;9d29
	inc sp			;9d2a
	ex af,af'		;9d2b
	add a,e			;9d2c
	nop			;9d2d
	inc bc			;9d2e
	nop			;9d2f
	rst 10h			;9d30
	ld a,a			;9d31
	nop			;9d32
	add a,b			;9d33
	inc (hl)		;9d34
	inc c			;9d35
	ld h,b			;9d36
	nop			;9d37
	ld l,c			;9d38
	nop			;9d39
	rst 20h			;9d3a
	ld a,a			;9d3b
	nop			;9d3c
	add a,e			;9d3d
	jr nz,l9d4eh		;9d3e
	ld h,b			;9d40
	nop			;9d41
	or 000h			;9d42
	rst 18h			;9d44
	ld a,a			;9d45
	nop			;9d46
	add a,e			;9d47
	jr nc,l9ce8h		;9d48
	nop			;9d4a
	nop			;9d4b
	ei			;9d4c
	nop			;9d4d
l9d4eh:
	dec a			;9d4e
	ld a,a			;9d4f
	nop			;9d50
	inc bc			;9d51
	ld a,b			;9d52
	call m,00001h		;9d53
	rst 18h			;9d56
	nop			;9d57
	dec sp			;9d58
	ld a,a			;9d59
	nop			;9d5a
	ld (bc),a		;9d5b
	ld l,b			;9d5c
	ld a,h			;9d5d
	ld bc,la600h		;9d5e
	nop			;9d61
	ld d,(hl)		;9d62
	ccf			;9d63
	add a,b			;9d64
	nop			;9d65
	ld (hl),c		;9d66
	inc c			;9d67
	add a,c			;9d68
	nop			;9d69
	ld a,c			;9d6a
	nop			;9d6b
	ld l,l			;9d6c
	ccf			;9d6d
	add a,b			;9d6e
	add a,b			;9d6f
	ld sp,lb004h		;9d70
	nop			;9d73
	ld a,a			;9d74
	nop			;9d75
	or e			;9d76
	ld a,a			;9d77
	nop			;9d78
	ret nz			;9d79
	ld b,000h		;9d7a
	ld sp,lf900h		;9d7c
	nop			;9d7f
	sub 0ffh		;9d80
	nop			;9d82
	ret po			;9d83
	rrca			;9d84
	nop			;9d85
	rst 8			;9d86
	nop			;9d87
	add a,001h		;9d88
	ret po			;9d8a
	rst 38h			;9d8b
	nop			;9d8c
	ret p			;9d8d
	rlca			;9d8e
	nop			;9d8f
	rst 38h			;9d90
	nop			;9d91
	cp a			;9d92
	rlca			;9d93
	ret p			;9d94
	rst 38h			;9d95
	nop			;9d96
	ret nz			;9d97
	nop			;9d98
	nop			;9d99
	ret m			;9d9a
	nop			;9d9b
	ccf			;9d9c
	rlca			;9d9d
l9d9eh:
	ret p			;9d9e
	rst 38h			;9d9f
	nop			;9da0
	add a,b			;9da1
	jr c,l9da4h		;9da2
l9da4h:
	ld (bc),a		;9da4
	nop			;9da5
	sbc a,e			;9da6
	rrca			;9da7
l9da8h:
	ret po			;9da8
	rst 38h			;9da9
	nop			;9daa
	nop			;9dab
	ld a,h			;9dac
	nop			;9dad
l9daeh:
	ld l,l			;9dae
	nop			;9daf
	ld d,a			;9db0
	rra			;9db1
	ret nz			;9db2
	rst 38h			;9db3
	nop			;9db4
	nop			;9db5
	ld e,(hl)		;9db6
	nop			;9db7
	ld l,(hl)		;9db8
	nop			;9db9
	rst 10h			;9dba
	ccf			;9dbb
	add a,b			;9dbc
	rst 38h			;9dbd
	nop			;9dbe
	add a,b			;9dbf
	ld l,000h		;9dc0
	rst 28h			;9dc2
	nop			;9dc3
	ld d,(hl)		;9dc4
	ld a,a			;9dc5
	nop			;9dc6
	rst 38h			;9dc7
	nop			;9dc8
	ret nz			;9dc9
	rra			;9dca
	nop			;9dcb
	ld c,a			;9dcc
	ld bc,lffd0h		;9dcd
	nop			;9dd0
	rst 38h			;9dd1
	nop			;9dd2
	ret nz			;9dd3
	rra			;9dd4
	djnz l9d9eh		;9dd5
	rrca			;9dd7
	and b			;9dd8
	rst 38h			;9dd9
	nop			;9dda
	rst 38h			;9ddb
	nop			;9ddc
	ret po			;9ddd
	rrca			;9dde
	djnz l9da8h		;9ddf
	rrca			;9de1
	ret po			;9de2
	rst 38h			;9de3
	nop			;9de4
	rst 38h			;9de5
	nop			;9de6
	ret p			;9de7
	rlca			;9de8
	jr l9daeh		;9de9
	rrca			;9deb
	and b			;9dec
	rst 38h			;9ded
	nop			;9dee
	rst 38h			;9def
	nop			;9df0
	ret m			;9df1
	inc bc			;9df2
	inc a			;9df3
	add a,c			;9df4
	rra			;9df5
	ret nz			;9df6
	rst 38h			;9df7
	nop			;9df8
	rst 38h			;9df9
	nop			;9dfa
	call m,07e00h		;9dfb
	nop			;9dfe
	ccf			;9dff
	nop			;9e00
	rst 38h			;9e01
	nop			;9e02
	rst 38h			;9e03
	nop			;9e04
l9e05h:
	ld a,(la8f8h)		;9e05
	cp 000h			;9e08
	jp z,l9e1fh		;9e0a
	cp 0ffh			;9e0d
	jp z,l9e52h		;9e0f
	call sub_9e9eh		;9e12
	call sub_9e7fh		;9e15
	call sub_9ef2h		;9e18
	call sub_9ec0h		;9e1b
	ret			;9e1e
l9e1fh:
	ld a,r			;9e1f
	and 01fh		;9e21
	ret nz			;9e23
	ld a,001h		;9e24
	ld (la8f8h),a		;9e26
	ld de,l9f43h		;9e29
	call sub_7e07h		;9e2c
	ld de,l9f35h		;9e2f
	call sub_7e07h		;9e32
	ld a,090h		;9e35
	ld (l9f35h),a		;9e37
	ld a,0d8h		;9e3a
	ld (l9f36h),a		;9e3c
	ld a,0c8h		;9e3f
	ld (l9f43h),a		;9e41
	ld a,064h		;9e44
	ld (l9f44h),a		;9e46
	ld a,000h		;9e49
	ld (l9e9ch),a		;9e4b
	ld (l9e9dh),a		;9e4e
	ret			;9e51
l9e52h:
	call sub_a9b5h		;9e52
	ld a,(l9e9dh)		;9e55
	cp 001h			;9e58
	call z,sub_9e79h	;9e5a
	ld a,(l9f35h)		;9e5d
	cp 001h			;9e60
	call z,sub_9e79h	;9e62
	add a,008h		;9e65
	ld (l9f35h),a		;9e67
	cp 0c0h			;9e6a
	ret nz			;9e6c
	ld a,000h		;9e6d
	ld (la8f8h),a		;9e6f
	call sub_7e1dh		;9e72
	call sub_7e1dh		;9e75
	ret			;9e78
sub_9e79h:
	ld a,0c0h		;9e79
	ld (l9f43h),a		;9e7b
	ret			;9e7e
sub_9e7fh:
	ld iy,l9f35h		;9e7f
	ld h,028h		;9e83
	ld l,020h		;9e85
	call sub_7d67h		;9e87
	call c,la8adh		;9e8a
	ld iy,l9f43h		;9e8d
	ld h,008h		;9e91
	ld l,058h		;9e93
	call sub_7d67h		;9e95
	call c,la8adh		;9e98
	ret			;9e9b
l9e9ch:
	nop			;9e9c
l9e9dh:
	nop			;9e9d
sub_9e9eh:
	ld iy,l9f35h		;9e9e
	ld h,028h		;9ea2
	ld l,020h		;9ea4
	call sub_7d75h		;9ea6
	ret nc			;9ea9
	ld a,(la6ach)		;9eaa
	inc a			;9ead
	ld b,a			;9eae
	ld a,(l9e9ch)		;9eaf
	add a,b			;9eb2
	ld (l9e9ch),a		;9eb3
	and a			;9eb6
	sbc a,009h		;9eb7
	ret c			;9eb9
	ld a,0ffh		;9eba
	ld (la8f8h),a		;9ebc
	ret			;9ebf
sub_9ec0h:
	ld a,(l9e9dh)		;9ec0
	cp 001h			;9ec3
	call z,sub_9ed8h	;9ec5
	ld a,(l9f3dh)		;9ec8
	inc a			;9ecb
	ld (l9f3dh),a		;9ecc
	cp 003h			;9ecf
	ret nz			;9ed1
	ld a,001h		;9ed2
	ld (l9f3dh),a		;9ed4
	ret			;9ed7
sub_9ed8h:
	ld a,(l9f4bh)		;9ed8
	inc a			;9edb
	ld (l9f4bh),a		;9edc
	cp 004h			;9edf
	ret nz			;9ee1
	ld a,000h		;9ee2
l9ee4h:
	ld (l9e9dh),a		;9ee4
	ld a,0c8h		;9ee7
	ld (l9f43h),a		;9ee9
	ld a,001h		;9eec
	ld (l9f4bh),a		;9eee
	ret			;9ef1
sub_9ef2h:
	ld a,(l9e9dh)		;9ef2
	cp 001h			;9ef5
	ret z			;9ef7
	ld a,r			;9ef8
	and 00fh		;9efa
	jp z,l9f16h		;9efc
	ld a,(l9f36h)		;9eff
	sub 004h		;9f02
	ld (l9f36h),a		;9f04
	cp 000h			;9f07
	ret nz			;9f09
	ld a,000h		;9f0a
l9f0ch:
	ld (la8f8h),a		;9f0c
	call sub_7e1dh		;9f0f
	call sub_7e1dh		;9f12
	ret			;9f15
l9f16h:
	ld a,(l9f36h)		;9f16
	and a			;9f19
	sbc a,068h		;9f1a
	ret c			;9f1c
	ld a,001h		;9f1d
	ld (l9e9dh),a		;9f1f
	ld a,000h		;9f22
	ld (l9f4bh),a		;9f24
	ld a,(l9f36h)		;9f27
	sub 060h		;9f2a
	ld (l9f44h),a		;9f2c
	ld a,0a0h		;9f2f
	ld (l9f43h),a		;9f31
	ret			;9f34
l9f35h:
	nop			;9f35
l9f36h:
	nop			;9f36
	nop			;9f37
	nop			;9f38
	nop			;9f39
	nop			;9f3a
	nop			;9f3b
	ld (bc),a		;9f3c
l9f3dh:
	ld bc,05300h		;9f3d
	sbc a,a			;9f40
	jr c,l9ee4h		;9f41
l9f43h:
	nop			;9f43
l9f44h:
	nop			;9f44
	nop			;9f45
	nop			;9f46
	nop			;9f47
	nop			;9f48
	nop			;9f49
	inc bc			;9f4a
l9f4bh:
	ld bc,01d00h		;9f4b
	and e			;9f4e
	ex (sp),hl		;9f4f
	and e			;9f50
	xor c			;9f51
	and h			;9f52
	ld b,005h		;9f53
	nop			;9f55
	scf			;9f56
	and c			;9f57
	rst 38h			;9f58
	nop			;9f59
	cp 000h			;9f5a
	rra			;9f5c
	nop			;9f5d
sub_9f5eh:
	rst 38h			;9f5e
	nop			;9f5f
	rst 38h			;9f60
	nop			;9f61
	cp 000h			;9f62
	nop			;9f64
	ld bc,0e007h		;9f65
	rst 38h			;9f68
	nop			;9f69
	rst 38h			;9f6a
	nop			;9f6b
	ret m			;9f6c
	ld bc,ldf00h		;9f6d
	inc bc			;9f70
	ld e,b			;9f71
	rst 38h			;9f72
	nop			;9f73
	rst 38h			;9f74
	nop			;9f75
	ret p			;9f76
	rlca			;9f77
	nop			;9f78
	cp a			;9f79
	nop			;9f7a
	call p,000ffh		;9f7b
	rst 38h			;9f7e
	nop			;9f7f
	ret po			;9f80
	rrca			;9f81
	nop			;9f82
	ld a,a			;9f83
	nop			;9f84
	ei			;9f85
	ld a,a			;9f86
	nop			;9f87
	rst 38h			;9f88
	nop			;9f89
	ret po			;9f8a
	rrca			;9f8b
	nop			;9f8c
	ld a,a			;9f8d
	nop			;9f8e
	cp 03fh			;9f8f
	add a,b			;9f91
	rst 38h			;9f92
	nop			;9f93
	ret nz			;9f94
	ld e,000h		;9f95
	rst 38h			;9f97
	nop			;9f98
	rst 18h			;9f99
	rra			;9f9a
	ld b,b			;9f9b
	rst 38h			;9f9c
	nop			;9f9d
	ret nz			;9f9e
	ld e,000h		;9f9f
	rst 38h			;9fa1
	nop			;9fa2
	cp a			;9fa3
	rrca			;9fa4
	and b			;9fa5
	rst 38h			;9fa6
	nop			;9fa7
	ret po			;9fa8
	ld c,000h		;9fa9
	cp 000h			;9fab
	ld h,a			;9fad
	rrca			;9fae
	ld h,b			;9faf
	rst 38h			;9fb0
	nop			;9fb1
	ret nz			;9fb2
	rra			;9fb3
	nop			;9fb4
	ld a,b			;9fb5
	nop			;9fb6
	rra			;9fb7
	rlca			;9fb8
	ret nc			;9fb9
	rst 38h			;9fba
	nop			;9fbb
	add a,b			;9fbc
	ld hl,la000h		;9fbd
	nop			;9fc0
	rst 38h			;9fc1
	rrca			;9fc2
	and b			;9fc3
	rst 38h			;9fc4
	nop			;9fc5
	add a,b			;9fc6
	ld h,000h		;9fc7
	ld e,l			;9fc9
	nop			;9fca
	ld a,a			;9fcb
	rlca			;9fcc
	ret nc			;9fcd
	rst 38h			;9fce
sub_9fcfh:
	nop			;9fcf
	ret nz			;9fd0
	djnz l9fd3h		;9fd1
l9fd3h:
	ld b,e			;9fd3
	nop			;9fd4
	rst 38h			;9fd5
	inc bc			;9fd6
	ret pe			;9fd7
	rst 38h			;9fd8
	nop			;9fd9
	ret nz			;9fda
	ld c,000h		;9fdb
	adc a,a			;9fdd
	nop			;9fde
	rst 38h			;9fdf
	rlca			;9fe0
	ret nc			;9fe1
	rst 38h			;9fe2
	nop			;9fe3
	add a,b			;9fe4
	ld sp,05f00h		;9fe5
	nop			;9fe8
	rst 38h			;9fe9
	inc bc			;9fea
	ret pe			;9feb
	rst 38h			;9fec
	nop			;9fed
	nop			;9fee
	ld b,c			;9fef
	nop			;9ff0
	ld e,a			;9ff1
	nop			;9ff2
	rst 38h			;9ff3
	rlca			;9ff4
	ret nc			;9ff5
	rst 38h			;9ff6
	nop			;9ff7
	nop			;9ff8
	ld b,c			;9ff9
	nop			;9ffa
	ld e,a			;9ffb
	nop			;9ffc
	rst 38h			;9ffd
	inc bc			;9ffe
sub_9fffh:
	ret pe			;9fff
la000h:
	rst 38h			;a000
	nop			;a001
	add a,b			;a002
	ld hl,05f00h		;a003
la006h:
	nop			;a006
	defb 0fdh,001h,0f4h ;illegal sequence	;a007
	rst 38h			;a00a
	nop			;a00b
	add a,b			;a00c
	ld (lef00h),hl		;a00d
	nop			;a010
	ei			;a011
	inc bc			;a012
	ld a,b			;a013
	rst 38h			;a014
	nop			;a015
	ret nz			;a016
	dec e			;a017
	nop			;a018
	sub e			;a019
	nop			;a01a
	rst 20h			;a01b
	ld bc,lffbch		;a01c
	nop			;a01f
	ret po			;a020
	nop			;a021
	nop			;a022
	ld a,h			;a023
	nop			;a024
	rra			;a025
	nop			;a026
	sbc a,0ffh		;a027
	nop			;a029
	ret p			;a02a
	rlca			;a02b
	nop			;a02c
	rst 20h			;a02d
	nop			;a02e
	rst 38h			;a02f
	nop			;a030
	rst 28h			;a031
	ld a,a			;a032
	nop			;a033
	ret po			;a034
	inc c			;a035
	nop			;a036
	rra			;a037
	nop			;a038
	rst 38h			;a039
	nop			;a03a
	rst 30h			;a03b
	ccf			;a03c
	add a,b			;a03d
	ret nz			;a03e
	inc de			;a03f
	nop			;a040
	ret p			;a041
	nop			;a042
	rra			;a043
	nop			;a044
	ex de,hl		;a045
	rra			;a046
	ret nz			;a047
	ret nz			;a048
	rrca			;a049
	nop			;a04a
	rst 38h			;a04b
	nop			;a04c
	di			;a04d
	nop			;a04e
	pop af			;a04f
	rra			;a050
	ret nz			;a051
	add a,b			;a052
	ccf			;a053
	nop			;a054
	rst 38h			;a055
	nop			;a056
	defb 0fdh,000h,0e9h ;illegal sequence	;a057
	rra			;a05a
	ret nz			;a05b
	add a,b			;a05c
	ccf			;a05d
	nop			;a05e
	rst 38h			;a05f
	nop			;a060
	cp 000h			;a061
	di			;a063
	ccf			;a064
	add a,b			;a065
	add a,b			;a066
	ccf			;a067
	nop			;a068
	rst 38h			;a069
	nop			;a06a
	rst 38h			;a06b
	nop			;a06c
	ex de,hl		;a06d
	ccf			;a06e
	add a,b			;a06f
	nop			;a070
	ld a,a			;a071
	nop			;a072
	rst 38h			;a073
	nop			;a074
la075h:
	rst 38h			;a075
	nop			;a076
	rst 10h			;a077
	ld a,a			;a078
	nop			;a079
	nop			;a07a
	ld a,a			;a07b
	nop			;a07c
	rst 38h			;a07d
	nop			;a07e
	rst 38h			;a07f
	nop			;a080
	rst 20h			;a081
	ld a,a			;a082
	nop			;a083
	nop			;a084
	ld a,a			;a085
	nop			;a086
	rst 38h			;a087
	nop			;a088
	rst 38h			;a089
	nop			;a08a
	rst 10h			;a08b
	ld a,a			;a08c
	nop			;a08d
	nop			;a08e
	ld a,b			;a08f
	nop			;a090
	rst 38h			;a091
	nop			;a092
	rst 38h			;a093
	nop			;a094
	xor (hl)		;a095
	rst 38h			;a096
	nop			;a097
	nop			;a098
	ld (hl),a		;a099
	nop			;a09a
	ld a,a			;a09b
	nop			;a09c
	add a,a			;a09d
	nop			;a09e
	ld c,(hl)		;a09f
	rst 38h			;a0a0
	nop			;a0a1
	add a,b			;a0a2
	cpl			;a0a3
	nop			;a0a4
	ccf			;a0a5
	nop			;a0a6
	ld a,d			;a0a7
	ld bc,lffach		;a0a8
	nop			;a0ab
	ret nz			;a0ac
	ld e,000h		;a0ad
	sbc a,000h		;a0af
	ld a,c			;a0b1
	nop			;a0b2
	ld e,(hl)		;a0b3
	rst 38h			;a0b4
	nop			;a0b5
	ret nz			;a0b6
	dec e			;a0b7
	nop			;a0b8
	defb 0ddh,000h,0bch ;illegal sequence	;a0b9
	nop			;a0bc
	cp a			;a0bd
	ld a,a			;a0be
	nop			;a0bf
	add a,b			;a0c0
	dec a			;a0c1
	nop			;a0c2
	cp l			;a0c3
	nop			;a0c4
	defb 0ddh,000h,07fh ;illegal sequence	;a0c5
	rra			;a0c8
	add a,b			;a0c9
	add a,b			;a0ca
	dec sp			;a0cb
	nop			;a0cc
	ld a,l			;a0cd
	nop			;a0ce
	xor 000h		;a0cf
	ld a,l			;a0d1
	rrca			;a0d2
	ret po			;a0d3
	add a,b			;a0d4
	ld (hl),000h		;a0d5
	cp 000h			;a0d7
	rst 30h			;a0d9
	nop			;a0da
	ld (hl),007h		;a0db
	ret p			;a0dd
	add a,b			;a0de
	dec l			;a0df
	nop			;a0e0
	rst 38h			;a0e1
	nop			;a0e2
	dec de			;a0e3
	nop			;a0e4
	dec sp			;a0e5
	rlca			;a0e6
	ld (hl),b		;a0e7
	add a,d			;a0e8
	jr z,la0ebh		;a0e9
la0ebh:
	ld a,(hl)		;a0eb
	nop			;a0ec
	and l			;a0ed
	nop			;a0ee
	sbc a,l			;a0ef
	rrca			;a0f0
la0f1h:
	and b			;a0f1
	rst 0			;a0f2
	djnz la075h		;a0f3
	dec c			;a0f5
	ld e,b			;a0f6
	ld (bc),a		;a0f7
	ld (01f80h),hl		;a0f8
	ret nz			;a0fb
	rst 0			;a0fc
	djnz la0f1h		;a0fd
	nop			;a0ff
	call m,03f00h		;a100
	add a,b			;a103
	ccf			;a104
	nop			;a105
	rst 28h			;a106
	nop			;a107
	rst 38h			;a108
	nop			;a109
	rst 38h			;a10a
	nop			;a10b
	ld a,a			;a10c
	nop			;a10d
	rst 38h			;a10e
	nop			;a10f
	rst 38h			;a110
	nop			;a111
	rst 38h			;a112
	nop			;a113
	rst 38h			;a114
	nop			;a115
	rst 38h			;a116
	nop			;a117
	rst 38h			;a118
	nop			;a119
	rst 38h			;a11a
	nop			;a11b
	rst 38h			;a11c
	nop			;a11d
	rst 38h			;a11e
	nop			;a11f
	rst 38h			;a120
	nop			;a121
	rst 38h			;a122
	nop			;a123
	rst 38h			;a124
	nop			;a125
	rst 38h			;a126
	nop			;a127
	rst 38h			;a128
	nop			;a129
	rst 38h			;a12a
	nop			;a12b
	rst 38h			;a12c
	nop			;a12d
	rst 38h			;a12e
	nop			;a12f
	rst 38h			;a130
	nop			;a131
	rst 38h			;a132
	nop			;a133
	rst 38h			;a134
	nop			;a135
	rst 38h			;a136
	nop			;a137
	ld b,005h		;a138
	nop			;a13a
	inc e			;a13b
	and e			;a13c
	rst 38h			;a13d
	nop			;a13e
	rst 38h			;a13f
	nop			;a140
	rst 38h			;a141
	nop			;a142
	rst 38h			;a143
	nop			;a144
	rst 38h			;a145
	nop			;a146
	rst 38h			;a147
	nop			;a148
	rst 38h			;a149
	nop			;a14a
	rst 38h			;a14b
	nop			;a14c
	rst 38h			;a14d
	nop			;a14e
	rst 38h			;a14f
	nop			;a150
	rst 38h			;a151
	nop			;a152
	rst 38h			;a153
	nop			;a154
	rst 38h			;a155
	nop			;a156
	rst 38h			;a157
	nop			;a158
	rst 38h			;a159
	nop			;a15a
	rst 38h			;a15b
	nop			;a15c
	rst 38h			;a15d
	nop			;a15e
	rst 38h			;a15f
	nop			;a160
	rst 38h			;a161
	nop			;a162
	rst 38h			;a163
	nop			;a164
	rst 38h			;a165
	nop			;a166
	rst 38h			;a167
	nop			;a168
	rst 38h			;a169
	nop			;a16a
	rst 38h			;a16b
	nop			;a16c
	rst 38h			;a16d
	nop			;a16e
	rst 38h			;a16f
	nop			;a170
	cp 000h			;a171
	rra			;a173
	nop			;a174
	rst 38h			;a175
	nop			;a176
	rst 38h			;a177
	nop			;a178
	cp 000h			;a179
	jr nz,la17eh		;a17b
	rlca			;a17d
la17eh:
	ret po			;a17e
	rst 38h			;a17f
	nop			;a180
	rst 38h			;a181
	nop			;a182
	ret m			;a183
	ld bc,ldf00h		;a184
	inc bc			;a187
	ld e,b			;a188
	rst 38h			;a189
	nop			;a18a
	rst 38h			;a18b
	nop			;a18c
	ret p			;a18d
	rlca			;a18e
	nop			;a18f
	cp a			;a190
	nop			;a191
	call p,000ffh		;a192
	rst 38h			;a195
	nop			;a196
	ret po			;a197
	rrca			;a198
	nop			;a199
	ld a,a			;a19a
	nop			;a19b
	ei			;a19c
	ld a,a			;a19d
	nop			;a19e
	rst 38h			;a19f
	nop			;a1a0
	ret po			;a1a1
	rrca			;a1a2
	nop			;a1a3
	ld a,a			;a1a4
	nop			;a1a5
	cp 03fh			;a1a6
	add a,b			;a1a8
	rst 38h			;a1a9
	nop			;a1aa
	ret nz			;a1ab
	ld e,000h		;a1ac
	rst 38h			;a1ae
	nop			;a1af
	rst 18h			;a1b0
	rra			;a1b1
	ld b,b			;a1b2
	rst 38h			;a1b3
	nop			;a1b4
	ret nz			;a1b5
	ld e,000h		;a1b6
	rst 38h			;a1b8
	nop			;a1b9
	cp a			;a1ba
	rrca			;a1bb
	and b			;a1bc
	rst 38h			;a1bd
	nop			;a1be
	ret po			;a1bf
	ld c,000h		;a1c0
	cp 000h			;a1c2
	ld h,a			;a1c4
	rrca			;a1c5
	ld h,b			;a1c6
	rst 38h			;a1c7
	nop			;a1c8
	ret nz			;a1c9
	rra			;a1ca
	nop			;a1cb
	ld a,b			;a1cc
	nop			;a1cd
	rra			;a1ce
	rlca			;a1cf
	ret nc			;a1d0
	rst 38h			;a1d1
	nop			;a1d2
	add a,b			;a1d3
	ld hl,la000h		;a1d4
	nop			;a1d7
	rst 38h			;a1d8
	rrca			;a1d9
	and b			;a1da
	rst 38h			;a1db
	nop			;a1dc
	add a,b			;a1dd
	ld h,000h		;a1de
sub_a1e0h:
	ld e,l			;a1e0
la1e1h:
	nop			;a1e1
	ld a,a			;a1e2
	rlca			;a1e3
	ret nc			;a1e4
	rst 38h			;a1e5
	nop			;a1e6
	ret nz			;a1e7
	djnz la1eah		;a1e8
la1eah:
	ld b,e			;a1ea
	nop			;a1eb
	rst 38h			;a1ec
	inc bc			;a1ed
	ret pe			;a1ee
	rst 38h			;a1ef
	nop			;a1f0
	ret nz			;a1f1
	ld c,000h		;a1f2
	adc a,a			;a1f4
	nop			;a1f5
	rst 38h			;a1f6
	rlca			;a1f7
	ret nc			;a1f8
	rst 38h			;a1f9
	nop			;a1fa
	add a,b			;a1fb
	ld sp,05f00h		;a1fc
	nop			;a1ff
	rst 38h			;a200
	inc bc			;a201
	ret pe			;a202
	rst 38h			;a203
	nop			;a204
	nop			;a205
	ld b,c			;a206
	nop			;a207
	ld e,a			;a208
	nop			;a209
	rst 38h			;a20a
	rlca			;a20b
	ret nc			;a20c
	rst 38h			;a20d
	nop			;a20e
	nop			;a20f
	ld b,c			;a210
	nop			;a211
	ld e,a			;a212
	nop			;a213
	rst 38h			;a214
	inc bc			;a215
	ret pe			;a216
	rst 38h			;a217
	nop			;a218
	add a,b			;a219
	ld hl,05f00h		;a21a
	nop			;a21d
	defb 0fdh,001h,0f4h ;illegal sequence	;a21e
	rst 38h			;a221
	nop			;a222
	add a,b			;a223
	ld (le700h),hl		;a224
	nop			;a227
	di			;a228
	nop			;a229
	jp m,000ffh		;a22a
	ret nz			;a22d
	dec e			;a22e
	nop			;a22f
	ret m			;a230
	nop			;a231
	rrca			;a232
	nop			;a233
	cp l			;a234
	ld a,a			;a235
	nop			;a236
	ret po			;a237
	inc bc			;a238
	nop			;a239
	rst 38h			;a23a
	nop			;a23b
	rst 38h			;a23c
	nop			;a23d
	xor d			;a23e
	ccf			;a23f
	add a,b			;a240
	call m,00000h		;a241
	ret po			;a244
	nop			;a245
	ccf			;a246
	nop			;a247
	xor l			;a248
	ld a,a			;a249
	nop			;a24a
	call m,00001h		;a24b
	rra			;a24e
	nop			;a24f
	rst 0			;a250
	nop			;a251
	ld l,(hl)		;a252
	ccf			;a253
	add a,b			;a254
	cp 000h			;a255
	nop			;a257
	rst 38h			;a258
	nop			;a259
	ei			;a25a
	nop			;a25b
	ld e,a			;a25c
	rra			;a25d
	ld b,b			;a25e
	call m,00001h		;a25f
	rst 38h			;a262
	nop			;a263
	cp 000h			;a264
	rst 18h			;a266
	ccf			;a267
	add a,b			;a268
	call m,00001h		;a269
	rst 38h			;a26c
	nop			;a26d
	defb 0fdh,000h,0bfh ;illegal sequence	;a26e
	rra			;a271
	ld b,b			;a272
	call m,00001h		;a273
	rst 38h			;a276
	nop			;a277
	di			;a278
	nop			;a279
	ld a,a			;a27a
	rrca			;a27b
	and b			;a27c
	call m,00001h		;a27d
	rst 38h			;a280
	nop			;a281
	xor 000h		;a282
	rst 38h			;a284
	rra			;a285
la286h:
	ld b,b			;a286
	ret m			;a287
	ld (bc),a		;a288
	nop			;a289
	rst 38h			;a28a
	nop			;a28b
	sbc a,c			;a28c
	nop			;a28d
	rst 38h			;a28e
	rrca			;a28f
	and b			;a290
	ret p			;a291
	rlca			;a292
	nop			;a293
	cp 000h			;a294
	ld (hl),a		;a296
	nop			;a297
	rst 38h			;a298
	rrca			;a299
	ld h,b			;a29a
	ret po			;a29b
	ld c,000h		;a29c
	ld sp,hl		;a29e
	nop			;a29f
	rst 8			;a2a0
	nop			;a2a1
	rst 38h			;a2a2
	rrca			;a2a3
	and b			;a2a4
	ret nz			;a2a5
	ld e,000h		;a2a6
	ld h,a			;a2a8
	nop			;a2a9
	cp a			;a2aa
	nop			;a2ab
	rst 38h			;a2ac
	rra			;a2ad
	ld b,b			;a2ae
	add a,b			;a2af
	inc a			;a2b0
	nop			;a2b1
	rra			;a2b2
	nop			;a2b3
	ld a,a			;a2b4
	nop			;a2b5
	cp 03fh			;a2b6
	add a,b			;a2b8
	nop			;a2b9
	ld e,h			;a2ba
	nop			;a2bb
	ld a,000h		;a2bc
	rst 38h			;a2be
	nop			;a2bf
	rst 38h			;a2c0
	ccf			;a2c1
	add a,b			;a2c2
	nop			;a2c3
	ld e,c			;a2c4
	nop			;a2c5
	defb 0fdh,000h,0ffh ;illegal sequence	;a2c6
	nop			;a2c9
	rst 38h			;a2ca
	ld a,a			;a2cb
	nop			;a2cc
	nop			;a2cd
	ld l,e			;a2ce
	nop			;a2cf
	cp e			;a2d0
	nop			;a2d1
	rst 38h			;a2d2
	nop			;a2d3
la2d4h:
	call m,000ffh		;a2d4
	nop			;a2d7
	ld h,a			;a2d8
	nop			;a2d9
	ld a,h			;a2da
	nop			;a2db
	rst 38h			;a2dc
	nop			;a2dd
	jp m,000ffh		;a2de
	add a,b			;a2e1
	ld l,000h		;a2e2
	call pe,03700h		;a2e4
	nop			;a2e7
	rst 20h			;a2e8
	ccf			;a2e9
	nop			;a2ea
	add a,b			;a2eb
	dec l			;a2ec
	nop			;a2ed
	exx			;a2ee
	nop			;a2ef
	rlc b			;a2f0
	dec de			;a2f2
	rra			;a2f3
	ret nz			;a2f4
	add a,b			;a2f5
	dec h			;a2f6
	nop			;a2f7
	or e			;a2f8
	inc b			;a2f9
	or b			;a2fa
	ret po			;a2fb
	dec c			;a2fc
	rra			;a2fd
	ret nz			;a2fe
	jp nz,00010h		;a2ff
	ld h,a			;a302
	rrca			;a303
	ld h,b			;a304
	ret po			;a305
	ld c,03fh		;a306
	add a,b			;a308
	rst 28h			;a309
	nop			;a30a
	add a,b			;a30b
	ld b,01fh		;a30c
	ret nz			;a30e
	ret p			;a30f
	ld b,07fh		;a310
	nop			;a312
	rst 38h			;a313
	nop			;a314
la315h:
	ld sp,hl		;a315
	nop			;a316
	ccf			;a317
	nop			;a318
	ld sp,hl		;a319
	nop			;a31a
	rst 38h			;a31b
	nop			;a31c
	ld bc,0000ch		;a31d
	pop hl			;a320
	and e			;a321
	rst 38h			;a322
	nop			;a323
	rst 38h			;a324
	nop			;a325
	rst 38h			;a326
	nop			;a327
	rst 38h			;a328
	nop			;a329
	rst 38h			;a32a
	nop			;a32b
	rst 38h			;a32c
	nop			;a32d
	rst 38h			;a32e
	nop			;a32f
	rst 38h			;a330
	nop			;a331
	rst 28h			;a332
	nop			;a333
	rst 28h			;a334
	nop			;a335
	defb 0fdh,000h,0ffh ;illegal sequence	;a336
	nop			;a339
	rst 38h			;a33a
	nop			;a33b
	rst 38h			;a33c
	nop			;a33d
	rst 38h			;a33e
	nop			;a33f
	rst 38h			;a340
	nop			;a341
	rst 38h			;a342
	nop			;a343
	rst 38h			;a344
	nop			;a345
	rst 38h			;a346
la347h:
	nop			;a347
	rst 38h			;a348
	nop			;a349
	rst 0			;a34a
	djnz la2d4h		;a34b
	djnz la347h		;a34d
	ld (bc),a		;a34f
	rst 38h			;a350
	nop			;a351
	rst 38h			;a352
	nop			;a353
	rst 38h			;a354
	nop			;a355
	rst 38h			;a356
	nop			;a357
	rst 38h			;a358
	nop			;a359
	rst 38h			;a35a
	nop			;a35b
la35ch:
	rst 38h			;a35c
	nop			;a35d
	rst 38h			;a35e
	nop			;a35f
	rst 38h			;a360
	nop			;a361
	add a,a			;a362
	jr nz,la374h		;a363
	ld h,b			;a365
	defb 0ddh,000h,07fh ;illegal sequence	;a366
	nop			;a369
	rst 38h			;a36a
	nop			;a36b
	rst 38h			;a36c
	nop			;a36d
	rst 38h			;a36e
	nop			;a36f
	rst 38h			;a370
	nop			;a371
	rst 38h			;a372
	nop			;a373
la374h:
	rst 38h			;a374
	nop			;a375
	rst 38h			;a376
	nop			;a377
	rst 38h			;a378
	nop			;a379
	add a,b			;a37a
	jr z,la398h		;a37b
	nop			;a37d
	adc a,(hl)		;a37e
	jr nz,la3c0h		;a37f
	ld bc,000ffh		;a381
	rst 38h			;a384
	nop			;a385
	rst 38h			;a386
	nop			;a387
	rst 38h			;a388
	nop			;a389
	rst 38h			;a38a
	nop			;a38b
	rst 38h			;a38c
	nop			;a38d
	rst 38h			;a38e
	nop			;a38f
	rst 38h			;a390
	nop			;a391
	nop			;a392
	ld e,a			;a393
	nop			;a394
	add a,h			;a395
	inc b			;a396
	ld b,c			;a397
la398h:
	ld a,a			;a398
	nop			;a399
	rst 38h			;a39a
	nop			;a39b
	rst 38h			;a39c
	nop			;a39d
	rst 38h			;a39e
	nop			;a39f
	rst 38h			;a3a0
	nop			;a3a1
	rst 38h			;a3a2
	nop			;a3a3
	rst 38h			;a3a4
	nop			;a3a5
	rst 38h			;a3a6
	nop			;a3a7
	rst 38h			;a3a8
	nop			;a3a9
	nop			;a3aa
	ld l,d			;a3ab
	nop			;a3ac
	add hl,de		;a3ad
	nop			;a3ae
	sbc a,e			;a3af
	rra			;a3b0
	nop			;a3b1
	rst 38h			;a3b2
	nop			;a3b3
	rst 38h			;a3b4
	nop			;a3b5
	rst 38h			;a3b6
	nop			;a3b7
	rst 38h			;a3b8
	nop			;a3b9
	rst 38h			;a3ba
	nop			;a3bb
	rst 38h			;a3bc
	nop			;a3bd
	rst 38h			;a3be
	nop			;a3bf
la3c0h:
	rst 38h			;a3c0
	nop			;a3c1
	add a,b			;a3c2
	scf			;a3c3
	nop			;a3c4
	or 000h			;a3c5
	cp 00fh			;a3c7
	ld (bc),a		;a3c9
	rst 38h			;a3ca
	nop			;a3cb
	rst 38h			;a3cc
	nop			;a3cd
	rst 38h			;a3ce
	nop			;a3cf
	rst 38h			;a3d0
	nop			;a3d1
	rst 38h			;a3d2
	nop			;a3d3
	rst 38h			;a3d4
	nop			;a3d5
	rst 38h			;a3d6
	nop			;a3d7
	rst 38h			;a3d8
	nop			;a3d9
	ret z			;a3da
	nop			;a3db
	add hl,bc		;a3dc
	nop			;a3dd
	ld bc,01f00h		;a3de
	nop			;a3e1
	nop			;a3e2
	ld bc,0000ch		;a3e3
	and a			;a3e6
	and h			;a3e7
	rst 38h			;a3e8
la3e9h:
	nop			;a3e9
	rst 38h			;a3ea
	nop			;a3eb
	rst 38h			;a3ec
	nop			;a3ed
	rst 38h			;a3ee
	nop			;a3ef
	ret p			;a3f0
	nop			;a3f1
	ccf			;a3f2
	nop			;a3f3
	rst 38h			;a3f4
	nop			;a3f5
	rst 38h			;a3f6
	nop			;a3f7
	ei			;a3f8
	nop			;a3f9
	rst 20h			;a3fa
	nop			;a3fb
	cp 000h			;a3fc
	rst 38h			;a3fe
	nop			;a3ff
	rst 38h			;a400
	nop			;a401
	rst 38h			;a402
	nop			;a403
	rst 38h			;a404
	nop			;a405
	rst 38h			;a406
	nop			;a407
	ret nz			;a408
	rrca			;a409
	rra			;a40a
	ret nz			;a40b
	ld a,a			;a40c
	nop			;a40d
	rst 38h			;a40e
	nop			;a40f
	pop af			;a410
	inc b			;a411
	jp lec18h		;a412
	ld bc,0003fh		;a415
	rst 38h			;a418
	nop			;a419
	rst 38h			;a41a
	nop			;a41b
	rst 38h			;a41c
	nop			;a41d
	rst 38h			;a41e
	nop			;a41f
	add a,b			;a420
	jr c,la459h		;a421
	nop			;a423
	inc sp			;a424
	add a,b			;a425
	ei			;a426
	nop			;a427
	ei			;a428
	nop			;a429
	ld bc,lc640h		;a42a
	djnz la44eh		;a42d
	nop			;a42f
	rst 38h			;a430
	nop			;a431
	rst 38h			;a432
	nop			;a433
	rst 38h			;a434
	nop			;a435
	rst 38h			;a436
	nop			;a437
	nop			;a438
	ld l,a			;a439
	inc bc			;a43a
	ex af,af'		;a43b
	ld bc,lc10ch		;a43c
	inc b			;a43f
	call m,00000h		;a440
	add a,d			;a443
	adc a,(hl)		;a444
	jr nz,la486h		;a445
	ld bc,000ffh		;a447
	rst 38h			;a44a
	nop			;a44b
	rst 38h			;a44c
	nop			;a44d
la44eh:
	rst 38h			;a44e
	nop			;a44f
	nop			;a450
	ld e,b			;a451
	nop			;a452
	jr nz,la455h		;a453
la455h:
	ld h,b			;a455
	add a,b			;a456
	jr c,la3e9h		;a457
la459h:
	ld (bc),a		;a459
	nop			;a45a
	nop			;a45b
	adc a,h			;a45c
	nop			;a45d
	ccf			;a45e
la45fh:
	nop			;a45f
	rst 38h			;a460
	nop			;a461
	rst 38h			;a462
	nop			;a463
	rst 38h			;a464
	nop			;a465
	rst 38h			;a466
	nop			;a467
	nop			;a468
	ld a,(hl)		;a469
	nop			;a46a
	di			;a46b
	nop			;a46c
	add a,e			;a46d
	nop			;a46e
	ld (hl),c		;a46f
	nop			;a470
	ld l,b			;a471
	nop			;a472
	add hl,hl		;a473
	nop			;a474
	ld d,d			;a475
	rra			;a476
	nop			;a477
	rst 38h			;a478
	nop			;a479
	rst 38h			;a47a
	nop			;a47b
	rst 38h			;a47c
	nop			;a47d
	rst 38h			;a47e
	nop			;a47f
	add a,b			;a480
	dec de			;a481
	nop			;a482
	jp pe,07600h		;a483
la486h:
	nop			;a486
	rst 10h			;a487
	nop			;a488
	or a			;a489
	nop			;a48a
	or (hl)			;a48b
	nop			;a48c
	xor 00fh		;a48d
	ld (bc),a		;a48f
	rst 38h			;a490
	nop			;a491
	rst 38h			;a492
	nop			;a493
	rst 38h			;a494
	nop			;a495
	rst 38h			;a496
	nop			;a497
	call po,01500h		;a498
	nop			;a49b
	adc a,c			;a49c
	nop			;a49d
	jr z,la4a0h		;a49e
la4a0h:
	ld c,b			;a4a0
	nop			;a4a1
	ld c,c			;a4a2
	nop			;a4a3
	ld de,01f00h		;a4a4
	nop			;a4a7
	nop			;a4a8
	ld bc,0000ch		;a4a9
	ld l,l			;a4ac
	and l			;a4ad
	rst 30h			;a4ae
	nop			;a4af
	pop hl			;a4b0
	nop			;a4b1
	rst 38h			;a4b2
	nop			;a4b3
	rst 18h			;a4b4
	nop			;a4b5
	rst 38h			;a4b6
	nop			;a4b7
	rst 18h			;a4b8
	nop			;a4b9
	rst 18h			;a4ba
	nop			;a4bb
	rst 38h			;a4bc
	nop			;a4bd
	defb 0fdh,000h,0f3h ;illegal sequence	;a4be
	nop			;a4c1
la4c2h:
	cp 000h			;a4c2
	rst 38h			;a4c4
	nop			;a4c5
	jp po,00008h		;a4c6
	ld e,0f7h		;a4c9
	nop			;a4cb
	adc a,a			;a4cc
	jr nz,$+1		;a4cd
	nop			;a4cf
	adc a,e			;a4d0
	jr nz,la45fh		;a4d1
	jr nz,$-1		;a4d3
	nop			;a4d5
	ret m			;a4d6
	ld (bc),a		;a4d7
	ld h,c			;a4d8
	inc c			;a4d9
	call pe,03f01h		;a4da
	nop			;a4dd
	ret po			;a4de
	ld bc,lc000h		;a4df
	inc hl			;a4e2
	ex af,af'		;a4e3
	dec de			;a4e4
	nop			;a4e5
	ei			;a4e6
	nop			;a4e7
	pop de			;a4e8
	inc b			;a4e9
	ret c			;a4ea
	inc bc			;a4eb
sub_a4ech:
	ld a,b			;a4ec
	ld (bc),a		;a4ed
	call m,03200h		;a4ee
	add a,b			;a4f1
	add a,010h		;a4f2
	rra			;a4f4
	nop			;a4f5
	ret nz			;a4f6
	dec e			;a4f7
	nop			;a4f8
	ret nz			;a4f9
	nop			;a4fa
	ret nz			;a4fb
	djnz la4c2h		;a4fc
	ld d,c			;a4fe
	inc b			;a4ff
	in a,(000h)		;a500
	sbc a,h			;a502
	nop			;a503
	ld sp,hl		;a504
	nop			;a505
	rst 38h			;a506
	nop			;a507
	ld a,h			;a508
	ld bc,0006fh		;a509
	cp a			;a50c
	nop			;a50d
	add a,b			;a50e
	scf			;a50f
	nop			;a510
	inc bc			;a511
	nop			;a512
	add a,e			;a513
	nop			;a514
	add hl,bc		;a515
	ex af,af'		;a516
	and b			;a517
	adc a,e			;a518
	jr nz,la51eh		;a519
	ld h,b			;a51b
	jr nc,la522h		;a51c
la51eh:
	sub a			;a51e
	nop			;a51f
	cp 000h			;a520
la522h:
	rst 38h			;a522
	nop			;a523
	rst 38h			;a524
	nop			;a525
	add a,b			;a526
	inc l			;a527
	nop			;a528
	rst 38h			;a529
	nop			;a52a
	ld h,l			;a52b
	nop			;a52c
	ret p			;a52d
	ld b,b			;a52e
	inc bc			;a52f
	ld de,l8044h		;a530
	inc a			;a533
	nop			;a534
	pop bc			;a535
	inc bc			;a536
	ld l,b			;a537
	scf			;a538
	nop			;a539
	cp l			;a53a
	nop			;a53b
	rst 38h			;a53c
	nop			;a53d
	ret nz			;a53e
	inc de			;a53f
	nop			;a540
	call z,sub_b300h	;a541
	nop			;a544
	adc a,l			;a545
	ld b,b			;a546
	dec de			;a547
	nop			;a548
	jp pe,07600h		;a549
	nop			;a54c
	rst 10h			;a54d
	nop			;a54e
	or h			;a54f
	inc bc			;a550
	ret z			;a551
	jr $+68			;a552
	rst 38h			;a554
	nop			;a555
	call pe,03300h		;a556
	nop			;a559
	ld c,h			;a55a
	nop			;a55b
	ld (hl),b		;a55c
	nop			;a55d
	ret po			;a55e
	nop			;a55f
	dec d			;a560
	nop			;a561
	adc a,c			;a562
	nop			;a563
	jr nz,la566h		;a564
la566h:
	ld c,e			;a566
	nop			;a567
	scf			;a568
	nop			;a569
	cp l			;a56a
	nop			;a56b
	rst 38h			;a56c
	nop			;a56d
	nop			;a56e
la56fh:
	nop			;a56f
	out (000h),a		;a570
la572h:
	nop			;a572
la573h:
	call sub_7be2h		;a573
	ld a,(0a571h)		;a576
	cp 000h			;a579
	jp z,la58dh		;a57b
	cp 0ffh			;a57e
	jp z,la5b5h+1		;a580
	call sub_a5e3h		;a583
	call sub_a62dh		;a586
	call sub_a640h		;a589
	ret			;a58c
la58dh:
	ld a,001h		;a58d
	ld (la5b5h),a		;a58f
	ld (0a571h),a		;a592
	ld hl,ld300h		;a595
	ld (la56fh),hl		;a598
	ld a,000h		;a59b
	ld (la572h),a		;a59d
	ld a,00eh		;a5a0
	ld (07c61h),a		;a5a2
	ld de,ldbf6h		;a5a5
	call sub_7e07h		;a5a8
	call sub_d61bh		;a5ab
	ld a,0c0h		;a5ae
	ld (ldbf6h),a		;a5b0
	ret			;a5b3
la5b4h:
	nop			;a5b4
la5b5h:
	ld bc,lb43ah		;a5b5
	and l			;a5b8
	inc a			;a5b9
	ld (la5b4h),a		;a5ba
	ld a,(la5b5h)		;a5bd
	inc a			;a5c0
	ld (la5b5h),a		;a5c1
	cp 002h			;a5c4
	jp z,la5d0h		;a5c6
	ld de,ldbf6h		;a5c9
	call sub_7e07h		;a5cc
	ret			;a5cf
la5d0h:
	call sub_7e1dh		;a5d0
	ld a,000h		;a5d3
	ld (la5b5h),a		;a5d5
	call sub_a9abh		;a5d8
	call sub_a9a6h		;a5db
	call sub_a9abh		;a5de
	ret			;a5e1
la5e2h:
	nop			;a5e2
sub_a5e3h:
	ld a,(la5e2h)		;a5e3
	inc a			;a5e6
	ld (la5e2h),a		;a5e7
	cp 002h			;a5ea
	ret nz			;a5ec
	ld a,000h		;a5ed
	ld (la5e2h),a		;a5ef
	ld a,002h		;a5f2
	ld (ldbfeh),a		;a5f4
	ld ix,(la56fh)		;a5f7
	ld a,(ix+000h)		;a5fb
	cp 080h			;a5fe
la600h:
	call z,sub_a625h	;a600
	cp 000h			;a603
	jp z,la61ah		;a605
	ld (ldbf6h),a		;a608
	ld a,(ix+001h)		;a60b
	ld (ldbf7h),a		;a60e
	inc ix			;a611
	inc ix			;a613
	ld (la56fh),ix		;a615
	ret			;a619
la61ah:
	ld ix,ld300h		;a61a
	ld (la56fh),ix		;a61e
	jp sub_a5e3h		;a622
sub_a625h:
	push af			;a625
	ld a,001h		;a626
	ld (ldbfeh),a		;a628
	pop af			;a62b
	ret			;a62c
sub_a62dh:
	ld iy,ldbf6h		;a62d
	ld h,038h		;a631
	ld l,038h		;a633
	call sub_7d67h		;a635
	ret nc			;a638
	call la8adh		;a639
	jp la8adh		;a63c
la63fh:
	nop			;a63f
sub_a640h:
	ld iy,ldbf6h		;a640
	ld h,038h		;a644
	ld l,038h		;a646
	call sub_7d75h		;a648
	ret nc			;a64b
	ld a,(l7831h)		;a64c
	cp 001h			;a64f
	ret nz			;a651
	ld a,(la63fh)		;a652
	inc a			;a655
	ld (la63fh),a		;a656
	cp 006h			;a659
	ret nz			;a65b
	ld a,000h		;a65c
	ld (la63fh),a		;a65e
	ld a,(la6ach)		;a661
	inc a			;a664
	ld b,a			;a665
	cp 002h			;a666
	jr z,la682h		;a668
	ld a,(la6a1h)		;a66a
	inc a			;a66d
	ld (la6a1h),a		;a66e
	cp 002h			;a671
	jr z,la67dh		;a673
	ld a,(la572h)		;a675
	add a,b			;a678
	ld (la572h),a		;a679
	ret			;a67c
la67dh:
	ld a,000h		;a67d
	ld (la6a1h),a		;a67f
la682h:
	push bc			;a682
	call sub_d692h		;a683
	call sub_a9a6h		;a686
	call sub_a9abh		;a689
	call sub_a9b0h		;a68c
	pop bc			;a68f
	ld a,(la572h)		;a690
	add a,b			;a693
	ld (la572h),a		;a694
	and a			;a697
	sbc a,02fh		;a698
	ret c			;a69a
	ld a,0ffh		;a69b
	ld (0a571h),a		;a69d
	ret			;a6a0
la6a1h:
	nop			;a6a1
la6a2h:
	nop			;a6a2
	ld c,0ffh		;a6a3
	ld bc,00000h		;a6a5
la6a8h:
	nop			;a6a8
la6a9h:
	nop			;a6a9
la6aah:
	nop			;a6aa
la6abh:
	nop			;a6ab
la6ach:
	nop			;a6ac
	rrca			;a6ad
la6aeh:
	nop			;a6ae
la6afh:
	nop			;a6af
	ld bc,00000h		;a6b0
la6b3h:
	nop			;a6b3
la6b4h:
	nop			;a6b4
	nop			;a6b5
	nop			;a6b6
	nop			;a6b7
	nop			;a6b8
	nop			;a6b9
	nop			;a6ba
	nop			;a6bb
	nop			;a6bc
	nop			;a6bd
	nop			;a6be
	nop			;a6bf
	nop			;a6c0
	nop			;a6c1
	nop			;a6c2
	nop			;a6c3
	nop			;a6c4
	nop			;a6c5
	nop			;a6c6
	nop			;a6c7
la6c8h:
	nop			;a6c8
	ret c			;a6c9
	sub 03ch		;a6ca
	rst 10h			;a6cc
	sbc a,e			;a6cd
	rst 10h			;a6ce
	jp p,047d7h		;a6cf
	ret c			;a6d2
	and (hl)		;a6d3
	ret c			;a6d4
	rlca			;a6d5
	exx			;a6d6
	ld a,d			;a6d7
	exx			;a6d8
	call pe,052d9h		;a6d9
	jp c,lda97h		;a6dc
	ret c			;a6df
	jp c,0db39h		;a6e0
	sbc a,b			;a6e3
	in a,(0c5h)		;a6e4
	in a,(000h)		;a6e6
la6e8h:
	nop			;a6e8
	nop			;a6e9
la6eah:
	nop			;a6ea
	nop			;a6eb
	nop			;a6ec
	nop			;a6ed
	nop			;a6ee
	nop			;a6ef
	nop			;a6f0
	nop			;a6f1
	nop			;a6f2
	nop			;a6f3
	nop			;a6f4
	nop			;a6f5
	nop			;a6f6
	nop			;a6f7
	nop			;a6f8
	nop			;a6f9
la6fah:
	nop			;a6fa
	nop			;a6fb
	ld a,(de)		;a6fc
	and a			;a6fd
la6feh:
	rra			;a6fe
	and a			;a6ff
	jr z,la6a9h		;a700
	ld sp,036a7h		;a702
	and a			;a705
	dec sp			;a706
	and a			;a707
	ld b,h			;a708
	and a			;a709
	ld d,l			;a70a
	and a			;a70b
	ld e,d			;a70c
	and a			;a70d
	ld e,a			;a70e
	and a			;a70f
	ld h,h			;a710
	and a			;a711
	ld l,c			;a712
	and a			;a713
	ld l,(hl)		;a714
	and a			;a715
	ld (hl),e		;a716
	and a			;a717
	ld a,b			;a718
	and a			;a719
	ld bc,000c0h		;a71a
	jr z,$+1		;a71d
	ld (bc),a		;a71f
	ret nz			;a720
	nop			;a721
	jr z,la78ch		;a722
	ret nz			;a724
	and b			;a725
	jr z,la77fh		;a726
	ld (bc),a		;a728
	ret nz			;a729
	nop			;a72a
	jr z,la73dh		;a72b
	ret nz			;a72d
	jr nc,la758h		;a72e
	rst 8			;a730
	ld bc,000c0h		;a731
	jr z,$+1		;a734
	ld bc,000c0h		;a736
	jr z,$+1		;a739
	ld (bc),a		;a73b
	ret nz			;a73c
la73dh:
	nop			;a73d
	jr z,la790h		;a73e
	ret nz			;a740
	adc a,b			;a741
	jr z,la7bbh		;a742
	inc b			;a744
	ret nz			;a745
	nop			;a746
	jr z,$+18		;a747
	ret nz			;a749
	ld b,b			;a74a
	jr z,$+26		;a74b
	ret nz			;a74d
	adc a,d			;a74e
	jr z,la769h		;a74f
	ret nz			;a751
	ret nc			;a752
	jr z,la784h		;a753
	ld bc,000c0h		;a755
la758h:
	jr z,$+1		;a758
	ld bc,000c0h		;a75a
	jr z,$+1		;a75d
	ld bc,000c0h		;a75f
	jr z,$+1		;a762
	ld bc,000c0h		;a764
	jr z,$+1		;a767
la769h:
	ld bc,000c0h		;a769
	jr z,$+1		;a76c
	ld bc,000c0h		;a76e
	jr z,$+1		;a771
	ld bc,000c0h		;a773
	jr z,$+1		;a776
	ld bc,000c0h		;a778
	jr z,$+1		;a77b
la77dh:
	nop			;a77d
	nop			;a77e
la77fh:
	nop			;a77f
	nop			;a780
	nop			;a781
la782h:
	nop			;a782
	nop			;a783
la784h:
	nop			;a784
	nop			;a785
	nop			;a786
	nop			;a787
	nop			;a788
	nop			;a789
	nop			;a78a
	nop			;a78b
la78ch:
	nop			;a78c
	nop			;a78d
	nop			;a78e
	inc bc			;a78f
la790h:
	ld c,b			;a790
	ret z			;a791
	nop			;a792
	nop			;a793
	nop			;a794
	nop			;a795
	nop			;a796
	nop			;a797
	nop			;a798
	nop			;a799
	nop			;a79a
	nop			;a79b
	nop			;a79c
	nop			;a79d
	nop			;a79e
	nop			;a79f
	nop			;a7a0
	nop			;a7a1
	nop			;a7a2
	nop			;a7a3
	dec b			;a7a4
	ld c,b			;a7a5
	ret z			;a7a6
	nop			;a7a7
	nop			;a7a8
	nop			;a7a9
	call sub_7c8dh		;a7aa
	ld a,000h		;a7ad
	ld hl,04000h		;a7af
	ld (hl),a		;a7b2
	ld de,04001h		;a7b3
	ld bc,00fffh		;a7b6
	ldir			;a7b9
la7bbh:
	call sub_aacfh		;a7bb
	di			;a7be
	call sub_766eh		;a7bf
	ld a,008h		;a7c2
	call sub_7ca9h		;a7c4
	call sub_d606h		;a7c7
	call sub_d61bh		;a7ca
la7cdh:
	call sub_7c8dh		;a7cd
	call sub_7cdah		;a7d0
	call sub_6e35h		;a7d3
	call sub_6e22h		;a7d6
	call 06a8bh		;a7d9
	call sub_7d34h		;a7dc
	call sub_72fbh		;a7df
	ld a,(06a85h)		;a7e2
	cp 0ffh			;a7e5
	jr nz,la7f9h		;a7e7
	ld a,(la843h)		;a7e9
	ld (06a85h),a		;a7ec
	ld a,001h		;a7ef
	ld (l6f53h),a		;a7f1
	ld a,019h		;a7f4
	ld (l6f16h),a		;a7f6
la7f9h:
	call sub_7263h		;a7f9
	call sub_6e6eh		;a7fc
	call sub_7c14h		;a7ff
	call sub_6ed1h		;a802
	call sub_79a2h		;a805
	call sub_7c31h		;a808
	call sub_a8fbh		;a80b
	ld a,(05d3eh)		;a80e
	cp 0e0h			;a811
	jp z,la844h		;a813
	cp 0a4h			;a816
	call z,sub_a837h	;a818
	ld a,(la89eh)		;a81b
	cp 001h			;a81e
	jp z,la844h		;a820
	ld a,(la5b4h)		;a823
	cp 014h			;a826
	jp z,laa40h		;a828
	call sub_72fbh		;a82b
	call sub_7393h		;a82e
	call sub_757ah		;a831
sub_a834h:
	jp la7f9h		;a834
sub_a837h:
	ld a,(06a85h)		;a837
	ld (la843h),a		;a83a
	ld a,0ffh		;a83d
	ld (06a85h),a		;a83f
	ret			;a842
la843h:
	nop			;a843
la844h:
	ld a,000h		;a844
	ld (07c61h),a		;a846
	ld (0a571h),a		;a849
	ld (la89eh),a		;a84c
	ld (la6c8h),a		;a84f
	ld a,0a0h		;a852
	ld (05d3eh),a		;a854
	ld (05d40h),a		;a857
	ld a,03ch		;a85a
	ld (05d3fh),a		;a85c
	ld (05d41h),a		;a85f
	ld a,081h		;a862
	ld (05d2ah),a		;a864
	ld (05d2ch),a		;a867
	ld a,03ch		;a86a
	ld (05d2bh),a		;a86c
	ld (05d2dh),a		;a86f
	ld a,002h		;a872
	ld (05d32h),a		;a874
	ld (05d46h),a		;a877
	ld a,060h		;a87a
	ld (la8d5h),a		;a87c
	ld a,000h		;a87f
	ld (la8d6h),a		;a881
	call sub_a9d5h		;a884
	call sub_d606h		;a887
	call sub_d61bh		;a88a
	ld hl,la6b4h		;a88d
	ld b,014h		;a890
	ld a,000h		;a892
la894h:
	ld (hl),a		;a894
	inc hl			;a895
	djnz la894h		;a896
	ld (la6abh),a		;a898
	jp la8d7h		;a89b
la89eh:
	nop			;a89e
sub_a89fh:
	call sub_d606h		;a89f
	ld a,000h		;a8a2
	ld (la8d6h),a		;a8a4
	ld a,060h		;a8a7
	ld (la8d5h),a		;a8a9
	ret			;a8ac
la8adh:
	ld a,(la8d5h)		;a8ad
	dec a			;a8b0
	ld (la8d5h),a		;a8b1
	ld a,(la8d6h)		;a8b4
	inc a			;a8b7
	ld (la8d6h),a		;a8b8
	cp 004h			;a8bb
	ret nz			;a8bd
	ld a,000h		;a8be
	ld (la8d6h),a		;a8c0
	call sub_d655h		;a8c3
	call sub_a9abh		;a8c6
	ld a,(la8d5h)		;a8c9
	cp 000h			;a8cc
	ret nz			;a8ce
	ld a,001h		;a8cf
	ld (la89eh),a		;a8d1
la8d4h:
	ret			;a8d4
la8d5h:
	ld h,b			;a8d5
la8d6h:
	nop			;a8d6
la8d7h:
	ld a,000h		;a8d7
	ld (la8f7h),a		;a8d9
	ld (la8f8h),a		;a8dc
	ld (la8f9h),a		;a8df
	ld (la8fah),a		;a8e2
	ld (la6afh),a		;a8e5
	ld (0a6b2h),a		;a8e8
	ld (la6b3h),a		;a8eb
	ld (la6aah),a		;a8ee
	ld (0a6a7h),a		;a8f1
	jp la7cdh		;a8f4
la8f7h:
	nop			;a8f7
la8f8h:
	nop			;a8f8
la8f9h:
	nop			;a8f9
la8fah:
	nop			;a8fa
sub_a8fbh:
	ld a,(05d32h)		;a8fb
sub_a8feh:
	cp 005h			;a8fe
la900h:
	call z,sub_a9a6h	;a900
	ld a,(la6c8h)		;a903
	cp 000h			;a906
	jp z,la94fh		;a908
	cp 001h			;a90b
	jp z,la952h		;a90d
	cp 002h			;a910
	jp z,la958h		;a912
	cp 003h			;a915
	jp z,la95eh		;a917
	cp 004h			;a91a
	jp z,la964h		;a91c
	cp 005h			;a91f
	jp z,la96ah		;a921
	cp 006h			;a924
	jp z,la970h		;a926
	cp 007h			;a929
	jp z,la973h		;a92b
	cp 008h			;a92e
	jp z,la979h		;a930
	cp 009h			;a933
	jp z,la982h		;a935
	cp 00ah			;a938
	jp z,la988h		;a93a
	cp 00bh			;a93d
	jp z,la991h		;a93f
	cp 00ch			;a942
	jp z,la997h		;a944
	cp 00dh			;a947
	jp z,la9a0h		;a949
	jp la9a3h		;a94c
la94fh:
	jp l86deh		;a94f
la952h:
	call sub_939dh		;a952
	jp l9b70h		;a955
la958h:
	call l86deh		;a958
	jp sub_939dh		;a95b
la95eh:
	call sub_7e26h		;a95e
	jp l9e05h		;a961
la964h:
	call sub_939dh		;a964
	jp l9e05h		;a967
la96ah:
	call sub_939dh		;a96a
	jp l9b70h		;a96d
la970h:
	jp sub_939dh		;a970
la973h:
	call sub_7e26h		;a973
	jp l86deh		;a976
la979h:
	call sub_8badh		;a979
	call sub_98d8h		;a97c
	jp 08ea6h		;a97f
la982h:
	call sub_8badh		;a982
	jp 08ea6h		;a985
la988h:
	call sub_8badh		;a988
	call sub_98d8h		;a98b
	jp 08ea6h		;a98e
la991h:
	call sub_7e26h		;a991
	jp l9e05h		;a994
la997h:
	call sub_8badh		;a997
	call l9b70h		;a99a
	jp sub_7e26h		;a99d
la9a0h:
	jp sub_98d8h		;a9a0
la9a3h:
	jp la573h		;a9a3
sub_a9a6h:
	ld b,00ah		;a9a6
	jp la9bfh		;a9a8
sub_a9abh:
	ld b,014h		;a9ab
	jp la9bfh		;a9ad
sub_a9b0h:
	ld b,01eh		;a9b0
	jp la9bfh		;a9b2
sub_a9b5h:
	ld b,028h		;a9b5
	jp la9bfh		;a9b7
	ld b,032h		;a9ba
	jp la9bfh		;a9bc
la9bfh:
	ld c,b			;a9bf
la9c0h:
	ld a,0f8h		;a9c0
	out (0feh),a		;a9c2
	push bc			;a9c4
la9c5h:
	ld b,c			;a9c5
la9c6h:
	djnz la9c6h		;a9c6
	pop bc			;a9c8
	ld a,000h		;a9c9
	out (0feh),a		;a9cb
	push bc			;a9cd
	ld b,c			;a9ce
la9cfh:
	djnz la9cfh		;a9cf
	pop bc			;a9d1
	djnz la9c0h		;a9d2
	ret			;a9d4
sub_a9d5h:
	ld bc,00260h		;a9d5
	ld hl,05800h		;a9d8
la9dbh:
	ld a,000h		;a9db
	ld (hl),a		;a9dd
	inc hl			;a9de
	dec bc			;a9df
	ld a,b			;a9e0
	or c			;a9e1
	jp nz,la9dbh		;a9e2
	ld b,002h		;a9e5
la9e7h:
	ld de,lffffh		;a9e7
la9eah:
	dec de			;a9ea
	ld a,e			;a9eb
	or d			;a9ec
	jp nz,la9eah		;a9ed
	djnz la9e7h		;a9f0
	ld de,0480eh		;a9f2
	ld hl,le69dh		;a9f5
	ld b,003h		;a9f8
la9fah:
	push bc			;a9fa
	push de			;a9fb
	ld b,008h		;a9fc
la9feh:
	push bc			;a9fe
	push de			;a9ff
	ld bc,00004h		;aa00
	ldir			;aa03
	pop de			;aa05
	inc d			;aa06
	pop bc			;aa07
	djnz la9feh		;aa08
	pop de			;aa0a
	ld bc,00020h		;aa0b
	ex de,hl		;aa0e
	add hl,bc		;aa0f
	ex de,hl		;aa10
	pop bc			;aa11
	djnz la9fah		;aa12
	ld hl,0590eh		;aa14
laa17h:
	ld a,007h		;aa17
	ld b,003h		;aa19
laa1bh:
	push bc			;aa1b
	ld b,004h		;aa1c
laa1eh:
	ld (hl),a		;aa1e
	inc hl			;aa1f
	djnz laa1eh		;aa20
	ld de,0001ch		;aa22
	add hl,de		;aa25
	pop bc			;aa26
	djnz laa1bh		;aa27
	ld b,003h		;aa29
laa2bh:
	ld de,lffffh		;aa2b
laa2eh:
	dec de			;aa2e
	ld a,e			;aa2f
	or d			;aa30
	jp nz,laa2eh		;aa31
	djnz laa2bh		;aa34
laa36h:
	ld a,(06a89h)		;aa36
laa39h:
	call sub_76c4h		;aa39
	jp nz,laa36h		;aa3c
	ret			;aa3f
laa40h:
	ld hl,0594bh		;aa40
laa43h:
	ld b,00ah		;aa43
	ld a,0fah		;aa45
laa47h:
	ld (hl),a		;aa47
	inc hl			;aa48
	djnz laa47h		;aa49
	ld hl,0484bh		;aa4b
	ld de,laa7eh		;aa4e
	ld c,008h		;aa51
laa53h:
	push hl			;aa53
laa54h:
	ld b,00ah		;aa54
laa56h:
	ld a,(de)		;aa56
	ld (hl),a		;aa57
	inc hl			;aa58
	inc de			;aa59
	djnz laa56h		;aa5a
	pop hl			;aa5c
	inc h			;aa5d
	dec c			;aa5e
	jr nz,laa53h		;aa5f
laa61h:
	ld de,01bc8h		;aa61
	ld ix,le337h		;aa64
	ld a,0ffh		;aa68
	scf			;aa6a
	ei			;aa6b
	call 00556h		;aa6c
	di			;aa6f
	ld hl,le337h		;aa70
	ld de,04000h		;aa73
	ld bc,01b00h		;aa76
	ldir			;aa79
	jp lfe37h		;aa7b
laa7eh:
	nop			;aa7e
	nop			;aa7f
	nop			;aa80
	nop			;aa81
	ld bc,00040h		;aa82
	nop			;aa85
	nop			;aa86
	and b			;aa87
	ld a,h			;aa88
	ld (bc),a		;aa89
	nop			;aa8a
	nop			;aa8b
	ld bc,0205fh		;aa8c
	inc a			;aa8f
	jp nz,062a0h		;aa90
	adc a,d			;aa93
	inc e			;aa94
laa95h:
	ld (hl),b		;aa95
	nop			;aa96
	jr laa39h		;aa97
	ld h,d			;aa99
	ld h,h			;aa9a
	nop			;aa9b
	ld b,d			;aa9c
	adc a,d			;aa9d
	jr nc,laaa8h		;aa9e
	nop			;aaa0
	djnz laa43h		;aaa1
	ld b,d			;aaa3
	jr c,laaa6h		;aaa4
laaa6h:
	ld a,h			;aaa6
	adc a,d			;aaa7
laaa8h:
	inc e			;aaa8
	ld a,b			;aaa9
	nop			;aaaa
	rra			;aaab
	jr nz,lab2ch		;aaac
laaaeh:
	djnz laab0h		;aaae
laab0h:
	ld b,b			;aab0
	rlc d			;aab1
	sbc a,b			;aab3
	nop			;aab4
	djnz $+50		;aab5
	ld b,d			;aab7
	djnz laabah		;aab8
laabah:
	ld b,b			;aaba
	ld (hl),c		;aabb
	cp h			;aabc
	ld a,b			;aabd
	nop			;aabe
	djnz $+65		;aabf
	ld b,d			;aac1
	djnz laac4h		;aac2
laac4h:
	nop			;aac4
	nop			;aac5
	nop			;aac6
	nop			;aac7
	nop			;aac8
	nop			;aac9
	nop			;aaca
	nop			;aacb
	nop			;aacc
laacdh:
	pop de			;aacd
	ret			;aace
sub_aacfh:
	ld hl,lab5ah		;aacf
	ld de,0590ah		;aad2
	ld bc,00016h		;aad5
	ldir			;aad8
	ld de,0592ah		;aada
	ld hl,lab44h		;aadd
	ld bc,00016h		;aae0
	ldir			;aae3
	ld hl,04815h		;aae5
	ld de,lab70h		;aae8
	ld b,002h		;aaeb
laaedh:
	push bc			;aaed
	ld c,004h		;aaee
laaf0h:
	ld b,00bh		;aaf0
	push hl			;aaf2
laaf3h:
	ld a,(de)		;aaf3
	ld (hl),a		;aaf4
	inc hl			;aaf5
	inc de			;aaf6
	djnz laaf3h		;aaf7
	pop hl			;aaf9
	inc h			;aafa
	inc h			;aafb
	dec c			;aafc
	jr nz,laaf0h		;aafd
laaffh:
	ld bc,007e0h		;aaff
	and a			;ab02
	sbc hl,bc		;ab03
	pop bc			;ab05
	djnz laaedh		;ab06
	ld d,070h		;ab08
lab0ah:
	ld bc,003e8h		;ab0a
lab0dh:
	dec bc			;ab0d
	ld a,b			;ab0e
	or c			;ab0f
	jr nz,lab0dh		;ab10
	push de			;ab12
	ld a,01dh		;ab13
	call sub_76c4h		;ab15
	jp z,laacdh		;ab18
	pop de			;ab1b
	ld e,002h		;ab1c
	ld hl,04820h		;ab1e
lab21h:
	push de			;ab21
	ld c,008h		;ab22
lab24h:
	ld b,016h		;ab24
	and a			;ab26
lab27h:
	rl (hl)			;ab27
	dec hl			;ab29
	djnz lab27h		;ab2a
lab2ch:
	ld de,00016h		;ab2c
	add hl,de		;ab2f
	inc h			;ab30
	dec c			;ab31
	jr nz,lab24h		;ab32
	ld de,007e0h		;ab34
	and a			;ab37
	sbc hl,de		;ab38
	pop de			;ab3a
	dec e			;ab3b
	jr nz,lab21h		;ab3c
	dec d			;ab3e
	jr nz,lab0ah		;ab3f
	jp sub_aacfh		;ab41
lab44h:
	ld b,006h		;ab44
	ld b,006h		;ab46
	ld b,006h		;ab48
	ld b,006h		;ab4a
	ld b,006h		;ab4c
	ld b,000h		;ab4e
	nop			;ab50
	nop			;ab51
	nop			;ab52
	nop			;ab53
	nop			;ab54
	nop			;ab55
	nop			;ab56
	nop			;ab57
	nop			;ab58
	nop			;ab59
lab5ah:
	inc bc			;ab5a
	inc bc			;ab5b
	inc bc			;ab5c
	inc bc			;ab5d
	inc bc			;ab5e
	inc bc			;ab5f
	inc bc			;ab60
	inc bc			;ab61
	inc bc			;ab62
	inc bc			;ab63
	inc bc			;ab64
	nop			;ab65
	nop			;ab66
	nop			;ab67
	nop			;ab68
	nop			;ab69
	nop			;ab6a
	nop			;ab6b
	nop			;ab6c
	nop			;ab6d
	nop			;ab6e
	nop			;ab6f
lab70h:
	call m,sub_c0c6h	;ab70
	cp 0feh			;ab73
	nop			;ab75
	cp 0c6h			;ab76
	cp 0feh			;ab78
	call m,sub_c6feh	;ab7a
	ret nz			;ab7d
	cp 0feh			;ab7e
	nop			;ab80
	cp 0e6h			;ab81
	cp 0feh			;ab83
	cp 0c6h			;ab85
	add a,0c0h		;ab87
	ret nz			;ab89
	add a,000h		;ab8a
	ret nz			;ab8c
	and 038h		;ab8d
	ret nz			;ab8f
	add a,0c6h		;ab90
	add a,0c0h		;ab92
	cp 0c6h			;ab94
sub_ab96h:
	nop			;ab96
	cp 0feh			;ab97
lab99h:
	jr c,lab99h		;ab99
	add a,0feh		;ab9b
	add a,0c0h		;ab9d
lab9fh:
	cp 0feh			;ab9f
	nop			;aba1
	cp 0deh			;aba2
laba4h:
	jr c,laba4h		;aba4
	call m,sub_c6fch	;aba6
	ret nz			;aba9
	ld b,0feh		;abaa
	nop			;abac
	ret nz			;abad
	adc a,038h		;abae
	ret nz			;abb0
	ret m			;abb1
	ret nz			;abb2
	cp 0feh			;abb3
	cp 0c6h			;abb5
	nop			;abb7
	cp 0c6h			;abb8
labbah:
	jr c,labbah		;abba
	call c,sub_fec0h	;abbc
	cp 0feh			;abbf
	add a,000h		;abc1
	cp 0c6h			;abc3
labc5h:
	jr c,labc5h		;abc5
	adc a,0c3h		;abc7
	xor d			;abc9
	and a			;abca
	nop			;abcb
	nop			;abcc
	nop			;abcd
	nop			;abce
	nop			;abcf
	nop			;abd0
	nop			;abd1
	nop			;abd2
labd3h:
	nop			;abd3
	nop			;abd4
	nop			;abd5
	nop			;abd6
	nop			;abd7
	nop			;abd8
	nop			;abd9
	nop			;abda
labdbh:
	nop			;abdb
	nop			;abdc
	nop			;abdd
	nop			;abde
	nop			;abdf
	dec b			;abe0
	inc b			;abe1
	ret z			;abe2
	xor a			;abe3
	ld b,003h		;abe4
	inc b			;abe6
	ld l,b			;abe7
	or b			;abe8
	rlca			;abe9
	ld (bc),a		;abea
	inc b			;abeb
	jr z,lab9fh		;abec
	rlca			;abee
	inc bc			;abef
	inc b			;abf0
	xor b			;abf1
labf2h:
	or c			;abf2
	rlca			;abf3
	inc b			;abf4
	inc b			;abf5
	ld l,b			;abf6
	or d			;abf7
	dec b			;abf8
	inc bc			;abf9
	inc b			;abfa
	ret pe			;abfb
	or d			;abfc
labfdh:
	rlca			;abfd
	ld (bc),a		;abfe
	ld (bc),a		;abff
	ld c,b			;ac00
	or e			;ac01
	rlca			;ac02
	ld (bc),a		;ac03
	ld (bc),a		;ac04
	adc a,b			;ac05
	or e			;ac06
	rlca			;ac07
	dec b			;ac08
	rlca			;ac09
	ret z			;ac0a
	or e			;ac0b
	ld b,004h		;ac0c
	dec b			;ac0e
lac0fh:
	ret po			;ac0f
	or h			;ac10
	rlca			;ac11
	ld (bc),a		;ac12
	dec b			;ac13
	add a,b			;ac14
	or l			;ac15
	rlca			;ac16
	inc bc			;ac17
	ld (bc),a		;ac18
	ret nc			;ac19
	or l			;ac1a
	rlca			;ac1b
	dec b			;ac1c
	inc bc			;ac1d
	nop			;ac1e
	or (hl)			;ac1f
	rlca			;ac20
	inc bc			;ac21
	ld b,078h		;ac22
	or (hl)			;ac24
	rlca			;ac25
	ld (bc),a		;ac26
	dec b			;ac27
	ex af,af'		;ac28
	or a			;ac29
	rlca			;ac2a
	ex af,af'		;ac2b
	inc b			;ac2c
	ld e,b			;ac2d
	or a			;ac2e
	rlca			;ac2f
	ld b,002h		;ac30
	ld e,b			;ac32
	cp b			;ac33
	rlca			;ac34
	inc b			;ac35
	ld (bc),a		;ac36
	jr labf2h		;ac37
lac39h:
	rlca			;ac39
	inc bc			;ac3a
	ld (bc),a		;ac3b
	sbc a,b			;ac3c
	cp c			;ac3d
lac3eh:
	rlca			;ac3e
	inc b			;ac3f
	inc bc			;ac40
	ret m			;ac41
	cp c			;ac42
	rlca			;ac43
	inc b			;ac44
	ld (bc),a		;ac45
	ld e,b			;ac46
	cp d			;ac47
	rlca			;ac48
	dec b			;ac49
	ex af,af'		;ac4a
	sbc a,b			;ac4b
	cp d			;ac4c
	rlca			;ac4d
	dec b			;ac4e
	dec b			;ac4f
	jr lac0fh		;ac50
	rlca			;ac52
	inc b			;ac53
	ex af,af'		;ac54
	xor b			;ac55
	cp (hl)			;ac56
	rlca			;ac57
	inc b			;ac58
	ld a,(bc)		;ac59
	xor b			;ac5a
	cp a			;ac5b
	rlca			;ac5c
	inc bc			;ac5d
	ld a,(bc)		;ac5e
	ret pe			;ac5f
	ret nz			;ac60
	rlca			;ac61
	ld b,006h		;ac62
	ret c			;ac64
	pop bc			;ac65
	rlca			;ac66
	ld (bc),a		;ac67
	ld b,0f8h		;ac68
	jp nz,00607h		;ac6a
	inc b			;ac6d
	ld e,b			;ac6e
	jp 00106h		;ac6f
	inc b			;ac72
	jr lac39h		;ac73
	rlca			;ac75
	ld b,004h		;ac76
	jr c,lac3eh		;ac78
	rlca			;ac7a
	dec b			;ac7b
	ld b,0f8h		;ac7c
	call nz,00507h		;ac7e
	ld b,0e8h		;ac81
	push bc			;ac83
	rlca			;ac84
	inc b			;ac85
	ex af,af'		;ac86
	ret z			;ac87
	rst 0			;ac88
	rlca			;ac89
	ld (bc),a		;ac8a
	ex af,af'		;ac8b
	ret z			;ac8c
sub_ac8dh:
	ret z			;ac8d
	rlca			;ac8e
	ld b,00eh		;ac8f
	ld c,b			;ac91
	ret			;ac92
	rlca			;ac93
	inc bc			;ac94
	inc b			;ac95
	ret pe			;ac96
	rlc a			;ac97
	inc b			;ac99
	ld (bc),a		;ac9a
	xor b			;ac9b
	call z,00607h		;ac9c
	inc bc			;ac9f
	ret pe			;aca0
	call z,00807h		;aca1
sub_aca4h:
	dec c			;aca4
	ex af,af'		;aca5
	adc a,007h		;aca6
	ld (bc),a		;aca8
	inc b			;aca9
	ld c,b			;acaa
	pop de			;acab
	rlca			;acac
	inc b			;acad
	inc b			;acae
	ret z			;acaf
	pop de			;acb0
	rlca			;acb1
	ld (bc),a		;acb2
	ld (bc),a		;acb3
	ret z			;acb4
	jp nc,00107h		;acb5
	ld bc,ld2e8h		;acb8
	rlca			;acbb
	ld bc,lf001h		;acbc
	jp nc,00107h		;acbf
	ld bc,ld2f8h		;acc2
	nop			;acc5
	nop			;acc6
	nop			;acc7
	nop			;acc8
	nop			;acc9
	nop			;acca
	nop			;accb
	nop			;accc
	nop			;accd
	nop			;acce
	nop			;accf
	nop			;acd0
	nop			;acd1
	nop			;acd2
	nop			;acd3
	nop			;acd4
	nop			;acd5
	nop			;acd6
	nop			;acd7
	nop			;acd8
	nop			;acd9
	nop			;acda
	nop			;acdb
	nop			;acdc
	nop			;acdd
	nop			;acde
	nop			;acdf
	nop			;ace0
	nop			;ace1
	nop			;ace2
	nop			;ace3
	nop			;ace4
	nop			;ace5
	nop			;ace6
	nop			;ace7
	nop			;ace8
	nop			;ace9
	nop			;acea
	nop			;aceb
	nop			;acec
	nop			;aced
	nop			;acee
	nop			;acef
	nop			;acf0
	nop			;acf1
	nop			;acf2
	nop			;acf3
	nop			;acf4
	nop			;acf5
	nop			;acf6
	nop			;acf7
	nop			;acf8
	nop			;acf9
	nop			;acfa
	nop			;acfb
	nop			;acfc
	nop			;acfd
	nop			;acfe
	nop			;acff
lad00h:
	nop			;ad00
	nop			;ad01
	nop			;ad02
	nop			;ad03
	nop			;ad04
	nop			;ad05
	nop			;ad06
	nop			;ad07
	nop			;ad08
	nop			;ad09
	nop			;ad0a
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
	nop			;ad2b
	nop			;ad2c
	nop			;ad2d
	nop			;ad2e
	nop			;ad2f
	nop			;ad30
	nop			;ad31
	nop			;ad32
	nop			;ad33
	nop			;ad34
	nop			;ad35
	nop			;ad36
	nop			;ad37
	nop			;ad38
	nop			;ad39
	nop			;ad3a
	nop			;ad3b
	nop			;ad3c
	nop			;ad3d
	nop			;ad3e
	nop			;ad3f
	nop			;ad40
	nop			;ad41
	nop			;ad42
	nop			;ad43
	nop			;ad44
	nop			;ad45
	nop			;ad46
	nop			;ad47
	nop			;ad48
	nop			;ad49
	nop			;ad4a
	nop			;ad4b
	nop			;ad4c
	nop			;ad4d
	nop			;ad4e
	nop			;ad4f
	nop			;ad50
	nop			;ad51
	nop			;ad52
	nop			;ad53
	nop			;ad54
	nop			;ad55
	nop			;ad56
	nop			;ad57
	nop			;ad58
	nop			;ad59
	nop			;ad5a
	nop			;ad5b
	nop			;ad5c
	nop			;ad5d
	nop			;ad5e
	nop			;ad5f
	nop			;ad60
	nop			;ad61
	nop			;ad62
	nop			;ad63
	nop			;ad64
	nop			;ad65
	nop			;ad66
	nop			;ad67
	nop			;ad68
	nop			;ad69
	nop			;ad6a
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
	nop			;ad8b
	nop			;ad8c
	nop			;ad8d
	nop			;ad8e
	nop			;ad8f
	nop			;ad90
	nop			;ad91
	nop			;ad92
	nop			;ad93
	nop			;ad94
	nop			;ad95
	nop			;ad96
	nop			;ad97
	nop			;ad98
	nop			;ad99
	nop			;ad9a
	nop			;ad9b
	nop			;ad9c
	nop			;ad9d
	nop			;ad9e
	nop			;ad9f
	nop			;ada0
	nop			;ada1
	nop			;ada2
	nop			;ada3
	nop			;ada4
	nop			;ada5
	nop			;ada6
	nop			;ada7
	nop			;ada8
	nop			;ada9
	nop			;adaa
	nop			;adab
	nop			;adac
	nop			;adad
	nop			;adae
	nop			;adaf
	nop			;adb0
	nop			;adb1
	nop			;adb2
	nop			;adb3
	nop			;adb4
	nop			;adb5
	nop			;adb6
	nop			;adb7
	nop			;adb8
	nop			;adb9
	nop			;adba
	nop			;adbb
	nop			;adbc
	nop			;adbd
	nop			;adbe
	nop			;adbf
	nop			;adc0
	nop			;adc1
	nop			;adc2
	nop			;adc3
	nop			;adc4
	nop			;adc5
	nop			;adc6
	nop			;adc7
	nop			;adc8
	nop			;adc9
	nop			;adca
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
	nop			;adeb
	nop			;adec
	nop			;aded
	nop			;adee
	nop			;adef
	nop			;adf0
	nop			;adf1
	nop			;adf2
	nop			;adf3
	nop			;adf4
	nop			;adf5
	nop			;adf6
	nop			;adf7
	nop			;adf8
	nop			;adf9
ladfah:
	nop			;adfa
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
	nop			;ae0b
	nop			;ae0c
	nop			;ae0d
	nop			;ae0e
	nop			;ae0f
	nop			;ae10
	nop			;ae11
	nop			;ae12
	nop			;ae13
	nop			;ae14
	nop			;ae15
	nop			;ae16
	nop			;ae17
	nop			;ae18
	nop			;ae19
	nop			;ae1a
	nop			;ae1b
	nop			;ae1c
	nop			;ae1d
	nop			;ae1e
	nop			;ae1f
	nop			;ae20
	nop			;ae21
	nop			;ae22
	nop			;ae23
	nop			;ae24
	nop			;ae25
	nop			;ae26
	nop			;ae27
	nop			;ae28
	nop			;ae29
	nop			;ae2a
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
	nop			;ae4b
	nop			;ae4c
	nop			;ae4d
	nop			;ae4e
	nop			;ae4f
	nop			;ae50
	nop			;ae51
	nop			;ae52
	nop			;ae53
	nop			;ae54
	nop			;ae55
	nop			;ae56
	nop			;ae57
	nop			;ae58
	nop			;ae59
	nop			;ae5a
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
	nop			;ae6b
	nop			;ae6c
	nop			;ae6d
	nop			;ae6e
	nop			;ae6f
	nop			;ae70
	nop			;ae71
	nop			;ae72
	nop			;ae73
	nop			;ae74
	nop			;ae75
	nop			;ae76
	nop			;ae77
	nop			;ae78
	nop			;ae79
	nop			;ae7a
	nop			;ae7b
	nop			;ae7c
	nop			;ae7d
	nop			;ae7e
	nop			;ae7f
	nop			;ae80
	nop			;ae81
	nop			;ae82
	nop			;ae83
	nop			;ae84
	nop			;ae85
	nop			;ae86
	nop			;ae87
	nop			;ae88
	nop			;ae89
	nop			;ae8a
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
sub_aeaah:
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
	nop			;aedc
	nop			;aedd
	nop			;aede
	nop			;aedf
	nop			;aee0
	nop			;aee1
	nop			;aee2
	nop			;aee3
	nop			;aee4
	nop			;aee5
	nop			;aee6
	nop			;aee7
	nop			;aee8
	nop			;aee9
	nop			;aeea
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
laf0dh:
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
	nop			;af41
	nop			;af42
	nop			;af43
	nop			;af44
	nop			;af45
	nop			;af46
	nop			;af47
	nop			;af48
	nop			;af49
	add a,c			;af4a
	ld (hl),h		;af4b
	ld b,001h		;af4c
	ld e,e			;af4e
	ld h,(hl)		;af4f
	ld hl,02175h		;af50
	ld (hl),l		;af53
	ld (bc),a		;af54
laf55h:
	ld bc,00700h		;af55
	ld (bc),a		;af58
	ld bc,01b03h		;af59
	ld (bc),a		;af5c
	ld bc,01903h		;af5d
	jr laf0dh		;af60
	dec c			;af62
	xor e			;af63
	cp (hl)			;af64
	and a			;af65
	call po,058a6h		;af66
	and a			;af69
	ld e,b			;af6a
	and a			;af6b
	ld e,b			;af6c
	and a			;af6d
	ld e,b			;af6e
	and a			;af6f
	ld e,b			;af70
	and a			;af71
	ld e,b			;af72
	and a			;af73
	ld e,b			;af74
	and a			;af75
	ld e,b			;af76
	and a			;af77
laf78h:
	ld e,b			;af78
	and a			;af79
	ld e,b			;af7a
	and a			;af7b
	ld e,b			;af7c
	and a			;af7d
	ld e,b			;af7e
	and a			;af7f
	ld e,b			;af80
	and a			;af81
	ld e,b			;af82
	and a			;af83
	ld e,b			;af84
	and a			;af85
	ld e,b			;af86
	and a			;af87
	ld e,b			;af88
	and a			;af89
	ld e,b			;af8a
	and a			;af8b
	ld e,b			;af8c
	and a			;af8d
	ld e,b			;af8e
	and a			;af8f
	ld e,b			;af90
	and a			;af91
	ld e,b			;af92
	and a			;af93
	ld e,b			;af94
	and a			;af95
	ld e,b			;af96
	and a			;af97
	ld e,b			;af98
	and a			;af99
	ld e,b			;af9a
	and a			;af9b
	ld e,b			;af9c
	and a			;af9d
	ld e,b			;af9e
	and a			;af9f
	ld e,b			;afa0
	and a			;afa1
	ld e,b			;afa2
	and a			;afa3
lafa4h:
	ld e,b			;afa4
	and a			;afa5
	ld e,b			;afa6
	and a			;afa7
	ld e,b			;afa8
	and a			;afa9
	ld e,b			;afaa
	and a			;afab
	ld e,b			;afac
	and a			;afad
	ld e,b			;afae
	and a			;afaf
	dec hl			;afb0
	dec l			;afb1
	ld h,l			;afb2
	inc sp			;afb3
	ld a,a			;afb4
	djnz lafa4h		;afb5
	djnz lafc6h		;afb7
	nop			;afb9
	add hl,bc		;afba
	nop			;afbb
	add a,l			;afbc
	inc e			;afbd
	djnz lafdch		;afbe
	ld d,d			;afc0
	dec de			;afc1
	halt			;afc2
	dec de			;afc3
	inc bc			;afc4
	inc de			;afc5
lafc6h:
	nop			;afc6
	ld a,0bfh		;afc7
	rst 18h			;afc9
	ld h,a			;afca
	rst 10h			;afcb
	ld h,(hl)		;afcc
	or e			;afcd
	ld l,c			;afce
	push de			;afcf
	ret pe			;afd0
	push de			;afd1
	ld a,(bc)		;afd2
	cp (hl)			;afd3
	ld (bc),a		;afd4
	defb 0fdh,0deh,0bfh ;illegal sequence	;afd5
	rst 38h			;afd8
	rst 38h			;afd9
	rst 38h			;afda
	ei			;afdb
lafdch:
	ld a,a			;afdc
	ld a,a			;afdd
	ld a,a			;afde
	ccf			;afdf
	sbc a,a			;afe0
	ld c,a			;afe1
	and b			;afe2
	ld d,l			;afe3
	rst 38h			;afe4
	ld h,b			;afe5
	or a			;afe6
	ld d,a			;afe7
	or e			;afe8
	ld e,e			;afe9
	xor e			;afea
	exx			;afeb
	defb 0edh ;next byte illegal after ed	;afec
	push de			;afed
	ex (sp),hl		;afee
	ei			;afef
	ld d,l			;aff0
	ld hl,(l7ef4h+1)	;aff1
	rst 38h			;aff4
	rst 38h			;aff5
	rst 38h			;aff6
	defb 0fdh,07fh,00fh ;illegal sequence	;aff7
	and b			;affa
	sub c			;affb
	add a,b			;affc
	ld l,a			;affd
	and a			;affe
	ld d,a			;afff
	or a			;b000
	rst 10h			;b001
	and e			;b002
	ret			;b003
lb004h:
	push af			;b004
	ret m			;b005
	or 03bh			;b006
	cp 0f9h			;b008
	dec e			;b00a
	ld b,c			;b00b
	rst 38h			;b00c
	ld hl,(lfe95h)		;b00d
	rst 38h			;b010
	rst 38h			;b011
	cp a			;b012
	rst 38h			;b013
	rst 38h			;b014
	defb 0fdh,0f7h,0ffh ;illegal sequence	;b015
	cp a			;b018
	sub e			;b019
	ld e,a			;b01a
	rst 8			;b01b
	and a			;b01c
	ld (hl),e		;b01d
	xor c			;b01e
	ld d,l			;b01f
	cp b			;b020
	push de			;b021
	ld a,(bc)		;b022
	ld a,a			;b023
	dec d			;b024
	jp pe,lfffdh		;b025
	ld a,a			;b028
	rst 38h			;b029
	rst 38h			;b02a
	rst 38h			;b02b
	rst 38h			;b02c
	defb 0fdh,07fh,03fh ;illegal sequence	;b02d
	sbc a,a			;b030
	ld b,e			;b031
	xor b			;b032
	ld d,l			;b033
	ei			;b034
	and b			;b035
	ld d,a			;b036
	or a			;b037
	ld d,e			;b038
	xor c			;b039
	call c,sub_d5aah	;b03a
	xor 0f7h		;b03d
	jp p,laa54h+1		;b03f
	defb 0fdh,0feh,0ffh ;illegal sequence	;b042
	rst 30h			;b045
	rst 18h			;b046
	rst 38h			;b047
	ld a,a			;b048
	rrca			;b049
	and b			;b04a
	ld b,a			;b04b
	ld h,b			;b04c
	xor a			;b04d
	ld h,a			;b04e
	or a			;b04f
	ld d,e			;b050
	xor e			;b051
	exx			;b052
	call pe,sub_fdf6h	;b053
	or 0fbh			;b056
	jp m,l7df9h		;b058
	ld bc,0057eh		;b05b
	jp m,lbfffh		;b05e
	rst 30h			;b061
	rst 38h			;b062
	ld a,a			;b063
	ld a,09fh		;b064
	ld b,e			;b066
	xor e			;b067
	rst 38h			;b068
	nop			;b069
	rst 38h			;b06a
	nop			;b06b
	rst 38h			;b06c
	nop			;b06d
	rst 38h			;b06e
	nop			;b06f
	rst 38h			;b070
	nop			;b071
	rst 38h			;b072
	nop			;b073
	rst 38h			;b074
	nop			;b075
	rst 38h			;b076
	nop			;b077
	rst 38h			;b078
	nop			;b079
	rst 38h			;b07a
	nop			;b07b
	rst 38h			;b07c
	nop			;b07d
	rst 38h			;b07e
	nop			;b07f
	rst 38h			;b080
	nop			;b081
	rst 38h			;b082
	nop			;b083
	rst 38h			;b084
	nop			;b085
	cp 000h			;b086
	call m,sub_f801h	;b088
	ld (bc),a		;b08b
	ret p			;b08c
	dec b			;b08d
	ret p			;b08e
	ld b,0e0h		;b08f
	inc b			;b091
	ret nz			;b092
	jr lb095h		;b093
lb095h:
	dec hl			;b095
	nop			;b096
	rst 10h			;b097
	rst 38h			;b098
	nop			;b099
	rst 38h			;b09a
	nop			;b09b
	rst 38h			;b09c
	nop			;b09d
	rst 38h			;b09e
	nop			;b09f
	rst 38h			;b0a0
	nop			;b0a1
	rst 38h			;b0a2
	nop			;b0a3
	rst 38h			;b0a4
	nop			;b0a5
	rst 38h			;b0a6
	nop			;b0a7
	rst 38h			;b0a8
	nop			;b0a9
	rst 38h			;b0aa
	nop			;b0ab
	rst 38h			;b0ac
	nop			;b0ad
	rst 38h			;b0ae
	nop			;b0af
	rst 38h			;b0b0
	nop			;b0b1
	rst 38h			;b0b2
	nop			;b0b3
	ld (bc),a		;b0b4
	nop			;b0b5
	nop			;b0b6
	defb 0fdh,000h,05fh ;illegal sequence	;b0b7
	nop			;b0ba
	ccf			;b0bb
	nop			;b0bc
	ld a,a			;b0bd
	nop			;b0be
	ld a,a			;b0bf
	nop			;b0c0
	rst 38h			;b0c1
	nop			;b0c2
	defb 0fdh,000h,0ffh ;illegal sequence	;b0c3
	nop			;b0c6
	ld a,a			;b0c7
	cp 000h			;b0c8
	call m,sub_f801h	;b0ca
	ld (bc),a		;b0cd
	ret m			;b0ce
	inc bc			;b0cf
	ret m			;b0d0
	ld (bc),a		;b0d1
	ret p			;b0d2
	inc b			;b0d3
	ret po			;b0d4
	ld a,(bc)		;b0d5
	ret po			;b0d6
	inc c			;b0d7
	ret nz			;b0d8
	ld de,02380h		;b0d9
	add a,b			;b0dc
	dec hl			;b0dd
	ret nz			;b0de
	ld de,019c0h		;b0df
	ret nz			;b0e2
	ld de,02380h		;b0e3
	nop			;b0e6
	ld e,a			;b0e7
	nop			;b0e8
	rst 38h			;b0e9
	nop			;b0ea
	rst 38h			;b0eb
	nop			;b0ec
	defb 0fdh,000h,0ffh ;illegal sequence	;b0ed
	nop			;b0f0
	rst 38h			;b0f1
	nop			;b0f2
	rst 38h			;b0f3
	nop			;b0f4
	ld a,a			;b0f5
	nop			;b0f6
	rst 38h			;b0f7
	nop			;b0f8
	rst 38h			;b0f9
	nop			;b0fa
	ld e,a			;b0fb
	nop			;b0fc
	cp a			;b0fd
	nop			;b0fe
	ccf			;b0ff
	nop			;b100
	ccf			;b101
	nop			;b102
	ld a,a			;b103
	nop			;b104
	rst 38h			;b105
	nop			;b106
	rst 38h			;b107
	nop			;b108
	defb 0fdh,000h,0ffh ;illegal sequence	;b109
	nop			;b10c
	rst 38h			;b10d
	nop			;b10e
	rst 38h			;b10f
	nop			;b110
	rst 38h			;b111
	nop			;b112
	rst 38h			;b113
	nop			;b114
	rst 30h			;b115
	nop			;b116
	rst 30h			;b117
	nop			;b118
	rst 38h			;b119
	nop			;b11a
	rst 38h			;b11b
	nop			;b11c
	rst 38h			;b11d
	nop			;b11e
	rst 38h			;b11f
	nop			;b120
	rst 38h			;b121
	nop			;b122
	rst 38h			;b123
	nop			;b124
	rst 38h			;b125
	nop			;b126
	rst 38h			;b127
	rrca			;b128
	ret nz			;b129
	rlca			;b12a
	ret p			;b12b
	inc bc			;b12c
	ret m			;b12d
	ld (bc),a		;b12e
	ret m			;b12f
	nop			;b130
	ld sp,hl		;b131
	nop			;b132
	sbc a,000h		;b133
	defb 0fdh,000h,0feh ;illegal sequence	;b135
	nop			;b138
	cp 000h			;b139
	cp 000h			;b13b
	rst 38h			;b13d
	nop			;b13e
	rst 38h			;b13f
	nop			;b140
	rst 38h			;b141
	nop			;b142
	rst 38h			;b143
	nop			;b144
	rst 38h			;b145
	nop			;b146
	rst 38h			;b147
	rst 38h			;b148
	nop			;b149
	rst 38h			;b14a
	nop			;b14b
	rst 38h			;b14c
	nop			;b14d
	ld de,00000h		;b14e
	xor 000h		;b151
	cp a			;b153
	nop			;b154
	ld a,a			;b155
	nop			;b156
	ld a,a			;b157
	nop			;b158
	ld a,a			;b159
	nop			;b15a
	rst 38h			;b15b
	nop			;b15c
	rst 38h			;b15d
	nop			;b15e
	rst 38h			;b15f
	nop			;b160
	rst 38h			;b161
	nop			;b162
	rst 38h			;b163
	nop			;b164
	cp 000h			;b165
	rst 38h			;b167
	rst 38h			;b168
	nop			;b169
	cp 000h			;b16a
	call m,sub_e001h	;b16c
	ld (bc),a		;b16f
	ret nz			;b170
	rra			;b171
	nop			;b172
	inc hl			;b173
	nop			;b174
	rst 8			;b175
	nop			;b176
	rst 18h			;b177
	nop			;b178
	rst 38h			;b179
	nop			;b17a
	rst 38h			;b17b
	nop			;b17c
	rst 38h			;b17d
	nop			;b17e
	rst 38h			;b17f
	nop			;b180
	rst 38h			;b181
	nop			;b182
	rst 38h			;b183
	nop			;b184
	rst 38h			;b185
	nop			;b186
	cp a			;b187
	nop			;b188
	ld (hl),a		;b189
	nop			;b18a
	xor a			;b18b
	nop			;b18c
	ld e,a			;b18d
	nop			;b18e
	cp a			;b18f
	nop			;b190
	rst 38h			;b191
	nop			;b192
	rst 38h			;b193
	nop			;b194
	rst 38h			;b195
	nop			;b196
	rst 30h			;b197
	nop			;b198
	rst 38h			;b199
	nop			;b19a
	rst 38h			;b19b
	nop			;b19c
	rst 38h			;b19d
	nop			;b19e
	rst 38h			;b19f
	nop			;b1a0
	rst 38h			;b1a1
	nop			;b1a2
	rst 38h			;b1a3
	nop			;b1a4
	rst 38h			;b1a5
	nop			;b1a6
	rst 38h			;b1a7
	rrca			;b1a8
	ret nz			;b1a9
	ld b,0f0h		;b1aa
	nop			;b1ac
	ld sp,hl		;b1ad
	nop			;b1ae
	jp m,sub_fd00h		;b1af
	nop			;b1b2
	jp m,lfeffh+1		;b1b3
	nop			;b1b6
	rst 38h			;b1b7
	nop			;b1b8
	ei			;b1b9
	nop			;b1ba
	rst 38h			;b1bb
	nop			;b1bc
	rst 38h			;b1bd
	nop			;b1be
	ld a,a			;b1bf
	nop			;b1c0
	rst 38h			;b1c1
	nop			;b1c2
	rst 38h			;b1c3
	nop			;b1c4
	rst 38h			;b1c5
	nop			;b1c6
	rst 38h			;b1c7
	nop			;b1c8
	rst 38h			;b1c9
	nop			;b1ca
	rst 18h			;b1cb
	nop			;b1cc
	rst 38h			;b1cd
	nop			;b1ce
	rst 38h			;b1cf
	nop			;b1d0
	rst 38h			;b1d1
	nop			;b1d2
	rst 38h			;b1d3
	nop			;b1d4
	cp 000h			;b1d5
	rst 38h			;b1d7
	rst 38h			;b1d8
	nop			;b1d9
	rrca			;b1da
	nop			;b1db
	inc bc			;b1dc
	ret p			;b1dd
	ld bc,000bch		;b1de
	ld a,(hl)		;b1e1
	nop			;b1e2
	rst 38h			;b1e3
	nop			;b1e4
	rst 38h			;b1e5
	nop			;b1e6
	rst 38h			;b1e7
	nop			;b1e8
	cp 000h			;b1e9
	or 000h			;b1eb
	rst 30h			;b1ed
	nop			;b1ee
	rst 38h			;b1ef
	nop			;b1f0
	rst 38h			;b1f1
	nop			;b1f2
	cp (hl)			;b1f3
	nop			;b1f4
	rst 38h			;b1f5
	nop			;b1f6
	rst 38h			;b1f7
	nop			;b1f8
	rst 38h			;b1f9
	nop			;b1fa
	rst 38h			;b1fb
	nop			;b1fc
	rst 38h			;b1fd
	nop			;b1fe
	rst 38h			;b1ff
	nop			;b200
	rst 38h			;b201
	nop			;b202
	rst 38h			;b203
	nop			;b204
	rst 38h			;b205
	nop			;b206
	rst 38h			;b207
	rst 38h			;b208
	nop			;b209
	rst 38h			;b20a
	nop			;b20b
	rst 38h			;b20c
	nop			;b20d
	rst 38h			;b20e
	nop			;b20f
	rst 38h			;b210
	nop			;b211
	ld a,a			;b212
	nop			;b213
	ld a,a			;b214
	nop			;b215
	ld a,a			;b216
	nop			;b217
	rst 38h			;b218
	nop			;b219
	rst 38h			;b21a
	nop			;b21b
	ld bc,00000h		;b21c
	ld a,(hl)		;b21f
	nop			;b220
	xor a			;b221
	nop			;b222
	ld e,a			;b223
	nop			;b224
	cp a			;b225
	nop			;b226
	ccf			;b227
	nop			;b228
	rst 38h			;b229
	nop			;b22a
	rst 38h			;b22b
	nop			;b22c
	rst 38h			;b22d
	nop			;b22e
	rst 38h			;b22f
	nop			;b230
	ld sp,hl		;b231
	nop			;b232
	rst 38h			;b233
	nop			;b234
	rst 38h			;b235
	nop			;b236
	rst 38h			;b237
	rst 38h			;b238
	nop			;b239
	rst 38h			;b23a
	nop			;b23b
	rst 38h			;b23c
	nop			;b23d
	rst 38h			;b23e
	nop			;b23f
	rst 38h			;b240
	nop			;b241
	rst 38h			;b242
	nop			;b243
	rst 38h			;b244
	nop			;b245
	rst 38h			;b246
	nop			;b247
	rst 38h			;b248
	nop			;b249
	rst 38h			;b24a
	nop			;b24b
	rst 38h			;b24c
	nop			;b24d
	rst 38h			;b24e
	nop			;b24f
	ld a,a			;b250
	nop			;b251
	ld a,a			;b252
	nop			;b253
	ld a,a			;b254
	nop			;b255
	ccf			;b256
	add a,b			;b257
	ccf			;b258
	add a,b			;b259
	rra			;b25a
	ret nz			;b25b
	rra			;b25c
	ret nz			;b25d
	inc bc			;b25e
	ret nz			;b25f
	ld bc,000fch		;b260
	cp 000h			;b263
	rst 38h			;b265
	nop			;b266
	rst 30h			;b267
	push af			;b268
	cp a			;b269
	rrca			;b26a
	add a,b			;b26b
	xor b			;b26c
	ld d,a			;b26d
	dec hl			;b26e
	ld h,b			;b26f
	dec d			;b270
	ld a,(bc)		;b271
	add a,b			;b272
	rst 38h			;b273
	dec d			;b274
	add a,b			;b275
	ret m			;b276
	cp (hl)			;b277
	ld h,b			;b278
	call m,sub_c31fh	;b279
	ret m			;b27c
	call m,061ebh		;b27d
	ld a,h			;b280
	cp b			;b281
	ld e,(hl)		;b282
	xor a			;b283
	ld b,e			;b284
	xor b			;b285
	ld d,a			;b286
	cp 060h			;b287
	sbc a,0f5h		;b289
	rrca			;b28b
	ld bc,lc100h		;b28c
	rst 30h			;b28f
	rra			;b290
	xor d			;b291
	dec d			;b292
	ret nz			;b293
	ld a,a			;b294
	dec b			;b295
	nop			;b296
	nop			;b297
	jr z,lb2efh		;b298
	cp 0ffh			;b29a
	rst 38h			;b29c
	inc e			;b29d
	add a,d			;b29e
	rst 30h			;b29f
	jp pe,00154h		;b2a0
	adc a,(hl)		;b2a3
	push af			;b2a4
	rst 38h			;b2a5
	ld e,0e4h		;b2a6
	dec b			;b2a8
	xor b			;b2a9
	ld d,l			;b2aa
	rst 38h			;b2ab
	ld h,l			;b2ac
	nop			;b2ad
	ret nz			;b2ae
	cp 07fh			;b2af
	xor e			;b2b1
	ld d,l			;b2b2
	ld a,(bc)		;b2b3
	rst 38h			;b2b4
	ld a,a			;b2b5
	xor d			;b2b6
	dec b			;b2b7
	nop			;b2b8
	ld b,b			;b2b9
	xor b			;b2ba
	push af			;b2bb
	rst 38h			;b2bc
	rst 38h			;b2bd
	ld a,055h		;b2be
	and b			;b2c0
	dec b			;b2c1
	ret p			;b2c2
	xor (hl)		;b2c3
	ld c,c			;b2c4
	rst 38h			;b2c5
	ld d,l			;b2c6
	ld hl,(0234fh)		;b2c7
	add a,b			;b2ca
	rst 38h			;b2cb
	ld a,a			;b2cc
	xor d			;b2cd
	nop			;b2ce
	nop			;b2cf
	ret p			;b2d0
	cp 0fbh			;b2d1
	and c			;b2d3
	ret m			;b2d4
	rst 8			;b2d5
	rst 38h			;b2d6
	ld d,l			;b2d7
	nop			;b2d8
	ld a,(bc)		;b2d9
	add a,b			;b2da
	ld e,(hl)		;b2db
	rst 38h			;b2dc
	push de			;b2dd
	xor d			;b2de
	nop			;b2df
	ld hl,(laa54h+1)	;b2e0
	ld d,l			;b2e3
	jp m,lfef5h		;b2e4
	rst 38h			;b2e7
	rst 38h			;b2e8
	rst 38h			;b2e9
	rst 38h			;b2ea
	rst 38h			;b2eb
	rst 38h			;b2ec
	rst 38h			;b2ed
	rst 38h			;b2ee
lb2efh:
	rst 38h			;b2ef
	dec hl			;b2f0
	call m,sub_faf9h	;b2f1
	ld a,d			;b2f4
	ld a,e			;b2f5
	ld a,e			;b2f6
	ld a,(04d99h)		;b2f7
	and h			;b2fa
	ld d,b			;b2fb
	cp 06ah			;b2fc
	or l			;b2fe
	ld d,d			;b2ff
sub_b300h:
	rst 18h			;b300
	defb 0ddh,0d5h,0d7h ;illegal sequence	;b301
	rst 18h			;b304
	defb 0ddh,0ddh,0d7h ;illegal sequence	;b305
	sub a			;b308
	dec e			;b309
	defb 0fdh,0dfh,0d7h ;illegal sequence	;b30a
	ld c,l			;b30d
	ld h,a			;b30e
	or b			;b30f
	cp a			;b310
	ret nz			;b311
	rst 18h			;b312
	rst 28h			;b313
	ld l,e			;b314
	ld l,a			;b315
	cpl			;b316
	add a,b			;b317
	push af			;b318
	ld e,l			;b319
	push de			;b31a
	ld d,l			;b31b
	push af			;b31c
	ld d,l			;b31d
	push de			;b31e
	ld d,l			;b31f
	push de			;b320
	ld (hl),h		;b321
	sub 05eh		;b322
	push de			;b324
	ld (hl),h		;b325
	ld sp,hl		;b326
	inc bc			;b327
	rst 38h			;b328
	nop			;b329
	push af			;b32a
	rst 38h			;b32b
	rst 38h			;b32c
	rst 28h			;b32d
	rst 38h			;b32e
	nop			;b32f
	rst 38h			;b330
	rst 38h			;b331
	rst 38h			;b332
	rst 38h			;b333
	rst 38h			;b334
	rst 38h			;b335
	rst 38h			;b336
	rst 38h			;b337
	ld d,e			;b338
	ei			;b339
	ld sp,hl		;b33a
	ld a,h			;b33b
	ld (hl),0bdh		;b33c
	sub (hl)		;b33e
	ld e,e			;b33f
	jp z,04d29h		;b340
	and c			;b343
	adc a,0a5h		;b344
	jp pe,lc00fh		;b346
	rla			;b349
	ret nz			;b34a
	rra			;b34b
	ret nz			;b34c
	dec e			;b34d
	ret nz			;b34e
	dec e			;b34f
	ret nz			;b350
	rla			;b351
	ret nz			;b352
lb353h:
	rla			;b353
	ret nz			;b354
lb355h:
	dec e			;b355
	ret nz			;b356
	dec e			;b357
	ret nz			;b358
	rra			;b359
	ret nz			;b35a
	rla			;b35b
	ret nz			;b35c
	dec d			;b35d
	ret nz			;b35e
	dec e			;b35f
	ret nz			;b360
	rra			;b361
	ret nz			;b362
	rra			;b363
	ret nz			;b364
	dec d			;b365
	ret nz			;b366
	dec d			;b367
	ld bc,0015ch		;b368
	call p,05401h		;b36b
	ld bc,001d4h		;b36e
	ld d,h			;b371
	ld bc,001f4h		;b372
	ld d,h			;b375
	ld bc,001d4h		;b376
	ld d,h			;b379
	ld bc,001f4h		;b37a
	ld e,h			;b37d
	ld bc,001d4h		;b37e
	ld d,h			;b381
	ld bc,001f4h		;b382
	ld d,h			;b385
	ld bc,lf0d4h		;b386
	inc bc			;b389
	ret po			;b38a
	rrca			;b38b
	ret po			;b38c
	ld a,(bc)		;b38d
	ret nz			;b38e
	dec d			;b38f
	ret nz			;b390
	djnz lb353h		;b391
	jr lb355h		;b393
	rla			;b395
	ret nz			;b396
	add hl,de		;b397
	ret nz			;b398
	ld e,0c0h		;b399
	rla			;b39b
	ret nz			;b39c
	dec d			;b39d
	ret nz			;b39e
	dec e			;b39f
	ret nz			;b3a0
	rra			;b3a1
	ret nz			;b3a2
	rra			;b3a3
	ret nz			;b3a4
	dec d			;b3a5
	ret nz			;b3a6
	dec d			;b3a7
	ld b,a			;b3a8
	djnz $+5		;b3a9
	cp b			;b3ab
	ld bc,001ech		;b3ac
	ld d,h			;b3af
	ld bc,001a4h		;b3b0
	inc c			;b3b3
	ld bc,00134h		;b3b4
	call po,01401h		;b3b7
	ld bc,001f4h		;b3ba
	ld e,h			;b3bd
	ld bc,001d4h		;b3be
	ld d,h			;b3c1
	ld bc,001f4h		;b3c2
	ld d,h			;b3c5
	ld bc,055d4h		;b3c6
	ld a,a			;b3c9
	rst 38h			;b3ca
	ld a,a			;b3cb
	ld a,(hl)		;b3cc
	add a,c			;b3cd
	ld a,a			;b3ce
	ld a,(hl)		;b3cf
	add a,c			;b3d0
	ld a,d			;b3d1
	or l			;b3d2
	sbc a,d			;b3d3
	sbc a,a			;b3d4
	ld l,a			;b3d5
	and a			;b3d6
	ld d,a			;b3d7
	or a			;b3d8
	rst 10h			;b3d9
	and e			;b3da
	ret			;b3db
	push af			;b3dc
	ret m			;b3dd
	or 03bh			;b3de
	cp 0f9h			;b3e0
	dec e			;b3e2
	ld b,c			;b3e3
	rst 38h			;b3e4
	ld hl,(lfe95h)		;b3e5
	rst 38h			;b3e8
	rst 38h			;b3e9
	cp a			;b3ea
	rst 38h			;b3eb
	rst 38h			;b3ec
	defb 0fdh,0f7h,0ffh ;illegal sequence	;b3ed
	ld c,c			;b3f0
	cp a			;b3f1
	cp a			;b3f2
	ret nz			;b3f3
	rra			;b3f4
	ret nz			;b3f5
	in a,(03ah)		;b3f6
	ld (hl),e		;b3f8
	or a			;b3f9
	rst 30h			;b3fa
	ei			;b3fb
	rst 30h			;b3fc
	rst 30h			;b3fd
	di			;b3fe
	di			;b3ff
lb400h:
	rst 30h			;b400
	di			;b401
	or a			;b402
	rst 28h			;b403
	rst 20h			;b404
	rst 20h			;b405
	rst 28h			;b406
	ld (hl),a		;b407
	ld (hl),e		;b408
	ld d,e			;b409
	ld hl,(laa17h)		;b40a
	sub c			;b40d
	ld h,d			;b40e
	and l			;b40f
	ld d,d			;b410
	and c			;b411
	jp c,ld2a9h		;b412
	jp (hl)			;b415
	call p,sub_bff2h	;b416
	rst 18h			;b419
	ret po			;b41a
	rrca			;b41b
	ret po			;b41c
	ld a,(bc)		;b41d
	ld e,l			;b41e
	cp d			;b41f
	ei			;b420
	cp l			;b421
	ld sp,iy		;b422
	defb 0fdh,0deh,0fch ;illegal sequence	;b424
	cp 0cdh			;b427
	ld sp,iy		;b429
	cp (iy-004h)		;b42b
	cp h			;b42e
	cp 0bch			;b42f
	ld a,h			;b431
	xor (hl)		;b432
	ld d,l			;b433
	xor d			;b434
	ld d,l			;b435
	xor b			;b436
	ld d,l			;b437
	xor d			;b438
	ld d,a			;b439
lb43ah:
	xor d			;b43a
	ld d,h			;b43b
	xor b			;b43c
	inc c			;b43d
	ex (sp),hl		;b43e
	xor e			;b43f
	cp a			;b440
	ret nz			;b441
	rra			;b442
	ret nz			;b443
	ld e,0ffh		;b444
	ld a,a			;b446
	rst 38h			;b447
	rst 38h			;b448
	rst 38h			;b449
	rst 38h			;b44a
	rst 38h			;b44b
	rst 38h			;b44c
	cp 0ffh			;b44d
	rst 38h			;b44f
	rst 38h			;b450
	rst 30h			;b451
	rst 38h			;b452
	rst 38h			;b453
	rst 38h			;b454
	rst 38h			;b455
	rst 38h			;b456
	rst 38h			;b457
	rst 38h			;b458
	rst 38h			;b459
	ei			;b45a
	rst 38h			;b45b
	cp e			;b45c
	defb 0ddh,0abh,055h ;illegal sequence	;b45d
	xor e			;b460
	ld d,l			;b461
	xor d			;b462
	ld d,l			;b463
	xor d			;b464
	ld b,l			;b465
	ret m			;b466
	ei			;b467
	push af			;b468
	nop			;b469
	cp 07eh			;b46a
	add a,b			;b46c
	ld l,09fh		;b46d
	sbc a,a			;b46f
	cp a			;b470
	rst 18h			;b471
	rst 18h			;b472
	sbc a,a			;b473
	sbc a,a			;b474
	rst 18h			;b475
	sbc a,a			;b476
	rst 18h			;b477
	rst 18h			;b478
	sbc a,e			;b479
	sbc a,a			;b47a
	rst 18h			;b47b
	defb 0edh ;next byte illegal after ed	;b47c
	adc a,0efh		;b47d
	rst 18h			;b47f
	sbc a,a			;b480
	rst 10h			;b481
	sbc a,a			;b482
	rst 18h			;b483
	xor 0cfh		;b484
	xor 0cdh		;b486
	adc a,0edh		;b488
	xor d			;b48a
	ld d,l			;b48b
	adc a,d			;b48c
	dec d			;b48d
	ret po			;b48e
	rst 38h			;b48f
	ld d,l			;b490
	ld a,a			;b491
	cp a			;b492
	cp a			;b493
	rst 18h			;b494
	rst 28h			;b495
	ld l,a			;b496
	or a			;b497
	cp b			;b498
	push de			;b499
	jp z,ld5dfh		;b49a
	xor d			;b49d
	or l			;b49e
	cp c			;b49f
	call c,sub_bfafh	;b4a0
	sbc a,0dah		;b4a3
	rst 28h			;b4a5
	defb 0ddh,0deh,0deh ;illegal sequence	;b4a6
	sbc a,0eeh		;b4a9
	rst 28h			;b4ab
	rst 28h			;b4ac
	rst 10h			;b4ad
	rst 18h			;b4ae
	rst 18h			;b4af
	rst 28h			;b4b0
	xor 0efh		;b4b1
	ld e,e			;b4b3
	rst 28h			;b4b4
	ld (hl),b		;b4b5
	rrca			;b4b6
	jp p,laa54h+1		;b4b7
	defb 0fdh,0feh,0ffh ;illegal sequence	;b4ba
	rst 30h			;b4bd
	rst 18h			;b4be
	rst 38h			;b4bf
	ld a,a			;b4c0
	rrca			;b4c1
	and b			;b4c2
	ld b,a			;b4c3
	ld h,b			;b4c4
	xor a			;b4c5
	ld h,a			;b4c6
	or a			;b4c7
	ld d,e			;b4c8
	dec hl			;b4c9
	ld e,c			;b4ca
	xor h			;b4cb
	add a,06dh		;b4cc
	ld (hl),0bbh		;b4ce
	sbc a,d			;b4d0
	exx			;b4d1
	defb 0ddh,041h,06eh ;illegal sequence	;b4d2
	ld h,l			;b4d5
	ld l,d			;b4d6
	and a			;b4d7
	rst 30h			;b4d8
	rst 30h			;b4d9
	ei			;b4da
	ex de,hl		;b4db
lb4dch:
	ld d,l			;b4dc
	ld bc,labfdh		;b4dd
	rst 38h			;b4e0
	rst 20h			;b4e1
	in a,(0bdh)		;b4e2
	or l			;b4e4
	xor e			;b4e5
	xor a			;b4e6
	or b			;b4e7
	xor d			;b4e8
	rst 18h			;b4e9
	rst 18h			;b4ea
	call c,sub_8888h	;b4eb
	xor e			;b4ee
	cp a			;b4ef
	cp a			;b4f0
	sbc a,e			;b4f1
	sub d			;b4f2
	add a,b			;b4f3
	ret nz			;b4f4
	ret			;b4f5
	defb 0edh ;next byte illegal after ed	;b4f6
	ld a,a			;b4f7
	ld a,(laaaeh)		;b4f8
	cp (hl)			;b4fb
	cp d			;b4fc
	cp (hl)			;b4fd
	xor d			;b4fe
	xor (hl)		;b4ff
	rst 38h			;b500
	add a,0bah		;b501
	ld a,l			;b503
	ld c,(hl)		;b504
	or (hl)			;b505
	or 017h			;b506
	xor d			;b508
	ld d,d			;b509
	jp pe,lee56h		;b50a
	cp 0fdh			;b50d
	jp nc,l6fd6h		;b50f
	ld l,(hl)		;b512
	ld l,(hl)		;b513
	cpl			;b514
	ld e,0bfh		;b515
	cp 054h			;b517
	ld d,h			;b519
	ld d,h			;b51a
	call nc,05474h		;b51b
	ld d,h			;b51e
	call nc,lffffh		;b51f
	add a,e			;b522
	cp e			;b523
	and e			;b524
	and e			;b525
	and e			;b526
	and e			;b527
	and e			;b528
	and e			;b529
	and a			;b52a
	xor (hl)		;b52b
	sbc a,h			;b52c
	sbc a,c			;b52d
	or e			;b52e
	rst 30h			;b52f
	and 0edh		;b530
	jp z,l9bd7h		;b532
	sub a			;b535
	rra			;b536
	rla			;b537
	ld e,a			;b538
	sbc a,a			;b539
	jr nz,lb4dch		;b53a
	ld e,a			;b53c
	sbc a,(hl)		;b53d
	ld e,(hl)		;b53e
	sbc a,a			;b53f
	rst 38h			;b540
	rst 38h			;b541
	inc c			;b542
	ld l,l			;b543
	ld c,l			;b544
	ld c,h			;b545
	ld c,l			;b546
	ccf			;b547
	ld a,a			;b548
	ret p			;b549
	add a,a			;b54a
	dec a			;b54b
	ex de,hl		;b54c
	ld d,a			;b54d
	xor a			;b54e
	ld a,a			;b54f
	cp 0fch			;b550
	ld sp,hl		;b552
	ld sp,hl		;b553
	pop af			;b554
	push af			;b555
	pop af			;b556
	push hl			;b557
	jp (hl)			;b558
	push bc			;b559
	add hl,hl		;b55a
	ld (l9549h),hl		;b55b
	xor c			;b55e
	sub l			;b55f
	rst 38h			;b560
	rst 38h			;b561
	ld sp,031b5h		;b562
	ld a,a			;b565
	rst 38h			;b566
	ret po			;b567
	rrca			;b568
	ld a,l			;b569
	xor e			;b56a
	ld a,a			;b56b
	rst 38h			;b56c
	ret p			;b56d
	rst 0			;b56e
	dec de			;b56f
	ld (hl),l		;b570
	xor a			;b571
	ld e,a			;b572
	cp (hl)			;b573
	ld a,h			;b574
	cp l			;b575
	ld a,b			;b576
	ld sp,hl		;b577
	ld (hl),d		;b578
	push af			;b579
	jp po,la315h		;b57a
	and 0aah		;b57d
	and 0bah		;b57f
	xor (hl)		;b581
	xor d			;b582
	cp (hl)			;b583
	cp d			;b584
	cp (hl)			;b585
	xor d			;b586
	xor (hl)		;b587
	cp d			;b588
	cp (hl)			;b589
	cp d			;b58a
	xor (hl)		;b58b
	xor d			;b58c
	cp (hl)			;b58d
	cp d			;b58e
	cp (hl)			;b58f
	ld d,h			;b590
	ld d,h			;b591
	ld d,h			;b592
	call nc,05474h		;b593
	ld d,h			;b596
	call nc,05c54h		;b597
	ld d,h			;b59a
	call nc,05454h		;b59b
	ld (hl),h		;b59e
	call nc,sub_9f5eh	;b59f
	ld e,(hl)		;b5a2
	sbc a,(hl)		;b5a3
	ld e,(hl)		;b5a4
	sbc a,(hl)		;b5a5
	ld e,a			;b5a6
	sbc a,(hl)		;b5a7
	ld e,(hl)		;b5a8
	sbc a,(hl)		;b5a9
	ld e,(hl)		;b5aa
	sbc a,a			;b5ab
	ld e,(hl)		;b5ac
	sbc a,(hl)		;b5ad
	ld e,(hl)		;b5ae
	sbc a,a			;b5af
	xor c			;b5b0
	sub l			;b5b1
	xor c			;b5b2
	sub l			;b5b3
	xor c			;b5b4
	sub l			;b5b5
	xor c			;b5b6
	sub l			;b5b7
	xor c			;b5b8
	sub l			;b5b9
	xor c			;b5ba
	sub l			;b5bb
	xor c			;b5bc
	sub l			;b5bd
	xor c			;b5be
	sub l			;b5bf
	xor h			;b5c0
	and h			;b5c1
	xor h			;b5c2
	call po,sub_a4ech	;b5c3
	xor h			;b5c6
	and h			;b5c7
	xor h			;b5c8
lb5c9h:
	and h			;b5c9
	xor h			;b5ca
	and h			;b5cb
	call pe,sub_aca4h	;b5cc
	call po,sub_aeaah	;b5cf
	xor d			;b5d2
	cp (hl)			;b5d3
	cp d			;b5d4
	cp (hl)			;b5d5
	xor d			;b5d6
	xor (hl)		;b5d7
	cp d			;b5d8
	cp (hl)			;b5d9
	cp d			;b5da
	xor (hl)		;b5db
	xor d			;b5dc
	cp (hl)			;b5dd
	cp d			;b5de
	cp (hl)			;b5df
	sub a			;b5e0
	ld h,e			;b5e1
	ld e,h			;b5e2
	ld l,a			;b5e3
	ld e,a			;b5e4
	ld l,a			;b5e5
	ld d,a			;b5e6
	ld a,a			;b5e7
	ld d,h			;b5e8
	ld d,h			;b5e9
	ld d,h			;b5ea
	call nc,sub_7454h	;b5eb
	ld d,h			;b5ee
	call nc,05c54h		;b5ef
	ld d,h			;b5f2
	call nc,05454h		;b5f3
	ld (hl),h		;b5f6
	call nc,sub_cef2h	;b5f7
	add hl,sp		;b5fa
	ld sp,hl		;b5fb
	ld sp,hl		;b5fc
	defb 0fdh,0fdh,0ffh ;illegal sequence	;b5fd
lb600h:
	ld e,(hl)		;b600
	sbc a,(hl)		;b601
	ld e,(hl)		;b602
	sbc a,a			;b603
	ld e,a			;b604
	sbc a,(hl)		;b605
	ld e,(hl)		;b606
	sbc a,(hl)		;b607
	ld e,a			;b608
	sbc a,(hl)		;b609
	ld e,(hl)		;b60a
	sbc a,(hl)		;b60b
	ld e,(hl)		;b60c
	sbc a,(hl)		;b60d
	ld e,a			;b60e
	sbc a,(hl)		;b60f
	ld e,(hl)		;b610
	sbc a,a			;b611
	ld e,(hl)		;b612
	sbc a,(hl)		;b613
	ld e,(hl)		;b614
	sbc a,(hl)		;b615
	ld e,(hl)		;b616
	sbc a,(hl)		;b617
	ld e,(hl)		;b618
	sbc a,l			;b619
	ld c,a			;b61a
	and h			;b61b
	ld e,b			;b61c
	or b			;b61d
	ld h,b			;b61e
	and c			;b61f
	ld b,c			;b620
	add a,e			;b621
	rlca			;b622
	rlca			;b623
	rrca			;b624
	rra			;b625
	rra			;b626
	ccf			;b627
	xor c			;b628
	sub l			;b629
	xor c			;b62a
	sub l			;b62b
	xor c			;b62c
	sub l			;b62d
	xor c			;b62e
	sub l			;b62f
	xor c			;b630
	sub l			;b631
	xor c			;b632
	sub l			;b633
	xor c			;b634
	sub h			;b635
	xor e			;b636
	sub (hl)		;b637
	xor h			;b638
	sub h			;b639
	xor b			;b63a
	sub c			;b63b
	and e			;b63c
	and e			;b63d
	rst 0			;b63e
	adc a,a			;b63f
	adc a,a			;b640
	sbc a,a			;b641
	rra			;b642
	ccf			;b643
	ld (hl),a		;b644
	ld l,c			;b645
	ret nz			;b646
	add a,0ffh		;b647
	add a,a			;b649
	rst 8			;b64a
	sub a			;b64b
	dec sp			;b64c
	ld (hl),l		;b64d
	rst 38h			;b64e
	rst 38h			;b64f
	xor h			;b650
	and h			;b651
	xor h			;b652
	push hl			;b653
	xor (hl)		;b654
	and (hl)		;b655
	xor h			;b656
	and l			;b657
	ex de,hl		;b658
	or e			;b659
	and a			;b65a
	ld l,a			;b65b
	rst 8			;b65c
	sbc a,a			;b65d
	ld (hl),039h		;b65e
	ld a,b			;b660
	push af			;b661
	cp (hl)			;b662
	call m,sub_f3f9h	;b663
	rst 28h			;b666
	ret c			;b667
	or a			;b668
	push af			;b669
	call pe,sub_e9eah	;b66a
	call pe,sub_d9eah	;b66d
	call c,0f7eeh		;b670
	ld sp,hl		;b673
	cp 0f7h			;b674
	rst 38h			;b676
	rst 38h			;b677
	defb 0edh ;next byte illegal after ed	;b678
	ex de,hl		;b679
	push bc			;b67a
	sub e			;b67b
	xor a			;b67c
	rra			;b67d
	ld l,a			;b67e
	ld a,(ix-062h)		;b67f
	cp h			;b682
	adc a,c			;b683
	ei			;b684
	ld d,e			;b685
	and a			;b686
	ld c,a			;b687
	rst 18h			;b688
	sbc a,a			;b689
	cp a			;b68a
	ld a,a			;b68b
	rst 38h			;b68c
	rst 38h			;b68d
	rst 38h			;b68e
	rst 38h			;b68f
	di			;b690
	di			;b691
	di			;b692
	rst 20h			;b693
	rst 8			;b694
	rst 18h			;b695
	sbc a,a			;b696
	ccf			;b697
	ld a,a			;b698
	rst 38h			;b699
	rst 38h			;b69a
	rst 38h			;b69b
	ld sp,iy		;b69c
	ret p			;b69e
	ret m			;b69f
	call po,sub_badch	;b6a0
	cp c			;b6a3
	out (0e5h),a		;b6a4
	adc a,0ffh		;b6a6
	rst 38h			;b6a8
	rst 38h			;b6a9
	rst 38h			;b6aa
	rst 38h			;b6ab
	rst 38h			;b6ac
	rst 38h			;b6ad
	rst 38h			;b6ae
	rst 38h			;b6af
	rst 38h			;b6b0
	defb 0fdh,0f8h,0e8h ;illegal sequence	;b6b1
	ret nz			;b6b4
	inc bc			;b6b5
	add a,a			;b6b6
	ld e,a			;b6b7
	ccf			;b6b8
	rra			;b6b9
	ld a,07bh		;b6ba
	rst 30h			;b6bc
	rst 18h			;b6bd
	cp a			;b6be
	rst 38h			;b6bf
	rst 38h			;b6c0
	rst 38h			;b6c1
	rst 38h			;b6c2
	cp 0fch			;b6c3
	call p,sub_a1e0h	;b6c5
	inc bc			;b6c8
	rrca			;b6c9
	rra			;b6ca
	ld a,a			;b6cb
	rst 38h			;b6cc
	rst 38h			;b6cd
	rst 38h			;b6ce
	cp 0f8h			;b6cf
	out (0a9h),a		;b6d1
	ld a,l			;b6d3
	ret m			;b6d4
	call m,lffffh		;b6d5
	rst 38h			;b6d8
	rst 38h			;b6d9
	add a,a			;b6da
	adc a,a			;b6db
	rra			;b6dc
	ccf			;b6dd
	ld a,a			;b6de
	rst 38h			;b6df
	rst 38h			;b6e0
	rst 38h			;b6e1
	rst 38h			;b6e2
	cp 0fch			;b6e3
	call m,l78f7h+1		;b6e5
	jr c,$+122		;b6e8
	inc a			;b6ea
	sbc a,h			;b6eb
	inc a			;b6ec
	cp 0ffh			;b6ed
	rst 38h			;b6ef
	rst 38h			;b6f0
	di			;b6f1
	defb 0edh ;next byte illegal after ed	;b6f2
	ld sp,iy		;b6f3
	ld sp,hl		;b6f5
	di			;b6f6
	di			;b6f7
	rst 0			;b6f8
	adc a,a			;b6f9
	ld e,03ch		;b6fa
	add hl,sp		;b6fc
	ld (hl),e		;b6fd
	ld h,l			;b6fe
	push bc			;b6ff
	ex (sp),hl		;b700
	jp p,lfcf9h		;b701
	ld a,003h		;b704
	rrca			;b706
	rst 38h			;b707
	defb 0fdh,0fbh,0e6h ;illegal sequence	;b708
	ex de,hl		;b70b
	ld h,(hl)		;b70c
	call sub_ab96h		;b70d
	rla			;b710
	xor e			;b711
	ld d,e			;b712
	ld a,l			;b713
	ld b,d			;b714
	cp h			;b715
	ld a,l			;b716
	ld sp,hl		;b717
	xor d			;b718
	ld d,h			;b719
	cp b			;b71a
	ld (hl),l		;b71b
	ld sp,hl		;b71c
	di			;b71d
	rst 20h			;b71e
	rst 8			;b71f
	rst 8			;b720
	sbc a,a			;b721
	cp a			;b722
	ccf			;b723
lb724h:
	ld a,a			;b724
	rst 38h			;b725
	rst 38h			;b726
	rst 38h			;b727
	ld a,a			;b728
	ld a,a			;b729
	ld sp,hl		;b72a
	di			;b72b
	ex (sp),hl		;b72c
	push hl			;b72d
	push hl			;b72e
	jp (hl)			;b72f
	jp p,lffffh		;b730
	rst 38h			;b733
	rst 38h			;b734
	rst 38h			;b735
	rst 38h			;b736
	rst 38h			;b737
	rst 38h			;b738
	rst 38h			;b739
	push af			;b73a
	ret pe			;b73b
	ret nc			;b73c
	jr z,$+50		;b73d
	jr nz,lb761h		;b73f
	ld b,b			;b741
	add a,b			;b742
	ret p			;b743
	call m,lffffh		;b744
	rst 38h			;b747
	rst 38h			;b748
	ret p			;b749
	nop			;b74a
	nop			;b74b
	ret p			;b74c
	ld a,h			;b74d
	ld a,01eh		;b74e
	nop			;b750
	nop			;b751
	nop			;b752
	inc sp			;b753
	dec de			;b754
	rrca			;b755
lb756h:
	rst 38h			;b756
	rst 38h			;b757
	add a,b			;b758
	inc h			;b759
	ld c,b			;b75a
	inc b			;b75b
	adc a,d			;b75c
	push de			;b75d
	defb 0ddh,0dfh,0dah ;illegal sequence	;b75e
lb761h:
	defb 0ddh,09ah,09ch ;illegal sequence	;b761
	cp d			;b764
	or h			;b765
	cp b			;b766
	or h			;b767
	ld a,(06874h)		;b768
	ld (hl),b		;b76b
	ld l,b			;b76c
	ld (hl),h		;b76d
	jr c,lb724h		;b76e
	cp d			;b770
	or h			;b771
	sbc a,d			;b772
	call c,sub_dc5ah	;b773
	sbc a,d			;b776
	or h			;b777
	cp b			;b778
	or h			;b779
	cp b			;b77a
	inc (hl)		;b77b
	ld l,b			;b77c
	ld (hl),b		;b77d
	ld l,b			;b77e
	ld (hl),b		;b77f
	xor b			;b780
	or h			;b781
	ret c			;b782
	call nc,sub_eddah	;b783
	jp pe,leae9h		;b786
	xor l			;b789
	or 0f5h			;b78a
	or 0fbh			;b78c
	defb 0fdh,0fdh,0feh ;illegal sequence	;b78e
	cp 09eh			;b791
	rst 38h			;b793
	rst 38h			;b794
	ei			;b795
	rst 38h			;b796
	rst 38h			;b797
	nop			;b798
	sub d			;b799
	nop			;b79a
	nop			;b79b
	nop			;b79c
	rst 38h			;b79d
	rst 38h			;b79e
	push de			;b79f
	xor d			;b7a0
	ld b,b			;b7a1
	nop			;b7a2
	ld bc,01b13h		;b7a3
	inc c			;b7a6
	ld c,007h		;b7a7
	inc b			;b7a9
	nop			;b7aa
	nop			;b7ab
	inc bc			;b7ac
	ld e,03fh		;b7ad
	ld a,a			;b7af
	ld a,a			;b7b0
	ccf			;b7b1
	ld b,b			;b7b2
	nop			;b7b3
	jr nz,lb756h		;b7b4
	ld b,c			;b7b6
	daa			;b7b7
	cpl			;b7b8
	rla			;b7b9
	rrca			;b7ba
	rrca			;b7bb
	rrca			;b7bc
	ld h,a			;b7bd
	rst 10h			;b7be
	adc a,a			;b7bf
	rst 0			;b7c0
	ld h,e			;b7c1
	ld h,e			;b7c2
	ld hl,01020h		;b7c3
	jr nz,$+36		;b7c6
	add a,c			;b7c8
	nop			;b7c9
	add a,b			;b7ca
	ld b,e			;b7cb
	add a,(hl)		;b7cc
	ld c,l			;b7cd
	ld a,(bc)		;b7ce
	adc a,l			;b7cf
	jp c,ldab5h		;b7d0
	ld (hl),l		;b7d3
	xor e			;b7d4
	rst 10h			;b7d5
	rst 38h			;b7d6
	rst 38h			;b7d7
	nop			;b7d8
lb7d9h:
	ret pe			;b7d9
	ld bc,00100h		;b7da
	cp 0ffh			;b7dd
	ld d,c			;b7df
	xor b			;b7e0
	nop			;b7e1
	add a,b			;b7e2
	ret nz			;b7e3
	call po,098ech		;b7e4
	jr c,lb7d9h		;b7e7
	djnz lb7ebh		;b7e9
lb7ebh:
	nop			;b7eb
	ret nz			;b7ec
	ld (hl),b		;b7ed
	ld a,b			;b7ee
sub_b7efh:
	call p,09cfch		;b7ef
	jr lb82ch		;b7f2
	add hl,sp		;b7f4
	ld a,e			;b7f5
	ret pe			;b7f6
	pop af			;b7f7
	rst 38h			;b7f8
	ret nz			;b7f9
	ld b,b			;b7fa
	ld h,0a9h		;b7fb
	pop de			;b7fd
	ld h,b			;b7fe
	pop bc			;b7ff
	add a,d			;b800
	jp nz,lc244h		;b801
	and 064h		;b804
	jr nc,lb868h		;b806
	ret nz			;b808
	nop			;b809
	ld bc,la1e1h		;b80a
	ld (hl),c		;b80d
	or c			;b80e
	ld d,e			;b80f
	or (hl)			;b810
	in a,(0eah)		;b811
	push af			;b813
	ex de,hl		;b814
	defb 0fdh,0ffh,0ffh ;illegal sequence	;b815
	ld bc,00294h		;b818
	add a,b			;b81b
	ld b,c			;b81c
	cp h			;b81d
	cp (hl)			;b81e
	cp 006h			;b81f
	ld b,006h		;b821
	ld b,00ch		;b823
	dec c			;b825
	dec c			;b826
	dec c			;b827
	dec c			;b828
	add hl,de		;b829
	dec de			;b82a
	ld a,(de)		;b82b
lb82ch:
	dec de			;b82c
	add hl,de		;b82d
	dec c			;b82e
	dec c			;b82f
	inc c			;b830
	ld b,006h		;b831
	ld b,046h		;b833
	ld h,(hl)		;b835
	add a,h			;b836
	add a,l			;b837
	dec c			;b838
	add hl,bc		;b839
	dec bc			;b83a
	dec bc			;b83b
	dec de			;b83c
	sub e			;b83d
	sub a			;b83e
	rla			;b83f
	ld d,017h		;b840
	rla			;b842
	scf			;b843
	daa			;b844
	cpl			;b845
	ld l,l			;b846
	rst 18h			;b847
lb848h:
	xor a			;b848
	rst 18h			;b849
	cp a			;b84a
	ld e,a			;b84b
	cp l			;b84c
	ld e,a			;b84d
	cp a			;b84e
	ld a,a			;b84f
	cp a			;b850
	ld a,a			;b851
	rst 38h			;b852
	rst 38h			;b853
	rst 28h			;b854
	rst 38h			;b855
	rst 38h			;b856
	rst 38h			;b857
	rst 38h			;b858
	nop			;b859
	call m,lf800h		;b85a
	inc bc			;b85d
	ret p			;b85e
	inc b			;b85f
	ret m			;b860
	ld bc,002f8h		;b861
	defb 0fdh,000h,0ffh ;illegal sequence	;b864
	nop			;b867
lb868h:
	rst 38h			;b868
	nop			;b869
	rst 38h			;b86a
	nop			;b86b
	rst 38h			;b86c
	nop			;b86d
	cp 000h			;b86e
	call m,sub_f801h	;b870
	ld (bc),a		;b873
	ret po			;b874
	dec b			;b875
	ret nz			;b876
	ld a,(de)		;b877
	add a,c			;b878
	inc h			;b879
	inc bc			;b87a
	ld e,b			;b87b
	rlca			;b87c
	ld (hl),b		;b87d
	rrca			;b87e
	ld h,b			;b87f
	rrca			;b880
	ld h,b			;b881
	add a,a			;b882
	jr nc,lb848h		;b883
	jr lb868h		;b885
	inc c			;b887
	pop hl			;b888
	inc c			;b889
	ret p			;b88a
	ld b,0f8h		;b88b
	inc bc			;b88d
	call m,sub_fc01h	;b88e
	ld bc,000feh		;b891
	cp 000h			;b894
	rst 38h			;b896
	nop			;b897
	rst 38h			;b898
	nop			;b899
	rst 38h			;b89a
	nop			;b89b
	rst 38h			;b89c
	nop			;b89d
	rst 38h			;b89e
	nop			;b89f
	rst 38h			;b8a0
	nop			;b8a1
	rst 38h			;b8a2
	nop			;b8a3
	rst 38h			;b8a4
	nop			;b8a5
	rst 38h			;b8a6
	nop			;b8a7
	rst 38h			;b8a8
	nop			;b8a9
	rst 38h			;b8aa
	nop			;b8ab
	rst 38h			;b8ac
	nop			;b8ad
	rst 38h			;b8ae
	nop			;b8af
	rst 38h			;b8b0
	nop			;b8b1
	rst 38h			;b8b2
	nop			;b8b3
	rst 38h			;b8b4
	nop			;b8b5
	rst 38h			;b8b6
	nop			;b8b7
	rrca			;b8b8
	nop			;b8b9
	inc bc			;b8ba
	ret p			;b8bb
	ld bc,0000ch		;b8bc
	halt			;b8bf
	nop			;b8c0
	xor d			;b8c1
	nop			;b8c2
	ld e,080h		;b8c3
	ccf			;b8c5
	add a,b			;b8c6
	ld hl,(03f80h)		;b8c7
	add a,b			;b8ca
	inc d			;b8cb
	nop			;b8cc
	ld l,b			;b8cd
	nop			;b8ce
	or b			;b8cf
	nop			;b8d0
	ld b,e			;b8d1
	nop			;b8d2
	sbc a,a			;b8d3
	nop			;b8d4
	ccf			;b8d5
	nop			;b8d6
	ccf			;b8d7
	nop			;b8d8
	ld a,a			;b8d9
	nop			;b8da
	ld a,a			;b8db
	nop			;b8dc
	ld l,a			;b8dd
	nop			;b8de
	ld l,a			;b8df
	nop			;b8e0
	ld e,a			;b8e1
	add a,b			;b8e2
	scf			;b8e3
	nop			;b8e4
	ld h,e			;b8e5
	add a,b			;b8e6
	ld sp,01bc0h		;b8e7
	ret po			;b8ea
	ld c,040h		;b8eb
	dec d			;b8ed
	nop			;b8ee
	sub a			;b8ef
	nop			;b8f0
	adc a,e			;b8f1
	nop			;b8f2
	call m,lda00h		;b8f3
	nop			;b8f6
	ld l,l			;b8f7
	add a,b			;b8f8
	ld (hl),000h		;b8f9
	ld e,c			;b8fb
	nop			;b8fc
	ld l,(hl)		;b8fd
	add a,b			;b8fe
	ld sp,05e00h		;b8ff
	add a,b			;b902
	ld hl,01ec0h		;b903
	ret po			;b906
	rlca			;b907
	ret nz			;b908
	add hl,de		;b909
	ret po			;b90a
	rlca			;b90b
	ret po			;b90c
	add hl,bc		;b90d
	ret nz			;b90e
	rlca			;b90f
lb910h:
	add a,b			;b910
	dec sp			;b911
	nop			;b912
	ld a,l			;b913
	nop			;b914
	ld a,a			;b915
	nop			;b916
	ld e,a			;b917
	rst 38h			;b918
	nop			;b919
	rst 38h			;b91a
	nop			;b91b
	rst 38h			;b91c
	nop			;b91d
	cp 000h			;b91e
	call m,sub_f801h	;b920
	inc bc			;b923
	ret p			;b924
	ld b,0f1h		;b925
	inc b			;b927
	pop hl			;b928
	inc c			;b929
	ret po			;b92a
	ld a,(bc)		;b92b
	ret po			;b92c
	dec bc			;b92d
	ret p			;b92e
	dec b			;b92f
	ret m			;b930
	ld (bc),a		;b931
	call m,sub_fe01h	;b932
	nop			;b935
	rst 38h			;b936
	nop			;b937
	rst 38h			;b938
	nop			;b939
	rst 38h			;b93a
	nop			;b93b
	rst 38h			;b93c
	nop			;b93d
	rst 38h			;b93e
	nop			;b93f
	rst 38h			;b940
	nop			;b941
	rst 38h			;b942
	nop			;b943
	rst 38h			;b944
	nop			;b945
	rst 38h			;b946
	nop			;b947
	rst 38h			;b948
	nop			;b949
	rst 38h			;b94a
	nop			;b94b
	rst 38h			;b94c
	nop			;b94d
	rst 38h			;b94e
	nop			;b94f
	rst 38h			;b950
	nop			;b951
	cp 000h			;b952
	cp 000h			;b954
	rst 38h			;b956
	nop			;b957
	ret nz			;b958
	dec de			;b959
lb95ah:
	add a,b			;b95a
	dec (hl)		;b95b
lb95ch:
	ld a,(bc)		;b95c
	ld h,b			;b95d
	rra			;b95e
	ret nz			;b95f
	ccf			;b960
	add a,b			;b961
	ld a,a			;b962
	nop			;b963
	rst 38h			;b964
	nop			;b965
	rst 38h			;b966
	nop			;b967
	rst 38h			;b968
	nop			;b969
	rst 38h			;b96a
	nop			;b96b
	ld a,a			;b96c
	nop			;b96d
	ccf			;b96e
	add a,b			;b96f
	rra			;b970
	ret nz			;b971
	rrca			;b972
	ld h,b			;b973
	rlca			;b974
	or b			;b975
	inc bc			;b976
	ld e,b			;b977
	add a,c			;b978
	inc l			;b979
	pop bc			;b97a
	inc d			;b97b
	ret po			;b97c
	ld c,0c0h		;b97d
	rra			;b97f
	ret nz			;b980
	ld (de),a		;b981
	ret nz			;b982
	ld (de),a		;b983
	ret po			;b984
	rrca			;b985
	ret nz			;b986
	ld e,081h		;b987
	inc a			;b989
	add a,e			;b98a
	jr c,lb910h		;b98b
	jr c,lb996h		;b98d
	ld (hl),b		;b98f
	inc bc			;b990
	ld e,b			;b991
	ld bc,001ach		;b992
	sub h			;b995
lb996h:
	ld l,e			;b996
	nop			;b997
	rst 38h			;b998
	nop			;b999
	rst 38h			;b99a
	nop			;b99b
	rst 38h			;b99c
	nop			;b99d
	rst 38h			;b99e
	nop			;b99f
	rst 38h			;b9a0
	nop			;b9a1
	rst 38h			;b9a2
	nop			;b9a3
	rst 38h			;b9a4
	nop			;b9a5
	rst 38h			;b9a6
	nop			;b9a7
	rst 38h			;b9a8
	nop			;b9a9
	cp 000h			;b9aa
	cp 000h			;b9ac
	call m,sub_f801h	;b9ae
	inc bc			;b9b1
	call m,sub_f801h	;b9b2
	ld (bc),a		;b9b5
	call m,sub_fc01h	;b9b6
	ld bc,000feh		;b9b9
	call m,sub_fc01h	;b9bc
	ld bc,001fch		;b9bf
	call m,sub_fc01h	;b9c2
	ld bc,000feh		;b9c5
	ret nz			;b9c8
	dec de			;b9c9
	ret nz			;b9ca
	dec d			;b9cb
	ret po			;b9cc
	inc c			;b9cd
	jp lc318h		;b9ce
	jr lb95ah		;b9d1
	jr nc,lb95ch		;b9d3
	jr nc,lb9e6h		;b9d5
	ld h,b			;b9d7
	rlca			;b9d8
	ld (hl),b		;b9d9
	rrca			;b9da
	ret po			;b9db
	rrca			;b9dc
	ret po			;b9dd
	rrca			;b9de
	and b			;b9df
	rra			;b9e0
	ld b,b			;b9e1
	rrca			;b9e2
	jr nz,lba04h		;b9e3
	ld b,b			;b9e5
lb9e6h:
	rrca			;b9e6
	jr nz,lb9f8h		;b9e7
	nop			;b9e9
	rrca			;b9ea
	jr nz,lb9fch		;b9eb
	jr nz,lba4eh		;b9ed
	nop			;b9ef
	ld a,a			;b9f0
	nop			;b9f1
	ld a,a			;b9f2
	nop			;b9f3
	ld a,a			;b9f4
	nop			;b9f5
	rst 38h			;b9f6
	nop			;b9f7
lb9f8h:
	ld a,a			;b9f8
	sbc a,a			;b9f9
	rst 18h			;b9fa
	rst 18h			;b9fb
lb9fch:
	ex (sp),hl		;b9fc
	ld sp,hl		;b9fd
	defb 0fdh,0fdh,0f9h ;illegal sequence	;b9fe
	di			;ba01
	di			;ba02
	di			;ba03
lba04h:
	res 7,e			;ba04
	cp l			;ba06
	ld a,(hl)		;ba07
	cp 0ffh			;ba08
	rst 38h			;ba0a
	rst 38h			;ba0b
	rst 38h			;ba0c
	rst 38h			;ba0d
	rst 30h			;ba0e
	rst 38h			;ba0f
	rst 38h			;ba10
	rst 38h			;ba11
	rst 38h			;ba12
	rst 38h			;ba13
	rst 38h			;ba14
	rst 38h			;ba15
	rst 38h			;ba16
	rst 38h			;ba17
	rst 38h			;ba18
	rst 38h			;ba19
	rst 38h			;ba1a
	rst 38h			;ba1b
	rst 38h			;ba1c
	rst 38h			;ba1d
	rst 38h			;ba1e
	rst 38h			;ba1f
	rst 38h			;ba20
	rst 38h			;ba21
	rst 38h			;ba22
	rst 38h			;ba23
	rst 38h			;ba24
	rst 38h			;ba25
	rst 38h			;ba26
	rst 38h			;ba27
	rst 18h			;ba28
	rra			;ba29
	sbc a,a			;ba2a
	call nz,sub_e1e4h	;ba2b
	ex (sp),hl		;ba2e
	ex (sp),hl		;ba2f
	ex (sp),hl		;ba30
	rst 20h			;ba31
	ex (sp),hl		;ba32
	ex (sp),hl		;ba33
	ex (sp),hl		;ba34
	pop hl			;ba35
	pop af			;ba36
	pop hl			;ba37
	rst 38h			;ba38
	rst 38h			;ba39
	rst 38h			;ba3a
	cp a			;ba3b
	rst 38h			;ba3c
	rst 38h			;ba3d
	rst 38h			;ba3e
	rst 38h			;ba3f
	rst 38h			;ba40
	rst 38h			;ba41
	rst 38h			;ba42
	rst 38h			;ba43
	rst 38h			;ba44
	rst 38h			;ba45
	rst 38h			;ba46
	rst 38h			;ba47
	defb 0fdh,0fbh,007h ;illegal sequence	;ba48
	ld c,a			;ba4b
	rst 30h			;ba4c
	ei			;ba4d
lba4eh:
	rst 38h			;ba4e
	rst 38h			;ba4f
	rst 38h			;ba50
	rst 38h			;ba51
	rst 38h			;ba52
	rst 38h			;ba53
	rst 38h			;ba54
	rst 38h			;ba55
	rst 38h			;ba56
	rst 38h			;ba57
	rst 38h			;ba58
	rst 38h			;ba59
sub_ba5ah:
	rst 38h			;ba5a
	rst 38h			;ba5b
	rst 38h			;ba5c
	rst 38h			;ba5d
	rst 38h			;ba5e
	rst 38h			;ba5f
	rst 38h			;ba60
	rst 38h			;ba61
	rst 38h			;ba62
	rst 38h			;ba63
	rst 38h			;ba64
	rst 38h			;ba65
	rst 38h			;ba66
	rst 38h			;ba67
	rst 38h			;ba68
	rst 38h			;ba69
	rst 38h			;ba6a
	rst 38h			;ba6b
	rst 38h			;ba6c
	rst 38h			;ba6d
	rst 38h			;ba6e
	rst 38h			;ba6f
	rst 38h			;ba70
	rst 38h			;ba71
	rst 38h			;ba72
	rst 38h			;ba73
	rst 38h			;ba74
	rst 38h			;ba75
	rst 38h			;ba76
	rst 38h			;ba77
	rst 38h			;ba78
	cp a			;ba79
	sbc a,l			;ba7a
	exx			;ba7b
	rst 10h			;ba7c
	sub a			;ba7d
	rst 8			;ba7e
	rst 28h			;ba7f
	rst 28h			;ba80
	rst 28h			;ba81
	rst 28h			;ba82
	rst 20h			;ba83
	rst 30h			;ba84
	rst 30h			;ba85
	rst 20h			;ba86
	rst 28h			;ba87
	ld l,a			;ba88
	adc a,a			;ba89
	rst 8			;ba8a
	jp po,0f0f2h		;ba8b
	pop af			;ba8e
	pop af			;ba8f
	pop af			;ba90
	di			;ba91
	pop af			;ba92
	pop af			;ba93
	pop af			;ba94
	ret p			;ba95
	ret m			;ba96
	ret p			;ba97
	rst 38h			;ba98
	nop			;ba99
	rst 38h			;ba9a
	nop			;ba9b
	rst 38h			;ba9c
	nop			;ba9d
	rst 38h			;ba9e
	nop			;ba9f
	rst 38h			;baa0
	nop			;baa1
	ret m			;baa2
	nop			;baa3
	ret po			;baa4
	rlca			;baa5
	ret nz			;baa6
	ld e,080h		;baa7
	dec hl			;baa9
	nop			;baaa
	ld d,a			;baab
	add a,b			;baac
	cpl			;baad
	nop			;baae
	ld a,a			;baaf
	nop			;bab0
	ld a,a			;bab1
	nop			;bab2
	ld e,c			;bab3
	add a,b			;bab4
	ld a,0c0h		;bab5
	rra			;bab7
	ret po			;bab8
	rrca			;bab9
	ret p			;baba
	rlca			;babb
	ret m			;babc
	inc bc			;babd
	call m,lfeffh+1		;babe
	nop			;bac1
	rst 38h			;bac2
	nop			;bac3
	rst 38h			;bac4
	nop			;bac5
	rst 38h			;bac6
	nop			;bac7
	rst 38h			;bac8
	nop			;bac9
	rst 38h			;baca
	nop			;bacb
	rst 38h			;bacc
	nop			;bacd
	rst 38h			;bace
	nop			;bacf
	rst 38h			;bad0
	nop			;bad1
	rst 38h			;bad2
	nop			;bad3
	rst 38h			;bad4
	nop			;bad5
	rst 38h			;bad6
	nop			;bad7
	rst 38h			;bad8
	nop			;bad9
	rst 38h			;bada
	nop			;badb
sub_badch:
	rst 38h			;badc
	nop			;badd
	rst 38h			;bade
	nop			;badf
	rst 38h			;bae0
	nop			;bae1
	rst 38h			;bae2
	nop			;bae3
	rst 38h			;bae4
	nop			;bae5
	rst 38h			;bae6
	nop			;bae7
	rst 38h			;bae8
	nop			;bae9
	rst 38h			;baea
	nop			;baeb
	rst 38h			;baec
	nop			;baed
	rst 38h			;baee
	nop			;baef
	add a,b			;baf0
	nop			;baf1
	nop			;baf2
	ld a,a			;baf3
	nop			;baf4
	jp 03f00h		;baf5
	nop			;baf8
	rst 38h			;baf9
	nop			;bafa
	rst 38h			;bafb
	nop			;bafc
	rst 38h			;bafd
	nop			;bafe
	rst 30h			;baff
lbb00h:
	nop			;bb00
	call pe,0e100h		;bb01
	nop			;bb04
	ld a,(bc)		;bb05
	nop			;bb06
	call p,lfeffh+1		;bb07
	nop			;bb0a
	rst 20h			;bb0b
	nop			;bb0c
	ei			;bb0d
	nop			;bb0e
	call m,07f00h		;bb0f
	add a,b			;bb12
	rlca			;bb13
	ret m			;bb14
	nop			;bb15
	rst 38h			;bb16
	nop			;bb17
	rst 38h			;bb18
	nop			;bb19
	rst 38h			;bb1a
	nop			;bb1b
	rst 38h			;bb1c
	nop			;bb1d
	rst 38h			;bb1e
	nop			;bb1f
	rst 38h			;bb20
	nop			;bb21
	rst 38h			;bb22
	nop			;bb23
	rst 38h			;bb24
	nop			;bb25
	rst 38h			;bb26
	nop			;bb27
	rst 38h			;bb28
	nop			;bb29
	rst 38h			;bb2a
	nop			;bb2b
	rst 38h			;bb2c
	nop			;bb2d
	rst 38h			;bb2e
	nop			;bb2f
	rst 38h			;bb30
	nop			;bb31
	rst 38h			;bb32
	nop			;bb33
	rst 38h			;bb34
	nop			;bb35
	rst 38h			;bb36
	nop			;bb37
	call m,sub_f801h	;bb38
	inc bc			;bb3b
	ret m			;bb3c
	inc bc			;bb3d
	ret p			;bb3e
	ld b,020h		;bb3f
	dec c			;bb41
	nop			;bb42
	rst 8			;bb43
	nop			;bb44
	rst 38h			;bb45
	nop			;bb46
	rst 38h			;bb47
	nop			;bb48
	rst 38h			;bb49
	nop			;bb4a
	ret p			;bb4b
	ld c,0e0h		;bb4c
	ld c,080h		;bb4e
	inc b			;bb50
	ld (hl),b		;bb51
	nop			;bb52
	ld a,d			;bb53
	nop			;bb54
	defb 0fdh,000h,0fdh ;illegal sequence	;bb55
	nop			;bb58
	ld a,l			;bb59
	nop			;bb5a
	cp 000h			;bb5b
	jp m,lf600h		;bb5d
	nop			;bb60
	ld a,a			;bb61
	nop			;bb62
lbb63h:
	rst 38h			;bb63
	nop			;bb64
	ld l,a			;bb65
	add a,b			;bb66
	cpl			;bb67
	add a,b			;bb68
	scf			;bb69
	ret nz			;bb6a
	rla			;bb6b
	ret po			;bb6c
	dec bc			;bb6d
	ret po			;bb6e
	dec c			;bb6f
	ret po			;bb70
	inc c			;bb71
	ret p			;bb72
	ld b,0f0h		;bb73
	rlca			;bb75
	ret m			;bb76
	inc bc			;bb77
	call m,sub_fe01h	;bb78
	nop			;bb7b
	rst 38h			;bb7c
	nop			;bb7d
	rst 38h			;bb7e
	nop			;bb7f
	rst 38h			;bb80
	nop			;bb81
	rst 38h			;bb82
	nop			;bb83
	rst 38h			;bb84
	nop			;bb85
	rst 38h			;bb86
	nop			;bb87
	ld b,b			;bb88
	ld (de),a		;bb89
	nop			;bb8a
	ld (hl),001h		;bb8b
	ld l,h			;bb8d
	ld bc,003dch		;bb8e
	ret m			;bb91
	rlca			;bb92
	ret p			;bb93
	rlca			;bb94
	nop			;bb95
	inc bc			;bb96
	ret pe			;bb97
	rlca			;bb98
	ld (hl),b		;bb99
	rrca			;bb9a
	nop			;bb9b
	inc a			;bb9c
	add a,b			;bb9d
	djnz lbb63h		;bb9e
	nop			;bba0
	rst 28h			;bba1
	nop			;bba2
	ld e,h			;bba3
	nop			;bba4
	cp a			;bba5
	nop			;bba6
	rst 38h			;bba7
	nop			;bba8
	ld (hl),c		;bba9
	nop			;bbaa
	cp d			;bbab
	nop			;bbac
	call m,lfe00h		;bbad
	nop			;bbb0
	ld a,a			;bbb1
lbbb2h:
	nop			;bbb2
	or l			;bbb3
	nop			;bbb4
	or h			;bbb5
	nop			;bbb6
	ret nc			;bbb7
	nop			;bbb8
	jp c,sub_ea00h		;bbb9
	nop			;bbbc
	xor 000h		;bbbd
	rst 30h			;bbbf
	nop			;bbc0
	ld a,e			;bbc1
	nop			;bbc2
	call m,03f00h		;bbc3
	nop			;bbc6
	rst 8			;bbc7
	nop			;bbc8
	ei			;bbc9
	nop			;bbca
	ei			;bbcb
	nop			;bbcc
	ld e,h			;bbcd
	add a,b			;bbce
	inc a			;bbcf
	add a,b			;bbd0
	ccf			;bbd1
	ret nz			;bbd2
	rra			;bbd3
	ret nz			;bbd4
	rla			;bbd5
	ret po			;bbd6
	rrca			;bbd7
	nop			;bbd8
	ld c,c			;bbd9
	nop			;bbda
	ld l,c			;bbdb
	add a,b			;bbdc
	dec (hl)		;bbdd
	add a,b			;bbde
	scf			;bbdf
	ret nz			;bbe0
	inc e			;bbe1
	ret po			;bbe2
	dec bc			;bbe3
	ret p			;bbe4
	rlca			;bbe5
	ret nz			;bbe6
	ld c,081h		;bbe7
	jr c,lbbb2h		;bbe9
	nop			;bbeb
	rrca			;bbec
	nop			;bbed
	ld (bc),a		;bbee
	ret p			;bbef
	nop			;bbf0
	defb 0fdh,000h,0e6h ;illegal sequence	;bbf1
	nop			;bbf4
	ld e,a			;bbf5
	nop			;bbf6
	cp a			;bbf7
	nop			;bbf8
	or c			;bbf9
	nop			;bbfa
	xor e			;bbfb
	nop			;bbfc
	ld b,a			;bbfd
	nop			;bbfe
	rst 28h			;bbff
lbc00h:
	nop			;bc00
	rst 38h			;bc01
	nop			;bc02
	jp c,09200h		;bc03
	nop			;bc06
	sub l			;bc07
	nop			;bc08
	dec b			;bc09
	nop			;bc0a
	xor e			;bc0b
	nop			;bc0c
	or a			;bc0d
	nop			;bc0e
	xor a			;bc0f
	nop			;bc10
	rst 18h			;bc11
	nop			;bc12
	ccf			;bc13
	nop			;bc14
	rst 38h			;bc15
	nop			;bc16
	rst 18h			;bc17
	nop			;bc18
	ret po			;bc19
	nop			;bc1a
	rst 38h			;bc1b
	nop			;bc1c
	sbc a,a			;bc1d
	nop			;bc1e
	ex (sp),hl		;bc1f
	nop			;bc20
	ld a,h			;bc21
	nop			;bc22
	ld a,a			;bc23
	nop			;bc24
	cp a			;bc25
	nop			;bc26
	cp a			;bc27
	rrca			;bc28
	jr nz,lbc32h		;bc29
	ld b,b			;bc2b
	nop			;bc2c
	ret m			;bc2d
	nop			;bc2e
	rst 38h			;bc2f
	nop			;bc30
	rst 38h			;bc31
lbc32h:
	nop			;bc32
	xor 010h		;bc33
	add a,a			;bc35
	ld a,b			;bc36
	inc bc			;bc37
	call m,ldf00h		;bc38
	nop			;bc3b
	rrca			;bc3c
	jr nz,lbc4eh		;bc3d
	ret po			;bc3f
	rra			;bc40
	ret nz			;bc41
	ld a,(01080h)		;bc42
	dec b			;bc45
	nop			;bc46
	ld hl,(05700h)		;bc47
	nop			;bc4a
	cpl			;bc4b
	nop			;bc4c
	ld a,a			;bc4d
lbc4eh:
	nop			;bc4e
	ld a,a			;bc4f
	nop			;bc50
	ld h,(hl)		;bc51
	nop			;bc52
	defb 0ddh,000h,0bah ;illegal sequence	;bc53
	nop			;bc56
	ld (hl),l		;bc57
	nop			;bc58
	jp p,0f401h		;bc59
	ld bc,001f4h		;bc5c
	call pe,sub_e801h	;bc5f
	ld bc,00154h		;bc62
	ret c			;bc65
	ld bc,00134h		;bc66
	ret pe			;bc69
	ld bc,000f4h		;bc6a
	jp pe,09401h		;bc6d
	nop			;bc70
	ld l,d			;bc71
	nop			;bc72
	push af			;bc73
	nop			;bc74
	ei			;bc75
	nop			;bc76
	call m,000ffh		;bc77
	rst 38h			;bc7a
	nop			;bc7b
	rra			;bc7c
	nop			;bc7d
	ld bc,000e0h		;bc7e
	cp 000h			;bc81
	ld a,a			;bc83
	nop			;bc84
	sbc a,a			;bc85
	nop			;bc86
	ex (sp),hl		;bc87
	nop			;bc88
	call m,03f00h		;bc89
	ret nz			;bc8c
	inc bc			;bc8d
	ret nz			;bc8e
	inc b			;bc8f
	nop			;bc90
	ccf			;bc91
	nop			;bc92
	rst 38h			;bc93
	nop			;bc94
	ld a,a			;bc95
	nop			;bc96
	cp e			;bc97
	nop			;bc98
	ei			;bc99
	nop			;bc9a
	and 000h		;bc9b
	rst 18h			;bc9d
	nop			;bc9e
	ld a,001h		;bc9f
	call m,sub_f803h	;bca1
	rlca			;bca4
	ret nz			;bca5
	rra			;bca6
	nop			;bca7
	rst 38h			;bca8
	nop			;bca9
	rst 38h			;bcaa
	nop			;bcab
	rst 38h			;bcac
	nop			;bcad
	rst 38h			;bcae
	nop			;bcaf
	rst 38h			;bcb0
	nop			;bcb1
	rst 38h			;bcb2
	nop			;bcb3
	rst 38h			;bcb4
	nop			;bcb5
	rst 38h			;bcb6
	nop			;bcb7
	rst 38h			;bcb8
	nop			;bcb9
	rst 38h			;bcba
	nop			;bcbb
	rst 38h			;bcbc
	nop			;bcbd
	rst 38h			;bcbe
	nop			;bcbf
	rst 38h			;bcc0
	nop			;bcc1
	ld a,a			;bcc2
	nop			;bcc3
	ld a,a			;bcc4
	nop			;bcc5
	ccf			;bcc6
	add a,b			;bcc7
	rst 38h			;bcc8
	nop			;bcc9
	rst 38h			;bcca
	nop			;bccb
	rst 38h			;bccc
	nop			;bccd
	sbc a,a			;bcce
	nop			;bccf
	rlca			;bcd0
	ld h,b			;bcd1
	inc bc			;bcd2
	cp b			;bcd3
	ld bc,000fch		;bcd4
	or 000h			;bcd7
	or 000h			;bcd9
	jp pe,l9600h		;bcdb
	nop			;bcde
	ld l,d			;bcdf
	ld bc,003f4h		;bce0
	ret pe			;bce3
	rlca			;bce4
	ret nc			;bce5
	rrca			;bce6
	and b			;bce7
	rra			;bce8
	ld b,b			;bce9
	ccf			;bcea
	add a,b			;bceb
	ld a,a			;bcec
	nop			;bced
	rst 38h			;bcee
	nop			;bcef
	rst 38h			;bcf0
	nop			;bcf1
	rst 38h			;bcf2
	nop			;bcf3
	rst 38h			;bcf4
	nop			;bcf5
	rst 38h			;bcf6
	nop			;bcf7
	rst 38h			;bcf8
	nop			;bcf9
	rst 38h			;bcfa
	nop			;bcfb
	rst 38h			;bcfc
	nop			;bcfd
	rst 38h			;bcfe
	nop			;bcff
	rst 38h			;bd00
	nop			;bd01
	rst 38h			;bd02
	nop			;bd03
	rst 38h			;bd04
	nop			;bd05
	rst 38h			;bd06
	nop			;bd07
	rst 38h			;bd08
	nop			;bd09
	rst 38h			;bd0a
	nop			;bd0b
	rst 38h			;bd0c
	nop			;bd0d
	rst 38h			;bd0e
	nop			;bd0f
	rst 38h			;bd10
	nop			;bd11
	rst 38h			;bd12
	nop			;bd13
	rst 38h			;bd14
	nop			;bd15
	rst 38h			;bd16
	nop			;bd17
	rst 38h			;bd18
	nop			;bd19
	rst 38h			;bd1a
	nop			;bd1b
	rst 38h			;bd1c
	nop			;bd1d
	rst 38h			;bd1e
	nop			;bd1f
	rst 38h			;bd20
	nop			;bd21
	rst 38h			;bd22
	nop			;bd23
	rst 38h			;bd24
	nop			;bd25
	rst 38h			;bd26
	nop			;bd27
	call m,sub_f000h	;bd28
	inc bc			;bd2b
	ret po			;bd2c
	rrca			;bd2d
	ret nz			;bd2e
	rra			;bd2f
	add a,b			;bd30
	ccf			;bd31
	nop			;bd32
	ld a,a			;bd33
	nop			;bd34
	ld a,a			;bd35
	nop			;bd36
	ld a,a			;bd37
sub_bd38h:
	add a,b			;bd38
	ccf			;bd39
	ret nz			;bd3a
	rra			;bd3b
	ret po			;bd3c
	rrca			;bd3d
	ret p			;bd3e
	rlca			;bd3f
	ret m			;bd40
	inc bc			;bd41
	call m,sub_fe01h	;bd42
	nop			;bd45
	rst 38h			;bd46
	nop			;bd47
	rst 38h			;bd48
	nop			;bd49
	rst 38h			;bd4a
	nop			;bd4b
	rst 38h			;bd4c
	nop			;bd4d
	rst 38h			;bd4e
	nop			;bd4f
	rst 38h			;bd50
	nop			;bd51
	rst 38h			;bd52
	nop			;bd53
	rst 38h			;bd54
	nop			;bd55
	rst 38h			;bd56
	nop			;bd57
	rst 38h			;bd58
	nop			;bd59
	rst 38h			;bd5a
	nop			;bd5b
	rst 38h			;bd5c
	nop			;bd5d
	ret po			;bd5e
	nop			;bd5f
	ret nz			;bd60
	rra			;bd61
	add a,b			;bd62
	ld l,000h		;bd63
	ld a,l			;bd65
	nop			;bd66
	sbc a,e			;bd67
	ret m			;bd68
	inc bc			;bd69
	ret m			;bd6a
	ld (bc),a		;bd6b
	call m,sub_fe01h	;bd6c
	nop			;bd6f
	cp 000h			;bd70
	ret m			;bd72
	ld bc,005d0h		;bd73
	nop			;bd76
	ld hl,(0d700h)		;bd77
	nop			;bd7a
	cp a			;bd7b
	nop			;bd7c
	rst 38h			;bd7d
	nop			;bd7e
lbd7fh:
	rst 38h			;bd7f
	nop			;bd80
	rst 38h			;bd81
	nop			;bd82
	jp m,sub_fd00h		;bd83
	nop			;bd86
	rst 30h			;bd87
	nop			;bd88
	ret m			;bd89
	ld bc,000fch		;bd8a
	cp 000h			;bd8d
	rst 28h			;bd8f
	nop			;bd90
	defb 0fdh,000h,0d7h ;illegal sequence	;bd91
	nop			;bd94
	cp 000h			;bd95
	dec sp			;bd97
	ret nz			;bd98
	rrca			;bd99
	ret p			;bd9a
	dec b			;bd9b
	ret m			;bd9c
	inc bc			;bd9d
	call m,sub_fe01h	;bd9e
	nop			;bda1
	rst 38h			;bda2
	nop			;bda3
	rst 38h			;bda4
	nop			;bda5
	rst 38h			;bda6
	nop			;bda7
	rst 38h			;bda8
	nop			;bda9
	cp 000h			;bdaa
	ret m			;bdac
	ld bc,00770h		;bdad
	nop			;bdb0
	adc a,a			;bdb1
	nop			;bdb2
	ld a,c			;bdb3
	nop			;bdb4
	rst 20h			;bdb5
	nop			;bdb6
	rst 18h			;bdb7
	nop			;bdb8
	rst 38h			;bdb9
	nop			;bdba
	ld (hl),b		;bdbb
	nop			;bdbc
lbdbdh:
	rst 8			;bdbd
	nop			;bdbe
lbdbfh:
	ld a,(hl)		;bdbf
	nop			;bdc0
lbdc1h:
	ld a,c			;bdc1
	nop			;bdc2
	or a			;bdc3
	nop			;bdc4
	ld c,a			;bdc5
	nop			;bdc6
	rst 18h			;bdc7
	nop			;bdc8
	ld e,a			;bdc9
	nop			;bdca
	or c			;bdcb
	nop			;bdcc
	ld l,a			;bdcd
	nop			;bdce
	cp a			;bdcf
	nop			;bdd0
	ld e,a			;bdd1
	nop			;bdd2
	cp a			;bdd3
	nop			;bdd4
	ld e,a			;bdd5
	nop			;bdd6
	sbc a,a			;bdd7
	nop			;bdd8
	ccf			;bdd9
	add a,b			;bdda
	ccf			;bddb
	add a,b			;bddc
	ccf			;bddd
	nop			;bdde
	dec a			;bddf
	nop			;bde0
	cp a			;bde1
	nop			;bde2
	sbc a,a			;bde3
	nop			;bde4
	rst 10h			;bde5
	nop			;bde6
	xor l			;bde7
	nop			;bde8
lbde9h:
	rst 28h			;bde9
	nop			;bdea
	ld l,e			;bdeb
	nop			;bdec
	xor 000h		;bded
	and a			;bdef
	nop			;bdf0
	ld l,a			;bdf1
	add a,b			;bdf2
lbdf3h:
	dec hl			;bdf3
	nop			;bdf4
lbdf5h:
	ld l,a			;bdf5
	nop			;bdf6
	ld l,l			;bdf7
	nop			;bdf8
	ld d,a			;bdf9
	nop			;bdfa
	ld l,a			;bdfb
	nop			;bdfc
lbdfdh:
	rst 28h			;bdfd
	nop			;bdfe
	ex de,hl		;bdff
lbe00h:
	nop			;be00
	rst 20h			;be01
	nop			;be02
	adc a,000h		;be03
	sub e			;be05
	ld b,b			;be06
	ld e,000h		;be07
	defb 0fdh,000h,0e2h ;illegal sequence	;be09
	nop			;be0c
	sbc a,l			;be0d
	nop			;be0e
	ld a,(hl)		;be0f
	nop			;be10
	rst 38h			;be11
	nop			;be12
	cp 000h			;be13
	rst 38h			;be15
	nop			;be16
	cp 000h			;be17
	defb 0fdh,000h,0fah ;illegal sequence	;be19
	nop			;be1c
	push af			;be1d
	nop			;be1e
	cp 000h			;be1f
	cp l			;be21
	nop			;be22
	and (hl)		;be23
	jr lbde9h		;be24
lbe26h:
	inc e			;be26
	pop bc			;be27
	inc c			;be28
	pop hl			;be29
	inc c			;be2a
	pop hl			;be2b
	ex af,af'		;be2c
	ex (sp),hl		;be2d
	jr lbdf3h		;be2e
	jr lbdf5h		;be30
	djnz lbe7bh		;be32
	djnz lbdfdh		;be34
	jr nc,lbdbfh		;be36
	ld a,b			;be38
	inc bc			;be39
	jr c,lbdbfh		;be3a
	jr c,lbdc1h		;be3c
	inc a			;be3e
	add a,c			;be3f
	ld a,(hl)		;be40
	nop			;be41
	ld a,a			;be42
	nop			;be43
	ld a,a			;be44
	nop			;be45
	ld a,a			;be46
	nop			;be47
	ld a,a			;be48
	nop			;be49
	ccf			;be4a
	add a,b			;be4b
	rra			;be4c
	ret nz			;be4d
	rrca			;be4e
lbe4fh:
	ret nz			;be4f
	rlca			;be50
	ret p			;be51
	inc bc			;be52
	ret pe			;be53
	ld bc,00074h		;be54
	xor 01fh		;be57
	ld b,b			;be59
	rrca			;be5a
	and b			;be5b
lbe5ch:
	rrca			;be5c
	ld h,b			;be5d
	rrca			;be5e
	and b			;be5f
	rrca			;be60
	ld h,b			;be61
	rrca			;be62
	and b			;be63
	rra			;be64
	ld b,b			;be65
	rra			;be66
	ret nz			;be67
	ccf			;be68
	add a,b			;be69
	ccf			;be6a
	add a,b			;be6b
	ld a,a			;be6c
	nop			;be6d
	ccf			;be6e
	add a,b			;be6f
	rra			;be70
	ld b,b			;be71
	rrca			;be72
	and b			;be73
	rrca			;be74
	ld h,b			;be75
	rlca			;be76
	or b			;be77
lbe78h:
	rlca			;be78
	ret nc			;be79
	rlca			;be7a
lbe7bh:
	or b			;be7b
	rrca			;be7c
	ret po			;be7d
	rra			;be7e
	add a,b			;be7f
	rra			;be80
	ld b,b			;be81
	ccf			;be82
	add a,b			;be83
	ld a,a			;be84
	nop			;be85
	ccf			;be86
	add a,b			;be87
	ld a,a			;be88
	nop			;be89
	ccf			;be8a
	add a,b			;be8b
	rra			;be8c
	ret nz			;be8d
	rrca			;be8e
	ret po			;be8f
	rlca			;be90
	ret p			;be91
	rlca			;be92
	jr nc,lbe5ch		;be93
	djnz lbe26h		;be95
	jr nz,lbe78h		;be97
	nop			;be99
	rst 38h			;be9a
	nop			;be9b
	rst 38h			;be9c
	nop			;be9d
	rst 38h			;be9e
	nop			;be9f
	rst 38h			;bea0
	nop			;bea1
	rst 38h			;bea2
	nop			;bea3
	rst 38h			;bea4
	nop			;bea5
	rst 38h			;bea6
	nop			;bea7
	jr lbed0h		;bea8
	inc bc			;beaa
	inc bc			;beab
	ld bc,00101h		;beac
	ld bc,06203h		;beaf
	out (0abh),a		;beb2
	rst 18h			;beb4
	rst 0			;beb5
	set 1,h			;beb6
	ld c,h			;beb8
	ld c,00fh		;beb9
	dec c			;bebb
	dec bc			;bebc
	dec c			;bebd
	inc c			;bebe
	dec b			;bebf
	dec bc			;bec0
	dec c			;bec1
	ld c,00fh		;bec2
	rrca			;bec4
	rrca			;bec5
	rrca			;bec6
	rrca			;bec7
	inc bc			;bec8
	ld b,00ch		;bec9
	inc c			;becb
	sbc a,b			;becc
	ex af,af'		;becd
	sbc a,b			;bece
	ex af,af'		;becf
lbed0h:
	sbc a,h			;bed0
	sub h			;bed1
	ld c,(hl)		;bed2
	cp 077h			;bed3
	adc a,a			;bed5
	cp 0f9h			;bed6
	xor c			;bed8
	xor e			;bed9
	daa			;beda
	xor (ix-003h)		;bedb
	ld sp,hl		;bede
	ld (hl),l		;bedf
	ld c,d			;bee0
	ld d,(hl)		;bee1
	sub l			;bee2
	ld a,e			;bee3
	add a,a			;bee4
	cp 0ffh			;bee5
	rst 38h			;bee7
	add a,b			;bee8
	ld b,c			;bee9
	ld bc,00101h		;beea
	ld bc,00001h		;beed
	nop			;bef0
	jr c,$+110		;bef1
	call p,04c6ch		;bef3
	adc a,h			;bef6
	adc a,b			;bef7
	add a,b			;bef8
	add a,b			;bef9
	add a,b			;befa
	add a,b			;befb
	add a,b			;befc
	add a,b			;befd
	add a,b			;befe
	nop			;beff
lbf00h:
	add a,b			;bf00
	add a,b			;bf01
	ld b,b			;bf02
	add a,b			;bf03
	ld b,b			;bf04
	and c			;bf05
	ld h,c			;bf06
	or c			;bf07
	nop			;bf08
	nop			;bf09
	add a,b			;bf0a
	ld b,b			;bf0b
	and b			;bf0c
	ld d,b			;bf0d
	xor c			;bf0e
	push de			;bf0f
	xor c			;bf10
	push de			;bf11
	adc a,c			;bf12
	push de			;bf13
	xor l			;bf14
	push de			;bf15
	xor c			;bf16
	push de			;bf17
	xor c			;bf18
	push de			;bf19
	and e			;bf1a
	ld d,e			;bf1b
	ld l,e			;bf1c
	ld d,e			;bf1d
	ld l,e			;bf1e
	ld d,e			;bf1f
	ld l,e			;bf20
	ld d,e			;bf21
	and e			;bf22
	rst 30h			;bf23
	xor a			;bf24
	ld c,a			;bf25
	adc a,a			;bf26
	ld e,(hl)		;bf27
lbf28h:
	ret nz			;bf28
	ret m			;bf29
	xor (hl)		;bf2a
	push de			;bf2b
	xor d			;bf2c
	defb 0ddh,0bfh,07fh ;illegal sequence	;bf2d
	cp a			;bf30
	ld a,a			;bf31
	cp a			;bf32
	ld a,a			;bf33
	rst 38h			;bf34
	ld a,a			;bf35
	rst 38h			;bf36
	rst 38h			;bf37
	rst 38h			;bf38
	rst 38h			;bf39
	rst 38h			;bf3a
	rst 38h			;bf3b
	rst 38h			;bf3c
	rst 38h			;bf3d
	cp 0f5h			;bf3e
	rst 28h			;bf40
	jp c,ld2e2h		;bf41
	ret po			;bf44
	and b			;bf45
	jr nz,lbf48h		;bf46
lbf48h:
	nop			;bf48
	nop			;bf49
	nop			;bf4a
	ret nz			;bf4b
	cp b			;bf4c
	ld d,a			;bf4d
	xor d			;bf4e
	push af			;bf4f
	rst 38h			;bf50
	rst 38h			;bf51
	rst 38h			;bf52
	rst 38h			;bf53
	rst 38h			;bf54
	rst 38h			;bf55
	rst 38h			;bf56
	rst 38h			;bf57
	rst 38h			;bf58
	rst 38h			;bf59
	rst 38h			;bf5a
	rst 38h			;bf5b
	push af			;bf5c
	jp pe,051b3h		;bf5d
	ld sp,01111h		;bf60
	nop			;bf63
	nop			;bf64
	nop			;bf65
	nop			;bf66
	nop			;bf67
	nop			;bf68
	nop			;bf69
	nop			;bf6a
	nop			;bf6b
	nop			;bf6c
	nop			;bf6d
	ret po			;bf6e
	ld a,b			;bf6f
	xor a			;bf70
	push de			;bf71
	jp m,lfefdh		;bf72
	defb 0fdh,0feh,0ffh ;illegal sequence	;bf75
	rst 38h			;bf78
	rst 38h			;bf79
	rst 38h			;bf7a
	rst 38h			;bf7b
	ld l,a			;bf7c
	sub a			;bf7d
	adc a,l			;bf7e
	adc a,d			;bf7f
	nop			;bf80
	nop			;bf81
	nop			;bf82
	nop			;bf83
	nop			;bf84
	nop			;bf85
	nop			;bf86
lbf87h:
	nop			;bf87
	nop			;bf88
	nop			;bf89
	nop			;bf8a
	nop			;bf8b
	nop			;bf8c
	nop			;bf8d
	nop			;bf8e
	nop			;bf8f
	nop			;bf90
	ret nz			;bf91
	ret nz			;bf92
	ld h,b			;bf93
	and b			;bf94
	ld d,b			;bf95
	or b			;bf96
	ret nc			;bf97
	ret pe			;bf98
	ret c			;bf99
	call pe,sub_faf4h	;bf9a
	or 0fah			;bf9d
	defb 0fdh,07bh,025h ;illegal sequence	;bf9f
	ld hl,00002h		;bfa2
	nop			;bfa5
	nop			;bfa6
	nop			;bfa7
	nop			;bfa8
	nop			;bfa9
	nop			;bfaa
	nop			;bfab
	nop			;bfac
	nop			;bfad
	nop			;bfae
sub_bfafh:
	nop			;bfaf
	nop			;bfb0
	nop			;bfb1
	nop			;bfb2
	nop			;bfb3
	nop			;bfb4
	nop			;bfb5
	nop			;bfb6
	nop			;bfb7
	nop			;bfb8
	nop			;bfb9
	nop			;bfba
	nop			;bfbb
	nop			;bfbc
	nop			;bfbd
	nop			;bfbe
	nop			;bfbf
	nop			;bfc0
	rlca			;bfc1
	ld bc,sub_7f1dh+1	;bfc2
	in a,(0b6h)		;bfc5
	or (hl)			;bfc7
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
	ld bc,00101h		;bfd9
	ld bc,00703h		;bfdc
	rra			;bfdf
	ld a,a			;bfe0
	call m,sub_e0f8h	;bfe1
	ld b,b			;bfe4
	add a,b			;bfe5
	add a,b			;bfe6
	add a,b			;bfe7
	rrca			;bfe8
	rrca			;bfe9
	rrca			;bfea
	rra			;bfeb
	rra			;bfec
	rra			;bfed
	rra			;bfee
	ccf			;bfef
	ccf			;bff0
	ld e,a			;bff1
sub_bff2h:
	ld e,a			;bff2
	ld l,e			;bff3
	defb 0edh ;next byte illegal after ed	;bff4
	or 0f5h			;bff5
	ei			;bff7
	call m,sub_f8f8h	;bff8
	ret m			;bffb
	ret p			;bffc
	ret p			;bffd
lbffeh:
	ret po			;bffe
lbfffh:
	add a,b			;bfff
lc000h:
	nop			;c000
	nop			;c001
	nop			;c002
	nop			;c003
	inc bc			;c004
	dec b			;c005
	dec bc			;c006
	dec bc			;c007
	rst 38h			;c008
	defb 0fdh,0fdh,07bh ;illegal sequence	;c009
	or a			;c00c
	rst 38h			;c00d
	ld a,l			;c00e
lc00fh:
	sub e			;c00f
lc010h:
	rst 38h			;c010
	rst 38h			;c011
	rst 38h			;c012
	cp 0fdh			;c013
	cp d			;c015
	ld d,l			;c016
	xor d			;c017
	ld a,a			;c018
	nop			;c019
	nop			;c01a
	nop			;c01b
	nop			;c01c
	nop			;c01d
	nop			;c01e
lc01fh:
	nop			;c01f
	inc bc			;c020
	ccf			;c021
	rlca			;c022
	ld a,e			;c023
	or (iy+06eh)		;c024
	ld l,(hl)		;c027
	jp nc,ld7abh		;c028
	rst 28h			;c02b
	ret c			;c02c
	rst 30h			;c02d
	rst 28h			;c02e
	rst 18h			;c02f
	cp a			;c030
	cp a			;c031
	cp a			;c032
	rst 18h			;c033
	ld a,(hl)		;c034
	cp a			;c035
	ld a,(hl)		;c036
	cp l			;c037
	ld a,03dh		;c038
	ccf			;c03a
	dec a			;c03b
	ld a,03eh		;c03c
	ld a,h			;c03e
	ret m			;c03f
	ret m			;c040
	ret nz			;c041
	add a,b			;c042
	add a,b			;c043
	nop			;c044
	ld bc,00f03h		;c045
	call p,sub_fcf8h	;c048
	xor a			;c04b
	ld d,l			;c04c
	xor d			;c04d
	push de			;c04e
	ld l,a			;c04f
	xor a			;c050
	ld l,a			;c051
	xor a			;c052
	ld l,a			;c053
	rst 18h			;c054
	cp a			;c055
	cp a			;c056
	cp a			;c057
	cp a			;c058
	add a,a			;c059
	nop			;c05a
	nop			;c05b
	nop			;c05c
	nop			;c05d
	nop			;c05e
	nop			;c05f
	nop			;c060
	inc bc			;c061
	ld bc,0563ah		;c062
	xor e			;c065
	ld e,(hl)		;c066
	ret m			;c067
	nop			;c068
	nop			;c069
	nop			;c06a
	add a,b			;c06b
	ld a,h			;c06c
	xor e			;c06d
	ld d,l			;c06e
	xor d			;c06f
	rst 38h			;c070
	rst 38h			;c071
	rst 38h			;c072
	rst 38h			;c073
	rst 38h			;c074
	rst 38h			;c075
	rst 38h			;c076
	rst 38h			;c077
	rst 38h			;c078
	rst 38h			;c079
	nop			;c07a
	ld bc,00300h		;c07b
	ld b,03dh		;c07e
	ld d,a			;c080
	xor h			;c081
	ld e,b			;c082
	or b			;c083
	ld h,e			;c084
	rra			;c085
	ld l,h			;c086
	ld e,e			;c087
	nop			;c088
	nop			;c089
	nop			;c08a
	nop			;c08b
	nop			;c08c
	ret m			;c08d
	ld d,(hl)		;c08e
	xor d			;c08f
	ld d,l			;c090
	jp m,ld6fdh		;c091
	rst 28h			;c094
	rst 18h			;c095
	rst 18h			;c096
	rst 18h			;c097
	rst 28h			;c098
	out (069h),a		;c099
	or b			;c09b
	ret c			;c09c
	or b			;c09d
	ret po			;c09e
	add a,e			;c09f
	rlca			;c0a0
	rrca			;c0a1
	rrca			;c0a2
	inc bc			;c0a3
	cp l			;c0a4
	cp 0fah			;c0a5
	xor l			;c0a7
	nop			;c0a8
	nop			;c0a9
	nop			;c0aa
	nop			;c0ab
	nop			;c0ac
	nop			;c0ad
	nop			;c0ae
	nop			;c0af
	add a,b			;c0b0
	ret po			;c0b1
	ld l,h			;c0b2
	or a			;c0b3
	rst 10h			;c0b4
	ex de,hl		;c0b5
	in a,(0e9h)		;c0b6
	ret m			;c0b8
	call pe,sub_7cf4h	;c0b9
lc0bch:
	ld e,03ch		;c0bc
	ret m			;c0be
	ret p			;c0bf
	ret po			;c0c0
	ret nz			;c0c1
	ret nz			;c0c2
	add a,b			;c0c3
	nop			;c0c4
	nop			;c0c5
sub_c0c6h:
	nop			;c0c6
	nop			;c0c7
	nop			;c0c8
	nop			;c0c9
	nop			;c0ca
	nop			;c0cb
	nop			;c0cc
	nop			;c0cd
	nop			;c0ce
	nop			;c0cf
	nop			;c0d0
	nop			;c0d1
	nop			;c0d2
	nop			;c0d3
	pop bc			;c0d4
	cp 0f8h			;c0d5
	ret po			;c0d7
	nop			;c0d8
	nop			;c0d9
	nop			;c0da
	nop			;c0db
	nop			;c0dc
	nop			;c0dd
	nop			;c0de
	nop			;c0df
sub_c0e0h:
	nop			;c0e0
	nop			;c0e1
	nop			;c0e2
	nop			;c0e3
	nop			;c0e4
	nop			;c0e5
	nop			;c0e6
	nop			;c0e7
	nop			;c0e8
	ld bc,01f07h		;c0e9
	ld a,a			;c0ec
	rst 38h			;c0ed
	rst 38h			;c0ee
	rst 38h			;c0ef
	nop			;c0f0
	ld l,d			;c0f1
	ld d,a			;c0f2
	cpl			;c0f3
	ld e,a			;c0f4
	dec a			;c0f5
	ld e,a			;c0f6
	ccf			;c0f7
	ld e,a			;c0f8
	cpl			;c0f9
	ld d,a			;c0fa
	ld hl,(laf55h)		;c0fb
	ld d,l			;c0fe
lc0ffh:
	xor e			;c0ff
lc100h:
	ld a,a			;c100
	rst 38h			;c101
	rst 38h			;c102
	rst 38h			;c103
lc104h:
	rst 38h			;c104
	rst 38h			;c105
	rst 38h			;c106
	rst 38h			;c107
	nop			;c108
	xor e			;c109
	rst 38h			;c10a
	rst 38h			;c10b
lc10ch:
	rst 38h			;c10c
	rst 38h			;c10d
	rst 38h			;c10e
	rst 38h			;c10f
	rst 38h			;c110
	rst 18h			;c111
	rst 38h			;c112
	xor d			;c113
	ld d,l			;c114
	rst 38h			;c115
	ld e,a			;c116
	rst 38h			;c117
	rst 38h			;c118
	rst 38h			;c119
	rst 38h			;c11a
	rst 38h			;c11b
lc11ch:
	rst 38h			;c11c
	rst 38h			;c11d
	rst 38h			;c11e
	rst 38h			;c11f
	nop			;c120
	rst 38h			;c121
	rst 38h			;c122
	ccf			;c123
	rst 38h			;c124
	rst 38h			;c125
	rst 38h			;c126
	rst 38h			;c127
	cp 0ffh			;c128
	rst 38h			;c12a
	cp a			;c12b
	ld d,b			;c12c
	rst 38h			;c12d
	rst 38h			;c12e
	rst 38h			;c12f
	rst 38h			;c130
	rst 38h			;c131
	rst 38h			;c132
	rst 38h			;c133
	rst 38h			;c134
	rst 38h			;c135
	rst 38h			;c136
	rst 38h			;c137
	nop			;c138
	rst 38h			;c139
	ret m			;c13a
	ld sp,hl		;c13b
	ei			;c13c
	ld sp,hl		;c13d
	ei			;c13e
	ld sp,hl		;c13f
	ei			;c140
	ld sp,hl		;c141
	ret m			;c142
	rst 38h			;c143
	nop			;c144
	rst 38h			;c145
	rst 38h			;c146
	rst 38h			;c147
	rst 38h			;c148
	rst 38h			;c149
	rst 38h			;c14a
	rst 38h			;c14b
	rst 38h			;c14c
	rst 38h			;c14d
	rst 38h			;c14e
	rst 38h			;c14f
	nop			;c150
	rst 38h			;c151
	rst 38h			;c152
	add a,h			;c153
	jp z,lf6f5h		;c154
	or a			;c157
	ld e,d			;c158
	cp h			;c159
	rst 20h			;c15a
	rst 38h			;c15b
	nop			;c15c
	rst 38h			;c15d
	rst 38h			;c15e
	rst 38h			;c15f
	rst 38h			;c160
	rst 38h			;c161
	rst 38h			;c162
	rst 38h			;c163
	rst 38h			;c164
	rst 38h			;c165
	rst 38h			;c166
	rst 38h			;c167
	nop			;c168
	rst 38h			;c169
	or 06ah			;c16a
	or a			;c16c
	ld e,a			;c16d
	sbc a,a			;c16e
	ld e,a			;c16f
	xor a			;c170
	ld b,(hl)		;c171
	jp po,000ffh		;c172
	rst 38h			;c175
	rst 38h			;c176
	rst 38h			;c177
	rst 38h			;c178
lc179h:
	rst 38h			;c179
	rst 38h			;c17a
	rst 38h			;c17b
	rst 38h			;c17c
	rst 38h			;c17d
	rst 38h			;c17e
	rst 38h			;c17f
	nop			;c180
	rst 38h			;c181
	rra			;c182
	sbc a,a			;c183
	rst 18h			;c184
	sbc a,a			;c185
	rst 18h			;c186
	sbc a,a			;c187
	rst 18h			;c188
	sbc a,a			;c189
	rra			;c18a
	rst 38h			;c18b
	nop			;c18c
	rst 38h			;c18d
	rst 38h			;c18e
	rst 38h			;c18f
	rst 38h			;c190
	rst 38h			;c191
	rst 38h			;c192
	rst 38h			;c193
	rst 38h			;c194
	rst 38h			;c195
	rst 38h			;c196
	rst 38h			;c197
	nop			;c198
	rst 38h			;c199
	rst 38h			;c19a
	cp 0ffh			;c19b
	rst 38h			;c19d
	rst 38h			;c19e
	cp a			;c19f
	rst 38h			;c1a0
	rst 38h			;c1a1
	rst 38h			;c1a2
	rst 38h			;c1a3
	nop			;c1a4
	rst 38h			;c1a5
	rst 38h			;c1a6
	rst 38h			;c1a7
	rst 38h			;c1a8
	push de			;c1a9
	cp 0ffh			;c1aa
	rst 38h			;c1ac
	rst 38h			;c1ad
	rst 38h			;c1ae
	defb 0fdh,002h,0ffh ;illegal sequence	;c1af
	rst 38h			;c1b2
	ld a,a			;c1b3
	rst 38h			;c1b4
	rst 38h			;c1b5
	rst 30h			;c1b6
	rst 38h			;c1b7
	rst 38h			;c1b8
	cp 0ffh			;c1b9
	rst 38h			;c1bb
	nop			;c1bc
	rst 38h			;c1bd
	rst 38h			;c1be
	rst 38h			;c1bf
	add a,b			;c1c0
	ld b,b			;c1c1
	and b			;c1c2
	ld d,b			;c1c3
	ret pe			;c1c4
	call nc,054eah		;c1c5
	xor d			;c1c8
	call nc,sub_7cfah	;c1c9
	jp m,lfafch		;c1cc
	call m,sub_fcfeh	;c1cf
	jp m,000bch		;c1d2
	defb 0fdh,0feh,0fdh ;illegal sequence	;c1d5
	rst 38h			;c1d8
	rst 38h			;c1d9
	rst 38h			;c1da
	ret po			;c1db
	ret po			;c1dc
	and 0e6h		;c1dd
	and 0e6h		;c1df
	and 0e6h		;c1e1
	and 0e6h		;c1e3
	and 0e6h		;c1e5
lc1e7h:
	and 0e6h		;c1e7
	and 0e5h		;c1e9
	ex (sp),hl		;c1eb
	and 0edh		;c1ec
	jp pe,lf5f7h		;c1ee
	defb 0edh ;next byte illegal after ed	;c1f1
	defb 0ddh,0d9h,0b9h ;illegal sequence	;c1f2
	cp c			;c1f5
	ld sp,hl		;c1f6
	cp c			;c1f7
	ld sp,hl		;c1f8
	ld sp,hl		;c1f9
	jp p,000fch		;c1fa
	call m,sub_f8e4h	;c1fd
	nop			;c200
	call m,sub_faf6h	;c201
	jp m,lfafah		;c204
	jp m,lffffh		;c207
	rst 38h			;c20a
	pop bc			;c20b
	pop bc			;c20c
	call sub_cdcdh		;c20d
	call sub_cdcdh		;c210
	set 0,(hl)		;c213
	call sub_f4fbh		;c215
	ex de,hl		;c218
	rst 10h			;c219
	and a			;c21a
	ld d,a			;c21b
	or a			;c21c
	ld h,a			;c21d
	rst 0			;c21e
	rlca			;c21f
	rlca			;c220
	rlca			;c221
	rlca			;c222
	rlca			;c223
	inc bc			;c224
	inc b			;c225
	inc bc			;c226
	rlca			;c227
	inc bc			;c228
	nop			;c229
	inc bc			;c22a
	inc bc			;c22b
	inc bc			;c22c
	inc bc			;c22d
	inc bc			;c22e
	inc bc			;c22f
	inc bc			;c230
	inc bc			;c231
	inc bc			;c232
	inc bc			;c233
	inc bc			;c234
	inc bc			;c235
	inc bc			;c236
	inc bc			;c237
	rst 38h			;c238
	rst 38h			;c239
	rst 38h			;c23a
	add a,(hl)		;c23b
	or (hl)			;c23c
	or (hl)			;c23d
	or a			;c23e
	xor h			;c23f
	sub c			;c240
	jp (hl)			;c241
	sbc a,c			;c242
	ld e,c			;c243
lc244h:
	sbc a,b			;c244
	jr $+1			;c245
	rrca			;c247
	or b			;c248
	xor l			;c249
	xor l			;c24a
	xor l			;c24b
	xor h			;c24c
	xor a			;c24d
	xor (hl)		;c24e
	xor h			;c24f
	xor b			;c250
	xor b			;c251
	sub b			;c252
	ret p			;c253
	ret po			;c254
	nop			;c255
	and b			;c256
	ret nc			;c257
	and b			;c258
	nop			;c259
	and b			;c25a
	and b			;c25b
	and b			;c25c
	and b			;c25d
	and b			;c25e
	and b			;c25f
	and b			;c260
	and b			;c261
	and b			;c262
	and b			;c263
	and b			;c264
	and b			;c265
	and b			;c266
	and b			;c267
	rst 38h			;c268
	rst 38h			;c269
	rst 38h			;c26a
	ld e,0b1h		;c26b
	ld b,l			;c26d
	dec h			;c26e
	push hl			;c26f
	ld h,l			;c270
	ld h,l			;c271
	ld h,l			;c272
	ld h,l			;c273
	ld h,l			;c274
	ld h,c			;c275
	pop af			;c276
	defb 0fdh,0ffh,03fh ;illegal sequence	;c277
	ld b,e			;c27a
	ld a,h			;c27b
	di			;c27c
	add a,e			;c27d
	inc bc			;c27e
	inc bc			;c27f
	inc bc			;c280
	inc bc			;c281
	inc bc			;c282
	inc bc			;c283
	ld bc,00102h		;c284
	inc bc			;c287
	ld bc,00100h		;c288
	ld bc,00101h		;c28b
	ld bc,00101h		;c28e
	ld bc,00101h		;c291
	ld bc,00101h		;c294
	ld bc,lfeffh		;c297
	pop bc			;c29a
	dec de			;c29b
	sbc a,e			;c29c
	sbc a,e			;c29d
	sbc a,e			;c29e
	sbc a,e			;c29f
	sbc a,e			;c2a0
	sbc a,e			;c2a1
	sbc a,e			;c2a2
	sbc a,e			;c2a3
	sbc a,e			;c2a4
	sbc a,e			;c2a5
	sbc a,e			;c2a6
	sbc a,e			;c2a7
	add a,e			;c2a8
	ex (sp),hl		;c2a9
	ei			;c2aa
	ld a,a			;c2ab
	sbc a,a			;c2ac
	rst 0			;c2ad
	exx			;c2ae
	sub 0d6h		;c2af
	sub 0d4h		;c2b1
	ret z			;c2b3
	ret p			;c2b4
	nop			;c2b5
	ret nc			;c2b6
	ret pe			;c2b7
	ret nc			;c2b8
	nop			;c2b9
	ret nc			;c2ba
	ret nc			;c2bb
	ret nc			;c2bc
	ret nc			;c2bd
	ret nc			;c2be
	ret nc			;c2bf
	ret nc			;c2c0
	ret nc			;c2c1
	ret nc			;c2c2
	ret nc			;c2c3
	ret nc			;c2c4
	ret nc			;c2c5
	ret nc			;c2c6
	ret nc			;c2c7
	rst 38h			;c2c8
	nop			;c2c9
	scf			;c2ca
	scf			;c2cb
	scf			;c2cc
	scf			;c2cd
	scf			;c2ce
	scf			;c2cf
	scf			;c2d0
	scf			;c2d1
	scf			;c2d2
	scf			;c2d3
	scf			;c2d4
	scf			;c2d5
	scf			;c2d6
	scf			;c2d7
	scf			;c2d8
	scf			;c2d9
	scf			;c2da
	rla			;c2db
	add a,a			;c2dc
	rst 20h			;c2dd
	rst 38h			;c2de
	ld a,a			;c2df
	cp a			;c2e0
	rst 18h			;c2e1
	rst 28h			;c2e2
	rst 10h			;c2e3
	ex de,hl		;c2e4
	push af			;c2e5
	call pe,sub_fd7ah	;c2e6
	cp 07dh			;c2e9
	ccf			;c2eb
	nop			;c2ec
	ccf			;c2ed
	ccf			;c2ee
	rra			;c2ef
	nop			;c2f0
	ccf			;c2f1
	ld l,a			;c2f2
	ld e,a			;c2f3
	cpl			;c2f4
	ld e,a			;c2f5
	ccf			;c2f6
	ld e,a			;c2f7
	jp m,lfafah		;c2f8
	jp m,lfafah		;c2fb
	cp 0feh			;c2fe
	jp m,lfafeh		;c300
	jp m,lfefah		;c303
	cp 0fah			;c306
	inc bc			;c308
	inc bc			;c309
	inc bc			;c30a
	inc bc			;c30b
	inc bc			;c30c
	inc bc			;c30d
	inc bc			;c30e
	inc bc			;c30f
	inc bc			;c310
	inc bc			;c311
	inc bc			;c312
	inc bc			;c313
	inc bc			;c314
	inc bc			;c315
	inc bc			;c316
	inc bc			;c317
lc318h:
	and b			;c318
	and b			;c319
	and b			;c31a
	and b			;c31b
	and b			;c31c
	and b			;c31d
	and b			;c31e
sub_c31fh:
	and b			;c31f
	and b			;c320
	and b			;c321
	and b			;c322
	and b			;c323
	and b			;c324
	and b			;c325
	and b			;c326
	and b			;c327
	ld bc,00101h		;c328
	ld bc,00101h		;c32b
	ld bc,00101h		;c32e
	ld bc,00101h		;c331
	ld bc,00101h		;c334
	ld bc,ld0d0h		;c337
	ret nc			;c33a
	ret nc			;c33b
	ret nc			;c33c
	ret nc			;c33d
	ret nc			;c33e
	ret nc			;c33f
	ret nc			;c340
	ret nc			;c341
	ret nc			;c342
	ret nc			;c343
lc344h:
	ret nc			;c344
lc345h:
	ret nc			;c345
	ret nc			;c346
	ret nc			;c347
	ccf			;c348
	ld e,a			;c349
	ccf			;c34a
	ld e,a			;c34b
	ccf			;c34c
	ld e,a			;c34d
	ccf			;c34e
	ld e,a			;c34f
	ccf			;c350
	ld e,a			;c351
	ccf			;c352
	ld e,a			;c353
	ccf			;c354
	ld e,a			;c355
	ccf			;c356
	ld e,a			;c357
	rst 8			;c358
	rlca			;c359
	ld (01d78h),a		;c35a
	ret nz			;c35d
	or b			;c35e
	ex (sp),hl		;c35f
	rst 8			;c360
	sbc a,a			;c361
	rrca			;c362
	rst 20h			;c363
	ld d,c			;c364
	call pe,sub_ecfah	;c365
	pop af			;c368
	call po,03f8eh		;c369
	rra			;c36c
	rst 8			;c36d
	and a			;c36e
	out (0e9h),a		;c36f
	ret m			;c371
	ret nc			;c372
	ex (sp),hl		;c373
	rst 0			;c374
	sbc a,a			;c375
	ccf			;c376
	ld a,a			;c377
	ld a,a			;c378
	ccf			;c379
	rra			;c37a
	rrca			;c37b
	rst 20h			;c37c
	ld d,c			;c37d
	call pe,sub_fad7h	;c37e
	rst 38h			;c381
	cp 0ffh			;c382
	rst 38h			;c384
	rst 38h			;c385
	rst 38h			;c386
	rst 38h			;c387
	daa			;c388
	add a,e			;c389
lc38ah:
	jr c,lc38ah		;c38a
	call m,00371h		;c38c
	pop hl			;c38f
	ld e,h			;c390
	jp pe,lf0fch		;c391
	rst 0			;c394
	rra			;c395
	ld a,a			;c396
	rst 38h			;c397
	rst 38h			;c398
	rst 38h			;c399
	ld a,a			;c39a
	rra			;c39b
	rst 0			;c39c
	pop hl			;c39d
	ret m			;c39e
	ret p			;c39f
	jp lff1fh		;c3a0
	rst 38h			;c3a3
	rst 38h			;c3a4
	rst 38h			;c3a5
	rst 38h			;c3a6
	rst 38h			;c3a7
	rst 38h			;c3a8
	rst 38h			;c3a9
	rst 38h			;c3aa
	rst 38h			;c3ab
	rst 38h			;c3ac
	rst 38h			;c3ad
	ld a,a			;c3ae
	rra			;c3af
	add a,a			;c3b0
	ld h,c			;c3b1
	cp b			;c3b2
	call nc,sub_feeah	;c3b3
	push af			;c3b6
	ei			;c3b7
	call po,01cc1h		;c3b8
	ld a,a			;c3bb
	ccf			;c3bc
	adc a,(hl)		;c3bd
	ret nz			;c3be
	add a,a			;c3bf
	ld a,07fh		;c3c0
	ccf			;c3c2
lc3c3h:
	rrca			;c3c3
	ex (sp),hl		;c3c4
	ret c			;c3c5
	or 0fdh			;c3c6
	cp 0fdh			;c3c8
	cp 0f8h			;c3ca
	ex (sp),hl		;c3cc
	add a,a			;c3cd
	rra			;c3ce
	rrca			;c3cf
	jp laf78h		;c3d0
	push af			;c3d3
	cp 0ffh			;c3d4
	rst 38h			;c3d6
	rst 38h			;c3d7
	rst 38h			;c3d8
	rst 38h			;c3d9
	rst 38h			;c3da
	rst 38h			;c3db
	rst 38h			;c3dc
	rst 38h			;c3dd
	cp 0f8h			;c3de
	pop hl			;c3e0
lc3e1h:
	add a,a			;c3e1
	rra			;c3e2
	ccf			;c3e3
	ld a,a			;c3e4
	ld a,a			;c3e5
	rst 38h			;c3e6
	rst 38h			;c3e7
	di			;c3e8
	ret po			;c3e9
	ld c,h			;c3ea
	ld e,0b8h		;c3eb
	inc bc			;c3ed
	rrca			;c3ee
	rst 0			;c3ef
	or e			;c3f0
	jp (hl)			;c3f1
	ret nc			;c3f2
	rst 20h			;c3f3
	adc a,a			;c3f4
	ccf			;c3f5
	ld a,a			;c3f6
	ccf			;c3f7
	adc a,a			;c3f8
lc3f9h:
	daa			;c3f9
	ld d,c			;c3fa
	call pe,sub_d3f8h	;c3fb
	rst 20h			;c3fe
lc3ffh:
	rst 8			;c3ff
	sbc a,a			;c400
	rra			;c401
	rrca			;c402
	rst 0			;c403
	and e			;c404
	exx			;c405
	call p,sub_f6eah	;c406
	call m,sub_f0e8h	;c409
	rst 20h			;c40c
	adc a,a			;c40d
	ccf			;c40e
	rst 38h			;c40f
	rst 38h			;c410
	rst 38h			;c411
	rst 38h			;c412
	rst 38h			;c413
	rst 38h			;c414
	rst 38h			;c415
	rst 38h			;c416
	rst 38h			;c417
	rst 38h			;c418
	rst 38h			;c419
	rst 38h			;c41a
	adc a,a			;c41b
	inc h			;c41c
	ld d,c			;c41d
	xor d			;c41e
	ld d,l			;c41f
	pop af			;c420
	push af			;c421
	pop af			;c422
	push hl			;c423
	ld c,c			;c424
	inc d			;c425
	xor d			;c426
	ld d,l			;c427
	rst 38h			;c428
	adc a,a			;c429
	xor a			;c42a
	adc a,a			;c42b
	daa			;c42c
	ld d,e			;c42d
	xor b			;c42e
	ld d,l			;c42f
	rst 38h			;c430
	rst 38h			;c431
	call m,sub_ac8dh	;c432
	add a,c			;c435
	ld hl,(lff55h)		;c436
	rst 38h			;c439
	rst 38h			;c43a
	rst 38h			;c43b
	cp 0f8h			;c43c
	di			;c43e
	push hl			;c43f
	jp pe,ldacdh		;c440
	push de			;c443
	jp c,ld8d5h		;c444
	pop de			;c447
	in a,(0d1h)		;c448
	ret c			;c44a
	push de			;c44b
	jp c,ldad5h		;c44c
	push de			;c44f
	jp c,ldad5h		;c450
	push de			;c453
	jp c,ld8d5h		;c454
	pop de			;c457
	in a,(0d1h)		;c458
	ret c			;c45a
	push de			;c45b
	jp c,ldad5h		;c45c
	call nc,sub_d6d9h	;c45f
	defb 0ddh,0dfh,0c0h ;illegal sequence	;c462
	rst 38h			;c465
	rst 38h			;c466
	rst 38h			;c467
	rst 38h			;c468
	rst 38h			;c469
	rst 38h			;c46a
	add a,b			;c46b
	ccf			;c46c
	rst 10h			;c46d
	xor h			;c46e
	ld d,b			;c46f
	and b			;c470
	ld h,b			;c471
	ret nz			;c472
	ld b,b			;c473
	ret nz			;c474
	ld b,b			;c475
	nop			;c476
	rst 38h			;c477
	rst 38h			;c478
	rst 38h			;c479
	nop			;c47a
	ld b,b			;c47b
	ret nz			;c47c
	ld b,b			;c47d
	ret nz			;c47e
	ld b,b			;c47f
	ret nz			;c480
	ld b,b			;c481
	ret nz			;c482
	ld b,b			;c483
lc484h:
	ret nz			;c484
	ld b,b			;c485
	nop			;c486
	rst 38h			;c487
	rst 38h			;c488
	rst 38h			;c489
	nop			;c48a
	ld b,b			;c48b
	ret nz			;c48c
	ld b,b			;c48d
	ld a,(hl)		;c48e
	jp pe,laa54h		;c48f
	ld d,l			;c492
	rst 38h			;c493
	nop			;c494
	rst 38h			;c495
	rst 38h			;c496
	rst 38h			;c497
	rst 38h			;c498
	rst 38h			;c499
	rst 38h			;c49a
	nop			;c49b
	push af			;c49c
	ld e,0e1h		;c49d
	ret po			;c49f
	ret po			;c4a0
	ret po			;c4a1
	ret po			;c4a2
	ret po			;c4a3
	ret po			;c4a4
	ret po			;c4a5
	ret nz			;c4a6
	ccf			;c4a7
	rst 38h			;c4a8
	rst 38h			;c4a9
	nop			;c4aa
	ret po			;c4ab
	ret po			;c4ac
	ret po			;c4ad
	ret po			;c4ae
	ret po			;c4af
	ret po			;c4b0
	ret po			;c4b1
	ret po			;c4b2
	ret po			;c4b3
	ret po			;c4b4
	ret po			;c4b5
	ret nz			;c4b6
	ccf			;c4b7
	rst 38h			;c4b8
	rst 38h			;c4b9
	nop			;c4ba
	ret po			;c4bb
	ret po			;c4bc
	ret po			;c4bd
	rst 28h			;c4be
	jp pe,00ac5h		;c4bf
	ld d,l			;c4c2
	rst 38h			;c4c3
	nop			;c4c4
	rst 38h			;c4c5
	rst 38h			;c4c6
	rst 38h			;c4c7
	rst 38h			;c4c8
	rst 38h			;c4c9
	rst 38h			;c4ca
	ld a,a			;c4cb
	ccf			;c4cc
	sbc a,a			;c4cd
	rst 8			;c4ce
	ld h,a			;c4cf
	ld d,a			;c4d0
	daa			;c4d1
	inc sp			;c4d2
	dec hl			;c4d3
	inc hl			;c4d4
	dec hl			;c4d5
	inc sp			;c4d6
	ex de,hl		;c4d7
	ex (sp),hl		;c4d8
	ex de,hl		;c4d9
	inc sp			;c4da
	dec hl			;c4db
	inc sp			;c4dc
	daa			;c4dd
	inc sp			;c4de
	dec hl			;c4df
	inc sp			;c4e0
	dec hl			;c4e1
	inc sp			;c4e2
	daa			;c4e3
	cpl			;c4e4
	daa			;c4e5
	inc sp			;c4e6
	ex de,hl		;c4e7
	di			;c4e8
	ex de,hl		;c4e9
	inc hl			;c4ea
	dec hl			;c4eb
	inc sp			;c4ec
	daa			;c4ed
	rst 30h			;c4ee
	and a			;c4ef
	ld h,a			;c4f0
	or e			;c4f1
	ld l,e			;c4f2
	di			;c4f3
	rlca			;c4f4
	rst 38h			;c4f5
	rst 38h			;c4f6
	rst 38h			;c4f7
	rst 38h			;c4f8
	rst 38h			;c4f9
	rst 38h			;c4fa
	rst 38h			;c4fb
lc4fch:
	rst 38h			;c4fc
	rst 38h			;c4fd
	ret nz			;c4fe
	sub a			;c4ff
	cpl			;c500
	ld e,(hl)		;c501
	ld l,a			;c502
	ld d,a			;c503
	ld h,a			;c504
	scf			;c505
	and a			;c506
	or a			;c507
	xor a			;c508
	sub a			;c509
	rst 18h			;c50a
	call nc,sub_d5dbh	;c50b
	exx			;c50e
	call sub_edebh		;c50f
	ex de,hl		;c512
	defb 0edh ;next byte illegal after ed	;c513
	ex de,hl		;c514
	defb 0edh ;next byte illegal after ed	;c515
	ret			;c516
	push de			;c517
	exx			;c518
	push de			;c519
	exx			;c51a
	call 0f8e2h		;c51b
	rst 38h			;c51e
	rst 38h			;c51f
	rst 38h			;c520
	rst 38h			;c521
	rst 38h			;c522
	rst 38h			;c523
	cp 080h			;c524
	ccf			;c526
	rst 38h			;c527
	rst 38h			;c528
	rst 38h			;c529
	rst 38h			;c52a
	rst 38h			;c52b
	rst 38h			;c52c
	rst 38h			;c52d
	rst 38h			;c52e
	rst 38h			;c52f
	rst 38h			;c530
	ret p			;c531
	adc a,a			;c532
	ld h,b			;c533
	adc a,09fh		;c534
	cp a			;c536
	cp a			;c537
	cp a			;c538
	ccf			;c539
	dec hl			;c53a
	ld d,a			;c53b
	ld d,a			;c53c
	ld d,(hl)		;c53d
	ld d,(hl)		;c53e
	ld d,(hl)		;c53f
	ld d,(hl)		;c540
	inc de			;c541
	set 5,e			;c542
	pop bc			;c544
	inc e			;c545
	rst 38h			;c546
	rst 38h			;c547
	rst 38h			;c548
	rst 38h			;c549
	ret m			;c54a
	jp lff1fh		;c54b
	rst 38h			;c54e
	rst 38h			;c54f
	call m,sub_f7fbh	;c550
	rst 28h			;c553
	rst 28h			;c554
	rst 28h			;c555
	ld l,a			;c556
	rst 28h			;c557
	adc a,a			;c558
	ld h,a			;c559
	rst 30h			;c55a
	rst 30h			;c55b
	ld (hl),e		;c55c
	ld a,c			;c55d
	jr c,lc4fch		;c55e
	rst 18h			;c560
	rst 8			;c561
	rst 28h			;c562
	ld h,a			;c563
	ld (hl),a		;c564
	inc sp			;c565
	sbc a,e			;c566
	in a,(049h)		;c567
	ld h,b			;c569
	ld l,a			;c56a
	rrca			;c56b
	ld a,a			;c56c
	ld a,a			;c56d
	rst 38h			;c56e
	rst 38h			;c56f
	rst 38h			;c570
	ret p			;c571
	rlca			;c572
	rst 38h			;c573
	cp 0ffh			;c574
	rst 38h			;c576
	call m,08711h		;c577
	ld l,a			;c57a
	rst 28h			;c57b
	rst 18h			;c57c
	rst 18h			;c57d
	cp a			;c57e
	cp a			;c57f
	cp a			;c580
	exx			;c581
	or d			;c582
	and a			;c583
	ld d,d			;c584
	ld b,c			;c585
	ld e,b			;c586
	ld d,b			;c587
	ld l,0ach		;c588
	sub e			;c58a
	defb 0ddh,0c1h,0fch ;illegal sequence	;c58b
	cp h			;c58e
	pop af			;c58f
	add a,l			;c590
	inc a			;c591
	rst 38h			;c592
	call m,sub_fcfdh	;c593
lc596h:
	rst 38h			;c596
	rst 38h			;c597
lc598h:
	ret po			;c598
	rrca			;c599
lc59ah:
	rst 38h			;c59a
	rst 38h			;c59b
	rst 38h			;c59c
	rst 38h			;c59d
	add a,c			;c59e
	inc a			;c59f
lc5a0h:
	in a,(0feh)		;c5a0
lc5a2h:
	rst 38h			;c5a2
	rst 38h			;c5a3
lc5a4h:
	and 0c7h		;c5a4
lc5a6h:
	sbc a,e			;c5a6
	sbc a,e			;c5a7
lc5a8h:
	add a,a			;c5a8
	rst 28h			;c5a9
lc5aah:
	defb 0fdh,07ah,0b8h ;illegal sequence	;c5aa
	exx			;c5ad
	xor l			;c5ae
	ld l,(hl)		;c5af
	inc d			;c5b0
	jp (hl)			;c5b1
	xor e			;c5b2
	dec hl			;c5b3
	dec hl			;c5b4
	ld hl,(0690bh)		;c5b5
	ld l,b			;c5b8
	ld l,e			;c5b9
	ex (sp),hl		;c5ba
	ld l,e			;c5bb
	ld h,e			;c5bc
	ld a,a			;c5bd
	rst 38h			;c5be
	rst 38h			;c5bf
	ccf			;c5c0
	sbc a,a			;c5c1
	rst 8			;c5c2
	rst 28h			;c5c3
	rst 28h			;c5c4
	rst 28h			;c5c5
	rst 28h			;c5c6
	ld h,a			;c5c7
	scf			;c5c8
	sub a			;c5c9
	out (0cbh),a		;c5ca
	ex de,hl		;c5cc
	xor e			;c5cd
	ex de,hl		;c5ce
	ld l,e			;c5cf
	ex de,hl		;c5d0
	set 3,c			;c5d1
	sbc a,l			;c5d3
lc5d4h:
	cp l			;c5d4
	dec b			;c5d5
	ld (hl),c		;c5d6
	ld e,c			;c5d7
	exx			;c5d8
	defb 0ddh,06ch ;ld ixl,ixh	;c5d9
	ld l,(hl)		;c5db
	halt			;c5dc
	ld (hl),036h		;c5dd
	inc l			;c5df
	ld l,l			;c5e0
	ld l,l			;c5e1
	ld c,c			;c5e2
	inc bc			;c5e3
	rst 38h			;c5e4
	rst 38h			;c5e5
	rst 38h			;c5e6
	rst 38h			;c5e7
	nop			;c5e8
	rst 38h			;c5e9
	nop			;c5ea
	sbc a,000h		;c5eb
	adc a,h			;c5ed
	nop			;c5ee
	sbc a,000h		;c5ef
	rst 38h			;c5f1
	nop			;c5f2
	nop			;c5f3
	nop			;c5f4
	ld e,a			;c5f5
	nop			;c5f6
	cpl			;c5f7
	nop			;c5f8
	ld e,a			;c5f9
	nop			;c5fa
	xor a			;c5fb
	nop			;c5fc
	or a			;c5fd
	nop			;c5fe
	ld e,e			;c5ff
	nop			;c600
	ld h,a			;c601
	nop			;c602
	ld l,e			;c603
	add a,b			;c604
	dec (hl)		;c605
	add a,b			;c606
	ld (03980h),a		;c607
	jp nz,lc318h		;c60a
	jr $-59			;c60d
	jr lc5d4h		;c60f
	jr lc596h		;c611
	jr c,lc598h		;c613
	jr c,lc59ah		;c615
	jr c,lc5a0h		;c617
	jr nc,lc5a2h		;c619
	jr nc,lc5a4h		;c61b
	jr nc,lc5a6h		;c61d
	jr nc,lc5a8h		;c61f
	jr nc,lc5aah		;c621
	jr nc,lc62ch		;c623
	ld (hl),b		;c625
	rlca			;c626
	ld (hl),b		;c627
	rrca			;c628
	ld h,b			;c629
	rrca			;c62a
	ld h,b			;c62b
lc62ch:
	rrca			;c62c
	ld h,b			;c62d
	rrca			;c62e
	ret po			;c62f
	rrca			;c630
	ret po			;c631
	rrca			;c632
	ret po			;c633
	rrca			;c634
	ret po			;c635
	rra			;c636
	ret nz			;c637
	nop			;c638
	rst 38h			;c639
	nop			;c63a
	rst 30h			;c63b
	nop			;c63c
	ld h,e			;c63d
	nop			;c63e
	rst 30h			;c63f
lc640h:
	nop			;c640
	rst 38h			;c641
	nop			;c642
	nop			;c643
	nop			;c644
	jp pe,sub_fd00h		;c645
	nop			;c648
	rst 38h			;c649
	nop			;c64a
	rst 38h			;c64b
	nop			;c64c
	rst 38h			;c64d
	nop			;c64e
	rst 38h			;c64f
	nop			;c650
	rst 38h			;c651
	nop			;c652
	rst 38h			;c653
	nop			;c654
	rst 38h			;c655
	nop			;c656
	rst 38h			;c657
	nop			;c658
	rst 38h			;c659
	nop			;c65a
	xor a			;c65b
	nop			;c65c
	ld d,a			;c65d
	add a,b			;c65e
	dec sp			;c65f
	ret nz			;c660
	dec c			;c661
	ret p			;c662
	inc bc			;c663
	call m,sub_fe01h	;c664
	nop			;c667
	rst 38h			;c668
	nop			;c669
	rst 38h			;c66a
	nop			;c66b
	rst 38h			;c66c
	nop			;c66d
	rst 38h			;c66e
	nop			;c66f
	rst 38h			;c670
	nop			;c671
	rst 38h			;c672
	nop			;c673
	rst 38h			;c674
	nop			;c675
	rst 38h			;c676
	nop			;c677
	rst 38h			;c678
	nop			;c679
	rst 38h			;c67a
	nop			;c67b
	rst 38h			;c67c
	nop			;c67d
	rst 38h			;c67e
	nop			;c67f
	rst 38h			;c680
	nop			;c681
	rst 38h			;c682
	nop			;c683
	rst 38h			;c684
	nop			;c685
	rst 38h			;c686
	nop			;c687
	nop			;c688
	rst 38h			;c689
	nop			;c68a
	cp e			;c68b
	nop			;c68c
	ld de,lbb00h		;c68d
	nop			;c690
	rst 38h			;c691
	nop			;c692
	nop			;c693
	nop			;c694
	xor d			;c695
	nop			;c696
	ld d,l			;c697
	nop			;c698
	xor d			;c699
	nop			;c69a
	push de			;c69b
	nop			;c69c
	jp (hl)			;c69d
	nop			;c69e
	out (000h),a		;c69f
	ex de,hl		;c6a1
	nop			;c6a2
	push af			;c6a3
	nop			;c6a4
	ld sp,hl		;c6a5
	nop			;c6a6
	push af			;c6a7
	nop			;c6a8
	defb 0fdh,000h,0fbh ;illegal sequence	;c6a9
	nop			;c6ac
	ei			;c6ad
	nop			;c6ae
	ei			;c6af
	nop			;c6b0
	ei			;c6b1
	nop			;c6b2
	ei			;c6b3
	nop			;c6b4
	ei			;c6b5
	nop			;c6b6
	dec de			;c6b7
	ret po			;c6b8
	rlca			;c6b9
	ret p			;c6ba
	rlca			;c6bb
	ret p			;c6bc
	rlca			;c6bd
	ret p			;c6be
	rlca			;c6bf
	ret p			;c6c0
	rlca			;c6c1
	ret p			;c6c2
	rlca			;c6c3
	ret p			;c6c4
	rlca			;c6c5
	ret p			;c6c6
	rlca			;c6c7
lc6c8h:
	ret p			;c6c8
	rlca			;c6c9
	ret po			;c6ca
	rrca			;c6cb
	ret po			;c6cc
	rrca			;c6cd
	ret po			;c6ce
	rrca			;c6cf
	ret nz			;c6d0
	rra			;c6d1
	ret nz			;c6d2
	rra			;c6d3
	jp lc71ch		;c6d4
	jr lc6d9h		;c6d7
lc6d9h:
	rst 38h			;c6d9
	nop			;c6da
	defb 0ddh,000h,088h ;illegal sequence	;c6db
	nop			;c6de
	defb 0ddh,000h,0ffh ;illegal sequence	;c6df
	nop			;c6e2
	nop			;c6e3
	nop			;c6e4
	ld c,a			;c6e5
	nop			;c6e6
	xor a			;c6e7
	nop			;c6e8
	ld e,a			;c6e9
	nop			;c6ea
	cp a			;c6eb
	nop			;c6ec
	cp a			;c6ed
	nop			;c6ee
	rst 18h			;c6ef
	nop			;c6f0
	rst 18h			;c6f1
	nop			;c6f2
	cp a			;c6f3
	nop			;c6f4
	cp a			;c6f5
	nop			;c6f6
	cp a			;c6f7
lc6f8h:
	nop			;c6f8
	cp a			;c6f9
	nop			;c6fa
	rst 18h			;c6fb
sub_c6fch:
	nop			;c6fc
	rst 18h			;c6fd
sub_c6feh:
	nop			;c6fe
	rst 18h			;c6ff
	nop			;c700
	rst 18h			;c701
	nop			;c702
	rst 18h			;c703
	nop			;c704
	rst 18h			;c705
	nop			;c706
	ret c			;c707
	rlca			;c708
	ret po			;c709
	rrca			;c70a
	ret po			;c70b
	rrca			;c70c
	ret po			;c70d
	rrca			;c70e
	ret po			;c70f
	rrca			;c710
	ret po			;c711
	rrca			;c712
	ret po			;c713
	rrca			;c714
	ret po			;c715
	rrca			;c716
	ret po			;c717
	rrca			;c718
	ret po			;c719
	rlca			;c71a
	ret p			;c71b
lc71ch:
	rlca			;c71c
	ret p			;c71d
	rlca			;c71e
	ret p			;c71f
	inc bc			;c720
	ret m			;c721
	inc bc			;c722
	ret m			;c723
	jp le338h		;c724
	jr lc729h		;c727
lc729h:
	rst 38h			;c729
	nop			;c72a
	rst 28h			;c72b
	nop			;c72c
	add a,000h		;c72d
	rst 28h			;c72f
	nop			;c730
	rst 38h			;c731
	nop			;c732
	nop			;c733
	nop			;c734
	xor d			;c735
	nop			;c736
	push af			;c737
	nop			;c738
	cp 000h			;c739
	rst 38h			;c73b
	nop			;c73c
	rst 38h			;c73d
	nop			;c73e
	rst 38h			;c73f
	nop			;c740
	rst 38h			;c741
	nop			;c742
	rst 38h			;c743
	nop			;c744
	rst 38h			;c745
	nop			;c746
	rst 38h			;c747
	nop			;c748
	rst 38h			;c749
	nop			;c74a
	push af			;c74b
	nop			;c74c
	jp pe,ldc01h		;c74d
	inc bc			;c750
	or b			;c751
	rrca			;c752
	ret nz			;c753
	ccf			;c754
	add a,b			;c755
	ld a,a			;c756
	nop			;c757
	rst 38h			;c758
	nop			;c759
	rst 38h			;c75a
	nop			;c75b
	rst 38h			;c75c
	nop			;c75d
	rst 38h			;c75e
	nop			;c75f
lc760h:
	rst 38h			;c760
	nop			;c761
lc762h:
	rst 38h			;c762
	nop			;c763
lc764h:
	rst 38h			;c764
	nop			;c765
	rst 38h			;c766
	nop			;c767
	rst 38h			;c768
	nop			;c769
	rst 38h			;c76a
	nop			;c76b
	rst 38h			;c76c
	nop			;c76d
	rst 38h			;c76e
	nop			;c76f
	rst 38h			;c770
	nop			;c771
	rst 38h			;c772
	nop			;c773
	rst 38h			;c774
	nop			;c775
	rst 38h			;c776
	nop			;c777
	nop			;c778
	rst 38h			;c779
	nop			;c77a
	ld a,e			;c77b
	nop			;c77c
	ld sp,l7b00h		;c77d
	nop			;c780
	rst 38h			;c781
	nop			;c782
	nop			;c783
	nop			;c784
	xor d			;c785
	nop			;c786
	ld d,h			;c787
	nop			;c788
	xor d			;c789
	nop			;c78a
	push de			;c78b
	nop			;c78c
	xor l			;c78d
	nop			;c78e
	jp c,la600h		;c78f
	nop			;c792
	sub 001h		;c793
	xor h			;c795
	ld bc,0014ch		;c796
	sbc a,h			;c799
	ld b,e			;c79a
	jr lc760h		;c79b
	jr lc762h		;c79d
	jr lc764h		;c79f
	jr lc764h		;c7a1
	inc e			;c7a3
	pop bc			;c7a4
	inc e			;c7a5
	pop bc			;c7a6
	inc e			;c7a7
	pop hl			;c7a8
	inc c			;c7a9
	pop hl			;c7aa
	inc c			;c7ab
	pop hl			;c7ac
	inc c			;c7ad
	pop hl			;c7ae
	inc c			;c7af
	pop hl			;c7b0
	inc c			;c7b1
	pop hl			;c7b2
	inc c			;c7b3
	ret po			;c7b4
	ld c,0e0h		;c7b5
	ld c,0f0h		;c7b7
	ld b,0f0h		;c7b9
	ld b,0f0h		;c7bb
	ld b,0f0h		;c7bd
	rlca			;c7bf
	ret p			;c7c0
	rlca			;c7c1
	ret p			;c7c2
	rlca			;c7c3
	ret p			;c7c4
	rlca			;c7c5
	ret m			;c7c6
	inc bc			;c7c7
	nop			;c7c8
	nop			;c7c9
	nop			;c7ca
	nop			;c7cb
	nop			;c7cc
	nop			;c7cd
	rst 0			;c7ce
	xor a			;c7cf
	ex (sp),hl		;c7d0
	sbc a,h			;c7d1
	ret c			;c7d2
	di			;c7d3
	rst 20h			;c7d4
	xor 0c8h		;c7d5
	inc de			;c7d7
	rst 0			;c7d8
	or c			;c7d9
	call z,sub_fcf2h	;c7da
	pop af			;c7dd
	rlca			;c7de
	rst 0			;c7df
	inc sp			;c7e0
	ret			;c7e1
	jp (hl)			;c7e2
	call m,sub_f9fch	;c7e3
	ei			;c7e6
	ei			;c7e7
	nop			;c7e8
	nop			;c7e9
	nop			;c7ea
	nop			;c7eb
	nop			;c7ec
	nop			;c7ed
	sbc a,l			;c7ee
	ld a,(hl)		;c7ef
	add hl,bc		;c7f0
	ld h,e			;c7f1
	ret m			;c7f2
	add a,(hl)		;c7f3
	jp m,lc11ch		;c7f4
	cp c			;c7f7
	call sub_f9f4h		;c7f8
	di			;c7fb
	inc bc			;c7fc
	ld sp,hl		;c7fd
	sub h			;c7fe
	jp m,lfef6h		;c7ff
	add a,b			;c802
	ccf			;c803
	ld a,l			;c804
	rst 38h			;c805
	rst 38h			;c806
	rst 38h			;c807
	nop			;c808
	nop			;c809
	nop			;c80a
	nop			;c80b
	nop			;c80c
	nop			;c80d
	inc hl			;c80e
	ld a,a			;c80f
	rst 20h			;c810
	sub d			;c811
	ret pe			;c812
	nop			;c813
	ld a,0e1h		;c814
	rst 38h			;c816
	ret p			;c817
	rst 20h			;c818
	rrca			;c819
	rst 20h			;c81a
	or e			;c81b
	in a,(0f8h)		;c81c
	pop hl			;c81e
sub_c81fh:
	rrca			;c81f
	ld a,(00fffh)		;c820
	rst 20h			;c823
	inc de			;c824
	jp (hl)			;c825
	call nc,000fch		;c826
	nop			;c829
	nop			;c82a
	nop			;c82b
	nop			;c82c
	inc c			;c82d
	sbc a,a			;c82e
	rst 18h			;c82f
	inc c			;c830
	ld (hl),c		;c831
	in a,(0ebh)		;c832
	ld b,b			;c834
	ld e,03dh		;c835
	ld b,0f2h		;c837
	exx			;c839
	ret pe			;c83a
	ex (sp),hl		;c83b
	adc a,01fh		;c83c
	rst 8			;c83e
	ld h,a			;c83f
	or e			;c840
	exx			;c841
	ret pe			;c842
	di			;c843
	rst 20h			;c844
	adc a,a			;c845
	ccf			;c846
	ld a,a			;c847
	nop			;c848
	nop			;c849
	nop			;c84a
	nop			;c84b
	nop			;c84c
	ld c,0bfh		;c84d
	ld d,l			;c84f
	ld c,0e0h		;c850
	add hl,sp		;c852
	defb 0ddh,0c0h,01eh ;illegal sequence	;c853
	scf			;c856
	cp a			;c857
	add a,b			;c858
	rra			;c859
	dec a			;c85a
	adc a,a			;c85b
	ld h,(hl)		;c85c
	ret nc			;c85d
	rst 20h			;c85e
	rst 28h			;c85f
	rst 28h			;c860
	nop			;c861
	ld a,(hl)		;c862
	ex de,hl		;c863
	defb 0fdh,0fdh,0feh ;illegal sequence	;c864
	rst 38h			;c867
	nop			;c868
	nop			;c869
	nop			;c86a
	nop			;c86b
	nop			;c86c
	nop			;c86d
	push af			;c86e
	jp z,lff3fh		;c86f
	add a,c			;c872
	inc a			;c873
	ld h,a			;c874
	ld a,c			;c875
	rra			;c876
	rst 8			;c877
	cpl			;c878
	adc a,b			;c879
	ld b,e			;c87a
	xor a			;c87b
	rrca			;c87c
	jp ledb9h		;c87d
	push af			;c880
	call m,04770h		;c881
	rra			;c884
	cp a			;c885
	cp a			;c886
	cp a			;c887
	nop			;c888
	nop			;c889
	nop			;c88a
	nop			;c88b
	nop			;c88c
	ld (hl),b		;c88d
	cp 079h			;c88e
	add a,a			;c890
	rst 8			;c891
	rst 18h			;c892
	ld d,b			;c893
	rlca			;c894
	sbc a,h			;c895
	inc sp			;c896
	ld l,a			;c897
	jr nc,lc8a1h		;c898
	adc a,027h		;c89a
	rst 10h			;c89c
	ret p			;c89d
	rst 0			;c89e
	sbc a,a			;c89f
	cp a			;c8a0
lc8a1h:
	rra			;c8a1
	rst 0			;c8a2
	or e			;c8a3
	ret			;c8a4
	call p,sub_fdf4h	;c8a5
	nop			;c8a8
	nop			;c8a9
	nop			;c8aa
	nop			;c8ab
	nop			;c8ac
	inc c			;c8ad
	cp a			;c8ae
	ld c,h			;c8af
	di			;c8b0
	ld h,(hl)		;c8b1
	defb 0edh ;next byte illegal after ed	;c8b2
	rrca			;c8b3
	rst 8			;c8b4
	scf			;c8b5
	ei			;c8b6
	ret m			;c8b7
	add hl,sp		;c8b8
	sbc a,e			;c8b9
	ld b,e			;c8ba
	and a			;c8bb
	di			;c8bc
	ret p			;c8bd
	inc bc			;c8be
	adc a,09fh		;c8bf
	cp a			;c8c1
	cp a			;c8c2
	ld a,0dfh		;c8c3
	rrca			;c8c5
	rst 18h			;c8c6
	cp a			;c8c7
	or c			;c8c8
	call z,sub_fcf2h	;c8c9
	pop af			;c8cc
	rlca			;c8cd
	rst 0			;c8ce
	inc sp			;c8cf
	ret			;c8d0
	jp (hl)			;c8d1
	call m,sub_f9fch	;c8d2
	ei			;c8d5
	ei			;c8d6
	rst 30h			;c8d7
	call p,sub_f3f9h	;c8d8
	inc bc			;c8db
	ld sp,hl		;c8dc
	sub h			;c8dd
	jp m,lfef6h		;c8de
	add a,b			;c8e1
	ccf			;c8e2
	ld a,l			;c8e3
	rst 38h			;c8e4
	rst 38h			;c8e5
	rst 38h			;c8e6
	rst 38h			;c8e7
	rrca			;c8e8
	rst 20h			;c8e9
	or e			;c8ea
	in a,(0f8h)		;c8eb
	pop hl			;c8ed
	rrca			;c8ee
	ld a,(00fffh)		;c8ef
	rst 20h			;c8f2
	inc de			;c8f3
	jp (hl)			;c8f4
	call nc,sub_fffch	;c8f5
	exx			;c8f8
	ret pe			;c8f9
	ex (sp),hl		;c8fa
	adc a,01fh		;c8fb
	rst 8			;c8fd
	ld h,a			;c8fe
	or e			;c8ff
	exx			;c900
	ret pe			;c901
	di			;c902
	rst 20h			;c903
	adc a,a			;c904
	ccf			;c905
	ld a,a			;c906
	ccf			;c907
	rra			;c908
	dec a			;c909
	adc a,a			;c90a
	ld h,(hl)		;c90b
	ret nc			;c90c
	rst 20h			;c90d
	rst 28h			;c90e
	rst 28h			;c90f
	nop			;c910
	ld a,(hl)		;c911
	ex de,hl		;c912
	defb 0fdh,0fdh,0feh ;illegal sequence	;c913
	rst 38h			;c916
	rst 38h			;c917
	adc a,b			;c918
	ld b,e			;c919
	xor a			;c91a
	rrca			;c91b
	jp ledb9h		;c91c
	push af			;c91f
	call m,04770h		;c920
	rra			;c923
	cp a			;c924
	cp a			;c925
	cp a			;c926
	ld a,a			;c927
	rlca			;c928
	adc a,027h		;c929
	rst 10h			;c92b
	ret p			;c92c
	rst 0			;c92d
	sbc a,a			;c92e
	cp a			;c92f
	rra			;c930
	rst 0			;c931
	or e			;c932
	ret			;c933
	call p,sub_fdf4h	;c934
	cp 09bh			;c937
	ld b,e			;c939
	and a			;c93a
	di			;c93b
	ret p			;c93c
	inc bc			;c93d
	adc a,09fh		;c93e
	cp a			;c940
	cp a			;c941
	ld a,0dfh		;c942
	rrca			;c944
	rst 18h			;c945
	cp a			;c946
	ld a,a			;c947
	nop			;c948
	nop			;c949
	nop			;c94a
	nop			;c94b
	nop			;c94c
	nop			;c94d
	nop			;c94e
	nop			;c94f
	nop			;c950
	nop			;c951
	nop			;c952
	nop			;c953
	nop			;c954
	nop			;c955
	nop			;c956
	nop			;c957
	inc a			;c958
	ld l,a			;c959
	sub 07bh		;c95a
	sbc a,(hl)		;c95c
	ld h,c			;c95d
	cp (hl)			;c95e
	pop bc			;c95f
	cp 0fdh			;c960
	cp 07dh			;c962
	ld a,(hl)		;c964
	ld a,l			;c965
	ld a,(hl)		;c966
	ld a,l			;c967
	ld a,(hl)		;c968
	ld a,a			;c969
	ld a,(hl)		;c96a
	ld a,a			;c96b
	ld a,(hl)		;c96c
	ld a,a			;c96d
	ld a,a			;c96e
	ld a,a			;c96f
	ld a,a			;c970
	ld a,a			;c971
	ld a,a			;c972
	ld a,a			;c973
	ld a,(hl)		;c974
	ld a,(hl)		;c975
	ld a,05eh		;c976
	nop			;c978
	nop			;c979
	nop			;c97a
	nop			;c97b
	nop			;c97c
	nop			;c97d
	nop			;c97e
	nop			;c97f
	nop			;c980
	nop			;c981
	nop			;c982
	nop			;c983
	nop			;c984
	nop			;c985
	nop			;c986
	nop			;c987
	nop			;c988
	nop			;c989
	add a,b			;c98a
	ret nz			;c98b
	add a,b			;c98c
	ld b,b			;c98d
	add a,b			;c98e
	add a,b			;c98f
	add a,b			;c990
	add a,b			;c991
	add a,b			;c992
	add a,b			;c993
	add a,b			;c994
	add a,b			;c995
	add a,b			;c996
	add a,b			;c997
	add a,b			;c998
	add a,b			;c999
	add a,b			;c99a
	add a,b			;c99b
	add a,b			;c99c
	add a,b			;c99d
	add a,b			;c99e
	add a,b			;c99f
	add a,l			;c9a0
	sbc a,d			;c9a1
	and l			;c9a2
	ld e,a			;c9a3
	cp a			;c9a4
	cp a			;c9a5
	rst 38h			;c9a6
	rst 38h			;c9a7
	nop			;c9a8
	nop			;c9a9
	nop			;c9aa
	nop			;c9ab
	nop			;c9ac
	nop			;c9ad
	nop			;c9ae
	nop			;c9af
	nop			;c9b0
	nop			;c9b1
	nop			;c9b2
	nop			;c9b3
	nop			;c9b4
	nop			;c9b5
	nop			;c9b6
	nop			;c9b7
	nop			;c9b8
	nop			;c9b9
	nop			;c9ba
	nop			;c9bb
	nop			;c9bc
	nop			;c9bd
	nop			;c9be
	nop			;c9bf
	nop			;c9c0
	nop			;c9c1
	nop			;c9c2
	nop			;c9c3
	nop			;c9c4
	nop			;c9c5
	nop			;c9c6
	nop			;c9c7
	nop			;c9c8
	nop			;c9c9
	nop			;c9ca
	nop			;c9cb
	nop			;c9cc
	ld bc,0000fh		;c9cd
	ld d,a			;c9d0
	cp a			;c9d1
	rst 38h			;c9d2
	rst 38h			;c9d3
	rst 38h			;c9d4
	rst 38h			;c9d5
	rst 38h			;c9d6
	rst 38h			;c9d7
	nop			;c9d8
	nop			;c9d9
	nop			;c9da
	nop			;c9db
	nop			;c9dc
	nop			;c9dd
	nop			;c9de
	nop			;c9df
	nop			;c9e0
	nop			;c9e1
	nop			;c9e2
	nop			;c9e3
	nop			;c9e4
	nop			;c9e5
	nop			;c9e6
	nop			;c9e7
	nop			;c9e8
	nop			;c9e9
	nop			;c9ea
	nop			;c9eb
	nop			;c9ec
	nop			;c9ed
	nop			;c9ee
	nop			;c9ef
	nop			;c9f0
	nop			;c9f1
	nop			;c9f2
	nop			;c9f3
	nop			;c9f4
	nop			;c9f5
	nop			;c9f6
	nop			;c9f7
	nop			;c9f8
	nop			;c9f9
	nop			;c9fa
	rrca			;c9fb
	ccf			;c9fc
	rst 38h			;c9fd
	rst 38h			;c9fe
	nop			;c9ff
	rst 38h			;ca00
	rst 38h			;ca01
	rst 38h			;ca02
	rst 38h			;ca03
	rst 38h			;ca04
	rst 38h			;ca05
	rst 38h			;ca06
	rst 38h			;ca07
	nop			;ca08
	nop			;ca09
	nop			;ca0a
	nop			;ca0b
	nop			;ca0c
	nop			;ca0d
	nop			;ca0e
	nop			;ca0f
	nop			;ca10
	nop			;ca11
	nop			;ca12
	nop			;ca13
	nop			;ca14
	nop			;ca15
	nop			;ca16
	nop			;ca17
	nop			;ca18
	nop			;ca19
	ld bc,00101h		;ca1a
	nop			;ca1d
	ld bc,00100h		;ca1e
	ld bc,00101h		;ca21
	ld bc,00000h		;ca24
	ld (bc),a		;ca27
	ld e,07eh		;ca28
	nop			;ca2a
	cp 0feh			;ca2b
	cp 0feh			;ca2d
	nop			;ca2f
	cp 0feh			;ca30
	cp 0feh			;ca32
	cp 0feh			;ca34
	rst 38h			;ca36
	rst 38h			;ca37
	nop			;ca38
	nop			;ca39
	nop			;ca3a
	nop			;ca3b
	nop			;ca3c
	nop			;ca3d
	nop			;ca3e
	nop			;ca3f
	nop			;ca40
	nop			;ca41
	nop			;ca42
	nop			;ca43
	nop			;ca44
	nop			;ca45
	nop			;ca46
	nop			;ca47
	inc a			;ca48
	ex de,hl		;ca49
	ld e,l			;ca4a
	cp 07dh			;ca4b
	add a,e			;ca4d
	cp 071h			;ca4e
	adc a,a			;ca50
	push af			;ca51
	ex de,hl		;ca52
	push de			;ca53
	ex de,hl		;ca54
	defb 0fdh,0fbh,0fdh ;illegal sequence	;ca55
	jp m,lfafeh		;ca58
	cp 0fah			;ca5b
	cp 0fah			;ca5d
	cp 0feh			;ca5f
	cp 0feh			;ca61
	cp 0feh			;ca63
	ld a,(hl)		;ca65
	ld a,(hl)		;ca66
	or l			;ca67
	nop			;ca68
	nop			;ca69
	nop			;ca6a
	nop			;ca6b
	nop			;ca6c
	nop			;ca6d
	nop			;ca6e
	nop			;ca6f
	nop			;ca70
	nop			;ca71
	nop			;ca72
	nop			;ca73
	nop			;ca74
	nop			;ca75
	nop			;ca76
	nop			;ca77
	nop			;ca78
	nop			;ca79
	nop			;ca7a
	nop			;ca7b
	nop			;ca7c
	nop			;ca7d
	nop			;ca7e
	nop			;ca7f
	inc bc			;ca80
	inc c			;ca81
	ld a,a			;ca82
	nop			;ca83
	ld a,a			;ca84
	nop			;ca85
	ld a,a			;ca86
	nop			;ca87
	ld a,a			;ca88
	rst 38h			;ca89
	nop			;ca8a
	rst 38h			;ca8b
	rst 38h			;ca8c
	rst 38h			;ca8d
	rst 38h			;ca8e
	inc bc			;ca8f
	ret m			;ca90
	cp 0e1h			;ca91
	rst 18h			;ca93
	cp l			;ca94
	cp l			;ca95
	xor d			;ca96
	inc a			;ca97
	nop			;ca98
	nop			;ca99
	nop			;ca9a
	nop			;ca9b
	nop			;ca9c
	nop			;ca9d
	nop			;ca9e
	nop			;ca9f
	nop			;caa0
	nop			;caa1
	nop			;caa2
	nop			;caa3
	nop			;caa4
	nop			;caa5
	nop			;caa6
	nop			;caa7
	nop			;caa8
	nop			;caa9
	nop			;caaa
	nop			;caab
	nop			;caac
	rlca			;caad
	dec e			;caae
	ld h,b			;caaf
	rst 38h			;cab0
	nop			;cab1
	rst 38h			;cab2
	nop			;cab3
	rst 38h			;cab4
	nop			;cab5
	rst 38h			;cab6
	nop			;cab7
	rst 38h			;cab8
	cp 005h			;cab9
	jp p,lb5c9h		;cabb
	call nc,07aa9h		;cabe
	ld (bc),a		;cac1
	ld a,h			;cac2
	ld a,b			;cac3
	ld (hl),b		;cac4
	ld (hl),b		;cac5
	ld (hl),b		;cac6
	ret p			;cac7
	nop			;cac8
	nop			;cac9
	nop			;caca
	nop			;cacb
	nop			;cacc
	nop			;cacd
	nop			;cace
	nop			;cacf
	nop			;cad0
	nop			;cad1
	nop			;cad2
	nop			;cad3
	nop			;cad4
	nop			;cad5
	nop			;cad6
	nop			;cad7
	nop			;cad8
	ld bc,0300eh		;cad9
	rst 38h			;cadc
	nop			;cadd
	cp a			;cade
	nop			;cadf
	rst 38h			;cae0
	nop			;cae1
	rst 38h			;cae2
	nop			;cae3
	rst 38h			;cae4
	inc bc			;cae5
	ld sp,hl		;cae6
	dec (hl)		;cae7
	add a,h			;cae8
	ld e,c			;cae9
	ld b,d			;caea
	call c,03898h		;caeb
	ld a,b			;caee
	ld a,b			;caef
	ld a,b			;caf0
	ret m			;caf1
	ld (hl),b		;caf2
	adc a,b			;caf3
	ret m			;caf4
	ret m			;caf5
	ret m			;caf6
	ei			;caf7
	nop			;caf8
	nop			;caf9
	nop			;cafa
	nop			;cafb
	nop			;cafc
	nop			;cafd
	nop			;cafe
	nop			;caff
	nop			;cb00
	nop			;cb01
	nop			;cb02
	nop			;cb03
	nop			;cb04
	nop			;cb05
	inc bc			;cb06
	rra			;cb07
	ld h,l			;cb08
	xor d			;cb09
	or l			;cb0a
	nop			;cb0b
	jp (hl)			;cb0c
	nop			;cb0d
	or a			;cb0e
	nop			;cb0f
	rst 38h			;cb10
	dec b			;cb11
	ei			;cb12
	add hl,hl		;cb13
	ld (hl),d		;cb14
	add a,h			;cb15
	xor b			;cb16
	ld l,b			;cb17
	ld l,b			;cb18
	ld a,b			;cb19
	ld a,b			;cb1a
	ret pe			;cb1b
	ret pe			;cb1c
	ret m			;cb1d
	ret m			;cb1e
	jp (hl)			;cb1f
	ret m			;cb20
	ret m			;cb21
	jp m,sub_f3f9h		;cb22
	inc b			;cb25
	xor a			;cb26
	ld e,d			;cb27
	nop			;cb28
	nop			;cb29
	nop			;cb2a
	nop			;cb2b
	nop			;cb2c
	nop			;cb2d
	nop			;cb2e
	nop			;cb2f
	nop			;cb30
	nop			;cb31
	ld bc,03f06h		;cb32
	call c,0e07dh		;cb35
	ld d,l			;cb38
	xor d			;cb39
	rst 38h			;cb3a
	inc b			;cb3b
	ret m			;cb3c
	ld (la9c5h),a		;cb3d
	ret			;cb40
	add hl,de		;cb41
	ld a,c			;cb42
	ld a,c			;cb43
	ld a,c			;cb44
	ret m			;cb45
	ld (hl),b		;cb46
	adc a,b			;cb47
	ret m			;cb48
	jp m,066f1h		;cb49
	dec bc			;cb4c
	ld hl,05b00h		;cb4d
	xor b			;cb50
	nop			;cb51
	rla			;cb52
	nop			;cb53
	and b			;cb54
	call c,05d23h		;cb55
	nop			;cb58
	nop			;cb59
	nop			;cb5a
	nop			;cb5b
	nop			;cb5c
	nop			;cb5d
	nop			;cb5e
	inc bc			;cb5f
	dec c			;cb60
	ld (hl),e		;cb61
	adc a,a			;cb62
	ld a,a			;cb63
	di			;cb64
	call m,037c9h		;cb65
	ld c,a			;cb68
	sub a			;cb69
	daa			;cb6a
	ld h,a			;cb6b
	and a			;cb6c
	and a			;cb6d
	and a			;cb6e
	jp po,le7a8h		;cb6f
	ret po			;cb72
	ret po			;cb73
	call pe,01ccbh		;cb74
	inc sp			;cb77
	inc b			;cb78
	add hl,hl		;cb79
	rla			;cb7a
	add a,b			;cb7b
	and l			;cb7c
	ld a,e			;cb7d
	jr nz,lcb84h		;cb7e
	ld a,(de)		;cb80
	or 02bh			;cb81
	dec b			;cb83
lcb84h:
	nop			;cb84
	xor c			;cb85
	add a,02dh		;cb86
	nop			;cb88
	nop			;cb89
	nop			;cb8a
	ld bc,01a07h		;cb8b
	rst 28h			;cb8e
	halt			;cb8f
	jp (hl)			;cb90
	jp p,l926ah		;cb91
	ld (hl),0b6h		;cb94
	or (hl)			;cb96
	dec (hl)		;cb97
	jr nc,lcbcah		;cb98
	dec hl			;cb9a
	nop			;cb9b
	nop			;cb9c
	dec b			;cb9d
	jr nz,lcbf4h		;cb9e
	and c			;cba0
	dec c			;cba1
	nop			;cba2
	sbc a,015h		;cba3
	ld b,b			;cba5
	inc b			;cba6
	ret pe			;cba7
	ld bc,le05eh		;cba8
	ld a,(bc)		;cbab
	ld d,l			;cbac
	ld l,d			;cbad
	or b			;cbae
	ld b,e			;cbaf
	inc c			;cbb0
	nop			;cbb1
	pop hl			;cbb2
	ld e,h			;cbb3
	nop			;cbb4
	ld d,l			;cbb5
	ld l,d			;cbb6
	rst 10h			;cbb7
	inc bc			;cbb8
	ld c,039h		;cbb9
	jp nc,l896ah		;cbbb
	ld hl,(04249h)		;cbbe
	ld d,l			;cbc1
	set 6,h			;cbc2
	ld b,c			;cbc4
	ld (bc),a		;cbc5
	jp (hl)			;cbc6
	nop			;cbc7
	ld c,d			;cbc8
	inc a			;cbc9
lcbcah:
	ld b,b			;cbca
	dec de			;cbcb
	ld c,d			;cbcc
	or l			;cbcd
	nop			;cbce
	xor d			;cbcf
	ld d,l			;cbd0
	call pe,lbc00h		;cbd1
	nop			;cbd4
	jr nz,$-100		;cbd5
	add a,l			;cbd7
	ld h,b			;cbd8
	cp b			;cbd9
	ld d,(hl)		;cbda
	nop			;cbdb
	ld a,(bc)		;cbdc
	dec h			;cbdd
	ret p			;cbde
	ld d,b			;cbdf
	xor h			;cbe0
	inc de			;cbe1
	nop			;cbe2
	ret c			;cbe3
	nop			;cbe4
	add a,a			;cbe5
	ld h,h			;cbe6
	out (000h),a		;cbe7
	rst 38h			;cbe9
	nop			;cbea
	ld a,a			;cbeb
	nop			;cbec
	ccf			;cbed
	add a,b			;cbee
	rra			;cbef
	ret nz			;cbf0
	rlca			;cbf1
	ret po			;cbf2
	inc bc			;cbf3
lcbf4h:
	ret m			;cbf4
	ld bc,000fch		;cbf5
	rst 38h			;cbf8
	nop			;cbf9
	rst 38h			;cbfa
	nop			;cbfb
	rst 38h			;cbfc
	nop			;cbfd
	rst 38h			;cbfe
	nop			;cbff
	rst 38h			;cc00
	nop			;cc01
	rst 38h			;cc02
	nop			;cc03
	rst 38h			;cc04
	nop			;cc05
	rst 38h			;cc06
	nop			;cc07
	rst 38h			;cc08
	nop			;cc09
	rst 38h			;cc0a
	nop			;cc0b
	rst 38h			;cc0c
	nop			;cc0d
	rst 38h			;cc0e
	nop			;cc0f
	rst 38h			;cc10
	nop			;cc11
	rst 38h			;cc12
	nop			;cc13
	rst 38h			;cc14
	nop			;cc15
	rst 38h			;cc16
	nop			;cc17
	nop			;cc18
	rst 38h			;cc19
	nop			;cc1a
	rst 38h			;cc1b
	nop			;cc1c
	rst 38h			;cc1d
	nop			;cc1e
	rst 38h			;cc1f
	nop			;cc20
	rst 38h			;cc21
	nop			;cc22
	rst 38h			;cc23
	nop			;cc24
	rst 38h			;cc25
	nop			;cc26
	ld a,a			;cc27
	nop			;cc28
	ccf			;cc29
	add a,b			;cc2a
	rra			;cc2b
	ret po			;cc2c
	rlca			;cc2d
	ret m			;cc2e
	inc bc			;cc2f
	call m,sub_fe01h	;cc30
	nop			;cc33
	rst 38h			;cc34
	nop			;cc35
	rst 38h			;cc36
	nop			;cc37
	rst 38h			;cc38
	nop			;cc39
	rst 38h			;cc3a
	nop			;cc3b
	rst 38h			;cc3c
	nop			;cc3d
	rst 38h			;cc3e
	nop			;cc3f
	rst 38h			;cc40
	nop			;cc41
	rst 38h			;cc42
	nop			;cc43
	rst 38h			;cc44
	nop			;cc45
	rst 38h			;cc46
	nop			;cc47
	nop			;cc48
	rst 38h			;cc49
	nop			;cc4a
	rst 38h			;cc4b
	nop			;cc4c
	rst 38h			;cc4d
	nop			;cc4e
	rst 38h			;cc4f
	nop			;cc50
	rst 38h			;cc51
	nop			;cc52
	rst 38h			;cc53
	nop			;cc54
	rst 38h			;cc55
	nop			;cc56
	rst 38h			;cc57
	nop			;cc58
	rst 38h			;cc59
	nop			;cc5a
	rst 38h			;cc5b
	nop			;cc5c
	rst 38h			;cc5d
	nop			;cc5e
	rst 38h			;cc5f
	nop			;cc60
	rst 38h			;cc61
	nop			;cc62
	rst 38h			;cc63
	nop			;cc64
	ccf			;cc65
	ret nz			;cc66
	rra			;cc67
	ret po			;cc68
	rrca			;cc69
	ret p			;cc6a
	inc bc			;cc6b
	call m,sub_fe01h	;cc6c
	nop			;cc6f
	rst 38h			;cc70
	nop			;cc71
	rst 38h			;cc72
	nop			;cc73
	rst 38h			;cc74
	nop			;cc75
	rst 38h			;cc76
	nop			;cc77
	nop			;cc78
	rst 38h			;cc79
	nop			;cc7a
	rst 38h			;cc7b
	nop			;cc7c
	rst 38h			;cc7d
	nop			;cc7e
	rst 38h			;cc7f
	nop			;cc80
	rst 38h			;cc81
	nop			;cc82
	rst 38h			;cc83
	nop			;cc84
	rst 38h			;cc85
	nop			;cc86
	rst 38h			;cc87
	nop			;cc88
	rst 38h			;cc89
	nop			;cc8a
	rst 38h			;cc8b
	nop			;cc8c
	rst 38h			;cc8d
	nop			;cc8e
	rst 38h			;cc8f
	nop			;cc90
	rst 38h			;cc91
	nop			;cc92
	rst 38h			;cc93
	nop			;cc94
	rst 38h			;cc95
	nop			;cc96
	rst 38h			;cc97
	nop			;cc98
	rst 38h			;cc99
	nop			;cc9a
	rst 38h			;cc9b
	nop			;cc9c
	rst 38h			;cc9d
	nop			;cc9e
	rst 38h			;cc9f
	nop			;cca0
	ccf			;cca1
	ret nz			;cca2
	rra			;cca3
	ret po			;cca4
	rrca			;cca5
	ret p			;cca6
	inc bc			;cca7
	cp l			;cca8
	cp l			;cca9
	cp l			;ccaa
	add a,b			;ccab
	rst 18h			;ccac
	ld e,a			;ccad
	rst 18h			;ccae
	ld h,b			;ccaf
	xor l			;ccb0
	ld l,l			;ccb1
	xor l			;ccb2
	ld h,b			;ccb3
	xor 05eh		;ccb4
	sbc a,040h		;ccb6
	rst 18h			;ccb8
	cp a			;ccb9
	cp a			;ccba
	add a,b			;ccbb
	cp (hl)			;ccbc
	sbc a,0deh		;ccbd
	ld b,b			;ccbf
	rst 10h			;ccc0
	ld d,a			;ccc1
	rst 10h			;ccc2
	ret nz			;ccc3
	sbc a,a			;ccc4
	rst 18h			;ccc5
	sbc a,a			;ccc6
	ret nz			;ccc7
	ld sp,hl		;ccc8
	ei			;ccc9
	ei			;ccca
	inc bc			;cccb
	cp l			;cccc
	cp e			;cccd
sub_ccceh:
	cp e			;ccce
	inc bc			;cccf
	ei			;ccd0
	defb 0fdh,0fdh,001h ;illegal sequence	;ccd1
	ei			;ccd4
	ei			;ccd5
	ei			;ccd6
	inc bc			;ccd7
	in a,(0dbh)		;ccd8
	exx			;ccda
	ld bc,lfbfdh		;ccdb
	ei			;ccde
	inc bc			;ccdf
	push af			;cce0
	push af			;cce1
	push af			;cce2
	ld bc,lbdbdh		;cce3
	cp l			;cce6
	inc bc			;cce7
	nop			;cce8
	cp 000h			;cce9
	rst 38h			;cceb
	nop			;ccec
	rst 38h			;cced
	nop			;ccee
	rst 38h			;ccef
	nop			;ccf0
	rst 38h			;ccf1
	nop			;ccf2
	rst 38h			;ccf3
	nop			;ccf4
	rst 38h			;ccf5
	nop			;ccf6
	rst 38h			;ccf7
	nop			;ccf8
	rst 38h			;ccf9
	nop			;ccfa
	rst 38h			;ccfb
	nop			;ccfc
	rst 38h			;ccfd
	nop			;ccfe
	rst 38h			;ccff
lcd00h:
	nop			;cd00
	jp m,0f100h		;cd01
	nop			;cd04
	or 000h			;cd05
	rst 30h			;cd07
	nop			;cd08
	or 000h			;cd09
	push af			;cd0b
	nop			;cd0c
	or 000h			;cd0d
	or 000h			;cd0f
	push af			;cd11
	nop			;cd12
	or 000h			;cd13
	rst 30h			;cd15
	nop			;cd16
	pop af			;cd17
	nop			;cd18
	or 000h			;cd19
	ei			;cd1b
	nop			;cd1c
	ei			;cd1d
	nop			;cd1e
	ei			;cd1f
	nop			;cd20
	ei			;cd21
	nop			;cd22
	ei			;cd23
	nop			;cd24
	defb 0fdh,000h,0fdh ;illegal sequence	;cd25
	nop			;cd28
	cp 000h			;cd29
	rst 38h			;cd2b
	nop			;cd2c
	rst 38h			;cd2d
	nop			;cd2e
	rst 38h			;cd2f
	nop			;cd30
	rst 38h			;cd31
	nop			;cd32
	rst 38h			;cd33
	nop			;cd34
	ld a,a			;cd35
	add a,b			;cd36
	rra			;cd37
	ret po			;cd38
	rlca			;cd39
	ret m			;cd3a
	nop			;cd3b
	rst 38h			;cd3c
	nop			;cd3d
	rst 38h			;cd3e
	nop			;cd3f
	rst 38h			;cd40
	nop			;cd41
	rst 38h			;cd42
	nop			;cd43
	rst 38h			;cd44
	nop			;cd45
	rst 38h			;cd46
	nop			;cd47
	nop			;cd48
	xor d			;cd49
	nop			;cd4a
	defb 0fdh,000h,0ffh ;illegal sequence	;cd4b
	nop			;cd4e
	rst 38h			;cd4f
	nop			;cd50
	rst 38h			;cd51
	nop			;cd52
	rst 38h			;cd53
	nop			;cd54
	rst 38h			;cd55
	nop			;cd56
	rst 38h			;cd57
	nop			;cd58
	rst 38h			;cd59
	nop			;cd5a
	rst 38h			;cd5b
	nop			;cd5c
	rst 38h			;cd5d
	nop			;cd5e
	rst 38h			;cd5f
	nop			;cd60
	rst 38h			;cd61
	nop			;cd62
	ld d,a			;cd63
	nop			;cd64
	ld hl,(l8000h)		;cd65
	nop			;cd68
	cp (hl)			;cd69
	nop			;cd6a
	or e			;cd6b
	nop			;cd6c
	or c			;cd6d
	nop			;cd6e
	cp (hl)			;cd6f
	nop			;cd70
	or e			;cd71
	nop			;cd72
	or c			;cd73
	nop			;cd74
	cp (hl)			;cd75
	nop			;cd76
	or e			;cd77
	nop			;cd78
	ld sp,lbe00h		;cd79
	nop			;cd7c
	rst 18h			;cd7d
	nop			;cd7e
	jp l7800h		;cd7f
	nop			;cd82
	ld l,h			;cd83
	nop			;cd84
	xor l			;cd85
	nop			;cd86
	or h			;cd87
	nop			;cd88
	push de			;cd89
	nop			;cd8a
	ld d,h			;cd8b
	nop			;cd8c
	ld (hl),l		;cd8d
	nop			;cd8e
	ld a,l			;cd8f
	nop			;cd90
	sbc a,h			;cd91
	nop			;cd92
	ex (sp),hl		;cd93
	nop			;cd94
	rst 38h			;cd95
	nop			;cd96
	rst 38h			;cd97
	nop			;cd98
	rst 38h			;cd99
	nop			;cd9a
	rst 38h			;cd9b
	nop			;cd9c
	ccf			;cd9d
	ret nz			;cd9e
	rrca			;cd9f
	ret p			;cda0
	ld bc,000feh		;cda1
	rst 38h			;cda4
	nop			;cda5
	rst 38h			;cda6
	nop			;cda7
	nop			;cda8
	xor d			;cda9
	nop			;cdaa
	ld d,l			;cdab
	nop			;cdac
	xor e			;cdad
	nop			;cdae
	push af			;cdaf
	nop			;cdb0
	ei			;cdb1
	nop			;cdb2
	defb 0fdh,000h,0ffh ;illegal sequence	;cdb3
	nop			;cdb6
	rst 38h			;cdb7
	nop			;cdb8
	rst 38h			;cdb9
	nop			;cdba
	rst 38h			;cdbb
	nop			;cdbc
	rst 38h			;cdbd
	nop			;cdbe
	rst 38h			;cdbf
	nop			;cdc0
	rst 38h			;cdc1
	nop			;cdc2
	ld a,a			;cdc3
	nop			;cdc4
	cp a			;cdc5
	nop			;cdc6
	ld d,a			;cdc7
	nop			;cdc8
	rrca			;cdc9
	nop			;cdca
	rst 20h			;cdcb
	nop			;cdcc
sub_cdcdh:
	cpl			;cdcd
	nop			;cdce
	daa			;cdcf
	nop			;cdd0
	rst 28h			;cdd1
	nop			;cdd2
	daa			;cdd3
	nop			;cdd4
	cpl			;cdd5
	nop			;cdd6
	rst 20h			;cdd7
	nop			;cdd8
	cpl			;cdd9
	nop			;cdda
	daa			;cddb
	nop			;cddc
	rst 28h			;cddd
	nop			;cdde
	add a,a			;cddf
	nop			;cde0
	ld c,a			;cde1
	nop			;cde2
	and a			;cde3
	nop			;cde4
	ld e,a			;cde5
	nop			;cde6
	sbc a,a			;cde7
	nop			;cde8
	ld e,a			;cde9
	nop			;cdea
	cp a			;cdeb
	nop			;cdec
	ld a,a			;cded
	nop			;cdee
	ld a,a			;cdef
	nop			;cdf0
	rst 38h			;cdf1
	nop			;cdf2
	rst 38h			;cdf3
	nop			;cdf4
	rst 38h			;cdf5
	nop			;cdf6
	rst 38h			;cdf7
	nop			;cdf8
	rst 38h			;cdf9
	nop			;cdfa
	rst 38h			;cdfb
	nop			;cdfc
	rst 38h			;cdfd
	nop			;cdfe
	rst 38h			;cdff
lce00h:
	nop			;ce00
	rst 38h			;ce01
	nop			;ce02
	ld a,a			;ce03
	add a,b			;ce04
	rrca			;ce05
	ret p			;ce06
	inc bc			;ce07
	nop			;ce08
	nop			;ce09
	nop			;ce0a
	nop			;ce0b
	nop			;ce0c
	nop			;ce0d
	nop			;ce0e
	nop			;ce0f
	nop			;ce10
	nop			;ce11
	nop			;ce12
	nop			;ce13
lce14h:
	nop			;ce14
	nop			;ce15
	nop			;ce16
	nop			;ce17
	nop			;ce18
	nop			;ce19
	nop			;ce1a
	nop			;ce1b
	nop			;ce1c
	nop			;ce1d
	nop			;ce1e
	nop			;ce1f
	nop			;ce20
	nop			;ce21
	nop			;ce22
	nop			;ce23
	nop			;ce24
	nop			;ce25
lce26h:
	nop			;ce26
	nop			;ce27
	ld bc,00603h		;ce28
	inc b			;ce2b
	ld a,(bc)		;ce2c
	rrca			;ce2d
	dec bc			;ce2e
	ld de,labd3h		;ce2f
	ld d,a			;ce32
	cp (hl)			;ce33
	call m,09be5h		;ce34
	ld h,(hl)		;ce37
lce38h:
	sub b			;ce38
	ld c,0f1h		;ce39
	inc b			;ce3b
	xor d			;ce3c
	dec d			;ce3d
	ld a,(bc)		;ce3e
	ld bc,00000h		;ce3f
	nop			;ce42
	nop			;ce43
	nop			;ce44
	nop			;ce45
	nop			;ce46
	nop			;ce47
	nop			;ce48
	nop			;ce49
	nop			;ce4a
	nop			;ce4b
	nop			;ce4c
	nop			;ce4d
	nop			;ce4e
	nop			;ce4f
	nop			;ce50
	nop			;ce51
	nop			;ce52
	nop			;ce53
	nop			;ce54
	nop			;ce55
	nop			;ce56
	nop			;ce57
	nop			;ce58
	nop			;ce59
	nop			;ce5a
	nop			;ce5b
	nop			;ce5c
	nop			;ce5d
	ld bc,00502h		;ce5e
	dec de			;ce61
	daa			;ce62
	cpl			;ce63
	ld e,a			;ce64
	ld e,a			;ce65
	cp (hl)			;ce66
	cp (hl)			;ce67
	ld a,(hl)		;ce68
	ld b,(hl)		;ce69
	call nc,04100h		;ce6a
	dec bc			;ce6d
	or c			;ce6e
	jr nc,lce26h		;ce6f
	ld l,d			;ce71
	ld b,c			;ce72
	ld d,d			;ce73
	xor c			;ce74
	ld e,(hl)		;ce75
	jr nz,$+68		;ce76
	nop			;ce78
	nop			;ce79
	inc a			;ce7a
	ex (sp),hl		;ce7b
	jr $+69			;ce7c
	and h			;ce7e
	ld d,e			;ce7f
	jr z,$+25		;ce80
	ld a,(bc)		;ce82
	dec b			;ce83
	ld (bc),a		;ce84
	inc b			;ce85
	nop			;ce86
	nop			;ce87
	nop			;ce88
	nop			;ce89
	nop			;ce8a
	nop			;ce8b
	nop			;ce8c
	nop			;ce8d
	nop			;ce8e
	nop			;ce8f
	nop			;ce90
	nop			;ce91
	nop			;ce92
	nop			;ce93
	nop			;ce94
	nop			;ce95
	nop			;ce96
	nop			;ce97
	ld bc,00201h		;ce98
	dec b			;ce9b
	dec de			;ce9c
	ld h,a			;ce9d
	sbc a,a			;ce9e
	ld a,(hl)		;ce9f
	defb 0fdh,09fh,0adh ;illegal sequence	;cea0
	add a,e			;cea3
	push de			;cea4
	jp nz,laa61h		;cea5
	ld hl,ld58ah		;cea8
	set 2,(hl)		;ceab
	cp l			;cead
	ld h,c			;ceae
	add a,d			;ceaf
	add a,d			;ceb0
	ret nz			;ceb1
	ld (hl),h		;ceb2
	xor b			;ceb3
	call p,sub_d5aah	;ceb4
	xor (hl)		;ceb7
	ret m			;ceb8
	ld c,001h		;ceb9
	rst 0			;cebb
	inc hl			;cebc
	call nz,lf800h		;cebd
	ld bc,ladfah		;cec0
	ld (de),a		;cec3
	add a,l			;cec4
	ld (bc),a		;cec5
	nop			;cec6
	nop			;cec7
	nop			;cec8
	nop			;cec9
	nop			;ceca
	nop			;cecb
	nop			;cecc
	nop			;cecd
	ld bc,00201h		;cece
	dec b			;ced1
	dec bc			;ced2
	ld e,014h		;ced3
	inc l			;ced5
	ld e,b			;ced6
	xor b			;ced7
	ld (hl),h		;ced8
	ld l,b			;ced9
	exx			;ceda
	xor b			;cedb
	ret nc			;cedc
	and b			;cedd
	ld b,c			;cede
	add a,b			;cedf
	add a,c			;cee0
	inc bc			;cee1
	dec b			;cee2
	ld (bc),a		;cee3
	add a,(hl)		;cee4
	jp nz,lc345h		;cee5
	ld b,c			;cee8
	add a,d			;cee9
	ld bc,00102h		;ceea
	ld bc,00002h		;ceed
	ld (bc),a		;cef0
	nop			;cef1
sub_cef2h:
	nop			;cef2
	nop			;cef3
	nop			;cef4
	nop			;cef5
	ld b,b			;cef6
	jp pe,0030eh		;cef7
	ld b,001h		;cefa
	add a,d			;cefc
	nop			;cefd
	nop			;cefe
lceffh:
	nop			;ceff
	nop			;cf00
	nop			;cf01
	cp 001h			;cf02
	ld d,h			;cf04
	xor d			;cf05
	ld bc,00000h		;cf06
	nop			;cf09
	nop			;cf0a
	nop			;cf0b
	ld b,b			;cf0c
	ret nz			;cf0d
	ld h,b			;cf0e
	ret po			;cf0f
	ret p			;cf10
	ret p			;cf11
	ld a,b			;cf12
	jr c,lcf51h		;cf13
	inc a			;cf15
	cp 03eh			;cf16
	ld a,09eh		;cf18
	sbc a,(hl)		;cf1a
	ld e,a			;cf1b
	rst 18h			;cf1c
	ld c,a			;cf1d
	ld c,a			;cf1e
	adc a,e			;cf1f
	add a,e			;cf20
	rlca			;cf21
	dec b			;cf22
	rrca			;cf23
	rrca			;cf24
	ld c,01dh		;cf25
	jr c,$+19		;cf27
	add a,b			;cf29
	ld bc,00703h		;cf2a
	inc bc			;cf2d
	dec b			;cf2e
	ld (bc),a		;cf2f
	ld c,01ch		;cf30
	ld a,a			;cf32
	rst 38h			;cf33
	ccf			;cf34
	inc bc			;cf35
	ld bc,0078eh		;cf36
	ld c,034h		;cf39
	ex af,af'		;cf3b
	ld de,01008h		;cf3c
	nop			;cf3f
	nop			;cf40
	nop			;cf41
	inc bc			;cf42
	ld a,h			;cf43
	ld bc,054aah		;cf44
	and b			;cf47
	nop			;cf48
	nop			;cf49
	nop			;cf4a
	nop			;cf4b
	nop			;cf4c
	nop			;cf4d
	nop			;cf4e
	nop			;cf4f
	nop			;cf50
lcf51h:
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
	add a,b			;cf5e
	add a,b			;cf5f
	ld b,b			;cf60
	ret po			;cf61
	ret nc			;cf62
	xor b			;cf63
	ret pe			;cf64
	ret c			;cf65
	ld h,h			;cf66
	call p,sub_ba5ah	;cf67
	push af			;cf6a
	xor l			;cf6b
	and l			;cf6c
	ld a,d			;cf6d
	ld d,(hl)		;cf6e
	ld e,d			;cf6f
	ld e,l			;cf70
	in a,(02dh)		;cf71
	xor (hl)		;cf73
	xor l			;cf74
	sub (hl)		;cf75
	rst 10h			;cf76
	add a,095h		;cf77
	ld h,c			;cf79
	add a,d			;cf7a
	ld b,c			;cf7b
	add a,b			;cf7c
	inc bc			;cf7d
	inc c			;cf7e
	ld de,lfa07h		;cf7f
	ld d,l			;cf82
	xor d			;cf83
	ld b,c			;cf84
	jr nz,lcf87h		;cf85
lcf87h:
	nop			;cf87
	nop			;cf88
	nop			;cf89
	nop			;cf8a
	nop			;cf8b
	nop			;cf8c
	nop			;cf8d
	nop			;cf8e
	nop			;cf8f
	nop			;cf90
	nop			;cf91
	nop			;cf92
	nop			;cf93
	nop			;cf94
	nop			;cf95
	nop			;cf96
	nop			;cf97
sub_cf98h:
	nop			;cf98
	nop			;cf99
	nop			;cf9a
	nop			;cf9b
	nop			;cf9c
	nop			;cf9d
	nop			;cf9e
	nop			;cf9f
	nop			;cfa0
	nop			;cfa1
	nop			;cfa2
	nop			;cfa3
	nop			;cfa4
	nop			;cfa5
	nop			;cfa6
	nop			;cfa7
	nop			;cfa8
	nop			;cfa9
	nop			;cfaa
	nop			;cfab
	add a,b			;cfac
	add a,b			;cfad
	ret nz			;cfae
	ret nz			;cfaf
	ld h,b			;cfb0
	ld h,c			;cfb1
	ld (hl),d		;cfb2
	cp l			;cfb3
	cp (hl)			;cfb4
	push de			;cfb5
	ld c,(hl)		;cfb6
	or a			;cfb7
	ld l,c			;cfb8
	add a,019h		;cfb9
	add a,b			;cfbb
	ld e,a			;cfbc
	sub h			;cfbd
	ld hl,(048d4h)		;cfbe
lcfc1h:
	add a,b			;cfc1
	ld c,b			;cfc2
	add a,b			;cfc3
	nop			;cfc4
	add a,b			;cfc5
	nop			;cfc6
	nop			;cfc7
	nop			;cfc8
	nop			;cfc9
	nop			;cfca
	nop			;cfcb
	nop			;cfcc
	nop			;cfcd
	nop			;cfce
	nop			;cfcf
	nop			;cfd0
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
	nop			;cfe0
	nop			;cfe1
	nop			;cfe2
	nop			;cfe3
	nop			;cfe4
	nop			;cfe5
	nop			;cfe6
	nop			;cfe7
	nop			;cfe8
	nop			;cfe9
	nop			;cfea
	inc bc			;cfeb
	inc c			;cfec
	inc sp			;cfed
	ld c,a			;cfee
	ld e,a			;cfef
	ld e,a			;cff0
	cp a			;cff1
	ld a,a			;cff2
	ld a,(hl)		;cff3
	ld a,l			;cff4
	ld a,e			;cff5
	ld h,a			;cff6
	inc e			;cff7
	ld d,b			;cff8
	dec l			;cff9
	adc a,(hl)		;cffa
	ret nc			;cffb
	ld c,a			;cffc
	and b			;cffd
	ld d,l			;cffe
	ld hl,(02255h)		;cfff
	dec b			;d002
	jr nz,ld005h		;d003
ld005h:
	nop			;d005
	nop			;d006
sub_d007h:
	nop			;d007
	nop			;d008
	nop			;d009
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
	ld bc,00502h		;d023
	ld a,(bc)		;d026
	dec c			;d027
	ld (de),a		;d028
	ld hl,(02dd5h)		;d029
	jp pe,ld6ebh		;d02c
	push de			;d02f
	xor d			;d030
	ld d,h			;d031
	ld e,d			;d032
	cp h			;d033
	xor b			;d034
	ld d,h			;d035
	ld l,b			;d036
	cp (hl)			;d037
	nop			;d038
	dec sp			;d039
	ld b,003h		;d03a
	add a,020h		;d03c
	ret nz			;d03e
	nop			;d03f
	rst 38h			;d040
	xor d			;d041
	ld d,h			;d042
	add a,c			;d043
	ld (bc),a		;d044
	ld bc,00000h		;d045
	nop			;d048
	nop			;d049
	nop			;d04a
	nop			;d04b
	nop			;d04c
	nop			;d04d
	nop			;d04e
	nop			;d04f
	nop			;d050
	nop			;d051
	nop			;d052
	nop			;d053
	nop			;d054
	nop			;d055
	nop			;d056
	nop			;d057
	nop			;d058
	nop			;d059
	nop			;d05a
	nop			;d05b
	nop			;d05c
	inc bc			;d05d
	dec c			;d05e
	ld (lbe4fh),a		;d05f
	cp c			;d062
ld063h:
	halt			;d063
	jp z,la8d4h		;d064
	ld d,c			;d067
	xor c			;d068
	pop bc			;d069
	and e			;d06a
	ld b,e			;d06b
	add a,c			;d06c
	ld b,e			;d06d
	ld bc,00702h		;d06e
	rrca			;d071
	dec de			;d072
	ld d,02fh		;d073
	ld (hl),02bh		;d075
	dec (hl)		;d077
	nop			;d078
	inc a			;d079
	ld e,018h		;d07a
	inc c			;d07c
	ex af,af'		;d07d
	nop			;d07e
	nop			;d07f
	ret po			;d080
	djnz ld063h		;d081
	nop			;d083
	call m,sub_844bh	;d084
	nop			;d087
	nop			;d088
	nop			;d089
	nop			;d08a
	nop			;d08b
	nop			;d08c
	nop			;d08d
	nop			;d08e
	nop			;d08f
	nop			;d090
	nop			;d091
	nop			;d092
	nop			;d093
	nop			;d094
	nop			;d095
	nop			;d096
	nop			;d097
	nop			;d098
	nop			;d099
	nop			;d09a
	nop			;d09b
	ret nz			;d09c
	ret po			;d09d
	and b			;d09e
	ret p			;d09f
	ld d,b			;d0a0
	cp b			;d0a1
	inc e			;d0a2
	ld c,(hl)		;d0a3
	rst 0			;d0a4
	adc a,a			;d0a5
	rst 8			;d0a6
	adc a,a			;d0a7
	rst 0			;d0a8
	sbc a,l			;d0a9
	add a,e			;d0aa
	rlca			;d0ab
	pop bc			;d0ac
	add a,b			;d0ad
	pop hl			;d0ae
	ret nz			;d0af
	ret po			;d0b0
	ret p			;d0b1
	nop			;d0b2
	nop			;d0b3
	add a,b			;d0b4
	nop			;d0b5
	add a,b			;d0b6
	rst 8			;d0b7
	nop			;d0b8
	inc bc			;d0b9
	nop			;d0ba
	ld bc,00000h		;d0bb
	nop			;d0be
	nop			;d0bf
	nop			;d0c0
ld0c1h:
	nop			;d0c1
	rlca			;d0c2
	ld a,(bc)		;d0c3
	dec b			;d0c4
	jp m,00020h		;d0c5
	nop			;d0c8
	nop			;d0c9
	nop			;d0ca
	nop			;d0cb
	nop			;d0cc
	nop			;d0cd
	nop			;d0ce
	nop			;d0cf
ld0d0h:
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
	nop			;d0dd
	nop			;d0de
	nop			;d0df
	nop			;d0e0
	nop			;d0e1
	nop			;d0e2
	nop			;d0e3
	nop			;d0e4
	add a,b			;d0e5
	ld b,b			;d0e6
	and b			;d0e7
	ret nc			;d0e8
	jr z,ld0c1h		;d0e9
	ld a,e			;d0eb
	defb 0edh ;next byte illegal after ed	;d0ec
	or 06bh			;d0ed
	dec a			;d0ef
	ld d,03bh		;d0f0
	dec c			;d0f2
	ld b,01fh		;d0f3
	rrca			;d0f5
	rst 38h			;d0f6
	rst 38h			;d0f7
	ld a,a			;d0f8
	ret m			;d0f9
	inc a			;d0fa
	ret p			;d0fb
	inc a			;d0fc
	ld (hl),b		;d0fd
	djnz ld101h		;d0fe
	inc bc			;d100
ld101h:
	ld bc,laaffh		;d101
	inc d			;d104
	ex af,af'		;d105
	djnz ld108h		;d106
ld108h:
	nop			;d108
	nop			;d109
	nop			;d10a
	nop			;d10b
	nop			;d10c
	nop			;d10d
	nop			;d10e
	nop			;d10f
	nop			;d110
	nop			;d111
	nop			;d112
	nop			;d113
	nop			;d114
	nop			;d115
	nop			;d116
	nop			;d117
	nop			;d118
	nop			;d119
	nop			;d11a
	nop			;d11b
	nop			;d11c
	nop			;d11d
	nop			;d11e
	nop			;d11f
	nop			;d120
	nop			;d121
	nop			;d122
	nop			;d123
	nop			;d124
	nop			;d125
	nop			;d126
	nop			;d127
	nop			;d128
	nop			;d129
	nop			;d12a
	nop			;d12b
	add a,b			;d12c
	ret nz			;d12d
	and b			;d12e
	ret nc			;d12f
	xor h			;d130
	ld e,a			;d131
	halt			;d132
	cp l			;d133
	ld e,d			;d134
	xor l			;d135
	jp nc,0d66dh		;d136
	xor d			;d139
	rra			;d13a
	xor 01ch		;d13b
	ld c,074h		;d13d
	xor b			;d13f
	ld d,h			;d140
	and b			;d141
	ld d,h			;d142
	and b			;d143
	nop			;d144
	jr nz,ld147h		;d145
ld147h:
	nop			;d147
	rst 38h			;d148
	nop			;d149
	rst 38h			;d14a
	nop			;d14b
	call m,sub_e000h	;d14c
	inc bc			;d14f
	nop			;d150
	rra			;d151
	nop			;d152
	rst 38h			;d153
	nop			;d154
	rst 38h			;d155
	nop			;d156
	rst 38h			;d157
	nop			;d158
	nop			;d159
	rst 38h			;d15a
	nop			;d15b
	ccf			;d15c
	nop			;d15d
	rra			;d15e
	ret nz			;d15f
	inc sp			;d160
	nop			;d161
	ret po			;d162
	inc c			;d163
	ret p			;d164
	ld bc,000feh		;d165
	rst 38h			;d168
	nop			;d169
	adc a,a			;d16a
	nop			;d16b
	inc bc			;d16c
	ld (hl),b		;d16d
	nop			;d16e
	call m,lfeffh+1		;d16f
	nop			;d172
	rst 38h			;d173
	nop			;d174
	rst 38h			;d175
	nop			;d176
	rst 38h			;d177
	nop			;d178
	nop			;d179
	rst 38h			;d17a
	nop			;d17b
	rst 38h			;d17c
	nop			;d17d
	rst 38h			;d17e
	nop			;d17f
	cp 000h			;d180
	ld a,b			;d182
	ld bc,l8400h		;d183
	inc bc			;d186
	jr c,$+1		;d187
	nop			;d189
	rst 38h			;d18a
	nop			;d18b
	rst 38h			;d18c
	nop			;d18d
	ld (hl),b		;d18e
	nop			;d18f
	nop			;d190
	adc a,a			;d191
	nop			;d192
	rst 38h			;d193
	nop			;d194
	rst 38h			;d195
	nop			;d196
	rst 38h			;d197
	nop			;d198
	nop			;d199
	rst 38h			;d19a
	nop			;d19b
	adc a,(hl)		;d19c
	nop			;d19d
	nop			;d19e
	ld (hl),c		;d19f
	nop			;d1a0
	ld c,031h		;d1a1
	add a,b			;d1a3
	ld a,a			;d1a4
	nop			;d1a5
	rst 38h			;d1a6
	nop			;d1a7
	rst 38h			;d1a8
	nop			;d1a9
	rst 38h			;d1aa
	nop			;d1ab
	rst 38h			;d1ac
	nop			;d1ad
	rst 38h			;d1ae
	nop			;d1af
	jr nz,ld1b2h		;d1b0
ld1b2h:
	nop			;d1b2
	rst 18h			;d1b3
	nop			;d1b4
	rst 38h			;d1b5
	nop			;d1b6
	rst 38h			;d1b7
	nop			;d1b8
	nop			;d1b9
	rst 10h			;d1ba
	nop			;d1bb
	ld bc,01028h		;d1bc
	jp nz,0003dh		;d1bf
	rst 38h			;d1c2
	nop			;d1c3
	rst 38h			;d1c4
	nop			;d1c5
	rst 38h			;d1c6
	nop			;d1c7
	rst 38h			;d1c8
	nop			;d1c9
	rst 38h			;d1ca
	nop			;d1cb
	rst 38h			;d1cc
	nop			;d1cd
	rst 38h			;d1ce
	nop			;d1cf
	call m,lf800h		;d1d0
	inc bc			;d1d3
	call m,lfeffh+1		;d1d4
	nop			;d1d7
	rst 38h			;d1d8
	nop			;d1d9
	rst 38h			;d1da
	nop			;d1db
	rst 38h			;d1dc
	nop			;d1dd
	cp 000h			;d1de
	jr ld1e3h		;d1e0
	nop			;d1e2
ld1e3h:
	rst 20h			;d1e3
	nop			;d1e4
	rst 38h			;d1e5
	nop			;d1e6
	rst 38h			;d1e7
	ccf			;d1e8
	nop			;d1e9
	inc bc			;d1ea
	ret nz			;d1eb
	nop			;d1ec
	inc e			;d1ed
	ret po			;d1ee
	inc bc			;d1ef
	call m,lfeffh+1		;d1f0
	nop			;d1f3
	rst 38h			;d1f4
	nop			;d1f5
	rst 38h			;d1f6
	nop			;d1f7
	rst 38h			;d1f8
	nop			;d1f9
	cp 000h			;d1fa
	ret m			;d1fc
	ld bc,006f0h		;d1fd
	ld sp,hl		;d200
	nop			;d201
	rst 38h			;d202
	nop			;d203
	rst 38h			;d204
	nop			;d205
	rst 38h			;d206
	nop			;d207
	cp 000h			;d208
	ret m			;d20a
	ld bc,004d0h		;d20b
	nop			;d20e
	dec hl			;d20f
	nop			;d210
	sub l			;d211
	nop			;d212
	ld l,a			;d213
	sub b			;d214
	ld (bc),a		;d215
	ret pe			;d216
	nop			;d217
	ret nz			;d218
	inc d			;d219
	ret pe			;d21a
	inc bc			;d21b
	call m,01c00h		;d21c
	nop			;d21f
	nop			;d220
	pop hl			;d221
	nop			;d222
	rst 38h			;d223
	nop			;d224
	rst 38h			;d225
	nop			;d226
	rst 38h			;d227
	rst 38h			;d228
	nop			;d229
	add a,c			;d22a
	nop			;d22b
	nop			;d22c
	ld a,000h		;d22d
	add a,c			;d22f
	ld a,(hl)		;d230
	nop			;d231
	call m,sub_e800h	;d232
	inc bc			;d235
	jp lce14h		;d236
	nop			;d239
	add a,h			;d23a
	add hl,hl		;d23b
	ex af,af'		;d23c
	ld d,b			;d23d
	nop			;d23e
	add a,d			;d23f
	nop			;d240
	ld a,c			;d241
	add a,b			;d242
	ld b,0f9h		;d243
	nop			;d245
	rst 38h			;d246
	nop			;d247
	cp a			;d248
	nop			;d249
	rlca			;d24a
	ld b,b			;d24b
	ld (bc),a		;d24c
	cp b			;d24d
	nop			;d24e
	ld d,l			;d24f
	nop			;d250
	xor d			;d251
	nop			;d252
	ld l,l			;d253
	nop			;d254
	or d			;d255
	dec c			;d256
	ld h,b			;d257
	dec bc			;d258
	ld h,b			;d259
	ld bc,003c4h		;d25a
	ret c			;d25d
	rlca			;d25e
	ret po			;d25f
	inc c			;d260
	ld h,b			;d261
	nop			;d262
	or e			;d263
	nop			;d264
	rst 38h			;d265
	nop			;d266
	rst 38h			;d267
	add a,e			;d268
	nop			;d269
	add a,b			;d26a
	ld a,h			;d26b
	ret po			;d26c
	inc de			;d26d
	ld c,h			;d26e
	jr nz,ld2b8h		;d26f
	and b			;d271
	ld h,e			;d272
	sbc a,b			;d273
	ld b,c			;d274
	and h			;d275
	ld b,e			;d276
	jr nz,ld29ch		;d277
	sub b			;d279
	djnz ld2c8h		;d27a
	ex af,af'		;d27c
	rlca			;d27d
	inc bc			;d27e
	and b			;d27f
	ld bc,00054h		;d280
	cp a			;d283
	ld b,b			;d284
	nop			;d285
	rst 38h			;d286
	nop			;d287
	rst 38h			;d288
	nop			;d289
	rst 38h			;d28a
	nop			;d28b
	xor a			;d28c
	nop			;d28d
	rlca			;d28e
	ld d,b			;d28f
	inc bc			;d290
	ret pe			;d291
	ld bc,la35ch		;d292
	ex af,af'		;d295
	rst 30h			;d296
	nop			;d297
	rst 38h			;d298
	nop			;d299
	rst 38h			;d29a
	nop			;d29b
ld29ch:
	rst 38h			;d29c
	nop			;d29d
	di			;d29e
	nop			;d29f
	nop			;d2a0
	inc c			;d2a1
	nop			;d2a2
	rst 38h			;d2a3
	nop			;d2a4
	rst 38h			;d2a5
	nop			;d2a6
	rst 38h			;d2a7
	rst 38h			;d2a8
ld2a9h:
	nop			;d2a9
	ld a,000h		;d2aa
	nop			;d2ac
	pop bc			;d2ad
	nop			;d2ae
	ld e,0e1h		;d2af
	nop			;d2b1
	rst 38h			;d2b2
	nop			;d2b3
	rst 38h			;d2b4
	nop			;d2b5
	rst 38h			;d2b6
	nop			;d2b7
ld2b8h:
	rst 38h			;d2b8
	nop			;d2b9
	scf			;d2ba
	nop			;d2bb
	inc bc			;d2bc
	ret z			;d2bd
	rlca			;d2be
	djnz ld2d0h		;d2bf
	ld h,b			;d2c1
	rra			;d2c2
	nop			;d2c3
	rst 38h			;d2c4
	nop			;d2c5
	rst 38h			;d2c6
	nop			;d2c7
ld2c8h:
	nop			;d2c8
	nop			;d2c9
	nop			;d2ca
	nop			;d2cb
	nop			;d2cc
	nop			;d2cd
	nop			;d2ce
	nop			;d2cf
ld2d0h:
	jr nc,ld2d2h		;d2d0
ld2d2h:
	rlca			;d2d2
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
	add a,b			;d2dd
	nop			;d2de
ld2dfh:
	nop			;d2df
	inc e			;d2e0
ld2e1h:
	nop			;d2e1
ld2e2h:
	add a,b			;d2e2
ld2e3h:
	inc b			;d2e3
	nop			;d2e4
ld2e5h:
	nop			;d2e5
	nop			;d2e6
ld2e7h:
	nop			;d2e7
ld2e8h:
	rst 38h			;d2e8
ld2e9h:
	rst 38h			;d2e9
	rst 38h			;d2ea
	rst 38h			;d2eb
	rst 38h			;d2ec
	rst 38h			;d2ed
	rst 38h			;d2ee
	rst 38h			;d2ef
	nop			;d2f0
	nop			;d2f1
	nop			;d2f2
	nop			;d2f3
	nop			;d2f4
	nop			;d2f5
	nop			;d2f6
	nop			;d2f7
ld2f8h:
	nop			;d2f8
	nop			;d2f9
	nop			;d2fa
	nop			;d2fb
	nop			;d2fc
	nop			;d2fd
	nop			;d2fe
	nop			;d2ff
ld300h:
	ld a,b			;d300
	cp b			;d301
	ld (hl),b		;d302
	cp b			;d303
	ld (hl),b		;d304
	or b			;d305
	ld l,b			;d306
	or b			;d307
	ld l,b			;d308
ld309h:
	cp b			;d309
	ld h,b			;d30a
	cp b			;d30b
	ld e,b			;d30c
	cp b			;d30d
	ld e,b			;d30e
	or b			;d30f
	ld d,b			;d310
	or b			;d311
	ld c,b			;d312
	or b			;d313
	ld c,b			;d314
	cp b			;d315
	ld b,b			;d316
	cp b			;d317
	ld b,b			;d318
	or b			;d319
	ld b,b			;d31a
	xor b			;d31b
	ld b,b			;d31c
	and b			;d31d
	ld c,b			;d31e
	and b			;d31f
	ld c,b			;d320
	sbc a,b			;d321
	ld c,b			;d322
	sub b			;d323
	ld c,b			;d324
	adc a,b			;d325
	ld c,b			;d326
	add a,b			;d327
	ld b,b			;d328
	add a,b			;d329
	ld b,b			;d32a
	ld a,b			;d32b
	ld b,b			;d32c
	ld (hl),b		;d32d
	ld b,b			;d32e
	ld l,b			;d32f
	ld b,b			;d330
	ld h,b			;d331
	ld b,b			;d332
	ld e,b			;d333
	ld b,b			;d334
	ld d,b			;d335
	ld c,b			;d336
	ld d,b			;d337
	ld c,b			;d338
	ld c,b			;d339
	ld c,b			;d33a
	ld b,b			;d33b
	ld c,b			;d33c
	jr c,ld387h		;d33d
	jr nc,ld391h		;d33f
	jr nc,ld393h		;d341
	jr z,ld395h		;d343
	jr nz,ld397h		;d345
	jr ld399h		;d347
	djnz ld3a3h		;d349
	djnz ld3a5h		;d34b
	ex af,af'		;d34d
	ld h,b			;d34e
	ex af,af'		;d34f
	ld h,b			;d350
	nop			;d351
	ld l,b			;d352
	nop			;d353
	ld (hl),b		;d354
	nop			;d355
	ld a,b			;d356
	nop			;d357
	add a,b			;d358
	nop			;d359
	add a,b			;d35a
	ex af,af'		;d35b
	add a,b			;d35c
	djnz ld2dfh		;d35d
	jr ld2e1h		;d35f
	jr nz,ld2e3h		;d361
	jr z,ld2e5h		;d363
	jr nc,ld2e7h		;d365
	jr c,ld2e9h		;d367
	ld b,b			;d369
	add a,b			;d36a
	ld c,b			;d36b
	add a,b			;d36c
	ld d,b			;d36d
	add a,b			;d36e
	ld e,b			;d36f
	ld a,b			;d370
	ld e,b			;d371
	ld a,b			;d372
	ld h,b			;d373
	ld (hl),b		;d374
	ld h,b			;d375
	ld (hl),b		;d376
	ld l,b			;d377
	ld l,b			;d378
	ld l,b			;d379
	ld h,b			;d37a
ld37bh:
	ld l,b			;d37b
	ld h,b			;d37c
ld37dh:
	ld (hl),b		;d37d
	ld e,b			;d37e
ld37fh:
	ld (hl),b		;d37f
	ld e,b			;d380
ld381h:
	ld a,b			;d381
	ld d,b			;d382
ld383h:
	ld a,b			;d383
	ld d,b			;d384
	add a,b			;d385
	ld c,b			;d386
ld387h:
	add a,b			;d387
	ld b,b			;d388
	add a,b			;d389
	ld b,b			;d38a
	adc a,b			;d38b
	ld b,b			;d38c
	sub b			;d38d
	ld b,b			;d38e
	sbc a,b			;d38f
	ld b,b			;d390
ld391h:
	and b			;d391
	ld b,b			;d392
ld393h:
	xor b			;d393
	ld b,b			;d394
ld395h:
	or b			;d395
	ld b,b			;d396
ld397h:
	cp b			;d397
	ld c,b			;d398
ld399h:
	cp b			;d399
	ld d,b			;d39a
	cp b			;d39b
	ld e,b			;d39c
	cp b			;d39d
	ld h,b			;d39e
	cp b			;d39f
	ld h,b			;d3a0
	or b			;d3a1
	ld l,b			;d3a2
ld3a3h:
	or b			;d3a3
	ld (hl),b		;d3a4
ld3a5h:
	or b			;d3a5
	ld a,b			;d3a6
	or b			;d3a7
	ld a,b			;d3a8
	xor b			;d3a9
	add a,b			;d3aa
	xor b			;d3ab
	add a,b			;d3ac
	and b			;d3ad
	add a,b			;d3ae
	sbc a,b			;d3af
	add a,b			;d3b0
	sub b			;d3b1
	add a,b			;d3b2
	adc a,b			;d3b3
	add a,b			;d3b4
	add a,b			;d3b5
	add a,b			;d3b6
	ld a,b			;d3b7
	add a,b			;d3b8
	ld (hl),b		;d3b9
	add a,b			;d3ba
	ld l,b			;d3bb
	add a,b			;d3bc
	ld h,b			;d3bd
	ld a,b			;d3be
	ld h,b			;d3bf
	ld a,b			;d3c0
	ld e,b			;d3c1
	ld (hl),b		;d3c2
	ld e,b			;d3c3
	ld l,b			;d3c4
	ld e,b			;d3c5
	ld l,b			;d3c6
	ld d,b			;d3c7
	ld h,b			;d3c8
	ld d,b			;d3c9
	ld h,b			;d3ca
	ld c,b			;d3cb
	ld e,b			;d3cc
	ld c,b			;d3cd
	ld e,b			;d3ce
	ld b,b			;d3cf
	ld d,b			;d3d0
	ld b,b			;d3d1
	ld d,b			;d3d2
	jr c,ld41dh		;d3d3
	jr c,ld41fh		;d3d5
	jr nc,ld419h		;d3d7
	jr nc,ld41bh		;d3d9
	jr z,ld41dh		;d3db
	jr nz,ld427h		;d3dd
	jr nz,ld429h		;d3df
	jr ld433h		;d3e1
	jr ld435h		;d3e3
	djnz ld43fh		;d3e5
	djnz ld441h		;d3e7
	ex af,af'		;d3e9
	ld h,b			;d3ea
	ex af,af'		;d3eb
	ld h,b			;d3ec
	nop			;d3ed
	ld l,b			;d3ee
	nop			;d3ef
	ld (hl),b		;d3f0
	nop			;d3f1
	ld a,b			;d3f2
	nop			;d3f3
	add a,b			;d3f4
	nop			;d3f5
	add a,b			;d3f6
	ex af,af'		;d3f7
sub_d3f8h:
	add a,b			;d3f8
	djnz ld37bh		;d3f9
	jr ld37dh		;d3fb
	jr nz,ld37fh		;d3fd
	jr z,ld381h		;d3ff
ld401h:
	jr nc,ld383h		;d401
	jr c,ld47dh		;d403
	jr c,ld47fh		;d405
	ld b,b			;d407
	ld (hl),b		;d408
	ld b,b			;d409
	ld (hl),b		;d40a
	ld c,b			;d40b
	ld l,b			;d40c
	ld c,b			;d40d
	ld l,b			;d40e
	ld d,b			;d40f
	ld h,b			;d410
	ld d,b			;d411
	ld h,b			;d412
ld413h:
	ld e,b			;d413
	ld e,b			;d414
ld415h:
	ld e,b			;d415
	ld e,b			;d416
ld417h:
	ld h,b			;d417
	ld d,b			;d418
ld419h:
	ld h,b			;d419
	ld d,b			;d41a
ld41bh:
	ld l,b			;d41b
	ld c,b			;d41c
ld41dh:
	ld l,b			;d41d
	ld c,b			;d41e
ld41fh:
	ld (hl),b		;d41f
	ld b,b			;d420
	ld (hl),b		;d421
	ld b,b			;d422
	ld a,b			;d423
	ld b,b			;d424
	add a,b			;d425
	ld c,b			;d426
ld427h:
	add a,b			;d427
	ld c,b			;d428
ld429h:
	adc a,b			;d429
	ld c,b			;d42a
	sub b			;d42b
	ld c,b			;d42c
	sbc a,b			;d42d
	ld d,b			;d42e
	sbc a,b			;d42f
	ld d,b			;d430
	and b			;d431
	ld d,b			;d432
ld433h:
	xor b			;d433
	ld d,b			;d434
ld435h:
	or b			;d435
	ld e,b			;d436
	or b			;d437
	ld h,b			;d438
	or b			;d439
	ld l,b			;d43a
	or b			;d43b
	ld l,b			;d43c
	xor b			;d43d
	ld (hl),b		;d43e
ld43fh:
	xor b			;d43f
	ld (hl),b		;d440
ld441h:
	and b			;d441
	ld a,b			;d442
	and b			;d443
	ld a,b			;d444
	sbc a,b			;d445
	add a,b			;d446
	sbc a,b			;d447
	add a,b			;d448
	sub b			;d449
	add a,b			;d44a
	adc a,b			;d44b
	add a,b			;d44c
	add a,b			;d44d
	add a,b			;d44e
	ld a,b			;d44f
	add a,b			;d450
	ld (hl),b		;d451
	add a,b			;d452
	ld l,b			;d453
	ld a,b			;d454
	ld l,b			;d455
	ld a,b			;d456
	ld h,b			;d457
	ld (hl),b		;d458
	ld h,b			;d459
	ld (hl),b		;d45a
	ld e,b			;d45b
	ld l,b			;d45c
	ld e,b			;d45d
	ld l,b			;d45e
	ld d,b			;d45f
	ld h,b			;d460
	ld d,b			;d461
	ld h,b			;d462
	ld c,b			;d463
	ld e,b			;d464
	ld c,b			;d465
	ld e,b			;d466
	ld b,b			;d467
	ld d,b			;d468
	ld b,b			;d469
ld46ah:
	ld d,b			;d46a
	jr c,ld4b5h		;d46b
	jr c,ld4b7h		;d46d
	jr nc,ld4b1h		;d46f
	jr nc,ld4b3h		;d471
	jr z,ld4b5h		;d473
	jr nz,ld4b7h		;d475
	jr ld4b9h		;d477
	djnz ld4c3h		;d479
	djnz ld4c5h		;d47b
ld47dh:
	ex af,af'		;d47d
	ld d,b			;d47e
ld47fh:
	ex af,af'		;d47f
	ld d,b			;d480
	nop			;d481
	ld e,b			;d482
	nop			;d483
	ld h,b			;d484
	nop			;d485
	ld l,b			;d486
	nop			;d487
	ld l,b			;d488
	ex af,af'		;d489
	ld (hl),b		;d48a
	ex af,af'		;d48b
	ld (hl),b		;d48c
	djnz ld507h		;d48d
	djnz ld509h		;d48f
	jr ld413h		;d491
	jr ld415h		;d493
	jr nz,ld417h		;d495
	jr z,ld419h		;d497
	jr nc,ld41bh		;d499
	jr c,ld41dh		;d49b
	ld b,b			;d49d
	add a,b			;d49e
	ld c,b			;d49f
	add a,b			;d4a0
	ld d,b			;d4a1
	add a,b			;d4a2
	ld e,b			;d4a3
	add a,b			;d4a4
	ld h,b			;d4a5
	add a,b			;d4a6
	ld l,b			;d4a7
	add a,b			;d4a8
	ld (hl),b		;d4a9
	add a,b			;d4aa
	ld a,b			;d4ab
	add a,b			;d4ac
	add a,b			;d4ad
	add a,b			;d4ae
	adc a,b			;d4af
	add a,b			;d4b0
ld4b1h:
	sub b			;d4b1
	ld a,b			;d4b2
ld4b3h:
	sub b			;d4b3
	ld (hl),b		;d4b4
ld4b5h:
	sub b			;d4b5
	ld (hl),b		;d4b6
ld4b7h:
	adc a,b			;d4b7
	ld l,b			;d4b8
ld4b9h:
	adc a,b			;d4b9
	ld h,b			;d4ba
	adc a,b			;d4bb
	ld h,b			;d4bc
	add a,b			;d4bd
	ld e,b			;d4be
sub_d4bfh:
	add a,b			;d4bf
	ld d,b			;d4c0
	add a,b			;d4c1
	ld c,b			;d4c2
ld4c3h:
	add a,b			;d4c3
	ld c,b			;d4c4
ld4c5h:
	ld a,b			;d4c5
	ld b,b			;d4c6
	ld a,b			;d4c7
	ld b,b			;d4c8
	ld (hl),b		;d4c9
	ld b,b			;d4ca
	ld l,b			;d4cb
	ld b,b			;d4cc
	ld h,b			;d4cd
	ld b,b			;d4ce
	ld e,b			;d4cf
	ld b,b			;d4d0
	ld d,b			;d4d1
	ld b,b			;d4d2
	ld c,b			;d4d3
	ld b,b			;d4d4
	ld b,b			;d4d5
	ld b,b			;d4d6
	jr c,ld521h		;d4d7
	jr c,ld523h		;d4d9
	jr nc,ld52dh		;d4db
	jr nc,ld52fh		;d4dd
	jr z,ld539h		;d4df
	jr z,ld53bh		;d4e1
	jr nc,ld535h		;d4e3
	jr nc,ld537h		;d4e5
	jr c,ld531h		;d4e7
	jr c,ld533h		;d4e9
	ld b,b			;d4eb
	ld d,b			;d4ec
	ld b,b			;d4ed
	ld d,b			;d4ee
	ld c,b			;d4ef
	ld e,b			;d4f0
	ld c,b			;d4f1
	ld e,b			;d4f2
	ld d,b			;d4f3
	ld h,b			;d4f4
	ld d,b			;d4f5
	ld h,b			;d4f6
	ld e,b			;d4f7
	ld e,b			;d4f8
	ld e,b			;d4f9
	ld e,b			;d4fa
	ld h,b			;d4fb
	ld e,b			;d4fc
	ld l,b			;d4fd
	ld e,b			;d4fe
	ld (hl),b		;d4ff
ld500h:
	ld d,b			;d500
	ld (hl),b		;d501
	ld d,b			;d502
	ld a,b			;d503
	ld c,b			;d504
	ld a,b			;d505
	ld c,b			;d506
ld507h:
	add a,b			;d507
	ld b,b			;d508
ld509h:
	add a,b			;d509
	ld b,b			;d50a
	adc a,b			;d50b
	ld b,b			;d50c
	sub b			;d50d
	ld b,b			;d50e
	sbc a,b			;d50f
	ld b,b			;d510
	and b			;d511
	ld b,b			;d512
	xor b			;d513
	ld b,b			;d514
	or b			;d515
	ld b,b			;d516
	cp b			;d517
	ld c,b			;d518
	cp b			;d519
	ld d,b			;d51a
	cp b			;d51b
	ld e,b			;d51c
	cp b			;d51d
	ld h,b			;d51e
	cp b			;d51f
	ld l,b			;d520
ld521h:
	cp b			;d521
	ld (hl),b		;d522
ld523h:
	cp b			;d523
	ld a,b			;d524
	cp b			;d525
	add a,b			;d526
	cp b			;d527
	nop			;d528
	nop			;d529
	nop			;d52a
	nop			;d52b
	nop			;d52c
ld52dh:
	nop			;d52d
	nop			;d52e
ld52fh:
	nop			;d52f
	nop			;d530
ld531h:
	nop			;d531
	nop			;d532
ld533h:
	nop			;d533
	nop			;d534
ld535h:
	nop			;d535
	nop			;d536
ld537h:
	nop			;d537
	nop			;d538
ld539h:
	nop			;d539
	nop			;d53a
ld53bh:
	nop			;d53b
	nop			;d53c
	nop			;d53d
	nop			;d53e
	nop			;d53f
	nop			;d540
	nop			;d541
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
	nop			;d56f
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
	nop			;d57d
	nop			;d57e
	nop			;d57f
	nop			;d580
	nop			;d581
	nop			;d582
	nop			;d583
	nop			;d584
	nop			;d585
	nop			;d586
	nop			;d587
	nop			;d588
	nop			;d589
ld58ah:
	nop			;d58a
	nop			;d58b
	nop			;d58c
	nop			;d58d
	nop			;d58e
	nop			;d58f
	nop			;d590
	nop			;d591
	nop			;d592
	nop			;d593
	nop			;d594
	nop			;d595
	nop			;d596
	nop			;d597
	nop			;d598
	nop			;d599
	nop			;d59a
	nop			;d59b
	nop			;d59c
	nop			;d59d
	nop			;d59e
	nop			;d59f
	nop			;d5a0
	nop			;d5a1
	nop			;d5a2
	nop			;d5a3
	nop			;d5a4
	nop			;d5a5
	nop			;d5a6
	nop			;d5a7
	nop			;d5a8
	nop			;d5a9
sub_d5aah:
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
	nop			;d5cf
	nop			;d5d0
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
sub_d5dbh:
	nop			;d5db
	nop			;d5dc
	nop			;d5dd
	nop			;d5de
ld5dfh:
	nop			;d5df
	nop			;d5e0
	nop			;d5e1
	nop			;d5e2
	nop			;d5e3
	nop			;d5e4
	nop			;d5e5
	nop			;d5e6
	nop			;d5e7
	nop			;d5e8
	nop			;d5e9
	nop			;d5ea
	nop			;d5eb
	nop			;d5ec
	nop			;d5ed
	nop			;d5ee
	nop			;d5ef
	nop			;d5f0
	nop			;d5f1
	nop			;d5f2
	nop			;d5f3
	nop			;d5f4
	nop			;d5f5
	nop			;d5f6
	nop			;d5f7
	nop			;d5f8
	nop			;d5f9
	nop			;d5fa
	nop			;d5fb
	nop			;d5fc
	nop			;d5fd
	nop			;d5fe
	nop			;d5ff
	nop			;d600
	nop			;d601
	nop			;d602
	nop			;d603
	nop			;d604
	nop			;d605
sub_d606h:
	ld hl,le60ch		;d606
	ld de,05082h		;d609
	call sub_d630h		;d60c
	ld a,000h		;d60f
	ld (ld652h),a		;d611
	ld hl,05082h		;d614
	ld (ld653h),hl		;d617
	ret			;d61a
sub_d61bh:
	ld hl,le654h		;d61b
	ld de,0509bh		;d61e
	call sub_d630h		;d621
	ld a,000h		;d624
	ld (ld68fh),a		;d626
	ld hl,0509bh		;d629
	ld (ld690h),hl		;d62c
	ret			;d62f
sub_d630h:
	ld b,003h		;d630
ld632h:
	ld c,008h		;d632
ld634h:
	push bc			;d634
	push de			;d635
	ld bc,00003h		;d636
	ldir			;d639
	pop de			;d63b
	inc d			;d63c
	pop bc			;d63d
	dec c			;d63e
	jr nz,ld634h		;d63f
	call sub_d647h		;d641
	djnz ld632h		;d644
	ret			;d646
sub_d647h:
	push hl			;d647
	ld hl,007e0h		;d648
	ex de,hl		;d64b
	and a			;d64c
	sbc hl,de		;d64d
	ex de,hl		;d64f
ld650h:
	pop hl			;d650
	ret			;d651
ld652h:
	nop			;d652
ld653h:
	add a,d			;d653
	ld d,b			;d654
sub_d655h:
	ld de,(ld653h)		;d655
	ld a,(ld652h)		;d659
	inc a			;d65c
	ld (ld652h),a		;d65d
	cp 009h			;d660
	call z,sub_d679h	;d662
	push de			;d665
	ld b,003h		;d666
	ld a,000h		;d668
ld66ah:
	ld (de),a		;d66a
	inc de			;d66b
	djnz ld66ah		;d66c
	pop de			;d66e
	inc d			;d66f
	ld (ld653h),de		;d670
	ld bc,(ld653h)		;d674
	ret			;d678
sub_d679h:
	ld a,001h		;d679
	ld (ld652h),a		;d67b
ld67eh:
	ld hl,007e0h		;d67e
	ex de,hl		;d681
	and a			;d682
	sbc hl,de		;d683
	ex de,hl		;d685
	ret			;d686
sub_d687h:
	ld a,001h		;d687
	ld (ld68fh),a		;d689
	jp ld67eh		;d68c
ld68fh:
	nop			;d68f
ld690h:
	sbc a,e			;d690
	ld d,b			;d691
sub_d692h:
	ld de,(ld690h)		;d692
	ld a,(ld68fh)		;d696
	inc a			;d699
	ld (ld68fh),a		;d69a
	cp 009h			;d69d
	call z,sub_d687h	;d69f
	push de			;d6a2
	ld b,003h		;d6a3
	ld a,000h		;d6a5
ld6a7h:
	ld (de),a		;d6a7
	inc de			;d6a8
	djnz ld6a7h		;d6a9
	pop de			;d6ab
	inc d			;d6ac
	ld (ld690h),de		;d6ad
	ret			;d6b1
	nop			;d6b2
	nop			;d6b3
	nop			;d6b4
	nop			;d6b5
	nop			;d6b6
	nop			;d6b7
	nop			;d6b8
	nop			;d6b9
	nop			;d6ba
	nop			;d6bb
	nop			;d6bc
	nop			;d6bd
	nop			;d6be
	nop			;d6bf
	nop			;d6c0
	nop			;d6c1
	nop			;d6c2
	nop			;d6c3
	nop			;d6c4
	nop			;d6c5
	nop			;d6c6
	nop			;d6c7
	nop			;d6c8
	nop			;d6c9
	nop			;d6ca
	nop			;d6cb
	nop			;d6cc
	nop			;d6cd
	nop			;d6ce
	nop			;d6cf
	nop			;d6d0
	nop			;d6d1
	nop			;d6d2
	nop			;d6d3
	nop			;d6d4
	nop			;d6d5
	nop			;d6d6
	nop			;d6d7
	inc de			;d6d8
sub_d6d9h:
	nop			;d6d9
	ld c,000h		;d6da
	ld (bc),a		;d6dc
	ld bc,00408h		;d6dd
	nop			;d6e0
	nop			;d6e1
	ld (bc),a		;d6e2
	ld bc,00308h		;d6e3
	ld bc,00800h		;d6e6
	ld (bc),a		;d6e9
	inc b			;d6ea
ld6ebh:
	inc b			;d6eb
	ld a,(bc)		;d6ec
	ld bc,00102h		;d6ed
	ld bc,0080ch		;d6f0
	ld (bc),a		;d6f3
	ld bc,00a10h		;d6f4
	ld bc,00303h		;d6f7
	ld bc,0081ch		;d6fa
ld6fdh:
	inc l			;d6fd
	ld bc,l900dh		;d6fe
	dec b			;d701
	inc l			;d702
	ld bc,l920ch		;d703
	dec b			;d706
	ld (bc),a		;d707
	ld bc,0012ch		;d708
	inc bc			;d70b
	sub b			;d70c
	dec b			;d70d
	dec hl			;d70e
	inc b			;d70f
	nop			;d710
	ld (bc),a		;d711
	ld (bc),a		;d712
	inc b			;d713
	dec hl			;d714
	inc bc			;d715
	djnz $+4		;d716
	ld bc,02b0ch		;d718
	inc b			;d71b
	inc c			;d71c
	ld (bc),a		;d71d
	ld (bc),a		;d71e
	inc d			;d71f
	dec hl			;d720
	ld b,000h		;d721
	ld (bc),a		;d723
	ex af,af'		;d724
	jr nz,ld73ah		;d725
	ld a,(bc)		;d727
	add hl,de		;d728
	nop			;d729
	dec b			;d72a
	dec c			;d72b
	ld a,(bc)		;d72c
	nop			;d72d
	ld b,007h		;d72e
	dec bc			;d730
	ld a,(bc)		;d731
	inc bc			;d732
	ld bc,00507h		;d733
	dec bc			;d736
	ex af,af'		;d737
	rrca			;d738
	inc b			;d739
ld73ah:
	ld (de),a		;d73a
	nop			;d73b
	inc de			;d73c
	inc b			;d73d
	nop			;d73e
	nop			;d73f
	ld (bc),a		;d740
	ld bc,00008h		;d741
	ld c,000h		;d744
	ld (bc),a		;d746
	ld bc,00808h		;d747
	ld c,00dh		;d74a
	nop			;d74c
	ld bc,00001h		;d74d
	ex af,af'		;d750
	ld (bc),a		;d751
	ld bc,00a04h		;d752
	ld bc,00303h		;d755
	ld bc,00810h		;d758
	ld (bc),a		;d75b
	inc bc			;d75c
	inc d			;d75d
	ld a,(bc)		;d75e
	ld bc,00102h		;d75f
	ld bc,0081bh		;d762
	ld (bc),a		;d765
	ld bc,0081fh		;d766
	dec hl			;d769
	inc bc			;d76a
	inc b			;d76b
	ld (bc),a		;d76c
	ld bc,02b0ch		;d76d
	inc b			;d770
	nop			;d771
	ld (bc),a		;d772
	ld bc,02b14h		;d773
	inc bc			;d776
	rra			;d777
	nop			;d778
	dec hl			;d779
	inc b			;d77a
	inc e			;d77b
	ld (bc),a		;d77c
	ld bc,02b04h		;d77d
	dec b			;d780
	nop			;d781
	ld (bc),a		;d782
	add hl,bc		;d783
	jr nz,ld78bh		;d784
	dec c			;d786
	rla			;d787
	nop			;d788
	ld b,007h		;d789
ld78bh:
	jr ld797h		;d78b
	inc bc			;d78d
	ld bc,00507h		;d78e
	jr ld79bh		;d791
	rrca			;d793
	dec b			;d794
	dec bc			;d795
	nop			;d796
ld797h:
	inc de			;d797
	ld a,(bc)		;d798
	inc b			;d799
	nop			;d79a
ld79bh:
	ld de,00004h		;d79b
	nop			;d79e
	ld (bc),a		;d79f
	ld bc,00008h		;d7a0
	ld c,000h		;d7a3
	ld (bc),a		;d7a5
	ld bc,00808h		;d7a6
	ld c,000h		;d7a9
ld7abh:
	nop			;d7ab
	ld (bc),a		;d7ac
	inc bc			;d7ad
	nop			;d7ae
	ld a,(bc)		;d7af
	ld bc,00304h		;d7b0
	ld (bc),a		;d7b3
	djnz ld7beh		;d7b4
	ld bc,01402h		;d7b6
	ex af,af'		;d7b9
	ld bc,01700h		;d7ba
	ex af,af'		;d7bd
ld7beh:
	dec hl			;d7be
	nop			;d7bf
	dec de			;d7c0
	ld (bc),a		;d7c1
	inc bc			;d7c2
	dec b			;d7c3
	dec hl			;d7c4
	inc bc			;d7c5
	jr ld7cah		;d7c6
	ld (bc),a		;d7c8
	ex af,af'		;d7c9
ld7cah:
	dec hl			;d7ca
	dec b			;d7cb
	nop			;d7cc
	ld (bc),a		;d7cd
	add hl,bc		;d7ce
	jr nz,$+46		;d7cf
	nop			;d7d1
	rla			;d7d2
	sub c			;d7d3
	dec b			;d7d4
	inc l			;d7d5
	ld (bc),a		;d7d6
	ld (de),a		;d7d7
	sub d			;d7d8
	dec b			;d7d9
	ld bc,01604h		;d7da
	ld a,(bc)		;d7dd
	inc c			;d7de
	ex af,af'		;d7df
	dec d			;d7e0
	dec b			;d7e1
	ld a,(bc)		;d7e2
	ex af,af'		;d7e3
	inc de			;d7e4
	inc b			;d7e5
	inc de			;d7e6
	nop			;d7e7
	dec b			;d7e8
	dec c			;d7e9
	dec de			;d7ea
	nop			;d7eb
	ld b,000h		;d7ec
	inc e			;d7ee
	ld a,(bc)		;d7ef
	rlca			;d7f0
	ld bc,00011h		;d7f1
	ld c,000h		;d7f4
	ld (bc),a		;d7f6
	ld bc,01a08h		;d7f7
	nop			;d7fa
	ld bc,00102h		;d7fb
	dec b			;d7fe
	dec de			;d7ff
	ld b,001h		;d800
	ld (bc),a		;d802
sub_d803h:
	inc b			;d803
	dec b			;d804
	dec hl			;d805
	nop			;d806
	nop			;d807
	ld (bc),a		;d808
	ld c,001h		;d809
	inc bc			;d80b
	inc b			;d80c
	ld bc,00308h		;d80d
	dec b			;d810
	inc bc			;d811
	ex af,af'		;d812
	inc de			;d813
	ex af,af'		;d814
	inc b			;d815
	nop			;d816
	inc bc			;d817
	dec bc			;d818
	rlca			;d819
	ex af,af'		;d81a
	dec hl			;d81b
	ex af,af'		;d81c
	ld bc,00602h		;d81d
	inc bc			;d820
	dec hl			;d821
	inc c			;d822
	inc b			;d823
	ld (bc),a		;d824
	ld (bc),a		;d825
	inc bc			;d826
	dec hl			;d827
	rlca			;d828
	ld bc,00101h		;d829
	dec bc			;d82c
	dec bc			;d82d
	ex af,af'		;d82e
	ld (bc),a		;d82f
	dec bc			;d830
	rrca			;d831
	ex af,af'		;d832
	inc bc			;d833
	dec bc			;d834
	ld (de),a		;d835
	ex af,af'		;d836
	dec hl			;d837
	dec c			;d838
	rrca			;d839
	ld (bc),a		;d83a
	ld bc,02b03h		;d83b
	nop			;d83e
	rra			;d83f
	ld (bc),a		;d840
	ld c,001h		;d841
	ld bc,01b0bh		;d843
	ex af,af'		;d846
	inc d			;d847
	nop			;d848
	ld c,000h		;d849
	ld (bc),a		;d84b
	ld bc,02b08h		;d84c
	nop			;d84f
	nop			;d850
	ld (bc),a		;d851
	ld c,020h		;d852
	ld a,(de)		;d854
	nop			;d855
	nop			;d856
	ld bc,0061bh		;d857
	nop			;d85a
	ld bc,00602h		;d85b
	nop			;d85e
	ex af,af'		;d85f
	ld bc,00204h		;d860
	ex af,af'		;d863
	ld (bc),a		;d864
	inc b			;d865
	dec b			;d866
	ex af,af'		;d867
	ld bc,00801h		;d868
	ex af,af'		;d86b
	dec hl			;d86c
	inc b			;d86d
	add hl,bc		;d86e
	ld (bc),a		;d86f
	inc b			;d870
	inc bc			;d871
	dec hl			;d872
	rlca			;d873
	inc b			;d874
	ld (bc),a		;d875
	ld bc,02b06h		;d876
	ld b,006h		;d879
	ld (bc),a		;d87b
	ld bc,00904h		;d87c
	ld bc,0010bh		;d87f
	ld a,(bc)		;d882
	dec b			;d883
	dec bc			;d884
	inc bc			;d885
	inc bc			;d886
	ld bc,00b0bh		;d887
	ld de,00b01h		;d88a
	dec bc			;d88d
	dec bc			;d88e
	ld bc,0090ch		;d88f
	dec c			;d892
	ld bc,0100dh		;d893
	ld a,(bc)		;d896
	ld bc,00e0eh		;d897
	dec bc			;d89a
	ld bc,00d05h		;d89b
	jr ld8a0h		;d89e
ld8a0h:
	ld b,000h		;d8a0
	add hl,de		;d8a2
	ld a,(bc)		;d8a3
	rlca			;d8a4
	ld bc,01715h		;d8a5
	nop			;d8a8
	dec bc			;d8a9
	inc b			;d8aa
	jr $+10			;d8ab
	rlca			;d8ad
	inc b			;d8ae
	nop			;d8af
	ld c,000h		;d8b0
	ld (bc),a		;d8b2
	ld bc,00308h		;d8b3
	nop			;d8b6
	nop			;d8b7
	ex af,af'		;d8b8
	inc bc			;d8b9
	inc bc			;d8ba
	inc b			;d8bb
	ex af,af'		;d8bc
	inc d			;d8bd
	ld b,006h		;d8be
	nop			;d8c0
	inc bc			;d8c1
	ex af,af'		;d8c2
	ex af,af'		;d8c3
	ex af,af'		;d8c4
	inc bc			;d8c5
	dec bc			;d8c6
	inc c			;d8c7
	ex af,af'		;d8c8
	ld bc,0100bh		;d8c9
	ex af,af'		;d8cc
	ld (bc),a		;d8cd
	dec bc			;d8ce
	inc de			;d8cf
	ex af,af'		;d8d0
	ld bc,01608h		;d8d1
	ex af,af'		;d8d4
ld8d5h:
	ld (bc),a		;d8d5
	ex af,af'		;d8d6
	ld a,(de)		;d8d7
	ex af,af'		;d8d8
	ld bc,01c06h		;d8d9
	ex af,af'		;d8dc
	dec hl			;d8dd
	inc bc			;d8de
	nop			;d8df
	ld (bc),a		;d8e0
	dec bc			;d8e1
	inc b			;d8e2
	dec hl			;d8e3
	ld b,004h		;d8e4
	ld (bc),a		;d8e6
	ex af,af'		;d8e7
	ld (bc),a		;d8e8
	dec hl			;d8e9
	dec bc			;d8ea
	ld b,002h		;d8eb
	inc bc			;d8ed
	ld b,02bh		;d8ee
	ld a,(bc)		;d8f0
	ld b,001h		;d8f1
	dec hl			;d8f3
	ld a,(bc)		;d8f4
	rla			;d8f5
	ld (bc),a		;d8f6
	inc b			;d8f7
	add hl,bc		;d8f8
	dec hl			;d8f9
	dec c			;d8fa
	inc d			;d8fb
	ld (bc),a		;d8fc
	ld bc,02b03h		;d8fd
ld900h:
	add hl,bc		;d900
	ld e,001h		;d901
	ex af,af'		;d903
	ld c,00ah		;d904
	nop			;d906
	jr ld909h		;d907
ld909h:
	ld c,000h		;d909
	ld (bc),a		;d90b
	ld bc,00808h		;d90c
	ld c,001h		;d90f
	nop			;d911
	ex af,af'		;d912
	ld c,00bh		;d913
	nop			;d915
	ex af,af'		;d916
	ld c,014h		;d917
	nop			;d919
	inc bc			;d91a
	inc b			;d91b
	nop			;d91c
	ex af,af'		;d91d
	ld (bc),a		;d91e
	rlca			;d91f
	inc b			;d920
	ex af,af'		;d921
	ld (bc),a		;d922
	rlca			;d923
	ex af,af'		;d924
	ex af,af'		;d925
	ld bc,00c04h		;d926
	ex af,af'		;d929
	ld (bc),a		;d92a
	inc b			;d92b
	djnz ld936h		;d92c
	inc bc			;d92e
	inc b			;d92f
	inc d			;d930
	ex af,af'		;d931
	inc bc			;d932
	rlca			;d933
	jr ld93eh		;d934
ld936h:
	ld bc,01c07h		;d936
	ex af,af'		;d939
	dec hl			;d93a
	ld a,(bc)		;d93b
	nop			;d93c
	ld (bc),a		;d93d
ld93eh:
	inc b			;d93e
	jr nz,ld96ch		;d93f
	rlca			;d941
	nop			;d942
	ld (bc),a		;d943
	inc bc			;d944
	inc b			;d945
	dec hl			;d946
	rlca			;d947
	inc c			;d948
	ld (bc),a		;d949
	inc bc			;d94a
	inc c			;d94b
	dec hl			;d94c
	add hl,bc		;d94d
	inc b			;d94e
	ld (bc),a		;d94f
	ld bc,02b08h		;d950
	ld b,010h		;d953
	ld (bc),a		;d955
	ld bc,00504h		;d956
	dec c			;d959
	rlca			;d95a
	nop			;d95b
	ld b,005h		;d95c
	ex af,af'		;d95e
	ld a,(bc)		;d95f
	inc b			;d960
	ld bc,00307h		;d961
	ex af,af'		;d964
	ex af,af'		;d965
	dec b			;d966
	dec c			;d967
	djnz ld96ah		;d968
ld96ah:
	ld b,000h		;d96a
ld96ch:
	ld de,0070ah		;d96c
	ld bc,00d05h		;d96f
	dec de			;d972
	nop			;d973
	ld b,000h		;d974
	inc e			;d976
	ld a,(bc)		;d977
	rlca			;d978
	ld bc,00016h		;d979
	ld c,000h		;d97c
	ld (bc),a		;d97e
	ld bc,02508h		;d97f
	nop			;d982
	ld e,002h		;d983
	inc b			;d985
	ld bc,00f25h		;d986
	ld e,000h		;d989
	inc h			;d98b
	djnz ld9a8h		;d98c
	ex af,af'		;d98e
	dec h			;d98f
	nop			;d990
	add hl,de		;d991
	ld (bc),a		;d992
	inc bc			;d993
	ld bc,00a25h		;d994
	add hl,de		;d997
	nop			;d998
	dec l			;d999
	nop			;d99a
	ld a,(de)		;d99b
	add a,d			;d99c
	ccf			;d99d
	djnz ld9a4h		;d99e
	dec hl			;d9a0
	nop			;d9a1
	ld d,002h		;d9a2
ld9a4h:
	ld c,003h		;d9a4
	ld h,000h		;d9a6
ld9a8h:
	rla			;d9a8
	ex af,af'		;d9a9
	ld bc,01200h		;d9aa
	ex af,af'		;d9ad
ld9aeh:
	ld bc,00e03h		;d9ae
	ex af,af'		;d9b1
	ld (bc),a		;d9b2
	ld b,00ah		;d9b3
	ex af,af'		;d9b5
	ld bc,00606h		;d9b6
	ex af,af'		;d9b9
	inc bc			;d9ba
	ld b,002h		;d9bb
	ex af,af'		;d9bd
	inc bc			;d9be
	inc b			;d9bf
	nop			;d9c0
	ex af,af'		;d9c1
	dec hl			;d9c2
	add hl,bc		;d9c3
	nop			;d9c4
	ld (bc),a		;d9c5
	dec b			;d9c6
	ld d,02bh		;d9c7
	inc bc			;d9c9
	ld (de),a		;d9ca
	ld (bc),a		;d9cb
	ld b,004h		;d9cc
	dec hl			;d9ce
	ld b,00eh		;d9cf
	ld (bc),a		;d9d1
	inc bc			;d9d2
	inc b			;d9d3
	dec hl			;d9d4
	rlca			;d9d5
	nop			;d9d6
	ld (bc),a		;d9d7
	ld (bc),a		;d9d8
	ld (bc),a		;d9d9
	dec hl			;d9da
	ex af,af'		;d9db
	ld a,(bc)		;d9dc
	ld (bc),a		;d9dd
	ld bc,01d04h		;d9de
	dec c			;d9e1
	nop			;d9e2
	ld (bc),a		;d9e3
	ld bc,01d04h		;d9e4
	dec c			;d9e7
	djnz $+4		;d9e8
sub_d9eah:
	ld bc,01002h		;d9ea
	inc e			;d9ed
	dec c			;d9ee
	nop			;d9ef
	ld (bc),a		;d9f0
	ld bc,01d08h		;d9f1
	inc c			;d9f4
	nop			;d9f5
	ld (bc),a		;d9f6
	ld bc,02b08h		;d9f7
	inc bc			;d9fa
	nop			;d9fb
	ld (bc),a		;d9fc
	add hl,bc		;d9fd
	jr nz,$+4		;d9fe
lda00h:
	nop			;da00
	ld b,008h		;da01
	inc bc			;da03
	nop			;da04
	ld a,(bc)		;da05
	ex af,af'		;da06
	ld bc,00d00h		;da07
	ex af,af'		;da0a
	dec hl			;da0b
	nop			;da0c
	ld de,00302h		;da0d
	ld de,0002bh		;da10
	nop			;da13
	ld (bc),a		;da14
	inc bc			;da15
	ld b,02bh		;da16
	ld (bc),a		;da18
	ld b,002h		;da19
	ld bc,02004h		;da1b
	add hl,bc		;da1e
	ld c,008h		;da1f
	ld e,002h		;da21
	rla			;da23
	nop			;da24
	inc de			;da25
	ex af,af'		;da26
	inc bc			;da27
	nop			;da28
	inc d			;da29
	inc b			;da2a
	ld bc,01400h		;da2b
	ex af,af'		;da2e
	ld e,000h		;da2f
	djnz lda35h		;da31
	rlca			;da33
	add hl,bc		;da34
lda35h:
	ld de,00708h		;da35
	add hl,bc		;da38
	ex af,af'		;da39
	inc bc			;da3a
	djnz lda4ch		;da3b
	ex af,af'		;da3d
	dec hl			;da3e
	ld (de),a		;da3f
	dec bc			;da40
	ld (bc),a		;da41
	ld bc,02c04h		;da42
	djnz lda4eh		;da45
	sub d			;da47
	ld b,002h		;da48
	inc bc			;da4a
	inc l			;da4b
lda4ch:
	djnz lda5fh		;da4c
lda4eh:
	sub d			;da4e
	ld b,002h		;da4f
	ld (bc),a		;da51
	rrca			;da52
	inc e			;da53
	dec c			;da54
	nop			;da55
	ld (bc),a		;da56
	ld bc,00108h		;da57
	nop			;da5a
	inc e			;da5b
	ex af,af'		;da5c
	inc bc			;da5d
	nop			;da5e
lda5fh:
	jr lda69h		;da5f
	dec hl			;da61
	nop			;da62
	nop			;da63
	ld (bc),a		;da64
	dec c			;da65
	jr lda93h		;da66
	inc bc			;da68
lda69h:
	jr lda6dh		;da69
	ld a,(bc)		;da6b
	ex af,af'		;da6c
lda6dh:
	dec e			;da6d
	inc c			;da6e
	nop			;da6f
	ld (bc),a		;da70
	ld bc,01f08h		;da71
	ld b,002h		;da74
	nop			;da76
	inc d			;da77
	inc bc			;da78
	ld bc,01300h		;da79
	ex af,af'		;da7c
	djnz lda7fh		;da7d
lda7fh:
	inc de			;da7f
	dec b			;da80
	rrca			;da81
	nop			;da82
	inc d			;da83
	ld bc,0000dh		;da84
	djnz lda8bh		;da87
	ld (de),a		;da89
	add hl,bc		;da8a
lda8bh:
	ld de,01208h		;da8b
	add hl,bc		;da8e
	jr nz,lda99h		;da8f
	add hl,bc		;da91
	ex af,af'		;da92
lda93h:
	jr nz,$+11		;da93
	jr lda9fh		;da95
lda97h:
	ld c,01ch		;da97
lda99h:
	dec c			;da99
	nop			;da9a
	ld (bc),a		;da9b
	ld bc,00308h		;da9c
lda9fh:
	nop			;da9f
	inc e			;daa0
	ex af,af'		;daa1
	dec hl			;daa2
	nop			;daa3
	nop			;daa4
	ld (bc),a		;daa5
	dec c			;daa6
	inc e			;daa7
	dec hl			;daa8
	inc bc			;daa9
	inc e			;daaa
	ld (bc),a		;daab
	ld a,(bc)		;daac
	inc b			;daad
	dec e			;daae
	inc c			;daaf
	nop			;dab0
	ld (bc),a		;dab1
	ld bc,01608h		;dab2
ldab5h:
	ld a,(bc)		;dab5
	ld a,(bc)		;dab6
	ex af,af'		;dab7
	dec d			;dab8
	dec b			;dab9
	ex af,af'		;daba
	ex af,af'		;dabb
	jr nz,ldabfh		;dabc
	add hl,bc		;dabe
ldabfh:
	ex af,af'		;dabf
	inc de			;dac0
	ex af,af'		;dac1
	inc b			;dac2
	nop			;dac3
	ld e,002h		;dac4
	ld (bc),a		;dac6
	nop			;dac7
	inc de			;dac8
	ex af,af'		;dac9
	inc d			;daca
	nop			;dacb
	inc d			;dacc
ldacdh:
	dec b			;dacd
	inc de			;dace
	nop			;dacf
	ld e,002h		;dad0
	ld d,000h		;dad2
	ld (bc),a		;dad4
ldad5h:
	nop			;dad5
	ld (de),a		;dad6
	ex af,af'		;dad7
	ld (de),a		;dad8
	inc e			;dad9
	dec c			;dada
	nop			;dadb
	ld (bc),a		;dadc
	ld bc,00308h		;dadd
	nop			;dae0
	nop			;dae1
	ex af,af'		;dae2
	daa			;dae3
	dec b			;dae4
	ld b,001h		;dae5
	jr z,$+12		;dae7
	nop			;dae9
	ld a,(bc)		;daea
	ld bc,00308h		;daeb
	inc bc			;daee
	inc b			;daef
	ex af,af'		;daf0
	inc bc			;daf1
	ld b,008h		;daf2
	ex af,af'		;daf4
	inc bc			;daf5
	add hl,bc		;daf6
	inc c			;daf7
	ex af,af'		;daf8
	dec hl			;daf9
	ld b,000h		;dafa
	ld (bc),a		;dafc
	rlca			;dafd
	ex af,af'		;dafe
	dec hl			;daff
	add hl,bc		;db00
	ex af,af'		;db01
	ld (bc),a		;db02
	inc b			;db03
	inc b			;db04
	dec hl			;db05
	inc bc			;db06
	nop			;db07
	ld (bc),a		;db08
	inc b			;db09
	inc b			;db0a
	dec hl			;db0b
	inc c			;db0c
	inc c			;db0d
	ld (bc),a		;db0e
	ld bc,01d04h		;db0f
	inc c			;db12
	nop			;db13
	ld (bc),a		;db14
	ld bc,01304h		;db15
	ex af,af'		;db18
	inc b			;db19
	nop			;db1a
	ld b,000h		;db1b
	inc bc			;db1d
	ld a,(bc)		;db1e
	rlca			;db1f
	ld bc,00006h		;db20
	add hl,bc		;db23
	ld a,(bc)		;db24
	rlca			;db25
	ld bc,00006h		;db26
	djnz ldb35h		;db29
	rlca			;db2b
	ld bc,00006h		;db2c
	rla			;db2f
	ld a,(bc)		;db30
	rlca			;db31
	ld bc,00006h		;db32
ldb35h:
	ld e,00ah		;db35
	rlca			;db37
	ld bc,01c14h		;db38
	dec c			;db3b
	nop			;db3c
	ld (bc),a		;db3d
	ld bc,02708h		;db3e
	dec b			;db41
	nop			;db42
	nop			;db43
	daa			;db44
	dec b			;db45
	dec c			;db46
	nop			;db47
	daa			;db48
	dec b			;db49
	inc de			;db4a
	nop			;db4b
	jr z,ldb58h		;db4c
	nop			;db4e
	ld a,(bc)		;db4f
	ld bc,02908h		;db50
	add hl,bc		;db53
	rlca			;db54
	ex af,af'		;db55
	add hl,hl		;db56
	add hl,bc		;db57
ldb58h:
	jr ldb62h		;db58
	ld bc,00a0ah		;db5a
	ex af,af'		;db5d
	ld (bc),a		;db5e
	ld a,(bc)		;db5f
	ld c,009h		;db60
ldb62h:
	inc bc			;db62
	ld a,(bc)		;db63
	ld d,008h		;db64
	dec hl			;db66
	inc c			;db67
	ld c,002h		;db68
	ld bc,00608h		;db6a
	nop			;db6d
	inc bc			;db6e
	ld a,(bc)		;db6f
	rlca			;db70
	ld bc,00006h		;db71
	ld a,(bc)		;db74
	ld a,(bc)		;db75
	rlca			;db76
	ld bc,00406h		;db77
	ld de,0050ah		;db7a
	ld bc,00207h		;db7d
	ld de,00608h		;db80
	ex af,af'		;db83
	jr ldb90h		;db84
	inc bc			;db86
	ld bc,00607h		;db87
	jr ldb94h		;db8a
	ld d,00ah		;db8c
	rlca			;db8e
	ex af,af'		;db8f
ldb90h:
	dec d			;db90
	dec b			;db91
	dec b			;db92
	ex af,af'		;db93
ldb94h:
	jr nz,$+3		;db94
	ld b,008h		;db96
	add hl,bc		;db98
	ld (00011h),hl		;db99
	ld (bc),a		;db9c
	ld bc,02104h		;db9d
	dec c			;dba0
	nop			;dba1
	ld (bc),a		;dba2
	ld bc,02704h		;dba3
	ld (bc),a		;dba6
	nop			;dba7
	ld bc,00227h		;dba8
	inc de			;dbab
	nop			;dbac
	jr z,ldbb6h		;dbad
	nop			;dbaf
	ld a,(bc)		;dbb0
	ld bc,02908h		;dbb1
	ld b,019h		;dbb4
ldbb6h:
	ex af,af'		;dbb6
	ld hl,(0040bh)		;dbb7
	inc bc			;dbba
	ld bc,02a02h		;dbbb
	ld a,(bc)		;dbbe
	djnz $+3		;dbbf
	ld hl,(01c0bh)		;dbc1
	ld bc,02209h		;dbc4
	ld de,00200h		;dbc7
	ld bc,02104h		;dbca
	dec c			;dbcd
	nop			;dbce
	ld (bc),a		;dbcf
	ld bc,02304h		;dbd0
	ex af,af'		;dbd3
	ld (de),a		;dbd4
	nop			;dbd5
	daa			;dbd6
	ld (bc),a		;dbd7
	nop			;dbd8
	ld bc,00728h		;dbd9
	nop			;dbdc
	ld a,(bc)		;dbdd
	ld bc,02908h		;dbde
	ld b,019h		;dbe1
	ex af,af'		;dbe3
	ld hl,(00d0bh)		;dbe4
ldbe7h:
	ld bc,00a2ah		;dbe7
	dec b			;dbea
	ld bc,00a2ah		;dbeb
	inc d			;dbee
	nop			;dbef
	nop			;dbf0
	nop			;dbf1
	nop			;dbf2
	nop			;dbf3
ldbf4h:
	nop			;dbf4
	nop			;dbf5
ldbf6h:
	nop			;dbf6
ldbf7h:
	nop			;dbf7
	nop			;dbf8
	nop			;dbf9
	nop			;dbfa
	nop			;dbfb
	nop			;dbfc
	ld (bc),a		;dbfd
ldbfeh:
	ld bc,00400h		;dbfe
ldc01h:
	call c,sub_df89h	;dc01
	ex af,af'		;dc04
	rlca			;dc05
	nop			;dc06
	adc a,b			;dc07
	rst 18h			;dc08
	rst 38h			;dc09
	nop			;dc0a
	rst 38h			;dc0b
	nop			;dc0c
	rst 38h			;dc0d
	nop			;dc0e
	rst 38h			;dc0f
	nop			;dc10
	rst 38h			;dc11
	nop			;dc12
	rst 38h			;dc13
	nop			;dc14
	rst 38h			;dc15
	nop			;dc16
	rst 38h			;dc17
	nop			;dc18
	rst 38h			;dc19
	nop			;dc1a
	rst 38h			;dc1b
	nop			;dc1c
	rst 38h			;dc1d
	nop			;dc1e
	rst 38h			;dc1f
	nop			;dc20
	rst 38h			;dc21
	nop			;dc22
	rst 38h			;dc23
	nop			;dc24
	rst 38h			;dc25
	nop			;dc26
	rst 38h			;dc27
	nop			;dc28
	rst 38h			;dc29
	nop			;dc2a
	rst 38h			;dc2b
	nop			;dc2c
	rst 38h			;dc2d
	nop			;dc2e
	rst 38h			;dc2f
	nop			;dc30
	rst 38h			;dc31
	nop			;dc32
	rst 38h			;dc33
	nop			;dc34
	rst 38h			;dc35
	nop			;dc36
	rst 38h			;dc37
	nop			;dc38
	rst 38h			;dc39
	nop			;dc3a
	rst 38h			;dc3b
	nop			;dc3c
	rst 38h			;dc3d
	nop			;dc3e
	rst 38h			;dc3f
	nop			;dc40
	rst 38h			;dc41
	nop			;dc42
sub_dc43h:
	rst 38h			;dc43
	nop			;dc44
	rst 38h			;dc45
	nop			;dc46
	rst 38h			;dc47
	nop			;dc48
	rst 38h			;dc49
	nop			;dc4a
	rst 38h			;dc4b
	nop			;dc4c
	rst 38h			;dc4d
	nop			;dc4e
	rst 38h			;dc4f
	nop			;dc50
	rst 38h			;dc51
	nop			;dc52
	rst 38h			;dc53
	nop			;dc54
	rst 38h			;dc55
	nop			;dc56
	rst 38h			;dc57
	nop			;dc58
	rst 38h			;dc59
sub_dc5ah:
	nop			;dc5a
	rst 38h			;dc5b
	nop			;dc5c
	rst 38h			;dc5d
	nop			;dc5e
	rst 38h			;dc5f
	nop			;dc60
	rst 38h			;dc61
	nop			;dc62
	rst 38h			;dc63
	nop			;dc64
	rst 38h			;dc65
	nop			;dc66
	rst 38h			;dc67
	nop			;dc68
	rst 38h			;dc69
	nop			;dc6a
	rst 38h			;dc6b
	nop			;dc6c
	rst 38h			;dc6d
	nop			;dc6e
	rst 38h			;dc6f
	nop			;dc70
	dec hl			;dc71
	nop			;dc72
	rst 38h			;dc73
	nop			;dc74
	rst 38h			;dc75
	nop			;dc76
	rst 38h			;dc77
	nop			;dc78
	rst 38h			;dc79
	nop			;dc7a
	rst 38h			;dc7b
	nop			;dc7c
	cp 000h			;dc7d
	nop			;dc7f
	call nc,000ffh		;dc80
	rst 38h			;dc83
	nop			;dc84
	rst 38h			;dc85
	nop			;dc86
	rst 38h			;dc87
	nop			;dc88
	rst 38h			;dc89
	nop			;dc8a
	call m,00001h		;dc8b
	ei			;dc8e
	ld a,a			;dc8f
	nop			;dc90
	rst 38h			;dc91
	nop			;dc92
	rst 38h			;dc93
	nop			;dc94
	rst 38h			;dc95
	nop			;dc96
	rst 38h			;dc97
	nop			;dc98
	ret m			;dc99
	inc bc			;dc9a
	nop			;dc9b
	cp 03fh			;dc9c
	add a,b			;dc9e
	rst 38h			;dc9f
	nop			;dca0
	rst 38h			;dca1
	nop			;dca2
	rst 38h			;dca3
	nop			;dca4
	rst 38h			;dca5
	nop			;dca6
	ret p			;dca7
	rlca			;dca8
	nop			;dca9
	rst 38h			;dcaa
	rra			;dcab
	ld b,b			;dcac
	rst 38h			;dcad
	nop			;dcae
	rst 38h			;dcaf
	nop			;dcb0
	rst 38h			;dcb1
	nop			;dcb2
	rst 38h			;dcb3
	nop			;dcb4
	ret nz			;dcb5
	rrca			;dcb6
	nop			;dcb7
	rst 38h			;dcb8
	rla			;dcb9
	ld b,b			;dcba
	rst 38h			;dcbb
	nop			;dcbc
	rst 38h			;dcbd
	nop			;dcbe
	rst 38h			;dcbf
	nop			;dcc0
	rst 38h			;dcc1
	nop			;dcc2
	add a,b			;dcc3
	cpl			;dcc4
	nop			;dcc5
	rst 38h			;dcc6
	ld bc,lffa8h		;dcc7
	nop			;dcca
	rst 38h			;dccb
	nop			;dccc
	rst 38h			;dccd
	nop			;dcce
	rst 38h			;dccf
	nop			;dcd0
	nop			;dcd1
	ld c,a			;dcd2
	nop			;dcd3
	rst 38h			;dcd4
	nop			;dcd5
	sbc a,0ffh		;dcd6
	nop			;dcd8
	rst 38h			;dcd9
	nop			;dcda
	rst 38h			;dcdb
	nop			;dcdc
	rst 38h			;dcdd
	nop			;dcde
	add a,b			;dcdf
	dec hl			;dce0
	nop			;dce1
	cp 001h			;dce2
	ret c			;dce4
	rst 38h			;dce5
	nop			;dce6
	rst 38h			;dce7
	nop			;dce8
	rst 38h			;dce9
	nop			;dcea
	rst 38h			;dceb
	nop			;dcec
	nop			;dced
	ld c,l			;dcee
	nop			;dcef
	cp l			;dcf0
	nop			;dcf1
	cp (hl)			;dcf2
	rst 38h			;dcf3
	nop			;dcf4
	rst 38h			;dcf5
	nop			;dcf6
	rst 38h			;dcf7
	nop			;dcf8
	cp 000h			;dcf9
	nop			;dcfb
	push hl			;dcfc
	nop			;dcfd
	cp l			;dcfe
	nop			;dcff
	dec a			;dd00
	ld a,a			;dd01
	nop			;dd02
	rst 38h			;dd03
	nop			;dd04
	rst 38h			;dd05
	nop			;dd06
	cp 000h			;dd07
	nop			;dd09
	sub 000h		;dd0a
	cp e			;dd0c
	nop			;dd0d
	cp a			;dd0e
	ld a,a			;dd0f
	nop			;dd10
	rst 38h			;dd11
	nop			;dd12
	rst 38h			;dd13
	nop			;dd14
	cp 000h			;dd15
	nop			;dd17
	call po,0b900h		;dd18
	nop			;dd1b
	sbc a,07fh		;dd1c
	nop			;dd1e
	rst 38h			;dd1f
	nop			;dd20
	rst 38h			;dd21
	nop			;dd22
	call m,00001h		;dd23
	ret pe			;dd26
	nop			;dd27
	pop hl			;dd28
	nop			;dd29
	adc a,03fh		;dd2a
	add a,b			;dd2c
	rst 38h			;dd2d
	nop			;dd2e
	rst 38h			;dd2f
	nop			;dd30
	ret m			;dd31
	inc bc			;dd32
	nop			;dd33
	call p,0f300h		;dd34
	nop			;dd37
	sub a			;dd38
	ccf			;dd39
	add a,b			;dd3a
	rst 38h			;dd3b
	nop			;dd3c
	rst 38h			;dd3d
	nop			;dd3e
	ret m			;dd3f
	inc bc			;dd40
	nop			;dd41
	cp e			;dd42
	nop			;dd43
	ld l,(hl)		;dd44
	nop			;dd45
	and a			;dd46
	rra			;dd47
	ld b,b			;dd48
	rst 38h			;dd49
	nop			;dd4a
	rst 38h			;dd4b
	nop			;dd4c
	ret m			;dd4d
	inc bc			;dd4e
	nop			;dd4f
	cp e			;dd50
	nop			;dd51
	defb 0fdh,000h,057h ;illegal sequence	;dd52
	rra			;dd55
ldd56h:
	ret nz			;dd56
	rst 38h			;dd57
	nop			;dd58
	rst 38h			;dd59
	nop			;dd5a
	ret p			;dd5b
	rlca			;dd5c
	nop			;dd5d
	defb 0ddh,000h,007h ;illegal sequence	;dd5e
	nop			;dd61
	ld l,e			;dd62
	rrca			;dd63
	and b			;dd64
	rst 38h			;dd65
	nop			;dd66
	rst 38h			;dd67
	nop			;dd68
	ret p			;dd69
	rlca			;dd6a
	nop			;dd6b
	cp l			;dd6c
	nop			;dd6d
	dec sp			;dd6e
	nop			;dd6f
	ld d,e			;dd70
	rra			;dd71
	ret nz			;dd72
	rst 38h			;dd73
	nop			;dd74
	rst 38h			;dd75
	nop			;dd76
	ret p			;dd77
	rlca			;dd78
	nop			;dd79
	sbc a,(hl)		;dd7a
	nop			;dd7b
	jp nz,leb00h		;dd7c
	rrca			;dd7f
	and b			;dd80
	rst 38h			;dd81
	nop			;dd82
	rst 38h			;dd83
	nop			;dd84
	ret po			;dd85
	rlca			;dd86
	ld b,b			;dd87
	rra			;dd88
	nop			;dd89
	dec a			;dd8a
	nop			;dd8b
	out (007h),a		;dd8c
	ret nc			;dd8e
	rst 38h			;dd8f
	nop			;dd90
	rst 38h			;dd91
	nop			;dd92
	ret nz			;dd93
	dec e			;dd94
	ld h,b			;dd95
	rrca			;dd96
	nop			;dd97
	jp 04000h		;dd98
	inc bc			;dd9b
	ret pe			;dd9c
	rst 38h			;dd9d
	nop			;dd9e
	rst 38h			;dd9f
	nop			;dda0
	ret nz			;dda1
	ld e,020h		;dda2
	adc a,a			;dda4
	nop			;dda5
	rst 18h			;dda6
	nop			;dda7
	and (hl)		;dda8
	rlca			;dda9
	ld (hl),b		;ddaa
	rst 38h			;ddab
	nop			;ddac
	rst 38h			;ddad
	nop			;ddae
	add a,b			;ddaf
	ccf			;ddb0
	ld (hl),b		;ddb1
	rrca			;ddb2
	nop			;ddb3
	rst 18h			;ddb4
	nop			;ddb5
	ld c,c			;ddb6
	inc bc			;ddb7
	ret pe			;ddb8
	rst 38h			;ddb9
	nop			;ddba
	rst 38h			;ddbb
	nop			;ddbc
	add a,b			;ddbd
	ld a,030h		;ddbe
	add a,a			;ddc0
	nop			;ddc1
	rst 18h			;ddc2
	nop			;ddc3
	ccf			;ddc4
	rlca			;ddc5
	ret p			;ddc6
	rst 38h			;ddc7
	nop			;ddc8
	rst 38h			;ddc9
	nop			;ddca
	add a,b			;ddcb
	ccf			;ddcc
	jr nc,ldd56h		;ddcd
	nop			;ddcf
	ret p			;ddd0
	nop			;ddd1
	rst 38h			;ddd2
	inc bc			;ddd3
	ret m			;ddd4
	rst 38h			;ddd5
	nop			;ddd6
	rst 38h			;ddd7
	nop			;ddd8
	add a,b			;ddd9
	ccf			;ddda
	ld h,b			;dddb
	rrca			;dddc
	nop			;dddd
	dec bc			;ddde
	nop			;dddf
	ld a,a			;dde0
	inc bc			;dde1
	ret m			;dde2
	rst 38h			;dde3
	nop			;dde4
	rst 38h			;dde5
	nop			;dde6
	add a,b			;dde7
	dec sp			;dde8
	ld h,b			;dde9
	ld c,000h		;ddea
	cp 000h			;ddec
	cp a			;ddee
	inc bc			;ddef
lddf0h:
	ret pe			;ddf0
	rst 38h			;ddf1
	nop			;ddf2
	rst 38h			;ddf3
	nop			;ddf4
	add a,b			;ddf5
	scf			;ddf6
	nop			;ddf7
	sbc a,l			;ddf8
	nop			;ddf9
	add a,a			;ddfa
	nop			;ddfb
	rst 18h			;ddfc
	rlca			;ddfd
	or b			;ddfe
	rst 38h			;ddff
lde00h:
	nop			;de00
	rst 38h			;de01
	nop			;de02
	nop			;de03
	ld a,l			;de04
	nop			;de05
	sbc a,e			;de06
	nop			;de07
	ld a,a			;de08
	nop			;de09
	defb 0fdh,00fh,080h ;illegal sequence	;de0a
	rst 38h			;de0d
	nop			;de0e
	rst 38h			;de0f
	nop			;de10
	nop			;de11
	ld b,e			;de12
	nop			;de13
	or a			;de14
	nop			;de15
	ld (hl),a		;de16
	nop			;de17
	jp m,0007fh		;de18
	rst 38h			;de1b
	nop			;de1c
	rst 38h			;de1d
	nop			;de1e
	nop			;de1f
	ld a,e			;de20
	nop			;de21
	cp d			;de22
	nop			;de23
	rst 8			;de24
	ld bc,lffd4h		;de25
	nop			;de28
	rst 38h			;de29
	nop			;de2a
	rst 38h			;de2b
	nop			;de2c
	add a,b			;de2d
	dec sp			;de2e
	nop			;de2f
	ld a,l			;de30
	nop			;de31
	cp a			;de32
	inc bc			;de33
	xor b			;de34
	rst 38h			;de35
	nop			;de36
lde37h:
	rst 38h			;de37
	nop			;de38
	rst 38h			;de39
	nop			;de3a
	nop			;de3b
	ld b,b			;de3c
	nop			;de3d
	defb 0fdh,000h,07eh ;illegal sequence	;de3e
	ld bc,lff44h		;de41
	nop			;de44
	rst 38h			;de45
	nop			;de46
	rst 38h			;de47
	nop			;de48
	nop			;de49
	ld a,e			;de4a
	nop			;de4b
	defb 0fdh,000h,07dh ;illegal sequence	;de4c
	nop			;de4f
	cp 0ffh			;de50
	nop			;de52
	rst 38h			;de53
	nop			;de54
	rst 38h			;de55
	nop			;de56
	add a,b			;de57
	scf			;de58
	nop			;de59
	adc a,000h		;de5a
	cp e			;de5c
	nop			;de5d
	rst 38h			;de5e
	ccf			;de5f
	nop			;de60
	rst 38h			;de61
	nop			;de62
	rst 38h			;de63
	nop			;de64
	ret nz			;de65
	rrca			;de66
	jr nc,lddf0h		;de67
	nop			;de69
	rst 0			;de6a
	nop			;de6b
	adc a,a			;de6c
	rra			;de6d
	ret nz			;de6e
	rst 38h			;de6f
	nop			;de70
	rst 38h			;de71
	nop			;de72
	ret nz			;de73
	rra			;de74
	jr lde37h		;de75
	nop			;de77
	cp 070h			;de78
	inc bc			;de7a
	rrca			;de7b
	ret po			;de7c
	rst 38h			;de7d
	nop			;de7e
	rst 38h			;de7f
	nop			;de80
	ret nz			;de81
	rra			;de82
	rrca			;de83
	and b			;de84
	ld bc,lf878h		;de85
	inc bc			;de88
	rlca			;de89
	ret nc			;de8a
	rst 38h			;de8b
	nop			;de8c
	rst 38h			;de8d
	nop			;de8e
	ret nz			;de8f
	rra			;de90
	rrca			;de91
	ret nz			;de92
	add a,a			;de93
	nop			;de94
	ret m			;de95
	inc bc			;de96
	rrca			;de97
	ret po			;de98
	rst 38h			;de99
	nop			;de9a
	rst 38h			;de9b
	nop			;de9c
lde9dh:
	ret po			;de9d
	rrca			;de9e
	rlca			;de9f
	ret nc			;dea0
	rst 38h			;dea1
	nop			;dea2
	ret p			;dea3
	rlca			;dea4
	rrca			;dea5
	ret po			;dea6
	rst 38h			;dea7
	nop			;dea8
	rst 38h			;dea9
	nop			;deaa
	ret p			;deab
	rlca			;deac
	inc bc			;dead
	ret pe			;deae
	rst 38h			;deaf
	nop			;deb0
	ret p			;deb1
	rlca			;deb2
	rrca			;deb3
	and b			;deb4
	rst 38h			;deb5
	nop			;deb6
	rst 38h			;deb7
	nop			;deb8
	ret p			;deb9
	rlca			;deba
	inc bc			;debb
	ret m			;debc
	rst 38h			;debd
	nop			;debe
	ret po			;debf
	rrca			;dec0
	rra			;dec1
	ret nz			;dec2
	rst 38h			;dec3
	nop			;dec4
	rst 38h			;dec5
	nop			;dec6
	ret m			;dec7
	inc bc			;dec8
	ld bc,lfff4h		;dec9
	nop			;decc
	ret po			;decd
	rrca			;dece
	rra			;decf
	ld b,b			;ded0
	rst 38h			;ded1
	nop			;ded2
	rst 38h			;ded3
	nop			;ded4
	call m,00101h		;ded5
	call m,000ffh		;ded8
	ret nz			;dedb
	rra			;dedc
	ccf			;dedd
	add a,b			;dede
	rst 38h			;dedf
	nop			;dee0
	rst 38h			;dee1
	nop			;dee2
	cp 000h			;dee3
	ld bc,lfff4h		;dee5
	nop			;dee8
	add a,b			;dee9
	ld a,03fh		;deea
	add a,b			;deec
	rst 38h			;deed
	nop			;deee
	rst 38h			;deef
	nop			;def0
	ret po			;def1
	ld bc,07a00h		;def2
	rst 38h			;def5
	nop			;def6
	add a,b			;def7
	dec a			;def8
	ld a,a			;def9
	nop			;defa
	rst 38h			;defb
	nop			;defc
	rst 38h			;defd
	nop			;defe
	ret nz			;deff
ldf00h:
	rra			;df00
	nop			;df01
	rst 38h			;df02
	ld a,a			;df03
	nop			;df04
	nop			;df05
	ld a,(hl)		;df06
	rst 38h			;df07
	nop			;df08
	rst 38h			;df09
	nop			;df0a
	rst 38h			;df0b
	nop			;df0c
	add a,b			;df0d
	inc hl			;df0e
	nop			;df0f
	cp 03eh			;df10
	add a,b			;df12
	nop			;df13
	cp l			;df14
	ld a,a			;df15
	nop			;df16
	rst 38h			;df17
	nop			;df18
	cp 000h			;df19
	nop			;df1b
	ld a,l			;df1c
	nop			;df1d
	rst 38h			;df1e
	inc e			;df1f
	pop bc			;df20
	nop			;df21
	ld a,a			;df22
	rra			;df23
	add a,b			;df24
	rst 38h			;df25
	nop			;df26
	call p,00001h		;df27
	cp e			;df2a
	nop			;df2b
	call m,sub_803ch	;df2c
	nop			;df2f
	di			;df30
	rlca			;df31
	ret po			;df32
	rst 38h			;df33
	nop			;df34
	ret po			;df35
	ld a,(bc)		;df36
	nop			;df37
	ld b,a			;df38
	nop			;df39
	rst 38h			;df3a
	ld a,b			;df3b
	inc bc			;df3c
	nop			;df3d
	defb 0edh ;next byte illegal after ed	;df3e
	inc bc			;df3f
	ret m			;df40
	rst 38h			;df41
	nop			;df42
	ret nz			;df43
	inc de			;df44
	nop			;df45
	ld a,a			;df46
	nop			;df47
	ret m			;df48
	ret m			;df49
	ld (bc),a		;df4a
	nop			;df4b
	jp p,02000h		;df4c
	rst 38h			;df4f
	nop			;df50
	ret po			;df51
	dec c			;df52
	nop			;df53
	cp l			;df54
	rlca			;df55
	nop			;df56
	defb 0fdh,000h,000h ;illegal sequence	;df57
	ld a,(hl)		;df5a
	nop			;df5b
	and e			;df5c
	ld a,a			;df5d
	nop			;df5e
	jp p,04200h		;df5f
	nop			;df62
	rst 38h			;df63
	nop			;df64
	rst 38h			;df65
	nop			;df66
	add a,b			;df67
	dec a			;df68
	nop			;df69
	ex de,hl		;df6a
	ld a,a			;df6b
	nop			;df6c
	rst 38h			;df6d
	nop			;df6e
	rst 38h			;df6f
	nop			;df70
	rst 38h			;df71
	nop			;df72
	rst 38h			;df73
	nop			;df74
	ret nz			;df75
	rra			;df76
	nop			;df77
	sbc a,0ffh		;df78
	nop			;df7a
	rst 38h			;df7b
	nop			;df7c
	rst 38h			;df7d
	nop			;df7e
	rst 38h			;df7f
	nop			;df80
	rst 38h			;df81
	nop			;df82
	ret po			;df83
	nop			;df84
	ld hl,lfeffh+1		;df85
	nop			;df88
sub_df89h:
	rlca			;df89
	ex af,af'		;df8a
	nop			;df8b
	dec c			;df8c
	ex (sp),hl		;df8d
	rst 38h			;df8e
	nop			;df8f
	rst 38h			;df90
	nop			;df91
	rst 38h			;df92
	nop			;df93
	rst 38h			;df94
	nop			;df95
	rst 38h			;df96
	nop			;df97
	rst 38h			;df98
	nop			;df99
	rst 38h			;df9a
	nop			;df9b
	rst 38h			;df9c
	nop			;df9d
	rst 38h			;df9e
	nop			;df9f
	rst 38h			;dfa0
	nop			;dfa1
	push hl			;dfa2
	nop			;dfa3
	ld e,a			;dfa4
	nop			;dfa5
	rst 38h			;dfa6
	nop			;dfa7
	rst 38h			;dfa8
	nop			;dfa9
	rst 38h			;dfaa
	nop			;dfab
	rst 38h			;dfac
	nop			;dfad
	rst 38h			;dfae
	nop			;dfaf
	rst 38h			;dfb0
	nop			;dfb1
	nop			;dfb2
	ld a,(de)		;dfb3
	rlca			;dfb4
	and b			;dfb5
	rst 38h			;dfb6
	nop			;dfb7
	rst 38h			;dfb8
	nop			;dfb9
	rst 38h			;dfba
	nop			;dfbb
	rst 38h			;dfbc
	nop			;dfbd
	rst 38h			;dfbe
	nop			;dfbf
	cp 000h			;dfc0
	nop			;dfc2
	rst 38h			;dfc3
	inc bc			;dfc4
	ret pe			;dfc5
	rst 38h			;dfc6
	nop			;dfc7
	rst 38h			;dfc8
	nop			;dfc9
	rst 38h			;dfca
	nop			;dfcb
	rst 38h			;dfcc
	nop			;dfcd
	rst 38h			;dfce
	nop			;dfcf
	call m,00001h		;dfd0
	rst 38h			;dfd3
	ld bc,lfff4h		;dfd4
	nop			;dfd7
	rst 38h			;dfd8
	nop			;dfd9
	rst 38h			;dfda
	nop			;dfdb
	rst 38h			;dfdc
	nop			;dfdd
	rst 38h			;dfde
	nop			;dfdf
	ret m			;dfe0
	inc bc			;dfe1
	nop			;dfe2
	rst 38h			;dfe3
	nop			;dfe4
	jp pe,000ffh		;dfe5
	rra			;dfe8
	nop			;dfe9
	rst 38h			;dfea
	nop			;dfeb
	rst 38h			;dfec
	nop			;dfed
	rst 38h			;dfee
	nop			;dfef
	ret m			;dff0
	inc bc			;dff1
	nop			;dff2
	rst 38h			;dff3
	nop			;dff4
	call p,00084h		;dff5
	inc bc			;dff8
	ret po			;dff9
	rst 38h			;dffa
	nop			;dffb
	rst 38h			;dffc
	nop			;dffd
ldffeh:
	rst 38h			;dffe
	nop			;dfff
sub_e000h:
	ret m			;e000
sub_e001h:
	inc bc			;e001
sub_e002h:
	nop			;e002
	rst 38h			;e003
	nop			;e004
	jp m,l7b00h		;e005
	nop			;e008
	call c,000ffh		;e009
	rst 38h			;e00c
	nop			;e00d
sub_e00eh:
	rst 38h			;e00e
le00fh:
	nop			;e00f
	ret m			;e010
	inc bc			;e011
	nop			;e012
	rst 38h			;e013
le014h:
	nop			;e014
	defb 0fdh,000h,0f7h ;illegal sequence	;e015
	nop			;e018
	ei			;e019
	ccf			;e01a
	nop			;e01b
	rst 38h			;e01c
	nop			;e01d
	rst 38h			;e01e
	nop			;e01f
	ret m			;e020
	ld (bc),a		;e021
	nop			;e022
	rst 38h			;e023
	nop			;e024
	call lef00h		;e025
	nop			;e028
	rst 38h			;e029
	rrca			;e02a
	ret nz			;e02b
	rst 38h			;e02c
	nop			;e02d
	rst 38h			;e02e
	nop			;e02f
	ret p			;e030
	dec b			;e031
	nop			;e032
	ld (hl),a		;e033
le034h:
	nop			;e034
	cp e			;e035
	nop			;e036
	rst 38h			;e037
	nop			;e038
	rst 38h			;e039
	rlca			;e03a
	ret nc			;e03b
	rst 38h			;e03c
	nop			;e03d
	rst 38h			;e03e
	nop			;e03f
	ret po			;e040
	add hl,bc		;e041
	nop			;e042
	sub (hl)		;e043
	nop			;e044
	ld a,e			;e045
	nop			;e046
	rst 38h			;e047
	nop			;e048
	rst 38h			;e049
	inc bc			;e04a
	ret m			;e04b
	rst 38h			;e04c
	nop			;e04d
	rst 38h			;e04e
	nop			;e04f
	ret nz			;e050
	dec d			;e051
	nop			;e052
	nop			;e053
	nop			;e054
	dec (hl)		;e055
	nop			;e056
	rst 38h			;e057
	nop			;e058
	rst 18h			;e059
	ld bc,lfff4h		;e05a
	nop			;e05d
le05eh:
	rst 38h			;e05e
	nop			;e05f
	add a,b			;e060
	add hl,hl		;e061
	nop			;e062
	ld hl,(01900h)		;e063
	nop			;e066
	rst 38h			;e067
	nop			;e068
	rst 28h			;e069
	ld bc,sub_fffch		;e06a
	nop			;e06d
	rst 38h			;e06e
	nop			;e06f
	nop			;e070
	ld d,l			;e071
	nop			;e072
	inc e			;e073
	nop			;e074
	dec d			;e075
	nop			;e076
	rst 38h			;e077
	nop			;e078
	rst 8			;e079
	nop			;e07a
	jp m,000ffh		;e07b
	cp 000h			;e07e
	nop			;e080
	xor c			;e081
	nop			;e082
	sbc a,(hl)		;e083
	nop			;e084
	ld l,c			;e085
	nop			;e086
	rst 38h			;e087
	nop			;e088
	rst 20h			;e089
	nop			;e08a
	cp 0ffh			;e08b
	nop			;e08d
	cp 000h			;e08e
	nop			;e090
	ld b,l			;e091
	nop			;e092
	defb 0edh ;next byte illegal after ed	;e093
	nop			;e094
	dec (hl)		;e095
	nop			;e096
	rst 38h			;e097
	nop			;e098
	di			;e099
	nop			;e09a
	defb 0fdh,07fh,000h ;illegal sequence	;e09b
	call m,00001h		;e09e
	ld a,h			;e0a1
	nop			;e0a2
	defb 0ddh,000h,0f3h ;illegal sequence	;e0a3
	nop			;e0a6
	rst 38h			;e0a7
	nop			;e0a8
	call m,07e00h		;e0a9
	ccf			;e0ac
	add a,b			;e0ad
	ret m			;e0ae
	ld (bc),a		;e0af
	nop			;e0b0
	jp m,led00h		;e0b1
	nop			;e0b4
	ex de,hl		;e0b5
	nop			;e0b6
	rst 38h			;e0b7
	nop			;e0b8
	jp m,lbf00h		;e0b9
	ccf			;e0bc
	add a,b			;e0bd
	ret p			;e0be
	dec b			;e0bf
	nop			;e0c0
	call m,sub_e900h	;e0c1
	nop			;e0c4
	rst 30h			;e0c5
	nop			;e0c6
	rst 38h			;e0c7
	nop			;e0c8
	defb 0fdh,000h,05fh ;illegal sequence	;e0c9
	rra			;e0cc
	ret nz			;e0cd
	ret p			;e0ce
	rlca			;e0cf
	nop			;e0d0
	cp 000h			;e0d1
	ld h,l			;e0d3
	nop			;e0d4
	rst 10h			;e0d5
	nop			;e0d6
	rst 38h			;e0d7
	nop			;e0d8
	cp 000h			;e0d9
	sbc a,a			;e0db
	rra			;e0dc
	ld b,b			;e0dd
	ret po			;e0de
	rrca			;e0df
	nop			;e0e0
	rst 38h			;e0e1
	nop			;e0e2
	ld l,c			;e0e3
	nop			;e0e4
	xor a			;e0e5
	nop			;e0e6
	rst 38h			;e0e7
	nop			;e0e8
	defb 0fdh,000h,053h ;illegal sequence	;e0e9
	rrca			;e0ec
	and b			;e0ed
	ret nz			;e0ee
	rrca			;e0ef
	nop			;e0f0
	rst 38h			;e0f1
	nop			;e0f2
	cp (hl)			;e0f3
	nop			;e0f4
	rst 18h			;e0f5
	nop			;e0f6
	rst 38h			;e0f7
sub_e0f8h:
	nop			;e0f8
	jp m,00d00h		;e0f9
le0fch:
	rrca			;e0fc
	ret po			;e0fd
	add a,b			;e0fe
	jr nc,le101h		;e0ff
le101h:
	ld a,a			;e101
	nop			;e102
	rlc b			;e103
	cp a			;e105
	nop			;e106
	rst 38h			;e107
	nop			;e108
	pop hl			;e109
	nop			;e10a
	rst 38h			;e10b
	rrca			;e10c
	and b			;e10d
	nop			;e10e
	ld a,a			;e10f
	nop			;e110
	rst 0			;e111
	nop			;e112
	rst 38h			;e113
	nop			;e114
	rst 38h			;e115
	nop			;e116
	cp 000h			;e117
	rra			;e119
	nop			;e11a
	ld a,a			;e11b
	rrca			;e11c
	and b			;e11d
	add a,b			;e11e
	ccf			;e11f
	nop			;e120
	in a,(000h)		;e121
	rst 30h			;e123
	nop			;e124
	rst 38h			;e125
	nop			;e126
	defb 0fdh,000h,0ffh ;illegal sequence	;e127
	nop			;e12a
	ld a,a			;e12b
	rrca			;e12c
	ld h,b			;e12d
	nop			;e12e
	ld b,e			;e12f
	nop			;e130
	in a,(000h)		;e131
	rst 28h			;e133
	nop			;e134
	rst 38h			;e135
	nop			;e136
	ei			;e137
	nop			;e138
	ld sp,hl		;e139
	nop			;e13a
	cp a			;e13b
	rrca			;e13c
	and b			;e13d
	add a,b			;e13e
	inc a			;e13f
	nop			;e140
	dec sp			;e141
	nop			;e142
	rst 8			;e143
	nop			;e144
	rst 38h			;e145
	nop			;e146
	ei			;e147
	nop			;e148
	rst 30h			;e149
	nop			;e14a
	cp a			;e14b
	rra			;e14c
	ld b,b			;e14d
	nop			;e14e
	ld e,a			;e14f
	nop			;e150
	or a			;e151
	nop			;e152
	rst 28h			;e153
	nop			;e154
	rst 38h			;e155
	nop			;e156
	push af			;e157
	nop			;e158
	adc a,(hl)		;e159
	nop			;e15a
	cp l			;e15b
	ccf			;e15c
	add a,b			;e15d
	nop			;e15e
	ld h,e			;e15f
	nop			;e160
	ld (hl),a		;e161
	nop			;e162
	rst 8			;e163
	nop			;e164
	rst 38h			;e165
	nop			;e166
	or 000h			;e167
	ld a,c			;e169
	nop			;e16a
	cp (hl)			;e16b
	ccf			;e16c
	add a,b			;e16d
	add a,b			;e16e
	inc a			;e16f
	nop			;e170
	xor a			;e171
	nop			;e172
	rst 28h			;e173
	nop			;e174
	rst 38h			;e175
	nop			;e176
	or 000h			;e177
	rst 20h			;e179
	nop			;e17a
	ei			;e17b
	ld a,a			;e17c
	nop			;e17d
	ret nz			;e17e
	inc de			;e17f
	nop			;e180
	ld a,a			;e181
	nop			;e182
	sbc a,a			;e183
	nop			;e184
	rst 38h			;e185
	nop			;e186
	rst 30h			;e187
	nop			;e188
	inc a			;e189
	nop			;e18a
	ret p			;e18b
	rst 38h			;e18c
	nop			;e18d
	ret po			;e18e
	inc c			;e18f
	nop			;e190
	rst 38h			;e191
	nop			;e192
	rst 18h			;e193
	nop			;e194
	rst 38h			;e195
	nop			;e196
	in a,(000h)		;e197
	or e			;e199
	inc bc			;e19a
	ret z			;e19b
	rst 38h			;e19c
	nop			;e19d
	ret po			;e19e
	rrca			;e19f
	nop			;e1a0
	rst 38h			;e1a1
	nop			;e1a2
	sbc a,a			;e1a3
	nop			;e1a4
	rst 38h			;e1a5
	nop			;e1a6
	defb 0edh ;next byte illegal after ed	;e1a7
	nop			;e1a8
	rst 8			;e1a9
	inc bc			;e1aa
	jr z,$+1		;e1ab
	nop			;e1ad
	ret po			;e1ae
	rrca			;e1af
	nop			;e1b0
	rst 38h			;e1b1
	nop			;e1b2
	ld e,a			;e1b3
	nop			;e1b4
	rst 38h			;e1b5
	nop			;e1b6
	sub 000h		;e1b7
	inc a			;e1b9
	inc bc			;e1ba
	ret c			;e1bb
	rst 38h			;e1bc
	nop			;e1bd
	ret po			;e1be
	rrca			;e1bf
	nop			;e1c0
	rst 38h			;e1c1
	nop			;e1c2
	sbc a,a			;e1c3
	nop			;e1c4
	rst 38h			;e1c5
	nop			;e1c6
	xor a			;e1c7
	nop			;e1c8
	jp le803h		;e1c9
	rst 38h			;e1cc
	nop			;e1cd
	ret p			;e1ce
	rlca			;e1cf
	nop			;e1d0
	rst 38h			;e1d1
	nop			;e1d2
	ld e,a			;e1d3
	nop			;e1d4
	rst 38h			;e1d5
	nop			;e1d6
	rst 10h			;e1d7
	nop			;e1d8
	rst 38h			;e1d9
	rlca			;e1da
	ret nc			;e1db
	rst 38h			;e1dc
	nop			;e1dd
	ret p			;e1de
	dec b			;e1df
	nop			;e1e0
	cp 000h			;e1e1
	xor a			;e1e3
sub_e1e4h:
	nop			;e1e4
	cp 000h			;e1e5
	adc a,a			;e1e7
	nop			;e1e8
	rst 38h			;e1e9
	rlca			;e1ea
	or b			;e1eb
	rst 38h			;e1ec
	nop			;e1ed
	ret m			;e1ee
	inc bc			;e1ef
	nop			;e1f0
	pop bc			;e1f1
	nop			;e1f2
	cp 000h			;e1f3
	ld bc,lfeffh+1		;e1f5
	nop			;e1f8
	rst 38h			;e1f9
	rrca			;e1fa
	and b			;e1fb
	rst 38h			;e1fc
	nop			;e1fd
	call m,00001h		;e1fe
	rst 30h			;e201
	nop			;e202
	rst 38h			;e203
	nop			;e204
	ld e,a			;e205
	nop			;e206
	rst 38h			;e207
	nop			;e208
	rst 38h			;e209
	rra			;e20a
	ld b,b			;e20b
	rst 38h			;e20c
	nop			;e20d
	call m,00001h		;e20e
	rst 28h			;e211
	nop			;e212
	rst 38h			;e213
	nop			;e214
	xor a			;e215
	nop			;e216
	rst 38h			;e217
	nop			;e218
	defb 0fdh,03fh,080h ;illegal sequence	;e219
	rst 38h			;e21c
	nop			;e21d
	cp 000h			;e21e
	nop			;e220
	rst 18h			;e221
	nop			;e222
	rst 38h			;e223
	nop			;e224
	rst 10h			;e225
	nop			;e226
	defb 0fdh,000h,0feh ;illegal sequence	;e227
	rla			;e22a
	add a,b			;e22b
	rst 38h			;e22c
	nop			;e22d
	rst 38h			;e22e
	nop			;e22f
	nop			;e230
	ld e,a			;e231
	nop			;e232
	rst 38h			;e233
	nop			;e234
	rst 20h			;e235
	nop			;e236
	ld sp,hl		;e237
	nop			;e238
	push af			;e239
	inc bc			;e23a
	jr z,$+1		;e23b
	nop			;e23d
	rst 38h			;e23e
le23fh:
	nop			;e23f
	add a,b			;e240
	cpl			;e241
	nop			;e242
	rst 38h			;e243
	nop			;e244
	rst 18h			;e245
	nop			;e246
	push af			;e247
	nop			;e248
	jp pe,05401h		;e249
	rst 38h			;e24c
	nop			;e24d
	rst 38h			;e24e
	nop			;e24f
	ret nz			;e250
	rra			;e251
	nop			;e252
	rst 38h			;e253
	nop			;e254
	ex de,hl		;e255
	nop			;e256
	ld sp,hl		;e257
	nop			;e258
	push af			;e259
	nop			;e25a
	cp d			;e25b
	rst 38h			;e25c
	nop			;e25d
	rst 38h			;e25e
	nop			;e25f
	ret po			;e260
	inc bc			;e261
	nop			;e262
	rst 38h			;e263
	nop			;e264
	ei			;e265
	nop			;e266
	ld sp,hl		;e267
	nop			;e268
	ld d,a			;e269
	nop			;e26a
	defb 0fdh,07fh,000h ;illegal sequence	;e26b
	rst 38h			;e26e
	nop			;e26f
	ret p			;e270
	dec b			;e271
	nop			;e272
	xor a			;e273
	nop			;e274
	jp (hl)			;e275
	nop			;e276
	cp 000h			;e277
	xor a			;e279
	nop			;e27a
	rst 18h			;e27b
	ld a,a			;e27c
	nop			;e27d
	rst 38h			;e27e
	nop			;e27f
	ret p			;e280
	ld b,000h		;e281
	push de			;e283
	nop			;e284
	ld d,l			;e285
	nop			;e286
	call m,05f00h		;e287
	nop			;e28a
	cp (hl)			;e28b
	rst 38h			;e28c
	nop			;e28d
	rst 38h			;e28e
	nop			;e28f
	ret m			;e290
	inc bc			;e291
	nop			;e292
	ld a,(la900h)		;e293
	nop			;e296
	jp m,lbe00h		;e297
	nop			;e29a
	ld a,(hl)		;e29b
	rst 38h			;e29c
	nop			;e29d
	rst 38h			;e29e
	nop			;e29f
	ret m			;e2a0
	inc bc			;e2a1
	nop			;e2a2
	rst 8			;e2a3
	nop			;e2a4
	ld d,h			;e2a5
	nop			;e2a6
	rst 38h			;e2a7
	nop			;e2a8
	ld (hl),c		;e2a9
	ld bc,sub_fffch		;e2aa
	nop			;e2ad
	rst 38h			;e2ae
	nop			;e2af
	call m,00001h		;e2b0
	and b			;e2b3
	nop			;e2b4
	jp m,lfeffh+1		;e2b5
	nop			;e2b8
	rst 28h			;e2b9
	ld bc,lff7ch		;e2ba
	nop			;e2bd
	rst 38h			;e2be
	nop			;e2bf
	cp 000h			;e2c0
	nop			;e2c2
	push de			;e2c3
	inc b			;e2c4
	djnz le2c7h		;e2c5
le2c7h:
	rst 38h			;e2c7
	nop			;e2c8
	sub 003h		;e2c9
	ret m			;e2cb
	rst 38h			;e2cc
	nop			;e2cd
	rst 38h			;e2ce
	nop			;e2cf
	rst 38h			;e2d0
	nop			;e2d1
	nop			;e2d2
	ld a,h			;e2d3
	rst 28h			;e2d4
	nop			;e2d5
	nop			;e2d6
	ld (hl),b		;e2d7
	nop			;e2d8
	ld c,c			;e2d9
	rlca			;e2da
	ld (hl),b		;e2db
	rst 38h			;e2dc
	nop			;e2dd
	rst 38h			;e2de
	nop			;e2df
	rst 38h			;e2e0
	nop			;e2e1
	add a,e			;e2e2
	nop			;e2e3
	rst 38h			;e2e4
	nop			;e2e5
	adc a,a			;e2e6
	nop			;e2e7
	add a,b			;e2e8
	dec (hl)		;e2e9
	rrca			;e2ea
	jr nz,$+1		;e2eb
	nop			;e2ed
	rst 38h			;e2ee
	nop			;e2ef
	rst 38h			;e2f0
	nop			;e2f1
	rst 38h			;e2f2
	nop			;e2f3
	rst 38h			;e2f4
	nop			;e2f5
	rst 38h			;e2f6
	nop			;e2f7
	ret z			;e2f8
	ld (bc),a		;e2f9
	rra			;e2fa
	ret nz			;e2fb
	rst 38h			;e2fc
	nop			;e2fd
	rst 38h			;e2fe
	nop			;e2ff
le300h:
	rst 38h			;e300
	nop			;e301
	rst 38h			;e302
	nop			;e303
	rst 38h			;e304
	nop			;e305
	rst 38h			;e306
	nop			;e307
	defb 0fdh,000h,03fh ;illegal sequence	;e308
	nop			;e30b
	rst 38h			;e30c
	nop			;e30d
	nop			;e30e
	nop			;e30f
	nop			;e310
	nop			;e311
	nop			;e312
	nop			;e313
	nop			;e314
	nop			;e315
	nop			;e316
	nop			;e317
	nop			;e318
	nop			;e319
	nop			;e31a
	nop			;e31b
	nop			;e31c
	nop			;e31d
	nop			;e31e
	nop			;e31f
	nop			;e320
	nop			;e321
	nop			;e322
	nop			;e323
	nop			;e324
	nop			;e325
	nop			;e326
	nop			;e327
	nop			;e328
	nop			;e329
	nop			;e32a
	nop			;e32b
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
le337h:
	nop			;e337
le338h:
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
	nop			;e350
	nop			;e351
	nop			;e352
	nop			;e353
	nop			;e354
	nop			;e355
	nop			;e356
	nop			;e357
	nop			;e358
	nop			;e359
	nop			;e35a
	nop			;e35b
	nop			;e35c
	nop			;e35d
	nop			;e35e
	nop			;e35f
	nop			;e360
	nop			;e361
	nop			;e362
	nop			;e363
	nop			;e364
	nop			;e365
	nop			;e366
	nop			;e367
	nop			;e368
	nop			;e369
	nop			;e36a
	nop			;e36b
	nop			;e36c
	nop			;e36d
	nop			;e36e
	nop			;e36f
	nop			;e370
	nop			;e371
	nop			;e372
	nop			;e373
	nop			;e374
	nop			;e375
	nop			;e376
	nop			;e377
	nop			;e378
	nop			;e379
	nop			;e37a
	nop			;e37b
	nop			;e37c
	nop			;e37d
	nop			;e37e
	nop			;e37f
	nop			;e380
	nop			;e381
	nop			;e382
	nop			;e383
	nop			;e384
	nop			;e385
	nop			;e386
	nop			;e387
	nop			;e388
	nop			;e389
	nop			;e38a
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
	nop			;e3af
	nop			;e3b0
	nop			;e3b1
	nop			;e3b2
	nop			;e3b3
	nop			;e3b4
	nop			;e3b5
	nop			;e3b6
	nop			;e3b7
	nop			;e3b8
	nop			;e3b9
	nop			;e3ba
	nop			;e3bb
	nop			;e3bc
	nop			;e3bd
	nop			;e3be
	nop			;e3bf
	nop			;e3c0
	nop			;e3c1
	nop			;e3c2
	nop			;e3c3
	nop			;e3c4
	nop			;e3c5
	nop			;e3c6
	nop			;e3c7
	nop			;e3c8
	nop			;e3c9
	nop			;e3ca
	nop			;e3cb
	nop			;e3cc
	nop			;e3cd
	nop			;e3ce
	nop			;e3cf
	nop			;e3d0
	nop			;e3d1
	nop			;e3d2
	nop			;e3d3
	nop			;e3d4
	nop			;e3d5
	nop			;e3d6
	nop			;e3d7
	nop			;e3d8
	nop			;e3d9
	nop			;e3da
	nop			;e3db
	nop			;e3dc
	nop			;e3dd
	nop			;e3de
	nop			;e3df
	nop			;e3e0
	nop			;e3e1
	nop			;e3e2
	nop			;e3e3
	nop			;e3e4
	nop			;e3e5
	nop			;e3e6
	nop			;e3e7
	nop			;e3e8
	nop			;e3e9
	nop			;e3ea
	nop			;e3eb
	nop			;e3ec
	nop			;e3ed
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
sub_e400h:
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
	nop			;e40f
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
	nop			;e421
	nop			;e422
	nop			;e423
	nop			;e424
	nop			;e425
	nop			;e426
	nop			;e427
	nop			;e428
	nop			;e429
	nop			;e42a
	nop			;e42b
	nop			;e42c
	nop			;e42d
	nop			;e42e
	nop			;e42f
	nop			;e430
	nop			;e431
	nop			;e432
	nop			;e433
	nop			;e434
	nop			;e435
	nop			;e436
	nop			;e437
	nop			;e438
	nop			;e439
	nop			;e43a
	nop			;e43b
	nop			;e43c
	nop			;e43d
	nop			;e43e
	nop			;e43f
	nop			;e440
	nop			;e441
	nop			;e442
	nop			;e443
	nop			;e444
	nop			;e445
	nop			;e446
	nop			;e447
	nop			;e448
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
sub_e463h:
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
	nop			;e46f
	nop			;e470
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
	nop			;e480
	nop			;e481
	nop			;e482
	nop			;e483
	nop			;e484
	nop			;e485
	nop			;e486
	nop			;e487
	nop			;e488
	nop			;e489
	nop			;e48a
	nop			;e48b
	nop			;e48c
	nop			;e48d
	nop			;e48e
	nop			;e48f
	nop			;e490
	nop			;e491
	nop			;e492
	nop			;e493
	nop			;e494
	nop			;e495
	nop			;e496
	nop			;e497
	nop			;e498
	nop			;e499
	nop			;e49a
	nop			;e49b
	nop			;e49c
	nop			;e49d
	nop			;e49e
	nop			;e49f
	nop			;e4a0
	nop			;e4a1
	nop			;e4a2
	nop			;e4a3
	nop			;e4a4
	nop			;e4a5
	nop			;e4a6
	nop			;e4a7
	nop			;e4a8
	nop			;e4a9
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
	nop			;e4cf
	nop			;e4d0
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
	nop			;e4de
	nop			;e4df
	nop			;e4e0
	nop			;e4e1
	nop			;e4e2
	nop			;e4e3
	nop			;e4e4
	nop			;e4e5
	nop			;e4e6
	nop			;e4e7
	nop			;e4e8
	nop			;e4e9
	nop			;e4ea
	nop			;e4eb
	nop			;e4ec
	nop			;e4ed
	nop			;e4ee
	nop			;e4ef
	nop			;e4f0
	nop			;e4f1
	nop			;e4f2
	nop			;e4f3
	nop			;e4f4
	nop			;e4f5
	nop			;e4f6
	nop			;e4f7
	nop			;e4f8
	nop			;e4f9
	nop			;e4fa
	nop			;e4fb
	nop			;e4fc
	nop			;e4fd
	nop			;e4fe
	nop			;e4ff
	nop			;e500
	nop			;e501
	nop			;e502
	nop			;e503
	nop			;e504
	nop			;e505
	nop			;e506
	nop			;e507
	nop			;e508
	nop			;e509
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
	nop			;e52f
	nop			;e530
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
	nop			;e53c
	nop			;e53d
	nop			;e53e
	nop			;e53f
	nop			;e540
	nop			;e541
	nop			;e542
	nop			;e543
	nop			;e544
	nop			;e545
	nop			;e546
	nop			;e547
	nop			;e548
	nop			;e549
	nop			;e54a
	nop			;e54b
	nop			;e54c
	nop			;e54d
	nop			;e54e
	nop			;e54f
	nop			;e550
	nop			;e551
	nop			;e552
	nop			;e553
	nop			;e554
	nop			;e555
	nop			;e556
	nop			;e557
	nop			;e558
	nop			;e559
	nop			;e55a
	nop			;e55b
	nop			;e55c
	nop			;e55d
	nop			;e55e
	nop			;e55f
	nop			;e560
	nop			;e561
	nop			;e562
	nop			;e563
	nop			;e564
	nop			;e565
	nop			;e566
	nop			;e567
	nop			;e568
	nop			;e569
	nop			;e56a
	nop			;e56b
	nop			;e56c
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
	nop			;e58f
	nop			;e590
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
	nop			;e59b
	nop			;e59c
	nop			;e59d
	nop			;e59e
	nop			;e59f
	nop			;e5a0
	nop			;e5a1
	nop			;e5a2
	nop			;e5a3
	nop			;e5a4
	nop			;e5a5
	nop			;e5a6
	nop			;e5a7
	nop			;e5a8
	nop			;e5a9
	nop			;e5aa
	nop			;e5ab
	nop			;e5ac
	nop			;e5ad
	nop			;e5ae
	nop			;e5af
	nop			;e5b0
	nop			;e5b1
	nop			;e5b2
	nop			;e5b3
	nop			;e5b4
	nop			;e5b5
	nop			;e5b6
	nop			;e5b7
	nop			;e5b8
	nop			;e5b9
	nop			;e5ba
	nop			;e5bb
	nop			;e5bc
	nop			;e5bd
	nop			;e5be
	nop			;e5bf
	nop			;e5c0
	nop			;e5c1
	nop			;e5c2
	nop			;e5c3
	nop			;e5c4
	nop			;e5c5
	nop			;e5c6
	nop			;e5c7
	nop			;e5c8
	nop			;e5c9
	nop			;e5ca
	nop			;e5cb
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
	nop			;e5f0
	nop			;e5f1
	nop			;e5f2
	nop			;e5f3
	nop			;e5f4
	nop			;e5f5
	nop			;e5f6
	nop			;e5f7
	nop			;e5f8
	nop			;e5f9
	nop			;e5fa
	nop			;e5fb
	nop			;e5fc
	nop			;e5fd
	nop			;e5fe
	nop			;e5ff
	nop			;e600
	nop			;e601
	nop			;e602
	nop			;e603
	nop			;e604
	nop			;e605
	nop			;e606
	nop			;e607
	nop			;e608
	nop			;e609
	nop			;e60a
	nop			;e60b
le60ch:
	nop			;e60c
	nop			;e60d
	nop			;e60e
	ld (bc),a		;e60f
	xor c			;e610
	nop			;e611
	dec bc			;e612
	ld hl,(00940h)		;e613
	ld d,h			;e616
	add a,b			;e617
	ld b,0bbh		;e618
	nop			;e61a
	add hl,bc		;e61b
	ld d,l			;e61c
	nop			;e61d
	inc b			;e61e
	rst 38h			;e61f
	add a,b			;e620
	dec (hl)		;e621
	sbc a,h			;e622
	add a,b			;e623
	ld c,e			;e624
	ld h,e			;e625
	nop			;e626
	ld (hl),a		;e627
	ld d,l			;e628
	nop			;e629
	ld h,a			;e62a
	ld (hl),d		;e62b
	add a,b			;e62c
	scf			;e62d
	adc a,l			;e62e
	nop			;e62f
	rra			;e630
	defb 0fdh,080h,00ch ;illegal sequence	;e631
	defb 0edh ;next byte illegal after ed	;e634
	ret nz			;e635
	dec bc			;e636
	di			;e637
	ret nz			;e638
	ld c,0ffh		;e639
	add a,b			;e63b
	ld c,03eh		;e63c
	ld b,b			;e63e
	rlca			;e63f
	pop bc			;e640
	ret po			;e641
	rlca			;e642
	rst 38h			;e643
	ret nc			;e644
	inc bc			;e645
	rst 38h			;e646
	ret po			;e647
	ld (bc),a		;e648
	rst 38h			;e649
	ld d,b			;e64a
	inc bc			;e64b
	ld a,(hl)		;e64c
	and b			;e64d
	inc bc			;e64e
	sbc a,a			;e64f
	ret nz			;e650
	inc bc			;e651
	ret po			;e652
	nop			;e653
le654h:
	nop			;e654
	nop			;e655
	nop			;e656
	nop			;e657
	nop			;e658
	nop			;e659
	ld bc,000aah		;e65a
	rrca			;e65d
	cp 080h			;e65e
	rra			;e660
	rst 38h			;e661
	ld b,b			;e662
	ccf			;e663
	cp 0a0h			;e664
	ccf			;e666
	rst 38h			;e667
	ld b,b			;e668
	ccf			;e669
	rst 38h			;e66a
	and a			;e66b
	ccf			;e66c
	rst 38h			;e66d
	rst 18h			;e66e
	cpl			;e66f
	call m,057deh		;e670
	ld a,e			;e673
	cp a			;e674
	add hl,de		;e675
	ld h,a			;e676
	cp (hl)			;e677
	ld d,d			;e678
	inc de			;e679
	ld e,a			;e67a
	ld d,0b9h		;e67b
	sbc a,(hl)		;e67d
	ld d,c			;e67e
	pop de			;e67f
	ld e,l			;e680
	add hl,de		;e681
	and 09eh		;e682
	ld e,(hl)		;e684
	out (05dh),a		;e685
	ld c,l			;e687
	rst 18h			;e688
	ld a,02eh		;e689
	sbc a,0bdh		;e68b
	ld c,(hl)		;e68d
	sbc a,a			;e68e
	ld a,d			;e68f
	ld h,(hl)		;e690
	ld e,l			;e691
	ld a,l			;e692
	halt			;e693
	sbc a,d			;e694
	jp m,led7bh		;e695
	push af			;e698
	ld a,h			;e699
	cp e			;e69a
	xor d			;e69b
	nop			;e69c
le69dh:
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
	nop			;e6b0
	nop			;e6b1
	nop			;e6b2
	nop			;e6b3
	nop			;e6b4
	ld bc,lc0ffh		;e6b5
	nop			;e6b8
	ld (bc),a		;e6b9
	inc e			;e6ba
	jr nz,le6bdh		;e6bb
le6bdh:
	ld (bc),a		;e6bd
	jr z,le6c0h		;e6be
le6c0h:
	nop			;e6c0
	ld (bc),a		;e6c1
	ld d,b			;e6c2
	nop			;e6c3
	nop			;e6c4
	ld (bc),a		;e6c5
	sub b			;e6c6
	nop			;e6c7
	nop			;e6c8
	rrca			;e6c9
	ret po			;e6ca
	nop			;e6cb
	nop			;e6cc
le6cdh:
	inc de			;e6cd
	nop			;e6ce
	nop			;e6cf
	nop			;e6d0
	ld (00801h),hl		;e6d1
	add a,b			;e6d4
	ld hl,l9581h		;e6d5
	ld b,b			;e6d8
	inc de			;e6d9
	di			;e6da
	inc b			;e6db
	ld b,b			;e6dc
	rrca			;e6dd
	ld b,b			;e6de
	inc b			;e6df
	ret nz			;e6e0
	inc bc			;e6e1
	add a,c			;e6e2
	rlca			;e6e3
	ld b,b			;e6e4
	ld (bc),a		;e6e5
	nop			;e6e6
	add a,l			;e6e7
	ret nz			;e6e8
	inc bc			;e6e9
	ld bc,04085h		;e6ea
	ld (bc),a		;e6ed
	nop			;e6ee
	add a,h			;e6ef
	ret nz			;e6f0
	inc bc			;e6f1
	ld bc,lc484h		;e6f2
	ld (bc),a		;e6f5
	inc b			;e6f6
	adc a,h			;e6f7
	ld c,(hl)		;e6f8
	inc e			;e6f9
	dec de			;e6fa
	jr c,$+70		;e6fb
	nop			;e6fd
le6feh:
	jr le6cdh		;e6fe
le700h:
	sub h			;e700
	xor e			;e701
	adc a,h			;e702
	ld (hl),b		;e703
	cp a			;e704
	ld a,(hl)		;e705
	ld h,l			;e706
	inc b			;e707
	and 0d0h		;e708
	call z,sub_83e9h	;e70a
	adc a,a			;e70d
	and 067h		;e70e
	ld c,h			;e710
	push af			;e711
	ld a,c			;e712
	call z,sub_ff8ch	;e713
	inc l			;e716
	cp (hl)			;e717
	ld hl,lc6c8h		;e718
	ld a,b			;e71b
	ld hl,03ff0h		;e71c
	nop			;e71f
	call p,00001h		;e720
	ex af,af'		;e723
	ret m			;e724
	scf			;e725
	cp b			;e726
	adc a,080h		;e727
	xor l			;e729
	add a,b			;e72a
	xor h			;e72b
	ld b,000h		;e72c
	inc d			;e72e
	nop			;e72f
	nop			;e730
	nop			;e731
	nop			;e732
	dec b			;e733
	ld l,(hl)		;e734
	ret m			;e735
	ld a,(bc)		;e736
	inc bc			;e737
	ld d,l			;e738
	adc a,(hl)		;e739
	call pe,sub_91fdh	;e73a
	ld l,l			;e73d
	ld b,h			;e73e
	nop			;e73f
	djnz le742h		;e740
le742h:
	add a,b			;e742
	nop			;e743
	ld a,a			;e744
	ld (bc),a		;e745
	ld bc,00005h		;e746
	inc d			;e749
	nop			;e74a
	jr le74eh		;e74b
	add a,b			;e74d
le74eh:
	nop			;e74e
	nop			;e74f
	ld d,l			;e750
	ld c,d			;e751
	nop			;e752
	nop			;e753
	and b			;e754
	call m,00000h		;e755
	xor d			;e758
	ld (bc),a		;e759
	nop			;e75a
	ret po			;e75b
	nop			;e75c
	ld a,(00000h)		;e75d
	djnz le762h		;e760
le762h:
	nop			;e762
	ld bc,000feh		;e763
	ld bc,00003h		;e766
	nop			;e769
	nop			;e76a
	nop			;e76b
	ex af,af'		;e76c
	ld h,b			;e76d
	nop			;e76e
	nop			;e76f
	rst 18h			;e770
	add a,a			;e771
	nop			;e772
	nop			;e773
	nop			;e774
	ccf			;e775
	nop			;e776
	nop			;e777
	ld (hl),b		;e778
	ld (bc),a		;e779
	nop			;e77a
	ld (hl),b		;e77b
	djnz le77eh		;e77c
le77eh:
	nop			;e77e
	nop			;e77f
	nop			;e780
	nop			;e781
	nop			;e782
	nop			;e783
	call m,00000h		;e784
	nop			;e787
	nop			;e788
	nop			;e789
	nop			;e78a
	nop			;e78b
	cp b			;e78c
	ld a,a			;e78d
	ld hl,(0724ch)		;e78e
	rla			;e791
	nop			;e792
	nop			;e793
	nop			;e794
	call m,00000h		;e795
	nop			;e798
	nop			;e799
	nop			;e79a
	jr le79dh		;e79b
le79dh:
	nop			;e79d
	nop			;e79e
	nop			;e79f
	nop			;e7a0
	nop			;e7a1
	nop			;e7a2
	nop			;e7a3
	ld a,a			;e7a4
	nop			;e7a5
	nop			;e7a6
	nop			;e7a7
le7a8h:
	nop			;e7a8
	rrca			;e7a9
	rst 38h			;e7aa
	add a,c			;e7ab
	ld l,l			;e7ac
	rst 0			;e7ad
	rst 38h			;e7ae
	add a,c			;e7af
	ld l,l			;e7b0
	rst 38h			;e7b1
	cp 000h			;e7b2
	nop			;e7b4
	ccf			;e7b5
	nop			;e7b6
	rlca			;e7b7
	nop			;e7b8
	nop			;e7b9
	nop			;e7ba
	jr c,le7bdh		;e7bb
le7bdh:
	nop			;e7bd
	nop			;e7be
	nop			;e7bf
	nop			;e7c0
	nop			;e7c1
	nop			;e7c2
	nop			;e7c3
	ccf			;e7c4
	nop			;e7c5
	nop			;e7c6
	nop			;e7c7
	nop			;e7c8
	rra			;e7c9
	rst 38h			;e7ca
	pop hl			;e7cb
	call p,000f0h		;e7cc
	ld a,a			;e7cf
	cp (hl)			;e7d0
	and d			;e7d1
	cp 000h			;e7d2
	nop			;e7d4
	ei			;e7d5
	add a,b			;e7d6
	nop			;e7d7
	nop			;e7d8
	nop			;e7d9
	nop			;e7da
	ld a,b			;e7db
	nop			;e7dc
	jr nz,le7dfh		;e7dd
le7dfh:
	nop			;e7df
	nop			;e7e0
	nop			;e7e1
	ld bc,lfc00h		;e7e2
	nop			;e7e5
	nop			;e7e6
le7e7h:
	inc b			;e7e7
	nop			;e7e8
	nop			;e7e9
	nop			;e7ea
	add hl,sp		;e7eb
	ret po			;e7ec
	rst 20h			;e7ed
	ld b,03dh		;e7ee
	defb 0fdh,080h,000h ;illegal sequence	;e7f0
	nop			;e7f3
	nop			;e7f4
	ccf			;e7f5
	nop			;e7f6
	inc b			;e7f7
	nop			;e7f8
	nop			;e7f9
	nop			;e7fa
	ld a,b			;e7fb
	nop			;e7fc
	rla			;e7fd
	cp a			;e7fe
le7ffh:
	xor h			;e7ff
sub_e800h:
	push de			;e800
sub_e801h:
	cp 0bbh			;e801
le803h:
	call 05b3fh		;e803
	xor l			;e806
	ld l,d			;e807
	call m,sub_ccceh	;e808
	cp c			;e80b
	nop			;e80c
	ld (hl),b		;e80d
	defb 0fdh,0ffh,0abh ;illegal sequence	;e80e
	ld e,a			;e811
	rst 8			;e812
	ld a,l			;e813
	ld c,(hl)		;e814
	rst 38h			;e815
	ld l,059h		;e816
	defb 0fdh,055h ;ld d,iyl	;e818
	rst 30h			;e81a
	ld a,c			;e81b
	dec c			;e81c
	ld (hl),a		;e81d
	ld l,l			;e81e
	nop			;e81f
	ld l,h			;e820
	ld bc,00800h		;e821
	call m,04f1bh		;e824
	xor e			;e827
	add a,b			;e828
	ld a,c			;e829
	nop			;e82a
	ld a,b			;e82b
	ld b,000h		;e82c
	inc d			;e82e
	nop			;e82f
	nop			;e830
	ld (bc),a		;e831
	nop			;e832
	ld (bc),a		;e833
	call nc,00afch		;e834
	ld bc,l8565h		;e837
	ld e,b			;e83a
	push af			;e83b
	ld de,040adh		;e83c
	nop			;e83f
	djnz le842h		;e840
le842h:
	ret nz			;e842
	rrca			;e843
	ld a,a			;e844
	ld (bc),a		;e845
	ld bc,00007h		;e846
	jr le84bh		;e849
le84bh:
	jr le84eh		;e84b
	add a,b			;e84d
le84eh:
	nop			;e84e
	nop			;e84f
	and l			;e850
	halt			;e851
	nop			;e852
	nop			;e853
	and b			;e854
	call m,00000h		;e855
	xor d			;e858
	ld (bc),a		;e859
	nop			;e85a
	ret po			;e85b
	djnz le874h		;e85c
	nop			;e85e
	nop			;e85f
	djnz le862h		;e860
le862h:
	nop			;e862
	nop			;e863
	cp 000h			;e864
	ld bc,00003h		;e866
	nop			;e869
	nop			;e86a
	nop			;e86b
	inc d			;e86c
	ld h,b			;e86d
	nop			;e86e
	nop			;e86f
	push hl			;e870
	rst 8			;e871
	nop			;e872
	nop			;e873
le874h:
	nop			;e874
	ccf			;e875
	nop			;e876
	nop			;e877
	jr nc,le87ch		;e878
	nop			;e87a
	ld a,b			;e87b
le87ch:
	nop			;e87c
	nop			;e87d
	nop			;e87e
	nop			;e87f
	nop			;e880
	nop			;e881
	nop			;e882
	nop			;e883
	ret m			;e884
	nop			;e885
	nop			;e886
	nop			;e887
	nop			;e888
	nop			;e889
	inc e			;e88a
	ld (bc),a		;e88b
	or e			;e88c
	cp 05fh			;e88d
	ld (lce38h),hl		;e88f
	ret nz			;e892
	nop			;e893
	nop			;e894
	call m,00000h		;e895
	nop			;e898
	nop			;e899
	nop			;e89a
	jr le89dh		;e89b
le89dh:
	nop			;e89d
	nop			;e89e
	nop			;e89f
	nop			;e8a0
	nop			;e8a1
	nop			;e8a2
	nop			;e8a3
	ld a,a			;e8a4
	nop			;e8a5
	nop			;e8a6
	nop			;e8a7
	nop			;e8a8
	rra			;e8a9
	rst 38h			;e8aa
	call m,la96ah+1		;e8ab
	rst 38h			;e8ae
	ld a,0a5h		;e8af
	cp 0fdh			;e8b1
	nop			;e8b3
	nop			;e8b4
	ccf			;e8b5
	inc bc			;e8b6
	cp 000h			;e8b7
	nop			;e8b9
	nop			;e8ba
	jr c,le8bdh		;e8bb
le8bdh:
	nop			;e8bd
	nop			;e8be
	nop			;e8bf
	nop			;e8c0
	nop			;e8c1
	nop			;e8c2
	nop			;e8c3
	ld a,a			;e8c4
	nop			;e8c5
	nop			;e8c6
	nop			;e8c7
	nop			;e8c8
	rra			;e8c9
	rst 38h			;e8ca
	rra			;e8cb
	adc a,c			;e8cc
le8cdh:
	ccf			;e8cd
	rst 38h			;e8ce
	adc a,a			;e8cf
	ld a,a			;e8d0
	pop de			;e8d1
	jp m,00000h		;e8d2
	call m,00000h		;e8d5
	nop			;e8d8
	nop			;e8d9
	nop			;e8da
	ld a,b			;e8db
	nop			;e8dc
	jr nz,le8dfh		;e8dd
le8dfh:
	add a,b			;e8df
	nop			;e8e0
	nop			;e8e1
	ld bc,lf800h		;e8e2
	nop			;e8e5
	nop			;e8e6
	ld b,000h		;e8e7
	nop			;e8e9
	nop			;e8ea
	jr c,le8cdh		;e8eb
	rst 0			;e8ed
	ld b,001h		;e8ee
	call sub_80ffh		;e8f0
	nop			;e8f3
	nop			;e8f4
	ccf			;e8f5
	nop			;e8f6
	ld b,c			;e8f7
	ret m			;e8f8
	nop			;e8f9
	nop			;e8fa
	ld a,b			;e8fb
	nop			;e8fc
	dec a			;e8fd
	and a			;e8fe
	xor (hl)		;e8ff
sub_e900h:
	cp e			;e900
	rst 8			;e901
	ld l,a			;e902
	dec de			;e903
	ccf			;e904
	ld e,e			;e905
	ld e,c			;e906
	cp e			;e907
	ccf			;e908
	or 0ach			;e909
	xor c			;e90b
	nop			;e90c
	ld c,033h		;e90d
	ld h,b			;e90f
	ret nc			;e910
	sub b			;e911
	ld (hl),e		;e912
	dec (hl)		;e913
	ld l,(hl)		;e914
	rst 38h			;e915
	dec hl			;e916
	ld a,a			;e917
	ld l,e			;e918
	ld c,d			;e919
	ccf			;e91a
	add hl,sp		;e91b
	ld d,l			;e91c
	ld a,c			;e91d
	ld c,(hl)		;e91e
	nop			;e91f
	ld a,b			;e920
	nop			;e921
	nop			;e922
	ex af,af'		;e923
	call m,0870ah		;e924
	rst 10h			;e927
	add a,b			;e928
	ld e,l			;e929
	nop			;e92a
	ld e,b			;e92b
	ld b,000h		;e92c
	inc e			;e92e
	nop			;e92f
	nop			;e930
	ld (bc),a		;e931
	nop			;e932
	ld bc,lfcdch		;e933
	inc c			;e936
	ld bc,0032dh		;e937
	ld c,b			;e93a
	push hl			;e93b
	djnz $-75		;e93c
	ld b,b			;e93e
	nop			;e93f
	djnz le942h		;e940
le942h:
	ld a,a			;e942
	rst 38h			;e943
	cp (hl)			;e944
	ld (bc),a		;e945
	ld bc,00003h		;e946
	ex af,af'		;e949
	nop			;e94a
	jr le94eh		;e94b
	add a,b			;e94d
le94eh:
	nop			;e94e
	nop			;e94f
	cp a			;e950
	cp 000h			;e951
	nop			;e953
le954h:
	jr nz,le954h		;e954
	nop			;e956
	nop			;e957
	xor (hl)		;e958
	ld (bc),a		;e959
	nop			;e95a
	ret nz			;e95b
	djnz le974h		;e95c
	ld b,b			;e95e
	nop			;e95f
	djnz le962h		;e960
le962h:
	nop			;e962
	nop			;e963
	cp 000h			;e964
	ld bc,00001h		;e966
	nop			;e969
	nop			;e96a
	nop			;e96b
	jr z,le9ceh		;e96c
	nop			;e96e
	nop			;e96f
	ld a,l			;e970
	rst 18h			;e971
	add a,b			;e972
	nop			;e973
le974h:
	nop			;e974
	ld a,a			;e975
	nop			;e976
	nop			;e977
	jr nc,le97ah		;e978
le97ah:
	nop			;e97a
	ld a,b			;e97b
	nop			;e97c
	nop			;e97d
	nop			;e97e
	nop			;e97f
	djnz le982h		;e980
le982h:
	nop			;e982
	nop			;e983
	ld a,b			;e984
	nop			;e985
	ld bc,00000h		;e986
	nop			;e989
	ld a,a			;e98a
	adc a,h			;e98b
	xor a			;e98c
	call m,sub_d4bfh	;e98d
	ld e,(hl)		;e990
	ld a,0b0h		;e991
	nop			;e993
	nop			;e994
	call m,00000h		;e995
	nop			;e998
	ld (bc),a		;e999
	nop			;e99a
	jr le99dh		;e99b
le99dh:
	nop			;e99d
	nop			;e99e
	nop			;e99f
	nop			;e9a0
	nop			;e9a1
	nop			;e9a2
	nop			;e9a3
	cp 000h			;e9a4
	nop			;e9a6
	nop			;e9a7
	nop			;e9a8
	rra			;e9a9
	rst 38h			;e9aa
	add a,d			;e9ab
	ld (hl),a		;e9ac
	ld d,h			;e9ad
	rst 38h			;e9ae
	ld a,a			;e9af
	ld (hl),l		;e9b0
	cp 0ffh			;e9b1
	nop			;e9b3
	nop			;e9b4
	ccf			;e9b5
	rrca			;e9b6
	ret m			;e9b7
	nop			;e9b8
	nop			;e9b9
	nop			;e9ba
	jr c,le9bdh		;e9bb
le9bdh:
	nop			;e9bd
	nop			;e9be
	nop			;e9bf
	nop			;e9c0
	nop			;e9c1
	nop			;e9c2
	nop			;e9c3
	ld a,a			;e9c4
	nop			;e9c5
	nop			;e9c6
	nop			;e9c7
	nop			;e9c8
	rrca			;e9c9
	ret po			;e9ca
	cp 056h			;e9cb
	xor b			;e9cd
le9ceh:
	nop			;e9ce
	ret po			;e9cf
	rst 38h			;e9d0
	jp m,000fch		;e9d1
le9d4h:
	nop			;e9d4
	ld a,(hl)		;e9d5
	nop			;e9d6
	nop			;e9d7
	nop			;e9d8
	nop			;e9d9
	nop			;e9da
	ld a,b			;e9db
	nop			;e9dc
	jr c,le9ffh		;e9dd
	add a,b			;e9df
	nop			;e9e0
	nop			;e9e1
	ld bc,lfc00h		;e9e2
	nop			;e9e5
	nop			;e9e6
	ld (bc),a		;e9e7
	nop			;e9e8
	nop			;e9e9
sub_e9eah:
	nop			;e9ea
	inc a			;e9eb
	ret po			;e9ec
	rst 0			;e9ed
	ld b,001h		;e9ee
	cp e			;e9f0
	rst 20h			;e9f1
	add a,b			;e9f2
	nop			;e9f3
le9f4h:
	nop			;e9f4
	ccf			;e9f5
	nop			;e9f6
	cpl			;e9f7
	call z,00000h		;e9f8
	ld a,b			;e9fb
	nop			;e9fc
	dec hl			;e9fd
	push de			;e9fe
le9ffh:
	cp d			;e9ff
sub_ea00h:
	ld l,e			;ea00
	dec b			;ea01
	ld b,b			;ea02
	ret pe			;ea03
	ld a,(hl)		;ea04
	push af			;ea05
	ld l,a			;ea06
	ld a,c			;ea07
	ld b,e			;ea08
	xor h			;ea09
	xor 0aah		;ea0a
	nop			;ea0c
	inc bc			;ea0d
	sub (hl)		;ea0e
	add a,b			;ea0f
	ld (hl),b		;ea10
	and b			;ea11
	rla			;ea12
	scf			;ea13
	ld h,a			;ea14
	ld a,l			;ea15
	dec d			;ea16
	ld e,c			;ea17
	and a			;ea18
	ld sp,hl		;ea19
	xor e			;ea1a
	cp c			;ea1b
	ld b,l			;ea1c
	ld h,d			;ea1d
	ld b,(hl)		;ea1e
lea1fh:
	nop			;ea1f
	ld l,b			;ea20
	nop			;ea21
	nop			;ea22
	ex af,af'		;ea23
	call m,0870eh		;ea24
	sbc a,h			;ea27
	add a,b			;ea28
	ld e,c			;ea29
	nop			;ea2a
	ld e,b			;ea2b
	rlca			;ea2c
	nop			;ea2d
	ex af,af'		;ea2e
	nop			;ea2f
	nop			;ea30
	inc b			;ea31
	nop			;ea32
	ld bc,l7c78h		;ea33
	inc b			;ea36
	ld bc,001b9h		;ea37
	jr c,lea1fh		;ea3a
	djnz le9d4h		;ea3c
	ld b,b			;ea3e
	nop			;ea3f
	djnz lea42h		;ea40
lea42h:
	rra			;ea42
	rst 38h			;ea43
	cp (hl)			;ea44
	nop			;ea45
	ld bc,00003h		;ea46
	ex af,af'		;ea49
	nop			;ea4a
	jr lea4dh		;ea4b
lea4dh:
	ret nz			;ea4d
	nop			;ea4e
	nop			;ea4f
	pop hl			;ea50
	adc a,000h		;ea51
	nop			;ea53
	ld b,b			;ea54
	ld a,(hl)		;ea55
	nop			;ea56
	nop			;ea57
	call c,00002h		;ea58
	ret po			;ea5b
	djnz lea72h		;ea5c
	nop			;ea5e
lea5fh:
	nop			;ea5f
	djnz lea62h		;ea60
lea62h:
	nop			;ea62
	nop			;ea63
	cp 000h			;ea64
	ld bc,00001h		;ea66
	nop			;ea69
	nop			;ea6a
	nop			;ea6b
	ld l,b			;ea6c
	jr nc,lea6fh		;ea6d
lea6fh:
	jr $+128		;ea6f
	rst 18h			;ea71
lea72h:
	add a,b			;ea72
	nop			;ea73
	nop			;ea74
	ld a,a			;ea75
	nop			;ea76
	nop			;ea77
	djnz $+4		;ea78
	nop			;ea7a
	jr c,lea7dh		;ea7b
lea7dh:
	nop			;ea7d
	nop			;ea7e
	nop			;ea7f
	nop			;ea80
	nop			;ea81
	nop			;ea82
	nop			;ea83
	ld a,h			;ea84
	nop			;ea85
	ld bc,00000h		;ea86
	nop			;ea89
	xor a			;ea8a
	cp 0dfh			;ea8b
	ei			;ea8d
	rst 38h			;ea8e
	jp m,lfd6fh		;ea8f
	ret pe			;ea92
	nop			;ea93
	nop			;ea94
	call m,00000h		;ea95
	nop			;ea98
	nop			;ea99
	nop			;ea9a
	jr lea9dh		;ea9b
lea9dh:
	nop			;ea9d
	nop			;ea9e
	nop			;ea9f
leaa0h:
	nop			;eaa0
	nop			;eaa1
	nop			;eaa2
	nop			;eaa3
	cp 000h			;eaa4
	nop			;eaa6
	nop			;eaa7
	nop			;eaa8
	ccf			;eaa9
	rst 38h			;eaaa
	ld d,l			;eaab
	ld (hl),a		;eaac
	ld hl,(00fffh)		;eaad
	or l			;eab0
	defb 0fdh,0fdh,000h ;illegal sequence	;eab1
	nop			;eab4
	ccf			;eab5
	ld e,000h		;eab6
	nop			;eab8
	nop			;eab9
	nop			;eaba
	jr c,leabdh		;eabb
leabdh:
	nop			;eabd
	nop			;eabe
	nop			;eabf
	nop			;eac0
	nop			;eac1
	nop			;eac2
	nop			;eac3
	ld a,a			;eac4
	nop			;eac5
	nop			;eac6
	nop			;eac7
	nop			;eac8
	rlca			;eac9
	rrca			;eaca
	pop af			;eacb
	and a			;eacc
	sub (hl)		;eacd
	cp a			;eace
	rrca			;eacf
	ld a,a			;ead0
	rst 38h			;ead1
	call p,00000h		;ead2
	ld a,(hl)		;ead5
	nop			;ead6
	nop			;ead7
	nop			;ead8
	nop			;ead9
	nop			;eada
	ld (hl),b		;eadb
	nop			;eadc
	or d			;eadd
	jr nc,leaa0h		;eade
	nop			;eae0
	nop			;eae1
	inc bc			;eae2
	nop			;eae3
	call m,00000h		;eae4
	ld b,000h		;eae7
leae9h:
	nop			;eae9
	nop			;eaea
	inc e			;eaeb
	ld (hl),b		;eaec
	add a,d			;eaed
	ld b,000h		;eaee
	cp e			;eaf0
	rst 10h			;eaf1
	nop			;eaf2
	nop			;eaf3
	nop			;eaf4
	ccf			;eaf5
	nop			;eaf6
	rra			;eaf7
	ld (00000h),hl		;eaf8
	ld a,b			;eafb
	nop			;eafc
	jr z,leb6ch		;eafd
	ld a,e			;eaff
leb00h:
	ld a,d			;eb00
	inc bc			;eb01
	ret nz			;eb02
	scf			;eb03
	ld a,h			;eb04
	ld h,l			;eb05
	ld l,0abh		;eb06
	ld b,c			;eb08
	jp pe,l7af3h		;eb09
	inc c			;eb0c
	nop			;eb0d
	defb 0ddh,000h,020h ;illegal sequence	;eb0e
	ld h,b			;eb11
	ex af,af'		;eb12
	add a,045h		;eb13
	ld e,(hl)		;eb15
	ret z			;eb16
	rst 8			;eb17
	call p,09aeeh		;eb18
	cp c			;eb1b
	ld e,l			;eb1c
	jp c,00042h		;eb1d
	jr z,leb22h		;eb20
leb22h:
	nop			;eb22
	ex af,af'		;eb23
	cp 005h			;eb24
	add a,e			;eb26
	rrca			;eb27
	add a,b			;eb28
	ld l,l			;eb29
	nop			;eb2a
	ld l,b			;eb2b
	inc bc			;eb2c
	nop			;eb2d
	ex af,af'		;eb2e
	ex af,af'		;eb2f
	nop			;eb30
	inc b			;eb31
	inc b			;eb32
	ld bc,l7ea7h+1		;eb33
	inc b			;eb36
	nop			;eb37
	cp e			;eb38
	ld (bc),a		;eb39
	jr nc,$-60		;eb3a
	djnz leb95h		;eb3c
	ld b,b			;eb3e
	nop			;eb3f
	djnz leb42h		;eb40
leb42h:
	nop			;eb42
	rra			;eb43
	cp (hl)			;eb44
	nop			;eb45
	ld bc,00003h		;eb46
	jr leb4bh		;eb49
leb4bh:
	jr leb4dh		;eb4b
leb4dh:
	ret nz			;eb4d
	nop			;eb4e
	nop			;eb4f
	jp c,000beh		;eb50
	nop			;eb53
	ld b,b			;eb54
	ld a,(hl)		;eb55
	nop			;eb56
	nop			;eb57
	ld d,h			;eb58
	ld (bc),a		;eb59
	nop			;eb5a
	ret po			;eb5b
	nop			;eb5c
	inc e			;eb5d
	nop			;eb5e
	nop			;eb5f
	djnz leb62h		;eb60
leb62h:
	nop			;eb62
	nop			;eb63
	cp 000h			;eb64
	ld bc,00001h		;eb66
	nop			;eb69
	nop			;eb6a
	nop			;eb6b
leb6ch:
	ret c			;eb6c
	jr nc,lebabh		;eb6d
	nop			;eb6f
	ld a,a			;eb70
	di			;eb71
	add a,b			;eb72
	nop			;eb73
	nop			;eb74
	ld a,(hl)		;eb75
	nop			;eb76
	nop			;eb77
	jr nz,$+4		;eb78
	nop			;eb7a
	jr c,leb7dh		;eb7b
leb7dh:
	nop			;eb7d
	nop			;eb7e
	nop			;eb7f
	nop			;eb80
	nop			;eb81
	nop			;eb82
	nop			;eb83
	ld a,h			;eb84
	nop			;eb85
	nop			;eb86
	nop			;eb87
	nop			;eb88
	ld bc,lfed7h		;eb89
	rst 18h			;eb8c
	di			;eb8d
	rst 38h			;eb8e
	or 0d7h			;eb8f
	cp b			;eb91
	call p,00000h		;eb92
leb95h:
	cp 000h			;eb95
	nop			;eb97
	nop			;eb98
	nop			;eb99
	nop			;eb9a
	jr c,leb9dh		;eb9b
leb9dh:
	nop			;eb9d
	nop			;eb9e
	nop			;eb9f
	nop			;eba0
	nop			;eba1
	nop			;eba2
	nop			;eba3
	ld a,(hl)		;eba4
	nop			;eba5
	nop			;eba6
	nop			;eba7
	nop			;eba8
	ccf			;eba9
	rst 38h			;ebaa
lebabh:
	dec hl			;ebab
	scf			;ebac
	ld d,h			;ebad
	rst 38h			;ebae
	ld (hl),c		;ebaf
	out (0fdh),a		;ebb0
	rst 38h			;ebb2
	nop			;ebb3
	nop			;ebb4
	ld a,0f8h		;ebb5
	nop			;ebb7
	nop			;ebb8
	nop			;ebb9
	nop			;ebba
	jr c,lebbdh		;ebbb
lebbdh:
	nop			;ebbd
	nop			;ebbe
	nop			;ebbf
	nop			;ebc0
	nop			;ebc1
	nop			;ebc2
	nop			;ebc3
	ld a,(hl)		;ebc4
	nop			;ebc5
	nop			;ebc6
	nop			;ebc7
	nop			;ebc8
	nop			;ebc9
	cp 02bh			;ebca
	ex de,hl		;ebcc
	rst 18h			;ebcd
	rra			;ebce
	and b			;ebcf
	rst 38h			;ebd0
	rst 38h			;ebd1
	ret pe			;ebd2
	nop			;ebd3
	nop			;ebd4
	ld a,(hl)		;ebd5
	nop			;ebd6
	nop			;ebd7
	nop			;ebd8
	nop			;ebd9
	nop			;ebda
	ld (hl),b		;ebdb
	nop			;ebdc
lebddh:
	ld a,b			;ebdd
	jr nc,lec20h		;ebde
	nop			;ebe0
	nop			;ebe1
	ld c,000h		;ebe2
	ld a,h			;ebe4
	nop			;ebe5
	nop			;ebe6
	ld b,000h		;ebe7
	nop			;ebe9
	nop			;ebea
	ld e,031h		;ebeb
	ld b,003h		;ebed
	nop			;ebef
	or e			;ebf0
	xor a			;ebf1
	nop			;ebf2
	nop			;ebf3
	nop			;ebf4
	ccf			;ebf5
	nop			;ebf6
	halt			;ebf7
	ld bc,00000h		;ebf8
	jr c,lebfdh		;ebfb
lebfdh:
	ld (ld9aeh),a		;ebfd
	ld (hl),d		;ec00
	ld (bc),a		;ec01
	add a,b			;ec02
	inc d			;ec03
	call m,sub_b7efh	;ec04
	sbc a,d			;ec07
	ld b,c			;ec08
	ld a,e			;ec09
	or a			;ec0a
	ld d,(hl)		;ec0b
	inc c			;ec0c
	nop			;ec0d
	ld h,(hl)		;ec0e
	nop			;ec0f
	jr nz,lec52h		;ec10
	ex af,af'		;ec12
	ld (hl),l		;ec13
	ld c,c			;ec14
	ld a,(hl)		;ec15
	ld (hl),079h		;ec16
lec18h:
	ld (hl),e		;ec18
	pop bc			;ec19
	rla			;ec1a
	exx			;ec1b
	jr c,lebddh		;ec1c
	ld (bc),a		;ec1e
	nop			;ec1f
lec20h:
	jr nc,lec22h		;ec20
lec22h:
	nop			;ec22
	nop			;ec23
	rst 38h			;ec24
	rlca			;ec25
	inc bc			;ec26
	adc a,e			;ec27
	nop			;ec28
	ld a,000h		;ec29
	jr z,lec30h		;ec2b
	nop			;ec2d
	ex af,af'		;ec2e
	inc b			;ec2f
lec30h:
	nop			;ec30
	nop			;ec31
	jr lec34h		;ec32
lec34h:
	ret c			;ec34
	ld a,(hl)		;ec35
	inc b			;ec36
	nop			;ec37
	xor (hl)		;ec38
	ld (bc),a		;ec39
	jr nc,$-60		;ec3a
	nop			;ec3c
	ld e,e			;ec3d
	ld b,b			;ec3e
	nop			;ec3f
	djnz lec42h		;ec40
lec42h:
	nop			;ec42
	inc bc			;ec43
	cp (hl)			;ec44
	nop			;ec45
	ld bc,00003h		;ec46
	djnz lec4bh		;ec49
lec4bh:
	ex af,af'		;ec4b
	nop			;ec4c
	ret nz			;ec4d
	ld bc,lff80h		;ec4e
	ld c,(hl)		;ec51
lec52h:
	inc c			;ec52
	nop			;ec53
	ret nz			;ec54
	ld a,a			;ec55
	nop			;ec56
	nop			;ec57
	ld e,h			;ec58
	ld (bc),a		;ec59
	nop			;ec5a
	ret p			;ec5b
	nop			;ec5c
	ex af,af'		;ec5d
	nop			;ec5e
	nop			;ec5f
	nop			;ec60
	nop			;ec61
	nop			;ec62
	nop			;ec63
	cp 000h			;ec64
	ld bc,00001h		;ec66
	nop			;ec69
	nop			;ec6a
	nop			;ec6b
	ret nc			;ec6c
	jr nc,leceeh		;ec6d
	add a,b			;ec6f
	ld b,a			;ec70
	adc a,e			;ec71
	inc c			;ec72
	nop			;ec73
	nop			;ec74
	cp 000h			;ec75
	nop			;ec77
	jr nz,lec7ah		;ec78
lec7ah:
	nop			;ec7a
	jr lec7dh		;ec7b
lec7dh:
	nop			;ec7d
	nop			;ec7e
	nop			;ec7f
	djnz lec82h		;ec80
lec82h:
	nop			;ec82
	nop			;ec83
	ld a,000h		;ec84
	ld bc,00000h		;ec86
	inc bc			;ec89
	ex de,hl		;ec8a
	cp 0dfh			;ec8b
	rst 28h			;ec8d
	rst 38h			;ec8e
	defb 0fdh,058h,046h ;illegal sequence	;ec8f
	ld a,d			;ec92
	nop			;ec93
	nop			;ec94
	cp 000h			;ec95
	nop			;ec97
	nop			;ec98
	nop			;ec99
	nop			;ec9a
	jr lec9dh		;ec9b
lec9dh:
	nop			;ec9d
	nop			;ec9e
	nop			;ec9f
	nop			;eca0
	nop			;eca1
	nop			;eca2
	nop			;eca3
	ld a,(hl)		;eca4
	nop			;eca5
	nop			;eca6
	nop			;eca7
	nop			;eca8
	ccf			;eca9
	rst 38h			;ecaa
	ld d,l			;ecab
	cp c			;ecac
	xor d			;ecad
	rst 38h			;ecae
	ld a,a			;ecaf
	call m,lfffdh		;ecb0
	nop			;ecb3
	nop			;ecb4
	ld a,l			;ecb5
	ret m			;ecb6
	nop			;ecb7
	nop			;ecb8
	nop			;ecb9
	nop			;ecba
	jr c,lecbdh		;ecbb
lecbdh:
	nop			;ecbd
	nop			;ecbe
	nop			;ecbf
	nop			;ecc0
	nop			;ecc1
	nop			;ecc2
	nop			;ecc3
	cp 000h			;ecc4
	nop			;ecc6
	nop			;ecc7
	nop			;ecc8
	nop			;ecc9
	nop			;ecca
	in a,(0e5h)		;eccb
	rst 28h			;eccd
	add a,a			;ecce
	ld d,l			;eccf
	ccf			;ecd0
	rst 38h			;ecd1
	ret nc			;ecd2
	nop			;ecd3
	nop			;ecd4
	ld a,(hl)		;ecd5
	nop			;ecd6
	nop			;ecd7
	nop			;ecd8
	nop			;ecd9
	nop			;ecda
	ld h,b			;ecdb
	nop			;ecdc
	ld hl,(04030h)		;ecdd
	nop			;ece0
	nop			;ece1
	ld a,(hl)		;ece2
	nop			;ece3
	ld a,(hl)		;ece4
	nop			;ece5
	nop			;ece6
	ld c,000h		;ece7
	nop			;ece9
	nop			;ecea
	ld c,000h		;eceb
	inc b			;eced
leceeh:
	inc bc			;ecee
	nop			;ecef
	ret			;ecf0
	rla			;ecf1
	nop			;ecf2
	nop			;ecf3
	nop			;ecf4
	ld a,(hl)		;ecf5
	nop			;ecf6
	call z,00009h		;ecf7
sub_ecfah:
	nop			;ecfa
	inc a			;ecfb
	nop			;ecfc
	inc (hl)		;ecfd
lecfeh:
	cp 07dh			;ecfe
led00h:
	ld d,h			;ed00
	inc bc			;ed01
	add a,b			;ed02
	inc d			;ed03
	ei			;ed04
	sbc a,h			;ed05
	call nc,040f7h		;ed06
	sbc a,03fh		;ed09
	ld d,h			;ed0b
	inc c			;ed0c
	nop			;ed0d
	ld hl,(02000h)		;ed0e
	ld b,b			;ed11
	ex af,af'		;ed12
	dec bc			;ed13
	dec hl			;ed14
	call m,sub_8e12h	;ed15
	or e			;ed18
	ld e,(hl)		;ed19
	or 02bh			;ed1a
	xor 0d5h		;ed1c
	inc b			;ed1e
	nop			;ed1f
	jr nc,led22h		;ed20
led22h:
	nop			;ed22
	nop			;ed23
	rst 38h			;ed24
	inc bc			;ed25
	inc bc			;ed26
	dec c			;ed27
	nop			;ed28
	ld a,(03800h)		;ed29
	inc bc			;ed2c
	nop			;ed2d
	ex af,af'		;ed2e
	nop			;ed2f
	dec b			;ed30
	ld l,b			;ed31
	jr nz,led34h		;ed32
led34h:
	sub b			;ed34
	cp 004h			;ed35
	nop			;ed37
	and (hl)		;ed38
	ld (bc),a		;ed39
	djnz lecfeh		;ed3a
	djnz leda9h		;ed3c
	ld b,b			;ed3e
	nop			;ed3f
	nop			;ed40
	nop			;ed41
	nop			;ed42
	nop			;ed43
	ld a,(hl)		;ed44
	nop			;ed45
	nop			;ed46
	inc bc			;ed47
	nop			;ed48
	nop			;ed49
	nop			;ed4a
	ex af,af'		;ed4b
	nop			;ed4c
	ret nz			;ed4d
	nop			;ed4e
	ld (hl),b		;ed4f
	jp p,0034fh		;ed50
	nop			;ed53
	add a,b			;ed54
	ccf			;ed55
	nop			;ed56
	nop			;ed57
	ld a,b			;ed58
	ld (bc),a		;ed59
	nop			;ed5a
	ret po			;ed5b
	djnz $+10		;ed5c
	nop			;ed5e
	nop			;ed5f
	nop			;ed60
	nop			;ed61
	nop			;ed62
	nop			;ed63
	call m,00100h		;ed64
	ld bc,00000h		;ed67
	nop			;ed6a
	nop			;ed6b
	ret nc			;ed6c
	ld (0e0eah),hl		;ed6d
	ld e,b			;ed70
	ld e,e			;ed71
	inc bc			;ed72
	nop			;ed73
	nop			;ed74
	cp 000h			;ed75
	nop			;ed77
	jr nz,led7ah		;ed78
led7ah:
	nop			;ed7a
led7bh:
	jr c,led7dh		;ed7b
led7dh:
	nop			;ed7d
	nop			;ed7e
	nop			;ed7f
	nop			;ed80
	nop			;ed81
	nop			;ed82
	nop			;ed83
	ld a,000h		;ed84
	ld bc,00000h		;ed86
	rlca			;ed89
	jp p,ldffeh		;ed8a
	rst 18h			;ed8d
	rst 38h			;ed8e
	ei			;ed8f
	ld a,a			;ed90
	cp 0feh			;ed91
	nop			;ed93
	nop			;ed94
	ld a,a			;ed95
	nop			;ed96
	nop			;ed97
	nop			;ed98
	nop			;ed99
	nop			;ed9a
	jr c,led9dh		;ed9b
led9dh:
	nop			;ed9d
	nop			;ed9e
	nop			;ed9f
	nop			;eda0
	nop			;eda1
	nop			;eda2
	nop			;eda3
	ld a,a			;eda4
	nop			;eda5
	nop			;eda6
	nop			;eda7
	nop			;eda8
leda9h:
	ccf			;eda9
	rst 38h			;edaa
	dec hl			;edab
	ld l,031h		;edac
	rst 38h			;edae
	rrca			;edaf
	cp (hl)			;edb0
	dec a			;edb1
	rst 38h			;edb2
	nop			;edb3
	nop			;edb4
	ld a,e			;edb5
	ret p			;edb6
	nop			;edb7
	nop			;edb8
ledb9h:
	nop			;edb9
	nop			;edba
	ld e,b			;edbb
	nop			;edbc
	nop			;edbd
	nop			;edbe
	nop			;edbf
	nop			;edc0
	nop			;edc1
	nop			;edc2
	nop			;edc3
	call m,00000h		;edc4
	nop			;edc7
	nop			;edc8
	nop			;edc9
	ld bc,lc179h		;edca
	rst 28h			;edcd
	add hl,bc		;edce
	cp 0c7h			;edcf
	jp m,000a0h		;edd1
	nop			;edd4
	ld a,(hl)		;edd5
	nop			;edd6
	nop			;edd7
	nop			;edd8
	nop			;edd9
sub_eddah:
	nop			;edda
	ld h,b			;eddb
	nop			;eddc
	ld a,038h		;eddd
	ld h,b			;eddf
	nop			;ede0
	nop			;ede1
	call m,07e00h		;ede2
	nop			;ede5
	nop			;ede6
	inc c			;ede7
	nop			;ede8
	nop			;ede9
	nop			;edea
sub_edebh:
	ld b,000h		;edeb
	ex af,af'		;eded
	inc bc			;edee
	nop			;edef
	cp e			;edf0
	rst 20h			;edf1
	nop			;edf2
	nop			;edf3
	nop			;edf4
	ld a,(hl)		;edf5
	nop			;edf6
	cp b			;edf7
	add a,b			;edf8
	nop			;edf9
	nop			;edfa
	inc e			;edfb
	nop			;edfc
	ld c,d			;edfd
	scf			;edfe
	add a,054h		;edff
	ld bc,00000h		;ee01
	ret m			;ee04
	push hl			;ee05
	xor a			;ee06
	inc e			;ee07
	add a,b			;ee08
	call po,074e7h		;ee09
	inc c			;ee0c
	nop			;ee0d
	ld h,000h		;ee0e
	jr nz,lee52h		;ee10
	djnz lee1ah		;ee12
	ld hl,(01bfch)		;ee14
	ld (bc),a		;ee17
	ld a,d			;ee18
	adc a,(hl)		;ee19
lee1ah:
	or h			;ee1a
	ld a,(hl)		;ee1b
lee1ch:
	sub e			;ee1c
	ld c,d			;ee1d
	inc b			;ee1e
	nop			;ee1f
	djnz lee22h		;ee20
lee22h:
	nop			;ee22
	nop			;ee23
	rst 38h			;ee24
	ld bc,00501h		;ee25
	nop			;ee28
	ld hl,(01800h)		;ee29
	ld bc,00080h		;ee2c
	nop			;ee2f
	ld hl,(000b4h)		;ee30
	nop			;ee33
	sub b			;ee34
	call m,00000h		;ee35
	xor (hl)		;ee38
	ld (bc),a		;ee39
	jr nz,lee1ch		;ee3a
	nop			;ee3c
	cpl			;ee3d
	ld b,b			;ee3e
	nop			;ee3f
	djnz lee42h		;ee40
lee42h:
	nop			;ee42
	ld bc,000feh		;ee43
	nop			;ee46
	inc bc			;ee47
	nop			;ee48
	nop			;ee49
	nop			;ee4a
	ex af,af'		;ee4b
	nop			;ee4c
	ld h,b			;ee4d
	nop			;ee4e
	nop			;ee4f
	di			;ee50
	dec sp			;ee51
lee52h:
	nop			;ee52
	nop			;ee53
	nop			;ee54
	ccf			;ee55
lee56h:
	nop			;ee56
	nop			;ee57
	ld c,b			;ee58
	nop			;ee59
	nop			;ee5a
	ld (hl),b		;ee5b
	nop			;ee5c
	ex af,af'		;ee5d
sub_ee5eh:
	nop			;ee5e
	nop			;ee5f
	djnz lee62h		;ee60
lee62h:
	nop			;ee62
	nop			;ee63
	call m,00100h		;ee64
	ld bc,00000h		;ee67
	nop			;ee6a
	nop			;ee6b
	or b			;ee6c
	dec d			;ee6d
	call nz,06ab8h		;ee6e
	rst 0			;ee71
	nop			;ee72
	nop			;ee73
	nop			;ee74
	call m,00000h		;ee75
	jr nz,$+4		;ee78
	nop			;ee7a
	jr lee7dh		;ee7b
lee7dh:
	nop			;ee7d
	nop			;ee7e
	nop			;ee7f
	nop			;ee80
	nop			;ee81
	nop			;ee82
	nop			;ee83
	ld a,a			;ee84
	nop			;ee85
	nop			;ee86
	nop			;ee87
	nop			;ee88
	rlca			;ee89
	call m,sub_ee5eh	;ee8a
	ccf			;ee8d
	rst 38h			;ee8e
	defb 0fdh,00eh,0ffh ;illegal sequence	;ee8f
	ld a,d			;ee92
	nop			;ee93
	nop			;ee94
	ld a,a			;ee95
	nop			;ee96
	nop			;ee97
	nop			;ee98
	nop			;ee99
	nop			;ee9a
	jr lee9dh		;ee9b
lee9dh:
	nop			;ee9d
	nop			;ee9e
	nop			;ee9f
	nop			;eea0
	nop			;eea1
	nop			;eea2
	nop			;eea3
	ccf			;eea4
	nop			;eea5
	nop			;eea6
	nop			;eea7
	nop			;eea8
	ccf			;eea9
	rst 38h			;eeaa
	ld e,0dfh		;eeab
	rst 8			;eead
	rst 38h			;eeae
	jr nc,$-63		;eeaf
	ld e,(hl)		;eeb1
	defb 0fdh,000h,000h ;illegal sequence	;eeb2
	ld (hl),a		;eeb5
	ret nz			;eeb6
	nop			;eeb7
	nop			;eeb8
	nop			;eeb9
	nop			;eeba
	ld a,b			;eebb
	nop			;eebc
	nop			;eebd
	nop			;eebe
	nop			;eebf
	nop			;eec0
	nop			;eec1
	nop			;eec2
	nop			;eec3
	call m,00000h		;eec4
	nop			;eec7
	nop			;eec8
	nop			;eec9
	nop			;eeca
	ld a,c			;eecb
	call nz,00cefh		;eecc
	ld a,(hl)		;eecf
	ret m			;eed0
	ld a,a			;eed1
	ld b,b			;eed2
	nop			;eed3
	nop			;eed4
	ld a,000h		;eed5
	nop			;eed7
	nop			;eed8
	nop			;eed9
	nop			;eeda
	ld a,b			;eedb
	nop			;eedc
	ld d,078h		;eedd
	jr nz,leee1h		;eedf
leee1h:
	nop			;eee1
	ret m			;eee2
	nop			;eee3
	ld a,a			;eee4
	nop			;eee5
	nop			;eee6
	inc e			;eee7
	nop			;eee8
	ex af,af'		;eee9
	nop			;eeea
	ld bc,00100h		;eeeb
	inc bc			;eeee
	nop			;eeef
	push af			;eef0
	sbc a,000h		;eef1
	nop			;eef3
	nop			;eef4
	ld a,h			;eef5
	nop			;eef6
	pop af			;eef7
	ret m			;eef8
	nop			;eef9
	nop			;eefa
	inc e			;eefb
	nop			;eefc
	dec d			;eefd
	ld a,b			;eefe
	ld h,b			;eeff
lef00h:
	ex af,af'		;ef00
	nop			;ef01
	call m,07f00h		;ef02
	nop			;ef05
	djnz lef20h		;ef06
	nop			;ef08
	ex af,af'		;ef09
	nop			;ef0a
	nop			;ef0b
	nop			;ef0c
	ld bc,00000h		;ef0d
	rst 18h			;ef10
	jp p,00000h		;ef11
	ret po			;ef14
	call m,sub_9000h	;ef15
	rst 38h			;ef18
	nop			;ef19
	ex af,af'		;ef1a
	ld (bc),a		;ef1b
	nop			;ef1c
	call c,08bbbh		;ef1d
lef20h:
	rst 30h			;ef20
	adc a,c			;ef21
	cp (hl)			;ef22
	ld (bc),a		;ef23
	cp d			;ef24
	or 0cah			;ef25
	rrca			;ef27
	ld (bc),a		;ef28
	ld l,l			;ef29
	cp l			;ef2a
	ld l,e			;ef2b
	ld e,e			;ef2c
	ldir			;ef2d
	rrca			;ef2f
	halt			;ef30
	push af			;ef31
	dec d			;ef32
	adc a,a			;ef33
	jp po,040fdh		;ef34
	nop			;ef37
	inc a			;ef38
	ld l,h			;ef39
	ld a,b			;ef3a
	rst 0			;ef3b
	inc d			;ef3c
	sub d			;ef3d
	add a,l			;ef3e
	nop			;ef3f
	ld (hl),c		;ef40
	ret po			;ef41
	add hl,hl		;ef42
	sub (hl)		;ef43
	sub d			;ef44
	xor d			;ef45
	sbc a,l			;ef46
	djnz lefc8h		;ef47
	cp a			;ef49
	rst 38h			;ef4a
	cp l			;ef4b
	cp (hl)			;ef4c
	cp 09fh			;ef4d
	ld c,a			;ef4f
	and b			;ef50
	ld a,l			;ef51
	rst 8			;ef52
	rst 38h			;ef53
	rst 8			;ef54
	rst 38h			;ef55
	rst 38h			;ef56
	call nc,sub_c81fh	;ef57
	rrca			;ef5a
	push bc			;ef5b
	ex af,af'		;ef5c
	rrca			;ef5d
	rst 20h			;ef5e
	rst 0			;ef5f
	defb 0edh ;next byte illegal after ed	;ef60
	ccf			;ef61
	defb 0fdh,00eh,00ch ;illegal sequence	;ef62
	ld (bc),a		;ef65
lef66h:
	jr nc,lef66h		;ef66
	jr z,$+50		;ef68
	ccf			;ef6a
	rst 38h			;ef6b
	rst 38h			;ef6c
	rst 38h			;ef6d
	or 07ah			;ef6e
	rst 30h			;ef70
	rst 38h			;ef71
	ld e,h			;ef72
	ccf			;ef73
	rst 38h			;ef74
	xor b			;ef75
	rlca			;ef76
	rst 38h			;ef77
	ld a,(hl)		;ef78
	rst 0			;ef79
	ld a,a			;ef7a
	ret nz			;ef7b
	ccf			;ef7c
	add a,l			;ef7d
	cp 01ah			;ef7e
	rlca			;ef80
	ex (sp),hl		;ef81
	rst 20h			;ef82
	defb 0fdh,0fah,04dh ;illegal sequence	;ef83
	cp 0f5h			;ef86
	jp po,00385h		;ef88
	xor e			;ef8b
	ld a,a			;ef8c
	jp po,0ce81h		;ef8d
	sub h			;ef90
	add a,b			;ef91
	nop			;ef92
	ld bc,04700h		;ef93
	dec e			;ef96
	ret nz			;ef97
	ld bc,le9f4h		;ef98
	ld a,a			;ef9b
	and 081h		;ef9c
	ld a,a			;ef9e
	jp pe,ldbe7h		;ef9f
	pop af			;efa2
	defb 0edh ;next byte illegal after ed	;efa3
	cp 02eh			;efa4
	rst 10h			;efa6
	adc a,a			;efa7
	sbc a,(hl)		;efa8
	add a,a			;efa9
	ret nz			;efaa
	ccf			;efab
	rst 18h			;efac
	rst 38h			;efad
	rst 38h			;efae
	ei			;efaf
	ld a,a			;efb0
	rst 38h			;efb1
	rst 18h			;efb2
	push bc			;efb3
	ld c,b			;efb4
	ld a,l			;efb5
	sbc a,d			;efb6
	halt			;efb7
	ret p			;efb8
	rlca			;efb9
	adc a,a			;efba
	ld b,b			;efbb
	inc e			;efbc
	dec a			;efbd
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
lefc8h:
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
	and b			;efde
	nop			;efdf
	ld a,b			;efe0
	ld bc,l807dh		;efe1
	ld a,a			;efe4
	rst 38h			;efe5
	rst 38h			;efe6
	rst 38h			;efe7
	rst 38h			;efe8
	rst 38h			;efe9
	rst 38h			;efea
	rst 38h			;efeb
	rst 38h			;efec
	rst 38h			;efed
	rst 38h			;efee
	rst 38h			;efef
	rst 38h			;eff0
	rst 38h			;eff1
	rst 38h			;eff2
	rst 38h			;eff3
	rst 38h			;eff4
	rst 38h			;eff5
	rst 38h			;eff6
	rst 38h			;eff7
	rst 38h			;eff8
	cp 09fh			;eff9
	ex (sp),hl		;effb
	nop			;effc
	dec b			;effd
	ld e,b			;effe
	ld h,b			;efff
sub_f000h:
	inc c			;f000
lf001h:
	nop			;f001
	call m,sub_fd00h	;f002
	nop			;f005
	djnz lf040h		;f006
	nop			;f008
	ex af,af'		;f009
	nop			;f00a
	ld a,a			;f00b
	call m,00003h		;f00c
	ld bc,l9c6ah		;f00f
	ld (bc),a		;f012
	ex af,af'		;f013
	ret m			;f014
	call m,sub_e400h	;f015
	rst 28h			;f018
	ret nz			;f019
	inc c			;f01a
	jr c,lf065h		;f01b
	halt			;f01d
	ld (hl),a		;f01e
	and a			;f01f
	ei			;f020
	push de			;f021
	ld e,a			;f022
	ld b,037h		;f023
	push hl			;f025
	rst 8			;f026
	rra			;f027
	add a,c			;f028
	di			;f029
	defb 0ddh,0ddh,05bh ;illegal sequence	;f02a
	di			;f02d
	call z,lac0fh		;f02e
	jp m,0380ah		;f031
	jr $-82			;f034
	sbc a,(hl)		;f036
	dec b			;f037
	ccf			;f038
	xor h			;f039
	ret p			;f03a
	ld d,e			;f03b
	call pe,07298h		;f03c
	ld a,h			;f03f
lf040h:
	ret m			;f040
	ld (hl),e		;f041
	out (0f0h),a		;f042
	ld c,(hl)		;f044
	ld c,l			;f045
	ld (lff23h),hl		;f046
	rst 38h			;f049
	cp a			;f04a
	cp l			;f04b
	rst 38h			;f04c
	ld a,a			;f04d
	ld c,a			;f04e
	xor a			;f04f
	ld (hl),b		;f050
	ld a,(hl)		;f051
	rst 8			;f052
	rst 38h			;f053
	ccf			;f054
	rst 38h			;f055
	rst 38h			;f056
	jp p,le23fh		;f057
	sbc a,a			;f05a
	ret p			;f05b
	ld b,d			;f05c
	sub l			;f05d
	sbc a,d			;f05e
	or e			;f05f
	push de			;f060
	ld a,a			;f061
	ei			;f062
	dec (hl)		;f063
	add a,b			;f064
lf065h:
	ret m			;f065
	ld c,a			;f066
lf067h:
	ld bc,l7184h		;f067
	rra			;f06a
	cp a			;f06b
	rst 38h			;f06c
	rst 38h			;f06d
	ld a,(iy-029h)		;f06e
	rst 38h			;f071
	ei			;f072
	rst 8			;f073
	rst 38h			;f074
	ld b,e			;f075
	pop af			;f076
	cp a			;f077
lf078h:
	ld a,(hl)		;f078
	ld (hl),e		;f079
	ld a,a			;f07a
	rst 20h			;f07b
	ld c,03eh		;f07c
	cp 01eh			;f07e
	inc sp			;f080
	rst 30h			;f081
	jp (hl)			;f082
	ret p			;f083
	ld (hl),a		;f084
	dec b			;f085
	defb 0fdh,0c1h,0f3h ;illegal sequence	;f086
	xor b			;f089
	defb 0fdh,055h ;ld d,iyl	;f08a
	ld a,a			;f08c
	push af			;f08d
	ld b,b			;f08e
	scf			;f08f
	cp c			;f090
	ld d,d			;f091
	sbc a,b			;f092
	inc a			;f093
	xor d			;f094
	ld b,a			;f095
	dec c			;f096
	rst 20h			;f097
	or a			;f098
	pop hl			;f099
	push hl			;f09a
	ld a,a			;f09b
	add a,l			;f09c
	ld e,03fh		;f09d
	exx			;f09f
	adc a,a			;f0a0
	ex de,hl		;f0a1
	defb 0fdh,0fdh,0ffh ;illegal sequence	;f0a2
	inc d			;f0a5
	xor a			;f0a6
	jp 0078eh		;f0a7
	sub b			;f0aa
	rst 38h			;f0ab
	ld e,a			;f0ac
	rst 38h			;f0ad
	rst 38h			;f0ae
	cp 07fh			;f0af
	rst 38h			;f0b1
	rst 28h			;f0b2
	ret m			;f0b3
	djnz lf135h		;f0b4
	ld d,h			;f0b6
	rrca			;f0b7
	nop			;f0b8
	ld a,(hl)		;f0b9
	ccf			;f0ba
	ld (01e1eh),hl		;f0bb
	nop			;f0be
	nop			;f0bf
	rra			;f0c0
	ret nz			;f0c1
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
	nop			;f0d3
lf0d4h:
	nop			;f0d4
	nop			;f0d5
	nop			;f0d6
	nop			;f0d7
	nop			;f0d8
	nop			;f0d9
	rst 38h			;f0da
	ret po			;f0db
	nop			;f0dc
	rlca			;f0dd
	and b			;f0de
	nop			;f0df
	ld a,a			;f0e0
	rst 38h			;f0e1
	ld a,(hl)		;f0e2
	add a,b			;f0e3
	rst 38h			;f0e4
	rst 20h			;f0e5
	rst 20h			;f0e6
	rst 38h			;f0e7
sub_f0e8h:
	rst 20h			;f0e8
	ld sp,hl		;f0e9
	rst 38h			;f0ea
	ld sp,hl		;f0eb
	rst 38h			;f0ec
	rst 38h			;f0ed
	rst 38h			;f0ee
	ret po			;f0ef
	ret po			;f0f0
	call z,sub_c0e0h	;f0f1
	di			;f0f4
	di			;f0f5
	rst 38h			;f0f6
	rst 38h			;f0f7
lf0f8h:
	rst 38h			;f0f8
	rst 38h			;f0f9
	ld h,b			;f0fa
	rra			;f0fb
lf0fch:
	nop			;f0fc
	dec b			;f0fd
	ret nc			;f0fe
	jp po,0004ch		;f0ff
	ld a,(hl)		;f102
	nop			;f103
	xor e			;f104
	nop			;f105
	djnz lf144h		;f106
	jr nz,lf112h		;f108
	inc bc			;f10a
	or 0cbh			;f10b
	inc bc			;f10d
	ld bc,l9501h		;f10e
	ld l,d			;f111
lf112h:
	ld b,010h		;f112
	ld a,h			;f114
	cp 000h			;f115
	ret p			;f117
	or 0e0h			;f118
	ld (bc),a		;f11a
	inc e			;f11b
	ld b,h			;f11c
	jr c,lf14eh		;f11d
	rst 0			;f11f
	ei			;f120
	ex de,hl		;f121
	ld l,a			;f122
	adc a,(hl)		;f123
	cpl			;f124
	inc bc			;f125
	ld e,c			;f126
	ccf			;f127
	and d			;f128
	rst 38h			;f129
	cp 0b4h			;f12a
	cp h			;f12c
	rst 38h			;f12d
	cp 00fh			;f12e
	call nc,sub_94fdh	;f130
	ld d,d			;f133
	add a,a			;f134
lf135h:
	ld de,l8ae1h		;f135
	ld c,05eh		;f138
	ret p			;f13a
	and e			;f13b
	call sub_a834h		;f13c
	cp 0e7h			;f13f
	scf			;f141
	rst 20h			;f142
	ld sp,hl		;f143
lf144h:
	rst 28h			;f144
	cp (hl)			;f145
	adc a,l			;f146
	rlca			;f147
	rst 38h			;f148
	cp (hl)			;f149
	ld e,a			;f14a
	cp l			;f14b
	rst 38h			;f14c
	ccf			;f14d
lf14eh:
	add a,a			;f14e
	rst 20h			;f14f
	or b			;f150
	ccf			;f151
	rst 18h			;f152
	cp 0ffh			;f153
	rst 38h			;f155
	rst 38h			;f156
	jp pe,0f903h		;f157
	ld e,a			;f15a
	call m,041bfh		;f15b
	ld l,a			;f15e
	ex de,hl		;f15f
	ret m			;f160
	ccf			;f161
	cp 0ebh			;f162
	ld l,c			;f164
	cp 0bfh			;f165
	ret pe			;f167
	ld c,d			;f168
	call p,sub_ff40h	;f169
	cp 00fh			;f16c
	ei			;f16e
	ld a,0a3h		;f16f
	rst 38h			;f171
	cp 0b1h			;f172
	rst 38h			;f174
	sbc a,(hl)		;f175
	xor d			;f176
	ld c,a			;f177
	ld a,a			;f178
	ld a,b			;f179
	ld (hl),b		;f17a
	inc c			;f17b
	ret po			;f17c
	rst 38h			;f17d
	adc a,01eh		;f17e
	inc sp			;f180
	rst 28h			;f181
	ret pe			;f182
	ret p			;f183
	ccf			;f184
	ld sp,039fbh		;f185
	jp m,lf8c3h		;f188
	jp m,lffbfh		;f18b
	and b			;f18e
	dec bc			;f18f
	or h			;f190
	add a,h			;f191
	pop hl			;f192
	jp 06e97h		;f193
	inc c			;f196
	cp e			;f197
	ld a,a			;f198
	ret			;f199
	push bc			;f19a
	ld a,a			;f19b
	add a,(hl)		;f19c
	ld (hl),l		;f19d
	sbc a,(hl)		;f19e
	and b			;f19f
	inc a			;f1a0
	ld a,e			;f1a1
	defb 0fdh,0fch,0f7h ;illegal sequence	;f1a2
	ret nz			;f1a5
	rst 28h			;f1a6
	pop hl			;f1a7
	adc a,02fh		;f1a8
	inc hl			;f1aa
	cp 0bfh			;f1ab
	rst 38h			;f1ad
	rst 38h			;f1ae
	jp m,lffffh		;f1af
	inc hl			;f1b2
	cp 062h			;f1b3
	inc a			;f1b5
	dec c			;f1b6
	sbc a,(hl)		;f1b7
	cpl			;f1b8
	ret m			;f1b9
	rst 38h			;f1ba
	add a,a			;f1bb
	cpl			;f1bc
	dec a			;f1bd
	ret po			;f1be
	nop			;f1bf
	ld (hl),b		;f1c0
	ld a,b			;f1c1
	inc a			;f1c2
	nop			;f1c3
	inc bc			;f1c4
	rst 20h			;f1c5
	ret po			;f1c6
	nop			;f1c7
	nop			;f1c8
	nop			;f1c9
	nop			;f1ca
	inc bc			;f1cb
	ld h,b			;f1cc
	nop			;f1cd
	nop			;f1ce
	ld a,(hl)		;f1cf
	nop			;f1d0
	rlca			;f1d1
	rlca			;f1d2
	ret nz			;f1d3
	nop			;f1d4
	ld bc,000bfh		;f1d5
	nop			;f1d8
	ld sp,l7cf8h		;f1d9
	nop			;f1dc
	dec b			;f1dd
	and b			;f1de
	nop			;f1df
	ld a,a			;f1e0
	rst 38h			;f1e1
	ld a,a			;f1e2
	sbc a,a			;f1e3
	jp lffe7h		;f1e4
	pop hl			;f1e7
	rst 38h			;f1e8
	ld sp,hl		;f1e9
	jp lc3f9h		;f1ea
	jp lceffh		;f1ed
	ld c,a			;f1f0
lf1f1h:
	ret			;f1f1
	adc a,04eh		;f1f2
	ld (hl),e		;f1f4
	di			;f1f5
	rst 38h			;f1f6
	rst 38h			;f1f7
	rst 38h			;f1f8
	rst 38h			;f1f9
	ld a,a			;f1fa
	rst 38h			;f1fb
	nop			;f1fc
	dec b			;f1fd
	exx			;f1fe
	ret z			;f1ff
	sbc a,h			;f200
	nop			;f201
	ld a,(hl)		;f202
	nop			;f203
	ret nc			;f204
	ld a,b			;f205
	jr $+62			;f206
	djnz lf216h		;f208
	dec e			;f20a
	ld a,a			;f20b
	or 0c6h			;f20c
	ld (bc),a		;f20e
	ld bc,ld46ah		;f20f
	ld e,018h		;f212
	ld a,h			;f214
	ld a,(hl)		;f215
lf216h:
	nop			;f216
	ld a,h			;f217
	ld (hl),l		;f218
	pop hl			;f219
	ld h,01ch		;f21a
	ld b,(hl)		;f21c
	jr lf28eh		;f21d
	rst 8			;f21f
	cp (iy-011h)		;f220
	sub l			;f223
	ld e,b			;f224
	dec b			;f225
	defb 0ddh,0bfh,013h ;illegal sequence	;f226
	rst 38h			;f229
	defb 0fdh,08bh,04eh ;illegal sequence	;f22a
	rst 38h			;f22d
	rst 38h			;f22e
	add hl,de		;f22f
	call c,sub_89feh	;f230
	xor a			;f233
	ld h,b			;f234
	jp z,0620ch		;f235
	ld b,e			;f238
	jp pe,047f9h		;f239
	defb 0edh ;next byte illegal after ed	;f23c
lf23dh:
	jr c,lf23dh		;f23d
	jr c,$+17		;f23f
	rst 0			;f241
	call pe,sub_d007h	;f242
	ld a,a			;f245
	ld d,b			;f246
	rra			;f247
	cp 039h			;f248
	sbc a,a			;f24a
	cp l			;f24b
	rst 38h			;f24c
	adc a,a			;f24d
	inc sp			;f24e
	out (0d0h),a		;f24f
	ld a,09fh		;f251
	ld sp,hl		;f253
	rst 38h			;f254
	rst 38h			;f255
	rst 38h			;f256
	sub 0f8h		;f257
	di			;f259
	add a,d			;f25a
	adc a,c			;f25b
	rst 38h			;f25c
	sbc a,(hl)		;f25d
	rst 38h			;f25e
	exx			;f25f
	push hl			;f260
	ld c,a			;f261
	defb 0fdh,07fh,0d2h ;illegal sequence	;f262
	ld e,07fh		;f265
	sub 024h		;f267
	ei			;f269
	inc a			;f26a
	rrca			;f26b
	pop bc			;f26c
	ret po			;f26d
	cp 0beh			;f26e
	ld e,h			;f270
	rst 38h			;f271
	rst 38h			;f272
	ld l,(hl)		;f273
	rst 38h			;f274
	ccf			;f275
	push af			;f276
	ld (hl),b		;f277
	rra			;f278
	dec a			;f279
	daa			;f27a
	rst 8			;f27b
	cp c			;f27c
	rst 38h			;f27d
	pop bc			;f27e
	inc e			;f27f
	inc c			;f280
	cpl			;f281
	ret pe			;f282
	ret p			;f283
	jr nc,lf2e3h		;f284
	jp m,lf87dh		;f286
	adc a,a			;f289
	rst 20h			;f28a
	push af			;f28b
	rst 18h			;f28c
	rst 38h			;f28d
lf28eh:
	pop hl			;f28e
	dec b			;f28f
	sbc a,c			;f290
	cp 05dh			;f291
	ld e,06eh		;f293
	ld a,a			;f295
	ex af,af'		;f296
	defb 0fdh,0ffh,0a7h ;illegal sequence	;f297
	call sub_bd38h		;f29a
	jp m,0c6ddh		;f29d
	pop af			;f2a0
	inc sp			;f2a1
	adc a,(hl)		;f2a2
	cp 00fh			;f2a3
	jp p,lf067h		;f2a5
	add a,08eh		;f2a8
	rlca			;f2aa
	ld sp,hl		;f2ab
	cp a			;f2ac
	rst 38h			;f2ad
	rst 38h			;f2ae
	xor h			;f2af
	rst 38h			;f2b0
	cp 011h			;f2b1
	rst 38h			;f2b3
	adc a,(hl)		;f2b4
	nop			;f2b5
	pop af			;f2b6
	sbc a,c			;f2b7
	rst 10h			;f2b8
	ex (sp),hl		;f2b9
	rst 38h			;f2ba
	sub 037h		;f2bb
	cp 0a0h			;f2bd
	nop			;f2bf
	rst 8			;f2c0
	sbc a,a			;f2c1
	rst 38h			;f2c2
	add a,b			;f2c3
	rst 38h			;f2c4
	rst 38h			;f2c5
	di			;f2c6
	rst 8			;f2c7
	nop			;f2c8
	nop			;f2c9
	dec sp			;f2ca
	rst 38h			;f2cb
	ret m			;f2cc
	nop			;f2cd
	nop			;f2ce
	rst 38h			;f2cf
	ret po			;f2d0
	rra			;f2d1
	rst 20h			;f2d2
	defb 0fdh,0c0h,01fh ;illegal sequence	;f2d3
	rst 38h			;f2d6
	pop af			;f2d7
	ret po			;f2d8
	rst 38h			;f2d9
	add a,a			;f2da
	sbc a,(hl)		;f2db
	nop			;f2dc
	dec b			;f2dd
	and b			;f2de
	nop			;f2df
	ld a,a			;f2e0
	rst 38h			;f2e1
	ld a,a			;f2e2
lf2e3h:
	add a,c			;f2e3
	sbc a,c			;f2e4
	rst 20h			;f2e5
	rst 0			;f2e6
	rst 8			;f2e7
	rst 0			;f2e8
	pop bc			;f2e9
	ld sp,hl		;f2ea
	pop bc			;f2eb
	sbc a,c			;f2ec
	sbc a,a			;f2ed
	rst 38h			;f2ee
	adc a,060h		;f2ef
	jp 04eceh		;f2f1
	ld (hl),e		;f2f4
	di			;f2f5
	rst 38h			;f2f6
	rst 38h			;f2f7
	rst 38h			;f2f8
	rst 38h			;f2f9
	ld a,a			;f2fa
	cp 000h			;f2fb
	dec b			;f2fd
	adc a,c			;f2fe
	call nz,0007eh		;f2ff
	ld a,a			;f302
	nop			;f303
	and a			;f304
	rst 28h			;f305
	jr $+64			;f306
	jr lf316h		;f308
	ld l,e			;f30a
	call m,la67dh		;f30b
	inc b			;f30e
	ld bc,laa95h		;f30f
	dec c			;f312
	jr lf353h		;f313
	ld a,a			;f315
lf316h:
	nop			;f316
	ld hl,(0d07bh)		;f317
	ld c,08ch		;f31a
	add a,d			;f31c
	ld d,h			;f31d
	rst 18h			;f31e
	dec a			;f31f
	ld e,a			;f320
	sbc a,0efh		;f321
	jp pe,06a84h		;f323
	ld a,07fh		;f326
	ld b,l			;f328
	rst 38h			;f329
	cp 040h			;f32a
	rra			;f32c
	ld a,a			;f32d
	rst 0			;f32e
	ld h,044h		;f32f
	defb 0fdh,0c3h,07fh ;illegal sequence	;f331
	call nz,03864h		;f334
	ld de,ld650h		;f337
	ld a,b			;f33a
	rra			;f33b
	sbc a,h			;f33c
	ld a,l			;f33d
	rst 38h			;f33e
	rlca			;f33f
	rst 28h			;f340
	ex (sp),hl		;f341
	add hl,bc		;f342
	pop af			;f343
	call pe,sub_a8feh	;f344
	ld a,a			;f347
	ret m			;f348
	ld bc,lbd7fh		;f349
	rst 38h			;f34c
	ret po			;f34d
	ld c,e			;f34e
	ex de,hl		;f34f
	ex de,hl		;f350
	rrca			;f351
	ccf			;f352
lf353h:
	rst 30h			;f353
	rst 38h			;f354
	rst 38h			;f355
	rst 38h			;f356
	jp pe,00f7eh		;f357
	push af			;f35a
	ld a,h			;f35b
	ret po			;f35c
	ccf			;f35d
	rst 38h			;f35e
	push af			;f35f
	jp c,lfba3h		;f360
	rst 38h			;f363
	ret pe			;f364
	add a,h			;f365
	rst 38h			;f366
lf367h:
	defb 0fdh,012h,01ch ;illegal sequence	;f367
	xor d			;f36a
	nop			;f36b
	ld a,01eh		;f36c
	ccf			;f36e
	dec a			;f36f
	ccf			;f370
	ccf			;f371
	rst 38h			;f372
	or 0ffh			;f373
	ld a,a			;f375
	jp m,lc0ffh		;f376
	inc a			;f379
	adc a,a			;f37a
	sbc a,a			;f37b
	call po,lc0ffh		;f37c
	call m,sub_cf98h	;f37f
	call pe,sub_e463h	;f382
	dec c			;f385
	call p,sub_f8feh	;f386
	ccf			;f389
	rra			;f38a
	jp m,lffdfh		;f38b
	jp pe,la782h		;f38e
	rst 38h			;f391
	ld l,077h		;f392
	inc d			;f394
	cp a			;f395
	jr lf367h		;f396
	cp 01fh			;f398
	add hl,de		;f39a
	cp b			;f39b
	ld b,e			;f39c
	defb 0fdh,087h,08dh ;illegal sequence	;f39d
	rst 20h			;f3a0
	add a,a			;f3a1
	ld c,0f5h		;f3a2
	add a,e			;f3a4
	ld iy,lc6f8h		;f3a5
	ld e,h			;f3a9
	rra			;f3aa
	add a,d			;f3ab
	cp a			;f3ac
	rst 38h			;f3ad
	rst 38h			;f3ae
	ret p			;f3af
	rst 38h			;f3b0
	cp 01ah			;f3b1
	ld a,a			;f3b3
	ret nz			;f3b4
	add a,a			;f3b5
	call m,sub_dc43h	;f3b6
	rrca			;f3b9
	rst 38h			;f3ba
	jp c,lff87h		;f3bb
	and b			;f3be
	nop			;f3bf
	cp h			;f3c0
	ld h,b			;f3c1
	rst 38h			;f3c2
	rst 28h			;f3c3
	rst 38h			;f3c4
	rst 38h			;f3c5
	rst 38h			;f3c6
	rst 38h			;f3c7
	add a,b			;f3c8
	inc bc			;f3c9
	rst 38h			;f3ca
	rst 38h			;f3cb
	rst 38h			;f3cc
	rst 30h			;f3cd
	add a,a			;f3ce
	rst 38h			;f3cf
	defb 0fdh,0ffh,0ffh ;illegal sequence	;f3d0
	rst 38h			;f3d3
	ret p			;f3d4
	ld a,a			;f3d5
	rst 38h			;f3d6
	ei			;f3d7
	rst 38h			;f3d8
	rst 38h			;f3d9
	ld a,a			;f3da
	rst 20h			;f3db
	nop			;f3dc
	dec b			;f3dd
	and b			;f3de
	nop			;f3df
	ld a,a			;f3e0
	rst 38h			;f3e1
	ld a,a			;f3e2
	add a,a			;f3e3
	add a,e			;f3e4
	rst 20h			;f3e5
	rst 20h			;f3e6
	rst 8			;f3e7
	rst 20h			;f3e8
	sbc a,c			;f3e9
	pop bc			;f3ea
	sbc a,c			;f3eb
	add a,e			;f3ec
	jp lc0ffh		;f3ed
	ld a,(hl)		;f3f0
	ld c,c			;f3f1
	ret nz			;f3f2
	ld b,b			;f3f3
	di			;f3f4
	di			;f3f5
	rst 38h			;f3f6
	rst 38h			;f3f7
	rst 38h			;f3f8
sub_f3f9h:
	rst 38h			;f3f9
	ld a,a			;f3fa
	cp 000h			;f3fb
	dec b			;f3fd
	in a,(0a1h)		;f3fe
	xor 000h		;f400
	rst 38h			;f402
	nop			;f403
	call sub_989ch		;f404
	ld e,00ch		;f407
	inc c			;f409
	rst 18h			;f40a
	nop			;f40b
	cp e			;f40c
	ld d,00ch		;f40d
	ld bc,sub_f6eah		;f40f
	dec bc			;f412
	inc a			;f413
	ld a,(hl)		;f414
	ld a,a			;f415
	nop			;f416
	inc a			;f417
	ld (hl),l		;f418
	or l			;f419
	ld e,08eh		;f41a
	add a,(hl)		;f41c
	sub h			;f41d
	sbc a,0eah		;f41e
	xor (hl)		;f420
	cp l			;f421
	or 0dfh			;f422
	ld d,c			;f424
	pop de			;f425
	pop af			;f426
	cp 044h			;f427
	rst 38h			;f429
	cp 0aah			;f42a
	ccf			;f42c
	ld a,a			;f42d
	cp c			;f42e
	ld d,c			;f42f
	adc a,b			;f430
	cp 0c3h			;f431
	rst 38h			;f433
	defb 0fdh,09ah,06ch ;illegal sequence	;f434
	adc a,b			;f437
	ld hl,(07e7ah)		;f438
	ld a,a			;f43b
	rst 8			;f43c
	rst 38h			;f43d
	rst 38h			;f43e
	rst 18h			;f43f
	rst 10h			;f440
	ret p			;f441
	ex (sp),hl		;f442
	xor 0fdh		;f443
	rst 38h			;f445
	ld d,c			;f446
	rst 38h			;f447
	ret po			;f448
	ld d,h			;f449
	rst 38h			;f44a
	cp a			;f44b
	rst 38h			;f44c
	rst 38h			;f44d
	xor c			;f44e
	ei			;f44f
	jp c,03f50h		;f450
	rst 8			;f453
	rst 38h			;f454
	rst 38h			;f455
	rst 38h			;f456
	defb 0fdh,07fh,0dfh ;illegal sequence	;f457
	ret nz			;f45a
	cp 04fh			;f45b
	rrca			;f45d
	rst 38h			;f45e
	defb 0fdh,0bfh,0d4h ;illegal sequence	;f45f
	di			;f462
	rst 38h			;f463
	call p,lfeffh+2		;f464
	jp m,l8e8ah		;f467
	xor 08fh		;f46a
	ret nc			;f46c
	and c			;f46d
	add a,b			;f46e
	sbc a,a			;f46f
	rra			;f470
	rst 0			;f471
	rst 38h			;f472
	xor 0ffh		;f473
	ld a,a			;f475
	call p,sub_fcffh	;f476
	ld a,h			;f479
	rst 8			;f47a
	cp a			;f47b
	cp 07fh			;f47c
	ex (sp),hl		;f47e
	defb 0fdh,0f1h,0efh ;illegal sequence	;f47f
	call p,00ae6h		;f482
	ld b,l			;f485
	or 0feh			;f486
	ld a,h			;f488
	ld a,b			;f489
	rst 38h			;f48a
	push af			;f48b
	ld e,a			;f48c
	rst 38h			;f48d
	defb 0fdh,005h,01fh ;illegal sequence	;f48e
	rst 38h			;f491
	ld b,088h		;f492
	ld l,h			;f494
	rst 18h			;f495
	pop af			;f496
	ex de,hl		;f497
	ret m			;f498
	ld a,h			;f499
	dec sp			;f49a
	cp b			;f49b
	add a,l			;f49c
	cp 0d0h			;f49d
	inc de			;f49f
	adc a,a			;f4a0
	rst 30h			;f4a1
	ld a,(l80eah)		;f4a2
	ld a,(hl)		;f4a5
	nop			;f4a6
	ld a,h			;f4a7
	ld b,h			;f4a8
	sbc a,b			;f4a9
	ccf			;f4aa
	ld de,lffbfh		;f4ab
	rst 38h			;f4ae
	ld (bc),a		;f4af
	rst 38h			;f4b0
	inc e			;f4b1
	ex af,af'		;f4b2
	adc a,a			;f4b3
	di			;f4b4
	rra			;f4b5
	rst 0			;f4b6
	ld de,l7ff8h		;f4b7
	rst 38h			;f4ba
	defb 0ddh,0c9h,0ffh ;illegal sequence	;f4bb
	and b			;f4be
	nop			;f4bf
	or e			;f4c0
	rst 18h			;f4c1
	ld a,a			;f4c2
	rst 38h			;f4c3
	rst 20h			;f4c4
	rst 38h			;f4c5
	rst 38h			;f4c6
	rst 38h			;f4c7
	call m,sub_ff7fh	;f4c8
	rst 38h			;f4cb
	rst 38h			;f4cc
	rst 38h			;f4cd
	rst 38h			;f4ce
	rst 38h			;f4cf
	rst 38h			;f4d0
	rst 38h			;f4d1
	rst 38h			;f4d2
	rst 38h			;f4d3
	rst 38h			;f4d4
	rst 38h			;f4d5
	rst 38h			;f4d6
	rst 38h			;f4d7
	rst 38h			;f4d8
	cp 0e3h			;f4d9
	ei			;f4db
	nop			;f4dc
	dec b			;f4dd
	and b			;f4de
	nop			;f4df
	ld a,a			;f4e0
	cp 0ffh			;f4e1
	sbc a,a			;f4e3
	sbc a,a			;f4e4
	rst 20h			;f4e5
	rst 20h			;f4e6
	rst 8			;f4e7
	rst 20h			;f4e8
	sbc a,c			;f4e9
	sbc a,c			;f4ea
	sbc a,c			;f4eb
	sbc a,a			;f4ec
	ld sp,hl		;f4ed
	rst 38h			;f4ee
	adc a,04eh		;f4ef
	ld c,h			;f4f1
	adc a,04ch		;f4f2
	rst 38h			;f4f4
	rst 38h			;f4f5
	rst 38h			;f4f6
	rst 38h			;f4f7
	rst 38h			;f4f8
	rst 38h			;f4f9
	ld a,a			;f4fa
sub_f4fbh:
	cp 000h			;f4fb
	dec b			;f4fd
	cp a			;f4fe
	ld c,e			;f4ff
	ex de,hl		;f500
	nop			;f501
	rst 38h			;f502
	nop			;f503
	sbc a,(hl)		;f504
	ld a,a			;f505
	ld c,h			;f506
	ld e,006h		;f507
	dec e			;f509
	cp (hl)			;f50a
	ccf			;f50b
	ld e,(hl)		;f50c
	rst 8			;f50d
	ret c			;f50e
	ld b,0d7h		;f50f
	adc a,(hl)		;f511
	dec e			;f512
	cp a			;f513
	cp 07fh			;f514
	nop			;f516
	ld d,06eh		;f517
	cp d			;f519
	inc e			;f51a
	ld c,(hl)		;f51b
	ld c,(hl)		;f51c
	adc a,d			;f51d
	cp c			;f51e
	ld d,l			;f51f
	ld e,e			;f520
	ld (hl),c		;f521
	rst 30h			;f522
	xor (hl)		;f523
	xor a			;f524
	adc a,a			;f525
	adc a,a			;f526
	defb 0fdh,003h,07fh ;illegal sequence	;f527
	cp 0a9h			;f52a
	cp a			;f52c
	ld a,a			;f52d
	ld a,(hl)		;f52e
	ld hl,(l7dc0h)		;f52f
	rst 0			;f532
	rst 38h			;f533
	cp 074h			;f534
	jp nc,05569h		;f536
	ld e,0bfh		;f539
	rst 38h			;f53b
	rst 18h			;f53c
	rst 38h			;f53d
	rst 38h			;f53e
	rst 18h			;f53f
	ex de,hl		;f540
	rst 0			;f541
	ld e,b			;f542
	rst 38h			;f543
	ld a,c			;f544
	jp m,lfe87h		;f545
	ld bc,lbf28h		;f548
	cp a			;f54b
	rst 38h			;f54c
	defb 0fdh,054h ;ld d,iyh	;f54d
	ld sp,hl		;f54f
	ex de,hl		;f550
	xor d			;f551
	rra			;f552
	ccf			;f553
	rst 38h			;f554
	rst 38h			;f555
	rst 38h			;f556
	rst 38h			;f557
	ld a,a			;f558
	rst 20h			;f559
	call c,01f7fh		;f55a
	ex (sp),hl		;f55d
	rst 38h			;f55e
	jp m,lea5fh		;f55f
	rlca			;f562
	rst 38h			;f563
	jp m,lff79h		;f564
	rst 0			;f567
	jp m,l7027h		;f568
	ld sp,050edh		;f56b
	ld (hl),l		;f56e
	ld e,a			;f56f
	ld d,e			;f570
	ld sp,hl		;f571
	rst 38h			;f572
	call nc,063ffh		;f573
	jp m,lf8ffh		;f576
	call p,03f63h		;f579
	defb 0fdh,03dh,0ffh ;illegal sequence	;f57c
	ret m			;f57f
	ex de,hl		;f580
	and a			;f581
	rst 30h			;f582
	inc a			;f583
	sbc a,000h		;f584
	call pe,03c7fh		;f586
	pop hl			;f589
	rst 38h			;f58a
	rst 8			;f58b
	rst 18h			;f58c
	rst 38h			;f58d
	cp 08bh			;f58e
	ccf			;f590
	rst 38h			;f591
	add a,b			;f592
	inc de			;f593
	ld d,d			;f594
	and a			;f595
	push bc			;f596
	defb 0ddh,0e7h,0f0h ;illegal sequence	;f597
	ret p			;f59a
	sbc a,l			;f59b
	inc c			;f59c
	ld a,l			;f59d
	and h			;f59e
	ld a,(hl)		;f59f
	ccf			;f5a0
	di			;f5a1
	ld d,01fh		;f5a2
	ld bc,l981fh		;f5a4
	ld e,044h		;f5a7
	sub c			;f5a9
	ld a,b			;f5aa
	inc a			;f5ab
	cp a			;f5ac
	rst 38h			;f5ad
	ret nz			;f5ae
	inc d			;f5af
	cp 002h			;f5b0
	ld de,lf878h+1		;f5b2
	ld a,a			;f5b5
	cp c			;f5b6
	ret z			;f5b7
	ld (hl),e		;f5b8
	ccf			;f5b9
	rst 38h			;f5ba
	adc a,08ch		;f5bb
	ld a,a			;f5bd
	and b			;f5be
	nop			;f5bf
	cp h			;f5c0
	rra			;f5c1
	ld a,(hl)		;f5c2
	ld a,a			;f5c3
	ei			;f5c4
	rst 38h			;f5c5
	rst 38h			;f5c6
	rst 38h			;f5c7
	rst 38h			;f5c8
	rst 38h			;f5c9
	rst 38h			;f5ca
	rst 38h			;f5cb
	rst 38h			;f5cc
	rst 38h			;f5cd
	rst 38h			;f5ce
	rst 38h			;f5cf
	rst 38h			;f5d0
	rst 38h			;f5d1
	rst 38h			;f5d2
	rst 38h			;f5d3
	rst 38h			;f5d4
	rst 38h			;f5d5
	rst 38h			;f5d6
	rst 38h			;f5d7
	rst 38h			;f5d8
	cp 0d5h			;f5d9
	jp po,00500h		;f5db
	and b			;f5de
	nop			;f5df
	ld a,a			;f5e0
	cp 0ffh			;f5e1
	sbc a,a			;f5e3
	pop bc			;f5e4
	pop af			;f5e5
	jp lc3e1h		;f5e6
	pop bc			;f5e9
	pop bc			;f5ea
	pop bc			;f5eb
	pop bc			;f5ec
	add a,e			;f5ed
	rst 38h			;f5ee
	adc a,060h		;f5ef
	adc a,04eh		;f5f1
	ld c,(hl)		;f5f3
	ld (hl),e		;f5f4
	di			;f5f5
	rst 38h			;f5f6
lf5f7h:
	rst 38h			;f5f7
	rst 38h			;f5f8
	rst 38h			;f5f9
	ld a,a			;f5fa
	call m,00500h		;f5fb
	sbc a,e			;f5fe
lf5ffh:
	inc hl			;f5ff
lf600h:
	rst 10h			;f600
	nop			;f601
	rst 38h			;f602
	nop			;f603
	push de			;f604
	cp l			;f605
	adc a,00fh		;f606
	inc bc			;f608
	sbc a,(hl)		;f609
	ld e,l			;f60a
	jp nc,lde9dh		;f60b
	cp b			;f60e
	ld b,0eah		;f60f
	ld a,(hl)		;f611
	ld a,0e0h		;f612
	dec b			;f614
	ld a,d			;f615
	add a,b			;f616
	dec d			;f617
	dec sp			;f618
	ld l,c			;f619
	ld a,b			;f61a
	ld b,a			;f61b
	ld c,(hl)		;f61c
	sbc a,b			;f61d
	halt			;f61e
	and d			;f61f
	inc b			;f620
	rla			;f621
	rst 30h			;f622
	cp 0d9h			;f623
	ld e,(hl)		;f625
	ld a,a			;f626
	cp 02fh			;f627
	ld a,a			;f629
	rst 38h			;f62a
	cp c			;f62b
	cp 0feh			;f62c
	defb 0fdh,095h ;sub iyl	;f62e
	ld h,b			;f630
	ld a,(hl)		;f631
	rst 0			;f632
	rst 38h			;f633
	ret p			;f634
	xor e			;f635
	xor l			;f636
	call po,00500h		;f637
	ld b,b			;f63a
	rra			;f63b
	rst 38h			;f63c
	ret po			;f63d
	ret m			;f63e
	rrca			;f63f
	push af			;f640
	sbc a,a			;f641
	or 071h			;f642
	and a			;f644
	xor a			;f645
	rra			;f646
	nop			;f647
	ld d,d			;f648
	add a,(hl)		;f649
	ld a,a			;f64a
	cp a			;f64b
	rst 38h			;f64c
	rst 38h			;f64d
	jp pe,ldbf4h		;f64e
	ld d,l			;f651
	ret po			;f652
	rst 38h			;f653
	rst 38h			;f654
	rst 38h			;f655
	rst 38h			;f656
	ld a,(iy+037h)		;f657
	cp a			;f65a
	rra			;f65b
	cp a			;f65c
	di			;f65d
	rst 38h			;f65e
	or (hl)			;f65f
	rst 8			;f660
	call nc,sub_fff7h	;f661
	or 09dh			;f664
	rst 38h			;f666
	ld a,(ld309h)		;f667
	adc a,b			;f66a
	cp 0ffh			;f66b
	ret po			;f66d
	ld c,09fh		;f66e
	jr z,lf6b0h		;f670
	ld a,a			;f672
	ret m			;f673
	ccf			;f674
	ld b,e			;f675
	call p,le00fh		;f676
	ld sp,hl		;f679
	ld l,e			;f67a
	ld a,a			;f67b
	cp 0bbh			;f67c
	rst 38h			;f67e
	ld sp,hl		;f67f
	pop af			;f680
	or e			;f681
	rst 30h			;f682
	ld c,l			;f683
	cp 054h			;f684
	out (01fh),a		;f686
	ld e,0c3h		;f688
	call m,05f1fh		;f68a
	rst 38h			;f68d
	rst 38h			;f68e
	push de			;f68f
	ccf			;f690
	rst 38h			;f691
	rst 18h			;f692
	ld a,(lfaa0h)		;f693
	add a,b			;f696
	jr c,lf6b8h		;f697
	add a,c			;f699
	and 0dfh		;f69a
	inc e			;f69c
	ld a,0f3h		;f69d
	call c,sub_f97fh	;f69f
	rst 38h			;f6a2
	add a,b			;f6a3
	ld d,(hl)		;f6a4
	xor a			;f6a5
	push hl			;f6a6
	nop			;f6a7
	ld bc,lc244h		;f6a8
	xor d			;f6ab
	ld a,a			;f6ac
	add a,b			;f6ad
	ld a,(bc)		;f6ae
	ld l,d			;f6af
lf6b0h:
	cp 005h			;f6b0
	inc (hl)		;f6b2
	ld h,b			;f6b3
	ld a,b			;f6b4
	rst 38h			;f6b5
	ld b,024h		;f6b6
lf6b8h:
	daa			;f6b8
	sbc a,a			;f6b9
	rst 38h			;f6ba
	rst 20h			;f6bb
	ld h,c			;f6bc
	sbc a,a			;f6bd
	and b			;f6be
	nop			;f6bf
	ld b,e			;f6c0
	sbc a,07dh		;f6c1
	cp h			;f6c3
	rlca			;f6c4
	rst 38h			;f6c5
	rst 38h			;f6c6
	rst 38h			;f6c7
	rst 38h			;f6c8
	rst 38h			;f6c9
	rst 38h			;f6ca
	rst 38h			;f6cb
	rst 38h			;f6cc
	rst 38h			;f6cd
	rst 38h			;f6ce
	rst 38h			;f6cf
	rst 38h			;f6d0
	rst 38h			;f6d1
	rst 38h			;f6d2
	rst 38h			;f6d3
	rst 38h			;f6d4
	rst 38h			;f6d5
	rst 38h			;f6d6
	rst 38h			;f6d7
	rst 38h			;f6d8
	cp 060h			;f6d9
	dec e			;f6db
	nop			;f6dc
	dec b			;f6dd
	and b			;f6de
	nop			;f6df
	ccf			;f6e0
	cp 0ffh			;f6e1
	cp a			;f6e3
	rst 38h			;f6e4
	rst 38h			;f6e5
	rst 38h			;f6e6
	rst 38h			;f6e7
	rst 38h			;f6e8
	rst 38h			;f6e9
sub_f6eah:
	rst 38h			;f6ea
	rst 38h			;f6eb
	rst 38h			;f6ec
	rst 38h			;f6ed
	rst 38h			;f6ee
	rst 38h			;f6ef
	rst 38h			;f6f0
	rst 38h			;f6f1
	rst 38h			;f6f2
	rst 38h			;f6f3
	rst 38h			;f6f4
lf6f5h:
	rst 38h			;f6f5
	rst 38h			;f6f6
	rst 38h			;f6f7
	rst 38h			;f6f8
	rst 38h			;f6f9
	cp a			;f6fa
	call m,00500h		;f6fb
lf6feh:
	and b			;f6fe
	nop			;f6ff
	ccf			;f700
	cp 0fbh			;f701
	ccf			;f703
	rst 38h			;f704
	rst 38h			;f705
	rst 38h			;f706
	rst 38h			;f707
	rst 38h			;f708
	rst 38h			;f709
	rst 38h			;f70a
	rst 38h			;f70b
	rst 38h			;f70c
	rst 38h			;f70d
	rst 38h			;f70e
	rst 38h			;f70f
	rst 38h			;f710
	rst 38h			;f711
	rst 38h			;f712
	rst 38h			;f713
	rst 38h			;f714
	rst 38h			;f715
	rst 38h			;f716
	rst 38h			;f717
	rst 38h			;f718
	rst 38h			;f719
	cp a			;f71a
	call m,00500h		;f71b
	and b			;f71e
	nop			;f71f
	ccf			;f720
	cp 0ffh			;f721
	rst 38h			;f723
	rst 38h			;f724
	rst 38h			;f725
	cp 0ffh			;f726
	rst 38h			;f728
	rst 38h			;f729
	rst 38h			;f72a
	rst 38h			;f72b
	rst 38h			;f72c
	rst 38h			;f72d
	rst 38h			;f72e
	rst 38h			;f72f
	rst 38h			;f730
	rst 38h			;f731
	rst 38h			;f732
	rst 38h			;f733
	rst 38h			;f734
	rst 38h			;f735
	rst 38h			;f736
	rst 38h			;f737
	rst 38h			;f738
	cp 0bfh			;f739
	jp m,00500h		;f73b
	and b			;f73e
	nop			;f73f
	rst 38h			;f740
	defb 0fdh,07fh,0ffh ;illegal sequence	;f741
	rst 38h			;f744
	rst 38h			;f745
	rst 38h			;f746
	rst 38h			;f747
	rst 38h			;f748
	rst 38h			;f749
	rst 38h			;f74a
	rst 38h			;f74b
	rst 38h			;f74c
	rst 38h			;f74d
	rst 38h			;f74e
	rst 38h			;f74f
	rst 38h			;f750
	rst 38h			;f751
	rst 38h			;f752
	rst 38h			;f753
	rst 38h			;f754
	rst 38h			;f755
	rst 38h			;f756
	rst 38h			;f757
	rst 38h			;f758
	ret m			;f759
	rst 38h			;f75a
	jp m,00500h		;f75b
	and b			;f75e
	nop			;f75f
	ccf			;f760
	cp 0fch			;f761
	ld h,a			;f763
	rst 38h			;f764
	rst 38h			;f765
	rst 38h			;f766
	rst 38h			;f767
	rst 20h			;f768
	rst 38h			;f769
	rst 38h			;f76a
	ld sp,hl		;f76b
	rst 38h			;f76c
	rst 38h			;f76d
	rst 38h			;f76e
	rst 20h			;f76f
	rst 38h			;f770
	rst 38h			;f771
	rst 38h			;f772
	rst 38h			;f773
	rst 20h			;f774
	rst 20h			;f775
	rst 20h			;f776
	rst 20h			;f777
	rst 38h			;f778
	rst 38h			;f779
	ccf			;f77a
	call m,00500h		;f77b
	and b			;f77e
	nop			;f77f
	ccf			;f780
	call m,lffffh		;f781
	rst 38h			;f784
	rst 20h			;f785
	defb 0fdh,0ffh,0e7h ;illegal sequence	;f786
	rst 20h			;f789
	rst 8			;f78a
	rst 38h			;f78b
	rst 38h			;f78c
	rst 38h			;f78d
	rst 38h			;f78e
	rst 38h			;f78f
	rst 38h			;f790
	ld sp,hl		;f791
	rst 38h			;f792
	rst 20h			;f793
	rst 38h			;f794
	rst 38h			;f795
	rst 20h			;f796
	rst 38h			;f797
	rst 20h			;f798
	rst 38h			;f799
	ccf			;f79a
	or 000h			;f79b
	dec b			;f79d
	and b			;f79e
	nop			;f79f
	rst 38h			;f7a0
	jp m,lbf87h		;f7a1
	rst 38h			;f7a4
	rst 38h			;f7a5
	rst 38h			;f7a6
	rst 38h			;f7a7
	rst 38h			;f7a8
	rst 38h			;f7a9
	rst 38h			;f7aa
	rst 38h			;f7ab
	rst 38h			;f7ac
	rst 38h			;f7ad
	rst 38h			;f7ae
	rst 38h			;f7af
	rst 38h			;f7b0
	rst 38h			;f7b1
	rst 38h			;f7b2
	rst 38h			;f7b3
	rst 38h			;f7b4
	rst 38h			;f7b5
	rst 38h			;f7b6
	rst 38h			;f7b7
	rst 38h			;f7b8
	jp pe,lf5ffh		;f7b9
	nop			;f7bc
	dec b			;f7bd
	and b			;f7be
	nop			;f7bf
	ccf			;f7c0
	defb 0fdh,0ffh,0e7h ;illegal sequence	;f7c1
	jp lc3ffh		;f7c4
	add a,e			;f7c7
	jp lc3e1h		;f7c8
	ld sp,hl		;f7cb
	jp lc3ffh		;f7cc
	rst 20h			;f7cf
	rst 38h			;f7d0
	pop hl			;f7d1
	jp lc3c3h		;f7d2
	rst 38h			;f7d5
	rst 20h			;f7d6
	rst 20h			;f7d7
	jp lbfffh		;f7d8
	call m,00500h		;f7db
	and b			;f7de
	nop			;f7df
	ccf			;f7e0
	cp 0ffh			;f7e1
	jp lc3c3h		;f7e3
	jp le7ffh		;f7e6
	rst 38h			;f7e9
	rst 8			;f7ea
	pop hl			;f7eb
	jp lffffh		;f7ec
	rst 38h			;f7ef
	jp lc3f9h		;f7f0
	rst 20h			;f7f3
	jp 0c383h		;f7f4
	jp lfee7h		;f7f7
	ld a,a			;f7fa
sub_f7fbh:
	jp m,00500h		;f7fb
	and b			;f7fe
	nop			;f7ff
lf800h:
	rst 38h			;f800
sub_f801h:
	push af			;f801
	nop			;f802
sub_f803h:
	rlca			;f803
	call m,sub_ff77h	;f804
	rst 38h			;f807
	rst 38h			;f808
	rst 38h			;f809
	cp 03ch			;f80a
	ld a,a			;f80c
	rst 38h			;f80d
	defb 0fdh,0ffh,0ffh ;illegal sequence	;f80e
	rst 38h			;f811
	rst 38h			;f812
	rst 38h			;f813
	rst 38h			;f814
	rst 38h			;f815
	ret m			;f816
	rrca			;f817
	rst 38h			;f818
	inc (hl)		;f819
	rst 38h			;f81a
	ex de,hl		;f81b
	nop			;f81c
	dec b			;f81d
	and b			;f81e
	nop			;f81f
	ccf			;f820
	defb 0fdh,0ffh,0e7h ;illegal sequence	;f821
	ld sp,hl		;f824
	rst 38h			;f825
	sbc a,c			;f826
	sbc a,c			;f827
	rst 20h			;f828
	rst 8			;f829
	ld sp,hl		;f82a
	pop bc			;f82b
	ld sp,hl		;f82c
	rst 38h			;f82d
	ld sp,hl		;f82e
	rst 20h			;f82f
	rst 38h			;f830
	rst 8			;f831
	ld sp,hl		;f832
	sbc a,a			;f833
	rst 20h			;f834
	rst 0			;f835
	rst 20h			;f836
	rst 20h			;f837
	sbc a,c			;f838
	rst 38h			;f839
	ccf			;f83a
	call p,00500h		;f83b
	and b			;f83e
	nop			;f83f
	ld a,a			;f840
	call m,sub_99ffh	;f841
	sbc a,a			;f844
	rst 20h			;f845
	ld sp,hl		;f846
	rst 38h			;f847
	rst 20h			;f848
	rst 0			;f849
	pop bc			;f84a
	rst 8			;f84b
	sbc a,c			;f84c
	rst 38h			;f84d
	rst 38h			;f84e
	rst 38h			;f84f
	ld sp,hl		;f850
	pop bc			;f851
	sbc a,c			;f852
	rst 20h			;f853
	ld sp,hl		;f854
	sbc a,c			;f855
	rst 20h			;f856
	sbc a,c			;f857
	rst 20h			;f858
	rst 38h			;f859
	ld a,a			;f85a
	cp 000h			;f85b
	dec b			;f85d
	and b			;f85e
	nop			;f85f
	ld a,a			;f860
	xor (hl)		;f861
	nop			;f862
	ld bc,000e0h		;f863
	rst 38h			;f866
	inc bc			;f867
	rst 38h			;f868
	call m,00020h		;f869
	inc bc			;f86c
	rst 38h			;f86d
	ret m			;f86e
	rst 38h			;f86f
	rst 38h			;f870
	rst 18h			;f871
	inc hl			;f872
	rst 38h			;f873
	rst 30h			;f874
	rst 38h			;f875
	ret nz			;f876
	nop			;f877
lf878h:
	jr nz,lf87bh		;f878
	rst 38h			;f87a
lf87bh:
	push de			;f87b
	nop			;f87c
lf87dh:
	dec b			;f87d
	and b			;f87e
	nop			;f87f
	ccf			;f880
	defb 0fdh,0ffh,0e7h ;illegal sequence	;f881
	pop bc			;f884
	rst 38h			;f885
	add a,e			;f886
	sbc a,c			;f887
	rst 20h			;f888
	rst 8			;f889
	pop bc			;f88a
	sbc a,c			;f88b
	pop bc			;f88c
	rst 38h			;f88d
	pop bc			;f88e
	rst 20h			;f88f
	rst 38h			;f890
	rst 8			;f891
	pop bc			;f892
	jp le7e7h		;f893
	rst 20h			;f896
	rst 20h			;f897
	sbc a,c			;f898
	cp 0bfh			;f899
	call m,00500h		;f89b
	and b			;f89e
	nop			;f89f
	ld a,a			;f8a0
	jp m,l83ffh		;f8a1
	jp lc1e7h		;f8a4
	rst 38h			;f8a7
	rst 20h			;f8a8
	rst 20h			;f8a9
	call z,sub_83cfh	;f8aa
	rst 38h			;f8ad
	rst 38h			;f8ae
	rst 38h			;f8af
	pop bc			;f8b0
	sbc a,c			;f8b1
	add a,e			;f8b2
	rst 20h			;f8b3
	pop bc			;f8b4
	sbc a,c			;f8b5
	rst 20h			;f8b6
	add a,e			;f8b7
	rst 20h			;f8b8
	cp 07fh			;f8b9
	jp m,00500h		;f8bb
	and b			;f8be
	nop			;f8bf
	dec a			;f8c0
	ld e,b			;f8c1
	nop			;f8c2
lf8c3h:
	nop			;f8c3
	nop			;f8c4
	nop			;f8c5
	djnz lf8c8h		;f8c6
lf8c8h:
	rrca			;f8c8
	nop			;f8c9
	inc b			;f8ca
	nop			;f8cb
	nop			;f8cc
	rrca			;f8cd
	ret p			;f8ce
	inc bc			;f8cf
	call m,00000h		;f8d0
	ex af,af'		;f8d3
	ld b,b			;f8d4
	ld a,000h		;f8d5
	nop			;f8d7
	nop			;f8d8
	nop			;f8d9
	jp m,000beh		;f8da
	dec b			;f8dd
	and b			;f8de
	nop			;f8df
	ccf			;f8e0
	defb 0fdh,0ffh,0e7h ;illegal sequence	;f8e1
sub_f8e4h:
	sbc a,c			;f8e4
	rst 38h			;f8e5
	sbc a,a			;f8e6
	sbc a,c			;f8e7
	rst 20h			;f8e8
	rst 8			;f8e9
	sbc a,c			;f8ea
	sbc a,c			;f8eb
	sbc a,c			;f8ec
	rst 38h			;f8ed
	sbc a,c			;f8ee
	rst 20h			;f8ef
	rst 38h			;f8f0
	rst 8			;f8f1
	sbc a,c			;f8f2
	ld sp,hl		;f8f3
	rst 20h			;f8f4
	rst 20h			;f8f5
	rst 20h			;f8f6
	rst 20h			;f8f7
sub_f8f8h:
	sbc a,c			;f8f8
	rst 38h			;f8f9
	ccf			;f8fa
	call p,00500h		;f8fb
sub_f8feh:
	and b			;f8fe
lf8ffh:
	nop			;f8ff
lf900h:
	ld a,a			;f900
	call m,sub_9fffh	;f901
	ld sp,hl		;f904
	rst 20h			;f905
	sbc a,c			;f906
	rst 38h			;f907
	rst 20h			;f908
	rst 20h			;f909
	call z,sub_9fcfh	;f90a
	ex (sp),hl		;f90d
	ex (sp),hl		;f90e
	ex (sp),hl		;f90f
	sbc a,c			;f910
	sbc a,c			;f911
	sbc a,a			;f912
	rst 20h			;f913
	sbc a,c			;f914
	sbc a,c			;f915
	rst 20h			;f916
	sbc a,a			;f917
	rst 38h			;f918
	defb 0fdh,07fh,0f6h ;illegal sequence	;f919
	nop			;f91c
	dec b			;f91d
	cp a			;f91e
	rst 38h			;f91f
	add a,a			;f920
	jp lffffh		;f921
	rst 38h			;f924
	rst 38h			;f925
	rst 0			;f926
	rst 38h			;f927
	ret po			;f928
	ld a,a			;f929
	rst 38h			;f92a
	rst 38h			;f92b
	rst 38h			;f92c
	ret po			;f92d
	rlca			;f92e
	ret m			;f92f
	ld bc,lffffh		;f930
	ex (sp),hl		;f933
	rra			;f934
	add a,b			;f935
	rst 38h			;f936
	rst 38h			;f937
	rst 38h			;f938
	cp 00fh			;f939
	ret nz			;f93b
	rst 38h			;f93c
	defb 0fdh,0a0h,000h ;illegal sequence	;f93d
	ccf			;f940
	defb 0fdh,0ffh,0f1h ;illegal sequence	;f941
	pop bc			;f944
	rst 38h			;f945
	pop bc			;f946
	sbc a,c			;f947
	pop af			;f948
	rst 8			;f949
	pop bc			;f94a
	pop bc			;f94b
	pop bc			;f94c
	rst 38h			;f94d
	pop bc			;f94e
	pop af			;f94f
	rst 38h			;f950
	pop hl			;f951
	pop bc			;f952
	add a,e			;f953
	pop af			;f954
	jp lf1f1h		;f955
	jp lbffeh		;f958
	call m,00500h		;f95b
	and b			;f95e
	nop			;f95f
	ld a,a			;f960
	jp m,0c1ffh		;f961
	add a,e			;f964
	pop af			;f965
	pop bc			;f966
	rst 38h			;f967
	pop af			;f968
	jp lcfc1h		;f969
	pop bc			;f96c
	ex (sp),hl		;f96d
	ex (sp),hl		;f96e
	ex (sp),hl		;f96f
	pop bc			;f970
	pop bc			;f971
	pop bc			;f972
	pop af			;f973
	pop bc			;f974
	sbc a,c			;f975
	pop af			;f976
	pop bc			;f977
	rst 20h			;f978
	cp 07fh			;f979
	jp m,00500h		;f97b
	add a,b			;f97e
sub_f97fh:
	nop			;f97f
	nop			;f980
	nop			;f981
	nop			;f982
	nop			;f983
	nop			;f984
	nop			;f985
	nop			;f986
	nop			;f987
	nop			;f988
	nop			;f989
	nop			;f98a
	nop			;f98b
	nop			;f98c
	nop			;f98d
	nop			;f98e
	nop			;f98f
	nop			;f990
	nop			;f991
	nop			;f992
	nop			;f993
	nop			;f994
	nop			;f995
	nop			;f996
	nop			;f997
	nop			;f998
	nop			;f999
	nop			;f99a
	nop			;f99b
	nop			;f99c
	ld bc,000a0h		;f99d
	ccf			;f9a0
	defb 0fdh,0ffh,0ffh ;illegal sequence	;f9a1
	rst 38h			;f9a4
	rst 38h			;f9a5
	rst 38h			;f9a6
	rst 38h			;f9a7
	rst 38h			;f9a8
	rst 38h			;f9a9
	rst 38h			;f9aa
	rst 38h			;f9ab
	rst 38h			;f9ac
	rst 38h			;f9ad
	rst 38h			;f9ae
	rst 38h			;f9af
	rst 38h			;f9b0
	rst 38h			;f9b1
	rst 38h			;f9b2
	rst 38h			;f9b3
	rst 38h			;f9b4
	rst 38h			;f9b5
	rst 38h			;f9b6
	rst 38h			;f9b7
	rst 38h			;f9b8
	rst 38h			;f9b9
	ccf			;f9ba
	call p,00500h		;f9bb
	and b			;f9be
	nop			;f9bf
	ld a,a			;f9c0
	defb 0fdh,07fh,0ffh ;illegal sequence	;f9c1
	rst 38h			;f9c4
	rst 38h			;f9c5
	rst 38h			;f9c6
	rst 38h			;f9c7
	rst 38h			;f9c8
	rst 38h			;f9c9
	rst 38h			;f9ca
	rst 38h			;f9cb
	rst 38h			;f9cc
	rst 38h			;f9cd
	rst 38h			;f9ce
	rst 38h			;f9cf
	rst 38h			;f9d0
	rst 38h			;f9d1
	rst 38h			;f9d2
	rst 38h			;f9d3
	rst 38h			;f9d4
	rst 38h			;f9d5
	rst 38h			;f9d6
	rst 38h			;f9d7
	rst 38h			;f9d8
	defb 0fdh,07fh,0f6h ;illegal sequence	;f9d9
	nop			;f9dc
	dec b			;f9dd
	rst 38h			;f9de
	rst 38h			;f9df
	rst 38h			;f9e0
	rst 38h			;f9e1
	rst 38h			;f9e2
	rst 38h			;f9e3
	rst 38h			;f9e4
	rst 38h			;f9e5
	rst 38h			;f9e6
	rst 38h			;f9e7
	rst 38h			;f9e8
	rst 38h			;f9e9
	rst 38h			;f9ea
	rst 38h			;f9eb
	rst 38h			;f9ec
	rst 38h			;f9ed
	rst 38h			;f9ee
	rst 38h			;f9ef
	rst 38h			;f9f0
	rst 38h			;f9f1
	rst 38h			;f9f2
	rst 38h			;f9f3
sub_f9f4h:
	rst 38h			;f9f4
	rst 38h			;f9f5
	rst 38h			;f9f6
	rst 38h			;f9f7
	rst 38h			;f9f8
	rst 38h			;f9f9
	rst 38h			;f9fa
	rst 38h			;f9fb
sub_f9fch:
	rst 38h			;f9fc
	rst 38h			;f9fd
	ld b,h			;f9fe
	ld b,h			;f9ff
lfa00h:
	ld b,h			;fa00
	ld b,h			;fa01
	ld b,h			;fa02
	ld b,h			;fa03
	inc bc			;fa04
	ld b,h			;fa05
	ld b,h			;fa06
lfa07h:
	ld b,h			;fa07
	ld b,h			;fa08
	ld b,h			;fa09
	ld b,h			;fa0a
	ld b,h			;fa0b
	rlca			;fa0c
	ld b,h			;fa0d
	ld b,h			;fa0e
	ld b,h			;fa0f
	ld b,h			;fa10
	ld b,h			;fa11
	ld b,h			;fa12
	ld b,h			;fa13
	ld b,h			;fa14
	inc bc			;fa15
	ld b,h			;fa16
	ld b,h			;fa17
	ld b,h			;fa18
	ld b,h			;fa19
	ld b,h			;fa1a
	inc bc			;fa1b
	ld b,h			;fa1c
	ld b,h			;fa1d
	ld b,h			;fa1e
	rlca			;fa1f
	ld b,h			;fa20
	ld b,h			;fa21
	rlca			;fa22
	ld b,h			;fa23
	inc bc			;fa24
	ld b,h			;fa25
	ld b,h			;fa26
	ld b,h			;fa27
	rlca			;fa28
	ld b,h			;fa29
	rlca			;fa2a
	ld b,h			;fa2b
	rlca			;fa2c
	rlca			;fa2d
	ld b,h			;fa2e
	rlca			;fa2f
	rlca			;fa30
	rlca			;fa31
	rlca			;fa32
	ld b,h			;fa33
	ld b,h			;fa34
	inc bc			;fa35
	ld b,h			;fa36
	rlca			;fa37
	ld b,h			;fa38
	ld b,h			;fa39
	ld b,h			;fa3a
	inc bc			;fa3b
	ld b,h			;fa3c
	ld b,h			;fa3d
	ld b,h			;fa3e
	rlca			;fa3f
	ld b,h			;fa40
	rlca			;fa41
	inc bc			;fa42
	inc bc			;fa43
	inc bc			;fa44
	ld b,h			;fa45
	ld b,h			;fa46
	ld b,h			;fa47
	rlca			;fa48
	ld b,h			;fa49
	rlca			;fa4a
	ld b,h			;fa4b
	rlca			;fa4c
	rlca			;fa4d
	rlca			;fa4e
	rlca			;fa4f
	rlca			;fa50
	rlca			;fa51
	rlca			;fa52
	rlca			;fa53
	ld b,h			;fa54
	inc bc			;fa55
	rlca			;fa56
	rlca			;fa57
	ld b,h			;fa58
	ld b,h			;fa59
	rlca			;fa5a
	inc bc			;fa5b
	ld b,h			;fa5c
	ld b,h			;fa5d
	ld b,h			;fa5e
	rlca			;fa5f
	ld b,h			;fa60
	rlca			;fa61
	rlca			;fa62
	rlca			;fa63
	inc bc			;fa64
	rlca			;fa65
lfa66h:
	ld b,h			;fa66
	ld b,h			;fa67
	rlca			;fa68
	rlca			;fa69
	rlca			;fa6a
	rlca			;fa6b
	ld b,d			;fa6c
	rlca			;fa6d
	ld b,d			;fa6e
	ld b,d			;fa6f
	rlca			;fa70
	rlca			;fa71
	rlca			;fa72
	rlca			;fa73
	rlca			;fa74
	inc bc			;fa75
	rlca			;fa76
	rlca			;fa77
	ld b,h			;fa78
	ld b,h			;fa79
	rlca			;fa7a
	inc bc			;fa7b
	ld b,h			;fa7c
	rlca			;fa7d
	rlca			;fa7e
	rlca			;fa7f
	ld b,h			;fa80
	rlca			;fa81
	rlca			;fa82
	rlca			;fa83
	inc bc			;fa84
	rlca			;fa85
lfa86h:
	ld b,h			;fa86
	rlca			;fa87
	rlca			;fa88
	ld b,d			;fa89
	ld b,d			;fa8a
	ld b,d			;fa8b
	ld b,d			;fa8c
	ld b,d			;fa8d
	ld b,d			;fa8e
	ld b,d			;fa8f
	rlca			;fa90
	rlca			;fa91
	rlca			;fa92
	rlca			;fa93
	rlca			;fa94
	inc bc			;fa95
	rlca			;fa96
	rlca			;fa97
	rlca			;fa98
	ld b,h			;fa99
	rlca			;fa9a
	inc bc			;fa9b
	rlca			;fa9c
	rlca			;fa9d
	rlca			;fa9e
	rlca			;fa9f
lfaa0h:
	rlca			;faa0
	rlca			;faa1
	rlca			;faa2
	rlca			;faa3
	inc bc			;faa4
	rlca			;faa5
	rlca			;faa6
	rlca			;faa7
	rlca			;faa8
	ld b,d			;faa9
	ld b,d			;faaa
	ld b,e			;faab
	ld b,d			;faac
	ld b,e			;faad
	ld b,d			;faae
	rlca			;faaf
	rlca			;fab0
	rlca			;fab1
	rlca			;fab2
	rlca			;fab3
	rlca			;fab4
	inc bc			;fab5
	inc bc			;fab6
	inc bc			;fab7
	rlca			;fab8
	rlca			;fab9
	rlca			;faba
	inc bc			;fabb
	rlca			;fabc
	rlca			;fabd
	rlca			;fabe
	rlca			;fabf
	rlca			;fac0
	rlca			;fac1
	rlca			;fac2
	rlca			;fac3
	inc bc			;fac4
	rlca			;fac5
	rlca			;fac6
	rlca			;fac7
	rlca			;fac8
	ld b,d			;fac9
	ld b,d			;faca
	ld b,d			;facb
	ld b,e			;facc
	ld b,d			;facd
	ld b,d			;face
	rlca			;facf
	rlca			;fad0
	rlca			;fad1
	rlca			;fad2
	rlca			;fad3
	rlca			;fad4
	inc bc			;fad5
	rlca			;fad6
sub_fad7h:
	rlca			;fad7
	rlca			;fad8
	rlca			;fad9
	rlca			;fada
	inc bc			;fadb
	rlca			;fadc
	inc b			;fadd
	inc b			;fade
	inc b			;fadf
	rlca			;fae0
	rlca			;fae1
	inc b			;fae2
	rlca			;fae3
	inc bc			;fae4
	rlca			;fae5
	rlca			;fae6
	inc b			;fae7
	rlca			;fae8
	rlca			;fae9
	rlca			;faea
	ld b,e			;faeb
	ld b,e			;faec
	ld b,e			;faed
	rlca			;faee
	rlca			;faef
	rlca			;faf0
	rlca			;faf1
	rlca			;faf2
	rlca			;faf3
sub_faf4h:
	rlca			;faf4
	inc bc			;faf5
sub_faf6h:
	rlca			;faf6
	inc b			;faf7
	inc b			;faf8
sub_faf9h:
	rlca			;faf9
lfafah:
	rlca			;fafa
	inc bc			;fafb
lfafch:
	rlca			;fafc
	inc b			;fafd
lfafeh:
	inc b			;fafe
	inc b			;faff
	inc b			;fb00
	rlca			;fb01
	inc b			;fb02
	rlca			;fb03
	inc bc			;fb04
	inc b			;fb05
	inc b			;fb06
	inc b			;fb07
	ld b,d			;fb08
	ld b,d			;fb09
	ld b,d			;fb0a
	ld b,d			;fb0b
	ld b,d			;fb0c
	ld b,d			;fb0d
	ld b,d			;fb0e
	rlca			;fb0f
	ld b,006h		;fb10
	inc b			;fb12
	inc b			;fb13
	inc b			;fb14
	inc bc			;fb15
	rlca			;fb16
	inc b			;fb17
	inc b			;fb18
	inc b			;fb19
	inc b			;fb1a
	inc b			;fb1b
	inc b			;fb1c
	inc b			;fb1d
	inc b			;fb1e
	inc b			;fb1f
	inc b			;fb20
	inc b			;fb21
	inc b			;fb22
	inc b			;fb23
	inc b			;fb24
	inc b			;fb25
	inc b			;fb26
	inc b			;fb27
	inc b			;fb28
	ld b,d			;fb29
	ld b,d			;fb2a
	ld (bc),a		;fb2b
	ld b,d			;fb2c
	ld b,d			;fb2d
	ld b,d			;fb2e
	rlca			;fb2f
	ld b,007h		;fb30
	jr c,lfb76h		;fb32
	ld b,d			;fb34
	ld b,d			;fb35
	ld b,d			;fb36
	ld b,d			;fb37
	inc b			;fb38
	inc b			;fb39
	inc b			;fb3a
	inc b			;fb3b
	inc b			;fb3c
	inc b			;fb3d
	rlca			;fb3e
	rlca			;fb3f
	rlca			;fb40
	rlca			;fb41
	rlca			;fb42
	rlca			;fb43
	rlca			;fb44
	rlca			;fb45
	jr c,lfb8ah		;fb46
	ld b,d			;fb48
	ld b,d			;fb49
	ld b,d			;fb4a
	ld b,d			;fb4b
	ld b,d			;fb4c
	ld b,d			;fb4d
	ld b,d			;fb4e
	ld b,d			;fb4f
	ld b,d			;fb50
	rlca			;fb51
	ld b,d			;fb52
	ld b,d			;fb53
	ld b,d			;fb54
	ld b,d			;fb55
	ld b,d			;fb56
	ld b,d			;fb57
	rlca			;fb58
	rlca			;fb59
	rlca			;fb5a
	rlca			;fb5b
	rlca			;fb5c
	rlca			;fb5d
	rlca			;fb5e
	rlca			;fb5f
	rlca			;fb60
	rlca			;fb61
	rlca			;fb62
	rlca			;fb63
	rlca			;fb64
	rlca			;fb65
	ld b,d			;fb66
	ld b,d			;fb67
	ld b,d			;fb68
	rlca			;fb69
	ld b,d			;fb6a
	ld b,d			;fb6b
	ld b,d			;fb6c
	ld b,d			;fb6d
	ld b,d			;fb6e
	ld b,d			;fb6f
	ld b,d			;fb70
	ld b,d			;fb71
	ld b,d			;fb72
	ld b,d			;fb73
	ld b,d			;fb74
	rlca			;fb75
lfb76h:
	rlca			;fb76
	ld b,d			;fb77
	ld b,d			;fb78
	rlca			;fb79
	rlca			;fb7a
	rlca			;fb7b
	rlca			;fb7c
	rlca			;fb7d
	rlca			;fb7e
	rlca			;fb7f
	rlca			;fb80
	rlca			;fb81
	rlca			;fb82
	rlca			;fb83
	rlca			;fb84
	rlca			;fb85
	ld b,d			;fb86
	ld b,d			;fb87
	ld b,d			;fb88
	ld b,d			;fb89
lfb8ah:
	ld b,d			;fb8a
	ld b,d			;fb8b
	ld b,d			;fb8c
	ld b,d			;fb8d
	ld b,d			;fb8e
	ld b,d			;fb8f
	rlca			;fb90
	rlca			;fb91
	rlca			;fb92
	rlca			;fb93
	rlca			;fb94
	rlca			;fb95
	rlca			;fb96
	rlca			;fb97
	rlca			;fb98
	rlca			;fb99
	rlca			;fb9a
	rlca			;fb9b
	rlca			;fb9c
	rlca			;fb9d
	rlca			;fb9e
	rlca			;fb9f
	rlca			;fba0
	rlca			;fba1
	rlca			;fba2
lfba3h:
	rlca			;fba3
	rlca			;fba4
	rlca			;fba5
	ld b,d			;fba6
	ld b,d			;fba7
	ld b,d			;fba8
	ld b,d			;fba9
	ld b,d			;fbaa
	ld b,d			;fbab
	ld b,d			;fbac
	ld b,d			;fbad
	ld b,d			;fbae
	ld b,d			;fbaf
	rlca			;fbb0
	rlca			;fbb1
	rlca			;fbb2
	rlca			;fbb3
	rlca			;fbb4
	rlca			;fbb5
	rlca			;fbb6
	rlca			;fbb7
	rlca			;fbb8
	rlca			;fbb9
	rlca			;fbba
	rlca			;fbbb
	rlca			;fbbc
	rlca			;fbbd
	rlca			;fbbe
	rlca			;fbbf
	rlca			;fbc0
	rlca			;fbc1
	rlca			;fbc2
	rlca			;fbc3
	rlca			;fbc4
	rlca			;fbc5
	rlca			;fbc6
	rlca			;fbc7
	rlca			;fbc8
	rlca			;fbc9
	rlca			;fbca
	rlca			;fbcb
	rlca			;fbcc
	rlca			;fbcd
	rlca			;fbce
	rlca			;fbcf
	rlca			;fbd0
	rlca			;fbd1
	rlca			;fbd2
	rlca			;fbd3
	rlca			;fbd4
	rlca			;fbd5
	rlca			;fbd6
	rlca			;fbd7
	rlca			;fbd8
	rlca			;fbd9
	rlca			;fbda
	rlca			;fbdb
	rlca			;fbdc
	rlca			;fbdd
	rlca			;fbde
	rlca			;fbdf
	rlca			;fbe0
	rlca			;fbe1
	rlca			;fbe2
	rlca			;fbe3
	rlca			;fbe4
	rlca			;fbe5
	rlca			;fbe6
	rlca			;fbe7
	rlca			;fbe8
	rlca			;fbe9
	rlca			;fbea
	rlca			;fbeb
	rlca			;fbec
	rlca			;fbed
	rlca			;fbee
	rlca			;fbef
	rlca			;fbf0
	rlca			;fbf1
	rlca			;fbf2
	rlca			;fbf3
	rlca			;fbf4
	rlca			;fbf5
	rlca			;fbf6
	rlca			;fbf7
	rlca			;fbf8
	rlca			;fbf9
	rlca			;fbfa
	rlca			;fbfb
	rlca			;fbfc
lfbfdh:
	rlca			;fbfd
	rlca			;fbfe
	rlca			;fbff
lfc00h:
	rlca			;fc00
sub_fc01h:
	rlca			;fc01
	rlca			;fc02
	rlca			;fc03
lfc04h:
	rlca			;fc04
	rlca			;fc05
	rlca			;fc06
	rlca			;fc07
	rlca			;fc08
	rlca			;fc09
	rlca			;fc0a
	rlca			;fc0b
	rlca			;fc0c
	rlca			;fc0d
	rlca			;fc0e
	rlca			;fc0f
	rlca			;fc10
	rlca			;fc11
	rlca			;fc12
	rlca			;fc13
	rlca			;fc14
	rlca			;fc15
	rlca			;fc16
	rlca			;fc17
	rlca			;fc18
	rlca			;fc19
	rlca			;fc1a
	rlca			;fc1b
	rlca			;fc1c
	rlca			;fc1d
	rlca			;fc1e
	rlca			;fc1f
	rlca			;fc20
	rlca			;fc21
	rlca			;fc22
	rlca			;fc23
	rlca			;fc24
	rlca			;fc25
	rlca			;fc26
	rlca			;fc27
	rlca			;fc28
	rlca			;fc29
	rlca			;fc2a
	rlca			;fc2b
	rlca			;fc2c
	rlca			;fc2d
	rlca			;fc2e
	rlca			;fc2f
	rlca			;fc30
	rlca			;fc31
	rlca			;fc32
	rlca			;fc33
	rlca			;fc34
	rlca			;fc35
	rlca			;fc36
	rlca			;fc37
	rlca			;fc38
	rlca			;fc39
	rlca			;fc3a
	rlca			;fc3b
	rlca			;fc3c
	rlca			;fc3d
	rlca			;fc3e
	rlca			;fc3f
	rlca			;fc40
	rlca			;fc41
	rlca			;fc42
	rlca			;fc43
lfc44h:
	rlca			;fc44
	rlca			;fc45
	rlca			;fc46
	rlca			;fc47
	rlca			;fc48
	rlca			;fc49
	rlca			;fc4a
	rlca			;fc4b
	rlca			;fc4c
	rlca			;fc4d
	rlca			;fc4e
	rlca			;fc4f
	rlca			;fc50
	rlca			;fc51
	rlca			;fc52
	rlca			;fc53
	rlca			;fc54
	rlca			;fc55
	rlca			;fc56
	rlca			;fc57
	rlca			;fc58
	rlca			;fc59
	rlca			;fc5a
	rlca			;fc5b
	rlca			;fc5c
	rlca			;fc5d
	ld ix,lfeffh		;fc5e
	ld de,00100h		;fc62
	ld a,0ffh		;fc65
	scf			;fc67
	ei			;fc68
	call 00556h		;fc69
	di			;fc6c
	jp lfeffh		;fc6d
	nop			;fc70
	nop			;fc71
	nop			;fc72
	nop			;fc73
	nop			;fc74
	nop			;fc75
	nop			;fc76
	nop			;fc77
	nop			;fc78
	nop			;fc79
	nop			;fc7a
	nop			;fc7b
	nop			;fc7c
	nop			;fc7d
	nop			;fc7e
	nop			;fc7f
	nop			;fc80
	nop			;fc81
	nop			;fc82
	nop			;fc83
	nop			;fc84
	nop			;fc85
	nop			;fc86
	nop			;fc87
	nop			;fc88
	nop			;fc89
	nop			;fc8a
	nop			;fc8b
	nop			;fc8c
	nop			;fc8d
	nop			;fc8e
	nop			;fc8f
	nop			;fc90
	nop			;fc91
	nop			;fc92
	nop			;fc93
	nop			;fc94
	nop			;fc95
	nop			;fc96
	nop			;fc97
	nop			;fc98
	nop			;fc99
	nop			;fc9a
	nop			;fc9b
	nop			;fc9c
	nop			;fc9d
	nop			;fc9e
	nop			;fc9f
	nop			;fca0
	nop			;fca1
	nop			;fca2
	nop			;fca3
	nop			;fca4
	nop			;fca5
	nop			;fca6
	nop			;fca7
	nop			;fca8
	nop			;fca9
	nop			;fcaa
	nop			;fcab
	nop			;fcac
	nop			;fcad
	nop			;fcae
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
	nop			;fcbb
lfcbch:
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
lfccch:
	nop			;fccc
	nop			;fccd
	nop			;fcce
	nop			;fccf
	nop			;fcd0
	nop			;fcd1
	nop			;fcd2
	nop			;fcd3
	nop			;fcd4
	nop			;fcd5
	nop			;fcd6
	nop			;fcd7
	nop			;fcd8
	nop			;fcd9
	nop			;fcda
	nop			;fcdb
lfcdch:
	nop			;fcdc
	nop			;fcdd
	nop			;fcde
	nop			;fcdf
	nop			;fce0
	nop			;fce1
	nop			;fce2
	nop			;fce3
	nop			;fce4
	nop			;fce5
	nop			;fce6
	nop			;fce7
	nop			;fce8
	nop			;fce9
	nop			;fcea
	nop			;fceb
	nop			;fcec
	nop			;fced
	nop			;fcee
	nop			;fcef
	nop			;fcf0
	nop			;fcf1
sub_fcf2h:
	nop			;fcf2
	nop			;fcf3
	nop			;fcf4
	nop			;fcf5
	nop			;fcf6
	nop			;fcf7
sub_fcf8h:
	nop			;fcf8
lfcf9h:
	nop			;fcf9
	nop			;fcfa
	nop			;fcfb
	nop			;fcfc
sub_fcfdh:
	nop			;fcfd
sub_fcfeh:
	and b			;fcfe
sub_fcffh:
	nop			;fcff
sub_fd00h:
	rst 38h			;fd00
	push af			;fd01
	nop			;fd02
	rlca			;fd03
	call m,sub_ff77h	;fd04
	rst 38h			;fd07
	rst 38h			;fd08
	rst 38h			;fd09
	cp 03ch			;fd0a
	ld a,a			;fd0c
	rst 38h			;fd0d
	defb 0fdh,0ffh,0ffh ;illegal sequence	;fd0e
	rst 38h			;fd11
	rst 38h			;fd12
	rst 38h			;fd13
	rst 38h			;fd14
	rst 38h			;fd15
	ret m			;fd16
	rrca			;fd17
	rst 38h			;fd18
	inc (hl)		;fd19
	rst 38h			;fd1a
	ex de,hl		;fd1b
	nop			;fd1c
	dec b			;fd1d
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
	nop			;fd48
	nop			;fd49
	nop			;fd4a
	nop			;fd4b
	nop			;fd4c
	nop			;fd4d
	nop			;fd4e
	nop			;fd4f
	nop			;fd50
	nop			;fd51
	nop			;fd52
	nop			;fd53
	nop			;fd54
	nop			;fd55
	nop			;fd56
	nop			;fd57
	nop			;fd58
	nop			;fd59
	nop			;fd5a
	nop			;fd5b
	nop			;fd5c
	nop			;fd5d
	nop			;fd5e
	nop			;fd5f
	nop			;fd60
	nop			;fd61
	nop			;fd62
	nop			;fd63
	nop			;fd64
	nop			;fd65
	nop			;fd66
	nop			;fd67
	nop			;fd68
	nop			;fd69
	nop			;fd6a
	nop			;fd6b
	nop			;fd6c
	nop			;fd6d
	nop			;fd6e
lfd6fh:
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
sub_fd7ah:
	nop			;fd7a
	nop			;fd7b
	nop			;fd7c
	nop			;fd7d
	nop			;fd7e
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
	nop			;fdb0
	nop			;fdb1
	nop			;fdb2
	nop			;fdb3
	nop			;fdb4
	nop			;fdb5
	nop			;fdb6
	nop			;fdb7
	nop			;fdb8
	nop			;fdb9
	nop			;fdba
	nop			;fdbb
	nop			;fdbc
	nop			;fdbd
	nop			;fdbe
	nop			;fdbf
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
sub_fdf4h:
	nop			;fdf4
	nop			;fdf5
sub_fdf6h:
	nop			;fdf6
	nop			;fdf7
	nop			;fdf8
	nop			;fdf9
	nop			;fdfa
	nop			;fdfb
	nop			;fdfc
	nop			;fdfd
	nop			;fdfe
	nop			;fdff
lfe00h:
	nop			;fe00
sub_fe01h:
	nop			;fe01
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
	nop			;fe0d
	nop			;fe0e
	nop			;fe0f
	nop			;fe10
	nop			;fe11
	nop			;fe12
	nop			;fe13
	nop			;fe14
	nop			;fe15
	nop			;fe16
	nop			;fe17
	nop			;fe18
	nop			;fe19
	nop			;fe1a
	nop			;fe1b
	nop			;fe1c
	nop			;fe1d
	nop			;fe1e
	nop			;fe1f
	nop			;fe20
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
lfe37h:
	nop			;fe37
	nop			;fe38
	nop			;fe39
	nop			;fe3a
	nop			;fe3b
	nop			;fe3c
	nop			;fe3d
	nop			;fe3e
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
lfe6ch:
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
lfe87h:
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
lfe95h:
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
sub_fec0h:
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
lfecch:
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
lfed7h:
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
	nop			;fee3
	nop			;fee4
	nop			;fee5
	nop			;fee6
lfee7h:
	nop			;fee7
	nop			;fee8
	nop			;fee9
sub_feeah:
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
lfef5h:
	nop			;fef5
lfef6h:
	nop			;fef6
	nop			;fef7
	nop			;fef8
	nop			;fef9
lfefah:
	nop			;fefa
	nop			;fefb
	nop			;fefc
lfefdh:
	nop			;fefd
	nop			;fefe
lfeffh:
	ld de,04349h		;feff
	ld ix,06a8bh		;ff02
	ld a,0ffh		;ff06
	scf			;ff08
	ei			;ff09
	call 00556h		;ff0a
	di			;ff0d
	ld de,03736h		;ff0e
	ld ix,0afc8h		;ff11
	ld a,0ffh		;ff15
	scf			;ff17
lff18h:
	ei			;ff18
	call 00556h		;ff19
lff1ch:
	di			;ff1c
	push iy			;ff1d
lff1fh:
	jp 0abc8h		;ff1f
	nop			;ff22
lff23h:
	nop			;ff23
	nop			;ff24
	nop			;ff25
	nop			;ff26
	nop			;ff27
	nop			;ff28
	nop			;ff29
	nop			;ff2a
	nop			;ff2b
	nop			;ff2c
	nop			;ff2d
	nop			;ff2e
	nop			;ff2f
	nop			;ff30
	nop			;ff31
	nop			;ff32
	nop			;ff33
	nop			;ff34
	nop			;ff35
	nop			;ff36
	nop			;ff37
	nop			;ff38
	nop			;ff39
	nop			;ff3a
	nop			;ff3b
	nop			;ff3c
	nop			;ff3d
	nop			;ff3e
lff3fh:
	nop			;ff3f
sub_ff40h:
	nop			;ff40
	nop			;ff41
	nop			;ff42
	nop			;ff43
lff44h:
	nop			;ff44
	nop			;ff45
	nop			;ff46
	nop			;ff47
	nop			;ff48
	nop			;ff49
	nop			;ff4a
	nop			;ff4b
lff4ch:
	nop			;ff4c
	nop			;ff4d
	nop			;ff4e
	nop			;ff4f
	nop			;ff50
	nop			;ff51
	nop			;ff52
	nop			;ff53
lff54h:
	nop			;ff54
lff55h:
	nop			;ff55
	nop			;ff56
	nop			;ff57
	nop			;ff58
	nop			;ff59
	nop			;ff5a
	nop			;ff5b
	nop			;ff5c
	nop			;ff5d
	nop			;ff5e
	nop			;ff5f
	nop			;ff60
	nop			;ff61
	nop			;ff62
	nop			;ff63
lff64h:
	nop			;ff64
	nop			;ff65
	nop			;ff66
	nop			;ff67
	nop			;ff68
	nop			;ff69
	nop			;ff6a
	nop			;ff6b
lff6ch:
	nop			;ff6c
	nop			;ff6d
	nop			;ff6e
	nop			;ff6f
lff70h:
	nop			;ff70
	nop			;ff71
	nop			;ff72
	nop			;ff73
	nop			;ff74
	nop			;ff75
	nop			;ff76
sub_ff77h:
	nop			;ff77
	nop			;ff78
lff79h:
	nop			;ff79
	nop			;ff7a
	nop			;ff7b
lff7ch:
	nop			;ff7c
	nop			;ff7d
	nop			;ff7e
sub_ff7fh:
	nop			;ff7f
lff80h:
	nop			;ff80
	nop			;ff81
	nop			;ff82
	nop			;ff83
	nop			;ff84
	nop			;ff85
	nop			;ff86
lff87h:
	nop			;ff87
	nop			;ff88
	nop			;ff89
	nop			;ff8a
	nop			;ff8b
sub_ff8ch:
	nop			;ff8c
	nop			;ff8d
	nop			;ff8e
	nop			;ff8f
lff90h:
	nop			;ff90
	nop			;ff91
	nop			;ff92
	nop			;ff93
	nop			;ff94
	nop			;ff95
	nop			;ff96
	nop			;ff97
	nop			;ff98
	nop			;ff99
	nop			;ff9a
	nop			;ff9b
	nop			;ff9c
	nop			;ff9d
	nop			;ff9e
	nop			;ff9f
	nop			;ffa0
	nop			;ffa1
	nop			;ffa2
	nop			;ffa3
	nop			;ffa4
	nop			;ffa5
	nop			;ffa6
	nop			;ffa7
lffa8h:
	nop			;ffa8
	nop			;ffa9
	nop			;ffaa
	nop			;ffab
lffach:
	nop			;ffac
	nop			;ffad
	nop			;ffae
	nop			;ffaf
lffb0h:
	nop			;ffb0
	nop			;ffb1
	nop			;ffb2
	nop			;ffb3
	nop			;ffb4
	nop			;ffb5
	nop			;ffb6
	nop			;ffb7
	nop			;ffb8
	nop			;ffb9
	nop			;ffba
	nop			;ffbb
lffbch:
	nop			;ffbc
	nop			;ffbd
	nop			;ffbe
lffbfh:
	nop			Warning: Code might not be 8080 compatible!
Warning: Self modifying code detected!
;ffbf
	nop			;ffc0
	nop			;ffc1
	nop			;ffc2
	nop			;ffc3
	nop			;ffc4
	nop			;ffc5
	nop			;ffc6
	nop			;ffc7
	nop			;ffc8
	nop			;ffc9
	nop			;ffca
	nop			;ffcb
lffcch:
	nop			;ffcc
	nop			;ffcd
	nop			;ffce
	nop			;ffcf
lffd0h:
	nop			;ffd0
	nop			;ffd1
	nop			;ffd2
	nop			;ffd3
lffd4h:
	nop			;ffd4
	nop			;ffd5
	nop			;ffd6
	nop			;ffd7
	nop			;ffd8
	nop			;ffd9
	nop			;ffda
	nop			;ffdb
	nop			;ffdc
	nop			;ffdd
	nop			;ffde
lffdfh:
	nop			;ffdf
	nop			;ffe0
	nop			;ffe1
	nop			;ffe2
	nop			;ffe3
	nop			;ffe4
	nop			;ffe5
	nop			;ffe6
lffe7h:
	nop			;ffe7
	nop			;ffe8
	nop			;ffe9
	nop			;ffea
	nop			;ffeb
lffech:
	nop			;ffec
	nop			;ffed
	nop			;ffee
	nop			;ffef
	nop			;fff0
	nop			;fff1
	nop			;fff2
	nop			;fff3
lfff4h:
	nop			;fff4
	nop			;fff5
	nop			;fff6
sub_fff7h:
	nop			;fff7
	nop			;fff8
	nop			;fff9
	nop			;fffa
lfffbh:
	nop			;fffb
sub_fffch:
	nop			;fffc
lfffdh:
	nop			;fffd
lfffeh:
	nop			;fffe
lffffh:
	rst 38h			;ffff
