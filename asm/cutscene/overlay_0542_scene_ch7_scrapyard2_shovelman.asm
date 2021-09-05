// Overlay 542 - ShovelMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0542.bin",readu32(TEMP+"/y9.bin", 542 * 0x20 + 0x4)


.org 0x21BE614
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE63C
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:

.org 0x21BE650
	.dw	0x13	:: .dw	@skip1Fade-(.-4)
@return1Fade:

.org 0x21BE750
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 542 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE77C-(.-4)
	// Wait 90 frames
	.dw	0x50	:: .dw	(90)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1End:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Clear cutscene skip
	.dw	0x12
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)

.align 4
@skip1Fade:
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x8
	// Wait for screen fade
	.dw	0x0B
	// End text script
	.dw	0x27
	// Start camera script
	.dw	0x4D	:: .dw	@camera
			:: .dw	0x0
	// Jump back
	.dw	0x13	:: .dw	@return1Fade-(.-4)


.align 4
@camera:
	// Set camera position
	.dw	0x52
	.dw	0x00000034,0x000000B4,0x00000000
	// End script
	.dw	0x04


.align 4
overlay_0542_sinit_init:
	.dw	0
overlay_0542_sinit_init_end:
	.aligna	32
overlay_0542_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 542 * 0x20
	.skip	16
	.dw	overlay_0542_sinit_init
	.dw	overlay_0542_sinit_init_end
	.skip	8

.close
