.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($8024,1)	; nop out the di
ENDPATCH($8024,1)

; mame

PATCH($abe1,3)
    call V_READ_REGISTER
ENDPATCH($abe1,3)

PATCH($abe8,3)
    call V_WRITE_REGISTER
ENDPATCH($abe8,3)

PATCH($abeb,3)
    jp V_READ_REGISTER
ENDPATCH($abeb,3)

PATCH($802b,3)
    call V_READ_REGISTER
ENDPATCH($802b,3)

PATCH($802e,3)
    call V_MODE_1
ENDPATCH($802e,3)

PATCH($8031,3)
    call V_TURN_OFF_SOUND
ENDPATCH($8031,3)

PATCH($a00b,3)
    jp V_SOUND_INIT
ENDPATCH($a00b,3)

PATCH($9fba,3)
    jp V_FILL_VRAM
ENDPATCH($9fba,3)

PATCH($a800,3)
    call V_INIT_TABLE
ENDPATCH($a800,3)

PATCH($a80c,3)
    call V_WRITE_VRAM
ENDPATCH($a80c,3)

PATCH($a81a,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a81a,3)

PATCH($a828,3)
    call V_ROTATE_90
ENDPATCH($a828,3)

PATCH($a836,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a836,3)

PATCH($a844,3)
    call V_REFLECT_HORIZONTAL
ENDPATCH($a844,3)

PATCH($a84c,3)
    call V_INIT_TABLE
ENDPATCH($a84c,3)

PATCH($a876,3)
    call V_INIT_TABLE
ENDPATCH($a876,3)

PATCH($a87e,3)
    call V_WRITE_VRAM
ENDPATCH($a87e,3)

PATCH($a898,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a898,3)

PATCH($9fe8,3)
    jp V_READ_VRAM
ENDPATCH($9fe8,3)

PATCH($ac34,3)
    jp V_WRITE_VRAM
ENDPATCH($ac34,3)

PATCH($b20a,3)
    call V_ROTATE_90
ENDPATCH($b20a,3)

PATCH($a8b7,3)
    call V_ROTATE_90
ENDPATCH($a8b7,3)

PATCH($a8cb,3)
    call V_ROTATE_90
ENDPATCH($a8cb,3)

PATCH($a8df,3)
    call V_ROTATE_90
ENDPATCH($a8df,3)

PATCH($a86c,3)
    jp V_INIT_TABLE
ENDPATCH($a86c,3)

PATCH($a8ef,3)
    call V_LOAD_ASCII
ENDPATCH($a8ef,3)

PATCH($ab9e,3)
    call V_WRITE_VRAM
ENDPATCH($ab9e,3)

PATCH($a918,3)
    call V_FILL_VRAM
ENDPATCH($a918,3)

PATCH($a923,3)
    call V_FILL_VRAM
ENDPATCH($a923,3)

PATCH($ac2e,3)
    jp V_WRITE_VRAM
ENDPATCH($ac2e,3)

PATCH($a938,3)
    call V_WRITE_VRAM
ENDPATCH($a938,3)

PATCH($a944,3)
    call V_WRITE_VRAM
ENDPATCH($a944,3)

PATCH($a950,3)
    call V_WRITE_VRAM
ENDPATCH($a950,3)

PATCH($a95e,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a95e,3)

PATCH($a975,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a975,3)

PATCH($a98c,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a98c,3)

PATCH($a998,3)
    call V_WRITE_VRAM
ENDPATCH($a998,3)

PATCH($a9a6,3)
    call V_REFLECT_VERTICAL
ENDPATCH($a9a6,3)

PATCH($a9b2,3)
    call V_WRITE_VRAM
ENDPATCH($a9b2,3)

PATCH($a9be,3)
    call V_WRITE_VRAM
ENDPATCH($a9be,3)

PATCH($a9ca,3)
    call V_WRITE_VRAM
ENDPATCH($a9ca,3)

PATCH($a9d6,3)
    call V_WRITE_VRAM
ENDPATCH($a9d6,3)

PATCH($b1f6,3)
    call V_REFLECT_VERTICAL
ENDPATCH($b1f6,3)

PATCH($aa0b,3)
    call V_ROTATE_90
ENDPATCH($aa0b,3)

PATCH($aa21,3)
    call V_REFLECT_VERTICAL
ENDPATCH($aa21,3)

PATCH($a01d,3)
    jp V_FILL_VRAM
ENDPATCH($a01d,3)

PATCH($a7bf,3)
    jp V_WRITE_VRAM
ENDPATCH($a7bf,3)

PATCH($ac4f,3)
    call V_INIT_TABLE
ENDPATCH($ac4f,3)

PATCH($ac57,3)
    call V_INIT_TABLE
ENDPATCH($ac57,3)

PATCH($a587,3)
    call V_RAND_GEN
ENDPATCH($a587,3)

PATCH($a58a,3)
    call V_RAND_GEN
ENDPATCH($a58a,3)

PATCH($a58d,3)
    call V_RAND_GEN
ENDPATCH($a58d,3)

PATCH($a595,3)
    call V_RAND_GEN
ENDPATCH($a595,3)

PATCH($abd5,3)
    call V_READ_REGISTER
ENDPATCH($abd5,3)

PATCH($a406,3)
    call V_DECODER
ENDPATCH($a406,3)

PATCH($a418,3)
    call V_DECODER
ENDPATCH($a418,3)

PATCH($809c,3)
    call V_WRITE_VRAM
ENDPATCH($809c,3)

PATCH($80a5,3)
    call V_PLAY_SONGS
ENDPATCH($80a5,3)

PATCH($80a8,3)
    call V_SOUND_MAN
ENDPATCH($80a8,3)

PATCH($80ed,3)
    call V_READ_REGISTER
ENDPATCH($80ed,3)

PATCH($926e,3)
    call V_INIT_TABLE
ENDPATCH($926e,3)

PATCH($9276,3)
    call V_INIT_TABLE
ENDPATCH($9276,3)

PATCH($ad93,3)
    call V_READ_REGISTER
ENDPATCH($ad93,3)

PATCH($abf5,3)
    call V_PLAY_IT
ENDPATCH($abf5,3)

PATCH($8066,3)
    call V_READ_REGISTER
ENDPATCH($8066,3)

PATCH($a47e,3)
    call V_READ_REGISTER
ENDPATCH($a47e,3)

PATCH($81f3,3)
    call V_RAND_GEN
ENDPATCH($81f3,3)

PATCH($8da3,3)
    call V_RAND_GEN
ENDPATCH($8da3,3)

PATCH($a76a,3)
    call V_FILL_VRAM
ENDPATCH($a76a,3)

PATCH($91cb,3)
    call V_WRITE_VRAM
ENDPATCH($91cb,3)

PATCH($91db,3)
    jp V_READ_REGISTER
ENDPATCH($91db,3)

PATCH($9209,3)
    call V_READ_REGISTER
ENDPATCH($9209,3)

PATCH($9248,3)
    call V_WRITE_VRAM
ENDPATCH($9248,3)

PATCH($a114,3)
    call V_INIT_TABLE
ENDPATCH($a114,3)

PATCH($a5c3,3)
    call V_RAND_GEN
ENDPATCH($a5c3,3)

PATCH($a5c9,3)
    call V_RAND_GEN
ENDPATCH($a5c9,3)

PATCH($a69d,3)
    jp V_WRITE_VRAM
ENDPATCH($a69d,3)

PATCH($8d15,3)
    call V_RAND_GEN
ENDPATCH($8d15,3)

PATCH($819a,3)
    call V_RAND_GEN
ENDPATCH($819a,3)

PATCH($88e9,3)
    call V_WRITE_VRAM
ENDPATCH($88e9,3)

PATCH($aaf2,3)
    call V_INIT_TABLE
ENDPATCH($aaf2,3)

PATCH($ab09,3)
    call V_TURN_OFF_SOUND
ENDPATCH($ab09,3)

PATCH($807f,3)
    call V_TURN_OFF_SOUND
ENDPATCH($807f,3)

PATCH($8085,3)
    call V_TURN_OFF_SOUND
ENDPATCH($8085,3)

