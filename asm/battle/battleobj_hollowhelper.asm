.align 2
battleObj_hollowHelper_init:
	push	r4-r5,r14
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

	// Make invisible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	bic	r1,r0
	str	r1,[r5,0x20]

	// Set Hollow panels
	mov	r0,0x0
	bl	hollow_setHollowPanels

	// Create cannon dummy object
	ldr	r0,=((1 << 16) | (472))
	bl	@createDummy
	mov	r1,0xC4		// child 1
	str	r0,[r5,r1]

	// Create yellow charge dummy object
	ldr	r0,=((1 << 16) | (473))
	bl	@createDummy
	mov	r1,0xC8		// child 2
	str	r0,[r5,r1]

	// Create yellow charge dummy object
	ldr	r0,=((1 << 16) | (474))
	bl	@createDummy
	mov	r1,0xCC		// child 3
	str	r0,[r5,r1]

	pop	r4-r5,r15

.align 2
@createDummy:
	push	r0,r4,r14

	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initObj

	ldr	r0,=battleObj_hollowAuraDummy_funcs
	str	r0,[r4]

@@initObj:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	// Load 3D model
	pop	r1
	mov	r0,r4
	beq	@@end
	mov	r2,0x0
	bl	0x21627C8

@@end:
	mov	r0,r4
	pop	r4,r15


.align 2
@spawn:
	mov	r1,0x1
	str	r1,[r0,0x18]
	mov	r0,r1
	bx	r14

.align 2
@update:
	mov	r0,0x1
	bx	r14

.align 2
@despawn:
	mov	r0,0x0
	bx	r14

.align 2
@destruct:
	// Destroy dummy cannon object
	mov	r2,0xC4
	ldr	r2,[r0,r2]
	mov	r1,0x2
	str	r1,[r2,0x18]

	// Destroy dummy yellow charge object
	mov	r2,0xC8
	ldr	r2,[r0,r2]
	mov	r1,0x2
	str	r1,[r2,0x18]

	// Destroy dummy black charge object
	mov	r2,0xCC
	ldr	r2,[r0,r2]
	mov	r1,0x2
	str	r1,[r2,0x18]

	// Call generic object destruct
	ldr	r3,=0x2174E9D
	bx	r3


	.pool


.align 4
battleObj_hollowHelper_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@spawn|1		// function 0x0C - object spawn
	.dw	@update|1		// function 0x10 - object update
	.dw	@despawn|1		// function 0x14 - object despawn
	.dw	0x2181E34|1		// function 0x18 - object constructor
	.dw	@destruct|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - get panel position
	.dw	0x2154F9C|1		// function 0x28 - get old real position
	.dw	0x2154F8C|1		// function 0x2C - get new real position
	.dw	0x2154F7C|1		// function 0x30 - get rotation
