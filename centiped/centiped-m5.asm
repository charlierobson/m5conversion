.include "..\m5c-defs.inc"

	.org $2000

	.db		2           ; identifier
	.dw		start       ; start execution address	$2001
	.dw		ipl         ; IPL address				$2003 (initial program loader, who knew)
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010

	jp		jsFix		; $2010
	jp		kpFix		; $2013


	.org $2020

start:
	di

	ld		sp,$73b9			; BIOS stack

	ld		hl,vbl
	ld		(VBLVEC),hl

	in		a,(IO_VDP_Status)		; clear any existing vsync int req

	ld		a,($1518)			; save pal bit in reg defs
	and		1
	ld		($b56b),a

	ei

	jp		COLECO_IDENT		; BIOS startup / colecovision screen

	ld		hl,($800a)			; cart_start, bypasses colecovision screen
	jp		(hl)


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
	call	dzx0_standard

	ret


vbl:
	; centipede nmi rtn does only this
	push	af
	ld		a,($7004)
	inc		a
	ld		($7004),a
	in		a,(IO_VDP_Status)
	pop		af
	ei
	reti




CRV_JS1 = $f0f0
CRV_JS2 = $f0f3
CRV_KP1 = $f0f6
CRV_KP2 = $f0f9

jsFix:
	LD		A,($70a0)
	BIT		1,A
	JP		nz,CRV_JS2
	jp		CRV_JS1


kpFix:
	LD		A,($70a0)
	BIT		1,A
	JP		nz,CRV_KP2
	jp		CRV_KP1




	.include "..\dzx0_standard.asm"

cart
	.incbin	"centiped.patched.bin.zx0"


	.ds 16384 - ($-$2000)
