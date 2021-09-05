// Overlay 82 - Scrap Comp 3 map script

.nds
.thumb
.open TEMP+"/overlay_0082.bin",readu32(TEMP+"/y9.bin", 82 * 0x20 + 0x4)

// Restore Rymer cutscene
.orga 0x168
	.dw	0x13
	.dw	@cutscene-(.-4)

.orga 0x174
@cutscene:
	// Check player in tile?
	.dw	0x1C
	.dw	0x10
	.dw	@end

	// If flag 0x090C not set,
	// skip to @end
	.dh	0x16
	.dh	0x090C
	.dw	@end-(.-4)

	// If flag 0x090D set,
	// skip to @end
	.dh	0x15
	.dh	0x090D
	.dw	@end-(.-4)

	// If flag 0x0982 not set,
	// skip to @end
	.dh	0x16
	.dh	0x0982
	.dw	@end-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	293
	.dw	0

	// Skip to @end
	.dw	0x13
	.dw	@end-(.-4)

@end:
	// End script
	.dw	0x04


.align 4
overlay_0082_sinit_init:
	.dw	0
overlay_0082_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 82 * 0x20
	.skip	16
	.dw	overlay_0082_sinit_init
	.dw	overlay_0082_sinit_init_end
	.skip	8

.close