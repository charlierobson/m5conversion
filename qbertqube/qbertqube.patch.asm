.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($9625,3)
    call V_TURN_OFF_SOUND
ENDPATCH($9625,3)

PATCH($962f,3)
    call V_FILL_VRAM
ENDPATCH($962f,3)

PATCH($9636,3)
    call V_GAME_OPT
ENDPATCH($9636,3)

PATCH($8e3d,3)
    call V_DECODER
ENDPATCH($8e3d,3)

PATCH($8e9f,3)
    jp V_WRITE_REGISTER
ENDPATCH($8e9f,3)

; reg 01 = a2 @fcd0
PATCH($9685,3)
    call V_READ_VRAM
ENDPATCH($9685,3)

; reg 01 = a2 @fcd0
PATCH($9e52,3)
    call V_FILL_VRAM
ENDPATCH($9e52,3)

PATCH($9731,3)
    call V_FILL_VRAM
ENDPATCH($9731,3)