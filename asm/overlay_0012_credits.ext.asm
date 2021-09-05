.align 2
credits_pictureSizes1:
	add	r1,r5,r7
	add	r1,0xB0
	cmp	r4,(10)
	blt	@@end
	add	r1,=credits_extraPictureSizes
	sub	r1,(4*10)
	add	r1,r1,r7
@@end:
	bx	r14

.align 2
credits_pictureSizes2:
	push	r4,r14
	cmp	r0,(4*10)
	blt	@@normal
	add	r4,=credits_extraPictureSizes
	sub	r4,(4*10)
	add	r0,r4,r0
	b	@@end
@@normal:
	add	r0,r4,r0
	add	r0,0xB0
@@end:
	pop	r4,r15

.align 4
credits_extraPictureSizes:
	.dw	0x0
	.dw	0x0


.align 2
credits_getPaletteAnimations1:
	add	r1,r5,r6
	add	r1,0xD8
	cmp	r6,(8*4)
	blt	@@end
	add	r1,=credits_extraPaletteAnimations1
	sub	r1,(8*4)
	add	r1,r1,r6
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations2:
	cmp	r2,(8*4)
	blt	@@normal
	add	r3,=credits_extraPaletteAnimations1
	sub	r3,(8*4)
	add	r2,r3,r2
	b	@@end
@@normal:
	add	r2,r5,r2
	add	r2,0xD8
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations3:
	cmp	r4,(4)
	blt	@@normal
	add	r3,=credits_extraPaletteAnimations2
	sub	r3,(4*4)
	add	r1,r3,r0
	add	r0,r3,r0
	sub	r0,0xF8
	b	@@end
@@normal:
	add	r1,0xF8
	add	r0,r5,r0
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations4:
	cmp	r4,(4)
	blt	@@normal
	add	r2,=credits_extraPaletteAnimations2
	sub	r2,(4*4)
	add	r2,r2,r0
	b	@@end
@@normal:
	add	r2,r5,r0
	add	r2,0xF8
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations5:
	cmp	r4,(4)
	blt	@@normal
	add	r2,=credits_extraPaletteAnimations2
	sub	r2,(4*4)
	lsl	r0,r4,0x2
	add	r0,r2,r0
	b	@@end
@@normal:
	add	r0,0xF8
@@end:
	ldr	r0,[r0]
	bx	r14

.align 2
credits_getPaletteAnimations6:
	cmp	r4,(4)
	blt	@@normal
	add	r3,=credits_extraPaletteAnimations2
	sub	r3,(4*4)
	add	r1,r3,r1
	b	@@end
@@normal:
	add	r1,r5,r1
	add	r1,0xF8
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations7:
	cmp	r4,(4)
	blt	@@normal
	add	r3,=credits_extraPaletteAnimations1+0x4
	sub	r3,(8*4)
	add	r0,r3,r0
	b	@@end
@@normal:
	add	r0,r5,r0
	add	r0,0xDC
@@end:
	bx	r14

.align 2
credits_getPaletteAnimations8:
	cmp	r6,(8*4)
	blt	@@end
	add	r2,=credits_extraPaletteAnimations1
	sub	r2,(8*4)
@@end:
	add	r2,r2,r6
	mov	r3,0x4
	bx	r14

.align 2
credits_getPaletteAnimations9:
	cmp	r6,(8*4)
	blt	@@end
	add	r2,=credits_extraPaletteAnimations1+0x4
	sub	r2,(8*4)
@@end:
	add	r2,r2,r6
	mov	r3,0x4
	bx	r14

.align 2
credits_getPaletteAnimations10:
	lsl	r0,r0,0x2
	cmp	r4,(4)
	blt	@@end
	add	r1,=credits_extraPaletteAnimations3
	sub	r0,r4,(4)
@@end:
	strb	r2,[r1,r0]
	bx	r14

.align 2
credits_getPaletteAnimations11:
	lsl	r0,r0,0x2
	cmp	r4,(4)
	blt	@@end
	add	r1,=credits_extraPaletteAnimations3
	sub	r1,(4)
	sub	r1,r1,r0
	add	r1,r1,r4
@@end:
	ldrb	r0,[r1,r0]
	bx	r14

.align 2
credits_getPaletteAnimations12:
	mov	r2,(0x108 >> 0x2)
	lsl	r2,r2,0x2
	cmp	r4,(4)
	blt	@@end
	add	r1,=credits_extraPaletteAnimations3
	sub	r1,(4)
	sub	r1,r1,r2
	add	r1,r1,r4
@@end:
	bx	r14

.align 2

.align 4
credits_extraPaletteAnimations1:
	.dw	0x0, 0x0
	.dw	0x0, 0x0
credits_extraPaletteAnimations2:
	.dw	0x0
	.dw	0x0
credits_extraPaletteAnimations3:
	.db	0x0
	.db	0x0


	.pool


.align 4
credits_pictures:
	.dw	((24 << 0x10) | ( 70)), ((24 << 0x10) | ( 80))	// Taurus Fire
	.dw	((24 << 0x10) | ( 71)), ((24 << 0x10) | ( 81))	// Cygnus Wing
	.dw	((24 << 0x10) | ( 72)), ((24 << 0x10) | ( 82))	// Harp Note
	.dw	((24 << 0x10) | ( 73)), ((24 << 0x10) | ( 83))	// Libra Scales
	.dw	((24 << 0x10) | ( 74)), ((24 << 0x10) | ( 84))	// Queen Ophiuca
	.dw	((24 << 0x10) | ( 75)), ((24 << 0x10) | ( 85))	// Gemini Spark
	.dw	((24 << 0x10) | ( 76)), ((24 << 0x10) | ( 86))	// Earth
	.dw	((24 << 0x10) | ( 77)), ((24 << 0x10) | ( 87))	// Escape pod
	.dw	((24 << 0x10) | ( 79)), ((24 << 0x10) | ( 89))	// Andromeda
	.dw	((24 << 0x10) | ( 96)), ((24 << 0x10) | ( 99))	// Admins 1
	.dw	((24 << 0x10) | ( 97)), ((24 << 0x10) | (100))	// Admins 2
	.dw	((24 << 0x10) | ( 98)), ((24 << 0x10) | (101))	// Admins 3

.align 4
credits_paletteAnimations:
	.dw	((24 << 0x10) | ( 90)), ( 3)
	.dw	((24 << 0x10) | ( 91)), ( 4)
	.dw	((24 << 0x10) | ( 92)), ( 5)
	.dw	((24 << 0x10) | ( 93)), ( 6)
	.dw	((24 << 0x10) | ( 94)), ( 7)
	.dw	((24 << 0x10) | ( 95)), (15)

.align 1
credits_sequence:
	.db	(0)
	.db	(0)
	.db	(0)
	.db	(1)		// Taurus Fire
	.db	(2)		// Cygnus Wing
	.db	(3)		// Harp Note
	.db	(4)		// Libra Scales
	.db	(5)		// Queen Ophiuca
	.db	(6)		// Gemini Spark
	.db	(8)		// Andromeda
	.db	(0)
	.db	(9)		// Pegasus
	.db	(11)		// Dragon
	.db	(10)		// Leo
	.db	(0)
	.db	(0)
	.db	(7)		// Earth
	.db	0xFF		// End

.align 1
credits_segments:
	.db	0, 24, 0	// Start
	.db	5, 1, 2		// Mega Man Star Force
	.db	6, 1, 4		// Credits
	.db	1, 4, 2		// Game Design
	.db	1, 2, 2		// Scenario
	.db	1, 2, 2		// Character Design
	.db	1, 2, 2		// 2D Objects
	.db	1, 4, 2		// Modeling
	.db	1, 1, 2		// Motion
	.db	1, 5, 2		// Backgrounds
	.db	1, 11, 2	// Programming
	.db	1, 2, 2		// Music
	.db	1, 2, 2		// Sound Effects
	.db	1, 3, 2		// Official Illustration
	.db	1, 12, 2	// Co-Production
	.db	1, 4, 2		// Localization
	.db	1, 1, 2		// Manual Design
	.db	1, 1, 2		// QA Supervisor
	.db	1, 15, 2	// European Localization
	.db	1, 28, 3	// Special Thanks
	.db	1, 1, 3		// Producer
	.db	1, 1, 3		// Executive Producer
	.db	1, 1, 2		// Director
	.db	7, 13, 0	// End

.align 1
credits_picWidths:
	.db	(32)
	.db	(40)	// Taurus Fire
	.db	(40)	// Cygnus Wing
	.db	(40)	// Harp Note
	.db	(40)	// Libra Scales
	.db	(40)	// Queen Ophiuca
	.db	(40)	// Gemini Spark
	.db	(32)	// Earth
	.db	(40)	// Andromeda
	.db	(40)	// Admins 1
	.db	(40)	// Admins 2
	.db	(40)	// Admins 3

.align 4
credits_picOffsets:
	.dw	0
	.dw	-4	// Taurus Fire
	.dw	-4	// Cygnus Wing
	.dw	-4	// Harp Note
	.dw	-4	// Libra Scales
	.dw	-4	// Queen Ophiuca
	.dw	-4	// Gemini Spark
	.dw	0	// Earth
	.dw	-4	// Andromeda
	.dw	-4	// Admins 1
	.dw	-4	// Admins 1
	.dw	-4	// Admins 1