; patch macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCHINIT(x)	.word x
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate

;

BIOS			= $E000
COLECO_IDENT	= BIOS + $6e

IO_PSG 			= $20			; Sound chip output port
IO_VDP_Data		= $10			; VDP data port
IO_VDP_Addr		= $11			; VDP VRAM address output port
IO_VDP_Status	= $11			; VDP status input port

CRV_JS1			= $f0f0
CRV_JS2			= $f0f3
CRV_KP1			= $f0f6
CRV_KP2			= $f0f9

VBLVEC			= $7406
VBLCOUNT		= $740A
