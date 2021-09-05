// Overlay 219 - Deep Space 1 object scripts

.nds
.thumb
.open TEMP+"/overlay_0219.bin",readu32(TEMP+"/y9.bin", 219 * 0x20 + 0x4)

.orga 0x4 * 0x00
	.dw	@obj_00
.orga 0x4 * 0x01
	.dw	@obj_01


.org readu32(TEMP+"/y9.bin", 219 * 0x20 + 0x10)

// Jammer object
@obj_00:
	// Check endgame chapter
	.db	0x24	:: .db	0x00,0x63			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Jammer
	.dh	0x22	:: .dh	0x4A				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFEEC,0xFFFC,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4

// Pegasus Magic object
@obj_01:
	// Check Pegasus Magic defeated
	.dh	0x14	:: .dh	0xF108	:: .dw	@@end-(.-4)	:: .align 4
	// Check Pegasus Magic EX not defeated
	.dh	0x13	:: .dh	0xF109	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Pegasus Magic
	.dh	0x22	:: .dh	0x39A				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFAC,0xFE9C,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
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
	// Check Pegasus Magic EX defeated
	.dh	0x14	:: .dh	0xF109	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0219_sinit_init:
	.dw	0
overlay_0219_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 219 * 0x20
	.skip	16
	.dw	overlay_0219_sinit_init
	.dw	overlay_0219_sinit_init_end
	.skip	8

.close