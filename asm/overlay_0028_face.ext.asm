.align 2
face_colorMenuLeftRight:
	ldrh	r0,[r4,0x16]	// face index
	cmp	r0,(29)		// spacesuit
	beq	@@normal
	cmp	r0,(19)
	blt	@@normal

	// Abort
	bl	0x21B4722

@@normal:
	mov	r0,0x18
	ldsh	r1,[r4,r0]
	bx	r14


.align 2
face_colorMenuWrapLeft:
	mov	r0,(3 - 1)	// max color
	ldrh	r1,[r4,0x16]	// face index
	cmp	r1,(29)		// spacesuit
	bne	@@end
	mov	r0,(5 - 1)	// max color
@@end:
	strh	r0,[r4,0x18]
	bx	r14


.align 2
face_colorMenuWrapRight:
	ldsh	r0,[r4,r0]	// current color
	mov	r2,(3)		// max color
	ldrh	r1,[r4,0x16]	// face index
	cmp	r1,(29)		// spacesuit
	bne	@@end
	mov	r2,(5)		// max color
@@end:
	cmp	r0,r2
	bx	r14


.align 2
face_faceMenuNumber:
	mov	r1,0x16
	ldsh	r1,[r4,r1]
	cmp	r1,(19)
	blt	@@end
	sub	r1,(19)
@@end:
	bx	r14

.align 2
face_colorNumber:
	mov	r1,0x18
	ldsh	r1,[r4,r1]
	cmp	r1,(5 - 1)
	bne	@@end
	add	r1,(37 - 20 - 5 + 1)
@@end:
	bx	r14


.align 2
face_faceMenuWrapLeft:
	push	r7,r14
	mov	r7,(19 - 1)	// PREMADE19

	// Check game clear
	mov	r1,(0x800 >> 0x8)
	lsl	r1,r1,0x8
	bl	0x202409C
	cmp	r0,0x0
	beq	@@end

	mov	r7,(19 + 10 - 1 + 1)
@@end:
	strh	r7,[r4,0x16]
	pop	r7,r15


.align 2
face_faceMenuWrapRight:
	push	r6-r7,r14
	ldsh	r6,[r4,r0]
	mov	r7,(19)		// PREMADE19

	// Check game clear
	mov	r1,(0x800 >> 0x8)
	lsl	r1,r1,0x8
	bl	0x202409C
	cmp	r0,0x0
	beq	@@end

	mov	r7,(19 + 10 + 1)
@@end:
	cmp	r6,r7
	pop	r6-r7,r15


.align 2
face_showSpecialFacePics:
	push	r14
	cmp	r3,(19)
	blt	@@normal

	sub	r3,(19)
	lsl	r3,r3,0x2
	add	r6,=face_extraFacePicsBufferList
	b	@@end

@@normal:
	lsl	r3,r3,0x2
	add	r3,r4,r3

@@end:
	mov	r0,r4
	bl	face_updateMenu

	pop	r15


.align 2
face_updateMenu:
	push	r3-r4,r14
	mov	r4,r0

	ldrh	r0,[r4,0x16]
	cmp	r0,(19)
	bge	@@special

@@premade:
	// Set name to PREMADE
	ldr	r0,=0x58D0
	add	r0,r4,r0
	mov	r1,(24)
	bl	0x2020570	// set animation

	// Show color arrow left
	ldr	r0,=0x5754
	add	r0,r4,r0
	bl	0x202067C	// show sprite

	// Show color arrow right
	ldr	r0,=0x57EC
	add	r0,r4,r0
	bl	0x202067C	// show sprite

	// Check color
	ldrh	r0,[r4,0x18]
	cmp	r0,0x3
	blt	@@end
	mov	r0,0x2
	strh	r0,[r4,0x18]

	b	@@end

@@special:
	// Set name to SPECIAL
	ldr	r0,=0x58D0
	add	r0,r4,r0
	mov	r1,(36)
	bl	0x2020570	// set animation

	ldr	r0,=0x59B4
	add	r0,r4,r0
	mov	r1,(20)
	bl	0x2020570	// set animation

	ldrh	r0,[r4,0x16]
	cmp	r0,(29)
	bne	@@singleColor

	// Show color arrow left
	ldr	r0,=0x5754
	add	r0,r4,r0
	bl	0x202067C	// show sprite

	// Show color arrow right
	ldr	r0,=0x57EC
	add	r0,r4,r0
	bl	0x202067C	// show sprite

	b	@@end

@@singleColor:
	// Hide color arrow left
	ldr	r0,=0x5754
	add	r0,r4,r0
	bl	0x2020688	// hide sprite

	// Hide color arrow right
	ldr	r0,=0x57EC
	add	r0,r4,r0
	bl	0x2020688	// hide sprite

	// Set color to 1
	mov	r0,0x0
	strh	r0,[r4,0x18]

@@end:
	pop	r3-r4,r15


.align 2
face_pickSpecialFacePics:
	cmp	r1,(19)
	blt	@@normal

	sub	r1,(19)
	lsl	r1,r1,0x2
	add	r0,=face_extraFacePicsBufferList
	b	@@end

@@normal:
	lsl	r1,r1,0x2
	add	r1,r4,r1
@@end:
	bx	r14


.align 2
face_loadSpecialFacePics:
	// Check chapter Queen Ophiuca or later
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0,0x2]
	cmp	r0,0x40
	blt	@@loadExtraPics

	// Override Geo face pic with happy Geo
	ldr	r0,=0x211C998
	mov	r1,(0x160 >> 0x4)
	lsl	r1,r1,0x4
	ldr	r1,[r5,r1]	// first face pic
	ldr	r2,=((9 << 0x10) | (53))
	bl	0x201231C	// load file

@@loadExtraPics:
	mov	r4,0x0
@@loop:
	// Allocate buffer
	mov	r0,(0x1B0 >> 0x4)
	lsl	r0,r0,0x4
	ldr	r0,[r5,r0]
	mov	r1,(0x550 >> 0x4)
	lsl	r1,r1,0x4
	mov	r2,(23)		// 45 buffers total
	add	r2,r2,r4
	bl	0x2015E1C	// alloc buffer

	// Hang if out of memory
	cmp	r0,0x0
	beq	.

	// Get buffer
	mov	r0,(0x1B0 >> 0x4)
	lsl	r0,r0,0x4
	ldr	r0,[r5,r0]
	mov	r1,(23)
	add	r1,r1,r4
	bl	0x2015E94	// get buffer

	// Store buffer
	add	r1,=face_extraFacePicsBufferList
	lsl	r2,r4,0x2
	str	r0,[r1,r2]

	// Load face pic
	mov	r1,r0
	ldr	r0,=0x211C998
	ldr	r2,=((9 << 0x10) | (54))
	add	r2,r2,r4
	bl	0x201231C	// load file

	add	r4,0x1
	cmp	r4,(11)
	blt	@@loop

@@end:
	add	sp,0x18
	pop	r3-r7,r15


.align 4
face_extraFacePicsBufferList:
	.fill	(11) * 0x4


	.pool
