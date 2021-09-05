.definelabel	@DAMAGE_FIRE,    240
.definelabel	@DAMAGE_AQUA,    240
.definelabel	@DAMAGE_ELEC,     80
.definelabel	@DAMAGE_WOOD,     80
.definelabel	@DAMAGE_FIRE_DX, 450
.definelabel	@DAMAGE_AQUA_DX, 450
.definelabel	@DAMAGE_ELEC_DX, 150
.definelabel	@DAMAGE_WOOD_DX, 150

.align 2
battleObj_hollowVirus_init:
	// r0 = object
	// r1 = parent
	// r2 = &0x00FF = element, &0xFF00 = level
	// r3 = position
	push	r4-r7,r14
	mov	r5,r0		// object
	mov	r4,r1		// parent
	mov	r6,r2		// element, level
	mov	r7,r3		// position

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
//	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Set parent
	mov	r1,0xB0
	str	r4,[r5,r1]

	// Copy alignment from parent
	mov	r1,0x30
	ldrb	r0,[r4,r1]
	strb	r0,[r5,r1]

	// Set ???
	mov	r0,0x1
	str	r0,[r5,0x14]

	// Set position
	mov	r2,0x68
	strh	r7,[r5,r2]

	// Set HP
	mov	r0,0x28		// 40 HP
	mov	r1,0x4C
	strh	r0,[r5,r1]
	mov	r1,0x4E
	strh	r0,[r5,r1]

	// Set level
	mov	r1,0x34
	lsr	r0,r6,0x8
	strb	r0,[r5,r1]

	// Set element
	mov	r1,0xC4
	lsl	r0,r6,0x18
	asr	r0,r0,0x18
	str	r0,[r5,r1]

	// Set flags
	ldr	r1,[r5,0x20]
	mov	r0,(0x80000 >> 0xC)	// visible during dim
	lsl	r0,r0,0xC
	orr	r1,r0
	str	r1,[r5,0x20]

	// Set real position from panel position
	mov	r0,r5
	mov	r1,r5
	add	r0,0x6C
	add	r1,0x68
	bl	0x2153380

	// Initialize 3D snapback position
	mov	r0,r5
	mov	r1,r5
	add	r0,0x5C
	add	r1,0x6C
	bl	0x200DC28

	// Set rotation from alignment
	mov	r0,r5
	add	r0,0x78
	mov	r1,0x30
	ldrb	r1,[r5,r1]
	bl	0x2153408

	// Load Black Magic model and animation
	mov	r0,r5
	ldr	r1,=((1 << 16) | (471))
	ldr	r2,=((2 << 16) | (863))
	bl	0x21745FC

	// Set current animation
	mov	r1,0x31
	mov	r0,0x0
	strb	r0,[r5,r1]

	// Set state and timer
	mov	r0,0x0
	str	r0,[r5,0x1C]	// states
	strh	r0,[r5,0x28]	// timer

	// Reserve panel
	mov	r0,r5
	mov	r1,r5
	add	r1,0x68
	mov	r2,0x0
	bl	0x21748C4

	pop	r4-r7,r15


.align 2
@spawn:
	mov	r1,0x1
	str	r1,[r0,0x18]	// spawn state
	mov	r1,0x0
	strb	r1,[r0,0x1C]	// action state
	mov	r0,0x1
	bx	r14


.align 2
@update:
	push	r4,r14
	mov	r4,r0

	// Check state
	ldrb	r0,[r4,0x1C]	// state
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1
	cmp	r0,0x3
	blt	@@state2
	beq	@@state3

@@state0:
	// Do timer
	ldrh	r0,[r4,0x28]	// timer
	add	r0,0x1
	strh	r0,[r4,0x28]	// timer
	cmp	r0,0x5
	blt	@@advanceAnimation

	// Unload model
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	ldr	r0,=0x2117C44
	bl	0x2010A9C

	// Spawn warp effect
	mov	r0,0x2
	mov	r1,r4
	mov	r2,r4
	mov	r3,r4
	add	r1,0x6C
	add	r2,0x78
	add	r3,0x90
	bl	0x215379C

	mov	r0,0x1
	str	r0,[r4,0x1C]	// states
	mov	r0,0x0
	strh	r0,[r4,0x28]	// timer
	b	@@end

@@state1:
	mov	r0,0x2
	str	r0,[r4,0x1C]	// states

	mov	r0,r4
	bl	@spawnVirus

	// Play appear SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_SUMMONVIRUS
	bl	0x2025574

	// Unreserve panel
	mov	r0,r4
	mov	r1,r4
	add	r1,0x68
	bl	0x21748E4

	b	@@end

@@state2:
	// Handle damage
	mov	r0,r4
	mov	r1,0x0
	bl	0x2181E78

	// Spawn hit effects
	mov	r0,r4
	bl	0x21749D0

@@checkHP:
	// Check HP reached 0
	mov	r0,0x4C
	ldsh	r0,[r4,r0]
	cmp	r0,0x0
	bgt	@@updateVirus

	// Destroy self
	mov	r0,0x2
	str	r0,[r4,0x18]

	// Destroy child 1
	mov	r3,0x0
	mov	r2,0xB4
	ldr	r1,[r4,r2]
	cmp	r1,0x0
	beq	@@spawnExplosion
	str	r0,[r1,0x18]
	str	r3,[r4,r2]

@@spawnExplosion:
	// Spawn explosion
	mov	r0,0x0
	mov	r1,r4
	mov	r2,r4
	mov	r3,r4
	add	r1,0x6C
	add	r2,0x78
	add	r3,0x90
	bl	0x215379C

	// Play explode SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x70
	bl	0x2025574

	// Unreserve panel
	mov	r0,r4
	mov	r1,r4
	add	r1,0x68
	bl	0x21748E4

	b	@@end

@@updateVirus:
	// Check if paused or dimmed
	ldr	r0,=0x21ACC6C
	ldr	r0,[r0,0x30]
	lsr	r1,r0,0x1	// test 0x1 - running
	bcc	@@end
	lsr	r1,r0,0x3	// test 0x4 - dim
	bcs	@@end

	mov	r0,r4
	bl	@updateVirus

	// Check if should despawn
	ldrb	r0,[r4,0x1C]	// state
	cmp	r0,0x3
	beq	@@state3

@@advanceAnimation:
	// Advance model animation
	mov	r0,r4
	bl	0x217466C

	// Advance texture animation 1
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2010894

	b	@@end

@@state3:
	// Spawn warp effect
	mov	r0,0x2
	mov	r1,r4
	mov	r2,r4
	mov	r3,r4
	add	r1,0x6C
	add	r2,0x78
	add	r3,0x90
	bl	0x215379C

	// Despawn self
	mov	r0,0x2
	str	r0,[r4,0x18]

	mov	r0,0x0
	b	@@end2

@@end:
	mov	r0,0x1
@@end2:
	pop	r4,r15


@despawn:
	mov	r0,0x0
	bx	r14


.align 2
@destruct:
	push	r4,r14
	mov	r4,r0

	mov	r1,0xB0
	ldr	r1,[r4,r1]	// parent
	cmp	r1,0x0
	beq	@@destroySelf

	// Spawned virus object
	mov	r2,0xDC
	ldr	r3,[r1,r2]
	cmp	r3,r4
	bne	@@destroySelf

	// Remove self from parent
	mov	r3,0x0
	str	r3,[r1,r2]

@@destroySelf:
	// ???
	ldr	r0,=0x21ACC6C
	mov	r1,r4
	bl	0x21512A8

	// Call generic object destruct
	mov	r0,r4
	bl	0x2174E9C

	pop	r4,r15


.align 2
@spawnVirus:
	push	r4-r7,r14
	sub	sp,0xC
	mov	r5,r0		// object

	// Load element
	mov	r6,0xC4
	ldr	r6,[r5,r6]	// element
	// Load level
	mov	r7,0x34
	ldrb	r7,[r5,r7]	// level

	// Get virus data
	ldr	r4,=@virusData
	mov	r0,@VIRUSDATA_SIZE
	mul	r0,r6
	add	r4,r4,r0	// virus data

	// Set ID
	ldrb	r0,[r4]		// ID
	add	r0,r0,r7	// ID + level
	strh	r0,[r5,0x36]

	// Load model and model animation
	mov	r0,r5
	ldr	r1,[r4,0x4]	// model
	ldr	r2,[r4,0xC]	// model animation
	bl	0x21745FC

	// Set animation
	mov	r0,0x0
	mov	r1,0x31
	strb	r0,[r5,r1]

	// Load texture
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,[r4,0x8]	// texture
	add	r2,r2,r7	// texture + level
	mov	r3,0x0
	bl	0x2010EB8

	// Load texture animation
	ldr	r2,[r4,0x10]	// texture animation
	cmp	r2,0x0
	beq	@@collision
	mov	r0,0x1
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	mov	r3,0x0
	bl	0x2010AF4

@@collision:
	// Create collision data
	mov	r0,0x3
	str	r0,[sp]
	ldrb	r0,[r4,0x1]	// element
	str	r0,[sp,0x4]
	mov	r0,0x0
	str	r0,[sp,0x8]
	ldr	r0,=0x21ADB70
	mov	r1,r5
	mov	r2,0x6
	mov	r3,0x4
	bl	0x2153F64
	mov	r1,0xAC
	str	r0,[r5,r1]

	// Set damage
	mov	r1,0x4C
	ldsh	r1,[r5,r1]	// HP
	str	r1,[r0,0x30]
	// Set range
	mov	r1,0x1
	str	r1,[r0,0x20]
//	// Set hit effect
//	ldrb	r1,[r4,0x2]	// hit effect
//	strb	r1,[r0,0xC]

	// Copy position to collision
	mov	r0,r5
	bl	0x21748B0

	// Set up transformation matrix
	mov	r0,r5
	bl	0x2174908

	// Spawn shadow
	mov	r0,r5
	mov	r1,r4
	add	r1,0x20		// shadow size
	bl	0x2153838
	mov	r1,0xBC
	str	r0,[r5,r1]

	// Set model size
	mov	r0,r5
	add	r0,0x90
	mov	r1,r4
	add	r1,0x14		// model size
	bl	0x200DC28

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

	// Set update during dim
	ldr	r1,[r5,0x20]
	mov	r0,(0x1000 >> 0xC)
	lsl	r0,r0,0xC
	orr	r1,r0
	str	r1,[r5,0x20]

	add	sp,0xC
	pop	r4-r7,r15


	.pool


.align 2
@updateVirus:
	push	r14

	mov	r1,0xC4
	ldr	r1,[r0,r1]	// element
	add	r2,=@updateVirusFuncs
	lsl	r1,r1,0x2
	ldr	r1,[r2,r1]
	blx	r1

	pop	r15

.align 4
@updateVirusFuncs:
	.dw	@updateVirusMelamander|1
	.dw	@updateVirusStreamCancro|1
	.dw	@updateVirusEyez|1
	.dw	@updateVirusTropiConga|1


.align 2
@updateVirusMelamander:
	push	r4-r5,r14
	mov	r5,r0		// object

	// Check substate
	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1
	bgt	@@state2

@@state0:
	// Attack wind up
	mov	r1,0x31
	mov	r0,0x1
	strb	r0,[r5,r1]

	// Next substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]
	b	@@end

@@state1:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	bne	@@end

	// Attack loop
	mov	r1,0x31
	mov	r0,0x2
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x13
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]

@@spawnFlames:
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initFlames

	// Set object functions
	ldr	r0,=0x21ABF8C
	str	r0,[r4]

@@initFlames:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	// Initialize object
	sub	sp,0x18

	mov	r3,0x30
	ldrb	r0,[r5,r3]	// alignment
	str	r0,[sp]		// u8

	bl	0x2153484	// r0 = direction
	mov	r1,sp

	mov	r3,0x68
	ldsb	r2,[r5,r3]	// x
	mov	r3,0x69
	strb	r2,[r1,0x2]
	ldsb	r2,[r5,r3]	// y
	add	r2,r2,r0	// y += direction
	strb	r2,[r1,0x3]

	str	r5,[r1,0x4]	// parent

	ldr	r0,=@DAMAGE_FIRE
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r0,=@DAMAGE_FIRE_DX
@@setDamage:
	str	r0,[r1,0xC]

	mov	r3,0x34
	ldrb	r0,[r5,r3]	// level
	strb	r0,[r1,0x1]

	ldrh	r0,[r5,0x28]	// duration
	add	r0,0x6
	strh	r0,[r1,0x8]
	mov	r0,0x3		// ?
	strh	r0,[r1,0xA]
	strb	r0,[r1,0x10]
	strb	r0,[r1,0x11]

	mov	r0,0x90
	ldr	r0,[r5,r0]	// x scaling
	str	r0,[r1,0x14]

	mov	r0,r4
	mov	r2,0x0
	mov	r3,0x0
	bl	0x218AC98

	add	sp,0x18
	b	@@end

@@state2:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Despawn (next state)
	mov	r0,0x3
	str	r0,[r5,0x1C]

@@end:
	pop	r4-r5,r15


@updateVirusStreamCancro:
	push	r4-r5,r14
	mov	r5,r0		// object

	// Check substate
	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1

@@state0:
	// Idle
//	mov	r1,0x31
//	mov	r0,0x0
//	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x3
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]

	// Set bubble count
	mov	r0,0x0
	strb	r0,[r5,0x1E]	// bubble count

@@state1:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Set timer
	mov	r0,0x5
	strh	r0,[r5,0x28]

	// Attack animation
	mov	r1,0x31
	mov	r0,0x3
	strb	r0,[r5,r1]

	// Increment bubble count
	ldrb	r0,[r5,0x1E]
	add	r0,0x1
	strb	r0,[r5,0x1E]
	cmp	r0,0x4
	blt	@@spawnBubble

	// Despawn (next state)
	mov	r0,0x3
	str	r0,[r5,0x1C]
	b	@@end

@@spawnBubble:
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initBubble

	// Set object functions
	ldr	r0,=0x21AB08C
	str	r0,[r4]

@@initBubble:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	// Initialize object
	mov	r0,r4		// object
	mov	r1,0x34
	ldrb	r1,[r5,r1]	// level
	mov	r2,r5
	add	r2,0x68		// panel position
	mov	r3,0x30
	ldrb	r3,[r5,r3]	// alignment
	bl	0x2184568

	// Set damage
	mov	r1,0xAC
	ldr	r1,[r4,r1]	// collision
	ldr	r0,=@DAMAGE_AQUA
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r0,=@DAMAGE_AQUA_DX
@@setDamage:
	str	r0,[r1,0x30]

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0xC2
	bl	0x2025574

@@end:
	pop	r4-r5,r15


@updateVirusEyez:
	push	r4-r5,r14
	sub	sp,0x4
	mov	r5,r0		// object

	// Check substate
	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1
	cmp	r0,0x3
	blt	@@state2
	beq	@@state3

@@state0:
	// Idle
//	mov	r1,0x31
//	mov	r0,0x0
//	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x3
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]

@@state1:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Attack wind up
	mov	r1,0x31
	mov	r0,0x81		// disable texture animation loop
	strb	r0,[r5,r1]

	// Load texture animation
	mov	r0,0x2
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	ldr	r2,=((2 << 16) | (152))
	mov	r3,0x0
	bl	0x2010AF4

	// Set timer
	mov	r0,0x5
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]

@@state2:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Attack delay
	mov	r1,0x31
	mov	r0,0x2
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x6
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x3
	strb	r0,[r5,0x1D]

	// Remove texture animation
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	mov	r2,0x2
	bl	0x2010BF4

	// Spawn lock-on effect
	mov	r0,0x30
	ldrb	r0,[r5,r0]		// alignment
	mov	r1,sp
	mov	r2,0x68
	ldsb	r2,[r5,r2]		// panel x-position
	str	r2,[r1]
	mov	r2,0x1			// panel y-position
	strb	r2,[r1,0x1]
	mov	r2,(0x5 + 3*0x5)	// duration
	mov	r3,r5			// parent
	bl	0x216FC24

	// Set sparks count
	mov	r0,0x3
	strb	r0,[r5,0x1E]	// sparks count

@@state3:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Set timer
	mov	r0,0x5
	strh	r0,[r5,0x28]

	// Attack animation
	mov	r1,0x31
	mov	r0,0x3
	strb	r0,[r5,r1]

	// Decrement sparks count
	ldrb	r0,[r5,0x1E]
	sub	r0,0x1
	strb	r0,[r5,0x1E]
	cmp	r0,0x2
	beq	@@spawnChild
	cmp	r0,0x0
	bge	@@spawnSparks

	// Despawn (next state)
	mov	r0,0x3
	str	r0,[r5,0x1C]
	b	@@end

@@spawnChild:
	// Spawn sparks effect as child object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initChild

	// Set object functions
	ldr	r0,=@sparksChild_funcs
	str	r0,[r4]

@@initChild:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// object
	mov	r1,0x34
	ldrb	r1,[r5,r1]	// level
	mov	r2,r5		// parent
	mov	r3,(3 * 0x5)	// duration
	bl	0x2162018
	mov	r0,0xB4
	str	r4,[r5,r0]	// child object 1

@@spawnSparks:
	mov	r0,r5
	bl	@spawnSparks

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0xEC
	bl	0x2025574

@@end:
	// Advance texture animation 2
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r5,r1]
	mov	r2,0x31
	ldrb	r2,[r5,r2]
	lsr	r2,r2,0x7	// &0x80 = play once, &0x00 = loop
	mov	r3,0x2
	bl	0x2010894

	add	sp,0x4
	pop	r4-r5,r15


@updateVirusTropiConga:
	push	r4-r5,r14
	sub	sp,0x8
	mov	r5,r0		// object

	// Check substate
	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1
	cmp	r0,0x3
	blt	@@state2
	beq	@@state3
	bgt	@@state4

@@state0:
	// Attack wind up
	mov	r1,0x31
	mov	r0,0x81
	strb	r0,[r5,r1]

	// Next substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]
	b	@@end

@@state1:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	bne	@@end

	// Attack delay
	mov	r1,0x31
	mov	r0,0x2
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x5
	strh	r0,[r5,0x28]

	// Next substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]

@@state2:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Attack wind up 2
	mov	r1,0x31
	mov	r0,0x3
	strb	r0,[r5,r1]

	// Next substate
	mov	r0,0x3
	strb	r0,[r5,0x1D]
	b	@@end

@@state3:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	bne	@@end

	// Attack loop
	mov	r1,0x31
	mov	r0,0x84
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x1		// Spawn immediately
	strh	r0,[r5,0x28]

	// Set seeds count
	mov	r0,0x0
	strb	r0,[r5,0x1E]	// seeds count

	// Next substate
	mov	r0,0x4
	strb	r0,[r5,0x1D]

@@state4:
	// Highlight panels
	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	bl	0x2153484	// get direction
	mov	r3,r0		// direction

	mov	r0,0x68
	ldsb	r0,[r5,r0]	// x
	mov	r1,0x69
	ldsb	r1,[r5,r1]	// y
	add	r1,r1,r3
	mov	r2,0x5		// range type
	bl	0x2153894

	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@end

	// Set timer
	mov	r0,0x4
	strh	r0,[r5,0x28]

	// Increment seeds count
	ldrb	r0,[r5,0x1E]
	add	r0,0x1
	strb	r0,[r5,0x1E]
	cmp	r0,0x3
	ble	@@spawnSeed

	// Despawn (next state)
	mov	r0,0x3
	str	r0,[r5,0x1C]
	b	@@end

@@spawnSeed:
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initSeed

	// Set object functions
	ldr	r0,=0x21ABB54
	str	r0,[r4]

@@initSeed:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	// Initialize seed
	mov	r0,r5
	add	r0,0x90
	str	r0,[sp]		// size
	ldrb	r0,[r5,0x1E]
	sub	r0,0x1
	str	r0,[sp,0x4]	// seed index

	mov	r0,r4		// object
	mov	r1,0x34
	ldrb	r1,[r5,r1]	// level
	mov	r2,r5
	add	r2,0x68		// panel position
	mov	r3,0x30
	ldrb	r3,[r5,r3]	// alignment
	bl	0x2188F98

	// Set damage
	mov	r1,0xAC
	ldr	r1,[r4,r1]	// collision
	mov	r0,@DAMAGE_WOOD
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r0,=@DAMAGE_WOOD_DX
@@setDamage:
	str	r0,[r1,0x30]

@@end:
	add	sp,0x8
	pop	r4-r5,r15


.align 2
@spawnSparks:
	push	r4-r5,r14
	mov	r5,r0

	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initSparks

	// Set object functions
	ldr	r0,=0x21AADC4
	str	r0,[r4]

@@initSparks:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	sub	sp,0x20
	mov	r1,sp

	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	str	r0,[r1]		// u8
	mov	r0,0x3
	strb	r0,[r1,0x1]	// element
	mov	r0,0x0
	strb	r0,[r1,0x2]
	mov	r0,0x68
	ldsb	r0,[r5,r0]	// panel x-position
	str	r0,[r1,0x4]	// s8
	mov	r0,0x1		// panel y-position
	strb	r0,[r1,0x5]
	mov	r0,@DAMAGE_ELEC	// damage
	bl	battle_isDXBoss
	beq	@@setDamage
	ldr	r0,=@DAMAGE_ELEC_DX
@@setDamage:
	str	r0,[r1,0x8]
	mov	r0,0x1
	str	r0,[r1,0xC]
	mov	r0,0x3
	str	r0,[r1,0x10]
	mov	r0,0xA
	str	r0,[r1,0x14]	// type 1
	mov	r0,0x2
	str	r0,[r1,0x18]	// type 2

	// Only last spark causes invis
	mov	r0,0x3
	ldrb	r2,[r5,0x1E]
	cmp	r2,0x0
	beq	@@setHitType
	mov	r0,0x1
@@setHitType:
	str	r0,[r1,0x1C]

	mov	r0,r4		// object
	// r1 = sp (data)
	mov	r2,0x1
	bl	0x2183564

	// Get 3D position from panel position
	add	r0,sp,0x10
	add	r1,sp,0x4
	bl	0x2153380

	// ???
	add	r0,sp,0x10
	ldr	r1,=0xFFFF1000
	add	r2,sp,0x10
	mov	r3,0x2D
	lsl	r3,r3,0xC
	bl	0x2153BA8

	// Allocate second sparks object
	ldr	r0,=0x212E2C0
	mov	r1,0x1
	bl	0x215BD04
	mov	r4,r0

	// Initialize second object
	mov	r0,r5
	add	r0,0x90		// size
	str	r0,[sp]
	str	r5,[sp,0x4]
	mov	r0,0x0
	str	r0,[sp,0x8]
	str	r0,[sp,0xC]
	mov	r0,r4
	mov	r1,0x34
	ldrb	r1,[r5,r1]	// level
	add	r1,0xA
	add	r2,sp,0x10	// 3D position
	mov	r3,r5
	add	r3,0x78		// 3D rotation
	bl	0x2155FE8

	add	sp,0x20
	pop	r4-r5,r15


.align 2
@sparksChildUpdate:
	// Same as 0x2162104 but without parent state check
	push	r4,r14
	mov	r4,r0

	// Do timer
	mov	r0,0x57
	lsl	r0,r0,0x2
	ldr	r1,[r4,r0]
	sub	r1,0x1
	str	r1,[r4,r0]
	cmp	r1,0x0
	bne	@@updatePosition

	// Despawn
	ldr	r1,[r4,0x20]
	mov	r0,r4
	bic	r1,r0
	str	r1,[r4,0x20]
	mov	r0,0x2
	str	r0,[r4,0x18]
	b	@@end

@@updatePosition:
	mov	r1,0xB0
	ldr	r1,[r4,r1]	// parent
	add	r1,0x6C		// parent 3D position
	mov	r0,r4
	add	r0,0x6C		// own 3D position
	bl	0x200DC28

	// Update model animation
	mov	r0,r4
	bl	0x217466C

	// Update texture animation
	mov	r0,r4
	mov	r1,0x0
	bl	0x21747B0

@@end:
	mov	r0,0x1
	pop	r4,r15


	.pool


.align 4
battleObj_hollowVirus_funcs:
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
@sparksChild_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	0x21620F8|1		// function 0x0C - object spawn
	.dw	@sparksChildUpdate|1	// function 0x10 - object update
	.dw	0x2162160|1		// function 0x14 - object despawn
	.dw	0x216283C|1		// function 0x18 - object constructor
	.dw	0x21620F0|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - get panel position
	.dw	0x2154F9C|1		// function 0x28 - get old real position
	.dw	0x2154F8C|1		// function 0x2C - get new real position
	.dw	0x2154F7C|1		// function 0x30 - get rotation


.align 4
@virusData:
	.db	0x8F			// 0x00 = Melamander ID
	.db	0x1			// 0x01 = Fire element
	.db	0x4			// 0x02 = Fire hit effect
	.align	0x4
	.dw	((1 << 16) | (102))	// 0x04 = Melamander model
	.dw	((1 << 16) | (103))	// 0x08 = Melamander texture
	.dw	((2 << 16) | (153))	// 0x0C = Melamander model animation
	.dw	((2 << 16) | (157))	// 0x10 = Melamander texture animation
	.dw	0xCCC, 0xCCC, 0xCCC	// 0x14 = Melamander model size
	.dw	0xCCC, 0x0, 0xCCC	// 0x20 = Melamander shadow size

	.db	0x2B			// 0x00 = StreamCancro ID
	.db	0x2			// 0x01 = Aqua element
	.db	0x6			// 0x02 = Aqua hit effect
	.align	0x4
	.dw	((1 << 16) | (32))	// 0x04 = StreamCancro model
	.dw	((1 << 16) | (33))	// 0x08 = StreamCancro texture
	.dw	((2 << 16) | (39))	// 0x0C = StreamCancro model animation
	.dw	0x0			// 0x10 = StreamCancro texture animation
	.dw	0x1000, 0x1000, 0x1000	// 0x14 = StreamCancro model size
	.dw	0xC00, 0x0, 0xC00	// 0x20 = StreamCancro shadow size

	.db	0x89			// 0x00 = Eyez ID
	.db	0x3			// 0x01 = Elec element
	.db	0x7			// 0x02 = Elec hit effect
	.align	0x4
	.dw	((1 << 16) | (98))	// 0x04 = Eyez model
	.dw	((1 << 16) | (99))	// 0x08 = Eyez texture
	.dw	((2 << 16) | (147))	// 0x0C = Eyez model animation
	.dw	0x0			// 0x10 = Eyez texture animation
	.dw	0x1000, 0x1000, 0x1000	// 0x14 = Eyez model size
	.dw	0x999, 0x0, 0x999	// 0x20 = Eyez shadow size

	.db	0xA1			// 0x00 = TropiConga ID
	.db	0x4			// 0x01 = Wood element
	.db	0x8			// 0x02 = Wood hit effect
	.align	0x4
	.dw	((1 << 16) | (115))	// 0x04 = TropiConga model
	.dw	((1 << 16) | (116))	// 0x08 = TropiConga texture
	.dw	((2 << 16) | (169))	// 0x0C = TropiConga model animation
	.dw	0x0			// 0x10 = TropiConga texture animation
	.dw	0x1000, 0x1000, 0x1000	// 0x14 = TropiConga model size
	.dw	0x800, 0x0, 0x800	// 0x20 = TropiConga shadow size
.definelabel	@VIRUSDATA_SIZE, 0x2C
