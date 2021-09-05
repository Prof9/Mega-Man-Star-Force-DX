// Overlay 184 - Bud's Room object scripts

.nds
.thumb
.open TEMP+"/overlay_0184.bin",readu32(TEMP+"/y9.bin", 184 * 0x20 + 0x4)

.orga 0x4 * 0x02
	// Add new object
	.dw	@obj_02


.org readu32(TEMP+"/y9.bin", 184 * 0x20 + 0x10)

@obj_02:
//	// Check if in second day of chapter 2 or later
//	.db	0x24	:: .db	0x00,0x10			:: .align 4
//			:: .dw	@@end-(.-4)			:: .align 4
	// Check if in chapter 2 or later
	.db	0x24	:: .db	0x00,0x0F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFFA,0x004C,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set only visible with Visualizer
	.db	0x45						:: .align 4
	// Set jumping flag
	.dh	0x09	:: .dh	0xF033				:: .align 4
@@loop:
	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4
	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4

	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4
	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4

	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4
	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4

	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4
	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4
@@jump:
	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4

	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4

	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4

	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4

	// Check if defeated
	.dh	0x13	:: .dh	0xF01F	:: .dw	@@end-(.-4)	:: .align 4
	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4

	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4

	// Check if not jumping
	.dh	0x14	:: .dh	0xF033	:: .dw	@@jump-(.-4)	:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0184_sinit_init:
	.dw	0
overlay_0184_sinit_init_end:
	.aligna	32

.close

.nds
.open TEMP+"/y9.bin",0

.org 184 * 0x20
	.skip	16
	.dw	overlay_0184_sinit_init
	.dw	overlay_0184_sinit_init_end
	.skip	8

.close