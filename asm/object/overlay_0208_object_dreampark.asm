// Overlay 208 - Dream Park object scripts

.nds
.thumb
.open TEMP+"/overlay_0208.bin",readu32(TEMP+"/y9.bin", 208 * 0x20 + 0x4)

.orga 0x4 * 0x02
	.dw	@obj_02
.orga 0x4 * 0x18
	.dw	@obj_18
.orga 0x4 * 0x19
	.dw	@obj_19
.orga 0x4 * 0x1A
	.dw	@obj_1A


.org readu32(TEMP+"/y9.bin", 208 * 0x20 + 0x10)

// Mettenna object
@obj_02:
	// Check if in second day of chapter 2 or later
	.db	0x24	:: .db	0x00,0x10			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF031	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF00,0x00AC,0xFFF0		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script (NOTE: Also done in see-saw object script)
	.db	0x25	:: .db	0x14				:: .align 4
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
	.dh	0x14	:: .dh 0xF031	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Gemini Spark EX B object
@obj_18:
	// Check Gemini Spark defeated
	.dh	0x14	:: .dh	0x67	:: .dw	@@end-(.-4)	:: .align 4
	// Check Gemini Spark EX not defeated
	.dh	0x13	:: .dh	0xBA	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Gemini Spark B
	.dh	0x22	:: .dh	0x3A				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF74+0x8,0x01F4,0x0100	:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
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
	// Check Gemini Spark EX defeated
	.dh	0x14	:: .dh	0xBA	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Gemini Spark EX W object
@obj_19:
	// Check Gemini Spark defeated
	.dh	0x14	:: .dh	0x67	:: .dw	@@end-(.-4)	:: .align 4
	// Check Gemini Spark EX not defeated
	.dh	0x13	:: .dh	0xBA	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Gemini Spark W
	.dh	0x22	:: .dh	0x39				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF74-0xA,0x01F4,0x0100	:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x0B				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Gemini Spark EX defeated
	.dh	0x14	:: .dh	0xBA	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


@obj_1A:
	// Check Lunar Knights quest finished
	.dh	0x14	:: .dh	0x90D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to purple
	.db	0x30	:: .db	0x02				:: .align 4
	// Set visible
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFF4,0xFFB4,0x0100		:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14				:: .align 4
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


.align 4
overlay_0208_sinit_init:
	.dw	0
overlay_0208_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 208 * 0x20
	.skip	16
	.dw	overlay_0208_sinit_init
	.dw	overlay_0208_sinit_init_end
	.skip	8

.close