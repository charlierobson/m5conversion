.include "..\m5c-defs.inc"

PATCHINIT($8000)

PATCH($8145, 2)
	ld		c,$11		; black is black
ENDPATCH($8145, 2)

PATCH($84d7, 2)
	cp		$01			; game restart
ENDPATCH($84d7, 2)

PATCH($84db, 2)
	cp		$02			; level select
ENDPATCH($84db, 2)

PATCH($84e2, 2)
	cp		$01			; game restart
ENDPATCH($84e2, 2)

PATCH($84e6, 2)
	cp		$02			; level select
ENDPATCH($84e6, 2)

PATCH($84ea, 2)
	cp		$01			; level select
ENDPATCH($84ea, 2)


PATCH($85ac,4)
        LD         IX,$1f82+BIOS
ENDPATCH($85ac,4)

PATCH($85cd,4)
        LD         IX,$1f82+BIOS
ENDPATCH($85cd,4)

PATCH($85e1,4)
        LD         IX,$1f82+BIOS
ENDPATCH($85e1,4)  

PATCH($85f1,4)
        LD         IX,$1f82+BIOS
ENDPATCH($85f1,4)

PATCH($8607,4)
        LD         IX,$1f82+BIOS
ENDPATCH($8607,4)

PATCH($861c,4)
        LD         IX,$1f82+BIOS
ENDPATCH($861c,4)
1
PATCH($ac5d,4)
        LD         IX,$1f82+BIOS
ENDPATCH($ac5d,4)

PATCH($b1e9,4)
        LD         IX,$1f82+BIOS
ENDPATCH($b1e9,4)


; PATCH($9e12,2)
; 	ret
; ENDPATCH($9e12,2)



PATCH($80f2,3)   
        call    $ffc7
ENDPATCH($80f2,3)

PATCH($80fb,3)   
        call    $ffee
ENDPATCH($80fb,3)

PATCH($80cc,3)
        call    $ffe5
ENDPATCH($80cc,3)

PATCH($80ff,3)
        call    $ff85
ENDPATCH($80ff,3)

PATCH($8102,3)
        call    $ff7f
ENDPATCH($8102,3)

PATCH($8105,3)
        call    $ff7c
ENDPATCH($8105,3)

PATCH($8118,3)
        call    $ffeb
ENDPATCH($8118,3)

PATCH($9dd8,3)
        call    $ffd9
ENDPATCH($9dd8,3)

PATCH($8149,3)
        call    $ffd9
ENDPATCH($8149,3)

PATCH($8167,3)
        call    $ffb8
ENDPATCH($8167,3)

PATCH($816f,3)
        call    $ffb8
ENDPATCH($816f,3)

PATCH($8177,3)
        call    $ffb8
ENDPATCH($8177,3)

PATCH($817f,3)
        call    $ffb8
ENDPATCH($817f,3)

PATCH($8187,3)
        call    $ffb8
ENDPATCH($8187,3)

PATCH($8193,3)
        call    $ff82
ENDPATCH($8193,3)

PATCH($819f,3)
        call    $ff82
ENDPATCH($819f,3)

PATCH($bd97,3)
        call    $ffdf
ENDPATCH($bd97,3)

PATCH($bd7b,3)
        call    $ff82
ENDPATCH($bd7b,3)

PATCH($9e1e,3)
        call    $ffdf
ENDPATCH($9e1e,3)

PATCH($9e2e,3)
        call    $ffdf
ENDPATCH($9e2e,3)

PATCH($81fe,3)
        call    $ffd9
ENDPATCH($81fe,3)

PATCH($b422,3)
        call    $ffe8
ENDPATCH($b422,3)

PATCH($b428,3)
        call    $ff7f
ENDPATCH($b428,3)

PATCH($b439,3)
        call    $ff82
ENDPATCH($b439,3)

PATCH($b442,3)
        call    $ffdf
ENDPATCH($b442,3)

PATCH($a420,3)
        call    $ffcd
ENDPATCH($a420,3)

PATCH($831d,3)
        call    $ffdc
ENDPATCH($831d,3)

PATCH($8341,3)
        call    $ffe8
ENDPATCH($8341,3)

PATCH($8344,3)
        call    $ffd3
ENDPATCH($8344,3)

PATCH($8347,3)
        call    $ffeb
ENDPATCH($8347,3)

PATCH($834a,3)
        call    $ff61
ENDPATCH($834a,3)

PATCH($834d,3)
        call    $fff4
ENDPATCH($834d,3)

PATCH($a42c,3)
        call    $ffd0
ENDPATCH($a42c,3)

PATCH($a435,3)
        call    $ffca
ENDPATCH($a435,3)

PATCH($a6ad,3)
        jp		$fffa
ENDPATCH($a6ad,3)

PATCH($ace9,3)
        call    $fffa
ENDPATCH($ace9,3)

PATCH($ad55,3)
        call    $fffa
ENDPATCH($ad55,3)

PATCH($ad8b,3)
        call    $fffa
ENDPATCH($ad8b,3)

PATCH($ad9f,3)
        call    $fffa
ENDPATCH($ad9f,3)

PATCH($adbd,3)
        call    $fffa
ENDPATCH($adbd,3)

PATCH($9614,3)
        jp		$fffa
ENDPATCH($9614,3)

PATCH($9c81,3)
        call    $ffcd
ENDPATCH($9c81,3)

PATCH($9c8d,3)
        call    $ffcd
ENDPATCH($9c8d,3)

PATCH($a38f,3)
        call    $fffd
ENDPATCH($a38f,3)

PATCH($ae4c,3)
        call    $fffa
ENDPATCH($ae4c,3)

PATCH($ae65,3)
        call    $ffcd
ENDPATCH($ae65,3)

PATCH($8251,3)
        call    $fff1
ENDPATCH($8251,3)

PATCH($8256,3)
        call    $fff1
ENDPATCH($8256,3)

PATCH($825b,3)
        call    $fff1
ENDPATCH($825b,3)

PATCH($8260,3)
        call    $fff1
ENDPATCH($8260,3)

PATCH($8265,3)
        call    $fff1
ENDPATCH($8265,3)

PATCH($9519,3)
        jp		$fffa
ENDPATCH($9519,3)

PATCH($a93e,3)
        call    $ffcd
ENDPATCH($a93e,3)

PATCH($aad4,3)
        call    $fffa
ENDPATCH($aad4,3)

PATCH($8627,3)
        call    $ffd0
ENDPATCH($8627,3)

PATCH($aa11,3)
        call    $ffd0
ENDPATCH($aa11,3)

PATCH($a4a5,3)
        call    $fffa
ENDPATCH($a4a5,3)

PATCH($86bc,3)
        call    $ffb8
ENDPATCH($86bc,3)

PATCH($863c,3)
        call    $ffca
ENDPATCH($863c,3)

PATCH($8643,3)
        call    $ffcd
ENDPATCH($8643,3)

PATCH($9512,3)
        call    $ffb8
ENDPATCH($9512,3)

PATCH($86d9,3)
        call    $ffe2
ENDPATCH($86d9,3)

PATCH($86fd,3)
        call    $ffdf
ENDPATCH($86fd,3)

PATCH($8709,3)
        call    $ffe2
ENDPATCH($8709,3)

PATCH($872d,3)
        call    $ffdf
ENDPATCH($872d,3)

PATCH($8739,3)
        call    $ffe2
ENDPATCH($8739,3)

PATCH($8760,3)
        call    $ffdf
ENDPATCH($8760,3)

PATCH($876c,3)
        call    $ffe2
ENDPATCH($876c,3)

PATCH($8793,3)
        call    $ffdf
ENDPATCH($8793,3)

PATCH($879f,3)
        call    $ffe2
ENDPATCH($879f,3)

PATCH($87c0,3)
        call    $ffdf
ENDPATCH($87c0,3)

PATCH($87cc,3)
        call    $ffe2
ENDPATCH($87cc,3)

PATCH($87ed,3)
        call    $ffdf
ENDPATCH($87ed,3)

PATCH($8a25,3)
        call    $fffd
ENDPATCH($8a25,3)

PATCH($9b7f,3)
        call    $ffe2
ENDPATCH($9b7f,3)

PATCH($9630,3)
        call    $fff1
ENDPATCH($9630,3)

PATCH($8888,3)
        call    $ffe2
ENDPATCH($8888,3)

PATCH($894c,3)
        call    $fffa
ENDPATCH($894c,3)

PATCH($8952,3)
        call    $fff1
ENDPATCH($8952,3)

PATCH($8957,3)
        call    $fff1
ENDPATCH($8957,3)

PATCH($895c,3)
        call    $fff1
ENDPATCH($895c,3)

PATCH($a6d4,3)
        jp		$fffa
ENDPATCH($a6d4,3)

PATCH($ab15,3)
        call    $fffa
ENDPATCH($ab15,3)

PATCH($aa70,3)
        call    $ffcd
ENDPATCH($aa70,3)

PATCH($a955,3)
        call    $ffd0
ENDPATCH($a955,3)

PATCH($9b98,3)
        jp		$fffa
ENDPATCH($9b98,3)

PATCH($9bd4,3)
        call    $fff1
ENDPATCH($9bd4,3)

PATCH($9bd9,3)
        call    $fff1
ENDPATCH($9bd9,3)

PATCH($9c29,3)
        call    $fffa
ENDPATCH($9c29,3)

PATCH($9973,3)
        call    $ffd0
ENDPATCH($9973,3)

PATCH($9a25,3)
        call    $ffd0
ENDPATCH($9a25,3)

PATCH($977a,3)
        call    $fff1
ENDPATCH($977a,3)

PATCH($977f,3)
        call    $fff1
ENDPATCH($977f,3)

PATCH($999d,3)
        call    $fff1
ENDPATCH($999d,3)

PATCH($99a2,3)
        call    $fff1
ENDPATCH($99a2,3)

PATCH($99a7,3)
        call    $fff1
ENDPATCH($99a7,3)

PATCH($a579,3)
        call    $fffa
ENDPATCH($a579,3)

PATCH($ab6b,3)
        call    $ffca
ENDPATCH($ab6b,3)

PATCH($aa8d,3)
        call    $ffcd
ENDPATCH($aa8d,3)

PATCH($a976,3)
        call    $ffd0
ENDPATCH($a976,3)

PATCH($a642,3)
        jp		$fffa
ENDPATCH($a642,3)

PATCH($ab4f,3)
        call    $fffa
ENDPATCH($ab4f,3)

PATCH($aaa6,3)
        call    $ffcd
ENDPATCH($aaa6,3)

PATCH($a984,3)
        call    $ffd0
ENDPATCH($a984,3)

PATCH($aac1,3)
        call    $ffcd
ENDPATCH($aac1,3)

PATCH($a9a0,3)
        call    $ffd0
ENDPATCH($a9a0,3)

PATCH($96ea,3)
        call    $fff1
ENDPATCH($96ea,3)

PATCH($a9d6,3)
        call    $ffca
ENDPATCH($a9d6,3)

PATCH($a9de,3)
        call    $ffcd
ENDPATCH($a9de,3)

PATCH($a9e9,3)
        call    $ffd0
ENDPATCH($a9e9,3)

PATCH($aa0a,3)
        call    $fffa
ENDPATCH($aa0a,3)

PATCH($8375,3)
        call    $fffa
ENDPATCH($8375,3)

PATCH($838e,3)
        call    $fffa
ENDPATCH($838e,3)

PATCH($839e,3)
        call    $fffa
ENDPATCH($839e,3)

PATCH($83a5,3)
        call    $fffa
ENDPATCH($83a5,3)

PATCH($83ad,3)
        call    $fff1
ENDPATCH($83ad,3)

PATCH($83b2,3)
        call    $fff1
ENDPATCH($83b2,3)

PATCH($83f3,3)
        call    $ffc7
ENDPATCH($83f3,3)

PATCH($840d,3)
        call    $ff82
ENDPATCH($840d,3)

PATCH($ae83,3)
        call    $ff82
ENDPATCH($ae83,3)

PATCH($ae8a,3)
        call    $fffa
ENDPATCH($ae8a,3)

PATCH($ac3b,3)
        jp		$ff82
ENDPATCH($ac3b,3)

PATCH($b359,3)
        call    $fffa
ENDPATCH($b359,3)

PATCH($b363,3)
        call    $fffa
ENDPATCH($b363,3)

PATCH($aef4,3)
        call    $ffcd
ENDPATCH($aef4,3)

PATCH($af01,3)
        call    $ffcd
ENDPATCH($af01,3)

PATCH($b031,3)
        call    $ffd0
ENDPATCH($b031,3)

PATCH($b03e,3)
        call    $ffd0
ENDPATCH($b03e,3)

PATCH($afc0,3)
        call    $fff1
ENDPATCH($afc0,3)

PATCH($afc5,3)
        call    $fff1
ENDPATCH($afc5,3)

PATCH($afca,3)
        call    $fff1
ENDPATCH($afca,3)

PATCH($afd4,3)
        call    $ffca
ENDPATCH($afd4,3)

PATCH($aff2,3)
        call    $ffcd
ENDPATCH($aff2,3)

PATCH($b07d,3)
        call    $ffd0
ENDPATCH($b07d,3)

PATCH($b097,3)
        call    $ffd0
ENDPATCH($b097,3)

PATCH($b0b1,3)
        call    $ffd0
ENDPATCH($b0b1,3)

PATCH($b0ca,3)
        call    $ffca
ENDPATCH($b0ca,3)

PATCH($b0d0,3)
        call    $ffca
ENDPATCH($b0d0,3)

PATCH($b0e4,3)
        call    $ffcd
ENDPATCH($b0e4,3)

PATCH($b0f1,3)
        call    $ffcd
ENDPATCH($b0f1,3)

PATCH($b04f,3)
        call    $ffd0
ENDPATCH($b04f,3)

PATCH($b05c,3)
        call    $ffd0
ENDPATCH($b05c,3)

PATCH($b10b,3)
        call    $ffd0
ENDPATCH($b10b,3)

PATCH($b125,3)
        call    $ffd0
ENDPATCH($b125,3)

PATCH($b13f,3)
        call    $ffd0
ENDPATCH($b13f,3)

PATCH($b158,3)
        call    $ffca
ENDPATCH($b158,3)

PATCH($b15e,3)
        call    $ffca
ENDPATCH($b15e,3)

PATCH($b172,3)
        call    $ffcd
ENDPATCH($b172,3)

PATCH($b17f,3)
        call    $ffcd
ENDPATCH($b17f,3)

PATCH($b1a2,3)
        call    $ffca
ENDPATCH($b1a2,3)

PATCH($b1a8,3)
        call    $ffca
ENDPATCH($b1a8,3)

PATCH($9df8,3)
        call    $ffe8
ENDPATCH($9df8,3)

PATCH($9dfb,3)
        call    $ffd3
ENDPATCH($9dfb,3)

PATCH($9dfe,3)
        call    $ffdc
ENDPATCH($9dfe,3)

PATCH($842e,3)
        call    $fffa
ENDPATCH($842e,3)

PATCH($843e,3)
        call    $fffa
ENDPATCH($843e,3)

PATCH($844e,3)
        call    $fffa
ENDPATCH($844e,3)

PATCH($845e,3)
        call    $fffa
ENDPATCH($845e,3)

PATCH($8469,3)
        call    $ffcd
ENDPATCH($8469,3)

PATCH($84a7,3)
        call    $ffca
ENDPATCH($84a7,3)

PATCH($84b6,3)
        call    $ffcd
ENDPATCH($84b6,3)

PATCH($847c,3)
        call    $fffa
ENDPATCH($847c,3)

PATCH($8485,3)
        call    $ffd0
ENDPATCH($8485,3)

PATCH($8496,3)
        call    $fffa
ENDPATCH($8496,3)

PATCH($84c6,3)
        call    $ffd0
ENDPATCH($84c6,3)

PATCH($a52b,3)
        call    $ffcd
ENDPATCH($a52b,3)

PATCH($9886,3)
        call    $fffa
ENDPATCH($9886,3)

PATCH($a5ec,3)
        call    $fff1
ENDPATCH($a5ec,3)

PATCH($8285,3)
        call    $ffd0
ENDPATCH($8285,3)

PATCH($a622,3)
        call    $ff61
ENDPATCH($a622,3)

PATCH($a625,3)
        call    $fff4
ENDPATCH($a625,3)

PATCH($a635,3)
        jp    $fffa
ENDPATCH($a635,3)

PATCH($b45a,3)
        call    $ffdf
ENDPATCH($b45a,3)
