OpenLibrary	= -552
CloseLibrary	= -414
OpenWindow	= -204
CloseWindow	= -72
WBToFront	= -342
WBToBack	= -336
GetMsg		= -372
ReplyMsg	= -378
WaitPort	= -384
AutoRequest	= -348

;--------------------------------------;

	bsr.b	OpenLib
	bsr.b	OpenWin
	bsr.b	WB2Frnt
	bra.w	WaitEvt

End	bsr.b	WB2Back
	bsr.b	ClseWin
	bsr.b	ClseLib
	rts

;--------------------------------------;

OpenLib	move.l	4.w,a6
	moveq	#0,d0
	lea	IntName(pc),a1
	jsr	OpenLibrary(a6)
	move.l	d0,IntBase
	rts

ClseLib	move.l	4.w,a6
	move.l	IntBase(pc),a1
	jsr	CloseLibrary(a6)
	rts

;--------------------------------------;

OpenWin	move.l	IntBase(pc),a6
	lea	WinDef1(pc),a0
	jsr	OpenWindow(a6)
	move.l	d0,WinHD1
	rts

ClseWin	move.l	IntBase(pc),a6
	move.l	WinHD1(pc),a0
	jsr	CloseWindow(a6)
	rts

;--------------------------------------;

WB2Frnt	move.l	IntBase(pc),a6
	move.l	WinHD1(pc),a0
	jsr	WBToFront(a6)
	rts

WB2Back	move.l	IntBase(pc),a6
	move.l	WinHD1(pc),a0
	jsr	WBToBack(a6)
	rts

;--------------------------------------;

WaitEvt	move.l	4.w,a6
	move.l	WinHD1(pc),a0
	move.l	86(a0),a0
	move.l	a0,-(a7)
	jsr	WaitPort(a6)
	move.l	(a7)+,a0
	jsr	GetMsg(a6)
	move.l	d0,a1
	move.l	20(a1),d6
	cmp.l	#$200,d6
	beq.w	AutoReq
	jsr	ReplyMsg(a6)
	bra.b	WaitEvt

;--------------------------------------;

AutoReq	jsr	ReplyMsg(a6)
	move.l	WinHD1(pc),a0
	lea	BText1(pc),a1
	lea	LText1(pc),a2
	lea	RText1(pc),a3
	moveq	#0,d0			;IDCMP Flag that would replace Left
	moveq	#0,d1			;IDCMP Flag that would replace Right
	move.l	#180,d2
	moveq	#60,d3
	move.l	IntBase(pc),a6
	jsr	AutoRequest(a6)
	tst.l	d0
	beq	WaitEvt
	bra	End

;--------------------------------------;

WinHD1	dc.l	0
WinDef1	dc.w	0,0			;X & Y
	dc.w	640,50			;Width & Height
	dc.b	0,1			;Colours
	dc.l	$200			;IDCMP
	dc.l	$100f			;Flags
	dc.l	0			;Gadgets
	dc.l	0			;CheckMark
	dc.l	Title			;Title
	dc.l	0			;Screen
	dc.l	0			;BitMap
	dc.w	640,50			;X & Y Min
	dc.w	640,256			;X & Y Max
	dc.w	1			;Type
Title	dc.b	"Windows Title",0

;--------------------------------------;

BText1	dc.b	0,1			;Colours
	dc.b	0			;Mode
	even
	dc.w	0,0			;X & Y
	dc.l	0			;Font
	dc.l	BdText1			;Text
	dc.l	BText2			;Next
BText2	dc.b	0,1			;Colours
	dc.b	0			;Mode
	even
	dc.w	0,8			;X & Y
	dc.l	0			;Font
	dc.l	BdText2			;Text
	dc.l	0			;Next

LText1	dc.b	0,1
	dc.b	0
	even
	dc.w	0,0
	dc.l	0
	dc.l	LfText1
	dc.l	0

RText1	dc.b	0,1
	dc.b	0
	even
	dc.w	0,0
	dc.l	0
	dc.l	RtText1
	dc.l	0

BdText1	dc.b	"Quit Without Saving",0
BdText2	dc.b	"The Program?",0
LfText1	dc.b	"Yeah",0
RtText1	dc.b	"Nah",0
	even

;--------------------------------------;

IntName	dc.b	"intuition.library",0
IntBase	dc.l	0

