// Overlay 536 - PitcherMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0536.bin",readu32(TEMP+"/y9.bin", 536 * 0x20 + 0x4)


.org 0x21BE620
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE638
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:

.org 0x21BE79C
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 536 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE7B4-(.-4)
	// Longer wait so top screen can finish
	.dw	0x50	:: .dw	(60)
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
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x8
	// Wait for screen fade
	.dw	0x0B
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
overlay_0536_sinit_init:
	.dw	0
overlay_0536_sinit_init_end:
	.aligna	32
overlay_0536_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 536 * 0x20
	.skip	16
	.dw	overlay_0536_sinit_init
	.dw	overlay_0536_sinit_init_end
	.skip	8

.close
