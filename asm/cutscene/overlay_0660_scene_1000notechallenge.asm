// Overlay 660 - 1000 Note Challenge script

.nds
.thumb
.create TEMP+"/overlay_0660.bin",0x21BE560
.area 0x6A0

@scoreScript:
	// Call function - draw score
	.dw	0x5C	:: .dw	note_drawScore|1
			:: .dw	0
	// End script
	.dw	0x04

cutscene320_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 60 frames
	.dw	0x50	:: .dw	(30)

	// Start screen fade out
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Load sprites
	.dh	0x74	:: .db	0x00
			:: .db	0xFF
	// Load sprite bull
	.dh	0x74	:: .db	0x01
			:: .db	0x05
			:: .dh	0x2D0, 0xFFFF

	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72

	// Load cutscene text archive
	.dh	0x28	:: .dh	0x12E
	// Load sound bank
	.dh	0x6E	:: .db	0x22	:: .align 4
	// Call function - setup crowd
	.dw	0x5C	:: .dw	note_setupCrowd|1
			:: .dw	0x0
	// Set crowd command to 0xFF
	.dh	0x25	:: .db	0x00, 0xFF
	// Set jump command to 0xFF
	.dh	0x25	:: .db	0x01, 0xFF
	// Start NPC objects
	.dw	0x93	:: .dw	@npc

	// Call function - clears vars
	.dw	0x5C	:: .dw	note_clearVars|1
			:: .dw	0x0
	// Call function - initialize Harp Note minigame
	.dw	0x5C	:: .dw	0x218992C|1
			:: .dw	0x0
	// Call function - set minigame level
	.dw	0x5C	:: .dw	note_setLevel|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0x000001C4, 0x00000124, 0x000000C0
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Fade out BGM
	.dw	0x46	:: .dw	(60)
	// Start screen fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start script 0
	.dh	0x26	:: .db	0x04, (0)
	// Wait for script
	.dw	0x08

	// Play music
	.dh	0x42
	.dh	0x0E

	// Wait 30000 frames
//	.dw	0x50	:: .dw	(30000)

	// Call function - initialize touch buttons
	.dw	0x5C	:: .dw	0x2189974|1
			:: .dw	0x0
	// Call function - load counter
	.dw	0x5C	:: .dw	note_loadCounter|1
			:: .dw	0x0
	// Start score script
	.dh	0x4E	:: .db	0x0	:: .align 4
			:: .dw	@scoreScript
			:: .dw	0x0
	// Call function - run game
	.dw	0x5C	:: .dw	note_runGame|1
			:: .dw	0x0

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Fade out BGM
	.dw	0x46	:: .dw	(60)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start screen fade out
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Clear flag 0x460
	.dh	0x22	:: .dh	0x460
	// Show player object
	.dw	0x31
	// Call function - finish game
	.dw	0x5C	:: .dw	0x218994C|1
			:: .dw	0x0
	// Call function - save results
	.dw	0x5C	:: .dw	note_saveResults|1
			:: .dw	0x0

	// Set player position
	.dw	0x35	:: .dw	0x000001C4, 0x00000124, 0x000000C0
	// Set player direction
	.dh	0x33
	.db	0x01,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x01,0xFF

	// Destroy score script
	.dh	0x61	:: .dh	0x0
	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F
	// Show area name and help signal
	.dw	0x71

	// Unload extra sprites
	.dh	0x74	:: .db	0x02
	.db	0xFF

	// End cutscene
	.dw	0x91
	// Clear flag 0xD1B
	.dh	0x22
	.dh	0xD1B

	// Play area BGM
	.dw	0x43

	// Start screen fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start script 1
	.dh	0x26	:: .db	0x04, (1)
	// Wait for script
	.dw	0x08

	// Clear flag 0xF12C
	.dh	0x22	:: .dh	0xF12C
	// Clear flag 0x461
	.dh	0x22	:: .dh	0x461
	// Clear flag 0x463
	.dh	0x22	:: .dh	0x463
	// Clear flag 0x462
	.dh	0x22	:: .dh	0x462

	// Unlock player controls
	.dw	0x2A
	// End
	.dw	0x04


.align 4
@npc:
	.dw	@npc_00
	.dw	@npc_01
	.dw	@npc_02
	.dw	@npc_03
	.dw	@npc_04
	.dw	@npc_05
	.dw	@npc_06
	.dw	@npc_07
	.dw	@npc_08
	.dw	@npc_09
	.dw	@npc_0A
	.dw	@npc_0B
	.dw	0x0

.align 4
@npc_00: // Speed Navi
	// Set sprite to Speed Navi
	.dh	0x22	:: .dh	0x4D				:: .align 4
	// Set animation (face northwest)
	.db	0x07	:: .db	0x07				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x01EC, 0x0164, 0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x01E4, 0x0164, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4

.align 4
@npc_01: // Shop Hertz
	// Disable NPC
	.dw	0x00						:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set animation (face northwest)
	.db	0x07	:: .db	0x07				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x01DC, 0x0164, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4

@npc_02: // Music box 1
	// Set sprite to music box
	.dh	0x22	:: .dh	0x48				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x01E8,0x00FC,0x00C0		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4

@npc_03: // Music box 2
	// Set sprite to music box
	.dh	0x22	:: .dh	0x48				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x01E8,0x013E,0x00C0		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x00				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4

@npc_04: // Crowd 0 (big)
	// Set position
//	.dh	0x05	:: .dh	0x0154,0x0168,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F0,0x0168,0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Check if bull
	.dh	0x13	:: .dh	0xF132	:: .dw	@@bull-(.-4)	:: .align 4
@@truck:
	// Set sprite to Truck Navi
	.dh	0x22	:: .dh	0x4F				:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x00			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x100, 0x64			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4
@@bull:
	// Set sprite to bull
	.dh	0x22	:: .dh	0x2D0				:: .align 4
	// Set animation (face northeast)
	.db	0x07	:: .db	0x00				:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x00			:: .align 4
	// Walk up
	.db	0x1F	:: .db	0x04, 0x01			:: .align 4
			:: .dh	0x100, 0x64			:: .align 4
	// Set animation (face northeast)
	.db	0x07	:: .db	0x00				:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4

@npc_05: // Crowd 1
	// Set sprite to buffer 1
	.dh	0x22	:: .dh	0x8001				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x016C,0x015C,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F8,0x015C,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x01			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x3A			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x01			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_06: // Crowd 2
	// Set sprite to buffer 2
	.dh	0x22	:: .dh	0x8002				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x0168,0x016C,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F0,0x016C,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x02			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x3C			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x02			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_07: // Crowd 3
	// Set sprite to buffer 3
	.dh	0x22	:: .dh	0x8003				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x0168,0x014C,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F4,0x0164,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x03			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x3A			:: .align 4
	.db	0x06	:: .db	0x07
			:: .dh	0x200, 0xC			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x03			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_08: // Crowd 4
	// Set sprite to buffer 4
	.dh	0x22	:: .dh	0x8004				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x016C,0x0178,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F0,0x0168,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x04			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x3E			:: .align 4
	.db	0x06	:: .db	0x03
			:: .dh	0x200, 0x8			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x04			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_09: // Crowd 5
	// Set sprite to buffer 5
	.dh	0x22	:: .dh	0x8005				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x015A,0x0154,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F8,0x0160,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x05			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x31			:: .align 4
	.db	0x06	:: .db	0x07
			:: .dh	0x200, 0x6			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x05			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_0A: // Crowd 6
	// Set sprite to buffer 6
	.dh	0x22	:: .dh	0x8006				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x015C,0x0178,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F8,0x0160,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x06			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x32			:: .align 4
	.db	0x06	:: .db	0x03
			:: .dh	0x200, 0xC			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x06			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4

@npc_0B: // Crowd 7
	// Set sprite to buffer 7
	.dh	0x22	:: .dh	0x8007				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0x0168,0x0184,0x00C0		:: .align 4
	.dh	0x05	:: .dh	0x00F0,0x0168,0x00C0		:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for crowd command
	.db	0x18	:: .db	0x00, 0x07			:: .align 4
	// Walk up
	.db	0x06	:: .db	0x01
			:: .dh	0x200, 0x3C			:: .align 4
	.db	0x06	:: .db	0x03
			:: .dh	0x200, 0xE			:: .align 4
	// Set direction (face northeast)
	.db	0x07	:: .db	0x01				:: .align 4
@@loop:
	// Wait for jump command
	.db	0x18	:: .db	0x01, 0x07			:: .align 4
	// Reset jump command
	.db	0x17	:: .db	0x01, 0xFF			:: .align 4
	// Detach shadow
	.db	0x3A						:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x4,0x1				:: .align 4
	// Attach shadow
	.db	0x3B						:: .align 4
	// Loop
	.dw	0x12	:: .dw	@@loop-(.-4)			:: .align 4


.align 4
overlay_0660_sinit_init:
	.dw	0
overlay_0660_sinit_init_end:
	.aligna	32
overlay_0660_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 660 * 0x20
	.dw	660			// Overlay ID (overlay_0660)
	.dw	0x21BE560		// Load address
	.dw	overlay_0660_size	// Uncompressed size
	.dw	0
	.dw	overlay_0660_sinit_init
	.dw	overlay_0660_sinit_init_end
	.dw	660			// File ID
	.skip	4

.close
