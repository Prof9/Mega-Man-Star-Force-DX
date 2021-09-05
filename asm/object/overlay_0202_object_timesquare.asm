// Overlay 202 - Time Square object scripts

.nds
.thumb
.open TEMP+"/overlay_0202.bin",readu32(TEMP+"/y9.bin", 202 * 0x20 + 0x4)
.area 0x5760

.orga 0x4 * 0x12
	.dw	@obj_12
.orga 0x4 * 0x13
	.dw	@obj_13
.orga 0x4 * 0x18
	.dw	@obj_18


.org readu32(TEMP+"/y9.bin", 202 * 0x20 + 0x10)

// Mettenna object
@obj_12:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0xFF64,0xFFD4,0x0000		:: .align 4
	.dh	0x05	:: .dh	0xFF68,0x0034,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(50)				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
//	// Loop
//	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@loop:
	// Wait 15 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if defeated
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4

	// Wait 15 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if defeated
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4

	// Wait 15 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if defeated
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4

	// Wait 14 frames
	.dh	0x0B	:: .dh	0x01				:: .align 4
	// Check if defeated
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x01				:: .align 4
	.dh	0x13	:: .dh	0xF02B	:: .dw	@@end-(.-4)	:: .align 4

	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4

	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Jammer object
@obj_13:
//	// Check if Mega not in the Transer
//	.dh	0x13	:: .dh	0x55	:: .dw	@@end-(.-4)	:: .align 4
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF14F	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Jammer
	.dh	0x22	:: .dh	0x4A				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x00A6,0x00FC,0xFFE0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script
	.db	0x25	:: .db	(51)				:: .align 4
	// Set only visible with Visualizer
	.dw	0x45						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0D						:: .align 4
@@loop_v:
	// Check beat all real world viruses
	.dh	0x14	:: .dh	0xF01A	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF01B	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF01C	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF01D	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF01E	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF01F	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF020	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF021	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF022	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF023	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF024	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF025	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF026	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF027	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF028	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF029	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02A	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02B	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02C	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02D	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02E	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF02F	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF030	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF031	:: .dw	@@loop_v-(.-4)	:: .align 4
	.dh	0x14	:: .dh	0xF032	:: .dw	@@loop_v-(.-4)	:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(52)				:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh	0xF14F	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Queen Ophiuca EX object
@obj_18:
	// Check Queen Ophiuca defeated
	.dh	0x14	:: .dh	0x66	:: .dw	@@end-(.-4)	:: .align 4
	// Check Queen Ophiuca EX not defeated
	.dh	0x13	:: .dh	0xB8	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Queen Ophiuca
	.dh	0x22	:: .dh	0x38				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0064,0xFF04,0x00C0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0A				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Queen Ophiuca EX defeated
	.dh	0x14	:: .dh	0xB8	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0202_sinit_init:
	.dw	0
overlay_0202_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 202 * 0x20
	.skip	16
	.dw	overlay_0202_sinit_init
	.dw	overlay_0202_sinit_init_end
	.skip	8

.close