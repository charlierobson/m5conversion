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

IO_CTLSEL_JS    = $c0
IO_CTLSEL_KP    = $80

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

CRV_JS1         = $f0f0
CRV_JS2         = $f0f3
CRV_KP1         = $f0f6
CRV_KP2         = $f0f9

V_PLAY_SONGS            = $FF61
V_ACTIVATEP             = $FF64
V_PUTOBJP               = $FF67
V_REFLECT_VERTICAL      = $FF6A
V_REFLECT_HORIZONTAL    = $FF6D
V_ROTATE_90             = $FF70
V_ENLARGE               = $FF73
V_CONTROLLER_SCAN       = $FF76
V_DECODER               = $FF79
V_GAME_OPT              = $FF7C
V_LOAD_ASCII            = $FF7F
V_FILL_VRAM             = $FF82
V_MODE_1                = $FF85
V_UPDATE_SPINNER        = $FF88
V_INIT_TABLEP           = $FF8B
V_GET_VRAMP             = $FF8E
V_PUT_VRAMP             = $FF91
V_INIT_SPR_ORDERP       = $FF94
V_WR_SPR_NM_TBLP        = $FF97
V_INIT_TIMERP           = $FF9A
V_FREE_SIGNALP          = $FF9D
V_REQUEST_SIGNALP       = $FFA0
V_TEST_SIGNALP          = $FFA3
V_WRITE_REGISTERP       = $FFA6
V_WRITE_VRAMP           = $FFA9
V_READ_VRAMP            = $FFAC
V_INIT_WRITERP          = $FFAF
V_SOUND_INITP           = $FFB2
V_PLAY_ITP              = $FFB5
V_INIT_TABLE            = $FFB8
V_GET_VRAM              = $FFBB
V_PUT_VRAM              = $FFBE
V_INIT_SPR_ORDER        = $FFC1
V_WR_SPR_NM_TBL         = $FFC4
V_INIT_TIMER            = $FFC7
V_FREE_SIGNAL           = $FFCA
V_REQUEST_SIGNAL        = $FFCD
V_TEST_SIGNAL           = $FFD0
V_TIME_MGR              = $FFD3
V_TURN_OFF_SOUND        = $FFD6
V_WRITE_REGISTER        = $FFD9
V_READ_REGISTER         = $FFDC
V_WRITE_VRAM            = $FFDF
V_READ_VRAM             = $FFE2
V_INIT_WRITER           = $FFE5
V_WRITER                = $FFE8
V_POLLER                = $FFEB
V_SOUND_INIT            = $FFEE
V_PLAY_IT               = $FFF1
V_SOUND_MAN             = $FFF4
V_ACTIVATE              = $FFF7
V_PUTOBJ                = $FFFA
V_RAND_GEN              = $FFFD
