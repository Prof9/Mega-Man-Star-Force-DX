// Overlay 2 - Title screen

.nds
.open TEMP+"/overlay_0002.bin",readu32(TEMP+"/y9.bin", 2 * 0x20 + 0x4)
.thumb


.org 0x214FE04	// Region free slot-in
	.dw	title_gbaSlotInCodes


.org 0x2150776
	// Change script for Satellite Admin icon
	mov	r1,0xA

.org 0x2150EC0
	// Function that determines which icons are shown


.org 0x214FFBE	// 2 save slots
	bl	title_loadMenuData	// from PRESS START
.org 0x2150128
	bl	title_loadMenuData	// from NEW GAME / CONTINUE

.org 0x21501E6	// Blink on NEW GAME / CONTINUE
	mov	r0,0x0
.org 0x21501F2
	add	r1,0x1
.org 0x21501F8
	cmp	r1,0x3C
.org 0x215021E
	bl	title_blinkNewGameContinue

.org 0x214F7EA	// Skip save load on title screen start
.area 0x3E,0x00
	str	r3,[r4,0x20]
	b	0x214F828
.endarea

.org 0x214FCA8	// Allocate extra sprites for difficulty menu
	mov	r1,(11)		// from 9


.org 0x2150092	// Text on New Game
	cmp	r1,0x1
	blt	0x215009E	// state 0
	bne	@@state2
	b	0x21501D2	// state 1
@@state2:
	bl	title_textState
.org 0x2150106
	bl	title_onNewGameContinue
	nop
.org 0x2150190
	bl	title_onNewGameContinue


.close
