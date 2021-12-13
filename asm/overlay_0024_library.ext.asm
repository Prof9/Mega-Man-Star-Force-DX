.align 2
library_starCardOwned:
	// r0 = card ID
	push	r0-r3,r14

	// Check if this card can be a Star Card
	ldr	r1,=data_extraCardInfo
	lsl	r2,r0,0x17
	lsr	r2,r2,0x16
	ldrb	r2,[r1,r2]	// power up description
	cmp	r2,0x0
	beq	@@end

	mov	r1,(0xE000 >> 0xC)
	lsl	r1,r1,0xC
	add	r1,r1,r0
	bl	0x202409C	// check flag

@@end:
	pop	r0-r3,r15


.align 2
library_viewStarCard:
	push	r14
	cmp	r0,0x1
	beq	@@refresh

	// Check Y pressed
	ldrh	r0,[r4,0x1E]	// buttons down
	lsr	r0,r0,0xC	// test 0x800
	bcc	@@end

	// Get card list
	ldr	r0,[r4,0xC]
	mov	r1,0x0
	bl	0x2015E94	// get buffer

	// Get card ID
	mov	r1,0x24
	mov	r2,0x28
	ldsh	r1,[r4,r1]
	ldsh	r2,[r4,r2]
	add	r1,r1,r2
	lsl	r1,r1,0x3
	ldrh	r0,[r0,r1]

	// Check owned
	bl	library_starCardOwned
	beq	@@end

	// Trigger refresh
	add	r1,=@doCardRefresh
	mov	r0,0x1
	str	r0,[r1]

@@refresh:
	pop	r15
@@end:
	add	sp,0x4
	bl	0x21B10F0


.align 2
library_toggleStarCard:
	ldsh	r1,[r0,r1]
	strh	r1,[r0,0x28]

	add	r1,=@doCardRefresh
	ldr	r2,[r1]
	cmp	r2,0x1
	bne	@@end
	mov	r2,0x2
	str	r2,[r1]

	// Toggle Star Card
	add	r2,=@isStarCardShown
	ldr	r3,[r2]
	mov	r1,0x1
	eor	r3,r1
	str	r3,[r2]

@@end:
	bx	r14


.align 2
library_drawStarOnCard:
	lsl	r3,r3,0x1B
	push	r0-r1,r3,r14

	// Check if this is a Star Card
	mov	r0,r1
	bl	library_starCardOwned
	beq	@@normal

	// Check if Star Card shown
	ldr	r2,[@isStarCardShown]
	add	r2,0x1
	b	@@end

@@normal:
	mov	r2,0x1
@@end:
	pop	r0-r1,r3,r15


.align 2
library_refreshStandardDescription:
	add	r2,=@doCardRefresh
	ldr	r3,[r2]
	cmp	r3,0x2
	bne	@@normal
	mov	r3,0x0
	str	r3,[r2]

	// Do refresh
	bl	0x21B2A8C

@@normal:
	mov	r0,0x26
	ldsh	r2,[r4,r0]
	bx	r14


.align 2
library_getStandardDescription:
	push	r14

	ldrh	r6,[r5]		// card ID
	ldr	r0,[@isStarCardShown]
	cmp	r0,0x0
	beq	@@end

	mov	r0,r6
	bl	library_starCardOwned
	beq	@@end

	// Check if this card can be a Star Card
	ldr	r1,=data_extraCardInfo
	lsl	r0,r6,0x17
	lsr	r0,r0,0x16
	ldrb	r0,[r1,r0]	// power up description
	cmp	r0,0x0
	beq	@@end
	add	r0,0xFF
	add	r6,r0,0x1

@@end:
	mov	r0,0x1
	pop	r15


.align 2
library_setTransparency:
	push	r14
	bl	0x2010708

	// Set blend transparency
	ldr	r0,=0x2117B34
	mov	r1,0x1
	mov	r2,0x0		// none
	mov	r3,0x2		// BG1
	bl	0x2010720	// set blend coefficients

	// Set blend mode
	ldr	r0,=0x2117B34
	mov	r1,0x1
	mov	r2,0x40		// blend
	bl	0x2010748	// set blend coefficients

	// Set blend coefficients
	ldr	r0,=0x2117B34
	mov	r1,0x1
	mov	r2,(11)
	mov	r3,(5)
	bl	0x2010764	// set blend coefficients

	// Clear variables
	mov	r0,0x0
	add	r1,=@isStarCardShown
	str	r0,[r1]
	add	r1,=@doCardRefresh
	str	r0,[r1]

	pop	r15


.align 2
library_drawStar:
	push	r7,r14
	sub	sp,0x8

	// Check card owned
	ldrb	r0,[r4,0x2]
	cmp	r0,0x0
	beq	@@end

	// Check if this card can be a Star Card
	ldrh	r0,[r4]
	ldr	r1,=data_extraCardInfo
	lsl	r0,r0,0x17
	lsr	r0,r0,0x16
	ldrb	r0,[r1,r0]	// power up description
	cmp	r0,0x0
	beq	@@end

	ldr	r3,=0xB33A	// placeholder
	ldr	r7,=0x40B40400

	// Check card owned
	ldrh	r0,[r4]
	bl	library_starCardOwned
	beq	@@draw

	mov	r0,0x3
	lsl	r0,r0,0xA
	bic	r7,r0
	ldr	r3,=0xB324	// filled in

@@draw:
	// Draw star
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]

	mov	r0,0x54
	ldsh	r0,[r6,r0]	// scroll x
	lsl	r0,r0,0x13
	add	r7,r7,r0

	lsl	r0,r5,0x5	// y = idx * 32
	add	r0,0x19
	add	r7,r7,r0

	ldr	r0,=0x211CDC0
	mov	r1,0x1
	mov	r2,r7
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r7,r15

	.pool

.align 4
@isStarCardShown:
	.dw	0x0
@doCardRefresh:
	.dw	0x0


.align 2
library_drawLabelStandard:
	mov	r2,0x2		// yellow label
	ldrb	r0,[r5,0x2]	// card owned
	cmp	r0,0x0
	bne	@@end
	mov	r2,0x0		// black label
@@end:
	bl	0x21B2390

.align 2
library_drawLabelMega:
	mov	r2,0x4		// blue label
	ldrb	r3,[r6,0x2]	// card owner
	cmp	r3,0x0
	bne	@@end
	mov	r2,0x0		// black label
@@end:
	add	r5,0x60
	bx	r14

.align 2
library_drawLabelGiga:
	mov	r2,0x8		// red label
	ldrb	r3,[r6,0x2]	// card owner
	cmp	r3,0x0
	bne	@@end
	mov	r2,0x0		// black label
@@end:
	add	r5,0x60
	bx	r14


.align 2
library_skipAndromedaForGigaCount:
	push	r14
	cmp	r5,0xF7		// Andromeda
	bne	@@end

	// Check if have Andromeda
	ldr	r1,=0xEF7
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	// Skip Andromeda
	add	r5,0x1

@@end:
	pop	r15


.align 2
library_icon:
	str	r3,[sp]
	mov	r3,0xFF
	mov	r1,0x0
	bx	r14


.align 2
library_drawLabelMegaEmpty:
	push	r6,r14
	mov	r2,0x4
	mov	r3,0x48
	b	@library_drawLabel

library_drawLabelGigaEmpty:
	push	r6,r14
	mov	r2,0x8
	mov	r3,0x4A
	mov	r6,r7

@library_drawLabel:
	add	r5,0x60

	add	r3,r4,r3
	ldrh	r3,[r3]		// Mega/Giga count
	cmp	r6,r3
	blt	@@end

	mov	r2,0x0		// Gray label

@@end:
	pop	r6,r15


	.pool