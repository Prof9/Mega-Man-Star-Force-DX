// Overlay 518 - Scrap Comp Mr. Hertz cutscene

.nds
.thumb
.open TEMP+"/overlay_0518.bin",readu32(TEMP+"/y9.bin", 518 * 0x20 + 0x4)


.org 0x21BE5F4
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE618
	// Start sound script
	.dh	0x4E	:: .db	0x0	:: .align 4
			:: .dw	@soundScript
			:: .dw	0x0
	// Jump ahead
	.dw	0x13	:: .dw	0x21BE678-(.-4)

.org 0x21BE68C
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:


.org readu32(TEMP+"/y9.bin", 518 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

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
overlay_0518_sinit_init:
	.dw	0
overlay_0518_sinit_init_end:
	.aligna	32
overlay_0518_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 518 * 0x20
	.skip	16
	.dw	overlay_0518_sinit_init
	.dw	overlay_0518_sinit_init_end
	.skip	8

.close
