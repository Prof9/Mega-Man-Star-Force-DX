// Overlay 186 - BIG WAVE object scripts

.nds
.thumb
.open TEMP+"/overlay_0186.bin",readu32(TEMP+"/y9.bin", 186 * 0x20 + 0x4)

.orga 0x4 * 4
	// Add new object
	.dw	@obj_04
.orga 0x4 * 5
	// Add new object
	.dw	@obj_05


// Move the Truck Navi so he doesn't cover Famous
.org 0x21B8F74
	// Face southeast
	.db	0x07	:: .db	0x5				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0xFF2E, 0x010C, 0x00C0		:: .align 4
	.dh	0x05	:: .dh	0xFECE, 0x01AC, 0x00C0		:: .align 4


.org readu32(TEMP+"/y9.bin", 186 * 0x20 + 0x10)

@obj_04:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF6C,0x002C,0x00C0		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0A				:: .align 4
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


@obj_05: // Mr. Famousbot
	// Check if Libra Scales defeated
	.db	0x24	:: .db	0x00,0x3F		:: .align 4
			:: .dw	@@end-(.-4)
	// Set to NPC 3
	.dh	0x04	:: .dh	0x03			:: .align 4
	// Set visible
	.db	0x02					:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0xFFE6,0x007A,0x0000	:: .align 4
//	.dh	0x05	:: .dh	0xFFB4,0x007A,0x0000	:: .align 4
	.dh	0x05	:: .dh	0xFFB4,0x0032,0x0000	:: .align 4
	// Check Famous quest finished
	.dh	0x13	:: .dh	0xF128	:: .dw	@@active-(.-4)
	// Set direction (inactive)
	.db	0x07	:: .db	0x08			:: .align 4
	// Set text script
	.db	0x25	:: .db	0x3C			:: .align 4
	// Set interactible
	.db	0x0C					:: .align 4
	// Set collision
	.db	0x10					:: .align 4
	// Loop
	.db	0x01					:: .align 4
@@end:
	// Kill NPC
	.dw	0x00					:: .align 4

@@active:
	// Set direction (southwest)
	.db	0x07	:: .db	0x05			:: .align 4
	// Set text script
	.db	0x25	:: .db	0x3C			:: .align 4
	// Set interactible
	.db	0x0C					:: .align 4
	// Set collision
	.db	0x10					:: .align 4
	// Enable Transer over head
	.db	0x15					:: .align 4
	// Enable face player
	.db	0x0E					:: .align 4
	// Loop
	.db	0x01					:: .align 4


.align 4
overlay_0186_sinit_init:
	.dw	0
overlay_0186_sinit_init_end:
	.aligna	32
.close


.nds
.open TEMP+"/y9.bin",0

.org 186 * 0x20
	.skip	16
	.dw	overlay_0186_sinit_init
	.dw	overlay_0186_sinit_init_end
	.skip	8

.close