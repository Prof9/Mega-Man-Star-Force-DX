// Overlay 517 - Scrap Comp Mr. Hertz cutscene

.nds
.thumb
.open TEMP+"/overlay_0517.bin",readu32(TEMP+"/y9.bin", 517 * 0x20 + 0x4)


.org 0x21BE600
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE624
	// Start sound script
	.dh	0x4E	:: .db	0x0	:: .align 4
			:: .dw	@soundScript
			:: .dw	0x0
	// Jump ahead
	.dw	0x13	:: .dw	0x21BE684-(.-4)

.org 0x21BE68C
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
	.skip	0x4
@return1Normal:

.org 0x21BE6A8
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:


.org readu32(TEMP+"/y9.bin", 517 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1Normal:
	// Call function
	.dw	0x5C	:: .dw	0x2189AD4|1
			:: .dw	0x1
	// Set flag
	.dh	0x21	:: .dh	0xF18E
	// Jump back
	.dw	0x13	:: .dw	@return1Normal-(.-4)

.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Clear sound script
	.dh	0x61	:: .db	0x0	:: .align 4
	// Stop screen shake
	.dw	0x66

	// Skip if flag is true
	.dh	0x15	:: .dh	0xF18E	:: .dw	@@end-(.-4)
	// Clear flag
	.dh	0x22	:: .dh	0x6C
	// Call function
	.dw	0x5C	:: .dw	0x2189AD4|1
			:: .dw	0x1
@@end:
	// Clear flag
	.dh	0x22	:: .dh	0xF18E
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)

.align 4
@soundScript:
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// Play SFX
	.dh	0x41	:: .dh	0x191
	// Wait 17 frames
	.dw	0x50	:: .dw	(17)
	// End script
	.dw	0x04


.align 4
overlay_0517_sinit_init:
	.dw	0
overlay_0517_sinit_init_end:
	.aligna	32
overlay_0517_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 517 * 0x20
	.skip	16
	.dw	overlay_0517_sinit_init
	.dw	overlay_0517_sinit_init_end
	.skip	8

.close
