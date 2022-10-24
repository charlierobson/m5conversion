	.include "..\m5c-defs.inc"

	.org $2000
	; cart header
	.db		2           ; identifier
	.dw		0			; start execution address
	.dw		ipl         ; IPL address
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010
	; functional vectors
	jp		jsp1		; $2010
	jp		kpp1		; $2013
	jp		bugfix1		; $2016
	jp		getReg0		; $2019
	jp		0			; $201c


	.org $2020
	; here we go
ipl:
	di

	ld		a,$01               ; disable timer interrupts
	out		($01),a

	ld		a,$74				; relocate IM2 vector base
	ld		i,a

	ld		hl,cart				; unpack game and get ready to go
	ld		de,$8000
	call	decrunch

	ld		hl,$7000			; clear us some ram
	ld		(hl),0
	ld		de,$7001
	ld		bc,$7ff
	ldir

	ld		sp,$73b9			; coleco bios sez so

	ld		hl,vbl				; vbl isr
	ld		(VBLVEC),hl

	ld		bc,$0180			; disable display, vbl
	call	WRITE_REGISTER

	in		a,(IO_VDP_Status)	; clear any existing vsync int req
	ei

	jp		COLECO_IDENT



vbl:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a

	call	V_NMI

	in		a,(IO_VDP_Status)
	pop		af
	ei
	reti


jsp1:
	bit		0,c
	jp		z,CRV_JS1
	jp		CRV_JS2

kpp1:
	bit		0,c
	jp		z,CRV_KP1
	jp		CRV_KP2

bugfix1:
	OR		H
	LD		H,A
	and		a
	ret		m
	LD		(HL),C
	ret

getReg0:
	xor		a
	cp		b					; reg #
	jp		nz,$8148

	ld		a,($1518)			; sord BIOS
	and		1
	or		c
	ld		c,a
	jp		$8148


decrunch:
	.include "..\dzx0_standard.asm"

cart
	.incbin	"zenji.patched.bin.zx0"


	.ds 16384 - ($-$2000)
