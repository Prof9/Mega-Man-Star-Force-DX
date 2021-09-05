// Overlay 611 - Leo Kingdom

.nds
.open TEMP+"/overlay_0611.bin",readu32(TEMP+"/y9.bin", 611 * 0x20 + 0x4)
.thumb

.org 0x21C1338	// HP
	// Shadow: 800 -> 1500
	.dh	2200, 2700, 3500, 1500, 5500, 9999
.org 0x21C132C	// Magma Ball damage
	// Shadow: 30 -> 60
	.dh	100, 150, 250, 60, 500, 1
.org 0x21C12FC	// Gigant Press damage
	// Shadow: 50 -> 100
	.dh	150, 250, 350, 100, 700, 1
.org 0x21C1344	// Contact damage
	// Shadow: 30 -> 60
	.dh	100, 150, 250, 60, 500, 9999
.org 0x21C1308	// Flame Tail damage
	.dh	150, 250, 350, 1, 700, 1
.org 0x21C1320	// Volcano Claws damage
	.dh	150, 250, 350, 1, 700, 1
.org 0x21C12E4	// Leo Blazer damage
	.dh	600, 600, 600, 1, 1000, 1

.org 0x21C12B4	// Move lag
	.db	10, 5, 1, 10, 1, 1
.org 0x21C129C	// Magma Ball pre lag
	.db	15, 10, 1, 15, 1, 1
.org 0x21C1274	// Magma Ball post lag
	// Shadow: 25 -> 15
	.db	15, 10, 5, 15, 1, 1
.org 0x21C127C	// Gigant Press pre lag
	.db	13, 10, 8, 15, 6, 1
.org 0x21C12BC	// Gigant Press post lag
	// Shadow: 20 -> 15
	.db	15, 10, 5, 15, 3, 1
.org 0x21C1284	// Flame Tail pre lag
	// Shadow: 60 -> 30
	.db	30, 10, 8, 30, 6, 1
.org 0x21C125C	// Flame Tail post lag
	// Shadow: 60 -> 30
	.db	30, 20, 10, 30, 5, 1
.org 0x21C12C4	// Volcano Claws pre lag
	// Shadow: 60 -> 15
	.db	15, 10, 5, 15, 3, 1
.org 0x21C126C	// Volcano Claws count
	// Shadow: 1 -> 2
	.db	2, 2, 3, 2, 3, 1
.org 0x21C12D4	// Volcano Claws post lag
	// Shadow: 60 -> 15
	.db	15, 10, 5, 15, 3, 1
.org 0x21C1538	// Volcano Claws pre/post lag
	// Shadow: 30, 30 -> 15, 12
	.db	15, 12	:: .skip 6
	.db	15, 10	:: .skip 6
	.db	15, 8	:: .skip 6
	.db	15, 12	:: .skip 6
	.db	13, 6	:: .skip 6
	.db	15, 15	:: .skip 6


.org 0x21BEC9A
	bl	leo_dxModel
.org 0x21BECF8
	bl	leo_dxHP
.org 0x21BED60
	bl	leo_dxContactDamage
.org 0x21BFAC6
	bl	leo_dxContactDamage_r4
.org 0x21C0690
	bl	leo_dxContactDamage_r4
.org 0x21C0784
	bl	leo_dxContactDamage_r4
.org 0x21C087A
	bl	leo_dxContactDamage_r4
.org 0x21C0968
	bl	leo_dxContactDamage_r4
.org 0x21C0A5C
	bl	leo_dxContactDamage_r4
.org 0x21BF360
	bl	leo_dxMagmaBall
.org 0x21BF77A
	bl	leo_dxGigantPress
.org 0x21BFBD2
	bl	leo_dxFlameTail
.org 0x21BFF02
	bl	leo_dxVolcanoClaw
.org 0x21C0516
	bl	leo_dxLeoBlazer
.org 0x21C0FA6
	bl	leo_dxModelClaw


.org 0x21BF622
	bl	leo_magmaBallCounter
.org 0x21BF658
	bl	leo_magmaBallTarget
.org 0x21BF6E8
	bl	leo_magmaBallTriple

.org 0x21BF0A0
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BF0A8
	bl	leo_moveLag
.org 0x21BF0B0
	pop	r15
.org 0x21BF328
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BF330
	bl	leo_magmaBallPreLag
.org 0x21BF340
	bl	leo_magmaBallPostLag
.org 0x21BF364
	pop	r15
.org 0x21BF750
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BF758
	bl	leo_gigantPressPreLag
.org 0x21BF768
	bl	leo_gigantPressPostLag
.org 0x21BF77E
	pop	r15
.org 0x21BFBA8
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BFBB0
	bl	leo_flameTailPreLag
.org 0x21BFBC0
	bl	leo_flameTailPostLag
.org 0x21BFBD6
	pop	r15
.org 0x21BFEBC
	push	r14
	mov	r1,0x34
	ldrb	r2,[r0,r1]
.org 0x21BFEC4
	bl	leo_volcanoClawPreLag
.org 0x21BFED4
	bl	leo_volcanoClawPostLag
.org 0x21BFEF0
	bl	leo_volcanoClawCount
.org 0x21BFF06
	pop	r15
.org 0x21C050C
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21C051E
	bl	leo_leoBlazerPreLag
.org 0x21C0524
	pop	r15

.org 0x21BFA44
	bl	leo_gigantPressGravity
.org 0x21C10FA
	bl	leo_volcanoClawSwipePreLag
.org 0x21C11D2
	bl	leo_volcanoClawSwipePostLag


.org 0x21BFB22	// Fix animation loop when you die from Gigant Press
	mov	r1,0x89		// from 0x9

.close
