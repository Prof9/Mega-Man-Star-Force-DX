// Overlay 605 - Gemini Spark

.nds
.open TEMP+"/overlay_0605.bin",readu32(TEMP+"/y9.bin", 605 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21C017C	// Elec Sword damage
	// Old: 60, 100, 160
	.db	60, 80, 160, 60, 80, 160
.org 0x21C0184	// Gemini Thunder damage
	// Old: 90, 150, 220
	.db	90, 120, 220, 90, 120, 220
.org 0x21C01CC	// Rocket Knuckle damage
	// Old: 60, 100, 160
	.db	60, 80, 160, 60, 80, 160
.org 0x21C01D4	// Contact damage
	// Old: 60, 100, 160
	.dh	60, 80, 160, 60, 80, 160
.org 0x21C01EC	// HP
	// Old: 1500, 1800, 2200
	.dh	1500, 1700, 2200, 0x3FFF, 0x3FFF, 0x3FFF

.org 0x21C01A4	// Move lag
	.db	15, 10, 5, 15, 10, 5, 4
.org 0x21C01AC	// Elec Sword pre lag
	.db	15, 10, 5, 15, 10, 5, 5
.org 0x21C01B4	// Elec Sword post lag
	.db	15, 10, 5, 15, 10, 5, 5
.org 0x21C0194	// Rocket Knuckle pre lag
	.db	15, 10, 5, 15, 10, 5, 5
.org 0x21C018C	// Rocket Knuckle post lag
	.db	15, 10, 5, 15, 10, 5, 5
.org 0x21C016C	// Gemini Thunder pre lag
	.db	15, 10, 5, 15, 10, 5, 5
.org 0x21C0174	// Gemini Thunder post lag
	.db	15, 10, 5, 15, 10, 5, 5


.org 0x21BEC96
	bl	@dxModelB
.org 0x21BECB6
	bl	@dxModelW
.org 0x21BED0A
	bl	@dxHP
.org 0x21BEC7E
	bl	@dxContactDamage
.org 0x21BF27A
	bl	@dxElecSword
.org 0x21BF66A
	bl	@dxRocketKnuckle
.org 0x21BFAE0
	bl	@dxGeminiThunder


.org 0x21BEC68
	bl	@undershirt

.org 0x21BEF00
	bl	@aiComboAttackRng
.org 0x21BEFB8
	bl	@aiMovementRng

.org 0x21BF1D8
	bl	@moveLag
.org 0x21BF228
	bl	@moveConfuseBlindLag

.org 0x21BF28A
	bl	@elecSwordPreLag
.org 0x21BF29A
	bl	@elecSwordPostLag
.org 0x21BF2BC
	bl	@elecSwordConfuseBlindLag
.org 0x21BF3E8
	bl	@elecSwordCounterFrames
.org 0x21BF67A
	bl	@rocketKnucklePreLag
.org 0x21BF68A
	bl	@rocketKnucklePostLag
.org 0x21BF6AC
	bl	@rocketKnuckleConfuseBlindLag
.org 0x21BF928
	bl	@rocketKnuckleCounterFrames
.org 0x21BFAD8
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BFB46
	pop	r15
.org 0x21BFAF0
	bl	@geminiThunderPreLag
.org 0x21BFB0E
	bl	@geminiThunderPreLag2
.org 0x21BFB14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
	ldr	r1,[0x21BFB50]
	bl	@geminiThunderPostLag
.org 0x21BFB38
	mov	r1,0x34
	ldrb	r2,[r0,r1]
	ldr	r1,[0x21BFB58]
	bl	@geminiThunderIdleWait
.org 0x21BFB32
	bl	@geminiThunderConfuseBlindLag
//.org 0x21BFEE8
//	bl	@geminiThunderParalyzeCenter

.org 0x21BF3CE
	bl	@elecSwordWideRangeHighlight
.org 0x21BF4A2
	bl	@elecSwordWideRangeVfx
.org 0x21BF4C8
	bl	@elecSwordWideRangeHitscan

.org 0x21BF9C0
	mov	r3,0x34
.org 0x21BF9C4
	ldrb	r3,[r4,r3]
.org 0x21BF9CA
	ldrb	r1,[r1,r3]
.org 0x21BF9CE
	bl	@rocketKnuckleSpeed


.org 0x21BEC56
	bl	@whiteElement
.org 0x21BED40
.area 0xA,0x00
	b	0x21BED4A
.endarea


.orga readu32(TEMP+"/y9.bin", 605 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@whiteElement:
	push	r14
	ldrh	r0,[r5,0x36]
	ldr	r1,=0x122
	cmp	r0,r1
	bcs	@@white
@@black:
	mov	r0,0x3		// Elec
	b	@@end
@@white:
	mov	r0,0x0		// None
//	b	@@end
@@end:
	str	r0,[sp,(0x4+0x4)]
	pop	r15


.align 2
@dxModelB:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (499))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxModelW:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (500))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxHP:
	push	r14
	ldsh	r1,[r0,r1]
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r0,=0x3FFF
	cmp	r1,r0
	beq	@@end
	ldr	r1,=(4500)
@@end:
	mov	r0,r5
	pop	r15
.align 2
@dxContactDamage:
	push	r14
	ldsh	r1,[r0,r1]
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=(500)
@@end:
	mov	r0,r5
	pop	r15
.align 2
@dxElecSword:
	push	r14
	ldrb	r3,[r2,r3]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r3,=(500)
@@end:
	mov	r2,0x4E
	pop	r15
.align 2
@dxRocketKnuckle:
	push	r14
	ldrb	r3,[r2,r3]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r3,=(500)
@@end:
	mov	r2,0x4E
	pop	r15
.align 2
@dxGeminiThunder:
	push	r14
	ldrb	r1,[r1,r2]
	bl	battle_isDXBoss
	beq	@@end
	ldr	r1,=(700)
@@end:
	mov	r2,0x4E
	pop	r15


.align 2
@rocketKnuckleCounterFrames:
	// Old: 5
	// New: 5
	push	r14
	strh	r1,[r4,0x28]
	mov	r1,(5)
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(5)
@@end:
	pop	r15
.align 2
@elecSwordCounterFrames:
	// Old: 5
	// New: 5
	push	r14
	strh	r1,[r4,0x28]
	mov	r1,(5)
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(5)
@@end:
	pop	r15

.align 2
@rocketKnuckleSpeed:
	// Old: 20, 25, 33.333...
	// New: 22.5, 27.5, 35
	bl	0x2181F8C	// init Rocket Knuckle
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x34
	ldrb	r0,[r4,r0]	// version
	lsl	r0,r0,0x2
	add	r1,=@@data
	ldr	r0,[r1,r0]	// speed
	mov	r1,0x8C
	str	r0,[r5,r1]	// Rocket Knuckle speed
@@end:
	bl	0x21BF9D2
.align 4
@@data:
	.dw	int(22.5 * 0x1000), int(27.5 * 0x1000), int(35 * 0x1000)
	.dw	int(22.5 * 0x1000), int(27.5 * 0x1000), int(35 * 0x1000)
.align 2
@aiComboAttackRng:
	push	r14
	lsr	r0,r0,0x1
	mov	r1,0xF
	bl	battle_isDXBoss
	bne	@@fix
	bl	battle_isLegendMode
	beq	@@end
@@fix:
	mov	r1,0x10		// fix RNG
@@end:
	pop	r15
.align 2
@aiMovementRng:
	push	r14
	lsr	r0,r0,0x1
	mov	r1,0x1
	bl	battle_isDXBoss
	bne	@@fix
	bl	battle_isLegendMode
	beq	@@end
@@fix:
	mov	r1,0x2		// fix RNG
@@end:
	pop	r15
.align 2
@geminiThunderPreLag:
	// Old: 15+30, 10+30, 5+30
	// New: 10, 8, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r3,0x6
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
	.db	10, 8, 3, 10, 8, 3, 3
.align 2
@geminiThunderPreLag2:
	// Old: 30, 30, 30
	// New: 1, 1, 1
	push	r14
	mov	r2,(30)
	bl	battle_isDXBoss
	bne	@@fast
	bl	battle_isLegendMode
	beq	@@end
@@fast:
	mov	r2,(1)
@@end:
	lsl	r1,r1,0x2
	pop	r15
.align 2
@geminiThunderPostLag:
	// Old: 15, 10, 5
	// New: 7, 6, 4
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r2,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	7, 6, 4, 7, 6, 4, 3
.align 2
@geminiThunderIdleWait:
	// Old: 60, 60, 60
	// New: 30, 30, 30
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r2,[r1,r2]
	pop	r15
.align 4
@@data:
	.db	30, 30, 30, 30, 30, 30
.align 2
@geminiThunderConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	ldrb	r3,[r0,r1]
	bl	battle_isLegendMode
	beq	@@normal
	add	r3,(15)
	b	@@end
@@normal:
	add	r3,(30)
@@end:
	pop	r15
.align 2
@geminiThunderParalyzeCenter:
	bl	0x218C780
	bl	battle_isLegendMode
	beq	@@end
	// r0 = object+0xB8
	mov	r0,0xB8
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r0,[r0,r1]
	cmp	r0,0x0
	beq	@@end
	mov	r1,0x3
	strb	r1,[r0,0x1A]	// paralyze level
@@end:
	bl	0x21BFEEC
.align 2
@rocketKnucklePreLag:
	// Old: 15, 10, 5
	// New: 11, 8, 5
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r4,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r2
	pop	r15
.align 4
@@data:
	.db	11, 8, 4, 11, 8, 4, 4
.align 2
@rocketKnucklePostLag:
	// Old: 15, 10, 5
	// New: 7, 5, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r4,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r2
	pop	r15
.align 4
@@data:
	.db	7, 6, 4, 7, 6, 4, 3
.align 2
@rocketKnuckleConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x14
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15
.align 2
@elecSwordPreLag:
	// Old: 15, 10, 5
	// New: 11, 8, 5
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r4,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r2
	pop	r15
.align 4
@@data:
	.db	11, 8, 5, 11, 8, 5, 5
.align 2
@elecSwordPostLag:
	// Old: 15, 10, 5
	// New: 7, 5, 4
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r4,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r2
	pop	r15
.align 4
@@data:
	.db	7, 5, 4, 7, 5, 4, 3
.align 2
@elecSwordConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x14
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15
.align 2
@elecSwordWideRangeVfx:
	bl	0x2154DF8	// init VFX
	bl	battle_isLegendMode
	beq	@@end
	// Increase width by 50%
	mov	r0,0x90
	ldr	r1,[r5,r0]	// 3D scaling X
	asr	r2,r1,0x1
	add	r1,r1,r2
	str	r1,[r5,r0]	// 3D scaling X
@@end:
	bl	0x21BF4A6
.align 2
@elecSwordWideRangeHighlight:
	push	r14
	mov	r2,0x1		// normal (1x1)
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x9		// wide (3x1)
@@end:
	add	r1,r1,r5
	pop	r15
.align 2
@elecSwordWideRangeHitscan:
	push	r14
	mov	r0,0x1		// normal (1x1)
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x9		// wide (3x1)
@@end:
	str	r0,[sp,(0x14+0x4)]
	pop	r15
.align 2
@moveLag:
	// Old: 15, 10, 5
	// New: 9, 7, 4
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r2,0x6
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.db	9, 7, 4, 9, 7, 4, 2
.align 2
@moveConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r1,0xA
	bl	battle_isLegendMode
	beq	@@normal
	add	r0,(15)
	b	@@end
@@normal:
	add	r0,(30)
@@end:
	pop	r15

.align 2
@undershirt:
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Add Undershirt
	ldr	r1,[r0,0x2C]
	mov	r2,(0x2000 >> 0xC)
	lsl	r2,r2,0xC
	orr	r1,r2
	str	r1,[r0,0x2C]
@@end:
	mov	r1,r5
	add	r1,0xAC
	pop	r15


	.pool

.aligna 32
.endarea
.close
