// Overlay 663 - Star Frag Trader

.nds
.thumb
.create TEMP+"/overlay_0663.bin",0x21BE560
.area 0x6A0

cutscene323_start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29

	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08

	// Start text script 20 from mess_1206
	.dh	0x26	:: .db	0x01, (20)

	// Wait for script finish
	.dw	0x08
	// End cutscene
	.dw	0x91
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 4
overlay_0663_sinit_init:
	.dw	0
overlay_0663_sinit_init_end:
	.aligna	32
overlay_0663_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 663 * 0x20
	.dw	663			// Overlay ID (overlay_0663)
	.dw	0x21BE560		// Load address
	.dw	overlay_0663_size	// Uncompressed size
	.dw	0
	.dw	overlay_0663_sinit_init
	.dw	overlay_0663_sinit_init_end
	.dw	663			// File ID
	.skip	4

.close
