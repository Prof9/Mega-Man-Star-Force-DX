.align 2
title_onNewGameContinue:
	push	r14
	cmp	r0,0x1
	bne	@@normal

	// Reset cursor animation
	mov	r0,r4
	add	r0,0xB0
	mov	r1,0x6
	bl	0x2020570	// set animation

	// Go to text state
	mov	r0,0x2
	b	@@end

@@normal:
	str	r0,[r4,0x8]
	mov	r0,0x1
@@end:
	strb	r0,[r4,0xD]
	pop	r15


.align 2
title_textState:
	ldrb	r0,[r4,0xE]
	cmp	r0,0x0
	bne	@@waitForText

	// Start text
	mov	r0,0x20		// [sp+0x4] = tile VRAM offset
	mov	r1,0x30
	lsl	r1,r1,0x8	// [sp+0x8] = obj VRAM offset
	mov	r2,0xF		// [sp+0xC] = background palette
	mov	r3,0xD		// [sp+0x10] = foreground palette
	push	r0-r3
	mov	r3,0x1		// [sp+0x0] = screen; r3 = color
	push	r3
	ldr	r0,=0x934
	ldr	r0,[r4,r0]	// r0 = text archive
	mov	r1,(20)		// r1 = script
	mov	r2,0x0		// r2 = font

	strb	r3,[r4,0xE]	// set substate

	bl	0x2008470	// start text
	add	sp,0x14

	mov	r2,0x3
	lsl	r2,r2,0xB
	mov	r3,0x1
	lsl	r3,r3,0xB

	// Set cursor priority
	// This also freezes the animation
	mov	r0,r4
	add	r0,0xB0
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	orr	r1,r3
	strh	r1,[r0,0x22]

	// Set NEW GAME priority
	mov	r0,r4
	add	r0,0xFC
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	orr	r1,r3
	strh	r1,[r0,0x22]

	// Set CONTINUE priority
	mov	r0,r4
	add	r0,0xFF
	add	r0,(0x148 - 0xFF)
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	orr	r1,r3
	strh	r1,[r0,0x22]

	b	@@end

@@waitForText:
	// Check if script finished
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

@@checkNormal:
	ldr	r1,=0xF11B
	bl	0x202409C	// check flag
	beq	@@checkLegend

	mov	r0,0x0
	b	@@startGame

@@checkLegend:
	ldr	r1,=0xF11B
	add	r1,0x1
	bl	0x202409C	// check flag
	beq	@@cancel

	mov	r0,0x1
//	b	@@startGame

@@startGame:
	add	r1,=title_startingDifficulty
	str	r0,[r1]

	// Clear starting difficulty flags
	ldr	r1,=0xF11B
	mov	r2,0x2
	bl	0x202407C	// clear flag range

	mov	r0,0x1
	str	r0,[r4,0x8]	// menu action
	strb	r0,[r4,0xD]	// menu state
	mov	r0,0x0
	strb	r0,[r4,0xE]	// menu substate
	b	@@enableCursor

@@cancel:
	mov	r0,0x0
	strb	r0,[r4,0xD]	// menu state
	strb	r0,[r4,0xE]	// menu substate
//	b	@@enableCursor

@@enableCursor:
	mov	r2,0x3
	lsl	r2,r2,0xB

	// Set NEW GAME priority
	mov	r0,r4
	add	r0,0xFC
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	strh	r1,[r0,0x22]

	// Set CONTINUE priority
	mov	r0,r4
	add	r0,0xFF
	add	r0,(0x148 - 0xFF)
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	strh	r1,[r0,0x22]

	// Set cursor priority
	// This also unfreezes the animation
	mov	r0,r4
	add	r0,0xB0
	ldrh	r1,[r0,0x22]
	bic	r1,r2
	strh	r1,[r0,0x22]

	// Start cursor animation
	mov	r1,0x3
	bl	0x2020570	// set animation

@@end:
	bl	0x2150200

.align 4
title_startingDifficulty:
	.dw	0x0


.align 2
title_loadMenuData:
	push	r4-r5,r14	// push extra for allocation
	mov	r4,r0

	// Set animation to Data 1
	mov	r5,0xFC
	add	r5,r4,r5	// sprite 1

	mov	r0,r5		// sprite
	mov	r1,0x4		// Data 1
	bl	0x2020570	// set animation

	// Show Data 1
	mov	r0,r5		// sprite
	bl	0x202067C

	// Position Data 1
	mov	r0,r5		// sprite
	mov	r1,0x80		// x
	mov	r2,0x58		// y
	bl	0x2020780

	// Create touch target for Data 1
	mov	r0,0x2C
	bl	0x202D2C8
	mov	r5,r0		// target 1
	beq	@@insertTarget1

	// Initialize Data 1 touch target
//	mov	r0,r5
	add	r1,=title_targetData1
	mov	r2,0x1
	bl	0x202D2F8

@@insertTarget1:
	// Insert Data 1 touch target in linked list
	ldr	r0,=0x212E2C0
	add	r1,r5,0x4
	mov	r2,r5
	mov	r3,0x3
	bl	0x2032BF0

	// Save Data 1 touch target
	str	r5,[r4,0x30]
	mov	r0,0x1
	strb	r0,[r5,0x15]

	// Set animation to Data 2
	mov	r5,0xFF
	add	r5,(0x148 - 0xFF)
	add	r5,r4,r5	// sprite 2

	mov	r0,r5		// sprite
	mov	r1,0x5		// Data 2
	bl	0x2020570	// set animation

	// Show Data 2
	mov	r0,r5		// sprite
	bl	0x202067C	// show sprite

	// Position Data 2
	mov	r0,r5		// sprite
	mov	r1,0x80		// x
	mov	r2,0x68		// y
	bl	0x2020780	// set position

	// Create touch target for Data 2
	mov	r0,0x2C
	bl	0x202D2C8
	mov	r5,r0		// target 2
	beq	@@insertTarget2

	// Initialize Data 2 touch target
//	mov	r0,r5
	add	r1,=title_targetData2
	mov	r2,0x2
	bl	0x202D2F8

@@insertTarget2:
	// Insert Data 2 touch target in linked list
	ldr	r0,=0x212E2C0
	add	r1,r5,0x4
	mov	r2,r5
	mov	r3,0x3
	bl	0x2032BF0

	// Save Data 2 touch target
	str	r5,[r4,0x34]
	mov	r0,0x1
	strb	r0,[r5,0x15]

	// Show cursor
	mov	r5,r4
	add	r5,0xB0		// cursor sprite
	mov	r0,r5
	bl	0x202067C	// show sprite

	// Set cursor animation
	mov	r0,r5
	mov	r1,0x3
	bl	0x2020570	// set animation

	// Hide Press Start
	mov	r0,r4
	add	r0,0x64
	bl	0x2020688	// hide sprite

	// Hide title screen stars
	mov	r0,r4
	bl	0x2150F78

	ldr	r0,=common_currentSaveFile
	ldr	r0,[r0]
	strb	r0,[r4,0xC]	// choice

	mov	r0,0x0
	strb	r0,[r4,0xD]	// state
	strb	r0,[r4,0xE]	// substate
	strb	r0,[r4,0x10]	// action 1

	ldr	r1,=0x21030C8
	ldr	r1,[r1]
	ldr	r2,=0x1860
	ldr	r3,=0x424
	str	r0,[r1]
	str	r0,[r1,r3]
	add	r2,0x5
	strb	r0,[r4,r2]	// title screen stars background

	mov	r0,0x1
	strb	r0,[r4,0x11]	// action 2
	mov	r0,0x2
	strb	r0,[r4,0xF]	// number of options

	// Go to Data menu state
	ldr	r0,=title_whileMenuData|1
	mov	r1,0x0
	str	r0,[r4,0x28]
	str	r1,[r4,0x2C]

	pop	r4-r5,r15


.align 4
title_targetData1:
	.dh	0x60	// x
	.dh	0x50	// y
	.dh	0x40	// width
	.dh	0x10	// height
.align 4
title_targetData2:
	.dh	0x60	// x
	.dh	0x60	// y
	.dh	0x40	// width
	.dh	0x10	// height


.align 2
title_whileMenuData:
	push	r4-r5,r14
	mov	r4,r0		// this

	ldrb	r0,[r4,0xD]	// state
	cmp	r0,0x1
	beq	@@state1
	bgt	@@state2

@@state0:
@@checkUpDown:
	ldr	r3,=0x211DD1C
	ldrh	r2,[r3,0x8]	// button down repeat
	mov	r0,0xC0
	tst	r2,r0
	beq	@@checkStartA

@@changeChoice:
	// Change to other option
	ldrb	r1,[r4,0xC]	// choice
	mov	r0,0x1
	eor	r1,r0
	strb	r1,[r4,0xC]	// choice

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x66
	bl	0x2025574	// play SFX

	b	@@updateCursor

@@checkStartA:
	ldrh	r2,[r3,0x2]	// button down single
	mov	r0,0x9
	tst	r2,r0
	beq	@@checkB

	// To state 1
	mov	r0,0x1
	strb	r0,[r4,0xD]	// state

	b	@@updateCursor

@@checkB:
	lsr	r0,r2,0x2	// test 0x2
	bcc	@@checkTouch

	// Remove touch targets
	mov	r0,r4
	bl	0x2150D3C

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x68
	bl	0x2025574	// play SFX

	// Go to Press Start state
	mov	r0,r4
	bl	0x214FFDC

	b	@@updateCursor

@@checkTouch:
	ldr	r3,=0x2121090
	ldr	r3,[r3]
	add	r3,0x98

	ldr	r0,[r3]
	cmp	r0,0x0
	beq	@@updateCursor
	ldrb	r0,[r0,0x14]
	lsr	r0,r0,0x1	// test 0x1
	bcc	@@updateCursor

	ldrh	r3,[r3,0x4]	// touch index
	cmp	r3,0x1
	blt	@@updateCursor
	cmp	r3,0x2
	bgt	@@updateCursor

	// Update choice
	sub	r0,r3,0x1
	strb	r0,[r4,0xC]	// choice

	// To state 1
	mov	r0,0x1
	strb	r0,[r4,0xD]	// state

	b	@@updateCursor

@@state1:
	// Remove touch targets
	mov	r0,r4
	bl	0x2150D3C

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_SAVESLOT
	bl	0x2025574

	// Set timer
	mov	r0,0x0
	strh	r0,[r4]		// timer
	// To state 2
	mov	r0,0x2
	strb	r0,[r4,0xD]	// state

	// Set save slot
	ldr	r1,=common_currentSaveFile
	ldrb	r0,[r4,0xC]	// choice
	str	r0,[r1]

	// Start save load
	mov	r0,r4
	bl	common_saveLoadAsync

	b	@@updateCursor

@@state2:
	// Run save load thread
	ldr	r0,=0x210CCF0
	ldr	r5,[r0]
	add	r5,0x1C

	// Check thread terminated
	mov	r0,r5
	blx	0x208E308
	cmp	r0,0x0
	bne	@@blinkTimer

	// Wakeup thread
	mov	r0,r5
	blx	0x208E3D4

@@blinkTimer:
	ldrh	r0,[r4]		// timer
	add	r0,0x1
	cmp	r0,0x3C
	bne	@@setTimer

	// Check thread terminated
	mov	r0,r5
	blx	0x208E308
	cmp	r0,0x0
	beq	@@updateCursor

	// Hide Data 2 sprite
	mov	r0,r4
	add	r0,0xFF
	add	r0,(0x148 - 0xFF)
	bl	0x2020688

	// Reset choice
	mov	r0,0x0
	strb	r0,[r4,0xC]	// choice

	// Load NEW GAME / CONTINUE state
	mov	r0,r4
	bl	0x2150240

	b	@@updateSelection

@@setTimer:
	strh	r0,[r4]		// timer

@@updateCursor:
	// Update cursor position
	mov	r0,0xB0
	add	r0,r4,r0
	mov	r1,0x60		// x
	ldrb	r2,[r4,0xC]	// choice
	lsl	r2,r2,0x4
	add	r2,0x58		// y
	bl	0x2020780

@@updateSelection:
	bl	title_blinkOption

@@updateBackground:
	// Do stars in background
	mov	r0,r4
	bl	0x2150CF4
	mov	r0,r4
	bl	0x2151158

	pop	r4-r5,r15


title_blinkNewGameContinue:
	push	r14
	bl	0x2020780
	bl	title_blinkOption
	pop	r15


title_blinkOption:
	// Uses r4 = this
	push	r5,r14

	ldrb	r0,[r4,0xD]	// start
	cmp	r0,0x0
	beq	@@end

	// Hide selected option
	ldrb	r0,[r4,0xC]	// choice
	mov	r1,0x4C
	mul	r0,r1
	add	r0,0xFC
	add	r5,r4,r0
	mov	r0,r5
	bl	0x2020688

	// Show selected option on certain frames
	ldrh	r0,[r4]		// timer
	lsr	r0,r0,0x4	// test 0x8
	bcc	@@end
	mov	r0,r5
	bl	0x202067C

@@end:
	pop	r5,r15


	.pool


.align 4
title_gbaSlotInCodes:
	.ascii	"08"	:: .align 4	:: .ascii	"AREJ"	// Rockman EXE (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"AE2J"	// Rockman EXE2 (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"A6BJ"	// Rockman EXE3 (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"A3XJ"	// Rockman EXE3 BLACK (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"B4WJ"	// Rockman EXE4 - Tournament Red Sun (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"B4BJ"	// Rockman EXE4 - Tournament Blue Moon (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"BR4J"	// Rockman EXE4.5 - Real Operation (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"BRBJ"	// Rockman EXE5 - Team of Blues (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"BRKJ"	// Rockman EXE5 - Team of Colonel (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"BR5J"	// Rockman EXE6 - Cyber Beast Glaga (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"BR6J"	// Rockman EXE6 - Cyber Beast Falzer (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"A89J"	// Rockman EXE Battle Chip GP (JP)
	.ascii	"08"	:: .align 4	:: .ascii	"AREE"	// Mega Man Battle Network (US)
	.ascii	"08"	:: .align 4	:: .ascii	"AE2E"	// Mega Man Battle Network 2 (US)
	.ascii	"08"	:: .align 4	:: .ascii	"A6BE"	// Mega Man Battle Network 3 White (US)
	.ascii	"08"	:: .align 4	:: .ascii	"A3XE"	// Mega Man Battle Network 3 Blue (US)
	.ascii	"08"	:: .align 4	:: .ascii	"B4WE"	// Mega Man Battle Network 4 - Red Sun (US)
	.ascii	"08"	:: .align 4	:: .ascii	"B4BE"	// Mega Man Battle Network 4 - Blue Moon (US)
	.ascii	"08"	:: .align 4	:: .ascii	"BR4E"	// Mega Man Battle Network 4.5 - Real Operation (US)
	.ascii	"08"	:: .align 4	:: .ascii	"BRBE"	// Mega Man Battle Network 5 - Team ProtoMan (US)
	.ascii	"08"	:: .align 4	:: .ascii	"BRKE"	// Mega Man Battle Network 5 - Team Colonel (US)
	.ascii	"08"	:: .align 4	:: .ascii	"BR5E"	// Mega Man Battle Network 6 - Cybeast Gregar (US)
	.ascii	"08"	:: .align 4	:: .ascii	"BR6E"	// Mega Man Battle Network 6 - Cybeast Falzar (US)
	.ascii	"08"	:: .align 4	:: .ascii	"A89E"	// Mega Man Battle Chip Challenge (US)
	.ascii	"08"	:: .align 4	:: .ascii	"AREP"	// Mega Man Battle Network (EU)
	.ascii	"41"	:: .align 4	:: .ascii	"AM2P"	// Mega Man Battle Network 2 (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"A6BP"	// Mega Man Battle Network 3 White (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"A3XP"	// Mega Man Battle Network 3 Blue (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"B4WP"	// Mega Man Battle Network 4 - Red Sun (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"B4BP"	// Mega Man Battle Network 4 - Blue Moon (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"BR4P"	// Mega Man Battle Network 4.5 - Real Operation (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"BRBP"	// Mega Man Battle Network 5 - Team ProtoMan (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"BRKP"	// Mega Man Battle Network 5 - Team Colonel (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"BR5P"	// Mega Man Battle Network 6 - Cybeast Gregar (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"BR6P"	// Mega Man Battle Network 6 - Cybeast Falzar (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"A89P"	// Mega Man Battle Chip Challenge (EU)
	.ascii	"08"	:: .align 4	:: .ascii	"XXXX"	// Unused
	.dh	0x0000
