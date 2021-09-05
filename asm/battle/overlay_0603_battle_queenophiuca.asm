// Overlay 603 - Queen Ophiuca

.nds
.open TEMP+"/overlay_0603.bin",readu32(TEMP+"/y9.bin", 603 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21C0878	// Quick Serpent damage
	// Old: 50, 80, 150
	.db	50, 80, 150, 500, 150, 150
.org 0x21C0898	// Snake Legion damage
	// Old: 50, 80, 150
	.db	50, 80, 150, 500, 150, 150
.org 0x21C08A0	// Gorgon Eye damage
	// Old: 50, 80, 150
	.db	50, 80, 150, 500, 150, 150
.org 0x21C08B4	// HP
	// Old: 1200, 1600, 2100
	.dh	1200, 1600, 2100, 5000, 2100, 2100
.org 0x21C08C0	// Contact damage
	// Old: 50, 80, 150
	.dh	50, 80, 150, 500, 150, 150

.org 0x21C0880	// Move lag
	.db	20, 15, 5, 3, 5, 5
.org 0x21C0850	// Snake Legion post lag
	.db	15, 10, 5, 3, 5, 3
.org 0x21C0860	// Gorgon Eye pre lag
	.db	5, 3, 1, 1, 5, 5
.org 0x21C0868	// Gorgon Eye post lag
	.db	20, 18, 15, 10, 5
.org 0x21C0848	// Quick Serpent pre lag
	.db	5, 3, 1, 1, 10, 10
.org 0x21C0858	// Quick Serpent post lag
	.db	10, 10, 10, 5, 10, 10
.org 0x21C0A3C	// Snake Legion HP
	.db	20, 50, 100, 200


.org 0x21BEC9E
	bl	@dxModel
.org 0x21BEC7E
	bl	@dxContactDamage
.org 0x21BED72
	bl	@dxHP
.org 0x21BFEC8
	bl	@dxQuickSerpent
.org 0x21BF5D0
	bl	@dxSnakeLegion
.org 0x21BFB10
	bl	@dxGorgonEye


.org 0x21C09D0+0x34
	.dw	@ai|1
.org 0x21BEF8C
	bl	@aiFixRng
.org 0x21BF068
	bl	@moveLag
.org 0x21BF0BA
	bl	@moveConfuseBlindLag
.org 0x21BF588
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BF5A0
	bl	@snakeLegionPostLag
.org 0x21BF5D6
	pop	r15
.org 0x21BF67E
	bl	@snakeLegionCounterFrames
.org 0x21BFAE8
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BFAF0
	bl	@gorgonEyePreLag
.org 0x21BFB00
	bl	@gorgonEyePostLag
.org 0x21BFB16
	pop	r15
.org 0x21BFC06
	bl	@gorgonEyeCounterFrames
.org 0x21BFEA0
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BFEA8
	bl	@quickSerpentPreLag
.org 0x21BFEB8
	bl	@quickSerpentPostLag
.org 0x21BFECE
	pop	r15
.org 0x21C002E
	bl	@quickSerpentSpeed
.org 0x21C003A
	bl	@quickSerpentCounterFrames
.org 0x21C0088
	bl	@quickSerpentLag
.org 0x21C05B4
	bl	@snakeLegionBreakingAndNoInvis
.org 0x21C05C0
	bl	@snakeLegionShieldAndHPBug
.org 0x21C0A94+0x10
	.dw	@snakeLegionRefreshShield|1
.org 0x21C0726
	bl	@snakeLegionCheckHit
	cmp	r0,0x0
	beq	0x21C0746
.org 0x21C05E4
	bl	@snakeLegionHP
.org 0x21C0632
	bl	@snakeLegionSpeed
.org 0x21BF6AA
	bl	@snakeLegionPreLag
.org 0x21BF6B2	// Reset Snake Legion animation in AI
	bl	@snakeLegionResetAnimation
.org 0x21BF77A
	bl	@snakeLegionDelay
.org 0x21BF8FA
	bl	@snakeLegionPattern
.org 0x21BF902
	bl	@snakeLegionPatternRNG


.orga readu32(TEMP+"/y9.bin", 603 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (498))
@@end:
	bl	0x21745FC
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
@dxQuickSerpent:
	push	r14
	bl	battle_isDXBoss
	beq	@@normal
	ldr	r1,=(500)
	b	@@end
@@normal:
	ldrb	r1,[r1,r3]
@@end:
	str	r1,[r0,r2]
	pop	r15
.align 2
@dxGorgonEye:
	push	r14
	bl	battle_isDXBoss
	beq	@@normal
	ldr	r1,=(500)
	b	@@end
@@normal:
	ldrb	r1,[r1,r3]
@@end:
	str	r1,[r0,r2]
	pop	r15
.align 2
@dxSnakeLegion:
	push	r14
	bl	battle_isDXBoss
	beq	@@normal
	ldr	r2,=(500)
	b	@@end
@@normal:
	ldrb	r2,[r2,r3]
@@end:
	str	r2,[r0,r1]
	pop	r15


.align 2
@snakeLegionPatternRNG:
	// Old: 2
	// New: 4
	push	r14
	mov	r3,0x1
	bl	battle_isLegendMode
	beq	@@end
	mov	r3,0x3
@@end:
	and	r3,r2
	pop	r15
.align 2
@snakeLegionResetAnimation:
	// New: reset it in AI
	push	r14
	bl	battle_isDXBoss
	bne	@@end
	bl	battle_isLegendMode
	bne	@@end
	strb	r1,[r0]
@@end:
	mov	r0,0x2
	pop	r15

.align 2
@snakeLegionPreLag:
	// Old: 33
	// New: 6
	push	r14
	mov	r1,(33)
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r1,(18)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(6)
@@end:
	cmp	r2,r1
	bne	@@skip
	pop	r15
@@skip:
	add	sp,0x4
	bl	0x21BF6BA
.align 2
@quickSerpentPostLag:
	// Old: 10, 10, 10
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
	add	r1,r2,0x4
	pop	r15
.align 4
@@data:
	.db	5, 4, 3, 2, 3, 3
.align 2
@quickSerpentPreLag:
	// Old: 5, 3, 1
	// New: 3, 2, 1
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
	mov	r2,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 1, 1, 1
.align 2
@gorgonEyePreLag:
	// Old: 5, 3, 1
	// New: 3, 2, 1
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
	mov	r2,(0x14C >> 0x2)
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 1, 1, 1
@gorgonEyePostLag:
	// Old: 20, 18, 15
	// New: 10, 7, 4
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
	add	r1,r2,0x4
	pop	r15
.align 4
@@data:
	.db	10, 7, 4, 1, 4, 4
.align 2
@quickSerpentLag:
	// Old: 5
	// New: 4
	push	r14
	ldrh	r0,[r4,0x28]
	bl	battle_isLegendMode
	beq	@@normal
	cmp	r0,0x4
	b	@@end
@@normal:
	cmp	r0,0x5
@@end:
	pop	r15
.align 2
@quickSerpentSpeed:
	// Old: 20
	// New: 20/(4/5)
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	ldr	r1,=-((25) << 0xC)
@@end:
	mul	r1,r0
	mov	r0,r4
	pop	r15
.align 2
@snakeLegionCounterFrames:
	// Old: 3
	// New: 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(3)
@@end:
	bl	0x21749AC
	pop	r15
.align 2
@quickSerpentCounterFrames:
	// Old: 4
	// New: 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(4)
@@end:
	bl	0x21749AC
	pop	r15
.align 2
@gorgonEyeCounterFrames:
	// Old: 5
	// New: 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(5)
@@end:
	bl	0x21749AC
	pop	r15
.align 2
@snakeLegionPostLag:
	// Old: 15, 10, 5
	// New: 10, 7, 3
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
	add	r2,r1,0x4
	pop	r15
.align 4
@@data:
	.db	10, 7, 1, 3, 3, 3
.align 2
@moveLag:
	// Old: 20, 15,  5
	// New: 12, 9, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
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
	.db	12, 9, 3, 2, 3, 3
@moveConfuseBlindLag:
	// Old: +30
	// New: +20
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	add	r0,(20)
	b	@@end
@@normal:
	add	r0,(30)
@@end:
	str	r0,[r4,r1]
	pop	r15
.align 2
@snakeLegionPattern:
	// Old: 1/2 patterns
	// New: 4 patterns
	push	r14
	sub	r4,r3,0x1
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,=@@data
	mov	r3,(5 * 4)	// up to 4 patterns
	lsl	r2,r2,0x1E
	lsr	r2,r2,0x1E
	b	@@end
@@normal:
	mov	r3,(5 * 2)	// up to 2 patterns
	lsl	r2,r2,0x1F
	lsr	r2,r2,0x1F
@@end:
	pop	r15
.align 4
@@data:
	// LEFT
	.db	1, 3, 2, 3, 1
	.db	2, 1, 3, 2, 3
	.db	2, 3, 1, 2, 1
	.db	1, 2, 1, 3, 2
	// MIDDLE
	.db	2, 1, 3, 2, 3
	.db	2, 3, 1, 2, 1
	.db	3, 1, 2, 1, 3
	.db	2, 3, 1, 3, 2
	// RIGHT
	.db	3, 1, 2, 1, 3
	.db	2, 3, 1, 2, 1
	.db	2, 1, 3, 2, 3
	.db	3, 2, 3, 1, 2
.align 2
@snakeLegionSpeed:
	// Old: 10
	// New: 10/0.8, 10/0.7, 10/0.6
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	ldr	r1,=-0xE492
	b	@@end
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	lsl	r1,r4,0x2	// version
	add	r2,=@@data
	ldr	r1,[r2,r1]
@@end:
	add	r5,0x8C
	mul	r1,r0
	pop	r15
.align 4
@@data:
	.dw	-0xC400, -0xE492, -0x10AAA, -0x10AAA, -0x10AAA, -0x10AAA
.align 2
@snakeLegionDelay:
	// Old: 10
	// New: 8, 7, 6
	push	r14
	lsl	r1,r1,0x2
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x34
	ldrb	r0,[r4,r0]	// version
	bl	battle_isDXBoss
	beq	@@set
	add	r0,0x1
@@set:
	add	r2,=@@data
	ldrb	r0,[r2,r0]
@@end:
	strb	r0,[r4,r1]
	pop	r15
.align 4
@@data:
	.db	8, 7, 6, 6, 6, 6
.align 2
@snakeLegionHP:
	// Old: 20, 50, 100
	// New: 10, 25, 50 (but have shield)
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r4]
	mov	r0,r5
	pop	r15
.align 4
@@data:
	.db	10, 25, 50, 100, 50, 50
.align 2
@snakeLegionBreakingAndNoInvis:
	push	r14
	mov	r2,0x5		// normal
	bl	battle_isLegendMode
	beq	@@end

	mov	r1,0x1		// flinch only
	str	r1,[sp,0x4]	// add 0x4 due to push
	mov	r2,0x6		// breaking

@@end:
	mov	r1,r5
	pop	r15

.align 2
@snakeLegionShieldAndHPBug:
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Add Lv. 3/4/6 HP bug
	mov	r1,r4
	cmp	r1,0x2
	ble	@@setHPBug
	mov	r1,0x2
@@setHPBug:
	add	r2,=@@data
	ldrb	r1,[r2,r1]
	bl	battle_isDXBoss
	beq	@@set
	mov	r1,0x8
@@set:
	strb	r1,[r0,0xF]

	// Add shield
	mov	r1,0x2
	ldr	r2,[r0,0x2C]
	orr	r2,r1
	str	r2,[r0,0x2C]

@@end:
	mov	r1,r5
	add	r1,0xAC
	pop	r15

.align 4
@@data:
	.db	3, 5, 7, 7, 7, 7

.align 2
@snakeLegionCheckHit:
	push	r14
	mov	r0,(0x730000 >> 0x10)
	lsl	r0,r0,0x10
	tst	r0,r2
	beq	@@returnFalse

	bl	battle_isLegendMode
	beq	@@returnTrue

	// Attack must have breaking property
	mov	r0,0x2
	tst	r0,r2
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
@snakeLegionRefreshShield:
	// r0 = object
	push	r14
	bl	battle_isLegendMode
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
	bl	0x21C0674
	pop	r15

.align 2
@aiFixRng:
	push	r14
	lsr	r0,r0,0x1
	mov	r1,0x1
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,0x2		// fix
@@end:
	pop	r15
.align 2
@ai:
	push	r4,r14
	mov	r4,r0

	// Run normal AI
//	mov	r0,r4
	bl	0x21BEE88

	bl	battle_isLegendMode
	bne	@@legend

	bl	battle_isDXBoss
	beq	@@end

@@dx:
	// Finish animation 0x84
	mov	r1,0x31
	ldrb	r0,[r4,r1]
	cmp	r0,0x84
	bne	@@end

	mov	r0,(0x12C >> 0x2)
	lsl	r0,r0,0x2
	ldr	r0,[r4,r0]	// animation ended
	cmp	r0,0x0
	beq	@@end

	// Change animation
	mov	r0,0x0
	strb	r0,[r4,r1]
	b	@@end

@@legend:
	mov	r2,0xC4

	// Check state
	ldrb	r0,[r4,0x1C]	// state
	cmp	r0,0xA
	beq	@@movement

	// Reset panel spawn state
	mov	r1,0x0
	str	r1,[r4,r2]

	cmp	r0,0xC
	beq	@@snakeLegion
	cmp	r0,0xE
	beq	@@quickSerpent
	b	@@end

@@movement:
//	mov	r2,0xC4
	ldr	r3,[r4,r2]	// movement status

	mov	r0,0x68
	ldrh	r0,[r4,r0]	// current position
	mov	r1,0x6A
	ldrh	r1,[r4,r1]	// target position
	cmp	r0,r1
	bne	@@end

@@atTarget:
	cmp	r3,0x0
	bne	@@end

	// Mark spawned
	mov	r3,0x1
	str	r3,[r4,r2]
	b	@@spawnPoisonPanel

@@snakeLegion:
	// Finish animation 0x84
	mov	r1,0x31
	ldrb	r0,[r4,r1]
	cmp	r0,0x84
	bne	@@end

	mov	r0,(0x12C >> 0x2)
	lsl	r0,r0,0x2
	ldr	r0,[r4,r0]	// animation ended
	cmp	r0,0x0
	beq	@@end

	// Change animation
	mov	r0,0x0
	strb	r0,[r4,r1]
	b	@@end

@@quickSerpent:
	// Moving or finished (move back)
	ldrb	r0,[r4,0x1E]
	cmp	r0,0x1		// moving
	beq	@@spawnPoisonPanel
	cmp	r0,0x3		// finished
	bne	@@end

@@spawnPoisonPanel:
	// Calculate panel data address
	mov	r0,0x68
	mov	r1,0x69
	ldrb	r0,[r4,r0]	// x
	ldrb	r1,[r4,r1]	// y
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r0,r0,r1

	// Set panel
	mov	r1,0x6		// poison panel
	bl	0x218FBF0

@@end:
	pop	r4,r15

	.pool


.aligna 32
.endarea
.close
