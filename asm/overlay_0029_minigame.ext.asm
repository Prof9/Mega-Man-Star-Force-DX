.align 2
minigame_stationInit:
	push	r4,r14		// push extra for allocation
	bl	0x21B437C

	// Init variables
	add	r1,=minigame_stationVars
	mov	r0,0x0
	str	r0,[r1,0x4]
	mov	r0,0x60
	strb	r0,[r1]		// cursor x
	mov	r0,0x60
	strb	r0,[r1,0x1]	// cursor y

	// Init trail
	add	r1,(@trail - minigame_stationVars)
	mov	r2,((4-1)*0x4)	// trail length
	mov	r0,0x0
@@trailLoop:
	strb	r0,[r1,r2]
	sub	r2,0x4
	bpl	@@trailLoop

	// Load cursor tiles
	ldr	r0,=0x211C998
	ldr	r1,=((18 << 16) | 12)	// fieldminigame_12
	bl	0x2012518
	mov	r4,r0

	// Copy cursor tiles into VRAM
	mov	r1,0x0
	mov	r2,0x3
	lsl	r2,r2,0xC	// 0x6403000
	mov	r3,r4
	mov	r0,(filesize(TEMP+"/stationcomp-cursor.img.bin") / 0x40)
	lsl	r0,r0,0x6
	push	r0
	bl	0x202F0F4	// copy into OBJ VRAM

	// Free cursor tiles
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r4
	bl	0x2015620

	pop	r0,r4,r15	// pop extra for allocation


.align 2
minigame_stationCursor:
	push	r4-r7,r14
	sub	sp,0xC
	mov	r4,r0
	add	r7,=minigame_stationVars

	// Trail speed = 1
	mov	r0,0x1
	str	r0,[sp,0x8]

	// Clear button pressed
	mov	r0,0xFF
	strb	r0,[r7,0x3]	// button pressed

	// Check if in idle/drawing state
	ldrb	r0,[r4]
	cmp	r0,0x1
	bgt	@@spawnParticle

	// Check if touching screen
	ldr	r1,=0x2121040
	ldrh	r0,[r1,0xE]
	cmp	r0,0x0
	bne	@@checkStart

	// Copy position
	ldrh	r0,[r1,0x8]
	strb	r0,[r7]
	ldrh	r0,[r1,0xA]
	strb	r0,[r7,0x1]
	b	@@spawnParticle

@@checkStart:
	ldr	r0,=0x211DD1C
	ldrh	r0,[r0,0x2]	// button down
	lsr	r0,r0,0x4	// test 0x8
	bcc	@@checkDpad

	// Trigger "OK"
	mov	r0,0x2		// OK
	strb	r0,[r7,0x3]	// button pressed
	b	@@spawnParticle

@@checkDpad:
	// Get D-pad input
	ldr	r2,=0x211DD1C
	ldrb	r3,[r2]		// Only read lower 8 bits
	lsr	r2,r3,0x4
	lsl	r2,r2,0x1

	// Get position
	ldrb	r0,[r7]		// cursor x
	ldrb	r1,[r7,0x1]	// cursor y

	// Get movement delta
	add	r5,=@@moveSpeeds
	add	r5,r5,r2

	mov	r2,0x2		// Double speed if nothing held
	lsr	r3,r3,0x2	// test 0x2
	bcc	@@checkHeld
	mov	r2,0x4		// Quadruple speed if B held
@@checkHeld:
	ldrb	r3,[r4]
	cmp	r3,0x1
	bne	@@updatePos
	mov	r2,0x1		// Single speed if drawing

@@updatePos:
	// Update x-position
	mov	r3,0x0
	ldsb	r3,[r5,r3]	// x-delta
	mul	r3,r2
	add	r0,r0,r3

	// Update y-position
	mov	r3,0x1
	ldsb	r3,[r5,r3]	// y-delta
	mul	r3,r2
	add	r1,r1,r3

@@checkMinX:
	cmp	r0,0x0
	bge	@@checkMaxX
	mov	r0,0x0

@@checkMaxX:
	cmp	r0,0xFF
	ble	@@checkMinY
	mov	r0,0xFF

@@checkMinY:
	cmp	r1,0x0
	bge	@@checkMaxY
	mov	r1,0x0

@@checkMaxY:
	cmp	r1,0xBF
	ble	@@storePosition
	mov	r1,0xBF

@@storePosition:
	strb	r0,[r7]		// cursor x
	strb	r1,[r7,0x1]	// cursor y

@@checkTouch:
	// Check A Button held
	ldr	r0,=0x211DD1C
	ldrh	r0,[r0]
	lsr	r0,r0,0x1	// test 0x01
	bcc	@@spawnParticle

	// Set up simulated touch
	ldr	r1,=0xF037
	bl	0x2024018	// set flag

	// Store x-position
	mov	r0,((0xF2E0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// r0 = ptr to x coordinate
	ldrb	r1,[r7]		// cursor x
	strb	r1,[r0]

	// Store y-position
	mov	r0,((0xF2E8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// r0 = ptr to y coordinate
	ldrb	r1,[r7,0x1]	// cursor y
	strb	r1,[r0]

@@spawnParticle:
	// Spawn new particle every 4 frames
	ldrb	r0,[r7,0x2]
	lsl	r1,r0,0x1E
	lsr	r1,r1,0x1E
	bne	@@updateTrail

	// Spawn new particle
	lsr	r1,r0,0x2
	lsl	r0,r1,0x2
	add	r5,r7,(@trail - minigame_stationVars)
	add	r5,r5,r0	// particle

	mov	r0,0x1
	strb	r0,[r5]		// trail speed
	mov	r0,0x0
	strb	r0,[r5,0x1]	// trail timer

	ldrb	r0,[r7]		// cursor x
	add	r0,0x3
	lsl	r2,r1,0x1F
	lsr	r2,r2,0x1E
	add	r0,r0,r2
	strb	r0,[r5,0x2]	// trail x
	ldrb	r0,[r7,0x1]	// cursor y
	sub	r0,0x7
	strb	r0,[r5,0x3]	// trail y

@@updateTrail:
	add	r5,r7,(@trail - minigame_stationVars)
	mov	r6,0x4		// trail length

@@trailLoop:
	ldrb	r0,[r5]		// speed
	cmp	r0,0x0
	beq	@@trailNext

	ldrb	r2,[r5,0x2]	// x
	lsl	r2,r2,0x10

	// Increment y
	ldrb	r3,[r5,0x3]	// y
	ldrb	r0,[r5,0x1]	// timer
	ldrb	r1,[r5]		// speed
	mul	r0,r1
	add	r3,r3,r0

	orr	r2,r3		// x, y

	// Increment timer
	ldrb	r0,[r5,0x1]	// timer
	cmp	r0,0xC		// duration
	bge	@@trailNext
	add	r1,r0,0x1
	strb	r1,[r5,0x1]

	ldr	r3,=0x34C0
	add	r3,0x2
	lsr	r0,r0,2
	add	r3,r3,r0

	// Draw particle
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	bl	0x1FF8F40

@@trailNext:
	add	r5,0x4		// next particle
	sub	r6,0x1
	bne	@@trailLoop

@@drawCursor:
	// Size: 16x16
	mov	r2,0x4
	lsl	r2,r2,0x1C
	ldr	r3,=0x34C0

	// Animation timer
	ldrb	r0,[r7,0x2]
	add	r1,r0,0x1
	lsl	r1,r1,0x1C
	lsr	r1,r1,0x1C
	strb	r1,[r7,0x2]
//	lsr	r0,r0,0x1
//	lsl	r0,r0,0x1
//	add	r3,r3,r0

	// Cursor coords
	ldrb	r0,[r7]		// cursor x
//	sub	r0,0x4
	sub	r0,0x2
	lsl	r0,r0,0x17
	lsr	r0,r0,0x7
	add	r2,r2,r0

	ldrb	r1,[r7,0x1]	// cursor y
//	sub	r1,0x5
	sub	r1,0xD
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	add	r2,r2,r1

	// Draw cursor
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	bl	0x1FF8F40

	// Run normal state function
	mov	r0,r4
	bl	0x21B402C
	add	sp,0xC
	pop	r4-r7,r15

.align 4
@@moveSpeeds:
	.db	0x00,0x00
	.db	0x01,0x00	// Right
	.db	0xFF,0x00	// Left
	.db	0x00,0x00
	.db	0x00,0xFF	// Up
	.db	0x01,0xFF	// Up+Right
	.db	0xFF,0xFF	// Up+Left
	.db	0x00,0xFF	// Up
	.db	0x00,0x01	// Down
	.db	0x01,0x01	// Down+Right
	.db	0xFF,0x01	// Down+Left
	.db	0x00,0x01	// Down
	.db	0x00,0x00
	.db	0x01,0x00	// Right
	.db	0xFF,0x00	// Left
	.db	0x00,0x00


.align 2
minigame_stationButtons:
	push	r14
	add	r1,=minigame_stationVars
	ldrb	r1,[r1,0x3]	// button pressed
	cmp	r1,0xFF
	beq	@@normal

	mov	r0,r1
	b	@@end

@@normal:
	// Get button press from touch screen
	bl	0x21B4B38

@@end:
	pop	r15


	.pool

.align 4
minigame_stationVars:
	.db	0x0	// cursor x
	.db	0x0	// cursor y
	.db	0x0	// animation timer
	.db	0x0	// button pressed

@trail:
	.db	0x0	// trail 1 speed
	.db	0x0	// trail 1 timer
	.db	0x0	// trail 1 x
	.db	0x0	// trail 1 y

	.db	0x0	// trail 2 speed
	.db	0x0	// trail 2 timer
	.db	0x0	// trail 2 x
	.db	0x0	// trail 2 y

	.db	0x0	// trail 3 speed
	.db	0x0	// trail 3 timer
	.db	0x0	// trail 3 x
	.db	0x0	// trail 3 y

	.db	0x0	// trail 4 speed
	.db	0x0	// trail 4 timer
	.db	0x0	// trail 4 x
	.db	0x0	// trail 4 y
