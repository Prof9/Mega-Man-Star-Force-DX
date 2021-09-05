// Overlay 133 - Mirror Comp map script

.nds
.thumb
.open TEMP+"/overlay_0133.bin",readu32(TEMP+"/y9.bin", 133 * 0x20 + 0x4)

.orga 0xC
@loop:
	// If flag 0xF006 not set, skip to @end
	.dh	0x16
	.dh	0xF006
	.dw	@end-(.-4)

@brother:
	// Start cutscene
	.dw	0x4C
	.dw	0x139		// Copy Brother
	.dw	0x0

@end:
	// End script
	.dw	0x04


.align 4
overlay_0133_sinit_init:
	.dw	0
overlay_0133_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 133 * 0x20
	.skip	16
	.dw	overlay_0133_sinit_init
	.dw	overlay_0133_sinit_init_end
	.skip	8

.close