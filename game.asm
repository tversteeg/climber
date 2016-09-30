INCLUDE "header.inc"

INCLUDE "constants.asm"

SECTION "Start",	HOME[$0150]
	nop
	jp main

Smiley:
	DB	%01111110
	DB	%10000001
	DB	%10100101
	DB	%10000001
	DB	%10111101
	DB	%10011001
	DB	%10000001
	DB	%01111110

Stripe:
	DB	%10001000
	DB	%01000100
	DB	%00100010
	DB	%00010001
	DB	%10001000
	DB	%01000100
	DB	%00100010
	DB	%00010001

Stripe2Bit:
	DB	$AA,$CC,$55,$66,$AA,$33,$55,$99
	DB	$AA,$CC,$55,$66,$AA,$33,$55,$99

Blank:
	DB	$00,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00

ANUVVER_SIZE	EQU	$03A0
ANUVVER_COUNT	EQU	$3B

AnuvverFont:
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $1C,$1C,$22,$3E,$3E,$26,$2C,$2C,$18,$18,$24,$24,$3C,$24,$18,$18
	DB $6C,$6C,$92,$FE,$FE,$92,$6C,$6C,$00,$00,$00,$00,$00,$00,$00,$00
	DB $7E,$7E,$E7,$FF,$BD,$DB,$B1,$B1,$B1,$B1,$99,$DB,$FF,$E7,$7E,$7E
	DB $00,$00,$36,$36,$6B,$7F,$41,$49,$22,$22,$14,$14,$08,$08,$00,$00
	DB $66,$66,$9B,$FF,$FF,$91,$62,$62,$46,$46,$89,$89,$FF,$D9,$66,$66
	DB $18,$18,$28,$38,$5F,$6F,$81,$C1,$C1,$81,$4F,$6F,$28,$38,$18,$18
	DB $18,$18,$24,$3C,$3C,$24,$28,$28,$10,$10,$00,$00,$00,$00,$00,$00
	DB $1C,$1C,$34,$3C,$3C,$2C,$28,$28,$28,$28,$2C,$2C,$3C,$34,$1C,$1C
	DB $38,$38,$2C,$3C,$3C,$34,$14,$14,$14,$14,$34,$34,$3C,$2C,$38,$38
	DB $18,$18,$3C,$3C,$7E,$66,$C3,$C3,$42,$66,$C3,$C3,$FF,$BD,$E7,$E7
	DB $00,$00,$1C,$1C,$1C,$14,$77,$77,$41,$41,$77,$77,$1C,$14,$1C,$1C
	DB $00,$00,$00,$00,$00,$00,$18,$18,$2C,$24,$34,$34,$1C,$14,$0C,$0C
	DB $00,$00,$00,$00,$00,$00,$7E,$7E,$42,$42,$7E,$7E,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$18,$18,$24,$24,$24,$24,$18,$18,$00,$00
	DB $06,$06,$0B,$0F,$1F,$11,$22,$22,$44,$44,$88,$88,$F0,$D0,$60,$60
	DB $7E,$7E,$C3,$FF,$FF,$99,$99,$99,$99,$99,$81,$81,$FF,$C3,$7E,$7E
	DB $3C,$3C,$64,$7C,$7C,$44,$64,$64,$24,$24,$E7,$E7,$FF,$81,$FF,$FF
	DB $FE,$FE,$83,$FF,$FF,$F9,$81,$C3,$9F,$9F,$81,$81,$FF,$C1,$7F,$7F
	DB $FE,$FE,$83,$FF,$FD,$FB,$22,$22,$F9,$FB,$81,$81,$FF,$83,$FE,$FE
	DB $FE,$FE,$92,$FE,$FF,$93,$81,$C1,$73,$73,$12,$12,$1E,$12,$1E,$1E
	DB $FF,$FF,$81,$FF,$FF,$9F,$81,$C3,$F9,$F9,$81,$81,$FF,$83,$FE,$FE
	DB $7E,$7E,$C2,$FE,$FE,$9E,$81,$83,$99,$99,$81,$81,$FF,$C3,$7E,$7E
	DB $FF,$FF,$81,$FF,$FF,$F9,$33,$33,$66,$66,$44,$44,$7C,$44,$7C,$7C
	DB $7E,$7E,$C3,$FF,$BD,$DB,$42,$66,$99,$DB,$81,$81,$FF,$C3,$7E,$7E
	DB $7E,$7E,$C3,$FF,$FF,$99,$81,$C1,$79,$79,$41,$41,$7F,$43,$7E,$7E
	DB $18,$18,$24,$3C,$3C,$24,$18,$18,$24,$24,$24,$24,$18,$18,$00,$00
	DB $18,$18,$24,$3C,$3C,$24,$18,$18,$2C,$24,$34,$34,$1C,$14,$0C,$0C
	DB $0E,$0E,$12,$1E,$3C,$24,$48,$48,$24,$24,$12,$12,$0E,$0E,$00,$00
	DB $00,$00,$7E,$7E,$7E,$42,$7E,$7E,$42,$42,$7E,$7E,$00,$00,$00,$00
	DB $70,$70,$48,$78,$3C,$24,$12,$12,$24,$24,$48,$48,$70,$70,$00,$00
	DB $FE,$FE,$83,$FF,$FF,$F9,$41,$63,$4E,$4E,$38,$38,$78,$48,$30,$30
	DB $7E,$7E,$C3,$FF,$FF,$99,$A5,$B5,$B1,$B3,$9F,$9F,$FE,$C2,$7E,$7E
	DB $7E,$7E,$C3,$FF,$FF,$9D,$81,$81,$9D,$9D,$95,$95,$F7,$95,$F7,$F7
	DB $FE,$FE,$83,$FF,$FD,$9B,$86,$82,$9B,$99,$81,$81,$FF,$83,$FE,$FE
	DB $7F,$7F,$C1,$FF,$FF,$9F,$90,$90,$9F,$9F,$81,$81,$FF,$C1,$7F,$7F
	DB $FC,$FC,$86,$FE,$F7,$9B,$99,$99,$99,$99,$81,$81,$FF,$83,$FE,$FE
	DB $7F,$7F,$C1,$FF,$FF,$9F,$84,$84,$9F,$9F,$81,$81,$FF,$C1,$7F,$7F
	DB $7F,$7F,$C1,$FF,$FF,$9F,$84,$84,$9C,$9C,$90,$90,$F0,$90,$F0,$F0
	DB $7F,$7F,$C1,$FF,$FF,$9F,$99,$99,$9D,$9D,$81,$81,$FF,$C3,$7F,$7F
	DB $F7,$F7,$95,$F7,$FF,$9D,$81,$81,$9D,$9D,$95,$95,$F7,$95,$F7,$F7
	DB $FF,$FF,$81,$FF,$FF,$E7,$24,$24,$24,$24,$E7,$E7,$FF,$81,$FF,$FF
	DB $7F,$7F,$41,$7F,$7F,$79,$E9,$E9,$99,$99,$81,$81,$FF,$C3,$7E,$7E
	DB $F7,$F7,$9D,$FF,$FF,$99,$82,$82,$99,$9B,$99,$99,$FF,$99,$FF,$FF
	DB $F0,$F0,$90,$F0,$F0,$90,$90,$90,$9F,$9F,$81,$81,$FF,$C1,$7F,$7F
	DB $76,$76,$9D,$FF,$FF,$89,$81,$81,$95,$95,$9D,$9D,$F7,$95,$F7,$F7
	DB $7E,$7E,$83,$FF,$FF,$99,$95,$95,$95,$95,$95,$95,$F7,$95,$F7,$F7
	DB $FE,$FE,$83,$FF,$FF,$99,$81,$83,$9E,$9E,$90,$90,$F0,$90,$F0,$F0
	DB $7E,$7E,$C3,$FF,$FF,$99,$95,$95,$91,$91,$82,$82,$FF,$CD,$77,$77
	DB $FE,$FE,$83,$FF,$FD,$9B,$82,$82,$99,$9B,$99,$99,$FF,$99,$FF,$FF
	DB $7F,$7F,$C1,$FF,$FF,$9F,$81,$C3,$F9,$F9,$81,$81,$FF,$83,$FE,$FE
	DB $FF,$FF,$81,$FF,$FF,$E7,$24,$24,$24,$24,$24,$24,$3C,$24,$3C,$3C
	DB $FF,$FF,$99,$FF,$FF,$99,$99,$99,$99,$99,$81,$81,$FF,$C3,$7E,$7E
	DB $FF,$FF,$99,$FF,$FF,$99,$99,$99,$99,$99,$C3,$C3,$7E,$66,$3C,$3C
	DB $F7,$F7,$95,$F7,$FF,$9D,$9D,$9D,$95,$95,$81,$81,$FF,$CB,$76,$76
	DB $F7,$F7,$95,$F7,$FF,$CB,$66,$66,$CB,$CB,$95,$95,$F7,$95,$F7,$F7
	DB $FF,$FF,$99,$FF,$FF,$99,$C1,$C1,$F9,$F9,$81,$81,$FF,$83,$FE,$FE
	DB $FF,$FF,$83,$FF,$FE,$F2,$24,$24,$4F,$4F,$81,$81,$FF,$C1,$FF,$FF

TITLE_SIZE	EQU	$7

Title:
	DB $24,$2D,$2A,$2E,$23,$26,$32

; Variables
H_VBLANK_READY	EQU	$FF90
H_GAME_STATE	EQU	$FF91

L_LOGO_COUNTER	EQU	$C000

mem_Set::
	inc	b
	inc	c
	jr	.skip
.loop
	ld	[hl+],a
.skip
	dec	c
	jr	nz,.loop
	dec	b
	jr	nz,.loop
	ret

mem_Copy::
	inc	b
	inc	c
	jr	.skip
.loop
	ld	a,[hl+]
	ld	[de],a
	inc	de
.skip
	dec	c
	jr	nz,.loop
	dec	b
	jr	nz,.loop
	ret

mem_CopyMono::
	inc	b
	inc	c
	jr	.skip
.loop
	ld	a,[hl+]
	ld	[de],a
	inc	de
	ld	[de],a
	inc	de
.skip
	dec	c
	jr	nz,.loop
	dec	b
	jr	nz,.loop
	ret

main:
	nop
	di	; Disable interuptions

	ld	sp,$FFFF ; Initialize the stack pointer

	; Set background & sprite palettes
	ld	a,%11100100
	ld	[rBGP],a
	ld	[rOBP0],a
	ld	[rOBP1],a

	; Set X/Y scroll registers to 0
	xor	a
	ld	[rSCX],a
	ld	[rSCY],a

	call	StopLCD

	; Clear the canvas
	ld	hl,Blank
	ld	de,$8000
	ld	bc,16
	call	mem_Copy
	xor a
	ld	hl,$9800
	ld	bc,1024	; Screen width * height in bytes
	call	mem_Set

	; Load the font
	ld	hl,AnuvverFont
	ld	de,$8010
	ld	bc,ANUVVER_SIZE
	call	mem_Copy

	ld	hl,Title
	ld	de,$9A26
	ld	bc,TITLE_SIZE
	call	mem_Copy

	; Turn on the LCD Display
	ld	a,$95	; LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_BGON|LCDCF_OBJ16|LCDCF_OBJOFF
	ld	[rLCDC],a

	; Enable VBlank interrupt
	ld	a,$1
	ld	[rIE],a

	; Set the game state
	xor	a
	ld	[H_GAME_STATE],a

	ld	a,$AF
	ld	[L_LOGO_COUNTER],a

	ei
.loop:
	halt
	ld	a,[H_VBLANK_READY]
	cp	$FF
	jr	nz,.loop

	di
	push af

	ld	a,[H_GAME_STATE]
	cp	$0
	jr	z,.logo
	dec	a
	jr	z,.game

.logo
	call Logo
	jp	.finished

.game
	call Game

.finished
	pop	af

	xor	a
	ld	[H_VBLANK_READY],a

	ei
	jr	.loop

Logo:
	; Scroll the logo to the center
	ldh	a,[rSCY]
	cp	70
	jr	z,.next
	inc	a
	ldh	[rSCY],a
	ret

.next
	; Wait 255 cycles
	ld	a,[L_LOGO_COUNTER]
	inc	a
	jr	z,.finished
	ld	[L_LOGO_COUNTER],a
	ret

.finished
	; Clear the canvas
	xor a
	ld	hl,$9800
	ld	bc,1024	; Screen width * height in bytes
	call	mem_Set

	ld	a,[H_GAME_STATE]
	inc	a
	ld	[H_GAME_STATE],a
	ret

Game:
	; Scroll the logo to the center
	ldh	a,[rSCX]
	cp	70
	jr	z,.finished
	inc	a
	ldh	[rSCX],a
	ret

.finished
	ld	a,[H_GAME_STATE]
	inc	a
	ld	[H_GAME_STATE],a
	ret

StopLCD:
	ld	a,[rLCDC]
	rlca
	ret	nc	; Screen is already off
	; Loop until VBlank
.wait
	ld	a,[rLY]
	cp	145
	jr	nc,.wait
	; Turn off LCD
	ld	a,[rLCDC]
	res	7,a
	ld	[rLCDC],a
	ret

draw:
stat:
	; Set VBlank flag
	ld	a,$FF
	ld	[H_VBLANK_READY],a
	reti
timer:
serial:
joypad:
	reti
