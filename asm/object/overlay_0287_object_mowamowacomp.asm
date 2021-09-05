// Overlay 287 - Mowa Mowa Comp object scripts

.nds
.thumb
.open TEMP+"/overlay_0287.bin",readu32(TEMP+"/y9.bin", 287 * 0x20 + 0x4)

//.orga 0x4 * 1
//	// Add new object
//	.dw	@obj_01


.org readu32(TEMP+"/y9.bin", 287 * 0x20 + 0x10)

@obj_01:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFF4,0xFF34,0x0000		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0A				:: .align 4
	// Set interactible
	.db	0x0C						:: .align 4
	// Set collision
	.db	0x10						:: .align 4
	// Loop
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0287_sinit_init:
	.dw	0
overlay_0287_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 287 * 0x20
	.skip	16
	.dw	overlay_0287_sinit_init
	.dw	overlay_0287_sinit_init_end
	.skip	8

.close