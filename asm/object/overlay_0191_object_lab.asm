// Overlay 191 - Lab object scripts

.nds
.thumb
.open TEMP+"/overlay_0191.bin",readu32(TEMP+"/y9.bin", 191 * 0x20 + 0x4)

.orga 0x4 * 0x0B
	.dw	@obj_0B
.orga 0x4 * 0x18
	.dw	@obj_18


.org readu32(TEMP+"/y9.bin", 191 * 0x20 + 0x10)


// Mettenna object
@obj_0B:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF026	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFD4,0x0098,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0A				:: .align 4
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
	.dh	0x14	:: .dh 0xF026	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Cygnus Wing EX object
@obj_18:
	// Check Cygnus Wing defeated
	.dh	0x14	:: .dh	0x63	:: .dw	@@end-(.-4)	:: .align 4
	// Check Cygnus Wing EX not defeated
	.dh	0x13	:: .dh	0xB2	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Cygnus Wing
	.dh	0x22	:: .dh	0x35				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF1C,0x024C,0x0120		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Cygnus Wing EX defeated
	.dh	0x14	:: .dh	0xB2	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0191_sinit_init:
	.dw	0
overlay_0191_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 191 * 0x20
	.skip	16
	.dw	overlay_0191_sinit_init
	.dw	overlay_0191_sinit_init_end
	.skip	8

.close