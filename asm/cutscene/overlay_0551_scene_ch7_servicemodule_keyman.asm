// Overlay 551 - KeyMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0551.bin",readu32(TEMP+"/y9.bin", 551 * 0x20 + 0x4)


.org 0x21BE5F4
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE604
	.dw	0x13	:: .dw	@skip1End-(.-4)
	.skip	0x4
@return1End:


.org readu32(TEMP+"/y9.bin", 551 * 0x20 + 0x10)


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
	// Call function
	.dw	0x5C	:: .dw	0x21897CC|1
			:: .dw	0x1
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
overlay_0551_sinit_init:
	.dw	0
overlay_0551_sinit_init_end:
	.aligna	32
overlay_0551_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 551 * 0x20
	.skip	16
	.dw	overlay_0551_sinit_init
	.dw	overlay_0551_sinit_init_end
	.skip	8

.close
