.align 2
battleObj_hollowAura_init:
	push	r4-r5,r14
	mov	r5,r0		// object
	mov	r4,r1		// parent

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
//	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Set parent
	mov	r0,0xB0
	str	r4,[r5,r0]

	// Set alignment
	mov	r1,0x30
	ldrb	r0,[r4,r1]
	strb	r0,[r5,r1]

	// Make invisible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	bic	r1,r0
//	str	r1,[r5,0x20]

	// Set visible during dimming chip
//	ldr	r1,[r5,0x20]
	lsl	r0,r0,0x11	// 0x80000
	orr	r1,r0
	str	r1,[r5,0x20]

	// Set ???
//	ldr	r1,[r5,0x20]
//	lsr	r0,r0,0x7	// 0x1000
//	orr	r1,r0
//	str	r1,[r5,0x20]

	// Copy parent size
	mov	r0,r5
	mov	r1,r4
	add	r0,0x90
	add	r1,0x90
	bl	0x200DC28

	// Set rotation
	mov	r0,r5
	add	r0,0x78
	mov	r1,0x30
	ldrb	r1,[r5,r1]
	bl	0x2153408

	// Create thunder barrier dummy object
	ldr	r0,=((1 << 16) | (470))
	bl	@createDummy
	mov	r1,0xC4		// child 1
	str	r0,[r5,r1]

	// Create black magic dummy object
	ldr	r0,=((1 << 16) | (471))
	bl	@createDummy
	mov	r1,0xC8		// child 2
	str	r0,[r5,r1]

	// ???
	// TODO?

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
	push	r4-r6,r14
	sub	sp,0x4
	mov	r5,r0		// object
	mov	r4,0xB0
	ldr	r4,[r5,r4]	// parent
	mov	r0,0x13
	lsl	r0,r0,0x4
	add	r6,r5,r0	// object free space

	// Call parent panel position getter
	ldr	r1,[r4]
	ldr	r1,[r1,0x24]
	mov	r0,r4
	blx	r1
	// Store position
	mov	r1,0x68
	strh	r0,[r5,r1]

	// Calculate new real position
	mov	r0,r5
	mov	r1,r5
	add	r0,0x6C
	add	r1,0x68
	bl	0x2153380

@@checkBarrier:
	// Check barrier active
	mov	r0,0xAC
	ldr	r0,[r4,r0]	// parent collision
	ldr	r0,[r0,0x2C]
	lsr	r0,r0,0x2	// test 0x2
	bcs	@@thunderBarrier

	// Make invisible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	bic	r1,r0
	str	r1,[r5,0x20]

	// Initialize barrier
	mov	r0,0x0
	strb	r0,[r5,0x1C]	// thunder barrier state
	b	@@checkMagic

@@thunderBarrier:
	// Thunder barrier state machine
	ldrb	r0,[r5,0x1C]	// thunder barrier state
	cmp	r0,0x1
	beq	@@thunderBarrierState1
	bgt	@@thunderBarrierState2

@@thunderBarrierState0:
	// State 0: initialize
	mov	r0,0x1
	strb	r0,[r5,0x1C]	// thunder barrier state
	mov	r0,0x0
	strb	r0,[r5,0x1D]	// black magic state

	// Set barrier grow timer
	mov	r0,0x4
	str	r0,[r6,0x10]

	// Set initial size
	mov	r0,r5
	add	r0,0x90
	ldr	r1,=@barrierInitSize
	bl	0x200DC28

	// Unload model if loaded
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@loadThunderBarrierModel
	ldr	r0,=0x2117C44
	bl	0x2010A9C

@@loadThunderBarrierModel:
	// Load model and animation
	mov	r0,r5
	ldr	r1,=((1 << 16) | (470))
	ldr	r2,=((2 << 16) | (861))
	bl	0x21745FC

	// Set animation
	mov	r0,0x0
	mov	r1,0x31
	strb	r0,[r5,r1]

	// Queue up next animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (861))
	add	r2,0x1
	mov	r3,0x0
	bl	0x2010AF4

	// ???
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	mov	r2,0x3F
	bl	0x2011B24

	// Play barrier SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_HOLLOWBARRIER
	bl	0x2025574

@@thunderBarrierState1:
	// State 1: grow height
	// Increase barrier height
	mov	r2,0x94
	ldr	r1,[r5,r2]
	mov	r0,0x4
	lsl	r0,r0,0x8
	add	r1,r1,r0	
	str	r1,[r5,r2]

	// Decrement timer
	ldr	r0,[r6,0x10]
	sub	r0,0x1
	str	r0,[r6,0x10]
	bne	@@thunderBarrierState2
	mov	r0,0x2
	strb	r0,[r5,0x1C]	// thunder barrier state

@@thunderBarrierState2:
	// State 2: idle
	// Make visible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	orr	r1,r0
	str	r1,[r5,0x20]

	mov	r0,r5
	bl	0x217466C

	b	@@genericUpdate

@@checkMagic:
	// Check if parent is attacking
	ldrb	r0,[r4,0x1C]	// parent state
	cmp	r0,0xC		// Thunder Bazooka
	beq	@@checkHollowPanel
	cmp	r0,0xD		// Hollow Thunder
	beq	@@checkHollowPanel
	b	@@noMagic

@@checkHollowPanel:
	// Get parent position
	mov	r0,0x68
	ldsb	r0,[r4,r0]
	mov	r1,0x69
	ldsb	r1,[r4,r1]
	bl	hollow_isHollowPanel
	bne	@@blackMagic

@@noMagic:
	// Make invisible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	bic	r1,r0
	str	r1,[r5,0x20]

	mov	r0,0x0
	strb	r0,[r5,0x1D]	// black magic state
	b	@@genericUpdate

@@blackMagic:
	// Black magic state machine
	ldrb	r0,[r5,0x1D]	// black magic state
	cmp	r0,0x1
	beq	@@blackMagicState1

@@blackMagicState0:
	// State 0: initialize
	mov	r0,0x1
	strb	r0,[r5,0x1D]	// black magic state
	mov	r0,0x0
	strb	r0,[r5,0x1C]	// thunder barrier state

	// Set size
	mov	r0,r5
	add	r0,0x90
	ldr	r1,=@magicSize
	bl	0x200DC28

	// Unload model if loaded
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@loadBlackMagicModel
	ldr	r0,=0x2117C44
	bl	0x2010A9C

@@loadBlackMagicModel:
	// Load model and animation
	mov	r0,r5
	ldr	r1,=((1 << 16) | (471))
	ldr	r2,=((2 << 16) | (863))
	bl	0x21745FC

	// Set animation
	mov	r0,0x0
	mov	r1,0x31
	strb	r0,[r5,r1]

	// ???
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	mov	r2,0x3F
	bl	0x2011B24

	// Play black magic SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_MAGICCIRCLE
	bl	0x2025574

@@blackMagicState1:
	// State 1: idle
	// Make visible
	ldr	r1,[r5,0x20]
	mov	r0,0x4
	orr	r1,r0
	str	r1,[r5,0x20]

	mov	r0,r5
	bl	0x217466C

//	b	@@genericUpdate

@@genericUpdate:
	ldr	r1,[r5,0x20]
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	// Call object update (taken from Libra aura)
	mov	r0,r5
	bl	0x2159C9C

@@end:
	mov	r0,0x1
	add	sp,0x4
	pop	r4-r6,r15

.align 2
@despawn:
	mov	r0,0x0
	bx	r14

.align 2
@destruct:
	// Destroy dummy thunder barrier object
	mov	r2,0xC4
	ldr	r2,[r0,r2]
	mov	r1,0x2
	str	r1,[r2,0x18]

	// Destroy dummy black magic object
	mov	r2,0xC8
	ldr	r2,[r0,r2]
	mov	r1,0x2
	str	r1,[r2,0x18]

	// Call generic object destruct
	ldr	r3,=0x2174E9D
	bx	r3

.align 2
@dummySpawn:
	mov	r1,0x1
	str	r1,[r0,0x18]
	mov	r0,r1
	bx	r14

.align 2
@dummyUpdate:
	mov	r0,0x1
	bx	r14

.align 2
@dummyDespawn:
	mov	r0,0x0
	bx	r14


	.pool


.align 4
battleObj_hollowAura_funcs:
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

.align 4
battleObj_hollowAuraDummy_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@dummySpawn|1		// function 0x0C - object spawn
	.dw	@dummyUpdate|1		// function 0x10 - object update
	.dw	@dummyDespawn|1		// function 0x14 - object despawn
	.dw	0x2181E34|1		// function 0x18 - object constructor
	.dw	0x2174E9C|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - get panel position
	.dw	0x2154F9C|1		// function 0x28 - get old real position
	.dw	0x2154F8C|1		// function 0x2C - get new real position
	.dw	0x2154F7C|1		// function 0x30 - get rotation

.align 4
@barrierInitSize:
	.dw	0x1000, 0x0, 0x1000
.align 4
@magicSize:
	.dw	0x1000, 0x1000, 0x1000
