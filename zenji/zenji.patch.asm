.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($8486,2)
	reti
ENDPATCH($8486,2)

PATCH($81b2,2)
	LD	C,IO_VDP_Data
ENDPATCH($81b2,2)

PATCH($8081,5)
	call	$2010
ENDPATCH($8081,5)

PATCH($80b8,5)
	call	$2013
ENDPATCH($80b8,5)

PATCH($964e,3)
    call	$2016
ENDPATCH($964e,3)

; mame

PATCH($8058,3)
    jp $fff4
ENDPATCH($8058,3)

PATCH($805b,3)
    jp $ff61
ENDPATCH($805b,3)

PATCH($8055,3)
    jp $fff1
ENDPATCH($8055,3)

PATCH($83d7,2)
    out (IO_VDP_Addr),a
ENDPATCH($83d7,2)

PATCH($83db,2)
    out (IO_VDP_Addr),a
ENDPATCH($83db,2)

PATCH($8061,3)
    jp $ffd6
ENDPATCH($8061,3)

PATCH($8149,2)
    out (IO_VDP_Addr),a
ENDPATCH($8149,2)

PATCH($814e,2)
    out (IO_VDP_Addr),a
ENDPATCH($814e,2)

PATCH($8181,2)
    out (IO_VDP_Addr),a
ENDPATCH($8181,2)

PATCH($8184,2)
    out (IO_VDP_Addr),a
ENDPATCH($8184,2)

PATCH($818d,2)
    out (IO_VDP_Data),a
ENDPATCH($818d,2)

PATCH($8363,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8363,2)

PATCH($8365,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8365,2)

PATCH($8372,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8372,2)

PATCH($81a9,2)
    out (IO_VDP_Addr),a
ENDPATCH($81a9,2)

PATCH($81ac,2)
    out (IO_VDP_Addr),a
ENDPATCH($81ac,2)

PATCH($8121,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8121,2)

PATCH($805e,3)
    jp $ffee
ENDPATCH($805e,3)

PATCH($819b,2)
    out (IO_VDP_Data),a
ENDPATCH($819b,2)

PATCH($83ad,2)
    out (IO_VDP_Addr),a
ENDPATCH($83ad,2)

PATCH($83b1,2)
    out (IO_VDP_Addr),a
ENDPATCH($83b1,2)
