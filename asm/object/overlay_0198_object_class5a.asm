// Overlay 198 - Vista Point object scripts

.nds
.thumb
.open TEMP+"/overlay_0198.bin",readu32(TEMP+"/y9.bin", 198 * 0x20 + 0x4)

.orga 0x4 * 0x18
	.dw	@obj_18


.org readu32(TEMP+"/y9.bin", 198 * 0x20 + 0x10)

// Libra Scales EX object
@obj_18:
	// Check Libra Scales defeated
	.dh	0x14	:: .dh	0x65	:: .dw	@@end-(.-4)	:: .align 4
	// Check Libra Scales EX not defeated
	.dh	0x13	:: .dh	0xB6	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Libra Scales
	.dh	0x22	:: .dh	0x37				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF9C,0xFF0C,0x00C0		:: .align 4
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
	// Check Libra Scales EX defeated
	.dh	0x14	:: .dh	0xB6	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0198_sinit_init:
	.dw	0
overlay_0198_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 198 * 0x20
	.skip	16
	.dw	overlay_0198_sinit_init
	.dw	overlay_0198_sinit_init_end
	.skip	8

.close