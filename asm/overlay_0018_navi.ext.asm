.align 2
navi_thermoCursor:
	push	r0-r1,r14	// r4,r6-r7 free, push extra for allocation
	add	r7,=navi_thermoVars

	// Check D-pad
	ldr	r3,=0x211DD1C
	ldrh	r2,[r3,0x8]	// repeated buttons down

	ldrb	r0,[r7]		// old cursor index
	mov	r6,r0		// new cursor index

@@checkDown:
	lsl	r2,r2,0x19	// test 0x80
	bcc	@@checkUp
	add	r6,0x1
	cmp	r6,0x3
	blt	@@checkUp
	mov	r6,0x0

@@checkUp:
	lsl	r2,r2,0x1	// test 0x40
	bcc	@@storeCursor
	sub	r6,0x1
	bpl	@@storeCursor
	mov	r6,0x2

@@storeCursor:
	strb	r6,[r7]		// new cursor index
	cmp	r0,r6
	beq	@@drawCursor

	// Play cursor SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x88
	bl	0x2025574	// play SFX

@@drawCursor:
	ldr	r2,=0x40A3001C
	mov	r0,0x30
	mul	r0,r6
	add	r6,r2,r0	// OAM 0, 1

	ldr	r3,=0xE3E4
	ldrb	r0,[r7,0x1]	// animation timer
	lsl	r1,r0,0x1B
	lsr	r1,r1,0x1F
	lsl	r1,r1,0x1
	add	r3,r3,r1
	add	r0,0x1
	strb	r0,[r7,0x1]	// animation timer

	mov	r4,0x0
@@drawLoop:
	// Set hflip/vflip
	mov	r2,r6
	lsl	r0,r4,0x1C
	orr	r2,r0

@@drawAddX:
	lsr	r0,r4,0x1	// test 0x1
	bcc	@@drawAddY
	mov	r0,0x29
	lsl	r0,r0,0x10
	add	r2,r2,r0

@@drawAddY:
	cmp	r4,0x2
	blt	@@drawSegment
	add	r2,0x17

@@drawSegment:
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	bl	0x1FF8F40

	add	r4,0x1
	cmp	r4,0x4
	blt	@@drawLoop

@@end:
	mov	r6,r5
	mov	r4,0x0
	pop	r0-r1,r15	// pop extra for deallocation

.align 2
navi_thermoChoose:
	push	r14

	// Check button touched
	bl	0x21B18F8
	add	r1,=navi_thermoVars
	cmp	r0,0x0
	bne	@@updateSelection

	// Check matches selected button
	ldrb	r0,[r1]
	cmp	r0,r4
	bne	@@returnFalse

	// Check A Button pressed
	ldr	r0,=0x211DD1C
	ldrh	r0,[r0,0x2]	// single buttons down
	lsr	r0,r0,0x1	// test 0x1
	bcc	@@returnFalse

@@updateSelection:
	// Update the selected button
	strb	r4,[r1]
//	b	@@returnTrue

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
//	b	@@end
@@end:
	pop	r15

.align 2
navi_thermoShow:
	push	r14

	mov	r0,0x1
	strb	r0,[r5,0xF]

	add	r1,=navi_thermoVars
	mov	r0,0x0
	strh	r0,[r1]		// init both index and timer

	pop	r15

	.pool

.align 4
navi_thermoVars:
	.db	0x0	// Cursor index
	.db	0x0	// Animation timer


.align 2
navi_keyInit:
	mov	r1,r0

	add	r0,=navi_keyVars
	mov	r2,0x0
	str	r2,[r0]

	mov	r0,r5
	bx	r14


.align 2
navi_keyCursor:
	add	r7,=navi_keyVars

	// Clear button pressed
	mov	r0,0x0
	strb	r0,[r7,0x2]	// button pressed

	// Check D-pad
	ldr	r3,=0x211DD1C
	ldrh	r3,[r3,0x8]	// repeated buttons down

	ldrb	r0,[r7]		// cursor x
	ldrb	r1,[r7,0x1]	// cursor y
//	ldrh	r2,[r7]		// cursor x and y

@@checkDown:
	lsl	r3,r3,0x19	// test 0x80
	bcc	@@checkUp
	add	r1,0x1
	cmp	r1,0x4
	blt	@@checkUp
	mov	r1,0x0

@@checkUp:
	lsl	r3,r3,0x1	// test 0x40
	bcc	@@checkLeft
	sub	r1,0x1
	bpl	@@checkLeft
	mov	r1,0x3

@@checkLeft:
	lsl	r3,r3,0x1	// test 0x20
	bcc	@@checkRight
	sub	r0,0x1
	bpl	@@checkRight
	mov	r0,0x2

@@checkRight:
	lsl	r3,r3,0x1	// test 0x10
	bcc	@@checkStart
	add	r0,0x1
	cmp	r0,0x3
	blt	@@checkStart
	mov	r0,0x0

@@checkStart:
	ldr	r3,=0x211DD1C
	ldrh	r3,[r3,0x2]	// single buttons down
	lsl	r3,r3,0x1D	// test 0x08
	bcc	@@storeCursor
	mov	r0,0x2
	mov	r1,0x3

@@storeCursor:
	strb	r0,[r7]		// new cursor x
	strb	r1,[r7,0x1]	// new cursor y

//	ldrh	r0,[r7]		// cursor x and y
//	cmp	r0,r2		// check if cursor changed
//	beq	@@checkB

//	// Play cursor SFX
//	ldr	r0,=0x21206CC
//	ldr	r0,[r0]
//	mov	r1,0x88
//	bl	0x2025574

@@checkB:
	ldr	r3,=0x211DD1C
	ldrh	r3,[r3,0x2]	// single buttons down
	lsl	r3,r3,0x1F	// test 0x02
	bcc	@@checkA
	lsl	r0,r3,0x1	// test 0x01
	bcs	@@drawCursor	// if both A and B pressed, do nothing

	mov	r0,0xB		// BCK
	strb	r0,[r7,0x2]	// button pressed

	b	@@drawCursor

@@checkA:
	lsl	r3,r3,0x1	// test 0x01
	bcc	@@drawCursor

	ldrb	r0,[r7,0x1]	// cursor y
	mov	r1,0x3
	mul	r0,r1
	ldrb	r1,[r7]		// cursor x
	add	r0,r0,r1
	add	r0,0x1
	strb	r0,[r7,0x2]	// button pressed

@@drawCursor:
	ldr	r0,=0x212E420
	ldr	r1,[r0,0x8]

	mov	r0,0xB
	lsr	r1,r1,0x5
	bcc	@@setTile
	mov	r0,0x13

@@setTile:
	ldr	r3,[r4,0x14]
	lsr	r3,r3,0x6
	add	r3,r3,r0
	mov	r0,0xA
	lsl	r0,r0,0xC
	orr	r3,r0

	mov	r2,0x2		// size: 32x32
	lsl	r2,r2,0x1E

	ldrb	r0,[r7]		// cursor x
	mov	r1,0x1C
	mul	r0,r1
	add	r0,0x16		// x-position
	lsl	r0,r0,0x10
	add	r2,r2,r0

	ldrb	r0,[r7,0x1]	// cursor y
	mov	r1,0x14
	mul	r0,r1
	add	r0,0x2E		// y-position
	add	r2,r2,r0

	// Draw cursor
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	bl	0x1FF8F40

	add	sp,0x10
	pop	r3-r7,r15

.align 2
navi_keyPress:
	push	r7,r14
	add	r7,=navi_keyVars

	// Check touch screen
	bl	0x21B18F8
	cmp	r0,0x1
	bne	@@checkButton

	// Change cursor position
	mov	r0,r4
	mov	r1,0x3
	blx	0x20AED80	// DivRem

	strb	r1,[r7]		// cursor x
	strb	r0,[r7,0x1]	// cursor y

	b	@@returnTrue

@@checkButton:
	ldrb	r0,[r7,0x2]
	sub	r0,0x1
	cmp	r0,r4
	bne	@@returnFalse

	// Clear button pressed
	mov	r0,0x0
	strb	r0,[r7,0x2]	// button pressed

@@returnTrue:
	mov	r0,0x1
	b	@@end

@@returnFalse:
	mov	r0,0x0

@@end:
	pop	r7,r15

.align 4
navi_keyVars:
	.db	0x0	// cursor x
	.db	0x0	// cursor y
	.db	0x0	// button pressed
	.db	0x0


.align 2
navi_pitcherButton:
	push	r14

	// Check touch screen
	bl	0x21B18F8
	cmp	r0,0x1
	beq	@@end

	// Check A Button pressed down
	ldr	r0,=0x211DD1C
	ldrh	r0,[r0,0x2]
	lsl	r0,r0,0x1F
	lsr	r0,r0,0x1F

@@end:
	pop	r15


.align 2
navi_shovelButton1:
	push	r14

	// Check touch screen
	bl	0x21B18F8
	cmp	r0,0x1
	beq	@@end

	// Check left OR right pressed down
	ldr	r1,=0x211DD1C
	ldrb	r0,[r1,0x2]
	lsl	r0,r0,0x1A
	lsr	r0,r0,0x1E
	beq	@@false

	// Check left/right not already pressed down
	ldrb	r1,[r1]
	lsl	r1,r1,0x1A
	lsr	r1,r1,0x1E
	orr	r0,r1
	cmp	r0,0x3
	beq	@@false

	mov	r0,0x1
	b	@@end
@@false:
	mov	r0,0x0
@@end:
	pop	r15

.align 2
navi_shovelButton2:
	push	r14

	// Check touch screen
	bl	0x21B18C4
	cmp	r0,0x1
	beq	@@end

	// Check left/right held down
	ldr	r0,=0x211DD1C
	ldrb	r0,[r0]
	mov	r1,0x30
	and	r0,r1
	beq	@@end

	mov	r0,0x1
@@end:
	pop	r15

.align 2
navi_shovelButton3:
	// Check both left+right held down
	ldr	r2,=0x211DD1C
	ldrb	r0,[r2]
	add	r2,0x10
	lsl	r1,r0,0x1A
	lsr	r1,r1,0x1E
	cmp	r1,0x3
	bne	@@checkRight

	mov	r4,0x2
	b	@@end

@@checkRight:
	// Test 0x10
	lsr	r1,r0,0x5
	bcc	@@checkLeft
	mov	r4,0x3

	// Check long press
	ldrb	r1,[r2,0x10]
	cmp	r1,0x10
	blt	@@end
	mov	r4,0x4

@@checkLeft:
	// Test 0x20
	lsr	r1,r0,0x6
	bcc	@@end
	mov	r4,0x1

	// Check long press
	ldrb	r1,[r2,0xF]
	cmp	r1,0x10
	blt	@@end
	mov	r4,0x0

@@end:
	lsl	r1,r4,0x18
	mov	r0,r6
	bx	r14


	.pool
