// Overlay 658 - Famous quest Jammer post-battle cutscene

.nds
.thumb
.create TEMP+"/overlay_0658.bin",0x21BE560

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_STANDDOWN,	1
.definelabel	@STATE_MOVE,		2
.definelabel	@STATE_MOVEEND,		3
.definelabel	@STATE_GOTITEM,		4	// used in text script
.definelabel	@STATE_GOTITEMEND,	5	// used in text script
.definelabel	@STATE_LOOKDOWN,	6	// used in text script

@camera:
	// Set camera position
	.dw	0x52
	.dw	0xFFFFFEC4,0x00000214,0x00000120

	// End script
	.dw	0x04

cutscene318_start:
@start:
	// Black out screen
	.dh	0x1F
	.db	0x01,0xFF

	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08

//	// Load sprites
//	.dh	0x74	:: .db	0x00
//	.db	0xFF
//	// Load sprite Mega Man
//	.dh	0x74	:: .db	0x01
//	.db	0x05
//	.dh	0x32
//	.dh	0xFFFF
//	// Load sprite Jammer
//	.dh	0x74	:: .db	0x01
//	.db	0x05
//	.dh	0x4A
//	.dh	0xFFFF

	// Hide player
	.dw	0x32
	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72

	// Start camera script
	.dw	0x4D
	.dw	@camera
	.dw	0x00000000
	// Load cutscene text archive
	.dh	0x28
	.dh	0x12C

	// Start NPC objects
	.dw	0x93
	.dw	@npc

	// Start fade in
	.dh	0x1F
	.db	0x00,0x08
	// Wait for screen fade
	.dw	0x0B

	// Set up cutscene skip
	.dw	0x11
	.dw	@skip-(.-4)
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_STANDDOWN
	// Wait 60 frames
	.dw	0x50
	.dw	0x1E

	// Start script 0
	.dh	0x26
	.db	0x04,0x00
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_MOVE
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_MOVEEND

	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 1
	.dh	0x26
	.db	0x04,0x01
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Start fade out
	.dh	0x1F
	.db	0x01,0x04
	// Wait for screen fade
	.dw	0x0B

	// Set player direction
	.dh	0x33
	.db	0x04,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x04,0xFF
	// Set player position
	.dw	0x35
	.dw	0xFFFFFED4,0x00000214,0x00000120

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F
	// Show area name and help signal
	.dw	0x71
	// Show player object
	.dw	0x31

	// Set flag 0xF125
	.dh	0x21
	.dh	0xF125

	// Give item 85
	.dh	0x5D
	.db	0x55,0x01

	// Camera follows player, destroy camera script
	.dw	0x53

//	// Unload extra sprites
//	.dh	0x74	:: .db	0x02
//	.db	0xFF

	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// End cutscene
	.dw	0x91
	// Clear flag 0xD1B
	.dh	0x22
	.dh	0xD1B

	// Start fade in
	.dh	0x1F
	.db	0x00,0x04
	// Wait for screen fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04

@npc:
	.dw	@npc_00
	.dw	0x0

@npc_00: // Mega Man
	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01			:: .align 4
	// Set animation (battle pose northeast)
	.db	0x07	:: .db	0x1B			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFEB4,0x0214,0x0120	:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_STANDDOWN	:: .align 4

	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_MOVE	:: .align 4

	// Do movement NPC
	.db	0x1F	:: .db	0x09,0x01,0x00	:: .dh	0x0080,0x0040
	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_MOVEEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_GOTITEM	:: .align 4

	// Set animation (item get)
	.db	0x07	:: .db	0x18			:: .align 4
	// Wait for animation
	.dw	0x1E					:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_GOTITEMEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_LOOKDOWN	:: .align 4

	// Set animation (face south)
	.db	0x07	:: .db	0x04			:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


.align 4
overlay_0658_sinit_init:
	.dw	0
overlay_0658_sinit_init_end:
	.aligna	32
overlay_0658_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 658 * 0x20
	.dw	658			// Overlay ID (overlay_0658)
	.dw	0x21BE560		// Load address
	.dw	overlay_0658_size	// Uncompressed size
	.dw	0
	.dw	overlay_0658_sinit_init
	.dw	overlay_0658_sinit_init_end
	.dw	658			// File ID
	.skip	4

.close
