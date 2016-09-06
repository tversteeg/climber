INCLUDE "header.inc"

INCLUDE "constants.asm"

SECTION "Start", HOME[$0150]
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

LetterA:
	DB	$7E,$7E,$BD,$C3,$FF,$9D,$FF,$81
	DB	$FF,$9D,$F7,$95,$95,$F7,$F7,$F7

Blank:
	DB	$00,$00,$00,$00,$00,$00,$00,$00
	DB	$00,$00,$00,$00,$00,$00,$00,$00

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

	ld	hl,LetterA
	ld	de,$8010
	ld	bc,16
	call	mem_Copy
	ld	a,$01
	ld	hl,$9800
	ld	bc,4
	call	mem_Set

	; Turn on the LCD Display
	ld	a,$95	; LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_BGON|LCDCF_OBJ16|LCDCF_OBJOFF
	ld	[rLCDC],a

	ei
.loop:
	halt
	jr	.loop

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
timer:
serial:
joypad:
	reti
