// Overlay 298 - Pre Tutorial 1 cutscene

.nds
.thumb
.open TEMP+"/overlay_0298.bin",readu32(TEMP+"/y9.bin", 298 * 0x20 + 0x4)

.org 0x21BE608
	// Disable cutscene skip
	.dh	0x0E	// nop
	.dh	0x0E	// nop
	.dh	0x0E	// nop
	.dh	0x0E	// nop


.org readu32(TEMP+"/y9.bin", 298 * 0x20 + 0x10)

.align 4
overlay_0298_sinit_init:
	.dw	0
overlay_0298_sinit_init_end:
	.aligna	32
overlay_0298_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 298 * 0x20
	.dw	298			// Overlay ID (overlay_0298)
	.dw	0x21BE560		// Load address
	.dw	overlay_0298_size	// Uncompressed size
	.dw	0			// BSS size
	.dw	overlay_0298_sinit_init
	.dw	overlay_0298_sinit_init_end
	.dw	298			// File ID
	.skip	4

.close
