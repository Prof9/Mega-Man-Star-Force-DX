// Overlay 286 - Mirror Comp object scripts

.nds
.thumb
.open TEMP+"/overlay_0286.bin",readu32(TEMP+"/y9.bin", 286 * 0x20 + 0x4)

.orga 0x4 * 2
	// Add new object
	.dw	@obj_02
.orga 0x4 * 3
	// Add new object
	.dw	@obj_03


.org readu32(TEMP+"/y9.bin", 286 * 0x20 + 0x10)

@obj_02:
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B			:: .align 4
	// Set visible
	.db	0x02					:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x00D4,0xFEF4,0x0000	:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01			:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0A			:: .align 4
	// Set interactible
	.db	0x0C					:: .align 4
	// Set collision
	.db	0x10					:: .align 4
	// Set face player
	.db	0x0E					:: .align 4
	// Loop
	.db	0x01					:: .align 4

@obj_03:
	// Set sprite to mirror
	.dh	0x22	:: .dh	0x3F			:: .align 4
	// Set visible
	.db	0x02					:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x011A,0xFF14,0x0000	:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14			:: .align 4
	// Set interactible
	.db	0x0C					:: .align 4
	// Set collision
	.db	0x10					:: .align 4
	// Loop
	.db	0x01					:: .align 4


.align 4
overlay_0286_sinit_init:
	.dw	0
overlay_0286_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 286 * 0x20
	.skip	16
	.dw	overlay_0286_sinit_init
	.dw	overlay_0286_sinit_init_end
	.skip	8

.close