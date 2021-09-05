// Overlay 201 - Studio object scripts

.nds
.thumb
.open TEMP+"/overlay_0201.bin",readu32(TEMP+"/y9.bin", 201 * 0x20 + 0x4)

.orga 0x4 * 0x06
	// Add new object
	.dw	@obj_06


.org readu32(TEMP+"/y9.bin", 201 * 0x20 + 0x10)


// Mettenna object
@obj_06:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
@@loop2:
	// Set position
//	.dh	0x05	:: .dh	0xFFA4,0x0022,0x0000		:: .align 4
	.dh	0x05	:: .dh	0xFFB2,0x0022,0x0000		:: .align 4
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
	// Wait 32 frames
	.dh	0x0B	:: .dh	0x1				:: .align 4
	// Check if defeated
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4
	.dh	0x0B	:: .dh	0x1				:: .align 4
	.dh	0x13	:: .dh	0xF02A	:: .dw	@@end-(.-4)	:: .align 4

	// Disable interactible update
	.dw	0x48						:: .align 4
	// Set not interactible
	.db	0x0D						:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x7,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Set interactible
	.db	0x0C						:: .align 4
	// Enable interactible update
	.dw	0x49						:: .align 4

	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0201_sinit_init:
	.dw	0
overlay_0201_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 201 * 0x20
	.skip	16
	.dw	overlay_0201_sinit_init
	.dw	overlay_0201_sinit_init_end
	.skip	8

.close