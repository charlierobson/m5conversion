	.asciimap ' ',' ',0

VBLVEC = $7406

VBLCOUNT = $740A

VDP_STAT = $11

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
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump

	.org $2010

		ret \ nop \ nop		; $2010


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

	ei

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
	push	af

	call	$ffdc				; don't call game irq... all it does is this

	in		a,(VDP_STAT)		; clear any existing vsync int req
	pop		af
	ei
	reti


	.org $2100

RST1 = $982e
RST2 = $9834
RST3 = $9628
RST4 = $962f

L2100:
	; ram:$963f 01 00 08        LD         BC,$800
	; ram:$9649 01 00 08        LD         BC,$800
	LD		BC,$800
	jp		RST1

L2106:
	; ram:$9653 01 80 00        LD         BC,$80
	LD		BC,$80
	jp		RST1

L210C:
	; ram:$965d 01 30 00        LD         BC,$30
	LD		BC,$30
	jp		RST1

L2112:
	; ram:$9667 01 00 06        LD         BC,$600
	LD		BC,$600
	jp		RST1

L2118:
	; ram:$9671 01 90 00        LD         BC,$90
	LD		BC,$90
	jp		RST1

L211E:
	; ram:$967b 01 00 03        LD         BC,$300
	LD		BC,$300
	jp		RST1

L2124:
	; ram:$9685 01 40 00        LD         BC,$40
	; ram:$97bd 01 40 00        LD         BC,$40
	; ram:$97d6 01 40 00        LD         BC,$40
	LD		BC,$40
	jp		RST1

L212A:
	; ram:$96fc 01 40 07        LD         BC,$740
	LD		BC,$740
	jp		RST1

L2130:
	; ram:$9706 01 2d 00        LD         BC,$2d
	LD		BC,$2d
	jp		RST1

L2136:
	; ram:$9777 01 c0 03        LD         BC,$3c0
	LD		BC,$3c0
	jp		RST1

L213c:
	; ram:$9863 01 08 00        LD         BC,$8
	LD		BC,$08
	jp		RST1

; RST2
L2142:
	; ram:96de 01 20 00        LD         BC,$20
	; ram:96e8 01 20 00        LD         BC,$20
	LD		BC,$20
	jp		RST2

L2148:
	; ram:96f2 01 40 00        LD         BC,$40
	LD		BC,$40
	jp		RST2

; RST3
L214E:
	; ram:9896 dd 21 50 73     LD         IX,$7350
	LD		IX,$7350
	jp		RST3 \ nop

L2156:
	; ram:98a0 dd 21 58 73     LD         IX,$7358
	LD		IX,$7358
	jp		RST3 \ nop

L215E:
	; ram:986a dd 21 38 73     LD         IX,$7338
	LD		IX,$7338
	jp		RST3 \ nop

L2166:
	; ram:987b dd 21 40 73     LD         IX,$7340
	LD		IX,$7340
	jp		RST3 \ nop

L216E:
	; ram:9880 dd 21 44 73     LD         IX,$7344
	LD		IX,$7344
	jp		RST3 \ nop

; RST4
L2176:
	; ram:986f dd 21 3c 73     LD         IX,$733c
	LD		IX,$733c
	jp		RST4 \ nop

L217E:
	; ram:9885 dd 21 48 73     LD         IX,$7348
	LD		IX,$7348
	jp		RST4 \ nop

L2186:
	; ram:9891 dd 21 4c 73     LD         IX,$734c
	LD		IX,$734c
	jp		RST4 \ nop

L218E:
	; ram:989b dd 21 54 73     LD         IX,$7354
	LD		IX,$7354
	jp		RST4 \ nop



	.include "..\dzx0_standard.asm"


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"frogger.patched.bin.zx0"


	.ds 16384 - ($-$2000)
