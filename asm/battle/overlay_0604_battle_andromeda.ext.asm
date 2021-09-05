.align 2
andromeda_meteorsElemental:
	push	r7
	mov	r7,0x0		// non-elemental
	bl	battle_isLegendMode
	beq	@@chooseMeteor

	push	r0-r3
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,0xC
	blx	0x208985C	// mod s32
	mov	r7,r0

	// Get player object
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88	// get player object

	mov	r1,0xAC
	ldr	r1,[r0,r1]	// collision
	cmp	r1,0x0
	beq	@@checkStarForce

	// Get player state
	ldrb	r2,[r0,0x1C]	// state
	cmp	r2,0x2		// flinch
	beq	@@checkInvisible
	cmp	r2,0x3		// paralyzed
	beq	@@checkInvisible
	cmp	r2,0x4		// whistled
	beq	@@checkInvisible
	cmp	r2,0x5		// frozen
	beq	@@checkInvisible
	cmp	r2,0x6		// bubbled
	beq	@@checkInvisible

	// Get player status
	ldr	r2,[r1,0x2C]
	lsr	r3,r2,0x3	// test 0x4 - paralyzed
	bcs	@@checkInvisible
	lsr	r3,r2,0x6	// test 0x20 - frozen
	bcs	@@checkInvisible
	lsr	r3,r2,0x7	// test 0x40 - bubbled
	bcs	@@checkInvisible
	lsr	r3,r2,0x8	// test 0x80 - gravity
	bcs	@@checkInvisible

	b	@@checkStarForce

@@checkInvisible:
	// Check not invisible
	ldr	r2,[r1,0x40]
	cmp	r2,0x0
	bne	@@checkStarForce

@@checkPanel:
	mov	r1,sp
	ldrh	r1,[r1,0x20]	// target position
	mov	r2,0x68
	ldrh	r2,[r0,r2]	// player position
	cmp	r1,r2
	bne	@@checkStarForce

@@followUp:
	pop	r0-r3
	b	@@missile

@@checkStarForce:
	// Get player Star Force
	mov	r1,0x30
	ldrb	r0,[r0,r1]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]

	// Get meteor element
	mov	r1,0xC
	mul	r0,r1
	add	r1,=@meteorElements
	add	r1,r1,r0
	ldrb	r7,[r1,r7]
	pop	r0-r3

@@chooseMeteor:
	cmp	r7,0x1
	blt	@@noneMeteor
	beq	@@fireMeteor
	cmp	r7,0x3
	blt	@@iceMeteor
	beq	@@thunderbolt

@@noneMeteor:
	pop	r7
	bl	0x218675C	// init meteor
	b	@@end

@@fireMeteor:
	pop	r7
	bl	0x218675C	// init meteor
	cmp	r5,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@end
	mov	r0,0x1		// Fire Elemental
	strb	r0,[r1,0x9]
	b	@@end

@@iceMeteor:
	pop	r7
	mov	r1,0x1		// ice meteor (no panel change)
	bl	0x218675C	// init meteor
	cmp	r5,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@end
	mov	r0,0x
	b	@@end

@@thunderbolt:
	ldr	r7,=0x21AC358
	str	r7,[r5]
	pop	r7
//	mov	r0,r5
	ldr	r1,[sp,0x4]	// alignment
	add	r2,sp,0xC	// panel position
	ldr	r3,[sp,0x8]	// attack power
	bl	0x218C378	// init thunderbolt

/*	mov	r0,0xAC
	ldr	r0,[r5,r0]
	cmp	r0,0x0
	beq	@@end
	mov	r1,0x1		// paralyze lv 1 (45i)
	strb	r1,[r0,0x1A]
*/
	b	@@end

@@missile:
	pop	r7
	mov	r1,0x3		// missile
	bl	0x218675C	// init meteor
//	b	@@end

@@end:
	bl	0x21C0C4A

.align 4
@meteorElements:
	.db	0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03	// Normal
	.db	0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03	// Ice Pegasus
	.db	0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03	// Fire Leo
	.db	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03	// Green Dragon


.align 2
andromeda_dxUpdate:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	bl	battle_isDXBoss_r4obj
	beq	@@normal
	ldrb	r0,[r4,0x1C]
	cmp	r0,0x9
	bne	@@normal

	// Check if SE_BS07B sound bank is loaded
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	ldr	r1,=0x21206CC
	ldr	r1,[r1]
	add	r1,0xC
	add	r2,r0,0x2
	lsl	r2,r2,0x3
	ldrb	r1,[r1,r2]
	cmp	r1,0x9
	bne	@@normal

	// Load SE_BS07 sound bank
	// r0 = alignment
	mov	r1,0x8
	bl	0x2153A7C

@@normal:
	mov	r0,r4
	bl	0x21BEF24

@@end:
	pop	r4,r15


.align 2
andromeda_dxSpawnStart:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	bl	battle_isDXBoss_r4obj
	beq	@@normal

@@dx:
	// Call normal spawn start
	mov	r0,r4
	bl	0x21C0420

	// Remove "stay alive when HP = 0" flag
	ldr	r0,[r4,0x20]
	mov	r1,(0x10000 >> 0x10)
	lsl	r1,r1,0x10
	bic	r0,r1
	str	r0,[r4,0x20]

	b	@@end

@@normal:
	// Call normal spawn start
	mov	r0,r4
	bl	0x21C0420

@@end:
	pop	r4,r15


.align 2
andromeda_dxSpawnUpdate:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	bl	battle_isDXBoss_r4obj
	beq	@@normal

@@dx:
	mov	r0,r4
	ldrb	r1,[r4,0x1E]
	cmp	r1,0x1
	blt	@@state0
	beq	@@state1
	cmp	r1,0x3
	blt	@@state2
	beq	@@state3
	b	@@end

@@state0:
	bl	andromeda_spawnState_start
	b	@@end
@@state1:
	bl	andromeda_spawnState_moveUp
	b	@@end
@@state2:
	bl	andromeda_spawnState_transform
	b	@@end
@@state3:
	bl	andromeda_spawnState_finish
	b	@@end

@@normal:
	// Call normal spawn update
	mov	r0,r4
	bl	0x21C0348

@@end:
	pop	r4,r15


.align 2
andromeda_spawnState_start:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	bne	@@during

@@enter:
	// Set opacity
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	mov	r2,0x1F
	bl	0x2011AEC

	// Reset 3D scaling
	mov	r0,r4
	mov	r1,r4
	add	r0,0x90
	add	r1,0x9C
	bl	0x200DC28

	// Set model property?
	mov	r0,0xA8
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@position
	ldrh	r1,[r0,0x24]
	mov	r2,0x8
	bic	r1,r2
	strh	r1,[r0,0x24]

@@position:
	// Set initial y-position
	ldr	r0,=(-600 << 0xC)
	str	r0,[r4,0x70]	// current y-position
	// Set z-position
	ldr	r0,=(-100 << 0xC)
	str	r0,[r4,0x74]	// current z-position
//	// Set z-velocity
//	ldr	r0,=(-100 << 0xC)
//	mov	r1,(10)		// same as timer
//	blx	0x2089820	// div s32
//	str	r0,[r4,0x8C]	// z-velocity

	// Set visible
	ldr	r0,[r4,0x20]
	mov	r1,0x4
	orr	r0,r1
	str	r0,[r4,0x20]

	// Next substate
	mov	r0,0x1
	strb	r0,[r4,0x1F]

	// Set timer
	mov	r0,(10)
	strh	r0,[r4,0x28]

@@during:
	// Decrement timer
	ldrh	r0,[r4,0x28]
	sub	r0,0x1
	strh	r0,[r4,0x28]
	cmp	r0,0x0
	bgt	@@end

@@exit:
	// Next state
	mov	r0,0x1
	strh	r0,[r4,0x1E]

@@end:
	pop	r4,r15

	.pool


.align 2
andromeda_spawnState_moveUp:
	push	r4,r14
	mov	r4,r0

	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	bne	@@during

@@enter:
	// Set timer
	mov	r0,(60)
	strh	r0,[r4,0x28]

	// Next substate
	mov	r0,0x1
	strb	r0,[r4,0x1F]

@@during:
	// Move 3D y-position
	ldr	r0,[r4,0x70]	// current y-position
	asr	r1,r0,0x3
	sub	r0,r0,r1
	str	r0,[r4,0x70]	// current y-position

	// Decrement timer
	ldrh	r0,[r4,0x28]
	sub	r0,0x1
	strh	r0,[r4,0x28]
	cmp	r0,0x0
	bgt	@@end

@@exit:
	// Set y-position
	mov	r0,0x0
	str	r0,[r4,0x70]	// current y-positon

	// Next state
	mov	r0,0x2
	strh	r0,[r4,0x1E]

@@end:
	pop	r4,r15


.align 2
andromeda_spawnState_transform:
	// r0 = object
	push	r4-r5,r14
	sub	sp,0x38
	mov	r4,r0

	// Set transform bits
	mov	r0,0xD5
	ldrb	r1,[r4,r0]
	mov	r2,0x40
	bic	r1,r2
	strb	r1,[r4,r0]

	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	bne	@@during

@@enter:
	// Set transform bits
	mov	r0,0xD5
	ldrb	r1,[r4,r0]
	mov	r2,0x20
	orr	r1,r2
	strb	r1,[r4,r0]

	// Set animation
	mov	r0,0x82
	mov	r1,0x31
	strb	r0,[r4,r1]

	// Load SE_BS07B sound bank
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,0x9		// SE_BS07B
	bl	0x2153A7C

	// Initialize SFX script
	mov	r0,0x0
	mov	r1,r4
	add	r1,0xFC
	str	r0,[r1,(0x158 - 0xFC)]
	str	r0,[r1,(0x144 - 0xFC)]

	// Set timer
	mov	r0,0x1F
	strh	r0,[r4,0x28]

	// Next substate
	mov	r0,0x1
	strb	r0,[r4,0x1F]

	// Wait 1 frame
	b	@@end

@@during:
	// Run SFX script
	mov	r0,r4
	mov	r1,r4
	add	r0,0xFC
	add	r1,0xFC
	add	r0,(0x158 - 0xFC)
	add	r1,(0x144 - 0xFC)
	bl	0x2153D58

@@checkTimer:
	// Decrement timer
	ldrh	r0,[r4,0x28]
	cmp	r0,0x0
	ble	@@checkModel
	sub	r0,0x1
	strh	r0,[r4,0x28]
	cmp	r0,0x0
	bgt	@@checkModel

//	// Change camera angle?
//	ldr	r0,=0x21B01D0
//	mov	r1,(0x384 >> 0x2)
//	bl	0x219515C

@@checkModel:
	mov	r0,0xA8
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@checkAnimation
	ldr	r0,[r0,0x54]
	cmp	r0,0x0
	beq	@@checkAnimation
	ldr	r0,[r0]
	mov	r1,(150)
	lsl	r1,r1,0xC
	cmp	r0,r1
	bne	@@checkAnimation

	// Create VFX object
	ldr	r0,=0x212E2C0
	mov	r1,0x1
	bl	0x21BF5E8
	mov	r5,r0
	beq	@@checkAnimation

	// Create matrix
	ldr	r0,=0x21C0C78
	ldmia	[r0]!,r1-r3
	mov	r0,sp
	stmia	[r0]!,r1-r3
	// r0 = sp+0xC
	blx	0x208834C	// 3x3 identity matrix
	mov	r0,0x1
	str	r0,[sp,0x30]
	mov	r0,0x0
	str	r0,[sp,0x34]

	// Initialize VFX object
	mov	r0,r5
	mov	r1,0x12
	mov	r2,r4
	mov	r3,0xC
	bl	0x21554B8

	// Override functions
	add	r0,=@vfxFuncs
	str	r0,[r5]

	// Set active during pause
	ldr	r0,[r5,0x20]
	mov	r1,(0x1000 >> 0xC)
	lsl	r1,r1,0xC
	orr	r0,r1
	str	r0,[r5,0x20]

	// Store as child object
	mov	r0,0xB8
	str	r5,[r4,r0]

@@checkAnimation:
	mov	r0,(0x12C >> 0x2)
	lsl	r0,r0,0x2
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@end

@@exit:
	// Next state
	mov	r0,0x3
	strh	r0,[r4,0x1E]

@@end:
	add	sp,0x38
	pop	r4-r5,r15

	.pool


.align 2
andromeda_spawnState_finish:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	bne	@@during

@@enter:
	// Set transform bits
	mov	r0,0xD5
	ldrb	r1,[r4,r0]
	mov	r2,0x1
	orr	r1,r2
	strb	r1,[r4,r0]

	// Set timer
	mov	r0,(20)
	strh	r0,[r4,0x28]

	// Next substate
	mov	r0,0x1
	strb	r0,[r4,0x1F]

	// Wait 1 frame
	b	@@end

@@during:
	// Decrement timer
	ldrh	r0,[r4,0x28]
	sub	r0,0x1
	strh	r0,[r4,0x28]
	cmp	r0,0x0
	bgt	@@end

@@exit:
@@animSelf:
	// Set own animation
	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r4,r1]

@@animChild1:
	// Set child 1 animation
	mov	r2,0xB0
	ldr	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@animChild2

	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r2,r1]

@@animChild2:
	// Set child 2 animation
	mov	r2,0xB4
	ldr	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@soundBank

	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r2,r1]

@@soundBank:
	// Load SE_BS07 sound bank
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,0x8		// SE_BS07
	bl	0x2153A7C

	// Finish spawning
	ldr	r0,=0x21ACC6C
	mov	r1,r4
	bl	0x2151204

	// End spawn
	mov	r0,0x2
	strb	r0,[r4,0x1D]
	mov	r0,0x0
	strh	r0,[r4,0x1E]

@@end:
	pop	r4,r15


.align 2
andromeda_dxSpawnEnd:
	// r0 = object
	push	r4,r14
	mov	r4,r0

	// Call normal spawn end
	mov	r0,r4
	bl	0x21C042C

	bl	battle_isDXBoss_r4obj
	beq	@@end

//	// Load SE_BS07 sound bank
//	// Note: SFX may still be playing
//	mov	r0,0x30
//	ldrb	r0,[r4,r0]	// alignment
//	mov	r1,0x8		// SE_BS07
//	bl	0x2153A7C

	// Clear timer
	mov	r0,0x0
	strh	r0,[r4,0x28]

	// Set y-position
	mov	r0,0x0
	str	r0,[r4,0x70]
	// Set z-position
	ldr	r0,=(-100 << 0xC)
	str	r0,[r4,0x74]

	// Set transform bits
	mov	r0,0xD5
	ldrb	r1,[r4,r0]
	mov	r2,0x61
	orr	r1,r2
	strb	r1,[r4,r0]

	// Update core
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900
	mov	r0,r4
	bl	0x21C0900

	// Kill VFX object
	mov	r0,0xB8
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@animSelf

	// Set to destruct
	mov	r1,0x2
	str	r1,[r0,0x18]

//	// Set invisible
//	ldr	r1,[r0,0x20]
//	mov	r2,0x4
//	bic	r1,r2
//	str	r1,[r0,0x20]
//
//	// Remove child object
//	mov	r0,0x0
//	mov	r1,0xB8
//	str	r0,[r4,r1]

@@animSelf:
	mov	r1,0x31
	ldrb	r0,[r4,r1]
	cmp	r0,0x1
	beq	@@end

	// Set own animation
	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r4,r1]

	// Advance own animation
	mov	r0,r4
	bl	0x217466C

@@animChild1:
	// Set child 1 animation
	mov	r2,0xB0
	ldr	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@animChild2

	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r2,r1]

	// Advance child 1 animation
	mov	r0,r2
	bl	0x217466C

@@animChild2:
	// Set child 2 animation
	mov	r2,0xB4
	ldr	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@end

	mov	r0,0x1
	mov	r1,0x31
	strb	r0,[r2,r1]

	// Advance child 1 animation
	mov	r0,r2
	bl	0x217466C

@@end:
	pop	r4,r15


.align 2
@vfxDestruct:
	// Get parent object
	mov	r1,0xB0
	ldr	r1,[r0,r1]
	cmp	r1,0x0
	beq	@@end

	// Remove from parent object
	add	r1,0xB8
	ldr	r2,[r1]
	cmp	r0,r2
	bne	@@end

	mov	r2,0x0
	str	r2,[r1]

@@end:
	// Call generic object destruct
	// r0 = object
	ldr	r1,=0x2174E9C|1
	bx	r1


	.pool

.align 4
@vfxFuncs:
	.dw	0x2174F18|1	// function 0x00 - object tick
	.dw	0x2155AA4|1	// function 0x04 - position/visibility updater
	.dw	0x2015758|1	// function 0x08 - unused?
	.dw	0x21559D4|1	// function 0x0C - object spawn
	.dw	0x21559E8|1	// function 0x10 - object update
	.dw	0x2155AA0|1	// function 0x14 - object despawn
	.dw	0x216283C|1	// function 0x18 - object constructor
	.dw	@vfxDestruct|1	// function 0x1C - object destructor
	.dw	0x21750E8|1	// function 0x20 - run every frame while object exists
	.dw	0x2150464|1	// function 0x24 - get panel position
	.dw	0x2154F9C|1	// function 0x28 - get old real position
	.dw	0x2154F8C|1	// function 0x2C - get new real position
	.dw	0x2154F7C|1	// function 0x30 - get rotation
