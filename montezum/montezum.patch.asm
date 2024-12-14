.include "../m5c-defs.inc"

PATCHINIT($8000)

; trainer
PATCH($8bcf,2)
ENDPATCH($8bcf,2)

; mame

PATCH($8ba6,3)
    call $ffd6
ENDPATCH($8ba6,3)

PATCH($8038,3)
    call $ffd9
ENDPATCH($8038,3)

PATCH($841a,3)
    call $ff82
ENDPATCH($841a,3)

PATCH($803e,3)
    call $ff85
ENDPATCH($803e,3)

PATCH($8044,3)
    call $ffd9
ENDPATCH($8044,3)

PATCH($8047,3)
    call $ff7f
ENDPATCH($8047,3)

PATCH($805b,3)
    call $ffbe
ENDPATCH($805b,3)

PATCH($8065,3)
    call $ffc1
ENDPATCH($8065,3)

PATCH($806a,3)
    call $ffc4
ENDPATCH($806a,3)

PATCH($ae31,3)
    call $ffbe
ENDPATCH($ae31,3)

PATCH($8116,3)
    call $ffd6
ENDPATCH($8116,3)

PATCH($8119,3)
    call $ff7f
ENDPATCH($8119,3)

PATCH($8127,3)
    call $ff73
ENDPATCH($8127,3)

PATCH($8135,3)
    call $ff82
ENDPATCH($8135,3)

PATCH($8176,3)
    call $ffd9
ENDPATCH($8176,3)

PATCH($8179,3)
    call $ff76
ENDPATCH($8179,3)

PATCH($819b,3)
    call $ffd9
ENDPATCH($819b,3)

PATCH($81a5,3)
    call $ff82
ENDPATCH($81a5,3)

PATCH($81af,3)
    call $ff82
ENDPATCH($81af,3)

PATCH($8395,3)
    call $ffd9
ENDPATCH($8395,3)

PATCH($839c,3)
    call $ff7f
ENDPATCH($839c,3)

PATCH($ae6a,3)
    call $ff6a
ENDPATCH($ae6a,3)

PATCH($ae64,3)
    call $ff6d
ENDPATCH($ae64,3)

PATCH($836b,3)
    call $ff6a
ENDPATCH($836b,3)

PATCH($8376,3)
    call $ff6a
ENDPATCH($8376,3)

PATCH($81d6,3)
    call $ffd9
ENDPATCH($81d6,3)

PATCH($ae91,3)
    jp $ffd9
ENDPATCH($ae91,3)

PATCH($a06a,3)
    call $ffd6
ENDPATCH($a06a,3)

PATCH($a1eb,3)
    call $ff82
ENDPATCH($a1eb,3)

PATCH($a10e,3)
    call $ff82
ENDPATCH($a10e,3)

PATCH($a97f,3)
    call $ffd9
ENDPATCH($a97f,3)

PATCH($a973,3)
    call $ffd9
ENDPATCH($a973,3)

PATCH($aa3f,3)
    call $ffc4
ENDPATCH($aa3f,3)

PATCH($aa45,3)
    call $ffdc
ENDPATCH($aa45,3)

PATCH($aec8,3)
    call $ffbb
ENDPATCH($aec8,3)

PATCH($8c1f,3)
    call $ff76
ENDPATCH($8c1f,3)

PATCH($aca1,2)
    out (IO_PSG),a
ENDPATCH($aca1,2)

PATCH($acac,2)
    out (IO_PSG),a
ENDPATCH($acac,2)

PATCH($acb4,2)
    out (IO_PSG),a
ENDPATCH($acb4,2)

PATCH($acbf,2)
    out (IO_PSG),a
ENDPATCH($acbf,2)

PATCH($accb,2)
    out (IO_PSG),a
ENDPATCH($accb,2)

PATCH($acfc,2)
    out (IO_PSG),a
ENDPATCH($acfc,2)

PATCH($ad01,2)
    out (IO_PSG),a
ENDPATCH($ad01,2)

PATCH($ac7e,3)
    call $ffd6
ENDPATCH($ac7e,3)

PATCH($a203,3)
    call $ff82
ENDPATCH($a203,3)

PATCH($ae28,3)
    call $ff82
ENDPATCH($ae28,3)

PATCH($a97f,3)
    call $ffd9
ENDPATCH($a97f,3)

PATCH($a973,3)
    call $ffd9
ENDPATCH($a973,3)

PATCH($aa3f,3)
    call $ffc4
ENDPATCH($aa3f,3)

PATCH($aa45,3)
    call $ffdc
ENDPATCH($aa45,3)

PATCH($aec8,3)
    call $ffbb
ENDPATCH($aec8,3)

PATCH($8c1f,3)
    call $ff76
ENDPATCH($8c1f,3)

PATCH($aca1,2)
    out (IO_PSG),a
ENDPATCH($aca1,2)

PATCH($acac,2)
    out (IO_PSG),a
ENDPATCH($acac,2)

PATCH($acb4,2)
    out (IO_PSG),a
ENDPATCH($acb4,2)

PATCH($acbf,2)
    out (IO_PSG),a
ENDPATCH($acbf,2)

PATCH($accb,2)
    out (IO_PSG),a
ENDPATCH($accb,2)

PATCH($acfc,2)
    out (IO_PSG),a
ENDPATCH($acfc,2)

PATCH($ad01,2)
    out (IO_PSG),a
ENDPATCH($ad01,2)

PATCH($ac7e,3)
    call $ffd6
ENDPATCH($ac7e,3)

PATCH($a203,3)
    call $ff82
ENDPATCH($a203,3)

PATCH($ae28,3)
    call $ff82
ENDPATCH($ae28,3)

PATCH($ab46,3)
    call $ffbb
ENDPATCH($ab46,3)

