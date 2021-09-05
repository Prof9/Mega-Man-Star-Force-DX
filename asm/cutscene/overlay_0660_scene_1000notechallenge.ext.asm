.align 2
note_clearVars:	
	// Clear variables
	ldr	r1,=0x21ABCF8
	ldr	r1,[r1]
	mov	r0,0x0
	str	r0,[r1]
	str	r0,[r1,0x4]

//	mov	r0,0x0
	bx	r14

.align 2
note_setLevel:
	// Set level
	ldr	r0,=0x21ABCF8
	ldr	r0,[r0]
	mov	r1,0x0
	strb	r1,[r0]		// level

	// Clear notes spawned
	mov	r1,0x0
	strb	r1,[r0,0x7]

	// Copy level data
	add	r1,=@levelData
	ldmia	[r1]!,r1-r3
	add	r0,0xC
	stmia	[r0]!,r1-r3

	// Clear number of failures
	ldr	r1,=0x21362CC
	mov	r0,0x0
	strb	r0,[r1,0x10]

	// Clear score
	add	r1,=@score
//	mov	r0,0x0
	str	r0,[r1]

	// Clear SPEED UP!! timer
	add	r1,=@speedUpDisplayTimer
//	mov	r0,0x0
	str	r0,[r1]

//	mov	r0,0x0
	bx	r14


note_loadCounter:
	push	r1,r4,r14	// push extra for allocation

	// Load palette from fieldminigame_14.bin
	ldr	r0,=0x211C998
	ldr	r1,=((0x12 << 16) | (14))
	bl	0x2012518	// alloc and load file
	mov	r4,r0

	// Copy palette to VRAM
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,0xE		// palette 0xE - overwrite text sprites
	mov	r3,r4
	bl	0x202F338	// copy OBJ palette

	// Unload palette
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r4
	bl	0x2015620	// free from heap

	// Load tiles from fieldminigame_13.bin
	ldr	r0,=0x211C998
	ldr	r1,=((0x12 << 16) | (13))
	bl	0x2012518	// alloc and load file
	mov	r4,r0

	// Copy tiles to VRAM
	mov	r0,(filesize(TEMP+"/notegame-sprites.img.bin") >> 0x6)
	lsl	r0,r0,0x6
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	ldr	r2,=0xC880
	mov	r3,r4
	bl	0x202F0F4	// copy OBJ tileset

	// Unload tiles
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r4
	bl	0x2015620	// free from heap

	mov	r0,0x0
	pop	r1,r4,r15	// pop extra for deallocation


note_runGame:
	// r4 = this
	push	r7,r14
	ldr	r7,=0x21ABCF8
	ldr	r7,[r7]

	// Set notes to spawn
	ldrb	r0,[r7,0x7]	// notes spawned
	add	r1,=@pattern
	ldrb	r0,[r1,r0]	// notes to spawn
	strb	r0,[r7,0xE]

	// Normal game runner
	bl	0x218993C
	push	r0

	// Check if note hit
	ldrb	r0,[r7,0x4]	// notes shot
	cmp	r0,0x0
	beq	@@updateScore

	// Choose random small crowd member to jump
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,(@CROWD_SIZE-1)
	blx	0x208985C	// r0 = small crowd member idx

	// Make crowd member jump
	add	r3,r0,0x1	// skip big crowd members
	ldr	r0,=0x21AC1D8
	mov	r1,0x2
	mov	r2,0x1
	bl	0x216492C	// set NPC variable

@@updateScore:
	// Update score
	ldrb	r0,[r7,0x4]	// notes shot
	add	r2,=@score
	ldr	r1,[r2]
	add	r1,r1,r0
	str	r1,[r2]
	// Clear minigame score
	mov	r0,0x0
	strb	r0,[r7,0x4]	// notes shot

	// Update crowd
	ldr	r0,[@currentCrowdSize]
	cmp	r0,@CROWD_SIZE
	bge	@@check1000

	// Check threshold
	add	r2,=@crowdThresholds
	lsl	r3,r0,0x1
	ldrh	r3,[r2,r3]	// threshold
	cmp	r1,r3
	blt	@@check1000

	// Spawn in next crowd member
	add	r1,r0,0x1
	add	r2,=@currentCrowdSize
	str	r1,[r2]

	// Set crowd command
	add	r1,=@crowdNpcOrder
	ldrb	r3,[r1,r0]	// NPC
	ldr	r0,=0x21AC1D8
	mov	r1,0x2
	mov	r2,0x0
	bl	0x216492C	// set NPC variable

@@check1000:
	// Check 1000
	mov	r0,(1000 >> 0x2)
	lsl	r0,r0,0x2
	ldr	r1,[@score]
	cmp	r1,r0
	blt	@@checkWave

	// Finish game
	mov	r0,0x7F
	strb	r0,[r7,0x4]	// notes shot
	mov	r0,r7
	bl	0x215FB88
	str	r0,[sp]
	b	@@end

@@checkWave:
	// Reset wave
	ldrb	r0,[r7,0x7]	// notes spawned
	cmp	r0,(50)		// length of wave
	blt	@@end

	// Check score multiple of 50
	mov	r0,r1		// total score
	mov	r1,(50)
	blx	0x208985C	// mod s32
	cmp	r0,0x0
	bne	@@end

	// Start next wave
	mov	r0,0x0
	strb	r0,[r7,0x5]	// timer
	strb	r0,[r7,0x7]	// notes spawned

	// Show SPEED UP!!
	mov	r0,0x40
	add	r1,=@speedUpDisplayTimer
	str	r0,[r1]

	// Reduce time between waves
	ldrb	r0,[r7,0xC]	// time between waves
	sub	r0,0x2
	strb	r0,[r7,0xC]	// time between waves

	// Increase note speed every other wave
	ldr	r0,[@score]
	mov	r1,(2 * 10)
	blx	0x208985C	// mod s32
	cmp	r0,0x0
	bne	@@end
	ldrb	r0,[r7,0x12]	// note speed
	add	r0,0x1
	strb	r0,[r7,0x12]	// note speed

@@end:
	// Return result from game runner
	pop	r0,r7,r15


.align 2
note_drawScore:
	mov	r0,0x0
	mov	r1,0x0
	push	r0-r1,r4-r5,r14

	// Draw note icon
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r2,=0x405A0004
	ldr	r3,=0xE336
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r2,=0x006A8004
	ldr	r3,=0xE336
	add	r3,0x2
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r2,=0x005A4014
	ldr	r3,=0xE336
	add	r3,0x3
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

	// Draw score
	ldr	r4,[@score]
	mov	r5,0x90		// x-coordinate
@@loop:
	// Get digit
	mov	r0,r4
	mov	r1,(10)
	blx	0x208985C	// mod s32

	// Draw digit
	lsl	r0,r0,0x1
	ldr	r3,=0xE322	// tile
	add	r3,r3,r0
	ldr	r2,=0x40000007
	lsl	r0,r5,0x10	// x-position
	orr	r2,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

	// Go to next digit
	sub	r5,(11)

	mov	r0,r4
	mov	r1,(10)
	blx	0x2089820	// div s32
	mov	r4,r0
	bne	@@loop

	// Check game ended
	ldr	r1,=0x462
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	// Do SPEED UP!! timer
	add	r1,=@speedUpDisplayTimer
	ldr	r0,[r1]
	cmp	r0,0x0
	beq	@@end
	sub	r0,0x1
	str	r0,[r1]

	// Draw SPEED UP!!	
	lsr	r0,r0,0x3	// test 0x8
	bcc	@@end

	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r2,=0x80664021
	ldr	r3,=0xE33A
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r2,=0x80864021
	ldr	r3,=0xE33A
	add	r3,0x4
	// [sp], [sp+0x4] = 0
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	mov	r0,0x1		// loop forever
	pop	r4-r5,r15


.align 2
note_saveResults:
	push	r4,r14

	// Clear flags: got high score, got rewards, got 1000 score, plural rewards, plural points
	ldr	r1,=0xF12D
	mov	r2,0x5
	bl	0x202407C	// clear flag range

	// Buffer score
	ldr	r1,[@score]
	mov	r0,0x0		// buffer 0
	bl	0x2008DF0	// store in text buffer

	// Check got max score
	ldr	r0,[@score]
	ldr	r1,=(1000)
	cmp	r0,r1
	bne	@@calcReward

	// Set flag: got max score
	ldr	r1,=0xF12D
	add	r1,0x2
	bl	0x2024018	// set flag

	// Set bonus reward
	mov	r4,(50)
	b	@@setReward

@@calcReward:
	// Calculate reward (score / 25)
	mov	r1,(25)
	blx	0x2089820	// div s32
	mov	r4,r0
//	b	@@setReward

@@setReward:
	// Buffer reward
	mov	r0,0x1		// buffer 1
	mov	r1,r4		// reward
	bl	0x2008DF0	// store in text buffer

	cmp	r4,0x0
	beq	@@checkHighScore

	// Set flag: got rewards
	ldr	r1,=0xF12D
	add	r1,0x1
	bl	0x2024018	// set flag

	cmp	r4,0x1
	beq	@@checkHighScore

	// Set flag: plural rewards
	ldr	r1,=0xF12D
	add	r1,0x3
	bl	0x2024018	// set flag

@@checkHighScore:
	// Get high score
	mov	r0,((0xF2A8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// high score HI
	lsl	r4,r0,0x8

	mov	r0,((0xF2A0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// high score LO
	add	r4,r4,r0

	ldr	r1,[@score]
	cmp	r1,r4
	ble	@@checkPluralScore
	mov	r4,r1

	// Set new high score
	mov	r0,((0xF2A8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// ptr to high score HI
	lsr	r1,r4,0x8
	strb	r1,[r0]

	mov	r0,((0xF2A0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// ptr to high score LO
	strb	r4,[r0]

	// Set got a high score flag
	ldr	r1,=0xF12D
	bl	0x2024018	// set flag

@@checkPluralScore:
	ldr	r0,[@score]
	cmp	r0,0x1
	beq	@@end

	// Set flag: plural score
	ldr	r1,=0xF12D
	add	r1,0x4
	bl	0x2024018	// set flag

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
note_setupCrowd:
	push	r4,r14

	// Reset crowd size
	add	r1,=@currentCrowdSize
	mov	r0,0x0
	str	r0,[r1]

	// Create shuffled appear order
	add	r0,=@crowdNpcOrder
	mov	r1,0x0
@@loopAppearOrder:
	strb	r1,[r0,r1]	// list[i] = i
	add	r1,0x1
	cmp	r1,@CROWD_SIZE
	blt	@@loopAppearOrder
	// r0 = array and r1 = size
	bl	0x20069B0	// shuffle 8-bit

	ldr	r1,=0xF132	// big sprite is bull
	bl	0x202405C	// clear flag

	// Generate score thresholds
	mov	r4,0x1
@@loopScoreThresholds:
	// Choose threshold (n+1)*75 +- 10
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,(20+1)
	blx	0x208985C	// r0 = [0..20]
	mov	r1,(75)
	mul	r1,r4		// r1 = (n+1)*75
	sub	r1,(10)
	add	r0,r1,r0	// r0 = (n+1)*75 +- 10

//	lsl	r0,r4,0x1	// r0 = (n+1)*2

	// Store threshold
	sub	r1,r4,0x1
	lsl	r1,r1,0x1
	add	r2,=@crowdThresholds
	strh	r0,[r2,r1]

	add	r4,0x1
	cmp	r4,@CROWD_SIZE
	ble	@@loopScoreThresholds

	// Choose big sprite (1-in-4 chance to be bull)
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,0x4
	blx	0x208985C	// mod s32
	cmp	r0,0x0
	bne	@@chooseSmallSprites

	ldr	r1,=0xF132	// big sprite is bull
	bl	0x2024018	// set flag

@@chooseSmallSprites:
	mov	r4,0x1
@@loopSmallSprites:
	// Choose small sprite
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,@CROWD_SMALL_SPRITE_COUNT
	blx	0x208985C	// mod s32

	// Buffer small sprite
	add	r1,=@crowdSmallSprites
	lsl	r0,r0,0x1
	ldrh	r1,[r1,r0]
	mov	r0,r4
	bl	field_setNpcSpriteBuffer

	add	r4,0x1
	cmp	r4,@CROWD_SIZE
	blt	@@loopSmallSprites

	pop	r4,r15


	.pool

.align 4
@score:
	.dw	0x0
.align 4
@currentCrowdSize:
	.dw	0x0
.align 4
@speedUpDisplayTimer:
	.dw	0x0
.align 4
@levelData:
	.db	70	// time between waves
	.db	10	// max random extra time
	.db	1	// min notes
	.db	0	// max extra notes
	.db	50	// total notes per wave
	.db	0	// damage
	.db	25	// note speed
	.db	0	// time limit for reward (seconds)
	.dw	0	// zennys reward
.align 4
@pattern:
	.db	1
	.db	1
	.db	1
	.db	2, 1
	.db	1
	.db	2, 1
	.db	2, 1
	.db	2, 1
	.db	2, 1
	.db	2, 1
	.db	2, 1
	.db	3, 2, 1
	.db	2, 1
	.db	3, 2, 1
	.db	2, 1
	.db	3, 2, 1
	.db	2, 1
	.db	2, 1
	.db	3, 2, 1
	.db	2, 1
	.db	3, 2, 1
	.db	3, 2, 1
	.db	4, 3, 2, 1

.align 4
.definelabel @CROWD_SIZE,8
@crowdNpcOrder:
	.fill	@CROWD_SIZE

.align 4
@crowdThresholds:
	.fill	@CROWD_SIZE*0x2

.align 4
.definelabel @CROWD_SMALL_SPRITE_COUNT,5
@crowdSmallSprites:
	.dh	0x004B, 0x004C, 0x004D, 0x004E, 0x0056