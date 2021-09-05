// Overlay 269 - Piano Comp object scripts

.nds
.thumb
.open TEMP+"/overlay_0269.bin",readu32(TEMP+"/y9.bin", 269 * 0x20 + 0x4)


.orga 0x4 * 0x0A
	.dw	@obj_0A


.org readu32(TEMP+"/y9.bin", 269 * 0x20 + 0x10)
.area 0x21BE560-.


// Gauntlet refight
@obj_0A:
	// Check if finished Zack quest
	.dh	0x14	:: .dh	0x186D				:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to red
	.db	0x30	:: .db	(3)				:: .align 4
	// Set animation
	.db	0x07	:: .db	(0)				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFF4, 0xFFF4, 0x0000		:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set text script
	.db	0x25	:: .db	(10)				:: .align 4
	// Set interactible
	.dw	0x0C						:: .align 4
	// Set collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
	// Loop
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0269_sinit_init:
	.dw	0
overlay_0269_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 269 * 0x20
	.skip	16
	.dw	overlay_0269_sinit_init
	.dw	overlay_0269_sinit_init_end
	.skip	8

.close