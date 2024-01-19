.include "..\m5c-defs.inc"

PATCHINIT($8000)

; patch macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate

BIOS = $E000

IO_VDP_Data	= $10		; VDP data port
IO_VDP_Addr	= $11		; VDP VRAM address output port

; check 9 key instead of #
PATCH($9a9d,2)
	cp		$09
ENDPATCH($9a9d,2)

; check pad buttons to start
PATCH($9a23,6)
	jp		$2196
ENDPATCH($9a23,6)

; check pad buttons to restart
PATCH($9a96,6)
	jp		$21c8
ENDPATCH($9a96,6)


; RST1
PATCH($963f,4)
	call	$2100
ENDPATCH($963f,4)

PATCH($9649,4)
	call	$2100
ENDPATCH($9649,4)

PATCH($9653,4)
	call	$2106
ENDPATCH($9653,4)

PATCH($965d,4)
	call	$210C
ENDPATCH($965d,4)

PATCH($9667,4)
	call	$2112
ENDPATCH($9667,4)

PATCH($9671,4)
	call	$2118
ENDPATCH($9671,4)

PATCH($967b,4)
	call	$211E
ENDPATCH($967b,4)

PATCH($9685,4)
	call	$2124
ENDPATCH($9685,4)

PATCH($96fc,4)
	call	$212a
ENDPATCH($96fc,4)

PATCH($9706,4)
	call	$2130
ENDPATCH($9706,4)

PATCH($9777,4)
	call	$2136
ENDPATCH($9777,4)

PATCH($97bd,4)
	call	$2124
ENDPATCH($97bd,4)

PATCH($97d6,4)
	call	$2124
ENDPATCH($97d6,4)

PATCH($9863,4)
	call	$213c
ENDPATCH($9863,4)

; RST2
PATCH($96de,4)
	call	$2142
ENDPATCH($96de,4)

PATCH($96e8,4)
	call	$2142
ENDPATCH($96e8,4)

PATCH($96f2,4)
	call	$2148
ENDPATCH($96f2,4)

;RST3
PATCH($986a,5)
	call	$215E
ENDPATCH($986a,5)

PATCH($987b,5)
	call	$2166
ENDPATCH($987b,5)

PATCH($9880,5)
	call	$216E
ENDPATCH($9880,5)

PATCH($9896,5)
	call	$214E
ENDPATCH($9896,5)

PATCH($98a0,5)
	call	$2156
ENDPATCH($98a0,5)

; RST4
PATCH($986f,5)
	call	$2176
ENDPATCH($986f,5)

PATCH($9885,5)
	call	$217e
ENDPATCH($9885,5)

PATCH($9891,5)
	call	$2186
ENDPATCH($9891,5)

PATCH($989b,5)
	call	$218e
ENDPATCH($989b,5)

; MAME discovered patches

PATCH($9829,3)       
        call    $ffd9
ENDPATCH($9829,3)    

PATCH($95ed,3)       
        call    $ffd6
ENDPATCH($95ed,3)    

PATCH($9636,3)
        call    $ffdc
ENDPATCH($9636,3)

PATCH($982f,3)
        call    $ffdf
ENDPATCH($982f,3)

PATCH($8022,3)
        call    $ffdc
ENDPATCH($8022,3)

PATCH($9710,3)
        call    $ffd9
ENDPATCH($9710,3)

PATCH($aac0,3)
        call    $ff61
ENDPATCH($aac0,3)

PATCH($a6b1,3)
        call    $ff76
ENDPATCH($a6b1,3)
