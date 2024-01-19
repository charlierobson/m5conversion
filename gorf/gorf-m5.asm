	.asciimap ' ',' ',0

VBLVEC = $7406

VBLCOUNT = $740A

IO_VDP_Status = $11

BIOS = $e000

COLECO_IDENT = $e06e
SKILL_SCREEN = $ff7c


	.org $2000

	.db		2           ; identifier
	.dw		0			; start execution address	$2001 (not used here)
	.dw		ipl         ; IPL address				$2003 (initial program loader, who knew)
	jp		$ac6c		; RST 20h jump
	jp		$8733		; RST 28h jump

	.org $2010

	jp		starter		; $2010


	.org $2020

ipl:							; initial program loader
	di

	ld		a,$01               ; disable timer interrupts
	out		($01),a

	ld		a,$74				; relocate IM2 vector base
	ld		i,a

	ld		hl,cart				; unpack game and get ready to go
	ld		de,$8000
	call	decruncher

	ld		hl,$7000			; clear ram
	ld		(hl),0
	ld		de,$7001
	ld		bc,$$7ff
	ldir

	ld		sp,$73b9			; coleco bios sez so

	ld		hl,vbl				; vbl isr
	ld		(VBLVEC),hl

	in		a,(IO_VDP_Status)		; clear any existing vsync int req
	ei

	jp		COLECO_IDENT



vbl:
	push	af
	ld		a,($702c)
	or		1
	ld		($702c),a
	ld		a,(VBLCOUNT)
	inc		a
	ld		(VBLCOUNT),a
	in		a,(IO_VDP_Status)
	pop		af
	ei
	reti


starter:
	in		a,(IO_VDP_Status)
	ei
	jp		SKILL_SCREEN



	.org	$2100

.module rst3

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

rst4 = $fffd

_1:
	call	rst4
	ld		a,($702c)
	ret

_2:
	call	rst4
	jp		$ffdc	; careful! careless patch could overwrite this

_3:
	call	rst4
	ld		hl,$703c
	ret

_4:
	call	rst4
	ld		($7268),a
	jp		rst4

_5:
	push	hl
	call	rst4
	pop		hl
	ret

_6:
	call	rst4
	ld		($7268),a
	jp		rst4

_7:
	ld		($71fd),a
	jp		rst4

_8:
	push	af
	call	rst4
	pop		af
	ret

_9:
	call	rst4
	ld		hl,$703d
	ret

_10:
	call	rst4
	ld		hl,$7037
	ret

_11:
	call	rst4
	and		$f
	ret

.endmodule


.module rst5

rst5 = $8955

_1:
	call	rst5
	ld		iy,$7000
	ret

_2:
	call	$a5db
	jp		rst5

_3:
	push	bc
	call	rst5
	pop		bc
	ret

_4:
	call	rst5
	jp		$ffeb

_5:
	call	$b30d
	jp		rst5

_6:
	call	$8fe9
	jp		rst5

.endmodule


.module rst6

rst6 = $ff82

_1:
	ld		de,$800
	jp		rst6

_2:
	call	rst6
	ld 		a,$f0
	ld 		de,$a
	ld 		hl,$360d
	jp		rst6

_3:
	ld 		de,$20
	jp		rst6

_4:
	call	rst6
	ld 		a,$d0
	ld 		hl,$1800
	ld 		de,$1
	jp		rst6

_5:
	call	rst6
	ld 		de,$1
	ld 		hl,$361f
	ld 		a,$70
	jp		rst6

_6:
	ld		hl,$ee3
	jp		rst6

_7:
	ld 		de,$20
	xor		a
	jp		rst6

_8:
	ld		a,$90
	jp		rst6

.endmodule



decruncher
	.include "..\dzx0_standard.asm"


cart
	.incbin	"gorf.patched.bin.zx0"


.if $-$2000 > 16384
.echo "\n20k ROM\n\n"
	.ds 20480 - ($-$2000)
.else
	.ds 16384 - ($-$2000)
.endif
