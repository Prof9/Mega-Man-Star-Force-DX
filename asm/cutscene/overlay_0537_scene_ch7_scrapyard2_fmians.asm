// Overlay 537 - FM-ians cutscene

.nds
.thumb
.open TEMP+"/overlay_0537.bin",readu32(TEMP+"/y9.bin", 537 * 0x20 + 0x4)


.orga 0x2C4
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	.dw	0x13	:: .dw	@setOmegaXisBackLive-(.-4)	:: .align 4
@return1:

.orga 0x3A8
	.dw	0x13	:: .dw	@setOmegaXisBackSkip-(.-4)	:: .align 4
@return2:


.org readu32(TEMP+"/y9.bin", 537 * 0x20 + 0x10)


@setOmegaXisBackLive:
	// Refresh top screen if necessary
	.dw	0x5C	:: .dw	@refreshTopScreen|1		:: .align 4
			:: .dw	0x00000000
	// Set top screen portrait to Mega Man
	.dw	0x5C	:: .dw	0x21892F4|1			:: .align 4
			:: .dw	0x32
	// Set flag: revert back to Geo at battle start
	.dh	0x21	:: .dh	0xF19B				:: .align 4
	// Clear Omega-Xis gone flag
	.dh	0x22	:: .dh	0xF129				:: .align 4
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Start screen fade in
	.dh	0x1F	:: .db	0x02,0x02			:: .align 4
	// Wait for screen fade
	.dw	0x0B						:: .align 4
	// Return
	.dw	0x13	:: .dw	@return1-(.-4)			:: .align 4

@setOmegaXisBackSkip:
	// Do not refresh top screen since we're going into a battle
	// Clear Omega-Xis gone flags
	.dh	0x22	:: .dh	0xF129				:: .align 4
	.dh	0x22	:: .dh	0x55				:: .align 4
	// Set flag 0x85F
	.dh	0x21	:: .dh	0x85F				:: .align 4
	// Return
	.dw	0x13	:: .dw	@return2-(.-4)			:: .align 4


.align 2
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

	// Check flag already unset
	ldr	r1,=0xF129
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Refresh top screen
	bl	common_refreshTopScreen

@@end:
	mov	r0,0x0
	pop	r15

	.pool


.align 4
overlay_0537_sinit_init:
	.dw	0
overlay_0537_sinit_init_end:
	.aligna	32
overlay_0537_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 537 * 0x20
	.skip	16
	.dw	overlay_0537_sinit_init
	.dw	overlay_0537_sinit_init_end
	.skip	8

.close
