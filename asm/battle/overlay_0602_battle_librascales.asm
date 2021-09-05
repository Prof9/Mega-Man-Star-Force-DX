// Overlay 602 - Libra Scales

.nds
.open TEMP+"/overlay_0602.bin",readu32(TEMP+"/y9.bin", 602 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21BFF20	// Flame Weight damage
	// Old: 40, 70, 140
	.dh	40, 70, 140, 500, 140, 140
.org 0x21BFF44	// Aqua Weight damage
	// Old: 40, 70, 140
	.dh	40, 70, 140, 500, 140, 140
.org 0x21BFF50	// HP
	// Old: 900, 1100, 1700
	.dh	900, 1500, 2000, 4500, 2000, 2000
.org 0x21BFF5C	// Contact damage
	// Old: 40, 70, 140
	.dh	40, 70, 140, 500, 140, 140
.org 0x21BFF68	// Libra Swing damage
	// Old: 40, 70, 140
	.dh	40, 70, 140, 500, 140, 140
.org 0x21BFF74	// Heavy Weight damage
	// Old: 40, 70, 140
	.dh	40, 70, 140, 500, 140, 140

.org 0x21C0060	// Heavy Weight pre lag
	.db	30, 20, 10, 5, 10, 10
.org 0x21C0080	// Libra Swing pre lag
	.db	15, 10, 5, 3, 5, 5


.org 0x21BECBA
	bl	@dxModel
.org 0x21BECF4
	bl	@dxHP
.org 0x21BEC7E
	bl	@dxContactDamage
.org 0x21BF51A
	bl	@dxFlameWeight
.org 0x21BF6EE
	bl	@dxAquaWeight
.org 0x21BF8B6
	bl	@dxLibraSwing
.org 0x21BFB82
	bl	@dxHeavyWeight


.org 0x21BEDD2
	bl	@advanceAnimation

.org 0x21BEF6C
	bl	@flameAquaWeightSpeed1
.org 0x21BEF74
	bl	@flameAquaWeightSpeed2
.org 0x21BF0CC
	bl	@flameAquaWeightSpeed1
.org 0x21BF0D4
	bl	@flameAquaWeightSpeed2
.org 0x21BF510
	push	r14
	bl	@flameAquaWeightSetup
.org 0x21BF542
	bl	0x200DC28
	pop	r15
.org 0x21BF6E4
	push	r14
	bl	@flameAquaWeightSetup
.org 0x21BF716
	bl	0x200DC28
	pop	r15
.org 0x21BF8AC
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF8C6
	bl	@libraSwingPreLag
.org 0x21BF8EA
	bl	@libraSwingCounterFrames
.org 0x21BF8EE
	pop	r15
.org 0x21BFB78
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFB92
	bl	@heavyWeightPreLag
.org 0x21BFBA2
	bl	@heavyWeightPostLag
.org 0x21BFBB4
	bl	@heavyWeightCounterFrames
.org 0x21BFBCC
	pop	r15

.org 0x21BF67E
	bl	@fireTowerLength
.org 0x21BF852
	bl	@aquaTowerLength


.org 0x21BEF8E
	bl	@setPrevPanel
.org 0x21BF0EE
	bl	@setPrevPanel
.org 0x21BF244
	bl	@setPrevPanel
.org 0x21BF3E2
	bl	@setPrevPanel

.org 0x21BEE00
	bl	@ai


.orga readu32(TEMP+"/y9.bin", 602 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@setPrevPanel:
	push	r1,r14

	add	r3,=@prevPanel
	ldrh	r1,[r1]
	strh	r1,[r3]

	pop	r1
	bl	0x21748C4
	pop	r15

.align 2
@ai:
	push	r4,r14
	mov	r4,r0

	// Check Y-position
	mov	r0,0x69
	ldrb	r0,[r4,r0]	// y
	cmp	r0,0x4
	bge	@@normal

	// Check prev panel
	add	r0,=@prevPanel
	ldr	r1,[r0]
	cmp	r1,0x0
	beq	@@normal
	ldrb	r1,[r0]
	cmp	r1,0x1
	blt	@@normal
	cmp	r1,0x3
	bgt	@@normal
	ldrb	r1,[r0,0x1]
	cmp	r1,0x4
	blt	@@normal
	cmp	r1,0x5
	bgt	@@normal

	// Jump back to prev panel
	ldrh	r1,[r0]
	mov	r0,0x68
	strh	r1,[r4,r0]
	mov	r0,0x6A
	strh	r1,[r4,r0]

	// Set 3D position
	mov	r0,r4
	mov	r1,r4
	add	r0,0x6C
	add	r1,0x68
	bl	0x2153380

	// Update collision position
	mov	r0,r4
	bl	0x21748B0

	// Update model position
	mov	r0,0xA8
	ldr	r0,[r4,r0]
	mov	r1,r4
	add	r1,0x6C
	bl	0x200DC28

@@normal:
	mov	r0,r4
	bl	0x21BEE64	// normal AI

	pop	r4,r15


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (497))
@@end:
	bl	0x21745FC
	// Clear prev panel
	add	r0,=@prevPanel
	mov	r1,0x0
	str	r1,[r0]
	pop	r15
.align 2
@dxHP:
@dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r1,0x2
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r15
.align 2
@dxContactDamage2:
	push	r14
	bl	battle_isDXBoss_r4obj
	beq	@@end
	add	r1,0x2
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r4
	pop	r15
.align 2
@dxFlameWeight:
@dxAquaWeight:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r0,[r0,r2]
	mov	r2,0x4E
	pop	r15
.align 2
@dxLibraSwing:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r1,[r1,r2]
	mov	r2,0x4E
	pop	r15
.align 2
@dxHeavyWeight:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r2,[r1,r2]
	mov	r1,0x4E
	pop	r15

.align 4
@prevPanel:
	.dw	0x0


	.pool


.align 2
@fireTowerLength:
	// Old: 10
	// New: 5
	push	r14
	mov	r1,(10)
	bl	battle_isDXBoss_r5obj
	beq	@@checkLegend
	mov	r1,(5)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(5)
@@end:
	str	r1,[sp,(0x4+0x4)]
	pop	r15
.align 2
@aquaTowerLength:
	// Old: 15
	// New: 8
	push	r14
	mov	r1,(15)
	bl	battle_isDXBoss_r5obj
	beq	@@checkLegend
	mov	r1,(8)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(8)
@@end:
	str	r1,[sp,(0x4+0x4)]
	pop	r15


.align 2
@flameAquaWeightSetup:
	mov	r1,r0
	add	r0,0x34
	ldrb	r0,[r0]
	bx	r14
.align 2
@heavyWeightPreLag:
	// Old: 30, 20, 10
	// New: 10, 7, 4
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r3,[r2,r3]
	mov	r2,r1
	pop	r15
.align 4
@@data:
	.db	10, 7, 4, 1, 4, 4
.align 2
@heavyWeightPostLag:
	// Old: 15, 15, 15
	// New: 10, 8, 6
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r3,[r2,r3]
	mov	r2,r1
	pop	r14
.align 4
@@data:
	.db	10, 8, 6, 3, 10, 10
.align 2
@heavyWeightCounterFrames:
	// Old: 5, 5, 5
	// New: 5, 5, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldsh	r3,[r2,r3]
	mov	r2,r1
	pop	r14
.align 4
@@data:
	.dh	5, 5, 5, 5, 5, 5
.align 2
@libraSwingPreLag:
	// Old: 15, 10, 5
	// New: 7, 5, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	7, 5, 3, 1, 3, 3
.align 2
@libraSwingCounterFrames:
	// Old: 9, 9, 9
	// New: 6, 6, 6
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r1,[r1,r3]
	str	r1,[r0,r2]
	pop	r15
.align 4
@@data:
	.dh	6, 6, 6, 6, 6, 6
.align 2
@flameAquaWeightSpeed1:
	push	r14
	add	r1,=@animationAlternating
	mov	r2,0x0
	str	r2,[r1]

	mov	r1,r5
	mov	r2,0x34

	bl	battle_isDXBoss
	beq	@@checkLegend
//	mov	r2,0x27		// 1.5x speed
	mov	r2,0x1A		// double speed
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x1A		// double speed
@@end:
	pop	r15
.align 2
@flameAquaWeightSpeed2:
	push	r14
	add	r0,=@animationAlternating
	mov	r1,0x0
	str	r1,[r0]

	mov	r0,(0x144 >> 2)
	mov	r1,0x34

	bl	battle_isDXBoss
	beq	@@checkLegend
//	mov	r1,0x27		// 1.5x speed
	mov	r1,0x1A		// double speed
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,0x1A		// double speed
@@end:
	pop	r15

.align 2
@advanceAnimation:
	push	r0,r14
	bl	0x217466C	// advance animation
	pop	r0

	bl	battle_isLegendMode
	beq	@@checkDX

@@doubleSpeed:
	// Make Flame Weight/Aqua Weight animations twice as fast
	mov	r1,0x31
	ldrb	r1,[r0,r1]	// animation
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x1
	blt	@@end
	cmp	r1,0x6
	bgt	@@end
	bl	0x217466C	// advance animation
	b	@@end

@@checkDX:
	bl	battle_isDXBoss
	beq	@@end

	b	@@doubleSpeed

	// Make Flame Weight/Aqua Weight animations 1.5x as fast
	mov	r1,0x31
	ldrb	r1,[r0,r1]	// animation
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x1
	blt	@@end
	cmp	r1,0x6
	bgt	@@end

	add	r1,=@animationAlternating
	ldr	r2,[r1]
	mov	r3,0x1
	eor	r2,r3
	str	r2,[r1]
	beq	@@end
	bl	0x217466C	// advance animation

@@end:
	pop	r15

.align 4
@animationAlternating:
	.dw	0x0

.aligna 32
.endarea
.close
