.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($8073,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8073,2)

PATCH($8077,2)
    out (IO_VDP_Addr),a
ENDPATCH($8077,2)

PATCH($807d,2)
    out (IO_VDP_Addr),a
ENDPATCH($807d,2)

PATCH($8088,2)
    out (IO_VDP_Addr),a
ENDPATCH($8088,2)

PATCH($808d,2)
    out (IO_VDP_Addr),a
ENDPATCH($808d,2)

PATCH($80a6,2)
    out (IO_PSG),a
ENDPATCH($80a6,2)

PATCH($80aa,2)
    out (IO_PSG),a
ENDPATCH($80aa,2)

PATCH($80ae,2)
    out (IO_PSG),a
ENDPATCH($80ae,2)

PATCH($80b2,2)
    out (IO_PSG),a
ENDPATCH($80b2,2)

PATCH($9e91,2)
    out (IO_PSG),a
ENDPATCH($9e91,2)

PATCH($8156,2)
    out (IO_VDP_Addr),a
ENDPATCH($8156,2)

PATCH($815a,2)
    out (IO_VDP_Addr),a
ENDPATCH($815a,2)

PATCH($815e,2)
    out (IO_VDP_Addr),a
ENDPATCH($815e,2)

PATCH($8162,2)
    out (IO_VDP_Addr),a
ENDPATCH($8162,2)

PATCH($8169,2)
    out (IO_VDP_Addr),a
ENDPATCH($8169,2)

PATCH($816f,2)
    out (IO_VDP_Addr),a
ENDPATCH($816f,2)

PATCH($8173,2)
    out (IO_VDP_Data),a
ENDPATCH($8173,2)

PATCH($8185,2)
    out (IO_VDP_Addr),a
ENDPATCH($8185,2)

PATCH($8189,2)
    out (IO_VDP_Addr),a
ENDPATCH($8189,2)

PATCH($b3cb,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3cb,2)

PATCH($b3cf,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3cf,2)

PATCH($b3d4,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3d4,2)

PATCH($b3d6,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3d6,2)

PATCH($b3e2,2)
    out (IO_VDP_Data),a
ENDPATCH($b3e2,2)

PATCH($b3ee,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3ee,2)

PATCH($b3f0,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3f0,2)

PATCH($b431,2)
    out (IO_VDP_Data),a
ENDPATCH($b431,2)

PATCH($b410,2)
    out (IO_VDP_Addr),a
ENDPATCH($b410,2)

PATCH($b412,2)
    out (IO_VDP_Addr),a
ENDPATCH($b412,2)

PATCH($b423,2)
    out (IO_VDP_Data),a
ENDPATCH($b423,2)

PATCH($b3b7,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3b7,2)

PATCH($b3bb,2)
    out (IO_VDP_Addr),a
ENDPATCH($b3bb,2)

PATCH($b3c0,2)
    out (IO_VDP_Data),a
ENDPATCH($b3c0,2)

PATCH($b338,2)
    out (IO_VDP_Addr),a
ENDPATCH($b338,2)

PATCH($b33b,2)
    out (IO_VDP_Addr),a
ENDPATCH($b33b,2)

PATCH($b340,2)
    out (IO_VDP_Data),a
ENDPATCH($b340,2)

PATCH($b369,2)
    out (IO_VDP_Addr),a
ENDPATCH($b369,2)

PATCH($b36b,2)
    out (IO_VDP_Addr),a
ENDPATCH($b36b,2)
