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
	jp		SetJSKB     ; RST 20h jump
	jp		ReadJSKB    ; RST 28h jump

	.org $2010

	jp		palbit		; $2010
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

	ld		hl,bios				; unpack bios
	ld		de,$e000
	call	dzx0_standard

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	dzx0_standard

	ei

	ret


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




palbit:
	ld		a,($1518)		; use a difference in ROM to determine if JP or EU machine
	and		1				; PAL has E1 here, NTSC E0
	or		c
	ld		c,a
	jp		$ffd9			; WRITE_REGISTER



ctrlrd1:
	push	bc
	ld		a,c
	and		1
	ld		c,0
	jr		z,_js1x

_js2x:
	in		a,($37)
	bit		5,a
	jr		z,{+}
	set		0,c
+:	bit		4,a
	jr		z,{+}
	set		1,c
+:	bit		7,a
	jr		z,{+}
	set		2,c
+:	bit		6,a
	jr		z,{+}
	set		3,c
+:	in		a,($31)
	bit		4,a
	jr		z,_donex
	set		6,c

_donex:
	ld		a,c
	pop		bc
	ret

_js1x:
	in		a,($37)
	bit		1,a		; L UP
	jr		z,{+}
	set		0,c
+:	bit		0,a		; L RIGHT
	jr		z,{+}
	set		1,c
+:	bit		3,a		; L DOWN
	jr		z,{+}
	set		2,c
+:	bit		2,a		; L LEFT
	jr		z,{+}
	set		3,c
+:	in		a,($31)
	bit		0,a
	jr		z,{+}
	set		6,c
+:	jr		_donex




ctrlrd2:
	ld		a,c
	and		1
	in		a,($31)
	jr		z,_kp1x

_kp2x:
	;        87654321
	and		%00100000
	rlca
	ret

_kp1x:
	;        87654321
	and		%00000010
	rrca
	rrca
	rrca
	ret



starter:
	ld		hl,vblgo
	ld		(VBLVEC),hl

	ld		c,2
	call	palbit

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


SetJSKB:
	ld		(TEMP),a	; temp
	di
	ex		(sp),hl
	ld		a,(hl)
	inc		hl
	ex		(sp),hl
	ei
	and		$40
	ld		(JKFLAG),a	; stash js/jb flag: 0 = kp, $40 = js
	ld		a,(TEMP)
	ret


; R.JOY | R.JOY | R.JOY | R.JOY | L.JOY | L.JOY | L.JOY | L.JOY | 37
;   |   |  <--  |   ^   |  -->  |   |   |  <--  |   ^   |  -->  |
;   v   |       |   |   |       |   v   |       |   |   |       |

;   8   |   7   |   6   |   5   |   4   |   3   |   2   |   1   | 31

; coleco: -F--LDRU

ReadJSKB:
	di
	ex		(sp),hl
	ld		a,(hl)
	inc		hl
	ex		(sp),hl
	ei
	and		$01			; Z is js 1, NZ is js 2
	ld		a,(JKFLAG)
	push	bc
	ld		bc,0
	jr		nz,_ctrlr2

_ctrlr1:
	and		a
	jp		z,_kp

_js1:
	in		a,($37)
	bit		1,a		; L UP
	jr		z,{+}
	set		0,c
+:	bit		0,a		; L RIGHT
	jr		z,{+}
	set		1,c
+:	bit		3,a		; L DOWN
	jr		z,{+}
	set		2,c
+:	bit		2,a		; L LEFT
	jr		z,{+}
	set		3,c
+:	in		a,($31)
	bit		0,a
	jr		z,{+}
	set		6,c
+:	jr		_rst5done


_ctrlr2:
	and		a
	jp		z,_kp

_js2:
	in		a,($37)
	bit		5,a
	jr		z,{+}
	set		0,c
+:	bit		4,a
	jr		z,{+}
	set		1,c
+:	bit		7,a
	jr		z,{+}
	set		2,c
+:	bit		6,a
	jr		z,{+}
	set		3,c
+:	in		a,($31)
	bit		4,a
	jr		z,_rst5done
	set		6,c

_rst5done:
	ld		a,c
	cpl
	pop		bc
	ret

_kp:
	ld		c,0

	in		a,($31)
	and		a
	jr		z,_rst5done

_findBit:
	inc		c
	srl		a
	jr		nc,_findBit
	jr		_rst5done


	.include "..\dzx0_standard.asm"


bios
	.incbin	"..\colecobios.bin.zx0"

cart
	.incbin	"video.patched.bin.zx0"


	.ds 16384 - ($-$2000)
