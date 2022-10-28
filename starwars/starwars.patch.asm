.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($8024,1)	; nop out the di
ENDPATCH($8024,1)

; mame

PATCH($abe1,3)
    call $ffdc
ENDPATCH($abe1,3)

PATCH($abe8,3)
    call $ffd9
ENDPATCH($abe8,3)

PATCH($abeb,3)
    jp $ffdc
ENDPATCH($abeb,3)

PATCH($802b,3)
    call $ffdc
ENDPATCH($802b,3)

PATCH($802e,3)
    call $ff85
ENDPATCH($802e,3)

PATCH($8031,3)
    call $ffd6
ENDPATCH($8031,3)

PATCH($a00b,3)
    jp $ffee
ENDPATCH($a00b,3)

PATCH($9fba,3)
    jp $ff82
ENDPATCH($9fba,3)

PATCH($a800,3)
    call $ffb8
ENDPATCH($a800,3)

PATCH($a80c,3)
    call $ffdf
ENDPATCH($a80c,3)

PATCH($a81a,3)
    call $ff6a
ENDPATCH($a81a,3)

PATCH($a828,3)
    call $ff70
ENDPATCH($a828,3)

PATCH($a836,3)
    call $ff6a
ENDPATCH($a836,3)

PATCH($a844,3)
    call $ff6d
ENDPATCH($a844,3)

PATCH($a84c,3)
    call $ffb8
ENDPATCH($a84c,3)

PATCH($a876,3)
    call $ffb8
ENDPATCH($a876,3)

PATCH($a87e,3)
    call $ffdf
ENDPATCH($a87e,3)

PATCH($a898,3)
    call $ff6a
ENDPATCH($a898,3)

PATCH($9fe8,3)
    jp $ffe2
ENDPATCH($9fe8,3)

PATCH($ac34,3)
    jp $ffdf
ENDPATCH($ac34,3)

PATCH($b20a,3)
    call $ff70
ENDPATCH($b20a,3)

PATCH($a8b7,3)
    call $ff70
ENDPATCH($a8b7,3)

PATCH($a8cb,3)
    call $ff70
ENDPATCH($a8cb,3)

PATCH($a8df,3)
    call $ff70
ENDPATCH($a8df,3)

PATCH($a86c,3)
    jp $ffb8
ENDPATCH($a86c,3)

PATCH($a8ef,3)
    call $ff7f
ENDPATCH($a8ef,3)

PATCH($ab9e,3)
    call $ffdf
ENDPATCH($ab9e,3)

PATCH($a918,3)
    call $ff82
ENDPATCH($a918,3)

PATCH($a923,3)
    call $ff82
ENDPATCH($a923,3)

PATCH($ac2e,3)
    jp $ffdf
ENDPATCH($ac2e,3)

PATCH($a938,3)
    call $ffdf
ENDPATCH($a938,3)

PATCH($a944,3)
    call $ffdf
ENDPATCH($a944,3)

PATCH($a950,3)
    call $ffdf
ENDPATCH($a950,3)

PATCH($a95e,3)
    call $ff6a
ENDPATCH($a95e,3)

PATCH($a975,3)
    call $ff6a
ENDPATCH($a975,3)

PATCH($a98c,3)
    call $ff6a
ENDPATCH($a98c,3)

PATCH($a998,3)
    call $ffdf
ENDPATCH($a998,3)

PATCH($a9a6,3)
    call $ff6a
ENDPATCH($a9a6,3)

PATCH($a9b2,3)
    call $ffdf
ENDPATCH($a9b2,3)

PATCH($a9be,3)
    call $ffdf
ENDPATCH($a9be,3)

PATCH($a9ca,3)
    call $ffdf
ENDPATCH($a9ca,3)

PATCH($a9d6,3)
    call $ffdf
ENDPATCH($a9d6,3)

PATCH($b1f6,3)
    call $ff6a
ENDPATCH($b1f6,3)

PATCH($aa0b,3)
    call $ff70
ENDPATCH($aa0b,3)

PATCH($aa21,3)
    call $ff6a
ENDPATCH($aa21,3)

PATCH($a01d,3)
    jp $ff82
ENDPATCH($a01d,3)

PATCH($a7bf,3)
    jp $ffdf
ENDPATCH($a7bf,3)

PATCH($ac4f,3)
    call $ffb8
ENDPATCH($ac4f,3)

PATCH($ac57,3)
    call $ffb8
ENDPATCH($ac57,3)

PATCH($a587,3)
    call $fffd
ENDPATCH($a587,3)

PATCH($a58a,3)
    call $fffd
ENDPATCH($a58a,3)

PATCH($a58d,3)
    call $fffd
ENDPATCH($a58d,3)

PATCH($a595,3)
    call $fffd
ENDPATCH($a595,3)

PATCH($abd5,3)
    call $ffdc
ENDPATCH($abd5,3)

PATCH($a406,3)
    call $ff79
ENDPATCH($a406,3)

PATCH($a418,3)
    call $ff79
ENDPATCH($a418,3)

PATCH($809c,3)
    call $ffdf
ENDPATCH($809c,3)

PATCH($80a5,3)
    call $ff61
ENDPATCH($80a5,3)

PATCH($80a8,3)
    call $fff4
ENDPATCH($80a8,3)

PATCH($80ed,3)
    call $ffdc
ENDPATCH($80ed,3)

PATCH($926e,3)
    call $ffb8
ENDPATCH($926e,3)

PATCH($9276,3)
    call $ffb8
ENDPATCH($9276,3)



