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

ipl:
	di

	ld		a,$01               ; disable timer interrupts
	out		($01),a

	ld		a,$74				; relocate IM2 vector base
	ld		i,a

	ld		bc,$0180			; disable display, vbl
	call	WRITE_REGISTER

	ld		hl,cart				; unpack game and get ready to go
	ld		de,$8000
	call	decrunch

	ld		hl,$7000			; clear us some ram
	ld		(hl),0
	ld		de,$7001
	ld		bc,$7ff
	ldir

	ld		sp,$73b9			; coleco bios sez so

	in		a,(IO_VDP_Status)	; clear any existing vsync int req

	ld		hl,vbl				; vbl isr
	ld		(VBLVEC),hl

	ei							; and let rip
	jp		COLECO_IDENT






vbl:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a

	ld		a,(VBLFLAG)			; see if we're re-entering vbl
	and		a
	jr		z,{+}

	ld		a,$ee				; flag error and bail
	ld		(VBLERR),a
	jr		bail

+:	or		$ff					; see if we left vbl improperly
	ld		(VBLFLAG),a

	call	V_NMI

bail:
	in		a,(IO_VDP_Status)

	xor		a
	ld		(VBLFLAG),a

	pop		af
	ei
	reti



decrunch:
	.include "..\dzx0_standard.asm"



	.org	$2100

jsFix:
	JP		z,CRV_JS1
	jp		CRV_JS2

kpfixup:
	call	CRV_KP1
	LD		B,A
	jp		CRV_KP2


cart
	.incbin	"antaradv.patched.bin.zx0"


	.ds $4000 - ($-$2000)
