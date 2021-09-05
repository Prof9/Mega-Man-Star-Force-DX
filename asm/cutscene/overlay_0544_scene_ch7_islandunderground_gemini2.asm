// Overlay 544 - Island Underground Gemini cutscene 2

.nds
.thumb
.open TEMP+"/overlay_0544.bin",readu32(TEMP+"/y9.bin", 544 * 0x20 + 0x4)


.org 0x21BE588
	.dw	0x13	:: .dw	@setMegaManPortrait-(.-4)
.org 0x21BE6AC
	.dw	0x13	:: .dw	@setGeoPortrait-(.-4)
.org 0x21BE7D8
	.dw	0x13	:: .dw	@setGeoPortraitEnd-(.-4)


.org readu32(TEMP+"/y9.bin", 544 * 0x20 + 0x10)


.align 4
@setMegaManPortrait:
	// Start cutscene
	.dw	0x90
	// Lock controls
	.dw	0x29
	// Set top screen portrait to Mega Man
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x32
	// Return
	.dw	0x13	:: .dw	0x21BE590-(.-4)

.align 4
@setGeoPortrait:
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Return
	.dw	0x13	:: .dw	0x21BE6B4-(.-4)

.align 4
@setGeoPortraitEnd:
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
	// Unlock controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 4
overlay_0544_sinit_init:
	.dw	0
overlay_0544_sinit_init_end:
	.aligna	32
overlay_0544_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 544 * 0x20
	.skip	16
	.dw	overlay_0544_sinit_init
	.dw	overlay_0544_sinit_init_end
	.skip	8

.close
