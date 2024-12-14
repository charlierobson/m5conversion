.include "..\m5c-defs.inc"

PATCHINIT($8000)


PATCH($94c9,6)
	LD HL,$7004
	LD de,$7005
ENDPATCH($94c9,6)


; output from mm.py

.include "centiped.mm.patch.asm"

; output from mame

PATCH(a047,2)
    in a,(IO_VDP_Addr)
ENDPATCH(a047,2)

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
    out (IO_VPD_Addr),a
ENDPATCH($a0b1,2)

PATCH($a0b5,2)
    out (IO_VPD_Addr),a
ENDPATCH($a0b5,2)

PATCH($9e85,2)
    out (IO_VPD_Addr),a
ENDPATCH($9e85,2)

PATCH($9e89,2)
    out (IO_VPD_Addr),a
ENDPATCH($9e89,2)

PATCH($a0c3,2)
    out (IO_VPD_Addr),a
ENDPATCH($a0c3,2)

PATCH($a0c8,2)
    out (IO_VPD_Addr),a
ENDPATCH($a0c8,2)

PATCH($a0cb,2)
    out (IO_VDP_Data),a
ENDPATCH($a0cb,2)

PATCH($9ffc,2)
    out (IO_VPD_Addr),a
ENDPATCH($9ffc,2)

PATCH($a001,2)
    out (IO_VPD_Addr),a
ENDPATCH($a001,2)

PATCH($a005,2)
    out (IO_VDP_Data),a
ENDPATCH($a005,2)

PATCH($a021,2)
    out (IO_VPD_Addr),a
ENDPATCH($a021,2)

PATCH($a026,2)
    out (IO_VPD_Addr),a
ENDPATCH($a026,2)

PATCH($a029,2)
    out (IO_VDP_Data),a
ENDPATCH($a029,2)

PATCH($9e4d,2)
    out (IO_VPD_Addr),a
ENDPATCH($9e4d,2)

PATCH($9e52,2)
    out (IO_VPD_Addr),a
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
    out (IO_VPD_Addr),a
ENDPATCH($9cc6,2)

PATCH($9ccb,2)
    out (IO_VPD_Addr),a
ENDPATCH($9ccb,2)

PATCH($9cce,2)
    out (IO_VDP_Data),a
ENDPATCH($9cce,2)

PATCH($a02e,2)
    out (IO_VPD_Addr),a
ENDPATCH($a02e,2)

PATCH($95c2,2)
    out (IO_VDP_Data),a
ENDPATCH($95c2,2)

PATCH($a00e,2)
    out (IO_VPD_Addr),a
ENDPATCH($a00e,2)

PATCH($a011,2)
    out (IO_VPD_Addr),a
ENDPATCH($a011,2)

PATCH($a18f,2)
    out (IO_PSG),a
ENDPATCH($a18f,2)

PATCH($a1a2,2)
    out (IO_PSG),a
ENDPATCH($a1a2,2)
