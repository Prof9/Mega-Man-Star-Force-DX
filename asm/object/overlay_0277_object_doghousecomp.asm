// Overlay 277 - Doghouse Comp object scripts

.nds
.thumb
.open TEMP+"/overlay_0277.bin",readu32(TEMP+"/y9.bin", 277 * 0x20 + 0x4)

.orga 0x88	// MegaMan.EXE wave ball
	.dh	0x13, 0x903	:: .dw	0x10	:: .align 4
.orga 0xA8
	.db	0x0C				:: .align 4	// Enable interaction
.orga 0xB8
	.db	0x25, 0x0A			:: .align 4	// Set text script
	.dw	0x12, 0xFFFFFFE0		:: .align 4


.org readu32(TEMP+"/y9.bin", 277 * 0x20 + 0x10)


.align 4
overlay_0277_sinit_init:
	.dw	0
overlay_0277_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 277 * 0x20
	.skip	16
	.dw	overlay_0277_sinit_init
	.dw	overlay_0277_sinit_init_end
	.skip	8

.close