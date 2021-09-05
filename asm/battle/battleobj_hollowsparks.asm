.align 2
battleObj_hollowSparks_init:
	push	r4-r5,r14
	sub	sp,0x4
	mov	r5,r0		// object
	mov	r4,r1		// parent

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Set parent
	mov	r0,0xB0
	str	r4,[r5,r0]

	// Set version
	mov	r1,0x30
	ldrb	r0,[r4,r1]
	strb	r0,[r5,r1]

	// {!!} state?
	mov	r0,0x2
	str	r0,[r5,0x14]

	// Enable update during pause (TODO: more flags?)
	ldr	r1,[r5,0x20]
	mov	r0,0x1
	orr	r1,r0
	str	r1,[r5,0x20]

	// Enable visible during dimming card
	ldr	r1,[r5,0x20]
	mov	r0,0x1
	lsl	r0,r0,0x13
	orr	r1,r0
	str	r1,[r5,0x20]

	// Load model
	mov	r0,r5
	ldr	r1,=((1 << 16) | (469))
	mov	r2,0x0
	bl	0x21745FC

	// Load animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (860))
	mov	r3,0x0
	bl	0x2010AF4

	// Set current animation
	mov	r1,0x31
	mov	r0,0x0
	strb	r0,[r5,r1]

	// Set up transformation matrix
	mov	r0,r5
	bl	0x2174908

	// Set model position
	mov	r0,0xA8
	ldr	r0,[r5,r0]
	mov	r1,r5
	add	r1,0x6C
	bl	0x200DC28

	// Set shadow position
	mov	r0,0xA8
	ldr	r0,[r5,r0]
	add	r0,0xC
	mov	r1,r5
	add	r1,0x78
	bl	0x200DC28

	// Set ???
	bl	0x2153904
	cmp	r0,0x0
	beq	@@end
	ldr	r1,[r5,0x20]
	mov	r0,0x1
	lsl	r0,r0,0xC
	orr	r1,r0
	str	r1,[r5,0x20]

@@end:
	add	sp,0x4
	pop	r4-r5,r15

.align 2
@spawn:
	mov	r1,0x1
	str	r1,[r0,0x18]
	mov	r0,r1
	bx	r14

.align 2
@update:
	push	r4-r5,r14
	mov	r5,r0

	// Call generic object update
//	mov	r0,r5
	bl	0x2159C9C

	// Get transformation matrix
	ldr	r0,=0x2117C44
	mov	r1,0xB0
	ldr	r1,[r5,r1]	// parent
	add	r1,0xA8
	ldr	r1,[r1]		// parent model
	mov	r2,0x2		// attachment point
	bl	0x1FF8168
	mov	r4,r0

	// Apply to own matrix
//	mov	r0,r4
	mov	r1,0xC0
	ldr	r1,[r5,r1]	// own model
	mov	r2,0x58
	blx	0x2090848	// MI_CpuCopy32

	mov	r0,0x1
	pop	r4-r5,r15

.align 2
@despawn:
	mov	r0,0x0
	bx	r14

	.pool


.align 4
battleObj_hollowSparks_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@spawn|1		// function 0x0C - object spawn
	.dw	@update|1		// function 0x10 - object update
	.dw	@despawn|1		// function 0x14 - object despawn
	.dw	0x2181E34|1		// function 0x18 - object constructor
	.dw	0x2174E9C|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - panel position getter
	.dw	0x2154F9C|1		// function 0x28 - get old position
	.dw	0x2154F8C|1		// function 0x2C - get new position
	.dw	0x2154F7C|1		// function 0x30 - get rotation
