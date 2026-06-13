; z80dasm 1.2.0
; command line: z80dasm -a -l -g 0x6A9B /tmp/dark1_code.bin

	org 06a9bh

	ld a,(la633h)		;6a9b
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
sub_6ab7h:
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
	ld a,(la633h)		;6b10
	and 03fh		;6b13
	cp 000h			;6b15
	ret z			;6b17
	dec a			;6b18
	ld (la633h),a		;6b19
	ret			;6b1c
	ld a,(la633h)		;6b1d
	and 03fh		;6b20
	cp 03fh			;6b22
	ret z			;6b24
	inc a			;6b25
	ld (la633h),a		;6b26
	ret			;6b29
l6b2ah:
	ld d,(iy+004h)		;6b2a
	ld e,(iy+005h)		;6b2d
	bit 7,(iy+003h)		;6b30
	call nz,sub_6b60h	;6b34
	ld h,(iy+001h)		;6b37
	ld l,(iy+002h)		;6b3a
	push hl			;6b3d
l6b3eh:
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
	ld a,(la652h)		;6daf
	cp 000h			;6db2
	jr z,l6dc7h		;6db4
	add a,a			;6db6
	ld c,a			;6db7
	ld b,000h		;6db8
	ld hl,la652h		;6dba
	ld d,000h		;6dbd
	ld e,c			;6dbf
	add hl,de		;6dc0
	push hl			;6dc1
	pop de			;6dc2
	inc de			;6dc3
	inc de			;6dc4
	lddr			;6dc5
l6dc7h:
	ld a,(la652h)		;6dc7
	inc a			;6dca
	ld (la652h),a		;6dcb
	pop bc			;6dce
	pop de			;6dcf
	pop hl			;6dd0
	ret			;6dd1
sub_6dd2h:
	push hl			;6dd2
	push de			;6dd3
l6dd4h:
	push bc			;6dd4
	ld hl,la655h		;6dd5
	ld de,la653h		;6dd8
	ld a,(la652h)		;6ddb
	dec a			;6dde
	ld (la652h),a		;6ddf
	add a,a			;6de2
	ld c,a			;6de3
	ld b,000h		;6de4
	ldir			;6de6
	pop bc			;6de8
	pop de			;6de9
	pop hl			;6dea
	ret			;6deb
	ld a,(la633h)		;6dec
	and 03fh		;6def
	ld b,a			;6df1
	inc b			;6df2
	ld ix,lfffeh		;6df3
l6df7h:
	inc ix			;6df7
	inc ix			;6df9
	djnz l6df7h		;6dfb
	ld l,(ix+000h)		;6dfd
sub_6e00h:
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
	ld (la653h),hl		;6e18
	inc ix			;6e1b
	inc ix			;6e1d
	djnz l6e0fh		;6e1f
	ret			;6e21
sub_6e22h:
	call sub_6dach		;6e22
	ld hl,05d2ah		;6e25
	ld (la653h),hl		;6e28
	call sub_6dach		;6e2b
	ld hl,05d3eh		;6e2e
	ld (la653h),hl		;6e31
	ret			;6e34
sub_6e35h:
	ld a,000h		;6e35
	ld (la652h),a		;6e37
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
	ld a,(0a612h)		;6e6e
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
	ld a,(la613h)		;6e87
	dec a			;6e8a
	ld (la613h),a		;6e8b
	cp 000h			;6e8e
	ret nz			;6e90
	ld a,028h		;6e91
	ld (la613h),a		;6e93
	ld hl,la6e8h		;6e96
	ld a,(la633h)		;6e99
	and 03fh		;6e9c
	ld b,000h		;6e9e
	ld c,a			;6ea0
	add hl,bc		;6ea1
	add hl,bc		;6ea2
	add hl,bc		;6ea3
	ld a,(hl)		;6ea4
	cp 000h			;6ea5
	jp z,l6ecbh		;6ea7
	ld (la615h),a		;6eaa
	ld (la619h),a		;6ead
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
	ld (0a612h),a		;6ecd
	ret			;6ed0
sub_6ed1h:
	ld a,(la615h)		;6ed1
	cp 000h			;6ed4
	ret z			;6ed6
	call sub_7d59h		;6ed7
	ld a,(l6f17h)		;6eda
	dec a			;6edd
	ld (l6f17h),a		;6ede
l6ee1h:
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
	ld (la615h),a		;6f1a
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
	ld a,(la619h)		;6f41
	ld (la614h),a		;6f44
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
	jp m,08007h		;6fb3
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
l7007h:
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
	ld bc,0ff1ch		;708c
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
	ld hl,(0d900h)		;713e
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
	ld bc,0fff4h		;7179
	nop			;717c
	call m,00000h		;717d
	xor c			;7180
	nop			;7181
	ld c,d			;7182
	rst 38h			;7183
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
sub_71f4h:
	ld bc,l8e20h		;71f4
	nop			;71f7
	and l			;71f8
	ld bc,lfc04h		;71f9
	ld bc,00270h		;71fc
	nop			;71ff
l7200h:
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
	ld ix,la652h		;7266
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
	ld ix,la652h		;72fe
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
	ld ix,la652h		;7393
	ld b,(ix+000h)		;7397
	dec ix			;739a
l739ch:
	push bc			;739c
	inc ix			;739d
	inc ix			;739f
	ld d,(ix+001h)		;73a1
	ld e,(ix+000h)		;73a4
	push ix			;73a7
l73a9h:
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
sub_7401h:
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
sub_7500h:
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
l7563h:
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
sub_76eah:
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
l7700h:
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
sub_7900h:
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
	ld a,(la633h)		;7a82
	and 03fh		;7a85
	inc a			;7a87
	ld iy,la665h		;7a88
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
	jp nz,l7ae8h		;7af3
	pop bc			;7af6
	pop de			;7af7
	and a			;7af8
	sbc hl,de		;7af9
	push bc			;7afb
	ld b,000h		;7afc
	add hl,bc		;7afe
	pop bc			;7aff
sub_7b00h:
	djnz l7ae1h		;7b00
	ld a,(l7b9ah)		;7b02
	cp 030h			;7b05
	jp z,l7b0fh		;7b07
	inc a			;7b0a
	ld (l7b9ah),a		;7b0b
	ret			;7b0e
l7b0fh:
	ld a,(la617h)		;7b0f
	cp 003h			;7b12
	ret z			;7b14
	inc a			;7b15
	ld (la617h),a		;7b16
	ld a,000h		;7b19
	ld (l7b9ah),a		;7b1b
	ret			;7b1e
sub_7b1fh:
	ld a,(la616h)		;7b1f
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
	ld a,(la616h)		;7b8e
	ld (la617h),a		;7b91
	ld (l7b9ah),a		;7b94
	ret			;7b97
l7b98h:
	nop			;7b98
	nop			;7b99
l7b9ah:
	nop			;7b9a
l7b9bh:
	ld a,(la616h)		;7b9b
	cp 003h			;7b9e
	ret z			;7ba0
	inc a			;7ba1
	ld (la616h),a		;7ba2
	call sub_7ba9h		;7ba5
	ret			;7ba8
sub_7ba9h:
	ld a,(la616h)		;7ba9
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
	call sub_a7e3h		;7bc6
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
	ld a,(la60dh)		;7bfc
	inc a			;7bff
sub_7c00h:
	ld (la60dh),a		;7c00
	cp 002h			;7c03
	call z,sub_7c09h	;7c05
	ret			;7c08
sub_7c09h:
	ld a,001h		;7c09
	ld (la60dh),a		;7c0b
	ld a,000h		;7c0e
	ld (la614h),a		;7c10
	ret			;7c13
sub_7c14h:
	ld a,(la614h)		;7c14
	cp 000h			;7c17
	ret z			;7c19
	cp 004h			;7c1a
	jp z,l7bfch		;7c1c
	push af			;7c1f
	ld a,000h		;7c20
	ld (la614h),a		;7c22
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
	ld a,(la633h)		;7c5d
	cp 000h			;7c60
	jp z,l7c9dh		;7c62
	call sub_7ca3h		;7c65
	ld a,(la633h)		;7c68
	dec a			;7c6b
	ld (la633h),a		;7c6c
	jp la820h		;7c6f
l7c72h:
	ld a,(05d32h)		;7c72
	cp 005h			;7c75
	ret z			;7c77
	ld a,(la633h)		;7c78
	cp 00eh			;7c7b
	jp z,sub_7ca3h		;7c7d
	call l7c9dh		;7c80
	ld a,(la633h)		;7c83
	inc a			;7c86
	ld (la633h),a		;7c87
	jp la820h		;7c8a
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
	ld a,b			;7cf4
	or c			;7cf5
	jr nz,l7cefh		;7cf6
	ld b,008h		;7cf8
	ld a,000h		;7cfa
l7cfch:
	push hl			;7cfc
	ld c,060h		;7cfd
l7cffh:
	ld (hl),a		;7cff
sub_7d00h:
	inc hl			;7d00
	dec c			;7d01
	jr nz,l7cffh		;7d02
	pop hl			;7d04
	inc h			;7d05
	djnz l7cfch		;7d06
	ret			;7d08
	ld a,(la614h)		;7d09
	cp 002h			;7d0c
	ret nz			;7d0e
	call sub_6dach		;7d0f
	ld hl,05d52h		;7d12
	ld (la653h),hl		;7d15
	call sub_6dach		;7d18
	ld hl,05d66h		;7d1b
	ld (la653h),hl		;7d1e
	call sub_6dach		;7d21
	ld hl,05d7ah		;7d24
	ld (la653h),hl		;7d27
	call sub_6dach		;7d2a
	ld hl,05d86h		;7d2d
	ld (la653h),hl		;7d30
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
	ld a,(la633h)		;7d4b
	ld c,a			;7d4e
	ld b,000h		;7d4f
	ld hl,la61fh		;7d51
	add hl,bc		;7d54
	ld a,(hl)		;7d55
	cp 001h			;7d56
	ret			;7d58
sub_7d59h:
	ld b,000h		;7d59
	ld a,(la633h)		;7d5b
	ld c,a			;7d5e
	ld hl,la61fh		;7d5f
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
	ld a,(la614h)		;7d7d
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
	scf			;7df9
l7dfah:
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
	ld a,(la652h)		;7e07
	add a,a			;7e0a
	ld b,000h		;7e0b
	ld c,a			;7e0d
	ld hl,la653h		;7e0e
	add hl,bc		;7e11
	ld (hl),e		;7e12
	inc hl			;7e13
	ld (hl),d		;7e14
	ld a,(la652h)		;7e15
	inc a			;7e18
	ld (la652h),a		;7e19
	ret			;7e1c
sub_7e1dh:
	ld a,(la652h)		;7e1d
	dec a			;7e20
	ld (la652h),a		;7e21
	ret			;7e24
sub_7e25h:
	ld a,(la84bh)		;7e25
	cp 000h			;7e28
	jp z,l7eb1h		;7e2a
	ld iy,l7f29h		;7e2d
	call sub_7e3bh		;7e31
	call sub_7eech		;7e34
	call sub_7f02h		;7e37
	ret			;7e3a
sub_7e3bh:
	call sub_7e90h		;7e3b
	ld a,(l7ea0h)		;7e3e
	cp 001h			;7e41
	jp z,l7ea3h		;7e43
	ld a,(iy+000h)		;7e46
	cp 090h			;7e49
	jp z,l7e54h		;7e4b
	sub 004h		;7e4e
	ld (iy+000h),a		;7e50
	ret			;7e53
l7e54h:
	ld a,(l7ea1h)		;7e54
	cp 000h			;7e57
	jp nz,l7e69h		;7e59
	ld a,(iy+001h)		;7e5c
	cp 000h			;7e5f
	jr z,l7e76h		;7e61
	sub 004h		;7e63
	ld (iy+001h),a		;7e65
	ret			;7e68
l7e69h:
	ld a,(iy+001h)		;7e69
	cp 0b8h			;7e6c
	jr z,l7e83h		;7e6e
	add a,004h		;7e70
	ld (iy+001h),a		;7e72
	ret			;7e75
l7e76h:
	ld ix,l7f29h		;7e76
	call sub_7609h		;7e7a
l7e7dh:
	ld a,001h		;7e7d
	ld (l7ea1h),a		;7e7f
	ret			;7e82
l7e83h:
	ld ix,l7f29h		;7e83
	call sub_75eeh		;7e87
	ld a,000h		;7e8a
	ld (l7ea1h),a		;7e8c
	ret			;7e8f
sub_7e90h:
	ld a,(iy+008h)		;7e90
	inc a			;7e93
	cp 003h			;7e94
	call z,sub_7e9dh	;7e96
	ld (iy+008h),a		;7e99
	ret			;7e9c
sub_7e9dh:
	ld a,001h		;7e9d
	ret			;7e9f
l7ea0h:
	nop			;7ea0
l7ea1h:
	nop			;7ea1
l7ea2h:
	nop			;7ea2
l7ea3h:
	ld a,(iy+000h)		;7ea3
	cp 0c0h			;7ea6
	jp z,l7ee3h		;7ea8
	add a,004h		;7eab
	ld (iy+000h),a		;7ead
	ret			;7eb0
l7eb1h:
	ld a,r			;7eb1
	and 01fh		;7eb3
	cp 000h			;7eb5
	ret nz			;7eb7
	ld a,001h		;7eb8
	ld (la84bh),a		;7eba
	ld ix,l7f29h		;7ebd
	call sub_75eeh		;7ec1
	ld a,000h		;7ec4
	ld (l7ea1h),a		;7ec6
	ld (l7ea2h),a		;7ec9
	ld (l7ea0h),a		;7ecc
	ld a,0b0h		;7ecf
	ld (ix+001h),a		;7ed1
	ld a,0c0h		;7ed4
	ld (ix+000h),a		;7ed6
	call sub_6dach		;7ed9
	ld hl,l7f29h		;7edc
	ld (la653h),hl		;7edf
	ret			;7ee2
l7ee3h:
	call sub_6dd2h		;7ee3
	ld a,000h		;7ee6
	ld (la84bh),a		;7ee8
	ret			;7eeb
sub_7eech:
	ld a,(l7ea0h)		;7eec
	cp 001h			;7eef
	ret z			;7ef1
	ld iy,l7f29h		;7ef2
	ld h,030h		;7ef6
	ld l,048h		;7ef8
	call sub_7d67h		;7efa
l7efdh:
	ret nc			;7efd
	call sub_a7f1h		;7efe
	ret			;7f01
sub_7f02h:
	ld iy,l7f29h		;7f02
	ld h,028h		;7f06
	ld l,040h		;7f08
	call sub_7d75h		;7f0a
	ret nc			;7f0d
	ld a,(l7831h)		;7f0e
	cp 001h			;7f11
	ret nz			;7f13
	ld a,(la617h)		;7f14
	ld b,a			;7f17
	inc b			;7f18
	ld a,(l7ea2h)		;7f19
	add a,b			;7f1c
	ld (l7ea2h),a		;7f1d
	sbc a,00eh		;7f20
	ret c			;7f22
	ld a,001h		;7f23
	ld (l7ea0h),a		;7f25
	ret			;7f28
l7f29h:
	nop			;7f29
	nop			;7f2a
	nop			;7f2b
	nop			;7f2c
	nop			;7f2d
	nop			;7f2e
	nop			;7f2f
	ld (bc),a		;7f30
	ld bc,03707h		;7f31
	ld a,a			;7f34
	sbc a,l			;7f35
	add a,d			;7f36
	ld b,009h		;7f37
	nop			;7f39
	sbc a,e			;7f3a
	add a,d			;7f3b
	rst 38h			;7f3c
	nop			;7f3d
	rst 38h			;7f3e
	nop			;7f3f
	rst 38h			;7f40
	nop			;7f41
	rst 38h			;7f42
	nop			;7f43
	rst 38h			;7f44
	nop			;7f45
	rst 38h			;7f46
	nop			;7f47
	rrca			;7f48
	nop			;7f49
	rst 38h			;7f4a
	nop			;7f4b
	rst 38h			;7f4c
	nop			;7f4d
	rst 38h			;7f4e
	nop			;7f4f
	rst 38h			;7f50
	nop			;7f51
	rst 38h			;7f52
	nop			;7f53
	rst 38h			;7f54
	nop			;7f55
	rst 38h			;7f56
	nop			;7f57
	ret m			;7f58
	nop			;7f59
	rlca			;7f5a
	ret p			;7f5b
	rst 38h			;7f5c
	nop			;7f5d
	rst 38h			;7f5e
	nop			;7f5f
	rst 38h			;7f60
	nop			;7f61
	rst 38h			;7f62
	nop			;7f63
	rst 38h			;7f64
	nop			;7f65
	rst 38h			;7f66
	nop			;7f67
	rst 38h			;7f68
	nop			;7f69
	ret p			;7f6a
	rlca			;7f6b
	rlca			;7f6c
	djnz $+1		;7f6d
	nop			;7f6f
	rst 38h			;7f70
	nop			;7f71
	rst 38h			;7f72
	nop			;7f73
	rst 38h			;7f74
	nop			;7f75
	rst 38h			;7f76
	nop			;7f77
	rst 38h			;7f78
	nop			;7f79
	rst 38h			;7f7a
	nop			;7f7b
	ret nz			;7f7c
	inc c			;7f7d
	rrca			;7f7e
	ret po			;7f7f
	rst 38h			;7f80
	nop			;7f81
	rst 38h			;7f82
sub_7f83h:
	nop			;7f83
	rst 38h			;7f84
	nop			;7f85
	rst 38h			;7f86
	nop			;7f87
	rst 38h			;7f88
	nop			;7f89
	rst 38h			;7f8a
	nop			;7f8b
	cp 000h			;7f8c
	nop			;7f8e
	inc sp			;7f8f
	rrca			;7f90
	ret po			;7f91
	rst 38h			;7f92
	nop			;7f93
l7f94h:
	rst 38h			;7f94
	nop			;7f95
	rst 38h			;7f96
	nop			;7f97
	rst 38h			;7f98
	nop			;7f99
	rst 38h			;7f9a
	nop			;7f9b
	rst 38h			;7f9c
	nop			;7f9d
	ret m			;7f9e
	ld bc,lef00h		;7f9f
	rrca			;7fa2
	jr nz,$+1		;7fa3
	nop			;7fa5
	rst 38h			;7fa6
	nop			;7fa7
	rst 38h			;7fa8
	nop			;7fa9
	rst 38h			;7faa
	nop			;7fab
	rst 38h			;7fac
	nop			;7fad
	rst 38h			;7fae
	nop			;7faf
	ret p			;7fb0
	rlca			;7fb1
	nop			;7fb2
	sub a			;7fb3
	rlca			;7fb4
	or b			;7fb5
	rst 38h			;7fb6
	nop			;7fb7
	rst 38h			;7fb8
l7fb9h:
	nop			;7fb9
	rst 38h			;7fba
	nop			;7fbb
	rst 38h			;7fbc
	nop			;7fbd
	rst 38h			;7fbe
	nop			;7fbf
	rst 38h			;7fc0
	nop			;7fc1
	ret nz			;7fc2
	ld c,000h		;7fc3
	ld a,e			;7fc5
	rlca			;7fc6
	ret p			;7fc7
	rst 38h			;7fc8
	nop			;7fc9
	rst 38h			;7fca
	nop			;7fcb
	rst 38h			;7fcc
	nop			;7fcd
	rst 38h			;7fce
	nop			;7fcf
	rst 38h			;7fd0
	nop			;7fd1
	rst 38h			;7fd2
	nop			;7fd3
	add a,b			;7fd4
	add hl,sp		;7fd5
	nop			;7fd6
	cp 003h			;7fd7
	ret nc			;7fd9
	rst 38h			;7fda
	nop			;7fdb
	rst 38h			;7fdc
	nop			;7fdd
	rst 38h			;7fde
	nop			;7fdf
	rst 38h			;7fe0
	nop			;7fe1
	rst 38h			;7fe2
	nop			;7fe3
	rst 38h			;7fe4
	nop			;7fe5
	nop			;7fe6
	ld (hl),a		;7fe7
	nop			;7fe8
	scf			;7fe9
	nop			;7fea
	ld l,h			;7feb
	rst 38h			;7fec
	nop			;7fed
	rst 38h			;7fee
	nop			;7fef
	rst 38h			;7ff0
	nop			;7ff1
	rst 38h			;7ff2
	nop			;7ff3
	rst 38h			;7ff4
	nop			;7ff5
	ret m			;7ff6
	nop			;7ff7
	nop			;7ff8
	rst 38h			;7ff9
	nop			;7ffa
	cp d			;7ffb
	nop			;7ffc
	rst 18h			;7ffd
sub_7ffeh:
	ld a,a			;7ffe
l7fffh:
	nop			;7fff
l8000h:
	rst 38h			;8000
	nop			;8001
	rst 38h			;8002
	nop			;8003
	ret p			;8004
	nop			;8005
	djnz l8008h		;8006
l8008h:
	nop			;8008
	rlca			;8009
	nop			;800a
	jp (hl)			;800b
	nop			;800c
	rst 30h			;800d
	nop			;800e
	add a,a			;800f
	ccf			;8010
	add a,b			;8011
	rst 38h			;8012
	nop			;8013
	rst 38h			;8014
	nop			;8015
	ret nz			;8016
	rrca			;8017
	nop			;8018
	rst 28h			;8019
	nop			;801a
	ret m			;801b
	nop			;801c
	defb 0edh ;next byte illegal after ed	;801d
	nop			;801e
	call m,sub_7900h	;801f
	ld a,a			;8022
	nop			;8023
	rst 38h			;8024
	nop			;8025
	rst 38h			;8026
	nop			;8027
	nop			;8028
	ld a,(l9000h)		;8029
	nop			;802c
	inc c			;802d
	nop			;802e
	ld d,a			;802f
	nop			;8030
	di			;8031
	nop			;8032
	add a,0ffh		;8033
	nop			;8035
	rst 38h			;8036
	nop			;8037
	cp 000h			;8038
	nop			;803a
	defb 0fdh,000h,03fh ;illegal sequence	;803b
	nop			;803e
l803fh:
	or e			;803f
	nop			;8040
	dec bc			;8041
	nop			;8042
	ld c,000h		;8043
	ld a,0ffh		;8045
	nop			;8047
	rst 38h			;8048
	nop			;8049
	call m,00001h		;804a
	ld h,d			;804d
	nop			;804e
	ld (hl),c		;804f
	nop			;8050
	call po,sub_8400h	;8051
	nop			;8054
l8055h:
	ld sp,hl		;8055
	nop			;8056
	jp pe,000ffh		;8057
	rst 38h			;805a
	nop			;805b
	ret m			;805c
	inc bc			;805d
	nop			;805e
	jp nz,lf000h		;805f
	nop			;8062
	ld e,a			;8063
	nop			;8064
	ld d,e			;8065
	nop			;8066
	rst 30h			;8067
	nop			;8068
	rst 38h			;8069
	ld a,a			;806a
	nop			;806b
l806ch:
	rst 38h			;806c
	nop			;806d
	ret m			;806e
	inc bc			;806f
l8070h:
	nop			;8070
	add a,h			;8071
	nop			;8072
	jp po,03000h		;8073
	nop			;8076
	ld c,e			;8077
l8078h:
	nop			;8078
	rst 8			;8079
	nop			;807a
	ld h,a			;807b
	ld a,a			;807c
	nop			;807d
	rst 38h			;807e
	nop			;807f
sub_8080h:
	ret p			;8080
	rlca			;8081
	nop			;8082
	sbc a,l			;8083
	nop			;8084
	rst 0			;8085
	nop			;8086
	ccf			;8087
	nop			;8088
	inc l			;8089
	nop			;808a
	xor e			;808b
l808ch:
	nop			;808c
	cp a			;808d
	ld a,a			;808e
	nop			;808f
	rst 38h			;8090
	nop			;8091
	ret m			;8092
	inc bc			;8093
	nop			;8094
	and l			;8095
	nop			;8096
	jp z,01700h		;8097
	nop			;809a
	xor c			;809b
	nop			;809c
	ld l,l			;809d
	nop			;809e
	ld a,a			;809f
	ld a,a			;80a0
	nop			;80a1
	rst 38h			;80a2
	nop			;80a3
	ret p			;80a4
	dec b			;80a5
	nop			;80a6
	sub l			;80a7
	nop			;80a8
	adc a,000h		;80a9
	jr l80adh		;80ab
l80adh:
	out (000h),a		;80ad
	sbc a,e			;80af
	nop			;80b0
	or 03fh			;80b1
	add a,b			;80b3
	rst 38h			;80b4
	nop			;80b5
	ret m			;80b6
	inc bc			;80b7
	nop			;80b8
	add a,l			;80b9
	nop			;80ba
	call nz,01f00h		;80bb
	nop			;80be
	rla			;80bf
	nop			;80c0
	rra			;80c1
	nop			;80c2
	rst 38h			;80c3
	ccf			;80c4
	add a,b			;80c5
	rst 38h			;80c6
	nop			;80c7
	ret p			;80c8
	dec b			;80c9
	nop			;80ca
	ret z			;80cb
	nop			;80cc
	ld h,b			;80cd
	nop			;80ce
	ld sp,0da00h		;80cf
	nop			;80d2
	ld d,b			;80d3
	nop			;80d4
	rrca			;80d5
	rra			;80d6
	ret nz			;80d7
	rst 38h			;80d8
	nop			;80d9
	ret m			;80da
	ld (bc),a		;80db
	nop			;80dc
	jp p,lb000h		;80dd
	nop			;80e0
	adc a,000h		;80e1
	inc h			;80e3
	nop			;80e4
	adc a,a			;80e5
	nop			;80e6
	pop af			;80e7
	rra			;80e8
	ret nz			;80e9
	rst 38h			;80ea
	nop			;80eb
	ret m			;80ec
	ld bc,00500h		;80ed
	nop			;80f0
	ld e,a			;80f1
	nop			;80f2
	ld sp,hl		;80f3
	nop			;80f4
	rlc b			;80f5
	rst 18h			;80f7
	nop			;80f8
	adc a,00fh		;80f9
	ld h,b			;80fb
l80fch:
	rst 38h			;80fc
	nop			;80fd
	ret p			;80fe
	rlca			;80ff
	nop			;8100
	jp m,0a600h		;8101
	nop			;8104
	and (hl)		;8105
	nop			;8106
	rla			;8107
l8108h:
	nop			;8108
	sbc a,b			;8109
	nop			;810a
	ld sp,0a00fh		;810b
	rst 38h			;810e
	nop			;810f
	ret po			;8110
	ld a,(bc)		;8111
	nop			;8112
	xor a			;8113
	nop			;8114
	ld e,b			;8115
	nop			;8116
	jr l8119h		;8117
l8119h:
	and 000h		;8119
	ld b,a			;811b
l811ch:
	nop			;811c
	cp 00fh			;811d
	ld h,b			;811f
	rst 38h			;8120
	nop			;8121
	ret po			;8122
	dec b			;8123
	nop			;8124
	rst 38h			;8125
	nop			;8126
	rst 20h			;8127
	nop			;8128
	ex (sp),hl		;8129
	nop			;812a
	nop			;812b
	nop			;812c
	and (hl)		;812d
	nop			;812e
	ei			;812f
	rlca			;8130
	sub b			;8131
	rst 38h			;8132
	nop			;8133
	ret nz			;8134
	rra			;8135
	nop			;8136
	rst 38h			;8137
	nop			;8138
	call m,09c00h		;8139
	nop			;813c
	dec (hl)		;813d
	nop			;813e
	in a,(000h)		;813f
	ld (hl),l		;8141
	rrca			;8142
	ret po			;8143
	rst 38h			;8144
	nop			;8145
	add a,b			;8146
	cpl			;8147
	nop			;8148
	ret pe			;8149
	nop			;814a
	rst 38h			;814b
	nop			;814c
	ld h,c			;814d
	nop			;814e
	adc a,000h		;814f
	jp pe,leb00h		;8151
	rra			;8154
	ret nz			;8155
	rst 38h			;8156
	nop			;8157
	add a,b			;8158
	ld a,000h		;8159
	ld e,a			;815b
	nop			;815c
	ld c,a			;815d
	nop			;815e
	sbc a,(hl)		;815f
	nop			;8160
	add hl,bc		;8161
	nop			;8162
	ld a,e			;8163
	nop			;8164
	rst 10h			;8165
	rra			;8166
	ret nz			;8167
	rst 38h			;8168
	nop			;8169
	nop			;816a
	ld (hl),e		;816b
	nop			;816c
	rst 30h			;816d
	nop			;816e
	cp e			;816f
	nop			;8170
	ret po			;8171
	nop			;8172
	or d			;8173
	nop			;8174
	ex de,hl		;8175
	nop			;8176
	ld h,01fh		;8177
	ret nz			;8179
	rst 38h			;817a
	nop			;817b
	add a,b			;817c
	dec a			;817d
	nop			;817e
	sub 000h		;817f
	halt			;8181
	nop			;8182
	ld (hl),e		;8183
	nop			;8184
	rst 10h			;8185
	nop			;8186
	ld c,h			;8187
	nop			;8188
	rst 10h			;8189
	rra			;818a
	ld b,b			;818b
	rst 38h			;818c
	nop			;818d
	add a,b			;818e
	inc a			;818f
	nop			;8190
	and 000h		;8191
	ld a,l			;8193
	nop			;8194
	cp e			;8195
	nop			;8196
	ex (sp),hl		;8197
	nop			;8198
	sbc a,e			;8199
	nop			;819a
	ld a,(lc01eh+1)		;819b
	rst 38h			;819e
	nop			;819f
	ret nz			;81a0
	ld d,000h		;81a1
	jp pe,06900h		;81a3
	nop			;81a6
	call z,0d600h		;81a7
	nop			;81aa
	sub (hl)		;81ab
	nop			;81ac
	ei			;81ad
	rrca			;81ae
	ret po			;81af
	rst 38h			;81b0
	nop			;81b1
	ret nz			;81b2
	ld (de),a		;81b3
	nop			;81b4
	ld l,d			;81b5
	nop			;81b6
	ld c,e			;81b7
	nop			;81b8
	cp l			;81b9
	nop			;81ba
	ld h,d			;81bb
	nop			;81bc
	call 09c00h		;81bd
	rrca			;81c0
	ret po			;81c1
	rst 38h			;81c2
	nop			;81c3
	ret po			;81c4
	add hl,bc		;81c5
	nop			;81c6
	jr z,l81c9h		;81c7
l81c9h:
	inc bc			;81c9
	nop			;81ca
	ld a,000h		;81cb
	xor l			;81cd
	nop			;81ce
	dec de			;81cf
	nop			;81d0
	out (007h),a		;81d1
	jr nc,$+1		;81d3
	nop			;81d5
	ret po			;81d6
	ex af,af'		;81d7
	nop			;81d8
	jr nz,l81dbh		;81d9
l81dbh:
	ld (bc),a		;81db
	nop			;81dc
	ld h,(hl)		;81dd
	nop			;81de
	ld hl,(l7700h)		;81df
	nop			;81e2
	ei			;81e3
	rlca			;81e4
	ret nc			;81e5
	rst 38h			;81e6
	nop			;81e7
	ret po			;81e8
	ex af,af'		;81e9
	nop			;81ea
	nop			;81eb
	nop			;81ec
	nop			;81ed
	nop			;81ee
	ld b,(hl)		;81ef
	nop			;81f0
	ld d,l			;81f1
	nop			;81f2
	jp (hl)			;81f3
	nop			;81f4
	cp (hl)			;81f5
	rrca			;81f6
	jr nz,$+1		;81f7
	nop			;81f9
	ret po			;81fa
	inc c			;81fb
	nop			;81fc
	nop			;81fd
	nop			;81fe
	nop			;81ff
	nop			;8200
l8201h:
	adc a,e			;8201
l8202h:
	nop			;8202
	ld l,e			;8203
	nop			;8204
	sbc a,l			;8205
	nop			;8206
	pop bc			;8207
	rlca			;8208
	ret nc			;8209
	rst 38h			;820a
	nop			;820b
	ret nz			;820c
	inc e			;820d
	nop			;820e
	nop			;820f
	nop			;8210
	nop			;8211
l8212h:
	nop			;8212
	ld bc,03e00h		;8213
	nop			;8216
	ld (hl),b		;8217
	nop			;8218
	ld a,001h		;8219
	jr nz,$+1		;821b
	nop			;821d
	add a,b			;821e
	inc c			;821f
	nop			;8220
	nop			;8221
	nop			;8222
	nop			;8223
	nop			;8224
	ld bc,l9d00h		;8225
	nop			;8228
	rst 8			;8229
	nop			;822a
	pop bc			;822b
	nop			;822c
	add a,0ffh		;822d
	nop			;822f
	nop			;8230
	ld b,(hl)		;8231
	nop			;8232
	nop			;8233
	nop			;8234
	ld (bc),a		;8235
	nop			;8236
	jr z,l8239h		;8237
l8239h:
	ret nz			;8239
	nop			;823a
	ccf			;823b
	nop			;823c
	dec a			;823d
	nop			;823e
	adc a,(hl)		;823f
	rst 38h			;8240
	nop			;8241
	nop			;8242
	ld h,(hl)		;8243
	nop			;8244
	and b			;8245
	nop			;8246
	dec bc			;8247
	nop			;8248
	dec (hl)		;8249
	nop			;824a
	rst 18h			;824b
	nop			;824c
	jr nc,l824fh		;824d
l824fh:
	defb 0edh ;next byte illegal after ed	;824f
	ld bc,lff9ch		;8250
	nop			;8253
	nop			;8254
	ld l,l			;8255
	nop			;8256
	jr z,l8259h		;8257
l8259h:
	ld c,c			;8259
	nop			;825a
	or e			;825b
	nop			;825c
	xor (hl)		;825d
	nop			;825e
	sub 000h		;825f
	dec hl			;8261
	ld bc,lff90h		;8262
	nop			;8265
	nop			;8266
	ld l,l			;8267
	nop			;8268
	ld l,b			;8269
	nop			;826a
	ld c,c			;826b
	nop			;826c
	sbc a,a			;826d
	nop			;826e
	ld e,l			;826f
	nop			;8270
	ret			;8271
	nop			;8272
	or l			;8273
	nop			;8274
	add a,0ffh		;8275
	nop			;8277
	nop			;8278
	ld l,d			;8279
	nop			;827a
	ld l,d			;827b
	nop			;827c
	call sub_6e00h		;827d
	nop			;8280
	xor l			;8281
	nop			;8282
	add a,a			;8283
	nop			;8284
	cp (hl)			;8285
	nop			;8286
	adc a,0ffh		;8287
	nop			;8289
	add a,b			;828a
	inc l			;828b
	nop			;828c
	jp nz,0cc00h		;828d
	nop			;8290
	cp d			;8291
	nop			;8292
	ld a,(bc)		;8293
	nop			;8294
	cpl			;8295
	nop			;8296
	ld l,001h		;8297
	call z,000ffh		;8299
	nop			;829c
	ld b,009h		;829d
	nop			;829f
	ld bc,lff86h		;82a0
	nop			;82a3
	rst 38h			;82a4
	nop			;82a5
	rst 38h			;82a6
	nop			;82a7
	rst 38h			;82a8
	nop			;82a9
	rst 38h			;82aa
	nop			;82ab
	rst 38h			;82ac
	nop			;82ad
	rst 38h			;82ae
	nop			;82af
	rst 38h			;82b0
	nop			;82b1
	rst 38h			;82b2
	nop			;82b3
	rst 38h			;82b4
	nop			;82b5
	rst 38h			;82b6
	nop			;82b7
	rst 38h			;82b8
	nop			;82b9
	rst 38h			;82ba
	nop			;82bb
	rst 38h			;82bc
	nop			;82bd
	rst 38h			;82be
	nop			;82bf
	rrca			;82c0
	nop			;82c1
	rst 38h			;82c2
	nop			;82c3
	rst 38h			;82c4
	nop			;82c5
	rst 38h			;82c6
	nop			;82c7
	rst 38h			;82c8
	nop			;82c9
	rst 38h			;82ca
	nop			;82cb
	rst 38h			;82cc
	nop			;82cd
	rst 38h			;82ce
	nop			;82cf
	ret m			;82d0
	nop			;82d1
	rlca			;82d2
	ret p			;82d3
	rst 38h			;82d4
	nop			;82d5
	rst 38h			;82d6
	nop			;82d7
	rst 38h			;82d8
	nop			;82d9
	rst 38h			;82da
	nop			;82db
	rst 38h			;82dc
	nop			;82dd
	rst 38h			;82de
	nop			;82df
	rst 38h			;82e0
	nop			;82e1
	ret p			;82e2
	rlca			;82e3
	rlca			;82e4
	djnz $+1		;82e5
	nop			;82e7
	rst 38h			;82e8
	nop			;82e9
	rst 38h			;82ea
	nop			;82eb
	rst 38h			;82ec
	nop			;82ed
	rst 38h			;82ee
	nop			;82ef
	rst 38h			;82f0
	nop			;82f1
	rst 38h			;82f2
	nop			;82f3
	ret nz			;82f4
	inc c			;82f5
	rrca			;82f6
	ret po			;82f7
	rst 38h			;82f8
	nop			;82f9
	rst 38h			;82fa
	nop			;82fb
	rst 38h			;82fc
	nop			;82fd
	rst 38h			;82fe
	nop			;82ff
	rst 38h			;8300
	nop			;8301
	rst 38h			;8302
	nop			;8303
	cp 000h			;8304
	nop			;8306
	inc sp			;8307
	rrca			;8308
	ret po			;8309
	rst 38h			;830a
	nop			;830b
	rst 38h			;830c
	nop			;830d
	rst 38h			;830e
	nop			;830f
	rst 38h			;8310
	nop			;8311
	rst 38h			;8312
	nop			;8313
	rst 38h			;8314
	nop			;8315
	ret m			;8316
	ld bc,lef00h		;8317
	rrca			;831a
	jr nz,$+1		;831b
	nop			;831d
	rst 38h			;831e
	nop			;831f
	rst 38h			;8320
	nop			;8321
	rst 38h			;8322
	nop			;8323
	rst 38h			;8324
	nop			;8325
	rst 38h			;8326
	nop			;8327
	ret p			;8328
	rlca			;8329
	nop			;832a
	sub a			;832b
	rlca			;832c
	or b			;832d
	rst 38h			;832e
	nop			;832f
	rst 38h			;8330
	nop			;8331
	rst 38h			;8332
	nop			;8333
	rst 38h			;8334
	nop			;8335
	rst 38h			;8336
	nop			;8337
	rst 38h			;8338
	nop			;8339
	ret nz			;833a
	ld c,000h		;833b
	ld a,e			;833d
	rlca			;833e
	ret p			;833f
	rst 38h			;8340
	nop			;8341
	rst 38h			;8342
	nop			;8343
	rst 38h			;8344
	nop			;8345
	rst 38h			;8346
	nop			;8347
	rst 38h			;8348
	nop			;8349
	rst 38h			;834a
	nop			;834b
	add a,b			;834c
	add hl,sp		;834d
	nop			;834e
	cp 003h			;834f
	ret nc			;8351
	rst 38h			;8352
	nop			;8353
	rst 38h			;8354
	nop			;8355
	rst 38h			;8356
	nop			;8357
	rst 38h			;8358
	nop			;8359
	rst 38h			;835a
	nop			;835b
	rst 38h			;835c
	nop			;835d
	nop			;835e
	ld (hl),a		;835f
	nop			;8360
	scf			;8361
	nop			;8362
	ld l,h			;8363
	rst 38h			;8364
	nop			;8365
	rst 38h			;8366
	nop			;8367
	rst 38h			;8368
	nop			;8369
	rst 38h			;836a
	nop			;836b
	rst 38h			;836c
	nop			;836d
	ret m			;836e
	nop			;836f
	nop			;8370
	rst 38h			;8371
	nop			;8372
	cp d			;8373
	nop			;8374
	rst 18h			;8375
	ld a,a			;8376
	nop			;8377
	rst 38h			;8378
	nop			;8379
	rst 38h			;837a
	nop			;837b
	ret p			;837c
	nop			;837d
	djnz l8380h		;837e
l8380h:
	nop			;8380
	rlca			;8381
	nop			;8382
	jp (hl)			;8383
	nop			;8384
	rst 30h			;8385
	nop			;8386
	add a,a			;8387
	ccf			;8388
	add a,b			;8389
	rst 38h			;838a
	nop			;838b
	rst 38h			;838c
	nop			;838d
	ret nz			;838e
	rrca			;838f
	nop			;8390
	rst 28h			;8391
	nop			;8392
	ret m			;8393
	nop			;8394
	defb 0edh ;next byte illegal after ed	;8395
	nop			;8396
	call m,sub_7900h	;8397
	ld a,a			;839a
	nop			;839b
	rst 38h			;839c
	nop			;839d
	rst 38h			;839e
	nop			;839f
	nop			;83a0
	ld a,(l9000h)		;83a1
	nop			;83a4
	inc c			;83a5
	nop			;83a6
	ld d,a			;83a7
	nop			;83a8
	di			;83a9
	nop			;83aa
	add a,0ffh		;83ab
	nop			;83ad
	rst 38h			;83ae
	nop			;83af
	cp 000h			;83b0
	nop			;83b2
	defb 0fdh,000h,03fh ;illegal sequence	;83b3
	nop			;83b6
	or e			;83b7
	nop			;83b8
	dec bc			;83b9
	nop			;83ba
	ld c,000h		;83bb
	ld a,0ffh		;83bd
	nop			;83bf
	rst 38h			;83c0
	nop			;83c1
	call m,00001h		;83c2
	ld h,d			;83c5
	nop			;83c6
	ld (hl),c		;83c7
	nop			;83c8
	call po,sub_8400h	;83c9
	nop			;83cc
	ld sp,hl		;83cd
	nop			;83ce
	jp pe,000ffh		;83cf
	rst 38h			;83d2
	nop			;83d3
	ret m			;83d4
	inc bc			;83d5
	nop			;83d6
	jp nz,lf000h		;83d7
	nop			;83da
	ld e,a			;83db
	nop			;83dc
	ld d,e			;83dd
	nop			;83de
	rst 30h			;83df
	nop			;83e0
	rst 38h			;83e1
	ld a,a			;83e2
	nop			;83e3
	rst 38h			;83e4
	nop			;83e5
	ret m			;83e6
	inc bc			;83e7
	nop			;83e8
	add a,h			;83e9
	nop			;83ea
	ret po			;83eb
	nop			;83ec
	jr nc,l83efh		;83ed
l83efh:
	ld b,e			;83ef
	nop			;83f0
	rst 8			;83f1
	nop			;83f2
	ld h,a			;83f3
	ld a,a			;83f4
	nop			;83f5
	rst 38h			;83f6
	nop			;83f7
	ret p			;83f8
	rlca			;83f9
	nop			;83fa
	sub l			;83fb
	nop			;83fc
	add a,000h		;83fd
	ccf			;83ff
sub_8400h:
	nop			;8400
	add hl,hl		;8401
	nop			;8402
	xor e			;8403
	nop			;8404
	cp a			;8405
	ld a,a			;8406
	nop			;8407
	rst 38h			;8408
	nop			;8409
	ret m			;840a
	inc bc			;840b
	nop			;840c
	and l			;840d
	nop			;840e
	jp z,01700h		;840f
	nop			;8412
	xor h			;8413
	nop			;8414
	ld l,l			;8415
	nop			;8416
	ld a,a			;8417
	ld a,a			;8418
	nop			;8419
	rst 38h			;841a
	nop			;841b
	ret p			;841c
	dec b			;841d
	nop			;841e
	sub l			;841f
	nop			;8420
	adc a,000h		;8421
	jr l8425h		;8423
l8425h:
	exx			;8425
	nop			;8426
	dec de			;8427
	nop			;8428
	or 03fh			;8429
	add a,b			;842b
	rst 38h			;842c
	nop			;842d
	ret m			;842e
	inc bc			;842f
	nop			;8430
	add a,l			;8431
	nop			;8432
	call nz,01f00h		;8433
	nop			;8436
	inc de			;8437
	nop			;8438
l8439h:
	sbc a,a			;8439
	nop			;843a
	rst 38h			;843b
	ccf			;843c
	add a,b			;843d
	rst 38h			;843e
	nop			;843f
	ret p			;8440
	dec b			;8441
	nop			;8442
	ret z			;8443
	nop			;8444
	ld h,b			;8445
	nop			;8446
	jr nc,l8449h		;8447
l8449h:
	rst 10h			;8449
	nop			;844a
	ld de,sub_feffh+1	;844b
	rra			;844e
	ret nz			;844f
	rst 38h			;8450
	nop			;8451
	ret m			;8452
	ld (bc),a		;8453
	nop			;8454
	jp p,lb000h		;8455
	nop			;8458
	rst 8			;8459
	nop			;845a
	ld hl,(04e00h)		;845b
	nop			;845e
	ld bc,lc01eh+1		;845f
	rst 38h			;8462
	nop			;8463
	ret m			;8464
	ld bc,00500h		;8465
	nop			;8468
	ld e,a			;8469
	nop			;846a
	cp 000h			;846b
	ld b,h			;846d
	nop			;846e
	add a,c			;846f
	nop			;8470
	cp 00fh			;8471
	ld h,b			;8473
	rst 38h			;8474
	nop			;8475
	ret p			;8476
	rlca			;8477
	nop			;8478
	jp m,l9e00h		;8479
	nop			;847c
	xor c			;847d
	nop			;847e
	sbc a,e			;847f
	nop			;8480
	sbc a,000h		;8481
	ld bc,0a00fh		;8483
	rst 38h			;8486
	nop			;8487
	ret po			;8488
	dec b			;8489
	nop			;848a
	rst 38h			;848b
	nop			;848c
	rst 20h			;848d
	nop			;848e
	or 000h			;848f
	ld h,a			;8491
	nop			;8492
	sbc a,c			;8493
	nop			;8494
	ei			;8495
	rlca			;8496
	sub b			;8497
	rst 38h			;8498
	nop			;8499
	ret nz			;849a
	rra			;849b
	nop			;849c
	rst 38h			;849d
	nop			;849e
	ret m			;849f
	nop			;84a0
	sub e			;84a1
	nop			;84a2
	sub b			;84a3
	nop			;84a4
	and (hl)		;84a5
	nop			;84a6
	push af			;84a7
	rrca			;84a8
	ret po			;84a9
	rst 38h			;84aa
	nop			;84ab
	add a,b			;84ac
	cpl			;84ad
	nop			;84ae
	ret pe			;84af
	nop			;84b0
	rst 38h			;84b1
	nop			;84b2
	ld l,h			;84b3
	nop			;84b4
	dec h			;84b5
	nop			;84b6
	in a,(000h)		;84b7
	ld l,e			;84b9
	rra			;84ba
	ret nz			;84bb
	rst 38h			;84bc
	nop			;84bd
	add a,b			;84be
	ld a,000h		;84bf
	ld e,a			;84c1
	nop			;84c2
	ld c,a			;84c3
	nop			;84c4
	sub e			;84c5
	nop			;84c6
	adc a,000h		;84c7
	jp pe,0d700h		;84c9
	rra			;84cc
	ret nz			;84cd
	rst 38h			;84ce
	nop			;84cf
	nop			;84d0
	ld (hl),e		;84d1
	nop			;84d2
	rst 30h			;84d3
	nop			;84d4
	cp e			;84d5
	nop			;84d6
	call pe,02900h		;84d7
	nop			;84da
	ld a,e			;84db
	nop			;84dc
	daa			;84dd
	rra			;84de
	ret nz			;84df
	rst 38h			;84e0
	nop			;84e1
	add a,b			;84e2
	dec a			;84e3
	nop			;84e4
	sub 000h		;84e5
	halt			;84e7
	nop			;84e8
	ld (hl),e		;84e9
	nop			;84ea
	jp nc,0e800h		;84eb
	nop			;84ee
	sub 01fh		;84ef
	ret nz			;84f1
	rst 38h			;84f2
	nop			;84f3
	add a,b			;84f4
	inc a			;84f5
	nop			;84f6
	and 000h		;84f7
	ld a,l			;84f9
	nop			;84fa
	cp e			;84fb
	nop			;84fc
	rst 10h			;84fd
	nop			;84fe
	ld c,e			;84ff
l8500h:
	nop			;8500
	dec sp			;8501
	rra			;8502
	ld b,b			;8503
	rst 38h			;8504
	nop			;8505
	ret nz			;8506
	ld d,000h		;8507
	jp pe,06900h		;8509
	nop			;850c
	call z,sub_e300h	;850d
	nop			;8510
	sub (hl)		;8511
	nop			;8512
	jp m,le00fh		;8513
	rst 38h			;8516
	nop			;8517
	ret nz			;8518
	ld (de),a		;8519
	nop			;851a
	ld l,d			;851b
	nop			;851c
	ld c,e			;851d
	nop			;851e
	cp l			;851f
	nop			;8520
	halt			;8521
	nop			;8522
	adc a,l			;8523
	nop			;8524
	sbc a,h			;8525
	rrca			;8526
	ret po			;8527
	rst 38h			;8528
	nop			;8529
	add a,b			;852a
	add hl,bc		;852b
	nop			;852c
	jr z,l852fh		;852d
l852fh:
	inc bc			;852f
	nop			;8530
	ld a,000h		;8531
	and d			;8533
	nop			;8534
	sbc a,e			;8535
	nop			;8536
	out (007h),a		;8537
	jr nc,$+1		;8539
	nop			;853b
	nop			;853c
	ld c,b			;853d
	nop			;853e
	jr nz,l8541h		;853f
l8541h:
	ld (bc),a		;8541
	nop			;8542
	ld h,a			;8543
	nop			;8544
	inc l			;8545
	nop			;8546
	ld (hl),a		;8547
	nop			;8548
	ei			;8549
	rlca			;854a
	ret nc			;854b
	rst 38h			;854c
	nop			;854d
	and b			;854e
	inc c			;854f
	nop			;8550
	nop			;8551
	nop			;8552
	nop			;8553
	nop			;8554
	inc bc			;8555
	nop			;8556
	ld c,c			;8557
	nop			;8558
	jp (hl)			;8559
	nop			;855a
	cp b			;855b
	ld bc,0ff20h		;855c
	nop			;855f
	ret po			;8560
	inc c			;8561
	nop			;8562
	nop			;8563
	nop			;8564
	nop			;8565
	nop			;8566
	inc bc			;8567
	nop			;8568
	ld h,e			;8569
	nop			;856a
	sbc a,l			;856b
	nop			;856c
	jp l9600h		;856d
	rst 38h			;8570
	nop			;8571
	ret p			;8572
	ld b,000h		;8573
	nop			;8575
	nop			;8576
	ld (bc),a		;8577
	nop			;8578
	add hl,hl		;8579
	nop			;857a
	ld e,000h		;857b
	ld (hl),b		;857d
	nop			;857e
	rla			;857f
	nop			;8580
	ld l,0ffh		;8581
	nop			;8583
	ret p			;8584
	ld b,000h		;8585
	and b			;8587
	nop			;8588
	dec bc			;8589
	nop			;858a
	dec (hl)		;858b
	nop			;858c
	sbc a,l			;858d
	nop			;858e
	call z,sub_c700h	;858f
	ld bc,lff4ch		;8592
	nop			;8595
	ret po			;8596
	dec c			;8597
	nop			;8598
	jr z,l859bh		;8599
l859bh:
	ld c,c			;859b
	nop			;859c
	or e			;859d
	nop			;859e
	ret nz			;859f
	nop			;85a0
	dec a			;85a1
	nop			;85a2
	rst 18h			;85a3
	inc bc			;85a4
	nop			;85a5
	rst 38h			;85a6
	nop			;85a7
	and b			;85a8
	dec c			;85a9
	nop			;85aa
	ld l,b			;85ab
	nop			;85ac
	ld c,c			;85ad
	nop			;85ae
	sbc a,a			;85af
	nop			;85b0
	rst 18h			;85b1
	nop			;85b2
	nop			;85b3
	nop			;85b4
	xor (hl)		;85b5
	rlca			;85b6
	djnz $+1		;85b7
	nop			;85b9
	nop			;85ba
	ld c,d			;85bb
	nop			;85bc
	ld l,d			;85bd
	nop			;85be
	call 06f00h		;85bf
	nop			;85c2
	ld l,000h		;85c3
	halt			;85c5
	nop			;85c6
	jr z,$+9		;85c7
	ld (hl),b		;85c9
	rst 38h			;85ca
	nop			;85cb
	add a,b			;85cc
	inc c			;85cd
	nop			;85ce
	jp nz,0cc00h		;85cf
	nop			;85d2
	cp b			;85d3
	nop			;85d4
	ld e,h			;85d5
	nop			;85d6
	rst 30h			;85d7
	nop			;85d8
	or e			;85d9
	rlca			;85da
	ret p			;85db
	rst 38h			;85dc
	nop			;85dd
	add a,b			;85de
	cpl			;85df
	nop			;85e0
	ld d,a			;85e1
	nop			;85e2
	jp lfa00h		;85e3
	nop			;85e6
	xor l			;85e7
	nop			;85e8
	rst 28h			;85e9
	nop			;85ea
	cp a			;85eb
	rrca			;85ec
	nop			;85ed
	rst 38h			;85ee
	nop			;85ef
	add a,b			;85f0
	cpl			;85f1
	nop			;85f2
	ex de,hl		;85f3
	nop			;85f4
	ccf			;85f5
	nop			;85f6
	push bc			;85f7
	nop			;85f8
	add hl,bc		;85f9
	nop			;85fa
	cp 000h			;85fb
	ld l,01fh		;85fd
	ld b,b			;85ff
	rst 38h			;8600
	nop			;8601
	nop			;8602
l8603h:
	ld a,(la84ch)		;8603
	cp 000h			;8606
	jp z,l86e2h		;8608
	call sub_8615h		;860b
	call sub_8690h		;860e
	call sub_86a4h		;8611
	ret			;8614
sub_8615h:
	call sub_873eh		;8615
	ld a,(l868dh)		;8618
	cp 001h			;861b
	jp z,l86cch		;861d
	ld a,(l868ch)		;8620
	cp 000h			;8623
	jp nz,l8636h		;8625
	ld a,(l875bh)		;8628
	sub 004h		;862b
	ld (l875bh),a		;862d
	cp 000h			;8630
	jr z,l8644h		;8632
	jr l865eh		;8634
l8636h:
	ld a,(l875bh)		;8636
	cp 0d0h			;8639
	jr z,l8652h		;863b
	add a,004h		;863d
	ld (l875bh),a		;863f
	jr l865eh		;8642
l8644h:
	ld a,001h		;8644
	ld (l868ch),a		;8646
	ld ix,l875ah		;8649
	call sub_7609h		;864d
	jr l865eh		;8650
l8652h:
	ld a,000h		;8652
	ld (l868ch),a		;8654
	ld ix,l875ah		;8657
	call sub_75eeh		;865b
l865eh:
	ld a,(l868eh)		;865e
	cp 001h			;8661
	jp z,l867fh		;8663
	ld a,(l875ah)		;8666
	cp 0a8h			;8669
	jr z,l8673h		;866b
	add a,004h		;866d
	ld (l875ah),a		;866f
	ret			;8672
l8673h:
	ld a,001h		;8673
	ld (l868eh),a		;8675
	ret			;8678
l8679h:
	ld a,000h		;8679
	ld (l868eh),a		;867b
	ret			;867e
l867fh:
	ld a,(l875ah)		;867f
	cp 03ch			;8682
	jr z,l8679h		;8684
	sub 004h		;8686
	ld (l875ah),a		;8688
	ret			;868b
l868ch:
	nop			;868c
l868dh:
	nop			;868d
l868eh:
	nop			;868e
l868fh:
	nop			;868f
sub_8690h:
	ld a,(l868dh)		;8690
	cp 001h			;8693
	ret z			;8695
	ld iy,l875ah		;8696
	ld h,010h		;869a
	ld l,028h		;869c
	call sub_7d67h		;869e
	jp c,sub_a7f1h		;86a1
sub_86a4h:
	ld iy,l875ah		;86a4
	ld h,010h		;86a8
	ld l,028h		;86aa
	call sub_7d75h		;86ac
	ret nc			;86af
	ld a,(l7831h)		;86b0
	cp 001h			;86b3
	ret nz			;86b5
	ld a,(la617h)		;86b6
	ld b,a			;86b9
	inc b			;86ba
	ld a,(l868fh)		;86bb
	add a,b			;86be
	ld (l868fh),a		;86bf
	and a			;86c2
	sbc a,010h		;86c3
	ret c			;86c5
	ld a,001h		;86c6
	ld (l868dh),a		;86c8
	ret			;86cb
l86cch:
	ld a,(l875ah)		;86cc
	cp 0c0h			;86cf
	jr z,l86d9h		;86d1
	add a,004h		;86d3
	ld (l875ah),a		;86d5
	ret			;86d8
l86d9h:
	call sub_7e1dh		;86d9
	ld a,000h		;86dc
	ld (la84ch),a		;86de
	ret			;86e1
l86e2h:
	ld a,r			;86e2
	and 01fh		;86e4
	cp 000h			;86e6
	ret nz			;86e8
	ld a,001h		;86e9
	ld (la84ch),a		;86eb
	ld a,000h		;86ee
	ld (l868fh),a		;86f0
	ld (l868ch),a		;86f3
	ld (l868dh),a		;86f6
	ld (l868eh),a		;86f9
	ld a,r			;86fc
	and 010h		;86fe
l8700h:
	cp 001h			;8700
	jp z,l8738h		;8702
	ld a,038h		;8705
l8707h:
	ld (l875ah),a		;8707
	ld a,0d0h		;870a
	ld (l875bh),a		;870c
	ld ix,l875ah		;870f
	call sub_75eeh		;8713
	ld de,l875ah		;8716
	call sub_7e07h		;8719
	ld a,r			;871c
	and 020h		;871e
	cp 000h			;8720
	jp nz,l8726h		;8722
	ret			;8725
l8726h:
	ld ix,l875ah		;8726
	call sub_7609h		;872a
	ld a,000h		;872d
	ld (l875bh),a		;872f
	ld a,001h		;8732
	ld (l868ch),a		;8734
	ret			;8737
l8738h:
	ld a,078h		;8738
	jp l8707h		;873a
l873dh:
	nop			;873d
sub_873eh:
	ld a,(l873dh)		;873e
	inc a			;8741
	ld (l873dh),a		;8742
	cp 002h			;8745
	ret nz			;8747
	ld a,000h		;8748
	ld (l873dh),a		;874a
	ld a,(l8762h)		;874d
	inc a			;8750
	cp 003h			;8751
	call z,sub_7e9dh	;8753
	ld (l8762h),a		;8756
	ret			;8759
l875ah:
	nop			;875a
l875bh:
	nop			;875b
	nop			;875c
	nop			;875d
	nop			;875e
	nop			;875f
	nop			;8760
	ld (bc),a		;8761
l8762h:
	ld bc,06807h		;8762
	add a,a			;8765
	adc a,l			;8766
	adc a,b			;8767
	inc bc			;8768
	ld b,000h		;8769
	adc a,h			;876b
	adc a,b			;876c
	rst 38h			;876d
	nop			;876e
	add a,c			;876f
	nop			;8770
	rst 38h			;8771
	nop			;8772
	rst 38h			;8773
	nop			;8774
	ret m			;8775
	nop			;8776
	ccf			;8777
	nop			;8778
	cp 000h			;8779
	nop			;877b
	ld a,(hl)		;877c
	rrca			;877d
	nop			;877e
	rst 38h			;877f
	nop			;8780
	ret nz			;8781
	rlca			;8782
	rra			;8783
	ret nz			;8784
	call m,00001h		;8785
	adc a,a			;8788
	inc bc			;8789
	ret p			;878a
	call m,00000h		;878b
	ccf			;878e
	rrca			;878f
	and b			;8790
	ret m			;8791
	ld (bc),a		;8792
	ld (hl),b		;8793
	ld bc,lfc01h		;8794
	ret p			;8797
	inc bc			;8798
	nop			;8799
	ret m			;879a
	ld e,a			;879b
	nop			;879c
	defb 0fdh,000h,0feh ;illegal sequence	;879d
	nop			;87a0
	nop			;87a1
	ld a,(hl)		;87a2
	ret po			;87a3
	rrca			;87a4
	rlca			;87a5
	ret po			;87a6
	rst 38h			;87a7
	nop			;87a8
	rst 38h			;87a9
	nop			;87aa
	rst 38h			;87ab
	nop			;87ac
	add a,b			;87ad
	rra			;87ae
	ld b,b			;87af
	rra			;87b0
	rrca			;87b1
	ret nz			;87b2
	rst 38h			;87b3
	nop			;87b4
	ld sp,hl		;87b5
	nop			;87b6
	call p,l8000h		;87b7
	ld c,000h		;87ba
	cp a			;87bc
	rlca			;87bd
	or b			;87be
	rst 38h			;87bf
	nop			;87c0
	ret po			;87c1
	ld b,040h		;87c2
	dec bc			;87c4
	nop			;87c5
	ld b,a			;87c6
	nop			;87c7
	ld a,a			;87c8
	inc bc			;87c9
	ld e,b			;87ca
	rst 38h			;87cb
	nop			;87cc
	ret nz			;87cd
	rra			;87ce
	nop			;87cf
	or l			;87d0
	nop			;87d1
	cp d			;87d2
	nop			;87d3
	cp 001h			;87d4
	call pe,000ffh		;87d6
	add a,b			;87d9
	dec sp			;87da
	nop			;87db
	push de			;87dc
	nop			;87dd
	cp d			;87de
	nop			;87df
	cp 001h			;87e0
	call p,000ffh		;87e2
	add a,b			;87e5
	dec (hl)		;87e6
	nop			;87e7
	cp l			;87e8
	nop			;87e9
	ld a,e			;87ea
	nop			;87eb
	defb 0fdh,000h,0eah ;illegal sequence	;87ec
	rst 38h			;87ef
	nop			;87f0
	add a,b			;87f1
	dec (hl)		;87f2
	nop			;87f3
	rlc b			;87f4
	rst 30h			;87f6
	nop			;87f7
	rst 38h			;87f8
	nop			;87f9
	or 0ffh			;87fa
	nop			;87fc
	add a,b			;87fd
	ccf			;87fe
	inc (hl)		;87ff
	add a,b			;8800
	nop			;8801
	rst 38h			;8802
	nop			;8803
	rst 38h			;8804
	nop			;8805
	jp m,000ffh		;8806
	ret nz			;8809
	ld de,0007fh		;880a
	nop			;880d
	ccf			;880e
	nop			;880f
	rst 38h			;8810
	nop			;8811
	or 0ffh			;8812
	nop			;8814
	xor 000h		;8815
	rst 38h			;8817
	nop			;8818
	ret nz			;8819
	rrca			;881a
	nop			;881b
	rst 38h			;881c
	nop			;881d
	jp m,000ffh		;881e
	rst 38h			;8821
	nop			;8822
	rst 38h			;8823
	nop			;8824
	ret p			;8825
	rlca			;8826
	nop			;8827
	rst 38h			;8828
	nop			;8829
	or 0ffh			;882a
	nop			;882c
	rst 38h			;882d
	nop			;882e
	rst 38h			;882f
	nop			;8830
	ret m			;8831
	inc bc			;8832
	nop			;8833
	rst 38h			;8834
	ld bc,lffach		;8835
	nop			;8838
	rst 38h			;8839
	nop			;883a
	rst 38h			;883b
	nop			;883c
	call m,00001h		;883d
	push af			;8840
	inc bc			;8841
	ld (hl),b		;8842
	rst 38h			;8843
	nop			;8844
	rst 38h			;8845
	nop			;8846
	rst 38h			;8847
	nop			;8848
	cp 000h			;8849
	nop			;884b
	ccf			;884c
	rrca			;884d
	ret nz			;884e
	rst 38h			;884f
	nop			;8850
	rst 38h			;8851
	nop			;8852
	rst 38h			;8853
	nop			;8854
	rst 38h			;8855
	nop			;8856
	ret nz			;8857
	nop			;8858
	ccf			;8859
	nop			;885a
	rst 38h			;885b
	nop			;885c
	rst 38h			;885d
	nop			;885e
	rst 38h			;885f
	nop			;8860
	rst 38h			;8861
	nop			;8862
	rst 38h			;8863
	nop			;8864
	rst 38h			;8865
	nop			;8866
	rst 38h			;8867
	nop			;8868
	rst 38h			;8869
	nop			;886a
	rst 38h			;886b
	nop			;886c
	rst 38h			;886d
	nop			;886e
	rst 38h			;886f
	nop			;8870
	rst 38h			;8871
	nop			;8872
	rst 38h			;8873
	nop			;8874
	rst 38h			;8875
	nop			;8876
	rst 38h			;8877
	nop			;8878
	rst 38h			;8879
	nop			;887a
	rst 38h			;887b
	nop			;887c
	rst 38h			;887d
	nop			;887e
	rst 38h			;887f
	nop			;8880
	rst 38h			;8881
	nop			;8882
	rst 38h			;8883
	nop			;8884
	rst 38h			;8885
	nop			;8886
	rst 38h			;8887
	nop			;8888
	rst 38h			;8889
	nop			;888a
	rst 38h			;888b
	nop			;888c
	inc bc			;888d
	ld b,000h		;888e
	or c			;8890
	adc a,c			;8891
	rst 38h			;8892
	nop			;8893
	rst 38h			;8894
	nop			;8895
	rst 38h			;8896
	nop			;8897
	rst 38h			;8898
	nop			;8899
	rst 38h			;889a
	nop			;889b
	rst 38h			;889c
	nop			;889d
	rst 38h			;889e
	nop			;889f
	rst 38h			;88a0
	nop			;88a1
	rst 38h			;88a2
	nop			;88a3
	rst 38h			;88a4
	nop			;88a5
	rst 38h			;88a6
	nop			;88a7
	rst 38h			;88a8
	nop			;88a9
	rst 38h			;88aa
	nop			;88ab
	rst 38h			;88ac
	nop			;88ad
	rst 38h			;88ae
	nop			;88af
	ret po			;88b0
	nop			;88b1
	ccf			;88b2
	nop			;88b3
	rst 38h			;88b4
	nop			;88b5
	rst 38h			;88b6
	nop			;88b7
	rst 38h			;88b8
	nop			;88b9
	rst 38h			;88ba
	nop			;88bb
	ret nz			;88bc
	rra			;88bd
	rrca			;88be
	ret nz			;88bf
	rst 38h			;88c0
	nop			;88c1
	rst 38h			;88c2
	nop			;88c3
	call p,sub_bf00h	;88c4
	nop			;88c7
	add a,b			;88c8
	ccf			;88c9
	rlca			;88ca
	or b			;88cb
	rst 38h			;88cc
	nop			;88cd
	ld sp,hl		;88ce
	nop			;88cf
	and b			;88d0
	dec bc			;88d1
	nop			;88d2
	ld b,b			;88d3
	nop			;88d4
	ld a,a			;88d5
	inc bc			;88d6
	ret c			;88d7
	rst 38h			;88d8
	nop			;88d9
	ret po			;88da
	ld b,000h		;88db
	ld d,l			;88dd
	nop			;88de
	cp d			;88df
	nop			;88e0
	rst 38h			;88e1
	ld bc,lffech		;88e2
	nop			;88e5
	ret nz			;88e6
	rra			;88e7
	nop			;88e8
	or l			;88e9
	nop			;88ea
	cp d			;88eb
	nop			;88ec
	rst 38h			;88ed
	ld bc,0fff4h		;88ee
	nop			;88f1
	add a,b			;88f2
	dec sp			;88f3
	nop			;88f4
	defb 0ddh,000h,07bh ;illegal sequence	;88f5
	nop			;88f8
	cp a			;88f9
	nop			;88fa
	jp pe,000ffh		;88fb
	add a,b			;88fe
	dec (hl)		;88ff
	nop			;8900
	xor e			;8901
	nop			;8902
	rst 30h			;8903
	nop			;8904
	cp a			;8905
	nop			;8906
	or 0ffh			;8907
	nop			;8909
	add a,b			;890a
	dec (hl)		;890b
	inc d			;890c
	ret nz			;890d
	nop			;890e
	rst 38h			;890f
	nop			;8910
	cp (hl)			;8911
	nop			;8912
	jp m,000ffh		;8913
	add a,b			;8916
	ccf			;8917
	ccf			;8918
	add a,b			;8919
	nop			;891a
	ccf			;891b
	nop			;891c
	cp (hl)			;891d
	nop			;891e
	or 0ffh			;891f
	nop			;8921
	ret nz			;8922
	ld de,0007fh		;8923
	ret nz			;8926
	rrca			;8927
	nop			;8928
	defb 0ddh,000h,07ah ;illegal sequence	;8929
	rst 38h			;892c
	nop			;892d
	xor 000h		;892e
	rst 38h			;8930
	nop			;8931
	ret p			;8932
	rlca			;8933
	nop			;8934
	sbc a,000h		;8935
	or 0ffh			;8937
	nop			;8939
	rst 38h			;893a
	nop			;893b
	rst 38h			;893c
	nop			;893d
	ret m			;893e
	inc bc			;893f
	nop			;8940
	rst 18h			;8941
	ld bc,0ff2ch		;8942
	nop			;8945
	rst 38h			;8946
	nop			;8947
	rst 38h			;8948
	nop			;8949
	call m,00001h		;894a
	rst 28h			;894d
	inc bc			;894e
	or b			;894f
	rst 38h			;8950
	nop			;8951
	rst 38h			;8952
	nop			;8953
	rst 38h			;8954
	nop			;8955
	ret m			;8956
	ld (bc),a		;8957
	nop			;8958
	scf			;8959
	rrca			;895a
	ld b,b			;895b
	rst 38h			;895c
	nop			;895d
	rst 38h			;895e
	nop			;895f
	rst 38h			;8960
	nop			;8961
	ret m			;8962
	inc bc			;8963
	nop			;8964
	rst 0			;8965
	rrca			;8966
	and b			;8967
	rst 38h			;8968
	nop			;8969
	rst 38h			;896a
	nop			;896b
	rst 38h			;896c
	nop			;896d
	ret m			;896e
	inc bc			;896f
	jr $+67			;8970
	inc bc			;8972
	ret nc			;8973
	rst 38h			;8974
	nop			;8975
	rst 38h			;8976
	nop			;8977
	rst 38h			;8978
	nop			;8979
	ret p			;897a
	ld b,03eh		;897b
	add a,b			;897d
	ld bc,lff6ch		;897e
	nop			;8981
	rst 38h			;8982
	nop			;8983
	ei			;8984
	nop			;8985
	nop			;8986
	dec c			;8987
	ld a,a			;8988
	nop			;8989
	add a,b			;898a
	ld a,(000dfh)		;898b
	rst 38h			;898e
	nop			;898f
	ret p			;8990
	inc b			;8991
	nop			;8992
	cp 0ffh			;8993
	nop			;8995
	ret nz			;8996
	rrca			;8997
	rrca			;8998
	jr nz,$+1		;8999
	nop			;899b
	ret m			;899c
	inc bc			;899d
	ld bc,lfff0h		;899e
	nop			;89a1
	ret p			;89a2
	inc bc			;89a3
	rra			;89a4
	ret nz			;89a5
	rst 38h			;89a6
	nop			;89a7
	call m,00f00h		;89a8
	nop			;89ab
	rst 38h			;89ac
	nop			;89ad
	call m,03f00h		;89ae
	nop			;89b1
sub_89b2h:
	ld a,(l8a63h)		;89b2
	cp 000h			;89b5
	ret nz			;89b7
	ld a,(la424h)		;89b8
	cp 002h			;89bb
	jp z,l8a8eh		;89bd
	cp 001h			;89c0
	ret z			;89c2
	call sub_8a65h		;89c3
	call sub_8a1eh		;89c6
	call sub_89dch		;89c9
	ld a,(l8aabh)		;89cc
	inc a			;89cf
	ld (l8aabh),a		;89d0
	cp 003h			;89d3
	ret nz			;89d5
	ld a,001h		;89d6
	ld (l8aabh),a		;89d8
	ret			;89db
sub_89dch:
	ld iy,l8abdh		;89dc
	ld h,044h		;89e0
	ld l,032h		;89e2
	call sub_7d67h		;89e4
	call c,sub_8a09h	;89e7
	call c,sub_a7f1h	;89ea
	ld a,0a0h		;89ed
	ld (l8aa4h),a		;89ef
	ld iy,l8aa3h		;89f2
	ld h,030h		;89f6
	ld l,032h		;89f8
	call sub_7d67h		;89fa
	call c,sub_8a09h	;89fd
	call c,sub_a7f1h	;8a00
	ld a,080h		;8a03
	ld (l8aa4h),a		;8a05
	ret			;8a08
sub_8a09h:
	call sub_a7f1h		;8a09
	ld a,(05d2bh)		;8a0c
	sub 018h		;8a0f
	ld (05d2bh),a		;8a11
	ld a,(05d3fh)		;8a14
	sub 018h		;8a17
	ld (05d3fh),a		;8a19
	scf			;8a1c
	ret			;8a1d
sub_8a1eh:
	ld iy,l8aa3h		;8a1e
	ld h,030h		;8a22
	ld l,032h		;8a24
	call sub_7d75h		;8a26
	ret nc			;8a29
	ld a,(l7831h)		;8a2a
	cp 001h			;8a2d
	ret nz			;8a2f
	ld a,(la617h)		;8a30
	ld b,a			;8a33
	inc b			;8a34
	ld a,(l8a64h)		;8a35
	add a,b			;8a38
	ld (l8a64h),a		;8a39
	and a			;8a3c
	sbc a,041h		;8a3d
	ret c			;8a3f
	ld hl,la48ch		;8a40
	ld (la422h),hl		;8a43
	ld a,001h		;8a46
	ld (la424h),a		;8a48
	ld a,000h		;8a4b
	ld (la421h),a		;8a4d
	ld de,0dd84h		;8a50
	call sub_7e07h		;8a53
	ld de,0dd92h		;8a56
	call sub_7e07h		;8a59
	ld de,ldda0h		;8a5c
	call sub_7e07h		;8a5f
	ret			;8a62
l8a63h:
	nop			;8a63
l8a64h:
	nop			;8a64
sub_8a65h:
	ld a,r			;8a65
	and 007h		;8a67
	cp 000h			;8a69
	jr z,l8a83h		;8a6b
	ld a,078h		;8a6d
	ld (l8abeh),a		;8a6f
	ld a,(l8ac5h)		;8a72
	inc a			;8a75
	ld (l8ac5h),a		;8a76
	and a			;8a79
	sbc a,003h		;8a7a
	ret c			;8a7c
	ld a,001h		;8a7d
	ld (l8ac5h),a		;8a7f
	ret			;8a82
l8a83h:
	ld a,003h		;8a83
	ld (l8ac5h),a		;8a85
	ld a,060h		;8a88
	ld (l8abeh),a		;8a8a
	ret			;8a8d
l8a8eh:
	ld a,001h		;8a8e
	ld (l8a63h),a		;8a90
	call sub_6e35h		;8a93
	call sub_6e22h		;8a96
	call sub_6dach		;8a99
	ld hl,l8ab1h		;8a9c
	ld (la653h),hl		;8a9f
	ret			;8aa2
l8aa3h:
	sbc a,b			;8aa3
l8aa4h:
	add a,b			;8aa4
	nop			;8aa5
	nop			;8aa6
	nop			;8aa7
	nop			;8aa8
	nop			;8aa9
	ld (bc),a		;8aaa
l8aabh:
	ld bc,lcd07h		;8aab
	adc a,d			;8aae
	or d			;8aaf
	adc a,h			;8ab0
l8ab1h:
	adc a,b			;8ab1
	and b			;8ab2
	nop			;8ab3
	nop			;8ab4
	nop			;8ab5
	nop			;8ab6
	nop			;8ab7
	ld bc,00701h		;8ab8
	add hl,hl		;8abb
	sub (hl)		;8abc
l8abdh:
	ld (hl),b		;8abd
l8abeh:
	ld a,b			;8abe
	nop			;8abf
	nop			;8ac0
	nop			;8ac1
	nop			;8ac2
	nop			;8ac3
	inc bc			;8ac4
l8ac5h:
	ld bc,lbd07h		;8ac5
	sub c			;8ac8
	di			;8ac9
	sub e			;8aca
	sub a			;8acb
	adc a,(hl)		;8acc
	dec b			;8acd
	ld b,000h		;8ace
	or c			;8ad0
	adc a,h			;8ad1
	rst 38h			;8ad2
	nop			;8ad3
	rst 38h			;8ad4
	nop			;8ad5
	add a,b			;8ad6
	ccf			;8ad7
	nop			;8ad8
	rst 30h			;8ad9
	nop			;8ada
	ld a,e			;8adb
	nop			;8adc
	sbc a,a			;8add
	ret m			;8ade
	nop			;8adf
	call m,00000h		;8ae0
	ld a,h			;8ae3
	nop			;8ae4
	ld a,e			;8ae5
	nop			;8ae6
	cp e			;8ae7
	nop			;8ae8
	adc a,d			;8ae9
	ret p			;8aea
	rlca			;8aeb
	jr nz,l8af1h		;8aec
	nop			;8aee
	ex (sp),hl		;8aef
	nop			;8af0
l8af1h:
	sbc a,e			;8af1
	nop			;8af2
	or c			;8af3
	nop			;8af4
	and l			;8af5
	ret nz			;8af6
	rrca			;8af7
	nop			;8af8
	rst 18h			;8af9
	nop			;8afa
	sbc a,(hl)		;8afb
	nop			;8afc
	defb 0ddh,000h,08eh ;illegal sequence	;8afd
	nop			;8b00
	or d			;8b01
	add a,b			;8b02
	ccf			;8b03
	nop			;8b04
	cp 000h			;8b05
	ld a,a			;8b07
	nop			;8b08
	and (hl)		;8b09
	nop			;8b0a
	ld a,(hl)		;8b0b
	nop			;8b0c
	or l			;8b0d
	nop			;8b0e
	ld (hl),c		;8b0f
	nop			;8b10
	defb 0fdh,000h,0feh ;illegal sequence	;8b11
	nop			;8b14
	ld d,a			;8b15
	nop			;8b16
	rst 38h			;8b17
	nop			;8b18
	halt			;8b19
	nop			;8b1a
	ld c,(hl)		;8b1b
	nop			;8b1c
	dec sp			;8b1d
	nop			;8b1e
	cp 000h			;8b1f
	sbc a,e			;8b21
	nop			;8b22
	rst 20h			;8b23
	nop			;8b24
	ld (hl),l		;8b25
	add a,b			;8b26
	ld hl,(l8700h)		;8b27
	nop			;8b2a
	call m,sub_bc00h	;8b2b
	nop			;8b2e
	dec de			;8b2f
	nop			;8b30
	or e			;8b31
	nop			;8b32
	ld (hl),e		;8b33
	nop			;8b34
	ld d,a			;8b35
	nop			;8b36
	ld sp,hl		;8b37
	nop			;8b38
	cp d			;8b39
	nop			;8b3a
	ei			;8b3b
	nop			;8b3c
	rst 8			;8b3d
	nop			;8b3e
	ld (hl),d		;8b3f
	nop			;8b40
	xor a			;8b41
	nop			;8b42
	ei			;8b43
	nop			;8b44
	ld a,000h		;8b45
	push af			;8b47
	nop			;8b48
	rst 28h			;8b49
	nop			;8b4a
	halt			;8b4b
	nop			;8b4c
	ld e,a			;8b4d
	nop			;8b4e
	jp m,03a00h		;8b4f
	nop			;8b52
	jp m,lee00h		;8b53
	nop			;8b56
	ld (hl),h		;8b57
	nop			;8b58
	cpl			;8b59
	nop			;8b5a
	jp m,05d00h		;8b5b
	nop			;8b5e
	ld a,d			;8b5f
	nop			;8b60
	xor 000h		;8b61
	ld (hl),h		;8b63
	nop			;8b64
	rra			;8b65
	nop			;8b66
	call p,sub_8d00h	;8b67
	nop			;8b6a
	ld a,d			;8b6b
	nop			;8b6c
	ld l,(hl)		;8b6d
	nop			;8b6e
	ld h,h			;8b6f
	nop			;8b70
	ccf			;8b71
	nop			;8b72
	push af			;8b73
	nop			;8b74
	ld (hl),a		;8b75
	nop			;8b76
	inc a			;8b77
	nop			;8b78
	sbc a,l			;8b79
	nop			;8b7a
	ld (hl),h		;8b7b
	nop			;8b7c
	rra			;8b7d
	nop			;8b7e
	call pe,leb00h		;8b7f
	nop			;8b82
	ld e,d			;8b83
	nop			;8b84
	ld a,(hl)		;8b85
	add a,b			;8b86
	inc (hl)		;8b87
	nop			;8b88
	rra			;8b89
	nop			;8b8a
	jp pe,leb00h		;8b8b
	nop			;8b8e
	ld b,000h		;8b8f
	cp 080h			;8b91
	inc (hl)		;8b93
	nop			;8b94
	rra			;8b95
	nop			;8b96
	jp (hl)			;8b97
	nop			;8b98
	jp pe,06200h		;8b99
	nop			;8b9c
	ld a,(hl)		;8b9d
	add a,b			;8b9e
	inc a			;8b9f
	nop			;8ba0
	rra			;8ba1
	nop			;8ba2
	ld sp,hl		;8ba3
	nop			;8ba4
	call pe,0d800h		;8ba5
	nop			;8ba8
	cp a			;8ba9
	ret nz			;8baa
	jr l8badh		;8bab
l8badh:
	rrca			;8bad
	nop			;8bae
	push de			;8baf
	nop			;8bb0
	call p,0e900h		;8bb1
	nop			;8bb4
	rra			;8bb5
	ret nz			;8bb6
	ld d,000h		;8bb7
	rrca			;8bb9
	nop			;8bba
	out (000h),a		;8bbb
	or 000h			;8bbd
	call pe,l8700h		;8bbf
	ret po			;8bc2
	ld c,000h		;8bc3
	rrca			;8bc5
	nop			;8bc6
	push de			;8bc7
	nop			;8bc8
	push af			;8bc9
	nop			;8bca
	or 000h			;8bcb
	ld d,b			;8bcd
	ret nz			;8bce
	dec de			;8bcf
	nop			;8bd0
	rlca			;8bd1
	nop			;8bd2
	out (000h),a		;8bd3
	push af			;8bd5
	nop			;8bd6
	di			;8bd7
	nop			;8bd8
	xor d			;8bd9
	ret nz			;8bda
	dec e			;8bdb
	nop			;8bdc
	rlca			;8bdd
	nop			;8bde
	push hl			;8bdf
	nop			;8be0
	push af			;8be1
	nop			;8be2
	ret m			;8be3
	nop			;8be4
	push bc			;8be5
	ret nz			;8be6
	dec e			;8be7
	nop			;8be8
	inc bc			;8be9
	nop			;8bea
	ex de,hl		;8beb
	nop			;8bec
	push af			;8bed
	nop			;8bee
	call m,03200h		;8bef
	add a,b			;8bf2
	dec a			;8bf3
	nop			;8bf4
	ld de,le500h		;8bf5
	nop			;8bf8
	push af			;8bf9
	nop			;8bfa
	rst 38h			;8bfb
	nop			;8bfc
	adc a,c			;8bfd
	add a,b			;8bfe
	ld a,(03000h)		;8bff
	nop			;8c02
	dec bc			;8c03
	nop			;8c04
	or 000h			;8c05
	rst 38h			;8c07
	nop			;8c08
	call po,03a80h		;8c09
	nop			;8c0c
	ld l,c			;8c0d
	nop			;8c0e
	dec (hl)		;8c0f
	nop			;8c10
	jp p,sub_feffh+1	;8c11
	nop			;8c14
	jp p,07a00h		;8c15
	nop			;8c18
	ld l,d			;8c19
	nop			;8c1a
	cp e			;8c1b
	nop			;8c1c
	ei			;8c1d
	nop			;8c1e
	ld a,a			;8c1f
	nop			;8c20
	jp m,07a00h		;8c21
	nop			;8c24
	jp (hl)			;8c25
	nop			;8c26
	ld (hl),l		;8c27
	nop			;8c28
	defb 0fdh,000h,07fh ;illegal sequence	;8c29
	nop			;8c2c
	or 000h			;8c2d
	ld a,d			;8c2f
	nop			;8c30
	jp pe,lf600h		;8c31
	nop			;8c34
	defb 0fdh,000h,0bfh ;illegal sequence	;8c35
	nop			;8c38
	defb 0fdh,000h,07eh ;illegal sequence	;8c39
	nop			;8c3c
	call pe,lfa00h		;8c3d
	nop			;8c40
	cp 000h			;8c41
	cp a			;8c43
	nop			;8c44
	ex (sp),hl		;8c45
	add a,b			;8c46
	dec a			;8c47
	nop			;8c48
	push af			;8c49
	nop			;8c4a
	ei			;8c4b
	nop			;8c4c
	ccf			;8c4d
	nop			;8c4e
	jp ldf00h		;8c4f
	nop			;8c52
	ld b,b			;8c53
	nop			;8c54
	dec e			;8c55
	nop			;8c56
	ret po			;8c57
	nop			;8c58
	ld e,000h		;8c59
	inc a			;8c5b
	nop			;8c5c
	ld a,000h		;8c5d
	ld a,a			;8c5f
	nop			;8c60
	ret po			;8c61
	nop			;8c62
	rra			;8c63
	nop			;8c64
	pop hl			;8c65
	nop			;8c66
	rst 38h			;8c67
	nop			;8c68
	defb 0fdh,080h,037h ;illegal sequence	;8c69
	nop			;8c6c
	ld a,a			;8c6d
	nop			;8c6e
	rst 38h			;8c6f
	nop			;8c70
	rst 38h			;8c71
	nop			;8c72
	rst 38h			;8c73
	nop			;8c74
	ei			;8c75
	ret nz			;8c76
	inc e			;8c77
	nop			;8c78
	or a			;8c79
	nop			;8c7a
	rst 30h			;8c7b
	nop			;8c7c
	rst 38h			;8c7d
	nop			;8c7e
	ret nz			;8c7f
	nop			;8c80
	ld a,e			;8c81
	ex (sp),hl		;8c82
	ex af,af'		;8c83
	ld b,b			;8c84
	ex af,af'		;8c85
	nop			;8c86
	dec bc			;8c87
	nop			;8c88
	rst 18h			;8c89
	nop			;8c8a
	ld a,a			;8c8b
	nop			;8c8c
	sbc a,l			;8c8d
	rst 30h			;8c8e
	nop			;8c8f
	rst 30h			;8c90
	nop			;8c91
	nop			;8c92
	ld a,l			;8c93
	nop			;8c94
	xor d			;8c95
	nop			;8c96
	xor e			;8c97
	nop			;8c98
	defb 0edh ;next byte illegal after ed	;8c99
	rst 38h			;8c9a
	nop			;8c9b
	rst 38h			;8c9c
	nop			;8c9d
	add a,b			;8c9e
	ld c,000h		;8c9f
	push de			;8ca1
	nop			;8ca2
	ld d,l			;8ca3
	nop			;8ca4
	halt			;8ca5
	rst 38h			;8ca6
	nop			;8ca7
	rst 38h			;8ca8
	nop			;8ca9
	pop af			;8caa
	nop			;8cab
	ld hl,(0aa00h)		;8cac
	nop			;8caf
	adc a,c			;8cb0
	nop			;8cb1
	dec b			;8cb2
	ld b,000h		;8cb3
	sub (hl)		;8cb5
	adc a,(hl)		;8cb6
	rst 38h			;8cb7
	nop			;8cb8
	rst 38h			;8cb9
	nop			;8cba
	ret nz			;8cbb
	rlca			;8cbc
	nop			;8cbd
	rst 28h			;8cbe
	nop			;8cbf
	ld a,e			;8cc0
	nop			;8cc1
	sbc a,a			;8cc2
	rst 38h			;8cc3
	nop			;8cc4
	rst 38h			;8cc5
	nop			;8cc6
	add a,b			;8cc7
	inc a			;8cc8
	nop			;8cc9
	ld (hl),a		;8cca
	nop			;8ccb
	cp e			;8ccc
	nop			;8ccd
	adc a,d			;8cce
	rst 38h			;8ccf
	nop			;8cd0
	ret p			;8cd1
	nop			;8cd2
	nop			;8cd3
	ld h,e			;8cd4
	nop			;8cd5
	cp e			;8cd6
	nop			;8cd7
	cp l			;8cd8
	nop			;8cd9
	and l			;8cda
	rst 38h			;8cdb
	nop			;8cdc
	ret po			;8cdd
	rrca			;8cde
	nop			;8cdf
	sbc a,a			;8ce0
	nop			;8ce1
	defb 0ddh,000h,0ddh ;illegal sequence	;8ce2
	nop			;8ce5
	or d			;8ce6
	rst 38h			;8ce7
	nop			;8ce8
	ret nz			;8ce9
	rra			;8cea
	nop			;8ceb
	ret p			;8cec
	nop			;8ced
	xor 000h		;8cee
	adc a,000h		;8cf0
	or l			;8cf2
	rst 38h			;8cf3
	nop			;8cf4
	add a,b			;8cf5
	inc a			;8cf6
	nop			;8cf7
	rrca			;8cf8
	nop			;8cf9
	halt			;8cfa
	nop			;8cfb
	xor 000h		;8cfc
	or 0feh			;8cfe
sub_8d00h:
	nop			;8d00
	nop			;8d01
	dec sp			;8d02
	nop			;8d03
	rst 38h			;8d04
	nop			;8d05
	ld a,d			;8d06
	nop			;8d07
	and 000h		;8d08
	ld (hl),l		;8d0a
	call m,00001h		;8d0b
	rst 30h			;8d0e
	nop			;8d0f
	call m,sub_bc00h	;8d10
	nop			;8d13
	ld h,c			;8d14
	nop			;8d15
	inc sp			;8d16
	ret m			;8d17
	inc bc			;8d18
	nop			;8d19
	rst 30h			;8d1a
	nop			;8d1b
	ld sp,hl		;8d1c
	nop			;8d1d
	sbc a,a			;8d1e
	nop			;8d1f
	sbc a,a			;8d20
	nop			;8d21
	rst 8			;8d22
	ret p			;8d23
	rlca			;8d24
	nop			;8d25
	rst 28h			;8d26
	nop			;8d27
	ei			;8d28
	nop			;8d29
	ld c,a			;8d2a
	nop			;8d2b
	cp 000h			;8d2c
	rst 28h			;8d2e
	ret po			;8d2f
	rrca			;8d30
	nop			;8d31
	rst 18h			;8d32
	nop			;8d33
	jp m,lb700h		;8d34
	nop			;8d37
	cp 000h			;8d38
	xor 0e0h		;8d3a
	ld c,000h		;8d3c
	rst 8			;8d3e
	nop			;8d3f
	jp m,01800h		;8d40
	nop			;8d43
	ld a,b			;8d44
	nop			;8d45
	xor 0c0h		;8d46
	ld e,000h		;8d48
	cp a			;8d4a
	nop			;8d4b
	call p,sub_a700h	;8d4c
	nop			;8d4f
	add a,(hl)		;8d50
	nop			;8d51
	ld l,(hl)		;8d52
	add a,b			;8d53
	dec sp			;8d54
	nop			;8d55
	sbc a,a			;8d56
	nop			;8d57
	push af			;8d58
	nop			;8d59
	ld a,(de)		;8d5a
	nop			;8d5b
	call m,l9d00h		;8d5c
	add a,b			;8d5f
	ld (hl),000h		;8d60
	rst 18h			;8d62
	nop			;8d63
	call pe,sub_b500h	;8d64
	nop			;8d67
	ld (hl),c		;8d68
	nop			;8d69
	ld a,(hl)		;8d6a
	add a,b			;8d6b
	ld l,000h		;8d6c
	rst 18h			;8d6e
	nop			;8d6f
	jp (hl)			;8d70
	nop			;8d71
	ld (hl),h		;8d72
	nop			;8d73
	ld l,h			;8d74
	nop			;8d75
	cp 0c0h			;8d76
	ld c,000h		;8d78
	ld e,a			;8d7a
	nop			;8d7b
	jp pe,07a00h		;8d7c
	nop			;8d7f
	xor 000h		;8d80
	cp 0e0h			;8d82
	rrca			;8d84
	nop			;8d85
	ld e,a			;8d86
	nop			;8d87
	ret m			;8d88
	nop			;8d89
	ei			;8d8a
	nop			;8d8b
	ld e,d			;8d8c
	nop			;8d8d
	rst 38h			;8d8e
	ret p			;8d8f
	rlca			;8d90
	nop			;8d91
	ld l,a			;8d92
	nop			;8d93
	jp nc,lfa00h		;8d94
	nop			;8d97
	sbc a,e			;8d98
	nop			;8d99
	ld a,a			;8d9a
	ret m			;8d9b
	inc bc			;8d9c
	nop			;8d9d
	cpl			;8d9e
	nop			;8d9f
	call nc,lfa00h		;8da0
	nop			;8da3
	ld e,l			;8da4
	nop			;8da5
	ld (hl),a		;8da6
	ret m			;8da7
	inc bc			;8da8
	nop			;8da9
	and e			;8daa
	nop			;8dab
	jp nc,lf500h		;8dac
	nop			;8daf
	sbc a,(hl)		;8db0
	nop			;8db1
	cp (hl)			;8db2
	ret p			;8db3
	ld b,000h		;8db4
	xor c			;8db6
	nop			;8db7
	ret nc			;8db8
	nop			;8db9
	push af			;8dba
	nop			;8dbb
	ld e,a			;8dbc
	nop			;8dbd
	ld e,(hl)		;8dbe
	ret po			;8dbf
	dec c			;8dc0
	nop			;8dc1
	push de			;8dc2
	nop			;8dc3
	and 000h		;8dc4
	jp m,03f00h		;8dc6
	nop			;8dc9
	xor (hl)		;8dca
	ret po			;8dcb
	dec c			;8dcc
	nop			;8dcd
	dec d			;8dce
	nop			;8dcf
	xor 000h		;8dd0
	jp m,09f00h		;8dd2
	nop			;8dd5
	jp nc,00de0h		;8dd6
	nop			;8dd9
	dec d			;8dda
	nop			;8ddb
	call pe,lfa00h		;8ddc
	nop			;8ddf
	rst 18h			;8de0
	nop			;8de1
	ret pe			;8de2
	ret nz			;8de3
	dec e			;8de4
	nop			;8de5
	inc (hl)		;8de6
	nop			;8de7
	ld e,l			;8de8
	nop			;8de9
	jp m,lef00h		;8dea
	nop			;8ded
	push af			;8dee
	ret nz			;8def
	dec e			;8df0
	nop			;8df1
	ld l,l			;8df2
	nop			;8df3
	dec a			;8df4
	nop			;8df5
	jp m,lef00h		;8df6
	nop			;8df9
	jp m,01dc0h		;8dfa
	nop			;8dfd
	ld l,(hl)		;8dfe
	nop			;8dff
	cp l			;8e00
	nop			;8e01
	ei			;8e02
	nop			;8e03
	ld (hl),a		;8e04
	nop			;8e05
	jp m,02280h		;8e06
	nop			;8e09
	xor l			;8e0a
	nop			;8e0b
	ld a,l			;8e0c
	nop			;8e0d
	defb 0fdh,000h,073h ;illegal sequence	;8e0e
	nop			;8e11
	cp 080h			;8e12
	jr c,l8e16h		;8e14
l8e16h:
	sub (hl)		;8e16
	nop			;8e17
	jp m,lc200h		;8e18
	nop			;8e1b
	xor c			;8e1c
	nop			;8e1d
	dec e			;8e1e
	ret nz			;8e1f
l8e20h:
	rra			;8e20
	nop			;8e21
	ld sp,hl		;8e22
	nop			;8e23
	jp m,09f00h		;8e24
	nop			;8e27
	or 000h			;8e28
	ei			;8e2a
	ret nz			;8e2b
	rla			;8e2c
	nop			;8e2d
	cp 000h			;8e2e
	dec sp			;8e30
	nop			;8e31
	ccf			;8e32
	nop			;8e33
	ei			;8e34
	nop			;8e35
	rst 38h			;8e36
	ret po			;8e37
	add hl,bc		;8e38
	nop			;8e39
	rst 38h			;8e3a
	nop			;8e3b
	call nc,sub_feffh+1	;8e3c
	nop			;8e3f
	rst 38h			;8e40
	nop			;8e41
	cp 0f6h			;8e42
	nop			;8e44
	nop			;8e45
	cp a			;8e46
	nop			;8e47
	rst 38h			;8e48
	nop			;8e49
	rst 38h			;8e4a
	nop			;8e4b
	rst 38h			;8e4c
	nop			;8e4d
	defb 0fdh,0ffh,000h ;illegal sequence	;8e4e
	nop			;8e51
	ld d,a			;8e52
	nop			;8e53
	rst 38h			;8e54
	nop			;8e55
	rst 38h			;8e56
	nop			;8e57
	pop bc			;8e58
	nop			;8e59
	ei			;8e5a
	rst 38h			;8e5b
	nop			;8e5c
	and b			;8e5d
	ex af,af'		;8e5e
	nop			;8e5f
	scf			;8e60
	nop			;8e61
	defb 0fdh,000h,0feh ;illegal sequence	;8e62
	nop			;8e65
	ld a,e			;8e66
	rst 38h			;8e67
	nop			;8e68
	rst 30h			;8e69
	nop			;8e6a
	ret z			;8e6b
	inc bc			;8e6c
	nop			;8e6d
	sbc a,000h		;8e6e
	rrca			;8e70
	nop			;8e71
	sbc a,l			;8e72
	rst 38h			;8e73
	nop			;8e74
	rst 38h			;8e75
	nop			;8e76
	call m,02100h		;8e77
	nop			;8e7a
	ret p			;8e7b
	ld bc,led00h		;8e7c
	rst 38h			;8e7f
	nop			;8e80
	rst 38h			;8e81
	nop			;8e82
	rst 38h			;8e83
	nop			;8e84
	rst 38h			;8e85
	nop			;8e86
	cp 000h			;8e87
	nop			;8e89
	ld (hl),0ffh		;8e8a
	nop			;8e8c
	rst 38h			;8e8d
	nop			;8e8e
	rst 38h			;8e8f
	nop			;8e90
	rst 38h			;8e91
	nop			;8e92
	rst 38h			;8e93
	nop			;8e94
	add hl,bc		;8e95
	nop			;8e96
	dec b			;8e97
	ld a,(bc)		;8e98
	nop			;8e99
	cp e			;8e9a
	sub c			;8e9b
	rst 38h			;8e9c
	nop			;8e9d
	rst 38h			;8e9e
	nop			;8e9f
	rst 38h			;8ea0
	nop			;8ea1
	rst 38h			;8ea2
	nop			;8ea3
	rst 38h			;8ea4
	nop			;8ea5
	rst 38h			;8ea6
	nop			;8ea7
	rst 38h			;8ea8
	nop			;8ea9
	rst 38h			;8eaa
	nop			;8eab
	rst 38h			;8eac
	nop			;8ead
	rst 38h			;8eae
	nop			;8eaf
	rst 38h			;8eb0
	nop			;8eb1
	rst 38h			;8eb2
	nop			;8eb3
	rst 38h			;8eb4
	nop			;8eb5
	rst 38h			;8eb6
	nop			;8eb7
	rst 38h			;8eb8
	nop			;8eb9
	rst 38h			;8eba
	nop			;8ebb
	rst 38h			;8ebc
	nop			;8ebd
	rst 38h			;8ebe
	nop			;8ebf
	rst 38h			;8ec0
	nop			;8ec1
	rst 38h			;8ec2
	nop			;8ec3
	rst 38h			;8ec4
	nop			;8ec5
	rst 38h			;8ec6
	nop			;8ec7
	rst 38h			;8ec8
	nop			;8ec9
	rst 38h			;8eca
	nop			;8ecb
	rst 38h			;8ecc
	nop			;8ecd
	rst 38h			;8ece
	nop			;8ecf
	ei			;8ed0
	nop			;8ed1
	rst 38h			;8ed2
	nop			;8ed3
	rst 38h			;8ed4
	nop			;8ed5
	rst 38h			;8ed6
	nop			;8ed7
	rst 38h			;8ed8
	nop			;8ed9
	rst 38h			;8eda
	nop			;8edb
	rst 38h			;8edc
	nop			;8edd
	rst 38h			;8ede
	nop			;8edf
	rst 38h			;8ee0
	nop			;8ee1
	rst 38h			;8ee2
	nop			;8ee3
	pop hl			;8ee4
	inc b			;8ee5
	rst 38h			;8ee6
	nop			;8ee7
	rst 38h			;8ee8
	nop			;8ee9
	rst 38h			;8eea
	nop			;8eeb
	rst 38h			;8eec
	nop			;8eed
	rst 38h			;8eee
	nop			;8eef
	rst 38h			;8ef0
	nop			;8ef1
	rst 38h			;8ef2
	nop			;8ef3
	rst 38h			;8ef4
	nop			;8ef5
	rst 38h			;8ef6
	nop			;8ef7
	nop			;8ef8
	ld a,(de)		;8ef9
	rst 38h			;8efa
	nop			;8efb
	rst 38h			;8efc
	nop			;8efd
	rst 38h			;8efe
	nop			;8eff
	rst 38h			;8f00
	nop			;8f01
	rst 38h			;8f02
	nop			;8f03
	rst 38h			;8f04
	nop			;8f05
	rst 38h			;8f06
	nop			;8f07
	rst 38h			;8f08
	nop			;8f09
	ret po			;8f0a
	nop			;8f0b
	nop			;8f0c
	rst 38h			;8f0d
	ccf			;8f0e
	nop			;8f0f
	rst 38h			;8f10
	nop			;8f11
	rst 38h			;8f12
	nop			;8f13
	rst 38h			;8f14
	nop			;8f15
	rst 38h			;8f16
	nop			;8f17
	rst 38h			;8f18
	nop			;8f19
	rst 38h			;8f1a
	nop			;8f1b
	call m,00000h		;8f1c
l8f1fh:
	rra			;8f1f
	nop			;8f20
	rst 38h			;8f21
	rra			;8f22
	ret nz			;8f23
	rst 38h			;8f24
	nop			;8f25
	rst 38h			;8f26
	nop			;8f27
	rst 38h			;8f28
	nop			;8f29
	rst 38h			;8f2a
	nop			;8f2b
	rst 38h			;8f2c
	nop			;8f2d
	rst 38h			;8f2e
	nop			;8f2f
	ret p			;8f30
	inc bc			;8f31
	nop			;8f32
	rst 38h			;8f33
	nop			;8f34
	di			;8f35
	rrca			;8f36
	ret po			;8f37
	rst 38h			;8f38
	nop			;8f39
	rst 38h			;8f3a
	nop			;8f3b
	rst 38h			;8f3c
	nop			;8f3d
	rst 38h			;8f3e
	nop			;8f3f
	rst 38h			;8f40
	nop			;8f41
	ret po			;8f42
	nop			;8f43
l8f44h:
	ret nz			;8f44
	rrca			;8f45
l8f46h:
	nop			;8f46
	call m,0600ch		;8f47
	rlca			;8f4a
	ld (hl),b		;8f4b
	rst 38h			;8f4c
	nop			;8f4d
	rst 38h			;8f4e
	nop			;8f4f
	rst 38h			;8f50
	nop			;8f51
	rst 38h			;8f52
	nop			;8f53
	cp 000h			;8f54
	nop			;8f56
	rra			;8f57
	nop			;8f58
	ccf			;8f59
	nop			;8f5a
	add a,b			;8f5b
	rlca			;8f5c
	or b			;8f5d
	add a,a			;8f5e
	jr nc,$+1		;8f5f
	nop			;8f61
	rst 38h			;8f62
	nop			;8f63
	rst 38h			;8f64
	nop			;8f65
	rst 38h			;8f66
	nop			;8f67
	ex af,af'		;8f68
	ld bc,lea00h		;8f69
	nop			;8f6c
	sbc a,07eh		;8f6d
l8f6fh:
	nop			;8f6f
	inc bc			;8f70
	ret nc			;8f71
	add a,e			;8f72
	jr nc,$+1		;8f73
	nop			;8f75
	rst 38h			;8f76
	nop			;8f77
	rst 38h			;8f78
	nop			;8f79
	ret m			;8f7a
	nop			;8f7b
	nop			;8f7c
	or 000h			;8f7d
	dec d			;8f7f
	ld bc,lffech		;8f80
	nop			;8f83
	inc bc			;8f84
	ld l,b			;8f85
	add a,e			;8f86
	jr c,$+1		;8f87
	nop			;8f89
	rst 38h			;8f8a
	nop			;8f8b
	rst 38h			;8f8c
	nop			;8f8d
	ret po			;8f8e
	rlca			;8f8f
	nop			;8f90
	ld c,e			;8f91
	nop			;8f92
	dec hl			;8f93
	ld bc,lff74h		;8f94
	nop			;8f97
	inc bc			;8f98
	ld l,b			;8f99
	add a,d			;8f9a
	jr c,$+1		;8f9b
	nop			;8f9d
	rst 38h			;8f9e
	nop			;8f9f
	rst 38h			;8fa0
	nop			;8fa1
	ld b,b			;8fa2
l8fa3h:
	ld a,(de)		;8fa3
	nop			;8fa4
	ld a,000h		;8fa5
l8fa7h:
	inc b			;8fa7
	inc bc			;8fa8
	ret c			;8fa9
	rst 8			;8faa
	nop			;8fab
	add a,e			;8fac
	jr c,l8f6fh		;8fad
	dec e			;8faf
	ld a,a			;8fb0
	nop			;8fb1
	rst 38h			;8fb2
	nop			;8fb3
	call m,00000h		;8fb4
	and c			;8fb7
	nop			;8fb8
	ld a,h			;8fb9
	nop			;8fba
	pop af			;8fbb
	inc bc			;8fbc
	jr z,l8f46h		;8fbd
	jr nc,$-119		;8fbf
	jr nc,l8fa3h		;8fc1
	ld c,03fh		;8fc3
	add a,b			;8fc5
	rst 38h			;8fc6
	nop			;8fc7
	ret m			;8fc8
	inc bc			;8fc9
	nop			;8fca
	jp nz,lfb00h		;8fcb
	nop			;8fce
	ret m			;8fcf
	inc bc			;8fd0
	ld e,b			;8fd1
	inc bc			;8fd2
	ld c,b			;8fd3
	rrca			;8fd4
	ld h,b			;8fd5
	ret p			;8fd6
	rlca			;8fd7
	rra			;8fd8
	ret nz			;8fd9
	rst 38h			;8fda
	nop			;8fdb
	ret p			;8fdc
	ld b,000h		;8fdd
	add hl,hl		;8fdf
l8fe0h:
	nop			;8fe0
	rst 38h			;8fe1
	nop			;8fe2
	ret nz			;8fe3
	rlca			;8fe4
	or b			;8fe5
	inc bc			;8fe6
	ld c,b			;8fe7
	sbc a,a			;8fe8
	nop			;8fe9
	ret m			;8fea
	nop			;8feb
	rrca			;8fec
	ret po			;8fed
	rst 38h			;8fee
	nop			;8fef
	ret po			;8ff0
	dec c			;8ff1
	nop			;8ff2
	sbc a,e			;8ff3
	nop			;8ff4
	cp 000h			;8ff5
	ld e,005h		;8ff7
	ld d,b			;8ff9
	add a,c			;8ffa
	inc h			;8ffb
	rst 38h			;8ffc
	nop			;8ffd
	rst 38h			;8ffe
	nop			;8fff
l9000h:
	rrca			;9000
	ld h,b			;9001
	rst 38h			;9002
	nop			;9003
	ret nz			;9004
	rra			;9005
	nop			;9006
	ld a,e			;9007
	nop			;9008
	ld sp,hl		;9009
	nop			;900a
	cp h			;900b
	nop			;900c
	jr nc,l8fe0h		;900d
	inc b			;900f
	rst 38h			;9010
	nop			;9011
	rst 38h			;9012
	nop			;9013
	rlca			;9014
	ld (hl),b		;9015
	rst 38h			;9016
	nop			;9017
	ret nz			;9018
	rra			;9019
	nop			;901a
	rst 20h			;901b
	nop			;901c
	rst 38h			;901d
	nop			;901e
	ld a,c			;901f
	nop			;9020
	ld l,a			;9021
	ld hl,0ff04h		;9022
	nop			;9025
	rst 38h			;9026
	nop			;9027
	add a,a			;9028
	jr nc,$+1		;9029
	nop			;902b
	add a,b			;902c
	ccf			;902d
	nop			;902e
	rst 0			;902f
	nop			;9030
	rst 20h			;9031
	nop			;9032
	ret p			;9033
	nop			;9034
	xor a			;9035
	inc bc			;9036
	ret c			;9037
	rst 38h			;9038
	nop			;9039
	rst 38h			;903a
	nop			;903b
	add a,a			;903c
	jr nc,$+1		;903d
	nop			;903f
	add a,b			;9040
	ccf			;9041
	nop			;9042
	rst 30h			;9043
	nop			;9044
	in a,(000h)		;9045
	call nz,06100h		;9047
	rlca			;904a
	ret po			;904b
	cp 000h			;904c
	rst 38h			;904e
	nop			;904f
	add a,c			;9050
	jr nc,$+1		;9051
	nop			;9053
	add a,b			;9054
	ld sp,lf700h		;9055
	nop			;9058
	cp e			;9059
	nop			;905a
	xor (hl)		;905b
	ld c,020h		;905c
	rrca			;905e
	ret po			;905f
	ret m			;9060
	ld bc,0007fh		;9061
	nop			;9064
	ld l,(hl)		;9065
	rst 38h			;9066
	nop			;9067
	add a,b			;9068
	ld (hl),000h		;9069
	rst 30h			;906b
	nop			;906c
	ld a,e			;906d
	nop			;906e
	rst 28h			;906f
	rra			;9070
	ld b,b			;9071
	rrca			;9072
	ld h,b			;9073
	ret po			;9074
	ld b,01fh		;9075
	add a,b			;9077
	nop			;9078
	ld (hl),c		;9079
	ld a,a			;907a
	nop			;907b
	add a,b			;907c
	scf			;907d
	nop			;907e
	ld a,e			;907f
	nop			;9080
	ld (hl),a		;9081
	nop			;9082
	sbc a,01fh		;9083
	ret nz			;9085
	rrca			;9086
	ld h,b			;9087
	ret nz			;9088
	rra			;9089
	ld c,0e0h		;908a
	ld c,0e0h		;908c
	ccf			;908e
	add a,b			;908f
	ret nz			;9090
	dec de			;9091
	nop			;9092
	ld a,e			;9093
	nop			;9094
	xor a			;9095
	nop			;9096
	call m,l803fh		;9097
	add a,e			;909a
	jr nc,l909dh		;909b
l909dh:
	dec a			;909d
	ld b,0f0h		;909e
	inc c			;90a0
	ret po			;90a1
	ccf			;90a2
	add a,b			;90a3
	ret nz			;90a4
	dec e			;90a5
	nop			;90a6
	ld l,l			;90a7
	nop			;90a8
	sbc a,a			;90a9
	nop			;90aa
	ei			;90ab
	ld a,a			;90ac
	nop			;90ad
	add a,b			;90ae
	inc a			;90af
	ld (bc),a		;90b0
	ret p			;90b1
	nop			;90b2
	ld a,c			;90b3
	ex af,af'		;90b4
	ld h,d			;90b5
	ccf			;90b6
	add a,b			;90b7
	ret po			;90b8
	ld c,000h		;90b9
	jp p,sub_feffh+1	;90bb
	nop			;90be
	call m,000ffh		;90bf
	ret nz			;90c2
	rra			;90c3
	rrca			;90c4
	ret po			;90c5
	add a,b			;90c6
	jr c,l90cdh		;90c7
	pop af			;90c9
	ld a,a			;90ca
	nop			;90cb
	ret p			;90cc
l90cdh:
	rlca			;90cd
	nop			;90ce
	ld sp,hl		;90cf
	nop			;90d0
	ld a,a			;90d1
	inc bc			;90d2
	ret p			;90d3
	rst 38h			;90d4
	nop			;90d5
	ret po			;90d6
	ld b,01fh		;90d7
	add a,b			;90d9
	pop bc			;90da
	inc e			;90db
	ld (bc),a		;90dc
	ld (hl),b		;90dd
	rst 38h			;90de
	nop			;90df
	ret m			;90e0
	inc bc			;90e1
	nop			;90e2
	cp 080h			;90e3
	ccf			;90e5
	rrca			;90e6
	ret po			;90e7
	rst 38h			;90e8
	nop			;90e9
	ret m			;90ea
	ld bc,0007fh		;90eb
	pop bc			;90ee
	inc e			;90ef
	nop			;90f0
	ld a,h			;90f1
	rst 38h			;90f2
	nop			;90f3
	call m,00100h		;90f4
	ret m			;90f7
	ret nz			;90f8
	rrca			;90f9
	rra			;90fa
	add a,b			;90fb
	rst 38h			;90fc
	nop			;90fd
	cp 000h			;90fe
	call m,06100h		;9100
	inc c			;9103
	add a,b			;9104
	ccf			;9105
	ld a,a			;9106
	nop			;9107
	rst 38h			;9108
	nop			;9109
	rlca			;910a
	nop			;910b
	ret p			;910c
	nop			;910d
	ld a,a			;910e
	nop			;910f
	rst 38h			;9110
	nop			;9111
	rst 38h			;9112
	nop			;9113
	ret m			;9114
	inc bc			;9115
	nop			;9116
	adc a,(hl)		;9117
	ret nz			;9118
	rrca			;9119
	ld a,a			;911a
	nop			;911b
	rst 38h			;911c
	nop			;911d
	rst 38h			;911e
	nop			;911f
	rst 38h			;9120
	nop			;9121
	rst 38h			;9122
	nop			;9123
	rst 38h			;9124
	nop			;9125
	rst 38h			;9126
	nop			;9127
	ret p			;9128
	inc b			;9129
	nop			;912a
	and 0f0h		;912b
	rlca			;912d
	ld e,a			;912e
	nop			;912f
	rst 38h			;9130
	nop			;9131
	rst 38h			;9132
	nop			;9133
	rst 38h			;9134
	nop			;9135
	rst 38h			;9136
	nop			;9137
	rst 38h			;9138
	nop			;9139
	rst 38h			;913a
	nop			;913b
	ret po			;913c
	ex af,af'		;913d
	nop			;913e
	ld a,0f8h		;913f
	inc bc			;9141
	rlca			;9142
	and b			;9143
	rst 38h			;9144
	nop			;9145
	rst 38h			;9146
	nop			;9147
	rst 38h			;9148
	nop			;9149
	rst 38h			;914a
	nop			;914b
	rst 38h			;914c
	nop			;914d
	rst 38h			;914e
	nop			;914f
	ret po			;9150
	ld a,(bc)		;9151
	pop bc			;9152
	inc c			;9153
	add a,b			;9154
	inc bc			;9155
	ld bc,lffd8h		;9156
	nop			;9159
	rst 38h			;915a
	nop			;915b
	rst 38h			;915c
	nop			;915d
	rst 38h			;915e
	nop			;915f
	rst 38h			;9160
	nop			;9161
	rst 38h			;9162
	nop			;9163
	pop af			;9164
	inc b			;9165
	ret nz			;9166
	inc e			;9167
	nop			;9168
	ld a,l			;9169
	nop			;916a
	xor 0ffh		;916b
	nop			;916d
	rst 38h			;916e
	nop			;916f
	rst 38h			;9170
	nop			;9171
	rst 38h			;9172
	nop			;9173
	rst 38h			;9174
	nop			;9175
	rst 38h			;9176
	nop			;9177
	ei			;9178
	nop			;9179
	add a,b			;917a
	ld sp,le600h		;917b
	nop			;917e
	rst 30h			;917f
	rst 38h			;9180
	nop			;9181
	rst 38h			;9182
	nop			;9183
	rst 38h			;9184
	nop			;9185
	rst 38h			;9186
	nop			;9187
	rst 38h			;9188
	nop			;9189
	rst 38h			;918a
	nop			;918b
	rst 38h			;918c
	nop			;918d
	nop			;918e
	ld c,a			;918f
	nop			;9190
	sbc a,c			;9191
	nop			;9192
	rrca			;9193
	rst 38h			;9194
	nop			;9195
	rst 38h			;9196
	nop			;9197
	rst 38h			;9198
	nop			;9199
	rst 38h			;919a
	nop			;919b
	rst 38h			;919c
	nop			;919d
	rst 38h			;919e
	nop			;919f
	ret m			;91a0
	nop			;91a1
	nop			;91a2
	cp l			;91a3
	nop			;91a4
	xor 000h		;91a5
	rst 38h			;91a7
	rst 38h			;91a8
	nop			;91a9
	rst 38h			;91aa
	nop			;91ab
	rst 38h			;91ac
	nop			;91ad
	rst 38h			;91ae
	nop			;91af
	rst 38h			;91b0
	nop			;91b1
	rst 38h			;91b2
	nop			;91b3
	ret p			;91b4
	rlca			;91b5
	nop			;91b6
	cp 000h			;91b7
	rst 30h			;91b9
	nop			;91ba
	ld h,b			;91bb
	nop			;91bc
	dec b			;91bd
	rlca			;91be
	nop			;91bf
	pop af			;91c0
	sub e			;91c1
	rst 38h			;91c2
	nop			;91c3
	rst 38h			;91c4
	nop			;91c5
	rst 38h			;91c6
	nop			;91c7
	rst 38h			;91c8
	nop			;91c9
	rst 38h			;91ca
	nop			;91cb
	rst 38h			;91cc
	nop			;91cd
	cp 000h			;91ce
	rst 38h			;91d0
	nop			;91d1
	rst 38h			;91d2
	nop			;91d3
	rst 38h			;91d4
	nop			;91d5
	rst 38h			;91d6
	nop			;91d7
	rst 38h			;91d8
	nop			;91d9
	rst 38h			;91da
	nop			;91db
	cp 000h			;91dc
	rst 38h			;91de
	nop			;91df
	rst 38h			;91e0
	nop			;91e1
	rst 38h			;91e2
	nop			;91e3
l91e4h:
	rst 38h			;91e4
	nop			;91e5
	rst 38h			;91e6
	nop			;91e7
	rst 38h			;91e8
	nop			;91e9
	cp 000h			;91ea
	rst 38h			;91ec
	nop			;91ed
	rst 38h			;91ee
	nop			;91ef
	rst 38h			;91f0
	nop			;91f1
	ex (sp),hl		;91f2
	nop			;91f3
	rst 38h			;91f4
	nop			;91f5
	rst 38h			;91f6
	nop			;91f7
	cp 000h			;91f8
	rst 38h			;91fa
	nop			;91fb
	rst 38h			;91fc
	nop			;91fd
	rst 38h			;91fe
	nop			;91ff
	add a,c			;9200
	inc e			;9201
	rst 38h			;9202
	nop			;9203
	rst 38h			;9204
	nop			;9205
	cp 000h			;9206
	rst 38h			;9208
	nop			;9209
	rst 38h			;920a
	nop			;920b
	rst 38h			;920c
	nop			;920d
	nop			;920e
	ld a,(hl)		;920f
	ld a,a			;9210
	nop			;9211
	rst 38h			;9212
	nop			;9213
	cp (hl)			;9214
	nop			;9215
	rst 38h			;9216
	nop			;9217
	cp 000h			;9218
	adc a,h			;921a
	nop			;921b
	nop			;921c
	rst 38h			;921d
	ccf			;921e
	add a,b			;921f
	rst 38h			;9220
	nop			;9221
	ld e,040h		;9222
	rst 38h			;9224
	nop			;9225
	ret m			;9226
	ld bc,07300h		;9227
	nop			;922a
	rst 20h			;922b
	rra			;922c
	ret nz			;922d
	call m,00e00h		;922e
	and b			;9231
	rst 38h			;9232
	nop			;9233
	ret nc			;9234
	ld b,000h		;9235
	sbc a,018h		;9237
	jp le00fh		;9239
	ret m			;923c
	inc bc			;923d
	ld b,0f0h		;923e
	rst 38h			;9240
	nop			;9241
	nop			;9242
	jr z,l9245h		;9243
l9245h:
	xor l			;9245
	inc a			;9246
l9247h:
	ld bc,le00fh		;9247
	ret p			;924a
	rlca			;924b
	ld (bc),a		;924c
	ret m			;924d
	cp 000h			;924e
	nop			;9250
	ret p			;9251
	nop			;9252
	ld a,(de)		;9253
	ld a,080h		;9254
	rlca			;9256
	ld (hl),b		;9257
	ret po			;9258
	rrca			;9259
	nop			;925a
	call m,001fch		;925b
	nop			;925e
	adc a,d			;925f
	nop			;9260
	dec h			;9261
	jr c,l91e4h		;9262
	inc bc			;9264
	jr c,l9247h		;9265
	rrca			;9267
	nop			;9268
	inc c			;9269
	ret m			;926a
	inc bc			;926b
	nop			;926c
	ld h,(hl)		;926d
	nop			;926e
	ld d,e			;926f
	nop			;9270
	rlca			;9271
	inc bc			;9272
	ret z			;9273
	nop			;9274
	ld e,0e1h		;9275
	ld a,(bc)		;9277
	ret p			;9278
	rlca			;9279
	nop			;927a
	sbc a,000h		;927b
	inc h			;927d
	nop			;927e
	ld a,d			;927f
	nop			;9280
	or b			;9281
	ld bc,le0fch		;9282
	inc c			;9285
	ret p			;9286
	rlca			;9287
	nop			;9288
	ld sp,hl		;9289
	nop			;928a
	add hl,bc		;928b
	nop			;928c
	add a,l			;928d
	nop			;928e
	ld a,e			;928f
	inc bc			;9290
	ret m			;9291
	ret nz			;9292
	inc e			;9293
	ret po			;9294
	rrca			;9295
	nop			;9296
	pop af			;9297
	nop			;9298
	ld (lca00h),hl		;9299
	nop			;929c
	defb 0ddh,001h,0fch ;illegal sequence	;929d
	add a,d			;92a0
	jr c,$-30		;92a1
	rrca			;92a3
	nop			;92a4
	call m,00f00h		;92a5
	nop			;92a8
	add a,c			;92a9
	nop			;92aa
	dec (hl)		;92ab
	nop			;92ac
	sub (hl)		;92ad
	ld b,070h		;92ae
	ret po			;92b0
	rrca			;92b1
	nop			;92b2
	cp 000h			;92b3
	rra			;92b5
	nop			;92b6
	inc a			;92b7
	nop			;92b8
	ld c,d			;92b9
	nop			;92ba
	ld a,(de)		;92bb
	ld (bc),a		;92bc
	ret po			;92bd
	ret po			;92be
	ld c,000h		;92bf
	ld a,a			;92c1
	nop			;92c2
	ld a,000h		;92c3
	cp 000h			;92c5
	ld d,000h		;92c7
	dec c			;92c9
	nop			;92ca
	sbc a,h			;92cb
	ret po			;92cc
l92cdh:
	ld c,000h		;92cd
	cp (hl)			;92cf
	nop			;92d0
l92d1h:
	ld a,a			;92d1
	nop			;92d2
	ret p			;92d3
	nop			;92d4
	ld l,000h		;92d5
	adc a,l			;92d7
	ld bc,lf062h		;92d8
	ld b,000h		;92db
	sbc a,000h		;92dd
	rst 38h			;92df
	nop			;92e0
	add a,a			;92e1
	nop			;92e2
	sub (hl)		;92e3
	nop			;92e4
	add a,a			;92e5
	add hl,de		;92e6
	ld b,d			;92e7
	ret p			;92e8
	rlca			;92e9
	nop			;92ea
	ld e,d			;92eb
	nop			;92ec
	cp 000h			;92ed
	ld l,a			;92ef
	nop			;92f0
	dec c			;92f1
	nop			;92f2
	add a,030h		;92f3
	add a,h			;92f5
	ret m			;92f6
	inc bc			;92f7
	nop			;92f8
	cp h			;92f9
	nop			;92fa
	rst 38h			;92fb
	nop			;92fc
	sbc a,000h		;92fd
	ld e,c			;92ff
	nop			;9300
	call sub_c001h+1	;9301
	call m,00001h		;9304
	cp 000h			;9307
	rst 28h			;9309
	nop			;930a
	call m,02b00h		;930b
	djnz l92d1h		;930e
	ld (bc),a		;9310
	ret m			;9311
	cp 000h			;9312
	nop			;9314
	cp 000h			;9315
	rst 10h			;9317
	nop			;9318
	pop af			;9319
	nop			;931a
	dec de			;931b
	ld a,080h		;931c
	nop			;931e
	call m,000ffh		;931f
	nop			;9322
	ld a,000h		;9323
	out (000h),a		;9325
	ex de,hl		;9327
	nop			;9328
	adc a,e			;9329
	ld a,a			;932a
	nop			;932b
	nop			;932c
	ld e,h			;932d
	rst 38h			;932e
	nop			;932f
	ret nz			;9330
	nop			;9331
	nop			;9332
	in a,(000h)		;9333
	ei			;9335
	nop			;9336
	out (07fh),a		;9337
	nop			;9339
	nop			;933a
	inc a			;933b
	rst 38h			;933c
	nop			;933d
	cp 000h			;933e
	nop			;9340
	in a,(000h)		;9341
	rst 30h			;9343
	nop			;9344
	or a			;9345
	ld a,a			;9346
	nop			;9347
	nop			;9348
	ld a,h			;9349
	rst 38h			;934a
	nop			;934b
	cp 000h			;934c
	nop			;934e
	ex de,hl		;934f
	nop			;9350
	rst 38h			;9351
	nop			;9352
	daa			;9353
	ld a,(hl)		;9354
	nop			;9355
	ld (bc),a		;9356
	ret m			;9357
	rst 38h			;9358
	nop			;9359
	rst 38h			;935a
	nop			;935b
	nop			;935c
	ld h,a			;935d
	nop			;935e
	cp 018h			;935f
	jp 0007eh		;9361
	ld b,0e0h		;9364
	rst 38h			;9366
	nop			;9367
	rst 38h			;9368
	nop			;9369
	add a,b			;936a
	ccf			;936b
	nop			;936c
	rst 38h			;936d
	jr nc,l9377h		;936e
	ld a,h			;9370
	ld bc,lc01eh		;9371
	rst 38h			;9374
	nop			;9375
	rst 38h			;9376
l9377h:
	nop			;9377
	ret nz			;9378
	rra			;9379
	nop			;937a
	call m,00710h		;937b
	ld a,b			;937e
	inc bc			;937f
	ld e,0c0h		;9380
	rst 38h			;9382
	nop			;9383
	rst 38h			;9384
	nop			;9385
	ret po			;9386
	rrca			;9387
	nop			;9388
	ret m			;9389
	nop			;938a
	xor 0f8h		;938b
	inc bc			;938d
	ld e,080h		;938e
	rst 38h			;9390
	nop			;9391
	rst 38h			;9392
	nop			;9393
	ret p			;9394
	inc bc			;9395
	nop			;9396
	ex (sp),hl		;9397
	nop			;9398
	ld d,0f8h		;9399
	inc bc			;939b
	ld b,0a0h		;939c
	rst 38h			;939e
	nop			;939f
	rst 38h			;93a0
	nop			;93a1
	call m,00000h		;93a2
	ex af,af'		;93a5
	pop hl			;93a6
	inc c			;93a7
	add a,b			;93a8
	inc bc			;93a9
	nop			;93aa
	ret c			;93ab
	rst 38h			;93ac
	nop			;93ad
	rst 38h			;93ae
	nop			;93af
	rst 38h			;93b0
	nop			;93b1
	ret po			;93b2
	ld a,(bc)		;93b3
	ret nz			;93b4
	inc e			;93b5
	nop			;93b6
	ld a,l			;93b7
	ld bc,lffeeh		;93b8
	nop			;93bb
	rst 38h			;93bc
	nop			;93bd
	rst 38h			;93be
	nop			;93bf
	pop af			;93c0
	inc b			;93c1
	add a,b			;93c2
	ld sp,le600h		;93c3
	ld bc,lfff7h		;93c6
	nop			;93c9
	rst 38h			;93ca
	nop			;93cb
	rst 38h			;93cc
	nop			;93cd
	ei			;93ce
	nop			;93cf
	nop			;93d0
	ld c,a			;93d1
	nop			;93d2
	sbc a,c			;93d3
	ld bc,0ff0fh		;93d4
	nop			;93d7
	rst 38h			;93d8
	nop			;93d9
	rst 38h			;93da
	nop			;93db
	ret m			;93dc
	nop			;93dd
	nop			;93de
	cp l			;93df
	nop			;93e0
	xor 001h		;93e1
	rst 38h			;93e3
	rst 38h			;93e4
	nop			;93e5
	rst 38h			;93e6
	nop			;93e7
	rst 38h			;93e8
	nop			;93e9
	ret p			;93ea
	rlca			;93eb
	nop			;93ec
	cp 000h			;93ed
	rst 30h			;93ef
	ld bc,00060h		;93f0
	dec b			;93f3
	rlca			;93f4
	nop			;93f5
	daa			;93f6
	sub (hl)		;93f7
	rst 38h			;93f8
	nop			;93f9
	rst 38h			;93fa
	nop			;93fb
	rst 38h			;93fc
	nop			;93fd
	rst 38h			;93fe
	nop			;93ff
	rst 38h			;9400
	nop			;9401
	rst 38h			;9402
	nop			;9403
	rst 38h			;9404
	nop			;9405
	rst 38h			;9406
	nop			;9407
	rst 38h			;9408
	nop			;9409
	rst 38h			;940a
	nop			;940b
	rst 38h			;940c
	nop			;940d
	rst 38h			;940e
	nop			;940f
	rst 38h			;9410
	nop			;9411
	rst 38h			;9412
	nop			;9413
	rst 38h			;9414
	nop			;9415
	rst 38h			;9416
	nop			;9417
	rst 38h			;9418
	nop			;9419
	rst 38h			;941a
	nop			;941b
	rst 38h			;941c
	nop			;941d
	cp 000h			;941e
	rst 38h			;9420
	nop			;9421
	rst 38h			;9422
	nop			;9423
	rst 38h			;9424
	nop			;9425
	rst 38h			;9426
	nop			;9427
	rst 38h			;9428
	nop			;9429
	rst 38h			;942a
	nop			;942b
	call m,03f01h		;942c
	nop			;942f
	rst 38h			;9430
	nop			;9431
	rst 38h			;9432
	nop			;9433
	rst 38h			;9434
	nop			;9435
	rst 38h			;9436
	nop			;9437
	rst 38h			;9438
	nop			;9439
	ret po			;943a
	ld (bc),a		;943b
	rra			;943c
	ret nz			;943d
	rst 38h			;943e
	nop			;943f
	rst 38h			;9440
	nop			;9441
	rst 38h			;9442
	nop			;9443
	rst 38h			;9444
	nop			;9445
	rst 38h			;9446
	nop			;9447
	ld b,b			;9448
	rra			;9449
	rrca			;944a
	ret po			;944b
	rst 38h			;944c
	nop			;944d
	rst 38h			;944e
	nop			;944f
	rst 38h			;9450
	nop			;9451
	ret m			;9452
	nop			;9453
	ld (00000h),a		;9454
	cp h			;9457
	rlca			;9458
	ld (hl),b		;9459
	rst 38h			;945a
	nop			;945b
	rst 38h			;945c
	nop			;945d
	rst 38h			;945e
	nop			;945f
	add a,b			;9460
	rlca			;9461
	nop			;9462
	call sub_f001h		;9463
	inc bc			;9466
	ld a,b			;9467
	rst 38h			;9468
	nop			;9469
	rst 38h			;946a
	nop			;946b
	jp nz,00000h		;946c
	ld a,d			;946f
	nop			;9470
	or e			;9471
	inc bc			;9472
	ret z			;9473
	add a,e			;9474
	jr c,$+1		;9475
	nop			;9477
	cp 000h			;9478
	nop			;947a
	dec a			;947b
	nop			;947c
	add a,l			;947d
	nop			;947e
	ld a,c			;947f
	ld bc,0c12ch		;9480
	inc e			;9483
	rst 38h			;9484
	nop			;9485
	ret m			;9486
	ld bc,ld200h		;9487
	nop			;948a
	jp z,0dd00h		;948b
	ld bc,lc034h		;948e
l9491h:
	ld a,(de)		;9491
	rst 38h			;9492
	nop			;9493
	ret nc			;9494
	ld b,000h		;9495
	adc a,a			;9497
	nop			;9498
	add a,c			;9499
	nop			;949a
	ld (hl),0c0h		;949b
	ld a,(de)		;949d
	pop hl			;949e
	inc c			;949f
	rst 38h			;94a0
	nop			;94a1
	nop			;94a2
	jr z,l94a5h		;94a3
l94a5h:
	ld e,a			;94a5
	nop			;94a6
	inc a			;94a7
	nop			;94a8
	ld c,d			;94a9
	ret nz			;94aa
	ld a,(de)		;94ab
	pop hl			;94ac
	inc c			;94ad
	cp 000h			;94ae
	nop			;94b0
	ret p			;94b1
	nop			;94b2
	cp (hl)			;94b3
	nop			;94b4
	cp 000h			;94b5
	ld d,0e0h		;94b7
	ld c,0c1h		;94b9
	inc e			;94bb
	call m,00001h		;94bc
	adc a,d			;94bf
	nop			;94c0
	ld a,a			;94c1
	nop			;94c2
	ret p			;94c3
	nop			;94c4
	inc l			;94c5
	ret po			;94c6
	inc c			;94c7
	ld bc,lf83ch		;94c8
	inc bc			;94cb
	nop			;94cc
	ld h,(hl)		;94cd
	nop			;94ce
	rst 38h			;94cf
	nop			;94d0
	add a,a			;94d1
	nop			;94d2
	sub h			;94d3
	ret nz			;94d4
	jr l94dah		;94d5
	ret m			;94d7
	ret p			;94d8
	rlca			;94d9
l94dah:
	nop			;94da
	sbc a,000h		;94db
	cp 000h			;94dd
	ld l,a			;94df
	nop			;94e0
	dec c			;94e1
	ld h,b			;94e2
	ld bc,le007h		;94e3
	ret p			;94e6
	rlca			;94e7
	nop			;94e8
	ld sp,hl		;94e9
	nop			;94ea
	rst 38h			;94eb
	nop			;94ec
	sbc a,000h		;94ed
	ld e,e			;94ef
	ld a,b			;94f0
	inc bc			;94f1
	dec de			;94f2
	ret nz			;94f3
	ret po			;94f4
	rrca			;94f5
	nop			;94f6
	pop af			;94f7
	nop			;94f8
	rst 28h			;94f9
	nop			;94fa
	call m,02b00h		;94fb
	ld (hl),b		;94fe
	dec b			;94ff
	ld bc,le084h		;9500
	rrca			;9503
	nop			;9504
	defb 0fdh,000h,0d7h ;illegal sequence	;9505
	nop			;9508
	pop af			;9509
	nop			;950a
	dec de			;950b
	jr c,l9491h		;950c
	nop			;950e
	sbc a,d			;950f
	ret po			;9510
	rrca			;9511
	nop			;9512
	defb 0fdh,000h,0d3h ;illegal sequence	;9513
	nop			;9516
	ex de,hl		;9517
	nop			;9518
	adc a,e			;9519
	inc a			;951a
	add a,c			;951b
	nop			;951c
	ld h,d			;951d
	ret po			;951e
	ld c,000h		;951f
	ld a,l			;9521
	nop			;9522
	in a,(000h)		;9523
	ei			;9525
	nop			;9526
	pop de			;9527
	inc e			;9528
	pop bc			;9529
	ld bc,le08ah		;952a
	ld c,000h		;952d
	cp (hl)			;952f
	nop			;9530
	in a,(000h)		;9531
	rst 30h			;9533
	inc b			;9534
	or c			;9535
	ld e,0c0h		;9536
	ld bc,lf0c4h		;9538
	ld b,000h		;953b
	sbc a,000h		;953d
	ex de,hl		;953f
	nop			;9540
	rst 38h			;9541
	ex af,af'		;9542
	inc hl			;9543
	ld e,0c0h		;9544
	inc bc			;9546
	ret po			;9547
	ret p			;9548
	rlca			;9549
	nop			;954a
	ld e,e			;954b
	nop			;954c
	ld h,a			;954d
	nop			;954e
	cp 010h			;954f
	jp l803fh		;9551
	rlca			;9554
	ld h,b			;9555
	ret m			;9556
	inc bc			;9557
	nop			;9558
	cp h			;9559
	nop			;955a
	cp a			;955b
	nop			;955c
	rst 38h			;955d
	jr nz,l956fh		;955e
	ld a,a			;9560
	nop			;9561
	rlca			;9562
	ld (hl),b		;9563
	call m,00001h		;9564
	cp 000h			;9567
	ld e,a			;9569
	nop			;956a
	call m,01ec0h		;956b
	rst 38h			;956e
l956fh:
	nop			;956f
	rlca			;9570
	ld (hl),b		;9571
	cp 000h			;9572
	nop			;9574
	rst 38h			;9575
	jr nz,$-111		;9576
	inc bc			;9578
	ret m			;9579
	pop bc			;957a
	inc e			;957b
	cp 000h			;957c
	rrca			;957e
	ret po			;957f
	rst 38h			;9580
l9581h:
	nop			;9581
	nop			;9582
	ld a,070h		;9583
	inc bc			;9585
	rlca			;9586
	ret po			;9587
	jp lfc18h		;9588
	ld bc,lc01eh+1		;958b
	rst 38h			;958e
	nop			;958f
	pop bc			;9590
	nop			;9591
	call m,01f00h		;9592
	nop			;9595
	pop bc			;9596
	inc e			;9597
	ret m			;9598
	inc bc			;9599
	ccf			;959a
	add a,b			;959b
	rst 38h			;959c
	nop			;959d
	rst 38h			;959e
	nop			;959f
	rst 38h			;95a0
	nop			;95a1
	call m,06100h		;95a2
	inc c			;95a5
	ret m			;95a6
	inc bc			;95a7
	ccf			;95a8
	add a,b			;95a9
	rst 38h			;95aa
	nop			;95ab
	rst 38h			;95ac
	nop			;95ad
	rst 38h			;95ae
	nop			;95af
	ret m			;95b0
	inc bc			;95b1
	nop			;95b2
	adc a,(hl)		;95b3
	ret p			;95b4
	rlca			;95b5
	ld a,a			;95b6
	nop			;95b7
	rst 38h			;95b8
	nop			;95b9
	rst 38h			;95ba
	nop			;95bb
	rst 38h			;95bc
	nop			;95bd
	ret p			;95be
	inc b			;95bf
	nop			;95c0
	and 0f0h		;95c1
	rlca			;95c3
	ld e,a			;95c4
	nop			;95c5
	rst 38h			;95c6
	nop			;95c7
	rst 38h			;95c8
	nop			;95c9
	rst 38h			;95ca
	nop			;95cb
	ret po			;95cc
	ex af,af'		;95cd
	nop			;95ce
	ld a,0f0h		;95cf
	rlca			;95d1
	rlca			;95d2
	and b			;95d3
	rst 38h			;95d4
	nop			;95d5
	rst 38h			;95d6
	nop			;95d7
	rst 38h			;95d8
	nop			;95d9
	ret po			;95da
	ld a,(bc)		;95db
	pop bc			;95dc
	inc c			;95dd
	add a,b			;95de
	inc bc			;95df
	ld bc,lffd8h		;95e0
	nop			;95e3
	rst 38h			;95e4
	nop			;95e5
	rst 38h			;95e6
	nop			;95e7
	pop af			;95e8
	inc b			;95e9
	ret nz			;95ea
	inc e			;95eb
	nop			;95ec
	ld a,l			;95ed
	nop			;95ee
	xor 0ffh		;95ef
	nop			;95f1
	rst 38h			;95f2
	nop			;95f3
	rst 38h			;95f4
	nop			;95f5
	ei			;95f6
	nop			;95f7
	add a,b			;95f8
	ld sp,le600h		;95f9
	nop			;95fc
	rst 30h			;95fd
	rst 38h			;95fe
	nop			;95ff
l9600h:
	rst 38h			;9600
	nop			;9601
	rst 38h			;9602
	nop			;9603
	rst 38h			;9604
	nop			;9605
	nop			;9606
	ld c,a			;9607
	nop			;9608
	sbc a,c			;9609
	nop			;960a
	rrca			;960b
	rst 38h			;960c
	nop			;960d
	rst 38h			;960e
	nop			;960f
	rst 38h			;9610
	nop			;9611
	ret m			;9612
	nop			;9613
	nop			;9614
	cp l			;9615
	nop			;9616
	xor 000h		;9617
	rst 38h			;9619
	rst 38h			;961a
	nop			;961b
	rst 38h			;961c
	nop			;961d
	rst 38h			;961e
	nop			;961f
	ret p			;9620
	rlca			;9621
	nop			;9622
	cp 000h			;9623
	rst 30h			;9625
	nop			;9626
	ld h,b			;9627
	nop			;9628
	rlca			;9629
	ld (bc),a		;962a
	nop			;962b
	dec c			;962c
	sub a			;962d
	rst 38h			;962e
	nop			;962f
	rst 38h			;9630
	nop			;9631
	rst 38h			;9632
	nop			;9633
	rst 38h			;9634
	nop			;9635
	rst 38h			;9636
	nop			;9637
	rst 38h			;9638
	nop			;9639
	ret p			;963a
	nop			;963b
	rst 38h			;963c
	nop			;963d
	ret po			;963e
	ld c,07fh		;963f
	nop			;9641
	ret nz			;9642
	rra			;9643
	ccf			;9644
	add a,b			;9645
	add a,b			;9646
	ccf			;9647
	rra			;9648
	ret nz			;9649
	ret nz			;964a
	dec bc			;964b
	rrca			;964c
	ld h,b			;964d
	ret p			;964e
	rlca			;964f
	rrca			;9650
	and b			;9651
	ret m			;9652
	inc bc			;9653
	rrca			;9654
	and b			;9655
	call m,00301h		;9656
	ret nc			;9659
	ret m			;965a
	ld (bc),a		;965b
	nop			;965c
	call pe,002f8h		;965d
	nop			;9660
	di			;9661
	ret m			;9662
	ld (bc),a		;9663
	nop			;9664
	call m,001fch		;9665
	nop			;9668
	ld a,a			;9669
	cp 000h			;966a
	nop			;966c
	sbc a,a			;966d
	rst 38h			;966e
	nop			;966f
	nop			;9670
	ld h,e			;9671
	call m,00000h		;9672
	push de			;9675
	ret p			;9676
	inc bc			;9677
	nop			;9678
	xor d			;9679
	ret po			;967a
	rrca			;967b
	nop			;967c
	defb 0fdh,0c0h,013h ;illegal sequence	;967d
	nop			;9680
	cp 0ech			;9681
	ld bc,lf100h		;9683
	call m,00001h		;9686
	adc a,a			;9689
	cp 000h			;968a
	nop			;968c
	ld a,a			;968d
	ret m			;968e
	ld bc,sub_feffh+1	;968f
	ret p			;9692
	ld b,000h		;9693
	rst 38h			;9695
	ret m			;9696
	ld bc,03f00h		;9697
	cp 000h			;969a
	nop			;969c
	cp a			;969d
	cp 000h			;969e
	nop			;96a0
	rst 18h			;96a1
	call m,00001h		;96a2
	xor a			;96a5
	call m,00001h		;96a6
l96a9h:
	rst 28h			;96a9
	ret m			;96aa
	inc bc			;96ab
	nop			;96ac
	rst 10h			;96ad
	ret p			;96ae
	rlca			;96af
	nop			;96b0
	rst 20h			;96b1
	ret p			;96b2
	rlca			;96b3
	nop			;96b4
	di			;96b5
	ret po			;96b6
	rrca			;96b7
	nop			;96b8
	ex de,hl		;96b9
	ret nz			;96ba
	add hl,de		;96bb
	nop			;96bc
	ei			;96bd
	add a,(hl)		;96be
	jr nz,l96c1h		;96bf
l96c1h:
	dec a			;96c1
	add a,a			;96c2
	jr nc,$-62		;96c3
	dec e			;96c5
	adc a,a			;96c6
	jr nz,l96a9h		;96c7
	ld a,(bc)		;96c9
	rst 18h			;96ca
	nop			;96cb
	ret po			;96cc
	ld a,(bc)		;96cd
	adc a,b			;96ce
	jr nz,$-62		;96cf
	ld (de),a		;96d1
	ret nz			;96d2
	rlca			;96d3
	nop			;96d4
	dec b			;96d5
	ret po			;96d6
	add hl,bc		;96d7
	nop			;96d8
	rst 8			;96d9
	ret p			;96da
	ld b,000h		;96db
	ld a,e			;96dd
	ret m			;96de
	ld bc,07600h		;96df
	ret p			;96e2
	nop			;96e3
	nop			;96e4
	cp a			;96e5
	ret nz			;96e6
	ld c,000h		;96e7
	ld e,(hl)		;96e9
	add a,b			;96ea
	ccf			;96eb
	nop			;96ec
	ld e,l			;96ed
	nop			;96ee
	ld a,a			;96ef
	nop			;96f0
	xor (hl)		;96f1
	add a,b			;96f2
	ccf			;96f3
	nop			;96f4
	xor a			;96f5
	add a,b			;96f6
	ccf			;96f7
	nop			;96f8
	ld l,a			;96f9
	add a,b			;96fa
	ld a,000h		;96fb
	sub a			;96fd
	add a,b			;96fe
	add hl,sp		;96ff
	nop			;9700
	ld a,l			;9701
	add a,b			;9702
	inc hl			;9703
	nop			;9704
	rst 30h			;9705
	nop			;9706
	ld c,d			;9707
	nop			;9708
	cp e			;9709
	or c			;970a
	nop			;970b
	ld b,b			;970c
	nop			;970d
l970eh:
	ld a,(la84bh)		;970e
	cp 000h			;9711
	jp z,l97eeh		;9713
	ld iy,l9835h		;9716
	call sub_9724h		;971a
	call sub_97b7h		;971d
	call sub_97c6h		;9720
	ret			;9723
sub_9724h:
	call sub_9790h		;9724
	ld a,(l979dh)		;9727
	cp 001h			;972a
	jp z,l97a0h		;972c
	ld a,(l979eh)		;972f
	cp 000h			;9732
	jp nz,l9755h		;9734
	ld a,(iy+001h)		;9737
	cp 000h			;973a
	jr z,l9762h		;973c
	ld a,(la633h)		;973e
	cp 00ch			;9741
	jr nz,l974ch		;9743
	ld a,(iy+001h)		;9745
	cp 078h			;9748
	jr z,l9762h		;974a
l974ch:
	ld a,(iy+001h)		;974c
	sub 004h		;974f
	ld (iy+001h),a		;9751
	ret			;9754
l9755h:
	ld a,(iy+001h)		;9755
	cp 0d8h			;9758
	jr z,l9779h		;975a
	add a,004h		;975c
	ld (iy+001h),a		;975e
	ret			;9761
l9762h:
	ld ix,l9835h		;9762
	ld a,003h		;9766
	ld (iy+007h),a		;9768
	call sub_7609h		;976b
	ld a,001h		;976e
	ld (l979eh),a		;9770
	ld a,004h		;9773
	ld (iy+007h),a		;9775
	ret			;9778
l9779h:
	ld ix,l9835h		;9779
	ld a,003h		;977d
	ld (iy+007h),a		;977f
	call sub_75eeh		;9782
	ld a,000h		;9785
	ld (l979eh),a		;9787
	ld a,004h		;978a
	ld (iy+007h),a		;978c
	ret			;978f
sub_9790h:
	ld a,(iy+008h)		;9790
	inc a			;9793
	cp 005h			;9794
	call z,sub_7e9dh	;9796
	ld (iy+008h),a		;9799
	ret			;979c
l979dh:
	nop			;979d
l979eh:
	nop			;979e
l979fh:
	nop			;979f
l97a0h:
	ld a,(iy+000h)		;97a0
	cp 0c0h			;97a3
	jp z,l97aeh		;97a5
	add a,008h		;97a8
	ld (iy+000h),a		;97aa
	ret			;97ad
l97aeh:
	call sub_6dd2h		;97ae
	ld a,000h		;97b1
	ld (la84bh),a		;97b3
	ret			;97b6
sub_97b7h:
	ld iy,l9835h		;97b7
	ld h,038h		;97bb
	ld l,020h		;97bd
	call sub_7d67h		;97bf
	jp c,sub_a7f1h		;97c2
	ret			;97c5
sub_97c6h:
	ld iy,l9835h		;97c6
	ld h,038h		;97ca
	ld l,020h		;97cc
	call sub_7d75h		;97ce
	ret nc			;97d1
	ld a,(l7831h)		;97d2
	cp 001h			;97d5
	ret nz			;97d7
	ld a,(la617h)		;97d8
	ld b,a			;97db
	inc b			;97dc
	ld a,(l979fh)		;97dd
	add a,b			;97e0
	ld (l979fh),a		;97e1
	and a			;97e4
	sbc a,009h		;97e5
	ret c			;97e7
	ld a,001h		;97e8
	ld (l979dh),a		;97ea
	ret			;97ed
l97eeh:
	ld a,r			;97ee
	and 01fh		;97f0
	cp 000h			;97f2
	ret nz			;97f4
	ld a,001h		;97f5
	ld (la84bh),a		;97f7
	ld a,003h		;97fa
	ld (l983ch),a		;97fc
	ld ix,l9835h		;97ff
	call sub_75eeh		;9803
	ld a,004h		;9806
	ld (l983ch),a		;9808
	ld a,000h		;980b
	ld (l979eh),a		;980d
	ld (l979dh),a		;9810
	ld (l979fh),a		;9813
	ld a,0d8h		;9816
	ld (l9836h),a		;9818
	ld a,080h		;981b
	ld (l9835h),a		;981d
	call sub_6dach		;9820
	ld hl,l9835h		;9823
	ld (la653h),hl		;9826
	ld a,(la633h)		;9829
	cp 007h			;982c
	ret nz			;982e
	ld a,090h		;982f
	ld (l9835h),a		;9831
	ret			;9834
l9835h:
	nop			;9835
l9836h:
	nop			;9836
	nop			;9837
	nop			;9838
	nop			;9839
	nop			;983a
	nop			;983b
l983ch:
	inc bc			;983c
	ld bc,04707h		;983d
	sbc a,b			;9840
	call z,0519ah		;9841
	sbc a,l			;9844
	call z,0089ah		;9845
	dec b			;9848
	nop			;9849
	res 3,d			;984a
	cp 000h			;984c
	rrca			;984e
	nop			;984f
	rst 38h			;9850
	nop			;9851
	rst 38h			;9852
	nop			;9853
	rst 38h			;9854
	nop			;9855
	ret m			;9856
	ld bc,lf003h		;9857
	rst 38h			;985a
	nop			;985b
	rst 38h			;985c
	nop			;985d
	rst 38h			;985e
	nop			;985f
	ret p			;9860
	rlca			;9861
	ld bc,lfffch		;9862
	nop			;9865
	rst 38h			;9866
	nop			;9867
	rst 38h			;9868
	nop			;9869
	ret po			;986a
	rrca			;986b
	nop			;986c
	cp 07fh			;986d
	nop			;986f
	rst 38h			;9870
	nop			;9871
	rst 38h			;9872
	nop			;9873
	ret po			;9874
	dec c			;9875
	nop			;9876
	ld a,a			;9877
	ccf			;9878
	add a,b			;9879
	rst 38h			;987a
	nop			;987b
	rst 38h			;987c
	nop			;987d
	ret nz			;987e
	ld d,000h		;987f
	and 01fh		;9881
	ret nz			;9883
	rst 38h			;9884
	nop			;9885
	rst 38h			;9886
	nop			;9887
	ret nz			;9888
	inc de			;9889
	nop			;988a
	push bc			;988b
	rra			;988c
	ret nz			;988d
	rst 38h			;988e
	nop			;988f
	rst 38h			;9890
	nop			;9891
	ret nz			;9892
	dec d			;9893
	nop			;9894
	dec (hl)		;9895
	rrca			;9896
	ret po			;9897
	ccf			;9898
	nop			;9899
	rst 38h			;989a
	nop			;989b
	add a,b			;989c
	dec l			;989d
	nop			;989e
	ld (hl),l		;989f
	ld b,0f0h		;98a0
	rra			;98a2
	ret nz			;98a3
	rst 38h			;98a4
	nop			;98a5
	add a,b			;98a6
	inc sp			;98a7
	nop			;98a8
	adc a,l			;98a9
	inc b			;98aa
	pop af			;98ab
	rrca			;98ac
	ret po			;98ad
	rst 38h			;98ae
	nop			;98af
	add a,b			;98b0
	ccf			;98b1
	nop			;98b2
	ei			;98b3
	inc b			;98b4
	pop af			;98b5
	rrca			;98b6
	ld h,b			;98b7
	rst 38h			;98b8
	nop			;98b9
	add a,b			;98ba
	ccf			;98bb
	nop			;98bc
	ld a,(hl)		;98bd
	nop			;98be
	ld a,e			;98bf
	rrca			;98c0
	ld h,b			;98c1
	rst 38h			;98c2
	nop			;98c3
	add a,b			;98c4
	inc (hl)		;98c5
	nop			;98c6
	ld l,080h		;98c7
	dec a			;98c9
	rlca			;98ca
	or b			;98cb
	rst 38h			;98cc
	nop			;98cd
	ret nz			;98ce
	inc b			;98cf
	nop			;98d0
	ld l,0c0h		;98d1
	rra			;98d3
	rlca			;98d4
	or b			;98d5
	rst 38h			;98d6
	nop			;98d7
	ret m			;98d8
	ld (bc),a		;98d9
	nop			;98da
	ld (hl),000h		;98db
	rra			;98dd
	inc bc			;98de
	cp b			;98df
	rst 38h			;98e0
	nop			;98e1
	ret p			;98e2
	ld (bc),a		;98e3
	nop			;98e4
	inc d			;98e5
	nop			;98e6
	rst 28h			;98e7
	inc bc			;98e8
	ld e,b			;98e9
	rst 38h			;98ea
	nop			;98eb
	ret po			;98ec
	inc c			;98ed
	nop			;98ee
	dec d			;98ef
	nop			;98f0
	cp a			;98f1
	inc bc			;98f2
	sbc a,b			;98f3
	rst 38h			;98f4
	nop			;98f5
	ret nz			;98f6
	djnz l98f9h		;98f7
l98f9h:
	dec (hl)		;98f9
	nop			;98fa
	cp a			;98fb
	inc bc			;98fc
	ld c,b			;98fd
	rst 38h			;98fe
	nop			;98ff
	ret nz			;9900
	jr l9903h		;9901
l9903h:
	defb 0edh ;next byte illegal after ed	;9903
	nop			;9904
	cp a			;9905
	inc bc			;9906
	sbc a,b			;9907
	rst 38h			;9908
	nop			;9909
	ret po			;990a
	rrca			;990b
	nop			;990c
	call m,ldf00h		;990d
	inc bc			;9910
	ld e,b			;9911
	rst 38h			;9912
	nop			;9913
	ret p			;9914
	rlca			;9915
	ld (bc),a		;9916
	ret m			;9917
	nop			;9918
	rst 18h			;9919
	inc bc			;991a
	sbc a,b			;991b
	rst 38h			;991c
	nop			;991d
	ret m			;991e
	inc bc			;991f
	ld b,0c0h		;9920
	nop			;9922
	rst 18h			;9923
	inc bc			;9924
	ld e,b			;9925
	rst 38h			;9926
	nop			;9927
	call m,03e00h		;9928
	nop			;992b
	nop			;992c
	rst 18h			;992d
	inc bc			;992e
	cp b			;992f
	rst 38h			;9930
	nop			;9931
	rst 38h			;9932
	nop			;9933
	cp 000h			;9934
	nop			;9936
	rst 18h			;9937
	inc bc			;9938
	jr c,$+1		;9939
	nop			;993b
	rst 38h			;993c
	nop			;993d
	cp 000h			;993e
	nop			;9940
	rst 18h			;9941
	rlca			;9942
	or b			;9943
	rst 38h			;9944
	nop			;9945
	rst 38h			;9946
	nop			;9947
	rst 38h			;9948
	nop			;9949
	nop			;994a
	ld l,a			;994b
	rlca			;994c
	or b			;994d
	rst 38h			;994e
	nop			;994f
	rst 38h			;9950
l9951h:
	nop			;9951
	rst 38h			;9952
	nop			;9953
	nop			;9954
	ld l,a			;9955
	rlca			;9956
	or b			;9957
	rst 38h			;9958
	nop			;9959
	rst 38h			;995a
	nop			;995b
	rst 38h			;995c
	nop			;995d
	nop			;995e
	ld l,a			;995f
	rlca			;9960
	ld (hl),b		;9961
	rst 38h			;9962
	nop			;9963
	rst 38h			;9964
	nop			;9965
	cp 000h			;9966
l9968h:
	nop			;9968
	rst 28h			;9969
	rlca			;996a
	ld (hl),b		;996b
	rst 38h			;996c
	nop			;996d
	call m,03e00h		;996e
	nop			;9971
	nop			;9972
	xor 007h		;9973
	ret p			;9975
	rst 38h			;9976
	nop			;9977
	ret p			;9978
	inc bc			;9979
	ld e,0c0h		;997a
	nop			;997c
	defb 0edh ;next byte illegal after ed	;997d
	rlca			;997e
	ret p			;997f
	rst 38h			;9980
	nop			;9981
	ret po			;9982
	rrca			;9983
	inc c			;9984
	pop hl			;9985
	nop			;9986
	ex de,hl		;9987
	rrca			;9988
	ret po			;9989
	rst 38h			;998a
	nop			;998b
	ret nz			;998c
	ld e,004h		;998d
	ld sp,sub_c700h		;998f
	rrca			;9992
	ret po			;9993
	rst 38h			;9994
	nop			;9995
	add a,b			;9996
	dec a			;9997
	nop			;9998
	rlc b			;9999
	adc a,a			;999b
	rra			;999c
	ret nz			;999d
	rst 38h			;999e
	nop			;999f
	add a,b			;99a0
	dec sp			;99a1
	nop			;99a2
	rst 38h			;99a3
	nop			;99a4
	sbc a,(hl)		;99a5
	ccf			;99a6
	nop			;99a7
	rst 38h			;99a8
	nop			;99a9
	nop			;99aa
	ld (hl),a		;99ab
	nop			;99ac
	call m,sub_7d00h	;99ad
	ccf			;99b0
	add a,b			;99b1
	rst 38h			;99b2
	nop			;99b3
	nop			;99b4
	ld l,e			;99b5
	nop			;99b6
	inc sp			;99b7
	nop			;99b8
	pop af			;99b9
	ccf			;99ba
	add a,b			;99bb
	rst 38h			;99bc
	nop			;99bd
	nop			;99be
	ld l,h			;99bf
	ret nz			;99c0
	rrca			;99c1
	ex af,af'		;99c2
	ex (sp),hl		;99c3
	ld a,a			;99c4
	nop			;99c5
	rst 38h			;99c6
	nop			;99c7
	ld bc,l806ch		;99c8
	ccf			;99cb
	jr l9951h		;99cc
	ld a,a			;99ce
	nop			;99cf
	rst 38h			;99d0
	nop			;99d1
	nop			;99d2
	ld h,(hl)		;99d3
	nop			;99d4
	ld a,h			;99d5
	djnz $+72		;99d6
	rst 38h			;99d8
	nop			;99d9
	rst 38h			;99da
	nop			;99db
	nop			;99dc
	ld (hl),b		;99dd
	nop			;99de
	pop af			;99df
	jr nc,l9968h		;99e0
	rst 38h			;99e2
	nop			;99e3
	rst 38h			;99e4
	nop			;99e5
	inc b			;99e6
	ld (hl),c		;99e7
	nop			;99e8
	di			;99e9
	ld hl,lff8ch		;99ea
	nop			;99ed
	rst 38h			;99ee
	nop			;99ef
	add a,h			;99f0
	ld sp,lf300h		;99f1
	ld h,c			;99f4
	inc c			;99f5
	rst 38h			;99f6
	nop			;99f7
	rst 38h			;99f8
	nop			;99f9
	call z,00001h		;99fa
	cp e			;99fd
	ld b,e			;99fe
	jr $+1			;99ff
	nop			;9a01
	rst 38h			;9a02
	nop			;9a03
	ret m			;9a04
	inc bc			;9a05
	nop			;9a06
	call pe,018c3h		;9a07
	rst 38h			;9a0a
	nop			;9a0b
	rst 38h			;9a0c
	nop			;9a0d
	ret m			;9a0e
	inc bc			;9a0f
	ld bc,lc3bch		;9a10
	jr $+1			;9a13
	nop			;9a15
l9a16h:
	rst 38h			;9a16
	nop			;9a17
	ret p			;9a18
	rlca			;9a19
	nop			;9a1a
	or (hl)			;9a1b
	jp lff18h		;9a1c
	nop			;9a1f
	rst 38h			;9a20
	nop			;9a21
	ret po			;9a22
	rrca			;9a23
	nop			;9a24
	cp 0e1h			;9a25
	inc c			;9a27
	rst 38h			;9a28
	nop			;9a29
	rst 38h			;9a2a
	nop			;9a2b
	ret po			;9a2c
	dec c			;9a2d
	nop			;9a2e
	rst 28h			;9a2f
	ld h,c			;9a30
	inc c			;9a31
	rst 38h			;9a32
	nop			;9a33
	rst 38h			;9a34
	nop			;9a35
	ret p			;9a36
	dec b			;9a37
	nop			;9a38
	ex (sp),hl		;9a39
	ld hl,lff8ch		;9a3a
	nop			;9a3d
	rst 38h			;9a3e
	nop			;9a3f
	ret z			;9a40
	ld bc,lf104h		;9a41
	ld bc,lffcch		;9a44
	nop			;9a47
	rst 38h			;9a48
	nop			;9a49
	add a,h			;9a4a
	jr nc,$+4		;9a4b
	ret m			;9a4d
	djnz l9a16h		;9a4e
	rst 38h			;9a50
	nop			;9a51
	rst 38h			;9a52
	nop			;9a53
	ld bc,00178h		;9a54
	inc a			;9a57
	jr nc,l9a60h		;9a58
	rst 38h			;9a5a
	nop			;9a5b
	rst 38h			;9a5c
	nop			;9a5d
	nop			;9a5e
	ld a,(hl)		;9a5f
l9a60h:
	ld b,b			;9a60
	ld c,0f0h		;9a61
	rlca			;9a63
	rra			;9a64
	nop			;9a65
	rst 38h			;9a66
	nop			;9a67
	add a,b			;9a68
	ccf			;9a69
	nop			;9a6a
	or (hl)			;9a6b
	ret m			;9a6c
	inc bc			;9a6d
	rlca			;9a6e
	ret po			;9a6f
	rst 38h			;9a70
	nop			;9a71
l9a72h:
	ret nz			;9a72
	rra			;9a73
	ld bc,lfcf0h		;9a74
	ld bc,sub_d803h		;9a77
	rst 38h			;9a7a
	nop			;9a7b
	ret nz			;9a7c
	rra			;9a7d
	inc bc			;9a7e
	call m,003f0h		;9a7f
	ld bc,lffech		;9a82
	nop			;9a85
	ret po			;9a86
	rrca			;9a87
	ld bc,000c0h		;9a88
	rrca			;9a8b
	nop			;9a8c
	or 0ffh			;9a8d
	nop			;9a8f
	ret p			;9a90
	rlca			;9a91
	nop			;9a92
	sbc a,(hl)		;9a93
	nop			;9a94
	rst 38h			;9a95
	nop			;9a96
	jp pe,000ffh		;9a97
	ret m			;9a9a
	inc bc			;9a9b
	nop			;9a9c
	cp a			;9a9d
	nop			;9a9e
	rst 38h			;9a9f
	nop			;9aa0
	or 0ffh			;9aa1
	nop			;9aa3
	call m,00000h		;9aa4
	ccf			;9aa7
	nop			;9aa8
	rst 38h			;9aa9
	nop			;9aaa
	xor d			;9aab
	rst 38h			;9aac
	nop			;9aad
	rst 38h			;9aae
	nop			;9aaf
	ret nz			;9ab0
	rra			;9ab1
	nop			;9ab2
	defb 0fdh,001h,07ch ;illegal sequence	;9ab3
	rst 38h			;9ab6
	nop			;9ab7
	rst 38h			;9ab8
	nop			;9ab9
	ret po			;9aba
	rlca			;9abb
	nop			;9abc
	rst 38h			;9abd
	inc bc			;9abe
	ret nz			;9abf
	rst 38h			;9ac0
	nop			;9ac1
	rst 38h			;9ac2
	nop			;9ac3
	ret m			;9ac4
	nop			;9ac5
	nop			;9ac6
	nop			;9ac7
	ccf			;9ac8
	nop			;9ac9
	rst 38h			;9aca
	nop			;9acb
	ex af,af'		;9acc
	dec b			;9acd
	nop			;9ace
	ld d,b			;9acf
	sbc a,l			;9ad0
	rst 38h			;9ad1
	nop			;9ad2
	rst 38h			;9ad3
	nop			;9ad4
	rst 38h			;9ad5
	nop			;9ad6
	rst 38h			;9ad7
	nop			;9ad8
	rst 38h			;9ad9
	nop			;9ada
	cp 000h			;9adb
	rrca			;9add
	nop			;9ade
	rst 38h			;9adf
	nop			;9ae0
	rst 38h			;9ae1
	nop			;9ae2
	rst 38h			;9ae3
	nop			;9ae4
	ret m			;9ae5
	ld bc,lf003h		;9ae6
	rst 38h			;9ae9
	nop			;9aea
	rst 38h			;9aeb
	nop			;9aec
	rst 38h			;9aed
	nop			;9aee
	ret p			;9aef
	rlca			;9af0
	ld bc,lfffch		;9af1
	nop			;9af4
	rst 38h			;9af5
	nop			;9af6
	rst 38h			;9af7
	nop			;9af8
	ret po			;9af9
	rrca			;9afa
	nop			;9afb
	cp 07fh			;9afc
	nop			;9afe
	rst 38h			;9aff
	nop			;9b00
	rst 38h			;9b01
	nop			;9b02
	ret po			;9b03
	dec c			;9b04
	nop			;9b05
	ld a,a			;9b06
	ccf			;9b07
	add a,b			;9b08
	rst 38h			;9b09
	nop			;9b0a
	rst 38h			;9b0b
	nop			;9b0c
	ret nz			;9b0d
	ld d,000h		;9b0e
	and 01fh		;9b10
	ret nz			;9b12
	rst 38h			;9b13
	nop			;9b14
	rst 38h			;9b15
	nop			;9b16
	ret nz			;9b17
	inc de			;9b18
	nop			;9b19
	push bc			;9b1a
	rra			;9b1b
	ret nz			;9b1c
	rst 38h			;9b1d
	nop			;9b1e
	rst 38h			;9b1f
	nop			;9b20
	ret nz			;9b21
	dec d			;9b22
	nop			;9b23
	dec (hl)		;9b24
	ld c,0e0h		;9b25
	ccf			;9b27
	nop			;9b28
	rst 38h			;9b29
	nop			;9b2a
	add a,b			;9b2b
	dec l			;9b2c
	nop			;9b2d
	ld (hl),l		;9b2e
	inc b			;9b2f
	pop af			;9b30
	rra			;9b31
	ret nz			;9b32
	rst 38h			;9b33
	nop			;9b34
	add a,b			;9b35
	inc sp			;9b36
	nop			;9b37
	adc a,l			;9b38
	inc b			;9b39
	pop af			;9b3a
	rrca			;9b3b
	ld h,b			;9b3c
	rst 38h			;9b3d
	nop			;9b3e
	add a,b			;9b3f
	ccf			;9b40
	nop			;9b41
	ei			;9b42
	nop			;9b43
	ei			;9b44
	rrca			;9b45
	ld h,b			;9b46
	rst 38h			;9b47
	nop			;9b48
	add a,b			;9b49
	ccf			;9b4a
	nop			;9b4b
	ld a,(hl)		;9b4c
	nop			;9b4d
	ld a,l			;9b4e
	rrca			;9b4f
	and b			;9b50
	rst 38h			;9b51
	nop			;9b52
	add a,b			;9b53
	inc (hl)		;9b54
	nop			;9b55
	ld l,080h		;9b56
	ccf			;9b58
	rlca			;9b59
	or b			;9b5a
	rst 38h			;9b5b
	nop			;9b5c
	ret nz			;9b5d
	inc b			;9b5e
	nop			;9b5f
	ld l,0c0h		;9b60
	rra			;9b62
	rlca			;9b63
	or b			;9b64
	rst 38h			;9b65
	nop			;9b66
	ret p			;9b67
	ld (bc),a		;9b68
	nop			;9b69
	ld (hl),000h		;9b6a
	rra			;9b6c
	inc bc			;9b6d
	ld e,b			;9b6e
	rst 38h			;9b6f
	nop			;9b70
	ret p			;9b71
	ld (bc),a		;9b72
	nop			;9b73
	inc d			;9b74
	nop			;9b75
	rst 28h			;9b76
	inc bc			;9b77
	sbc a,b			;9b78
	rst 38h			;9b79
	nop			;9b7a
	ret po			;9b7b
	inc c			;9b7c
	nop			;9b7d
	dec d			;9b7e
	nop			;9b7f
	cp a			;9b80
	inc bc			;9b81
	ld c,b			;9b82
	rst 38h			;9b83
	nop			;9b84
	ret nz			;9b85
	jr l9b88h		;9b86
l9b88h:
	dec (hl)		;9b88
	nop			;9b89
	cp a			;9b8a
	inc bc			;9b8b
	sbc a,b			;9b8c
	rst 38h			;9b8d
	nop			;9b8e
	ret nz			;9b8f
	rra			;9b90
	nop			;9b91
	defb 0edh ;next byte illegal after ed	;9b92
	nop			;9b93
	cp a			;9b94
	inc bc			;9b95
	ld e,b			;9b96
	rst 38h			;9b97
	nop			;9b98
	ret po			;9b99
	rrca			;9b9a
	nop			;9b9b
	ld sp,hl		;9b9c
	nop			;9b9d
	rst 18h			;9b9e
	inc bc			;9b9f
	sbc a,b			;9ba0
	rst 38h			;9ba1
	nop			;9ba2
	ret p			;9ba3
	inc bc			;9ba4
	ld b,0f0h		;9ba5
	nop			;9ba7
	rst 18h			;9ba8
	inc bc			;9ba9
	ld e,b			;9baa
	rst 38h			;9bab
	nop			;9bac
	call m,00e00h		;9bad
	nop			;9bb0
	nop			;9bb1
	rst 18h			;9bb2
	inc bc			;9bb3
	cp b			;9bb4
	rst 38h			;9bb5
	nop			;9bb6
	rst 38h			;9bb7
	nop			;9bb8
	cp 000h			;9bb9
	nop			;9bbb
	rst 18h			;9bbc
	rlca			;9bbd
	jr nc,$+1		;9bbe
	nop			;9bc0
	rst 38h			;9bc1
	nop			;9bc2
	cp 000h			;9bc3
	nop			;9bc5
	rst 18h			;9bc6
	rlca			;9bc7
	or b			;9bc8
	rst 38h			;9bc9
	nop			;9bca
	rst 38h			;9bcb
	nop			;9bcc
	rst 38h			;9bcd
	nop			;9bce
	nop			;9bcf
	ld l,a			;9bd0
	rlca			;9bd1
	or b			;9bd2
	rst 38h			;9bd3
	nop			;9bd4
	rst 38h			;9bd5
	nop			;9bd6
	rst 38h			;9bd7
	nop			;9bd8
	nop			;9bd9
	ld l,a			;9bda
	rlca			;9bdb
	ld (hl),b		;9bdc
	rst 38h			;9bdd
	nop			;9bde
	rst 38h			;9bdf
	nop			;9be0
	cp 000h			;9be1
	nop			;9be3
	rst 28h			;9be4
	rlca			;9be5
	ld (hl),b		;9be6
	rst 38h			;9be7
	nop			;9be8
	rst 38h			;9be9
	nop			;9bea
	cp 000h			;9beb
	nop			;9bed
	xor 007h		;9bee
	ret p			;9bf0
	rst 38h			;9bf1
	nop			;9bf2
	rst 38h			;9bf3
	nop			;9bf4
	cp 000h			;9bf5
	nop			;9bf7
	defb 0edh ;next byte illegal after ed	;9bf8
	rrca			;9bf9
	ret po			;9bfa
	rst 38h			;9bfb
	nop			;9bfc
	rst 38h			;9bfd
	nop			;9bfe
	call m,00001h		;9bff
	in a,(00fh)		;9c02
	ret po			;9c04
	rst 38h			;9c05
	nop			;9c06
	rst 38h			;9c07
	nop			;9c08
	ret m			;9c09
	ld bc,0d700h		;9c0a
	rra			;9c0d
	ret nz			;9c0e
	rst 38h			;9c0f
	nop			;9c10
	rst 38h			;9c11
	nop			;9c12
	ret p			;9c13
	rlca			;9c14
	nop			;9c15
	rst 8			;9c16
	ccf			;9c17
	add a,b			;9c18
	rst 38h			;9c19
	nop			;9c1a
	rst 38h			;9c1b
	nop			;9c1c
	ret po			;9c1d
	inc bc			;9c1e
	nop			;9c1f
	rra			;9c20
	ld a,a			;9c21
	nop			;9c22
	rst 38h			;9c23
	nop			;9c24
	rst 38h			;9c25
	nop			;9c26
	ret nz			;9c27
	inc e			;9c28
	nop			;9c29
	cp 03fh			;9c2a
	add a,b			;9c2c
	rst 38h			;9c2d
	nop			;9c2e
	pop af			;9c2f
	nop			;9c30
	add a,b			;9c31
	ccf			;9c32
	nop			;9c33
	defb 0fdh,03fh,080h ;illegal sequence	;9c34
	rst 38h			;9c37
	nop			;9c38
	ret po			;9c39
	ld c,000h		;9c3a
	ld a,a			;9c3c
	nop			;9c3d
	sub e			;9c3e
	ld a,a			;9c3f
	nop			;9c40
	rst 38h			;9c41
	nop			;9c42
	ret nz			;9c43
	ld e,000h		;9c44
	ret m			;9c46
	nop			;9c47
	ld l,(hl)		;9c48
	rst 38h			;9c49
	nop			;9c4a
	rst 38h			;9c4b
	nop			;9c4c
	add a,b			;9c4d
	inc a			;9c4e
	ld b,0f0h		;9c4f
	ld bc,lffcch		;9c51
	nop			;9c54
	rst 38h			;9c55
	nop			;9c56
	add a,b			;9c57
	dec a			;9c58
	ld b,0f0h		;9c59
	inc bc			;9c5b
	ret c			;9c5c
	rst 38h			;9c5d
	nop			;9c5e
	rst 38h			;9c5f
	nop			;9c60
	add a,b			;9c61
	dec a			;9c62
	inc b			;9c63
	pop af			;9c64
	inc bc			;9c65
	sbc a,b			;9c66
	rst 38h			;9c67
	nop			;9c68
	rst 38h			;9c69
	nop			;9c6a
	add a,b			;9c6b
	dec a			;9c6c
	nop			;9c6d
	ld sp,hl		;9c6e
	rlca			;9c6f
	or b			;9c70
	rst 38h			;9c71
	nop			;9c72
	rst 38h			;9c73
	nop			;9c74
	nop			;9c75
	ld a,c			;9c76
	nop			;9c77
	cp l			;9c78
	rlca			;9c79
	jr nc,$+1		;9c7a
	nop			;9c7c
	rst 38h			;9c7d
	nop			;9c7e
	nop			;9c7f
	ld (hl),e		;9c80
	nop			;9c81
	defb 0edh ;next byte illegal after ed	;9c82
	rrca			;9c83
	ld h,b			;9c84
	rst 38h			;9c85
	nop			;9c86
	rst 38h			;9c87
	nop			;9c88
	nop			;9c89
	ld (hl),e		;9c8a
	nop			;9c8b
	cp (hl)			;9c8c
	rrca			;9c8d
	ld h,b			;9c8e
	rst 38h			;9c8f
	nop			;9c90
	rst 38h			;9c91
	nop			;9c92
	nop			;9c93
	ld (hl),a		;9c94
	nop			;9c95
	or (hl)			;9c96
	rrca			;9c97
	ld h,b			;9c98
	rst 38h			;9c99
	nop			;9c9a
	rst 38h			;9c9b
	nop			;9c9c
	nop			;9c9d
	ld l,a			;9c9e
	nop			;9c9f
	rst 38h			;9ca0
	rrca			;9ca1
	jr nz,$+1		;9ca2
	nop			;9ca4
	rst 38h			;9ca5
	nop			;9ca6
	nop			;9ca7
	ld l,h			;9ca8
	nop			;9ca9
	rst 20h			;9caa
	rlca			;9cab
	ret nc			;9cac
	rst 38h			;9cad
	nop			;9cae
	rst 38h			;9caf
	nop			;9cb0
	add a,c			;9cb1
	inc h			;9cb2
	nop			;9cb3
	ld a,c			;9cb4
	rlca			;9cb5
	ret nc			;9cb6
	rst 38h			;9cb7
	nop			;9cb8
	rst 38h			;9cb9
	nop			;9cba
	in a,(000h)		;9cbb
	add a,b			;9cbd
	inc a			;9cbe
	rrca			;9cbf
	jr nz,$+1		;9cc0
	nop			;9cc2
	rst 38h			;9cc3
	nop			;9cc4
	rst 38h			;9cc5
	nop			;9cc6
	ret nz			;9cc7
	rra			;9cc8
	rrca			;9cc9
	ld h,b			;9cca
	rst 38h			;9ccb
	nop			;9ccc
	rst 38h			;9ccd
	nop			;9cce
	rst 38h			;9ccf
	nop			;9cd0
	ret po			;9cd1
	inc bc			;9cd2
	rrca			;9cd3
	ld h,b			;9cd4
	rst 38h			;9cd5
	nop			;9cd6
	rst 38h			;9cd7
	nop			;9cd8
	rst 38h			;9cd9
	nop			;9cda
	call m,00f00h		;9cdb
	ld h,b			;9cde
	rst 38h			;9cdf
	nop			;9ce0
	rst 38h			;9ce1
	nop			;9ce2
	rst 38h			;9ce3
	nop			;9ce4
	call m,00100h		;9ce5
	jr nc,$+1		;9ce8
	nop			;9cea
	rst 38h			;9ceb
	nop			;9cec
	rst 38h			;9ced
	nop			;9cee
	ret p			;9cef
	inc bc			;9cf0
	nop			;9cf1
	ld a,07fh		;9cf2
	nop			;9cf4
	rst 38h			;9cf5
	nop			;9cf6
	rst 38h			;9cf7
	nop			;9cf8
	add a,b			;9cf9
	rrca			;9cfa
	nop			;9cfb
	defb 0ddh,03fh,080h ;illegal sequence	;9cfc
	rst 38h			;9cff
l9d00h:
	nop			;9d00
	call m,00000h		;9d01
	ld a,a			;9d04
	nop			;9d05
	ld a,01fh		;9d06
	ret nz			;9d08
	rst 38h			;9d09
	nop			;9d0a
	ret m			;9d0b
	inc bc			;9d0c
	nop			;9d0d
	sbc a,b			;9d0e
	nop			;9d0f
	rst 38h			;9d10
	rrca			;9d11
	ld h,b			;9d12
	rst 38h			;9d13
	nop			;9d14
	ret p			;9d15
	inc b			;9d16
	nop			;9d17
	ld h,a			;9d18
	nop			;9d19
	cp 00fh			;9d1a
	and b			;9d1c
	rst 38h			;9d1d
l9d1eh:
	nop			;9d1e
	ret po			;9d1f
	dec bc			;9d20
	nop			;9d21
	rst 38h			;9d22
	nop			;9d23
	rst 38h			;9d24
	rrca			;9d25
	ld h,b			;9d26
	rst 38h			;9d27
	nop			;9d28
	ret po			;9d29
	dec bc			;9d2a
	nop			;9d2b
	rst 38h			;9d2c
	nop			;9d2d
	jp m,0a00fh		;9d2e
	rst 38h			;9d31
	nop			;9d32
	ret p			;9d33
	dec b			;9d34
	nop			;9d35
	rst 38h			;9d36
	nop			;9d37
	rst 10h			;9d38
	rra			;9d39
	ret nz			;9d3a
	rst 38h			;9d3b
	nop			;9d3c
	ret m			;9d3d
	ld (bc),a		;9d3e
	nop			;9d3f
	ld a,a			;9d40
	nop			;9d41
	call m,0003fh		;9d42
	rst 38h			;9d45
	nop			;9d46
	defb 0fdh,000h,080h ;illegal sequence	;9d47
	nop			;9d4a
	inc bc			;9d4b
	nop			;9d4c
	rst 38h			;9d4d
	nop			;9d4e
	rst 38h			;9d4f
	nop			;9d50
	ex af,af'		;9d51
	dec b			;9d52
	nop			;9d53
	push de			;9d54
	sbc a,a			;9d55
	rst 38h			;9d56
	nop			;9d57
	rst 38h			;9d58
	nop			;9d59
	rst 38h			;9d5a
	nop			;9d5b
	rst 38h			;9d5c
	nop			;9d5d
	rst 38h			;9d5e
	nop			;9d5f
	rst 38h			;9d60
	nop			;9d61
	rst 38h			;9d62
	nop			;9d63
	rst 38h			;9d64
	nop			;9d65
	rst 38h			;9d66
	nop			;9d67
	rst 38h			;9d68
	nop			;9d69
	cp 000h			;9d6a
	rrca			;9d6c
	nop			;9d6d
	rst 38h			;9d6e
l9d6fh:
	nop			;9d6f
	rst 38h			;9d70
	nop			;9d71
	rst 38h			;9d72
	nop			;9d73
	ret m			;9d74
	ld bc,lf003h		;9d75
	rst 38h			;9d78
	nop			;9d79
	rst 38h			;9d7a
	nop			;9d7b
	rst 38h			;9d7c
	nop			;9d7d
	ret p			;9d7e
	rlca			;9d7f
	ld bc,lfffch		;9d80
	nop			;9d83
	rst 38h			;9d84
	nop			;9d85
	rst 38h			;9d86
	nop			;9d87
	ret po			;9d88
	rrca			;9d89
	nop			;9d8a
	cp 07fh			;9d8b
	nop			;9d8d
	rst 38h			;9d8e
	nop			;9d8f
	rst 38h			;9d90
	nop			;9d91
	ret po			;9d92
	dec c			;9d93
	nop			;9d94
	ld a,a			;9d95
	ccf			;9d96
	add a,b			;9d97
	rst 38h			;9d98
	nop			;9d99
	rst 38h			;9d9a
	nop			;9d9b
	ret nz			;9d9c
	ld d,000h		;9d9d
	and 01ch		;9d9f
	ret nz			;9da1
	ld a,a			;9da2
	nop			;9da3
	rst 38h			;9da4
	nop			;9da5
	ret nz			;9da6
	inc de			;9da7
	nop			;9da8
	push bc			;9da9
	jr l9d6fh		;9daa
	ccf			;9dac
	add a,b			;9dad
	rst 38h			;9dae
	nop			;9daf
	ret nz			;9db0
	dec d			;9db1
	nop			;9db2
	dec (hl)		;9db3
	nop			;9db4
	ex (sp),hl		;9db5
	rra			;9db6
	ret nz			;9db7
	rst 38h			;9db8
	nop			;9db9
	add a,b			;9dba
	dec l			;9dbb
	nop			;9dbc
	ld (hl),l		;9dbd
	nop			;9dbe
	rst 30h			;9dbf
	rrca			;9dc0
	ld h,b			;9dc1
	rst 38h			;9dc2
	nop			;9dc3
	add a,b			;9dc4
	inc sp			;9dc5
	nop			;9dc6
	adc a,l			;9dc7
	nop			;9dc8
	rst 30h			;9dc9
	rrca			;9dca
	ld h,b			;9dcb
	rst 38h			;9dcc
	nop			;9dcd
	add a,b			;9dce
	ccf			;9dcf
	nop			;9dd0
	ei			;9dd1
	nop			;9dd2
	ei			;9dd3
	rrca			;9dd4
	and b			;9dd5
	rst 38h			;9dd6
	nop			;9dd7
	add a,b			;9dd8
	ccf			;9dd9
	nop			;9dda
	ld a,(hl)		;9ddb
	nop			;9ddc
	ld a,a			;9ddd
	rlca			;9dde
	or b			;9ddf
	rst 38h			;9de0
	nop			;9de1
	add a,b			;9de2
	inc (hl)		;9de3
	nop			;9de4
	ld l,000h		;9de5
	ccf			;9de7
	rlca			;9de8
	or b			;9de9
	rst 38h			;9dea
	nop			;9deb
	ret nz			;9dec
	inc b			;9ded
	nop			;9dee
	ld l,000h		;9def
	ld e,a			;9df1
	inc bc			;9df2
	ld e,b			;9df3
	rst 38h			;9df4
	nop			;9df5
	ret p			;9df6
	ld (bc),a		;9df7
	nop			;9df8
	ld (hl),000h		;9df9
	ld e,a			;9dfb
	inc bc			;9dfc
	cp b			;9dfd
	rst 38h			;9dfe
	nop			;9dff
l9e00h:
	ret p			;9e00
	ld (bc),a		;9e01
	nop			;9e02
	inc d			;9e03
	nop			;9e04
	rst 28h			;9e05
	inc bc			;9e06
	ld e,b			;9e07
	rst 38h			;9e08
	nop			;9e09
	ret po			;9e0a
	ld c,000h		;9e0b
	dec d			;9e0d
	nop			;9e0e
	cp a			;9e0f
	inc bc			;9e10
	cp b			;9e11
	rst 38h			;9e12
	nop			;9e13
	ret nz			;9e14
	rra			;9e15
	nop			;9e16
	defb 0edh ;next byte illegal after ed	;9e17
	nop			;9e18
	cp a			;9e19
	inc bc			;9e1a
	ld e,b			;9e1b
	rst 38h			;9e1c
	nop			;9e1d
	ret nz			;9e1e
	rra			;9e1f
	nop			;9e20
	defb 0fdh,000h,0bfh ;illegal sequence	;9e21
	inc bc			;9e24
	cp b			;9e25
	rst 38h			;9e26
	nop			;9e27
	ret po			;9e28
	rlca			;9e29
	nop			;9e2a
	pop af			;9e2b
	nop			;9e2c
	rst 18h			;9e2d
	inc bc			;9e2e
	ld a,b			;9e2f
	rst 38h			;9e30
	nop			;9e31
	ret m			;9e32
	nop			;9e33
	inc c			;9e34
	nop			;9e35
	nop			;9e36
	rst 18h			;9e37
	inc bc			;9e38
	cp b			;9e39
	rst 38h			;9e3a
	nop			;9e3b
	rst 38h			;9e3c
	nop			;9e3d
	cp 000h			;9e3e
	nop			;9e40
	rst 18h			;9e41
	rlca			;9e42
	ld (hl),b		;9e43
	rst 38h			;9e44
	nop			;9e45
	rst 38h			;9e46
	nop			;9e47
	cp 000h			;9e48
	nop			;9e4a
	rst 18h			;9e4b
	rlca			;9e4c
	or b			;9e4d
	rst 38h			;9e4e
	nop			;9e4f
	rst 38h			;9e50
	nop			;9e51
	rst 38h			;9e52
	nop			;9e53
	nop			;9e54
	ld l,a			;9e55
	rlca			;9e56
	ld (hl),b		;9e57
	rst 38h			;9e58
	nop			;9e59
	rst 38h			;9e5a
	nop			;9e5b
	rst 38h			;9e5c
	nop			;9e5d
	nop			;9e5e
	ld l,(hl)		;9e5f
	rrca			;9e60
	ret po			;9e61
	rst 38h			;9e62
	nop			;9e63
	rst 38h			;9e64
	nop			;9e65
	cp 000h			;9e66
	nop			;9e68
	defb 0edh ;next byte illegal after ed	;9e69
	rrca			;9e6a
	ret po			;9e6b
	rst 38h			;9e6c
	nop			;9e6d
	rst 38h			;9e6e
	nop			;9e6f
	cp 000h			;9e70
	nop			;9e72
	ret			;9e73
	rrca			;9e74
	ret po			;9e75
	rst 38h			;9e76
	nop			;9e77
	rst 38h			;9e78
	nop			;9e79
	ret m			;9e7a
	ld bc,sub_c700h		;9e7b
	rra			;9e7e
	ret nz			;9e7f
	rst 38h			;9e80
	nop			;9e81
	rst 38h			;9e82
	nop			;9e83
	ret p			;9e84
	ld b,000h		;9e85
	rra			;9e87
	rrca			;9e88
	and b			;9e89
	rst 38h			;9e8a
	nop			;9e8b
	rst 38h			;9e8c
	nop			;9e8d
	ret p			;9e8e
	ld bc,sub_feffh+1	;9e8f
	rrca			;9e92
	ld h,b			;9e93
	rst 38h			;9e94
	nop			;9e95
	rst 38h			;9e96
	nop			;9e97
	ret nz			;9e98
	rra			;9e99
	nop			;9e9a
	call m,le00fh		;9e9b
	rst 38h			;9e9e
	nop			;9e9f
	rst 38h			;9ea0
	nop			;9ea1
	add a,b			;9ea2
	ccf			;9ea3
	nop			;9ea4
	inc bc			;9ea5
	rra			;9ea6
	ret nz			;9ea7
	rst 38h			;9ea8
	nop			;9ea9
	rst 38h			;9eaa
	nop			;9eab
	nop			;9eac
	ld a,h			;9ead
	nop			;9eae
	ld a,a			;9eaf
	rra			;9eb0
	ret nz			;9eb1
	rst 38h			;9eb2
	nop			;9eb3
	cp 000h			;9eb4
	inc bc			;9eb6
	ret m			;9eb7
	nop			;9eb8
	ld a,a			;9eb9
	ccf			;9eba
	add a,b			;9ebb
	rst 38h			;9ebc
	nop			;9ebd
	cp 000h			;9ebe
	rlca			;9ec0
	ret p			;9ec1
	nop			;9ec2
	ld a,a			;9ec3
	ld a,a			;9ec4
	nop			;9ec5
	rst 38h			;9ec6
	nop			;9ec7
	call m,00701h		;9ec8
	ret p			;9ecb
l9ecch:
	nop			;9ecc
	ld l,(hl)		;9ecd
	rst 38h			;9ece
	nop			;9ecf
	rst 38h			;9ed0
	nop			;9ed1
	call m,00701h		;9ed2
	ret p			;9ed5
	ld bc,lff6ch		;9ed6
	nop			;9ed9
	rst 38h			;9eda
	nop			;9edb
	ret m			;9edc
	ld bc,lf803h		;9edd
	ld bc,lff6ch		;9ee0
	nop			;9ee3
	rst 38h			;9ee4
	nop			;9ee5
	ret p			;9ee6
	dec b			;9ee7
	ld bc,003bch		;9ee8
	ld e,b			;9eeb
	rst 38h			;9eec
	nop			;9eed
	rst 38h			;9eee
	nop			;9eef
	ret po			;9ef0
	dec bc			;9ef1
	nop			;9ef2
	call pe,05803h		;9ef3
	rst 38h			;9ef6
	nop			;9ef7
	rst 38h			;9ef8
	nop			;9ef9
	ret nz			;9efa
	dec de			;9efb
	nop			;9efc
	cp (hl)			;9efd
	rlca			;9efe
	jr nc,$+1		;9eff
	nop			;9f01
	rst 38h			;9f02
	nop			;9f03
	add a,b			;9f04
	scf			;9f05
	nop			;9f06
	or (hl)			;9f07
	rlca			;9f08
	jr nc,$+1		;9f09
	nop			;9f0b
l9f0ch:
	rst 38h			;9f0c
	nop			;9f0d
	nop			;9f0e
	ld l,a			;9f0f
	nop			;9f10
	rst 38h			;9f11
	rlca			;9f12
	jr nc,$+1		;9f13
	nop			;9f15
	rst 38h			;9f16
	nop			;9f17
	nop			;9f18
	ld l,h			;9f19
	nop			;9f1a
	rst 20h			;9f1b
	rlca			;9f1c
	ret nc			;9f1d
	rst 38h			;9f1e
	nop			;9f1f
	rst 38h			;9f20
	nop			;9f21
	nop			;9f22
	ld h,l			;9f23
	nop			;9f24
	ld a,c			;9f25
	inc bc			;9f26
	ret nc			;9f27
	rst 38h			;9f28
	nop			;9f29
	rst 38h			;9f2a
	nop			;9f2b
	nop			;9f2c
	ld l,d			;9f2d
	add a,b			;9f2e
	inc a			;9f2f
	inc bc			;9f30
	jr z,$+1		;9f31
	nop			;9f33
	rst 38h			;9f34
	nop			;9f35
	ld bc,lc06ch		;9f36
	rra			;9f39
	inc bc			;9f3a
	ld l,b			;9f3b
	rst 38h			;9f3c
	nop			;9f3d
	rst 38h			;9f3e
	nop			;9f3f
	nop			;9f40
	ld l,(hl)		;9f41
	ret po			;9f42
	inc bc			;9f43
	inc bc			;9f44
	ld e,b			;9f45
	rst 38h			;9f46
	nop			;9f47
	rst 38h			;9f48
	nop			;9f49
	add a,b			;9f4a
	ld h,0fch		;9f4b
	nop			;9f4d
	inc bc			;9f4e
	ret c			;9f4f
	rst 38h			;9f50
	nop			;9f51
	rst 38h			;9f52
	nop			;9f53
	exx			;9f54
	nop			;9f55
	call m,00301h		;9f56
	sbc a,b			;9f59
	rst 38h			;9f5a
	nop			;9f5b
	rst 38h			;9f5c
	nop			;9f5d
	rst 38h			;9f5e
	nop			;9f5f
	call m,00101h		;9f60
	sbc a,h			;9f63
	rst 38h			;9f64
	nop			;9f65
	rst 38h			;9f66
	nop			;9f67
	rst 38h			;9f68
	nop			;9f69
	ret m			;9f6a
	inc bc			;9f6b
	nop			;9f6c
	inc c			;9f6d
	rst 38h			;9f6e
l9f6fh:
	nop			;9f6f
	rst 38h			;9f70
	nop			;9f71
	rst 8			;9f72
	nop			;9f73
	ret m			;9f74
	inc bc			;9f75
	ld (hl),b		;9f76
	rlca			;9f77
	ld a,a			;9f78
	nop			;9f79
	rst 38h			;9f7a
	nop			;9f7b
	add a,e			;9f7c
	jr nc,l9f6fh		;9f7d
	inc bc			;9f7f
	ld a,b			;9f80
	inc bc			;9f81
	rlca			;9f82
	nop			;9f83
	rst 38h			;9f84
	nop			;9f85
	nop			;9f86
	ld a,h			;9f87
	nop			;9f88
	rrca			;9f89
	jr c,l9f0ch		;9f8a
	inc bc			;9f8c
	ret m			;9f8d
	rst 38h			;9f8e
	nop			;9f8f
	nop			;9f90
	ld a,a			;9f91
	nop			;9f92
	rst 38h			;9f93
	nop			;9f94
	ld b,a			;9f95
	ld bc,lffd4h		;9f96
	nop			;9f99
	nop			;9f9a
	ld a,a			;9f9b
	nop			;9f9c
	cp 000h			;9f9d
	xor a			;9f9f
	ld bc,lffech		;9fa0
	nop			;9fa3
	nop			;9fa4
	ld a,a			;9fa5
	nop			;9fa6
	rst 38h			;9fa7
	nop			;9fa8
	ld l,a			;9fa9
	ld bc,lff54h		;9faa
	nop			;9fad
	nop			;9fae
	ld a,a			;9faf
	nop			;9fb0
	cp 000h			;9fb1
	xor (hl)		;9fb3
	ld bc,lffach		;9fb4
	nop			;9fb7
	add a,b			;9fb8
	ccf			;9fb9
	nop			;9fba
	defb 0fdh,000h,06dh ;illegal sequence	;9fbb
	inc bc			;9fbe
	ld a,b			;9fbf
	rst 38h			;9fc0
	nop			;9fc1
	ret nz			;9fc2
	inc bc			;9fc3
	nop			;9fc4
	rst 38h			;9fc5
	nop			;9fc6
	sbc a,a			;9fc7
	rlca			;9fc8
	add a,b			;9fc9
	rst 38h			;9fca
	nop			;9fcb
	call m,00000h		;9fcc
	nop			;9fcf
	ld h,b			;9fd0
	nop			;9fd1
	ld a,a			;9fd2
	nop			;9fd3
	rst 38h			;9fd4
	nop			;9fd5
sub_9fd6h:
	ld a,(la633h)		;9fd6
	cp 004h			;9fd9
	jp z,la039h		;9fdb
	cp 005h			;9fde
	jp z,la0a4h		;9fe0
	ld iy,la157h		;9fe3
	ld h,020h		;9fe7
	ld l,028h		;9fe9
	call sub_7d67h		;9feb
	jp nc,la01ah		;9fee
	ld a,(la016h)		;9ff1
	dec a			;9ff4
	ld (la016h),a		;9ff5
	cp 000h			;9ff8
	ret nz			;9ffa
	ld a,002h		;9ffb
	ld (la016h),a		;9ffd
	ld a,(la157h)		;a000
	cp 0c0h			;a003
	jp z,la02eh		;a005
	add a,004h		;a008
	ld (la157h),a		;a00a
	ld a,(la6b0h)		;a00d
	add a,004h		;a010
	ld (la6b0h),a		;a012
	ret			;a015
la016h:
	ld (bc),a		;a016
la017h:
	ld (bc),a		;a017
la018h:
	ld (bc),a		;a018
la019h:
	ld (bc),a		;a019
la01ah:
	ld a,(la157h)		;a01a
	cp 0a8h			;a01d
	ret z			;a01f
	sub 004h		;a020
	ld (la157h),a		;a022
	ld a,(la6b0h)		;a025
	sub 004h		;a028
	ld (la6b0h),a		;a02a
	ret			;a02d
la02eh:
	ld a,028h		;a02e
	ld (la157h),a		;a030
	ld a,028h		;a033
	ld (la6b0h),a		;a035
	ret			;a038
la039h:
	ld iy,la133h		;a039
	ld h,020h		;a03d
	ld l,028h		;a03f
	call sub_7d67h		;a041
	jp nc,la06ch		;a044
	ld a,(la017h)		;a047
	dec a			;a04a
	ld (la017h),a		;a04b
	cp 000h			;a04e
	ret nz			;a050
	ld a,002h		;a051
	ld (la017h),a		;a053
	ld a,(la133h)		;a056
	cp 0c0h			;a059
	jp z,la083h		;a05b
	add a,004h		;a05e
	ld (la133h),a		;a060
	ld a,(la6a2h)		;a063
	add a,004h		;a066
	ld (la6a2h),a		;a068
	ret			;a06b
la06ch:
	ld a,(la133h)		;a06c
	cp 0a8h			;a06f
	ret z			;a071
	ld a,(la133h)		;a072
	sub 004h		;a075
	ld (la133h),a		;a077
	ld a,(la6a2h)		;a07a
	sub 004h		;a07d
	ld (la6a2h),a		;a07f
	ret			;a082
la083h:
	ld a,028h		;a083
	ld (la133h),a		;a085
	ld a,028h		;a088
	ld (la6a2h),a		;a08a
	ret			;a08d
la08eh:
	ld a,028h		;a08e
	ld (la13fh),a		;a090
	ld a,028h		;a093
	ld (la6a7h),a		;a095
	ret			;a098
la099h:
	ld a,028h		;a099
	ld (la14bh),a		;a09b
	ld a,028h		;a09e
	ld (0a6abh),a		;a0a0
	ret			;a0a3
la0a4h:
	ld iy,la13fh		;a0a4
	ld h,020h		;a0a8
	ld l,028h		;a0aa
	call sub_7d67h		;a0ac
	jp c,la0e9h		;a0af
	ld iy,la14bh		;a0b2
	ld h,020h		;a0b6
	ld l,028h		;a0b8
	call sub_7d67h		;a0ba
	jp c,la10eh		;a0bd
	ld a,(la13fh)		;a0c0
	cp 0a8h			;a0c3
	jp z,la0d5h		;a0c5
	sub 004h		;a0c8
	ld (la13fh),a		;a0ca
	ld a,(la6a7h)		;a0cd
	sub 004h		;a0d0
	ld (la6a7h),a		;a0d2
la0d5h:
	ld a,(la14bh)		;a0d5
	cp 0a8h			;a0d8
	ret z			;a0da
	sub 004h		;a0db
	ld (la14bh),a		;a0dd
	ld a,(0a6abh)		;a0e0
	sub 004h		;a0e3
	ld (0a6abh),a		;a0e5
	ret			;a0e8
la0e9h:
	ld a,(la018h)		;a0e9
	dec a			;a0ec
	ld (la018h),a		;a0ed
	cp 000h			;a0f0
	ret nz			;a0f2
	ld a,002h		;a0f3
	ld (la018h),a		;a0f5
	ld a,(la13fh)		;a0f8
	cp 0c0h			;a0fb
	jp z,la08eh		;a0fd
	add a,004h		;a100
	ld (la13fh),a		;a102
	ld a,(la6a7h)		;a105
	add a,004h		;a108
	ld (la6a7h),a		;a10a
	ret			;a10d
la10eh:
	ld a,(la019h)		;a10e
	dec a			;a111
	ld (la019h),a		;a112
	cp 000h			;a115
	ret nz			;a117
	ld a,002h		;a118
	ld (la019h),a		;a11a
	ld a,(la14bh)		;a11d
	cp 0c0h			;a120
	jp z,la099h		;a122
	add a,004h		;a125
	ld (la14bh),a		;a127
	ld a,(0a6abh)		;a12a
	add a,004h		;a12d
	ld (0a6abh),a		;a12f
	ret			;a132
la133h:
	xor b			;a133
	ret nc			;a134
	nop			;a135
	nop			;a136
	nop			;a137
	nop			;a138
	nop			;a139
	ld bc,00701h		;a13a
	ld h,e			;a13d
	and c			;a13e
la13fh:
	xor b			;a13f
	jr la142h		;a140
la142h:
	nop			;a142
	nop			;a143
	nop			;a144
	nop			;a145
	ld bc,00701h		;a146
	ld h,e			;a149
	and c			;a14a
la14bh:
	xor b			;a14b
la14ch:
	add a,b			;a14c
	nop			;a14d
	nop			;a14e
	nop			;a14f
	nop			;a150
	nop			;a151
	ld bc,00701h		;a152
	ld h,e			;a155
	and c			;a156
la157h:
	xor b			;a157
	jr la15ah		;a158
la15ah:
	nop			;a15a
	nop			;a15b
	nop			;a15c
	nop			;a15d
	ld bc,00701h		;a15e
	ld h,e			;a161
	and c			;a162
	inc bc			;a163
	dec b			;a164
	nop			;a165
	and a			;a166
	and d			;a167
	rst 38h			;a168
	nop			;a169
	rst 38h			;a16a
	nop			;a16b
	rst 38h			;a16c
	nop			;a16d
	rst 38h			;a16e
	nop			;a16f
	rst 38h			;a170
	nop			;a171
	rst 38h			;a172
	nop			;a173
	rst 38h			;a174
	nop			;a175
	ex (sp),hl		;a176
	nop			;a177
	rst 38h			;a178
	nop			;a179
	rst 38h			;a17a
	nop			;a17b
	rst 38h			;a17c
	nop			;a17d
	pop hl			;a17e
	nop			;a17f
	add a,b			;a180
	inc e			;a181
	rra			;a182
	nop			;a183
	rst 38h			;a184
	nop			;a185
	cp 000h			;a186
	nop			;a188
	ld e,000h		;a189
	ld a,a			;a18b
	inc bc			;a18c
	ret po			;a18d
	rst 38h			;a18e
	nop			;a18f
	ret p			;a190
	ld bc,lfb00h		;a191
	nop			;a194
	call m,sub_7c00h	;a195
	ld a,a			;a198
	nop			;a199
	ret po			;a19a
	rrca			;a19b
	nop			;a19c
	defb 0fdh,000h,0ffh ;illegal sequence	;a19d
	nop			;a1a0
	cp a			;a1a1
	rra			;a1a2
	add a,b			;a1a3
	ret nz			;a1a4
	rra			;a1a5
	nop			;a1a6
	rst 38h			;a1a7
	nop			;a1a8
	rst 38h			;a1a9
	nop			;a1aa
	rst 38h			;a1ab
	rrca			;a1ac
	ret po			;a1ad
	add a,b			;a1ae
	dec a			;a1af
	nop			;a1b0
	rst 38h			;a1b1
	nop			;a1b2
	rst 38h			;a1b3
	nop			;a1b4
	rst 38h			;a1b5
	inc bc			;a1b6
	ret p			;a1b7
	nop			;a1b8
	ld a,a			;a1b9
	nop			;a1ba
	rst 38h			;a1bb
	nop			;a1bc
	rst 38h			;a1bd
	nop			;a1be
	rst 38h			;a1bf
	ld bc,000fch		;a1c0
	ld e,a			;a1c3
	nop			;a1c4
	rst 38h			;a1c5
	nop			;a1c6
	rst 38h			;a1c7
	nop			;a1c8
	rst 38h			;a1c9
	nop			;a1ca
	sbc a,080h		;a1cb
	cpl			;a1cd
	nop			;a1ce
	rst 30h			;a1cf
	nop			;a1d0
	rst 38h			;a1d1
	nop			;a1d2
	rst 38h			;a1d3
	ld bc,l80fch		;a1d4
	scf			;a1d7
	nop			;a1d8
	cp 000h			;a1d9
	ld a,a			;a1db
	nop			;a1dc
	rst 38h			;a1dd
	nop			;a1de
	jp m,02b80h		;a1df
	nop			;a1e2
	rst 38h			;a1e3
	nop			;a1e4
	rst 38h			;a1e5
	nop			;a1e6
	cp 001h			;a1e7
	ld (hl),h		;a1e9
	add a,b			;a1ea
	inc (hl)		;a1eb
	nop			;a1ec
	rst 38h			;a1ed
	nop			;a1ee
	cp 000h			;a1ef
	ld (hl),a		;a1f1
	nop			;a1f2
	jp z,01bc0h		;a1f3
	nop			;a1f6
	rra			;a1f7
	nop			;a1f8
	pop af			;a1f9
	nop			;a1fa
	sbc a,h			;a1fb
	nop			;a1fc
	ld d,0c0h		;a1fd
	dec d			;a1ff
	nop			;a200
	rst 20h			;a201
	nop			;a202
	rst 0			;a203
	nop			;a204
	ex (sp),hl		;a205
	ld bc,lc0ach		;a206
	dec de			;a209
	nop			;a20a
	xor b			;a20b
	nop			;a20c
	scf			;a20d
	nop			;a20e
	rst 30h			;a20f
	inc bc			;a210
	ret m			;a211
	ret nz			;a212
	rla			;a213
	nop			;a214
	rst 10h			;a215
	nop			;a216
	rst 30h			;a217
	nop			;a218
	rst 38h			;a219
	ld bc,le0f4h		;a21a
	dec bc			;a21d
	nop			;a21e
	rst 30h			;a21f
	nop			;a220
	rst 28h			;a221
	nop			;a222
	rst 38h			;a223
	inc bc			;a224
	ret m			;a225
	ret p			;a226
	dec b			;a227
	nop			;a228
	rst 30h			;a229
	nop			;a22a
	rst 38h			;a22b
	nop			;a22c
	rst 38h			;a22d
	inc bc			;a22e
	ret m			;a22f
	ret p			;a230
	rlca			;a231
	nop			;a232
	ei			;a233
	nop			;a234
	rst 38h			;a235
	nop			;a236
	rst 38h			;a237
	rlca			;a238
	ret p			;a239
	ret p			;a23a
	dec b			;a23b
	nop			;a23c
	ei			;a23d
	nop			;a23e
	rst 38h			;a23f
	nop			;a240
	rst 38h			;a241
	rlca			;a242
	ret nc			;a243
	ret m			;a244
	ld (bc),a		;a245
	nop			;a246
	or 000h			;a247
	rst 38h			;a249
	nop			;a24a
	rst 38h			;a24b
	rrca			;a24c
	and b			;a24d
	ret m			;a24e
	inc bc			;a24f
	nop			;a250
	ld a,a			;a251
	nop			;a252
	rst 38h			;a253
	nop			;a254
	rst 38h			;a255
	rlca			;a256
	ld d,b			;a257
	call m,l8000h		;a258
	nop			;a25b
	nop			;a25c
	nop			;a25d
	nop			;a25e
	nop			;a25f
	xor a			;a260
	nop			;a261
	rst 38h			;a262
	nop			;a263
	rst 38h			;a264
	nop			;a265
	rst 38h			;a266
	nop			;a267
	rst 38h			;a268
	nop			;a269
	rst 38h			;a26a
	nop			;a26b
	rst 38h			;a26c
	nop			;a26d
	rst 38h			;a26e
	nop			;a26f
	rst 38h			;a270
	nop			;a271
	rst 38h			;a272
	nop			;a273
	rst 38h			;a274
	nop			;a275
	rst 38h			;a276
	nop			;a277
	rst 38h			;a278
	nop			;a279
	rst 38h			;a27a
	nop			;a27b
	rst 38h			;a27c
	nop			;a27d
	rst 38h			;a27e
	nop			;a27f
	rst 38h			;a280
	nop			;a281
	rst 38h			;a282
	nop			;a283
	rst 38h			;a284
	nop			;a285
la286h:
	rst 38h			;a286
	nop			;a287
	rst 38h			;a288
	nop			;a289
	rst 38h			;a28a
	nop			;a28b
	rst 38h			;a28c
	nop			;a28d
	rst 38h			;a28e
	nop			;a28f
	rst 38h			;a290
	nop			;a291
	rst 38h			;a292
	nop			;a293
	rst 38h			;a294
	nop			;a295
	rst 38h			;a296
	nop			;a297
	rst 38h			;a298
	nop			;a299
	rst 38h			;a29a
	nop			;a29b
	rst 38h			;a29c
	nop			;a29d
	rst 38h			;a29e
	nop			;a29f
	rst 38h			;a2a0
	nop			;a2a1
	rst 38h			;a2a2
	nop			;a2a3
	rst 38h			;a2a4
	nop			;a2a5
	rst 38h			;a2a6
	nop			;a2a7
la2a8h:
	nop			;a2a8
sub_a2a9h:
	ld a,(la84bh)		;a2a9
	cp 000h			;a2ac
	jp z,la306h		;a2ae
	ld iy,ldd5eh		;a2b1
	call sub_a2bch		;a2b5
	call sub_a2f7h		;a2b8
	ret			;a2bb
sub_a2bch:
	call sub_a2e1h		;a2bc
	ld a,(la2a8h)		;a2bf
	cp 000h			;a2c2
	jp nz,la2d4h		;a2c4
	ld a,(iy+001h)		;a2c7
	cp 000h			;a2ca
	jr z,la2eeh		;a2cc
	sub 008h		;a2ce
	ld (iy+001h),a		;a2d0
	ret			;a2d3
la2d4h:
	ld a,(iy+001h)		;a2d4
	cp 0c8h			;a2d7
	jr z,la2eeh		;a2d9
	add a,008h		;a2db
	ld (iy+001h),a		;a2dd
	ret			;a2e0
sub_a2e1h:
	ld a,(iy+008h)		;a2e1
	inc a			;a2e4
	cp 003h			;a2e5
	call z,sub_7e9dh	;a2e7
	ld (iy+008h),a		;a2ea
	ret			;a2ed
la2eeh:
	call sub_6dd2h		;a2ee
	ld a,000h		;a2f1
	ld (la84bh),a		;a2f3
	ret			;a2f6
sub_a2f7h:
	ld iy,ldd5eh		;a2f7
	ld h,028h		;a2fb
	ld l,030h		;a2fd
	call sub_7d67h		;a2ff
	jp c,sub_a7f1h		;a302
	ret			;a305
la306h:
	ld a,r			;a306
	and 01fh		;a308
	cp 000h			;a30a
	ret nz			;a30c
	ld a,r			;a30d
	and 020h		;a30f
	cp 000h			;a311
	jr nz,la338h		;a313
	ld ix,ldd5eh		;a315
	call sub_7609h		;a319
	ld a,001h		;a31c
	ld (la2a8h),a		;a31e
	ld (la84bh),a		;a321
	ld a,000h		;a324
	ld (ldd5fh),a		;a326
	ld a,090h		;a329
	ld (ldd5eh),a		;a32b
la32eh:
	call sub_6dach		;a32e
	ld hl,ldd5eh		;a331
	ld (la653h),hl		;a334
	ret			;a337
la338h:
	ld ix,ldd5eh		;a338
	call sub_75eeh		;a33c
	ld a,000h		;a33f
	ld (la2a8h),a		;a341
	ld a,001h		;a344
	ld (la84bh),a		;a346
	ld a,0c8h		;a349
	ld (ldd5fh),a		;a34b
	ld a,05ch		;a34e
	ld (ldd5eh),a		;a350
	jp la32eh		;a353
la356h:
	nop			;a356
la357h:
	nop			;a357
sub_a358h:
	ld a,(la633h)		;a358
	cp 005h			;a35b
	jp z,la3eeh		;a35d
	call sub_a36bh		;a360
	ld iy,ldd6ch		;a363
	call sub_a399h		;a367
	ret			;a36a
sub_a36bh:
	ld a,(la357h)		;a36b
	cp 000h			;a36e
	jp z,la3cah		;a370
	cp 002h			;a373
	jr z,la388h		;a375
	ld a,(ldd6ch)		;a377
	sub 008h		;a37a
	ld (ldd6ch),a		;a37c
	cp 050h			;a37f
	ret nz			;a381
	ld a,002h		;a382
	ld (la357h),a		;a384
	ret			;a387
la388h:
	ld a,(ldd6ch)		;a388
	add a,008h		;a38b
	ld (ldd6ch),a		;a38d
	cp 0c0h			;a390
	ret nz			;a392
	ld a,000h		;a393
	ld (la357h),a		;a395
	ret			;a398
sub_a399h:
	ld h,018h		;a399
	ld l,018h		;a39b
	call sub_7d67h		;a39d
	jp c,sub_a7f1h		;a3a0
	ret			;a3a3
la3a4h:
	ld a,(0dd78h)		;a3a4
	add a,008h		;a3a7
	ld (0dd78h),a		;a3a9
	cp 0c0h			;a3ac
	ret nz			;a3ae
	ld a,000h		;a3af
	ld (la356h),a		;a3b1
	ret			;a3b4
la3b5h:
	ld a,0c0h		;a3b5
	ld (0dd78h),a		;a3b7
	ld (0dd79h),a		;a3ba
	ld a,r			;a3bd
	and 01ch		;a3bf
	cp 000h			;a3c1
	ret nz			;a3c3
	ld a,001h		;a3c4
	ld (la356h),a		;a3c6
	ret			;a3c9
la3cah:
	ld a,0c0h		;a3ca
	ld (ldd6ch),a		;a3cc
	ld a,r			;a3cf
	and 007h		;a3d1
	cp 000h			;a3d3
	ret nz			;a3d5
	ld a,001h		;a3d6
	ld (la357h),a		;a3d8
	ld a,(la633h)		;a3db
	cp 004h			;a3de
	jr z,la3e8h		;a3e0
	ld a,050h		;a3e2
	ld (ldd6dh),a		;a3e4
	ret			;a3e7
la3e8h:
	ld a,0b0h		;a3e8
	ld (ldd6dh),a		;a3ea
	ret			;a3ed
la3eeh:
	call sub_a36bh		;a3ee
	ld iy,ldd6ch		;a3f1
	call sub_a399h		;a3f5
	call sub_a403h		;a3f8
	ld iy,0dd78h		;a3fb
	call sub_a399h		;a3ff
	ret			;a402
sub_a403h:
	ld a,(la356h)		;a403
	cp 000h			;a406
	jp z,la3b5h		;a408
	cp 002h			;a40b
	jp z,la3a4h		;a40d
	ld a,(0dd78h)		;a410
	sub 008h		;a413
	ld (0dd78h),a		;a415
	cp 050h			;a418
	ret nz			;a41a
	ld a,002h		;a41b
	ld (la356h),a		;a41d
	ret			;a420
la421h:
	nop			;a421
la422h:
	nop			;a422
	nop			;a423
la424h:
	nop			;a424
sub_a425h:
	ld a,(la424h)		;a425
	cp 001h			;a428
	ret nz			;a42a
	ld a,(ldd8ch)		;a42b
	inc a			;a42e
	cp 003h			;a42f
	call z,sub_7e9dh	;a431
	ld (ldd8ch),a		;a434
	ld (ldd9ah),a		;a437
	ld (ldda8h),a		;a43a
	ld a,(la421h)		;a43d
	inc a			;a440
	cp 007h			;a441
	jr z,la47dh		;a443
	ld (la421h),a		;a445
	ld ix,(la422h)		;a448
	ld a,(ix+000h)		;a44c
	ld (0dd84h),a		;a44f
	ld a,(ix+001h)		;a452
	ld (0dd85h),a		;a455
	ld a,(ix+002h)		;a458
	ld (0dd92h),a		;a45b
	ld a,(ix+003h)		;a45e
	ld (0dd93h),a		;a461
	ld a,(ix+004h)		;a464
	ld (ldda0h),a		;a467
	ld a,(ix+005h)		;a46a
	ld (ldda1h),a		;a46d
	ld bc,00006h		;a470
	add ix,bc		;a473
	ld (la422h),ix		;a475
	call sub_a97dh		;a479
	ret			;a47c
la47dh:
	ld a,002h		;a47d
	ld (la424h),a		;a47f
	call sub_7e1dh		;a482
	call sub_7e1dh		;a485
	call sub_7e1dh		;a488
	ret			;a48b
la48ch:
	sbc a,b			;a48c
	add a,b			;a48d
	or h			;a48e
	ld h,h			;a48f
	adc a,h			;a490
	ld h,h			;a491
	and b			;a492
	sub (hl)		;a493
	ld (hl),e		;a494
	add a,a			;a495
	add a,d			;a496
	sub c			;a497
	xor c			;a498
	ld a,l			;a499
	add a,d			;a49a
	ld (hl),b		;a49b
	xor d			;a49c
	sub c			;a49d
	xor a			;a49e
	ld a,l			;a49f
	add a,d			;a4a0
	adc a,h			;a4a1
	ld a,b			;a4a2
	add a,d			;a4a3
	and b			;a4a4
	ld a,b			;a4a5
	ld a,b			;a4a6
	xor d			;a4a7
	adc a,h			;a4a8
	and a			;a4a9
	ld a,l			;a4aa
	sbc a,h			;a4ab
	and e			;a4ac
	adc a,a			;a4ad
	sbc a,c			;a4ae
	ld a,b			;a4af
la4b0h:
	sub (hl)		;a4b0
	and 000h		;a4b1
la4b3h:
	nop			;a4b3
la4b4h:
	call sub_7be2h		;a4b4
	ld a,(0a4b2h)		;a4b7
	cp 000h			;a4ba
	jp z,la4ceh		;a4bc
	cp 0ffh			;a4bf
	jp z,la4ffh+1		;a4c1
	call sub_a536h		;a4c4
	call sub_a59bh		;a4c7
	call sub_a5abh		;a4ca
	ret			;a4cd
la4ceh:
	ld a,001h		;a4ce
	ld (la4ffh),a		;a4d0
	ld (0a4b2h),a		;a4d3
	ld hl,le696h		;a4d6
	ld (la4b0h),hl		;a4d9
	ld a,000h		;a4dc
	ld (la4b3h),a		;a4de
	ld a,00eh		;a4e1
	ld (07c61h),a		;a4e3
	ld de,ld223h		;a4e6
	call sub_7e07h		;a4e9
	ld de,0d22fh		;a4ec
	call sub_7e07h		;a4ef
	call sub_d61bh		;a4f2
	ld a,0c0h		;a4f5
	ld (ld223h),a		;a4f7
	ld (0d22fh),a		;a4fa
	ret			;a4fd
la4feh:
	nop			;a4fe
la4ffh:
	ld bc,lfe3ah		;a4ff
	and h			;a502
	inc a			;a503
	ld (la4feh),a		;a504
	ld a,(la4ffh)		;a507
	inc a			;a50a
	ld (la4ffh),a		;a50b
	cp 002h			;a50e
	jp z,la520h		;a510
	ld de,ld223h		;a513
	call sub_7e07h		;a516
	ld de,0d22fh		;a519
	call sub_7e07h		;a51c
	ret			;a51f
la520h:
	call sub_7e1dh		;a520
	call sub_7e1dh		;a523
	ld a,000h		;a526
	ld (la4ffh),a		;a528
	call sub_a97dh		;a52b
	call sub_a978h		;a52e
	call sub_a97dh		;a531
	ret			;a534
la535h:
	nop			;a535
sub_a536h:
	ld a,(la535h)		;a536
	inc a			;a539
	ld (la535h),a		;a53a
	cp 002h			;a53d
	ret nz			;a53f
	ld a,000h		;a540
	ld (la535h),a		;a542
	ld ix,(la4b0h)		;a545
	ld a,(ix+000h)		;a549
	cp 071h			;a54c
	call z,sub_a57bh	;a54e
	cp 000h			;a551
	jp z,la570h		;a553
	ld (ld223h),a		;a556
	add a,040h		;a559
	ld (0d22fh),a		;a55b
	ld a,(ix+001h)		;a55e
	ld (ld224h),a		;a561
	ld (0d230h),a		;a564
	inc ix			;a567
	inc ix			;a569
	ld (la4b0h),ix		;a56b
	ret			;a56f
la570h:
	ld ix,le696h		;a570
	ld (la4b0h),ix		;a574
	jp sub_a536h		;a578
sub_a57bh:
	push af			;a57b
	ld a,(05d3eh)		;a57c
	and a			;a57f
	sbc a,090h		;a580
	call nc,sub_a587h	;a582
	pop af			;a585
	ret			;a586
sub_a587h:
	ld a,(05d2ah)		;a587
	sub 010h		;a58a
	ld (05d2ah),a		;a58c
	ld a,(05d3eh)		;a58f
	sub 010h		;a592
	ld (05d3eh),a		;a594
	call sub_a97dh		;a597
	ret			;a59a
sub_a59bh:
	ld iy,ld223h		;a59b
	ld h,048h		;a59f
	ld l,028h		;a5a1
	call sub_7d67h		;a5a3
	ret nc			;a5a6
	jp sub_a7f1h		;a5a7
la5aah:
	nop			;a5aa
sub_a5abh:
	ld iy,ld223h		;a5ab
	ld h,048h		;a5af
	ld l,028h		;a5b1
	call sub_7d75h		;a5b3
	ret nc			;a5b6
	ld a,(l7831h)		;a5b7
	cp 001h			;a5ba
	ret nz			;a5bc
	ld a,(la5aah)		;a5bd
	inc a			;a5c0
	ld (la5aah),a		;a5c1
	cp 002h			;a5c4
	ret nz			;a5c6
	ld a,000h		;a5c7
	ld (la5aah),a		;a5c9
	ld a,(la617h)		;a5cc
	inc a			;a5cf
	ld b,a			;a5d0
	cp 002h			;a5d1
	jr z,la5edh		;a5d3
	ld a,(la60ch)		;a5d5
	inc a			;a5d8
	ld (la60ch),a		;a5d9
	cp 002h			;a5dc
	jr z,la5e8h		;a5de
	ld a,(la4b3h)		;a5e0
	add a,b			;a5e3
	ld (la4b3h),a		;a5e4
	ret			;a5e7
la5e8h:
	ld a,000h		;a5e8
	ld (la60ch),a		;a5ea
la5edh:
	push bc			;a5ed
	call sub_d692h		;a5ee
	call sub_a978h		;a5f1
	call sub_a97dh		;a5f4
	call sub_a978h		;a5f7
	pop bc			;a5fa
	ld a,(la4b3h)		;a5fb
	add a,b			;a5fe
	ld (la4b3h),a		;a5ff
	and a			;a602
	sbc a,02fh		;a603
	ret c			;a605
	ld a,0ffh		;a606
	ld (0a4b2h),a		;a608
	ret			;a60b
la60ch:
	nop			;a60c
la60dh:
	nop			;a60d
	ld c,0ffh		;a60e
	ld bc,00000h		;a610
la613h:
	nop			;a613
la614h:
	nop			;a614
la615h:
	nop			;a615
la616h:
	nop			;a616
la617h:
	nop			;a617
	rrca			;a618
la619h:
	nop			;a619
la61ah:
	nop			;a61a
	ld bc,00000h		;a61b
la61eh:
	nop			;a61e
la61fh:
	nop			;a61f
	nop			;a620
	nop			;a621
	nop			;a622
	nop			;a623
	nop			;a624
	nop			;a625
	nop			;a626
	nop			;a627
	nop			;a628
	nop			;a629
	nop			;a62a
	nop			;a62b
	nop			;a62c
	nop			;a62d
	nop			;a62e
	nop			;a62f
	nop			;a630
	nop			;a631
	nop			;a632
la633h:
	nop			;a633
	ret c			;a634
	sub 05ah		;a635
	rst 10h			;a637
	ret m			;a638
	rst 10h			;a639
	adc a,c			;a63a
	ret c			;a63b
	ld l,0d9h		;a63c
la63eh:
	ret			;a63e
	exx			;a63f
	ld a,0dah		;a640
	or b			;a642
	jp c,ldb1dh		;a643
	ld h,d			;a646
	in a,(0bbh)		;a647
	in a,(0feh)		;a649
	in a,(02bh)		;a64b
	call c,0dc96h		;a64d
	ld b,0ddh		;a650
la652h:
	nop			;a652
la653h:
	nop			;a653
	nop			;a654
la655h:
	nop			;a655
	nop			;a656
	nop			;a657
	nop			;a658
	nop			;a659
	nop			;a65a
	nop			;a65b
	nop			;a65c
	nop			;a65d
	nop			;a65e
	nop			;a65f
la660h:
	nop			;a660
	nop			;a661
	nop			;a662
	nop			;a663
	nop			;a664
la665h:
	nop			;a665
	nop			;a666
	add a,l			;a667
	and (hl)		;a668
	adc a,d			;a669
	and (hl)		;a66a
	adc a,a			;a66b
	and (hl)		;a66c
	sbc a,b			;a66d
	and (hl)		;a66e
	sbc a,l			;a66f
	and (hl)		;a670
	and (hl)		;a671
	and (hl)		;a672
	xor a			;a673
	and (hl)		;a674
la675h:
	cp b			;a675
	and (hl)		;a676
	pop bc			;a677
	and (hl)		;a678
	add a,0a6h		;a679
	res 4,(hl)		;a67b
	ret nc			;a67d
	and (hl)		;a67e
	push de			;a67f
	and (hl)		;a680
	sbc a,0a6h		;a681
la683h:
	ex (sp),hl		;a683
	and (hl)		;a684
	ld bc,000c0h		;a685
	jr z,$+1		;a688
	ld bc,000c0h		;a68a
	jr z,$+1		;a68d
	ld (bc),a		;a68f
	ret nz			;a690
	nop			;a691
	jr z,$+1		;a692
	sbc a,b			;a694
	ld l,(hl)		;a695
	jr nc,la6a8h		;a696
	ld bc,000c0h		;a698
	inc d			;a69b
	rst 38h			;a69c
	ld (bc),a		;a69d
	ret nz			;a69e
	nop			;a69f
	jr z,la63eh		;a6a0
la6a2h:
	or h			;a6a2
	ret po			;a6a3
	jr z,la6ceh		;a6a4
	ld (bc),a		;a6a6
la6a7h:
	or h			;a6a7
la6a8h:
	jr $+42			;a6a8
	jr z,la660h		;a6aa
	add a,b			;a6ac
	jr z,$+42		;a6ad
	ld (bc),a		;a6af
la6b0h:
	or h			;a6b0
	djnz la6dbh		;a6b1
	jr z,la675h		;a6b3
	ld h,a			;a6b5
	jr z,$-103		;a6b6
	ld (bc),a		;a6b8
	ret nz			;a6b9
	nop			;a6ba
	jr z,la6d5h		;a6bb
	call z,02800h		;a6bd
	rst 38h			;a6c0
	ld bc,000cch		;a6c1
	jr z,$+1		;a6c4
	ld bc,000cch		;a6c6
	jr z,$+1		;a6c9
	ld bc,000cch		;a6cb
la6ceh:
	jr z,$+1		;a6ce
	ld bc,000cch		;a6d0
	jr z,$+1		;a6d3
la6d5h:
	ld (bc),a		;a6d5
	call z,02800h		;a6d6
	rst 38h			;a6d9
	ret nz			;a6da
la6dbh:
	ld e,d			;a6db
	jr z,la683h		;a6dc
	ld bc,000c0h		;a6de
	jr z,$+1		;a6e1
	ld bc,000c0h		;a6e3
	jr z,$+1		;a6e6
la6e8h:
	nop			;a6e8
	nop			;a6e9
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
	nop			;a6fa
	nop			;a6fb
	nop			;a6fc
	nop			;a6fd
la6feh:
	nop			;a6fe
	nop			;a6ff
sub_a700h:
	nop			;a700
	nop			;a701
	nop			;a702
	nop			;a703
	nop			;a704
	nop			;a705
	nop			;a706
	nop			;a707
	nop			;a708
	nop			;a709
	nop			;a70a
	nop			;a70b
	inc bc			;a70c
	ld c,b			;a70d
	ret z			;a70e
	nop			;a70f
	nop			;a710
	nop			;a711
	nop			;a712
	nop			;a713
	nop			;a714
la715h:
	ld a,002h		;a715
	call 01601h		;a717
	ld a,000h		;a71a
	ld (06a8ah),a		;a71c
	call le6feh		;a71f
	di			;a722
	call sub_766eh		;a723
	ld a,008h		;a726
	call sub_7ca9h		;a728
	call sub_d606h		;a72b
	call sub_d61bh		;a72e
la731h:
	call sub_7c8dh		;a731
	call sub_7cdah		;a734
	call sub_6e35h		;a737
	call sub_6e22h		;a73a
	call 06a8bh		;a73d
	call sub_7d34h		;a740
	call sub_72fbh		;a743
la746h:
	call sub_7263h		;a746
	call sub_6e6eh		;a749
	call sub_7c14h		;a74c
	call sub_6ed1h		;a74f
	call sub_79a2h		;a752
	call sub_7c31h		;a755
	ld a,(la4feh)		;a758
	cp 014h			;a75b
	jp z,laa4bh		;a75d
	call sub_a84eh		;a760
	ld a,(la7e2h)		;a763
	cp 001h			;a766
	jp z,la77fh		;a768
	ld a,(05d3eh)		;a76b
	cp 0c0h			;a76e
	jp z,la77fh		;a770
	call sub_72fbh		;a773
	call sub_7393h		;a776
	call sub_757ah		;a779
	jp la746h		;a77c
la77fh:
	ld a,000h		;a77f
	ld (la8feh),a		;a781
	ld (07c61h),a		;a784
	ld (0a4b2h),a		;a787
	ld (la7e2h),a		;a78a
	ld (la633h),a		;a78d
	ld (l8a64h),a		;a790
	ld (l8a63h),a		;a793
	ld a,0a0h		;a796
	ld (05d3eh),a		;a798
	ld (05d40h),a		;a79b
	ld a,03ch		;a79e
	ld (05d3fh),a		;a7a0
	ld (05d41h),a		;a7a3
	ld a,081h		;a7a6
	ld (05d2ah),a		;a7a8
	ld (05d2ch),a		;a7ab
	ld a,03ch		;a7ae
	ld (05d2bh),a		;a7b0
	ld (05d2dh),a		;a7b3
	ld a,002h		;a7b6
	ld (05d32h),a		;a7b8
	ld (05d46h),a		;a7bb
	ld a,060h		;a7be
	ld (la81eh),a		;a7c0
	ld a,000h		;a7c3
	ld (la81fh),a		;a7c5
	call sub_a9e4h		;a7c8
	call sub_d606h		;a7cb
	call sub_d61bh		;a7ce
	ld hl,la61fh		;a7d1
	ld b,014h		;a7d4
	ld a,000h		;a7d6
la7d8h:
	ld (hl),a		;a7d8
	inc hl			;a7d9
	djnz la7d8h		;a7da
	ld (la616h),a		;a7dc
	jp la820h		;a7df
la7e2h:
	nop			;a7e2
sub_a7e3h:
	call sub_d606h		;a7e3
	ld a,000h		;a7e6
	ld (la81fh),a		;a7e8
	ld a,060h		;a7eb
	ld (la81eh),a		;a7ed
	ret			;a7f0
sub_a7f1h:
	ld a,(la81eh)		;a7f1
	dec a			;a7f4
	ld (la81eh),a		;a7f5
	ld a,(la81fh)		;a7f8
	inc a			;a7fb
	ld (la81fh),a		;a7fc
	cp 004h			;a7ff
	ret nz			;a801
	ld a,000h		;a802
	ld (la81fh),a		;a804
	call sub_d655h		;a807
	call sub_a97dh		;a80a
	ld a,(la81eh)		;a80d
	cp 000h			;a810
	ret nz			;a812
	ld a,060h		;a813
	ld (la81eh),a		;a815
	ld a,001h		;a818
	ld (la7e2h),a		;a81a
	ret			;a81d
la81eh:
	ld h,b			;a81e
la81fh:
	nop			;a81f
la820h:
	ld a,000h		;a820
	ld (la84bh),a		;a822
	ld (la84ch),a		;a825
	ld (la84dh),a		;a828
	ld (la424h),a		;a82b
	ld (la357h),a		;a82e
	ld (la61ah),a		;a831
	ld (la356h),a		;a834
	ld (0a61dh),a		;a837
	ld (la61eh),a		;a83a
	ld (la615h),a		;a83d
	ld (0a612h),a		;a840
	ld a,019h		;a843
	ld (l6f16h),a		;a845
	jp la731h		;a848
la84bh:
	nop			;a84b
la84ch:
	nop			;a84c
la84dh:
	nop			;a84d
sub_a84eh:
	ld a,(05d32h)		;a84e
	cp 005h			;a851
	call z,sub_a978h	;a853
	call sub_a8ffh		;a856
	ld a,(la633h)		;a859
	cp 000h			;a85c
	jp z,la8a5h		;a85e
	cp 001h			;a861
	jp z,la8a8h		;a863
	cp 002h			;a866
	jp z,la8a8h		;a868
	cp 003h			;a86b
	jp z,la8afh		;a86d
	cp 004h			;a870
	jp z,la8b6h		;a872
	cp 005h			;a875
	jp z,la8c0h		;a877
	cp 006h			;a87a
	jp z,la8c7h		;a87c
	cp 007h			;a87f
	jp z,la8afh		;a881
	cp 008h			;a884
	jp z,la8d1h		;a886
	cp 009h			;a889
	jp z,la8e4h		;a88b
	cp 00ah			;a88e
	jp z,la8d5h		;a890
	cp 00bh			;a893
	jp z,la8d5h		;a895
	cp 00ch			;a898
	jp z,l970eh		;a89a
	cp 00eh			;a89d
	jp z,la4b4h		;a89f
	jp la8afh		;a8a2
la8a5h:
	jp l8603h		;a8a5
la8a8h:
	call l8603h		;a8a8
	call sub_a2a9h		;a8ab
	ret			;a8ae
la8afh:
	call l8603h		;a8af
	jp l970eh		;a8b2
	ret			;a8b5
la8b6h:
	call sub_9fd6h		;a8b6
	call l8603h		;a8b9
	call sub_a358h		;a8bc
	ret			;a8bf
la8c0h:
	call sub_9fd6h		;a8c0
	call sub_a358h		;a8c3
	ret			;a8c6
la8c7h:
	call sub_9fd6h		;a8c7
	call l8603h		;a8ca
	call sub_a2a9h		;a8cd
	ret			;a8d0
la8d1h:
	call sub_7e25h		;a8d1
	ret			;a8d4
la8d5h:
	call sub_7e25h		;a8d5
	call l8603h		;a8d8
	ld a,(la8feh)		;a8db
	cp 0ffh			;a8de
	call z,sub_a8ebh	;a8e0
	ret			;a8e3
la8e4h:
	call sub_89b2h		;a8e4
	call sub_a425h		;a8e7
	ret			;a8ea
sub_a8ebh:
	call sub_d606h		;a8eb
	ld a,000h		;a8ee
	ld (la81fh),a		;a8f0
	ld a,060h		;a8f3
	ld (la81eh),a		;a8f5
	ld a,001h		;a8f8
	ld (la8feh),a		;a8fa
	ret			;a8fd
la8feh:
	nop			;a8fe
sub_a8ffh:
	ld a,(la633h)		;a8ff
	cp 009h			;a902
	jp z,la9bah		;a904
	cp 002h			;a907
	jp z,la999h		;a909
	ld a,(la84dh)		;a90c
	cp 001h			;a90f
	ret z			;a911
	ld a,001h		;a912
	ld (la84dh),a		;a914
	ld a,(la633h)		;a917
	cp 004h			;a91a
	jp z,la938h		;a91c
	cp 005h			;a91f
	jp z,la94fh		;a921
	cp 006h			;a924
	ret nz			;a926
	ld de,la157h		;a927
	call sub_7e07h		;a92a
	ld a,0a8h		;a92d
	ld (la157h),a		;a92f
	ld a,0b0h		;a932
	ld (la6b0h),a		;a934
	ret			;a937
la938h:
	ld de,la133h		;a938
	call sub_7e07h		;a93b
	ld a,0a8h		;a93e
	ld (la133h),a		;a940
	ld a,0b0h		;a943
	ld (la6a2h),a		;a945
	ld de,ldd6ch		;a948
	call sub_7e07h		;a94b
	ret			;a94e
la94fh:
	ld de,la13fh		;a94f
	call sub_7e07h		;a952
	ld de,la14bh		;a955
	call sub_7e07h		;a958
	ld a,0a8h		;a95b
	ld (la13fh),a		;a95d
	ld (la14bh),a		;a960
	ld a,0b0h		;a963
	ld (la6a7h),a		;a965
	ld (0a6abh),a		;a968
	ld de,ldd6ch		;a96b
	call sub_7e07h		;a96e
	ld de,0dd78h		;a971
	call sub_7e07h		;a974
	ret			;a977
sub_a978h:
	ld b,00ah		;a978
	jp la982h		;a97a
sub_a97dh:
	ld b,032h		;a97d
	jp la982h		;a97f
la982h:
	ld a,0f8h		;a982
	out (0feh),a		;a984
	push bc			;a986
	ld b,014h		;a987
la989h:
	djnz la989h		;a989
	pop bc			;a98b
	ld a,000h		;a98c
	out (0feh),a		;a98e
	push bc			;a990
	ld b,014h		;a991
la993h:
	djnz la993h		;a993
	pop bc			;a995
	djnz la982h		;a996
	ret			;a998
la999h:
	ld iy,la9b6h		;a999
	ld h,010h		;a99d
	ld l,030h		;a99f
	call sub_7d67h		;a9a1
	call c,sub_a7f1h	;a9a4
	ld iy,0a9b8h		;a9a7
	ld h,010h		;a9ab
	ld l,030h		;a9ad
	call sub_7d67h		;a9af
	jp c,sub_a7f1h		;a9b2
	ret			;a9b5
la9b6h:
	xor b			;a9b6
	jr nc,$-86		;a9b7
	or b			;a9b9
la9bah:
	ld a,(la84bh)		;a9ba
	cp 000h			;a9bd
	ret nz			;a9bf
	ld a,001h		;a9c0
	ld (la84bh),a		;a9c2
	ld a,(l8a63h)		;a9c5
	cp 001h			;a9c8
	jp z,l8a8eh		;a9ca
	ld de,l8abdh		;a9cd
	call sub_7e07h		;a9d0
	ld de,l8aa3h		;a9d3
	call sub_7e07h		;a9d6
	ld a,001h		;a9d9
	ld (l8ac5h),a		;a9db
	ld a,078h		;a9de
	ld (l8abeh),a		;a9e0
	ret			;a9e3
sub_a9e4h:
	ld bc,00260h		;a9e4
	ld hl,05800h		;a9e7
la9eah:
	ld a,000h		;a9ea
	ld (hl),a		;a9ec
	inc hl			;a9ed
	dec bc			;a9ee
	ld a,b			;a9ef
	or c			;a9f0
	jr nz,la9eah		;a9f1
	ld b,002h		;a9f3
la9f5h:
	ld de,lffffh		;a9f5
la9f8h:
	dec de			;a9f8
	ld a,e			;a9f9
	or d			;a9fa
	jr nz,la9f8h		;a9fb
	djnz la9f5h		;a9fd
	ld de,0480eh		;a9ff
	ld hl,le636h		;aa02
	ld b,003h		;aa05
laa07h:
	push bc			;aa07
	push de			;aa08
	ld b,008h		;aa09
laa0bh:
	push bc			;aa0b
	push de			;aa0c
	ld bc,00004h		;aa0d
	ldir			;aa10
	pop de			;aa12
	inc d			;aa13
	pop bc			;aa14
	djnz laa0bh		;aa15
	pop de			;aa17
	ld bc,00020h		;aa18
	ex de,hl		;aa1b
	add hl,bc		;aa1c
	ex de,hl		;aa1d
	pop bc			;aa1e
	djnz laa07h		;aa1f
	ld hl,0590eh		;aa21
	ld a,007h		;aa24
	ld b,003h		;aa26
laa28h:
	push bc			;aa28
	ld b,004h		;aa29
laa2bh:
	ld (hl),a		;aa2b
	inc hl			;aa2c
	djnz laa2bh		;aa2d
	ld de,0001ch		;aa2f
	add hl,de		;aa32
	pop bc			;aa33
	djnz laa28h		;aa34
	ld b,003h		;aa36
laa38h:
	ld de,lffffh		;aa38
laa3bh:
	dec de			;aa3b
	ld a,e			;aa3c
	or d			;aa3d
	jr nz,laa3bh		;aa3e
	djnz laa38h		;aa40
laa42h:
	ld a,(06a89h)		;aa42
	call sub_76c4h		;aa45
	jr nz,laa42h		;aa48
	ret			;aa4a
laa4bh:
	ld hl,0594bh		;aa4b
	ld b,00ah		;aa4e
	ld a,0fah		;aa50
laa52h:
	ld (hl),a		;aa52
	inc hl			;aa53
	djnz laa52h		;aa54
	ld hl,0484bh		;aa56
	ld de,laaa1h		;aa59
laa5ch:
	ld c,008h		;aa5c
laa5eh:
	push hl			;aa5e
	ld b,00ah		;aa5f
laa61h:
	ld a,(de)		;aa61
	ld (hl),a		;aa62
	inc hl			;aa63
	inc de			;aa64
	djnz laa61h		;aa65
	pop hl			;aa67
	inc h			;aa68
	dec c			;aa69
	jr nz,laa5eh		;aa6a
	ld de,01628h		;aa6c
	ld ix,le6feh		;aa6f
	ld a,0ffh		;aa73
	scf			;aa75
	ei			;aa76
	call 00556h		;aa77
	di			;aa7a
	ld hl,le6feh		;aa7b
	ld de,04000h		;aa7e
	ld bc,01000h		;aa81
	ldir			;aa84
	ld c,008h		;aa86
laa88h:
	push de			;aa88
	ld b,060h		;aa89
laa8bh:
	ld a,(hl)		;aa8b
	ld (de),a		;aa8c
	inc hl			;aa8d
	inc de			;aa8e
	djnz laa8bh		;aa8f
	pop de			;aa91
	inc d			;aa92
	dec c			;aa93
	jr nz,laa88h		;aa94
	ld de,05800h		;aa96
	ld bc,00260h		;aa99
	ldir			;aa9c
	jp lfc5eh		;aa9e
laaa1h:
	nop			;aaa1
	nop			;aaa2
	nop			;aaa3
	nop			;aaa4
	ld bc,00040h		;aaa5
	nop			;aaa8
	nop			;aaa9
	and b			;aaaa
	ld a,h			;aaab
	ld (bc),a		;aaac
	nop			;aaad
	nop			;aaae
	ld bc,0205fh		;aaaf
	inc a			;aab2
	jp nz,062a0h		;aab3
	adc a,d			;aab6
	inc e			;aab7
	ld (hl),b		;aab8
	nop			;aab9
	jr laa5ch		;aaba
	ld h,d			;aabc
	ld h,h			;aabd
	nop			;aabe
	ld b,d			;aabf
	adc a,d			;aac0
	jr nc,laacbh		;aac1
	nop			;aac3
	djnz $-94		;aac4
	ld b,d			;aac6
	jr c,laac9h		;aac7
laac9h:
	ld a,h			;aac9
	adc a,d			;aaca
laacbh:
	inc e			;aacb
	ld a,b			;aacc
	nop			;aacd
	rra			;aace
	jr nz,lab4fh		;aacf
	djnz laad3h		;aad1
laad3h:
	ld b,b			;aad3
	rlc d			;aad4
	sbc a,b			;aad6
	nop			;aad7
	djnz lab0ah		;aad8
	ld b,d			;aada
	djnz laaddh		;aadb
laaddh:
	ld b,b			;aadd
	ld (hl),c		;aade
	cp h			;aadf
	ld a,b			;aae0
	nop			;aae1
	djnz lab23h		;aae2
	ld b,d			;aae4
	djnz laae7h		;aae5
laae7h:
	nop			;aae7
	nop			;aae8
	nop			;aae9
	nop			;aaea
	nop			;aaeb
	nop			;aaec
	nop			;aaed
laaeeh:
	jp la715h		;aaee
	nop			;aaf1
	nop			;aaf2
	nop			;aaf3
	nop			;aaf4
	nop			;aaf5
	nop			;aaf6
	nop			;aaf7
	nop			;aaf8
	nop			;aaf9
	nop			;aafa
	nop			;aafb
	nop			;aafc
	nop			;aafd
	nop			;aafe
	nop			;aaff
	nop			;ab00
	nop			;ab01
	nop			;ab02
	nop			;ab03
	nop			;ab04
	nop			;ab05
	nop			;ab06
	nop			;ab07
	nop			;ab08
	nop			;ab09
lab0ah:
	nop			;ab0a
	nop			;ab0b
	nop			;ab0c
	nop			;ab0d
	nop			;ab0e
	nop			;ab0f
	nop			;ab10
	nop			;ab11
	nop			;ab12
	nop			;ab13
	nop			;ab14
	nop			;ab15
	nop			;ab16
	nop			;ab17
	nop			;ab18
	nop			;ab19
	nop			;ab1a
	nop			;ab1b
	nop			;ab1c
	nop			;ab1d
	nop			;ab1e
	nop			;ab1f
	nop			;ab20
	nop			;ab21
	nop			;ab22
lab23h:
	nop			;ab23
	nop			;ab24
	nop			;ab25
	nop			;ab26
	nop			;ab27
	nop			;ab28
	nop			;ab29
	nop			;ab2a
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
	nop			;ab39
	nop			;ab3a
	nop			;ab3b
	nop			;ab3c
	nop			;ab3d
	nop			;ab3e
	nop			;ab3f
	nop			;ab40
	nop			;ab41
	nop			;ab42
	nop			;ab43
	nop			;ab44
	nop			;ab45
	nop			;ab46
	nop			;ab47
	nop			;ab48
	nop			;ab49
	nop			;ab4a
	nop			;ab4b
	nop			;ab4c
	nop			;ab4d
	nop			;ab4e
lab4fh:
	nop			;ab4f
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
	nop			;ab5a
	nop			;ab5b
	nop			;ab5c
	nop			;ab5d
	nop			;ab5e
	nop			;ab5f
	nop			;ab60
	nop			;ab61
	nop			;ab62
	nop			;ab63
	nop			;ab64
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
	nop			;ab70
	nop			;ab71
	nop			;ab72
	nop			;ab73
	nop			;ab74
	nop			;ab75
	nop			;ab76
	nop			;ab77
	nop			;ab78
	nop			;ab79
	nop			;ab7a
	nop			;ab7b
	nop			;ab7c
	nop			;ab7d
	nop			;ab7e
	nop			;ab7f
	nop			;ab80
	nop			;ab81
	nop			;ab82
	nop			;ab83
	nop			;ab84
	nop			;ab85
	nop			;ab86
	nop			;ab87
	nop			;ab88
	nop			;ab89
	nop			;ab8a
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
	nop			;abab
	nop			;abac
	nop			;abad
	nop			;abae
	nop			;abaf
	nop			;abb0
	nop			;abb1
	nop			;abb2
	nop			;abb3
	nop			;abb4
	nop			;abb5
	nop			;abb6
	nop			;abb7
	nop			;abb8
	nop			;abb9
	nop			;abba
	nop			;abbb
	nop			;abbc
	nop			;abbd
	nop			;abbe
	nop			;abbf
	nop			;abc0
	nop			;abc1
	nop			;abc2
	nop			;abc3
	nop			;abc4
	nop			;abc5
	nop			;abc6
	nop			;abc7
	nop			;abc8
	nop			;abc9
	nop			;abca
	nop			;abcb
	nop			;abcc
	nop			;abcd
	nop			;abce
	nop			;abcf
	nop			;abd0
	nop			;abd1
	nop			;abd2
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
	rlca			;abe0
	rlca			;abe1
labe2h:
	ret z			;abe2
	xor a			;abe3
	rlca			;abe4
	ld (bc),a		;abe5
	ld b,050h		;abe6
	or c			;abe8
	ld b,a			;abe9
	inc bc			;abea
	ex af,af'		;abeb
	or b			;abec
	or c			;abed
	ld b,a			;abee
	inc bc			;abef
	ld b,070h		;abf0
	or d			;abf2
	ld b,003h		;abf3
	inc b			;abf5
labf6h:
	nop			;abf6
	or e			;abf7
	ld b,002h		;abf8
	ld (bc),a		;abfa
	ld h,b			;abfb
	or e			;abfc
	ld b,008h		;abfd
	ld a,(bc)		;abff
	add a,b			;ac00
	or e			;ac01
	ld b,h			;ac02
	inc bc			;ac03
	inc b			;ac04
	nop			;ac05
	or (hl)			;ac06
	ld b,001h		;ac07
	inc b			;ac09
	ld h,b			;ac0a
	or (hl)			;ac0b
	rlca			;ac0c
	ld (bc),a		;ac0d
	ld b,0a0h		;ac0e
	or (hl)			;ac10
	rlca			;ac11
	ld (bc),a		;ac12
	inc b			;ac13
	ld h,b			;ac14
	or a			;ac15
	rlca			;ac16
	inc bc			;ac17
	ld (bc),a		;ac18
	and b			;ac19
	or a			;ac1a
	rlca			;ac1b
	ld (bc),a		;ac1c
	ld (bc),a		;ac1d
	ret nc			;ac1e
	or a			;ac1f
	rlca			;ac20
	ld (bc),a		;ac21
	inc b			;ac22
	ret p			;ac23
	or a			;ac24
	rlca			;ac25
	ld b,004h		;ac26
	jr nc,labe2h		;ac28
	rlca			;ac2a
	ld b,008h		;ac2b
	or b			;ac2d
	cp c			;ac2e
	ld b,h			;ac2f
	ld (bc),a		;ac30
	inc b			;ac31
	or b			;ac32
	cp h			;ac33
	ld b,h			;ac34
	ld (bc),a		;ac35
	ld (bc),a		;ac36
	jr nc,labf6h		;ac37
	rlca			;ac39
	ld (bc),a		;ac3a
	inc bc			;ac3b
	ld (hl),b		;ac3c
	cp l			;ac3d
	ld b,h			;ac3e
	ld (bc),a		;ac3f
	inc b			;ac40
	and b			;ac41
lac42h:
	cp l			;ac42
	ld b,h			;ac43
	ld bc,le004h		;ac44
	cp l			;ac47
	ld b,h			;ac48
	ld bc,00001h		;ac49
	cp (hl)			;ac4c
	ld b,h			;ac4d
	inc bc			;ac4e
	ld (bc),a		;ac4f
	ex af,af'		;ac50
	cp (hl)			;ac51
	ld b,e			;ac52
	ld bc,06802h		;ac53
	cp (hl)			;ac56
	ld b,e			;ac57
	ld (bc),a		;ac58
	inc bc			;ac59
	ld a,b			;ac5a
	cp (hl)			;ac5b
	ld b,e			;ac5c
lac5dh:
	inc b			;ac5d
	ld bc,lbed8h		;ac5e
	inc b			;ac61
	inc b			;ac62
	ld b,0f8h		;ac63
	cp (hl)			;ac65
	rlca			;ac66
	inc b			;ac67
	ex af,af'		;ac68
	cp b			;ac69
	cp a			;ac6a
	rlca			;ac6b
	ld b,003h		;ac6c
lac6eh:
	cp b			;ac6e
	ret nz			;ac6f
	rlca			;ac70
	ld b,002h		;ac71
	ret c			;ac73
	pop bc			;ac74
	rlca			;ac75
	dec b			;ac76
	inc b			;ac77
	sbc a,b			;ac78
	jp nz,00207h		;ac79
	inc c			;ac7c
	jr c,lac42h		;ac7d
	ld b,d			;ac7f
	ld b,004h		;ac80
	ret m			;ac82
	jp 00207h		;ac83
	ld (bc),a		;ac86
	cp b			;ac87
	call nz,00244h		;ac88
	ld (bc),a		;ac8b
	ret c			;ac8c
	call nz,00104h		;ac8d
	inc b			;ac90
	ret m			;ac91
	call nz,0074ch		;ac92
	ld (bc),a		;ac95
	jr lac5dh		;ac96
	ld b,h			;ac98
	ld (bc),a		;ac99
lac9ah:
	ld bc,lc588h		;ac9a
	ld b,006h		;ac9d
	inc b			;ac9f
laca0h:
	xor b			;aca0
	push bc			;aca1
	ld b,h			;aca2
	inc b			;aca3
	inc b			;aca4
	jr z,lac6eh		;aca5
	inc b			;aca7
	ex af,af'		;aca8
	ld b,028h		;aca9
	ret z			;acab
	rlca			;acac
	ex af,af'		;acad
	inc b			;acae
	xor b			;acaf
	ret			;acb0
	rlca			;acb1
	dec b			;acb2
	add hl,bc		;acb3
	xor b			;acb4
	jp z,00607h		;acb5
	djnz laccah		;acb8
lacbah:
	call z,00207h		;acba
	ld a,(bc)		;acbd
	djnz $-47		;acbe
	rlca			;acc0
	ld (bc),a		;acc1
	ex af,af'		;acc2
	or b			;acc3
	rst 8			;acc4
	rlca			;acc5
	ex af,af'		;acc6
	inc b			;acc7
	jr nc,lac9ah		;acc8
laccah:
	rlca			;acca
	inc b			;accb
	inc b			;accc
	jr nc,laca0h		;accd
	rlca			;accf
	inc b			;acd0
	inc bc			;acd1
	or b			;acd2
	pop de			;acd3
	rlca			;acd4
	ld bc,01001h		;acd5
	jp nc,00107h		;acd8
	ld bc,ld218h		;acdb
	rlca			;acde
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
lae07h:
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
	nop			;af4a
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
	nop			;af5c
	nop			;af5d
	nop			;af5e
	nop			;af5f
	nop			;af60
	nop			;af61
	nop			;af62
	nop			;af63
	nop			;af64
	nop			;af65
	nop			;af66
	nop			;af67
	nop			;af68
	nop			;af69
	nop			;af6a
	nop			;af6b
	nop			;af6c
	nop			;af6d
	nop			;af6e
	nop			;af6f
	nop			;af70
	nop			;af71
	nop			;af72
	nop			;af73
	nop			;af74
	nop			;af75
	nop			;af76
	nop			;af77
	nop			;af78
	nop			;af79
	nop			;af7a
	nop			;af7b
	nop			;af7c
	nop			;af7d
	nop			;af7e
	nop			;af7f
	nop			;af80
	nop			;af81
	nop			;af82
	nop			;af83
	nop			;af84
	nop			;af85
	nop			;af86
	nop			;af87
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
	in a,(002h)		;af92
	ld c,l			;af94
	nop			;af95
	nop			;af96
	dec a			;af97
	jr nz,$+1		;af98
	pop hl			;af9a
	ld c,b			;af9b
	jr nz,laf9eh		;af9c
laf9eh:
	in a,(002h)		;af9e
	in a,(002h)		;afa0
	ld c,l			;afa2
	nop			;afa3
lafa4h:
	cpl			;afa4
	ret pe			;afa5
	nop			;afa6
	nop			;afa7
	inc (hl)		;afa8
	ret pe			;afa9
	jr nz,$+6		;afaa
	and l			;afac
	ret pe			;afad
	ld (02ba7h),hl		;afae
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
	ld a,0ffh		;afc7
	call m,sub_f3f9h	;afc9
	rst 20h			;afcc
	rst 8			;afcd
	sbc a,09fh		;afce
	cp a			;afd0
	dec a			;afd1
	ld a,(hl)		;afd2
	ld a,d			;afd3
	ld (hl),h		;afd4
	ld a,l			;afd5
	ld a,l			;afd6
	ld (hl),h		;afd7
	ld a,d			;afd8
	ld a,(hl)		;afd9
	ld a,d			;afda
	ld a,l			;afdb
lafdch:
	ccf			;afdc
	cp (hl)			;afdd
	sbc a,l			;afde
	rst 18h			;afdf
	rst 18h			;afe0
	rst 8			;afe1
	rst 28h			;afe2
	rst 28h			;afe3
	rst 20h			;afe4
	rst 30h			;afe5
	di			;afe6
	ei			;afe7
	ld sp,hl		;afe8
	call m,sub_fefeh	;afe9
	cp 0feh			;afec
	cp 0ffh			;afee
	rlca			;aff0
	ret p			;aff1
	cp 0ffh			;aff2
	rst 38h			;aff4
	rst 38h			;aff5
	rst 38h			;aff6
	rst 38h			;aff7
	rst 38h			;aff8
	cp 0f8h			;aff9
	di			;affb
	call nz,sub_bb9bh	;affc
	nop			;afff
lb000h:
	nop			;b000
	ld a,a			;b001
	and c			;b002
	adc a,098h		;b003
	or a			;b005
	cp b			;b006
	ccf			;b007
	ld a,a			;b008
	ld a,(hl)		;b009
	ld a,h			;b00a
	ld sp,iy		;b00b
	jp m,lf2fah		;b00d
	call p,sub_71f4h	;b010
	ld a,l			;b013
	inc a			;b014
	sbc a,a			;b015
	ret nz			;b016
	dec sp			;b017
	inc e			;b018
	call m,0bfdfh		;b019
	cp a			;b01c
	ld a,l			;b01d
	ld a,e			;b01e
	ld l,e			;b01f
	ld e,e			;b020
	rst 10h			;b021
	rst 10h			;b022
	rst 28h			;b023
	rst 28h			;b024
	rst 28h			;b025
	ld l,(hl)		;b026
	cpl			;b027
	sbc a,(hl)		;b028
	rra			;b029
	sbc a,0cfh		;b02a
	rst 28h			;b02c
	rst 28h			;b02d
	rst 20h			;b02e
	di			;b02f
	ei			;b030
	ld bc,l7fb9h		;b031
	rst 38h			;b034
	rst 38h			;b035
	rst 0			;b036
	nop			;b037
	rst 38h			;b038
	ld (hl),b		;b039
	daa			;b03a
	adc a,l			;b03b
	sub e			;b03c
	daa			;b03d
	ld hl,(04d5eh)		;b03e
	ld d,a			;b041
	xor a			;b042
	inc l			;b043
	dec sp			;b044
	ld e,(hl)		;b045
	defb 0edh ;next byte illegal after ed	;b046
	ld e,l			;b047
	ld e,l			;b048
	xor (hl)		;b049
	ld h,a			;b04a
	daa			;b04b
	rla			;b04c
	jp l8439h		;b04d
	ld (hl),d		;b050
	add hl,hl		;b051
	ld h,h			;b052
	jp po,lfcb7h		;b053
	ld sp,hl		;b056
	rst 38h			;b057
	jp m,05fbeh		;b058
	cp l			;b05b
	cp a			;b05c
	ld a,a			;b05d
	ld a,a			;b05e
	ld a,a			;b05f
	ld a,a			;b060
	ld a,a			;b061
	cp a			;b062
	ld d,l			;b063
	xor d			;b064
	rst 20h			;b065
	and c			;b066
	call nc,sub_ebf3h	;b067
	in a,(0ebh)		;b06a
	in a,(0f3h)		;b06c
	rst 20h			;b06e
	nop			;b06f
	nop			;b070
	ld d,l			;b071
	xor 0d7h		;b072
	ld a,c			;b074
	halt			;b075
	jp (hl)			;b076
	jp (hl)			;b077
	ret p			;b078
	rst 38h			;b079
	rst 38h			;b07a
	ld a,a			;b07b
	rst 38h			;b07c
	rra			;b07d
	and a			;b07e
	xor b			;b07f
	ld e,a			;b080
	rst 38h			;b081
	rst 38h			;b082
	ld sp,hl		;b083
	ret p			;b084
	di			;b085
	jp (hl)			;b086
	call p,01e7ah		;b087
	pop bc			;b08a
	ld l,a			;b08b
	cpl			;b08c
	xor a			;b08d
	and a			;b08e
	sub b			;b08f
	ld c,e			;b090
	dec hl			;b091
	add hl,hl		;b092
	xor l			;b093
	push hl			;b094
	out (0ffh),a		;b095
	rst 38h			;b097
	rst 38h			;b098
	rst 38h			;b099
	rst 38h			;b09a
	rst 38h			;b09b
	jp pe,lea57h		;b09c
	inc bc			;b09f
	ld sp,hl		;b0a0
	ld sp,hl		;b0a1
	di			;b0a2
	rst 30h			;b0a3
	rst 30h			;b0a4
	rst 30h			;b0a5
	rst 30h			;b0a6
	nop			;b0a7
	inc bc			;b0a8
	ld a,b			;b0a9
	defb 0edh ;next byte illegal after ed	;b0aa
	or 0f7h			;b0ab
	ld (hl),0c9h		;b0ad
	or e			;b0af
	ld l,h			;b0b0
	sbc a,e			;b0b1
	in a,(0feh)		;b0b2
	rst 38h			;b0b4
	call m,sub_7f83h	;b0b5
	rst 38h			;b0b8
	rst 38h			;b0b9
	rst 38h			;b0ba
	defb 0fdh,01fh,0c0h ;illegal sequence	;b0bb
	rst 38h			;b0be
	rst 38h			;b0bf
	rst 38h			;b0c0
	rra			;b0c1
	rst 0			;b0c2
	ld d,e			;b0c3
	xor b			;b0c4
	sub (hl)		;b0c5
	exx			;b0c6
	ld h,0d0h		;b0c7
	di			;b0c9
	ex de,hl		;b0ca
	in a,(0ebh)		;b0cb
	in a,(0ebh)		;b0cd
	in a,(0abh)		;b0cf
	ret c			;b0d1
	or e			;b0d2
	rst 20h			;b0d3
	rst 8			;b0d4
	cpl			;b0d5
	rst 20h			;b0d6
	rst 10h			;b0d7
	rst 30h			;b0d8
	ex (sp),hl		;b0d9
	ret z			;b0da
	or (hl)			;b0db
	ei			;b0dc
	rst 38h			;b0dd
	rst 38h			;b0de
	nop			;b0df
	rst 38h			;b0e0
	ld a,a			;b0e1
	ccf			;b0e2
	cp a			;b0e3
	cp a			;b0e4
	ccf			;b0e5
	cp a			;b0e6
	rrca			;b0e7
	rst 20h			;b0e8
	di			;b0e9
	ld e,e			;b0ea
	ld c,e			;b0eb
	ei			;b0ec
	inc de			;b0ed
	rst 20h			;b0ee
	ld d,a			;b0ef
	and a			;b0f0
	rst 10h			;b0f1
	or a			;b0f2
	ld h,(hl)		;b0f3
	adc a,01ch		;b0f4
	ld sp,hl		;b0f6
	jp m,le5f2h		;b0f7
	jp pe,014cah		;b0fa
	exx			;b0fd
	inc hl			;b0fe
	rst 8			;b0ff
	rra			;b100
	rst 38h			;b101
	rst 38h			;b102
	rst 38h			;b103
	rst 38h			;b104
	rst 38h			;b105
	rst 38h			;b106
	rst 38h			;b107
	rst 38h			;b108
	ld a,b			;b109
	inc bc			;b10a
	rst 8			;b10b
	rst 38h			;b10c
	rst 38h			;b10d
	rst 38h			;b10e
	rst 38h			;b10f
	rst 38h			;b110
	rst 38h			;b111
	rst 38h			;b112
	rrca			;b113
	ld h,a			;b114
	sub a			;b115
	rst 10h			;b116
	nop			;b117
	add a,b			;b118
	ld (hl),05ch		;b119
	ld l,04ch		;b11b
	ld c,0dch		;b11d
	sbc a,0deh		;b11f
	call c,sub_dcdah	;b121
	jp c,l9ecch		;b124
	and (hl)		;b127
	and d			;b128
	and d			;b129
	ld a,05ch		;b12a
	xor d			;b12c
	xor h			;b12d
	ld c,(hl)		;b12e
	adc a,h			;b12f
	and (hl)		;b130
	ld l,066h		;b131
	adc a,0d6h		;b133
	adc a,0deh		;b135
	call z,sub_ccdeh	;b137
	sbc a,0ceh		;b13a
	sbc a,0dch		;b13c
	jp c,leecch		;b13e
	inc c			;b141
	jp z,leaech		;b142
	call pe,sub_eeeah	;b145
	call z,sub_dcdah	;b148
	jp c,lbe9ch		;b14b
	or h			;b14e
	nop			;b14f
	nop			;b150
	inc bc			;b151
	ld c,01dh		;b152
	ld a,(de)		;b154
	dec a			;b155
	ld a,(01e3dh)		;b156
	cp l			;b159
	rrca			;b15a
	rla			;b15b
	dec hl			;b15c
	nop			;b15d
	xor a			;b15e
	nop			;b15f
	inc a			;b160
	jp 044a8h		;b161
	xor b			;b164
	ld d,l			;b165
	jp pe,0aa51h		;b166
	ld d,l			;b169
	xor (hl)		;b16a
	push de			;b16b
	ex de,hl		;b16c
	dec a			;b16d
	rst 38h			;b16e
	ld (bc),a		;b16f
	nop			;b170
	nop			;b171
	ret po			;b172
	inc (hl)		;b173
	ld a,(de)		;b174
	rla			;b175
	xor b			;b176
	ld d,h			;b177
	sbc a,d			;b178
	ld (hl),l		;b179
	cp e			;b17a
	ld a,l			;b17b
	rst 38h			;b17c
	ld d,a			;b17d
	rst 38h			;b17e
	and d			;b17f
	nop			;b180
	nop			;b181
	nop			;b182
	nop			;b183
	and h			;b184
	ld e,e			;b185
	ret po			;b186
	jr lb18dh		;b187
	ld b,l			;b189
	xor d			;b18a
	ld d,a			;b18b
	xor (hl)		;b18c
lb18dh:
	ld sp,hl		;b18d
	ld (hl),e		;b18e
	add a,b			;b18f
	nop			;b190
	nop			;b191
	nop			;b192
	nop			;b193
	nop			;b194
	ld l,h			;b195
	nop			;b196
	nop			;b197
	nop			;b198
	rla			;b199
	xor b			;b19a
	ld d,h			;b19b
	add a,b			;b19c
	nop			;b19d
	or l			;b19e
	ld c,d			;b19f
	nop			;b1a0
	nop			;b1a1
	nop			;b1a2
	nop			;b1a3
	nop			;b1a4
	add a,b			;b1a5
	nop			;b1a6
	nop			;b1a7
	nop			;b1a8
	ret nz			;b1a9
	nop			;b1aa
	ld d,b			;b1ab
	nop			;b1ac
	nop			;b1ad
	and (hl)		;b1ae
	nop			;b1af
	nop			;b1b0
	nop			;b1b1
	nop			;b1b2
	nop			;b1b3
	nop			;b1b4
	ld c,e			;b1b5
	nop			;b1b6
	nop			;b1b7
	nop			;b1b8
	nop			;b1b9
	nop			;b1ba
	nop			;b1bb
	nop			;b1bc
	nop			;b1bd
	nop			;b1be
	nop			;b1bf
	nop			;b1c0
	rlca			;b1c1
	nop			;b1c2
	nop			;b1c3
	nop			;b1c4
	ld d,l			;b1c5
	nop			;b1c6
	nop			;b1c7
	nop			;b1c8
	nop			;b1c9
	nop			;b1ca
	ld (bc),a		;b1cb
	dec c			;b1cc
	ld (hl),e		;b1cd
	nop			;b1ce
	nop			;b1cf
	nop			;b1d0
	nop			;b1d1
	nop			;b1d2
	nop			;b1d3
	inc c			;b1d4
	rra			;b1d5
	ccf			;b1d6
	ld a,d			;b1d7
	rst 38h			;b1d8
	ld l,a			;b1d9
	nop			;b1da
	nop			;b1db
	ld a,(bc)		;b1dc
	ld d,l			;b1dd
	nop			;b1de
	nop			;b1df
	inc a			;b1e0
	ld l,d			;b1e1
	push de			;b1e2
	xor d			;b1e3
	xor 055h		;b1e4
	nop			;b1e6
	rlca			;b1e7
	rrca			;b1e8
	ld e,03dh		;b1e9
	dec sp			;b1eb
	ld (hl),l		;b1ec
	xor 077h		;b1ed
	cp 07dh			;b1ef
	rst 38h			;b1f1
	nop			;b1f2
	nop			;b1f3
	xor d			;b1f4
	ld d,b			;b1f5
	nop			;b1f6
	nop			;b1f7
	inc e			;b1f8
	inc hl			;b1f9
	ld d,b			;b1fa
	jp pe,lead4h		;b1fb
	ret p			;b1fe
	ret pe			;b1ff
	ld d,l			;b200
	xor d			;b201
	ld (hl),l		;b202
	xor e			;b203
	ld d,l			;b204
	xor e			;b205
	ld d,a			;b206
	defb 0edh ;next byte illegal after ed	;b207
	jp c,000b7h		;b208
	nop			;b20b
	rst 30h			;b20c
	nop			;b20d
	nop			;b20e
	nop			;b20f
	nop			;b210
	add a,e			;b211
	ld b,a			;b212
	cpl			;b213
	dec l			;b214
	cp e			;b215
	ld (hl),l		;b216
	cp 0fdh			;b217
	jp m,lfef5h		;b219
	rst 30h			;b21c
	rst 38h			;b21d
	rst 38h			;b21e
	jp m,l7fffh		;b21f
	xor l			;b222
	inc de			;b223
	ld l,h			;b224
	nop			;b225
	nop			;b226
	nop			;b227
	ret m			;b228
	adc a,(hl)		;b229
	ld b,c			;b22a
	xor b			;b22b
	call nc,041aah		;b22c
	and b			;b22f
	ld d,h			;b230
	xor d			;b231
	ld d,l			;b232
	xor d			;b233
	push de			;b234
	xor 0f5h		;b235
	ex de,hl		;b237
	ld e,l			;b238
	rst 28h			;b239
	ld e,h			;b23a
	ret p			;b23b
	rla			;b23c
	nop			;b23d
	nop			;b23e
	nop			;b23f
	nop			;b240
	nop			;b241
	nop			;b242
	ret po			;b243
	djnz lb24eh		;b244
	ld c,b			;b246
	xor h			;b247
	ld b,h			;b248
	ld (0a855h),hl		;b249
	ld d,c			;b24c
	cp a			;b24d
lb24eh:
	ld l,d			;b24e
	call nc,sub_d56ah	;b24f
	nop			;b252
	nop			;b253
	or h			;b254
	nop			;b255
	nop			;b256
	nop			;b257
	nop			;b258
	nop			;b259
	nop			;b25a
	nop			;b25b
lb25ch:
	nop			;b25c
	nop			;b25d
	nop			;b25e
	nop			;b25f
	nop			;b260
	nop			;b261
	nop			;b262
	or 000h			;b263
	jr nc,lb267h		;b265
lb267h:
	nop			;b267
	and b			;b268
	ld d,h			;b269
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
	nop			;b274
	nop			;b275
	nop			;b276
	nop			;b277
	nop			;b278
	nop			;b279
	nop			;b27a
	nop			;b27b
	nop			;b27c
	nop			;b27d
	nop			;b27e
	nop			;b27f
	add a,b			;b280
	ret po			;b281
	call m,sub_eef3h	;b282
	push de			;b285
	jr z,lb25ch		;b286
	nop			;b288
	nop			;b289
	nop			;b28a
	nop			;b28b
	nop			;b28c
	nop			;b28d
	nop			;b28e
	nop			;b28f
	nop			;b290
	nop			;b291
	nop			;b292
	ld bc,00302h		;b293
	ld b,004h		;b296
	ld b,00ch		;b298
	jr lb2cch		;b29a
	ld hl,0514ah		;b29c
	add a,l			;b29f
	nop			;b2a0
	ld bc,00301h		;b2a1
	ld (bc),a		;b2a4
	dec b			;b2a5
	ld a,(0a054h)		;b2a6
	ret nz			;b2a9
	add a,b			;b2aa
	ld b,b			;b2ab
	add a,b			;b2ac
	ld bc,00f0fh		;b2ad
	ld (bc),a		;b2b0
	nop			;b2b1
	inc bc			;b2b2
	rra			;b2b3
	rst 38h			;b2b4
	rst 38h			;b2b5
	ld c,d			;b2b6
	add hl,bc		;b2b7
	ret po			;b2b8
	ld d,h			;b2b9
	xor d			;b2ba
	ld (hl),l		;b2bb
	ld a,(00e0dh)		;b2bc
	ccf			;b2bf
	ld a,a			;b2c0
	rst 38h			;b2c1
	ccf			;b2c2
	rrca			;b2c3
	ccf			;b2c4
	rst 38h			;b2c5
	rst 38h			;b2c6
	rst 38h			;b2c7
	sbc a,a			;b2c8
	ld a,a			;b2c9
	rst 38h			;b2ca
	rst 38h			;b2cb
lb2cch:
	rst 38h			;b2cc
	rst 38h			;b2cd
	rst 38h			;b2ce
	ld c,a			;b2cf
	nop			;b2d0
	nop			;b2d1
lb2d2h:
	nop			;b2d2
	nop			;b2d3
	add a,b			;b2d4
	ld b,b			;b2d5
	ret nz			;b2d6
	and b			;b2d7
	ret nc			;b2d8
	ret m			;b2d9
	call m,sub_fefdh	;b2da
	rst 38h			;b2dd
	rst 38h			;b2de
	rst 38h			;b2df
	rst 38h			;b2e0
	rst 38h			;b2e1
	rst 38h			;b2e2
	rst 38h			;b2e3
	rst 38h			;b2e4
	rst 38h			;b2e5
	rst 38h			;b2e6
	rst 38h			;b2e7
	nop			;b2e8
	nop			;b2e9
	nop			;b2ea
	nop			;b2eb
	nop			;b2ec
	nop			;b2ed
	nop			;b2ee
	nop			;b2ef
	nop			;b2f0
	nop			;b2f1
	nop			;b2f2
	nop			;b2f3
	add a,b			;b2f4
	ld b,b			;b2f5
	and b			;b2f6
	ld d,b			;b2f7
	xor b			;b2f8
	call p,sub_fdfah	;b2f9
	rst 38h			;b2fc
	rst 38h			;b2fd
	call m,000fbh		;b2fe
	nop			;b301
	nop			;b302
	nop			;b303
	nop			;b304
	nop			;b305
	nop			;b306
	nop			;b307
	nop			;b308
	nop			;b309
	nop			;b30a
	nop			;b30b
	nop			;b30c
	inc bc			;b30d
	inc b			;b30e
	add hl,bc		;b30f
	add hl,bc		;b310
	djnz lb323h		;b311
	inc sp			;b313
	ret po			;b314
	add a,l			;b315
	xor e			;b316
	rst 38h			;b317
	nop			;b318
	nop			;b319
	nop			;b31a
	nop			;b31b
	nop			;b31c
	ld bc,0180eh		;b31d
	djnz lb355h		;b320
	daa			;b322
lb323h:
	daa			;b323
	ld b,e			;b324
	pop bc			;b325
	xor b			;b326
	push af			;b327
	ld a,a			;b328
	adc a,a			;b329
	ld a,a			;b32a
	rst 38h			;b32b
	rrca			;b32c
lb32dh:
	ld a,a			;b32d
	rst 38h			;b32e
	rst 38h			;b32f
	nop			;b330
	nop			;b331
	nop			;b332
	jr c,lb39dh		;b333
	call z,00304h		;b335
	dec b			;b338
	adc a,d			;b339
	push de			;b33a
	xor a			;b33b
	rst 38h			;b33c
	rst 38h			;b33d
	xor a			;b33e
	ld a,a			;b33f
	rst 38h			;b340
	rst 38h			;b341
	rst 38h			;b342
	rst 38h			;b343
	rst 38h			;b344
	rst 38h			;b345
	rst 38h			;b346
	rst 38h			;b347
	nop			;b348
	nop			;b349
	nop			;b34a
	nop			;b34b
	nop			;b34c
	nop			;b34d
	nop			;b34e
	nop			;b34f
	nop			;b350
	ret nz			;b351
	ld h,b			;b352
	or b			;b353
	ret m			;b354
lb355h:
	ret m			;b355
	call m,lfffeh		;b356
	rst 38h			;b359
	rst 38h			;b35a
	rst 38h			;b35b
	rst 38h			;b35c
	rst 38h			;b35d
	rst 38h			;b35e
	rst 38h			;b35f
	nop			;b360
	nop			;b361
	inc bc			;b362
	ld b,005h		;b363
	add hl,de		;b365
	jr nz,lb32dh		;b366
	ld hl,(l8f1fh)		;b368
	rst 38h			;b36b
	rst 38h			;b36c
	rst 38h			;b36d
	rst 38h			;b36e
lb36fh:
	rst 38h			;b36f
	nop			;b370
	nop			;b371
	add a,b			;b372
	ret po			;b373
	ld d,b			;b374
	xor b			;b375
	call p,0ff3ah		;b376
	rst 38h			;b379
	rst 38h			;b37a
	rst 38h			;b37b
	rst 38h			;b37c
	rst 38h			;b37d
	rst 38h			;b37e
	rst 38h			;b37f
	nop			;b380
	nop			;b381
	nop			;b382
	nop			;b383
	nop			;b384
	nop			;b385
	nop			;b386
	nop			;b387
	nop			;b388
	nop			;b389
	nop			;b38a
	nop			;b38b
	nop			;b38c
	nop			;b38d
	nop			;b38e
lb38fh:
	nop			;b38f
	nop			;b390
	nop			;b391
	rlca			;b392
	inc e			;b393
	rst 28h			;b394
	rst 38h			;b395
	ccf			;b396
	pop bc			;b397
	cp 0ffh			;b398
	ld a,a			;b39a
	cp a			;b39b
	halt			;b39c
lb39dh:
	jp pe,leeech		;b39d
	rst 8			;b3a0
	rlca			;b3a1
	add a,a			;b3a2
	add a,e			;b3a3
	sub c			;b3a4
	and c			;b3a5
	sub e			;b3a6
	adc a,0e0h		;b3a7
	ld de,lf3efh		;b3a9
	call m,05a26h		;b3ac
	sbc a,e			;b3af
	ld e,a			;b3b0
	cp e			;b3b1
	jr c,lb36fh		;b3b2
	ld (hl),075h		;b3b4
	ex de,hl		;b3b6
	out (02bh),a		;b3b7
lb3b9h:
	out (0ebh),a		;b3b9
	push af			;b3bb
	ld sp,hl		;b3bc
	call p,000fah		;b3bd
	nop			;b3c0
	nop			;b3c1
	nop			;b3c2
	nop			;b3c3
	ld bc,00301h		;b3c4
	rlca			;b3c7
	rlca			;b3c8
	ld b,006h		;b3c9
	ld b,007h		;b3cb
	inc bc			;b3cd
	inc bc			;b3ce
	dec de			;b3cf
	ld a,h			;b3d0
	ld a,e			;b3d1
	rst 18h			;b3d2
	cp 0f9h			;b3d3
	push hl			;b3d5
	defb 0edh ;next byte illegal after ed	;b3d6
	defb 0ddh,0ddh,03dh ;illegal sequence	;b3d7
	cp e			;b3da
	ld a,e			;b3db
	call p,sub_fbf5h	;b3dc
	jp p,04761h		;b3df
	ld l,a			;b3e2
	ld c,05ch		;b3e3
	jr $+82			;b3e5
	djnz lb3b9h		;b3e7
	add a,c			;b3e9
	jp 066d7h		;b3ea
	inc h			;b3ed
	jr nc,lb38fh		;b3ee
	ex (sp),hl		;b3f0
	jp p,lb979h		;b3f1
	ld a,e			;b3f4
	ei			;b3f5
	jp ld5abh		;b3f6
	jp pe,lf3e5h		;b3f9
	or 0f9h			;b3fc
	jp m,00000h		;b3fe
sub_b401h:
	nop			;b401
	nop			;b402
	ld h,b			;b403
	ret nz			;b404
	add a,b			;b405
	add a,b			;b406
	nop			;b407
	nop			;b408
	nop			;b409
	nop			;b40a
	nop			;b40b
	nop			;b40c
	nop			;b40d
	add a,b			;b40e
	cp b			;b40f
	ld a,a			;b410
	rst 38h			;b411
	rst 38h			;b412
	nop			;b413
	or a			;b414
	in a,(0dbh)		;b415
	in a,(0dah)		;b417
	or (hl)			;b419
	and l			;b41a
	xor e			;b41b
	nop			;b41c
	call z,sub_7ffeh	;b41d
	cp a			;b420
	cp a			;b421
	cp a			;b422
	ex af,af'		;b423
	ld a,a			;b424
	rst 38h			;b425
	rst 8			;b426
	or a			;b427
	ld (hl),a		;b428
	ei			;b429
	rst 30h			;b42a
	rst 8			;b42b
	rrca			;b42c
	ld (bc),a		;b42d
	add a,b			;b42e
	ld a,(hl)		;b42f
	ld a,e			;b430
	pop af			;b431
	jp 00ec6h		;b432
	adc a,(hl)		;b435
	ld c,00bh		;b436
	add a,l			;b438
	ld a,l			;b439
	ret m			;b43a
	pop bc			;b43b
	inc sp			;b43c
	ld e,e			;b43d
	cp e			;b43e
	nop			;b43f
	nop			;b440
	nop			;b441
	nop			;b442
	nop			;b443
	nop			;b444
	nop			;b445
	jr lb478h		;b446
	jr nz,$+98		;b448
	ld h,b			;b44a
	ld (hl),b		;b44b
	ld (hl),b		;b44c
	ld a,b			;b44d
	ld a,b			;b44e
	jr c,lb469h		;b44f
	ret po			;b451
	ret m			;b452
	defb 0fdh,03fh,04fh ;illegal sequence	;b453
	ld h,(hl)		;b456
	ld l,c			;b457
	defb 0ddh,0bdh ;cp ixl	;b458
	ld a,e			;b45a
	ld d,a			;b45b
	xor a			;b45c
	ld (bc),a		;b45d
	pop hl			;b45e
	ld a,b			;b45f
	ld l,h			;b460
	rst 30h			;b461
	jp m,l7efdh		;b462
	rst 38h			;b465
	rst 38h			;b466
	rst 38h			;b467
	pop af			;b468
lb469h:
	rst 20h			;b469
	rst 18h			;b46a
	xor a			;b46b
	ld de,03f1fh		;b46c
	ld e,a			;b46f
	cp a			;b470
	rst 18h			;b471
	ld a,03fh		;b472
	ld a,(hl)		;b474
	ld a,l			;b475
	ld a,a			;b476
	sbc a,(hl)		;b477
lb478h:
	call po,03cf9h		;b478
	rst 0			;b47b
	ei			;b47c
lb47dh:
	push af			;b47d
	jp p,00000h		;b47e
	nop			;b481
	nop			;b482
	nop			;b483
	nop			;b484
	nop			;b485
	nop			;b486
	nop			;b487
	nop			;b488
	nop			;b489
	nop			;b48a
	nop			;b48b
	inc b			;b48c
	inc c			;b48d
	jr lb4a8h		;b48e
	inc e			;b490
	inc e			;b491
	inc c			;b492
	call pe,sub_f8f4h	;b493
	ld a,09fh		;b496
	jp ldad9h		;b498
	or (hl)			;b49b
	ld l,l			;b49c
	bit 6,a			;b49d
	or (hl)			;b49f
	add hl,de		;b4a0
	adc a,a			;b4a1
	rst 28h			;b4a2
	ld d,e			;b4a3
	or e			;b4a4
	out (0e9h),a		;b4a5
	push de			;b4a7
lb4a8h:
	call pe,sub_edf5h	;b4a8
	exx			;b4ab
	jp pe,lb2d2h		;b4ac
	pop de			;b4af
	and e			;b4b0
	ld l,a			;b4b1
	sbc a,040h		;b4b2
	and (hl)		;b4b4
	adc a,b			;b4b5
	jr z,lb501h		;b4b6
	and a			;b4b8
	ld d,b			;b4b9
	jr z,lb47dh		;b4ba
	jp p,0be79h		;b4bc
	nop			;b4bf
	nop			;b4c0
	nop			;b4c1
	nop			;b4c2
	nop			;b4c3
	nop			;b4c4
	nop			;b4c5
	nop			;b4c6
	nop			;b4c7
	nop			;b4c8
	nop			;b4c9
	nop			;b4ca
	nop			;b4cb
	nop			;b4cc
	nop			;b4cd
	nop			;b4ce
	nop			;b4cf
	nop			;b4d0
	ld b,00ch		;b4d1
	inc c			;b4d3
	inc e			;b4d4
	inc e			;b4d5
	jr lb53ch		;b4d6
	cp 0ffh			;b4d8
	rlca			;b4da
	pop de			;b4db
	sub 0b6h		;b4dc
	or h			;b4de
	ld h,c			;b4df
	rlca			;b4e0
	sbc a,a			;b4e1
	cp h			;b4e2
	cp e			;b4e3
	ld (hl),a		;b4e4
	ld (hl),a		;b4e5
	ld a,d			;b4e6
	xor b			;b4e7
	or a			;b4e8
	cp l			;b4e9
	ld e,(hl)		;b4ea
	ld h,e			;b4eb
	push af			;b4ec
	add a,0f6h		;b4ed
	ld a,d			;b4ef
	dec de			;b4f0
	ld b,l			;b4f1
	add hl,de		;b4f2
	cp l			;b4f3
	ld a,0beh		;b4f4
	ld (hl),a		;b4f6
	rst 30h			;b4f7
	ex (sp),hl		;b4f8
	dec d			;b4f9
	ex (sp),hl		;b4fa
	sbc a,c			;b4fb
	ld h,(hl)		;b4fc
	sub e			;b4fd
	ld h,a			;b4fe
	nop			;b4ff
sub_b500h:
	nop			;b500
lb501h:
	nop			;b501
	nop			;b502
	nop			;b503
	nop			;b504
	nop			;b505
	nop			;b506
	nop			;b507
	nop			;b508
	nop			;b509
	nop			;b50a
	nop			;b50b
	nop			;b50c
	nop			;b50d
	nop			;b50e
	nop			;b50f
	nop			;b510
	nop			;b511
	nop			;b512
lb513h:
	nop			;b513
	nop			;b514
	nop			;b515
	nop			;b516
	nop			;b517
	nop			;b518
	nop			;b519
	add a,b			;b51a
lb51bh:
	ret po			;b51b
	ret nc			;b51c
	ret p			;b51d
	ret nc			;b51e
	and b			;b51f
	ret nc			;b520
	djnz lb513h		;b521
	ret pe			;b523
	ret c			;b524
	jr c,lb51bh		;b525
	ld l,h			;b527
	sbc a,d			;b528
	ld h,(hl)		;b529
	cp b			;b52a
	sub 0fbh		;b52b
	or l			;b52d
	ld e,e			;b52e
	defb 0ddh,0bah,07ch ;illegal sequence	;b52f
	ld a,c			;b532
	ld a,e			;b533
	cp e			;b534
	xor c			;b535
	dec (hl)		;b536
	inc d			;b537
	ret nc			;b538
	rst 10h			;b539
	sub 097h		;b53a
lb53ch:
	scf			;b53c
	rst 28h			;b53d
	rst 38h			;b53e
	nop			;b53f
	nop			;b540
	nop			;b541
	nop			;b542
	nop			;b543
	nop			;b544
	nop			;b545
	nop			;b546
	nop			;b547
	inc bc			;b548
	rlca			;b549
	inc e			;b54a
	inc sp			;b54b
	dec l			;b54c
	ld l,e			;b54d
	ld (hl),a		;b54e
	ld c,h			;b54f
	jr c,lb57eh		;b550
	inc (hl)		;b552
	inc l			;b553
	ld (hl),02ah		;b554
	ld e,013h		;b556
	rla			;b558
	add hl,de		;b559
	inc de			;b55a
	inc c			;b55b
	dec bc			;b55c
	inc c			;b55d
	dec b			;b55e
	rlca			;b55f
	inc bc			;b560
	ld bc,00000h		;b561
	nop			;b564
	nop			;b565
	nop			;b566
	nop			;b567
	nop			;b568
	nop			;b569
	nop			;b56a
	nop			;b56b
	nop			;b56c
	nop			;b56d
	nop			;b56e
	ld b,b			;b56f
	ld (hl),e		;b570
	ld e,a			;b571
	xor e			;b572
	xor l			;b573
	call sub_fff1h		;b574
	ld a,a			;b577
	cp a			;b578
	ld b,a			;b579
	ret pe			;b57a
lb57bh:
	ld l,h			;b57b
	cp e			;b57c
	ld h,h			;b57d
lb57eh:
	and b			;b57e
	nop			;b57f
	nop			;b580
	nop			;b581
	nop			;b582
	nop			;b583
	nop			;b584
	nop			;b585
	nop			;b586
	nop			;b587
	call m,0aaa7h		;b588
	ld e,l			;b58b
	rst 38h			;b58c
	cp d			;b58d
	ld l,e			;b58e
	add hl,hl		;b58f
	jr z,lb5bah		;b590
	ex af,af'		;b592
	ex af,af'		;b593
	ex af,af'		;b594
	ex af,af'		;b595
	ex af,af'		;b596
	ex af,af'		;b597
	nop			;b598
	add a,b			;b599
	add a,b			;b59a
	add a,b			;b59b
	ret nz			;b59c
	ld h,b			;b59d
	ret p			;b59e
	ret po			;b59f
	sub b			;b5a0
	ld d,b			;b5a1
	xor b			;b5a2
	or (hl)			;b5a3
	ld d,a			;b5a4
	cpl			;b5a5
	ccf			;b5a6
	dec sp			;b5a7
	inc d			;b5a8
	rla			;b5a9
	ld d,039h		;b5aa
	ld a,(hl)		;b5ac
	ccf			;b5ad
	scf			;b5ae
	ld l,e			;b5af
	sbc a,l			;b5b0
	exx			;b5b1
	push de			;b5b2
	adc a,0ddh		;b5b3
	ex de,hl		;b5b5
	and 0e9h		;b5b6
	xor 0f5h		;b5b8
lb5bah:
	di			;b5ba
	or 0f4h			;b5bb
	ld l,b			;b5bd
	nop			;b5be
	nop			;b5bf
	nop			;b5c0
	nop			;b5c1
	nop			;b5c2
	nop			;b5c3
	nop			;b5c4
	nop			;b5c5
	nop			;b5c6
	nop			;b5c7
	nop			;b5c8
	nop			;b5c9
	add a,b			;b5ca
	ret nz			;b5cb
	ld h,b			;b5cc
	or b			;b5cd
	ld d,b			;b5ce
	or b			;b5cf
	ret pe			;b5d0
	ld e,b			;b5d1
	ld a,h			;b5d2
	ld d,h			;b5d3
	inc l			;b5d4
	inc (hl)		;b5d5
	inc l			;b5d6
	inc (hl)		;b5d7
	ld a,(de)		;b5d8
	ld c,00ah		;b5d9
	ld c,006h		;b5db
	ld b,00eh		;b5dd
	ld e,(hl)		;b5df
	inc a			;b5e0
	inc d			;b5e1
	inc d			;b5e2
	inc b			;b5e3
	inc b			;b5e4
	inc b			;b5e5
	nop			;b5e6
	add a,b			;b5e7
	ret nz			;b5e8
	ld b,b			;b5e9
	ret nz			;b5ea
	ret nz			;b5eb
	ret nz			;b5ec
	ld b,b			;b5ed
	ld b,b			;b5ee
	ret nz			;b5ef
	ret nz			;b5f0
	ret po			;b5f1
	ret po			;b5f2
	ret po			;b5f3
	ld b,b			;b5f4
	ld b,b			;b5f5
	ld b,b			;b5f6
	ld b,b			;b5f7
	add a,b			;b5f8
	add a,b			;b5f9
	nop			;b5fa
	nop			;b5fb
	nop			;b5fc
	nop			;b5fd
	nop			;b5fe
	nop			;b5ff
	rst 38h			;b600
	rst 38h			;b601
	rra			;b602
	rst 20h			;b603
	exx			;b604
	ld h,041h		;b605
	ld b,b			;b607
	rlca			;b608
	ex af,af'		;b609
	and a			;b60a
	call nz,062a2h		;b60b
	or c			;b60e
	ld d,c			;b60f
	or c			;b610
	ld d,c			;b611
	cp b			;b612
	ld e,b			;b613
	cp b			;b614
	ld d,(hl)		;b615
	or l			;b616
	ld l,e			;b617
	rst 38h			;b618
	jp 03080h		;b619
	ld c,b			;b61c
	or h			;b61d
	inc c			;b61e
	call p,0880ch		;b61f
	ld d,b			;b622
	sub b			;b623
	inc hl			;b624
	and (hl)		;b625
	ld h,l			;b626
	xor d			;b627
	ld c,l			;b628
	ld c,d			;b629
	sub l			;b62a
	sbc a,d			;b62b
	sub l			;b62c
	sbc a,d			;b62d
	sub l			;b62e
	sbc a,d			;b62f
	rst 38h			;b630
	rrca			;b631
	inc bc			;b632
	nop			;b633
	ld e,07fh		;b634
	ld a,a			;b636
	inc bc			;b637
	ld bc,l6b3eh		;b638
	ld d,l			;b63b
	xor d			;b63c
	or l			;b63d
lb63eh:
	ld e,d			;b63e
	push de			;b63f
	ld c,d			;b640
	xor l			;b641
	ld h,(hl)		;b642
	and l			;b643
	ld d,(hl)		;b644
	or e			;b645
	ld d,d			;b646
	or e			;b647
	rst 38h			;b648
	rst 38h			;b649
	rst 38h			;b64a
	ld a,h			;b64b
	jr c,lb63eh		;b64c
	rst 20h			;b64e
	call pe,sub_e0f0h	;b64f
	ld b,b			;b652
	jp 045c2h		;b653
	and (hl)		;b656
	ld l,l			;b657
	cp d			;b658
	ld d,l			;b659
	cp d			;b65a
	ld d,l			;b65b
	xor d			;b65c
	ld d,l			;b65d
	xor d			;b65e
	ld d,l			;b65f
	rst 38h			;b660
	nop			;b661
	rst 38h			;b662
	nop			;b663
	rst 38h			;b664
	nop			;b665
	rst 38h			;b666
	nop			;b667
	cp 000h			;b668
	ret nz			;b66a
	ld bc,03f80h		;b66b
	nop			;b66e
	ld a,d			;b66f
	ret p			;b670
	dec b			;b671
	ret po			;b672
	dec bc			;b673
	ret nz			;b674
	dec d			;b675
	add a,b			;b676
	dec sp			;b677
	nop			;b678
	ld (hl),a		;b679
	nop			;b67a
	xor a			;b67b
	nop			;b67c
	ld d,l			;b67d
	nop			;b67e
	rst 38h			;b67f
	rra			;b680
	ret nz			;b681
	rrca			;b682
	ret po			;b683
	ld bc,000d0h		;b684
	xor 000h		;b687
	push af			;b689
	nop			;b68a
	rst 38h			;b68b
	nop			;b68c
	rst 38h			;b68d
	nop			;b68e
	rst 38h			;b68f
	rst 38h			;b690
	nop			;b691
	rst 38h			;b692
	nop			;b693
	rst 38h			;b694
	nop			;b695
	ccf			;b696
	nop			;b697
	rrca			;b698
	ret nz			;b699
	inc bc			;b69a
	or b			;b69b
	nop			;b69c
	call pe,sub_feffh+1	;b69d
	rst 38h			;b6a0
	nop			;b6a1
	rst 38h			;b6a2
	nop			;b6a3
	rst 38h			;b6a4
	nop			;b6a5
	rst 38h			;b6a6
	nop			;b6a7
	rst 38h			;b6a8
	nop			;b6a9
	rst 38h			;b6aa
	nop			;b6ab
	rst 38h			;b6ac
	nop			;b6ad
	rst 38h			;b6ae
	nop			;b6af
	rst 38h			;b6b0
	nop			;b6b1
	rst 38h			;b6b2
	nop			;b6b3
	rst 38h			;b6b4
	nop			;b6b5
	cp 000h			;b6b6
	ret m			;b6b8
	ld bc,007c0h		;b6b9
	nop			;b6bc
	dec sp			;b6bd
	nop			;b6be
	rst 30h			;b6bf
	rst 38h			;b6c0
	nop			;b6c1
	rst 38h			;b6c2
	nop			;b6c3
	rst 38h			;b6c4
	nop			;b6c5
	call m,sub_f800h	;b6c6
	inc bc			;b6c9
	ret m			;b6ca
	inc bc			;b6cb
	ret p			;b6cc
	rlca			;b6cd
	ret po			;b6ce
	rrca			;b6cf
	ret nz			;b6d0
	rra			;b6d1
	add a,b			;b6d2
	ccf			;b6d3
	nop			;b6d4
	ld a,a			;b6d5
	nop			;b6d6
	rst 38h			;b6d7
	nop			;b6d8
	rst 38h			;b6d9
	nop			;b6da
	rst 38h			;b6db
	nop			;b6dc
	rst 38h			;b6dd
	nop			;b6de
	rst 38h			;b6df
	call m,sub_c001h	;b6e0
	rlca			;b6e3
	nop			;b6e4
	dec sp			;b6e5
	nop			;b6e6
	rst 18h			;b6e7
	nop			;b6e8
	cp 000h			;b6e9
	rst 38h			;b6eb
	nop			;b6ec
	rst 38h			;b6ed
	nop			;b6ee
	rst 38h			;b6ef
	nop			;b6f0
	rst 38h			;b6f1
	nop			;b6f2
	rst 38h			;b6f3
	nop			;b6f4
	rst 38h			;b6f5
	nop			;b6f6
	rst 38h			;b6f7
	nop			;b6f8
	rst 38h			;b6f9
	nop			;b6fa
	rst 38h			;b6fb
	nop			;b6fc
	rst 38h			;b6fd
	nop			;b6fe
	rst 38h			;b6ff
lb700h:
	ccf			;b700
	add a,b			;b701
	rra			;b702
	ret nz			;b703
	rlca			;b704
	and b			;b705
	inc bc			;b706
	ld e,b			;b707
	nop			;b708
	call po,sub_7b00h	;b709
	nop			;b70c
	ret pe			;b70d
	nop			;b70e
	push af			;b70f
	nop			;b710
	xor 000h		;b711
	defb 0fdh,000h,0ffh ;illegal sequence	;b713
	nop			;b716
	rst 38h			;b717
	nop			;b718
	rst 38h			;b719
	nop			;b71a
	rst 38h			;b71b
	nop			;b71c
	rst 38h			;b71d
	nop			;b71e
	rst 38h			;b71f
	rst 38h			;b720
	nop			;b721
	rst 38h			;b722
	nop			;b723
	rst 38h			;b724
	nop			;b725
	rst 38h			;b726
	nop			;b727
	ld a,a			;b728
	nop			;b729
	ccf			;b72a
	add a,b			;b72b
	rra			;b72c
	ret nz			;b72d
	rrca			;b72e
	ld h,b			;b72f
	inc bc			;b730
	ret p			;b731
	ld bc,000ech		;b732
	jp pe,sub_feffh+1	;b735
	nop			;b738
	rst 38h			;b739
	nop			;b73a
	cp 000h			;b73b
	rst 38h			;b73d
	nop			;b73e
	rst 38h			;b73f
	rst 38h			;b740
	nop			;b741
	rst 38h			;b742
	nop			;b743
	rst 38h			;b744
	nop			;b745
	rst 38h			;b746
	nop			;b747
	rst 38h			;b748
	nop			;b749
	rst 38h			;b74a
	nop			;b74b
	rst 38h			;b74c
	nop			;b74d
	rst 38h			;b74e
	nop			;b74f
	rst 38h			;b750
	nop			;b751
	rst 38h			;b752
	nop			;b753
	ld a,a			;b754
	nop			;b755
	rra			;b756
	add a,b			;b757
	rlca			;b758
	ret po			;b759
	inc bc			;b75a
	cp b			;b75b
	nop			;b75c
	ld (hl),h		;b75d
	nop			;b75e
	rst 38h			;b75f
	rst 38h			;b760
	ld bc,lfefch		;b761
	rst 38h			;b764
	defb 0fdh,0ffh,0ffh ;illegal sequence	;b765
	rst 18h			;b768
	rst 38h			;b769
	rst 38h			;b76a
	rst 38h			;b76b
	pop hl			;b76c
	rst 38h			;b76d
	rst 30h			;b76e
	rst 38h			;b76f
	rst 38h			;b770
	rst 38h			;b771
	ret nz			;b772
	ld e,0ffh		;b773
	rst 38h			;b775
	rst 38h			;b776
	rst 38h			;b777
	cp 0ffh			;b778
	rst 38h			;b77a
	rst 38h			;b77b
	ld a,a			;b77c
	rst 38h			;b77d
	cp 0ffh			;b77e
	rst 38h			;b780
	rst 38h			;b781
	cp 010h			;b782
	rst 0			;b784
	defb 0fdh,0ffh,0efh ;illegal sequence	;b785
	rst 38h			;b788
	rst 38h			;b789
	rst 38h			;b78a
	rst 38h			;b78b
	rst 38h			;b78c
	rst 38h			;b78d
	jp nc,lffffh		;b78e
	ret m			;b791
	inc bc			;b792
	rst 38h			;b793
	rst 38h			;b794
	rst 30h			;b795
	rst 38h			;b796
	rst 38h			;b797
	rst 38h			;b798
	rst 38h			;b799
	ld a,a			;b79a
	cp 0ffh			;b79b
	rst 38h			;b79d
	rst 38h			;b79e
	rst 38h			;b79f
	rst 38h			;b7a0
	ccf			;b7a1
	sbc a,a			;b7a2
	rst 8			;b7a3
	ret po			;b7a4
	cp 0ffh			;b7a5
	rst 38h			;b7a7
	rst 38h			;b7a8
	rst 28h			;b7a9
	rst 38h			;b7aa
	rst 38h			;b7ab
	rst 38h			;b7ac
	rst 38h			;b7ad
	defb 0fdh,0ffh,07fh ;illegal sequence	;b7ae
	rst 38h			;b7b1
	rst 38h			;b7b2
	rst 38h			;b7b3
	cp 0ffh			;b7b4
	ld a,a			;b7b6
	rst 38h			;b7b7
	rst 38h			;b7b8
	rst 38h			;b7b9
	rst 38h			;b7ba
	rst 38h			;b7bb
	rst 38h			;b7bc
	ccf			;b7bd
	sbc a,a			;b7be
	rst 0			;b7bf
	di			;b7c0
	ld a,b			;b7c1
	rst 38h			;b7c2
	rst 38h			;b7c3
	rst 38h			;b7c4
	set 7,a			;b7c5
	rst 38h			;b7c7
	ei			;b7c8
	rst 38h			;b7c9
	rst 38h			;b7ca
	rst 38h			;b7cb
	add a,a			;b7cc
	rst 38h			;b7cd
	rst 28h			;b7ce
	rst 38h			;b7cf
	rst 38h			;b7d0
	rst 18h			;b7d1
	ret m			;b7d2
	rst 30h			;b7d3
	di			;b7d4
	ex de,hl		;b7d5
	rst 20h			;b7d6
	out (0c7h),a		;b7d7
	and l			;b7d9
	jp lf8e4h		;b7da
	rst 38h			;b7dd
	cp c			;b7de
	rst 28h			;b7df
	rst 38h			;b7e0
	di			;b7e1
	ccf			;b7e2
	adc a,a			;b7e3
	ld d,a			;b7e4
	xor e			;b7e5
	out (0fbh),a		;b7e6
	push af			;b7e8
	ld sp,hl		;b7e9
	ex (sp),iy		;b7ea
	rra			;b7ec
	ei			;b7ed
	rst 38h			;b7ee
	cp a			;b7ef
	rst 38h			;b7f0
	cp a			;b7f1
	rst 38h			;b7f2
	rst 38h			;b7f3
	rst 38h			;b7f4
	rst 38h			;b7f5
	ld sp,hl		;b7f6
	and 0d7h		;b7f7
	rst 8			;b7f9
	rst 0			;b7fa
	pop hl			;b7fb
	ret p			;b7fc
	xor e			;b7fd
	rst 18h			;b7fe
	rst 38h			;b7ff
	rst 38h			;b800
sub_b801h:
	rst 38h			;b801
	rst 38h			;b802
	xor 0fdh		;b803
	jp m,075f9h		;b805
	inc sp			;b808
	sub c			;b809
	ret po			;b80a
	add a,b			;b80b
	adc a,b			;b80c
	ld d,l			;b80d
	rst 28h			;b80e
	rst 38h			;b80f
	rst 38h			;b810
	rst 38h			;b811
	pop bc			;b812
	inc (hl)		;b813
	jp m,lffffh		;b814
	rst 38h			;b817
	rst 38h			;b818
	rst 38h			;b819
	rst 38h			;b81a
	ccf			;b81b
	rrca			;b81c
	ld c,b			;b81d
	rst 30h			;b81e
	rst 38h			;b81f
	rst 38h			;b820
	rst 20h			;b821
	rst 38h			;b822
	ccf			;b823
	sbc a,a			;b824
	ld c,a			;b825
	and a			;b826
	rst 10h			;b827
	rst 20h			;b828
	rst 30h			;b829
	rst 20h			;b82a
	rst 30h			;b82b
	sla c			;b82c
	ld a,e			;b82e
	rst 38h			;b82f
	rst 38h			;b830
	nop			;b831
	rst 38h			;b832
	nop			;b833
	rst 38h			;b834
	nop			;b835
	rst 38h			;b836
	nop			;b837
	rst 38h			;b838
	nop			;b839
	rst 38h			;b83a
	nop			;b83b
	rst 38h			;b83c
	nop			;b83d
	rst 38h			;b83e
	nop			;b83f
	rst 38h			;b840
	nop			;b841
	cp 000h			;b842
	call m,lfc01h		;b844
	ld bc,001fch		;b847
	call m,lfc01h		;b84a
	ld bc,001fch		;b84d
	call m,sub_f801h	;b850
	ld (bc),a		;b853
	ret m			;b854
	ld (bc),a		;b855
	ret p			;b856
	dec b			;b857
	ret p			;b858
	inc b			;b859
	ret p			;b85a
	inc b			;b85b
	ret p			;b85c
	dec b			;b85d
	ret p			;b85e
	dec b			;b85f
	ret po			;b860
	add hl,bc		;b861
	ret po			;b862
	dec bc			;b863
	ret nz			;b864
	inc de			;b865
	ret nz			;b866
	inc de			;b867
	ret nz			;b868
	daa			;b869
	add a,b			;b86a
	inc hl			;b86b
	add a,b			;b86c
	daa			;b86d
	add a,b			;b86e
	ld h,080h		;b86f
	ld l,000h		;b871
	ld d,(hl)		;b873
	nop			;b874
	ld b,(hl)		;b875
	nop			;b876
	ld b,(hl)		;b877
	nop			;b878
	ld c,(hl)		;b879
	nop			;b87a
	ld d,(hl)		;b87b
	nop			;b87c
	ld c,(hl)		;b87d
	nop			;b87e
	ld e,l			;b87f
	nop			;b880
	ld e,l			;b881
	nop			;b882
	ld c,l			;b883
	nop			;b884
	ld e,e			;b885
	add a,b			;b886
	dec hl			;b887
	ret nz			;b888
	dec de			;b889
	ret po			;b88a
	inc bc			;b88b
	call m,sub_fe01h	;b88c
	nop			;b88f
	rst 38h			;b890
	nop			;b891
	cp 000h			;b892
	ret po			;b894
	ld bc,01ec0h		;b895
	add a,b			;b898
	dec a			;b899
	add a,b			;b89a
	cpl			;b89b
	nop			;b89c
	ld e,a			;b89d
	nop			;b89e
	ld e,(hl)		;b89f
	nop			;b8a0
	ld e,a			;b8a1
	nop			;b8a2
	sbc a,a			;b8a3
	nop			;b8a4
	ccf			;b8a5
	nop			;b8a6
	ld a,a			;b8a7
	nop			;b8a8
	ccf			;b8a9
	nop			;b8aa
	ld a,a			;b8ab
	nop			;b8ac
	ccf			;b8ad
	nop			;b8ae
	ld a,e			;b8af
	nop			;b8b0
	ccf			;b8b1
	nop			;b8b2
	ccf			;b8b3
	nop			;b8b4
	ld a,a			;b8b5
	nop			;b8b6
	rst 38h			;b8b7
	nop			;b8b8
	rst 38h			;b8b9
	nop			;b8ba
	rst 38h			;b8bb
	nop			;b8bc
	rst 38h			;b8bd
	nop			;b8be
	cp a			;b8bf
	nop			;b8c0
	rst 38h			;b8c1
	nop			;b8c2
	rst 38h			;b8c3
	nop			;b8c4
	rst 38h			;b8c5
	nop			;b8c6
	call c,sub_bf00h	;b8c7
	nop			;b8ca
	ld a,a			;b8cb
	nop			;b8cc
	ld a,l			;b8cd
	nop			;b8ce
	rst 38h			;b8cf
	nop			;b8d0
	pop hl			;b8d1
	nop			;b8d2
	sbc a,(hl)		;b8d3
	nop			;b8d4
	ld a,a			;b8d5
	nop			;b8d6
	rst 38h			;b8d7
	nop			;b8d8
	rst 38h			;b8d9
	nop			;b8da
	rst 28h			;b8db
	nop			;b8dc
	rst 38h			;b8dd
	nop			;b8de
	rst 38h			;b8df
	nop			;b8e0
	rst 38h			;b8e1
	nop			;b8e2
	rst 38h			;b8e3
	nop			;b8e4
	rst 38h			;b8e5
	nop			;b8e6
	rst 38h			;b8e7
	nop			;b8e8
	ld a,c			;b8e9
	nop			;b8ea
	rst 38h			;b8eb
	nop			;b8ec
	rst 38h			;b8ed
	nop			;b8ee
	nop			;b8ef
	jp 00000h		;b8f0
	inc a			;b8f3
	nop			;b8f4
	rst 10h			;b8f5
	nop			;b8f6
	xor d			;b8f7
	nop			;b8f8
	push af			;b8f9
	nop			;b8fa
	jp m,lfd00h		;b8fb
	nop			;b8fe
	cp 000h			;b8ff
	rst 38h			;b901
	nop			;b902
	cp 000h			;b903
	rst 8			;b905
	nop			;b906
	rst 8			;b907
	nop			;b908
	rst 38h			;b909
	nop			;b90a
	cp 000h			;b90b
	rst 38h			;b90d
	nop			;b90e
	rst 38h			;b90f
	nop			;b910
	rst 38h			;b911
	nop			;b912
	rst 38h			;b913
	nop			;b914
	rst 8			;b915
	nop			;b916
	rst 30h			;b917
	nop			;b918
	ei			;b919
	nop			;b91a
	push bc			;b91b
	nop			;b91c
	cp (hl)			;b91d
	nop			;b91e
	rst 38h			;b91f
	nop			;b920
	rst 38h			;b921
	nop			;b922
	rst 38h			;b923
	nop			;b924
	rst 38h			;b925
	nop			;b926
	cp 000h			;b927
	rst 38h			;b929
	nop			;b92a
	rst 18h			;b92b
	nop			;b92c
	rst 38h			;b92d
	nop			;b92e
	rst 38h			;b92f
	nop			;b930
	rst 38h			;b931
	nop			;b932
	rst 38h			;b933
	nop			;b934
	rst 38h			;b935
	nop			;b936
	rst 38h			;b937
	nop			;b938
	rst 18h			;b939
	nop			;b93a
	rst 8			;b93b
	nop			;b93c
	rst 38h			;b93d
	nop			;b93e
	rst 38h			;b93f
	nop			;b940
	rst 38h			;b941
	nop			;b942
	cp 000h			;b943
	rst 38h			;b945
	nop			;b946
	rst 38h			;b947
	nop			;b948
	defb 0fdh,000h,0eah ;illegal sequence	;b949
	nop			;b94c
	rst 38h			;b94d
	nop			;b94e
	nop			;b94f
	rst 38h			;b950
	nop			;b951
	rst 38h			;b952
	nop			;b953
	ld a,a			;b954
	nop			;b955
	ccf			;b956
	add a,b			;b957
	rra			;b958
	ld b,b			;b959
	rra			;b95a
	ret nz			;b95b
	rra			;b95c
	ld b,b			;b95d
	rra			;b95e
	ret nz			;b95f
	rra			;b960
	ld b,b			;b961
	rrca			;b962
	and b			;b963
	rrca			;b964
	ld h,b			;b965
	rrca			;b966
	and b			;b967
	rlca			;b968
	ret nc			;b969
	inc bc			;b96a
	xor b			;b96b
	inc bc			;b96c
	ret c			;b96d
	inc bc			;b96e
	ret pe			;b96f
	inc bc			;b970
	ret c			;b971
	inc bc			;b972
	ret pe			;b973
	rlca			;b974
	ret nc			;b975
	rlca			;b976
	ret p			;b977
	rlca			;b978
lb979h:
	ret nc			;b979
	rlca			;b97a
	ret p			;b97b
	rrca			;b97c
	ret po			;b97d
	rrca			;b97e
	nop			;b97f
	rrca			;b980
	ret po			;b981
	rrca			;b982
	ret po			;b983
	rlca			;b984
	ret nc			;b985
	inc bc			;b986
	ret pe			;b987
	inc bc			;b988
	ret c			;b989
lb98ah:
	inc bc			;b98a
	ret pe			;b98b
	inc bc			;b98c
	ret c			;b98d
	inc bc			;b98e
	ret pe			;b98f
	ld bc,001f4h		;b990
	ld l,h			;b993
	ld bc,000f4h		;b994
	jp m,lf600h		;b997
	nop			;b99a
	jp m,lf600h		;b99b
	nop			;b99e
	jp pe,lf600h		;b99f
	nop			;b9a2
	jp pe,0d600h		;b9a3
	nop			;b9a6
	jp pe,05401h		;b9a7
	inc bc			;b9aa
	xor b			;b9ab
	rlca			;b9ac
	ret p			;b9ad
	rrca			;b9ae
	nop			;b9af
	rst 38h			;b9b0
	nop			;b9b1
	rst 38h			;b9b2
	nop			;b9b3
	rst 38h			;b9b4
	nop			;b9b5
	rst 38h			;b9b6
	nop			;b9b7
	cp 000h			;b9b8
	call m,sub_f800h	;b9ba
	ld bc,003f0h		;b9bd
	ret po			;b9c0
	rlca			;b9c1
	ret po			;b9c2
	rlca			;b9c3
	ret po			;b9c4
	rlca			;b9c5
	ret nz			;b9c6
	inc c			;b9c7
	ret nz			;b9c8
	ex af,af'		;b9c9
	pop bc			;b9ca
	ex af,af'		;b9cb
	ex (sp),hl		;b9cc
	nop			;b9cd
	rst 30h			;b9ce
	nop			;b9cf
lb9d0h:
	cp 000h			;b9d0
	call m,sub_f800h	;b9d2
	ld bc,000fch		;b9d5
	cp 000h			;b9d8
	cp 000h			;b9da
	call m,sub_f800h	;b9dc
	ld bc,003f0h		;b9df
	ret po			;b9e2
	rlca			;b9e3
	ret po			;b9e4
	rlca			;b9e5
	ret nz			;b9e6
	rrca			;b9e7
	ret nz			;b9e8
	ld c,080h		;b9e9
	dec e			;b9eb
	add a,b			;b9ec
	ld a,(de)		;b9ed
	add a,b			;b9ee
	rla			;b9ef
	nop			;b9f0
	ccf			;b9f1
	nop			;b9f2
	ccf			;b9f3
	nop			;b9f4
	ccf			;b9f5
	nop			;b9f6
	ccf			;b9f7
	nop			;b9f8
	inc a			;b9f9
	nop			;b9fa
	jr c,$+5		;b9fb
	jr nc,$+5		;b9fd
	jr nc,$+9		;b9ff
	jr nz,lba0ah		;ba01
	jr nz,lba0ch		;ba03
	jr nz,lb98ah		;ba05
	djnz lb9d0h		;ba07
	nop			;ba09
lba0ah:
	rst 28h			;ba0a
	nop			;ba0b
lba0ch:
	rst 38h			;ba0c
	nop			;ba0d
	rst 38h			;ba0e
	nop			;ba0f
	rst 38h			;ba10
	nop			;ba11
	ret p			;ba12
	nop			;ba13
	ret nz			;ba14
	nop			;ba15
	nop			;ba16
	rrca			;ba17
	nop			;ba18
	ld a,000h		;ba19
	defb 0fdh,000h,0ffh ;illegal sequence	;ba1b
	nop			;ba1e
	rst 38h			;ba1f
	nop			;ba20
	di			;ba21
	nop			;ba22
	add a,b			;ba23
	inc c			;ba24
	nop			;ba25
	ld a,(hl)		;ba26
	nop			;ba27
	rst 38h			;ba28
	nop			;ba29
	push de			;ba2a
	nop			;ba2b
	add a,b			;ba2c
	nop			;ba2d
	nop			;ba2e
	ld hl,(05500h)		;ba2f
	nop			;ba32
	xor d			;ba33
	nop			;ba34
	dec b			;ba35
	nop			;ba36
	ld (bc),a		;ba37
	nop			;ba38
	ld bc,03f00h		;ba39
	nop			;ba3c
	ld a,a			;ba3d
	nop			;ba3e
	defb 0fdh,000h,07dh ;illegal sequence	;ba3f
	nop			;ba42
	cp e			;ba43
	nop			;ba44
	pop bc			;ba45
	nop			;ba46
	ld d,000h		;ba47
	rst 10h			;ba49
	nop			;ba4a
	rst 18h			;ba4b
	nop			;ba4c
	sbc a,000h		;ba4d
	cp 000h			;ba4f
	cp 000h			;ba51
	rst 28h			;ba53
	nop			;ba54
	rst 0			;ba55
	djnz lba5bh		;ba56
	jr nc,$+5		;ba58
	ret m			;ba5a
lba5bh:
	ld bc,001f8h		;ba5b
	ret m			;ba5e
	ld bc,001f8h		;ba5f
	ret m			;ba62
	ld bc,000fch		;ba63
	call m,sub_fe00h	;ba66
	nop			;ba69
	rst 38h			;ba6a
	nop			;ba6b
	rst 38h			;ba6c
	nop			;ba6d
	rst 38h			;ba6e
	nop			;ba6f
	nop			;ba70
	nop			;ba71
	nop			;ba72
	nop			;ba73
	nop			;ba74
	rst 38h			;ba75
	nop			;ba76
	ei			;ba77
	nop			;ba78
	ld b,000h		;ba79
	jp c,lbd00h		;ba7b
	nop			;ba7e
	or 000h			;ba7f
	ret m			;ba81
	nop			;ba82
	rst 38h			;ba83
	nop			;ba84
	ld a,a			;ba85
	nop			;ba86
	ld a,e			;ba87
	nop			;ba88
	inc a			;ba89
	nop			;ba8a
	ccf			;ba8b
	nop			;ba8c
	rra			;ba8d
	nop			;ba8e
	sbc a,e			;ba8f
	nop			;ba90
	ld e,h			;ba91
	nop			;ba92
	cp a			;ba93
	nop			;ba94
	ld e,a			;ba95
	nop			;ba96
	cp e			;ba97
	nop			;ba98
	ld a,h			;ba99
	nop			;ba9a
	rst 0			;ba9b
	nop			;ba9c
	xor b			;ba9d
	nop			;ba9e
	jp m,led00h		;ba9f
	nop			;baa2
	rst 28h			;baa3
	nop			;baa4
	rst 18h			;baa5
	nop			;baa6
	ld e,(hl)		;baa7
	nop			;baa8
	cp l			;baa9
	nop			;baaa
	ld c,e			;baab
	nop			;baac
	or 000h			;baad
	ret pe			;baaf
	nop			;bab0
	jp (hl)			;bab1
	nop			;bab2
	defb 0edh ;next byte illegal after ed	;bab3
	nop			;bab4
	defb 0edh ;next byte illegal after ed	;bab5
	nop			;bab6
	defb 0edh ;next byte illegal after ed	;bab7
	nop			;bab8
	defb 0edh ;next byte illegal after ed	;bab9
	nop			;baba
	defb 0ddh,000h,0ddh ;illegal sequence	;babb
	nop			;babe
	call c,sub_fe00h	;babf
	nop			;bac2
	rst 38h			;bac3
	nop			;bac4
	rst 38h			;bac5
	nop			;bac6
	cp a			;bac7
	nop			;bac8
	ld d,(hl)		;bac9
	nop			;baca
	dec hl			;bacb
	add a,b			;bacc
	dec e			;bacd
	jp nz,07f00h		;bace
	nop			;bad1
	rra			;bad2
	nop			;bad3
	rrca			;bad4
	add a,b			;bad5
	rlca			;bad6
	ret po			;bad7
	inc bc			;bad8
	ret p			;bad9
	ld bc,001e8h		;bada
	ret m			;badd
	nop			;bade
	call nc,sub_bc00h	;badf
	nop			;bae2
	ld a,d			;bae3
	nop			;bae4
	ld a,(hl)		;bae5
	nop			;bae6
	ld (hl),l		;bae7
	nop			;bae8
	adc a,(hl)		;bae9
	nop			;baea
	cp a			;baeb
	nop			;baec
	cp (hl)			;baed
	nop			;baee
	or a			;baef
	nop			;baf0
	ld c,(hl)		;baf1
	nop			;baf2
	cp a			;baf3
	nop			;baf4
	cp d			;baf5
	nop			;baf6
	and a			;baf7
	nop			;baf8
	ld e,a			;baf9
	nop			;bafa
	cp (hl)			;bafb
	nop			;bafc
	sbc a,000h		;bafd
	ld e,l			;baff
	nop			;bb00
	ld a,(de)		;bb01
	nop			;bb02
	and l			;bb03
	nop			;bb04
	call ld200h		;bb05
	nop			;bb08
	xor a			;bb09
	nop			;bb0a
	ld e,a			;bb0b
	nop			;bb0c
	or a			;bb0d
	nop			;bb0e
	jp m,lfa00h		;bb0f
	nop			;bb12
	defb 0ddh,000h,0eah ;illegal sequence	;bb13
	nop			;bb16
	ex de,hl		;bb17
	nop			;bb18
	rst 30h			;bb19
	nop			;bb1a
	rst 30h			;bb1b
	nop			;bb1c
	ex (sp),hl		;bb1d
	nop			;bb1e
	call pe,sub_feffh+1	;bb1f
	nop			;bb22
	ld a,a			;bb23
	nop			;bb24
	cp a			;bb25
	nop			;bb26
	xor a			;bb27
	nop			;bb28
	rst 18h			;bb29
	nop			;bb2a
	xor a			;bb2b
	nop			;bb2c
	ld d,l			;bb2d
	xor d			;bb2e
	nop			;bb2f
	rst 38h			;bb30
	nop			;bb31
	rst 38h			;bb32
	nop			;bb33
	call m,sub_f800h	;bb34
	ld bc,002c0h		;bb37
	add a,b			;bb3a
	dec b			;bb3b
	nop			;bb3c
	ld a,(05500h)		;bb3d
	nop			;bb40
	ld l,d			;bb41
	nop			;bb42
	push de			;bb43
	nop			;bb44
	xor d			;bb45
	nop			;bb46
	push de			;bb47
	nop			;bb48
	xor d			;bb49
	nop			;bb4a
	ld d,l			;bb4b
	nop			;bb4c
	xor d			;bb4d
	nop			;bb4e
	ld d,l			;bb4f
	nop			;bb50
	xor d			;bb51
	nop			;bb52
	ld d,l			;bb53
	nop			;bb54
	xor d			;bb55
	nop			;bb56
	ret nc			;bb57
	nop			;bb58
	adc a,e			;bb59
	nop			;bb5a
	sub a			;bb5b
	nop			;bb5c
	cpl			;bb5d
	nop			;bb5e
	cp a			;bb5f
	nop			;bb60
	rst 30h			;bb61
	nop			;bb62
	jp m,lfd00h		;bb63
	nop			;bb66
	jp p,06f00h		;bb67
	nop			;bb6a
	sbc a,a			;bb6b
	nop			;bb6c
	ld h,c			;bb6d
	nop			;bb6e
	cp 000h			;bb6f
	rst 38h			;bb71
	nop			;bb72
	rst 38h			;bb73
	nop			;bb74
	ccf			;bb75
	nop			;bb76
	rst 8			;bb77
	nop			;bb78
	rst 30h			;bb79
	nop			;bb7a
	rst 38h			;bb7b
	nop			;bb7c
	rst 38h			;bb7d
	nop			;bb7e
	cp 000h			;bb7f
	ld a,(hl)		;bb81
	nop			;bb82
	call m,lfb00h		;bb83
	nop			;bb86
	push hl			;bb87
	nop			;bb88
	rlc b			;bb89
	sbc a,(hl)		;bb8b
	nop			;bb8c
	cp l			;bb8d
	ld b,d			;bb8e
	nop			;bb8f
	add a,b			;bb90
	nop			;bb91
	nop			;bb92
	nop			;bb93
	nop			;bb94
	ld a,a			;bb95
	nop			;bb96
	push de			;bb97
	nop			;bb98
	xor d			;bb99
	nop			;bb9a
sub_bb9bh:
	ld d,l			;bb9b
	nop			;bb9c
	xor e			;bb9d
	nop			;bb9e
	ld d,(hl)		;bb9f
	nop			;bba0
	xor h			;bba1
	ld bc,00158h		;bba2
	cp b			;bba5
	inc bc			;bba6
	ld d,b			;bba7
	inc bc			;bba8
	or b			;bba9
	ld b,060h		;bbaa
	nop			;bbac
	ret nz			;bbad
	nop			;bbae
	ld b,c			;bbaf
	nop			;bbb0
	add a,a			;bbb1
	nop			;bbb2
	cp c			;bbb3
	nop			;bbb4
	ld e,(hl)		;bbb5
	nop			;bbb6
	cp a			;bbb7
	nop			;bbb8
	call p,lfb00h		;bbb9
	nop			;bbbc
	inc h			;bbbd
	nop			;bbbe
	rst 18h			;bbbf
	nop			;bbc0
	daa			;bbc1
	nop			;bbc2
	ei			;bbc3
	nop			;bbc4
	rst 38h			;bbc5
	nop			;bbc6
	ccf			;bbc7
	nop			;bbc8
	sbc a,000h		;bbc9
	defb 0fdh,000h,0fdh ;illegal sequence	;bbcb
	nop			;bbce
	defb 0fdh,000h,0fbh ;illegal sequence	;bbcf
	nop			;bbd2
	call p,lfb00h		;bbd3
	nop			;bbd6
	or 000h			;bbd7
	call sub_bf00h		;bbd9
	nop			;bbdc
	ld e,a			;bbdd
	nop			;bbde
	cp a			;bbdf
	nop			;bbe0
	ld a,a			;bbe1
	nop			;bbe2
	rst 38h			;bbe3
	nop			;bbe4
	defb 0fdh,000h,0fah ;illegal sequence	;bbe5
	nop			;bbe8
	push af			;bbe9
	nop			;bbea
	xor d			;bbeb
	nop			;bbec
	ld b,b			;bbed
	sub l			;bbee
	nop			;bbef
	ld a,a			;bbf0
	nop			;bbf1
	ccf			;bbf2
	nop			;bbf3
	rrca			;bbf4
	add a,b			;bbf5
	rlca			;bbf6
	ld b,b			;bbf7
	inc bc			;bbf8
	or b			;bbf9
	ld bc,00058h		;bbfa
	call po,00001h		;bbfd
sub_bc00h:
	dec de			;bc00
	nop			;bc01
	rst 38h			;bc02
	nop			;bc03
	rst 38h			;bc04
	nop			;bc05
	rst 38h			;bc06
	nop			;bc07
	rst 38h			;bc08
	nop			;bc09
	rlca			;bc0a
	nop			;bc0b
	nop			;bc0c
	nop			;bc0d
	nop			;bc0e
	ret m			;bc0f
	nop			;bc10
	rst 38h			;bc11
	nop			;bc12
	rst 38h			;bc13
	nop			;bc14
	jp 03d00h		;bc15
	nop			;bc18
	adc a,000h		;bc19
	rst 30h			;bc1b
	nop			;bc1c
	rst 38h			;bc1d
	nop			;bc1e
	ld a,a			;bc1f
	nop			;bc20
	rst 38h			;bc21
	nop			;bc22
	ret m			;bc23
	nop			;bc24
	ret nz			;bc25
	rlca			;bc26
	nop			;bc27
	rlca			;bc28
	nop			;bc29
	nop			;bc2a
	ret po			;bc2b
	nop			;bc2c
	ret m			;bc2d
	nop			;bc2e
	rst 38h			;bc2f
	nop			;bc30
	rst 18h			;bc31
	nop			;bc32
	scf			;bc33
	nop			;bc34
	ld b,c			;bc35
	nop			;bc36
	xor 000h		;bc37
	defb 0edh ;next byte illegal after ed	;bc39
	nop			;bc3a
	rst 30h			;bc3b
	nop			;bc3c
	rst 38h			;bc3d
	nop			;bc3e
	cp 000h			;bc3f
	ret nz			;bc41
	nop			;bc42
	xor b			;bc43
	nop			;bc44
	ld d,l			;bc45
	nop			;bc46
	xor d			;bc47
	nop			;bc48
	ld b,b			;bc49
	ld bc,sub_bf00h		;bc4a
	nop			;bc4d
	rst 38h			;bc4e
	nop			;bc4f
	rst 38h			;bc50
	nop			;bc51
	rst 38h			;bc52
	nop			;bc53
	rst 38h			;bc54
	nop			;bc55
	rst 38h			;bc56
	nop			;bc57
	rst 38h			;bc58
	nop			;bc59
	rst 38h			;bc5a
	nop			;bc5b
	rst 38h			;bc5c
	nop			;bc5d
	rst 38h			;bc5e
	nop			;bc5f
	rst 38h			;bc60
	nop			;bc61
	rst 38h			;bc62
	nop			;bc63
	rst 38h			;bc64
	nop			;bc65
	rst 38h			;bc66
	nop			;bc67
	rst 38h			;bc68
	nop			;bc69
	rst 38h			;bc6a
	nop			;bc6b
	ld a,a			;bc6c
	nop			;bc6d
	rra			;bc6e
	nop			;bc6f
	rrca			;bc70
	add a,b			;bc71
	rlca			;bc72
	ret po			;bc73
	inc bc			;bc74
	ret p			;bc75
	ld bc,000f8h		;bc76
	call m,sub_fc00h	;bc79
	nop			;bc7c
	call m,sub_fc00h	;bc7d
	nop			;bc80
	adc a,h			;bc81
	nop			;bc82
	inc b			;bc83
	ld h,b			;bc84
	inc b			;bc85
	pop bc			;bc86
	ex af,af'		;bc87
	ex (sp),hl		;bc88
	nop			;bc89
	rst 30h			;bc8a
	nop			;bc8b
	ld a,a			;bc8c
	nop			;bc8d
lbc8eh:
	rra			;bc8e
	nop			;bc8f
	rrca			;bc90
	add a,b			;bc91
	rlca			;bc92
	ret po			;bc93
	inc bc			;bc94
	ret p			;bc95
	inc bc			;bc96
	jr c,$+3		;bc97
	call m,sub_fc00h	;bc99
	nop			;bc9c
	call pe,00400h		;bc9d
	nop			;bca0
	inc b			;bca1
	ld bc,00308h		;bca2
	ld b,b			;bca5
	rlca			;bca6
	and b			;bca7
	inc bc			;bca8
	djnz lbcf2h		;bca9
	nop			;bcab
	rst 28h			;bcac
	nop			;bcad
	rst 38h			;bcae
	nop			;bcaf
	nop			;bcb0
	cp 000h			;bcb1
	rst 38h			;bcb3
	nop			;bcb4
	rst 38h			;bcb5
	nop			;bcb6
	cp a			;bcb7
	nop			;bcb8
	ld d,(hl)		;bcb9
	nop			;bcba
	dec hl			;bcbb
	nop			;bcbc
	ld e,l			;bcbd
	add a,b			;bcbe
	ld a,(02d80h)		;bcbf
	nop			;bcc2
	ld d,e			;bcc3
	nop			;bcc4
	ld c,a			;bcc5
	nop			;bcc6
	ei			;bcc7
	nop			;bcc8
	ex (sp),hl		;bcc9
	jr lbc8eh		;bcca
	jr nc,lbcd5h		;bccc
	ret p			;bcce
	inc b			;bccf
	nop			;bcd0
	rst 38h			;bcd1
	nop			;bcd2
	ld a,a			;bcd3
	nop			;bcd4
lbcd5h:
	cp a			;bcd5
	nop			;bcd6
	xor a			;bcd7
	nop			;bcd8
	rst 18h			;bcd9
	nop			;bcda
	xor a			;bcdb
	nop			;bcdc
	ld d,l			;bcdd
	nop			;bcde
	xor d			;bcdf
	nop			;bce0
	ld d,l			;bce1
	nop			;bce2
	jp pe,07f00h		;bce3
	nop			;bce6
	sbc a,(hl)		;bce7
	nop			;bce8
	ld (hl),a		;bce9
	ex af,af'		;bcea
	add a,e			;bceb
	ld a,h			;bcec
	ld bc,002f8h		;bced
	nop			;bcf0
	ld a,(hl)		;bcf1
lbcf2h:
	nop			;bcf2
	call m,lfb00h		;bcf3
	nop			;bcf6
	push hl			;bcf7
	nop			;bcf8
	rlc b			;bcf9
	sbc a,(hl)		;bcfb
	nop			;bcfc
	cp l			;bcfd
	nop			;bcfe
	xor d			;bcff
lbd00h:
	nop			;bd00
	ld d,l			;bd01
	nop			;bd02
	cp a			;bd03
	nop			;bd04
	rst 30h			;bd05
	nop			;bd06
lbd07h:
	ld e,a			;bd07
	nop			;bd08
	ld (hl),a		;bd09
	nop			;bd0a
	call z,sub_b401h	;bd0b
	ld bc,0008ch		;bd0e
	ld a,a			;bd11
	nop			;bd12
	rst 38h			;bd13
	nop			;bd14
	defb 0fdh,000h,0fah ;illegal sequence	;bd15
	nop			;bd18
	push af			;bd19
	nop			;bd1a
	xor d			;bd1b
	nop			;bd1c
	ld d,(hl)		;bd1d
	ld bc,001ach		;bd1e
	ld a,h			;bd21
	nop			;bd22
	and 000h		;bd23
	cp c			;bd25
	nop			;bd26
	ld c,a			;bd27
	nop			;bd28
lbd29h:
	jp nz,0e10ch		;bd29
	ld c,020h		;bd2c
	adc a,a			;bd2e
	jr nz,lbd29h		;bd2f
	inc bc			;bd31
	ret m			;bd32
	ld (bc),a		;bd33
	ret p			;bd34
	dec b			;bd35
	ret p			;bd36
	ld b,0f0h		;bd37
	dec b			;bd39
	ret p			;bd3a
	inc b			;bd3b
sub_bd3ch:
	ret p			;bd3c
	dec b			;bd3d
	ret m			;bd3e
	inc bc			;bd3f
	ret m			;bd40
	ld (bc),a		;bd41
	ret p			;bd42
	dec b			;bd43
	ret p			;bd44
	ld b,0f0h		;bd45
	dec b			;bd47
	ret p			;bd48
	inc b			;bd49
	ret p			;bd4a
	dec b			;bd4b
	ret po			;bd4c
	inc c			;bd4d
	ret po			;bd4e
	ld a,(bc)		;bd4f
	ld bc,00304h		;bd50
	ex af,af'		;bd53
	inc bc			;bd54
	ld a,b			;bd55
	inc bc			;bd56
	jr c,$+5		;bd57
	ex af,af'		;bd59
	inc bc			;bd5a
	jr c,$+5		;bd5b
	ret m			;bd5d
	ld bc,00304h		;bd5e
	ex af,af'		;bd61
	inc bc			;bd62
	ld a,b			;bd63
	inc bc			;bd64
	jr c,$+5		;bd65
	ex af,af'		;bd67
	inc bc			;bd68
	jr c,lbd6eh		;bd69
	ret m			;bd6b
	inc bc			;bd6c
	ld a,b			;bd6d
lbd6eh:
	inc bc			;bd6e
	jr $+1			;bd6f
	ccf			;bd71
	inc bc			;bd72
	ld bc,07f0fh		;bd73
	rrca			;bd76
	ld bc,00000h		;bd77
	nop			;bd7a
	nop			;bd7b
	nop			;bd7c
	nop			;bd7d
	nop			;bd7e
	nop			;bd7f
	rst 38h			;bd80
	rst 38h			;bd81
	ccf			;bd82
	jp lfffch		;bd83
	rst 38h			;bd86
	rst 38h			;bd87
	ld a,a			;bd88
	ld c,05dh		;bd89
	ld a,007h		;bd8b
	ld bc,00106h		;bd8d
	rst 38h			;bd90
	rst 38h			;bd91
	rst 38h			;bd92
	rst 38h			;bd93
	dec de			;bd94
	rst 38h			;bd95
	rst 38h			;bd96
	cp (hl)			;bd97
	rst 38h			;bd98
	rst 38h			;bd99
	rst 38h			;bd9a
	ccf			;bd9b
	jp lffffh		;bd9c
	rst 38h			;bd9f
	rst 38h			;bda0
	rst 38h			;bda1
	rst 30h			;bda2
	rst 38h			;bda3
	rst 38h			;bda4
	ld a,(hl)		;bda5
	adc a,a			;bda6
	pop af			;bda7
	rst 38h			;bda8
	rst 38h			;bda9
	rst 38h			;bdaa
	rst 18h			;bdab
	rst 38h			;bdac
	rst 30h			;bdad
	rst 38h			;bdae
	rst 38h			;bdaf
	rst 38h			;bdb0
	rst 38h			;bdb1
	rst 38h			;bdb2
	rst 38h			;bdb3
	rst 30h			;bdb4
	dec c			;bdb5
	rst 38h			;bdb6
	rst 38h			;bdb7
	rst 38h			;bdb8
	rst 38h			;bdb9
	rst 38h			;bdba
	add a,d			;bdbb
	rst 38h			;bdbc
	rst 38h			;bdbd
	rst 38h			;bdbe
	rst 38h			;bdbf
	rst 38h			;bdc0
	rst 38h			;bdc1
	rst 28h			;bdc2
	rst 38h			;bdc3
	rst 38h			;bdc4
	ld e,a			;bdc5
	xor d			;bdc6
	ret p			;bdc7
	adc a,a			;bdc8
	rst 38h			;bdc9
	push af			;bdca
	nop			;bdcb
	rst 38h			;bdcc
	rst 38h			;bdcd
	cp 0ffh			;bdce
	rst 38h			;bdd0
	rst 38h			;bdd1
	rst 38h			;bdd2
	rst 38h			;bdd3
	rst 38h			;bdd4
	rst 38h			;bdd5
	xor a			;bdd6
	rra			;bdd7
	rst 38h			;bdd8
	rst 38h			;bdd9
	ld a,a			;bdda
	defb 0fdh,0ffh,0ffh ;illegal sequence	;bddb
	rst 38h			;bdde
	rst 38h			;bddf
	rst 38h			;bde0
	rst 38h			;bde1
	call m,sub_feffh	;bde2
	ex de,hl		;bde5
	ld e,h			;bde6
	ret po			;bde7
	rst 38h			;bde8
	sbc a,a			;bde9
	rlca			;bdea
	nop			;bdeb
	ex (sp),hl		;bdec
	ld b,001h		;bded
	nop			;bdef
	rst 38h			;bdf0
	rst 38h			;bdf1
	rst 38h			;bdf2
	ccf			;bdf3
	rst 10h			;bdf4
	xor d			;bdf5
	defb 0fdh,007h,0ffh ;illegal sequence	;bdf6
	rst 38h			;bdf9
	rst 38h			;bdfa
	rst 38h			;bdfb
	xor (iy+079h)		;bdfc
	add a,b			;bdff
	rst 38h			;be00
	rst 38h			;be01
	rst 10h			;be02
	rst 28h			;be03
	defb 0fdh,07fh,0f7h ;illegal sequence	;be04
	rst 38h			;be07
	ret nz			;be08
	rra			;be09
	ret nz			;be0a
	rra			;be0b
	ret nz			;be0c
	rla			;be0d
	ret po			;be0e
	dec bc			;be0f
	ret po			;be10
	dec bc			;be11
	ret p			;be12
	rlca			;be13
	ret p			;be14
	rlca			;be15
	ret p			;be16
	rlca			;be17
	ret p			;be18
	rlca			;be19
	ret po			;be1a
	dec bc			;be1b
	ret po			;be1c
	dec bc			;be1d
	ret po			;be1e
	dec bc			;be1f
lbe20h:
	ret po			;be20
	rrca			;be21
	ret po			;be22
	dec bc			;be23
	ret po			;be24
	rrca			;be25
	ret po			;be26
	dec bc			;be27
	ret p			;be28
	dec b			;be29
	ret p			;be2a
	dec b			;be2b
	ret p			;be2c
	rlca			;be2d
	ret p			;be2e
	dec b			;be2f
	ret po			;be30
	dec bc			;be31
	ret po			;be32
	rrca			;be33
	ret po			;be34
	dec bc			;be35
	ret po			;be36
	rrca			;be37
	rlca			;be38
	ret p			;be39
	rlca			;be3a
	ret nc			;be3b
	rlca			;be3c
	ret p			;be3d
	rlca			;be3e
	ret nc			;be3f
	rlca			;be40
	ret p			;be41
	rlca			;be42
	ret nc			;be43
	inc bc			;be44
	ret pe			;be45
	inc bc			;be46
	ret c			;be47
	inc bc			;be48
	ret pe			;be49
	inc bc			;be4a
	ret p			;be4b
	ld bc,001ech		;be4c
	call p,sub_ec01h	;be4f
	ld bc,003f4h		;be52
	ret pe			;be55
	inc bc			;be56
	ret c			;be57
	inc bc			;be58
	ret pe			;be59
	ld bc,001d4h		;be5a
	call pe,sub_f401h	;be5d
	ld bc,001ech		;be60
	call p,sub_e803h	;be63
	inc bc			;be66
	ret c			;be67
	ret pe			;be68
	call m,sub_dbe4h	;be69
	call c,sub_cfdfh	;be6c
	ret p			;be6f
	nop			;be70
	nop			;be71
	ld e,0ech		;be72
	or b			;be74
	ret po			;be75
	nop			;be76
	nop			;be77
	call m,sub_b801h	;be78
	ld (bc),a		;be7b
	jr $+68			;be7c
	ex af,af'		;be7e
	ld h,d			;be7f
	nop			;be80
	ld d,l			;be81
	nop			;be82
	ld l,e			;be83
	add a,b			;be84
	inc hl			;be85
	add a,b			;be86
	dec sp			;be87
	ret nz			;be88
	dec e			;be89
	ret nz			;be8a
	dec d			;be8b
	ret nz			;be8c
	rra			;be8d
	ret po			;be8e
	dec b			;be8f
	ret po			;be90
	dec bc			;be91
	ret po			;be92
	rrca			;be93
	ret po			;be94
	dec bc			;be95
	ret po			;be96
	rrca			;be97
	ld a,a			;be98
	nop			;be99
	dec a			;be9a
	add a,b			;be9b
lbe9ch:
	jr c,lbe20h		;be9c
	djnz $-57		;be9e
	nop			;bea0
	ld l,d			;bea1
	nop			;bea2
	dec (hl)		;bea3
	nop			;bea4
	jp c,led00h		;bea5
	nop			;bea8
	or 000h			;bea9
	ei			;beab
	nop			;beac
	push de			;bead
	nop			;beae
	ex de,hl		;beaf
	nop			;beb0
	defb 0fdh,000h,07fh ;illegal sequence	;beb1
	nop			;beb4
	rst 30h			;beb5
	nop			;beb6
	rst 38h			;beb7
	jp 08318h		;beb8
	jr nc,lbebeh		;bebb
	ld l,h			;bebd
lbebeh:
	ld bc,00174h		;bebe
	call pe,sub_7401h	;bec1
	inc bc			;bec4
	ret pe			;bec5
	inc bc			;bec6
	ret c			;bec7
	inc bc			;bec8
	ret pe			;bec9
	ld bc,001d4h		;beca
	call pe,sub_f401h	;becd
	ld bc,001ech		;bed0
	call p,sub_e803h	;bed3
	inc bc			;bed6
	ret c			;bed7
lbed8h:
	ret p			;bed8
	ret nc			;bed9
	ret p			;beda
	ret nc			;bedb
	ret pe			;bedc
	ret c			;bedd
	ld l,b			;bede
	ld a,b			;bedf
	ld l,b			;bee0
	ld a,b			;bee1
	ld l,b			;bee2
	ret m			;bee3
	ret m			;bee4
	ret pe			;bee5
	ret nc			;bee6
	ret p			;bee7
	ld d,b			;bee8
	ld (hl),b		;bee9
	ld e,b			;beea
	ld l,b			;beeb
	jr c,lbf56h		;beec
	ld d,b			;beee
	ld (hl),b		;beef
	ld d,b			;bef0
	ret pe			;bef1
	ret m			;bef2
	ret pe			;bef3
	ld a,b			;bef4
	ld l,b			;bef5
	ld a,b			;bef6
	ld l,b			;bef7
	rst 38h			;bef8
	rst 38h			;bef9
	rst 38h			;befa
	rst 38h			;befb
	rst 38h			;befc
	rst 38h			;befd
	rst 38h			;befe
	rst 38h			;beff
sub_bf00h:
	rst 38h			;bf00
	adc a,a			;bf01
	inc bc			;bf02
	ld bc,03f19h		;bf03
	ld a,a			;bf06
	nop			;bf07
	ld h,(hl)		;bf08
	ld h,(hl)		;bf09
	ld a,a			;bf0a
	ld h,a			;bf0b
	ld e,e			;bf0c
	ld e,e			;bf0d
	ld d,e			;bf0e
	ld b,e			;bf0f
	ld a,a			;bf10
	ld a,a			;bf11
	ld a,a			;bf12
	ld a,a			;bf13
	ld a,a			;bf14
	ld a,a			;bf15
	ld a,a			;bf16
	nop			;bf17
	call m,sub_fdfdh	;bf18
	ld sp,hl		;bf1b
	ei			;bf1c
	ei			;bf1d
	ei			;bf1e
	di			;bf1f
	rst 30h			;bf20
	rst 30h			;bf21
	rst 30h			;bf22
	rst 30h			;bf23
	rst 30h			;bf24
	rst 30h			;bf25
	rst 30h			;bf26
	rlca			;bf27
	ld h,a			;bf28
	ld h,a			;bf29
	rst 0			;bf2a
	xor e			;bf2b
	outd			;bf2c
	sbc a,0bfh		;bf2e
	rst 18h			;bf30
	cp a			;bf31
	sbc a,0b9h		;bf32
	rst 30h			;bf34
	adc a,a			;bf35
	ld a,a			;bf36
	rst 38h			;bf37
	and l			;bf38
	in a,(0dbh)		;bf39
	rst 38h			;bf3b
	rst 38h			;bf3c
	jp pe,lfffdh		;bf3d
	rst 38h			;bf40
	rst 38h			;bf41
	rst 38h			;bf42
	ld sp,hl		;bf43
lbf44h:
	or 0f6h			;bf44
	call p,lfff0h		;bf46
	rst 38h			;bf49
	rst 38h			;bf4a
	rst 18h			;bf4b
	rst 38h			;bf4c
	add a,(hl)		;bf4d
	ld a,c			;bf4e
	rst 38h			;bf4f
	ret p			;bf50
	rst 28h			;bf51
	rra			;bf52
	rst 38h			;bf53
	rst 38h			;bf54
	rst 38h			;bf55
lbf56h:
	rst 38h			;bf56
	rst 38h			;bf57
	ld e,h			;bf58
	xor d			;bf59
	xor (hl)		;bf5a
	cp 0d5h			;bf5b
	xor d			;bf5d
	ld (hl),l		;bf5e
	jp m,sub_fefdh		;bf5f
	rst 38h			;bf62
	cp 0ffh			;bf63
	cp 0ffh			;bf65
	cp 0ffh			;bf67
	cp a			;bf69
	rst 38h			;bf6a
	rst 38h			;bf6b
	rst 38h			;bf6c
	ld de,01feeh		;bf6d
	rst 28h			;bf70
	sub a			;bf71
	ret pe			;bf72
	cp 0ffh			;bf73
	rst 38h			;bf75
	rst 38h			;bf76
	rst 38h			;bf77
	rst 38h			;bf78
	rst 38h			;bf79
	rst 38h			;bf7a
	ld a,a			;bf7b
	ld a,a			;bf7c
	ld a,a			;bf7d
	ld a,a			;bf7e
sub_bf7fh:
	ld a,a			;bf7f
	ld a,0beh		;bf80
	ld a,0bfh		;bf82
	ccf			;bf84
	cp a			;bf85
	ccf			;bf86
	cp a			;bf87
	ccf			;bf88
	sbc a,a			;bf89
	ld e,a			;bf8a
	sbc a,a			;bf8b
	ret c			;bf8c
	inc bc			;bf8d
	xor 0fbh		;bf8e
	sub 0ffh		;bf90
	rst 38h			;bf92
	rra			;bf93
	ret nc			;bf94
	jp pe,lffffh		;bf95
	rst 38h			;bf98
	rst 38h			;bf99
	rst 38h			;bf9a
	rst 38h			;bf9b
	ex (sp),hl		;bf9c
	add a,b			;bf9d
	nop			;bf9e
	nop			;bf9f
	nop			;bfa0
	ld (hl),b		;bfa1
	ret po			;bfa2
	pop hl			;bfa3
	pop bc			;bfa4
	jp 08787h		;bfa5
	adc a,a			;bfa8
	rst 18h			;bfa9
	rst 28h			;bfaa
	rst 38h			;bfab
	ld bc,0956dh		;bfac
	defb 0edh ;next byte illegal after ed	;bfaf
	push de			;bfb0
	defb 0edh ;next byte illegal after ed	;bfb1
	or l			;bfb2
	ld (ix+039h),l		;bfb3
	ld b,h			;bfb6
	cp a			;bfb7
	rst 38h			;bfb8
	rst 38h			;bfb9
	rst 38h			;bfba
	rst 38h			;bfbb
	rra			;bfbc
	ld c,a			;bfbd
	ld h,a			;bfbe
	ld (hl),e		;bfbf
	add hl,sp		;bfc0
	cp h			;bfc1
	sbc a,a			;bfc2
	adc a,0e6h		;bfc3
	push af			;bfc5
	di			;bfc6
	ld bc,03dfdh		;bfc7
	push bc			;bfca
	ei			;bfcb
	di			;bfcc
	xor e			;bfcd
	di			;bfce
	ei			;bfcf
	ld sp,hl		;bfd0
	defb 0fdh,0ddh,0feh ;illegal sequence	;bfd1
	defb 0edh ;next byte illegal after ed	;bfd4
	rst 38h			;bfd5
	cp 0ffh			;bfd6
	push af			;bfd8
	call p,sub_e6f6h	;bfd9
	xor 0eah		;bfdc
	call 03f9fh		;bfde
	ld a,(hl)		;bfe1
	ld a,l			;bfe2
	defb 0fdh,0f6h,0e8h ;illegal sequence	;bfe3
	jp p,0d7d0h		;bfe6
	rst 30h			;bfe9
	sub 0d7h		;bfea
	rst 30h			;bfec
	ex de,hl		;bfed
	ex de,hl		;bfee
	ex de,hl		;bfef
	jp m,lf7fbh		;bff0
	ld a,(bc)		;bff3
	ld d,a			;bff4
	ei			;bff5
	rst 38h			;bff6
	rst 38h			;bff7
	ei			;bff8
	rst 38h			;bff9
	rst 38h			;bffa
	ld b,b			;bffb
sub_bffch:
	ld e,07dh		;bffc
	defb 0fdh,0fdh,03bh ;illegal sequence	;bffe
sub_c001h:
	in a,(0abh)		;c001
	ex (sp),hl		;c003
	out (0d3h),a		;c004
	jp (hl)			;c006
	jp (hl)			;c007
	ld a,c			;c008
	add a,h			;c009
	ld a,(hl)		;c00a
	adc a,h			;c00b
	jp p,lffe5h		;c00c
	rst 38h			;c00f
	ld a,a			;c010
	rst 38h			;c011
	rst 38h			;c012
	rst 38h			;c013
	rst 30h			;c014
	rst 38h			;c015
lc016h:
	rst 38h			;c016
	rst 38h			;c017
lc018h:
	jp nc,03b98h		;c018
	ld h,a			;c01b
	rst 38h			;c01c
	rst 38h			;c01d
lc01eh:
	cp 0f0h			;c01e
	jp pe,ldeedh		;c020
	rst 28h			;c023
	and a			;c024
	or e			;c025
	out (0e9h),a		;c026
	push af			;c028
	jp p,l7dfah		;c029
	cp a			;c02c
	ld e,a			;c02d
	rst 20h			;c02e
	ret m			;c02f
	rst 18h			;c030
	rst 38h			;c031
	rst 38h			;c032
	cp a			;c033
lc034h:
	rst 38h			;c034
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c035
	jr nz,lc016h		;c038
	cp 0ffh			;c03a
	rst 38h			;c03c
	adc a,a			;c03d
	inc hl			;c03e
	ld sp,hl		;c03f
	ld a,h			;c040
	ld sp,l8fa7h		;c041
	ld e,a			;c044
	ld e,e			;c045
	in a,(0dbh)		;c046
	in a,(02dh)		;c048
	di			;c04a
	ld a,l			;c04b
	cp l			;c04c
	cp (hl)			;c04d
	cp e			;c04e
	ld a,(hl)		;c04f
	rst 38h			;c050
	rst 38h			;c051
	rst 18h			;c052
	rst 38h			;c053
	rst 38h			;c054
	rst 38h			;c055
	cp 0ffh			;c056
	ld e,a			;c058
	rst 18h			;c059
	adc a,026h		;c05a
	ret p			;c05c
	rst 30h			;c05d
	ei			;c05e
	rst 30h			;c05f
	ld a,e			;c060
	xor a			;c061
	rst 18h			;c062
	cp 0e1h			;c063
	call 04cddh		;c065
	or c			;c068
	ld e,(hl)		;c069
	or e			;c06a
	cp a			;c06b
lc06ch:
	rst 8			;c06c
	cp a			;c06d
	rst 38h			;c06e
	rst 38h			;c06f
	cp 0ffh			;c070
	rst 38h			;c072
	rst 38h			;c073
	rst 38h			;c074
	ei			;c075
	rst 38h			;c076
	rst 38h			;c077
	xor a			;c078
	cpl			;c079
	ld l,a			;c07a
	rst 8			;c07b
	sbc a,05ch		;c07c
	adc a,c			;c07e
	ex (sp),hl		;c07f
	rst 30h			;c080
	rst 30h			;c081
	di			;c082
	ld a,b			;c083
	sbc a,a			;c084
	adc a,a			;c085
	daa			;c086
	ld (hl),e		;c087
	ei			;c088
	ld a,e			;c089
	inc hl			;c08a
	adc a,c			;c08b
	push af			;c08c
	xor c			;c08d
	call m,sub_7ffeh	;c08e
	rst 38h			;c091
	rst 38h			;c092
	rst 38h			;c093
	rst 30h			;c094
	rst 38h			;c095
	rst 38h			;c096
	rst 38h			;c097
	rst 38h			;c098
	rst 38h			;c099
	adc a,a			;c09a
	cpl			;c09b
	ld c,a			;c09c
	rst 18h			;c09d
	rst 18h			;c09e
	sbc a,a			;c09f
	cp a			;c0a0
	cp a			;c0a1
	ccf			;c0a2
	cp a			;c0a3
	cp a			;c0a4
	cp a			;c0a5
	rst 18h			;c0a6
	ret nz			;c0a7
	rst 18h			;c0a8
	jp z,lf3f5h		;c0a9
lc0ach:
	ld sp,hl		;c0ac
	ei			;c0ad
	ld sp,hl		;c0ae
	inc sp			;c0af
	add a,a			;c0b0
	rst 38h			;c0b1
	rst 38h			;c0b2
	cp a			;c0b3
	rst 38h			;c0b4
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c0b5
	rst 38h			;c0b8
	nop			;c0b9
	rst 38h			;c0ba
	nop			;c0bb
	rst 38h			;c0bc
	nop			;c0bd
	ret m			;c0be
	nop			;c0bf
	ret po			;c0c0
	rlca			;c0c1
	ret nz			;c0c2
	rra			;c0c3
	add a,b			;c0c4
	ccf			;c0c5
	add a,b			;c0c6
	ccf			;c0c7
	nop			;c0c8
	ld a,a			;c0c9
	nop			;c0ca
	rst 38h			;c0cb
	nop			;c0cc
	rst 38h			;c0cd
	nop			;c0ce
	rst 38h			;c0cf
	nop			;c0d0
	rst 38h			;c0d1
	nop			;c0d2
	rst 38h			;c0d3
	nop			;c0d4
	ld a,a			;c0d5
	nop			;c0d6
	ld a,a			;c0d7
	nop			;c0d8
	ld a,a			;c0d9
	nop			;c0da
	ld a,a			;c0db
	nop			;c0dc
	ld a,a			;c0dd
	nop			;c0de
	ld a,a			;c0df
	nop			;c0e0
	ld a,a			;c0e1
	nop			;c0e2
	ld a,a			;c0e3
	nop			;c0e4
	rst 38h			;c0e5
	nop			;c0e6
	rst 38h			;c0e7
	nop			;c0e8
	rst 38h			;c0e9
	nop			;c0ea
	rst 38h			;c0eb
	nop			;c0ec
	ld a,a			;c0ed
	nop			;c0ee
	defb 0fdh,000h,0beh ;illegal sequence	;c0ef
	nop			;c0f2
	ld a,(hl)		;c0f3
	nop			;c0f4
	rst 38h			;c0f5
	nop			;c0f6
	rst 38h			;c0f7
	nop			;c0f8
	rst 38h			;c0f9
	nop			;c0fa
	rst 38h			;c0fb
	nop			;c0fc
	ld a,a			;c0fd
	nop			;c0fe
lc0ffh:
	defb 0fdh,000h,0ffh ;illegal sequence	;c0ff
	nop			;c102
	rst 38h			;c103
lc104h:
	nop			;c104
	ld a,l			;c105
	nop			;c106
	rst 38h			;c107
	nop			;c108
	ld a,a			;c109
	nop			;c10a
	cp 000h			;c10b
	rst 38h			;c10d
	nop			;c10e
	defb 0fdh,000h,07dh ;illegal sequence	;c10f
	nop			;c112
	ld a,l			;c113
	nop			;c114
	rst 38h			;c115
	nop			;c116
	cp 0e7h			;c117
	nop			;c119
	ret nz			;c11a
	jr lc11dh		;c11b
lc11dh:
	ccf			;c11d
	nop			;c11e
	rst 38h			;c11f
	nop			;c120
	rst 38h			;c121
	nop			;c122
	rst 38h			;c123
	nop			;c124
	cp 000h			;c125
	defb 0fdh,000h,0ffh ;illegal sequence	;c127
	nop			;c12a
	defb 0fdh,000h,0fdh ;illegal sequence	;c12b
	nop			;c12e
	rst 38h			;c12f
	nop			;c130
	rst 30h			;c131
	nop			;c132
	rst 30h			;c133
	nop			;c134
	rst 38h			;c135
	nop			;c136
	or 000h			;c137
	cp 000h			;c139
	rst 38h			;c13b
	nop			;c13c
	rst 10h			;c13d
	nop			;c13e
	rst 28h			;c13f
	nop			;c140
	rst 18h			;c141
	nop			;c142
	cp a			;c143
	nop			;c144
	cp a			;c145
	nop			;c146
	ld a,a			;c147
	nop			;c148
	ld a,a			;c149
	nop			;c14a
	ld a,a			;c14b
	nop			;c14c
	rst 38h			;c14d
	nop			;c14e
	rst 38h			;c14f
	nop			;c150
	rst 38h			;c151
	nop			;c152
	rst 38h			;c153
	nop			;c154
	rst 28h			;c155
	nop			;c156
	ei			;c157
	nop			;c158
	rst 38h			;c159
	nop			;c15a
	rst 38h			;c15b
	nop			;c15c
	rst 38h			;c15d
	nop			;c15e
	rst 38h			;c15f
	nop			;c160
	rst 38h			;c161
	nop			;c162
	rst 38h			;c163
	nop			;c164
	rst 38h			;c165
	nop			;c166
	rst 38h			;c167
	nop			;c168
	rst 38h			;c169
	nop			;c16a
	rst 38h			;c16b
	nop			;c16c
	rst 38h			;c16d
	nop			;c16e
	cp 000h			;c16f
	cp 000h			;c171
	cp 000h			;c173
	rst 38h			;c175
	nop			;c176
	rst 38h			;c177
	add a,c			;c178
	jr nc,lc17bh		;c179
lc17bh:
	ld a,(hl)		;c17b
	nop			;c17c
	rst 38h			;c17d
	nop			;c17e
	ld a,a			;c17f
	nop			;c180
	ld a,(hl)		;c181
	nop			;c182
	cp 000h			;c183
	rst 38h			;c185
	nop			;c186
	rst 38h			;c187
	nop			;c188
	rst 38h			;c189
	nop			;c18a
	rst 38h			;c18b
	nop			;c18c
	cp 000h			;c18d
	cp 001h			;c18f
	call m,lfc01h		;c191
	ld bc,000fch		;c194
	cp 000h			;c197
	rst 38h			;c199
	nop			;c19a
	rst 38h			;c19b
	nop			;c19c
	rst 38h			;c19d
	nop			;c19e
	cp 000h			;c19f
	cp 000h			;c1a1
	cp 000h			;c1a3
	rst 38h			;c1a5
	nop			;c1a6
	rst 38h			;c1a7
	nop			;c1a8
	rst 38h			;c1a9
	nop			;c1aa
	cp 000h			;c1ab
	cp 001h			;c1ad
	call m,lfa00h		;c1af
	nop			;c1b2
	jp m,sub_feffh+1	;c1b3
	nop			;c1b6
	rst 28h			;c1b7
	nop			;c1b8
	rst 38h			;c1b9
	nop			;c1ba
	rst 38h			;c1bb
	nop			;c1bc
	rst 18h			;c1bd
	nop			;c1be
	cp 000h			;c1bf
	cp 000h			;c1c1
	ld a,(hl)		;c1c3
	ld bc,001fch		;c1c4
	cp h			;c1c7
	nop			;c1c8
	cp 000h			;c1c9
	ld a,(hl)		;c1cb
	nop			;c1cc
	cp 000h			;c1cd
	cp 001h			;c1cf
	call m,sub_fe00h	;c1d1
	nop			;c1d4
	cp 000h			;c1d5
	rst 38h			;c1d7
	rst 38h			;c1d8
	nop			;c1d9
	rst 38h			;c1da
	nop			;c1db
	rst 38h			;c1dc
	nop			;c1dd
	rst 38h			;c1de
	nop			;c1df
	rst 38h			;c1e0
	nop			;c1e1
	rst 38h			;c1e2
	nop			;c1e3
	rst 38h			;c1e4
	nop			;c1e5
	rst 38h			;c1e6
	nop			;c1e7
	rst 38h			;c1e8
	nop			;c1e9
	rst 38h			;c1ea
	nop			;c1eb
	rst 38h			;c1ec
	nop			;c1ed
	rst 38h			;c1ee
	nop			;c1ef
	rst 38h			;c1f0
	nop			;c1f1
	rst 38h			;c1f2
	nop			;c1f3
	rst 38h			;c1f4
	nop			;c1f5
	rst 38h			;c1f6
	nop			;c1f7
	rst 38h			;c1f8
	nop			;c1f9
	rst 38h			;c1fa
	nop			;c1fb
	rst 38h			;c1fc
	nop			;c1fd
	rst 38h			;c1fe
	nop			;c1ff
lc200h:
	rst 38h			;c200
	nop			;c201
	rst 38h			;c202
	nop			;c203
	rst 38h			;c204
	nop			;c205
	rst 38h			;c206
	nop			;c207
	rst 38h			;c208
	nop			;c209
	rst 38h			;c20a
	nop			;c20b
	rst 38h			;c20c
	nop			;c20d
	rst 38h			;c20e
	nop			;c20f
	rst 38h			;c210
	nop			;c211
	rst 38h			;c212
	nop			;c213
	rst 38h			;c214
	nop			;c215
	cp 000h			;c216
	call m,sub_f801h	;c218
	inc bc			;c21b
	ret m			;c21c
	inc bc			;c21d
	ret p			;c21e
	rlca			;c21f
	ret po			;c220
	dec c			;c221
	ret po			;c222
	dec c			;c223
	ret po			;c224
	rrca			;c225
	ret po			;c226
	rrca			;c227
	ret p			;c228
	rlca			;c229
	ret p			;c22a
	rlca			;c22b
	ret p			;c22c
	rlca			;c22d
	ret m			;c22e
	inc bc			;c22f
	call m,lfc01h		;c230
	ld bc,001fch		;c233
	cp 000h			;c236
	call m,lfc01h		;c238
	ld bc,003f8h		;c23b
	ret m			;c23e
	inc bc			;c23f
	ret p			;c240
	rlca			;c241
	ret p			;c242
	rlca			;c243
	ret p			;c244
	rlca			;c245
	ret p			;c246
	rlca			;c247
	ret m			;c248
	inc bc			;c249
	ret m			;c24a
	inc bc			;c24b
	ret p			;c24c
	rlca			;c24d
	ret p			;c24e
	rlca			;c24f
	ret p			;c250
	rlca			;c251
	ret p			;c252
	rlca			;c253
	ret p			;c254
	rlca			;c255
	ret po			;c256
	rrca			;c257
	ret p			;c258
	rlca			;c259
	ret p			;c25a
	dec b			;c25b
	ret po			;c25c
	rrca			;c25d
	ret po			;c25e
	rrca			;c25f
	ret po			;c260
	rrca			;c261
	ret po			;c262
	rrca			;c263
	ret po			;c264
	rrca			;c265
	ret nz			;c266
	rra			;c267
	ret nz			;c268
	dec e			;c269
	ret nz			;c26a
	dec e			;c26b
	add a,b			;c26c
	ccf			;c26d
	add a,b			;c26e
	ccf			;c26f
	nop			;c270
	ld a,a			;c271
	nop			;c272
	ld a,a			;c273
	nop			;c274
	ld a,a			;c275
	nop			;c276
	rst 38h			;c277
	nop			;c278
	rst 38h			;c279
	nop			;c27a
	rst 38h			;c27b
	nop			;c27c
	rst 18h			;c27d
	nop			;c27e
	rst 30h			;c27f
	nop			;c280
	rst 30h			;c281
	nop			;c282
	rst 38h			;c283
	nop			;c284
	defb 0fdh,000h,0fdh ;illegal sequence	;c285
	nop			;c288
	rst 38h			;c289
	nop			;c28a
	rst 38h			;c28b
	nop			;c28c
	ld a,a			;c28d
	nop			;c28e
	rst 38h			;c28f
	nop			;c290
	rst 18h			;c291
	nop			;c292
	cp a			;c293
	nop			;c294
	rst 38h			;c295
	nop			;c296
	rst 38h			;c297
	ret m			;c298
	rlca			;c299
	rst 38h			;c29a
	rst 38h			;c29b
	rst 38h			;c29c
	rst 38h			;c29d
	rst 38h			;c29e
	rst 38h			;c29f
	rst 38h			;c2a0
	rst 38h			;c2a1
	rst 18h			;c2a2
	rst 38h			;c2a3
	rst 38h			;c2a4
	rst 38h			;c2a5
	rst 38h			;c2a6
	rst 38h			;c2a7
	rst 38h			;c2a8
	rst 38h			;c2a9
	rst 38h			;c2aa
	rst 38h			;c2ab
	rst 38h			;c2ac
	rst 28h			;c2ad
	rst 38h			;c2ae
	rst 38h			;c2af
	rst 38h			;c2b0
	rst 38h			;c2b1
	rst 38h			;c2b2
	cp a			;c2b3
	rst 38h			;c2b4
	rst 38h			;c2b5
	rst 38h			;c2b6
	rst 38h			;c2b7
	defb 0fdh,0fdh,0f3h ;illegal sequence	;c2b8
	push hl			;c2bb
	res 2,l			;c2bc
	xor e			;c2be
	ld a,(hl)		;c2bf
	rst 38h			;c2c0
	rst 38h			;c2c1
	rst 38h			;c2c2
	sbc a,a			;c2c3
	rst 38h			;c2c4
	rst 38h			;c2c5
	rst 38h			;c2c6
	rst 38h			;c2c7
	rst 38h			;c2c8
	rst 38h			;c2c9
	rst 38h			;c2ca
	rst 38h			;c2cb
	rst 38h			;c2cc
	rst 38h			;c2cd
	call m,sub_f0f1h	;c2ce
	call m,sub_fddeh	;c2d1
	jp po,lf2cah		;c2d4
	call m,sub_fdffh	;c2d7
	ex (sp),hl		;c2da
	dec d			;c2db
	xor e			;c2dc
	push de			;c2dd
	res 7,(hl)		;c2de
	nop			;c2e0
	nop			;c2e1
	nop			;c2e2
	nop			;c2e3
	nop			;c2e4
	nop			;c2e5
	nop			;c2e6
	nop			;c2e7
	rst 38h			;c2e8
	rst 38h			;c2e9
	rst 38h			;c2ea
	rst 38h			;c2eb
	rst 38h			;c2ec
	rst 38h			;c2ed
	rst 38h			;c2ee
	rst 38h			;c2ef
	rst 38h			;c2f0
	rst 38h			;c2f1
	cp 0feh			;c2f2
	defb 0fdh,0f2h,002h ;illegal sequence	;c2f4
	ld d,a			;c2f7
	xor d			;c2f8
	ld d,l			;c2f9
	dec hl			;c2fa
	ld d,l			;c2fb
	dec hl			;c2fc
	ld d,l			;c2fd
	xor e			;c2fe
	ld a,(hl)		;c2ff
	add a,b			;c300
	nop			;c301
	nop			;c302
	nop			;c303
	nop			;c304
	nop			;c305
	nop			;c306
	nop			;c307
	nop			;c308
	nop			;c309
	nop			;c30a
	nop			;c30b
	nop			;c30c
	nop			;c30d
	nop			;c30e
	nop			;c30f
lc310h:
	call m,sub_defeh	;c310
	rst 38h			;c313
	cp 0fdh			;c314
	ei			;c316
	rst 0			;c317
	dec hl			;c318
	rst 10h			;c319
	xor e			;c31a
	push de			;c31b
	xor e			;c31c
	push de			;c31d
	xor e			;c31e
	ld a,(hl)		;c31f
	nop			;c320
	nop			;c321
	nop			;c322
	nop			;c323
	nop			;c324
	nop			;c325
	nop			;c326
	nop			;c327
	nop			;c328
	nop			;c329
	nop			;c32a
	nop			;c32b
	nop			;c32c
	nop			;c32d
	nop			;c32e
	nop			;c32f
	nop			;c330
	nop			;c331
	nop			;c332
	nop			;c333
	nop			;c334
	nop			;c335
	nop			;c336
	nop			;c337
	rst 38h			;c338
	rst 38h			;c339
	call pe,lffffh		;c33a
	pop af			;c33d
	adc a,a			;c33e
	rst 38h			;c33f
	ld a,h			;c340
	jp m,le6d5h		;c341
lc344h:
	ret p			;c344
	rst 38h			;c345
	rst 38h			;c346
	rst 38h			;c347
	rst 38h			;c348
	defb 0fdh,07fh,09fh ;illegal sequence	;c349
	rst 28h			;c34c
	call m,sub_f7feh	;c34d
	ld a,a			;c350
	cp a			;c351
	ld e,b			;c352
	add a,a			;c353
	ccf			;c354
	cp 0c1h			;c355
	rst 38h			;c357
	rst 38h			;c358
	rst 38h			;c359
	ex (sp),hl		;c35a
	push de			;c35b
	xor d			;c35c
	or h			;c35d
	ld e,c			;c35e
	ld (lffd5h),hl		;c35f
	rst 38h			;c362
	rst 38h			;c363
	ex de,hl		;c364
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c365
	rst 38h			;c368
	ex (sp),hl		;c369
	rst 38h			;c36a
	rst 38h			;c36b
	jp 03f9fh		;c36c
	ld a,(hl)		;c36f
	rst 38h			;c370
	defb 0fdh,0ffh,0bfh ;illegal sequence	;c371
	ld e,a			;c374
	cp (hl)			;c375
	rst 38h			;c376
	rst 38h			;c377
	cp a			;c378
	ei			;c379
	rst 38h			;c37a
	rst 38h			;c37b
	rst 38h			;c37c
	rst 20h			;c37d
	call m,sub_bf7fh	;c37e
	cp 0dch			;c381
	ex de,hl		;c383
	rst 30h			;c384
	ld a,a			;c385
	rst 38h			;c386
	rst 38h			;c387
	rst 38h			;c388
	rst 38h			;c389
	ld a,a			;c38a
	rst 38h			;c38b
	rst 28h			;c38c
	call m,sub_f77eh	;c38d
	rst 38h			;c390
	ld a,a			;c391
	cp b			;c392
	ld b,a			;c393
	xor a			;c394
	rst 38h			;c395
	or l			;c396
	rst 38h			;c397
	rst 38h			;c398
	rst 38h			;c399
	rst 38h			;c39a
	push af			;c39b
	jp m,033cfh		;c39c
	defb 0fdh,0feh,0ffh ;illegal sequence	;c39f
	rst 38h			;c3a2
	ld sp,hl		;c3a3
	rst 30h			;c3a4
	ld a,a			;c3a5
	rst 38h			;c3a6
	rst 38h			;c3a7
	rst 38h			;c3a8
	ld c,a			;c3a9
	rst 38h			;c3aa
	rst 38h			;c3ab
	rst 38h			;c3ac
	rst 8			;c3ad
	or e			;c3ae
	ld a,a			;c3af
	rst 38h			;c3b0
	rst 38h			;c3b1
	defb 0fdh,0dfh,0afh ;illegal sequence	;c3b2
	rst 18h			;c3b5
	rst 38h			;c3b6
	rst 38h			;c3b7
	rst 28h			;c3b8
	rst 38h			;c3b9
	ei			;c3ba
	rst 38h			;c3bb
lc3bch:
	rst 38h			;c3bc
	rst 20h			;c3bd
	call m,sub_bf7fh	;c3be
	rst 38h			;c3c1
	sbc a,0e9h		;c3c2
	or 0ffh			;c3c4
	ld a,a			;c3c6
	rst 38h			;c3c7
	rst 38h			;c3c8
	rst 38h			;c3c9
	rst 38h			;c3ca
	ld (hl),a		;c3cb
	rst 38h			;c3cc
	rst 38h			;c3cd
	ld a,e			;c3ce
	rst 38h			;c3cf
	rst 38h			;c3d0
	rra			;c3d1
	xor b			;c3d2
	rst 0			;c3d3
	rra			;c3d4
	ld (iy-001h),a		;c3d5
	rst 38h			;c3d8
	rst 38h			;c3d9
	rst 38h			;c3da
	rst 38h			;c3db
	cp 0dch			;c3dc
	sbc a,d			;c3de
	or c			;c3df
	sbc a,h			;c3e0
	rst 8			;c3e1
	rst 38h			;c3e2
	rst 38h			;c3e3
	ld sp,hl		;c3e4
	rst 30h			;c3e5
	cp a			;c3e6
	rst 38h			;c3e7
	rst 38h			;c3e8
	rst 10h			;c3e9
	defb 0fdh,0ffh,07fh ;illegal sequence	;c3ea
	adc a,a			;c3ed
	and e			;c3ee
	ld c,a			;c3ef
	ccf			;c3f0
	rst 38h			;c3f1
	rst 38h			;c3f2
	call 0a7b7h		;c3f3
	rst 8			;c3f6
	rst 38h			;c3f7
lc3f8h:
	nop			;c3f8
	nop			;c3f9
	nop			;c3fa
	nop			;c3fb
	nop			;c3fc
	nop			;c3fd
	inc b			;c3fe
	ld (bc),a		;c3ff
	jp nz,lfef1h		;c400
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c403
	rst 38h			;c406
	cp 0ffh			;c407
	rst 38h			;c409
	rst 38h			;c40a
	rst 38h			;c40b
	rst 38h			;c40c
	rst 38h			;c40d
	rst 38h			;c40e
	rst 38h			;c40f
	rst 38h			;c410
	rst 38h			;c411
	rst 38h			;c412
	rst 38h			;c413
	rst 38h			;c414
	rst 18h			;c415
	rst 38h			;c416
	rst 38h			;c417
	rst 38h			;c418
	ld sp,hl		;c419
	ld sp,hl		;c41a
	rst 38h			;c41b
	rst 38h			;c41c
	rst 38h			;c41d
	rst 0			;c41e
	jp pe,lfef5h		;c41f
	ret z			;c422
	pop af			;c423
	call m,sub_fcfeh	;c424
	ld bc,00000h		;c427
	nop			;c42a
	ex af,af'		;c42b
	ld (01111h),hl		;c42c
	add hl,hl		;c42f
	ld l,h			;c430
	ld h,(hl)		;c431
	and d			;c432
	ld d,l			;c433
	rst 28h			;c434
	defb 0fdh,0feh,0ffh ;illegal sequence	;c435
	rst 38h			;c438
	rst 38h			;c439
	rst 38h			;c43a
	rst 38h			;c43b
	di			;c43c
	di			;c43d
	rst 38h			;c43e
	rst 38h			;c43f
	cp 0ffh			;c440
	rst 38h			;c442
	call m,lffffh		;c443
	rst 38h			;c446
	ld a,a			;c447
	cp b			;c448
	ld b,b			;c449
	xor d			;c44a
	push af			;c44b
	cp 0fah			;c44c
	add a,001h		;c44e
	rst 30h			;c450
	rlca			;c451
	rst 38h			;c452
	rst 38h			;c453
	rst 38h			;c454
	rst 38h			;c455
	rst 38h			;c456
	rst 38h			;c457
	nop			;c458
	nop			;c459
	nop			;c45a
	djnz lc465h		;c45b
	ex af,af'		;c45d
	inc c			;c45e
	adc a,h			;c45f
	call 06666h		;c460
	ld d,e			;c463
	xor e			;c464
lc465h:
	push de			;c465
	cp 0ffh			;c466
	rst 38h			;c468
	ret m			;c469
	rst 38h			;c46a
	ret po			;c46b
	push af			;c46c
	cp 0ffh			;c46d
	rst 38h			;c46f
	cp a			;c470
	sbc a,0f8h		;c471
	ld bc,lfd86h		;c473
	cp (hl)			;c476
	ld bc,lff7fh		;c477
	ccf			;c47a
	cp a			;c47b
	ccf			;c47c
	rst 38h			;c47d
	rst 38h			;c47e
	rst 38h			;c47f
	rst 38h			;c480
	rst 38h			;c481
	rst 38h			;c482
	rst 38h			;c483
lc484h:
	rst 38h			;c484
	rst 38h			;c485
	rst 38h			;c486
	rst 38h			;c487
	jp nz,08484h		;c488
	adc a,h			;c48b
	ld c,h			;c48c
	ld e,h			;c48d
	ld l,b			;c48e
	jr nc,$+90		;c48f
	sbc a,b			;c491
	or b			;c492
	call c,00adch		;c493
	and h			;c496
	ld a,e			;c497
	ld (iy-008h),d		;c498
	adc a,h			;c49b
	ld e,0a4h		;c49c
	jp c,le7f1h		;c49e
	rrca			;c4a1
	rst 38h			;c4a2
	rst 38h			;c4a3
	rst 38h			;c4a4
	rst 38h			;c4a5
	rst 38h			;c4a6
	rst 38h			;c4a7
	rst 38h			;c4a8
	rst 38h			;c4a9
	rst 38h			;c4aa
	rst 38h			;c4ab
	rst 38h			;c4ac
	rst 38h			;c4ad
	rst 38h			;c4ae
	rst 38h			;c4af
	rst 38h			;c4b0
	rst 38h			;c4b1
	rst 38h			;c4b2
	rst 38h			;c4b3
	rst 38h			;c4b4
	rst 38h			;c4b5
	rst 38h			;c4b6
	rst 38h			;c4b7
	or a			;c4b8
	ex de,hl		;c4b9
	rst 38h			;c4ba
	jp m,ldfffh		;c4bb
	rst 38h			;c4be
	ei			;c4bf
	rst 38h			;c4c0
	or 0bfh			;c4c1
	rst 38h			;c4c3
	rst 30h			;c4c4
	rst 38h			;c4c5
	defb 0fdh,0ffh,0dbh ;illegal sequence	;c4c6
	ld a,a			;c4c9
	defb 0ddh,0ffh,0fbh ;illegal sequence	;c4ca
	ld a,a			;c4cd
	rst 38h			;c4ce
	rst 18h			;c4cf
	ei			;c4d0
	defb 0fdh,0fbh,0dfh ;illegal sequence	;c4d1
	rst 38h			;c4d4
	rst 38h			;c4d5
	rst 38h			;c4d6
	rst 38h			;c4d7
	nop			;c4d8
	ld h,c			;c4d9
	ld (01b1ah),a		;c4da
	dec de			;c4dd
	ld sp,07161h		;c4de
	add hl,sp		;c4e1
	dec de			;c4e2
	dec de			;c4e3
	cp a			;c4e4
	ld e,e			;c4e5
	cp e			;c4e6
	ld d,(hl)		;c4e7
	djnz lc4fah		;c4e8
	jr $+10			;c4ea
	ex af,af'		;c4ec
	inc c			;c4ed
	inc c			;c4ee
	add a,h			;c4ef
	adc a,h			;c4f0
	sbc a,b			;c4f1
	sbc a,d			;c4f2
	ld sp,lb57bh		;c4f3
	ld (hl),d		;c4f6
	ld hl,(lffefh)		;c4f7
lc4fah:
	cp a			;c4fa
	ei			;c4fb
	rra			;c4fc
	rst 0			;c4fd
	xor d			;c4fe
	rst 38h			;c4ff
	rst 38h			;c500
	ld a,e			;c501
	defb 0fdh,0d7h,07ch ;illegal sequence	;c502
	ret po			;c505
	ld bc,lffffh		;c506
	jp (hl)			;c509
	cp h			;c50a
	xor 063h		;c50b
	ret p			;c50d
	sbc a,b			;c50e
	rst 38h			;c50f
	defb 0ddh,0ffh,0ebh ;illegal sequence	;c510
	ld a,(hl)		;c513
	rlca			;c514
	pop af			;c515
	ld e,a			;c516
	rst 38h			;c517
	ld bc,00603h		;c518
	dec b			;c51b
	ld b,0c5h		;c51c
	halt			;c51e
	dec l			;c51f
	ld d,039h		;c520
lc522h:
	ld a,(le676h)		;c522
	add a,e			;c525
	inc bc			;c526
	inc bc			;c527
	inc bc			;c528
	ld h,c			;c529
	ld sp,01a1ah		;c52a
	dec de			;c52d
	ld sp,07361h		;c52e
	add hl,sp		;c531
	dec de			;c532
	dec de			;c533
	cp a			;c534
	ld e,e			;c535
	cp e			;c536
	ld d,(hl)		;c537
	or (hl)			;c538
	jp pe,lf9feh		;c539
	defb 0fdh,0d9h,0fbh ;illegal sequence	;c53c
	ei			;c53f
	ei			;c540
	ei			;c541
	cp e			;c542
	ei			;c543
	jp m,lfafbh		;c544
	ld sp,hl		;c547
	jp m,0dce9h		;c548
	rst 28h			;c54b
	rst 38h			;c54c
	ret m			;c54d
	rst 38h			;c54e
	rst 38h			;c54f
	add a,b			;c550
	ld a,b			;c551
	xor h			;c552
	ld d,h			;c553
	xor h			;c554
	ld d,h			;c555
	xor b			;c556
	ld (hl),b		;c557
	adc a,h			;c558
	ld (hl),d		;c559
	ret m			;c55a
	call m,0034eh		;c55b
	nop			;c55e
	nop			;c55f
	sub b			;c560
	sub b			;c561
	ret c			;c562
	ret z			;c563
	ret z			;c564
	ld l,h			;c565
	ld l,h			;c566
	inc (hl)		;c567
	sub h			;c568
	or d			;c569
	cp d			;c56a
	ld sp,l7563h		;c56b
	ld h,d			;c56e
	ld d,d			;c56f
	ex de,hl		;c570
	rst 8			;c571
	defb 0edh ;next byte illegal after ed	;c572
	rst 8			;c573
	sbc a,e			;c574
	rst 18h			;c575
	sbc a,a			;c576
	rra			;c577
	cp e			;c578
	dec a			;c579
	cp e			;c57a
	ccf			;c57b
	cp a			;c57c
	ccf			;c57d
	cp a			;c57e
	ccf			;c57f
	and a			;c580
	dec sp			;c581
	ld a,a			;c582
	rst 28h			;c583
	sbc a,a			;c584
	ld a,a			;c585
	rst 38h			;c586
	rst 38h			;c587
lc588h:
	jp 0c110h		;c588
	inc d			;c58b
	inc bc			;c58c
	jr lc596h		;c58d
	ret nc			;c58f
	ld bc,l8070h		;c590
	ld d,0c0h		;c593
	rra			;c595
lc596h:
	ret nz			;c596
	ld e,0c1h		;c597
	djnz lc522h		;c599
	djnz lc5a0h		;c59b
	ld c,b			;c59d
	inc bc			;c59e
	ret pe			;c59f
lc5a0h:
	ld bc,l8078h		;c5a0
	ld a,(de)		;c5a3
	pop hl			;c5a4
	inc c			;c5a5
	ex (sp),hl		;c5a6
	ex af,af'		;c5a7
	rst 38h			;c5a8
	nop			;c5a9
	rst 38h			;c5aa
	nop			;c5ab
	rst 38h			;c5ac
	nop			;c5ad
	rst 38h			;c5ae
	nop			;c5af
	rst 38h			;c5b0
	nop			;c5b1
	rst 38h			;c5b2
	nop			;c5b3
	rst 38h			;c5b4
	nop			;c5b5
	rst 38h			;c5b6
	nop			;c5b7
	rst 38h			;c5b8
	nop			;c5b9
	rst 38h			;c5ba
	nop			;c5bb
	rst 38h			;c5bc
lc5bdh:
	nop			;c5bd
	add a,d			;c5be
	nop			;c5bf
	nop			;c5c0
	ld a,l			;c5c1
	nop			;c5c2
	sub 000h		;c5c3
	xor e			;c5c5
	nop			;c5c6
	push de			;c5c7
	nop			;c5c8
	xor e			;c5c9
	nop			;c5ca
	rst 10h			;c5cb
	nop			;c5cc
	xor d			;c5cd
	nop			;c5ce
	ld a,h			;c5cf
	add a,b			;c5d0
	ld bc,003c0h		;c5d1
	add a,b			;c5d4
	inc sp			;c5d5
	nop			;c5d6
	ld c,e			;c5d7
	or b			;c5d8
	rlca			;c5d9
	ret m			;c5da
	inc bc			;c5db
	ret nz			;c5dc
	ld bc,03880h		;c5dd
	nop			;c5e0
	ld b,h			;c5e1
	cp b			;c5e2
	ld (bc),a		;c5e3
	call m,lfc01h		;c5e4
	ld bc,00086h		;c5e7
	ld (bc),a		;c5ea
	ld a,b			;c5eb
	nop			;c5ec
	call m,0de00h		;c5ed
	nop			;c5f0
	sbc a,(hl)		;c5f1
	nop			;c5f2
	sbc a,a			;c5f3
	nop			;c5f4
	rst 8			;c5f5
	nop			;c5f6
	ld c,a			;c5f7
	add a,b			;c5f8
	rrca			;c5f9
	ret nz			;c5fa
	rrca			;c5fb
	add a,b			;c5fc
	scf			;c5fd
	add a,b			;c5fe
	scf			;c5ff
lc600h:
	ret nz			;c600
	rlca			;c601
	cp b			;c602
	inc bc			;c603
	jr $+68			;c604
	or b			;c606
	dec b			;c607
	ret nz			;c608
	rra			;c609
	add a,b			;c60a
	dec (hl)		;c60b
	nop			;c60c
	ld l,d			;c60d
	nop			;c60e
	ld d,l			;c60f
	nop			;c610
	ld l,d			;c611
	add a,b			;c612
	dec (hl)		;c613
	add a,b			;c614
	ld hl,(03580h)		;c615
	ret nz			;c618
	ld a,(de)		;c619
	ret nz			;c61a
	inc c			;c61b
	nop			;c61c
	rlca			;c61d
	nop			;c61e
	ret po			;c61f
	nop			;c620
	di			;c621
	nop			;c622
	scf			;c623
	nop			;c624
	ld l,000h		;c625
	inc e			;c627
	nop			;c628
	add hl,sp		;c629
	nop			;c62a
	jr nc,lc62dh		;c62b
lc62dh:
	scf			;c62d
	nop			;c62e
	dec de			;c62f
	nop			;c630
	ret c			;c631
	nop			;c632
	exx			;c633
	nop			;c634
	ld c,030h		;c635
	rlca			;c637
	jr c,lc5bdh		;c638
	nop			;c63a
	add a,h			;c63b
	nop			;c63c
	and 000h		;c63d
	ret m			;c63f
	nop			;c640
	cp (hl)			;c641
	nop			;c642
	ld c,a			;c643
	nop			;c644
	ld d,e			;c645
	nop			;c646
	jr nc,lc649h		;c647
lc649h:
	and e			;c649
	nop			;c64a
	sbc a,h			;c64b
	nop			;c64c
	or a			;c64d
	nop			;c64e
	ld l,l			;c64f
	nop			;c650
	ld e,e			;c651
	nop			;c652
	ld d,a			;c653
	nop			;c654
	daa			;c655
	nop			;c656
	sbc a,e			;c657
	nop			;c658
	rlc b			;c659
	rst 30h			;c65b
	nop			;c65c
	ei			;c65d
	nop			;c65e
	ei			;c65f
	nop			;c660
	defb 0fdh,000h,0ffh ;illegal sequence	;c661
lc664h:
	nop			;c664
	rst 38h			;c665
lc666h:
	nop			;c666
	ld a,a			;c667
lc668h:
	ccf			;c668
	nop			;c669
lc66ah:
	rra			;c66a
	ret nz			;c66b
	rrca			;c66c
	and b			;c66d
	rrca			;c66e
	ld h,b			;c66f
	rrca			;c670
	and b			;c671
	rrca			;c672
	ld h,b			;c673
	ld e,0c0h		;c674
	inc c			;c676
	and c			;c677
	nop			;c678
	ld h,e			;c679
	nop			;c67a
	rst 8			;c67b
	nop			;c67c
	inc c			;c67d
	ld bc,001f0h		;c67e
	inc e			;c681
	nop			;c682
	ld h,000h		;c683
	ld h,d			;c685
	nop			;c686
	ld h,d			;c687
	nop			;c688
	add a,(hl)		;c689
	ld bc,0037ch		;c68a
	ret m			;c68d
	rlca			;c68e
	add a,b			;c68f
	ccf			;c690
	nop			;c691
	ccf			;c692
	add a,b			;c693
	ld a,000h		;c694
	ld e,080h		;c696
	ld c,0e0h		;c698
	inc b			;c69a
	ld (hl),b		;c69b
	nop			;c69c
	ld (03500h),a		;c69d
	nop			;c6a0
	ld (hl),h		;c6a1
	nop			;c6a2
	ld h,h			;c6a3
	nop			;c6a4
	adc a,c			;c6a5
	nop			;c6a6
	jp nc,06400h		;c6a7
lc6aah:
	nop			;c6aa
	inc (hl)		;c6ab
	nop			;c6ac
	dec (hl)		;c6ad
	nop			;c6ae
	sbc a,c			;c6af
	nop			;c6b0
	exx			;c6b1
	nop			;c6b2
	ex de,hl		;c6b3
	nop			;c6b4
	ex de,hl		;c6b5
	nop			;c6b6
	rst 30h			;c6b7
	nop			;c6b8
	rst 30h			;c6b9
	nop			;c6ba
	rst 30h			;c6bb
	nop			;c6bc
	ei			;c6bd
	nop			;c6be
	ei			;c6bf
	nop			;c6c0
	rst 30h			;c6c1
	nop			;c6c2
lc6c3h:
	rst 38h			;c6c3
	nop			;c6c4
	rst 38h			;c6c5
	nop			;c6c6
	rst 38h			;c6c7
	rst 38h			;c6c8
	nop			;c6c9
	rst 38h			;c6ca
	nop			;c6cb
lc6cch:
	rst 38h			;c6cc
	nop			;c6cd
	rst 38h			;c6ce
	nop			;c6cf
	rst 38h			;c6d0
	nop			;c6d1
	rst 38h			;c6d2
	nop			;c6d3
	rra			;c6d4
	nop			;c6d5
	rrca			;c6d6
	ret po			;c6d7
	rlca			;c6d8
	ret p			;c6d9
	rlca			;c6da
	jr nc,lc664h		;c6db
	jr nc,lc666h		;c6dd
	jr nc,lc668h		;c6df
	jr nc,lc66ah		;c6e1
	jr nc,lc668h		;c6e3
	jr c,lc6aah		;c6e5
	jr lc6cch		;c6e7
	ex af,af'		;c6e9
	pop bc			;c6ea
	inc e			;c6eb
	add a,b			;c6ec
	ld a,080h		;c6ed
	ld a,080h		;c6ef
	ld (hl),000h		;c6f1
	ld l,d			;c6f3
	nop			;c6f4
	push de			;c6f5
	nop			;c6f6
	xor e			;c6f7
	nop			;c6f8
	push de			;c6f9
	nop			;c6fa
	xor e			;c6fb
	ld bc,00356h		;c6fc
	inc a			;c6ff
sub_c700h:
	rra			;c700
	nop			;c701
	rra			;c702
	ret po			;c703
	rrca			;c704
	djnz lc716h		;c705
	nop			;c707
	rlca			;c708
	ld a,b			;c709
	inc bc			;c70a
	call m,sub_fe01h	;c70b
	nop			;c70e
	rst 38h			;c70f
	nop			;c710
lc711h:
	di			;c711
	nop			;c712
	ex (sp),hl		;c713
lc714h:
	nop			;c714
	pop hl			;c715
lc716h:
	nop			;c716
	jp po,sub_f001h		;c717
	ld bc,003f4h		;c71a
	ret p			;c71d
	ld bc,000e0h		;c71e
	add a,000h		;c721
	and 000h		;c723
	ret nc			;c725
	inc bc			;c726
	xor b			;c727
	nop			;c728
	rst 38h			;c729
	nop			;c72a
	rst 38h			;c72b
	nop			;c72c
	rst 30h			;c72d
	nop			;c72e
	rst 38h			;c72f
	nop			;c730
	rst 38h			;c731
	nop			;c732
	rst 38h			;c733
	nop			;c734
	rst 38h			;c735
	nop			;c736
	ei			;c737
	nop			;c738
	rst 30h			;c739
	nop			;c73a
	rst 38h			;c73b
	nop			;c73c
	cp a			;c73d
	nop			;c73e
	rst 38h			;c73f
	nop			;c740
	rst 38h			;c741
	nop			;c742
	rst 30h			;c743
	nop			;c744
	rst 38h			;c745
	nop			;c746
	ld a,a			;c747
	nop			;c748
	ld a,a			;c749
	add a,b			;c74a
	ld a,000h		;c74b
	ld e,(hl)		;c74d
	add a,b			;c74e
	inc l			;c74f
	ld bc,0a04ch		;c750
	inc c			;c753
	ld bc,la14ch		;c754
	inc c			;c757
	ld bc,0a34ch		;c758
	ex af,af'		;c75b
	ex (sp),hl		;c75c
	ex af,af'		;c75d
	ex (sp),hl		;c75e
	ex af,af'		;c75f
	ex (sp),hl		;c760
	ex af,af'		;c761
	and e			;c762
	ex af,af'		;c763
	inc bc			;c764
	ld c,b			;c765
	and e			;c766
	ex af,af'		;c767
	nop			;c768
	rst 38h			;c769
	nop			;c76a
	rst 38h			;c76b
	nop			;c76c
	rst 38h			;c76d
	nop			;c76e
	ld a,a			;c76f
	nop			;c770
	rst 38h			;c771
	nop			;c772
	rst 38h			;c773
	nop			;c774
	rst 38h			;c775
	nop			;c776
	rst 38h			;c777
	nop			;c778
	rst 38h			;c779
	nop			;c77a
	cp a			;c77b
	nop			;c77c
	rst 38h			;c77d
	nop			;c77e
	cp 000h			;c77f
	rst 38h			;c781
	nop			;c782
	rst 30h			;c783
	nop			;c784
	ex de,hl		;c785
	nop			;c786
	sub a			;c787
	nop			;c788
	ld c,e			;c789
	jr nc,lc711h		;c78a
	nop			;c78c
	ld c,c			;c78d
	jr nc,lc714h		;c78e
	nop			;c790
	ld c,b			;c791
	jr nc,$-122		;c792
	dec de			;c794
	ld b,b			;c795
	or c			;c796
	inc b			;c797
	dec de			;c798
	ld b,b			;c799
	or c			;c79a
	inc b			;c79b
	ei			;c79c
	nop			;c79d
	pop af			;c79e
	inc b			;c79f
	ei			;c7a0
	nop			;c7a1
lc7a2h:
	rst 38h			;c7a2
	nop			;c7a3
	rst 38h			;c7a4
	nop			;c7a5
	rst 38h			;c7a6
	nop			;c7a7
	nop			;c7a8
	rst 38h			;c7a9
	nop			;c7aa
	ld a,a			;c7ab
	nop			;c7ac
	cp a			;c7ad
	nop			;c7ae
	ld a,a			;c7af
	nop			;c7b0
	rst 38h			;c7b1
	nop			;c7b2
	ei			;c7b3
	nop			;c7b4
	rst 38h			;c7b5
	nop			;c7b6
	jp m,lfd00h		;c7b7
	nop			;c7ba
	jp m,lf500h		;c7bb
	nop			;c7be
	jp m,sub_7401h		;c7bf
	ex af,af'		;c7c2
	jp po,le401h		;c7c3
	ex af,af'		;c7c6
	jp po,0600dh		;c7c7
	ex af,af'		;c7ca
	jp po,le00dh		;c7cb
	ex af,af'		;c7ce
	jp po,le00dh		;c7cf
	rra			;c7d2
	ret nz			;c7d3
	rra			;c7d4
	ld b,b			;c7d5
	rra			;c7d6
	ld b,b			;c7d7
	rra			;c7d8
	ld b,b			;c7d9
	rra			;c7da
	ld b,b			;c7db
	rra			;c7dc
	ld b,b			;c7dd
	rra			;c7de
	ld b,b			;c7df
	cp a			;c7e0
	nop			;c7e1
	rra			;c7e2
	ld b,b			;c7e3
	rra			;c7e4
	ld b,b			;c7e5
	cp a			;c7e6
	nop			;c7e7
	nop			;c7e8
	rst 38h			;c7e9
	nop			;c7ea
	rst 38h			;c7eb
	nop			;c7ec
	rst 28h			;c7ed
	nop			;c7ee
	rst 38h			;c7ef
	nop			;c7f0
	rst 38h			;c7f1
	nop			;c7f2
	rst 38h			;c7f3
lc7f4h:
	nop			;c7f4
	defb 0fdh,000h,0ffh ;illegal sequence	;c7f5
lc7f8h:
	nop			;c7f8
	ld (hl),a		;c7f9
	nop			;c7fa
	rst 30h			;c7fb
lc7fch:
	nop			;c7fc
	dec hl			;c7fd
	add a,b			;c7fe
	daa			;c7ff
	add a,b			;c800
	inc hl			;c801
	add a,b			;c802
	dec h			;c803
	add a,b			;c804
	ld (02481h),hl		;c805
	adc a,b			;c808
	ld (0208dh),hl		;c809
	adc a,b			;c80c
	ld (000ddh),hl		;c80d
	adc a,a			;c810
	jr nz,lc7a2h		;c811
	jr nz,lc7f4h		;c813
	nop			;c815
	adc a,a			;c816
	jr nz,lc7f8h		;c817
	nop			;c819
	adc a,a			;c81a
	jr nz,lc7fch		;c81b
	nop			;c81d
	rst 38h			;c81e
	nop			;c81f
	rst 38h			;c820
	nop			;c821
	rst 38h			;c822
	nop			;c823
	rst 38h			;c824
	nop			;c825
	rst 38h			;c826
	nop			;c827
	nop			;c828
	nop			;c829
	nop			;c82a
	nop			;c82b
	nop			;c82c
	nop			;c82d
	nop			;c82e
	nop			;c82f
	nop			;c830
	nop			;c831
	nop			;c832
	nop			;c833
	nop			;c834
	nop			;c835
	nop			;c836
	nop			;c837
	nop			;c838
	nop			;c839
	nop			;c83a
	nop			;c83b
	add a,b			;c83c
	ret po			;c83d
	ld h,b			;c83e
	ld (hl),b		;c83f
	jr c,$+33		;c840
	rrca			;c842
	inc bc			;c843
	inc bc			;c844
	ld bc,00101h		;c845
	inc bc			;c848
	inc bc			;c849
	inc bc			;c84a
	inc bc			;c84b
	inc bc			;c84c
	ld bc,00001h		;c84d
	ld bc,00301h		;c850
	inc bc			;c853
	inc bc			;c854
	ld bc,00101h		;c855
	inc bc			;c858
	rlca			;c859
	rrca			;c85a
	dec bc			;c85b
	rra			;c85c
	dec de			;c85d
	dec de			;c85e
	dec c			;c85f
	ld b,003h		;c860
	nop			;c862
	nop			;c863
	xor b			;c864
	ld d,l			;c865
	ld a,(bc)		;c866
	ld bc,03810h		;c867
	ld a,03bh		;c86a
	ld e,00fh		;c86c
	inc bc			;c86e
	nop			;c86f
	nop			;c870
	nop			;c871
	ld bc,00001h		;c872
	nop			;c875
	nop			;c876
	nop			;c877
	nop			;c878
	nop			;c879
	nop			;c87a
	nop			;c87b
	nop			;c87c
	nop			;c87d
	inc bc			;c87e
	rlca			;c87f
	rrca			;c880
	rrca			;c881
	adc a,a			;c882
	adc a,l			;c883
	push bc			;c884
	add a,0c3h		;c885
	pop bc			;c887
	add a,b			;c888
	add a,b			;c889
	add a,b			;c88a
	ret nz			;c88b
	pop hl			;c88c
	adc a,a			;c88d
	ld a,a			;c88e
	rst 38h			;c88f
	cp a			;c890
	ld a,a			;c891
	ld a,a			;c892
	ld a,(hl)		;c893
	defb 0fdh,0ffh,0fbh ;illegal sequence	;c894
	jp m,lfffah		;c897
	defb 0fdh,0ffh,0ffh ;illegal sequence	;c89a
	cp 0feh			;c89d
	cp 0ffh			;c89f
	rst 38h			;c8a1
	rst 38h			;c8a2
	ccf			;c8a3
	rra			;c8a4
	ld b,a			;c8a5
	xor d			;c8a6
	ld d,l			;c8a7
	nop			;c8a8
	nop			;c8a9
	nop			;c8aa
	nop			;c8ab
	ret nz			;c8ac
	ld h,b			;c8ad
	ret po			;c8ae
	ret p			;c8af
	ret nc			;c8b0
	ret nc			;c8b1
	ret m			;c8b2
	rst 38h			;c8b3
	ld sp,hl		;c8b4
	rra			;c8b5
	rlca			;c8b6
	inc bc			;c8b7
	rlca			;c8b8
	rlca			;c8b9
	inc bc			;c8ba
	rra			;c8bb
	ccf			;c8bc
	ld a,(hl)		;c8bd
	call m,sub_f8f8h	;c8be
	ret p			;c8c1
	ret p			;c8c2
	ret m			;c8c3
	ret m			;c8c4
	call m,sub_fc7ch	;c8c5
	xor 037h		;c8c8
	rla			;c8ca
	rra			;c8cb
	rst 18h			;c8cc
	rst 38h			;c8cd
	rst 38h			;c8ce
	rst 38h			;c8cf
	rst 38h			;c8d0
	cp 0fch			;c8d1
	ret m			;c8d3
	ret p			;c8d4
	add a,b			;c8d5
	ld a,a			;c8d6
	rst 38h			;c8d7
	rst 38h			;c8d8
	ld a,(hl)		;c8d9
	add a,b			;c8da
	ret po			;c8db
	ret nz			;c8dc
	add a,b			;c8dd
lc8deh:
	add a,b			;c8de
	ret nz			;c8df
	ld h,b			;c8e0
	ld h,b			;c8e1
	cp l			;c8e2
	sbc a,0fbh		;c8e3
	defb 0fdh,0ffh,07fh ;illegal sequence	;c8e5
	nop			;c8e8
	nop			;c8e9
	nop			;c8ea
	nop			;c8eb
	nop			;c8ec
	ld bc,00000h		;c8ed
	nop			;c8f0
	nop			;c8f1
	nop			;c8f2
	nop			;c8f3
	add a,b			;c8f4
	ld b,b			;c8f5
	and b			;c8f6
	and b			;c8f7
	ret po			;c8f8
	call po,sub_e4e2h	;c8f9
	jp nz,00205h		;c8fc
	ld bc,00102h		;c8ff
	ld (bc),a		;c902
	ld bc,00100h		;c903
	nop			;c906
	ld bc,lc0ffh+1		;c907
	ret po			;c90a
	ld h,b			;c90b
	or b			;c90c
	or b			;c90d
	or b			;c90e
	ld h,c			;c90f
	pop bc			;c910
	inc bc			;c911
	inc bc			;c912
	rlca			;c913
	ld c,0feh		;c914
	ret m			;c916
	cp 0ffh			;c917
	ld bc,02814h		;c919
	ld d,b			;c91c
	jr z,lc973h		;c91d
	jr z,lc975h		;c91f
	xor d			;c921
	ld d,l			;c922
	xor a			;c923
	ld e,a			;c924
	rst 38h			;c925
	rst 18h			;c926
	rst 18h			;c927
	nop			;c928
	nop			;c929
	nop			;c92a
	ld bc,00101h		;c92b
	add a,c			;c92e
	ret nz			;c92f
	ex (sp),hl		;c930
	ld h,a			;c931
	ld h,a			;c932
	and 0cch		;c933
	call z,0e6ceh		;c935
	and 073h		;c938
	ld a,e			;c93a
	dec sp			;c93b
	scf			;c93c
	ld d,00eh		;c93d
	ld c,08eh		;c93f
	rrca			;c941
	add a,a			;c942
	ld b,e			;c943
	add a,c			;c944
	ld b,b			;c945
	add a,b			;c946
	ld b,b			;c947
	and b			;c948
	ld d,b			;c949
	and b			;c94a
	ld d,b			;c94b
	jr nz,lc8deh		;c94c
	and b			;c94e
	sub b			;c94f
	and b			;c950
	sub b			;c951
	jr nz,$+66		;c952
	and c			;c954
	ld b,e			;c955
	add a,e			;c956
	ld b,e			;c957
	ld bc,021c1h		;c958
	rrca			;c95b
	rra			;c95c
	ld a,07dh		;c95d
	ld a,e			;c95f
	rst 38h			;c960
	cp 0f4h			;c961
	call p,sub_fcf4h	;c963
	call m,040fch		;c966
	ret nz			;c969
	add a,b			;c96a
	add a,b			;c96b
	add a,b			;c96c
	adc a,0fch		;c96d
	ret m			;c96f
	ret p			;c970
	ret nz			;c971
	nop			;c972
lc973h:
	nop			;c973
	nop			;c974
lc975h:
	nop			;c975
	nop			;c976
	nop			;c977
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
	ret nz			;c982
	ret po			;c983
	ret po			;c984
	ret p			;c985
	ld (hl),b		;c986
	ld a,b			;c987
	jr c,lc9c2h		;c988
	jr c,lc9cah		;c98a
	rra			;c98c
	rra			;c98d
	rrca			;c98e
lc98fh:
	rrca			;c98f
	rra			;c990
	ld a,(hl)		;c991
	rst 38h			;c992
	cp 0fch			;c993
	ret po			;c995
	ret po			;c996
	or b			;c997
	ret nc			;c998
	ret nc			;c999
	ret m			;c99a
	ret m			;c99b
	ret m			;c99c
	jr c,lc98fh		;c99d
	ret po			;c99f
	nop			;c9a0
	nop			;c9a1
	nop			;c9a2
	ld b,b			;c9a3
	nop			;c9a4
	ld b,b			;c9a5
	add a,b			;c9a6
	ld b,c			;c9a7
	rst 38h			;c9a8
	ld a,a			;c9a9
	cp a			;c9aa
	ld a,a			;c9ab
	cp a			;c9ac
	ld a,a			;c9ad
	ccf			;c9ae
	ld a,a			;c9af
	ccf			;c9b0
	ld a,a			;c9b1
	ld a,a			;c9b2
	rst 38h			;c9b3
	rst 38h			;c9b4
	rst 38h			;c9b5
	rst 38h			;c9b6
	ld a,a			;c9b7
	ld a,a			;c9b8
	ccf			;c9b9
	ccf			;c9ba
	ccf			;c9bb
	rra			;c9bc
	rrca			;c9bd
	inc bc			;c9be
	ld bc,00001h		;c9bf
lc9c2h:
	ld bc,00303h		;c9c2
	inc bc			;c9c5
	rlca			;c9c6
	rrca			;c9c7
	rrca			;c9c8
	rrca			;c9c9
lc9cah:
	rrca			;c9ca
	rrca			;c9cb
	rlca			;c9cc
	dec b			;c9cd
	dec b			;c9ce
	dec c			;c9cf
	dec c			;c9d0
	dec c			;c9d1
	ld b,006h		;c9d2
	ld (bc),a		;c9d4
	inc bc			;c9d5
	inc bc			;c9d6
	ld bc,00100h		;c9d7
	ld bc,00101h		;c9da
	ld (bc),a		;c9dd
	ld b,006h		;c9de
	dec c			;c9e0
	dec e			;c9e1
	dec e			;c9e2
	ld c,l			;c9e3
	ld h,e			;c9e4
	rrca			;c9e5
	ccf			;c9e6
	add a,e			;c9e7
	rst 28h			;c9e8
	or a			;c9e9
	or a			;c9ea
	rst 30h			;c9eb
	rst 30h			;c9ec
	ei			;c9ed
	ei			;c9ee
	jp m,lfbfbh		;c9ef
	jp m,lf4f6h		;c9f2
	or 0fah			;c9f5
	ei			;c9f7
	jp m,lfcfbh		;c9f8
	rst 38h			;c9fb
	rst 38h			;c9fc
	rst 38h			;c9fd
	rst 38h			;c9fe
	rst 38h			;c9ff
lca00h:
	cp 0fdh			;ca00
	jp m,lfafdh		;ca02
	defb 0fdh,0feh,0fdh ;illegal sequence	;ca05
	cp 0ffh			;ca08
	defb 0fdh,0ffh,0ffh ;illegal sequence	;ca0a
	rst 38h			;ca0d
	rst 38h			;ca0e
	rst 38h			;ca0f
	rst 38h			;ca10
	rst 38h			;ca11
	rst 38h			;ca12
	rst 38h			;ca13
	rst 38h			;ca14
	ld a,a			;ca15
	cp a			;ca16
	cp a			;ca17
	cp a			;ca18
	rst 38h			;ca19
	rst 38h			;ca1a
	cp a			;ca1b
	cp l			;ca1c
	cp l			;ca1d
	defb 0fdh,0bdh ;cp iyl	;ca1e
	cp 0feh			;ca20
	ei			;ca22
	rst 30h			;ca23
	rst 30h			;ca24
	rst 30h			;ca25
	rst 28h			;ca26
	rst 18h			;ca27
	call c,sub_d0d8h	;ca28
	pop de			;ca2b
	ret nc			;ca2c
	or c			;ca2d
	ret p			;ca2e
	pop hl			;ca2f
	add a,d			;ca30
	dec b			;ca31
	ld a,(bc)		;ca32
	dec d			;ca33
	ld a,(bc)		;ca34
	dec d			;ca35
	ld hl,(0aa55h)		;ca36
	ld d,h			;ca39
	xor b			;ca3a
	ld d,h			;ca3b
	xor b			;ca3c
	ld d,b			;ca3d
	xor b			;ca3e
	ld d,b			;ca3f
	and b			;ca40
	ld d,b			;ca41
	and b			;ca42
	ld b,b			;ca43
	add a,b			;ca44
	nop			;ca45
	add a,b			;ca46
	nop			;ca47
	nop			;ca48
	nop			;ca49
	add a,b			;ca4a
	ld b,b			;ca4b
	ret nz			;ca4c
	and b			;ca4d
	ret po			;ca4e
	ret nc			;ca4f
	pop de			;ca50
	pop af			;ca51
	out (0f7h),a		;ca52
	in a,(0fbh)		;ca54
	ex de,hl		;ca56
	ex de,hl		;ca57
	defb 0fdh,0edh,0eeh ;illegal sequence	;ca58
	or 0f6h			;ca5b
	cp 0ddh			;ca5d
	in a,(0ech)		;ca5f
	rst 28h			;ca61
	ld (hl),a		;ca62
	ld a,a			;ca63
	ld a,e			;ca64
	inc a			;ca65
	cp a			;ca66
	add a,(hl)		;ca67
	add a,d			;ca68
	ld b,l			;ca69
	add a,d			;ca6a
	ld b,h			;ca6b
	adc a,d			;ca6c
	ld d,h			;ca6d
	adc a,b			;ca6e
	inc d			;ca6f
	xor b			;ca70
	ld d,b			;ca71
	and b			;ca72
	ld b,b			;ca73
	add a,b			;ca74
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
	nop			;ca80
	nop			;ca81
	nop			;ca82
	nop			;ca83
	jr nz,lcae6h		;ca84
	ret nz			;ca86
	ret nz			;ca87
	ret nz			;ca88
	ld h,b			;ca89
	ld h,b			;ca8a
	ld (hl),b		;ca8b
	ld (hl),b		;ca8c
	ret p			;ca8d
	ret p			;ca8e
	ret po			;ca8f
	ret po			;ca90
	ret nz			;ca91
	ret nz			;ca92
	ret nz			;ca93
	add a,b			;ca94
	add a,b			;ca95
	add a,b			;ca96
	nop			;ca97
	nop			;ca98
	nop			;ca99
	add a,b			;ca9a
	add a,b			;ca9b
	add a,b			;ca9c
	ret nz			;ca9d
	ret p			;ca9e
	ret m			;ca9f
	ret m			;caa0
	ld a,l			;caa1
	ld sp,le0c6h		;caa2
	ret p			;caa5
	ld a,(hl)		;caa6
	nop			;caa7
	nop			;caa8
	nop			;caa9
	nop			;caaa
	nop			;caab
	nop			;caac
	nop			;caad
	nop			;caae
	nop			;caaf
	nop			;cab0
	nop			;cab1
	ld bc,00603h		;cab2
	rrca			;cab5
	rra			;cab6
	ccf			;cab7
	ld a,(hl)		;cab8
	ld a,h			;cab9
	ret p			;caba
	ret po			;cabb
	ret nz			;cabc
	add a,b			;cabd
	add a,b			;cabe
	nop			;cabf
	nop			;cac0
	nop			;cac1
	nop			;cac2
	nop			;cac3
	nop			;cac4
	nop			;cac5
	nop			;cac6
	nop			;cac7
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
	rlca			;cad8
	ld a,l			;cad9
	xor d			;cada
	ld d,l			;cadb
	xor e			;cadc
	sub 0aah		;cadd
	ld d,d			;cadf
	and l			;cae0
	ld a,(bc)		;cae1
	dec b			;cae2
	ld a,(bc)		;cae3
	dec d			;cae4
	dec hl			;cae5
lcae6h:
	rla			;cae6
	cpl			;cae7
	ld d,a			;cae8
	ld l,05eh		;cae9
	xor a			;caeb
	ld e,a			;caec
	xor a			;caed
	ld d,l			;caee
	xor d			;caef
	ld d,h			;caf0
	xor e			;caf1
	rla			;caf2
	and a			;caf3
	rst 10h			;caf4
	rst 30h			;caf5
	ei			;caf6
	ld (hl),c		;caf7
	nop			;caf8
	nop			;caf9
	nop			;cafa
	ld bc,00703h		;cafb
	rrca			;cafe
	rra			;caff
	or (hl)			;cb00
	ld h,a			;cb01
	rst 0			;cb02
	adc a,a			;cb03
	rrca			;cb04
	rra			;cb05
	rra			;cb06
	ccf			;cb07
	ld a,a			;cb08
	rst 38h			;cb09
	ld a,a			;cb0a
	rst 38h			;cb0b
	rst 18h			;cb0c
	cp c			;cb0d
	ccf			;cb0e
	ccf			;cb0f
	ld a,a			;cb10
	ccf			;cb11
	ccf			;cb12
	ld a,a			;cb13
	rst 38h			;cb14
	call pe,lffffh		;cb15
	djnz lcb67h		;cb18
	xor (hl)		;cb1a
	ld e,a			;cb1b
	sbc a,087h		;cb1c
	rlca			;cb1e
	adc a,h			;cb1f
	nop			;cb20
	rlca			;cb21
	ld a,a			;cb22
	rst 38h			;cb23
	rst 38h			;cb24
	rst 38h			;cb25
	rst 28h			;cb26
	rst 38h			;cb27
	ld a,a			;cb28
	rst 38h			;cb29
	rst 38h			;cb2a
	call m,sub_bffch	;cb2b
	rst 38h			;cb2e
	rst 38h			;cb2f
	rst 38h			;cb30
	rst 30h			;cb31
	rst 38h			;cb32
	rst 38h			;cb33
	rst 28h			;cb34
	rst 28h			;cb35
	rst 8			;cb36
	rst 8			;cb37
	adc a,a			;cb38
	rra			;cb39
	rra			;cb3a
	cp a			;cb3b
	rst 38h			;cb3c
	rst 38h			;cb3d
	rst 38h			;cb3e
	call m,047ffh		;cb3f
	cp c			;cb42
	ld (hl),0bah		;cb43
	ld a,h			;cb45
	ld a,d			;cb46
	inc a			;cb47
	ccf			;cb48
	rst 38h			;cb49
	cp a			;cb4a
	rst 38h			;cb4b
	rst 38h			;cb4c
	sbc a,a			;cb4d
	rst 38h			;cb4e
	defb 0fdh,0fah,095h ;illegal sequence	;cb4f
	ld a,(bc)		;cb52
	ld bc,00000h		;cb53
	add a,b			;cb56
	ret po			;cb57
	ret m			;cb58
	defb 0fdh,09fh,0c7h ;illegal sequence	;cb59
	xor b			;cb5c
	rst 38h			;cb5d
	rst 38h			;cb5e
	rst 38h			;cb5f
	rst 38h			;cb60
	rst 38h			;cb61
	rst 38h			;cb62
	rst 30h			;cb63
	rst 38h			;cb64
	rst 38h			;cb65
	rst 38h			;cb66
lcb67h:
	rst 38h			;cb67
	ld a,(hl)		;cb68
	cp h			;cb69
	cp a			;cb6a
	rst 38h			;cb6b
	rst 38h			;cb6c
	ld d,a			;cb6d
	inc l			;cb6e
	nop			;cb6f
	rst 38h			;cb70
	xor d			;cb71
	cp (iy-001h)		;cb72
	cp 0ffh			;cb75
	ld d,a			;cb77
	xor a			;cb78
	ld d,a			;cb79
	xor (hl)		;cb7a
	ld e,(hl)		;cb7b
	xor (hl)		;cb7c
	ld e,(hl)		;cb7d
	cp (hl)			;cb7e
	ld a,a			;cb7f
	rst 38h			;cb80
	rst 38h			;cb81
	rst 18h			;cb82
	cp c			;cb83
	ld a,a			;cb84
	rst 38h			;cb85
	rst 38h			;cb86
	rst 38h			;cb87
	rst 38h			;cb88
	rst 38h			;cb89
	rst 38h			;cb8a
	rst 38h			;cb8b
	rst 38h			;cb8c
	rst 38h			;cb8d
	jp pe,l8055h		;cb8e
	ccf			;cb91
	rst 38h			;cb92
	rst 38h			;cb93
	call m,015fbh		;cb94
	ld a,(bc)		;cb97
	nop			;cb98
	add a,b			;cb99
	ld b,b			;cb9a
	and b			;cb9b
	ld d,b			;cb9c
	xor b			;cb9d
	ld a,b			;cb9e
	ret nz			;cb9f
	cp a			;cba0
	ld c,d			;cba1
	or l			;cba2
	jp pe,lfffdh		;cba3
	rst 38h			;cba6
	ld a,a			;cba7
	add a,b			;cba8
	call m,sub_76eah	;cba9
	jp m,lfaf6h		;cbac
	defb 0fdh,0ffh,0fdh ;illegal sequence	;cbaf
	rst 38h			;cbb2
	or 0fbh			;cbb3
	ld d,a			;cbb5
	xor a			;cbb6
	rra			;cbb7
	rst 38h			;cbb8
	rst 38h			;cbb9
	rst 38h			;cbba
	rlca			;cbbb
	xor a			;cbbc
	ld a,a			;cbbd
	ei			;cbbe
	ret p			;cbbf
	nop			;cbc0
	nop			;cbc1
	nop			;cbc2
	nop			;cbc3
	nop			;cbc4
	nop			;cbc5
	nop			;cbc6
	nop			;cbc7
	nop			;cbc8
	ret po			;cbc9
	ld a,h			;cbca
	xor a			;cbcb
	ld d,l			;cbcc
	xor d			;cbcd
	push af			;cbce
	rrca			;cbcf
	nop			;cbd0
	nop			;cbd1
	nop			;cbd2
	nop			;cbd3
	inc bc			;cbd4
	rlca			;cbd5
	rrca			;cbd6
	rrca			;cbd7
	ld (hl),07ah		;cbd8
	inc e			;cbda
	sub 04eh		;cbdb
	and (hl)		;cbdd
	ld l,(hl)		;cbde
	and (hl)		;cbdf
	xor 056h		;cbe0
	adc a,0deh		;cbe2
	sbc a,h			;cbe4
	dec a			;cbe5
	ld a,l			;cbe6
	di			;cbe7
	nop			;cbe8
	nop			;cbe9
	nop			;cbea
	nop			;cbeb
	nop			;cbec
	nop			;cbed
	nop			;cbee
	nop			;cbef
	nop			;cbf0
	nop			;cbf1
	nop			;cbf2
	nop			;cbf3
	add a,b			;cbf4
	ret nz			;cbf5
	ld h,b			;cbf6
	or b			;cbf7
	ret c			;cbf8
	inc a			;cbf9
	inc c			;cbfa
	and 0c2h		;cbfb
	add a,e			;cbfd
	ld bc,00001h		;cbfe
	ld c,01ch		;cc01
	ld a,b			;cc03
	ret nc			;cc04
	ld h,b			;cc05
	and c			;cc06
	ld (hl),d		;cc07
	or a			;cc08
	ld (hl),l		;cc09
	or a			;cc0a
	ld (hl),a		;cc0b
	and a			;cc0c
	ld l,(hl)		;cc0d
	xor 0deh		;cc0e
	nop			;cc10
	nop			;cc11
	nop			;cc12
	nop			;cc13
	nop			;cc14
	nop			;cc15
	nop			;cc16
	nop			;cc17
	nop			;cc18
	nop			;cc19
	nop			;cc1a
	nop			;cc1b
	nop			;cc1c
	nop			;cc1d
	nop			;cc1e
	nop			;cc1f
	nop			;cc20
	nop			;cc21
	nop			;cc22
	nop			;cc23
	nop			;cc24
	nop			;cc25
	nop			;cc26
	nop			;cc27
	nop			;cc28
	nop			;cc29
	nop			;cc2a
	nop			;cc2b
	nop			;cc2c
	nop			;cc2d
	inc c			;cc2e
	jr lcc69h		;cc2f
	ld (hl),b		;cc31
	ld (hl),l		;cc32
	ex de,hl		;cc33
	rst 10h			;cc34
	or 0eeh			;cc35
	ld e,l			;cc37
	ld e,l			;cc38
	dec (hl)		;cc39
	add hl,sp		;cc3a
	add hl,sp		;cc3b
	inc (hl)		;cc3c
	inc e			;cc3d
	ld c,007h		;cc3e
	nop			;cc40
	nop			;cc41
	nop			;cc42
	nop			;cc43
	nop			;cc44
	nop			;cc45
	nop			;cc46
	nop			;cc47
	nop			;cc48
	nop			;cc49
	nop			;cc4a
	nop			;cc4b
	nop			;cc4c
	nop			;cc4d
	nop			;cc4e
	nop			;cc4f
	nop			;cc50
	nop			;cc51
	nop			;cc52
	nop			;cc53
	nop			;cc54
	nop			;cc55
	nop			;cc56
	nop			;cc57
	nop			;cc58
	nop			;cc59
	nop			;cc5a
	nop			;cc5b
	ld bc,01e01h		;cc5c
	ld (hl),l		;cc5f
	cp 047h			;cc60
	or a			;cc62
	ld a,e			;cc63
	ld (hl),h		;cc64
	call m,sub_f1e8h	;cc65
	push de			;cc68
lcc69h:
	defb 0edh ;next byte illegal after ed	;cc69
	ex de,hl		;cc6a
	set 5,e			;cc6b
	jp 03263h		;cc6d
	nop			;cc70
	nop			;cc71
	nop			;cc72
	nop			;cc73
	nop			;cc74
	nop			;cc75
	nop			;cc76
	nop			;cc77
	nop			;cc78
	nop			;cc79
	nop			;cc7a
	nop			;cc7b
	nop			;cc7c
	nop			;cc7d
	nop			;cc7e
	nop			;cc7f
	nop			;cc80
	nop			;cc81
	nop			;cc82
	nop			;cc83
	ld bc,00303h		;cc84
	inc bc			;cc87
	rlca			;cc88
	ld h,a			;cc89
	rst 0			;cc8a
	rst 0			;cc8b
	jp 063e3h		;cc8c
	adc a,l			;cc8f
	push hl			;cc90
	ld sp,hl		;cc91
	call z,sub_6ab7h	;cc92
	ei			;cc95
	jp (hl)			;cc96
	sub 0abh		;cc97
	xor l			;cc99
	ld e,(hl)		;cc9a
	ld e,(hl)		;cc9b
	sbc a,h			;cc9c
	add a,b			;cc9d
	nop			;cc9e
	nop			;cc9f
	nop			;cca0
	nop			;cca1
	nop			;cca2
	nop			;cca3
	nop			;cca4
	nop			;cca5
	nop			;cca6
	nop			;cca7
	nop			;cca8
	nop			;cca9
	nop			;ccaa
	nop			;ccab
	nop			;ccac
	nop			;ccad
	nop			;ccae
	nop			;ccaf
	nop			;ccb0
	nop			;ccb1
	nop			;ccb2
	ret nz			;ccb3
lccb4h:
	add a,b			;ccb4
	add a,b			;ccb5
	add a,b			;ccb6
	nop			;ccb7
	djnz lccf2h		;ccb8
	cp b			;ccba
	or a			;ccbb
	xor a			;ccbc
	add a,b			;ccbd
	cp a			;ccbe
	ld e,a			;ccbf
	add a,e			;ccc0
	ld a,e			;ccc1
	ld a,c			;ccc2
	dec de			;ccc3
	jp z,lecb1h		;ccc4
	ei			;ccc7
	ld a,08fh		;ccc8
	jp 03c71h		;ccca
	rra			;cccd
	rlca			;ccce
	ld bc,00000h		;cccf
	nop			;ccd2
	nop			;ccd3
	nop			;ccd4
	nop			;ccd5
	nop			;ccd6
	nop			;ccd7
	nop			;ccd8
	nop			;ccd9
	nop			;ccda
	nop			;ccdb
	nop			;ccdc
	nop			;ccdd
sub_ccdeh:
	nop			;ccde
	nop			;ccdf
	nop			;cce0
	nop			;cce1
	inc bc			;cce2
	ld h,e			;cce3
	dec a			;cce4
	ld e,00fh		;cce5
	rlca			;cce7
	ld (hl),a		;cce8
	ei			;cce9
	dec bc			;ccea
	ex (sp),hl		;cceb
	pop af			;ccec
	pop af			;cced
	ld a,c			;ccee
	or (hl)			;ccef
	or a			;ccf0
	xor a			;ccf1
lccf2h:
	xor h			;ccf2
	ld (hl),e		;ccf3
	adc a,d			;ccf4
	ld d,h			;ccf5
	xor d			;ccf6
	ld d,l			;ccf7
	add a,e			;ccf8
	ex (sp),hl		;ccf9
	di			;ccfa
	ld sp,hl		;ccfb
	ld a,(hl)		;ccfc
	rra			;ccfd
	rst 20h			;ccfe
	ei			;ccff
lcd00h:
	nop			;cd00
	nop			;cd01
	nop			;cd02
	nop			;cd03
	nop			;cd04
	nop			;cd05
	nop			;cd06
lcd07h:
	rrca			;cd07
	rra			;cd08
	inc a			;cd09
	dec sp			;cd0a
	scf			;cd0b
	jr nz,lcd3dh		;cd0c
	rlca			;cd0e
	dec sp			;cd0f
	ld a,l			;cd10
	ld e,0eeh		;cd11
	pop af			;cd13
	rst 30h			;cd14
	inc (hl)		;cd15
	inc bc			;cd16
	ld b,087h		;cd17
	add a,a			;cd19
	jp 0cfc7h		;cd1a
	adc a,09fh		;cd1d
	ld e,(hl)		;cd1f
	defb 0ddh,03eh,0bch ;illegal sequence	;cd20
	ld a,d			;cd23
	ld a,h			;cd24
	ret m			;cd25
	call p,sub_f0f8h	;cd26
	jp (hl)			;cd29
	pop af			;cd2a
	ex de,hl		;cd2b
	rst 10h			;cd2c
	ld h,a			;cd2d
	ld b,e			;cd2e
	ld b,e			;cd2f
	nop			;cd30
	nop			;cd31
	ld bc,00f00h		;cd32
	ld a,a			;cd35
	nop			;cd36
	cp e			;cd37
	ld d,0efh		;cd38
	rst 18h			;cd3a
	rst 18h			;cd3b
	ld e,a			;cd3c
lcd3dh:
	sbc a,a			;cd3d
	rst 8			;cd3e
	ex (sp),hl		;cd3f
	pop hl			;cd40
	ld h,c			;cd41
	nop			;cd42
	nop			;cd43
	nop			;cd44
	nop			;cd45
	nop			;cd46
	add a,b			;cd47
	add a,b			;cd48
	ret po			;cd49
	sub b			;cd4a
	ret nc			;cd4b
	ld (hl),b		;cd4c
	xor b			;cd4d
	ld d,h			;cd4e
	ld a,d			;cd4f
	ld a,(hl)		;cd50
	ld a,l			;cd51
	ld a,(hl)		;cd52
	ld a,a			;cd53
	ld a,a			;cd54
	ld a,(hl)		;cd55
	ld a,a			;cd56
	cp 0fdh			;cd57
	cp 0fdh			;cd59
	or 0f8h			;cd5b
	ret p			;cd5d
	ret po			;cd5e
	nop			;cd5f
	add hl,bc		;cd60
	ld (hl),a		;cd61
	rst 28h			;cd62
	rrca			;cd63
	rst 8			;cd64
	rst 30h			;cd65
	dec sp			;cd66
	sbc a,l			;cd67
	ret po			;cd68
	ld d,b			;cd69
	xor b			;cd6a
	ret c			;cd6b
	call pe,sub_fcf4h	;cd6c
	or 0fah			;cd6f
	push af			;cd71
	ei			;cd72
	ld a,l			;cd73
	ld a,e			;cd74
	dec a			;cd75
	ccf			;cd76
	dec e			;cd77
	rra			;cd78
	dec c			;cd79
	rrca			;cd7a
	dec c			;cd7b
	ld c,00dh		;cd7c
	ld c,00fh		;cd7e
	ld b,007h		;cd80
	add a,(hl)		;cd82
	add a,a			;cd83
	ld b,(hl)		;cd84
	rst 0			;cd85
	ld b,(hl)		;cd86
	rst 0			;cd87
	add a,(hl)		;cd88
	add a,a			;cd89
	rlca			;cd8a
	rlca			;cd8b
	rlca			;cd8c
	ld c,00eh		;cd8d
	inc a			;cd8f
	rst 18h			;cd90
	and a			;cd91
	in a,(0f5h)		;cd92
	jp m,lfdfeh		;cd94
	rst 38h			;cd97
	ld a,l			;cd98
	ld e,00fh		;cd99
	rlca			;cd9b
	inc bc			;cd9c
	dec c			;cd9d
	add a,(hl)		;cd9e
	rst 0			;cd9f
	rst 20h			;cda0
	ld h,e			;cda1
	ld (hl),e		;cda2
	ld (hl),e		;cda3
	ld (hl),c		;cda4
	ld (hl),e		;cda5
	ld (hl),l		;cda6
	ld l,(hl)		;cda7
	ld e,a			;cda8
	ccf			;cda9
	ccf			;cdaa
	ccf			;cdab
	cp a			;cdac
	cp a			;cdad
	cp a			;cdae
	sbc a,a			;cdaf
	sbc a,a			;cdb0
	adc a,a			;cdb1
	add a,a			;cdb2
	add a,e			;cdb3
	push bc			;cdb4
	ld b,d			;cdb5
	pop bc			;cdb6
	ld b,d			;cdb7
	add a,c			;cdb8
	add a,c			;cdb9
	add a,c			;cdba
	nop			;cdbb
	nop			;cdbc
	ld bc,00001h		;cdbd
	cp (hl)			;cdc0
	ld (hl),l		;cdc1
	ld a,d			;cdc2
	ld a,a			;cdc3
	ld a,a			;cdc4
	ccf			;cdc5
	ccf			;cdc6
	rra			;cdc7
	rrca			;cdc8
	adc a,a			;cdc9
	add a,a			;cdca
	ld b,e			;cdcb
	jp le1e1h		;cdcc
	ld b,b			;cdcf
	sub b			;cdd0
	ret z			;cdd1
	call z,sub_eeeeh	;cdd2
	rst 28h			;cdd5
	and a			;cdd6
	ld c,a			;cdd7
	rst 30h			;cdd8
	ld d,a			;cdd9
	xor c			;cdda
	push de			;cddb
	jp pe,lfaf6h		;cddc
	defb 0fdh,0fbh,0fdh ;illegal sequence	;cddf
	ei			;cde2
	defb 0fdh,0fah,0feh ;illegal sequence	;cde3
	ld e,d			;cde6
	cp (hl)			;cde7
	ld a,(hl)		;cde8
	defb 0fdh,0fdh,0fbh ;illegal sequence	;cde9
	cp 0f0h			;cdec
	ret p			;cdee
	ret po			;cdef
	ret p			;cdf0
	ld a,h			;cdf1
	cp e			;cdf2
	ld d,a			;cdf3
	rst 0			;cdf4
	and e			;cdf5
	ex (sp),hl		;cdf6
	pop de			;cdf7
	pop af			;cdf8
	ret nc			;cdf9
	ret pe			;cdfa
	ld sp,hl		;cdfb
	jp (hl)			;cdfc
	ld sp,hl		;cdfd
	jp (hl)			;cdfe
	ei			;cdff
	ld a,e			;ce00
	ld (hl),a		;ce01
	ld (hl),02eh		;ce02
	inc l			;ce04
	inc c			;ce05
	ld a,(de)		;ce06
	ld a,(de)		;ce07
	ld a,(07536h)		;ce08
	ld l,l			;ce0b
	ld l,e			;ce0c
	ld l,e			;ce0d
	ld h,a			;ce0e
	ld h,(hl)		;ce0f
	ld l,l			;ce10
	ld c,l			;ce11
	ld e,e			;ce12
	ld e,e			;ce13
	or a			;ce14
	or a			;ce15
	ld l,a			;ce16
	ld l,a			;ce17
	rst 8			;ce18
	adc a,a			;ce19
	add a,a			;ce1a
	rlca			;ce1b
	rlca			;ce1c
	ld b,00eh		;ce1d
	inc e			;ce1f
	nop			;ce20
	nop			;ce21
	rst 8			;ce22
	or e			;ce23
	ex de,hl		;ce24
	ld sp,hl		;ce25
	ret nz			;ce26
	cp h			;ce27
	ld a,(hl)		;ce28
	ld a,a			;ce29
	cp e			;ce2a
	push bc			;ce2b
	or 08eh			;ce2c
	adc a,(hl)		;ce2e
	sbc a,l			;ce2f
	dec e			;ce30
	dec e			;ce31
	ld a,(07639h)		;ce32
	ld l,(hl)		;ce35
	ld l,a			;ce36
	ld l,a			;ce37
	rst 8			;ce38
	rst 8			;ce39
	rst 0			;ce3a
	add a,a			;ce3b
	sub a			;ce3c
	scf			;ce3d
	scf			;ce3e
	ld (hl),a		;ce3f
	ld (hl),e		;ce40
	ld a,e			;ce41
	ld (hl),e		;ce42
	ld (hl),a		;ce43
	scf			;ce44
	rla			;ce45
	rlca			;ce46
	rlca			;ce47
	ld b,006h		;ce48
	inc c			;ce4a
	inc c			;ce4b
	inc c			;ce4c
	djnz lce4fh		;ce4d
lce4fh:
	nop			;ce4f
	nop			;ce50
	nop			;ce51
	rrca			;ce52
	rst 18h			;ce53
	call pe,sub_f8f0h	;ce54
	ld a,b			;ce57
	inc a			;ce58
	dec a			;ce59
	dec e			;ce5a
	sbc a,c			;ce5b
	in a,(0d3h)		;ce5c
	out (0c6h),a		;ce5e
	call po,sub_d1a1h	;ce60
	di			;ce63
	ret pe			;ce64
	ret m			;ce65
	ld l,h			;ce66
	ld (hl),h		;ce67
	inc a			;ce68
	ld a,(l9d1eh)		;ce69
	sbc a,a			;ce6c
	xor (hl)		;ce6d
	xor a			;ce6e
	xor a			;ce6f
	or a			;ce70
	or a			;ce71
	or e			;ce72
	cp e			;ce73
	ld a,c			;ce74
	ld a,l			;ce75
	ld a,h			;ce76
	ld a,(hl)		;ce77
	ld a,01fh		;ce78
	rlca			;ce7a
	inc bc			;ce7b
	ld bc,00101h		;ce7c
	nop			;ce7f
	nop			;ce80
	nop			;ce81
	nop			;ce82
	add a,b			;ce83
	nop			;ce84
	nop			;ce85
	nop			;ce86
	nop			;ce87
	nop			;ce88
	ret nz			;ce89
	ret po			;ce8a
	add a,b			;ce8b
	nop			;ce8c
	ld c,h			;ce8d
	ld a,d			;ce8e
	ld (hl),b		;ce8f
	ret po			;ce90
	ret nz			;ce91
	out (0beh),a		;ce92
	ld a,h			;ce94
	ld a,h			;ce95
	ld a,(hl)		;ce96
	inc a			;ce97
	ld a,(00717h)		;ce98
	rlca			;ce9b
	inc bc			;ce9c
	and c			;ce9d
	or b			;ce9e
	sbc a,(hl)		;ce9f
	ld d,l			;cea0
	jp z,le6edh		;cea1
	rst 30h			;cea4
	jp p,lfafbh		;cea5
	ld a,e			;cea8
	inc sp			;cea9
	add a,(hl)		;ceaa
	call m,sub_f8f8h	;ceab
	pop hl			;ceae
	inc bc			;ceaf
	nop			;ceb0
	nop			;ceb1
	nop			;ceb2
	nop			;ceb3
	nop			;ceb4
	nop			;ceb5
	nop			;ceb6
	nop			;ceb7
	nop			;ceb8
	nop			;ceb9
	nop			;ceba
	nop			;cebb
	nop			;cebc
	nop			;cebd
	nop			;cebe
	nop			;cebf
	nop			;cec0
	nop			;cec1
	add a,b			;cec2
	nop			;cec3
	nop			;cec4
	nop			;cec5
	jr c,lcf3ch		;cec6
	ret po			;cec8
	ret nz			;cec9
	ret po			;ceca
	ret po			;cecb
	ret nz			;cecc
	sbc a,(hl)		;cecd
	dec a			;cece
	ld a,b			;cecf
	jr nc,$-122		;ced0
	ld c,h			;ced2
	rst 8			;ced3
	ld c,a			;ced4
	adc a,(hl)		;ced5
	adc a,a			;ced6
	add a,a			;ced7
	rlca			;ced8
	ld (bc),a		;ced9
	ld bc,00001h		;ceda
	dec e			;cedd
	xor (hl)		;cede
	ld (hl),a		;cedf
	nop			;cee0
	nop			;cee1
	nop			;cee2
	nop			;cee3
	nop			;cee4
	nop			;cee5
	nop			;cee6
	nop			;cee7
	nop			;cee8
	nop			;cee9
	nop			;ceea
	nop			;ceeb
	nop			;ceec
	nop			;ceed
	nop			;ceee
	nop			;ceef
	nop			;cef0
	nop			;cef1
	nop			;cef2
	nop			;cef3
	nop			;cef4
	nop			;cef5
	nop			;cef6
	nop			;cef7
	nop			;cef8
	nop			;cef9
	nop			;cefa
	nop			;cefb
	nop			;cefc
	nop			;cefd
	nop			;cefe
	nop			;ceff
lcf00h:
	nop			;cf00
	nop			;cf01
	ret po			;cf02
	add a,b			;cf03
	nop			;cf04
	nop			;cf05
	nop			;cf06
	ld c,(hl)		;cf07
	ld a,h			;cf08
	ret m			;cf09
	ld (hl),b		;cf0a
	adc a,b			;cf0b
	ld (hl),h		;cf0c
	jp m,03dfbh		;cf0d
	cp 0e7h			;cf10
	inc hl			;cf12
	call z,03af1h		;cf13
	ld a,(de)		;cf16
	sbc a,l			;cf17
	call sub_ebedh		;cf18
	pop hl			;cf1b
	ld d,d			;cf1c
	dec hl			;cf1d
	ld d,b			;cf1e
	ld (hl),a		;cf1f
	cp a			;cf20
	inc bc			;cf21
	ld a,l			;cf22
	cp 0ffh			;cf23
	rst 38h			;cf25
	ld h,a			;cf26
	ld b,a			;cf27
	rst 28h			;cf28
	rst 38h			;cf29
	rst 38h			;cf2a
	ld a,(hl)		;cf2b
	ret po			;cf2c
	rra			;cf2d
	rst 38h			;cf2e
	rst 38h			;cf2f
	cp 0bdh			;cf30
	or e			;cf32
	ld l,a			;cf33
	rla			;cf34
	ld b,(hl)		;cf35
	adc a,(hl)		;cf36
	cp (hl)			;cf37
	or a			;cf38
	cp e			;cf39
	cp a			;cf3a
	cp a			;cf3b
lcf3ch:
	ld hl,(05500h)		;cf3c
	rst 38h			;cf3f
	ld bc,lfafch		;cf40
	defb 0fdh,03bh,03dh ;illegal sequence	;cf43
	daa			;cf46
	dec de			;cf47
	ld a,e			;cf48
	ld a,e			;cf49
	dec a			;cf4a
	adc a,(hl)		;cf4b
	daa			;cf4c
	inc de			;cf4d
	ld c,c			;cf4e
	inc d			;cf4f
	ei			;cf50
	rst 20h			;cf51
	rra			;cf52
	ccf			;cf53
	ld a,a			;cf54
	ld a,l			;cf55
	ld a,h			;cf56
	ld a,b			;cf57
	jr c,lcf99h		;cf58
	rra			;cf5a
	rra			;cf5b
	call sub_e4e0h		;cf5c
	nop			;cf5f
	adc a,0eeh		;cf60
	push af			;cf62
	adc a,c			;cf63
	call c,sub_bd3ch	;cf64
	ld sp,hl		;cf67
	defb 0fdh,0fdh,0fah ;illegal sequence	;cf68
	push af			;cf6b
	ld l,e			;cf6c
	sub a			;cf6d
	ld a,(hl)		;cf6e
	nop			;cf6f
	cp 0e7h			;cf70
	inc hl			;cf72
	call z,03af1h		;cf73
	ld a,(de)		;cf76
	sbc a,l			;cf77
	call sub_ebedh		;cf78
	pop hl			;cf7b
	ld d,d			;cf7c
	dec hl			;cf7d
	ld d,b			;cf7e
	ld (hl),a		;cf7f
	rst 18h			;cf80
	inc bc			;cf81
	ld a,h			;cf82
	cp 0ffh			;cf83
	rst 38h			;cf85
	ld h,a			;cf86
	ld b,a			;cf87
	rst 28h			;cf88
	rst 38h			;cf89
	rst 38h			;cf8a
	ld a,(hl)		;cf8b
	ret po			;cf8c
	rra			;cf8d
	rst 38h			;cf8e
	rst 38h			;cf8f
	ld h,c			;cf90
	rst 20h			;cf91
	rst 28h			;cf92
	rst 18h			;cf93
	sbc a,c			;cf94
	ld e,b			;cf95
	sbc a,l			;cf96
	ccf			;cf97
	ld a,a			;cf98
lcf99h:
	ld a,a			;cf99
	ld a,l			;cf9a
	ld (hl),h		;cf9b
	ld d,b			;cf9c
	ld hl,(0007fh)		;cf9d
	xor b			;cfa0
	call nc,sub_f5fah	;cfa1
	ei			;cfa4
	defb 0fdh,0ffh,0fdh ;illegal sequence	;cfa5
	cp a			;cfa8
	rst 18h			;cfa9
	rst 38h			;cfaa
	ld (hl),a		;cfab
	ld l,0e0h		;cfac
	dec d			;cfae
	nop			;cfaf
	nop			;cfb0
	nop			;cfb1
	nop			;cfb2
	pop af			;cfb3
	jp c,l73a9h		;cfb4
	ei			;cfb7
	jp nz,03899h		;cfb8
	ld a,b			;cfbb
	ld a,l			;cfbc
	ld c,087h		;cfbd
	ld d,e			;cfbf
	nop			;cfc0
	ld a,b			;cfc1
	call nc,01dfah		;cfc2
	rst 28h			;cfc5
	or 0f8h			;cfc6
	ld a,e			;cfc8
	defb 0fdh,0ddh,09dh ;illegal sequence	;cfc9
	sub b			;cfcc
	ld c,a			;cfcd
	ccf			;cfce
	ccf			;cfcf
	nop			;cfd0
	jr c,ld041h		;cfd1
	ei			;cfd3
	push hl			;cfd4
	sbc a,0bfh		;cfd5
	ld a,a			;cfd7
	di			;cfd8
	rst 30h			;cfd9
	rst 8			;cfda
	add hl,de		;cfdb
	pop de			;cfdc
	xor e			;cfdd
	rst 10h			;cfde
sub_cfdfh:
	rst 30h			;cfdf
	nop			;cfe0
	rrca			;cfe1
	ccf			;cfe2
	ld h,e			;cfe3
	ld e,l			;cfe4
	cp (hl)			;cfe5
	dec a			;cfe6
	cp e			;cfe7
	call nz,019b1h		;cfe8
	ld sp,hl		;cfeb
	or a			;cfec
	ld l,a			;cfed
	rst 18h			;cfee
	sbc a,a			;cfef
	nop			;cff0
	ld bc,0e1c2h		;cff1
	sbc a,h			;cff4
	ld (hl),e		;cff5
	defb 0fdh,0feh,07fh ;illegal sequence	;cff6
	rra			;cff9
	ld b,c			;cffa
	ld d,d			;cffb
	rst 30h			;cffc
	rst 28h			;cffd
	rst 18h			;cffe
	cp h			;cfff
	nop			;d000
	pop hl			;d001
	inc sp			;d002
	jp nc,l6ee1h		;d003
	sbc a,e			;d006
sub_d007h:
	cp l			;d007
	ei			;d008
	ex (sp),hl		;d009
	cpl			;d00a
	ld e,e			;d00b
	out (0ebh),a		;d00c
	or 035h			;d00e
	ret po			;d010
	pop af			;d011
	dec de			;d012
	di			;d013
	ld e,h			;d014
	xor l			;d015
	rst 10h			;d016
	xor e			;d017
	ld (hl),a		;d018
	sbc a,(hl)		;d019
	ld c,h			;d01a
	jr nz,ld044h		;d01b
	rst 28h			;d01d
	rst 18h			;d01e
	xor a			;d01f
	inc e			;d020
	jp m,039c7h		;d021
	or 0fdh			;d024
	rst 38h			;d026
	ld c,l			;d027
	ld l,a			;d028
	or e			;d029
	jr nc,ld092h		;d02a
	ld c,l			;d02c
	defb 0fdh,0f1h,07bh ;illegal sequence	;d02d
	dec bc			;d030
	dec d			;d031
	cpl			;d032
	dec e			;d033
	inc l			;d034
	inc e			;d035
	ld l,03fh		;d036
	rra			;d038
	rra			;d039
	rrca			;d03a
	rlca			;d03b
	inc bc			;d03c
	nop			;d03d
	dec de			;d03e
	inc e			;d03f
ld040h:
	rrca			;d040
ld041h:
	add hl,de		;d041
	jr nc,ld082h		;d042
ld044h:
	inc e			;d044
	inc hl			;d045
	ld e,005h		;d046
	dec de			;d048
	ld b,006h		;d049
	inc bc			;d04b
	dec e			;d04c
	ld e,01ah		;d04d
	dec c			;d04f
	rrca			;d050
	dec b			;d051
	inc bc			;d052
	inc bc			;d053
	inc bc			;d054
	inc bc			;d055
	inc bc			;d056
	ld b,006h		;d057
	ld c,00eh		;d059
	inc b			;d05b
	dec de			;d05c
	rra			;d05d
	rrca			;d05e
	ld b,007h		;d05f
	ld b,003h		;d061
	inc bc			;d063
	inc bc			;d064
	inc bc			;d065
	dec b			;d066
	dec b			;d067
	dec b			;d068
	dec c			;d069
	ld a,(bc)		;d06a
	ld a,(de)		;d06b
	sub l			;d06c
	jp p,l92cdh		;d06d
	ret nz			;d070
	ret po			;d071
	ret p			;d072
	ret nc			;d073
	sub b			;d074
	sub b			;d075
	ld e,b			;d076
	cp h			;d077
	ld e,h			;d078
	cp 0feh			;d079
	jp pe,lccb4h		;d07b
	ld d,b			;d07e
	ccf			;d07f
	rst 8			;d080
	pop af			;d081
ld082h:
	ld e,0c7h		;d082
	cp c			;d084
	ld h,l			;d085
	ld a,d			;d086
	and d			;d087
	ld (hl),d		;d088
	ld l,l			;d089
	ld sp,lacbah		;d08a
	ld d,l			;d08d
	cp e			;d08e
	ld e,a			;d08f
	xor a			;d090
	adc a,a			;d091
ld092h:
	in a,(08bh)		;d092
	sub e			;d094
	dec l			;d095
	add hl,hl		;d096
	ld e,c			;d097
	ld c,b			;d098
	or b			;d099
	pop de			;d09a
	or e			;d09b
	sub c			;d09c
	ld h,b			;d09d
	jr nz,ld040h		;d09e
	ld h,b			;d0a0
	ret nz			;d0a1
	ld b,c			;d0a2
	ld b,c			;d0a3
	ld b,c			;d0a4
	add a,c			;d0a5
	add a,e			;d0a6
	add a,e			;d0a7
	add a,e			;d0a8
	jp lc6c3h		;d0a9
	and 06eh		;d0ac
	ld (hl),a		;d0ae
	ex de,hl		;d0af
	nop			;d0b0
	nop			;d0b1
	nop			;d0b2
	nop			;d0b3
	nop			;d0b4
	nop			;d0b5
	nop			;d0b6
	nop			;d0b7
	nop			;d0b8
	nop			;d0b9
	nop			;d0ba
	nop			;d0bb
	nop			;d0bc
	nop			;d0bd
	ld a,0ffh		;d0be
	ex (sp),hl		;d0c0
	nop			;d0c1
	ld bc,lff81h		;d0c2
	ld a,a			;d0c5
	sbc a,(hl)		;d0c6
	ld h,h			;d0c7
	add a,d			;d0c8
	ld bc,00000h		;d0c9
	ret po			;d0cc
	ret po			;d0cd
	ret po			;d0ce
	ret nz			;d0cf
	ret nz			;d0d0
	add a,b			;d0d1
	nop			;d0d2
	nop			;d0d3
	nop			;d0d4
	add a,b			;d0d5
	add a,b			;d0d6
	ret nz			;d0d7
sub_d0d8h:
	ret nz			;d0d8
	ret nz			;d0d9
	ret po			;d0da
	ld h,b			;d0db
	ld b,b			;d0dc
	and b			;d0dd
	ret nc			;d0de
	ret nc			;d0df
	ret nc			;d0e0
	ret nc			;d0e1
	and b			;d0e2
	and b			;d0e3
	and b			;d0e4
	and b			;d0e5
	ld d,b			;d0e6
	ld d,b			;d0e7
	ld d,b			;d0e8
	ld c,b			;d0e9
	ld l,b			;d0ea
	sub l			;d0eb
	xor e			;d0ec
	ret c			;d0ed
	and l			;d0ee
	jp p,00000h		;d0ef
	nop			;d0f2
	nop			;d0f3
	nop			;d0f4
	nop			;d0f5
	nop			;d0f6
	nop			;d0f7
	nop			;d0f8
	nop			;d0f9
	nop			;d0fa
	nop			;d0fb
	nop			;d0fc
	nop			;d0fd
	nop			;d0fe
	ret p			;d0ff
	adc a,(hl)		;d100
	ld (hl),e		;d101
	sbc a,a			;d102
	ex (sp),hl		;d103
	adc a,(hl)		;d104
	call p,05ca4h		;d105
	and h			;d108
	ld c,h			;d109
	xor h			;d10a
	ld d,h			;d10b
	ld d,h			;d10c
	inc l			;d10d
ld10eh:
	inc h			;d10e
	inc l			;d10f
	inc d			;d110
	inc c			;d111
	inc c			;d112
	inc b			;d113
	inc b			;d114
	inc b			;d115
	inc b			;d116
	inc b			;d117
	inc b			;d118
	inc b			;d119
	inc b			;d11a
	nop			;d11b
	nop			;d11c
	nop			;d11d
	nop			;d11e
	nop			;d11f
ld120h:
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
	add a,b			;d12b
	ld l,a			;d12c
	rst 8			;d12d
	jr c,$+73		;d12e
	call m,sub_fff1h	;d130
	rst 38h			;d133
	rst 38h			;d134
	rst 38h			;d135
	rst 38h			;d136
	rst 38h			;d137
	add a,c			;d138
	defb 0fdh,0aah,0f4h ;illegal sequence	;d139
	jp m,sub_fefdh		;d13c
	defb 0fdh,0feh,0ffh ;illegal sequence	;d13f
	cp 0ffh			;d142
	rst 20h			;d144
	sub b			;d145
	rst 38h			;d146
	jp pe,lfffdh		;d147
	rst 38h			;d14a
	rst 38h			;d14b
	rst 38h			;d14c
	rst 38h			;d14d
	adc a,a			;d14e
	rst 30h			;d14f
	nop			;d150
	ld d,h			;d151
	jp pe,sub_fefdh		;d152
	defb 0fdh,0feh,0ffh ;illegal sequence	;d155
	rst 38h			;d158
	rst 38h			;d159
	ret nz			;d15a
	cp a			;d15b
	or l			;d15c
	ld a,(l7e7dh)		;d15d
	ld a,a			;d160
	ld a,(hl)		;d161
	ld a,l			;d162
	ld a,(hl)		;d163
	ld a,l			;d164
	ld a,(hl)		;d165
	rlca			;d166
	jp pe,0ac54h		;d167
	call nc,sub_fcfch	;d16a
	call m,01cfch		;d16d
	rst 38h			;d170
	dec sp			;d171
	or h			;d172
	ld l,b			;d173
	ret nc			;d174
	pop hl			;d175
	jp nz,04a85h		;d176
	add hl,bc		;d179
	ld d,b			;d17a
	pop af			;d17b
	djnz ld10eh		;d17c
	djnz ld120h		;d17e
	jr nz,ld1a2h		;d180
	jr nz,ld1a4h		;d182
	jr nz,ld1a6h		;d184
	ret nz			;d186
	ld b,b			;d187
	ld b,b			;d188
	ld b,b			;d189
	add a,b			;d18a
	add a,b			;d18b
	add a,b			;d18c
	add a,b			;d18d
	add a,b			;d18e
	add a,b			;d18f
	rst 18h			;d190
	xor d			;d191
	dec a			;d192
	ld c,003h		;d193
	ld sp,hl		;d195
	cp l			;d196
	ld e,(hl)		;d197
	xor a			;d198
	ld d,a			;d199
	xor a			;d19a
	rla			;d19b
	xor e			;d19c
	rla			;d19d
	dec hl			;d19e
	dec d			;d19f
	dec bc			;d1a0
sub_d1a1h:
	dec b			;d1a1
ld1a2h:
	dec bc			;d1a2
	dec b			;d1a3
ld1a4h:
	inc bc			;d1a4
	dec b			;d1a5
ld1a6h:
	inc bc			;d1a6
	dec b			;d1a7
	inc bc			;d1a8
	dec b			;d1a9
	inc bc			;d1aa
	dec b			;d1ab
	inc bc			;d1ac
	ld bc,00103h		;d1ad
	jp m,lf9f5h		;d1b0
	ld sp,iy		;d1b3
	adc a,h			;d1b5
	di			;d1b6
	ret pe			;d1b7
	push de			;d1b8
	cp 0ffh			;d1b9
	rst 38h			;d1bb
	rst 38h			;d1bc
	rst 38h			;d1bd
	sbc a,a			;d1be
	rst 20h			;d1bf
	cp b			;d1c0
	rst 10h			;d1c1
	jp pe,lf9f5h		;d1c2
	push af			;d1c5
	defb 0fdh,0f5h,0feh ;illegal sequence	;d1c6
	rst 38h			;d1c9
	adc a,(hl)		;d1ca
	pop hl			;d1cb
	out (0ebh),a		;d1cc
	push af			;d1ce
	ld sp,hl		;d1cf
	and h			;d1d0
	jp nc,lf2eah		;d1d1
	jp m,l9a72h		;d1d4
	ld l,e			;d1d7
	inc d			;d1d8
	xor h			;d1d9
	ld c,b			;d1da
	xor h			;d1db
	ret z			;d1dc
	xor h			;d1dd
	ret z			;d1de
	xor h			;d1df
	ret pe			;d1e0
	rla			;d1e1
	ret pe			;d1e2
	call nc,sub_f4e8h	;d1e3
	ret m			;d1e6
	call m,038f8h		;d1e7
	add a,a			;d1ea
	call nc,sub_f4e8h	;d1eb
	ret m			;d1ee
	call m,sub_8080h	;d1ef
	add a,b			;d1f2
	add a,b			;d1f3
	add a,b			;d1f4
	add a,b			;d1f5
	add a,b			;d1f6
	add a,b			;d1f7
	add a,b			;d1f8
	add a,b			;d1f9
	add a,b			;d1fa
	add a,b			;d1fb
	add a,b			;d1fc
	add a,b			;d1fd
	add a,b			;d1fe
	add a,b			;d1ff
ld200h:
	add a,b			;d200
	add a,b			;d201
	add a,b			;d202
	add a,b			;d203
	add a,b			;d204
	add a,b			;d205
	add a,b			;d206
	add a,b			;d207
	add a,b			;d208
	add a,b			;d209
	add a,b			;d20a
	add a,b			;d20b
	add a,b			;d20c
	add a,b			;d20d
	add a,b			;d20e
	add a,b			;d20f
	nop			;d210
	nop			;d211
	nop			;d212
	nop			;d213
	nop			;d214
	nop			;d215
	nop			;d216
	nop			;d217
ld218h:
	rst 38h			;d218
	rst 38h			;d219
	rst 38h			;d21a
	rst 38h			;d21b
	rst 38h			;d21c
	rst 38h			;d21d
	rst 38h			;d21e
	rst 38h			;d21f
	nop			;d220
ld221h:
	nop			;d221
	nop			;d222
ld223h:
	nop			;d223
ld224h:
	nop			;d224
	nop			;d225
	nop			;d226
	nop			;d227
	nop			;d228
	nop			;d229
	ld bc,00001h		;d22a
	dec sp			;d22d
	jp nc,00000h		;d22e
	nop			;d231
	nop			;d232
	nop			;d233
	nop			;d234
	nop			;d235
	ld bc,00001h		;d236
	ld b,b			;d239
	push de			;d23a
	ex af,af'		;d23b
	ld b,000h		;d23c
	ccf			;d23e
	push de			;d23f
	rst 38h			;d240
	nop			;d241
	ret m			;d242
	nop			;d243
	rst 38h			;d244
	nop			;d245
	pop hl			;d246
	nop			;d247
	rst 38h			;d248
	nop			;d249
	rst 38h			;d24a
	nop			;d24b
	rst 38h			;d24c
	nop			;d24d
	ret p			;d24e
	rlca			;d24f
	ld a,a			;d250
	nop			;d251
	ret nz			;d252
	ld e,0ffh		;d253
	nop			;d255
	rst 38h			;d256
	nop			;d257
	rst 38h			;d258
	nop			;d259
	ret po			;d25a
	inc c			;d25b
	ccf			;d25c
	add a,b			;d25d
	add a,b			;d25e
	ld sp,0007fh		;d25f
	rst 38h			;d262
	nop			;d263
	rst 38h			;d264
	nop			;d265
	pop hl			;d266
	inc c			;d267
	ld a,a			;d268
	nop			;d269
	ld c,060h		;d26a
	rst 38h			;d26c
	nop			;d26d
	rst 38h			;d26e
	nop			;d26f
ld270h:
	cp 000h			;d270
	ret p			;d272
	ld b,0ffh		;d273
	nop			;d275
	add a,l			;d276
	jr nc,$+1		;d277
	nop			;d279
	ld a,a			;d27a
	nop			;d27b
	cp h			;d27c
	ld bc,00670h		;d27d
	sbc a,a			;d280
	nop			;d281
	nop			;d282
	ld (hl),d		;d283
	cp 000h			;d284
	ccf			;d286
	add a,b			;d287
	jr ld2cch		;d288
	ret po			;d28a
	inc c			;d28b
	inc c			;d28c
	ld h,b			;d28d
	inc c			;d28e
	pop hl			;d28f
	ld a,h			;d290
	ld bc,0007fh		;d291
	nop			;d294
	ld h,(hl)		;d295
	ret nz			;d296
	jr ld2b1h		;d297
	jp l811ch		;d299
	jr c,ld221h		;d29c
	ld a,a			;d29e
	nop			;d29f
	add a,b			;d2a0
	inc l			;d2a1
	nop			;d2a2
	add hl,de		;d2a3
	nop			;d2a4
	add a,a			;d2a5
	ld d,000h		;d2a6
	djnz ld270h		;d2a8
	rst 38h			;d2aa
	nop			;d2ab
	nop			;d2ac
	ld a,h			;d2ad
	nop			;d2ae
	ex de,hl		;d2af
	nop			;d2b0
ld2b1h:
	dec sp			;d2b1
	ld (bc),a		;d2b2
	xor b			;d2b3
	nop			;d2b4
	xor 0ffh		;d2b5
	nop			;d2b7
	add a,b			;d2b8
	dec e			;d2b9
	nop			;d2ba
	or 000h			;d2bb
	call m,sub_7500h	;d2bd
	nop			;d2c0
	inc d			;d2c1
	rst 38h			;d2c2
	nop			;d2c3
	ret po			;d2c4
	inc bc			;d2c5
	nop			;d2c6
	defb 0edh ;next byte illegal after ed	;d2c7
	nop			;d2c8
	add a,e			;d2c9
	nop			;d2ca
	sbc a,e			;d2cb
ld2cch:
	nop			;d2cc
	rst 38h			;d2cd
	ld a,a			;d2ce
	nop			;d2cf
	ret nz			;d2d0
	inc e			;d2d1
	nop			;d2d2
	call c,07f00h		;d2d3
	nop			;d2d6
	rst 0			;d2d7
	nop			;d2d8
	call pe,l803fh		;d2d9
	add a,b			;d2dc
	daa			;d2dd
	nop			;d2de
	dec e			;d2df
	nop			;d2e0
	ret m			;d2e1
	nop			;d2e2
	cpl			;d2e3
	inc bc			;d2e4
	ret nc			;d2e5
	ld a,a			;d2e6
	nop			;d2e7
	nop			;d2e8
	ld e,c			;d2e9
	nop			;d2ea
	in a,(000h)		;d2eb
	rst 20h			;d2ed
	nop			;d2ee
	adc a,a			;d2ef
	inc bc			;d2f0
	xor b			;d2f1
	rst 38h			;d2f2
	nop			;d2f3
	add a,b			;d2f4
	ld a,(lfb00h)		;d2f5
	nop			;d2f8
	dec e			;d2f9
	nop			;d2fa
	ld h,a			;d2fb
	ld bc,lff34h		;d2fc
	nop			;d2ff
	nop			;d300
	ld a,e			;d301
	nop			;d302
	jr c,ld305h		;d303
ld305h:
	cp a			;d305
	nop			;d306
	sub 001h		;d307
	or h			;d309
	rst 38h			;d30a
	nop			;d30b
	nop			;d30c
	ld a,e			;d30d
	nop			;d30e
	ld (hl),a		;d30f
	nop			;d310
	cp a			;d311
	nop			;d312
	pop af			;d313
	ld bc,lffbch		;d314
	nop			;d317
	nop			;d318
	ld (hl),c		;d319
	nop			;d31a
	ld (hl),a		;d31b
	nop			;d31c
	rra			;d31d
	nop			;d31e
	jp pe,ldc01h		;d31f
	rst 38h			;d322
	nop			;d323
	nop			;d324
	ld a,d			;d325
	nop			;d326
	ld (hl),e		;d327
	nop			;d328
	cp a			;d329
	nop			;d32a
	in a,(000h)		;d32b
	ld a,(de)		;d32d
	rst 38h			;d32e
	nop			;d32f
	nop			;d330
	ld a,c			;d331
	nop			;d332
	call m,sub_bf00h	;d333
	nop			;d336
	jp pe,01ac0h		;d337
	rst 38h			;d33a
	nop			;d33b
	nop			;d33c
	ld (hl),e		;d33d
	nop			;d33e
	rrca			;d33f
	nop			;d340
	ccf			;d341
	nop			;d342
	ld d,d			;d343
	ret nz			;d344
	ld a,(de)		;d345
	rst 38h			;d346
	nop			;d347
	add a,b			;d348
	ld l,000h		;d349
	out (000h),a		;d34b
	jp le600h		;d34d
	ret nz			;d350
	ld a,(de)		;d351
	rst 38h			;d352
	nop			;d353
	add a,b			;d354
	dec e			;d355
	nop			;d356
	call c,sub_fc00h	;d357
	nop			;d35a
	ld a,(bc)		;d35b
	ret po			;d35c
	dec c			;d35d
	ld a,a			;d35e
	nop			;d35f
	nop			;d360
	ld (hl),d		;d361
	nop			;d362
	in a,(000h)		;d363
	add hl,sp		;d365
	ld bc,le0f4h		;d366
	dec c			;d369
	ld a,a			;d36a
	nop			;d36b
	add a,b			;d36c
	ld c,000h		;d36d
	in a,(000h)		;d36f
	jp sub_ec01h		;d371
	ret po			;d374
	dec c			;d375
	ld a,a			;d376
	nop			;d377
	ret p			;d378
	ld b,000h		;d379
	in a,(000h)		;d37b
	sbc a,a			;d37d
	ld bc,le0f4h		;d37e
	dec c			;d381
	ld a,a			;d382
	nop			;d383
	ret p			;d384
	ld b,000h		;d385
	ld d,c			;d387
	nop			;d388
	ccf			;d389
	inc bc			;d38a
	ret m			;d38b
	ret po			;d38c
	rrca			;d38d
	ld a,a			;d38e
	nop			;d38f
	ret m			;d390
	ld (bc),a		;d391
	nop			;d392
	ld c,b			;d393
	nop			;d394
	ld a,a			;d395
	inc bc			;d396
	ret pe			;d397
	ret po			;d398
	rrca			;d399
	ld a,a			;d39a
	nop			;d39b
	ret p			;d39c
	dec b			;d39d
	djnz ld3c3h		;d39e
	nop			;d3a0
	rst 38h			;d3a1
	rlca			;d3a2
	ret nc			;d3a3
	ret nz			;d3a4
	inc c			;d3a5
	ld a,a			;d3a6
	nop			;d3a7
	ret p			;d3a8
	ld b,0dch		;d3a9
	ld bc,sub_feffh+1	;d3ab
	rrca			;d3ae
	ld h,b			;d3af
	add a,b			;d3b0
	inc sp			;d3b1
	ccf			;d3b2
	add a,b			;d3b3
	ret p			;d3b4
	rlca			;d3b5
	ld a,(hl)		;d3b6
	nop			;d3b7
	nop			;d3b8
	cp 01fh			;d3b9
	add a,b			;d3bb
	nop			;d3bc
	ld a,(hl)		;d3bd
	ccf			;d3be
	add a,b			;d3bf
	ret po			;d3c0
	dec bc			;d3c1
	ld a,a			;d3c2
ld3c3h:
	nop			;d3c3
	nop			;d3c4
	ld a,h			;d3c5
	rra			;d3c6
	ld b,b			;d3c7
	nop			;d3c8
	ld a,l			;d3c9
ld3cah:
	ccf			;d3ca
	add a,b			;d3cb
	ret nz			;d3cc
	dec de			;d3cd
	ld a,a			;d3ce
ld3cfh:
	nop			;d3cf
	add a,b			;d3d0
	ld (bc),a		;d3d1
	rra			;d3d2
	ret nz			;d3d3
	nop			;d3d4
	ld a,a			;d3d5
	rra			;d3d6
	ld b,b			;d3d7
	ret nz			;d3d8
	inc e			;d3d9
	ccf			;d3da
	add a,b			;d3db
	add a,b			;d3dc
	ccf			;d3dd
	rra			;d3de
	ld b,b			;d3df
	nop			;d3e0
	ld a,a			;d3e1
	rra			;d3e2
	ret nz			;d3e3
	add a,b			;d3e4
	dec a			;d3e5
	ccf			;d3e6
	add a,b			;d3e7
	nop			;d3e8
	ccf			;d3e9
	rrca			;d3ea
	add a,b			;d3eb
	nop			;d3ec
	ld a,a			;d3ed
	rrca			;d3ee
	and b			;d3ef
	add a,b			;d3f0
	ld a,03eh		;d3f1
	add a,b			;d3f3
	nop			;d3f4
	sbc a,006h		;d3f5
	or b			;d3f7
	nop			;d3f8
	rst 38h			;d3f9
	rrca			;d3fa
	ld h,b			;d3fb
	add a,b			;d3fc
	ccf			;d3fd
	inc e			;d3fe
	ld b,c			;d3ff
	nop			;d400
	rst 28h			;d401
	ld (bc),a		;d402
	jr ld405h		;d403
ld405h:
	rst 38h			;d405
	rrca			;d406
	and b			;d407
	nop			;d408
	ld a,(hl)		;d409
	jr ld3cfh		;d40a
	nop			;d40c
	ret p			;d40d
	ld (bc),a		;d40e
	ld l,b			;d40f
	nop			;d410
	rst 38h			;d411
	rrca			;d412
	ret po			;d413
	nop			;d414
	ld a,a			;d415
	jr ld45bh		;d416
	nop			;d418
	sbc a,a			;d419
	nop			;d41a
	cp c			;d41b
	nop			;d41c
	rst 38h			;d41d
	rrca			;d41e
	and b			;d41f
	nop			;d420
	ld a,(hl)		;d421
	inc a			;d422
	pop bc			;d423
	nop			;d424
	ld l,a			;d425
	nop			;d426
	ld d,c			;d427
	nop			;d428
	rst 38h			;d429
	rra			;d42a
	ret nz			;d42b
	nop			;d42c
	ld a,a			;d42d
	ld a,040h		;d42e
	nop			;d430
	xor 000h		;d431
	ex (sp),hl		;d433
	nop			;d434
	rst 38h			;d435
	rra			;d436
	ret nz			;d437
	nop			;d438
	ld a,a			;d439
	inc a			;d43a
	pop bc			;d43b
	nop			;d43c
	rst 18h			;d43d
	nop			;d43e
	ld (hl),e		;d43f
	nop			;d440
	rst 38h			;d441
	rra			;d442
	ret nz			;d443
	nop			;d444
	ld a,(hl)		;d445
	ld a,b			;d446
	add a,e			;d447
	jr nz,ld3cah		;d448
	add a,b			;d44a
	dec sp			;d44b
	nop			;d44c
	rst 38h			;d44d
	rra			;d44e
	ret nz			;d44f
	nop			;d450
	ld (hl),c		;d451
	djnz ld4bbh		;d452
	ld a,a			;d454
	nop			;d455
	ret nz			;d456
	inc de			;d457
	nop			;d458
	rst 38h			;d459
	rra			;d45a
ld45bh:
	ld b,b			;d45b
	nop			;d45c
	ld l,l			;d45d
	nop			;d45e
	halt			;d45f
	rst 38h			;d460
	nop			;d461
	ret po			;d462
	inc c			;d463
	nop			;d464
	rst 38h			;d465
	ccf			;d466
	add a,b			;d467
	nop			;d468
	ld l,l			;d469
	ld bc,lffb4h		;d46a
	nop			;d46d
	ret nz			;d46e
	dec e			;d46f
	nop			;d470
	ccf			;d471
	ccf			;d472
	add a,b			;d473
	nop			;d474
	ld d,l			;d475
	inc bc			;d476
	ret c			;d477
	rst 38h			;d478
	nop			;d479
	add a,b			;d47a
	inc sp			;d47b
	nop			;d47c
	adc a,03fh		;d47d
	add a,b			;d47f
	add a,b			;d480
	ld (hl),003h		;d481
	ret c			;d483
	rst 38h			;d484
	nop			;d485
	add a,b			;d486
	daa			;d487
	nop			;d488
	ld l,a			;d489
	ld a,a			;d48a
	nop			;d48b
	add a,b			;d48c
	ld (hl),003h		;d48d
	ret pe			;d48f
	rst 38h			;d490
	nop			;d491
	nop			;d492
	ld c,(hl)		;d493
	nop			;d494
	defb 0edh ;next byte illegal after ed	;d495
	ld a,a			;d496
	nop			;d497
	ret nz			;d498
	dec de			;d499
	rlca			;d49a
	ld (hl),b		;d49b
	rst 38h			;d49c
	nop			;d49d
	nop			;d49e
	ld a,l			;d49f
	nop			;d4a0
	sub 0ffh		;d4a1
	nop			;d4a3
	ret nz			;d4a4
	dec de			;d4a5
	inc bc			;d4a6
	sbc a,b			;d4a7
	rst 38h			;d4a8
	nop			;d4a9
	add a,b			;d4aa
	inc de			;d4ab
	nop			;d4ac
	or (hl)			;d4ad
	rst 38h			;d4ae
	nop			;d4af
	ret po			;d4b0
	add hl,bc		;d4b1
	rlca			;d4b2
	ret nz			;d4b3
	rst 38h			;d4b4
	nop			;d4b5
	add a,b			;d4b6
	ld l,001h		;d4b7
	ld (hl),h		;d4b9
	rst 38h			;d4ba
ld4bbh:
	nop			;d4bb
	ret po			;d4bc
	ld c,00fh		;d4bd
	ld h,b			;d4bf
	rst 38h			;d4c0
	nop			;d4c1
	ret nz			;d4c2
	add hl,de		;d4c3
	inc bc			;d4c4
	ret po			;d4c5
	rst 38h			;d4c6
	nop			;d4c7
	ret p			;d4c8
	rlca			;d4c9
	rlca			;d4ca
	djnz $+1		;d4cb
	nop			;d4cd
	ret po			;d4ce
	rlca			;d4cf
	rra			;d4d0
	add a,b			;d4d1
	rst 38h			;d4d2
	nop			;d4d3
	ret m			;d4d4
	nop			;d4d5
	add a,e			;d4d6
	jr c,$+1		;d4d7
	nop			;d4d9
	ret m			;d4da
	nop			;d4db
	ld a,a			;d4dc
	nop			;d4dd
	rst 38h			;d4de
	nop			;d4df
	rst 38h			;d4e0
	nop			;d4e1
	pop bc			;d4e2
	jr $+1			;d4e3
	nop			;d4e5
	ret po			;d4e6
	rlca			;d4e7
	ld a,a			;d4e8
	nop			;d4e9
	rst 38h			;d4ea
	nop			;d4eb
	rst 38h			;d4ec
	nop			;d4ed
	ret nz			;d4ee
	ld a,(de)		;d4ef
	rst 38h			;d4f0
	nop			;d4f1
	ret nz			;d4f2
	rla			;d4f3
	rra			;d4f4
	nop			;d4f5
	rst 38h			;d4f6
	nop			;d4f7
	rst 38h			;d4f8
	nop			;d4f9
	add a,b			;d4fa
	dec l			;d4fb
	ld a,a			;d4fc
	nop			;d4fd
	ret nz			;d4fe
	ld d,00fh		;d4ff
	ret po			;d501
	rst 38h			;d502
	nop			;d503
	rst 38h			;d504
	nop			;d505
	add a,b			;d506
	inc l			;d507
	ccf			;d508
	add a,b			;d509
	ret nz			;d50a
	add hl,de		;d50b
	rlca			;d50c
	ld d,b			;d50d
	rst 38h			;d50e
	nop			;d50f
	rst 38h			;d510
	nop			;d511
	nop			;d512
	ld l,d			;d513
	rra			;d514
	ret nz			;d515
	add a,b			;d516
	ccf			;d517
	rlca			;d518
	or b			;d519
	rst 38h			;d51a
	nop			;d51b
	rst 38h			;d51c
	nop			;d51d
	nop			;d51e
	ld (hl),a		;d51f
	rra			;d520
	ld b,b			;d521
	add a,b			;d522
	ccf			;d523
	rlca			;d524
	ret nc			;d525
	rst 38h			;d526
	nop			;d527
	rst 38h			;d528
	nop			;d529
	nop			;d52a
	ld a,a			;d52b
	rrca			;d52c
	and b			;d52d
	add a,b			;d52e
	ccf			;d52f
	inc bc			;d530
	ret pe			;d531
	rst 38h			;d532
	nop			;d533
	cp 000h			;d534
	nop			;d536
	rst 38h			;d537
	rrca			;d538
	ret po			;d539
	nop			;d53a
	ld a,a			;d53b
	inc bc			;d53c
	ret c			;d53d
	rst 38h			;d53e
	nop			;d53f
	ld (bc),a		;d540
	ld b,000h		;d541
	inc b			;d543
	sub 0feh		;d544
	nop			;d546
	nop			;d547
	rst 38h			;d548
	rlca			;d549
	ret nc			;d54a
	nop			;d54b
	ld a,a			;d54c
	inc bc			;d54d
	ret pe			;d54e
	rst 38h			;d54f
	nop			;d550
	cp 000h			;d551
	nop			;d553
	rst 38h			;d554
	rlca			;d555
	ret p			;d556
	nop			;d557
	ld a,a			;d558
	ld bc,0fff4h		;d559
	nop			;d55c
	rst 38h			;d55d
	nop			;d55e
	nop			;d55f
	ld a,a			;d560
	ld b,0d0h		;d561
	nop			;d563
	rst 38h			;d564
	ld bc,lffech		;d565
	nop			;d568
	rst 38h			;d569
sub_d56ah:
	nop			;d56a
	nop			;d56b
	ld a,a			;d56c
	ld (bc),a		;d56d
	ret pe			;d56e
	nop			;d56f
	rst 38h			;d570
	ld bc,0fff4h		;d571
	nop			;d574
	rst 38h			;d575
	nop			;d576
	nop			;d577
	ld a,a			;d578
	ld (bc),a		;d579
	ret c			;d57a
	nop			;d57b
	rst 38h			;d57c
	ld bc,lfffch		;d57d
	nop			;d580
	rst 38h			;d581
	nop			;d582
	nop			;d583
	ccf			;d584
	nop			;d585
	jp (hl)			;d586
	nop			;d587
	rst 38h			;d588
	ld bc,0fff4h		;d589
	nop			;d58c
	ret p			;d58d
	nop			;d58e
	nop			;d58f
	rst 38h			;d590
	nop			;d591
	ld sp,hl		;d592
	nop			;d593
	rst 38h			;d594
	ld bc,lffech		;d595
	nop			;d598
	ret po			;d599
	rrca			;d59a
	nop			;d59b
	rst 38h			;d59c
	nop			;d59d
	push af			;d59e
	nop			;d59f
	rst 38h			;d5a0
	ld bc,lffd4h		;d5a1
	nop			;d5a4
	ret nz			;d5a5
	rra			;d5a6
	nop			;d5a7
	rst 38h			;d5a8
	nop			;d5a9
	defb 0edh ;next byte illegal after ed	;d5aa
ld5abh:
	nop			;d5ab
	rst 38h			;d5ac
	ld bc,lffach		;d5ad
	nop			;d5b0
	add a,b			;d5b1
	ccf			;d5b2
	nop			;d5b3
	rst 38h			;d5b4
	nop			;d5b5
	push af			;d5b6
	nop			;d5b7
	and 001h		;d5b8
	ld (hl),h		;d5ba
	rst 38h			;d5bb
	nop			;d5bc
	add a,b			;d5bd
	dec l			;d5be
	nop			;d5bf
	rst 38h			;d5c0
	nop			;d5c1
	defb 0edh ;next byte illegal after ed	;d5c2
	nop			;d5c3
	exx			;d5c4
	ld bc,lff9ch		;d5c5
	nop			;d5c8
	add a,b			;d5c9
	ld (de),a		;d5ca
	nop			;d5cb
	rst 8			;d5cc
	nop			;d5cd
	push de			;d5ce
	nop			;d5cf
	cp e			;d5d0
	ld bc,lffach		;d5d1
	nop			;d5d4
	nop			;d5d5
	ld c,(hl)		;d5d6
	nop			;d5d7
	scf			;d5d8
	nop			;d5d9
	xor c			;d5da
	nop			;d5db
	cp e			;d5dc
	ld bc,lffb4h		;d5dd
	nop			;d5e0
	nop			;d5e1
	ld e,l			;d5e2
	nop			;d5e3
	push af			;d5e4
	ld b,070h		;d5e5
	nop			;d5e7
	cp e			;d5e8
	ld bc,lffb4h		;d5e9
	nop			;d5ec
	nop			;d5ed
	ld e,e			;d5ee
	nop			;d5ef
	rst 28h			;d5f0
	rrca			;d5f1
	add a,b			;d5f2
	inc b			;d5f3
	ld de,01043h		;d5f4
	rst 38h			;d5f7
	nop			;d5f8
	add a,h			;d5f9
	nop			;d5fa
	djnz ld5fdh		;d5fb
ld5fdh:
	ld a,a			;d5fd
	nop			;d5fe
	xor 000h		;d5ff
	rst 28h			;d601
	nop			;d602
	rst 38h			;d603
	nop			;d604
	nop			;d605
sub_d606h:
	ld hl,le52eh		;d606
	ld de,05082h		;d609
	call sub_d630h		;d60c
	ld a,000h		;d60f
	ld (ld652h),a		;d611
	ld hl,05082h		;d614
	ld (ld653h),hl		;d617
	ret			;d61a
sub_d61bh:
	ld hl,le576h		;d61b
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
	ld a,(de)		;d6d8
	inc b			;d6d9
	nop			;d6da
	nop			;d6db
	inc b			;d6dc
	inc bc			;d6dd
	ld (bc),a		;d6de
	ex af,af'		;d6df
	nop			;d6e0
	inc b			;d6e1
	ld (bc),a		;d6e2
	ld c,000h		;d6e3
	dec b			;d6e5
	inc bc			;d6e6
	ld (de),a		;d6e7
	nop			;d6e8
	inc bc			;d6e9
	nop			;d6ea
	inc d			;d6eb
	inc b			;d6ec
	ld (00805h),a		;d6ed
	add a,d			;d6f0
	ld b,001h		;d6f1
	inc c			;d6f3
	rlca			;d6f4
	ld b,000h		;d6f5
	ld (bc),a		;d6f7
	ld bc,03208h		;d6f8
	add hl,bc		;d6fb
	nop			;d6fc
	ld (bc),a		;d6fd
	add hl,bc		;d6fe
	jr nz,ld709h		;d6ff
	ex af,af'		;d701
	nop			;d702
	ld a,(bc)		;d703
	ld bc,00908h		;d704
	rlca			;d707
	ld a,(bc)		;d708
ld709h:
	ex af,af'		;d709
	ld a,(bc)		;d70a
	ld c,000h		;d70b
	ld (bc),a		;d70d
	ld bc,00b04h		;d70e
	ld c,00eh		;d711
	ld bc,00e0ah		;d713
	inc c			;d716
	nop			;d717
	ld a,(bc)		;d718
	ld c,012h		;d719
	ld (bc),a		;d71b
	ld bc,03204h		;d71c
	ld c,00eh		;d71f
	ld bc,00900h		;d721
	inc bc			;d724
	nop			;d725
	ld (00012h),a		;d726
	ld (bc),a		;d729
	ld bc,00c20h		;d72a
	ld de,0000dh		;d72d
	rrca			;d730
	ld bc,00815h		;d731
	ld de,01807h		;d734
	ld a,(bc)		;d737
	inc b			;d738
	ld bc,0100dh		;d739
	dec de			;d73c
	nop			;d73d
	dec d			;d73e
	ld (de),a		;d73f
	inc de			;d740
	add a,c			;d741
	rlca			;d742
	dec d			;d743
	ld de,l8202h		;d744
	rlca			;d747
	ld bc,01504h		;d748
	djnz ld762h		;d74b
	add a,c			;d74d
	rlca			;d74e
	ld c,00ah		;d74f
	rrca			;d751
	ex af,af'		;d752
	ld sp,01b01h		;d753
	sub d			;d756
	ld b,002h		;d757
	ld (bc),a		;d759
	jr nz,ld75fh		;d75a
	nop			;d75c
	nop			;d75d
	inc b			;d75e
ld75fh:
	inc bc			;d75f
	inc bc			;d760
	inc c			;d761
ld762h:
	nop			;d762
	inc b			;d763
	inc bc			;d764
	ld (de),a		;d765
	nop			;d766
	dec b			;d767
	inc b			;d768
	ld d,000h		;d769
	inc b			;d76b
	nop			;d76c
	jr ld773h		;d76d
	rlca			;d76f
	ld b,000h		;d770
	ld (bc),a		;d772
ld773h:
	ld bc,03208h		;d773
	add hl,bc		;d776
	nop			;d777
	ld (bc),a		;d778
	ld a,(bc)		;d779
	jr nz,ld784h		;d77a
	ex af,af'		;d77c
	nop			;d77d
	ld a,(bc)		;d77e
	ld bc,00908h		;d77f
	rlca			;d782
	ex af,af'		;d783
ld784h:
	ex af,af'		;d784
	dec bc			;d785
	ld c,000h		;d786
	nop			;d788
	ld a,(bc)		;d789
	rrca			;d78a
	ld (bc),a		;d78b
	ld (bc),a		;d78c
	ld bc,00b04h		;d78d
	ld c,010h		;d790
	ld bc,00f0ah		;d792
	ld c,000h		;d795
	ld a,(bc)		;d797
	ld c,014h		;d798
	ld bc,00e0bh		;d79a
	inc e			;d79d
	nop			;d79e
	ld a,(bc)		;d79f
	rrca			;d7a0
	ld e,000h		;d7a1
	ld (0100eh),a		;d7a3
	ld bc,0110dh		;d7a6
	ld d,000h		;d7a9
	ld d,007h		;d7ab
	rlca			;d7ad
	ld a,(bc)		;d7ae
	inc bc			;d7af
	ld bc,00716h		;d7b0
	ld b,00ah		;d7b3
	inc bc			;d7b5
	ld bc,00732h		;d7b6
	rlca			;d7b9
	add a,d			;d7ba
	ld b,e			;d7bb
	add hl,bc		;d7bc
	ld bc,00518h		;d7bd
	ld b,008h		;d7c0
	dec d			;d7c2
	ld a,(bc)		;d7c3
	rlca			;d7c4
	add a,d			;d7c5
	ld b,e			;d7c6
	inc bc			;d7c7
	ld bc,01115h		;d7c8
	inc bc			;d7cb
	add a,d			;d7cc
	rlca			;d7cd
	ld bc,01505h		;d7ce
	ld (de),a		;d7d1
	dec c			;d7d2
	add a,e			;d7d3
	rlca			;d7d4
	ld bc,01002h		;d7d5
	dec c			;d7d8
	dec d			;d7d9
	ex af,af'		;d7da
	rrca			;d7db
	ex af,af'		;d7dc
	inc de			;d7dd
	ex af,af'		;d7de
	ld (bc),a		;d7df
	nop			;d7e0
	ld de,03100h		;d7e1
	ex af,af'		;d7e4
	ld a,(de)		;d7e5
	sub d			;d7e6
	rlca			;d7e7
	ld (bc),a		;d7e8
	ld bc,00d31h		;d7e9
	inc d			;d7ec
	sub b			;d7ed
	rlca			;d7ee
	ld sp,0130ah		;d7ef
	sub b			;d7f2
	rlca			;d7f3
	add hl,bc		;d7f4
	inc c			;d7f5
	dec bc			;d7f6
	ex af,af'		;d7f7
	dec e			;d7f8
	inc bc			;d7f9
	inc bc			;d7fa
	nop			;d7fb
sub_d7fch:
	nop			;d7fc
	dec b			;d7fd
	inc b			;d7fe
	ld b,000h		;d7ff
	inc b			;d801
	nop			;d802
sub_d803h:
	ex af,af'		;d803
	inc b			;d804
	inc bc			;d805
	nop			;d806
	djnz ld80dh		;d807
	inc b			;d809
	ld (bc),a		;d80a
	inc e			;d80b
	nop			;d80c
ld80dh:
	rlca			;d80d
	ld b,000h		;d80e
ld810h:
	ld (bc),a		;d810
	ld bc,00808h		;d811
	ex af,af'		;d814
	nop			;d815
	ld a,(bc)		;d816
	ld bc,01a08h		;d817
	dec b			;d81a
	inc c			;d81b
	nop			;d81c
	ld (00009h),a		;d81d
	ld (bc),a		;d820
	ld a,(bc)		;d821
	jr nz,ld856h		;d822
	dec b			;d824
	inc e			;d825
	add a,d			;d826
	ld b,001h		;d827
	inc b			;d829
	ld a,(bc)		;d82a
	rrca			;d82b
	nop			;d82c
	ld (bc),a		;d82d
	ld bc,00b05h		;d82e
	ld c,012h		;d831
	ld bc,00f0ah		;d833
	djnz ld838h		;d836
ld838h:
	ld (0120eh),a		;d838
	ld (bc),a		;d83b
	ld bc,00a02h		;d83c
	ld c,016h		;d83f
	ld (bc),a		;d841
	ld bc,00a02h		;d842
	ld c,01ch		;d845
	nop			;d847
	ld d,000h		;d848
	ld (de),a		;d84a
	ld a,(bc)		;d84b
	dec b			;d84c
	ld bc,00d16h		;d84d
	ld (de),a		;d850
	ex af,af'		;d851
	dec de			;d852
	dec c			;d853
	dec b			;d854
	nop			;d855
ld856h:
	ld c,00ah		;d856
	dec c			;d858
	ex af,af'		;d859
	dec de			;d85a
	inc c			;d85b
	inc d			;d85c
	nop			;d85d
	inc de			;d85e
	nop			;d85f
	ld c,002h		;d860
	ld bc,01205h		;d862
	nop			;d865
	dec bc			;d866
	nop			;d867
	inc d			;d868
	ld (bc),a		;d869
	inc c			;d86a
	ld (bc),a		;d86b
	ld bc,03105h		;d86c
	ld (bc),a		;d86f
	inc c			;d870
	sub b			;d871
	ld b,031h		;d872
	dec b			;d874
	inc c			;d875
	sub d			;d876
	ld b,002h		;d877
	ld bc,00531h		;d879
	djnz ld810h		;d87c
	ld b,002h		;d87e
	ld (bc),a		;d880
	dec c			;d881
	djnz ld89eh		;d882
	nop			;d884
	inc c			;d885
	ld de,00009h		;d886
	inc hl			;d889
	inc bc			;d88a
	nop			;d88b
	nop			;d88c
	inc b			;d88d
	inc b			;d88e
	inc bc			;d88f
	inc c			;d890
	nop			;d891
	inc bc			;d892
	inc bc			;d893
	djnz ld896h		;d894
ld896h:
	dec b			;d896
	inc b			;d897
	ld d,000h		;d898
	inc bc			;d89a
	ld (bc),a		;d89b
	rla			;d89c
	nop			;d89d
ld89eh:
	inc b			;d89e
	ld (bc),a		;d89f
	inc e			;d8a0
	nop			;d8a1
	ld (01805h),a		;d8a2
	add a,d			;d8a5
	ld b,001h		;d8a6
	ex af,af'		;d8a8
	rlca			;d8a9
	ld b,000h		;d8aa
	ld (bc),a		;d8ac
	ld bc,03208h		;d8ad
	add hl,bc		;d8b0
	nop			;d8b1
	ld (bc),a		;d8b2
	ld a,(bc)		;d8b3
	jr nz,ld8beh		;d8b4
	ex af,af'		;d8b6
	nop			;d8b7
	ld a,(bc)		;d8b8
	ld bc,00908h		;d8b9
	rlca			;d8bc
	add hl,bc		;d8bd
ld8beh:
	ex af,af'		;d8be
	ld (bc),a		;d8bf
	nop			;d8c0
	inc c			;d8c1
	nop			;d8c2
	ld a,(bc)		;d8c3
	ld c,000h		;d8c4
	ld (bc),a		;d8c6
	ld bc,00b04h		;d8c7
	ld c,010h		;d8ca
	nop			;d8cc
	ld a,(bc)		;d8cd
	rrca			;d8ce
	ld (de),a		;d8cf
	ld (bc),a		;d8d0
	ld bc,01304h		;d8d1
	nop			;d8d4
	nop			;d8d5
	ld bc,00012h		;d8d6
	dec b			;d8d9
	ld bc,00013h		;d8da
	inc b			;d8dd
	nop			;d8de
	inc d			;d8df
	ld (bc),a		;d8e0
	nop			;d8e1
	ld bc,00316h		;d8e2
	ld (bc),a		;d8e5
	ld a,(bc)		;d8e6
	inc b			;d8e7
	ld bc,00316h		;d8e8
	inc bc			;d8eb
	ld a,(bc)		;d8ec
	inc b			;d8ed
	ld bc,00d16h		;d8ee
	inc bc			;d8f1
	ex af,af'		;d8f2
	ld d,002h		;d8f3
	rlca			;d8f5
	ld a,(bc)		;d8f6
	inc b			;d8f7
	ld bc,00c16h		;d8f8
	rlca			;d8fb
	ex af,af'		;d8fc
	inc de			;d8fd
	nop			;d8fe
	jr ld902h		;d8ff
	ld (de),a		;d901
ld902h:
	nop			;d902
	dec d			;d903
	nop			;d904
	inc d			;d905
	ld (bc),a		;d906
	ld d,001h		;d907
	inc d			;d909
	ld (bc),a		;d90a
	inc e			;d90b
	nop			;d90c
	ld sp,01602h		;d90d
	nop			;d910
	ld d,003h		;d911
	dec de			;d913
	ld a,(bc)		;d914
	inc b			;d915
	ld bc,00d16h		;d916
	dec de			;d919
	ex af,af'		;d91a
	ld c,00ah		;d91b
	ld de,00d08h		;d91d
	ld de,00007h		;d920
	inc c			;d923
	ld de,00018h		;d924
	dec d			;d927
	ld de,l8201h		;d928
	rlca			;d92b
	ld bc,02004h		;d92c
	inc b			;d92f
	nop			;d930
	nop			;d931
	inc b			;d932
	inc bc			;d933
	ld (bc),a		;d934
	ex af,af'		;d935
	nop			;d936
	inc b			;d937
	ld (bc),a		;d938
	ld c,000h		;d939
	inc bc			;d93b
	nop			;d93c
	ld (de),a		;d93d
	inc b			;d93e
	ld (00805h),a		;d93f
	add a,d			;d942
	ld b,001h		;d943
	ld a,(bc)		;d945
	rlca			;d946
	ld b,000h		;d947
	ld (bc),a		;d949
	ld bc,03206h		;d94a
	add hl,bc		;d94d
	nop			;d94e
	ld (bc),a		;d94f
	ld a,(bc)		;d950
	jr nz,ld95dh		;d951
	rrca			;d953
	nop			;d954
	ld bc,00e0bh		;d955
	ld b,001h		;d958
	ld a,(bc)		;d95a
	rrca			;d95b
	inc b			;d95c
ld95dh:
	nop			;d95d
	ld (0060eh),a		;d95e
	ld bc,00e0ah		;d961
	ld a,(bc)		;d964
	ld (bc),a		;d965
	ld bc,01e03h		;d966
	ld c,010h		;d969
	nop			;d96b
	rra			;d96c
	ld c,014h		;d96d
	ld (bc),a		;d96f
	ld (bc),a		;d970
	ld bc,0081ch		;d971
	ld (de),a		;d974
	ex af,af'		;d975
	dec e			;d976
	ex af,af'		;d977
	djnz ld982h		;d978
	inc e			;d97a
	inc bc			;d97b
	ld (de),a		;d97c
	ex af,af'		;d97d
	dec d			;d97e
	inc b			;d97f
	inc d			;d980
	add a,d			;d981
ld982h:
	ld b,d			;d982
	ld a,(bc)		;d983
	inc c			;d984
	rra			;d985
	ld de,00014h		;d986
	dec d			;d989
	ld de,l8212h		;d98a
	ld b,d			;d98d
	ld (bc),a		;d98e
	ld (bc),a		;d98f
	ld (01310h),a		;d990
	add a,b			;d993
	ld b,d			;d994
	ld (01112h),a		;d995
	add a,b			;d998
	ld b,d			;d999
	ex af,af'		;d99a
	ex af,af'		;d99b
	nop			;d99c
	ld a,(bc)		;d99d
	ld bc,01204h		;d99e
	nop			;d9a1
	inc bc			;d9a2
	ld bc,00013h		;d9a3
	nop			;d9a6
	nop			;d9a7
	inc de			;d9a8
	nop			;d9a9
	ld (bc),a		;d9aa
	nop			;d9ab
	inc d			;d9ac
	ld (bc),a		;d9ad
	nop			;d9ae
	ld bc,00231h		;d9af
	rlca			;d9b2
	nop			;d9b3
	ld d,003h		;d9b4
	ld (bc),a		;d9b6
	ld a,(bc)		;d9b7
	inc b			;d9b8
	ld bc,00d16h		;d9b9
	ld (bc),a		;d9bc
	ex af,af'		;d9bd
	inc c			;d9be
	ld de,0000ah		;d9bf
	dec d			;d9c2
	ld (de),a		;d9c3
	ld bc,00783h		;d9c4
	ld bc,01803h		;d9c7
	inc bc			;d9ca
	inc bc			;d9cb
	nop			;d9cc
	nop			;d9cd
	dec b			;d9ce
	inc b			;d9cf
	ld b,000h		;d9d0
	inc b			;d9d2
	nop			;d9d3
	ex af,af'		;d9d4
	inc b			;d9d5
	inc bc			;d9d6
	nop			;d9d7
	djnz ld9deh		;d9d8
	inc b			;d9da
	inc bc			;d9db
	inc e			;d9dc
	nop			;d9dd
ld9deh:
	rlca			;d9de
	ld b,000h		;d9df
	ld (bc),a		;d9e1
	ld bc,03208h		;d9e2
	add hl,bc		;d9e5
	nop			;d9e6
	ld (bc),a		;d9e7
	ld a,(bc)		;d9e8
	jr nz,ld9f3h		;d9e9
	ex af,af'		;d9eb
	nop			;d9ec
	ld a,(bc)		;d9ed
	ld bc,01f08h		;d9ee
	ld c,000h		;d9f1
ld9f3h:
	ld bc,0111fh		;d9f3
	nop			;d9f6
	ld (bc),a		;d9f7
	ld bc,01f02h		;d9f8
	djnz ld9fdh		;d9fb
ld9fdh:
	ld (bc),a		;d9fd
	ld bc,01f02h		;d9fe
	ld c,014h		;da01
	ld (bc),a		;da03
	ld (bc),a		;da04
	ld bc,0111fh		;da05
	inc d			;da08
	nop			;da09
	dec e			;da0a
	ex af,af'		;da0b
	dec b			;da0c
	add hl,bc		;da0d
	inc e			;da0e
	ex af,af'		;da0f
	ld bc,01c09h		;da10
	inc bc			;da13
	ld bc,03109h		;da14
	inc bc			;da17
	ld bc,00102h		;da18
	inc bc			;da1b
	dec d			;da1c
	inc b			;da1d
	nop			;da1e
	add a,d			;da1f
	ld b,d			;da20
	ld a,(bc)		;da21
	inc b			;da22
	dec e			;da23
	ex af,af'		;da24
	inc d			;da25
	ex af,af'		;da26
	dec e			;da27
	ex af,af'		;da28
	ld a,(de)		;da29
	add hl,bc		;da2a
	dec d			;da2b
	ex af,af'		;da2c
	ld d,082h		;da2d
	ld b,d			;da2f
	ld b,006h		;da30
	add hl,bc		;da32
	dec bc			;da33
	dec bc			;da34
	ex af,af'		;da35
	ld (bc),a		;da36
	nop			;da37
	ld (bc),a		;da38
	nop			;da39
	ld bc,01a00h		;da3a
	nop			;da3d
	add hl,de		;da3e
	inc b			;da3f
	nop			;da40
	nop			;da41
	inc b			;da42
	inc bc			;da43
	nop			;da44
	ex af,af'		;da45
	inc b			;da46
	inc b			;da47
	nop			;da48
	inc d			;da49
	inc b			;da4a
	dec b			;da4b
	ld (bc),a		;da4c
	inc e			;da4d
	inc b			;da4e
	rlca			;da4f
	ld b,000h		;da50
	ld (bc),a		;da52
	ld bc,03208h		;da53
	add hl,bc		;da56
	nop			;da57
	ld (bc),a		;da58
	ld a,(bc)		;da59
	jr nz,$+10		;da5a
	ex af,af'		;da5c
	nop			;da5d
	ld a,(bc)		;da5e
	ld bc,00908h		;da5f
	rlca			;da62
	djnz lda6dh		;da63
	ld e,00eh		;da65
	ex af,af'		;da67
	ld bc,00e1fh		;da68
	nop			;da6b
	nop			;da6c
lda6dh:
	rra			;da6d
	ld de,00002h		;da6e
	rra			;da71
	ld de,00000h		;da72
	rra			;da75
	djnz lda78h		;da76
lda78h:
	nop			;da78
	dec d			;da79
	djnz $+14		;da7a
	add a,b			;da7c
	ld b,d			;da7d
	dec d			;da7e
	ld (de),a		;da7f
	ld c,080h		;da80
	ld b,d			;da82
	ld a,(bc)		;da83
	ld c,010h		;da84
	ld bc,00e0bh		;da86
	jr lda8bh		;da89
lda8bh:
	ld a,(bc)		;da8b
	rrca			;da8c
	ld a,(de)		;da8d
	ld bc,0080fh		;da8e
	ld a,(bc)		;da91
	ex af,af'		;da92
	rra			;da93
	djnz lda96h		;da94
lda96h:
	nop			;da96
	ld c,00ah		;da97
	jr ldaa3h		;da99
	ld a,(bc)		;da9b
	ld c,01ch		;da9c
	nop			;da9e
	ld sp,01008h		;da9f
	sub d			;daa2
ldaa3h:
	rlca			;daa3
	ld (bc),a		;daa4
	ld (bc),a		;daa5
	ld sp,00b0dh		;daa6
	sub b			;daa9
	rlca			;daaa
	ld sp,00a0ah		;daab
	sub b			;daae
	rlca			;daaf
	dec d			;dab0
	jr nz,ldac0h		;dab1
	nop			;dab3
	nop			;dab4
	inc hl			;dab5
	ld (de),a		;dab6
	inc b			;dab7
	ld (bc),a		;dab8
	ld bc,02307h		;dab9
	ld (de),a		;dabc
	ld bc,02100h		;dabd
ldac0h:
	djnz ldac6h		;dac0
	ld (bc),a		;dac2
	ld bc,0210eh		;dac3
ldac6h:
	rrca			;dac6
	inc b			;dac7
	ld (bc),a		;dac8
	ld bc,0150eh		;dac9
	djnz $+5		;dacc
	ld (bc),a		;dace
	ld (bc),a		;dacf
	ld bc,01115h		;dad0
	ld (bc),a		;dad3
	nop			;dad4
	ld (0040dh),hl		;dad5
	ld (bc),a		;dad8
ldad9h:
	ld bc,0160eh		;dad9
	nop			;dadc
	dec b			;dadd
	ld a,(bc)		;dade
	dec b			;dadf
	ld bc,00016h		;dae0
	rrca			;dae3
	ld a,(bc)		;dae4
	dec b			;dae5
	ld bc,00016h		;dae6
	inc de			;dae9
	ld a,(bc)		;daea
	dec b			;daeb
	ld bc,00926h		;daec
	add hl,de		;daef
	ex af,af'		;daf0
	add hl,de		;daf1
	dec b			;daf2
	ex af,af'		;daf3
	ld (bc),a		;daf4
	ld (bc),a		;daf5
	ld bc,00519h		;daf6
	dec c			;daf9
	ld (bc),a		;dafa
	ld (bc),a		;dafb
	ld bc,00519h		;dafc
	ld a,(de)		;daff
	nop			;db00
	daa			;db01
	nop			;db02
	nop			;db03
	ld a,(bc)		;db04
	ld bc,02708h		;db05
	ld (bc),a		;db08
	rlca			;db09
	add hl,bc		;db0a
	daa			;db0b
	ld (bc),a		;db0c
	ld d,009h		;db0d
	add hl,de		;db0f
	inc bc			;db10
	ld a,(de)		;db11
	jr $+41			;db12
	nop			;db14
	nop			;db15
	ld a,(bc)		;db16
	ld bc,01708h		;db17
	rlca			;db1a
	ex af,af'		;db1b
	nop			;db1c
ldb1dh:
	dec c			;db1d
	inc hl			;db1e
	ld (de),a		;db1f
	nop			;db20
	ld (bc),a		;db21
	ld bc,02108h		;db22
	djnz ldb27h		;db25
ldb27h:
	ld (bc),a		;db27
	ld bc,02110h		;db28
	rrca			;db2b
	nop			;db2c
	ld (bc),a		;db2d
	ld bc,02210h		;db2e
	dec c			;db31
	nop			;db32
	ld (bc),a		;db33
	ld bc,02410h		;db34
	ld a,(bc)		;db37
	dec b			;db38
	nop			;db39
	jr z,ldb3ch		;db3a
ldb3ch:
	rrca			;db3c
	nop			;db3d
	add hl,hl		;db3e
	ex af,af'		;db3f
	ld de,03100h		;db40
	dec c			;db43
	djnz $+4		;db44
	ld (bc),a		;db46
	ld bc,00d22h		;db47
	djnz $+18		;db4a
	ld (0140dh),hl		;db4c
	djnz ldb67h		;db4f
	nop			;db51
	add hl,bc		;db52
	ld a,(bc)		;db53
	dec b			;db54
	ld bc,00019h		;db55
	dec de			;db58
	ld (bc),a		;db59
	inc b			;db5a
	ld bc,00027h		;db5b
	nop			;db5e
	ld a,(bc)		;db5f
	ld bc,01108h		;db60
	inc hl			;db63
	ld (de),a		;db64
	nop			;db65
	ld (bc),a		;db66
ldb67h:
	ld bc,02108h		;db67
	djnz ldb6ch		;db6a
ldb6ch:
	ld (bc),a		;db6c
	ld bc,02110h		;db6d
	rrca			;db70
	nop			;db71
	ld (bc),a		;db72
	ld bc,02210h		;db73
	dec c			;db76
	nop			;db77
	ld (bc),a		;db78
	ld bc,00610h		;db79
	ex af,af'		;db7c
	dec d			;db7d
	nop			;db7e
	dec d			;db7f
	rrca			;db80
	ld e,000h		;db81
	inc hl			;db83
	djnz ldb95h		;db84
	ld (bc),a		;db86
	ld bc,01504h		;db87
	rrca			;db8a
	dec e			;db8b
	djnz ldbb2h		;db8c
	ld a,(bc)		;db8e
	ld (bc),a		;db8f
	nop			;db90
	ld d,000h		;db91
	dec b			;db93
	ld a,(bc)		;db94
ldb95h:
	dec b			;db95
	ld bc,00019h		;db96
	dec de			;db99
	ld (bc),a		;db9a
	ld (bc),a		;db9b
	ld bc,00719h		;db9c
	dec de			;db9f
	nop			;dba0
	ld h,009h		;dba1
	ex af,af'		;dba3
	ex af,af'		;dba4
	add hl,de		;dba5
	nop			;dba6
	ld c,002h		;dba7
	inc b			;dba9
	ld bc,00227h		;dbaa
	rlca			;dbad
	ld a,(bc)		;dbae
	ld bc,02704h		;dbaf
ldbb2h:
	nop			;dbb2
	nop			;dbb3
	ld a,(bc)		;dbb4
	ld bc,01508h		;dbb5
	rrca			;dbb8
	ld c,000h		;dbb9
	inc c			;dbbb
	inc hl			;dbbc
	ld (de),a		;dbbd
	nop			;dbbe
	ld (bc),a		;dbbf
	ld bc,02108h		;dbc0
	djnz ldbc5h		;dbc3
ldbc5h:
	ld (bc),a		;dbc5
	ld bc,02110h		;dbc6
	rrca			;dbc9
	nop			;dbca
	ld (bc),a		;dbcb
	ld bc,02210h		;dbcc
	dec c			;dbcf
	nop			;dbd0
	ld (bc),a		;dbd1
	ld bc,02a08h		;dbd2
	ld b,00eh		;dbd5
	inc b			;dbd7
	dec d			;dbd8
	rrca			;dbd9
	ld c,002h		;dbda
	ld bc,02202h		;dbdc
	dec c			;dbdf
	ld c,000h		;dbe0
	ld d,000h		;dbe2
sub_dbe4h:
	ex af,af'		;dbe4
	ld a,(bc)		;dbe5
	dec b			;dbe6
	ld bc,00119h		;dbe7
	inc b			;dbea
	ld (bc),a		;dbeb
	inc bc			;dbec
	ld bc,00227h		;dbed
	nop			;dbf0
	ld a,(bc)		;dbf1
	ld bc,02708h		;dbf2
	nop			;dbf5
	nop			;dbf6
	ld a,(bc)		;dbf7
	ld bc,00f08h		;dbf8
	add hl,bc		;dbfb
	ex af,af'		;dbfc
	ex af,af'		;dbfd
	ex af,af'		;dbfe
	inc hl			;dbff
	ld (de),a		;dc00
ldc01h:
	nop			;dc01
	ld (bc),a		;dc02
	ld bc,02108h		;dc03
	djnz ldc08h		;dc06
ldc08h:
	ld (bc),a		;dc08
	ld bc,02110h		;dc09
	rrca			;dc0c
	nop			;dc0d
	ld (bc),a		;dc0e
	ld bc,02b10h		;dc0f
	inc b			;dc12
	nop			;dc13
	inc b			;dc14
	ld d,001h		;dc15
	djnz ldc23h		;dc17
	dec b			;dc19
	ld bc,00116h		;dc1a
	rlca			;dc1d
	ld a,(bc)		;dc1e
	dec b			;dc1f
	ld bc,00027h		;dc20
ldc23h:
	nop			;dc23
	ld a,(bc)		;dc24
	ld bc,02608h		;dc25
	ld a,(bc)		;dc28
	dec d			;dc29
	ex af,af'		;dc2a
	inc d			;dc2b
	jr nz,$+15		;dc2c
	ld b,001h		;dc2e
	inc hl			;dc30
	ld (de),a		;dc31
	nop			;dc32
	ld (bc),a		;dc33
	ld bc,02303h		;dc34
	ld (de),a		;dc37
	add hl,bc		;dc38
	nop			;dc39
	ld hl,00010h		;dc3a
	ld (bc),a		;dc3d
	ld bc,02105h		;dc3e
	rrca			;dc41
	nop			;dc42
	ld (bc),a		;dc43
	ld bc,01505h		;dc44
	djnz ldc53h		;dc47
	ld (bc),a		;dc49
	ld (bc),a		;dc4a
	ld bc,01115h		;dc4b
	dec bc			;dc4e
	nop			;dc4f
	ld (0000dh),hl		;dc50
ldc53h:
	ld (bc),a		;dc53
	ld bc,02d05h		;dc54
	dec c			;dc57
	inc c			;dc58
	djnz ldc87h		;dc59
	rrca			;dc5b
	dec c			;dc5c
	ld (bc),a		;dc5d
	ld bc,02c02h		;dc5e
	ld de,0020eh		;dc61
	ld bc,02d02h		;dc64
	dec c			;dc67
	inc d			;dc68
	ld (bc),a		;dc69
	ld bc,01902h		;dc6a
	inc bc			;dc6d
	ex af,af'		;dc6e
	ld (bc),a		;dc6f
	inc bc			;dc70
	ld bc,00f15h		;dc71
	dec b			;dc74
	nop			;dc75
	add hl,hl		;dc76
	ex af,af'		;dc77
	rla			;dc78
	nop			;dc79
	jr z,ldc7ch		;dc7a
ldc7ch:
	dec d			;dc7c
	nop			;dc7d
	dec h			;dc7e
	nop			;dc7f
	ld c,00ah		;dc80
	dec b			;dc82
	ld bc,00025h		;dc83
	inc b			;dc86
ldc87h:
	ld a,(bc)		;dc87
	inc b			;dc88
	ld bc,00025h		;dc89
	dec e			;dc8c
	ld a,(bc)		;dc8d
	ld b,001h		;dc8e
	daa			;dc90
	nop			;dc91
	nop			;dc92
	ld a,(bc)		;dc93
	ld bc,01308h		;dc94
	inc l			;dc97
	rrca			;dc98
	nop			;dc99
	inc bc			;dc9a
	ld (bc),a		;dc9b
	ld bc,00f2ch		;dc9c
	djnz $+4		;dc9f
	ld (bc),a		;dca1
	ld bc,00f2ch		;dca2
	ld d,002h		;dca5
	ld (bc),a		;dca7
	ld bc,00d2dh		;dca8
	nop			;dcab
	ld (bc),a		;dcac
	ld bc,02c04h		;dcad
	djnz ldcc7h		;dcb0
	nop			;dcb2
	inc l			;dcb3
	djnz $+10		;dcb4
	nop			;dcb6
	ld d,000h		;dcb7
	dec b			;dcb9
	dec bc			;dcba
	dec b			;dcbb
	ld bc,00032h		;dcbc
	ld b,082h		;dcbf
	ld b,e			;dcc1
	rrca			;dcc2
	ld (bc),a		;dcc3
	dec d			;dcc4
	inc b			;dcc5
	rlca			;dcc6
ldcc7h:
	add a,d			;dcc7
	ld b,e			;dcc8
	inc b			;dcc9
	ld bc,00a15h		;dcca
	ld b,082h		;dccd
	ld b,e			;dccf
	inc bc			;dcd0
	ld bc,00016h		;dcd1
	add hl,de		;dcd4
	ld a,(bc)		;dcd5
	dec b			;dcd6
	ld bc,00119h		;dcd7
sub_dcdah:
	ld (de),a		;dcda
	ld (bc),a		;dcdb
	inc bc			;dcdc
	ld bc,00219h		;dcdd
	inc c			;dce0
	ld (bc),a		;dce1
	inc bc			;dce2
	ld bc,00227h		;dce3
	dec bc			;dce6
	ld a,(bc)		;dce7
	ld bc,02704h		;dce8
	ld (bc),a		;dceb
	nop			;dcec
	ex af,af'		;dced
	daa			;dcee
	nop			;dcef
	nop			;dcf0
	ld a,(bc)		;dcf1
	ld bc,02508h		;dcf2
	ld (bc),a		;dcf5
	ld a,(bc)		;dcf6
	ld a,(bc)		;dcf7
	inc bc			;dcf8
	ld bc,00225h		;dcf9
	dec de			;dcfc
	ld a,(bc)		;dcfd
	dec b			;dcfe
	ld bc,00325h		;dcff
	inc bc			;dd02
	ld a,(bc)		;dd03
	inc b			;dd04
	ld bc,02c11h		;dd05
	rrca			;dd08
	nop			;dd09
	ld (bc),a		;dd0a
	ld (bc),a		;dd0b
	inc bc			;dd0c
	inc l			;dd0d
	rrca			;dd0e
	ld d,002h		;dd0f
	ld (bc),a		;dd11
	ld bc,0102ch		;dd12
	dec d			;dd15
	nop			;dd16
	inc l			;dd17
	djnz ldd1dh		;dd18
	nop			;dd1a
	dec l			;dd1b
	dec c			;dd1c
ldd1dh:
	nop			;dd1d
	ld (bc),a		;dd1e
	ld bc,02f03h		;dd1f
	nop			;dd22
	jr ldd29h		;dd23
	jr nc,$+9		;dd25
	jr ldd2dh		;dd27
ldd29h:
	dec l			;dd29
	ld c,01ch		;dd2a
	nop			;dd2c
ldd2dh:
	ld d,000h		;dd2d
	ld a,(bc)		;dd2f
	ld a,(bc)		;dd30
	dec b			;dd31
	ld bc,00119h		;dd32
	dec d			;dd35
	ld (bc),a		;dd36
	inc bc			;dd37
	ld bc,00227h		;dd38
	ld b,00ah		;dd3b
	ld bc,02703h		;dd3d
	nop			;dd40
	nop			;dd41
	ld a,(bc)		;dd42
	ld bc,02e06h		;dd43
	ld b,001h		;dd46
	nop			;dd48
	dec h			;dd49
	ld (bc),a		;dd4a
	dec b			;dd4b
	ld a,(bc)		;dd4c
	ld (bc),a		;dd4d
	ld bc,00225h		;dd4e
	ld (de),a		;dd51
	ld a,(bc)		;dd52
	inc b			;dd53
	ld bc,00717h		;dd54
	dec bc			;dd57
	nop			;dd58
	ld (0080bh),hl		;dd59
	nop			;dd5c
	nop			;dd5d
ldd5eh:
	nop			;dd5e
ldd5fh:
	nop			;dd5f
	nop			;dd60
	nop			;dd61
	nop			;dd62
	nop			;dd63
	nop			;dd64
	ld (bc),a		;dd65
	ld bc,lae07h		;dd66
	defb 0ddh,053h,0e0h ;illegal sequence	;dd69
ldd6ch:
	nop			;dd6c
ldd6dh:
	nop			;dd6d
	nop			;dd6e
	nop			;dd6f
	nop			;dd70
	nop			;dd71
	nop			;dd72
	ld bc,00701h		;dd73
	ret m			;dd76
	jp po,le0c0h		;dd77
	nop			;dd7a
	nop			;dd7b
	nop			;dd7c
	nop			;dd7d
	nop			;dd7e
	ld bc,00701h		;dd7f
	ret m			;dd82
	jp po,00000h		;dd83
	nop			;dd86
	nop			;dd87
	nop			;dd88
	nop			;dd89
	nop			;dd8a
	ld (bc),a		;dd8b
ldd8ch:
	ld bc,lfd07h		;dd8c
	ex (sp),hl		;dd8f
	sub d			;dd90
	call po,00000h		;dd91
	nop			;dd94
	nop			;dd95
	nop			;dd96
	nop			;dd97
	nop			;dd98
	ld (bc),a		;dd99
ldd9ah:
	ld bc,09207h		;dd9a
	call po,sub_e3fdh	;dd9d
ldda0h:
	nop			;dda0
ldda1h:
	nop			;dda1
	nop			;dda2
	nop			;dda3
	nop			;dda4
	nop			;dda5
	nop			;dda6
	ld (bc),a		;dda7
ldda8h:
	ld bc,lfd07h		;dda8
	ex (sp),hl		;ddab
	sub d			;ddac
	call po,00706h		;ddad
	nop			;ddb0
	ld d,d			;ddb1
	ret po			;ddb2
	rst 38h			;ddb3
	nop			;ddb4
	rst 38h			;ddb5
	nop			;ddb6
	rst 38h			;ddb7
	nop			;ddb8
	rst 38h			;ddb9
	nop			;ddba
	rst 38h			;ddbb
	nop			;ddbc
	rst 38h			;ddbd
	nop			;ddbe
	rst 38h			;ddbf
	nop			;ddc0
	rst 38h			;ddc1
	nop			;ddc2
	rst 38h			;ddc3
	nop			;ddc4
	ex (sp),hl		;ddc5
	nop			;ddc6
	rst 38h			;ddc7
	nop			;ddc8
	rst 38h			;ddc9
	nop			;ddca
	rst 38h			;ddcb
	nop			;ddcc
	rst 38h			;ddcd
	nop			;ddce
	rst 38h			;ddcf
	nop			;ddd0
	rst 38h			;ddd1
	nop			;ddd2
	add a,b			;ddd3
	inc e			;ddd4
	rst 38h			;ddd5
	nop			;ddd6
	rst 38h			;ddd7
	nop			;ddd8
	rst 38h			;ddd9
	nop			;ddda
	rst 38h			;dddb
	nop			;dddc
	rst 38h			;dddd
	nop			;ddde
	rst 38h			;dddf
	nop			;dde0
	nop			;dde1
	ld h,e			;dde2
	rra			;dde3
	nop			;dde4
	rst 38h			;dde5
	nop			;dde6
	rst 38h			;dde7
	nop			;dde8
	rst 38h			;dde9
	nop			;ddea
	rst 38h			;ddeb
	nop			;ddec
	cp 000h			;dded
	nop			;ddef
	add a,c			;ddf0
	inc bc			;ddf1
	ret po			;ddf2
	rst 38h			;ddf3
	nop			;ddf4
	rst 38h			;ddf5
	nop			;ddf6
	rst 38h			;ddf7
	nop			;ddf8
	rst 38h			;ddf9
	nop			;ddfa
	call m,00001h		;ddfb
	ld bc,ldc01h		;ddfe
	rst 38h			;de01
	nop			;de02
	rst 38h			;de03
	nop			;de04
	rst 38h			;de05
	nop			;de06
	rst 38h			;de07
	nop			;de08
	ret p			;de09
	ld bc,06300h		;de0a
	nop			;de0d
	jp m,000ffh		;de0e
lde11h:
	rst 38h			;de11
	nop			;de12
	rst 38h			;de13
	nop			;de14
	rst 38h			;de15
	nop			;de16
	ret po			;de17
	rrca			;de18
	nop			;de19
	ld l,a			;de1a
	nop			;de1b
	adc a,l			;de1c
	ld a,a			;de1d
	nop			;de1e
	rst 38h			;de1f
	nop			;de20
	rst 38h			;de21
	nop			;de22
	rst 38h			;de23
	nop			;de24
	ret nz			;de25
	ld de,01f00h		;de26
	nop			;de29
	or 03fh			;de2a
	add a,b			;de2c
	di			;de2d
	nop			;de2e
	rst 38h			;de2f
	nop			;de30
	rst 38h			;de31
	nop			;de32
	add a,b			;de33
	jr nz,lde36h		;de34
lde36h:
	cp (hl)			;de36
	nop			;de37
	dec de			;de38
	ccf			;de39
lde3ah:
	add a,b			;de3a
	pop bc			;de3b
	inc c			;de3c
	rst 38h			;de3d
	nop			;de3e
	rst 38h			;de3f
	nop			;de40
	add a,b			;de41
	inc l			;de42
	nop			;de43
	defb 0fdh,000h,08ah ;illegal sequence	;de44
	ccf			;de47
	add a,b			;de48
	add a,b			;de49
	ld a,0ffh		;de4a
	nop			;de4c
	rst 38h			;de4d
	nop			;de4e
	add a,b			;de4f
	dec l			;de50
	nop			;de51
	ld sp,hl		;de52
	nop			;de53
	call 0401eh		;de54
	nop			;de57
lde58h:
	ld a,d			;de58
	rst 38h			;de59
	nop			;de5a
	rst 38h			;de5b
	nop			;de5c
	add a,b			;de5d
	inc hl			;de5e
	nop			;de5f
	push hl			;de60
	nop			;de61
	push bc			;de62
	inc e			;de63
	pop bc			;de64
	nop			;de65
	and 0ffh		;de66
	nop			;de68
	rst 38h			;de69
lde6ah:
	nop			;de6a
	ret nz			;de6b
	rla			;de6c
	nop			;de6d
	adc a,000h		;de6e
	ld h,010h		;de70
	jp lc600h		;de72
	rst 38h			;de75
	nop			;de76
	rst 38h			;de77
	nop			;de78
	ret po			;de79
	rrca			;de7a
	nop			;de7b
	ld l,000h		;de7c
	jp po,lcf00h		;de7e
	jr nz,lde11h		;de81
	rst 38h			;de83
	nop			;de84
	pop af			;de85
	nop			;de86
	ret po			;de87
	rrca			;de88
	nop			;de89
	ld h,b			;de8a
	nop			;de8b
	jp p,ldf00h		;de8c
	ld h,c			;de8f
	inc c			;de90
	rst 38h			;de91
	nop			;de92
	ret po			;de93
	ld c,0c0h		;de94
	inc e			;de96
	nop			;de97
	rla			;de98
	nop			;de99
	ld (hl),d		;de9a
	nop			;de9b
	cp (hl)			;de9c
	pop bc			;de9d
	inc e			;de9e
	rst 38h			;de9f
	nop			;dea0
	ret nz			;dea1
	rrca			;dea2
	ld h,b			;dea3
	rrca			;dea4
	nop			;dea5
	ex (sp),hl		;dea6
	nop			;dea7
	ld (hl),d		;dea8
	ld bc,lc3f8h		;dea9
	jr $+1			;deac
	nop			;deae
	add a,b			;deaf
	scf			;deb0
	jr nc,lde3ah		;deb1
	nop			;deb3
	inc a			;deb4
	nop			;deb5
	ld c,007h		;deb6
	ret p			;deb8
	add a,e			;deb9
	jr c,$+1		;deba
	nop			;debc
	add a,b			;debd
	ld a,(00138h)		;debe
	nop			;dec1
	rst 0			;dec2
	nop			;dec3
	ld sp,hl		;dec4
	inc c			;dec5
	ret nz			;dec6
	inc bc			;dec7
	ld a,b			;dec8
	rst 38h			;dec9
	nop			;deca
	nop			;decb
	ld e,l			;decc
	ld a,080h		;decd
	nop			;decf
	ret m			;ded0
	nop			;ded1
	rlca			;ded2
	jr c,lde58h		;ded3
	rlca			;ded5
	or b			;ded6
	rst 38h			;ded7
	nop			;ded8
	nop			;ded9
	ld l,e			;deda
	ld a,080h		;dedb
	nop			;dedd
	ld a,a			;dede
	nop			;dedf
	rst 38h			;dee0
	jr nc,lde6ah		;dee1
	rlca			;dee3
	ret nc			;dee4
	rst 38h			;dee5
ldee6h:
	nop			;dee6
	nop			;dee7
	ld (hl),a		;dee8
	ld a,h			;dee9
	ld bc,sub_bf00h		;deea
ldeedh:
	nop			;deed
	rst 38h			;deee
	djnz ldf38h		;deef
	rlca			;def1
	ret nc			;def2
	rst 38h			;def3
	nop			;def4
	add a,b			;def5
	ld h,0f0h		;def6
	inc bc			;def8
	nop			;def9
	cp a			;defa
	nop			;defb
	rst 38h			;defc
	nop			;defd
sub_defeh:
	xor e			;defe
	rrca			;deff
ldf00h:
	ret po			;df00
	rst 38h			;df01
	nop			;df02
	pop bc			;df03
	jr ldee6h		;df04
	rrca			;df06
	nop			;df07
	ccf			;df08
	nop			;df09
	add a,b			;df0a
	nop			;df0b
	jp pe,0600fh		;df0c
	rst 38h			;df0f
	nop			;df10
	jp lc018h		;df11
	inc e			;df14
	nop			;df15
	ld a,h			;df16
	nop			;df17
	cp 000h			;df18
	ld h,l			;df1a
	rrca			;df1b
	ret po			;df1c
	rst 38h			;df1d
	nop			;df1e
	add a,a			;df1f
	jr nc,ldf22h		;df20
ldf22h:
	jr nc,ldf24h		;df22
ldf24h:
	di			;df24
	nop			;df25
	and c			;df26
	nop			;df27
ldf28h:
	dec h			;df28
	rrca			;df29
	ret po			;df2a
	rst 38h			;df2b
	nop			;df2c
	add a,h			;df2d
	jr nc,ldf30h		;df2e
ldf30h:
	jp po,06600h		;df30
	nop			;df33
	ld e,h			;df34
	jr ldf77h		;df35
	rrca			;df37
ldf38h:
	jr nz,$+1		;df38
	nop			;df3a
	nop			;df3b
	ld h,e			;df3c
	nop			;df3d
	pop hl			;df3e
	nop			;df3f
	ld c,b			;df40
	nop			;df41
	dec bc			;df42
	ld c,020h		;df43
	rra			;df45
	ret nz			;df46
	rst 38h			;df47
	nop			;df48
	nop			;df49
	ld l,a			;df4a
	nop			;df4b
	jp nc,01000h		;df4c
	nop			;df4f
	pop bc			;df50
	rlca			;df51
	sub b			;df52
	ccf			;df53
	nop			;df54
	rst 38h			;df55
	nop			;df56
	nop			;df57
	ld a,a			;df58
	nop			;df59
	djnz ldf5ch		;df5a
ldf5ch:
	dec h			;df5c
	nop			;df5d
	inc c			;df5e
	rlca			;df5f
	ret nz			;df60
	rst 38h			;df61
	nop			;df62
	rst 38h			;df63
	nop			;df64
	add a,b			;df65
	jr c,ldf28h		;df66
	inc b			;df68
	nop			;df69
	jr z,ldf6ch		;df6a
ldf6ch:
	ld h,d			;df6c
	inc bc			;df6d
	ld e,b			;df6e
	rst 38h			;df6f
	nop			;df70
	rst 38h			;df71
	nop			;df72
	rst 0			;df73
	nop			;df74
	add a,b			;df75
	dec h			;df76
ldf77h:
	nop			;df77
	ld c,d			;df78
	nop			;df79
	ret z			;df7a
	ld bc,0ff0ch		;df7b
	nop			;df7e
	rst 38h			;df7f
	nop			;df80
	rst 38h			;df81
	nop			;df82
	add a,b			;df83
	jr z,ldf86h		;df84
ldf86h:
	ld b,h			;df86
	nop			;df87
	sub b			;df88
	ld bc,lff94h		;df89
	nop			;df8c
	rst 38h			;df8d
	nop			;df8e
	rst 38h			;df8f
ldf90h:
	nop			;df90
	add a,b			;df91
	add hl,hl		;df92
	nop			;df93
	ld (bc),a		;df94
	nop			;df95
	inc b			;df96
	ld bc,lff84h		;df97
	nop			;df9a
	rst 38h			;df9b
	nop			;df9c
	rst 38h			;df9d
	nop			;df9e
	add a,b			;df9f
	add hl,hl		;dfa0
	nop			;dfa1
	ld d,e			;dfa2
	nop			;dfa3
	ld d,c			;dfa4
	ld bc,lf7ach		;dfa5
	nop			;dfa8
	rst 38h			;dfa9
	nop			;dfaa
ldfabh:
	rst 38h			;dfab
	nop			;dfac
	add a,b			;dfad
	inc h			;dfae
	nop			;dfaf
	ld d,c			;dfb0
	nop			;dfb1
	dec c			;dfb2
	ld bc,0e324h		;dfb3
	ex af,af'		;dfb6
	rst 38h			;dfb7
	nop			;dfb8
	rst 38h			;dfb9
	nop			;dfba
	ret nz			;dfbb
	inc d			;dfbc
	nop			;dfbd
	ld d,b			;dfbe
	nop			;dfbf
	ld b,b			;dfc0
	inc bc			;dfc1
	ld l,b			;dfc2
	rst 0			;dfc3
	djnz $+1		;dfc4
	nop			;dfc6
	rst 38h			;dfc7
	nop			;dfc8
	ret nz			;dfc9
	ld (de),a		;dfca
	nop			;dfcb
	ld c,d			;dfcc
	nop			;dfcd
	ld (hl),003h		;dfce
	ld b,b			;dfd0
	adc a,a			;dfd1
	nop			;dfd2
	rst 38h			;dfd3
	nop			;dfd4
	rst 38h			;dfd5
	nop			;dfd6
	ret po			;dfd7
	ld a,(bc)		;dfd8
	nop			;dfd9
	inc hl			;dfda
	nop			;dfdb
	inc c			;dfdc
	inc bc			;dfdd
	adc a,b			;dfde
	rra			;dfdf
	ld b,b			;dfe0
	rst 38h			;dfe1
	nop			;dfe2
	rst 38h			;dfe3
	nop			;dfe4
	ret p			;dfe5
	ld bc,02100h		;dfe6
	nop			;dfe9
	add a,d			;dfea
	inc bc			;dfeb
	jr ldfabh		;dfec
	nop			;dfee
	rst 38h			;dfef
	nop			;dff0
	rst 38h			;dff1
	nop			;dff2
	ret m			;dff3
	nop			;dff4
	nop			;dff5
	ld (de),a		;dff6
	nop			;dff7
	ld h,b			;dff8
	ld bc,lf890h		;dff9
	ld (bc),a		;dffc
	rst 38h			;dffd
	nop			;dffe
ldfffh:
	rst 38h			;dfff
	nop			;e000
	ret m			;e001
	ld (bc),a		;e002
	nop			;e003
le004h:
	ld bc,04300h		;e004
le007h:
	nop			;e007
	ld (bc),a		;e008
	defb 0ddh,000h,0ffh ;illegal sequence	;e009
	nop			;e00c
le00dh:
	rst 38h			;e00d
	nop			;e00e
le00fh:
	call m,00001h		;e00f
	add a,h			;e012
	nop			;e013
le014h:
	inc c			;e014
	ld bc,l8f44h		;e015
	jr nz,$+1		;e018
	nop			;e01a
	rst 38h			;e01b
	nop			;e01c
	cp 000h			;e01d
	nop			;e01f
	inc bc			;e020
	nop			;e021
	add a,c			;e022
	ld bc,ldf90h		;e023
	nop			;e026
	rst 38h			;e027
	nop			;e028
	rst 38h			;e029
	nop			;e02a
	rst 38h			;e02b
	nop			;e02c
	call m,00000h		;e02d
	jp p,00208h		;e030
	ei			;e033
	nop			;e034
	rst 38h			;e035
	nop			;e036
	rst 38h			;e037
	nop			;e038
	rst 38h			;e039
	nop			;e03a
	rst 38h			;e03b
	nop			;e03c
	dec c			;e03d
	nop			;e03e
	dec e			;e03f
	ld b,b			;e040
	pop af			;e041
	inc b			;e042
	rst 38h			;e043
	nop			;e044
	rst 38h			;e045
	nop			;e046
	rst 38h			;e047
	nop			;e048
	rst 38h			;e049
	nop			;e04a
	rst 38h			;e04b
	nop			;e04c
	cp a			;e04d
	nop			;e04e
	ei			;e04f
	nop			;e050
	rst 38h			;e051
	nop			;e052
	ld b,007h		;e053
	nop			;e055
	rst 30h			;e056
	jp po,000ffh		;e057
	rst 38h			;e05a
	nop			;e05b
	ex (sp),hl		;e05c
	nop			;e05d
	rst 38h			;e05e
	nop			;e05f
	rst 38h			;e060
	nop			;e061
	rst 38h			;e062
	nop			;e063
	rst 38h			;e064
	nop			;e065
	rst 38h			;e066
	nop			;e067
	rst 38h			;e068
	nop			;e069
	add a,b			;e06a
	inc e			;e06b
	rst 38h			;e06c
	nop			;e06d
	rst 38h			;e06e
	nop			;e06f
	rst 38h			;e070
	nop			;e071
	rst 38h			;e072
	nop			;e073
	rst 38h			;e074
	nop			;e075
	rst 38h			;e076
	nop			;e077
	nop			;e078
	ld h,d			;e079
	rra			;e07a
	nop			;e07b
	rst 38h			;e07c
	nop			;e07d
	rst 38h			;e07e
	nop			;e07f
	rst 38h			;e080
	nop			;e081
	rst 38h			;e082
	nop			;e083
le084h:
	cp 000h			;e084
	nop			;e086
	add a,c			;e087
	inc bc			;e088
	ret po			;e089
le08ah:
	rst 38h			;e08a
	nop			;e08b
	rst 38h			;e08c
	nop			;e08d
	rst 38h			;e08e
	nop			;e08f
	rst 38h			;e090
	nop			;e091
	call m,00001h		;e092
	ld bc,ldc01h		;e095
	rst 38h			;e098
	nop			;e099
	rst 38h			;e09a
	nop			;e09b
	rst 38h			;e09c
	nop			;e09d
	rst 38h			;e09e
	nop			;e09f
	ret p			;e0a0
	ld bc,06300h		;e0a1
	nop			;e0a4
	jp m,000ffh		;e0a5
	rst 38h			;e0a8
	nop			;e0a9
	rst 38h			;e0aa
	nop			;e0ab
	rst 38h			;e0ac
	nop			;e0ad
	ret po			;e0ae
	rrca			;e0af
	nop			;e0b0
	ld l,a			;e0b1
	nop			;e0b2
	adc a,l			;e0b3
	ld a,a			;e0b4
	nop			;e0b5
	rst 38h			;e0b6
	nop			;e0b7
	rst 38h			;e0b8
	nop			;e0b9
	rst 38h			;e0ba
	nop			;e0bb
	ret nz			;e0bc
	ld de,01f00h		;e0bd
le0c0h:
	nop			;e0c0
	or 03fh			;e0c1
le0c3h:
	add a,b			;e0c3
	ei			;e0c4
	nop			;e0c5
le0c6h:
	rst 38h			;e0c6
	nop			;e0c7
	rst 38h			;e0c8
	nop			;e0c9
	add a,b			;e0ca
	dec l			;e0cb
	nop			;e0cc
	cp a			;e0cd
	nop			;e0ce
	dec de			;e0cf
	ccf			;e0d0
	add a,b			;e0d1
	pop hl			;e0d2
	inc b			;e0d3
	rst 38h			;e0d4
	nop			;e0d5
	rst 38h			;e0d6
	nop			;e0d7
	add a,b			;e0d8
	inc l			;e0d9
	nop			;e0da
	ld sp,hl		;e0db
	nop			;e0dc
	adc a,d			;e0dd
	ccf			;e0de
	add a,b			;e0df
	add a,b			;e0e0
	ld e,0ffh		;e0e1
	nop			;e0e3
	rst 38h			;e0e4
	nop			;e0e5
	add a,b			;e0e6
	inc hl			;e0e7
	nop			;e0e8
	push hl			;e0e9
	nop			;e0ea
	push bc			;e0eb
	ld e,0c0h		;e0ec
	nop			;e0ee
	halt			;e0ef
sub_e0f0h:
	rst 38h			;e0f0
	nop			;e0f1
	rst 38h			;e0f2
	nop			;e0f3
le0f4h:
	ret nz			;e0f4
	rla			;e0f5
	nop			;e0f6
	adc a,000h		;e0f7
	ld h,01ch		;e0f9
	pop bc			;e0fb
le0fch:
	nop			;e0fc
	and 0ffh		;e0fd
	nop			;e0ff
	rst 38h			;e100
	nop			;e101
	ret po			;e102
	rrca			;e103
	nop			;e104
	ld l,000h		;e105
	jp po,lc310h		;e107
	nop			;e10a
	adc a,0ffh		;e10b
	nop			;e10d
	pop af			;e10e
	nop			;e10f
	ret po			;e110
	rrca			;e111
	nop			;e112
	ld h,h			;e113
	nop			;e114
	jp p,lcf00h		;e115
	ld bc,lff8ch		;e118
	nop			;e11b
	ret po			;e11c
	ld c,0c0h		;e11d
	inc e			;e11f
	nop			;e120
	jp nc,l7200h		;e121
	nop			;e124
	sbc a,a			;e125
	ld bc,0ff1ch		;e126
	nop			;e129
	ret nz			;e12a
	rrca			;e12b
	ld h,b			;e12c
	rrca			;e12d
	nop			;e12e
	ccf			;e12f
	nop			;e130
	ld (hl),000h		;e131
	cp 003h			;e133
	jr $+1			;e135
	nop			;e137
	add a,b			;e138
le139h:
	scf			;e139
	jr nc,le0c3h		;e13a
	nop			;e13c
	rst 0			;e13d
	nop			;e13e
	ld sp,hl		;e13f
	nop			;e140
	ret m			;e141
	inc bc			;e142
	jr c,$+1		;e143
	nop			;e145
	add a,b			;e146
	ld a,(00138h)		;e147
	nop			;e14a
	ret m			;e14b
	nop			;e14c
	rlca			;e14d
	nop			;e14e
	ret p			;e14f
	inc bc			;e150
	ld a,b			;e151
	rst 38h			;e152
	nop			;e153
	nop			;e154
	ld e,l			;e155
	ld a,080h		;e156
	nop			;e158
	rst 38h			;e159
	nop			;e15a
	defb 0fdh,000h,0c3h ;illegal sequence	;e15b
	rlca			;e15e
	or b			;e15f
	rst 38h			;e160
	nop			;e161
	nop			;e162
	ld l,e			;e163
	ld a,080h		;e164
	nop			;e166
	ld a,a			;e167
	nop			;e168
	add a,e			;e169
	nop			;e16a
le16bh:
	add a,a			;e16b
	rlca			;e16c
	ret nc			;e16d
	rst 38h			;e16e
	nop			;e16f
	nop			;e170
	ld (hl),a		;e171
	ld a,h			;e172
	ld bc,sub_bf00h		;e173
	nop			;e176
	rst 38h			;e177
	nop			;e178
	ld b,a			;e179
	rlca			;e17a
	ret nc			;e17b
le17ch:
	rst 38h			;e17c
le17dh:
	nop			;e17d
	add a,b			;e17e
le17fh:
	ld h,0f8h		;e17f
	inc bc			;e181
	nop			;e182
	cp a			;e183
	nop			;e184
	rst 38h			;e185
	nop			;e186
	xor e			;e187
	rrca			;e188
	ret po			;e189
	rst 38h			;e18a
	nop			;e18b
	pop bc			;e18c
	jr le17fh		;e18d
	rlca			;e18f
	nop			;e190
	cp a			;e191
	nop			;e192
	rst 38h			;e193
	nop			;e194
	jp pe,0600fh		;e195
	rst 38h			;e198
	nop			;e199
	add a,e			;e19a
	jr nz,le17dh		;e19b
	rrca			;e19d
	nop			;e19e
	ccf			;e19f
	nop			;e1a0
	ld bc,le500h		;e1a1
	rrca			;e1a4
	ret po			;e1a5
	rst 38h			;e1a6
	nop			;e1a7
	add a,e			;e1a8
	jr c,le16bh		;e1a9
	ld e,000h		;e1ab
	jr nc,le1afh		;e1ad
le1afh:
	cp 000h			;e1af
	ld h,l			;e1b1
	rrca			;e1b2
	ret po			;e1b3
	rst 38h			;e1b4
	nop			;e1b5
	add a,e			;e1b6
	jr c,le139h		;e1b7
	inc a			;e1b9
	nop			;e1ba
	ld h,a			;e1bb
	nop			;e1bc
	ld c,c			;e1bd
	nop			;e1be
	jr nc,le1d0h		;e1bf
	jr nz,$+1		;e1c1
	nop			;e1c3
	rlca			;e1c4
	ld (hl),b		;e1c5
	nop			;e1c6
	ld a,b			;e1c7
	nop			;e1c8
	ld l,d			;e1c9
	nop			;e1ca
	sbc a,(hl)		;e1cb
	ld b,090h		;e1cc
	rra			;e1ce
	ret nz			;e1cf
le1d0h:
	rst 38h			;e1d0
	nop			;e1d1
	inc b			;e1d2
	ld (hl),b		;e1d3
	nop			;e1d4
	di			;e1d5
	nop			;e1d6
	ld b,b			;e1d7
	nop			;e1d8
	jr nc,$+17		;e1d9
	jr nz,le21ch		;e1db
	nop			;e1dd
	rst 38h			;e1de
	nop			;e1df
	nop			;e1e0
le1e1h:
	ld h,e			;e1e1
	nop			;e1e2
	call nz,05200h		;e1e3
	nop			;e1e6
	ld b,c			;e1e7
	rlca			;e1e8
	djnz $+1		;e1e9
	nop			;e1eb
	rst 38h			;e1ec
	nop			;e1ed
	nop			;e1ee
	ld l,a			;e1ef
	jr nz,le17ch		;e1f0
	nop			;e1f2
	ld h,000h		;e1f3
	sbc a,h			;e1f5
	inc bc			;e1f6
	xor b			;e1f7
	rst 38h			;e1f8
	nop			;e1f9
	rst 38h			;e1fa
	nop			;e1fb
	add a,b			;e1fc
	ld a,060h		;e1fd
	ex af,af'		;e1ff
	nop			;e200
	and h			;e201
	nop			;e202
	ld (0a401h),a		;e203
	rst 38h			;e206
	nop			;e207
	rst 38h			;e208
	nop			;e209
	pop bc			;e20a
	jr $-62			;e20b
	ld (de),a		;e20d
	nop			;e20e
	ld l,c			;e20f
	nop			;e210
	and b			;e211
	ld bc,lbf44h		;e212
	nop			;e215
	rst 38h			;e216
	nop			;e217
	rst 20h			;e218
	nop			;e219
	ret po			;e21a
	inc b			;e21b
le21ch:
	nop			;e21c
	ld c,d			;e21d
	nop			;e21e
	dec b			;e21f
	ld bc,01f4ch		;e220
	ld b,b			;e223
le224h:
	rst 38h			;e224
	nop			;e225
	rst 38h			;e226
	nop			;e227
	ret nz			;e228
	ld d,000h		;e229
	add a,d			;e22b
	nop			;e22c
	inc l			;e22d
	ld bc,lbf44h		;e22e
	nop			;e231
	rst 38h			;e232
	nop			;e233
	rst 38h			;e234
	nop			;e235
	ret nz			;e236
	inc b			;e237
	nop			;e238
	ret nc			;e239
	nop			;e23a
	add a,b			;e23b
	ld bc,l7f94h		;e23c
	nop			;e23f
	rst 38h			;e240
	nop			;e241
	rst 38h			;e242
	nop			;e243
	add a,b			;e244
	ld hl,(05000h)		;e245
	nop			;e248
	adc a,c			;e249
	nop			;e24a
	inc d			;e24b
	ccf			;e24c
	add a,b			;e24d
	rst 38h			;e24e
	nop			;e24f
	rst 38h			;e250
	nop			;e251
	ret nz			;e252
	dec bc			;e253
	nop			;e254
	ld (hl),d		;e255
	nop			;e256
le257h:
	ld h,b			;e257
	nop			;e258
	inc h			;e259
	ld a,a			;e25a
	nop			;e25b
	rst 38h			;e25c
	nop			;e25d
	rst 38h			;e25e
	nop			;e25f
	ret nz			;e260
	ld a,(bc)		;e261
	nop			;e262
	ld c,d			;e263
	nop			;e264
	ld h,h			;e265
	nop			;e266
	ld h,h			;e267
	rst 38h			;e268
	nop			;e269
	rst 38h			;e26a
	nop			;e26b
	rst 38h			;e26c
	nop			;e26d
	add a,b			;e26e
	add hl,hl		;e26f
	nop			;e270
	jr nc,le273h		;e271
le273h:
	ld (0c900h),a		;e273
	ld (hl),a		;e276
	nop			;e277
	rst 38h			;e278
	nop			;e279
	rst 38h			;e27a
	nop			;e27b
	add a,b			;e27c
	dec h			;e27d
	nop			;e27e
	inc h			;e27f
	nop			;e280
	adc a,h			;e281
	ld (bc),a		;e282
	ret c			;e283
	ex (sp),hl		;e284
	ex af,af'		;e285
	rst 38h			;e286
	nop			;e287
	rst 38h			;e288
	nop			;e289
	ret nz			;e28a
	djnz le28dh		;e28b
le28dh:
	sbc a,b			;e28d
	nop			;e28e
	ld (hl),c		;e28f
	rlca			;e290
	or b			;e291
	ld (hl),c		;e292
	nop			;e293
	rst 38h			;e294
	nop			;e295
	rst 38h			;e296
	nop			;e297
	ret nz			;e298
	djnz le29bh		;e299
le29bh:
	ld c,l			;e29b
	nop			;e29c
	rrca			;e29d
	ld b,040h		;e29e
	jr c,le224h		;e2a0
	rst 38h			;e2a2
	nop			;e2a3
	rst 38h			;e2a4
	nop			;e2a5
	ret po			;e2a6
	add hl,bc		;e2a7
	nop			;e2a8
	ld (bc),a		;e2a9
	nop			;e2aa
	add a,h			;e2ab
	rlca			;e2ac
	adc a,b			;e2ad
	ld (hl),b		;e2ae
	nop			;e2af
	rst 38h			;e2b0
	nop			;e2b1
	rst 38h			;e2b2
	nop			;e2b3
	ret p			;e2b4
	nop			;e2b5
	nop			;e2b6
	adc a,c			;e2b7
	nop			;e2b8
	and c			;e2b9
	inc bc			;e2ba
	nop			;e2bb
	ret nz			;e2bc
	ld c,0ffh		;e2bd
	nop			;e2bf
	rst 38h			;e2c0
	nop			;e2c1
	ret m			;e2c2
	ld (bc),a		;e2c3
	nop			;e2c4
	ld h,h			;e2c5
	nop			;e2c6
	inc d			;e2c7
	ld bc,l8108h		;e2c8
	jr nc,$+1		;e2cb
	nop			;e2cd
	rst 38h			;e2ce
	nop			;e2cf
	call m,00001h		;e2d0
	nop			;e2d3
	jr z,le257h		;e2d4
	nop			;e2d6
	ld (000cfh),hl		;e2d7
	rst 38h			;e2da
	nop			;e2db
	rst 38h			;e2dc
	nop			;e2dd
	cp 000h			;e2de
	nop			;e2e0
	rst 10h			;e2e1
	ld a,(hl)		;e2e2
	nop			;e2e3
	defb 0ddh,000h,0ffh ;illegal sequence	;e2e4
	nop			;e2e7
	rst 38h			;e2e8
	nop			;e2e9
	rst 38h			;e2ea
	nop			;e2eb
	rst 38h			;e2ec
	nop			;e2ed
	jr z,le2f0h		;e2ee
le2f0h:
	rst 38h			;e2f0
	nop			;e2f1
	rst 38h			;e2f2
	nop			;e2f3
	rst 38h			;e2f4
	nop			;e2f5
	rst 38h			;e2f6
	nop			;e2f7
	inc b			;e2f8
	inc b			;e2f9
	nop			;e2fa
	call m,sub_ffe3h	;e2fb
	nop			;e2fe
	rst 38h			;e2ff
sub_e300h:
	nop			;e300
	ret p			;e301
	nop			;e302
	rst 38h			;e303
	nop			;e304
	rst 38h			;e305
	nop			;e306
	rst 38h			;e307
	nop			;e308
	ret po			;e309
	dec bc			;e30a
	ld a,a			;e30b
	nop			;e30c
	rst 38h			;e30d
	nop			;e30e
	rst 38h			;e30f
	nop			;e310
	ret nz			;e311
	ld de,l803fh		;e312
	rst 38h			;e315
	nop			;e316
	pop hl			;e317
	nop			;e318
	add a,(hl)		;e319
	jr nc,le35bh		;e31a
	add a,b			;e31c
	call m,00000h		;e31d
	ld e,004h		;e320
	ld sp,l803fh		;e322
	ret p			;e325
	inc bc			;e326
	nop			;e327
	rst 38h			;e328
	inc b			;e329
	sub c			;e32a
	rra			;e32b
	ret nz			;e32c
	ret po			;e32d
	dec c			;e32e
	nop			;e32f
	rst 20h			;e330
	nop			;e331
	ex (sp),hl		;e332
	rra			;e333
	ret nz			;e334
	ret nz			;e335
	ld a,(de)		;e336
	nop			;e337
	out (000h),a		;e338
	out (00fh),a		;e33a
	ret po			;e33c
	ret nz			;e33d
	inc e			;e33e
	nop			;e33f
	rlca			;e340
	nop			;e341
	ex de,hl		;e342
	rrca			;e343
	ret po			;e344
	ret nz			;e345
	rra			;e346
	nop			;e347
	ld a,a			;e348
	nop			;e349
	out (00fh),a		;e34a
	ret po			;e34c
	ret nz			;e34d
	rra			;e34e
	nop			;e34f
	cp 000h			;e350
	ld l,e			;e352
	rrca			;e353
	ret po			;e354
	ret po			;e355
	rrca			;e356
	nop			;e357
	defb 0fdh,000h,0f7h ;illegal sequence	;e358
le35bh:
	rrca			;e35b
	ret po			;e35c
	ret p			;e35d
	nop			;e35e
	nop			;e35f
	inc bc			;e360
	nop			;e361
	rst 28h			;e362
	rrca			;e363
	ret po			;e364
	ret m			;e365
	inc bc			;e366
	nop			;e367
	ld e,h			;e368
	nop			;e369
	ld b,a			;e36a
	rrca			;e36b
	ret po			;e36c
	ret p			;e36d
	ld bc,01900h		;e36e
	nop			;e371
	cp b			;e372
	rra			;e373
	ret nz			;e374
	ret po			;e375
	ld a,(bc)		;e376
	nop			;e377
	jp m,0de00h		;e378
	rra			;e37b
	ret nz			;e37c
	ret nz			;e37d
	dec e			;e37e
	nop			;e37f
	ei			;e380
	nop			;e381
	cp 01fh			;e382
	ld b,b			;e384
	ret nz			;e385
	inc de			;e386
	nop			;e387
	defb 0fdh,000h,0feh ;illegal sequence	;e388
	rra			;e38b
	ld b,b			;e38c
	ret po			;e38d
	rrca			;e38e
	nop			;e38f
	cp 001h			;e390
	ld a,h			;e392
	cp a			;e393
	nop			;e394
	ret nz			;e395
	rra			;e396
	nop			;e397
	rst 38h			;e398
	inc bc			;e399
	ld a,b			;e39a
	rst 38h			;e39b
	nop			;e39c
	ret nz			;e39d
	rra			;e39e
	nop			;e39f
	rst 38h			;e3a0
	ld bc,lffa4h		;e3a1
	nop			;e3a4
	ret nz			;e3a5
	rra			;e3a6
	nop			;e3a7
	rst 38h			;e3a8
	ld bc,lffd4h		;e3a9
	nop			;e3ac
	add a,b			;e3ad
	daa			;e3ae
	nop			;e3af
	cp 001h			;e3b0
	ld l,h			;e3b2
	rst 38h			;e3b3
	nop			;e3b4
	nop			;e3b5
	ld l,e			;e3b6
	nop			;e3b7
	push hl			;e3b8
	ld bc,lffb4h		;e3b9
	nop			;e3bc
	nop			;e3bd
	ld e,e			;e3be
	nop			;e3bf
	ld e,e			;e3c0
	inc bc			;e3c1
	xor b			;e3c2
	rst 38h			;e3c3
	nop			;e3c4
	nop			;e3c5
	ld a,e			;e3c6
	nop			;e3c7
	defb 0ddh,003h,0b8h ;illegal sequence	;e3c8
	rst 38h			;e3cb
	nop			;e3cc
	add a,b			;e3cd
	scf			;e3ce
	nop			;e3cf
	defb 0edh ;next byte illegal after ed	;e3d0
	rlca			;e3d1
	or b			;e3d2
	rst 38h			;e3d3
	nop			;e3d4
	add a,b			;e3d5
	dec sp			;e3d6
	nop			;e3d7
	rst 28h			;e3d8
	rrca			;e3d9
	ld h,b			;e3da
	rst 38h			;e3db
	nop			;e3dc
	add a,b			;e3dd
	jr c,le3e0h		;e3de
le3e0h:
	rst 28h			;e3e0
	rra			;e3e1
	add a,b			;e3e2
	rst 38h			;e3e3
	nop			;e3e4
	pop bc			;e3e5
	inc e			;e3e6
	nop			;e3e7
	rlca			;e3e8
	ld a,a			;e3e9
	nop			;e3ea
	rst 38h			;e3eb
	nop			;e3ec
	pop hl			;e3ed
	inc c			;e3ee
	ret p			;e3ef
	rlca			;e3f0
	ld a,a			;e3f1
	nop			;e3f2
	rst 38h			;e3f3
	nop			;e3f4
	di			;e3f5
	nop			;e3f6
	ret m			;e3f7
	nop			;e3f8
	rst 38h			;e3f9
	nop			;e3fa
	rst 38h			;e3fb
	nop			;e3fc
sub_e3fdh:
	inc bc			;e3fd
	inc bc			;e3fe
	nop			;e3ff
	sub c			;e400
le401h:
	call po,000ffh		;e401
	rst 38h			;e404
	nop			;e405
	rst 38h			;e406
	nop			;e407
	rst 38h			;e408
	nop			;e409
	rst 18h			;e40a
	nop			;e40b
	rst 38h			;e40c
	nop			;e40d
	rst 38h			;e40e
	nop			;e40f
	adc a,a			;e410
	jr nz,$+1		;e411
le413h:
	nop			;e413
	rst 38h			;e414
	nop			;e415
	adc a,a			;e416
	jr nz,$+1		;e417
	nop			;e419
	rst 38h			;e41a
	nop			;e41b
	adc a,a			;e41c
	jr nz,$+1		;e41d
	nop			;e41f
	sbc a,000h		;e420
	add a,a			;e422
	jr nc,$+1		;e423
	nop			;e425
	adc a,h			;e426
	ld hl,l7007h		;e427
	rst 18h			;e42a
	nop			;e42b
	add a,010h		;e42c
	rlca			;e42e
	ld (hl),b		;e42f
	rrca			;e430
	jr nz,le413h		;e431
	ex af,af'		;e433
	nop			;e434
	ret m			;e435
	rra			;e436
	ret nz			;e437
	ret po			;e438
	rrca			;e439
	nop			;e43a
	rst 38h			;e43b
	ccf			;e43c
	nop			;e43d
	ret p			;e43e
	rlca			;e43f
	nop			;e440
	call m,000ffh		;e441
	ret p			;e444
	rlca			;e445
	ld bc,lfffch		;e446
	nop			;e449
	ret nc			;e44a
	inc bc			;e44b
	nop			;e44c
	cp 0ffh			;e44d
	nop			;e44f
	add a,b			;e450
	cpl			;e451
	nop			;e452
	rst 38h			;e453
	ld a,a			;e454
	nop			;e455
	ret nz			;e456
	rra			;e457
	nop			;e458
	rst 38h			;e459
	rra			;e45a
	add a,b			;e45b
	ret po			;e45c
	rlca			;e45d
	nop			;e45e
	rst 38h			;e45f
	rrca			;e460
	ret po			;e461
	ret nz			;e462
	inc bc			;e463
	nop			;e464
	call m,0001fh		;e465
	add a,b			;e468
	inc hl			;e469
	inc bc			;e46a
	ret m			;e46b
	rst 38h			;e46c
	nop			;e46d
	ret nz			;e46e
	rrca			;e46f
	ld bc,lfffch		;e470
	nop			;e473
	add a,b			;e474
	dec e			;e475
	nop			;e476
	jp po,000ffh		;e477
	ld (bc),a		;e47a
	ld h,b			;e47b
	dec e			;e47c
	ret nz			;e47d
	rst 38h			;e47e
	nop			;e47f
	sbc a,a			;e480
	nop			;e481
	rra			;e482
	ld b,b			;e483
	rst 38h			;e484
	nop			;e485
	rst 38h			;e486
	nop			;e487
	rra			;e488
	ld b,b			;e489
	rst 38h			;e48a
	nop			;e48b
	rst 38h			;e48c
	nop			;e48d
	sbc a,a			;e48e
	nop			;e48f
	rst 38h			;e490
	nop			;e491
	inc bc			;e492
	inc bc			;e493
	nop			;e494
	ld h,0e5h		;e495
	rst 38h			;e497
	nop			;e498
	rst 38h			;e499
	nop			;e49a
	rst 38h			;e49b
	nop			;e49c
	rst 38h			;e49d
	nop			;e49e
	defb 0fdh,000h,0ffh ;illegal sequence	;e49f
	nop			;e4a2
	ei			;e4a3
	nop			;e4a4
	ret m			;e4a5
	ld (bc),a		;e4a6
	rst 38h			;e4a7
	nop			;e4a8
	pop af			;e4a9
	inc b			;e4aa
	pop af			;e4ab
	inc b			;e4ac
	rst 38h			;e4ad
	nop			;e4ae
	ei			;e4af
	nop			;e4b0
	ex (sp),hl		;e4b1
	ex af,af'		;e4b2
	rst 38h			;e4b3
	nop			;e4b4
	cp 000h			;e4b5
	ex (sp),hl		;e4b7
	ex af,af'		;e4b8
	rst 38h			;e4b9
	nop			;e4ba
	cp h			;e4bb
	ld bc,01843h		;e4bc
	rst 38h			;e4bf
	nop			;e4c0
	ld c,040h		;e4c1
	rlca			;e4c3
	sub b			;e4c4
	ld a,a			;e4c5
	nop			;e4c6
	add a,b			;e4c7
	jr nc,le4d0h		;e4c8
	ret p			;e4ca
	ccf			;e4cb
	add a,b			;e4cc
	ret nz			;e4cd
	rra			;e4ce
	nop			;e4cf
le4d0h:
	ld sp,hl		;e4d0
	ld a,a			;e4d1
	nop			;e4d2
	ret po			;e4d3
	rrca			;e4d4
	nop			;e4d5
	cp 0ffh			;e4d6
	nop			;e4d8
	ret p			;e4d9
	rlca			;e4da
	nop			;e4db
	cp 0ffh			;e4dc
	nop			;e4de
	ret m			;e4df
sub_e4e0h:
	inc bc			;e4e0
	nop			;e4e1
sub_e4e2h:
	call m,0007fh		;e4e2
	ret m			;e4e5
	inc bc			;e4e6
	nop			;e4e7
	rst 38h			;e4e8
	rra			;e4e9
	add a,b			;e4ea
	call m,00001h		;e4eb
	ret m			;e4ee
	rrca			;e4ef
	ret po			;e4f0
	call c,00301h		;e4f1
	sbc a,b			;e4f4
	rrca			;e4f5
	nop			;e4f6
	adc a,h			;e4f7
	ld hl,00863h		;e4f8
	rst 38h			;e4fb
	nop			;e4fc
	ret c			;e4fd
	inc bc			;e4fe
	ld (hl),c		;e4ff
le500h:
	inc b			;e500
	rst 38h			;e501
	nop			;e502
	ret m			;e503
	ld (bc),a		;e504
	pop af			;e505
	inc b			;e506
	rst 38h			;e507
	nop			;e508
	ret p			;e509
	ld b,0fbh		;e50a
	nop			;e50c
	rst 38h			;e50d
	nop			;e50e
	pop af			;e50f
	inc b			;e510
	rst 38h			;e511
	nop			;e512
	rst 38h			;e513
	nop			;e514
	pop af			;e515
	inc b			;e516
	rst 38h			;e517
	nop			;e518
	rst 38h			;e519
	nop			;e51a
	ex (sp),hl		;e51b
	ex af,af'		;e51c
	rst 38h			;e51d
	nop			;e51e
	rst 38h			;e51f
	nop			;e520
	rst 30h			;e521
	nop			;e522
	rst 38h			;e523
	nop			;e524
	rst 38h			;e525
	nop			;e526
	nop			;e527
	nop			;e528
	nop			;e529
	nop			;e52a
	nop			;e52b
	nop			;e52c
	nop			;e52d
le52eh:
	nop			;e52e
	nop			;e52f
	nop			;e530
	ld (bc),a		;e531
	xor c			;e532
	nop			;e533
	dec bc			;e534
	ld hl,(00940h)		;e535
	ld d,h			;e538
	add a,b			;e539
	ld b,0bbh		;e53a
	nop			;e53c
	add hl,bc		;e53d
	ld d,l			;e53e
	nop			;e53f
	inc b			;e540
	rst 38h			;e541
	add a,b			;e542
	dec (hl)		;e543
	sbc a,h			;e544
	add a,b			;e545
	ld c,e			;e546
	ld h,e			;e547
	nop			;e548
	ld (hl),a		;e549
	ld d,l			;e54a
	nop			;e54b
	ld h,a			;e54c
	ld (hl),d		;e54d
	add a,b			;e54e
	scf			;e54f
	adc a,l			;e550
	nop			;e551
	rra			;e552
	defb 0fdh,080h,00ch ;illegal sequence	;e553
	defb 0edh ;next byte illegal after ed	;e556
	ret nz			;e557
	dec bc			;e558
	di			;e559
	ret nz			;e55a
	ld c,0ffh		;e55b
	add a,b			;e55d
	ld c,03eh		;e55e
	ld b,b			;e560
	rlca			;e561
	pop bc			;e562
	ret po			;e563
	rlca			;e564
	rst 38h			;e565
	ret nc			;e566
	inc bc			;e567
	rst 38h			;e568
	ret po			;e569
	ld (bc),a		;e56a
	rst 38h			;e56b
	ld d,b			;e56c
	inc bc			;e56d
	ld a,(hl)		;e56e
	and b			;e56f
	inc bc			;e570
	sbc a,a			;e571
	ret nz			;e572
	inc bc			;e573
	ret po			;e574
	nop			;e575
le576h:
	nop			;e576
	djnz le579h		;e577
le579h:
	nop			;e579
	jr nc,le57ch		;e57a
le57ch:
	nop			;e57c
	ld l,a			;e57d
	ret nz			;e57e
	ld c,0deh		;e57f
	jr nc,le5f5h		;e581
	exx			;e583
	ret z			;e584
	adc a,h			;e585
	sbc a,034h		;e586
	ld (hl),e		;e588
	ld h,c			;e589
	call z,sub_d7fch	;e58a
	call p,069f3h		;e58d
	or 0f6h			;e590
	xor l			;e592
	or 0fdh			;e593
	ld d,a			;e595
	call p,00bfah		;e596
	call pe,sub_fd77h	;e599
	call pe,sub_fe8fh	;e59c
	inc d			;e59f
	ld a,h			;e5a0
	inc bc			;e5a1
	ret pe			;e5a2
	dec bc			;e5a3
	ld d,l			;e5a4
	jr le5dch		;e5a5
	or d			;e5a7
	ret p			;e5a8
	ld c,0dbh		;e5a9
	ret po			;e5ab
	ld b,096h		;e5ac
	nop			;e5ae
	ld b,086h		;e5af
	nop			;e5b1
	ld (bc),a		;e5b2
	ld b,h			;e5b3
	nop			;e5b4
	ld bc,00008h		;e5b5
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
le5dch:
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
le5f2h:
	nop			;e5f2
	nop			;e5f3
	nop			;e5f4
le5f5h:
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
le600h:
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
	nop			;e60c
	nop			;e60d
	nop			;e60e
	nop			;e60f
	nop			;e610
	nop			;e611
	nop			;e612
	nop			;e613
	nop			;e614
	nop			;e615
	nop			;e616
	nop			;e617
	nop			;e618
	nop			;e619
	nop			;e61a
	nop			;e61b
	nop			;e61c
	nop			;e61d
	nop			;e61e
	nop			;e61f
	nop			;e620
	nop			;e621
	nop			;e622
	nop			;e623
	nop			;e624
	nop			;e625
	nop			;e626
	nop			;e627
	nop			;e628
	nop			;e629
	nop			;e62a
	nop			;e62b
	nop			;e62c
	nop			;e62d
	nop			;e62e
	nop			;e62f
	nop			;e630
	nop			;e631
	nop			;e632
	nop			;e633
	nop			;e634
	nop			;e635
le636h:
	nop			;e636
	nop			;e637
	nop			;e638
	nop			;e639
	nop			;e63a
	nop			;e63b
	nop			;e63c
	nop			;e63d
	nop			;e63e
le63fh:
	nop			;e63f
	nop			;e640
	nop			;e641
	nop			;e642
le643h:
	nop			;e643
	nop			;e644
le645h:
	nop			;e645
	nop			;e646
le647h:
	nop			;e647
	nop			;e648
le649h:
	nop			;e649
	nop			;e64a
le64bh:
	nop			;e64b
	nop			;e64c
	nop			;e64d
	ld bc,lc0ffh		;e64e
	nop			;e651
	ld (bc),a		;e652
	inc e			;e653
	jr nz,le656h		;e654
le656h:
	ld (bc),a		;e656
	jr z,le659h		;e657
le659h:
	nop			;e659
	ld (bc),a		;e65a
	ld d,b			;e65b
	nop			;e65c
	nop			;e65d
	ld (bc),a		;e65e
	sub b			;e65f
	nop			;e660
	nop			;e661
	rrca			;e662
	ret po			;e663
	nop			;e664
	nop			;e665
	inc de			;e666
	nop			;e667
	nop			;e668
	nop			;e669
	ld (00801h),hl		;e66a
	add a,b			;e66d
	ld hl,l9581h		;e66e
	ld b,b			;e671
	inc de			;e672
	di			;e673
	inc b			;e674
	ld b,b			;e675
le676h:
	rrca			;e676
	ld b,b			;e677
	inc b			;e678
	ret nz			;e679
	inc bc			;e67a
	add a,c			;e67b
	rlca			;e67c
	ld b,b			;e67d
	ld (bc),a		;e67e
	nop			;e67f
	add a,l			;e680
	ret nz			;e681
	inc bc			;e682
	ld bc,04085h		;e683
	ld (bc),a		;e686
	nop			;e687
	add a,h			;e688
	ret nz			;e689
	inc bc			;e68a
	ld bc,lc484h		;e68b
	ld (bc),a		;e68e
	inc b			;e68f
	adc a,h			;e690
	ld c,(hl)		;e691
	inc e			;e692
	dec de			;e693
	jr c,le6dah		;e694
le696h:
	ld (hl),b		;e696
	and b			;e697
	ld (hl),d		;e698
	sbc a,b			;e699
	ld (hl),h		;e69a
	sub b			;e69b
	halt			;e69c
	adc a,b			;e69d
	ld a,b			;e69e
	add a,b			;e69f
	ld a,d			;e6a0
	ld a,b			;e6a1
	ld a,h			;e6a2
	ld (hl),b		;e6a3
	ld a,(hl)		;e6a4
	ld l,b			;e6a5
	add a,b			;e6a6
	ld h,b			;e6a7
	add a,d			;e6a8
	ld e,b			;e6a9
	add a,h			;e6aa
	ld d,b			;e6ab
	add a,(hl)		;e6ac
	ld c,b			;e6ad
	adc a,b			;e6ae
	ld b,b			;e6af
	adc a,d			;e6b0
	jr c,le63fh		;e6b1
	jr nc,le643h		;e6b3
	jr z,le647h		;e6b5
	jr nz,le64bh		;e6b7
	jr le649h		;e6b9
	jr le647h		;e6bb
	jr le645h		;e6bd
	jr le643h		;e6bf
	jr le741h		;e6c1
	jr le73fh		;e6c3
	jr $+120		;e6c5
	jr le73bh		;e6c7
	jr le739h		;e6c9
	jr le73eh		;e6cb
	jr le73fh		;e6cd
	jr le743h		;e6cf
	jr nz,le747h		;e6d1
	jr z,le74bh		;e6d3
le6d5h:
	jr nc,le74fh		;e6d5
	jr c,le753h		;e6d7
	ld b,b			;e6d9
le6dah:
	ld a,h			;e6da
	ld c,b			;e6db
	ld a,(hl)		;e6dc
	ld d,b			;e6dd
	add a,b			;e6de
	ld e,b			;e6df
	add a,d			;e6e0
	ld h,b			;e6e1
	add a,h			;e6e2
	ld l,b			;e6e3
	add a,(hl)		;e6e4
	ld (hl),b		;e6e5
	adc a,b			;e6e6
	ld a,b			;e6e7
	adc a,d			;e6e8
	add a,b			;e6e9
	adc a,h			;e6ea
	adc a,b			;e6eb
	adc a,(hl)		;e6ec
le6edh:
	sub b			;e6ed
	sub b			;e6ee
	sbc a,b			;e6ef
	sub d			;e6f0
	and b			;e6f1
	adc a,d			;e6f2
	and b			;e6f3
	add a,d			;e6f4
	and b			;e6f5
sub_e6f6h:
	ld a,d			;e6f6
	and b			;e6f7
	ld (hl),c		;e6f8
	and b			;e6f9
	ld (hl),b		;e6fa
	and b			;e6fb
	nop			;e6fc
	nop			;e6fd
le6feh:
	ld hl,le730h		;e6fe
	call sub_e721h		;e701
	call sub_e70dh		;e704
	call sub_e70dh		;e707
	jp 0e87fh		;e70a
sub_e70dh:
	ld hl,04000h		;e70d
	ld bc,01000h		;e710
le713h:
	ld a,(hl)		;e713
	ld d,a			;e714
	and a			;e715
	rr a			;e716
	or d			;e718
	ld (hl),a		;e719
	inc hl			;e71a
	dec bc			;e71b
	ld a,b			;e71c
	or c			;e71d
	jr nz,le713h		;e71e
	ret			;e720
sub_e721h:
	ld a,002h		;e721
	push hl			;e723
	call 01601h		;e724
	pop hl			;e727
le728h:
	ld a,(hl)		;e728
	cp 0ffh			;e729
	ret z			;e72b
	rst 10h			;e72c
	inc hl			;e72d
	jr le728h		;e72e
le730h:
	ld d,00dh		;e730
	ld bc,00610h		;e732
	ld b,c			;e735
	ld c,(hl)		;e736
	ld d,h			;e737
	ld c,a			;e738
le739h:
	ld c,(hl)		;e739
	ld c,c			;e73a
le73bh:
	ld c,a			;e73b
	jr nz,le788h		;e73c
le73eh:
	ld d,l			;e73e
le73fh:
	ld b,c			;e73f
	ld c,(hl)		;e740
le741h:
	jr nz,le78bh		;e741
le743h:
	ld b,l			;e743
	ld d,d			;e744
	ld c,(hl)		;e745
	ld b,c			;e746
le747h:
	ld c,(hl)		;e747
	ld b,h			;e748
	ld b,l			;e749
	ld e,d			;e74a
le74bh:
	jr nz,le790h		;e74b
	ld d,l			;e74d
	ld b,l			;e74e
le74fh:
	ld c,h			;e74f
	ld c,h			;e750
	ld b,c			;e751
	ld d,d			;e752
le753h:
	ld d,00ch		;e753
	dec bc			;e755
	djnz le75ch		;e756
	ld b,a			;e758
	ld d,d			;e759
	ld b,c			;e75a
	ld b,(hl)		;e75b
le75ch:
	ld c,c			;e75c
	ld b,e			;e75d
	ld c,a			;e75e
	ld d,e			;e75f
	ld d,00bh		;e760
	inc bc			;e762
	djnz le76bh		;e763
	ld c,l			;e765
	ld c,c			;e766
	ld b,a			;e767
	ld d,l			;e768
	ld b,l			;e769
	ld c,h			;e76a
le76bh:
	jr nz,le7aeh		;e76b
	ld c,(hl)		;e76d
	ld b,a			;e76e
	ld b,l			;e76f
	ld c,h			;e770
	jr nz,$+71		;e771
	ld d,e			;e773
	ld d,h			;e774
	ld b,l			;e775
	ld d,(hl)		;e776
	ld b,l			;e777
	jr nz,le7c7h		;e778
	ld b,c			;e77a
	ld d,d			;e77b
	ld b,e			;e77c
	ld c,a			;e77d
	ld d,00ah		;e77e
	dec bc			;e780
	djnz le787h		;e781
	ld d,b			;e783
	ld d,d			;e784
	ld c,a			;e785
	ld b,a			;e786
le787h:
	ld d,d			;e787
le788h:
	ld b,c			;e788
	ld c,l			;e789
	ld b,c			;e78a
le78bh:
	ld d,006h		;e78b
	ex af,af'		;e78d
	djnz le796h		;e78e
le790h:
	inc (hl)		;e790
	ld l,02eh		;e791
	ld l,02eh		;e793
	ld d,d			;e795
le796h:
	ld b,l			;e796
	ld b,h			;e797
	ld b,l			;e798
	ld b,(hl)		;e799
	ld c,c			;e79a
	ld c,(hl)		;e79b
	ld c,c			;e79c
	ld d,d			;e79d
	ld d,005h		;e79e
	ex af,af'		;e7a0
	djnz le7a8h		;e7a1
	inc sp			;e7a3
	ld l,02eh		;e7a4
	ld l,02eh		;e7a6
le7a8h:
	ld l,053h		;e7a8
	ld c,c			;e7aa
	ld c,(hl)		;e7ab
	ld b,e			;e7ac
	ld c,h			;e7ad
le7aeh:
	ld b,c			;e7ae
	ld c,c			;e7af
	ld d,d			;e7b0
	ld d,004h		;e7b1
	ex af,af'		;e7b3
	djnz $+6		;e7b4
	ld (02e2eh),a		;e7b6
	ld l,02eh		;e7b9
	ld l,04bh		;e7bb
	ld b,l			;e7bd
	ld c,l			;e7be
	ld d,b			;e7bf
	ld d,e			;e7c0
	ld d,h			;e7c1
	ld c,a			;e7c2
	ld c,(hl)		;e7c3
	ld d,003h		;e7c4
	ex af,af'		;e7c6
le7c7h:
	djnz le7cch		;e7c7
	ld sp,02e2eh		;e7c9
le7cch:
	ld l,02eh		;e7cc
	ld l,02eh		;e7ce
	ld d,h			;e7d0
	ld b,l			;e7d1
	ld b,e			;e7d2
	ld c,h			;e7d3
	ld b,c			;e7d4
	ld b,h			;e7d5
	ld c,a			;e7d6
	ld d,002h		;e7d7
	ex af,af'		;e7d9
	djnz le7deh		;e7da
	jr nc,$+48		;e7dc
le7deh:
	ld l,02eh		;e7de
	ld l,02eh		;e7e0
	ld l,045h		;e7e2
	ld c,l			;e7e4
	ld d,b			;e7e5
	ld b,l			;e7e6
	ld e,d			;e7e7
	ld b,c			;e7e8
	ld d,d			;e7e9
	ld d,000h		;e7ea
	ld a,(bc)		;e7ec
	djnz le7f6h		;e7ed
	ld d,e			;e7ef
	ld b,c			;e7f0
le7f1h:
	ld b,a			;e7f1
	ld b,c			;e7f2
	dec l			;e7f3
	dec l			;e7f4
	ld b,h			;e7f5
le7f6h:
	ld b,c			;e7f6
	ld d,d			;e7f7
	ld c,e			;e7f8
	ld d,00fh		;e7f9
	nop			;e7fb
	djnz $+4		;e7fc
	inc de			;e7fe
	ld bc,0207fh		;e7ff
	ld b,e			;e802
sub_e803h:
	ld c,a			;e803
	ld d,b			;e804
	ld e,c			;e805
	ld d,d			;e806
	ld c,c			;e807
	ld b,a			;e808
	ld c,b			;e809
	ld d,h			;e80a
	jr nz,$+86		;e80b
	ld d,d			;e80d
	ld c,c			;e80e
	ld d,h			;e80f
	ld c,a			;e810
	ld c,(hl)		;e811
	jr nz,le867h		;e812
	ld c,a			;e814
	ld b,(hl)		;e815
	ld d,h			;e816
	ld d,a			;e817
	ld b,c			;e818
	ld d,d			;e819
	ld b,l			;e81a
	jr nz,le84eh		;e81b
	add hl,sp		;e81d
	add hl,sp		;e81e
	jr nc,$+1		;e81f
le821h:
	ld de,le82fh		;e821
	ld h,000h		;e824
	ld l,a			;e826
	add hl,hl		;e827
	add hl,de		;e828
le829h:
	ld a,(hl)		;e829
	inc hl			;e82a
le82bh:
	in a,(0feh)		;e82b
le82dh:
	and (hl)		;e82d
	ret			;e82e
le82fh:
	rst 30h			;e82f
	ld bc,002f7h		;e830
	rst 30h			;e833
	inc b			;e834
	rst 30h			;e835
	ex af,af'		;e836
	rst 30h			;e837
	djnz le829h		;e838
	djnz le82bh		;e83a
	ex af,af'		;e83c
	rst 28h			;e83d
	inc b			;e83e
	rst 28h			;e83f
	ld (bc),a		;e840
	rst 28h			;e841
	ld bc,001fbh		;e842
	ei			;e845
	ld (bc),a		;e846
	ei			;e847
	inc b			;e848
	ei			;e849
	ex af,af'		;e84a
	ei			;e84b
	djnz le82dh		;e84c
le84eh:
	djnz le82fh		;e84e
	ex af,af'		;e850
	rst 18h			;e851
	inc b			;e852
	rst 18h			;e853
	ld (bc),a		;e854
	rst 18h			;e855
	ld bc,001fdh		;e856
	defb 0fdh,002h,0fdh ;illegal sequence	;e859
	inc b			;e85c
	defb 0fdh,008h,0fdh ;illegal sequence	;e85d
	djnz le821h		;e860
	djnz $-63		;e862
	ex af,af'		;e864
	cp a			;e865
	inc b			;e866
le867h:
	cp a			;e867
	ld (bc),a		;e868
	cp a			;e869
	ld bc,001feh		;e86a
	cp 002h			;e86d
	cp 004h			;e86f
	cp 008h			;e871
	cp 010h			;e873
	ld a,a			;e875
	djnz $+129		;e876
	ex af,af'		;e878
	ld a,a			;e879
	inc b			;e87a
	ld a,a			;e87b
	ld (bc),a		;e87c
	ld a,a			;e87d
	ld bc,0093eh		;e87e
	call le821h		;e881
	ret z			;e884
	ld a,003h		;e885
	call le821h		;e887
	call z,sub_e939h	;e88a
	ld a,001h		;e88d
	call le821h		;e88f
	call z,sub_e8eeh	;e892
	ld a,000h		;e895
	call le821h		;e897
	call z,sub_e90ch	;e89a
	ld a,002h		;e89d
	call le821h		;e89f
	call z,sub_e920h	;e8a2
	jp 0e87fh		;e8a5
le8a8h:
	ld d,008h		;e8a8
	inc c			;e8aa
	ld b,c			;e8ab
	ld d,d			;e8ac
	ld d,d			;e8ad
	ld c,c			;e8ae
	ld b,d			;e8af
	ld b,c			;e8b0
	jr nz,$+1		;e8b1
le8b3h:
	ld d,008h		;e8b3
	inc c			;e8b5
	ld b,c			;e8b6
	ld b,d			;e8b7
	ld b,c			;e8b8
	ld c,d			;e8b9
	ld c,a			;e8ba
	jr nz,le8ddh		;e8bb
	rst 38h			;e8bd
le8beh:
	ld d,008h		;e8be
	inc c			;e8c0
	ld b,h			;e8c1
	ld b,l			;e8c2
	ld d,d			;e8c3
	ld b,l			;e8c4
	ld b,e			;e8c5
	ld c,b			;e8c6
	ld b,c			;e8c7
	rst 38h			;e8c8
le8c9h:
	ld d,008h		;e8c9
	dec bc			;e8cb
	ld c,c			;e8cc
	ld e,d			;e8cd
	ld d,c			;e8ce
	ld d,l			;e8cf
	ld c,c			;e8d0
	ld b,l			;e8d1
	ld d,d			;e8d2
	ld b,h			;e8d3
	ld b,c			;e8d4
	rst 38h			;e8d5
le8d6h:
	ld d,008h		;e8d6
	dec bc			;e8d8
	jr nz,le91fh		;e8d9
	ld c,c			;e8db
	ld d,e			;e8dc
le8ddh:
	ld d,b			;e8dd
	ld b,c			;e8de
	ld d,d			;e8df
	ld c,a			;e8e0
	jr nz,$+1		;e8e1
le8e3h:
	ld d,008h		;e8e3
	inc c			;e8e5
	jr nz,le908h		;e8e6
	jr nz,$+34		;e8e8
	jr nz,sub_e90ch		;e8ea
	jr nz,$+1		;e8ec
sub_e8eeh:
	ld a,0ffh		;e8ee
	ld (06a8ah),a		;e8f0
	ld hl,le907h		;e8f3
	ld de,06a85h		;e8f6
	ld bc,00005h		;e8f9
	ldir			;e8fc
	call sub_e9f5h		;e8fe
	ret			;e901
le902h:
	ld a,(bc)		;e902
	inc d			;e903
	inc de			;e904
	ld (de),a		;e905
	dec h			;e906
le907h:
	ex af,af'		;e907
le908h:
	inc b			;e908
	ld bc,01002h		;e909
sub_e90ch:
	ld a,000h		;e90c
	ld (06a8ah),a		;e90e
	ld hl,le902h		;e911
	ld de,06a85h		;e914
	ld bc,00005h		;e917
	ldir			;e91a
	call sub_e9f5h		;e91c
le91fh:
	ret			;e91f
sub_e920h:
	ld hl,le934h		;e920
	ld de,06a85h		;e923
	ld bc,00005h		;e926
	ldir			;e929
	call sub_e9f5h		;e92b
	ld a,000h		;e92e
	ld (06a8ah),a		;e930
	ret			;e933
le934h:
	ex af,af'		;e934
	rlca			;e935
	ld b,005h		;e936
	add hl,bc		;e938
sub_e939h:
	ld a,000h		;e939
	ld (06a8ah),a		;e93b
	ld hl,le8a8h		;e93e
	call sub_e721h		;e941
	call sub_e9ddh		;e944
	call sub_e9ddh		;e947
le94ah:
	call sub_ea0dh		;e94a
	cp 003h			;e94d
	jr z,le94ah		;e94f
	ld (06a85h),a		;e951
	ld d,a			;e954
	push de			;e955
	call sub_e9f5h		;e956
	ld hl,le8b3h		;e959
	call sub_e721h		;e95c
	call sub_e9ddh		;e95f
	call sub_e9ddh		;e962
	pop de			;e965
le966h:
	push de			;e966
	call sub_ea0dh		;e967
	pop de			;e96a
	cp d			;e96b
	jr z,le966h		;e96c
	ld (06a86h),a		;e96e
	ld d,a			;e971
	push de			;e972
	call sub_e9f5h		;e973
	ld hl,le8beh		;e976
	call sub_e721h		;e979
	call sub_e9ddh		;e97c
	call sub_e9ddh		;e97f
	pop de			;e982
le983h:
	push de			;e983
	call sub_ea0dh		;e984
	pop de			;e987
	cp d			;e988
	jr z,le983h		;e989
	ld (06a87h),a		;e98b
	ld d,a			;e98e
	push de			;e98f
	call sub_e9f5h		;e990
	ld hl,le8c9h		;e993
	call sub_e721h		;e996
	call sub_e9ddh		;e999
	call sub_e9ddh		;e99c
	pop de			;e99f
le9a0h:
	push de			;e9a0
	call sub_ea0dh		;e9a1
	pop de			;e9a4
	cp d			;e9a5
	jr z,le9a0h		;e9a6
	ld (06a88h),a		;e9a8
	ld d,a			;e9ab
	push de			;e9ac
	call sub_e9f5h		;e9ad
	ld hl,le8d6h		;e9b0
	call sub_e721h		;e9b3
	call sub_e9ddh		;e9b6
	call sub_e9ddh		;e9b9
	pop de			;e9bc
le9bdh:
	push de			;e9bd
	call sub_ea0dh		;e9be
	pop de			;e9c1
	cp d			;e9c2
	jr z,le9bdh		;e9c3
	ld (06a89h),a		;e9c5
	call sub_e9f5h		;e9c8
	ld hl,le8e3h		;e9cb
	call sub_e721h		;e9ce
	ld hl,06a85h		;e9d1
	ld de,le902h		;e9d4
	ld bc,00005h		;e9d7
	ldir			;e9da
	ret			;e9dc
sub_e9ddh:
	ld hl,04800h		;e9dd
	ld b,008h		;e9e0
le9e2h:
	push hl			;e9e2
	ld c,020h		;e9e3
le9e5h:
	ld a,(hl)		;e9e5
	ld d,a			;e9e6
	and a			;e9e7
	rr a			;e9e8
	or d			;e9ea
	ld (hl),a		;e9eb
	inc hl			;e9ec
	dec c			;e9ed
	jr nz,le9e5h		;e9ee
	pop hl			;e9f0
	inc h			;e9f1
	djnz le9e2h		;e9f2
	ret			;e9f4
sub_e9f5h:
	ld b,01eh		;e9f5
	ld hl,0000ah		;e9f7
	ld de,00014h		;e9fa
le9fdh:
	push bc			;e9fd
	push hl			;e9fe
	push de			;e9ff
lea00h:
	call 003b5h		;ea00
	pop de			;ea03
	pop hl			;ea04
	pop bc			;ea05
	inc hl			;ea06
	inc hl			;ea07
	inc hl			;ea08
	inc hl			;ea09
	djnz le9fdh		;ea0a
	ret			;ea0c
sub_ea0dh:
	ld b,028h		;ea0d
	ld a,000h		;ea0f
lea11h:
	push bc			;ea11
	push af			;ea12
	call le821h		;ea13
	jr z,lea1fh		;ea16
	pop af			;ea18
	pop bc			;ea19
	inc a			;ea1a
	djnz lea11h		;ea1b
	jr sub_ea0dh		;ea1d
lea1fh:
	pop af			;ea1f
	pop bc			;ea20
	ret			;ea21
	nop			;ea22
	nop			;ea23
	nop			;ea24
	nop			;ea25
	nop			;ea26
	nop			;ea27
	nop			;ea28
	nop			;ea29
	nop			;ea2a
	nop			;ea2b
	nop			;ea2c
	nop			;ea2d
	nop			;ea2e
	nop			;ea2f
	nop			;ea30
	nop			;ea31
	nop			;ea32
	nop			;ea33
	nop			;ea34
	nop			;ea35
	nop			;ea36
	nop			;ea37
	nop			;ea38
	nop			;ea39
	nop			;ea3a
	nop			;ea3b
	nop			;ea3c
	nop			;ea3d
	nop			;ea3e
	nop			;ea3f
	nop			;ea40
	nop			;ea41
	nop			;ea42
	nop			;ea43
	nop			;ea44
	nop			;ea45
	nop			;ea46
	nop			;ea47
	nop			;ea48
	nop			;ea49
	nop			;ea4a
	nop			;ea4b
	nop			;ea4c
	nop			;ea4d
	nop			;ea4e
	nop			;ea4f
	nop			;ea50
	nop			;ea51
	nop			;ea52
	nop			;ea53
	nop			;ea54
	nop			;ea55
	nop			;ea56
lea57h:
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
	nop			;ea71
	nop			;ea72
	nop			;ea73
	nop			;ea74
	nop			;ea75
	nop			;ea76
	nop			;ea77
	nop			;ea78
	nop			;ea79
	nop			;ea7a
	nop			;ea7b
	nop			;ea7c
	nop			;ea7d
	nop			;ea7e
	nop			;ea7f
	nop			;ea80
	nop			;ea81
	nop			;ea82
	nop			;ea83
	nop			;ea84
	nop			;ea85
	nop			;ea86
	nop			;ea87
	nop			;ea88
	nop			;ea89
	nop			;ea8a
	nop			;ea8b
	nop			;ea8c
	nop			;ea8d
	nop			;ea8e
	nop			;ea8f
	nop			;ea90
	nop			;ea91
	nop			;ea92
	nop			;ea93
	nop			;ea94
	nop			;ea95
	nop			;ea96
	nop			;ea97
	nop			;ea98
	nop			;ea99
	nop			;ea9a
	nop			;ea9b
	nop			;ea9c
	nop			;ea9d
	nop			;ea9e
	nop			;ea9f
	nop			;eaa0
	nop			;eaa1
	nop			;eaa2
	nop			;eaa3
	nop			;eaa4
	nop			;eaa5
	nop			;eaa6
	nop			;eaa7
	nop			;eaa8
	nop			;eaa9
	nop			;eaaa
	nop			;eaab
	nop			;eaac
	nop			;eaad
	nop			;eaae
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
	nop			;eacd
	nop			;eace
	nop			;eacf
	nop			;ead0
	nop			;ead1
	nop			;ead2
	nop			;ead3
lead4h:
	nop			;ead4
	nop			;ead5
	nop			;ead6
	nop			;ead7
	nop			;ead8
	nop			;ead9
	nop			;eada
	nop			;eadb
	nop			;eadc
	nop			;eadd
	nop			;eade
	nop			;eadf
	nop			;eae0
	nop			;eae1
	nop			;eae2
	nop			;eae3
	nop			;eae4
	nop			;eae5
	nop			;eae6
	nop			;eae7
	nop			;eae8
	nop			;eae9
	nop			;eaea
	nop			;eaeb
leaech:
	nop			;eaec
	nop			;eaed
	nop			;eaee
	nop			;eaef
	nop			;eaf0
	nop			;eaf1
	nop			;eaf2
	nop			;eaf3
	nop			;eaf4
	nop			;eaf5
	nop			;eaf6
	nop			;eaf7
	nop			;eaf8
	nop			;eaf9
	nop			;eafa
	nop			;eafb
	nop			;eafc
	nop			;eafd
	nop			;eafe
	nop			;eaff
leb00h:
	nop			;eb00
	nop			;eb01
	nop			;eb02
	nop			;eb03
	nop			;eb04
	nop			;eb05
	nop			;eb06
	nop			;eb07
	nop			;eb08
	nop			;eb09
	nop			;eb0a
	nop			;eb0b
	nop			;eb0c
	nop			;eb0d
	nop			;eb0e
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
	nop			;eb42
	nop			;eb43
	nop			;eb44
	nop			;eb45
	nop			;eb46
	nop			;eb47
	nop			;eb48
	nop			;eb49
	nop			;eb4a
	nop			;eb4b
	nop			;eb4c
	nop			;eb4d
	nop			;eb4e
	nop			;eb4f
	nop			;eb50
	nop			;eb51
	nop			;eb52
	nop			;eb53
	nop			;eb54
	nop			;eb55
	nop			;eb56
	nop			;eb57
	nop			;eb58
	nop			;eb59
	nop			;eb5a
	nop			;eb5b
	nop			;eb5c
	nop			;eb5d
	nop			;eb5e
	nop			;eb5f
	nop			;eb60
	nop			;eb61
	nop			;eb62
	nop			;eb63
	nop			;eb64
	nop			;eb65
	nop			;eb66
	nop			;eb67
	nop			;eb68
	nop			;eb69
	nop			;eb6a
	nop			;eb6b
	nop			;eb6c
	nop			;eb6d
	nop			;eb6e
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
	nop			;ebaf
	nop			;ebb0
	nop			;ebb1
	nop			;ebb2
	nop			;ebb3
	nop			;ebb4
	nop			;ebb5
	nop			;ebb6
	nop			;ebb7
	nop			;ebb8
	nop			;ebb9
	nop			;ebba
	nop			;ebbb
	nop			;ebbc
	nop			;ebbd
	nop			;ebbe
	nop			;ebbf
	nop			;ebc0
	nop			;ebc1
	nop			;ebc2
	nop			;ebc3
	nop			;ebc4
	nop			;ebc5
	nop			;ebc6
	nop			;ebc7
	nop			;ebc8
	nop			;ebc9
	nop			;ebca
	nop			;ebcb
	nop			;ebcc
	nop			;ebcd
	nop			;ebce
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
sub_ebedh:
	nop			;ebed
	nop			;ebee
	nop			;ebef
	nop			;ebf0
	nop			;ebf1
	nop			;ebf2
sub_ebf3h:
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
	nop			;ebfe
	nop			;ebff
	nop			;ec00
sub_ec01h:
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
	nop			;ec10
	nop			;ec11
	nop			;ec12
	nop			;ec13
	nop			;ec14
	nop			;ec15
	nop			;ec16
	nop			;ec17
	nop			;ec18
	nop			;ec19
	nop			;ec1a
	nop			;ec1b
	nop			;ec1c
	nop			;ec1d
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
lecb1h:
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
led00h:
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
	nop			;ed11
	nop			;ed12
	nop			;ed13
	nop			;ed14
	nop			;ed15
	nop			;ed16
	nop			;ed17
	nop			;ed18
	nop			;ed19
	nop			;ed1a
	nop			;ed1b
	nop			;ed1c
	nop			;ed1d
	nop			;ed1e
	nop			;ed1f
	nop			;ed20
	nop			;ed21
	nop			;ed22
	nop			;ed23
	nop			;ed24
	nop			;ed25
	nop			;ed26
	nop			;ed27
	nop			;ed28
	nop			;ed29
	nop			;ed2a
	nop			;ed2b
	nop			;ed2c
	nop			;ed2d
	nop			;ed2e
	nop			;ed2f
	nop			;ed30
	nop			;ed31
	nop			;ed32
	nop			;ed33
	nop			;ed34
	nop			;ed35
	nop			;ed36
	nop			;ed37
	nop			;ed38
	nop			;ed39
	nop			;ed3a
	nop			;ed3b
	nop			;ed3c
	nop			;ed3d
	nop			;ed3e
	nop			;ed3f
	nop			;ed40
	nop			;ed41
	nop			;ed42
	nop			;ed43
	nop			;ed44
	nop			;ed45
	nop			;ed46
	nop			;ed47
	nop			;ed48
	nop			;ed49
	nop			;ed4a
	nop			;ed4b
	nop			;ed4c
	nop			;ed4d
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
	nop			;ed6b
	nop			;ed6c
	nop			;ed6d
	nop			;ed6e
	nop			;ed6f
	nop			;ed70
	nop			;ed71
	nop			;ed72
	nop			;ed73
	nop			;ed74
	nop			;ed75
	nop			;ed76
	nop			;ed77
	nop			;ed78
	nop			;ed79
	nop			;ed7a
	nop			;ed7b
	nop			;ed7c
	nop			;ed7d
	nop			;ed7e
	nop			;ed7f
	nop			;ed80
	nop			;ed81
	nop			;ed82
	nop			;ed83
	nop			;ed84
	nop			;ed85
	nop			;ed86
	nop			;ed87
	nop			;ed88
	nop			;ed89
	nop			;ed8a
	nop			;ed8b
	nop			;ed8c
	nop			;ed8d
	nop			;ed8e
	nop			;ed8f
	nop			;ed90
	nop			;ed91
	nop			;ed92
	nop			;ed93
	nop			;ed94
	nop			;ed95
	nop			;ed96
	nop			;ed97
	nop			;ed98
	nop			;ed99
	nop			;ed9a
	nop			;ed9b
	nop			;ed9c
	nop			;ed9d
	nop			;ed9e
	nop			;ed9f
	nop			;eda0
	nop			;eda1
	nop			;eda2
	nop			;eda3
	nop			;eda4
	nop			;eda5
	nop			;eda6
	nop			;eda7
	nop			;eda8
	nop			;eda9
	nop			;edaa
	nop			;edab
	nop			;edac
	nop			;edad
	nop			;edae
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
	nop			;edd3
	nop			;edd4
	nop			;edd5
	nop			;edd6
	nop			;edd7
	nop			;edd8
	nop			;edd9
	nop			;edda
	nop			;eddb
	nop			;eddc
	nop			;eddd
	nop			;edde
	nop			;eddf
	nop			;ede0
	nop			;ede1
	nop			;ede2
	nop			;ede3
	nop			;ede4
	nop			;ede5
	nop			;ede6
	nop			;ede7
	nop			;ede8
	nop			;ede9
	nop			;edea
	nop			;edeb
	nop			;edec
	nop			;eded
	nop			;edee
	nop			;edef
	nop			;edf0
	nop			;edf1
	nop			;edf2
	nop			;edf3
	nop			;edf4
sub_edf5h:
	nop			;edf5
	nop			;edf6
	nop			;edf7
	nop			;edf8
	nop			;edf9
	nop			;edfa
	nop			;edfb
	nop			;edfc
	nop			;edfd
	nop			;edfe
	nop			;edff
lee00h:
	nop			;ee00
	nop			;ee01
	nop			;ee02
	nop			;ee03
	nop			;ee04
	nop			;ee05
	nop			;ee06
	nop			;ee07
	nop			;ee08
	nop			;ee09
	nop			;ee0a
	nop			;ee0b
	nop			;ee0c
	nop			;ee0d
	nop			;ee0e
	nop			;ee0f
	nop			;ee10
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
	nop			;ee42
	nop			;ee43
	nop			;ee44
	nop			;ee45
	nop			;ee46
	nop			;ee47
	nop			;ee48
	nop			;ee49
	nop			;ee4a
	nop			;ee4b
	nop			;ee4c
	nop			;ee4d
	nop			;ee4e
	nop			;ee4f
	nop			;ee50
	nop			;ee51
	nop			;ee52
	nop			;ee53
	nop			;ee54
	nop			;ee55
	nop			;ee56
	nop			;ee57
	nop			;ee58
	nop			;ee59
	nop			;ee5a
	nop			;ee5b
	nop			;ee5c
	nop			;ee5d
	nop			;ee5e
	nop			;ee5f
	nop			;ee60
	nop			;ee61
	nop			;ee62
	nop			;ee63
	nop			;ee64
	nop			;ee65
	nop			;ee66
	nop			;ee67
	nop			;ee68
	nop			;ee69
	nop			;ee6a
	nop			;ee6b
	nop			;ee6c
	nop			;ee6d
	nop			;ee6e
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
	nop			;eeaf
	nop			;eeb0
	nop			;eeb1
	nop			;eeb2
	nop			;eeb3
	nop			;eeb4
	nop			;eeb5
	nop			;eeb6
	nop			;eeb7
	nop			;eeb8
	nop			;eeb9
	nop			;eeba
	nop			;eebb
	nop			;eebc
	nop			;eebd
	nop			;eebe
	nop			;eebf
	nop			;eec0
	nop			;eec1
	nop			;eec2
	nop			;eec3
	nop			;eec4
	nop			;eec5
	nop			;eec6
	nop			;eec7
	nop			;eec8
	nop			;eec9
	nop			;eeca
	nop			;eecb
leecch:
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
sub_eeeah:
	nop			;eeea
	nop			;eeeb
leeech:
	nop			;eeec
	nop			;eeed
sub_eeeeh:
	nop			;eeee
	nop			;eeef
	nop			;eef0
	nop			;eef1
	nop			;eef2
sub_eef3h:
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
	nop			;eeff
lef00h:
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
	nop			;ef10
	nop			;ef11
	nop			;ef12
	nop			;ef13
	nop			;ef14
	nop			;ef15
	nop			;ef16
	nop			;ef17
	nop			;ef18
	nop			;ef19
	nop			;ef1a
	nop			;ef1b
	nop			;ef1c
	nop			;ef1d
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
	nop			;efff
lf000h:
	nop			;f000
sub_f001h:
	nop			;f001
	nop			;f002
lf003h:
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
	nop			;f00d
	nop			;f00e
	nop			;f00f
	nop			;f010
	nop			;f011
	nop			;f012
	nop			;f013
	nop			;f014
	nop			;f015
	nop			;f016
	nop			;f017
	nop			;f018
	nop			;f019
	nop			;f01a
	nop			;f01b
	nop			;f01c
	nop			;f01d
	nop			;f01e
	nop			;f01f
	nop			;f020
	nop			;f021
	nop			;f022
	nop			;f023
	nop			;f024
	nop			;f025
	nop			;f026
	nop			;f027
	nop			;f028
	nop			;f029
	nop			;f02a
	nop			;f02b
	nop			;f02c
	nop			;f02d
	nop			;f02e
	nop			;f02f
	nop			;f030
	nop			;f031
	nop			;f032
	nop			;f033
	nop			;f034
	nop			;f035
	nop			;f036
	nop			;f037
	nop			;f038
	nop			;f039
	nop			;f03a
	nop			;f03b
	nop			;f03c
	nop			;f03d
	nop			;f03e
	nop			;f03f
	nop			;f040
	nop			;f041
	nop			;f042
	nop			;f043
	nop			;f044
	nop			;f045
	nop			;f046
	nop			;f047
	nop			;f048
	nop			;f049
	nop			;f04a
	nop			;f04b
	nop			;f04c
	nop			;f04d
	nop			;f04e
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
	nop			;f061
lf062h:
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
	nop			;f072
	nop			;f073
	nop			;f074
	nop			;f075
	nop			;f076
	nop			;f077
	nop			;f078
	nop			;f079
	nop			;f07a
	nop			;f07b
	nop			;f07c
	nop			;f07d
	nop			;f07e
	nop			;f07f
	nop			;f080
	nop			;f081
	nop			;f082
	nop			;f083
	nop			;f084
	nop			;f085
	nop			;f086
	nop			;f087
	nop			;f088
	nop			;f089
	nop			;f08a
	nop			;f08b
	nop			;f08c
	nop			;f08d
	nop			;f08e
	nop			;f08f
	nop			;f090
	nop			;f091
	nop			;f092
	nop			;f093
	nop			;f094
	nop			;f095
	nop			;f096
	nop			;f097
	nop			;f098
	nop			;f099
	nop			;f09a
	nop			;f09b
	nop			;f09c
	nop			;f09d
	nop			;f09e
	nop			;f09f
	nop			;f0a0
	nop			;f0a1
	nop			;f0a2
	nop			;f0a3
	nop			;f0a4
	nop			;f0a5
	nop			;f0a6
	nop			;f0a7
	nop			;f0a8
	nop			;f0a9
	nop			;f0aa
	nop			;f0ab
	nop			;f0ac
	nop			;f0ad
	nop			;f0ae
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
	nop			;f0ba
	nop			;f0bb
	nop			;f0bc
	nop			;f0bd
	nop			;f0be
	nop			;f0bf
	nop			;f0c0
	nop			;f0c1
	nop			;f0c2
	nop			;f0c3
lf0c4h:
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
	nop			;f0d4
	nop			;f0d5
	nop			;f0d6
	nop			;f0d7
	nop			;f0d8
	nop			;f0d9
	nop			;f0da
	nop			;f0db
	nop			;f0dc
	nop			;f0dd
	nop			;f0de
	nop			;f0df
	nop			;f0e0
	nop			;f0e1
	nop			;f0e2
	nop			;f0e3
	nop			;f0e4
	nop			;f0e5
	nop			;f0e6
	nop			;f0e7
	nop			;f0e8
	nop			;f0e9
	nop			;f0ea
	nop			;f0eb
	nop			;f0ec
	nop			;f0ed
	nop			;f0ee
	nop			;f0ef
	nop			;f0f0
sub_f0f1h:
	nop			;f0f1
	nop			;f0f2
	nop			;f0f3
	nop			;f0f4
	nop			;f0f5
	nop			;f0f6
	nop			;f0f7
sub_f0f8h:
	nop			;f0f8
	nop			;f0f9
	nop			;f0fa
	nop			;f0fb
	nop			;f0fc
	nop			;f0fd
	nop			;f0fe
	nop			;f0ff
lf100h:
	nop			;f100
	nop			;f101
	nop			;f102
	nop			;f103
lf104h:
	nop			;f104
	nop			;f105
	nop			;f106
	nop			;f107
	nop			;f108
	nop			;f109
	nop			;f10a
	nop			;f10b
	nop			;f10c
	nop			;f10d
	nop			;f10e
	nop			;f10f
	nop			;f110
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
	nop			;f146
	nop			;f147
	nop			;f148
	nop			;f149
	nop			;f14a
	nop			;f14b
	nop			;f14c
	nop			;f14d
	nop			;f14e
	nop			;f14f
	nop			;f150
	nop			;f151
	nop			;f152
	nop			;f153
	nop			;f154
	nop			;f155
	nop			;f156
	nop			;f157
	nop			;f158
	nop			;f159
	nop			;f15a
	nop			;f15b
	nop			;f15c
	nop			;f15d
	nop			;f15e
	nop			;f15f
	nop			;f160
	nop			;f161
	nop			;f162
	nop			;f163
	nop			;f164
	nop			;f165
	nop			;f166
	nop			;f167
	nop			;f168
	nop			;f169
	nop			;f16a
	nop			;f16b
	nop			;f16c
	nop			;f16d
	nop			;f16e
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
	nop			;f1af
	nop			;f1b0
	nop			;f1b1
	nop			;f1b2
	nop			;f1b3
	nop			;f1b4
	nop			;f1b5
	nop			;f1b6
	nop			;f1b7
	nop			;f1b8
	nop			;f1b9
	nop			;f1ba
	nop			;f1bb
	nop			;f1bc
	nop			;f1bd
	nop			;f1be
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
	nop			;f1df
	nop			;f1e0
	nop			;f1e1
	nop			;f1e2
	nop			;f1e3
	nop			;f1e4
	nop			;f1e5
	nop			;f1e6
	nop			;f1e7
sub_f1e8h:
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
	nop			;f210
	nop			;f211
	nop			;f212
	nop			;f213
	nop			;f214
	nop			;f215
	nop			;f216
	nop			;f217
	nop			;f218
	nop			;f219
	nop			;f21a
	nop			;f21b
	nop			;f21c
	nop			;f21d
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
lf2cah:
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
lf2fah:
	nop			;f2fa
	nop			;f2fb
	nop			;f2fc
	nop			;f2fd
	nop			;f2fe
	nop			;f2ff
lf300h:
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
	nop			;f311
	nop			;f312
	nop			;f313
	nop			;f314
	nop			;f315
	nop			;f316
	nop			;f317
	nop			;f318
	nop			;f319
	nop			;f31a
	nop			;f31b
	nop			;f31c
	nop			;f31d
	nop			;f31e
	nop			;f31f
	nop			;f320
	nop			;f321
	nop			;f322
	nop			;f323
	nop			;f324
	nop			;f325
	nop			;f326
	nop			;f327
	nop			;f328
	nop			;f329
	nop			;f32a
	nop			;f32b
	nop			;f32c
	nop			;f32d
	nop			;f32e
	nop			;f32f
	nop			;f330
	nop			;f331
	nop			;f332
	nop			;f333
	nop			;f334
	nop			;f335
	nop			;f336
	nop			;f337
	nop			;f338
	nop			;f339
	nop			;f33a
	nop			;f33b
	nop			;f33c
	nop			;f33d
	nop			;f33e
	nop			;f33f
	nop			;f340
	nop			;f341
	nop			;f342
	nop			;f343
	nop			;f344
	nop			;f345
	nop			;f346
	nop			;f347
	nop			;f348
	nop			;f349
	nop			;f34a
	nop			;f34b
	nop			;f34c
	nop			;f34d
	nop			;f34e
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
	nop			;f372
	nop			;f373
	nop			;f374
	nop			;f375
	nop			;f376
	nop			;f377
	nop			;f378
	nop			;f379
	nop			;f37a
	nop			;f37b
	nop			;f37c
	nop			;f37d
	nop			;f37e
	nop			;f37f
	nop			;f380
	nop			;f381
	nop			;f382
	nop			;f383
	nop			;f384
	nop			;f385
	nop			;f386
	nop			;f387
	nop			;f388
	nop			;f389
	nop			;f38a
	nop			;f38b
	nop			;f38c
	nop			;f38d
	nop			;f38e
	nop			;f38f
	nop			;f390
	nop			;f391
	nop			;f392
	nop			;f393
	nop			;f394
	nop			;f395
	nop			;f396
	nop			;f397
	nop			;f398
	nop			;f399
	nop			;f39a
	nop			;f39b
	nop			;f39c
	nop			;f39d
	nop			;f39e
	nop			;f39f
	nop			;f3a0
	nop			;f3a1
	nop			;f3a2
	nop			;f3a3
	nop			;f3a4
	nop			;f3a5
	nop			;f3a6
	nop			;f3a7
	nop			;f3a8
	nop			;f3a9
	nop			;f3aa
	nop			;f3ab
	nop			;f3ac
	nop			;f3ad
	nop			;f3ae
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
	nop			;f3d4
	nop			;f3d5
	nop			;f3d6
	nop			;f3d7
	nop			;f3d8
	nop			;f3d9
	nop			;f3da
	nop			;f3db
	nop			;f3dc
	nop			;f3dd
	nop			;f3de
	nop			;f3df
	nop			;f3e0
	nop			;f3e1
	nop			;f3e2
	nop			;f3e3
	nop			;f3e4
lf3e5h:
	nop			;f3e5
	nop			;f3e6
	nop			;f3e7
	nop			;f3e8
	nop			;f3e9
	nop			;f3ea
	nop			;f3eb
	nop			;f3ec
	nop			;f3ed
	nop			;f3ee
lf3efh:
	nop			;f3ef
	nop			;f3f0
	nop			;f3f1
	nop			;f3f2
	nop			;f3f3
	nop			;f3f4
lf3f5h:
	nop			;f3f5
	nop			;f3f6
	nop			;f3f7
	nop			;f3f8
sub_f3f9h:
	nop			;f3f9
	nop			;f3fa
	nop			;f3fb
	nop			;f3fc
	nop			;f3fd
	nop			;f3fe
	nop			;f3ff
	nop			;f400
sub_f401h:
	nop			;f401
	nop			;f402
	nop			;f403
	nop			;f404
	nop			;f405
	nop			;f406
	nop			;f407
	nop			;f408
	nop			;f409
	nop			;f40a
	nop			;f40b
	nop			;f40c
	nop			;f40d
	nop			;f40e
	nop			;f40f
	nop			;f410
	nop			;f411
	nop			;f412
	nop			;f413
	nop			;f414
	nop			;f415
	nop			;f416
	nop			;f417
	nop			;f418
	nop			;f419
	nop			;f41a
	nop			;f41b
	nop			;f41c
	nop			;f41d
	nop			;f41e
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
	nop			;f43f
	nop			;f440
	nop			;f441
	nop			;f442
	nop			;f443
	nop			;f444
	nop			;f445
	nop			;f446
	nop			;f447
	nop			;f448
	nop			;f449
	nop			;f44a
	nop			;f44b
	nop			;f44c
	nop			;f44d
	nop			;f44e
	nop			;f44f
	nop			;f450
	nop			;f451
	nop			;f452
	nop			;f453
	nop			;f454
	nop			;f455
	nop			;f456
	nop			;f457
	nop			;f458
	nop			;f459
	nop			;f45a
	nop			;f45b
	nop			;f45c
	nop			;f45d
	nop			;f45e
	nop			;f45f
	nop			;f460
	nop			;f461
	nop			;f462
	nop			;f463
	nop			;f464
	nop			;f465
	nop			;f466
	nop			;f467
	nop			;f468
	nop			;f469
	nop			;f46a
	nop			;f46b
	nop			;f46c
	nop			;f46d
	nop			;f46e
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
	nop			;f4af
	nop			;f4b0
	nop			;f4b1
	nop			;f4b2
	nop			;f4b3
	nop			;f4b4
	nop			;f4b5
	nop			;f4b6
	nop			;f4b7
	nop			;f4b8
	nop			;f4b9
	nop			;f4ba
	nop			;f4bb
	nop			;f4bc
	nop			;f4bd
	nop			;f4be
	nop			;f4bf
	nop			;f4c0
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
sub_f4e8h:
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
lf4f6h:
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
lf500h:
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
	nop			;f510
	nop			;f511
	nop			;f512
	nop			;f513
	nop			;f514
	nop			;f515
	nop			;f516
	nop			;f517
	nop			;f518
	nop			;f519
	nop			;f51a
	nop			;f51b
	nop			;f51c
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
sub_f5fah:
	nop			;f5fa
	nop			;f5fb
	nop			;f5fc
	nop			;f5fd
	nop			;f5fe
	nop			;f5ff
lf600h:
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
	nop			;f611
	nop			;f612
	nop			;f613
	nop			;f614
	nop			;f615
	nop			;f616
	nop			;f617
	nop			;f618
	nop			;f619
	nop			;f61a
	nop			;f61b
	nop			;f61c
	nop			;f61d
	nop			;f61e
	nop			;f61f
	nop			;f620
	nop			;f621
	nop			;f622
	nop			;f623
	nop			;f624
	nop			;f625
	nop			;f626
	nop			;f627
	nop			;f628
	nop			;f629
	nop			;f62a
	nop			;f62b
	nop			;f62c
	nop			;f62d
	nop			;f62e
	nop			;f62f
	nop			;f630
	nop			;f631
	nop			;f632
	nop			;f633
	nop			;f634
	nop			;f635
	nop			;f636
	nop			;f637
	nop			;f638
	nop			;f639
	nop			;f63a
	nop			;f63b
	nop			;f63c
	nop			;f63d
	nop			;f63e
	nop			;f63f
	nop			;f640
	nop			;f641
	nop			;f642
	nop			;f643
	nop			;f644
	nop			;f645
	nop			;f646
	nop			;f647
	nop			;f648
	nop			;f649
	nop			;f64a
	nop			;f64b
	nop			;f64c
	nop			;f64d
	nop			;f64e
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
	nop			;f672
	nop			;f673
	nop			;f674
	nop			;f675
	nop			;f676
	nop			;f677
	nop			;f678
	nop			;f679
	nop			;f67a
	nop			;f67b
	nop			;f67c
	nop			;f67d
	nop			;f67e
	nop			;f67f
	nop			;f680
	nop			;f681
	nop			;f682
	nop			;f683
	nop			;f684
	nop			;f685
	nop			;f686
	nop			;f687
	nop			;f688
	nop			;f689
	nop			;f68a
	nop			;f68b
	nop			;f68c
	nop			;f68d
	nop			;f68e
	nop			;f68f
	nop			;f690
	nop			;f691
	nop			;f692
	nop			;f693
	nop			;f694
	nop			;f695
	nop			;f696
	nop			;f697
	nop			;f698
	nop			;f699
	nop			;f69a
	nop			;f69b
	nop			;f69c
	nop			;f69d
	nop			;f69e
	nop			;f69f
	nop			;f6a0
	nop			;f6a1
	nop			;f6a2
	nop			;f6a3
	nop			;f6a4
	nop			;f6a5
	nop			;f6a6
	nop			;f6a7
	nop			;f6a8
	nop			;f6a9
	nop			;f6aa
	nop			;f6ab
	nop			;f6ac
	nop			;f6ad
	nop			;f6ae
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
	nop			;f6ce
	nop			;f6cf
	nop			;f6d0
	nop			;f6d1
	nop			;f6d2
	nop			;f6d3
	nop			;f6d4
	nop			;f6d5
	nop			;f6d6
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
	nop			;f6e2
	nop			;f6e3
	nop			;f6e4
	nop			;f6e5
	nop			;f6e6
	nop			;f6e7
	nop			;f6e8
	nop			;f6e9
	nop			;f6ea
	nop			;f6eb
	nop			;f6ec
	nop			;f6ed
	nop			;f6ee
	nop			;f6ef
	nop			;f6f0
	nop			;f6f1
	nop			;f6f2
	nop			;f6f3
	nop			;f6f4
	nop			;f6f5
	nop			;f6f6
	nop			;f6f7
	nop			;f6f8
	nop			;f6f9
	nop			;f6fa
	nop			;f6fb
	nop			;f6fc
	nop			;f6fd
lf6feh:
	nop			;f6fe
	nop			;f6ff
lf700h:
	nop			;f700
	nop			;f701
	nop			;f702
	nop			;f703
	nop			;f704
	nop			;f705
	nop			;f706
	nop			;f707
	nop			;f708
	nop			;f709
	nop			;f70a
	nop			;f70b
	nop			;f70c
	nop			;f70d
	nop			;f70e
	nop			;f70f
	nop			;f710
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
	nop			;f73f
	nop			;f740
	nop			;f741
	nop			;f742
	nop			;f743
	nop			;f744
	nop			;f745
	nop			;f746
	nop			;f747
	nop			;f748
	nop			;f749
	nop			;f74a
	nop			;f74b
	nop			;f74c
	nop			;f74d
	nop			;f74e
	nop			;f74f
	nop			;f750
	nop			;f751
	nop			;f752
	nop			;f753
	nop			;f754
	nop			;f755
	nop			;f756
	nop			;f757
	nop			;f758
	nop			;f759
	nop			;f75a
	nop			;f75b
	nop			;f75c
	nop			;f75d
	nop			;f75e
	nop			;f75f
	nop			;f760
	nop			;f761
	nop			;f762
	nop			;f763
	nop			;f764
	nop			;f765
	nop			;f766
	nop			;f767
	nop			;f768
	nop			;f769
	nop			;f76a
	nop			;f76b
	nop			;f76c
	nop			;f76d
	nop			;f76e
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
sub_f77eh:
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
lf7ach:
	nop			;f7ac
	nop			;f7ad
	nop			;f7ae
	nop			;f7af
	nop			;f7b0
	nop			;f7b1
	nop			;f7b2
	nop			;f7b3
	nop			;f7b4
	nop			;f7b5
	nop			;f7b6
	nop			;f7b7
	nop			;f7b8
	nop			;f7b9
	nop			;f7ba
	nop			;f7bb
	nop			;f7bc
	nop			;f7bd
	nop			;f7be
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
lf7fbh:
	nop			;f7fb
	nop			;f7fc
	nop			;f7fd
sub_f7feh:
	nop			;f7fe
	nop			;f7ff
sub_f800h:
	nop			;f800
sub_f801h:
	nop			;f801
	nop			;f802
lf803h:
	nop			;f803
	nop			;f804
	nop			;f805
	nop			;f806
	nop			;f807
	nop			;f808
	nop			;f809
	nop			;f80a
	nop			;f80b
	nop			;f80c
	nop			;f80d
	nop			;f80e
	nop			;f80f
	nop			;f810
	nop			;f811
	nop			;f812
	nop			;f813
	nop			;f814
	nop			;f815
	nop			;f816
	nop			;f817
	nop			;f818
	nop			;f819
	nop			;f81a
	nop			;f81b
	nop			;f81c
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
	nop			;f839
	nop			;f83a
	nop			;f83b
lf83ch:
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
	nop			;f87d
	nop			;f87e
	nop			;f87f
	nop			;f880
	nop			;f881
	nop			;f882
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
lf890h:
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
	nop			;f8af
	nop			;f8b0
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
lf8e4h:
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
sub_f8f0h:
	nop			;f8f0
	nop			;f8f1
	nop			;f8f2
	nop			;f8f3
sub_f8f4h:
	nop			;f8f4
	nop			;f8f5
	nop			;f8f6
	nop			;f8f7
sub_f8f8h:
	nop			;f8f8
	nop			;f8f9
	nop			;f8fa
	nop			;f8fb
	nop			;f8fc
	nop			;f8fd
	nop			;f8fe
	nop			;f8ff
lf900h:
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
	nop			;f911
	nop			;f912
	nop			;f913
	nop			;f914
	nop			;f915
	nop			;f916
	nop			;f917
	nop			;f918
	nop			;f919
	nop			;f91a
	nop			;f91b
	nop			;f91c
	nop			;f91d
	nop			;f91e
	nop			;f91f
	nop			;f920
	nop			;f921
	nop			;f922
	nop			;f923
	nop			;f924
	nop			;f925
	nop			;f926
	nop			;f927
	nop			;f928
	nop			;f929
	nop			;f92a
	nop			;f92b
	nop			;f92c
	nop			;f92d
	nop			;f92e
	nop			;f92f
	nop			;f930
	nop			;f931
	nop			;f932
	nop			;f933
	nop			;f934
	nop			;f935
	nop			;f936
	nop			;f937
	nop			;f938
	nop			;f939
	nop			;f93a
	nop			;f93b
	nop			;f93c
	nop			;f93d
	nop			;f93e
	nop			;f93f
	nop			;f940
	nop			;f941
	nop			;f942
	nop			;f943
	nop			;f944
	nop			;f945
	nop			;f946
	nop			;f947
	nop			;f948
	nop			;f949
	nop			;f94a
	nop			;f94b
	nop			;f94c
	nop			;f94d
	nop			;f94e
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
	nop			;f971
	nop			;f972
	nop			;f973
	nop			;f974
	nop			;f975
	nop			;f976
	nop			;f977
	nop			;f978
	nop			;f979
	nop			;f97a
	nop			;f97b
	nop			;f97c
	nop			;f97d
	nop			;f97e
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
	nop			;f99d
	nop			;f99e
	nop			;f99f
	nop			;f9a0
	nop			;f9a1
	nop			;f9a2
	nop			;f9a3
	nop			;f9a4
	nop			;f9a5
	nop			;f9a6
	nop			;f9a7
	nop			;f9a8
	nop			;f9a9
	nop			;f9aa
	nop			;f9ab
	nop			;f9ac
	nop			;f9ad
	nop			;f9ae
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
	nop			;f9d4
	nop			;f9d5
	nop			;f9d6
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
	nop			;f9e2
	nop			;f9e3
	nop			;f9e4
	nop			;f9e5
	nop			;f9e6
	nop			;f9e7
	nop			;f9e8
	nop			;f9e9
	nop			;f9ea
	nop			;f9eb
	nop			;f9ec
	nop			;f9ed
	nop			;f9ee
	nop			;f9ef
	nop			;f9f0
	nop			;f9f1
	nop			;f9f2
	nop			;f9f3
	nop			;f9f4
lf9f5h:
	nop			;f9f5
	nop			;f9f6
	nop			;f9f7
	nop			;f9f8
	nop			;f9f9
	nop			;f9fa
	nop			;f9fb
	nop			;f9fc
	nop			;f9fd
lf9feh:
	nop			;f9fe
	nop			;f9ff
lfa00h:
	nop			;fa00
	nop			;fa01
	nop			;fa02
	nop			;fa03
	nop			;fa04
	nop			;fa05
	nop			;fa06
	nop			;fa07
	nop			;fa08
	nop			;fa09
	nop			;fa0a
	nop			;fa0b
	nop			;fa0c
	nop			;fa0d
	nop			;fa0e
	nop			;fa0f
	nop			;fa10
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
	nop			;fa48
	nop			;fa49
	nop			;fa4a
	nop			;fa4b
	nop			;fa4c
	nop			;fa4d
	nop			;fa4e
	nop			;fa4f
	nop			;fa50
	nop			;fa51
	nop			;fa52
	nop			;fa53
	nop			;fa54
	nop			;fa55
	nop			;fa56
	nop			;fa57
	nop			;fa58
	nop			;fa59
	nop			;fa5a
	nop			;fa5b
	nop			;fa5c
	nop			;fa5d
	nop			;fa5e
	nop			;fa5f
	nop			;fa60
	nop			;fa61
	nop			;fa62
	nop			;fa63
	nop			;fa64
	nop			;fa65
lfa66h:
	nop			;fa66
	nop			;fa67
	nop			;fa68
	nop			;fa69
	nop			;fa6a
	nop			;fa6b
	nop			;fa6c
	nop			;fa6d
	nop			;fa6e
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
lfa86h:
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
	nop			;faaf
	nop			;fab0
	nop			;fab1
	nop			;fab2
	nop			;fab3
	nop			;fab4
	nop			;fab5
	nop			;fab6
	nop			;fab7
	nop			;fab8
	nop			;fab9
	nop			;faba
	nop			;fabb
	nop			;fabc
	nop			;fabd
	nop			;fabe
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
lfaf6h:
	nop			;faf6
	nop			;faf7
	nop			;faf8
	nop			;faf9
	nop			;fafa
lfafbh:
	nop			;fafb
lfafch:
	nop			;fafc
lfafdh:
	nop			;fafd
	nop			;fafe
	nop			;faff
lfb00h:
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
	nop			;fb10
	nop			;fb11
	nop			;fb12
	nop			;fb13
	nop			;fb14
	nop			;fb15
	nop			;fb16
	nop			;fb17
	nop			;fb18
	nop			;fb19
	nop			;fb1a
	nop			;fb1b
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
	nop			;fbef
	nop			;fbf0
	nop			;fbf1
	nop			;fbf2
	nop			;fbf3
	nop			;fbf4
sub_fbf5h:
	nop			;fbf5
	nop			;fbf6
	nop			;fbf7
	nop			;fbf8
	nop			;fbf9
	nop			;fbfa
lfbfbh:
	nop			;fbfb
	nop			;fbfc
	nop			;fbfd
	nop			;fbfe
	nop			;fbff
sub_fc00h:
	nop			;fc00
lfc01h:
	nop			;fc01
	nop			;fc02
	nop			;fc03
lfc04h:
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
	nop			;fc11
	nop			;fc12
	nop			;fc13
	nop			;fc14
	nop			;fc15
	nop			;fc16
	nop			;fc17
lfc18h:
	nop			;fc18
	nop			;fc19
	nop			;fc1a
	nop			;fc1b
	nop			;fc1c
	nop			;fc1d
	nop			;fc1e
	nop			;fc1f
	nop			;fc20
	nop			;fc21
	nop			;fc22
	nop			;fc23
	nop			;fc24
	nop			;fc25
	nop			;fc26
	nop			;fc27
	nop			;fc28
	nop			;fc29
	nop			;fc2a
	nop			;fc2b
	nop			;fc2c
	nop			;fc2d
	nop			;fc2e
	nop			;fc2f
	nop			;fc30
	nop			;fc31
	nop			;fc32
	nop			;fc33
	nop			;fc34
	nop			;fc35
	nop			;fc36
	nop			;fc37
	nop			;fc38
	nop			;fc39
	nop			;fc3a
	nop			;fc3b
	nop			;fc3c
	nop			;fc3d
	nop			;fc3e
	nop			;fc3f
	nop			;fc40
	nop			;fc41
	nop			;fc42
	nop			;fc43
lfc44h:
	nop			;fc44
	nop			;fc45
	nop			;fc46
	nop			;fc47
	nop			;fc48
	nop			;fc49
	nop			;fc4a
	nop			;fc4b
	nop			;fc4c
	nop			;fc4d
	nop			;fc4e
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
lfc5eh:
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
	nop			;fc73
	nop			;fc74
	nop			;fc75
	nop			;fc76
	nop			;fc77
	nop			;fc78
	nop			;fc79
	nop			;fc7a
	nop			;fc7b
sub_fc7ch:
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
lfcb7h:
	nop			;fcb7
	nop			;fcb8
	nop			;fcb9
	nop			;fcba
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
lfcf0h:
	nop			;fcf0
	nop			;fcf1
	nop			;fcf2
	nop			;fcf3
sub_fcf4h:
	nop			;fcf4
	nop			;fcf5
	nop			;fcf6
	nop			;fcf7
	nop			;fcf8
	nop			;fcf9
	nop			;fcfa
lfcfbh:
	nop			;fcfb
sub_fcfch:
	nop			;fcfc
	nop			;fcfd
sub_fcfeh:
	nop			;fcfe
	nop			;fcff
lfd00h:
	nop			;fd00
	nop			;fd01
	nop			;fd02
	nop			;fd03
	nop			;fd04
	nop			;fd05
	nop			;fd06
lfd07h:
	nop			;fd07
	nop			;fd08
	nop			;fd09
	nop			;fd0a
	nop			;fd0b
	nop			;fd0c
	nop			;fd0d
	nop			;fd0e
	nop			;fd0f
	nop			;fd10
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
	nop			;fd6f
	nop			;fd70
	nop			;fd71
	nop			;fd72
	nop			;fd73
	nop			;fd74
	nop			;fd75
	nop			;fd76
sub_fd77h:
	nop			;fd77
	nop			;fd78
	nop			;fd79
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
lfd86h:
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
sub_fddeh:
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
	nop			;fdf4
	nop			;fdf5
	nop			;fdf6
	nop			;fdf7
	nop			;fdf8
	nop			;fdf9
sub_fdfah:
	nop			;fdfa
	nop			;fdfb
	nop			;fdfc
sub_fdfdh:
	nop			;fdfd
lfdfeh:
	nop			;fdfe
sub_fdffh:
	nop			;fdff
sub_fe00h:
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
	nop			;fe37
	nop			;fe38
	nop			;fe39
lfe3ah:
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
	nop			;fe87
	nop			;fe88
	nop			;fe89
	nop			;fe8a
	nop			;fe8b
	nop			;fe8c
	nop			;fe8d
	nop			;fe8e
sub_fe8fh:
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
lfef1h:
	nop			;fef1
	nop			;fef2
	nop			;fef3
	nop			;fef4
lfef5h:
	nop			;fef5
	nop			;fef6
	nop			;fef7
	nop			;fef8
	nop			;fef9
	nop			;fefa
	nop			;fefb
lfefch:
	nop			;fefc
sub_fefdh:
	nop			;fefd
sub_fefeh:
	nop			;fefe
sub_feffh:
	ld a,000h		;feff
	out (0feh),a		;ff01
	ld a,007h		;ff03
	ld (05c8dh),a		;ff05
	call 00d6bh		;ff08
	ld hl,05800h		;ff0b
	ld bc,00300h		;ff0e
lff11h:
	ld a,000h		;ff11
	ld (hl),a		;ff13
	inc hl			;ff14
	dec bc			;ff15
	ld a,b			;ff16
	or c			;ff17
lff18h:
	jr nz,lff11h		;ff18
	ld de,l6dd4h		;ff1a
	ld ix,04000h		;ff1d
	ld a,0ffh		;ff21
	scf			;ff23
	call 00556h		;ff24
	ld de,04f37h		;ff27
	ld ix,0afc8h		;ff2a
	ld a,0ffh		;ff2e
	scf			;ff30
	call 00556h		;ff31
lff34h:
	ld a,000h		;ff34
	out (0feh),a		;ff36
	ld hl,05800h		;ff38
	ld bc,00260h		;ff3b
lff3eh:
	ld a,000h		;ff3e
	ld (hl),a		;ff40
	inc hl			;ff41
	dec bc			;ff42
	ld a,b			;ff43
	or c			;ff44
	jr nz,lff3eh		;ff45
	jp laaeeh		;ff47
	di			;ff4a
	dec c			;ff4b
lff4ch:
	ld hl,0c617h		;ff4c
	ld e,040h		;ff4f
	sbc a,h			;ff51
	halt			;ff52
	dec de			;ff53
lff54h:
	inc bc			;ff54
	inc de			;ff55
	nop			;ff56
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
	nop			;ff67
	nop			;ff68
	inc a			;ff69
	ld b,d			;ff6a
	ld b,b			;ff6b
lff6ch:
	ld b,b			;ff6c
	ld b,d			;ff6d
	inc a			;ff6e
	nop			;ff6f
	nop			;ff70
	ld a,b			;ff71
	ld b,h			;ff72
	ld b,d			;ff73
lff74h:
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
lff7fh:
	nop			;ff7f
	nop			;ff80
lff81h:
	ld a,(hl)		;ff81
	ld b,b			;ff82
	ld a,h			;ff83
lff84h:
	ld b,b			;ff84
	ld b,b			;ff85
lff86h:
	ld b,b			;ff86
	nop			;ff87
	nop			;ff88
	inc a			;ff89
	ld b,d			;ff8a
	ld b,b			;ff8b
lff8ch:
	ld c,(hl)		;ff8c
	ld b,d			;ff8d
	inc a			;ff8e
	nop			;ff8f
lff90h:
	nop			;ff90
	ld b,d			;ff91
	ld b,d			;ff92
	ld a,(hl)		;ff93
lff94h:
	ld b,d			;ff94
	ld b,d			;ff95
	ld b,d			;ff96
	nop			;ff97
	nop			;ff98
	ld a,008h		;ff99
	ex af,af'		;ff9b
lff9ch:
	ex af,af'		;ff9c
	ex af,af'		;ff9d
	ld a,000h		;ff9e
	nop			;ffa0
	ld (bc),a		;ffa1
	ld (bc),a		;ffa2
	ld (bc),a		;ffa3
lffa4h:
	ld b,d			;ffa4
	ld b,d			;ffa5
	inc a			;ffa6
	nop			;ffa7
	nop			;ffa8
	ld b,h			;ffa9
	ld c,b			;ffaa
	ld (hl),b		;ffab
lffach:
	ld c,b			;ffac
	ld b,h			;ffad
	ld b,d			;ffWarning: Code might not be 8080 compatible!
Warning: Self modifying code detected!
ae
	nop			;ffaf
	nop			;ffb0
	ld b,b			;ffb1
	ld b,b			;ffb2
	ld b,b			;ffb3
lffb4h:
	ld b,b			;ffb4
	ld b,b			;ffb5
	ld a,(hl)		;ffb6
	nop			;ffb7
	nop			;ffb8
	ld b,d			;ffb9
	ld h,(hl)		;ffba
	ld e,d			;ffbb
lffbch:
	ld b,d			;ffbc
	ld b,d			;ffbd
	ld b,d			;ffbe
	nop			;ffbf
	nop			;ffc0
	ld b,d			;ffc1
	ld h,d			;ffc2
	ld d,d			;ffc3
	ld c,d			;ffc4
	ld b,(hl)		;ffc5
	ld b,d			;ffc6
	nop			;ffc7
	nop			;ffc8
	inc a			;ffc9
	ld b,d			;ffca
	ld b,d			;ffcb
lffcch:
	ld b,d			;ffcc
	ld b,d			;ffcd
	inc a			;ffce
	nop			;ffcf
	nop			;ffd0
	ld a,h			;ffd1
	ld b,d			;ffd2
	ld b,d			;ffd3
lffd4h:
	ld a,h			;ffd4
lffd5h:
	ld b,b			;ffd5
	ld b,b			;ffd6
	nop			;ffd7
lffd8h:
	nop			;ffd8
	inc a			;ffd9
	ld b,d			;ffda
	ld b,d			;ffdb
	ld d,d			;ffdc
	ld c,d			;ffdd
	inc a			;ffde
	nop			;ffdf
	nop			;ffe0
	ld a,h			;ffe1
	ld b,d			;ffe2
sub_ffe3h:
	ld b,d			;ffe3
	ld a,h			;ffe4
lffe5h:
	ld b,h			;ffe5
	ld b,d			;ffe6
	nop			;ffe7
	nop			;ffe8
	inc a			;ffe9
	ld b,b			;ffea
	inc a			;ffeb
lffech:
	ld (bc),a		;ffec
	ld b,d			;ffed
lffeeh:
	inc a			;ffee
lffefh:
	nop			;ffef
lfff0h:
	nop			;fff0
sub_fff1h:
	cp 010h			;fff1
	djnz $+18		;fff3
	djnz $+18		;fff5
lfff7h:
	nop			;fff7
	nop			;fff8
	ld b,d			;fff9
lfffah:
	ld b,d			;fffa
lfffbh:
	ld b,d			;fffb
lfffch:
	ld b,d			;fffc
lfffdh:
	ld b,d			;fffd
lfffeh:
	inc a			;fffe
lffffh:
	nop			;ffff
