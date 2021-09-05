// Overlay 604 - Andromeda

.nds
.open TEMP+"/overlay_0604.bin",readu32(TEMP+"/y9.bin", 604 * 0x20 + 0x4)
.thumb


.org 0x21C0C84	// HP
	.dh	2500, 2500, 4000, 6000, 4000, 4000
.org 0x21C0C6A	// Contact damage
	.dh	80, 80, 400, 700, 400, 400
.org 0x21C0CC8	// Action interval (high HP)
	.dh	45, 45, 30, 20, 30, 30

.org 0x21C0CB0	// Meteors attack
	.dw	40, 40, 120, 250, 120, 120
.org 0x21C0DD0	// Giga Missiles attack, HP, pre/post/attack lag, speed
	.dw	80	:: .dh	50	:: .dh	15, 15, 5	:: .dw	(100/3 << 0xC)
	.dw	80	:: .dh	50	:: .dh	15, 15, 5	:: .dw	(100/3 << 0xC)
	.dw	400	:: .dh	150	:: .dh	15,  5, 1	:: .dw	(100/2 << 0xC)
	.dw	600	:: .dh	200	:: .dh	 8,  5, 1	:: .dw	(100/2 << 0xC)
	.dw	400	:: .dh	150	:: .dh	 5,  5, 1	:: .dw	(100/2 << 0xC)
	.dw	400	:: .dh	150	:: .dh	 5,  5, 1	:: .dw	(100/2 << 0xC)
.org 0x21C0D1C	// Big Bang Eater/Crash attack, pre/post lag
	.dw	200	:: .dh	15, 25
	.dw	200	:: .dh	15, 25
	.dw	600	:: .dh	15, 15
	.dw	800	:: .dh	 8,  5
	.dw	600	:: .dh	 5, 15
	.dw	600	:: .dh	 5, 15
.org 0x21C0D88	// Nebula Breaker attack, pre/post lag, length
	.dw	80	:: .dh	15, 15, 25	:: .align 4
	.dw	80	:: .dh	15, 15, 25	:: .align 4
	.dw	400	:: .dh	 5,  5, 25	:: .align 4
	.dw	600	:: .dh	 5,  5, 25	:: .align 4
	.dw	400	:: .dh	 5,  5, 25	:: .align 4
	.dw	400	:: .dh	 5,  5, 25	:: .align 4


.org 0x21BEC72
	bl	@dxTexture
.org 0x21BED2E
	bl	@dxHP
.org 0x21BECEE
	bl	@dxContactDamage
.org 0x21BF344
	bl	@dxMeteors
.org 0x21BF6CC
	bl	@dxGigaMissiles
.org 0x21BFC20
	bl	@dxBigBangEaterCrash
.org 0x21BFFF4
	bl	@dxNebulaBreaker


.org 0x21C116C+0x34
	.dw	andromeda_dxUpdate|1
.org 0x21C116C+0x54
	.dw	andromeda_dxSpawnStart|1
.org 0x21C116C+0x58
	.dw	andromeda_dxSpawnUpdate|1
.org 0x21C116C+0x5C
	.dw	andromeda_dxSpawnEnd|1


.org 0x21BF15C
	bl	@actionIntervalHighHP
.org 0x21BF194
	bl	@actionIntervalLowHP
.org 0x21C0C46
	bl	andromeda_meteorsElemental
//.org 0x21C0C4A
//	bl	@meteorsFireElemental
.org 0x21BF6E6
	bl	@gigaMissilesPreLag
.org 0x21BF6F4
	bl	@gigaMissilesPostLag
.org 0x21BF784
	bl	@gigaMissilesAttackLag
.org 0x21BF7A6
	bl	@gigaMissilesAttackSpeed
.org 0x21BFC3C
	bl	@bigBangEaterCrashPreLag
.org 0x21BFC4E
	bl	@bigBangEaterCrashPostLag
.org 0x21BFFB8
	bl	@bigBangEaterCrashInvisPierce
.org 0x21BFFCA
	bl	@bigBangEaterCrashGravity
.org 0x21C0006
	bl	@nebulaBreakerPreLag
.org 0x21C001A
	bl	@nebulaBreakerPostLag
.org 0x21C0032
	bl	@nebulaBreakerLength

.org 0x21C0556
	bl	@onBattleEnd


.orga readu32(TEMP+"/y9.bin", 604 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxTexture:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r2,=((1 << 0x10) | (511))
@@end:
	bl	0x2010EB8
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
@dxMeteors:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x4
@@end:
	ldr	r2,[r2,r3]
	mov	r0,r4
	pop	r15
.align 2
@dxGigaMissiles:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r1,0x10
@@end:
	ldr	r0,[r0,r1]
	mov	r1,r2
	pop	r15
.align 2
@dxBigBangEaterCrash:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r1,0x8
@@end:
	ldr	r1,[r0,r1]
	mov	r0,0x4E
	pop	r15
.align 2
@dxNebulaBreaker:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0xC
@@end:
	ldr	r3,[r2,r3]
	mov	r2,0x4E
	pop	r15

	.pool


.align 2
@onBattleEnd:
	push	r14

	// Check fighting DX boss
	ldr	r1,=0xF199
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@markDeletedCountered

	bl	battle_isDXBoss
	beq	@@markDeletedCountered

	ldr	r1,=0xF185	// beat Andromeda DX flag
	bl	0x2024018	// set flag

@@markDeletedCountered:
	bl	battle_markEnemiesDeletedCountered

	mov	r0,0x6
	sub	r1,r0,0x7
	pop	r15


.align 2
@bigBangEaterCrashInvisPierce:
	// New: pierce and remove invis
	push	r7,r14
	str	r0,[sp,(2*0x4)+0x4+0x1C]
	bl	battle_isLegendMode
	beq	@@end

	mov	r7,0x8			// pierce invis
	str	r7,[sp,(2*0x4)+0x4+0x14]
//	mov	r7,0x1			// flinch, no invis
	mov	r7,0x3			// flinch, invis
	str	r7,[sp,(2*0x4)+0x4+0x1C]
@@end:
	mov	r0,r4
	pop	r7,r15


.align 2
@bigBangEaterCrashGravity:
	bl	battle_isLegendMode
	beq	@@end
	cmp	r4,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r1,[r4,r1]
	cmp	r1,0x0
	beq	@@end
	mov	r0,0x3		// Lv. 2 Gravity = 60i
	strb	r0,[r1,0x1F]
@@end:
	add	sp,0x24
	pop	r4-r5,r15
.align 2
@meteorsFireElemental:
	bl	battle_isLegendMode
	beq	@@end
	cmp	r5,0x0
	beq	@@end
	mov	r1,0xAC
	ldr	r1,[r5,r1]
	cmp	r1,0x0
	beq	@@end
	mov	r0,0x1		// Fire Elemental
	strb	r0,[r1,0x9]
@@end:
	add	sp,0x1C
	pop	r4-r5,r15
.align 2
@nebulaBreakerLength:
	// Old: 25
	// New: 25
	push	r14
	ldr	r1,[r1,r5]
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(25)
@@end:
	str	r1,[r4,r2]
	pop	r15
.align 2
@nebulaBreakerPreLag:
	// Old: 15, 5
	// New: 10, 3
	// r5 = version
	push	r1,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r5,0x1
@@checkLegend:
	mul	r1,r5
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
	lsl	r1,r5,0x1
@@end:
	ldrh	r5,[r3,r1]
	pop	r1,r15
.align 4
@@data:
	.dh	10, 10, 4, 4, 3, 3
.align 2
@nebulaBreakerPostLag:
	// Old: 15, 5
	// New: 10, 3
	// r5 = version
	push	r1,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r5,0x1
@@checkLegend:
	mul	r1,r5
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
	lsl	r1,r5,0x1
@@end:
	ldrh	r5,[r3,r1]
	pop	r1,r15
.align 4
@@data:
	.dh	10, 10, 3, 1, 3, 3
.align 2
@bigBangEaterCrashPreLag:
	// Old: 15, 5
	// New: 10, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x8
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
	lsr	r3,r3,0x3
@@end:
	ldrh	r3,[r2,r3]
	mov	r2,r0
	pop	r15
.align 4
@@data:
	.dh	10, 10, 3, 1, 3, 3
.align 2
@bigBangEaterCrashPostLag:
	// Old: 25, 15
	// New: 15, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x8
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@@data
	lsr	r3,r3,0x3
@@end:
	ldrh	r2,[r2,r3]
	str	r2,[r4,r1]
	pop	r15
.align 4
@@data:
	.dh	15, 15, 10, 5, 10, 10
.align 2
@gigaMissilesPreLag:
	// Old: 15, 15
	// New: 12, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x10
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
	lsr	r3,r3,0x3
@@end:
	ldrh	r1,[r1,r3]
	str	r1,[r4,r2]
	pop	r15
.align 4
@@data:
	.dh	12, 12, 10, 8, 10, 10
.align 2
@gigaMissilesPostLag:
	// Old: 15, 5
	// New: 10, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x10
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
	lsr	r2,r2,0x3
@@end:
	ldrh	r1,[r1,r2]
	str	r1,[r4,r0]
	pop	r15
.align 4
@@data:
	.dh	10, 10, 3, 1, 3, 3
.align 2
@gigaMissilesAttackLag:
	// Old: 5, 1
	// New: 3, 1
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
	ldrh	r0,[r0,r1]
	mov	r1,(0x158 >> 0x2)
	pop	r15
.align 4
@@data:
	.dh	3, 3, 1, 1, 1, 1
.align 2
@gigaMissilesAttackSpeed:
	// Old: 33.333, 50
	// New: 37, 55
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x10
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
	lsr	r2,r2,0x2
@@end:
	ldr	r2,[r0,r2]
	mov	r0,r1
	pop	r15
.align 4
@@data:
	.dw	(37 << 0xC), (37 << 0xC), (55 << 0xC), (60 << 0xC), (55 << 0xC), (5 << 0xC)


.align 2
@actionIntervalHighHP:
	// Old: 45, 30
	// New: 25, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrh	r0,[r0,r1]
	mov	r1,0x53
	pop	r15
.align 4
@@data:
	.dh	22, 22, 12, 12, 12, 12


.align 2
@actionIntervalLowHP:
	// Old: 60
	// New: 30, 15
	mov	r1,(60)
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r1,(40)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x34
	ldrb	r0,[r4,r0]	// level
	bl	battle_isDXBoss
	beq	@@get
	add	r0,0x1
@@get:
	add	r1,=@@data
	ldrb	r1,[r1,r0]
@@end:
	bl	0x21BF1A4
.align 4
@@data:
	.db	47, 47, 37, 27, 37, 37


	.pool

.aligna 32
.endarea
.close
