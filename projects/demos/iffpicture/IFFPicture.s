Start

ChkForm	dc.b	"FORM"
	dc.l	2850			; Form Length (From ILBM to END)

ILBM	dc.b	"ILBM"			; InterLeaved BitMap File
	dc.b	"BMHD"			; BitMap Header
	dc.l	20			; Chunk length
	dc.w	320			; WOG, Width of graphics
	dc.w	256			; HOG, Width of graphics
	dc.w	0			; X Pos of graphics
	dc.w	0			; Y Pos of graphics
	dc.b	5			; Number of bitplanes
	dc.b	0			; Masking, 0 = No Masking
	dc.b	1			; Data compression,
					; 0 = no compression
					; 1 = Byte run 1 algorithms
	dc.b	0			; Padding
	dc.w	0			; Transparent colour
	dc.b	10			; X Aspect
	dc.b	11			; Y Aspect
	dc.w	320			; WOSP, Width of source page
	dc.w	256			; HOSP, Height of source page

CMAP	dc.b	"CMAP"			; ColourMap
	dc.l	96			; Chunk Length
	dc.b	$f0,$f0,$f0		; Col Reg 0, $dff180
	dc.b	$e0,$e0,$e0		; Col Reg 1, $dff182
	dc.b	$d0,$d0,$d0
	dc.b	$c0,$c0,$c0
	dc.b	$b0,$b0,$b0
	dc.b	$a0,$a0,$a0
	dc.b	$90,$90,$90
	dc.b	$80,$80,$80
	dc.b	$70,$70,$70
	dc.b	$60,$60,$60
	dc.b	$50,$50,$50
	dc.b	$40,$40,$40
	dc.b	$30,$30,$30
	dc.b	$20,$20,$20
	dc.b	$10,$10,$10
	dc.b	$00,$00,$00
	dc.b	$00,$00,$00
	dc.b	$10,$10,$10
	dc.b	$20,$20,$20
	dc.b	$30,$30,$30
	dc.b	$40,$40,$40
	dc.b	$50,$50,$50
	dc.b	$60,$60,$60
	dc.b	$70,$70,$70
	dc.b	$80,$80,$80
	dc.b	$90,$90,$90
	dc.b	$a0,$a0,$a0
	dc.b	$b0,$b0,$b0
	dc.b	$c0,$c0,$c0
	dc.b	$d0,$d0,$d0
	dc.b	$e0,$e0,$e0
	dc.b	$f0,$f0,$f0

DPPS	dc.b	"DPPS"
	dc.l	110
	dc.b	$00,$02,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$01,$68,$00,$00,$01,$40
	dc.b	$01,$00,$00,$02,$00,$5a,$00,$40,$00,$00
	dc.b	$00,$40,$00,$00,$00,$40,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$01,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$01,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$00

CRNG	dc.b	"CRNG"
	dc.l	8
	dc.b	$00,$00,$00,$24,$00,$02,$14,$1f

CAMG	dc.b	"CAMG"			; Commodore Amiga View Port Mode
	dc.l	4
	dc.l	$4000

;	$4000 = Lo-Res, $c000 = Hi-Res
;	$c004 = Hi-Res InterLaced
;	$4004 = Lo-Res Interlaced


;     *----------------------*
;     | Decoding the body... |
;     *----------------------*
;
;Loop	move.b	(a0)+,d0
;	bpl	NotCmp
;LoopIt	move.b	(a0)+,d1	; Get the next byte
;	neg.b	d0		; Negate the negitive byte we got at first
				; to get the number of compresed bytes
;	move.b	d1,(a1)+	; Loop and copy in d1 to the bitmap
;				; (assume bitmap pointer is in a1)
;	dbf	d0,LoopIt
;	bra	DneByt
;NotCmp	move.b	d0,(a1)+
;DneByt	bra	Loop

BODY	dc.b	"BODY"
	dc.l	2560
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
	dc.b	$d9,$00,$d9,$00,$d9,$00,$d9,$00
End
