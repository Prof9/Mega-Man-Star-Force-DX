// Overlay 15 - Top screen

.nds
.open TEMP+"/overlay_0015.bin",readu32(TEMP+"/y9.bin", 15 * 0x20 + 0x4)
.thumb


// New tilemap placements
.org 0x21B1438	// Geo portrait
	mov	r0,(23)		// x
.org 0x21B1482	// Mega Man portrait
	mov	r0,(23)		// x
.org 0x21B16C2	// HP
	mov	r2,(31)		// x
.org 0x21B17A2	// HP
	mov	r2,(31)		// x
.org 0x21B182E
	mov	r2,(31)		// x
.org 0x21B1972	// LV
	add	r2,(132)	// x
.org 0x21B19BC	// Bro.
	add	r2,(188)	// x
.org 0x21B19F0	// Bro.
	.dh	0x8000 | (127)	// y
.org 0x21B1C58	// LV
	.dw	(15), (7)	// x, y
.org 0x21B1C68	// HP
	.dw	(3), (7)	// x, y


// Proper widths on player name in Personal
.org 0x21B18D8
.area 0x88,0x00
	mov	r2,0x0
	mov	r3,0x0
	push	r2-r7,r14	// push 2 extra for allocation

	// Get player name
	mov	r1,0x0
	bl	0x200C92C
	mov	r4,r0		// name

	mov	r5,(31)		// x
	mov	r6,0x0		// name part
	mov	r7,0x0		// char index
@@drawPart:

@@loop:
	ldrb	r0,[r4,r7]
	cmp	r0,0xE6
	beq	@@nameEnd

	// Center character
	ldr	r1,=0x20CB424	// font width table
	ldrb	r0,[r1,r0]
	mov	r1,0x9		// bias towards right; makes uppercase look better
	sub	r0,r1,r0
	lsr	r0,r0,0x1

	// Draw character
	ldr	r2,=0x40000028
	add	r0,r5,r0
	lsl	r0,r0,0x10
	orr	r2,r0
	mov	r3,(0x1400 >> 0x8)
	lsl	r3,r3,0x8
	mov	r0,(0x184 >> 0x2)
	lsl	r0,r0,0x2
	mov	r1,0xC
	mul	r1,r6
	add	r0,r0,r1
	lsl	r1,r7,0x1
	add	r0,r0,r1
	orr	r3,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

	// Increment x
	add	r5,0x8

	// Next char
	add	r7,0x1
	b	@@loop

@@nameEnd:
@@addSpace:
	add	r5,0x8
@@nextPart:
	add	r4,0xE		// go to next name part
	mov	r7,0x0		// char index
	add	r6,0x1		// name part
	cmp	r6,0x2
	blt	@@drawPart

	pop	r2-r7,r15	// dealloc 2 extra

	.pool
.endarea


.close
