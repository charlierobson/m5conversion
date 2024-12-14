.include "../m5c-defs.inc"

PATCHINIT($8000)

PATCH($8622,2)
    out (IO_PSG),a
ENDPATCH($8622,2)

PATCH($862a,2)
    out (IO_PSG),a
ENDPATCH($862a,2)

PATCH($8632,2)
    out (IO_PSG),a
ENDPATCH($8632,2)

PATCH($863a,2)
    out (IO_PSG),a
ENDPATCH($863a,2)

PATCH($8066,3)
    call $ffd9
ENDPATCH($8066,3)

PATCH($8070,3)
    call $ff82
ENDPATCH($8070,3)

PATCH($8076,3)
    call $ffd9
ENDPATCH($8076,3)

PATCH($807c,3)
    call $ffd9
ENDPATCH($807c,3)

PATCH($8082,3)
    call $ffd9
ENDPATCH($8082,3)

PATCH($8088,3)
    call $ffd9
ENDPATCH($8088,3)

PATCH($808e,3)
    call $ffd9
ENDPATCH($808e,3)

PATCH($8094,3)
    call $ffd9
ENDPATCH($8094,3)

PATCH($809a,3)
    call $ffd9
ENDPATCH($809a,3)

PATCH($80ca,3)
    call $ffdf
ENDPATCH($80ca,3)

PATCH($80d6,3)
    call $ffdf
ENDPATCH($80d6,3)

PATCH($80e2,3)
    call $ffdf
ENDPATCH($80e2,3)

PATCH($80ee,3)
    call $ffdf
ENDPATCH($80ee,3)

PATCH($80fa,3)
    call $ffdf
ENDPATCH($80fa,3)

PATCH($8106,3)
    call $ffdf
ENDPATCH($8106,3)

PATCH($8111,3)
    call $ff82
ENDPATCH($8111,3)

PATCH($811c,3)
    call $ff82
ENDPATCH($811c,3)

PATCH($8127,3)
    call $ff82
ENDPATCH($8127,3)

PATCH($8132,3)
    call $ff82
ENDPATCH($8132,3)

PATCH($813d,3)
    call $ff82
ENDPATCH($813d,3)

PATCH($8148,3)
    call $ff82
ENDPATCH($8148,3)

PATCH($8154,3)
    call $ffdf
ENDPATCH($8154,3)

PATCH($80a9,3)
    call $ffdf
ENDPATCH($80a9,3)

PATCH($80b0,3)
    call $ffdc
ENDPATCH($80b0,3)

PATCH($80b6,3)
    call $ffd9
ENDPATCH($80b6,3)

PATCH($8545,3)
    call $ffdf
ENDPATCH($8545,3)

PATCH($854b,3)
    call $ffeb
ENDPATCH($854b,3)

PATCH($85b6,3)
    call $ffdc
ENDPATCH($85b6,3)

PATCH($95be,2)
    out (IO_VDP_Addr),a
ENDPATCH($95be,2)

PATCH($95c1,2)
    out (IO_VDP_Addr),a
ENDPATCH($95c1,2)

PATCH($95c7,2)
    in a,(IO_VDP_Data)
ENDPATCH($95c7,2)

PATCH($8186,3)
    call $ffd9
ENDPATCH($8186,3)

PATCH($8191,3)
    call $ff82
ENDPATCH($8191,3)

PATCH($819c,3)
    call $ff82
ENDPATCH($819c,3)

PATCH($81a7,3)
    call $ff82
ENDPATCH($81a7,3)

PATCH($81b2,3)
    call $ff82
ENDPATCH($81b2,3)

PATCH($81be,3)
    call $ffdf
ENDPATCH($81be,3)

PATCH($81d3,3)
    call $ffd9
ENDPATCH($81d3,3)

PATCH($81de,3)
    call $ffeb
ENDPATCH($81de,3)

PATCH($826a,3)
    call $ffd9
ENDPATCH($826a,3)

PATCH($8274,3)
    call $ff82
ENDPATCH($8274,3)

PATCH($827f,3)
    call $ff82
ENDPATCH($827f,3)

PATCH($828a,3)
    call $ff82
ENDPATCH($828a,3)

PATCH($8295,3)
    call $ff82
ENDPATCH($8295,3)

PATCH($82a0,3)
    call $ff82
ENDPATCH($82a0,3)

PATCH($82ab,3)
    call $ff82
ENDPATCH($82ab,3)

PATCH($82b6,3)
    call $ff82
ENDPATCH($82b6,3)

PATCH($82c1,3)
    call $ff82
ENDPATCH($82c1,3)

PATCH($82cc,3)
    call $ff82
ENDPATCH($82cc,3)

PATCH($82d7,3)
    call $ff82
ENDPATCH($82d7,3)

PATCH($82e2,3)
    call $ff82
ENDPATCH($82e2,3)

PATCH($82ed,3)
    call $ff82
ENDPATCH($82ed,3)

PATCH($82f8,3)
    call $ff82
ENDPATCH($82f8,3)

PATCH($8303,3)
    call $ff82
ENDPATCH($8303,3)

PATCH($830e,3)
    call $ff82
ENDPATCH($830e,3)

PATCH($8319,3)
    call $ff82
ENDPATCH($8319,3)

PATCH($8324,3)
    call $ff82
ENDPATCH($8324,3)

PATCH($832f,3)
    call $ff82
ENDPATCH($832f,3)

PATCH($833a,3)
    call $ff82
ENDPATCH($833a,3)

PATCH($8345,3)
    call $ff82
ENDPATCH($8345,3)

PATCH($834a,2)
    out (IO_PSG),a
ENDPATCH($834a,2)

PATCH($8352,2)
    out (IO_PSG),a
ENDPATCH($8352,2)

PATCH($835a,2)
    out (IO_PSG),a
ENDPATCH($835a,2)

PATCH($8362,2)
    out (IO_PSG),a
ENDPATCH($8362,2)

PATCH($836a,2)
    out (IO_PSG),a
ENDPATCH($836a,2)

PATCH($8372,2)
    out (IO_PSG),a
ENDPATCH($8372,2)

PATCH($837d,3)
    call $ffdf
ENDPATCH($837d,3)

PATCH($8389,3)
    call $ffdf
ENDPATCH($8389,3)

PATCH($8395,3)
    call $ffdf
ENDPATCH($8395,3)

PATCH($83db,3)
    call $ffdf
ENDPATCH($83db,3)

PATCH($83ee,3)
    call $fffd
ENDPATCH($83ee,3)

PATCH($8a33,3)
    call $ffd9
ENDPATCH($8a33,3)

PATCH($8a3d,3)
    call $ff82
ENDPATCH($8a3d,3)

PATCH($8a4e,3)
    call $ffd9
ENDPATCH($8a4e,3)

PATCH($8a54,3)
    call $ffd9
ENDPATCH($8a54,3)

PATCH($95cc,2)
    out (IO_VDP_Addr),a
ENDPATCH($95cc,2)

PATCH($95d1,2)
    out (IO_VDP_Addr),a
ENDPATCH($95d1,2)

PATCH($95d4,2)
    out (IO_VDP_Data),a
ENDPATCH($95d4,2)

PATCH($8a68,3)
    call $ffdf
ENDPATCH($8a68,3)

PATCH($8a99,3)
    call $ffdf
ENDPATCH($8a99,3)

PATCH($8aa5,3)
    call $ffdf
ENDPATCH($8aa5,3)

PATCH($84eb,3)
    call $ffd9
ENDPATCH($84eb,3)

PATCH($8b98,2)
    out (IO_PSG),a
ENDPATCH($8b98,2)

PATCH($8b9f,2)
    out (IO_PSG),a
ENDPATCH($8b9f,2)

PATCH($8ba7,2)
    out (IO_PSG),a
ENDPATCH($8ba7,2)

PATCH($8bb0,2)
    out (IO_PSG),a
ENDPATCH($8bb0,2)

PATCH($8bb8,2)
    out (IO_PSG),a
ENDPATCH($8bb8,2)

PATCH($8bc1,2)
    out (IO_PSG),a
ENDPATCH($8bc1,2)

PATCH($8bc9,2)
    out (IO_PSG),a
ENDPATCH($8bc9,2)

PATCH($8bd1,2)
    out (IO_PSG),a
ENDPATCH($8bd1,2)

PATCH($8bd9,2)
    out (IO_PSG),a
ENDPATCH($8bd9,2)

PATCH($8be1,2)
    out (IO_PSG),a
ENDPATCH($8be1,2)

PATCH($8be9,2)
    out (IO_PSG),a
ENDPATCH($8be9,2)

PATCH($86e1,2)
    out (IO_PSG),a
ENDPATCH($86e1,2)

PATCH($86eb,2)
    out (IO_PSG),a
ENDPATCH($86eb,2)

PATCH($85c8,2)
    out (IO_PSG),a
ENDPATCH($85c8,2)

PATCH($85d0,2)
    out (IO_PSG),a
ENDPATCH($85d0,2)

PATCH($85d8,2)
    out (IO_PSG),a
ENDPATCH($85d8,2)

PATCH($85e0,2)
    out (IO_PSG),a
ENDPATCH($85e0,2)

PATCH($85e8,2)
    out (IO_PSG),a
ENDPATCH($85e8,2)

PATCH($85f0,2)
    out (IO_PSG),a
ENDPATCH($85f0,2)

PATCH($85f5,2)
    out (IO_PSG),a
ENDPATCH($85f5,2)

PATCH($85fd,2)
    out (IO_PSG),a
ENDPATCH($85fd,2)

PATCH($8605,2)
    out (IO_PSG),a
ENDPATCH($8605,2)

PATCH($860d,2)
    out (IO_PSG),a
ENDPATCH($860d,2)

PATCH($8615,2)
    out (IO_PSG),a
ENDPATCH($8615,2)

PATCH($861d,2)
    out (IO_PSG),a
ENDPATCH($861d,2)

PATCH($8511,2)
    out (IO_PSG),a
ENDPATCH($8511,2)

PATCH($851b,3)
    call $ffd9
ENDPATCH($851b,3)

PATCH($840f,3)
    call $ffd9
ENDPATCH($840f,3)

PATCH($953f,3)
    call $ffdf
ENDPATCH($953f,3)

PATCH($954b,3)
    call $ffdf
ENDPATCH($954b,3)

PATCH($9557,3)
    call $ffdf
ENDPATCH($9557,3)

PATCH($9573,3)
    call $ffdf
ENDPATCH($9573,3)

PATCH($957f,3)
    call $ffdf
ENDPATCH($957f,3)

PATCH($958b,3)
    call $ffdf
ENDPATCH($958b,3)

PATCH($94cf,3)
    call $ffdf
ENDPATCH($94cf,3)

PATCH($8418,3)
    call $ffd9
ENDPATCH($8418,3)

PATCH($9522,3)
    call $ffdf
ENDPATCH($9522,3)

PATCH($845a,3)
    call $ffd9
ENDPATCH($845a,3)

PATCH($8475,3)
    call $ffd9
ENDPATCH($8475,3)

PATCH($93d8,3)
    call $fffd
ENDPATCH($93d8,3)

PATCH($9423,3)
    call $fffd
ENDPATCH($9423,3)

PATCH($939f,3)
    call $fffd
ENDPATCH($939f,3)

PATCH($8b55,3)
    call $ffd9
ENDPATCH($8b55,3)

PATCH($8b60,3)
    call $ff82
ENDPATCH($8b60,3)

PATCH($8b6b,3)
    call $ff82
ENDPATCH($8b6b,3)

PATCH($8b76,3)
    call $ff82
ENDPATCH($8b76,3)

PATCH($8b7c,3)
    call $ffd9
ENDPATCH($8b7c,3)

PATCH($8b27,3)
    call $ffd9
ENDPATCH($8b27,3)

PATCH($8b32,3)
    call $ff82
ENDPATCH($8b32,3)

PATCH($8b3d,3)
    call $ff82
ENDPATCH($8b3d,3)

PATCH($8b48,3)
    call $ff82
ENDPATCH($8b48,3)

PATCH($8b4e,3)
    call $ffd9
ENDPATCH($8b4e,3)

PATCH($8c0a,2)
    out (IO_PSG),a
ENDPATCH($8c0a,2)

PATCH($8e02,2)
    out (IO_PSG),a
ENDPATCH($8e02,2)

PATCH($8491,3)
    call $ffd9
ENDPATCH($8491,3)

PATCH($86f4,2)
    out (IO_PSG),a
ENDPATCH($86f4,2)

PATCH($9206,2)
    out (IO_PSG),a
ENDPATCH($9206,2)

PATCH($920e,2)
    out (IO_PSG),a
ENDPATCH($920e,2)

PATCH($9212,2)
    out (IO_PSG),a
ENDPATCH($9212,2)

PATCH($86fd,2)
    out (IO_PSG),a
ENDPATCH($86fd,2)

PATCH($8ed2,3)
    call $fffd
ENDPATCH($8ed2,3)

PATCH($8eda,2)
    out (IO_PSG),a
ENDPATCH($8eda,2)

PATCH($8eea,2)
    out (IO_PSG),a
ENDPATCH($8eea,2)

PATCH($8ef2,2)
    out (IO_PSG),a
ENDPATCH($8ef2,2)

PATCH($86ba,2)
    out (IO_PSG),a
ENDPATCH($86ba,2)

PATCH($86c7,2)
    out (IO_PSG),a
ENDPATCH($86c7,2)

PATCH($86cf,2)
    out (IO_PSG),a
ENDPATCH($86cf,2)

PATCH($8694,2)
    out (IO_PSG),a
ENDPATCH($8694,2)

PATCH($869b,2)
    out (IO_PSG),a
ENDPATCH($869b,2)

PATCH($86a3,2)
    out (IO_PSG),a
ENDPATCH($86a3,2)

PATCH($9227,2)
    out (IO_PSG),a
ENDPATCH($9227,2)

PATCH($922f,2)
    out (IO_PSG),a
ENDPATCH($922f,2)

PATCH($9592,3)
    call $ffd9
ENDPATCH($9592,3)

PATCH($959d,3)
    call $ff82
ENDPATCH($959d,3)

PATCH($95a8,3)
    call $ff82
ENDPATCH($95a8,3)

PATCH($95b3,3)
    call $ff82
ENDPATCH($95b3,3)

PATCH($95b9,3)
    call $ffd9
ENDPATCH($95b9,3)

PATCH($9270,3)
    call $ffd9
ENDPATCH($9270,3)

PATCH($9279,3)
    call $ffd9
ENDPATCH($9279,3)

PATCH($9257,2)
    out (IO_PSG),a
ENDPATCH($9257,2)

PATCH($9262,2)
    out (IO_PSG),a
ENDPATCH($9262,2)

PATCH($8a1f,3)
    call $ffd9
ENDPATCH($8a1f,3)

PATCH($8c9e,3)
    call $ffd9
ENDPATCH($8c9e,3)

PATCH($8cae,3)
    call $ff82
ENDPATCH($8cae,3)

PATCH($8cc1,3)
    call $ffdf
ENDPATCH($8cc1,3)

PATCH($8d1d,3)
    call $ffdf
ENDPATCH($8d1d,3)

PATCH($8d2c,3)
    call $ffeb
ENDPATCH($8d2c,3)

PATCH($8cfd,3)
    call $ffdf
ENDPATCH($8cfd,3)

PATCH($8d09,3)
    call $ffdf
ENDPATCH($8d09,3)

