	.asciimap ' ',' ',0

VBLVEC = $7406

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
	jp		0			; RST 20h jump
	jp		0			; RST 28h jump


	.org $2010

	jp		writereg	; $2010
	jp		ctrlrd1		; $2013
	jp		ctrlrd2		; $2016
	jp		starter		; $2019
	jp		vramvalid	; $201c
	jp		setter		; $201f


	.org $2030

start:

	ld		sp,$73b9			; BIOS stack

	ld		hl,vblno
	ld		(VBLVEC),hl

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

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	dzx0_standard

	ei

	ret


CRV_JS1 = $f0f0
CRV_JS2 = $f0f3
CRV_KP1 = $f0f6
CRV_KP2 = $f0f9

ctrlrd1:
	bit		0,c
	jr		z,{+}

	call	CRV_JS2
	cpl
	ret

+:	call	CRV_JS1
	cpl
	ret



ctrlrd2:
	bit		0,c
	jp		z,CRV_KP1
	jp		CRV_KP2



writereg:
	ld		a,$80
	cp		d
	ld		a,e
	jr		nz,{+}

	and		$fe
	ld		e,a
	ld		a,($1518)
	and		1
	or		e

+:	OUT		(VDP_Reg),A
	LD		A,D
	OUT		(VDP_Reg),A
	RET


setter:
	ld		a,$ff
	ld		(SETTERF),a
	ret


vramvalid:
	bit		6,d
	jr		z,{+}
	RES 6,D
	nop ; put breakpoint here; bps 205B,D>3f
	SET 6,D
+:	ld		a,e
	out 	(VDP_Reg),A
	ret


vblno:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(VDP_Status)		; clear any existing vsync int req
	pop		af
	reti


vblgo:
	push	af
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(VDP_Status)		; clear any existing vsync int req
	pop		af
	jp		$8021				; game interrupt vector







starter:
	ld		hl,vblgo
	ld		(VBLVEC),hl

	; ld		c,2
	; call	palbit

	; ld		bc,$01E2
	; call	$ffd9

	in		a,(VDP_Status)		; clear any existing vsync int req
	ei

	xor		a
	ld		(SETTERF),a

	; wait until game over
-:	ld		a,(SETTERF)
	inc		a
	jr		nz,{-}

	di

	; rejoin the restart train
	LD		A,($7080)
	jp		$855d



	.include "../dzx0_standard.asm"

cart
	.incbin	"video.patched.bin.zx0"


	.ds 16384 - ($-$2000)
