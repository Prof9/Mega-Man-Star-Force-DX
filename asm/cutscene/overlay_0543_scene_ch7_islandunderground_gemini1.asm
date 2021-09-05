// Overlay 543 - Island Underground Gemini cutscene 1

.nds
.thumb
.open TEMP+"/overlay_0543.bin",readu32(TEMP+"/y9.bin", 543 * 0x20 + 0x4)


.org 0x21BE934
	.dw	0x13	:: .dw	@setMegaManPortrait-(.-0x4)


.org readu32(TEMP+"/y9.bin", 543 * 0x20 + 0x10)


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
	.dw	0x13	:: .dw	0x21BE93C-(.-4)


.align 4
overlay_0543_sinit_init:
	.dw	0
overlay_0543_sinit_init_end:
	.aligna	32
overlay_0543_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 543 * 0x20
	.skip	16
	.dw	overlay_0543_sinit_init
	.dw	overlay_0543_sinit_init_end
	.skip	8

.close
