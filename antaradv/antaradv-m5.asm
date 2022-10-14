.include "..\m5c-defs.inc"

	.org $2000

	.db		2           ; identifier
	.dw		0       	; start execution address	$2001
	.dw		ipl         ; IPL address				$2003 (initial program loader, who knew)
	jp		$805c		; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010

	ret \ nop \ nop		; $2010
	ret \ nop \ nop		; $2013
	ret \ nop \ nop		; $2016
	ret \ nop \ nop		; $2019
	ret \ nop \ nop		; $201c


	.org $2020

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

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	decruncher

	ld		sp,$73b9			; BIOS stack

	ld		hl,$805c
	ld		(VBLVEC),hl

	in		a,(IO_VDP_Status)	; clear any existing vsync int req

	jp		COLECO_IDENT		; BIOS startup / colecovision screen




vbl:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(IO_VDP_Status)	; clear any existing vsync int req
	pop		af
	jp		$8021				; game interrupt vector



decruncher:
	.include "..\dzx0_standard.asm"



	.org	$2100

rst1:
	OR		D
	ADD		A,E
	jp		$80de

rst3_1:
	ADD		A,$82
	jp		$88fc

rst3_2:
	CALL	$810b
	jp		$88fc


jsFix:
	JP		z,CRV_JS1
	jp		CRV_JS2


kpFix:
	JP		z,CRV_KP1
	jp		CRV_KP2



cart
	.incbin	"antaradv.patched.bin.zx0"


	.ds $4000 - ($-$2000)
