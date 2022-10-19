	.include "..\m5c-defs.inc"

PATCHINIT($8000)

;;out (IO_CTLSEL),a   JOYSTICK MODE  @aa1e

PATCH($aa46,2)
    ret
ENDPATCH($aa46,2)

PATCH($90f1,3)
    jp	$2010
ENDPATCH($90f1,3)

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
    call $ffd9
ENDPATCH($90f8,3)

PATCH($90ff,3)
    call $ffd9
ENDPATCH($90ff,3)

PATCH($9106,3)
    call $ffd9
ENDPATCH($9106,3)

PATCH($910e,3)
    call $ffb8
ENDPATCH($910e,3)

PATCH($9116,3)
    call $ffb8
ENDPATCH($9116,3)

PATCH($911e,3)
    call $ffb8
ENDPATCH($911e,3)

PATCH($9126,3)
    call $ffb8
ENDPATCH($9126,3)

PATCH($912e,3)
    call $ffb8
ENDPATCH($912e,3)

PATCH($90c1,3)
    call $ffee
ENDPATCH($90c1,3)

PATCH($93db,3)
    call $ffbe
ENDPATCH($93db,3)

PATCH($90ee,3)
    call $ffd9
ENDPATCH($90ee,3)

PATCH($aa20,3)
    call $ffeb
ENDPATCH($aa20,3)

PATCH($aa23,3)
    call $ff61
ENDPATCH($aa23,3)

PATCH($aa26,3)
    call $fff4
ENDPATCH($aa26,3)

PATCH($aa43,2)
    in a,(IO_VDP_Addr)
ENDPATCH($aa43,2)

PATCH($aa65,3)
    call $fff1
ENDPATCH($aa65,3)

PATCH($9f66,3)
    call $ffd9
ENDPATCH($9f66,3)

PATCH($9f71,3)
    call $ff82
ENDPATCH($9f71,3)

PATCH($9f78,3)
    call $ffd9
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

PATCH($92bf,2)
    out (IO_VDP_Data),a
ENDPATCH($92bf,2)

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

PATCH($94d3,2)
    in a,(IO_VDP_Addr)
ENDPATCH($94d3,2)

PATCH($94d6,2)
    out (IO_VDP_Addr),a
ENDPATCH($94d6,2)

PATCH($94dd,2)
    out (IO_VDP_Addr),a
ENDPATCH($94dd,2)

PATCH($94ff,2)
    out (IO_VDP_Data),a
ENDPATCH($94ff,2)

PATCH($9506,2)
    out (IO_VDP_Data),a
ENDPATCH($9506,2)

PATCH($aa75,3)
    jp $ffee
ENDPATCH($aa75,3)

PATCH($b281,2)
    in a,(IO_VDP_Addr)
ENDPATCH($b281,2)

PATCH($b288,2)
    out (IO_VDP_Addr),a
ENDPATCH($b288,2)

PATCH($b28d,2)
    out (IO_VDP_Addr),a
ENDPATCH($b28d,2)

PATCH($b29a,2)
    out (IO_VDP_Data),a
ENDPATCH($b29a,2)

PATCH($9a77,3)
    call $ffd9
ENDPATCH($9a77,3)

PATCH($9a82,3)
    call $ff82
ENDPATCH($9a82,3)

PATCH($9a89,3)
    call $ffd9
ENDPATCH($9a89,3)

PATCH($a2e0,2)
    out (IO_VDP_Data),a
ENDPATCH($a2e0,2)

PATCH($b1bf,2)
    in a,(IO_VDP_Addr)
ENDPATCH($b1bf,2)

PATCH($b1c7,2)
    out (IO_VDP_Addr),a
ENDPATCH($b1c7,2)

PATCH($b1cf,2)
    out (IO_VDP_Addr),a
ENDPATCH($b1cf,2)

PATCH($b22f,2)
    out (IO_VDP_Data),a
ENDPATCH($b22f,2)

PATCH($9f4a,2)
    out (IO_VDP_Data),a
ENDPATCH($9f4a,2)

