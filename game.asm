INCLUDE "header.inc"

INCLUDE "constants.asm"

main:
	nop
	di

	; Set background palette
	ld	a,%11100100
	ld	[rBGP],a

	; Set X/Y scroll registers to 0
	xor	a
	ld	[rSCY],a
	ld	[rSCX],a

	; Turn on the LCD Display
	ld	a,%10010101 ; LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_BGON|LCDCF_OBJ16|LCDCF_OBJOFF
	ld	[rLCDC],a

	ei

	ld	sp,$FFFF ; Initialize the stack pointer
	call	StopLCD
.loop:
	halt
	jr	.loop

StopLCD:
	ld	a,[rLCDC]
	rlca
	ret	nc

draw:
stat:
timer:
serial:
joypad:
	reti
