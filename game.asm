INCLUDE "header.inc"

; $0150: Code!
main:
	di
	call	StopLCD
	; Set background palette
	ld	a,$e4
	ld	[$ff47],a	; rBGP
	; Set X/Y scroll registers to 0
	ld	a,0
	ld	[$FF42],a	; rSCY
	ld	[$FF43],a	; rSCX
.loop:
	halt
	jr	.loop

StopLCD:
	ld	a,[$FF40]	; rLCDC
	rlca
	ret	nc

draw:
stat:
timer:
serial:
joypad:
	reti

