// Overlay 511 - Scrapyard 2 Pat cutscene

.nds
.thumb
.open TEMP+"/overlay_0511.bin",readu32(TEMP+"/y9.bin", 511 * 0x20 + 0x4)


.org 0x21BE5D8
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:


.org readu32(TEMP+"/y9.bin", 511 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE678-(.-4)
	// Start text script 0
	.dh	0x26	:: .db	0x4, (0)
	// Wait for text script
	.dw	0x08
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)


.align 4
overlay_0511_sinit_init:
	.dw	0
overlay_0511_sinit_init_end:
	.aligna	32
overlay_0511_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 511 * 0x20
	.skip	16
	.dw	overlay_0511_sinit_init
	.dw	overlay_0511_sinit_init_end
	.skip	8

.close
