.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($86d7, 2)
	ret					; return from irq handler instead of reti
ENDPATCH($86d7, 2)

PATCH($9064, 3)
	call	$2010		; STARTER enable interrupts after difficulty select screen was shown
ENDPATCH($9064, 3)

PATCH($8478, 3)
	ld		hl,$f5a3	; pointer to charset data in BIOS
ENDPATCH($8478, 3)

PATCH($85bb, 3)
	ld		bc,$0711	; black black
ENDPATCH($85bb, 3)

PATCH($8336, 3)
	ld		hl,$f857	; pointer to charset data in BIOS
ENDPATCH($8336, 3)

PATCH($86fb, 2)
	cp		1			; game restart
ENDPATCH($86fb, 2)

PATCH($8725, 2)
	cp		2			; level select
ENDPATCH($8725, 2)



; naughty naughty, direct VDP accesses
PATCH($9c7c, 2)
	out		(IO_VDP_Addr),a
ENDPATCH($9c7c, 2)

PATCH($9c83, 2)
	out		(IO_VDP_Addr),a
ENDPATCH($9c83, 2)

PATCH($9c88, 2)
	in		a,(IO_VDP_Data)
ENDPATCH($9c88, 2)

PATCH($9c90, 2)
	out		(IO_VDP_Addr),a
ENDPATCH($9c90, 2)

PATCH($9c94, 2)
	out		(IO_VDP_Data),a
ENDPATCH($9c94, 2)


; mame discovered patches

PATCH($805b,3)
	call	$ff7c
ENDPATCH($805b,3)

PATCH($875e,3)
	call	$ffeb
ENDPATCH($875e,3)

PATCH($83a0,3)
	call	$ff82
ENDPATCH($83a0,3)

PATCH($85ad,3)
	call	$ffe5
ENDPATCH($85ad,3)

PATCH($85b2,3)
	call	$ffc1
ENDPATCH($85b2,3)

PATCH($85b8,3)
	call	$ffd9
ENDPATCH($85b8,3)

PATCH($85be,3)
	call	$ffd9
ENDPATCH($85be,3)

PATCH($85c6,3)
	call	$ffb8
ENDPATCH($85c6,3)

PATCH($85ce,3)
	call	$ffb8
ENDPATCH($85ce,3)

PATCH($85d6,3)
	call	$ffb8
ENDPATCH($85d6,3)

PATCH($85de,3)
	call	$ffb8
ENDPATCH($85de,3)

PATCH($85e6,3)
	call	$ffb8
ENDPATCH($85e6,3)

PATCH($85ef,3)
	call	$ffc7
ENDPATCH($85ef,3)

PATCH($903d,3)
	call	$ffbe
ENDPATCH($903d,3)

PATCH($8450,3)
	call	$ff82
ENDPATCH($8450,3)

PATCH($845d,3)
	call	$ff82
ENDPATCH($845d,3)

PATCH($842b,3)
	call	$ff82
ENDPATCH($842b,3)

PATCH($8097,3)
	call	$ffbe
ENDPATCH($8097,3)

PATCH($9064,3)
	call	$ffd9
ENDPATCH($9064,3)

PATCH($8631,3)
	call	$ffd3
ENDPATCH($8631,3)

PATCH($8634,3)
	call	$fff4
ENDPATCH($8634,3)

PATCH($8637,3)
	call	$ff61
ENDPATCH($8637,3)

PATCH($863a,3)
	call	$ffeb
ENDPATCH($863a,3)

PATCH($86bd,3)
	call	$ffc4
ENDPATCH($86bd,3)

PATCH($86c0,3)
	call	$ffe8
ENDPATCH($86c0,3)

PATCH($86c3,3)
	call	$ffdc
ENDPATCH($86c3,3)

PATCH($9ae0,3)
	call	$ff82
ENDPATCH($9ae0,3)

PATCH($905a,3)
	call	$ffd9
ENDPATCH($905a,3)

PATCH($83b2,3)
	call	$ffbe
ENDPATCH($83b2,3)

PATCH($90d3,3)
	call	$fffa
ENDPATCH($90d3,3)

PATCH($9153,3)
	call	$fff7
ENDPATCH($9153,3)

PATCH($917a,3)
	call	$fffa
ENDPATCH($917a,3)

PATCH($9ceb,3)
	call	$fff1
ENDPATCH($9ceb,3)

PATCH($82c5,3)
	call	$ff82
ENDPATCH($82c5,3)

PATCH($830d,3)
	call	$ffbe
ENDPATCH($830d,3)

PATCH($9ce1,3)
	call	$fff1
ENDPATCH($9ce1,3)

PATCH($92b2,3)
	call	$fffa
ENDPATCH($92b2,3)

PATCH($862e,3)
	call	$ffbe
ENDPATCH($862e,3)

PATCH($8917,3)
	call	$fffa
ENDPATCH($8917,3)

PATCH($8adb,3)
	call	$ffbb
ENDPATCH($8adb,3)

PATCH($8fcf,3)
	call	$fffa
ENDPATCH($8fcf,3)

PATCH($996a,3)
	call	$fffa
ENDPATCH($996a,3)

PATCH($9cff,3)
	call	$fff1
ENDPATCH($9cff,3)

PATCH($bdb6,3)
	call	$fffa
ENDPATCH($bdb6,3)

PATCH($86ee,3)
	call	$ffeb
ENDPATCH($86ee,3)

PATCH($8322,3)
	call	$ffbe
ENDPATCH($8322,3)

PATCH($87a8,3)
	call	$ffeb
ENDPATCH($87a8,3)

PATCH($9cf5,3)
	call	$fff1
ENDPATCH($9cf5,3)

PATCH($85f5,3)
	jp		$ffd9
ENDPATCH($85f5,3)

PATCH($9cdc,3)
	jp		$ffee
ENDPATCH($9cdc,3)

PATCH($b968,3)
	jp		$fffa
ENDPATCH($b968,3)

PATCH($9cf0,3)
	jp		$fff1
ENDPATCH($9cf0,3)

PATCH($9ce6,3)
	jp		$fff1
ENDPATCH($9ce6,3)

PATCH($9d27,3)
	jp		$fff1
ENDPATCH($9d27,3)

PATCH($9d09,3)
	jp		$fff1
ENDPATCH($9d09,3)

PATCH($88c6,3)
	jp		$fffa
ENDPATCH($88c6,3)

PATCH($9d04,3)
	jp		$fff1
ENDPATCH($9d04,3)

PATCH($9d0e,3)
	jp		$fff1
ENDPATCH($9d0e,3)

PATCH($9d13,3)
	jp		$fff1
ENDPATCH($9d13,3)

PATCH($9d18,3)
	jp		$fff1
ENDPATCH($9d18,3)

PATCH($9cfa,3)
	jp		$fff1
ENDPATCH($9cfa,3)

PATCH($9d22,3)
	jp		$fff1
ENDPATCH($9d22,3)

PATCH($9d1d,3)
	jp		$fff1
ENDPATCH($9d1d,3)

PATCH($9d2c,3)
	jp		$fff1
ENDPATCH($9d2c,3)
