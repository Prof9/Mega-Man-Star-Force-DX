.align 2
battle_flameBurnerOverChargedSFX:
	push	r14

	ldrb	r2,[r4,0x1F]	// was overcharged
	cmp	r2,0x0
	bne	@@swapSFX

	push	r0-r1
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	battle_isOverCharged
	cmp	r0,0x0
	pop	r0-r1
	beq	@@end

@@swapSFX:
	// Large fire SFX
	ldr	r1,=0x175

	// Set marker for next time
	mov	r2,0x1
	strb	r2,[r4,0x1F]

@@end:
	bl	0x2025574
	pop	r0-r1,r15


.align 2
battle_flameBurnerOverChargedSize1:
	bl	0x2188918

	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	battle_isOverCharged
	cmp	r0,0x0
	beq	@@end

	// Increase size
	add	r1,=@@flameSize
	mov	r0,r5
	add	r0,0x90
	bl	0x200DC28

	// Move up
	ldr	r1,[r5,0x70]
	ldr	r2,[@@flameOffsetY]
	add	r1,r1,r2
	str	r1,[r5,0x70]

	// Increase duration
	mov	r0,(0x160 >> 0x4)
	lsl	r0,r0,0x4
	add	r0,r5,r0
	mov	r1,(30)
	str	r1,[r0]
	str	r1,[r0,0x8]

	// Clear charge value
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF018
	mov	r2,0x0
	strh	r2,[r1,r0]

	// Remove card
	ldr	r1,=0x21AF1A4
	add	r0,r1,r0
	ldrb	r1,[r0]		// current card idx
	ldrb	r2,[r0,0x1]	// max card idx
	add	r1,0x1
	cmp	r1,r2
	bhi	@@spawnPoof
	strb	r1,[r0]

@@spawnPoof:
	// Spawn big poof
	sub	sp,0x28
	add	r0,sp,0x4
	add	r1,=@@poofSize
	bl	0x200DC28

	add	r0,sp,0x1C
	ldr	r1,[sp,0x28]
	bl	0x2153458	// maybe not needed?

	add	r0,sp,0x10
	mov	r1,r4
	add	r1,0x6C
	bl	0x200DC28

	mov	r0,0x94
	ldr	r0,[r4,r0]
	mov	r1,(88)
	mul	r0,r1
	ldr	r1,[sp,0x14]
	add	r1,r1,r0
	str	r1,[sp,0x14]

	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	0x2153484	// direction
	mvn	r0,r0
	ldr	r1,[@@poofOffsetZ]
	mul	r1,r0
	ldr	r0,[sp,0x18]
	add	r0,r0,r1
	str	r0,[sp,0x18]

	mov	r0,0x0
	str	r0,[sp]
	mov	r0,0xB
	add	r1,sp,0x10
	mov	r2,r4
	add	r2,0x78
	add	r3,sp,0x4
	bl	0x21537F8	// spawn VFX

	add	sp,0x28

@@end:
	// Jump back
	bl	0x2178DC2

.align 4
@@poofSize:
	.dw	0x3000, 0x3000, 0x3000
@@poofOffsetZ:
	.dw	0x8000
@@flameSize:
	.dw	0x1800, 0x1800, 0x1800
@@flameOffsetY:
	.dw	0x8000


.align 2
battle_flameBurnerOverChargedSize2:
	bl	0x2188918

	// Copy scaling
	mov	r0,r4
	mov	r1,r5
	add	r0,0x90
	add	r1,0x90
	bl	0x200DC28

	// Copy y-position
	mov	r0,0x70
	ldr	r1,[r5,r0]
	str	r1,[r4,r0]

	// Jump back
	bl	0x2188ADC


.align 2
battle_flameBurnerOverChargedPower:
	add	r1,(50)
	push	r0-r1,r14

	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	bl	battle_isOverCharged
	cmp	r0,0x0
	beq	@@end

	// Add attack power
	ldr	r1,[sp,0x4]	// reloaded into r1 at end
	add	r1,r1,r0
	str	r1,[sp,0x4]

@@end:
	pop	r0-r1
	str	r1,[r4,r0]
	pop	r15


.align 2
battle_isOverCharged:
	// r0 = alignment
	// returns base attack power or 0 if card isn't overcharged
	push	r4-r6,r14
	mov	r4,r0		// alignment

//	mov	r0,r4
	bl	battle_canOverCharge
	mov	r6,r0
	beq	@@end

	// Get player data address
	mov	r0,(0x1D4 >> 0x2)
	lsl	r0,r0,0x2
	mul	r0,r4
	ldr	r1,=0x21AF018
	add	r5,r1,r0	// 0x21AF018 + align*0x1D4

	// Get max charge value
	ldrb	r0,[r5,(0x21AF022 - 0x21AF018)]	// buster type
	ldrb	r1,[r5,(0x21AF01C - 0x21AF018)]	// charge stat
	bl	0x20077F4
	lsl	r0,r0,0x1
	add	r0,0x1		// threshold = 2*(time)+1

	// Get current charge value
	ldrh	r1,[r5,(0x21AF018 - 0x21AF018)]	// charge value
	cmp	r1,r0
	bcc	@@returnFalse

	// Return card's attack power
	mov	r0,r6
	b	@@end

@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r4-r6,r15

.align 2
battle_canOverCharge:
	// r0 = alignment
	// returns base attack power or 0 if card can't be charged
	push	r4,r14
	mov	r4,r0		// alignment

	// Get Star Force
	mov	r0,(0x1D4 >> 0x2)
	lsl	r0,r0,0x2
	mul	r0,r4
	ldr	r1,=0x21AF023
	ldrb	r2,[r1,r0]
	cmp	r2,0x2		// Fire Leo
	bne	@@clipCharge

	// Get next card
	ldr	r1,=0x21AF1A4
	ldrb	r2,[r1,r0]	// card index
	add	r1,0x1		// 0x21AF1A5
	ldrb	r3,[r1,r0]	// max card index
	cmp	r2,r3
	bge	@@clipCharge

	lsl	r2,r2,0x1
	sub	r1,(0x21AF1A5 - 0x21AF144)
	add	r1,r1,r2
	ldrh	r0,[r1,r0]	// next card
	bl	0x2006D1C	// get card data ptr

	// Check if card is Standard
	ldrb	r1,[r0]
	lsr	r1,r1,0x5
//	cmp	r1,0x0
	bne	@@clipCharge

	// Check if card has Attack Power
	ldr	r1,[r0,0x20]
	lsr	r2,r1,0x1	// test 0x1
	bcc	@@clipCharge

//	// Check if card is screen-dimming
//	lsr	r2,r1,0x3	// test 0x8
//	bcs	@@clipCharge

	// Get base Attack Power
	ldrh	r0,[r0,0x6]

//	// Get special Attack Power
//	lsl	r1,r0,0x11	// test 0x8000
//	bcc	@@end
//	lsr	r0,r1,0x11
//
//	// Get lowest power
//	mov	r1,0x16
//	mul	r0,r1
//	add	r0,0x14
//	ldr	r1,=0x20B8D5C
//	ldrh	r0,[r1,r0]

	// Return true
	b	@@end

@@clipCharge:
	// Reset charge to Lv. 1 if higher
	mov	r0,r4
	bl	battle_clipCharge

	// Return false
	mov	r0,0x0
@@end:
	pop	r4,r15

.align 2
battle_overChargeModel:
	// r0 = this
	push	r4-r7,r14
	mov	r4,r0		// this
	mov	r7,0x0		// charge level 0 (charging)

	// Get player data address
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF018
	add	r5,r1,r0	// 0x21AF018 + align*0x1D4

	// Get max charge value
	ldrb	r0,[r5,(0x21AF022 - 0x21AF018)]	// buster type
	ldrb	r1,[r5,(0x21AF01C - 0x21AF018)]	// charge stat
	bl	0x20077F4
	mov	r6,r0		// max charge level

	// Get current charge value
	ldrh	r0,[r5,(0x21AF018 - 0x21AF018)]	// charge value

	// Check if below Lv. 1 threshold
	cmp	r0,r6
	bcc	@@reloadChargeModel

	mov	r7,0x1		// charge level 1 (charged)

	// Check if opponent (then hide higher levels of charge)
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	ldr	r1,=0x21ACC6C
	ldrb	r1,[r1,0x10]	// player ID
	eor	r1,r0
	cmp	r1,0x0
	bne	@@reloadChargeModel

	// Check if buster can overcharge
//	mov	r0,0x30
//	ldrb	r0,[r4,r0]	// alignment
	bl	battle_canOverCharge
	cmp	r0,0x0
	beq	@@reloadChargeModel

	mov	r7,0x2		// charge level 1 (overcharging)

	// Get current charge value
	ldrh	r0,[r5,(0x21AF018 - 0x21AF018)]	// charge value
	lsl	r1,r6,0x1
	add	r1,0x1		// threshold = 2*(time)+1

	// Check if below Lv. 2 threshold
	cmp	r0,r1
	bcc	@@reloadChargeModel

	mov	r7,0x3		// charge level 2 (overcharged)

	b	@@reloadChargeModel

@@reloadChargeModel:
	// Check current model
	mov	r0,(0x16C >> 0x2)
	lsl	r0,r0,0x2
	ldrb	r1,[r4,r0]
	cmp	r1,r7
	beq	@@end
	strb	r7,[r4,r0]

	// Unload model
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	cmp	r1,0x0
	beq	@@loadChargeModel
	bl	0x2010A9C	// unload current model

@@loadChargeModel:
	add	r0,=@@modelData
	lsl	r1,r7,0x3
	add	r0,r0,r1
	ldmia	[r0]!,r1-r2
	mov	r0,r4
	bl	0x2174634

@@end:
	pop	r4-r7,r15

	.pool

@@modelData:
	// Charge level 0 (charging)
	.dw	((1 << 16) | (290))	// models_290
	.dw	((2 << 16) | (688))	// motions_688
	// Charge level 1 (charged)
	.dw	((1 << 16) | (291))	// models_291
	.dw	((2 << 16) | (689))	// motions_689
	// Charge level 1 (overcharging)
	.dw	((1 << 16) | (525))	// models_525
	.dw	((2 << 16) | (688))	// motions_688
	// Charge level 2 (overcharged)
	.dw	((1 << 16) | (526))	// models_526
	.dw	((2 << 16) | (689))	// motions_689


.align 2
battle_overChargeUseCard:
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	push	r0-r1,r14

//	ldr	r0,[sp]
	bl	battle_clipCharge

	pop	r0-r1,r15


.align 2
battle_overChargeEnable:
	// r3 = alignment*0x1D4
	// r4 = max charge value
	// r7 = current charge value
	push	r0,r3,r14

	add	r0,(0x21AF023 - 0x21AF018)
	ldrb	r0,[r0,r3]	// Star Force form
	cmp	r0,0x2		// Fire Leo
	bne	@@normal

	// Check if buster can overcharge
	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	bl	battle_canOverCharge
	cmp	r0,0x0
	beq	@@normal

	lsl	r0,r4,0x1
	add	r0,0x1		// threshold = 2*(time)+1
	b	@@end

@@normal:
	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	bl	battle_clipCharge

	mov	r0,r4		// max charge value
@@end:
	cmp	r7,r0
	pop	r0,r3,r15

.align 2
battle_overChargeSFX:
	push	r7,r14

	lsl	r7,r4,0x1
	add	r7,0x1		// threshold = 2*(time)+1
	cmp	r1,r7
	bne	@@end

	add	r1,0x1
	strh	r1,[r0,r2]	// avoid SFX overlap

	// Check if opponent (then skip SFX)
	mov	r0,0x30
	ldrb	r0,[r5,r0]
	ldr	r1,=0x21ACC6C
	ldrb	r1,[r1,0x10]	// player ID
	eor	r0,r1
	cmp	r0,0x0
	bne	@@end

	// Play fully charged SFX
	ldr	r0,[r3]
	ldr	r1,=SE_CHARGEDONE2
	bl	0x2025574	// play SFX

@@end:
	pop	r7,r15

.align 2
battle_overChargeSFXPost:
	mov	r3,0x30
	ldrb	r3,[r5,r3]
	mov	r0,(0x1D4 >> 0x2)
	lsl	r0,r0,0x2
	bx	r14


.align 2
battle_wolfWoodsCommandSlash1:
	pop	r0

	// Check command code active
	ldrb	r1,[r4,0x1F]	// command code active
	cmp	r1,0x0
	beq	@@end

	mov	r1,0xAC
	ldr	r0,[r0,r1]	// collision
	mov	r1,0x2		// blind lv. 2 = 60i
	strb	r1,[r0,0x1B]

@@end:
	add	sp,0x30
	pop	r4,r15

.align 2
battle_wolfWoodsCommandSlash2:
	push	r0,r14
	bl	0x2183564
	pop	r7

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x0
	bne	@@checkCommandCode

	// If single player, alignment must be 0
	cmp	r4,0x0
	bne	@@end

@@checkCommandCode:
	ldrb	r1,[r5,0x1F]	// command code active
	cmp	r1,0x0
	beq	@@end

	mov	r0,0xAC
	ldr	r0,[r7,r0]	// collision
	mov	r1,0x2		// blind lv. 2 = 60i
	strb	r1,[r0,0x1B]

@@end:
	pop	r15

.align 2
battle_wolfWoodsCommandCheck:
	push	r14

	// Check command code already active
	ldrb	r0,[r4,0x1F]	// command code active
	cmp	r0,0x0
	bne	@@end

	// Get direction held
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,(0x1D4 >> 0x1)
	lsl	r1,r1,0x1
	mul	r0,r1
	ldr	r1,=0x21AF02E
	ldrh	r2,[r1,r0]	// buttons held
	lsl	r2,r2,0x18
	lsr	r2,r2,0x1C	// & 0xF0
	beq	@@reset		// no buttons held, reset
	add	r1,0x4
	ldrh	r0,[r1,r0]	// buttons going down
	lsl	r0,r0,0x18
	lsr	r0,r0,0x1C	// & 0xF0
	add	r1,=@@circleDirToIdx
	ldrb	r0,[r1,r0]

@@checkIgnore:
	cmp	r0,0xFF
	beq	@@end

@@checkDirection:
	ldrb	r1,[r4,0x1D]	// number of inputs
	cmp	r1,0x0
	beq	@@firstInput

	// Check different input
	ldrb	r2,[r4,0x1E]	// previous index + direction
	lsl	r3,r2,0x18
	asr	r3,r3,0x1C	// & 0xF0 signed
	lsl	r2,r2,0x1E
	lsr	r2,r2,0x1E	// & 0x3
	cmp	r0,r2
	beq	@@end

	cmp	r1,0x1
	beq	@@secondInput
	b	@@nextInput

@@firstInput:
	mov	r1,0x1
	strb	r1,[r4,0x1D]	// number of inputs
	strb	r0,[r4,0x1E]	// previous index + direction
	b	@@end

@@secondInput:
	sub	r2,r0,r2	// difference
	add	r2,(3)		// -3..3 -> 0..6
	cmp	r2,(-3+3)
	beq	@@startCW
	cmp	r2,(1+3)
	beq	@@startCW
	cmp	r2,(-1+3)
	beq	@@startCCW
	cmp	r2,(3+3)
//	beq	@@startCCW
	bne	@@reset

@@startCCW:
	add	r0,0xF0		// -1 << 4
	b	@@inputOK
@@startCW:
	add	r0,0x10		// 1 >> 4
	b	@@inputOK

@@nextInput:
	sub	r0,r0,r3	// input + direction
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1E	// & 0x3
	cmp	r0,r2
	bne	@@reset		// wrong direction
	add	r0,r0,r3
	lsl	r3,r3,0x4
	orr	r0,r3

@@inputOK:
	ldrb	r1,[r4,0x1D]	// number of inputs
	add	r1,0x1
	strb	r1,[r4,0x1D]	// number of inputs
	strb	r0,[r4,0x1E]	// previous index + direction

	cmp	r1,(5)		// full circle
	blt	@@end
	mov	r0,0x1
	strb	r0,[r4,0x1F]	// command code active

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=0x1BA
	bl	0x2025574

	b	@@end

@@reset:
	// Invalid input
	mov	r0,0x0
	strb	r0,[r4,0x1D]	// number of inputs
	strb	r0,[r4,0x1E]	// previous index
	strb	r0,[r4,0x1F]	// command code active
//	b	@@end

@@end:
	ldrh	r0,[r4,0x28]	// timer
	sub	r0,0x1
	pop	r15

.align 4
@@circleDirToIdx:
	.db	0xFF	// 0x0 = none: ignore
	.db	0x1	// 0x1 = right: 1
	.db	0x3	// 0x2 = left: 3
	.db	0xFF	// 0x3 = left+right: ignore
	.db	0x0	// 0x4 = up: 0
	.db	0xFF	// 0x5 = up+right: ignore
	.db	0xFF	// 0x6 = up+left: ignore
	.db	0xFF	// 0x7 = up+left+right: ignore
	.db	0x2	// 0x8 = down: 2
	.db	0xFF	// 0x9 = down+right: ignore
	.db	0xFF	// 0xA = down+left: ignore
	.db	0xFF	// 0xB = down+left+right: ignore
	.db	0xFF	// 0xC = up+down: ignore
	.db	0xFF	// 0xD = up+down+right: ignore
	.db	0xFF	// 0xE = up+down+left: ignore
	.db	0xFF	// 0xF = up+down+left+right: ignore

.align 2
battle_wolfWoodsCommandTransform:
	// r4 = this
	push	r14
	sub	sp,0x4
	mov	r0,0x2
	strb	r0,[r4,0x1C]

	// Check command code active
	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	beq	@@end

	// Destroy normal claws and spawn berserk claws
	mov	r0,r4
	bl	0x215D2F0

	// Set berserk claws active during dim
	mov	r2,0xB4
	ldr	r2,[r4,r2]
	ldr	r1,[r2,0x20]
	mov	r0,0x1
	lsl	r0,r0,0xC	// 0x1000
	orr	r1,r0
	str	r1,[r2,0x20]

	// Load texture animation
	mov	r0,0x2
	str	r0,[sp]
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	ldr	r2,=((2 << 16) | (350))
	mov	r3,0x0
	bl	0x2010AF4

	// Set texture
	mov	r0,0xA8
	ldr	r0,[r4,r0]
	ldr	r0,[r0,0x5C]
	mov	r1,0x1
	lsl	r1,r1,0xC
	str	r1,[r0]

	// Set invulnerable effect
	mov	r0,r4
	mov	r1,0x1
	bl	battle_applyModelEffect

@@end:
	add	sp,0x4
	pop	r15

.align 2
battle_wolfWoodsCommandTransformEnd:
	// r4 = this
	push	r14
	mov	r0,0x4
	strb	r0,[r4,0x1C]

	// Check command code active
	ldrb	r0,[r4,0x1F]
	cmp	r0,0x0
	beq	@@end

	// Remove invulnerable effect
	mov	r0,r4
	mov	r1,0x1
	bl	battle_clearModelEffect

@@end:
	pop	r15

	.pool


.align 2
battle_counterScrollHideVS:
	bl	0x200B900	// tilemap fill

	add	r1,=@scrollData
	mov	r0,0x0
	str	r0,[r1]

	bl	0x2196B48

.align 2
battle_counterScrollIn:
	push	r14

	// Store parameters
	add	r7,=@scrollData
	mov	r6,0x1		// state = scroll in
	stmia	[r7]!,r6
	stmia	[r7]!,r0-r3
	add	r6,sp,0x4

	ldmia	[r6]!,r0-r3	// tile, pal, x, y
	stmia	[r7]!,r0-r3
	ldmia	[r6]!,r0-r1	// width, height
	stmia	[r7]!,r0-r1

	pop	r15

.align 2
battle_counterScrollWait:
	mov	r1,r4
	add	r1,0x5A
	push	r0-r1,r14

	ldrh	r0,[r1]		// timer

	add	r3,=@scrollData
	ldrb	r2,[r3]		// state
	cmp	r2,0x1		// scroll in
	blt	@@end
	beq	@@scrollIn
	cmp	r2,0x2		// wait
	beq	@@scrollOut
	b	@@draw

@@scrollIn:
	// 2 extra frames
	add	r0,0x2
	strh	r0,[r1]
	b	@@draw

@@scrollOut:
	cmp	r0,(1+1)
	bne	@@draw
	mov	r2,0x3		// scroll out
	strb	r2,[r3]

@@draw:
	bl	@drawBattleMessage

@@end:
	pop	r0-r1
	pop	r15

.align 2
@drawBattleMessage:
	push	r5-r7,r14
	sub	sp,0x18

	add	r7,=@scrollData
	ldrb	r6,[r7]		// state

	// Load scroll parameters
	add	r7,=@scrollData+0x14
	mov	r5,sp
	ldmia	[r7]!,r0-r3
	stmia	[r5]!,r0-r3
	ldmia	[r7]!,r0-r1
	stmia	[r5]!,r0-r1
	add	r7,=@scrollData+0x4
	ldmia	[r7]!,r0-r3
	add	r7,=@scrollData

	cmp	r6,0x1
	blt	@@end
	beq	@@scrollIn
	cmp	r6,0x3
	blt	@@draw
	beq	@@scrollOut

@@scrollIn:
	mov	r6,0x2			// scroll wait
	strb	r6,[r7]

	// Scroll in
	push	r0
	ldr	r0,[sp,0x4+0xC]		// y
	add	r0,0x1
	str	r0,[sp,0x4+0xC]		// y
	ldr	r0,[sp,0x4+0x14]	// height
	sub	r0,0x1
	str	r0,[sp,0x4+0x14]	// height
	pop	r0
	b	@@draw
@@scrollOut:
	mov	r6,0x0			// hidden
	strb	r6,[r7]

	// Scroll out
	push	r0
	ldr	r0,[sp,0x4+0x10]	// width
	lsl	r0,r0,0x1
	add	r3,r3,r0		// source
	ldr	r0,[sp,0x4+0x14]	// height
	sub	r0,0x1
	str	r0,[sp,0x4+0x14]	// height
	pop	r0
//	b	@@draw
@@draw:
	bl	0x200B748	// tilemap copy

	cmp	r6,0x0
	bne	@@end

	// Hide row below
	add	r7,=@scrollData+0x1C
	mov	r5,sp
	ldmia	[r7]!,r0-r3
	add	r1,0x1		// y
	sub	r3,0x1		// height
	stmia	[r5]!,r0-r3
	add	r7,=@scrollData+0x4
	ldmia	[r7]!,r0-r2
	mov	r3,0x0
	bl	0x200B900	// tilemap fill

@@end:
	add	sp,0x18
	pop	r5-r7,r15

.align 4
@scrollData:
	// 0x00 = state
	// 0x04 = this
	// 0x08 = engine
	// 0x0C = bg
	// 0x10 = src
	// 0x14 = tile
	// 0x18 = pal
	// 0x1C = x
	// 0x20 = y
	// 0x24 = width
	// 0x28 = height
	.fill	(1+10)*0x4


.align 2
battle_matchTurnCounter:
	push	r4-r5,r14
	mov	r4,r0
	add	r5,=battle_turnCounterData

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x0
	beq	@@end

	ldr	r0,=0x6DD
	ldrb	r0,[r4,r0]	// Custom Screen state
	cmp	r0,0x0
	beq	@@opening
	cmp	r0,0x1
	beq	@@closing
	b	@@update

@@opening:
	ldrb	r0,[r5]
	cmp	r0,0x0
	bne	@@update

	// hidden -> show
	bl	@renderTurnCounter

	mov	r0,0x1		// state = show
	strb	r0,[r5]		// state
	mov	r0,0x0
	strb	r0,[r5,0x1]	// counter
	b	@@update

@@closing:
	mov	r0,0x0		// state hidden
	strb	r0,[r5]
//	b	@@update

@@update:
	ldrb	r0,[r5]
	cmp	r0,0x0
	beq	@@hide

@@show:
	ldrb	r0,[r5,0x1]
	add	r1,r0,0x1
	strb	r1,[r5,0x1]

	lsr	r0,r0,0x5	// test 0x16
	bcc	@@hide

	bl	@showTurnCounter
	b	@@end

@@hide:
	bl	@hideTurnCounter
//	b	@@end

@@end:
	// Process Custom Screen state normally
	mov	r0,r4
	bl	0x2190178

	pop	r4-r5,r15

.align 4
battle_turnCounterData:
	.db	0x0		// state: 0 = hidden, 1 = show
	.db	0x0		// counter

.align 2
@showTurnCounter:
	push	r4,r14

	// Build tilemap
	ldr	r4,=(0x21B01D0 + 0x114)
	mov	r0,0x0		// i
@@loop:
	lsl	r1,r0,0x1	// i*2
	add	r2,r1,0x1	// i*2 + 1
	mov	r3,(18*2)	// len*2
	add	r3,r1,r3	// i*2 + len*2
	strh	r1,[r4,r1]
	strh	r2,[r4,r3]
@@next:
	add	r0,0x1
	cmp	r0,(18)
	blt	@@loop

	bl	@drawTurnCounter
	pop	r4,r15

.align 2
@hideTurnCounter:
	push	r4,r14

	// Build tilemap
	ldr	r4,=(0x21B01D0 + 0x114)
	mov	r0,0x0		// i
@@loop:
	lsl	r1,r0,0x1	// i*2
	mov	r2,(18*2)	// len*2
	add	r2,r1,r2	// i*2 + len*2
	mov	r3,0x0
	strh	r3,[r4,r1]
	strh	r3,[r4,r2]
@@next:
	add	r0,0x1
	cmp	r0,(18)
	blt	@@loop

	bl	@drawTurnCounter
	pop	r4,r15

.align 2
@drawTurnCounter:
	push	r4,r14
	sub	sp,0x18

	// Draw tilemap
	ldr	r4,=(0x21B01D0 + 0x114)
	mov	r0,0x3A
	str	r0,[sp]		// starting tile
	mov	r0,0x3
	str	r0,[sp,0x4]	// palette
	add	r0,(0x100 - 0x3)
	mov	r1,(18)		// center width
	lsl	r1,r1,0x3
	sub	r0,r0,r1
	asr	r0,r0,0x4
	str	r0,[sp,0x8]	// x
	mov	r0,(0)
	str	r0,[sp,0xC]	// y
	mov	r0,(18)
	str	r0,[sp,0x10]	// width
	mov	r0,0x2
	str	r0,[sp,0x14]	// height
	ldr	r0,=0x210F350	// this
	mov	r1,0x0		// engine
	mov	r2,0x3		// BG layer
	mov	r3,r4		// source
	bl	0x200B748	// copy tilemap

	add	sp,0x18
	pop	r4,r15

.align 2
@renderTurnCounter:
	push	r4-r6,r14
	sub	sp,0x18

	// Copy palette to VRAM
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,0x3
	ldr	r3,=0x20CB364
	bl	0x202F170	// VRAM_CopyPaletteBG

	// Alloc tile buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	ldr	r2,=0x480
	bl	0x20155DC	// heap alloc
	mov	r6,r0		// buffer
	beq	@@end

	// Get turns left
	mov	r4,0x1
	bl	@getMaxTurnCount
	ldr	r1,=0x21ACC6C
	ldrh	r1,[r1,0x26]	// turns passed
	cmp	r1,r0
	bge	@@render
	sub	r4,r0,r1	// number of turns left

@@render:
	// Render "MORE TURNS" or "FINAL TURN"
	ldr	r0,=0x480
	str	r0,[sp]
	mov	r0,0x0
	str	r0,[sp,0x4]
	ldr	r0,=((29 << 0x10) | (6))	// mess_0006
	mov	r1,(16)		// script 16
	cmp	r4,0x1
	bgt	@@renderText
	mov	r1,(17)		// script 17
@@renderText:
	mov	r2,0x2
	mov	r3,r6
	bl	0x20088EC	// render text, returns length

	cmp	r4,0x1
	ble	@@copyToVRAM

	// Build script for turn count
	add	r5,=@@turnCountScript
@@firstDigit:
	cmp	r4,(10)
	blt	@@firstDigitEmpty

	mov	r0,r4
	mov	r1,(10)
	blx	0x2089820	// div s32
	add	r0,0x10		// '0'
	strb	r0,[r5]
	b	@@secondDigit

@@firstDigitEmpty:
	mov	r0,0x0
	strb	r0,[r5]
//	b	@@secondDigit

@@secondDigit:
	mov	r0,r4
	mov	r1,(10)
	blx	0x208985C	// mod s32
	add	r0,0x10		// '0'
	strb	r0,[r5,0x1]

	// Render turn count
	mov	r0,0x0
	str	r0,[sp]
	mov	r0,r5
	mov	r1,0x2
	mov	r2,(2*0x40)	// index
	add	r2,r6,r2
	mov	r3,(2*0x40)	// length
	bl	0x20089AC	// render text, returns length

@@copyToVRAM:
	// Copy to VRAM
	mov	r0,(18)		// length
	lsl	r0,r0,0x6
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	ldr	r2,=0x740
	mov	r3,r6
	bl	0x202EF0C	// VRAM_CopyTileBG3

	// Free tile buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r6
	bl	0x2015620	// heap free

@@end:
	add	sp,0x18
	pop	r4-r6,r15

.align 4
@@turnCountScript:
	.db	0x00,0x00,0xE6,0x00

.align 2
@getMaxTurnCount:
	push	r4,r14

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x0
	beq	@@turns15

	// Check if either player is vanilla MMSF
	mov	r0,0x0
	bl	battle_isMMSFDX
	beq	@@turns15
	mov	r0,0x1
	bl	battle_isMMSFDX
	beq	@@turns15

	// Get turn count types for both players
	mov	r0,0x0
	bl	battle_getTurnCountType
	mov	r4,r0
	mov	r0,0x1
	bl	battle_getTurnCountType

	// One of the players has the turns count
	orr	r0,r4
	b	@@getTurns

@@turns15:
	mov	r0,0x0
@@getTurns:
	add	r1,=@@data
	ldrb	r0,[r1,r0]
	pop	r4,r15

.align 4
@@data:
	.db	(15), (10), (5), (3)


.align 2
battle_checkFinalTurnSub1:
	push	r4,r14
	ldrh	r4,[r0,0x26]	// number of turns passed

	bl	@getMaxTurnCount
	sub	r0,0x1

	cmp	r4,r0
	pop	r4,r15

.align 2
battle_checkFinalTurn:
	push	r4,r14
	ldrh	r4,[r0,0x26]	// number of turns passed

	bl	@getMaxTurnCount
	cmp	r4,r0
	pop	r4,r15


.align 2
battle_nameStretchAppearStart:
	ldr	r1,=0x333
	lsl	r1,r1,0x1
	add	r0,0xF0
	str	r1,[r0]
	bx	r14
battle_nameStretchAppearAdd:
	ldr	r1,=0x333
	bx	r14
battle_nameStretchAppearEnd:
	ldr	r1,=0x1665
	cmp	r2,r1
	bx	r14
battle_nameStretchWait:
	push	r0-r1,r14

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x1
	beq	@@long

	// Check card name
	ldr	r0,[sp]
	mov	r1,0xE4
	ldrh	r0,[r0,r1]	// card name
	cmp	r0,0x0		// Battle Start
	beq	@@long
	mov	r1,(0x120 >> 0x4)
	lsl	r1,r1,0x4
	cmp	r0,r1		// Leo Blazer
	beq	@@long
	add	r1,(0x125 - 0x120)
	cmp	r0,r1		// Dragon Cyclone
	beq	@@long
	add	r1,(0x126 - 0x125)
	cmp	r0,r1		// Pegasus Freeze
	beq	@@long

@@short:
	mov	r2,(20)
	b	@@end
@@long:
	mov	r2,(30)
//	b	@@end
@@end:
	pop	r0-r1
	ldr	r1,[r1]
	cmp	r1,r2
	pop	r15
battle_nameStretchWaitEnd:
	add	r0,0xEC
	str	r1,[r0]
	ldr	r1,=0x1665
	str	r1,[r0,(0xF0-0xEC)]
	bx	r14
battle_nameStretchDisappearSub:
	ldr	r2,=0x333
	sub	r3,r1,r2
	lsl	r2,r2,0x1
	bx	r14

	.pool


.align 2
battle_migratoryBirdsSetInitialPosition:
	sub	r5,0x78

	// Initialize 3D snapback position
	mov	r0,r5
	mov	r1,r5
	add	r0,0x5C
	add	r1,0x6C
	bl	0x200DC28

	add	sp,0xC
	pop	r3-r6,r15

.align 2
battle_dragonDeleteAnimation:
	// r1 = animation
	ldrh	r0,[r4,0x36]	// enemy ID
	sub	r0,0xFF

	// Check if Libra
	cmp	r0,(0x113 - 0xFF)
	blt	@@end
	cmp	r0,(0x113 - 0xFF + 6)
	blt	@@libra

	// Check if Andromeda
	cmp	r0,(0x125 - 0xFF)
	blt	@@end
	cmp	r0,(0x125 - 0xFF + 6)
	blt	@@andromeda

	// Check if Dragon
	cmp	r0,(0x149 - 0xFF)
	blt	@@end
	cmp	r0,(0x149 - 0xFF + 6)
	blt	@@dragon

	b	@@end

@@libra:
	mov	r1,0x0		// fallback

	// Check current animation
	mov	r0,0x31
	ldrb	r0,[r4,r0]	// animation
	lsl	r0,r0,0x19
	lsr	r0,r0,0x19
	cmp	r0,0xC
	bge	@@end

	add	r2,=@animsLibra
	ldrb	r1,[r2,r0]
	b	@@end

@@andromeda:
	mov	r0,(0x1C2 >> 0x1)
	lsl	r0,r0,0x1
	ldrb	r1,[r4,r0]
	b	@@end

@@dragon:
	mov	r1,0x0		// fallback

	// Check snapback position
	mov	r0,0x6A
	ldrb	r0,[r4,r0]	// x
	sub	r0,0x1
	bmi	@@end
	cmp	r0,0x3
	bge	@@end

	add	r2,=@animsDragon
	ldrb	r1,[r2,r0]
//	b	@@end

@@end:
	mov	r0,0x31
	strb	r1,[r4,r0]
	bx	r14
.align 4
@animsLibra:
	.db	0x00	// Normal -> Normal
	.db	0x02	// Tilt middle to left -> Tilted left
	.db	0x02	// Tilted left -> Tilted left
	.db	0x00	// Tilt left to middle -> Normal
	.db	0x05	// Tilt middle to right -> Tilted right
	.db	0x05	// Tilted right -> Titled right
	.db	0x00	// Tilt right to middle -> Normal
	.db	0x00	// Libra Swing start -> Normal
	.db	0x00	// Libra Swing loop -> Normal
	.db	0x00	// Heavy Weight up start -> Normal
	.db	0x00	// Heavy Weight up loop -> Normal
	.db	0x00	// Heavy Weight down start -> Normal
	.db	0x00	// Heavy Weight down loop -> Normal
.align 4
@animsDragon:
	.db	0x01, 0x00, 0x02

.align 2
battle_beatDXBoss_scriptWait:
	bls	@@normal
	cmp	r0,0xC
	beq	@@state0C
@@normal:
	bx	r14

@@state0C:
	// Check script ended
	bl	0x2008D9C	// script running
	cmp	r0,0x0
	bne	@@end

	// Go back to state 0
	mov	r0,0x0
	strb	r0,[r4,0x1A]

@@end:
	bl	0x2197CA8


.align 2
battle_beatDXBoss_scriptStart:
	// r0 = 0x2103590
	push	r0,r6-r7,r14

	ldr	r1,=0xF18F	// beat new DX boss
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	sub	sp,0x14

	// Clear tilemaps
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	mov	r0,0x20
	str	r0,[sp,0x8]
	mov	r0,0x18
	str	r0,[sp,0xC]

	ldr	r0,=0x210F350
	mov	r1,0x0
	mov	r2,0x1		// BG1
	mov	r3,0x0
	bl	0x200B900	// tilemap fill

	ldr	r0,=0x210F350
	mov	r1,0x0
	mov	r2,0x2		// BG2
	mov	r3,0x0
	bl	0x200B900	// tilemap fill

	// Buffer number of DX bosses left
	bl	common_getNumberOfDXBossesDefeated
	mov	r1,(13)
	sub	r1,r1,r0
	mov	r0,0x4		// buffer 4
	bl	0x2008DF0	// set in text buffer

	// Start text script
	mov	r0,0x0
	str	r0,[sp]
	mov	r0,0x20
	str	r0,[sp,0x4]
	ldr	r0,=(0x1340 >> 0x6)
	lsl	r0,r0,0x6
	str	r0,[sp,0x8]
	mov	r0,0x5
	str	r0,[sp,0xC]
	mov	r0,0x4
	str	r0,[sp,0x10]
	ldr	r0,=((29 << 0x10) | (1274))
	mov	r1,(0)
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008754	// start text script

	mov	r0,0xC
	strb	r0,[r4,0x1A]

	add	sp,0x14

	pop	r0
	ldrh	r0,[r0]
	cmp	r0,0x0
	beq	@@skip

	// Also got Best Combo
	ldr	r1,=0xF190
	bl	0x2024018	// set flag

@@skip:
	// Skip to end
	pop	r6-r7
	add	sp,0x4
	bl	0x2197CA8

@@end:
	pop	r0
	ldrh	r0,[r0]
	cmp	r0,0x0
	pop	r6-r7,r15


.align 2
battle_getGreenInvisMaskStarForce:
	// reserved: r2
	// r4 = object
	mov	r1,r4
	beq	@@normal

	// Check main object
	mov	r0,0x36
	ldrh	r0,[r1,r0]
	cmp	r0,0x0
	beq	@@checkParent
	sub	r0,0xFF
	cmp	r0,(0x100 - 0xFF)
	beq	@@isMegaMan
	b	@@normal

@@checkParent:
	add	r1,0xB0
	ldr	r1,[r1]
	cmp	r1,0x0

	// Check parent object
	mov	r0,0x36
	ldrh	r0,[r1,r0]
	sub	r0,0xFF
	cmp	r0,(0x100 - 0xFF)
	bne	@@normal

@@isMegaMan:
	// r1 = Mega Man object
	ldrb	r0,[r1,0x1C]
	cmp	r0,0x15		// Star Force
	bne	@@normal

@@hide:
	mov	r0,0x0
	b	@@end
@@normal:
	ldr	r0,=0x80000200
@@end:
	bx	r14


.align 2
battle_invisStarForce:
	// reserved: r0, r2
	// r5 = object
	mov	r3,r5
	beq	@@normal

	// Check main object
	mov	r1,0x36
	ldrh	r1,[r3,r1]
	cmp	r1,0x0
	beq	@@checkParent
	sub	r1,0xFF
	cmp	r1,(0x100 - 0xFF)
	beq	@@isMegaMan
	b	@@normal

@@checkParent:
	add	r3,0xB0
	ldr	r3,[r3]
	cmp	r3,0x0
	beq	@@normal

	// Check parent object
	mov	r1,0x36
	ldrh	r1,[r3,r1]
	sub	r1,0xFF
	cmp	r1,(0x100 - 0xFF)
	bne	@@normal

@@isMegaMan:
	// r3 = Mega Man objct
	ldrb	r1,[r3,0x1C]
	cmp	r1,0x15		// Star Force
	bne	@@normal

@@show:
	bl	0x21751F0
@@normal:
	bl	0x2175200	// hide object


.align 2
battle_starForceRemoveStatus:
	// r4 = object
	push	r14

	// Remove blinded status
	mov	r0,r4
	bl	0x217FA6C

	// Remove confused status
	mov	r0,r4
	bl	0x217FA94

	// Remove gravity status
	mov	r0,r4
	bl	0x217F384

	mov	r0,(0x1CC >> 0x2)
	lsl	r0,r0,0x2
	pop	r15


.align 2
battle_enemyDeleted:
	push	r7,r14
	bl	0x214F7A0

	// Check fighting DX boss
	ldr	r1,=0xF199
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Set DX boss flag
	mov	r0,0x36
	ldrh	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@end

	bl	battle_getDXBossDataSpecific
	mov	r7,r0
	beq	@@end

	// Check HP 0
	mov	r0,0x4C
	ldsh	r0,[r4,r0]
	cmp	r0,0x0
	bgt	@@end

	// Check DX deleted flag
	ldrh	r1,[r7,0x4]	// DX deleted flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	ldrh	r1,[r7,0x4]	// DX deleted flag
	bl	0x2024018	// set flag

	ldr	r1,=0xF18F	// beat a new DX Boss
	bl	0x2024018

@@end:
	pop	r7,r15


.align 2
battle_dxWideClaw:
	push	r14
	bl	battle_isDXBoss
	beq	@@normal
	ldr	r1,=(500)
	b	@@end
@@normal:
	ldrb	r1,[r0,r4]
@@end:
	mov	r0,r5
	pop	r15

	.pool


.align 2
battle_isDXBoss_r3obj:
	push	r0-r3,r14
	cmp	r3,0x0
	beq	@@end
	mov	r0,0x36
	ldrh	r0,[r3,r0]
	bl	battle_getDXBossDataSpecific
	cmp	r0,0x0
@@end:
	pop	r0-r3,r15
.align 2
battle_isDXBoss_r4obj:
	push	r0-r3,r14
	cmp	r4,0x0
	beq	@@end
	mov	r0,0x36
	ldrh	r0,[r4,r0]
	bl	battle_getDXBossDataSpecific
	cmp	r0,0x0
@@end:
	pop	r0-r3,r15
.align 2
battle_isDXBoss_r5obj:
	push	r0-r3,r14
	cmp	r5,0x0
	beq	@@end
	mov	r0,0x36
	ldrh	r0,[r5,r0]
	bl	battle_getDXBossDataSpecific
	cmp	r0,0x0
@@end:
	pop	r0-r3,r15

.align 2
battle_isDXBoss:
	push	r0-r3,r14
	bl	battle_getDXBossData
	cmp	r0,0x0
	pop	r0-r3,r15


.align 2
battle_getDXBossData:
	push	r14

	// Get first enemy
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x2150904
	cmp	r0,0x0
//	beq	.
	beq	@@end		// should never happen!

	mov	r1,0x36
	ldrh	r0,[r0,r1]	// enemy ID

	bl	battle_getDXBossDataSpecific
@@end:
	pop	r15

.align 2
battle_getDXBossDataSpecific:
	// r0 = enemy ID
	push	r4-r5,r14
	mov	r4,r0
	add	r5,=@dxBossData

	// Check DX bosses active
	ldr	r1,=0xF17D
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@returnNone

	// Check beat all DX bosses
	ldr	r1,=0xF192
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@loop		// allow DX bosses in Final Boss Rush

	// Check Final Boss Rush active
	ldr	r1,=0xF151
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@returnNone	// must beat all normally first

@@loop:
	ldrh	r0,[r5]		// enemy ID
	cmp	r0,0x0
	beq	@@returnNone
	cmp	r0,r4
	bne	@@next

	// If already defeated, can always spawn
	ldrh	r1,[r5,0x4]	// defeat flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@returnData

	// Check if can spawn
	ldrh	r1,[r5,0x2]	// appear flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@next

	// Check if this is Andromeda
	ldr	r1,=0x127
	ldrh	r0,[r5]		// enemy ID
	cmp	r0,r1
	bne	@@returnData

	// Check if beat Andromeda Infinity
	ldr	r1,=0xF10F
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@returnNone

@@returnData:
	// Found
	mov	r0,r5
	b	@@end

@@next:
	add	r5,@DX_BOSS_DATA_SIZE
	b	@@loop

@@returnNone:
	mov	r0,0x0
@@end:
	pop	r4-r5,r15


.align 2
battle_printMegaManName:
	push	r4,r14
	mov	r4,r1
	ldrh	r1,[r4,0x36]	// enemy name
	mov	r0,(0x100 >> 0x8)
	lsl	r0,r0,0x8
	cmp	r1,r0
	bne	@@end

@@megaMan:
	// Check if object has Geo Color
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	bl	battle_isGeoColor
	bne	@@geoColor

	// Check if object is DX Color
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	bl	battle_isDXColor
	bne	@@dxColor

	// Use normal name
	ldrh	r1,[r4,0x36]	// enemy name
	b	@@end

@@geoColor:
	mov	r1,(221 + 0x100 - 0xFF)
	add	r1,0xFF
	b	@@end

@@dxColor:
	mov	r1,(222 + 0x100 - 0xFF)
	add	r1,0xFF
	b	@@end

@@end:
	mov	r0,r5
	pop	r4,r15


.align 2
battle_printBossNameDX:
	push	r0-r3,r14
	mov	r0,r1
	bl	battle_getDXBossDataSpecific
	cmp	r0,0x0
	beq	@@end

	ldrh	r1,[r0,0x6]	// DX name
	str	r1,[sp,0x4]	// override r1

	// Set DX boss fight flag
	ldr	r1,=0xF199
	bl	0x2024018	// set flag

@@end:
	pop	r0-r3
	bl	0x219597C	// print name
	pop	r15


.align 2
battle_dxMigratoryBirdsDamage:
	push	r4,r14
	mov	r4,0xB0
	ldr	r4,[r5,r4]
	bl	battle_isDXBoss_r4obj
	beq	@@end
	add	r1,0x2
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r4,r15


.align 2
battle_dxTextureCygnusBird:
	push	r4,r14
	mov	r4,0xB0
	ldr	r4,[r5,r4]
	bl	battle_isDXBoss_r4obj
	beq	@@end
	ldr	r4,=((1 << 0x10) | (203))
	cmp	r2,r4
	bne	@@end
	ldr	r2,=((1 << 0x10) | (507))
@@end:
	bl	0x2010EB8
	pop	r4,r15


.align 2
battle_dxModelCygnusFeather:
	push	r14
	mov	r3,0xB0
	ldr	r3,[r5,r3]
	bl	battle_isDXBoss_r3obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (508))
@@end:
	bl	0x21745FC
	pop	r15


.align 2
battle_dxModelHarpNoteSpeaker:
	push	r14
	mov	r3,0xB0
	ldr	r3,[r5,r3]
	bl	battle_isDXBoss_r3obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (496))
@@end:
	bl	0x21745FC
	pop	r15


.align 2
battle_dxModelWolfClaws:
	push	r14
	bl	battle_isDXBoss_r4obj
	beq	@@end
	add	r2,=@@data
	add	r3,r2,r1
@@end:
	ldr	r1,[r2,r1]
	ldr	r2,[r3,0x4]
	pop	r15
.align 4
@@data:
	.dw	((1 << 0x10) | (504)),	((2 << 0x10) | (542))
	.dw	((1 << 0x10) | (505)),	((2 << 0x10) | (559))


.align 2
battle_dxTextureSubObject:
	push	r4,r6-r7,r14
	mov	r6,(5)		// search at most 5 levels
	mov	r4,r5
	beq	@@end
@@loop:
	sub	r6,0x1
	beq	@@end

	add	r4,0xB0
	ldr	r4,[r4]
	cmp	r4,0x0
	beq	@@end

	mov	r7,0x36
	ldrh	r7,[r4,r7]
	cmp	r7,0xFF
	ble	@@loop
	lsl	r7,r7,0x18
	lsr	r7,r7,0x18

	cmp	r7,(37)		// Andromeda
	blt	@@end
	cmp	r7,(37 + 6)
	blt	@@checkDX

	cmp	r7,(61)		// Pegasus Magic
	blt	@@end
	cmp	r7,(61 + 6)
	blt	@@checkDX

	cmp	r7,(73)		// Dragon Sky
	blt	@@end
	cmp	r7,(73 + 6)
	blt	@@checkDX

	b	@@end

@@checkDX:
	bl	battle_isDXBoss_r4obj
	beq	@@loop
@@pegasus:
	ldr	r4,=((1 << 0x10) | (144))
	cmp	r2,r4
	bne	@@dragon
	ldr	r2,=((1 << 0x10) | (509))
@@dragon:
	ldr	r4,=((1 << 0x10) | (149))
	cmp	r2,r4
	bne	@@andromeda
	ldr	r2,=((1 << 0x10) | (510))
@@andromeda:
	ldr	r4,=((1 << 0x10) | (139))
	cmp	r2,r4
	bne	@@end
	ldr	r2,=((1 << 0x10) | (511))
@@end:
	bl	0x2010EB8
	pop	r4,r6-r7,r15


/*.align 2
battle_loadBossTextureDX:
	// r0 = object, r1 = normal texture, r2 = DX texture
	push	r14
	mov	r3,0x36
	ldrh	r3,[r0,r3]
	bl	battle_loadBossTextureDXSpecific
	pop	r15

.align 2
battle_loadBossTextureDXSpecific:
	// r0 = object, r1 = normal texture, r2 = DX texture, r3 = enemy ID
	push	r4-r6,r14
	mov	r4,r0
	mov	r5,r1
	mov	r6,r2

	mov	r0,r3
	bl	battle_getDXBossDataSpecific
	cmp	r0,0x0
	beq	@@default

	mov	r2,r6
	b	@@load

@@default:
	mov	r2,r5
//	b	@@load

@@load:
	ldr	r0,=0x2117C44
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	mov	r3,0x0
	bl	0x2010EB8

@@end:
	pop	r4-r6,r15*/


	.pool


.align 4
@dxBossData:
	//	enemy ID	appear flag, defeat flag, DX name
@dxBossData_firstEntry:
	.dh	(256 +  3),	0x0048,	0xF17F,	(256 + 201)	:: .align 4	// Taurus Fire
@dxBossData_entrySize:
	.dh	(256 +  9),	0x0049,	0xF180,	(256 + 202)	:: .align 4	// Cygnus Wing
	.dh	(256 + 15),	0x004A,	0xF181,	(256 + 203)	:: .align 4	// Harp Note
	.dh	(256 + 21),	0x004B,	0xF182,	(256 + 204)	:: .align 4	// Libra Scales
	.dh	(256 + 27),	0x004C,	0xF183,	(256 + 205)	:: .align 4	// Queen Ophiuca
	.dh	(256 + 33),	0x004D,	0xF184,	(256 + 206)	:: .align 4	// Gemini Spark B
	.dh	(256 + 36),	0x004D,	0xF184,	(256 + 207)	:: .align 4	// Gemini Spark W
	.dh	(256 + 39),	0xF191,	0xF185,	(256 + 208)	:: .align 4	// Andromeda
	.dh	(256 + 45),	0x004F,	0xF186,	(256 + 209)	:: .align 4	// Cancer Bubble
	.dh	(256 + 51),	0x0050,	0xF187,	(256 + 210)	:: .align 4	// Wolf Woods
	.dh	(256 + 57),	0x0051,	0xF188,	(256 + 211)	:: .align 4	// Crown Thunder
	.dh	(256 + 63),	0x0052,	0xF189,	(256 + 212)	:: .align 4	// Pegasus Magic
	.dh	(256 + 69),	0x0053,	0xF18A,	(256 + 213)	:: .align 4	// Leo Kingdom
	.dh	(256 + 75),	0x0054,	0xF18B,	(256 + 214)	:: .align 4	// Dragon Sky
	.dh	(256 + 79),	0xF136,	0xF18C,	(256 + 215)	:: .align 4	// Hollow
	.dh	0x0
.definelabel	@DX_BOSS_DATA_SIZE,(@dxBossData_entrySize - @dxBossData_firstEntry)


.align 2
battle_loadModelSwap1:
	mov	r4,r0	// object
	push	r5-r7,r14
	mov	r5,r1	// model
	mov	r6,r2	// animation

	// Check if model should be swapped
	add	r7,=@geoColorModelSwapTable
@@loop:
	ldr	r0,[r7]
	cmp	r0,0x0
	beq	@@end
	cmp	r0,r5
	bne	@@next

	// Check if object has Geo Color
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	bl	battle_isGeoColor
	bne	@@geoColor

	// Check if object is DX Color
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	bl	battle_isDXColor
	bne	@@dxColor

	b	@@next

@@geoColor:
	// Swap the model
	ldr	r5,[r7,0x4]	// Geo Color
	b	@@end

@@dxColor:
	// Swap the model
	ldr	r5,[r7,0x8]	// DX Color
	b	@@end

@@next:
	add	r7,0xC
	b	@@loop

@@end:
	mov	r1,r5
	mov	r2,r6
	str	r1,[r4,0x3C]
	pop	r5-r7,r15

.align 2
battle_loadModelSwap2:
	mov	r5,r0
	push	r0,r2,r4,r14
	bl	battle_loadModelSwap1
	pop	r0,r2,r4,r15

.align 4
@geoColorModelSwapTable:
	.dw	((1 << 0x10) | (151)),	((1 << 0x10) | (484)),	((1 << 0x10) | (516))	// main model
	.dw	((1 << 0x10) | (152)),	((1 << 0x10) | (485)),	((1 << 0x10) | (517))	// normal buster waves
	.dw	((1 << 0x10) | (154)),	((1 << 0x10) | (486)),	((1 << 0x10) | (518))	// pegasus buster waves
	.dw	((1 << 0x10) | (156)),	((1 << 0x10) | (487)),	((1 << 0x10) | (519))	// leo buster waves
	.dw	((1 << 0x10) | (158)),	((1 << 0x10) | (488)),	((1 << 0x10) | (520))	// dragon buster waves
	.dw	((1 << 0x10) | (290)),	((1 << 0x10) | (489)),	((1 << 0x10) | (521))	// buster charge VFX 1
	.dw	((1 << 0x10) | (291)),	((1 << 0x10) | (490)),	((1 << 0x10) | (522))	// buster charge VFX 2
	.dw	((1 << 0x10) | (287)),	((1 << 0x10) | (491)),	((1 << 0x10) | (523))	// buster fire VFX
	.dw	((1 << 0x10) | (311)),	((1 << 0x10) | (492)),	((1 << 0x10) | (524))	// buster shot VFX
	.dw	((1 << 0x10) | (525)),	((1 << 0x10) | (527)),	((1 << 0x10) | (528))	// overcharge VFX 1
	.dw	0x0


.align 2
battle_getExtraStats:
	// r0 = alignment
	push	r14
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF1B4		// buster stats
	add	r1,r1,r0
	ldrb	r0,[r1,0x3]		// extra stats 1
	ldrb	r1,[r1,0x7]		// extra stats 2
	lsl	r1,r1,0x8
	orr	r0,r1
	pop	r15

.align 2
battle_isAutoLockOff:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	mov	r1,0x40
	tst	r0,r1
	pop	r15

.align 2
battle_setAutoLockOff:
	// r0 = alignment
	// r1 = 1 for off, 0 for on
	push	r14
	mov	r2,(0x1D4 >> 0x2)
	lsl	r2,r2,0x2
	mul	r0,r2
	ldr	r2,=0x21AF1B4+0x3	// buster stats
	ldrb	r3,[r2,r0]
	cmp	r1,0x0
	beq	@@clear
@@set:
	mov	r1,0x40
	orr	r3,r1
	b	@@end
@@clear:
	mov	r1,0x40
	bic	r3,r1
@@end:
	strb	r3,[r2,r0]
	pop	r15

.align 2
battle_toggleAutoLockOff:
	// r0 = alignment
	push	r14
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF1B4+0x3	// buster stats
	ldrb	r2,[r1,r0]
	mov	r3,0x40
	eor	r2,r3
	strb	r2,[r1,r0]
	pop	r15

.align 2
battle_isMMSFDX:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	mov	r1,0x1
	tst	r0,r1
	pop	r15

.align 2
battle_isGeoColor:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	mov	r1,0x2
	tst	r0,r1
	pop	r15

.align 2
battle_isDXColor:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	mov	r1,0x20
	tst	r0,r1
	pop	r15

.align 2
battle_isNoneSatellite:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	mov	r1,0x10
	tst	r0,r1
	pop	r15

.align 2
battle_getHumorBusterType:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1E
	pop	r15

.align 2
battle_getTurnCountType:
	// r0 = alignment
	push	r14
	bl	battle_getExtraStats
	lsl	r0,r0,0x16	// mask 0x300
	lsr	r0,r0,0x1E
	pop	r15


.align 2
battle_frostMissilesRefreshShield:
	// r0 = object
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	mov	r1,0x30
	ldrb	r1,[r0,r1]	// alignment
	cmp	r1,0x0
	beq	@@end

	// Refresh shield
	mov	r1,0xAC
	ldr	r1,[r0,r1]
	cmp	r1,0x0
	beq	@@end
	ldr	r2,[r1,0x2C]
	mov	r3,0x2
	orr	r2,r3
	str	r2,[r1,0x2C]

@@end:
	// r0 = object
	bl	0x218B7D0
	pop	r15


.align 2
battle_frostMissilesCheckHit:
	// r4 = object
	push	r14
	mov	r0,(0x730000 >> 0x10)
	lsl	r0,r0,0x10
	tst	r0,r1
	beq	@@returnFalse

	bl	battle_isLegendMode
	beq	@@returnTrue

	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	cmp	r0,0x0
	beq	@@returnTrue

	// Attack must have breaking property
	mov	r0,0x2
	tst	r0,r1
	beq	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
//	b	@@end
@@end:
	pop	r15


.align 2
battle_counterHitShieldCounter:
	ldr	r1,=0x80000200
	tst	r1,r2
	bx	r14

.align 2
battle_counterHitBonusCardCheck:
	push	r14

	// When you get Counter Hit in Legend Mode
	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@normal

	// Check alignment
	ldrb	r0,[r5,0xA]
	cmp	r0,0x0
	beq	@@normal

	// Treat as Counter Hit from Bonus Card
	add	sp,0x4
	bl	0x2154890

@@normal:
	mov	r0,0x2
	ldr	r1,[r5,0x3C]
	pop	r15


.align 2
battle_counterHitAlignNormal:
	cmp	r2,r1
	bne	@@enemyCounter
	bx	r14

@@enemyCounter:
	mov	r0,0x0
	str	r0,[sp]
	ldr	r0,=0x21B01D0
	mov	r1,(8)		// ENEMY COUNTER!
	mov	r2,0x1		// single message
	mov	r3,0x0		// default duration
	bl	0x21953EC	// start pop-message

	bl	0x215486A


.align 2
battle_counterHitAlignBonus:
	cmp	r1,r0
	bne	@@enemyCounter
	bx	r14

@@enemyCounter:
	mov	r0,0x0
	str	r0,[sp]
	ldr	r0,=0x21B01D0
	mov	r1,(8)		// ENEMY COUNTER!
	mov	r2,0x1		// single message
	mov	r3,0x0		// default duration
	bl	0x21953EC	// start pop-message

	bl	0x21548B2


.align 2
battle_blackHoleCounterHit:
	push	r14

	bl	battle_isLegendMode
	beq	@@normal

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x1
	beq	@@normal

	// Check element
	ldrb	r0,[r5,0x9]
	cmp	r0,0x5
	bne	@@normal

	// Check damage
	ldr	r0,[r5,0x30]
	lsl	r0,r0,0x14
	lsr	r0,r0,0x14
	cmp	r0,(10)
	bgt	@@normal

	// This is probably Black Hole
	mov	r0,0x0
	b	@@end

@@normal:
	ldr	r0,[r4,0x5C]
@@end:
	cmp	r0,0x0
	pop	r15


.align 2
battle_timeTrialGaugeSpeed:
	push	r0-r1,r14

	// Check Time Trial active
	ldr	r1,=0xF008
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r1
	bne	@@end

	// Set gauge speed
	add	r0,0x82
	strh	r1,[r0]

@@end:
	pop	r15


.align 2
battle_preserveLastStateOnInterrupt1:
	mov	r4,r0
	mov	r1,(0x1CC >> 0x2)

	add	r3,=@lastState
	ldrb	r2,[r4,0x1C]		// current state
	str	r2,[r3]
	bx	r14

battle_preserveLastStateOnInterrupt2:
	ldrh	r0,[r4,0x36]		// enemy ID
	lsl	r0,r0,0x18
	beq	@@end			// skip for 0x0 (none) and 0x100 (Mega Man)

	ldr	r0,[@lastState]		// old state
	ldrb	r1,[r4,0x1C]		// new state

	cmp	r0,r1
	beq	@@end

	// Preserve on delete, flinch, paralyze, whistle, freeze, bubble
	cmp	r1,0x1
	blt	@@end
	cmp	r1,0x6
	bgt	@@end

	strb	r0,[r4,0x1F]
@@end:
	pop	r4-r6,r15

.align 4
@lastState:
	.dw	0x0

.align 2
battle_shouldRecoilOnParalyze:
	// All viruses don't recoil
	// Check if Jammer
	cmp	r0,(89)
	blt	@@returnFalse
	cmp	r0,(89 + 6)
	blt	@@returnTrue

	// Check if other virus
	cmp	r0,0xFF
	ble	@@returnFalse
	sub	r0,0xFF
	sub	r0,0x1

	// Check if Libra Scales
	cmp	r0,0x13
	blt	@@returnTrue
	cmp	r0,(0x13 + 6)
	blt	@@returnFalse

	// Check if Andromeda
	cmp	r0,0x25
	blt	@@returnTrue
	cmp	r0,(0x25 + 6)
	blt	@@returnFalse

	// Check if Dragon Sky
	cmp	r0,0x49
	blt	@@returnTrue
	cmp	r0,(0x49 + 6)
	blt	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
//	b	@@end
@@end:
	bx	r14

.align 2
battle_paralysisEnd:
	push	r14
	str	r0,[r1,0x20]

	ldrh	r0,[r1,0x36]
	bl	battle_shouldRecoilOnParalyze
	cmp	r0,0x0
	bne	@@end

@@normal:
	// Set animation finished
	mov	r3,(0x12C >> 0x2)
	lsl	r3,r3,0x2
	mov	r0,0x1
	str	r0,[r1,r3]

	// Next state
	mov	r2,0x2
	strb	r2,[r1,0x1D]
	mov	r2,0x0
	strh	r2,[r1,0x1E]

	// Does not do recover animation
	add	sp,0x4
	mov	r0,r1
	bl	0x21812EE

@@end:
	// Does recover animation
	pop	r15

.align 2
battle_bubbleEnd:
	// Does not do recover animation
	mov	r0,r4
	pop	r3-r5
	push	r4
	bl	0x2181B6E	// call next state immediately


.align 2
battle_removeSnapback:
	// r4 = object
	push	r7,r14
	mov	r0,0x6A
	ldrh	r7,[r4,r0]	// snapback position

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x1
	beq	@@end2

	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	cmp	r0,0x0
	beq	@@end2

	ldrh	r0,[r4,0x36]	// enemy ID
	ldrb	r1,[r4,0x1F]	// last action state
	mov	r2,0x0
	strb	r2,[r4,0x1F]

	cmp	r0,0x0
	beq	@@end2
	mov	r2,(0x100 >> 0x8)
	lsl	r2,r2,0x8
	cmp	r0,r2
	beq	@@end2

	cmp	r1,0x9
	beq	@@checkPlayerRow

	cmp	r0,(13)
	blt	@@end2
	cmp	r0,(13 + 6)
	blt	@@crowcar

	cmp	r0,(25)
	blt	@@end2
	cmp	r0,(25 + 6)
	blt	@@hotRoader

	cmp	r0,(77)
	blt	@@end2
	cmp	r0,(77 + 6)
	blt	@@bellGong

//	cmp	r0,(83)
//	blt	@@end2
	cmp	r0,(83 + 6)
	blt	@@greatAx

	cmp	r0,(149)
	blt	@@end2
	cmp	r0,(149)
	blt	@@lampis

	cmp	r0,(255)
	ble	@@end2
	lsl	r0,r0,0x18
	lsr	r0,r0,0x18

	cmp	r0,(1)
	blt	@@end2
	cmp	r0,(1 + 6)
	blt	@@taurusFire

//	cmp	r0,(7)
//	blt	@@end2
	cmp	r0,(7 + 6)
	blt	@@cygnusWing

//	cmp	r0,(13)
//	blt	@@end2
	cmp	r0,(13 + 6)
	blt	@@harpNote

//	cmp	r0,(19)
//	blt	@@end2
	cmp	r0,(19 + 6)
	blt	@@libraScales

//	cmp	r0,(25)
//	blt	@@end2
	cmp	r0,(25 + 6)
	blt	@@queenOphiuca

//	cmp	r0,(31)
//	blt	@@end2
	cmp	r0,(31 + 6)
	blt	@@geminiSpark

	cmp	r0,(43)
	blt	@@end2
	cmp	r0,(43 + 6)
	blt	@@cancerBubble

//	cmp	r0,(49)
//	blt	@@end2
	cmp	r0,(49 + 6)
	blt	@@wolfWoods

//	cmp	r0,(55)
//	blt	@@end2
	cmp	r0,(55 + 6)
	blt	@@crownThunder

//	cmp	r0,(61)
//	blt	@@end2
	cmp	r0,(61 + 6)
	blt	@@pegasusMagic

//	cmp	r0,(67)
//	blt	@@end2
	cmp	r0,(67 + 6)
	blt	@@leoKingdom

	cmp	r0,(79)
	blt	@@end2
	cmp	r0,(79 + 6)
	blt	@@hollow

@@end2:
	b	@@end

@@harpNote:
@@cancerBubble:
@@hollow:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	b	@@end

@@hotRoader:
	cmp	r1,0xB		// Hot Drive
	beq	@@checkPlayerRow
	b	@@end

@@crowcar:
	cmp	r1,0xC		// Bird Arrow
	beq	@@checkPlayerRow
	b	@@end

@@bellGong:
	cmp	r1,0xD		// Boxer Hook
	beq	@@checkPlayerRow
	b	@@end

@@leoKingdom:
	cmp	r1,0xE		// Volcano Claws
	beq	@@checkPlayerRow
	b	@@end

@@wolfWoods:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xB		// Wide Claw
	beq	@@checkPlayerRow
	b	@@end

@@taurusFire:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xC		// Bird Arrow
	beq	@@checkPlayerRow
	b	@@end

@@cygnusWing:
@@pegasusMagic:
	cmp	r1,0xA
	beq	@@checkPlayerRow
	cmp	r1,0xD		// Dancing Swan, Star Road
	beq	@@checkPlayerRow
	b	@@end

@@queenOphiuca:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xE		// Quick Serpent
	beq	@@checkPlayerRow
	b	@@end

@@greatAx:
	cmp	r1,0xB		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xC		// Big Ax
	beq	@@checkPlayerRow
	b	@@end

@@lampis:
	cmp	r1,0xC		// Flicker Flash
	beq	@@checkPlayerRow
	cmp	r1,0xD		// Flicker Kick
	beq	@@checkPlayerRow
	b	@@end

@@libraScales:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xE		// Libra Swing
	beq	@@checkPlayerRow
	cmp	r1,0xF		// Heavy Weight
	beq	@@checkPlayerRow
	b	@@end

@@geminiSpark:
@@crownThunder:
	cmp	r1,0xA		// Movement
	beq	@@checkPlayerRow
	cmp	r1,0xB		// Elec Sword, 1 ghost
	beq	@@checkPlayerRow
	cmp	r1,0xC		// Rocket Knuckle, 2 ghosts
	beq	@@checkPlayerRow
	b	@@end

@@checkPlayerRow:
	mov	r0,0x69
	ldrb	r0,[r4,r0]	// y
	cmp	r0,0x1
	bgt	@@noSnapback

	// Cygnus Wing check
	ldrh	r0,[r4,0x36]
	lsl	r0,r0,0x18
	bcc	@@snapback
	lsr	r0,r0,0x18
	cmp	r0,(7)
	blt	@@snapback
	cmp	r0,(7 + 6)
	bge	@@snapback
	cmp	r1,0xD		// Dancing Swan
	bne	@@snapback

	// If Dancing Swan on 2nd column, move to 2nd row
	mov	r0,0x68
	ldrb	r0,[r4,r0]	// x
	cmp	r0,0x2
	bne	@@snapback

	// Set to 2nd row
	mov	r7,0x2
	lsl	r7,r7,0x8
	orr	r7,r0
	b	@@end

@@noSnapback:
	mov	r0,0x68
	ldrh	r7,[r4,r0]
	mov	r0,0x6A
	strh	r7,[r4,r0]
//	b	@@end

@@snapback:
//	mov	r0,0x6A
//	ldrh	r7,[r4,r0]	// snapback position
@@end:
	mov	r2,r7
	pop	r7,r15


.align 2
battle_showDamageForAdminGiga:
	push	r1,r14
	lsl	r0,r0,0x10
	asr	r0,r0,0x10

	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@end

	// Get parent object
	mov	r1,0xB0
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@end

	// Get parent alignment
	add	r1,0x30
	ldrb	r1,[r1]
	cmp	r1,0x0
	beq	@@end

	// Show damage x2
	lsl	r0,r0,0x1

@@end:
	pop	r1,r15


.align 2
battle_waveBattleRewardGetCardCount:
	add	r0,r4,r0
	ldrb	r0,[r0,0x8]

	// Ignore all red cards
	cmp	r4,0x3
	bge	@@returnNone

//	// Ignore newly added Standard cards
//	cmp	r5,(169)
//	blt	@@returnCount
//	cmp	r5,(181)
//	blt	@@returnNone

@@returnCount:
	b	@@end

@@returnNone:
	mov	r0,0x0
@@end:
	bx	r14


.align 2
battle_lmBustingLevel:
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r4,0x1		// Busting Level
@@end:
	mov	r0,(0x1D4 >> 0x2)
	lsl	r0,r0,0x2
	pop	r15


	.pool


.align 2
battle_extraBattleFields:
	cmp	r0,0xF
	blt	@@end
	sub	r0,0xF
	add	r2,=@extraBattleFields
@@end:
	mov	r1,0xF
	mul	r1,r0
	bx	r14

.align 4
@extraBattleFields:
	// 0xF - Holy Stage (for enemies)
	.db	0x7, 0x7, 0x7
	.db	0x7, 0x7, 0x7
	.db	0x7, 0x7, 0x7
	.db	0x1, 0x1, 0x1
	.db	0x1, 0x1, 0x1
	// 0x10 - Gravity Stage
	.db	0x9, 0x9, 0x9
	.db	0x9, 0x9, 0x9
	.db	0x9, 0x9, 0x9
	.db	0x9, 0x9, 0x9
	.db	0x9, 0x9, 0x9
	// 0x11 - Guard Null Stage
	.db	0x8, 0x8, 0x8
	.db	0x8, 0x8, 0x8
	.db	0x8, 0x8, 0x8
	.db	0x8, 0x8, 0x8
	.db	0x8, 0x8, 0x8


.align 2
battle_grassHeal:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// Check if this is Dragon Sky
	mov	r1,0x36
	ldrh	r1,[r4,r1]
	lsl	r1,r1,0x18
	bcc	@@normal	// not a boss
	lsr	r1,r1,0x18
	cmp	r1,0x49
	blt	@@normal
	cmp	r1,0x4E
	bgt	@@normal

	// Check if not in Dragon Road
	ldrb	r1,[r4,0x1C]
	cmp	r1,0xD
	beq	@@normal

	// Treat as on grass panel
	mov	r0,0x4
	b	@@end

@@normal:
	ldrb	r0,[r0,0xA]
@@end:
	cmp	r0,0x4
	pop	r15

.align 2
battle_capMegaManHP:
	push	r1,r4,r14
	ldr	r4,[r1]

	// Check Time Trial active
	ldr	r1,=0xF008
	bl	0x202409C	// check flag
	beq	@@end

	mov	r0,0x1
	bl	0x20335D4
	ldr	r2,=0x213110C
	ldrh	r1,[r2,0x22]
	add	r0,r1,r0	// base + brother HP
	strh	r0,[r4,0x4]	// max HP
	strh	r0,[r4,0x6]	// max HP

	ldrh	r1,[r4]
	cmp	r1,r0
	ble	@@end
	strh	r0,[r4]		// current HP
	strh	r0,[r4,0x2]	// current HP

@@end:
	ldrh	r2,[r4]
	pop	r1,r4,r15


.align 2
battle_applyModelEffect:
	push	r4-r5,r14
	mov	r4,r0		// object
	mov	r5,r1		// effect

	// Apply to main model
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	mov	r2,r5
	bl	0x2011994

@@checkID:
	mov	r0,0x36
	ldrh	r0,[r4,r0]
	lsl	r0,r0,0x18
	bcc	@@virus

@@boss:
	// Check Mega Man
	lsr	r0,r0,0x18
	beq	@@megaMan
	b	@@end

@@megaMan:
	// Apply to Pegasus wings
	mov	r0,0xB8
	ldr	r1,[r4,r0]	// wings object

@@applyChild:
	// r1 = object
	cmp	r1,0x0
	beq	@@end
	add	r1,0xA8
	ldr	r1,[r1]		// model
	mov	r2,r5
	bl	0x2011994

@@virus:
@@end:
	pop	r4-r5,r15

.align 2
battle_clearModelEffect:
	push	r4-r5,r14
	mov	r4,r0		// object
	mov	r5,r1		// effect

	// Clear from main model
	mov	r1,0xA8
	ldr	r1,[r4,r1]
	cmp	r1,0x0
	beq	@@checkID
	mov	r2,r5
	bl	0x20119A0

@@checkID:
	mov	r0,0x36
	ldrh	r0,[r4,r0]
	lsl	r0,r0,0x18
	bcc	@@virus

@@boss:
	// Check Mega Man
	lsr	r0,r0,0x18
	beq	@@megaMan
	b	@@end

@@megaMan:
	// Clear from Pegasus wings
	mov	r0,0xB8
	ldr	r1,[r4,r0]	// wings object

@@clearChild:
	// r1 = object
	cmp	r1,0x0
	beq	@@end
	add	r1,0xA8
	ldr	r1,[r1]		// model
	cmp	r1,0x0
	mov	r2,r5
	bl	0x20119A0

@@virus:
@@end:
	pop	r4-r5,r15


.align 2
battle_fixBestComboStatusGuard:
	push	r4,r14
	mov	r3,0x0		// ignore status

	// Check if this is Andromeda or a Satellite Admin
	mov	r2,0x36
	ldrh	r2,[r6,r2]	// name ID
	sub	r2,0xFF
	bmi	@@normal

@@checkCancerBubble:
	cmp	r2,(0x12B - 0xFF)
	blt	@@checkCrownThunder
	cmp	r2,(0x12B - 0xFF + 0x6)
	bge	@@checkCrownThunder

	// Load status from combo
	ldrb	r3,[r1,0xB]
	cmp	r3,0x5		// bubble
	beq	@@ignore
	b	@@end

@@checkCrownThunder:
	cmp	r2,(0x137 - 0xFF)
	blt	@@checkAndromeda
	cmp	r2,(0x137 - 0xFF + 0x6)
	bge	@@checkAndromeda

	// Load status from combo
	ldrb	r3,[r1,0xB]
	cmp	r3,0x1		// paralyze
	beq	@@ignore
	b	@@end

@@checkAndromeda:
	cmp	r2,(0x125 - 0xFF)
	blt	@@checkAdmins
	cmp	r2,(0x125 - 0xFF + 0x6)
	blt	@@ignore

@@checkAdmins:
	cmp	r2,(0x13D - 0xFF)
	blt	@@checkGreenDragon
	cmp	r2,(0x13D - 0xFF + 0x6 * 0x3)
	blt	@@ignore

@@checkGreenDragon:
	// Check for Green Dragon Mega Man
	cmp	r2,(0x100 - 0xFF)
	bne	@@normal
	mov	r2,0x30
	ldrb	r2,[r6,r2]
	mov	r4,(0x1D4 >> 0x2)
	lsl	r4,r4,0x2
	mul	r2,r4
	ldr	r4,=0x21AF023
	ldrb	r2,[r4,r2]
	cmp	r2,0x3		// Green Dragon
	beq	@@ignore

@@normal:
	// Load status from combo
	ldrb	r3,[r1,0xB]
	b	@@end
@@ignore:
	mov	r3,0x0
@@end:
	cmp	r3,0x0
	pop	r4,r14


.align 2
battle_onEnter:
	push	r0-r3,r14

	// Clear variables
	mov	r0,0x0
	ldr	r1,=battle_counterCount
	strb	r0,[r1]
	strb	r0,[r1,0x1]
	ldr	r1,=battle_counteredEnemies
	str	r0,[r1]
	str	r0,[r1,0x4]
	str	r0,[r1,0x8]
	str	r0,[r1,0xC]
	strh	r0,[r1,0x10]
	ldr	r1,=battle_cutInObjectQueue
	str	r0,[r1]
	ldr	r1,=battle_vars
	str	r0,[r1]
	ldr	r1,=@greenInvisTimers
	str	r0,[r1]
	str	r0,[r1,0x4]
	ldr	r1,=battle_turnCounterData
	strb	r0,[r1]
	strb	r0,[r1,0x1]

	ldr	r1,=@scrollData
	str	r0,[r1]

	// Clear fighting DX Boss flag
	ldr	r1,=0xF199
	bl	0x202405C	// clear flag

	// Clear LuPelvis deleted temp flag
	ldr	r1,=0xF19A
	bl	0x202405C	// clear flag

	// Revert back to Geo post battle
	ldr	r1,=0xF19B
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	ldr	r1,=0xF19B
	bl	0x202405C	// clear flag

	ldr	r1,=0x213464C
	mov	r0,0x0
	strh	r0,[r1,0x28]

@@end:
	pop	r0-r3
	bl	0x214FDF4
	pop	r15


.align 2
battle_onExit:
	push	r14

	// Check disable Power Up stats for next fight flag
	ldr	r1,=0xF14D
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Reload Power Up stats (if disabled)
	bl	0x20228D4	// is enabled
	cmp	r0,0x0
	beq	@@clearPowerUpDisableFlag

	bl	0x202291C	// get level
	sub	r0,0x1
	mov	r1,0x1		// enabled
	bl	0x20336EC	// update stats

@@clearPowerUpDisableFlag:
	// Clear flag
	ldr	r1,=0xF14D
	bl	0x202405C	// clear flag

@@end:
	mov	r0,(0x930 >> 0x4)
	lsl	r0,r0,0x4
	pop	r15


.align 2
battle_rewardImage:
	push	r14

	ldr	r2,=0xFFFF
	cmp	r1,r2
	beq	@@end

	// Check if & 0xC000 (Star Frag)
	lsr	r2,r1,0xE
	cmp	r2,0x3
	bne	@@end

	lsl	r2,r1,0x12
	lsr	r2,r2,0x12

	//  1- 4 = green
	//  5-10 = yellow
	// 11-16 = red
	// 17+   = purple
	mov	r1,(224)	// Star Frag image (green)
	cmp	r2,(4)
	ble	@@end
	mov	r1,(225)	// Star Frag image (yellow)
	cmp	r2,(10)
	ble	@@end
	mov	r1,(226)	// Star Frag image (red)
	cmp	r2,(16)
	ble	@@end
	mov	r1,(227)	// Star Frag image (purple)

@@end:
	bl	0x21982FC	// draw image
	pop	r15

.align 2
battle_rewardName:
	push	r14

	ldr	r2,=0xFFFF
	cmp	r1,r2
	beq	@@end

	// Check if & 0xC000 (Star Frag)
	lsr	r2,r1,0xE
	cmp	r2,0x3
	bne	@@end

	// Buffer Star Frag count
	push	r0-r1
	mov	r0,0x4		// buffer 4
	lsl	r1,r1,0x12
	lsr	r1,r1,0x12
	bl	0x2008DF0	// set in text buffer
	pop	r0-r1

	mov	r1,(224)	// Star Frag name

@@end:
	bl	0x21984EC	// draw name
	pop	r15

.align 2
battle_rewardGet:
	push	r14

	// Check NO DATA
	ldr	r3,=0xFFFF
	cmp	r1,r3
	beq	@@normal

	// Check if & 0xC000
	lsr	r3,r1,0xE
	cmp	r3,0x3
	bne	@@normal

	// Add Star Frags
	lsl	r0,r1,0x12
	lsr	r0,r0,0x12
	bl	common_addStarFrags

	// Play item get SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_RESCUE
	bl	0x2025574	// play SFX
	b	@@end

@@normal:
	bl	0x2198E90	// get reward
@@end:
	pop	r15


.align 2
battle_jammerMultiDelete:
	// r1 = alignment
	push	r14

	// Reduce enemy count
	sub	r0,0x1
	strb	r0,[r2,r1]

	// Check if this is a Jammer
	mov	r0,0x36
	ldrh	r0,[r4,r0]	// enemy ID
	cmp	r0,(0x59)
	blt	@@end
	cmp	r0,(0x59 + 0x6)
	bge	@@end

@@multiDelete:
	// Register for multi-delete
	mov	r0,0x1
	eor	r1,r0
	ldr	r0,=0x21ACC6C
	bl	0x2152084

@@end:
	pop	r15


.align 2
battle_hpRewards:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	mov	r0,0x0		// always use high HP rewards
	b	@@end
@@normal:
	bl	0x219802C
@@end:
	pop	r15


.align 2
battle_cardSummonGauge:
	sub	r5,0x10
	ldr	r5,[r4,r5]
	cmp	r5,0x13
	beq	@@gaugeCard

	// return
	bx	r14

@@gaugeCard:
	// Alloc object
	mov	r0,(0x184 >> 0x2)
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r5,r0
	beq	@@linkObject

	// Initialize object
//	bl	0x2150618
	ldr	r0,=battleObj_gaugeCard_funcs
	str	r0,[r5]

@@linkObject:
	// Add object to linked list
	ldr	r0,=0x212E2C0
	add	r1,r5,0x4
	mov	r2,r5
	mov	r3,0x1
	bl	0x2032BF0

	// Initialize object
	str	r4,[sp]
	mov	r0,r5
	mov	r2,(0x168 >> 0x2)
	lsl	r2,r2,0x2
	ldr	r1,[r4,r2]
	add	r2,0xC		// 0x174
	add	r2,r4,r2
	ldr	r3,[r4,0x50]
	bl	battleObj_gaugeCard_init

	// Finish up (use part of Invisible handler)
	bl	0x21580FE


.align 2
battle_startCameraIntro:
	push	r0-r1,r7,r14
	ldr	r7,=commonVars

	mov	r0,0x0
	strb	r0,[r7,(var_battle_megaManAnimateDuringIntro - commonVars)]
	strb	r0,[r7,(var_battle_megaManHideDuringIntroTimer - commonVars)]

	// Animate/hide Mega Man during camera intro
	ldr	r1,[sp,0x4]
	cmp	r1,0x0
	beq	@@hideMegaMan

	bl	0x2153958	// in multiplayer battle
	cmp	r0,0x1
	beq	@@extraIntros

	mov	r0,0x1
	strb	r0,[r7,(var_battle_megaManAnimateDuringIntro - commonVars)]
	b	@@extraIntros

@@hideMegaMan:
//	ldr	r2,=0x21ACCDC
//	ldr	r2,[r2]		// get Mega Man object
//	ldr	r1,[r2,0x20]
//	mov	r0,0x4		// visible
//	bic	r1,r0
//	str	r1,[r2,0x20]
//
//	// Hide for 5 frames
//	mov	r0,0x5
//	strb	r0,[r7,(var_battle_megaManHideDuringIntroTimer - commonVars)]
//	mov	r0,0x1
//	strb	r0,[r7,(var_battle_megaManAnimateDuringIntro - commonVars)]

@@extraIntros:
	pop	r0-r1
	cmp	r1,0x11
	bne	@@normal
	ldr	r4,=battle_hollowCameraIntro
	b	@@end
@@normal:
	lsl	r1,r1,0x2
	ldr	r4,[r0,r1]
@@end:
	pop	r7,r15


.align 2
battle_openCustomScreenUpdateMegaMan:
	push	r0-r1,r14

	ldr	r3,=commonVars
	ldrb	r2,[r3,(var_battle_megaManAnimateDuringIntro - commonVars)]
	cmp	r2,0x0
	beq	@@end

	mov	r2,0x0
	strb	r2,[r3,(var_battle_megaManAnimateDuringIntro - commonVars)]

	ldr	r2,=0x21ACCDC
	ldr	r2,[r2]		// get Mega Man object
	ldr	r1,[r2,0x20]
	mov	r0,0x1		// update during pause
	bic	r1,r0
//	mov	r0,0x4
//	orr	r1,r0		// visible
	str	r1,[r2,0x20]

@@end:
	pop	r0-r1
	mov	r2,0x0
	strh	r1,[r0,0x2C]
	pop	r15


.align 2
battle_animateMegaManDuringCameraIntro:
	ldr	r3,=commonVars
	ldrb	r2,[r3,(var_battle_megaManAnimateDuringIntro - commonVars)]
	cmp	r2,0x0
	beq	@@end

//	ldr	r0,[r5,0x20]
	mov	r1,0x1
	orr	r0,r1
	str	r0,[r5,0x20]

@@end:
	mov	r0,0x9
	strb	r0,[r5,0x1C]
	bx	r14


.align 2
battle_grabityDamage:
	ldr	r2,[r5,0x30]	// damage

	// Check shadow property
	ldr	r3,[r4,0x38]	// receiver properties
	lsr	r3,r3,0x6	// test 0x20
	bcc	@@end
	// Check sword
	ldr	r3,[r5,0x34]	// damage properties
	lsr	r3,r3,0x3	// test 0x4
	bcs	@@end

	// 1/4th damage
	asr	r2,r2,0x2
	str	r2,[r5,0x30]	// update base damage

@@end:
	cmp	r2,0x0
	bx	r14


	.pool


.align 2
battle_isLegendModeMaybeTimeTrial:
	push	r0-r3,r14

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag
	beq	@@returnFalse

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x1
	beq	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r0-r3,r15


.align 2
battle_isLegendMode:
	push	r0-r3,r14

	// Check Time Trial active
	ldr	r1,=0xF008
	bl	0x202409C	// check flag
	bne	@@returnFalse

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag
	beq	@@returnFalse

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,0x1
	beq	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r0-r3,r15


.align 2
battle_legendModeHP:
	add	r0,0x80
	str	r7,[r0]
	push	r14

	bl	battle_isLegendMode
	beq	@@end

//	// Don't increase HP for Grabity
//	ldrh	r0,[r7,0x36]	// Name ID
//	cmp	r0,0xB3
//	blt	@@increaseHP
//	cmp	r0,0xB8
//	ble	@@end

@@increaseHP:
	// Increase HP x1.5
	mov	r2,r7
	add	r2,0x4C

	// Check infinite HP
	ldrh	r0,[r2,0x2]	// max HP
	ldr	r1,=0x3FFF
	cmp	r0,r1
	beq	@@end

	// HP x1.5
	lsr	r1,r0,0x1
	add	r0,r0,r1

	// For HP > 1000, round up to multiple of 100
	// Otherwise, round up to multiple of 10
	mov	r1,(1000 >> 2)
	lsl	r1,r1,0x2
	cmp	r0,r1
	bge	@@round100
@@round10:
	mov	r1,0x9
	b	@@roundUp
@@round100:
	mov	r1,0x63

@@roundUp:
	// Round up to multiple
	add	r0,r0,r1
	add	r1,0x1

	push	r1-r3
	blx	0x20AED80	// DivRem
	pop	r1
	mul	r0,r1
	pop	r2-r3

	strh	r0,[r2]		// cur HP
	strh	r0,[r2,0x2]	// max HP

@@end:
	pop	r15


.align 2
battle_legendModeExitStatusAback:
	// keep r1
	push	r0,r6-r7,r14
	mov	r6,0x1		// speed up animation
	mov	r7,(0)		// max frames (infinite)
	b	battle_legendModeExitStatusAndromeda

battle_legendModeExitStatusStun:
	// keep r1
	push	r0,r6-r7,r14
	mov	r6,0x1		// speed up animation
	mov	r7,(0)		// max frames (infinite)
//	b	battle_legendModeExitStatusAndromeda

battle_legendModeExitStatusAndromeda:
	// Check Andromeda or Dragon Sky
	ldrh	r0,[r4,0x36]
	sub	r0,0xFF
	cmp	r0,(0x125 - 0xFF)
	blt	battle_legendModeExitStatus
	cmp	r0,(0x125 - 0xFF + 0x6)
	blt	@@andromeda

	cmp	r0,(0x149 - 0xFF)
	blt	battle_legendModeExitStatus
	cmp	r0,(0x149 - 0xFF + 0x6)
	blt	@@dragonSky
	b	battle_legendModeExitStatus

@@andromeda:
@@dragonSky:
	mov	r6,0x0		// speed up animation
	mov	r7,0x1		// max frames
//	b	battle_legendModeExitStatus

battle_legendModeExitStatus:
	ldr	r0,[r4,r1]	// animation finished

	// Check animation finished
	cmp	r0,0x1
	beq	@@end

	bl	battle_isLegendMode
	beq	@@normal

	ldrh	r1,[r4,0x36]
	cmp	r1,0xFF
	ble	@@normal

	// Speed up animation
	cmp	r6,0x0
	beq	@@timer
	mov	r0,r4
	bl	0x217466C	// advance animation

@@timer:
	// Check timer
	ldrb	r0,[r4,0x1F]
	add	r0,0x1
	strb	r0,[r4,0x1F]

	// Limit to 5 frames
	cmp	r0,r7
	beq	@@end

	mov	r0,0x0
@@normal:
	cmp	r0,0x1
@@end:
	pop	r0,r6-r7,r15


.align 2
battle_legendModeStatusChain:
	push	r14

	// Get duration
	lsl	r7,r5,0x2
	ldr	r7,[r2,r7]
	lsl	r6,r6,0x2
	sub	r6,0x4
	ldr	r6,[r7,r6]

	// TripSong and QuakeSong are exempt
	cmp	r6,0x2
	ble	@@normal

	bl	battle_isLegendMode
	beq	@@normal

	// Get ID of entity being statused
	ldrh	r3,[r0,0x36]

	// If boss, disable status chaining
	lsl	r3,r3,0x18
	bcc	@@normal
	lsr	r3,r3,0x18
	beq	@@normal

@@crownThunder:
	cmp	r3,0x37
	blt	@@cancerBubble
	cmp	r3,0x3C
	ble	@@paraBody

@@cancerBubble:
	// Check if Cancer Bubble
	cmp	r3,0x2B
	blt	@@sameCheck
	cmp	r3,0x30
	ble	@@bubbleBody

	b	@@sameCheck

@@paraBody:
	// Check if paralysis
	cmp	r5,0x0
	beq	@@noAdd
	b	@@sameCheck

@@bubbleBody:
	// Check if bubble
	cmp	r5,0x4
	beq	@@noAdd
//	b	@@sameCheck

@@sameCheck:
	// Check if already has this status
	lsl	r3,r5,0x2
	add	r3,r4,r3
	ldr	r3,[r3,0x44]
	cmp	r3,0x0
	beq	@@hasStatus

@@noAdd:
	// Don't add the status
	add	sp,0x4
	bl	0x217DED2

@@hasStatus:
	// r5 = status
	cmp	r5,0x0		// paralysis
	beq	@@checkParalyzeFreezeBubble
	cmp	r5,0x1		// blind
	beq	@@checkBlindConfuse
	cmp	r5,0x2		// confuse
	beq	@@checkBlindConfuse
	cmp	r5,0x3		// freeze
	beq	@@checkParalyzeFreezeBubble
	cmp	r5,0x4		// bubble
	beq	@@checkParalyzeFreezeBubble
	cmp	r5,0x5		// gravity
	beq	@@checkGravity
	b	@@normal

@@checkParalyzeFreezeBubble:
	ldr	r3,[r4,0x44]	// paralysis timer
	cmp	r3,0x0
	bgt	@@reduceDuration
	ldr	r3,[r4,0x50]	// freeze timer
	cmp	r3,0x0
	bgt	@@reduceDuration
	ldr	r3,[r4,0x54]	// bubble timer
	cmp	r3,0x0
	bgt	@@reduceDuration
	b	@@checkRecoveringParalyzeFreezeBubble

@@checkBlindConfuse:
	ldr	r3,[r4,0x48]	// blind timer
	cmp	r3,0x0
	bgt	@@reduceDuration
	ldr	r3,[r4,0x4C]	// confuse timer
	cmp	r3,0x0
	bgt	@@reduceDuration
	b	@@normal

@@checkGravity:
	ldr	r3,[r4,0x58]	// gravity
	cmp	r3,0x0
	bgt	@@reduceDuration
	b	@@normal

@@checkRecoveringParalyzeFreezeBubble:
	// At this point we are not in status
	ldrb	r3,[r0,0x1D]	// action substate
	cmp	r3,0x2		// recovering
	bne	@@normal
	ldrb	r3,[r0,0x1C]	// action state
	cmp	r3,0x3		// paralyzed
	beq	@@reduceDurationRecovering
	cmp	r3,0x5		// frozen
	beq	@@reduceDurationRecovering
	cmp	r3,0x6		// bubbled
	beq	@@reduceDurationRecovering
	b	@@normal

@@reduceDuration:
	// Reduce duration
	cmp	r6,(30)
	ble	@@normal
	mov	r6,(30)
	b	@@normal

@@reduceDurationRecovering:
	// Reduce duration
	cmp	r6,(15)
	ble	@@normal
	mov	r6,(15)
//	b	@@normal

@@normal:
	lsl	r3,r5,0x2
	pop	r15


.align 2
battle_counterParalyzeNoParalyze:
	push	r14
	ldrb	r2,[r3,r2]
	bl	battle_isLegendMode
	beq	@@end

	// Get ID of entity being statused
	ldrh	r4,[r0,0x36]

@@crownThunder:
	sub	r4,0xFF
	sub	r4,(0x137 - 0xFF)
	bmi	@@end
	cmp	r4,0x6
	bge	@@end

	// Entity is Crown Thunder
	mov	r2,0x0		// set paralysis level to 0

@@end:
	pop	r15

.align 2
battle_counterParalyzeNoBubble:
	push	r14
	ldrb	r2,[r3,r2]
	bl	battle_isLegendMode
	beq	@@end

	// Get ID of entity being statused
	ldrh	r4,[r0,0x36]

@@cancerBubble:
	sub	r4,0xFF
	sub	r4,(0x12B - 0xFF)
	bmi	@@end
	cmp	r4,0x6
	bge	@@end

	// Entity is Cancer Bubble
	mov	r2,0x0		// set bubble level to 0

@@end:
	pop	r15


.align 2
battle_legendModeDamage:
	ldr	r1,[r3,r0]
	push	r1,r14

	// Get ID of entity being damaged
	ldr	r0,[r4,0x4]
	ldrh	r0,[r0,0x36]

	// Check if ID is Mega Man
	mov	r1,0x1
	lsl	r1,r1,0x8
	cmp	r0,r1
	bne	@@end

	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@end

	// Damage x2
	lsl	r2,r2,0x1

@@end:
	ldrb	r0,[r4,0x18]
	pop	r1,r15


.align 2
battle_legendModeCounter:
	push	r14
	bl	0x2153958	// check if multiplayer
	cmp	r0,0x0
	bne	@@end

	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@end

	mov	r0,0x1
@@end:
	pop	r15


.align 2
battle_legendModeRNG:
	push	r14
	bl	battle_isLegendMode
	bne	@@end

	// Reseed Mersenne twister
	bl	0x2022C88

@@end:
	pop	r15


	.pool


.align 2
battle_lmMettennaStartLag:
	push	r14
	mov	r1,0x1E
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,0xF
@@end:
	lsl	r0,r0,0x6
	pop	r15

.align 2
battle_lmMettennaAttackPostLag:
battle_lmMettennaMovePostLag:
	push	r14
	ldr	r0,[r0,r1]
	bl	battle_isLegendMode
	beq	@@end
	asr	r0,r0,0x1	// halve it
@@end:
	mov	r1,0x5
	pop	r15

.align 2
battle_lmMettennaAttackSpeed:
	// Old: 12, 8, 5
	// New: 8, 6, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldsh	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.dh	8, 6, 4, 8, 6, 4

.align 2
battle_lmMettennaAttackLength:
	// Change to 7, 5, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldsh	r0,[r0,r2]
	str	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.dh	7, 5, 4, 7, 5, 4

.align 2
battle_lmMettennaAttackPreLag:
	// Halve it
	push	r14
	ldrb	r0,[r0,r1]
	bl	battle_isLegendMode
	beq	@@end
	lsr	r0,r0,0x1
@@end:
	str	r0,[r5,r2]
	pop	r15

.align 2
battle_lmCannonBaseTurnSpeed:
	// Make it turn
	push	r14
	bl	battle_isLegendMode
	beq	@@zero
	add	r3,=@@data
	lsr	r5,r5,0x1
	ldsh	r3,[r3,r5]
	b	@@end
@@zero:
	mov	r3,0x0
@@end:
	pop	r15
.align 4
@@data:
	.dh	0x100,0x200,0x400,0x100,0x200,0x400

.align 2
battle_lmCannonBaseAttackPostLag:
	// Halve it
	push	r14
	ldsh	r2,[r1,r2]
	mov	r1,r0
	bl	battle_isLegendMode
	beq	@@end
	asr	r2,r2,0x1
@@end:
	pop	r15

.align 2
battle_lmCannonBaseAimTime:
	// Change to 5, 3, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r2,[r1,r2]
	mov	r1,r0
	pop	r15
.align 4
@@data:
	.dh	5, 3, 1, 5, 3, 1

.align 2
battle_lmCannonBaseAttackPreLag:
	// Change to 8, 6, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	ldrb	r0,[r5,0x1F]
	pop	r15
.align 4
@@data:
	.db	8, 6, 4, 8, 6, 4

.align 2
battle_lmCannonBaseCounterWindow:
	// Change to 8, 6, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
	ldrb	r1,[r1,r2]
@@end:
	bl	0x21749AC
	pop	r15
.align 4
@@data:
	.db	8, 6, 4, 8, 6, 4

.align 2
battle_lmCrowcarInitialSpeed:
	// Set to double initial speed
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldr	r3,[r2,r3]
	mov	r2,r0
	pop	r15
.align 4
@@data:
	.dw	0x14000,0x1A000,0x20000,0x14000,0x1A000,0x20000

.align 2
battle_lmCrowcarMoveCount:
	// Change to 2, 1, 0
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x63
	pop	r15
.align 4
@@data:
	.db	2, 1, 0, 2, 1, 0

.align 2
battle_lmCrowcarMovePostLag:
	// Change to 5, 5, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	mov	r1,0x5
	pop	r15
.align 4
@@data:
	.db	5, 5, 5, 5, 5, 5

.align 2
battle_lmCrowcarAttackPostLag:
	// Halve it
	push	r14
	ldrb	r3,[r2,r3]
	mov	r2,r0
	bl	battle_isLegendMode
	beq	@@end
	lsr	r3,r3,0x1
@@end:
	pop	r15

battle_lmPeekabooMoveSpeed:
	// Old: 0x5000, 0x6000, 0x7000
	// New: 0x6400, 0x7800, 0x8C00
	// Increase 25%
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r0,[r1,r0]
	mul	r2,r0
	pop	r15
.align 4
@@data:
	.dw	0x6400,0x7800,0x8C00,0x6400,0x7800,0x8C00

battle_lmPeekabooMoveCount:
	// Old: 3, 3, 3
	// New: 1/3, 1/3, 1/3
	push	r7,r14
	ldr	r7,[r4,r0]
	bl	battle_isLegendMode
	beq	@@end
	cmp	r7,0x2		// never move even number of times
	beq	@@end
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r1,r0,0x1A
	lsr	r1,r1,0x1F	// 0 or 1
	lsl	r1,r1,0x1	// 0 or 2
	add	r1,0x1		// 1 or 3
@@end:
	cmp	r1,r7
	pop	r7,r15

	.pool

battle_lmPeekabooAttackPreLag:
	// Change to 1, 1, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data

@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1, 1, 1

battle_lmPeekabooAttackPostLag:
	// Old: 30, 25, 20
	// New: 10, 5, 1
	// Halve it
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r3]
	mov	r3,0x0
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmHotRoaderMoveLength:
	// Change to 10, 8, 6
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r2]
	mov	r2,0x53
	pop	r15
.align 4
@@data:
	.db	10, 8, 6, 10, 8, 6

.align 2
battle_lmHotRoaderMoveSpeed:
	// Increase along with move length
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
	ldr	r2,[r2,r3]
@@end:
	bl	0x21534A8
	pop	r15
.align 4
@@data:
	.dw	0x1D000,0x1F000,0x21000,0x1D000,0x1F000,0x21000

.align 2
battle_lmWibbledeeMoveLag1:
	// Change to 8, 4, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r5,[r1,r5]
	mov	r1,r3
	pop	r15
.align 4
@@data:
	.db	8, 4, 1, 8, 4, 1

.align 2
battle_lmWibbledeeMoveLag2:
	// Change to 8, 4, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	strb	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	8, 4, 1, 8, 4, 1

.align 2
battle_lmWibbledeeMoveCount:
	// Change to 3, 2, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x65
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 3, 2, 1

.align 2
battle_lmMonoSwordAttackPreLag:
	// Halve it
	push	r14
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	bl	battle_isLegendMode
	beq	@@end
	lsr	r1,r1,0x1
@@end:
	pop	r15

.align 2
battle_lmMonoSwordAttackInterval:
	// Quarter it
	push	r14
	ldrb	r0,[r0,r2]
	mov	r2,0xFF
	bl	battle_isLegendMode
	beq	@@end
	lsr	r0,r0,0x2
@@end:
	pop	r15

.align 2
battle_lmMonoSwordAttackPostLag:
	// Change to 15, 10, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	str	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	15, 10, 5, 15, 10, 5

.align 2
battle_lmStreamCancroAttackPreLag:
	// Halve it
	push	r14
	ldrb	r2,[r0,r2]
	mov	r0,0x53
	bl	battle_isLegendMode
	beq	@@end
	lsr	r2,r2,0x1
@@end:
	pop	r15

.align 2
battle_lmStreamCancroAttackPostLag:
	// Change to 20, 10, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	cmp	r0,0x4
	pop	r15
.align 4
@@data:
	.db	20, 10, 5, 20, 10, 5

battle_lmStreamCancroAttackBubble:
	push	r14
	// Initialize bubble
	bl	0x2184568

	// New: add bubble
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,r5
	add	r0,0xAC
	ldr	r1,[r0]
	mov	r2,0x4		// "Lv 4" bubble = 30i
	strb	r2,[r1,0x1E]
@@end:
	pop	r15

.align 2
battle_lmLuPelvisAttackLength:
	// Change to 120, 90, 120, 30, 120, 180, 150, 180, 30, 180
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.db	120, 90, 120, 30, 120, 180, 150, 180, 30, 180

.align 2
battle_lmLuPelvisMoveLag:
	// Halve it
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	lsr	r1,r1,0x1
@@end:
	mov	r0,(0x140 >> 0x6)
	lsl	r0,r0,0x6
	pop	r15

.align 2
battle_lmDoomCountMoveLag:
	// Halve it
	push	r14
	ldrb	r2,[r0,r2]
	mov	r0,r1
	bl	battle_isLegendMode
	beq	@@end
	lsr	r2,r2,0x1
@@end:
	pop	r15

//.align 2
//battle_lmDoomCountMakeBombPreLag:
//	// Change to 1
//	push	r14
//	ldrb	r1,[r0,r1]
//	mov	r0,0x53
//	bl	battle_isLegendMode
//	beq	@@end
//	mov	r1,0x1
//@@end:
//	pop	r15

.align 2
battle_lmDoomCountAttackPreLag:
	// Halve it
	push	r14
	add	r1,0x20
	ldrb	r0,[r0,r2]
	bl	battle_isLegendMode
	beq	@@end
	lsr	r0,r0,0x1
@@end:
	pop	r15

.align 2
battle_lmDoomCountPlacePreLag:
	// Halve it
	push	r14
	ldrb	r1,[r0,r4]
	mov	r0,r5
	bl	battle_isLegendMode
	beq	@@end
	lsr	r1,r1,0x1
@@end:
	pop	r15

.align 2
battle_lmDoomCountBombTimer:
	// Change to 20, 15, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r4]
	mov	r0,0x59
	pop	r15
.align 4
@@data:
	.db	20, 15, 10, 20, 15, 10

.align 2
battle_lmDoomCountBombHP:
	// Change to 15, 30, 50
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r4]
	mov	r0,r5
	pop	r15
.align 4
@@data:
	.db	15, 30, 50, 15, 30, 50

.align 2
battle_lmBoomBoltSpeed:
	// Increase 25%
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldr	r6,[r0,r1]
	mov	r0,r5
	pop	r15
.align 4
@@data:
	.dw	0x5000,0x6400,0x7800,0x5000,0x6400,0x7800

.align 2
battle_lmBoomBoltRetreatDelay:
	// Change to 12, 10, 8
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
	lsr	r2,r2,0x2
@@end:
	ldrb	r1,[r1,r2]
	add	r1,0x7
	pop	r15
.align 4
@@data:
	.db	(12-7), (10-7), (8-7), (12-7), (10-7), (8-7)

.align 2
battle_lmBoomBoltAttackPreLag:
	// Change to 15, 10, 5
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r3]
	strh	r1,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	15, 10, 5, 15, 10, 5

.align 2
battle_lmBoomBoltAttackPostLag:
	// Change to 20, 15, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	mov	r3,0x0
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	(20-7), (15-7), (10-7), (20-7), (15-7), (10-7)

.align 2
battle_lmZapAceSpeed:
	// Increase 25%
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldr	r4,[r0,r2]
	mov	r0,r5
	pop	r15
.align 4
@@data:
	.dw	0x6400,0x8C00,0xC800,0x6400,0x8C00,0xC800

battle_lmZapAceAttackPreLag:
	// Change to 10, 5, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmZapAceAttackPostLag:
	// Change to 20, 15, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	add	r1,0x20
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	20, 15, 10, 20, 15, 10

//battle_lmBellGongSpeed:
//	// Increase 25%
//	push	r14
//	bl	battle_isLegendMode
//	beq	@@end
//	add	r0,=@@data
//@@end:
//	ldr	r5,[r0,r1]
//	mov	r1,r5
//	pop	r15
//.align 4
//@@data:
//	.dw	0x6400,0x8C00,0xC800,0x6400,0x8C00,0xC800

battle_lmBellGongAttackPreLag:
	// Change to 11, 8, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	11, 8, 5, 11, 8, 5

battle_lmBellGongAttackPostLag:
	// Halve it
	push	r14
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	bl	battle_isLegendMode
	beq	@@end
	lsr	r1,r1,0x1
@@end:
	pop	r15

battle_lmBellGongGongPreLag:
	// Change to 5, 3, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	str	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 5, 3, 1

battle_lmGreatAxMoveLag1:
	// Old: 80, 60, 40
	// New: 50, 35, 20
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	50, 35, 20, 50, 35, 20

battle_lmGreatAxMoveLag2:
	// Old: 67, 47, 27
	// New: 37, 22, 7
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	50, 35, 20, 50, 35, 20

battle_lmGreatAxAttackPostLag:
	// Old: 10, 10, 10
	// New: 10, 7, 4
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	10, 7, 4, 10, 7, 4

battle_lmJammerStartLag:
	// Halve it
	push	r1,r14
	mov	r2,r0
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,0x5
@@end:
	mul	r2,r1
	pop	r1,r15

battle_lmJammerMoveLag:
	// Old: 15, 10, 5, 10, 8, 6
	// New: 7, 5, 2, 5, 4, 3
	// New: 10, 7, 3, 7, 5, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.db	10, 7, 3, 7, 5, 4

battle_lmJammerShootPreLag:
	// Old: 25, 10, 5, 15, 13, 10
	// New: 10, 5, 3, 8, 7, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	10, 5, 3, 8, 7, 5

battle_lmJammerShootPostLag:
	// Old: 15, 10, 5, 5, 5, 5
	// New: 7, 5, 2, 3, 3, 2
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	7, 5, 2, 3, 3, 2

battle_lmJammerPunchPreLag:
	// Old: 10, 5, 1, 5, 5, 5
	// New: 5, 3, 1, 3, 3, 2
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 3, 3, 2

battle_lmJammerPunchPostLag:
	// Old: 10
	// New: 5
	push	r14
	mov	r1,(10)
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,0x5
@@end:
	strh	r1,[r4,r0]
	pop	r15

battle_lmGooeyStartLag:
	// Old: 30
	// New: 15
	push	r14
	sub	r1,0x44
	ldrb	r2,[r2,r3]
	bl	battle_isLegendMode
	beq	@@end
	lsr	r2,r2,0x1
@@end:
	pop	r15

battle_lmGooeyMoveSpeed:
	// Old: 40, 35, 30
	// New: 20, 12, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.db	20, 12, 5, 20, 12, 5

battle_lmGooeyMoveCount:
	// Old: 3, 3, 3
	// New: 3, 4, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x65
	pop	r15
.align 4
@@data:
	.db	3, 4, 5, 3, 4, 5

battle_lmGooeyMovePreLag:
	// Old: 15, 15, 15
	// New: 5, 5, 5
	push	r14
	sub	r0,r0,0x4
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	5, 5, 5, 5, 5, 5

battle_lmGooeyAttackPreLag:
	// Old: 30, 30, 30
	// New: 30, 30, 30
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	30, 30, 30, 30, 30, 30

battle_lmGooeyAttackPostLag:
	// Old: 30, 30, 30
	// New: 10, 5, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmCommonMoveCount:
	// Old: 4, 3, 2 (RhinoHorn)
	// Old: 2, 2, 2 (Melamander)
	// New: randomly subtract 1
	push	r14
	ldrb	r1,[r0,r1]
	bl	battle_isLegendMode
	beq	@@end

	push	r1
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	pop	r1
	lsl	r0,r0,0x1A
	lsr	r0,r0,0x1F	// 0 or 1
	sub	r1,r1,r0
@@end:
	mov	r0,0x65
	pop	r15

	.pool

battle_lmRhinoHornMoveLag1:
	// Old: 10, 8, 6
	// New: 7, 5, 4
	push	r14
	mov	r2,0x3
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	7, 5, 4, 7, 5, 4

battle_lmRhinoHornMoveLag2:
	// Old: 10, 8, 6
	// New: 7, 5, 4
	push	r14
	sub	r1,0x44
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r2,[r2,r3]
	pop	r15
.align 4
@@data:
	.db	7, 5, 4, 7, 5, 4

battle_lmRhinoHornAttackPostLag:
	// Halve it
	push	r14
	ldrb	r1,[r0,r1]
	bl	battle_isLegendMode
	beq	@@end
	lsr	r1,r1,0x1
@@end:
	mov	r0,0x53
	pop	r15

battle_lmPrivateMopMoveSpeed:
	// Old: 10, 8, 5
	// New: 7, 4, 2
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	add	r2,=@@data
	lsr	r3,r3,0x2
	ldrb	r2,[r2,r3]
	b	@@end
@@normal:
	ldr	r2,[r2,r3]
@@end:
	mul	r2,r1
	pop	r15
.align 4
@@data:
	.db	7, 4, 2, 7, 4, 2

battle_lmPrivateMopAttackPreLag:
	// Old: 5, 5, 5
	// New: 3, 2, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 3, 2, 1

battle_lmPrivateMopAttackPostLag:
	// Halve it
	push	r14
	ldrb	r0,[r0,r2]
	bl	battle_isLegendMode
	beq	@@end
	lsr	r0,r0,0x1
@@end:
	mov	r2,0xFF
	pop	r15

battle_lmFokxMoveLag:
	// Old: 15, 15, 15
	// New: 10, 5, 1
	push	r14
	mov	r2,0x3
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmFokxAttackPostLag:
	// Old: 30, 25, 20
	// New: 15, 10, 5
	push	r14
	sub	r1,0x54
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	15, 10, 5, 15, 10, 5

battle_lmFokxAttackPreLag:
	// Old: 15, 12, 10
	// New: 7, 6, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	7, 6, 5, 7, 6, 5

battle_lmFokxCounterFrames:
	// Old: 9, 9, 9
	// New: 6, 5, 4
	push	r14
	mov	r0,r4
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	6, 5, 4, 6, 5, 4

battle_lmMcCleaverAttack1PreLag:
	// Old: 11, 9, 7
	// New: 9, 7, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.db	9, 7, 5, 9, 7, 5

battle_lmMcCleaverAttack2PreLag:
	// Old: 13, 11, 9
	// New: 11, 9, 7
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.db	11, 9, 7, 11, 9, 7

battle_lmMcCleaverCheckHit:
	// Old: stops on hit
	// New: keeps going
	push	r14
	bl	battle_isLegendMode
	bne	@@end
	// Process hit
	// r0 = object
	bl	0x216E63C
@@end:
	pop	r15

battle_lmMcCleaverHitFlags:
	push	r14
	mov	r0,0x3		// flinch and flash
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x1		// flinch only
@@end:
	str	r0,[sp,0x4]
	pop	r15

battle_lmRockyAttack:
	push	r14
	mov	r1,0x2		// normal
	bl	battle_isLegendMode
	beq	@@end
	cmp	r4,0x0		// alignment
	beq	@@end
	mov	r1,0x4		// breaking
@@end:
	str	r1,[sp,0x1C+0x4]
	str	r0,[sp,0x20+0x4]
	pop	r15

battle_lmOctoNinjaJumpSpeed:
	// Old: 25, 23, 20
	// New: 20, 18, 15
	push	r14
	mov	r0,0x1E
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	20, 18, 15, 20, 18, 15

battle_lmOctoNinjaJumpLag:
	// Old: 12, 11, 10
	// New: 5, 3, 1
	push	r14
	sub	r1,0x8
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 5, 3, 1

battle_lmOctoNinjaAttackPostLag:
	// Old: 10, 10, 10
	// New: 5, 3, 1
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 5, 3, 1

battle_lmEyezMoveSpeed:
	// Old: 3, 4, 6
	// New: 5, 10, 15
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldr	r4,[r0,r1]
	mov	r1,0x1A
	pop	r15
.align 4
@@data:
	.dw	0x5000, 0xA000, 0xF000, 0x5000, 0xA000, 0xF000

battle_lmEyezMoveCount:
	// Old: 3, 3, 3
	// New: 3, 5, 7
	push	r14
	mov	r1,0x3
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
	mov	r3,0x34
	ldrb	r3,[r5,r3]	// level
	ldrb	r1,[r1,r3]
@@end:
	mul	r1,r2
	pop	r15
.align 4
@@data:
	.db	3, 5, 7, 3, 5, 7

battle_lmEyezAttackPreLag:
	// Old: 15, 10, 5
	// New: 10, 5, 1
	push	r14
	sub	r0,0x4
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmEyezAttackPostLag:
	// Old: 15, 15, 15
	// New: 10, 5, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	str	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmEyezAttackInterval:
	// Old: 10, 10, 10
	// New: 10, 8, 6
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r3]
	mov	r3,0x0
	pop	r15
.align 4
@@data:
	.db	10, 8, 6, 10, 8, 6

battle_lmCommonStartLag:
	// Old: r*5+1
	// New: r*3+1
	push	r14
	lsl	r0,r1,0x1	// r0 = r*2
	bl	battle_isLegendMode
	bne	@@end		// skips next if Legend Mode ON
	lsl	r0,r0,0x1	// r0 = r*4
@@end:
	add	r0,r1,r0	// r0 = r*3 or r*5
	pop	r15

battle_lmMelamanderMoveLag:
	// Old: 30, 20, 15
	// New: 20, 10, 5
	push	r14
	mov	r2,0x4
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	20, 10, 5, 20, 10, 5

battle_lmMelamanderAttackPreLag:
	// Old: 15, 10, 5
	// New: 10, 5, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmMelamanderAttackSpeed1:
	// Old: 3, 3, 3
	// New: 2, 1, 1
	push	r14
	ldrb	r5,[r0,r6]
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r0,[r3,r6]
	pop	r15
	// r3 also used for next load
.align 4
@@data:
	.db	2, 1, 1, 2, 1, 1

battle_lmMelamanderAttackSpeed2:
	// Old: 3, 3, 3
	// New: 2, 1, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r3]
	lsl	r0,r0,0x1
	pop	r15
.align 4
@@data:
	.db	2, 1, 1, 2, 1, 1

battle_lmLampisMoveLag:
	// Old: 30, 20, 15 +4
	// New: 5, 3, 1 +1
	push	r14
	mov	r2,0x4
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x1
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 5, 3, 1

battle_lmLampisMoveCount:
	// Old: 3, 3, 2
	// New: 5, 7, 9 +1 random
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	bl	battle_lmCommonMoveCount
	pop	r15
.align 4
@@data:
	.db	5, 7, 9, 5, 7, 9

battle_lmLampisKickPreLag:
battle_lmLampisKickPostLag:
battle_lmLampisFlashPreLag:
battle_lmLampisFlashLength:
	// Old: 15, 13, 10
	// New: 10, 7, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	10, 7, 5, 10, 7, 5

battle_lmLampisKickLength:
	// Old: 11, 11, 11
	// New: 7, 5, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	7, 5, 3, 7, 5, 3

battle_lmLampisFlashPostLag:
	// Old: 30, 20, 15
	// New: 10, 7, 5
	push	r14
	mov	r2,r4
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	10, 7, 5, 10, 7, 5

battle_lmMoaianAttackSpeed1:
	// Old: 15, 15, 15
	// New: 14, 12, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.db	14, 12, 10, 14, 12, 10

battle_lmMoaianAttackSpeed2:
	// Old: 15, 15, 15
	// New: 14, 12, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r4,[r0,r1]
	mov	r0,0x32
	pop	r15
.align 4
@@data:
	.db	14, 12, 10, 14, 12, 10

battle_lmMoaianAttackPostLag:
	// Old: 15, 10, 5
	// New: 9, 6, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	strh	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	9, 6, 3, 9, 6, 3

battle_lmTropiCongaUpdate:
	push	r4,r14
	mov	r4,r0

//	mov	r0,r4
	bl	0x2171EF0

	bl	battle_isLegendMode
	beq	@@end

	mov	r0,0xAC
	ldr	r0,[r4,r0]	// collision
	cmp	r0,0x0
	beq	@@end
	ldr	r1,[r0,0x2C]	// properties
	mov	r2,0x2		// shield property

	// Check animation
	mov	r3,0x31
	ldrb	r3,[r4,r3]
	cmp	r3,0x0
	bne	@@noShield
@@shield:
	orr	r1,r2
	b	@@setProperties
@@noShield:
	bic	r1,r2
//	b	@@setProperties
@@setProperties:
	str	r1,[r0,0x2C]
@@end:
	pop	r4,r15

battle_lmTropiCongaAnimInit:
	push	r14
	add	r0,0x31
	strb	r1,[r0]
	mov	r0,r5
	b	battle_lmCommonAddShield

battle_lmTropiCongaAnimReset:
	push	r14
	add	r0,0x31
	strb	r2,[r0]
	mov	r0,r4
//	b	battle_lmCommonAddShield

battle_lmCommonAddShield:
	bl	battle_isLegendMode
	beq	@@end
	// r0 = object
	// r1 may be used by caller
	// Add shield property
	mov	r2,0xAC
	ldr	r2,[r0,r2]
	ldr	r3,[r2,0x2C]
	mov	r0,0x2
	orr	r3,r0
	str	r3,[r2,0x2C]
@@end:
	pop	r15

battle_lmTropiCongaAnimStart:
	push	r14
	add	r0,0x31
	strb	r1,[r0]

	bl	battle_isLegendMode
	beq	@@end

	// Remove shield property
	mov	r2,0xAC
	ldr	r2,[r4,r2]
	ldr	r1,[r2,0x2C]
	mov	r0,0x2
	bic	r1,r0
	str	r1,[r2,0x2C]
@@end:
	pop	r15

//battle_lmTropiCongaAttackPreLag:
//	// Old: 15, 15, 15
//	// New: 10, 10, 10
//	push	r14
//	add	r1,0x20
//	bl	battle_isLegendMode
//	beq	@@end
//	add	r0,=@@data
//@@end:
//	ldrb	r0,[r0,r2]
//	pop	r15
//.align 4
//@@data:
//	.db	10, 10, 10, 10, 10, 10

battle_lmJunkOMoveLag:
	// Old: 30, 20, 15
	// New: 18, 12, 8
	push	r14
	mov	r2,0x3
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	18, 12, 8, 12, 12, 8

battle_lmJunkOAttackPreLag:
	// Old: 15, 10, 5
	// New: 9, 6, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	9, 6, 3, 9, 6, 3

battle_lmJunkOAttackPostLag:
	// Old: 15, 10, 5
	// New: 9, 6, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	9, 6, 3, 9, 6, 3

battle_lmJunkOTimeBombHP:
	// Old: 10, 20, 30
	// New: 15, 30, 50
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r2,[r2,r1]
	str	r0,[sp,0x4]
	pop	r15
.align 4
@@data:
	.db	15, 30, 50, 15, 30, 50

battle_lmJunkOTimeBombTimer:
	// Old: 30, 30, 30
	// New: 20, 15, 10
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r3,[r3,r1]
	add	r0,r4,r0
	pop	r15
.align 4
@@data:
	.db	20, 15, 10, 20, 15, 10

battle_lmMageraMoveLag:
	// Old: 15, 13, 10
	// New: 12, 9, 6
	push	r14
	mov	r2,0x1
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	12, 9, 6, 12, 9, 6

battle_lmMageraSupportChargeLength:
	// Old: 15, 10, 5
	// New: 11, 7, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.db	11, 7, 3, 11, 7, 3

battle_lmMageraAttackChargeLength:
	// Old: 15, 10, 5
	// New: 11, 7, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	11, 7, 3, 11, 7, 3

battle_lmMageraSupportPostLag:
battle_lmMageraAttackPostLag:
	// Old: 15, 10, 5
	// New: 10, 5, 1
	push	r14
	add	r1,0x20
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 5, 1

battle_lmGrabitySuckPreLag:
battle_lmGrabityShootPreLag:
	// Old: 15, 10, 5
	// New: 5, 4, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	5, 4, 3, 5, 4, 3

battle_lmGrabitySuckPostLag:
battle_lmGrabityShootPostLag:
	// Old: 15, 10, 5
	// New: 5, 4, 3
	push	r14
	mov	r2,0xFF
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	pop	r15
.align 4
@@data:
	.db	5, 4, 3, 5, 4, 3

	.pool


.align 2
battle_lmCygnusFeatherNoFlash:
	push	r14
	mov	r0,0x3		// flinch and flash
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x1		// flinch only
@@end:
	str	r0,[sp,(0x1C+0x4)]
	pop	r15

battle_lmCygnusFeatherConfuse:
	bl	battle_isLegendMode
	beq	@@end

	// Add confuse lv. 2 (60i)
	mov	r1,0x2
	strb	r1,[r0,0x1C]

@@end:
	add	sp,0x20
	pop	r3-r5,r15

battle_lmMigratoryBirdsSpeed1:
	// Old: 9, 16, 17
	// New: 12, 18, 20
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.dh	12, 18, 20, 24, 20, 20
battle_lmMigratoryBirdsSpeed2:
	// Old: 9, 16, 17
	// New: 12, 18, 20
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldsh	r0,[r0,r1]
	pop	r15
.align 4
@@data:
	.dh	12, 18, 20, 24, 20, 20


.align 2
battle_luPelvisDestruct:
	push	r4,r14
	mov	r4,r0

	// Normal destruct
//	mov	r0,r4
	bl	0x2174E9C

	// Check if parent exists
	mov	r1,0xB0
	ldr	r2,[r4,r1]
	cmp	r2,0x0
	beq	@@end

	// Remove from self
	mov	r3,0x0
	str	r3,[r4,r1]
	// Remove from parent
	mov	r1,0xB4
	str	r3,[r2,r1]
	// Start new timer
	mov	r1,0xB8
	mov	r3,0x2
	strb	r3,[r2,r1]

@@end:
	pop	r4,r15

	.pool


.align 2
battle_lmShockNoteHP:
	push	r4,r14
	mov	r4,0xB0
	ldr	r4,[r5,r4]
	cmp	r4,0x0
	beq	@@checkLegend
	bl	battle_isDXBoss_r4obj
	beq	@@checkLegend
	add	r1,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r4,0x30
	ldrb	r4,[r5,r4]	// alignment
	cmp	r4,0x0
	beq	@@end
	add	r0,=@@data
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r4,r15
.align 4
@@data:
	.dh	9999, 9999, 9999, 9999, 9999, 9999
.align 2
battle_lmShockNoteLag:
	// Old: 20+20, 20+20, 20+20
	// New: 20+15, 20+13, 20+11
	push	r14
	mov	r0,(40)
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r0,(30)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x30
	ldrb	r2,[r4,r2]	// alignment
	cmp	r2,0x0
	beq	@@end
	add	r0,=@@data
	mov	r2,0x34
	ldrb	r2,[r4,r2]	// version
	bl	battle_isDXBoss
	beq	@@get
	add	r2,0x1
@@get:
	ldrb	r0,[r0,r2]
@@end:
	sub	r1,0x8
	pop	r15
.align 4
@@data:
	.db	35, 34, 33, 32, 31, 31
.align 2
battle_lmShockNoteLinger:
	// Old: Despawn at 20
	// New: Despawn sooner if Harp Note in different state
	push	r7,r14
	mov	r7,r0		// timer
	beq	@@despawn

	bl	battle_isLegendMode
	bne	@@legend

//	bl	battle_isDXBoss
//	beq	@@normal
//	cmp	r7,(10)
//	blt	@@despawn

@@normal:
	b	@@noDespawn

@@legend:
	mov	r0,0xB0
	ldr	r0,[r4,r0]	// parent
	cmp	r0,0x0
	beq	@@noDespawn
	ldrb	r0,[r0,0x1C]	// state
	cmp	r0,0xC		// Shock Note
	bne	@@despawn

@@noDespawn:
	pop	r7
	add	sp,0x4
	bl	0x21858D4
@@despawn:
	pop	r7,r15
.align 2
battle_lmShockNoteSpeed:
	// Old: 21, 24, 34
	// New: 33, 37, 40
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r3,r5
	sub	r3,(0x8C-0x30)
	ldrb	r3,[r3]		// alignment
	cmp	r3,0x0
	beq	@@end
	add	r0,=@@data
	bl	battle_isDXBoss
	beq	@@end
	add	r1,0x4
@@end:
	ldr	r0,[r0,r1]
	mul	r0,r2
	pop	r15
.align 4
@@data:
	.dw	33, 37, 40, 45, 40, 40
//.align 2
//battle_lmShockNoteBreaking:
//	push	r14
//	mov	r2,0x5		// not breaking
//	bl	battle_isLegendMode
//	beq	@@end
//	mov	r3,0x30
//	ldrb	r3,[r5,r3]	// alignment
//	cmp	r3,0x0
//	beq	@@end
//	mov	r2,0x6		// breaking
//@@end:
//	pop	r15
//.align 2
//battle_lmMachineGunStringsNotesBreaking:
//	push	r14
//	bl	battle_isLegendMode
//	beq	@@end
//	mov	r3,0x30
//	ldrb	r3,[r5,r3]	// alignment
//	cmp	r3,0x0
//	beq	@@end
//	mov	r2,0x4		// breaking
//@@end:
//	mov	r1,r5
//	mov	r3,0x2
//	pop	r15

	.pool


.align 2
battle_tidalWaveIcePanels:
	// r0 = object
	push	r7,r14
	bl	0x218BE34
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	cmp	r0,0x0
	beq	@@end

	// Spawn ice panels
	sub	r7,r0,0x2	// r7 = -1
@@loop:
	mov	r0,0x68
	mov	r1,0x69
	ldrb	r0,[r4,r0]	// panel x
	ldrb	r1,[r4,r1]	// panel y
	sub	r0,r0,r7
	sub	r1,0x1

	// Calculate panel data address
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r0,r0,r1

	// Set panel
	mov	r1,0x5		// ice panel
	bl	0x218FBF0	// set panel

	add	r7,0x1
	cmp	r7,0x1
	ble	@@loop

@@end:
	pop	r7,r15

.align 2
battle_lmPoisonPanel:
	// r0 = object
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// Check if object is Queen Ophiuca
	mov	r1,0x36
	ldrh	r1,[r0,r1]	// name ID
	lsl	r1,r1,0x18
	bcc	@@normal
	lsr	r1,r1,0x18
	cmp	r1,0x19
	blt	@@normal
	cmp	r1,0x1E
	ble	@@end		// skip poison panel

@@normal:
	// Poison panel handler
	bl	0x217F84C

@@end:
	pop	r15


.align 2
battle_geminiSparkHeal:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// Check is Gemini Spark W
	mov	r2,0x36
	ldrh	r2,[r4,r2]
	lsl	r2,r2,0x18
	bcc	@@normal
	lsr	r2,r2,0x18
	cmp	r2,0x22
	blt	@@normal
	cmp	r2,0x24
	bgt	@@normal

@@geminiSpark:
	// Heal 1/4 the damage
	lsr	r1,r0,0x2

	// Get Gemini Spark B
	mov	r0,0xB0
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@end

	// Check HP is 0
	mov	r2,0x4C
	ldsh	r2,[r0,r2]
	cmp	r2,0x0
	ble	@@end

	// Do heal
	// r0 = object
	// r1 = amount to heal
	mov	r2,0x0		// play animation
	bl	0x2174D9C

	b	@@end

@@normal:
	// Check HP
	mov	r2,0x4C
	ldsh	r2,[r4,r2]
	ldr	r3,=0x3FFF	// infinite HP
	cmp	r2,r3
	beq	@@end

	ldr	r2,[r1,0x2C]
	mov	r1,0x2
	pop	r15

@@end:
	// Skip to end
	add	sp,0x4
	bl	0x217DD30


.align 2
battle_starRoadContactNoFreeze:
	ldr	r0,[r4,0x4]
	cmp	r0,0x0
	beq	@@normal

	// Check is hitbox extension object
	ldr	r1,[r0]
	ldr	r2,=0x21AC268
	cmp	r1,r2
	bne	@@normal

	// Check has parent object
	mov	r1,0xB0
	ldr	r0,[r0,r1]
	cmp	r0,0x0
	beq	@@normal

	// Check parent object is Pegasus Magic
	mov	r1,0x36
	ldrh	r0,[r0,r1]
	lsl	r0,r0,0x18
	bcc	@@normal	// not a boss
	lsr	r0,r0,0x18
	cmp	r0,0x3D
	blt	@@normal
	cmp	r0,0x42
	bgt	@@normal

	// Skip aqua on ice check
	bl	0x2154B1E

@@normal:
	mov	r0,0x3
	ldr	r1,[r4,0x34]
	bx	r14


.align 2
battle_starRoadContactFreeze:
	mov	r0,0x3

	bl	battle_isLegendMode
	beq	@@normal

	// Check Pegasus Magic
	ldr	r1,[r4,0x4]
	add	r1,0x36
	ldrh	r1,[r1]		// enemy ID
	lsl	r1,r1,0x18
	bcc	@@normal	// not a boss
	lsr	r1,r1,0x18
	cmp	r1,0x3D
	blt	@@normal
	cmp	r1,0x42
	bgt	@@normal

	// Skip own contact check
	lsl	r0,r0,0x10
	bl	0x2154AB8

@@normal:
	// Check for contact normally
	ldr	r1,[r4,0x34]
	bl	0x2154AB2


.align 2
battle_overwriteHollowPanel:
	push	r14
	mov	r5,r0
	bl	battle_isLegendMode
	beq	@@end

	ldrb	r0,[r5,0xA]	// current panel type
	cmp	r0,0xB		// Hollow panel
	bne	@@end

	// Abort
	add	sp,0x4
	bl	0x218FC94

@@end:
	ldrb	r0,[r5,0xD]
	pop	r15


.align 2
battle_addExtraHitType1:
	cmp	r3,0xFF
	ble	@@end		// type 0x20 and up
	ldr	r1,=(battle_extraHitType1-0x100)
@@end:
	ldr	r3,[r1,r3]
	mov	r1,r0
	bx	r14


.align 2
battle_wolfWoodsUpperClawPierceInvis:
	push	r14
	mov	r0,0x9
	bl	battle_isLegendMode
	beq	@@end
	cmp	r4,0x0		// alignment
	beq	@@end
	mov	r0,0x21		// sword + invis pierce
@@end:
	str	r0,[sp,(0x18+0x4)]
	pop	r15


.align 2
battle_bossLoad:
	ldrh	r0,[r1,0x6]
	cmp	r0,0xE
	beq	@@loadHollow
	cmp	r0,0xD
	bx	r14

@@loadHollow:
	// Load Hollow overlay
	ldr	r0,=0x211DCF4
	mov	r1,0x6
	ldr	r2,=0x291	// overlay 657
	bl	0x2020940	// load overlay

	// Create object
	mov	r0,(0x1D0 >> 0x2)
	lsl	r0,r0,0x2
	bl	0x21743C0
	mov	r5,r0
	beq	@@initHollow

	// Set object functions
	bl	0x2152434
	ldr	r0,=hollow_funcs
	str	r0,[r5]

@@initHollow:
	ldr	r0,=0x212E2C0
	add	r1,r5,0x4
	mov	r2,r5
	mov	r3,0x1
	bl	0x2032BF0

	cmp	r5,0x0
	beq	@@end

	mov	r3,sp
	ldrh	r1,[r3]
	mov	r2,sp
	sub	r2,0x4
	strh	r1,[r2]
	ldr	r1,[r2]
	add	r2,sp,0x18
	ldrb	r2,[r2,0x5]
	ldrb	r3,[r3,0x2]
	mov	r0,r5
	bl	battleObj_hollowBoss_init
	mov	r4,r5

	// Set Hollow camera intro
	ldr	r1,=0x21ACC6C
	mov	r0,0x11
	strb	r0,[r1,0x13]

@@end:
	mov	r0,r4
	add	sp,0x8
	pop	r3-r5
	pop	r3
	add	sp,0x10
	bx	r3	


.align 2
battle_humorBusterShot:
	mov	r1,0x6A
	mov	r2,0x0
	b	@battle_humorBuster
battle_humorBusterCharge:
	add	r1,0x80
	mov	r2,0x1

@battle_humorBuster:
	push	r0-r2,r7,r14
	mov	r7,0x0

	mov	r0,0x30
	ldrb	r0,[r4,r0]
	bl	battle_getHumorBusterType
	cmp	r0,0x1
	beq	@@type1
	cmp	r0,0x2
	beq	@@type2
	b	@@end

@@type2:
	mov	r7,0x2
@@type1:
	ldr	r2,=SE_HUMORSHOT1
	add	r2,r2,r7
	ldr	r0,[sp,0x8]	// r2
	add	r0,r2,r0
	str	r0,[sp,0x4]	// r1

@@end:
	pop	r0-r2,r7
	ldr	r0,[r0]
	pop	r15


.align 2
battle_cutinProcess:
	push	r4,r14
	bl	0x2025574	// play SFX

	add	r3,=battle_cutInObjectQueue

	// Check if this is the first cut in card
	mov	r0,0x13
	lsl	r0,r0,0x4
	ldr	r0,[r5,r0]
	ldr	r0,[r0]
	cmp	r0,0x0
	bne	@@subsequent
@@first:
	// Initialize cut-in queue
	str	r5,[r3]
	b	@@end

@@subsequent:
	// Shift queue
	ldr	r0,[r3]
	str	r5,[r3]

	cmp	r0,0x0		// object shifted out
	beq	@@end

@@destruct:
	// Call object destructor
	ldr	r1,[r0]
	ldr	r1,[r1,0x1C]
	blx	r1

@@end:
	pop	r4,r15

	.pool

.align 4
battle_cutInObjectQueue:
	// Holds just 1 object
	.dw	0x0


.align 2
battle_spawnGVirus:
	push	r14

	ldr	r0,[r0]
	tst	r0,r1
	bne	@@noSpawn

	// Check if Car Comp fight done
	ldr	r1,=0x22E
	bl	0x202409C
	beq	@@noSpawn

@@spawn:
	mov	r0,0x0
	b	@@end
@@noSpawn:
	mov	r0,0x1
@@end:
	pop	r15


.align 2
battle_startCollision:
	ldr	r0,[r5,0x30]
	add	r1,=@originalBaseDamage
	str	r0,[r1]

	mov	r0,0x0
	add	r1,=@grassPanelToRemove
	str	r0,[r1]

	ldr	r0,[r4,0x34]
	ldr	r1,[r5,0x38]
	bx	r14


.align 2
battle_reloadOriginalBaseDamage:
	add	r6,r6,r0

	ldr	r0,[@originalBaseDamage]
	str	r0,[r5,0x30]

	ldr	r1,[r4,0x2C]
	bx	r14


.align 2
battle_endCollision:
	// Delayed grass burn
	add	r2,=@grassPanelToRemove
	ldr	r0,[r2]
	mov	r1,0x0
	str	r1,[r2]
	cmp	r0,0x0
	beq	@@end

	// Change to normal panel
	mov	r1,0x1
	bl	0x218FBF0

@@end:
	add	sp,0xC
	pop	r4-r7,r15


.align 2
battle_holyPanelUpdateBaseDamage:
	// Update base damage
	str	r2,[r5,0x30]

	ldrb	r0,[r5,0x9]
	mov	r1,0x18
	bx	r14


.align 2
battle_burnGrassPanel:
	// Burn it later
	add	r1,=@grassPanelToRemove
	str	r0,[r1]

	bx	r14


.align 2
battle_removeWeaknessDamage:
	push	r6-r7,r14
	mov	r2,r0

	// Get ID of entity being damaged
	ldr	r0,[r4,0x4]
	add	r0,0x36
	ldrh	r0,[r0]

	// Check if ID is Mega Man
	lsl	r0,r0,0x18	// 0x100 -> shift 1 into carry flag
	bcc	@@weakness
	cmp	r0,0x0
	bne	@@boss

	// If Legend Mode, retain weakness damage
	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@end		// skip damage multiply
	b	@@normal

@@boss:
	bl	battle_isLegendMode
	beq	@@normal

	// Check if ID is Andromeda
	lsr	r0,r0,0x18
	cmp	r0,0x25
	blt	@@checkLibraScales
	cmp	r0,0x2A
	bgt	@@checkLibraScales

	// Check if below half HP
	ldr	r0,[r4,0x4]
	mov	r6,0x4C
	mov	r7,0x4E
	ldsh	r6,[r0,r6]	// current HP
	ldsh	r7,[r0,r7]	// max HP
	asr	r7,r7,0x1
	cmp	r6,r7
	bgt	@@normal
	// Check if transformed
	mov	r6,0xD5
	ldrb	r6,[r0,r6]
	lsr	r6,r6,0x1	// test 0x1
	bcs	@@normal

	// Set damage to 0
	mov	r1,0x0
	mov	r2,0x0
	b	@@end

@@checkLibraScales:
	// Check if ID is Libra Scales
	cmp	r0,0x13
	blt	@@weakness
	cmp	r0,0x18
	bgt	@@weakness
	// Check if multiplier is 1
	cmp	r1,0x1
	bne	@@weakness
	// Check if breaking attack
	ldr	r0,[r5,0x34]
	lsr	r0,r0,0x2	// test 0x2
	bcs	@@normal

	// Reduce from 1x to 0.5x
	lsr	r2,r2,0x1
	cmp	r2,0x0
	bgt	@@setLibraDamage
	mov	r2,0x1		// minimum 1
@@setLibraDamage:
	str	r2,[r5,0x30]	// change base damage

	// Add armor effect
	ldrb	r7,[r4,0x9]	// element
	cmp	r7,0x0
	ble	@@end
	cmp	r7,0x5
	bge	@@end
	add	r7,(0x80 + 0xF-0x1)	// hit effect

	// Get VFX index from stack
	ldr	r6,[sp]		// original r6
	cmp	r6,0x4
	blt	@@setEffect
	mov	r6,0x3		// force on the last spot

@@setEffect:
	mov	r0,0x90
	add	r0,r0,r6
	strb	r7,[r4,r0]

	// Next VFX
	add	r6,0x1
	str	r6,[sp]		// put back on stack
	b	@@end

@@weakness:
	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@normal

	// Reduce from 2x to 1.5x
	sub	r7,r1,0x1	// r7 = multiplier - 1
	lsr	r0,r2,0x1	// r0 = damage/2
	mul	r0,r7		// r0 = (damage/2) * (multiplier - 1)
	add	r2,r2,r0	// +2x = +0.5x, +3x = +1x, +4x = +1.5x
	b	@@end

@@normal:
	mul	r2,r1

@@end:
	pop	r6-r7,r15


.align 4
@originalBaseDamage:
	.dw	0x0
.align 4
@grassPanelToRemove:
	.dw	0x0


	.pool


.align 4
battle_hitEffects:
	// 0x0: Nothing
	.dw	0x0, 0x0, 0x0, 0x0
	// 0x1: Hit
	.dw	((1 << 16) | (268)), ((2 << 16) | (662)), 100, 0x3000
	// 0x2: Explosion
	.dw	((1 << 16) | (264)), ((2 << 16) | (656)), 112, 0x1000
	// 0x3: Break
	.dw	((1 << 16) | (293)), ((2 << 16) | (691)), 100, 0x2000
	// 0x4: Fire
	.dw	((1 << 16) | (295)), ((2 << 16) | (693)), 100, 0x2000
	// 0x5: Weakness
	.dw	((1 << 16) | (280)), ((2 << 16) | (679)), 100, 0x1000
	// 0x6: Aqua
	.dw	((1 << 16) | (296)), ((2 << 16) | (694)), 100, 0x2000
	// 0x7: Elec
	.dw	((1 << 16) | (297)), ((2 << 16) | (695)), 100, 0x2000
	// 0x8: Wood
	.dw	((1 << 16) | (298)), ((2 << 16) | (696)), 100, 0x2000
	// 0x9: Shield
	.dw	((1 << 16) | (353)), ((2 << 16) | (747)), 100, 0x2000
	// 0xA: Counter
	.dw	((1 << 16) | (377)), ((2 << 16) | (764)), 100, 0x1000
	// 0xB: Break (Yellow)
	.dw	((1 << 16) | (401)), ((2 << 16) | (785)), 100, 0x2000
	// 0xC: Kick
	.dw	((1 << 16) | (400)), ((2 << 16) | (784)), 100, 0x1000
	// 0xD: Break (Blue)
	.dw	((1 << 16) | (449)), ((2 << 16) | (834)), 100, 0x2000
	// 0xE: Smoke
	.dw	((1 << 16) | (342)), ((2 << 16) | (733)), 100, 0x2000
	// 0xF: Heat Armor
	.dw	((1 << 16) | (480)), ((2 << 16) | (747)), 110, 0x2000
	// 0x10: Aqua Armor
	.dw	((1 << 16) | (481)), ((2 << 16) | (747)), 110, 0x2000
	// 0x11: Elec Armor
	.dw	((1 << 16) | (482)), ((2 << 16) | (747)), 110, 0x2000
	// 0x12: Wood Armor
	.dw	((1 << 16) | (483)), ((2 << 16) | (747)), 110, 0x1400

.align 2
battle_checkStarForceAvailable:
	push	r14

	// Check Brother Satellite is valid
	add	r1,r5,0x1
	bl	200BDC8h
	cmp	r0,0x0
	beq	@@checkAny
	cmp	r0,0x1
	beq	@@checkPegasus
	cmp	r0,0x2
	beq	@@checkLeo
	cmp	r0,0x3
	beq	@@checkDragon
	cmp	r0,0x4
	beq	@@checkAny
	b	@@returnFalse

@@checkAny:
@@checkPegasus:
	// Check if Star Force is unlocked
	ldr	r1,=0x533	// Post Star Force tutorial cutscene
	b	@@checkFlag

@@checkLeo:
	// Check Leo Shadow defeated
	ldr	r1,=0x81B	// Post Leo Shadow battle
	b	@@checkFlag

@@checkDragon:
	// Check Dream Island available
	mov	r1,0x61

@@checkFlag:
	bl	0x202409C
	beq	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r15


.align 2
battle_starForceWildcardOptions:
	push	r5,r14
	ldrb	r5,[r4,r6]

@@checkDragon:
	// Check Dream Island available
	mov	r1,0x61
	bl	0x202409C
	bne	@@checkLeo

	// Remove Green Dragon from options
	mov	r0,0x4
	bic	r5,r0

@@checkLeo:
	// Check Leo Shadow defeated
	ldr	r1,=0x81B
	bl	0x202409C
	bne	@@store

	// Remove Fire Leo from options
	mov	r0,0x2
	bic	r5,r0

@@store:
	strb	r5,[r4,r6]

	mov	r0,0x0
	mov	r1,r5
	pop	r5,r15


.align 2
battle_checkTutorial1CardSelect:
	ldrb	r2,[r4,r1]
	cmp	r2,0x2
	blt	@@true
	bgt	@@false

	// Account for cards in same row
	sub	r1,0x11
	ldrb	r2,[r4,r1]
	add	r1,0x2
	ldrb	r1,[r4,r1]

	cmp	r2,0x3
	bge	@@row2
@@row1:
	cmp	r1,0x3
	blt	@@true	// same row
	b	@@false
@@row2:
	cmp	r1,0x3
	blt	@@false
//	b	@@true	// same row

@@true:
	mov	r1,0x1
	bx	r14

@@false:
	mov	r1,0x0
	bx	r14


.align 2
battle_extraEnemiesRewards:
	mov	r1,0xFF
	add	r1,(0x14F - 0xFF)
	cmp	r0,r1
	blt	@@end
//	sub	r0,0xFF
//	sub	r0,(0x14F - 0xFF)
	ldr	r2,=(battle_extraEnemiesRewardData - 0x14F*0x28)
@@end:
	bx	r14


.align 2
battle_markEnemyCountered:
	push	r0,r14
	mov	r1,0x0
	str	r1,[r4,0x5C]

	// Get ID of enemy being counter hit
	ldr	r0,[r4,0x4]	// entity
	cmp	r0,0x0
	beq	@@end
	mov	r1,0x36
	ldrh	r0,[r0,r1]	// name ID
	cmp	r0,0x0
	beq	@@end

	// Check if this is a boss
	cmp	r0,0xFF
	ble	@@checkCountered

	// Set Star Frags multiplier
	add	r2,=battle_bossStarFragYield
	mov	r1,r0
	sub	r1,0xFF
	sub	r1,0x1
	ldrb	r1,[r2,r1]	// yield
	cmp	r1,0x0
	beq	@@checkCountered

	push	r0-r3
	ldr	r1,=0xF199	// fighting DX boss
	bl	0x202409C
	cmp	r0,0x0
	pop	r0-r3
	beq	@@increaseMultiplier
	add	r1,0x2		// yield + 2 for DX bosses

@@increaseMultiplier:
	// Increase multiplier
	add	r3,=battle_counterCount
	ldrb	r2,[r3]		// multiplier
	cmp	r1,r2
	ble	@@incrementCounters
	strb	r1,[r3]

@@incrementCounters:
	ldrb	r1,[r3,0x1]	// counter count
	cmp	r1,0x3
	bge	@@checkCountered
	add	r1,0x1
	strb	r1,[r3,0x1]

@@checkCountered:
	// Check if enemy already countered
	mov	r2,0x0
	add	r3,=battle_counteredEnemies
@@checkLoop:
	ldrh	r1,[r3]
	cmp	r2,r1
	bge	@@mark
	lsl	r1,r2,0x1
	add	r1,0x2
	ldrh	r1,[r3,r1]	// enemy ID
	cmp	r1,r0
	beq	@@end
	add	r2,0x1
	b	@@checkLoop

@@mark:
	// Mark enemy as countered, win battle to save
	add	r3,=battle_counteredEnemies
	ldrh	r1,[r3]
	cmp	r1,0x8
	beq	@@end
	add	r2,r1,0x1
	strh	r2,[r3]
	lsl	r1,r1,0x1
	add	r1,0x2
	strh	r0,[r3,r1]

@@end:
	pop	r0,r15


.align 2
battle_markEnemiesDeletedCounteredNormal:
	push	r14

	bl	battle_markEnemiesDeletedCountered

	bl	0x2198000
	pop	r15

.align 2
battle_markEnemiesDeletedCountered:
	push	r6-r7,r14

@@markDefeated:
	// Mark all enemies in battle as defeated
	ldr	r7,=(0x21ACC6C+0xE4)
@@loopDefeat:
	ldrb	r0,[r7]
	cmp	r0,0x3
	beq	@@checkLuPelvis
	cmp	r0,0x1
	bne	@@nextDefeat

	ldrh	r0,[r7,0x4]	// enemy ID
	mov	r1,0x0		// delete flag
	bl	battle_setDatabaseFlag

@@nextDefeat:
	add	r7,0x6
	b	@@loopDefeat

@@checkLuPelvis:
	// Check LuPelvis deleted (temp flag for Harp Note)
	ldr	r1,=0xF19A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@setCountered

	// Set LuPelvis deleted flag
	mov	r0,(49)		// LuPelvis enemy ID
	mov	r1,0x0		// delete flag
	bl	battle_setDatabaseFlag

@@setCountered:
	// Mark all countered enemies as countered
	mov	r6,0x0
	add	r7,=battle_counteredEnemies
@@loopCounter:
	ldrh	r0,[r7]
	cmp	r6,r0
	bge	@@end

	lsl	r1,r6,0x1
	add	r1,0x2
	ldrh	r0,[r7,r1]	// enemy ID
	mov	r2,0x0
	strh	r2,[r7,r1]	// clear enemy ID
	mov	r1,0x1		// counter flag
	bl	battle_setDatabaseFlag

	add	r6,0x1
	b	@@loopCounter

@@end:
	// Clear countered enemies
	mov	r0,0x0
	strh	r0,[r7]

	pop	r6-r7,r15

.align 4
battle_counterCount:
	.db	0x0	// multiplier
	.db	0x0	// total count
.align 4
battle_counteredEnemies:
	.dh	0x0	// enemy count
	.fill	0x2 * 0x8
.align 4

.align 4
battle_bossStarFragYield:
	.db	0x0
	.db	0x1, 0x3, 0x5, 0x0, 0x0, 0x0	// Taurus Fire
	.db	0x1, 0x3, 0x5, 0x0, 0x0, 0x0	// Cygnus Wing
	.db	0x1, 0x3, 0x5, 0x0, 0x0, 0x0	// Harp Note
	.db	0x2, 0x4, 0x6, 0x0, 0x0, 0x0	// Libra Scales
	.db	0x2, 0x4, 0x6, 0x0, 0x0, 0x0	// Queen Ophiuca
	.db	0x2, 0x4, 0x6, 0x2, 0x4, 0x6	// Gemini Spark
	.db	0x0, 0x0, 0x0, 0x0, 0x0, 0x0	// Andromeda
	.db	0x1, 0x3, 0x5, 0x0, 0x0, 0x0	// Cancer Bubble
	.db	0x2, 0x4, 0x6, 0x0, 0x0, 0x0	// Wolf Woods
	.db	0x2, 0x4, 0x6, 0x0, 0x0, 0x0	// Crown Thunder
	.db	0x4, 0x6, 0x8, 0x1, 0x0, 0x0	// Pegasus Magic
	.db	0x4, 0x6, 0x8, 0x2, 0x0, 0x0	// Leo Kingdom
	.db	0x4, 0x6, 0x8, 0x2, 0x0, 0x0	// Dragon Sky
	.db	0x7, 0x0, 0x0, 0x0, 0x0, 0x0	// Hollow


.align 2
battle_setDatabaseFlag:
	push	r4-r5,r14
	mov	r4,r1		// 0 = delete, 1 = counter
	mov	r5,r0		// enemy ID

	// Check if LuPelvisG
	cmp	r0,0x36
	blt	@@checkG
	cmp	r0,0x3A
	bgt	@@checkJammer

	// Convert to normal size
	sub	r0,0x5
	b	@@findEntry

@@checkJammer:
	cmp	r0,0x59
	blt	@@checkG
	cmp	r0,0x5E
	bgt	@@checkG

	cmp	r4,0x0
	bne	@@jammerNormal

	// Beat Jammer flag
	ldr	r1,=0xF102
	sub	r0,0x59
	add	r1,r1,r0
	bl	0x2024018	// set flag

@@jammerNormal:
	// Also set normal flag for Jammer
	mov	r0,0x59
	b	@@findEntry

@@checkG:
	// Get enemy data
	bl	0x2006A84

	// Check if boss
	ldrb	r1,[r0,0x1]
	cmp	r1,0x0
	bne	@@boss

	// Check if G virus
	ldrb	r1,[r0,0x3]
	mov	r0,r5
	lsr	r1,r1,0x1
	bcc	@@findEntry

	// Convert to normal size
	sub	r0,0x3		// sub 3 from enemy ID
	b	@@findEntry

@@boss:
	// Convert to V1 (= (enemy - 0x101) / 6 * 6 + 0x101)
	mov	r0,r5
	sub	r0,0xFF
	cmp	r0,(0x100 - 0xFF)
	beq	@@end
	sub	r0,(0x101 - 0xFF)
	mov	r1,0x6
	blx	0x20AED80	// divrem

	// Admin shadow check
	cmp	r0,0xA		// Pegasus
	blt	@@boss2
	cmp	r0,0xC		// Dragon
	bgt	@@boss2
	cmp	r1,0x3		// Shadow
	beq	@@end

@@boss2:
	mov	r1,0x6
	mul	r0,r1
	add	r0,0xFF
	add	r0,(0x101 - 0xFF)

@@findEntry:
	// Find database entry for enemy
	ldr	r1,=records_databaseEntries
@@loop:
	ldrh	r2,[r1]
	cmp	r2,0x0
	beq	@@end

	cmp	r0,r2
	bne	@@next

	// Get flag to set
	lsl	r2,r4,0x1	// delete or counter flag
	add	r2,0x4
	ldrh	r1,[r1,r2]

	// Avoid setting base game flags
	lsr	r2,r1,0xC
	cmp	r2,0xE		// extra flags
	blt	@@end

@@setFlag:
	// Set enemy defeated flag
	bl	0x2024018	// set flag
	b	@@end

@@next:
	add	r1,0x8
	b	@@loop

@@end:
	pop	r4-r5,r15


.align 2
battle_dxBossReward:
	push	r1,r14

	// Check fighting DX boss
	ldr	r1,=0xF199
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@normal

	mov	r0,0xA		// always treat as LV. S
	b	@@end

@@normal:
	ldrb	r0,[r5,0x1]	// get Busting LV
@@end:
	cmp	r7,0x0
	pop	r1,r15

.align 2
battle_dxBossRewardZenny:
	strh	r0,[r4,0xA]
	push	r14

	// Check fighting DX boss
	ldr	r1,=0xF199
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	lsr	r0,r6,0xE
	cmp	r0,0x1
	bne	@@end

	ldr	r0,=(3000)
	add	r6,r6,r0

@@end:
	strh	r6,[r4,0x8]
	pop	r15


.align 2
battle_realWorldVirusReward:
	push	r6-r7,r14
	bl	0x2198B20
	mov	r7,0x0		// G virus Star Frags

@@checkOWVirus:
	ldr	r1,=0x21ACD40
	ldr	r0,[r1]		// get battle flags
	lsl	r0,r0,0x1	// real world virus flag
	bcc	@@chooseGVirus

	// Set fixed reward
	add	r0,=@@owVirusRewards
	ldrb	r1,[r1,0x8]
	ldrb	r0,[r0,r1]	// get card ID
	mov	r1,0x2
	cmp	r0,(231)
	ble	@@setOWVirusReward
	mov	r1,0x3
@@setOWVirusReward:
	lsl	r1,r1,0x9
	orr	r0,r1
	strh	r0,[r4,0x8]	// set to 1st reward

	// Get random 0..3
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	mov	r1,0x3
	and	r1,r0

	// Get Busting LV
	ldrb	r0,[r4,0x1]

	// Get Star Frags yield
	ldr	r2,=battle_gVirusStarFragYieldRealWorld
	lsl	r0,r0,0x2
	add	r0,r0,r1
	ldrb	r0,[r2,r0]	// Star Frags
	lsl	r0,r0,0x19
	lsr	r0,r0,0x19

	b	@@set2ndStarFrags

@@chooseGVirus:
	// choose random enemy; should give priority to G virus
	mov	r0,r5
	mov	r1,0x0
	bl	0x2198BD4
	mov	r6,r0

	// Check Jammer3G
	cmp	r6,(94)
	bne	@@checkBoss

	// 50 Star Frags
	ldr	r0,=((0x3 << 0xE) | (50))
	b	@@set2ndReward

@@checkBoss:
	cmp	r6,0xFF
	ble	@@checkVirus
	sub	r6,0xFF

	// Boss check
	cmp	r6,(0x4F+0x1)
	bne	@@setBossStarFrags

	// Hollow
	// Check got Giga Card from Hollow
	ldr	r1,=0xF03F
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@setBossStarFrags

	// Set flag
	ldr	r1,=0xF03F
	bl	0x2024018	// set flag

	mov	r0,0xEE		// Gemini Thunder
	mov	r1,0x3		// red
	b	@@setGVirusRewardWithClass

@@checkVirus:
	cmp	r6,0xB8
	bgt	@@setBossStarFrags

	// Check forced drop flag
	ldr	r1,=0xF035
	bl	0x202409C	// check flag
	beq	@@checkBustingLV

	// Clear forced drop flag
	ldr	r1,=0xF035
	bl	0x202405C	// clear flag

	mov	r7,0x80

	b	@@chooseGVirusReward

@@checkBustingLV:
	// Get random 0..3
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	mov	r1,0x3
	and	r1,r0

	// Get Busting LV
	ldrb	r0,[r4,0x1]

	// Get Star Frags yield
	ldr	r2,=battle_gVirusStarFragYield
	lsl	r0,r0,0x2
	add	r0,r0,r1
	ldrb	r7,[r2,r0]	// Star Frags

@@chooseGVirusReward:
	add	r1,=@@dropTable
	ldrb	r0,[r1,r6]
	cmp	r0,0xFF
	beq	@@setBossStarFrags

	// Are we getting the Star Card?
	cmp	r7,0x80
	bge	@@chooseGVirusCard

	// Failed Star Card check, give Star Frags
	mov	r0,r7
	b	@@set2ndStarFrags

@@chooseGVirusCard:
	cmp	r0,0xFE
	bne	@@setGVirusReward

	// Choose random song card
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,0x3
	blx	0x208985C	// FX_ModS32
	add	r0,0x64		// PowerSong

@@setGVirusReward:
	mov	r1,0x2
@@setGVirusRewardWithClass:
	lsl	r1,r1,0x9
	orr	r0,r1
@@set2ndReward:
	strh	r0,[r4,0xA]	// set to 2nd reward

@@setBossStarFrags:
	// Check if 2nd reward already set
	ldrh	r0,[r4,0xA]
	ldr	r1,=0xFFFF
	cmp	r0,r1
	bne	@@move2ndTo1st

	// Set boss Star Frags
	ldr	r3,=battle_counterCount
	ldrb	r0,[r3]		// multiplier
	ldrb	r1,[r3,0x1]	// total count
	mul	r0,r1
	cmp	r0,0x0
	beq	@@move2ndTo1st

@@set2ndStarFrags:
	mov	r1,0x3
	lsl	r1,r1,0xE
	orr	r0,r1
	strh	r0,[r4,0xA]	// set to 2nd reward

@@move2ndTo1st:
	// Check if 1st reward is set
	ldrh	r0,[r4,0x8]
	ldr	r1,=0xFFFF
	cmp	r0,r1
	bne	@@end
	// 1st reward is NO DATA, check 2nd reward
	ldrh	r0,[r4,0xA]
	cmp	r0,r1
	beq	@@end
	// Move 2nd reward to 1st reward
	strh	r0,[r4,0x8]
	// Clear 2nd reward
	strh	r1,[r4,0xA]

@@end:
	pop	r6-r7,r15

	.pool

.align 4
@@owVirusRewards:
	.db	(1)	//  1 - Cannon
	.db	(52)	//  2 - TailBurnr1
	.db	(17)	//  3 - IceMeteor1
	.db	(129)	//  4 - Recover50
	.db	(91)	//  5 - BraveSwrd1
	.db	(34)	//  6 - JetAttack1
	.db	(38)	//  7 - PowerBomb2
	.db	(7)	//  8 - Gatling1
	.db	(11)	//  9 - RdrMissil1
	.db	(25)	// 10 - LongSword
	.db	(55)	// 11 - WideWave1
	.db	(40)	// 12 - GhstPulse1
	.db	(4)	// 13 - PlasmaGun1
	.db	(67)	// 14 - CloudShot1
	.db	(16)	// 15 - HeatBall3
	.db	(124)	// 16 - Whistle
	.db	(6)	// 17 - PlasmaGun3
	.db	(103)	// 18 - MoaiFall1
	.db	(27)	// 19 - TidalEdge
	.db	(132)	// 20 - Recover150
	.db	(26)	// 21 - BlazngEdge
	.db	(28)	// 22 - StrikeEdge
	.db	(29)	// 23 - ArboEdge
	.db	(121)	// 24 - TyphnDance
	.db	(125)	// 25 - Bombalizer
	.db	(234)	// 26 - BrkTmeBmb

.align 4
@@dropTable:
	.db	0xFF
	.db	0xFF, 0xFF, 0xFF, 0x1F, 0x20, 0x21				// GrndWave
	.db	0xFF, 0xFF, 0xFF, 0x25, 0x26, 0x27				// PowerBomb
	.db	0xFF, 0xFF, 0xFF, 0x22, 0x23, 0x24				// JetAttack
	.db	0xFF, 0xFF, 0xFF, 0x28, 0x29, 0x2A				// GhstPulse
	.db	0xFF, 0xFF, 0xFF, 0x2B, 0x2C, 0x2D				// FireRing
	.db	0xFF, 0xFF, 0xFF, 0x37, 0x38, 0x39				// WideWave
	.db	0xFF, 0xFF, 0xFF, 0x5B, 0x5C, 0x5D				// BraveSwrd
	.db	0xFF, 0xFF, 0xFF, 0x3A, 0x3B, 0x3C				// ChainBubl
	.db	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x64, 0x65, 0x66, 0xFE, 0xFE	// PowerSong
	.db	0xFF, 0xFF, 0xFF, 0x2E, 0x2F, 0x30				// TimeBomb
	.db	0xFF, 0xFF, 0xFF, 0x43, 0x44, 0x45				// CloudShot
	.db	0xFF, 0xFF, 0xFF, 0x46, 0x47, 0x48				// ThndrBall
	.db	0xFF, 0xFF, 0xFF, 0x61, 0x62, 0x63				// SyncHook
	.db	0xFF, 0xFF, 0xFF, 0x6A, 0x6B, 0x6C				// BigAx
	.db	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.db	0xFF, 0xFF, 0xFF, 0x40, 0x41, 0x42				// StikyRain
	.db	0xFF, 0xFF, 0xFF, 0x4F, 0x50, 0x51				// JumboHmmr
	.db	0xFF, 0xFF, 0xFF, 0x52, 0x53, 0x54				// MopLance
	.db	0xFF, 0xFF, 0xFF, 0x55, 0x56, 0x57				// Fokx-Fu
	.db	0xFF, 0xFF, 0xFF, 0x73, 0x74, 0x75				// BrsrkSwrd
	.db	0xFF, 0xFF, 0xFF, 0x31, 0x32, 0x33				// FireBzook
	.db	0xFF, 0xFF, 0xFF, 0x3D, 0x3E, 0x3F				// GreenInk
	.db	0xFF, 0xFF, 0xFF, 0x49, 0x4A, 0x4B				// VolticEye
	.db	0xFF, 0xFF, 0xFF, 0x34, 0x35, 0x36				// TailBurnr
	.db	0xFF, 0xFF, 0xFF, 0x4C, 0x4D, 0x4E				// FlickrKck
	.db	0xFF, 0xFF, 0xFF, 0x67, 0x68, 0x69				// MoaiFall
	.db	0xFF, 0xFF, 0xFF, 0x58, 0x59, 0x5A				// VulcnSeed
	.db	0xFF, 0xFF, 0xFF, 0x5E, 0x5F, 0x60				// JunkCube
	.db	0xFF, 0xFF, 0xFF, 0x6D, 0x6E, 0x6F				// MagiCrysl
	.db	0xFF, 0xFF, 0xFF, 0x70, 0x71, 0x72				// BlackHole

.align 4
battle_gVirusStarFragYield:
	// &0x80 = Star Card
	.db	0x01, 0x01, 0x01, 0x01	// LV. 1
	.db	0x01, 0x01, 0x01, 0x01	// LV. 2
	.db	0x01, 0x01, 0x01, 0x01	// LV. 3
	.db	0x01, 0x01, 0x03, 0x03	// LV. 4
	.db	0x03, 0x03, 0x03, 0x03	// LV. 5
	.db	0x03, 0x03, 0x05, 0x05	// LV. 6
	.db	0x05, 0x05, 0x85, 0x85	// LV. 7
	.db	0x85, 0x85, 0x85, 0x85	// LV. 8
	.db	0x85, 0x85, 0x85, 0x85	// LV. 9
	.db	0x85, 0x85, 0x85, 0x85	// LV. 10
	.db	0x85, 0x85, 0x85, 0x85	// LV. S
.align 4
battle_gVirusStarFragYieldRealWorld:
	// &0x80 = Star Card
	.db	0x01, 0x01, 0x01, 0x01	// LV. 1
	.db	0x01, 0x01, 0x01, 0x01	// LV. 2
	.db	0x01, 0x01, 0x02, 0x02	// LV. 3
	.db	0x02, 0x02, 0x03, 0x03	// LV. 4
	.db	0x03, 0x03, 0x03, 0x03	// LV. 5
	.db	0x03, 0x03, 0x04, 0x04	// LV. 6
	.db	0x04, 0x04, 0x85, 0x85	// LV. 7
	.db	0x85, 0x85, 0x85, 0x85	// LV. 8
	.db	0x85, 0x85, 0x85, 0x85	// LV. 9
	.db	0x85, 0x85, 0x85, 0x85	// LV. 10
	.db	0x85, 0x85, 0x85, 0x85	// LV. S


.align 2
battle_fixMultiReward:
	add	r0,0x1
	strb	r0,[r4,0x1A]

	ldrb	r1,[r4,0x3]	// number of rewards
	cmp	r1,0x1
	ble	@@end
	mov	r1,0x1
	strb	r1,[r4,0x3]

	add	r0,0x1
	strb	r0,[r4,0x1A]
	mov	r0,0x0
	strb	r0,[r4,0x1B]
	strh	r0,[r4,0x22]	// clear buttons
	mov	r0,0x4		// reset result screen state
	strb	r0,[r4,0x19]

	mov	r1,0x31
	ldrb	r0,[r4,r1]
	add	r0,0x1
	strb	r0,[r4,r1]
@@end:
	bx	r14


.align 2
battle_loadFolder:
	push	r14

	// Get equipped folder
	// r0 = equipped folder
	// r2 = first folder
	bl	0x2007308

	mov	r1,0x3C
	ldrb	r1,[r4,r1]
	lsl	r1,r1,0x1C
	lsr	r1,r1,0x1C
	cmp	r1,0x6		// check battle type 0x6
	bne	@@end

	// Get Extra Folder
	mov	r0,r2
	add	r0,0x78

@@end:
	pop	r15


.align 2
battle_disableBrotherCardsForTimeTrial:
	mov	r2,0x1E
	ldr	r7,[r0]
	mov	r6,0x0

	ldr	r0,=0x21ACD2C
	ldrb	r0,[r0,0x18]
	cmp	r0,0x6		// battle type 0x6

	bx	r14

.align 2
battle_disableLegendCardForTimeTrial:
	ldr	r1,[r0,0x1C]
	mov	r0,r1
	and	r0,r5

	ldr	r3,=0x21ACD2C
	ldrb	r3,[r3,0x18]
	cmp	r3,0x6		// battle type 0x6

	bx	r14


.align 2
battle_shuffleStarForceToTop:
	mov	r1,r4
	mov	r2,0x12
	push	r1-r2,r4-r7,r14

	ldr	r0,=0x21ACD2C
	ldrb	r0,[r0,0x18]
	cmp	r0,0x6		// battle type 0x6
	bne	@@end

	ldr	r0,=0x704
	add	r4,r4,r0	// r4 = shuffled Folder

	mov	r5,(38*0x4)-0x4	// r5 = last card
	mov	r6,(0x118>>0x1)
	lsl	r6,r6,0x1	// r6 = 0x118
	add	r7,r6,0x2	// r7 = 0x11A

@@loop:
	ldrh	r0,[r4,r5]	// r0 = Star Force card
	cmp	r0,r6
	blt	@@next
	cmp	r0,r7
	bgt	@@next

	// Found Star Force Card
	// Choose random slot for it to go
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG_Next
	lsr	r0,r0,0x1
	mov	r1,0x6
	blx	0x208985C	// mod

	lsl	r0,r0,0x2
	ldr	r1,[r4,r0]	// original card
	ldr	r2,[r4,r5]	// Star Force card
	str	r1,[r4,r5]
	str	r2,[r4,r0]
	b	@@end

@@next:
	sub	r5,0x4
	bpl	@@loop

@@end:
	pop	r1-r2,r4-r7,r15


.align 2
battle_saveRecordAfterTimeTrial:
	mov	r0,r4
	add	r0,0xD4
	push	r0,r6-r7,r14

	ldrb	r0,[r0,0x4]	// get battle type
	cmp	r0,0x6
	bne	@@end

	ldr	r0,[r4,0x20]	// battle time
	mov	r1,0x1E
	blx	0x20AEF8C	// r0 = r0 / r1, r1 = r0 % r1
	cmp	r0,0xFF
	bgt	@@end
	mov	r7,r0		// r7 = x:xx:00

	// Calc centiseconds
	mov	r0,0x64
	mul	r0,r1
	mov	r1,0x1E
	blx	0x20AEF8C	// r0 = r0 / r1, r1 = r0 % r1
	mov	r6,r0		// r6 = 0:00:xx

	// Get current time trial
	mov	r0,((0xF2F8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = card count
	lsl	r3,r0,0x1	// r3 = time trial idx * 2

	// Get record seconds
	mov	r0,((0xF300 & 0xFFF) / 8 + 1)
	add	r0,r0,r3
	mov	r1,0x3
	bl	0x20070FC	// r0 = ptr to record seconds

	ldrb	r1,[r0]
	cmp	r7,r1
	bgt	@@bufferRecord
	// Update record seconds
	strb	r7,[r0]		// lower or same
	blt	@@updateRecordCS

	// Get record centiseconds
	ldrb	r1,[r0,0x10]
	cmp	r6,r1		// only checked if seconds equal
	bge	@@bufferRecord

@@updateRecordCS:
	strb	r6,[r0,0x10]

	lsr	r1,r3,0x1	// r1 = time trial idx
	ldr	r3,=0xF009
	add	r1,r3,r1
	add	r1,0x1
	bl	0x2024018	// set boss-specific "beat record" flag

	ldr	r1,=0xF009
	bl	0x2024018	// set "new record" flag

@@bufferRecord:
	// Write to buffer 1-3
	mov	r0,r7
	mov	r1,0x3C
	blx	0x20AEF8C	// r0 = r0 / r1, r1 = r0 % r1
	mov	r7,r1
	mov	r1,r0

	mov	r0,0x1
	bl	0x2008DF0	// set to buffer

	mov	r1,r7
	mov	r0,0x2
	bl	0x2008DF0	// set to buffer

	mov	r1,r6
	mov	r0,0x3
	bl	0x2008DF0	// set to buffer

@@end:
	pop	r0,r6-r7,r15


.align 2
battle_removeChargeOnBusterChange:
	// (don't) check same buster
//	ldrb	r4,[r1,r3]
	strb	r0,[r1,r3]
//	cmp	r4,r0
//	beq	@@end

	// Completely remove charge
	push	r0
	mov	r0,r5
	sub	r0,0x30
	bl	battle_removeCharge
	pop	r0

@@end:
	pop	r3-r5,r15


.align 2
battle_removeChargeOnMegaAttack:
	// reserved: r0, r3
	push	r0,r14

	// Check Star Force
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x1		// Ice Pegasus
	beq	@@end		// don't remove charge

	mov	r0,r4
	bl	battle_removeCharge

@@end:
	pop	r0
	mov	r3,0x0
	ldsb	r0,[r0,r3]
	pop	r15


.align 2
battle_keepChargeAvoidSFXOverlap:
	// Add 1 to the counter
	add	r1,0x1
	strh	r1,[r0,r2]

	ldr	r0,[r3]
	mov	r1,0xCA
	bx	r14


.align 2
battle_removeChargeOnAction:
	push	r14
	lsl	r0,r0,0x4
	ldrb	r0,[r4,r0]

	// Keep for 0 (idle)
	// Remove for 1-6 (deleted, stagger, etc)
	cmp	r0,0x1
	blt	@@hide
	cmp	r0,0x6
	ble	@@remove

	// Keep for 7-8 (dimming)
	// Remove for 9
	cmp	r0,0x9
	beq	@@remove

	// Keep for A (move)
//	// Remove for B (buster)
//	// Don't remove since some cards also use it, and buster removes charge anyway
//	cmp	r0,0xB
//	beq	@@remove

	// Keep for C-F (poof, cannon, ball, sword)
	// Remove for 10 (shield)
	cmp	r0,0x10
	beq	@@remove

	// Keep for 11-14 (vulcan, airspread, moai)
	// Remove for 15 (star force)
	cmp	r0,0x15
	beq	@@remove

	// Keep for 16+ (cards)
@@hide:
	mov	r0,0x1
	b	@@end

@@remove:
	mov	r0,r4
	bl	battle_removeCharge

	mov	r0,0x0

@@end:
	pop	r15


.align 2
battle_removeChargeOnLockOn:
	push	r14

	// Check Star Force
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	mov	r3,(0x1D4 >> 0x2)
	lsl	r3,r3,0x2
	mul	r2,r3
	ldr	r3,=0x21AF023
	ldrb	r2,[r3,r2]
	cmp	r2,0x1		// Ice Pegasus
	beq	@@end		// don't do normal lock-on

	mov	r2,0x1
	strb	r2,[r0,r1]

	mov	r0,r4
	bl	battle_removeCharge

@@end:
	pop	r15


.align 2
battle_clipCharge:
	// r0 = alignment
	push	r4,r14

	mov	r4,(0x1D4 >> 0x2)
	lsl	r4,r4,0x2
	mul	r4,r0

	// Get max charge level
	ldr	r0,=0x21AF022
	ldr	r1,=0x21AF01C
	ldrb	r0,[r0,r4]
	ldrb	r1,[r1,r4]
	bl	0x20077F4
	add	r0,0x1		// add 1 to account for SFX

	ldr	r1,=0x21AF018
	ldrh	r2,[r1,r4]
	cmp	r2,r0
	ble	@@end
	strh	r0,[r1,r4]

@@end:
	pop	r4,r15


.align 2
battle_removeCharge:
	push	r3,r14

	bl	0x217F5EC	// now just hides charge

	// Reset charge counter
	mov	r3,0x0
	strh	r3,[r0,r2]

	pop	r3,r15


	.pool


.align 2
battle_rewardLoadStar:
	push	r0,r5,r14
	sub	sp,0x4

	// Load sprites
	ldr	r0,=0x211C998
	ldr	r1,=0x700F2	// subscreen_242 = star icons
	mov	r2,0x0
	mov	r3,0xC		// 12 tiles
	lsl	r3,r3,0x5
	str	r3,[sp]		// store for VRAM copy

	bl	0x2012544	// alloc and read part of file
	mov	r5,r0

	// [sp] already contains size
	mov	r1,0x0
	mov	r2,0xAB
	lsl	r2,r2,0x6
	mov	r3,r5

	bl	0x202F0F4	// copy to OBJ VRAM

	// Free heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r5
	bl	0x2015620

	mov	r1,r4
	add	r1,0x31
	add	sp,0x4
	pop	r0,r5,r15


.align 2
battle_rewardDrawStarOnCard1:
	push	r14
	bl	0x1FF978C
	bl	battle_rewardDrawStarOnCard
	pop	r15
battle_rewardDrawStarOnCard2:
	mov	r0,r4
	add	r0,0x30
battle_rewardDrawStarOnCard:
	push	r0,r14
	sub	sp,0x8
	ldr	r3,=0xC0AB

	// Check if reward is card
	mov	r0,0x31
	ldrb	r0,[r4,r0]
	lsl	r0,r0,0x1

	// Fix star showing too early
	ldrb	r1,[r4,0x19]
	cmp	r1,0x5
	beq	@@getReward
	mov	r0,0x0

@@getReward:
	add	r0,0x8
	ldrh	r0,[r4,r0]	// get reward ID
	lsr	r1,r0,0x14
	bne	@@end		// not a card

	// Check if card is standard
	lsl	r1,r0,0x17
	lsr	r1,r1,0x17
	cmp	r1,(170)
	bgt	@@end

	lsr	r0,r0,0x9
	cmp	r0,0x2
	bne	@@end

	ldrb	r0,[r4,0x1A]
	cmp	r0,0x1
	bgt	@@draw
	blt	@@end

	ldr	r0,[r4,0x2C]
	cmp	r0,0x9
	blt	@@end
	cmp	r0,0xC
	bge	@@draw
	mov	r1,0xB
	sub	r0,r1,r0
	lsl	r0,r0,0x1
	add	r3,r3,r0

@@draw:
	// Draw star
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	ldr	r2,=0x4059008F
	ldr	r0,=0x211CDC0

	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r0,r15


.align 2
battle_rewardPrintStarCard:
	and	r0,r1

	// Check if card is standard
	cmp	r0,(170)
	bgt	@@end
	lsr	r1,r1,0x9
	cmp	r1,0x2
	bne	@@end

	add	r0,(0x132 - 0xFF)
	add	r0,0xFF

@@end:
	mov	r2,0x3
	bx	r14


.align 2
battle_retaliate:
	ldr	r2,=0x10018	// chip or buster
	tst	r1,r2
	beq	@@end

	// Check Star Force
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	mov	r3,(0x1D4 >> 0x2)
	lsl	r3,r3,0x2
	mul	r2,r3
	ldr	r3,=0x21AF023
	ldrb	r2,[r3,r2]
	cmp	r2,0x3		// Green Dragon
	bne	@@end

	// Check in green invis
	mov	r3,0xAC
	ldr	r3,[r4,r3]
	ldr	r2,[r3,0x2C]
	lsl	r2,r2,0x1
	bcc	@@end

	// Chip can bypass the first frame check
	mov	r2,0x8		// chip
	tst	r1,r2
	bne	@@doRetaliate

	// Check not the first frame
	ldr	r3,=@greenInvisTimers
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	lsl	r2,r2,0x2
	ldr	r2,[r3,r2]
	cmp	r2,0xFD
	bge	@@clearInvis

@@doRetaliate:
	// Set green invis to 2/3 second
	ldr	r3,=@greenInvisTimers
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	lsl	r2,r2,0x2
	add	r3,r3,r2
	mov	r2,0x14
	str	r2,[r3]

	mov	r2,0x10		// 0x10 = buster shot, 0
	tst	r1,r2
	beq	@@end	

	mov	r2,0x10		// 0x10 = buster shot
	bic	r1,r2
	lsl	r2,r2,0xC	// 0x10000 = charge shot
	orr	r1,r2
	str	r1,[r4,r0]
	b	@@end

@@clearInvis:
	// Missed the timing, clear the invis
	mov	r0,0x1
	ldr	r3,=@greenInvisTimers
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	lsl	r2,r2,0x2
	str	r0,[r3,r2]

@@end:
	mov	r0,r4
	mov	r1,0x0
	bx	r14


.align 4
@greenInvisTimers:
	.dw	0x0
	.dw	0x0


.align 2
battle_getGreenInvisMask:
	ldr	r0,=0x80000200
	bx	r14
battle_getGreenInvisMask2:
	ldr	r0,=0x80001200
	bx	r14


.align 2
battle_greenInvisTimer:
	ldr	r1,[r2,0x2C]	// status effects
	lsl	r0,r1,0x1	// test 0x80000000
	bcc	@@next		// timer may not be initialized

	// Check if paused or dimmed
	ldr	r0,=0x21ACC6C
	ldr	r0,[r0,0x30]
	lsr	r3,r0,0x1	// test 0x1 - running
	bcc	@@next
	lsr	r3,r0,0x3	// test 0x4 - dim
	bcs	@@next

	ldr	r3,=@greenInvisTimers
	mov	r0,0x30
	ldrb	r0,[r5,r0]
	lsl	r0,r0,0x2
	add	r3,r3,r0
	ldr	r0,[r3]
	cmp	r0,0xFD		// check if first frame
	bne	@@subtract

	mov	r0,0xF		// set to 20 frames
	b	@@store

@@subtract:
	sub	r0,0x1		// sub 1 from green invis timer
	bmi	@@next		// skip if =0 before sub

@@store:
	str	r0,[r3]
	bne	@@next		// store if >0 before sub
	lsl	r1,r1,0x1	// shift off the green invis flag
	lsr	r1,r1,0x1
	str	r1,[r2,0x2C]
@@next:
	ldr	r0,[r2,0x40]
	cmp	r0,0x0
	bx	r14


	.pool


.align 2
battle_hollowBreak:
	ldr	r1,[r6]
	lsl	r0,r0,0x17
	push	r0-r4,r14

	// Get ID of entity being damaged
	ldr	r3,[r4,0x4]	// object
	mov	r1,0x36
	ldrh	r1,[r3,r1]

	// Check if ID is Hollow
	ldr	r2,=0x14F
	sub	r1,r1,r2
	cmp	r1,0x5
	bhi	@@end

	// Remove shield
	mov	r1,0xAC
	ldr	r4,[r3,r1]	// collision
	ldr	r1,[r4,0x2C]
	mov	r2,0x2
	bic	r1,r2
	str	r1,[r4,0x2C]

	// Get aura
	mov	r1,0xCC
	ldr	r4,[r3,r1]
	cmp	r4,0x0
	beq	@@end

	// Hide aura
	ldr	r1,[r4,0x20]
	mov	r2,0x4
	bic	r1,r2
	str	r1,[r4,0x20]

@@end:
	pop	r0-r4,r15


.align 2
battle_leafShield:
	push	r14
	str	r0,[r6]

	// Check Star Force
	ldr	r0,[r4,0x4]
	cmp	r0,0x0
	beq	@@end
	add	r0,0x30
	ldrb	r0,[r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x3		// Green Dragon
	bne	@@end

	// Check damage value
	ldr	r1,[r5,0x30]
	cmp	r1,0x0
	ble	@@end

	// Heal 25% (12.5% in Legend Mode)
	ldr	r0,[r4,0x4]
	bl	battle_isLegendModeMaybeTimeTrial
	beq	@@normalMode
	lsr	r1,r1,0x1
	b	@@doHeal

@@normalMode:
	lsr	r1,r1,0x2
@@doHeal:
	mov	r2,0x0
	bl	0x2174D9C

	// Start green invis
	ldr	r0,[r4,0x4]
	mov	r1,0x30
	ldrb	r0,[r0,r1]
	lsl	r0,r0,0x2
	ldr	r1,=@greenInvisTimers
	add	r1,r1,r0
	mov	r0,0xFF
	str	r0,[r1]

	mov	r0,0x1
	lsl	r0,r0,0x1F
	ldr	r1,[r4,0x2C]
	orr	r1,r0
	str	r1,[r4,0x2C]

@@end:
	mov	r0,0x0
	pop	r15


.align 2
battle_doubleBuster:
	// Get Buster Attack
	ldrb	r1,[r0,r3]

	// Check Star Force
	add	r0,0x9
	ldrb	r0,[r0,r3]
	cmp	r0,0x2		// Fire Leo
	bne	@@end

	// Double the Attack
	lsl	r1,r1,0x1

@@end:
	str	r1,[r4,r2]
	bx	r14


.align 2
battle_breakBuster:
	push	r0,r14
	cmp	r0,0x0		// Pea shot
	bne	@@end

	// Check Star Force
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x2		// Fire Leo
	bne	@@end

	mov	r0,0x2		// Has breaking properties
	str	r0,[sp]

@@end:
	pop	r0
	bl	0x2007814
	pop	r15


.align 2
battle_doubleFlameBurner:
	// Get Buster Attack
	ldrb	r2,[r1,r3]

	// Check Star Force
	add	r1,0x9
	ldrb	r1,[r1,r3]
	cmp	r1,0x2		// Fire Leo
	bne	@@end

	// Double the Attack
	lsl	r2,r2,0x1

@@end:
	mov	r1,0xA
	bx	r14


.align 2
battle_flameBurnerDuration:
	// Override duration
	mov	r1,(0x144 >> 0x2)
	lsl	r1,r1,0x2
	str	r0,[r4,r1]

	mov	r0,0x68
	ldrh	r1,[r4,r0]
	bx	r14


.align 2
battle_autoLock1:
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r1,r3
	push	r0-r3,r14

	// Check Star Force, part 2
	add	r3,r0,0x4
	ldrb	r3,[r3,r1]
	cmp	r3,0x1		// Ice Pegasus
	bne	@@end

	ldr	r2,=0x21AF1A4
	ldrb	r0,[r2,r1]	// hand index
	add	r2,0x1		// 0x21AF1A5
	ldrb	r3,[r2,r1]	// max hand index
	cmp	r0,r3
	bge	@@end

	lsl	r0,r0,0x1
	sub	r2,0x61		// 0x21AF144
	add	r2,r2,r0
	ldrh	r0,[r2,r1]	// get current card
	bl	0x2006D1C	// get current data ptr

	// Check if card can lock-on
	ldrb	r0,[r0,0x3]
	lsl	r0,r0,0x1C
	beq	@@noLock

	// Get buttons
	ldr	r0,=0x21AF032
	ldr	r1,[sp,0x4]
	ldrh	r0,[r0,r1]
	// Check down pressed
	lsr	r0,r0,0x8	// test 0x80
	bcc	@@checkAutoLock

//	ldr	r0,[sp,0xC]	// alignment
//	bl	battle_toggleAutoLockOff

@@checkAutoLock:
	// Check if auto lock off
	ldr	r0,[sp,0xC]	// alignment
	bl	battle_isAutoLockOff
	bne	@@noLock

	mov	r2,0x3		// AutoLock
	str	r2,[sp,0x8]	// store onto stack
	b	@@end

@@noLock:
	mov	r2,0x0		// no lock
	str	r2,[sp,0x8]	// store onto stack

	mov	r0,r4
	bl	@removeLockOn

//	// Re-enable auto-lock
//	ldr	r0,[sp,0C]	// alignment
//	mov	r1,0x0
//	bl	battle_setAutoLockOff
//	b	@@end

@@end:
	ldrb	r3,[r6,0x3]	// card lock-on type
	lsl	r3,r3,0x1C
	str	r3,[sp,0xC]
	pop	r0-r3,r15


.align 2
battle_autoLock2:
	push	r0-r4,r14

	// Check Star Force
	add	r3,r4,0x4
	ldrb	r3,[r3,r1]
	cmp	r3,0x1		// Ice Pegasus
	bne	@@end

	add	r4,r4,r1	// save r4+r1 for later
	ldr	r2,=0x21AF1A4
	ldrb	r0,[r2,r1]	// card index
	add	r2,0x1		// 0x21AF1A5
	ldrb	r3,[r2,r1]	// max card index
	cmp	r0,r3
	bge	@@end

	lsl	r0,r0,0x1
	sub	r2,0x61		// 0x21AF146
	add	r2,r2,r0
	ldrh	r0,[r2,r1]	// get current card
	bl	0x2006D1C	// get card data ptr

	// Check if card can lock-on
	ldrb	r0,[r0,0x3]
	lsl	r0,r0,0x1C
	beq	@@noLock

	// Check if auto lock off
	mov	r0,0x30
	ldrb	r0,[r5,r0]	// alignment
	bl	battle_isAutoLockOff
	bne	@@noLock

	// Set lock-on immediately
	mov	r0,0x3
	strb	r0,[r4]		// 0x21AF01F
	b	@@end

@@noLock:
//	// Check if auto-locked
//	ldrb	r0,[r4]
//	cmp	r0,0x3
//	bne	@@end

	// Remove lock-on
	mov	r0,0x0
	strb	r0,[r4]

	mov	r0,r5
	bl	@removeLockOn

//	// Re-enable auto-lock
//	mov	r0,0x30
//	ldrb	r0,[r5,r0]	// alignment
//	mov	r1,0x0
//	bl	battle_setAutoLockOff

@@end:
	pop	r0-r4
	ldrb	r3,[r4,r1]
	cmp	r3,0x3
	pop	r15


.align 2
battle_autoLock3:
	// Check Star Force
	add	r3,r4,0x4
	ldrb	r3,[r3,r1]
	cmp	r3,0x1		// Ice Pegasus
	beq	@@end

	// Disable lock-on
	mov	r0,0x0
	strb	r0,[r4,r1]

	// Exit out of function early
	add	sp,0x48
	pop	r3-r7,r15

@@end:
	bx	r14


.align 2
battle_autoLockUseCard:
	mov	r1,(0x1CC >> 0x2)
	lsl	r1,r1,0x2
	push	r0-r3,r14

	// Check Star Force
	mov	r0,0x30
	ldrb	r2,[r4,r0]	// alignment
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r1,r2
	ldr	r0,=0x21AF023
	ldrb	r0,[r0,r1]
	cmp	r0,0x1		// Ice Pegasus
	bne	@@end

	// Check if auto lock is off
	mov	r0,r2		// alignment
	bl	battle_isAutoLockOff
	bne	@@enableAutoLock

	// Evaluate lock-on
	mov	r0,r4
	bl	0x2175A68

@@enableAutoLock:
//	// Re-enable auto lock
//	mov	r0,0x30
//	ldrb	r0,[r4,r0]
//	mov	r1,0x0
//	bl	battle_setAutoLockOff

@@end:
	pop	r0-r3,r15


.align 2
battle_removeLockOnImmediately:
	mov	r2,0x2
	strb	r2,[r0,r1]
	push	r14

	mov	r0,r4
	bl	@removeLockOn

	pop	r15


.align 2
battle_changeFormRemoveAutoLock:
	push	r14
	ldrb	r1,[r3,0x17]	// current form
	cmp	r1,0x1		// Ice Pegasus
	bne	@@reenable

	ldrb	r1,[r3,0x19]	// new form
	cmp	r1,0x1		// Ice Pegasus
	beq	@@end

	// Changing from Pegasus into another form

	// r0 = object
	push	r0,r2-r3
	bl	@removeLockOn
	pop	r0,r2-r3

@@reenable:
	// Re-enable auto-lock for Pegasus
	// r0 = object
	push	r0,r2-r3
	mov	r1,0x30
	ldrb	r0,[r0,r1]	// alignment
	mov	r1,0x0
	bl	battle_setAutoLockOff
	pop	r0,r2-r3

@@end:

	mov	r1,0x0
	strb	r1,[r3,0x17]	// current form
	pop	r15


.align 2
battle_deformRemoveAutoLock:
	push	r7,r14

	// Get current Star Force
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r7,[r1,r0]

	// Change form
	mov	r0,r4
	mov	r1,0x0
	bl	0x217600C

	cmp	r7,0x1		// Ice Pegasus
	bne	@@end

	// Remove lock-on if changed from Pegasus
	mov	r0,r4
	bl	@removeLockOn

//	mov	r0,r4
//	bl	0x2175A68
@@end:
	// Re-enable auto-lock for Pegasus
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,0x0
	bl	battle_setAutoLockOff

	pop	r7,r15


.align 2
@removeLockOn:
	// r0 = object
	push	r14
	mov	r1,0x30
	ldrb	r0,[r0,r1]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1

	ldr	r1,=0x21AF01E

	// Reset lock-on counter
	mov	r2,0x0
	strb	r2,[r1,r0]

	// Disable lock-on
	add	r1,(0x21AF074 - 0x21AF01E)
	ldr	r2,[r1,r0]
	mov	r3,0x1
	bic	r2,r3
	str	r2,[r1,r0]

	// Remove lock-on enemy
	add	r1,(0x21AF088 - 0x21AF074)
	mov	r2,0x0
	str	r2,[r1,r0]

	pop	r15


.align 2
battle_megaAttackDelay1:
	// reserved: r1, r2
	push	r1-r2,r14

	// Check Star Force
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x1		// Ice Pegasus
	bne	@@normal

	mov	r0,0xAC
	ldr	r0,[r4,r0]	// collision
	cmp	r0,0x0
	beq	@@fast

	ldr	r1,[r0,0x40]	// invis timer
	cmp	r1,(10)
	bge	@@fast
	mov	r1,(10)
	str	r1,[r0,0x40]	// invis timer

	ldr	r1,[r0,0x2C]
	mov	r2,0x1
	orr	r1,r2
	str	r1,[r0,0x2C]

@@fast:
	mov	r0,0x1
	b	@@end
@@normal:
	mov	r0,0x3
//	b	@@end
@@end:
	strb	r0,[r4,0x1F]
	pop	r1-r2,r15

.align 2
battle_megaAttackDelay2:
	bl	0x21537F8
	sub	r4,0x90
	b	@megaAttackDelayNextState

.align 2
battle_megaAttackDelay3:
	strb	r1,[r4,r0]
//	b	@megaAttackDelayNextState

@megaAttackDelayNextState:
	// Check Star Force
	mov	r0,0x30
	ldrb	r0,[r4,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x1		// Ice Pegasus
	bne	@@normal

	// Execute next state for Pegasus immediately
	bl	0x21766FC
@@normal:
	// Exit state
	bl	0x2176744

.align 2
battle_megaAttackDelay4:
	// Check Star Force
	mov	r0,0x30
	ldrb	r0,[r5,r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]
	cmp	r0,0x1		// Ice Pegasus
	bne	@@end

	// Reduce lag
	mov	r0,(0x144 >> 0x2)
	lsl	r0,r0,0x2
	mov	r1,0x1
	str	r1,[r5,r0]

	mov	r0,0xAC
	ldr	r0,[r5,r0]	// collision
	cmp	r0,0x0
	beq	@@fast

	ldr	r1,[r0,0x40]	// invis timer
	cmp	r1,(10)
	bge	@@fast
	mov	r1,(10)
	str	r1,[r0,0x40]	// invis timer

	ldr	r1,[r0,0x2C]
	mov	r2,0x1
	orr	r1,r2
	str	r1,[r0,0x2C]

@@fast:
	// Execute next state immediately
	mov	r0,r5
	bl	0x2176810

@@end:
	mov	r0,0x1
	pop	r3-r5,r15


	.pool


.align 2
battle_moveEdgeCheck:
	// Check confusion state
	mov	r5,0xAC
	ldr	r5,[r4,r5]	// collision
	ldr	r5,[r5,0x2C]	// status flags
	lsr	r5,r5,0x5	// test 0x10
	bcs	@@confused

@@notConfused:
	mov	r5,0x30
	ldrb	r5,[r4,r5]
	cmp	r5,0x0
	bne	@@opponent
	b	@@player

@@confused:
	mov	r5,0x30
	ldrb	r5,[r4,r5]
	cmp	r5,0x0
	beq	@@opponent
//	b	@@player

@@player:
	mov	r5,0x68
	ldrb	r5,[r4,r5]
	cmp	r5,0x2
	blt	@@left
	beq	@@middle
	bgt	@@right

@@opponent:
	mov	r5,0x68
	ldrb	r5,[r4,r5]
	cmp	r5,0x2
	blt	@@right
	beq	@@middle
	bgt	@@left

@@left:
	mov	r5,0x10
	b	@@checkDirection
@@middle:
	mov	r5,0x30
	b	@@checkDirection
@@right:
	mov	r5,0x20
@@checkDirection:
	tst	r5,r1
	beq	@@end

	// Fix move + charge shot
	push	r0-r1
	sub	r0,0x8
	ldr	r0,[r4,r0]	// action flag
	lsr	r0,r0,0x5	// test 0x10
	bcs	@@hasCharge
	lsr	r0,r0,0xC	// test 0x10000
	bcc	@@fixEnd
@@hasCharge:
	// Restore charge level
	ldr	r1,[sp,0x8]	// address of charge level
	cmp	r1,0x0
	beq	@@fixEnd
	ldr	r0,[sp,0xC]	// actual charge level
	strh	r0,[r1]
@@fixEnd:
	pop	r0-r1

@@end:
	tst	r5,r1		// have to do it again...
	bx	r14


.align 2
battle_chargeShotDuringDim:
	ldrh	r3,[r7,r3]	// buttons (?)
	ldr	r2,=0x21ACC6C
	ldr	r2,[r2,0x30]
	lsr	r2,r2,0x3	// test 0x4
	bcs	@@ignoreBuster	// ignore during dim

	// Check state
	ldrb	r2,[r4,0x1C]
	cmp	r2,0x9		// idle
	beq	@@end
	cmp	r2,0xA		// movement
	beq	@@end
	cmp	r2,0xB		// buster
	beq	@@end
	cmp	r2,0x10		// shield
	beq	@@end

@@ignoreBuster:
	mov	r3,0x0
@@end:
	mov	r2,0x2
	bx	r14


.align 2
battle_fixMoveChargeShot:
	add	r0,r1,r3
	str	r0,[sp]		// address of charge level
	ldrh	r0,[r1,r3]	// charge level
	str	r0,[sp,0x4]	// actual charge level

	// If overcharged, skip removing charge level
	push	r1-r3,r14
	mov	r0,r2		// alignment
	bl	battle_isOverCharged
	cmp	r0,0x0
	pop	r1-r3
	bne	@@end

	mov	r0,0x0
	strh	r0,[r1,r3]	// charge level

@@end:
	pop	r15

.align 2
battle_fixMoveChargeShot2:
	push	r1-r2,r14

	// Check if Buster charged
	mov	r0,r4
	bl	0x217F498
	mov	r3,0x10		// buster shot
	cmp	r0,0x0
	beq	@@end
	lsl	r3,r3,0xC	// charge shot

@@end:
	pop	r1-r2
	mov	r0,r2
	orr	r0,r3
	pop	r15


.align 2
battle_quickStep1:
	ldrb	r0,[r2,r0]

	// Check paused
	ldr	r1,=0x21ACC6C
	ldr	r1,[r1,0x30]
	lsr	r1,r1,0x1	// test 0x1
	bcc	@@normal

	// Get Star Force
	push	r0
	ldr	r1,[r6,0x70]
	cmp	r1,0x0
	beq	@@normalPop
	add	r1,0x30
	ldrb	r1,[r1]
	mov	r0,(0x1D4 >> 0x2)
	lsl	r0,r0,0x2
	mul	r1,r0
	ldr	r0,=0x21AF023
	ldrb	r1,[r0,r1]
	pop	r0

	// Lower button cycle speed for Pegasus
	cmp	r1,0x1
	bne	@@normal
@@pegasus:
	cmp	r0,0x2
	bx	r14
@@normalPop:
	pop	r0
@@normal:
	cmp	r0,0x4
	bx	r14


.align 2
battle_quickStep2:
	push	r0,r14
	mov	r4,r0
	beq	@@end

	add	r0,0x30
	ldrb	r0,[r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r1,=0x21AF023
	ldrb	r0,[r1,r0]

	ldrb	r1,[r4,0x1D]	// movement state

	cmp	r0,0x1		// check if Pegasus
	bne	@@end

@@state0:
	cmp	r1,0x0
	bne	@@state1
	mov	r0,r4
	bl	0x2180974	// call state 0 twice

	// Check if still in movement state
	ldrb	r0,[r4,0x1C]
	cmp	r0,0xA
	bne	@@pegasusEnd

	mov	r0,r4
	bl	0x2180974	// call state 0 twice

@@state1:
	ldrb	r1,[r4,0x1D]	// reload state
	cmp	r1,0x1
	bne	@@pegasusEnd
	mov	r0,r4
	bl	0x2180B34	// call state 1

@@pegasusEnd:
	mov	r1,0x2		// Skips state 0/1 calls

@@end:
	pop	r0,r15


	.pool


.align 2
battle_customScreenBeforeSuper:
	// from 0219167C
	// r4 = custom screen data
	ldr	r1,[r4,r1]	// get slot index

	mov	r0,0xC
	mul	r0,r1
	ldr	r2,=0x120
	add	r0,r0,r2
	ldrh	r0,[r4,r0]	// get card ID
	cmp	r0,0xA8
	bgt	@@normal

@@isSuper:
	mov	r3,0x1
	str	r3,[sp]
	ldr	r0,=0x17E0
	str	r0,[sp,0x4]
	ldr	r0,=(0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F))
	str	r0,[sp,0x8]
	mov	r0,0xE
	str	r0,[sp,0xC]
	str	r0,[sp,0x10]
	ldr	r0,=0x1D0007
	mov	r1,0x21
	mov	r2,0x0
	// Start script 40 from mess_0007
	bl	0x2008754

	// Return
	bl	0x21917B0

@@normal:
	mov	r0,0x24
	bx	r14


.align 2
battle_customScreenAfterSuper:
	// from 021917C6
	// r4 = custom screen data
	ldr	r3,=0x6D0
	add	r3,r4,r3
	ldr	r2,[r3,0x1C]	// get slot index

	push	r0-r2,r14

	mov	r0,0xC
	mul	r0,r2
	ldr	r1,=0x120
	add	r0,r0,r1
	ldrh	r0,[r4,r0]	// get card ID
	cmp	r0,0xA8
	bgt	@@normal

@@isSuper:
	// Get card data
	bl	0x2006D1C
	ldrh	r0,[r0,0x1A]	// get scan ID
	mov	r1,0xA
	lsl	r1,r1,0x8
	strh	r0,[r4,r1]	// store scan ID for card

	bl	0x2008DC0
	cmp	r0,0x0
	beq	@@activate
	cmp	r0,0x1
	beq	@@useNormally
	b	@@end

@@activate:
	ldr	r1,=0x6D0
	add	r1,r4,r1
	mov	r0,0xD		// start Wave Scanner
	strb	r0,[r1,0xD]
	mov	r0,0x0
	strb	r0,[r1,0xE]
	mov	r0,0x1
	strb	r0,[r1,0xF]

//	ldr	r1,[sp,0x8]
//	mov	r0,0xC
//	mul	r0,r1
//	ldr	r1,=0x120
//	add	r1,r1,r0
//	add	r1,r4,r1
//	ldrb	r0,[r1,0xA]	// get slot flags
//	mov	r2,0x10
//	orr	r0,r2		// set used flag
//	strb	r0,[r1,0xA]

	// End
	add	sp,0x10
	bl	0x219186A

@@useNormally:
	// Select the card
	mov	r0,r4
	ldr	r1,[sp,0x8]
	bl	0x21934AC

@@end:
	// Return
	add	sp,0x10
	bl	0x2191814

@@normal:
	pop	r0-r2
	bl	0x202409C
	pop	r15


.align 2
battle_customScreenChooseCard:
	// from 02193724
	// r4 = custom screen data
	// r5 = selected card index
	push	r14

	// Check any card used this turn
	ldr	r0,=0x9B8
	add	r0,(0xA04-0x9B8)
	ldrh	r0,[r4,r0]
	cmp	r0,0x0
	bne	@@normal

	// Check if no cards selected yet
	ldr	r0,=0x9B8
	add	r0,0x11
	ldrb	r0,[r4,r0]	// Load selected cards count
	cmp	r0,0x0
	bgt	@@normal

	// Check if card is standard
	mov	r1,0xC
	mul	r1,r5
	ldr	r0,=0x120
	add	r1,r1,r0
	add	r1,r4,r1
	ldrh	r0,[r1]
	cmp	r0,0xA8
	bgt	@@normal

	// Check if card is blue or mega fav
	ldrb	r0,[r1,0xA]	// Load flags
//	lsr	r0,r0,0x5	// test 0x10
//	bcs	@@normal	// Effect already used
	lsr	r0,r0,0x6	// test 0x20
	bcs	@@isSuper	// Marked as super fav
	ldrb	r0,[r1,0x2]	// Load color
	cmp	r0,0x2
	bne	@@normal

@@isSuper:
	// Check card already used
	mov	r0,r4
	ldrh	r1,[r1]
	bl	0x2193EB4
	cmp	r0,0x1
	bne	@@normal

	ldr	r1,=0x6D0
	add	r1,r4,r1
	mov	r0,0xC		// starts Star Force selection for now
	strb	r0,[r1,0xD]
	mov	r0,0x0
	strb	r0,[r1,0xE]
	strb	r0,[r1,0xF]
	str	r5,[r1,0x1C]
	b	@@end

@@normal:
	// select the chip
	mov	r0,r4
	mov	r1,r5
	bl	0x21934AC

@@end:
	pop	r15


.align 2
battle_customScreenDoStarForce:
	push	r0,r1,r14
	ldr	r6,=commonVars
	ldrb	r3,[r6,(var_doStarForceState - commonVars)]
	cmp	r3,0x1
	beq	@@state1

	// Get Star Force we're about to do
	ldr	r3,=0x9F4
	ldrb	r3,[r4,r3]
	add	r3,0x1

	// Get Star Force we're currently in
	ldr	r0,=0x21ACC6C
	mov	r1,0x0
	bl	0x214FD88
	add	r0,0x30
	ldrb	r0,[r0]
	mov	r1,(0x1D4 >> 0x2)
	lsl	r1,r1,0x2
	mul	r0,r1
	ldr	r5,=0x21AF023
	ldrb	r5,[r5,r0]
	cmp	r3,r5
	bne	@@doStarForce

	// Start confirm message
	mov	r0,0x1
	strb	r0,[r6,(var_doStarForceState - commonVars)]

	// r0 = 1h
	ldr	r1,=0x17E0
	ldr	r2,=(0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F))
	mov	r3,0xE
	push	r0-r4		// Push extra register for allocation
	str	r3,[sp,0x10]

	ldr	r0,=0x1D0007	// mess_0007
	mov	r1,0x19		// script 25
	mov	r2,0x0
	mov	r3,0x1

	bl	0x2008754
	add	sp,0x14

	b	@@end

@@state1:
	// Check if script finished
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

	mov	r0,0x0
	strb	r0,[r6,(var_doStarForceState - commonVars)]

	// Get last choice
	bl	0x2008DC0
	cmp	r0,0x0
	beq	@@doStarForce

@@cancel:
	ldr	r1,=0x6DE
	mov	r0,0x0
	strh	r0,[r4,r1]
	sub	r2,r1,0x1
	mov	r0,0x3
	strb	r0,[r4,r2]
	b	@@end

@@doStarForce:
	ldr	r1,=0x6DE
	mov	r3,r1
	add	r3,0xE
	pop	r0,r1,r15

@@end:
	add	sp,(0x14+0xC)
	pop	r4-r7,r15


.align 2
battle_customScreenScanSuccess:
	// from 02191938
	mov	r1,0x1
	strb	r1,[r4,r0]

	// Check if scan done by super card or real Wave Scanner
	add	r0,0x1
	ldrb	r1,[r4,r0]
	cmp	r1,0x0
	beq	@@end

	mov	r1,0x0		// clear flag (used by animation)
	strb	r1,[r4,r0]

//	add	r0,0xD
//	ldr	r0,[r4,r0]	// get slot index
//	mov	r1,0xC
//	mul	r0,r1
//	ldr	r1,=0x120
//	add	r1,r1,r0
//	add	r1,r4,r1
//	ldrb	r0,[r1,0xA]	// get slot flags
//	mov	r2,0x10
//	orr	r0,r2		// set used flag
//	strb	r0,[r1,0xA]

@@end:
	bx	r14


.align 2
battle_customScreenMarkCardAsFavorite:
	// from 021924C4
	// r3 = card custom screen flags
	// sp+04 = card class
	ldr	r1,[sp,4h]
	cmp	r1,2h
	bne	@@end

	mov	r1,20h		// Flag as mega fav
	orr	r3,r1

@@end:
	mov	r1,1h
	orr	r3,r1
	bx	r14


.align 2
battle_customScreenProcessCard:
	// from 02191B3C
	// Get card ID
	ldrh	r6,[r1,r0]
	sub	r0,0x8		// r0 = 0x118
	push	r0-r2,r14
	sub	r1,r6,r0
	add	r1,0x8
	bmi	@@end
	cmp	r1,0x5
	bgt	@@end

@@isBrotherCard:
	// Check if this is the Brother we were Star Forcing with
	add	r1,0x1
	ldr	r2,=var_broStarForce
	ldr	r2,[r2]
	cmp	r1,r2
	bne	@@setBestComboUsed

	// Replace card with any Star Force card (just use Pegasus)
	mov	r6,r0
//	b	@@end

@@setBestComboUsed:
//	push	r0
//
//	// Check if we're in multiplayer
//	bl	0x2153958
//	cmp	r0,0x1
//	bne	@@isSinglePlayer
//
//	// Mark the Best Combo as used
//	ldr	r1,=0x9B8
//	add	r1,0x30
//	strh	r6,[r4,r1]
//
@@isSinglePlayer:
//	pop	r0

@@end:
	pop	r0-r2,r15


.align 2
battle_customScreenUpdateCardStates:
	push	r4,r14
	str	r1,[sp,0x8]

	// Check if card is a Star Force card
	sub	r0,0x8		// r0 = 0x118
	sub	r0,r7,r0
	bmi	@@normal
	cmp	r0,0x2
	bgt	@@normal

	mov	r4,r5
	bl	battle_haveQueuedStarForce
	cmp	r0,0x0
	beq	@@normal

@@disableCard:
	ldr	r0,=0x219205D
	pop	r4
	add	sp,0x4
	bx	r0

@@normal:
	pop	r4
	cmp	r4,0x3
	pop	r15


.align 2
battle_customScreenDrawLabel:
	push	r14
	add	r1,r1,r0
	ldrb	r2,[r1,0x2]	// Load color
	cmp	r2,0x2		// is blue?
	bne	@@end

	// Check if card is standard
	ldrh	r0,[r1]
	cmp	r0,(170)
	bgt	@@end

	mov	r2,0x1		// Set yellow
	bl	common_isWhiteCardID
	beq	@@end
	mov	r2,0x0		// Set white

@@end:
	lsl	r1,r2,0x1
	pop	r15


.align 2
battle_customScreenShowStar:
	// from 02194794
	ldr	r6,[sp,0x8]	// card sprite info
	ldr	r4,[r6,0x34]	// custom screen info
	ldrb	r5,[r6,0x13]	// custom screen slot

	// Check if card is super
	mov	r1,0xC
	mul	r5,r1
	ldr	r0,=0x120
	add	r5,r5,r0
	add	r5,r4,r5
	ldrh	r1,[r5]		// card ID
	cmp	r1,(170)
	bgt	@@end

	// Check super already used
	mov	r0,r4
	bl	0x2193EB4
	cmp	r0,0x1
	bne	@@end

	// Check if card is blue or mega fav
	ldrb	r0,[r5,0xA]	// Load flags
	lsr	r0,r0,0x6	// test 0x20
	bcs	@@isSuper	// Marked as super fav
	ldrb	r0,[r5,0x2]	// Load color
	cmp	r0,0x2
	bne	@@end

@@isSuper:
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	mov	r2,0x4
	lsl	r2,r2,0xC
	ldrh	r0,[r6,0x18]
	add	r0,0x3D		// x-offset
	add	r2,r2,r0

	lsl	r2,r2,0x8

	// Check any card used this turn
	ldr	r0,=0x9B8
	add	r0,(0xA04-0x9B8)
	ldrh	r0,[r4,r0]
	cmp	r0,0x0
	bne	@@grayOut

//	ldrb	r0,[r5,0Ah]	// Load flags
//	lsr	r0,r0,5h	// test 0x10
//	bcs	@@grayOut	// Effect already used
	ldr	r0,=9B8h
	add	r0,11h
	ldrb	r0,[r4,r0]	// Load selected cards count
	cmp	r0,0h
	beq	@@setY
@@grayOut:
	add	r2,0x4

@@setY:
	lsl	r2,r2,0x8
	ldrh	r0,[r6,0x1A]
	add	r0,0x27		// y-offset
	add	r2,r2,r0

	// Draw sprite
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	ldr	r3,=0xC578
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r0,r3-r6,r15


.align 2
battle_starCardDescription:
	lsl	r0,r0,0x4
	push	r0,r14
	add	r4,r1,r0

	// Check if card is super
	ldrh	r1,[r4]		// card ID
	cmp	r1,(170)
	bgt	@@normal

	// Check super already used
	mov	r0,r5
	bl	0x2193EB4
	cmp	r0,0x1
	bne	@@normal

	// Check if card is blue or mega fav
	ldrb	r0,[r4,0xA]	// flags
	lsr	r0,r0,0x6	// test 0x20
	bcs	@@isSuper	// marked as super fav
	ldrb	r0,[r4,0x2]	// color
	cmp	r0,0x2
	bne	@@normal

@@isSuper:
	ldr	r1,=data_extraCardInfo
	ldrh	r0,[r4]		// card ID
	lsl	r0,r0,0x1
	ldrb	r0,[r1,r0]	// power up description
	cmp	r0,0x0
	beq	@@normal
	add	r0,0xFF
	add	r4,r0,0x1
	b	@@end

@@normal:
	ldrh	r4,[r4]		// card ID
@@end:
	pop	r0,r15


.align 2
battle_customScreenSelectUnselectCard:
	push	r2,r14

	ldrb	r2,[r1,r0]	// Load color
	cmp	r2,0x2		// is blue?
	bne	@@end

	sub	r0,0x2
	ldrh	r0,[r1,r0]	// Card ID
	cmp	r0,(170)
	bgt	@@end
	bl	common_isWhiteCardID
	beq	@@end
	mov	r2,0x0		// Set white

@@end:
	mov	r0,r2
	cmp	r0,0x0
	pop	r2,r15


.align 2
battle_haveQueuedBestCombo:
	// r4 = custom screen data pointer
	mov	r3,1h
	b	battle_haveQueuedCard

battle_haveQueuedStarForce:
	// r4 = custom screen data pointer
	mov	r3,0h

battle_haveQueuedCard:
	// Initialize loop counter
	mov	r2,0h

@@loop:
	// Loop bound check (number of selected cards)
	ldr	r0,=9B8h
	add	r0,11h
	ldrb	r0,[r4,r0]
	cmp	r2,r0
	bge	@@returnFalse

	// Get card index
	lsl	r0,r2,1h
	ldr	r1,=9B8h
	add	r0,r1,r0
	ldrh	r0,[r4,r0]

	// Get card ID
	mov	r1,0Ch
	mul	r0,r1
	mov	r1,12h
	lsl	r1,r1,4h	// r1 = 0x120
	add	r0,r1,r0
	ldrh	r0,[r4,r0]

@@checkBrother:
	// Check if this is a Brother card
	sub	r1,10h		// r1 = 0x110
	sub	r0,r0,r1
	bmi	@@next
	cmp	r0,5h
	bgt	@@checkStarForce

	// Check if Brother Card index matches var_broStarForce
	ldr	r1,=var_broStarForce
	ldrb	r1,[r1]
	add	r0,1h
	cmp	r0,r1
	beq	@@isStarForce

@@isBestCombo:
	// Brother Card is a Best Combo card
	cmp	r3,1h
	beq	@@returnTrue

	b	@@next

@@checkStarForce:
	// Check if card ID is a Star Force card
	cmp	r0,8h
	blt	@@next
	cmp	r0,0Ah
	bgt	@@next

@@isStarForce:
	// Brother Card is a Star Force
	cmp	r3,0h
	bne	@@next

@@returnTrue:
	mov	r0,1h
	b	@@end

@@next:
	add	r2,1h
	b	@@loop

@@returnFalse:
	mov	r0,0h
@@end:
	bx	r14


	.pool


.align 2
battle_getBossDimensions:
	cmp	r0,0xE
	blt	@@end

	add	r1,=battle_extraBossDimensions
	sub	r0,0xE
@@end:
	lsl	r0,r0,0x5
	add	r0,r1,r0
	bx	r14

.align 4
battle_extraBossDimensions:
	.dw	((130) << 0xC), (( 45) << 0xC), (( 65) << 0xC), (( 95) << 0xC)	// Hollow
	.dw	((147) << 0xC), ((  0) << 0xC), (( 50) << 0xC), (( 58) << 0xC)	// Hollow


.align 4
battle_panelFlags:
	.dw	0x0	// none
	.dw	0x2	// normal
	.dw	0x6	// unused
	.dw	0x8	// unused
	.dw	0x42	// grass
	.dw	0x82	// ice
	.dw	0x102	// poison
	.dw	0x202	// holy
	.dw	0x402	// guardnull
	.dw	0x802	// gravity
	.dw	0x1002	// trap
	.dw	0x2002	// hollow

.align 4
battle_panelGraphics:
	.dw	0			// none
	.dw	((3 << 16) | (1))	// normal
	.dw	((3 << 16) | (1))	// unused
	.dw	((3 << 16) | (1))	// unused
	.dw	((3 << 16) | (3))	// grass
	.dw	((3 << 16) | (4))	// ice
	.dw	((3 << 16) | (5))	// poison
	.dw	((3 << 16) | (6))	// holy
	.dw	((3 << 16) | (7))	// guardnull
	.dw	((3 << 16) | (8))	// gravity
	.dw	((3 << 16) | (9))	// trap
	.dw	((3 << 16) | (33))	// hollow

.align 4
battle_panelAnimations:
	.dw	0, 0			// none
	.dw	0, 0			// normal
	.dw	0, 0			// unused
	.dw	0, 0			// unused
	.dw	0, 0			// grass
	.dw	0, 0			// ice
	.dw	0x21A2BE8, 5		// poison
	.dw	0x21A2C14, 5		// holy
	.dw	0x21A2BCC, 6		// guardnull
	.dw	0x21A2BD4, 5		// gravity
	.dw	0, 0			// trap
	.dw	@hollowPanelAnim, 5	// hollow

.align 4
@hollowPanelAnim:
	.dh	0x00, 3
	.dh	0x40, 4
	.dh	0x80, 4
	.dh	0xC0, 9
	.dh	0x80, 4
	.dh	0x40, 4
	.dh	0x00, 4
	.dh	0x00, -1

.align 0x4
battle_hollowCameraIntro:
	// INTRO PAN
	// Set camera position
	.dw	0x09
	.fill	0x4
	.dw	0xFFEEFB91, 0x000C427F, 0x00167C29
	.fill	0xC

	.dw	0x0F
	.fill	0x4
	.dw	0xFFFFF419, 0x000003E3, 0x000009F8
	.fill	0xC

	.dw	0x0C
	.fill	0x4
	.dw	0x003CCAF0, 0x00000000, 0x00000000
	.fill	0xC

	.dw	0x0D
	.fill	0x4
	.dw	0x00000BC0, 0x00000000, 0x00000000
	.fill	0xC

	// Wait 1 frame
	.dw	0x01
	.dw	0x01
	.fill	0x18

	// Movement for 30 frames
	.dw	0x13
	.dw	0x1E
	.dw	0xFFEA1C19, 0x000C527F, 0x000FE8A0
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 20 frames
	.dw	0x13
	.dw	0x14
	.dw	0xFFE8486A, 0x000C527F, 0x000CC371
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0xFFE81219, 0x000C527F, 0x000C4189
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// OVER THE SHOULDER
	// Set camera position
	.dw	0x09
	.fill	0x4
	.dw	0xFFFA81CC, 0x0005AB74, 0xFFFA7BB0
	.fill	0xC

	.dw	0x0F
	.fill	0x4
	.dw	0xFFFFFB01, 0x0000018A, 0xFFFFF0E1
	.fill	0xC

	.dw	0x0C
	.fill	0x4
	.dw	0x0021E0A9, 0x00000000, 0x00000000
	.fill	0xC

	.dw	0x0D
	.fill	0x4
	.dw	0x00000BC0, 0x00000000, 0x00000000
	.fill	0xC

	// Wait 1 frame
	.dw	0x01
	.dw	0x01
	.fill	0x18

/*	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0xFFFA81CC, 0x0005AB74, 0xFFFA7BB0
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0xFFFA81CC, 0x0005AB74, 0xFFFA7BB0
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0xFFFA81CC, 0x0005AB74, 0xFFFA7BB0
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C*/
	// Wait 30 frames
	.dw	0x01
	.dw	0x1E
	.fill	0x18

	// PANEL VIEW
	// Set camera position
	.dw	0x09
	.fill	0x4
	.dw	0x000DF771, 0xFFF085F0, 0xFFE98647
	.fill	0xC

	.dw	0x0F
	.fill	0x4
	.dw	0x000007BF, 0xFFFFF6D5, 0xFFFFF56C
	.fill	0xC

	.dw	0x0C
	.fill	0x4
	.dw	0x0035D15D, 0x00000000, 0x00000000
	.fill	0xC

	.dw	0x0D
	.fill	0x4
	.dw	0x00000BC0, 0x00000000, 0x00000000
	.fill	0xC

	// Wait 1 frame
	.dw	0x01
	.dw	0x01
	.fill	0x18

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x000DF771, 0xFFF085F0, 0xFFE98647
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x000DF771, 0xFFF085F0, 0xFFE98647
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x000DF771, 0xFFF085F0, 0xFFE98647
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// ZOOM OUT
	// Set camera position
	.dw	0x09
	.fill	0x4
	.dw	0x0000D462, 0x000A3964, 0xFFF565CA
	.fill	0xC

	.dw	0x0F
	.fill	0x4
	.dw	0x0000032B, 0x00000978, 0xFFFFF37F
	.fill	0xC

	.dw	0x0C
	.fill	0x4
	.dw	0x000F341D, 0x00000000, 0x00000000
	.fill	0xC

	.dw	0x0D
	.fill	0x4
	.dw	0x00000BC0, 0x00000000, 0x00000000
	.fill	0xC

	// Wait 1 frame
	.dw	0x01
	.dw	0x01
	.fill	0x18

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x0000D462, 0x000A3964, 0xFFF565CA
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x0000D462, 0x000A3964, 0xFFF565CA
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 10 frames
	.dw	0x13
	.dw	0x0A
	.dw	0x0000D462, 0x000A3964, 0xFFF565CA
	.fill	0xC

	// Wait for movement
	.dw	0x02
	.fill	0x1C

	// Movement for 30 frames
	.dw	0x14
	.dw	0x1E
	.dw	0x00000000, 0xFFFB4DF0, 0xFFEA3466
	.fill	0xC

	// Movement for 30 frames
	.dw	0x15
	.dw	0x1E
	.dw	0x00000000, 0x0009A8A0, 0x001F48D5
	.fill	0xC

	// Movement for 30 frames
	.dw	0x17
	.dw	0x1E
	.dw	0x00000BC0, 0x00000000, 0x00000000
	.fill	0xC

	// End
	.dw	0x00
	.fill	0x1C

battle_tutorial1Script1:
	.db	0x00,	0x00,0x00		// script 0 on top screen
	.db	0x00,	0x01,0x01		// script 1 on bottom screen
	.db	0x02,	0x00,0x03,0xFF		// highlight cards 1, 4
	.db	0x00,	0x01,0x05		// script 5 on bottom screen
	.db	0x02,	0x00,0x01,0x02,0xFF	// highlight cards 1, 2, 3
	.db	0x00,	0x01,0x02		// script 2 on bottom screen
	.db	0x02,	0x00,0x04,0xFF		// highlight cards 1, 5
	.db	0x00,	0x01,0x03		// script 3 on bottom screen
	.db	0x03				// end

.align 2
battle_extraEnemiesRewardData:
	// Hollow - 7500z
	.dh	0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C
	.dh	0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C, 0x5D4C

.align 4
battle_extraHitType1:
	// &0x1 = invis piercing (also has 0x8?), &0x2 = breaking, &0x4/&0x80 = sword (?)
	.dw	0x0004000B, 0x0008000B	// 0x20 - breaking and invis piercing
	.dw	0x0004000D, 0x00080089	// 0x21 - sword and invis piercing
