// Overlay 200 - Gym object scripts

.nds
.thumb
.open TEMP+"/overlay_0200.bin",readu32(TEMP+"/y9.bin", 200 * 0x20 + 0x4)

.orga 0x4 * 0x06
	// Add new object
	.dw	@obj_06
.orga 0x4 * 0x07
	// Add new object
	.dw	@obj_07


.org readu32(TEMP+"/y9.bin", 200 * 0x20 + 0x10)

@obj_06:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x013E,0x0034,0x00C0		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Set interactible
	.db	0x0C						:: .align 4
	// Set collision
	.db	0x10						:: .align 4
	// Loop
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Mettenna object
@obj_07:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF029	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x003E,0x00A8,0x0010		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14				:: .align 4
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
	.dh	0x14	:: .dh 0xF029	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0200_sinit_init:
	.dw	0
overlay_0200_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 200 * 0x20
	.skip	16
	.dw	overlay_0200_sinit_init
	.dw	overlay_0200_sinit_init_end
	.skip	8

.close