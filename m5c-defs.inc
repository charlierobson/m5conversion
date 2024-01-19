; patch macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCHINIT(x)	.word x
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate

;

BIOS			= $E000

COLECO_IDENT	= $e06e

IO_PSG 			= $20			; Sound chip output port
IO_VDP_Data		= $10			; VDP data port ($be on coleco)
IO_VDP_Addr		= $11			; VDP VRAM address output port  ($bf on coleco)
IO_VDP_Status	= $11			; VDP status input port

CRV_JS1			= $f0f0
CRV_JS2			= $f0f3
CRV_KP1			= $f0f6
CRV_KP2			= $f0f9
CRV_BT1			= $f0fc
CRV_BT2			= $f0ff

VBLVEC			= $7406
VBLCOUNT		= $740a
VBLFLAG			= $740b			; ff while in VBLISR
VBLERR			= $740c			; $ee if VBLISR re-entered

WRITE_REGISTER	= $ffd9

Cart_Sig		= $8000			; AA55 = title screen, 55AA = no screen
RamSprtTab		= $8002			; RAM sprite attribute table pointer
RAMSprtIdx		= $8004			; sprite index table pointer
VDP_Temp		= $8006			; pointer to temp image storage (up to 40 bytes used)
CtlState		= $8008			; pointer to controller state table (2 + 2x5 bytes)
Cart_Start		= $800a			; start of cart code
V_RST_08H		= $800c			; RST 08H vector
V_RST_10H		= $800f			; RST 10H vector
V_RST_18H		= $8012			; RST 18H vector
V_RST_20H		= $8015			; RST 20H vector
V_RST_28H		= $8018			; RST 28H vector
V_RST_30H		= $801b			; RST 30H vector
V_RST_38H		= $801e			; RST 38H vector
V_NMI			= $8021			; NMI vector (vertical blank interrupt)
Cart_Title		= $8024			; Title string "LINE 3/LINE 2/yyyy"
