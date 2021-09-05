// Overlay 530 - Omega-Xis cutscene

.nds
.thumb
.open TEMP+"/overlay_0530.bin",readu32(TEMP+"/y9.bin", 530 * 0x20 + 0x4)


.orga 0x1A0
	.dw	0x13	:: .dw	@setOmegaXisGoneLive-(.-4)	:: .align 4
@return1:

.orga 0x3B8
	.dw	0x13	:: .dw	@setOmegaXisGoneSkip-(.-4)	:: .align 4
@return2:


.org readu32(TEMP+"/y9.bin", 530 * 0x20 + 0x10)

@setOmegaXisGoneLive:
	// Refresh top screen if necessary
	.dw	0x5C	:: .dw	@refreshTopScreen|1		:: .align 4
			:: .dw	0x00000000
	// Set Omega-Xis gone flag
	.dh	0x21	:: .dh	0xF129				:: .align 4
	// Set NPC variable
	.dh	0x25	:: .db	0x00,0x0B			:: .align 4
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00,0x0C			:: .align 4
	// Return
	.dw	0x13	:: .dw	@return1-(.-4)			:: .align 4

@setOmegaXisGoneSkip:
	// Receive mail 13
	.dh	0x92
	.dh	0x160D
	.dw	0x0

	// Refresh top screen if necessary
	.dw	0x5C	:: .dw	@refreshTopScreen|1		:: .align 4
			:: .dw	0x00000000
	// Set Omega-Xis gone flags
	.dh	0x21	:: .dh	0xF129				:: .align 4
	.dh	0x21	:: .dh	0x55				:: .align 4
	// Show player object
	.dw	0x31						:: .align 4
	// Return
	.dw	0x13	:: .dw	@return2-(.-4)			:: .align 4


@refreshTopScreen:
	push	r14

	// Refresh top screen if necessary
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFB
	ldrb	r0,[r0]
	cmp	r0,0x1		// Mega screen
	bne	@@end

	// Check flag already set
	ldr	r1,=0xF129
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	// Refresh top screen
	bl	common_refreshTopScreen

@@end:
	mov	r0,0x0
	pop	r15

	.pool


.align 4
overlay_0530_sinit_init:
	.dw	0
overlay_0530_sinit_init_end:
	.aligna	32
overlay_0530_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 530 * 0x20
	.skip	16
	.dw	overlay_0530_sinit_init
	.dw	overlay_0530_sinit_init_end
	.skip	8

.close
