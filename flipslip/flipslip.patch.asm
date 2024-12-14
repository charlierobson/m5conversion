.include "../m5c-defs.inc"

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

; $82c7 OUT (c),e (port = IO_VDP_Addr, val = $00)
; $82c9 OUT (c),d (port = IO_VDP_Addr, val = $00)
PATCH($82c5,2)
    ld  c,IO_VDP_Addr
ENDPATCH($82c5,2)

PATCH($82cc,2)
    out (IO_VDP_Data),a
ENDPATCH($82cc,2)

; $aa6e OUT (c),e (port = IO_VDP_Addr, val = $00)
; $aa72 OUT (c),d (port = IO_VDP_Addr, val = $00)
PATCH($aa6c,2)
    ld  c,IO_VDP_Addr
ENDPATCH($aa6c,2)

; $aa77 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $aa79 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($aa75,2)
    ld  c,IO_VDP_Addr
ENDPATCH($aa75,2)

PATCH($aa93,2)
    out (IO_VDP_Data),a
ENDPATCH($aa93,2)

; $aa9f OUT (c),l (port = IO_VDP_Addr, val = $00)
; $aaa1 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($aa9d,2)
    ld  c,IO_VDP_Addr
ENDPATCH($aa9d,2)

PATCH($aacc,2)
    out (IO_VDP_Data),a
ENDPATCH($aacc,2)

PATCH($aada,2)
    out (IO_VDP_Data),a
ENDPATCH($aada,2)

; $aa5a OUT (c),l (port = IO_VDP_Addr, val = $07)
; $aa5e OUT (c),h (port = IO_VDP_Addr, val = $07)
PATCH($aa58,2)
    ld  c,IO_VDP_Addr
ENDPATCH($aa58,2)

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

; $aa26 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $aa28 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($aa24,2)
    ld  c,IO_VDP_Addr
ENDPATCH($aa24,2)

PATCH($aa32,3)
    call V_GAME_OPT
ENDPATCH($aa32,3)

;8328 d3  80           OUT        (DAT_io_0080 ),A
;832a 00              NOP
;832b 00              NOP
;832c 00              NOP
;832d db  fc           IN         A,(DAT_io_00fc )
;832f cd  45  83       CALL       FUN_ram_8345                                     undefined FUN_ram_8345()
;8332 3a  4d  70       LD         A,(DAT_ram_704d )
;8335 fe  ff           CP         0xff
;8337 c0              RET        NZ
;8338 db  ff           IN         A,(DAT_io_00ff )
;833a cd  45  83       CALL       FUN_ram_8345                                     undefined FUN_ram_8345()
;833d 3a  4d  70       LD         A,(DAT_ram_704d )
;8340 fe  ff           CP         0xff
;8342 c0              RET        NZ
;8343 18  d3           JR         LAB_ram_8318

PATCH($8328,18)
    call    CRV_JS1
    CALL       $8345
    LD         A,($704d)
    CP         $ff
    RET        NZ
    call    CRV_JS2
ENDPATCH($8328,18)

; $8551 OUT (c),e (port = IO_VDP_Addr, val = $00)
; $8553 OUT (c),d (port = IO_VDP_Addr, val = $00)
PATCH($854f,2)
    ld  c,IO_VDP_Addr
ENDPATCH($854f,2)

PATCH($8560,2)
    out (IO_VDP_Data),a
ENDPATCH($8560,2)

; $82d6 OUT (c),e (port = IO_VDP_Addr, val = $68)
; $82d8 OUT (c),d (port = IO_VDP_Addr, val = $68)
PATCH($82d4,2)
    ld  c,IO_VDP_Addr
ENDPATCH($82d4,2)

PATCH($8289,2)
    out (IO_VDP_Data),a
ENDPATCH($8289,2)

PATCH($8299,2)
    out (IO_VDP_Data),a
ENDPATCH($8299,2)

; $b96a OUT (c),e (port = IO_VDP_Addr, val = $06)
; $b96c OUT (c),d (port = IO_VDP_Addr, val = $06)
PATCH($b968,2)
    ld  c,IO_VDP_Addr
ENDPATCH($b968,2)

PATCH($b971,2)
    out (IO_VDP_Data),a
ENDPATCH($b971,2)

PATCH($8165,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8165,2)

PATCH($8176,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8176,2)

 ;817f d3  80           OUT        (DAT_io_0080 ),A
 ;8181 00              NOP
 ;8182 00              NOP
 ;8183 00              NOP
 ;8184 db  fc           IN         A,(DAT_io_00fc )
 ;8186 e6  0f           AND        0xf
 ;8188 fe  0f           CP         0xf
 ;818a c2  81  80       JP         NZ,LAB_ram_8081
 ;818d db  ff           IN         A,(DAT_io_00ff )
 ;818f e6  0f           AND        0xf
 ;8191 fe  0f           CP         0xf
 ;8193 c2  81  80       JP         NZ,LAB_ram_8081

PATCH($817f,2)
    out (IO_PSG),a
ENDPATCH($817f,2)

PATCH($ba81,2)
    out (IO_PSG),a
ENDPATCH($ba81,2)

PATCH($ba9c,2)
    out (IO_PSG),a
ENDPATCH($ba9c,2)

; $a441 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $a443 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($a43f,2)
    ld  c,IO_VDP_Addr
ENDPATCH($a43f,2)

PATCH($a448,2)
    in a,(IO_VDP_Data)
ENDPATCH($a448,2)

; $a195 OUT (c),l (port = IO_VDP_Addr, val = $00)
; $a197 OUT (c),h (port = IO_VDP_Addr, val = $00)
PATCH($a193,2)
    ld  c,IO_VDP_Addr
ENDPATCH($a193,2)

PATCH($a19c,2)
    in a,(IO_VDP_Data)
ENDPATCH($a19c,2)

PATCH($a6b8,2)
    out (IO_PSG),a
ENDPATCH($a6b8,2)

PATCH($a727,2)
    out (IO_PSG),a
ENDPATCH($a727,2)

