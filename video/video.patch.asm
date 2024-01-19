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

BIOS = $E000

; coleco data port 0BEH
IO_VDP_Data = $10

; coleco register port 0BFH
IO_VDP_Addr = $11



; remove IM setting
PATCH($80BB,2)
   nop \ nop
ENDPATCH($80BB,2)

; starter
PATCH($8112,3)
   jp	$2019
ENDPATCH($8112,3)

PATCH($811f,2)
   nop \ nop
ENDPATCH($811f,2)

PATCH($812c,3)
   call    $2013
ENDPATCH($812c,3)

PATCH($8149,7)
   call    $2016
ENDPATCH($8149,7)


CRV_JS1 = $f0f0
CRV_JS2 = $f0f3
CRV_KP1 = $f0f6
CRV_KP2 = $f0f9

PATCH($85b6,10)
	call	CRV_KP1
	ld		b,a
	call	CRV_KP2
ENDPATCH($85b6,10)


; unknown what this does so nix it
; ram:86ea	OUT (0x0),A		FUN_ram_86e5 ??
PATCH($86ea,2)
   nop \ nop
ENDPATCH($86ea,2)


PATCH($9bf0,2)
   out ($20),a
ENDPATCH($9bf0,2)

PATCH($9c46,2)
   out ($20),a
ENDPATCH($9c46,2)

PATCH($9c4f,2)
   out ($20),a
ENDPATCH($9c4f,2)

; mame autogen

PATCH($80cd,3)
   call    $ff7c
ENDPATCH($80cd,3)

PATCH($805b,2)
   out ($11),a
ENDPATCH($805b,2)

PATCH($805e,2)
   out ($11),a
ENDPATCH($805e,2)

PATCH($873f,2)
   out ($10),a
ENDPATCH($873f,2)

PATCH($872d,2)
   out ($10),a
ENDPATCH($872d,2)

PATCH($8981,2)
   out ($10),a
ENDPATCH($8981,2)

PATCH($80b2,2)
   out ($10),a
ENDPATCH($80b2,2)

PATCH($926c,2)
   out ($10),a
ENDPATCH($926c,2)

PATCH($9273,2)
   out ($10),a
ENDPATCH($9273,2)

PATCH($9953,2)
   ld c,$10
ENDPATCH($9953,2)

PATCH($9af8,2)
   out ($10),a
ENDPATCH($9af8,2)

PATCH($9aff,2)
   out ($10),a
ENDPATCH($9aff,2)

PATCH($86ca,2)
   out ($10),a
ENDPATCH($86ca,2)

PATCH($86cf,2)
   out ($10),a
ENDPATCH($86cf,2)

PATCH($86d7,2)
   out ($10),a
ENDPATCH($86d7,2)

PATCH($86db,2)
   out ($10),a
ENDPATCH($86db,2)

PATCH($992a,2)
   out ($10),a
ENDPATCH($992a,2)

PATCH($9930,2)
   out ($10),a
ENDPATCH($9930,2)

PATCH($993d,2)
   out ($10),a
ENDPATCH($993d,2)

PATCH($9943,2)
   out ($10),a
ENDPATCH($9943,2)

PATCH($9a86,2)
   out ($10),a
ENDPATCH($9a86,2)

PATCH($9a7d,2)
   out ($10),a
ENDPATCH($9a7d,2)

PATCH($9a8c,2)
   out ($10),a
ENDPATCH($9a8c,2)

PATCH($9a9b,2)
   out ($10),a
ENDPATCH($9a9b,2)

PATCH($9aa4,2)
   out ($10),a
ENDPATCH($9aa4,2)

PATCH($9aaa,2)
   out ($10),a
ENDPATCH($9aaa,2)

PATCH($9aae,2)
   out ($10),a
ENDPATCH($9aae,2)

PATCH($804d,2)
   IN A,(IO_VDP_Data)
ENDPATCH($804d,2)

PATCH($8055,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($8055,2)

PATCH($8080,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($8080,2)

PATCH($808f,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($808f,2)

PATCH($809e,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($809e,2)

PATCH($80b5,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($80b5,2)

PATCH($8110,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($8110,2)

PATCH($86c2,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($86c2,2)

PATCH($89db,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($89db,2)

PATCH($994e,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($994e,2)

PATCH($997a,2)
   IN A,(IO_VDP_Addr)
ENDPATCH($997a,2)


; search

#include "patch.gen.asm"


PATCH($805a,3)
	jp		$2010
ENDPATCH($805a,3)

PATCH($855a,3)
	jp	$201f
ENDPATCH($855a,3)
