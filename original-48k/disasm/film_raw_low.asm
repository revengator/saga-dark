; z80dasm 1.2.0
; command line: z80dasm -a -l -g 0x5DC0 /tmp/film_code1.bin

	org 05dc0h

	nop			;5dc0
	add hl,de		;5dc1
	ret p			;5dc2
	jr nz,l5dc5h		;5dc3
l5dc5h:
	nop			;5dc5
	nop			;5dc6
	nop			;5dc7
	nop			;5dc8
	nop			;5dc9
	rst 28h			;5dca
	defb 0fdh,000h,000h ;illegal sequence	;5dcb
	nop			;5dce
	ld b,b			;5dcf
	ld a,a			;5dd0
	ld a,a			;5dd1
	rst 38h			;5dd2
	sbc a,c			;5dd3
	add a,d			;5dd4
	ld (bc),a		;5dd5
	nop			;5dd6
	ld b,b			;5dd7
	sub b			;5dd8
	nop			;5dd9
	ld e,0c0h		;5dda
	rrca			;5ddc
	djnz l5e43h		;5ddd
	ld bc,la50ah		;5ddf
	ld (040aah),hl		;5de2
	nop			;5de5
	nop			;5de6
	ld a,0ffh		;5de7
	rst 28h			;5de9
	ex de,hl		;5dea
	add a,b			;5deb
	ld a,b			;5dec
	add a,b			;5ded
	cp a			;5dee
	cp 0ffh			;5def
	pop af			;5df1
	call pe,sub_7f05h	;5df2
	and b			;5df5
	add a,b			;5df6
	daa			;5df7
	ret po			;5df8
	djnz $+4		;5df9
	or c			;5dfb
	or 040h			;5dfc
	call nz,04a9ah		;5dfe
	nop			;5e01
	nop			;5e02
	nop			;5e03
	nop			;5e04
	nop			;5e05
	dec a			;5e06
	push af			;5e07
	jr nz,l5e19h		;5e08
	cp h			;5e0a
	xor a			;5e0b
	defb 0fdh,0f7h,0c7h ;illegal sequence	;5e0c
	defb 0fdh,0feh,0cbh ;illegal sequence	;5e0f
	ld b,c			;5e12
	ld e,c			;5e13
	ld d,c			;5e14
	ret m			;5e15
	nop			;5e16
	ret po			;5e17
	add a,b			;5e18
l5e19h:
	dec bc			;5e19
	ld bc,le6fch		;5e1a
	ld c,a			;5e1d
	nop			;5e1e
	call nc,sub_a0b2h	;5e1f
	add hl,bc		;5e22
	call pe,01e80h		;5e23
	ret p			;5e26
	ld (de),a		;5e27
	ld bc,lcbefh		;5e28
	ret z			;5e2b
	nop			;5e2c
	ld a,a			;5e2d
	rst 38h			;5e2e
	jp (hl)			;5e2f
	ret nz			;5e30
	ld d,l			;5e31
	ld d,b			;5e32
	ld h,c			;5e33
	ld h,b			;5e34
	ld a,h			;5e35
	nop			;5e36
	add a,d			;5e37
	adc a,d			;5e38
	xor c			;5e39
	or c			;5e3a
	ret po			;5e3b
	ld l,d			;5e3c
	add a,b			;5e3d
	ld l,045h		;5e3e
	ld e,l			;5e40
	ld d,b			;5e41
	nop			;5e42
l5e43h:
	and a			;5e43
	ld bc,022deh		;5e44
	ret po			;5e47
	rra			;5e48
	pop af			;5e49
	ld b,d			;5e4a
	xor d			;5e4b
	or b			;5e4c
	nop			;5e4d
	ret m			;5e4e
	ld bc,0fefdh		;5e4f
	ld a,a			;5e52
	rst 38h			;5e53
	rst 38h			;5e54
	defb 0fdh,004h,0ffh ;illegal sequence	;5e55
	rst 38h			;5e58
	rst 38h			;5e59
	rst 38h			;5e5a
	rst 38h			;5e5b
	rst 38h			;5e5c
	rst 38h			;5e5d
	rst 38h			;5e5e
	rst 38h			;5e5f
	rst 38h			;5e60
	rst 38h			;5e61
	rst 38h			;5e62
	rst 38h			;5e63
	rst 38h			;5e64
	rst 38h			;5e65
	rst 38h			;5e66
	rst 38h			;5e67
	rst 38h			;5e68
	rst 38h			;5e69
	rst 38h			;5e6a
	rst 38h			;5e6b
	rst 38h			;5e6c
	rst 38h			;5e6d
	rst 38h			;5e6e
	rst 38h			;5e6f
	rst 38h			;5e70
	rst 38h			;5e71
	rst 38h			;5e72
	rst 38h			;5e73
	rst 38h			;5e74
	rst 38h			;5e75
	rst 38h			;5e76
	jr $+26			;5e77
	jr $+26			;5e79
	jr $+26			;5e7b
	jr l5eefh		;5e7d
	ld (hl),b		;5e7f
	ld (hl),b		;5e80
	jr l5ed3h		;5e81
	jr l5e9dh		;5e83
	jr l5ee7h		;5e85
	jr l5ea1h		;5e87
	jr l5ea3h		;5e89
	ld (hl),b		;5e8b
	ld (hl),b		;5e8c
	ld (hl),b		;5e8d
	ld (hl),b		;5e8e
	ld (hl),b		;5e8f
	jr l5eaah		;5e90
	jr l5each		;5e92
	jr l5eaeh		;5e94
	jr l5ef0h		;5e96
	ld e,b			;5e98
	jr l5ef3h		;5e99
	jr $+90			;5e9b
l5e9dh:
	jr l5f0fh		;5e9d
	ld (hl),b		;5e9f
	ld e,b			;5ea0
l5ea1h:
	ld e,b			;5ea1
	ld d,b			;5ea2
l5ea3h:
	ld e,b			;5ea3
	jr l5f0eh		;5ea4
	ld h,b			;5ea6
	jr l5ec1h		;5ea7
	ld e,b			;5ea9
l5eaah:
	jr l5f1ch		;5eaa
l5each:
	ld (hl),d		;5eac
	ld (hl),d		;5ead
l5eaeh:
	ld (hl),b		;5eae
	jr nc,l5f09h		;5eaf
	jr c,l5f0bh		;5eb1
	ld d,b			;5eb3
	ld e,b			;5eb4
	ld e,b			;5eb5
	ld e,b			;5eb6
	jr l5f11h		;5eb7
	jr l5f13h		;5eb9
	ld e,b			;5ebb
	ld e,b			;5ebc
	ld e,b			;5ebd
	ld e,b			;5ebe
	ld (hl),b		;5ebf
	ld e,b			;5ec0
l5ec1h:
	jr l5f13h		;5ec1
	ld e,b			;5ec3
	jr l5edeh		;5ec4
	ld h,b			;5ec6
	jr l5f21h		;5ec7
	ld e,b			;5ec9
	ld e,b			;5eca
	ld e,b			;5ecb
	ld (hl),b		;5ecc
	ld (hl),d		;5ecd
	ld (hl),b		;5ece
	ld e,b			;5ecf
	ld e,b			;5ed0
	ld e,b			;5ed1
	ld e,b			;5ed2
l5ed3h:
	ld e,b			;5ed3
	ld e,b			;5ed4
	jr l5eefh		;5ed5
	jr $+26			;5ed7
	jr l5ef3h		;5ed9
	jr $+26			;5edb
	ld e,b			;5edd
l5edeh:
	ld e,b			;5ede
	jr nc,l5f39h		;5edf
	jr l5f33h		;5ee1
	ld e,b			;5ee3
	ld e,b			;5ee4
	ld e,b			;5ee5
	ld e,b			;5ee6
l5ee7h:
	ld sp,01858h		;5ee7
	ld e,b			;5eea
	ld e,b			;5eeb
	ld (hl),b		;5eec
	ld (hl),d		;5eed
	ld e,b			;5eee
l5eefh:
	ld e,b			;5eef
l5ef0h:
	jr l5f0ah		;5ef0
	ld e,b			;5ef2
l5ef3h:
	ld e,b			;5ef3
	jr c,l5f2eh		;5ef4
	jr l5f30h		;5ef6
	jr c,l5f32h		;5ef8
	jr c,$+58		;5efa
	jr c,$+58		;5efc
	ld e,b			;5efe
	ld e,b			;5eff
	ld e,b			;5f00
	ld e,b			;5f01
	ld e,b			;5f02
	ld e,b			;5f03
	ld e,b			;5f04
	ld e,b			;5f05
	ld sp,05831h		;5f06
l5f09h:
	ld e,b			;5f09
l5f0ah:
	ld e,b			;5f0a
l5f0bh:
	ld e,b			;5f0b
	ld e,b			;5f0c
	ld (hl),b		;5f0d
l5f0eh:
	ld e,b			;5f0e
l5f0fh:
	jr $+26			;5f0f
l5f11h:
	jr l5f2bh		;5f11
l5f13h:
	jr l5f4dh		;5f13
	jr c,l5f4fh		;5f15
	ld a,b			;5f17
	ld a,b			;5f18
	ld a,b			;5f19
	ld a,b			;5f1a
	ld a,b			;5f1b
l5f1ch:
	jr c,$+58		;5f1c
	jr c,l5f58h		;5f1e
	ld e,b			;5f20
l5f21h:
	ld e,b			;5f21
	ld e,b			;5f22
	ld e,b			;5f23
	ld e,b			;5f24
	ld e,b			;5f25
	ld e,b			;5f26
	ld sp,05858h		;5f27
	ld e,b			;5f2a
l5f2bh:
	ld e,b			;5f2b
	ld e,b			;5f2c
	ld e,c			;5f2d
l5f2eh:
	add hl,sp		;5f2e
	ld e,b			;5f2f
l5f30h:
	add hl,hl		;5f30
	ld e,b			;5f31
l5f32h:
	ld e,b			;5f32
l5f33h:
	jr l5f4dh		;5f33
	jr c,l5f6fh		;5f35
	ld a,b			;5f37
	ld a,b			;5f38
l5f39h:
	ld a,b			;5f39
	ld a,b			;5f3a
	ld a,b			;5f3b
	ld a,b			;5f3c
	ld a,b			;5f3d
	jr c,l5f98h		;5f3e
	ld e,b			;5f40
	ld e,b			;5f41
l5f42h:
	ld e,b			;5f42
	ld e,b			;5f43
	ld e,b			;5f44
	ld e,b			;5f45
	ld e,b			;5f46
	ld e,b			;5f47
	ld e,b			;5f48
	ld e,b			;5f49
	ld e,b			;5f4a
	ld e,b			;5f4b
	ld e,b			;5f4c
l5f4dh:
	add hl,sp		;5f4d
	add hl,sp		;5f4e
l5f4fh:
	add hl,sp		;5f4f
	add hl,hl		;5f50
	add hl,hl		;5f51
	ld (03232h),a		;5f52
	ld (l7832h),a		;5f55
l5f58h:
	ld a,b			;5f58
	ld a,b			;5f59
	ld a,b			;5f5a
	ld a,b			;5f5b
	ld a,b			;5f5c
	jr c,$+106		;5f5d
	jr z,l5fc9h		;5f5f
	ld e,b			;5f61
	ld e,b			;5f62
	ld e,b			;5f63
	ld e,b			;5f64
	ld e,b			;5f65
	ld e,b			;5f66
	ld e,b			;5f67
	ld e,b			;5f68
	ld e,b			;5f69
	ld e,b			;5f6a
	ld e,b			;5f6b
	add hl,sp		;5f6c
	add hl,sp		;5f6d
	add hl,sp		;5f6e
l5f6fh:
	add hl,sp		;5f6f
	jr z,l5fa3h		;5f70
	ld (03232h),a		;5f72
	ld (l7832h),a		;5f75
	ld a,b			;5f78
	ld a,b			;5f79
	ld a,b			;5f7a
	ld a,b			;5f7b
	jr c,l5fb6h		;5f7c
	ld l,b			;5f7e
	ld l,b			;5f7f
	ld l,b			;5f80
	ld l,b			;5f81
	jr z,$+42		;5f82
	jr z,l5faeh		;5f84
	jr nc,l5fa0h		;5f86
	jr $+26			;5f88
	jr $+52			;5f8a
	ld (03232h),a		;5f8c
	ld (03232h),a		;5f8f
	ld (03232h),a		;5f92
	ld (l7832h),a		;5f95
l5f98h:
	ld a,b			;5f98
	ld a,b			;5f99
	ld a,b			;5f9a
	jr c,l5fd5h		;5f9b
	ld sp,03131h		;5f9d
l5fa0h:
	ld sp,03131h		;5fa0
l5fa3h:
	ld sp,03131h		;5fa3
	jr nc,l5fdah		;5fa6
	ld (03232h),a		;5fa8
	ld (03232h),a		;5fab
l5faeh:
	ld (03030h),a		;5fae
	jr nc,$+52		;5fb1
	ld (03232h),a		;5fb3
l5fb6h:
	ld (03838h),a		;5fb6
	jr c,l5ff3h		;5fb9
	jr c,l5fedh		;5fbb
	ld (03232h),a		;5fbd
	ld (03134h),a		;5fc0
	ld (03232h),a		;5fc3
	ld (03232h),a		;5fc6
l5fc9h:
	ld (03030h),a		;5fc9
	ld (03232h),a		;5fcc
	jr nc,l6041h		;5fcf
	jr nc,$+50		;5fd1
	jr nc,l6007h		;5fd3
l5fd5h:
	ld (02032h),a		;5fd5
	jr nz,l6012h		;5fd8
l5fdah:
	jr c,$+50		;5fda
	jr nc,$+52		;5fdc
	ld (03232h),a		;5fde
	ld sp,03131h		;5fe1
	ld (03232h),a		;5fe4
	jr nc,l6019h		;5fe7
	jr nc,l601bh		;5fe9
	jr nc,l601dh		;5feb
l5fedh:
	ld (l7030h),a		;5fed
	ld (hl),b		;5ff0
	jr nc,l6063h		;5ff1
l5ff3h:
	jr nc,l6027h		;5ff3
	ld (02032h),a		;5ff5
	jr nc,$+50		;5ff8
	jr nc,l6034h		;5ffa
	jr c,l6036h		;5ffc
	ld (03278h),a		;5ffe
	ld (03231h),a		;6001
	ld (03032h),a		;6004
l6007h:
	jr nc,l603bh		;6007
	jr nc,l603bh		;6009
	jr nc,l603dh		;600b
	jr nc,$+50		;600d
	jr nc,l6081h		;600f
	ld (hl),b		;6011
l6012h:
	jr nc,l6044h		;6012
	jr nc,l6048h		;6014
	ld (03838h),a		;6016
l6019h:
	jr c,l6053h		;6019
l601bh:
	jr c,l6055h		;601b
l601dh:
	jr c,l6051h		;601d
	ld a,b			;601f
l6020h:
	ld a,b			;6020
	ld (03032h),a		;6021
	ld (03030h),a		;6024
l6027h:
	jr nc,$+52		;6027
	jr nc,$+50		;6029
	ld (03030h),a		;602b
	jr nc,l6060h		;602e
	jr nc,$+50		;6030
	jr nc,$+50		;6032
l6034h:
	jr nc,$+52		;6034
l6036h:
	ld (03838h),a		;6036
	jr c,$+58		;6039
l603bh:
	jr c,l6075h		;603b
l603dh:
	ld (l7832h),a		;603d
	ld a,b			;6040
l6041h:
	ld (03232h),a		;6041
l6044h:
	jr nc,$+50		;6044
	jr nc,l607ah		;6046
l6048h:
	jr nc,l607ah		;6048
	ld (03232h),a		;604a
	jr nc,l607fh		;604d
	jr nc,l6081h		;604f
l6051h:
	jr nc,l6083h		;6051
l6053h:
	jr nc,l6085h		;6053
l6055h:
	ld (03832h),a		;6055
	jr c,l6092h		;6058
	jr c,$+58		;605a
	jr c,l608eh		;605c
	jr nc,l6092h		;605e
l6060h:
	ld (03232h),a		;6060
l6063h:
	ld (03232h),a		;6063
	ld (03030h),a		;6066
	ld (03232h),a		;6069
	ld (03232h),a		;606c
	ld (03232h),a		;606f
l6072h:
	ld (03232h),a		;6072
l6075h:
	ld (00032h),a		;6075
	rst 38h			;6078
	rst 38h			;6079
l607ah:
	rst 38h			;607a
	rst 38h			;607b
	rst 38h			;607c
	rst 38h			;607d
	rst 38h			;607e
l607fh:
	rst 38h			;607f
	rst 38h			;6080
l6081h:
	nop			;6081
	nop			;6082
l6083h:
	nop			;6083
	nop			;6084
l6085h:
	nop			;6085
	nop			;6086
	nop			;6087
	rst 38h			;6088
	rst 38h			;6089
	rst 38h			;608a
	rst 38h			;608b
	rst 38h			;608c
	rst 38h			;608d
l608eh:
	rst 38h			;608e
	cp 0a8h			;608f
	ld (bc),a		;6091
l6092h:
	add a,e			;6092
	call po,00680h		;6093
	xor b			;6096
	add a,b			;6097
	rst 38h			;6098
	rst 38h			;6099
	rst 38h			;609a
	rst 38h			;609b
	rst 38h			;609c
	rst 38h			;609d
	rst 38h			;609e
	defb 0fdh,02dh ;dec iyl	;609f
	ld bc,00c40h		;60a1
	nop			;60a4
	nop			;60a5
	adc a,b			;60a6
	ld bc,lffffh		;60a7
	rst 38h			;60aa
	rst 38h			;60ab
	ret po			;60ac
	dec b			;60ad
	inc bc			;60ae
	cp 050h			;60af
	inc bc			;60b1
	ld b,b			;60b2
	nop			;60b3
	nop			;60b4
	ld bc,lc081h		;60b5
	rst 38h			;60b8
	rst 38h			;60b9
sub_60bah:
	rst 38h			;60ba
	rst 38h			;60bb
	rst 38h			;60bc
	rst 38h			;60bd
	rst 38h			;60be
	rst 38h			;60bf
	ret m			;60c0
	nop			;60c1
sub_60c2h:
	ld b,c			;60c2
	ld b,l			;60c3
	ld d,l			;60c4
	pop bc			;60c5
	ex af,af'		;60c6
	add a,h			;60c7
	rst 38h			;60c8
	rst 38h			;60c9
sub_60cah:
	rst 38h			;60ca
	rst 38h			;60cb
	rst 38h			;60cc
	rst 38h			;60cd
	rst 38h			;60ce
	rst 38h			;60cf
	rst 38h			;60d0
l60d1h:
	rst 38h			;60d1
	add a,a			;60d2
	rst 38h			;60d3
	cp 07eh			;60d4
	inc h			;60d6
	ex af,af'		;60d7
	rst 38h			;60d8
	rst 38h			;60d9
	rst 38h			;60da
	rst 38h			;60db
	ret p			;60dc
	nop			;60dd
	rst 38h			;60de
	rst 38h			;60df
	cp 033h			;60e0
	rst 38h			;60e2
	defb 0fdh,03fh,0fch ;illegal sequence	;60e3
	sbc a,b			;60e6
	ld (lffffh),a		;60e7
	rst 38h			;60ea
	rst 38h			;60eb
	jp p,lff07h		;60ec
	ld a,a			;60ef
	rst 38h			;60f0
	add a,b			;60f1
	rst 38h			;60f2
	rst 38h			;60f3
	cp 028h			;60f4
	ld e,d			;60f6
	dec c			;60f7
	rst 38h			;60f8
	rst 38h			;60f9
	rst 38h			;60fa
	rst 38h			;60fb
	rst 38h			;60fc
	rst 38h			;60fd
l60feh:
	rst 38h			;60fe
	rst 38h			;60ff
	rst 38h			;6100
	add a,b			;6101
	inc c			;6102
	nop			;6103
	nop			;6104
	nop			;6105
	nop			;6106
	nop			;6107
	rst 38h			;6108
	rst 38h			;6109
	rst 38h			;610a
	rst 38h			;610b
	rst 38h			;610c
	rst 38h			;610d
	rst 38h			;610e
	rst 38h			;610f
	or c			;6110
	dec b			;6111
	dec b			;6112
	ld d,c			;6113
	ld b,b			;6114
	dec c			;6115
	ld h,b			;6116
	nop			;6117
	rst 38h			;6118
	rst 38h			;6119
	rst 38h			;611a
	rst 38h			;611b
	cp 0a3h			;611c
	ei			;611e
	cp 02ah			;611f
	ld bc,00a80h		;6121
	nop			;6124
	nop			;6125
	ld d,b			;6126
	ld (de),a		;6127
	rst 38h			;6128
	rst 38h			;6129
	rst 38h			;612a
	rst 38h			;612b
sub_612ch:
	ret po			;612c
	ld a,(bc)		;612d
	ld bc,l60feh		;612e
	ld bc,00080h		;6131
	nop			;6134
	ld bc,l8000h		;6135
	rst 38h			;6138
	rst 38h			;6139
	rst 38h			;613a
	rst 38h			;613b
	rst 38h			;613c
	rst 38h			;613d
	rst 38h			;613e
	rst 38h			;613f
l6140h:
	call m,04000h		;6140
	add a,e			;6143
	xor e			;6144
	add a,c			;6145
	adc a,h			;6146
	ret nz			;6147
	rst 38h			;6148
	rst 38h			;6149
	rst 38h			;614a
	rst 38h			;614b
	rst 38h			;614c
	rst 38h			;614d
	rst 38h			;614e
	rst 38h			;614f
	rst 38h			;6150
	rst 38h			;6151
	inc sp			;6152
	rst 38h			;6153
	rst 38h			;6154
sub_6155h:
	rst 38h			;6155
	ld (0ff05h),hl		;6156
	rst 38h			;6159
	rst 38h			;615a
	rst 38h			;615b
	rst 38h			;615c
	add a,e			;615d
	ld bc,lffffh		;615e
	call nz,0fc3fh		;6161
	rrca			;6164
	cp 04ch			;6165
	ld (hl),e		;6167
	rst 38h			;6168
	rst 38h			;6169
	rst 38h			;616a
	rst 38h			;616b
	jp p,lff07h		;616c
	rst 38h			;616f
sub_6170h:
	rst 38h			;6170
	ret m			;6171
	rlca			;6172
	rst 38h			;6173
	rst 38h			;6174
	inc d			;6175
	nop			;6176
	dec l			;6177
	rst 38h			;6178
	rst 38h			;6179
	rst 38h			;617a
	rst 38h			;617b
	rst 38h			;617c
	rst 38h			;617d
	rst 38h			;617e
	rst 38h			;617f
	defb 0fdh,000h,033h ;illegal sequence	;6180
	ret p			;6183
	nop			;6184
	nop			;6185
	nop			;6186
	ret m			;6187
	rst 38h			;6188
	rst 38h			;6189
sub_618ah:
	rst 38h			;618a
	rst 38h			;618b
	rst 38h			;618c
	rst 38h			;618d
	rst 38h			;618e
	rst 38h			;618f
	ld b,d			;6190
	add a,(hl)		;6191
	ld a,(bc)		;6192
	and d			;6193
	ld b,b			;6194
	ld a,(bc)		;6195
	ld b,b			;6196
	nop			;6197
sub_6198h:
	rst 38h			;6198
	rst 38h			;6199
	rst 38h			;619a
	rst 38h			;619b
	defb 0fdh,040h,0ffh ;illegal sequence	;619c
	inc (iy+003h)		;619f
	ld b,b			;61a2
	dec b			;61a3
	nop			;61a4
	nop			;61a5
	ld l,b			;61a6
	dec hl			;61a7
	rst 38h			;61a8
	rst 38h			;61a9
	rst 38h			;61aa
	rst 38h			;61ab
	ret p			;61ac
	ex af,af'		;61ad
	ld bc,030ffh		;61ae
	ld bc,00040h		;61b1
	nop			;61b4
	ld bc,00000h		;61b5
	rst 38h			;61b8
	rst 38h			;61b9
	rst 38h			;61ba
	rst 38h			;61bb
	rst 38h			;61bc
	rst 38h			;61bd
	rst 38h			;61be
	rst 38h			;61bf
sub_61c0h:
	rst 38h			;61c0
	nop			;61c1
	ld b,b			;61c2
	ld b,b			;61c3
	ld d,a			;61c4
	nop			;61c5
	add a,001h		;61c6
	rst 38h			;61c8
	rst 38h			;61c9
	rst 38h			;61ca
	rst 38h			;61cb
	rst 38h			;61cc
	rst 38h			;61cd
l61ceh:
	rst 38h			;61ce
	ld a,a			;61cf
	rst 38h			;61d0
	cp 041h			;61d1
	rst 38h			;61d3
	rst 38h			;61d4
	rst 38h			;61d5
	push bc			;61d6
	dec bc			;61d7
	rst 38h			;61d8
	rst 38h			;61d9
	rst 38h			;61da
	rst 38h			;61db
	rst 38h			;61dc
	call m,0070eh		;61dd
	rst 38h			;61e0
	ret m			;61e1
	rst 8			;61e2
	rst 38h			;61e3
	inc bc			;61e4
	cp 0a6h			;61e5
	ld e,c			;61e7
	rst 38h			;61e8
	rst 38h			;61e9
	rst 38h			;61ea
	rst 38h			;61eb
	ret p			;61ec
	rlca			;61ed
	rst 38h			;61ee
	rst 38h			;61ef
	rst 38h			;61f0
	rst 38h			;61f1
	adc a,b			;61f2
l61f3h:
	rra			;61f3
	rst 38h			;61f4
	adc a,d			;61f5
	add a,b			;61f6
	inc sp			;61f7
	rst 38h			;61f8
	rst 38h			;61f9
	rst 38h			;61fa
	rst 38h			;61fb
	rst 38h			;61fc
	rst 38h			;61fd
	rst 38h			;61fe
	rst 38h			;61ff
l6200h:
	ret m			;6200
	add a,b			;6201
	ld e,b			;6202
	and b			;6203
	ld c,000h		;6204
	ld bc,lffafh		;6206
	rst 38h			;6209
	rst 38h			;620a
	rst 38h			;620b
	rst 38h			;620c
	rst 38h			;620d
	rst 38h			;620e
	cp 0a5h			;620f
	inc b			;6211
	dec d			;6212
	ld (bc),a		;6213
	add a,b			;6214
	inc c			;6215
	ld b,b			;6216
	nop			;6217
	rst 38h			;6218
	rst 38h			;6219
	rst 38h			;621a
	rst 38h			;621b
	jp m,l7f80h		;621c
	call m,00628h		;621f
l6222h:
	add a,b			;6222
l6223h:
	ld (bc),a		;6223
l6224h:
	nop			;6224
l6225h:
	nop			;6225
l6226h:
	ld d,b			;6226
l6227h:
	ld d,d			;6227
l6228h:
	rst 38h			;6228
l6229h:
	rst 38h			;6229
	rst 38h			;622a
	rst 38h			;622b
	ret p			;622c
	ld a,(bc)		;622d
	ld bc,l98ffh		;622e
	ld bc,008a0h		;6231
	nop			;6234
	ld bc,00180h		;6235
l6238h:
	rst 38h			;6238
	rst 38h			;6239
l623ah:
	rst 38h			;623a
	rst 38h			;623b
	rst 38h			;623c
	rst 38h			;623d
	rst 38h			;623e
	rst 38h			;623f
	rst 38h			;6240
	add a,b			;6241
	ret po			;6242
	jr nc,l6273h		;6243
l6245h:
	nop			;6245
	ld h,e			;6246
	ld de,lffffh		;6247
	rst 38h			;624a
	rst 38h			;624b
l624ch:
	rst 38h			;624c
	rst 38h			;624d
	rst 38h			;624e
	add a,a			;624f
	rst 38h			;6250
	cp 041h			;6251
	rst 38h			;6253
	rst 38h			;6254
	rst 38h			;6255
	jp nz,lff15h		;6256
	rst 38h			;6259
	rst 38h			;625a
	rst 38h			;625b
	rst 38h			;625c
	rst 38h			;625d
	ret p			;625e
	ld a,b			;625f
	rrca			;6260
	rst 38h			;6261
	inc sp			;6262
	rst 38h			;6263
	add a,c			;6264
sub_6265h:
	rst 38h			;6265
	ld d,b			;6266
	ld c,h			;6267
l6268h:
	rst 38h			;6268
	rst 38h			;6269
	rst 38h			;626a
	rst 38h			;626b
	ret m			;626c
	rlca			;626d
	rst 38h			;626e
l626fh:
	rst 38h			;626f
	rst 38h			;6270
	rst 38h			;6271
	ret p			;6272
l6273h:
	ret po			;6273
	rst 38h			;6274
	call 0164ah		;6275
	rst 38h			;6278
	rst 38h			;6279
	rst 38h			;627a
	rst 38h			;627b
	rst 38h			;627c
	rst 38h			;627d
	rst 38h			;627e
	rst 38h			;627f
sub_6280h:
	ei			;6280
	nop			;6281
	and l			;6282
	ld b,b			;6283
	djnz l6286h		;6284
l6286h:
	inc bc			;6286
	ld d,h			;6287
	rst 38h			;6288
	rst 38h			;6289
	rst 38h			;628a
	rst 30h			;628b
	rst 38h			;628c
	rst 38h			;628d
	rst 38h			;628e
	cp 04ah			;628f
	ex af,af'		;6291
	ld hl,(00005h)		;6292
	ex af,af'		;6295
	add a,b			;6296
	nop			;6297
sub_6298h:
	rst 38h			;6298
	rst 38h			;6299
	rst 38h			;629a
	rst 38h			;629b
	ret p			;629c
	ld bc,lf80fh		;629d
	and b			;62a0
	ld a,(bc)		;62a1
l62a2h:
	nop			;62a2
	ld (bc),a		;62a3
	nop			;62a4
	ld bc,lc641h		;62a5
	rst 38h			;62a8
	rst 38h			;62a9
	rst 38h			;62aa
	rst 38h			;62ab
	ret m			;62ac
	ld a,(de)		;62ad
	inc bc			;62ae
	rst 38h			;62af
	jr l62b3h		;62b0
sub_62b2h:
	ret po			;62b2
l62b3h:
	jr nz,l62b5h		;62b3
l62b5h:
	ld hl,0033ch		;62b5
	rst 38h			;62b8
	rst 38h			;62b9
	rst 38h			;62ba
	rst 38h			;62bb
	rst 38h			;62bc
	rst 38h			;62bd
	cp a			;62be
	rst 38h			;62bf
l62c0h:
	defb 0fdh,0f3h,0e0h ;illegal sequence	;62c0
	nop			;62c3
	jr nz,l62c6h		;62c4
l62c6h:
	ld b,e			;62c6
	inc de			;62c7
	rst 38h			;62c8
	rst 38h			;62c9
	rrca			;62ca
	rst 38h			;62cb
	rst 38h			;62cc
	rst 38h			;62cd
	rst 38h			;62ce
	pop hl			;62cf
	rst 38h			;62d0
	cp 001h			;62d1
	rst 38h			;62d3
	rst 38h			;62d4
	sbc a,a			;62d5
	add a,c			;62d6
	ld e,a			;62d7
	rst 38h			;62d8
	rst 38h			;62d9
	rst 38h			;62da
	rst 38h			;62db
	rst 38h			;62dc
	rst 38h			;62dd
	rst 38h			;62de
	nop			;62df
	ld bc,l8bffh		;62e0
	rst 38h			;62e3
	sub b			;62e4
	rst 38h			;62e5
	ld d,b			;62e6
	rst 8			;62e7
	rst 38h			;62e8
	rst 38h			;62e9
	rst 38h			;62ea
	rst 38h			;62eb
	ret m			;62ec
	rrca			;62ed
	rst 38h			;62ee
	rst 38h			;62ef
	rst 38h			;62f0
	rst 38h			;62f1
	cp 000h			;62f2
l62f4h:
	rrca			;62f4
	pop bc			;62f5
	nop			;62f6
	inc (hl)		;62f7
	rst 38h			;62f8
	rst 38h			;62f9
	rst 38h			;62fa
	rst 38h			;62fb
	rst 38h			;62fc
	rst 38h			;62fd
	rst 38h			;62fe
	rst 38h			;62ff
	jp pe,lb402h		;6300
l6303h:
	nop			;6303
	ld d,b			;6304
	nop			;6305
	ld a,c			;6306
	ld d,b			;6307
	rst 38h			;6308
	rst 38h			;6309
	rst 38h			;630a
	rst 38h			;630b
	rst 38h			;630c
	rst 38h			;630d
	rst 38h			;630e
	defb 0fdh,018h,000h ;illegal sequence	;630f
	and b			;6312
	inc d			;6313
	nop			;6314
	ld a,(bc)		;6315
	jr nc,l6318h		;6316
l6318h:
	rst 38h			;6318
	rst 38h			;6319
	rst 38h			;631a
	rst 38h			;631b
	ret p			;631c
	ld (bc),a		;631d
	add a,a			;631e
	ret m			;631f
	ret nc			;6320
	dec c			;6321
	nop			;6322
	ld bc,00100h		;6323
	add a,c			;6326
	ld b,d			;6327
	rst 38h			;6328
	rst 38h			;6329
	rst 38h			;632a
	rst 38h			;632b
	defb 0fdh,00ch,007h ;illegal sequence	;632c
	rst 38h			;632f
	adc a,b			;6330
	nop			;6331
	nop			;6332
	jr nc,l6335h		;6333
l6335h:
	and c			;6335
	ld h,006h		;6336
	rst 38h			;6338
	rst 38h			;6339
	rst 38h			;633a
	rst 28h			;633b
	rst 38h			;633c
	rst 38h			;633d
	rst 38h			;633e
	rst 38h			;633f
	rst 38h			;6340
	rst 38h			;6341
	call m,01008h		;6342
	jr nz,l6388h		;6345
	inc hl			;6347
	rst 38h			;6348
	rst 38h			;6349
	ret po			;634a
	rra			;634b
	rst 38h			;634c
	rst 38h			;634d
	rst 38h			;634e
	call m,0ff1fh		;634f
	inc bc			;6352
	rst 18h			;6353
	ei			;6354
	jp l9782h		;6355
	rst 38h			;6358
	rst 38h			;6359
	rst 38h			;635a
	rst 38h			;635b
	call m,0ff1fh		;635c
	rst 38h			;635f
	rst 38h			;6360
	rst 38h			;6361
	ret p			;6362
	rst 38h			;6363
	ret z			;6364
	ccf			;6365
	xor b			;6366
	ld l,h			;6367
	rst 38h			;6368
	defb 0fdh,0ffh,0efh ;illegal sequence	;6369
	call m,0ff1fh		;636c
	defb 0fdh,0ffh,0ffh ;illegal sequence	;636f
	rst 38h			;6372
	ret nz			;6373
	jr nz,l6396h		;6374
	jr z,l6396h		;6376
	rst 38h			;6378
	rst 38h			;6379
	rst 38h			;637a
	rst 38h			;637b
	rst 38h			;637c
	rst 38h			;637d
	rst 38h			;637e
	rst 38h			;637f
	call nc,04005h		;6380
	nop			;6383
	and b			;6384
	inc bc			;6385
	sub 000h		;6386
l6388h:
	rst 38h			;6388
	rst 38h			;6389
	rst 38h			;638a
	rst 38h			;638b
sub_638ch:
	rst 38h			;638c
	rst 38h			;638d
	rst 38h			;638e
	jp m,00130h		;638f
	ret po			;6392
	ex af,af'		;6393
	nop			;6394
	ld (bc),a		;6395
l6396h:
	djnz l6399h		;6396
	rst 38h			;6398
l6399h:
	rst 38h			;6399
	rst 38h			;639a
	rst 38h			;639b
	ret po			;639c
	dec b			;639d
	inc bc			;639e
	ret m			;639f
	and b			;63a0
	ld a,(bc)		;63a1
	nop			;63a2
	nop			;63a3
	nop			;63a4
	inc bc			;63a5
	ld b,e			;63a6
	add a,b			;63a7
	rst 38h			;63a8
	rst 38h			;63a9
	rst 38h			;63aa
	rst 38h			;63ab
	cp 087h			;63ac
	rrca			;63ae
	rst 38h			;63af
	ret nz			;63b0
	nop			;63b1
	nop			;63b2
	xor d			;63b3
	add a,c			;63b4
	ld h,e			;63b5
	inc hl			;63b6
	dec c			;63b7
	rst 38h			;63b8
	rst 38h			;63b9
l63bah:
	rst 38h			;63ba
	rst 38h			;63bb
	rst 38h			;63bc
	rst 38h			;63bd
	rst 38h			;63be
	rst 38h			;63bf
	rst 38h			;63c0
	rst 38h			;63c1
	rst 38h			;63c2
	inc e			;63c3
	inc c			;63c4
	jr nc,l6408h		;63c5
	inc de			;63c7
l63c8h:
	rst 38h			;63c8
	rst 38h			;63c9
	rst 38h			;63ca
	nop			;63cb
	ld a,a			;63cc
	rst 38h			;63cd
	rst 38h			;63ce
	rst 38h			;63cf
	ld b,e			;63d0
	rst 38h			;63d1
	add a,a			;63d2
	ex (sp),hl		;63d3
	rst 38h			;63d4
	ret po			;63d5
	add a,b			;63d6
	call lffffh		;63d7
	rst 38h			;63da
	rst 38h			;63db
	ld sp,hl		;63dc
	rrca			;63dd
	rst 38h			;63de
	rst 38h			;63df
	rst 38h			;63e0
	rst 38h			;63e1
	cp 07bh			;63e2
	pop hl			;63e4
	rrca			;63e5
	call nc,sub_ff3eh	;63e6
	rst 38h			;63e9
	rst 38h			;63ea
	rst 38h			;63eb
	rst 38h			;63ec
	rst 38h			;63ed
	rst 38h			;63ee
	rst 38h			;63ef
	rst 38h			;63f0
	rst 38h			;63f1
	rst 38h			;63f2
	ret m			;63f3
	inc e			;63f4
	rra			;63f5
	ld de,lff0fh		;63f6
	rst 38h			;63f9
	rst 38h			;63fa
	rst 38h			;63fb
	rst 38h			;63fc
	rst 38h			;63fd
	rst 38h			;63fe
	rst 38h			;63ff
	xor b			;6400
	ld b,080h		;6401
	ld a,c			;6403
	ld b,b			;6404
	ld b,0a9h		;6405
	nop			;6407
l6408h:
	rst 38h			;6408
	rst 38h			;6409
	rst 38h			;640a
	rst 38h			;640b
	rst 38h			;640c
	rst 38h			;640d
	rst 38h			;640e
	call m,0036fh		;640f
	ld b,b			;6412
	djnz l6415h		;6413
l6415h:
	ld (bc),a		;6415
	djnz l6419h		;6416
	rst 38h			;6418
l6419h:
	rst 38h			;6419
	rst 38h			;641a
	rst 38h			;641b
	ret po			;641c
	inc b			;641d
	inc bc			;641e
	call m,00dc0h		;641f
	nop			;6422
	nop			;6423
sub_6424h:
	nop			;6424
	ld (bc),a		;6425
	add a,l			;6426
	ld b,b			;6427
	rst 38h			;6428
	rst 38h			;6429
	rst 38h			;642a
	rst 38h			;642b
	rst 38h			;642c
	rst 38h			;642d
	rst 38h			;642e
	defb 0fdh,0e0h,000h ;illegal sequence	;642f
	ld bc,05215h		;6432
	jp nz,00a11h		;6435
	rst 38h			;6438
	rst 38h			;6439
	rst 38h			;643a
	rst 38h			;643b
	rst 38h			;643c
l643dh:
	rst 38h			;643d
l643eh:
	rst 38h			;643e
l643fh:
	rst 38h			;643f
sub_6440h:
	rst 18h			;6440
	rst 38h			;6441
	rst 38h			;6442
	cp 000h			;6443
	ld a,b			;6445
	ld b,l			;6446
	ld hl,lffffh		;6447
	rst 38h			;644a
	call m,sub_ff00h	;644b
	rst 38h			;644e
	rst 38h			;644f
	ret po			;6450
	ccf			;6451
	rst 38h			;6452
	pop af			;6453
	rst 38h			;6454
	jp p,l6520h		;6455
	rst 38h			;6458
	rst 38h			;6459
	rst 38h			;645a
	rst 38h			;645b
	jp p,lff07h		;645c
	rst 38h			;645f
	call m,sub_ff7fh	;6460
	rst 38h			;6463
	ret m			;6464
	inc bc			;6465
	jp pe,lff17h		;6466
	rst 38h			;6469
	rst 38h			;646a
	rst 38h			;646b
	rst 38h			;646c
	rst 38h			;646d
	rst 38h			;646e
	rst 38h			;646f
	rst 38h			;6470
	rst 38h			;6471
	rst 38h			;6472
	rst 38h			;6473
	pop bc			;6474
	add a,b			;6475
	nop			;6476
	nop			;6477
	jr c,$+58		;6478
	jr c,$+58		;647a
	jr c,$+58		;647c
	jr c,$+58		;647e
	jr nc,$+50		;6480
	jr nc,$+50		;6482
	jr nc,$+50		;6484
	jr nc,$+50		;6486
	jr c,$+58		;6488
	jr c,$+50		;648a
	jr c,$+58		;648c
	jr c,$+50		;648e
	jr nc,$+52		;6490
	jr nc,$+52		;6492
	ld (03232h),a		;6494
	jr nc,l64d1h		;6497
	jr c,l64d3h		;6499
	jr nc,l64b5h		;649b
	jr $+18			;649d
	jr nc,l64d3h		;649f
	ld (03230h),a		;64a1
	jr nc,$+50		;64a4
	jr nc,l64d8h		;64a6
	jr c,l64e2h		;64a8
	jr c,l64e4h		;64aa
	jr $+26			;64ac
	djnz l64e0h		;64ae
	ld (03232h),a		;64b0
	jr nc,l64e7h		;64b3
l64b5h:
	jr nc,l64e7h		;64b5
	jr nc,$+58		;64b7
	jr c,$+58		;64b9
	jr c,$+58		;64bb
	jr c,l64f7h		;64bd
	jr c,$+50		;64bf
	jr nc,$+50		;64c1
	jr nc,l64f7h		;64c3
sub_64c5h:
	jr nc,l64f7h		;64c5
	jr nc,l6501h		;64c7
	jr c,l6503h		;64c9
	jr c,l6505h		;64cb
	jr c,l6507h		;64cd
	jr c,l6501h		;64cf
l64d1h:
	jr nc,l6503h		;64d1
l64d3h:
	jr nc,l650dh		;64d3
	jr nc,l6509h		;64d5
	ld (hl),d		;64d7
l64d8h:
	jr c,l6512h		;64d8
	jr c,l6514h		;64da
	jr c,l6516h		;64dc
	jr c,l6518h		;64de
l64e0h:
	jr c,l6512h		;64e0
l64e2h:
	jr nc,l6514h		;64e2
l64e4h:
	jr nc,l6516h		;64e4
	ld (hl),d		;64e6
l64e7h:
	ld (hl),d		;64e7
	jr c,l6522h		;64e8
	jr c,l6524h		;64ea
	jr c,l6526h		;64ec
	jr c,l6528h		;64ee
	jr c,l6522h		;64f0
	jr nc,l6524h		;64f2
	jr nc,l6566h		;64f4
	ld (hl),b		;64f6
l64f7h:
	ld (hl),d		;64f7
	nop			;64f8
	nop			;64f9
	nop			;64fa
	nop			;64fb
	nop			;64fc
	nop			;64fd
	nop			;64fe
	nop			;64ff
	nop			;6500
l6501h:
	nop			;6501
	nop			;6502
l6503h:
	nop			;6503
	nop			;6504
l6505h:
	nop			;6505
	nop			;6506
l6507h:
	nop			;6507
	nop			;6508
l6509h:
	nop			;6509
	nop			;650a
	nop			;650b
	nop			;650c
l650dh:
	nop			;650d
	nop			;650e
	nop			;650f
	nop			;6510
	nop			;6511
l6512h:
	nop			;6512
	nop			;6513
l6514h:
	nop			;6514
	nop			;6515
l6516h:
	nop			;6516
	nop			;6517
l6518h:
	nop			;6518
sub_6519h:
	nop			;6519
	nop			;651a
	nop			;651b
	nop			;651c
	nop			;651d
	nop			;651e
	nop			;651f
l6520h:
	nop			;6520
	nop			;6521
l6522h:
	nop			;6522
	nop			;6523
l6524h:
	nop			;6524
	nop			;6525
l6526h:
	nop			;6526
	nop			;6527
l6528h:
	nop			;6528
	nop			;6529
	nop			;652a
	nop			;652b
	nop			;652c
	nop			;652d
	nop			;652e
	nop			;652f
	ld bc,000deh		;6530
	nop			;6533
	nop			;6534
	nop			;6535
	sub 0adh		;6536
	ld d,l			;6538
	ld a,a			;6539
	nop			;653a
	nop			;653b
	nop			;653c
	nop			;653d
	nop			;653e
l653fh:
	inc bc			;653f
	ld l,l			;6540
	or (hl)			;6541
	in a,(040h)		;6542
	ld (bc),a		;6544
	ld e,a			;6545
	rst 38h			;6546
	rst 38h			;6547
	defb 0fdh,06ah ;ld iyl,d	;6548
	nop			;654a
	ld bc,la99eh		;654b
	ld a,079h		;654e
	add a,b			;6550
	call pe,lffffh		;6551
	rst 38h			;6554
	ei			;6555
	xor d			;6556
	xor d			;6557
	rst 38h			;6558
	rst 38h			;6559
	nop			;655a
	inc bc			;655b
	rst 38h			;655c
	rst 38h			;655d
	rst 38h			;655e
	cp 040h			;655f
	push hl			;6561
	rst 38h			;6562
	rst 38h			;6563
	rst 38h			;6564
	rst 18h			;6565
l6566h:
	ld a,(hl)		;6566
	xor d			;6567
	inc bc			;6568
	ret nz			;6569
	nop			;656a
	add a,a			;656b
	rst 38h			;656c
	ld sp,hl		;656d
	sbc a,a			;656e
	defb 0fdh,0e0h,0fdh ;illegal sequence	;656f
	rst 38h			;6572
	cp 0ffh			;6573
	rst 38h			;6575
	cp 09ah			;6576
	xor d			;6578
	xor d			;6579
	nop			;657a
	nop			;657b
	nop			;657c
	nop			;657d
	nop			;657e
	nop			;657f
	nop			;6580
	nop			;6581
	nop			;6582
	nop			;6583
	nop			;6584
	nop			;6585
	nop			;6586
	nop			;6587
	nop			;6588
	nop			;6589
	nop			;658a
	nop			;658b
	nop			;658c
	nop			;658d
	nop			;658e
	nop			;658f
	nop			;6590
	nop			;6591
	nop			;6592
	nop			;6593
	nop			;6594
	nop			;6595
	nop			;6596
	nop			;6597
	nop			;6598
	nop			;6599
	nop			;659a
	nop			;659b
	nop			;659c
	nop			;659d
	nop			;659e
	nop			;659f
	nop			;65a0
	nop			;65a1
	nop			;65a2
	nop			;65a3
	nop			;65a4
	nop			;65a5
	nop			;65a6
	nop			;65a7
	nop			;65a8
	nop			;65a9
	nop			;65aa
	nop			;65ab
	nop			;65ac
	nop			;65ad
	nop			;65ae
	nop			;65af
	rlca			;65b0
	rst 38h			;65b1
	add a,b			;65b2
	ld a,a			;65b3
	cp 001h			;65b4
	rst 28h			;65b6
	ld e,(hl)		;65b7
	xor d			;65b8
	push de			;65b9
	nop			;65ba
	nop			;65bb
	nop			;65bc
	nop			;65bd
	nop			;65be
	inc bc			;65bf
	ld l,l			;65c0
	or (hl)			;65c1
	in a,(055h)		;65c2
	ld d,d			;65c4
	ld e,a			;65c5
	rst 38h			;65c6
	rst 38h			;65c7
	jp m,000ffh		;65c8
	ld bc,lffe3h		;65cb
	rst 38h			;65ce
	add a,a			;65cf
	add a,b			;65d0
	push de			;65d1
	rst 38h			;65d2
	rst 38h			;65d3
	rst 38h			;65d4
	ei			;65d5
	push de			;65d6
	ld d,h			;65d7
	ret nz			;65d8
	nop			;65d9
	nop			;65da
	inc bc			;65db
	rst 38h			;65dc
	rst 38h			;65dd
	rst 38h			;65de
	rst 38h			;65df
	ld b,b			;65e0
	defb 0ddh,0ffh,0ffh ;illegal sequence	;65e1
	rst 38h			;65e4
	ret nz			;65e5
	ld a,l			;65e6
	ld d,h			;65e7
	inc bc			;65e8
	ret nz			;65e9
	nop			;65ea
	rlca			;65eb
	rst 38h			;65ec
	pop af			;65ed
	adc a,a			;65ee
	or 020h			;65ef
	add iy,sp		;65f1
	adc a,0ffh		;65f3
	rst 38h			;65f5
	rst 38h			;65f6
	ld d,l			;65f7
	ld d,l			;65f8
	ld d,l			;65f9
	nop			;65fa
	nop			;65fb
	nop			;65fc
	nop			;65fd
	nop			;65fe
l65ffh:
	nop			;65ff
	nop			;6600
	nop			;6601
	nop			;6602
	nop			;6603
	nop			;6604
	nop			;6605
	nop			;6606
	nop			;6607
	nop			;6608
	nop			;6609
	nop			;660a
	nop			;660b
	nop			;660c
	nop			;660d
	nop			;660e
	nop			;660f
	nop			;6610
	nop			;6611
	nop			;6612
	nop			;6613
	nop			;6614
	nop			;6615
	nop			;6616
	nop			;6617
	nop			;6618
	nop			;6619
	nop			;661a
	nop			;661b
	nop			;661c
	nop			;661d
	nop			;661e
	nop			;661f
	nop			;6620
	nop			;6621
	nop			;6622
	nop			;6623
sub_6624h:
	nop			;6624
	nop			;6625
	nop			;6626
	nop			;6627
	nop			;6628
	nop			;6629
	nop			;662a
	nop			;662b
	nop			;662c
	nop			;662d
	nop			;662e
	nop			;662f
	rra			;6630
	rst 38h			;6631
	ret po			;6632
	ld b,b			;6633
	ld (bc),a		;6634
	inc bc			;6635
	sbc a,c			;6636
	sbc a,c			;6637
	push de			;6638
	ld hl,(00000h)		;6639
	nop			;663c
	nop			;663d
	nop			;663e
	ld (bc),a		;663f
	nop			;6640
	nop			;6641
	ld bc,00040h		;6642
	add hl,sp		;6645
	sbc a,c			;6646
	sbc a,c			;6647
	sub h			;6648
	add a,b			;6649
	nop			;664a
	ld bc,000feh		;664b
	nop			;664e
	ld a,a			;664f
	add a,b			;6650
	otdr			;6651
	cp e			;6653
	cp e			;6654
	cp c			;6655
	ld a,(hl)		;6656
	xor d			;6657
	add a,b			;6658
	nop			;6659
	nop			;665a
	inc bc			;665b
	rst 38h			;665c
	rst 38h			;665d
	rst 38h			;665e
l665fh:
	defb 0fdh,040h,0ddh ;illegal sequence	;665f
	rst 38h			;6662
	rst 38h			;6663
	rst 38h			;6664
	ei			;6665
	cp 0e4h			;6666
	inc bc			;6668
	ret nz			;6669
	nop			;666a
	rrca			;666b
	rst 38h			;666c
	ex (sp),hl		;666d
	rst 0			;666e
	defb 0fdh,0f0h,0fdh ;illegal sequence	;666f
	or l			;6672
	xor l			;6673
	rst 38h			;6674
	rst 38h			;6675
	cp 0aah			;6676
	xor d			;6678
	xor d			;6679
	nop			;667a
	nop			;667b
	nop			;667c
	nop			;667d
	nop			;667e
	nop			;667f
	nop			;6680
	nop			;6681
	nop			;6682
	nop			;6683
	nop			;6684
l6685h:
	nop			;6685
	nop			;6686
	nop			;6687
	nop			;6688
	nop			;6689
	nop			;668a
	nop			;668b
	nop			;668c
	nop			;668d
	nop			;668e
	nop			;668f
	nop			;6690
	nop			;6691
	nop			;6692
	nop			;6693
	nop			;6694
	nop			;6695
	nop			;6696
	nop			;6697
	nop			;6698
	nop			;6699
	nop			;669a
	nop			;669b
	nop			;669c
	nop			;669d
	nop			;669e
	nop			;669f
	nop			;66a0
	nop			;66a1
	nop			;66a2
	nop			;66a3
	nop			;66a4
	nop			;66a5
	nop			;66a6
	nop			;66a7
	nop			;66a8
	nop			;66a9
	nop			;66aa
	nop			;66ab
	nop			;66ac
	nop			;66ad
	nop			;66ae
	nop			;66af
	jr nz,l66b2h		;66b0
l66b2h:
	djnz l6709h		;66b2
	ld d,d			;66b4
	inc bc			;66b5
	rst 38h			;66b6
	rst 38h			;66b7
	jp m,000bfh		;66b8
	nop			;66bb
	nop			;66bc
	nop			;66bd
	nop			;66be
l66bfh:
	inc bc			;66bf
	rst 38h			;66c0
	rst 38h			;66c1
	rst 38h			;66c2
	ld d,l			;66c3
	ld d,d			;66c4
	cp a			;66c5
	rst 38h			;66c6
	rst 38h			;66c7
	jp m,00080h		;66c8
	ld bc,lffbfh		;66cb
	rst 38h			;66ce
	rst 38h			;66cf
	add a,b			;66d0
	push de			;66d1
	rst 38h			;66d2
	rst 38h			;66d3
	rst 38h			;66d4
	jp m,l75ffh		;66d5
	ld a,a			;66d8
	rst 38h			;66d9
	nop			;66da
	inc bc			;66db
	rst 38h			;66dc
	rst 38h			;66dd
	rst 38h			;66de
	rst 38h			;66df
	ld b,b			;66e0
	defb 0ddh,000h,000h ;illegal sequence	;66e1
	rra			;66e4
	ei			;66e5
	rst 38h			;66e6
	call nc,sub_c003h	;66e7
	nop			;66ea
	rrca			;66eb
	rst 38h			;66ec
	and 067h		;66ed
	rst 38h			;66ef
	jp p,l730dh		;66f0
	sbc a,l			;66f3
	rst 38h			;66f4
	rst 38h			;66f5
	defb 0fdh,03fh,0ffh ;illegal sequence	;66f6
	rst 38h			;66f9
	nop			;66fa
	nop			;66fb
	nop			;66fc
	nop			;66fd
	nop			;66fe
	nop			;66ff
	nop			;6700
	nop			;6701
	nop			;6702
	nop			;6703
	nop			;6704
	nop			;6705
	nop			;6706
	nop			;6707
	nop			;6708
l6709h:
	nop			;6709
	nop			;670a
	nop			;670b
	nop			;670c
	nop			;670d
	nop			;670e
	nop			;670f
	nop			;6710
	nop			;6711
	nop			;6712
	nop			;6713
	nop			;6714
	nop			;6715
	nop			;6716
	nop			;6717
	nop			;6718
	nop			;6719
	nop			;671a
	nop			;671b
	nop			;671c
	nop			;671d
	nop			;671e
sub_671fh:
	nop			;671f
	nop			;6720
	nop			;6721
	nop			;6722
	nop			;6723
	nop			;6724
	nop			;6725
	nop			;6726
	nop			;6727
	nop			;6728
	nop			;6729
	nop			;672a
	nop			;672b
	nop			;672c
	nop			;672d
	nop			;672e
	nop			;672f
	ld a,a			;6730
	cp a			;6731
	ret m			;6732
	ld b,b			;6733
	inc bc			;6734
	rst 20h			;6735
	rst 38h			;6736
	rst 38h			;6737
	push af			;6738
	jr nz,l673bh		;6739
l673bh:
	nop			;673b
	nop			;673c
	nop			;673d
	nop			;673e
	ld bc,lffd7h		;673f
	cp 000h			;6742
	nop			;6744
	ld l,a			;6745
	rst 38h			;6746
	rst 38h			;6747
	call p,000ffh		;6748
	ld bc,0ffefh		;674b
	rst 38h			;674e
	cp 080h			;674f
	xor l			;6751
	rst 38h			;6752
	rst 38h			;6753
	rst 38h			;6754
	ei			;6755
	ei			;6756
	xor c			;6757
l6758h:
	xor d			;6758
	xor d			;6759
	ld bc,lff07h		;675a
	rst 38h			;675d
	rst 38h			;675e
	cp 0e0h			;675f
	defb 0ddh,0ffh,0ffh ;illegal sequence	;6761
	rst 18h			;6764
	ei			;6765
	rst 38h			;6766
	xor a			;6767
	rst 38h			;6768
	rst 38h			;6769
	nop			;676a
	rrca			;676b
	rst 38h			;676c
	call m,sub_ff3fh	;676d
	jp p,lffedh		;6770
	ei			;6773
	rst 38h			;6774
	rst 38h			;6775
	cp 0a0h			;6776
	nop			;6778
l6779h:
	nop			;6779
	nop			;677a
	nop			;677b
	nop			;677c
	nop			;677d
	nop			;677e
	nop			;677f
	nop			;6780
	nop			;6781
	nop			;6782
	nop			;6783
	nop			;6784
	nop			;6785
	nop			;6786
	nop			;6787
	nop			;6788
	nop			;6789
	nop			;678a
	nop			;678b
l678ch:
	nop			;678c
	nop			;678d
	nop			;678e
	nop			;678f
	nop			;6790
	nop			;6791
	nop			;6792
	nop			;6793
	nop			;6794
	nop			;6795
	nop			;6796
	nop			;6797
	nop			;6798
	nop			;6799
	nop			;679a
	nop			;679b
	nop			;679c
	nop			;679d
	nop			;679e
	nop			;679f
	nop			;67a0
	nop			;67a1
	nop			;67a2
	nop			;67a3
	nop			;67a4
	nop			;67a5
	nop			;67a6
	nop			;67a7
	nop			;67a8
	nop			;67a9
	nop			;67aa
	nop			;67ab
	nop			;67ac
	nop			;67ad
	nop			;67ae
	nop			;67af
	rst 30h			;67b0
	rst 38h			;67b1
	cp 055h			;67b2
	ld d,b			;67b4
	rla			;67b5
	rst 38h			;67b6
	rst 38h			;67b7
l67b8h:
	jp m,00040h		;67b8
	nop			;67bb
	ld bc,lffffh		;67bc
	add a,b			;67bf
	ld l,d			;67c0
	rst 38h			;67c1
	ld sp,hl		;67c2
	ld d,l			;67c3
	ld d,d			;67c4
	ld d,l			;67c5
	rst 38h			;67c6
	ei			;67c7
	xor c			;67c8
	ld d,l			;67c9
	nop			;67ca
	inc bc			;67cb
	rst 30h			;67cc
	rst 38h			;67cd
	rst 38h			;67ce
	rst 38h			;67cf
	ret nz			;67d0
	cp l			;67d1
	rst 38h			;67d2
	rst 38h			;67d3
	rst 38h			;67d4
	ei			;67d5
	defb 0fdh,0d5h,055h ;illegal sequence	;67d6
	ld d,l			;67d9
	inc b			;67da
	rlca			;67db
	rst 38h			;67dc
	rst 38h			;67dd
	rst 38h			;67de
l67dfh:
	defb 0fdh,0e0h,0e5h ;illegal sequence	;67df
	rst 20h			;67e2
	add hl,sp		;67e3
	cp e			;67e4
	ld l,e			;67e5
	rst 38h			;67e6
	ld c,l			;67e7
	ld d,l			;67e8
	ld d,l			;67e9
	nop			;67ea
	rrca			;67eb
	rst 38h			;67ec
	call m,sub_fd3fh	;67ed
	or 0edh			;67f0
	adc a,077h		;67f2
	rst 38h			;67f4
	rst 38h			;67f5
	defb 0ddh,040h,000h ;illegal sequence	;67f6
	nop			;67f9
	nop			;67fa
	nop			;67fb
	nop			;67fc
	nop			;67fd
	nop			;67fe
	nop			;67ff
	nop			;6800
l6801h:
	nop			;6801
	nop			;6802
	nop			;6803
	nop			;6804
l6805h:
	nop			;6805
	nop			;6806
	nop			;6807
	nop			;6808
	nop			;6809
	nop			;680a
	nop			;680b
	nop			;680c
	nop			;680d
	nop			;680e
	nop			;680f
	nop			;6810
	nop			;6811
	nop			;6812
	nop			;6813
	nop			;6814
	nop			;6815
	nop			;6816
	nop			;6817
	nop			;6818
	nop			;6819
	nop			;681a
	nop			;681b
	nop			;681c
	nop			;681d
	nop			;681e
	nop			;681f
	nop			;6820
	nop			;6821
	nop			;6822
	nop			;6823
	nop			;6824
	nop			;6825
	nop			;6826
	nop			;6827
l6828h:
	nop			;6828
	nop			;6829
	nop			;682a
	nop			;682b
	nop			;682c
	nop			;682d
	nop			;682e
	ld bc,00000h		;682f
	ld bc,00040h		;6832
	ld l,066h		;6835
	ld h,(hl)		;6837
	ld h,l			;6838
	ld a,a			;6839
	nop			;683a
	nop			;683b
	ld e,000h		;683c
	nop			;683e
	ld a,b			;683f
	dec b			;6840
	ld e,a			;6841
	add a,b			;6842
	nop			;6843
	nop			;6844
	xor d			;6845
	xor l			;6846
	ld d,l			;6847
	ld d,l			;6848
	xor d			;6849
	nop			;684a
	inc bc			;684b
	rst 38h			;684c
	rst 38h			;684d
	rst 38h			;684e
	cp 040h			;684f
	defb 0fdh,0ffh,0ffh ;illegal sequence	;6851
	rst 38h			;6854
	ret nz			;6855
	ld a,a			;6856
	xor d			;6857
	xor d			;6858
	xor d			;6859
	nop			;685a
	rlca			;685b
	rst 38h			;685c
	rst 38h			;685d
	rst 38h			;685e
	cp 0a0h			;685f
	defb 0fdh,0d6h,0b5h ;illegal sequence	;6861
	ld a,a			;6864
	ei			;6865
	rst 38h			;6866
	xor d			;6867
l6868h:
	xor d			;6868
	xor d			;6869
	ex af,af'		;686a
	rrca			;686b
	rst 38h			;686c
	cp 07fh			;686d
	rst 10h			;686f
	or 0edh			;6870
	xor l			;6872
sub_6873h:
	ld (hl),a		;6873
	rst 38h			;6874
	rst 38h			;6875
	rst 30h			;6876
	ld b,b			;6877
	nop			;6878
	nop			;6879
	nop			;687a
	nop			;687b
	nop			;687c
	nop			;687d
	nop			;687e
	nop			;687f
sub_6880h:
	nop			;6880
	nop			;6881
	nop			;6882
	nop			;6883
	nop			;6884
	nop			;6885
	nop			;6886
	nop			;6887
	nop			;6888
	nop			;6889
	nop			;688a
	nop			;688b
	nop			;688c
sub_688dh:
	nop			;688d
	nop			;688e
	nop			;688f
	nop			;6890
	nop			;6891
	nop			;6892
	nop			;6893
	nop			;6894
	nop			;6895
	nop			;6896
	nop			;6897
	nop			;6898
	nop			;6899
sub_689ah:
	nop			;689a
	nop			;689b
	nop			;689c
	nop			;689d
	nop			;689e
	nop			;689f
	nop			;68a0
	nop			;68a1
	nop			;68a2
	nop			;68a3
	nop			;68a4
	nop			;68a5
	nop			;68a6
sub_68a7h:
	nop			;68a7
	nop			;68a8
	nop			;68a9
	nop			;68aa
	nop			;68ab
	nop			;68ac
	nop			;68ad
	nop			;68ae
	inc bc			;68af
	ld l,l			;68b0
	or (hl)			;68b1
	in a,(055h)		;68b2
l68b4h:
	ld d,d			;68b4
	xor a			;68b5
	rst 38h			;68b6
	rst 38h			;68b7
	jp m,00055h		;68b8
	nop			;68bb
	ret po			;68bc
	dec d			;68bd
	jr z,l68c7h		;68be
	nop			;68c0
	nop			;68c1
	nop			;68c2
	nop			;68c3
	ld bc,00000h		;68c4
l68c7h:
	nop			;68c7
	nop			;68c8
	nop			;68c9
	nop			;68ca
	inc bc			;68cb
	rst 38h			;68cc
	rst 38h			;68cd
	rst 38h			;68ce
	cp 0c0h			;68cf
	defb 0fdh,0ffh,0ffh ;illegal sequence	;68d1
	rst 38h			;68d4
	rst 18h			;68d5
	ld a,a			;68d6
	out (0ffh),a		;68d7
	rst 38h			;68d9
l68dah:
	nop			;68da
	rlca			;68db
	rst 38h			;68dc
	rst 38h			;68dd
	rst 38h			;68de
	rst 38h			;68df
	ret po			;68e0
	defb 0fdh,0ceh,073h ;illegal sequence	;68e1
	nop			;68e4
	inc bc			;68e5
	rst 38h			;68e6
	ld d,l			;68e7
	ld d,l			;68e8
	ld d,l			;68e9
	nop			;68ea
	rrca			;68eb
	rst 38h			;68ec
l68edh:
	ei			;68ed
	rst 18h			;68ee
	defb 0fdh,0eeh,00dh ;illegal sequence	;68ef
	sbc a,h			;68f2
	nop			;68f3
	nop			;68f4
	nop			;68f5
	nop			;68f6
	nop			;68f7
	nop			;68f8
	nop			;68f9
	ld bc,lff0fh		;68fa
	ret m			;68fd
	rra			;68fe
	rst 38h			;68ff
l6900h:
	xor 0fdh		;6900
	cp 0fbh			;6902
	sbc a,0f7h		;6904
	cp l			;6906
	rst 28h			;6907
	nop			;6908
	nop			;6909
	nop			;690a
	rlca			;690b
	rst 38h			;690c
	rst 38h			;690d
	rst 38h			;690e
	cp 0feh			;690f
	defb 0ddh,0feh,0ffh ;illegal sequence	;6911
	rst 38h			;6914
	rst 38h			;6915
	rst 38h			;6916
	jp pe,laa2ah		;6917
	nop			;691a
	ld a,a			;691b
	rst 30h			;691c
	rst 38h			;691d
	rst 38h			;691e
	cp a			;691f
	ld a,(hl)		;6920
	defb 0fdh,0feh,0fbh ;illegal sequence	;6921
	sbc a,0f6h		;6924
	cp l			;6926
	rst 28h			;6927
	ld a,a			;6928
	rst 38h			;6929
	ld bc,00000h		;692a
	nop			;692d
	rst 38h			;692e
	xor a			;692f
	xor 0fdh		;6930
	cp 0ffh			;6932
	rst 38h			;6934
	rst 38h			;6935
	rst 38h			;6936
	rst 38h			;6937
	ld hl,(003aah)		;6938
	rlca			;693b
	rst 38h			;693c
	ret p			;693d
	rst 38h			;693e
	cp a			;693f
	ld a,(hl)		;6940
	defb 0fdh,0feh,0ebh ;illegal sequence	;6941
	sbc a,0f7h		;6944
	cp l			;6946
	rst 28h			;6947
	nop			;6948
	nop			;6949
	ld c,0bfh		;694a
	rst 38h			;694c
	rst 38h			;694d
	cp 0ffh			;694e
	ld a,(hl)		;6950
	defb 0fdh,0feh,0ffh ;illegal sequence	;6951
	rst 38h			;6954
	rst 38h			;6955
	rst 38h			;6956
	rst 38h			;6957
	nop			;6958
	nop			;6959
	add hl,de		;695a
	rst 38h			;695b
	ret m			;695c
	rst 38h			;695d
	cp (hl)			;695e
	nop			;695f
	add a,c			;6960
	defb 0fdh,0fch,0fbh ;illegal sequence	;6961
	sbc a,0f7h		;6964
	cp l			;6966
	rst 28h			;6967
	nop			;6968
	nop			;6969
	ld d,a			;696a
	rst 38h			;696b
	rst 38h			;696c
	rst 38h			;696d
	cp e			;696e
	push af			;696f
	and c			;6970
	defb 0edh ;next byte illegal after ed	;6971
	ret nc			;6972
	rst 38h			;6973
	rst 38h			;6974
	rst 38h			;6975
	rst 38h			;6976
	rst 38h			;6977
	nop			;6978
	ex af,af'		;6979
	nop			;697a
	rrca			;697b
	rst 38h			;697c
	call m,sub_ff3fh	;697d
	ret c			;6980
	ld a,h			;6981
	ld (hl),d		;6982
	ei			;6983
	sbc a,0f7h		;6984
	cp l			;6986
	rst 28h			;6987
	nop			;6988
	nop			;6989
	nop			;698a
	dec bc			;698b
	rst 38h			;698c
	rst 38h			;698d
	rst 38h			;698e
	defb 0fdh,0feh,0c1h ;illegal sequence	;698f
	cp 000h			;6992
	nop			;6994
	rst 38h			;6995
	rst 38h			;6996
	push af			;6997
	ld d,l			;6998
	ld d,l			;6999
	nop			;699a
	ld a,a			;699b
	rst 28h			;699c
	rst 38h			;699d
	rst 38h			;699e
	cp a			;699f
	ld a,(hl)		;69a0
	defb 0fdh,0feh,0fbh ;illegal sequence	;69a1
	sbc a,0f5h		;69a4
	dec a			;69a6
	rst 28h			;69a7
	ld d,l			;69a8
	ld d,l			;69a9
	ld bc,lff01h		;69aa
	cp 0ffh			;69ad
	cp a			;69af
	ld a,(hl)		;69b0
	dec c			;69b1
	cp 0ffh			;69b2
	rst 38h			;69b4
	rst 38h			;69b5
	rst 38h			;69b6
	rst 38h			;69b7
	ld a,a			;69b8
	rst 38h			;69b9
	inc bc			;69ba
	ld b,a			;69bb
	rst 38h			;69bc
	ret po			;69bd
	rst 38h			;69be
	cp a			;69bf
	ld a,(hl)		;69c0
	defb 0fdh,0feh,0f3h ;illegal sequence	;69c1
	sbc a,0f7h		;69c4
	cp l			;69c6
	rst 28h			;69c7
	nop			;69c8
	nop			;69c9
	dec c			;69ca
l69cbh:
	cp a			;69cb
	rst 38h			;69cc
	rst 38h			;69cd
l69ceh:
	cp 0ffh			;69ce
sub_69d0h:
	ld a,(hl)		;69d0
	defb 0fdh,0feh,0c0h ;illegal sequence	;69d1
	nop			;69d4
	ld h,b			;69d5
	nop			;69d6
	rrca			;69d7
	rst 38h			;69d8
	rst 38h			;69d9
	inc d			;69da
	nop			;69db
	nop			;69dc
	rst 38h			;69dd
	cp a			;69de
	cp a			;69df
	ld bc,lfafdh		;69e0
	ei			;69e3
	sbc a,0f7h		;69e4
	cp l			;69e6
	rst 28h			;69e7
	nop			;69e8
	rrca			;69e9
	ld l,a			;69ea
	rst 38h			;69eb
	rst 38h			;69ec
	rst 38h			;69ed
	cp b			;69ee
	dec c			;69ef
	cp a			;69f0
	defb 0edh ;next byte illegal after ed	;69f1
	sbc a,0ffh		;69f2
	rst 38h			;69f4
	rst 38h			;69f5
	rst 38h			;69f6
	rst 38h			;69f7
	ld a,a			;69f8
	rst 38h			;69f9
	ex af,af'		;69fa
	rra			;69fb
	rst 38h			;69fc
	rst 38h			;69fd
	rst 38h			;69fe
	cp a			;69ff
	call nc,sub_6abdh	;6a00
	ei			;6a03
	sbc a,0f7h		;6a04
	cp l			;6a06
	rst 28h			;6a07
	nop			;6a08
	nop			;6a09
	nop			;6a0a
	dec e			;6a0b
	rst 38h			;6a0c
	rst 38h			;6a0d
	rst 38h			;6a0e
	defb 0fdh,0feh,0ddh ;illegal sequence	;6a0f
	cp 0ffh			;6a12
	rst 38h			;6a14
	rst 38h			;6a15
	rst 38h			;6a16
	cp 02ah			;6a17
	xor d			;6a19
	nop			;6a1a
	cp a			;6a1b
	rst 28h			;6a1c
l6a1dh:
	rst 38h			;6a1d
	rst 38h			;6a1e
	cp a			;6a1f
l6a20h:
	ld a,(hl)		;6a20
	defb 0fdh,0feh,0fbh ;illegal sequence	;6a21
	sbc a,0f6h		;6a24
	cp l			;6a26
	rst 28h			;6a27
	ld hl,(001aah)		;6a28
	ld bc,lfcffh		;6a2b
	rst 38h			;6a2e
	cp l			;6a2f
	sbc a,0fdh		;6a30
	cp 0ffh			;6a32
	rst 38h			;6a34
	rst 38h			;6a35
	rst 38h			;6a36
	rst 38h			;6a37
	nop			;6a38
	nop			;6a39
	rlca			;6a3a
	rrca			;6a3b
	rst 38h			;6a3c
	rst 38h			;6a3d
	nop			;6a3e
	ccf			;6a3f
sub_6a40h:
	ld a,(hl)		;6a40
	defb 0fdh,0feh,0ebh ;illegal sequence	;6a41
	sbc a,0f7h		;6a44
	cp l			;6a46
	rst 28h			;6a47
	nop			;6a48
	nop			;6a49
	ld a,(bc)		;6a4a
	ld a,a			;6a4b
	cp 0ffh			;6a4c
	cp 0ffh			;6a4e
	ld a,(hl)		;6a50
	defb 0fdh,0feh,0deh ;illegal sequence	;6a51
	cp 06fh			;6a54
	rst 38h			;6a56
	di			;6a57
	rst 38h			;6a58
	rst 38h			;6a59
	dec (hl)		;6a5a
	nop			;6a5b
	nop			;6a5c
	rst 38h			;6a5d
	cp a			;6a5e
sub_6a5fh:
	cp a			;6a5f
	ld bc,lfafdh		;6a60
	ei			;6a63
	sbc a,0f7h		;6a64
	cp l			;6a66
	rst 28h			;6a67
	nop			;6a68
	rrca			;6a69
sub_6a6ah:
	ld l,a			;6a6a
	rst 38h			;6a6b
	rst 38h			;6a6c
	rst 38h			;6a6d
	cp a			;6a6e
	push af			;6a6f
	and c			;6a70
	defb 0fdh,0dah,0ffh ;illegal sequence	;6a71
	rst 38h			;6a74
l6a75h:
	rst 30h			;6a75
	ret po			;6a76
	rst 38h			;6a77
	ld hl,(000aah)		;6a78
	rra			;6a7b
	rst 38h			;6a7c
	rst 38h			;6a7d
	rst 38h			;6a7e
	rst 38h			;6a7f
	or d			;6a80
	ld a,h			;6a81
	and 0fbh		;6a82
	sbc a,0f7h		;6a84
	cp l			;6a86
	rst 28h			;6a87
	ld a,a			;6a88
	rst 38h			;6a89
	ld (bc),a		;6a8a
	ld l,00fh		;6a8b
	rst 38h			;6a8d
	rst 38h			;6a8e
	ei			;6a8f
	cp 0ddh			;6a90
	cp 003h			;6a92
	add a,b			;6a94
	nop			;6a95
	rrca			;6a96
	rst 38h			;6a97
	ld a,a			;6a98
	rst 38h			;6a99
	nop			;6a9a
	rst 38h			;6a9b
	rst 18h			;6a9c
	rst 38h			;6a9d
	rst 38h			;6a9e
	cp a			;6a9f
	ld a,(hl)		;6aa0
	dec c			;6aa1
	cp 0fbh			;6aa2
	sbc a,0f7h		;6aa4
	dec a			;6aa6
	rst 28h			;6aa7
	ld d,l			;6aa8
	ld d,l			;6aa9
	ld bc,lff01h		;6aaa
	call m,sub_bfffh	;6aad
sub_6ab0h:
	ld a,(hl)		;6ab0
	defb 0fdh,0feh,0ffh ;illegal sequence	;6ab1
	rst 38h			;6ab4
	rst 38h			;6ab5
	rst 38h			;6ab6
	rst 38h			;6ab7
	nop			;6ab8
	nop			;6ab9
	rlca			;6aba
	cpl			;6abb
	rst 38h			;6abc
sub_6abdh:
	ret nz			;6abd
	rst 38h			;6abe
	ret m			;6abf
	ld a,(hl)		;6ac0
	defb 0fdh,0feh,0f3h ;illegal sequence	;6ac1
	sbc a,0f7h		;6ac4
	cp l			;6ac6
	rst 28h			;6ac7
	ld a,a			;6ac8
	rst 38h			;6ac9
	dec c			;6aca
	ld a,a			;6acb
sub_6acch:
	rst 38h			;6acc
	nop			;6acd
	ld a,0ffh		;6ace
	ld a,(hl)		;6ad0
	defb 0fdh,0feh,0c6h ;illegal sequence	;6ad1
	rst 38h			;6ad4
	ld l,a			;6ad5
	rst 38h			;6ad6
	ei			;6ad7
	xor d			;6ad8
	xor d			;6ad9
l6adah:
	dec a			;6ada
	nop			;6adb
	nop			;6adc
	rst 38h			;6add
	cp a			;6ade
	cp a			;6adf
	ld bc,lf4edh		;6ae0
	ei			;6ae3
	sbc a,0f7h		;6ae4
	cp l			;6ae6
	rst 28h			;6ae7
sub_6ae8h:
	nop			;6ae8
	rrca			;6ae9
	ld e,a			;6aea
	rst 38h			;6aeb
	rst 38h			;6aec
	rst 38h			;6aed
	cp a			;6aee
	push af			;6aef
	and c			;6af0
	ld a,l			;6af1
	or h			;6af2
	rst 38h			;6af3
	jp lebefh		;6af4
	rst 38h			;6af7
	ld d,l			;6af8
	ld d,l			;6af9
	nop			;6afa
	rra			;6afb
	rst 38h			;6afc
	rst 38h			;6afd
	rst 38h			;6afe
	rst 38h			;6aff
	cp (hl)			;6b00
	cp l			;6b01
	cp 0fbh			;6b02
	sbc a,0f7h		;6b04
	cp l			;6b06
	rst 28h			;6b07
	ld hl,(000aah)		;6b08
	ld (hl),b		;6b0b
	rst 38h			;6b0c
	rst 38h			;6b0d
	rst 38h			;6b0e
	ei			;6b0f
	cp 0ddh			;6b10
	cp 0ffh			;6b12
	rst 38h			;6b14
	rst 38h			;6b15
	rst 38h			;6b16
	rst 38h			;6b17
	nop			;6b18
	nop			;6b19
	nop			;6b1a
	rst 38h			;6b1b
	rst 18h			;6b1c
	rst 38h			;6b1d
	rst 38h			;6b1e
	cp a			;6b1f
	ld a,(hl)		;6b20
	defb 0fdh,0feh,0fbh ;illegal sequence	;6b21
	sbc a,0f7h		;6b24
	cp l			;6b26
	rst 28h			;6b27
	ld hl,(001aah)		;6b28
	inc bc			;6b2b
	rst 38h			;6b2c
	ret m			;6b2d
	rst 38h			;6b2e
	cp e			;6b2f
	jp m,lfe0dh		;6b30
	rst 38h			;6b33
	rst 38h			;6b34
	rst 38h			;6b35
	rst 38h			;6b36
	rst 38h			;6b37
	nop			;6b38
	nop			;6b39
	inc bc			;6b3a
	rra			;6b3b
	rst 38h			;6b3c
	ret nz			;6b3d
	rst 38h			;6b3e
	ei			;6b3f
	cp 0fdh			;6b40
	cp 0fbh			;6b42
	sbc a,0f7h		;6b44
l6b46h:
	cp l			;6b46
	rst 28h			;6b47
	ld hl,(00aaah)		;6b48
	rst 38h			;6b4b
	call m,sub_beffh	;6b4c
	rst 38h			;6b4f
	ld a,(hl)		;6b50
	defb 0fdh,0feh,0f6h ;illegal sequence	;6b51
	nop			;6b54
	ld l,a			;6b55
	rst 38h			;6b56
	ei			;6b57
	rst 38h			;6b58
	rst 38h			;6b59
	dec hl			;6b5a
	nop			;6b5b
	nop			;6b5c
	rst 38h			;6b5d
	add a,b			;6b5e
	ccf			;6b5f
	ld bc,lf4edh		;6b60
	ei			;6b63
	sbc a,0f7h		;6b64
	cp l			;6b66
	rst 28h			;6b67
	nop			;6b68
	rrca			;6b69
	ld d,a			;6b6a
	rst 38h			;6b6b
	rst 38h			;6b6c
	rst 38h			;6b6d
	cp a			;6b6e
	push af			;6b6f
	and c			;6b70
	cp l			;6b71
	xor d			;6b72
	ret m			;6b73
	exx			;6b74
	adc a,0ebh		;6b75
	rst 38h			;6b77
	ld hl,(002aah)		;6b78
	rra			;6b7b
	rst 38h			;6b7c
	rst 38h			;6b7d
	rst 38h			;6b7e
	rst 38h			;6b7f
	ld a,(hl)		;6b80
	ld a,l			;6b81
	cp 0fbh			;6b82
	sbc a,0f7h		;6b84
	cp l			;6b86
	rst 28h			;6b87
	ld d,l			;6b88
	ld d,l			;6b89
	nop			;6b8a
	ld a,a			;6b8b
	rst 38h			;6b8c
	rst 38h			;6b8d
	rst 38h			;6b8e
	rst 30h			;6b8f
	cp 0ddh			;6b90
	cp 001h			;6b92
	ld bc,lff01h		;6b94
	rst 38h			;6b97
	nop			;6b98
	nop			;6b99
	nop			;6b9a
	rst 38h			;6b9b
	cp a			;6b9c
	rst 38h			;6b9d
	rst 38h			;6b9e
	cp a			;6b9f
	ld a,(hl)		;6ba0
	defb 0fdh,0feh,0fbh ;illegal sequence	;6ba1
	sbc a,0f7h		;6ba4
	cp l			;6ba6
	rst 28h			;6ba7
	ld d,l			;6ba8
	ld d,l			;6ba9
	inc bc			;6baa
	inc bc			;6bab
	rst 38h			;6bac
	ret m			;6bad
	rst 38h			;6bae
	cp a			;6baf
	ld a,(hl)		;6bb0
	defb 0fdh,0feh,0ffh ;illegal sequence	;6bb1
	rst 38h			;6bb4
	rst 38h			;6bb5
	rst 38h			;6bb6
	rst 38h			;6bb7
	nop			;6bb8
	nop			;6bb9
	rlca			;6bba
	ld e,a			;6bbb
	rst 38h			;6bbc
	ret nz			;6bbd
	rst 38h			;6bbe
	ei			;6bbf
	cp 08dh			;6bc0
	cp 0fbh			;6bc2
	sbc a,0f7h		;6bc4
	cp l			;6bc6
	rst 28h			;6bc7
	ld d,l			;6bc8
	ld d,l			;6bc9
	inc d			;6bca
	rst 38h			;6bcb
	call m,sub_beffh	;6bcc
	rst 38h			;6bcf
	ld a,(hl)		;6bd0
	defb 0fdh,0feh,0c6h ;illegal sequence	;6bd1
	rst 38h			;6bd4
	ld h,b			;6bd5
	nop			;6bd6
	rlca			;6bd7
	ret m			;6bd8
	nop			;6bd9
	dec sp			;6bda
	nop			;6bdb
	nop			;6bdc
	rst 38h			;6bdd
	cp e			;6bde
	push af			;6bdf
	and c			;6be0
	defb 0edh ;next byte illegal after ed	;6be1
	call p,sub_defbh	;6be2
	rst 30h			;6be5
	cp l			;6be6
	rst 28h			;6be7
	nop			;6be8
	rrca			;6be9
	jp z,lffffh		;6bea
	rst 38h			;6bed
	cp a			;6bee
	rst 38h			;6bef
	ld bc,0545dh		;6bf0
	jp m,01e1ch		;6bf3
	ld a,c			;6bf6
	ret nz			;6bf7
	ld d,l			;6bf8
	ld d,l			;6bf9
	nop			;6bfa
	rrca			;6bfb
	rst 38h			;6bfc
	rst 38h			;6bfd
	rst 38h			;6bfe
	rst 38h			;6bff
	ld a,(hl)		;6c00
	defb 0ddh,0feh,0fbh ;illegal sequence	;6c01
	sbc a,0f7h		;6c04
	cp l			;6c06
	rst 28h			;6c07
	ld hl,(000aah)		;6c08
	ld a,a			;6c0b
	rst 38h			;6c0c
	rst 38h			;6c0d
	rst 38h			;6c0e
	rst 30h			;6c0f
	cp 0fdh			;6c10
	cp 0ffh			;6c12
	rst 38h			;6c14
	rst 38h			;6c15
	rst 38h			;6c16
	rst 38h			;6c17
	nop			;6c18
	nop			;6c19
	nop			;6c1a
	rst 38h			;6c1b
	cp a			;6c1c
	rst 38h			;6c1d
l6c1eh:
	rst 38h			;6c1e
	cp a			;6c1f
	ld a,(hl)		;6c20
	dec c			;6c21
	cp 0fbh			;6c22
	sbc a,0f7h		;6c24
	cp l			;6c26
	rst 28h			;6c27
	ld hl,(003aah)		;6c28
	inc bc			;6c2b
	rst 38h			;6c2c
	ret m			;6c2d
	rst 38h			;6c2e
	cp (hl)			;6c2f
	xor 0fdh		;6c30
	cp 0ffh			;6c32
	rst 38h			;6c34
	rst 38h			;6c35
	rst 38h			;6c36
	rst 38h			;6c37
	nop			;6c38
	nop			;6c39
	ld b,01fh		;6c3a
	rst 38h			;6c3c
	add a,b			;6c3d
	rst 38h			;6c3e
	ei			;6c3f
	cp 0ddh			;6c40
	cp 0fbh			;6c42
	sbc a,0f7h		;6c44
	cp l			;6c46
	rst 28h			;6c47
	ld hl,(01aaah)		;6c48
	rst 38h			;6c4b
	call m,sub_beffh	;6c4c
	rst 38h			;6c4f
	ld a,(hl)		;6c50
	defb 0fdh,0fch,0ffh ;illegal sequence	;6c51
	rst 38h			;6c54
	rst 38h			;6c55
	rst 38h			;6c56
	rst 38h			;6c57
	ret p			;6c58
	nop			;6c59
	scf			;6c5a
	nop			;6c5b
	nop			;6c5c
	rst 38h			;6c5d
	cp e			;6c5e
	push af			;6c5f
	and c			;6c60
	adc a,l			;6c61
	ret pe			;6c62
	ei			;6c63
	sbc a,0f7h		;6c64
	cp l			;6c66
	rst 28h			;6c67
	nop			;6c68
	ex af,af'		;6c69
	or l			;6c6a
	ld l,e			;6c6b
	rst 38h			;6c6c
	rst 38h			;6c6d
	cp a			;6c6e
	jp m,0bd41h		;6c6f
	ld l,d			;6c72
	ex (sp),hl		;6c73
	rst 18h			;6c74
	cp a			;6c75
	call m,02a1fh		;6c76
	xor d			;6c79
	nop			;6c7a
	adc a,a			;6c7b
	rst 38h			;6c7c
	rst 38h			;6c7d
	rst 38h			;6c7e
	cp 000h			;6c7f
	ld e,l			;6c81
	nop			;6c82
	nop			;6c83
	nop			;6c84
	nop			;6c85
	nop			;6c86
	nop			;6c87
	ld d,l			;6c88
	ld d,l			;6c89
l6c8ah:
	nop			;6c8a
	ld a,a			;6c8b
	ret m			;6c8c
	nop			;6c8d
	nop			;6c8e
	nop			;6c8f
	add a,b			;6c90
	call m,00000h		;6c91
	nop			;6c94
	nop			;6c95
	nop			;6c96
	nop			;6c97
	nop			;6c98
	nop			;6c99
	ld bc,l7f7fh		;6c9a
	rst 38h			;6c9d
	rst 38h			;6c9e
	cp a			;6c9f
	ld a,(hl)		;6ca0
	defb 0fdh,0feh,000h ;illegal sequence	;6ca1
	nop			;6ca4
	nop			;6ca5
	nop			;6ca6
	nop			;6ca7
	ld d,l			;6ca8
	ld d,l			;6ca9
	ld (bc),a		;6caa
	rlca			;6cab
	rst 38h			;6cac
	ret p			;6cad
	rst 38h			;6cae
	cp a			;6caf
	ld a,(hl)		;6cb0
	defb 0fdh,0feh,000h ;illegal sequence	;6cb1
	nop			;6cb4
l6cb5h:
	nop			;6cb5
	nop			;6cb6
	nop			;6cb7
	nop			;6cb8
	nop			;6cb9
	rrca			;6cba
	cp a			;6cbb
	rst 38h			;6cbc
	add a,b			;6cbd
	cp 000h			;6cbe
	ld a,(hl)		;6cc0
	pop bc			;6cc1
	cp 000h			;6cc2
	nop			;6cc4
	nop			;6cc5
	nop			;6cc6
	nop			;6cc7
	rst 38h			;6cc8
	rst 38h			;6cc9
	ld d,0ffh		;6cca
	ret m			;6ccc
	rst 38h			;6ccd
	cp (hl)			;6cce
	rst 38h			;6ccf
	ld a,(hl)		;6cd0
	defb 0fdh,0fch,000h ;illegal sequence	;6cd1
	nop			;6cd4
	nop			;6cd5
	nop			;6cd6
	nop			;6cd7
	ret po			;6cd8
	nop			;6cd9
	ld (hl),a		;6cda
	nop			;6cdb
	nop			;6cdc
	rst 38h			;6cdd
	cp e			;6cde
	push af			;6cdf
	and c			;6ce0
	defb 0edh ;next byte illegal after ed	;6ce1
	ret pe			;6ce2
	nop			;6ce3
	nop			;6ce4
	nop			;6ce5
	nop			;6ce6
	nop			;6ce7
	nop			;6ce8
	ex af,af'		;6ce9
	xor d			;6cea
	or l			;6ceb
	or a			;6cec
	rst 18h			;6ced
	cp a			;6cee
	defb 0fdh,081h,0e9h ;illegal sequence	;6cef
	ld d,h			;6cf2
	rst 38h			;6cf3
	rst 38h			;6cf4
	rst 38h			;6cf5
l6cf6h:
	rst 38h			;6cf6
	rst 38h			;6cf7
	ld d,l			;6cf8
	ld d,l			;6cf9
	rlca			;6cfa
	rlca			;6cfb
	rlca			;6cfc
	rlca			;6cfd
	rlca			;6cfe
	rlca			;6cff
	rlca			;6d00
	rlca			;6d01
	rlca			;6d02
	rlca			;6d03
	rlca			;6d04
	rlca			;6d05
	rlca			;6d06
	rlca			;6d07
	rlca			;6d08
	rlca			;6d09
	rlca			;6d0a
	rlca			;6d0b
	rlca			;6d0c
	rlca			;6d0d
	rlca			;6d0e
	rlca			;6d0f
	rlca			;6d10
	rlca			;6d11
	rlca			;6d12
	rlca			;6d13
	rlca			;6d14
	rlca			;6d15
	rlca			;6d16
	rlca			;6d17
	rlca			;6d18
	rlca			;6d19
	rlca			;6d1a
	rlca			;6d1b
	rlca			;6d1c
	rlca			;6d1d
	rlca			;6d1e
	rlca			;6d1f
	rlca			;6d20
	rlca			;6d21
	rlca			;6d22
	rlca			;6d23
	rlca			;6d24
	rlca			;6d25
	rlca			;6d26
	rlca			;6d27
	rlca			;6d28
	rlca			;6d29
	rlca			;6d2a
	rlca			;6d2b
	rlca			;6d2c
	rlca			;6d2d
	rlca			;6d2e
	dec b			;6d2f
	dec b			;6d30
l6d31h:
	dec b			;6d31
	dec b			;6d32
	rlca			;6d33
	rlca			;6d34
	rlca			;6d35
	rla			;6d36
	rla			;6d37
	rla			;6d38
	daa			;6d39
	rlca			;6d3a
	rlca			;6d3b
	rlca			;6d3c
	rlca			;6d3d
	rlca			;6d3e
	dec b			;6d3f
	dec b			;6d40
	dec b			;6d41
	dec b			;6d42
	rlca			;6d43
	rlca			;6d44
	rlca			;6d45
	rla			;6d46
	rla			;6d47
	rla			;6d48
	daa			;6d49
	rlca			;6d4a
	rlca			;6d4b
	rlca			;6d4c
	rlca			;6d4d
	rlca			;6d4e
	rlca			;6d4f
	rlca			;6d50
	inc b			;6d51
	rlca			;6d52
	rlca			;6d53
	rlca			;6d54
	rlca			;6d55
	rlca			;6d56
	daa			;6d57
	daa			;6d58
	daa			;6d59
	rlca			;6d5a
	rlca			;6d5b
	rlca			;6d5c
	rlca			;6d5d
	rlca			;6d5e
	rlca			;6d5f
	rlca			;6d60
	inc b			;6d61
	rlca			;6d62
	rlca			;6d63
	rlca			;6d64
	rlca			;6d65
	rlca			;6d66
	daa			;6d67
	daa			;6d68
	daa			;6d69
	rlca			;6d6a
	rlca			;6d6b
	rlca			;6d6c
	rlca			;6d6d
	rlca			;6d6e
	rlca			;6d6f
	rlca			;6d70
	inc b			;6d71
	rlca			;6d72
	rlca			;6d73
	rlca			;6d74
	rlca			;6d75
	rlca			;6d76
	daa			;6d77
	daa			;6d78
	daa			;6d79
	rlca			;6d7a
	rlca			;6d7b
	rlca			;6d7c
	rlca			;6d7d
	rlca			;6d7e
	rlca			;6d7f
	rlca			;6d80
	inc b			;6d81
	rlca			;6d82
	ld b,006h		;6d83
	ld b,006h		;6d85
	ld b,027h		;6d87
	daa			;6d89
	rlca			;6d8a
	rlca			;6d8b
	rlca			;6d8c
	rlca			;6d8d
	rlca			;6d8e
	rlca			;6d8f
	rlca			;6d90
	inc b			;6d91
	rlca			;6d92
	inc bc			;6d93
	inc bc			;6d94
	inc bc			;6d95
	inc bc			;6d96
	inc bc			;6d97
	daa			;6d98
	daa			;6d99
	rlca			;6d9a
	rlca			;6d9b
	rlca			;6d9c
	rlca			;6d9d
	rlca			;6d9e
	rlca			;6d9f
	rlca			;6da0
	inc b			;6da1
	rlca			;6da2
	ld b,006h		;6da3
	ld b,006h		;6da5
	ld b,027h		;6da7
	daa			;6da9
	rlca			;6daa
	dec a			;6dab
	dec a			;6dac
	dec a			;6dad
	rlca			;6dae
	rlca			;6daf
	rlca			;6db0
	inc b			;6db1
	rlca			;6db2
	inc bc			;6db3
	inc bc			;6db4
	inc bc			;6db5
	inc bc			;6db6
	inc bc			;6db7
	daa			;6db8
	daa			;6db9
	rlca			;6dba
	dec a			;6dbb
	dec b			;6dbc
	dec a			;6dbd
	rlca			;6dbe
	rlca			;6dbf
	rlca			;6dc0
	inc b			;6dc1
	rlca			;6dc2
	ld b,006h		;6dc3
	ld b,006h		;6dc5
	ld b,027h		;6dc7
	daa			;6dc9
	rlca			;6dca
	dec b			;6dcb
	dec a			;6dcc
	rlca			;6dcd
	rlca			;6dce
	ld (bc),a		;6dcf
	rlca			;6dd0
	inc b			;6dd1
	rlca			;6dd2
	inc bc			;6dd3
	inc bc			;6dd4
	inc bc			;6dd5
	inc bc			;6dd6
	inc bc			;6dd7
	jr c,l6e12h		;6dd8
	rlca			;6dda
	dec a			;6ddb
	dec a			;6ddc
	rlca			;6ddd
	rlca			;6dde
	rlca			;6ddf
	jr c,$+6		;6de0
	daa			;6de2
	ld b,006h		;6de3
	ld b,006h		;6de5
	ld b,027h		;6de7
	daa			;6de9
	rlca			;6dea
	rlca			;6deb
	rlca			;6dec
	rlca			;6ded
	rlca			;6dee
	rlca			;6def
	jr c,l6df6h		;6df0
	daa			;6df2
	inc bc			;6df3
	inc bc			;6df4
	inc bc			;6df5
l6df6h:
	inc bc			;6df6
	inc bc			;6df7
	daa			;6df8
	daa			;6df9
	nop			;6dfa
	nop			;6dfb
	nop			;6dfc
	nop			;6dfd
	nop			;6dfe
	nop			;6dff
	nop			;6e00
	nop			;6e01
	nop			;6e02
	nop			;6e03
	nop			;6e04
	nop			;6e05
	nop			;6e06
	nop			;6e07
	nop			;6e08
	nop			;6e09
	nop			;6e0a
	nop			;6e0b
	nop			;6e0c
	nop			;6e0d
	nop			;6e0e
	nop			;6e0f
	nop			;6e10
	nop			;6e11
l6e12h:
	nop			;6e12
	nop			;6e13
	nop			;6e14
	nop			;6e15
	nop			;6e16
	nop			;6e17
	nop			;6e18
	nop			;6e19
	nop			;6e1a
	nop			;6e1b
	nop			;6e1c
	nop			;6e1d
	nop			;6e1e
	nop			;6e1f
	nop			;6e20
	nop			;6e21
	nop			;6e22
	nop			;6e23
	adc a,d			;6e24
	ld d,0f3h		;6e25
	nop			;6e27
	jr z,l6e54h		;6e28
	rst 10h			;6e2a
	defb 0fdh,04ch ;ld c,iyh	;6e2b
	pop af			;6e2d
	add a,l			;6e2e
	nop			;6e2f
	ld b,005h		;6e30
	nop			;6e32
	jr nz,l6e5fh		;6e33
	nop			;6e35
	nop			;6e36
	xor e			;6e37
	nop			;6e38
	nop			;6e39
	nop			;6e3a
	ld bc,00100h		;6e3b
	nop			;6e3e
	nop			;6e3f
	nop			;6e40
	nop			;6e41
	nop			;6e42
	nop			;6e43
	jr nc,$+5		;6e44
	ld (hl),d		;6e46
	nop			;6e47
	jr l6ea6h		;6e48
	call nc,sub_7e78h	;6e4a
	adc a,000h		;6e4d
	ld d,h			;6e4f
	nop			;6e50
	inc bc			;6e51
	add a,b			;6e52
	nop			;6e53
l6e54h:
	ld (bc),a		;6e54
	ret nz			;6e55
	nop			;6e56
	ld b,000h		;6e57
	nop			;6e59
	nop			;6e5a
	nop			;6e5b
	add a,b			;6e5c
	ex af,af'		;6e5d
	inc b			;6e5e
l6e5fh:
	ld b,b			;6e5f
	nop			;6e60
	nop			;6e61
	nop			;6e62
	nop			;6e63
	dec l			;6e64
	ld d,l			;6e65
	ld d,(hl)		;6e66
	ret po			;6e67
	ld d,l			;6e68
	or b			;6e69
	nop			;6e6a
	nop			;6e6b
	nop			;6e6c
	ld a,0d0h		;6e6d
	dec b			;6e6f
	nop			;6e70
	nop			;6e71
	ld (hl),b		;6e72
	nop			;6e73
	nop			;6e74
	add a,b			;6e75
	dec bc			;6e76
	nop			;6e77
	nop			;6e78
	xor e			;6e79
	ret nz			;6e7a
	nop			;6e7b
	call m,00000h		;6e7c
	nop			;6e7f
	halt			;6e80
	bit 4,d			;6e81
	nop			;6e83
	nop			;6e84
	ld a,(hl)		;6e85
	ld e,000h		;6e86
	dec c			;6e88
	ld b,b			;6e89
	and 000h		;6e8a
	ret nz			;6e8c
	nop			;6e8d
	inc b			;6e8e
	nop			;6e8f
	ld h,b			;6e90
	nop			;6e91
	ld c,003h		;6e92
	push hl			;6e94
	ld e,b			;6e95
	ex af,af'		;6e96
	jr nc,l6e9fh		;6e97
l6e99h:
	xor d			;6e99
	xor e			;6e9a
	nop			;6e9b
	and b			;6e9c
	nop			;6e9d
	nop			;6e9e
l6e9fh:
	nop			;6e9f
	sub 0d4h		;6ea0
	ld c,h			;6ea2
	ret c			;6ea3
	nop			;6ea4
	nop			;6ea5
l6ea6h:
	nop			;6ea6
	nop			;6ea7
	inc c			;6ea8
	nop			;6ea9
	nop			;6eaa
l6eabh:
	nop			;6eab
	nop			;6eac
	nop			;6ead
	nop			;6eae
	nop			;6eaf
sub_6eb0h:
	ld d,000h		;6eb0
	nop			;6eb2
	pop hl			;6eb3
	add a,e			;6eb4
	ld d,d			;6eb5
	ld b,000h		;6eb6
	ld a,(bc)		;6eb8
	xor d			;6eb9
	xor d			;6eba
	and b			;6ebb
	add a,b			;6ebc
	nop			;6ebd
	ld b,b			;6ebe
	nop			;6ebf
	cpl			;6ec0
	ld e,a			;6ec1
	nop			;6ec2
	jr nz,l6ec5h		;6ec3
l6ec5h:
	nop			;6ec5
	nop			;6ec6
	nop			;6ec7
	inc c			;6ec8
	nop			;6ec9
l6ecah:
	nop			;6eca
	nop			;6ecb
	ex af,af'		;6ecc
	nop			;6ecd
	nop			;6ece
l6ecfh:
	nop			;6ecf
	add a,b			;6ed0
	djnz l6ed6h		;6ed1
	ret m			;6ed3
	jr nz,l6ed7h		;6ed4
l6ed6h:
	add a,(hl)		;6ed6
l6ed7h:
	ld d,b			;6ed7
	ld l,d			;6ed8
	xor d			;6ed9
	xor d			;6eda
	or b			;6edb
	ld b,b			;6edc
	ld b,000h		;6edd
	nop			;6edf
	jr c,l6ee2h		;6ee0
l6ee2h:
	add a,b			;6ee2
	ld bc,00000h		;6ee3
	nop			;6ee6
	nop			;6ee7
	inc b			;6ee8
	nop			;6ee9
l6eeah:
	nop			;6eea
	ld e,018h		;6eeb
	ld (hl),b		;6eed
	ld e,000h		;6eee
	nop			;6ef0
	ld bc,l9d00h		;6ef1
	defb 0fdh,05ah,083h ;illegal sequence	;6ef4
	ld b,b			;6ef7
	ld l,d			;6ef8
	xor d			;6ef9
	xor d			;6efa
	or b			;6efb
	nop			;6efc
	nop			;6efd
	nop			;6efe
	nop			;6eff
	nop			;6f00
	ld hl,(laaaah)		;6f01
	xor d			;6f04
	inc bc			;6f05
	add a,l			;6f06
	ld d,l			;6f07
	ld e,b			;6f08
	ld d,l			;6f09
	xor d			;6f0a
	rst 10h			;6f0b
	inc sp			;6f0c
	pop bc			;6f0d
	push hl			;6f0e
	add a,b			;6f0f
	nop			;6f10
	nop			;6f11
	ld d,l			;6f12
	ld d,l			;6f13
	ret nz			;6f14
	nop			;6f15
	nop			;6f16
	nop			;6f17
	ld a,(bc)		;6f18
	xor d			;6f19
	xor d			;6f1a
	xor d			;6f1b
	nop			;6f1c
	nop			;6f1d
	nop			;6f1e
	nop			;6f1f
	nop			;6f20
	nop			;6f21
	nop			;6f22
	nop			;6f23
	ld e,e			;6f24
	ld a,(010f1h)		;6f25
	jr $+89			;6f28
	cpl			;6f2a
	ex de,hl		;6f2b
	di			;6f2c
	ld d,b			;6f2d
	ld h,d			;6f2e
	add a,b			;6f2f
	ld (bc),a		;6f30
	ld a,(bc)		;6f31
	nop			;6f32
	nop			;6f33
	ld d,000h		;6f34
	ld bc,00055h		;6f36
	nop			;6f39
	nop			;6f3a
	add a,b			;6f3b
	nop			;6f3c
	ld bc,00000h		;6f3d
	nop			;6f40
	nop			;6f41
	nop			;6f42
	nop			;6f43
	ld d,b			;6f44
	ld (bc),a		;6f45
	jp p,01000h		;6f46
	inc sp			;6f49
	and b			;6f4a
	add a,c			;6f4b
	ld d,a			;6f4c
	inc sp			;6f4d
	nop			;6f4e
l6f4fh:
	xor (hl)		;6f4f
	nop			;6f50
	ld bc,000c0h		;6f51
	ld bc,00040h		;6f54
	ld (bc),a		;6f57
	nop			;6f58
	nop			;6f59
	nop			;6f5a
	nop			;6f5b
	ld b,b			;6f5c
	ex af,af'		;6f5d
	ex af,af'		;6f5e
	jr nz,l6f61h		;6f5f
l6f61h:
	nop			;6f61
	nop			;6f62
	nop			;6f63
	ld d,0aah		;6f64
	xor e			;6f66
	ret po			;6f67
	inc sp			;6f68
	xor b			;6f69
	nop			;6f6a
	nop			;6f6b
	nop			;6f6c
	ld bc,00330h		;6f6d
	add a,b			;6f70
	nop			;6f71
	jr c,l6f74h		;6f72
l6f74h:
	rst 38h			;6f74
	nop			;6f75
	dec b			;6f76
	add a,b			;6f77
	jr nz,l6f4fh		;6f78
	ld (hl),b		;6f7a
	nop			;6f7b
	ret nc			;6f7c
	nop			;6f7d
	nop			;6f7e
	ld bc,05976h		;6f7f
	ld d,d			;6f82
	nop			;6f83
	nop			;6f84
	ld bc,000e0h		;6f85
	ld c,d			;6f88
	add a,b			;6f89
	nop			;6f8a
	nop			;6f8b
sub_6f8ch:
	add a,b			;6f8c
	nop			;6f8d
	inc bc			;6f8e
	cp b			;6f8f
	jr nc,l6f92h		;6f90
l6f92h:
	rlca			;6f92
	inc bc			;6f93
	cp d			;6f94
	call pe,01808h		;6f95
	inc bc			;6f98
	ld d,l			;6f99
	ld d,l			;6f9a
	add a,b			;6f9b
l6f9ch:
	ld b,b			;6f9c
	nop			;6f9d
	nop			;6f9e
	nop			;6f9f
	ld c,d			;6fa0
	sub 0f4h		;6fa1
	ret z			;6fa3
	nop			;6fa4
	nop			;6fa5
	nop			;6fa6
	nop			;6fa7
	inc h			;6fa8
	nop			;6fa9
	nop			;6faa
	nop			;6fab
	nop			;6fac
	nop			;6fad
	nop			;6fae
	nop			;6faf
	dec bc			;6fb0
	nop			;6fb1
	nop			;6fb2
	pop hl			;6fb3
	cp 0aah			;6fb4
	dec bc			;6fb6
	nop			;6fb7
	dec c			;6fb8
	ld d,l			;6fb9
	ld d,l			;6fba
	ld h,b			;6fbb
	nop			;6fbc
	nop			;6fbd
	ret nz			;6fbe
	nop			;6fbf
	dec sp			;6fc0
	rst 18h			;6fc1
	rlca			;6fc2
	ret m			;6fc3
	nop			;6fc4
sub_6fc5h:
	nop			;6fc5
	nop			;6fc6
	nop			;6fc7
	inc d			;6fc8
	nop			;6fc9
	ld bc,00880h		;6fca
	nop			;6fcd
	djnz l6fd0h		;6fce
l6fd0h:
	nop			;6fd0
	ex af,af'		;6fd1
	ld (bc),a		;6fd2
	ld b,01ch		;6fd3
	rlca			;6fd5
	ld b,030h		;6fd6
	ld d,l			;6fd8
	ld d,l			;6fd9
	ld d,l			;6fda
	ld d,b			;6fdb
	and b			;6fdc
	ld c,000h		;6fdd
	nop			;6fdf
	ld b,d			;6fe0
	xor a			;6fe1
	ld a,h			;6fe2
	ld (bc),a		;6fe3
	nop			;6fe4
	nop			;6fe5
	nop			;6fe6
	nop			;6fe7
	inc d			;6fe8
	nop			;6fe9
	nop			;6fea
	ld c,018h		;6feb
	ret p			;6fed
l6feeh:
	inc e			;6fee
	nop			;6fef
l6ff0h:
	inc b			;6ff0
	nop			;6ff1
	add a,b			;6ff2
	ld e,e			;6ff3
	sbc a,h			;6ff4
	dec h			;6ff5
	dec b			;6ff6
	ld b,b			;6ff7
	dec (hl)		;6ff8
	ld d,l			;6ff9
	ld d,l			;6ffa
	ld (hl),b		;6ffb
	nop			;6ffc
	nop			;6ffd
	nop			;6ffe
	nop			;6fff
	nop			;7000
	nop			;7001
	ld d,l			;7002
	ld d,l			;7003
	ld d,h			;7004
	cp 072h			;7005
	xor d			;7007
	xor h			;7008
	xor e			;7009
	push de			;700a
	defb 0edh ;next byte illegal after ed	;700b
	adc a,0c0h		;700c
	ld a,080h		;700e
	nop			;7010
	ld a,(hl)		;7011
	ld hl,(lc0aah)		;7012
	nop			;7015
	nop			;7016
	nop			;7017
	nop			;7018
	dec d			;7019
	ld d,l			;701a
	ld d,l			;701b
l701ch:
	nop			;701c
	nop			;701d
	nop			;701e
	nop			;701f
	nop			;7020
	nop			;7021
	nop			;7022
	nop			;7023
l7024h:
	xor e			;7024
	dec sp			;7025
	ld (hl),c		;7026
	nop			;7027
	jr z,l7036h		;7028
	defb 0ddh,0ech,0cch ;illegal sequence	;702a
	ret p			;702d
	dec e			;702e
	add a,b			;702f
l7030h:
	inc bc			;7030
	inc bc			;7031
	nop			;7032
	nop			;7033
	dec bc			;7034
	nop			;7035
l7036h:
	ld bc,000abh		;7036
	nop			;7039
	nop			;703a
	nop			;703b
	add a,b			;703c
	ld bc,00000h		;703d
	nop			;7040
	nop			;7041
	nop			;7042
	nop			;7043
	jr z,l70bdh		;7044
	ld (hl),d		;7046
	nop			;7047
	djnz l70a7h		;7048
	ld b,b			;704a
	ld a,(bc)		;704b
	xor e			;704c
	call 05606h		;704d
	nop			;7050
	ld bc,000c0h		;7051
	ld (bc),a		;7054
l7055h:
	and b			;7055
	nop			;7056
	inc bc			;7057
	nop			;7058
	nop			;7059
	nop			;705a
	nop			;705b
	and b			;705c
	ex af,af'		;705d
	ex af,af'		;705e
	nop			;705f
sub_7060h:
	nop			;7060
	ld bc,00050h		;7061
	dec bc			;7064
	ld d,l			;7065
	ld a,a			;7066
	ret p			;7067
	rra			;7068
	ld d,b			;7069
	nop			;706a
	nop			;706b
	nop			;706c
	nop			;706d
	ret nc			;706e
	ld bc,00080h		;706f
	jr c,l7075h		;7072
	ld d,l			;7074
l7075h:
	ret nz			;7075
	ld (bc),a		;7076
	add a,b			;7077
l7078h:
	jr nz,l7024h		;7078
	cp b			;707a
	nop			;707b
	xor b			;707c
	nop			;707d
	nop			;707e
	ld bc,l7dbfh		;707f
	ld d,e			;7082
	nop			;7083
	nop			;7084
	nop			;7085
	nop			;7086
	nop			;7087
	dec d			;7088
	nop			;7089
	nop			;708a
	nop			;708b
	nop			;708c
	nop			;708d
l708eh:
	nop			;708e
	xor 050h		;708f
	nop			;7091
	rlca			;7092
	inc bc			;7093
	ld (hl),c		;7094
	call p,02814h		;7095
	ld (bc),a		;7098
	xor d			;7099
	xor d			;709a
l709bh:
	ret nz			;709b
	and b			;709c
	nop			;709d
	nop			;709e
	nop			;709f
	inc sp			;70a0
	ld (hl),l		;70a1
	add a,h			;70a2
	inc b			;70a3
	nop			;70a4
	nop			;70a5
	nop			;70a6
l70a7h:
	nop			;70a7
	inc e			;70a8
	nop			;70a9
	ld b,b			;70aa
	nop			;70ab
	nop			;70ac
	nop			;70ad
	nop			;70ae
	nop			;70af
	dec b			;70b0
	add a,b			;70b1
	nop			;70b2
	pop hl			;70b3
	push af			;70b4
	ld d,d			;70b5
	dec b			;70b6
	nop			;70b7
	ld b,0aah		;70b8
	xor d			;70ba
	ret nz			;70bb
	add a,b			;70bc
l70bdh:
	nop			;70bd
l70beh:
	add a,b			;70be
	nop			;70bf
	ld c,0abh		;70c0
	add a,b			;70c2
	ld c,000h		;70c3
	nop			;70c5
	nop			;70c6
	nop			;70c7
	ld h,000h		;70c8
	nop			;70ca
	add a,b			;70cb
	inc c			;70cc
	nop			;70cd
	djnz l70d0h		;70ce
l70d0h:
	nop			;70d0
	inc c			;70d1
	inc bc			;70d2
	cp 023h			;70d3
	cp h			;70d5
	inc b			;70d6
	ld d,b			;70d7
	ld l,d			;70d8
	xor d			;70d9
	xor d			;70da
	xor b			;70db
	ld d,b			;70dc
	ld d,000h		;70dd
	nop			;70df
	sub l			;70e0
	ld d,c			;70e1
	dec de			;70e2
	inc b			;70e3
	nop			;70e4
	nop			;70e5
	nop			;70e6
	nop			;70e7
	inc c			;70e8
	nop			;70e9
	nop			;70ea
	ld c,03ch		;70eb
	ret po			;70ed
	inc a			;70ee
	nop			;70ef
	nop			;70f0
	nop			;70f1
	add a,b			;70f2
	ld b,(hl)		;70f3
	ld h,d			;70f4
	nop			;70f5
	dec bc			;70f6
	ret nz			;70f7
	ld hl,(laaaah)		;70f8
	add a,b			;70fb
l70fch:
	nop			;70fc
	nop			;70fd
	nop			;70fe
	nop			;70ff
	nop			;7100
	nop			;7101
	jr z,l708eh		;7102
l7104h:
	jr z,l7104h		;7104
	add hl,bc		;7106
	ld d,h			;7107
	ld d,h			;7108
	ld d,l			;7109
	dec hl			;710a
	sub 073h		;710b
	ld h,b			;710d
	dec bc			;710e
	add a,b			;710f
	inc bc			;7110
	xor e			;7111
	dec d			;7112
	ld b,l			;7113
	ld h,b			;7114
	nop			;7115
	nop			;7116
	nop			;7117
	nop			;7118
	nop			;7119
	ld hl,(000aah)		;711a
	nop			;711d
	nop			;711e
	nop			;711f
	nop			;7120
	nop			;7121
	nop			;7122
	nop			;7123
	ld e,e			;7124
	add hl,sp		;7125
	ld (hl),c		;7126
	nop			;7127
	jr $+41			;7128
	ld hl,(lb30fh)		;712a
	jr nc,l7139h		;712d
	add a,b			;712f
	nop			;7130
	add a,(hl)		;7131
	nop			;7132
	nop			;7133
	dec d			;7134
	nop			;7135
	inc bc			;7136
	ld d,l			;7137
	nop			;7138
l7139h:
	nop			;7139
	nop			;713a
	add a,b			;713b
	nop			;713c
	inc bc			;713d
	nop			;713e
	nop			;713f
	nop			;7140
	nop			;7141
	nop			;7142
	nop			;7143
	ld e,c			;7144
	sbc a,l			;7145
	ld (hl),e		;7146
	nop			;7147
	jr l70fch		;7148
	nop			;714a
	nop			;714b
	dec d			;714c
	or d			;714d
	add a,e			;714e
	jp z,00100h		;714f
	ret nz			;7152
	nop			;7153
	ld bc,00070h		;7154
	ld bc,00000h		;7157
	nop			;715a
	nop			;715b
	ld b,b			;715c
	djnz l7167h		;715d
	nop			;715f
	nop			;7160
	ld hl,00058h		;7161
	djnz $-15		;7164
	ret nz			;7166
l7167h:
	djnz l71c3h		;7167
	and b			;7169
	add hl,sp		;716a
	add a,b			;716b
	nop			;716c
	nop			;716d
	jr nc,l7172h		;716e
	add a,b			;7170
	nop			;7171
l7172h:
	inc e			;7172
	ld (bc),a		;7173
	adc a,d			;7174
	cp b			;7175
	ld bc,01180h		;7176
	ld d,l			;7179
	ld e,h			;717a
	nop			;717b
	ld d,b			;717c
	nop			;717d
	nop			;717e
	nop			;717f
	cp d			;7180
	and l			;7181
	ld d,c			;7182
	add a,b			;7183
	nop			;7184
	nop			;7185
	nop			;7186
	nop			;7187
	ld a,(000a0h)		;7188
	nop			;718b
	nop			;718c
	nop			;718d
	nop			;718e
	inc bc			;718f
	cp b			;7190
	nop			;7191
	inc bc			;7192
	add a,d			;7193
	ret nz			;7194
	call pe,0180eh		;7195
	dec b			;7198
	ld d,l			;7199
	ld d,l			;719a
	ld h,b			;719b
	ld b,b			;719c
	nop			;719d
	nop			;719e
	nop			;719f
	add hl,hl		;71a0
sub_71a1h:
	ld (hl),l		;71a1
	inc h			;71a2
	inc b			;71a3
	nop			;71a4
	nop			;71a5
	nop			;71a6
	nop			;71a7
	ex af,af'		;71a8
	nop			;71a9
	jr nz,l71ach		;71aa
l71ach:
	nop			;71ac
	ld bc,00083h		;71ad
	ld (bc),a		;71b0
	add a,b			;71b1
	nop			;71b2
	ld (hl),b		;71b3
	jp m,00b84h		;71b4
	add a,b			;71b7
	rlca			;71b8
	ld d,l			;71b9
	ld d,l			;71ba
	add a,b			;71bb
	nop			;71bc
	nop			;71bd
	adc a,h			;71be
	nop			;71bf
	rlca			;71c0
	ld l,080h		;71c1
l71c3h:
	inc bc			;71c3
	nop			;71c4
	nop			;71c5
	nop			;71c6
	nop			;71c7
	ld a,(bc)		;71c8
	jp p,sub_bfffh+1	;71c9
	ld c,040h		;71cc
	ex af,af'		;71ce
	nop			;71cf
	nop			;71d0
	inc b			;71d1
	inc bc			;71d2
	ld sp,hl		;71d3
	ld b,b			;71d4
	ex (sp),hl		;71d5
sub_71d6h:
	adc a,h			;71d6
	jr nc,$-41		;71d7
	ld d,l			;71d9
	ld d,l			;71da
	ld e,b			;71db
	xor d			;71dc
	ld a,(bc)		;71dd
	nop			;71de
	ld b,b			;71df
	xor d			;71e0
	add a,b			;71e1
	nop			;71e2
	sbc a,b			;71e3
	nop			;71e4
	nop			;71e5
	nop			;71e6
	nop			;71e7
	inc d			;71e8
	nop			;71e9
	nop			;71ea
	rra			;71eb
	inc a			;71ec
	call po,0003ch		;71ed
	nop			;71f0
	nop			;71f1
	add a,b			;71f2
	daa			;71f3
l71f4h:
	ld a,(hl)		;71f4
	nop			;71f5
	dec b			;71f6
	add a,b			;71f7
	ld d,l			;71f8
	ld d,l			;71f9
sub_71fah:
	ld d,l			;71fa
	add a,b			;71fb
	nop			;71fc
	nop			;71fd
	nop			;71fe
	nop			;71ff
	nop			;7200
	nop			;7201
	ld b,h			;7202
	ld b,c			;7203
	inc de			;7204
	add a,a			;7205
	call nz,02aa2h		;7206
	xor e			;7209
	push de			;720a
	defb 0edh ;next byte illegal after ed	;720b
	call z,015a0h		;720c
	add a,b			;720f
	rlca			;7210
	ld d,l			;7211
	ex af,af'		;7212
	xor d			;7213
	or b			;7214
l7215h:
	nop			;7215
sub_7216h:
	nop			;7216
	nop			;7217
	nop			;7218
	nop			;7219
	ld d,c			;721a
	ld b,l			;721b
	nop			;721c
	inc c			;721d
	nop			;721e
	nop			;721f
	nop			;7220
	nop			;7221
	nop			;7222
	nop			;7223
	or b			;7224
	inc bc			;7225
	cp e			;7226
	nop			;7227
	ex af,af'		;7228
	ld e,h			;7229
	call c,sub_ec96h	;722a
	ret p			;722d
	dec d			;722e
	ld (hl),b		;722f
	nop			;7230
	ld e,e			;7231
l7232h:
	nop			;7232
	nop			;7233
	dec bc			;7234
	nop			;7235
	ld bc,000abh		;7236
	nop			;7239
l723ah:
	nop			;723a
l723bh:
	nop			;723b
	add a,b			;723c
	ld b,00eh		;723d
	nop			;723f
	nop			;7240
	nop			;7241
	nop			;7242
	nop			;7243
	ld hl,(lf155h)		;7244
	nop			;7247
	add hl,bc		;7248
	ld c,(hl)		;7249
	nop			;724a
	nop			;724b
	ld (bc),a		;724c
	call 03e40h		;724d
	nop			;7250
	nop			;7251
	ret po			;7252
	nop			;7253
	ld (bc),a		;7254
	and b			;7255
	nop			;7256
	nop			;7257
	nop			;7258
	nop			;7259
	nop			;725a
	nop			;725b
	and b			;725c
	jr nc,l726bh		;725d
	nop			;725f
	nop			;7260
	inc l			;7261
	adc a,b			;7262
	nop			;7263
	jr $+58			;7264
	nop			;7266
l7267h:
	jr nc,l7276h		;7267
	ld b,b			;7269
	nop			;726a
l726bh:
	nop			;726b
	nop			;726c
	nop			;726d
	jr l7271h		;726e
	ret nz			;7270
l7271h:
	nop			;7271
l7272h:
	inc e			;7272
	dec b			;7273
	nop			;7274
	ld d,h			;7275
l7276h:
	ld (bc),a		;7276
	ret nz			;7277
	ld (bc),a		;7278
	xor d			;7279
	xor h			;727a
	nop			;727b
	and b			;727c
	nop			;727d
	nop			;727e
	inc bc			;727f
	jp z,0f0b6h		;7280
	ret nz			;7283
	nop			;7284
	nop			;7285
	nop			;7286
	nop			;7287
	dec e			;7288
	ld b,b			;7289
	nop			;728a
	nop			;728b
	nop			;728c
	nop			;728d
	nop			;728e
	nop			;728f
	ld e,b			;7290
	nop			;7291
	inc bc			;7292
	add a,c			;7293
	add a,b			;7294
	ld d,h			;7295
	rla			;7296
	adc a,b			;7297
	ld b,0aah		;7298
	xor d			;729a
	and b			;729b
	add a,b			;729c
	ld bc,00000h		;729d
	dec sp			;72a0
	call 00210h		;72a1
	nop			;72a4
	nop			;72a5
	nop			;72a6
	nop			;72a7
	jr l72aah		;72a8
l72aah:
	jr l72b8h		;72aa
	nop			;72ac
	rlca			;72ad
	nop			;72ae
	nop			;72af
	ld bc,00060h		;72b0
	ld (hl),d		;72b3
	ei			;72b4
	jr z,l72beh		;72b5
	ld b,b			;72b7
l72b8h:
	ld a,(de)		;72b8
	xor d			;72b9
	xor d			;72ba
	ret nz			;72bb
	add a,b			;72bc
	nop			;72bd
l72beh:
	cp a			;72be
	add a,b			;72bf
	dec b			;72c0
	cp c			;72c1
	ret nz			;72c2
	ld bc,00080h		;72c3
	nop			;72c6
	nop			;72c7
	ld b,000h		;72c8
	ex af,af'		;72ca
	ld (hl),b		;72cb
	ld b,060h		;72cc
	inc c			;72ce
	nop			;72cf
	nop			;72d0
	inc b			;72d1
	ld bc,l7cc7h		;72d2
	nop			;72d5
	jr $+98			;72d6
	xor d			;72d8
	xor d			;72d9
	xor d			;72da
	or b			;72db
	ld d,l			;72dc
	ld d,000h		;72dd
	nop			;72df
	sub h			;72e0
	ld h,b			;72e1
	nop			;72e2
	ld h,b			;72e3
	nop			;72e4
	nop			;72e5
	nop			;72e6
	nop			;72e7
	inc c			;72e8
	add a,(hl)		;72e9
	nop			;72ea
	rst 18h			;72eb
	ld a,l			;72ec
	ret z			;72ed
	jr c,l72f0h		;72ee
l72f0h:
	djnz l72f2h		;72f0
l72f2h:
	ret nz			;72f2
	inc sp			;72f3
	ld (hl),a		;72f4
	ret nz			;72f5
	dec bc			;72f6
	nop			;72f7
	ld l,d			;72f8
	xor d			;72f9
	xor d			;72fa
	add a,b			;72fb
	nop			;72fc
	nop			;72fd
	nop			;72fe
	nop			;72ff
l7300h:
	nop			;7300
	nop			;7301
	nop			;7302
	ex af,af'		;7303
	ld h,07bh		;7304
	call po,05c10h		;7306
	ld d,a			;7309
	dec hl			;730a
	rst 30h			;730b
	or e			;730c
l730dh:
	ld (hl),b		;730d
	ld a,(bc)		;730e
	add a,b			;730f
	ld b,08bh		;7310
	nop			;7312
	ld b,h			;7313
	ld e,b			;7314
	nop			;7315
	nop			;7316
	nop			;7317
	nop			;7318
	nop			;7319
	ld (000a2h),hl		;731a
	ld b,000h		;731d
	nop			;731f
	nop			;7320
	nop			;7321
	nop			;7322
	nop			;7323
	ld e,h			;7324
	and a			;7325
	cp c			;7326
	nop			;7327
	ex af,af'		;7328
	daa			;7329
	ld a,(0332bh)		;732a
	jr c,l7331h		;732d
	or b			;732f
	nop			;7330
l7331h:
	scf			;7331
	nop			;7332
	nop			;7333
	dec b			;7334
	add a,b			;7335
	ld bc,00055h		;7336
	nop			;7339
	nop			;733a
	add a,b			;733b
	ld b,b			;733c
	inc b			;733d
	ld a,e			;733e
	nop			;733f
	nop			;7340
	nop			;7341
	nop			;7342
	nop			;7343
	dec d			;7344
	ld c,d			;7345
	or c			;7346
	nop			;7347
	jr l7300h		;7348
	nop			;734a
	inc bc			;734b
	nop			;734c
	di			;734d
	ret nz			;734e
	ld a,(bc)		;734f
	nop			;7350
	nop			;7351
	ret po			;7352
	nop			;7353
	dec b			;7354
	ld b,e			;7355
	ret p			;7356
	nop			;7357
	nop			;7358
	jr l735bh		;7359
l735bh:
	nop			;735b
	ld d,b			;735c
	ld h,b			;735d
	inc b			;735e
	nop			;735f
	add hl,de		;7360
	dec (hl)		;7361
	ret z			;7362
	nop			;7363
	ld c,000h		;7364
	nop			;7366
	jr nz,l7383h		;7367
	and b			;7369
	nop			;736a
	nop			;736b
	nop			;736c
	nop			;736d
	ex af,af'		;736e
	nop			;736f
	ret nz			;7370
	nop			;7371
	inc e			;7372
	ld b,000h		;7373
	inc l			;7375
	ld bc,00b40h		;7376
	ld d,l			;7379
	ld d,h			;737a
	nop			;737b
	ld d,b			;737c
	nop			;737d
	nop			;737e
	ld bc,lcf5bh		;737f
	ld h,c			;7382
l7383h:
	ld b,b			;7383
	nop			;7384
	nop			;7385
	nop			;7386
	nop			;7387
	ld hl,(00080h)		;7388
	nop			;738b
	nop			;738c
	nop			;738d
	nop			;738e
	nop			;738f
	jr z,l7392h		;7390
l7392h:
	inc bc			;7392
	add a,e			;7393
	nop			;7394
	ld hl,(le80ch)		;7395
	dec b			;7398
	ld d,l			;7399
	ld d,l			;739a
	ld h,b			;739b
	ld b,b			;739c
	ld bc,00080h		;739d
	ld hl,(l90bdh)		;73a0
	ld (de),a		;73a3
	nop			;73a4
	nop			;73a5
	nop			;73a6
	nop			;73a7
	ex af,af'		;73a8
	nop			;73a9
	nop			;73aa
	inc b			;73ab
	nop			;73ac
	inc c			;73ad
	nop			;73ae
	nop			;73af
	nop			;73b0
	and b			;73b1
	nop			;73b2
	scf			;73b3
	ld a,b			;73b4
	ret nc			;73b5
	ld a,(bc)		;73b6
	and b			;73b7
	dec (hl)		;73b8
	ld d,l			;73b9
	ld d,l			;73ba
	ld h,b			;73bb
	nop			;73bc
	nop			;73bd
	ld h,b			;73be
	ld b,b			;73bf
	ld (bc),a		;73c0
	out (000h),a		;73c1
	nop			;73c3
	add a,b			;73c4
	nop			;73c5
	nop			;73c6
	nop			;73c7
	inc b			;73c8
	nop			;73c9
	nop			;73ca
	ld a,b			;73cb
	inc b			;73cc
	jr nz,l73dbh		;73cd
	dec de			;73cf
	ld b,b			;73d0
	inc b			;73d1
	ld bc,lbf02h		;73d2
	add a,b			;73d5
	jr nc,$-94		;73d6
	push de			;73d8
	ld d,l			;73d9
	ld d,l			;73da
l73dbh:
	ld d,b			;73db
	xor d			;73dc
	xor (hl)		;73dd
	nop			;73de
	ld b,b			;73df
	xor d			;73e0
	nop			;73e1
	nop			;73e2
	djnz l73e5h		;73e3
l73e5h:
	nop			;73e5
	nop			;73e6
	nop			;73e7
	inc b			;73e8
	nop			;73e9
	ld bc,lfb9fh		;73ea
	ret z			;73ed
	ld a,b			;73ee
	nop			;73ef
	djnz l73f2h		;73f0
l73f2h:
	ld (hl),b		;73f2
	djnz l742bh		;73f3
	ld h,b			;73f5
	ld d,000h		;73f6
	ld d,l			;73f8
	ld d,l			;73f9
	ld d,l			;73fa
	add a,b			;73fb
	nop			;73fc
	nop			;73fd
	nop			;73fe
	nop			;73ff
sub_7400h:
	nop			;7400
	nop			;7401
	ld b,h			;7402
	nop			;7403
	sub h			;7404
sub_7405h:
	dec c			;7405
	and 002h		;7406
	jr z,l7434h		;7408
	rst 10h			;740a
	defb 0ddh,0ech,0b0h ;illegal sequence	;740b
	dec b			;740e
	add a,b			;740f
	dec b			;7410
	dec b			;7411
	ex af,af'		;7412
	jr nz,l7441h		;7413
	nop			;7415
	nop			;7416
	ld a,(hl)		;7417
	nop			;7418
	nop			;7419
	ld bc,00001h		;741a
	ld (bc),a		;741d
	nop			;741e
	nop			;741f
	nop			;7420
	nop			;7421
	nop			;7422
	nop			;7423
	or (hl)			;7424
	and c			;7425
l7426h:
	ld a,c			;7426
	nop			;7427
	ex af,af'		;7428
	ld e,h			;7429
	ret nc			;742a
l742bh:
	rlca			;742b
	call c,001c8h		;742c
	ld e,b			;742f
	nop			;7430
	dec bc			;7431
	nop			;7432
	nop			;7433
l7434h:
	ld (bc),a		;7434
	add a,b			;7435
	nop			;7436
	rst 28h			;7437
	nop			;7438
	nop			;7439
	nop			;743a
	nop			;743b
	add a,b			;743c
	inc c			;743d
	pop bc			;743e
	nop			;743f
	nop			;7440
l7441h:
	nop			;7441
	nop			;7442
	nop			;7443
	dec l			;7444
	cp a			;7445
	exx			;7446
	nop			;7447
	ld sp,0006ch		;7448
	nop			;744b
	nop			;744c
	ld c,l			;744d
	ld b,b			;744e
	ld b,000h		;744f
	nop			;7451
	ld (hl),b		;7452
	nop			;7453
	ld a,(bc)		;7454
	sbc a,h			;7455
	inc l			;7456
	nop			;7457
	add a,b			;7458
	ld a,000h		;7459
	nop			;745b
	pop hl			;745c
l745dh:
	ret nz			;745d
	ld b,000h		;745e
	dec l			;7460
	sub (hl)		;7461
	and h			;7462
	nop			;7463
	inc bc			;7464
	nop			;7465
	nop			;7466
	ld h,b			;7467
	dec c			;7468
	ld d,h			;7469
	nop			;746a
	nop			;746b
	dec c			;746c
	add a,b			;746d
	inc c			;746e
	ld bc,00060h		;746f
	ld c,004h		;7472
	ld a,a			;7474
	ld (bc),a		;7475
	ld (bc),a		;7476
	and b			;7477
	ld (bc),a		;7478
	xor d			;7479
	xor d			;747a
	nop			;747b
	and b			;747c
	nop			;747d
	nop			;747e
	ld bc,04dedh		;747f
	ld a,(bc)		;7482
	jr nz,l7485h		;7483
l7485h:
	nop			;7485
	nop			;7486
	nop			;7487
	dec c			;7488
	nop			;7489
	nop			;748a
	nop			;748b
	nop			;748c
	nop			;748d
	nop			;748e
	nop			;748f
	jr l7492h		;7490
l7492h:
	ld bc,000c2h		;7492
	ld (de),a		;7495
	inc d			;7496
	jr c,l74a7h		;7497
	xor d			;7499
	xor d			;749a
	or b			;749b
	add a,b			;749c
	nop			;749d
	add a,b			;749e
	nop			;749f
	inc l			;74a0
l74a1h:
	jp m,01cc0h		;74a1
	nop			;74a4
	nop			;74a5
	nop			;74a6
l74a7h:
	nop			;74a7
	jr l74aah		;74a8
l74aah:
	nop			;74aa
	nop			;74ab
	nop			;74ac
	nop			;74ad
	nop			;74ae
	nop			;74af
	nop			;74b0
	ld h,b			;74b1
	nop			;74b2
	in a,(087h)		;74b3
	nop			;74b5
	rlca			;74b6
	ld h,b			;74b7
	ld hl,(laaaah)		;74b8
	and b			;74bb
	nop			;74bc
	ld bc,000c0h		;74bd
	ld bc,lc054h		;74c0
	ld bc,00080h		;74c3
	nop			;74c6
	nop			;74c7
	inc d			;74c8
	nop			;74c9
	nop			;74ca
	inc a			;74cb
	inc c			;74cc
	jr nz,l745dh		;74cd
	nop			;74cf
	nop			;74d0
	inc b			;74d1
	ld bc,lfd87h		;74d2
	ld l,a			;74d5
	push hl			;74d6
	ld b,b			;74d7
	ld l,d			;74d8
	xor d			;74d9
	xor d			;74da
	or b			;74db
	ld d,l			;74dc
	ld d,h			;74dd
	nop			;74de
	nop			;74df
	sub h			;74e0
	nop			;74e1
	nop			;74e2
	ex af,af'		;74e3
	nop			;74e4
	nop			;74e5
	nop			;74e6
	nop			;74e7
	inc d			;74e8
	nop			;74e9
	ld bc,0ff1fh		;74ea
	ret c			;74ed
	ret p			;74ee
	nop			;74ef
	nop			;74f0
	nop			;74f1
	inc e			;74f2
	djnz l752dh		;74f3
	jr c,l74a1h		;74f5
	nop			;74f7
	ld l,d			;74f8
	xor d			;74f9
	xor d			;74fa
	add a,b			;74fb
sub_74fch:
	nop			;74fc
	nop			;74fd
	nop			;74fe
	nop			;74ff
	nop			;7500
	nop			;7501
	nop			;7502
	add hl,bc		;7503
	inc h			;7504
	dec b			;7505
	jp p,01810h		;7506
	ld e,a			;7509
	ld hl,(0b3f7h)		;750a
l750dh:
	ld d,b			;750d
	inc bc			;750e
	nop			;750f
	inc b			;7510
	dec bc			;7511
	nop			;7512
	ld b,b			;7513
	ld d,000h		;7514
	nop			;7516
	sub 000h		;7517
	nop			;7519
	jr nz,$-92		;751a
	nop			;751c
	ld (bc),a		;751d
	nop			;751e
	nop			;751f
	nop			;7520
	nop			;7521
	nop			;7522
	nop			;7523
	ld d,b			;7524
	sub c			;7525
	ld a,e			;7526
	nop			;7527
	ex af,af'		;7528
	dec hl			;7529
	ld h,b			;752a
	nop			;752b
	xor e			;752c
l752dh:
	inc a			;752d
	nop			;752e
	xor h			;752f
	nop			;7530
	dec b			;7531
	nop			;7532
	nop			;7533
	dec b			;7534
	add a,b			;7535
	nop			;7536
	inc a			;7537
	nop			;7538
	nop			;7539
	nop			;753a
	nop			;753b
	ld b,b			;753c
	rrca			;753d
	add a,d			;753e
	add a,b			;753f
	nop			;7540
	nop			;7541
	nop			;7542
	nop			;7543
	inc d			;7544
	ex de,hl		;7545
	xor l			;7546
	nop			;7547
	ld (de),a		;7548
	ret m			;7549
	nop			;754a
	nop			;754b
	nop			;754c
	ld (hl),e		;754d
	and b			;754e
	inc bc			;754f
	nop			;7550
	nop			;7551
	ld (hl),b		;7552
	nop			;7553
	ld d,l			;7554
	ld (hl),d		;7555
	ld d,(hl)		;7556
	nop			;7557
	ret nz			;7558
	ld (hl),a		;7559
	nop			;755a
	nop			;755b
	jp p,00200h		;755c
	nop			;755f
	ld l,0aah		;7560
	xor b			;7562
	nop			;7563
	ld bc,003c0h		;7564
	ret nz			;7567
	ld hl,(002a8h)		;7568
	nop			;756b
	jr nc,l758eh		;756c
	inc b			;756e
	nop			;756f
	and b			;7570
	nop			;7571
	ld c,005h		;7572
	cp 0e0h			;7574
	ld de,00550h		;7576
	ld d,l			;7579
	ld d,(hl)		;757a
	nop			;757b
	ld d,b			;757c
	nop			;757d
	nop			;757e
	nop			;757f
	and l			;7580
	defb 0ddh,068h ;ld ixl,b	;7581
	ret nc			;7583
	nop			;7584
	nop			;7585
	nop			;7586
	nop			;7587
	ld d,000h		;7588
	nop			;758a
	nop			;758b
	nop			;758c
	nop			;758d
l758eh:
	nop			;758e
	nop			;758f
	inc c			;7590
	nop			;7591
	ld bc,001c1h		;7592
l7595h:
	xor d			;7595
	ld a,(bc)		;7596
	nop			;7597
	dec c			;7598
	ld d,l			;7599
	ld d,l			;759a
	ld (hl),b		;759b
	nop			;759c
	nop			;759d
	ld b,b			;759e
	nop			;759f
	ld d,l			;75a0
	jp c,01070h		;75a1
	nop			;75a4
	nop			;75a5
	nop			;75a6
	nop			;75a7
	jr z,l75aah		;75a8
l75aah:
	nop			;75aa
	nop			;75ab
	nop			;75ac
	nop			;75ad
	nop			;75ae
	nop			;75af
	nop			;75b0
	jr nz,l75b4h		;75b1
	ei			;75b3
l75b4h:
	ld a,h			;75b4
	nop			;75b5
	ld a,(bc)		;75b6
	or b			;75b7
	dec (hl)		;75b8
	ld d,l			;75b9
	ld d,l			;75ba
	ld (hl),b		;75bb
l75bch:
	add a,b			;75bc
	inc bc			;75bd
	nop			;75be
	nop			;75bf
	ld c,0e9h		;75c0
	nop			;75c2
	ld bc,00000h		;75c3
	nop			;75c6
	nop			;75c7
	inc c			;75c8
	ld c,(hl)		;75c9
	nop			;75ca
	inc a			;75cb
	inc e			;75cc
	ld (hl),b		;75cd
	ld c,000h		;75ce
	nop			;75d0
	ld (bc),a		;75d1
	nop			;75d2
	adc a,(hl)		;75d3
	ld b,0b5h		;75d4
	ld b,(hl)		;75d6
	ret nz			;75d7
	ld d,l			;75d8
	ld d,l			;75d9
	ld d,l			;75da
	ld (hl),b		;75db
	and b			;75dc
	xor d			;75dd
	nop			;75de
	ld b,b			;75df
	xor c			;75e0
	nop			;75e1
	djnz l75e8h		;75e2
	nop			;75e4
	nop			;75e5
	nop			;75e6
	nop			;75e7
l75e8h:
	ex af,af'		;75e8
	nop			;75e9
	inc bc			;75ea
	ccf			;75eb
	rst 38h			;75ec
	call c,000c0h		;75ed
	add a,b			;75f0
	nop			;75f1
	inc bc			;75f2
	xor b			;75f3
	jr c,l7605h		;75f4
	ld d,(hl)		;75f6
	nop			;75f7
	dec (hl)		;75f8
	ld d,l			;75f9
	ld d,l			;75fa
	add a,b			;75fb
	ld b,b			;75fc
	dec d			;75fd
	nop			;75fe
l75ffh:
	jr nz,l7595h		;75ff
	ret nz			;7601
	jr z,l7608h		;7602
	nop			;7604
l7605h:
	nop			;7605
	nop			;7606
	nop			;7607
l7608h:
	ex af,af'		;7608
	nop			;7609
	rlca			;760a
	ccf			;760b
	rst 38h			;760c
	call c,00080h		;760d
	add a,b			;7610
	nop			;7611
	ld a,(hl)		;7612
	ld b,b			;7613
	inc e			;7614
	ld bc,000eah		;7615
	ld hl,(laaaah)		;7618
	add a,b			;761b
	rra			;761c
	ld b,l			;761d
	and b			;761e
	nop			;761f
	dec d			;7620
	ld b,b			;7621
	inc bc			;7622
	ld b,c			;7623
	cp a			;7624
	ret p			;7625
	inc bc			;7626
	nop			;7627
	ld sp,00100h		;7628
	rst 0			;762b
	cp 07eh			;762c
	ld (hl),b		;762e
	nop			;762f
	nop			;7630
	inc e			;7631
	jr nz,$+5		;7632
	di			;7634
	cp l			;7635
	ld hl,(01ae0h)		;7636
	xor d			;7639
	or b			;763a
	ld b,b			;763b
	nop			;763c
	nop			;763d
	jr nc,l7640h		;763e
l7640h:
	ld b,054h		;7640
	nop			;7642
	and h			;7643
	rla			;7644
	nop			;7645
	nop			;7646
	rlca			;7647
	ret po			;7648
	nop			;7649
	inc de			;764a
	ld l,h			;764b
	in a,(06dh)		;764c
	cp h			;764e
	nop			;764f
	nop			;7650
	ld a,0b8h		;7651
	xor h			;7653
	nop			;7654
	ld (hl),b		;7655
	nop			;7656
	adc a,h			;7657
	dec b			;7658
	xor d			;7659
	xor h			;765a
	inc b			;765b
	nop			;765c
	nop			;765d
	nop			;765e
	nop			;765f
	nop			;7660
	inc (hl)		;7661
	ld d,h			;7662
	ld d,l			;7663
	ld b,024h		;7664
	ld (bc),a		;7666
l7667h:
	add a,(hl)		;7667
	rst 8			;7668
	ld a,(bc)		;7669
	and a			;766a
	di			;766b
	ld e,d			;766c
	call m,sub_d86ah	;766d
	ret m			;7670
	add hl,bc		;7671
	ld b,b			;7672
	xor c			;7673
	nop			;7674
	rlca			;7675
	nop			;7676
	inc bc			;7677
	ld l,d			;7678
	xor d			;7679
	pop af			;767a
	ret po			;767b
	nop			;767c
	nop			;767d
	inc de			;767e
	jr nz,$-50		;767f
	ld d,h			;7681
	ld d,h			;7682
	ld d,(hl)		;7683
	nop			;7684
	ld h,b			;7685
	add a,e			;7686
	djnz l7689h		;7687
l7689h:
	ld bc,064abh		;7689
	nop			;768c
	ld a,080h		;768d
	rlca			;768f
	call m,001f0h		;7690
	ld e,d			;7693
	jr c,l7696h		;7694
l7696h:
	ld (hl),b		;7696
	jr c,l7699h		;7697
l7699h:
	ld b,b			;7699
	ld (bc),a		;769a
	nop			;769b
	nop			;769c
	nop			;769d
	nop			;769e
	nop			;769f
	ld l,d			;76a0
	xor d			;76a1
	ret p			;76a2
	nop			;76a3
	inc hl			;76a4
	ld d,b			;76a5
	dec b			;76a6
	ld (bc),a		;76a7
	ld e,a			;76a8
	jr nc,l76afh		;76a9
l76abh:
	nop			;76ab
	ret nz			;76ac
	nop			;76ad
	nop			;76ae
l76afh:
	nop			;76af
	nop			;76b0
	nop			;76b1
	nop			;76b2
	nop			;76b3
	nop			;76b4
	nop			;76b5
	dec c			;76b6
	nop			;76b7
	nop			;76b8
	nop			;76b9
	nop			;76ba
	nop			;76bb
	nop			;76bc
	nop			;76bd
	nop			;76be
	ld (bc),a		;76bf
	xor d			;76c0
	xor d			;76c1
	ld bc,00100h		;76c2
	jr nc,l7667h		;76c5
	jr c,l76ceh		;76c7
	ld b,040h		;76c9
	inc sp			;76cb
	add a,b			;76cc
	nop			;76cd
l76ceh:
	adc a,d			;76ce
	call po,0486eh		;76cf
	nop			;76d2
	nop			;76d3
	ld (bc),a		;76d4
	ret p			;76d5
	inc e			;76d6
	ld c,h			;76d7
	nop			;76d8
	nop			;76d9
	nop			;76da
	inc c			;76db
	xor d			;76dc
	rst 20h			;76dd
	jp m,laabah		;76de
	xor b			;76e1
	dec b			;76e2
	ld d,b			;76e3
	ld bc,lbfeah		;76e4
	nop			;76e7
	nop			;76e8
	nop			;76e9
	nop			;76ea
	nop			;76eb
	nop			;76ec
	nop			;76ed
	ld a,041h		;76ee
	ld a,b			;76f0
	ld h,b			;76f1
	nop			;76f2
	nop			;76f3
	nop			;76f4
	nop			;76f5
	nop			;76f6
	nop			;76f7
	nop			;76f8
	nop			;76f9
	nop			;76fa
	nop			;76fb
	and b			;76fc
	ld a,(bc)		;76fd
	add a,b			;76fe
	nop			;76ff
	xor b			;7700
	nop			;7701
	ld d,b			;7702
	ld (bc),a		;7703
	nop			;7704
	nop			;7705
	nop			;7706
	nop			;7707
	jr nc,l770ah		;7708
l770ah:
	rlca			;770a
	ld a,0ffh		;770b
	sbc a,h			;770d
sub_770eh:
	nop			;770e
	nop			;770f
	nop			;7710
	ld bc,lc0c1h		;7711
	inc e			;7714
	nop			;7715
	ld a,h			;7716
	nop			;7717
	dec d			;7718
	ld d,l			;7719
	ld d,l			;771a
	nop			;771b
	rra			;771c
	xor (hl)		;771d
	ret po			;771e
	nop			;771f
	ld (de),a		;7720
	and b			;7721
	ld bc,l80a0h		;7722
	nop			;7725
	nop			;7726
	nop			;7727
	nop			;7728
	nop			;7729
	inc bc			;772a
	jp 03fffh		;772b
	ld a,b			;772e
	nop			;772f
	ex af,af'		;7730
	jr l7753h		;7731
	ld e,00fh		;7733
	jp nz,l7055h		;7735
	dec d			;7738
	ld d,l			;7739
	ld d,b			;773a
	jr nz,l773dh		;773b
l773dh:
	nop			;773d
	ld h,b			;773e
	nop			;773f
	ld (de),a		;7740
	xor b			;7741
	nop			;7742
	ld d,b			;7743
	jr $-126		;7744
	nop			;7746
	ld c,09ch		;7747
	ld bc,02225h		;7749
	dec d			;774c
	ld (00055h),hl		;774d
	nop			;7750
	dec b			;7751
	ld d,a			;7752
l7753h:
	xor h			;7753
	nop			;7754
	jr c,l7757h		;7755
l7757h:
	ld b,00ch		;7757
	sub l			;7759
	ld d,h			;775a
	nop			;775b
	nop			;775c
	ld a,(hl)		;775d
	inc hl			;775e
	add a,000h		;775f
	jp nc,l9292h		;7761
	exx			;7764
	ld l,h			;7765
	ld bc,lb883h		;7766
	inc d			;7769
	ld e,a			;776a
	ld a,l			;776b
	or l			;776c
	rst 30h			;776d
	sub 04fh		;776e
	rst 28h			;7770
	inc c			;7771
	pop bc			;7772
	ld l,c			;7773
	nop			;7774
	rlca			;7775
	nop			;7776
	dec b			;7777
	ld d,l			;7778
	ld d,l			;7779
	ret nz			;777a
	jr c,l777dh		;777b
l777dh:
	nop			;777d
	nop			;777e
	nop			;777f
	ld c,093h		;7780
	sub d			;7782
	sub h			;7783
	inc bc			;7784
	ret nz			;7785
	add a,d			;7786
	nop			;7787
	nop			;7788
	nop			;7789
	cp a			;778a
	sbc a,b			;778b
	jr nz,l7795h		;778c
	nop			;778e
	nop			;778f
	nop			;7790
	jr l779dh		;7791
	or e			;7793
	add a,b			;7794
l7795h:
	nop			;7795
	add hl,sp		;7796
	ret po			;7797
	nop			;7798
	nop			;7799
	nop			;779a
	nop			;779b
	nop			;779c
l779dh:
	nop			;779d
	nop			;779e
	nop			;779f
	ld d,l			;77a0
	ld d,l			;77a1
	ld b,b			;77a2
	nop			;77a3
	inc e			;77a4
	jr z,l77ach		;77a5
	nop			;77a7
	nop			;77a8
	nop			;77a9
	nop			;77aa
	nop			;77ab
l77ach:
	inc b			;77ac
	inc bc			;77ad
	add a,b			;77ae
	nop			;77af
	nop			;77b0
	nop			;77b1
	nop			;77b2
	nop			;77b3
	nop			;77b4
	nop			;77b5
	nop			;77b6
	nop			;77b7
	nop			;77b8
	nop			;77b9
	nop			;77ba
	nop			;77bb
	nop			;77bc
	nop			;77bd
	nop			;77be
	inc bc			;77bf
	ld d,l			;77c0
	ld d,(hl)		;77c1
	ld (bc),a		;77c2
	add a,b			;77c3
	ld bc,05029h		;77c4
	nop			;77c7
	inc b			;77c8
	nop			;77c9
	nop			;77ca
	nop			;77cb
	nop			;77cc
	nop			;77cd
	adc a,d			;77ce
	add a,(hl)		;77cf
	and l			;77d0
	ld c,b			;77d1
	nop			;77d2
	inc c			;77d3
	inc bc			;77d4
	xor b			;77d5
	inc bc			;77d6
	add a,(hl)		;77d7
	nop			;77d8
	nop			;77d9
	nop			;77da
	nop			;77db
	ld d,l			;77dc
	ld e,l			;77dd
	ld d,l			;77de
	ld e,l			;77df
	ld d,l			;77e0
	ld e,b			;77e1
	ld (bc),a		;77e2
	or b			;77e3
	rlca			;77e4
	ld d,l			;77e5
sub_77e6h:
	ret nz			;77e6
	ld b,d			;77e7
	rst 8			;77e8
	add a,c			;77e9
	add a,b			;77ea
	inc c			;77eb
	ld b,b			;77ec
	nop			;77ed
	inc bc			;77ee
	jp po,le0f3h		;77ef
	nop			;77f2
	ld bc,0003ch		;77f3
	nop			;77f6
	nop			;77f7
	nop			;77f8
	nop			;77f9
	nop			;77fa
	nop			;77fb
	ld b,b			;77fc
	dec d			;77fd
	add a,b			;77fe
	nop			;77ff
	ld d,h			;7800
	nop			;7801
	jr nc,l7805h		;7802
	nop			;7804
l7805h:
	nop			;7805
	nop			;7806
	nop			;7807
	ret po			;7808
	nop			;7809
	ld c,03eh		;780a
	rst 38h			;780c
	cp h			;780d
	nop			;780e
	nop			;780f
	nop			;7810
	rlca			;7811
	ld b,b			;7812
	nop			;7813
	ld c,000h		;7814
	djnz l7818h		;7816
l7818h:
	ld a,(bc)		;7818
	xor d			;7819
	xor e			;781a
	nop			;781b
	rst 38h			;781c
	ld sp,hl		;781d
	rst 18h			;781e
	inc bc			;781f
	push af			;7820
	ld e,b			;7821
	nop			;7822
	add a,b			;7823
	ret nz			;7824
	nop			;7825
	nop			;7826
	nop			;7827
	nop			;7828
	nop			;7829
	rlca			;782a
l782bh:
	pop hl			;782b
	rst 38h			;782c
	ld a,a			;782d
	call m,00000h		;782e
	ex af,af'		;7831
l7832h:
	nop			;7832
	add hl,de		;7833
	di			;7834
l7835h:
	add a,b			;7835
	ld hl,(01aa8h)		;7836
	xor d			;7839
	or b			;783a
	djnz l783dh		;783b
l783dh:
	nop			;783d
	pop bc			;783e
	add a,b			;783f
	ld bc,00054h		;7840
	inc d			;7843
	ld b,040h		;7844
	nop			;7846
	rrca			;7847
	ld (hl),a		;7848
	and 092h		;7849
	ld c,b			;784b
	xor d			;784c
	adc a,b			;784d
	xor b			;784e
	add a,b			;784f
	nop			;7850
	inc b			;7851
	push de			;7852
	xor h			;7853
	nop			;7854
	jr c,l7857h		;7855
l7857h:
	dec bc			;7857
	ld a,(de)		;7858
	jp z,000ach		;7859
	nop			;785c
	nop			;785d
	nop			;785e
	nop			;785f
	ld bc,02aaah		;7860
	ld hl,(lc820h)		;7863
	nop			;7866
	add a,b			;7867
	ret nz			;7868
	add hl,hl		;7869
	adc a,047h		;786a
	ld l,c			;786c
	rst 38h			;786d
	ld e,e			;786e
	ld a,(l85d5h)		;786f
	ld h,b			;7872
	out (000h),a		;7873
	inc bc			;7875
	add a,b			;7876
	dec bc			;7877
	ld l,d			;7878
	xor e			;7879
	add a,b			;787a
	ld c,000h		;787b
	nop			;787d
	nop			;787e
	nop			;787f
	dec bc			;7880
	xor (hl)		;7881
	ei			;7882
	xor h			;7883
	rra			;7884
	ld b,b			;7885
	ld b,d			;7886
	nop			;7887
	nop			;7888
	nop			;7889
	inc a			;788a
	nop			;788b
	jr c,l788eh		;788c
l788eh:
	rrca			;788e
	nop			;788f
	nop			;7890
	dec c			;7891
	ld d,l			;7892
	ld h,b			;7893
	cp 000h			;7894
	dec de			;7896
	nop			;7897
	nop			;7898
	nop			;7899
	nop			;789a
	nop			;789b
	nop			;789c
	nop			;789d
	nop			;789e
	nop			;789f
	ld l,d			;78a0
	xor d			;78a1
	call nz,01000h		;78a2
	ld (hl),b		;78a5
	dec c			;78a6
	nop			;78a7
	nop			;78a8
	nop			;78a9
	nop			;78aa
	nop			;78ab
	nop			;78ac
	nop			;78ad
	nop			;78ae
	nop			;78af
	nop			;78b0
	nop			;78b1
	ld a,b			;78b2
	jr nz,l7835h		;78b3
	ret p			;78b5
	nop			;78b6
	nop			;78b7
	ld b,050h		;78b8
	ld h,(hl)		;78ba
	nop			;78bb
l78bch:
	ret nz			;78bc
	rlca			;78bd
	jr nc,l78d2h		;78be
	xor d			;78c0
	xor d			;78c1
	ld bc,00140h		;78c2
	sub b			;78c5
	and b			;78c6
	nop			;78c7
	ex af,af'		;78c8
	nop			;78c9
	nop			;78ca
	nop			;78cb
	nop			;78cc
	nop			;78cd
	sub c			;78ce
	add a,d			;78cf
	ld (hl),c		;78d0
	ld h,h			;78d1
l78d2h:
	nop			;78d2
	nop			;78d3
	nop			;78d4
	ld d,a			;78d5
	nop			;78d6
	inc c			;78d7
	nop			;78d8
	nop			;78d9
	nop			;78da
	nop			;78db
	xor d			;78dc
	xor d			;78dd
	xor d			;78de
	xor a			;78df
	rst 38h			;78e0
	ret p			;78e1
	ld d,l			;78e2
	ld e,a			;78e3
l78e4h:
	cp 0afh			;78e4
	nop			;78e6
	nop			;78e7
	nop			;78e8
	nop			;78e9
	nop			;78ea
	nop			;78eb
	nop			;78ec
	nop			;78ed
	nop			;78ee
	or a			;78ef
	push de			;78f0
	ld d,b			;78f1
	nop			;78f2
	nop			;78f3
	nop			;78f4
	nop			;78f5
	nop			;78f6
	nop			;78f7
	nop			;78f8
	nop			;78f9
	jr l78bch		;78fa
	add a,a			;78fc
	ld a,(bc)		;78fd
	ret nz			;78fe
	nop			;78ff
	ld c,d			;7900
	add a,b			;7901
	jr z,l7905h		;7902
	nop			;7904
l7905h:
	nop			;7905
	nop			;7906
	rst 38h			;7907
	add a,l			;7908
	ret nz			;7909
	ld c,00eh		;790a
	ccf			;790c
	inc a			;790d
	ex af,af'		;790e
	nop			;790f
	nop			;7910
	ld a,(bc)		;7911
	add a,b			;7912
	dec c			;7913
	ld c,020h		;7914
	jr nc,l7918h		;7916
l7918h:
	dec c			;7918
	ld d,l			;7919
	ld d,(hl)		;791a
	add a,b			;791b
	nop			;791c
	nop			;791d
	ld bc,012fch		;791e
	and b			;7921
	nop			;7922
	ret nz			;7923
	ld b,b			;7924
	nop			;7925
	nop			;7926
	nop			;7927
	nop			;7928
	ld a,047h		;7929
	pop hl			;792b
	rst 38h			;792c
	ld a,a			;792d
	call c,00008h		;792e
	ex af,af'		;7931
	nop			;7932
	ld d,001h		;7933
	ret nz			;7935
	dec d			;7936
	ld e,b			;7937
	dec c			;7938
	ld d,l			;7939
	ld e,b			;793a
	ex af,af'		;793b
	nop			;793c
	nop			;793d
	nop			;793e
	nop			;793f
	ld bc,la0aah		;7940
	ex af,af'		;7943
	ld (bc),a		;7944
	ld l,a			;7945
	call m,sub_bf0dh	;7946
	sbc a,h			;7949
	nop			;794a
	dec h			;794b
	ld (bc),a		;794c
	ld (de),a		;794d
	inc de			;794e
	ld b,e			;794f
	add a,b			;7950
	dec b			;7951
	sub d			;7952
	and (hl)		;7953
	nop			;7954
	inc e			;7955
	nop			;7956
	dec b			;7957
	ld (hl),l		;7958
	ld h,l			;7959
	ld d,h			;795a
	nop			;795b
	nop			;795c
	nop			;795d
	nop			;795e
	nop			;795f
	ld bc,04949h		;7960
	ld c,c			;7963
	ld b,b			;7964
	jr c,l7968h		;7965
	add a,b			;7967
l7968h:
	nop			;7968
	ld (bc),a		;7969
	rst 28h			;796a
	ld e,h			;796b
	push de			;796c
	pop af			;796d
	and l			;796e
	dec a			;796f
	xor a			;7970
	cp (hl)			;7971
	and c			;7972
	ld d,d			;7973
	nop			;7974
	inc bc			;7975
	add a,b			;7976
	dec b			;7977
	ld d,l			;7978
	ld e,a			;7979
	nop			;797a
	ld bc,00000h		;797b
	nop			;797e
	nop			;797f
	nop			;7980
	ld sp,hl		;7981
	ld e,h			;7982
	ret m			;7983
	ld h,d			;7984
	add a,b			;7985
	inc l			;7986
	ld b,c			;7987
	ex (sp),hl		;7988
	ex af,af'		;7989
	nop			;798a
	nop			;798b
	inc c			;798c
	nop			;798d
	nop			;798e
	nop			;798f
	ex af,af'		;7990
	rlca			;7991
	xor a			;7992
	ret po			;7993
	ld bc,lf4ffh		;7994
	nop			;7997
	nop			;7998
	nop			;7999
	nop			;799a
	nop			;799b
	nop			;799c
	nop			;799d
	nop			;799e
	nop			;799f
	push de			;79a0
	ld d,l			;79a1
	add a,000h		;79a2
	ex af,af'		;79a4
	sbc a,d			;79a5
	add hl,de		;79a6
	add a,b			;79a7
	nop			;79a8
	nop			;79a9
	nop			;79aa
	nop			;79ab
	nop			;79ac
	nop			;79ad
	nop			;79ae
	ccf			;79af
	inc sp			;79b0
	ret nz			;79b1
	nop			;79b2
	nop			;79b3
	ld bc,00090h		;79b4
	jr nz,l79b9h		;79b7
l79b9h:
	nop			;79b9
	nop			;79ba
	nop			;79bb
	nop			;79bc
	nop			;79bd
	nop			;79be
	rlca			;79bf
	ld d,l			;79c0
	ld d,(hl)		;79c1
	ld (bc),a		;79c2
	add a,b			;79c3
	nop			;79c4
	sbc a,d			;79c5
	ld d,b			;79c6
	nop			;79c7
	ex af,af'		;79c8
	nop			;79c9
	nop			;79ca
	nop			;79cb
	nop			;79cc
	nop			;79cd
	sub c			;79ce
	jp 02433h		;79cf
	nop			;79d2
	nop			;79d3
	nop			;79d4
	nop			;79d5
	ret nz			;79d6
sub_79d7h:
	ld hl,(00b00h)		;79d7
	jr c,l79dch		;79da
l79dch:
	ld d,l			;79dc
	ld d,l			;79dd
	ld d,l			;79de
	ld d,l			;79df
	ld (hl),l		;79e0
	ld e,(hl)		;79e1
	xor d			;79e2
	push af			;79e3
	ld d,l			;79e4
	ld (hl),b		;79e5
	nop			;79e6
	nop			;79e7
	nop			;79e8
	nop			;79e9
	nop			;79ea
	nop			;79eb
	nop			;79ec
	nop			;79ed
	nop			;79ee
	ld e,(hl)		;79ef
	xor d			;79f0
	xor b			;79f1
	nop			;79f2
	nop			;79f3
	nop			;79f4
	nop			;79f5
	nop			;79f6
	nop			;79f7
	nop			;79f8
	nop			;79f9
	nop			;79fa
	nop			;79fb
	ld c,h			;79fc
	add a,l			;79fd
	ld b,b			;79fe
	nop			;79ff
	ld h,h			;7a00
l7a01h:
	ld h,b			;7a01
	inc (hl)		;7a02
	ld bc,00000h		;7a03
	rrca			;7a06
	add a,b			;7a07
	nop			;7a08
	nop			;7a09
	rrca			;7a0a
	rra			;7a0b
	rra			;7a0c
	jr c,$+10		;7a0d
	nop			;7a0f
	nop			;7a10
	dec d			;7a11
	rlca			;7a12
	ld b,d			;7a13
l7a14h:
	adc a,(hl)		;7a14
	inc d			;7a15
	jr nz,l7a18h		;7a16
l7a18h:
	ld a,(de)		;7a18
	xor d			;7a19
	xor h			;7a1a
	add a,b			;7a1b
	nop			;7a1c
	nop			;7a1d
	nop			;7a1e
	nop			;7a1f
	add hl,bc		;7a20
	ld b,b			;7a21
	nop			;7a22
	ld d,b			;7a23
	ld h,b			;7a24
	nop			;7a25
	nop			;7a26
	nop			;7a27
	nop			;7a28
	nop			;7a29
	rlca			;7a2a
	pop af			;7a2b
	call m,sub_ccfdh	;7a2c
	nop			;7a2f
	nop			;7a30
	ex af,af'		;7a31
	nop			;7a32
	jr z,l7a35h		;7a33
l7a35h:
	ret po			;7a35
	ex af,af'		;7a36
	xor d			;7a37
	ld c,0aah		;7a38
	xor b			;7a3a
	ex af,af'		;7a3b
	nop			;7a3c
	nop			;7a3d
	nop			;7a3e
	inc bc			;7a3f
	nop			;7a40
	ld (hl),l		;7a41
	ld d,h			;7a42
	adc a,b			;7a43
	ld b,050h		;7a44
	ld (bc),a		;7a46
	ld c,0efh		;7a47
	in a,(0feh)		;7a49
	ld (bc),a		;7a4b
	inc e			;7a4c
	ld d,(hl)		;7a4d
	xor l			;7a4e
	ret nz			;7a4f
	call m,sub_b51ch	;7a50
	ld d,d			;7a53
	nop			;7a54
	inc e			;7a55
	nop			;7a56
	dec bc			;7a57
	ld l,d			;7a58
	or l			;7a59
	xor d			;7a5a
	nop			;7a5b
	nop			;7a5c
	nop			;7a5d
	nop			;7a5e
	nop			;7a5f
	ld bc,02a2ah		;7a60
	ld hl,(000c0h)		;7a63
	ld b,b			;7a66
	add a,b			;7a67
	rrca			;7a68
	add a,l			;7a69
	sbc a,(hl)		;7a6a
	xor a			;7a6b
	xor d			;7a6c
	jp z,lbbf2h		;7a6d
	ld b,a			;7a70
	sub a			;7a71
	ret po			;7a72
	jp nc,00100h		;7a73
	ret nz			;7a76
	dec bc			;7a77
	ld l,d			;7a78
	ret p			;7a79
	nop			;7a7a
	nop			;7a7b
	nop			;7a7c
	nop			;7a7d
	nop			;7a7e
	nop			;7a7f
	ld bc,laaeeh		;7a80
	add a,c			;7a83
	add a,e			;7a84
	ld b,b			;7a85
	jr nc,l7a88h		;7a86
l7a88h:
	nop			;7a88
	rlca			;7a89
	nop			;7a8a
	nop			;7a8b
	nop			;7a8c
	ld c,000h		;7a8d
	rlca			;7a8f
	sbc a,b			;7a90
	nop			;7a91
	ret p			;7a92
	inc bc			;7a93
	nop			;7a94
	nop			;7a95
	inc c			;7a96
	ex af,af'		;7a97
	nop			;7a98
	nop			;7a99
	nop			;7a9a
	nop			;7a9b
	nop			;7a9c
	nop			;7a9d
	nop			;7a9e
	nop			;7a9f
	xor d			;7aa0
	xor d			;7aa1
	add a,e			;7aa2
	nop			;7aa3
	inc b			;7aa4
	xor l			;7aa5
	ld (00080h),a		;7aa6
	ld a,003h		;7aa9
	ld (de),a		;7aab
	nop			;7aac
	nop			;7aad
	rrca			;7aae
	ld b,l			;7aaf
	cp c			;7ab0
	ld h,b			;7ab1
	nop			;7ab2
	nop			;7ab3
	ld bc,00010h		;7ab4
	nop			;7ab7
	nop			;7ab8
	nop			;7ab9
	nop			;7aba
	nop			;7abb
	nop			;7abc
	nop			;7abd
	nop			;7abe
	ld b,0aah		;7abf
	xor h			;7ac1
	ld bc,00040h		;7ac2
	call nc,00028h		;7ac5
	dec bc			;7ac8
	jp nz,00808h		;7ac9
	add a,b			;7acc
	nop			;7acd
	sbc a,c			;7ace
	dec sp			;7acf
	ld d,d			;7ad0
	ld c,h			;7ad1
	nop			;7ad2
	nop			;7ad3
	nop			;7ad4
	nop			;7ad5
	jr c,l7aedh		;7ad6
	nop			;7ad8
	nop			;7ad9
	nop			;7ada
	nop			;7adb
	xor d			;7adc
	cp d			;7add
	xor d			;7ade
	xor d			;7adf
	xor e			;7ae0
	pop hl			;7ae1
	rst 38h			;7ae2
	xor e			;7ae3
	rst 38h			;7ae4
	ret nz			;7ae5
	nop			;7ae6
	nop			;7ae7
	nop			;7ae8
	nop			;7ae9
	nop			;7aea
	nop			;7aeb
	nop			;7aec
l7aedh:
	nop			;7aed
	nop			;7aee
	ld hl,(05455h)		;7aef
	nop			;7af2
	nop			;7af3
	nop			;7af4
	nop			;7af5
	nop			;7af6
	nop			;7af7
	nop			;7af8
	nop			;7af9
	nop			;7afa
	nop			;7afb
	adc a,(hl)		;7afc
	adc a,d			;7afd
	ret nz			;7afe
	nop			;7aff
	ld hl,(03a80h)		;7b00
	ld bc,00000h		;7b03
	ld (hl),b		;7b06
	nop			;7b07
	nop			;7b08
	nop			;7b09
	rlca			;7b0a
	adc a,a			;7b0b
	rra			;7b0c
	inc a			;7b0d
	jr l7b14h		;7b0e
	jr nc,l7b2ch		;7b10
	ld a,(bc)		;7b12
	add a,c			;7b13
l7b14h:
	ld b,a			;7b14
	ld a,(bc)		;7b15
	ld h,b			;7b16
	nop			;7b17
	dec d			;7b18
	ld d,l			;7b19
	ld e,b			;7b1a
	add a,b			;7b1b
	inc bc			;7b1c
	nop			;7b1d
l7b1eh:
	add a,b			;7b1e
	ld bc,0a0cah		;7b1f
	nop			;7b22
	ld l,b			;7b23
	jr nz,l7b26h		;7b24
l7b26h:
	ld h,b			;7b26
	nop			;7b27
	nop			;7b28
	nop			;7b29
	rlca			;7b2a
	pop af			;7b2b
l7b2ch:
	rst 30h			;7b2c
	ld a,0ceh		;7b2d
	nop			;7b2f
	nop			;7b30
	ex af,af'		;7b31
	nop			;7b32
	ld d,c			;7b33
	add a,b			;7b34
	ret po			;7b35
	dec d			;7b36
	ld e,l			;7b37
	dec b			;7b38
	ld d,l			;7b39
	ld e,h			;7b3a
	nop			;7b3b
	nop			;7b3c
	nop			;7b3d
	nop			;7b3e
	nop			;7b3f
	nop			;7b40
	ld a,(de)		;7b41
	cp a			;7b42
	call m,09804h		;7b43
	dec b			;7b46
	rlca			;7b47
	ld (hl),a		;7b48
	call m,sub_7d00h	;7b49
	defb 0edh ;next byte illegal after ed	;7b4c
	ex de,hl		;7b4d
	ld c,a			;7b4e
	ld (hl),b		;7b4f
	nop			;7b50
	inc d			;7b51
	out (02ah),a		;7b52
	nop			;7b54
	ld c,000h		;7b55
	dec b			;7b57
	ld d,l			;7b58
	ld d,h			;7b59
	and (hl)		;7b5a
	nop			;7b5b
	nop			;7b5c
	nop			;7b5d
	nop			;7b5e
	nop			;7b5f
	inc bc			;7b60
	xor b			;7b61
	xor b			;7b62
	xor b			;7b63
	add a,b			;7b64
	rlca			;7b65
	add a,c			;7b66
	adc a,h			;7b67
	nop			;7b68
	jp ldbf7h		;7b69
	ld d,c			;7b6c
	ld l,a			;7b6d
	ld (hl),h		;7b6e
	ld a,(hl)		;7b6f
	or l			;7b70
	xor h			;7b71
	djnz l7b1eh		;7b72
	nop			;7b74
	nop			;7b75
	ret po			;7b76
	dec d			;7b77
	ld d,l			;7b78
	ret nz			;7b79
	ret nz			;7b7a
	nop			;7b7b
	nop			;7b7c
	nop			;7b7d
	nop			;7b7e
	nop			;7b7f
	rlca			;7b80
	ld d,l			;7b81
	ld a,a			;7b82
	ld c,a			;7b83
	ld bc,01080h		;7b84
	nop			;7b87
	nop			;7b88
	ld bc,00280h		;7b89
	nop			;7b8c
	nop			;7b8d
	nop			;7b8e
	nop			;7b8f
	ret p			;7b90
	nop			;7b91
	nop			;7b92
	nop			;7b93
	ret p			;7b94
	nop			;7b95
	ld b,007h		;7b96
	ld bc,026c0h		;7b98
	ld (hl),b		;7b9b
	dec bc			;7b9c
	rlca			;7b9d
	ex af,af'		;7b9e
	ld bc,055d5h		;7b9f
	add a,e			;7ba2
	add a,b			;7ba3
	ld (bc),a		;7ba4
	ld d,a			;7ba5
	ex (sp),hl		;7ba6
	ld b,b			;7ba7
	nop			;7ba8
	nop			;7ba9
	nop			;7baa
	nop			;7bab
	nop			;7bac
	nop			;7bad
	ld a,(de)		;7bae
	ld (lb09ch),a		;7baf
	nop			;7bb2
	nop			;7bb3
	nop			;7bb4
	adc a,h			;7bb5
	nop			;7bb6
	nop			;7bb7
	nop			;7bb8
	nop			;7bb9
	nop			;7bba
	nop			;7bbb
	nop			;7bbc
	nop			;7bbd
	nop			;7bbe
	dec b			;7bbf
	ld d,l			;7bc0
	ld d,h			;7bc1
	ld (bc),a		;7bc2
	and b			;7bc3
	nop			;7bc4
	ld c,d			;7bc5
	sub h			;7bc6
	ld bc,000f0h		;7bc7
	nop			;7bca
	nop			;7bcb
	nop			;7bcc
	nop			;7bcd
	ld c,l			;7bce
	adc a,032h		;7bcf
	ld c,b			;7bd1
	nop			;7bd2
	rlca			;7bd3
	nop			;7bd4
	nop			;7bd5
	rlca			;7bd6
	adc a,(hl)		;7bd7
	and b			;7bd8
	nop			;7bd9
	nop			;7bda
	nop			;7bdb
	ld d,l			;7bdc
	rst 28h			;7bdd
	rst 18h			;7bde
	rst 38h			;7bdf
	rst 38h			;7be0
	nop			;7be1
	nop			;7be2
	ld a,a			;7be3
	nop			;7be4
	nop			;7be5
	nop			;7be6
	nop			;7be7
	nop			;7be8
	nop			;7be9
	nop			;7bea
	nop			;7beb
sub_7bech:
	nop			;7bec
	nop			;7bed
	nop			;7bee
	dec d			;7bef
	xor d			;7bf0
	xor d			;7bf1
	nop			;7bf2
	nop			;7bf3
	nop			;7bf4
	nop			;7bf5
	nop			;7bf6
	nop			;7bf7
	nop			;7bf8
	nop			;7bf9
	nop			;7bfa
	nop			;7bfb
	rrca			;7bfc
sub_7bfdh:
	ld b,l			;7bfd
l7bfeh:
	ret nz			;7bfe
	nop			;7bff
l7c00h:
	dec h			;7c00
	nop			;7c01
	dec e			;7c02
	ld bc,00000h		;7c03
	ret nz			;7c06
sub_7c07h:
	ld h,e			;7c07
l7c08h:
	nop			;7c08
	nop			;7c09
	inc bc			;7c0a
	rst 8			;7c0b
	cp a			;7c0c
	ld a,h			;7c0d
	jr nc,l7c10h		;7c0e
l7c10h:
	nop			;7c10
	inc d			;7c11
	inc d			;7c12
	ld bc,00da7h		;7c13
	cp 000h			;7c16
	ld a,(bc)		;7c18
	xor d			;7c19
	cp b			;7c1a
	ret nz			;7c1b
sub_7c1ch:
	nop			;7c1c
	nop			;7c1d
	nop			;7c1e
	add a,b			;7c1f
	dec c			;7c20
	ld b,(hl)		;7c21
	nop			;7c22
	and b			;7c23
	jr nc,l7c26h		;7c24
l7c26h:
	nop			;7c26
sub_7c27h:
	nop			;7c27
	nop			;7c28
	nop			;7c29
	rlca			;7c2a
	rst 38h			;7c2b
	call pe,sub_ae3bh	;7c2c
	nop			;7c2f
	ld hl,0000fh		;7c30
	ld d,d			;7c33
	nop			;7c34
	ld h,b			;7c35
l7c36h:
	ex af,af'		;7c36
	xor h			;7c37
	add a,0aah		;7c38
	xor h			;7c3a
	ex af,af'		;7c3b
	nop			;7c3c
	nop			;7c3d
	nop			;7c3e
	nop			;7c3f
	inc bc			;7c40
	dec c			;7c41
	or 056h			;7c42
	add a,l			;7c44
	inc h			;7c45
	inc bc			;7c46
l7c47h:
	rlca			;7c47
	and a			;7c48
	dec a			;7c49
	ex (sp),hl		;7c4a
	cp l			;7c4b
	inc sp			;7c4c
	ld (ldc4ch),a		;7c4d
	nop			;7c50
sub_7c51h:
	inc de			;7c51
	add hl,hl		;7c52
	ld d,c			;7c53
	nop			;7c54
	ld c,000h		;7c55
	dec bc			;7c57
	ld l,d			;7c58
	xor d			;7c59
	and d			;7c5a
	nop			;7c5b
	jr nz,l7c36h		;7c5c
	nop			;7c5e
	nop			;7c5f
l7c60h:
	ld (bc),a		;7c60
	ld d,(hl)		;7c61
	ld d,(hl)		;7c62
	ld d,a			;7c63
	add a,b			;7c64
	ld a,(bc)		;7c65
	nop			;7c66
	add a,b			;7c67
	inc b			;7c68
	ld b,e			;7c69
	call 0a1dbh		;7c6a
	defb 0fdh,0f0h,01fh ;illegal sequence	;7c6d
	ex de,hl		;7c70
	ld e,b			;7c71
	nop			;7c72
	ld d,l			;7c73
	add a,b			;7c74
	nop			;7c75
	ret po			;7c76
	dec bc			;7c77
l7c78h:
	ld l,a			;7c78
	nop			;7c79
	ld (hl),b		;7c7a
	nop			;7c7b
	nop			;7c7c
	nop			;7c7d
	nop			;7c7e
	nop			;7c7f
	ld e,0aah		;7c80
	xor e			;7c82
	ret m			;7c83
	add a,c			;7c84
	ld b,b			;7c85
	ld a,(de)		;7c86
	nop			;7c87
	nop			;7c88
	nop			;7c89
	nop			;7c8a
l7c8bh:
	ld a,h			;7c8b
	nop			;7c8c
	nop			;7c8d
l7c8eh:
	nop			;7c8e
l7c8fh:
	nop			;7c8f
l7c90h:
	nop			;7c90
	nop			;7c91
	nop			;7c92
	nop			;7c93
	nop			;7c94
	nop			;7c95
	ld b,(hl)		;7c96
	add a,b			;7c97
	nop			;7c98
	nop			;7c99
	nop			;7c9a
	nop			;7c9b
	nop			;7c9c
	nop			;7c9d
	nop			;7c9e
	ld bc,labaah		;7c9f
	add a,c			;7ca2
	nop			;7ca3
	inc bc			;7ca4
	ld l,d			;7ca5
	add a,c			;7ca6
	ld b,c			;7ca7
	ret po			;7ca8
	nop			;7ca9
	nop			;7caa
	nop			;7cab
	inc bc			;7cac
	ret nz			;7cad
	dec h			;7cae
	sbc a,c			;7caf
	adc a,098h		;7cb0
	nop			;7cb2
	nop			;7cb3
	ld bc,l8003h		;7cb4
	nop			;7cb7
	nop			;7cb8
	nop			;7cb9
	nop			;7cba
	nop			;7cbb
	rst 38h			;7cbc
	nop			;7cbd
	nop			;7cbe
	ld b,0aah		;7cbf
	xor b			;7cc1
l7cc2h:
	ld bc,00060h		;7cc2
	ld l,l			;7cc5
	ld c,d			;7cc6
l7cc7h:
	adc a,(hl)		;7cc7
	nop			;7cc8
	nop			;7cc9
sub_7ccah:
	nop			;7cca
	nop			;7ccb
	nop			;7ccc
	nop			;7ccd
	ld b,e			;7cce
	ld h,072h		;7ccf
	ex af,af'		;7cd1
	nop			;7cd2
	nop			;7cd3
	nop			;7cd4
	nop			;7cd5
	nop			;7cd6
	ld d,l			;7cd7
	ld d,b			;7cd8
	nop			;7cd9
	nop			;7cda
	djnz l7c8bh		;7cdb
	nop			;7cdd
	ret p			;7cde
	nop			;7cdf
	nop			;7ce0
	nop			;7ce1
	nop			;7ce2
	nop			;7ce3
	nop			;7ce4
	nop			;7ce5
l7ce6h:
	nop			;7ce6
	nop			;7ce7
	nop			;7ce8
	nop			;7ce9
	nop			;7cea
	nop			;7ceb
	nop			;7cec
	nop			;7ced
	nop			;7cee
	dec bc			;7cef
	ld d,l			;7cf0
	ld d,h			;7cf1
	nop			;7cf2
	nop			;7cf3
	nop			;7cf4
	nop			;7cf5
	nop			;7cf6
l7cf7h:
	nop			;7cf7
	nop			;7cf8
sub_7cf9h:
	nop			;7cf9
	nop			;7cfa
	nop			;7cfb
l7cfch:
	rra			;7cfc
	ld b,d			;7cfd
l7cfeh:
	ld h,b			;7cfe
sub_7cffh:
	nop			;7cff
sub_7d00h:
	ld (00680h),a		;7d00
	ld bc,00f40h		;7d03
	add a,b			;7d06
	nop			;7d07
	nop			;7d08
	nop			;7d09
	inc bc			;7d0a
	rst 0			;7d0b
	cp (hl)			;7d0c
	ld a,(hl)		;7d0d
	jr nc,l7d10h		;7d0e
l7d10h:
	nop			;7d10
	ld a,(de)		;7d11
	djnz l7d15h		;7d12
l7d14h:
	ld d,e			;7d14
l7d15h:
	adc a,e			;7d15
l7d16h:
	rst 10h			;7d16
sub_7d17h:
	add a,b			;7d17
l7d18h:
	dec c			;7d18
	ld d,l			;7d19
	ld d,b			;7d1a
	jr nz,l7d7dh		;7d1b
	nop			;7d1d
	nop			;7d1e
	ld b,b			;7d1f
	inc b			;7d20
	xor b			;7d21
	nop			;7d22
	xor b			;7d23
	djnz l7d26h		;7d24
l7d26h:
	nop			;7d26
	nop			;7d27
	nop			;7d28
	nop			;7d29
	rrca			;7d2a
	rst 38h			;7d2b
	ld e,c			;7d2c
	ld l,c			;7d2d
	call pe,00000h		;7d2e
	dec b			;7d31
	ret nz			;7d32
	ld d,h			;7d33
	nop			;7d34
	ld (hl),b		;7d35
	ld bc,l7d14h		;7d36
	ld d,l			;7d39
	ld d,h			;7d3a
	inc b			;7d3b
	nop			;7d3c
	nop			;7d3d
	nop			;7d3e
	nop			;7d3f
	nop			;7d40
	rra			;7d41
	sub d			;7d42
	sub e			;7d43
	ld b,a			;7d44
	inc h			;7d45
	ld bc,03187h		;7d46
sub_7d49h:
	ld e,(iy-00ah)		;7d49
	rst 38h			;7d4c
	ld b,d			;7d4d
	or l			;7d4e
	di			;7d4f
	add a,b			;7d50
	ex af,af'		;7d51
	rst 18h			;7d52
	xor c			;7d53
	nop			;7d54
	rrca			;7d55
	nop			;7d56
	dec b			;7d57
	ld d,l			;7d58
	ld d,l			;7d59
sub_7d5ah:
	ld e,d			;7d5a
	nop			;7d5b
	nop			;7d5c
	nop			;7d5d
	nop			;7d5e
	nop			;7d5f
	ld b,092h		;7d60
	sub d			;7d62
	sub e			;7d63
	nop			;7d64
	ld de,l8000h+1		;7d65
	nop			;7d68
	inc bc			;7d69
	push af			;7d6a
	sub 000h		;7d6b
	rst 38h			;7d6d
	ret po			;7d6e
sub_7d6fh:
	ld e,0deh		;7d6f
	or b			;7d71
	nop			;7d72
	cp d			;7d73
	ret po			;7d74
	nop			;7d75
	ld h,b			;7d76
	ld e,0fch		;7d77
	nop			;7d79
	inc e			;7d7a
l7d7bh:
	nop			;7d7b
	ccf			;7d7c
l7d7dh:
	ld b,0c0h		;7d7d
	ld (hl),035h		;7d7f
	ld d,l			;7d81
	ld e,a			;7d82
	nop			;7d83
sub_7d84h:
	ld b,b			;7d84
	and b			;7d85
	dec c			;7d86
	nop			;7d87
	nop			;7d88
	nop			;7d89
	nop			;7d8a
	nop			;7d8b
	nop			;7d8c
sub_7d8dh:
	nop			;7d8d
	nop			;7d8e
	nop			;7d8f
	ld bc,006a0h		;7d90
	daa			;7d93
	ret nz			;7d94
	nop			;7d95
	djnz l7d18h		;7d96
	nop			;7d98
	nop			;7d99
	nop			;7d9a
	nop			;7d9b
	nop			;7d9c
	nop			;7d9d
	nop			;7d9e
	inc bc			;7d9f
sub_7da0h:
	ld d,l			;7da0
	ld d,a			;7da1
	ld (bc),a		;7da2
	add a,b			;7da3
	ld bc,04125h		;7da4
	ld c,a			;7da7
	inc e			;7da8
	nop			;7da9
	nop			;7daa
	nop			;7dab
	nop			;7dac
	nop			;7dad
	ld c,d			;7dae
	inc c			;7daf
	jp z,01cc8h		;7db0
	nop			;7db3
	ld (bc),a		;7db4
l7db5h:
	nop			;7db5
	ld h,b			;7db6
	jr nc,l7dbbh		;7db7
	nop			;7db9
l7dbah:
	nop			;7dba
l7dbbh:
	nop			;7dbb
	ld d,l			;7dbc
	add a,b			;7dbd
	rrca			;7dbe
l7dbfh:
	defb 0edh ;next byte illegal after ed	;7dbf
	ld d,l			;7dc0
	ld e,b			;7dc1
	ld (bc),a		;7dc2
	or b			;7dc3
	nop			;7dc4
	scf			;7dc5
	push de			;7dc6
	ret m			;7dc7
	nop			;7dc8
	nop			;7dc9
	nop			;7dca
	nop			;7dcb
	ld bc,l6238h		;7dcc
	ld a,h			;7dcf
	xor (hl)		;7dd0
	djnz l7e1bh		;7dd1
	ret nz			;7dd3
	nop			;7dd4
	nop			;7dd5
	nop			;7dd6
	ld a,(000a8h)		;7dd7
	nop			;7dda
	nop			;7ddb
	rst 38h			;7ddc
	rst 38h			;7ddd
	rst 38h			;7dde
	rst 38h			;7ddf
	rst 38h			;7de0
	rst 38h			;7de1
	rst 38h			;7de2
	rst 38h			;7de3
	rst 38h			;7de4
	rst 38h			;7de5
	rst 38h			;7de6
	rst 38h			;7de7
	rst 38h			;7de8
	rst 38h			;7de9
	rst 38h			;7dea
	rst 38h			;7deb
	rst 38h			;7dec
	rst 38h			;7ded
	rst 38h			;7dee
	rst 38h			;7def
	rst 38h			;7df0
	rst 38h			;7df1
	rst 38h			;7df2
	rst 38h			;7df3
	rst 38h			;7df4
	rst 38h			;7df5
	rst 38h			;7df6
	rst 38h			;7df7
	rst 38h			;7df8
	rst 38h			;7df9
	rst 38h			;7dfa
	rst 38h			;7dfb
	nop			;7dfc
	jp l61ceh		;7dfd
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e00
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e03
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e06
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e09
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e0c
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e0f
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e12
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e15
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e18
l7e1bh:
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e1b
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e1e
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e21
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e24
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e27
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e2a
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e2d
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e30
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e33
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e36
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e39
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e3c
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e3f
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e42
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e45
l7e48h:
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e48
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e4b
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e4e
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e51
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e54
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e57
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e5a
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e5d
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e60
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e63
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e66
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e69
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e6c
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e6f
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e72
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e75
sub_7e78h:
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e78
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e7b
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e7e
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e81
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e84
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e87
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e8a
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e8d
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e90
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e93
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e96
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e99
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e9c
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7e9f
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ea2
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ea5
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ea8
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eab
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eae
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eb1
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eb4
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eb7
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eba
l7ebdh:
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ebd
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ec0
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ec3
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ec6
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ec9
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ecc
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ecf
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ed2
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ed5
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ed8
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7edb
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ede
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ee1
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ee4
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ee7
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eea
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7eed
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ef0
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ef3
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ef6
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7ef9
	defb 0fdh,0fdh,0fdh ;illegal sequence	;7efc
	defb 0fdh,0fdh,03eh ;illegal sequence	;7eff
	cp 0edh			;7f02
	ld b,a			;7f04
sub_7f05h:
	im 2			;7f05
	ret			;7f07
	ld a,03fh		;7f08
	ld i,a			;7f0a
	im 1			;7f0c
	ld a,000h		;7f0e
	ld (05c91h),a		;7f10
	ret			;7f13
	ld a,000h		;7f14
	out (0feh),a		;7f16
	ld hl,05800h		;7f18
	ld b,018h		;7f1b
	ld a,(lff2fh)		;7f1d
	ld e,a			;7f20
l7f21h:
	ld c,020h		;7f21
l7f23h:
	ld a,e			;7f23
	ld (hl),a		;7f24
	inc hl			;7f25
	dec c			;7f26
	ld a,c			;7f27
	cp 000h			;7f28
	jr nz,l7f23h		;7f2a
	djnz l7f21h		;7f2c
	ret			;7f2e
	ld b,(hl)		;7f2f
	ld hl,lff37h		;7f30
	call 0611dh		;7f33
	ret			;7f36
	ld d,015h		;7f37
l7f39h:
	nop			;7f39
	djnz $+8		;7f3a
	inc de			;7f3c
	ld bc,00011h		;7f3d
	ld e,e			;7f40
	jr nz,$+69		;7f41
	ld c,a			;7f43
	ld d,b			;7f44
	ld e,c			;7f45
	ld d,d			;7f46
	ld c,c			;7f47
	ld b,a			;7f48
	ld c,b			;7f49
	ld d,h			;7f4a
	dec l			;7f4b
	ld sp,03839h		;7f4c
	add hl,sp		;7f4f
	jr nz,$+86		;7f50
	ld d,d			;7f52
	ld c,c			;7f53
	ld d,h			;7f54
	ld c,a			;7f55
	ld c,(hl)		;7f56
	jr nz,l7fach		;7f57
	ld c,a			;7f59
	ld b,(hl)		;7f5a
	ld d,h			;7f5b
	ld d,a			;7f5c
	ld b,c			;7f5d
	ld d,d			;7f5e
	ld b,l			;7f5f
	rst 38h			;7f60
	call sub_60bah		;7f61
	call sub_638ch		;7f64
	call sub_ff30h		;7f67
	ld hl,00078h		;7f6a
	ld de,0000ch		;7f6d
l7f70h:
	ld b,0aah		;7f70
l7f72h:
	push bc			;7f72
	push de			;7f73
	push hl			;7f74
	call 003b5h		;7f75
	ld a,002h		;7f78
	out (0feh),a		;7f7a
	pop hl			;7f7c
	pop de			;7f7d
	pop bc			;7f7e
l7f7fh:
	halt			;7f7f
l7f80h:
	inc hl			;7f80
	inc hl			;7f81
	inc hl			;7f82
	djnz l7f72h		;7f83
	ld a,000h		;7f85
	out (0feh),a		;7f87
	call sub_60cah		;7f89
	call lff01h		;7f8c
	ld b,064h		;7f8f
l7f91h:
	halt			;7f91
	djnz l7f91h		;7f92
	call lffbfh+2		;7f94
	call sub_ffd0h		;7f97
	ld a,000h		;7f9a
	ld (05c08h),a		;7f9c
	call sub_6298h		;7f9f
	ret			;7fa2
	ld c,008h		;7fa3
l7fa5h:
	ld b,008h		;7fa5
	ld hl,050bfh		;7fa7
l7faah:
	push bc			;7faa
	push hl			;7fab
l7fach:
	ld b,020h		;7fac
l7faeh:
	ld a,(hl)		;7fae
	rla			;7faf
	ld (hl),a		;7fb0
	dec hl			;7fb1
	djnz l7faeh		;7fb2
	pop hl			;7fb4
	inc h			;7fb5
	pop bc			;7fb6
	and a			;7fb7
	djnz l7faah		;7fb8
	dec c			;7fba
	ld a,c			;7fbb
	cp 000h			;7fbc
	jr nz,l7fa5h		;7fbe
	ret			;7fc0
	ld b,020h		;7fc1
l7fc3h:
	push bc			;7fc3
	call 0ffa3h		;7fc4
	pop bc			;7fc7
	djnz l7fc3h		;7fc8
	ret			;7fca
	ld d,015h		;7fcb
	rra			;7fcd
	djnz l7fd0h		;7fce
l7fd0h:
	ld a,000h		;7fd0
	ld (05c91h),a		;7fd2
	ld c,018h		;7fd5
	ld de,l6229h		;7fd7
l7fdah:
	ld hl,lffcbh		;7fda
	ld b,005h		;7fdd
l7fdfh:
	ld a,(hl)		;7fdf
	rst 10h			;7fe0
	inc hl			;7fe1
	djnz l7fdfh		;7fe2
	ld a,(de)		;7fe4
	rst 10h			;7fe5
	inc de			;7fe6
	push bc			;7fe7
	push hl			;7fe8
	push de			;7fe9
	call 0ffa3h		;7fea
	pop de			;7fed
	pop hl			;7fee
	pop bc			;7fef
	dec c			;7ff0
	ld a,c			;7ff1
	cp 000h			;7ff2
	ret z			;7ff4
	jr l7fdah		;7ff5
	nop			;7ff7
	nop			;7ff8
	ld b,d			;7ff9
	ld b,d			;7ffa
	ld b,d			;7ffb
l7ffch:
	ld b,d			;7ffc
	ld b,d			;7ffd
sub_7ffeh:
	inc a			;7ffe
	nop			;7fff
l8000h:
	jr c,l8011h		;8000
	rst 28h			;8002
l8003h:
	ld c,a			;8003
	rst 28h			;8004
	ld c,a			;8005
	ld c,h			;8006
sub_8007h:
	reti			;8007
	jr c,l8057h		;8009
	out (c),b		;800b
	ld d,h			;800d
	defb 0fdh,055h ;ld d,iyl	;800e
	ld d,h			;8010
l8011h:
	defb 0fdh,038h,055h ;illegal sequence	;8011
	ld d,h			;8014
l8015h:
	defb 0fdh,050h,053h ;illegal sequence	;8015
	jp m,05352h		;8018
	jr c,l8015h		;801b
	jp m,lf8fah		;801d
	jp m,02a00h		;8020
	dec hl			;8023
l8024h:
	jr c,l8029h		;8024
	ld (00323h),hl		;8026
l8029h:
	ld hl,(0032bh)		;8029
	ld (02338h),hl		;802c
	ld (bc),a		;802f
	dec hl			;8030
	nop			;8031
	rst 38h			;8032
	ld c,c			;8033
l8034h:
	ld c,c			;8034
	rst 38h			;8035
	jr c,l803bh		;8036
	xor e			;8038
	xor e			;8039
	inc bc			;803a
l803bh:
	xor e			;803b
	inc bc			;803c
	xor e			;803d
	nop			;803e
sub_803fh:
	jr c,l80bbh		;803f
	ld a,l			;8041
	ld l,d			;8042
	ld (hl),b		;8043
	ld h,a			;8044
	ld d,h			;8045
	inc h			;8046
l8047h:
	ld d,a			;8047
	jr c,l806eh		;8048
	ld d,h			;804a
l804bh:
	daa			;804b
	inc b			;804c
	call m,02427h		;804d
	rst 38h			;8050
l8051h:
	jr c,l8051h		;8051
	cp 0feh			;8053
l8055h:
	cp 000h			;8055
l8057h:
	ld d,h			;8057
	ld l,d			;8058
	ld d,h			;8059
	jr c,l80c6h		;805a
	ld d,h			;805c
	ld a,d			;805d
	inc b			;805e
	jp p,l9292h+2		;805f
	call p,sub_9238h	;8062
	sub h			;8065
	jp p,l9292h+2		;8066
l8069h:
	call p,0f492h		;8069
	jr c,l804bh		;806c
l806eh:
	ld hl,l809bh		;806e
	ld de,l83c2h		;8071
	call 0697fh		;8074
	ld ix,l8096h		;8077
	ld de,l80f2h		;807b
	call 0697fh		;807e
	ld hl,l80e1h		;8081
l8084h:
	call 0611dh		;8084
l8087h:
	ld hl,l80a0h		;8087
	call 06244h		;808a
	call sub_8476h		;808d
l8090h:
	halt			;8090
	jr l8090h		;8091
	call 00000h		;8093
l8096h:
	ex af,af'		;8096
	ld a,(bc)		;8097
	nop			;8098
	nop			;8099
	nop			;809a
l809bh:
	ld (bc),a		;809b
	ld a,(bc)		;809c
	nop			;809d
	ld (de),a		;809e
	nop			;809f
l80a0h:
	ld d,00ch		;80a0
	ld (bc),a		;80a2
	inc de			;80a3
	ld bc,00510h		;80a4
	ld de,05300h		;80a7
l80aah:
	ld d,h			;80aa
	ld b,l			;80ab
	jr nz,l80f3h		;80ac
	ld d,e			;80ae
	jr nz,l80f6h		;80af
	ld c,h			;80b1
	jr nz,l80fah		;80b2
	ld c,c			;80b4
	ld c,(hl)		;80b5
	ld b,c			;80b6
	ld c,h			;80b7
	jr nz,l80feh		;80b8
	ld b,l			;80ba
l80bbh:
	jr nz,l8109h		;80bb
	ld b,c			;80bd
	jr nz,l8108h		;80be
	ld c,c			;80c0
	ld d,e			;80c1
sub_80c2h:
	ld d,h			;80c2
l80c3h:
	ld c,a			;80c3
	ld d,d			;80c4
	ld c,c			;80c5
l80c6h:
	ld b,c			;80c6
	ld d,00eh		;80c7
	dec b			;80c9
	ld c,h			;80ca
	ld c,a			;80cb
	jr nz,l8112h		;80cc
	ld b,l			;80ce
	ld c,l			;80cf
	ld b,c			;80d0
	ld d,e			;80d1
	jr nz,$+71		;80d2
	ld d,e			;80d4
	jr nz,l811ah		;80d5
	ld c,a			;80d7
	ld d,e			;80d8
	ld b,c			;80d9
	jr nz,$+86		;80da
	ld d,l			;80dc
	ld e,c			;80dd
	ld b,c			;80de
	ld l,0ffh		;80df
l80e1h:
	ld d,00bh		;80e1
	nop			;80e3
	inc de			;80e4
	nop			;80e5
	ld de,l7a01h		;80e6
	ld a,h			;80e9
	ld d,00ch		;80ea
	nop			;80ec
	inc de			;80ed
	ld bc,l7d7bh		;80ee
	rst 38h			;80f1
l80f2h:
	nop			;80f2
l80f3h:
	nop			;80f3
	nop			;80f4
	nop			;80f5
l80f6h:
	nop			;80f6
	nop			;80f7
	nop			;80f8
	nop			;80f9
l80fah:
	rlca			;80fa
	nop			;80fb
	nop			;80fc
	nop			;80fd
l80feh:
	nop			;80fe
l80ffh:
	nop			;80ff
l8100h:
	nop			;8100
	nop			;8101
	nop			;8102
	inc b			;8103
	rra			;8104
	ccf			;8105
	ccf			;8106
	ld a,a			;8107
l8108h:
	ld a,a			;8108
l8109h:
	ld (hl),b		;8109
	ret p			;810a
	pop af			;810b
	ld b,h			;810c
	ex (sp),hl		;810d
	ex (sp),hl		;810e
	ex (sp),hl		;810f
	ld b,a			;8110
	ld b,a			;8111
l8112h:
	rlca			;8112
	inc bc			;8113
	inc bc			;8114
	inc b			;8115
	inc bc			;8116
	ld bc,00000h		;8117
l811ah:
	ld bc,00101h		;811a
	inc bc			;811d
	inc b			;811e
	rlca			;811f
	rlca			;8120
	rlca			;8121
	inc bc			;8122
	inc bc			;8123
	inc bc			;8124
sub_8125h:
	ld bc,00401h		;8125
	ld bc,00000h		;8128
	nop			;812b
	nop			;812c
	nop			;812d
	ld bc,00401h		;812e
	ld bc,00000h		;8131
	nop			;8134
	rlca			;8135
	sbc a,a			;8136
	cpl			;8137
	add a,a			;8138
	inc b			;8139
	nop			;813a
	nop			;813b
	nop			;813c
	nop			;813d
	nop			;813e
	nop			;813f
	nop			;8140
l8141h:
	nop			;8141
	rlca			;8142
	nop			;8143
	nop			;8144
	nop			;8145
	nop			;8146
	nop			;8147
	nop			;8148
	nop			;8149
	nop			;814a
	inc b			;814b
	ret po			;814c
	ld d,b			;814d
	ret pe			;814e
l814fh:
	call p,sub_f4ech	;814f
	call pe,044f4h		;8152
	ret pe			;8155
	ret c			;8156
	or b			;8157
	ret nc			;8158
	or b			;8159
	ret nc			;815a
	ret pe			;815b
	ret z			;815c
	ld b,h			;815d
	ret pe			;815e
	ret c			;815f
	ret pe			;8160
	ret c			;8161
	pop af			;8162
	out (0a7h),a		;8163
	rst 20h			;8165
	inc b			;8166
	xor a			;8167
	rst 28h			;8168
	xor a			;8169
	rst 10h			;816a
	rst 30h			;816b
	in a,(0efh)		;816c
	rst 38h			;816e
	ld b,h			;816f
	rst 38h			;8170
	rst 38h			;8171
	rst 38h			;8172
	rst 38h			;8173
	ld a,a			;8174
	ld a,a			;8175
	cp a			;8176
	adc a,044h		;8177
	ret p			;8179
	ret po			;817a
	ret nc			;817b
	ret po			;817c
	pop de			;817d
	jp pe,lf2d1h		;817e
l8181h:
	inc b			;8181
	nop			;8182
	nop			;8183
	nop			;8184
	nop			;8185
	nop			;8186
	nop			;8187
	nop			;8188
l8189h:
	nop			;8189
	rlca			;818a
	nop			;818b
	nop			;818c
	nop			;818d
	nop			;818e
	nop			;818f
	ld bc,00101h		;8190
	inc b			;8193
	inc bc			;8194
	dec b			;8195
	dec b			;8196
	dec c			;8197
	add hl,bc		;8198
	ld (bc),a		;8199
	ld (bc),a		;819a
	nop			;819b
	ld b,000h		;819c
	nop			;819e
	nop			;819f
	nop			;81a0
	nop			;81a1
	nop			;81a2
	nop			;81a3
	nop			;81a4
	rlca			;81a5
	nop			;81a6
	nop			;81a7
	ld c,07fh		;81a8
	rst 38h			;81aa
	rst 38h			;81ab
	rst 38h			;81ac
	rst 38h			;81ad
	ld b,h			;81ae
	rst 38h			;81af
	rst 38h			;81b0
	rst 38h			;81b1
	rst 38h			;81b2
	rst 38h			;81b3
	rst 30h			;81b4
	or 0fbh			;81b5
	ld b,h			;81b7
	call m,sub_fdffh	;81b8
	cp 0fdh			;81bb
	cp 055h			;81bd
	xor d			;81bf
	ld b,h			;81c0
	nop			;81c1
	nop			;81c2
	nop			;81c3
	nop			;81c4
	nop			;81c5
	ld c,b			;81c6
	ld l,h			;81c7
	xor c			;81c8
	ld b,h			;81c9
	nop			;81ca
	nop			;81cb
	nop			;81cc
	nop			;81cd
	nop			;81ce
	nop			;81cf
	nop			;81d0
	nop			;81d1
	ld b,00dh		;81d2
	ld a,(l7267h)		;81d4
	call sub_bcdch		;81d7
	or a			;81da
	ld b,(hl)		;81db
	or a			;81dc
	xor 0aah		;81dd
	ld l,h			;81df
	jp c,03bcbh		;81e0
	inc sp			;81e3
	ld b,03fh		;81e4
	ccf			;81e6
	rra			;81e7
	rra			;81e8
	rrca			;81e9
	rlca			;81ea
	rlca			;81eb
	rrca			;81ec
	inc b			;81ed
	rrca			;81ee
	rra			;81ef
	ccf			;81f0
	cp a			;81f1
	rst 38h			;81f2
	rst 38h			;81f3
	rst 38h			;81f4
	ei			;81f5
	ld b,h			;81f6
	dec a			;81f7
	adc a,l			;81f8
	push hl			;81f9
	ei			;81fa
	ei			;81fb
	ei			;81fc
	defb 0fdh,07dh ;ld a,iyl	;81fd
	ld b,h			;81ff
	ld a,h			;8200
	cp a			;8201
	ccf			;8202
	rst 18h			;8203
	ld e,l			;8204
	cp d			;8205
	inc a			;8206
	ld a,d			;8207
	inc b			;8208
	ld a,h			;8209
	ret m			;820a
	call p,sub_fdfbh	;820b
	rst 38h			;820e
	rst 38h			;820f
	ld a,a			;8210
	inc b			;8211
	nop			;8212
	nop			;8213
sub_8214h:
	nop			;8214
	nop			;8215
	nop			;8216
	nop			;8217
	nop			;8218
	nop			;8219
	rlca			;821a
	ret po			;821b
	ret po			;821c
	ld e,b			;821d
	and a			;821e
	rst 28h			;821f
	rst 18h			;8220
	ld h,a			;8221
	rst 10h			;8222
	ld b,h			;8223
	rst 10h			;8224
	rst 30h			;8225
	or a			;8226
	sub a			;8227
	sbc a,0dch		;8228
	or h			;822a
	ld (hl),h		;822b
	ld b,h			;822c
	and h			;822d
	ld h,h			;822e
	or h			;822f
	jp nc,ldaaah		;8230
	jp pe,044dah		;8233
	jp pe,leadah		;8236
	jp m,ld2e2h		;8239
	jp po,044d2h		;823c
	or d			;823f
	jp nc,l62a2h		;8240
	and c			;8243
	ld b,c			;8244
	ret nz			;8245
	ld b,b			;8246
	inc b			;8247
	ret nz			;8248
	ld b,b			;8249
	add a,b			;824a
	nop			;824b
	nop			;824c
	nop			;824d
	nop			;824e
	nop			;824f
	ld b,h			;8250
	nop			;8251
	nop			;8252
	nop			;8253
	nop			;8254
	ret nz			;8255
	pop af			;8256
	jp m,00495h		;8257
	nop			;825a
	nop			;825b
	nop			;825c
	nop			;825d
	nop			;825e
	nop			;825f
	nop			;8260
	nop			;8261
	rlca			;8262
	nop			;8263
	nop			;8264
	nop			;8265
	nop			;8266
	add a,b			;8267
	ret nz			;8268
	add a,b			;8269
	ret nz			;826a
	inc b			;826b
	jp l8f87h		;826c
	dec c			;826f
	rra			;8270
	ld a,07fh		;8271
	ld a,a			;8273
	ld b,0ffh		;8274
	cp 0fch			;8276
	ret m			;8278
	ret p			;8279
	ret po			;827a
	ret p			;827b
	ret p			;827c
	ld b,078h		;827d
	ld a,b			;827f
	ld a,h			;8280
	ld a,03eh		;8281
	inc e			;8283
	ex af,af'		;8284
	ex af,af'		;8285
	ld b,008h		;8286
	jr l829ah		;8288
	djnz $+18		;828a
	and b			;828c
	and b			;828d
	ret po			;828e
l828fh:
	ld b,000h		;828f
	nop			;8291
	nop			;8292
	nop			;8293
	ld bc,00101h		;8294
	ld bc,00105h		;8297
l829ah:
	ld bc,00201h		;829a
	inc bc			;829d
	ld d,a			;829e
	xor e			;829f
	ld d,l			;82a0
	dec b			;82a1
	nop			;82a2
	inc d			;82a3
	ld d,e			;82a4
	ld l,c			;82a5
	ld l,a			;82a6
	ld d,l			;82a7
	ld b,d			;82a8
	or (hl)			;82a9
l82aah:
	ld b,0cbh		;82aa
	push de			;82ac
	adc a,d			;82ad
	ld h,l			;82ae
	ld l,l			;82af
	dec a			;82b0
	ccf			;82b1
	rra			;82b2
	ld b,0efh		;82b3
	rst 38h			;82b5
	rst 38h			;82b6
	rst 38h			;82b7
	defb 0fdh,0ffh,07fh ;illegal sequence	;82b8
	ld a,l			;82bb
	ld b,07fh		;82bc
	ld a,a			;82be
	ld a,a			;82bf
	ld a,l			;82c0
	ld a,a			;82c1
	ccf			;82c2
	ccf			;82c3
	dec a			;82c4
	ld b,01fh		;82c5
	ld e,a			;82c7
	ld (hl),a		;82c8
	ld d,a			;82c9
	ld l,d			;82ca
	scf			;82cb
	ld hl,(00335h)		;82cc
	ld e,b			;82cf
	ld (hl),b		;82d0
	ld (hl),b		;82d1
	ld (hl),b		;82d2
	ld (hl),b		;82d3
	ld (hl),b		;82d4
	ld (hl),b		;82d5
	ld h,b			;82d6
	ld b,050h		;82d7
	ld l,b			;82d9
	ret c			;82da
	ret po			;82db
	ret nz			;82dc
	ret po			;82dd
	ret nc			;82de
	ret po			;82df
	ld b,0d0h		;82e0
	ret po			;82e2
	ret nc			;82e3
	ret pe			;82e4
	call m,sub_fdfch	;82e5
	sbc a,d			;82e8
	dec b			;82e9
	nop			;82ea
	ret nz			;82eb
	ld h,b			;82ec
	jr nz,l828fh		;82ed
	ld d,b			;82ef
	sbc a,b			;82f0
	ret z			;82f1
	ld b,(hl)		;82f2
	ld e,b			;82f3
	jr z,$-46		;82f4
	or b			;82f6
	ld d,b			;82f7
	or b			;82f8
	ld h,b			;82f9
	ret c			;82fa
	ld b,(hl)		;82fb
	cp a			;82fc
	jp pe,lfef5h		;82fd
	rst 38h			;8300
	cp 0ffh			;8301
	rst 38h			;8303
	ld b,0f7h		;8304
	ei			;8306
	ei			;8307
	ld sp,hl		;8308
	ret p			;8309
	ret p			;830a
	ret p			;830b
	ret po			;830c
	ld b,0a0h		;830d
	ret po			;830f
	ret p			;8310
	ld d,b			;8311
	xor b			;8312
	ld d,b			;8313
	or b			;8314
	ret m			;8315
	ld b,e			;8316
	ld a,b			;8317
	inc (hl)		;8318
	inc a			;8319
	inc d			;831a
	inc e			;831b
	inc d			;831c
	ld a,(de)		;831d
	ld d,006h		;831e
	ld a,(de)		;8320
	inc c			;8321
	ld c,01dh		;8322
	rra			;8324
	dec e			;8325
	ld e,01dh		;8326
	ld b,01eh		;8328
	rra			;832a
	rra			;832b
	cpl			;832c
	ccf			;832d
	cp a			;832e
	ld e,a			;832f
	cp a			;8330
	dec b			;8331
	nop			;8332
	nop			;8333
	nop			;8334
	nop			;8335
	nop			;8336
	nop			;8337
	nop			;8338
	nop			;8339
	rlca			;833a
	nop			;833b
	nop			;833c
	nop			;833d
	nop			;833e
	nop			;833f
	nop			;8340
	nop			;8341
	nop			;8342
	ld b,(hl)		;8343
	nop			;8344
	add a,b			;8345
	add a,b			;8346
	ret nz			;8347
	ld b,b			;8348
	ret nz			;8349
	ld h,b			;834a
	and b			;834b
	ld b,(hl)		;834c
	ret po			;834d
	or b			;834e
	ret nc			;834f
	ret pe			;8350
	ret m			;8351
	ret pe			;8352
	ld a,h			;8353
	ld a,h			;8354
	ld b,(hl)		;8355
	ld a,03fh		;8356
	rra			;8358
	rra			;8359
	rrca			;835a
	nop			;835b
	nop			;835c
	nop			;835d
	ld b,(hl)		;835e
	nop			;835f
	nop			;8360
	nop			;8361
	ld bc,00101h		;8362
	inc bc			;8365
	inc bc			;8366
	ld b,a			;8367
	inc bc			;8368
	ld (bc),a		;8369
	ld b,006h		;836a
	ld b,00ch		;836c
	adc a,h			;836e
	adc a,h			;836f
	ld b,a			;8370
	adc a,h			;8371
	sbc a,b			;8372
	sbc a,b			;8373
	ld d,b			;8374
	ret nc			;8375
	push bc			;8376
	xor d			;8377
	ld d,c			;8378
	ld b,a			;8379
	nop			;837a
	nop			;837b
	nop			;837c
	nop			;837d
	nop			;837e
	nop			;837f
	nop			;8380
	nop			;8381
	rlca			;8382
	nop			;8383
	nop			;8384
	nop			;8385
	nop			;8386
	nop			;8387
	nop			;8388
	nop			;8389
	nop			;838a
	ld b,a			;838b
	inc bc			;838c
	inc bc			;838d
	inc bc			;838e
	inc bc			;838f
	ld b,006h		;8390
	ld b,006h		;8392
	ld b,a			;8394
	inc c			;8395
	inc c			;8396
	inc c			;8397
	ex af,af'		;8398
	jr l83d3h		;8399
	jr nc,$+114		;839b
	ld b,a			;839d
	ret p			;839e
	ld (hl),b		;839f
	ld (hl),b		;83a0
	ld h,b			;83a1
	ld h,b			;83a2
	ld h,b			;83a3
	ld h,b			;83a4
	ret nz			;83a5
	ld b,(hl)		;83a6
	ret nz			;83a7
	ret nz			;83a8
	add a,b			;83a9
	add a,b			;83aa
	add a,b			;83ab
	add a,b			;83ac
	nop			;83ad
	nop			;83ae
	rlca			;83af
	nop			;83b0
	nop			;83b1
	nop			;83b2
	nop			;83b3
	nop			;83b4
	nop			;83b5
	nop			;83b6
	nop			;83b7
	ld b,a			;83b8
	nop			;83b9
	nop			;83ba
	nop			;83bb
	nop			;83bc
	nop			;83bd
	inc h			;83be
	ld d,d			;83bf
	add hl,hl		;83c0
	rlca			;83c1
l83c2h:
	nop			;83c2
	nop			;83c3
	ld a,(bc)		;83c4
	dec b			;83c5
	nop			;83c6
	ld d,l			;83c7
	ld hl,(04600h)		;83c8
	nop			;83cb
	nop			;83cc
	nop			;83cd
	nop			;83ce
	nop			;83cf
	dec b			;83d0
	ld c,0ddh		;83d1
l83d3h:
	ld b,(hl)		;83d3
	ld a,(bc)		;83d4
	dec b			;83d5
	add a,b			;83d6
	ld d,l			;83d7
	ld hl,(la015h)		;83d8
	ld d,l			;83db
	ld b,(hl)		;83dc
	ld a,(bc)		;83dd
	ld bc,00100h		;83de
	xor d			;83e1
	ld d,l			;83e2
	xor d			;83e3
	ld (hl),l		;83e4
	ld d,(hl)		;83e5
	xor d			;83e6
	ld b,l			;83e7
	add a,b			;83e8
	ld b,b			;83e9
	xor b			;83ea
	ld d,l			;83eb
	ld hl,(05605h)		;83ec
	and d			;83ef
	ld d,l			;83f0
	xor d			;83f1
	ld d,l			;83f2
	xor d			;83f3
	ld e,a			;83f4
	defb 0edh ;next byte illegal after ed	;83f5
	ld (hl),h		;83f6
	ld d,(hl)		;83f7
	xor d			;83f8
	ld d,l			;83f9
	ld a,(bc)		;83fa
	ld b,b			;83fb
	ld a,(bc)		;83fc
	ld d,l			;83fd
	xor d			;83fe
	ld d,l			;83ff
sub_8400h:
	ld e,(hl)		;8400
	xor d			;8401
l8402h:
	ld b,c			;8402
	adc a,d			;8403
	ld d,l			;8404
	xor d			;8405
	rst 10h			;8406
	rst 28h			;8407
	cp l			;8408
	ld e,(hl)		;8409
	xor d			;840a
	ld d,c			;840b
	ld hl,(0a014h)		;840c
	ld d,l			;840f
	adc a,a			;8410
	ld e,a			;8411
	ld e,(hl)		;8412
	cp a			;8413
	ccf			;8414
	ld a,a			;8415
	ld a,a			;8416
	ld a,a			;8417
	rst 38h			;8418
	ld d,a			;8419
	rst 38h			;841a
	ld e,(hl)		;841b
	add a,b			;841c
	ld d,l			;841d
	xor d			;841e
	ld d,l			;841f
	xor d			;8420
	ld d,l			;8421
	jp p,05ef9h		;8422
	call m,0fefdh		;8425
	cp 0feh			;8428
	rst 38h			;842a
	xor l			;842b
	rst 10h			;842c
	ld e,(hl)		;842d
	xor b			;842e
	ld d,l			;842f
	xor d			;8430
	ld d,l			;8431
	xor d			;8432
	ld d,l			;8433
	xor b			;8434
	ld d,l			;8435
	ld e,(hl)		;8436
	xor d			;8437
	ld d,l			;8438
	and d			;8439
	ld d,l			;843a
	xor d			;843b
	ld (hl),l		;843c
	ei			;843d
	rst 10h			;843e
	ld e,(hl)		;843f
	nop			;8440
	ld b,b			;8441
	xor b			;8442
	ld d,h			;8443
	xor b			;8444
	ld d,l			;8445
	xor b			;8446
	ld d,c			;8447
	ld d,(hl)		;8448
	xor d			;8449
l844ah:
	ld d,l			;844a
	xor d			;844b
	ld d,l			;844c
	xor d			;844d
	rst 10h			;844e
	ld l,e			;844f
	or (hl)			;8450
	ld d,(hl)		;8451
	nop			;8452
	nop			;8453
	add a,d			;8454
	inc d			;8455
	xor b			;8456
	ld d,b			;8457
	ld a,(bc)		;8458
	ld d,l			;8459
	ld b,(hl)		;845a
	xor b			;845b
	ld d,b			;845c
	and b			;845d
	ld d,h			;845e
	xor d			;845f
	ld (hl),a		;8460
	cp d			;8461
	rst 10h			;8462
	ld d,(hl)		;8463
	nop			;8464
	nop			;8465
l8466h:
	nop			;8466
	nop			;8467
	nop			;8468
	ld d,h			;8469
	xor b			;846a
	nop			;846b
	ld b,(hl)		;846c
	add a,b			;846d
	nop			;846e
	add a,b			;846f
	nop			;8470
	add a,b			;8471
	ld d,b			;8472
	xor b			;8473
	ld d,l			;8474
	ld b,(hl)		;8475
sub_8476h:
	ld hl,l653fh		;8476
	dec h			;8479
	ld (05c36h),hl		;847a
	ld hl,l848eh		;847d
	call 0611dh		;8480
	ld hl,05d2ah		;8483
	dec h			;8486
	ld (05c36h),hl		;8487
	call sub_84efh		;848a
	ret			;848d
l848eh:
	ld d,013h		;848e
	ld (bc),a		;8490
	djnz l849ah		;8491
	ld de,01300h		;8493
	nop			;8496
	ld hl,02322h		;8497
l849ah:
	add hl,sp		;849a
	add hl,sp		;849b
	add hl,sp		;849c
	dec l			;849d
	ld l,02fh		;849e
	add hl,sp		;84a0
	add hl,sp		;84a1
	add hl,sp		;84a2
	add hl,sp		;84a3
	ld a,(0393bh)		;84a4
	add hl,sp		;84a7
	add hl,sp		;84a8
	ld b,l			;84a9
	ld b,(hl)		;84aa
	ld b,a			;84ab
	add hl,sp		;84ac
	add hl,sp		;84ad
	add hl,sp		;84ae
	ld d,c			;84af
	ld d,d			;84b0
	ld d,e			;84b1
	ld d,014h		;84b2
	ld (bc),a		;84b4
	dec h			;84b5
	ld h,027h		;84b6
	add hl,sp		;84b8
	add hl,sp		;84b9
	add hl,sp		;84ba
	ld sp,03332h		;84bb
	add hl,sp		;84be
	add hl,sp		;84bf
	add hl,sp		;84c0
	dec a			;84c1
	ld a,03fh		;84c2
	add hl,sp		;84c4
	add hl,sp		;84c5
	add hl,sp		;84c6
	ld c,c			;84c7
	ld c,d			;84c8
	ld c,e			;84c9
	add hl,sp		;84ca
	add hl,sp		;84cb
	add hl,sp		;84cc
	ld d,l			;84cd
	ld d,(hl)		;84ce
	ld d,a			;84cf
	ld d,015h		;84d0
	ld (bc),a		;84d2
	add hl,hl		;84d3
	ld hl,(0392bh)		;84d4
	add hl,sp		;84d7
	add hl,sp		;84d8
	dec (hl)		;84d9
	ld (hl),037h		;84da
	add hl,sp		;84dc
	add hl,sp		;84dd
	add hl,sp		;84de
	ld b,c			;84df
	ld b,d			;84e0
	ld b,e			;84e1
	add hl,sp		;84e2
	add hl,sp		;84e3
	add hl,sp		;84e4
	ld c,l			;84e5
	ld c,(hl)		;84e6
	ld c,a			;84e7
	add hl,sp		;84e8
	add hl,sp		;84e9
	add hl,sp		;84ea
	ld e,c			;84eb
	ld e,d			;84ec
	ld e,e			;84ed
	rst 38h			;84ee
sub_84efh:
	ld a,001h		;84ef
	ld (l6245h),a		;84f1
	ld hl,l84fbh		;84f4
	call 06244h		;84f7
	ret			;84fa
l84fbh:
	ld d,001h		;84fb
	inc b			;84fd
	djnz l8506h		;84fe
	inc de			;8500
	ld bc,04552h		;8501
	ld d,e			;8504
	ld b,l			;8505
l8506h:
	ld d,h			;8506
	ld b,l			;8507
	ld b,c			;8508
	jr nz,l8564h		;8509
	jr nz,l8550h		;850b
	ld b,c			;850d
	ld d,d			;850e
	ld b,a			;850f
	ld b,c			;8510
	jr nz,l8558h		;8511
	ld c,h			;8513
	jr nz,$+76		;8514
	ld d,l			;8516
	ld b,l			;8517
	ld b,a			;8518
	ld c,a			;8519
	rst 38h			;851a
sub_851bh:
	ld hl,05800h		;851b
	ld bc,00200h		;851e
l8521h:
	ld a,d			;8521
	ld (hl),a		;8522
	inc hl			;8523
	dec bc			;8524
	ld a,c			;8525
	or b			;8526
	jr nz,l8521h		;8527
	ret			;8529
sub_852ah:
	ld a,(05814h)		;852a
	dec a			;852d
	cp 037h			;852e
	call z,sub_8540h	;8530
	ld (05814h),a		;8533
	ld (05815h),a		;8536
	ld (05834h),a		;8539
	ld (05835h),a		;853c
	ret			;853f
sub_8540h:
	ld a,03eh		;8540
	ret			;8542
sub_8543h:
	ld a,(l8565h)		;8543
	dec a			;8546
	ld (l8565h),a		;8547
	cp 000h			;854a
	call z,l8550h		;854c
	ret			;854f
l8550h:
	ld a,005h		;8550
	ld (l8565h),a		;8552
	ld a,(l8565h+1)		;8555
l8558h:
	dec a			;8558
	ld (l8565h+1),a		;8559
	cp 001h			;855c
	jp z,l8572h		;855e
	jp l8565h+2		;8561
l8564h:
	ret			;8564
l8565h:
	ld bc,01103h		;8565
	xor c			;8568
	add a,l			;8569
	ld ix,l857eh		;856a
	call 0697fh		;856e
	ret			;8571
l8572h:
	ld a,003h		;8572
	ld (l8565h+1),a		;8574
	ld hl,ledfch		;8577
	call sub_7d84h		;857a
	ret			;857d
l857eh:
	inc b			;857e
	dec b			;857f
	ld b,00eh		;8580
	nop			;8582
l8583h:
	push hl			;8583
	push af			;8584
	push de			;8585
	push bc			;8586
	push ix			;8587
	push iy			;8589
	call sub_8543h		;858b
	call sub_852ah		;858e
	pop iy			;8591
	pop ix			;8593
	pop bc			;8595
	pop de			;8596
l8597h:
	pop af			;8597
	pop hl			;8598
	jp 00038h		;8599
sub_859ch:
	ld hl,l8583h		;859c
l859fh:
	ld (0fdfeh),hl		;859f
	ld a,0feh		;85a2
	ld i,a			;85a4
	im 2			;85a6
	ret			;85a8
	nop			;85a9
	nop			;85aa
	nop			;85ab
	nop			;85ac
	inc b			;85ad
	nop			;85ae
	nop			;85af
	nop			;85b0
	jr c,$+3		;85b1
	ld bc,00301h		;85b3
	ld b,e			;85b6
	inc bc			;85b7
	inc bc			;85b8
	inc de			;85b9
	jr c,l85bfh		;85ba
	ld de,00909h		;85bc
l85bfh:
	add hl,bc		;85bf
	inc c			;85c0
	inc d			;85c1
	rla			;85c2
	jr c,l85d8h		;85c3
	dec sp			;85c5
	dec a			;85c6
	ld a,a			;85c7
	ccf			;85c8
	ccf			;85c9
	rra			;85ca
	rra			;85cb
	jr c,l85ceh		;85cc
l85ceh:
	nop			;85ce
	djnz l85e1h		;85cf
	djnz $+50		;85d1
	ld h,b			;85d3
	ret nz			;85d4
l85d5h:
	jr c,l8597h		;85d5
	ret nz			;85d7
l85d8h:
	ret po			;85d8
	ret po			;85d9
	ret p			;85da
	ret m			;85db
	call m,038fch		;85dc
	cp 0ffh			;85df
l85e1h:
	rst 38h			;85e1
l85e2h:
	rst 38h			;85e2
	rst 38h			;85e3
	rst 38h			;85e4
	rst 38h			;85e5
	ei			;85e6
	jr c,l85e2h		;85e7
	defb 0fdh,0fch,0fch ;illegal sequence	;85e9
	ret m			;85ec
	ret m			;85ed
	ret p			;85ee
l85efh:
	rst 38h			;85ef
	jr c,l85f2h		;85f0
l85f2h:
	nop			;85f2
	ld bc,00101h		;85f3
	ld bc,02301h		;85f6
	jr c,l85feh		;85f9
	inc bc			;85fb
	inc bc			;85fc
	inc bc			;85fd
l85feh:
	inc bc			;85fe
	rlca			;85ff
	rrca			;8600
	adc a,a			;8601
	jr c,$+1		;8602
	cp 0fch			;8604
	call m,lf9f8h+1		;8606
	ld sp,hl		;8609
	defb 0fdh,038h,0fch ;illegal sequence	;860a
	call m,sub_7bfdh	;860d
	ld a,a			;8610
	ccf			;8611
	ccf			;8612
l8613h:
	rst 38h			;8613
	jr c,$+66		;8614
	add a,b			;8616
	add a,b			;8617
	add a,b			;8618
	add a,h			;8619
	add a,b			;861a
	add a,h			;861b
	add a,b			;861c
	jr c,l859fh		;861d
	pop bc			;861f
	pop bc			;8620
	pop bc			;8621
	pop bc			;8622
l8623h:
	pop bc			;8623
	pop bc			;8624
	ret po			;8625
	jr c,$-30		;8626
	pop af			;8628
	di			;8629
	rst 20h			;862a
	rst 30h			;862b
l862ch:
	rst 38h			;862c
	rst 38h			;862d
	rst 38h			;862e
	jr c,$+1		;862f
	cp 0fdh			;8631
	cp 0ffh			;8633
	rst 38h			;8635
	rst 38h			;8636
	push af			;8637
	jr c,l863ah		;8638
l863ah:
	nop			;863a
	jr nz,$+34		;863b
	jr nz,l86afh		;863d
	ld (hl),b		;863f
sub_8640h:
	ret p			;8640
	jr c,l8623h		;8641
	ret po			;8643
	ret po			;8644
	ret po			;8645
	ret po			;8646
	ret nz			;8647
	ret po			;8648
	ret po			;8649
	jr c,l862ch		;864a
	ret p			;864c
	ret p			;864d
	ret p			;864e
	ret m			;864f
	ret m			;8650
	ret m			;8651
	call m,sub_fc38h	;8652
	call m,0fcfch		;8655
	ret m			;8658
	ret p			;8659
	ret po			;865a
	ld a,a			;865b
	jr c,l865eh		;865c
l865eh:
	nop			;865e
	nop			;865f
	nop			;8660
	nop			;8661
l8662h:
	nop			;8662
	nop			;8663
	nop			;8664
	nop			;8665
	nop			;8666
	nop			;8667
	nop			;8668
	nop			;8669
	nop			;866a
	nop			;866b
	nop			;866c
	nop			;866d
	nop			;866e
	nop			;866f
	nop			;8670
	nop			;8671
	nop			;8672
	nop			;8673
	nop			;8674
	nop			;8675
	nop			;8676
	nop			;8677
	nop			;8678
	nop			;8679
	nop			;867a
	nop			;867b
	nop			;867c
	nop			;867d
	nop			;867e
	nop			;867f
	nop			;8680
	nop			;8681
	nop			;8682
	nop			;8683
	nop			;8684
	nop			;8685
	nop			;8686
	nop			;8687
	nop			;8688
	nop			;8689
	nop			;868a
	nop			;868b
	nop			;868c
	nop			;868d
	nop			;868e
	nop			;868f
	nop			;8690
	nop			;8691
	nop			;8692
	nop			;8693
	nop			;8694
	nop			;8695
	nop			;8696
	nop			;8697
	nop			;8698
	nop			;8699
	nop			;869a
	nop			;869b
	nop			;869c
	nop			;869d
	nop			;869e
	nop			;869f
	nop			;86a0
	nop			;86a1
	nop			;86a2
	nop			;86a3
	nop			;86a4
	nop			;86a5
	nop			;86a6
	nop			;86a7
	nop			;86a8
	nop			;86a9
	nop			;86aa
	nop			;86ab
	nop			;86ac
	nop			;86ad
	nop			;86ae
l86afh:
	nop			;86af
	nop			;86b0
	nop			;86b1
	nop			;86b2
	nop			;86b3
	nop			;86b4
	nop			;86b5
	nop			;86b6
	nop			;86b7
	nop			;86b8
	nop			;86b9
	nop			;86ba
	nop			;86bb
	nop			;86bc
	nop			;86bd
	nop			;86be
	nop			;86bf
	nop			;86c0
	nop			;86c1
	nop			;86c2
	nop			;86c3
	nop			;86c4
	nop			;86c5
	nop			;86c6
	nop			;86c7
	nop			;86c8
	nop			;86c9
	nop			;86ca
	nop			;86cb
	nop			;86cc
	nop			;86cd
	nop			;86ce
	nop			;86cf
	nop			;86d0
	nop			;86d1
	nop			;86d2
	nop			;86d3
	nop			;86d4
	nop			;86d5
	nop			;86d6
	nop			;86d7
	nop			;86d8
	nop			;86d9
	nop			;86da
	nop			;86db
	nop			;86dc
	nop			;86dd
	nop			;86de
	nop			;86df
	nop			;86e0
	nop			;86e1
	nop			;86e2
	nop			;86e3
	nop			;86e4
	nop			;86e5
	nop			;86e6
	nop			;86e7
	nop			;86e8
	nop			;86e9
	nop			;86ea
	nop			;86eb
	nop			;86ec
	nop			;86ed
	nop			;86ee
	nop			;86ef
	nop			;86f0
	nop			;86f1
	nop			;86f2
	nop			;86f3
	nop			;86f4
	nop			;86f5
	nop			;86f6
	nop			;86f7
	nop			;86f8
	nop			;86f9
	nop			;86fa
	nop			;86fb
	nop			;86fc
	nop			;86fd
	nop			;86fe
	nop			;86ff
l8700h:
	nop			;8700
	nop			;8701
	nop			;8702
	nop			;8703
	nop			;8704
	nop			;8705
	nop			;8706
	nop			;8707
	nop			;8708
	nop			;8709
	nop			;870a
	nop			;870b
	nop			;870c
	nop			;870d
	nop			;870e
	nop			;870f
	nop			;8710
	nop			;8711
	nop			;8712
	nop			;8713
	nop			;8714
	nop			;8715
	nop			;8716
	nop			;8717
	nop			;8718
	nop			;8719
	nop			;871a
	nop			;871b
	nop			;871c
	nop			;871d
	nop			;871e
	nop			;871f
	nop			;8720
	nop			;8721
	nop			;8722
	nop			;8723
	nop			;8724
	nop			;8725
	nop			;8726
	nop			;8727
	nop			;8728
	nop			;8729
	nop			;872a
	nop			;872b
	nop			;872c
	nop			;872d
	nop			;872e
	nop			;872f
	nop			;8730
	nop			;8731
	nop			;8732
	nop			;8733
	nop			;8734
	nop			;8735
	nop			;8736
	nop			;8737
	nop			;8738
	nop			;8739
	nop			;873a
	nop			;873b
	nop			;873c
	nop			;873d
	nop			;873e
	nop			;873f
	nop			;8740
	nop			;8741
	nop			;8742
	nop			;8743
	nop			;8744
	nop			;8745
	nop			;8746
	nop			;8747
	nop			;8748
	nop			;8749
	nop			;874a
	nop			;874b
	nop			;874c
	nop			;874d
	nop			;874e
	nop			;874f
	nop			;8750
	nop			;8751
	nop			;8752
	nop			;8753
	nop			;8754
	nop			;8755
	nop			;8756
	nop			;8757
	nop			;8758
	nop			;8759
	nop			;875a
	nop			;875b
	nop			;875c
	nop			;875d
	nop			;875e
	nop			;875f
	nop			;8760
	nop			;8761
	nop			;8762
	nop			;8763
	nop			;8764
	nop			;8765
	nop			;8766
	nop			;8767
	nop			;8768
	nop			;8769
	nop			;876a
	nop			;876b
	nop			;876c
	nop			;876d
	nop			;876e
	nop			;876f
	nop			;8770
	nop			;8771
	nop			;8772
	nop			;8773
	nop			;8774
	nop			;8775
	nop			;8776
	nop			;8777
	nop			;8778
	nop			;8779
	nop			;877a
	nop			;877b
	nop			;877c
	nop			;877d
	nop			;877e
	nop			;877f
	nop			;8780
	nop			;8781
	nop			;8782
	nop			;8783
	nop			;8784
	nop			;8785
	nop			;8786
	nop			;8787
	nop			;8788
	nop			;8789
	nop			;878a
	nop			;878b
	nop			;878c
	nop			;878d
	nop			;878e
	nop			;878f
	nop			;8790
	nop			;8791
	nop			;8792
	nop			;8793
	nop			;8794
	nop			;8795
	nop			;8796
	nop			;8797
	nop			;8798
	nop			;8799
	nop			;879a
	nop			;879b
	nop			;879c
	nop			;879d
	nop			;879e
	nop			;879f
	nop			;87a0
	nop			;87a1
	nop			;87a2
	nop			;87a3
	nop			;87a4
	nop			;87a5
	nop			;87a6
	nop			;87a7
	nop			;87a8
	nop			;87a9
	nop			;87aa
	nop			;87ab
	nop			;87ac
	nop			;87ad
	nop			;87ae
	nop			;87af
	nop			;87b0
	nop			;87b1
	nop			;87b2
	nop			;87b3
	nop			;87b4
	nop			;87b5
	nop			;87b6
	nop			;87b7
	nop			;87b8
	nop			;87b9
	nop			;87ba
	nop			;87bb
	nop			;87bc
	nop			;87bd
	nop			;87be
	nop			;87bf
	nop			;87c0
	nop			;87c1
	nop			;87c2
	nop			;87c3
	nop			;87c4
	nop			;87c5
	nop			;87c6
	nop			;87c7
	nop			;87c8
	nop			;87c9
	nop			;87ca
	nop			;87cb
	nop			;87cc
	nop			;87cd
	nop			;87ce
	nop			;87cf
	nop			;87d0
	nop			;87d1
	nop			;87d2
	nop			;87d3
	nop			;87d4
	nop			;87d5
	nop			;87d6
	nop			;87d7
	nop			;87d8
	nop			;87d9
	nop			;87da
	nop			;87db
	nop			;87dc
	nop			;87dd
	nop			;87de
	nop			;87df
	nop			;87e0
	nop			;87e1
	nop			;87e2
	nop			;87e3
	nop			;87e4
	nop			;87e5
	nop			;87e6
	nop			;87e7
	nop			;87e8
	nop			;87e9
	nop			;87ea
	nop			;87eb
	nop			;87ec
	nop			;87ed
	nop			;87ee
	nop			;87ef
	nop			;87f0
	nop			;87f1
	nop			;87f2
	nop			;87f3
	nop			;87f4
	nop			;87f5
	nop			;87f6
	nop			;87f7
	nop			;87f8
	nop			;87f9
	nop			;87fa
	nop			;87fb
	nop			;87fc
	nop			;87fd
	nop			;87fe
	nop			;87ff
	nop			;8800
	nop			;8801
	nop			;8802
	nop			;8803
	nop			;8804
	nop			;8805
	nop			;8806
	nop			;8807
	nop			;8808
	nop			;8809
	nop			;880a
	nop			;880b
	nop			;880c
	nop			;880d
	nop			;880e
	nop			;880f
	nop			;8810
	nop			;8811
	nop			;8812
	nop			;8813
	nop			;8814
	nop			;8815
	nop			;8816
	nop			;8817
	nop			;8818
	nop			;8819
	nop			;881a
	nop			;881b
	nop			;881c
	nop			;881d
l881eh:
	nop			;881e
	nop			;881f
	nop			;8820
	nop			;8821
	nop			;8822
	nop			;8823
	nop			;8824
	nop			;8825
	nop			;8826
	nop			;8827
	nop			;8828
	nop			;8829
	nop			;882a
	nop			;882b
	nop			;882c
	nop			;882d
	nop			;882e
	nop			;882f
	nop			;8830
	nop			;8831
	nop			;8832
	nop			;8833
	nop			;8834
	nop			;8835
	nop			;8836
	nop			;8837
	nop			;8838
	nop			;8839
	nop			;883a
	nop			;883b
	nop			;883c
	nop			;883d
	nop			;883e
	nop			;883f
	nop			;8840
	nop			;8841
	nop			;8842
	nop			;8843
	nop			;8844
	nop			;8845
	nop			;8846
	nop			;8847
	nop			;8848
	nop			;8849
	nop			;884a
	nop			;884b
	nop			;884c
	nop			;884d
	nop			;884e
	nop			;884f
	nop			;8850
	nop			;8851
	nop			;8852
	nop			;8853
	nop			;8854
	nop			;8855
	nop			;8856
	nop			;8857
	nop			;8858
	nop			;8859
	nop			;885a
	nop			;885b
	nop			;885c
	nop			;885d
	nop			;885e
	nop			;885f
	nop			;8860
	nop			;8861
	nop			;8862
	nop			;8863
	nop			;8864
	nop			;8865
	nop			;8866
	nop			;8867
	nop			;8868
	nop			;8869
	nop			;886a
	nop			;886b
	nop			;886c
	nop			;886d
	nop			;886e
	nop			;886f
	nop			;8870
	nop			;8871
	nop			;8872
	nop			;8873
	nop			;8874
	nop			;8875
	nop			;8876
	nop			;8877
l8878h:
	nop			;8878
	nop			;8879
	nop			;887a
	nop			;887b
	nop			;887c
	nop			;887d
	nop			;887e
	nop			;887f
	nop			;8880
	nop			;8881
	nop			;8882
	nop			;8883
	nop			;8884
	nop			;8885
	nop			;8886
	nop			;8887
	nop			;8888
	nop			;8889
	nop			;888a
	nop			;888b
	nop			;888c
	nop			;888d
	nop			;888e
	nop			;888f
	nop			;8890
	nop			;8891
	nop			;8892
	nop			;8893
	nop			;8894
	nop			;8895
	nop			;8896
	nop			;8897
	nop			;8898
	nop			;8899
	nop			;889a
	nop			;889b
	nop			;889c
	nop			;889d
	nop			;889e
	nop			;889f
	nop			;88a0
	nop			;88a1
	nop			;88a2
	nop			;88a3
	nop			;88a4
	nop			;88a5
	nop			;88a6
	nop			;88a7
	nop			;88a8
	nop			;88a9
	nop			;88aa
	nop			;88ab
	nop			;88ac
	nop			;88ad
	nop			;88ae
	nop			;88af
	nop			;88b0
	nop			;88b1
	nop			;88b2
l88b3h:
	nop			;88b3
	nop			;88b4
	nop			;88b5
	nop			;88b6
	nop			;88b7
	ld ix,05d2ah		;88b8
	ld de,02af8h		;88bc
	ld a,0ffh		;88bf
	scf			;88c1
	call 00556h		;88c2
	ld ix,08af2h		;88c5
	ld de,l750dh		;88c9
	ld a,0ffh		;88cc
	scf			;88ce
	call 00556h		;88cf
	jp lff61h		;88d2
	nop			;88d5
	nop			;88d6
	nop			;88d7
	nop			;88d8
	nop			;88d9
	nop			;88da
	nop			;88db
	nop			;88dc
	nop			;88dd
	nop			;88de
	nop			;88df
	nop			;88e0
	nop			;88e1
	nop			;88e2
	nop			;88e3
	nop			;88e4
	nop			;88e5
	nop			;88e6
	nop			;88e7
	nop			;88e8
	nop			;88e9
	nop			;88ea
	nop			;88eb
	nop			;88ec
	nop			;88ed
	nop			;88ee
	nop			;88ef
	nop			;88f0
	nop			;88f1
	nop			;88f2
	nop			;88f3
	nop			;88f4
	nop			;88f5
	nop			;88f6
	nop			;88f7
	nop			;88f8
	nop			;88f9
	nop			;88fa
	nop			;88fb
	nop			;88fc
	nop			;88fd
	nop			;88fe
	nop			;88ff
	nop			;8900
	nop			;8901
	nop			;8902
	nop			;8903
	nop			;8904
	nop			;8905
	nop			;8906
	nop			;8907
	nop			;8908
	nop			;8909
	nop			;890a
	nop			;890b
	nop			;890c
	nop			;890d
	nop			;890e
	nop			;890f
	nop			;8910
	nop			;8911
	nop			;8912
	nop			;8913
	nop			;8914
	nop			;8915
	nop			;8916
	nop			;8917
	nop			;8918
	nop			;8919
	nop			;891a
	nop			;891b
	nop			;891c
	nop			;891d
	nop			;891e
	nop			;891f
	nop			;8920
	nop			;8921
	nop			;8922
	nop			;8923
	nop			;8924
	nop			;8925
	nop			;8926
	nop			;8927
	nop			;8928
	nop			;8929
	nop			;892a
	nop			;892b
	nop			;892c
	nop			;892d
	nop			;892e
	nop			;892f
	nop			;8930
	nop			;8931
	nop			;8932
	nop			;8933
	nop			;8934
	nop			;8935
	nop			;8936
	nop			;8937
	nop			;8938
	nop			;8939
	nop			;893a
	nop			;893b
	nop			;893c
	nop			;893d
	nop			;893e
	nop			;893f
	nop			;8940
	nop			;8941
	nop			;8942
	nop			;8943
	nop			;8944
	nop			;8945
	nop			;8946
	nop			;8947
	nop			;8948
	nop			;8949
	nop			;894a
	nop			;894b
	nop			;894c
	nop			;894d
	nop			;894e
	nop			;894f
	nop			;8950
	nop			;8951
	nop			;8952
	nop			;8953
	nop			;8954
	nop			;8955
	nop			;8956
	nop			;8957
	nop			;8958
	nop			;8959
	nop			;895a
	nop			;895b
	nop			;895c
	nop			;895d
	nop			;895e
	nop			;895f
	nop			;8960
	nop			;8961
	nop			;8962
	nop			;8963
	nop			;8964
	nop			;8965
	nop			;8966
	nop			;8967
	nop			;8968
	nop			;8969
	nop			;896a
	nop			;896b
	nop			;896c
	nop			;896d
	nop			;896e
	nop			;896f
	nop			;8970
	nop			;8971
	nop			;8972
	nop			;8973
	nop			;8974
	nop			;8975
	nop			;8976
	nop			;8977
	nop			;8978
	nop			;8979
	nop			;897a
	nop			;897b
	nop			;897c
	nop			;897d
	nop			;897e
	nop			;897f
	nop			;8980
sub_8981h:
	nop			;8981
	nop			;8982
	nop			;8983
	nop			;8984
	nop			;8985
	nop			;8986
	nop			;8987
	nop			;8988
	nop			;8989
	nop			;898a
	nop			;898b
	nop			;898c
	nop			;898d
	nop			;898e
	nop			;898f
	nop			;8990
	nop			;8991
	nop			;8992
	nop			;8993
	nop			;8994
	nop			;8995
	nop			;8996
	nop			;8997
	nop			;8998
	nop			;8999
	nop			;899a
	nop			;899b
	nop			;899c
	nop			;899d
	nop			;899e
	nop			;899f
	nop			;89a0
	nop			;89a1
	nop			;89a2
	nop			;89a3
	nop			;89a4
	nop			;89a5
	nop			;89a6
	nop			;89a7
	nop			;89a8
	nop			;89a9
	nop			;89aa
	nop			;89ab
	nop			;89ac
	nop			;89ad
	nop			;89ae
	nop			;89af
	nop			;89b0
	nop			;89b1
	nop			;89b2
	nop			;89b3
	nop			;89b4
	nop			;89b5
	nop			;89b6
	nop			;89b7
	nop			;89b8
	nop			;89b9
	nop			;89ba
	nop			;89bb
	nop			;89bc
	nop			;89bd
	nop			;89be
	nop			;89bf
	nop			;89c0
	nop			;89c1
	nop			;89c2
	nop			;89c3
	nop			;89c4
	nop			;89c5
	nop			;89c6
	nop			;89c7
	nop			;89c8
	nop			;89c9
	nop			;89ca
	nop			;89cb
	nop			;89cc
	nop			;89cd
	nop			;89ce
	nop			;89cf
	nop			;89d0
	nop			;89d1
	nop			;89d2
	nop			;89d3
	nop			;89d4
	nop			;89d5
	nop			;89d6
	nop			;89d7
	nop			;89d8
	nop			;89d9
	nop			;89da
	nop			;89db
	nop			;89dc
	nop			;89dd
	nop			;89de
	nop			;89df
	nop			;89e0
	nop			;89e1
	nop			;89e2
	nop			;89e3
	nop			;89e4
	nop			;89e5
	nop			;89e6
	nop			;89e7
	nop			;89e8
	nop			;89e9
	nop			;89ea
	nop			;89eb
	nop			;89ec
	nop			;89ed
	nop			;89ee
	nop			;89ef
	nop			;89f0
	nop			;89f1
	nop			;89f2
	nop			;89f3
	nop			;89f4
	nop			;89f5
	nop			;89f6
	nop			;89f7
	nop			;89f8
	nop			;89f9
	nop			;89fa
	nop			;89fb
	nop			;89fc
	nop			;89fd
	nop			;89fe
	nop			;89ff
	nop			;8a00
	nop			;8a01
	nop			;8a02
	nop			;8a03
	nop			;8a04
	nop			;8a05
	nop			;8a06
	nop			;8a07
	nop			;8a08
	nop			;8a09
	nop			;8a0a
	nop			;8a0b
	nop			;8a0c
	nop			;8a0d
	nop			;8a0e
	nop			;8a0f
	nop			;8a10
	nop			;8a11
	nop			;8a12
	nop			;8a13
	nop			;8a14
	nop			;8a15
	nop			;8a16
	nop			;8a17
	nop			;8a18
	nop			;8a19
	nop			;8a1a
	nop			;8a1b
	nop			;8a1c
	nop			;8a1d
	nop			;8a1e
	nop			;8a1f
	nop			;8a20
	nop			;8a21
	nop			;8a22
	nop			;8a23
	nop			;8a24
sub_8a25h:
	nop			;8a25
	nop			;8a26
	nop			;8a27
	nop			;8a28
	nop			;8a29
	nop			;8a2a
	nop			;8a2b
	nop			;8a2c
	nop			;8a2d
	nop			;8a2e
	nop			;8a2f
	nop			;8a30
	nop			;8a31
	nop			;8a32
	nop			;8a33
	nop			;8a34
	nop			;8a35
	nop			;8a36
	nop			;8a37
	nop			;8a38
	nop			;8a39
	nop			;8a3a
	nop			;8a3b
	nop			;8a3c
	nop			;8a3d
	nop			;8a3e
	nop			;8a3f
	nop			;8a40
	nop			;8a41
	nop			;8a42
	nop			;8a43
	nop			;8a44
	nop			;8a45
	nop			;8a46
	nop			;8a47
	nop			;8a48
	nop			;8a49
	nop			;8a4a
	nop			;8a4b
	nop			;8a4c
	nop			;8a4d
	nop			;8a4e
	nop			;8a4f
	nop			;8a50
	nop			;8a51
	nop			;8a52
	nop			;8a53
	nop			;8a54
	nop			;8a55
	nop			;8a56
	nop			;8a57
	nop			;8a58
	nop			;8a59
	nop			;8a5a
	nop			;8a5b
	nop			;8a5c
	nop			;8a5d
	nop			;8a5e
	nop			;8a5f
	nop			;8a60
	nop			;8a61
	nop			;8a62
	nop			;8a63
	nop			;8a64
	nop			;8a65
	nop			;8a66
	nop			;8a67
	nop			;8a68
	nop			;8a69
	nop			;8a6a
	nop			;8a6b
	nop			;8a6c
	nop			;8a6d
	nop			;8a6e
	nop			;8a6f
	nop			;8a70
	nop			;8a71
	nop			;8a72
	nop			;8a73
	nop			;8a74
	nop			;8a75
	nop			;8a76
	nop			;8a77
	nop			;8a78
	nop			;8a79
	nop			;8a7a
	nop			;8a7b
	nop			;8a7c
	nop			;8a7d
	nop			;8a7e
	nop			;8a7f
	nop			;8a80
	nop			;8a81
	nop			;8a82
	nop			;8a83
	nop			;8a84
	nop			;8a85
	nop			;8a86
	nop			;8a87
	nop			;8a88
	nop			;8a89
l8a8ah:
	nop			;8a8a
	nop			;8a8b
l8a8ch:
	nop			;8a8c
	nop			;8a8d
	nop			;8a8e
	nop			;8a8f
	nop			;8a90
	nop			;8a91
	nop			;8a92
	nop			;8a93
	nop			;8a94
	nop			;8a95
	nop			;8a96
	nop			;8a97
	nop			;8a98
	nop			;8a99
	nop			;8a9a
	nop			;8a9b
	nop			;8a9c
	nop			;8a9d
	nop			;8a9e
	nop			;8a9f
	nop			;8aa0
	nop			;8aa1
	nop			;8aa2
	nop			;8aa3
	nop			;8aa4
	nop			;8aa5
	nop			;8aa6
	nop			;8aa7
	nop			;8aa8
	nop			;8aa9
	nop			;8aaa
	nop			;8aab
	nop			;8aac
	nop			;8aad
	nop			;8aae
	nop			;8aaf
	adc a,00bh		;8ab0
	rst 18h			;8ab2
	ld c,b			;8ab3
	ld (bc),a		;8ab4
	ld a,(bc)		;8ab5
	call pe,sub_e222h	;8ab6
	ld (l6140h),hl		;8ab9
	ld e,c			;8abc
	inc de			;8abd
	in a,(002h)		;8abe
	ld c,l			;8ac0
	nop			;8ac1
	jr c,l8b26h		;8ac2
	ex af,af'		;8ac4
	ld c,0adh		;8ac5
	ld d,(hl)		;8ac7
	ld h,h			;8ac8
	nop			;8ac9
	nop			;8aca
	nop			;8acb
	cp a			;8acc
	ld d,e			;8acd
l8aceh:
	dec b			;8ace
	dec b			;8acf
	defb 0edh ;next byte illegal after ed	;8ad0
	rst 38h			;8ad1
	jr c,l8b36h		;8ad2
	ret nc			;8ad4
	rst 38h			;8ad5
	ld a,(bc)		;8ad6
	nop			;8ad7
	sbc a,d			;8ad8
	rst 38h			;8ad9
	dec hl			;8ada
	dec l			;8adb
	ld h,l			;8adc
	inc sp			;8add
	ld a,a			;8ade
	djnz l8aceh		;8adf
	djnz l8af0h		;8ae1
	nop			;8ae3
	add hl,bc		;8ae4
	nop			;8ae5
	add a,l			;8ae6
	inc e			;8ae7
	djnz l8b06h		;8ae8
	ld d,d			;8aea
	dec de			;8aeb
	halt			;8aec
	dec de			;8aed
	inc bc			;8aee
	inc de			;8aef
l8af0h:
	nop			;8af0
	ld a,000h		;8af1
	nop			;8af3
	nop			;8af4
	nop			;8af5
	nop			;8af6
	nop			;8af7
	nop			;8af8
	nop			;8af9
	nop			;8afa
	nop			;8afb
	nop			;8afc
	nop			;8afd
	nop			;8afe
	nop			;8aff
l8b00h:
	nop			;8b00
	nop			;8b01
	nop			;8b02
	nop			;8b03
	nop			;8b04
	nop			;8b05
l8b06h:
	nop			;8b06
	nop			;8b07
	nop			;8b08
	nop			;8b09
	nop			;8b0a
	nop			;8b0b
	nop			;8b0c
	nop			;8b0d
	nop			;8b0e
	nop			;8b0f
	nop			;8b10
	nop			;8b11
	and h			;8b12
	add a,c			;8b13
	ex (sp),hl		;8b14
	inc e			;8b15
	add a,l			;8b16
	add a,b			;8b17
	ld b,0b2h		;8b18
	or (hl)			;8b1a
	rst 18h			;8b1b
	add a,b			;8b1c
	nop			;8b1d
	dec sp			;8b1e
	rlca			;8b1f
	inc b			;8b20
	cp e			;8b21
	ld b,b			;8b22
	nop			;8b23
	jr l8b2bh		;8b24
l8b26h:
	add a,c			;8b26
	ex af,af'		;8b27
	cp b			;8b28
	ld a,d			;8b29
	add a,d			;8b2a
l8b2bh:
	jr l8b2dh		;8b2b
l8b2dh:
	nop			;8b2d
	nop			;8b2e
	jr c,l8b49h		;8b2f
	nop			;8b31
	inc h			;8b32
	and h			;8b33
	and (hl)		;8b34
	ld b,b			;8b35
l8b36h:
	ld b,e			;8b36
	jr c,l8b00h		;8b37
	rst 38h			;8b39
	ld a,l			;8b3a
	jp pe,03cb0h		;8b3b
	ld h,010h		;8b3e
	add hl,bc		;8b40
	ret po			;8b41
	dec (hl)		;8b42
	jr l8b45h		;8b43
l8b45h:
	adc a,l			;8b45
	ret nz			;8b46
	ld (bc),a		;8b47
	ld (de),a		;8b48
l8b49h:
	ld (bc),a		;8b49
	call m,03f27h		;8b4a
	adc a,a			;8b4d
	rst 28h			;8b4e
	rst 38h			;8b4f
	nop			;8b50
	jr nc,l8b9bh		;8b51
	call z,00f71h		;8b53
	nop			;8b56
	ex (sp),hl		;8b57
	ld c,b			;8b58
	add a,d			;8b59
	inc bc			;8b5a
	inc bc			;8b5b
	ld h,0cbh		;8b5c
	add a,b			;8b5e
	ld l,(hl)		;8b5f
	inc h			;8b60
	ld b,c			;8b61
	ld (bc),a		;8b62
	rlca			;8b63
	ret nz			;8b64
	ld e,d			;8b65
	ret po			;8b66
	nop			;8b67
	dec b			;8b68
	nop			;8b69
	ld b,b			;8b6a
	or d			;8b6b
	xor d			;8b6c
	cp (hl)			;8b6d
	ld l,d			;8b6e
	xor d			;8b6f
	xor c			;8b70
	inc (hl)		;8b71
	scf			;8b72
	inc sp			;8b73
	ret nc			;8b74
	ld d,c			;8b75
	ld a,b			;8b76
	ret po			;8b77
	rlca			;8b78
	nop			;8b79
	nop			;8b7a
	ld e,b			;8b7b
	ld a,a			;8b7c
	sub (hl)		;8b7d
	rst 0			;8b7e
sub_8b7fh:
	ld e,h			;8b7f
	pop af			;8b80
	nop			;8b81
	jr nz,$+1		;8b82
	ld a,b			;8b84
	sub l			;8b85
	nop			;8b86
	ld (bc),a		;8b87
	xor d			;8b88
	ccf			;8b89
	ld (bc),a		;8b8a
	ld c,d			;8b8b
	jp pe,0b6aah		;8b8c
	xor d			;8b8f
	xor d			;8b90
	cp (hl)			;8b91
	call p,03f3dh		;8b92
	adc a,(hl)		;8b95
	xor d			;8b96
	xor d			;8b97
	or l			;8b98
	or c			;8b99
	rst 28h			;8b9a
l8b9bh:
	ld a,e			;8b9b
	and d			;8b9c
	and h			;8b9d
	ret nz			;8b9e
	ld e,(hl)		;8b9f
	ld a,a			;8ba0
	ret nz			;8ba1
	cp 03bh			;8ba2
	jp 060e8h		;8ba4
	inc h			;8ba7
	inc c			;8ba8
	ld b,b			;8ba9
	ld b,e			;8baa
	jp nc,l76abh		;8bab
	xor e			;8bae
	ld hl,(l8daah)		;8baf
	inc bc			;8bb2
	xor l			;8bb3
	ld l,h			;8bb4
	adc a,l			;8bb5
	and a			;8bb6
	rst 38h			;8bb7
	jp nz,02c64h		;8bb8
	dec h			;8bbb
	daa			;8bbc
	ld a,0afh		;8bbd
	add a,b			;8bbf
	jr nz,$+5		;8bc0
	nop			;8bc2
	inc d			;8bc3
	sbc a,0f8h		;8bc4
	add hl,bc		;8bc6
	nop			;8bc7
	sub b			;8bc8
	ld b,b			;8bc9
	ld c,a			;8bca
	push af			;8bcb
	xor d			;8bcc
	xor d			;8bcd
	xor d			;8bce
	xor d			;8bcf
	xor d			;8bd0
	or (hl)			;8bd1
	inc c			;8bd2
	ld l,a			;8bd3
	rst 38h			;8bd4
	adc a,e			;8bd5
	ld a,a			;8bd6
	rst 38h			;8bd7
	ld d,h			;8bd8
	and h			;8bd9
	inc h			;8bda
	inc h			;8bdb
	inc h			;8bdc
	inc h			;8bdd
	inc h			;8bde
	dec l			;8bdf
	ld (bc),a		;8be0
	nop			;8be1
	nop			;8be2
	ld e,b			;8be3
	scf			;8be4
	call m,sub_a578h	;8be5
	ld e,087h		;8be8
	rst 38h			;8bea
	defb 0fdh,06ah ;ld iyl,d	;8beb
	jp c,laaaah		;8bed
	xor d			;8bf0
	xor l			;8bf1
	ld bc,000fch		;8bf2
	jr nz,l8bfah		;8bf5
	sub d			;8bf7
	xor h			;8bf8
	inc b			;8bf9
l8bfah:
	nop			;8bfa
	nop			;8bfb
	inc bc			;8bfc
	ret m			;8bfd
	nop			;8bfe
l8bffh:
	ld bc,00800h		;8bff
	and b			;8c02
	nop			;8c03
	add a,b			;8c04
	djnz l8c07h		;8c05
l8c07h:
	nop			;8c07
	push af			;8c08
	ld (hl),b		;8c09
	nop			;8c0a
	ex af,af'		;8c0b
	nop			;8c0c
	nop			;8c0d
	nop			;8c0e
	jr l8c31h		;8c0f
	nop			;8c11
	ld c,d			;8c12
	ld b,d			;8c13
	ld c,e			;8c14
	inc c			;8c15
	adc a,e			;8c16
	inc b			;8c17
	ld bc,lf4fah		;8c18
	cp (hl)			;8c1b
	ld b,b			;8c1c
	nop			;8c1d
	ld de,00307h		;8c1e
	rst 10h			;8c21
	ret nz			;8c22
	nop			;8c23
	nop			;8c24
	dec b			;8c25
	ret nz			;8c26
	ex af,af'		;8c27
	ret po			;8c28
	dec (hl)		;8c29
	add a,b			;8c2a
	nop			;8c2b
	nop			;8c2c
	nop			;8c2d
	nop			;8c2e
	jr c,$+26		;8c2f
l8c31h:
	nop			;8c31
	sbc a,a			;8c32
	ld a,(bc)		;8c33
	ld c,e			;8c34
	ld b,b			;8c35
	ld hl,00f4eh		;8c36
	rst 38h			;8c39
	cp e			;8c3a
	rst 38h			;8c3b
	ld e,a			;8c3c
	jp nc,00814h		;8c3d
	jr z,$-33		;8c40
	out (018h),a		;8c42
	nop			;8c44
	ld d,c			;8c45
	add a,b			;8c46
	ld bc,00400h		;8c47
	ld e,064h		;8c4a
	ret po			;8c4c
	ld b,a			;8c4d
	ret m			;8c4e
	ld c,a			;8c4f
	ret m			;8c50
	jr l8c63h		;8c51
	nop			;8c53
	ld c,d			;8c54
	rrca			;8c55
	add a,b			;8c56
	dec a			;8c57
	add a,h			;8c58
	ld (hl),l		;8c59
	adc a,l			;8c5a
	defb 0fdh,0cah,044h ;illegal sequence	;8c5b
	ld l,(hl)		;8c5e
	ld l,034h		;8c5f
	inc b			;8c61
	ld (bc),a		;8c62
l8c63h:
	inc bc			;8c63
	ret nz			;8c64
	ld d,d			;8c65
	ret p			;8c66
	ld b,b			;8c67
	add a,d			;8c68
	ld (de),a		;8c69
	nop			;8c6a
	cp c			;8c6b
	ld d,l			;8c6c
	ld d,h			;8c6d
	ld d,l			;8c6e
	ld d,l			;8c6f
	ld e,e			;8c70
	inc l			;8c71
	ld hl,(lb013h)		;8c72
	ld d,b			;8c75
	or a			;8c76
	inc a			;8c77
	nop			;8c78
	add a,b			;8c79
	jr z,l8c82h		;8c7a
	ret nc			;8c7c
	jp (hl)			;8c7d
	ld bc,001beh		;8c7e
	add a,b			;8c81
l8c82h:
	ld h,c			;8c82
	cp 0b8h			;8c83
	sub c			;8c85
	nop			;8c86
	nop			;8c87
	ld d,l			;8c88
	add a,b			;8c89
	call m,04d2dh		;8c8a
	ld e,a			;8c8d
	ld c,e			;8c8e
	ld d,l			;8c8f
	ld d,(hl)		;8c90
	sub 0f4h		;8c91
	ld d,l			;8c93
	add hl,sp		;8c94
	adc a,e			;8c95
	dec l			;8c96
	ld e,l			;8c97
	ld d,l			;8c98
	cp c			;8c99
	rst 38h			;8c9a
	or 070h			;8c9b
	and h			;8c9d
	ld h,b			;8c9e
	and h			;8c9f
	inc bc			;8ca0
	ex (sp),hl		;8ca1
	ret p			;8ca2
	inc b			;8ca3
	ex de,hl		;8ca4
	ret pe			;8ca5
	jr nc,l8ccch		;8ca6
	jr l8cb1h		;8ca8
	cp l			;8caa
	ex de,hl		;8cab
	ld d,(hl)		;8cac
	ld d,l			;8cad
	ld d,l			;8cae
	push de			;8caf
	ld d,l			;8cb0
l8cb1h:
	defb 0edh ;next byte illegal after ed	;8cb1
	rrca			;8cb2
	ld d,l			;8cb3
	inc l			;8cb4
	adc a,l			;8cb5
	ld d,c			;8cb6
	rst 38h			;8cb7
	add a,a			;8cb8
	sbc a,058h		;8cb9
	ld e,b			;8cbb
	ld e,c			;8cbc
	cp c			;8cbd
	ld d,l			;8cbe
	call po,00540h		;8cbf
	nop			;8cc2
	inc c			;8cc3
	ld l,(hl)		;8cc4
	ret m			;8cc5
	ld d,081h		;8cc6
sub_8cc8h:
	ld l,b			;8cc8
	sub a			;8cc9
	rst 38h			;8cca
	push af			;8ccb
l8ccch:
	push de			;8ccc
	ld c,l			;8ccd
	ld d,l			;8cce
	ld a,l			;8ccf
	ld d,l			;8cd0
	ld (hl),a		;8cd1
	jr l8d4bh		;8cd2
	rst 38h			;8cd4
	adc a,e			;8cd5
	rst 38h			;8cd6
	jp m,018bch		;8cd7
	jr l8cf4h		;8cda
	jr $+26			;8cdc
	jr $+87			;8cde
	sub b			;8ce0
	ld bc,02800h		;8ce1
	ld e,a			;8ce4
	cp 007h			;8ce5
	ld b,d			;8ce7
	ret po			;8ce8
	adc a,a			;8ce9
	rst 0			;8cea
	jp m,lb5d5h		;8ceb
	ld d,l			;8cee
	ld l,l			;8cef
	ld d,l			;8cf0
	ld e,l			;8cf1
	ld c,003h		;8cf2
l8cf4h:
	add a,b			;8cf4
	jr nz,$+14		;8cf5
	add hl,sp		;8cf7
	ret m			;8cf8
	ld (bc),a		;8cf9
	ld bc,00c04h		;8cfa
	and a			;8cfd
	nop			;8cfe
	ld bc,00c00h		;8cff
	jr nz,l8d04h		;8d02
l8d04h:
	ld b,b			;8d04
	djnz l8d07h		;8d05
l8d07h:
	ld bc,laccah		;8d07
l8d0ah:
	ret nz			;8d0a
	ex af,af'		;8d0b
	jr nz,l8d0eh		;8d0c
l8d0eh:
	nop			;8d0e
	inc c			;8d0f
	jr nz,l8d12h		;8d10
l8d12h:
	xor d			;8d12
	and h			;8d13
	and h			;8d14
	add a,b			;8d15
	sub l			;8d16
	ld b,00ch		;8d17
	ld e,l			;8d19
	ld (hl),l		;8d1a
	ld a,l			;8d1b
	add a,b			;8d1c
	nop			;8d1d
	add hl,hl		;8d1e
	ld b,009h		;8d1f
	ld (hl),l		;8d21
	ld h,b			;8d22
	nop			;8d23
	nop			;8d24
	ld sp,008c0h		;8d25
	djnz l8d6ah		;8d28
	add a,b			;8d2a
	nop			;8d2b
	nop			;8d2c
	nop			;8d2d
	nop			;8d2e
	inc a			;8d2f
	jr l8d32h		;8d30
l8d32h:
	ret po			;8d32
	xor c			;8d33
	jp p,02244h		;8d34
	adc a,e			;8d37
	ei			;8d38
	rst 18h			;8d39
	rst 0			;8d3a
	rst 28h			;8d3b
	or h			;8d3c
	adc a,c			;8d3d
	inc b			;8d3e
	ex af,af'		;8d3f
	djnz l8d0ah		;8d40
	sub l			;8d42
	jr l8d45h		;8d43
l8d45h:
	ld d,c			;8d45
	add a,b			;8d46
	nop			;8d47
	cp d			;8d48
	ret pe			;8d49
	ld (bc),a		;8d4a
l8d4bh:
	sbc a,h			;8d4b
	jr l8d9ch		;8d4c
	cp h			;8d4e
	ld (bc),a		;8d4f
	cp 018h			;8d50
	and b			;8d52
	nop			;8d53
	inc h			;8d54
	rrca			;8d55
	add a,b			;8d56
	rrca			;8d57
	adc a,d			;8d58
	ex af,af'		;8d59
	ld d,b			;8d5a
	add a,e			;8d5b
	ld h,018h		;8d5c
	xor 036h		;8d5e
	inc a			;8d60
	nop			;8d61
	ld (bc),a		;8d62
	inc bc			;8d63
	ret po			;8d64
	ld e,d			;8d65
	cp 000h			;8d66
	dec b			;8d68
	nop			;8d69
l8d6ah:
	nop			;8d6a
	sbc a,(hl)		;8d6b
	xor d			;8d6c
	xor h			;8d6d
	xor d			;8d6e
	xor d			;8d6f
	xor c			;8d70
	inc a			;8d71
	xor (hl)		;8d72
	inc sp			;8d73
	sub 096h		;8d74
	xor d			;8d76
	add a,0ffh		;8d77
	ld b,e			;8d79
	rst 38h			;8d7a
	add a,b			;8d7b
	add a,b			;8d7c
	ld (lbf00h),a		;8d7d
	defb 0fdh,000h,05fh ;illegal sequence	;8d80
	cp 09eh			;8d83
	add a,c			;8d85
	nop			;8d86
	nop			;8d87
	ld hl,(00988h)		;8d88
	xor (hl)		;8d8b
	and (hl)		;8d8c
	xor (hl)		;8d8d
	cp l			;8d8e
	xor d			;8d8f
	xor d			;8d90
	sub 0ech		;8d91
	xor l			;8d93
	dec a			;8d94
	adc a,d			;8d95
	ld a,0aeh		;8d96
	xor d			;8d98
	ld e,a			;8d99
	ccf			;8d9a
	xor l			;8d9b
l8d9ch:
	ld d,b			;8d9c
	inc h			;8d9d
	add hl,sp		;8d9e
	ld d,h			;8d9f
	nop			;8da0
	rst 38h			;8da1
	ret nz			;8da2
	inc hl			;8da3
	ld h,e			;8da4
	ret pe			;8da5
	ld e,b			;8da6
	ld b,d			;8da7
	inc (hl)		;8da8
	ld b,b			;8da9
l8daah:
	ld b,e			;8daa
	ex de,hl		;8dab
	xor e			;8dac
	ld l,(hl)		;8dad
	xor d			;8dae
	sbc a,d			;8daf
	xor d			;8db0
	xor (hl)		;8db1
	ld a,(de)		;8db2
	xor l			;8db3
	xor a			;8db4
	adc a,h			;8db5
	adc a,b			;8db6
	rst 38h			;8db7
	dec c			;8db8
	inc e			;8db9
	jr l8dd5h		;8dba
	jr c,l8e16h		;8dbc
	cp d			;8dbe
	or l			;8dbf
	jr nc,$+77		;8dc0
	ld bc,lae14h		;8dc2
	call m,sub_6624h	;8dc5
	inc h			;8dc8
	add a,b			;8dc9
	rst 38h			;8dca
	jp m,lcaeah		;8dcb
	xor d			;8dce
	xor d			;8dcf
	xor d			;8dd0
	xor d			;8dd1
	jr nc,l8e03h		;8dd2
	rst 38h			;8dd4
l8dd5h:
	adc a,e			;8dd5
	inc bc			;8dd6
	push af			;8dd7
	ld a,(hl)		;8dd8
	jr $+26			;8dd9
	jr l8df5h		;8ddb
	jr l8df7h		;8ddd
	inc l			;8ddf
	adc a,h			;8de0
	ld bc,05800h		;8de1
	dec hl			;8de4
	cp 009h			;8de5
	and l			;8de7
	sub b			;8de8
	rla			;8de9
	rlca			;8dea
	jp m,lbaeah		;8deb
	xor d			;8dee
	xor d			;8def
	xor d			;8df0
	xor l			;8df1
	jr nc,l8df4h		;8df2
l8df4h:
	ld h,b			;8df4
l8df5h:
	jr nc,l8e0eh		;8df5
l8df7h:
	rla			;8df7
	ex af,af'		;8df8
	ld (bc),a		;8df9
	ld bc,04708h		;8dfa
	jp m,003e0h		;8dfd
	nop			;8e00
	inc b			;8e01
	ret po			;8e02
l8e03h:
	nop			;8e03
	ld h,b			;8e04
	djnz l8e07h		;8e05
l8e07h:
	or 0b8h			;8e07
	ld e,e			;8e09
	jr c,$+14		;8e0a
	jr nz,l8e0eh		;8e0c
l8e0eh:
	nop			;8e0e
	inc c			;8e0f
	djnz l8e12h		;8e10
l8e12h:
	adc a,d			;8e12
	ld hl,(l80aah)		;8e13
l8e16h:
	cp a			;8e16
	ld b,003h		;8e17
	ld a,0ffh		;8e19
	or 000h			;8e1b
	nop			;8e1d
	ld d,l			;8e1e
	ld b,003h		;8e1f
	sbc a,(hl)		;8e21
	ret m			;8e22
	nop			;8e23
	ld d,h			;8e24
	rst 38h			;8e25
	rst 38h			;8e26
	jp c,03265h		;8e27
	defb 0fdh,0ffh,0f7h ;illegal sequence	;8e2a
	rst 38h			;8e2d
	ret m			;8e2e
	inc a			;8e2f
	jr l8e32h		;8e30
l8e32h:
	cp a			;8e32
	xor h			;8e33
	adc a,b			;8e34
	ld b,d			;8e35
	dec (hl)		;8e36
	inc d			;8e37
	and c			;8e38
	ex (sp),hl		;8e39
	cp (hl)			;8e3a
	rra			;8e3b
	ld d,d			;8e3c
	ld c,d			;8e3d
	adc a,h			;8e3e
	inc c			;8e3f
	djnz l8ebah		;8e40
	di			;8e42
	inc e			;8e43
	nop			;8e44
	jr z,l8e47h		;8e45
l8e47h:
	add a,b			;8e47
	ld a,l			;8e48
	ret p			;8e49
	ld (bc),a		;8e4a
	rst 10h			;8e4b
	daa			;8e4c
	dec hl			;8e4d
	ld d,a			;8e4e
	ret nz			;8e4f
	rrca			;8e50
	jr $-126		;8e51
	nop			;8e53
	jr l8e75h		;8e54
	ret nz			;8e56
	nop			;8e57
	jp (hl)			;8e58
	rst 10h			;8e59
	rlca			;8e5a
	ld e,(hl)		;8e5b
	inc h			;8e5c
	ret p			;8e5d
	xor 016h		;8e5e
	inc d			;8e60
	nop			;8e61
	inc b			;8e62
	inc bc			;8e63
	ret p			;8e64
	ld d,l			;8e65
	ld a,(hl)		;8e66
	inc bc			;8e67
	jp m,000ffh		;8e68
	sub h			;8e6b
	push de			;8e6c
	ld e,e			;8e6d
	sub l			;8e6e
	ld d,l			;8e6f
	ld e,c			;8e70
	cp h			;8e71
	sbc a,(hl)		;8e72
	inc de			;8e73
	and b			;8e74
l8e75h:
	adc a,e			;8e75
	ld d,l			;8e76
	ld a,c			;8e77
	ccf			;8e78
	cp (hl)			;8e79
	rra			;8e7a
	rst 38h			;8e7b
	cp e			;8e7c
	jp nc,l5f42h		;8e7d
	ld sp,hl		;8e80
	inc e			;8e81
	cp a			;8e82
	call m,022deh		;8e83
	nop			;8e86
	nop			;8e87
	dec b			;8e88
	ld c,l			;8e89
	ei			;8e8a
	xor l			;8e8b
	ld l,e			;8e8c
	ld d,a			;8e8d
	ld e,c			;8e8e
	ld d,l			;8e8f
	ld d,(hl)		;8e90
	in a,(0e8h)		;8e91
	ld e,d			;8e93
	cp a			;8e94
	adc a,a			;8e95
	ld d,l			;8e96
	ld e,e			;8e97
	ld e,d			;8e98
	ld h,(hl)		;8e99
	ret nz			;8e9a
	ld e,l			;8e9b
	or b			;8e9c
	ld a,(bc)		;8e9d
	dec c			;8e9e
	ld d,h			;8e9f
	nop			;8ea0
	ccf			;8ea1
	add a,b			;8ea2
	ld de,l88b3h		;8ea3
	ld c,a			;8ea6
	add a,c			;8ea7
	call po,0fd47h		;8ea8
	ex de,hl		;8eab
	ld d,l			;8eac
	xor l			;8ead
	ld d,l			;8eae
	ld c,l			;8eaf
	ld d,l			;8eb0
	xor a			;8eb1
	ld d,(iy-061h)		;8eb2
	adc a,h			;8eb5
	add a,h			;8eb6
l8eb7h:
	ld a,a			;8eb7
	ld a,(bc)		;8eb8
	cp h			;8eb9
l8ebah:
	inc h			;8eba
	inc h			;8ebb
	dec l			;8ebc
	inc h			;8ebd
	dec h			;8ebe
	ld e,d			;8ebf
	inc e			;8ec0
	dec d			;8ec1
	nop			;8ec2
	xor b			;8ec3
	ld d,(hl)		;8ec4
	call m,sub_8125h	;8ec5
	and h			;8ec8
	adc a,a			;8ec9
	rst 38h			;8eca
	jp m,04dd5h		;8ecb
	ld d,l			;8ece
	ld l,l			;8ecf
	ld d,l			;8ed0
	ld l,e			;8ed1
	ld h,b			;8ed2
	ccf			;8ed3
	rst 38h			;8ed4
	adc a,e			;8ed5
	sbc a,0aah		;8ed6
	cp 024h			;8ed8
	inc h			;8eda
	inc h			;8edb
	inc h			;8edc
	inc h			;8edd
	inc h			;8ede
	inc (hl)		;8edf
	add a,d			;8ee0
	ld b,070h		;8ee1
l8ee3h:
	or h			;8ee3
	dec e			;8ee4
	sbc a,(hl)		;8ee5
	dec b			;8ee6
	ld b,d			;8ee7
	and b			;8ee8
	add a,b			;8ee9
	rla			;8eea
	push af			;8eeb
	push de			;8eec
	or l			;8eed
	ld d,l			;8eee
	ld l,l			;8eef
	ld d,l			;8ef0
	ld e,l			;8ef1
	ld b,h			;8ef2
	ld b,b			;8ef3
	jr nc,l8f26h		;8ef4
	ld (004ach),hl		;8ef6
	ld de,00812h		;8ef9
	add a,b			;8efc
	rrca			;8efd
	jr c,l8f03h		;8efe
l8f00h:
	nop			;8f00
	ld d,l			;8f01
	ret nz			;8f02
l8f03h:
	nop			;8f03
	ld h,b			;8f04
	djnz $+3		;8f05
	ld c,00fh		;8f07
	ld a,(bc)		;8f09
	adc a,h			;8f0a
	inc e			;8f0b
	nop			;8f0c
	nop			;8f0d
	nop			;8f0e
	inc c			;8f0f
	jr nc,l8f12h		;8f10
l8f12h:
	adc a,d			;8f12
	jr c,l8eb7h		;8f13
	add a,b			;8f15
	add a,l			;8f16
	ld (bc),a		;8f17
	nop			;8f18
	rst 28h			;8f19
	cp e			;8f1a
	ret m			;8f1b
	nop			;8f1c
	nop			;8f1d
	ret			;8f1e
	ld b,01fh		;8f1f
	dec sp			;8f21
	call pe,sub_ab00h	;8f22
	adc a,l			;8f25
l8f26h:
	ret nz			;8f26
	dec hl			;8f27
	dec c			;8f28
	add a,(hl)		;8f29
	add a,d			;8f2a
	nop			;8f2b
	add hl,bc		;8f2c
	adc a,c			;8f2d
	ld d,a			;8f2e
	adc a,(hl)		;8f2f
	inc e			;8f30
	nop			;8f31
	ex af,af'		;8f32
	ld c,a			;8f33
	ld sp,hl		;8f34
	add a,d			;8f35
	ld a,(de)		;8f36
	add hl,hl		;8f37
	jr nz,$+1		;8f38
	add a,a			;8f3a
	cp 0a6h			;8f3b
	ret			;8f3d
	jr l8f48h		;8f3e
	djnz l8f53h		;8f40
	ld b,l			;8f42
	ld c,002h		;8f43
	add hl,hl		;8f45
	add a,b			;8f46
	inc b			;8f47
l8f48h:
	ccf			;8f48
	ret po			;8f49
	ld bc,le8aah		;8f4a
	jp m,lbcaah		;8f4d
	ld c,a			;8f50
	inc e			;8f51
	ld b,b			;8f52
l8f53h:
	nop			;8f53
	djnz l8f66h		;8f54
	ld a,h			;8f56
	nop			;8f57
	inc e			;8f58
	jr nz,l8ee3h		;8f59
l8f5bh:
	jr nz,l8f00h		;8f5b
	adc a,b			;8f5d
	nop			;8f5e
	ld d,04eh		;8f5f
	ld b,b			;8f61
	inc d			;8f62
sub_8f63h:
	ld b,e			;8f63
	ret p			;8f64
	ld d,l			;8f65
l8f66h:
	ld a,b			;8f66
	inc a			;8f67
	dec d			;8f68
	ld b,b			;8f69
	rst 38h			;8f6a
	ld e,d			;8f6b
	ld l,d			;8f6c
	xor c			;8f6d
	sbc a,d			;8f6e
	xor d			;8f6f
	xor l			;8f70
	cp b			;8f71
	sbc a,l			;8f72
	scf			;8f73
	rst 20h			;8f74
	adc a,e			;8f75
	ld l,d			;8f76
	xor (hl)		;8f77
	rst 18h			;8f78
	xor a			;8f79
	rra			;8f7a
	adc a,a			;8f7b
	dec sp			;8f7c
	adc a,a			;8f7d
	ld b,d			;8f7e
	ld c,a			;8f7f
	jp po,l8700h		;8f80
	ret m			;8f83
	ld e,(hl)		;8f84
	add a,h			;8f85
	nop			;8f86
l8f87h:
	nop			;8f87
	ld (bc),a		;8f88
	add a,d			;8f89
	dec b			;8f8a
	and (hl)		;8f8b
	or d			;8f8c
	or (hl)			;8f8d
	xor a			;8f8e
	xor d			;8f8f
	xor e			;8f90
	in a,(008h)		;8f91
	jp pe,laebfh		;8f93
	ld e,(hl)		;8f96
	xor c			;8f97
	xor l			;8f98
	ld b,e			;8f99
	ld a,h			;8f9a
	or e			;8f9b
	ld e,b			;8f9c
	ld a,(bc)		;8f9d
	inc bc			;8f9e
	ld d,h			;8f9f
l8fa0h:
	nop			;8fa0
	ld (bc),a		;8fa1
	nop			;8fa2
	ex af,af'		;8fa3
	or e			;8fa4
	ld a,b			;8fa5
	ld d,d			;8fa6
	ld h,(hl)		;8fa7
	sub h			;8fa8
	ld b,b			;8fa9
	dec b			;8faa
	ex de,hl		;8fab
	xor d			;8fac
	xor (hl)		;8fad
	xor d			;8fae
	jp z,0f7aah		;8faf
	ld e,(hl)		;8fb2
	xor e			;8fb3
	ld a,a			;8fb4
	adc a,l			;8fb5
	ld e,03fh		;8fb6
	defb 0fdh,042h,063h ;illegal sequence	;8fb8
	ld b,d			;8fbb
	ld e,d			;8fbc
	ld e,d			;8fbd
	ld b,d			;8fbe
	xor d			;8fbf
l8fc0h:
	ld b,02ah		;8fc0
	ld b,c			;8fc2
	ld e,b			;8fc3
	scf			;8fc4
	ld a,h			;8fc5
	cp 000h			;8fc6
	ld a,a			;8fc8
	rst 0			;8fc9
	rst 38h			;8fca
	jp m,lcaeah		;8fcb
	xor d			;8fce
	xor d			;8fcf
	xor d			;8fd0
	cp e			;8fd1
	ccf			;8fd2
	ccf			;8fd3
	rst 18h			;8fd4
	adc a,e			;8fd5
	defb 0fdh,055h ;ld d,iyl	;8fd6
	rst 38h			;8fd8
	ld b,d			;8fd9
	ld b,d			;8fda
	ld b,d			;8fdb
	ld b,d			;8fdc
	ld c,(hl)		;8fdd
	ld b,d			;8fde
	ld l,h			;8fdf
	ret nz			;8fe0
	add hl,de		;8fe1
	ex af,af'		;8fe2
l8fe3h:
	ld l,e			;8fe3
	dec c			;8fe4
	ld h,l			;8fe5
	inc bc			;8fe6
	inc h			;8fe7
	ret nz			;8fe8
	add a,b			;8fe9
	ld (hl),a		;8fea
	push af			;8feb
	xor d			;8fec
	cp d			;8fed
	xor d			;8fee
	cp d			;8fef
	xor d			;8ff0
	xor l			;8ff1
	sbc a,d			;8ff2
	ld c,h			;8ff3
	ld l,b			;8ff4
	jr c,l9048h		;8ff5
	ld a,b			;8ff7
	ld (bc),a		;8ff8
	add hl,bc		;8ff9
	ld (de),a		;8ffa
	ld de,00120h		;8ffb
	adc a,h			;8ffe
	inc bc			;8fff
	nop			;9000
	ld e,a			;9001
	ld b,b			;9002
	nop			;9003
	ld (hl),b		;9004
	inc c			;9005
	ld (bc),a		;9006
	inc a			;9007
	nop			;9008
	dec b			;9009
	ld b,b			;900a
	inc e			;900b
	nop			;900c
	nop			;900d
	nop			;900e
	inc e			;900f
	jr nc,l9012h		;9010
l9012h:
	adc a,d			;9012
	jr z,$-92		;9013
	ld b,b			;9015
	add a,e			;9016
	ld (bc),a		;9017
	nop			;9018
	dec de			;9019
	rst 38h			;901a
	ret po			;901b
	nop			;901c
	ld bc,00483h		;901d
	ld d,00fh		;9020
	sub (hl)		;9022
	nop			;9023
	xor e			;9024
	add a,e			;9025
	ret nz			;9026
	add hl,bc		;9027
	add a,l			;9028
	inc c			;9029
	sbc a,b			;902a
	jr l9045h		;902b
	jr $+31			;902d
	or a			;902f
	inc e			;9030
	djnz l90a8h		;9031
	add a,h			;9033
	add a,h			;9034
	add a,(hl)		;9035
	inc c			;9036
	ld e,c			;9037
	and b			;9038
	inc de			;9039
	ld d,e			;903a
	ld sp,054d2h		;903b
	or a			;903e
	inc e			;903f
	add hl,sp		;9040
	ld bc,00e03h		;9041
	nop			;9044
l9045h:
	ld d,l			;9045
	add a,b			;9046
	nop			;9047
l9048h:
	dec l			;9048
	and d			;9049
	ld de,05d95h		;904a
	dec d			;904d
	ld d,l			;904e
	ld d,a			;904f
	jp 0303ch		;9050
	nop			;9053
	ld h,b			;9054
	rlca			;9055
	nop			;9056
	nop			;9057
	ld a,(bc)		;9058
	xor (hl)		;9059
	inc bc			;905a
	and h			;905b
	inc h			;905c
	ld l,b			;905d
	nop			;905e
	inc l			;905f
	ld a,d			;9060
	ccf			;9061
	ret pe			;9062
	ld b,e			;9063
	ld (hl),b		;9064
	ld h,h			;9065
	add a,a			;9066
	rst 10h			;9067
	ex de,hl		;9068
	sbc a,000h		;9069
	ld e,l			;906b
	or l			;906c
	ld e,c			;906d
	cp l			;906e
	ld d,l			;906f
	ld d,l			;9070
	cp b			;9071
	xor 09dh		;9072
	rst 8			;9074
	adc a,c			;9075
	xor l			;9076
	ld d,l			;9077
	ld h,a			;9078
	xor a			;9079
	sbc a,a			;907a
	sbc a,a			;907b
	ld h,b			;907c
	add hl,bc		;907d
	and (hl)		;907e
	cpl			;907f
	sbc a,000h		;9080
	cp c			;9082
	rst 38h			;9083
	adc a,(hl)		;9084
	or h			;9085
	nop			;9086
	ld b,d			;9087
	ld bc,lfbcdh		;9088
	rst 10h			;908b
	ld e,a			;908c
	ld d,a			;908d
	ld d,l			;908e
	push de			;908f
	ld d,l			;9090
	ld e,c			;9091
	pop de			;9092
	ld e,d			;9093
	cp a			;9094
	adc a,a			;9095
	dec d			;9096
	ld e,b			;9097
	sub 041h		;9098
	add a,a			;909a
	pop bc			;909b
	xor b			;909c
	dec bc			;909d
	add a,l			;909e
	ld d,h			;909f
	nop			;90a0
	ld b,000h		;90a1
	dec b			;90a3
	cp (hl)			;90a4
	ret m			;90a5
	inc a			;90a6
	nop			;90a7
l90a8h:
	ld a,b			;90a8
	ld b,a			;90a9
	sbc a,a			;90aa
	jp (hl)			;90ab
	push de			;90ac
	ld l,l			;90ad
	ld d,l			;90ae
	ld a,l			;90af
	ld d,l			;90b0
	ld b,a			;90b1
	dec hl			;90b2
	ld d,l			;90b3
	rst 38h			;90b4
	xor l			;90b5
	ccf			;90b6
	ccf			;90b7
	ex de,hl		;90b8
l90b9h:
	and c			;90b9
	pop hl			;90ba
	add a,e			;90bb
	sub a			;90bc
l90bdh:
	add a,a			;90bd
	add a,c			;90be
	push de			;90bf
	inc bc			;90c0
	call m,0f03fh		;90c1
	ld d,a			;90c4
	ld a,h			;90c5
	ld bc,080e7h		;90c6
	ld c,a			;90c9
	rst 38h			;90ca
	jp m,04d75h		;90cb
	ld d,l			;90ce
	ld l,l			;90cf
	ld d,l			;90d0
	ld e,e			;90d1
	inc e			;90d2
	ccf			;90d3
	sbc a,a			;90d4
	xor e			;90d5
	rst 38h			;90d6
	rst 28h			;90d7
	ei			;90d8
	add a,c			;90d9
	sub l			;90da
	add a,c			;90db
	add a,c			;90dc
	add a,e			;90dd
	add a,c			;90de
	sub l			;90df
	jr nz,l9144h		;90e0
	sub h			;90e2
	xor l			;90e3
	dec d			;90e4
	ld a,b			;90e5
	add a,b			;90e6
	jp 00001h		;90e7
	adc a,a			;90ea
	jp (hl)			;90eb
	push de			;90ec
	ld (hl),l		;90ed
	ld d,l			;90ee
	ld a,l			;90ef
	ld d,l			;90f0
	ld d,(hl)		;90f1
	ld a,c			;90f2
	ld a,b			;90f3
	call m,04c38h		;90f4
	ret nz			;90f7
	ld bc,01289h		;90f8
	ld (000c0h),hl		;90fb
	call nc,00103h		;90fe
	ld l,d			;9101
	ld b,b			;9102
	nop			;9103
	jr nc,l9114h		;9104
	inc b			;9106
	ld b,l			;9107
	ret m			;9108
	dec de			;9109
	ld (hl),b		;910a
	inc e			;910b
	nop			;910c
	nop			;910d
	nop			;910e
	inc e			;910f
	jr nc,l9112h		;9110
l9112h:
	xor d			;9112
	xor b			;9113
l9114h:
	and e			;9114
	ld b,b			;9115
	push af			;9116
	add a,e			;9117
	nop			;9118
	ld a,l			;9119
	rst 38h			;911a
	rst 38h			;911b
	add a,b			;911c
	inc bc			;911d
	ld h,d			;911e
	nop			;911f
	inc c			;9120
	nop			;9121
	ld hl,(laa08h)		;9122
	add a,e			;9125
	jp nz,l8084h		;9126
	add hl,bc		;9129
	inc bc			;912a
	inc bc			;912b
	inc bc			;912c
	ei			;912d
	inc bc			;912e
	rst 8			;912f
	inc c			;9130
	djnz l90b9h		;9131
	inc bc			;9133
	ld l,b			;9134
	adc a,(hl)		;9135
	ld b,033h		;9136
	ld a,c			;9138
	ld (hl),0adh		;9139
	cp e			;913b
	ld d,0cch		;913c
	ld h,b			;913e
	sbc a,029h		;913f
	ld bc,00609h		;9141
l9144h:
	nop			;9144
	ld b,l			;9145
	ret nz			;9146
	ld (bc),a		;9147
	ld b,b			;9148
	djnz l914ch		;9149
	ld h,(hl)		;914b
l914ch:
	xor e			;914c
	ld l,0aah		;914d
	xor d			;914f
	or a			;9150
	inc (hl)		;9151
	ld a,(0a0fdh)		;9152
	ld h,0fch		;9155
	nop			;9157
	ex af,af'		;9158
	ld h,003h		;9159
	jr nz,l9196h		;915b
	call p,02c44h		;915d
	ld c,000h		;9160
	djnz l91abh		;9162
	ld (hl),b		;9164
	ld (laafah),hl		;9165
	cp (hl)			;9168
	ld hl,05bffh		;9169
	ld hl,(lcaa9h)		;916c
	xor d			;916f
	xor h			;9170
	cp h			;9171
	ex (sp),hl		;9172
	cp a			;9173
	sbc a,a			;9174
	adc a,h			;9175
	xor d			;9176
	xor d			;9177
	cp e			;9178
	xor a			;9179
	rst 18h			;917a
	sbc a,(hl)		;917b
	ld l,a			;917c
	ret po			;917d
	cp (hl)			;917e
	ld l,03eh		;917f
l9181h:
	ld b,b			;9181
	ld a,(hl)		;9182
	rra			;9183
	xor a			;9184
	ld (hl),h		;9185
	nop			;9186
	inc h			;9187
	nop			;9188
	add a,d			;9189
	inc bc			;918a
	sub 0a9h		;918b
	or (hl)			;918d
	xor d			;918e
	ld l,d			;918f
	xor e			;9190
	dec l			;9191
	ld (ldfeah),a		;9192
	adc a,l			;9195
l9196h:
	ld l,d			;9196
	xor a			;9197
	jp m,l8141h		;9198
	pop bc			;919b
	call c,sub_e910h	;919c
	ld d,h			;919f
	nop			;91a0
	inc bc			;91a1
	nop			;91a2
	inc b			;91a3
	sbc a,0f8h		;91a4
	nop			;91a6
	nop			;91a7
	nop			;91a8
	ld b,b			;91a9
	rrca			;91aa
l91abh:
	push af			;91ab
	xor d			;91ac
	and (hl)		;91ad
	xor d			;91ae
	xor d			;91af
	xor d			;91b0
	rst 10h			;91b1
	dec d			;91b2
	xor e			;91b3
	rst 38h			;91b4
	xor d			;91b5
	ld a,a			;91b6
	rst 38h			;91b7
	push de			;91b8
	add a,c			;91b9
	pop bc			;91ba
	jp l8189h		;91bb
	add a,c			;91be
	xor l			;91bf
	djnz l91c2h		;91c0
l91c2h:
	nop			;91c2
	ld d,b			;91c3
	jr nc,l9242h		;91c4
	nop			;91c6
	nop			;91c7
	nop			;91c8
	rst 0			;91c9
	rst 38h			;91ca
	defb 0fdh,06ah ;ld iyl,d	;91cb
	jp z,lbaaah		;91cd
	xor d			;91d0
	cp e			;91d1
	nop			;91d2
	ld a,01fh		;91d3
	adc a,e			;91d5
	pop af			;91d6
	adc a,a			;91d7
	call sub_8981h		;91d8
	add a,c			;91db
	add a,c			;91dc
	add a,l			;91dd
	pop bc			;91de
	adc a,l			;91df
	ret c			;91e0
	add a,c			;91e1
	adc a,h			;91e2
	ld l,l			;91e3
	adc a,h			;91e4
	ld b,(hl)		;91e5
	ld b,c			;91e6
	nop			;91e7
	add a,d			;91e8
	nop			;91e9
	rrca			;91ea
	ex de,hl		;91eb
	xor d			;91ec
	ld l,d			;91ed
	xor d			;91ee
	cp d			;91ef
	xor d			;91f0
	xor (hl)		;91f1
	rst 18h			;91f2
	or c			;91f3
	sub (hl)		;91f4
	jr l9181h		;91f5
	add a,b			;91f7
	add hl,bc		;91f8
	ld h,h			;91f9
	or d			;91fa
	ld c,a			;91fb
	ld b,b			;91fc
	nop			;91fd
	ld h,(hl)		;91fe
	rlca			;91ff
	ld bc,040abh		;9200
	nop			;9203
	jr $+8			;9204
	nop			;9206
	adc a,c			;9207
	cp h			;9208
	ld a,l			;9209
	sub b			;920a
	jr l920dh		;920b
l920dh:
	nop			;920d
	nop			;920e
	jr l9249h		;920f
	nop			;9211
	ld c,d			;9212
	ld e,d			;9213
	xor e			;9214
	ld b,b			;9215
	ld c,(hl)		;9216
	jp lfe83h		;9217
	cp 0f5h			;921a
	ld h,b			;921c
	ld c,012h		;921d
	djnz l9249h		;921f
	rlca			;9221
	inc bc			;9222
	jr l927ah		;9223
	inc bc			;9225
	defb 0fdh,07ch ;ld a,iyh	;9226
	nop			;9228
	ld b,c			;9229
	rst 38h			;922a
	rst 38h			;922b
	rst 38h			;922c
	rlca			;922d
	or 00fh			;922e
	ld b,020h		;9230
	cp h			;9232
	ld c,c			;9233
	push bc			;9234
	rrca			;9235
	inc bc			;9236
	push de			;9237
sub_9238h:
	sbc a,c			;9238
	dec e			;9239
	ld d,(hl)		;923a
	pop af			;923b
	ld hl,(lc054h)		;923c
	ld e,(hl)		;923f
	inc a			;9240
	add a,c			;9241
l9242h:
	inc de			;9242
	rlca			;9243
	add a,b			;9244
	ld d,l			;9245
	ret nz			;9246
	nop			;9247
	ccf			;9248
l9249h:
	call po,07f01h		;9249
	ld d,l			;924c
	xor 0d5h		;924d
	ld d,l			;924f
	ld d,e			;9250
	inc (hl)		;9251
	add hl,sp		;9252
l9253h:
	sub (hl)		;9253
	or b			;9254
	inc hl			;9255
	rlca			;9256
	add a,b			;9257
	inc c			;9258
	or d			;9259
	ld (bc),a		;925a
	ld (l7426h),hl		;925b
	ld b,h			;925e
	inc l			;925f
	ld l,l			;9260
	rlca			;9261
	djnz l9253h		;9262
	ld a,b			;9264
	ld (05585h),a		;9265
	ld d,h			;9268
	ld c,(hl)		;9269
	ld a,h			;926a
	ld c,l			;926b
	sub l			;926c
	ld e,l			;926d
	ld d,l			;926e
	ld d,l			;926f
	ld d,h			;9270
	cp h			;9271
	call p,03f15h		;9272
	adc a,d			;9275
	xor l			;9276
	ld d,l			;9277
	ld c,l			;9278
	or a			;9279
l927ah:
	rst 18h			;927a
	cp h			;927b
	jp po,l9ca0h		;927c
	ld hl,020dfh		;927f
	ld a,c			;9282
	rst 20h			;9283
	rst 10h			;9284
	call p,02400h		;9285
	nop			;9288
	rst 0			;9289
	defb 0fdh,0d7h,054h ;illegal sequence	;928a
	rst 10h			;928d
	ld d,(hl)		;928e
	dec (hl)		;928f
	ld d,l			;9290
	dec l			;9291
l9292h:
	ld bc,ldfdah		;9292
	adc a,d			;9295
	ld a,l			;9296
	ld a,a			;9297
	jp p,04a43h		;9298
	ld b,e			;929b
	ld l,(hl)		;929c
	rrca			;929d
	call m,sub_c0a9h	;929e
	dec b			;92a1
	nop			;92a2
	dec c			;92a3
	ld e,(hl)		;92a4
	ld sp,hl		;92a5
	cp 000h			;92a6
	ld a,a			;92a8
	ld b,e			;92a9
	sbc a,a			;92aa
	push af			;92ab
	push de			;92ac
	ld h,l			;92ad
	ld d,l			;92ae
	ld l,l			;92af
	ld d,l			;92b0
	ld d,a			;92b1
	ld (bc),a		;92b2
	rst 10h			;92b3
	rst 38h			;92b4
	adc a,e			;92b5
	ld a,a			;92b6
	rst 38h			;92b7
	xor d			;92b8
	ld b,d			;92b9
	ex (sp),hl		;92ba
	jp 042c6h		;92bb
	ld b,d			;92be
	ld d,l			;92bf
	inc c			;92c0
	ld bc,02800h		;92c1
	ld d,e			;92c4
	cp 000h			;92c5
	inc h			;92c7
	nop			;92c8
	adc a,a			;92c9
	rst 38h			;92ca
	ld (iy+04dh),l		;92cb
	ld d,l			;92ce
	ld l,l			;92cf
	ld d,l			;92d0
	ld d,l			;92d1
	add a,b			;92d2
	inc a			;92d3
	rra			;92d4
	adc a,e			;92d5
	jp m,lce4fh		;92d6
	jp nz,0425ah		;92d9
	ld b,d			;92dc
	ld b,d			;92dd
	and d			;92de
	ld b,l			;92df
	push de			;92e0
	ld (bc),a		;92e1
	sub h			;92e2
	xor (hl)		;92e3
	add a,h			;92e4
	ld b,d			;92e5
	ld hl,l8466h		;92e6
	nop			;92e9
	rra			;92ea
	di			;92eb
	ld d,h			;92ec
	push de			;92ed
	ld d,l			;92ee
	ld l,l			;92ef
	ld d,l			;92f0
	ld d,(hl)		;92f1
	ld b,07bh		;92f2
	rst 18h			;92f4
	xor e			;92f5
	call m,0fd2ah		;92f6
	ld h,h			;92f9
	inc l			;92fa
	inc h			;92fb
	inc h			;92fc
	dec h			;92fd
l92feh:
	ld h,h			;92fe
	dec l			;92ff
	pop de			;9300
	dec h			;9301
	add hl,hl		;9302
	ld e,l			;9303
	adc a,d			;9304
	ld d,e			;9305
	ld d,c			;9306
	inc h			;9307
	adc a,d			;9308
	ret po			;9309
	ld a,a			;930a
	di			;930b
	xor c			;930c
	xor d			;930d
	xor d			;930e
	cp d			;930f
	xor d			;9310
	xor d			;9311
	call po,00700h		;9312
	xor e			;9315
	rst 38h			;9316
	inc h			;9317
	ld e,d			;9318
	call m,000feh		;9319
	defb 0fdh,02fh,0fch ;illegal sequence	;931c
	add hl,sp		;931f
	xor d			;9320
	ld a,d			;9321
	xor h			;9322
	ld de,le7aeh+1		;9323
	ld l,d			;9326
	and l			;9327
	ld d,c			;9328
	ld c,c			;9329
	and a			;932a
	ld (hl),l		;932b
	xor d			;932c
	xor d			;932d
	xor d			;932e
	cp d			;932f
	xor d			;9330
	rst 38h			;9331
	nop			;9332
	cp a			;9333
	sub b			;9334
	ld h,b			;9335
	cp a			;9336
	inc h			;9337
	ld l,080h		;9338
	rra			;933a
	di			;933b
	sbc a,a			;933c
	rst 10h			;933d
	ex (sp),hl		;933e
	ld e,l			;933f
	rst 38h			;9340
	rst 38h			;9341
	rst 38h			;9342
l9343h:
	call m,03188h		;9343
	ld a,a			;9346
	rst 38h			;9347
	exx			;9348
	ld c,(hl)		;9349
	ld (hl),h		;934a
	jp c,lffaah		;934b
	jp m,0ffbbh		;934e
	rst 38h			;9351
	inc c			;9352
	ld h,e			;9353
	ld (de),a		;9354
	ld (hl),a		;9355
	sbc a,a			;9356
	ld a,l			;9357
	ld a,(de)		;9358
	add a,b			;9359
	rlca			;935a
	nop			;935b
	nop			;935c
	dec de			;935d
	sbc a,e			;935e
	cp e			;935f
	rst 38h			;9360
	jp nz,0fe7fh		;9361
	jp nc,05782h		;9364
	rst 18h			;9367
	jp p,05453h		;9368
	ld d,l			;936b
	ld d,e			;936c
	halt			;936d
	ld d,l			;936e
	rst 38h			;936f
	rst 38h			;9370
	rst 38h			;9371
	inc d			;9372
	ld b,h			;9373
	ld (bc),a		;9374
	nop			;9375
	dec h			;9376
	ret pe			;9377
	ld l,d			;9378
	xor h			;9379
	rrca			;937a
	add a,b			;937b
	ld bc,07febh		;937c
	ret po			;937f
	ld a,(hl)		;9380
	sub b			;9381
	ld de,00d10h		;9382
	rst 38h			;9385
	add a,d			;9386
	or b			;9387
	ld h,0bfh		;9388
	push af			;938a
	ld d,a			;938b
	ld e,(hl)		;938c
	nop			;938d
	rrca			;938e
	rst 38h			;938f
	push de			;9390
	ret p			;9391
	ld bc,0be0ch		;9392
	ld hl,(041a0h)		;9395
	xor 0dah		;9398
	cp d			;939a
	xor d			;939b
	ex de,hl		;939c
	xor (hl)		;939d
	and d			;939e
	ld sp,lf88ch		;939f
	jr nc,l9343h		;93a2
	inc bc			;93a4
	call m,sub_8400h	;93a5
	add a,d			;93a8
	inc b			;93a9
	ld bc,00267h		;93aa
	ex af,af'		;93ad
	ld e,08fh		;93ae
	ld d,(hl)		;93b0
	jr nc,$+6		;93b1
	adc a,b			;93b3
	nop			;93b4
	ld b,b			;93b5
	jr l93feh		;93b6
	jr c,$+28		;93b8
	jp pe,laaeeh		;93ba
	ret m			;93bd
	ld hl,02280h		;93be
	inc (hl)		;93c1
	ld e,a			;93c2
	call p,010abh		;93c3
	nop			;93c6
	ld a,(bc)		;93c7
	and d			;93c8
	nop			;93c9
	rrca			;93ca
	ret po			;93cb
	jr nz,l93ceh		;93cc
l93ceh:
	ld h,b			;93ce
	ld bc,00060h		;93cf
	defb 0fdh,05bh,0f0h ;illegal sequence	;93d2
	adc a,h			;93d5
	inc bc			;93d6
	add a,h			;93d7
	add a,c			;93d8
	adc a,h			;93d9
	ld h,d			;93da
	ld a,0bch		;93db
	ret po			;93dd
	ld bc,02fa0h		;93de
	sub d			;93e1
	sub d			;93e2
	ex de,hl		;93e3
	ld a,l			;93e4
	nop			;93e5
	nop			;93e6
	nop			;93e7
	xor b			;93e8
	inc bc			;93e9
	call m,sub_ff7fh	;93ea
	pop de			;93ed
	rlca			;93ee
	rst 38h			;93ef
	sbc a,b			;93f0
	inc de			;93f1
	inc c			;93f2
	ld d,b			;93f3
	ccf			;93f4
	xor e			;93f5
	ret m			;93f6
	add hl,de		;93f7
	ld a,a			;93f8
	ret m			;93f9
	jr $+26			;93fa
	jr $+29			;93fc
l93feh:
	ret m			;93fe
	dec e			;93ff
	ret pe			;9400
	ld e,058h		;9401
	xor (hl)		;9403
	add a,(hl)		;9404
	ld d,l			;9405
	ld c,b			;9406
	add a,c			;9407
	ld d,01ch		;9408
	rst 38h			;940a
	rst 20h			;940b
	ld d,e			;940c
	ld d,l			;940d
	ld d,l			;940e
	ld d,l			;940f
	ld d,l			;9410
	ld d,(hl)		;9411
	call z,04300h		;9412
	xor e			;9415
	rst 38h			;9416
	ld e,b			;9417
	ld hl,(lfffch)		;9418
	inc bc			;941b
	inc bc			;941c
l941dh:
	xor a			;941d
	ret m			;941e
	dec hl			;941f
	out (007h),a		;9420
	ld sp,hl		;9422
	or b			;9423
	push de			;9424
	ld d,c			;9425
	ld (hl),h		;9426
	ld b,d			;9427
	jr nz,l9495h		;9428
	ld a,07bh		;942a
	ld d,l			;942c
	ld d,l			;942d
	ld d,l			;942e
	ld d,l			;942f
	ld d,l			;9430
	rst 38h			;9431
	nop			;9432
	ld d,e			;9433
	rlca			;9434
	ld l,d			;9435
	ccf			;9436
	jr l9467h		;9437
	jp 0ef03h		;9439
	sbc a,(hl)		;943c
	ld b,e			;943d
	jr l941dh		;943e
	rst 38h			;9440
	rst 38h			;9441
	rst 38h			;9442
	defb 0fdh,04ah,059h ;illegal sequence	;9443
	ld a,h			;9446
	rrca			;9447
	out (0b3h),a		;9448
	or d			;944a
	sub a			;944b
	ld d,l			;944c
	rst 38h			;944d
	rst 38h			;944e
	ld d,a			;944f
	adc a,b			;9450
l9451h:
	rst 8			;9451
	ld a,c			;9452
	ld hl,02314h		;9453
	rst 28h			;9456
	ld a,l			;9457
	ld hl,(03c83h)		;9458
	nop			;945b
	rrca			;945c
	ld l,l			;945d
	ld (hl),c		;945e
	add hl,de		;945f
	rst 38h			;9460
	cp c			;9461
	adc a,a			;9462
	cp 0edh			;9463
	ld b,c			;9465
	ld d,a			;9466
l9467h:
	cp a			;9467
	defb 0edh ;next byte illegal after ed	;9468
	ld h,(hl)		;9469
	sub d			;946a
	sub e			;946b
	cp c			;946c
	sub d			;946d
	sub d			;946e
	sub e			;946f
	rst 38h			;9470
	rst 38h			;9471
	ld sp,l8613h		;9472
	ld a,a			;9475
	jp z,ld7e8h		;9476
	ld e,b			;9479
	ccf			;947a
	nop			;947b
	inc bc			;947c
	ld (hl),l		;947d
	rst 38h			;947e
	add a,b			;947f
	ld e,08ch		;9480
	ld h,c			;9482
	jr nz,$+8		;9483
	rst 38h			;9485
	rst 0			;9486
	ld b,b			;9487
	inc bc			;9488
	ld l,e			;9489
	jp m,02092h		;948a
	rrca			;948d
	pop af			;948e
	rst 38h			;948f
	out (0e0h),a		;9490
	ld b,c			;9492
	inc hl			;9493
	ret po			;9494
l9495h:
	ld h,0a0h		;9495
	ld h,e			;9497
	push de			;9498
	ld (hl),l		;9499
	ld d,l			;949a
	ld (hl),l		;949b
	ld d,(hl)		;949c
	in a,(070h)		;949d
	ret nz			;949f
	ld h,c			;94a0
	rst 38h			;94a1
	ret nz			;94a2
	ld b,c			;94a3
	nop			;94a4
	nop			;94a5
	nop			;94a6
	ld c,b			;94a7
	ld b,d			;94a8
	nop			;94a9
	ld bc,le091h		;94aa
	nop			;94ad
	cp 01eh			;94ae
	sub e			;94b0
	jr c,l94b7h		;94b1
	add a,b			;94b3
	ex af,af'		;94b4
	ld b,b			;94b5
	ex af,af'		;94b6
l94b7h:
	ld sp,hl		;94b7
	adc a,h			;94b8
	rrca			;94b9
	ld d,l			;94ba
	push de			;94bb
	ld (hl),a		;94bc
	add a,e			;94bd
l94beh:
	cpl			;94be
	add a,b			;94bf
	daa			;94c0
	ld (lf59fh),a		;94c1
	jr c,l953eh		;94c4
	nop			;94c6
	dec b			;94c7
	ld d,c			;94c8
	nop			;94c9
	ld a,a			;94ca
	add a,b			;94cb
	inc e			;94cc
	ld bc,00080h		;94cd
	cp b			;94d0
	nop			;94d1
	jp po,00723h		;94d2
	ld b,l			;94d5
	jp 00705h		;94d6
	ld h,e			;94d9
	dec de			;94da
	cp 0bbh			;94db
	jr c,l951fh		;94dd
	and b			;94df
	ld l,a			;94e0
	sub (hl)		;94e1
	jp nc,03ee8h		;94e2
	ret nc			;94e5
	nop			;94e6
	nop			;94e7
	ld e,b			;94e8
	inc bc			;94e9
	call m,sub_ff7fh	;94ea
	ld (lff07h),hl		;94ed
	xor b			;94f0
	ld sp,0403eh		;94f1
	rrca			;94f4
	adc a,e			;94f5
	call m,0bd1dh		;94f6
	call m,01828h		;94f9
	sbc a,b			;94fc
	inc hl			;94fd
	ret m			;94fe
l94ffh:
	dec e			;94ff
	ret pe			;9500
	ld bc,l6d31h		;9501
	ld b,d			;9504
	ld d,l			;9505
	ld b,b			;9506
	ld b,d			;9507
	ld a,(bc)		;9508
	inc bc			;9509
	rst 38h			;950a
	xor 0a6h		;950b
	xor d			;950d
	xor d			;950e
	cp d			;950f
	xor d			;9510
	xor d			;9511
	sbc a,e			;9512
	add a,b			;9513
	pop bc			;9514
	xor e			;9515
	rst 38h			;9516
	jr c,$+88		;9517
	cp a			;9519
	rst 38h			;951a
	ret c			;951b
	add hl,de		;951c
	rst 18h			;951d
	ret m			;951e
l951fh:
	ld e,e			;951f
	xor h			;9520
	ld l,b			;9521
	dec b			;9522
	or b			;9523
	ld l,d			;9524
	xor c			;9525
	ld (hl),d		;9526
	inc h			;9527
	ld b,b			;9528
	ld d,b			;9529
	ret nz			;952a
	halt			;952b
	xor d			;952c
	xor d			;952d
	xor d			;952e
	cp d			;952f
	xor e			;9530
	rst 38h			;9531
	nop			;9532
	inc l			;9533
	inc c			;9534
	jp p,l98ffh		;9535
	ld d,a			;9538
	ld a,b			;9539
	jr l9579h		;953a
	cp 0a4h			;953c
l953eh:
	ld a,(hl)		;953e
	cp l			;953f
l9540h:
	rst 38h			;9540
	rst 38h			;9541
	rst 38h			;9542
	defb 0fdh,0ach ;xor iyh	;9543
	ld l,c			;9545
	ld a,e			;9546
	rst 30h			;9547
	and 0dbh		;9548
	xor e			;954a
	ld a,0afh		;954b
	rst 38h			;954d
	rst 38h			;954e
	cp a			;954f
	cp d			;9550
	rst 10h			;9551
	inc b			;9552
	ld (hl),c		;9553
	and h			;9554
	dec hl			;9555
	ld b,0fdh		;9556
	ld a,(de)		;9558
	sbc a,b			;9559
	ld h,b			;955a
	nop			;955b
	ld a,014h		;955c
	pop de			;955e
	dec e			;955f
l9560h:
	rst 38h			;9560
	ld a,a			;9561
	rst 30h			;9562
	cp (hl)			;9563
	rst 30h			;9564
	jr nz,l94ffh		;9565
	ld a,c			;9567
	sbc a,l			;9568
	inc e			;9569
	ld l,d			;956a
	ld hl,(lff94h)		;956b
	jp pe,03f2ah		;956e
	rst 38h			;9571
	inc c			;9572
	ld b,(hl)		;9573
	call m,00a1fh		;9574
	ex af,af'		;9577
	ld l,d			;9578
l9579h:
	cp b			;9579
	jp pe,00280h		;957a
	in a,(07fh)		;957d
	nop			;957f
	ld c,086h		;9580
	pop hl			;9582
	ld c,(hl)		;9583
	ex de,hl		;9584
	ld a,a			;9585
	ret pe			;9586
	jr nz,l958ch		;9587
	jp p,02c7eh		;9589
l958ch:
	sbc a,001h		;958c
	add a,b			;958e
	ccf			;958f
	jp pe,041c5h		;9590
	jr nc,$+3		;9593
	ld (lb3a0h),hl		;9595
	xor 0eah		;9598
	xor d			;959a
	xor d			;959b
	ex de,hl		;959c
	xor (hl)		;959d
	rst 38h			;959e
	jr nz,l9540h		;959f
	cp 080h			;95a1
	ld b,d			;95a3
	sub b			;95a4
	nop			;95a5
	nop			;95a6
	xor c			;95a7
	inc h			;95a8
	ld (bc),a		;95a9
	ld bc,lff31h		;95aa
	pop af			;95ad
	ret p			;95ae
	ld a,02bh		;95af
	cpl			;95b1
	inc c			;95b2
	ld b,a			;95b3
	jr l95f6h		;95b4
	add hl,bc		;95b6
l95b7h:
	ret m			;95b7
	ld a,e			;95b8
	add a,c			;95b9
	rst 38h			;95ba
	xor d			;95bb
	call m,02718h		;95bc
	add a,b			;95bf
	cpl			;95c0
	xor d			;95c1
	ccf			;95c2
	push af			;95c3
	ld c,038h		;95c4
	nop			;95c6
	ld (bc),a		;95c7
	res 0,b			;95c8
	ccf			;95ca
	nop			;95cb
	nop			;95cc
	nop			;95cd
	ret m			;95ce
	rlca			;95cf
	call c,sub_e000h	;95d0
	ld bc,0a6ffh		;95d3
	ld (hl),e		;95d6
	ld (bc),a		;95d7
	inc b			;95d8
	jr l95b7h		;95d9
	rst 38h			;95db
	or 00eh			;95dc
	nop			;95de
	ret nc			;95df
	ret nz			;95e0
	sbc a,(hl)		;95e1
	jp p,047e3h		;95e2
	ld b,b			;95e5
	nop			;95e6
	nop			;95e7
	xor h			;95e8
	inc bc			;95e9
	call m,sub_ff7fh	;95ea
	and h			;95ed
	rlca			;95ee
	rst 38h			;95ef
	djnz l9632h		;95f0
	call pe,sub_cf80h	;95f2
	adc a,e			;95f5
l95f6h:
	cp 027h			;95f6
	in a,(0ffh)		;95f8
	ld e,h			;95fa
	inc h			;95fb
	ld h,067h		;95fc
	call p,sub_d82dh	;95fe
	ld (bc),a		;9601
	add a,h			;9602
	xor l			;9603
	dec b			;9604
	ld b,l			;9605
	jr nz,l9608h		;9606
l9608h:
	dec d			;9608
	ld (lc5ffh),hl		;9609
	ld c,l			;960c
	ld d,l			;960d
	ld d,l			;960e
	ld d,l			;960f
	ld d,l			;9610
	ld d,a			;9611
	dec d			;9612
	pop bc			;9613
	add a,b			;9614
	xor d			;9615
	ccf			;9616
	ld d,h			;9617
	ld (hl),09fh		;9618
	rst 38h			;961a
	ret p			;961b
	jp nz,lfcbfh		;961c
	scf			;961f
	ld (hl),e		;9620
	add hl,hl		;9621
	call p,05510h		;9622
	ld e,c			;9625
	ld (hl),l		;9626
	ld e,d			;9627
	xor b			;9628
l9629h:
	ld a,(de)		;9629
	ld a,0adh		;962a
	ld d,l			;962c
	ld d,l			;962d
	ld d,l			;962e
	ld d,l			;962f
	ld d,a			;9630
	rst 38h			;9631
l9632h:
	nop			;9632
	inc d			;9633
	ex af,af'		;9634
	ld b,0ffh		;9635
	and h			;9637
	ld c,e			;9638
	sbc a,a			;9639
	ret nz			;963a
	jp lb91fh		;963b
	defb 0fdh,0bbh,0ffh ;illegal sequence	;963e
	rst 38h			;9641
	rst 38h			;9642
	cp 0d8h			;9643
	dec d			;9645
	ld (hl),a		;9646
	ei			;9647
	push af			;9648
	xor c			;9649
	ret			;964a
	exx			;964b
	rst 18h			;964c
	rst 38h			;964d
	rst 38h			;964e
	rst 38h			;964f
	adc a,d			;9650
	rst 10h			;9651
	dec b			;9652
	djnz l9629h		;9653
	ld l,b			;9655
	ld h,l			;9656
	ld (iy-03fh),0c0h	;9657
	nop			;965b
	call m,sub_b52bh	;965c
	ld e,l			;965f
	rst 38h			;9660
	ld a,a			;9661
	ei			;9662
	rra			;9663
	ld a,b			;9664
	ret nc			;9665
	ld c,a			;9666
	ret p			;9667
	ld a,c			;9668
	ld l,e			;9669
	ld c,c			;966a
	ld c,c			;966b
	ld e,(hl)		;966c
	ret			;966d
	ld e,c			;966e
	ld e,a			;966f
	ld c,a			;9670
	rst 38h			;9671
	dec b			;9672
	ld de,l8024h		;9673
	add hl,sp		;9676
	call po,sub_79d7h	;9677
	push de			;967a
	ld h,b			;967b
	rlca			;967c
	ld a,l			;967d
	or b			;967e
	ret nz			;967f
	ld h,c			;9680
	add a,b			;9681
	ld bc,08548h		;9682
	ld a,a			;9685
	ret c			;9686
	djnz $+8		;9687
	ret po			;9689
	sbc a,l			;968a
	ex (sp),hl		;968b
	inc c			;968c
	ld bc,01f80h		;968d
	ret			;9690
	adc a,l			;9691
	ld b,b			;9692
	sbc a,h			;9693
	rrca			;9694
	ld hl,l8fa0h		;9695
	push de			;9698
	ld (hl),l		;9699
	ld (hl),l		;969a
	ld (hl),l		;969b
	ld d,l			;969c
	rst 10h			;969d
	cp 04eh			;969e
	ld c,a			;96a0
	defb 0fdh,07ch ;ld a,iyh	;96a1
	inc hl			;96a3
	add a,b			;96a4
	nop			;96a5
	nop			;96a6
	ld d,d			;96a7
	jr $+4			;96a8
	ld bc,lfbc9h		;96aa
	rst 38h			;96ad
	ret po			;96ae
	defb 0fdh,049h,02fh ;illegal sequence	;96af
	ex af,af'		;96b2
	ld c,d			;96b3
	or h			;96b4
	ret nz			;96b5
	dec bc			;96b6
	or 018h			;96b7
	ret nz			;96b9
	ret nz			;96ba
	rst 38h			;96bb
	ret nc			;96bc
	jp 040e7h		;96bd
	ld c,a			;96c0
	cpl			;96c1
l96c2h:
	rst 8			;96c2
	push af			;96c3
	defb 0ddh,084h ;add a,ixh	;96c4
	nop			;96c6
	ld bc,l8047h		;96c7
	rst 38h			;96ca
	nop			;96cb
	nop			;96cc
	ld bc,00f28h		;96cd
	call pe,sub_bfffh+1	;96d0
	ld bc,0127fh		;96d3
	ex af,af'		;96d6
	nop			;96d7
	inc b			;96d8
	add a,031h		;96d9
	sbc a,a			;96db
	rst 30h			;96dc
	add a,e			;96dd
	ret po			;96de
	ld d,c			;96df
	ld c,d			;96e0
	adc a,h			;96e1
	ld h,d			;96e2
	ex de,hl		;96e3
	ld e,b			;96e4
	or b			;96e5
	nop			;96e6
	nop			;96e7
	ld d,h			;96e8
	rlca			;96e9
	cp 07fh			;96ea
	jp 00fa8h		;96ec
	cp 020h			;96ef
	ld a,0e8h		;96f1
	add a,c			;96f3
	adc a,a			;96f4
	xor e			;96f5
	cp 043h			;96f6
	ld a,a			;96f8
	ccf			;96f9
	xor 042h		;96fa
	ld b,c			;96fc
	sbc a,a			;96fd
	jp p,0a855h		;96fe
l9701h:
	dec (hl)		;9701
	sub l			;9702
	halt			;9703
	add a,e			;9704
	ld b,c			;9705
	jr nz,l9708h		;9706
l9708h:
	inc l			;9708
	inc bc			;9709
	ld a,a			;970a
	adc a,09ah		;970b
	xor d			;970d
	xor d			;970e
	cp d			;970f
	xor d			;9710
	xor e			;9711
	ld (bc),a		;9712
	ret			;9713
	ret nc			;9714
	ret c			;9715
	cp a			;9716
	ld l,d			;9717
	ld d,(hl)		;9718
	rst 0			;9719
	ld sp,hl		;971a
	rst 38h			;971b
	dec b			;971c
	adc a,a			;971d
	jp p,0fc56h		;971e
	ret z			;9721
	call po,sub_6ae8h	;9722
	xor c			;9725
	ld l,a			;9726
l9727h:
	rst 38h			;9727
	call p,sub_eb15h	;9728
	ld e,d			;972b
	xor d			;972c
	xor d			;972d
	xor d			;972e
	cp d			;972f
	cp a			;9730
	rst 38h			;9731
	nop			;9732
	inc c			;9733
	ex af,af'		;9734
	inc b			;9735
	rst 38h			;9736
	jp nz,la05bh		;9737
	sub b			;973a
	ld b,007h		;973b
	rst 20h			;973d
	di			;973e
	dec de			;973f
	rst 38h			;9740
	rst 38h			;9741
	rst 38h			;9742
	cp 0d1h			;9743
	jp pe,03b76h		;9745
	pop af			;9748
	ld l,02ah		;9749
	ld l,(hl)		;974b
	cp a			;974c
	ex de,hl		;974d
	rst 38h			;974e
	rst 38h			;974f
	ret pe			;9750
	rst 10h			;9751
	inc b			;9752
	ld d,b			;9753
	adc a,0c8h		;9754
	call 055fah		;9756
	jp 00300h		;9759
	call m,07156h		;975c
	dec e			;975f
	cp (hl)			;9760
	ld a,b			;9761
	dec a			;9762
	rra			;9763
	ld a,a			;9764
	ret pe			;9765
	daa			;9766
	ret po			;9767
	ret m			;9768
	or 02ah			;9769
	dec hl			;976b
	ld d,(hl)		;976c
	ld l,d			;976d
	ld hl,(0abffh)		;976e
	rst 38h			;9771
	inc b			;9772
	ld b,l			;9773
	ld b,b			;9774
	ret nz			;9775
	jr nc,$+30		;9776
	ld l,d			;9778
	rst 18h			;9779
	cp d			;977a
	cp a			;977b
	defb 0fdh,0bah,0e6h ;illegal sequence	;977c
	ld sp,l8a8ch		;977f
l9782h:
	sub c			;9782
	add a,b			;9783
	ld (bc),a		;9784
	cp a			;9785
	sbc a,b			;9786
	ex af,af'		;9787
	add hl,bc		;9788
	ret nz			;9789
	sbc a,(hl)		;978a
	inc a			;978b
	inc c			;978c
	and a			;978d
	ret m			;978e
	ld a,a			;978f
	ex de,hl		;9790
	dec c			;9791
	pop bc			;9792
	ld b,018h		;9793
	djnz l9727h		;9795
	rra			;9797
	adc a,(hl)		;9798
	xor d			;9799
	xor d			;979a
	xor d			;979b
	ex de,hl		;979c
	ld l,e			;979d
	rst 38h			;979e
	ld d,c			;979f
	ld e,a			;97a0
	jp m,0132eh		;97a1
	add a,b			;97a4
	nop			;97a5
	nop			;97a6
	ld hl,(00068h)		;97a7
	inc bc			;97aa
	xor h			;97ab
	ccf			;97ac
	pop af			;97ad
	add a,c			;97ae
	ld a,02bh		;97af
	rra			;97b1
	djnz l97e0h		;97b2
	call pe,007a0h		;97b4
	di			;97b7
	add a,(hl)		;97b8
	jr nc,l97bbh		;97b9
l97bbh:
	ld b,b			;97bb
	ex af,af'		;97bc
	ld c,027h		;97bd
	add a,b			;97bf
	rrca			;97c0
	ld e,b			;97c1
	scf			;97c2
	call po,sub_98c0h	;97c3
	nop			;97c6
	nop			;97c7
	and e			;97c8
	ld bc,01efeh		;97c9
	nop			;97cc
	ld b,0d0h		;97cd
	ccf			;97cf
sub_97d0h:
	call p,sub_c778h	;97d0
	pop af			;97d3
	ld a,h			;97d4
	ret m			;97d5
	inc b			;97d6
	nop			;97d7
	inc c			;97d8
	ld bc,l678ch		;97d9
	ret pe			;97dc
	ret po			;97dd
	nop			;97de
	ld d,b			;97df
l97e0h:
	ret nz			;97e0
	add a,b			;97e1
	add a,d			;97e2
	ex (sp),hl		;97e3
	add hl,de		;97e4
	cp (hl)			;97e5
	nop			;97e6
	nop			;97e7
	xor d			;97e8
	rlca			;97e9
	rst 38h			;97ea
	ccf			;97eb
	jp nz,01fd0h		;97ec
	cp 040h			;97ef
	inc bc			;97f1
	jp (hl)			;97f2
	add a,e			;97f3
	rrca			;97f4
	xor e			;97f5
	rst 38h			;97f6
	add a,c			;97f7
	xor a			;97f8
	ccf			;97f9
	rst 10h			;97fa
	add a,c			;97fb
	jp p,lf14fh		;97fc
	adc a,l			;97ff
	and h			;9800
	rra			;9801
	ld hl,(041abh)		;9802
	ld e,l			;9805
	ld e,a			;9806
	add a,c			;9807
	jp m,0bf49h		;9808
	adc a,l			;980b
	or l			;980c
	ld d,l			;980d
	ld d,l			;980e
	ld d,l			;980f
	ld d,l			;9810
	ld d,l			;9811
	ld bc,lcf43h		;9812
	rst 38h			;9815
	ccf			;9816
	sub c			;9817
	or a			;9818
	ld a,a			;9819
	ld sp,hl		;981a
	rst 38h			;981b
	jp c,le1ffh		;981c
	or (hl)			;981f
	rst 38h			;9820
	ld a,00fh		;9821
	inc d			;9823
	dec a			;9824
	ld e,c			;9825
	ld (hl),h		;9826
	nop			;9827
	inc h			;9828
	and l			;9829
	cp b			;982a
	or l			;982b
	ld d,l			;982c
	ld d,l			;982d
	ld d,l			;982e
	ld d,l			;982f
	ld a,a			;9830
	rst 38h			;9831
	nop			;9832
	ld d,00ch		;9833
	dec b			;9835
	rst 38h			;9836
	pop hl			;9837
	ex de,hl		;9838
	cp b			;9839
	jr $+30			;983a
l983ch:
	inc bc			;983c
	sbc a,a			;983d
	rst 28h			;983e
	ex de,hl		;983f
	rst 38h			;9840
	rst 38h			;9841
	rst 38h			;9842
	cp 0d3h			;9843
	ld d,076h		;9845
	call c,0367eh		;9847
	xor b			;984a
	defb 0edh ;next byte illegal after ed	;984b
	cp a			;984c
	xor b			;984d
	cp a			;984e
	rst 38h			;984f
	adc a,d			;9850
	call 0180dh		;9851
	ld b,c			;9854
	xor c			;9855
	sbc a,l			;9856
	jp m,0fe39h		;9857
	nop			;985a
	rlca			;985b
	ret p			;985c
	cpl			;985d
	ei			;985e
	cp (hl)			;985f
	inc e			;9860
l9861h:
	ret po			;9861
	ld c,08fh		;9862
	rra			;9864
	call p,00110h		;9865
	ld (hl),e		;9868
	ret po			;9869
	cp b			;986a
	xor (hl)		;986b
	sub e			;986c
	ld a,a			;986d
	rst 28h			;986e
	rst 38h			;986f
	ex de,hl		;9870
	rst 38h			;9871
	dec b			;9872
	ld de,l7e48h		;9873
	jr nz,l987eh		;9876
	rst 10h			;9878
	ld (hl),l		;9879
	ld d,l			;987a
	ld (hl),l		;987b
	ld d,a			;987c
	ld l,l			;987d
l987eh:
	ld l,l			;987e
	add a,b			;987f
	ld (hl),0c4h		;9880
	inc de			;9882
	add a,b			;9883
	dec b			;9884
	cp a			;9885
	ld (hl),b		;9886
	inc h			;9887
	nop			;9888
	ld b,d			;9889
	ld c,0a0h		;988a
	ld a,0a3h		;988c
	ret po			;988e
	adc a,a			;988f
	xor (hl)		;9890
	dec c			;9891
	add a,c			;9892
	rra			;9893
	ld a,010h		;9894
	ld d,b			;9896
	sbc a,e			;9897
	dec b			;9898
	ld (hl),l		;9899
	ld (hl),l		;989a
	ld (hl),l		;989b
	ld d,l			;989c
	sub 07dh		;989d
	ld d,c			;989f
	ld c,a			;98a0
	ret pe			;98a1
	xor e			;98a2
	ld a,031h		;98a3
	nop			;98a5
	nop			;98a6
	inc d			;98a7
	sub h			;98a8
	nop			;98a9
	rlca			;98aa
	jp pe,0831fh		;98ab
	ld b,0abh		;98ae
	xor (hl)		;98b0
	nop			;98b1
	jr nz,l98d4h		;98b2
	ld bc,007a0h		;98b4
	jp po,l9861h		;98b7
	jr l983ch		;98ba
	ex af,af'		;98bc
	jr l98e2h		;98bd
	add a,b			;98bf
sub_98c0h:
	ld e,062h		;98c0
	adc a,e			;98c2
	jp pe,05010h		;98c3
	nop			;98c6
	ld bc,00160h		;98c7
	call m,sub_803fh	;98ca
	add hl,de		;98cd
	jr nz,l994fh		;98ce
	call pe,sub_c98ch	;98d0
	ld c,c			;98d3
l98d4h:
	ld a,e			;98d4
	adc a,b			;98d5
	ld (bc),a		;98d6
	nop			;98d7
	ex af,af'		;98d8
	jr l993eh		;98d9
	dec de			;98db
	rrca			;98dc
	ld a,000h		;98dd
	ld c,c			;98df
	ld c,d			;98e0
	ld d,l			;98e1
l98e2h:
	ld d,l			;98e2
	rst 38h			;98e3
	ld e,c			;98e4
	cp a			;98e5
	ret nz			;98e6
	ld bc,00f56h		;98e7
	rst 38h			;98ea
	add a,e			;98eb
	adc a,d			;98ec
	ret po			;98ed
	rra			;98ee
	ret p			;98ef
	add a,b			;98f0
	ld bc,005f3h		;98f1
	rlca			;98f4
	xor e			;98f5
	rst 38h			;98f6
	add a,c			;98f7
	rst 10h			;98f8
	rst 38h			;98f9
	ret po			;98fa
	ld b,c			;98fb
	adc a,h			;98fc
	cpl			;98fd
l98feh:
	pop af			;98fe
l98ffh:
	sub l			;98ff
	and a			;9900
	nop			;9901
	push af			;9902
	ld d,l			;9903
	ld b,b			;9904
	sub a			;9905
	ld c,d			;9906
	ld a,(hl)		;9907
	ld d,c			;9908
	nop			;9909
	rst 18h			;990a
	cp e			;990b
	ld l,d			;990c
	xor d			;990d
	xor d			;990e
	cp d			;990f
	xor d			;9910
	xor a			;9911
	nop			;9912
	xor a			;9913
	rst 8			;9914
	rst 38h			;9915
	ccf			;9916
	adc a,c			;9917
	sub (hl)		;9918
	add a,a			;9919
	rst 38h			;991a
	rst 38h			;991b
	ei			;991c
	rst 8			;991d
	pop bc			;991e
	halt			;991f
	rst 38h			;9920
	pop bc			;9921
	ret p			;9922
	jp m,0f113h		;9923
	ld (hl),e		;9926
	rst 38h			;9927
	jp 07e02h		;9928
	ld l,d			;992b
	xor d			;992c
	xor d			;992d
	xor d			;992e
	cp d			;992f
	rst 38h			;9930
	rst 38h			;9931
l9932h:
	inc bc			;9932
	adc a,d			;9933
	dec bc			;9934
	push af			;9935
	rst 38h			;9936
	sbc a,a			;9937
	sbc a,e			;9938
	and e			;9939
	inc bc			;993a
	ret po			;993b
	nop			;993c
	rst 8			;993d
l993eh:
	rst 28h			;993e
	di			;993f
	rst 38h			;9940
	rst 38h			;9941
	rst 38h			;9942
	cp 0d2h			;9943
	ld a,(bc)		;9945
	ld a,d			;9946
	rst 18h			;9947
	ld e,057h		;9948
	ld d,(hl)		;994a
	ld d,(hl)		;994b
	ld a,a			;994c
	ld d,a			;994d
	ld e,a			;994e
l994fh:
	rst 38h			;994f
	rst 38h			;9950
	rst 38h			;9951
	inc c			;9952
	ld c,b			;9953
	ld b,c			;9954
	ld h,b			;9955
	dec e			;9956
	jp m,lfe6dh		;9957
	nop			;995a
	ld a,a			;995b
	ret po			;995c
	ld e,e			;995d
	cp 0feh			;995e
	pop hl			;9960
	ret nz			;9961
	ld b,087h		;9962
	rst 20h			;9964
	cp 008h			;9965
	ld b,015h		;9967
	and e			;9969
	rst 38h			;996a
	rst 10h			;996b
	ld a,(hl)		;996c
	ld h,h			;996d
	ccf			;996e
	rst 38h			;996f
	rst 10h			;9970
	rst 38h			;9971
	rlca			;9972
	ld b,l			;9973
	ld d,b			;9974
	add hl,bc		;9975
	and b			;9976
	ld (bc),a		;9977
	xor 0dah		;9978
	cp d			;997a
	xor d			;997b
	defb 0edh ;next byte illegal after ed	;997c
	or (hl)			;997d
	xor 0e0h		;997e
	jp m,le2c3h		;9980
l9983h:
	and b			;9983
	ld (bc),a		;9984
	cp h			;9985
	add a,b			;9986
	ld b,d			;9987
	nop			;9988
	add a,d			;9989
	add a,(hl)		;998a
	ld h,b			;998b
	nop			;998c
	and b			;998d
	ld de,ld4efh		;998e
	dec c			;9991
	add a,c			;9992
	ld bc,01020h		;9993
	jr nc,l9983h		;9996
	ld b,(hl)		;9998
	xor d			;9999
	xor d			;999a
	jp pe,lefeah		;999b
	ld (hl),c		;999e
	jr nz,l9932h		;999f
l99a1h:
	sub 056h		;99a1
	cp d			;99a3
	ld b,h			;99a4
	and b			;99a5
	nop			;99a6
	ld a,(bc)		;99a7
	xor b			;99a8
	nop			;99a9
	rrca			;99aa
	defb 0ddh,006h,006h ;illegal sequence	;99ab
	ld c,b			;99ae
	ld d,l			;99af
	call c,04f07h		;99b0
	call c,01003h		;99b3
	rlca			;99b6
	jp nz,l6758h		;99b7
	inc bc			;99ba
	rlca			;99bb
	rst 20h			;99bc
	jr nc,l99f2h		;99bd
	ld b,b			;99bf
	inc e			;99c0
	call nz,sub_eb45h	;99c1
	ld sp,000b0h		;99c4
	nop			;99c7
	or b			;99c8
	ld bc,l7ffch		;99c9
	call m,04022h		;99cc
	rst 38h			;99cf
	ret c			;99d0
	add a,h			;99d1
	adc a,0b9h		;99d2
	inc b			;99d4
	nop			;99d5
	ld (bc),a		;99d6
	nop			;99d7
	dec bc			;99d8
	inc bc			;99d9
	jr l99a1h		;99da
	rst 38h			;99dc
	nop			;99dd
	nop			;99de
	ld c,d			;99df
	add a,h			;99e0
	ld c,d			;99e1
	and l			;99e2
	rst 38h			;99e3
	rra			;99e4
	rst 38h			;99e5
	call m,sub_ab02h	;99e6
	rrca			;99e9
	rst 38h			;99ea
	ret nz			;99eb
	ld (bc),a		;99ec
	ld h,b			;99ed
	ccf			;99ee
	pop bc			;99ef
	nop			;99f0
	nop			;99f1
l99f2h:
	or 050h			;99f2
	rlca			;99f4
	xor e			;99f5
	rst 38h			;99f6
	ld b,d			;99f7
	ld l,c			;99f8
	rst 38h			;99f9
	ld sp,hl		;99fa
	rst 38h			;99fb
	ld b,0dfh		;99fc
	jp p,la96dh		;99fe
	pop bc			;9a01
	sub a			;9a02
	jp p,l8878h		;9a03
	ld l,d			;9a06
	and l			;9a07
	ld d,c			;9a08
	sub h			;9a09
	rst 28h			;9a0a
	ld a,0d5h		;9a0b
	ld d,l			;9a0d
	ld d,l			;9a0e
	ld d,l			;9a0f
	ld d,l			;9a10
	ld a,a			;9a11
	nop			;9a12
	ld e,a			;9a13
	adc a,a			;9a14
	rst 38h			;9a15
	ccf			;9a16
	ld b,d			;9a17
	ld l,(hl)		;9a18
	ret po			;9a19
	ld a,a			;9a1a
	di			;9a1b
	rst 38h			;9a1c
	rst 18h			;9a1d
	ld e,(hl)		;9a1e
	xor 0ffh		;9a1f
	cp 00fh			;9a21
	defb 0fdh,010h,051h ;illegal sequence	;9a23
	ld a,h			;9a26
	nop			;9a27
	rrca			;9a28
	add a,l			;9a29
	rst 18h			;9a2a
	push de			;9a2b
	ld d,l			;9a2c
	ld d,a			;9a2d
	push de			;9a2e
	ld d,l			;9a2f
	rst 38h			;9a30
	rst 38h			;9a31
	daa			;9a32
	add a,011h		;9a33
	ld a,(de)		;9a35
	ld a,a			;9a36
	and c			;9a37
	dec hl			;9a38
	ld h,b			;9a39
	ld h,c			;9a3a
	add a,b			;9a3b
	jr nz,l9ab5h		;9a3c
	rst 28h			;9a3e
	ei			;9a3f
	rst 38h			;9a40
	rst 38h			;9a41
	rst 38h			;9a42
	cp 0d3h			;9a43
	dec b			;9a45
	ld l,h			;9a46
	rst 18h			;9a47
	defb 0edh ;next byte illegal after ed	;9a48
	ret nc			;9a49
	sub d			;9a4a
	sub d			;9a4b
	add a,a			;9a4c
	or d			;9a4d
	sub a			;9a4e
	rst 38h			;9a4f
	rst 38h			;9a50
	rst 38h			;9a51
	add hl,de		;9a52
	inc e			;9a53
	ld (bc),a		;9a54
	nop			;9a55
	dec c			;9a56
	call p,07637h		;9a57
	nop			;9a5a
	rst 0			;9a5b
	add a,b			;9a5c
	or (hl)			;9a5d
	rst 38h			;9a5e
	rst 38h			;9a5f
	rst 38h			;9a60
	ret nz			;9a61
	inc bc			;9a62
	adc a,a			;9a63
	ei			;9a64
	rst 38h			;9a65
	inc b			;9a66
	ex af,af'		;9a67
	cp e			;9a68
	ld c,a			;9a69
	jp p,la192h		;9a6a
	jp lff9fh		;9a6d
	out (0ffh),a		;9a70
	nop			;9a72
	jp p,lcaa3h		;9a73
	ld h,b			;9a76
	ld bc,075d5h		;9a77
	ld d,l			;9a7a
	ld (hl),l		;9a7b
	ld d,a			;9a7c
	defb 0ddh,06fh ;ld ixl,a	;9a7d
	nop			;9a7f
	ld a,(00ce0h)		;9a80
	or c			;9a83
	defb 0fdh,083h,000h ;illegal sequence	;9a84
	ld b,c			;9a87
	ld bc,00300h		;9a88
	xor c			;9a8b
	ld bc,00310h		;9a8c
	rrca			;9a8f
	sub h			;9a90
	nop			;9a91
	add a,d			;9a92
	add a,(hl)		;9a93
	ld e,h			;9a94
	ld h,b			;9a95
	djnz l9b00h		;9a96
	rst 0			;9a98
	push af			;9a99
	ld (hl),l		;9a9a
	ld d,l			;9a9b
	ld (hl),a		;9a9c
	ld e,h			;9a9d
	ld h,c			;9a9e
	ld de,05210h		;9a9f
	sub d			;9aa2
	jp m,l8069h		;9aa3
	nop			;9aa6
	dec d			;9aa7
	ld b,h			;9aa8
	nop			;9aa9
	rrca			;9aaa
	ret p			;9aab
	di			;9aac
	call m,00af8h		;9aad
	ret c			;9ab0
	ld bc,00718h		;9ab1
	rra			;9ab4
l9ab5h:
	jr $+5			;9ab5
	add a,h			;9ab7
	ld b,(hl)		;9ab8
	ld de,01fe2h		;9ab9
	ret m			;9abc
	ld b,d			;9abd
	dec de			;9abe
	jr nz,l9b10h		;9abf
	ld e,(hl)		;9ac1
	push af			;9ac2
	call pe,020d4h		;9ac3
	nop			;9ac6
	nop			;9ac7
	ld d,b			;9ac8
	inc bc			;9ac9
	call m,0fe7fh		;9aca
	call sub_ff83h		;9acd
	ret z			;9ad0
	halt			;9ad1
	rst 38h			;9ad2
	rst 38h			;9ad3
	rst 38h			;9ad4
	rst 38h			;9ad5
	rst 38h			;9ad6
	rst 38h			;9ad7
	rst 38h			;9ad8
	rst 38h			;9ad9
	rst 38h			;9ada
	rst 38h			;9adb
	rst 38h			;9adc
	rst 38h			;9add
	rst 38h			;9ade
	rst 38h			;9adf
	rst 38h			;9ae0
	rst 38h			;9ae1
	rst 38h			;9ae2
	rst 38h			;9ae3
	rst 38h			;9ae4
	rst 38h			;9ae5
	rst 38h			;9ae6
	rst 38h			;9ae7
	rst 38h			;9ae8
	rst 38h			;9ae9
	rst 38h			;9aea
	rst 38h			;9aeb
	rst 38h			;9aec
	rst 38h			;9aed
	rst 38h			;9aee
	rst 38h			;9aef
	rst 38h			;9af0
	rst 38h			;9af1
	jr c,l9b2ch		;9af2
	jr c,l9b30h		;9af4
	jr c,l9b30h		;9af6
	jr c,$+58		;9af8
	jr c,$+58		;9afa
	jr c,$+58		;9afc
	jr c,l9b3ah		;9afe
l9b00h:
	ld a,(03838h)		;9b00
l9b03h:
	ld a,(03a3ah)		;9b03
	jr c,l9b40h		;9b06
	jr c,l9b42h		;9b08
	jr c,l9b46h		;9b0a
	jr c,l9b46h		;9b0c
	jr c,$+60		;9b0e
l9b10h:
	ld a,(l7036h+2)		;9b10
	ld (hl),b		;9b13
	ld (hl),b		;9b14
	jr c,$+50		;9b15
	jr c,l9b51h		;9b17
	jr c,$+58		;9b19
	jr c,$+58		;9b1b
	jr c,l9b4fh		;9b1d
	ld a,(03838h)		;9b1f
	jr c,$+60		;9b22
	jr c,$+58		;9b24
	jr c,$+58		;9b26
	jr c,l9b62h		;9b28
	jr c,l9b64h		;9b2a
l9b2ch:
	jr c,$+58		;9b2c
	jr c,$+60		;9b2e
l9b30h:
	ld a,(0383ah)		;9b30
	jr c,l9b6dh		;9b33
	ld a,(03838h)		;9b35
	jr c,$+50		;9b38
l9b3ah:
	jr nc,$+50		;9b3a
	jr c,l9b76h		;9b3c
	jr c,l9b7ah		;9b3e
l9b40h:
	jr c,l9b7ah		;9b40
l9b42h:
	jr c,l9b7eh		;9b42
	jr c,l9b7eh		;9b44
l9b46h:
	ld a,(03838h)		;9b46
	jr c,l9b83h		;9b49
	jr c,l9badh		;9b4b
	jr c,l9bafh		;9b4d
l9b4fh:
	ld h,b			;9b4f
	ld h,b			;9b50
l9b51h:
	ld a,(03838h)		;9b51
	jr c,l9b90h		;9b54
	ld a,(03838h)		;9b56
	jr c,l9b93h		;9b59
	jr c,$+58		;9b5b
	jr c,l9b97h		;9b5d
	ld a,(03838h)		;9b5f
l9b62h:
	jr c,l9b9eh		;9b62
l9b64h:
	ld a,(03a38h)		;9b64
	jr c,$+58		;9b67
	jr c,l9ba3h		;9b69
	jr c,l9bcdh		;9b6b
l9b6dh:
	ld h,b			;9b6d
	ld h,b			;9b6e
	ld h,b			;9b6f
	ld h,b			;9b70
	ld a,(l6036h+2)		;9b71
	jr c,l9beeh		;9b74
l9b76h:
	ld a,b			;9b76
	ld a,b			;9b77
	jr c,l9bb2h		;9b78
l9b7ah:
	jr c,l9bb4h		;9b7a
	jr c,l9bb6h		;9b7c
l9b7eh:
	jr c,l9bbah		;9b7e
	ld a,(03a38h)		;9b80
l9b83h:
	ld (02872h),a		;9b83
	ld h,c			;9b86
	ld h,b			;9b87
	ld h,b			;9b88
	jr nc,l9bbbh		;9b89
	jr c,l9bedh		;9b8b
	ld h,b			;9b8d
	ld h,b			;9b8e
	ld h,b			;9b8f
l9b90h:
	ld h,b			;9b90
	ld (hl),d		;9b91
	ld h,b			;9b92
l9b93h:
	ld h,b			;9b93
	jr c,l9c0eh		;9b94
	ld a,b			;9b96
l9b97h:
	ld a,b			;9b97
	ld a,b			;9b98
	ld l,b			;9b99
	ld l,b			;9b9a
	ld l,b			;9b9b
	jr c,l9bd6h		;9b9c
l9b9eh:
	jr c,l9bd0h		;9b9e
	jr nc,l9c12h		;9ba0
	ld (hl),b		;9ba2
l9ba3h:
	ld (hl),b		;9ba3
	ld (hl),d		;9ba4
	ld h,b			;9ba5
	ld h,c			;9ba6
	ld h,b			;9ba7
	ld h,c			;9ba8
	jr nc,l9bdbh		;9ba9
	jr c,l9c0dh		;9bab
l9badh:
	ld h,b			;9bad
	ld h,b			;9bae
l9bafh:
	ld h,b			;9baf
	ld h,b			;9bb0
	ld (hl),d		;9bb1
l9bb2h:
	ld h,b			;9bb2
	ld h,b			;9bb3
l9bb4h:
	jr c,l9c2eh		;9bb4
l9bb6h:
	ld a,b			;9bb6
	ld a,b			;9bb7
	ld l,b			;9bb8
	ld l,b			;9bb9
l9bbah:
	ld l,b			;9bba
l9bbbh:
	ld l,b			;9bbb
	ld l,b			;9bbc
	jr z,l9be7h		;9bbd
	ld l,b			;9bbf
	jr nc,$+114		;9bc0
	ld (hl),b		;9bc2
	jr nc,$+50		;9bc3
	ld h,b			;9bc5
	ld h,c			;9bc6
	jr nz,l9c29h		;9bc7
	jr nc,l9bfbh		;9bc9
	jr c,l9c2dh		;9bcb
l9bcdh:
	ld h,b			;9bcd
	ld h,b			;9bce
	ld h,b			;9bcf
l9bd0h:
	ld h,b			;9bd0
	ld (03838h),a		;9bd1
	jr c,$+122		;9bd4
l9bd6h:
	ld l,b			;9bd6
	ld l,b			;9bd7
	ld l,b			;9bd8
	ld l,b			;9bd9
	ld l,b			;9bda
l9bdbh:
	ld l,b			;9bdb
	ld l,b			;9bdc
	jr z,l9c07h		;9bdd
	jr z,l9c11h		;9bdf
	ld (hl),b		;9be1
	ld (hl),b		;9be2
	jr nc,$+50		;9be3
	ld h,b			;9be5
	ld h,b			;9be6
l9be7h:
	ld hl,01860h		;9be7
	jr $+58			;9bea
	ld h,b			;9bec
l9bedh:
	ld h,b			;9bed
l9beeh:
	ld h,b			;9bee
	ld h,b			;9bef
	ld h,b			;9bf0
	ld h,b			;9bf1
	jr c,$+50		;9bf2
	jr nc,$+122		;9bf4
	ld l,b			;9bf6
	ld l,b			;9bf7
	ld l,b			;9bf8
	ld l,b			;9bf9
	ld l,b			;9bfa
l9bfbh:
	ld l,b			;9bfb
	jr z,$+42		;9bfc
	jr z,l9c28h		;9bfe
	jr nc,$+114		;9c00
	ld (hl),b		;9c02
	jr c,l9c35h		;9c03
	jr c,l9c67h		;9c05
l9c07h:
	ld h,b			;9c07
	ld h,b			;9c08
	jr nz,l9c6bh		;9c09
	jr c,l9c6dh		;9c0b
l9c0dh:
	ld h,b			;9c0d
l9c0eh:
	ld h,b			;9c0e
	ld h,b			;9c0f
	ld h,b			;9c10
l9c11h:
	ld h,b			;9c11
l9c12h:
	jr c,l9c44h		;9c12
	jr nc,l9c8eh		;9c14
	ld a,(l6868h)		;9c16
	jr c,$+58		;9c19
	jr c,$+58		;9c1b
	ld a,b			;9c1d
	jr z,l9c48h		;9c1e
	jr z,$+106		;9c20
	ld l,b			;9c22
	jr c,l9c5dh		;9c23
	jr c,l9c87h		;9c25
	ld h,b			;9c27
l9c28h:
	ld h,b			;9c28
l9c29h:
	ld h,b			;9c29
	ld h,b			;9c2a
	ld h,b			;9c2b
	ld h,b			;9c2c
l9c2dh:
	ld h,b			;9c2d
l9c2eh:
	ld h,b			;9c2e
	ld h,b			;9c2f
	ld h,b			;9c30
	jr c,l9c6bh		;9c31
	jr c,l9c65h		;9c33
l9c35h:
	jr c,l9c71h		;9c35
	ld l,b			;9c37
	ld l,b			;9c38
	jr c,l9c73h		;9c39
	jr c,l9c75h		;9c3b
	jr c,$+58		;9c3d
	jr c,$+58		;9c3f
	ld l,b			;9c41
	jr c,l9c7ch		;9c42
l9c44h:
	jr c,l9c7eh		;9c44
	jr c,l9c80h		;9c46
l9c48h:
	jr z,$+42		;9c48
	jr z,l9c84h		;9c4a
	ld h,b			;9c4c
	jr z,$+98		;9c4d
	ld h,b			;9c4f
	nop			;9c50
	nop			;9c51
	jr c,l9c84h		;9c52
	jr c,$+106		;9c54
	ld l,b			;9c56
	jr c,l9c91h		;9c57
	jr c,$+58		;9c59
	jr c,l9c95h		;9c5b
l9c5dh:
	jr c,l9ccfh		;9c5d
	ld (hl),b		;9c5f
	ld l,b			;9c60
	ld l,b			;9c61
	ld l,b			;9c62
	jr c,l9c9dh		;9c63
l9c65h:
	jr c,l9c9fh		;9c65
l9c67h:
	jr c,l9ce1h		;9c67
	jr z,l9c94h		;9c69
l9c6bh:
	jr z,l9c95h		;9c6b
l9c6dh:
	jr z,l9c97h		;9c6d
	jr z,l9c99h		;9c6f
l9c71h:
	jr c,$+58		;9c71
l9c73h:
	jr nc,l9cadh		;9c73
l9c75h:
	ld l,b			;9c75
	jr c,l9cb0h		;9c76
	jr c,l9cb2h		;9c78
	jr c,l9cb4h		;9c7a
l9c7ch:
	jr c,$+58		;9c7c
l9c7eh:
	ld e,b			;9c7e
	ld e,b			;9c7f
l9c80h:
	ld e,b			;9c80
	ld l,b			;9c81
	jr z,l9ca4h		;9c82
l9c84h:
	jr nz,$+58		;9c84
	ld a,b			;9c86
l9c87h:
	ld a,b			;9c87
	ld a,b			;9c88
	jr c,l9cc3h		;9c89
	jr z,$+43		;9c8b
	add hl,hl		;9c8d
l9c8eh:
	add hl,hl		;9c8e
	jr z,l9cb9h		;9c8f
l9c91h:
	ld d,b			;9c91
	jr c,l9d0ch		;9c92
l9c94h:
	ld a,b			;9c94
l9c95h:
	jr c,l9ccfh		;9c95
l9c97h:
	jr c,l9cd1h		;9c97
l9c99h:
	jr c,$+58		;9c99
	jr c,$+58		;9c9b
l9c9dh:
	jr c,l9cf7h		;9c9d
l9c9fh:
	ld h,b			;9c9f
l9ca0h:
	ld l,b			;9ca0
	ld l,b			;9ca1
	jr c,$+34		;9ca2
l9ca4h:
	ld a,b			;9ca4
	ld a,b			;9ca5
	ld a,b			;9ca6
	ld a,b			;9ca7
	jr c,l9ce2h		;9ca8
	jr c,l9cd4h		;9caa
	add hl,hl		;9cac
l9cadh:
	add hl,hl		;9cad
l9caeh:
	jr z,l9cd8h		;9cae
l9cb0h:
	ld d,b			;9cb0
	ld d,b			;9cb1
l9cb2h:
	jr c,l9d2ch		;9cb2
l9cb4h:
	ld a,b			;9cb4
	jr c,$+58		;9cb5
	jr c,l9cf1h		;9cb7
l9cb9h:
	jr c,l9cf3h		;9cb9
	jr c,l9cf5h		;9cbb
	jr c,l9cf7h		;9cbd
	ld h,b			;9cbf
	ld h,b			;9cc0
	ld l,b			;9cc1
	ld l,b			;9cc2
l9cc3h:
	jr c,l9d15h		;9cc3
	ld a,b			;9cc5
	ld a,b			;9cc6
	ld a,b			;9cc7
	jr c,l9d02h		;9cc8
	jr z,l9cf4h		;9cca
	jr z,l9cf7h		;9ccc
	add hl,hl		;9cce
l9ccfh:
	jr z,$+82		;9ccf
l9cd1h:
	ld d,b			;9cd1
	jr z,l9cfch		;9cd2
l9cd4h:
	jr c,l9d0eh		;9cd4
	jr c,l9d10h		;9cd6
l9cd8h:
	jr c,l9d12h		;9cd8
	jr c,$+58		;9cda
	jr c,l9d16h		;9cdc
	jr c,l9d40h		;9cde
	ld h,b			;9ce0
l9ce1h:
	ld l,b			;9ce1
l9ce2h:
	ld l,b			;9ce2
	jr c,l9d5dh		;9ce3
	ld a,b			;9ce5
	ld a,b			;9ce6
	ld a,b			;9ce7
	jr c,l9d22h		;9ce8
	jr z,$+42		;9cea
	jr z,l9d17h		;9cec
	jr z,l9d28h		;9cee
	ld d,b			;9cf0
l9cf1h:
	ld d,b			;9cf1
	nop			;9cf2
l9cf3h:
	nop			;9cf3
l9cf4h:
	nop			;9cf4
l9cf5h:
	nop			;9cf5
	nop			;9cf6
l9cf7h:
	nop			;9cf7
	nop			;9cf8
	nop			;9cf9
	nop			;9cfa
	nop			;9cfb
l9cfch:
	nop			;9cfc
	nop			;9cfd
	nop			;9cfe
	nop			;9cff
l9d00h:
	nop			;9d00
	nop			;9d01
l9d02h:
	nop			;9d02
	nop			;9d03
	ld b,0dch		;9d04
	ld (hl),d		;9d06
	ld e,b			;9d07
	ld a,h			;9d08
	nop			;9d09
	inc e			;9d0a
	rlca			;9d0b
l9d0ch:
	add a,0a7h		;9d0c
l9d0eh:
	rst 38h			;9d0e
	adc a,(hl)		;9d0f
l9d10h:
	rlca			;9d10
	rst 38h			;9d11
l9d12h:
	rst 38h			;9d12
	cp 0afh			;9d13
l9d15h:
	add a,b			;9d15
l9d16h:
	ld a,l			;9d16
l9d17h:
	ld b,b			;9d17
	ld d,a			;9d18
	xor d			;9d19
	jp z,03bc5h		;9d1a
	ld (hl),l		;9d1d
	halt			;9d1e
	pop de			;9d1f
	sub 0a7h		;9d20
l9d22h:
	add a,e			;9d22
	ld (hl),d		;9d23
	ld (bc),a		;9d24
	add a,c			;9d25
	ret pe			;9d26
	nop			;9d27
l9d28h:
	ret pe			;9d28
	xor a			;9d29
	adc a,e			;9d2a
	scf			;9d2b
l9d2ch:
	sbc a,b			;9d2c
	ld de,la0bch		;9d2d
	nop			;9d30
	nop			;9d31
	rrca			;9d32
	ld e,h			;9d33
	and b			;9d34
	inc e			;9d35
	jp pe,07b04h		;9d36
	ld c,b			;9d39
	and 0fch		;9d3a
	call z,000f8h		;9d3c
	nop			;9d3f
l9d40h:
	inc b			;9d40
	nop			;9d41
	nop			;9d42
	xor e			;9d43
l9d44h:
	jp pe,00480h		;9d44
	ld c,c			;9d47
	rst 18h			;9d48
	call sub_aec1h		;9d49
	ld c,h			;9d4c
	ret po			;9d4d
	nop			;9d4e
	inc bc			;9d4f
	add a,b			;9d50
	ld (bc),a		;9d51
	nop			;9d52
	ld h,e			;9d53
	cp b			;9d54
	ld d,000h		;9d55
	rst 38h			;9d57
	push de			;9d58
	ld c,h			;9d59
	ld c,b			;9d5a
	ld h,b			;9d5b
	nop			;9d5c
l9d5dh:
	nop			;9d5d
	nop			;9d5e
	nop			;9d5f
	ld b,b			;9d60
	jr nz,$-69		;9d61
	ld l,h			;9d63
	ret nz			;9d64
	nop			;9d65
	inc c			;9d66
	and c			;9d67
	ld d,b			;9d68
	inc b			;9d69
	xor b			;9d6a
	nop			;9d6b
	nop			;9d6c
	nop			;9d6d
	nop			;9d6e
	nop			;9d6f
	nop			;9d70
	add hl,bc		;9d71
	ld b,h			;9d72
	nop			;9d73
	ld e,b			;9d74
	ld a,h			;9d75
	inc bc			;9d76
	nop			;9d77
	inc bc			;9d78
	add a,b			;9d79
	rst 38h			;9d7a
	ld bc,0f3ffh		;9d7b
	ret m			;9d7e
	nop			;9d7f
	nop			;9d80
	nop			;9d81
	nop			;9d82
	ld sp,hl		;9d83
	and 090h		;9d84
	ld a,(0804fh)		;9d86
	ld (hl),e		;9d89
	jp p,01bbbh		;9d8a
	ccf			;9d8d
	rst 38h			;9d8e
	rst 38h			;9d8f
	jp p,lfb3eh+1		;9d90
	rst 38h			;9d93
	ld d,a			;9d94
	and a			;9d95
	jp pe,0bd0ch		;9d96
l9d99h:
	ld d,a			;9d99
	ld d,l			;9d9a
l9d9bh:
	ld b,06dh		;9d9b
	cp d			;9d9d
	ld l,(ix-047h)		;9d9e
	ld d,d			;9da1
	pop bc			;9da2
	cp h			;9da3
	dec bc			;9da4
	rrca			;9da5
	ld d,b			;9da6
	inc bc			;9da7
	ld d,e			;9da8
	or c			;9da9
	dec c			;9daa
	inc c			;9dab
	or 011h			;9dac
	and c			;9dae
	ret po			;9daf
	nop			;9db0
	nop			;9db1
	nop			;9db2
	or h			;9db3
	nop			;9db4
	rrca			;9db5
	ld d,b			;9db6
	ld b,0fdh		;9db7
	and d			;9db9
	cp (hl)			;9dba
	di			;9dbb
	inc sp			;9dbc
	ld h,b			;9dbd
	nop			;9dbe
	nop			;9dbf
	nop			;9dc0
	nop			;9dc1
	nop			;9dc2
	ld d,l			;9dc3
	inc d			;9dc4
	nop			;9dc5
	ex af,af'		;9dc6
	push af			;9dc7
	dec hl			;9dc8
	or e			;9dc9
	ld h,b			;9dca
	ld (020dbh),a		;9dcb
	djnz l9dd0h		;9dce
l9dd0h:
	nop			;9dd0
	ld (de),a		;9dd1
	inc b			;9dd2
	add a,004h		;9dd3
	jr nc,l9dd7h		;9dd5
l9dd7h:
	ld b,c			;9dd7
	cp 022h			;9dd8
	adc a,b			;9dda
	ld b,b			;9ddb
	nop			;9ddc
	nop			;9ddd
	nop			;9dde
	nop			;9ddf
	inc b			;9de0
	djnz l9e42h		;9de1
	defb 0ddh,008h,000h ;illegal sequence	;9de3
	dec (hl)		;9de6
	jr nz,l9d99h		;9de7
	inc d			;9de9
	ret pe			;9dea
	nop			;9deb
	nop			;9dec
	nop			;9ded
	nop			;9dee
	nop			;9def
	nop			;9df0
	jr z,l9d9bh		;9df1
	nop			;9df3
	xor a			;9df4
	push bc			;9df5
	ld l,l			;9df6
	add a,b			;9df7
	ccf			;9df8
	jp lc7ffh		;9df9
	rst 38h			;9dfc
	rst 38h			;9dfd
	cp 001h			;9dfe
l9e00h:
	ret p			;9e00
	ccf			;9e01
	nop			;9e02
	rst 20h			;9e03
	ret p			;9e04
	inc l			;9e05
	ret z			;9e06
	ret m			;9e07
	ld bc,055deh		;9e08
	call z,sub_d964h	;9e0b
	ld sp,hl		;9e0e
	rst 38h			;9e0f
	defb 0fdh,0c9h,074h ;illegal sequence	;9e10
	cp 0abh			;9e13
	sbc a,l			;9e15
	ld d,h			;9e16
	add hl,sp		;9e17
	jp pe,laeach		;9e18
	ex af,af'		;9e1b
	adc a,08dh		;9e1c
	xor c			;9e1e
	or c			;9e1f
	ld (hl),d		;9e20
	xor c			;9e21
	ld a,h			;9e22
	ld d,h			;9e23
	ld (bc),a		;9e24
	ld a,d			;9e25
	add a,c			;9e26
	ld c,h			;9e27
	add a,a			;9e28
	ld b,b			;9e29
	ld (hl),b		;9e2a
	sbc a,a			;9e2b
	dec sp			;9e2c
	ld de,000a7h		;9e2d
	pop bc			;9e30
	nop			;9e31
	nop			;9e32
	ld a,h			;9e33
	nop			;9e34
	adc a,(hl)		;9e35
	and b			;9e36
	add hl,bc		;9e37
	jp p,0ddd4h		;9e38
	call pe,sub_e0cdh	;9e3b
	nop			;9e3e
	nop			;9e3f
	nop			;9e40
	nop			;9e41
l9e42h:
	nop			;9e42
	xor e			;9e43
	jr z,l9e46h		;9e44
l9e46h:
	ld de,056afh		;9e46
	jp pe,l6e99h		;9e49
	xor h			;9e4c
	ret po			;9e4d
	nop			;9e4e
	nop			;9e4f
	nop			;9e50
	nop			;9e51
	inc b			;9e52
	adc a,b			;9e53
	nop			;9e54
	ld b,b			;9e55
	ld bc,011c0h		;9e56
	rst 38h			;9e59
	ex af,af'		;9e5a
	ret nz			;9e5b
	call pe,sub_8007h	;9e5c
	adc a,b			;9e5f
	nop			;9e60
	ld e,059h		;9e61
	xor d			;9e63
	jr nc,l9e66h		;9e64
l9e66h:
	add hl,hl		;9e66
	jr nz,l9eb9h		;9e67
	inc b			;9e69
	ex af,af'		;9e6a
	nop			;9e6b
	nop			;9e6c
	nop			;9e6d
	nop			;9e6e
	nop			;9e6f
l9e70h:
	nop			;9e70
	ld d,a			;9e71
	ld d,a			;9e72
	ld a,a			;9e73
	inc h			;9e74
	inc b			;9e75
	ld d,(hl)		;9e76
	jp lffffh		;9e77
	rst 20h			;9e7a
	rst 38h			;9e7b
	rst 38h			;9e7c
	rst 38h			;9e7d
	rst 38h			;9e7e
	rst 0			;9e7f
	cp 0ffh			;9e80
	pop hl			;9e82
	rrca			;9e83
	inc a			;9e84
	sbc a,(hl)		;9e85
	add a,a			;9e86
	add a,b			;9e87
	ld (bc),a		;9e88
	nop			;9e89
	xor (hl)		;9e8a
	or b			;9e8b
	ret			;9e8c
	rst 20h			;9e8d
	rst 38h			;9e8e
	ex (sp),hl		;9e8f
	ei			;9e90
	ld h,0abh		;9e91
	defb 0fdh,053h,08ah ;illegal sequence	;9e93
	and b			;9e96
	scf			;9e97
	ld d,l			;9e98
l9e99h:
	ld (hl),c		;9e99
	ld e,b			;9e9a
	ld de,l6685h		;9e9b
	call nc,sub_d5d9h	;9e9e
	push af			;9ea1
	call nz,011ech		;9ea2
	push de			;9ea5
	ld bc,009b5h		;9ea6
	add a,(hl)		;9ea9
	in a,(03dh)		;9eaa
	push de			;9eac
	ld b,c			;9ead
	xor h			;9eae
	nop			;9eaf
	nop			;9eb0
	nop			;9eb1
	add a,b			;9eb2
	or h			;9eb3
	ld sp,04035h		;9eb4
	ld d,d			;9eb7
	rst 38h			;9eb8
l9eb9h:
	ld l,c			;9eb9
	ld h,(hl)		;9eba
	or e			;9ebb
	or e			;9ebc
	jr nz,l9ebfh		;9ebd
l9ebfh:
	add a,b			;9ebf
	nop			;9ec0
	nop			;9ec1
	nop			;9ec2
	push de			;9ec3
	nop			;9ec4
	nop			;9ec5
	ld hl,lad62h		;9ec6
	or a			;9ec9
	ld a,h			;9eca
	ld (0589bh),a		;9ecb
	nop			;9ece
	nop			;9ecf
	inc b			;9ed0
	nop			;9ed1
	ld c,h			;9ed2
	dec bc			;9ed3
	add a,b			;9ed4
	add a,b			;9ed5
	ld bc,00c40h		;9ed6
	djnz l9ee3h		;9ed9
	add a,b			;9edb
	nop			;9edc
	nop			;9edd
	nop			;9ede
	nop			;9edf
	nop			;9ee0
	dec de			;9ee1
	ld d,e			;9ee2
l9ee3h:
	ld e,d			;9ee3
	ld d,c			;9ee4
	nop			;9ee5
	pop de			;9ee6
	jr nz,l9e99h		;9ee7
	ld (bc),a		;9ee9
	ex af,af'		;9eea
	nop			;9eeb
	nop			;9eec
	nop			;9eed
	nop			;9eee
	ld bc,02fc0h		;9eef
	rst 38h			;9ef2
	ld bc,le794h		;9ef3
	ex (sp),hl		;9ef6
	ld a,h			;9ef7
	rst 38h			;9ef8
	rst 38h			;9ef9
	sbc a,e			;9efa
	rst 38h			;9efb
	rst 38h			;9efc
	rst 38h			;9efd
	rst 18h			;9efe
	rst 38h			;9eff
	rst 38h			;9f00
	rst 18h			;9f01
	rst 38h			;9f02
	rst 38h			;9f03
	cp 05eh			;9f04
	call c,sub_fc01h	;9f06
	dec b			;9f09
	ld a,c			;9f0a
	ld b,c			;9f0b
	rla			;9f0c
	rst 38h			;9f0d
	rst 30h			;9f0e
	defb 0ddh,0c6h,0cdh ;illegal sequence	;9f0f
	ld d,b			;9f12
	add iy,bc		;9f13
	sub l			;9f15
	nop			;9f16
	ld a,(de)		;9f17
	sbc a,d			;9f18
	jp nz,021b8h		;9f19
	ex (sp),hl		;9f1c
	or e			;9f1d
	ld l,(hl)		;9f1e
	ld l,l			;9f1f
	ld l,c			;9f20
	ld de,05648h		;9f21
	ld c,0a0h		;9f24
	ld bc,004c8h		;9f26
	ld bc,05bech		;9f29
	or 0b1h			;9f2c
	ret m			;9f2e
	nop			;9f2f
	nop			;9f30
	nop			;9f31
	nop			;9f32
	ld l,h			;9f33
	ld a,(de)		;9f34
	jp pe,02700h		;9f35
	ld l,l			;9f38
	or l			;9f39
	or e			;9f3a
	dec a			;9f3b
	inc e			;9f3c
	ret po			;9f3d
	nop			;9f3e
	ld (bc),a		;9f3f
	add a,b			;9f40
	nop			;9f41
	nop			;9f42
	ld l,e			;9f43
l9f44h:
	nop			;9f44
	ld bc,0fba3h		;9f45
	ld d,h			;9f48
	exx			;9f49
	xor d			;9f4a
	cp (hl)			;9f4b
	ld d,h			;9f4c
	ret nz			;9f4d
	nop			;9f4e
	ld (bc),a		;9f4f
	ld b,b			;9f50
	ld b,b			;9f51
	ld c,c			;9f52
	ld e,0e1h		;9f53
	nop			;9f55
	ld (bc),a		;9f56
	adc a,a			;9f57
	add a,d			;9f58
	djnz l9f44h		;9f59
	nop			;9f5b
	nop			;9f5c
	nop			;9f5d
	ex af,af'		;9f5e
	nop			;9f5f
	nop			;9f60
	inc c			;9f61
	nop			;9f62
	or l			;9f63
	ld (0a100h),a		;9f64
	ld b,b			;9f67
	ld d,b			;9f68
	ld (bc),a		;9f69
	ex af,af'		;9f6a
	nop			;9f6b
	nop			;9f6c
	nop			;9f6d
	nop			;9f6e
	nop			;9f6f
	inc b			;9f70
	nop			;9f71
	nop			;9f72
	ld a,b			;9f73
	pop de			;9f74
	ld (000c1h),hl		;9f75
	rst 38h			;9f78
	cp 07ch			;9f79
	ld h,a			;9f7b
	rst 38h			;9f7c
	rst 38h			;9f7d
	xor a			;9f7e
	rst 38h			;9f7f
	rst 38h			;9f80
	inc hl			;9f81
	call m,sub_fcafh	;9f82
l9f85h:
	inc l			;9f85
	call pe,sub_a802h	;9f86
	xor e			;9f89
	rst 10h			;9f8a
	sbc a,(hl)		;9f8b
	ld h,d			;9f8c
	xor d			;9f8d
	xor (hl)		;9f8e
	ld (hl),031h		;9f8f
	jp c,0e1a1h		;9f91
	add hl,bc		;9f94
	add a,c			;9f95
	or b			;9f96
	push af			;9f97
	scf			;9f98
	dec d			;9f99
	and 040h		;9f9a
	dec sp			;9f9c
	exx			;9f9d
	or a			;9f9e
	ld sp,016d5h		;9f9f
	xor (hl)		;9fa2
	ld l,h			;9fa3
	ld (hl),l		;9fa4
	ld bc,05083h		;9fa5
	ld c,00ah		;9fa8
	ld c,(hl)		;9faa
	dec l			;9fab
	ld a,(hl)		;9fac
	add hl,sp		;9fad
	add a,b			;9fae
	nop			;9faf
	nop			;9fb0
	nop			;9fb1
	nop			;9fb2
	sub 00fh		;9fb3
	ld d,h			;9fb5
	nop			;9fb6
	ld c,e			;9fb7
	sbc a,0dah		;9fb8
	ret c			;9fba
	di			;9fbb
	ld e,e			;9fbc
	jr nz,l9fc7h		;9fbd
	nop			;9fbf
	inc b			;9fc0
	ld bc,03700h		;9fc1
	add a,b			;9fc4
	ld h,d			;9fc5
	ld b,e			;9fc6
l9fc7h:
	jp nc,laea9h		;9fc7
	or (hl)			;9fca
	halt			;9fcb
	rlca			;9fcc
	add a,b			;9fcd
	nop			;9fce
	nop			;9fcf
	nop			;9fd0
	ld h,d			;9fd1
	ld l,c			;9fd2
	dec (hl)		;9fd3
	ld (hl),d		;9fd4
	nop			;9fd5
	dec b			;9fd6
	sbc a,d			;9fd7
	ret po			;9fd8
	jr nz,l9f85h		;9fd9
	nop			;9fdb
	nop			;9fdc
	nop			;9fdd
	nop			;9fde
	nop			;9fdf
	nop			;9fe0
	ex af,af'		;9fe1
	ld b,e			;9fe2
	ld e,e			;9fe3
	ld d,l			;9fe4
	inc bc			;9fe5
	ld h,c			;9fe6
	ld b,b			;9fe7
	or b			;9fe8
	ld (bc),a		;9fe9
	ex af,af'		;9fea
	nop			;9feb
	ld c,b			;9fec
	ld h,b			;9fed
	nop			;9fee
sub_9fefh:
	nop			;9fef
	inc b			;9ff0
	nop			;9ff1
	nop			;9ff2
	xor h			;9ff3
	ld h,c			;9ff4
	ld d,e			;9ff5
	ld h,a			;9ff6
	sbc a,b			;9ff7
	ret m			;9ff8
	pop af			;9ff9
	rst 38h			;9ffa
	sbc a,h			;9ffb
	rra			;9ffc
	rst 38h			;9ffd
	ld (hl),c		;9ffe
	rst 38h			;9fff
	cp 0fch			;a000
	ld h,e			;a002
	rst 18h			;a003
	cp 080h			;a004
sub_a006h:
	and b			;a006
	ld a,a			;a007
	ld b,c			;a008
	ld e,(hl)		;a009
la00ah:
	xor h			;a00a
	xor b			;a00b
	ld c,c			;a00c
	ld d,l			;a00d
	ld d,l			;a00e
	ld e,e			;a00f
	ld a,c			;a010
	or l			;a011
	jp 0011bh		;a012
la015h:
	add a,b			;a015
	rst 20h			;a016
	xor b			;a017
	xor h			;a018
	dec hl			;a019
	dec l			;a01a
	add a,b			;a01b
	add a,l			;a01c
	ld l,e			;a01d
	defb 0edh ;next byte illegal after ed	;a01e
	di			;a01f
	ld a,l			;a020
	ld d,l			;a021
	call pe,sub_aad9h	;a022
	inc hl			;a025
	ld c,080h		;a026
	dec e			;a028
	ld a,(bc)		;a029
	or e			;a02a
	ld e,a			;a02b
	call 000cbh		;a02c
	ld bc,00000h		;a02f
	nop			;a032
	xor d			;a033
	inc c			;a034
	and b			;a035
	inc c			;a036
	sbc a,h			;a037
	defb 0edh ;next byte illegal after ed	;a038
	ld l,l			;a039
	add hl,bc		;a03a
	xor (hl)		;a03b
	ld l,h			;a03c
	ret po			;a03d
	nop			;a03e
	nop			;a03f
	nop			;a040
	add a,c			;a041
	nop			;a042
	ld l,0e0h		;a043
	ld (hl),h		;a045
	add a,e			;a046
	push af			;a047
	ld (hl),d		;a048
	rst 10h			;a049
	ld l,h			;a04a
	jr z,la050h		;a04b
	nop			;a04d
	nop			;a04e
	ld b,b			;a04f
la050h:
	nop			;a050
	ld (02b61h),hl		;a051
	ei			;a054
	nop			;a055
	inc bc			;a056
	or l			;a057
	ld h,b			;a058
	nop			;a059
	xor b			;a05a
la05bh:
	nop			;a05b
	nop			;a05c
	ld h,b			;a05d
	nop			;a05e
	nop			;a05f
	nop			;a060
	nop			;a061
	or h			;a062
	or l			;a063
	xor d			;a064
	ld (bc),a		;a065
	pop bc			;a066
	ld b,b			;a067
	ld d,b			;a068
	djnz la073h		;a069
	nop			;a06b
	nop			;a06c
	nop			;a06d
	nop			;a06e
	nop			;a06f
	nop			;a070
	nop			;a071
	nop			;a072
la073h:
	ld e,h			;a073
	ld c,a			;a074
	sub a			;a075
	and d			;a076
	ret nz			;a077
	rlca			;a078
	nop			;a079
	rlca			;a07a
	ret po			;a07b
	pop af			;a07c
	ld a,b			;a07d
	cp 070h			;a07e
	ld sp,hl		;a080
	rst 38h			;a081
	sbc a,a			;a082
	rst 38h			;a083
	ld e,a			;a084
	ld h,0ffh		;a085
	jp pe,0f50ah		;a087
	ld (hl),l		;a08a
	ld (hl),b		;a08b
	sbc a,h			;a08c
	xor d			;a08d
	xor d			;a08e
	xor l			;a08f
	xor 04ah		;a090
	add a,d			;a092
	ld (de),a		;a093
	ex af,af'		;a094
	nop			;a095
	dec a			;a096
	ld b,b			;a097
	ld (hl),h		;a098
	ld d,(hl)		;a099
	adc a,041h		;a09a
	ld h,b			;a09c
	jp po,l96c2h		;a09d
	xor c			;a0a0
	or 0beh			;a0a1
	ret m			;a0a3
	ld d,b			;a0a4
	ld d,035h		;a0a5
	inc b			;a0a7
	ld a,085h		;a0a8
la0aah:
	defb 0ddh,0afh,033h ;illegal sequence	;a0aa
	ld l,b			;a0ad
	nop			;a0ae
	nop			;a0af
	jr nz,sub_a0b2h		;a0b0
sub_a0b2h:
	ld e,056h		;a0b2
	dec (hl)		;a0b4
	ld b,b			;a0b5
	inc b			;a0b6
	cpl			;a0b7
	or (hl)			;a0b8
	cp e			;a0b9
	adc a,a			;a0ba
	ld (hl),d		;a0bb
la0bch:
	ld l,e			;a0bc
	jr nz,la0bfh		;a0bd
la0bfh:
	nop			;a0bf
	nop			;a0c0
	add a,e			;a0c1
	nop			;a0c2
	jr nc,la135h		;a0c3
	ld d,l			;a0c5
	nop			;a0c6
	cp 0ach			;a0c7
	jp pe,lafb0h		;a0c9
	cp 000h			;a0cc
	nop			;a0ce
	nop			;a0cf
	nop			;a0d0
	and e			;a0d1
	ld (hl),c		;a0d2
	ld (hl),01ch		;a0d3
	nop			;a0d5
	ld c,0aah		;a0d6
	or b			;a0d8
	nop			;a0d9
	ld c,b			;a0da
	nop			;a0db
	nop			;a0dc
	nop			;a0dd
	nop			;a0de
	ex af,af'		;a0df
	ld b,b			;a0e0
	rlca			;a0e1
	ld c,e			;a0e2
	rst 38h			;a0e3
	rst 38h			;a0e4
	rst 38h			;a0e5
	rst 38h			;a0e6
	rst 38h			;a0e7
	rst 38h			;a0e8
	rst 38h			;a0e9
	rst 38h			;a0ea
	rst 38h			;a0eb
	rst 38h			;a0ec
	rst 38h			;a0ed
	rst 38h			;a0ee
	rst 38h			;a0ef
	rst 38h			;a0f0
	rst 38h			;a0f1
	rst 38h			;a0f2
la0f3h:
	jr c,la130h		;a0f3
	dec sp			;a0f5
	dec sp			;a0f6
	dec sp			;a0f7
	ld a,(03a3ah)		;a0f8
	ld a,(03a3ah)		;a0fb
	ld a,(03a3ah)		;a0fe
	ld a,(03c3ah)		;a101
	inc a			;a104
	dec sp			;a105
	dec sp			;a106
	jr c,$+58		;a107
	jr c,$+58		;a109
	jr c,la147h		;a10b
	ld a,(03a3ah)		;a10d
	ld a,(03a3ah)		;a110
	inc a			;a113
	inc a			;a114
	jr c,la14fh		;a115
	jr c,$+58		;a117
	jr c,$+58		;a119
	jr c,la159h		;a11b
	inc a			;a11d
	dec d			;a11e
	ld h,d			;a11f
	ld a,(03a3ah)		;a120
	ld a,(03838h)		;a123
	jr c,$+58		;a126
	ld a,(03b3ah)		;a128
	ld a,(03c3ah)		;a12b
	jr nc,$+50		;a12e
la130h:
	jr nc,la162h		;a130
	ld (0383ah),a		;a132
la135h:
	jr c,$+58		;a135
	ld a,(03a3ah)		;a137
	ld a,(02828h)		;a13a
	jr nc,$+52		;a13d
	ld (03232h),a		;a13f
	ld (0383ah),a		;a142
	jr c,la181h		;a145
la147h:
	ld a,(03a3ah)		;a147
	ld a,(02828h)		;a14a
	jr nc,la181h		;a14d
la14fh:
	ld (03232h),a		;a14f
	ld (03c3ch),a		;a152
	ld a,(l623ah)		;a155
	ld h,d			;a158
la159h:
	ld h,d			;a159
	ld h,d			;a15a
	jr nc,la18dh		;a15b
	jr nc,la191h		;a15d
	ld (03232h),a		;a15f
la162h:
	ld (hl),d		;a162
	inc a			;a163
	inc a			;a164
	ld a,(0223ah)		;a165
	ld h,d			;a168
	ld h,d			;a169
	jr nc,la19ch		;a16a
	jr nc,la19eh		;a16c
	jr nc,la1a0h		;a16e
	jr nc,la1a4h		;a170
	ld (00000h),a		;a172
	nop			;a175
	nop			;a176
	nop			;a177
	nop			;a178
	nop			;a179
	nop			;a17a
	nop			;a17b
	nop			;a17c
	nop			;a17d
	nop			;a17e
	nop			;a17f
	nop			;a180
la181h:
	nop			;a181
	nop			;a182
la183h:
	nop			;a183
	nop			;a184
	nop			;a185
	nop			;a186
	nop			;a187
	nop			;a188
	nop			;a189
	nop			;a18a
	nop			;a18b
	nop			;a18c
la18dh:
	nop			;a18d
	nop			;a18e
	nop			;a18f
	nop			;a190
la191h:
	nop			;a191
la192h:
	nop			;a192
	nop			;a193
	add a,b			;a194
	ld b,e			;a195
	ld (bc),a		;a196
	ld b,b			;a197
	rlca			;a198
	call m,sub_b7dfh	;a199
la19ch:
	nop			;a19c
	ld l,d			;a19d
la19eh:
	cp d			;a19e
	defb 0edh ;next byte illegal after ed	;a19f
la1a0h:
	add a,b			;a1a0
	ld a,(hl)		;a1a1
	cp a			;a1a2
	nop			;a1a3
la1a4h:
	ei			;a1a4
	ld e,l			;a1a5
	halt			;a1a6
	ex (sp),hl		;a1a7
	ex (sp),hl		;a1a8
	rst 38h			;a1a9
	rst 18h			;a1aa
	rst 38h			;a1ab
	rst 38h			;a1ac
	ret p			;a1ad
	rlca			;a1ae
	cp e			;a1af
	ld l,b			;a1b0
	xor (hl)		;a1b1
	ld h,a			;a1b2
	ld l,d			;a1b3
	add hl,hl		;a1b4
	ld a,09ch		;a1b5
	call nz,03f18h		;a1b7
	jp c,lda5fh		;a1ba
	sbc a,h			;a1bd
	ld a,h			;a1be
	ld bc,l75bch		;a1bf
	ret nc			;a1c2
	inc a			;a1c3
	ld hl,(l701ch)		;a1c4
	ex (sp),hl		;a1c7
	ld a,(bc)		;a1c8
	dec sp			;a1c9
	adc a,h			;a1ca
	jp (hl)			;a1cb
	jp c,0421bh		;a1cc
	ld d,084h		;a1cf
	ld b,b			;a1d1
	rst 38h			;a1d2
	nop			;a1d3
	jr la183h		;a1d4
	ld c,09ch		;a1d6
	rlca			;a1d8
	defb 0fdh,0b8h,0f1h ;illegal sequence	;a1d9
	ret m			;a1dc
	ld d,l			;a1dd
	dec sp			;a1de
	defb 0edh ;next byte illegal after ed	;a1df
	exx			;a1e0
	call c,sub_97d0h	;a1e1
	dec hl			;a1e4
	push af			;a1e5
	or l			;a1e6
	ld d,l			;a1e7
	ld h,a			;a1e8
	ld a,a			;a1e9
	add a,b			;a1ea
	nop			;a1eb
	jr nz,$+70		;a1ec
	rst 20h			;a1ee
	add hl,sp		;a1ef
	ld c,(hl)		;a1f0
	ld d,b			;a1f1
	sub l			;a1f2
	nop			;a1f3
	ret nz			;a1f4
	nop			;a1f5
	inc a			;a1f6
	rra			;a1f7
	or b			;a1f8
	rrca			;a1f9
	inc bc			;a1fa
	inc b			;a1fb
	ld hl,07305h		;a1fc
	rra			;a1ff
	jp p,l8000h		;a200
	inc b			;a203
	nop			;a204
	ld hl,01e05h		;a205
	or b			;a208
	rrca			;a209
	add a,b			;a20a
	nop			;a20b
	jr c,la20fh		;a20c
	nop			;a20e
la20fh:
	nop			;a20f
	nop			;a210
	xor b			;a211
	nop			;a212
	ld (bc),a		;a213
	add a,a			;a214
	nop			;a215
	nop			;a216
	ld (hl),c		;a217
la218h:
	ld b,b			;a218
	ld bc,leaach		;a219
	ret nz			;a21c
	ld bc,0337ch		;a21d
	add a,b			;a220
	nop			;a221
	rrca			;a222
	jp p,lccf7h		;a223
	nop			;a226
	nop			;a227
	sbc a,e			;a228
	add a,c			;a229
	xor b			;a22a
	ld (bc),a		;a22b
	call p,00001h		;a22c
	rst 38h			;a22f
	rst 38h			;a230
	add a,038h		;a231
	jp po,007dfh		;a233
	jp lfe61h		;a236
	inc (hl)		;a239
	ld d,0d7h		;a23a
	djnz la294h		;a23c
	inc bc			;a23e
	add a,e			;a23f
	ei			;a240
	ld a,e			;a241
	ret po			;a242
	nop			;a243
	inc bc			;a244
	ld a,(de)		;a245
	nop			;a246
	inc b			;a247
	nop			;a248
	nop			;a249
	nop			;a24a
	nop			;a24b
	nop			;a24c
	nop			;a24d
	nop			;a24e
	nop			;a24f
	nop			;a250
	ld b,a			;a251
	nop			;a252
	ld a,(bc)		;a253
	ret p			;a254
	rlca			;a255
	ex (sp),hl		;a256
	pop af			;a257
	rst 38h			;a258
	ret p			;a259
	call pe,0077dh		;a25a
	ld a,b			;a25d
	nop			;a25e
	nop			;a25f
	dec e			;a260
	nop			;a261
	nop			;a262
	nop			;a263
la264h:
	jr c,la264h		;a264
	nop			;a266
	nop			;a267
	nop			;a268
	nop			;a269
	nop			;a26a
	nop			;a26b
	nop			;a26c
	nop			;a26d
	nop			;a26e
	nop			;a26f
	nop			;a270
	nop			;a271
	nop			;a272
	nop			;a273
	ret nz			;a274
	xor h			;a275
	jr nz,la218h		;a276
	nop			;a278
	nop			;a279
	rrca			;a27a
	add a,h			;a27b
	nop			;a27c
	ld d,l			;a27d
	ld d,l			;a27e
	ld e,d			;a27f
	nop			;a280
	dec a			;a281
	ret nz			;a282
	ld a,a			;a283
	ret po			;a284
	ld b,0fch		;a285
	nop			;a287
	nop			;a288
	daa			;a289
	add a,c			;a28a
	push af			;a28b
	ret nz			;a28c
	jr nc,la2c4h		;a28d
	ld e,l			;a28f
	push de			;a290
	ccf			;a291
	rlca			;a292
	rst 8			;a293
la294h:
	pop bc			;a294
	dec b			;a295
	add a,e			;a296
	ld b,b			;a297
	inc hl			;a298
	cp h			;a299
	add a,075h		;a29a
	ret nz			;a29c
	dec (hl)		;a29d
	ld d,l			;a29e
	ld d,(hl)		;a29f
	add a,b			;a2a0
	ld l,h			;a2a1
	jr nz,la2e4h		;a2a2
	ld e,(hl)		;a2a4
	ld e,l			;a2a5
	halt			;a2a6
	jp po,lff23h		;a2a7
	rst 0			;a2aa
	cp 0ffh			;a2ab
	ret m			;a2ad
	ld bc,l98feh		;a2ae
	call nc,sub_eadfh	;a2b1
	scf			;a2b4
	or (hl)			;a2b5
	nop			;a2b6
	ld h,b			;a2b7
	inc (hl)		;a2b8
	dec de			;a2b9
	ld (hl),0b2h		;a2ba
	ld h,(iy+07ch)		;a2bc
	rlca			;a2bf
	dec hl			;a2c0
	dec a			;a2c1
	and b			;a2c2
	ld a,(hl)		;a2c3
la2c4h:
	ld b,01ch		;a2c4
	ld d,b			;a2c6
	and d			;a2c7
	rrca			;a2c8
	add hl,sp		;a2c9
	rst 38h			;a2ca
	djnz la322h		;a2cb
	cp 0e7h			;a2cd
	add hl,sp		;a2cf
	adc a,040h		;a2d0
	sub l			;a2d2
	ld bc,le21bh		;a2d3
	adc a,01ch		;a2d6
	ex (sp),hl		;a2d8
	sbc a,l			;a2d9
	cp h			;a2da
	nop			;a2db
	nop			;a2dc
	dec hl			;a2dd
	jr c,la31ch		;a2de
	jp m,l94beh		;a2e0
	sbc a,e			;a2e3
la2e4h:
	inc hl			;a2e4
	rst 38h			;a2e5
	rst 38h			;a2e6
	cp (hl)			;a2e7
	ld d,e			;a2e8
	ld a,a			;a2e9
	add a,b			;a2ea
	jr nz,la30dh		;a2eb
	ld (bc),a		;a2ed
	defb 0fdh,0efh,0fbh ;illegal sequence	;a2ee
	ret nz			;a2f1
	sub l			;a2f2
	ld bc,00370h		;a2f3
	rst 28h			;a2f6
	rst 38h			;a2f7
	ld h,b			;a2f8
	rrca			;a2f9
	rrca			;a2fa
	ret po			;a2fb
	ld hl,03103h		;a2fc
	sbc a,e			;a2ff
	push hl			;a300
	nop			;a301
	ld h,b			;a302
	inc c			;a303
	ld b,b			;a304
	jp nz,l9b03h		;a305
	ld l,(hl)		;a308
	dec c			;a309
	and b			;a30a
	nop			;a30b
	ld e,h			;a30c
la30dh:
	ld bc,00000h		;a30d
	ld bc,0004eh		;a310
	ld bc,lc2cfh		;a313
	nop			;a316
	add hl,sp		;a317
	and b			;a318
	ld bc,lfed4h		;a319
la31ch:
	ld b,c			;a31c
	ld bc,led5bh		;a31d
	add a,b			;a320
	ld a,b			;a321
la322h:
	ld b,l			;a322
	ld a,d			;a323
	or l			;a324
	scf			;a325
	nop			;a326
	nop			;a327
	cp (hl)			;a328
	ld (hl),b		;a329
	adc a,b			;a32a
	ex af,af'		;a32b
	rst 28h			;a32c
	ld bc,00000h		;a32d
	nop			;a330
	ld h,b			;a331
	ld b,b			;a332
	dec b			;a333
	rst 30h			;a334
	sub c			;a335
	rst 20h			;a336
	jr nz,$+1		;a337
	ld (de),a		;a339
	call nz,010d5h		;a33a
	xor (hl)		;a33d
	nop			;a33e
	ld a,(hl)		;a33f
	rst 38h			;a340
	ei			;a341
	inc b			;a342
	ld (bc),a		;a343
	inc b			;a344
	ld d,b			;a345
	nop			;a346
	djnz la349h		;a347
la349h:
	nop			;a349
	nop			;a34a
	nop			;a34b
	nop			;a34c
	nop			;a34d
	nop			;a34e
	nop			;a34f
	cp 041h			;a350
	ret po			;a352
	dec d			;a353
	ld hl,l8fe3h		;a354
	ld e,h			;a357
	ret po			;a358
	ld a,b			;a359
	rra			;a35a
	sbc a,a			;a35b
	rra			;a35c
	ret po			;a35d
	nop			;a35e
	nop			;a35f
	rrca			;a360
	add a,b			;a361
	nop			;a362
	ld b,b			;a363
	ld c,060h		;a364
	nop			;a366
	nop			;a367
	nop			;a368
	nop			;a369
	nop			;a36a
	nop			;a36b
	nop			;a36c
	nop			;a36d
	ld b,07ch		;a36e
	exx			;a370
	ret po			;a371
	exx			;a372
	ld h,080h		;a373
	ld d,030h		;a375
	ret po			;a377
	jr la37ch		;a378
	rlca			;a37a
	ret nz			;a37b
la37ch:
	nop			;a37c
	xor d			;a37d
	xor d			;a37e
	or a			;a37f
	nop			;a380
	ld e,e			;a381
	ld h,a			;a382
	call m,01df8h		;a383
	and 003h		;a386
	ld (bc),a		;a388
	ld c,0c1h		;a389
	di			;a38b
	ret po			;a38c
	jr z,la3c2h		;a38d
	ld e,e			;a38f
	ld a,l			;a390
	ld h,e			;a391
	defb 0ddh,0f7h,047h ;illegal sequence	;a392
	jp nz,l6081h		;a395
	ld bc,l70beh		;a398
	sbc a,070h		;a39b
	ld a,(ladaah)		;a39d
la3a0h:
	jr nc,la3a0h		;a3a0
	ret nc			;a3a2
	ex af,af'		;a3a3
	ld hl,(l701ch)		;a3a4
	jp po,01f07h		;a3a7
	rst 38h			;a3aa
	adc a,e			;a3ab
	ex (sp),hl		;a3ac
	call p,sub_7400h	;a3ad
	ld (hl),b		;a3b0
la3b1h:
	ld a,l			;a3b1
	xor (hl)		;a3b2
	rst 18h			;a3b3
	ccf			;a3b4
	sub l			;a3b5
	ld bc,01c23h		;a3b6
	dec de			;a3b9
	dec l			;a3ba
	cpl			;a3bb
	ret m			;a3bc
	ei			;a3bd
	ld e,h			;a3be
	ld a,b			;a3bf
	ld d,l			;a3c0
	add hl,de		;a3c1
la3c2h:
	ret nz			;a3c2
	ld e,a			;a3c3
	ld (l701ch),hl		;a3c4
	ex (sp),hl		;a3c7
	rrca			;a3c8
	sbc a,c			;a3c9
	call z,03e3dh		;a3ca
	ld d,(hl)		;a3cd
	rst 38h			;a3ce
	rst 38h			;a3cf
	rst 38h			;a3d0
	ret nz			;a3d1
	sub l			;a3d2
	nop			;a3d3
	dec de			;a3d4
	ld c,a			;a3d5
	ld l,a			;a3d6
	cp e			;a3d7
	ei			;a3d8
	rst 0			;a3d9
	ld (hl),a		;a3da
	inc b			;a3db
	nop			;a3dc
	dec d			;a3dd
	ld a,b			;a3de
	ld d,00eh		;a3df
	call pe,09dd4h		;a3e1
	ld (07014h),hl		;a3e4
	and d			;a3e7
la3e8h:
	ld (hl),e		;a3e8
	pop de			;a3e9
	add a,d			;a3ea
	jr nz,la3edh		;a3eb
la3edh:
	dec b			;a3ed
	sbc a,0f5h		;a3ee
	ld d,l			;a3f0
	ld b,b			;a3f1
	sub l			;a3f2
	nop			;a3f3
	ld e,(hl)		;a3f4
	ld a,(hl)		;a3f5
	rst 30h			;a3f6
	ld (hl),e		;a3f7
	ret nz			;a3f8
	rrca			;a3f9
	dec de			;a3fa
	ld (hl),c		;a3fb
	ld hl,00305h		;a3fc
	rst 38h			;a3ff
	jp 00f0eh		;a400
	ld c,h			;a403
	ld h,c			;a404
	add a,d			;a405
	inc bc			;a406
	rrca			;a407
	ld e,00fh		;a408
	and b			;a40a
	ld a,(bc)		;a40b
	halt			;a40c
	ld bc,00000h		;a40d
	nop			;a410
	pop bc			;a411
	ret nz			;a412
	nop			;a413
	rst 28h			;a414
	ld h,c			;a415
	daa			;a416
	inc c			;a417
	pop hl			;a418
	ld bc,0575dh		;a419
	ld b,c			;a41c
	ld bc,lf62dh		;a41d
	inc bc			;a420
	or h			;a421
	ex (sp),hl		;a422
	or d			;a423
	ld a,l			;a424
	rst 30h			;a425
	inc b			;a426
	nop			;a427
	ld a,e			;a428
	dec a			;a429
	adc a,b			;a42a
	ld a,(bc)		;a42b
	ex (sp),hl		;a42c
	ld bc,00700h		;a42d
la430h:
	rst 38h			;a430
	ret c			;a431
	inc bc			;a432
	ld (bc),a		;a433
	rst 38h			;a434
	rst 18h			;a435
	rst 38h			;a436
	jr c,la430h		;a437
	sub d			;a439
	call p,00083h		;a43a
	halt			;a43d
	ld bc,00000h		;a43e
	nop			;a441
	nop			;a442
	nop			;a443
	ld c,0b4h		;a444
	inc b			;a446
	nop			;a447
	nop			;a448
	nop			;a449
	nop			;a44a
	nop			;a44b
	nop			;a44c
	nop			;a44d
	ld b,b			;a44e
	nop			;a44f
	nop			;a450
	ld l,h			;a451
	nop			;a452
	ld hl,(039e7h)		;a453
	ld a,077h		;a456
	dec bc			;a458
	ld c,000h		;a459
	ld (hl),c		;a45b
	ld a,b			;a45c
	jr nz,la45fh		;a45d
la45fh:
	ld a,h			;a45f
	rrca			;a460
	add a,c			;a461
	ret po			;a462
la463h:
	nop			;a463
	nop			;a464
	rrca			;a465
	rst 38h			;a466
	nop			;a467
	nop			;a468
	nop			;a469
	nop			;a46a
	ld bc,000ffh		;a46b
	nop			;a46e
	nop			;a46f
	nop			;a470
	nop			;a471
	ld (bc),a		;a472
	ld d,l			;a473
	add a,e			;a474
	ld a,(bc)		;a475
	jr la4d8h		;a476
	rra			;a478
	nop			;a479
	inc bc			;a47a
	and b			;a47b
	nop			;a47c
	push af			;a47d
	ld d,l			;a47e
	ld e,l			;a47f
	nop			;a480
	sub 01eh		;a481
	ei			;a483
	ld l,h			;a484
	ld a,(hl)		;a485
	ld a,e			;a486
la487h:
	dec b			;a487
	rlca			;a488
	ld c,0e1h		;a489
	out (0e0h),a		;a48b
	inc e			;a48d
	dec d			;a48e
	ld d,(hl)		;a48f
	cp d			;a490
	ld e,a			;a491
	ld h,a			;a492
	jr z,$+65		;a493
	pop af			;a495
	and c			;a496
	jr nc,la499h		;a497
la499h:
	rst 38h			;a499
	rst 38h			;a49a
	and a			;a49b
	call z,sub_f50fh	;a49c
	ld e,e			;a49f
	ld l,h			;a4a0
	cp 0a4h			;a4a1
	add hl,bc		;a4a3
	rla			;a4a4
	rst 38h			;a4a5
	rst 38h			;a4a6
	cp 033h			;a4a7
	add a,a			;a4a9
	rst 38h			;a4aa
	or 06dh			;a4ab
	call c,01f00h		;a4ad
	ret nz			;a4b0
	ld d,a			;a4b1
	ld d,h			;a4b2
	add hl,sp		;a4b3
	jr z,la463h		;a4b4
	ld b,e			;a4b6
	add a,a			;a4b7
	add a,b			;a4b8
	sbc a,a			;a4b9
	ld a,d			;a4ba
	ccf			;a4bb
	ld h,a			;a4bc
	jp (hl)			;a4bd
	jr la487h		;a4be
	sbc a,(hl)		;a4c0
	inc c			;a4c1
	and b			;a4c2
	adc a,e			;a4c3
	ld b,01ch		;a4c4
	ld d,b			;a4c6
	and d			;a4c7
	rra			;a4c8
	rst 18h			;a4c9
	rst 0			;a4ca
	inc bc			;a4cb
	ret nz			;a4cc
	ld hl,(ld7deh)		;a4cd
	or l			;a4d0
	ld b,b			;a4d1
	sub l			;a4d2
	ld bc,0511fh		;a4d3
	inc l			;a4d6
	ld sp,hl		;a4d7
la4d8h:
	pop bc			;a4d8
	ret			;a4d9
	dec e			;a4da
	inc b			;a4db
	ld bc,l782bh		;a4dc
	ret			;a4df
	rst 20h			;a4e0
	pop af			;a4e1
	sub h			;a4e2
	sbc a,a			;a4e3
	ld hl,(l701ch)		;a4e4
	ex (sp),hl		;a4e7
	add hl,hl		;a4e8
	jp (hl)			;a4e9
	add a,d			;a4ea
	jr nz,la50dh		;a4eb
	ld b,d			;a4ed
	cp a			;a4ee
	rst 28h			;a4ef
	ei			;a4f0
	ret nc			;a4f1
	sub l			;a4f2
	ld bc,sub_ff7fh		;a4f3
	sbc a,a			;a4f6
	ret nz			;a4f7
	nop			;a4f8
	ld b,a			;a4f9
	rra			;a4fa
	ld sp,hl		;a4fb
sub_a4fch:
	ld hl,00903h		;a4fc
	rst 38h			;a4ff
	defb 0fdh,003h,01eh ;illegal sequence	;a500
	ld a,b			;a503
	ld sp,000c6h		;a504
	jp z,l8f5bh		;a507
la50ah:
	add a,c			;a50a
	nop			;a50b
	ld a,(hl)		;a50c
la50dh:
	ld bc,00000h		;a50d
	ld bc,07f6ch		;a510
	pop bc			;a513
	rst 20h			;a514
	ex (sp),hl		;a515
	or a			;a516
	add a,b			;a517
	ld (hl),c		;a518
	add a,c			;a519
	xor e			;a51a
	ld e,a			;a51b
	ld d,b			;a51c
	ld de,lae7bh		;a51d
	rrca			;a520
	rst 20h			;a521
	jr c,la533h		;a522
	ld e,d			;a524
	rst 28h			;a525
	nop			;a526
	nop			;a527
	inc hl			;a528
	jp po,00280h		;a529
	ex de,hl		;a52c
	ld bc,00000h		;a52d
	nop			;a530
	ld c,(hl)		;a531
	nop			;a532
la533h:
	dec b			;a533
	rst 38h			;a534
	rst 38h			;a535
	adc a,03eh		;a536
	ei			;a538
	jp nz,02376h		;a539
	inc b			;a53c
	xor h			;a53d
	nop			;a53e
	nop			;a53f
	nop			;a540
	nop			;a541
	nop			;a542
	djnz la55ch		;a543
	ld c,(hl)		;a545
	nop			;a546
	ld bc,00000h		;a547
	nop			;a54a
	nop			;a54b
	nop			;a54c
	inc b			;a54d
	djnz la550h		;a54e
la550h:
	nop			;a550
	jr $+110		;a551
	ld d,l			;a553
	call sub_6acch		;a554
	defb 0fdh,09dh ;sbc a,iyl	;a557
	ex (sp),hl		;a559
	inc b			;a55a
	ccf			;a55b
la55ch:
	ret nz			;a55c
	nop			;a55d
	nop			;a55e
	nop			;a55f
	inc bc			;a560
	ret nz			;a561
	nop			;a562
	inc b			;a563
	ex af,af'		;a564
	ld b,b			;a565
	nop			;a566
	rst 38h			;a567
	rlca			;a568
	ld b,0aah		;a569
	nop			;a56b
	djnz la56eh		;a56c
la56eh:
	djnz la570h		;a56e
la570h:
	nop			;a570
	nop			;a571
	ld (bc),a		;a572
	ld (hl),l		;a573
	add a,e			;a574
	or (hl)			;a575
	inc c			;a576
	ld (hl),b		;a577
sub_a578h:
	dec e			;a578
	ret nz			;a579
	jp 000d0h		;a57a
	ld l,d			;a57d
	xor d			;a57e
	cp e			;a57f
	nop			;a580
	xor (hl)		;a581
	defb 0fdh,0d5h,0beh ;illegal sequence	;a582
	di			;a585
	defb 0fdh,0c3h,08fh ;illegal sequence	;a586
	add a,a			;a589
	ld a,e			;a58a
	call m,016f0h		;a58b
	rra			;a58e
	ld a,l			;a58f
	call pe,sub_8b7fh	;a590
	ld b,e			;a593
	dec sp			;a594
	call c,018a1h		;a595
	add a,b			;a598
	rst 20h			;a599
	cp 0cfh			;a59a
	rst 38h			;a59c
	ld bc,lb57ah		;a59d
	ld d,(hl)		;a5a0
	or (hl)			;a5a1
	call nz,00b41h		;a5a2
	rst 38h			;a5a5
	call m,00b00h		;a5a6
	ei			;a5a9
	rst 8			;a5aa
	add a,(hl)		;a5ab
	ld a,07ah		;a5ac
	nop			;a5ae
	ld c,000h		;a5af
	dec hl			;a5b1
	jp pe,lbdf8h		;a5b2
	adc a,h			;a5b5
	ld (hl),a		;a5b6
	rlca			;a5b7
	ld h,b			;a5b8
	ccf			;a5b9
	ld l,e			;a5ba
	ld a,h			;a5bb
	ld d,b			;a5bc
	call c,sub_b8b9h	;a5bd
	dec hl			;a5c0
	add a,a			;a5c1
	ret nz			;a5c2
	adc a,e			;a5c3
	ld (l701ch),hl		;a5c4
	ex (sp),hl		;a5c7
	rra			;a5c8
	sbc a,a			;a5c9
	add a,d			;a5ca
	nop			;a5cb
	nop			;a5cc
	inc d			;a5cd
	cp l			;a5ce
	rst 28h			;a5cf
	ld a,e			;a5d0
	ret nz			;a5d1
	sub l			;a5d2
	nop			;a5d3
	ld b,029h		;a5d4
	jr c,la613h		;a5d6
	nop			;a5d8
	rst 20h			;a5d9
	ld b,080h		;a5da
	ld bc,03815h		;a5dc
	ex (sp),hl		;a5df
	jp z,l8402h		;a5e0
	cp e			;a5e3
	ld hl,(07014h)		;a5e4
	jp po,0e914h		;a5e7
	add a,d			;a5ea
	jr nz,la61dh		;a5eb
	ld b,h			;a5ed
	rst 20h			;a5ee
	add hl,sp		;a5ef
	ld c,(hl)		;a5f0
	ret nc			;a5f1
	sbc a,a			;a5f2
	ld (bc),a		;a5f3
	inc bc			;a5f4
	xor a			;a5f5
	ld b,000h		;a5f6
	nop			;a5f8
	ld h,a			;a5f9
	ld a,l			;a5fa
	ld sp,hl		;a5fb
	and b			;a5fc
	dec b			;a5fd
	call po,0f16fh		;a5fe
	ld bc,03edch		;a601
	dec h			;a604
	cp a			;a605
	nop			;a606
	dec b			;a607
	or d			;a608
	adc a,a			;a609
	xor b			;a60a
	ld c,b			;a60b
	ld h,(hl)		;a60c
	ld bc,l8100h		;a60d
	nop			;a610
	ret nc			;a611
	nop			;a612
la613h:
	nop			;a613
	rst 30h			;a614
	di			;a615
	sub e			;a616
	ret nz			;a617
	jr $-61			;a618
	rst 8			;a61a
	adc a,l			;a61b
	ld d,b			;a61c
la61dh:
	ld de,lbc7fh		;a61d
	or 0f0h			;a620
	rst 0			;a622
	add hl,bc		;a623
	dec l			;a624
	jp c,00000h		;a625
	ld a,(de)		;a628
	ret			;a629
	ld (hl),c		;a62a
	nop			;a62b
	or e			;a62c
	ld c,000h		;a62d
	nop			;a62f
	ccf			;a630
	jp 0026ch		;a631
	cp a			;a634
	rst 38h			;a635
	ccf			;a636
	cp a			;a637
	pop af			;a638
	jp po,02fd7h		;a639
	inc b			;a63c
	ld d,h			;a63d
	nop			;a63e
	nop			;a63f
	nop			;a640
	nop			;a641
	nop			;a642
	and b			;a643
	ld (de),a		;a644
	sbc a,a			;a645
	nop			;a646
	nop			;a647
	djnz la64ah		;a648
la64ah:
	nop			;a64a
	nop			;a64b
	nop			;a64c
	jr nz,la64fh		;a64d
la64fh:
	nop			;a64f
	inc l			;a650
	add a,a			;a651
	nop			;a652
	xor d			;a653
	sbc a,a			;a654
	exx			;a655
	sbc a,l			;a656
	ld l,(hl)		;a657
	ld (hl),a		;a658
	cp b			;a659
	nop			;a65a
	nop			;a65b
	ex af,af'		;a65c
	nop			;a65d
	add a,b			;a65e
	inc b			;a65f
	ld bc,000e0h		;a660
	nop			;a663
	nop			;a664
	nop			;a665
	nop			;a666
	nop			;a667
	ex de,hl		;a668
	add a,b			;a669
	nop			;a66a
	nop			;a66b
	nop			;a66c
	nop			;a66d
	nop			;a66e
	ld (hl),b		;a66f
	ld hl,l61f3h		;a670
	ld d,l			;a673
	cp b			;a674
	call c,02818h		;a675
	dec c			;a678
	pop hl			;a679
	pop hl			;a67a
	sbc a,b			;a67b
	nop			;a67c
	ld (hl),l		;a67d
	ld a,a			;a67e
	ld l,(hl)		;a67f
	add a,b			;a680
	call pe,sub_f4b7h	;a681
	jp pe,03f6eh		;a684
	rst 20h			;a687
	rst 8			;a688
la689h:
	add a,e			;a689
	ld a,a			;a68a
	rst 38h			;a68b
	ret m			;a68c
	ld c,00bh		;a68d
	dec e			;a68f
	call nz,sub_77e6h	;a690
	rst 20h			;a693
	ld (hl),a		;a694
	rst 28h			;a695
	ld sp,0e048h		;a696
	rst 38h			;a699
	defb 0fdh,0dbh,0f3h ;illegal sequence	;a69a
	add a,c			;a69d
	sub l			;a69e
	ld l,e			;a69f
	cp c			;a6a0
	ld h,h			;a6a1
	and b			;a6a2
	ld b,b			;a6a3
	daa			;a6a4
	rst 38h			;a6a5
	ret po			;a6a6
	xor d			;a6a7
	dec h			;a6a8
	rst 0			;a6a9
	cp a			;a6aa
	cp e			;a6ab
	dec a			;a6ac
	adc a,(hl)		;a6ad
	nop			;a6ae
	ld a,(bc)		;a6af
	nop			;a6b0
	ld e,a			;a6b1
	ld a,a			;a6b2
	rla			;a6b3
	dec hl			;a6b4
	ld l,e			;a6b5
	ld a,a			;a6b6
	ld a,a			;a6b7
	ld (hl),h		;a6b8
	ccf			;a6b9
	inc d			;a6ba
	ld l,c			;a6bb
	cp a			;a6bc
	adc a,(hl)		;a6bd
	cp e			;a6be
	xor (hl)		;a6bf
	call z,0a086h		;a6c0
	adc a,l			;a6c3
	ld h,01ch		;a6c4
	ld d,b			;a6c6
	and d			;a6c7
	rra			;a6c8
	adc a,a			;a6c9
	add a,d			;a6ca
	jr nz,la6cdh		;a6cb
la6cdh:
	ld a,(bc)		;a6cd
sub_a6ceh:
	rst 20h			;a6ce
	add hl,sp		;a6cf
	adc a,040h		;a6d0
	sub l			;a6d2
	ld bc,00703h		;a6d3
	nop			;a6d6
	nop			;a6d7
	inc e			;a6d8
	ld (hl),e		;a6d9
	ld bc,001c4h		;a6da
	dec bc			;a6dd
	jr z,la753h		;a6de
	call po,sub_7405h	;a6e0
	xor l			;a6e3
	ld l,01ch		;a6e4
	ld (hl),b		;a6e6
	and e			;a6e7
	inc c			;a6e8
	dec (hl)		;a6e9
	add a,d			;a6ea
	nop			;a6eb
	ld l,b			;a6ec
	ld (bc),a		;a6ed
	rst 20h			;a6ee
	add hl,sp		;a6ef
	bit 0,b			;a6f0
	and l			;a6f2
	ld bc,03c00h		;a6f3
	nop			;a6f6
	ld a,(bc)		;a6f7
	nop			;a6f8
	ld d,e			;a6f9
	ld a,a			;a6fa
	sbc a,h			;a6fb
	and b			;a6fc
	inc bc			;a6fd
	ld (lc77fh),a		;a6fe
	ld bc,01be8h		;a701
	ld a,d			;a704
	rst 30h			;a705
	nop			;a706
	inc bc			;a707
	jp pe,la88fh		;a708
	ld c,d			;a70b
	or (hl)			;a70c
	ld bc,00000h		;a70d
	ld bc,05958h		;a710
	ld bc,l7bfeh		;a713
	sbc a,e			;a716
	jp l6200h		;a717
	call nc,000b7h		;a71a
	inc bc			;a71d
	ld a,a			;a71e
	ei			;a71f
	ex de,hl		;a720
	rst 38h			;a721
	ld l,l			;a722
	adc a,b			;a723
	ld d,0b6h		;a724
	rra			;a726
	rst 38h			;a727
	ld bc,lae06h		;a728
	nop			;a72b
	xor 0f0h		;a72c
	ld (bc),a		;a72e
	nop			;a72f
	nop			;a730
	ld b,b			;a731
	nop			;a732
	dec b			;a733
	ld a,a			;a734
	cp c			;a735
	rst 8			;a736
	rst 38h			;a737
	call p,sub_e4e2h	;a738
	ld (hl),l		;a73b
	djnz la794h		;a73c
	nop			;a73e
	inc b			;a73f
	nop			;a740
	add a,d			;a741
	ld bc,038c2h		;a742
	add a,c			;a745
	inc bc			;a746
	rst 38h			;a747
	nop			;a748
	nop			;a749
	dec d			;a74a
	rst 38h			;a74b
	rst 38h			;a74c
	nop			;a74d
	ld a,a			;a74e
	ret p			;a74f
	nop			;a750
	nop			;a751
	pop hl			;a752
la753h:
	ld d,l			;a753
	jr c,$-63		;a754
	ld (hl),e		;a756
	call pe,sub_eedeh	;a757
	nop			;a75a
	nop			;a75b
	nop			;a75c
	nop			;a75d
	nop			;a75e
	nop			;a75f
	ex af,af'		;a760
	ret p			;a761
	nop			;a762
	nop			;a763
	nop			;a764
	nop			;a765
	nop			;a766
	nop			;a767
	rlca			;a768
	ret nz			;a769
	nop			;a76a
	nop			;a76b
	nop			;a76c
	nop			;a76d
	nop			;a76e
	nop			;a76f
	nop			;a770
	nop			;a771
	ld (bc),a		;a772
	ld d,(hl)		;a773
	ld c,l			;a774
	ld b,h			;a775
	nop			;a776
	djnz la788h		;a777
	ld (hl),c		;a779
	di			;a77a
	cp (hl)			;a77b
	nop			;a77c
	ld l,d			;a77d
	sub 0dbh		;a77e
	add a,b			;a780
	call c,sub_aeefh	;a781
	cp a			;a784
	ld a,a			;a785
	rst 38h			;a786
	push af			;a787
la788h:
	rst 28h			;a788
	jp lcfffh		;a789
	defb 0fdh,006h,00bh ;illegal sequence	;a78c
	or l			;a78f
	call nc,sub_8cc8h	;a790
	xor l			;a793
la794h:
	rst 38h			;a794
	rst 38h			;a795
	sub e			;a796
	jr z,$+114		;a797
	ld a,a			;a799
	dec sp			;a79a
	sub l			;a79b
	sbc a,l			;a79c
	ret po			;a79d
	ld (hl),a		;a79e
	or (hl)			;a79f
	xor (hl)		;a7a0
	ld a,a			;a7a1
	call nc,02b41h		;a7a2
	rst 38h			;a7a5
	push af			;a7a6
	ld d,l			;a7a7
	ld (hl),0e1h		;a7a8
	cp a			;a7aa
	call z,sub_c396h	;a7ab
	nop			;a7ae
	ld c,000h		;a7af
	ld l,d			;a7b1
	xor l			;a7b2
	call c,sub_be12h	;a7b3
	rst 30h			;a7b6
	rst 30h			;a7b7
	ld a,d			;a7b8
	dec a			;a7b9
	ld sp,hl		;a7ba
	sbc a,c			;a7bb
	or 0fdh			;a7bc
	xor d			;a7be
	ld a,e			;a7bf
	sub a			;a7c0
	jp nz,l8fc0h		;a7c1
	ld (bc),a		;a7c4
	inc e			;a7c5
	ld (hl),b		;a7c6
	jp po,lff9fh		;a7c7
	add a,b			;a7ca
	jr nz,la7cdh		;a7cb
la7cdh:
	inc b			;a7cd
	rst 20h			;a7ce
	add hl,hl		;a7cf
	ld c,d			;a7d0
	ld b,b			;a7d1
	cp a			;a7d2
	nop			;a7d3
	rlca			;a7d4
	ret p			;a7d5
	nop			;a7d6
	nop			;a7d7
	rst 30h			;a7d8
	ld d,000h		;a7d9
	inc b			;a7db
	ld bc,03005h		;a7dc
	halt			;a7df
	sbc a,d			;a7e0
	ld a,(bc)		;a7e1
	xor (hl)		;a7e2
	xor a			;a7e3
	ld (hl),b		;a7e4
	inc d			;a7e5
	ld (hl),b		;a7e6
	ld h,d			;a7e7
	add a,(hl)		;a7e8
	add hl,de		;a7e9
	add a,b			;a7ea
	nop			;a7eb
	add a,h			;a7ec
	ld b,b			;a7ed
	push hl			;a7ee
	add hl,sp		;a7ef
	adc a,0a0h		;a7f0
	pop bc			;a7f2
	ld (bc),a		;a7f3
	add a,b			;a7f4
	nop			;a7f5
	ld bc,00005h		;a7f6
	add hl,sp		;a7f9
	ex de,hl		;a7fa
	ld (hl),h		;a7fb
	and b			;a7fc
	ld bc,03f5dh		;a7fd
	xor e			;a800
	nop			;a801
sub_a802h:
	push af			;a802
	dec b			;a803
	rla			;a804
	or h			;a805
	nop			;a806
	ld bc,lc77ah		;a807
	add a,b			;a80a
	ld (bc),a		;a80b
	cp (hl)			;a80c
	ld bc,00000h		;a80d
	ld a,(bc)		;a810
	rst 8			;a811
	nop			;a812
	ld (bc),a		;a813
	cp 03fh			;a814
	add a,c			;a816
	jp nz,l62c0h		;a817
	or d			;a81a
	adc a,e			;a81b
	ld de,lbf02h		;a81c
	rst 30h			;a81f
	defb 0fdh,0bfh,0f6h ;illegal sequence	;a820
	ret nz			;a823
	dec de			;a824
	call nc,00000h		;a825
la828h:
	dec d			;a828
	push de			;a829
	ld d,l			;a82a
	ret nz			;a82b
	rst 18h			;a82c
	nop			;a82d
	djnz $-126		;a82e
	nop			;a830
	ld h,b			;a831
	dec a			;a832
	adc a,d			;a833
	rlca			;a834
	ld c,a			;a835
	rst 30h			;a836
	rra			;a837
	di			;a838
	ld (hl),d		;a839
	ret nz			;a83a
	ld a,c			;a83b
	djnz la828h		;a83c
	nop			;a83e
	nop			;a83f
	jr la842h		;a840
la842h:
	inc bc			;a842
	add a,b			;a843
	ld (00015h),a		;a844
	nop			;a847
	nop			;a848
	inc b			;a849
la84ah:
	xor d			;a84a
	xor d			;a84b
	djnz la84eh		;a84c
la84eh:
	nop			;a84e
	nop			;a84f
	ld a,a			;a850
	ld h,01fh		;a851
	jp pe,lcf61h		;a853
	rst 38h			;a856
	di			;a857
	jp m,000fdh		;a858
	jr nz,la85dh		;a85b
la85dh:
	nop			;a85d
	nop			;a85e
	nop			;a85f
	inc d			;a860
	nop			;a861
	nop			;a862
	nop			;a863
	nop			;a864
	nop			;a865
	nop			;a866
	nop			;a867
	nop			;a868
	nop			;a869
	nop			;a86a
	nop			;a86b
	nop			;a86c
	nop			;a86d
	nop			;a86e
	nop			;a86f
	nop			;a870
	ld bc,00050h		;a871
	ld b,b			;a874
	and l			;a875
	dec b			;a876
	ret nc			;a877
	rlca			;a878
	add hl,sp		;a879
	ei			;a87a
	rst 28h			;a87b
	nop			;a87c
	ld d,l			;a87d
	ld a,l			;a87e
	or (hl)			;a87f
	add a,b			;a880
	ld l,l			;a881
	jp c,005fdh		;a882
	ld h,e			;a885
	adc a,a			;a886
	inc de			;a887
	rst 20h			;a888
	rst 30h			;a889
	rst 38h			;a88a
	rst 20h			;a88b
	rst 38h			;a88c
	or d			;a88d
	inc c			;a88e
la88fh:
	and l			;a88f
	inc a			;a890
	in a,(03bh)		;a891
	dec bc			;a893
	ex de,hl		;a894
	ld d,(iy-054h)		;a895
	jr nc,la919h		;a898
	xor a			;a89a
	jr z,$+57		;a89b
	jr nc,$-80		;a89d
	cp h			;a89f
	di			;a8a0
	dec h			;a8a1
	and h			;a8a2
	nop			;a8a3
	daa			;a8a4
	rst 38h			;a8a5
	rst 38h			;a8a6
	cp (hl)			;a8a7
	ld a,(de)		;a8a8
	ld (hl),a		;a8a9
	cp e			;a8aa
	jp c,0399eh		;a8ab
	nop			;a8ae
	ld c,000h		;a8af
	ld d,l			;a8b1
	ld d,l			;a8b2
	ld a,a			;a8b3
	ld e,042h		;a8b4
	rla			;a8b6
	ld l,(hl)		;a8b7
	rla			;a8b8
	defb 0fdh,0cfh,01eh ;illegal sequence	;a8b9
	in a,(0ebh)		;a8bc
	ld a,(lf33dh+1)		;a8be
	ld (hl),b		;a8c1
	add a,b			;a8c2
	sbc a,l			;a8c3
	inc bc			;a8c4
	rst 38h			;a8c5
	rst 18h			;a8c6
	cp (hl)			;a8c7
	ld c,a			;a8c8
	rst 38h			;a8c9
	add a,b			;a8ca
	nop			;a8cb
	nop			;a8cc
	ld c,d			;a8cd
	rst 20h			;a8ce
	add hl,sp		;a8cf
	adc a,050h		;a8d0
	sub l			;a8d2
	ld bc,08083h		;a8d3
	nop			;a8d6
	nop			;a8d7
la8d8h:
	call m,0000bh		;a8d8
	inc b			;a8db
	ld hl,0560bh		;a8dc
	dec sp			;a8df
	cp c			;a8e0
	ld d,l			;a8e1
	ld d,l			;a8e2
	rst 38h			;a8e3
	add a,b			;a8e4
	inc e			;a8e5
	ld a,d			;a8e6
	cp c			;a8e7
	ld b,e			;a8e8
	sbc a,c			;a8e9
	add a,b			;a8ea
	nop			;a8eb
	nop			;a8ec
	ld (bc),a		;a8ed
	rst 20h			;a8ee
	add hl,sp		;a8ef
	call sub_ff70h		;a8f0
	ld bc,0008ch		;a8f3
	ld bc,l80c3h		;a8f6
	add hl,bc		;a8f9
	rst 38h			;a8fa
	xor h			;a8fb
	add a,b			;a8fc
	inc bc			;a8fd
	ld h,a			;a8fe
	rst 18h			;a8ff
	rst 18h			;a900
	ld bc,lc210h		;a901
	rrca			;a904
	rst 28h			;a905
	nop			;a906
	jr c,la8d8h		;a907
	add a,e			;a909
	and b			;a90a
	ld (bc),a		;a90b
	call m,00001h		;a90c
	nop			;a90f
	ld d,l			;a910
	ld b,c			;a911
	ret nz			;a912
	ld bc,01f3fh		;a913
	pop bc			;a916
	pop hl			;a917
	ld a,h			;a918
la919h:
	ld (lb7d7h),hl		;a919
	ld de,lff12h		;a91c
	rst 28h			;a91f
	defb 0fdh,0ffh,0f7h ;illegal sequence	;a920
	ret po			;a923
	rrca			;a924
	ret p			;a925
	nop			;a926
	nop			;a927
	ex af,af'		;a928
	xor d			;a929
	xor d			;a92a
	cp a			;a92b
	ret p			;a92c
	nop			;a92d
	nop			;a92e
	nop			;a92f
	nop			;a930
	ld a,h			;a931
	nop			;a932
	dec d			;a933
	defb 0ddh,0fah,058h ;illegal sequence	;a934
	rst 0			;a937
	rst 38h			;a938
	di			;a939
	inc (hl)		;a93a
	defb 0fdh,001h,0ach ;illegal sequence	;a93b
	ex af,af'		;a93e
	add a,b			;a93f
	dec e			;a940
	nop			;a941
	rlca			;a942
	nop			;a943
	ld b,b			;a944
	ld h,l			;a945
	nop			;a946
	nop			;a947
	nop			;a948
	add hl,de		;a949
	ld d,l			;a94a
	ld b,b			;a94b
	nop			;a94c
	inc b			;a94d
	nop			;a94e
	nop			;a94f
	nop			;a950
	nop			;a951
	nop			;a952
	rra			;a953
	rst 38h			;a954
	rst 38h			;a955
	rst 38h			;a956
	rst 38h			;a957
	rst 38h			;a958
	rst 38h			;a959
	rst 38h			;a95a
	rst 38h			;a95b
	rst 38h			;a95c
	rst 38h			;a95d
	rst 38h			;a95e
	rst 38h			;a95f
la960h:
	rst 38h			;a960
	rst 38h			;a961
	rst 38h			;a962
	rst 38h			;a963
	rst 38h			;a964
	rst 38h			;a965
	rst 38h			;a966
	rst 38h			;a967
	rst 38h			;a968
	rst 38h			;a969
	rst 38h			;a96a
	rst 38h			;a96b
	rst 38h			;a96c
la96dh:
	rst 38h			;a96d
	rst 38h			;a96e
	rst 38h			;a96f
	rst 38h			;a970
	rst 38h			;a971
	rst 38h			;a972
	rst 38h			;a973
	ld (03872h),a		;a974
	jr c,la9ebh		;a977
	ld (hl),d		;a979
	ld (hl),d		;a97a
	ld (hl),d		;a97b
	ld a,(03c3ch)		;a97c
	inc a			;a97f
	inc a			;a980
	ld (hl),d		;a981
	ld (hl),d		;a982
	jr c,$+58		;a983
	jr c,$+58		;a985
	jr c,la9fbh		;a987
	ld (hl),d		;a989
	ld (hl),d		;a98a
	ld (hl),d		;a98b
	ld (hl),d		;a98c
	ld (hl),d		;a98d
	inc a			;a98e
	inc a			;a98f
	inc a			;a990
	ld a,(03a3ah)		;a991
	jr c,la9ceh		;a994
	ld (hl),d		;a996
	jr c,laa0bh		;a997
	ld (hl),d		;a999
	ld (hl),d		;a99a
	jr c,la9d5h		;a99b
	inc a			;a99d
la99eh:
	inc a			;a99e
	inc a			;a99f
	ld a,(02072h)		;a9a0
	jr nz,$+34		;a9a3
	ld a,(03a3ah)		;a9a5
	ld (hl),d		;a9a8
	ld (hl),d		;a9a9
	ld (hl),d		;a9aa
	jr c,$+58		;a9ab
	ld (hl),d		;a9ad
	inc a			;a9ae
	ld a,(03a3ch)		;a9af
	ld a,(l723ah)		;a9b2
	ld (hl),d		;a9b5
	ld (hl),d		;a9b6
	ld (l7272h),a		;a9b7
	jr c,$+58		;a9ba
	jr c,la9f6h		;a9bc
	ld a,(02828h)		;a9be
	ld (hl),d		;a9c1
	ld h,b			;a9c2
	ld (03a20h),hl		;a9c3
	ld a,(l723ah)		;a9c6
	ld (hl),d		;a9c9
	ld h,d			;a9ca
	ld h,d			;a9cb
	jr nz,la9eeh		;a9cc
la9ceh:
	ld a,(03a3ah)		;a9ce
	jr nz,$+22		;a9d1
	jr nz,laa47h		;a9d3
la9d5h:
	ld (hl),d		;a9d5
	ld (hl),d		;a9d6
	ld (hl),d		;a9d7
	ld (hl),d		;a9d8
	ld (hl),d		;a9d9
	jr z,laa04h		;a9da
	jr z,laa38h		;a9dc
	ld a,(03c3ch)		;a9de
	inc a			;a9e1
	ld h,b			;a9e2
	ld a,(03a20h)		;a9e3
	ld a,(l723ah)		;a9e6
	ld (hl),d		;a9e9
	ld h,b			;a9ea
la9ebh:
	ld h,d			;a9eb
	jr nz,$+34		;a9ec
la9eeh:
	ld a,(03a3ah)		;a9ee
	ld h,b			;a9f1
	inc d			;a9f2
	jr nz,$+116		;a9f3
	ld (hl),d		;a9f5
la9f6h:
	ld (hl),d		;a9f6
	ld (hl),d		;a9f7
	ld (hl),d		;a9f8
	ld (hl),d		;a9f9
	dec hl			;a9fa
la9fbh:
	inc hl			;a9fb
	jr z,$+92		;a9fc
	inc a			;a9fe
	inc a			;a9ff
	inc a			;aa00
sub_aa01h:
	ld h,d			;aa01
	inc sp			;aa02
	inc sp			;aa03
laa04h:
	jr nc,laa36h		;aa04
	jr nc,$+52		;aa06
laa08h:
	ld (l6072h),a		;aa08
laa0bh:
	ld h,b			;aa0b
	ld a,(03020h)		;aa0c
	jr nc,$+50		;aa0f
	ld h,b			;aa11
	ld h,b			;aa12
	jr nz,laa87h		;aa13
	ld (hl),d		;aa15
	ld (hl),d		;aa16
	ld (hl),d		;aa17
	ld (hl),d		;aa18
	ld (hl),d		;aa19
	inc hl			;aa1a
	inc hl			;aa1b
	jr z,laa78h		;aa1c
	jr c,$+58		;aa1e
	ld h,d			;aa20
	ld h,d			;aa21
	ld h,d			;aa22
	ld (03030h),a		;aa23
	jr nc,$+50		;aa26
	jr nc,$+50		;aa28
laa2ah:
	ld h,b			;aa2a
	ld h,b			;aa2b
	ld (03020h),a		;aa2c
	jr nc,$+50		;aa2f
	ld h,b			;aa31
	ld h,b			;aa32
	jr nz,laaa7h		;aa33
	ld (hl),d		;aa35
laa36h:
	ld (hl),d		;aa36
	ld (hl),d		;aa37
laa38h:
	ld (hl),d		;aa38
	jr c,laa5eh		;aa39
	inc hl			;aa3b
	jr z,$+53		;aa3c
	jr nc,laa70h		;aa3e
	jr nc,laa72h		;aa40
	jr nc,laa74h		;aa42
	ld (03032h),a		;aa44
laa47h:
	jr nc,laa79h		;aa47
	jr nc,laa7bh		;aa49
	jr nc,laa7dh		;aa4b
	jr nc,laa7fh		;aa4d
	jr nc,laa81h		;aa4f
	ld h,b			;aa51
	ld h,b			;aa52
	jr nz,laa8dh		;aa53
	jr c,laa89h		;aa55
	jr c,laa8bh		;aa57
	ld (03030h),a		;aa59
	jr nc,laa8eh		;aa5c
laa5eh:
	jr nc,laa90h		;aa5e
	jr nc,laa92h		;aa60
	jr nc,laa94h		;aa62
	jr nc,$+50		;aa64
	jr nc,laa98h		;aa66
	jr nc,laa9ah		;aa68
	jr nc,laa9ch		;aa6a
	jr nc,laa9eh		;aa6c
	jr nc,laaa0h		;aa6e
laa70h:
	jr nc,laaa2h		;aa70
laa72h:
	jr nc,laaa4h		;aa72
laa74h:
	nop			;aa74
laa75h:
	nop			;aa75
	nop			;aa76
	nop			;aa77
laa78h:
	nop			;aa78
laa79h:
	nop			;aa79
	nop			;aa7a
laa7bh:
	nop			;aa7b
	nop			;aa7c
laa7dh:
	nop			;aa7d
	nop			;aa7e
laa7fh:
	nop			;aa7f
laa80h:
	nop			;aa80
laa81h:
	nop			;aa81
	nop			;aa82
	nop			;aa83
	nop			;aa84
	nop			;aa85
	nop			;aa86
laa87h:
	nop			;aa87
	nop			;aa88
laa89h:
	nop			;aa89
	nop			;aa8a
laa8bh:
	nop			;aa8b
	nop			;aa8c
laa8dh:
	nop			;aa8d
laa8eh:
	nop			;aa8e
	nop			;aa8f
laa90h:
	nop			;aa90
	nop			;aa91
laa92h:
	nop			;aa92
	nop			;aa93
laa94h:
	nop			;aa94
	jr laa9bh		;aa95
	nop			;aa97
laa98h:
	nop			;aa98
	nop			;aa99
laa9ah:
	dec hl			;aa9a
laa9bh:
	ld (bc),a		;aa9b
laa9ch:
	ret po			;aa9c
	nop			;aa9d
laa9eh:
	ld b,l			;aa9e
	ld d,d			;aa9f
laaa0h:
	xor d			;aaa0
laaa1h:
	xor a			;aaa1
laaa2h:
	cp 000h			;aaa2
laaa4h:
	nop			;aaa4
	inc bc			;aaa5
	push af			;aaa6
laaa7h:
	or 0bfh			;aaa7
	rst 38h			;aaa9
laaaah:
	rst 38h			;aaaa
	ld d,l			;aaab
	ld e,a			;aaac
	jp m,le3ffh		;aaad
	rst 38h			;aab0
	add a,e			;aab1
	ld e,b			;aab2
	rrca			;aab3
	ld d,l			;aab4
	xor h			;aab5
	add hl,bc		;aab6
	add a,b			;aab7
	ld (bc),a		;aab8
	inc sp			;aab9
laabah:
	nop			;aaba
	add a,h			;aabb
	ld (hl),c		;aabc
	ld d,c			;aabd
	add a,b			;aabe
	ld (bc),a		;aabf
	ret nz			;aac0
	ret po			;aac1
	nop			;aac2
	nop			;aac3
	nop			;aac4
	nop			;aac5
	nop			;aac6
	nop			;aac7
	nop			;aac8
	nop			;aac9
	nop			;aaca
	nop			;aacb
	nop			;aacc
	nop			;aacd
	ld bc,laaeah		;aace
	ld c,d			;aad1
	cp l			;aad2
	ld a,d			;aad3
	dec hl			;aad4
laad5h:
	ld hl,(lb002h)		;aad5
	ld e,d			;aad8
sub_aad9h:
	inc b			;aad9
	ld d,l			;aada
	sub 0eeh		;aadb
	ld (hl),b		;aadd
	call z,sub_8f63h	;aade
	rst 38h			;aae1
	defb 0fdh,0a0h,0aah ;illegal sequence	;aae2
	or a			;aae5
	and 0aah		;aae6
	xor d			;aae8
	and e			;aae9
laaeah:
	adc a,b			;aaea
	ccf			;aaeb
	rst 38h			;aaec
	ei			;aaed
laaeeh:
	cp a			;aaee
	sbc a,a			;aaef
	rst 38h			;aaf0
	inc b			;aaf1
	inc h			;aaf2
	ld b,b			;aaf3
	sub l			;aaf4
	dec hl			;aaf5
	rst 38h			;aaf6
	rst 38h			;aaf7
	rst 38h			;aaf8
	rst 38h			;aaf9
laafah:
	rst 38h			;aafa
	rst 38h			;aafb
	ei			;aafc
	ld l,d			;aafd
	xor l			;aafe
laaffh:
	ld a,d			;aaff
sub_ab00h:
	ld d,e			;ab00
	push de			;ab01
sub_ab02h:
	ld d,b			;ab02
	ld d,l			;ab03
	ret po			;ab04
	dec hl			;ab05
	dec d			;ab06
	add a,e			;ab07
	ld c,a			;ab08
	inc bc			;ab09
	ld d,h			;ab0a
	nop			;ab0b
	dec d			;ab0c
	ld (hl),b		;ab0d
	and d			;ab0e
	add hl,hl		;ab0f
	ld e,c			;ab10
	add a,b			;ab11
	nop			;ab12
	dec b			;ab13
	ld d,l			;ab14
	dec bc			;ab15
	inc d			;ab16
	ld c,01ch		;ab17
	ld b,h			;ab19
	add a,d			;ab1a
	nop			;ab1b
	djnz lab1eh		;ab1c
lab1eh:
	dec c			;ab1e
	nop			;ab1f
	ret nc			;ab20
	add hl,hl		;ab21
	jr c,lab2ch		;ab22
	ccf			;ab24
	ret			;ab25
	ld a,b			;ab26
	nop			;ab27
	ret nz			;ab28
	nop			;ab29
	ld (bc),a		;ab2a
	or (hl)			;ab2b
lab2ch:
	ld d,b			;ab2c
	ld bc,00050h		;ab2d
	inc bc			;ab30
	rst 28h			;ab31
	inc c			;ab32
	rst 38h			;ab33
	push de			;ab34
	ld a,(bc)		;ab35
	adc a,b			;ab36
	adc a,e			;ab37
	add a,b			;ab38
	nop			;ab39
	nop			;ab3a
	nop			;ab3b
	ld (bc),a		;ab3c
	ret nc			;ab3d
	or b			;ab3e
	or d			;ab3f
	ret po			;ab40
	nop			;ab41
	ld bc,lca70h		;ab42
	or l			;ab45
	add a,b			;ab46
	nop			;ab47
	nop			;ab48
	nop			;ab49
	nop			;ab4a
	nop			;ab4b
	nop			;ab4c
	nop			;ab4d
	nop			;ab4e
	inc e			;ab4f
	ld a,l			;ab50
	rst 38h			;ab51
	ret po			;ab52
	nop			;ab53
	ld hl,(ld58ah)		;ab54
	ld e,b			;ab57
	nop			;ab58
	nop			;ab59
	nop			;ab5a
	nop			;ab5b
	ld e,0abh		;ab5c
	nop			;ab5e
	nop			;ab5f
	nop			;ab60
	nop			;ab61
	inc bc			;ab62
	jr nz,lab66h		;ab63
	rst 8			;ab65
lab66h:
	xor 0bfh		;ab66
lab68h:
	nop			;ab68
	rrca			;ab69
	defb 0ddh,0f8h,000h ;illegal sequence	;ab6a
	ld bc,l80ffh		;ab6d
	nop			;ab70
	nop			;ab71
	nop			;ab72
	dec b			;ab73
	ld d,d			;ab74
	ld d,b			;ab75
	ld d,b			;ab76
	nop			;ab77
	nop			;ab78
	nop			;ab79
sub_ab7ah:
	dec b			;ab7a
	add a,b			;ab7b
	ld d,l			;ab7c
	inc (hl)		;ab7d
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
	jr c,lab8dh		;ab8b
lab8dh:
	inc bc			;ab8d
	ld b,b			;ab8e
	ret m			;ab8f
	nop			;ab90
	nop			;ab91
	nop			;ab92
	ccf			;ab93
	ret nz			;ab94
	adc a,b			;ab95
	inc c			;ab96
	nop			;ab97
	ex af,af'		;ab98
	nop			;ab99
	dec h			;ab9a
	add a,c			;ab9b
	cp h			;ab9c
	nop			;ab9d
	nop			;ab9e
	xor a			;ab9f
	rst 38h			;aba0
	rst 38h			;aba1
	rst 38h			;aba2
	ret po			;aba3
	nop			;aba4
	inc bc			;aba5
	ei			;aba6
	rst 38h			;aba7
	rst 38h			;aba8
	rst 38h			;aba9
labaah:
	jp m,lffafh		;abaa
	defb 0fdh,07fh,08fh ;illegal sequence	;abad
	rst 38h			;abb0
	ld c,(hl)		;abb1
	ld a,(hl)		;abb2
	inc bc			;abb3
	call nc,01554h		;abb4
	nop			;abb7
	ld bc,lc011h		;abb8
	ld c,(hl)		;abbb
	ld l,001h		;abbc
	nop			;abbe
	add a,c			;abbf
	ld h,b			;abc0
	ret p			;abc1
	rlca			;abc2
	add a,b			;abc3
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
	rlca			;abce
	ld d,l			;abcf
	ld d,h			;abd0
	push de			;abd1
	ld d,a			;abd2
	jp nz,0568dh		;abd3
	dec b			;abd6
	ld d,h			;abd7
	ld (hl),b		;abd8
	ld (00684h),hl		;abd9
	ld e,e			;abdc
	jr z,lac45h		;abdd
	ld (hl),c		;abdf
	rst 8			;abe0
	rst 38h			;abe1
	ei			;abe2
	inc b			;abe3
	ld d,l			;abe4
	ld e,e			;abe5
	sbc a,l			;abe6
	ld d,l			;abe7
	ld d,l			;abe8
	ld e,0f7h		;abe9
	rst 8			;abeb
	rst 38h			;abec
	jp m,l7f70h		;abed
	rst 38h			;abf0
	sbc a,h			;abf1
	add a,l			;abf2
	ld b,h			;abf3
	sbc a,d			;abf4
	ld d,l			;abf5
	ld a,0dfh		;abf6
	di			;abf8
	rst 38h			;abf9
	rst 38h			;abfa
	ld a,l			;abfb
	rst 38h			;abfc
	call pe,sub_e07fh	;abfd
	ld c,0aah		;ac00
	and h			;ac02
	xor d			;ac03
	or e			;ac04
	push bc			;ac05
	dec hl			;ac06
	ld b,0f8h		;ac07
	ld e,0e8h		;ac09
	jr nz,lac17h		;ac0b
	xor h			;ac0d
	ld d,h			;ac0e
	add a,d			;ac0f
	inc de			;ac10
	inc h			;ac11
	ld b,h			;ac12
	inc bc			;ac13
	xor d			;ac14
	dec d			;ac15
	adc a,h			;ac16
lac17h:
	ld (hl),b		;ac17
	pop hl			;ac18
	ret nz			;ac19
	nop			;ac1a
	djnz lac1dh		;ac1b
lac1dh:
	nop			;ac1d
	ld a,(de)		;ac1e
	ld hl,0194ch		;ac1f
	ret po			;ac22
	ex af,af'		;ac23
	ld b,(hl)		;ac24
	ld a,l			;ac25
	ld h,b			;ac26
	ld de,00080h		;ac27
	ld bc,la3e8h		;ac2a
	ld (bc),a		;ac2d
	or b			;ac2e
	nop			;ac2f
	rlca			;ac30
	call p,l7fdfh		;ac31
	jp pe,lb715h		;ac34
	ld b,000h		;ac37
	nop			;ac39
	nop			;ac3a
	nop			;ac3b
	dec c			;ac3c
	add a,c			;ac3d
	ld d,b			;ac3e
	ld d,e			;ac3f
	add a,b			;ac40
	nop			;ac41
	ld (bc),a		;ac42
	pop bc			;ac43
	dec (hl)		;ac44
lac45h:
	ld c,b			;ac45
	ret po			;ac46
	nop			;ac47
	nop			;ac48
	nop			;ac49
	ld h,b			;ac4a
	nop			;ac4b
	nop			;ac4c
	nop			;ac4d
	nop			;ac4e
	ld a,c			;ac4f
	cp l			;ac50
	cp 000h			;ac51
	nop			;ac53
	ld d,l			;ac54
	ld bc,la84ah		;ac55
	nop			;ac58
	nop			;ac59
	nop			;ac5a
	nop			;ac5b
	rlca			;ac5c
	sub 000h		;ac5d
	nop			;ac5f
	nop			;ac60
	nop			;ac61
	ld (bc),a		;ac62
	ld h,b			;ac63
	ld bc,lf6e7h		;ac64
	rst 38h			;ac67
	nop			;ac68
	rra			;ac69
	rst 18h			;ac6a
	ret m			;ac6b
	nop			;ac6c
	inc bc			;ac6d
	call m,00000h		;ac6e
	nop			;ac71
	nop			;ac72
	ld a,(bc)		;ac73
	xor e			;ac74
	jr nc,lace1h		;ac75
	add a,b			;ac77
	nop			;ac78
	ret p			;ac79
	ld (bc),a		;ac7a
	add a,b			;ac7b
	ld hl,(000ebh)		;ac7c
	nop			;ac7f
	nop			;ac80
	nop			;ac81
	nop			;ac82
	nop			;ac83
	nop			;ac84
	nop			;ac85
	nop			;ac86
	nop			;ac87
	inc bc			;ac88
	add a,b			;ac89
	inc bc			;ac8a
	cp 000h			;ac8b
	ld b,0b1h		;ac8d
	xor a			;ac8f
	inc bc			;ac90
	ret nz			;ac91
	rlca			;ac92
	push af			;ac93
	ld a,b			;ac94
	ld c,b			;ac95
	ex af,af'		;ac96
	nop			;ac97
	nop			;ac98
	nop			;ac99
	ld (bc),a		;ac9a
	add a,e			;ac9b
	ld d,h			;ac9c
	nop			;ac9d
	nop			;ac9e
	ld c,b			;ac9f
	nop			;aca0
	nop			;aca1
	nop			;aca2
	nop			;aca3
	nop			;aca4
	ld bc,lffffh		;aca5
	rst 38h			;aca8
	rst 38h			;aca9
	push de			;acaa
	ld e,a			;acab
	rst 38h			;acac
	cp 0bfh			;acad
	rst 38h			;acaf
lacb0h:
	rst 38h			;acb0
	dec sp			;acb1
	ex de,hl		;acb2
	add a,b			;acb3
	push af			;acb4
	inc l			;acb5
	ex af,af'		;acb6
	add a,b			;acb7
	ret po			;acb8
	add a,b			;acb9
	ret nc			;acba
	xor e			;acbb
	rst 18h			;acbc
	jr c,lacbfh		;acbd
lacbfh:
	ret nz			;acbf
	and e			;acc0
	call m,0f03fh		;acc1
	nop			;acc4
	inc e			;acc5
	nop			;acc6
	nop			;acc7
	nop			;acc8
	inc c			;acc9
laccah:
	nop			;acca
	nop			;accb
laccch:
	nop			;accc
	nop			;accd
	ld a,(de)		;acce
	xor d			;accf
	xor d			;acd0
	xor d			;acd1
	xor d			;acd2
	ld l,d			;acd3
	xor d			;acd4
	adc a,d			;acd5
	ld (bc),a		;acd6
	ld l,a			;acd7
	and b			;acd8
	djnz lad0bh		;acd9
	ld a,(bc)		;acdb
	dec e			;acdc
	or d			;acdd
	daa			;acde
	ld a,c			;acdf
	rst 30h			;ace0
lace1h:
	rst 38h			;ace1
	jp m,02e1ch		;ace2
	xor l			;ace5
	ld (hl),b		;ace6
	nop			;ace7
	xor c			;ace8
	push af			;ace9
	ld e,l			;acea
	ld (hl),c		;aceb
	rst 38h			;acec
	or 0cfh			;aced
	rst 38h			;acef
	cp 074h			;acf0
	and a			;acf2
	or h			;acf3
	add a,l			;acf4
	adc a,e			;acf5
	ld bc,lb7ffh		;acf6
	xor 0cfh		;acf9
	rst 20h			;acfb
	defb 0edh ;next byte illegal after ed	;acfc
	rst 38h			;acfd
	rst 38h			;acfe
	add a,b			;acff
	dec a			;ad00
	ld b,b			;ad01
	inc d			;ad02
	ld d,l			;ad03
	ld e,c			;ad04
	ld (hl),b		;ad05
	ld (hl),00bh		;ad06
	ret nz			;ad08
	ld (hl),b		;ad09
	ld d,e			;ad0a
lad0bh:
	ld b,b			;ad0b
	ld bc,00af0h		;ad0c
	ex af,af'		;ad0f
	inc c			;ad10
	djnz lad13h		;ad11
lad13h:
	ld bc,laad5h		;ad13
	rst 30h			;ad16
	pop bc			;ad17
	ld c,(hl)		;ad18
	nop			;ad19
	ld (bc),a		;ad1a
	nop			;ad1b
	nop			;ad1c
	nop			;ad1d
	ld (hl),h		;ad1e
	ld d,b			;ad1f
	and h			;ad20
	jr z,lad23h		;ad21
lad23h:
	djnz lacb0h		;ad23
	rlca			;ad25
	ld c,b			;ad26
	add hl,hl		;ad27
	nop			;ad28
	nop			;ad29
	nop			;ad2a
	dec d			;ad2b
	ld b,c			;ad2c
	push hl			;ad2d
	ld h,b			;ad2e
	nop			;ad2f
	ld e,073h		;ad30
	rst 28h			;ad32
	cp a			;ad33
	cp 0aah			;ad34
	ret z			;ad36
	inc c			;ad37
	nop			;ad38
	nop			;ad39
	nop			;ad3a
	nop			;ad3b
	ld a,c			;ad3c
	ld (bc),a		;ad3d
	ret z			;ad3e
	jr nc,lad41h		;ad3f
lad41h:
	nop			;ad41
	rlca			;ad42
	add a,e			;ad43
	ld a,(bc)		;ad44
	xor b			;ad45
	ret p			;ad46
lad47h:
	ld h,b			;ad47
	nop			;ad48
	jr lad47h		;ad49
	nop			;ad4b
	nop			;ad4c
	nop			;ad4d
	nop			;ad4e
	rst 20h			;ad4f
	rst 18h			;ad50
	ret p			;ad51
	nop			;ad52
	nop			;ad53
	xor d			;ad54
	ld (bc),a		;ad55
	ret nz			;ad56
	inc d			;ad57
	nop			;ad58
	nop			;ad59
	nop			;ad5a
	nop			;ad5b
	nop			;ad5c
	call m,00000h		;ad5d
	nop			;ad60
	nop			;ad61
lad62h:
	ld (bc),a		;ad62
	ld b,b			;ad63
	nop			;ad64
	ex de,hl		;ad65
	call p,000ffh		;ad66
	ccf			;ad69
	rst 38h			;ad6a
	ld a,b			;ad6b
	nop			;ad6c
	dec b			;ad6d
	ret po			;ad6e
	nop			;ad6f
	nop			;ad70
	nop			;ad71
	nop			;ad72
	inc c			;ad73
	ld d,d			;ad74
	djnz ladach		;ad75
	ld e,b			;ad77
	inc bc			;ad78
	xor b			;ad79
	dec b			;ad7a
	ld a,h			;ad7b
	ld bc,l8055h		;ad7c
	nop			;ad7f
	nop			;ad80
	nop			;ad81
	nop			;ad82
	nop			;ad83
	nop			;ad84
	nop			;ad85
	nop			;ad86
	jr nc,lad8fh		;ad87
	pop hl			;ad89
lad8ah:
	rst 0			;ad8a
	rst 38h			;ad8b
	add a,b			;ad8c
	inc c			;ad8d
	ld d,c			;ad8e
lad8fh:
	ld d,l			;ad8f
	rrca			;ad90
	ret p			;ad91
lad92h:
	dec c			;ad92
	ld de,l881eh		;ad93
	inc b			;ad96
	ld c,000h		;ad97
	nop			;ad99
	nop			;ad9a
	nop			;ad9b
	ld hl,(00000h)		;ad9c
	inc b			;ad9f
	nop			;ada0
	nop			;ada1
	nop			;ada2
	nop			;ada3
	inc c			;ada4
	ld a,a			;ada5
	rst 38h			;ada6
	rst 38h			;ada7
	rst 38h			;ada8
	rst 38h			;ada9
ladaah:
	xor e			;adaa
ladabh:
	rst 20h			;adab
ladach:
	rst 38h			;adac
	rst 38h			;adad
	rst 18h			;adae
	rst 38h			;adaf
	rst 38h			;adb0
	ccf			;adb1
	xor c			;adb2
	ld (hl),b		;adb3
	dec e			;adb4
	ld d,h			;adb5
	inc d			;adb6
	add a,b			;adb7
	jr nc,ladabh		;adb8
	ret m			;adba
	ld d,(hl)		;adbb
ladbch:
	ld b,(hl)		;adbc
	adc a,(hl)		;adbd
	nop			;adbe
	ld h,c			;adbf
	ld b,a			;adc0
	rst 38h			;adc1
	ld a,a			;adc2
	call m,03e00h		;adc3
	ld bc,lc0e0h		;adc6
	ld e,000h		;adc9
	nop			;adcb
	ret nz			;adcc
	nop			;adcd
	ld (hl),l		;adce
	ld d,l			;adcf
	ld d,h			;add0
	sub l			;add1
ladd2h:
	ld d,l			;add2
	ret m			;add3
	xor l			;add4
	ld b,d			;add5
	add hl,de		;add6
	djnz ladbch		;add7
	ld de,lcd10h		;add9
	ld d,087h		;addc
	ld (03b2eh),a		;adde
	rst 38h			;ade1
	ret m			;ade2
	jr nc,$+24		;ade3
	ld d,h			;ade5
	ret nz			;ade6
	nop			;ade7
	rlca			;ade8
	xor d			;ade9
	xor d			;adea
	xor (hl)		;adeb
	ccf			;adec
	ex de,hl		;aded
	ccf			;adee
	rst 38h			;adef
	defb 0fdh,0e0h,0beh ;illegal sequence	;adf0
	ld e,h			;adf3
	ld (de),a		;adf4
	ld b,c			;adf5
	ex af,af'		;adf6
	ld de,0b65fh		;adf7
	sbc a,0fdh		;adfa
	call pe,0f0ffh		;adfc
	inc bc			;adff
	jp pe,04a99h		;ae00
	ld hl,(l9caeh)		;ae03
lae06h:
	ld l,h			;ae06
	inc e			;ae07
	inc bc			;ae08
	jp nz,l806eh		;ae09
	ld bc,l8087h		;ae0c
	add a,c			;ae0f
	djnz lad92h		;ae10
	rlca			;ae12
	ret m			;ae13
lae14h:
	jp pe,l9d44h		;ae14
	ld (bc),a		;ae17
	sbc a,b			;ae18
	nop			;ae19
	nop			;ae1a
	nop			;ae1b
	nop			;ae1c
	ld bc,050a9h		;ae1d
	ld h,(hl)		;ae20
	jr c,lae23h		;ae21
lae23h:
	ld hl,00115h		;ae23
	ld d,l			;ae26
	ld d,a			;ae27
	nop			;ae28
	nop			;ae29
	nop			;ae2a
	ld hl,(03ea1h)		;ae2b
	ret nz			;ae2e
	nop			;ae2f
	ccf			;ae30
	adc a,l			;ae31
	rst 30h			;ae32
	rst 38h			;ae33
	push af			;ae34
	ld b,l			;ae35
	ld e,h			;ae36
	jr nc,lae39h		;ae37
lae39h:
	nop			;ae39
	nop			;ae3a
sub_ae3bh:
	nop			;ae3b
	jp nz,l6805h		;ae3c
	djnz lae41h		;ae3f
lae41h:
	nop			;ae41
	ld b,084h		;ae42
	dec c			;ae44
	djnz $+116		;ae45
	ret po			;ae47
	nop			;ae48
	inc e			;ae49
	rst 38h			;ae4a
	ret nz			;ae4b
	nop			;ae4c
	nop			;ae4d
	inc bc			;ae4e
	rst 18h			;ae4f
	rst 18h			;ae50
	add a,b			;ae51
	nop			;ae52
	ld a,(bc)		;ae53
	ld d,l			;ae54
	dec b			;ae55
	ld h,b			;ae56
	ld a,(bc)		;ae57
	nop			;ae58
	nop			;ae59
	nop			;ae5a
	nop			;ae5b
	nop			;ae5c
	nop			;ae5d
	nop			;ae5e
	nop			;ae5f
	nop			;ae60
	jr nz,lae65h		;ae61
	ret nz			;ae63
lae64h:
	nop			;ae64
lae65h:
	pop hl			;ae65
	jp po,000feh		;ae66
	ccf			;ae69
	rst 38h			;ae6a
	ld a,h			;ae6b
	nop			;ae6c
	ld e,000h		;ae6d
	nop			;ae6f
	nop			;ae70
	nop			;ae71
	nop			;ae72
	jr $-85			;ae73
	sub b			;ae75
	ld hl,(l85efh)		;ae76
	ld d,h			;ae79
	ld (bc),a		;ae7a
lae7bh:
	ex de,hl		;ae7b
	nop			;ae7c
	ld hl,(000c0h)		;ae7d
	jr c,lae82h		;ae80
lae82h:
	nop			;ae82
	nop			;ae83
	nop			;ae84
	nop			;ae85
	jr nc,lae64h		;ae86
	rrca			;ae88
	ld d,a			;ae89
	rst 30h			;ae8a
	rst 38h			;ae8b
	ret po			;ae8c
	ex af,af'		;ae8d
	rrca			;ae8e
	jp pe,sub_ff7fh		;ae8f
	sub l			;ae92
	ld b,l			;ae93
	ld d,a			;ae94
	jr $+36			;ae95
	ld (hl),l		;ae97
	add a,b			;ae98
lae99h:
	ld bc,000c0h		;ae99
	rla			;ae9c
	ld b,000h		;ae9d
	rra			;ae9f
	nop			;aea0
	nop			;aea1
	nop			;aea2
	nop			;aea3
	rst 38h			;aea4
	rst 38h			;aea5
	rst 38h			;aea6
	rst 38h			;aea7
	rst 38h			;aea8
laea9h:
	rst 38h			;aea9
	ld d,a			;aeaa
	rst 30h			;aeab
laeach:
	rst 38h			;aeac
	rst 38h			;aead
	rst 28h			;aeae
	rst 38h			;aeaf
	rst 38h			;aeb0
	ld a,b			;aeb1
	ld l,b			;aeb2
	ld e,h			;aeb3
	dec b			;aeb4
laeb5h:
	adc a,h			;aeb5
	ex af,af'		;aeb6
laeb7h:
	ld b,(hl)		;aeb7
	jr laeb7h		;aeb8
	cp b			;aeba
	ld a,(hl)		;aebb
	ld (bc),a		;aebc
	adc a,e			;aebd
	ld (bc),a		;aebe
laebfh:
	jr nz,$-47		;aebf
sub_aec1h:
	rst 38h			;aec1
	cp a			;aec2
	ret nz			;aec3
	nop			;aec4
	ld a,a			;aec5
	rlca			;aec6
	pop af			;aec7
	ret p			;aec8
	ccf			;aec9
	add a,b			;aeca
	ld bc,000e0h		;aecb
	xor d			;aece
	xor d			;aecf
	xor d			;aed0
	ld hl,(04fafh)		;aed1
	jp pe,01ca2h		;aed4
	ld (hl),045h		;aed7
	ret nz			;aed9
	jr z,$-83		;aeda
	or (hl)			;aedc
	ret			;aedd
	adc a,d			;aede
	jp nz,0fe4bh		;aedf
	rlca			;aee2
	nop			;aee3
	sra a			;aee4
	add a,c			;aee6
	ret p			;aee7
	dec a			;aee8
	ld d,b			;aee9
	dec b			;aeea
	ld d,a			;aeeb
	rst 0			;aeec
	ret pe			;aeed
	rst 38h			;aeee
sub_aeefh:
	rst 38h			;aeef
	ei			;aef0
	dec h			;aef1
	pop hl			;aef2
	xor 091h		;aef3
	and c			;aef5
	ld b,c			;aef6
	jr nz,lae99h		;aef7
	ld (bc),a		;aef9
	ld b,b			;aefa
	sub d			;aefb
	xor d			;aefc
	jr z,$-126		;aefd
	rrca			;aeff
	ld d,l			;af00
	jr z,laeb5h		;af01
	ld d,a			;af03
	jp nz,05447h		;af04
	ld h,b			;af07
	ld c,011h		;af08
	inc de			;af0a
	jr nz,$+3		;af0b
	defb 0fdh,040h,008h ;illegal sequence	;af0d
	nop			;af10
	nop			;af11
	inc a			;af12
	rst 38h			;af13
	ld d,l			;af14
	and b			;af15
	ex de,hl		;af16
	add a,a			;af17
	djnz laf1ah		;af18
laf1ah:
	nop			;af1a
	nop			;af1b
	nop			;af1c
	rlca			;af1d
	ld d,b			;af1e
	ret z			;af1f
	or d			;af20
	ld h,b			;af21
	nop			;af22
	ld h,d			;af23
	ld hl,(laa80h)		;af24
	xor e			;af27
	nop			;af28
	nop			;af29
	nop			;af2a
	dec (hl)		;af2b
	ld d,b			;af2c
	add a,e			;af2d
	nop			;af2e
	nop			;af2f
	call m,sub_f71eh	;af30
	cp 0aah			;af33
	and d			;af35
	ret c			;af36
	ld b,b			;af37
	nop			;af38
	nop			;af39
	nop			;af3a
	nop			;af3b
	ret nz			;af3c
laf3dh:
	ld (bc),a		;af3d
	and h			;af3e
	jr nz,laf41h		;af3f
laf41h:
	nop			;af41
	inc c			;af42
	adc a,b			;af43
	dec b			;af44
	ld d,(hl)		;af45
	ld (00040h),a		;af46
	rrca			;af49
	cp 0e0h			;af4a
	nop			;af4c
	nop			;af4d
	rlca			;af4e
	cp a			;af4f
	call m,00000h		;af50
	dec d			;af53
	ld hl,(la00ah)		;af54
	ld h,003h		;af57
	add a,b			;af59
	nop			;af5a
	nop			;af5b
	nop			;af5c
	nop			;af5d
	nop			;af5e
	nop			;af5f
	nop			;af60
	ld d,b			;af61
	ld (bc),a		;af62
	add a,b			;af63
	djnz lafbfh		;af64
	call pe,000feh		;af66
	rra			;af69
	rst 38h			;af6a
	call m,03000h		;af6b
	nop			;af6e
	nop			;af6f
	nop			;af70
	nop			;af71
	nop			;af72
	inc l			;af73
	ld d,(hl)		;af74
	ld c,b			;af75
	dec e			;af76
	sub l			;af77
	ld b,b			;af78
	xor h			;af79
	ld bc,00055h		;af7a
	ld bc,l814fh		;af7d
	call p,00000h		;af80
	nop			;af83
	nop			;af84
	nop			;af85
sub_af86h:
	jp (hl)			;af86
	xor d			;af87
	rrca			;af88
	xor a			;af89
	rst 38h			;af8a
	rst 38h			;af8b
	ret po			;af8c
	ex af,af'		;af8d
	rra			;af8e
	call p,sub_fffbh	;af8f
	call p,05554h		;af92
	jr z,lafaah		;af95
	ld c,d			;af97
	ld b,b			;af98
	nop			;af99
	ld h,b			;af9a
	nop			;af9b
	ld a,(bc)		;af9c
	add a,d			;af9d
	nop			;af9e
	dec (hl)		;af9f
	add a,b			;afa0
	nop			;afa1
	nop			;afa2
	inc bc			;afa3
	rst 38h			;afa4
	rst 38h			;afa5
	rst 38h			;afa6
	rst 38h			;afa7
	rst 38h			;afa8
	rst 38h			;afa9
lafaah:
	rst 38h			;afaa
	rst 38h			;afab
	rst 38h			;afac
lafadh:
	rst 38h			;afad
	rst 38h			;afae
	rst 38h			;afaf
lafb0h:
	rst 30h			;afb0
	ld d,b			;afb1
	add hl,hl		;afb2
	ld d,h			;afb3
	ld a,l			;afb4
	ld b,h			;afb5
	inc de			;afb6
	inc bc			;afb7
	adc a,a			;afb8
	or 00fh			;afb9
	jr c,laf3dh		;afbb
	rrca			;afbd
	add a,d			;afbe
lafbfh:
	inc b			;afbf
	scf			;afc0
	rst 38h			;afc1
lafc2h:
	adc a,03eh		;afc2
	ld e,07fh		;afc4
	adc a,a			;afc6
	adc a,a			;afc7
	ld e,(hl)		;afc8
	ld a,a			;afc9
	ret nz			;afca
	rra			;afcb
	ret p			;afcc
	nop			;afcd
	push de			;afce
	ld d,l			;afcf
	ld a,l			;afd0
	ld d,l			;afd1
	ld a,l			;afd2
	ld b,(hl)		;afd3
	cp l			;afd4
	ld d,(hl)		;afd5
	inc c			;afd6
	ld b,a			;afd7
	ld (hl),046h		;afd8
	jr nz,lafc2h		;afda
	ld e,d			;afdc
	ld c,(hl)		;afdd
	adc a,b			;afde
	or b			;afdf
	di			;afe0
	pop hl			;afe1
	ld sp,iy		;afe2
	add a,l			;afe4
	rla			;afe5
	rlca			;afe6
	and b			;afe7
	ld l,d			;afe8
	add a,b			;afe9
	nop			;afea
	ld hl,(0e7b9h)		;afeb
	rst 38h			;afee
	rst 38h			;afef
	rst 30h			;aff0
	ld l,01fh		;aff1
	ex de,hl		;aff3
	sub d			;aff4
	ld d,c			;aff5
	ld hl,(00004h)		;aff6
	djnz lb003h		;aff9
	nop			;affb
	ld b,h			;affc
	sub b			;affd
	ld b,b			;affe
	ld a,(de)		;afff
	add a,b			;b000
	ld d,h			;b001
lb002h:
	ld e,d			;b002
lb003h:
	inc a			;b003
	sbc a,a			;b004
	add a,c			;b005
	defb 0edh ;next byte illegal after ed	;b006
	ret nz			;b007
	jr lb00ah		;b008
lb00ah:
	adc a,(hl)		;b00a
	ld b,b			;b00b
	ld (bc),a		;b00c
	ld hl,(000a2h)		;b00d
	ld bc,le1ffh+2		;b010
lb013h:
	ld a,e			;b013
	jp pe,l9451h		;b014
	ld b,l			;b017
	jr nc,lb01ah		;b018
lb01ah:
	nop			;b01a
	nop			;b01b
	nop			;b01c
	ld a,(de)		;b01d
	add a,c			;b01e
	ld l,h			;b01f
lb020h:
	ld d,e			;b020
	ret nz			;b021
	nop			;b022
	ld b,h			;b023
	ld d,l			;b024
	ld h,c			;b025
	ld d,l			;b026
	ld d,l			;b027
	nop			;b028
	nop			;b029
	nop			;b02a
	ld a,(080a8h)		;b02b
	nop			;b02e
	ld bc,lde91h		;b02f
	rst 38h			;b032
	push af			;b033
	ld d,l			;b034
	ld d,b			;b035
	ld b,e			;b036
	add a,b			;b037
	nop			;b038
	nop			;b039
	nop			;b03a
	nop			;b03b
	ld b,b			;b03c
	dec b			;b03d
	ld h,h			;b03e
	ld b,b			;b03f
	nop			;b040
	nop			;b041
	nop			;b042
	sub b			;b043
	dec b			;b044
	rla			;b045
	inc h			;b046
	ld h,c			;b047
	nop			;b048
	rlca			;b049
	rst 18h			;b04a
	or b			;b04b
	nop			;b04c
	nop			;b04d
	rrca			;b04e
	ld a,a			;b04f
	ret po			;b050
	nop			;b051
	nop			;b052
	ld a,(bc)		;b053
	sub e			;b054
	dec d			;b055
	jr c,$+37		;b056
lb058h:
	ld b,060h		;b058
	nop			;b05a
	nop			;b05b
	nop			;b05c
	jr c,lb05fh		;b05d
lb05fh:
	nop			;b05f
	djnz lb082h		;b060
	ld (bc),a		;b062
	add a,b			;b063
	jr lb0e2h		;b064
	rst 20h			;b066
	cp 000h			;b067
	rra			;b069
	rst 38h			;b06a
	xor 000h		;b06b
	nop			;b06d
	nop			;b06e
	nop			;b06f
	inc bc			;b070
	nop			;b071
	nop			;b072
	and 02ah		;b073
	sbc a,b			;b075
	inc bc			;b076
	ld a,(bc)		;b077
	and b			;b078
	inc d			;b079
	ld c,02ah		;b07a
	add a,b			;b07c
	nop			;b07d
	cp l			;b07e
	ld b,(hl)		;b07f
	xor e			;b080
	ret nz			;b081
lb082h:
	nop			;b082
	nop			;b083
	nop			;b084
lb085h:
	ld bc,ld6d7h		;b085
	ld l,a			;b088
	rst 18h			;b089
	rst 38h			;b08a
	rst 38h			;b08b
	push de			;b08c
	djnz lb10eh		;b08d
	cp 041h			;b08f
	rst 38h			;b091
	out (055h),a		;b092
	ld d,c			;b094
	sub h			;b095
	jr z,lb058h		;b096
	nop			;b098
	nop			;b099
	jr nc,lb0a4h		;b09a
lb09ch:
	dec b			;b09c
	ld b,a			;b09d
	nop			;b09e
	ld (00080h),hl		;b09f
	nop			;b0a2
	rrca			;b0a3
lb0a4h:
	rst 38h			;b0a4
	rst 38h			;b0a5
	rst 38h			;b0a6
	call p,07f00h		;b0a7
	rst 38h			;b0aa
	rst 38h			;b0ab
	rst 18h			;b0ac
	rst 38h			;b0ad
	rst 38h			;b0ae
	rst 38h			;b0af
	jp pe,01174h		;b0b0
	inc de			;b0b3
	xor 0ach		;b0b4
	dec bc			;b0b6
	add a,b			;b0b7
	defb 0edh ;next byte illegal after ed	;b0b8
	jp p,02839h		;b0b9
	and 005h		;b0bc
	ld b,c			;b0be
	add a,h			;b0bf
	ld d,a			;b0c0
	rst 38h			;b0c1
	or 0ebh			;b0c2
	di			;b0c4
	sbc a,a			;b0c5
	call m,sub_ab7ah	;b0c6
	cp a			;b0c9
	ret m			;b0ca
	ld a,a			;b0cb
	call m,sub_aa01h	;b0cc
	cp a			;b0cf
	rst 0			;b0d0
	xor d			;b0d1
	pop hl			;b0d2
	dec b			;b0d3
	ld d,a			;b0d4
	adc a,d			;b0d5
	ld h,04dh		;b0d6
	dec b			;b0d8
	adc a,a			;b0d9
	push bc			;b0da
	or 066h			;b0db
	out (0d6h),a		;b0dd
	ret nc			;b0df
	ei			;b0e0
	sbc a,a			;b0e1
lb0e2h:
	ld d,l			;b0e2
	ld e,a			;b0e3
	ld (bc),a		;b0e4
	adc a,d			;b0e5
	dec c			;b0e6
	ld b,b			;b0e7
	ret nc			;b0e8
	nop			;b0e9
	inc d			;b0ea
	dec b			;b0eb
	cp 01fh			;b0ec
	ld l,a			;b0ee
	ld a,(hl)		;b0ef
	defb 0edh ;next byte illegal after ed	;b0f0
	add hl,sp		;b0f1
	ei			;b0f2
	jp (hl)			;b0f3
	push af			;b0f4
	xor e			;b0f5
	inc d			;b0f6
	djnz lb137h		;b0f7
	add hl,bc		;b0f9
	djnz lb085h		;b0fa
	djnz lb0feh		;b0fc
lb0feh:
	ld bc,000f4h		;b0fe
	or d			;b101
	ld hl,(000e3h)		;b102
	ret po			;b105
	jp nc,03000h		;b106
	ld c,b			;b109
	inc c			;b10a
	adc a,a			;b10b
	nop			;b10c
	dec d			;b10d
lb10eh:
	ld d,b			;b10e
	nop			;b10f
	nop			;b110
	ld c,074h		;b111
	defb 0fdh,079h,0aah ;illegal sequence	;b113
	ex de,hl		;b116
	ld c,d			;b117
lb118h:
	ld h,b			;b118
	nop			;b119
	nop			;b11a
	nop			;b11b
	nop			;b11c
	ld (hl),h		;b11d
	nop			;b11e
	and h			;b11f
	jr z,lb122h		;b120
lb122h:
	nop			;b122
	ld c,a			;b123
	jp m,0aae4h		;b124
	xor e			;b127
	nop			;b128
	nop			;b129
	nop			;b12a
	dec e			;b12b
	rst 38h			;b12c
	add a,b			;b12d
	nop			;b12e
	inc bc			;b12f
	rst 0			;b130
	rst 8			;b131
	rst 38h			;b132
	add a,d			;b133
	xor d			;b134
	xor b			;b135
	ld a,h			;b136
lb137h:
	jr nc,lb139h		;b137
lb139h:
	nop			;b139
	nop			;b13a
	nop			;b13b
	ld b,b			;b13c
	ld a,(bc)		;b13d
	jp 00080h		;b13e
	nop			;b141
	ld bc,00310h		;b142
	adc a,a			;b145
	adc a,(hl)		;b146
	or e			;b147
	add a,b			;b148
	rlca			;b149
	rst 28h			;b14a
	ret p			;b14b
	nop			;b14c
	nop			;b14d
	inc a			;b14e
	cp 000h			;b14f
	nop			;b151
	nop			;b152
	dec h			;b153
	ld d,h			;b154
	xor b			;b155
	ld h,(hl)		;b156
	dec d			;b157
	dec e			;b158
	add a,b			;b159
	nop			;b15a
	nop			;b15b
	nop			;b15c
	ld l,h			;b15d
	nop			;b15e
	nop			;b15f
	jr z,lb162h		;b160
lb162h:
	ld bc,03880h		;b162
	inc a			;b165
	ld c,(hl)		;b166
	ld a,a			;b167
	nop			;b168
	ccf			;b169
	rst 38h			;b16a
	jp pe,00000h		;b16b
	nop			;b16e
	nop			;b16f
	ld bc,00180h		;b170
	and h			;b173
	dec d			;b174
	jr z,$+8		;b175
	ld bc,00850h		;b177
	dec d			;b17a
	ld bc,00040h		;b17b
	ld c,d			;b17e
	xor l			;b17f
	ld d,l			;b180
	ld a,b			;b181
	nop			;b182
	nop			;b183
	nop			;b184
	ld bc,lebeah+1		;b185
	rst 10h			;b188
	rst 38h			;b189
	rst 38h			;b18a
	xor d			;b18b
	xor d			;b18c
	push af			;b18d
	ld a,a			;b18e
	ret m			;b18f
	ld bc,0deffh		;b190
	defb 0fdh,045h ;ld b,iyl	;b193
	ld b,h			;b195
	djnz lb118h		;b196
	nop			;b198
	ld b,b			;b199
	jr lb1a8h		;b19a
	ld h,d			;b19c
	and d			;b19d
	add a,b			;b19e
	ld bc,00040h		;b19f
	nop			;b1a2
	nop			;b1a3
	nop			;b1a4
	nop			;b1a5
	nop			;b1a6
	inc sp			;b1a7
lb1a8h:
	dec a			;b1a8
	rst 38h			;b1a9
	rst 38h			;b1aa
	rst 38h			;b1ab
	rst 28h			;b1ac
	rst 18h			;b1ad
	rst 38h			;b1ae
	push af			;b1af
	ld d,l			;b1b0
	ld h,a			;b1b1
	ret pe			;b1b2
	ld e,(hl)		;b1b3
	and (hl)		;b1b4
	ld d,(hl)		;b1b5
	inc b			;b1b6
	ld b,b			;b1b7
	ld e,b			;b1b8
	adc a,h			;b1b9
	ld a,l			;b1ba
	ld e,b			;b1bb
	ret nz			;b1bc
	ld h,c			;b1bd
	ret z			;b1be
	jp po,lff17h		;b1bf
	defb 0fdh,0d5h,055h ;illegal sequence	;b1c2
	ld l,a			;b1c5
	ei			;b1c6
	push de			;b1c7
	ld d,l			;b1c8
	ld e,h			;b1c9
	ld a,a			;b1ca
	rst 38h			;b1cb
	rst 38h			;b1cc
	add a,c			;b1cd
	ld d,l			;b1ce
	ret po			;b1cf
	jr c,$+1		;b1d0
	and l			;b1d2
	ld b,h			;b1d3
	xor d			;b1d4
	ld d,026h		;b1d5
	ld c,08bh		;b1d7
	ld c,a			;b1d9
	push bc			;b1da
	ld e,b			;b1db
	xor l			;b1dc
	adc a,a			;b1dd
	ld b,(hl)		;b1de
	pop de			;b1df
	xor b			;b1e0
	ld a,d			;b1e1
	xor d			;b1e2
	xor e			;b1e3
	sbc a,c			;b1e4
	ld b,l			;b1e5
	ld a,(de)		;b1e6
	pop bc			;b1e7
	and b			;b1e8
	ret p			;b1e9
	xor b			;b1ea
	ld (bc),a		;b1eb
	dec hl			;b1ec
	ret nz			;b1ed
	djnz $+19		;b1ee
	add hl,hl		;b1f0
	call po,sub_8640h	;b1f1
	cp d			;b1f4
	dec b			;b1f5
	ld hl,(0e183h)		;b1f6
	add a,b			;b1f9
	nop			;b1fa
	nop			;b1fb
	nop			;b1fc
	sub c			;b1fd
	ld b,0a9h		;b1fe
	jr nz,lb25ch		;b200
	add hl,de		;b202
	add a,h			;b203
	nop			;b204
	ld sp,000ach		;b205
	ld h,b			;b208
	nop			;b209
	add a,a			;b20a
	ld e,d			;b20b
	jr nz,lb218h		;b20c
	or b			;b20e
	nop			;b20f
	nop			;b210
	ccf			;b211
	add a,e			;b212
	jp m,005aeh		;b213
	ex de,hl		;b216
	ld c,b			;b217
lb218h:
	ret nz			;b218
	nop			;b219
	nop			;b21a
	nop			;b21b
	nop			;b21c
	ret pe			;b21d
	ld h,b			;b21e
	ld h,(hl)		;b21f
	jr nc,lb222h		;b220
lb222h:
	nop			;b222
	sbc a,b			;b223
	dec e			;b224
	ld a,d			;b225
	dec (hl)		;b226
	push de			;b227
	nop			;b228
	nop			;b229
	nop			;b22a
	rlca			;b22b
	add a,b			;b22c
	nop			;b22d
	nop			;b22e
	rrca			;b22f
	dec de			;b230
	rst 28h			;b231
	call m,05500h		;b232
	ld d,h			;b235
	ld c,a			;b236
	ret pe			;b237
	nop			;b238
	nop			;b239
	nop			;b23a
	nop			;b23b
	dec (hl)		;b23c
	ld d,l			;b23d
	add a,b			;b23e
	nop			;b23f
	nop			;b240
	nop			;b241
	ld bc,00330h		;b242
	rst 8			;b245
	sbc a,0bfh		;b246
	add a,b			;b248
	rrca			;b249
	rst 38h			;b24a
	ret p			;b24b
	nop			;b24c
	nop			;b24d
	ld a,a			;b24e
	ret p			;b24f
	nop			;b250
	nop			;b251
	nop			;b252
	ld (bc),a		;b253
	xor l			;b254
	ld b,c			;b255
	add a,d			;b256
	ld (de),a		;b257
	xor e			;b258
	nop			;b259
	nop			;b25a
	nop			;b25b
lb25ch:
	nop			;b25c
	call nc,00000h		;b25d
	djnz lb262h		;b260
lb262h:
	ld bc,02c00h		;b262
	ld a,01eh		;b265
	rra			;b267
	nop			;b268
	ld l,0feh		;b269
	ret p			;b26b
	nop			;b26c
	nop			;b26d
	nop			;b26e
	nop			;b26f
	ld (bc),a		;b270
	ret nz			;b271
	ld (bc),a		;b272
	and 02ah		;b273
	and d			;b275
	inc bc			;b276
	add hl,bc		;b277
	or (hl)			;b278
	nop			;b279
	nop			;b27a
	nop			;b27b
	nop			;b27c
	ret c			;b27d
	nop			;b27e
	nop			;b27f
	nop			;b280
	nop			;b281
	ld bc,lf700h		;b282
	ld e,0efh		;b285
	rrca			;b287
	add a,b			;b288
	ld a,a			;b289
	ei			;b28a
	ret m			;b28b
	nop			;b28c
	ld bc,lfe00h		;b28d
	ld bc,0037eh		;b290
	ld b,e			;b293
	dec d			;b294
	nop			;b295
	or b			;b296
	ld h,b			;b297
lb298h:
	halt			;b298
	inc bc			;b299
	ld h,b			;b29a
	dec (hl)		;b29b
	ld h,c			;b29c
	ld e,h			;b29d
	ld bc,l8000h		;b29e
	ld (bc),a		;b2a1
	ld bc,034cdh		;b2a2
	ld d,d			;b2a5
	sub e			;b2a6
	ld (hl),e		;b2a7
	rst 38h			;b2a8
	ld d,h			;b2a9
	rst 28h			;b2aa
	call nz,sub_d559h	;b2ab
	add a,e			;b2ae
	push de			;b2af
	dec e			;b2b0
	ld d,l			;b2b1
	ld d,l			;b2b2
	ld d,(hl)		;b2b3
	or a			;b2b4
	xor b			;b2b5
	ld hl,(055a5h)		;b2b6
	ld d,a			;b2b9
	ld d,c			;b2ba
	ld c,(hl)		;b2bb
	ld a,(bc)		;b2bc
	call nz,000cah		;b2bd
	nop			;b2c0
	dec d			;b2c1
	ld l,c			;b2c2
	ld b,b			;b2c3
	dec d			;b2c4
	ld d,c			;b2c5
	jp po,0483dh		;b2c6
	ccf			;b2c9
lb2cah:
	nop			;b2ca
	inc b			;b2cb
	ld de,05555h		;b2cc
	ld d,l			;b2cf
	nop			;b2d0
	dec b			;b2d1
	ld d,d			;b2d2
	ld h,l			;b2d3
	ld d,d			;b2d4
	xor b			;b2d5
	dec b			;b2d6
	ld d,l			;b2d7
	ld d,l			;b2d8
	ld d,d			;b2d9
	ld d,l			;b2da
	ld d,l			;b2db
	ld d,c			;b2dc
	ld (bc),a		;b2dd
	or b			;b2de
	nop			;b2df
	nop			;b2e0
	ld bc,lc160h		;b2e1
	ld d,l			;b2e4
	sub l			;b2e5
	cp (hl)			;b2e6
	ei			;b2e7
	cp d			;b2e8
	and (hl)		;b2e9
	nop			;b2ea
	ld (hl),d		;b2eb
	ld e,c			;b2ec
	ld d,l			;b2ed
	ld b,l			;b2ee
	rst 10h			;b2ef
	ld d,c			;b2f0
	ret nz			;b2f1
	ret nz			;b2f2
	add hl,de		;b2f3
	ld d,h			;b2f4
	ld d,d			;b2f5
	xor e			;b2f6
	dec d			;b2f7
	ld c,b			;b2f8
	cp h			;b2f9
	call nz,01555h		;b2fa
	jr nz,lb32fh		;b2fd
	ld a,a			;b2ff
	rst 38h			;b300
	jp p,005b2h		;b301
	ld b,b			;b304
	ld d,h			;b305
	di			;b306
	call po,sub_a6ceh	;b307
	xor d			;b30a
	or l			;b30b
	ld d,l			;b30c
	ld d,l			;b30d
	ld d,a			;b30e
lb30fh:
	ld e,l			;b30f
	push de			;b310
	ld d,l			;b311
	ld d,l			;b312
	ld (hl),b		;b313
	sub l			;b314
	ld b,b			;b315
	dec d			;b316
	sub e			;b317
	add hl,hl		;b318
	xor l			;b319
	xor b			;b31a
	ld d,(hl)		;b31b
	push bc			;b31c
	jr c,lb32eh		;b31d
	ret p			;b31f
	djnz lb2cah		;b320
	sub b			;b322
	dec d			;b323
	ld d,h			;b324
	call p,0deadh		;b325
	ld e,c			;b328
	ld hl,(0191ah)		;b329
	ld d,l			;b32c
	ld d,h			;b32d
lb32eh:
	ld (hl),c		;b32e
lb32fh:
	defb 0ddh,0e7h,000h ;illegal sequence	;b32f
	add hl,sp		;b332
	ld b,a			;b333
	ld sp,041b1h		;b334
	ld d,a			;b337
	ld l,a			;b338
	jp m,08dc4h		;b339
	ld d,l			;b33c
	ld d,l			;b33d
	ld e,014h		;b33e
	jr nz,lb363h		;b340
	add a,b			;b342
	ld d,l			;b343
	ld d,d			;b344
	sbc a,l			;b345
	cp (hl)			;b346
	rst 30h			;b347
	sub b			;b348
	ret z			;b349
	or l			;b34a
	xor b			;b34b
	ld a,c			;b34c
	sub h			;b34d
	ld (04400h),hl		;b34e
	nop			;b351
	xor b			;b352
	ld c,b			;b353
	call 05095h		;b354
	cp a			;b357
	cp (hl)			;b358
	xor 001h		;b359
	rst 8			;b35b
	cp (hl)			;b35c
	ld a,c			;b35d
	ret po			;b35e
	dec b			;b35f
	add a,b			;b360
	jr lb368h		;b361
lb363h:
	ld l,d			;b363
	cp d			;b364
	ld e,c			;b365
	sub a			;b366
	and a			;b367
lb368h:
	jp pe,00aa1h		;b368
	ld de,004ffh		;b36b
	jr c,lb393h		;b36e
	xor (hl)		;b370
	sub (hl)		;b371
	cpl			;b372
	ret m			;b373
	rlca			;b374
	ld b,h			;b375
	ld sp,lca08h		;b376
	nop			;b379
	nop			;b37a
	ret m			;b37b
	ld bc,000a8h		;b37c
	nop			;b37f
	nop			;b380
	nop			;b381
	ld bc,sub_ab00h		;b382
	adc a,l			;b385
	rst 20h			;b386
	rrca			;b387
	add a,b			;b388
	ld l,a			;b389
	ei			;b38a
	ret m			;b38b
	nop			;b38c
	ld (bc),a		;b38d
	nop			;b38e
	xor e			;b38f
	ld bc,006abh		;b390
lb393h:
	jp nz,0052ah		;b393
	ld d,b			;b396
	ld a,(002a6h)		;b397
	and b			;b39a
	ld l,d			;b39b
	cp e			;b39c
	xor a			;b39d
	ld c,0a1h		;b39e
lb3a0h:
	ld b,h			;b3a0
	ld b,l			;b3a1
	rlca			;b3a2
	ld c,d			;b3a3
	ld hl,(09429h)		;b3a4
	and c			;b3a7
	ld a,a			;b3a8
	ld a,(bc)		;b3a9
	rst 28h			;b3aa
	adc a,b			;b3ab
	xor d			;b3ac
	xor d			;b3ad
	or 0aah			;b3ae
	cp d			;b3b0
	xor d			;b3b1
	cp d			;b3b2
	xor d			;b3b3
	defb 0ddh,054h ;ld d,ixh	;b3b4
	ld e,c			;b3b6
	ld e,d			;b3b7
	jp pe,lbaaah		;b3b8
	sbc a,b			;b3bb
	add hl,bc		;b3bc
	ld (hl),d		;b3bd
	add a,h			;b3be
	nop			;b3bf
	nop			;b3c0
	ld a,(bc)		;b3c1
	cp d			;b3c2
	adc a,a			;b3c3
	adc a,d			;b3c4
	xor d			;b3c5
	jp po,0645dh		;b3c6
	rra			;b3c9
	ld (bc),a		;b3ca
	inc c			;b3cb
	ld (laaaah),a		;b3cc
	xor d			;b3cf
	and c			;b3d0
	jp po,lb298h		;b3d1
	or c			;b3d4
	ld d,b			;b3d5
	ld b,0aah		;b3d6
	xor d			;b3d8
	sub d			;b3d9
	ld c,d			;b3da
	xor d			;b3db
	xor c			;b3dc
	ld bc,00090h		;b3dd
	nop			;b3e0
	nop			;b3e1
	ret nc			;b3e2
	add a,d			;b3e3
	or d			;b3e4
	xor c			;b3e5
	cp (hl)			;b3e6
	ei			;b3e7
	cp d			;b3e8
	ld c,e			;b3e9
	ex af,af'		;b3ea
	ld h,e			;b3eb
	jp p,labaah		;b3ec
	ld l,e			;b3ef
	xor b			;b3f0
	ld (hl),b		;b3f1
	ld (hl),c		;b3f2
	ld c,h			;b3f3
	xor l			;b3f4
	ld l,l			;b3f5
	ld d,092h		;b3f6
	ld c,c			;b3f8
	ld d,l			;b3f9
	adc a,h			;b3fa
	xor b			;b3fb
	ld (hl),d		;b3fc
	and b			;b3fd
	jr $+1			;b3fe
	rst 38h			;b400
	pop af			;b401
lb402h:
	ld d,(hl)		;b402
	ld (bc),a		;b403
	jp z,lcbaah		;b404
	call po,sub_c5eeh	;b407
	ld d,l			;b40a
	ld d,d			;b40b
	xor d			;b40c
	xor d			;b40d
	xor c			;b40e
	and e			;b40f
	ld hl,(laaaah)		;b410
	jr nc,$-52		;b413
	ld h,b			;b415
	dec hl			;b416
	ld d,l			;b417
	ld c,c			;b418
	in a,(054h)		;b419
	inc hl			;b41b
	ld h,d			;b41c
	inc l			;b41d
	rrca			;b41e
	ret p			;b41f
	djnz lb47bh		;b420
	sub b			;b422
	ld hl,(lba2ah)		;b423
	sbc a,l			;b426
	xor 058h		;b427
	ld a,d			;b429
	ld hl,(laa08h+2)	;b42a
	xor c			;b42d
	sub 02dh		;b42e
	ret z			;b430
	ret po			;b431
	inc b			;b432
	and a			;b433
	ld (de),a		;b434
	xor b			;b435
	and d			;b436
	cp l			;b437
	xor a			;b438
	ld (hl),l		;b439
	dec de			;b43a
	ld a,(bc)		;b43b
	xor d			;b43c
	xor e			;b43d
	ld e,02ch		;b43e
	jr nz,$+37		;b440
	nop			;b442
	xor b			;b443
	xor e			;b444
	ld c,a			;b445
	cp (hl)			;b446
	ld (hl),e		;b447
	or b			;b448
	push bc			;b449
	scf			;b44a
	ld b,c			;b44b
	adc a,0a4h		;b44c
	dec h			;b44e
	ex af,af'		;b44f
	adc a,b			;b450
	nop			;b451
	sbc a,b			;b452
	ld e,0ceh		;b453
	jp c,l9e00h		;b455
	rst 38h			;b458
	or c			;b459
	cp e			;b45a
	ret po			;b45b
	cp (hl)			;b45c
	ld a,l			;b45d
	and b			;b45e
	dec bc			;b45f
	add a,b			;b460
	ex af,af'		;b461
	ld a,(bc)		;b462
	call nz,sub_6a5fh	;b463
	adc a,d			;b466
	call 05075h		;b467
	inc l			;b46a
	rra			;b46b
	add hl,hl		;b46c
	ret z			;b46d
	sub b			;b46e
	ld a,c			;b46f
	add a,h			;b470
	ld b,h			;b471
	ld e,a			;b472
	ret m			;b473
	rst 0			;b474
	adc a,b			;b475
	pop hl			;b476
	sub l			;b477
	ld d,h			;b478
	nop			;b479
	nop			;b47a
lb47bh:
	daa			;b47b
	ld bc,00058h		;b47c
	nop			;b47f
	nop			;b480
	nop			;b481
	nop			;b482
	ld bc,lcad5h		;b483
	add hl,hl		;b486
	rrca			;b487
	ret nz			;b488
	ld c,a			;b489
	rst 38h			;b48a
	ret m			;b48b
sub_b48ch:
	nop			;b48c
	rlca			;b48d
	nop			;b48e
	push de			;b48f
	ld bc,00555h		;b490
	add a,e			;b493
	dec d			;b494
	ld a,(bc)		;b495
	or b			;b496
	rrca			;b497
	ld h,h			;b498
	inc bc			;b499
	ld h,b			;b49a
	ld d,l			;b49b
	ld e,a			;b49c
	ld d,l			;b49d
	sbc a,e			;b49e
	out (0fah),a		;b49f
	cp (hl)			;b4a1
	adc a,h			;b4a2
	call nc,011f5h		;b4a3
	call z,07fa9h		;b4a6
	dec b			;b4a9
	ld a,(hl)		;b4aa
	add a,(hl)		;b4ab
	ld e,c			;b4ac
	ld d,l			;b4ad
	ld e,l			;b4ae
	ld d,l			;b4af
	ld d,l			;b4b0
	ld d,l			;b4b1
	ld d,l			;b4b2
	ld d,l			;b4b3
	ld l,d			;b4b4
	ld a,(bc)		;b4b5
	xor h			;b4b6
	dec (hl)		;b4b7
	ld d,l			;b4b8
	ld d,l			;b4b9
	ld e,a			;b4ba
	ld d,c			;b4bb
	call p,sub_c0a8h	;b4bc
	nop			;b4bf
	nop			;b4c0
	dec b			;b4c1
	ld (hl),c		;b4c2
	dec (hl)		;b4c3
	ld b,c			;b4c4
	ld d,d			;b4c5
	call po,sub_b48ch	;b4c6
	rrca			;b4c9
	nop			;b4ca
	ld b,011h		;b4cb
	ld d,l			;b4cd
	ld d,l			;b4ce
	ld d,l			;b4cf
	rra			;b4d0
	ret m			;b4d1
	ld c,c			;b4d2
	ld de,0a852h		;b4d3
	dec c			;b4d6
	ld d,l			;b4d7
	nop			;b4d8
	inc h			;b4d9
	add a,h			;b4da
	ld d,l			;b4db
	ld d,l			;b4dc
	nop			;b4dd
	ret nc			;b4de
	nop			;b4df
	nop			;b4e0
	nop			;b4e1
	or c			;b4e2
	add a,c			;b4e3
	ld h,c			;b4e4
	sub l			;b4e5
	adc a,(hl)		;b4e6
	ei			;b4e7
	cp d			;b4e8
	xor l			;b4e9
lb4eah:
	add a,b			;b4ea
	ret c			;b4eb
	ld (hl),l		;b4ec
	ld d,l			;b4ed
	ld d,l			;b4ee
	ld (hl),l		;b4ef
	ld d,l			;b4f0
	inc e			;b4f1
	sbc a,h			;b4f2
	xor (hl)		;b4f3
	ld d,(hl)		;b4f4
	ld d,h			;b4f5
	ld a,(bc)		;b4f6
	sub h			;b4f7
	ld c,c			;b4f8
	ld a,e			;b4f9
	sbc a,b			;b4fa
	ld d,c			;b4fb
	push af			;b4fc
	jr nz,lb52ch		;b4fd
	rst 38h			;b4ff
	cp 0b8h			;b500
	or h			;b502
	dec b			;b503
	sub c			;b504
	ld d,h			;b505
	push de			;b506
	add a,h			;b507
	xor 0a2h		;b508
	xor a			;b50a
	push af			;b50b
	ld d,l			;b50c
	dec d			;b50d
	ld d,h			;b50e
	ld a,l			;b50f
	sub a			;b510
	ld d,l			;b511
	ld d,l			;b512
	jr c,lb4eah		;b513
	ld d,b			;b515
	ld d,l			;b516
	ld d,l			;b517
	ld d,e			;b518
	ld a,a			;b519
	ld l,b			;b51a
	sub d			;b51b
sub_b51ch:
	push hl			;b51c
	ld d,h			;b51d
	rrca			;b51e
	ret po			;b51f
	djnz lb54ah		;b520
	jr nc,lb53ah		;b522
	ld b,b			;b524
	call nc,0deedh		;b525
	and a			;b528
	adc a,(hl)		;b529
	ld a,(de)		;b52a
sub_b52bh:
	add hl,de		;b52b
lb52ch:
	ld d,l			;b52c
	ld d,l			;b52d
	xor b			;b52e
	inc de			;b52f
	ret			;b530
	adc a,(hl)		;b531
	ld (bc),a		;b532
	ld d,e			;b533
	add hl,de		;b534
	or h			;b535
	ld d,l			;b536
	cp l			;b537
	rst 18h			;b538
	cp d			;b539
lb53ah:
	ld l,h			;b53a
	ld (hl),l		;b53b
	ld d,l			;b53c
	ld d,l			;b53d
	sbc a,(hl)		;b53e
	ld d,020h		;b53f
	ld (05901h),hl		;b541
	ld d,c			;b544
	rst 0			;b545
	cp (hl)			;b546
	ld a,e			;b547
	ret			;b548
	ld b,d			;b549
lb54ah:
	ld d,082h		;b54a
	ld de,02088h		;b54c
	sbc a,h			;b54f
	sub b			;b550
	sub h			;b551
	xor b			;b552
	ccf			;b553
	ld c,c			;b554
	push de			;b555
	ld bc,lff5eh		;b556
	pop bc			;b559
	cp e			;b55a
	rst 28h			;b55b
	ld e,01ch		;b55c
	ld (hl),b		;b55e
	dec b			;b55f
	nop			;b560
	ex af,af'		;b561
	dec d			;b562
	ld c,b			;b563
	dec h			;b564
	ld a,c			;b565
	sbc a,l			;b566
	ld e,e			;b567
	jp m,04ab2h		;b568
	ld (hl),b		;b56b
	ld d,b			;b56c
	ld sp,lfec4h		;b56d
	and b			;b570
	inc c			;b571
	xor a			;b572
	ei			;b573
	rst 20h			;b574
	ld e,l			;b575
	ld bc,lcc64h		;b576
	inc e			;b579
lb57ah:
	nop			;b57a
	dec de			;b57b
	add a,c			;b57c
	or b			;b57d
	ld (bc),a		;b57e
	nop			;b57f
	nop			;b580
	nop			;b581
	ex af,af'		;b582
	ld (bc),a		;b583
	xor d			;b584
	xor e			;b585
	inc e			;b586
	rlca			;b587
	ret po			;b588
	rrca			;b589
	rst 38h			;b58a
	di			;b58b
	add a,b			;b58c
	dec c			;b58d
	nop			;b58e
	ex de,hl		;b58f
	ld bc,l82aah		;b590
	pop bc			;b593
	adc a,d			;b594
	dec d			;b595
	ld d,b			;b596
	ld d,l			;b597
	call z,sub_a006h	;b598
	ret pe			;b59b
	xor d			;b59c
	and d			;b59d
	sub b			;b59e
	call m,sub_eb1dh	;b59f
	ld c,d			;b5a2
	add a,c			;b5a3
	xor d			;b5a4
	xor c			;b5a5
	adc a,054h		;b5a6
	ccf			;b5a8
	ld (bc),a		;b5a9
	ld a,d			;b5aa
	adc a,d			;b5ab
	ld hl,(laaaah)		;b5ac
	xor d			;b5af
	xor d			;b5b0
	adc a,d			;b5b1
	ld hl,(055aah)		;b5b2
	dec b			;b5b5
	ld e,e			;b5b6
	jp pe,laaaah		;b5b7
	xor d			;b5ba
	sub a			;b5bb
	inc b			;b5bc
	ld d,h			;b5bd
	ld b,b			;b5be
	nop			;b5bf
	nop			;b5c0
	ld (bc),a		;b5c1
	jp nc,lb86ah		;b5c2
	xor d			;b5c5
	ld c,d			;b5c6
	defb 0edh ;next byte illegal after ed	;b5c7
	ld a,h			;b5c8
	rrca			;b5c9
	nop			;b5ca
	ld c,032h		;b5cb
	xor e			;b5cd
	xor d			;b5ce
	xor d			;b5cf
	adc a,(hl)		;b5d0
	ld c,(hl)		;b5d1
	ex af,af'		;b5d2
	ld (hl),d		;b5d3
	xor c			;b5d4
lb5d5h:
	call nc,sub_8214h	;b5d5
	xor d			;b5d8
	and h			;b5d9
	add a,d			;b5da
	xor (hl)		;b5db
	xor b			;b5dc
	add a,c			;b5dd
	ld d,b			;b5de
	nop			;b5df
	nop			;b5e0
	nop			;b5e1
	exx			;b5e2
	ld (bc),a		;b5e3
	and d			;b5e4
	xor c			;b5e5
	or d			;b5e6
	ld a,e			;b5e7
	sbc a,c			;b5e8
	ld c,(hl)		;b5e9
	rst 38h			;b5ea
	cp d			;b5eb
	ld (bc),a		;b5ec
	xor d			;b5ed
	xor d			;b5ee
	xor e			;b5ef
	xor d			;b5f0
	add a,a			;b5f1
	ld (bc),a		;b5f2
	ld b,(hl)		;b5f3
	ld hl,(0066ah)		;b5f4
	sub b			;b5f7
	sub d			;b5f8
	ld l,e			;b5f9
	cp b			;b5fa
	xor e			;b5fb
	ld h,d			;b5fc
	sub b			;b5fd
	dec d			;b5fe
	rst 38h			;b5ff
	push af			;b600
	ld e,c			;b601
	halt			;b602
	ld a,(bc)		;b603
	and h			;b604
	ld hl,(l63bah)		;b605
	ld d,0d3h		;b608
	ld e,h			;b60a
	or d			;b60b
	xor d			;b60c
	xor d			;b60d
	xor d			;b60e
	ld (hl),h		;b60f
	jp pe,laaaah		;b610
	cp b			;b613
	jp z,lab68h		;b614
	ld d,l			;b617
	ld d,a			;b618
	or (hl)			;b619
	pop de			;b61a
	dec hl			;b61b
	or d			;b61c
	ld l,h			;b61d
	rrca			;b61e
	ret p			;b61f
	djnz lb672h		;b620
	jr nz,lb64eh		;b622
	xor h			;b624
	ld l,c			;b625
	rst 10h			;b626
	call 0031ch		;b627
	xor d			;b62a
	ex af,af'		;b62b
	ld a,(bc)		;b62c
	xor c			;b62d
	ld e,b			;b62e
	dec bc			;b62f
	out (03bh),a		;b630
	add a,c			;b632
	inc hl			;b633
	ld a,(de)		;b634
	xor d			;b635
	ld hl,(07fbfh)		;b636
	call p,sub_6ab0h	;b639
	xor d			;b63c
	xor d			;b63d
	sbc a,h			;b63e
	ld a,(bc)		;b63f
	ld b,b			;b640
	ld h,000h		;b641
	xor b			;b643
	add hl,hl		;b644
	ld l,e			;b645
	cp (hl)			;b646
	ld a,d			;b647
	jp z,01d40h		;b648
	inc b			;b64b
	xor d			;b64c
	sbc a,b			;b64d
lb64eh:
	ld b,d			;b64e
	inc e			;b64f
	and c			;b650
	ret z			;b651
	sbc a,c			;b652
	ccf			;b653
	ld d,h			;b654
	jp c,ldf82h		;b655
	call m,sub_770eh	;b658
	rst 28h			;b65b
	ret pe			;b65c
	call po,00bf0h		;b65d
	nop			;b660
	dec d			;b661
	ld hl,(017deh)		;b662
	ld hl,(l5e9dh)		;b665
	defb 0fdh,051h,084h ;illegal sequence	;b668
	ret nz			;b66b
	cp l			;b66c
	ret			;b66d
	call 00effh		;b66e
	add hl,de		;b671
lb672h:
	rst 28h			;b672
	di			;b673
	ld sp,hl		;b674
	adc a,d			;b675
	jr nc,lb690h		;b676
	ld b,h			;b678
	rlca			;b679
	nop			;b67a
	dec d			;b67b
	pop bc			;b67c
	ret nc			;b67d
	dec b			;b67e
	ld (bc),a		;b67f
	nop			;b680
	nop			;b681
	inc d			;b682
	inc bc			;b683
	ld d,l			;b684
	ld h,l			;b685
	sbc a,(hl)		;b686
	rlca			;b687
	ret p			;b688
	inc bc			;b689
	rst 38h			;b68a
	sub l			;b68b
	ld b,b			;b68c
	scf			;b68d
	nop			;b68e
	ld d,l			;b68f
lb690h:
	add a,c			;b690
	ld (hl),l		;b691
	ld b,e			;b692
	ld b,c			;b693
	dec d			;b694
	xor d			;b695
	or b			;b696
	inc l			;b697
	ld d,01dh		;b698
	ld h,c			;b69a
	push de			;b69b
	ld d,l			;b69c
	ld c,c			;b69d
	jr nc,lb6a0h		;b69e
lb6a0h:
	rlca			;b6a0
	push de			;b6a1
	push hl			;b6a2
	add a,a			;b6a3
	ld d,l			;b6a4
	sub l			;b6a5
	xor 022h		;b6a6
	rra			;b6a8
	ld bc,l8662h		;b6a9
	ld e,c			;b6ac
	ld d,l			;b6ad
	ld d,l			;b6ae
	ld d,l			;b6af
	ld d,l			;b6b0
	ld d,h			;b6b1
	add a,l			;b6b2
	ld d,l			;b6b3
	ld c,d			;b6b4
	ld (bc),a		;b6b5
	xor l			;b6b6
	ld d,l			;b6b7
	ld d,l			;b6b8
	ld d,l			;b6b9
	ld d,l			;b6ba
	ld c,h			;b6bb
	ld d,h			;b6bc
	ld a,(bc)		;b6bd
	ld b,b			;b6be
	nop			;b6bf
	nop			;b6c0
	ld bc,05574h		;b6c1
	ld d,(hl)		;b6c4
	ld d,b			;b6c5
	ld e,c			;b6c6
	push hl			;b6c7
	ld d,h			;b6c8
	rrca			;b6c9
	inc b			;b6ca
	add hl,de		;b6cb
	ld de,05555h		;b6cc
	ld d,l			;b6cf
	ld b,h			;b6d0
	sbc a,e			;b6d1
	add a,h			;b6d2
	add hl,bc		;b6d3
	ld e,d			;b6d4
	xor d			;b6d5
	dec l			;b6d6
	ld d,l			;b6d7
	ld (0154bh),hl		;b6d8
	ld d,l			;b6db
	ld d,h			;b6dc
	add a,b			;b6dd
	ret m			;b6de
	nop			;b6df
	nop			;b6e0
	nop			;b6e1
	cp c			;b6e2
	ld bc,l9560h		;b6e3
	ld a,b			;b6e6
	cp d			;b6e7
	dec hl			;b6e8
	and a			;b6e9
	nop			;b6ea
	ld a,c			;b6eb
	ld d,l			;b6ec
	ld d,l			;b6ed
	ld d,l			;b6ee
	ld d,l			;b6ef
	ld d,l			;b6f0
	ld d,b			;b6f1
	ld d,c			;b6f2
	inc hl			;b6f3
	ld d,(hl)		;b6f4
	ld d,l			;b6f5
	ld (bc),a		;b6f6
	sub d			;b6f7
	sub d			;b6f8
	rst 10h			;b6f9
	jr nc,lb74eh		;b6fa
	push hl			;b6fc
	djnz lb70ah		;b6fd
	rst 38h			;b6ff
	jp pe,0a3a8h		;b700
	dec b			;b703
	sub e			;b704
	inc d			;b705
	cp (hl)			;b706
	call nc,sub_62b2h	;b707
lb70ah:
	or h			;b70a
	ld d,l			;b70b
	ld d,l			;b70c
	ld d,l			;b70d
	ld d,l			;b70e
	scf			;b70f
	sub l			;b710
	ld d,l			;b711
	ld d,l			;b712
	inc e			;b713
	push bc			;b714
lb715h:
	dec (hl)		;b715
	ld d,l			;b716
	ld d,(hl)		;b717
	and a			;b718
	defb 0edh ;next byte illegal after ed	;b719
	and (hl)		;b71a
	inc de			;b71b
	ld d,l			;b71c
	ld d,(hl)		;b71d
	rra			;b71e
	ret nc			;b71f
	djnz lb752h		;b720
	ld h,b			;b722
	ld d,(hl)		;b723
	ld c,d			;b724
	ld a,l			;b725
	jp pe,060d5h		;b726
	ld b,b			;b729
	sbc a,c			;b72a
	rra			;b72b
	pop hl			;b72c
	ld d,e			;b72d
	ex af,af'		;b72e
	dec bc			;b72f
	ld h,066h		;b730
	ret nz			;b732
	sub e			;b733
	sbc a,c			;b734
	and l			;b735
	dec d			;b736
	cp a			;b737
	rst 18h			;b738
	in a,(0c1h)		;b739
	push de			;b73b
	ld d,l			;b73c
	ld d,l			;b73d
	ld e,h			;b73e
	ld b,040h		;b73f
	inc h			;b741
	ld bc,lc559h		;b742
	and l			;b745
	ld e,(hl)		;b746
	cp l			;b747
	ld c,d			;b748
	ld b,d			;b749
	sbc a,d			;b74a
	add hl,bc		;b74b
	ld d,l			;b74c
	ld d,b			;b74d
lb74eh:
	add a,a			;b74e
	ex af,af'		;b74f
	pop bc			;b750
	pop de			;b751
lb752h:
	xor e			;b752
	cp (hl)			;b753
	jp (hl)			;b754
	push de			;b755
	ld b,l			;b756
	ld e,e			;b757
	di			;b758
	rst 8			;b759
	rst 30h			;b75a
	rst 0			;b75b
	pop af			;b75c
	di			;b75d
	ret p			;b75e
	dec d			;b75f
	nop			;b760
	ld l,085h		;b761
	ld b,b			;b763
	adc a,d			;b764
	cp l			;b765
	sbc a,l			;b766
	ld c,c			;b767
	cp 0b0h			;b768
	dec b			;b76a
lb76bh:
	add a,l			;b76b
	ld d,c			;b76c
	ld d,h			;b76d
	adc a,l			;b76e
	rst 38h			;b76f
	cp a			;b770
	add a,e			;b771
	di			;b772
	rst 30h			;b773
	cp 004h			;b774
	ld e,b			;b776
	inc c			;b777
	xor h			;b778
	dec b			;b779
	add a,b			;b77a
	ld a,(de)		;b77b
	ret nz			;b77c
	or b			;b77d
	ld (bc),a		;b77e
	rlca			;b77f
	nop			;b780
	jr nz,lb78bh		;b781
	ld b,(hl)		;b783
	ld (bc),a		;b784
	or e			;b785
lb786h:
	sbc a,(hl)		;b786
	inc bc			;b787
	call m,0ff1bh		;b788
lb78bh:
	jp pe,02aa0h		;b78b
	nop			;b78e
	ld l,d			;b78f
	add a,c			;b790
	xor d			;b791
	and d			;b792
	pop af			;b793
	adc a,d			;b794
	ld d,h			;b795
	ld c,b			;b796
	ld d,0aah		;b797
	ld hl,(laaa1h)		;b799
	nop			;b79c
	sub h			;b79d
	jr nz,lb7a0h		;b79e
lb7a0h:
	ld (bc),a		;b7a0
	xor d			;b7a1
	or e			;b7a2
	ld a,0aah		;b7a3
	ret			;b7a5
	rst 28h			;b7a6
	ld (00007h),a		;b7a7
	ld h,b			;b7aa
	ld a,(bc)		;b7ab
	ld (laaaah),a		;b7ac
	xor d			;b7af
	xor d			;b7b0
	xor d			;b7b1
	ld (hl),b		;b7b2
	xor d			;b7b3
lb7b4h:
	and l			;b7b4
	dec b			;b7b5
	ld e,d			;b7b6
	xor d			;b7b7
	xor (hl)		;b7b8
	and d			;b7b9
	xor d			;b7ba
	and b			;b7bb
	and d			;b7bc
	ld d,060h		;b7bd
	ld bc,00000h		;b7bf
	jp nc,0abeah		;b7c2
	add hl,hl		;b7c5
	ld e,l			;b7c6
	push af			;b7c7
	ld d,h			;b7c8
	rlca			;b7c9
	nop			;b7ca
	add hl,sp		;b7cb
	ld hl,(laaaah)		;b7cc
	xor d			;b7cf
	and h			;b7d0
	ld hl,04ac4h		;b7d1
	xor c			;b7d4
	add a,l			;b7d5
	ld d,l			;b7d6
lb7d7h:
	ld (de),a		;b7d7
	inc h			;b7d8
	ld c,l			;b7d9
	djnz lb786h		;b7da
lb7dch:
	xor d			;b7dc
	ld b,b			;b7dd
	ld l,b			;b7de
sub_b7dfh:
	ld bc,001fch		;b7df
	pop de			;b7e2
	ld (bc),a		;b7e3
	and c			;b7e4
	jr z,lb7b4h		;b7e5
	ld e,c			;b7e7
	ld d,l			;b7e8
	ld d,l			;b7e9
	rst 38h			;b7ea
	jp c,labaah		;b7eb
	ld l,d			;b7ee
	cp e			;b7ef
	xor d			;b7f0
	xor d			;b7f1
	xor b			;b7f2
	sub e			;b7f3
	dec hl			;b7f4
	ld l,d			;b7f5
	add a,d			;b7f6
	sub d			;b7f7
	sub h			;b7f8
	rst 18h			;b7f9
lb7fah:
	ld h,h			;b7fa
	and a			;b7fb
	ld c,d			;b7fc
	sub b			;b7fd
	rlca			;b7fe
lb7ffh:
	rst 38h			;b7ff
	pop bc			;b800
	ld e,c			;b801
	ld h,c			;b802
	adc a,d			;b803
	xor l			;b804
	adc a,d			;b805
	cp e			;b806
	xor 0bah		;b807
	ld d,c			;b809
	ld l,h			;b80a
	ld (laaaah),a		;b80b
	xor d			;b80e
	dec a			;b80f
	jp pe,02aa0h		;b810
	sbc a,h			;b813
	ld l,d			;b814
	xor d			;b815
	and e			;b816
	ld d,(hl)		;b817
	xor a			;b818
	ld a,e			;b819
	ld c,b			;b81a
	ld hl,(leabah)		;b81b
	rra			;b81e
	jr c,lb831h		;b81f
	ld d,b			;b821
	ld b,b			;b822
	inc l			;b823
	and a			;b824
	dec l			;b825
	ret			;b826
	ld d,h			;b827
	add a,b			;b828
	djnz lb7dch		;b829
	ld a,l			;b82b
	ld a,b			;b82c
	xor d			;b82d
	ex af,af'		;b82e
	ld a,(bc)		;b82f
	inc h			;b830
lb831h:
	jp la960h		;b831
	sbc a,d			;b834
	and d			;b835
	xor d			;b836
	cp (hl)			;b837
	rst 18h			;b838
	and a			;b839
	ccf			;b83a
	xor d			;b83b
	xor d			;b83c
	xor d			;b83d
	ret z			;b83e
	dec bc			;b83f
	ld b,b			;b840
	inc l			;b841
	ld (bc),a		;b842
	or e			;b843
	ld (hl),b		;b844
	ex de,hl		;b845
	xor a			;b846
	ld e,h			;b847
	adc a,d			;b848
	ld b,c			;b849
	inc d			;b84a
	ld a,(bc)		;b84b
	xor d			;b84c
	ld sp,02007h		;b84d
	nop			;b850
	add a,c			;b851
	rla			;b852
	defb 0ddh,050h,0d2h ;illegal sequence	;b853
	xor d			;b856
	exx			;b857
	rst 8			;b858
	ld (hl),a		;b859
	cp e			;b85a
	sbc a,e			;b85b
	defb 0fdh,0f7h,0f8h ;illegal sequence	;b85c
	xor (hl)		;b85f
	nop			;b860
	ld d,a			;b861
	ld d,d			;b862
	ret c			;b863
	rst 30h			;b864
	call pe,0519dh		;b865
	rst 38h			;b868
	ld h,b			;b869
lb86ah:
	add a,h			;b86a
	dec bc			;b86b
	sub c			;b86c
	jp z,lff23h		;b86d
	rst 18h			;b870
	rst 8			;b871
	call m,0ffefh		;b872
	rrca			;b875
	sub (hl)		;b876
	ld b,066h		;b877
	ld b,0c0h		;b879
	dec d			;b87b
	ld h,b			;b87c
	ret nc			;b87d
	nop			;b87e
	ld (bc),a		;b87f
	nop			;b880
	ld (hl),b		;b881
	nop			;b882
lb883h:
	ld b,l			;b883
	ld (hl),c		;b884
	ld e,d			;b885
	ld e,(hl)		;b886
	inc bc			;b887
	rst 38h			;b888
	push af			;b889
	cp 065h			;b88a
	ld d,b			;b88c
	dec (hl)		;b88d
	nop			;b88e
	ld (hl),l		;b88f
	add a,e			;b890
	ld d,l			;b891
	ld h,a			;b892
	ld e,c			;b893
	ld d,l			;b894
	and b			;b895
	ex af,af'		;b896
	dec hl			;b897
	ld d,(hl)		;b898
	ld d,l			;b899
	ld h,c			;b89a
	ld d,b			;b89b
	cp 049h			;b89c
	ld h,b			;b89e
	nop			;b89f
	ld bc,ld255h		;b8a0
	ld (hl),l		;b8a3
	ld d,l			;b8a4
	ld d,l			;b8a5
	rst 28h			;b8a6
	add hl,sp		;b8a7
	ld bc,04200h		;b8a8
	inc b			;b8ab
	ld d,c			;b8ac
	ld d,l			;b8ad
	ld d,l			;b8ae
	ld d,l			;b8af
	ld d,l			;b8b0
	ld d,l			;b8b1
	ccf			;b8b2
	ld d,l			;b8b3
	ld (lad8ah),hl		;b8b4
	ld d,l			;b8b7
	ld d,l			;b8b8
sub_b8b9h:
	ld c,c			;b8b9
	ld d,l			;b8ba
	ld d,l			;b8bb
	ld d,d			;b8bc
	ld a,(bc)		;b8bd
	jr nz,$+4		;b8be
	add a,b			;b8c0
	ld bc,lc578h		;b8c1
	ld d,l			;b8c4
	dec d			;b8c5
	inc a			;b8c6
	push af			;b8c7
	ld d,d			;b8c8
	rlca			;b8c9
	nop			;b8ca
	djnz lb8e6h		;b8cb
	ld d,l			;b8cd
	ld d,l			;b8ce
	ld e,l			;b8cf
	ld b,h			;b8d0
	ld b,d			;b8d1
	ld h,a			;b8d2
	ld sp,lc258h		;b8d3
	xor l			;b8d6
	ld d,l			;b8d7
	ld b,h			;b8d8
	ld c,(hl)		;b8d9
	ld (05555h),hl		;b8da
	ld b,b			;b8dd
	cp h			;b8de
	rrca			;b8df
	rst 38h			;b8e0
	pop bc			;b8e1
	or e			;b8e2
	dec b			;b8e3
	ld d,e			;b8e4
	ld d,h			;b8e5
lb8e6h:
	ex (sp),hl		;b8e6
	jp pe,la689h		;b8e7
	xor d			;b8ea
	or l			;b8eb
	ld d,l			;b8ec
	ld d,l			;b8ed
	dec l			;b8ee
	ld d,l			;b8ef
	ld d,l			;b8f0
	ld d,l			;b8f1
	ld d,h			;b8f2
	ret			;b8f3
	sub l			;b8f4
	ld d,c			;b8f5
	ld b,(hl)		;b8f6
	sub d			;b8f7
	and h			;b8f8
	sub 0eah		;b8f9
	ld d,(hl)		;b8fb
	push bc			;b8fc
	jr c,lb906h		;b8fd
	cp 020h			;b8ff
	xor b			;b901
	ret nz			;b902
	push bc			;b903
	dec d			;b904
	ld d,h			;b905
lb906h:
	cp c			;b906
	sbc a,(hl)		;b907
	cp d			;b908
	ld l,e			;b909
	or (hl)			;b90a
	ld de,05555h		;b90b
	ld d,l			;b90e
	ld a,015h		;b90f
	rrca			;b911
	dec d			;b912
	ld c,(hl)		;b913
	ld h,l			;b914
	and l			;b915
	ld bc,0af56h		;b916
	sbc a,090h		;b919
	sub e			;b91b
	ld e,c			;b91c
	sub 01fh		;b91d
lb91fh:
	ld e,b			;b91f
	djnz lb952h		;b920
	ret nz			;b922
	ld d,l			;b923
	ld d,h			;b924
	or a			;b925
	jp nc,07ea9h		;b926
	inc b			;b929
	ld d,h			;b92a
	xor d			;b92b
	xor h			;b92c
	ld d,d			;b92d
	djnz lb940h		;b92e
	ld b,c			;b930
	add a,c			;b931
	and b			;b932
	ld d,l			;b933
	sbc a,l			;b934
	and c			;b935
	ld d,l			;b936
	cp a			;b937
	cp a			;b938
	ld e,h			;b939
	ld (hl),l		;b93a
	ld d,l			;b93b
	ld d,l			;b93c
	ld d,l			;b93d
	ld b,b			;b93e
	dec b			;b93f
lb940h:
	ld b,b			;b940
	djnz $+7		;b941
	ld d,a			;b943
	call c,014b5h		;b944
	jr z,$+65		;b947
	call nz,0115ah		;b949
	ld d,h			;b94c
	ld h,d			;b94d
	ld (de),a		;b94e
	ld d,h			;b94f
	inc h			;b950
	dec bc			;b951
lb952h:
	cpl			;b952
	and 0a9h		;b953
	ret nc			;b955
	ld d,b			;b956
	halt			;b957
	cp a			;b958
	ei			;b959
	cp e			;b95a
	ld a,l			;b95b
	defb 0fdh,0f7h,0f9h ;illegal sequence	;b95c
	ld d,b			;b95f
	nop			;b960
	xor d			;b961
	xor c			;b962
	adc a,l			;b963
	ld l,e			;b964
	ld (hl),a		;b965
	ld e,l			;b966
	ld b,c			;b967
	rst 38h			;b968
	and b			;b969
	nop			;b96a
	ld d,01dh		;b96b
	dec b			;b96d
	ld (hl),a		;b96e
	rst 38h			;b96f
	ret po			;b970
	ccf			;b971
	rst 38h			;b972
	rra			;b973
	rst 38h			;b974
	ld b,051h		;b975
	add a,b			;b977
	or d			;b978
	ld (bc),a		;b979
	ret nz			;b97a
	ld a,(0b0a1h)		;b97b
	nop			;b97e
	nop			;b97f
	nop			;b980
	jr nz,lb983h		;b981
lb983h:
	adc a,038h		;b983
	xor d			;b985
	xor h			;b986
	ld bc,laaffh		;b987
	rst 38h			;b98a
	ld h,b			;b98b
	xor b			;b98c
	ld l,e			;b98d
	nop			;b98e
	ld l,e			;b98f
	ld b,0aah		;b990
	or (hl)			;b992
	xor h			;b993
	ex de,hl		;b994
	ld d,b			;b995
	jr $+84			;b996
	xor e			;b998
	jp pe,la3b1h		;b999
	inc sp			;b99c
	add a,d			;b99d
	ld b,h			;b99e
	nop			;b99f
	nop			;b9a0
	ld hl,(leadbh)		;b9a1
	xor d			;b9a4
	jp (hl)			;b9a5
	rst 30h			;b9a6
	ld a,l			;b9a7
	nop			;b9a8
	nop			;b9a9
	nop			;b9aa
	inc c			;b9ab
	ld (laaaah),a		;b9ac
	adc a,d			;b9af
	xor d			;b9b0
	xor d			;b9b1
	sub c			;b9b2
	adc a,d			;b9b3
	and l			;b9b4
	ld d,l			;b9b5
	ld d,0a8h		;b9b6
	xor d			;b9b8
	adc a,b			;b9b9
	ld a,(bc)		;b9ba
	xor d			;b9bb
	xor d			;b9bc
	dec b			;b9bd
	jr nz,lb9c1h		;b9be
	nop			;b9c0
lb9c1h:
	nop			;b9c1
	jp c,0bba2h		;b9c2
	add hl,hl		;b9c5
	ld a,0fbh		;b9c6
	cp d			;b9c8
	rlca			;b9c9
	inc b			;b9ca
	inc a			;b9cb
	ld hl,(laaaah)		;b9cc
	xor h			;b9cf
	and a			;b9d0
	inc b			;b9d1
	ld hl,ladd2h		;b9d2
	and c			;b9d5
	ld d,a			;b9d6
	ld (de),a		;b9d7
	ld b,h			;b9d8
	cp d			;b9d9
	ld h,0aah		;b9da
	add a,d			;b9dc
	ld b,b			;b9dd
	ld d,h			;b9de
	ccf			;b9df
	rst 38h			;b9e0
	ex (sp),hl		;b9e1
	ld d,d			;b9e2
	ld (bc),a		;b9e3
	adc a,02ah		;b9e4
	di			;b9e6
	push hl			;b9e7
	call 05553h		;b9e8
	ld e,d			;b9eb
	xor d			;b9ec
	xor d			;b9ed
	and (hl)		;b9ee
	or e			;b9ef
	xor d			;b9f0
	xor d			;b9f1
	xor d			;b9f2
	ld b,l			;b9f3
	xor d			;b9f4
	ld h,b			;b9f5
	ld hl,(0a592h)		;b9f6
	cp (hl)			;b9f9
	call nc,sub_8a25h	;b9fa
	jr z,lba06h		;b9fd
	ret m			;b9ff
	jr nc,lba5bh		;ba00
	ld c,a			;ba02
	sra c			;ba03
	xor d			;ba05
lba06h:
	ld e,a			;ba06
	xor 0bah		;ba07
	jp nc,02aceh		;ba09
	xor d			;ba0c
	xor d			;ba0d
	ld e,013h		;ba0e
	and b			;ba10
	ret p			;ba11
	jp nz,022aeh		;ba12
	and d			;ba15
	add a,c			;ba16
	ld d,(hl)		;ba17
	sub 0fdh		;ba18
	inc hl			;ba1a
	ld h,0afh		;ba1b
	xor e			;ba1d
	rra			;ba1e
	jr z,lba51h		;ba1f
	ld d,b			;ba21
	add a,b			;ba22
	xor h			;ba23
	and a			;ba24
	sbc a,e			;ba25
	sbc a,l			;ba26
	ld h,h			;ba27
	inc de			;ba28
	add a,b			;ba29
lba2ah:
	dec sp			;ba2a
	call nc,02607h		;ba2b
	djnz lba30h		;ba2e
lba30h:
	ld b,d			;ba30
	ld bc,04150h		;ba31
	adc a,0a8h		;ba34
	xor b			;ba36
	cp a			;ba37
	cp a			;ba38
	ld sp,hl		;ba39
	xor d			;ba3a
	xor a			;ba3b
	cp (hl)			;ba3c
	cp d			;ba3d
	ret po			;ba3e
	ld (bc),a		;ba3f
	add a,b			;ba40
	djnz lba45h		;ba41
	or b			;ba43
	ld l,(hl)		;ba44
lba45h:
	jp p,050afh		;ba45
	push af			;ba48
	ld h,d			;ba49
	adc a,h			;ba4a
	ld (de),a		;ba4b
	ld bc,038c4h		;ba4c
	add hl,bc		;ba4f
	ld c,(hl)		;ba50
lba51h:
	ld e,d			;ba51
	rla			;ba52
	di			;ba53
	ld d,e			;ba54
	rst 38h			;ba55
	rst 38h			;ba56
	rst 38h			;ba57
	rst 38h			;ba58
	rst 38h			;ba59
	rst 38h			;ba5a
lba5bh:
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
	ld h,b			;ba75
	ld (03232h),a		;ba76
	ld (03232h),a		;ba79
	ld (02f32h),a		;ba7c
	cpl			;ba7f
	cpl			;ba80
	cpl			;ba81
	cpl			;ba82
	cpl			;ba83
	cpl			;ba84
	cpl			;ba85
	cpl			;ba86
	cpl			;ba87
	cpl			;ba88
	cpl			;ba89
	cpl			;ba8a
	cpl			;ba8b
	cpl			;ba8c
	cpl			;ba8d
	cpl			;ba8e
	cpl			;ba8f
	inc l			;ba90
	inc l			;ba91
	inc l			;ba92
	jr nz,lbab5h		;ba93
	ld h,b			;ba95
	ld (03232h),a		;ba96
	ld (03232h),a		;ba99
	ld (03232h),a		;ba9c
	ld (02f2fh),a		;ba9f
	cpl			;baa2
	cpl			;baa3
	cpl			;baa4
	cpl			;baa5
	cpl			;baa6
	cpl			;baa7
	cpl			;baa8
	cpl			;baa9
lbaaah:
	cpl			;baaa
	cpl			;baab
	cpl			;baac
	cpl			;baad
	cpl			;baae
	cpl			;baaf
	cpl			;bab0
	jr nz,$+34		;bab1
	jr nz,$+34		;bab3
lbab5h:
	ld h,b			;bab5
	ld (03232h),a		;bab6
	ld (03232h),a		;bab9
	ld (03232h),a		;babc
	ld (02a2ah),a		;babf
	ld hl,(02a2ah)		;bac2
	ld hl,(02a2ah)		;bac5
	ld hl,(02a2ah)		;bac8
	ld hl,(02b2ah)		;bacb
	jr nz,$+34		;bace
	jr nz,lbaf2h		;bad0
	jr nz,lbaf4h		;bad2
	jr nz,lbb36h		;bad4
	ld (l7272h),a		;bad6
	ld (hl),d		;bad9
	ld (hl),d		;bada
	ld (hl),d		;badb
	ld (hl),d		;badc
	ld (hl),d		;badd
	ld (hl),d		;bade
	ld (02a2ah),a		;badf
	ld hl,(l6020h)		;bae2
	ld h,b			;bae5
	ld h,b			;bae6
	ld h,b			;bae7
	jr nz,$+34		;bae8
lbaeah:
	jr nz,$+34		;baea
	ld a,(02222h)		;baec
	ld (0202ah),hl		;baef
lbaf2h:
	jr nz,lbb14h		;baf2
lbaf4h:
	jr nz,lbb56h		;baf4
	ld l,b			;baf6
	ld l,b			;baf7
	ld l,b			;baf8
	ld l,b			;baf9
	ld l,b			;bafa
	ld l,b			;bafb
	ld l,b			;bafc
	ld l,b			;bafd
	ld l,b			;bafe
	jr z,lbb21h		;baff
	jr nz,lbb23h		;bb01
	ld h,b			;bb03
	jr nz,lbb26h		;bb04
	jr nz,lbb28h		;bb06
	ld h,b			;bb08
	jr z,lbb6bh		;bb09
	jr nz,lbb2dh		;bb0b
	ld h,b			;bb0d
	jr z,$+42		;bb0e
	jr z,lbb3dh		;bb10
	dec hl			;bb12
	dec hl			;bb13
lbb14h:
	jr z,lbb76h		;bb14
	ld h,b			;bb16
	ld h,b			;bb17
	jr z,$+42		;bb18
	jr z,lbb44h		;bb1a
	jr z,lbb46h		;bb1c
	ld h,b			;bb1e
	jr nz,$+98		;bb1f
lbb21h:
	jr z,lbb4bh		;bb21
lbb23h:
	ld h,b			;bb23
	ld h,b			;bb24
	ld h,b			;bb25
lbb26h:
	ld h,b			;bb26
	ld h,b			;bb27
lbb28h:
	jr z,lbb52h		;bb28
	jr z,$+98		;bb2a
	ld h,b			;bb2c
lbb2dh:
	ld h,b			;bb2d
	jr z,$+45		;bb2e
	dec hl			;bb30
	dec hl			;bb31
	dec hl			;bb32
	dec hl			;bb33
	dec hl			;bb34
	ld h,b			;bb35
lbb36h:
	ld h,b			;bb36
	jr z,$+42		;bb37
	cpl			;bb39
	cpl			;bb3a
	jr z,$+98		;bb3b
lbb3dh:
	jr nz,$+98		;bb3d
	jr z,lbb69h		;bb3f
	jr z,lbb6bh		;bb41
	ld h,b			;bb43
lbb44h:
	jr z,$+36		;bb44
lbb46h:
	ld (02f27h),hl		;bb46
	jr z,$+42		;bb49
lbb4bh:
	jr z,$+42		;bb4b
	jr z,lbb7ah		;bb4d
	dec hl			;bb4f
	dec hl			;bb50
	dec hl			;bb51
lbb52h:
	dec hl			;bb52
	jr z,lbb8dh		;bb53
	ld h,b			;bb55
lbb56h:
	ld h,b			;bb56
	ld h,b			;bb57
	jr z,lbb82h		;bb58
	jr z,lbb84h		;bb5a
	jr z,lbb86h		;bb5c
	jr z,$+42		;bb5e
	jr z,$+42		;bb60
	jr z,$+42		;bb62
	jr z,$+36		;bb64
	ld (02f27h),hl		;bb66
lbb69h:
	jr z,$+58		;bb69
lbb6bh:
	jr z,lbb95h		;bb6b
	dec hl			;bb6d
	dec hl			;bb6e
	dec hl			;bb6f
	jr z,lbb9ah		;bb70
	jr z,lbb9ch		;bb72
	jr c,lbbd6h		;bb74
lbb76h:
	jr nz,lbb98h		;bb76
	jr c,$+42		;bb78
lbb7ah:
	jr z,lbba4h		;bb7a
	jr z,lbba6h		;bb7c
	jr z,$+42		;bb7e
	jr z,$+42		;bb80
lbb82h:
	jr z,$+42		;bb82
lbb84h:
	jr c,lbbbeh		;bb84
lbb86h:
	ld (02f27h),hl		;bb86
	jr z,$+58		;bb89
	jr z,lbbb5h		;bb8b
lbb8dh:
	jr z,lbbb7h		;bb8d
	jr c,lbbb9h		;bb8f
	jr c,lbbbbh		;bb91
	jr z,$+58		;bb93
lbb95h:
	ld h,b			;bb95
	ld h,b			;bb96
	ld h,b			;bb97
lbb98h:
	jr c,$+42		;bb98
lbb9ah:
	jr z,lbbd4h		;bb9a
lbb9ch:
	jr c,lbbd6h		;bb9c
	ld (03232h),a		;bb9e
	ld (03832h),a		;bba1
lbba4h:
	jr c,lbbdeh		;bba4
lbba6h:
	ld (02722h),hl		;bba6
	jr c,$+58		;bba9
	jr c,lbbe5h		;bbab
	jr c,lbbe7h		;bbad
	jr c,$+58		;bbaf
	jr c,$+58		;bbb1
	jr c,$+58		;bbb3
lbbb5h:
	ld h,b			;bbb5
	ld h,b			;bbb6
lbbb7h:
	jr c,$+58		;bbb7
lbbb9h:
	jr c,$+58		;bbb9
lbbbbh:
	jr c,lbc2fh		;bbbb
	ld (hl),b		;bbbd
lbbbeh:
	ld (03232h),a		;bbbe
	ld (l7232h),a		;bbc1
	ld (hl),d		;bbc4
	jr c,$+36		;bbc5
	ld (02f22h),hl		;bbc7
	jr c,$+58		;bbca
	jr c,$+58		;bbcc
	jr c,$+58		;bbce
	jr nc,lbc02h		;bbd0
	jr nc,$+50		;bbd2
lbbd4h:
	jr c,lbc36h		;bbd4
lbbd6h:
	ld h,b			;bbd6
	jr c,lbc14h		;bbd7
	dec sp			;bbd9
	jr c,lbc14h		;bbda
	jr c,lbc50h		;bbdc
lbbdeh:
	ld (03232h),a		;bbde
	ld (l7232h),a		;bbe1
	ld (hl),b		;bbe4
lbbe5h:
	jr c,$+36		;bbe5
lbbe7h:
	ld (03822h),hl		;bbe7
	jr c,lbc24h		;bbea
	jr c,lbc26h		;bbec
	jr c,$+58		;bbee
	jr c,$+58		;bbf0
lbbf2h:
	jr c,lbc2fh		;bbf2
	jr c,lbc56h		;bbf4
	ld h,b			;bbf6
	dec sp			;bbf7
	dec sp			;bbf8
	dec sp			;bbf9
	dec sp			;bbfa
	jr c,$+58		;bbfb
	ld (hl),d		;bbfd
	ld (hl),d		;bbfe
	ld (03272h),a		;bbff
lbc02h:
	ld (03872h),a		;bc02
	jr c,lbc29h		;bc05
	ld (03822h),hl		;bc07
	jr c,lbc44h		;bc0a
	jr c,lbc46h		;bc0c
	jr c,$+58		;bc0e
	jr c,$+58		;bc10
	jr c,lbc4fh		;bc12
lbc14h:
	jr c,lbc76h		;bc14
	ld h,b			;bc16
	dec sp			;bc17
	dec sp			;bc18
	dec sp			;bc19
	dec sp			;bc1a
	jr c,lbc55h		;bc1b
	ld (hl),b		;bc1d
	ld (hl),d		;bc1e
	ld (03272h),a		;bc1f
	ld (hl),d		;bc22
	ld (hl),d		;bc23
lbc24h:
	jr c,$+58		;bc24
lbc26h:
	ld (03022h),hl		;bc26
lbc29h:
	jr nc,lbc63h		;bc29
	jr c,lbc65h		;bc2b
	jr c,lbc97h		;bc2d
lbc2fh:
	ld l,d			;bc2f
	ld l,d			;bc30
	ld l,d			;bc31
	ld l,b			;bc32
	dec sp			;bc33
	jr c,lbc96h		;bc34
lbc36h:
	ld h,b			;bc36
	dec sp			;bc37
	dec sp			;bc38
	dec sp			;bc39
	dec sp			;bc3a
	jr c,lbc75h		;bc3b
	jr c,lbcb1h		;bc3d
	ld (hl),b		;bc3f
	ld (hl),d		;bc40
	ld (hl),d		;bc41
	ld (hl),d		;bc42
	ld (hl),d		;bc43
lbc44h:
	jr c,lbc7eh		;bc44
lbc46h:
	ld (02222h),hl		;bc46
	jr nc,lbc7bh		;bc49
	jr nc,lbc85h		;bc4b
	jr c,$+108		;bc4d
lbc4fh:
	ld l,d			;bc4f
lbc50h:
	ld l,e			;bc50
	ld l,e			;bc51
	ld l,d			;bc52
	ld l,d			;bc53
	ld l,d			;bc54
lbc55h:
	ld h,b			;bc55
lbc56h:
	ld h,b			;bc56
	dec sp			;bc57
	dec sp			;bc58
	dec sp			;bc59
	ld a,(03a3ah)		;bc5a
	ld a,(07070h)		;bc5d
	ld (hl),d		;bc60
	ld (hl),d		;bc61
	ld (hl),b		;bc62
lbc63h:
	jr nz,lbc85h		;bc63
lbc65h:
	jr c,lbc89h		;bc65
	jr nz,lbc99h		;bc67
	jr nc,lbc9bh		;bc69
	jr nc,lbc9dh		;bc6b
	ld l,b			;bc6d
	ld l,d			;bc6e
	ld l,d			;bc6f
	ld l,d			;bc70
	ld l,d			;bc71
	ld a,d			;bc72
	ld a,d			;bc73
	ld l,d			;bc74
lbc75h:
	nop			;bc75
lbc76h:
	nop			;bc76
	nop			;bc77
	nop			;bc78
	nop			;bc79
	nop			;bc7a
lbc7bh:
	nop			;bc7b
	nop			;bc7c
	nop			;bc7d
lbc7eh:
	nop			;bc7e
lbc7fh:
	nop			;bc7f
	nop			;bc80
	nop			;bc81
	nop			;bc82
	nop			;bc83
	nop			;bc84
lbc85h:
	nop			;bc85
	nop			;bc86
	nop			;bc87
	nop			;bc88
lbc89h:
	nop			;bc89
	nop			;bc8a
	nop			;bc8b
	nop			;bc8c
	nop			;bc8d
	nop			;bc8e
	nop			;bc8f
	nop			;bc90
	nop			;bc91
	nop			;bc92
	nop			;bc93
	nop			;bc94
	nop			;bc95
lbc96h:
	add a,a			;bc96
lbc97h:
	pop hl			;bc97
	rst 38h			;bc98
lbc99h:
	rst 38h			;bc99
	add a,b			;bc9a
lbc9bh:
	nop			;bc9b
	nop			;bc9c
lbc9dh:
	ld bc,lfeffh		;bc9d
	dec b			;bca0
	ld a,060h		;bca1
	ld c,c			;bca3
	or l			;bca4
	ld (bc),a		;bca5
	ld a,l			;bca6
	ret p			;bca7
	pop af			;bca8
	xor c			;bca9
lbcaah:
	ret p			;bcaa
	ld a,(hl)		;bcab
	rst 8			;bcac
	jr nc,$+62		;bcad
	nop			;bcaf
	ld a,e			;bcb0
lbcb1h:
	call m,00f3eh		;bcb1
	ret po			;bcb4
	rst 38h			;bcb5
	rst 38h			;bcb6
	rst 38h			;bcb7
	call m,00100h		;bcb8
	rst 38h			;bcbb
sub_bcbch:
	rst 38h			;bcbc
	ret m			;bcbd
	ld a,e			;bcbe
	ld d,b			;bcbf
	ld a,(hl)		;bcc0
	rrca			;bcc1
	dec b			;bcc2
	ld l,(hl)		;bcc3
	call nc,00177h		;bcc4
	ret nz			;bcc7
	nop			;bcc8
	ex af,af'		;bcc9
	nop			;bcca
	nop			;bccb
	nop			;bccc
	nop			;bccd
	ccf			;bcce
	nop			;bccf
	inc a			;bcd0
	nop			;bcd1
	nop			;bcd2
	ld bc,0f3ffh		;bcd3
	adc a,l			;bcd6
	sbc a,b			;bcd7
	rst 18h			;bcd8
	rst 38h			;bcd9
	rst 38h			;bcda
	rst 38h			;bcdb
sub_bcdch:
	rst 38h			;bcdc
	add a,b			;bcdd
	ld c,041h		;bcde
	ld b,b			;bce0
	and e			;bce1
	ld (hl),d		;bce2
	and d			;bce3
	ld bc,l7c47h		;bce4
	and l			;bce7
	ex (sp),hl		;bce8
	rst 8			;bce9
	call nz,sub_af86h	;bcea
	rst 38h			;bced
	ret po			;bcee
	jr lbd25h		;bcef
	ld h,a			;bcf1
	add a,c			;bcf2
	ret p			;bcf3
	nop			;bcf4
	ld a,a			;bcf5
	rst 38h			;bcf6
	rst 38h			;bcf7
	ret m			;bcf8
	nop			;bcf9
	add hl,bc		;bcfa
	add a,e			;bcfb
	ex af,af'		;bcfc
	adc a,(iy-035h)		;bcfd
	ld h,d			;bd00
	add a,b			;bd01
	jr nz,lbd38h		;bd02
	ld sp,0fd99h		;bd04
	ld a,b			;bd07
	ld l,03fh		;bd08
	ld bc,lb7fah		;bd0a
	add a,a			;bd0d
	ld e,a			;bd0e
	rst 28h			;bd0f
	ld sp,hl		;bd10
	scf			;bd11
	defb 0ddh,0c0h,000h ;illegal sequence	;bd12
	rst 38h			;bd15
	rst 38h			;bd16
	rst 38h			;bd17
	defb 0fdh,0ffh,03bh ;illegal sequence	;bd18
	cp (hl)			;bd1b
	call m,00ea5h		;bd1c
	inc (hl)		;bd1f
	add a,c			;bd20
	dec a			;bd21
	ex de,hl		;bd22
	ld l,l			;bd23
	dec bc			;bd24
lbd25h:
	ld e,b			;bd25
	ld (hl),a		;bd26
	cp 0ffh			;bd27
	defb 0fdh,0feh,0adh ;illegal sequence	;bd29
	rst 30h			;bd2c
	call sub_faf7h		;bd2d
	dec de			;bd30
	ld a,a			;bd31
	add a,e			;bd32
	ret m			;bd33
	inc bc			;bd34
	rst 38h			;bd35
	rst 38h			;bd36
	rst 38h			;bd37
lbd38h:
	push af			;bd38
	sbc a,(hl)		;bd39
	nop			;bd3a
	dec d			;bd3b
	dec b			;bd3c
	inc b			;bd3d
	cp 000h			;bd3e
	ld bc,040eeh		;bd40
	nop			;bd43
	nop			;bd44
	jr nz,$+97		;bd45
	ld sp,hl		;bd47
	in a,(0f0h)		;bd48
	rra			;bd4a
	or (hl)			;bd4b
	ld c,b			;bd4c
	ld de,0227bh		;bd4d
	ld h,b			;bd50
	nop			;bd51
	inc e			;bd52
	nop			;bd53
	rra			;bd54
	rst 38h			;bd55
	rst 38h			;bd56
	ret m			;bd57
	ld (bc),a		;bd58
	ret po			;bd59
	nop			;bd5a
	ld d,l			;bd5b
	ld d,h			;bd5c
	call pe,0002fh		;bd5d
	cpl			;bd60
	ret nz			;bd61
	dec hl			;bd62
	nop			;bd63
	ld h,b			;bd64
	inc l			;bd65
	ld b,b			;bd66
	cp a			;bd67
	sbc a,e			;bd68
	jp c,lead9h		;bd69
	ld b,b			;bd6c
	inc bc			;bd6d
	ld l,d			;bd6e
	and b			;bd6f
	sub b			;bd70
	nop			;bd71
	nop			;bd72
	nop			;bd73
	rlca			;bd74
	rst 38h			;bd75
	rst 38h			;bd76
	rst 38h			;bd77
	rst 38h			;bd78
	rst 38h			;bd79
	rst 38h			;bd7a
lbd7bh:
	rst 38h			;bd7b
	rst 38h			;bd7c
	rst 38h			;bd7d
	rst 38h			;bd7e
	rst 38h			;bd7f
	rst 38h			;bd80
	rst 38h			;bd81
	rst 38h			;bd82
	rst 38h			;bd83
	rst 38h			;bd84
	rst 38h			;bd85
	rst 38h			;bd86
	rst 38h			;bd87
	rst 38h			;bd88
	rst 38h			;bd89
	rst 38h			;bd8a
	rst 38h			;bd8b
	rst 38h			;bd8c
	rst 38h			;bd8d
	rst 38h			;bd8e
	rst 38h			;bd8f
	rst 38h			;bd90
	rst 38h			;bd91
	rst 38h			;bd92
	rst 38h			;bd93
	rst 38h			;bd94
	rst 38h			;bd95
	cp h			;bd96
	dec l			;bd97
	rst 38h			;bd98
lbd99h:
	rst 38h			;bd99
	ret p			;bd9a
	nop			;bd9b
	nop			;bd9c
	nop			;bd9d
	ld bc,lc3ffh		;bd9e
	inc bc			;bda1
	ld b,b			;bda2
	adc a,c			;bda3
	ld de,0bb00h		;bda4
	ret p			;bda7
	pop hl			;bda8
	or c			;bda9
	ret po			;bdaa
	ld e,h			;bdab
	adc a,020h		;bdac
	ld e,000h		;bdae
	ld (hl),e		;bdb0
	ret m			;bdb1
	ld a,b			;bdb2
	rrca			;bdb3
	add a,c			;bdb4
	rst 38h			;bdb5
	rst 38h			;bdb6
	rst 38h			;bdb7
	rst 38h			;bdb8
lbdb9h:
	ret p			;bdb9
	nop			;bdba
	nop			;bdbb
	ld bc,l92feh		;bdbc
	nop			;bdbf
	inc l			;bdc0
	ld a,(025c2h)		;bdc1
	ret m			;bdc4
	ld c,082h		;bdc5
	ret nz			;bdc7
	nop			;bdc8
	inc b			;bdc9
	nop			;bdca
	nop			;bdcb
	nop			;bdcc
	nop			;bdcd
	cp 000h			;bdce
	jr c,lbdd2h		;bdd0
lbdd2h:
	nop			;bdd2
	inc bc			;bdd3
	rst 38h			;bdd4
	rst 0			;bdd5
	jp c,lafadh		;bdd6
	rst 38h			;bdd9
	rst 38h			;bdda
	rst 38h			;bddb
	ret m			;bddc
	nop			;bddd
	ld e,d			;bdde
	ld h,c			;bddf
	jr nz,$+98		;bde0
	inc h			;bde2
	ld h,c			;bde3
	xor 058h		;bde4
	ld d,c			;bde6
	ld c,d			;bde7
	djnz lbdb9h		;bde8
	call po,sub_6fc5h	;bdea
	rst 38h			;bded
	ret c			;bdee
	inc b			;bdef
	jr z,lbd99h		;bdf0
	add a,(hl)		;bdf2
	jp lff01h		;bdf3
	rst 38h			;bdf6
	rst 38h			;bdf7
lbdf8h:
	nop			;bdf8
	djnz lbe4eh		;bdf9
	rlca			;bdfb
	inc e			;bdfc
	ld a,l			;bdfd
	inc bc			;bdfe
	adc a,l			;bdff
	and b			;be00
	add a,b			;be01
	jr nz,lbe54h		;be02
	nop			;be04
	cp c			;be05
	ld a,l			;be06
	djnz lbe78h		;be07
	pop bc			;be09
	ret nz			;be0a
	ld a,0b7h		;be0b
	cp 0bdh			;be0d
	xor 032h		;be0f
	ld h,d			;be11
sub_be12h:
	and 000h		;be12
	ccf			;be14
	rst 38h			;be15
	rst 38h			;be16
	rst 38h			;be17
	ret m			;be18
	cp 07fh			;be19
	cp a			;be1b
	inc sp			;be1c
	ld c,d			;be1d
	rra			;be1e
	ld d,0c1h		;be1f
	dec sp			;be21
	ld d,l			;be22
	sub 0f6h		;be23
	rst 30h			;be25
	rrca			;be26
	jp m,lffffh		;be27
	cp 0b4h			;be2a
	push af			;be2c
	ld a,a			;be2d
	push af			;be2e
	rst 30h			;be2f
	inc l			;be30
	ccf			;be31
	call m,sub_ff60h	;be32
	rst 38h			;be35
	rst 38h			;be36
	rst 38h			;be37
	push af			;be38
	add a,e			;be39
	rst 38h			;be3a
	jp pe,08b30h		;be3b
	rst 38h			;be3e
	nop			;be3f
	ld bc,l8034h		;be40
	add a,b			;be43
	nop			;be44
	nop			;be45
	ccf			;be46
	jp (hl)			;be47
	defb 0ddh,0b5h ;or ixl	;be48
	dec a			;be4a
	and (hl)		;be4b
	ret z			;be4c
	add hl,bc		;be4d
lbe4eh:
	ld (lb020h),a		;be4e
	add a,b			;be51
	rrca			;be52
	ret p			;be53
lbe54h:
	rlca			;be54
	rst 38h			;be55
	rst 38h			;be56
	ret po			;be57
	dec b			;be58
	ld h,b			;be59
	nop			;be5a
	nop			;be5b
	ld (bc),a		;be5c
	call m,0003fh		;be5d
	inc sp			;be60
	ret nz			;be61
	ld d,e			;be62
	add a,b			;be63
	and b			;be64
	ld d,(hl)		;be65
	ld b,c			;be66
	ld (hl),a		;be67
	cp e			;be68
	jp c,ldadbh		;be69
	ld h,b			;be6c
	ld h,05ah		;be6d
	or c			;be6f
	sub b			;be70
	nop			;be71
	nop			;be72
	nop			;be73
	ld sp,lffffh		;be74
	pop af			;be77
lbe78h:
	rst 38h			;be78
	rst 38h			;be79
	rst 38h			;be7a
	rst 38h			;be7b
	rst 38h			;be7c
	cp 03fh			;be7d
	rst 38h			;be7f
	rst 38h			;be80
	rst 18h			;be81
	cp 03fh			;be82
	add a,c			;be84
	rst 38h			;be85
	rst 38h			;be86
	defb 0fdh,0ffh,0ffh ;illegal sequence	;be87
	ld a,a			;be8a
	rst 38h			;be8b
	rst 8			;be8c
	rst 10h			;be8d
	cp 07eh			;be8e
	rst 38h			;be90
	rst 38h			;be91
	rst 38h			;be92
	rst 38h			;be93
	rst 38h			;be94
	rst 38h			;be95
	cp l			;be96
	and c			;be97
	rst 38h			;be98
	rst 38h			;be99
	rst 38h			;be9a
	nop			;be9b
	nop			;be9c
	nop			;be9d
	nop			;be9e
	ld d,c			;be9f
	or 00fh			;bea0
	add a,c			;bea2
	ld b,h			;bea3
	ld e,c			;bea4
	ld (bc),a		;bea5
	ld e,l			;bea6
	ret p			;bea7
	ld h,c			;bea8
	ld sp,018e0h		;bea9
	adc a,(hl)		;beac
	jr nz,lbebeh		;bead
	nop			;beaf
	ld h,a			;beb0
	ret p			;beb1
	ld (hl),b		;beb2
	ld d,003h		;beb3
	rst 38h			;beb5
	add a,b			;beb6
	inc bc			;beb7
	adc a,b			;beb8
lbeb9h:
	rst 38h			;beb9
	ret nz			;beba
	nop			;bebb
	nop			;bebc
	nop			;bebd
lbebeh:
	cp b			;bebe
	nop			;bebf
	inc d			;bec0
	ld a,c			;bec1
	ld b,h			;bec2
	ld (hl),0a6h		;bec3
	rra			;bec5
	ld bc,020c4h		;bec6
	inc b			;bec9
	nop			;beca
	nop			;becb
	rlca			;becc
	inc bc			;becd
	ld a,h			;bece
	nop			;becf
	ld d,b			;bed0
	nop			;bed1
	nop			;bed2
	rlca			;bed3
	rst 38h			;bed4
	rra			;bed5
	defb 0ddh,0adh ;xor ixl	;bed6
	rst 18h			;bed8
	rst 38h			;bed9
	rst 38h			;beda
	rst 38h			;bedb
	ld bc,05400h		;bedc
	daa			;bedf
	ld de,0ac7eh		;bee0
	and b			;bee3
	nop			;bee4
	ld b,a			;bee5
	ld d,d			;bee6
	sub h			;bee7
	rst 28h			;bee8
	rlca			;bee9
	cp 0e5h			;beea
	ld l,0ffh		;beec
	xor 00eh		;beee
	add hl,de		;bef0
	ld c,l			;bef1
	rrca			;bef2
	rlca			;bef3
	add a,a			;bef4
	rst 38h			;bef5
	rst 38h			;bef6
	ret p			;bef7
	nop			;bef8
	inc (hl)		;bef9
	ld b,d			;befa
	rra			;befb
	inc d			;befc
	dec a			;befd
	nop			;befe
sub_beffh:
	inc l			;beff
lbf00h:
	pop bc			;bf00
	add a,b			;bf01
lbf02h:
	jr nz,lbf34h		;bf02
	ld bc,lbeb9h		;bf04
	adc a,b			;bf07
	adc a,a			;bf08
	cp 0ffh			;bf09
	ld b,0b7h		;bf0b
sub_bf0dh:
	defb 0fdh,07fh,0f6h ;illegal sequence	;bf0d
	and h			;bf10
	jp c,007c0h		;bf11
	rst 38h			;bf14
	rst 38h			;bf15
	rst 38h			;bf16
	rst 38h			;bf17
	jp m,lfffch		;bf18
	sbc a,l			;bf1b
	call z,01f52h		;bf1c
	ld a,(de)		;bf1f
	ld b,c			;bf20
	ld (hl),0efh		;bf21
	ld (hl),e		;bf23
	ld l,h			;bf24
	ld e,(hl)		;bf25
	adc a,a			;bf26
	call m,sub_fc1fh	;bf27
	ld a,l			;bf2a
	and h			;bf2b
	push de			;bf2c
lbf2dh:
	rlca			;bf2d
	call po,0257fh		;bf2e
	ld a,a			;bf31
	rst 20h			;bf32
	adc a,a			;bf33
lbf34h:
	rst 38h			;bf34
	rst 38h			;bf35
	rst 38h			;bf36
	rst 38h			;bf37
	jp p,00080h		;bf38
	dec d			;bf3b
	ld b,b			;bf3c
	ld d,c			;bf3d
	rst 38h			;bf3e
	nop			;bf3f
	ld (bc),a		;bf40
	ret z			;bf41
	inc bc			;bf42
	nop			;bf43
	jr nz,lbf56h		;bf44
	ld e,a			;bf46
	exx			;bf47
	res 6,a			;bf48
	push de			;bf4a
	xor a			;bf4b
	ld c,b			;bf4c
	ld bc,l7a14h		;bf4d
	ld e,b			;bf50
	djnz lbf56h		;bf51
	rst 38h			;bf53
	add a,c			;bf54
	rst 38h			;bf55
lbf56h:
	rst 38h			;bf56
	ret po			;bf57
	dec b			;bf58
	ld h,b			;bf59
	nop			;bf5a
	nop			;bf5b
	dec c			;bf5c
	ld a,(hl)		;bf5d
	ld a,a			;bf5e
	nop			;bf5f
	cpl			;bf60
	add a,b			;bf61
	and a			;bf62
	ld (hl),c		;bf63
	ld e,h			;bf64
	xor (hl)		;bf65
	ld b,b			;bf66
	rst 30h			;bf67
	sbc a,l			;bf68
	sbc a,e			;bf69
	ld e,e			;bf6a
	or b			;bf6b
	nop			;bf6c
	ld b,h			;bf6d
	ld d,b			;bf6e
	sub c			;bf6f
	ld hl,00000h		;bf70
	nop			;bf73
	ld e,h			;bf74
	rst 38h			;bf75
	rst 38h			;bf76
	cp 001h			;bf77
	rst 38h			;bf79
	rst 38h			;bf7a
	rst 38h			;bf7b
	rst 38h			;bf7c
	rst 38h			;bf7d
	jp lffffh		;bf7e
	ex (sp),hl		;bf81
	cp 008h			;bf82
	add a,b			;bf84
	rst 38h			;bf85
	ei			;bf86
	ld sp,hl		;bf87
	rst 38h			;bf88
	cp 0ffh			;bf89
	ld a,a			;bf8b
	rst 18h			;bf8c
	rst 10h			;bf8d
	cp (hl)			;bf8e
	cp h			;bf8f
	rst 38h			;bf90
	rst 38h			;bf91
	rst 28h			;bf92
	rst 38h			;bf93
	rst 38h			;bf94
	rst 38h			;bf95
	cp h			;bf96
	daa			;bf97
	rst 38h			;bf98
	rst 38h			;bf99
	rst 38h			;bf9a
	ret po			;bf9b
	nop			;bf9c
	nop			;bf9d
	nop			;bf9e
	xor h			;bf9f
	ld d,d			;bfa0
	dec c			;bfa1
	ret nz			;bfa2
	add a,h			;bfa3
	push de			;bfa4
	rrca			;bfa5
	sbc a,e			;bfa6
	ret p			;bfa7
	ld h,b			;bfa8
	ld h,c			;bfa9
	ret nz			;bfaa
	jr $-114		;bfab
	nop			;bfad
	ld de,lc700h		;bfae
	ret po			;bfb1
	ret po			;bfb2
	jr lbfbch		;bfb3
	rst 38h			;bfb5
	cp l			;bfb6
	xor l			;bfb7
	cp e			;bfb8
	rst 38h			;bfb9
	rst 38h			;bfba
	nop			;bfbb
lbfbch:
	nop			;bfbc
	nop			;bfbd
	ld l,(hl)		;bfbe
	ld bc,laccch		;bfbf
	and b			;bfc2
	adc a,b			;bfc3
	add hl,hl		;bfc4
	inc e			;bfc5
	adc a,d			;bfc6
	adc a,h			;bfc7
	ld h,b			;bfc8
	inc b			;bfc9
	nop			;bfca
	nop			;bfcb
	add hl,bc		;bfcc
	rst 20h			;bfcd
	cp h			;bfce
	jr nz,lc031h		;bfcf
	nop			;bfd1
	nop			;bfd2
	rrca			;bfd3
	call m,sub_ff3fh	;bfd4
	rst 38h			;bfd7
	rst 38h			;bfd8
	rst 38h			;bfd9
	rst 38h			;bfda
	ret p			;bfdb
	ld bc,l7c08h		;bfdc
	jp (hl)			;bfdf
	dec sp			;bfe0
	inc de			;bfe1
	or h			;bfe2
	ld h,a			;bfe3
	rst 10h			;bfe4
	ld b,c			;bfe5
	cp c			;bfe6
	add hl,hl		;bfe7
	cp a			;bfe8
	ret p			;bfe9
lbfeah:
	ld a,a			;bfea
	defb 0edh ;next byte illegal after ed	;bfeb
	and a			;bfec
	ei			;bfed
	push af			;bfee
	inc d			;bfef
	add hl,de		;bff0
	xor c			;bff1
	inc e			;bff2
	dec hl			;bff3
	rst 8			;bff4
	rst 38h			;bff5
	cp 000h			;bff6
	nop			;bff8
	ld (01e43h),hl		;bff9
	inc c			;bffc
	ld e,(hl)		;bffd
	nop			;bffe
sub_bfffh:
	ld e,000h		;bfff
	nop			;c001
	nop			;c002
sub_c003h:
	nop			;c003
	nop			;c004
	nop			;c005
	nop			;c006
lc007h:
	nop			;c007
	nop			;c008
	nop			;c009
	nop			;c00a
	nop			;c00b
	nop			;c00c
	nop			;c00d
	nop			;c00e
	nop			;c00f
	nop			;c010
lc011h:
	nop			;c011
	nop			;c012
	nop			;c013
	nop			;c014
	nop			;c015
	nop			;c016
lc017h:
	nop			;c017
	nop			;c018
	nop			;c019
	nop			;c01a
	nop			;c01b
	nop			;c01c
	nop			;c01d
	nop			;c01e
	nop			;c01f
	nop			;c020
	nop			;c021
	nop			;c022
	nop			;c023
	nop			;c024
	nop			;c025
	nop			;c026
	nop			;c027
	nop			;c028
	nop			;c029
	nop			;c02a
	ld e,030h		;c02b
	pop hl			;c02d
	add a,b			;c02e
	nop			;c02f
	nop			;c030
lc031h:
	nop			;c031
	nop			;c032
	nop			;c033
	nop			;c034
	nop			;c035
	nop			;c036
	nop			;c037
	nop			;c038
	nop			;c039
	nop			;c03a
	nop			;c03b
	nop			;c03c
	nop			;c03d
	nop			;c03e
	nop			;c03f
	nop			;c040
	nop			;c041
	nop			;c042
	nop			;c043
	nop			;c044
	nop			;c045
	nop			;c046
	nop			;c047
	nop			;c048
	nop			;c049
	nop			;c04a
	nop			;c04b
	nop			;c04c
	nop			;c04d
	nop			;c04e
	nop			;c04f
	nop			;c050
	nop			;c051
	ret m			;c052
	ld l,a			;c053
lc054h:
	nop			;c054
	nop			;c055
	nop			;c056
	nop			;c057
	nop			;c058
	nop			;c059
	nop			;c05a
	nop			;c05b
	nop			;c05c
	nop			;c05d
	nop			;c05e
	nop			;c05f
	nop			;c060
	nop			;c061
	nop			;c062
	nop			;c063
	nop			;c064
	nop			;c065
	nop			;c066
	nop			;c067
	nop			;c068
	nop			;c069
	rst 38h			;c06a
	ld e,b			;c06b
	cp d			;c06c
	nop			;c06d
	ret c			;c06e
	ld bc,lf36fh		;c06f
	ld a,a			;c072
	ld h,b			;c073
	nop			;c074
	nop			;c075
	nop			;c076
	nop			;c077
	nop			;c078
	nop			;c079
	nop			;c07a
	nop			;c07b
	nop			;c07c
	nop			;c07d
	nop			;c07e
	nop			;c07f
	nop			;c080
lc081h:
	nop			;c081
	nop			;c082
	nop			;c083
	nop			;c084
	nop			;c085
	nop			;c086
	nop			;c087
	nop			;c088
	nop			;c089
	ld e,a			;c08a
	ld e,h			;c08b
	cp d			;c08c
	push af			;c08d
	add a,c			;c08e
	ex de,hl		;c08f
	ld a,h			;c090
	rra			;c091
	ld a,a			;c092
	ret p			;c093
	nop			;c094
	nop			;c095
	nop			;c096
	nop			;c097
	nop			;c098
	nop			;c099
	nop			;c09a
	nop			;c09b
	nop			;c09c
	nop			;c09d
	nop			;c09e
	nop			;c09f
	nop			;c0a0
	nop			;c0a1
	nop			;c0a2
	nop			;c0a3
	nop			;c0a4
	nop			;c0a5
	nop			;c0a6
	nop			;c0a7
sub_c0a8h:
	nop			;c0a8
sub_c0a9h:
	nop			;c0a9
lc0aah:
	nop			;c0aa
	nop			;c0ab
	nop			;c0ac
	nop			;c0ad
	nop			;c0ae
	nop			;c0af
	nop			;c0b0
	nop			;c0b1
	nop			;c0b2
	nop			;c0b3
	nop			;c0b4
	nop			;c0b5
	nop			;c0b6
	nop			;c0b7
	nop			;c0b8
	nop			;c0b9
	nop			;c0ba
	nop			;c0bb
	nop			;c0bc
	nop			;c0bd
	nop			;c0be
	nop			;c0bf
lc0c0h:
	nop			;c0c0
lc0c1h:
	nop			;c0c1
	nop			;c0c2
	nop			;c0c3
	nop			;c0c4
	nop			;c0c5
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
	nop			;c0d4
	nop			;c0d5
	nop			;c0d6
	nop			;c0d7
	nop			;c0d8
	nop			;c0d9
	nop			;c0da
	nop			;c0db
	nop			;c0dc
	nop			;c0dd
	nop			;c0de
	nop			;c0df
lc0e0h:
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
	nop			;c0f6
	nop			;c0f7
	nop			;c0f8
	nop			;c0f9
	nop			;c0fa
	nop			;c0fb
sub_c0fch:
	nop			;c0fc
	nop			;c0fd
	nop			;c0fe
	nop			;c0ff
	nop			;c100
	nop			;c101
	nop			;c102
	nop			;c103
	nop			;c104
	nop			;c105
	nop			;c106
	nop			;c107
	nop			;c108
	nop			;c109
	nop			;c10a
	nop			;c10b
	nop			;c10c
	nop			;c10d
	nop			;c10e
	nop			;c10f
	nop			;c110
	nop			;c111
	nop			;c112
	nop			;c113
	nop			;c114
	nop			;c115
	nop			;c116
	nop			;c117
	nop			;c118
	nop			;c119
	nop			;c11a
	nop			;c11b
	nop			;c11c
	nop			;c11d
	nop			;c11e
	nop			;c11f
	nop			;c120
	nop			;c121
	nop			;c122
	nop			;c123
	nop			;c124
	nop			;c125
	nop			;c126
	nop			;c127
	nop			;c128
	nop			;c129
	nop			;c12a
	ld hl,01129h		;c12b
	ld b,b			;c12e
	nop			;c12f
	nop			;c130
	nop			;c131
	nop			;c132
	nop			;c133
	nop			;c134
	nop			;c135
	nop			;c136
	nop			;c137
	nop			;c138
	nop			;c139
	nop			;c13a
	nop			;c13b
	nop			;c13c
	nop			;c13d
	nop			;c13e
	nop			;c13f
	nop			;c140
	nop			;c141
	nop			;c142
	nop			;c143
	nop			;c144
	nop			;c145
	nop			;c146
	nop			;c147
	nop			;c148
	nop			;c149
	ld bc,0e857h		;c14a
	nop			;c14d
	nop			;c14e
	nop			;c14f
	nop			;c150
	ld bc,ld369h		;c151
	nop			;c154
	nop			;c155
	nop			;c156
	nop			;c157
	nop			;c158
	nop			;c159
	nop			;c15a
	nop			;c15b
	nop			;c15c
	nop			;c15d
	nop			;c15e
	nop			;c15f
lc160h:
	nop			;c160
	nop			;c161
	nop			;c162
	nop			;c163
	nop			;c164
	nop			;c165
	nop			;c166
	nop			;c167
	nop			;c168
	nop			;c169
	rst 30h			;c16a
	ld a,c			;c16b
	ld e,l			;c16c
	rlca			;c16d
	call pe,07e07h		;c16e
	defb 0ddh,05fh,0c0h ;illegal sequence	;c171
	nop			;c174
	nop			;c175
	nop			;c176
	nop			;c177
	nop			;c178
	nop			;c179
	nop			;c17a
	nop			;c17b
	nop			;c17c
	nop			;c17d
	nop			;c17e
	nop			;c17f
	nop			;c180
	nop			;c181
	nop			;c182
	nop			;c183
	nop			;c184
	nop			;c185
	nop			;c186
	nop			;c187
	nop			;c188
	nop			;c189
	ccf			;c18a
	ld a,d			;c18b
	ld a,(hl)		;c18c
	rst 28h			;c18d
	rst 38h			;c18e
	defb 0fdh,05fh,0f6h ;illegal sequence	;c18f
	ld e,e			;c192
	ret pe			;c193
	nop			;c194
	nop			;c195
	nop			;c196
	nop			;c197
	nop			;c198
	nop			;c199
	nop			;c19a
	nop			;c19b
	nop			;c19c
	nop			;c19d
	nop			;c19e
	nop			;c19f
	nop			;c1a0
	nop			;c1a1
	nop			;c1a2
	nop			;c1a3
	nop			;c1a4
	nop			;c1a5
	nop			;c1a6
	nop			;c1a7
	nop			;c1a8
	nop			;c1a9
	nop			;c1aa
	nop			;c1ab
	nop			;c1ac
	nop			;c1ad
	nop			;c1ae
	nop			;c1af
	nop			;c1b0
	nop			;c1b1
	nop			;c1b2
	nop			;c1b3
	nop			;c1b4
	nop			;c1b5
	nop			;c1b6
	nop			;c1b7
	nop			;c1b8
	nop			;c1b9
	nop			;c1ba
	nop			;c1bb
	nop			;c1bc
	nop			;c1bd
	nop			;c1be
	nop			;c1bf
	nop			;c1c0
	nop			;c1c1
	nop			;c1c2
	nop			;c1c3
	nop			;c1c4
	nop			;c1c5
	nop			;c1c6
	nop			;c1c7
	nop			;c1c8
	nop			;c1c9
	nop			;c1ca
	nop			;c1cb
	nop			;c1cc
	nop			;c1cd
	nop			;c1ce
	nop			;c1cf
	nop			;c1d0
	nop			;c1d1
	nop			;c1d2
	nop			;c1d3
	nop			;c1d4
	nop			;c1d5
	nop			;c1d6
	nop			;c1d7
	nop			;c1d8
	nop			;c1d9
	nop			;c1da
	nop			;c1db
	nop			;c1dc
	nop			;c1dd
	nop			;c1de
	nop			;c1df
	nop			;c1e0
	nop			;c1e1
	nop			;c1e2
	nop			;c1e3
	nop			;c1e4
	nop			;c1e5
	nop			;c1e6
	nop			;c1e7
	nop			;c1e8
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
	nop			;c1fe
	nop			;c1ff
	nop			;c200
	nop			;c201
	nop			;c202
	nop			;c203
	nop			;c204
	nop			;c205
	nop			;c206
	nop			;c207
	nop			;c208
	nop			;c209
	nop			;c20a
	nop			;c20b
	nop			;c20c
	nop			;c20d
	nop			;c20e
	nop			;c20f
lc210h:
	nop			;c210
	nop			;c211
	nop			;c212
	nop			;c213
	nop			;c214
	nop			;c215
	nop			;c216
	nop			;c217
	nop			;c218
	nop			;c219
	nop			;c21a
	nop			;c21b
	nop			;c21c
	nop			;c21d
	nop			;c21e
	nop			;c21f
	nop			;c220
	nop			;c221
	nop			;c222
	nop			;c223
	nop			;c224
	nop			;c225
	nop			;c226
	nop			;c227
	nop			;c228
	nop			;c229
	nop			;c22a
	ld hl,01249h		;c22b
	ld b,b			;c22e
	nop			;c22f
	nop			;c230
	nop			;c231
	nop			;c232
	nop			;c233
	nop			;c234
	nop			;c235
	nop			;c236
	nop			;c237
	nop			;c238
	nop			;c239
	nop			;c23a
	nop			;c23b
	nop			;c23c
	nop			;c23d
	nop			;c23e
	nop			;c23f
	nop			;c240
	nop			;c241
	nop			;c242
	nop			;c243
	nop			;c244
	nop			;c245
	nop			;c246
	nop			;c247
	nop			;c248
	nop			;c249
	inc bc			;c24a
	ld a,a			;c24b
	ret pe			;c24c
	nop			;c24d
	nop			;c24e
	nop			;c24f
	nop			;c250
	inc bc			;c251
	ld e,d			;c252
	xor a			;c253
	nop			;c254
	nop			;c255
	nop			;c256
	nop			;c257
lc258h:
	nop			;c258
	nop			;c259
	nop			;c25a
	nop			;c25b
	nop			;c25c
	nop			;c25d
	nop			;c25e
	nop			;c25f
	nop			;c260
	nop			;c261
	nop			;c262
	nop			;c263
	nop			;c264
	nop			;c265
	nop			;c266
	nop			;c267
	nop			;c268
	nop			;c269
	cp a			;c26a
	ld a,b			;c26b
	ld e,a			;c26c
	cpl			;c26d
	sub 01bh		;c26e
	ld a,a			;c270
	cp 07fh			;c271
	add a,b			;c273
	nop			;c274
	nop			;c275
	nop			;c276
	nop			;c277
	nop			;c278
	nop			;c279
	nop			;c27a
	nop			;c27b
lc27ch:
	nop			;c27c
	nop			;c27d
	nop			;c27e
	nop			;c27f
	nop			;c280
	nop			;c281
	nop			;c282
	nop			;c283
	nop			;c284
	nop			;c285
	nop			;c286
	nop			;c287
	nop			;c288
	nop			;c289
	rla			;c28a
	ld a,c			;c28b
	ld a,l			;c28c
	rst 18h			;c28d
	add a,b			;c28e
	jp m,lbd7bh		;c28f
	ld a,c			;c292
	call p,00000h		;c293
	nop			;c296
	nop			;c297
	nop			;c298
	nop			;c299
	nop			;c29a
	nop			;c29b
	nop			;c29c
	nop			;c29d
	nop			;c29e
	nop			;c29f
	nop			;c2a0
	nop			;c2a1
	nop			;c2a2
	nop			;c2a3
	nop			;c2a4
	nop			;c2a5
	nop			;c2a6
	nop			;c2a7
	nop			;c2a8
	nop			;c2a9
	nop			;c2aa
	nop			;c2ab
	nop			;c2ac
	nop			;c2ad
	nop			;c2ae
	nop			;c2af
	nop			;c2b0
	nop			;c2b1
	nop			;c2b2
	nop			;c2b3
	nop			;c2b4
	nop			;c2b5
	nop			;c2b6
	nop			;c2b7
	nop			;c2b8
	nop			;c2b9
	nop			;c2ba
	nop			;c2bb
	nop			;c2bc
	nop			;c2bd
	nop			;c2be
	nop			;c2bf
	nop			;c2c0
	nop			;c2c1
sub_c2c2h:
	nop			;c2c2
	nop			;c2c3
	nop			;c2c4
	nop			;c2c5
	nop			;c2c6
	nop			;c2c7
	nop			;c2c8
	nop			;c2c9
	nop			;c2ca
	nop			;c2cb
	nop			;c2cc
	nop			;c2cd
	nop			;c2ce
lc2cfh:
	nop			;c2cf
	nop			;c2d0
	nop			;c2d1
	nop			;c2d2
	nop			;c2d3
	nop			;c2d4
	nop			;c2d5
	nop			;c2d6
	nop			;c2d7
	nop			;c2d8
	nop			;c2d9
	nop			;c2da
	nop			;c2db
	nop			;c2dc
	nop			;c2dd
	nop			;c2de
	nop			;c2df
	nop			;c2e0
	nop			;c2e1
	nop			;c2e2
	nop			;c2e3
	nop			;c2e4
	nop			;c2e5
	nop			;c2e6
	nop			;c2e7
	nop			;c2e8
	nop			;c2e9
	nop			;c2ea
	nop			;c2eb
	nop			;c2ec
	nop			;c2ed
	nop			;c2ee
	nop			;c2ef
	nop			;c2f0
	nop			;c2f1
	nop			;c2f2
	nop			;c2f3
	nop			;c2f4
	nop			;c2f5
	nop			;c2f6
	nop			;c2f7
	nop			;c2f8
	nop			;c2f9
	nop			;c2fa
	nop			;c2fb
	nop			;c2fc
	nop			;c2fd
	nop			;c2fe
	nop			;c2ff
	nop			;c300
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
	nop			;c310
	nop			;c311
	nop			;c312
	nop			;c313
	nop			;c314
	nop			;c315
	nop			;c316
	nop			;c317
	nop			;c318
	nop			;c319
	nop			;c31a
	nop			;c31b
	nop			;c31c
	nop			;c31d
	nop			;c31e
	nop			;c31f
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
	djnz lc377h		;c32b
	ld (bc),a		;c32d
	ld b,b			;c32e
	nop			;c32f
	nop			;c330
	nop			;c331
	nop			;c332
	nop			;c333
	nop			;c334
	nop			;c335
	nop			;c336
	nop			;c337
	nop			;c338
	nop			;c339
	nop			;c33a
	nop			;c33b
	nop			;c33c
	nop			;c33d
	nop			;c33e
	nop			;c33f
	nop			;c340
	nop			;c341
	nop			;c342
	nop			;c343
	nop			;c344
	nop			;c345
	nop			;c346
	nop			;c347
	nop			;c348
	nop			;c349
	dec b			;c34a
	ld a,a			;c34b
	call p,00000h		;c34c
	nop			;c34f
	nop			;c350
	dec b			;c351
	ld a,e			;c352
	ld a,a			;c353
	nop			;c354
	nop			;c355
	nop			;c356
	nop			;c357
	nop			;c358
	nop			;c359
	nop			;c35a
	nop			;c35b
	nop			;c35c
	nop			;c35d
	nop			;c35e
	nop			;c35f
	nop			;c360
	nop			;c361
	nop			;c362
	nop			;c363
	nop			;c364
	nop			;c365
	nop			;c366
	nop			;c367
	nop			;c368
	nop			;c369
	rst 38h			;c36a
	ld e,b			;c36b
	dec e			;c36c
	ld a,l			;c36d
	cp a			;c36e
	ld a,a			;c36f
	ld (hl),a		;c370
	cp 07dh			;c371
	nop			;c373
	nop			;c374
	nop			;c375
	nop			;c376
lc377h:
	nop			;c377
	nop			;c378
	nop			;c379
	nop			;c37a
	nop			;c37b
	nop			;c37c
	nop			;c37d
	nop			;c37e
	nop			;c37f
	nop			;c380
	nop			;c381
	nop			;c382
	nop			;c383
	nop			;c384
	nop			;c385
	nop			;c386
	nop			;c387
	nop			;c388
	nop			;c389
	rlca			;c38a
	ld a,b			;c38b
	push af			;c38c
	xor (hl)		;c38d
	ld l,(hl)		;c38e
	rst 18h			;c38f
	ld a,a			;c390
	defb 0fdh,07ah,0feh ;illegal sequence	;c391
	nop			;c394
	nop			;c395
sub_c396h:
	nop			;c396
	nop			;c397
	nop			;c398
	nop			;c399
	nop			;c39a
	nop			;c39b
	nop			;c39c
	nop			;c39d
	nop			;c39e
	nop			;c39f
	nop			;c3a0
	nop			;c3a1
	nop			;c3a2
	nop			;c3a3
	nop			;c3a4
	nop			;c3a5
	nop			;c3a6
	nop			;c3a7
	nop			;c3a8
	nop			;c3a9
	nop			;c3aa
	nop			;c3ab
	nop			;c3ac
	nop			;c3ad
	nop			;c3ae
	nop			;c3af
	nop			;c3b0
	nop			;c3b1
	nop			;c3b2
	nop			;c3b3
	nop			;c3b4
	nop			;c3b5
	nop			;c3b6
	nop			;c3b7
	nop			;c3b8
	nop			;c3b9
	nop			;c3ba
	nop			;c3bb
	nop			;c3bc
	nop			;c3bd
	nop			;c3be
	nop			;c3bf
	nop			;c3c0
	nop			;c3c1
	nop			;c3c2
	nop			;c3c3
	nop			;c3c4
	nop			;c3c5
	nop			;c3c6
	nop			;c3c7
	nop			;c3c8
	nop			;c3c9
	nop			;c3ca
	nop			;c3cb
	nop			;c3cc
	nop			;c3cd
	nop			;c3ce
	nop			;c3cf
	nop			;c3d0
	nop			;c3d1
	nop			;c3d2
	nop			;c3d3
	nop			;c3d4
	nop			;c3d5
	nop			;c3d6
	nop			;c3d7
	nop			;c3d8
	nop			;c3d9
	nop			;c3da
	nop			;c3db
	nop			;c3dc
	nop			;c3dd
	nop			;c3de
	nop			;c3df
	nop			;c3e0
	nop			;c3e1
	nop			;c3e2
	nop			;c3e3
	nop			;c3e4
	nop			;c3e5
	nop			;c3e6
	nop			;c3e7
	nop			;c3e8
	nop			;c3e9
	nop			;c3ea
	nop			;c3eb
	nop			;c3ec
	nop			;c3ed
	nop			;c3ee
	nop			;c3ef
	nop			;c3f0
	nop			;c3f1
	nop			;c3f2
	nop			;c3f3
	nop			;c3f4
	nop			;c3f5
	nop			;c3f6
	nop			;c3f7
	nop			;c3f8
	nop			;c3f9
	nop			;c3fa
	nop			;c3fb
	nop			;c3fc
	nop			;c3fd
	nop			;c3fe
lc3ffh:
	nop			;c3ff
	nop			;c400
	nop			;c401
	nop			;c402
	nop			;c403
	nop			;c404
	nop			;c405
	nop			;c406
	nop			;c407
	nop			;c408
sub_c409h:
	nop			;c409
	nop			;c40a
	nop			;c40b
	nop			;c40c
	nop			;c40d
	nop			;c40e
	nop			;c40f
	nop			;c410
	nop			;c411
	nop			;c412
	nop			;c413
	nop			;c414
	nop			;c415
	nop			;c416
	nop			;c417
	nop			;c418
	nop			;c419
	nop			;c41a
	nop			;c41b
	nop			;c41c
	nop			;c41d
	nop			;c41e
	nop			;c41f
	nop			;c420
	nop			;c421
	nop			;c422
	nop			;c423
	nop			;c424
	nop			;c425
	nop			;c426
	nop			;c427
	nop			;c428
	nop			;c429
	nop			;c42a
	inc c			;c42b
	jp m,lc007h		;c42c
	nop			;c42f
	nop			;c430
	nop			;c431
	nop			;c432
	nop			;c433
	nop			;c434
	nop			;c435
	nop			;c436
	nop			;c437
	nop			;c438
	nop			;c439
	nop			;c43a
	nop			;c43b
	nop			;c43c
	nop			;c43d
	nop			;c43e
	nop			;c43f
	nop			;c440
	nop			;c441
	nop			;c442
	nop			;c443
	nop			;c444
	nop			;c445
	nop			;c446
	nop			;c447
	nop			;c448
	nop			;c449
	dec c			;c44a
	ld a,b			;c44b
	call m,00000h		;c44c
	nop			;c44f
	nop			;c450
	rrca			;c451
	ld a,d			;c452
	cp 000h			;c453
	nop			;c455
	nop			;c456
	nop			;c457
	nop			;c458
	nop			;c459
	nop			;c45a
	nop			;c45b
	nop			;c45c
	nop			;c45d
	nop			;c45e
	nop			;c45f
	nop			;c460
	nop			;c461
	nop			;c462
	nop			;c463
	nop			;c464
	nop			;c465
	nop			;c466
	nop			;c467
	nop			;c468
	nop			;c469
	rst 38h			;c46a
	ld a,c			;c46b
	ld e,a			;c46c
	ld a,a			;c46d
	ld a,l			;c46e
	or a			;c46f
	ld a,a			;c470
	defb 0fdh,06fh ;ld iyl,a	;c471
	nop			;c473
	nop			;c474
	nop			;c475
	nop			;c476
	nop			;c477
	nop			;c478
	nop			;c479
	nop			;c47a
	nop			;c47b
	nop			;c47c
	nop			;c47d
	nop			;c47e
	nop			;c47f
	nop			;c480
	nop			;c481
	nop			;c482
	nop			;c483
	nop			;c484
	nop			;c485
	nop			;c486
	nop			;c487
	nop			;c488
	nop			;c489
	rlca			;c48a
	ld e,a			;c48b
	ex de,hl		;c48c
	cp a			;c48d
	ld a,a			;c48e
	ld a,a			;c48f
	ld a,b			;c490
	ld a,(l7f39h)		;c491
	nop			;c494
	nop			;c495
	nop			;c496
	nop			;c497
	nop			;c498
	nop			;c499
	nop			;c49a
	nop			;c49b
	nop			;c49c
	nop			;c49d
	nop			;c49e
	nop			;c49f
	nop			;c4a0
	nop			;c4a1
	nop			;c4a2
	nop			;c4a3
	nop			;c4a4
	nop			;c4a5
	nop			;c4a6
	nop			;c4a7
	nop			;c4a8
	nop			;c4a9
	nop			;c4aa
	nop			;c4ab
	nop			;c4ac
	nop			;c4ad
	nop			;c4ae
	nop			;c4af
	nop			;c4b0
	nop			;c4b1
	nop			;c4b2
	nop			;c4b3
	nop			;c4b4
	nop			;c4b5
	nop			;c4b6
	nop			;c4b7
	nop			;c4b8
	nop			;c4b9
	nop			;c4ba
	nop			;c4bb
	nop			;c4bc
	nop			;c4bd
	nop			;c4be
	nop			;c4bf
	nop			;c4c0
	nop			;c4c1
	nop			;c4c2
	nop			;c4c3
	nop			;c4c4
	nop			;c4c5
	nop			;c4c6
	nop			;c4c7
	nop			;c4c8
	nop			;c4c9
	nop			;c4ca
	nop			;c4cb
	nop			;c4cc
	nop			;c4cd
	nop			;c4ce
	nop			;c4cf
	nop			;c4d0
	nop			;c4d1
	nop			;c4d2
	nop			;c4d3
	nop			;c4d4
	nop			;c4d5
	nop			;c4d6
	nop			;c4d7
	nop			;c4d8
	nop			;c4d9
	nop			;c4da
	nop			;c4db
	nop			;c4dc
	nop			;c4dd
	nop			;c4de
	nop			;c4df
	nop			;c4e0
	nop			;c4e1
	nop			;c4e2
	nop			;c4e3
	nop			;c4e4
	nop			;c4e5
	nop			;c4e6
	nop			;c4e7
	nop			;c4e8
	nop			;c4e9
	nop			;c4ea
	nop			;c4eb
	nop			;c4ec
	nop			;c4ed
	nop			;c4ee
	nop			;c4ef
	nop			;c4f0
	nop			;c4f1
	nop			;c4f2
	nop			;c4f3
	nop			;c4f4
	nop			;c4f5
	nop			;c4f6
	nop			;c4f7
	nop			;c4f8
	nop			;c4f9
	nop			;c4fa
	nop			;c4fb
	nop			;c4fc
	nop			;c4fd
	nop			;c4fe
	nop			;c4ff
	nop			;c500
	nop			;c501
	nop			;c502
	nop			;c503
	nop			;c504
	nop			;c505
	nop			;c506
	nop			;c507
	nop			;c508
	nop			;c509
	nop			;c50a
	nop			;c50b
	nop			;c50c
	nop			;c50d
	nop			;c50e
	nop			;c50f
	nop			;c510
	nop			;c511
	nop			;c512
	nop			;c513
	nop			;c514
	nop			;c515
	nop			;c516
	nop			;c517
	nop			;c518
	nop			;c519
	nop			;c51a
	nop			;c51b
	nop			;c51c
	nop			;c51d
	nop			;c51e
	nop			;c51f
	nop			;c520
	nop			;c521
	nop			;c522
	nop			;c523
	nop			;c524
	nop			;c525
	nop			;c526
	nop			;c527
	nop			;c528
	nop			;c529
	nop			;c52a
	add a,d			;c52b
	adc a,d			;c52c
	ld (hl),h		;c52d
	ld b,b			;c52e
	nop			;c52f
	nop			;c530
	nop			;c531
	nop			;c532
	nop			;c533
	nop			;c534
	nop			;c535
	nop			;c536
	nop			;c537
	nop			;c538
	nop			;c539
	nop			;c53a
	nop			;c53b
	nop			;c53c
	nop			;c53d
	nop			;c53e
	nop			;c53f
	nop			;c540
	nop			;c541
	nop			;c542
	nop			;c543
	nop			;c544
	nop			;c545
	nop			;c546
	nop			;c547
	nop			;c548
	nop			;c549
	rra			;c54a
	ld a,c			;c54b
	ld (hl),h		;c54c
	nop			;c54d
	nop			;c54e
	nop			;c54f
	nop			;c550
	rra			;c551
	ld e,c			;c552
	or h			;c553
	nop			;c554
	nop			;c555
	nop			;c556
	nop			;c557
	nop			;c558
lc559h:
	nop			;c559
	nop			;c55a
	nop			;c55b
	nop			;c55c
	nop			;c55d
	nop			;c55e
	nop			;c55f
	nop			;c560
	nop			;c561
	nop			;c562
	nop			;c563
	nop			;c564
	nop			;c565
	nop			;c566
	nop			;c567
	nop			;c568
	nop			;c569
	rst 18h			;c56a
	ld a,b			;c56b
	ld h,e			;c56c
	ld a,(hl)		;c56d
	cp 0ddh			;c56e
	ld a,h			;c570
	ld l,a			;c571
	ld l,a			;c572
	add a,b			;c573
	nop			;c574
	nop			;c575
	nop			;c576
	nop			;c577
lc578h:
	nop			;c578
	nop			;c579
	nop			;c57a
	nop			;c57b
	nop			;c57c
	nop			;c57d
	nop			;c57e
	nop			;c57f
	nop			;c580
	nop			;c581
	nop			;c582
	nop			;c583
	nop			;c584
	nop			;c585
	nop			;c586
	nop			;c587
	nop			;c588
	nop			;c589
	inc bc			;c58a
	ld e,a			;c58b
	ex de,hl		;c58c
	or (hl)			;c58d
	ld a,e			;c58e
	cp l			;c58f
	ld a,e			;c590
	rst 18h			;c591
	ld a,e			;c592
	xor l			;c593
	nop			;c594
	nop			;c595
	nop			;c596
	nop			;c597
	nop			;c598
	nop			;c599
	nop			;c59a
	nop			;c59b
	nop			;c59c
	nop			;c59d
	nop			;c59e
	nop			;c59f
	nop			;c5a0
	nop			;c5a1
	nop			;c5a2
	nop			;c5a3
	nop			;c5a4
	nop			;c5a5
	nop			;c5a6
	nop			;c5a7
	nop			;c5a8
	nop			;c5a9
	nop			;c5aa
	nop			;c5ab
	nop			;c5ac
	nop			;c5ad
	nop			;c5ae
	nop			;c5af
	nop			;c5b0
	nop			;c5b1
	nop			;c5b2
	nop			;c5b3
	nop			;c5b4
	nop			;c5b5
	nop			;c5b6
	nop			;c5b7
	nop			;c5b8
	nop			;c5b9
	nop			;c5ba
	nop			;c5bb
	nop			;c5bc
	nop			;c5bd
	nop			;c5be
	nop			;c5bf
	nop			;c5c0
	nop			;c5c1
	nop			;c5c2
	nop			;c5c3
	nop			;c5c4
	nop			;c5c5
	nop			;c5c6
	nop			;c5c7
	nop			;c5c8
	nop			;c5c9
	nop			;c5ca
	nop			;c5cb
	nop			;c5cc
	nop			;c5cd
	nop			;c5ce
	nop			;c5cf
	nop			;c5d0
	nop			;c5d1
	nop			;c5d2
	nop			;c5d3
	nop			;c5d4
	nop			;c5d5
	nop			;c5d6
	nop			;c5d7
	nop			;c5d8
	nop			;c5d9
	nop			;c5da
	nop			;c5db
	nop			;c5dc
	nop			;c5dd
	nop			;c5de
	nop			;c5df
	nop			;c5e0
	nop			;c5e1
	nop			;c5e2
	nop			;c5e3
	nop			;c5e4
	nop			;c5e5
	nop			;c5e6
	nop			;c5e7
	nop			;c5e8
	nop			;c5e9
	nop			;c5ea
	nop			;c5eb
	nop			;c5ec
	nop			;c5ed
sub_c5eeh:
	nop			;c5ee
	nop			;c5ef
	nop			;c5f0
	nop			;c5f1
	nop			;c5f2
	nop			;c5f3
	nop			;c5f4
	nop			;c5f5
	nop			;c5f6
	nop			;c5f7
	nop			;c5f8
	nop			;c5f9
	nop			;c5fa
	nop			;c5fb
	nop			;c5fc
	nop			;c5fd
	nop			;c5fe
lc5ffh:
	nop			;c5ff
	nop			;c600
	nop			;c601
	nop			;c602
	nop			;c603
	nop			;c604
	nop			;c605
	nop			;c606
	nop			;c607
	nop			;c608
	nop			;c609
	nop			;c60a
	nop			;c60b
	nop			;c60c
	nop			;c60d
	nop			;c60e
	nop			;c60f
	nop			;c610
	nop			;c611
	nop			;c612
	nop			;c613
	nop			;c614
	nop			;c615
	nop			;c616
	nop			;c617
	nop			;c618
	nop			;c619
	nop			;c61a
	nop			;c61b
	nop			;c61c
	nop			;c61d
	nop			;c61e
	nop			;c61f
	nop			;c620
	nop			;c621
	nop			;c622
	nop			;c623
	nop			;c624
	nop			;c625
	nop			;c626
	nop			;c627
	nop			;c628
	nop			;c629
	nop			;c62a
	ld b,d			;c62b
	adc a,d			;c62c
	inc d			;c62d
	ld b,b			;c62e
	nop			;c62f
	nop			;c630
	nop			;c631
	nop			;c632
	nop			;c633
	nop			;c634
	nop			;c635
	nop			;c636
	nop			;c637
	nop			;c638
	nop			;c639
	nop			;c63a
	nop			;c63b
	nop			;c63c
	nop			;c63d
	nop			;c63e
	nop			;c63f
	nop			;c640
lc641h:
	nop			;c641
	nop			;c642
	nop			;c643
	nop			;c644
	nop			;c645
	nop			;c646
	nop			;c647
	nop			;c648
	nop			;c649
	cpl			;c64a
	ld e,d			;c64b
	ld a,d			;c64c
	nop			;c64d
	nop			;c64e
	nop			;c64f
	nop			;c650
	ld a,07bh		;c651
	ret m			;c653
	nop			;c654
	nop			;c655
	nop			;c656
	nop			;c657
	nop			;c658
	nop			;c659
	nop			;c65a
	nop			;c65b
	nop			;c65c
	nop			;c65d
	nop			;c65e
	nop			;c65f
	nop			;c660
	nop			;c661
	nop			;c662
	nop			;c663
	nop			;c664
	nop			;c665
	nop			;c666
	nop			;c667
	nop			;c668
	nop			;c669
	defb 0fdh,079h,01bh ;illegal sequence	;c66a
	ld e,l			;c66d
	ld h,a			;c66e
	xor a			;c66f
	ld l,h			;c670
	ccf			;c671
	ld a,a			;c672
	ret nz			;c673
	nop			;c674
	nop			;c675
	nop			;c676
	nop			;c677
	nop			;c678
	nop			;c679
	nop			;c67a
	nop			;c67b
	nop			;c67c
	nop			;c67d
	nop			;c67e
	nop			;c67f
	nop			;c680
	nop			;c681
	nop			;c682
	nop			;c683
	nop			;c684
	nop			;c685
	nop			;c686
	nop			;c687
	nop			;c688
	nop			;c689
	ld bc,lb76bh		;c68a
	cp (hl)			;c68d
	rrca			;c68e
	rst 18h			;c68f
	ld a,c			;c690
	defb 0ddh,069h ;ld ixl,c	;c691
	rst 18h			;c693
	nop			;c694
	nop			;c695
	nop			;c696
	nop			;c697
	nop			;c698
	nop			;c699
	nop			;c69a
	nop			;c69b
	nop			;c69c
	nop			;c69d
	nop			;c69e
	nop			;c69f
	nop			;c6a0
	nop			;c6a1
	nop			;c6a2
	nop			;c6a3
	nop			;c6a4
	nop			;c6a5
	nop			;c6a6
	nop			;c6a7
	nop			;c6a8
	nop			;c6a9
	nop			;c6aa
	nop			;c6ab
	nop			;c6ac
	nop			;c6ad
	nop			;c6ae
	nop			;c6af
	nop			;c6b0
	nop			;c6b1
	nop			;c6b2
	nop			;c6b3
	nop			;c6b4
	nop			;c6b5
	nop			;c6b6
	nop			;c6b7
	nop			;c6b8
	nop			;c6b9
	nop			;c6ba
	nop			;c6bb
	nop			;c6bc
	nop			;c6bd
	nop			;c6be
	nop			;c6bf
	nop			;c6c0
	nop			;c6c1
	nop			;c6c2
	nop			;c6c3
	nop			;c6c4
	nop			;c6c5
sub_c6c6h:
	nop			;c6c6
	nop			;c6c7
	nop			;c6c8
	nop			;c6c9
	nop			;c6ca
	nop			;c6cb
	nop			;c6cc
	nop			;c6cd
lc6ceh:
	nop			;c6ce
	nop			;c6cf
	nop			;c6d0
	nop			;c6d1
	nop			;c6d2
	nop			;c6d3
	nop			;c6d4
	nop			;c6d5
	nop			;c6d6
	nop			;c6d7
	nop			;c6d8
	nop			;c6d9
	nop			;c6da
	nop			;c6db
	nop			;c6dc
	nop			;c6dd
	nop			;c6de
	nop			;c6df
	nop			;c6e0
	nop			;c6e1
	nop			;c6e2
	nop			;c6e3
	nop			;c6e4
	nop			;c6e5
	nop			;c6e6
	nop			;c6e7
	nop			;c6e8
	nop			;c6e9
	nop			;c6ea
	nop			;c6eb
	nop			;c6ec
	nop			;c6ed
	nop			;c6ee
	nop			;c6ef
	nop			;c6f0
	nop			;c6f1
	nop			;c6f2
	nop			;c6f3
	nop			;c6f4
	nop			;c6f5
	nop			;c6f6
	nop			;c6f7
	nop			;c6f8
	nop			;c6f9
	nop			;c6fa
	nop			;c6fb
lc6fch:
	nop			;c6fc
	nop			;c6fd
	nop			;c6fe
	nop			;c6ff
lc700h:
	nop			;c700
	nop			;c701
	nop			;c702
	nop			;c703
	nop			;c704
	nop			;c705
	nop			;c706
	nop			;c707
	nop			;c708
	nop			;c709
	nop			;c70a
	nop			;c70b
	nop			;c70c
	nop			;c70d
	nop			;c70e
	nop			;c70f
	nop			;c710
	nop			;c711
	nop			;c712
	nop			;c713
	nop			;c714
	nop			;c715
	nop			;c716
	nop			;c717
	nop			;c718
	nop			;c719
	nop			;c71a
	nop			;c71b
	nop			;c71c
	nop			;c71d
	nop			;c71e
	nop			;c71f
	nop			;c720
	nop			;c721
	nop			;c722
	nop			;c723
	nop			;c724
	nop			;c725
	nop			;c726
	nop			;c727
	nop			;c728
	nop			;c729
	nop			;c72a
	ld a,h			;c72b
	adc a,c			;c72c
	call po,00040h		;c72d
	nop			;c730
	nop			;c731
	nop			;c732
	nop			;c733
	nop			;c734
	nop			;c735
	nop			;c736
	nop			;c737
	nop			;c738
	nop			;c739
	nop			;c73a
	nop			;c73b
	nop			;c73c
	nop			;c73d
	nop			;c73e
	nop			;c73f
	nop			;c740
	nop			;c741
	nop			;c742
	nop			;c743
	nop			;c744
	nop			;c745
	nop			;c746
	nop			;c747
	nop			;c748
	nop			;c749
	ld a,a			;c74a
	ld a,h			;c74b
	cp (hl)			;c74c
	nop			;c74d
	nop			;c74e
	nop			;c74f
	nop			;c750
	ld b,a			;c751
	ld a,(hl)		;c752
	ret p			;c753
	nop			;c754
	nop			;c755
	nop			;c756
	nop			;c757
	nop			;c758
	nop			;c759
	nop			;c75a
	nop			;c75b
	nop			;c75c
	nop			;c75d
	nop			;c75e
	nop			;c75f
	nop			;c760
	nop			;c761
	nop			;c762
	nop			;c763
	nop			;c764
	nop			;c765
	nop			;c766
	nop			;c767
	nop			;c768
	nop			;c769
	rst 38h			;c76a
	ld l,b			;c76b
	ld a,07bh		;c76c
	jp l7cf7h		;c76e
	ccf			;c771
	ld a,a			;c772
	and b			;c773
	nop			;c774
	nop			;c775
	nop			;c776
	nop			;c777
sub_c778h:
	nop			;c778
	nop			;c779
lc77ah:
	nop			;c77a
	nop			;c77b
	nop			;c77c
	nop			;c77d
	nop			;c77e
lc77fh:
	nop			;c77f
	nop			;c780
	nop			;c781
	nop			;c782
	nop			;c783
	nop			;c784
	nop			;c785
	nop			;c786
	nop			;c787
	nop			;c788
	nop			;c789
	nop			;c78a
	rst 38h			;c78b
	pop af			;c78c
	ld a,h			;c78d
	ld bc,l709bh		;c78e
	ld l,a			;c791
	ret m			;c792
	ld l,a			;c793
	nop			;c794
	nop			;c795
	nop			;c796
	nop			;c797
	nop			;c798
	nop			;c799
	nop			;c79a
	nop			;c79b
	nop			;c79c
	nop			;c79d
	nop			;c79e
	nop			;c79f
	nop			;c7a0
	nop			;c7a1
	nop			;c7a2
	nop			;c7a3
	nop			;c7a4
	nop			;c7a5
	nop			;c7a6
	nop			;c7a7
	nop			;c7a8
	nop			;c7a9
	nop			;c7aa
	nop			;c7ab
	nop			;c7ac
	nop			;c7ad
	nop			;c7ae
	nop			;c7af
	nop			;c7b0
	nop			;c7b1
	nop			;c7b2
	nop			;c7b3
	nop			;c7b4
	nop			;c7b5
	nop			;c7b6
	nop			;c7b7
	nop			;c7b8
	nop			;c7b9
	nop			;c7ba
	nop			;c7bb
	nop			;c7bc
	nop			;c7bd
	nop			;c7be
	nop			;c7bf
	nop			;c7c0
	nop			;c7c1
	nop			;c7c2
	nop			;c7c3
	nop			;c7c4
	nop			;c7c5
	nop			;c7c6
	nop			;c7c7
	nop			;c7c8
	nop			;c7c9
	nop			;c7ca
	nop			;c7cb
	nop			;c7cc
	nop			;c7cd
	nop			;c7ce
	nop			;c7cf
	nop			;c7d0
	nop			;c7d1
	nop			;c7d2
	nop			;c7d3
	nop			;c7d4
	nop			;c7d5
	nop			;c7d6
	nop			;c7d7
	nop			;c7d8
	nop			;c7d9
	nop			;c7da
	nop			;c7db
	nop			;c7dc
	nop			;c7dd
	nop			;c7de
	nop			;c7df
	nop			;c7e0
	nop			;c7e1
	nop			;c7e2
	nop			;c7e3
	nop			;c7e4
	nop			;c7e5
	nop			;c7e6
	nop			;c7e7
	nop			;c7e8
	nop			;c7e9
	nop			;c7ea
	nop			;c7eb
	nop			;c7ec
	nop			;c7ed
	nop			;c7ee
	nop			;c7ef
	nop			;c7f0
	nop			;c7f1
	nop			;c7f2
	nop			;c7f3
	nop			;c7f4
	nop			;c7f5
	nop			;c7f6
	nop			;c7f7
	nop			;c7f8
	nop			;c7f9
	nop			;c7fa
	nop			;c7fb
	nop			;c7fc
	nop			;c7fd
	nop			;c7fe
lc7ffh:
	nop			;c7ff
	nop			;c800
	nop			;c801
	nop			;c802
	nop			;c803
	nop			;c804
	nop			;c805
	nop			;c806
	nop			;c807
	nop			;c808
	nop			;c809
	nop			;c80a
	nop			;c80b
	nop			;c80c
	nop			;c80d
	nop			;c80e
	nop			;c80f
	nop			;c810
	nop			;c811
	nop			;c812
	nop			;c813
	nop			;c814
	nop			;c815
	nop			;c816
	nop			;c817
	nop			;c818
	nop			;c819
	nop			;c81a
	nop			;c81b
	nop			;c81c
	nop			;c81d
	nop			;c81e
	nop			;c81f
lc820h:
	nop			;c820
	nop			;c821
	nop			;c822
	nop			;c823
	nop			;c824
	nop			;c825
	nop			;c826
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
	nop			;c83c
	nop			;c83d
	nop			;c83e
	nop			;c83f
	nop			;c840
	nop			;c841
	nop			;c842
	nop			;c843
	nop			;c844
	nop			;c845
	nop			;c846
	nop			;c847
	nop			;c848
	nop			;c849
	nop			;c84a
	nop			;c84b
	nop			;c84c
	nop			;c84d
	nop			;c84e
	nop			;c84f
	nop			;c850
	nop			;c851
	nop			;c852
	nop			;c853
	nop			;c854
	nop			;c855
	nop			;c856
	nop			;c857
	nop			;c858
	nop			;c859
	nop			;c85a
	nop			;c85b
	nop			;c85c
	nop			;c85d
	nop			;c85e
	nop			;c85f
	nop			;c860
	nop			;c861
	nop			;c862
	nop			;c863
	nop			;c864
	nop			;c865
	nop			;c866
	nop			;c867
	nop			;c868
	nop			;c869
	nop			;c86a
	nop			;c86b
	nop			;c86c
	nop			;c86d
	nop			;c86e
	nop			;c86f
	nop			;c870
	nop			;c871
	nop			;c872
	nop			;c873
	nop			;c874
	nop			;c875
	nop			;c876
	nop			;c877
	nop			;c878
	nop			;c879
	nop			;c87a
	nop			;c87b
	nop			;c87c
	nop			;c87d
	nop			;c87e
	nop			;c87f
	nop			;c880
	nop			;c881
	nop			;c882
	nop			;c883
	nop			;c884
	nop			;c885
	nop			;c886
	nop			;c887
	nop			;c888
	nop			;c889
	nop			;c88a
	nop			;c88b
	nop			;c88c
	nop			;c88d
	nop			;c88e
	nop			;c88f
	nop			;c890
	nop			;c891
	nop			;c892
	nop			;c893
	nop			;c894
	nop			;c895
	nop			;c896
	nop			;c897
	nop			;c898
	nop			;c899
	nop			;c89a
	nop			;c89b
	nop			;c89c
	nop			;c89d
	nop			;c89e
	nop			;c89f
	nop			;c8a0
	nop			;c8a1
	nop			;c8a2
	nop			;c8a3
	nop			;c8a4
	nop			;c8a5
	nop			;c8a6
	nop			;c8a7
	nop			;c8a8
	nop			;c8a9
	nop			;c8aa
	nop			;c8ab
	nop			;c8ac
	nop			;c8ad
	nop			;c8ae
	nop			;c8af
	nop			;c8b0
	nop			;c8b1
	nop			;c8b2
	nop			;c8b3
	nop			;c8b4
	nop			;c8b5
	nop			;c8b6
	nop			;c8b7
	nop			;c8b8
	nop			;c8b9
	nop			;c8ba
	nop			;c8bb
	nop			;c8bc
	nop			;c8bd
	nop			;c8be
	nop			;c8bf
	nop			;c8c0
	nop			;c8c1
	nop			;c8c2
	nop			;c8c3
	nop			;c8c4
	nop			;c8c5
	nop			;c8c6
	nop			;c8c7
	nop			;c8c8
	nop			;c8c9
	nop			;c8ca
	nop			;c8cb
	nop			;c8cc
	nop			;c8cd
	nop			;c8ce
	nop			;c8cf
	nop			;c8d0
	nop			;c8d1
	nop			;c8d2
	nop			;c8d3
	nop			;c8d4
	nop			;c8d5
	nop			;c8d6
	nop			;c8d7
	nop			;c8d8
	nop			;c8d9
	nop			;c8da
	nop			;c8db
	nop			;c8dc
	nop			;c8dd
	nop			;c8de
	nop			;c8df
	nop			;c8e0
	nop			;c8e1
	nop			;c8e2
	nop			;c8e3
	nop			;c8e4
	nop			;c8e5
	nop			;c8e6
	nop			;c8e7
	nop			;c8e8
	nop			;c8e9
	nop			;c8ea
	nop			;c8eb
	nop			;c8ec
	nop			;c8ed
	nop			;c8ee
	nop			;c8ef
	nop			;c8f0
	nop			;c8f1
	nop			;c8f2
	nop			;c8f3
	nop			;c8f4
	nop			;c8f5
	nop			;c8f6
	nop			;c8f7
	nop			;c8f8
	nop			;c8f9
	nop			;c8fa
	nop			;c8fb
	nop			;c8fc
	nop			;c8fd
	nop			;c8fe
	nop			;c8ff
	nop			;c900
	nop			;c901
	nop			;c902
	nop			;c903
	nop			;c904
	nop			;c905
	nop			;c906
	nop			;c907
	nop			;c908
	nop			;c909
	nop			;c90a
	nop			;c90b
	nop			;c90c
	nop			;c90d
	nop			;c90e
	nop			;c90f
	nop			;c910
	nop			;c911
	nop			;c912
	nop			;c913
	nop			;c914
	nop			;c915
	nop			;c916
	nop			;c917
	nop			;c918
	nop			;c919
	nop			;c91a
	nop			;c91b
	nop			;c91c
	nop			;c91d
	nop			;c91e
	nop			;c91f
	nop			;c920
	nop			;c921
	nop			;c922
	nop			;c923
	nop			;c924
	nop			;c925
	nop			;c926
	nop			;c927
	nop			;c928
	nop			;c929
	nop			;c92a
	nop			;c92b
	nop			;c92c
	nop			;c92d
	nop			;c92e
	nop			;c92f
	nop			;c930
	nop			;c931
	nop			;c932
	nop			;c933
	nop			;c934
	nop			;c935
	nop			;c936
	nop			;c937
	nop			;c938
	nop			;c939
	nop			;c93a
	nop			;c93b
	nop			;c93c
	nop			;c93d
	nop			;c93e
	nop			;c93f
	nop			;c940
	nop			;c941
	nop			;c942
	nop			;c943
	nop			;c944
	nop			;c945
	nop			;c946
	nop			;c947
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
	nop			;c958
	nop			;c959
	nop			;c95a
	nop			;c95b
	nop			;c95c
	nop			;c95d
	nop			;c95e
	nop			;c95f
	nop			;c960
	nop			;c961
	nop			;c962
	nop			;c963
	nop			;c964
	nop			;c965
	nop			;c966
	nop			;c967
	nop			;c968
	nop			;c969
	nop			;c96a
	nop			;c96b
	nop			;c96c
	nop			;c96d
	nop			;c96e
	nop			;c96f
	nop			;c970
	nop			;c971
	nop			;c972
	nop			;c973
	nop			;c974
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
	nop			;c982
	nop			;c983
	nop			;c984
	nop			;c985
	nop			;c986
	nop			;c987
	nop			;c988
	nop			;c989
	nop			;c98a
	nop			;c98b
sub_c98ch:
	nop			;c98c
	nop			;c98d
	nop			;c98e
	nop			;c98f
	nop			;c990
	nop			;c991
	nop			;c992
	nop			;c993
	nop			;c994
	nop			;c995
	nop			;c996
	nop			;c997
	nop			;c998
	nop			;c999
	nop			;c99a
	nop			;c99b
	nop			;c99c
	nop			;c99d
	nop			;c99e
	nop			;c99f
	nop			;c9a0
	nop			;c9a1
	nop			;c9a2
	nop			;c9a3
	nop			;c9a4
	nop			;c9a5
	nop			;c9a6
	nop			;c9a7
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
	nop			;c9cd
	nop			;c9ce
	nop			;c9cf
	nop			;c9d0
	nop			;c9d1
	nop			;c9d2
	nop			;c9d3
	nop			;c9d4
	nop			;c9d5
	nop			;c9d6
	nop			;c9d7
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
	nop			;c9fb
	nop			;c9fc
	nop			;c9fd
	nop			;c9fe
	nop			;c9ff
	nop			;ca00
	nop			;ca01
	nop			;ca02
	nop			;ca03
	nop			;ca04
	nop			;ca05
	nop			;ca06
	nop			;ca07
lca08h:
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
	nop			;ca1a
	nop			;ca1b
	nop			;ca1c
	nop			;ca1d
	nop			;ca1e
	nop			;ca1f
	nop			;ca20
	nop			;ca21
	nop			;ca22
	nop			;ca23
	nop			;ca24
	nop			;ca25
	nop			;ca26
	nop			;ca27
	nop			;ca28
	nop			;ca29
	nop			;ca2a
	nop			;ca2b
	nop			;ca2c
	nop			;ca2d
	nop			;ca2e
	nop			;ca2f
	nop			;ca30
	nop			;ca31
	nop			;ca32
	nop			;ca33
	nop			;ca34
	nop			;ca35
	nop			;ca36
	nop			;ca37
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
	nop			;ca48
	nop			;ca49
	nop			;ca4a
	nop			;ca4b
	nop			;ca4c
	nop			;ca4d
	nop			;ca4e
	nop			;ca4f
	nop			;ca50
	nop			;ca51
	nop			;ca52
	nop			;ca53
lca54h:
	nop			;ca54
	nop			;ca55
	nop			;ca56
	nop			;ca57
	nop			;ca58
	nop			;ca59
	nop			;ca5a
	nop			;ca5b
	nop			;ca5c
	nop			;ca5d
	nop			;ca5e
	nop			;ca5f
	nop			;ca60
	nop			;ca61
	nop			;ca62
	nop			;ca63
	nop			;ca64
	nop			;ca65
	nop			;ca66
	nop			;ca67
	nop			;ca68
	nop			;ca69
	nop			;ca6a
	nop			;ca6b
	nop			;ca6c
	nop			;ca6d
	nop			;ca6e
	nop			;ca6f
lca70h:
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
	nop			;ca80
	nop			;ca81
	nop			;ca82
	nop			;ca83
	nop			;ca84
	nop			;ca85
	nop			;ca86
	nop			;ca87
	nop			;ca88
	nop			;ca89
	nop			;ca8a
	nop			;ca8b
	nop			;ca8c
	nop			;ca8d
	nop			;ca8e
	nop			;ca8f
	nop			;ca90
	nop			;ca91
	nop			;ca92
	nop			;ca93
	nop			;ca94
	nop			;ca95
	nop			;ca96
	nop			;ca97
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
lcaa3h:
	nop			;caa3
	nop			;caa4
	nop			;caa5
	nop			;caa6
	nop			;caa7
	nop			;caa8
lcaa9h:
	nop			;caa9
	nop			;caaa
	nop			;caab
	nop			;caac
	nop			;caad
	nop			;caae
	nop			;caaf
	nop			;cab0
	nop			;cab1
	nop			;cab2
	nop			;cab3
	nop			;cab4
	nop			;cab5
	nop			;cab6
	nop			;cab7
	nop			;cab8
	nop			;cab9
	nop			;caba
	nop			;cabb
	nop			;cabc
	nop			;cabd
	nop			;cabe
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
lcad5h:
	nop			;cad5
	nop			;cad6
	nop			;cad7
	nop			;cad8
	nop			;cad9
	nop			;cada
	nop			;cadb
	nop			;cadc
	nop			;cadd
	nop			;cade
	nop			;cadf
	nop			;cae0
	nop			;cae1
	nop			;cae2
	nop			;cae3
	nop			;cae4
	nop			;cae5
	nop			;cae6
	nop			;cae7
	nop			;cae8
	nop			;cae9
lcaeah:
	nop			;caea
	nop			;caeb
	nop			;caec
	nop			;caed
	nop			;caee
	nop			;caef
	nop			;caf0
	nop			;caf1
	nop			;caf2
	nop			;caf3
	nop			;caf4
	nop			;caf5
	nop			;caf6
	nop			;caf7
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
	nop			;cb06
	nop			;cb07
	nop			;cb08
	nop			;cb09
	nop			;cb0a
	nop			;cb0b
	nop			;cb0c
	nop			;cb0d
	nop			;cb0e
	nop			;cb0f
	nop			;cb10
	nop			;cb11
	nop			;cb12
	nop			;cb13
	nop			;cb14
	nop			;cb15
	nop			;cb16
	nop			;cb17
	nop			;cb18
	nop			;cb19
	nop			;cb1a
	nop			;cb1b
	nop			;cb1c
	nop			;cb1d
	nop			;cb1e
	nop			;cb1f
	nop			;cb20
	nop			;cb21
	nop			;cb22
	nop			;cb23
	nop			;cb24
	nop			;cb25
	nop			;cb26
	nop			;cb27
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
	nop			;cb32
	nop			;cb33
	nop			;cb34
	nop			;cb35
	nop			;cb36
	nop			;cb37
	nop			;cb38
	nop			;cb39
	nop			;cb3a
	nop			;cb3b
	nop			;cb3c
	nop			;cb3d
	nop			;cb3e
	nop			;cb3f
	nop			;cb40
	nop			;cb41
	nop			;cb42
	nop			;cb43
	nop			;cb44
	nop			;cb45
	nop			;cb46
	nop			;cb47
	nop			;cb48
	nop			;cb49
	nop			;cb4a
	nop			;cb4b
	nop			;cb4c
	nop			;cb4d
	nop			;cb4e
	nop			;cb4f
	ex af,af'		;cb50
	nop			;cb51
	nop			;cb52
	nop			;cb53
	nop			;cb54
	nop			;cb55
	nop			;cb56
	nop			;cb57
	nop			;cb58
	nop			;cb59
	nop			;cb5a
	nop			;cb5b
	nop			;cb5c
	nop			;cb5d
	nop			;cb5e
	nop			;cb5f
	nop			;cb60
	nop			;cb61
	nop			;cb62
	nop			;cb63
	nop			;cb64
	nop			;cb65
	nop			;cb66
	nop			;cb67
	nop			;cb68
	nop			;cb69
	nop			;cb6a
	nop			;cb6b
	nop			;cb6c
	nop			;cb6d
	nop			;cb6e
	nop			;cb6f
	nop			;cb70
	nop			;cb71
	nop			;cb72
	nop			;cb73
	nop			;cb74
	nop			;cb75
	nop			;cb76
	nop			;cb77
	nop			;cb78
	nop			;cb79
	nop			;cb7a
	nop			;cb7b
	nop			;cb7c
	nop			;cb7d
	nop			;cb7e
	nop			;cb7f
	nop			;cb80
	nop			;cb81
	nop			;cb82
	nop			;cb83
	nop			;cb84
	nop			;cb85
	nop			;cb86
	nop			;cb87
	nop			;cb88
	nop			;cb89
	nop			;cb8a
	nop			;cb8b
	nop			;cb8c
	nop			;cb8d
	nop			;cb8e
	nop			;cb8f
	nop			;cb90
	nop			;cb91
	nop			;cb92
	nop			;cb93
	nop			;cb94
	nop			;cb95
	nop			;cb96
	nop			;cb97
	nop			;cb98
	nop			;cb99
	nop			;cb9a
	nop			;cb9b
	nop			;cb9c
	nop			;cb9d
	nop			;cb9e
	nop			;cb9f
	nop			;cba0
	nop			;cba1
	nop			;cba2
	nop			;cba3
	nop			;cba4
	nop			;cba5
	nop			;cba6
	nop			;cba7
	nop			;cba8
	nop			;cba9
lcbaah:
	nop			;cbaa
	nop			;cbab
	nop			;cbac
	nop			;cbad
	nop			;cbae
	nop			;cbaf
	nop			;cbb0
	nop			;cbb1
	nop			;cbb2
	nop			;cbb3
	nop			;cbb4
	nop			;cbb5
	nop			;cbb6
	nop			;cbb7
	nop			;cbb8
	nop			;cbb9
	nop			;cbba
	nop			;cbbb
	nop			;cbbc
	nop			;cbbd
	nop			;cbbe
	nop			;cbbf
	nop			;cbc0
	nop			;cbc1
	nop			;cbc2
	nop			;cbc3
	nop			;cbc4
	nop			;cbc5
	nop			;cbc6
	nop			;cbc7
	nop			;cbc8
	nop			;cbc9
	nop			;cbca
	nop			;cbcb
	nop			;cbcc
	nop			;cbcd
	nop			;cbce
	nop			;cbcf
	nop			;cbd0
	nop			;cbd1
	nop			;cbd2
	nop			;cbd3
	nop			;cbd4
	nop			;cbd5
	nop			;cbd6
	nop			;cbd7
	nop			;cbd8
	nop			;cbd9
	nop			;cbda
	nop			;cbdb
	nop			;cbdc
	nop			;cbdd
	nop			;cbde
	nop			;cbdf
	nop			;cbe0
	nop			;cbe1
	nop			;cbe2
	nop			;cbe3
	nop			;cbe4
	nop			;cbe5
	nop			;cbe6
	nop			;cbe7
	nop			;cbe8
	nop			;cbe9
	nop			;cbea
	nop			;cbeb
	nop			;cbec
	nop			;cbed
	nop			;cbee
lcbefh:
	nop			;cbef
	nop			;cbf0
	nop			;cbf1
	nop			;cbf2
	nop			;cbf3
	nop			;cbf4
	nop			;cbf5
	nop			;cbf6
	nop			;cbf7
	nop			;cbf8
	nop			;cbf9
	nop			;cbfa
	nop			;cbfb
	nop			;cbfc
	nop			;cbfd
	nop			;cbfe
	nop			;cbff
	nop			;cc00
	nop			;cc01
	nop			;cc02
	nop			;cc03
	nop			;cc04
	nop			;cc05
	nop			;cc06
	nop			;cc07
	nop			;cc08
	nop			;cc09
	nop			;cc0a
	nop			;cc0b
	nop			;cc0c
	nop			;cc0d
	nop			;cc0e
	nop			;cc0f
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
	nop			;cc2e
	nop			;cc2f
	nop			;cc30
	nop			;cc31
	nop			;cc32
	nop			;cc33
	nop			;cc34
	nop			;cc35
	nop			;cc36
	nop			;cc37
	nop			;cc38
	nop			;cc39
	nop			;cc3a
	nop			;cc3b
	nop			;cc3c
	nop			;cc3d
	nop			;cc3e
	nop			;cc3f
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
	nop			;cc5c
	nop			;cc5d
	nop			;cc5e
	nop			;cc5f
	nop			;cc60
	nop			;cc61
	nop			;cc62
	nop			;cc63
lcc64h:
	nop			;cc64
	nop			;cc65
	nop			;cc66
	nop			;cc67
	nop			;cc68
	nop			;cc69
	nop			;cc6a
	nop			;cc6b
	nop			;cc6c
	nop			;cc6d
	nop			;cc6e
	nop			;cc6f
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
	nop			;cc84
	nop			;cc85
	nop			;cc86
	nop			;cc87
	nop			;cc88
	nop			;cc89
	nop			;cc8a
	nop			;cc8b
	nop			;cc8c
	nop			;cc8d
	nop			;cc8e
	nop			;cc8f
	nop			;cc90
	nop			;cc91
	nop			;cc92
	nop			;cc93
	nop			;cc94
	nop			;cc95
	nop			;cc96
	nop			;cc97
	nop			;cc98
	nop			;cc99
	nop			;cc9a
	nop			;cc9b
	nop			;cc9c
	nop			;cc9d
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
	nop			;ccb3
	nop			;ccb4
	nop			;ccb5
	nop			;ccb6
	nop			;ccb7
	nop			;ccb8
	nop			;ccb9
	nop			;ccba
	nop			;ccbb
	nop			;ccbc
	nop			;ccbd
	nop			;ccbe
	nop			;ccbf
	nop			;ccc0
	nop			;ccc1
	nop			;ccc2
	nop			;ccc3
	nop			;ccc4
	nop			;ccc5
	nop			;ccc6
	nop			;ccc7
	nop			;ccc8
	nop			;ccc9
	nop			;ccca
	nop			;cccb
	nop			;cccc
	nop			;cccd
	nop			;ccce
	nop			;cccf
	nop			;ccd0
	nop			;ccd1
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
	nop			;ccde
	nop			;ccdf
	nop			;cce0
	nop			;cce1
	nop			;cce2
	nop			;cce3
	nop			;cce4
	nop			;cce5
	nop			;cce6
	nop			;cce7
	nop			;cce8
	nop			;cce9
	nop			;ccea
	nop			;cceb
	nop			;ccec
	nop			;cced
	nop			;ccee
	nop			;ccef
	nop			;ccf0
	nop			;ccf1
	nop			;ccf2
	nop			;ccf3
	nop			;ccf4
	nop			;ccf5
	nop			;ccf6
lccf7h:
	nop			;ccf7
	nop			;ccf8
	nop			;ccf9
	nop			;ccfa
	nop			;ccfb
	nop			;ccfc
sub_ccfdh:
	nop			;ccfd
	nop			;ccfe
	nop			;ccff
	nop			;cd00
	nop			;cd01
	nop			;cd02
	nop			;cd03
	nop			;cd04
	nop			;cd05
	nop			;cd06
	nop			;cd07
	nop			;cd08
	nop			;cd09
	nop			;cd0a
	nop			;cd0b
	nop			;cd0c
	nop			;cd0d
	nop			;cd0e
	nop			;cd0f
lcd10h:
	nop			;cd10
	nop			;cd11
	nop			;cd12
	nop			;cd13
	nop			;cd14
	nop			;cd15
	nop			;cd16
	nop			;cd17
	nop			;cd18
	nop			;cd19
	nop			;cd1a
	nop			;cd1b
	nop			;cd1c
	nop			;cd1d
	nop			;cd1e
	nop			;cd1f
	nop			;cd20
	nop			;cd21
	nop			;cd22
	nop			;cd23
	nop			;cd24
	nop			;cd25
	nop			;cd26
	nop			;cd27
	nop			;cd28
	nop			;cd29
	nop			;cd2a
	nop			;cd2b
	nop			;cd2c
	nop			;cd2d
	nop			;cd2e
	nop			;cd2f
	nop			;cd30
	nop			;cd31
	nop			;cd32
	nop			;cd33
	nop			;cd34
	nop			;cd35
	nop			;cd36
	nop			;cd37
	nop			;cd38
	nop			;cd39
	nop			;cd3a
	nop			;cd3b
	nop			;cd3c
	nop			;cd3d
	nop			;cd3e
	nop			;cd3f
	nop			;cd40
	nop			;cd41
	nop			;cd42
	nop			;cd43
	nop			;cd44
	nop			;cd45
	nop			;cd46
	nop			;cd47
	nop			;cd48
	nop			;cd49
	nop			;cd4a
	nop			;cd4b
	nop			;cd4c
	nop			;cd4d
	nop			;cd4e
	nop			;cd4f
	nop			;cd50
	nop			;cd51
	nop			;cd52
	nop			;cd53
	nop			;cd54
	nop			;cd55
	nop			;cd56
	nop			;cd57
	nop			;cd58
	nop			;cd59
	nop			;cd5a
	nop			;cd5b
	nop			;cd5c
	nop			;cd5d
	nop			;cd5e
	nop			;cd5f
	nop			;cd60
	nop			;cd61
	nop			;cd62
	nop			;cd63
	nop			;cd64
	nop			;cd65
	nop			;cd66
	nop			;cd67
	nop			;cd68
	nop			;cd69
	nop			;cd6a
	nop			;cd6b
	nop			;cd6c
	nop			;cd6d
	nop			;cd6e
	nop			;cd6f
	nop			;cd70
	nop			;cd71
	nop			;cd72
	nop			;cd73
	nop			;cd74
	nop			;cd75
	nop			;cd76
	nop			;cd77
	nop			;cd78
	nop			;cd79
	nop			;cd7a
	nop			;cd7b
	nop			;cd7c
	nop			;cd7d
	nop			;cd7e
	nop			;cd7f
	nop			;cd80
	nop			;cd81
	nop			;cd82
	nop			;cd83
	nop			;cd84
	nop			;cd85
	nop			;cd86
	nop			;cd87
	nop			;cd88
	nop			;cd89
	nop			;cd8a
	nop			;cd8b
	nop			;cd8c
	nop			;cd8d
	nop			;cd8e
	nop			;cd8f
	nop			;cd90
	nop			;cd91
	nop			;cd92
	nop			;cd93
	nop			;cd94
	nop			;cd95
	nop			;cd96
	nop			;cd97
	nop			;cd98
	nop			;cd99
	nop			;cd9a
	nop			;cd9b
	nop			;cd9c
	nop			;cd9d
	nop			;cd9e
	nop			;cd9f
	nop			;cda0
	nop			;cda1
	nop			;cda2
	nop			;cda3
	nop			;cda4
	nop			;cda5
	nop			;cda6
	nop			;cda7
	nop			;cda8
	nop			;cda9
	nop			;cdaa
	nop			;cdab
	nop			;cdac
	nop			;cdad
	nop			;cdae
	nop			;cdaf
	nop			;cdb0
	nop			;cdb1
	nop			;cdb2
	nop			;cdb3
	nop			;cdb4
	nop			;cdb5
	nop			;cdb6
	nop			;cdb7
	nop			;cdb8
	nop			;cdb9
	nop			;cdba
	nop			;cdbb
	nop			;cdbc
	nop			;cdbd
	nop			;cdbe
	nop			;cdbf
	nop			;cdc0
	nop			;cdc1
	nop			;cdc2
	nop			;cdc3
	nop			;cdc4
	nop			;cdc5
	nop			;cdc6
	nop			;cdc7
	nop			;cdc8
	nop			;cdc9
	nop			;cdca
	nop			;cdcb
	nop			;cdcc
	nop			;cdcd
	nop			;cdce
	nop			;cdcf
	nop			;cdd0
	nop			;cdd1
	nop			;cdd2
	nop			;cdd3
	nop			;cdd4
	nop			;cdd5
	nop			;cdd6
	nop			;cdd7
	nop			;cdd8
	nop			;cdd9
	nop			;cdda
	nop			;cddb
	nop			;cddc
	nop			;cddd
	nop			;cdde
	nop			;cddf
	nop			;cde0
	nop			;cde1
	nop			;cde2
	nop			;cde3
	nop			;cde4
	nop			;cde5
	nop			;cde6
	nop			;cde7
	nop			;cde8
	nop			;cde9
	nop			;cdea
	nop			;cdeb
	nop			;cdec
	nop			;cded
	nop			;cdee
	nop			;cdef
	nop			;cdf0
	nop			;cdf1
	nop			;cdf2
	nop			;cdf3
	nop			;cdf4
	nop			;cdf5
	nop			;cdf6
	nop			;cdf7
	nop			;cdf8
	nop			;cdf9
	nop			;cdfa
	nop			;cdfb
	nop			;cdfc
	nop			;cdfd
	nop			;cdfe
	nop			;cdff
	nop			;ce00
	nop			;ce01
	nop			;ce02
	nop			;ce03
	nop			;ce04
	nop			;ce05
	nop			;ce06
	nop			;ce07
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
	nop			;ce26
	nop			;ce27
	nop			;ce28
	nop			;ce29
	nop			;ce2a
	nop			;ce2b
	nop			;ce2c
	nop			;ce2d
	nop			;ce2e
	nop			;ce2f
	nop			;ce30
	nop			;ce31
	nop			;ce32
	nop			;ce33
	nop			;ce34
	nop			;ce35
	nop			;ce36
	nop			;ce37
	nop			;ce38
	nop			;ce39
	nop			;ce3a
	nop			;ce3b
	nop			;ce3c
	nop			;ce3d
	nop			;ce3e
	nop			;ce3f
	nop			;ce40
	nop			;ce41
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
lce4fh:
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
	nop			;ce5e
	nop			;ce5f
	nop			;ce60
	nop			;ce61
	nop			;ce62
	nop			;ce63
	nop			;ce64
	nop			;ce65
	nop			;ce66
	nop			;ce67
	nop			;ce68
	nop			;ce69
	nop			;ce6a
	nop			;ce6b
	nop			;ce6c
	nop			;ce6d
	nop			;ce6e
	nop			;ce6f
	nop			;ce70
	nop			;ce71
	nop			;ce72
	nop			;ce73
	nop			;ce74
	nop			;ce75
	nop			;ce76
lce77h:
	nop			;ce77
	nop			;ce78
	nop			;ce79
	nop			;ce7a
	nop			;ce7b
	nop			;ce7c
	nop			;ce7d
	nop			;ce7e
	nop			;ce7f
	nop			;ce80
	nop			;ce81
	nop			;ce82
	nop			;ce83
	nop			;ce84
	nop			;ce85
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
	nop			;ce98
	nop			;ce99
	nop			;ce9a
	nop			;ce9b
	nop			;ce9c
	nop			;ce9d
	nop			;ce9e
	nop			;ce9f
	nop			;cea0
	nop			;cea1
	nop			;cea2
	nop			;cea3
	nop			;cea4
	nop			;cea5
	nop			;cea6
	nop			;cea7
	nop			;cea8
	nop			;cea9
	nop			;ceaa
	nop			;ceab
	nop			;ceac
	nop			;cead
	nop			;ceae
	nop			;ceaf
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
lcec0h:
	nop			;cec0
	nop			;cec1
	nop			;cec2
	nop			;cec3
	nop			;cec4
	nop			;cec5
	nop			;cec6
	nop			;cec7
	nop			;cec8
	nop			;cec9
	nop			;ceca
	nop			;cecb
	nop			;cecc
	nop			;cecd
	nop			;cece
	nop			;cecf
	nop			;ced0
	nop			;ced1
	nop			;ced2
	nop			;ced3
	nop			;ced4
	nop			;ced5
	nop			;ced6
	nop			;ced7
	nop			;ced8
	nop			;ced9
	nop			;ceda
	nop			;cedb
	nop			;cedc
	nop			;cedd
	nop			;cede
	nop			;cedf
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
	jr nz,lcf0eh		;cf0c
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
	nop			;cf24
	nop			;cf25
	nop			;cf26
	nop			;cf27
	nop			;cf28
	nop			;cf29
	nop			;cf2a
	nop			;cf2b
	nop			;cf2c
	nop			;cf2d
	nop			;cf2e
	nop			;cf2f
	nop			;cf30
	nop			;cf31
	nop			;cf32
	nop			;cf33
	nop			;cf34
	nop			;cf35
	nop			;cf36
	nop			;cf37
	nop			;cf38
	nop			;cf39
	nop			;cf3a
	nop			;cf3b
	nop			;cf3c
	nop			;cf3d
	nop			;cf3e
	nop			;cf3f
	nop			;cf40
	nop			;cf41
	nop			;cf42
lcf43h:
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
lcf5bh:
	nop			;cf5b
	nop			;cf5c
	nop			;cf5d
	nop			;cf5e
	nop			;cf5f
	nop			;cf60
lcf61h:
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
	nop			;cf6f
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
sub_cf80h:
	nop			;cf80
	nop			;cf81
	nop			;cf82
	nop			;cf83
	nop			;cf84
	nop			;cf85
	nop			;cf86
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
	nop			;cfac
	nop			;cfad
	nop			;cfae
	nop			;cfaf
	ex af,af'		;cfb0
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
	nop			;cfeb
	nop			;cfec
	nop			;cfed
	nop			;cfee
	nop			;cfef
	nop			;cff0
	nop			;cff1
	nop			;cff2
	nop			;cff3
	nop			;cff4
	nop			;cff5
	nop			;cff6
	nop			;cff7
	nop			;cff8
	nop			;cff9
	nop			;cffa
	nop			;cffb
	nop			;cffc
	nop			;cffd
	nop			;cffe
lcfffh:
	nop			;cfff
	nop			;d000
	nop			;d001
	nop			;d002
	nop			;d003
	nop			;d004
	nop			;d005
	nop			;d006
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
	nop			;d02f
	nop			;d030
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
	nop			;d03e
	nop			;d03f
	nop			;d040
	nop			;d041
	nop			;d042
	nop			;d043
	nop			;d044
	nop			;d045
	nop			;d046
	nop			;d047
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
	nop			;d05d
	nop			;d05e
	nop			;d05f
	nop			;d060
	nop			;d061
	nop			;d062
	nop			;d063
	nop			;d064
	nop			;d065
	nop			;d066
	nop			;d067
	nop			;d068
	nop			;d069
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
	nop			;d09c
	nop			;d09d
	nop			;d09e
	nop			;d09f
	nop			;d0a0
	nop			;d0a1
	nop			;d0a2
	nop			;d0a3
	nop			;d0a4
	nop			;d0a5
	nop			;d0a6
	nop			;d0a7
	nop			;d0a8
	nop			;d0a9
	nop			;d0aa
	nop			;d0ab
	nop			;d0ac
	nop			;d0ad
	nop			;d0ae
	nop			;d0af
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
	nop			;d0be
	nop			;d0bf
	nop			;d0c0
	nop			;d0c1
	nop			;d0c2
	nop			;d0c3
	nop			;d0c4
	nop			;d0c5
	nop			;d0c6
	nop			;d0c7
	nop			;d0c8
	nop			;d0c9
	nop			;d0ca
	nop			;d0cb
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
sub_d0d8h:
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
	nop			;d0ef
	nop			;d0f0
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
	nop			;d0fb
	nop			;d0fc
	nop			;d0fd
	nop			;d0fe
	nop			;d0ff
	nop			;d100
	nop			;d101
	nop			;d102
	nop			;d103
	nop			;d104
	nop			;d105
	nop			;d106
	nop			;d107
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
	nop			;d12c
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
	nop			;d150
	nop			;d151
	nop			;d152
	nop			;d153
	nop			;d154
	nop			;d155
	nop			;d156
	nop			;d157
	nop			;d158
	nop			;d159
	nop			;d15a
	nop			;d15b
	nop			;d15c
	nop			;d15d
	nop			;d15e
	nop			;d15f
	nop			;d160
	nop			;d161
	nop			;d162
	nop			;d163
	nop			;d164
	nop			;d165
	nop			;d166
	nop			;d167
	nop			;d168
	nop			;d169
	nop			;d16a
	nop			;d16b
	nop			;d16c
	nop			;d16d
	nop			;d16e
	nop			;d16f
	nop			;d170
	nop			;d171
	nop			;d172
	nop			;d173
	nop			;d174
	nop			;d175
	nop			;d176
	nop			;d177
	nop			;d178
	nop			;d179
	nop			;d17a
	nop			;d17b
	nop			;d17c
	nop			;d17d
	nop			;d17e
	nop			;d17f
	nop			;d180
	nop			;d181
	nop			;d182
	nop			;d183
	nop			;d184
	nop			;d185
	nop			;d186
	nop			;d187
	nop			;d188
	nop			;d189
	nop			;d18a
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
	rrca			;d1b0
	call z,0072ch		;d1b1
	rst 8			;d1b4
	ret po			;d1b5
	nop			;d1b6
	inc c			;d1b7
	inc l			;d1b8
	daa			;d1b9
	ret nz			;d1ba
	nop			;d1bb
	rrca			;d1bc
	rst 28h			;d1bd
	rst 20h			;d1be
	ret po			;d1bf
	nop			;d1c0
	nop			;d1c1
	nop			;d1c2
	nop			;d1c3
	nop			;d1c4
	nop			;d1c5
	nop			;d1c6
	nop			;d1c7
	nop			;d1c8
	nop			;d1c9
	nop			;d1ca
	nop			;d1cb
	nop			;d1cc
	nop			;d1cd
	nop			;d1ce
	nop			;d1cf
	nop			;d1d0
	nop			;d1d1
	nop			;d1d2
	nop			;d1d3
	nop			;d1d4
	nop			;d1d5
	nop			;d1d6
	nop			;d1d7
	nop			;d1d8
	nop			;d1d9
	nop			;d1da
	nop			;d1db
	nop			;d1dc
	nop			;d1dd
	nop			;d1de
	nop			;d1df
	nop			;d1e0
	nop			;d1e1
	nop			;d1e2
	nop			;d1e3
	nop			;d1e4
	nop			;d1e5
	nop			;d1e6
	nop			;d1e7
	nop			;d1e8
	nop			;d1e9
	nop			;d1ea
	nop			;d1eb
	nop			;d1ec
	nop			;d1ed
	nop			;d1ee
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
	nop			;d20f
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
	nop			;d224
	nop			;d225
	nop			;d226
	nop			;d227
	nop			;d228
	nop			;d229
	nop			;d22a
	nop			;d22b
	nop			;d22c
	nop			;d22d
	nop			;d22e
	nop			;d22f
	nop			;d230
	nop			;d231
	nop			;d232
	nop			;d233
	nop			;d234
	nop			;d235
	nop			;d236
	nop			;d237
	nop			;d238
	nop			;d239
	nop			;d23a
	nop			;d23b
	nop			;d23c
	nop			;d23d
	nop			;d23e
	nop			;d23f
	nop			;d240
	nop			;d241
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
ld255h:
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
	nop			;d26f
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
	nop			;d27f
	nop			;d280
	nop			;d281
	nop			;d282
	nop			;d283
	nop			;d284
	nop			;d285
	nop			;d286
	nop			;d287
	nop			;d288
	nop			;d289
	nop			;d28a
	nop			;d28b
	nop			;d28c
	nop			;d28d
	nop			;d28e
	nop			;d28f
	nop			;d290
	nop			;d291
	nop			;d292
	nop			;d293
	nop			;d294
	nop			;d295
	nop			;d296
	nop			;d297
	nop			;d298
	nop			;d299
	nop			;d29a
	nop			;d29b
	nop			;d29c
	nop			;d29d
	nop			;d29e
	nop			;d29f
	nop			;d2a0
	nop			;d2a1
	nop			;d2a2
	nop			;d2a3
	nop			;d2a4
	nop			;d2a5
	nop			;d2a6
	nop			;d2a7
	nop			;d2a8
	nop			;d2a9
	nop			;d2aa
	nop			;d2ab
	nop			;d2ac
	nop			;d2ad
	nop			;d2ae
	nop			;d2af
	inc c			;d2b0
	inc l			;d2b1
	inc l			;d2b2
	inc c			;d2b3
	inc c			;d2b4
	nop			;d2b5
	nop			;d2b6
	inc c			;d2b7
	ld l,02ch		;d2b8
	jr nz,ld2bch		;d2ba
ld2bch:
	rrca			;d2bc
	call z,0200eh		;d2bd
	nop			;d2c0
	nop			;d2c1
ld2c2h:
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
	nop			;d2cf
	nop			;d2d0
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
	nop			;d2e0
	nop			;d2e1
ld2e2h:
	nop			;d2e2
	nop			;d2e3
	nop			;d2e4
	nop			;d2e5
	nop			;d2e6
	nop			;d2e7
	nop			;d2e8
	nop			;d2e9
	nop			;d2ea
	nop			;d2eb
	nop			;d2ec
	nop			;d2ed
	nop			;d2ee
	nop			;d2ef
	nop			;d2f0
	nop			;d2f1
	nop			;d2f2
	nop			;d2f3
	nop			;d2f4
	nop			;d2f5
	nop			;d2f6
	nop			;d2f7
	nop			;d2f8
	nop			;d2f9
	nop			;d2fa
	nop			;d2fb
	nop			;d2fc
	nop			;d2fd
	nop			;d2fe
	nop			;d2ff
	nop			;d300
	nop			;d301
	nop			;d302
	nop			;d303
	nop			;d304
	nop			;d305
	nop			;d306
	nop			;d307
	nop			;d308
	nop			;d309
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
	nop			;d32f
	nop			;d330
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
	nop			;d33e
	nop			;d33f
	nop			;d340
	nop			;d341
	nop			;d342
	nop			;d343
	nop			;d344
	nop			;d345
	nop			;d346
	nop			;d347
	nop			;d348
	nop			;d349
	nop			;d34a
	nop			;d34b
	nop			;d34c
	nop			;d34d
	nop			;d34e
	nop			;d34f
	nop			;d350
	nop			;d351
	nop			;d352
	nop			;d353
	nop			;d354
	nop			;d355
	nop			;d356
	nop			;d357
	nop			;d358
	nop			;d359
	nop			;d35a
	nop			;d35b
	nop			;d35c
	nop			;d35d
	nop			;d35e
	nop			;d35f
	nop			;d360
	nop			;d361
	nop			;d362
	nop			;d363
	nop			;d364
	nop			;d365
	nop			;d366
	nop			;d367
	nop			;d368
ld369h:
	nop			;d369
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
	nop			;d38f
	inc b			;d390
	nop			;d391
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
	nop			;d39d
	nop			;d39e
	nop			;d39f
	nop			;d3a0
	nop			;d3a1
	nop			;d3a2
	nop			;d3a3
	nop			;d3a4
	nop			;d3a5
	nop			;d3a6
	nop			;d3a7
	nop			;d3a8
	nop			;d3a9
	nop			;d3aa
	nop			;d3ab
	nop			;d3ac
	nop			;d3ad
	nop			;d3ae
	nop			;d3af
	ld b,016h		;d3b0
	ld d,003h		;d3b2
	rst 20h			;d3b4
	ret po			;d3b5
	nop			;d3b6
	ld b,017h		;d3b7
	sub a			;d3b9
	djnz ld3bch		;d3ba
ld3bch:
	ld bc,le687h		;d3bc
	nop			;d3bf
	nop			;d3c0
	nop			;d3c1
	nop			;d3c2
	nop			;d3c3
	nop			;d3c4
	nop			;d3c5
	nop			;d3c6
	nop			;d3c7
	nop			;d3c8
	nop			;d3c9
	nop			;d3ca
	nop			;d3cb
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
	nop			;d3ef
	nop			;d3f0
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
	nop			;d3fb
	nop			;d3fc
	nop			;d3fd
	nop			;d3fe
	nop			;d3ff
	nop			;d400
	nop			;d401
	nop			;d402
	nop			;d403
	nop			;d404
	nop			;d405
	nop			;d406
	nop			;d407
	nop			;d408
	nop			;d409
	nop			;d40a
	nop			;d40b
	nop			;d40c
	nop			;d40d
	nop			;d40e
	nop			;d40f
	nop			;d410
	nop			;d411
	nop			;d412
	nop			;d413
	nop			;d414
	nop			;d415
	nop			;d416
	nop			;d417
	nop			;d418
	nop			;d419
	nop			;d41a
	nop			;d41b
	nop			;d41c
	nop			;d41d
	nop			;d41e
	nop			;d41f
	nop			;d420
	nop			;d421
	nop			;d422
	nop			;d423
	nop			;d424
	nop			;d425
	nop			;d426
	nop			;d427
	nop			;d428
	nop			;d429
	nop			;d42a
	nop			;d42b
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
	nop			;d450
	nop			;d451
	nop			;d452
	nop			;d453
sub_d454h:
	nop			;d454
	nop			;d455
	nop			;d456
	nop			;d457
	nop			;d458
	nop			;d459
	nop			;d45a
	nop			;d45b
	nop			;d45c
	nop			;d45d
	nop			;d45e
	nop			;d45f
	nop			;d460
	nop			;d461
	nop			;d462
	nop			;d463
	nop			;d464
	nop			;d465
	nop			;d466
	nop			;d467
	nop			;d468
	nop			;d469
	nop			;d46a
	nop			;d46b
	nop			;d46c
	nop			;d46d
	nop			;d46e
	nop			;d46f
	nop			;d470
	nop			;d471
	nop			;d472
	nop			;d473
	nop			;d474
	nop			;d475
	nop			;d476
	nop			;d477
	nop			;d478
	nop			;d479
	nop			;d47a
	nop			;d47b
	nop			;d47c
	nop			;d47d
	nop			;d47e
	nop			;d47f
	nop			;d480
	nop			;d481
	nop			;d482
	nop			;d483
	nop			;d484
	nop			;d485
	nop			;d486
	nop			;d487
	nop			;d488
	nop			;d489
	nop			;d48a
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
	rlca			;d4b0
	and 016h		;d4b1
	nop			;d4b3
	ld (hl),000h		;d4b4
	nop			;d4b6
	ld b,016h		;d4b7
	rst 10h			;d4b9
	ret p			;d4ba
	nop			;d4bb
	ld bc,00686h		;d4bc
	nop			;d4bf
	nop			;d4c0
	nop			;d4c1
	nop			;d4c2
	nop			;d4c3
	nop			;d4c4
	nop			;d4c5
	nop			;d4c6
	nop			;d4c7
	nop			;d4c8
	nop			;d4c9
	nop			;d4ca
	nop			;d4cb
	nop			;d4cc
	nop			;d4cd
	nop			;d4ce
	nop			;d4cf
	nop			;d4d0
	nop			;d4d1
	nop			;d4d2
	nop			;d4d3
	nop			;d4d4
	nop			;d4d5
	nop			;d4d6
	nop			;d4d7
	nop			;d4d8
	nop			;d4d9
	nop			;d4da
	nop			;d4db
	nop			;d4dc
	nop			;d4dd
	nop			;d4de
	nop			;d4df
	nop			;d4e0
	nop			;d4e1
	nop			;d4e2
	nop			;d4e3
	nop			;d4e4
	nop			;d4e5
	nop			;d4e6
	nop			;d4e7
	nop			;d4e8
	nop			;d4e9
	nop			;d4ea
	nop			;d4eb
	nop			;d4ec
	nop			;d4ed
	nop			;d4ee
ld4efh:
	nop			;d4ef
	nop			;d4f0
	nop			;d4f1
	nop			;d4f2
	nop			;d4f3
ld4f4h:
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
	nop			;d50b
	nop			;d50c
	nop			;d50d
	nop			;d50e
	nop			;d50f
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
	nop			;d523
	nop			;d524
	nop			;d525
	nop			;d526
	nop			;d527
	nop			;d528
	nop			;d529
	nop			;d52a
	nop			;d52b
	nop			;d52c
	nop			;d52d
	nop			;d52e
	nop			;d52f
	nop			;d530
	nop			;d531
	nop			;d532
	nop			;d533
	nop			;d534
	nop			;d535
	nop			;d536
	nop			;d537
	nop			;d538
	nop			;d539
	nop			;d53a
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
sub_d559h:
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
	ld b,b			;d56b
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
	nop			;d5aa
	nop			;d5ab
	nop			;d5ac
	nop			;d5ad
	nop			;d5ae
	nop			;d5af
	ld b,007h		;d5b0
	ld d,036h		;d5b2
	ld d,000h		;d5b4
	nop			;d5b6
	rlca			;d5b7
	ld d,076h		;d5b8
	ret p			;d5ba
	nop			;d5bb
	ld bc,00686h		;d5bc
	djnz ld5c1h		;d5bf
ld5c1h:
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
sub_d5d9h:
	nop			;d5d9
	nop			;d5da
	nop			;d5db
	nop			;d5dc
	nop			;d5dd
	nop			;d5de
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
	nop			;d606
	nop			;d607
	nop			;d608
	nop			;d609
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
	nop			;d62f
	nop			;d630
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
	nop			;d63d
	nop			;d63e
	nop			;d63f
	nop			;d640
	nop			;d641
	nop			;d642
	nop			;d643
	nop			;d644
	nop			;d645
	nop			;d646
	nop			;d647
	nop			;d648
	nop			;d649
	nop			;d64a
	nop			;d64b
	nop			;d64c
	nop			;d64d
	nop			;d64e
	nop			;d64f
	nop			;d650
	nop			;d651
	nop			;d652
	nop			;d653
	nop			;d654
	nop			;d655
	nop			;d656
	nop			;d657
	nop			;d658
	nop			;d659
	nop			;d65a
	nop			;d65b
	nop			;d65c
	nop			;d65d
	nop			;d65e
	nop			;d65f
	nop			;d660
	nop			;d661
	nop			;d662
	nop			;d663
	nop			;d664
	nop			;d665
	nop			;d666
	nop			;d667
	nop			;d668
	nop			;d669
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
	nop			;d68f
	nop			;d690
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
	nop			;d69c
	nop			;d69d
	nop			;d69e
	nop			;d69f
	nop			;d6a0
	nop			;d6a1
	nop			;d6a2
	nop			;d6a3
	nop			;d6a4
	nop			;d6a5
	nop			;d6a6
	nop			;d6a7
	nop			;d6a8
	nop			;d6a9
	nop			;d6aa
	nop			;d6ab
	nop			;d6ac
	nop			;d6ad
	nop			;d6ae
	nop			;d6af
	ld b,007h		;d6b0
	rst 30h			;d6b2
	rst 30h			;d6b3
	rst 30h			;d6b4
	ret p			;d6b5
	nop			;d6b6
	rlca			;d6b7
	or 036h			;d6b8
	djnz ld6bch		;d6ba
ld6bch:
	ld bc,0f387h		;d6bc
	ret p			;d6bf
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
ld6d7h:
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
	nop			;d6ef
	nop			;d6f0
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
	nop			;d6fb
	nop			;d6fc
	nop			;d6fd
	nop			;d6fe
	nop			;d6ff
	nop			;d700
	nop			;d701
	nop			;d702
	nop			;d703
	nop			;d704
	nop			;d705
	nop			;d706
	nop			;d707
	nop			;d708
	nop			;d709
	nop			;d70a
	nop			;d70b
	nop			;d70c
	nop			;d70d
	nop			;d70e
	nop			;d70f
	nop			;d710
	nop			;d711
	nop			;d712
	nop			;d713
	nop			;d714
	nop			;d715
	nop			;d716
	nop			;d717
	nop			;d718
	nop			;d719
	nop			;d71a
	nop			;d71b
	nop			;d71c
	nop			;d71d
	nop			;d71e
	nop			;d71f
	nop			;d720
	nop			;d721
	nop			;d722
	nop			;d723
	nop			;d724
	nop			;d725
	nop			;d726
	nop			;d727
	nop			;d728
	nop			;d729
	nop			;d72a
	nop			;d72b
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
	nop			;d750
	nop			;d751
	ex af,af'		;d752
	nop			;d753
	nop			;d754
	nop			;d755
	nop			;d756
	nop			;d757
	nop			;d758
	nop			;d759
	nop			;d75a
	nop			;d75b
	nop			;d75c
	nop			;d75d
	nop			;d75e
	nop			;d75f
	nop			;d760
	nop			;d761
	nop			;d762
	nop			;d763
	nop			;d764
	nop			;d765
	nop			;d766
	nop			;d767
	nop			;d768
	nop			;d769
	nop			;d76a
	nop			;d76b
	nop			;d76c
	nop			;d76d
	nop			;d76e
	nop			;d76f
	nop			;d770
	nop			;d771
	nop			;d772
	nop			;d773
	nop			;d774
	nop			;d775
	nop			;d776
	nop			;d777
	nop			;d778
	nop			;d779
	nop			;d77a
	nop			;d77b
	nop			;d77c
	nop			;d77d
	nop			;d77e
	nop			;d77f
	nop			;d780
	nop			;d781
	nop			;d782
	nop			;d783
	nop			;d784
	nop			;d785
	nop			;d786
	nop			;d787
	nop			;d788
	nop			;d789
	nop			;d78a
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
	ld b,003h		;d7b0
	rst 20h			;d7b2
	di			;d7b3
	rst 20h			;d7b4
	ret p			;d7b5
	nop			;d7b6
	inc bc			;d7b7
	and 036h		;d7b8
	djnz ld7bch		;d7ba
ld7bch:
	ld bc,lf187h		;d7bc
	ret po			;d7bf
	nop			;d7c0
	nop			;d7c1
	nop			;d7c2
	nop			;d7c3
	nop			;d7c4
	nop			;d7c5
	nop			;d7c6
	nop			;d7c7
	nop			;d7c8
	nop			;d7c9
	nop			;d7ca
	nop			;d7cb
	nop			;d7cc
	nop			;d7cd
	nop			;d7ce
	nop			;d7cf
	nop			;d7d0
	nop			;d7d1
	nop			;d7d2
	nop			;d7d3
	nop			;d7d4
	nop			;d7d5
	nop			;d7d6
	nop			;d7d7
	nop			;d7d8
	nop			;d7d9
	nop			;d7da
	nop			;d7db
	nop			;d7dc
	nop			;d7dd
ld7deh:
	nop			;d7de
	nop			;d7df
	nop			;d7e0
	nop			;d7e1
	nop			;d7e2
	nop			;d7e3
	nop			;d7e4
	nop			;d7e5
	nop			;d7e6
	nop			;d7e7
ld7e8h:
	nop			;d7e8
	nop			;d7e9
	nop			;d7ea
	nop			;d7eb
	nop			;d7ec
	nop			;d7ed
	nop			;d7ee
	nop			;d7ef
	nop			;d7f0
	nop			;d7f1
	nop			;d7f2
	nop			;d7f3
	nop			;d7f4
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
	nop			;d7ff
	ld b,a			;d800
	ld b,a			;d801
	ld b,a			;d802
	ld b,a			;d803
	ld b,a			;d804
	ld b,a			;d805
	ld b,a			;d806
	ld b,a			;d807
	ld b,a			;d808
	ld b,a			;d809
	ld b,a			;d80a
	ld b,a			;d80b
	ld b,a			;d80c
	ld b,a			;d80d
	ld b,a			;d80e
	ld b,a			;d80f
	ld b,a			;d810
	ld b,a			;d811
	ld b,a			;d812
	ld b,a			;d813
	ld b,a			;d814
	ld b,a			;d815
	ld b,a			;d816
	ld b,a			;d817
	ld b,a			;d818
	ld b,a			;d819
	ld b,a			;d81a
	ld b,a			;d81b
	ld b,a			;d81c
	ld b,a			;d81d
	ld b,a			;d81e
	ld b,a			;d81f
	ld b,a			;d820
	ld b,a			;d821
	ld b,a			;d822
	ld b,a			;d823
	ld b,a			;d824
	ld b,a			;d825
	ld b,a			;d826
	ld b,a			;d827
	ld b,a			;d828
	ld b,a			;d829
	ld b,a			;d82a
	ld b,h			;d82b
	ld b,h			;d82c
sub_d82dh:
	ld b,h			;d82d
	ld b,h			;d82e
	ld b,a			;d82f
	ld b,a			;d830
	ld b,a			;d831
	ld b,a			;d832
	ld b,a			;d833
	ld b,a			;d834
	ld b,a			;d835
	ld b,a			;d836
	ld b,a			;d837
	ld b,a			;d838
	ld b,a			;d839
	ld b,a			;d83a
	ld b,a			;d83b
	ld b,a			;d83c
	ld b,a			;d83d
	ld b,a			;d83e
	ld b,a			;d83f
	ld b,a			;d840
	ld b,a			;d841
	ld b,a			;d842
	ld b,a			;d843
	ld b,a			;d844
	ld b,a			;d845
	ld b,a			;d846
	ld b,a			;d847
	ld b,a			;d848
	ld b,a			;d849
	ld b,a			;d84a
	rlca			;d84b
	rlca			;d84c
	ld b,a			;d84d
	ld b,a			;d84e
	ld b,a			;d84f
	ld b,a			;d850
	ld b,a			;d851
	rlca			;d852
	rlca			;d853
	ld b,a			;d854
	ld b,a			;d855
	ld b,a			;d856
	ld b,a			;d857
	ld b,a			;d858
	ld b,a			;d859
	ld b,a			;d85a
	ld b,a			;d85b
	ld b,a			;d85c
	ld b,a			;d85d
	ld b,a			;d85e
	ld b,a			;d85f
	ld b,a			;d860
	ld b,a			;d861
	ld b,a			;d862
	ld b,a			;d863
	ld b,a			;d864
	ld b,a			;d865
	ld b,a			;d866
	ld b,a			;d867
	ld b,a			;d868
	ld b,a			;d869
sub_d86ah:
	ld b,a			;d86a
	rlca			;d86b
	rlca			;d86c
	rlca			;d86d
	rlca			;d86e
	rlca			;d86f
	rlca			;d870
	rlca			;d871
	rlca			;d872
	rlca			;d873
	ld b,a			;d874
	ld b,a			;d875
	ld b,a			;d876
	ld b,a			;d877
	ld b,a			;d878
	ld b,a			;d879
	ld b,a			;d87a
	ld b,a			;d87b
	ld b,a			;d87c
	ld b,a			;d87d
	ld b,a			;d87e
	ld b,a			;d87f
	ld b,a			;d880
	ld b,a			;d881
	ld b,a			;d882
	ld b,a			;d883
	ld b,a			;d884
	ld b,a			;d885
	ld b,a			;d886
	ld b,a			;d887
	ld b,a			;d888
	ld b,a			;d889
	ld b,a			;d88a
	rlca			;d88b
	rlca			;d88c
	rlca			;d88d
	rlca			;d88e
	rlca			;d88f
	rlca			;d890
	rlca			;d891
	rlca			;d892
	rlca			;d893
	ld b,a			;d894
	ld b,a			;d895
	ld b,a			;d896
	ld b,a			;d897
	ld b,a			;d898
	ld b,a			;d899
	ld b,a			;d89a
	ld b,a			;d89b
	ld b,a			;d89c
	ld b,a			;d89d
	ld b,a			;d89e
	ld b,a			;d89f
	ld b,a			;d8a0
	ld b,a			;d8a1
	ld b,a			;d8a2
	ld b,a			;d8a3
	ld b,a			;d8a4
	ld b,a			;d8a5
	ld b,a			;d8a6
	ld b,a			;d8a7
	ld b,a			;d8a8
	ld b,a			;d8a9
	ld b,a			;d8aa
	ld b,a			;d8ab
	ld b,a			;d8ac
	ld b,a			;d8ad
	ld b,a			;d8ae
	ld b,a			;d8af
	ld b,a			;d8b0
	ld b,a			;d8b1
	ld b,a			;d8b2
	ld b,a			;d8b3
	ld b,a			;d8b4
	ld b,a			;d8b5
	ld b,a			;d8b6
	ld b,a			;d8b7
	ld b,a			;d8b8
	ld b,a			;d8b9
	ld b,a			;d8ba
	ld b,a			;d8bb
	ld b,a			;d8bc
	ld b,a			;d8bd
	ld b,a			;d8be
	ld b,a			;d8bf
	ld b,a			;d8c0
	ld b,a			;d8c1
	ld b,a			;d8c2
	ld b,a			;d8c3
	ld b,a			;d8c4
	ld b,a			;d8c5
	ld b,a			;d8c6
	ld b,a			;d8c7
	ld b,a			;d8c8
	ld b,a			;d8c9
	ld b,a			;d8ca
	ld b,a			;d8cb
	ld b,a			;d8cc
	ld b,a			;d8cd
	ld b,a			;d8ce
	ld b,a			;d8cf
	ld b,a			;d8d0
	ld b,a			;d8d1
	ld b,a			;d8d2
	ld b,a			;d8d3
	ld b,a			;d8d4
	ld b,a			;d8d5
	ld b,a			;d8d6
	ld b,a			;d8d7
	ld b,a			;d8d8
	ld b,a			;d8d9
	ld b,a			;d8da
	ld b,a			;d8db
	ld b,a			;d8dc
	ld b,a			;d8dd
	ld b,a			;d8de
	ld b,a			;d8df
	ld b,a			;d8e0
	ld b,a			;d8e1
	ld b,a			;d8e2
	ld b,a			;d8e3
	ld b,a			;d8e4
	ld b,a			;d8e5
	ld b,a			;d8e6
	ld b,a			;d8e7
sub_d8e8h:
	ld b,a			;d8e8
	ld b,a			;d8e9
	ld b,a			;d8ea
	ld b,a			;d8eb
	ld b,a			;d8ec
	ld b,a			;d8ed
	ld b,a			;d8ee
	ld b,a			;d8ef
	ld b,a			;d8f0
	ld b,a			;d8f1
	ld b,a			;d8f2
	ld b,a			;d8f3
	ld b,a			;d8f4
	ld b,a			;d8f5
	ld b,a			;d8f6
	ld b,a			;d8f7
	ld b,a			;d8f8
	ld b,a			;d8f9
	ld b,a			;d8fa
	ld b,a			;d8fb
	ld b,a			;d8fc
	ld b,a			;d8fd
	ld b,a			;d8fe
	ld b,a			;d8ff
	ld b,a			;d900
	ld b,a			;d901
	ld b,a			;d902
	ld b,a			;d903
	ld b,a			;d904
	ld b,a			;d905
	ld b,a			;d906
	ld b,a			;d907
	ld b,a			;d908
	ld b,a			;d909
	ld b,a			;d90a
	ld b,a			;d90b
	ld b,a			;d90c
	ld b,a			;d90d
	ld b,a			;d90e
	ld b,a			;d90f
	ld b,a			;d910
	ld b,a			;d911
	ld b,a			;d912
	ld b,a			;d913
	ld b,a			;d914
	ld b,a			;d915
	ld b,a			;d916
	ld b,a			;d917
	ld b,a			;d918
	ld b,a			;d919
	ld b,a			;d91a
	ld b,a			;d91b
	ld b,a			;d91c
	ld b,a			;d91d
	ld b,a			;d91e
	ld b,a			;d91f
	ld b,a			;d920
	ld b,a			;d921
	ld b,a			;d922
	ld b,a			;d923
	ld b,a			;d924
	ld b,a			;d925
	ld b,a			;d926
	ld b,a			;d927
	ld b,a			;d928
	ld b,a			;d929
	ld b,a			;d92a
	ld b,a			;d92b
	ld b,a			;d92c
	ld b,a			;d92d
	ld b,a			;d92e
	ld b,a			;d92f
	ld b,a			;d930
	ld b,a			;d931
	ld b,a			;d932
	ld b,a			;d933
	ld b,a			;d934
	ld b,a			;d935
	ld b,a			;d936
	ld b,a			;d937
	ld b,a			;d938
	ld b,a			;d939
	ld b,a			;d93a
	ld b,a			;d93b
	ld b,a			;d93c
	ld b,a			;d93d
	ld b,a			;d93e
	ld b,a			;d93f
	ld b,a			;d940
	ld b,a			;d941
	ld b,a			;d942
	ld b,a			;d943
	ld b,a			;d944
	ld b,a			;d945
	ld b,a			;d946
	ld b,a			;d947
	ld b,a			;d948
	ld b,a			;d949
	ld b,a			;d94a
	ld b,a			;d94b
	ld b,a			;d94c
	ld b,a			;d94d
	ld b,a			;d94e
	ld b,a			;d94f
	ld b,a			;d950
	ld b,a			;d951
	ld b,a			;d952
	ld b,a			;d953
	ld b,a			;d954
	ld b,a			;d955
	ld b,a			;d956
	ld b,a			;d957
	ld b,a			;d958
	ld b,a			;d959
	ld b,a			;d95a
	ld b,a			;d95b
	ld b,a			;d95c
	ld b,a			;d95d
	ld b,a			;d95e
	ld b,a			;d95f
	ld b,a			;d960
	ld b,a			;d961
	ld b,a			;d962
	ld b,a			;d963
sub_d964h:
	ld b,a			;d964
	ld b,a			;d965
	ld b,a			;d966
	ld b,a			;d967
	ld b,a			;d968
	ld b,a			;d969
	ld b,a			;d96a
	ld b,a			;d96b
	ld b,a			;d96c
	ld b,a			;d96d
	ld b,a			;d96e
	ld b,a			;d96f
	ld b,a			;d970
	ld b,a			;d971
	ld b,a			;d972
	ld b,a			;d973
	ld b,a			;d974
	ld b,a			;d975
	ld b,a			;d976
	ld b,a			;d977
	ld b,a			;d978
	ld b,a			;d979
	ld b,a			;d97a
	ld b,a			;d97b
	ld b,a			;d97c
	ld b,a			;d97d
	ld b,a			;d97e
	ld b,a			;d97f
	ld b,a			;d980
	ld b,a			;d981
	ld b,a			;d982
	ld b,a			;d983
	ld b,a			;d984
	ld b,a			;d985
	ld b,a			;d986
	ld b,a			;d987
	ld b,a			;d988
	ld b,a			;d989
	ld b,a			;d98a
	ld b,a			;d98b
	ld b,a			;d98c
	ld b,a			;d98d
	ld b,a			;d98e
	ld b,a			;d98f
	ld b,a			;d990
	ld b,a			;d991
	ld b,a			;d992
	ld b,a			;d993
	ld b,a			;d994
	ld b,a			;d995
	ld b,a			;d996
	ld b,a			;d997
	ld b,a			;d998
	ld b,a			;d999
	ld b,a			;d99a
	ld b,a			;d99b
	ld b,a			;d99c
	ld b,a			;d99d
	ld b,a			;d99e
	ld b,a			;d99f
	ld b,a			;d9a0
	ld b,a			;d9a1
	ld b,a			;d9a2
	ld b,a			;d9a3
	ld b,a			;d9a4
	ld b,a			;d9a5
	ld b,a			;d9a6
	ld b,a			;d9a7
	ld b,a			;d9a8
	ld b,a			;d9a9
	ld b,a			;d9aa
	ld b,a			;d9ab
	ld b,a			;d9ac
	ld b,a			;d9ad
	ld b,a			;d9ae
	ld b,a			;d9af
	ld b,a			;d9b0
	ld b,a			;d9b1
	ld b,a			;d9b2
	ld b,a			;d9b3
	ld b,a			;d9b4
	ld b,a			;d9b5
	ld b,a			;d9b6
	ld b,a			;d9b7
	ld b,a			;d9b8
	ld b,a			;d9b9
	ld b,a			;d9ba
	ld b,a			;d9bb
	ld b,a			;d9bc
	ld b,a			;d9bd
	ld b,a			;d9be
	ld b,a			;d9bf
	ld b,a			;d9c0
	ld b,a			;d9c1
	ld b,a			;d9c2
	ld b,a			;d9c3
	ld b,a			;d9c4
	ld b,a			;d9c5
	ld b,a			;d9c6
	ld b,a			;d9c7
	ld b,a			;d9c8
	ld b,a			;d9c9
	ld b,a			;d9ca
	ld b,a			;d9cb
	ld b,a			;d9cc
	ld b,a			;d9cd
	ld b,a			;d9ce
	ld b,a			;d9cf
	ld b,a			;d9d0
	ld b,a			;d9d1
	ld b,a			;d9d2
	ld b,a			;d9d3
	ld b,a			;d9d4
	ld b,a			;d9d5
	ld b,a			;d9d6
	ld b,a			;d9d7
	ld b,a			;d9d8
	ld b,a			;d9d9
	ld b,a			;d9da
	ld b,a			;d9db
	ld b,a			;d9dc
	ld b,a			;d9dd
	ld b,a			;d9de
	ld b,a			;d9df
	ld b,a			;d9e0
	ld b,a			;d9e1
	ld b,a			;d9e2
	ld b,a			;d9e3
	ld b,a			;d9e4
	ld b,a			;d9e5
	ld b,a			;d9e6
	ld b,a			;d9e7
	ld b,a			;d9e8
	ld b,a			;d9e9
	ld b,a			;d9ea
	ld b,a			;d9eb
	ld b,a			;d9ec
	ld b,a			;d9ed
	ld b,a			;d9ee
	ld b,a			;d9ef
	ld b,a			;d9f0
	ld b,a			;d9f1
	ld b,a			;d9f2
	ld b,a			;d9f3
	ld b,a			;d9f4
	ld b,a			;d9f5
	ld b,a			;d9f6
	ld b,a			;d9f7
	ld b,a			;d9f8
	ld b,a			;d9f9
	ld b,a			;d9fa
	ld b,a			;d9fb
	ld b,a			;d9fc
	ld b,a			;d9fd
	ld b,a			;d9fe
	ld b,a			;d9ff
	ld b,a			;da00
	ld b,a			;da01
	ld b,a			;da02
	ld b,a			;da03
	ld b,a			;da04
	ld b,a			;da05
	ld b,a			;da06
	ld b,a			;da07
	ld b,a			;da08
	ld b,a			;da09
	ld b,a			;da0a
	ld b,a			;da0b
	ld b,a			;da0c
	ld b,a			;da0d
	ld b,a			;da0e
	ld b,a			;da0f
	ld b,a			;da10
	ld b,a			;da11
	ld b,a			;da12
	ld b,a			;da13
	ld b,a			;da14
	ld b,a			;da15
	ld b,a			;da16
	ld b,a			;da17
	ld b,a			;da18
	ld b,a			;da19
	ld b,a			;da1a
	ld b,a			;da1b
	ld b,a			;da1c
	ld b,a			;da1d
	ld b,a			;da1e
	ld b,a			;da1f
	ld b,a			;da20
	ld b,a			;da21
	ld b,a			;da22
	ld b,a			;da23
	ld b,a			;da24
	ld b,a			;da25
	ld b,a			;da26
	ld b,a			;da27
	ld b,a			;da28
	ld b,a			;da29
	ld b,a			;da2a
	ld b,a			;da2b
	ld b,a			;da2c
	ld b,a			;da2d
	ld b,a			;da2e
	ld b,a			;da2f
	ld b,a			;da30
	ld b,a			;da31
	ld b,a			;da32
	ld b,a			;da33
	ld b,a			;da34
	ld b,a			;da35
	ld b,a			;da36
	ld b,a			;da37
	ld b,a			;da38
	ld b,a			;da39
	ld b,a			;da3a
	ld b,a			;da3b
	ld b,a			;da3c
	ld b,a			;da3d
	ld b,a			;da3e
	ld b,a			;da3f
	ld b,a			;da40
	ld b,a			;da41
	ld b,a			;da42
	ld b,a			;da43
	ld b,a			;da44
	ld b,a			;da45
	ld b,a			;da46
	ld b,a			;da47
	ld b,a			;da48
	ld b,a			;da49
	ld b,a			;da4a
	ld b,a			;da4b
	ld b,a			;da4c
	ld b,a			;da4d
	ld b,a			;da4e
	ld b,a			;da4f
	ld b,a			;da50
	ld b,a			;da51
	ld b,a			;da52
	ld b,a			;da53
	ld b,a			;da54
	ld b,a			;da55
	ld b,a			;da56
	ld b,a			;da57
	ld b,a			;da58
	ld b,a			;da59
	ld b,a			;da5a
	ld b,a			;da5b
	ld b,a			;da5c
	ld b,a			;da5d
	ld b,a			;da5e
lda5fh:
	ld b,a			;da5f
	ld b,a			;da60
	ld b,a			;da61
	ld b,a			;da62
	ld b,a			;da63
	ld b,a			;da64
	ld b,a			;da65
	ld b,a			;da66
	ld b,a			;da67
	ld b,a			;da68
	ld b,a			;da69
	ld b,a			;da6a
	ld b,a			;da6b
	ld b,a			;da6c
	ld b,a			;da6d
	ld b,a			;da6e
	ld b,a			;da6f
	ld b,a			;da70
	ld b,a			;da71
	ld b,a			;da72
	ld b,a			;da73
	ld b,a			;da74
	ld b,a			;da75
	ld b,a			;da76
	ld b,a			;da77
	ld b,a			;da78
	ld b,a			;da79
	ld b,a			;da7a
	ld b,a			;da7b
	ld b,a			;da7c
	ld b,a			;da7d
	ld b,a			;da7e
	ld b,a			;da7f
	ld b,a			;da80
	ld b,a			;da81
	ld b,a			;da82
	ld b,a			;da83
	ld b,a			;da84
	ld b,a			;da85
	ld b,a			;da86
	ld b,a			;da87
	ld b,a			;da88
	ld b,a			;da89
	ld b,a			;da8a
	ld b,a			;da8b
	ld b,a			;da8c
	ld b,a			;da8d
	ld b,a			;da8e
	ld b,a			;da8f
	ld b,a			;da90
	ld b,a			;da91
	ld b,a			;da92
	ld b,a			;da93
	ld b,a			;da94
	ld b,a			;da95
	ld b,a			;da96
	ld b,a			;da97
	ld b,a			;da98
	ld b,a			;da99
	ld b,a			;da9a
	ld b,a			;da9b
	ld b,a			;da9c
	ld b,a			;da9d
	ld b,a			;da9e
	ld b,a			;da9f
	ld b,(hl)		;daa0
	ld b,(hl)		;daa1
	ld b,(hl)		;daa2
	ld b,(hl)		;daa3
	ld b,(hl)		;daa4
	ld b,(hl)		;daa5
	ld b,(hl)		;daa6
	ld b,(hl)		;daa7
	ld b,(hl)		;daa8
	ld b,(hl)		;daa9
ldaaah:
	ld b,(hl)		;daaa
	ld b,(hl)		;daab
	ld b,(hl)		;daac
	ld b,(hl)		;daad
	ld b,(hl)		;daae
	ld b,(hl)		;daaf
	ld b,(hl)		;dab0
	ld b,(hl)		;dab1
	ld b,(hl)		;dab2
	ld b,(hl)		;dab3
	ld b,(hl)		;dab4
	ld b,(hl)		;dab5
	ld b,(hl)		;dab6
	ld b,(hl)		;dab7
	ld b,(hl)		;dab8
	ld b,(hl)		;dab9
	ld b,(hl)		;daba
	ld b,(hl)		;dabb
	ld b,(hl)		;dabc
	ld b,(hl)		;dabd
	ld b,(hl)		;dabe
	ld b,b			;dabf
	ld b,a			;dac0
	ld b,a			;dac1
	ld b,a			;dac2
	ld b,a			;dac3
	ld b,a			;dac4
	ld b,a			;dac5
	ld b,a			;dac6
	ld b,a			;dac7
	ld b,a			;dac8
	ld b,a			;dac9
	ld b,a			;daca
	ld b,a			;dacb
	ld b,a			;dacc
	ld b,a			;dacd
	ld b,a			;dace
	ld b,a			;dacf
	ld b,a			;dad0
	ld b,a			;dad1
	ld b,a			;dad2
	ld b,a			;dad3
	ld b,a			;dad4
	ld b,a			;dad5
	ld b,a			;dad6
	ld b,a			;dad7
	ld b,a			;dad8
	ld b,a			;dad9
ldadah:
	ld b,a			;dada
ldadbh:
	ld b,a			;dadb
	ld b,a			;dadc
	ld b,a			;dadd
	ld b,a			;dade
	ld b,a			;dadf
	ld b,a			;dae0
	ld b,a			;dae1
	ld b,a			;dae2
	ld b,a			;dae3
	ld b,a			;dae4
	ld b,a			;dae5
	ld b,a			;dae6
	ld b,a			;dae7
	ld b,a			;dae8
	ld b,a			;dae9
	ld b,a			;daea
	ld b,a			;daeb
	ld b,a			;daec
	ld b,a			;daed
	ld b,a			;daee
	ld b,a			;daef
	ld b,a			;daf0
	ld b,a			;daf1
ldaf2h:
	ld b,a			;daf2
	ld b,a			;daf3
	ld b,a			;daf4
	ld b,a			;daf5
	ld b,a			;daf6
	ld b,a			;daf7
	ld b,a			;daf8
	ld b,a			;daf9
	ld b,a			;dafa
	ld b,a			;dafb
	ld b,a			;dafc
	ld b,a			;dafd
	ld b,a			;dafe
	ld b,a			;daff
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
	nop			;db0f
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
	nop			;db22
	nop			;db23
	nop			;db24
	nop			;db25
	nop			;db26
	nop			;db27
	nop			;db28
	nop			;db29
	nop			;db2a
	nop			;db2b
	nop			;db2c
	nop			;db2d
	nop			;db2e
	nop			;db2f
	nop			;db30
	nop			;db31
	nop			;db32
	nop			;db33
	nop			;db34
	nop			;db35
	nop			;db36
	nop			;db37
	nop			;db38
	nop			;db39
	nop			;db3a
	nop			;db3b
	nop			;db3c
	nop			;db3d
	nop			;db3e
	nop			;db3f
	nop			;db40
	nop			;db41
	nop			;db42
	nop			;db43
	nop			;db44
	nop			;db45
	nop			;db46
	nop			;db47
	nop			;db48
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
	nop			;db6f
	nop			;db70
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
	nop			;db80
	nop			;db81
	nop			;db82
	nop			;db83
	nop			;db84
	nop			;db85
	nop			;db86
	nop			;db87
	nop			;db88
	nop			;db89
	nop			;db8a
	nop			;db8b
	nop			;db8c
	nop			;db8d
	nop			;db8e
	nop			;db8f
	nop			;db90
	nop			;db91
	nop			;db92
	nop			;db93
	nop			;db94
	nop			;db95
	nop			;db96
	nop			;db97
	nop			;db98
	nop			;db99
	nop			;db9a
	nop			;db9b
	nop			;db9c
	nop			;db9d
	nop			;db9e
	nop			;db9f
	nop			;dba0
	nop			;dba1
	nop			;dba2
	nop			;dba3
	nop			;dba4
	nop			;dba5
	nop			;dba6
	nop			;dba7
	nop			;dba8
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
	nop			;dbcd
	nop			;dbce
	nop			;dbcf
	nop			;dbd0
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
	nop			;dbdf
	nop			;dbe0
	nop			;dbe1
	nop			;dbe2
	nop			;dbe3
	nop			;dbe4
	nop			;dbe5
	nop			;dbe6
	nop			;dbe7
	nop			;dbe8
	nop			;dbe9
	nop			;dbea
	nop			;dbeb
	nop			;dbec
	nop			;dbed
	nop			;dbee
	nop			;dbef
	nop			;dbf0
	nop			;dbf1
	nop			;dbf2
	nop			;dbf3
	nop			;dbf4
	nop			;dbf5
	nop			;dbf6
ldbf7h:
	nop			;dbf7
	nop			;dbf8
	nop			;dbf9
	nop			;dbfa
	nop			;dbfb
	nop			;dbfc
	nop			;dbfd
	nop			;dbfe
	nop			;dbff
	rst 38h			;dc00
	nop			;dc01
	inc hl			;dc02
	dec c			;dc03
	rst 38h			;dc04
	nop			;dc05
	ld e,022h		;dc06
	dec c			;dc08
	inc hl			;dc09
	dec b			;dc0a
	nop			;dc0b
	nop			;dc0c
	nop			;dc0d
	djnz ldc25h		;dc0e
	ld bc,00600h		;dc10
	nop			;dc13
	dec bc			;dc14
	nop			;dc15
	ld bc,00100h		;dc16
	nop			;dc19
	ld b,000h		;dc1a
	djnz ldc1eh		;dc1c
ldc1eh:
	nop			;dc1e
	nop			;dc1f
	nop			;dc20
	nop			;dc21
	nop			;dc22
	nop			;dc23
	nop			;dc24
ldc25h:
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
	nop			;dc2f
	nop			;dc30
	nop			;dc31
	nop			;dc32
	nop			;dc33
	nop			;dc34
	nop			;dc35
	ld hl,(0405ch)		;dc36
	nop			;dc39
	rst 38h			;dc3a
	call z,sub_ee00h	;dc3b
	adc a,d			;dc3e
	nop			;dc3f
	nop			;dc40
	nop			;dc41
	nop			;dc42
	nop			;dc43
	rst 38h			;dc44
	ld a,(bc)		;dc45
	nop			;dc46
	ex af,af'		;dc47
	ld b,a			;dc48
	nop			;dc49
	nop			;dc4a
	dec d			;dc4b
ldc4ch:
	ld e,l			;dc4c
	nop			;dc4d
	nop			;dc4e
	or (hl)			;dc4f
	ld e,h			;dc50
	cp e			;dc51
	ld e,h			;dc52
	bit 3,h			;dc53
	dec d			;dc55
	ld e,l			;dc56
	jp z,0165ch		;dc57
	ld e,l			;dc5a
	add hl,de		;dc5b
	ld e,l			;dc5c
	inc d			;dc5d
	ld e,l			;dc5e
	ld c,(hl)		;dc5f
	ld e,l			;dc60
	dec de			;dc61
	ld e,l			;dc62
	dec de			;dc63
	ld e,l			;dc64
	dec de			;dc65
	ld e,l			;dc66
	dec l			;dc67
	sub d			;dc68
	ld e,h			;dc69
	nop			;dc6a
	ld (bc),a		;dc6b
	nop			;dc6c
	nop			;dc6d
	nop			;dc6e
	nop			;dc6f
	nop			;dc70
	nop			;dc71
	nop			;dc72
	nop			;dc73
	or (hl)			;dc74
	ld a,(de)		;dc75
	nop			;dc76
	nop			;dc77
	jr nz,$+9		;dc78
	nop			;dc7a
	ld e,b			;dc7b
	rst 38h			;dc7c
	ld e,c			;dc7d
	inc de			;dc7e
	ld hl,05b00h		;dc7f
	ld hl,lc017h		;dc82
	ld d,b			;dc85
	ret po			;dc86
	ld d,b			;dc87
	ld bc,02103h		;dc88
	rla			;dc8b
	ld bc,00047h		;dc8c
	ld b,a			;dc8f
	nop			;dc90
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
	nop			;dc9c
	nop			;dc9d
	nop			;dc9e
	nop			;dc9f
	nop			;dca0
	nop			;dca1
	nop			;dca2
	nop			;dca3
	nop			;dca4
	nop			;dca5
	nop			;dca6
	nop			;dca7
	nop			;dca8
	nop			;dca9
	nop			;dcaa
	nop			;dcab
	nop			;dcac
	nop			;dcad
	nop			;dcae
	nop			;dcaf
	nop			;dcb0
	nop			;dcb1
	pop af			;dcb2
	adc a,d			;dcb3
	rst 38h			;dcb4
	rst 38h			;dcb5
	call p,0a809h		;dcb6
	djnz $+77		;dcb9
	call p,sub_c409h	;dcbb
	dec d			;dcbe
	ld d,e			;dcbf
	add a,c			;dcc0
	rrca			;dcc1
	call nz,05215h		;dcc2
	call p,sub_c409h	;dcc5
	dec d			;dcc8
	ld d,b			;dcc9
	add a,b			;dcca
	nop			;dccb
	ld a,(bc)		;dccc
	ld b,(hl)		;dccd
	nop			;dcce
	rst 20h			;dccf
	jr nc,ldce0h		;dcd0
	nop			;dcd2
	nop			;dcd3
	nop			;dcd4
	nop			;dcd5
	nop			;dcd6
	ld a,(030dah)		;dcd7
	ld c,000h		;dcda
	nop			;dcdc
	nop			;dcdd
	nop			;dcde
	nop			;dcdf
ldce0h:
	ld a,(030d9h)		;dce0
	ld c,000h		;dce3
	nop			;dce5
	nop			;dce6
	nop			;dce7
	nop			;dce8
	ld a,(033fdh)		;dce9
	dec (hl)		;dcec
	dec (hl)		;dced
	ld (hl),039h		;dcee
	ld c,000h		;dcf0
	nop			;dcf2
	pop af			;dcf3
	adc a,d			;dcf4
	nop			;dcf5
	ld a,(022efh)		;dcf6
	ld (03aafh),hl		;dcf9
	exx			;dcfc
	scf			;dcfd
	ld c,000h		;dcfe
	nop			;dd00
	rlca			;dd01
	nop			;dd02
	nop			;dd03
	ld a,(03afbh)		;dd04
	ld sp,hl		;dd07
	ret nz			;dd08
ldd09h:
	ld (hl),033h		;dd09
	jr nc,ldd3dh		;dd0b
	jr nc,ldd1dh		;dd0d
	nop			;dd0f
	nop			;dd10
	jr ldd09h		;dd11
	nop			;dd13
	dec c			;dd14
ldd15h:
	add a,b			;dd15
	rst 28h			;dd16
	ld (00d22h),hl		;dd17
	add a,b			;dd1a
	nop			;dd1b
	nop			;dd1c
ldd1dh:
	jr ldd15h		;dd1d
	nop			;dd1f
	jr nz,ldd42h		;dd20
	jr nz,ldd44h		;dd22
	jr nz,$+34		;dd24
	nop			;dd26
	nop			;dd27
	nop			;dd28
	nop			;dd29
	nop			;dd2a
	nop			;dd2b
	nop			;dd2c
	nop			;dd2d
	nop			;dd2e
	nop			;dd2f
	nop			;dd30
	nop			;dd31
	nop			;dd32
	ld (hl),b		;dd33
	cp b			;dd34
	cp b			;dd35
	ld e,b			;dd36
	jr c,ldd39h		;dd37
ldd39h:
	ld c,000h		;dd39
	ld l,h			;dd3b
	ld l,h			;dd3c
ldd3dh:
	inc h			;dd3d
	nop			;dd3e
	nop			;dd3f
	nop			;dd40
	nop			;dd41
ldd42h:
	nop			;dd42
	ret po			;dd43
ldd44h:
	nop			;dd44
	jr c,ldd73h		;dd45
	ld l,036h		;dd47
	inc e			;dd49
	nop			;dd4a
	inc e			;dd4b
	nop			;dd4c
	inc e			;dd4d
	ld a,h			;dd4e
	ret po			;dd4f
	ret po			;dd50
	ld a,(hl)		;dd51
	nop			;dd52
	call m,00e0eh		;dd53
	ld a,h			;dd56
	ld (hl),b		;dd57
	nop			;dd58
	ld (hl),b		;dd59
	nop			;dd5a
	inc (hl)		;dd5b
	ex af,af'		;dd5c
	jp po,ldaf2h		;dd5d
	adc a,0c6h		;dd60
	ld h,b			;dd62
	ld h,b			;dd63
	add a,b			;dd64
	nop			;dd65
	nop			;dd66
	nop			;dd67
	nop			;dd68
	nop			;dd69
	nop			;dd6a
	jr c,$+114		;dd6b
	ld h,b			;dd6d
	ld h,b			;dd6e
	ld h,b			;dd6f
	ld (hl),b		;dd70
	jr c,ldd73h		;dd71
ldd73h:
	jr c,ldd91h		;dd73
	inc c			;dd75
	inc c			;dd76
	inc c			;dd77
	inc e			;dd78
	jr c,ldd7bh		;dd79
ldd7bh:
	sub d			;dd7b
	ld d,h			;dd7c
ldd7dh:
	jr c,ldd7dh		;dd7d
	jr c,lddd5h		;dd7f
	sub d			;dd81
	nop			;dd82
	jr c,$+58		;dd83
	xor 082h		;dd85
	xor 038h		;dd87
	jr c,ldd8bh		;dd89
ldd8bh:
	nop			;dd8b
	nop			;dd8c
	nop			;dd8d
	nop			;dd8e
	jr c,lddc9h		;dd8f
ldd91h:
	ld (hl),b		;dd91
	nop			;dd92
	nop			;dd93
	nop			;dd94
	cp 0feh			;dd95
	nop			;dd97
	nop			;dd98
	nop			;dd99
	nop			;dd9a
	nop			;dd9b
	nop			;dd9c
	nop			;dd9d
	nop			;dd9e
	nop			;dd9f
	jr $+26			;dda0
	nop			;dda2
	ld b,00ch		;dda3
	jr $+50			;dda5
	ld h,b			;dda7
	ret nz			;dda8
	add a,b			;dda9
	nop			;ddaa
	ld a,h			;ddab
	add a,0c6h		;ddac
	jp z,le2d2h		;ddae
	ld a,h			;ddb1
	nop			;ddb2
	inc e			;ddb3
	inc (hl)		;ddb4
	inc h			;ddb5
	inc b			;ddb6
	inc b			;ddb7
	inc b			;ddb8
	ld a,000h		;ddb9
	ld a,h			;ddbb
	and 0c6h		;ddbc
	inc c			;ddbe
	jr lde33h		;ddbf
	cp 000h			;ddc1
	ld a,h			;ddc3
	and 064h		;ddc4
	inc c			;ddc6
	ld b,0e6h		;ddc7
lddc9h:
	ld a,h			;ddc9
	nop			;ddca
	jr nc,lde31h		;ddcb
	call nz,00cfeh		;ddcd
	inc c			;ddd0
	inc c			;ddd1
	nop			;ddd2
	cp 0c0h			;ddd3
lddd5h:
	call m,00606h		;ddd5
	add a,07ch		;ddd8
	nop			;ddda
	ld a,(hl)		;dddb
	jp nz,lfce0h		;dddc
	jp nz,l7cc2h		;dddf
	nop			;dde2
	cp 0c2h			;dde3
	ld b,03eh		;dde5
	jr lde19h		;dde7
	jr nc,lddebh		;dde9
lddebh:
	ld a,h			;ddeb
	jp nz,lc27ch		;ddec
	jp nz,l7cc2h		;ddef
	nop			;ddf2
	ld a,h			;ddf3
	jp nz,07ec2h		;ddf4
	ld (bc),a		;ddf7
	jp nz,0007ch		;ddf8
	nop			;ddfb
	jr nc,lde2eh		;ddfc
	nop			;ddfe
	jr nc,lde31h		;ddff
	nop			;de01
lde02h:
	nop			;de02
	nop			;de03
	nop			;de04
	nop			;de05
	jr nc,lde08h		;de06
lde08h:
	jr nc,lde6ah		;de08
	nop			;de0a
	ld c,038h		;de0b
	ld h,b			;de0d
	ret nz			;de0e
	ld h,b			;de0f
	jr c,lde20h		;de10
	nop			;de12
	nop			;de13
	cp 0feh			;de14
	nop			;de16
	cp 000h			;de17
lde19h:
	nop			;de19
	nop			;de1a
	ret po			;de1b
	jr c,lde2ah		;de1c
	ld b,00ch		;de1e
lde20h:
	jr c,lde02h		;de20
	nop			;de22
	jr nc,lde6dh		;de23
	jr nc,lde27h		;de25
lde27h:
	ld a,b			;de27
	nop			;de28
	nop			;de29
lde2ah:
	nop			;de2a
	ld a,h			;de2b
	cp 092h			;de2c
lde2eh:
	cp 07ch			;de2e
	ld b,h			;de30
lde31h:
	jr c,lde33h		;de31
lde33h:
	ld a,h			;de33
	jp nz,lfee2h		;de34
	sbc a,0c2h		;de37
	jp nz,0fc00h		;de39
	jp nz,lc6fch		;de3c
	jp po,lfcfeh		;de3f
	nop			;de42
	ld a,(hl)		;de43
	jp po,lc0c0h		;de44
	jp nz,03c7eh		;de47
	nop			;de4a
	ret m			;de4b
	call nz,sub_c2c2h	;de4c
	call nz,sub_f8fch	;de4f
	nop			;de52
	cp 0c0h			;de53
	call m,lc0c0h		;de55
	cp 0feh			;de58
	nop			;de5a
	cp 0e0h			;de5b
	call m,sub_c0fch	;de5d
	ret nz			;de60
	ret nz			;de61
	nop			;de62
	ld a,h			;de63
	jp nz,lcec0h		;de64
	jp nz,l7cfch		;de67
lde6ah:
	nop			;de6a
	add a,0c2h		;de6b
lde6dh:
	cp 0c2h			;de6d
	jp nz,sub_c2c2h		;de6f
	nop			;de72
	cp 0feh			;de73
	jr lde8fh		;de75
lde77h:
	jr lde77h		;de77
	cp 000h			;de79
	ld (bc),a		;de7b
	ld (bc),a		;de7c
	ld (bc),a		;de7d
	jp nz,lfec2h		;de7e
	ld a,h			;de81
	nop			;de82
	call nz,0f0c8h		;de83
	ret m			;de86
	call z,sub_c6c6h	;de87
	nop			;de8a
	ret nz			;de8b
	ret nz			;de8c
	ret nz			;de8d
	ret nz			;de8e
lde8fh:
	add a,0feh		;de8f
lde91h:
	cp 000h			;de91
	jp nz,lfee6h		;de93
	cp 0dah			;de96
	jp nz,000c2h		;de98
	jp nz,lf2e2h		;de9b
	jp c,lc6ceh		;de9e
	add a,000h		;dea1
	ld a,h			;dea3
	and 0c2h		;dea4
	jp nz,lfee6h		;dea6
	ld a,h			;dea9
	nop			;deaa
	call m,sub_c2c2h	;deab
	call m,lc0c0h		;deae
	ret nz			;deb1
	nop			;deb2
	ld a,h			;deb3
	jp nz,ld2c2h		;deb4
	jp z,l7cfeh		;deb7
	nop			;deba
	call m,sub_c2c2h	;debb
	call m,lc6fch		;debe
	jp nz,l7c00h		;dec1
	ret nz			;dec4
	ld a,h			;dec5
	ld b,0c2h		;dec6
	cp 07ch			;dec8
	nop			;deca
	cp 0fch			;decb
	jr nc,$+50		;decd
	jr nc,ldf01h		;decf
	jr nc,lded3h		;ded1
lded3h:
	jp nz,sub_c2c2h		;ded3
	jp nz,lfee2h		;ded6
	ld a,h			;ded9
	nop			;deda
	jp nz,sub_c2c2h		;dedb
	jp nz,064c2h		;dede
	jr c,ldee3h		;dee1
ldee3h:
	jp nz,sub_c2c2h		;dee3
	jp nz,ldadah		;dee6
	ld (hl),h		;dee9
	nop			;deea
	jp nz,l7ce6h		;deeb
	jr c,ldf6ch		;deee
	and 0c2h		;def0
	nop			;def2
	jp nz,l78e4h		;def3
	jr nc,ldf28h		;def6
	jr nc,$+50		;def8
	nop			;defa
sub_defbh:
	cp 0feh			;defb
	inc e			;defd
	jr c,ldf70h		;defe
	ret po			;df00
ldf01h:
	cp 000h			;df01
	ld a,(hl)		;df03
	sbc a,c			;df04
	and l			;df05
	and c			;df06
	and l			;df07
	sbc a,c			;df08
	ld a,(hl)		;df09
	nop			;df0a
	ld bc,00503h		;df0b
	dec c			;df0e
	rra			;df0f
	cpl			;df10
	ld a,a			;df11
	nop			;df12
	ld d,a			;df13
	ld a,a			;df14
	ld a,a			;df15
	ld a,b			;df16
	ld a,c			;df17
	ld e,d			;df18
	ld a,h			;df19
	nop			;df1a
	ret pe			;df1b
	ret pe			;df1c
	call p,sub_74fch	;df1d
	ld a,d			;df20
	cp (hl)			;df21
	rst 38h			;df22
	rst 30h			;df23
	cp a			;df24
	rst 38h			;df25
	rst 38h			;df26
	rst 18h			;df27
ldf28h:
	defb 0fdh,0ffh,058h ;illegal sequence	;df28
	ld a,c			;df2b
	ld a,b			;df2c
	ld e,b			;df2d
	ld a,c			;df2e
	ld a,b			;df2f
	ld a,c			;df30
	ld l,b			;df31
	cp d			;df32
	ld e,l			;df33
	ld e,a			;df34
	dec e			;df35
	ld e,a			;df36
	ld h,e			;df37
	dec de			;df38
	ld a,05fh		;df39
	ccf			;df3b
	rla			;df3c
	rlca			;df3d
	rlca			;df3e
	inc bc			;df3f
	ld bc,05c00h		;df40
	ld a,d			;df43
	ld a,c			;df44
	ld a,b			;df45
	ld e,a			;df46
	ld e,a			;df47
	ld l,e			;df48
	rst 38h			;df49
	cp d			;df4a
	ld a,(hl)		;df4b
	ld a,l			;df4c
	push af			;df4d
	ex de,hl		;df4e
	ex de,hl		;df4f
	or a			;df50
	pop af			;df51
	nop			;df52
	rlca			;df53
	cpl			;df54
	ld a,l			;df55
	ld a,a			;df56
	ld a,(hl)		;df57
	ld e,l			;df58
	ld a,e			;df59
	ret c			;df5a
	call pe,0bfd6h		;df5b
	ld a,l			;df5e
	cp 067h			;df5f
	jp 00701h		;df61
	dec de			;df64
	ld a,a			;df65
	or a			;df66
	defb 0ddh,0afh,0f7h ;illegal sequence	;df67
	push af			;df6a
	rst 28h			;df6b
ldf6ch:
	rst 18h			;df6c
	xor (hl)		;df6d
	cp a			;df6e
	or (hl)			;df6f
ldf70h:
	cp (hl)			;df70
	ld a,h			;df71
	add a,c			;df72
	rst 38h			;df73
	add a,b			;df74
	ld l,(hl)		;df75
	ld a,a			;df76
	ld a,e			;df77
	rrca			;df78
	ld bc,lfdebh		;df79
	jp m,l7fdfh		;df7c
	cp l			;df7f
	rst 18h			;df80
	sbc a,e			;df81
ldf82h:
	ld l,a			;df82
	ld a,(hl)		;df83
	ld a,a			;df84
	ld (hl),a		;df85
	ld a,a			;df86
	ld a,h			;df87
	ld l,h			;df88
	ld a,h			;df89
	di			;df8a
	defb 0ddh,0feh,0feh ;illegal sequence	;df8b
	defb 0fdh,06fh ;ld iyl,a	;df8e
	ccf			;df90
	ccf			;df91
	ld a,h			;df92
	ld e,a			;df93
	ld a,e			;df94
	ld a,a			;df95
	ld a,b			;df96
	ld a,e			;df97
	ld a,c			;df98
	ld (hl),b		;df99
	rra			;df9a
	or 0bdh			;df9b
	defb 0fdh,03ah,0dfh ;illegal sequence	;df9d
	defb 0ddh,06fh ;ld ixl,a	;dfa0
	nop			;dfa2
	ld bc,00503h		;dfa3
	rrca			;dfa6
	rra			;dfa7
	ld a,047h		;dfa8
	ret m			;dfaa
	ld l,c			;dfab
	ld e,d			;dfac
	ld a,e			;dfad
	ld a,d			;dfae
	ld e,c			;dfaf
	ld a,e			;dfb0
	ld a,(hl)		;dfb1
	ld l,a			;dfb2
	out (0afh),a		;dfb3
	ld a,a			;dfb5
	cp 0b4h			;dfb6
	ret m			;dfb8
	ret p			;dfb9
	ld a,a			;dfba
	ld e,a			;dfbb
	ld a,a			;dfbc
	ld a,l			;dfbd
	ld l,a			;dfbe
	ld l,a			;dfbf
	ld a,a			;dfc0
	ld a,a			;dfc1
	ld h,b			;dfc2
	ret nz			;dfc3
	add a,b			;dfc4
	nop			;dfc5
	nop			;dfc6
	add a,b			;dfc7
	ret nz			;dfc8
	and b			;dfc9
	ld a,a			;dfca
	ld e,e			;dfcb
	ld a,c			;dfcc
	ld a,d			;dfcd
	add hl,sp		;dfce
	ld a,e			;dfcf
	ld l,c			;dfd0
	ret m			;dfd1
	ret p			;dfd2
	ret pe			;dfd3
	call p,sub_7ffeh	;dfd4
	xor l			;dfd7
	rst 18h			;dfd8
	ld l,a			;dfd9
ldfdah:
	ld e,021h		;dfda
	ld hl,00c10h		;dfdc
	add a,d			;dfdf
	ld b,d			;dfe0
	ld a,h			;dfe1
	jr nc,le00dh		;dfe2
	ld c,c			;dfe4
	ld c,d			;dfe5
	jp m,l8a8ah		;dfe6
	adc a,c			;dfe9
ldfeah:
	pop hl			;dfea
	ld de,00212h		;dfeb
	rlca			;dfee
	ld (hl),h		;dfef
	inc d			;dff0
	call po,04080h		;dff1
	ld b,b			;dff4
	ld b,b			;dff5
	ret nz			;dff6
	ld b,b			;dff7
	ld b,b			;dff8
	ld b,b			;dff9
	jr nc,le044h		;dffa
	ld d,b			;dffc
	add a,c			;dffd
	add a,e			;dffe
	add a,l			;dfff
sub_e000h:
	sub a			;e000
	xor l			;e001
	add a,a			;e002
	push bc			;e003
	ld h,a			;e004
	ld h,l			;e005
	ld (hl),b		;e006
	ld a,a			;e007
	ccf			;e008
	inc bc			;e009
	ld bc,0ff1fh		;e00a
le00dh:
	nop			;e00d
	nop			;e00e
	nop			;e00f
	inc b			;e010
	call m,00004h		;e011
	nop			;e014
	ld b,009h		;e015
	dec b			;e017
	pop bc			;e018
	cp 030h			;e019
	ld l,b			;e01b
	ld h,b			;e01c
	ld (hl),c		;e01d
	dec sp			;e01e
	dec e			;e01f
le020h:
	dec hl			;e020
	ld e,00eh		;e021
	inc bc			;e023
le024h:
	ld bc,00200h		;e024
	dec b			;e027
	inc b			;e028
	inc bc			;e029
	jr c,le070h		;e02a
	jp nz,l844ah		;e02c
	nop			;e02f
	nop			;e030
	nop			;e031
	nop			;e032
	nop			;e033
	add a,b			;e034
	ret nz			;e035
	ld h,b			;e036
	ld (hl),b		;e037
	ld (hl),b		;e038
	ret po			;e039
	ex af,af'		;e03a
	ld de,06532h		;e03b
	ld h,l			;e03e
	defb 0edh ;next byte illegal after ed	;e03f
	push hl			;e040
	defb 0edh ;next byte illegal after ed	;e041
	push hl			;e042
	defb 0edh ;next byte illegal after ed	;e043
le044h:
	push hl			;e044
	ex de,hl		;e045
	call po,sub_7060h	;e046
	ld a,a			;e049
	ld b,d			;e04a
	and c			;e04b
	ld (de),a		;e04c
	inc c			;e04d
	nop			;e04e
	nop			;e04f
	nop			;e050
	nop			;e051
	ld (bc),a		;e052
	ld bc,00301h		;e053
	inc bc			;e056
	ld c,03ch		;e057
	ret p			;e059
	inc bc			;e05a
	rlca			;e05b
	ld b,012h		;e05c
	ld (de),a		;e05e
	add hl,de		;e05f
	inc c			;e060
	ld c,00fh		;e061
	inc de			;e063
	ex af,af'		;e064
	ld h,c			;e065
	call c,sub_9fefh	;e066
	ld c,a			;e069
	jp 031e3h		;e06a
	ld a,(0141ah)		;e06d
le070h:
	add a,h			;e070
	ld c,b			;e071
	jr nz,le024h		;e072
	sbc a,b			;e074
	inc a			;e075
	cp 0feh			;e076
le078h:
	cp 0f8h			;e078
	ld e,01dh		;e07a
	jr $+26			;e07c
	add hl,sp		;e07e
sub_e07fh:
	ld c,b			;e07f
	nop			;e080
	nop			;e081
	ld bc,00000h		;e082
	nop			;e085
	ld h,c			;e086
	sub b			;e087
	sub b			;e088
	ld c,a			;e089
	ld h,a			;e08a
	ld l,e			;e08b
	ld h,b			;e08c
	ld (bc),a		;e08d
	push af			;e08e
	push de			;e08f
	inc h			;e090
le091h:
	call nc,sub_d454h	;e091
	inc h			;e094
	call nc,0e454h		;e095
	ex af,af'		;e098
	ret p			;e099
	ld a,h			;e09a
	add a,e			;e09b
	sub b			;e09c
	ld h,e			;e09d
	nop			;e09e
	nop			;e09f
	nop			;e0a0
	ld bc,00502h		;e0a1
	djnz $+42		;e0a4
	ld hl,l9e70h		;e0a6
	ld c,a			;e0a9
	ld c,0fdh		;e0aa
	rrca			;e0ac
	ld h,(hl)		;e0ad
	cp b			;e0ae
	jp m,l6cb5h		;e0af
	xor b			;e0b2
	ld l,h			;e0b3
	xor h			;e0b4
	ret pe			;e0b5
	inc l			;e0b6
	call z,sub_f018h	;e0b7
	ld hl,05d2ah		;e0ba
	dec h			;e0bd
	ld (05c36h),hl		;e0be
	ret			;e0c1
	ld hl,l6019h+1		;e0c2
	dec h			;e0c5
	ld (05c36h),hl		;e0c6
	ret			;e0c9
	ld hl,l60d1h		;e0ca
sub_e0cdh:
	call 0611dh		;e0cd
	ret			;e0d0
	djnz le0dah		;e0d1
	inc de			;e0d3
	ld bc,00216h		;e0d4
	ld a,(bc)		;e0d7
	ld e,h			;e0d8
	inc de			;e0d9
le0dah:
	nop			;e0da
	ld e,l			;e0db
	ld e,(hl)		;e0dc
	ld d,003h		;e0dd
	ld a,(bc)		;e0df
	inc de			;e0e0
	ld bc,0135fh		;e0e1
	nop			;e0e4
	ld h,b			;e0e5
	ld h,c			;e0e6
	inc de			;e0e7
	ld bc,00416h		;e0e8
	ld a,(bc)		;e0eb
	inc de			;e0ec
	ld bc,01362h		;e0ed
	nop			;e0f0
	ld h,e			;e0f1
	ld h,h			;e0f2
le0f3h:
	ld d,003h		;e0f3
	dec c			;e0f5
	ld h,l			;e0f6
	ld h,(hl)		;e0f7
	ld h,a			;e0f8
	ld l,e			;e0f9
	ld l,h			;e0fa
	ld (hl),d		;e0fb
	ld (hl),e		;e0fc
	ld d,004h		;e0fd
	dec c			;e0ff
	ld l,b			;e100
	ld l,c			;e101
	ld l,d			;e102
	ld l,l			;e103
	ld l,(hl)		;e104
	ld (hl),h		;e105
	ld (hl),l		;e106
	ld d,002h		;e107
	ld de,00113h		;e109
	ld l,a			;e10c
	inc de			;e10d
	nop			;e10e
	ld (hl),b		;e10f
	ld (hl),c		;e110
	djnz le117h		;e111
	inc de			;e113
	ld bc,00116h		;e114
le117h:
	dec bc			;e117
	halt			;e118
	ld (hl),a		;e119
	ld a,b			;e11a
	ld a,c			;e11b
	rst 38h			;e11c
	ld a,002h		;e11d
	push hl			;e11f
	call 01601h		;e120
	pop hl			;e123
le124h:
	ld a,(hl)		;e124
	cp 0ffh			;e125
	ret z			;e127
	rst 10h			;e128
	inc hl			;e129
	jr le124h		;e12a
	ld a,000h		;e12c
	ld (05c91h),a		;e12e
	push bc			;e131
	call 022dfh		;e132
	pop bc			;e135
	inc b			;e136
	ld a,00ch		;e137
	ld (05c91h),a		;e139
	push bc			;e13c
	call 022dfh		;e13d
	pop bc			;e140
	dec b			;e141
	dec b			;e142
	ld a,b			;e143
	cp 008h			;e144
	jr z,le149h		;e146
	ret			;e148
le149h:
	inc b			;e149
	ld a,00ch		;e14a
	ld (05c91h),a		;e14c
	call 022dfh		;e14f
	ld b,085h		;e152
	ret			;e154
	ld a,(06220h)		;e155
	ld b,a			;e158
	ld a,(l6226h)		;e159
	inc a			;e15c
	cp 032h			;e15d
	jr z,le165h		;e15f
	ld (l6226h),a		;e161
	ret			;e164
le165h:
	ld c,084h		;e165
	call sub_612ch		;e167
	ld a,b			;e16a
	ld (06220h),a		;e16b
	ret			;e16e
	ld a,b			;e16f
	ld a,(l6223h)		;e170
	ld b,a			;e173
	ld a,(l6227h)		;e174
	inc a			;e177
	cp 05ah			;e178
	jr z,le180h		;e17a
	ld (l6227h),a		;e17c
	ret			;e17f
le180h:
	ld c,062h		;e180
	call sub_612ch		;e182
	ld a,b			;e185
	ld (l6223h),a		;e186
	ret			;e189
	ld a,(l6222h)		;e18a
	ld b,a			;e18d
	ld c,085h		;e18e
	call sub_612ch		;e190
	ld a,b			;e193
	ld (l6222h),a		;e194
	ret			;e197
	ld a,(06221h)		;e198
	ld b,a			;e19b
	ld a,(l6228h)		;e19c
	inc a			;e19f
	cp 04bh			;e1a0
	jr z,le1a8h		;e1a2
	ld (l6228h),a		;e1a4
	ret			;e1a7
le1a8h:
	ld c,084h		;e1a8
	call sub_612ch		;e1aa
	ld a,b			;e1ad
	ld (06221h),a		;e1ae
	ret			;e1b1
	ld a,(l6224h)		;e1b2
	ld b,a			;e1b5
	ld c,094h		;e1b6
	call sub_612ch		;e1b8
	ld a,b			;e1bb
	ld (l6224h),a		;e1bc
	ret			;e1bf
	ld a,(l6225h)		;e1c0
	ld b,a			;e1c3
	ld c,059h		;e1c4
	call sub_612ch		;e1c6
	ld a,b			;e1c9
	ld (l6225h),a		;e1ca
	ret			;e1cd
	push af			;e1ce
	push hl			;e1cf
	push de			;e1d0
	push bc			;e1d1
	call sub_6155h		;e1d2
	call sub_6155h		;e1d5
	call sub_6155h		;e1d8
	call sub_6170h		;e1db
	call sub_6170h		;e1de
	call sub_6170h		;e1e1
	call sub_618ah		;e1e4
	call sub_618ah		;e1e7
	call sub_6198h		;e1ea
	call sub_6198h		;e1ed
	call sub_6198h		;e1f0
	call sub_6198h		;e1f3
	call 061b2h		;e1f6
	call 061b2h		;e1f9
	call 061b2h		;e1fc
le1ffh:
	call 061b2h		;e1ff
	call 061b2h		;e202
	call 061b2h		;e205
	call sub_61c0h		;e208
	call sub_61c0h		;e20b
	call sub_61c0h		;e20e
	call sub_61c0h		;e211
	ld a,000h		;e214
	ld (05c91h),a		;e216
	pop bc			;e219
	pop de			;e21a
le21bh:
	pop hl			;e21b
	pop af			;e21c
	jp 00038h		;e21d
	ccf			;e220
	ld e,e			;e221
sub_e222h:
	dec bc			;e222
	ld h,a			;e223
	rla			;e224
	ld de,05931h		;e225
	ld c,d			;e228
	ld d,b			;e229
	ld d,l			;e22a
	ld c,h			;e22b
	ld d,e			;e22c
	ld b,l			;e22d
	jr nz,le250h		;e22e
	ld d,l			;e230
	ld c,(hl)		;e231
	ld b,c			;e232
	jr nz,$+34		;e233
	ld d,h			;e235
	ld b,l			;e236
	ld b,e			;e237
	ld c,h			;e238
	ld b,c			;e239
	jr nz,$+34		;e23a
	jr nz,$+34		;e23c
	jr nz,le260h		;e23e
	jr nz,le262h		;e240
	jr nz,$+1		;e242
	ld a,002h		;e244
	push hl			;e246
	call 01601h		;e247
	pop hl			;e24a
le24bh:
	ld a,(hl)		;e24b
	cp 0ffh			;e24c
	ret z			;e24e
	inc hl			;e24f
le250h:
	push hl			;e250
	rst 10h			;e251
	pop hl			;e252
	push hl			;e253
	ld hl,00001h		;e254
	ld de,0000ah		;e257
	call 003b5h		;e25a
	ld b,003h		;e25d
le25fh:
	halt			;e25f
le260h:
	djnz le25fh		;e260
le262h:
	pop hl			;e262
	jr le24bh		;e263
	ld b,008h		;e265
	ld a,0ffh		;e267
	ld (lff2fh),a		;e269
le26ch:
	ld a,(lff2fh)		;e26c
	inc a			;e26f
	ld (lff2fh),a		;e270
	push bc			;e273
	call sub_ff14h		;e274
	ld b,00ah		;e277
le279h:
	halt			;e279
	djnz le279h		;e27a
	pop bc			;e27c
	djnz le26ch		;e27d
	ret			;e27f
	ld a,008h		;e280
	ld (l6268h),a		;e282
	ld a,03dh		;e285
	ld (l626fh),a		;e287
	call sub_6265h		;e28a
	ld a,0ffh		;e28d
	ld (l6268h),a		;e28f
	ld a,03ch		;e292
	ld (l626fh),a		;e294
	ret			;e297
	ld hl,05c3bh		;e298
	res 5,(hl)		;e29b
le29dh:
	ld hl,05c3bh		;e29d
	bit 5,(hl)		;e2a0
	jr nz,le2bbh		;e2a2
	ld a,(l643eh)		;e2a4
	dec a			;e2a7
	cp 000h			;e2a8
	jr z,le2bbh		;e2aa
	ld a,(l643dh)		;e2ac
	dec a			;e2af
	ld (l643dh),a		;e2b0
	cp 000h			;e2b3
	call z,l6415h		;e2b5
	halt			;e2b8
	jr le29dh		;e2b9
le2bbh:
	call sub_6280h		;e2bb
	ld b,028h		;e2be
le2c0h:
	halt			;e2c0
	djnz le2c0h		;e2c1
le2c3h:
	call sub_638ch		;e2c3
	call lff07h+1		;e2c6
	call sub_6280h		;e2c9
	call sub_638ch		;e2cc
	ld hl,06324h		;e2cf
le2d2h:
	call 0611dh		;e2d2
	ld hl,06337h		;e2d5
	call 06244h		;e2d8
	ld b,064h		;e2db
le2ddh:
	halt			;e2dd
	djnz le2ddh		;e2de
	call sub_6280h		;e2e0
	call sub_638ch		;e2e3
	call sub_6440h		;e2e6
	call sub_638ch		;e2e9
	call sub_68a7h		;e2ec
	ld hl,l6303h		;e2ef
	call 06244h		;e2f2
	ld b,032h		;e2f5
le2f7h:
	halt			;e2f7
	djnz le2f7h		;e2f8
	call sub_6280h		;e2fa
	call sub_638ch		;e2fd
	jp 06913h		;e300
	ld d,00bh		;e303
	dec b			;e305
	djnz le30fh		;e306
	ld de,02000h		;e308
	ld c,h			;e30b
	ld b,c			;e30c
	jr nz,le357h		;e30d
le30fh:
	ld c,c			;e30f
	ld d,e			;e310
	ld d,h			;e311
	ld c,a			;e312
	ld d,d			;e313
	ld c,c			;e314
	ld b,c			;e315
	jr nz,le35bh		;e316
	ld c,a			;e318
	ld c,l			;e319
	ld c,c			;e31a
	ld b,l			;e31b
	ld c,(hl)		;e31c
	ld e,d			;e31d
	ld b,c			;e31e
	jr nz,le34fh		;e31f
	ld l,02eh		;e321
	rst 38h			;e323
	ld de,01001h		;e324
	dec b			;e327
	inc de			;e328
	nop			;e329
	ld d,009h		;e32a
	inc b			;e32c
	ld a,d			;e32d
	ld a,h			;e32e
	inc de			;e32f
	ld bc,00a16h		;e330
	inc b			;e333
	ld a,e			;e334
	ld a,l			;e335
	rst 38h			;e336
	ld d,00ah		;e337
	ld b,010h		;e339
	rlca			;e33b
	ld de,05300h		;e33c
	ld d,h			;e33f
	ld b,c			;e340
	ld d,e			;e341
	jr nz,le397h		;e342
	ld c,a			;e344
	ld c,(hl)		;e345
	jr nz,le394h		;e346
	ld b,c			;e348
	ld d,e			;e349
	jr nz,le39ch		;e34a
	ld b,l			;e34c
	ld d,d			;e34d
	ld d,e			;e34e
le34fh:
	ld c,a			;e34f
	ld c,(hl)		;e350
	ld b,c			;e351
	ld d,e			;e352
	ld d,00ch		;e353
	inc bc			;e355
	ld d,c			;e356
le357h:
	ld d,l			;e357
	ld b,l			;e358
	jr nz,le3a3h		;e359
le35bh:
	ld b,c			;e35b
	ld c,(hl)		;e35c
	jr nz,$+74		;e35d
	ld b,l			;e35f
	ld b,e			;e360
	ld c,b			;e361
	ld c,a			;e362
	jr nz,$+82		;e363
	ld c,a			;e365
	ld d,e			;e366
	ld c,c			;e367
	ld b,d			;e368
	ld c,h			;e369
	ld b,l			;e36a
	jr nz,$+83		;e36b
	ld d,l			;e36d
	ld b,l			;e36e
	ld d,00eh		;e36f
	inc bc			;e371
	ld d,b			;e372
	ld d,l			;e373
	ld b,l			;e374
	ld b,h			;e375
	ld b,c			;e376
	ld d,e			;e377
	jr nz,le3cah		;e378
	ld b,c			;e37a
	ld d,e			;e37b
	ld b,c			;e37c
	ld d,d			;e37d
	jr nz,le3d5h		;e37e
	ld c,(hl)		;e380
	jr nz,le3c5h		;e381
	ld d,l			;e383
	ld b,l			;e384
	ld c,(hl)		;e385
	jr nz,le3dah		;e386
	ld b,c			;e388
	ld d,h			;e389
	ld c,a			;e38a
	rst 38h			;e38b
	ld b,020h		;e38c
	ld hl,04000h		;e38e
le391h:
	ld a,(hl)		;e391
	cp 000h			;e392
le394h:
	jr nz,le3b4h		;e394
	inc hl			;e396
le397h:
	djnz le391h		;e397
	ld hl,057e0h		;e399
le39ch:
	ld b,020h		;e39c
le39eh:
	ld a,(hl)		;e39e
	cp 000h			;e39f
	jr nz,le3b4h		;e3a1
le3a3h:
	inc hl			;e3a3
	djnz le39eh		;e3a4
	ld a,047h		;e3a6
	ld (05c48h),a		;e3a8
	ld a,047h		;e3ab
	ld (05c8dh),a		;e3ad
	call 00d6bh		;e3b0
	ret			;e3b3
le3b4h:
	call lff07h+1		;e3b4
	call 00d6bh		;e3b7
	ld hl,l63c8h		;e3ba
	call 06244h		;e3bd
	ld b,0ffh		;e3c0
le3c2h:
	halt			;e3c2
	djnz le3c2h		;e3c3
le3c5h:
	call 00000h		;e3c5
	ld d,00ah		;e3c8
le3cah:
	ld bc,00210h		;e3ca
	inc de			;e3cd
	ld bc,04f50h		;e3ce
	ld d,d			;e3d1
	jr nz,$+86		;e3d2
	ld d,d			;e3d4
le3d5h:
	ld b,c			;e3d5
	ld c,(hl)		;e3d6
	ld d,e			;e3d7
	ld b,(hl)		;e3d8
	ld b,l			;e3d9
le3dah:
	ld d,d			;e3da
	inc l			;e3db
	jr nz,le42fh		;e3dc
	ld d,l			;e3de
	ld b,l			;e3df
	ld d,d			;e3e0
	ld b,l			;e3e1
	ld d,d			;e3e2
	jr nz,le43ah		;e3e3
	ld d,h			;e3e5
	ld c,c			;e3e6
	ld c,h			;e3e7
	ld c,c			;e3e8
	ld e,d			;e3e9
	ld b,c			;e3ea
	ld d,d			;e3eb
	ld d,00ch		;e3ec
	inc bc			;e3ee
	ld d,e			;e3ef
	ld c,c			;e3f0
	ld c,(hl)		;e3f1
	jr nz,le43eh		;e3f2
	ld d,l			;e3f4
	ld b,a			;e3f5
	ld b,c			;e3f6
	ld d,d			;e3f7
	jr nz,$+86		;e3f8
	ld b,l			;e3fa
	jr nz,$+88		;e3fb
	ld b,c			;e3fd
	ld d,e			;e3fe
le3ffh:
	jr nz,le442h		;e3ff
	jr nz,$+83		;e401
	ld d,l			;e403
	ld b,l			;e404
	ld b,h			;e405
	ld b,c			;e406
	ld d,d			;e407
	rst 38h			;e408
	ld hl,05c3bh		;e409
	res 5,(hl)		;e40c
	ld bc,00000h		;e40e
	call 01f3dh		;e411
	ret			;e414
	ld a,019h		;e415
	ld (l643dh),a		;e417
	ld a,(l643eh)		;e41a
	dec a			;e41d
	cp 000h			;e41e
	call nz,sub_6424h	;e420
	ret			;e423
	ld (l643eh),a		;e424
	ld a,(l643fh)		;e427
	dec a			;e42a
	ld (l643fh),a		;e42b
	ld b,a			;e42e
le42fh:
	ld c,050h		;e42f
	call 022aah		;e431
	ld b,00ah		;e434
le436h:
	ld a,000h		;e436
	ld (hl),a		;e438
	inc hl			;e439
le43ah:
	djnz le436h		;e43a
	ret			;e43c
	inc a			;e43d
le43eh:
	ld hl,021a8h		;e43e
	sbc a,a			;e441
le442h:
	ld h,l			;e442
	call sub_64c5h		;e443
	ld hl,l65ffh		;e446
	call sub_64c5h		;e449
	call sub_6873h		;e44c
	ld hl,l67b8h		;e44f
	call 06244h		;e452
	ld hl,l653fh		;e455
	call sub_64c5h		;e458
	ld hl,l6779h		;e45b
	call 0611dh		;e45e
	call sub_6880h		;e461
	ld hl,l67dfh		;e464
	call 06244h		;e467
	ld hl,l66bfh		;e46a
	call sub_64c5h		;e46d
	ld hl,l6779h		;e470
	call 0611dh		;e473
	call sub_6880h		;e476
	ld hl,l6801h		;e479
	call 06244h		;e47c
	ld hl,l665fh		;e47f
	call sub_64c5h		;e482
	ld hl,l6779h		;e485
	call 0611dh		;e488
	call sub_688dh		;e48b
	ld hl,l6828h		;e48e
	call 06244h		;e491
	ld b,030h		;e494
le496h:
	push bc			;e496
	call sub_671fh		;e497
	pop bc			;e49a
	djnz le496h		;e49b
	ld hl,l6779h		;e49d
	call 0611dh		;e4a0
	call sub_689ah		;e4a3
	ld hl,06853h		;e4a6
	call 06244h		;e4a9
	ld b,030h		;e4ac
le4aeh:
	push bc			;e4ae
	call sub_671fh		;e4af
	pop bc			;e4b2
	djnz le4aeh		;e4b3
	ld hl,l6779h		;e4b5
	call 0611dh		;e4b8
	ld b,046h		;e4bb
le4bdh:
	push bc			;e4bd
	call sub_671fh		;e4be
	pop bc			;e4c1
	djnz le4bdh		;e4c2
	ret			;e4c4
	ld b,003h		;e4c5
le4c7h:
	push bc			;e4c7
	ld ix,l5f11h+1		;e4c8
	ld b,004h		;e4cc
le4ceh:
	push bc			;e4ce
	ld c,008h		;e4cf
le4d1h:
	ld a,(hl)		;e4d1
	ld b,008h		;e4d2
le4d4h:
	rra			;e4d4
	rr d			;e4d5
	rr e			;e4d7
	sra d			;e4d9
	rr e			;e4db
	djnz le4d4h		;e4dd
	ld (ix+000h),d		;e4df
sub_e4e2h:
	ld (ix+010h),e		;e4e2
	ld (ix+011h),e		;e4e5
	ld (ix+001h),d		;e4e8
	inc hl			;e4eb
	inc ix			;e4ec
	inc ix			;e4ee
	dec c			;e4f0
	jr nz,le4d1h		;e4f1
	push bc			;e4f3
	ld b,010h		;e4f4
le4f6h:
	inc ix			;e4f6
	djnz le4f6h		;e4f8
le4fah:
	pop bc			;e4fa
	pop bc			;e4fb
	djnz le4ceh		;e4fc
	push hl			;e4fe
	call sub_6519h		;e4ff
	push bc			;e502
	ld b,010h		;e503
le505h:
	call sub_671fh		;e505
	djnz le505h		;e508
	pop bc			;e50a
	pop hl			;e50b
	pop bc			;e50c
	djnz le4c7h		;e50d
	ld b,002h		;e50f
le511h:
	push bc			;e511
	call sub_671fh		;e512
	pop bc			;e515
	djnz le511h		;e516
	ret			;e518
	ld hl,l6520h		;e519
	call 0611dh		;e51c
	ret			;e51f
	ld d,014h		;e520
	nop			;e522
	djnz le525h		;e523
le525h:
	ld de,05d00h		;e525
	ld e,a			;e528
	ld h,c			;e529
	ld h,e			;e52a
	ld h,l			;e52b
	ld h,a			;e52c
	ld l,c			;e52d
	ld l,e			;e52e
	ld e,l			;e52f
	ld e,a			;e530
	ld d,015h		;e531
	nop			;e533
	ld e,(hl)		;e534
	ld h,b			;e535
	ld h,d			;e536
	ld h,h			;e537
	ld h,(hl)		;e538
	ld l,b			;e539
	ld l,d			;e53a
	ld l,h			;e53b
	ld e,(hl)		;e53c
	ld h,b			;e53d
	rst 38h			;e53e
	rst 38h			;e53f
	rst 20h			;e540
	jp l8181h		;e541
	jp lffe7h		;e544
	nop			;e547
	inc bc			;e548
	ld b,00dh		;e549
	ld a,(de)		;e54b
	dec d			;e54c
	dec bc			;e54d
	ld d,0cfh		;e54e
	or l			;e550
	jp m,0fe35h		;e551
	di			;e554
	defb 0ddh,03fh,080h ;illegal sequence	;e555
	ld b,b			;e558
	and b			;e559
	ld d,b			;e55a
	xor b			;e55b
	ld e,b			;e55c
	xor h			;e55d
	or h			;e55e
	rst 38h			;e55f
	rst 20h			;e560
	jp l8181h		;e561
	jp lffe7h		;e564
	dec e			;e567
	rrca			;e568
	rlca			;e569
	rlca			;e56a
	inc bc			;e56b
	inc bc			;e56c
	ld bc,l9701h		;e56d
	ld c,a			;e570
	or e			;e571
	ld a,a			;e572
	ld l,a			;e573
	ld (hl),a		;e574
	adc a,a			;e575
	call m,0f054h		;e576
	jp m,ld4f4h		;e579
	ld l,h			;e57c
	cp a			;e57d
	or l			;e57e
	rst 38h			;e57f
	rst 20h			;e580
	jp l8181h		;e581
	jp lffe7h		;e584
	nop			;e587
	nop			;e588
	nop			;e589
	nop			;e58a
	nop			;e58b
	nop			;e58c
	nop			;e58d
	nop			;e58e
	di			;e58f
	rst 28h			;e590
	rra			;e591
	ld a,l			;e592
	ccf			;e593
	rrca			;e594
	rla			;e595
	ld l,a			;e596
	cp 0fdh			;e597
	jp m,0faf5h		;e599
	push af			;e59c
	jp pe,lffd5h		;e59d
	rst 20h			;e5a0
	jp l8181h		;e5a1
	jp lffe7h		;e5a4
	nop			;e5a7
	ld bc,00d06h		;e5a8
	ld a,(bc)		;e5ab
	dec c			;e5ac
	ld a,(bc)		;e5ad
	ld b,03fh		;e5ae
	push de			;e5b0
	xor d			;e5b1
	ld d,l			;e5b2
	cp 0ffh			;e5b3
	adc a,a			;e5b5
	ld d,a			;e5b6
	add a,b			;e5b7
	ld (hl),b		;e5b8
	xor b			;e5b9
	ld d,h			;e5ba
	xor d			;e5bb
	ld d,(hl)		;e5bc
	ex de,hl		;e5bd
	push af			;e5be
	rst 38h			;e5bf
	rst 20h			;e5c0
	jp l8181h		;e5c1
	jp lffe7h		;e5c4
	inc bc			;e5c7
	rlca			;e5c8
	rlca			;e5c9
	rrca			;e5ca
	rrca			;e5cb
	rra			;e5cc
	dec c			;e5cd
	inc bc			;e5ce
	ld l,a			;e5cf
	sbc a,a			;e5d0
	rst 38h			;e5d1
	di			;e5d2
	rst 28h			;e5d3
	ei			;e5d4
	ei			;e5d5
	rst 30h			;e5d6
	ex de,hl		;e5d7
	xor l			;e5d8
	adc a,e			;e5d9
	or l			;e5da
	sbc a,e			;e5db
	or (hl)			;e5dc
	jp pe,lfff4h		;e5dd
	rst 20h			;e5e0
	jp l8181h		;e5e1
	jp lffe7h		;e5e4
	nop			;e5e7
	inc bc			;e5e8
	inc bc			;e5e9
	ld bc,00001h		;e5ea
	nop			;e5ed
	nop			;e5ee
	rrca			;e5ef
	rst 38h			;e5f0
	rst 38h			;e5f1
	rst 38h			;e5f2
	rst 38h			;e5f3
	rst 38h			;e5f4
	cpl			;e5f5
	rra			;e5f6
	call pe,sub_d0d8h	;e5f7
	ret pe			;e5fa
	ret m			;e5fb
	call m,lffffh		;e5fc
	rst 38h			;e5ff
	rst 20h			;e600
	jp l8181h		;e601
	jp lffe7h		;e604
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
	ld a,(bc)		;e612
	dec (hl)		;e613
	ld l,d			;e614
	sub l			;e615
	ld l,d			;e616
	nop			;e617
	nop			;e618
	nop			;e619
	nop			;e61a
	add a,b			;e61b
	ret nz			;e61c
	and b			;e61d
	ld d,b			;e61e
	rst 38h			;e61f
	rst 20h			;e620
	jp l8181h		;e621
	jp lffe7h		;e624
	ld (bc),a		;e627
	dec b			;e628
	dec b			;e629
	ld (bc),a		;e62a
	rlca			;e62b
	rlca			;e62c
	rlca			;e62d
	inc bc			;e62e
	ld a,b			;e62f
	add a,a			;e630
	dec (hl)		;e631
	ld e,b			;e632
	or a			;e633
	rst 8			;e634
	rst 38h			;e635
	rst 38h			;e636
	ret p			;e637
	ld (hl),b		;e638
	ld e,b			;e639
	ret c			;e63a
	ret m			;e63b
	ret p			;e63c
	ret po			;e63d
	ret nz			;e63e
	rst 38h			;e63f
	rst 20h			;e640
	jp l8181h		;e641
	jp lffe7h		;e644
	nop			;e647
	rlca			;e648
	dec c			;e649
	ld a,(de)		;e64a
	dec (hl)		;e64b
	cpl			;e64c
	dec (hl)		;e64d
	ld hl,(001fch)		;e64e
	add a,d			;e651
	ld a,l			;e652
	add a,e			;e653
	rst 38h			;e654
	rst 38h			;e655
	rst 38h			;e656
	and b			;e657
	ld a,b			;e658
	call pe,sub_ebf6h	;e659
	push af			;e65c
	jp pe,lffd5h		;e65d
	rst 20h			;e660
	jp l8181h		;e661
	jp lffe7h		;e664
	nop			;e667
	nop			;e668
	nop			;e669
	ld bc,00502h		;e66a
	rlca			;e66d
	rrca			;e66e
	nop			;e66f
	ld e,0ffh		;e670
	ld a,c			;e672
	add a,a			;e673
	call m,sub_fc1bh	;e674
	nop			;e677
	nop			;e678
	add a,b			;e679
	ret po			;e67a
	ret po			;e67b
	ld (hl),b		;e67c
	or b			;e67d
	jr c,$+1		;e67e
	rst 20h			;e680
	jp l8181h		;e681
	jp lffe7h		;e684
le687h:
	rlca			;e687
	ex af,af'		;e688
	ld c,00eh		;e689
	rrca			;e68b
	rlca			;e68c
	inc bc			;e68d
	inc bc			;e68e
	inc de			;e68f
	ex de,hl		;e690
	defb 0ddh,0dch,01dh ;illegal sequence	;e691
	ex (sp),hl		;e694
	rst 38h			;e695
	rst 38h			;e696
	call z,sub_bcbch	;e697
	ld a,b			;e69a
	ret p			;e69b
	ret p			;e69c
	ret po			;e69d
	ret po			;e69e
	rst 38h			;e69f
	rst 20h			;e6a0
	jp l8181h		;e6a1
	jp lffe7h		;e6a4
	inc bc			;e6a7
	ld bc,00701h		;e6a8
	dec c			;e6ab
	ld a,(l6a75h)		;e6ac
	ret nz			;e6af
	rst 38h			;e6b0
	rst 38h			;e6b1
	rst 38h			;e6b2
	ld a,(hl)		;e6b3
	xor d			;e6b4
	ld d,l			;e6b5
	xor d			;e6b6
	ret p			;e6b7
	ret z			;e6b8
	sub 0abh		;e6b9
	ld d,l			;e6bb
	xor d			;e6bc
	ld d,l			;e6bd
	xor d			;e6be
	rst 38h			;e6bf
	rst 20h			;e6c0
	jp l8181h		;e6c1
	jp lffe7h		;e6c4
	djnz le6e1h		;e6c7
	jr le6e1h		;e6c9
	add hl,bc		;e6cb
	ld b,005h		;e6cc
	dec b			;e6ce
	nop			;e6cf
	nop			;e6d0
	nop			;e6d1
	ld h,b			;e6d2
	ld (de),a		;e6d3
	ld l,l			;e6d4
	sub d			;e6d5
	inc b			;e6d6
	ex af,af'		;e6d7
	jr le6f2h		;e6d8
	jr le704h		;e6da
	ret nc			;e6dc
	ld d,b			;e6dd
	and b			;e6de
	rst 38h			;e6df
	rst 20h			;e6e0
le6e1h:
	jp l8181h		;e6e1
	jp lffe7h		;e6e4
	nop			;e6e7
	inc bc			;e6e8
	inc b			;e6e9
	dec b			;e6ea
	inc bc			;e6eb
	inc bc			;e6ec
	inc bc			;e6ed
	rlca			;e6ee
	cp (hl)			;e6ef
	adc a,0a7h		;e6f0
le6f2h:
	or a			;e6f2
	rst 8			;e6f3
	rst 38h			;e6f4
	rst 18h			;e6f5
	rst 28h			;e6f6
	ret nz			;e6f7
	and b			;e6f8
	ld (hl),b		;e6f9
	ret p			;e6fa
	ret p			;e6fb
le6fch:
	and b			;e6fc
	ret nz			;e6fd
	ret nz			;e6fe
	rst 38h			;e6ff
	rst 20h			;e700
	jp l8181h		;e701
le704h:
	jp lffe7h		;e704
	inc bc			;e707
	ld (bc),a		;e708
	ld (bc),a		;e709
	inc bc			;e70a
	jr nc,$+87		;e70b
	xor c			;e70d
	pop de			;e70e
	rra			;e70f
	rst 38h			;e710
	rst 38h			;e711
	nop			;e712
	cp 09dh			;e713
	jp m,l80fah		;e715
	add a,b			;e718
	add a,b			;e719
	inc e			;e71a
	jp pe,02a05h		;e71b
	ld d,l			;e71e
	push bc			;e71f
	ld hl,04000h		;e720
	ld de,04100h		;e723
	ld c,0c0h		;e726
le728h:
	ld b,00ah		;e728
le72ah:
	ld a,(de)		;e72a
	ld (hl),a		;e72b
	ld a,c			;e72c
	cp 002h			;e72d
	jr nz,le733h		;e72f
	xor a			;e731
	ld (de),a		;e732
le733h:
	inc de			;e733
	inc hl			;e734
	djnz le72ah		;e735
	push de			;e737
	ld de,000f6h		;e738
	add hl,de		;e73b
	ex (sp),hl		;e73c
	add hl,de		;e73d
	ex de,hl		;e73e
	pop hl			;e73f
	dec c			;e740
	ld a,c			;e741
	and 007h		;e742
	jr z,le74ch		;e744
	cp 001h			;e746
	jr z,le75eh		;e748
	jr le728h		;e74a
le74ch:
	push de			;e74c
	ld de,007e0h		;e74d
	sbc hl,de		;e750
	pop de			;e752
	ld a,c			;e753
	and 03fh		;e754
	jr nz,le728h		;e756
	ld a,007h		;e758
	add a,h			;e75a
	ld h,a			;e75b
	jr le728h		;e75c
le75eh:
	push hl			;e75e
	ex de,hl		;e75f
	ld de,007e0h		;e760
	sbc hl,de		;e763
	ex de,hl		;e765
	pop hl			;e766
	ld a,c			;e767
	and 03fh		;e768
	cp 001h			;e76a
	jr nz,le728h		;e76c
	ld a,007h		;e76e
	add a,d			;e770
	ld d,a			;e771
	ld a,c			;e772
	cp 001h			;e773
	jr nz,le728h		;e775
	pop bc			;e777
	ret			;e778
	ld d,00ah		;e779
	ld a,(bc)		;e77b
	jr nz,$+34		;e77c
	jr nz,$+34		;e77e
	jr nz,$+34		;e780
	jr nz,$+34		;e782
	jr nz,$+34		;e784
	jr nz,$+34		;e786
	jr nz,$+34		;e788
	jr nz,$+34		;e78a
	jr nz,le7aeh		;e78c
	jr nz,le7b0h		;e78e
	jr nz,le7b2h		;e790
	ld d,00ch		;e792
le794h:
	ld a,(bc)		;e794
	jr nz,$+34		;e795
	jr nz,$+34		;e797
	jr nz,$+34		;e799
	jr nz,$+34		;e79b
	jr nz,le7bfh		;e79d
	jr nz,le7c1h		;e79f
	jr nz,$+34		;e7a1
	jr nz,le7c5h		;e7a3
	jr nz,le7c7h		;e7a5
	jr nz,le7c9h		;e7a7
	jr nz,le7cbh		;e7a9
	ld d,009h		;e7ab
	ld a,(bc)		;e7ad
le7aeh:
	jr nz,$+34		;e7ae
le7b0h:
	jr nz,$+34		;e7b0
le7b2h:
	jr nz,le7d4h		;e7b2
	jr nz,le7d6h		;e7b4
	jr nz,$+1		;e7b6
	ld d,00ah		;e7b8
	ld c,010h		;e7ba
	ld b,041h		;e7bc
	ld d,d			;e7be
le7bfh:
	ld c,h			;e7bf
	ld c,a			;e7c0
le7c1h:
	ld b,(hl)		;e7c1
	jr nz,le814h		;e7c2
	ld b,l			;e7c4
le7c5h:
	ld d,d			;e7c5
	ld b,l			;e7c6
le7c7h:
	ld e,d			;e7c7
	ld d,h			;e7c8
le7c9h:
	ld d,d			;e7c9
	ld c,a			;e7ca
le7cbh:
	ld c,c			;e7cb
	ld c,e			;e7cc
	ld c,a			;e7cd
	ld a,(00c16h)		;e7ce
	ld de,00710h		;e7d1
le7d4h:
	ld d,h			;e7d4
	ld c,a			;e7d5
le7d6h:
	ld b,e			;e7d6
	ld b,c			;e7d7
	ld d,h			;e7d8
	ld b,l			;e7d9
	ld b,e			;e7da
	ld c,h			;e7db
	ld b,c			;e7dc
	ld d,e			;e7dd
	rst 38h			;e7de
	ld d,00ah		;e7df
	ld c,010h		;e7e1
	ld b,054h		;e7e3
	ld b,l			;e7e5
	ld d,(hl)		;e7e6
	ld b,l			;e7e7
	jr nz,le80ah		;e7e8
	ld d,a			;e7ea
	ld c,a			;e7eb
	ld c,(hl)		;e7ec
	ld b,h			;e7ed
	ld b,l			;e7ee
	ld d,d			;e7ef
	ld a,(00c16h)		;e7f0
	rrca			;e7f3
	djnz le7fdh		;e7f4
	ld d,h			;e7f6
	ld c,a			;e7f7
	ld b,e			;e7f8
	ld b,c			;e7f9
	ld d,h			;e7fa
	ld b,l			;e7fb
	ld b,e			;e7fc
le7fdh:
	ld c,h			;e7fd
	ld b,c			;e7fe
	ld d,e			;e7ff
	rst 38h			;e800
	ld d,00ah		;e801
	ld c,010h		;e803
	ld b,055h		;e805
	ld d,b			;e807
	ld b,l			;e808
	ld d,d			;e809
le80ah:
	jr nz,le84dh		;e80a
le80ch:
	ld c,d			;e80c
	ld c,a			;e80d
	jr nz,$+70		;e80e
	ld b,c			;e810
	ld c,h			;e811
	ld d,h			;e812
	ld c,a			;e813
le814h:
	ld c,(hl)		;e814
	ld c,c			;e815
	ld d,l			;e816
	ld d,e			;e817
	ld d,00ch		;e818
	ld (de),a		;e81a
	djnz le824h		;e81b
	ld b,a			;e81d
	ld b,c			;e81e
	ld d,d			;e81f
	ld b,c			;e820
	ld b,d			;e821
	ld b,c			;e822
	ld d,h			;e823
le824h:
	ld c,a			;e824
	ld d,e			;e825
	ld l,0ffh		;e826
	ld d,00ah		;e828
	ld c,010h		;e82a
	ld b,047h		;e82c
	ld c,a			;e82e
	ld d,d			;e82f
	jr nz,le886h		;e830
	ld d,d			;e832
	ld c,c			;e833
	ld d,(hl)		;e834
	ld b,c			;e835
	ld c,h			;e836
	ld b,h			;e837
	ld c,a			;e838
	ld a,(00c16h)		;e839
	dec bc			;e83c
	djnz le846h		;e83d
	ld c,l			;e83f
	ld b,c			;e840
	ld d,b			;e841
	ld b,l			;e842
	ld b,c			;e843
	ld b,h			;e844
	ld c,a			;e845
le846h:
	ld d,d			;e846
	jr nz,le88dh		;e847
	ld b,l			;e849
	jr nz,$+69		;e84a
	ld b,c			;e84c
le84dh:
	ld c,l			;e84d
	ld c,c			;e84e
	ld c,(hl)		;e84f
	ld c,a			;e850
	ld d,e			;e851
	rst 38h			;e852
	ld d,00ah		;e853
	rrca			;e855
	djnz le85eh		;e856
	ld b,c			;e858
	ld d,(hl)		;e859
	ld c,c			;e85a
	ld c,l			;e85b
	ld b,l			;e85c
	ld d,h			;e85d
le85eh:
	ld b,c			;e85e
	ld c,h			;e85f
	ld a,(00c16h)		;e860
	dec c			;e863
	djnz le86dh		;e864
	ld b,l			;e866
	ld d,e			;e867
	ld d,h			;e868
	ld d,d			;e869
	ld c,c			;e86a
	ld b,h			;e86b
	ld b,l			;e86c
le86dh:
	ld c,(hl)		;e86d
	ld b,e			;e86e
	ld c,c			;e86f
	ld b,c			;e870
	ld d,e			;e871
	rst 38h			;e872
	call sub_60c2h		;e873
	ld hl,l68c7h		;e876
	call 0611dh		;e879
	call sub_60bah		;e87c
	ret			;e87f
	call sub_60c2h		;e880
	ld hl,l68dah		;e883
le886h:
	call 0611dh		;e886
	call sub_60bah		;e889
	ret			;e88c
le88dh:
	call sub_60c2h		;e88d
	ld hl,l68edh		;e890
	call 0611dh		;e893
	call sub_60bah		;e896
	ret			;e899
	call sub_60c2h		;e89a
	ld hl,l6900h		;e89d
	call 0611dh		;e8a0
	call sub_60bah		;e8a3
	ret			;e8a6
	call sub_60c2h		;e8a7
le8aah:
	ld hl,l68b4h		;e8aa
	call 0611dh		;e8ad
	call sub_60bah		;e8b0
	ret			;e8b3
	ld d,00ah		;e8b4
	inc bc			;e8b6
	ld de,01301h		;e8b7
	ld bc,00510h		;e8ba
	jr nz,$+36		;e8bd
	inc de			;e8bf
	nop			;e8c0
	ld d,00bh		;e8c1
	inc bc			;e8c3
	ld hl,lff23h		;e8c4
	ld d,009h		;e8c7
	inc c			;e8c9
	ld de,01301h		;e8ca
	ld bc,00510h		;e8cd
	inc h			;e8d0
	ld h,013h		;e8d1
	nop			;e8d3
	ld d,00ah		;e8d4
	inc c			;e8d6
	dec h			;e8d7
	daa			;e8d8
	rst 38h			;e8d9
	ld d,009h		;e8da
	inc c			;e8dc
	ld de,01301h		;e8dd
	ld bc,00510h		;e8e0
	jr z,le90fh		;e8e3
	inc de			;e8e5
	nop			;e8e6
	ld d,00ah		;e8e7
	inc c			;e8e9
	add hl,hl		;e8ea
	dec hl			;e8eb
	rst 38h			;e8ec
	ld d,009h		;e8ed
	inc c			;e8ef
	ld de,01301h		;e8f0
	ld bc,00510h		;e8f3
	inc l			;e8f6
	ld l,013h		;e8f7
	nop			;e8f9
	ld d,00ah		;e8fa
	inc c			;e8fc
	dec l			;e8fd
	cpl			;e8fe
	rst 38h			;e8ff
	ld d,009h		;e900
	dec c			;e902
	ld de,01301h		;e903
	ld bc,00510h		;e906
	jr nc,$+52		;e909
	inc de			;e90b
	nop			;e90c
	ld d,00ah		;e90d
le90fh:
	dec c			;e90f
sub_e910h:
	ld sp,lff33h		;e910
	call sub_6a40h		;e913
	jp l6ff0h		;e916
	push hl			;e919
	push de			;e91a
	push bc			;e91b
	push af			;e91c
	push ix			;e91d
	ld d,004h		;e91f
le921h:
	ld hl,057ffh		;e921
	ld c,040h		;e924
le926h:
	ld b,020h		;e926
	and a			;e928
le929h:
	rl (hl)			;e929
	dec hl			;e92b
	djnz le929h		;e92c
	jr nc,le93bh		;e92e
	ld (05cb0h),hl		;e930
	ld ix,(05cb0h)		;e933
	set 0,(ix+020h)		;e937
le93bh:
	dec c			;e93b
	jr nz,le926h		;e93c
	dec d			;e93e
	jr nz,le921h		;e93f
	ld hl,047ffh		;e941
	ld c,040h		;e944
le946h:
	ld b,020h		;e946
	and a			;e948
le949h:
	rl (hl)			;e949
	dec hl			;e94b
	djnz le949h		;e94c
	jr nc,le95bh		;e94e
	ld (05cb0h),hl		;e950
	ld ix,(05cb0h)		;e953
	set 0,(ix+020h)		;e957
le95bh:
	dec c			;e95b
	jr nz,le946h		;e95c
	ld hl,(l6feeh)		;e95e
	ld a,(hl)		;e961
	cp 0ffh			;e962
	jr z,le977h		;e964
	inc hl			;e966
	ld (l6feeh),hl		;e967
	call sub_6f8ch		;e96a
le96dh:
	pop ix			;e96d
	pop af			;e96f
	pop bc			;e970
	pop de			;e971
	pop hl			;e972
	jp 00038h		;e973
	ret			;e976
le977h:
	ld hl,l6f9ch		;e977
	ld (l6feeh),hl		;e97a
	jr le96dh		;e97d
	ld b,(ix+002h)		;e97f
	ld c,(ix+003h)		;e982
	ld a,(ix+001h)		;e985
le988h:
	push af			;e988
	ld a,(ix+000h)		;e989
le98ch:
	push af			;e98c
	ld h,040h		;e98d
	ld a,b			;e98f
	and 018h		;e990
	add a,h			;e992
	ld h,a			;e993
	ld a,b			;e994
	and 007h		;e995
	rrca			;e997
	rrca			;e998
	rrca			;e999
	add a,c			;e99a
	ld l,a			;e99b
	push bc			;e99c
	ld b,008h		;e99d
le99fh:
	ld a,(de)		;e99f
	ld (hl),a		;e9a0
	inc de			;e9a1
	inc h			;e9a2
	djnz le99fh		;e9a3
	pop bc			;e9a5
	ld a,b			;e9a6
	sra a			;e9a7
	sra a			;e9a9
	sra a			;e9ab
	add a,058h		;e9ad
	ld h,a			;e9af
	ld a,(de)		;e9b0
	and 03fh		;e9b1
	ld a,(de)		;e9b3
	jr nz,le9bbh		;e9b4
	and 0c0h		;e9b6
	or (ix+004h)		;e9b8
le9bbh:
	inc de			;e9bb
	ld (hl),a		;e9bc
	pop af			;e9bd
	inc b			;e9be
	dec a			;e9bf
	jr nz,le98ch		;e9c0
	pop af			;e9c2
	ld b,(ix+002h)		;e9c3
	inc c			;e9c6
	dec a			;e9c7
	jr nz,le988h		;e9c8
	ret			;e9ca
	inc bc			;e9cb
	inc b			;e9cc
	dec c			;e9cd
	nop			;e9ce
	rlca			;e9cf
	ld b,01dh		;e9d0
	ld a,000h		;e9d2
	ld (l69ceh),a		;e9d4
le9d7h:
	push bc			;e9d7
	ld ix,l69cbh		;e9d8
	ld de,l6adah		;e9dc
	call 0697fh		;e9df
	ld de,l6b46h		;e9e2
	halt			;e9e5
	call 0697fh		;e9e6
	halt			;e9e9
	ld de,06bb2h		;e9ea
	call 0697fh		;e9ed
	ld hl,0000ah		;e9f0
	ld de,00005h		;e9f3
	push ix			;e9f6
	call 003b5h		;e9f8
	pop ix			;e9fb
	halt			;e9fd
	ld de,l6c1eh		;e9fe
	call 0697fh		;ea01
	ld hl,0000ah		;ea04
	ld de,00005h		;ea07
	push ix			;ea0a
	call 003b5h		;ea0c
	pop ix			;ea0f
	halt			;ea11
	ld a,(l69ceh)		;ea12
	inc a			;ea15
	ld (l69ceh),a		;ea16
	pop bc			;ea19
	djnz le9d7h		;ea1a
	ret			;ea1c
	ld b,002h		;ea1d
	djnz lea21h		;ea1f
lea21h:
	inc b			;ea21
	ld b,010h		;ea22
	ld a,000h		;ea24
	ld (l6a20h),a		;ea26
lea29h:
	push bc			;ea29
	ld ix,l6a1dh		;ea2a
	ld de,l6c8ah		;ea2e
	call 0697fh		;ea31
	ld a,(l6a20h)		;ea34
	inc a			;ea37
	inc a			;ea38
	ld (l6a20h),a		;ea39
	pop bc			;ea3c
	djnz lea29h		;ea3d
	ret			;ea3f
	call 06a22h		;ea40
	call 06ac5h		;ea43
	ld hl,06919h		;ea46
	ld (0fdfeh),hl		;ea49
	call lff01h		;ea4c
	call sub_69d0h		;ea4f
	call lff07h+1		;ea52
	call sub_638ch		;ea55
	ld b,050h		;ea58
lea5ah:
	halt			;ea5a
	djnz lea5ah		;ea5b
	call 06a22h		;ea5d
	call sub_6eb0h		;ea60
	call 06ac5h		;ea63
	call sub_6a6ah		;ea66
	ret			;ea69
	ld b,019h		;ea6a
	ld a,000h		;ea6c
	ld (l69ceh),a		;ea6e
lea71h:
	push bc			;ea71
	ld ix,l69cbh		;ea72
	ld de,l6adah		;ea76
	call 0697fh		;ea79
	halt			;ea7c
	halt			;ea7d
	halt			;ea7e
	halt			;ea7f
	ld de,l6b46h		;ea80
	call 0697fh		;ea83
	halt			;ea86
	halt			;ea87
	halt			;ea88
	halt			;ea89
	halt			;ea8a
	ld de,06bb2h		;ea8b
	call 0697fh		;ea8e
	ld hl,0000ah		;ea91
	ld de,00005h		;ea94
	push ix			;ea97
	call 003b5h		;ea99
	pop ix			;ea9c
	halt			;ea9e
	halt			;ea9f
	halt			;eaa0
	halt			;eaa1
	halt			;eaa2
	ld de,l6c1eh		;eaa3
	call 0697fh		;eaa6
	ld hl,0000ah		;eaa9
leaach:
	ld de,00005h		;eaac
	push ix			;eaaf
	call 003b5h		;eab1
	pop ix			;eab4
	halt			;eab6
	ld a,(l69ceh)		;eab7
leabah:
	inc a			;eaba
	ld (l69ceh),a		;eabb
	halt			;eabe
	halt			;eabf
	halt			;eac0
	pop bc			;eac1
	djnz lea71h		;eac2
	ret			;eac4
	ld ix,l6ea6h		;eac5
	ld de,l6cf6h		;eac9
	call 0697fh		;eacc
	ld ix,l6eabh		;eacf
	ld de,l6cf6h		;ead3
	call 0697fh		;ead6
lead9h:
	ret			;ead9
leadah:
	nop			;eada
leadbh:
	nop			;eadb
	nop			;eadc
	nop			;eadd
	nop			;eade
sub_eadfh:
	nop			;eadf
	nop			;eae0
	nop			;eae1
	rlca			;eae2
	nop			;eae3
	nop			;eae4
	nop			;eae5
	nop			;eae6
	nop			;eae7
	nop			;eae8
	nop			;eae9
	nop			;eaea
	rlca			;eaeb
	nop			;eaec
	nop			;eaed
	nop			;eaee
	nop			;eaef
	nop			;eaf0
	nop			;eaf1
	nop			;eaf2
	nop			;eaf3
	rlca			;eaf4
	nop			;eaf5
	nop			;eaf6
	nop			;eaf7
	nop			;eaf8
	nop			;eaf9
leafah:
	nop			;eafa
	ld bc,00781h		;eafb
	add a,c			;eafe
	ld b,c			;eaff
	ld b,c			;eb00
	ld b,b			;eb01
	ld b,c			;eb02
	ld b,c			;eb03
	ld hl,00713h		;eb04
	rrca			;eb07
	ld bc,00000h		;eb08
	inc b			;eb0b
	rrca			;eb0c
	inc e			;eb0d
	nop			;eb0e
	rlca			;eb0f
	ld (hl),b		;eb10
	ld d,b			;eb11
	ld a,b			;eb12
	ld (hl),b		;eb13
	ld (hl),b		;eb14
sub_eb15h:
	and b			;eb15
	ret nz			;eb16
	ret m			;eb17
	rlca			;eb18
	call nz,l5fa3h		;eb19
	rst 28h			;eb1c
sub_eb1dh:
	rst 28h			;eb1d
	xor 0e6h		;eb1e
	cp 007h			;eb20
	call m,01eb8h		;eb22
	ld hl,le020h		;eb25
	nop			;eb28
	nop			;eb29
	rlca			;eb2a
	nop			;eb2b
	nop			;eb2c
	nop			;eb2d
	nop			;eb2e
	nop			;eb2f
	ret po			;eb30
	ret p			;eb31
	ret pe			;eb32
leb33h:
	rlca			;eb33
	call m,sub_a4fch	;eb34
	and b			;eb37
	jr nz,leb4ah		;eb38
	nop			;eb3a
	nop			;eb3b
	rlca			;eb3c
	nop			;eb3d
	nop			;eb3e
	nop			;eb3f
	jr leafah		;eb40
	ld (hl),b		;eb42
	jr nz,sub_eb45h		;eb43
sub_eb45h:
	rlca			;eb45
	nop			;eb46
	nop			;eb47
	nop			;eb48
	nop			;eb49
leb4ah:
	nop			;eb4a
	nop			;eb4b
	nop			;eb4c
	nop			;eb4d
	rlca			;eb4e
	nop			;eb4f
	nop			;eb50
	nop			;eb51
	nop			;eb52
	nop			;eb53
	nop			;eb54
	nop			;eb55
	nop			;eb56
	rlca			;eb57
	nop			;eb58
	nop			;eb59
	nop			;eb5a
	nop			;eb5b
	nop			;eb5c
	nop			;eb5d
	nop			;eb5e
	nop			;eb5f
	rlca			;eb60
	nop			;eb61
	nop			;eb62
	nop			;eb63
	nop			;eb64
	nop			;eb65
	nop			;eb66
	nop			;eb67
	nop			;eb68
	rlca			;eb69
	ex af,af'		;eb6a
	ex af,af'		;eb6b
	djnz leb7eh		;eb6c
	jr nz,$+18		;eb6e
	djnz leb82h		;eb70
	rlca			;eb72
	inc c			;eb73
	inc bc			;eb74
	nop			;eb75
	inc b			;eb76
	dec de			;eb77
	jr leb7ah		;eb78
leb7ah:
	nop			;eb7a
	rlca			;eb7b
	nop			;eb7c
	inc e			;eb7d
leb7eh:
	inc d			;eb7e
	ld e,01ch		;eb7f
	inc e			;eb81
leb82h:
	jr z,lebf4h		;eb82
	rlca			;eb84
	ld a,h			;eb85
	ld (hl),e		;eb86
	ld l,b			;eb87
	ld d,a			;eb88
	dec sp			;eb89
	ld a,e			;eb8a
	ld a,e			;eb8b
	ld a,c			;eb8c
	rlca			;eb8d
	rst 38h			;eb8e
	rst 38h			;eb8f
	ld l,(hl)		;eb90
	djnz leb33h		;eb91
	ld b,b			;eb93
	ld bc,00701h		;eb94
	nop			;eb97
	nop			;eb98
	nop			;eb99
	nop			;eb9a
	nop			;eb9b
	nop			;eb9c
	jr c,$+62		;eb9d
	rlca			;eb9f
	ld a,(sub_ff3fh)	;eba0
	jp (hl)			;eba3
	ret pe			;eba4
	call nz,08080h		;eba5
	rlca			;eba8
	add a,b			;eba9
	nop			;ebaa
	add a,b			;ebab
	ld b,b			;ebac
	ld b,b			;ebad
	add a,b			;ebae
	add a,b			;ebaf
	ret nz			;ebb0
	rlca			;ebb1
	nop			;ebb2
	nop			;ebb3
	nop			;ebb4
	nop			;ebb5
	nop			;ebb6
	nop			;ebb7
	nop			;ebb8
	nop			;ebb9
	rlca			;ebba
	nop			;ebbb
	nop			;ebbc
	nop			;ebbd
	nop			;ebbe
	nop			;ebbf
	nop			;ebc0
	nop			;ebc1
	nop			;ebc2
	rlca			;ebc3
	nop			;ebc4
	nop			;ebc5
	nop			;ebc6
	nop			;ebc7
	nop			;ebc8
	nop			;ebc9
	nop			;ebca
	nop			;ebcb
	rlca			;ebcc
	nop			;ebcd
	nop			;ebce
	nop			;ebcf
	nop			;ebd0
	nop			;ebd1
	nop			;ebd2
	nop			;ebd3
	nop			;ebd4
	rlca			;ebd5
	ld b,b			;ebd6
	ld h,b			;ebd7
	jr nz,lebfah		;ebd8
	djnz lebech		;ebda
	djnz lebeah		;ebdc
	rlca			;ebde
	inc bc			;ebdf
	nop			;ebe0
	nop			;ebe1
	ld bc,00303h		;ebe2
	nop			;ebe5
	nop			;ebe6
	rlca			;ebe7
	inc e			;ebe8
	inc d			;ebe9
lebeah:
	ld e,01ch		;ebea
lebech:
	inc e			;ebec
	jr z,lec5fh		;ebed
lebefh:
	ld a,(hl)		;ebef
	rlca			;ebf0
	ld (hl),c		;ebf1
	ld l,b			;ebf2
	ld d,a			;ebf3
lebf4h:
	dec sp			;ebf4
	ld (hl),a		;ebf5
sub_ebf6h:
	ld (hl),a		;ebf6
	ld (hl),e		;ebf7
	rst 38h			;ebf8
	rlca			;ebf9
lebfah:
	rst 38h			;ebfa
	ld l,(hl)		;ebfb
	inc d			;ebfc
	call nc,04028h		;ebfd
	jr nc,lec3ah		;ec00
	rlca			;ec02
	nop			;ec03
	nop			;ec04
	nop			;ec05
	nop			;ec06
	nop			;ec07
	jr c,lec46h		;ec08
	ld a,(03f07h)		;ec0a
	rst 38h			;ec0d
	jp (hl)			;ec0e
	call pe,sub_80c2h	;ec0f
	add a,b			;ec12
	add a,b			;ec13
	rlca			;ec14
	nop			;ec15
	nop			;ec16
	nop			;ec17
	nop			;ec18
	nop			;ec19
	nop			;ec1a
	nop			;ec1b
	nop			;ec1c
	rlca			;ec1d
	nop			;ec1e
	nop			;ec1f
	nop			;ec20
	nop			;ec21
	nop			;ec22
	nop			;ec23
	nop			;ec24
	nop			;ec25
	rlca			;ec26
	nop			;ec27
	nop			;ec28
	nop			;ec29
	nop			;ec2a
	nop			;ec2b
	nop			;ec2c
	nop			;ec2d
	nop			;ec2e
	rlca			;ec2f
	nop			;ec30
	nop			;ec31
	nop			;ec32
	nop			;ec33
	nop			;ec34
	nop			;ec35
	nop			;ec36
	nop			;ec37
	rlca			;ec38
	nop			;ec39
lec3ah:
	nop			;ec3a
	nop			;ec3b
	nop			;ec3c
	nop			;ec3d
	nop			;ec3e
	nop			;ec3f
	nop			;ec40
	rlca			;ec41
	add a,b			;ec42
	ret nz			;ec43
	ld b,b			;ec44
	ld b,b			;ec45
lec46h:
	jr nz,lec68h		;ec46
	jr nz,lec63h		;ec48
	rlca			;ec4a
	rlca			;ec4b
	nop			;ec4c
	nop			;ec4d
	jr lec6eh		;ec4e
	add hl,de		;ec50
	jr lec53h		;ec51
lec53h:
	rlca			;ec53
	jr c,lec7eh		;ec54
	inc a			;ec56
	jr c,lec91h		;ec57
	ld d,b			;ec59
	ret po			;ec5a
	ret m			;ec5b
	rlca			;ec5c
	and 0d1h		;ec5d
lec5fh:
	xor a			;ec5f
	ld (hl),a		;ec60
	rst 28h			;ec61
	rst 28h			;ec62
lec63h:
	rst 20h			;ec63
	rst 38h			;ec64
	rlca			;ec65
	cp 0dch			;ec66
lec68h:
	inc hl			;ec68
	jr nz,$+34		;ec69
	ret nz			;ec6b
	nop			;ec6c
	nop			;ec6d
lec6eh:
	rlca			;ec6e
	nop			;ec6f
	nop			;ec70
	nop			;ec71
	nop			;ec72
	nop			;ec73
	ld (hl),b		;ec74
	ld a,b			;ec75
	ld (hl),h		;ec76
	rlca			;ec77
	ld a,(hl)		;ec78
	cp 0d2h			;ec79
	ret nc			;ec7b
	sub b			;ec7c
	ex af,af'		;ec7d
lec7eh:
	nop			;ec7e
	nop			;ec7f
	rlca			;ec80
	nop			;ec81
	nop			;ec82
	add a,b			;ec83
	ld h,b			;ec84
	djnz leca3h		;ec85
	inc c			;ec87
	nop			;ec88
	rlca			;ec89
	ld a,0f4h		;ec8a
	inc c			;ec8c
	xor 055h		;ec8d
	xor d			;ec8f
	ld d,l			;ec90
lec91h:
	xor d			;ec91
	ld b,h			;ec92
	ld d,l			;ec93
	xor d			;ec94
	ld d,l			;ec95
sub_ec96h:
	xor d			;ec96
	ld d,l			;ec97
	xor d			;ec98
	ld d,l			;ec99
	xor d			;ec9a
	ld b,h			;ec9b
	ld d,l			;ec9c
	xor d			;ec9d
	ld d,l			;ec9e
	xor d			;ec9f
	ld d,l			;eca0
	xor d			;eca1
	ld d,l			;eca2
leca3h:
	xor d			;eca3
	ld b,h			;eca4
	ld d,l			;eca5
	xor d			;eca6
	ld d,l			;eca7
	xor d			;eca8
	ld d,l			;eca9
	xor d			;ecaa
	ld d,l			;ecab
	xor d			;ecac
	ld b,h			;ecad
	ld d,l			;ecae
	xor d			;ecaf
	ld d,l			;ecb0
	xor d			;ecb1
	ld d,l			;ecb2
	xor d			;ecb3
	ld d,l			;ecb4
	xor d			;ecb5
	ld b,h			;ecb6
	ld d,l			;ecb7
	and d			;ecb8
	ld bc,l624ch		;ecb9
	nop			;ecbc
	ld c,c			;ecbd
	nop			;ecbe
	ld b,h			;ecbf
	rst 30h			;ecc0
	rst 20h			;ecc1
	ld e,h			;ecc2
	di			;ecc3
	ld d,l			;ecc4
	xor d			;ecc5
	ld d,l			;ecc6
	xor d			;ecc7
	ld b,h			;ecc8
	ld d,l			;ecc9
	xor d			;ecca
	ld d,l			;eccb
	xor d			;eccc
	ld d,l			;eccd
	xor d			;ecce
	ld d,l			;eccf
	xor d			;ecd0
	ld b,h			;ecd1
	ld d,l			;ecd2
	xor d			;ecd3
	ld d,l			;ecd4
	xor d			;ecd5
	ld d,l			;ecd6
	xor d			;ecd7
	ld d,l			;ecd8
	xor d			;ecd9
	ld b,h			;ecda
	ld d,l			;ecdb
	xor d			;ecdc
	ld d,l			;ecdd
	xor d			;ecde
	ld d,l			;ecdf
	xor d			;ece0
	ld d,l			;ece1
	xor d			;ece2
	ld b,h			;ece3
	ld d,l			;ece4
lece5h:
	xor d			;ece5
	ld d,l			;ece6
	xor d			;ece7
	ld d,l			;ece8
	xor d			;ece9
	ld d,l			;ecea
	xor d			;eceb
	ld b,h			;ecec
	ld d,l			;eced
	and d			;ecee
lecefh:
	ld bc,l624ch		;ecef
	nop			;ecf2
	ld c,c			;ecf3
	nop			;ecf4
	ld b,h			;ecf5
	nop			;ecf6
	ex af,af'		;ecf7
	ex af,af'		;ecf8
	ex af,af'		;ecf9
lecfah:
	inc d			;ecfa
	inc d			;ecfb
	inc h			;ecfc
	ld (03628h),a		;ecfd
	ld l,d			;ed00
	ld a,(hl)		;ed01
	ld a,(hl)		;ed02
	ld a,(hl)		;ed03
	ld a,(hl)		;ed04
	ld (hl),a		;ed05
	ex de,hl		;ed06
	ld l,b			;ed07
	ex de,hl		;ed08
	ret			;ed09
	and (hl)		;ed0a
	ld e,d			;ed0b
	ld a,a			;ed0c
	ld a,a			;ed0d
	ld a,a			;ed0e
	rst 38h			;ed0f
	ld l,b			;ed10
	nop			;ed11
	nop			;ed12
	nop			;ed13
	nop			;ed14
	nop			;ed15
	ex af,af'		;ed16
	jr led2dh		;ed17
	jr z,led3fh		;ed19
	ld l,d			;ed1b
	ld e,d			;ed1c
	push af			;ed1d
	rst 38h			;ed1e
	rst 38h			;ed1f
	cp 0fdh			;ed20
	ld l,b			;ed22
	ei			;ed23
	rst 30h			;ed24
	rst 30h			;ed25
	rst 30h			;ed26
	ld l,a			;ed27
	sbc a,a			;ed28
	rst 28h			;ed29
	rst 38h			;ed2a
	ld l,b			;ed2b
	nop			;ed2c
led2dh:
	ex af,af'		;ed2d
	inc d			;ed2e
	ld (lfe5ah),hl		;ed2f
	rst 38h			;ed32
	rst 18h			;ed33
	jr z,lece5h		;ed34
	xor a			;ed36
	xor a			;ed37
	ld d,a			;ed38
	ld b,a			;ed39
	rla			;ed3a
	and a			;ed3b
	ex de,hl		;ed3c
	ld l,b			;ed3d
	push af			;ed3e
led3fh:
	cp 0ffh			;ed3f
	rst 38h			;ed41
	rst 38h			;ed42
	rst 38h			;ed43
	rst 38h			;ed44
	rst 38h			;ed45
	ld l,b			;ed46
	nop			;ed47
	nop			;ed48
	ex af,af'		;ed49
	inc b			;ed4a
	ex af,af'		;ed4b
	inc b			;ed4c
	inc c			;ed4d
	sbc a,h			;ed4e
	jr z,lecefh		;ed4f
	cp (hl)			;ed51
	cp l			;ed52
	in a,(0dbh)		;ed53
led55h:
	rst 20h			;ed55
	rst 20h			;ed56
	rst 20h			;ed57
	ld l,b			;ed58
	ei			;ed59
	dec a			;ed5a
led5bh:
	adc a,0f7h		;ed5b
	ret m			;ed5d
	rst 38h			;ed5e
	rst 38h			;ed5f
	rst 38h			;ed60
	ld l,b			;ed61
	nop			;ed62
	nop			;ed63
	nop			;ed64
	nop			;ed65
	nop			;ed66
	ld bc,04931h		;ed67
	jr z,ledd2h		;ed6a
	jp nc,lbf2dh		;ed6c
	rst 38h			;ed6f
	rst 38h			;ed70
	rst 38h			;ed71
	rst 38h			;ed72
	ld l,b			;ed73
	cp 0feh			;ed74
	dec (hl)		;ed76
led77h:
	defb 0cbh,037h ;sli a	;ed77
	rst 8			;ed79
	rst 38h			;ed7a
	rst 38h			;ed7b
	ld l,b			;ed7c
	nop			;ed7d
	nop			;ed7e
	nop			;ed7f
	ret nz			;ed80
	ld b,b			;ed81
	and b			;ed82
	jr nz,led55h		;ed83
	jr z,led77h		;ed85
	ret m			;ed87
	ld a,b			;ed88
	ld a,h			;ed89
	adc a,h			;ed8a
	ld (hl),h		;ed8b
	ld c,e			;ed8c
	ld h,h			;ed8d
	ld l,b			;ed8e
	in a,(0ffh)		;ed8f
	rst 38h			;ed91
	rst 38h			;ed92
	rst 38h			;ed93
	rst 38h			;ed94
	rst 38h			;ed95
	rst 38h			;ed96
	ld l,b			;ed97
	nop			;ed98
	nop			;ed99
	nop			;ed9a
	nop			;ed9b
	nop			;ed9c
	nop			;ed9d
	nop			;ed9e
	nop			;ed9f
	jr z,leda2h		;eda0
leda2h:
	ld bc,00201h		;eda2
	inc b			;eda5
	ld a,(bc)		;eda6
	adc a,a			;eda7
leda8h:
	adc a,a			;eda8
	ld l,b			;eda9
	sbc a,a			;edaa
	ld l,a			;edab
	sub a			;edac
	set 7,h			;edad
	rst 38h			;edaf
	rst 38h			;edb0
	rst 38h			;edb1
	ld l,b			;edb2
	nop			;edb3
	nop			;edb4
	nop			;edb5
	nop			;edb6
	nop			;edb7
	nop			;edb8
	nop			;edb9
	nop			;edba
	jr z,ledbdh		;edbb
ledbdh:
	ld bc,04889h		;edbd
	ld e,b			;edc0
	ld e,h			;edc1
	ld e,(hl)		;edc2
	xor 068h		;edc3
	defb 0edh ;next byte illegal after ed	;edc5
	ex (sp),hl		;edc6
	ex (sp),hl		;edc7
	di			;edc8
	ei			;edc9
	ld (hl),a		;edca
	add a,a			;edcb
	rst 38h			;edcc
ledcdh:
	ld l,b			;edcd
	nop			;edce
	nop			;edcf
	jr nz,lee32h		;edd0
ledd2h:
	ld b,b			;edd2
	jr nz,lee35h		;edd3
	ld d,b			;edd5
	jr z,leda8h		;edd6
	xor b			;edd8
	call nc,sub_fcf4h	;edd9
	call m,0fefeh		;eddc
	ld l,b			;eddf
	cp 0feh			;ede0
	cp 0ffh			;ede2
	rst 38h			;ede4
	rst 38h			;ede5
	rst 38h			;ede6
	rst 38h			;ede7
	ld l,b			;ede8
	nop			;ede9
	nop			;edea
	nop			;edeb
	nop			;edec
	nop			;eded
	nop			;edee
	nop			;edef
	nop			;edf0
	jr z,ledf3h		;edf1
ledf3h:
	nop			;edf3
	nop			;edf4
	nop			;edf5
	inc b			;edf6
	ld b,00dh		;edf7
	ld (de),a		;edf9
	ld l,b			;edfa
	dec e			;edfb
ledfch:
	ld e,03fh		;edfc
	ccf			;edfe
	cp a			;edff
sub_ee00h:
	rst 0			;ee00
	ret m			;ee01
	rst 38h			;ee02
	ld l,b			;ee03
	nop			;ee04
	nop			;ee05
	nop			;ee06
	nop			;ee07
	nop			;ee08
	nop			;ee09
	ld bc,02803h		;ee0a
	ld (bc),a		;ee0d
	inc b			;ee0e
	inc b			;ee0f
	dec bc			;ee10
	ld a,(bc)		;ee11
	rrca			;ee12
	adc a,a			;ee13
	ld c,a			;ee14
	ld l,b			;ee15
	ld c,a			;ee16
	rst 18h			;ee17
	rst 18h			;ee18
	cp a			;ee19
	cp a			;ee1a
	cp a			;ee1b
	ccf			;ee1c
	rst 38h			;ee1d
	ld l,b			;ee1e
	nop			;ee1f
	nop			;ee20
	nop			;ee21
	nop			;ee22
	nop			;ee23
	nop			;ee24
	add a,b			;ee25
	ld b,b			;ee26
	jr z,lee69h		;ee27
lee29h:
	ld b,b			;ee29
	and b			;ee2a
	jr nz,ledcdh		;ee2b
	ret po			;ee2d
	ret po			;ee2e
	ret nc			;ee2f
	ld l,b			;ee30
	pop af			;ee31
lee32h:
	pop af			;ee32
lee33h:
	out (0d6h),a		;ee33
lee35h:
	or 0fdh			;ee35
	di			;ee37
	rst 28h			;ee38
	ld l,b			;ee39
	nop			;ee3a
	ex af,af'		;ee3b
	ex af,af'		;ee3c
	ex af,af'		;ee3d
	inc d			;ee3e
	inc d			;ee3f
	inc h			;ee40
	ld (03628h),a		;ee41
	ld l,d			;ee44
	ld a,(hl)		;ee45
	ld a,(hl)		;ee46
	ld a,(hl)		;ee47
	ld a,(hl)		;ee48
	ld (hl),a		;ee49
	ex de,hl		;ee4a
	ld l,b			;ee4b
	ex de,hl		;ee4c
	ret			;ee4d
	and (hl)		;ee4e
	ld e,d			;ee4f
	ld a,a			;ee50
	ld a,a			;ee51
	ld a,a			;ee52
	rst 38h			;ee53
	ld l,b			;ee54
	nop			;ee55
	nop			;ee56
	nop			;ee57
	nop			;ee58
	nop			;ee59
	ex af,af'		;ee5a
	jr lee71h		;ee5b
	jr z,lee83h		;ee5d
	ld l,d			;ee5f
	ld e,d			;ee60
	push af			;ee61
	rst 38h			;ee62
	rst 38h			;ee63
	cp 0fdh			;ee64
	ld l,b			;ee66
	ei			;ee67
	rst 30h			;ee68
lee69h:
	rst 30h			;ee69
	rst 30h			;ee6a
	ld l,a			;ee6b
	sbc a,a			;ee6c
	rst 28h			;ee6d
	rst 38h			;ee6e
	ld l,b			;ee6f
	nop			;ee70
lee71h:
	ex af,af'		;ee71
	inc d			;ee72
	ld (lfe5ah),hl		;ee73
	rst 38h			;ee76
	rst 18h			;ee77
	jr z,lee29h		;ee78
	xor a			;ee7a
	xor a			;ee7b
	ld d,a			;ee7c
	ld b,a			;ee7d
	rla			;ee7e
	and a			;ee7f
	ex de,hl		;ee80
	ld l,b			;ee81
	push af			;ee82
lee83h:
	cp 0ffh			;ee83
	rst 38h			;ee85
	rst 38h			;ee86
	rst 38h			;ee87
	rst 38h			;ee88
	rst 38h			;ee89
	ld l,b			;ee8a
	nop			;ee8b
	nop			;ee8c
	ex af,af'		;ee8d
	inc b			;ee8e
	ex af,af'		;ee8f
	inc b			;ee90
	inc c			;ee91
	sbc a,h			;ee92
	jr z,lee33h		;ee93
	cp (hl)			;ee95
	cp l			;ee96
	in a,(0dbh)		;ee97
	rst 20h			;ee99
	rst 20h			;ee9a
	rst 20h			;ee9b
	ld l,b			;ee9c
	ei			;ee9d
	dec a			;ee9e
	adc a,0f7h		;ee9f
	ret m			;eea1
	rst 38h			;eea2
	rst 38h			;eea3
	rst 38h			;eea4
	ld l,b			;eea5
	inc bc			;eea6
	djnz leeaeh		;eea7
	nop			;eea9
	dec l			;eeaa
	inc bc			;eeab
	djnz $+7		;eeac
leeaeh:
	djnz leeddh		;eeae
	ld ix,l6ec5h		;eeb0
	ld de,l6ecfh		;eeb4
	call 0697fh		;eeb7
	ld ix,l6ecah		;eeba
	ld de,l6eeah		;eebe
	call 0697fh		;eec1
	ret			;eec4
	inc bc			;eec5
	ld bc,01f08h		;eec6
	nop			;eec9
	ld b,003h		;eeca
	ld a,(bc)		;eecc
	dec e			;eecd
	nop			;eece
	rlca			;eecf
	dec bc			;eed0
	dec d			;eed1
	dec bc			;eed2
	rla			;eed3
	cpl			;eed4
	cpl			;eed5
	ld e,a			;eed6
	rlca			;eed7
	ld c,a			;eed8
	ld d,a			;eed9
	ld d,a			;eeda
	cpl			;eedb
	daa			;eedc
leeddh:
	dec hl			;eedd
sub_eedeh:
	ld (hl),l		;eede
	xor c			;eedf
	rlca			;eee0
	ld d,l			;eee1
	xor c			;eee2
	ld b,a			;eee3
	ccf			;eee4
	cp a			;eee5
	cp a			;eee6
	ld a,a			;eee7
	rst 38h			;eee8
	rlca			;eee9
	nop			;eeea
	nop			;eeeb
	nop			;eeec
	nop			;eeed
	nop			;eeee
	nop			;eeef
	nop			;eef0
	nop			;eef1
	rlca			;eef2
	nop			;eef3
	nop			;eef4
	nop			;eef5
	nop			;eef6
	nop			;eef7
	nop			;eef8
	nop			;eef9
	nop			;eefa
	rlca			;eefb
	nop			;eefc
	nop			;eefd
	nop			;eefe
	nop			;eeff
	nop			;ef00
	ld bc,00101h		;ef01
	rlca			;ef04
	inc bc			;ef05
	rlca			;ef06
	rlca			;ef07
	rlca			;ef08
	rlca			;ef09
	rrca			;ef0a
	rrca			;ef0b
	rra			;ef0c
	rlca			;ef0d
	ccf			;ef0e
	ccf			;ef0f
	ccf			;ef10
	ccf			;ef11
	ccf			;ef12
	ccf			;ef13
	ld a,a			;ef14
	ld a,(hl)		;ef15
	rlca			;ef16
	ld a,a			;ef17
	ld a,(hl)		;ef18
	ld a,l			;ef19
	cp 0fdh			;ef1a
	call m,0fdfeh		;ef1c
	rlca			;ef1f
	rlca			;ef20
	rlca			;ef21
	dec bc			;ef22
	inc d			;ef23
	cpl			;ef24
	cpl			;ef25
	ld e,a			;ef26
	ld e,a			;ef27
	rlca			;ef28
	cp a			;ef29
	cp a			;ef2a
	jp 0373ch		;ef2b
	ld hl,(02a35h)		;ef2e
	rlca			;ef31
	ld d,l			;ef32
	ld l,d			;ef33
	rst 10h			;ef34
	xor a			;ef35
	rst 10h			;ef36
	xor a			;ef37
	ld e,a			;ef38
	ccf			;ef39
	rlca			;ef3a
	defb 0fdh,0fbh,0f6h ;illegal sequence	;ef3b
	ret pe			;ef3e
	call nc,sub_d8e8h	;ef3f
	or b			;ef42
	rlca			;ef43
	ld d,b			;ef44
	or b			;ef45
	ld h,b			;ef46
	and c			;ef47
	ld h,b			;ef48
	and c			;ef49
	ld h,b			;ef4a
	and c			;ef4b
	rlca			;ef4c
	ld h,b			;ef4d
	and c			;ef4e
	ld b,b			;ef4f
	pop de			;ef50
	ld h,b			;ef51
	pop de			;ef52
	jr nz,$+66		;ef53
	rlca			;ef55
	rst 38h			;ef56
	rst 38h			;ef57
	rst 38h			;ef58
	ld a,a			;ef59
	sbc a,a			;ef5a
	rst 28h			;ef5b
	rst 38h			;ef5c
	rst 38h			;ef5d
	rlca			;ef5e
	rst 38h			;ef5f
	rst 38h			;ef60
	cp a			;ef61
	ld e,a			;ef62
	cp a			;ef63
	cp a			;ef64
	ld e,a			;ef65
	cp a			;ef66
	rlca			;ef67
	ld a,a			;ef68
	rst 38h			;ef69
	rst 38h			;ef6a
	rst 38h			;ef6b
	rst 38h			;ef6c
	rst 38h			;ef6d
	rst 38h			;ef6e
	rst 38h			;ef6f
	rlca			;ef70
	ld a,a			;ef71
	sub a			;ef72
	dec hl			;ef73
	rla			;ef74
	dec hl			;ef75
	ld e,e			;ef76
	or l			;ef77
	ld e,e			;ef78
	rlca			;ef79
	or l			;ef7a
	ld e,e			;ef7b
	or a			;ef7c
	ld l,e			;ef7d
	or a			;ef7e
	ld l,c			;ef7f
	or l			;ef80
	ld c,c			;ef81
	rlca			;ef82
	or h			;ef83
	ld l,c			;ef84
	or h			;ef85
	ld l,c			;ef86
	sub l			;ef87
	ld l,c			;ef88
	push de			;ef89
	xor b			;ef8a
	rlca			;ef8b
	ld a,002h		;ef8c
	push hl			;ef8e
	call 01601h		;ef8f
	pop hl			;ef92
	ld a,(hl)		;ef93
	cp 0ffh			;ef94
	ret z			;ef96
	inc hl			;ef97
	push hl			;ef98
	rst 10h			;ef99
	pop hl			;ef9a
	ret			;ef9b
	ld d,016h		;ef9c
	add hl,bc		;ef9e
	nop			;ef9f
	jr nz,$+34		;efa0
	jr nz,lefc4h		;efa2
	jr nz,lefc6h		;efa4
	jr nz,lefc8h		;efa6
	jr nz,lefcah		;efa8
	jr nz,lefcch		;efaa
	jr nz,lefceh		;efac
	ld d,008h		;efae
	nop			;efb0
	djnz lefb9h		;efb1
	inc de			;efb3
	ld bc,05520h		;efb4
	ld c,(hl)		;efb7
	ld b,c			;efb8
lefb9h:
	jr nz,lf000h		;efb9
	ld d,e			;efbb
	ld b,d			;efbc
	ld b,l			;efbd
	ld c,h			;efbe
	ld d,h			;efbf
	ld b,c			;efc0
	jr nz,lf009h		;efc1
	ld c,c			;efc3
lefc4h:
	ld b,a			;efc4
	ld d,l			;efc5
lefc6h:
	ld d,d			;efc6
	ld b,c			;efc7
lefc8h:
	jr nz,$+67		;efc8
lefcah:
	ld d,(hl)		;efca
	ld b,c			;efcb
lefcch:
	ld c,(hl)		;efcc
	ld e,d			;efcd
lefceh:
	ld b,c			;efce
	jr nz,lf021h		;efcf
	ld c,a			;efd1
	ld d,d			;efd2
	ld d,00ah		;efd3
	inc b			;efd5
	ld c,h			;efd6
	ld b,c			;efd7
	jr nz,$+67		;efd8
	ld d,d			;efda
	ld c,c			;efdb
	ld b,h			;efdc
	ld b,l			;efdd
	ld e,d			;efde
	jr nz,lf025h		;efdf
	ld b,l			;efe1
	ld c,h			;efe2
	jr nz,$+70		;efe3
	ld b,l			;efe5
	ld d,e			;efe6
	ld c,c			;efe7
	ld b,l			;efe8
	ld d,d			;efe9
lefeah:
	ld d,h			;efea
	ld c,a			;efeb
	ld l,0ffh		;efec
	sbc a,h			;efee
	ld l,a			;efef
	call sub_638ch		;eff0
	ld b,050h		;eff3
leff5h:
	halt			;eff5
	djnz leff5h		;eff6
	call sub_638ch		;eff8
	ld d,038h		;effb
	call sub_851bh		;effd
lf000h:
	ld hl,ledfch		;f000
	call sub_7d84h		;f003
	call sub_859ch		;f006
lf009h:
	call sub_7216h		;f009
	im 1			;f00c
	call sub_638ch		;f00e
	ld d,000h		;f011
	call sub_851bh		;f013
	ld b,0ffh		;f016
sub_f018h:
	ld a,000h		;f018
	ld hl,05a00h		;f01a
lf01dh:
	ld (hl),a		;f01d
	inc hl			;f01e
	djnz lf01dh		;f01f
lf021h:
	ld (hl),a		;f021
	ld de,le4fah		;f022
lf025h:
	ld hl,04000h		;f025
	ld b,080h		;f028
	call sub_7d8dh		;f02a
	ld hl,04000h		;f02d
	ld bc,01000h		;f030
	call 07d30h		;f033
	ld de,lecfah		;f036
	ld hl,05000h		;f039
	ld b,010h		;f03c
	call sub_7d8dh		;f03e
	ld hl,05000h		;f041
	ld bc,00200h		;f044
	call sub_7d49h		;f047
	ld de,05800h		;f04a
	ld hl,05000h		;f04d
	ld bc,00200h		;f050
	ldir			;f053
	ld hl,05000h		;f055
	ld bc,00200h		;f058
lf05bh:
	ld a,000h		;f05b
	ld (hl),a		;f05d
	inc hl			;f05e
	dec bc			;f05f
	ld a,b			;f060
	or c			;f061
	jr nz,lf05bh		;f062
	ld b,0ffh		;f064
	ld hl,05a00h		;f066
	ld a,047h		;f069
lf06bh:
	ld (hl),a		;f06b
	inc hl			;f06c
	djnz lf06bh		;f06d
	ld (hl),a		;f06f
	ld hl,l7078h		;f070
	call 0611dh		;f073
	jr lf085h		;f076
	ld d,003h		;f078
	nop			;f07a
	djnz lf07dh		;f07b
lf07dh:
	ld de,05300h		;f07d
	ld d,h			;f080
	ld b,l			;f081
	ld d,(hl)		;f082
	ld b,l			;f083
	rst 38h			;f084
lf085h:
	call 07e2bh		;f085
	ld hl,07c32h		;f088
	ld (0fdfeh),hl		;f08b
	call lff01h		;f08e
	call sub_7216h		;f091
	im 1			;f094
	call sub_638ch		;f096
	ld d,000h		;f099
	call sub_851bh		;f09b
	ld de,le078h		;f09e
	ld hl,04000h		;f0a1
	ld b,040h		;f0a4
	call sub_7d8dh		;f0a6
	ld hl,04000h		;f0a9
	ld bc,00800h		;f0ac
	call 07d30h		;f0af
	ld hl,04800h		;f0b2
	ld de,0e478h		;f0b5
	ld b,008h		;f0b8
	call sub_7d8dh		;f0ba
	ld bc,00100h		;f0bd
	ld hl,04800h		;f0c0
	call sub_7d49h		;f0c3
	ld de,le4fah		;f0c6
	ld hl,04000h		;f0c9
	ld bc,00900h		;f0cc
	ldir			;f0cf
	ld bc,00900h		;f0d1
	ld hl,04000h		;f0d4
lf0d7h:
	ld a,0ffh		;f0d7
	ld (hl),a		;f0d9
	inc hl			;f0da
	dec bc			;f0db
	ld a,b			;f0dc
	or c			;f0dd
	jr nz,lf0d7h		;f0de
	call sub_7da0h		;f0e0
	call sub_7ccah		;f0e3
	ld de,le4fah		;f0e6
	call sub_7d6fh		;f0e9
	call sub_7216h		;f0ec
	call 00dafh		;f0ef
	ld d,000h		;f0f2
	call sub_851bh		;f0f4
	ld de,lce77h		;f0f7
	call sub_7d5ah		;f0fa
	call sub_7216h		;f0fd
	call sub_638ch		;f100
	ld d,000h		;f103
	call sub_851bh		;f105
	ld de,08af2h		;f108
	call sub_7d5ah		;f10b
	call sub_7216h		;f10e
	call sub_638ch		;f111
	ld d,000h		;f114
	call sub_851bh		;f116
	ld de,0a174h		;f119
	call sub_7d6fh		;f11c
	call sub_7216h		;f11f
	call sub_638ch		;f122
	ld d,000h		;f125
	call sub_851bh		;f127
	ld de,lbc76h		;f12a
	call sub_7d5ah		;f12d
	call sub_7216h		;f130
	call sub_638ch		;f133
	ld d,000h		;f136
	call sub_851bh		;f138
	ld de,l9cf3h		;f13b
	ld hl,04000h		;f13e
	ld b,040h		;f141
	call sub_7d8dh		;f143
	ld hl,04000h		;f146
	ld bc,00800h		;f149
	call 07d30h		;f14c
lf14fh:
	ld de,la0f3h		;f14f
	ld hl,04800h		;f152
lf155h:
	ld b,008h		;f155
	call sub_7d8dh		;f157
	ld hl,04800h		;f15a
	ld bc,00100h		;f15d
	call sub_7d49h		;f160
	ld de,05800h		;f163
	ld hl,04800h		;f166
	ld bc,00100h		;f169
	ldir			;f16c
	call sub_7216h		;f16e
	call sub_638ch		;f171
	ld d,000h		;f174
	call sub_851bh		;f176
	ld de,laa75h		;f179
	call sub_7d5ah		;f17c
	call sub_7216h		;f17f
	call sub_638ch		;f182
	ld d,038h		;f185
lf187h:
	call sub_851bh		;f187
	ld hl,ledfch		;f18a
	call sub_7d84h		;f18d
	call sub_859ch		;f190
	call sub_7216h		;f193
	im 1			;f196
	call sub_6280h		;f198
	call sub_638ch		;f19b
	jp 0806dh		;f19e
	ld a,002h		;f1a1
	push hl			;f1a3
	call 01601h		;f1a4
	ld a,016h		;f1a7
	rst 10h			;f1a9
	ld a,00eh		;f1aa
	rst 10h			;f1ac
	ld a,000h		;f1ad
	rst 10h			;f1af
	pop hl			;f1b0
	ld b,003h		;f1b1
lf1b3h:
	push bc			;f1b3
	push hl			;f1b4
	ld a,00dh		;f1b5
	rst 10h			;f1b7
	ld a,00dh		;f1b8
	rst 10h			;f1ba
	pop hl			;f1bb
	call sub_71d6h		;f1bc
	pop bc			;f1bf
	djnz lf1b3h		;f1c0
	push hl			;f1c2
	ld a,001h		;f1c3
	call 01601h		;f1c5
	ld a,016h		;f1c8
	rst 10h			;f1ca
	ld a,000h		;f1cb
	rst 10h			;f1cd
	ld a,000h		;f1ce
	rst 10h			;f1d0
	pop hl			;f1d1
	call sub_71d6h		;f1d2
	ret			;f1d5
	ld b,020h		;f1d6
lf1d8h:
	push bc			;f1d8
	ld a,(hl)		;f1d9
	cp 0ffh			;f1da
	ret z			;f1dc
	push hl			;f1dd
	push af			;f1de
	rst 10h			;f1df
	pop af			;f1e0
	cp 020h			;f1e1
	jp z,l71f4h		;f1e3
	ld hl,0000ah		;f1e6
	ld de,00005h		;f1e9
	call 003b5h		;f1ec
	ld b,003h		;f1ef
lf1f1h:
	halt			;f1f1
	djnz lf1f1h		;f1f2
	pop hl			;f1f4
	pop bc			;f1f5
	inc hl			;f1f6
	djnz lf1d8h		;f1f7
	ret			;f1f9
	ld a,(hl)		;f1fa
	ld b,a			;f1fb
	inc hl			;f1fc
lf1fdh:
	push bc			;f1fd
	call sub_71a1h		;f1fe
	inc hl			;f201
	ld bc,00000h		;f202
	call 01f3dh		;f205
	ld b,008h		;f208
	ld c,021h		;f20a
	push hl			;f20c
	call 00e44h		;f20d
	pop hl			;f210
	pop bc			;f211
	djnz lf1fdh		;f212
	ret			;f214
	nop			;f215
	ld a,(l7215h)		;f216
	cp 00ah			;f219
	jr z,lf235h		;f21b
	ld hl,l7215h		;f21d
	inc (hl)		;f220
	add a,a			;f221
	ld d,000h		;f222
	ld e,a			;f224
	ld ix,l723bh		;f225
	add ix,de		;f229
	ld l,(ix+000h)		;f22b
	ld h,(ix+001h)		;f22e
	call sub_71fah		;f231
	ret			;f234
lf235h:
	ld a,000h		;f235
	ld (l7215h),a		;f237
	ret			;f23a
	ld c,a			;f23b
	ld (hl),d		;f23c
	ld d,d			;f23d
	ld (hl),e		;f23e
	ld d,l			;f23f
	ld (hl),h		;f240
	ld e,b			;f241
	ld (hl),l		;f242
	ld e,e			;f243
	halt			;f244
	ld e,(hl)		;f245
	ld (hl),a		;f246
	ld h,c			;f247
	ld a,b			;f248
	push hl			;f249
	ld a,c			;f24a
	ret pe			;f24b
	ld a,d			;f24c
	ld l,d			;f24d
	ld a,e			;f24e
	ld (bc),a		;f24f
	ld c,b			;f250
	ld c,c			;f251
	ld c,d			;f252
	ld c,a			;f253
	jr nz,lf2a3h		;f254
	ld c,c			;f256
	ld c,a			;f257
	ld l,02eh		;f258
	ld l,020h		;f25a
	ld c,b			;f25c
	ld b,c			;f25d
	ld c,(hl)		;f25e
	jr nz,lf2b4h		;f25f
	ld c,c			;f261
	ld b,h			;f262
	ld c,a			;f263
	jr nz,lf2b2h		;f264
	ld b,c			;f266
	ld d,d			;f267
	ld b,a			;f268
	ld c,a			;f269
	ld d,e			;f26a
	jr nz,$+67		;f26b
	ld h,04fh		;f26d
	ld d,e			;f26f
	ld b,h			;f270
	ld b,l			;f271
	jr nz,lf2b8h		;f272
	ld d,l			;f274
	ld d,d			;f275
	ld c,a			;f276
	jr nz,lf2beh		;f277
	ld c,(hl)		;f279
	ld d,h			;f27a
	ld d,d			;f27b
	ld b,l			;f27c
	ld c,(hl)		;f27d
	ld b,c			;f27e
	ld c,l			;f27f
	ld c,c			;f280
	ld b,l			;f281
	ld c,(hl)		;f282
	ld d,h			;f283
	ld c,a			;f284
	inc l			;f285
	jr nz,lf2c9h		;f286
	ld c,b			;f288
	ld c,a			;f289
	ld d,d			;f28a
	ld b,c			;f28b
	jr nz,$+34		;f28c
	jr nz,$+34		;f28e
	ld b,l			;f290
	ld d,e			;f291
	ld b,e			;f292
	ld d,l			;f293
	ld b,e			;f294
	ld c,b			;f295
	ld b,c			;f296
	jr nz,lf2e5h		;f297
	ld b,c			;f299
	jr nz,lf2e4h		;f29a
	ld c,c			;f29c
	ld d,e			;f29d
	ld d,h			;f29e
	ld c,a			;f29f
	ld d,d			;f2a0
	ld c,c			;f2a1
	ld b,c			;f2a2
lf2a3h:
	jr nz,lf2f6h		;f2a3
	ld d,l			;f2a5
	ld b,l			;f2a6
	jr nz,lf2ffh		;f2a7
	ld c,a			;f2a9
	ld e,c			;f2aa
	jr nz,lf2eeh		;f2ab
	jr nz,lf2cfh		;f2ad
	jr nz,lf2ffh		;f2af
	ld b,c			;f2b1
lf2b2h:
	ld d,d			;f2b2
	ld d,d			;f2b3
lf2b4h:
	ld b,c			;f2b4
	ld d,d			;f2b5
	ld d,h			;f2b6
	ld b,l			;f2b7
lf2b8h:
	inc l			;f2b8
	jr nz,lf307h		;f2b9
	ld d,l			;f2bb
	ld b,l			;f2bc
	ld b,a			;f2bd
lf2beh:
	ld c,a			;f2be
	inc l			;f2bf
	jr nz,$+70		;f2c0
	ld b,l			;f2c2
	jr nz,lf319h		;f2c3
	ld c,c			;f2c5
	jr nz,$+70		;f2c6
	ld b,l			;f2c8
lf2c9h:
	ld d,b			;f2c9
	ld b,l			;f2ca
	ld c,(hl)		;f2cb
	ld b,h			;f2cc
	ld b,l			;f2cd
	ld d,d			;f2ce
lf2cfh:
	ld b,c			;f2cf
	rst 38h			;f2d0
lf2d1h:
	ld c,l			;f2d1
	ld c,c			;f2d2
	jr nz,lf31bh		;f2d3
	ld d,l			;f2d5
	ld d,h			;f2d6
	ld d,l			;f2d7
	ld d,d			;f2d8
	ld c,a			;f2d9
	ld l,02eh		;f2da
	ld l,020h		;f2dc
	ld e,c			;f2de
	jr nz,$+71		;f2df
	ld c,h			;f2e1
lf2e2h:
	jr nz,$+70		;f2e2
lf2e4h:
	ld b,l			;f2e4
lf2e5h:
	jr nz,lf333h		;f2e5
	ld c,a			;f2e7
	jr nz,lf33bh		;f2e8
	ld d,l			;f2ea
	ld b,l			;f2eb
	jr nz,$+34		;f2ec
lf2eeh:
	jr nz,$+34		;f2ee
	jr nz,lf343h		;f2f0
	ld d,l			;f2f2
	ld b,l			;f2f3
	ld b,h			;f2f4
	ld b,c			;f2f5
lf2f6h:
	jr nz,$+70		;f2f6
	ld b,l			;f2f8
	jr nz,lf343h		;f2f9
	ld d,l			;f2fb
	ld c,l			;f2fc
	ld b,c			;f2fd
	ld c,(hl)		;f2fe
lf2ffh:
	ld c,c			;f2ff
	ld b,h			;f300
	ld b,c			;f301
	ld b,h			;f302
	ld l,020h		;f303
	jr nz,lf327h		;f305
lf307h:
	jr nz,lf329h		;f307
	jr nz,lf32bh		;f309
	jr nz,lf32dh		;f30b
	jr nz,lf32fh		;f30d
	jr nz,lf331h		;f30f
	jr nz,lf333h		;f311
	jr nz,lf335h		;f313
	jr nz,lf337h		;f315
	jr nz,lf339h		;f317
lf319h:
	jr nz,lf33bh		;f319
lf31bh:
	jr nz,lf33dh		;f31b
	jr nz,lf33fh		;f31d
	jr nz,lf341h		;f31f
	jr nz,lf343h		;f321
	jr nz,lf345h		;f323
	jr nz,lf347h		;f325
lf327h:
	jr nz,lf349h		;f327
lf329h:
	jr nz,lf34bh		;f329
lf32bh:
	jr nz,lf34dh		;f32b
lf32dh:
	jr nz,lf34fh		;f32d
lf32fh:
	jr nz,lf351h		;f32f
lf331h:
	jr nz,lf353h		;f331
lf333h:
	jr nz,lf355h		;f333
lf335h:
	jr nz,lf357h		;f335
lf337h:
	jr nz,lf359h		;f337
lf339h:
	jr nz,lf35bh		;f339
lf33bh:
	jr nz,lf35dh		;f33b
lf33dh:
	jr nz,$+34		;f33d
lf33fh:
	jr nz,$+34		;f33f
lf341h:
	jr nz,lf363h		;f341
lf343h:
	jr nz,lf365h		;f343
lf345h:
	jr nz,$+34		;f345
lf347h:
	jr nz,lf369h		;f347
lf349h:
	jr nz,lf36bh		;f349
lf34bh:
	jr nz,lf36dh		;f34b
lf34dh:
	jr nz,lf36fh		;f34d
lf34fh:
	jr nz,lf371h		;f34f
lf351h:
	rst 38h			;f351
	ld (bc),a		;f352
lf353h:
	ld c,b			;f353
	ld b,c			;f354
lf355h:
	ld b,e			;f355
	ld b,l			;f356
lf357h:
	jr nz,lf3a6h		;f357
lf359h:
	ld d,l			;f359
	ld b,e			;f35a
lf35bh:
	ld c,b			;f35b
	ld c,a			;f35c
lf35dh:
	ld d,e			;f35d
	jr nz,lf3a1h		;f35e
	ld h,04fh		;f360
	ld d,e			;f362
lf363h:
	jr nz,lf3aah		;f363
lf365h:
	ld c,(hl)		;f365
	jr nz,lf3adh		;f366
	ld d,e			;f368
lf369h:
	ld d,h			;f369
	ld b,l			;f36a
lf36bh:
	jr nz,lf3bah		;f36b
lf36dh:
	ld b,c			;f36d
	ld c,h			;f36e
lf36fh:
	ld b,h			;f36f
	ld c,c			;f370
lf371h:
	ld d,h			;f371
	ld c,a			;f372
	ld d,b			;f373
	ld c,h			;f374
	ld b,c			;f375
	ld c,(hl)		;f376
	ld b,l			;f377
	ld d,h			;f378
	ld b,c			;f379
	jr nz,lf3c1h		;f37a
	ld e,b			;f37c
	ld c,c			;f37d
	ld d,e			;f37e
	ld d,h			;f37f
	ld c,c			;f380
	ld c,a			;f381
	jr nz,lf3d9h		;f382
	ld c,(hl)		;f384
	ld b,c			;f385
	jr nz,lf3cfh		;f386
	ld d,d			;f388
	ld b,c			;f389
	ld c,(hl)		;f38a
	jr nz,lf3d0h		;f38b
	ld d,l			;f38d
	ld c,h			;f38e
	ld d,h			;f38f
	ld d,l			;f390
	ld d,d			;f391
	ld b,c			;f392
	ld c,(hl)		;f393
	ld d,l			;f394
	ld b,l			;f395
	ld d,e			;f396
	ld d,h			;f397
	ld d,d			;f398
	ld c,a			;f399
	ld d,e			;f39a
	jr nz,lf3deh		;f39b
	ld c,(hl)		;f39d
	ld d,h			;f39e
	ld b,l			;f39f
	ld d,b			;f3a0
lf3a1h:
	ld b,c			;f3a1
	ld d,e			;f3a2
	ld b,c			;f3a3
	ld b,h			;f3a4
	ld c,a			;f3a5
lf3a6h:
	ld d,e			;f3a6
	jr nz,$+88		;f3a7
	ld c,c			;f3a9
lf3aah:
	ld d,(hl)		;f3aa
	ld c,c			;f3ab
	ld b,c			;f3ac
lf3adh:
	ld c,(hl)		;f3ad
	jr nz,lf3f5h		;f3ae
	ld c,(hl)		;f3b0
	jr nz,$+34		;f3b1
	ld b,a			;f3b3
	ld c,c			;f3b4
	ld b,a			;f3b5
	ld b,c			;f3b6
	ld c,(hl)		;f3b7
	ld d,h			;f3b8
	ld b,l			;f3b9
lf3bah:
	ld d,e			;f3ba
	ld b,e			;f3bb
	ld b,c			;f3bc
	ld d,e			;f3bd
	jr nz,lf403h		;f3be
	ld c,a			;f3c0
lf3c1h:
	ld c,(hl)		;f3c1
	ld d,e			;f3c2
	ld d,h			;f3c3
	ld d,d			;f3c4
	ld d,l			;f3c5
	ld b,e			;f3c6
	ld c,c			;f3c7
	ld c,a			;f3c8
	ld c,(hl)		;f3c9
	ld b,l			;f3ca
	ld d,e			;f3cb
	jr nz,lf41fh		;f3cc
	ld d,l			;f3ce
lf3cfh:
	ld b,l			;f3cf
lf3d0h:
	jr nz,lf3f2h		;f3d0
	jr nz,$+1		;f3d2
	ld c,h			;f3d4
	ld c,h			;f3d5
	ld b,l			;f3d6
	ld b,a			;f3d7
	ld b,c			;f3d8
lf3d9h:
	ld b,d			;f3d9
	ld b,c			;f3da
	ld c,(hl)		;f3db
	jr nz,lf41fh		;f3dc
lf3deh:
	ld c,h			;f3de
	jr nz,lf424h		;f3df
	ld c,c			;f3e1
	ld b,l			;f3e2
	ld c,h			;f3e3
	ld c,a			;f3e4
	inc l			;f3e5
	jr nz,$+82		;f3e6
	ld b,l			;f3e8
	ld d,d			;f3e9
	ld c,a			;f3ea
	jr nz,lf439h		;f3eb
	ld b,c			;f3ed
	jr nz,lf410h		;f3ee
	jr nz,lf412h		;f3f0
lf3f2h:
	jr nz,lf414h		;f3f2
	ld b,e			;f3f4
lf3f5h:
	ld c,a			;f3f5
	ld b,h			;f3f6
	ld c,c			;f3f7
	ld b,e			;f3f8
	ld c,c			;f3f9
	ld b,c			;f3fa
	jr nz,lf441h		;f3fb
	ld b,l			;f3fd
	jr nz,lf445h		;f3fe
	ld d,e			;f400
	ld d,h			;f401
	ld c,a			;f402
lf403h:
	ld d,e			;f403
	jr nz,$+78		;f404
	ld b,l			;f406
	ld d,e			;f407
	jr nz,lf44dh		;f408
	ld c,a			;f40a
	ld c,(hl)		;f40b
	ld b,h			;f40c
	ld d,l			;f40d
	ld c,d			;f40e
	ld c,a			;f40f
lf410h:
	jr nz,lf453h		;f410
lf412h:
	jr nz,$+34		;f412
lf414h:
	ld d,e			;f414
	ld d,l			;f415
	jr nz,lf468h		;f416
	ld d,d			;f418
	ld c,a			;f419
	ld d,b			;f41a
	ld c,c			;f41b
	ld b,c			;f41c
	jr nz,lf464h		;f41d
lf41fh:
	ld e,b			;f41f
	ld d,h			;f420
	ld c,c			;f421
	ld c,(hl)		;f422
	ld b,e			;f423
lf424h:
	ld c,c			;f424
	ld c,a			;f425
	ld c,(hl)		;f426
	ld l,020h		;f427
	jr nz,lf44bh		;f429
	jr nz,lf44dh		;f42b
	jr nz,lf44fh		;f42d
	jr nz,lf451h		;f42f
	jr nz,lf453h		;f431
	jr nz,lf455h		;f433
	jr nz,lf457h		;f435
	jr nz,lf459h		;f437
lf439h:
	jr nz,lf45bh		;f439
	jr nz,lf45dh		;f43b
	jr nz,lf45fh		;f43d
	jr nz,lf461h		;f43f
lf441h:
	jr nz,lf463h		;f441
	jr nz,lf465h		;f443
lf445h:
	jr nz,lf467h		;f445
	jr nz,lf469h		;f447
	jr nz,lf46bh		;f449
lf44bh:
	jr nz,$+34		;f44b
lf44dh:
	jr nz,lf46fh		;f44d
lf44fh:
	jr nz,lf471h		;f44f
lf451h:
	jr nz,lf473h		;f451
lf453h:
	jr nz,$+1		;f453
lf455h:
	ld (bc),a		;f455
	ld b,a			;f456
lf457h:
	ld c,c			;f457
	ld b,a			;f458
lf459h:
	ld b,c			;f459
	ld c,(hl)		;f45a
lf45bh:
	ld d,h			;f45b
	ld b,l			;f45c
lf45dh:
	ld d,e			;f45d
	ld b,e			;f45e
lf45fh:
	ld c,a			;f45f
	ld d,e			;f460
lf461h:
	jr nz,lf4a4h		;f461
lf463h:
	ld d,d			;f463
lf464h:
	ld b,d			;f464
lf465h:
	ld c,a			;f465
	ld c,h			;f466
lf467h:
	ld b,l			;f467
lf468h:
	ld d,e			;f468
lf469h:
	jr nz,$+70		;f469
lf46bh:
	ld b,l			;f46b
	jr nz,lf4b4h		;f46c
	ld d,l			;f46e
lf46fh:
	ld b,l			;f46f
	ld b,a			;f470
lf471h:
	ld c,a			;f471
	inc l			;f472
lf473h:
	jr nz,lf495h		;f473
	jr nz,lf4b8h		;f475
	ld b,e			;f477
	ld b,c			;f478
	ld b,d			;f479
	ld b,c			;f47a
	ld d,d			;f47b
	ld c,a			;f47c
	ld c,(hl)		;f47d
	jr nz,lf4c3h		;f47e
	ld c,a			;f480
	ld c,(hl)		;f481
	jr nz,lf4d0h		;f482
	ld b,c			;f484
	jr nz,lf4c9h		;f485
	ld d,d			;f487
	ld c,c			;f488
	ld c,h			;f489
	ld c,h			;f48a
	ld b,c			;f48b
	ld c,(hl)		;f48c
	ld d,h			;f48d
	ld b,l			;f48e
	jr nz,lf4b1h		;f48f
	jr nz,lf4b3h		;f491
	jr nz,lf4b5h		;f493
lf495h:
	jr nz,lf4dah		;f495
	ld c,c			;f497
	ld d,(hl)		;f498
	ld c,c			;f499
	ld c,h			;f49a
	ld c,c			;f49b
	ld e,d			;f49c
	ld b,c			;f49d
	ld b,e			;f49e
	ld c,c			;f49f
	ld c,a			;f4a0
	ld c,(hl)		;f4a1
	inc l			;f4a2
	ld c,h			;f4a3
lf4a4h:
	ld c,a			;f4a4
	ld d,e			;f4a5
	jr nz,$+73		;f4a6
	ld d,d			;f4a8
	ld b,c			;f4a9
	ld c,(hl)		;f4aa
	ld b,h			;f4ab
	ld b,l			;f4ac
	ld d,e			;f4ad
	jr nz,$+67		;f4ae
	ld d,d			;f4b0
lf4b1h:
	ld b,d			;f4b1
	ld c,a			;f4b2
lf4b3h:
	ld c,h			;f4b3
lf4b4h:
	ld b,l			;f4b4
lf4b5h:
	ld d,e			;f4b5
	ld d,h			;f4b6
sub_f4b7h:
	ld d,d			;f4b7
lf4b8h:
	ld b,c			;f4b8
	ld c,(hl)		;f4b9
	ld d,e			;f4ba
	ld b,(hl)		;f4bb
	ld c,a			;f4bc
	ld d,d			;f4bd
	ld c,l			;f4be
	ld b,c			;f4bf
	ld d,d			;f4c0
	ld c,a			;f4c1
	ld c,(hl)		;f4c2
lf4c3h:
	jr nz,$+71		;f4c3
	ld c,(hl)		;f4c5
	jr nz,lf50bh		;f4c6
	ld b,l			;f4c8
lf4c9h:
	ld c,(hl)		;f4c9
	ld c,c			;f4ca
	ld e,d			;f4cb
	ld b,c			;f4cc
	ld d,e			;f4cd
	jr nz,lf4f0h		;f4ce
lf4d0h:
	jr nz,lf4f2h		;f4d0
	jr nz,lf4f4h		;f4d2
	jr nz,lf4f6h		;f4d4
	rst 38h			;f4d6
	ld b,e			;f4d7
	ld c,a			;f4d8
	ld c,(hl)		;f4d9
lf4dah:
	ld d,e			;f4da
	ld d,h			;f4db
	ld d,d			;f4dc
	ld d,l			;f4dd
	ld b,e			;f4de
	ld b,e			;f4df
	ld c,c			;f4e0
	ld c,a			;f4e1
	ld c,(hl)		;f4e2
	ld b,l			;f4e3
	ld d,e			;f4e4
	inc l			;f4e5
	jr nz,$+74		;f4e6
	ld c,a			;f4e8
	ld c,l			;f4e9
	ld b,d			;f4ea
	ld d,d			;f4eb
sub_f4ech:
	ld b,l			;f4ec
lf4edh:
	ld d,e			;f4ed
	jr nz,lf549h		;f4ee
lf4f0h:
	jr nz,$+34		;f4f0
lf4f2h:
	jr nz,$+34		;f4f2
lf4f4h:
	jr nz,$+34		;f4f4
lf4f6h:
	jr nz,lf539h		;f4f6
	ld c,(hl)		;f4f8
	ld c,c			;f4f9
lf4fah:
	ld c,l			;f4fa
	ld b,c			;f4fb
	ld c,h			;f4fc
	ld b,l			;f4fd
	ld d,e			;f4fe
lf4ffh:
	jr nz,lf551h		;f4ff
	ld c,a			;f501
	ld d,d			;f502
	jr nz,$+75		;f503
	ld b,a			;f505
	ld d,l			;f506
	ld b,c			;f507
	ld c,h			;f508
	ld l,020h		;f509
lf50bh:
	jr nz,lf52dh		;f50b
	jr nz,lf52fh		;f50d
sub_f50fh:
	jr nz,lf531h		;f50f
	jr nz,lf533h		;f511
	jr nz,lf535h		;f513
	jr nz,lf537h		;f515
	jr nz,lf539h		;f517
	jr nz,lf53bh		;f519
	jr nz,lf53dh		;f51b
	jr nz,lf53fh		;f51d
	jr nz,lf541h		;f51f
	jr nz,lf543h		;f521
	jr nz,lf545h		;f523
	jr nz,lf547h		;f525
	jr nz,lf549h		;f527
	jr nz,lf54bh		;f529
	jr nz,lf54dh		;f52b
lf52dh:
	jr nz,lf54fh		;f52d
lf52fh:
	jr nz,lf551h		;f52f
lf531h:
	jr nz,lf553h		;f531
lf533h:
	jr nz,lf555h		;f533
lf535h:
	jr nz,lf557h		;f535
lf537h:
	jr nz,lf559h		;f537
lf539h:
	jr nz,lf55bh		;f539
lf53bh:
	jr nz,lf55dh		;f53b
lf53dh:
	jr nz,lf55fh		;f53d
lf53fh:
	jr nz,lf561h		;f53f
lf541h:
	jr nz,$+34		;f541
lf543h:
	jr nz,lf565h		;f543
lf545h:
	jr nz,lf567h		;f545
lf547h:
	jr nz,$+34		;f547
lf549h:
	jr nz,lf56bh		;f549
lf54bh:
	jr nz,lf56dh		;f54b
lf54dh:
	jr nz,lf56fh		;f54d
lf54fh:
	jr nz,lf571h		;f54f
lf551h:
	jr nz,lf573h		;f551
lf553h:
	jr nz,lf575h		;f553
lf555h:
	jr nz,lf577h		;f555
lf557h:
	rst 38h			;f557
	ld (bc),a		;f558
lf559h:
	ld d,e			;f559
	ld c,a			;f55a
lf55bh:
	ld c,h			;f55b
	ld c,a			;f55c
lf55dh:
	jr nz,lf5b4h		;f55d
lf55fh:
	ld c,(hl)		;f55f
	ld c,a			;f560
lf561h:
	ld d,e			;f561
	jr nz,lf5b4h		;f562
	ld c,a			;f564
lf565h:
	ld b,e			;f565
	ld c,a			;f566
lf567h:
	ld d,e			;f567
	jr nz,lf5bdh		;f568
	ld c,a			;f56a
lf56bh:
	ld b,d			;f56b
	ld d,d			;f56c
lf56dh:
	ld b,l			;f56d
	ld d,(hl)		;f56e
lf56fh:
	ld c,c			;f56f
	ld d,(hl)		;f570
lf571h:
	ld c,c			;f571
	ld b,l			;f572
lf573h:
	ld d,d			;f573
	ld c,a			;f574
lf575h:
	ld c,(hl)		;f575
	inc l			;f576
lf577h:
	jr nz,lf599h		;f577
	ld b,c			;f579
	ld d,c			;f57a
	ld d,l			;f57b
	ld b,l			;f57c
	ld c,h			;f57d
	ld c,h			;f57e
	ld c,a			;f57f
	ld d,e			;f580
	jr nz,lf5c8h		;f581
	ld c,h			;f583
	ld b,l			;f584
	ld b,a			;f585
	ld c,c			;f586
	ld b,h			;f587
	ld c,a			;f588
	ld d,e			;f589
	jr nz,$+71		;f58a
	ld c,l			;f58c
	ld d,b			;f58d
	ld d,d			;f58e
	ld b,l			;f58f
	ld c,(hl)		;f590
	ld b,h			;f591
	ld c,c			;f592
	ld b,l			;f593
	ld d,d			;f594
	ld c,a			;f595
	ld c,(hl)		;f596
	jr nz,lf5b9h		;f597
lf599h:
	ld d,l			;f599
	ld c,(hl)		;f59a
	ld b,c			;f59b
	jr nz,lf5e2h		;f59c
	ld c,c			;f59e
lf59fh:
	ld b,(hl)		;f59f
	ld c,c			;f5a0
	ld b,e			;f5a1
	ld c,c			;f5a2
	ld c,h			;f5a3
	jr nz,$+86		;f5a4
	ld b,c			;f5a6
	ld d,d			;f5a7
	ld b,l			;f5a8
	ld b,c			;f5a9
	jr nz,lf5f1h		;f5aa
	jr nz,lf5f7h		;f5ac
	ld c,(hl)		;f5ae
	ld d,h			;f5af
	ld b,l			;f5b0
	ld c,(hl)		;f5b1
	ld d,h			;f5b2
	ld b,c			;f5b3
lf5b4h:
	ld d,d			;f5b4
	ld c,a			;f5b5
	ld c,(hl)		;f5b6
	jr nz,lf5d9h		;f5b7
lf5b9h:
	ld d,(hl)		;f5b9
	ld c,a			;f5ba
	ld c,h			;f5bb
	ld d,(hl)		;f5bc
lf5bdh:
	ld b,l			;f5bd
	ld d,d			;f5be
	jr nz,lf602h		;f5bf
	jr nz,$+85		;f5c1
	ld b,l			;f5c3
	ld d,d			;f5c4
	jr nz,lf60ah		;f5c5
	ld c,a			;f5c7
lf5c8h:
	ld c,l			;f5c8
	ld c,a			;f5c9
	jr nz,lf611h		;f5ca
	ld d,d			;f5cc
	ld b,c			;f5cd
	ld c,(hl)		;f5ce
	inc l			;f5cf
	jr nz,lf622h		;f5d0
	ld b,l			;f5d2
	ld d,d			;f5d3
	ld c,a			;f5d4
	ld l,02eh		;f5d5
	ld l,020h		;f5d7
lf5d9h:
	rst 38h			;f5d9
	ld c,d			;f5da
	ld b,c			;f5db
	ld c,l			;f5dc
	ld b,c			;f5dd
	ld d,e			;f5de
	jr nz,lf62dh		;f5df
	ld c,a			;f5e1
lf5e2h:
	jr nz,lf627h		;f5e2
	ld c,a			;f5e4
	ld c,(hl)		;f5e5
	ld d,e			;f5e6
	ld c,c			;f5e7
	ld b,a			;f5e8
	ld d,l			;f5e9
	ld c,c			;f5ea
	ld b,l			;f5eb
	ld d,d			;f5ec
	ld c,a			;f5ed
	ld c,(hl)		;f5ee
	ld l,020h		;f5ef
lf5f1h:
	jr nz,lf613h		;f5f1
	jr nz,lf615h		;f5f3
	jr nz,lf617h		;f5f5
lf5f7h:
	jr nz,lf619h		;f5f7
	jr nz,$+78		;f5f9
	ld b,c			;f5fb
	ld d,e			;f5fc
	jr nz,lf644h		;f5fd
	ld d,b			;f5ff
	ld c,c			;f600
	ld b,h			;f601
lf602h:
	ld b,l			;f602
	ld c,l			;f603
	ld c,c			;f604
	ld b,c			;f605
	ld d,e			;f606
	jr nz,lf65ch		;f607
	ld b,l			;f609
lf60ah:
	jr nz,lf65fh		;f60a
	ld d,l			;f60c
	ld b,e			;f60d
	ld b,l			;f60e
	ld b,h			;f60f
	ld c,c			;f610
lf611h:
	ld b,l			;f611
	ld d,d			;f612
lf613h:
	ld c,a			;f613
	ld c,(hl)		;f614
lf615h:
	jr nz,lf670h		;f615
lf617h:
	jr nz,lf639h		;f617
lf619h:
	jr nz,lf65fh		;f619
	ld c,c			;f61b
	ld b,l			;f61c
	ld e,d			;f61d
	ld c,l			;f61e
	ld b,c			;f61f
	ld d,d			;f620
	ld c,a			;f621
lf622h:
	ld c,(hl)		;f622
	jr nz,lf666h		;f623
	ld d,l			;f625
	ld c,(hl)		;f626
lf627h:
	jr nz,lf676h		;f627
	ld b,c			;f629
	ld d,e			;f62a
	jr nz,lf679h		;f62b
lf62dh:
	ld b,c			;f62d
	jr nz,lf689h		;f62e
	ld b,c			;f630
	jr nz,$+67		;f631
	ld e,d			;f633
	ld c,a			;f634
	ld d,h			;f635
	ld b,c			;f636
	ld b,h			;f637
	ld b,c			;f638
lf639h:
	jr nz,lf67eh		;f639
	ld c,c			;f63b
	ld d,(hl)		;f63c
	ld c,c			;f63d
	ld c,h			;f63e
	ld c,c			;f63f
	ld e,d			;f640
	ld b,c			;f641
	ld b,e			;f642
	ld c,c			;f643
lf644h:
	ld c,a			;f644
	ld c,(hl)		;f645
	ld l,020h		;f646
	jr nz,$+34		;f648
	jr nz,lf66ch		;f64a
	jr nz,lf66eh		;f64c
	jr nz,lf670h		;f64e
	jr nz,lf672h		;f650
	jr nz,$+34		;f652
	jr nz,lf676h		;f654
	jr nz,lf678h		;f656
	jr nz,lf67ah		;f658
	rst 38h			;f65a
	ld (bc),a		;f65b
lf65ch:
	ld c,h			;f65c
	ld c,a			;f65d
	ld d,e			;f65e
lf65fh:
	jr nz,lf6b3h		;f65f
	ld b,l			;f661
	ld c,l			;f662
	ld c,a			;f663
	ld d,h			;f664
	ld c,a			;f665
lf666h:
	ld d,e			;f666
	jr nz,lf6c2h		;f667
	jr nz,lf6bah		;f669
	ld c,h			;f66b
lf66ch:
	ld d,(hl)		;f66c
	ld c,c			;f66d
lf66eh:
	ld b,h			;f66e
	ld b,c			;f66f
lf670h:
	ld b,h			;f670
	ld c,a			;f671
lf672h:
	ld d,e			;f672
	jr nz,lf6c9h		;f673
	ld c,c			;f675
lf676h:
	ld b,l			;f676
	ld c,l			;f677
lf678h:
	ld d,b			;f678
lf679h:
	ld c,a			;f679
lf67ah:
	ld d,e			;f67a
	jr nz,lf6c1h		;f67b
	ld b,l			;f67d
lf67eh:
	jr nz,lf6c2h		;f67e
	ld d,d			;f680
	ld d,l			;f681
	ld c,d			;f682
	ld c,a			;f683
	ld d,e			;f684
	inc l			;f685
	jr nz,lf6cch		;f686
	ld d,d			;f688
lf689h:
	ld b,c			;f689
	ld b,a			;f68a
	ld c,a			;f68b
	ld c,(hl)		;f68c
	ld b,l			;f68d
	ld d,e			;f68e
	jr nz,lf6eah		;f68f
	jr nz,lf6dbh		;f691
	ld b,l			;f693
	ld b,e			;f694
	ld c,b			;f695
	ld c,c			;f696
	ld b,e			;f697
	ld b,l			;f698
	ld d,d			;f699
	ld c,a			;f69a
	ld d,e			;f69b
	ld d,d			;f69c
	ld b,l			;f69d
	ld b,a			;f69e
	ld d,d			;f69f
	ld b,l			;f6a0
	ld d,e			;f6a1
	ld b,c			;f6a2
	ld d,d			;f6a3
	ld c,a			;f6a4
	ld c,(hl)		;f6a5
	ld l,020h		;f6a6
	ld b,(hl)		;f6a8
	ld d,l			;f6a9
	ld b,l			;f6aa
	jr nz,lf6f2h		;f6ab
	ld c,(hl)		;f6ad
	ld d,h			;f6ae
	ld c,a			;f6af
	ld c,(hl)		;f6b0
	ld b,e			;f6b1
	ld b,l			;f6b2
lf6b3h:
	ld d,e			;f6b3
	jr nz,$+69		;f6b4
	ld d,l			;f6b6
	ld b,c			;f6b7
	ld c,(hl)		;f6b8
	ld b,h			;f6b9
lf6bah:
	ld c,a			;f6ba
	jr nz,lf6feh		;f6bb
	ld d,b			;f6bd
	ld b,c			;f6be
	ld d,d			;f6bf
	ld b,l			;f6c0
lf6c1h:
	ld b,e			;f6c1
lf6c2h:
	ld c,c			;f6c2
	ld c,a			;f6c3
	jr nz,lf70bh		;f6c4
	ld c,h			;f6c6
	jr nz,lf719h		;f6c7
lf6c9h:
	ld d,d			;f6c9
	ld c,c			;f6ca
	ld c,l			;f6cb
lf6cch:
	ld b,l			;f6cc
	ld d,d			;f6cd
	jr nz,$+47		;f6ce
	ld b,h			;f6d0
	ld b,c			;f6d1
	ld d,d			;f6d2
	ld c,e			;f6d3
	dec l			;f6d4
	jr nz,$+34		;f6d5
	jr nz,$+34		;f6d7
	jr nz,$+34		;f6d9
lf6dbh:
	jr nz,$+1		;f6db
	ld b,l			;f6dd
	ld d,e			;f6de
	ld d,h			;f6df
	ld b,l			;f6e0
	jr nz,$+80		;f6e1
	ld c,a			;f6e3
	jr nz,lf73ah		;f6e4
	ld b,c			;f6e6
lf6e7h:
	ld d,d			;f6e7
	ld b,h			;f6e8
	ld c,a			;f6e9
lf6eah:
	jr nz,$+71		;f6ea
	ld c,(hl)		;f6ec
	jr nz,$+84		;f6ed
	ld b,l			;f6ef
	ld b,e			;f6f0
	ld c,h			;f6f1
lf6f2h:
	ld d,l			;f6f2
	ld d,h			;f6f3
	ld b,c			;f6f4
	ld d,d			;f6f5
	jr nz,$+91		;f6f6
	jr nz,lf71ah		;f6f8
	jr nz,lf71ch		;f6fa
	jr nz,$+67		;f6fc
lf6feh:
	ld b,h			;f6fe
	ld c,c			;f6ff
lf700h:
	ld b,l			;f700
	ld d,e			;f701
	ld d,h			;f702
	ld d,d			;f703
	ld b,c			;f704
	ld d,d			;f705
	jr nz,lf74eh		;f706
	ld d,l			;f708
	ld b,l			;f709
	ld d,d			;f70a
lf70bh:
	ld d,h			;f70b
	ld b,l			;f70c
	ld d,e			;f70d
	jr nz,lf769h		;f70e
	jr nz,lf75fh		;f710
	ld b,c			;f712
	ld c,h			;f713
	ld b,l			;f714
	ld d,(hl)		;f715
	ld c,a			;f716
	ld c,h			;f717
	ld c,a			;f718
lf719h:
	ld d,e			;f719
lf71ah:
	jr nz,lf73ch		;f71a
lf71ch:
	jr nz,lf771h		;f71c
sub_f71eh:
	ld b,l			;f71e
	ld d,d			;f71f
	ld b,l			;f720
	ld d,e			;f721
	ld l,020h		;f722
	jr nz,lf746h		;f724
	jr nz,lf748h		;f726
	jr nz,lf74ah		;f728
	jr nz,lf74ch		;f72a
	jr nz,lf74eh		;f72c
	jr nz,lf750h		;f72e
	jr nz,lf752h		;f730
	jr nz,lf754h		;f732
	jr nz,lf756h		;f734
	jr nz,lf758h		;f736
	jr nz,lf75ah		;f738
lf73ah:
	jr nz,lf75ch		;f73a
lf73ch:
	jr nz,lf75eh		;f73c
	jr nz,lf760h		;f73e
	jr nz,$+34		;f740
	jr nz,$+34		;f742
	jr nz,lf766h		;f744
lf746h:
	jr nz,lf768h		;f746
lf748h:
	jr nz,lf76ah		;f748
lf74ah:
	jr nz,lf76ch		;f74a
lf74ch:
	jr nz,lf76eh		;f74c
lf74eh:
	jr nz,lf770h		;f74e
lf750h:
	jr nz,lf772h		;f750
lf752h:
	jr nz,lf774h		;f752
lf754h:
	jr nz,lf776h		;f754
lf756h:
	jr nz,$+34		;f756
lf758h:
	jr nz,lf77ah		;f758
lf75ah:
	jr nz,lf77ch		;f75a
lf75ch:
	jr nz,$+1		;f75c
lf75eh:
	ld (bc),a		;f75e
lf75fh:
	ld b,l			;f75f
lf760h:
	ld c,h			;f760
	jr nz,lf7bch		;f761
	jr nz,lf7b8h		;f763
	ld d,l			;f765
lf766h:
	jr nz,lf7bch		;f766
lf768h:
	ld d,d			;f768
lf769h:
	ld c,a			;f769
lf76ah:
	ld d,b			;f76a
	ld b,c			;f76b
lf76ch:
	jr nz,lf7c1h		;f76c
lf76eh:
	ld b,c			;f76e
	ld d,c			;f76f
lf770h:
	ld d,l			;f770
lf771h:
	ld b,l			;f771
lf772h:
	ld b,c			;f772
	ld d,d			;f773
lf774h:
	ld c,a			;f774
	ld c,(hl)		;f775
lf776h:
	inc l			;f776
	jr nz,lf7c6h		;f777
	ld b,c			;f779
lf77ah:
	ld d,h			;f77a
	ld b,c			;f77b
lf77ch:
	ld d,d			;f77c
	ld c,a			;f77d
	ld c,(hl)		;f77e
	ld e,c			;f77f
	jr nz,lf7d8h		;f780
	ld c,c			;f782
	ld c,a			;f783
	ld c,h			;f784
	ld b,c			;f785
	ld d,d			;f786
	ld c,a			;f787
	ld c,(hl)		;f788
	jr nz,lf7cch		;f789
	jr nz,$+78		;f78b
	ld c,a			;f78d
	ld d,e			;f78e
	jr nz,lf7dah		;f78f
	ld c,(hl)		;f791
	ld b,h			;f792
	ld b,l			;f793
	ld b,(hl)		;f794
	ld b,l			;f795
	ld c,(hl)		;f796
	ld d,e			;f797
	ld c,a			;f798
	ld d,e			;f799
	jr nz,lf7bch		;f79a
	jr nz,$+34		;f79c
	jr nz,$+74		;f79e
	ld b,c			;f7a0
	ld b,d			;f7a1
	ld c,c			;f7a2
	ld d,h			;f7a3
	ld b,c			;f7a4
	ld c,(hl)		;f7a5
	ld d,h			;f7a6
	ld b,l			;f7a7
	ld d,e			;f7a8
	jr nz,$+70		;f7a9
	ld b,l			;f7ab
	jr nz,$+78		;f7ac
	ld c,a			;f7ae
	ld d,e			;f7af
	jr nz,lf802h		;f7b0
	ld c,a			;f7b2
	ld b,d			;f7b3
	ld c,h			;f7b4
	ld b,c			;f7b5
	ld b,h			;f7b6
	ld c,a			;f7b7
lf7b8h:
	ld d,e			;f7b8
	jr nz,lf80bh		;f7b9
	ld c,a			;f7bb
lf7bch:
	ld d,d			;f7bc
	jr nz,$+34		;f7bd
	ld b,h			;f7bf
	ld c,a			;f7c0
lf7c1h:
	ld c,(hl)		;f7c1
	ld b,h			;f7c2
	ld b,l			;f7c3
	jr nz,lf816h		;f7c4
lf7c6h:
	ld b,c			;f7c6
	ld d,e			;f7c7
	ld b,c			;f7c8
	ld b,d			;f7c9
	ld b,c			;f7ca
	ld c,(hl)		;f7cb
lf7cch:
	jr nz,lf7fch		;f7cc
	jr nz,lf7f0h		;f7ce
	jr nz,lf7f2h		;f7d0
	jr nz,lf7f4h		;f7d2
	jr nz,lf7f6h		;f7d4
	jr nz,lf7f8h		;f7d6
lf7d8h:
	jr nz,$+34		;f7d8
lf7dah:
	jr nz,lf7fch		;f7da
	jr nz,lf7feh		;f7dc
	jr nz,$+1		;f7de
	ld d,b			;f7e0
	ld d,d			;f7e1
	ld c,c			;f7e2
	ld c,l			;f7e3
	ld b,l			;f7e4
	ld d,d			;f7e5
	ld c,a			;f7e6
	jr nz,lf82fh		;f7e7
	ld d,l			;f7e9
	ld b,l			;f7ea
	ld d,d			;f7eb
	ld c,a			;f7ec
	ld c,(hl)		;f7ed
	jr nz,lf83ch		;f7ee
lf7f0h:
	ld b,c			;f7f0
	ld d,e			;f7f1
lf7f2h:
	jr nz,$+67		;f7f2
lf7f4h:
	ld c,h			;f7f4
	ld b,h			;f7f5
lf7f6h:
	ld b,l			;f7f6
	ld b,c			;f7f7
lf7f8h:
	ld d,e			;f7f8
	jr nz,$+70		;f7f9
	ld b,l			;f7fb
lf7fch:
	jr nz,lf84ah		;f7fc
lf7feh:
	ld b,c			;f7fe
	jr nz,lf844h		;f7ff
	ld c,a			;f801
lf802h:
	ld d,e			;f802
	ld d,h			;f803
	ld b,c			;f804
	jr nz,$+91		;f805
	jr nz,lf84dh		;f807
	ld b,l			;f809
	ld d,e			;f80a
lf80bh:
	ld d,b			;f80b
	ld d,l			;f80c
	ld b,l			;f80d
	ld d,e			;f80e
lf80fh:
	jr nz,lf85dh		;f80f
	ld b,c			;f811
	ld d,e			;f812
	jr nz,lf859h		;f813
	ld b,l			;f815
lf816h:
	ld c,h			;f816
	jr nz,lf862h		;f817
	ld c,(hl)		;f819
	ld d,h			;f81a
	ld b,l			;f81b
	ld d,d			;f81c
	ld c,c			;f81d
	ld c,a			;f81e
	ld d,d			;f81f
	ld d,h			;f820
	ld c,a			;f821
	ld b,h			;f822
	ld c,a			;f823
	ld d,e			;f824
	jr nz,lf86ch		;f825
	ld d,d			;f827
	ld b,c			;f828
	ld c,(hl)		;f829
	jr nz,lf87fh		;f82a
	ld c,a			;f82c
	ld c,l			;f82d
	ld b,l			;f82e
lf82fh:
	ld d,h			;f82f
	ld c,c			;f830
	ld b,h			;f831
	ld c,a			;f832
	ld d,e			;f833
	jr nz,lf878h		;f834
	ld b,c			;f836
	ld c,d			;f837
	ld c,a			;f838
	jr nz,lf88eh		;f839
	ld d,l			;f83b
lf83ch:
	jr nz,$+34		;f83c
	jr nz,$+34		;f83e
	ld b,e			;f840
	ld d,d			;f841
	ld d,l			;f842
	ld b,l			;f843
lf844h:
	ld c,h			;f844
	jr nz,lf8a0h		;f845
	jr nz,lf89ch		;f847
	ld b,c			;f849
lf84ah:
	ld c,(hl)		;f84a
	ld b,a			;f84b
	ld d,d			;f84c
lf84dh:
	ld c,c			;f84d
	ld b,l			;f84e
	ld c,(hl)		;f84f
	ld d,h			;f850
	ld b,c			;f851
	jr nz,lf8a1h		;f852
	ld c,c			;f854
	ld d,d			;f855
	ld b,c			;f856
	ld b,h			;f857
	ld b,c			;f858
lf859h:
	ld l,020h		;f859
	jr nz,$+34		;f85b
lf85dh:
	jr nz,lf87fh		;f85d
	jr nz,$+1		;f85f
	inc bc			;f861
lf862h:
	ld c,e			;f862
	ld b,c			;f863
	ld c,l			;f864
	ld d,l			;f865
	ld c,c			;f866
	ld d,d			;f867
	inc l			;f868
	jr nz,lf8b0h		;f869
	ld c,h			;f86b
lf86ch:
	jr nz,lf8c1h		;f86c
	ld b,l			;f86e
	ld b,a			;f86f
	ld d,l			;f870
	ld c,(hl)		;f871
	ld b,h			;f872
	ld c,a			;f873
	jr nz,lf8a3h		;f874
	ld b,h			;f876
	ld b,c			;f877
lf878h:
	ld d,d			;f878
	ld c,e			;f879
	dec l			;f87a
	inc l			;f87b
	jr nz,$+80		;f87c
	ld c,a			;f87e
lf87fh:
	jr nz,$+85		;f87f
	ld b,l			;f881
	ld c,b			;f882
	ld c,c			;f883
	ld e,d			;f884
	ld c,a			;f885
	jr nz,lf8cdh		;f886
	ld d,e			;f888
	ld d,b			;f889
	ld b,l			;f88a
	ld d,d			;f88b
lf88ch:
	ld b,c			;f88c
	ld d,d			;f88d
lf88eh:
	inc l			;f88e
	jr nz,lf8e5h		;f88f
	ld d,d			;f891
	ld b,c			;f892
	ld d,e			;f893
	jr nz,lf8e2h		;f894
	ld b,c			;f896
	jr nz,lf8e6h		;f897
	ld d,l			;f899
	ld b,l			;f89a
	ld d,d			;f89b
lf89ch:
	ld d,h			;f89c
	ld b,l			;f89d
	jr nz,lf8e4h		;f89e
lf8a0h:
	ld b,l			;f8a0
lf8a1h:
	jr nz,lf8f6h		;f8a1
lf8a3h:
	ld d,l			;f8a3
	jr nz,lf8f6h		;f8a4
	ld b,c			;f8a6
	ld b,h			;f8a7
	ld d,d			;f8a8
	ld b,l			;f8a9
	jr nz,$+85		;f8aa
	ld b,c			;f8ac
	ld d,c			;f8ad
	ld d,l			;f8ae
	ld b,l			;f8af
lf8b0h:
	ld c,a			;f8b0
	jr nz,lf901h		;f8b1
	ld d,l			;f8b3
	ld b,l			;f8b4
	ld d,e			;f8b5
	ld d,h			;f8b6
	ld d,d			;f8b7
	ld c,a			;f8b8
	jr nz,lf90bh		;f8b9
	ld c,a			;f8bb
	ld b,d			;f8bc
	ld c,h			;f8bd
	ld b,c			;f8be
	ld b,h			;f8bf
	ld c,a			;f8c0
lf8c1h:
	jr nz,lf91ch		;f8c1
	jr nz,$+85		;f8c3
	ld b,l			;f8c5
	ld b,a			;f8c6
	ld c,a			;f8c7
	jr nz,lf916h		;f8c8
	ld b,c			;f8ca
	jr nz,$+88		;f8cb
lf8cdh:
	ld c,c			;f8cd
	ld b,h			;f8ce
	ld b,c			;f8cf
	jr nz,lf916h		;f8d0
	ld b,l			;f8d2
	jr nz,lf922h		;f8d3
	ld c,c			;f8d5
	jr nz,lf91eh		;f8d6
	ld b,c			;f8d8
	ld c,l			;f8d9
	ld c,c			;f8da
	ld c,h			;f8db
	ld c,c			;f8dc
	ld b,c			;f8dd
	ld l,020h		;f8de
	jr nz,lf902h		;f8e0
lf8e2h:
	rst 38h			;f8e2
	ld b,e			;f8e3
lf8e4h:
	ld c,a			;f8e4
lf8e5h:
	ld c,(hl)		;f8e5
lf8e6h:
	jr nz,lf92eh		;f8e6
	ld d,d			;f8e8
	ld c,c			;f8e9
	ld b,c			;f8ea
	jr nz,lf940h		;f8eb
	ld c,a			;f8ed
	ld c,(hl)		;f8ee
	ld d,d			;f8ef
	ld c,c			;f8f0
	ld d,e			;f8f1
	ld b,c			;f8f2
	jr nz,lf941h		;f8f3
	ld b,l			;f8f5
lf8f6h:
	ld c,(hl)		;f8f6
	ld d,h			;f8f7
	ld b,c			;f8f8
	ld c,l			;f8f9
lf8fah:
	ld b,l			;f8fa
	ld c,(hl)		;f8fb
sub_f8fch:
	ld d,h			;f8fc
	ld b,l			;f8fd
	jr nz,$+68		;f8fe
	ld b,c			;f900
lf901h:
	ld c,d			;f901
lf902h:
	ld c,a			;f902
	ld d,e			;f903
	ld d,l			;f904
	jr nz,lf94ah		;f905
	ld b,c			;f907
	ld b,d			;f908
	ld b,l			;f909
	ld e,d			;f90a
lf90bh:
	ld b,c			;f90b
	jr nz,lf967h		;f90c
	jr nz,$+79		;f90e
	ld b,l			;f910
	jr nz,$+79		;f911
	ld c,c			;f913
	ld d,d			;f914
	ld c,a			;f915
lf916h:
	inc l			;f916
	jr nz,lf972h		;f917
	ld c,a			;f919
	jr nz,lf96ch		;f91a
lf91ch:
	ld c,a			;f91c
	ld d,d			;f91d
lf91eh:
	ld d,h			;f91e
	ld b,c			;f91f
	ld b,d			;f920
	ld b,c			;f921
lf922h:
	jr nz,$+71		;f922
	ld c,(hl)		;f924
	jr nz,lf974h		;f925
	ld c,c			;f927
	ld d,e			;f928
	jr nz,lf96dh		;f929
	ld d,d			;f92b
	ld b,c			;f92c
	ld e,d			;f92d
lf92eh:
	ld c,a			;f92e
	ld d,e			;f92f
	jr nz,lf977h		;f930
	ld c,h			;f932
	jr nz,lf981h		;f933
	ld c,c			;f935
	ld b,d			;f936
	ld d,d			;f937
	ld c,a			;f938
	jr nz,lf988h		;f939
	ld c,c			;f93b
	ld d,e			;f93c
	ld d,h			;f93d
	ld c,c			;f93e
	ld b,e			;f93f
lf940h:
	ld c,a			;f940
lf941h:
	jr nz,lf963h		;f941
	ld b,l			;f943
	ld c,h			;f944
	jr nz,lf98ah		;f945
	ld c,a			;f947
	ld c,(hl)		;f948
	ld d,h			;f949
lf94ah:
	ld b,l			;f94a
	ld c,(hl)		;f94b
	ld c,c			;f94c
	ld b,h			;f94d
	ld c,a			;f94e
	jr nz,lf995h		;f94f
	ld b,l			;f951
	jr nz,lf999h		;f952
	ld d,e			;f954
	ld b,l			;f955
	jr nz,$+78		;f956
	ld c,c			;f958
	ld b,d			;f959
	ld d,d			;f95a
	ld c,a			;f95b
	jr nz,lf9aah		;f95c
	ld c,a			;f95e
	jr nz,lf9a6h		;f95f
	ld d,d			;f961
	ld b,c			;f962
lf963h:
	rst 38h			;f963
	ld d,h			;f964
	ld c,a			;f965
	ld b,h			;f966
lf967h:
	ld c,a			;f967
	jr nz,lf9bah		;f968
	ld b,c			;f96a
	ld d,d			;f96b
lf96ch:
	ld b,c			;f96c
lf96dh:
	jr nz,lf9bch		;f96d
	ld c,c			;f96f
	ld l,020h		;f970
lf972h:
	ld b,l			;f972
	ld d,d			;f973
lf974h:
	ld b,c			;f974
	jr nz,lf9c4h		;f975
lf977h:
	ld c,c			;f977
	jr nz,$+82		;f978
	ld d,d			;f97a
	ld c,a			;f97b
	ld d,h			;f97c
	ld b,l			;f97d
	ld b,e			;f97e
	ld d,h			;f97f
	ld c,a			;f980
lf981h:
	ld d,d			;f981
	jr nz,$+34		;f982
	ld b,e			;f984
	ld c,a			;f985
	ld c,(hl)		;f986
	ld d,h			;f987
lf988h:
	ld d,d			;f988
	ld b,c			;f989
lf98ah:
	jr nz,lf9d8h		;f98a
	ld b,c			;f98c
	ld d,e			;f98d
	jr nz,lf9d6h		;f98e
	ld d,l			;f990
	ld b,l			;f991
	ld d,d			;f992
	ld e,d			;f993
	ld b,c			;f994
lf995h:
	ld d,e			;f995
	jr nz,lf9e7h		;f996
	ld b,e			;f998
lf999h:
	ld d,l			;f999
	ld c,h			;f99a
	ld d,h			;f99b
	ld b,c			;f99c
	ld d,e			;f99d
	jr nz,lf9e4h		;f99e
	ld b,l			;f9a0
	jr nz,$+34		;f9a1
	jr nz,lf9f1h		;f9a3
	ld b,c			;f9a5
lf9a6h:
	ld d,e			;f9a6
	jr nz,lf9fdh		;f9a7
	ld c,c			;f9a9
lf9aah:
	ld c,(hl)		;f9aa
	ld c,c			;f9ab
	ld b,l			;f9ac
	ld b,d			;f9ad
	ld c,h			;f9ae
	ld b,c			;f9af
	ld d,e			;f9b0
	ld l,020h		;f9b1
	ld d,b			;f9b3
	ld d,l			;f9b4
	ld b,h			;f9b5
	ld b,l			;f9b6
	jr nz,lf9feh		;f9b7
	ld d,e			;f9b9
lf9bah:
	ld b,e			;f9ba
	ld b,c			;f9bb
lf9bch:
	ld d,b			;f9bc
	ld b,c			;f9bd
	ld d,d			;f9be
	jr nz,lfa05h		;f9bf
	ld b,l			;f9c1
	jr nz,lf9e4h		;f9c2
lf9c4h:
	ld b,c			;f9c4
	ld d,c			;f9c5
	ld d,l			;f9c6
	ld b,l			;f9c7
	ld c,h			;f9c8
	jr nz,lfa14h		;f9c9
	ld c,(hl)		;f9cb
	ld b,(hl)		;f9cc
	ld c,c			;f9cd
	ld b,l			;f9ce
	ld d,d			;f9cf
	ld c,(hl)		;f9d0
	ld c,a			;f9d1
	ld l,020h		;f9d2
	jr nz,$+34		;f9d4
lf9d6h:
	jr nz,lf9f8h		;f9d6
lf9d8h:
	jr nz,lf9fah		;f9d8
	jr nz,$+34		;f9da
	jr nz,lf9feh		;f9dc
	jr nz,lfa00h		;f9de
	jr nz,lfa02h		;f9e0
	jr nz,lfa04h		;f9e2
lf9e4h:
	rst 38h			;f9e4
	ld (bc),a		;f9e5
	ld b,l			;f9e6
lf9e7h:
	ld d,e			;f9e7
	ld d,h			;f9e8
	ld d,l			;f9e9
	ld d,(hl)		;f9ea
	ld b,l			;f9eb
	jr nz,$+67		;f9ec
	ld c,h			;f9ee
	jr nz,lfa33h		;f9ef
lf9f1h:
	ld c,a			;f9f1
	ld d,d			;f9f2
	ld b,h			;f9f3
	ld b,l			;f9f4
	jr nz,lfa3bh		;f9f5
	ld b,l			;f9f7
lf9f8h:
	jr nz,lfa46h		;f9f8
lf9fah:
	ld b,c			;f9fa
	jr nz,lfa4ah		;f9fb
lf9fdh:
	ld d,l			;f9fd
lf9feh:
	ld b,l			;f9fe
	ld d,d			;f9ff
lfa00h:
	ld d,h			;fa00
	ld b,l			;fa01
lfa02h:
	jr nz,lfa49h		;fa02
lfa04h:
	ld c,(hl)		;fa04
lfa05h:
	jr nz,lfa5dh		;fa05
	ld b,c			;fa07
	ld d,d			;fa08
	ld c,c			;fa09
	ld b,c			;fa0a
	ld d,e			;fa0b
	jr nz,lfa5dh		;fa0c
	ld b,e			;fa0e
	ld b,c			;fa0f
	ld d,e			;fa10
	ld c,c			;fa11
	ld c,a			;fa12
	ld c,(hl)		;fa13
lfa14h:
	ld b,l			;fa14
	ld d,e			;fa15
	inc l			;fa16
	jr nz,lfa69h		;fa17
	ld b,l			;fa19
	ld d,d			;fa1a
	ld c,a			;fa1b
	jr nz,lfa6eh		;fa1c
	ld d,l			;fa1e
	ld b,h			;fa1f
	ld b,l			;fa20
	jr nz,lfa43h		;fa21
	jr nz,lfa45h		;fa23
	jr nz,lfa68h		;fa25
	ld c,h			;fa27
	ld b,e			;fa28
	ld b,c			;fa29
	ld c,(hl)		;fa2a
	ld e,d			;fa2b
	ld b,c			;fa2c
	ld d,d			;fa2d
	jr nz,lfa85h		;fa2e
	ld c,(hl)		;fa30
	jr nz,lfa79h		;fa31
lfa33h:
	ld c,a			;fa33
	ld b,e			;fa34
	ld c,a			;fa35
	jr nz,lfa7ch		;fa36
	ld b,l			;fa38
	jr nz,lfa7eh		;fa39
lfa3bh:
	ld c,c			;fa3b
	ld d,(hl)		;fa3c
	ld c,c			;fa3d
	ld c,h			;fa3e
	ld c,c			;fa3f
	ld e,d			;fa40
	ld b,c			;fa41
	ld b,e			;fa42
lfa43h:
	ld c,c			;fa43
	ld c,a			;fa44
lfa45h:
	ld c,(hl)		;fa45
lfa46h:
	ld b,c			;fa46
	ld c,h			;fa47
	ld b,l			;fa48
lfa49h:
	ld c,d			;fa49
lfa4ah:
	ld b,c			;fa4a
	ld b,h			;fa4b
	ld c,a			;fa4c
	jr nz,lfa93h		;fa4d
	ld b,l			;fa4f
	jr nz,$+78		;fa50
	ld b,c			;fa52
	jr nz,lfa99h		;fa53
	ld b,l			;fa55
	ld d,e			;fa56
	ld c,a			;fa57
	ld c,h			;fa58
	ld b,c			;fa59
	ld b,e			;fa5a
	ld c,c			;fa5b
	ld c,a			;fa5c
lfa5dh:
	ld c,(hl)		;fa5d
	ld l,020h		;fa5e
	jr nz,lfa82h		;fa60
	jr nz,lfa84h		;fa62
	jr nz,$+34		;fa64
	rst 38h			;fa66
	ld d,b			;fa67
lfa68h:
	ld b,c			;fa68
lfa69h:
	ld d,e			;fa69
	ld b,c			;fa6a
	ld d,d			;fa6b
	ld c,a			;fa6c
	ld c,(hl)		;fa6d
lfa6eh:
	jr nz,lfabch		;fa6e
	ld c,a			;fa70
	ld d,e			;fa71
	jr nz,lfab5h		;fa72
	ld h,04fh		;fa74
	ld d,e			;fa76
	jr nz,lfad2h		;fa77
lfa79h:
	jr nz,lfabeh		;fa79
	ld d,l			;fa7b
lfa7ch:
	ld b,c			;fa7c
	ld c,(hl)		;fa7d
lfa7eh:
	ld b,h			;fa7e
	ld c,a			;fa7f
	jr nz,lfad6h		;fa80
lfa82h:
	ld c,a			;fa82
	ld b,h			;fa83
lfa84h:
	ld c,a			;fa84
lfa85h:
	jr nz,$+34		;fa85
	ld b,l			;fa87
	ld d,d			;fa88
	ld b,c			;fa89
	jr nz,lfadeh		;fa8a
	ld b,l			;fa8c
	ld b,e			;fa8d
	ld c,a			;fa8e
	ld d,d			;fa8f
	ld b,h			;fa90
	ld b,c			;fa91
	ld b,h			;fa92
lfa93h:
	ld c,a			;fa93
	jr nz,lfad9h		;fa94
	ld c,a			;fa96
	ld c,l			;fa97
	ld c,a			;fa98
lfa99h:
	jr nz,lfaf0h		;fa99
	ld c,(hl)		;fa9b
	ld b,c			;fa9c
	jr nz,lfaebh		;fa9d
	ld b,l			;fa9f
	ld c,d			;faa0
	ld b,c			;faa1
	ld c,(hl)		;faa2
	ld b,c			;faa3
	jr nz,lfac6h		;faa4
	jr nz,lfaf8h		;faa6
	ld b,l			;faa8
	ld d,e			;faa9
	ld b,c			;faaa
	ld b,h			;faab
	ld c,c			;faac
	ld c,h			;faad
	ld c,h			;faae
	ld b,c			;faaf
	inc l			;fab0
	jr nz,lfafeh		;fab1
	ld b,c			;fab3
	ld c,l			;fab4
lfab5h:
	ld d,l			;fab5
	ld c,c			;fab6
	ld d,d			;fab7
	jr nz,lfb0ch		;fab8
	ld b,l			;faba
	ld b,a			;fabb
lfabch:
	ld d,d			;fabc
	ld b,l			;fabd
lfabeh:
	ld d,e			;fabe
	ld c,a			;fabf
	jr nz,lfb05h		;fac0
	ld c,a			;fac2
	ld c,(hl)		;fac3
	jr nz,$+34		;fac4
lfac6h:
	jr nz,lfb1bh		;fac6
	ld d,l			;fac8
	jr nz,lfb1ah		;fac9
	ld b,h			;facb
	ld c,c			;facc
	ld c,a			;facd
	jr nz,$+74		;face
	ld b,c			;fad0
	ld b,e			;fad1
lfad2h:
	ld c,c			;fad2
	ld b,c			;fad3
	jr nz,lfb2ah		;fad4
lfad6h:
	ld c,a			;fad6
	ld b,h			;fad7
	ld c,a			;fad8
lfad9h:
	jr nz,$+78		;fad9
	ld c,a			;fadb
	jr nz,lfb34h		;fadc
lfadeh:
	ld c,c			;fade
	ld d,(hl)		;fadf
	ld c,a			;fae0
	ld l,020h		;fae1
	jr nz,lfb05h		;fae3
	jr nz,$+34		;fae5
	rst 38h			;fae7
	ld bc,04f50h		;fae8
lfaebh:
	ld d,d			;faeb
	jr nz,lfb41h		;faec
	ld b,l			;faee
	ld b,a			;faef
lfaf0h:
	ld d,l			;faf0
	ld c,(hl)		;faf1
	ld b,h			;faf2
	ld b,c			;faf3
	jr nz,lfb4ch		;faf4
	ld b,l			;faf6
sub_faf7h:
	ld e,d			;faf7
lfaf8h:
	jr nz,lfb3eh		;faf8
	ld b,l			;fafa
	ld d,e			;fafb
	ld d,h			;fafc
lfafdh:
	ld d,d			;fafd
lfafeh:
	ld d,l			;fafe
	ld e,c			;faff
	ld c,a			;fb00
	jr nz,lfb57h		;fb01
	ld c,a			;fb03
	ld b,h			;fb04
lfb05h:
	ld c,a			;fb05
	jr nz,lfb28h		;fb06
	jr nz,lfb4bh		;fb08
	ld d,c			;fb0a
	ld d,l			;fb0b
lfb0ch:
	ld b,l			;fb0c
	ld c,h			;fb0d
	ld c,h			;fb0e
	ld c,a			;fb0f
	jr nz,lfb62h		;fb10
	ld c,a			;fb12
	ld d,d			;fb13
	jr nz,lfb62h		;fb14
	ld c,a			;fb16
	jr nz,lfb6ah		;fb17
	ld d,l			;fb19
lfb1ah:
	ld b,l			;fb1a
lfb1bh:
	jr nz,lfb76h		;fb1b
	ld c,a			;fb1d
	jr nz,lfb68h		;fb1e
	ld b,c			;fb20
	ld b,d			;fb21
	ld c,c			;fb22
	ld b,c			;fb23
	jr nz,lfb46h		;fb24
	jr nz,$+34		;fb26
lfb28h:
	jr nz,lfb76h		;fb28
lfb2ah:
	ld d,l			;fb2a
	ld b,e			;fb2b
	ld c,b			;fb2c
	ld b,c			;fb2d
	ld b,h			;fb2e
	ld c,a			;fb2f
	inc l			;fb30
	jr nz,lfb80h		;fb31
	ld c,c			;fb33
lfb34h:
	jr nz,lfb7ch		;fb34
	ld b,c			;fb36
	ld c,l			;fb37
	ld c,c			;fb38
	ld c,h			;fb39
	ld c,c			;fb3a
	ld b,c			;fb3b
	jr nz,lfb97h		;fb3c
lfb3eh:
	jr nz,lfb8dh		;fb3e
	ld c,c			;fb40
lfb41h:
	jr nz,lfb8fh		;fb41
	ld c,c			;fb43
	ld b,d			;fb44
	ld d,d			;fb45
lfb46h:
	ld c,a			;fb46
	jr nz,$+34		;fb47
	ld b,h			;fb49
	ld b,l			;fb4a
lfb4bh:
	ld c,h			;fb4b
lfb4ch:
	jr nz,$+69		;fb4c
	ld d,l			;fb4e
	ld b,c			;fb4f
	ld c,h			;fb50
	jr nz,lfba6h		;fb51
	ld b,l			;fb53
	jr nz,lfb97h		;fb54
	ld d,b			;fb56
lfb57h:
	ld c,a			;fb57
	ld b,h			;fb58
	ld b,l			;fb59
	ld d,d			;fb5a
	ld c,a			;fb5b
	ld l,020h		;fb5c
	jr nz,lfb80h		;fb5e
	jr nz,lfb82h		;fb60
lfb62h:
	jr nz,$+34		;fb62
	jr nz,lfb86h		;fb64
	jr nz,lfb88h		;fb66
lfb68h:
	jr nz,$+1		;fb68
lfb6ah:
	ld bc,05546h		;fb6a
	ld b,l			;fb6d
	jr nz,lfbc3h		;fb6e
	ld c,a			;fb70
	ld b,d			;fb71
	ld d,d			;fb72
	ld b,l			;fb73
	jr nz,lfbc2h		;fb74
lfb76h:
	ld b,c			;fb76
	jr nz,lfbcdh		;fb77
	ld d,l			;fb79
	ld c,l			;fb7a
	ld b,d			;fb7b
lfb7ch:
	ld b,c			;fb7c
	jr nz,lfbc3h		;fb7d
	ld b,l			;fb7f
lfb80h:
	jr nz,$+86		;fb80
lfb82h:
	ld d,l			;fb82
	jr nz,lfbd2h		;fb83
	ld b,c			;fb85
lfb86h:
	ld b,h			;fb86
	ld d,d			;fb87
lfb88h:
	ld b,l			;fb88
	jr nz,$+34		;fb89
	ld b,h			;fb8b
	ld c,a			;fb8c
lfb8dh:
	ld c,(hl)		;fb8d
	ld b,h			;fb8e
lfb8fh:
	ld b,l			;fb8f
	jr nz,$+91		;fb90
	ld c,a			;fb92
	jr nz,$+76		;fb93
	ld d,l			;fb95
	ld d,d			;fb96
lfb97h:
	ld b,l			;fb97
	jr nz,$+88		;fb98
	ld b,l			;fb9a
	ld c,(hl)		;fb9b
	ld b,a			;fb9c
	ld b,c			;fb9d
	ld c,(hl)		;fb9e
lfb9fh:
	ld e,d			;fb9f
	ld b,c			;fba0
	inc l			;fba1
	jr nz,lfbfdh		;fba2
	jr nz,$+67		;fba4
lfba6h:
	ld c,b			;fba6
	ld c,a			;fba7
	ld d,d			;fba8
	ld b,c			;fba9
	jr nz,$+86		;fbaa
	ld d,l			;fbac
	jr nz,lfc02h		;fbad
	ld b,l			;fbaf
	ld d,d			;fbb0
	ld b,c			;fbb1
	ld d,e			;fbb2
	jr nz,lfbfah		;fbb3
	ld c,h			;fbb5
	jr nz,lfbfdh		;fbb6
	ld c,(hl)		;fbb8
	ld b,e			;fbb9
	ld b,c			;fbba
	ld d,d			;fbbb
	ld b,a			;fbbc
	ld b,c			;fbbd
	ld b,h			;fbbe
	ld c,a			;fbbf
	jr nz,lfc06h		;fbc0
lfbc2h:
	ld b,l			;fbc2
lfbc3h:
	jr nz,$+34		;fbc3
	jr nz,$+34		;fbc5
	jr nz,$+34		;fbc7
lfbc9h:
	jr nz,$+34		;fbc9
	ld c,h			;fbcb
	ld c,h			;fbcc
lfbcdh:
	ld b,l			;fbcd
	ld d,(hl)		;fbce
	ld b,c			;fbcf
	ld d,d			;fbd0
	ld c,h			;fbd1
lfbd2h:
	ld b,c			;fbd2
	jr nz,lfc16h		;fbd3
	jr nz,$+69		;fbd5
	ld b,c			;fbd7
	ld b,d			;fbd8
	ld c,a			;fbd9
	ld l,020h		;fbda
	jr nz,lfbfeh		;fbdc
	jr nz,$+34		;fbde
	jr nz,lfc02h		;fbe0
	jr nz,lfc04h		;fbe2
	jr nz,lfc06h		;fbe4
	jr nz,$+34		;fbe6
	jr nz,lfc0ah		;fbe8
	jr nz,$+1		;fbea
	ld hl,04020h		;fbec
	ld b,008h		;fbef
lfbf1h:
	push bc			;fbf1
	push hl			;fbf2
	ld b,002h		;fbf3
lfbf5h:
	push bc			;fbf5
	ld b,020h		;fbf6
lfbf8h:
	rr (hl)			;fbf8
lfbfah:
	inc hl			;fbfa
	djnz lfbf8h		;fbfb
lfbfdh:
	and a			;fbfd
lfbfeh:
	pop bc			;fbfe
	djnz lfbf5h		;fbff
sub_fc01h:
	pop hl			;fc01
lfc02h:
	inc h			;fc02
	pop bc			;fc03
lfc04h:
	djnz lfbf1h		;fc04
lfc06h:
	ret			;fc06
	ld hl,0411fh		;fc07
lfc0ah:
	ld b,007h		;fc0a
lfc0ch:
	push bc			;fc0c
	push hl			;fc0d
	ld b,020h		;fc0e
lfc10h:
	rl (hl)			;fc10
	dec hl			;fc12
	djnz lfc10h		;fc13
	and a			;fc15
lfc16h:
	pop hl			;fc16
	pop bc			;fc17
	inc h			;fc18
	djnz lfc0ch		;fc19
sub_fc1bh:
	ret			;fc1b
	ld hl,048b1h		;fc1c
sub_fc1fh:
	ld b,004h		;fc1f
lfc21h:
	rl (hl)			;fc21
	dec hl			;fc23
	djnz lfc21h		;fc24
	ret			;fc26
	ld hl,048aeh		;fc27
	ld b,004h		;fc2a
lfc2ch:
	rr (hl)			;fc2c
	inc hl			;fc2e
	djnz lfc2ch		;fc2f
	ret			;fc31
	push iy			;fc32
	push ix			;fc34
	push de			;fc36
	push bc			;fc37
sub_fc38h:
	push hl			;fc38
	push af			;fc39
	call sub_7bech		;fc3a
	call sub_7bech		;fc3d
	call sub_7c07h		;fc40
	call sub_7c51h		;fc43
	pop af			;fc46
	pop hl			;fc47
	pop bc			;fc48
	pop de			;fc49
	pop ix			;fc4a
	pop iy			;fc4c
	jp 00038h		;fc4e
	ld a,(l7c60h)		;fc51
	dec a			;fc54
	cp 000h			;fc55
	jr z,$+10		;fc57
	ld (l7c60h),a		;fc59
	call sub_7c1ch		;fc5c
	ret			;fc5f
	ld bc,05a3eh		;fc60
	ld (l7c60h),a		;fc63
	ld a,(l7c8eh)		;fc66
	dec a			;fc69
	cp 000h			;fc6a
	jp z,l7c78h		;fc6c
	ld (l7c8eh),a		;fc6f
	ld a,0ffh		;fc72
	ld (048b1h),a		;fc74
	ret			;fc77
	ld a,002h		;fc78
	ld (l7c8eh),a		;fc7a
	ld de,l7c90h		;fc7d
	ld hl,07c43h		;fc80
	inc hl			;fc83
	ld (hl),e		;fc84
	inc hl			;fc85
	ld (hl),d		;fc86
	ld hl,048aeh		;fc87
	ld a,0ffh		;fc8a
	ld (hl),a		;fc8c
	ret			;fc8d
	ld (bc),a		;fc8e
	ld bc,0603ah		;fc8f
	ld a,h			;fc92
	dec a			;fc93
	cp 000h			;fc94
	jr z,lfc9fh		;fc96
	ld (l7c60h),a		;fc98
	call sub_7c27h		;fc9b
	ret			;fc9e
lfc9fh:
	ld a,05ah		;fc9f
	ld (l7c60h),a		;fca1
	ld a,(l7c8fh)		;fca4
	dec a			;fca7
	cp 000h			;fca8
	jr z,lfcb4h		;fcaa
	ld (l7c60h),a		;fcac
sub_fcafh:
	ld hl,048aeh		;fcaf
	ld (hl),a		;fcb2
	ret			;fcb3
lfcb4h:
	ld a,001h		;fcb4
	ld (l7c8fh),a		;fcb6
	ld de,sub_7c51h		;fcb9
	ld hl,07c43h		;fcbc
lfcbfh:
	inc hl			;fcbf
	ld (hl),e		;fcc0
	inc hl			;fcc1
	ld (hl),d		;fcc2
	ld hl,048b1h		;fcc3
	ld a,0ffh		;fcc6
	ld (hl),a		;fcc8
	ret			;fcc9
	nop			;fcca
	ld hl,047e0h		;fccb
	ld de,le4fah		;fcce
	ld b,008h		;fcd1
lfcd3h:
	push bc			;fcd3
	ld c,008h		;fcd4
lfcd6h:
	push de			;fcd6
	push hl			;fcd7
	call sub_7d17h		;fcd8
	call sub_7cf9h		;fcdb
	ld b,020h		;fcde
lfce0h:
	ld a,(de)		;fce0
	ld (hl),a		;fce1
	inc hl			;fce2
	inc de			;fce3
	djnz lfce0h		;fce4
	pop hl			;fce6
	pop de			;fce7
	inc d			;fce8
	dec c			;fce9
	jr nz,lfcd6h		;fcea
	pop bc			;fcec
	push hl			;fced
	ld hl,007e0h		;fcee
	ex de,hl		;fcf1
	sbc hl,de		;fcf2
sub_fcf4h:
	ex de,hl		;fcf4
	pop hl			;fcf5
	djnz lfcd3h		;fcf6
	ret			;fcf8
	push bc			;fcf9
	call l7dbfh		;fcfa
	pop bc			;fcfd
lfcfeh:
	ret			;fcfe
lfcffh:
	ld hl,05800h		;fcff
	ld b,008h		;fd02
	ld a,(l7d16h)		;fd04
	ld e,a			;fd07
lfd08h:
	ld c,020h		;fd08
lfd0ah:
	ld a,e			;fd0a
	ld (hl),a		;fd0b
	inc hl			;fd0c
	dec c			;fd0d
	ld a,c			;fd0e
	cp 000h			;fd0f
	jr nz,lfd0ah		;fd11
	djnz lfd08h		;fd13
	ret			;fd15
	ld b,(hl)		;fd16
	push hl			;fd17
	push bc			;fd18
	push de			;fd19
	ld a,047h		;fd1a
	ld (l7d16h),a		;fd1c
	call sub_7cffh		;fd1f
	halt			;fd22
	halt			;fd23
	ld a,078h		;fd24
	ld (l7d16h),a		;fd26
	call sub_7cffh		;fd29
	pop de			;fd2c
	pop bc			;fd2d
	pop hl			;fd2e
	ret			;fd2f
lfd30h:
	push bc			;fd30
	ld a,(hl)		;fd31
	ld b,008h		;fd32
lfd34h:
	srl a			;fd34
	rl c			;fd36
	djnz lfd34h		;fd38
	push hl			;fd3a
	ld a,l			;fd3b
	xor 01fh		;fd3c
	ld l,a			;fd3e
sub_fd3fh:
	ld (hl),c		;fd3f
	pop hl			;fd40
	inc hl			;fd41
	pop bc			;fd42
	dec bc			;fd43
	ld a,b			;fd44
	or c			;fd45
	jr nz,lfd30h		;fd46
	ret			;fd48
lfd49h:
	push bc			;fd49
	push hl			;fd4a
	ld c,(hl)		;fd4b
	ld a,l			;fd4c
	xor 01fh		;fd4d
	ld l,a			;fd4f
	ld (hl),c		;fd50
	pop hl			;fd51
	inc hl			;fd52
	pop bc			;fd53
	dec bc			;fd54
	ld a,b			;fd55
	or c			;fd56
	jr nz,lfd49h		;fd57
	ret			;fd59
	ld hl,04000h		;fd5a
	ld bc,01000h		;fd5d
	ex de,hl		;fd60
	ldir			;fd61
	ex de,hl		;fd63
	inc hl			;fd64
	ld hl,05800h		;fd65
	ld bc,00200h		;fd68
	ex de,hl		;fd6b
	ldir			;fd6c
	ret			;fd6e
	ld hl,04000h		;fd6f
	ld bc,00800h		;fd72
	ex de,hl		;fd75
	ldir			;fd76
	ex de,hl		;fd78
	inc hl			;fd79
	ld hl,05800h		;fd7a
	ld bc,00100h		;fd7d
	ex de,hl		;fd80
	ldir			;fd81
	ret			;fd83
	ld de,04000h		;fd84
lfd87h:
	ld bc,01000h		;fd87
	ldir			;fd8a
	ret			;fd8c
lfd8dh:
	push bc			;fd8d
	ld b,010h		;fd8e
lfd90h:
	ld a,(de)		;fd90
	ld (hl),a		;fd91
	inc hl			;fd92
	inc de			;fd93
	djnz lfd90h		;fd94
	push de			;fd96
	ld de,00010h		;fd97
	add hl,de		;fd9a
	pop de			;fd9b
	pop bc			;fd9c
	djnz lfd8dh		;fd9d
	ret			;fd9f
	ld de,l7ebdh		;fda0
	ld ix,l7db5h		;fda3
	call 0697fh		;fda7
	ld de,l7ebdh		;fdaa
	ld ix,l7dbah		;fdad
	call 0697fh		;fdb1
	ret			;fdb4
	inc bc			;fdb5
	djnz lfdc0h		;fdb6
	nop			;fdb8
	nop			;fdb9
	inc bc			;fdba
	djnz $+10		;fdbb
	djnz lfdbfh		;fdbd
lfdbfh:
	push bc			;fdbf
lfdc0h:
	push de			;fdc0
	ld hl,04000h		;fdc1
	ld de,04100h		;fdc4
	ld c,040h		;fdc7
lfdc9h:
	ld b,020h		;fdc9
lfdcbh:
	ld a,(de)		;fdcb
	ld (hl),a		;fdcc
	ld a,c			;fdcd
	cp 002h			;fdce
	jr nz,lfdd4h		;fdd0
	xor a			;fdd2
	ld (de),a		;fdd3
lfdd4h:
	inc de			;fdd4
	inc hl			;fdd5
	djnz lfdcbh		;fdd6
	push de			;fdd8
	ld de,000e0h		;fdd9
	add hl,de		;fddc
	ex (sp),hl		;fddd
	add hl,de		;fdde
	ex de,hl		;fddf
	pop hl			;fde0
	dec c			;fde1
	ld a,c			;fde2
	and 007h		;fde3
	jr z,lfdedh		;fde5
	cp 001h			;fde7
	jr z,sub_fdffh		;fde9
lfdebh:
	jr lfdc9h		;fdeb
lfdedh:
	push de			;fded
	ld de,007e0h		;fdee
	sbc hl,de		;fdf1
	pop de			;fdf3
	ld a,c			;fdf4
	and 03fh		;fdf5
	jr nz,lfdc9h		;fdf7
	ld a,007h		;fdf9
sub_fdfbh:
	add a,h			;fdfb
sub_fdfch:
	ld h,a			;fdfc
	jr lfdc9h		;fdfd
sub_fdffh:
	push hl			;fdff
lfe00h:
	ex de,hl		;fe00
	ld de,007e0h		;fe01
	sbc hl,de		;fe04
	ex de,hl		;fe06
	pop hl			;fe07
	ld a,c			;fe08
	and 03fh		;fe09
	cp 001h			;fe0b
lfe0dh:
	jr nz,lfdc9h		;fe0d
	ld a,007h		;fe0f
	add a,d			;fe11
	ld d,a			;fe12
	ld a,c			;fe13
	cp 001h			;fe14
	jr nz,lfdc9h		;fe16
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
	call l7e1bh		;fe2b
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
lfe5ah:
	inc d			;fe5a
	inc d			;fe5b
	dec e			;fe5c
	dec b			;fe5d
	ld bc,00001h		;fe5e
lfe61h:
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
lfe6dh:
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
	jp lff5eh+1		;fe8a
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
lfec2h:
	and h			;fec2
	rst 38h			;fec3
lfec4h:
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
lfed4h:
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
lfee2h:
	cp a			;fee2
	cp h			;fee3
lfee4h:
	cp (hl)			;fee4
	cp (hl)			;fee5
lfee6h:
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
lfef5h:
	ld a,e			;fef5
	dec sp			;fef6
	cp e			;fef7
	ld d,c			;fef8
	ld de,03815h		;fef9
	ld sp,035f1h		;fefc
lfeffh:
	ld (hl),l		;feff
sub_ff00h:
	ld (hl),l		;ff00
lff01h:
	ld (hl),c		;ff01
	ld sp,hl		;ff02
	rst 0			;ff03
	jr c,$+109		;ff04
	push de			;ff06
lff07h:
	jp c,lca54h		;ff07
	ld b,h			;ff0a
	jp nz,0387ch		;ff0b
	rst 38h			;ff0e
lff0fh:
	cp a			;ff0f
	cp a			;ff10
	cp a			;ff11
lff12h:
	cp a			;ff12
	ld e,a			;ff13
sub_ff14h:
	inc e			;ff14
lff15h:
	jr lff4fh		;ff15
lff17h:
	ld e,b			;ff17
	jr $+26			;ff18
	jr lff6ch		;ff1a
	djnz lff2eh		;ff1c
	djnz lff58h		;ff1e
	djnz lff43h		;ff20
	and e			;ff22
lff23h:
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
lff2fh:
	inc bc			;ff2f
sub_ff30h:
	ld d,l			;ff30
lff31h:
	jr c,lff5ch		;ff31
lff33h:
	dec b			;ff33
	ld bc,l62f4h		;ff34
lff37h:
	ld h,h			;ff37
	ld (bc),a		;ff38
	inc b			;ff39
	jr c,lfeceh		;ff3a
	sbc a,b			;ff3c
	sbc a,l			;ff3d
sub_ff3eh:
	ex af,af'		;ff3e
sub_ff3fh:
	ld bc,00100h		;ff3f
	nop			;ff42
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
lff5eh:
	jr c,lff9fh		;ff5e
sub_ff60h:
	ccf			;ff60
lff61h:
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
sub_ff70h:
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
sub_ff7fh:
	ret c			;ff7f
	jp nc,038d4h		;ff80
sub_ff83h:
	ret nc			;ff83
	ret nc			;ff84
	ret nc			;ff85
	rst 28h			;ff86
	ret p			;ff87
	dec a			;ff88
	jr lffbch		;ff89
	jr c,sub_ff70h		;ff8b
lff8dh:
	dec b			;ff8d
	add hl,bc		;ff8e
	rra			;ff8f
	jr nc,$+57		;ff90
	dec (hl)		;ff92
	dec (hl)		;ff93
lff94h:
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
lffaah:
	ld e,c			;ffaa
	ld l,b			;ffab
	ld c,b			;ffac
	ld c,c			;ffad
	ld c,b			;ffae
lffafh:
	jr c,$+1		;ffaf
	ld a,031h		;ffb1
	ld l,031h		;ffb3
	ld a,(03a3dh)		;ffb5
	jr c,lffebh		;ffb8
	ld l,031h		;ffba
lffbch:
	ld a,(03a3dh)		;ffbc
lffbfh:
	ld sp,0382eh		;ffbf
	ld sp,03d3ah		;ffc2
	ld a,(02e31h)		;ffc5
	ld sp,0383ah		;ffc8
lffcbh:
	rst 38h			;ffcb
	nop			;ffcc
	rst 38h			;ffcd
	djnz $+1		;ffce
sub_ffd0h:
	nop			;ffd0
	ld d,l			;ffd1
	nop			;ffd2
	jr c,$+1		;ffd3
lffd5h:
	djnz $+1		;ffd5
lffd7h:
	nop			;ffd7
	ld d,l			;ffd8
	nop			;ffd9
	rst 38h			;ffda
	exWarning: Code might not be 8080 compatible!
Warning: Self modifying code detected!
 af,af'		;ffdb
	jr c,$+1		;ffdc
	nop			;ffde
	ld d,l			;ffdf
	nop			;ffe0
	rst 38h			;ffe1
	inc b			;ffe2
lffe3h:
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
lffedh:
	or l			;ffed
	jr c,$+23		;ffee
	rst 28h			;fff0
	dec d			;fff1
	or l			;fff2
lfff3h:
	ld (hl),a		;fff3
lfff4h:
	or l			;fff4
	dec d			;fff5
	rst 28h			;fff6
	jr c,$+23		;fff7
	or l			;fff9
	ld (hl),a		;fffa
sub_fffbh:
	or l			;fffb
lfffch:
	dec d			;fffc
	rst 28h			;fffd
	dec d			;fffe
lffffh:
	or l			;ffff
