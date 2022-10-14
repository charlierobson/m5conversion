.include "..\m5c-defs.inc"

PATCHINIT($8000)

; rogues gallery
;
; PATCH($9894,3) ; should have stayed 6000 as it is a value in a sum
; LD HL,$7000
; ENDPATCH($9894,3)
;
; PATCH($9dd8,3) ; de is a vdp register operand
; LD DE,$7a88
; ENDPATCH($9dd8,3)
;
; PATCH($8117,3)	; overwrites a kp patch
;    LD A,($7002)
; ENDPATCH($8117,3)



pbase = $2100

PATCH($8115,15)
	call	pbase+$00	;jsFix
ENDPATCH($8115,15)

PATCH($8467,10)
	call	pbase+$06	;kp fixup
ENDPATCH($8467,10)

PATCH($813f,7)
	call	CRV_KP2		;kp2 read
ENDPATCH($813f,7)

PATCH($becd,3)
	LD	HL,$f8a3
ENDPATCH($becd,3)

PATCH($bedb,3)
	LD	HL,$f4c3
ENDPATCH($bedb,3)

PATCH($80de,3)	; remove IM change
	di
ENDPATCH($80de,3)

PATCH($80ea,3)	; remove IM change
	ld		bc,$3ff
ENDPATCH($80ea,3)

; mame

PATCH($bb03,2)
    out (IO_PSG),a
ENDPATCH($bb03,2)

PATCH($bb0c,2)
    out (IO_PSG),a
ENDPATCH($bb0c,2)

PATCH($88f8,2)
    in a,(IO_VDP_Addr)
ENDPATCH($88f8,2)

PATCH($85bc,2)
    in a,(IO_VDP_Addr)
ENDPATCH($85bc,2)

PATCH($baaa,2)
    out (IO_PSG),a
ENDPATCH($baaa,2)

PATCH($8525,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8525,2)

PATCH($84de,2)
    out (IO_PSG),a
ENDPATCH($84de,2)

PATCH($b9b2,2)
    in a,(IO_VDP_Addr)
ENDPATCH($b9b2,2)

PATCH($853c,2)
    in a,(IO_VDP_Addr)
ENDPATCH($853c,2)

PATCH($8102,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8102,2)

PATCH($8106,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8106,2)

PATCH($8087,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8087,2)

PATCH($80c8,2)
    in a,(IO_VDP_Addr)
ENDPATCH($80c8,2)

PATCH($beaa,3)
    call $e23b
ENDPATCH($beaa,3)

PATCH($bf30,3)
    call $e80b
ENDPATCH($bf30,3)

PATCH($8502,2)
    in a,(IO_VDP_Addr)
ENDPATCH($8502,2)


; rst 7

PATCH($8a12,1)
	rst		20h
ENDPATCH($8a12,1)

PATCH($8a18,1)
	rst		20h
ENDPATCH($8a18,1)

PATCH($8a23,1)
	rst		20h
ENDPATCH($8a23,1)

PATCH($8a33,1)
	rst		20h
ENDPATCH($8a33,1)

PATCH($8a43,1)
	rst		20h
ENDPATCH($8a43,1)

PATCH($8a52,1)
	rst		20h
ENDPATCH($8a52,1)

PATCH($8a61,1)
	rst		20h
ENDPATCH($8a61,1)

PATCH($8a70,1)
	rst		20h
ENDPATCH($8a70,1)

PATCH($8a7e,1)
	rst		20h
ENDPATCH($8a7e,1)

PATCH($8a8c,1)
	rst		20h
ENDPATCH($8a8c,1)

PATCH($8a99,1)
	rst		20h
ENDPATCH($8a99,1)

PATCH($8aa1,1)
	rst		20h
ENDPATCH($8aa1,1)

PATCH($8aa8,1)
	rst		20h
ENDPATCH($8aa8,1)

PATCH($8aa9,1)
	rst		20h
ENDPATCH($8aa9,1)

PATCH($8abe,1)
	rst		20h
ENDPATCH($8abe,1)

PATCH($8abf,1)
	rst		20h
ENDPATCH($8abf,1)

; mem

PATCH($8073,3)
   LD A,($7000)
ENDPATCH($8073,3)

PATCH($808a,3)
   LD A,($7000)
ENDPATCH($808a,3)

PATCH($8091,3)
   LD A,($7140)
ENDPATCH($8091,3)

PATCH($80a0,3)
   LD A,($7081)
ENDPATCH($80a0,3)

PATCH($80aa,3)
   LD ($70fc),A
ENDPATCH($80aa,3)

PATCH($80c2,3)
   LD ($7005),A
ENDPATCH($80c2,3)

PATCH($80f3,3)
   LD ($7005),A
ENDPATCH($80f3,3)

PATCH($80fb,3)
   LD ($7005),A
ENDPATCH($80fb,3)

PATCH($80ff,3)
   LD ($7000),A
ENDPATCH($80ff,3)

PATCH($8161,3)
   LD A,($7000)
ENDPATCH($8161,3)

PATCH($818d,3)
   LD ($700a),A
ENDPATCH($818d,3)

PATCH($8193,3)
   LD ($700e),HL
ENDPATCH($8193,3)

PATCH($8199,3)
   LD A,($7003)
ENDPATCH($8199,3)

PATCH($81d3,3)
   LD A,($7001)
ENDPATCH($81d3,3)

PATCH($81ea,3)
   LD ($70ee),HL
ENDPATCH($81ea,3)

PATCH($81f0,3)
   LD ($70ec),HL
ENDPATCH($81f0,3)

PATCH($8201,3)
   LD ($7133),A
ENDPATCH($8201,3)

PATCH($8207,3)
   LD HL,($70ee)
ENDPATCH($8207,3)

PATCH($820b,3)
   LD ($70ee),HL
ENDPATCH($820b,3)

PATCH($8211,3)
   LD ($7133),A
ENDPATCH($8211,3)

PATCH($821c,3)
   LD ($7000),A
ENDPATCH($821c,3)

PATCH($8222,3)
   LD A,($7001)
ENDPATCH($8222,3)

PATCH($824e,3)
   LD ($718d),A
ENDPATCH($824e,3)

PATCH($8284,3)
   LD A,($70e8)
ENDPATCH($8284,3)

PATCH($8293,4)
   LD ($70e6),DE
ENDPATCH($8293,4)

PATCH($829a,3)
   LD A,($70e1)
ENDPATCH($829a,3)

PATCH($82b4,4)
   LD ($70e3),DE
ENDPATCH($82b4,4)

PATCH($82c0,3)
   LD ($7000),A
ENDPATCH($82c0,3)

PATCH($82cd,3)
   LD A,($7002)
ENDPATCH($82cd,3)

PATCH($82d9,3)
   LD ($7133),A
ENDPATCH($82d9,3)

PATCH($82df,3)
   LD A,($7002)
ENDPATCH($82df,3)

PATCH($82e9,3)
   LD HL,($700c)
ENDPATCH($82e9,3)

PATCH($82fc,3)
   LD ($7000),A
ENDPATCH($82fc,3)

PATCH($8306,3)
   LD ($700c),A
ENDPATCH($8306,3)

PATCH($8319,3)
   LD ($70e2),A
ENDPATCH($8319,3)

PATCH($832a,3)
   LD A,($7012)
ENDPATCH($832a,3)

PATCH($8337,3)
   LD ($7000),HL
ENDPATCH($8337,3)

PATCH($833b,3)
   LD A,($7001)
ENDPATCH($833b,3)

PATCH($835c,3)
   LD A,($70f9)
ENDPATCH($835c,3)

PATCH($8375,3)
   LD ($70e2),A
ENDPATCH($8375,3)

PATCH($8380,3)
   LD A,($70e3)
ENDPATCH($8380,3)

PATCH($8385,3)
   LD ($700d),A
ENDPATCH($8385,3)

PATCH($8393,3)
   LD A,($7079)
ENDPATCH($8393,3)

PATCH($8399,3)
   LD ($7138),HL
ENDPATCH($8399,3)

PATCH($839e,3)
   LD ($7100),A
ENDPATCH($839e,3)

PATCH($83ac,3)
   LD ($7138),A
ENDPATCH($83ac,3)

PATCH($83b4,3)
   LD A,($7079)
ENDPATCH($83b4,3)

PATCH($83cc,3)
   LD ($7001),A
ENDPATCH($83cc,3)

PATCH($83cf,3)
   LD A,($701a)
ENDPATCH($83cf,3)

PATCH($83d7,3)
   LD A,($70e1)
ENDPATCH($83d7,3)

PATCH($83e1,3)
   LD A,($713a)
ENDPATCH($83e1,3)

PATCH($83f1,3)
   LD A,($713a)
ENDPATCH($83f1,3)

PATCH($83f9,3)
   LD A,($7012)
ENDPATCH($83f9,3)

PATCH($840b,3)
   LD A,($7003)
ENDPATCH($840b,3)

PATCH($8411,3)
   LD HL,($70e3)
ENDPATCH($8411,3)

PATCH($842f,3)
   LD ($7000),A
ENDPATCH($842f,3)

PATCH($8434,3)
   LD ($7004),A
ENDPATCH($8434,3)

PATCH($843c,3)
   LD ($7001),A
ENDPATCH($843c,3)

PATCH($8442,3)
   LD ($7004),A
ENDPATCH($8442,3)

PATCH($844d,3)
   LD A,($7002)
ENDPATCH($844d,3)

PATCH($845c,3)
   LD A,($713b)
ENDPATCH($845c,3)

PATCH($8461,3)
   LD A,($7002)
ENDPATCH($8461,3)

PATCH($8477,3)
   LD ($7133),A
ENDPATCH($8477,3)

PATCH($847c,3)
   LD ($7002),A
ENDPATCH($847c,3)

PATCH($8482,3)
   LD ($7000),A
ENDPATCH($8482,3)

PATCH($8542,3)
   LD ($70df),A
ENDPATCH($8542,3)

PATCH($8555,3)
   LD A,($70df)
ENDPATCH($8555,3)

PATCH($860e,3)
   LD A,($7000)
ENDPATCH($860e,3)

PATCH($863e,3)
   LD A,($7009)
ENDPATCH($863e,3)

PATCH($8642,3)
   LD A,($7008)
ENDPATCH($8642,3)

PATCH($864e,3)
   LD A,($7002)
ENDPATCH($864e,3)

PATCH($866e,4)
   LD ($7040),BC
ENDPATCH($866e,4)

PATCH($8672,4)
   LD ($7041),BC
ENDPATCH($8672,4)

PATCH($8678,3)
   LD A,($7042)
ENDPATCH($8678,3)

PATCH($8681,3)
   LD HL,($7040)
ENDPATCH($8681,3)

PATCH($8688,4)
   LD ($7040),DE
ENDPATCH($8688,4)

PATCH($868d,3)
   LD ($7042),A
ENDPATCH($868d,3)

PATCH($8692,3)
   LD A,($7133)
ENDPATCH($8692,3)

PATCH($8697,3)
   LD HL,($70e3)
ENDPATCH($8697,3)

PATCH($869f,3)
   LD ($700c),A
ENDPATCH($869f,3)

PATCH($86a3,3)
   LD A,($7003)
ENDPATCH($86a3,3)

PATCH($8702,3)
   LD A,($7100)
ENDPATCH($8702,3)

PATCH($8712,3)
   LD ($700d),A
ENDPATCH($8712,3)

PATCH($8731,3)
   LD ($7107),A
ENDPATCH($8731,3)

PATCH($8766,3)
   LD A,($70e0)
ENDPATCH($8766,3)

PATCH($8772,3)
   LD A,($70e6)
ENDPATCH($8772,3)

PATCH($877b,3)
   LD ($718a),A
ENDPATCH($877b,3)

PATCH($877e,3)
   LD A,($70e0)
ENDPATCH($877e,3)

PATCH($878e,3)
   LD A,($70e6)
ENDPATCH($878e,3)

PATCH($87a4,3)
   LD ($718b),HL
ENDPATCH($87a4,3)

PATCH($8820,3)
   LD A,($718e)
ENDPATCH($8820,3)

PATCH($882c,3)
   LD ($718e),A
ENDPATCH($882c,3)

PATCH($8832,3)
   LD A,($70e0)
ENDPATCH($8832,3)

PATCH($883d,4)
   LD DE,($70e5)
ENDPATCH($883d,4)

PATCH($8848,3)
   LD A,($70e0)
ENDPATCH($8848,3)

PATCH($8852,3)
   LD ($718e),A
ENDPATCH($8852,3)

PATCH($8856,3)
   LD ($718f),A
ENDPATCH($8856,3)

PATCH($8873,3)
   LD ($700a),A
ENDPATCH($8873,3)

PATCH($88b1,3)
   LD HL,($700e)
ENDPATCH($88b1,3)

PATCH($88b8,3)
   LD ($700e),HL
ENDPATCH($88b8,3)

PATCH($891b,3)
   LD A,($7001)
ENDPATCH($891b,3)

PATCH($8932,3)
   LD ($70f2),HL
ENDPATCH($8932,3)

PATCH($8938,3)
   LD ($70f0),HL
ENDPATCH($8938,3)

PATCH($8950,3)
   LD A,($7003)
ENDPATCH($8950,3)

PATCH($8955,3)
   LD HL,($70f0)
ENDPATCH($8955,3)

PATCH($895d,3)
   LD ($70f0),HL
ENDPATCH($895d,3)

PATCH($8973,3)
   LD HL,($70f2)
ENDPATCH($8973,3)

PATCH($8983,3)
   LD ($70f2),HL
ENDPATCH($8983,3)

PATCH($89a4,3)
   LD ($70f4),HL
ENDPATCH($89a4,3)

PATCH($89a8,3)
   LD ($70f6),A
ENDPATCH($89a8,3)

PATCH($89ae,3)
   LD A,($7003)
ENDPATCH($89ae,3)

PATCH($89be,3)
   LD ($70d0),A
ENDPATCH($89be,3)

PATCH($89c9,3)
   LD A,($70e7)
ENDPATCH($89c9,3)

PATCH($89df,4)
   LD DE,($70f4)
ENDPATCH($89df,4)

PATCH($89e6,4)
   LD ($70f4),DE
ENDPATCH($89e6,4)

PATCH($8b23,3)
   LD ($7100),HL
ENDPATCH($8b23,3)

PATCH($8b26,3)
   LD ($7110),A
ENDPATCH($8b26,3)

PATCH($8b2b,3)
   LD ($7149),A
ENDPATCH($8b2b,3)

PATCH($8b30,3)
   LD ($70e9),A
ENDPATCH($8b30,3)

PATCH($8b36,3)
   LD A,($70e0)
ENDPATCH($8b36,3)

PATCH($8b3f,3)
   LD ($710e),HL
ENDPATCH($8b3f,3)

PATCH($8b44,3)
   LD ($713b),A
ENDPATCH($8b44,3)

PATCH($8b57,3)
   LD ($713b),A
ENDPATCH($8b57,3)

PATCH($8b61,3)
   LD A,($7140)
ENDPATCH($8b61,3)

PATCH($8b68,3)
   LD A,($7142)
ENDPATCH($8b68,3)

PATCH($8b7e,3)
   LD A,($7140)
ENDPATCH($8b7e,3)

PATCH($8bcc,4)
   LD DE,($7078)
ENDPATCH($8bcc,4)

PATCH($8bfe,3)
   LD ($7078),HL
ENDPATCH($8bfe,3)

PATCH($8c05,3)
   LD ($707c),HL
ENDPATCH($8c05,3)

PATCH($8c0d,4)
   LD ($7080),DE
ENDPATCH($8c0d,4)

PATCH($8c11,3)
   LD ($7084),HL
ENDPATCH($8c11,3)

PATCH($8c1f,3)
   LD A,($70fa)
ENDPATCH($8c1f,3)

PATCH($8c24,3)
   LD ($70fb),A
ENDPATCH($8c24,3)

PATCH($8c29,3)
   LD A,($7003)
ENDPATCH($8c29,3)

PATCH($8c51,4)
   LD DE,($7078)
ENDPATCH($8c51,4)

PATCH($8c65,3)
   LD A,($70f9)
ENDPATCH($8c65,3)

PATCH($8c6d,3)
   LD A,($7140)
ENDPATCH($8c6d,3)

PATCH($8cd7,3)
   LD A,($7130)
ENDPATCH($8cd7,3)

PATCH($8cdc,3)
   LD A,($7003)
ENDPATCH($8cdc,3)

PATCH($8d09,3)
   LD A,($70f9)
ENDPATCH($8d09,3)

PATCH($8d12,3)
   LD A,($7143)
ENDPATCH($8d12,3)

PATCH($8d28,3)
   LD ($70a0),HL
ENDPATCH($8d28,3)

PATCH($8d2b,4)
   LD ($70a4),BC
ENDPATCH($8d2b,4)

PATCH($8d5a,3)
   LD A,($70f9)
ENDPATCH($8d5a,3)

PATCH($8d61,3)
   LD A,($70e0)
ENDPATCH($8d61,3)

PATCH($8d7e,3)
   LD A,($7079)
ENDPATCH($8d7e,3)

PATCH($8da7,3)
   LD A,($70f9)
ENDPATCH($8da7,3)

PATCH($8dc4,3)
   LD A,($7079)
ENDPATCH($8dc4,3)

PATCH($8dd5,3)
   LD ($7132),A
ENDPATCH($8dd5,3)

PATCH($8de3,3)
   LD A,($7142)
ENDPATCH($8de3,3)

PATCH($8deb,4)
   LD DE,($7188)
ENDPATCH($8deb,4)

PATCH($8df3,3)
   LD HL,($7078)
ENDPATCH($8df3,3)

PATCH($8e20,3)
   LD HL,($7090)
ENDPATCH($8e20,3)

PATCH($8e27,3)
   LD A,($7079)
ENDPATCH($8e27,3)

PATCH($8e37,3)
   LD A,($7135)
ENDPATCH($8e37,3)

PATCH($8e44,3)
   LD A,($70fa)
ENDPATCH($8e44,3)

PATCH($8e4e,3)
   LD ($7136),HL
ENDPATCH($8e4e,3)

PATCH($8e59,3)
   LD A,($70f9)
ENDPATCH($8e59,3)

PATCH($8e61,3)
   LD ($7142),HL
ENDPATCH($8e61,3)

PATCH($8e6a,3)
   LD ($7144),A
ENDPATCH($8e6a,3)

PATCH($8e76,3)
   LD ($7100),HL
ENDPATCH($8e76,3)

PATCH($8e7a,3)
   LD A,($7003)
ENDPATCH($8e7a,3)

PATCH($8e93,4)
   LD DE,($7078)
ENDPATCH($8e93,4)

PATCH($8e9a,3)
   LD A,($7144)
ENDPATCH($8e9a,3)

PATCH($8eb6,3)
   LD A,($7078)
ENDPATCH($8eb6,3)

PATCH($8ed2,3)
   LD ($7135),A
ENDPATCH($8ed2,3)

PATCH($8ed9,3)
   LD ($7135),A
ENDPATCH($8ed9,3)

PATCH($8ee6,3)
   LD ($7137),A
ENDPATCH($8ee6,3)

PATCH($8f1e,3)
   LD A,($7144)
ENDPATCH($8f1e,3)

PATCH($8f2d,4)
   LD DE,($7078)
ENDPATCH($8f2d,4)

PATCH($8f42,3)
   LD A,($70f9)
ENDPATCH($8f42,3)

PATCH($8f49,3)
   LD ($7135),A
ENDPATCH($8f49,3)

PATCH($8f50,3)
   LD ($7135),A
ENDPATCH($8f50,3)

PATCH($8f5f,3)
   LD ($7140),HL
ENDPATCH($8f5f,3)

PATCH($8f63,3)
   LD ($7142),A
ENDPATCH($8f63,3)

PATCH($8f68,3)
   LD ($70f8),A
ENDPATCH($8f68,3)

PATCH($8f7e,3)
   LD HL,($7078)
ENDPATCH($8f7e,3)

PATCH($8f8d,3)
   LD ($70a0),A
ENDPATCH($8f8d,3)

PATCH($8f93,3)
   LD ($70a3),HL
ENDPATCH($8f93,3)

PATCH($8fb5,3)
   LD A,($7003)
ENDPATCH($8fb5,3)

PATCH($8fd7,3)
   LD HL,($7078)
ENDPATCH($8fd7,3)

PATCH($8fdf,4)
   LD ($70a1),BC
ENDPATCH($8fdf,4)

PATCH($8fe5,3)
   LD ($70a0),A
ENDPATCH($8fe5,3)

PATCH($8ff4,3)
   LD ($7140),A
ENDPATCH($8ff4,3)

PATCH($8ff7,3)
   LD ($70f8),A
ENDPATCH($8ff7,3)

PATCH($8ffd,3)
   LD ($7100),HL
ENDPATCH($8ffd,3)

PATCH($9000,3)
   LD A,($7079)
ENDPATCH($9000,3)

PATCH($9023,3)
   LD ($70a2),HL
ENDPATCH($9023,3)

PATCH($9055,3)
   LD A,($70e1)
ENDPATCH($9055,3)

PATCH($9066,3)
   LD ($710c),A
ENDPATCH($9066,3)

PATCH($908d,3)
   LD A,($710c)
ENDPATCH($908d,3)

PATCH($90ad,3)
   LD A,($70e1)
ENDPATCH($90ad,3)

PATCH($90b5,3)
   LD ($710a),HL
ENDPATCH($90b5,3)

PATCH($90b9,3)
   LD ($7102),A
ENDPATCH($90b9,3)

PATCH($90bc,3)
   LD ($7108),A
ENDPATCH($90bc,3)

PATCH($90c2,3)
   LD ($7103),HL
ENDPATCH($90c2,3)

PATCH($90c8,3)
   LD ($7105),HL
ENDPATCH($90c8,3)

PATCH($90d7,3)
   LD HL,($710a)
ENDPATCH($90d7,3)

PATCH($90e1,3)
   LD ($7109),A
ENDPATCH($90e1,3)

PATCH($9109,3)
   LD A,($710c)
ENDPATCH($9109,3)

PATCH($911e,4)
   LD ($714e),DE
ENDPATCH($911e,4)

PATCH($9124,3)
   LD ($7170),A
ENDPATCH($9124,3)

PATCH($9138,3)
   LD A,($7102)
ENDPATCH($9138,3)

PATCH($9143,3)
   LD HL,($7103)
ENDPATCH($9143,3)

PATCH($9146,3)
   LD A,($7109)
ENDPATCH($9146,3)

PATCH($914d,3)
   LD HL,($7105)
ENDPATCH($914d,3)

PATCH($919c,3)
   LD HL,($7105)
ENDPATCH($919c,3)

PATCH($919f,3)
   LD A,($7102)
ENDPATCH($919f,3)

PATCH($91cc,3)
   LD A,($70e0)
ENDPATCH($91cc,3)

PATCH($9216,3)
   LD HL,($70e5)
ENDPATCH($9216,3)

PATCH($922e,3)
   LD A,($70e0)
ENDPATCH($922e,3)

PATCH($924c,3)
   LD HL,($718b)
ENDPATCH($924c,3)

PATCH($9271,3)
   LD A,($70fc)
ENDPATCH($9271,3)

PATCH($927c,3)
   LD A,($7190)
ENDPATCH($927c,3)

PATCH($9281,3)
   LD A,($7191)
ENDPATCH($9281,3)

PATCH($92e1,3)
   LD HL,($70e5)
ENDPATCH($92e1,3)

PATCH($9320,3)
   LD A,($7100)
ENDPATCH($9320,3)

PATCH($932e,3)
   LD A,($7194)
ENDPATCH($932e,3)

PATCH($933d,3)
   LD A,($7196)
ENDPATCH($933d,3)

PATCH($9345,3)
   LD A,($7194)
ENDPATCH($9345,3)

PATCH($934b,3)
   LD A,($7150)
ENDPATCH($934b,3)

PATCH($9356,3)
   LD ($716f),A
ENDPATCH($9356,3)

PATCH($935b,3)
   LD A,($716f)
ENDPATCH($935b,3)

PATCH($9366,3)
   LD ($7150),A
ENDPATCH($9366,3)

PATCH($9385,3)
   LD HL,($70e5)
ENDPATCH($9385,3)

PATCH($93ac,3)
   LD A,($7100)
ENDPATCH($93ac,3)

PATCH($93b7,4)
   LD DE,($7078)
ENDPATCH($93b7,4)

PATCH($93bb,3)
   LD A,($7194)
ENDPATCH($93bb,3)

PATCH($94b5,3)
   LD A,($7194)
ENDPATCH($94b5,3)

PATCH($94c5,3)
   LD A,($7003)
ENDPATCH($94c5,3)

PATCH($94ce,3)
   LD A,($7139)
ENDPATCH($94ce,3)

PATCH($94d9,3)
   LD A,($7138)
ENDPATCH($94d9,3)

PATCH($94f4,3)
   LD A,($7078)
ENDPATCH($94f4,3)

PATCH($9508,3)
   LD ($713a),A
ENDPATCH($9508,3)

PATCH($9577,3)
   LD A,($70e1)
ENDPATCH($9577,3)

PATCH($958c,3)
   LD A,($70e0)
ENDPATCH($958c,3)

PATCH($95a0,3)
   LD ($7063),A
ENDPATCH($95a0,3)

PATCH($95a5,3)
   LD ($7067),A
ENDPATCH($95a5,3)

PATCH($95aa,3)
   LD A,($7060)
ENDPATCH($95aa,3)

PATCH($95b2,3)
   LD ($7060),A
ENDPATCH($95b2,3)

PATCH($95b5,3)
   LD ($7064),A
ENDPATCH($95b5,3)

PATCH($95b8,3)
   LD ($7068),A
ENDPATCH($95b8,3)

PATCH($b4f6,3)
   LD HL,($70e5)
ENDPATCH($b4f6,3)

PATCH($b5ea,4)
   LD ($7181),DE
ENDPATCH($b5ea,4)

PATCH($b5ef,3)
   LD A,($718a)
ENDPATCH($b5ef,3)

PATCH($b5f3,3)
   LD A,($7003)
ENDPATCH($b5f3,3)

PATCH($b5f9,3)
   LD A,($7009)
ENDPATCH($b5f9,3)

PATCH($b604,3)
   LD A,($7185)
ENDPATCH($b604,3)

PATCH($b608,3)
   LD ($7185),A
ENDPATCH($b608,3)

PATCH($b633,3)
   LD ($7192),A
ENDPATCH($b633,3)

PATCH($b646,3)
   LD A,($7003)
ENDPATCH($b646,3)

PATCH($b64b,3)
   LD HL,($708c)
ENDPATCH($b64b,3)

PATCH($b64e,3)
   LD ($7188),HL
ENDPATCH($b64e,3)

PATCH($b6a8,3)
   LD A,($7003)
ENDPATCH($b6a8,3)

PATCH($b6be,3)
   LD A,($7100)
ENDPATCH($b6be,3)

PATCH($b6c3,3)
   LD ($7148),A
ENDPATCH($b6c3,3)

PATCH($b6c6,3)
   LD A,($70e6)
ENDPATCH($b6c6,3)

PATCH($b6d2,3)
   LD A,($70e0)
ENDPATCH($b6d2,3)

PATCH($b6e5,3)
   LD A,($7100)
ENDPATCH($b6e5,3)

PATCH($b6f5,3)
   LD ($710e),A
ENDPATCH($b6f5,3)

PATCH($b706,3)
   LD A,($7009)
ENDPATCH($b706,3)

PATCH($b745,3)
   LD A,($7140)
ENDPATCH($b745,3)

PATCH($b751,3)
   LD A,($7100)
ENDPATCH($b751,3)

PATCH($b780,3)
   LD A,($7002)
ENDPATCH($b780,3)

PATCH($b7ba,3)
   LD A,($7148)
ENDPATCH($b7ba,3)

PATCH($b81d,3)
   LD A,($7183)
ENDPATCH($b81d,3)

PATCH($b823,3)
   LD HL,($7181)
ENDPATCH($b823,3)

PATCH($b861,3)
   LD A,($7183)
ENDPATCH($b861,3)

PATCH($b885,3)
   LD A,($7192)
ENDPATCH($b885,3)

PATCH($8a0c,3)
   LD ($7000),A
ENDPATCH($8a0c,3)

PATCH($8cfa,3)
   LD HL,($7078)
ENDPATCH($8cfa,3)

PATCH($91ac,3)
   LD HL,($7103)
ENDPATCH($91ac,3)

; -------------------------------------------------------
; -------------------------------------------------------
; -------------------------------------------------------

PATCH($80e1,3)
   LD SP,$7400
ENDPATCH($80e1,3)

PATCH($807c,3)
   LD HL,$7005
ENDPATCH($807c,3)

PATCH($8094,3)
   LD HL,$7142
ENDPATCH($8094,3)

PATCH($80e4,3)
   LD HL,$7000
ENDPATCH($80e4,3)

PATCH($80e7,3)
   LD DE,$7001
ENDPATCH($80e7,3)

PATCH($814b,3)
   LD HL,$7009
ENDPATCH($814b,3)

PATCH($815a,3)
   LD HL,$7003
ENDPATCH($815a,3)

PATCH($81ab,3)
   LD HL,$7004
ENDPATCH($81ab,3)

PATCH($81c4,3)
   LD HL,$7004
ENDPATCH($81c4,3)

PATCH($81e2,3)
   LD HL,$7002
ENDPATCH($81e2,3)

PATCH($8254,3)
   LD HL,$7003
ENDPATCH($8254,3)

PATCH($8272,3)
   LD HL,$718d
ENDPATCH($8272,3)

PATCH($829d,3)
   LD HL,$70d5
ENDPATCH($829d,3)

PATCH($82f0,3)
   LD HL,$7133
ENDPATCH($82f0,3)

PATCH($8309,3)
   LD HL,$70b8
ENDPATCH($8309,3)

PATCH($832f,3)
   LD HL,$7002
ENDPATCH($832f,3)

PATCH($8351,3)
   LD HL,$70f9
ENDPATCH($8351,3)

PATCH($8364,3)
   LD HL,$70e0
ENDPATCH($8364,3)

PATCH($837a,3)
   LD HL,$70d5
ENDPATCH($837a,3)

PATCH($8388,3)
   LD HL,$70e8
ENDPATCH($8388,3)

PATCH($8402,3)
   LD HL,$7004
ENDPATCH($8402,3)

PATCH($8437,3)
   LD HL,$7000
ENDPATCH($8437,3)

PATCH($8445,3)
   LD HL,$7001
ENDPATCH($8445,3)

PATCH($8489,3)
   LD HL,$7043
ENDPATCH($8489,3)

PATCH($848c,3)
   LD DE,$7044
ENDPATCH($848c,3)

PATCH($8499,3)
   LD DE,$70e0
ENDPATCH($8499,3)

PATCH($84ae,3)
   LD HL,$70d5
ENDPATCH($84ae,3)

PATCH($84ec,3)
   LD DE,$7038
ENDPATCH($84ec,3)

PATCH($84f4,3)
   LD HL,$7038
ENDPATCH($84f4,3)

PATCH($85f8,3)
   LD HL,$7004
ENDPATCH($85f8,3)

PATCH($8628,3)
   LD HL,$7050
ENDPATCH($8628,3)

PATCH($8653,3)
   LD HL,$7043
ENDPATCH($8653,3)

PATCH($86ab,3)
   LD HL,$70e3
ENDPATCH($86ab,3)

PATCH($86d5,3)
   LD HL,$70e4
ENDPATCH($86d5,3)

PATCH($86ea,3)
   LD HL,$7042
ENDPATCH($86ea,3)

PATCH($86f6,3)
   LD HL,$7045
ENDPATCH($86f6,3)

PATCH($86fd,3)
   LD HL,$70e9
ENDPATCH($86fd,3)

PATCH($8709,3)
   LD HL,$70e6
ENDPATCH($8709,3)

PATCH($873c,3)
   LD HL,$70e6
ENDPATCH($873c,3)

PATCH($8744,3)
   LD HL,$70e0
ENDPATCH($8744,3)

PATCH($8825,3)
   LD HL,$718f
ENDPATCH($8825,3)

PATCH($887f,3)
   LD HL,$700a
ENDPATCH($887f,3)

PATCH($88e6,3)
   LD HL,$700a
ENDPATCH($88e6,3)

PATCH($89b3,3)
   LD HL,$70f6
ENDPATCH($89b3,3)

PATCH($89d1,3)
   LD HL,$70d0
ENDPATCH($89d1,3)

PATCH($8b12,3)
   LD HL,$70f0
ENDPATCH($8b12,3)

PATCH($8b15,3)
   LD DE,$70f1
ENDPATCH($8b15,3)

PATCH($8bbd,3)
   LD HL,$70f9
ENDPATCH($8bbd,3)

PATCH($8bd7,3)
   LD HL,$7078
ENDPATCH($8bd7,3)

PATCH($8bed,3)
   LD DE,$707a
ENDPATCH($8bed,3)

PATCH($8c57,3)
   LD HL,$70fb
ENDPATCH($8c57,3)

PATCH($8c70,3)
   LD HL,$7142
ENDPATCH($8c70,3)

PATCH($8c75,3)
   LD HL,$7132
ENDPATCH($8c75,3)

PATCH($8ca0,3)
   LD HL,$70fa
ENDPATCH($8ca0,3)

PATCH($8cd4,3)
   LD HL,$70f9
ENDPATCH($8cd4,3)

PATCH($8ce2,3)
   LD HL,$70f8
ENDPATCH($8ce2,3)

PATCH($8d2f,3)
   LD HL,$70a0
ENDPATCH($8d2f,3)

PATCH($8d69,3)
   LD HL,$7112
ENDPATCH($8d69,3)

PATCH($8dae,3)
   LD HL,$7112
ENDPATCH($8dae,3)

PATCH($8de6,3)
   LD HL,$7140
ENDPATCH($8de6,3)

PATCH($8e0e,3)
   LD HL,$708c
ENDPATCH($8e0e,3)

PATCH($8e11,3)
   LD DE,$7183
ENDPATCH($8e11,3)

PATCH($8e80,3)
   LD HL,$7142
ENDPATCH($8e80,3)

PATCH($8e97,3)
   LD HL,$70d0
ENDPATCH($8e97,3)

PATCH($8ea5,3)
   LD HL,$7142
ENDPATCH($8ea5,3)

PATCH($8eca,3)
   LD HL,$7136
ENDPATCH($8eca,3)

PATCH($8edc,3)
   LD HL,$7143
ENDPATCH($8edc,3)

PATCH($8f12,3)
   LD HL,$70f9
ENDPATCH($8f12,3)

PATCH($8f35,3)
   LD HL,$70d0
ENDPATCH($8f35,3)

PATCH($8f70,3)
   LD HL,$7068
ENDPATCH($8f70,3)

PATCH($8f96,3)
   LD HL,$7068
ENDPATCH($8f96,3)

PATCH($8fa5,3)
   LD HL,$7141
ENDPATCH($8fa5,3)

PATCH($9007,3)
   LD DE,$7068
ENDPATCH($9007,3)

PATCH($9039,3)
   LD DE,$71a0
ENDPATCH($9039,3)

PATCH($9048,3)
   LD HL,$71a0
ENDPATCH($9048,3)

PATCH($90d2,3)
   LD HL,$7108
ENDPATCH($90d2,3)

PATCH($90e4,3)
   LD BC,$7103
ENDPATCH($90e4,3)

PATCH($9127,3)
   LD HL,$714e
ENDPATCH($9127,3)

PATCH($9132,3)
   LD HL,$7107
ENDPATCH($9132,3)

PATCH($918b,3)
   LD HL,$7100
ENDPATCH($918b,3)

PATCH($91a5,3)
   LD HL,$7102
ENDPATCH($91a5,3)

PATCH($91c6,3)
   LD HL,$7112
ENDPATCH($91c6,3)

PATCH($9221,3)
   LD HL,$710e
ENDPATCH($9221,3)

PATCH($9229,3)
   LD HL,$7112
ENDPATCH($9229,3)

PATCH($9245,3)
   LD HL,$7111
ENDPATCH($9245,3)

PATCH($9261,3)
   LD HL,$7190
ENDPATCH($9261,3)

PATCH($9288,3)
   LD HL,$712a
ENDPATCH($9288,3)

PATCH($9294,3)
   LD HL,$7190
ENDPATCH($9294,3)

PATCH($92ec,3)
   LD HL,$70e2
ENDPATCH($92ec,3)

PATCH($930e,3)
   LD HL,$7194
ENDPATCH($930e,3)

PATCH($934e,3)
   LD HL,$7151
ENDPATCH($934e,3)

PATCH($9351,3)
   LD DE,$7150
ENDPATCH($9351,3)

PATCH($935e,3)
   LD HL,$716e
ENDPATCH($935e,3)

PATCH($9361,3)
   LD DE,$716f
ENDPATCH($9361,3)

PATCH($936c,3)
   LD HL,$7197
ENDPATCH($936c,3)

PATCH($9390,3)
   LD HL,$7197
ENDPATCH($9390,3)

PATCH($93a2,3)
   LD HL,$7196
ENDPATCH($93a2,3)

PATCH($93b4,3)
   LD HL,$70d1
ENDPATCH($93b4,3)

PATCH($94ff,3)
   LD HL,$7138
ENDPATCH($94ff,3)

PATCH($950b,3)
   LD HL,$713a
ENDPATCH($950b,3)

PATCH($9526,3)
  LD DE,$706c
ENDPATCH($9526,3)

PATCH($95bb,3)
   LD HL,$7060
ENDPATCH($95bb,3)

PATCH($a6a8,3)
   LD HL,$7050
ENDPATCH($a6a8,3)

PATCH($a6c0,3)
   LD HL,$7050
ENDPATCH($a6c0,3)

PATCH($b5ca,3)
   LD HL,$7183
ENDPATCH($b5ca,3)

PATCH($b5d1,3)
   LD DE,$7113
ENDPATCH($b5d1,3)

PATCH($b618,3)
   LD HL,$708c
ENDPATCH($b618,3)

PATCH($b651,3)
   LD HL,$708c
ENDPATCH($b651,3)

PATCH($b65d,3)
   LD DE,$7183
ENDPATCH($b65d,3)

PATCH($b664,3)
   LD HL,$708e
ENDPATCH($b664,3)

PATCH($b676,3)
   LD HL,$7184
ENDPATCH($b676,3)

PATCH($b716,3)
   LD HL,$70fd
ENDPATCH($b716,3)

PATCH($b725,3)
   LD HL,$7100
ENDPATCH($b725,3)

PATCH($b748,3)
   LD HL,$7142
ENDPATCH($b748,3)

PATCH($b74c,3)
   LD HL,$7171
ENDPATCH($b74c,3)

PATCH($b774,3)
   LD HL,$7171
ENDPATCH($b774,3)

PATCH($b788,3)
   LD DE,$70b8
ENDPATCH($b788,3)

PATCH($b78b,3)
   LD HL,$714a
ENDPATCH($b78b,3)

PATCH($b7b5,3)
   LD HL,$7149
ENDPATCH($b7b5,3)

PATCH($b7c0,3)
   LD HL,$714a
ENDPATCH($b7c0,3)

PATCH($b7c3,3)
   LD DE,$70b8
ENDPATCH($b7c3,3)

PATCH($b805,3)
   LD HL,$70b8
ENDPATCH($b805,3)

PATCH($b827,3)
   LD HL,$7183
ENDPATCH($b827,3)

PATCH($b84a,3)
   LD HL,$7137
ENDPATCH($b84a,3)

PATCH($b851,3)
   LD HL,$7192
ENDPATCH($b851,3)

PATCH($b872,3)
   LD DE,$7090
ENDPATCH($b872,3)

PATCH($b891,3)
   LD HL,$7050
ENDPATCH($b891,3)

PATCH($b9b8,3)
   LD HL,$7012
ENDPATCH($b9b8,3)

PATCH($b9c7,3)
   LD HL,$7026
ENDPATCH($b9c7,3)

PATCH($ba11,4)
   LD IX,$7010
ENDPATCH($ba11,4)

PATCH($910f,2)
   LD D,$71
ENDPATCH($910f,2)

PATCH($8a05,3)
   LD HL,$7004
ENDPATCH($8a05,3)



PATCH($bec4,3)
   call $ff82
ENDPATCH($bec4,3)

PATCH($bec7,3)
   call $ff85
ENDPATCH($bec7,3)

PATCH($beca,3)
   call $ff7f
ENDPATCH($beca,3)

PATCH($beef,3)
   call $ffbe
ENDPATCH($beef,3)

PATCH($bf24,3)
   call $ffbe
ENDPATCH($bf24,3)

PATCH($beb4,3)
   call $ffd9
ENDPATCH($beb4,3)

PATCH($890b,2)
   out ($11),a
ENDPATCH($890b,2)

PATCH($890e,2)
   out ($11),a
ENDPATCH($890e,2)

PATCH($8533,2)
   out ($10),a
ENDPATCH($8533,2)

PATCH($851b,2)
   out ($10),a
ENDPATCH($851b,2)

PATCH($88f4,2)
   out ($10),a
ENDPATCH($88f4,2)

PATCH($85a6,2)
   out ($10),a
ENDPATCH($85a6,2)

PATCH($85b4,2)
   out ($10),a
ENDPATCH($85b4,2)

PATCH($899c,2)
   out ($10),a
ENDPATCH($899c,2)

PATCH($8588,2)
   out ($10),a
ENDPATCH($8588,2)
