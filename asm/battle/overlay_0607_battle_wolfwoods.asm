// Overlay 607 - Wolf Woods

.nds
.open TEMP+"/overlay_0607.bin",readu32(TEMP+"/y9.bin", 607 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21C03A0	// Upper Claw damage
	// Old: 60, 100, 150
	.db	60, 100, 150
.org 0x21C03A8	// Wide Claw damage
	// Old: 60, 100, 150
	.db	60, 100, 150
.org 0x21C03D4	// HP
	// Old: 1000, 1300, 1700
	.dh	1000, 1500, 1900
.org 0x21C03DA	// Contact damage
	// Old: 60, 100, 150
	.dh	60, 100, 150
.org 0x21C0408	// Howling Wolf damage
	// Old: 60, 100, 150
	.dh	60, 100, 150, 500

.org 0x21C03A4	// Move lag (slow)
	.db	15, 10, 5, 3
.org 0x21C0398	// Move lag (fast)
	.db	6, 4, 2, 1
.org 0x21C0380	// Wide Claw pre lag (slow)
	.db	10, 5, 1, 1
.org 0x21C0378	// Wide Claw pre lag (fast)
	.db	8, 4, 2, 1
.org 0x21C037C	// Wide Claw post lag (slow)
	.db	10, 5, 1, 1
.org 0x21C0384	// Wide Claw counter frames
	.db	4, 4, 4, 4
.org 0x21C0368	// Wide Claw post lag (fast)
	.db	1, 1, 1, 1
.org 0x21C036C	// Upper Claw counter frames
	.db	3, 3, 3, 3
.org 0x21C0388	// Upper Claw pre lag (slow)
	.db	10, 6, 4, 2
.org 0x21C03C8	// Upper Claw pre lag (fast)
	.db	1, 1, 1, 1
.org 0x21C0390	// Upper Claw post lag (slow)
	.db	10, 8, 6, 4
.org 0x21C03C4	// Upper Claw post lag (fast)
	.db	1, 1, 1, 1
.org 0x21C0370	// Howling Wolf pre lag (slow)
	.db	20, 15, 10, 5
.org 0x21C03C0	// Howling Wolf pre lag (fast)
	.db	12, 9, 6, 3
.org 0x21C0364	// Howling Wolf post lag (slow)
	.db	120, 100, 80, 60
.org 0x21C03BC	// Howling Wolf post lag (fast)
	.db	120, 100, 80, 60
.org 0x21C0394	// Full Moon post lag
	.db	5, 5, 5, 5


.org 0x21BECAC
	bl	@dxModel
.org 0x21BEC2E
	bl	@dxHP
.org 0x21BEC8C
	bl	@dxContactDamage
.org 0x21BF110
	bl	@dxUpperClaw
.org 0x21BFFE2
	bl	@dxHowlingWolf


.org 0x21C04E4 + 0x34
	.dw	@behavior|1
.org 0x21BF474
	bl	@moveCount
.org 0x21BF66C
	beq	0x21BF678
	nop
	nop
	bl	@moveConfuseBlindLag
.org 0x21BF6C4
	bl	@moveLagSlow
.org 0x21BF6F4
	bl	@moveLagFast
.org 0x21BEEF8
	mov	r2,0x34
	ldr	r0,[0x21BEFD8]
	bl	@wideClawPreLagSlow
.org 0x21BEF02
	mov	r2,0x34
	ldr	r0,[0x21BEFDC]
	bl	@wideClawPreLagFast
.org 0x21BEF90
	mov	r2,0x34
	ldr	r0,[0x21BEFEC]
	bl	@wideClawPostLagSlow
.org 0x21BEF9A
	mov	r2,0x34
	ldr	r0,[0x21BEFF0]
	bl	@wideClawPostLagFast
.org 0x21BEF42
	mov	r2,0x34
	ldrb	r2,[r4,r2]
	ldr	r1,[0x21BEFE0]
	bl	@wideClawCounterFrames
.org 0x21BEFB8
	bl	@wideClawConfuseBlindLag
.org 0x21BF06A
	mov	r2,0x34
	ldr	r0,[0x21BF18C]
	bl	@upperClawPreLagSlow
.org 0x21BF074
	mov	r2,0x34
	ldr	r0,[0x21BF190]
	bl	@upperClawPreLagFast
.org 0x21BF13E
	mov	r2,0x34
	ldr	r0,[0x21BF1A0]
	bl	@upperClawPostLagSlow
.org 0x21BF148
	mov	r2,0x34
	ldr	r0,[0x21BF1A4]
	bl	@upperClawPostLagFast
.org 0x21BF0D8
	mov	r2,0x34
	ldrb	r2,[r4,r2]
	ldr	r1,[0x21BF194]
	bl	@upperClawCounterFrames
.org 0x21BF166
	bl	@upperClawConfuseBlindLag
.org 0x21BF520
	bl	@howlingWolfAttackCount
.org 0x21BF49C
	bl	@howlingWolfHPCheck
.org 0x21BF1DA
	mov	r2,0x34
	ldr	r0,[0x21BF2D0]
	bl	@howlingWolfPreLagSlow
.org 0x21BF1E4
	mov	r2,0x34
	ldr	r0,[0x21BF2D4]
	bl	@howlingWolfPreLagFast
.org 0x21BF27E
	mov	r2,0x34
	ldr	r0,[0x21BF2E4]
	bl	@howlingWolfPostLagSlow
.org 0x21BF288
	mov	r2,0x34
	ldr	r0,[0x21BF2E8]
	bl	@howlingWolfPostLagFast
.org 0x21BF246
	mov	r2,0x34
	ldr	r1,[0x21BF2D8]
	bl	@howlingWolfCounterFrames
.org 0x21BF2A6
	bl	@howlingWolfConfuseBlindLag
.org 0x21BF35E
	bl	@fullMoonPostLag
.org 0x21BFDA0
	bl	@fullMoonOpenLag
.org 0x21BFDB6
	bl	@fullMoonOpenSpeed


.org 0x21BF9A4
	bl	@wideClawBlind


// Remove gone from field for 1 frame during movement
.org 0x21BEECE	// Wide Claw
.area 0x14,0x00
	// Set next animation early
	mov	r0,0x4
	mov	r1,0x31
	strb	r0,[r4,r1]

	// Skip hide
	pop	r4,r15
.endarea
.org 0x21BF040	// Upper Claw
.area 0x14,0x00
	// Set next animation early
	mov	r0,0x6
	mov	r1,0x31
	strb	r0,[r4,r1]

	mov	r0,r4
	bl	@upperClawUpdatePositionEarly

	// Skip hide
	pop	r4,r15
.endarea


.orga readu32(TEMP+"/y9.bin", 607 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (503))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxHP:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@normal
	ldr	r2,=(4000)
	b	@@end
@@normal:
	ldsh	r2,[r1,r4]
@@end:
	mov	r1,r5
	pop	r15
.align 2
@dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@normal
	ldr	r1,=(500)
	b	@@end
@@normal:
	ldsh	r1,[r0,r4]
@@end:
	mov	r0,r5
	pop	r15
.align 2
@dxUpperClaw:
	push	r14
	bl	battle_isDXBoss
	beq	@@normal
	ldr	r2,=(500)
	b	@@end
@@normal:
	ldrb	r2,[r2,r3]
@@end:
	mov	r0,r4
	pop	r15
.align 2
@dxHowlingWolf:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r1,0x2
@@end:
	ldrh	r1,[r0,r1]
	mov	r0,r5
	pop	r15


.align 2
@wideClawBlind:
	// New: inflicts blind
	push	r14
	bl	0x218B098
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0xAC
	ldr	r0,[r4,r0]	// collision
	cmp	r0,0x0
	beq	@@end
	ldr	r1,[sp,(0x4+0x4)]	// parent
	cmp	r1,0x0
	beq	@@end
	add	r1,0x34
	ldrb	r1,[r1]		// level
	add	r2,=@@data
	ldrb	r1,[r2,r1]	// blind level
	strb	r1,[r0,0x1B]
@@end:
	pop	r15
.align 4
@@data:
	.db	1, 1, 2


.align 2
@fullMoonOpenLag:
	// Old: 90 (45 for DX)
	// New: 30
	push	r14
	mov	r1,(90)
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r1,(45)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(30)
@@end:
	str	r1,[r4,r0]
	pop	r15
.align 2
@fullMoonOpenSpeed:
	// Old: 1x (2x for DX)
	// New: 3x
	push	r14
	mov	r2,0x1
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x3
@@end:
	mul	r0,r2
	add	r0,r1,r0
	mov	r1,0x57
	pop	r15

.align 2
@behavior:
	// New: invulnerable during Upper Claw
	push	r3-r7,r14
	mov	r4,r0
	ldrb	r5,[r4,0x1C]	// old action state

//	mov	r0,r4
	bl	0x21BED74	// regular behavior

	bl	battle_isLegendMode
	beq	@@end

	mov	r0,(0x130 >> 0x4)
	lsl	r0,r0,0x4
	ldrb	r0,[r4,r0]	// new action state
	mov	r1,0xAC
	ldr	r1,[r4,r1]	// collision
	cmp	r1,0x0
	beq	@@end
	mov	r2,(0x200 >> 0x8)
	lsl	r2,r2,0x8
	ldr	r3,[r1,0x2C]	// status effects

	// Are we in Upper Claw?
	ldrb	r6,[r4,0x1C]	// current state
	ldrb	r7,[r4,0x1D]
	cmp	r6,0xC
	bne	@@checkExit
	cmp	r7,0x1
	blt	@@checkExit
	cmp	r7,0x4		// post lag
	blt	@@addInvulnerable

	// Check if invulnerability already removed
	tst	r3,r2
	beq	@@checkExit

	// Check if confused/blinded
	mov	r7,0x18		// reuse r7
	tst	r3,r7
	bne	@@removeInvulnerable

	b	@@addInvulnerable

@@checkExit:
	// Changed action state?
	cmp	r0,r5
	beq	@@end
	// Changed from Upper Claw?
	cmp	r5,0xC
	bne	@@end

@@removeInvulnerable:
	bic	r3,r2
	b	@@setInvulnerable

@@addInvulnerable:
	orr	r3,r2
//	b	@@setInvulnerable

@@setInvulnerable:
	str	r3,[r1,0x2C]

@@end:
	pop	r3-r7,r15

.align 2
@howlingWolfAttackCount:
	// Old: 4, 4, 4
	// New: 7, 7, 7
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
	.db	7, 7, 7

.align 2
@fullMoonPostLag:
	// Old: 5, 5, 5
	// New: 1, 1, 1
	push	r14
	add	r1,0x20
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1
.align 2
@howlingWolfPreLagSlow:
	// Old: 20, 15, 10
	// New: 10, 7, 4
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	10, 7, 4, 1
.align 2
@howlingWolfPreLagFast:
	// Old: 12, 9, 6
	// New: 4, 3, 2
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	4, 3, 2, 1
.align 2
@howlingWolfPostLagSlow:
	// Old: 120, 100, 80
	// New: 60, 50, 40
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	60, 50, 40, 30
.align 2
@howlingWolfPostLagFast:
	// Old: 120, 100, 80
	// New: 30, 25, 20
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	30, 25, 20, 15
.align 2
@howlingWolfCounterFrames:
	// Old: 4, 4, 4
	// New: 4, 4, 4
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r0,r4
	pop	r15
.align 4
@@data:
	.db	4, 4, 4
.align 2
@howlingWolfConfuseBlindLag:
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
	str	r1,[r4,r0]
	pop	r15
.align 2
@upperClawPreLagSlow:
	// Old: 10, 6, 4
	// New: 7, 5, 3
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	7, 5, 3, 1
.align 2
@upperClawPreLagFast:
	// Old: 1, 1, 1
	// New: 1, 1, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1
.align 2
@upperClawPostLagSlow:
	// Old: 10, 8, 6
	// New: 6, 5, 4
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	6, 5, 4, 1
.align 2
@upperClawPostLagFast:
	// Old: 1, 1, 1
	// New: 1, 1, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1
.align 2
@upperClawConfuseBlindLag:
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
	str	r1,[r4,r0]
	pop	r15
.align 2
@upperClawCounterFrames:
	// Old: 3, 3, 3
	// New: 3, 3, 3
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r0,r4
	pop	r15
.align 4
@@data:
	.db	3, 3, 3
.align 2
@wideClawPreLagSlow:
	// Old: 10, 5, 1
	// New: 5, 3, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 1
.align 2
@wideClawPreLagFast:
	// Old: 8, 4, 2
	// New: 2, 1, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	2, 1, 1, 1
.align 2
@wideClawPostLagSlow:
	// Old: 10, 5, 1
	// New: 5, 3, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	5, 3, 1, 1
.align 2
@wideClawPostLagFast:
	// Old: 1, 1, 1
	// New: 1, 1, 1
	push	r14
	ldrb	r2,[r4,r2]
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1
.align 2
@wideClawCounterFrames:
	// Old: 4, 4, 4
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r1,[r1,r2]
	mov	r0,r4
	pop	r15
.align 4
@@data:
	.db	4, 4, 4
.align 2
@wideClawConfuseBlindLag:
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
	str	r1,[r4,r0]
	pop	r15
.align 2
@howlingWolfHPCheck:
	// Old: 50% or lower
	// New: 100% or lower unless berserk
	push	r14
	ldsh	r0,[r5,r0]	// current HP

	mov	r2,(0x198 >> 0x2)
	lsl	r2,r2,0x2
	ldrh	r2,[r5,r2]	// berserk
	cmp	r2,0x0
	bne	@@end

	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x1		// treat as low HP
@@end:
	cmp	r1,r0
	pop	r15
.align 2
@moveCount:
	// Old: 2, 2, 2
	// New: 0/2, 0/2, 0/2
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	push	r0-r1
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x2	// test 0x2
	pop	r0-r1
	bcc	@@end

	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,0x65
	pop	r15
.align 4
@@data:
	.db	0, 0, 0
.align 2
@moveLagSlow:
	// Old: 15, 10, 5
	// New: 12, 8, 4
	push	r14
	sub	r2,0x58
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r3]
	pop	r15
.align 4
@@data:
	.db	12, 8, 4, 2
.align 2
@moveLagFast:
	// Old: 6, 4, 2
	// New: 3, 2, 1
	push	r14
	sub	r2,0x58
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r3]
	pop	r15
.align 4
@@data:
	.db	3, 2, 1, 1
.align 2
@moveConfuseBlindLag:
	// Old: 30
	// New: 15
	push	r14
	mov	r1,(30)
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(15)
@@end:
	pop	r15

.align 2
@upperClawUpdatePositionEarly:
	push	r4,r14
	mov	r4,r0		// this

	// Change position
	mov	r0,(0x150 >> 0x4)
	lsl	r0,r0,0x4
	ldrh	r0,[r4,r0]	// new position
	mov	r1,0x68
	strh	r0,[r4,r1]	// current position

	// Set real position from panel position
	mov	r0,r4
	mov	r1,r4
	add	r0,0x6C
	add	r1,0x68
	bl	0x2153380

	pop	r4,r15


	.pool

.aligna 32
.endarea
.close
