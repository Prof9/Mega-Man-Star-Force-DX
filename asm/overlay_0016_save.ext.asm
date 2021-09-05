save_chooseSaveMugshot1:
	mov	r1,0x0
	mov	r2,0x0
	b	save_chooseSaveMugshotCommon
save_chooseSaveMugshot2:
	mov	r1,0xD
	mov	r2,0x0
//	b	save_chooseSaveMugshotCommon
save_chooseSaveMugshotCommon:
	push	r0-r6,r14
	sub	sp,0xC		// allocate up to 12

	add	r4,=@@possibleMugshots
	mov	r5,0x0		// total
	mov	r6,sp		// index
@@checkLoop:
	ldrh	r0,[r4]		// mugshot
	cmp	r0,0x0
	beq	@@chooseRandom

@@checkStory:
	// Check story progress
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0,0x2]	// current chapter
	ldrb	r1,[r4,0x5]	// min chapter
	ldrb	r2,[r4,0x6]	// max chapter
	cmp	r0,r1
	blt	@@checkSkip
	cmp	r0,r2
	bgt	@@checkSkip

@@checkFlag:
	// Check flag
	ldrh	r1,[r4,0x2]	// flag
	cmp	r1,0x0
	beq	@@checkAdd
	bl	0x202409C
	cmp	r0,0x0
	beq	@@checkSkip

@@checkAdd:
	// Add to list
	ldrb	r0,[r4,0x4]	// rate
	b	@@checkNext

@@checkSkip:
	mov	r0,0x0		// rate = 0
@@checkNext:
	add	r5,r5,r0	// add to total
	strb	r0,[r6]

	add	r4,0x8
	add	r6,0x1
	b	@@checkLoop

@@chooseRandom:
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,r5
	blx	0x208985C	// r0 = r % total

	mov	r2,sp
	mov	r3,0x0		// index
@@rateLoop:
	ldrb	r1,[r2,r3]	// rate
	cmp	r0,r1
	blt	@@found
	add	r3,0x1
	sub	r0,r0,r1
	b	@@rateLoop

@@found:
	lsl	r3,r3,0x3
	add	r1,=@@possibleMugshots
	ldrh	r1,[r1,r3]	// mugshot
	cmp	r1,0x5A
	bne	@@buffer

	// Get Geo mugshot based on mood
	bl	0x2009504
	mov	r1,r0

@@buffer:
	// Buffer mugshot
	mov	r0,0x4		// extra buffer should be unused
	bl	0x2008DF0

	add	sp,0xC
	pop	r0-r6,r15

.align 4
@@possibleMugshots:
	//	mugshot	flag		ratio	chapter range
	.dh	0x5A,	0x0000	:: .db	3,	0x00,	0xFF	:: .align 4	// Geo
	.dh	0x1AE,	0x0000	:: .db	3,	0x02,	0x5F	:: .align 4	// Omega-Xis
	.dh	0x1AE,	0x0812	:: .db	3,	0x61,	0xFF	:: .align 4	// Omega-Xis
	.dh	0x6E,	0x0000	:: .db	2,	0x30,	0x60	:: .align 4	// Sonia
	.dh	0x6E,	0x0814	:: .db	2,	0x61,	0xFF	:: .align 4	// Sonia
	.dh	0x73,	0x0000	:: .db	2,	0x50,	0x60	:: .align 4	// Luna
	.dh	0x73,	0x0818	:: .db	2,	0x61,	0xFF	:: .align 4	// Luna
	.dh	0x78,	0x0818	:: .db	2,	0x61,	0xFF	:: .align 4	// Bud
	.dh	0x7D,	0x186D	:: .db	2,	0x64,	0xFF	:: .align 4	// Zack
	.dh	0x9B,	0x0D2C	:: .db	1,	0x00,	0xFF	:: .align 4	// Shin
	.dh	0x0000