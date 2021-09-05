// Overlay 159 - Gym ER map script

.nds
.thumb
.open TEMP+"/overlay_0159.bin",readu32(TEMP+"/y9.bin", 159 * 0x20 + 0x4)

.orga 0x70
@loop:
	// If flag 0xF004 not set, skip to @end
	.dh	0x16
	.dh	0xF004
	.dw	@end-(.-4)

@brother:
	// Start cutscene
	.dw	0x4C
	.dw	0x137		// Boktai Brother 5
	.dw	0x0

@end:
	// End script
	.dw	0x04


.align 4
overlay_0159_sinit_init:
	.dw	0
overlay_0159_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 159 * 0x20
	.skip	16
	.dw	overlay_0159_sinit_init
	.dw	overlay_0159_sinit_init_end
	.skip	8

.close