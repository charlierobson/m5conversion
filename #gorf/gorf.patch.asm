	.word	$8000

; patch macros.
; any unspecified bytes at the end of the block will be filled with 0/NOP
;
.define PATCH(x, n)		.relocate x - 4 \ .word x \ .byte n \ .byte (n ^ $ff) \ .endrelocate \ .relocate x
.define ENDPATCH(x, n)	.ds n - ($-x) \ .if ($-x) > n \ .fail "invalid patch, too big: ",($-x)," > ",n \ .endif \ .endrelocate

BIOS_BASE = $E000

IO_VDP_Data	= $10		; VDP data port
IO_VDP_Addr	= $11		; VDP VRAM address output port

; delete IM
PATCH($805b,2)
ENDPATCH($805b,2)

; rst 1
PATCH($815e,1)
   RST 20h
ENDPATCH($815e,1)

PATCH($8172,1)
   RST 20h
ENDPATCH($8172,1)

PATCH($824d,1)
   RST 20h
ENDPATCH($824d,1)

PATCH($8287,1)
   RST 20h
ENDPATCH($8287,1)

PATCH($82b0,1)
   RST 20h
ENDPATCH($82b0,1)

PATCH($82ca,1)
   RST 20h
ENDPATCH($82ca,1)

PATCH($830c,1)
   RST 20h
ENDPATCH($830c,1)

PATCH($8365,1)
   RST 20h
ENDPATCH($8365,1)

PATCH($8398,1)
   RST 20h
ENDPATCH($8398,1)

PATCH($83df,1)
   RST 20h
ENDPATCH($83df,1)

PATCH($83fa,1)
   RST 20h
ENDPATCH($83fa,1)

PATCH($8431,1)
   RST 20h
ENDPATCH($8431,1)

PATCH($8504,1)
   RST 20h
ENDPATCH($8504,1)

PATCH($850e,1)
   RST 20h
ENDPATCH($850e,1)

PATCH($8518,1)
   RST 20h
ENDPATCH($8518,1)

PATCH($85f5,1)
   RST 20h
ENDPATCH($85f5,1)

PATCH($868f,1)
   RST 20h
ENDPATCH($868f,1)

PATCH($8699,1)
   RST 20h
ENDPATCH($8699,1)

PATCH($86a3,1)
   RST 20h
ENDPATCH($86a3,1)

PATCH($86d9,1)
   RST 20h
ENDPATCH($86d9,1)

PATCH($88b1,1)
   RST 20h
ENDPATCH($88b1,1)

PATCH($88bb,1)
   RST 20h
ENDPATCH($88bb,1)

PATCH($88d7,1)
   RST 20h
ENDPATCH($88d7,1)

PATCH($88e1,1)
   RST 20h
ENDPATCH($88e1,1)

PATCH($88eb,1)
   RST 20h
ENDPATCH($88eb,1)

PATCH($891d,1)
   RST 20h
ENDPATCH($891d,1)

PATCH($8939,1)
   RST 20h
ENDPATCH($8939,1)

PATCH($898a,1)
   RST 20h
ENDPATCH($898a,1)

PATCH($89a3,1)
   RST 20h
ENDPATCH($89a3,1)

PATCH($8b31,1)
   RST 20h
ENDPATCH($8b31,1)

PATCH($8c7d,1)
   RST 20h
ENDPATCH($8c7d,1)

PATCH($9215,1)
   RST 20h
ENDPATCH($9215,1)

PATCH($94f1,1)
   RST 20h
ENDPATCH($94f1,1)

PATCH($9506,1)
   RST 20h
ENDPATCH($9506,1)

PATCH($a549,1)
   RST 20h
ENDPATCH($a549,1)

PATCH($a577,1)
   RST 20h
ENDPATCH($a577,1)

PATCH($a58b,1)
   RST 20h
ENDPATCH($a58b,1)

PATCH($a79f,1)
   RST 20h
ENDPATCH($a79f,1)

PATCH($a7a8,1)
   RST 20h
ENDPATCH($a7a8,1)

PATCH($a946,1)
   RST 20h
ENDPATCH($a946,1)

PATCH($a988,1)
   RST 20h
ENDPATCH($a988,1)

PATCH($ac16,1)
   RST 20h
ENDPATCH($ac16,1)

PATCH($ad7c,1)
   RST 20h
ENDPATCH($ad7c,1)

PATCH($af9b,1)
   RST 20h
ENDPATCH($af9b,1)

PATCH($afa5,1)
   RST 20h
ENDPATCH($afa5,1)

PATCH($afaf,1)
   RST 20h
ENDPATCH($afaf,1)

PATCH($afb9,1)
   RST 20h
ENDPATCH($afb9,1)

PATCH($afc3,1)
   RST 20h
ENDPATCH($afc3,1)

PATCH($afcd,1)
   RST 20h
ENDPATCH($afcd,1)

PATCH($afd7,1)
   RST 20h
ENDPATCH($afd7,1)

PATCH($afe1,1)
   RST 20h
ENDPATCH($afe1,1)

PATCH($afeb,1)
   RST 20h
ENDPATCH($afeb,1)

PATCH($aff8,1)
   RST 20h
ENDPATCH($aff8,1)

PATCH($b009,1)
   RST 20h
ENDPATCH($b009,1)

PATCH($b181,1)
   RST 20h
ENDPATCH($b181,1)

PATCH($b18b,1)
   RST 20h
ENDPATCH($b18b,1)

PATCH($b195,1)
   RST 20h
ENDPATCH($b195,1)

PATCH($b19f,1)
   RST 20h
ENDPATCH($b19f,1)

PATCH($b1a9,1)
   RST 20h
ENDPATCH($b1a9,1)

PATCH($b1b3,1)
   RST 20h
ENDPATCH($b1b3,1)

PATCH($b1bd,1)
   RST 20h
ENDPATCH($b1bd,1)

PATCH($b1c7,1)
   RST 20h
ENDPATCH($b1c7,1)

PATCH($b345,1)
   RST 20h
ENDPATCH($b345,1)

PATCH($b357,1)
   RST 20h
ENDPATCH($b357,1)

PATCH($b45a,1)
   RST 20h
ENDPATCH($b45a,1)

PATCH($b47b,1)
   RST 20h
ENDPATCH($b47b,1)

PATCH($b7f1,1)
   RST 20h
ENDPATCH($b7f1,1)

PATCH($b912,1)
   RST 20h
ENDPATCH($b912,1)

; rst 2
PATCH($81de,1)
   RST 28h
ENDPATCH($81de,1)

PATCH($87d5,1)
   RST 28h
ENDPATCH($87d5,1)

PATCH($8a61,1)
   RST 28h
ENDPATCH($8a61,1)

PATCH($8b7b,1)
   RST 28h
ENDPATCH($8b7b,1)

PATCH($8c35,1)
   RST 28h
ENDPATCH($8c35,1)

PATCH($8c82,1)
   RST 28h
ENDPATCH($8c82,1)

PATCH($8c95,1)
   RST 28h
ENDPATCH($8c95,1)

PATCH($8d1d,1)
   RST 28h
ENDPATCH($8d1d,1)

PATCH($8dbe,1)
   RST 28h
ENDPATCH($8dbe,1)

PATCH($8dcc,1)
   RST 28h
ENDPATCH($8dcc,1)

PATCH($8fe9,1)
   RST 28h
ENDPATCH($8fe9,1)

PATCH($93f7,1)
   RST 28h
ENDPATCH($93f7,1)

PATCH($a011,1)
   RST 28h
ENDPATCH($a011,1)

PATCH($a101,1)
   RST 28h
ENDPATCH($a101,1)

PATCH($a15e,1)
   RST 28h
ENDPATCH($a15e,1)

PATCH($a169,1)
   RST 28h
ENDPATCH($a169,1)

PATCH($a196,1)
   RST 28h
ENDPATCH($a196,1)

PATCH($a403,1)
   RST 28h
ENDPATCH($a403,1)

PATCH($a641,1)
   RST 28h
ENDPATCH($a641,1)

PATCH($a7ed,1)
   RST 28h
ENDPATCH($a7ed,1)

PATCH($a8a2,1)
   RST 28h
ENDPATCH($a8a2,1)

PATCH($a8bc,1)
   RST 28h
ENDPATCH($a8bc,1)

PATCH($a99e,1)
   RST 28h
ENDPATCH($a99e,1)

PATCH($aa1d,1)
   RST 28h
ENDPATCH($aa1d,1)

PATCH($ab41,1)
   RST 28h
ENDPATCH($ab41,1)

PATCH($abd2,1)
   RST 28h
ENDPATCH($abd2,1)

PATCH($b38e,1)
   RST 28h
ENDPATCH($b38e,1)

PATCH($b4bb,1)
   RST 28h
ENDPATCH($b4bb,1)

PATCH($b682,1)
   RST 28h
ENDPATCH($b682,1)

PATCH($b7bd,1)
   RST 28h
ENDPATCH($b7bd,1)

PATCH($ba03,1)
   RST 28h
ENDPATCH($ba03,1)


; rst 3

rst3base = $2100

.define rst3j(x) jp rst3base+(x*5)

PATCH($badf,3)
	rst3j(3)
ENDPATCH($badf,3)

PATCH($bae2,3)
	rst3j(4)
ENDPATCH($bae2,3)

PATCH($baf6,3)
	rst3j(5)
ENDPATCH($baf6,3)

PATCH($baf9,3)
	rst3j(6)
ENDPATCH($baf9,3)

PATCH($bafd,3)
	rst3j(7)
ENDPATCH($bafd,3)

PATCH($bb00,3)
	rst3j(8)
ENDPATCH($bb00,3)

PATCH($bb03,3)
	rst3j(9)
ENDPATCH($bb03,3)

PATCH($bb06,3)
	rst3j($a)
ENDPATCH($bb06,3)

PATCH($bb0b,3)
	rst3j($b)
ENDPATCH($bb0b,3)

PATCH($bb0d,3)
	rst3j($d)
ENDPATCH($bb0d,3)

PATCH($bb10,3)
	rst3j($f)
ENDPATCH($bb10,3)

PATCH($bb1c,3)
	rst3j($c)
ENDPATCH($bb1c,3)

PATCH($bb1f,3)
	rst3j($e)
ENDPATCH($bb1f,3)

PATCH($bb22,3)
	rst3j($10)
ENDPATCH($bb22,3)

PATCH($bb26,3)
	rst3j($1)
ENDPATCH($bb26,3)

PATCH($bb29,3)
	rst3j($2)
ENDPATCH($bb29,3)

PATCH($bb30,3)
	rst3j($11)
ENDPATCH($bb30,3)

PATCH($bb33,3)
	rst3j($12)
ENDPATCH($bb33,3)

PATCH($bb36,3)
	rst3j($13)
ENDPATCH($bb36,3)

PATCH($bb3a,3)
	rst3j($14)
ENDPATCH($bb3a,3)

PATCH($bb3d,3)
	rst3j($15)
ENDPATCH($bb3d,3)

PATCH($bb40,3)
	rst3j($16)
ENDPATCH($bb40,3)

PATCH($bb44,3)
	rst3j($18)
ENDPATCH($bb44,3)

PATCH($bb47,3)
	rst3j($19)
ENDPATCH($bb47,3)

PATCH($bb4a,3)
	rst3j($1a)
ENDPATCH($bb4a,3)

PATCH($bb4e,3)
	rst3j($1d)
ENDPATCH($bb4e,3)

PATCH($bb51,3)
	rst3j($1e)
ENDPATCH($bb51,3)

PATCH($bb54,3)
	rst3j($1f)
ENDPATCH($bb54,3)

PATCH($bb58,3)
	rst3j($17)
ENDPATCH($bb58,3)

PATCH($bb5b,3)
	rst3j($1b)
ENDPATCH($bb5b,3)

PATCH($bb5e,3)
	rst3j($1c)
ENDPATCH($bb5e,3)


; rst 4

rst4base = $2100

PATCH($8955,4)
	call	rst4base+$a0	;rst4._1
ENDPATCH($8955,4)

PATCH($8968,4)
	call	rst4base+$a7	;rst4._2
ENDPATCH($8968,4)

PATCH($89bd,4)
	call	rst4base+$ad	;rst4._3
ENDPATCH($89bd,4)

PATCH($8da0,5)
	call	rst4base+$b4	;rst4._4
ENDPATCH($8da0,5)

PATCH($8df2,3)
	call	rst4base+$bd	;rst4._5
ENDPATCH($8df2,3)

PATCH($8ea7,5)
	call	rst4base+$c3	;rst4._6
ENDPATCH($8ea7,5)

PATCH($9447,4)
	call	rst4base+$cc	;rst4._7
ENDPATCH($9447,4)

PATCH($a363,3)
	call	rst4base+$d2	;rst4._8
ENDPATCH($a363,3)

PATCH($a3de,4)
	call	rst4base+$d8	;rst4._9
ENDPATCH($a3de,4)

PATCH($b600,4)
	call	rst4base+$df	;rst4._10
ENDPATCH($b600,4)

PATCH($ba11,3)
	call	rst4base+$e6	;rst4._11
ENDPATCH($ba11,3)


; rst 5

rst5base = $2100

PATCH($807a,5)
	call	rst5base+$ec	;rst5._1
ENDPATCH($807a,5)

PATCH($80c0,4)
	call	rst5base+$f4	;rst5._2
ENDPATCH($80c0,4)

PATCH($81d8,3)
	call	rst5base+$fa	1;rst5._3
ENDPATCH($81d8,3)

PATCH($84a8,4)
	call	rst5base+$100	;rst5._4
ENDPATCH($84a8,4)

PATCH($87b1,4)
	call	rst5base+$106	;rst5._5
ENDPATCH($87b1,4)

PATCH($a6b3,4)
	call	rst5base+$106	;rst5._5
ENDPATCH($a6b3,4)

PATCH($a6b3,4)
	call	rst5base+$106	;rst5._5
ENDPATCH($a6b3,4)

PATCH($a6b3,4)
	call	rst5base+$10c	;rst5._6
ENDPATCH($a6b3,4)
