// Overlay 260 - AMAKEN Tower Comp object scripts

.nds
.thumb
.open TEMP+"/overlay_0260.bin",readu32(TEMP+"/y9.bin", 260 * 0x20 + 0x4)

// Restore Lucian and Rymer objects
.orga 0x4 * 1
	// Skip exit for Lucian
	.dw	readu32(TEMP+"/overlay_0260.bin", 0x4 * 1) + 4
.orga 0x4 * 2
	// Skip exit for Rymer
	.dw	readu32(TEMP+"/overlay_0260.bin", 0x4 * 2) + 4
//.orga 0x4 * 3
//	// Add new object
//	.dw	@obj_03


.org readu32(TEMP+"/y9.bin", 260 * 0x20 + 0x10)

@obj_03:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x00F4,0xFF14,0x0000		:: .align 4
//	.dh	0x05	:: .dh	0x0014,0x0114,0x0000		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14				:: .align 4
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
overlay_0260_sinit_init:
	.dw	0
overlay_0260_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 260 * 0x20
	.skip	16
	.dw	overlay_0260_sinit_init
	.dw	overlay_0260_sinit_init_end
	.skip	8

.close