// Overlay 107 - AMAKEN Tower Comp map script

.nds
.thumb
.open TEMP+"/overlay_0107.bin",readu32(TEMP+"/y9.bin", 107 * 0x20 + 0x4)

// Restore Rymer cutscene
.orga 0xC
@loop:
	// If flag 0xF004 set, skip to @brother
	.dh	0x15
	.dh	0xF004
	.dw	@brother-(.-4)

	// If story chapter between 0x60 and 0x70,
	// skip to @cutscene
	.dh	0x14
	.db	0x60
	.db	0x70
	.dw	@cutscene-(.-4)

	// Skip to @end
	.dw	0x13
	.dw	@end-(.-4)

@brother:
	// Start cutscene
	.dw	0x4C
	.dw	0x134		// Boktai Brother 2
	.dw	0x0

	// Skip to @end
	.dw	0x13
	.dw	@end-(.-4)

@cutscene:
	// Check player in tile?
	.dw	0x1C
	.dw	0x10
	.dw	@end-(.-8)

	// If flag 0x090A not set,
	// skip to @end
	.dh	0x16
	.dh	0x090A
	.dw	@end-(.-4)

	// If flag 0x090B set,
	// skip to @end
	.dh	0x15
	.dh	0x090B
	.dw	@end-(.-4)

	// Start cutscene?
	.dw	0x4C
	.dw	0x124
	.dw	0

	// Skip to @end
	.dw	0x13
	.dw	@end-(.-4)

@end:
	// End script
	.dw	0x04


.align 4
overlay_0107_sinit_init:
	.dw	0
overlay_0107_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 107 * 0x20
	.skip	16
	.dw	overlay_0107_sinit_init
	.dw	overlay_0107_sinit_init_end
	.skip	8

.close