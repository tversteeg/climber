INCLUDE "header.inc"

INCLUDE "constants.asm"

SECTION "Start", HOME[$0150]
	nop
	jp main

main:
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

	; Turn on the LCD Display
	ld	a,%11000111 ; LCDCF_ON|LCDCF_BG8000|LCDCF_BG9800|LCDCF_BGON|LCDCF_OBJ16|LCDCF_OBJOFF
	ld	[rLCDC],a

	ei
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
