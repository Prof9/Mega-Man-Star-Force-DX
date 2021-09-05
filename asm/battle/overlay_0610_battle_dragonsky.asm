// Overlay 610 - Dragon Sky

.nds
.open TEMP+"/overlay_0610.bin",readu32(TEMP+"/y9.bin", 610 * 0x20 + 0x4)
.thumb

.org 0x21C0966	// HP
	// Shadow: 800 -> 1300
	.dh	2400, 2900, 3600, 1300, 5500, 800
.org 0x21C0998	// Contact damage
	// Shadow: 40 -> 70
	.dh	150, 250, 350, 70, 700, 70
.org 0x21C0AA0	// Move lag
	.db	5, 5, 5, 5, 3, 5
.org 0x21C09BC	// Flowering Burst damage, pre/post lag
	// Shadow: 40/25/25 -> 70/20/20
	.dh	150	:: .db	15, 15
	.dh	250	:: .db	12, 15
	.dh	350	:: .db	10, 15
	.dh	 70	:: .db	20, 20
	.dh	700	:: .db	 8, 15
	.dh	 40	:: .db	25, 25
.org 0x21C09D4	// Dragon Road damage, pre/post lag
	// Shadow: 40/25/25 -> 70/20/20
	.dh	150	:: .db	15, 15
	.dh	250	:: .db	10, 15
	.dh	350	:: .db	 5, 15
	.dh	 70	:: .db	20, 20
	.dh	700	:: .db	 3, 15
	.dh	 40	:: .db	25, 25
.org 0x21C0A1C	// Wood Lance damage, pre/post lag, attack lag/duration/appear speed
	// Shadow: 25/25/25 -> 40/20/20
	.dh	100	:: .db	15, 15	:: .dh	10, 8, 6
	.dh	150	:: .db	10, 15	:: .dh	 8, 6, 5
	.dh	250	:: .db	 5, 15	:: .dh	 6, 4, 3
	.dh	 40	:: .db	20, 20	:: .dh	10, 8, 6
	.dh	500	:: .db	 3, 15	:: .dh	 5, 4, 3
	.dh	 25	:: .db	25, 25	:: .db	10, 8, 6
.org 0x21C0A58	// Leaf Tornado speed, damage, pre/post/start/next lag
	// Shadow: 40/15/15 -> 70/15/25
	.dw	0x6AAA	:: .dh	150	:: .db	15, 25, 15, 15	:: .align 4
	.dw	0x6AAA	:: .dh	250	:: .db	10, 25, 10, 15	:: .align 4
	.dw	0x6AAA	:: .dh	350	:: .db	 5, 25,  5, 15	:: .align 4
	.dw	0x6AAA	:: .dh	70	:: .db	15, 25, 15, 15	:: .align 4
	.dw	0x6AAA	:: .dh	700	:: .db	 3, 25,  3, 15	:: .align 4
	.dw	0x6AAA	:: .dh	40	:: .db	15, 15, 15, 15	:: .align 4
.org 0x21C0A04	// Dragon Cyclone damage, ???, pre lag
	.dh	60	:: .db	10, 60
	.dh	60	:: .db	10, 60
	.dh	60	:: .db	10, 60
	.dh	60	:: .db	10, 60
	.dh	100	:: .db	10, 60
	.dh	60	:: .db	10, 60


.org 0x21BEC76
	bl	@dxTexture
.org 0x21BED8C
	bl	@dxHP
.org 0x21BED46
	bl	@dxContactDamage


.org 0x21BEE34
	bl	@init
.org 0x21BF062
	bl	@aiLeafTornadoStart
.org 0x21BF11E
	bl	@moveCount
.org 0x21BF1AC
	bl	@moveLag
.org 0x21BF342
	bl	@woodLanceDamage
.org 0x21BF366
	bl	@woodLancePreLag
.org 0x21BF382
	bl	@woodLancePostLag
.org 0x21BF494
	bl	@woodLanceAttackLag
.org 0x21BF49A
	bl	@woodLanceDuration
.org 0x21BF4A0
	bl	@woodLanceAppearSpeed
	nop
.org 0x21BF4E2
	bl	@dragonRoadDamage
.org 0x21BF500
	bl	@dragonRoadPreLag
.org 0x21BF52C
	bl	@dragonRoadPostLag
.org 0x21BF90E
	bl	@leafTornadoDamage
.org 0x21BF934
	bl	@leafTornadoPreLag
.org 0x21BF950
	bl	@leafTornadoStartDelay
.org 0x21BF966
	bl	@leafTornadoNextDelay
.org 0x21BF974
	bl	@leafTornadoPostLag
.org 0x21BFB72
	bl	@floweringBurstDamagePrePostLag
.org 0x21BFD2C
	bl	@floweringBurstConfuse
.org 0x21BFD6A
	bl	@dragonCycloneDamagePreLag

.org 0x21C04CE
	bl	@leafTornadoObstacle
.org 0x21C057E
	bl	@leafTornadoCheckCollision
.org 0x21C0590
	bl	@leafTornadoHandleDamage
.org 0x21C07E2
	bl	@leafTornadoSetHP
.org 0x21BFB56
	bl	@leafTornadoAssignParent
.org 0x21C058C
	bl	@leafTornadoSpin
.org 0x21C0732
	bl	@leafTornadoAnimate
.org 0x21C059E
	bl	@leafTornadoMove


.orga readu32(TEMP+"/y9.bin", 610 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxTexture:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r2,=((1 << 0x10) | (510))
@@end:
	bl	0x2010EB8
	pop	r15
.align 2
@dxHP:
@dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r1,0x4
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r15

	.pool


.align 2
@leafTornadoAssignParent:
	bl	battle_isLegendMode
	beq	@@end

	mov	r0,0xC4
	str	r5,[r4,r0]
@@end:
	add	sp,0xC
	pop	r4-r7,r15


.align 2
@init:
	push	r14
	bl	0x21627C8
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0x0
	add	r1,=@leafTornadoStarted
	str	r0,[r1]
@@end:
	pop	r15
.align 2
@aiLeafTornadoStart:
	push	r14
	mov	r4,r0
	bl	battle_isLegendMode
	beq	@@end
	// Check Leaf Tornado used at start of battle
	add	r2,=@leafTornadoStarted
	ldr	r1,[r2]
	cmp	r1,0x0
	bne	@@end
	mov	r1,0x1
	str	r1,[r2]
	// Check level
	mov	r1,0x34
	ldrb	r1,[r4,r1]	// level
	cmp	r1,0x3
	bge	@@end
	// Use Leaf Tornado
	bl	0x21BF8FC
	add	sp,0x4
	pop	r4,r15
@@end:
	mov	r1,r4
	pop	r15
.align 2
@moveCount:
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r1]
	cmp	r2,r0
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1, 1, 1
.align 2
@leafTornadoCheckCollision:
	bl	battle_isLegendMode
	beq	@@normal
	lsr	r0,r0,0x2	// test 0x2
	bcs	@@disableCollision
	b	@@skip
@@normal:
	cmp	r0,0x0
	beq	@@skip
@@disableCollision:
	bl	0x21C0582
@@skip:
	bl	0x21C0586
.align 2
@leafTornadoSetHP:
	push	r14
	// Spawn tornado
	bl	0x21C0848
	bl	battle_isLegendMode
	beq	@@end
	cmp	r0,0x0
	beq	@@end
	ldr	r1,[@leafTornadoCurrentHP]
	mov	r2,0x4C
	strh	r1,[r0,r2]
	mov	r2,0x4E
	strh	r1,[r0,r2]
	mov	r2,0xC8
	str	r1,[r0,r2]	// previous HP

	mov	r2,0xC4
	ldr	r1,[r5,r2]	// Dragon Sky object
	str	r1,[r0,r2]	// set parent object
@@end:
	pop	r15
.align 2
@leafTornadoHandleDamage:
	// New: handle damage
	push	r14
	bl	battle_isLegendMode
	beq	@@end

	// Check already disappearing
	ldrb	r0,[r4,0x1C]
	cmp	r0,0x3
	beq	@@end

	// Check if already moving
	mov	r0,(0x16A >> 0x1)
	lsl	r0,r0,0x1
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	bne	@@setHP

	// Check parent deleted
	mov	r0,0xC4
	ldr	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@checkCollision
	mov	r1,0x4C
	ldsh	r0,[r0,r1]	// parent HP
	cmp	r0,0x0
	ble	@@disappear

@@checkCollision:
	// Handle damage
	mov	r0,r4
	mov	r1,0x0
	bl	0x2181E78

	// Spawn hit effects
	mov	r0,r4
	bl	0x21749D0

	// Check spawned
	ldrb	r0,[r4,0x1C]
	cmp	r0,0x0
	beq	@@setHP

	// Check collision disabled
	mov	r3,0xAC
	ldr	r3,[r4,r3]
	ldr	r0,[r3,0x20]
	cmp	r0,0x0
	bne	@@setHP

	// Check took damage
	mov	r2,0xC8
	ldr	r0,[r4,r2]	// previous HP
	mov	r1,0x4C
	ldsh	r1,[r4,r1]	// current HP
	cmp	r0,r1
	beq	@@disappear	// didn't take damage, so collided with player

	// Re-enable collision
	mov	r0,0x1
	str	r0,[r3,0x20]

@@setHP:
	// Set current HP
	mov	r0,0x4C
	ldsh	r0,[r4,r0]
	mov	r1,0xC8
	str	r0,[r4,r1]

	// Check HP reached 0
	cmp	r0,0x0
	bgt	@@end

	// Check if already moving
	mov	r0,(0x16A >> 0x1)
	lsl	r0,r0,0x1
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@disappear

	// Set z velocity to 0
	mov	r0,0x0
	mov	r1,0x8C
	str	r0,[r4,r1]

@@disappear:
	mov	r0,0x3
	strb	r0,[r4,0x1C]

	// Disable collision
	mov	r1,0xAC
	ldr	r1,[r4,r1]
	mov	r0,0x0
	str	r0,[r1,0x20]

@@end:
	ldrb	r0,[r4,0x1C]
	cmp	r0,0x3
	pop	r15

.align 2
@leafTornadoSpin:
	push	r14
	add	r0,r1,r0
	bl	battle_isLegendMode
	beq	@@normal

//	// Check if disappearing
//	ldrb	r1,[r4,0x1C]
//	cmp	r1,0x3
//	beq	@@normal

	// Exit if paused
	ldr	r1,=0x21ACC6C
	ldr	r1,[r1,0x30]
	lsr	r1,r1,0x1	// test 0x1
	bcc	@@end
	lsr	r1,r1,0x2	// test 0x4
	bcs	@@end
@@normal:
	str	r0,[r4,0x7C]
@@end:
	pop	r15

.align 2
@leafTornadoAnimate:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

//	// Check if disappearing
//	ldrb	r1,[r4,0x1C]
//	cmp	r1,0x3
//	beq	@@normal

	// Exit if paused
	ldr	r1,=0x21ACC6C
	ldr	r1,[r1,0x30]
	lsr	r1,r1,0x1	// test 0x1
	bcc	@@end
	lsr	r1,r1,0x2	// test 0x4
	bcs	@@end
@@normal:
	// r0 = object
	bl	0x217466C	// do animation
@@end:
	pop	r15

.align 2
@leafTornadoMove:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal

	// Check if disappearing
	ldrb	r1,[r4,0x1C]
	cmp	r1,0x3
	beq	@@normal

	// Exit if paused
	ldr	r1,=0x21ACC6C
	ldr	r1,[r1,0x30]
	lsr	r1,r1,0x1	// test 0x1
	bcc	@@end
	lsr	r1,r1,0x2	// test 0x4
	bcs	@@end
@@normal:
	lsl	r0,r0,0x10
	asr	r0,r0,0x10
	pop	r15
@@end:
	add	sp,0x4
	bl	0x21C06E0

	.pool

.align 2
@leafTornadoObstacle:
	// Old: doesn't block attacks
	// New: blocks attack
	push	r14
	mov	r3,0x2
	bl	battle_isLegendMode
	beq	@@end

	push	r0-r3

	// Set flags
	ldr	r2,[r5,0x20]
	mov	r3,(0x81000 >> 0xC)	// visible+update during dim
	lsl	r3,r3,0xC
	orr	r2,r3
	str	r2,[r5,0x20]

	pop	r0-r3

	mov	r2,0x5
	mov	r3,0x4
@@end:
	mov	r1,r5
	pop	r15
.align 2
@dragonCycloneDamagePreLag:
	// Old: 60
	// New: 30
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@dragonCycloneData
@@end:
	mov	r4,0x0
	lsl	r1,r1,0x2
	pop	r15
.align 4
@dragonCycloneData:
	// Attack, ???, pre lag
	.dh	60	:: .db	10, 30
	.dh	60	:: .db	10, 30
	.dh	60	:: .db	10, 30
	.dh	60	:: .db	10, 30
	.dh	100	:: .db	10, 30
	.dh	60	:: .db	10, 30
.align 2
@floweringBurstConfuse:
	bl	battle_isLegendMode
	beq	@@end
	cmp	r4,0x0
	beq	@@end
	mov	r2,0xAC
	ldr	r2,[r4,r2]
	cmp	r2,0x0
	beq	@@end
	mov	r0,0x34
	ldrb	r0,[r5,r0]	// level
	bl	battle_isDXBoss
	beq	@@getConfuse
	add	r0,0x2
@@getConfuse:
	add	r1,=@@data
	ldrb	r0,[r1,r0]	// confuse level
	strb	r0,[r2,0x1C]
@@end:
	pop	r3-r5,r15
.align 4
@@data:
	.db	3, 3, 3, 3, 3, 3
.align 2
@floweringBurstDamagePrePostLag:
	// Old: 15, 12, 10, 25 (pre)
	// New: 10, 8, 6, 10
	// Old: 15, 15, 15, 25 (post)
	// New: 10, 8, 6, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r0,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@floweringBurstData
@@end:
	mov	r3,0x0
	lsl	r1,r0,0x2
	pop	r15
.align 4
@floweringBurstData:
	.dh	150	:: .db	10, 10
	.dh	250	:: .db	8, 8
	.dh	350	:: .db	6, 6
	.dh	70	:: .db	10, 10
	.dh	600	:: .db	5, 5
	.dh	70	:: .db	10, 10
.align 2
@leafTornadoDamage:
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x18
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@leafTornadoData
	add	r1,0x4
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,0x4E
	pop	r15
.align 2
@leafTornadoPreLag:
	// Old: 15, 10, 5, 15
	// New: 7, 4, 1, 7
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r4,0x18
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	// Set Leaf Tornado HP
	add	r3,=@leafTornadoHP
	mov	r5,0x34
	ldrb	r5,[r0,r5]	// level
	bl	battle_isDXBoss
	beq	@@getHP
	add	r5,0x2
@@getHP:
	lsl	r5,r5,0x1
	ldrh	r3,[r3,r5]
	add	r5,=@leafTornadoCurrentHP
	strh	r3,[r5]
	// Get pre lag data
	add	r3,=@leafTornadoData
	add	r3,0x6
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r1
	pop	r15
.align 2
@leafTornadoPostLag:
	// Old: 25, 25, 25, 15
	// New: 10, 7, 4, 10; <50% HP: 25
	push	r6-r7,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x18
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@leafTornadoData
	add	r1,0x7
	// Check HP
	mov	r6,0x4C
	mov	r7,0x4E
	ldsh	r6,[r0,r6]	// current HP
	ldsh	r7,[r0,r7]	// max HP
	asr	r7,r7,0x1
	cmp	r6,r7
	bge	@@end
	mov	r2,(25)
	b	@@end2
@@end:
	ldrb	r2,[r1,r2]
@@end2:
	lsl	r1,r3,0x5
	pop	r6-r7,r15
.align 2
@leafTornadoStartDelay:
	// Old: 15, 10, 5, 15
	// New: 7, 4, 1, 7; >=50% HP: 240
	push	r6-r7,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r5,0x18
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r4,=@leafTornadoData
	add	r4,0x8
	// Check HP
	mov	r6,0x4C
	mov	r7,0x4E
	ldsh	r6,[r0,r6]	// current HP
	ldsh	r7,[r0,r7]	// max HP
	asr	r7,r7,0x1
	cmp	r6,r7
	blt	@@end
	mov	r5,(240)
	b	@@end2
@@end:
	ldrb	r5,[r4,r5]
@@end2:
	mov	r4,r1
	pop	r6-r7,r15
.align 2
@leafTornadoNextDelay:
	// Old: 15, 15, 15, 15
	// New: 15, 15, 15, 15; >=50% HP: 25
	push	r6-r7,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r5,0x18
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r4,=@leafTornadoData
	add	r4,0x9
	// Check HP
	mov	r6,0x4C
	mov	r7,0x4E
	ldsh	r6,[r0,r6]	// current HP
	ldsh	r7,[r0,r7]	// max HP
	asr	r7,r7,0x1
	cmp	r6,r7
	blt	@@end
	mov	r4,(25)
	b	@@end2
@@end:
	ldrb	r4,[r4,r5]
@@end2:
	str	r4,[r0,r1]
	pop	r6-r7,r15
.align 4
@leafTornadoData:
	// speed		// damage	// pre/post/start/next lag
	.dw	(20 << 0xC)/3	:: .dh	150	:: .db	7, 10, 7, 15	:: .align 4
	.dw	(20 << 0xC)/3	:: .dh	250	:: .db	4,  7, 4, 15	:: .align 4
	.dw	(20 << 0xC)/3	:: .dh	350	:: .db	1,  4, 1, 15	:: .align 4
	.dw	(20 << 0xC)/3	:: .dh	 70	:: .db	7,  1, 7, 15	:: .align 4
	.dw	(20 << 0xC)/3	:: .dh	600	:: .db	1,  1, 1, 15	:: .align 4
	.dw	(20 << 0xC)/3	:: .dh	 70	:: .db	7, 10, 7, 15	:: .align 4
.align 4
@leafTornadoCurrentHP:
	.dw	9999
.align 4
@leafTornadoHP:
	.dh	100, 120, 150, 1, 180, 1
.align 4
@leafTornadoStarted:
	.dw	0x0

	.pool

.align 2
@dragonRoadDamage:
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x8
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@dragonRoadData
@@end:
	ldsh	r0,[r0,r1]
	mov	r1,0x4E
	pop	r15
.align 2
@dragonRoadPreLag:
	// Old: 15, 10, 5, 25
	// New: 9, 7, 5, 12
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x8
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@dragonRoadData
	add	r0,0x2
@@end:
	ldrb	r0,[r0,r2]
	str	r0,[r4,r1]
	pop	r15
.align 2
@dragonRoadPostLag:
	// Old: 15, 15, 15, 25
	// New: 9, 7, 5, 9
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x8
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@dragonRoadData
	add	r0,0x3
@@end:
	ldrb	r0,[r0,r2]
	mov	r2,0xFF
	pop	r15
.align 4
@dragonRoadData:
	// damage	// pre/postlag
	.dh	150	:: .db	8, 9
	.dh	250	:: .db	6, 7
	.dh	350	:: .db	4, 5
	.dh	70	:: .db	8, 9
	.dh	600	:: .db	3, 5
	.dh	70	:: .db	8, 9
.align 2
@woodLanceDamage:
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@woodLanceData
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,0x4E
	pop	r15
.align 2
@woodLancePreLag:
	// Old: 15, 10, 5, 25
	// New: 7, 4, 1, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r4,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@woodLanceData
	add	r3,0x2
@@end:
	ldrb	r4,[r3,r4]
	mov	r3,r1
	pop	r15
.align 2
@woodLancePostLag:
	// Old: 15, 15, 15, 25
	// New: 7, 4, 1, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r4,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@woodLanceData
	add	r2,0x3
@@end:
	ldrb	r2,[r2,r4]
	str	r2,[r0,r1]
	pop	r15
.align 2
@woodLanceAttackLag:
	// Old: 10, 8, 6, 10
	// New: 7, 6, 4, 7
	push	r0,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r0,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@woodLanceData
	add	r2,0x4
@@end:
	ldrh	r2,[r2,r0]
	str	r2,[sp,0x8]
	pop	r0,r15
.align 2
@woodLanceDuration:
	// Old: 8, 6, 4, 8
	// New: 5, 4, 3, 5
	push	r0,r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r0,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@woodLanceData
	add	r2,0x6
@@end:
	ldrh	r2,[r2,r0]
	str	r2,[sp,(0x8+0x4)]
	pop	r0,r15
.align 2
@woodLanceAppearSpeed:
	// Old: 6, 5, 4, 6
	// New: 4, 3, 3, 4
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r0,0x14
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r2,=@woodLanceData
	add	r2,0x8
@@end:
	ldrh	r0,[r2,r0]
	mov	r2,sp		// normally does -4 after
	pop	r15
.align 4
@woodLanceData:
	// damage	// pre/postlag	// delay, time on field, appear speed
	.dh	100	:: .db	 7,  7	:: .dh	7, 5, 6
	.dh	150	:: .db	 4,  4	:: .dh	6, 4, 5
	.dh	250	:: .db	 1,  1	:: .dh	4, 3, 3
	.dh	40	:: .db	10, 10	:: .dh	7, 5, 6
	.dh	500	:: .db	 1,  1	:: .dh	4, 3, 3
	.dh	40	:: .db	10, 10	:: .dh	7, 3, 6
.align 2
@moveLag:
	// Old: 5, 5, 5, 5
	// New: 1, 1, 1, 1
	push	r14
	sub	r1,0xC
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r2,0x2
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r0,[r0,r2]
	pop	r15
.align 4
@@data:
	.db	1, 1, 1, 1, 1, 1


.endarea
.close
