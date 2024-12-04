.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($bac5,2)
    out (IO_PSG),a
ENDPATCH($bac5,2)

PATCH($a730,2)
    out (IO_PSG),a
ENDPATCH($a730,2)

PATCH($8078,2)
    out (IO_PSG),a
ENDPATCH($8078,2)

PATCH($82c7,2)
    out (IO_VDP_Addr),a
ENDPATCH($82c7,2)

PATCH($82c9,2)
    out (IO_VDP_Addr),a
ENDPATCH($82c9,2)

PATCH($82cc,2)
    out (IO_VDP_Data),a
ENDPATCH($82cc,2)

PATCH($aa6e,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa6e,2)

PATCH($aa72,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa72,2)

PATCH($aa77,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa77,2)

PATCH($aa79,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa79,2)

PATCH($aa93,2)
    out (IO_VDP_Data),a
ENDPATCH($aa93,2)

PATCH($aa9f,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa9f,2)

PATCH($aaa1,2)
    out (IO_VDP_Addr),a
ENDPATCH($aaa1,2)

PATCH($aacc,2)
    out (IO_VDP_Data),a
ENDPATCH($aacc,2)

PATCH($aada,2)
    out (IO_VDP_Data),a
ENDPATCH($aada,2)

PATCH($aa5a,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa5a,2)

PATCH($aa5e,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa5e,2)

PATCH($aa63,2)
    out (IO_VDP_Data),a
ENDPATCH($aa63,2)

PATCH($a9f5,2)
    out (IO_VDP_Addr),a
ENDPATCH($a9f5,2)

PATCH($a9f8,2)
    out (IO_VDP_Addr),a
ENDPATCH($a9f8,2)

PATCH($a9fd,2)
    out (IO_VDP_Data),a
ENDPATCH($a9fd,2)

PATCH($aa26,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa26,2)

PATCH($aa28,2)
    out (IO_VDP_Addr),a
ENDPATCH($aa28,2)

PATCH($aa32,3)
    call $ff7c
ENDPATCH($aa32,3)

PATCH($8551,2)
    out (IO_VDP_Addr),a
ENDPATCH($8551,2)

PATCH($8553,2)
    out (IO_VDP_Addr),a
ENDPATCH($8553,2)

PATCH($8560,2)
    out (IO_VDP_Data),a
ENDPATCH($8560,2)

PATCH($82d6,2)
    out (IO_VDP_Addr),a
ENDPATCH($82d6,2)

PATCH($82d8,2)
    out (IO_VDP_Addr),a
ENDPATCH($82d8,2)

PATCH($8289,2)
    out (IO_VDP_Data),a
ENDPATCH($8289,2)

PATCH($8299,2)
    out (IO_VDP_Data),a
ENDPATCH($8299,2)

PATCH($b96a,2)
    out (IO_VDP_Addr),a
ENDPATCH($b96a,2)

PATCH($b96c,2)
    out (IO_VDP_Addr),a
ENDPATCH($b96c,2)

PATCH($b971,2)
    out (IO_VDP_Data),a
ENDPATCH($b971,2)

PATCH($8165,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8165,2)

PATCH($ba81,2)
    out (IO_PSG),a
ENDPATCH($ba81,2)

PATCH($ba9c,2)
    out (IO_PSG),a
ENDPATCH($ba9c,2)

PATCH($8176,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8176,2)
