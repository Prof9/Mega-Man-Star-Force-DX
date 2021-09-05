// Overlay 183 - Luna's Room object scripts

.nds
.thumb
.open TEMP+"/overlay_0183.bin",readu32(TEMP+"/y9.bin", 183 * 0x20 + 0x4)

.orga 0x4 * 0x02
	// Add new object
	.dw	@obj_02


.org readu32(TEMP+"/y9.bin", 183 * 0x20 + 0x10)

@obj_02:
//	// Check if in second day of chapter 2 or later
//	.db	0x24	:: .db	0x00,0x10			:: .align 4
//			:: .dw	@@end-(.-4)			:: .align 4
	// Check if in chapter 2 or later
	.db	0x24	:: .db	0x00,0x0F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF01E	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0020,0x0040,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x00				:: .align 4
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
	.dh	0x14	:: .dh 0xF01E	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0183_sinit_init:
	.dw	0
overlay_0183_sinit_init_end:
	.aligna	32

.close

.nds
.open TEMP+"/y9.bin",0

.org 183 * 0x20
	.skip	16
	.dw	overlay_0183_sinit_init
	.dw	overlay_0183_sinit_init_end
	.skip	8

.close