// Overlay 220 - Deep Space 2 object scripts

.nds
.thumb
.open TEMP+"/overlay_0220.bin",readu32(TEMP+"/y9.bin", 220 * 0x20 + 0x4)

.orga 0x4 * 0x01
	.dw	@obj_01
.orga 0x4 * 0x02
	.dw	@obj_02
.orga 0x4 * 0x03
	.dw	@obj_03
.orga 0x4 * 0x04
	.dw	@obj_04


.org readu32(TEMP+"/y9.bin", 220 * 0x20 + 0x10)


// Leo Kingdom object
@obj_01:
	// Check Leo Kingdom defeated
	.dh	0x14	:: .dh	0xF10A	:: .dw	@@end-(.-4)	:: .align 4
	// Check Leo Kingdom EX not defeated
	.dh	0x13	:: .dh	0xF10B	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Leo Kingdom
	.dh	0x22	:: .dh	0x39B				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFD4, 0xFEF4, 0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script
	.db	0x25	:: .db	(0)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Leo Kingdom EX defeated
	.dh	0x14	:: .dh	0xF10B	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Legend Folder NPC
@obj_02:
	// Set sprite to walking Jammer
	.dh	0x22	:: .dh	0x53				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0028, 0x0100, 0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script
	.db	0x25	:: .db	(10)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
@@loop:
	// Walk northwest
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0x2C8			:: .align 4
	// Wait 5 frames
	.dh	0x0B	:: .dh	(5)				:: .align 4
	// Set direction
	.db	0x07	:: .dh	0x07				:: .align 4
	// Wait 120 frames
	.dh	0x0B	:: .dh	(120)				:: .align 4
	// Walk southeast
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0x2C8			:: .align 4
	// Wait 5 frames
	.dh	0x0B	:: .dh	(5)				:: .align 4
	// Walk northeast
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0x19C			:: .align 4
	// Wait 5 frames
	.dh	0x0B	:: .dh	(5)				:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Wait 120 frames
	.dh	0x0B	:: .dh	(120)				:: .align 4
	// Walk southwest
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0x19C			:: .align 4
	// Wait 5 frames
	.dh	0x0B	:: .dh	(5)				:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4


// Star Frag Trader
@obj_03:
	// Set sprite to Star Frag Trader
	.dh	0x22	:: .dh	0x57				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x00F4, 0xFFD0, 0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x00				:: .align 4
	// Set text script
	.db	0x25	:: .db	(19)				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
@@loop:
	// Jump if activation flag set
	.dh	0x13	:: .dh	0xF175	:: .dw	@@active-(.-4)	:: .align 4
	// Wait 1 frame
	.dh	0x0B	:: .dh	0x1				:: .align 4
	// Wait for activation
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@active:
	// Do animation
	.db	0x07	:: .db	0x01				:: .align 4
	// Wait for animation
	.dw	0x1E						:: .align 4
	// Unset activation flag
	.dh	0x0A	:: .dh	0xF175				:: .align 4
	// Set finished flag
	.dh	0x09	:: .dh	0xF176				:: .align 4
	// Reset animation
	.db	0x07	:: .db	0x00				:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4


// Database Navi
@obj_04:
	// Check got the Giga Card
	.dh	0x13	:: .dh	0xF162	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Info Navi
	.dh	0x22	:: .dh	0x56				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF16, 0x009A, 0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(30)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Loop
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0220_sinit_init:
	.dw	0
overlay_0220_sinit_init_end:
	.aligna	32

.close


.nds
.open TEMP+"/y9.bin",0

.org 220 * 0x20
	.skip	16
	.dw	overlay_0220_sinit_init
	.dw	overlay_0220_sinit_init_end
	.skip	8

.close