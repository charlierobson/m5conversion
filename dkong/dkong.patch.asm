.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($856a,2)
	ret
ENDPATCH($856a,2)

PATCH($8476,3)
	ld		hl,($e06c)
ENDPATCH($8476,3)


; mame

PATCH($805a,3)
    call $ff7c
ENDPATCH($805a,3)

PATCH($809e,3)
    call $ffeb
ENDPATCH($809e,3)

PATCH($80a1,3)
    call $ffd3
ENDPATCH($80a1,3)

PATCH($853c,3)
    call $ffd3
ENDPATCH($853c,3)

PATCH($853f,3)
    call $fff4
ENDPATCH($853f,3)

PATCH($8542,3)
    call $ff61
ENDPATCH($8542,3)

PATCH($854a,3)
    call $ffc4
ENDPATCH($854a,3)

PATCH($854d,3)
    call $ffe8
ENDPATCH($854d,3)

PATCH($8550,3)
    call $ffeb
ENDPATCH($8550,3)

PATCH($8556,3)
    call $ffdc
ENDPATCH($8556,3)

PATCH($84f1,3)
    call $ffeb
ENDPATCH($84f1,3)

PATCH($9a63,3)
    jp $ffee
ENDPATCH($9a63,3)

PATCH($8294,3)
    call $ffbe
ENDPATCH($8294,3)

PATCH($8299,3)
    call $ffc1
ENDPATCH($8299,3)

PATCH($82a2,3)
    call $ffd9
ENDPATCH($82a2,3)

PATCH($82a8,3)
    call $ffd9
ENDPATCH($82a8,3)

PATCH($82b0,3)
    call $ffb8
ENDPATCH($82b0,3)

PATCH($82b8,3)
    call $ffb8
ENDPATCH($82b8,3)

PATCH($82c0,3)
    call $ffb8
ENDPATCH($82c0,3)

PATCH($82c8,3)
    call $ffb8
ENDPATCH($82c8,3)

PATCH($82d0,3)
    call $ffb8
ENDPATCH($82d0,3)

PATCH($9738,3)
    jp $ffd9
ENDPATCH($9738,3)

PATCH($84a6,3)
    call $ffd9
ENDPATCH($84a6,3)

PATCH($992a,3)
    call $ffbe
ENDPATCH($992a,3)

PATCH($84a0,3)
    jp $ff82
ENDPATCH($84a0,3)

PATCH($84d2,3)
    call $ff6a
ENDPATCH($84d2,3)

PATCH($8249,3)
    call $ffe5
ENDPATCH($8249,3)

PATCH($843b,3)
    call $ffd9
ENDPATCH($843b,3)

PATCH($8419,3)
    call $ffbe
ENDPATCH($8419,3)

PATCH($83d1,3)
    call $ffbe
ENDPATCH($83d1,3)

PATCH($8365,3)
    call $fff7
ENDPATCH($8365,3)

PATCH($8384,3)
    call $fffa
ENDPATCH($8384,3)

PATCH($8308,3)
    call $fff7
ENDPATCH($8308,3)

PATCH($8321,3)
    jp $fffa
ENDPATCH($8321,3)

PATCH($847b,3)
    call $ffbe
ENDPATCH($847b,3)

PATCH($848a,3)
    call $ffbe
ENDPATCH($848a,3)

PATCH($8496,3)
    jp $ff82
ENDPATCH($8496,3)

PATCH($8255,3)
    call $ffc7
ENDPATCH($8255,3)

PATCH($8dfa,3)
    call $fff7
ENDPATCH($8dfa,3)

PATCH($99aa,3)
    call $ffcd
ENDPATCH($99aa,3)

PATCH($994e,3)
    call $fffa
ENDPATCH($994e,3)

PATCH($8a03,3)
    call $fff7
ENDPATCH($8a03,3)

PATCH($8a0c,3)
    call $fffa
ENDPATCH($8a0c,3)

PATCH($9625,3)
    jp $fff7
ENDPATCH($9625,3)

PATCH($8636,3)
    jp $ffbe
ENDPATCH($8636,3)

PATCH($974e,3)
    jp $ffd9
ENDPATCH($974e,3)

PATCH($9934,3)
    call $fff1
ENDPATCH($9934,3)

PATCH($9a6b,3)
    call $ffd0
ENDPATCH($9a6b,3)

PATCH($995b,3)
    call $fffd
ENDPATCH($995b,3)

PATCH($8c3d,3)
    jp $fffa
ENDPATCH($8c3d,3)

PATCH($8dd8,3)
    call $fffa
ENDPATCH($8dd8,3)

PATCH($8ca6,3)
    jp $fffa
ENDPATCH($8ca6,3)

PATCH($8a7c,3)
    call $fff7
ENDPATCH($8a7c,3)

PATCH($8a83,3)
    call $fff7
ENDPATCH($8a83,3)

PATCH($8a8a,3)
    call $fff7
ENDPATCH($8a8a,3)

PATCH($8a91,3)
    call $fff7
ENDPATCH($8a91,3)

PATCH($894f,3)
    call $fffa
ENDPATCH($894f,3)

PATCH($8956,3)
    call $fffa
ENDPATCH($8956,3)

PATCH($895d,3)
    call $fffa
ENDPATCH($895d,3)

PATCH($8964,3)
    jp $fffa
ENDPATCH($8964,3)

PATCH($8d91,3)
    jp $fffa
ENDPATCH($8d91,3)

PATCH($9578,3)
    call $fffa
ENDPATCH($9578,3)

PATCH($957e,3)
    call $ffca
ENDPATCH($957e,3)

PATCH($9584,3)
    call $ffca
ENDPATCH($9584,3)



