.include "..\m5c-defs.inc"

PATCHINIT($8000)


_jsRead	.equ	$ED58
_js1	.equ	$ED5C
_js2	.equ	$ED84
_kpRead	.equ	$EDB8
_kp1	.equ	$EDBC
_kp2	.equ	$EDCD

;879d d3  80           OUT        (IO_KP_SELECT ),A
;879f 00              NOP
;87a0 00              NOP
;87a1 00              NOP
;87a2 db  fc           IN         A,(IO_PL1 )
;87a4 e6  0f           AND        0xf
;87a6 fe  0f           CP         0xf
;87a8 c0              RET        NZ
;87a9 db  ff           IN         A,(IO_PL2 )
;87ab e6  0f           AND        0xf
;87ad fe  0f           CP         0xf
;87af 28  ec           JR         Z,FUN_ram_879d

PATCH($879D,20)
-:  call _kp1
    and   $0f
    cp    $0f
    ret   nz
    call _kp2
    and   $0f
    cp    $0f
    jr    z,{-}
ENDPATCH($879D,20)

;9589 0e  fc           LD         C,0xfc
;958b 3a  09  70       LD         A,(DAT_ram_7009 )
;958e fe  02           CP         0x2
;9590 20  02           JR         NZ,LAB_ram_9594
;9592 0e  ff           LD         C,0xff
;9594 d3  c0           OUT        (IO_SET_JS ),A
;9596 00              NOP
;9597 00              NOP
;9598 00              NOP
;9599 ed  78           IN         A,(C)=>IO_PL2
;959b e6  0f           AND        0xf
;959d fe  0e           CP         0xe
;959f 20  04           JR         NZ,LAB_ram_95a5

PATCH($9589,24)
    ld      a,$7009 ; is 2 when player 1
    xor     2       ; jsread reads player 2 when bit 1 is set so flip it
    call    _jsRead
    and     $0f
    cp      $0e
    jr      nz,$95a5
ENDPATCH($9589,24)


;977b 0e  fc           LD         C,0xfc
;977d 3a  09  70       LD         A,(DAT_ram_7009 )
;9780 fe  02           CP         0x2
;9782 20  02           JR         NZ,LAB_ram_9786
;9784 0e  ff           LD         C,0xff
;9786 d3  80           OUT        (IO_KP_SELECT ),A
;9788 00              NOP
;9789 00              NOP
;978a 00              NOP
;978b ed  78           IN         A,(C)=>IO_PL2
;978d cb  77           BIT        0x6 ,A
;978f c8              RET        Z
;9790 d3  c0           OUT        (IO_SET_JS ),A
;9792 00              NOP
;9793 00              NOP
;9794 00              NOP
;9795 ed  78           IN         A,(C)=>IO_PL2
;9797 cb  77           BIT        0x6 ,A

PATCH($977b,30)
    ld      a,$7009 ; is 2 when player 1
    xor     2       ; jsread reads player 2 when bit 1 is set so flip it
    ld      c,a
    call    _kpRead
    bit     6,a
    ret     z
    ld      a,c
    call    _jsRead
    bit     6,a
ENDPATCH($977b,30)


;a2c9 d3  80           OUT        (IO_KP_SELECT ),A
;a2cb 00              NOP
;a2cc 00              NOP
;a2cd 00              NOP
;a2ce db  fc           IN         A,(IO_PL1 )
;a2d0 e6  0f           AND        0xf
;a2d2 fe  06           CP         0x6
;a2d4 ca  2c  a3       JP         Z,LAB_ram_a32c
;a2d7 fe  09           CP         0x9
;a2d9 ca  2c  a3       JP         Z,LAB_ram_a32c
;a2dc db  ff           IN         A,(IO_PL2 )
;a2de e6  0f           AND        0xf
;a2e0 fe  06           CP         0x6
;a2e2 28  48           JR         Z,LAB_ram_a32c
;a2e4 fe  09           CP         0x9
;a2e6 28  44           JR         Z,LAB_ram_a32c

PATCH($a2c9,31)
    call    _kp1
    and     $0f
    cp      $06
    jp      z,$a32c
    cp      $09
    jp      z,$a32c
    call    _kp2
    and     $0f
    cp      $06
    jr      z,$a32c
    cp      $09
    jr      z,$a32c
ENDPATCH($a2c9,31)


;807f dd  21  d4  a5    LD         IX,0xa5d4    ; (goes on to set vdp regs)

PATCH($807f,4)
    call    $2010
ENDPATCH($807f,4)


; $b3cb OUT (c),e (port = IO_VDP_Addr, val = $00)
; $b3cf OUT (c),d (port = IO_VDP_Addr, val = $00)
PATCH($b3c9,2)
    ld c,IO_VDP_Addr
ENDPATCH($b3c9,2)

; $b3d4 OUT (c),e (port = IO_VDP_Addr, val = $00)
; $b3d6 OUT (c),d (port = IO_VDP_Addr, val = $00)
PATCH($b3d2,2)
    ld c,IO_VDP_Addr
ENDPATCH($b3d2,2)

; $b3ee OUT (c),l (port = IO_VDP_Addr, val = $00)
; $b3f0 OUT (c),h (port = IO_VDP_Addr, val = $00)
; $b410 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $b412 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($b3ec,2)
    ld c,IO_VDP_Addr
ENDPATCH($b3ec,2)

; $b3b7 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $b3bb OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($b3b5,2)
    ld c,IO_VDP_Addr
ENDPATCH($b3b5,2)

; $b369 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $b36b OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($b367,2)
    ld c,IO_VDP_Addr
ENDPATCH($b367,2)


;

PATCH($8220,2)
    out (IO_VDP_Addr),a
ENDPATCH($8220,2)

PATCH($8224,2)
    out (IO_VDP_Addr),a
ENDPATCH($8224,2)

PATCH($8228,2)
    out (IO_VDP_Addr),a
ENDPATCH($8228,2)

PATCH($822c,2)
    out (IO_VDP_Addr),a
ENDPATCH($822c,2)

PATCH($87cb,2)
    out (IO_VDP_Addr),a
ENDPATCH($87cb,2)

PATCH($87d0,2)
    out (IO_VDP_Addr),a
ENDPATCH($87d0,2)

PATCH($87d5,2)
    out (IO_VDP_Data),a
ENDPATCH($87d5,2)

PATCH($82e0,2)
    out (IO_VDP_Addr),a
ENDPATCH($82e0,2)

PATCH($82e4,2)
    out (IO_VDP_Addr),a
ENDPATCH($82e4,2)

PATCH($87bf,2)
    out (IO_VDP_Addr),a
ENDPATCH($87bf,2)

PATCH($87c4,2)
    out (IO_VDP_Addr),a
ENDPATCH($87c4,2)

PATCH($87c7,2)
    out (IO_VDP_Data),a
ENDPATCH($87c7,2)

PATCH($a1be,2)
    out (IO_VDP_Data),a
ENDPATCH($a1be,2)

PATCH($856f,2)
    in a,(IO_VDP_Addr)
ENDPATCH($856f,2)

PATCH($8573,2)
    out (IO_VDP_Addr),a
ENDPATCH($8573,2)

PATCH($8579,2)
    out (IO_VDP_Addr),a
ENDPATCH($8579,2)

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

PATCH($b3e2,2)
    out (IO_VDP_Data),a
ENDPATCH($b3e2,2)

PATCH($b431,2)
    out (IO_VDP_Data),a
ENDPATCH($b431,2)

PATCH($b423,2)
    out (IO_VDP_Data),a
ENDPATCH($b423,2)

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

PATCH($8584,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8584,2)

PATCH($9e4e,2)
    out (IO_PSG),a
ENDPATCH($9e4e,2)

PATCH($9e69,2)
    out (IO_PSG),a
ENDPATCH($9e69,2)

PATCH($87b3,2)
    out (IO_VDP_Addr),a
ENDPATCH($87b3,2)

PATCH($87b6,2)
    out (IO_VDP_Addr),a
ENDPATCH($87b6,2)

PATCH($87bb,2)
    in a,(IO_VDP_Data)
ENDPATCH($87bb,2)

PATCH($82f4,2)
    out (IO_PSG),a
ENDPATCH($82f4,2)

PATCH($8384,2)
    out (IO_VDP_Data),a
ENDPATCH($8384,2)

PATCH($974f,2)
    out (IO_VDP_Addr),a
ENDPATCH($974f,2)

PATCH($9752,2)
    out (IO_VDP_Addr),a
ENDPATCH($9752,2)

PATCH($9757,2)
    in a,(IO_VDP_Data)
ENDPATCH($9757,2)

PATCH($8d98,2)
    out (IO_VDP_Addr),a
ENDPATCH($8d98,2)

PATCH($8d9b,2)
    out (IO_VDP_Addr),a
ENDPATCH($8d9b,2)

PATCH($8da0,2)
    in a,(IO_VDP_Data)
ENDPATCH($8da0,2)

PATCH($8db1,2)
    out (IO_VDP_Addr),a
ENDPATCH($8db1,2)

PATCH($8db6,2)
    out (IO_VDP_Addr),a
ENDPATCH($8db6,2)

PATCH($8db9,2)
    out (IO_VDP_Data),a
ENDPATCH($8db9,2)

PATCH($a0a0,2)
    out (IO_PSG),a
ENDPATCH($a0a0,2)

PATCH($a04a,2)
    out (IO_PSG),a
ENDPATCH($a04a,2)

PATCH($9bc0,2)
    out (IO_VDP_Addr),a
ENDPATCH($9bc0,2)

PATCH($9bc3,2)
    out (IO_VDP_Addr),a
ENDPATCH($9bc3,2)

PATCH($9bc8,2)
    in a,(IO_VDP_Data)
ENDPATCH($9bc8,2)

PATCH($a243,2)
    out (IO_VDP_Addr),a
ENDPATCH($a243,2)

PATCH($a249,2)
    out (IO_VDP_Addr),a
ENDPATCH($a249,2)

PATCH($a27c,2)
    out (IO_PSG),a
ENDPATCH($a27c,2)

PATCH($9bc0,2)
    out (IO_VDP_Addr),a
ENDPATCH($9bc0,2)

PATCH($9bc3,2)
    out (IO_VDP_Addr),a
ENDPATCH($9bc3,2)

PATCH($9bc8,2)
    in a,(IO_VDP_Data)
ENDPATCH($9bc8,2)

PATCH($9bd1,2)
    in a,(IO_VDP_Data)
ENDPATCH($9bd1,2)
