// Overlay 213 - Service Module object scripts

.nds
.thumb
.open TEMP+"/overlay_0213.bin",readu32(TEMP+"/y9.bin", 213 * 0x20 + 0x4)

.orga 0x4 * 0
	// Add new object
	.dw	@obj_00


.org readu32(TEMP+"/y9.bin", 213 * 0x20 + 0x10)

@obj_00:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF8C,0xFE4C,0x00C0		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
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
overlay_0213_sinit_init:
	.dw	0
overlay_0213_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 213 * 0x20
	.skip	16
	.dw	overlay_0213_sinit_init
	.dw	overlay_0213_sinit_init_end
	.skip	8

.close