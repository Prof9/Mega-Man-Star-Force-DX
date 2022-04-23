// Overlay 609 - Pegasus Magic

.nds
.open TEMP+"/overlay_0609.bin",readu32(TEMP+"/y9.bin", 609 * 0x20 + 0x4)
.thumb


.org 0x21C011E	// HP
	.dh	2300, 2800, 3400, 900, 5500, 800
.org 0x21C012A	// Contact damage
	.dh	100, 150, 250, 20, 500, 20
.org 0x21C00FA	// Frost Missiles damage
	.dh	100, 150, 250, 20, 500, 20
.org 0x21C0168	// Star Road damage
	.dh	150, 250, 350, 40, 700, 40
.org 0x21C00EE	// Blizzard damage
	.dh	150, 250, 350, 150, 700, 150
.org 0x21C0112	// Ice Edge damage
	.dh	150, 250, 350, 150, 700, 150
.org 0x21C0144	// Pegasus Freeze damage
	.dh	600, 600, 600, 600, 1000, 600

.org 0x21C0290	// Frost Missiles pre lag
	.db	20, 18, 10, 23, 9, 23
.org 0x21C0260	// Star Road pre lag
	.db	5, 3, 1, 5, 1, 5
.org 0x21C0278	// Star Road post lag
	.db	15, 10, 5, 15, 3, 15
.org 0x21C01F4	// Star Road speed
	.dw	64, 72, 80, 64, 86, 64
.org 0x21C0268	// Blizzard pre lag
	.db	15, 10, 5, 30, 3, 30
.org 0x21C0258	// Blizzard length
	.db	30, 30, 30, 30, 30, 30
.org 0x21C0248	// Blizzard post lag
	.db	15, 15, 15, 30, 10, 30
.org 0x21C0298	// Ice Edge pre lag
	.db	10, 8, 1, 15, 1, 15
.org 0x21C0250	// Ice Edge post lag
	.db	15, 10, 5, 15, 3, 15
.org 0x21C0150	// Pegasus Freeze pre lag
	.dh	60, 60, 60, 60, 60, 60


.org 0x21BECD6
	bl	@dxTexture
.org 0x21BECE8
	bl	@dxTexture
.org 0x21BED3C
	bl	@dxHP
.org 0x21BEC92
	bl	@dxContactDamage
.org 0x21BF84A
	bl	@dxFrostMissiles
.org 0x21BF9DE
	bl	@dxStarRoad
.org 0x21BFC26
	bl	@dxBlizzard
.org 0x21BFD9A
	bl	@dxIceEdge
.org 0x21BFF50
	bl	@dxPegasusFreeze


.org 0x21BEE42
	bl	@advanceAnimation
.org 0x21BEFBA
	bl	@aiBlizzardIceEdge
.org 0x21BEF24
	bl	@aiComboStarRoad
.org 0x21BF840
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF85A
	bl	@frostMissilesPreLag
.org 0x21BF880
	pop	r15
.org 0x21BF95C
	bl	@frostMissilesShield
.org 0x21BF9D4
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFA00
	bl	@starRoadPreLag
.org 0x21BFA10
	bl	@starRoadPostLag
.org 0x21BFA22
	bl	@starRoadSpeed
.org 0x21BFA44
	pop	r15
.org 0x21BFC1C
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFC38
	bl	@blizzardCounterFrames
.org 0x21BFC48
	bl	@blizzardPreLag
.org 0x21BFC58
	bl	@blizzardLength
.org 0x21BFC68
	bl	@blizzardPostLag
.org 0x21BFC8A
	pop	r15
.org 0x21BFD90
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFDAA
	bl	@iceEdgePreLag
.org 0x21BFDBA
	bl	@iceEdgePostLag
.org 0x21BFE14
	bl	@iceEdgeSetupDouble
.org 0x21BFF44
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BFF82
	bl	@pegasusFreezePreLag
.org 0x21BFF86
	pop	r15

//.org 0x21BF4F4
.org 0x21BF4FA
	bl	@blizzardSpawnIcePanels
.org 0x21BF566
	bl	@blizzardSkipPostLag

.org 0x21BF5A8
	bl	@iceEdgeChoosePanel
.org 0x21BF5E4
	bl	@iceEdgeMove
.org 0x21BF68E
	bl	@iceEdgeDouble


.orga readu32(TEMP+"/y9.bin", 609 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


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
.align 2
@dxFrostMissiles:
@dxStarRoad:
@dxBlizzard:
@dxPegasusFreeze:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x4
@@end:
	ldsh	r1,[r1,r2]
	mov	r2,0x4E
	pop	r15
.align 2
@dxIceEdge:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x4
@@end:
	ldsh	r2,[r1,r2]
	mov	r1,0x4E
	pop	r15
.align 2
@dxTexture:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r2,=((1 << 0x10) | (509))
@@end:
	bl	0x2010EB8
	pop	r15


.align 2
@frostMissilesShield:
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	mov	r0,0xAC
	ldr	r0,[r7,r0]
	cmp	r0,0x0
	beq	@@end
	mov	r1,0x2
	ldr	r2,[r0,0x2C]
	orr	r2,r1
	str	r2,[r0,0x2C]
@@end:
	mov	r0,0x0
	ldsb	r0,[r6,r0]
	pop	r15


.align 2
@aiBlizzardIceEdge:
	push	r2,r7,r14
	add	r0,r2,0x2
	ldrb	r7,[r4,r0]
	bl	battle_isLegendMode
	beq	@@end

@@checkIcePanels:
	// Always use Blizzard if there are no ice panels
	bl	@countIcePanels
	cmp	r0,0x0
	bgt	@@checkRepeat

	mov	r7,0x0
	b	@@end

@@checkRepeat:
	// 1-in-3 chance to repeat the attack
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	lsr	r0,r0,0x1
	mov	r1,0x3
	blx	0x208985C	// mod s32
	cmp	r0,0x0
	bne	@@end

	mov	r0,0x1
	eor	r7,r0

@@end:
	mov	r0,r7
	pop	r2,r7,r15
.align 2
@advanceAnimation:
	push	r0,r14
	bl	0x217466C	// advance animation
	pop	r0

	// Make Star Road wind-up animation twice as fast
	mov	r1,0x31
	ldrb	r1,[r0,r1]	// animation
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x5
	bne	@@end
	bl	0x217466C	// advance animation
@@end:
	pop	r15

.align 2
@aiComboStarRoad:
	mov	r2,0x0
	strb	r2,[r1,0xC]
	bl	battle_isLegendMode
	beq	@@normal

	// Get player object
	mov	r0,r4
	mov	r1,0x0
	bl	0x21753B4
	cmp	r0,0x0
	beq	@@normal

	// Check player frozen
	mov	r1,0xAC
	ldr	r1,[r0,r1]	// collision
	cmp	r1,0x0
	beq	@@normal
	ldr	r1,[r1,0x2C]	// status effects
	lsr	r1,r1,0x6	// test 0x20
	bcc	@@normal

	// Check player in range
	mov	r1,0x69
	ldrb	r0,[r0,r1]	// player y
	mov	r1,0x5		// y
	mov	r2,0x30
	ldrb	r2,[r4,r2]	// own alignment
	cmp	r2,0x0
	beq	@@checkY
	mov	r1,0x1		// y
@@checkY:
	cmp	r0,r2
	bne	@@normal

	// Start Star Road
	bl	0x21BEFA0

@@normal:
	mov	r0,r4
	bl	0x21BEF28
.align 2
@blizzardSpawnIcePanels:
	push	r7,r15
	bl	0x21BFD70

	bl	battle_isLegendMode
	beq	@@end

	mov	r7,0x1
@@loop:
	// Calculate panel data address
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// alignment
	mov	r1,0x5		// y
	cmp	r0,0x0
	beq	@@calc
	mov	r1,0x1		// y
@@calc:
	mov	r0,0xFC
	mul	r0,r7		// x
	mov	r2,0x24
	mul	r1,r2		// y
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r0,r0,r1

	// Set panel
	mov	r1,0x5		// ice panel
	bl	0x218FBF0	// set panel

	add	r7,0x1
	cmp	r7,0x3
	ble	@@loop

@@end:
	pop	r7,r15
.align 2
@blizzardSkipPostLag:
	ldr	r1,[r4,r1]	// original
	push	r0-r1,r14
	bl	battle_isLegendMode
	beq	@@end

	// Get player object
	mov	r0,r4
	mov	r1,0x0
	bl	0x21753B4
	cmp	r0,0x0
	beq	@@normal

	// Check player frozen
	mov	r1,0xAC
	ldr	r1,[r0,r1]	// collision
	cmp	r1,0x0
	beq	@@normal
	ldr	r1,[r1,0x2C]	// status effects
	lsr	r1,r1,0x6	// test 0x20
	bcc	@@normal

	mov	r1,0x0
	b	@@end

@@normal:
	ldr	r1,[sp,0x4]	// original
@@end:
	cmp	r3,r1
	pop	r0-r1,r15
.align 2
@iceEdgeChoosePanel:
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,=@iceEdgeCount
	ldr	r1,[r1]
	cmp	r1,0x0
	beq	@@normal

	// Don't choose panel second time
	bl	0x21BF5C8

@@normal:
	bl	0x21BF760
	bl	0x21BF5AC
.align 2
@iceEdgeMove:
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,=@iceEdgeCount
	ldr	r1,[r1]
	cmp	r1,0x0
	beq	@@normal

	// Don't move second time
	// Set animation
	mov	r0,0x8B
	mov	r1,0x31
	strb	r0,[r4,r1]

	bl	0x21BF61A
@@normal:
	mov	r1,r4
	ldrh	r2,[r4,r0]
	bl	0x21BF5E8
.align 2
@iceEdgeSetupDouble:
	add	r1,=@iceEdgeCount
	mov	r0,0x0
	str	r0,[r1]
	pop	r15
.align 2
@iceEdgeDouble:
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,=@iceEdgeCount
	ldr	r0,[r1]
	add	r0,0x1
	str	r0,[r1]
	cmp	r0,0x2
	bge	@@normal

	// Back to original state
	mov	r0,0x0
	b	@@end

@@normal:
	// Next state
	ldrb	r0,[r4,0x1E]
	add	r0,0x1
@@end:
	pop	r15
.align 4
@iceEdgeCount:
	.dw	0x0


.align 2
@pegasusFreezePreLag:
	// Old: 60, 60, 60, 60
	// New: 30, 30, 30, 30
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x4
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r1,[r1,r3]
	str	r1,[r0,r2]
	pop	r15
.align 4
@@data:
	.dh	30, 30, 30, 30, 30, 30
.align 2
@iceEdgePostLag:
	// Old: 15, 10, 5, 15
	// New: 8, 5, 3, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	8, 5, 3, 10, 1, 10
.align 2
@iceEdgePreLag:
	// Old: 10, 8, 1, 15
	// New: 5, 4, 1, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	5, 4, 1, 10, 1, 10
.align 2
@blizzardPostLag:
	// Old: 15, 15, 15, 30
	// New: 10, 7, 3, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	10, 7, 3, 10, 1, 10
.align 2
@blizzardLength:
	// Old: 30, 30, 30, 30
	// New: 15, 15, 15, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	15, 15, 15, 15, 15, 15
.align 2
@blizzardPreLag:
	// Old: 15, 10, 5, 30
	// New: 10, 7, 3, 15
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	10, 7, 3, 15, 1, 15
.align 2
@blizzardCounterFrames:
	// Old: 6, 6, 6, 6
	// New: 4, 4, 4, 4
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
.align 2
@starRoadSpeed:
	// Old: 64, 72, 80, 64
	// New: 72, 78, 84, 72
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x8
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
	.dw	72, 78, 84, 72, 90, 72
.align 2
@starRoadPostLag:
	// Old: 15, 10, 5, 15
	// New: 8, 6, 3, 10
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	8, 6, 3, 10, 1, 10
.align 2
@starRoadPreLag:
	// Old: 5, 3, 1, 5
	// New: 5, 3, 1, 5
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	5, 3, 1, 5, 1, 5
.align 2
@frostMissilesPreLag:
	// Old: 20, 18, 10, 23
	// New: 14, 12, 8, 16
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x2
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
	.db	14, 12, 8, 16, 7, 16


@countIcePanels:
	// Count number of ice panels in player row
	// Returns r0 = number of ice panels
	push	r4-r5,r14
	mov	r4,0x1		// x
	mov	r5,0x0		// count

@@loop:
	mov	r0,r4
	mov	r1,0x1
	bl	@isIcePanel
	cmp	r0,0x0
	beq	@@next

	add	r5,0x1
@@next:
	add	r4,0x1
	cmp	r4,0x3
	ble	@@loop

	mov	r0,r5
	pop	r4-r5,r15

@isIcePanel:
	// Input r0 = x, r1 = y
	// Returns r0 = is ice panel (0 or 1)
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

	// Check ice panel
	ldrb	r0,[r1,0xA]
	cmp	r0,0x5
	bne	@@returnFalse

	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	bx	r14


	.pool

.aligna 32
.endarea
.close
