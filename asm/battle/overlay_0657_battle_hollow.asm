// Overlay 657 - Hollow

.nds
.create TEMP+"/overlay_0657.bin",0x21BEC00
.area 0x29C0
.thumb

battleObj_hollowBoss_init:
	// Initialize boss
	push	r4-r7,r14
	sub	sp,0xC
	mov	r4,r2		// alignment
	mov	r5,r0		// object
	mov	r6,r3		// version
	mov	r7,r1		// panel position

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
	mov	r0,r5
	mov	r1,r6
	blx	r2

	// Set name
	ldr	r0,=0x14F
	add	r0,r0,r6
	mov	r1,0x36
	strh	r0,[r5,r1]

	// Set panel position
	mov	r1,0x68
	strh	r7,[r5,r1]

	// Set real position from panel position
	mov	r0,r5
	mov	r1,r5
	add	r0,0x6C
	add	r1,0x68
	bl	0x2153380

	// Set alignment
	mov	r1,0x30
	strb	r4,[r5,r1]

	// {!!} state?
	mov	r0,0x0
	str	r0,[r5,0x14]

	// Set rotation from alignment
	mov	r0,r5
	add	r0,0x78
	mov	r1,r4
	bl	0x2153408

	// ???
	ldr	r1,[r5,0x20]
	mov	r0,0x80
	orr	r1,r0
	str	r1,[r5,0x20]

	// Create collision data
	mov	r0,0x3
	str	r0,[sp]
	str	r0,[sp,0x4]	// Elec element
	mov	r0,0x0
	str	r0,[sp,0x8]
	ldr	r0,=0x21ADB70
	mov	r1,r5
	mov	r2,0x1
	mov	r3,0x1
	bl	0x2153F64
	mov	r1,0xAC
	str	r0,[r5,r1]

	// Copy position to collision data
	mov	r0,r5
	bl	0x21748B0

	// Set contact damage
	ldr	r0,=350
	bl	battle_isDXBoss_r5obj
	bne	@@setContact
	ldr	r0,=(450)
@@setContact:
	mov	r1,0xAC
	ldr	r1,[r5,r1]
	str	r0,[r1,0x30]

	// Load model and base animation
	mov	r0,r5
	ldr	r1,=((1 << 16) | (468))
	ldr	r2,=((2 << 16) | (850))
	bl	battle_isDXBoss_r5obj
	beq	@@loadModel
	ldr	r1,=((1 << 16) | (514))
@@loadModel:
	bl	0x21745FC

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

	// Set HP
	mov	r1,0x34
	ldrb	r0,[r5,r1]
	bl	battle_isDXBoss_r5obj
	beq	@@getHP
	add	r0,0x1
@@getHP:
	lsl	r0,r0,0x1
	ldr	r1,=@hp
	ldsh	r0,[r1,r0]
	mov	r1,0x4C
	strh	r0,[r5,r1]
	mov	r1,0x4E
	strh	r0,[r5,r1]

	// Spawn shadow
	mov	r0,r5
	ldr	r1,=@shadowSize
	bl	0x2153838
	mov	r1,0xBC
	str	r0,[r5,r1]

	// Spawn helper
	mov	r0,r5
	bl	@spawnHelper
	mov	r1,0xC4		// child 1
	str	r0,[r5,r1]

	// Spawn summoner
	mov	r0,0x0
	mov	r1,0xC8		// child 2
	str	r0,[r5,r1]

	// Spawn aura
	mov	r0,r5
	bl	@spawnAura
	mov	r1,0xCC		// child 3
	str	r0,[r5,r1]

	// Spawn sparks
	mov	r0,r5
	bl	@spawnSparks
	mov	r1,0xD0		// child 4
	str	r0,[r5,r1]

	// Must be 0 (Libra element)
	mov	r0,0x0
	mov	r1,0xD4
	str	r0,[r5,r1]

	// Initialize virus timer
	mov	r0,0x1E
	mov	r1,0xD8
	str	r0,[r5,r1]

	// Initialize virus object
	mov	r0,0x0
	mov	r1,0xDC
	str	r0,[r5,r1]

	// Temp objects
	mov	r1,(@VAR_CHILD1 >> 0x2)
	lsl	r1,r1,0x2
	add	r1,r5,r1
	mov	r0,0x0
	str	r0,[r1]		// temp child 1
	str	r0,[r1,0x4]	// temp child 2
	str	r0,[r1,0x8]	// temp child 3

	// Start AI script
	mov	r3,(@VAR_START >> 0x2)
	lsl	r3,r3,0x2
	add	r3,r5,r3	// free space
	ldr	r0,=@aiScript
	str	r0,[r3,(@VAR_AISCRIPT - @VAR_START)]

	// Clear other variables
	mov	r0,0x0
	str	r0,[r3,(@VAR_AITIMER - @VAR_START)]

	// Load sound effects
	mov	r0,r4
	mov	r1,BANK_SE_BS0E
	bl	0x2153A7C

	add	sp,0xC
	pop	r4-r7,r15


.align 2
@spawnHelper:
	push	r4-r5,r14
	mov	r5,r0		// parent object

	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initObj

	// Set object functions
	ldr	r0,=battleObj_hollowHelper_funcs
	str	r0,[r4]

@@initObj:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// sparks object
	mov	r1,r5		// parent object
	bl	battleObj_hollowHelper_init

@@end:
	mov	r0,r4
	pop	r4-r5,r15


.align 2
@spawnSparks:
	push	r4-r5,r14
	mov	r5,r0		// parent object

	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initObj

	// Set object functions
	ldr	r0,=battleObj_hollowSparks_funcs
	str	r0,[r4]

@@initObj:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// sparks object
	mov	r1,r5		// parent object
	bl	battleObj_hollowSparks_init

@@end:
	mov	r0,r4
	pop	r4-r5,r15


.align 2
@spawnAura:
	push	r4-r5,r14
	mov	r5,r0		// parent object

	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initObj

	// Set object functions
	ldr	r0,=battleObj_hollowAura_funcs
	str	r0,[r4]

@@initObj:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// sparks object
	mov	r1,r5		// parent object
	bl	battleObj_hollowAura_init

@@end:
	mov	r0,r4
	pop	r4-r5,r15

@spawn:
	push	r4,r14
	mov	r4,r0

	ldr	r0,=0x21B01D0
	mov	r1,r4
	mov	r2,0x0
	bl	0x2195260

	mov	r0,0x1
	str	r0,[r4,0x18]
	mov	r1,0x0
	strb	r1,[r4,0x1C]
	pop	r4,r15


@update:
	push	r4,r14
	mov	r4,r0

	// Handle enemy states
	mov	r0,r4
	bl	0x217FC7C

.if OPT_HOLLOW_DUMMY == 0
	// Handle virus spawner
	mov	r0,r4
	bl	@updateVirusSpawner
.endif

	// Advance animation
	mov	r0,r4
	bl	0x217466C

	// Kill temp objects if dying
	ldrb	r0,[r4,0x1C]
	cmp	r0,0x1
	bne	@@end
	mov	r0,r4
	bl	@destroyTempObjects

@@end:
	mov	r0,0x1
	pop	r4,r15


@despawn:
	mov	r0,0x0
	bx	r14

.align 2
@destruct:
	mov	r1,0x2
	mov	r2,r0
	add	r2,0xC4		// child objects

@@destroyHelper:
	// Destroy helper object
	ldr	r3,[r2]
	cmp	r3,0x0
	beq	@@destroySummon
	str	r1,[r3,0x18]

@@destroySummon:
	// Destroy summon object
	ldr	r3,[r2,0x4]
	cmp	r3,0x0
	beq	@@destroyAura
	str	r1,[r3,0x18]

@@destroyAura:
	// Destroy aura object
	ldr	r3,[r2,0x8]
	cmp	r3,0x0
	beq	@@destroySparks
	str	r1,[r3,0x18]

@@destroySparks:
	// Destroy sparks object
	ldr	r3,[r2,0xC]
	cmp	r3,0x0
	beq	@@destroyTemp1
	str	r1,[r3,0x18]

@@destroyTemp1:
	mov	r2,(@VAR_CHILD1 >> 0x2)
	lsl	r2,r2,0x2
	add	r2,r0,r2

	// Destroy temp child 1
	ldr	r3,[r2]
	cmp	r3,0x0
	beq	@@destroyTemp2
	str	r1,[r3,0x18]

@@destroyTemp2:
	// Destroy temp child 2
	ldr	r3,[r2,0x4]
	cmp	r3,0x0
	beq	@@destroyTemp3
	str	r1,[r3,0x18]

@@destroyTemp3:
	// Destroy temp child 3
	ldr	r3,[r2,0x8]
	cmp	r3,0x0
	beq	@@destroySelf
	str	r1,[r3,0x18]

@@destroySelf:
	// Call generic object destruct
	ldr	r3,=0x2174E9D
	bx	r3


.align 2
@spawnEnd:
	push	r14

	// Disable update during pause on sparks
	mov	r1,0xD0
	ldr	r1,[r4,r1]	// child 4
	cmp	r1,0x0
	beq	@@generic

	ldr	r2,[r1,0x20]
	mov	r3,0x1
	bic	r2,r3
	str	r2,[r1,0x20]

@@generic:
	// Call generic spawn end
	// r0 = object
	bl	0x2180398

	pop	r15


.align 2
@interrupt:
	push	r4,r14

	// r0 = self
	bl	@destroyTempObjects

	// Call generic interrupt
	// r0 = self
	bl	0x2181B8C

	pop	r4,r15


.align 2
@death:
	push	r4,r14

	// r0 = self
	bl	@destroyTempObjects

	// Call generic death
	// r0 = self
	bl	0x2180FF0

	pop	r4,r15


@destroyTempObjects:
	push	r4,r14

	mov	r2,(@VAR_CHILD1 >> 0x2)
	lsl	r2,r2,0x2
	add	r2,r0,r2
	mov	r1,0x2
	mov	r4,0x0

@@destroyTemp1:
	// Destroy temp child 1
	ldr	r3,[r2]
	cmp	r3,0x0
	beq	@@destroyTemp2
	str	r1,[r3,0x18]
	str	r4,[r2]

@@destroyTemp2:
	// Destroy temp child 2
	ldr	r3,[r2,0x4]
	cmp	r3,0x0
	beq	@@destroyTemp3
	str	r1,[r3,0x18]
	str	r4,[r2,0x4]

@@destroyTemp3:
	// Destroy temp child 3
	ldr	r3,[r2,0x8]
	cmp	r3,0x0
	beq	@@end
	str	r1,[r3,0x18]
	str	r4,[r2,0x8]

@@end:
	pop	r4,r15


	.pool


.align 2
@behavior:
	push	r3,r14
	ldrb	r1,[r0,0x1C]	// state
	sub	r1,0x9
	cmp	r1,0x5
	bhi	@@stateHi

	ldr	r2,=@hollow_states
	lsl	r1,r1,0x2
	ldr	r1,[r2,r1]
	cmp	r1,0x0
	beq	@@end
	blx	r1
	b	@@end

@@stateHi:
	bl	0x21800B4
@@end:
	pop	r3,r15

.align 2
@ai:
	push	r4-r7,r14
	mov	r5,r0		// object
	mov	r6,r5
	add	r6,0xAC
	ldr	r6,[r6]		// collision data
	mov	r7,(@VAR_START >> 0x2)
	lsl	r7,r7,0x2
	add	r7,r5,r7	// free space

	// Update collision damage
	ldr	r0,=(350)
	bl	battle_isDXBoss_r5obj
	beq	@@setContactDamage
	ldr	r0,=(450)
@@setContactDamage:
	strh	r0,[r6,0x30]
	// Re-enable collision
	mov	r0,0x1
	str	r0,[r6,0x20]

	// Set current animation
	mov	r1,0x31
	mov	r0,0x0
	strb	r0,[r5,r1]

	// Run generic timer
	ldrh	r0,[r7,(@VAR_AITIMER - @VAR_START)]
	cmp	r0,0x0
	beq	@@clearBarrier
	sub	r0,0x1
	strh	r0,[r7,(@VAR_AITIMER - @VAR_START)]
	b	@@end

@@clearBarrier:
	// Get next action
	ldr	r4,[r7,(@VAR_AISCRIPT - @VAR_START)]

	// Check if last action is thunder barrier or movement
	ldrb	r0,[r7,(@VAR_AIPREV - @VAR_START)]
	cmp	r0,@ACTION_BARRIER
	beq	@@doAction

	// Clear barrier
	ldr	r1,[r6,0x2C]
	mov	r0,0x2
	bic	r1,r0
	str	r1,[r6,0x2C]

@@doAction:
	// Get player object
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88
	cmp	r0,0x0
	bne	@@doActionCheckHP
	b	@@end

@@doActionCheckHP:
	// Check player HP
	mov	r1,0x4C
	ldsh	r0,[r0,r1]
	cmp	r0,0x0
	bgt	@@doActionGetAction
	b	@@end

@@doActionGetAction:
	// Get next action
	ldrb	r0,[r4]

@@doWait:
	cmp	r0,@ACTION_WAIT
	bne	@@doMove

	// Set timer
	ldrb	r0,[r4,0x2]	// normal
	bl	battle_isLegendMode
	beq	@@checkWaitDX
	ldrb	r0,[r4,0x3]	// legend
@@checkWaitDX:
	bl	battle_isDXBoss
	beq	@@setWaitTimer
	add	r0,0x1
	asr	r0,r0,0x1
	bl	battle_isLegendMode
	beq	@@setWaitTimer
	add	r0,0x1
	asr	r0,r0,0x1
@@setWaitTimer:
	cmp	r0,0x0
	bne	@@setWaitTimerStore
	b	@@advanceScript
@@setWaitTimerStore:
	strh	r0,[r7,(@VAR_AITIMER - @VAR_START)]

	b	@@advanceScript

@@doMove:
	cmp	r0,@ACTION_MOVE
	bne	@@doBarrier

	// Set up movement
	mov	r0,r5
	ldrb	r1,[r4,0x2]	// move lag (normal)
	ldrb	r2,[r4,0x1]	// move type
	bl	battle_isLegendMode
	beq	@@checkMovementDX
	ldrb	r1,[r4,0x3]	// move lag (legend)
@@checkMovementDX:
	bl	battle_isDXBoss
	beq	@@doSetupMovement
	add	r1,0x1
	asr	r1,r1,0x1
@@doSetupMovement:
	bl	@setupMovement

	// Start movement
	mov	r0,r5
	mov	r1,0xA
	mov	r2,0xFF
	bl	0x217D7B8

	// Despawn thunder barrier after a few frames
	mov	r0,0x1
	str	r0,[r7,(@VAR_AITIMER - @VAR_START)]

	b	@@advanceScript

@@doBarrier:
	cmp	r0,@ACTION_BARRIER
	bne	@@doGoto

	// Activate barrier
	ldr	r1,[r6,0x2C]
	mov	r0,0x2
	orr	r1,r0
	str	r1,[r6,0x2C]

	// Set timer
	ldrb	r0,[r4,0x2]	// normal
	bl	battle_isLegendMode
	beq	@@checkBarrierDX
	ldrb	r0,[r4,0x3]	// legend
@@checkBarrierDX:
	bl	battle_isDXBoss
	beq	@@setBarrierTimer
	add	r0,0x1
	asr	r0,r0,0x1
	cmp	r0,0x0
	bgt	@@setBarrierTimer
	mov	r0,0x1
@@setBarrierTimer:
	sub	r0,0x1
	strh	r0,[r7,(@VAR_AITIMER - @VAR_START)]
	b	@@advanceScript

@@doGoto:
	cmp	r0,@ACTION_GOTO
	bne	@@doBazooka

	mov	r0,0x2
	ldsh	r0,[r4,r0]
	add	r4,r4,r0
	str	r4,[r7,(@VAR_AISCRIPT - @VAR_START)]
	b	@@doAction

@@doBazooka:
	cmp	r0,@ACTION_BAZOOKA
	bne	@@doThunder

	// Start bazooka
	mov	r0,r5
	mov	r1,0xC
	mov	r2,0xFF
	bl	0x217D7B8

	b	@@advanceScript

@@doThunder:
	cmp	r0,@ACTION_THUNDER
	bne	@@doPanels

	// Choose random thunder pattern
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,0x2		// number of patterns
	blx	0x208985C	// FX_ModS32

	// Set thunder pattern
	ldr	r1,=@thunderPatterns
	lsl	r0,r0,0x2
	ldr	r0,[r1,r0]
	mov	r1,(@VAR_ATKSCRIPT >> 0x2)
	lsl	r1,r1,0x2
	str	r0,[r5,r1]

	// Set attack level
	mov	r0,0x68
	mov	r1,0x69
	ldrb	r0,[r5,r0]
	ldrb	r1,[r5,r1]
	bl	hollow_isHollowPanel
	ldr	r1,=@VAR_ATKLEVEL
	strb	r0,[r5,r1]

	// Start thunder
	mov	r0,r5
	mov	r1,0xD
	mov	r2,0xFF
	bl	0x217D7B8

	b	@@advanceScript

@@doPanels:
	cmp	r0,@ACTION_PANELS
	bne	@@doSummon

	// Count number of panels
	bl	hollow_countHollowPanels
	ldrb	r1,[r4,0x2]
	cmp	r0,r1
	bge	@@advanceScript

	// Start panel summon
	mov	r0,r5
	mov	r1,0xE
	mov	r2,0xFF
	bl	0x217D7B8

	b	@@advanceScript

@@doSummon:
	cmp	r0,@ACTION_SUMMON
	bne	@@doPauseVirus

	mov	r0,r5
	mov	r1,0x0
	mov	r2,0x2
	ldr	r3,=0x301
	bl	@spawnVirus

	b	@@advanceScript

@@doPauseVirus:
	cmp	r0,@ACTION_PAUSEVIRUS
	bne	@@doLevel

	bl	battle_isDXBoss
	bne	@@advanceScript

	// Increment virus timer
	ldrb	r0,[r4,0x2]	// frames (normal)
	bl	battle_isLegendMode
	beq	@@doIncrementVirusTimer
	ldrb	r0,[r4,0x3]	// frames (legend)
@@doIncrementVirusTimer:
	mov	r1,0xD8
	ldr	r2,[r5,r1]
	add	r2,r2,r0
	str	r2,[r5,r1]
	b	@@advanceScript

@@doLevel:
	cmp	r0,@ACTION_LEVEL
	bne	@@doRandom

	ldrb	r0,[r4,0x1]
	bl	battle_isLegendMode
	bne	@@doLevelLegend
@@doLevelNormal:
	cmp	r0,0x0
	bne	@@advanceScript
	b	@@doLevelJump
@@doLevelLegend:
	cmp	r0,0x0
	beq	@@advanceScript
//	b	@@doLevelJump
@@doLevelJump:
	mov	r0,0x2
	ldsh	r0,[r4,r0]
	add	r4,r4,r0
	str	r4,[r7,(@VAR_AISCRIPT - @VAR_START)]
	b	@@doAction

@@doRandom:
	cmp	r0,@ACTION_RANDOM
	bne	@@end

	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsr	r0,r0,0x1
	mov	r1,(100)
	blx	0x208985C	// mod s32
	ldrb	r1,[r4,0x1]
	cmp	r0,r1
	bge	@@advanceScript

	mov	r0,0x2
	ldsh	r0,[r4,r0]
	add	r4,r4,r0
	str	r4,[r7,(@VAR_AISCRIPT - @VAR_START)]
	b	@@doAction

@@advanceScript:
	ldrb	r0,[r4]
	strb	r0,[r7,(@VAR_AIPREV - @VAR_START)]
	add	r4,0x4
@@setScript:
	str	r4,[r7,(@VAR_AISCRIPT - @VAR_START)]

@@end:
	pop	r4-r7,r15

.align 2
@setupMovement:
	push	r4-r7,r14
	mov	r5,r0		// object
	mov	r6,r2		// target type
	mov	r7,r1		// movement lag

	// Get position
	ldr	r1,[r0]
	ldr	r1,[r1,0x24]
	blx	r1
	mov	r4,r0

	// 50% chance to move to a Hollow panel
	// SF1: 3/8 for V1, 4/8 for EX, 5/8 for SP/IF/DX
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x6
	bcc	@@chooseAny

@@chooseHollow:
	add	r0,r6,0x1
	mov	r1,r4
	bl	@chooseMovePanel
	cmp	r0,0x0
	bne	@@setPanel

@@chooseAny:
	mov	r0,r6
	mov	r1,r4
	bl	@chooseMovePanel
	cmp	r0,0x0
	bne	@@setPanel

	// Move to current panel
	mov	r0,r4

@@setPanel:
	mov	r3,0x13
	lsl	r3,r3,0x4
	add	r3,r5,r3
	strh	r0,[r3,0x6]

	// Check status effect
	mov	r1,0xAC
	ldr	r1,[r5,r1]
	ldr	r1,[r1,0x2C]	// status effects
	mov	r0,0x18		// blinded, confused
	tst	r1,r0
	beq	@@setMoveLag

	// Movement lag x3
	mov	r0,0x3
	mul	r7,r0

@@setMoveLag:
	// Set movement lag
	str	r7,[r3,0x10]

	mov	r0,0x1
	str	r0,[r3,0x1C]

	mov	r0,0x33		// panel mask
	str	r0,[r3,0x20]
	ldr	r0,=0x1938008	// movement flags
	str	r0,[r3,0x24]
	mov	r0,0x0
	mvn	r0,r0
	str	r0,[r3,0x28]

	pop	r4-r7,r15

.align 2
@chooseMovePanel:
	// r0 = &0x1 = hollow panel only, &0x2 = allow mega col, &0x4 = allow not mega col, &0x8 = allow r1 position
	// r1 = position to avoid
	push	r4-r7,r14
	sub	sp,0x10
	mov	r4,r0
	mov	r5,0x0
	mov	r6,0x0
	mov	r7,r1

@@loop:
	ldr	r1,=@movePositions
	add	r1,r1,r5
	add	r1,r1,r5
	ldrb	r0,[r1]		// x
	cmp	r0,0xFF
	beq	@@choosePanel

	ldrb	r1,[r1,0x1]	// y
	lsl	r2,r1,0x8
	orr	r2,r0
	cmp	r2,r7
	bne	@@getPlayer

	lsr	r2,r4,0x4
	bcc	@@next

@@getPlayer:
	// Get player object
	push	r0-r1

	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88	// get player object

	// Get player column
	ldr	r1,[r0]
	ldr	r1,[r1,0x24]
	blx	r1
	lsl	r2,r0,0x18
	asr	r2,r2,0x18	// x

	pop	r0-r1

	// Check column allowed
	cmp	r0,r2
	bne	@@checkNotMegaCol

@@checkMegaCol:
	lsr	r2,r4,0x2
	bcs	@@getPanelAddress
	bcc	@@next

@@checkNotMegaCol:
	lsr	r2,r4,0x3
//	bcs	@@getPanelAddress
	bcc	@@next

@@getPanelAddress:
	// Calculate panel data address
	bl	hollow_isHollowPanel
	cmp	r1,0x0
	beq	@@next

	// Hollow panel check
	lsr	r2,r4,0x1
	bcc	@@checkCanMove
	cmp	r0,0x0
	beq	@@next

@@checkCanMove:
	mov	r0,r1
	mov	r1,0x33		// panel mask
	ldr	r2,=0x1938008	// movement flags
	bl	0x218FBD4
	cmp	r0,0x0
	beq	@@next

	// Add as candidate
	mov	r0,sp
	strb	r5,[r0,r6]
	add	r6,0x1

@@next:
	add	r5,0x1
	b	@@loop

@@choosePanel:
	mov	r0,0x0
	cmp	r6,0x0
	beq	@@end

	// Choose randomly
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,r6
	blx	0x208985C	// FX_ModS32
	mov	r1,sp
	ldrb	r0,[r1,r0]

	lsl	r0,r0,0x1
	ldr	r1,=@movePositions
	ldrh	r0,[r1,r0]

@@end:
	add	sp,0x10
	pop	r4-r7,r15


.align 2
hollow_countHollowPanels:
	push	r4-r5,r14
	ldr	r5,=@hollowPanelPositions
	mov	r4,0x0

@@loop:
	ldrb	r0,[r5]		// x
	cmp	r0,0xFF
	beq	@@end
	ldrb	r1,[r5,0x1]	// y

	// Check Hollow panel
	bl	hollow_isHollowPanel
	add	r4,r4,r0

	add	r5,0x2
	b	@@loop

@@end:
	mov	r0,r4
	pop	r4-r5,r14


.align 2
hollow_setHollowPanels:
	// r0: 0 = set immediately, 1 = spawn in
	push	r4-r5,r14
	mov	r4,r0
	ldr	r5,=@hollowPanelPositions

@@loop:
	ldrb	r0,[r5]		// x
	cmp	r0,0xFF
	beq	@@end
	ldrb	r1,[r5,0x1]	// y

	// Get data address, check already Hollow panel
	bl	hollow_isHollowPanel
	bne	@@next

	mov	r0,r1
	mov	r1,0xB		// Hollow panel

	// Spawn or set?
	cmp	r4,0x0
	bne	@@spawn

@@set:
	bl	0x218FBF0	// set panel
	b	@@next

@@spawn:
	mov	r2,0xF		// 15 frames
	bl	0x218FCAC	// spawn panel

@@next:
	// Next panel
	add	r5,0x2
	b	@@loop

@@end:
	pop	r4-r5,r15


.align 2
@move:
	push	r4-r5,r14
	mov	r4,0xAC
	ldr	r4,[r0,r4]	// collision

	mov	r5,(@VAR_START >> 0x2)
	lsl	r5,r5,0x2
	add	r5,r0,r5	// free space

	ldrh	r3,[r5,(@VAR_AITIMER - @VAR_START)]
	cmp	r3,0x0
	beq	@@clearBarrier
	sub	r3,0x1
	strh	r3,[r5,(@VAR_AITIMER - @VAR_START)]
	b	@@genericMove

@@clearBarrier:
	// Clear thunder barrier
	ldr	r2,[r4,0x2C]
	mov	r1,0x2
	bic	r2,r1
	str	r2,[r4,0x2C]

@@genericMove:
	bl	0x218091C

	pop	r4-r5,r15


	.pool


.align 2
@thunderBazooka:
	push	r4-r5,r14
	mov	r5,r0		// object

	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@gotoState0
	beq	@@gotoState1
	cmp	r0,0x3
	blt	@@gotoState2
	beq	@@gotoState3
	bgt	@@gotoState4

@@gotoState0:
	bl	@@state0
@@gotoState1:
	bl	@@state1
@@gotoState2:
	bl	@@state2
@@gotoState3:
	bl	@@state3
@@gotoState4:
	bl	@@state4

@@state0:
	// Set substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x7		// wind up bazooka
	strb	r0,[r5,r1]
	
	pop	r4-r5,r15

@@state1:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState1

	pop	r4-r5,r15

@@doState1:
	// Set substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x8		// loop bazooka
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x0
	strh	r0,[r5,0x28]

	// Set counter frames
	mov	r0,r5
	mov	r1,0x5		// 6 frames
	bl	battle_isLegendMode
	beq	@@setCounterFrames
	mov	r1,0x5		// 6 frames
@@setCounterFrames:
	bl	0x21749AC

	// Despawn previous temp objects
	mov	r1,(@VAR_CHILD1 >> 0x2)
	lsl	r1,r1,0x2
	add	r1,r5,r1
	mov	r2,0x2
	mov	r3,0x0
@@despawnTemp1:
	ldr	r0,[r1]		// temp child 1
	cmp	r0,0x0
	beq	@@despawnTemp2
	str	r2,[r0,0x18]
	str	r3,[r1]
@@despawnTemp2:
	ldr	r0,[r1,0x4]	// temp child 2
	cmp	r0,0x0
	beq	@@spawnBazooka
	str	r2,[r0,0x18]
	str	r3,[r1,0x4]

@@spawnBazooka:
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initBazooka

	// Set object functions
	ldr	r0,=battleObj_hollowBazooka_funcs
	str	r0,[r4]

@@initBazooka:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// bazooka object
	mov	r1,r5		// parent object
	bl	battleObj_hollowBazooka_init

	mov	r0,(@VAR_CHILD1 >> 0x2)
	lsl	r0,r0,0x2
	str	r4,[r5,r0]	// temp child 1

@@spawnCharge:
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initCharge

	// Set object functions
	ldr	r0,=battleObj_hollowCharge_funcs
	str	r0,[r4]

@@initCharge:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// charge object
	mov	r1,r5		// parent object
	bl	battleObj_hollowCharge_init

	mov	r0,(@VAR_CHILD2 >> 0x2)
	lsl	r0,r0,0x2
	str	r4,[r5,r0]	// temp child 2

@@state2:
	// Highlight panels
	ldrh	r0,[r5,0x28]
	lsr	r0,r0,0x2
	bcs	@@state2timer

	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	bl	0x2153484	// direction
	mov	r3,r0

	mov	r0,0x68
	ldsb	r0,[r5,r0]	// x
	mov	r1,0x69
	ldsb	r1,[r5,r1]	// y
	push	r0-r1

	add	r1,r1,r3	// add direction

	mov	r2,0x5		// beam
	bl	0x2153894	// highlight panels

	// Check if on Hollow panel
	pop	r0-r1
	bl	hollow_isHollowPanel
	cmp	r0,0x0
	beq	@@state2timer

	// Highlight fan
	mov	r0,0x68
	ldsb	r0,[r5,r0]	// x
	mov	r1,0x1

	mov	r2,0xA		// fan
	bl	0x2153894	// highlight panels

@@state2timer:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	add	r0,0x1
	strh	r0,[r5,0x28]

	mov	r1,0x6
	bl	battle_isLegendMode
	bne	@@checkDXstate2Timer
	mov	r1,0x6
@@checkDXstate2Timer:
	bl	battle_isDXBoss
	beq	@@checkState2Timer
	asr	r1,r1,0x1

@@checkState2Timer:
	cmp	r0,r1
	bge	@@doState2

	pop	r4-r5,r15

@@doState2:
	// Set substate
	mov	r0,0x3
	strb	r0,[r5,0x1D]	// substate

	// Set timer
	mov	r0,0x1E
	str	r0,[r5,0x28]

	// Spawn beam
	// Despawn previous attack object
	mov	r0,(@VAR_CHILD3 >> 0x2)
	lsl	r0,r0,0x2
	ldr	r0,[r5,r0]	// temp child 3
	cmp	r0,0x0
	beq	@@spawnBeam
	mov	r1,0x2
	str	r1,[r0,0x18]

@@spawnBeam:
	// Spawn thunder beam
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0		// object2
	beq	@@initObj

	ldr	r0,=battleObj_hollowBeam_funcs
	str	r0,[r4]

@@initObj:
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	cmp	r4,0x0
	beq	@@despawnCharge

	// Check if on Hollow panel
	mov	r0,0x68
	ldsb	r0,[r5,r0]
	mov	r1,0x69
	ldsb	r1,[r5,r1]
	bl	hollow_isHollowPanel

	mov	r2,r0		// level
	mov	r0,r4		// beam object
	mov	r1,r5		// parent object
	bl	battleObj_hollowBeam_init

	mov	r0,(@VAR_CHILD3 >> 0x2)
	lsl	r0,r0,0x2
	str	r4,[r5,r0]	// temp child 3

@@despawnCharge:
	// Despawn charge
	mov	r1,(@VAR_CHILD2 >> 0x2)
	lsl	r1,r1,0x2
	ldr	r1,[r5,r1]	// temp child 2
	cmp	r1,0x0
	beq	@@state3
	mov	r0,0x2
	str	r0,[r1,0x18]

@@state3:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	beq	@@doState3

	pop	r4-r5,r15

@@doState3:
	// Set substate
	mov	r0,0x4
	strb	r0,[r5,0x1D]	// substate

	// Set timer
	mov	r0,0x2
	strh	r0,[r5,0x28]

	// Set animation
	mov	r1,0x31
	mov	r0,0x9		// wind down bazooka
	strb	r0,[r5,r1]

	// Despawn beam
	mov	r1,(@VAR_CHILD3 >> 0x2)
	lsl	r1,r1,0x2
	ldr	r2,[r5,r1]	// temp child 3
	cmp	r2,0x0
	beq	@@end
	mov	r0,0x2
	str	r0,[r2,0x18]

	pop	r4-r5,r15

@@state4:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState4

	// Wait for timer
	ldrh	r0,[r5,0x28]
	cmp	r0,0x0
	beq	@@state4end
	sub	r0,0x1
	strh	r0,[r5,0x28]
	bne	@@state4end

	// Despawn cannon
	mov	r1,(@VAR_CHILD1 >> 0x2)
	lsl	r1,r1,0x2
	ldr	r2,[r5,r1]	// temp child 1
	cmp	r2,0x0
	beq	@@state4end
	mov	r0,0x2
	str	r0,[r2,0x18]
	
@@state4end:
	pop	r4-r5,r15

@@doState4:
	// Set current animation
	mov	r1,0x31
	mov	r0,0x0		// idle
	strb	r0,[r5,r1]

	// Return to AI state
	mov	r0,r5
	mov	r1,0x0
	bl	0x217D81C

@@end:
	pop	r4-r5,r15


	.pool


.align 2
@hollowThunder:
	push	r4-r7,r14
	mov	r5,r0		// object

	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@gotoState0
	beq	@@gotoState1
	cmp	r0,0x3
	blt	@@gotoState2
	beq	@@gotoState3
	bgt	@@gotoState4

@@gotoState0:
	bl	@@state0	// wind up animation
@@gotoState1:
	bl	@@state1	// wait for animation, loop animation, timer
@@gotoState2:
	bl	@@state2	// wait for timer, spawn hands, timer, init pattern
@@gotoState3:
	bl	@@state3	// do pattern, despawn hands, wind down animation
@@gotoState4:
	bl	@@state4	// wait for animation, idle

@@state0:
	// Set substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x4		// wind up magic
	strb	r0,[r5,r1]
	
	pop	r4-r7,r15

@@state1:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState1

	pop	r4-r7,r15

@@doState1:
	// Set substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x5		// loop magic
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x1
	strh	r0,[r5,0x28]

@@state2:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	beq	@@doState2

	pop	r4-r7,r15

@@doState2:
	// Set substate
	mov	r0,0x3
	strb	r0,[r5,0x1D]	// substate

	// Set timer
	mov	r0,0x0
	strh	r0,[r5,0x28]

	// Despawn previous temp objects
	mov	r1,(@VAR_CHILD1 >> 0x2)
	lsl	r1,r1,0x2
	add	r1,r5,r1
	mov	r2,0x2
	mov	r3,0x0
@@despawnTemp1:
	ldr	r0,[r1]		// temp child 1
	cmp	r0,0x0
	beq	@@despawnTemp2
	str	r2,[r0,0x18]
	str	r3,[r1]
@@despawnTemp2:
	ldr	r0,[r1,0x4]	// temp child 2
	cmp	r0,0x0
	beq	@@spawnHands
	str	r2,[r0,0x18]
	str	r3,[r1,0x4]

@@spawnHands:
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initHands

	// Set object functions
	ldr	r0,=battleObj_hollowHands_funcs
	str	r0,[r4]

@@initHands:
	// Initialize object
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4		// hands object
	mov	r1,r5		// parent object
	ldr	r2,=@VAR_ATKLEVEL
	ldrb	r2,[r5,r2]	// attack level
	bl	battleObj_hollowHands_init

	mov	r0,(@VAR_CHILD1 >> 0x2)
	lsl	r0,r0,0x2
	str	r4,[r5,r0]	// temp child 1

@@state3:
	// Wait for timer
	ldrh	r0,[r5,0x28]
	cmp	r0,0x0
	beq	@@nextStep
	sub	r0,0x1
	strh	r0,[r5,0x28]
	b	@@state3end

@@nextStep:
	// Get player object
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88
	cmp	r0,0x0
	beq	@@finishState3
	// Check player HP
	mov	r1,0x4C
	ldsh	r0,[r0,r1]
	cmp	r0,0x0
	ble	@@finishState3

	// Get next step
	mov	r2,(@VAR_ATKSCRIPT >> 0x2)
	lsl	r2,r2,0x2
	ldr	r1,[r5,r2]
	add	r0,r1,0x4
	str	r0,[r5,r2]
	ldrh	r0,[r1]		// step

	cmp	r0,@THUNDER_END
	beq	@@finishState3
	cmp	r0,@THUNDER_WAIT
	beq	@@stepWait
	cmp	r0,@THUNDER_SPAWN
	beq	@@stepSpawn
	cmp	r0,@THUNDER_ISLEVEL
	beq	@@stepLevel
	cmp	r0,@THUNDER_COUNTER
	beq	@@stepCounter

	b	@@finishState3

@@stepWait:
	bl	battle_isLegendMode
	bne	@@getWaitTimerLM

	ldrb	r0,[r1,0x2]	// number of frames
	b	@@setWaitTimer
@@getWaitTimerLM:
	ldrb	r0,[r1,0x3]	// number of frames
@@setWaitTimer:
	strh	r0,[r5,0x28]
	b	@@state3end

@@stepSpawn:
	add	r6,r1,0x2	// position

	// Spawn thunderbolt
	// Allocate object
	mov	r0,0x61
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0
	beq	@@initBolt

	// Set object functions
//	ldr	r0,=0x21AC358
	ldr	r0,=battleObj_hollowBolt_funcs
	str	r0,[r4]

@@initBolt:
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	mov	r0,r4
	mov	r1,r5
	mov	r2,r6
	ldr	r3,=@VAR_ATKLEVEL
	ldrb	r3,[r5,r3]
	bl	battleObj_hollowBolt_init

	b	@@nextStep

@@stepLevel:
	// Check level
	ldrh	r0,[r1,0x2]	// expected level
	ldr	r1,=@VAR_ATKLEVEL
	ldrb	r1,[r5,r1]	// actual level
	cmp	r0,r1
	beq	@@nextStep
	b	@@finishState3

@@stepCounter:
	// Set counter frames
	mov	r0,r5
	bl	battle_isLegendMode
	bne	@@getCounterFramesLM

	ldrb	r1,[r1,0x2]	// counter frames
	b	@@setCounterFrames
@@getCounterFramesLM:
	ldrb	r1,[r1,0x3]	// counter frames
@@setCounterFrames:
	bl	0x21749AC
	b	@@nextStep

@@finishState3:
	// Set substate
	mov	r0,0x4
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x6		// wind down magic
	strb	r0,[r5,r1]

	// Despawn charge
	mov	r1,(@VAR_CHILD1 >> 0x2)
	lsl	r1,r1,0x2
	ldr	r1,[r5,r1]	// temp child 1
	cmp	r1,0x0
	beq	@@state3end
	mov	r0,0x2
	str	r0,[r1,0x18]

@@state3end:
	pop	r4-r7,r15

@@state4:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState4

	pop	r4-r7,r15

@@doState4:
	// Set current animation
	mov	r1,0x31
	mov	r0,0x0		// idle
	strb	r0,[r5,r1]

	// Return to AI state
	mov	r0,r5
	mov	r1,0x0
	bl	0x217D81C

@@end:
	pop	r4-r7,r15


@spawnPanels:
	push	r4-r7,r14
	mov	r5,r0		// object

	ldrb	r0,[r5,0x1D]	// substate
	cmp	r0,0x1
	blt	@@state0
	beq	@@state1
	cmp	r0,0x3
	blt	@@state2
	beq	@@state3

@@state0:
	// Set substate
	mov	r0,0x1
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x4		// wind up magic
	strb	r0,[r5,r1]
	
	pop	r4-r7,r15

@@state1:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState1

	pop	r4-r7,r15

@@doState1:
	mov	r0,0x1
	bl	hollow_setHollowPanels

	// Set substate
	mov	r0,0x2
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x5		// loop magic
	strb	r0,[r5,r1]

	// Set timer
	mov	r0,0x10
	bl	battle_isDXBoss
	beq	@@setState1Timer
	mov	r0,0x5
@@setState1Timer:
	strh	r0,[r5,0x28]

@@state2:
	ldrh	r0,[r5,0x28]
	lsr	r0,r0,0x2	// test 0x1
	beq	@@state2timer

//	// Play panel sfx
//	ldr	r0,=0x21206CC
//	ldr	r0,[r0]
//	ldr	r1,=0x1BC
//	bl	0x2025574

@@state2timer:
	ldrh	r0,[r5,0x28]
	sub	r0,0x1
	strh	r0,[r5,0x28]
	beq	@@doState2

	pop	r4-r7,r15

@@doState2:
	// Set substate
	mov	r0,0x3
	strb	r0,[r5,0x1D]	// substate

	// Set animation
	mov	r1,0x31
	mov	r0,0x6		// wind down magic
	strb	r0,[r5,r1]

	pop	r4-r7,r15

@@state3:
	// Wait until animation finished
	mov	r1,(0x12C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r5,r1]
	cmp	r0,0x1
	beq	@@doState3

	pop	r4-r7,r15

@@doState3:
	// Set current animation
	mov	r1,0x31
	mov	r0,0x0		// idle
	strb	r0,[r5,r1]

	// Return to AI state
	mov	r0,r5
	mov	r1,0x0
	bl	0x217D81C

@@end:
	pop	r4-r7,r15


	.pool


@updateVirusSpawner:
	// Input r0 = object
	push	r4-r6,r14
	mov	r4,r0		// object

	// Exit if paused
	ldr	r0,=0x21ACC6C
	ldr	r0,[r0,0x30]
	lsr	r0,r0,0x1	// test 0x1
	bcc	@@jumpEnd
	lsr	r0,r0,0x2	// test 0x4
	bcs	@@jumpEnd

	// Check own HP nonzero
	mov	r0,0x4C
	ldsh	r0,[r4,r0]	// current HP
	cmp	r0,0x0
	ble	@@jumpEnd

	// Get player object
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88	// get player object
	mov	r5,r0
	beq	@@jumpEnd

	// Check player HP
	mov	r0,0x4C
	ldsh	r0,[r5,r0]
	cmp	r0,0x0
	ble	@@jumpEnd

	// Check not attacking
	ldrb	r0,[r4,0x1C]	// action state
	cmp	r0,0xC
	bge	@@resetTimerSlow
//	// Check flinch/whistle
//	cmp	r0,0x2		// flinch
//	beq	@@resetTimerSlow
//	cmp	r0,0x4		// whistle
//	beq	@@resetTimerSlow

	// Check status effect
	mov	r1,0xAC
	ldr	r1,[r4,r1]
	ldr	r1,[r1,0x2C]	// status effects
	mov	r0,0x64		// paralyzed, frozen, bubbled
	tst	r1,r0
	bne	@@resetTimerSlow

	// Check already a virus on the field
	mov	r1,0xDC
	ldr	r0,[r4,r1]
	cmp	r0,0x0
	bne	@@jumpEnd

	// Check virus timer
	mov	r1,0xD8
	ldr	r0,[r4,r1]
	sub	r2,r0,0x1
	str	r2,[r4,r1]
	cmp	r0,0x0
	beq	@@choosePanel
	bgt	@@jumpEnd

	// Virus timer < 0, need to reset
	// Check status effect
	mov	r2,0xAC
	ldr	r2,[r4,r2]
	ldr	r2,[r2,0x2C]	// status effects
	mov	r0,0x18		// blinded, confused
	tst	r2,r0
	beq	@@resetTimerNormal

@@resetTimerBlindedConfused:
	mov	r0,0x14
	bl	battle_isLegendMode
	beq	@@resetTimer
	mov	r0,0xA
	b	@@resetTimer

@@resetTimerSlow:
	mov	r0,0x4
	bl	battle_isLegendMode
	beq	@@resetTimer
	mov	r0,0x2
	b	@@resetTimer

@@resetTimerNormal:
	mov	r0,0x3
	bl	battle_isLegendMode
	beq	@@resetTimer
	mov	r0,0x1

@@resetTimer:
	mov	r1,0xD8
	str	r0,[r4,r1]
@@jumpEnd:
	b	@@end

@@choosePanel:
	// Get player x
	mov	r0,r5
	ldr	r1,[r0]
	ldr	r1,[r1,0x24]
	blx	r1
	lsl	r6,r0,0x18
	asr	r6,r6,0x18	// x

	// Order other two panels
	cmp	r6,0x1
	beq	@@left
	cmp	r6,0x2
	beq	@@middle
	cmp	r6,0x3
	beq	@@right
	b	@@end

@@left:
	mov	r0,0x2
	mov	r1,0x3
	b	@@checkPanels

@@middle:
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	bcc	@@middle2
@@middle1:
	mov	r0,0x1
	mov	r1,0x3
	b	@@checkPanels
@@middle2:
	mov	r0,0x3
	mov	r1,0x1
	b	@@checkPanels

@@right:
	mov	r0,0x2
	mov	r1,0x1
//	b	@@checkPanels

@@checkPanels:
	lsl	r0,r0,0x8
	lsl	r1,r1,0x10
	orr	r0,r1
	orr	r6,r0

@@panelLoop:
	// Check if this is a Hollow panel
	lsl	r0,r6,0x18
	asr	r0,r0,0x18
	mov	r1,0x3
	bl	hollow_isHollowPanel
	cmp	r0,0x0
	beq	@@nextPanel

	// Check if panel is occupied
	ldr	r0,=(0x21AD684 + 0x3*0x24)
	lsl	r1,r6,0x18
	lsr	r1,r1,0x18
	mov	r2,0xFC
	mul	r1,r2
	add	r0,r0,r1	// panel data address
	mov	r1,0x33		// panel mask
	ldr	r2,=0x1938008	// movement flags
	bl	0x218FBD4
	cmp	r0,0x0
	beq	@@nextPanel

	// Choose element
	mov	r0,r5
	bl	@chooseVirusElement

	mov	r1,r0		// element

	lsl	r3,r6,0x18
	lsr	r3,r3,0x18	// x
	mov	r0,0x3		// y
	lsl	r0,r0,0x8
	orr	r3,r0		// position

	mov	r0,r4		// parent
	mov	r2,0x2		// level
	bl	@spawnVirus

	mov	r1,0xDC
	str	r0,[r4,r1]	// spawned virus

	b	@@end

@@nextPanel:
	asr	r6,r6,0x8
	bne	@@panelLoop

@@end:
	pop	r4-r6,r15


.align 2
@chooseVirusElement:
	// r0 = target
	push	r14

	// Get target element
	mov	r1,0xAC
	ldr	r0,[r0,r1]
	ldrb	r0,[r0,0x9]	// element

	cmp	r0,0x1
	blt	@@isNull
	beq	@@isFire
	cmp	r0,0x3
	blt	@@isAqua
	beq	@@isElec
	cmp	r0,0x5
	blt	@@isWood

@@isNull:
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	mov	r1,0x3
	and	r0,r1
	b	@@end

@@isFire:
	mov	r0,0x1		// Aqua virus
	b	@@end
@@isAqua:
	mov	r0,0x2		// Elec virus
	b	@@end
@@isElec:
	mov	r0,0x3		// Wood virus
	b	@@end
@@isWood:
	mov	r0,0x0		// Fire virus
//	b	@@end

@@end:
	pop	r15


.align 2
@spawnVirus:
	// r0 = parent
	// r1 = element
	// r2 = level
	// r3 = position
	push	r0-r4,r14

	// Summon virus
	mov	r0,(0x184 >> 0x2)
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r4,r0

	ldr	r0,=battleObj_hollowVirus_funcs
	str	r0,[r4]

	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	pop	r0-r3
	lsl	r2,r2,0x8
	orr	r2,r1		// element, level
	mov	r1,r0
	mov	r0,r4
	bl	battleObj_hollowVirus_init

	mov	r0,r4
	pop	r4,r15


.align 2
hollow_isHollowPanel:
	// Input r0 = x, r1 = y
	// Returns r0 = is Hollow panel (0 or 1), r1 = data panel address
	cmp	r0,0x1
	blt	@@returnNull
	cmp	r0,0x3
	bgt	@@returnNull
	cmp	r1,0x1
	blt	@@returnNull
	cmp	r1,0x5
	bgt	@@returnNull

	// Calculate panel data address
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r1,r0,r1

	// Check Hollow panel
	ldrb	r0,[r1,0xA]
	cmp	r0,0xB
	bne	@@returnFalse

	mov	r0,0x1
	b	@@end

@@returnNull:
	mov	r1,0x0
@@returnFalse:
	mov	r0,0x0
@@end:
	bx	r14


	.pool


.align 4
hollow_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@spawn|1		// function 0x0C - object spawn
	.dw	@update|1		// function 0x10 - object update
	.dw	@despawn|1		// function 0x14 - object despawn
	.dw	0x217D74C|1		// function 0x18 - object constructor
	.dw	@destruct|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - get panel position
	.dw	0x2154F9C|1		// function 0x28 - get old real position
	.dw	0x2154F8C|1		// function 0x2C - get new real position
	.dw	0x2154F7C|1		// function 0x30 - get rotation
	.dw	@behavior|1		// function 0x34 - behavior
	.dw	0x21750E8|1		// function 0x38 - ? (called every tick)
	.dw	0x2181E1C|1		// function 0x3C - end flinch
	.dw	0x217F3AC|1		// function 0x40 - start flinch
	.dw	0x217F3C8|1		// function 0x44 - hit by paralysis
	.dw	0x217F3F0|1		// function 0x48 - hit by freeze
	.dw	0x217F42C|1		// function 0x4C - hit by bubble
	.dw	0x217F468|1		// function 0x50 - being deleted
	.dw	0x2180235|1		// function 0x54 - spawn on field start
	.dw	0x218028C|1		// function 0x58 - spawn on field update
	.dw	@spawnEnd|1		// function 0x5C - spawn on field skip
	.dw	0x218044C|1		// function 0x60 - being deleted
	.dw	0x21811B8|1		// function 0x64 - paralyzed
	.dw	@interrupt|1		// function 0x68 - interrupted

.align 4
@hollow_states:
	.dw	@ai|1			// state 0x9	// AI
	.dw	@move|1			// state 0xA	// movement
	.dw	@death|1		// state 0xB	// generic death
	.dw	@thunderBazooka|1	// state 0xC	// Thunder Bazooka
	.dw	@hollowThunder|1	// state 0xD	// Hollow Thunder
	.dw	@spawnPanels|1		// state 0xE	// Spawn Hollow Panels


.align 4
@shadowSize:
	.dw	0xD00, 0x0, 0xD00
.align 2
@hp:
	.dh	3500, 5000, 3500, 3500, 3500, 3500
.align 2
@collisionDamage:
	.dh	350, 450, 350, 350, 350, 350

@movePositions:
	.db	1, 4
	.db	1, 5
	.db	2, 4
	.db	2, 5
	.db	3, 4
	.db	3, 5
	.db	0xFF	// terminator


.definelabel	@VAR_START,		0x184	// u8[0x20]
.definelabel	@VAR_AISCRIPT,		0x184	// u32
.definelabel	@VAR_AITIMER,		0x188	// u16
.definelabel	@VAR_AIPREV,		0x18A	// u8
.definelabel	@VAR_ATKLEVEL,		0x18B	// u8
.definelabel	@VAR_ATKSCRIPT,		0x18C	// u32
.definelabel	@VAR_CHILD1,		0x194	// u32
.definelabel	@VAR_CHILD2,		0x198	// u32
.definelabel	@VAR_CHILD3,		0x19C	// u32


.definelabel	@ACTION_WAIT,		0x0	// u8 = pause virus summon too, u8, u8 = number of frames (normal, legend)
.definelabel	@ACTION_MOVE,		0x1	// u8 = target type (&0x2 = allow mega col, &0x4 = allow non-mega col, &0x8 = allow same position), u8, u8 = move lag (normal, legend)
.definelabel	@ACTION_BARRIER,	0x2	// u8, u8 = number of frames (normal, legend)
.definelabel	@ACTION_GOTO,		0x3	// u16 = relative pointer
.definelabel	@ACTION_BAZOOKA,	0x4	//
.definelabel	@ACTION_THUNDER,	0x5	//
.definelabel	@ACTION_PANELS,		0x6	// u16 = if less panels than this, spawn
.definelabel	@ACTION_SUMMON,		0x7	//
.definelabel	@ACTION_PAUSEVIRUS,	0x8	// u8, u8 = number of frames (normal, legend)
.definelabel	@ACTION_LEVEL,		0x9	// u8 = normal/legend, u16 = relative pointer
.definelabel	@ACTION_LEVEL_NORMAL,	0x009	// u16 = relative pointer
.definelabel	@ACTION_LEVEL_LEGEND,	0x109	// u16 = relative pointer
.definelabel	@ACTION_RANDOM,		0xA

.align 2
@aiScript:
.if OPT_HOLLOW_DUMMY
@@dummyLoop:
	.dh	@ACTION_WAIT
	.db	60, 60

	.dh	@ACTION_GOTO
	.dh	@@dummyLoop-(.-2)
.endif

	.dh	@ACTION_WAIT
	.db	15, 10

@@loop:
//	.dw	@ACTION_SUMMON
//	
//	.dh	@ACTION_WAIT
//	.db	60, 60
//
//	.dh	@ACTION_BARRIER
//	.db	250, 250
//	.dh	@ACTION_GOTO
//	.dh	@@loop-(.-2)

@@phase1:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	// May skip movement in Legend Mode
	.dh	@ACTION_LEVEL_NORMAL
	.dh	@@phase1move3-(.-2)

	.db	@ACTION_RANDOM
	.db	50
	.dh	@@phase1bazooka-(.-2)

@@phase1move3:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

@@phase1bazooka:
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.db	@ACTION_MOVE
	.db	(0x2 | 0x8)
	.db	1, 1
	.dw	@ACTION_BAZOOKA
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.dh	@ACTION_WAIT
	.db	15, 10

@@phase2a:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	// May skip movement in Legend Mode
	.dh	@ACTION_LEVEL_NORMAL
	.dh	@@phase2move3-(.-2)

	.db	@ACTION_RANDOM
	.db	50
	.dh	@@phase2bazooka-(.-2)

@@phase2move3:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

@@phase2bazooka:
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.db	@ACTION_MOVE
	.db	(0x2 | 0x8)
	.db	1, 1
	.dw	@ACTION_BAZOOKA
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.dh	@ACTION_WAIT
	.db	15, 10

	// May do phase on Legend Mode
	.dh	@ACTION_LEVEL_NORMAL
	.dh	@@phase4-(.-2)

	.db	@ACTION_RANDOM
	.db	50
	.dh	@@phase4-(.-2)

@@phase2b:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	// May skip movement in Legend Mode
	.db	@ACTION_RANDOM
	.db	50
	.dh	@@phase3bazooka-(.-2)

	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

@@phase3bazooka:
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.db	@ACTION_MOVE
	.db	(0x2 | 0x8)
	.db	1, 1
	.dw	@ACTION_BAZOOKA
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.dh	@ACTION_WAIT
	.db	15, 10

@@phase4:
	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	.db	@ACTION_MOVE
	.db	(0x2 | 0x4)
	.db	20, 15
	.dh	@ACTION_BARRIER
	.db	30, 20

	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.db	@ACTION_MOVE
	.db	(0x4)
	.db	1, 1
	.dw	@ACTION_THUNDER
	.dh	@ACTION_PAUSEVIRUS
	.db	5, 5
	.dh	@ACTION_WAIT
	.db	15, 10

	.dh	@ACTION_PANELS
	.dh	5

	.dh	@ACTION_GOTO
	.dh	@@loop-(.-2)


.definelabel	@THUNDER_END,		0
.definelabel	@THUNDER_WAIT,		1	// u8, u8 = number of frames (normal, legend)
.definelabel	@THUNDER_SPAWN,		2	// u8 = x, u8 = y
.definelabel	@THUNDER_ISLEVEL,	3	// u16 = level
.definelabel	@THUNDER_COUNTER,	4	// u8, u8 = counter frames (normal, legend)

.align 4
@thunderPatterns:
	.dw	@thunderPattern1
	.dw	@thunderPattern2

.align 4
@thunderPattern1:
	.dh	@THUNDER_WAIT		:: .db	3, 1
	.dh	@THUNDER_COUNTER	:: .db	5, 4
	.dh	@THUNDER_WAIT		:: .db	5, 4
	.dh	@THUNDER_SPAWN		:: .db	1, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_ISLEVEL	:: .dh	1
	.dh	@THUNDER_WAIT		:: .db	16, 10
	.dh	@THUNDER_SPAWN		:: .db	1, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dw	@THUNDER_END
.align 4
@thunderPattern2:
	.dh	@THUNDER_WAIT		:: .db	3, 1
	.dh	@THUNDER_COUNTER	:: .db	5, 4
	.dh	@THUNDER_WAIT		:: .db	5, 4
	.dh	@THUNDER_SPAWN		:: .db	3, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_ISLEVEL	:: .dh	1
	.dh	@THUNDER_WAIT		:: .db	16, 10
	.dh	@THUNDER_SPAWN		:: .db	3, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 1
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	1, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	2, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dh	@THUNDER_SPAWN		:: .db	3, 2
	.dh	@THUNDER_WAIT		:: .db	10, 8
	.dw	@THUNDER_END


@hollowPanelPositions:
	.db	1, 3
	.db	2, 3
	.db	3, 3
	.db	1, 4
	.db	2, 4
	.db	3, 4
	.db	0xFF	// terminator


// Boss objects
.include "asm/battle/battleobj_hollowhelper.asm"
.include "asm/battle/battleobj_hollowaura.asm"
.include "asm/battle/battleobj_hollowsparks.asm"
.include "asm/battle/battleobj_hollowbazooka.asm"
.include "asm/battle/battleobj_hollowcharge.asm"
.include "asm/battle/battleobj_hollowbeam.asm"
.include "asm/battle/battleobj_hollowhands.asm"
.include "asm/battle/battleobj_hollowbolt.asm"
.include "asm/battle/battleobj_hollowvirus.asm"


.align 4
overlay_0657_sinit_init:
	.dw	0
overlay_0657_sinit_init_end:
.aligna	32
overlay_0657_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 657 * 0x20
	.dw	657			// Overlay ID (overlay_0657)
	.dw	0x21BEC00		// Load address
	.dw	overlay_0657_size	// Uncompressed size
	.dw	0
	.dw	overlay_0657_sinit_init
	.dw	overlay_0657_sinit_init_end
	.dw	657			// File ID
	.skip	4

.close
