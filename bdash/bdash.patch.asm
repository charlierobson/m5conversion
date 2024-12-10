	.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($aa46,2)
    ret
ENDPATCH($aa46,2)

PATCH($90b0,3)
    ld sp,$74ff
ENDPATCH($90b0,3)

PATCH($956d,3)
    ld sp,$74ff
ENDPATCH($956d,3)

PATCH($95b9,3)
    ld sp,$74ff
ENDPATCH($95b9,3)

; mame

PATCH($90f8,3)
    call V_WRITE_REGISTER
ENDPATCH($90f8,3)

PATCH($90ff,3)
    call V_WRITE_REGISTER
ENDPATCH($90ff,3)

PATCH($9106,3)
    call V_WRITE_REGISTER
ENDPATCH($9106,3)

PATCH($910e,3)
    call V_INIT_TABLE
ENDPATCH($910e,3)

PATCH($9116,3)
    call V_INIT_TABLE
ENDPATCH($9116,3)

PATCH($911e,3)
    call V_INIT_TABLE
ENDPATCH($911e,3)

PATCH($9126,3)
    call V_INIT_TABLE
ENDPATCH($9126,3)

PATCH($912e,3)
    call V_INIT_TABLE
ENDPATCH($912e,3)

PATCH($90c1,3)
    call V_SOUND_INIT
ENDPATCH($90c1,3)

PATCH($93db,3)
    call V_PUT_VRAM
ENDPATCH($93db,3)

PATCH($90ee,3)
    call V_WRITE_REGISTER
ENDPATCH($90ee,3)

PATCH($aa1e,2)
    out (IO_CTLSEL_JS),a
ENDPATCH($aa1e,2)

PATCH($aa20,3)
    call V_POLLER
ENDPATCH($aa20,3)

PATCH($aa23,3)
    call V_PLAY_SONGS
ENDPATCH($aa23,3)

PATCH($aa26,3)
    call V_SOUND_MAN
ENDPATCH($aa26,3)

PATCH($aa43,2)
    in a,(IO_VDP_Addr)
ENDPATCH($aa43,2)

PATCH($aa65,3)
    call V_PLAY_IT
ENDPATCH($aa65,3)

PATCH($9f66,3)
    call V_WRITE_REGISTER
ENDPATCH($9f66,3)

PATCH($9f71,3)
    call V_FILL_VRAM
ENDPATCH($9f71,3)

PATCH($9f78,3)
    call V_WRITE_REGISTER
ENDPATCH($9f78,3)

PATCH($944a,2)
    in a,(IO_VDP_Addr)
ENDPATCH($944a,2)

PATCH($9451,2)
    out (IO_VDP_Addr),a
ENDPATCH($9451,2)

PATCH($9458,2)
    out (IO_VDP_Addr),a
ENDPATCH($9458,2)

PATCH($9461,2)
    out (IO_VDP_Data),a
ENDPATCH($9461,2)

PATCH($a2e8,2)
    out (IO_VDP_Data),a
ENDPATCH($a2e8,2)

PATCH($92a9,2)
    in a,(IO_VDP_Addr)
ENDPATCH($92a9,2)

PATCH($92b0,2)
    out (IO_VDP_Addr),a
ENDPATCH($92b0,2)

PATCH($92b5,2)
    out (IO_VDP_Addr),a
ENDPATCH($92b5,2)

PATCH($928c,2)
    in a,(IO_VDP_Addr)
ENDPATCH($928c,2)

PATCH($9293,2)
    out (IO_VDP_Addr),a
ENDPATCH($9293,2)

PATCH($9298,2)
    out (IO_VDP_Addr),a
ENDPATCH($9298,2)

PATCH($92a4,2)
    out (IO_VDP_Data),a
ENDPATCH($92a4,2)
