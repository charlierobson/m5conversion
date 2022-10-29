.include "..\m5c-defs.inc"

PATCHINIT($8000)

; nop out IM 0
PATCH($8044,3)
ENDPATCH($8044,3)

PATCH($84d4,3)
	LD HL,($e06c)
ENDPATCH($84d4,3)

PATCH($84e0,3)
	LD HL,($e06a)
ENDPATCH($84e0,3)

PATCH($84f8,3)
	LD HL,($e06c)
ENDPATCH($84f8,3)

; mame

PATCH($8bbc,3)
    call $ffee
ENDPATCH($8bbc,3)

PATCH($8051,3)
    call $ff7c
ENDPATCH($8051,3)

PATCH($8061,3)
    call $ffd9
ENDPATCH($8061,3)

PATCH($857e,3)
    call $ffdc
ENDPATCH($857e,3)

PATCH($8bad,3)
    call $ffeb
ENDPATCH($8bad,3)

PATCH($808c,3)
    call $ffd9
ENDPATCH($808c,3)

PATCH($8427,3)
    call $ffd9
ENDPATCH($8427,3)

PATCH($aaad,3)
    call $ffdf
ENDPATCH($aaad,3)

PATCH($aaba,3)
    call $ffdf
ENDPATCH($aaba,3)

PATCH($8107,3)
    call $fffd
ENDPATCH($8107,3)

PATCH($9037,3)
    call $fffd
ENDPATCH($9037,3)

PATCH($9057,3)
    call $fffd
ENDPATCH($9057,3)

PATCH($9087,3)
    call $fffd
ENDPATCH($9087,3)

PATCH($90a5,3)
    call $ffd9
ENDPATCH($90a5,3)

PATCH($8bd4,3)
    call $fff4
ENDPATCH($8bd4,3)

PATCH($8bd7,3)
    call $ff61
ENDPATCH($8bd7,3)

PATCH($9242,3)
    call $fffd
ENDPATCH($9242,3)

PATCH($923b,3)
    call $ffe2
ENDPATCH($923b,3)

PATCH($81ed,3)
    call $ffd9
ENDPATCH($81ed,3)

PATCH($81f9,3)
    call $ffd9
ENDPATCH($81f9,3)

PATCH($8bc8,3)
    call $fff1
ENDPATCH($8bc8,3)

PATCH($8214,3)
    call $ffd9
ENDPATCH($8214,3)

PATCH($a9ec,3)
    call $ffe2
ENDPATCH($a9ec,3)

PATCH($aa01,3)
    call $ffe2
ENDPATCH($aa01,3)

PATCH($aa10,3)
    call $ffe2
ENDPATCH($aa10,3)

PATCH($a353,3)
    call $fffd
ENDPATCH($a353,3)

PATCH($a378,3)
    call $fffd
ENDPATCH($a378,3)

PATCH($a359,3)
    call $fffd
ENDPATCH($a359,3)

PATCH($8116,3)
    call $ffd9
ENDPATCH($8116,3)

PATCH($8196,3)
    call $ffd9
ENDPATCH($8196,3)
