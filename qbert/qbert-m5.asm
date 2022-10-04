	.asciimap ' ',' ',0

VBLVEC = $7406

TEMP = $7408
JKFLAG = $7409
VBLCOUNT = $740A
MKEY = $740B
SETTERF = $740C

VDP_Data	=	$10			; VDP data port
VDP_Addr	=	$11			; VDP VRAM address output port
VDP_Reg		=	$11			; VDP VRAM address output port
VDP_Status	=	$11			; VDP status input port


BIOS = $e000

WRITE_REGISTER = BIOS + $1fd9
COLECO_IDENT = BIOS + $6e

; colour table			= 0000 (+1800)
; name table			= 1800 (+400)
; sprite attrib table	= 1c00 (+400)
; pattern table			= 2000 (+1800)
; sprite pattern table	= 3800

; mode (graphic) 2 - 

	.org $2000

	.db		2           ; identifier
	.dw		start       ; start execution address	$2001
	.dw		ipl         ; IPL address				$2003 (initial program loader, who knew)
	jp		$9157		; RST 20h (4) jump
	jp		$ffd9		; RST 28h (5) jump


	.org $2010

	jp		irqFixup	; $2010
	ret \ nop \ nop		; $2013
	ret \ nop \ nop		; $2016
	ret \ nop \ nop		; $2019
	ret \ nop \ nop		; $201c
	ret \ nop \ nop		; $201f


	.org $2030

start:

	ld		sp,$73b9			; BIOS stack

	ld		hl,vblgo
	ld		(VBLVEC),hl

	ei

	jp		$8024



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

	ei

	ret




vblgo:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	pop		af
	call	$8021				; game interrupt vector
	in		a,(VDP_Status)		; clear any existing vsync int req
	ei
	reti




starter:
	ld		hl,vblgo
	ld		(VBLVEC),hl

	in		a,(VDP_Status)		; clear any existing vsync int req
	ei

	ret


irqFixup:
	ld		hl,{+}
	push	hl
	reti
+:	pop		hl
	pop		hl
	pop		hl
	in		a,(VDP_Status)		; clear any existing vsync int req
	ei
	JP		$8ea3


	.include "..\dzx0_standard.asm"


rst1 = $9178
rst2 = $9157
rst3 = $9189
rst4 = $962b
rst5 = $ffd9
rst6 = $9164
rst7 = $8ed3

.define PATCHFN(x) .if $ != x \ .fail "patchfn fail " \ .endif \ .org x \ pfn{x}

	.org	$2100

PATCHFN($2100)
	call	rst1
	and		$0f
	ret

PATCHFN($2106)
	LD		HL,$1b1c
	jp		rst1

PATCHFN($210c)
	call	rst1
	inc		hl
	inc		hl
	ret

PATCHFN($2112)
	call	rst1
	push	af
	inc		hl
	call	rst1
	ld		l,a
	pop		af
	ret

PATCHFN($211d)
	call	rst1
	ld		b,a
	inc		hl
	jp		rst1

PATCHFN($2125)
	ld		hl,$3800
	jp		rst3

PATCHFN($212b)
	ld		hl,$1b80
	jp		rst3

PATCHFN($2131)
	ld		BC,$9be7
	jp		rst3

PATCHFN($2137)
	push	af
	call	rst3
	pop		af
	ret

PATCHFN($213d)
	LD		BC,$8ea9
	jp		rst3

PATCHFN($2143)
	ld		hl,$1800
	jp		rst3


PATCHFN($2149)
	ld		a,$04
	jp		rst4

PATCHFN($214e)
	ld		a,b
	call	rst4
	exx
	ret

PATCHFN($2154)
	ld		a,$0a
	jp		rst4

PATCHFN($2159)
	ld		a,$0d
	jp		rst4

PATCHFN($215e)
	ld		a,$07
	jp		rst4

PATCHFN($2163)
	ld		a,$05
	jp		rst4

PATCHFN($2168)
	ld		a,$0c
	jp		rst4

PATCHFN($216d)
	ld		a,$08
	jp		rst4

PATCHFN($2172)
	JR		Z,{+}
	LD		A,$09
+:	jp		rst4

PATCHFN($2179)
	ld		a,$06
	jp		rst4

PATCHFN($217e)
	and		$03
	jp		rst4

PATCHFN($2183)
	ld		hl,$21f0
	jp		rst6

PATCHFN($2189)
	ld		a,$e0
	jp		rst6

PATCHFN($218e)
	ld		a,$30
	jp		rst6

PATCHFN($2193)
	ld		de,$80
	xor		a
	jp		rst6

PATCHFN($219a)
	push	de
	call	rst6
	pop		de
	ret

PATCHFN($21a0)
	ld		de,$4000
	xor		a
	jp		rst6

PATCHFN($21a7)
	ld		de,$0008
	xor		a
	jp		rst6

PATCHFN($21ae)
	ld		a,$b4
	jp		rst6

PATCHFN($21b3)
	push	de
	xor		a
	call	rst6
	ld		hl,0
	pop		de
	xor		a
	jp		rst6

PATCHFN($21c0)
	ld		de,$176
	xor		a
	jp		rst6

PATCHFN($21c7)
	ld		a,$2c
	jp		rst7

PATCHFN($21cc)
	ld		b,0
	jp		rst7

PATCHFN($21d1)
	call	rst7
	inc		b
	ld		a,c
	jp		rst7

PATCHFN($21d9)
	ld		b,$07
	xor		a
	jp		rst7

PATCHFN($21df)
	jr		nz,{+}
	ld		a,$58
+:	jp		rst7

PATCHFN($21e6)
	ld		a,c
	jp		rst7

PATCHFN($21ea)
	inc		b
	call	rst7
	dec		b
	ret


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"qbert.patched.bin.zx0"


	.ds 16384 - ($-$2000)
