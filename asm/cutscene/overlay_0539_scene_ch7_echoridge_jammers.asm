// Overlay 539 - Echo Ridge Jammers cutscene

.nds
.thumb
.open TEMP+"/overlay_0539.bin",readu32(TEMP+"/y9.bin", 539 * 0x20 + 0x4)


.org 0x21BE8C4
	.dw	0x13	:: .dw	@setMegaManPortrait-(.-0x4)


.org readu32(TEMP+"/y9.bin", 539 * 0x20 + 0x10)


.align 4
@setMegaManPortrait:
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Set top screen portrait to Mega Man
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x32
	// Set flag: revert back to Geo at battle start
	.dh	0x21	:: .dh	0xF19B
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Return
	.dw	0x13	:: .dw	0x21BE8CC-(.-4)


.align 4
overlay_0539_sinit_init:
	.dw	0
overlay_0539_sinit_init_end:
	.aligna	32
overlay_0539_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 539 * 0x20
	.skip	16
	.dw	overlay_0539_sinit_init
	.dw	overlay_0539_sinit_init_end
	.skip	8

.close
