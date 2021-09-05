.align 2
bestCombo_keepPopUpCursor:
	push	r14

	mov	r0,r4
	bl	0x21B27F8

	add	r0,=@selectedCombo
	str	r5,[r0]

	strh	r5,[r4,0x16]
	pop	r15

	.pool

.align 2
bestCombo_reloadPopUpCursor:
	push	r14

	ldrb	r1,[r4,0x10]
	add	r1,0x7
	strh	r1,[r4,0x16]

	// r0 = r4
	bl	0x21B2720

	ldr	r0,[@selectedCombo]
	strh	r0,[r4,0x16]

	pop	r15

.align 4
@selectedCombo:
	.dw	0x0