// Overlay 600 - Cygnus Wing

.nds
.open TEMP+"/overlay_0600.bin",readu32(TEMP+"/y9.bin", 600 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21BFB4E	// Migratory Birds damage
	// Old: 20, 60, 100
	.dh	20, 80, 140, 500, 140, 140
.org 0x21BFB66	// Contact damage
	// Old: 20, 60, 100
	.dh	20, 80, 140, 500, 140, 140
.org 0x21BFB80	// Cygnus Feather damage
	// Old: 10, 30, 50
	.dh	10, 40, 70, 250, 70, 70
.org 0x21BFB8C	// HP
	// Old: 600, 1000, 1500
	.dh	600, 1500, 2000, 4000, 2000, 2000
.org 0x21BFB98	// Dancing Swan damage
	// Old: 20, 60, 100
	.dh	20, 80, 140, 500, 140, 140

.org 0x21BFC44	// Move lag
	.db	15, 13, 8, 5, 8, 8
.org 0x21BFC3C	// Cygnus Feather pre lag
	.db	10, 8, 5, 3, 5, 5
.org 0x21BFC5C	// Cygnus Feather post lag
	.db	5, 5, 5, 5, 5, 5
.org 0x21BFC24	// Dancing Swan pre lag
	.db	15, 10, 8, 5, 8, 8
.org 0x21BFC2C	// Dancing Swan post lag
	.db	5, 5, 5, 5, 5, 5
.org 0x21BFC0C	// Dancing Swan speed
	.dw	37, 48, 53, 60, 53, 53
.org 0x21BFC54	// Migratory Birds pre lag
	.db	15, 10, 8, 5, 8, 8
.org 0x21BFC34	// Migratory Birds post lag
	.db	30, 25, 20, 15, 20, 20


.org 0x21BECA6
	bl	@dxModel
.org 0x21BECE6
	bl	@dxHP
.org 0x21BEC7C
	bl	@dxContactDamage
.org 0x21BF9BA
	bl	@dxMigratoryBirds
.org 0x21BF6AA
	bl	@dxCygnusFeather
.org 0x21BF842
	bl	@dxDancingSwan


.org 0x21BEC66	// Add confuse for Dancing Swan
	bl	@spawnedOwnHitbox

.org 0x21BF5BE
	bl	@moveLag
.org 0x21BF610
	bl	@moveConfuseBlindLag
.org 0x21BEE0A
	bl	@moveCount

.org 0x21BF6A0
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF6BA
	bl	@cygnusFeatherPreLag
.org 0x21BF6CA
	bl	@cygnusFeatherPostLag
.org 0x21BF6DE
	bl	@cygnusFeatherCounterFrames
.org 0x21BF6E2
	pop	r15

.org 0x21BF838
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF852
	bl	@dancingSwanPreLag
.org 0x21BF862
	bl	@dancingSwanPostLag
.org 0x21BF874
	bl	@dancingSwanSpeed
.org 0x21BF886
	bl	@dancingSwanCounterFrames
.org 0x21BF8A2
	bl	@dancingSwanConfuseBlindLag
.org 0x21BF8A8
	pop	r15

.org 0x21BF9B0
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF9CA
	bl	@migratoryBirdsPreLag
.org 0x21BF9DA
	bl	@migratoryBirdsPostLag
.org 0x21BF9EE
	bl	@migratoryBirdsCounterFrames
.org 0x21BF9F2
	pop	r15

.org 0x21BF71C
	bl	@cygnusFeatherTarget
.org 0x21BEFB0
	bl	@cygnusFeatherWaitForWindUp
.org 0x21BEFBE
	bl	@cygnusFeatherSetAttackAnimation
.org 0x21BEFCA
	bl	@cygnusFeatherDuration
.org 0x21BEFD2
	bl	@cygnusFeatherSetupFirstFeather
.org 0x21BF002
	bl	@cygnusFeatherAttackDelay
.org 0x21BF022
	bl	@cygnusFeatherPostSpawn


.orga readu32(TEMP+"/y9.bin", 600 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (494))
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
@dxMigratoryBirds:
@dxCygnusFeather:
@dxDancingSwan:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r1,[r1,r2]
	mov	r2,0x4E
	pop	r15


.align 2
@migratoryBirdsPreLag:
	// Old: 15, 10, 8
	// New: 9, 6, 3
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
	.db	9, 6, 3, 1, 3, 3
@migratoryBirdsPostLag:
	// Old: 30, 25, 20
	// New: 22, 16, 10
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
	.db	22, 16, 10, 5, 10, 10
@migratoryBirdsCounterFrames:
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
@dancingSwanPreLag:
	// Old: 15, 10, 8
	// New: 9, 7, 5
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
	.db	9, 7, 5, 3, 5, 5
@dancingSwanPostLag:
	// Old: 5, 5, 5
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
@dancingSwanSpeed:
	// Old: 37, 48, 53
	// New: 50, 55, 60
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dw	45, 55, 60, 70, 60, 60
@dancingSwanCounterFrames:
	// Old: 7, 7, 7
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
@dancingSwanConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x18
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15

.align 2
@cygnusFeatherPreLag:
	// Old: 10, 8, 5
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
@cygnusFeatherPostLag:
	// Old: 5, 5, 5
	// New: 5, 4, 3
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
	.db	5, 4, 3, 2, 3, 3
@cygnusFeatherCounterFrames:
	// Old: 7, 7, 7
	// New: 5, 5, 5
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:	
	ldr	r1,[r1,r3]
	str	r1,[r0,r2]
	pop	r15
.align 4
@@data:
	.dw	5, 5, 5, 5, 5, 5


.align 2
@spawnedOwnHitbox:
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Add confuse lv. 3 (90i)
	mov	r1,0x3
	strb	r1,[r0,0x1C]

@@end:
	mov	r1,r5
	add	r1,0xAC
	pop	r15


.align 2
@cygnusFeatherTarget:
	// Legend Mode: miss on purpose sometimes
	// Higher chance if shielding
	push	r7,r14
	mov	r7,r0

	// Get target position
	ldr	r1,[r1,0x24]
	blx	r1

	// If in Legend Mode
	bl	battle_isLegendMode
	beq	@@end

	// If target is shielding
	mov	r1,0xAC
	ldr	r1,[r7,r1]	// target collision
	add	r7,=@@dataNoShield
	cmp	r1,0x0
	beq	@@random
	ldr	r1,[r1,0x2C]
	lsr	r1,r1,0x2	// test 0x2
	bcc	@@random
	add	r7,=@@dataShield

@@random:
	// Get version
	mov	r1,0x34
	ldrb	r1,[r4,r1]
	// Get comparator
	ldrb	r7,[r7,r1]

	// Get random number [0..100)
	push	r0
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,(100)
	blx	0x20AED80	// divrem
	pop	r0
	cmp	r1,r7
	bge	@@end

	// Miss on purpose
	lsl	r7,r0,0x18
	lsr	r7,r7,0x18
	cmp	r7,0x2
	blt	@@setMiddle
	bgt	@@setMiddle

	// Get random number 1 or 3
	push	r0
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r7,r0,0x1F
	lsr	r7,r7,0x1E	// 0 or 2
	add	r7,0x1		// 1 or 3
	pop	r0
	b	@@setNewPosition

@@setMiddle:
	mov	r7,0x2

@@setNewPosition:
	lsr	r0,r0,0x8
	lsl	r0,r0,0x8
	add	r0,r0,r7

@@end:
	pop	r7,r15
.align 4
@@dataShield:
	.db	70, 80, 90, 90, 90, 90
.align 4
@@dataNoShield:
	.db	0, 0, 0, 0, 0, 0

@cygnusFeatherWaitForWindUp:
	push	r14
	lsl	r2,r2,0x2
	ldr	r1,[r4,r2]
	bl	battle_isLegendMode
	beq	@@end
@@end:
	mov	r1,0x1		// Don't wait for animation
	pop	r15

@cygnusFeatherSetAttackAnimation:
	push	r14
	add	r2,0x28
	bl	battle_isLegendMode
	bne	@@end		// Legend Mode: don't set animation
	strb	r3,[r1]		// Set animation
@@end:
	pop	r15

@cygnusFeatherDuration:
	// Old: 30
	// New: 12
	push	r14
	mov	r1,(30)
	bl	battle_isDXBoss
	beq	@@checkLegend
	mov	r1,(15)
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	mov	r1,(12)
@@end:
	lsl	r0,r0,0x2
	pop	r15

@cygnusFeatherSetupFirstFeather:
	push	r14
	mov	r2,0x5		// Skip first timer
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x0		// Don't skip first timer
@@end:
	add	r1,0x18
	pop	r15

@cygnusFeatherAttackDelay:
	push	r14
	str	r5,[r4,r2]
	mov	r2,0x5		// 5 frames
	bl	battle_isLegendMode
	beq	@@end
	mov	r2,0x3		// 3 frames
@@end:
	cmp	r1,r2
	pop	r15

@cygnusFeatherPostSpawn:
	push	r14
	add	r0,0x1
	str	r0,[r4,r1]

	bl	battle_isLegendMode
	beq	@@end

	// Set attack animation
	mov	r0,0x5
	mov	r1,0x31
	strb	r0,[r4,r1]

@@end:
	pop	r15


@moveCount:
	// Old: 3, 2, 1
	// New: 3/2, 2/1, 1/0
	push	r14
	ldrb	r3,[r4,r1]
	bl	battle_isLegendMode
	beq	@@end
	push	r0-r3
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x6	// test 0x20
	pop	r0-r3
	bcc	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	2, 1, 0, 0, 0, 0

@moveLag:
	// Old: 15, 13, 8
	// New: 10, 8, 5
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
	.db	10, 8, 5, 2, 5, 5
@moveConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0xA
	bl	battle_isLegendMode
	beq	@@normal
	add	r0,(15)
	b	@@end
@@normal:
	add	r0,(30)
@@end:
	pop	r15


.pool


.aligna 32
.endarea
.close
