	.word $8000

;PATCH macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate



; regex replacement
; ^(\$\w\w\w\w) (.*)
; with
;PATCH($1,3)\n   $2\nENDPATCH($1,3)\n

BIOS_BASE = $E000

; coleco data port 0BEH
IO_VDP_Data = $10

; coleco register port 0BFH
IO_VDP_Addr = $11

IO_PSG = $20

PATCH($8ea0,3)
    jp	$2010
ENDPATCH($8ea0,3)

PATCH($91bc,3)
    call $ffd6
ENDPATCH($91bc,3)

PATCH($9204,3)
    call $ff7f
ENDPATCH($9204,3)

PATCH($9267,3)
    call $ffe2
ENDPATCH($9267,3)

PATCH($91c9,3)
    call $ffb8
ENDPATCH($91c9,3)

PATCH($91d1,3)
    call $ffb8
ENDPATCH($91d1,3)

PATCH($91d9,3)
    call $ffb8
ENDPATCH($91d9,3)

PATCH($91e0,3)
    call $ffb8
ENDPATCH($91e0,3)

PATCH($91e8,3)
    call $ffb8
ENDPATCH($91e8,3)

PATCH($926d,3)
    jp $ffdf
ENDPATCH($926d,3)

PATCH($91aa,3)
    call $ffdf
ENDPATCH($91aa,3)

PATCH($9256,3)
    call $ff79
ENDPATCH($9256,3)

PATCH($8f8a,3)
    jp $ffdf
ENDPATCH($8f8a,3)

PATCH($80a6,3)
    call $ffe2
ENDPATCH($80a6,3)

PATCH($92f8,3)
    call $ffdf
ENDPATCH($92f8,3)

PATCH($968d,3)
    call $ffd6
ENDPATCH($968d,3)

PATCH($80c3,3)
    call $ff7f
ENDPATCH($80c3,3)

PATCH($80f2,3)
    call $ffdf
ENDPATCH($80f2,3)

PATCH($80fc,3)
    call $ffdf
ENDPATCH($80fc,3)

PATCH($8d26,3)
    call $ff79
ENDPATCH($8d26,3)

PATCH($96b9,2)
   OUT (IO_PSG),A
ENDPATCH($96b9,2)

PATCH($96c4,2)
   OUT (IO_PSG),A
ENDPATCH($96c4,2)

PATCH($96cc,2)
   OUT (IO_PSG),A
ENDPATCH($96cc,2)

PATCH($96d7,2)
   OUT (IO_PSG),A
ENDPATCH($96d7,2)

PATCH($96e3,2)
   OUT (IO_PSG),A
ENDPATCH($96e3,2)

PATCH($9713,2)
   OUT (IO_PSG),A
ENDPATCH($9713,2)

PATCH($9718,2)
   OUT (IO_PSG),A
ENDPATCH($9718,2)


PATCH($917d,2)
    out (IO_VDP_Addr),a
ENDPATCH($917d,2)

PATCH($9180,2)
    out (IO_VDP_Addr),a
ENDPATCH($9180,2)

PATCH($9167,2)
    out (IO_VDP_Addr),a
ENDPATCH($9167,2)

PATCH($916c,2)
    out (IO_VDP_Addr),a
ENDPATCH($916c,2)

PATCH($916f,2)
    out (IO_VDP_Data),a
ENDPATCH($916f,2)

PATCH($9159,2)
    out (IO_VDP_Addr),a
ENDPATCH($9159,2)

PATCH($915e,2)
    out (IO_VDP_Addr),a
ENDPATCH($915e,2)

PATCH($9161,2)
    out (IO_VDP_Data),a
ENDPATCH($9161,2)

PATCH($9119,2)
    out (IO_VDP_Addr),a
ENDPATCH($9119,2)

PATCH($911c,2)
    out (IO_VDP_Addr),a
ENDPATCH($911c,2)


PATCH($9122,2)
   IN A,(IO_VDP_Data)
ENDPATCH($9122,2)

PATCH($9186,2)
   IN A,(IO_VDP_Data)
ENDPATCH($9186,2)

PATCH($81de,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($81de,2)

PATCH($822a,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($822a,2)

PATCH($9379,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($9379,2)

PATCH($939a,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($939a,2)


; rst1

PATCH($86dc,3)
	call	$2100
ENDPATCH($86dc,3)

PATCH($8755,3)
	call	$2100
ENDPATCH($8755,3)

PATCH($86dc,3)
	call	$2100
ENDPATCH($86dc,3)

PATCH($8abe,4)
	call	$2106
ENDPATCH($8abe,4)

PATCH($8ac7,3)
	call	$210c
ENDPATCH($8ac7,3)

PATCH($8d02,6)
	call	$2112
ENDPATCH($8d02,6)

PATCH($8ebd,4)
	call	$211d
ENDPATCH($8ebd,4)

; rst 2

PATCH($8121,1)
   RST 20h
ENDPATCH($8121,1)

PATCH($812e,1)
   RST 20h
ENDPATCH($812e,1)

PATCH($81f7,1)
   RST 20h
ENDPATCH($81f7,1)

PATCH($842d,1)
   RST 20h
ENDPATCH($842d,1)

PATCH($8442,1)
   RST 20h
ENDPATCH($8442,1)

PATCH($8448,1)
   RST 20h
ENDPATCH($8448,1)

PATCH($84cc,1)
   RST 20h
ENDPATCH($84cc,1)

PATCH($85cc,1)
   RST 20h
ENDPATCH($85cc,1)

PATCH($86ea,1)
   RST 20h
ENDPATCH($86ea,1)

PATCH($875e,1)
   RST 20h
ENDPATCH($875e,1)

PATCH($8905,1)
   RST 20h
ENDPATCH($8905,1)

PATCH($8908,1)
   RST 20h
ENDPATCH($8908,1)

PATCH($891e,1)
   RST 20h
ENDPATCH($891e,1)

PATCH($8969,1)
   RST 20h
ENDPATCH($8969,1)

PATCH($8ac5,1)
   RST 20h
ENDPATCH($8ac5,1)

PATCH($8acd,1)
   RST 20h
ENDPATCH($8acd,1)

PATCH($8ad0,1)
   RST 20h
ENDPATCH($8ad0,1)

PATCH($8ad5,1)
   RST 20h
ENDPATCH($8ad5,1)

PATCH($8d14,1)
   RST 20h
ENDPATCH($8d14,1)

PATCH($8d17,1)
   RST 20h
ENDPATCH($8d17,1)

PATCH($8e3e,1)
   RST 20h
ENDPATCH($8e3e,1)

PATCH($8e53,1)
   RST 20h
ENDPATCH($8e53,1)

PATCH($8ec9,1)
   RST 20h
ENDPATCH($8ec9,1)

PATCH($8ecc,1)
   RST 20h
ENDPATCH($8ecc,1)

PATCH($8ede,1)
   RST 20h
ENDPATCH($8ede,1)

PATCH($8f99,1)
   RST 20h
ENDPATCH($8f99,1)

PATCH($8f9b,1)
   RST 20h
ENDPATCH($8f9b,1)

PATCH($8f9e,1)
   RST 20h
ENDPATCH($8f9e,1)

PATCH($8fa0,1)
   RST 20h
ENDPATCH($8fa0,1)

PATCH($8fab,1)
   RST 20h
ENDPATCH($8fab,1)

PATCH($8fb0,1)
   RST 20h
ENDPATCH($8fb0,1)

PATCH($8fbb,1)
   RST 20h
ENDPATCH($8fbb,1)

PATCH($8fbf,1)
   RST 20h
ENDPATCH($8fbf,1)

PATCH($8feb,1)
   RST 20h
ENDPATCH($8feb,1)

PATCH($8ff2,1)
   RST 20h
ENDPATCH($8ff2,1)

PATCH($91f9,1)
   RST 20h
ENDPATCH($91f9,1)

; rst 3

PATCH($8087,4)
	call	$2125
ENDPATCH($8087,4)

PATCH($8099,4)
	call	$212b
ENDPATCH($8099,4)

PATCH($85a7,4)
	call	$2131
ENDPATCH($85a7,4)

PATCH($85ff,3)
	call	$2137
ENDPATCH($85ff,3)

PATCH($8e72,4)
	call	$213d
ENDPATCH($8e72,4)

PATCH($9227,4)
	call	$2143
ENDPATCH($9227,4)

; rst4

PATCH($8211,3)
	call	$2149
ENDPATCH($8211,3)

PATCH($8312,3)
	call	$214e
ENDPATCH($8312,3)

PATCH($8328,3)
	call	$2154
ENDPATCH($8328,3)

PATCH($873c,3)
	call	$2159
ENDPATCH($873c,3)

PATCH($893e,3)
	call	$215e
ENDPATCH($893e,3)

PATCH($8a53,3)
	call	$2163
ENDPATCH($8a53,3)

PATCH($8b05,3)
	call	$2168
ENDPATCH($8b05,3)

PATCH($8b19,3)
	call	$216d
ENDPATCH($8b19,3)

PATCH($8c4f,6)
	jp		$2172
ENDPATCH($8c4f,6)

PATCH($8e24,3)
	jp		$2179
ENDPATCH($8e24,3)

PATCH($9347,3)
	call	$217e
ENDPATCH($9347,3)

; rst 6

PATCH($80d3,4)
	call	$2183
ENDPATCH($80d3,4)

PATCH($80dd,3)
	call	$2189
ENDPATCH($80dd,3)

PATCH($81c0,3)
	call	$218e
ENDPATCH($81c0,3)

PATCH($859f,5)
	call	$2193
ENDPATCH($859f,5)

PATCH($9199,3)
	call	$219a
ENDPATCH($9199,3)

PATCH($91bf,5)
	call	$21a0
ENDPATCH($91bf,5)

PATCH($921f,5)
	call	$21a7
ENDPATCH($921f,5)

PATCH($9239,3)
	call	$21ae
ENDPATCH($9239,3)

PATCH($927a,9)
	call	$21b3
ENDPATCH($927a,9)

PATCH($92bf,5)
	call	$21c0
ENDPATCH($92bf,5)

; rst 7

PATCH($8425,3)
	call	$21c7
ENDPATCH($8425,3)

PATCH($85c8,3)
	call	$21cc
ENDPATCH($85c8,3)

PATCH($8ce0,5)
	jp		$21d1
ENDPATCH($8ce0,5)

PATCH($8cea,4)
	call	$21d9
ENDPATCH($8cea,4)

PATCH($8cf5,6)
	jp		$21df
ENDPATCH($8cf5,6)

PATCH($8d6c,3)
	jp		$21e6
ENDPATCH($8d6c,3)

PATCH($8ecf,4)
	jp		$21ea
ENDPATCH($8ecf,4)
