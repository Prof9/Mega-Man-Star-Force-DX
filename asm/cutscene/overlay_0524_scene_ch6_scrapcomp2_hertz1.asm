// Overlay 524 - Scrap Comp Mr. Hertz cutscene

.nds
.thumb
.open TEMP+"/overlay_0524.bin",readu32(TEMP+"/y9.bin", 524 * 0x20 + 0x4)


.org 0x21BE610
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE620
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:


.org readu32(TEMP+"/y9.bin", 524 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Start text script 2
	.dh	0x26	:: .db	0x4, (2)
	// Wait for text script
	.dw	0x08
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
overlay_0524_sinit_init:
	.dw	0
overlay_0524_sinit_init_end:
	.aligna	32
overlay_0524_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 524 * 0x20
	.skip	16
	.dw	overlay_0524_sinit_init
	.dw	overlay_0524_sinit_init_end
	.skip	8

.close
