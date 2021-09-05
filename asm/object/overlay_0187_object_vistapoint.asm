// Overlay 187 - Vista Point object scripts

.nds
.thumb
.open TEMP+"/overlay_0187.bin",readu32(TEMP+"/y9.bin", 187 * 0x20 + 0x4)

.orga 0x4 * 0x0F
	.dw	@obj_0F
.orga 0x4 * 0x10
	.dw	@obj_10
.orga 0x4 * 0x11
	.dw	@obj_11
.orga 0x4 * 0x12
	.dw	@obj_12
.orga 0x4 * 0x18
	.dw	@obj_18
.orga 0x4 * 0x19
	.dw	@obj_19
.orga 0x4 * 0x1A
	.dw	@obj_1A
.orga 0x4 * 0x1B
	.dw	@obj_1B


// Cutscene objects
.org 0x21BA684 + 0x4 * 0x0	// Geo in PitcherMan cutscene
	.dw	@sceneobj_pitcherman_obj_00
.org 0x21BA6BC	// Change sprite
	.dh	0x22	:: .dh	0x58			:: .align 4
.org 0x21BA6D4
	.dw	0x12	:: .dw	@sceneobj_pitcherman_obj_00_geosprite-(.-4)


// Move Speed Navi out of the way of Card Trader *
.org 0x21B9854
	.db	0x07	:: .db	0x05			:: .align 4
	.dh	0x05	:: .dh	0x012C, 0x0004, 0x0020	:: .align 4
.org 0x21B9884
	.db	0x07	:: .db	0x05			:: .align 4
	.dh	0x05	:: .dh	0x012C, 0x0004, 0x0020	:: .align 4
.org 0x21B98B4
	.db	0x07	:: .db	0x05			:: .align 4
	.dh	0x05	:: .dh	0x012C, 0x0004, 0x0020	:: .align 4


// Change movement pattern of Delivery Navi
.org 0x21B9A54
	.db	0x07	:: .db	0x05		:: .align
	.dh	0x05	:: .dh	0x0074, 0xFF7C, 0x00C0
.org 0x21B9A74
.area 0x38,0x00
@@loop:
	.db	0x06	:: .db	0x5
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.db	0x06	:: .db	0x1
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.dw	0x12	:: .dw	@@loop-(.-4)	:: .align 4
.endarea
.org 0x21B9AAC
	.db	0x07	:: .db	0x05		:: .align
	.dh	0x05	:: .dh	0x0074, 0xFF7C, 0x00C0
.org 0x21B9ACC
.area 0x38,0x00
@@loop:
	.db	0x06	:: .db	0x5
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.db	0x06	:: .db	0x1
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.dw	0x12	:: .dw	@@loop-(.-4)	:: .align 4
.endarea
.org 0x21B9B04
	.db	0x07	:: .db	0x05		:: .align
	.dh	0x05	:: .dh	0x0074, 0xFF7C, 0x00C0
.org 0x21B9B24
.area 0x38,0x00
@@loop:
	.db	0x06	:: .db	0x5
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.db	0x06	:: .db	0x1
			:: .dh	0x100, 0xA0	:: .align 4
	.dh	0x0B	:: .dh	(20)
	.dw	0x12	:: .dw	@@loop-(.-4)	:: .align 4
.endarea


// Change movement pattern of Fighter Navi
.org 0x21B9B84
	.db	0x07	:: .db	0x05		:: .align 4
	// 0xDB6, 0x15AC
	.dh	0x05	:: .dh	0x00DC, 0x015A, 0x00C0
.org 0x21B9BA4
.area 0x78,0x00
@@loop:
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x03		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x05		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.dw	0x12	:: .dw	@@loop-(.-4)
.endarea
.org 0x21B9C1C
	.db	0x07	:: .db	0x05		:: .align 4
	// 0xDB6, 0x15AC
	.dh	0x05	:: .dh	0x00DC, 0x015A, 0x00C0
.org 0x21B9C3C
.area 0x78,0x00
@@loop:
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x03		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x05		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.dw	0x12	:: .dw	@@loop-(.-4)
.endarea
.org 0x21B9CB4
	.db	0x07	:: .db	0x05		:: .align 4
	// 0xDB6, 0x15AC
	.dh	0x05	:: .dh	0x00DC, 0x015A, 0x00C0
.org 0x21B9CD4
.area 0x78,0x00
@@loop:
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x01
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x03		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.db	0x06	:: .db	0x07
			:: .dh	0x90, 0x30	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xB4	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x03
			:: .dh	0x90, 0xDC	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x06	:: .db	0x05
			:: .dh	0x90, 0xE6	:: .align 4
	.dh	0x0B	:: .dh	0x05
	.db	0x07	:: .db	0x05		:: .align 4
	.dh	0x0B	:: .dh	0x78
	.dw	0x12	:: .dw	@@loop-(.-4)
.endarea


.org readu32(TEMP+"/y9.bin", 187 * 0x20 + 0x10)
.area 0x21BE560-.


// Star Card Trader object
@obj_0F:
	// Check if chapter 3 or later
	.db	0x24	:: .db	0x00,0x2F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Card Trader
	.dh	0x22	:: .dh	0x55				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0104,0xFFE0,0x0020		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x00				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x6E				:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Jump if flag 0xA5 set
	.dh	0x13	:: .dh	0xA5	:: .dw	@@trade-(.-4)	:: .align 4
	// Wait 1 frame
	.dh	0x0B	:: .dh	0x1				:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@trade:
	// Play trader SFX 1
	.dh	0x1C	:: .dh	0x209				:: .align 4
	// Wait 18 frames
	.dh	0x0B	:: .dh	0x12				:: .align 4
	// Play trader SFX 1
	.dh	0x1C	:: .dh	0x209				:: .align 4
	// Wait 18 frames
	.dh	0x0B	:: .dh	0x12				:: .align 4
	// Play trader SFX 2
	.dh	0x1C	:: .dh	0x20D				:: .align 4
	// Wait 8 frames
	.dh	0x0B	:: .dh	0x8				:: .align 4
	// Play trader SFX 3
	.dh	0x1C	:: .dh	0x20A				:: .align 4
	// Wait for SFX to finish
	.db	0x1E						:: .align 4
	// Set flag 0xA6
	.dh	0x09	:: .dh	0xA6				:: .align 4
	// Wait 10 frames
	.dh	0x0B	:: .dh	0xA				:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Mettenna object
@obj_10:
//	// Check if in second day of chapter 2 or later
//	.db	0x24	:: .db	0x00,0x10			:: .align 4
//			:: .dw	@@end-(.-4)			:: .align 4
	// Check if in chapter 2 or later
	.db	0x24	:: .db	0x00,0x0F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check not already beaten
	.dh	0x13	:: .dh	0xF021	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mettenna
	.dh	0x22	:: .dh	0x40				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0118,0x00B8,0x0020		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x01				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x82				:: .align 4
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
	.dh	0x14	:: .dh 0xF021	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4

// Music box 1
@obj_11:
	// Check if chapter 4 or later
	.db	0x24	:: .db	0x00,0x2F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Music box
	.dh	0x22	:: .dh	0x48				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
@@loop:
	// Set position
	.dh	0x05	:: .dh	0x01E8,0x00FC,0x00C0		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x00				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x28				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4

// Music box 2
@obj_12:
	// Check if chapter 4 or later
	.db	0x24	:: .db	0x00,0x2F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Music box
	.dh	0x22	:: .dh	0x48				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
@@loop:
	// Set position
	.dh	0x05	:: .dh	0x01E8,0x013E,0x00C0		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x00				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x28				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Harp Note EX object
@obj_18:
	// Check Harp Note defeated
	.dh	0x14	:: .dh	0x64	:: .dw	@@end-(.-4)	:: .align 4
	// Check Harp Note EX not defeated
	.dh	0x13	:: .dh	0xB4	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Harp Note
	.dh	0x22	:: .dh	0x36				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0164,0xFFE4,0x00C0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
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
	// Check Harp Note EX defeated
	.dh	0x14	:: .dh	0xB4	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// 1000 Note Challenge Navi
@obj_19:
	// Check if chapter 3 or later
	.db	0x24	:: .db	0x00,0x2F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Speed Navi
	.dh	0x22	:: .dh	0x4D				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
@@loop:
	// Set position
	.dh	0x05	:: .dh	0x01D4,0x0124,0x00C0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x14				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
	// Loop
//	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4

// Star Frag merchant
@obj_1A:
	// Check if chapter 3 or later
	.db	0x24	:: .db	0x00,0x2F			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
@@loop:
	// Set position
	.dh	0x05	:: .dh	0x01A4,0x0164,0x00C0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
	// Set text script
	.db	0x25	:: .db	0x1E				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
	// Loop
//	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4

// Hollow wave
@obj_1B:
	// Check if endgame or later
	.db	0x24	:: .db	0x00,0x63			:: .align 4
			:: .dw	@@end-(.-4)			:: .align 4
	// Check if Hollow refight active
	.dh	0x14	:: .dh	0xF13B	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to wave ball
	.dh	0x22	:: .dh	0x2C8				:: .align 4
	// Set sprite palette to red
	.db	0x30	:: .db	0x03				:: .align 4
	// Set animation
	.db	0x07	:: .db	(0)				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0004, 0x00C0		:: .align 4
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set text script
	.db	0x25	:: .db	0x32				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Set interactible
	.dw	0x0C						:: .align 4
	// Set collision
	.dw	0x10						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
	// Loop
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
@sceneobj_pitcherman_obj_00:
	// Set sprite: NPC 0
	.dh	0x04	:: .dh	0x0				:: .align 4
	// Set NPC bit: Visualizer on
	.dw	0x2D	:: .dw	0x01000000			:: .align 4
	// Return (skip set sprite)
	.dw	0x12	:: .dw	0x21BA6A8-(.-4)			:: .align 4
.align 4
@sceneobj_pitcherman_obj_00_geosprite:
	// Set NPC bit: Visualizer on
	.dw	0x2D	:: .dw	0x01000000			:: .align 4
	// Start movement
	.db	0x1F	:: .db	0x13, 0x3			:: .align 4
			:: .dh	0x100, 0x18			:: .align 4
	// Return
	.dw	0x12	:: .dw	0x21BA6DC-(.-4)			:: .align 4


.align 4
overlay_0187_sinit_init:
	.dw	0
overlay_0187_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 187 * 0x20
	.skip	16
	.dw	overlay_0187_sinit_init
	.dw	overlay_0187_sinit_init_end
	.skip	8

.close