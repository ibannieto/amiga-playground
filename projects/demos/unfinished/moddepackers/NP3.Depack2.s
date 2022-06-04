WORKSPACE	= $180000
;	AUTO	J\WB\A0\A1\

;-------------------;

Convert	bsr.b	np_FndL
	move.l	WrkSpce(pc),a0
	move.l	WrkSize(pc),d0
	subq.l	#1,d0
	moveq	#0,d1
.1	move.b	d1,(a0)+
	dbf	d0,.1
	bsr.b	np_Conv

	move.l	WrkSpce(pc),a0
	move.l	a0,a1
	add.l	WrkSize(pc),a1
	rts

;-------------------;

np_FndL	bsr.w	np_FndO
	move.l	np_Pos(pc),a0
	move.l	np_Trck(pc),a1
	moveq	#0,d7
.1	move.w	(a0)+,d1
	cmp.w	d7,d1
	ble.b	.2
	move.w	d1,d7
.2	cmp.l	a0,a1
	bne.b	.1
	addq.w	#8,d7
	lsl.l	#7,d7

	move.l	Module(pc),a0
	lea	8(a0),a0
	move.l	np_Pos(pc),a1
	subq.l	#4,a1
.3	moveq	#0,d0
	move.w	6(a0),d0
	lsl.l	#1,d0
	add.l	d0,d7
	lea	16(a0),a0
	cmp.l	a0,a1
	bne.b	.3
	add.l	#1084,d7
	move.l	d7,WrkSize
	rts

;-------------------;

np_Conv	bsr.w	np_FndO
	moveq	#0,d0
	move.l	WrkSpce(pc),a1
	lea	42(a1),a1
	move.l	np_Pos(pc),a2
	subq.l	#4,a2
.1	move.w	(a0),2(a1)
	move.w	6(a0),(a1)
	move.w	14(a0),4(a1)
	move.w	12(a0),6(a1)
	lea	16(a0),a0
	lea	30(a1),a1
	cmp.l	a0,a2
	bne.b	.1

	move.l	np_Pos(pc),a0
	move.l	np_Trck(pc),a2
	move.l	WrkSpce(pc),a1
	lea	950(a1),a1

	move.l	a2,d0
	sub.l	a0,d0
	lsr.w	#1,d0
	move.b	d0,(a1)+
	move.b	#127,(a1)+
.2	move.w	(a0)+,d0
	lsr.w	#3,d0
	move.b	d0,(a1)+
	cmp.l	a0,a2
	bne.b	.2

	move.l	a2,a0
	move.l	WrkSpce(pc),a1
	lea	1080(a1),a1
	move.l	#"M.K.",(a1)+

	move.l	np_Trck(pc),a0
	move.l	a1,a3
	move.l	np_PDat(pc),a2
	moveq	#12,d6
	moveq	#0,d5

.3	cmp.l	a0,a2
	beq.w	.16
	moveq	#0,d0
	move.w	(a0)+,d0
	lea	(a2,d0),a4
	lea	(a3,d5),a1
	lea	(a1,d6),a1

	moveq	#63,d7
	bsr.b	.4

	subq.b	#4,d6
	bpl.b	.3
	moveq	#12,d6
	add.l	#1024,d5
	bra.b	.3

.4	tst.b	d7
	bpl.b	.5
	rts
.5	tst.b	(a4)
	bpl.b	.7
	moveq	#0,d0
	move.b	(a4)+,d0
	neg.b	d0
	sub.b	d0,d7
	subq.b	#1,d0
.6	lea	16(a1),a1
	dbf	d0,.6
	bra.b	.4

.7	moveq	#0,d2
	move.b	1(a4),d2
	and.b	#$f,d2
	cmp.b	#$e,d2
	beq.w	.10
	cmp.b	#$d,d2
	beq.w	.11
	cmp.b	#$b,d2
	beq.w	.12
	cmp.b	#8,d2
	beq.w	.13
	cmp.b	#7,d2
	beq.w	.14
	cmp.b	#5,d2
	beq.w	.15
	cmp.b	#6,d2
	beq.w	.15

	lsl.w	#8,d2
	move.b	2(a4),d2

.8	moveq	#0,d0
	move.b	(a4),d0
	and.b	#1,d0
	lsl.b	#4,d0
	move.b	1(a4),d1
	lsr.b	#4,d1
	or.b	d1,d0

	moveq	#0,d1
	move.b	(a4),d1
	lsr.b	#1,d1

	move.l	#0,(a1)
	move.w	d2,2(a1)

	sub.b	#1,d1
	bmi.b	.9
	add.w	d1,d1
	lea	PerTble(pc),a5
	move.w	(a5,d1),d1
	move.w	d1,(a1)

.9	move.b	d0,d1
	and.b	#$f0,d0
	or.b	d0,(a1)
	lsl.b	#4,d1
	or.b	d1,2(a1)

	subq.b	#1,d7
	addq.l	#3,a4
	lea	16(a1),a1
	bra.w	.4

.10	lsl.w	#8,d2
	move.b	2(a4),d2
	lsr.b	#1,d2
	bra.b	.8

.11	lsl.w	#8,d2
	moveq	#0,d7
	move.b	d7,d2
	bra.b	.8

.12	lsl.w	#8,d2
	move.b	2(a4),d2
	lsr.b	#1,d2
	addq.b	#2,d2
	bra.b	.8

.13	move.b	#0,d2
	lsl.w	#8,d2
	move.b	2(a4),d2
	bra.b	.8

.14	move.b	#$a,d2
.15	lsl.w	#8,d2
	move.b	2(a4),d2
	tst.b	d2
	bpl.w	.8
	neg.b	d2
	bra.w	.8

.16	lea	(a3,d5),a1
	move.l	np_Smpl(pc),a0
	move.l	WrkSpce(pc),a2
	add.l	WrkSize(pc),a2
.17	cmp.l	a1,a2
	beq.b	.18
	move.b	(a0)+,(a1)+
	bra.b	.17
.18	rts

;-------------------;

np_FndO	move.l	Module(pc),a0
	move.l	a0,a1
	lea	np_Pos(pc),a2
	moveq	#0,d0
	moveq	#3,d1
.1	move.w	(a0)+,d0
	add.l	d0,a1
	move.l	a1,(a2)+
	dbf	d1,.1
	rts

;-------------------;

np_Pos	dc.l	0
np_Trck	dc.l	0
np_PDat	dc.l	0
np_Smpl	dc.l	0

;--------------------------------------;

Module	dc.l	np_Data
ModSize	dc.l	np_DataEnd-np_Data
WrkSpce	dc.l	WORKSPACE
WrkSize	dc.l	0
PerTble:dc.w	856,808,762,720,678,640,604,570,538,508,480,453
	dc.w	428,404,381,360,339,320,302,285,269,254,240,226
	dc.w	214,202,190,180,170,160,151,143,135,127,120,113

np_Data	incbin	"DH1:NP3.Module"
np_DataEnd
	END

NoisePacker data format:

   NOTE   SAMPLE       EFFECT
|       |        |               |
.0000000.0   0000.0000   00000000.
|   1st    |    2nd    |   3rd   |

