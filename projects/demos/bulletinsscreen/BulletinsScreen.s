	SECTION	"The Bulletins Screen",CODE_C

;----------------------------;

Forbid		= -132
Permit		= -138

;----------------------------;

	move.l	4.w,a6
	jsr	Forbid(a6)

	lea	$dff000,a5
	move.l	#0,$120(a5)

	move.l	#TxtArea,d0
	move.w	d0,BPL+6
	swap	d0
	move.w	d0,BPL+2
	swap	d0
	add.b	#40,d0
	move.w	d0,BPL+14
	swap	d0
	move.w	d0,BPL+10

	move.w	2(a5),d0
	or.w	#$8000,d0
	move.w	d0,DMACON

	move.w	#$7fff,$96(a5)
	move.l  #CList,$80(a5)
	move.w	#$0000,$88(a5)
	move.w	#$83c0,$96(a5)

Mouse	bsr.b	Display
	btst	#6,$bfe001
	bne.b	Mouse

	move.l	$9c(a6),a1
	move.w	#$0080,$96(a5)
	move.l	38(a1),$80(a5)
	move.w	#$0000,$88(a5)
	move.w	DMACON(pc),$96(a5)

	jsr	Permit(a6)
	moveq	#0,d0
	rts

;--------------------------------------;

Display	sub.w	#1,Delay
	tst.w	Delay
	bne	EndDisp
	move.w	#2000,Delay
	tst.b	TxtSwch
	beq.b	EndDisp
	moveq	#0,d0
	move.l	TxtPnt(pc),a0
	move.b	(a0),d0
	cmp.b	#0,d0
	beq.b	NewLine
	cmp.b	#1,d0
	beq.w	Reset
	sub.b	#32,d0
	mulu	#8,d0
	add.l	#CharSet,d0
	move.l	d0,a0
	move.l	CSPos(pc),a1

	move.b	(a0)+,(a1)
	move.b	(a0)+,080(a1)
	move.b	(a0)+,160(a1)
	move.b	(a0)+,240(a1)
	move.b	(a0)+,320(a1)
	move.b	(a0)+,400(a1)
	move.b	(a0)+,480(a1)
	move.b	(a0)+,560(a1)

	add.l	#1,TxtPnt
	add.l	#1,CSPos
EndDisp	rts

NewLine	cmp.b	#9,ScrlTst
	beq	ScrlUp
	add.b	#1,ScrlTst
	add.l	#640,CLine
	move.l	Cline(pc),CSPos
	add.l	#1,TxtPnt
	rts

ScrlUp	moveq	#7,d0
	move.l	#7000,d1
SclLoop	dbf	d1,SclLoop
	move.l	#7000,d1
WaitBlt	btst	#14,2(a5)
	bne	WaitBlt
	move.l	#$09f00000,$40(a5)
	move.l	#$ffffffff,$44(a5)
	move.l	#TxtArea+802,$50(a5)
	move.l	#TxtArea+722,$54(a5)
	move.l	#$00040004,$64(a5)
	move.w	#79*64*2+18,$58(a5)
	dbf	d0,SclLoop
	move.l	Cline(pc),CSPos
	add.l	#1,TxtPnt
	rts

Reset	move.l	#TxtArea,CSPos
	clr.b	CLine
	clr.b	TxtSwch
	rts

;--------------------------------------;

DMACON	dc.w	0

CSPos	dc.l	TxtArea+723
TxtPnt	dc.l	Text1
CLine	dc.l	TxtArea+723
Delay	dc.w	2000
TxtSwch	dc.b	1
ScrlTst	dc.b	0

;--------------------------------------;

CList	dc.w	$008e,$2c81,$0090,$2cc1
	dc.w	$0092,$0038,$0094,$00d0
	dc.w	$0096,$0020,$0104,$0000
	dc.w	$01a2,$0000,$01a4,$0000
	dc.w	$01a6,$0000,$01a8,$0000
	dc.w	$0108,$0028,$010a,$0028

	dc.w	$5009,$fffe,$0100,$2200
	dc.w	$0180,$0000,$0182,$0fff
	dc.w	$0184,$0aaa,$0186,$0555

BPL	dc.w	$00e0,$0000,$00e2,$0000
	dc.w	$00e4,$0000,$00e6,$0000
	dc.w	$b009,$fffe,$0100,$0200
	dc.w	$ffff,$fffe

;----------------------------------------------------------;

CharSet	include	DH2:BulletinsScreen/ScoopexInvs.chr
TxtArea	incbin	DH2:BulletinsScreen/BulletinsScreen.raw
Text1	dc.b	"         ROBSTER PRESENTS        ",0
	dc.b	"       THE BULLETINS SCREEN      ",0
	dc.b	"       --------------------      ",0
	dc.b	"        FINISHED 26-OCT-92       ",0
	dc.b	0
	dc.b	"     MY PERSONAL GREETINGS TO    ",0
	dc.b	"           HYDSIE  (TKK)         ",0
	dc.b	"          BAD BARTY (SCX)        ",0
	dc.b	"            KING FUZZY           ",0
	dc.b	"           THE SUPERIOR          ",0
	dc.b	"               ZYX               ",0
	dc.b	"              BUNJI              ",0
	dc.b	"            IRON LORD            ",0
	dc.b	"             AWESOME             ",0
	dc.b	0
	dc.b	1
	even

;----------------------------------------------------------;
