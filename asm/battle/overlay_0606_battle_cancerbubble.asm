// Overlay 606 - Cancer Bubble

.nds
.open TEMP+"/overlay_0606.bin",readu32(TEMP+"/y9.bin", 606 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21C0012	// Bubble Pop damage
	// Old: 30, 50, 120
	.dh	30, 70, 130, 500, 130, 130
.org 0x21C002C	// Contact damage
	// Old: 30, 50, 120
	.dh	30, 70, 130, 500, 130, 130
.org 0x21C0044	// HP
	// Old: 700, 1300, 1800
	.dh	700, 1700, 2000, 4500, 2000, 2000
.org 0x21C0050	// Boomerang Cutter damage
	// Old: 30, 50, 120
	.dh	30, 70, 130, 500, 130, 130
.org 0x21C005C	// Tidal Wave damage
	// Old: 50, 80, 150
	.dh	50, 100, 170, 600, 170, 170

.org 0x21BFFCC	// Move lag (long)
	.db	30, 20, 15, 7, 5, 5
.org 0x21BFFDC	// Move lag (short)
	.db	5, 5, 5, 5, 5, 5
.org 0x21BFFAC	// Bubble Pop pre lag
	.db	20, 15, 10, 5, 10, 10
.org 0x21C00F8	// Bubble Pop post lag
	.db	30, 20, 10, 5, 10, 10
.org 0x21C0038	// Bubble Pop HP
	.dh	1, 1, 1, 1, 1, 1
.org 0x21C0080	// Bubble Pop speed
	.dw	int(12.5 * 0x1000), int(14.25 * 0x1000), int(20 * 0x1000)
	.dw	int(22.5 * 0x1000), int(20 * 0x1000), int(20 * 0x1000)
.org 0x21BFFC4	// Boomerang Cutter pre lag
	.db	10, 5, 1, 1, 1, 1
.org 0x21BFFA4	// Boomerang Cutter post lag
	.db	35, 25, 15, 5, 25, 15
.org 0x21C00D8	// Boomerang Cutter appear delay
	.db	10, 5, 2, 2, 5, 1
.org 0x21C0098	// Boomerang Cutter speed
	.dw	int(100.0/3 * 0x1000), int(100.0/3 * 0x1000), int(100.0/3 * 0x1000)
	.dw	int(125.0/3 * 0x1000 + 1), int(100.0/3 * 0x1000), int(100.0/3 * 0x1000)
.org 0x21C00B8	// Tidal Wave pre lag
	.db	8, 5, 1, 1, 5, 1
.org 0x21C00B0	// Tidal Wave post lag
	.db	40, 30, 20, 5, 30, 20
.org 0x21BFFD4	// Boomerang Cutter length
	.db	35, 30, 25, 15, 30, 25
.org 0x21C00E0	// Boomerang Cutter first
	.db	15, 13, 10, 5, 15, 10
.org 0x21BFFD4	// Boomerang Cutter second
	.db	35, 30, 25, 20, 30, 25


.org 0x21BEC96
	bl	@dxModel
.org 0x21BFC50
	bl	@dxModelClaw
.org 0x21BEC28
	bl	@dxHP
.org 0x21BEC76
	bl	@dxContactDamage
.org 0x21BF3FC
	bl	@dxBubblePop
.org 0x21BF94C
	bl	@dxBoomerangCutter
.org 0x21BF680
	bl	@dxTidalWave


.org 0x21BF098
	ldr	r0,[0x21BF110]
	mov	r1,0x34
	bl	@moveLagLong
.org 0x21BF0A2
	ldr	r0,[0x21BF114]
	mov	r1,0x34
	bl	@moveLagShort
.org 0x21BEF4E
	bl	@bubblePopPreLag
.org 0x21BEF3E
	bl	@bubblePopPostLag
.org 0x21BEF80
	bl	@bubblePopConfuseBlindLag
.org 0x21BF390
	mov	r2,0x34
	ldr	r1,[0x21BF55C]
	bl	@bubblePopCounterFrames
.org 0x21BF412
	bl	@bubblePopHP
.org 0x21BF406
	bl	@bubblePopSpeed
.org 0x21BF168
	bl	@boomerangCutterPreLag
.org 0x21BEFB2
	bl	@boomerangCutterPostLag
.org 0x21BEFD4
	bl	@boomerangCutterConfuseBlindLag
.org 0x21BF1A6
	bl	@boomerangCutterCounterFrames
.org 0x21BF1CE
	bl	@boomerangCutterAppearDelay1
.org 0x21BF1DE
	bl	@boomerangCutterSpeed1
.org 0x21BF960
	bl	@boomerangCutterSpeed2
.org 0x21BF5DA
	bl	@tidalWavePreLag
.org 0x21BF000
	bl	@tidalWavePostLag
.org 0x21BF022
	bl	@tidalWaveConfuseBlindLag
.org 0x21BF632
	mov	r2,0x34
	ldr	r1,[0x21BF6FC]
	bl	@tidalWaveCounterFrames

.org 0x21BF1E8
	bl	@boomerangCutterLength
.org 0x21BF20E
	nop
	bl	@boomerangCutterLagFirst
.org 0x21BF220
	mov	r1,0x0
	nop
	bl	@boomerangCutterLagFirst
.org 0x21BF244
	nop
	bl	@boomerangCutterLagSecond
.org 0x21BF254
	nop
	bl	@boomerangCutterLagSecond
.org 0x21BF282
	nop
	bl	@boomerangCutterLagSecond
.org 0x21BF292
	nop
	bl	@boomerangCutterLagSecond

.org 0x21BF746
	mov	r1,0x34
	ldr	r0,[0x21BF768]
	bl	@bubblePopCountLowHP
.org 0x21BF060
	bl	@aiSetupTidalWave
.org 0x21BF05A
	bl	@aiTimeUntilTidalWave
.org 0x21BEF0C
	bl	@aiInitialAttack
.org 0x21BEFE4
	bl	@aiMovesAfterBoomerangCutter
.org 0x21BF032
	bl	@aiMovesAfterTidalWave

.org 0x21BFD8C
	bl	@boomerangCutterCombo


// Flip claws
.org 0x21BEDA8
	lsr	r0,r0,0x2	// test 0x2
	bcc	0x21BEDD4
.org 0x21BEDFE
	lsr	r0,r0,0x1	// test 0x1
	bcc	0x21BEE2A
	

.orga readu32(TEMP+"/y9.bin", 606 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (501))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxModelClaw:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	ldr	r1,=((1 << 0x10) | (502))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxHP:
@dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r4,0x2
@@end:
	ldsh	r1,[r0,r4]
	mov	r0,r5
	pop	r15
.align 2
@dxBubblePop:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x2
@@end:
	ldsh	r0,[r0,r3]
	lsl	r1,r1,0x2
	pop	r15
.align 2
@dxBoomerangCutter:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r1,0x2
@@end:
	ldsh	r0,[r0,r1]
	str	r0,[sp,(0xC+0x4)]
	pop	r15
.align 2
@dxTidalWave:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x2
@@end:
	ldsh	r2,[r2,r3]
	mov	r0,r5
	pop	r15

	.pool


.align 2
@bubblePopHP:
	// Old: 1, 1, 1
	// New: 1, 3, 5
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r5,=@@data
@@end:
	ldsh	r3,[r5,r3]
	add	r1,0x68
	pop	r15
.align 4
@@data:
	.dh	1, 3, 5, 1, 3, 5, 7
.align 2
@bubblePopSpeed:
	// Old: 12.5, 14.25, 20
	// New: 17.5, 18.5, 21
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldr	r0,[r0,r1]
	mov	r1,r4
	pop	r15
.align 4
@@data:
	.dw	int(17.5 * 0x1000), int(18.5 * 0x1000), int(21 * 0x1000)
	.dw	int(22.5 * 0x1000), int(21 * 0x1000), int(21 * 0x1000)

.align 2
@boomerangCutterCombo:
	push	r0,r14

	// Can skip timer if >10 left
	ldr	r1,[r4,r0]
	cmp	r1,0xA
	ble	@@end

	bl	battle_isLegendMode
	beq	@@end

	// Check alignment
	mov	r2,0x30
	ldrb	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@end

	// Get player object
	push	r1
	mov	r0,r4
	mov	r1,0x0
	bl	0x21753B4
	pop	r1
	cmp	r0,0x0
	beq	@@end

	// Check player frozen
	mov	r2,0xAC
	ldr	r2,[r0,r2]	// collision
	cmp	r2,0x0
	beq	@@end
	ldr	r2,[r2,0x2C]	// status effects
	lsr	r2,r2,0x6	// test 0x20
	bcc	@@end

	// Check player in range
	mov	r3,0x68
	ldrb	r2,[r4,r3]	// own x
	ldrb	r3,[r0,r3]	// player x
	cmp	r2,r3		// same column
	beq	@@skipTimer
	cmp	r3,0x2		// middle
	bne	@@end

@@skipTimer:
	mov	r1,0x0

@@end:
	cmp	r1,0x0
	pop	r0,r15

.align 2
@aiInitialAttack:
	// Old: Boomerang Cutter
	// New: Boomerang Cutter or Tidal Wave
	push	r2,r14
	add	r0,0x12
	bl	battle_isLegendMode
	beq	@@end
	push	r0-r1
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsl	r2,r0,0x1E
	lsr	r2,r2,0x1F	// 0 or 1
	pop	r0-r1
@@end:
	strh	r2,[r4,r0]
	pop	r2,r15

.align 2
@aiMovesAfterBoomerangCutter:
	// Old: 6
	// New: 3/6
	push	r14
	mov	r2,(6)
	bl	battle_isLegendMode
	beq	@@end
	push	r0
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsr	r0,r0,0x1
	mov	r1,(2)
	blx	0x208985C	// mod s32
	add	r0,0x1
	mov	r2,0x3
	mul	r2,r0
	pop	r0
@@end:
	ldrh	r1,[r4,r0]
	pop	r15

.align 2
@aiMovesAfterTidalWave:
	// Old: 9
	// New: 3/6/9
	push	r14
	mov	r1,(9)
	bl	battle_isLegendMode
	beq	@@end
	push	r0
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsr	r0,r0,0x1
	mov	r1,(3)
	blx	0x208985C	// mod s32
	add	r0,0x1
	mov	r1,0x3
	mul	r1,r0
	pop	r0
@@end:
	strh	r1,[r4,r0]
	pop	r15
.align 2
@aiTimeUntilTidalWave:
	// Old: 2/3, 2/3, 2/3
	// New: 1/2, 1/2, 1/2
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	add	r1,r1,r0
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1, 1, 1

.align 2
@bubblePopCountLowHP:
	// New: only use Bubble Pop 2 times <25% HP
	push	r14
	ldrb	r1,[r4,r1]
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	2, 2, 2, 2, 2, 2

.align 2
@aiSetupTidalWave:
	// New: 50% chance to combo into Boomerang Cutter
	push	r14
	lsl	r0,r0,0x2
	strh	r1,[r4,r0]
	bl	battle_isLegendMode
	beq	@@end

	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsr	r0,r0,0x2	// test 0x2
	bcc	@@end

	// Set Bubble Pop count
	mov	r1,(0x194 >> 0x1)
	lsl	r1,r1,0x1
	mov	r0,0x7F
	strb	r0,[r4,r1]
@@end:
	pop	r15

.align 2
@boomerangCutterLength:
	// Old: 35, 30, 25
	// New: 7, 6, 5
	push	r14
	lsl	r0,r0,0x3
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r5,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r5]
	pop	r15
.align 4
@@data:
	.db	7, 6, 5, 4, 6, 5
.align 2
@boomerangCutterLagFirst:
	// Old: 15, 13, 10
	// New: 12, 10, 8
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
@@end:
	ldrb	r2,[r2,r3]
	bl	0x21BF910
	pop	r15
.align 4
@@data:
	.db	12, 10, 8, 6, 10, 8
.align 2
@boomerangCutterLagSecond:
	// Old: 35, 30, 25
	// New: 45 + random(90)
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	ldrb	r2,[r2,r3]
	bl	battle_isLegendMode
	beq	@@end

	// Compute random duration
	push	r0-r1
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// RNG
	lsr	r0,r0,0x1
	mov	r1,(90)
	blx	0x208985C	// mod s32
	add	r0,(45)
	mov	r2,r0
	pop	r0-r1
@@end:
	bl	0x21BF910
	pop	r15

.align 2
@boomerangCutterAppearDelay1:
	// Old: 10, 5, 2
	// New: 5, 3, 2
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
	.db	5, 3, 2, 2, 3, 2
//.align 2
//@boomerangCutterAppearDelay2:
//	// Old: 10, 5, 2
//	// New: 1, 1, 0
//	push	r14
//	bl	battle_isLegendMode
//	beq	@@end
//	add	r1,=@@data
//@@end:
//	ldrb	r1,[r1,r5]
//	add	r1,r2,r1
//	pop	r15
//.align 4
//@@data:
//	.db	1, 1, 0, 1, 1, 0
.align 2
@boomerangCutterSpeed1:
	// Old: 33.333, 33.333, 33.333
	// New: 40, 42.5, 45
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r1,[r1,r2]
	lsl	r0,r0,0xE
	pop	r15
.align 4
@@data:
	.dw	int(100.0/3 * 0x1000), int(125.0/3 * 0x1000 + 1), int(125.0/3 * 0x1000 + 1)
	.dw	int(135.0/3 * 0x1000), int(125.0/3 * 0x1000 + 1), int(125.0/3 * 0x1000 + 1)
.align 2
@boomerangCutterSpeed2:
	// Old: 33.333, 33.333, 33.333
	// New: 50, 50, 50
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldr	r0,[r0,r1]
	str	r0,[sp,(0x14+0x4)]
	pop	r15
.align 4
@@data:
	.dw	int(100.0/3 * 0x1000), int(125.0/3 * 0x1000 + 1), int(125.0/3 * 0x1000 + 1)
	.dw	int(135.0/3 * 0x1000), int(125.0/3 * 0x1000 + 1), int(125.0/3 * 0x1000 + 1)

.align 2
@moveLagLong:
	// Old: 30, 20, 15
	// New: 8, 6, 5
	push	r14
	ldrb	r1,[r4,r1]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	8, 6, 5, 4, 5, 5
.align 2
@moveLagShort:
	// Old: 5, 5, 5
	// New: 3, 3, 2
	push	r14
	ldrb	r1,[r4,r1]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	3, 3, 2, 2, 2, 2
.align 2
@tidalWavePreLag:
	// Old: 8, 5, 1
	// New: 4, 2, 1
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
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 1, 2, 1
.align 2
@tidalWavePostLag:
	// Old: 40, 30, 20
	// New: 11, 8, 5
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
	mov	r0,0x5
	pop	r15
.align 4
@@data:
	.db	11, 8, 5, 2, 8, 5
.align 2
@tidalWaveConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r3,(15)
@@end:
	add	r0,r3,r0
	str	r0,[r4,r1]
	pop	r15
.align 2
@tidalWaveCounterFrames:
	// Old: 5, 5, 5
	// New: 5, 5, 5
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	5, 5, 5, 5, 5, 5
.align 2
@boomerangCutterPreLag:
	// Old: 10, 5, 1
	// New: 1, 1, 1
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
	mov	r0,0x53
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1, 1, 1
.align 2
@boomerangCutterPostLag:
	// Old: 35, 25, 15
	// New: 3, 2, 1
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
	mov	r0,0x5
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 1, 2, 1
.align 2
@boomerangCutterConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r3,(15)
@@end:
	add	r0,r3,r0
	str	r0,[r4,r1]
	pop	r15
.align 2
@boomerangCutterCounterFrames:
	// Old: 5, 5, 5
	// New: 5, 5, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(5)
@@end:
	bl	0x21749AC
	pop	r15
.align 2
@bubblePopConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r3,(15)
@@end:
	add	r0,r3,r0
	str	r0,[r4,r1]
	pop	r15
.align 2
@bubblePopPreLag:
	// Old: 20, 15, 10
	// New: 5, 4, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	add	r1,r0,0x4
	pop	r15
.align 4
@@data:
	.db	5, 4, 3, 2, 4, 3
.align 2
@bubblePopPostLag:
	// Old: 30, 20, 10
	// New: 5, 4, 3
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
	mov	r0,0x5
	pop	r15
.align 4
@@data:
	.db	5, 4, 3, 2, 3, 3
.align 2
@bubblePopCounterFrames:
	// Old: 3, 3, 3
	// New: 3, 3, 3
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	3, 3, 3, 3, 3, 3


	.pool

.aligna 32
.endarea
.close
