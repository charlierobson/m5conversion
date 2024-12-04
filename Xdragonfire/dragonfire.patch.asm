.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($804d,3)
    call $ffd9
ENDPATCH($804d,3)

PATCH($805f,3)
    call $ff85
ENDPATCH($805f,3)

PATCH($81c9,3)
    call $ffdf
ENDPATCH($81c9,3)

PATCH($808f,3)
    call $ffdf
ENDPATCH($808f,3)

PATCH($809b,3)
    call $ffdf
ENDPATCH($809b,3)

PATCH($813d,2)
    out (IO_VDP_Addr),a
ENDPATCH($813d,2)

PATCH($8142,2)
    out (IO_VDP_Addr),a
ENDPATCH($8142,2)

PATCH($8155,2)
    out (IO_VDP_Data),a
ENDPATCH($8155,2)

PATCH($92ca,3)
    call $ffdf
ENDPATCH($92ca,3)

PATCH($80bc,3)
    call $ffee
ENDPATCH($80bc,3)

PATCH($82ff,3)
    call $ffdf
ENDPATCH($82ff,3)

PATCH($867a,3)
    call $ffd9
ENDPATCH($867a,3)

PATCH($8681,3)
    call $ffd9
ENDPATCH($8681,3)

PATCH($8688,3)
    call $ffd9
ENDPATCH($8688,3)

PATCH($811e,3)
    call $ffd9
ENDPATCH($811e,3)

PATCH($8325,3)
    call $ffe2
ENDPATCH($8325,3)

PATCH($8121,3)
    call $ffdc
ENDPATCH($8121,3)

PATCH($844a,3)
    call $ffeb
ENDPATCH($844a,3)

PATCH($8c92,3)
    call $fff1
ENDPATCH($8c92,3)

PATCH($8c8c,3)
    call $fff1
ENDPATCH($8c8c,3)


