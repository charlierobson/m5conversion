.include "..\m5c-defs.inc"

PATCHINIT($8000)
PATCH($bd9b,3)
    call V_WRITE_REGISTER
ENDPATCH($bd9b,3)

PATCH($bda1,3)
    call V_WRITE_REGISTER
ENDPATCH($bda1,3)

PATCH($bda4,3)
    jp V_TURN_OFF_SOUND
ENDPATCH($bda4,3)

PATCH($bf75,2)
    out (IO_VDP_Addr),a
ENDPATCH($bf75,2)

PATCH($bf7a,2)
    out (IO_VDP_Addr),a
ENDPATCH($bf7a,2)

PATCH($bdfe,2)
    out (IO_VDP_Data),a
ENDPATCH($bdfe,2)

PATCH($bdac,3)
    call V_INIT_TABLE
ENDPATCH($bdac,3)

PATCH($bdb4,3)
    call V_INIT_TABLE
ENDPATCH($bdb4,3)

PATCH($bdbc,3)
    call V_INIT_TABLE
ENDPATCH($bdbc,3)

PATCH($bdc4,3)
    call V_INIT_TABLE
ENDPATCH($bdc4,3)

PATCH($bdcc,3)
    call V_INIT_TABLE
ENDPATCH($bdcc,3)

PATCH($bdd2,3)
    jp V_WRITE_REGISTER
ENDPATCH($bdd2,3)

PATCH($beef,2)
    out (IO_VDP_Data),a
ENDPATCH($beef,2)

PATCH($bee2,2)
    out (IO_VDP_Data),a
ENDPATCH($bee2,2)

PATCH($bf87,2)
    out (IO_VDP_Addr),a
ENDPATCH($bf87,2)

PATCH($bf8a,2)
    out (IO_VDP_Addr),a
ENDPATCH($bf8a,2)

PATCH($bdda,2)
    in a,(IO_VDP_Data)
ENDPATCH($bdda,2)

PATCH($a415,2)
    out (IO_VDP_Addr),a
ENDPATCH($a415,2)

PATCH($a41a,2)
    out (IO_VDP_Addr),a
ENDPATCH($a41a,2)

PATCH($a41d,2)
    out (IO_VDP_Data),a
ENDPATCH($a41d,2)

PATCH($806a,3)
    call V_LOAD_ASCII
ENDPATCH($806a,3)

PATCH($b3af,2)
    in a,(IO_VDP_Data)
ENDPATCH($b3af,2)

PATCH($b3a9,2)
    out (IO_VDP_Data),a
ENDPATCH($b3a9,2)

PATCH($bdeb,2)
    out (IO_VDP_Data),a
ENDPATCH($bdeb,2)

PATCH($9b78,3)
    call V_DECODER
ENDPATCH($9b78,3)

PATCH($8303,3)
    call V_WRITE_REGISTER
ENDPATCH($8303,3)

PATCH($848b,2)
    in a,(IO_VDP_Addr)
ENDPATCH($848b,2)

PATCH($8147,3)
    call V_WRITE_REGISTER
ENDPATCH($8147,3)

PATCH($8162,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8162,2)

PATCH($841a,3)
    call V_DECODER
ENDPATCH($841a,3)

PATCH($af43,2)
    out (IO_PSG),a
ENDPATCH($af43,2)

PATCH($af34,2)
    out (IO_PSG),a
ENDPATCH($af34,2)

PATCH($af38,2)
    out (IO_PSG),a
ENDPATCH($af38,2)

PATCH($acbd,2)
    out (IO_PSG),a
ENDPATCH($acbd,2)

PATCH($acc6,2)
    out (IO_PSG),a
ENDPATCH($acc6,2)

PATCH($accf,2)
    out (IO_PSG),a
ENDPATCH($accf,2)

PATCH($acd3,2)
    out (IO_PSG),a
ENDPATCH($acd3,2)

PATCH($acd7,2)
    out (IO_PSG),a
ENDPATCH($acd7,2)

PATCH($ad21,2)
    out (IO_PSG),a
ENDPATCH($ad21,2)

PATCH($ad25,2)
    out (IO_PSG),a
ENDPATCH($ad25,2)

PATCH($ae66,2)
    out (IO_PSG),a
ENDPATCH($ae66,2)

PATCH($ae6d,2)
    out (IO_PSG),a
ENDPATCH($ae6d,2)

PATCH($ae70,2)
    out (IO_PSG),a
ENDPATCH($ae70,2)

PATCH($ae7a,2)
    out (IO_PSG),a
ENDPATCH($ae7a,2)

PATCH($ae7e,2)
    out (IO_PSG),a
ENDPATCH($ae7e,2)
