	.asciimap ' ',' ',0

VBLVEC = $7406

VBLCOUNT = $740A

VDP_STAT = $11

BIOS = $e000

WRITE_REGISTER = BIOS + $1fd9
COLECO_IDENT = BIOS + $6e

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

	ld		bc,$0180			; turn off screen, VDP interrupt
	call	WRITE_REGISTER		; BIOS WRITE_REGISTER

	in		a,(VDP_STAT)		; clear any pending interrupt flag

	ld		hl,vbl
	ld		(VBLVEC),hl

	in		a,(VDP_STAT)		; clear any existing vsync int req

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

	ld		hl,bios				; unpack bios
	ld		de,$e000
	call	dzx0_standard

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
	in		a,(VDP_STAT)
	pop		af
	ei
	reti



jsFix:
	LD		A,($70a0)
	BIT		1,A
	JP		nz,_js2

_js1:
	push	bc
	ld		c,$7f
	in		a,($37)
	bit		1,a		; L UP
	jr		z,{+}
	res		0,c
+:	bit		0,a		; L RIGHT
	jr		z,{+}
	res		1,c
+:	bit		3,a		; L DOWN
	jr		z,{+}
	res		2,c
+:	bit		2,a		; L LEFT
	jr		z,{+}
	res		3,c
+:	in		a,($31)
	bit		0,a		; L FIRE - 1
	jr		z,{+}
	res		6,c
+:	ld		a,c
	pop		bc
	ret


_js2:
	push	bc
	ld		c,$7f
	in		a,($37)
	bit		5,a		; R UP
	jr		z,{+}
	res		0,c
+:	bit		4,a		; R RIGHT
	jr		z,{+}
	res		1,c
+:	bit		7,a		; R DOWN
	jr		z,{+}
	res		2,c
+:	bit		6,a		; R LEFT
	jr		z,{+}
	res		3,c
+:	in		a,($31)
	bit		4,a		; R FIRE - 5
	jr		z,{+}
	res		6,c
+:	ld		a,c
	pop		bc
	ret





kpFix:
	push	hl
	push	bc

	in		a,($35) ; 9,0,... _ ^
	ld		b,a

	in		a,($31)	; 1,2,...8
	ld		c,a

	in		a,($30)	; bit 2 = lshift, bit 3 = rshift
	ld		l,a

	LD		A,($70a0)
	BIT		1,A
	ld		a,$7f
	jr		nz,_kp2

_kp1:
	bit		1,c		; 2
	jr		z,{+}

	res		6,a		; fire

+:	bit		2,l		; lshift
	jr		z,_kpout
	jr		_kp

_kp2:
	bit		5,c		; 6
	jr		z,{+}

	res		6,a		; fire

+:	bit		3,l		; rshift
	jr		z,_kpout

_kp:
	rr		c		; 1
	jr		nc,{+}
	and		%11111101
+:
	rr		c		; 2
	jr		nc,{+}
	and		%11110111
+:
	rr		c		; 3
	jr		nc,{+}
	and		%11111100
+:
	rr		c		; 4
	jr		nc,{+}
	and		%11110010
+:
	rr		c		; 5
	jr		nc,{+}
	and		%11110011
+:
	rr		c		; 6
	jr		nc,{+}
	and		%11111110
+:
	rr		c		; 7
	jr		nc,{+}
	and		%11110101
+:
	rr		c		; 8
	jr		nc,{+}
	and		%11110001
+:
	rr		b		; 9
	jr		nc,{+}
	and		%11111011
+:
	rr		b		; 0
	jr		nc,{+}
	and		%11111010
+:
	rr		b		; _ (*)
	jr		nc,{+}
	and		%11111001
+:
	rr		b		; ^ (#)
	jr		nc,{+}
	and		%11110110
+:
_kpout
	pop		hl	
	pop		bc
	ret




	.include "..\dzx0_standard.asm"


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"centiped.patched.bin.zx0"


	.ds 16384 - ($-$2000)
