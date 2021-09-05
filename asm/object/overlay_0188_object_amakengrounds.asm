// Overlay 188 - AMAKEN Grounds object scripts

.nds
.thumb
.open TEMP+"/overlay_0188.bin",readu32(TEMP+"/y9.bin", 188 * 0x20 + 0x4)

.orga 0x4 * 0x10
	.dw	@obj_10
.orga 0x4 * 0x11
	.dw	@obj_11
.orga 0x4 * 0x12
	.dw	@obj_12
.orga 0x4 * 0x1A
	.dw	@obj_1A
.orga 0x4 * 0x1B
	.dw	@obj_1B


// Fix duplicate object during Harp Note incident
.org 0x21B9AD4
	.db	0x24	:: .db	0x24,0x24			:: .align 4
			:: .dw	0x10


.org readu32(TEMP+"/y9.bin", 188 * 0x20 + 0x10)
.area 0x21BE560-.


.align 4
@obj_10:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF022	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x00D2,0x00D2,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x50				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh 0xF022	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
@obj_11:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF023	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0074,0xFE54,0x0080		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x51				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh 0xF023	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
@obj_12:
	// Check if gave Navi Chip to Ken
	.dh	0x13	:: .dh	0xF123	:: .dw	@@end-(.-4)	:: .align 4
	// Check if Famous quest active
	.dh	0x14	:: .dh	0xF120	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to worker
	.dh	0x22	:: .dh	0x17				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF0C,0x00BC,0xFFE0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x5A				:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
	// Check if should stop moving
	.dh	0x13	:: .dh	0xF122	:: .dw	@@idle-(.-4)	:: .align 4
@@loop:
	// Wait 30 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if should stop moving
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4

	// Wait 30 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if should stop moving
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF122	:: .dw	@@stop-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@stop:
	// Check if flag active
	.dh	0x14	:: .dh	0xD2E	:: .dw	@@idle-(.-4)	:: .align 4
	// Clear flag that prevents NPC direction from being reset
	.dh	0x0A	:: .dh	0xD2E				:: .align 4
@@idle:
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
@obj_1A:
	// Check if defeated
	.dh	0x13	:: .dh	0xF124	:: .dw	@@end-(.-4)	:: .align 4
	// Check if gave Navi Chip to Ken
	.dh	0x14	:: .dh	0xF123	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Jammer
	.dh	0x22	:: .dh	0x4A				:: .align 4
	// Enable NPC
	dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFED4,0x0214,0x0120		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(10)				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh 0xF124	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
@obj_1B:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFEB4,0xFF6A,0x0120		:: .align 4
	// Set text script
	.db	0x25	:: .db	(20)				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
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
overlay_0188_sinit_init:
	.dw	0
overlay_0188_sinit_init_end:
	.aligna	32


.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 188 * 0x20
	.skip	16
	.dw	overlay_0188_sinit_init
	.dw	overlay_0188_sinit_init_end
	.skip	8

.close