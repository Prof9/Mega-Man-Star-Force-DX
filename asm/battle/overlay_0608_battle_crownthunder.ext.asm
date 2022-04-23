.align 2
crown_ghostSummonPosition:
	push	r14

	// Copy 3D position to snapback position
	mov	r0,r4
	mov	r1,r4
	add	r0,0x5C
	add	r1,0x6C
	bl	0x200DC28

	mov	r0,(0x168 >> 0x2)
	lsl	r0,r0,0x2
	pop	r15


.align 2
crown_dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (506))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
crown_dxHP:
	push	r14
	ldsh	r1,[r0,r4]
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=(5000)
@@end:
	mov	r0,r5
	pop	r15
.align 2
crown_dxContactDamage:
	push	r14
	ldsh	r1,[r0,r4]
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=(400)
@@end:
	mov	r0,r5
	pop	r15
.align 2
crown_dxMenacingBowgun:
	push	r14
	ldrb	r1,[r0,r1]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r1,=(500)
@@end:
	mov	r0,r5
	pop	r15
.align 2
crown_dxAssaultLance:
	push	r14
	ldrh	r0,[r0,r2]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r0,=(500)
@@end:
	mov	r2,0x2
	pop	r15
.align 2
crown_dxWavyHammer:
	push	r14
	ldrb	r2,[r2,r3]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r2,=(500)
@@end:
	str	r2,[sp,(0x24+0x4)]
	pop	r15
.align 2
crown_dxFallThunder:
	push	r14
	ldrb	r4,[r0,r1]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r4,=(400)
@@end:
	mov	r1,0x1
	pop	r15


.align 2
crown_waveHammerGravity:
	push	r0,r14
	bl	0x2183564
	pop	r0
	bl	battle_isLegendMode
	beq	@@end
	cmp	r0,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r1,[r0,r1]
	cmp	r1,0x0
	beq	@@end
	mov	r0,0x2		// Gravity Lv. 2
	strb	r0,[r1,0x1F]
@@end:
	pop	r15
.align 2
crown_fallThunderConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	strh	r1,[r4,r0]
	pop	r15
.align 2
crown_fallThunderPostLag:
	// Old: 60, 60, 60
	// New: 35, 25, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,(0x154 >> 0x2)
	pop	r15
.align 4
@@data:
	.db	35, 25, 15, 5
.align 2
crown_fallThunderMidLag:
	// Old: 4, 4, 4
	// New: 4, 3, 2
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	strh	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	4, 3, 2, 1
.align 2
crown_fallThunderPreLag1:
	// Old: 11, 6, 1
	// New: 5, 3, 1
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	add	r2,r1,0x1
	pop	r15
.align 4
@@data:
	.db	5-1, 3-1, 1-1, 1-1
.align 2
crown_fallThunderPreLag2:
	// Old: 10, 10, 10
	// New: 8, 7, 5
	add	r0,0x28
	push	r0-r1,r14
	mov	r2,(10)
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x34
	ldrb	r0,[r4,r0]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r0,0x1
@@checkLegend:
	add	r1,=@@data
	ldrb	r2,[r1,r0]
@@end:
	pop	r0-r1,r15
.align 4
@@data:
	.db	8, 7, 5, 3
.align 2
crown_fallThunderCount:
	// Old: 1, 2, 3
	// New: 3, 4, 5
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
	.db	3, 4, 5
.align 2
crown_targetMenacingBowgun:
	push	r14
	mov	r0,0x2
	ldsb	r4,[r1,r0]
	add	r0,=crown_isSecondAttack
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1F	// 0 or 1
	add	r0,0x1		// 1 or 2
	cmp	r0,r4
	blt	@@setX
	add	r0,0x1
@@setX:
	mov	r4,r0		// avoid player col
@@end:
	pop	r15
.align 2
crown_targetAssaultLance:
	push	r14
	mov	r0,0x2
	ldsb	r2,[r1,r0]
	add	r0,=crown_isSecondAttack
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end
	push	r2
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	pop	r2
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1F	// 0 or 1
	add	r0,0x1		// 1 or 2
	cmp	r0,r2
	blt	@@setX
	add	r0,0x1
@@setX:
	mov	r2,r0		// avoid player col
@@end:
	pop	r15
.align 2
crown_targetWavyHammer:
	push	r14
	mov	r0,0x2
	ldsb	r0,[r1,r0]
	add	r1,=crown_isSecondAttack
	ldr	r1,[r1]
	cmp	r1,0x0
	beq	@@end
	push	r0
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	pop	r0
	lsl	r1,r1,0x1E
	lsr	r1,r1,0x1F	// 0 or 1
	add	r1,0x1		// 1 or 2
	cmp	r1,r0
	blt	@@setX
	add	r1,0x1
@@setX:
	mov	r0,r1		// avoid player col
@@end:
	pop	r15
.align 2
crown_setupMenacingBowgunSingle:
	push	r14
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	bl	0x21BF630
	pop	r15
.align 2
crown_setupAssaultLanceSingle:
	push	r14
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	bl	0x21BF714
	pop	r15
.align 2
crown_setupWavyHammerSingle:
	push	r14
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	bl	0x21BF860
	pop	r15
.align 2
crown_setupMenacingBowgunDouble:
	push	r14
	mov	r2,0x0
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x1
@@end:
	add	r3,=crown_isSecondAttack
	str	r2,[r3]
	bl	0x21BF630
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	pop	r15
.align 2
crown_setupAssaultLanceDouble:
	push	r14
	mov	r2,0x0
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x1
@@end:
	add	r3,=crown_isSecondAttack
	str	r2,[r3]
	bl	0x21BF714
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	pop	r15
.align 2
crown_setupWavyHammerDouble:
	push	r14
	mov	r2,0x0
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x1
@@end:
	add	r3,=crown_isSecondAttack
	str	r2,[r3]
	bl	0x21BF860
	add	r3,=crown_isSecondAttack
	mov	r2,0x0
	str	r2,[r3]
	pop	r15
.align 2
crown_advanceAnimation:
	push	r7,r14
	mov	r7,r0
	bl	0x217466C	// advance animation

	bl	battle_isLegendMode
	beq	@@end

	// Made attack animation twice as fast
	mov	r1,0x31
	ldrb	r1,[r7,r1]	// animation
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x4
	beq	@@doubleSpeed
	cmp	r1,0x5
	beq	@@doubleSpeed
	cmp	r1,0x6
	bne	@@end

@@doubleSpeed:
	mov	r0,r7
	bl	0x217466C	// advance animation
@@end:
	pop	r7,r15

.align 2
crown_ghostAttackCounterFrames:
	// Old: 5, 5, 5
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r4]
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	4, 4, 4
.align 2
crown_moveLag:
	// Old: 10, 8, 5
	// New: 7, 5, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	sub	r1,0xC
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	7, 5, 3, 2
.align 2
crown_doubleAttackThreshold:
	// Old: 3, 3, 3
	// New: 2, 2, 1
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r0]
	add	r0,r2,0x2
	pop	r15
.align 4
@@data:
	.db	2, 1, 1
.align 2
crown_attackCountFallThunder:
	// Old: 4, 4, 4
	// New: 4/5, 4/5, 4/5
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	push	r0-r3
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	lsr	r0,r0,0x2	// test 0x2
	pop	r0-r3
	bcc	@@end

	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r0]
	add	r1,r2,0x4
	pop	r15
.align 4
@@data:
	.db	5, 5, 5
.align 2
crown_lowHpMoveCount:
	// Old: 25%
	// New: 50%
	push	r14
	add	r0,r1,r0
	bl	battle_isLegendMode
	beq	@@normal
	asr	r1,r0,0x1
	b	@@end
@@normal:
	asr	r1,r0,0x2
@@end:
	pop	r15
//.align 2
//crown_maxMoveCountFallThunder:
//	// Old: 6
//	// New: 6/8
//	push	r14
//	bl	battle_isLegendMode
//	beq	@@end
//
//	push	r0-r3
//	ldr	r0,=0x211F6A8
//	bl	0x20069E0	// random
//	lsr	r0,r0,0x2	// test 0x2
//	pop	r0-r3
//	bcc	@@end
//
//	add	r1,=@@data
//@@end:
//	ldrb	r1,[r1,r0]
//	cmp	r1,r3
//	pop	r15
//.align 4
//@@data:
//	.db	8, 8, 8, 8, 8, 8


	.pool

crown_isSecondAttack:
	.dw	0x0