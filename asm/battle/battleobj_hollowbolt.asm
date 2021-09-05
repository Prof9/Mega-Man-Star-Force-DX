.align 2
battleObj_hollowBolt_init:
	push	r4-r7,r14
	sub	sp,0xC
	mov	r5,r0		// object
	mov	r4,r1		// parent
	mov	r6,r2		// position (pointer)
	mov	r7,r3		// level

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Copy parent alignment
	mov	r1,0x30
	ldrb	r0,[r4,r1]
	strb	r0,[r5,r1]

	// Set level
	mov	r1,0x34
	strb	r7,[r5,r1]

	// Set ???
	mov	r0,0x1
	str	r0,[r5,0x14]

	// Set position
	mov	r1,0x68
	ldrh	r0,[r6]
	strh	r0,[r5,r1]

	// Set real position from panel position
	mov	r0,r5
	add	r0,0x6C
	sub	r1,r0,0x4
	bl	0x2153380

	// Set rotation from alignment
	mov	r0,r5
	add	r0,0x78
	mov	r1,0x30
	ldrb	r1,[r5,r1]
	bl	0x2153408

	// Load model
	mov	r0,r5
	ldr	r1,=((1 << 16) | (378))	// yellow
	ldr	r2,=((2 << 16) | (869))
	cmp	r7,0x0
	beq	@@loadModel
	ldr	r1,=((1 << 16) | (479))	// black
@@loadModel:
	bl	0x2174634

	// Load animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (872))
	mov	r3,0x0
	bl	0x2010AF4

	// Set animation
	mov	r0,0x0
	mov	r1,0x31
	strb	r0,[r5,r1]

	// Spawn collision
	mov	r0,0x3
	str	r0,[sp]
	str	r0,[sp,0x4]
	mov	r0,0x0
	str	r0,[sp,0x8]
	ldr	r0,=0x21ADB70
	mov	r1,r5
	mov	r2,0x2
	mov	r3,0x2
	bl	battle_isLegendMode
	beq	@@spawnCollision
	mov	r2,0x20		// breaking and invis piercing

@@spawnCollision:
	bl	0x2153F64
	mov	r1,0xAC
	str	r0,[r5,r1]

	// Set damage
	ldr	r1,=(350)		// 350 damage
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r1,=(600)
@@setDamage:
	str	r1,[r0,0x30]
	// Set range
	mov	r1,0x1
	str	r1,[r0,0x20]
	// Set hit effect
	mov	r1,0x7
	strb	r1,[r0,0xC]

	// Copy position to collision data
	mov	r0,r5
	bl	0x21748B0

	// Set model positions
	mov	r0,0xA8
	ldr	r0,[r5,r0]
	mov	r1,r5
	add	r1,0x6C
	bl	0x200DC28

	mov	r0,0xA8
	ldr	r0,[r5,r0]
	add	r0,0xC
	mov	r1,r5
	add	r1,0x78
	bl	0x200DC28

	// Set timer
	mov	r0,0x6
	strh	r0,[r5,0x28]

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_MGTHUNDER
	cmp	r7,0x0
	beq	@@playSfx
	add	r1,(SE_MGTHUNDERB - SE_MGTHUNDER)
@@playSfx:
	bl	0x2025574

	add	sp,0xC
	pop	r4-r7,r15

.align 2
@spawn:
	mov	r1,0x1
	str	r1,[r0,0x18]	// spawn state
	mov	r1,0x0
	strb	r1,[r0,0x1C]	// action
	mov	r0,0x1
	bx	r14

.align 2
@update:
	push	r4,r14
	sub	sp,0x4
	mov	r4,r0

	mov	r1,0xAC
	ldr	r1,[r4,r1]	// collision data
	cmp	r1,0x0
	beq	@@highlightPanels

	// Disable collision if hit something
	ldr	r0,[r1,0x6C]
	cmp	r0,0x0
	beq	@@highlightPanels
	mov	r0,0x0
	str	r0,[r1,0x20]

@@highlightPanels:
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	0x2153484	// direction
	mov	r3,r0

	mov	r0,0x68
	ldsb	r0,[r4,r0]	// x
	mov	r1,0x69
	ldsb	r1,[r4,r1]	// y

	mov	r2,0x1
	bl	0x2153894	// highlight panels

	// Check animation
	mov	r1,0x31
	ldrb	r0,[r4,r1]
	cmp	r0,0x1
	beq	@@anim1
	bgt	@@advanceAnimation

@@anim0:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r4,r1]
	cmp	r0,0x1
	bne	@@advanceAnimation

	// Set animation
	mov	r1,0x31
	mov	r0,0x1		// loop
	strb	r0,[r4,r1]

	// Load animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (872))
	add	r2,0x1
	mov	r3,0x0
	bl	0x2010AF4
	b	@@advanceAnimation

@@anim1:
	// Set animation
	mov	r1,0x31
	mov	r0,0x82		// dissipate
	strb	r0,[r4,r1]

	// Load animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (872))
	add	r2,0x2
	mov	r3,0x0
	bl	0x2010AF4
	b	@@advanceAnimation

@@advanceAnimation:
	// Advance animation
	mov	r0,r4
	bl	0x217466C

	// Advance texture animation
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2010894

	// Despawn timer
	ldrh	r0,[r4,0x28]
	sub	r0,0x1
	strh	r0,[r4,0x28]
	cmp	r0,0x0
	bne	@@end
	mov	r0,0x0		// despawn
	b	@@end2

@@end:
	mov	r0,0x1
@@end2:
	add	sp,0x4
	pop	r4,r15

.align 2
@despawn:
	mov	r0,0x0
	bx	r14

.align 2
@destruct:
	// Call generic object destruct
	ldr	r3,=0x2174E9D
	bx	r3

	.pool


.align 4
battleObj_hollowBolt_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@spawn|1		// function 0x0C - object spawn
	.dw	@update|1		// function 0x10 - object update
	.dw	@despawn|1		// function 0x14 - object despawn
	.dw	0x2181E34|1		// function 0x18 - object constructor
	.dw	@destruct|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - panel position getter
	.dw	0x2154F9C|1		// function 0x28 - get old position
	.dw	0x2154F8C|1		// function 0x2C - get new position
	.dw	0x2154F7C|1		// function 0x30 - get rotation
