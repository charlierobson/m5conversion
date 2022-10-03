	.asciimap ' ',' ',0

VBLVEC = $7406
VBLCOUNT = $740A

VDP_STAT = $11

BIOS_BASE = $e000


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

	jp		starter		; $2010


	.org $2020

start:
	di

	ld		sp,$73b9			; BIOS stack

	ld		bc,$0180			; turn off screen, VDP interrupt
	call	$ffd9				; BIOS WRITE_REGISTER

	in		a,(VDP_STAT)		; clear any pending interrupt flag

	ld		hl,inGameVBI		; set in game irq handler vector
	ld		(VBLVEC),hl

	ei

	jp		BIOS_BASE+$6e		; BIOS startup / colecovision screen

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

	ld		hl,preGameVBI				; set up vsync handler vector
	ld		(VBLVEC),hl

	ld		hl,bios				; unpack bios
	ld		de,BIOS_BASE
	call	dzx0_standard

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	dzx0_standard

	in		a,(VDP_STAT)		; clear any existing vsync int req
	ei
	ret



; runs before game has set up memory
preGameVBI:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(VDP_STAT)
	pop		af
	ei
	reti


; runs after game has set up memory
inGameVBI:
	push	af

	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a

	call	$8021				; game interrupt vector

	in		a,(VDP_STAT)		; clear any existing vsync int req
	pop		af
	ei
	reti



starter:
	in		a,(VDP_STAT)
	call	$ffd9
	ei
	ret



	.include "..\dzx0_standard.asm"


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"btime.patched.bin.zx0"


	.ds 16384 - ($-$2000)
