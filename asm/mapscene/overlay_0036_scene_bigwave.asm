// Overlay 36 - Big Wave map script

.nds
.thumb
.open TEMP+"/overlay_0036.bin",readu32(TEMP+"/y9.bin", 36 * 0x20 + 0x4)

.orga 0x2C
	// Check Famous cutscene active
	.dh	0x16
	.dh	0xF127
	.dw	@@end-(.-4)

	// Check if cutscene already watched
	.dh	0x15
	.dh	0xF128
	.dw	@@end-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	0x13F	// Famous boot-up
	.dw	0x00

@@end:
	// End script
	.dw	0x04


.align 4
overlay_0036_sinit_init:
	.dw	0
overlay_0036_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 36 * 0x20
	.skip	16
	.dw	overlay_0036_sinit_init
	.dw	overlay_0036_sinit_init_end
	.skip	8

.close