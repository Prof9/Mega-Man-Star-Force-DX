// Overlay 449 - ThermoMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0449.bin",readu32(TEMP+"/y9.bin", 449 * 0x20 + 0x4)


.org 0x21BE804
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 449 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE864-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)


.align 4
overlay_0449_sinit_init:
	.dw	0
overlay_0449_sinit_init_end:
	.aligna	32
overlay_0449_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 449 * 0x20
	.skip	16
	.dw	overlay_0449_sinit_init
	.dw	overlay_0449_sinit_init_end
	.skip	8

.close
