.include "..\m5c-defs.inc"

PATCHINIT($8000)

; manual patches

_jsRead	.equ	$ED58
_js1	.equ	$ED5C
_js2	.equ	$ED84
_kpRead	.equ	$EDB8
_kp1	.equ	$EDBC
_kp2	.equ	$EDCD

; out (IO_CTLSEL),a   JOYSTICK MODE  @aab8
; in a,(IO_CTLR_1) @aac0
;
PATCH($aab8,6)
    call _js1
ENDPATCH($aab8,6)

PATCH($aac0,11)
    ld  a,($70cc)
    sla a
    call _jsRead
ENDPATCH($aac0,11)

PATCH($8b55,3)
    call $2010
ENDPATCH($8b55,3)


; out (IO_CTLSEL),a   KEYPAD MODE  @8055
; in a,(IO_CTLR_1) @8059
;
PATCH($8053,14)
    call _kp1
    cp  $7f
    jr  nz,{+}
    call _kp2
+:
ENDPATCH($8053,14)

PATCH($a9ce,15)
    ld a,($70cc)
    sla a
    jp _kpRead
ENDPATCH($a9ce,15)

; auto patches

PATCH($bb13,2)
    out (IO_PSG),a
ENDPATCH($bb13,2)

PATCH($bb17,2)
    out (IO_PSG),a
ENDPATCH($bb17,2)

PATCH($bb1b,2)
    out (IO_PSG),a
ENDPATCH($bb1b,2)

PATCH($bb1f,2)
    out (IO_PSG),a
ENDPATCH($bb1f,2)

PATCH($ac1c,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac1c,2)

PATCH($ac20,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac20,2)

PATCH($8116,2)
    out (IO_VDP_Addr),a
ENDPATCH($8116,2)

PATCH($811a,2)
    out (IO_VDP_Addr),a
ENDPATCH($811a,2)

PATCH($8b16,2)
    out (IO_VDP_Addr),a
ENDPATCH($8b16,2)

PATCH($8b1a,2)
    out (IO_VDP_Addr),a
ENDPATCH($8b1a,2)

PATCH($ac28,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac28,2)

PATCH($ac2d,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac2d,2)

PATCH($ac30,2)
    out (IO_VDP_Data),a
ENDPATCH($ac30,2)

PATCH($ac39,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac39,2)

PATCH($ac3e,2)
    out (IO_VDP_Addr),a
ENDPATCH($ac3e,2)

PATCH($ac43,2)
    out (IO_VDP_Data),a
ENDPATCH($ac43,2)

PATCH($ad71,2)
    out (IO_VDP_Addr),a
ENDPATCH($ad71,2)

PATCH($ad76,2)
    out (IO_VDP_Addr),a
ENDPATCH($ad76,2)

PATCH($ad79,2)
    out (IO_VDP_Data),a
ENDPATCH($ad79,2)

PATCH($a455,2)
    out (IO_VDP_Addr),a
ENDPATCH($a455,2)

PATCH($a45a,2)
    out (IO_VDP_Addr),a
ENDPATCH($a45a,2)

PATCH($a45d,2)
    out (IO_VDP_Data),a
ENDPATCH($a45d,2)

PATCH($8b25,2)
    out (IO_VDP_Addr),a
ENDPATCH($8b25,2)

PATCH($8b29,2)
    out (IO_VDP_Addr),a
ENDPATCH($8b29,2)

PATCH($a962,2)
    in a,(IO_VDP_Addr)
ENDPATCH($a962,2)

PATCH($8107,2)
    out (IO_VDP_Addr),a
ENDPATCH($8107,2)

PATCH($810b,2)
    out (IO_VDP_Addr),a
ENDPATCH($810b,2)

PATCH($8122,2)
    out (IO_VDP_Addr),a
ENDPATCH($8122,2)

PATCH($8127,2)
    out (IO_VDP_Addr),a
ENDPATCH($8127,2)

PATCH($812e,2)
    out (IO_VDP_Data),a
ENDPATCH($812e,2)

PATCH($ad7d,2)
    out (IO_VDP_Addr),a
ENDPATCH($ad7d,2)

PATCH($ad80,2)
    out (IO_VDP_Addr),a
ENDPATCH($ad80,2)

PATCH($ad86,2)
    in a,(IO_VDP_Data)
ENDPATCH($ad86,2)

PATCH($bb9f,2)
    out (IO_PSG),a
ENDPATCH($bb9f,2)

PATCH($bbb2,2)
    out (IO_PSG),a
ENDPATCH($bbb2,2)
