.align 4
battle_cygnusFeatherHitscanFunctions:
	.dw	0x2174F18|1
	.dw	0x21750EC|1
	.dw	0x2015758|1
	.dw	0x2183644|1
	.dw	@update|1
	.dw	0x21836F0|1
	.dw	0x2181E34|1
	.dw	0x218363C|1
	.dw	0x21750E8|1
	.dw	0x2150464|1
	.dw	0x2154F9C|1
	.dw	0x2154F8C|1
	.dw	0x2154F7C|1

.align 2
@update:
	push	r4,r14
	mov	r4,r0
	bl	0x218364C	// original update

	bl	battle_isLegendMode
	beq	@@end

	// Check if despawning
	ldr	r0,[r4,0x18]
	cmp	r0,0x2
	bne	@@end

	// Check if hit something
	mov	r0,0xAC
	ldr	r0,[r4,r0]
	ldr	r0,[r0,0x6C]
	cmp	r0,0x0
	bne	@@end

	// Spawn Gravity panel
	mov	r0,0x68
	mov	r1,0x69
	ldrb	r0,[r4,r0]	// panel x
	ldrb	r1,[r4,r1]	// panel y

	// Calculate panel data address
	mov	r2,0xFC
	mul	r0,r2
	mov	r2,0x24
	mul	r1,r2
	ldr	r2,=0x21AD684
	add	r0,r2,r0
	add	r0,r0,r1

	// Set panel
	mov	r1,0x9		// Gravity panel
	bl	0x218FBF0	// set panel

@@end:
	pop	r4,r15

	.pool
