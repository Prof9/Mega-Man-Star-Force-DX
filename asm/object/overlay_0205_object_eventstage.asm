// Overlay 205 - Event Stage object scripts

.nds
.thumb
.open TEMP+"/overlay_0205.bin",readu32(TEMP+"/y9.bin", 205 * 0x20 + 0x4)


// Fix guard being interactible
.org 0x21B9168
	// Disable interaction
	.dw	0x0D					:: .align 4
.org 0x21B9174
	// Disable face player
	.dw	0x0F					:: .align 4


// Fix one of the snakes not having a text script
.org 0x21B9260	// object 0x09
.area 0x70,0x00
	// Set sprite to NPC - snake
	.dh	0x04	:: .dh	0x14			:: .align 4
	// Enable NPC
	.dw	0x02					:: .align 4
	// Check during Queen Ophiuca incident
	.db	0x24	:: .db	0x44,0x44		:: .align 4
			:: .dw	@@appear-(.-4)		:: .align 4
	// Kill NPC
	.dw	0x00					:: .align 4

@@appear:
	// Check hiberation flag
	.dh	0x13	:: .dh	0x62E			:: .align 4
			:: .dw	@@hibernate-(.-4)	:: .align 4
	// Set animation
	.db	0x07	:: .db	0x03			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0022,0x0100,0x0000	:: .align 4
	// Disable interaction
	.dw	0x0D					:: .align 4
//	// Enable interaction
//	.dw	0x0C					:: .align 4
//	// Set text script to script 34
//	.db	0x08	:: .db	(34)			:: .align 4
	// Enable collision
	.dw	0x10					:: .align 4
	// Disable Transer
	.dw	0x16					:: .align 4
	// Disable face player
	.dw	0x0F					:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4

@@hibernate:
	// Set animation
	.db	0x07	:: .dh	0x09			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0022,0x0100,0x0000	:: .align 4
	// Enable interaction
	.dw	0x0C					:: .align 4
	// Set text script to script 34
	.db	0x08	:: .db	(34)			:: .align 4
	// Enable collision
	.dw	0x10					:: .align 4
	// Disable Transer
	.dw	0x16					:: .align 4
	// Disable face player
	.dw	0x0F					:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4
.endarea

.close