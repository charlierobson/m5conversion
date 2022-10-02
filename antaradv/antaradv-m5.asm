	.asciimap ' ',' ',0

VBLVEC = $7406

TEMP = $7408
JKFLAG = $7409
VBLCOUNT = $740A
MKEY = $740B

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
	jp		SetJSKB     ; RST 20h jump
	jp		ReadJSKB    ; RST 28h jump

	.org $2010

	ret \ nop \ nop		; $2010
	ret \ nop \ nop		; $2013
	ret \ nop \ nop		; $2016
	ret \ nop \ nop		; $2019
	ret \ nop \ nop		; $201c

	.org $2020

start:
	di

	ld		sp,$73b9			; BIOS stack

	ld		bc,$0180			; turn off screen, VDP interrupt
	call	WRITE_REGISTER		; BIOS WRITE_REGISTER

	in		a,(VDP_STAT)		; clear any pending interrupt flag

	ld		hl,$805c
	ld		(VBLVEC),hl

	in		a,(VDP_STAT)		; clear any existing vsync int req

	ei

	jp		COLECO_IDENT		; BIOS startup / colecovision screen

;	ld		hl,($800a)			; cart_start, bypasses colecovision screen
;	jp		(hl)


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
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(VDP_STAT)		; clear any existing vsync int req
	pop		af
	jp		$8021				; game interrupt vector






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
	.incbin	"antaradv.patched.bin.zx0"


	.ds $5000 - ($-$2000)
