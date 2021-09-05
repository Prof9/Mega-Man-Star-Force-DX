.align 2
battleObj_gaugeCard_init:
	// [sp] = parent
	push	r4-r7,r14
	mov	r5,r0		// object
	mov	r4,r1		// parameter
	mov	r6,r2		// complete flag
	mov	r7,r3		// card flags

	// Call own object constructor
	ldr	r2,[r5]
	ldr	r2,[r2,0x18]
//	mov	r0,r5
	mov	r1,0x0
	blx	r2

	// Set ???
	mov	r0,0x2
	str	r0,[r5,0x14]

	// Set parent
	ldr	r0,[sp,(5 * 0x4)]
	mov	r1,0xB0
	str	r0,[r5,r1]

	// Copy alignment from parent
	mov	r1,0x30
	ldrb	r0,[r0,r1]
	strb	r0,[r5,r1]

	// Set parameter
	mov	r1,(0x164 >> 0x2)
	lsl	r1,r1,0x2
	str	r4,[r5,r1]

	// Set complete flag location
	add	r1,0x4		// 0x168
	str	r6,[r5,r1]

	// Set card flags
	str	r7,[r5,0x50]

	// Set entity flags
	ldr	r1,[r5,0x20]
	mov	r0,0x1
	lsl	r0,r0,0xC
	orr	r1,r0
	str	r1,[r5,0x20]

	pop	r4-r7,r15

@spawn:
	push	r3,r14

	mov	r1,0x1		// 1 = spawned
	str	r1,[r0,0x18]	// spawn state

	mov	r1,0x0
	strb	r1,[r0,0x1C]	// action state

	ldr	r1,[r0]
	ldr	r1,[r1,0x10]	// update function
	blx	r1

	mov	r0,0x1
	pop	r3,r15


@despawn:
	mov	r0,0x0
	bx	r14


@update:
	push	r4,r14
	sub	sp,0x8
	mov	r4,r0		// r4 = this

	ldrb	r1,[r4,0x1C]	// state
	cmp	r1,0x1
	blt	@@state0
	beq	@@state1
	cmp	r1,0x3
	blt	@@state2
	beq	@@state3
	bgt	@@state4

@@state0:
	mov	r1,0x12
	bl	0x2162898	// start dim
	b	@@end

@@state1:
	// Wait for cut-in
	mov	r1,0x30
	ldrb	r1,[r4,r1]
	ldr	r0,=0x21ACCA8
	lsl	r2,r1,0x1
	ldrh	r2,[r0,r2]
	mov	r3,0x0
	str	r3,[sp]
	str	r3,[sp,0x8]
	mov	r0,r4
	bl	0x21629FC
	b	@@end

@@state2:
	mov	r1,0x3		// state to go to if aborted
	bl	0x2162C0C
	cmp	r0,0x0
	beq	@@end

	mov	r0,r4
	bl	@doGauge

	b	@@end

@@state3:
	mov	r1,0x12
	bl	0x2162954	// end dim
	b	@@end

@@state4:
	// Set completed
	mov	r1,(0x168 >> 0x2)
	lsl	r1,r1,0x2
	ldr	r1,[r4,r1]	// complete flag
	mov	r0,0x1
	str	r0,[r1]

	// Despawn
	mov	r0,0x2
	str	r0,[r4,0x18]

@@end:
	mov	r0,0x1
	add	sp,0x8
	pop	r4,r15


@doGauge:
	push	r4,r14
	sub	sp,0x8
	mov	r4,r0		// this

	ldrb	r0,[r4,0x1D]	// substate
	cmp	r0,0x0
	bne	@@state1

@@state0:
	// Change Custom Gauge speed
	mov	r0,(0x164 >> 0x2)
	lsl	r0,r0,0x2
	ldr	r0,[r4,r0]	// parameter

	cmp	r0,0x1
	blt	@@normalGauge
	beq	@@quickGauge
	bgt	@@slowGauge

@@normalGauge:
	mov	r0,0x40
	b	@@setGauge

@@quickGauge:
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_QUICKGAUGE
	bl	0x2025574

	mov	r0,0x80		// 200% speed
	b	@@setGauge

@@slowGauge:
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	ldr	r1,=SE_SLOWGAUGE
	bl	0x2025574

	mov	r0,0x2B		// 67% speed
//	b	@@setGauge

@@setGauge:
	ldr	r1,=(0x21B01D0 + 0x82)
	strh	r0,[r1]

	// Set timer
	mov	r0,0x20
	mov	r1,(0x15C >> 0x2)
	lsl	r1,r1,0x2
	str	r0,[r4,r1]	// timer

	// Set substate
	mov	r0,0x1
	strb	r0,[r4,0x1D]

	b	@@end

@@state1:
	mov	r1,(0x15C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r4,r1]	// timer
	lsr	r0,r0,0x4	// test 0x8
	bcc	@@decTimer

	// Draw arrow sprite
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	ldr	r2,=0xB0D0001C
	ldr	r3,=0x907C
	bl	0x1FF8F40

@@decTimer:
	// Decrement timer
	mov	r1,(0x15C >> 0x2)
	lsl	r1,r1,0x2
	ldr	r0,[r4,r1]	// timer
	sub	r0,0x1
	str	r0,[r4,r1]
	bne	@@end

	// Go to next state
	mov	r0,0x3
	str	r0,[r4,0x1C]

@@end:
	add	sp,0x8
	pop	r4,r15


	.pool


.align 4
battleObj_gaugeCard_funcs:
	.dw	0x2174F18|1		// function 0x00 - object tick
	.dw	0x21750EC|1		// function 0x04 - position/visibility updater
	.dw	0x2015758|1		// function 0x08 - unused?
	.dw	@spawn|1		// function 0x0C - object spawn
	.dw	@update|1		// function 0x10 - object update
	.dw	@despawn|1		// function 0x14 - object despawn
	.dw	0x216283C|1		// function 0x18 - object constructor
	.dw	0x2174E9C|1		// function 0x1C - object destructor
	.dw	0x21750E8|1		// function 0x20 - run every frame while object exists
	.dw	0x2150464|1		// function 0x24 - panel position getter
	.dw	0x2154F9C|1		// function 0x28 - get old position
	.dw	0x2154F8C|1		// function 0x2C - get new position
	.dw	0x2154F7C|1		// function 0x30 - get rotation
