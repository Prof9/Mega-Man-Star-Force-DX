.align 2
battleObj_hollowBeam_init:
	push	r4-r6,r14
	sub	sp,0xC
	mov	r5,r0		// object
	mov	r4,r1		// parent
	mov	r6,r2		// level

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Set parent
	mov	r0,0xB0
	str	r4,[r5,r0]

	// ???
	mov	r0,0x1
	str	r0,[r5,0x14]

	// Set level
	mov	r0,0x34
	strb	r6,[r5,r0]

	// Set alignment
	mov	r1,0x30
	ldrb	r0,[r4,r1]
	strb	r0,[r5,r1]
	// Get direction from alignment
	bl	0x2153484
	push	r0

	// Set panel position
	mov	r1,0x68
	ldrb	r2,[r4,r1]	// parent x
	strb	r2,[r5,r1]	// object x

	mov	r1,0x69
	cmp	r6,0x2
	beq	@@panelPosFan

@@panelPosBeam:
	ldrb	r2,[r4,r1]	// parent y
	add	r2,r2,r0	// add direction
	b	@@realPos

@@panelPosFan:
	mov	r2,0x1		// front row

@@realPos:
	strb	r2,[r5,r1]	// object y

	// Set real position from panel position
	mov	r0,r5
	add	r0,0x6C
	sub	r1,r0,0x4
	bl	0x2153380

	pop	r3		// direction

	cmp	r6,0x2
	beq	@@realPosFan

@@realPosBeam:
	// Set y-position
	mov	r0,(0x69000 >> 0xC)
	lsl	r0,r0,0xC
	mov	r1,0x70
	str	r0,[r5,r1]

	// Adjust z-position
	mov	r2,0x74
	ldr	r0,[r5,r2]
	mov	r1,(0xC000 >> 0xC)
	lsl	r1,r1,0xC
	mul	r1,r3
	add	r0,r0,r1
	str	r0,[r5,r2]

	// Set rotation from alignment
	mov	r0,r5
	add	r0,0x78
	mov	r1,0x30
	ldrb	r1,[r5,r1]
	bl	0x2153408

	// Set rotation
	mov	r1,0x78
	mov	r0,(0x300 >> 0x8)
	lsl	r0,r0,0x8
	str	r0,[r5,r1]

	// Load model and initial animation
	ldr	r1,=((1 << 16) | (359))	// yellow
	ldr	r2,=((2 << 16) | (752))

	cmp	r6,0x1
	bne	@@loadModel
	ldr	r1,=((1 << 16) | (475))	// black
	b	@@loadModel

@@realPosFan:
	// Set y-position
	mov	r0,(0x34800 >> 0xA)
	lsl	r0,r0,0xA
	mov	r1,0x70
	str	r0,[r5,r1]

	// Load model and initial animation
	ldr	r1,=((1 << 16) | (476))	// black
	mov	r2,0x0
//	b	@@loadModel

@@loadModel:
	mov	r0,r5
	bl	0x21745FC

//	// Load loop/texture animation
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (754))
	cmp	r6,0x2
	bne	@@loadAnim

	add	r2,0x2	// 756

@@loadAnim:
	mov	r3,0x0
	bl	0x2010AF4

	// Set current animation
	mov	r0,0x80		// ???
	cmp	r6,0x2
	bne	@@setCurAnim
	mov	r0,0x0		// ???

@@setCurAnim:
	mov	r1,0x31
	strb	r0,[r5,r1]

	// Set up transformation matrix
	mov	r0,r5
	bl	0x2174908

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
	bl	0x2153F64
	mov	r1,0xAC
	str	r0,[r5,r1]

	// Set damage
	ldr	r1,=(350)	// 350 damage
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r1,=(600)
@@setDamage:
	str	r1,[r0,0x30]
	// Set hit effect
	mov	r1,0x7
	strb	r1,[r0,0xC]

	// Set range type
	mov	r1,0x5		// beam
	cmp	r6,0x2
	bne	@@setRange
	mov	r1,0xA		// fan

@@setRange:
	str	r1,[r0,0x20]

	// Set original range (can be nullified later)
	mov	r0,0xC4
	str	r1,[r5,r0]

	// Add effect: paralysis Lv1 (45i)
	mov	r0,r5
	mov	r1,0x0
	mov	r2,0x1
	bl	0x2174D80

	// Clear child 1
	mov	r0,0x0
	mov	r1,0xC8
	str	r0,[r5,r1]

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

	// Set fan out timer
	mov	r0,0x5
	strh	r0,[r5,0x28]

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_THUNDERBZ3
	cmp	r6,0x0
	beq	@@playSfx
	cmp	r6,0x2
	beq	@@end
	add	r1,(SE_THUNDERBZ3B - SE_THUNDERBZ3)
@@playSfx:
	bl	0x2025574

@@end:
	add	sp,0xC
	pop	r4-r6,r15

.align 2
@spawn:
	mov	r1,0x1
	str	r1,[r0,0x18]
	mov	r0,r1
	bx	r14

.align 2
@update:
	push	r4-r5,r14
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

	// Remove collision from other part too
	mov	r0,0x34
	ldrb	r0,[r4,r0]	// level
	mov	r1,0xC8		// child
	cmp	r0,0x2
	bne	@@removeCollisionOther

	mov	r1,0xB0		// parent

@@removeCollisionOther:
	ldr	r2,[r4,r1]	// other object
	cmp	r2,0x0
	beq	@@highlightPanels
	mov	r0,0xAC
	ldr	r1,[r2,r0]	// other collision
	cmp	r1,0x0
	beq	@@highlightPanels

	// Despawn other collision
	mov	r3,0x0
	str	r3,[r2,r0]

	ldr	r0,=0x21ADB70
	// r1 == collision
	bl	0x2154058

@@highlightPanels:
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	0x2153484	// direction
	mov	r3,r0

	mov	r0,0x68
	ldsb	r0,[r4,r0]	// x
	mov	r1,0x69
	ldsb	r1,[r4,r1]	// y

	mov	r2,0xC4
	ldr	r2,[r4,r2]	// range type

	bl	0x2153894	// highlight panels

@@checkLevel:
	// Check level
	mov	r0,0x34
	ldrb	r0,[r4,r0]	// level
	cmp	r0,0x1
	bne	@@animation

	// Do fan out timer
	ldrh	r0,[r4,0x28]
	sub	r0,0x1
	strh	r0,[r4,0x28]
	bne	@@animation

@@spawnFan:
	// Spawn fan out
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r5,r0		// child
	beq	@@initObj

	ldr	r0,=battleObj_hollowBeam_funcs
	str	r0,[r5]

@@initObj:
	ldr	r0,=0x212E2C0
	add	r1,r5,0x4
	mov	r2,r5
	mov	r3,0x1
	bl	0x2032BF0

	cmp	r5,0x0
	beq	@@animation

	mov	r0,r5		// fan object
	mov	r1,r4		// parent object
	mov	r2,0x2		// level
	bl	battleObj_hollowBeam_init

	mov	r0,0xC8
	str	r5,[r4,r0]	// child

	// Remove collision from child if already hit
	mov	r0,0xAC
	ldr	r0,[r4,r0]	// own collision
	cmp	r0,0x0
	beq	@@animation
	ldr	r0,[r0,0x20]	// own range type
	cmp	r0,0x0
	bne	@@animation
	mov	r1,0xAC
	ldr	r1,[r5,r1]	// child collision
	cmp	r1,0x0
	beq	@@animation
	// r0 == 0
	str	r0,[r1,0x20]	// child range type

@@animation:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	bne	@@advanceAnimation

	// Set animation
	mov	r1,0x31
	mov	r0,0x1		// loop
	strb	r0,[r4,r1]

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

	mov	r0,0x1
	pop	r4-r5,r15

.align 2
@despawn:
	mov	r0,0x0
	bx	r14

.align 2
@destruct:
	// Destroy child
	mov	r1,0xC8
	ldr	r2,[r0,r1]	// child
	cmp	r2,0x0
	beq	@@removeFromParent

	mov	r1,0x2
	str	r1,[r2,0x18]
	mov	r1,0x0
	str	r1,[r0,r1]

@@removeFromParent:
	mov	r1,0xB0
	ldr	r1,[r0,r1]	// parent
	cmp	r1,0x0
	beq	@@destroySelf

	mov	r3,0x34
	ldrb	r3,[r0,r3]	// level
	cmp	r3,0x2
	bne	@@isBeam

@@isFan:
	mov	r2,0xC8
	b	@@getParentChild

@@isBeam:
	// parent's child 3
	mov	r2,(0x19C >> 0x2)
	lsl	r2,r2,0x2

@@getParentChild:
	ldr	r3,[r1,r2]
	cmp	r3,r0
	bne	@@destroySelf

	// Remove self from parent
	mov	r3,0x0
	str	r3,[r1,r2]

@@destroySelf:
	// Call generic object destruct
	ldr	r3,=0x2174E9D
	bx	r3

	.pool


.align 4
battleObj_hollowBeam_funcs:
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
