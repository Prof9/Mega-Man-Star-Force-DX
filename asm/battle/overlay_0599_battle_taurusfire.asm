// Overlay 599 - Taurus Fire

.nds
.open TEMP+"/overlay_0599.bin",readu32(TEMP+"/y9.bin", 599 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21BFF30	// HP
	// Old: 400, 800, 1400
	.dh	400, 1400, 2200, 5000, 2200, 2200
.org 0x21BFF18	// Fire Breath damage
	// Old: 10, 50, 90
	.dh	10, 60, 140, 500, 140, 140
.org 0x21BFF3C	// Ox Tackle damage
	// Old: 20, 70, 130
	.dh	20, 90, 180, 600, 180, 180
.org 0x21BFF48	// Contact damage
	// Old: 10, 50, 90
	.dh	10, 60, 140, 500, 140, 140
.org 0x21BFF54	// Anger Punch damage
	// Old: 10, 50, 90
	.dh	10, 60, 140, 500, 140, 140

.org 0x21BFEE8	// Move lag
	.db	40, 30, 20, 10, 20, 20
.org 0x21BFEE0	// Anger Punch pre lag
	.db	10, 8, 3, 1, 3, 3
.org 0x21BFF00	// Ox Tackle pre lag
	.db	12, 8, 5, 3, 5, 5
.org 0x21BFF08	// Ox Tackle post lag
	.db	25, 15, 10, 5, 10, 10
.org 0x21BFEF8	// Fire Breath pre lag
	.db	20, 15, 8, 4, 10, 10


.org 0x21BEC96
	bl	@dxModel
.org 0x21BECD6
	bl	@dxHP
.org 0x21BFB82
	bl	@dxFireBreath
.org 0x21BF836
	bl	@dxOxTackle
.org 0x21BEC7E
	bl	@dxContactDamage
.org 0x21BF98A
	bl	@dxAngerPunch


.org 0x21BEC66	// Adjust abilities
	bl	@superArmor


.org 0x21BEF66	// Adjust attack pattern
	bl	@chooseAttack
.org 0x21BEF6C
	blt	0x21BEF8E


.org 0x21BF6EE	// Adjust attack parameters
	bl	@moveLag
.org 0x21BF740
	bl	@moveConfuseBlindLag
.org 0x21BF980
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF99A
	bl	@angerPunchPreLag
.org 0x21BF9AA
	bl	@angerPunchLength
.org 0x21BF9BC
	bl	@angerPunchCounterFrames
.org 0x21BF9D8
	bl	@angerPunchConfuseBlindLag
.org 0x21BF9DE
	pop	r15
.org 0x21BFAFA
	bl	@angerPunchSpawnGuardNullPanel
.org 0x21BF82C
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF846
	bl	@oxTacklePreLag
.org 0x21BF868
	bl	@oxTackleSpeed
.org 0x21BF87A
	bl	@oxTackleCounterFrames
.org 0x21BF856
	bl	@oxTacklePostLag
.org 0x21BF896
	bl	@oxTackleConfuseBlindLag
.org 0x21BF89C
	pop	r15
.org 0x21BFB78
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFB92
	bl	@fireBreathPreLag
.org 0x21BFBA2
	bl	@fireBreathLength
.org 0x21BFBC4
	bl	@fireBreathCounterFrames
.org 0x21BFBE0
	bl	@fireBreathConfuseBlindLag
.org 0x21BFBE6
	pop	r15


.orga readu32(TEMP+"/y9.bin", 599 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (493))
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
@dxFireBreath:
@dxOxTackle:
@dxAngerPunch:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r1,[r1,r2]
	mov	r2,0x4E
	pop	r15


.align 2
@chooseAttack:
	push	r4-r5,r14
	and	r0,r1
	mov	r4,r0		// r
	mov	r5,0x7		// default threshold (7/16 Anger Punch, 9/16 Ox Tackle)
	bl	battle_isLegendMode
	beq	@@end

@@countPanels:
	bl	@countGuardNullPanels
	cmp	r0,0x3
	ble	@@chooseDivider
	mov	r0,0x3

@@chooseDivider:
	add	r1,=@@data
	ldrb	r5,[r1,r0]

@@end:
	cmp	r4,r5
	pop	r4-r5,r15
.align 4
@@data:
	// 0 panels: 12/16 Anger Punch,  4/16 Ox Tackle
	// 1 panels:  8/16 Anger Punch,  8/16 Ox Tackle
	// 2 panels:  6/16 Anger Punch, 10/16 Ox Tackle
	// 3 panels:  4/16 Anger Punch, 12/16 Ox Tackle
	.db	12, 8, 6, 4

@countGuardNullPanels:
	// Count number of Guard Null panels in player row
	// Returns r0 = number of Guard Null panels
	push	r4-r5,r14
	mov	r4,0x1		// x
	mov	r5,0x0		// count

@@loop:
	mov	r0,r4
	mov	r1,0x1
	bl	@isGuardNullPanel
	cmp	r0,0x0
	beq	@@next

	add	r5,0x1
@@next:
	add	r4,0x1
	cmp	r4,0x3
	ble	@@loop

	mov	r0,r5
	pop	r4-r5,r15

@isGuardNullPanel:
	// Input r0 = x, r1 = y
	// Returns r0 = is Guard Null panel (0 or 1)
	cmp	r0,0x1
	blt	@@returnFalse
	cmp	r0,0x3
	bgt	@@returnFalse
	cmp	r1,0x1
	blt	@@returnFalse
	cmp	r1,0x5
	bgt	@@returnFalse

	// Calculate panel data address
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r1,r0,r1

	// Check Guard Null panel
	ldrb	r0,[r1,0xA]
	cmp	r0,0x8
	bne	@@returnFalse

	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	bx	r14


@superArmor:
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Set Super Armor
	ldr	r1,[r0,0x2C]
	mov	r2,0x1
	lsl	r2,r2,0xA
	orr	r1,r2
	str	r1,[r0,0x2C]

@@end:
	mov	r1,r5
	add	r1,0xAC
	pop	r15

@moveLag:
	// Old: 40, 30, 20
	// New: 20, 15, 10
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
	mov	r0,r2
	pop	r15
.align 4
@@data:
	.db	20, 15, 10, 5, 10, 10
@moveConfuseBlindLag:
	// Old: +60
	// New: +30
	push	r14
	add	r2,0xA
	bl	battle_isLegendMode
	beq	@@normal
	add	r0,(30)
	b	@@end
@@normal:
	add	r0,(60)
@@end:
	pop	r15
@angerPunchPreLag:
	// Old: 10, 8, 3
	// New: 3, 2, 1
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
	.db	3, 2, 1, 1, 1, 1
@angerPunchLength:
	// Old: 5, 5, 5
	// New: 3, 3, 3
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
	.db	3, 3, 3, 3, 3, 3
@angerPunchCounterFrames:
	// Old: 8, 8, 8
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dh	4, 4, 4, 4, 4, 4
@angerPunchConfuseBlindLag:
@oxTackleConfuseBlindLag:
	// Old: +60
	// New: +30
	push	r14
	add	r2,0x18
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(30)
	b	@@end
@@normal:
	add	r1,(60)
@@end:
	pop	r15
@oxTacklePreLag:
	// Old: 12, 8, 5
	// New: 8, 5, 2
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
	.db	8, 5, 2, 1, 2, 2
@oxTackleSpeed:
	// Old: 64, 64, 64
	// New: 112, 112, 112
	// Should be a divisor of 448 to get the same positioning
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dw	0x70, 0x70, 0x70, 0x70, 0x70, 0x70
@oxTackleCounterFrames:
	// Old: 8, 8, 8
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dw	4, 4, 4, 4, 4, 4
@oxTacklePostLag:
	// Old: 25, 15, 10
	// New: 10, 7, 3
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
	.db	10, 7, 3, 1, 3, 3
@fireBreathPreLag:
	// Old: 20, 15, 8
	// New: 12, 8, 4
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
	.db	12, 8, 4, 1, 4, 4
@fireBreathLength:
	// Old: 30, 30, 30
	// New: 20, 20, 20
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
	.db	20, 20, 20, 20, 20, 20
@fireBreathCounterFrames:
	// Old: 10, 10, 10
	// New: 5, 5, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dh	5, 5, 5, 5, 5, 5
@fireBreathConfuseBlindLag:
	// Old: +60
	// New: +30
	push	r14
	add	r2,0x1C
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(30)
	b	@@end
@@normal:
	add	r1,(60)
@@end:
	pop	r15

@angerPunchSpawnGuardNullPanel:
	bl	battle_isLegendMode
	beq	@@end

	mov	r2,sp
	ldrb	r0,[r2]		// x
	ldrb	r1,[r2,0x1]	// y

	// Calculate panel data address
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r0,r0,r1

	// Set panel
	mov	r1,0x8		// Guard Null panel
	bl	0x218FBF0	// set panel

@@end:
	add	sp,0x24
	pop	r4-r5,r15


	.pool


.aligna 32
.endarea
.close
