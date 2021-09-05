// Overlay 204 - Nacys Roof object scripts

.nds
.thumb
.open TEMP+"/overlay_0204.bin",readu32(TEMP+"/y9.bin", 204 * 0x20 + 0x4)

.orga 0x4 * 0x0F
	// Skip exit for Aaron
	.dw	readu32(TEMP+"/overlay_0204.bin", 0x4 * 15) + 4
.orga 0x4 * 0x10
	.dw	@obj_10
.orga 0x4 * 0x11
	.dw	@obj_11


.org 0x21B9A7C	// Geo in Ophiuca cutscene
	// Don't enable Visualizer
	.dw	0x12	:: .dw	0x21B9A84-(.-4)


.org readu32(TEMP+"/y9.bin", 204 * 0x20 + 0x10)

// Mettenna object
@obj_10:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF02D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0070,0xFF12,0x0000		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x28				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh 0xF02D	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Mettenna object
@obj_11:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF02E	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF4C,0x006C,0x0020		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x07				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Disable interactible
	.db	0x0D						:: .align 4
	// Disable collision
	.db	0x11						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Loop until defeated
	.dh	0x14	:: .dh 0xF02E	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0204_sinit_init:
	.dw	0
overlay_0204_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 204 * 0x20
	.skip	16
	.dw	overlay_0204_sinit_init
	.dw	overlay_0204_sinit_init_end
	.skip	8

.close
