.align 4
// Taurus Fire EX object
ovl0180_obj_17:
	// Check Taurus Fire defeated
	.dh	0x14	:: .dh	0x62	:: .dw	@@end-(.-4)	:: .align 4
	// Check Taurus Fire EX not defeated
	.dh	0x13	:: .dh	0xB0	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Taurus Fire
	.dh	0x22	:: .dh	0x34				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF24,0xFF54,0x00C0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Taurus Fire EX defeated
	.dh	0x14	:: .dh	0xB0	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Echo Ridge - Mettenna 1 (vending machine)
ovl0180_obj_18:
//	// Check if in second day of chapter 2 or later
//	.db	0x24	:: .db	0x00,0x10			:: .align 4
//			:: .dw	@@end-(.-4)			:: .align 4
	// Check if in chapter 2 or later
	.db	0x24	:: .db	0x00,0x0F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF01A	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFE64,0x00D4,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
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
	.dh	0x14	:: .dh 0xF01A	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Echo Ridge - Mettenna 2 (other)
ovl0180_obj_19:
//	// Check if in second day of chapter 2 or later
//	.db	0x24	:: .db	0x00,0x10			:: .align 4
//			:: .dw	@@end-(.-4)			:: .align 4
	// Check if in chapter 2 or later
	.db	0x24	:: .db	0x00,0x0F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF01B	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFF4,0x0134,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
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
	.dh	0x14	:: .dh 0xF01B	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4