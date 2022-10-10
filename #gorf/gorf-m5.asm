	.asciimap ' ',' ',0

VBLVEC = $7406

VBLCOUNT = $740A

;RAMDECRUNCH = $7410

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
	jp		$ac6c		; RST 20h jump
	jp		$8733		; RST 28h jump

	.org $2010

	ret \ nop \ nop		; $2010


	.org $2020

ipl:							; initial program loader
	di

	ld		a,$01               ; disable timer interrupts
	out		($01),a

	ld		hl,$7000			; copy interrupt vectors
	ld		de,$7400
	ld		bc,$10
	ldir

;	ld		hl,decruncher
;	ld		de,RAMDECRUNCH
;	ld		bc,decrunchend-decruncher
;	ldir

	ld		a,$74				; relocate IM2 vector base
	ld		i,a

	ld		hl,bios				; unpack bios
	ld		de,$e000
	call	decruncher

	ld		hl,cart				; unpack game
	ld		de,$8000
	call	decruncher

	ret



start:
	di

	ld		sp,$73b9			; BIOS stack

	ld		hl,vbl
	ld		(VBLVEC),hl

	in		a,(VDP_STAT)		; clear any existing vsync int req

	ei

	jp		COLECO_IDENT

	ld		hl,($800a)			; cart_start, bypasses colecovision screen
	jp		(hl)



vbl:
	push	af
	ld		a,($702c)
	or		1
	ld		($702c),a
	in		a,(VDP_STAT)
	pop		af
	ei
	reti

.module rst3
	.org	$2100

RST3 = $fff1

.define mrst3(num) ld b,num \ jp RST3

	mrst3($00)
	mrst3($01)
	mrst3($02)
	mrst3($03)
	mrst3($04)
	mrst3($05)
	mrst3($06)
	mrst3($07)
	mrst3($08)
	mrst3($09)
	mrst3($0a)
	mrst3($0b)
	mrst3($0c)
	mrst3($0d)
	mrst3($0e)
	mrst3($0f)
	mrst3($10)
	mrst3($11)
	mrst3($12)
	mrst3($13)
	mrst3($14)
	mrst3($15)
	mrst3($16)
	mrst3($17)
	mrst3($18)
	mrst3($19)
	mrst3($1a)
	mrst3($1b)
	mrst3($1c)
	mrst3($1d)
	mrst3($1e)
	mrst3($1f)
.endmodule


.module rst4

RST4 = $Fffd

_1:
	call	RST4
	LD		A,($702c)
	ret

_2:
	call	RST4
	JP		$ffdc	; careful! patcher will overwrite this

_3:
	call	RST4
	LD		HL,$703c
	ret

_4:
	call	RST4
	LD		($7268),A
	jp		RST4

_5:
	PUSH	HL
	call	RST4
	POP		HL
	ret

_6:
	call	RST4
	LD		($7268),A
	jp		RST4

_7:
	LD		($71fd),A
	jp		RST4

_8:
	PUSH	AF
	call	RST4
	POP		AF
	ret

_9:
	call	RST4
	LD		HL,$703d
	ret

_10:
	call	RST4
	LD		HL,$7037
	ret

_11:
	call	RST4
	AND		$f
	ret

.endmodule


.module rst5

RST5 = $8955

_1:
	call	RST5
	LD		IY,$7000
	ret

_2:
	CALL	$a5db
	jp		RST5

_3:
	PUSH	BC
	call	RST5
	POP		BC
	ret

_4:
	call	RST5
	jp		$ffeb

_5:
	CALL	$b30d
	jp		RST5
_6:
	CALL	$8fe9
	jp		RST5

.endmodule


decruncher:
	.include "..\de-lzee.asm"
decrunchend:


bios
	.incbin	"..\colecobios.bin.lzee"

cart
	.incbin	"gorf.patched.bin.lzee"


.if $-$2000 > 16384
.echo "\n20k ROM\n\n"
	.ds 20480 - ($-$2000)
.else
	.ds 16384 - ($-$2000)
.endif
