	.word	$8000

; patch macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate

BIOS_BASE = $E000

IO_VDP_Data = $10		; VDP data port
IO_VDP_Addr = $11		; VDP VRAM address output port
IO_PSG = $20

; output from mm.py
; always do these first
;
.include "centiped.mm.patch.asm"

; output from mame

PATCH($a103,2)
    out (IO_PSG),a
ENDPATCH($a103,2)

PATCH($a107,2)
    out (IO_PSG),a
ENDPATCH($a107,2)

PATCH($a10b,2)
    out (IO_PSG),a
ENDPATCH($a10b,2)

PATCH($a10f,2)
    out (IO_PSG),a
ENDPATCH($a10f,2)

PATCH($a0b1,2)
    out (IO_VDP_Addr),a
ENDPATCH($a0b1,2)

PATCH($a0b5,2)
    out (IO_VDP_Addr),a
ENDPATCH($a0b5,2)

PATCH($9e85,2)
    out (IO_VDP_Addr),a
ENDPATCH($9e85,2)

PATCH($9e89,2)
    out (IO_VDP_Addr),a
ENDPATCH($9e89,2)

PATCH($a0c3,2)
    out (IO_VDP_Addr),a
ENDPATCH($a0c3,2)

PATCH($a0c8,2)
    out (IO_VDP_Addr),a
ENDPATCH($a0c8,2)

PATCH($a0cb,2)
    out (IO_VDP_Data),a
ENDPATCH($a0cb,2)

PATCH($9ffc,2)
    out (IO_VDP_Addr),a
ENDPATCH($9ffc,2)

PATCH($a001,2)
    out (IO_VDP_Addr),a
ENDPATCH($a001,2)

PATCH($a005,2)
    out (IO_VDP_Data),a
ENDPATCH($a005,2)

PATCH($a021,2)
    out (IO_VDP_Addr),a
ENDPATCH($a021,2)

PATCH($a026,2)
    out (IO_VDP_Addr),a
ENDPATCH($a026,2)

PATCH($a029,2)
    out (IO_VDP_Data),a
ENDPATCH($a029,2)

PATCH($9e4d,2)
    out (IO_VDP_Addr),a
ENDPATCH($9e4d,2)

PATCH($9e52,2)
    out (IO_VDP_Addr),a
ENDPATCH($9e52,2)

PATCH($9e5c,2)
    out (IO_VDP_Data),a
ENDPATCH($9e5c,2)

PATCH($9d7d,2)
    out (IO_VDP_Data),a
ENDPATCH($9d7d,2)

PATCH($9d79,2)
    out (IO_VDP_Data),a
ENDPATCH($9d79,2)

PATCH($9cc6,2)
    out (IO_VDP_Addr),a
ENDPATCH($9cc6,2)

PATCH($9ccb,2)
    out (IO_VDP_Addr),a
ENDPATCH($9ccb,2)

PATCH($9cce,2)
    out (IO_VDP_Data),a
ENDPATCH($9cce,2)

PATCH($a02e,2)
    out (IO_VDP_Addr),a
ENDPATCH($a02e,2)

PATCH($95c2,2)
    out (IO_VDP_Data),a
ENDPATCH($95c2,2)

PATCH($a00e,2)
    out (IO_VDP_Addr),a
ENDPATCH($a00e,2)

PATCH($a011,2)
    out (IO_VDP_Addr),a
ENDPATCH($a011,2)

PATCH($a01c,2)
    in a,(IO_VDP_Data)
ENDPATCH($a01c,2)

PATCH($a18f,2)
    out (IO_PSG),a
ENDPATCH($a18f,2)

PATCH($a1a2,2)
    out (IO_PSG),a
ENDPATCH($a1a2,2)

PATCH($82cc,2)
    out (IO_PSG),a
ENDPATCH($82cc,2)

PATCH($82e2,2)
    out (IO_PSG),a
ENDPATCH($82e2,2)




; hand woven

; js
PATCH($a06f,25)
	call	$2013
ENDPATCH($a06f,25)

; kp
PATCH($a08c,25)
	call	$2010
ENDPATCH($a08c,25)
