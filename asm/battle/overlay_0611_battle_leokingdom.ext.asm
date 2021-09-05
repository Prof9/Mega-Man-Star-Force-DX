.align 2
leo_dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (512))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
leo_dxHP:
leo_dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r1,0x4
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r15
.align 2
leo_dxContactDamage_r4:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r1,0x4
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r4
	pop	r15
.align 2
leo_dxModelClaw:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	ldr	r1,=((1 << 0x10) | (513))
@@end:
	bl	0x2174634
	pop	r15


.align 2
leo_dxMagmaBall:
leo_dxGigantPress:
leo_dxFlameTail:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x4
@@end:
	ldrh	r1,[r1,r3]
	str	r1,[r0,r2]
	pop	r15
.align 2
leo_dxVolcanoClaw:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x4
@@end:
	ldrh	r2,[r2,r3]
	str	r2,[r0,r1]
	pop	r15
.align 2
leo_dxLeoBlazer:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x4
@@end:
	ldrh	r2,[r1,r2]
	mov	r1,0x4E
	pop	r15


.align 2
leo_init:
	// Randomize counters
	add	sp,0x10
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Random Gigant Press counter
	ldr	r0,=0x211F6A8
	bl	0x20069E0		// random
	lsr	r0,r0,0x1
	mov	r1,(3)
	blx	0x208985C		// mod s32
	ldr	r1,=0x195
	str	r0,[r5,r1]

	// Random Volcano Claw counter
	ldr	r0,=0x211F6A8
	bl	0x20069E0		// random
	lsr	r0,r0,0x1
	mov	r1,(3)
	blx	0x208985C		// mod s32
	ldr	r1,=0x195
	add	r1,0x1
	str	r0,[r5,r1]

	// Random Flame Tail counter
//	ldr	r0,=0x211F6A8
//	bl	0x20069E0		// random
//	lsr	r0,r0,0x1
//	mov	r1,(3)
//	blx	0x208985C		// mod s32
//	ldr	r1,=0x195
//	add	r1,0x2
//	str	r0,[r5,r1]

@@end:
	pop	r15

	.pool

.align 2
leo_moveLag:
	// Old: 10, 5, 1, 10
	// New: 7, 4, 1, 7
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	mov	r1,(0x140 >> 0x6)
	pop	r15
.align 4
@@data:
	.db	7, 4, 1, 7, 1, 1
.align 2
leo_magmaBallPreLag:
	// Old: 15, 10, 1, 15
	// New: 10, 5, 1, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r2,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 10, 1, 1
.align 2
leo_magmaBallPostLag:
	// Old: 15, 10, 5, 25
	// New: 10, 7, 3, 15
	push	r7,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r7,=@magmaBallCount
	mov	r1,0x0
	str	r1,[r7]
	str	r1,[r7,0x4]
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	add	r1,r2,0x1
	pop	r7,r15
.align 4
@@data:
	.db	10, 7, 3, 15, 1, 1
.align 2
leo_gigantPressPreLag:
	// Old: 13, 10, 8, 15
	// New: 10, 8, 6, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r2,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	10, 8, 6, 10, 6, 1
.align 2
leo_gigantPressPostLag:
	// Old: 15, 10, 5, 20
	// New: 9, 6, 3, 12
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	add	r1,r2,0x1
	pop	r15
.align 4
@@data:
	.db	9, 6, 4, 12, 3, 1
.align 2
leo_flameTailPreLag:
	// Old: 30, 10, 8, 60
	// New: 15, 8, 6, 30
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r2,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	15, 8, 6, 30, 4, 1
.align 2
leo_flameTailPostLag:
	// Old: 30, 20, 10, 60
	// New: 15, 12, 7, 30
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	add	r1,r2,0x1
	pop	r15
.align 4
@@data:
	.db	15, 12, 7, 30, 5, 1
.align 2
leo_volcanoClawPreLag:
	// Old: 15, 10, 5, 60
	// New: 12, 8, 3, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	mov	r1,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	12, 8, 5, 15, 4, 1
.align 2
leo_volcanoClawPostLag:
	// Old: 15, 10, 5, 60
	// New: 10, 5, 1, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r3,[r2,r3]
	add	r2,r1,0x1
	pop	r15
.align 4
@@data:
	.db	10, 5, 1, 15, 1, 1
.align 2
leo_volcanoClawCount:
	// Old: 2, 2, 3, 1
	// New: 3, 3, 4, 2
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r3,[r2,r3]
	add	r2,r1,0x3
	pop	r15
.align 4
@@data:
	.db	3, 3, 4, 2, 4, 1
.align 2
leo_volcanoClawSwipePreLag:
	// Old: 15, 15, 15, 30
	// New: 15, 14, 13, 12
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x10
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
	lsr	r1,r1,0x3
@@end:
	ldrb	r0,[r0,r1]
	cmp	r2,r0
	pop	r15
.align 4
@@data:
	.db	15, 14, 13, 15, 12, 15
.align 2
leo_volcanoClawSwipePostLag:
	// Old: 10, 12, 8, 30
	// New: 10, 8, 6, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x10
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
	lsr	r1,r1,0x3
@@end:
	ldrb	r0,[r0,r1]
	cmp	r2,r0
	pop	r15
.align 4
@@data:
	.db	10, 8, 6, 15, 6, 15
.align 2
leo_leoBlazerPreLag:
	// Old: 60
	// New: 30
	push	r14
	mov	r2,(60)
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,(30)
@@end:
	add	r1,0x8
	pop	r15

.align 2
leo_gigantPressGravity:
	// New: Lv2, Lv2, Lv3, Lv2
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	cmp	r0,0x0
	beq	@@end
	mov	r1,0x34
	ldrb	r1,[r4,r1]	// level
	bl	battle_isDXBoss
	beq	@@getGravity
	add	r1,0x2
@@getGravity:
	add	r2,=@@data
	ldrb	r1,[r2,r1]
	strb	r1,[r0,0x1F]	// gravity
@@end:
	mov	r0,0x5
	mov	r1,0x12
	pop	r15
.align 4
@@data:
	.db	2, 2, 3, 2, 3, 2

.align 2
leo_magmaBallCounter:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// Clear previous animation
	mov	r2,32h
	mov	r3,0x0
	strb	r3,[r4,r2]

	// Only counterable for the first one
	ldr	r2,[@magmaBallCount]
	cmp	r2,0x0
	bne	@@end
@@normal:
	bl	0x21749AC
@@end:
	pop	r15

.align 2
leo_magmaBallTarget:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// First one goes straight
	ldr	r0,[@magmaBallCount]
	cmp	r0,0x0
	beq	@@normal

	ldr	r0,[@magmaBallRow]
	b	@@end

//	// Get player object
//	mov	r0,r4
//	mov	r1,0x0
//	bl	0x21753B4
//	cmp	r0,0x0
//	beq	@@normal
//
//	// Target player column
//	mov	r1,0x68		// previous position
//	ldsb	r0,[r0,r1]	// player x
//	b	@@end

@@normal:
	mov	r0,0x68
	ldsb	r0,[r4,r0]
@@end:
	pop	r15

.align 2
leo_magmaBallTriple:
	// Get repeat count
	add	r3,=@magmaBallRepeatCount
	mov	r2,0x34
	ldrb	r2,[r4,r2]	// level
	ldrb	r3,[r3,r2]	// repeat count
	sub	r3,0x1

	mov	r1,0x12		// lag
	bl	battle_isLegendMode
	beq	@@normal

	ldr	r2,[@magmaBallCount]
	cmp	r2,r3
	bge	@@normal

	// Override lag count
	mov	r2,0x34
	ldrb	r2,[r4,r2]	// level
	bl	battle_isDXBoss
	beq	@@getRepeatLag
	add	r2,0x2
@@getRepeatLag:
	add	r1,=@magmaBallRepeatLag
	ldrb	r1,[r1,r2]

@@normal:
	cmp	r0,r1
	bcc	@@target
	bl	battle_isLegendMode
	beq	@@finish

	// Check repeat
	add	r2,=@magmaBallCount
	ldr	r1,[r2]
	cmp	r1,r3
	bge	@@noRepeat

	add	r1,0x1
	str	r1,[r2]

	// Reset animation
	mov	r1,0x32
	mov	r0,0x0
	strb	r0,[r4,r1]

	// Do repeat
	mov	r0,0x3
	strh	r0,[r4,0x1E]	// state and substate
	b	@@end

@@noRepeat:
	mov	r1,0x0
	str	r1,[r2]
@@finish:
	bl	0x21BF6EC

@@target:
	bl	battle_isLegendMode
	beq	@@end

	ldr	r2,[@magmaBallCount]
	cmp	r2,r3
	bge	@@end

	// first frame: timer = 3
	sub	r7,r0,0x5
	bmi	@@end
	bne	@@highlight

	// Get player object
	mov	r0,r4
	mov	r1,0x0
	bl	0x21753B4
	cmp	r0,0x0
	beq	@@ahead

	// Target player row
	mov	r1,0x68
	ldsb	r0,[r0,r1]
	b	@@setTarget

@@ahead:
	// Get own row
	mov	r0,0x68
	ldsb	r0,[r4,r0]
//	b	@@setTarget

@@setTarget:
	add	r1,=@magmaBallRow
	str	r0,[r1]

@@highlight:
	lsr	r0,r7,0x3	// test 0x4
	bcs	@@end

	// Highlight panel
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	lsl	r0,r0,0x2
	mov	r1,0x5
	sub	r1,r1,r0	// y
	ldr	r0,[@magmaBallRow]
	mov	r2,0x1
	bl	0x2153894

@@end:
	bl	0x21BF722

.align 4
@magmaBallCount:
	.dw	0x0
.align 4
@magmaBallRow:
	.dw	0x0
.align 4
@magmaBallRepeatCount:
	.db	3, 4, 5, 3, 5, 3
.align 4
@magmaBallRepeatLag:
	.db	10, 9, 8, 10, 7, 10

	.pool
