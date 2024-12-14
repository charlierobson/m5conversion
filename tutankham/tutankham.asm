	.include "../m5c-defs.inc"

	.org $2000
	; cart header
	.db		2           ; identifier
	.dw		0			; start execution address
	.dw		ipl         ; IPL address
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010
	; functional vectors
	jp		0			; $2010
	jp		0			; $2013
	jp		0			; $2016
	jp		0			; $2019
	jp		0			; $201c


	.org $2020
	; here we go
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

	or		$ff					; see if we left vbl improperly
	ld		(VBLFLAG),a

	call	V_NMI

	in		a,(IO_VDP_Status)

	xor		a
	ld		(VBLFLAG),a

	pop		af
	ei
	reti





decrunch:
	.include "../dzx0_standard.asm"

cart
	.incbin	"tutankham.patched.bin.zx0"


	.ds 16384 - ($-$2000)
