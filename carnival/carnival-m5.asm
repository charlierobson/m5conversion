.include "..\m5c-defs.inc"

	.org $2000

	.db		2           ; identifier
	.dw		start       ; start execution address	$2001
	.dw		ipl         ; IPL address				$2003 (initial program loader, who knew)
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010

	ret \ nop \ nop		; $2010
	ret \ nop \ nop		; $2013
	ret \ nop \ nop		; $2016
	ret \ nop \ nop		; $2019
	ret \ nop \ nop		; $201c


	.org $2020

start:
	di

	ld		sp,$73b9			; BIOS stack

	in		a,(IO_VDP_Status)		; clear any pending interrupt flag

	ld		hl,vbl
	ld		(VBLVEC),hl

	in		a,(IO_VDP_Status)		; clear any existing vsync int req

	ei

	jp		COLECO_IDENT		; BIOS startup / colecovision screen



ipl:							; initial program loader
	di

	ld		a,$01               ; disable timer interrupts
	out		($01),a

	ld		hl,$7000			; copy interrupt vectors
	ld		de,$7400
	ld		bc,$10
	ldir

	ld		a,$74				; relocate IM2 vector base
	ld		i,a

	ld		hl,bios				; unpack bios
	ld		de,$e000
	call	dzx0_standard

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	dzx0_standard

	ret


vbl:
	push	af

	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a

	call	$8021				; game interrupt vector

	in		a,(IO_VDP_Status)		; clear any existing vsync int req
	pop		af
	ei
	reti





	.include "..\dzx0_standard.asm"


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"carnival.patched.bin.zx0"


	.ds 16384 - ($-$2000)
