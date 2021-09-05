// Overlay 556 - ThermoMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0556.bin",readu32(TEMP+"/y9.bin", 556 * 0x20 + 0x4)


.org 0x21BE5E4
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE5F4
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
@return1End:

.org 0x21BE6F0
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 556 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE718-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
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
@skip1Normal:
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Clear text script
	.dw	0x27
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
overlay_0556_sinit_init:
	.dw	0
overlay_0556_sinit_init_end:
	.aligna	32
overlay_0556_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 556 * 0x20
	.skip	16
	.dw	overlay_0556_sinit_init
	.dw	overlay_0556_sinit_init_end
	.skip	8

.close
