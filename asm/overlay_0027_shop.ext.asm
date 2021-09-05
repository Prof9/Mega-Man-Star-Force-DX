.align 2
shop_bufferCardPrice:
	push	r14
	sub	sp,0xC		// allocate shop item data

	ldr	r1,[r3,0x8]	// price
	mov	r0,0x4		// buffer
	bl	0x2008DF0	// set in buffer

	mov	r0,0x1
	str	r0,[r4,0x70]
	add	sp,0xC
	pop	r15


.align 2
shop_cardDescription:
	lsr	r2,r2,0x18
	lsr	r3,r3,0x1D
	push	r0,r2-r3,r14

	// Check if Star Card
	cmp	r1,(170)
	bgt	@@end
	cmp	r2,0x2		// mega
	bne	@@end

	// Get description
	ldr	r0,=data_extraCardInfo
	lsl	r2,r1,0x1
	ldrh	r3,[r0,r2]		// &FF00 = flags
	lsr	r3,r3,(0x8 + 0x4)	// check flag 0x8
	bcc	@@end

	ldrb	r0,[r0,r2]
	cmp	r0,0x0
	beq	@@end
	add	r0,0xFF
	add	r0,r0,0x1

	// Pack into 32 bit together with original card ID
	lsl	r0,r0,0x10
	add	r1,r1,r0

@@end:
	pop	r0,r2-r3,r15


.align 2
shop_cardNameInBuffer:
	add	r3,sp,0x14

	// Check if possible Star Card
	ldrh	r1,[r3,0x2]
	cmp	r1,(170)
	bgt	@@end

	// Check if Mega Class
	ldrb	r0,[r3,0x4]
	cmp	r0,0x2
	bne	@@end

	// Set Star Card name
	add	r1,(0x100 + 50 - 1 - 0xFF)
	add	r1,0xFF
@@end:
	bx	r14

.align 2
shop_cardColorInBuffer:
	push	r14
	add	r3,sp,(0x14 + 1*0x4)

	// Check if Mega Class
	ldrb	r1,[r3,0x4]
	cmp	r1,0x2
	bne	@@end

	// Check if Star Card
	ldrh	r0,[r3,0x2]
	cmp	r0,(170)
	bgt	@@end

	// Set fake color
	mov	r1,0x0		// white
	push	r1
	bl	common_isWhiteCardID
	pop	r1
	bne	@@end
	mov	r1,0x1		// yellow

@@end:
	pop	r15

.align 2
shop_cardNameInList:
	add	r3,sp,0x1C

	// Check if possible Star Card
	ldrh	r2,[r3,0x2]
	cmp	r2,(170)
	bgt	@@end

	// Check if Mega Class
	ldrb	r0,[r3,0x4]
	cmp	r0,0x2
	bne	@@end

	// Set Star Card name
	add	r2,(0x100 + 50 - 0xFF)
	add	r2,0xFF
@@end:
	bx	r14

.align 2
shop_cardNew:
	add	r4,r4,r0

	// Check if Star Ticket
	cmp	r2,(251)	// Star Ticket
	bne	@@normal

	// Skip NEW icon
	bl	0x21B4D2C

@@normal:
	mov	r1,0xE
	bx	r14

.align 2
shop_cardColorIconShow:
	push	r14
	add	r3,sp,(0x1C + 1*0x4)

	// Check if Star Ticket
	ldrh	r1,[r3,0x2]
	cmp	r1,(251)	// Star Ticket
	beq	@@end

	bl	0x202067C	// show
@@end:
	pop	r15

.align 2
shop_cardColorIconColor:
	push	r14
	add	r3,sp,(0x1C + 1*0x4)

	// Check if Mega Class
	ldrb	r2,[r3,0x4]
	cmp	r2,0x2
	bne	@@end

	// Check if Star Card
	ldrh	r2,[r3,0x2]
	cmp	r2,(170)
	bgt	@@end

	mov	r1,(0x0+0x4)	// white
	push	r0
	mov	r0,r2
	bl	common_isWhiteCardID
	pop	r0
	bne	@@end
	mov	r1,(0x1+0x4)	// yellow

@@end:
	bl	0x2020570	// set animation
	pop	r15


.align 2
shop_cardColorIconPosition:
	ldrb	r3,[r5,0xC]	// shop
	cmp	r3,0x9
	bne	@@end
	mov	r1,0x98
@@end:
	bx	r14


.align 2
shop_bufferStarFrags:
	push	r14
	ldrb	r0,[r5,0xC]	// shop
	cmp	r0,0x9
	beq	@@starFrags

	// Get Zennys
	bl	0x2007C80
	b	@@end
@@starFrags:
	// Get Star Frags
	bl	common_getStarFrags
@@end:
	pop	r15


.align 2
shop_checkStarFrags:
	push	r14
	ldrb	r0,[r4,0xC]	// shop
	cmp	r0,0x9
	beq	@@starFrags

	// Get Zennys
	bl	0x2007C80
	b	@@end
@@starFrags:
	// Get Star Frags
	bl	common_getStarFrags
@@end:
	pop	r15


.align 2
shop_takeStarFrags:
	push	r7,r14
	ldrb	r1,[r4,0xC]	// shop
	cmp	r1,0x9
	beq	@@starFrags

	// Take Zennys
	bl	0x2007C44
	b	@@end
@@starFrags:
	// Take Star Frags
	mov	r7,r0
	bl	common_getStarFrags
	sub	r0,r0,r7
	bl	common_setStarFrags
@@end:
	pop	r7,r15


	.pool