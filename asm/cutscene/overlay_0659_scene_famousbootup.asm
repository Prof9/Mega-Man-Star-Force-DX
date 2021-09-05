// Overlay 659 - Famous quest boot-up cutscene

.nds
.thumb
.create TEMP+"/overlay_0659.bin",0x21BE560

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_WALKUP,		1
.definelabel	@STATE_WALKUPEND,	2
.definelabel	@STATE_WALKDOWN,	3
.definelabel	@STATE_WALKDOWNEND,	4
.definelabel	@STATE_GOTITEM,		5	// used in text script
.definelabel	@STATE_GOTITEMEND,	6	// used in text script
.definelabel	@STATE_GEODONE,		7	// used in text script
.definelabel	@STATE_JUMP,		8

.definelabel	@STATE_BOOTUP,		1
.definelabel	@STATE_BOOTUPEND,	2
.definelabel	@STATE_FACEUP,		3
.definelabel	@STATE_FACEDOWN,	4
.definelabel	@STATE_LOOKCLAUD,	5

@camera:
	// Set camera position
	.dw	0x52
	.dw	0xFFFFFFB4,0x00000032,0x00000000

	// End script
	.dw	0x04

cutscene319_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Start screen fade
	.dh	0x1F
	.db	0x01,0x04
	// Wait for screen fade
	.dw	0x0B
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C
	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08
	// Disable Visualizer
	.dh	0x62
	.dh	0x01
	// Hide Wave World
	.dh	0x22
	.dh	0xD08

//	// Load sprites
//	.dh	0x74	:: .db	0x00
//	.db	0xFF
//	// Load sprite Mega Man
//	.dh	0x74	:: .db	0x01
//	.db	0x05
//	.dh	0x0
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
	.dh	0x12D

	// Start NPC objects
	.dw	0x93
	.dw	@npc

	// Start fade in
	.dh	0x1F
	.db	0x00,0x04
	// Wait for screen fade
	.dw	0x0B

	// Set up cutscene skip
	.dw	0x11
	.dw	@skip-(.-4)
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_WALKUP
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_WALKUPEND
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

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
	.db	0x00,@STATE_WALKDOWN
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_WALKDOWNEND
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_BOOTUP
	// Wait for NPC variable
	.dh	0x0D
	.db	0x01,@STATE_BOOTUPEND
	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_JUMP
	// Wait 90 frames
	.dw	0x50
	.dw	(90)

	// Start script 1
	.dh	0x26
	.db	0x04,0x01
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 2
	.dh	0x26
	.db	0x04,0x02
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_LOOKCLAUD
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Start script 3
	.dh	0x26
	.db	0x04,0x03
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_FACEUP
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Start script 4
	.dh	0x26
	.db	0x04,0x04
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_FACEDOWN
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Start script 5
	.dh	0x26
	.db	0x04,0x05
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
	.db	0x01,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x01,0xFF
	// Set player position
	.dw	0x35
	.dw	0xFFFFFF94,0x00000032,0x00000000

	// Take Old Data item
	.dh	0x5E
	.db	(85), 0x1

	// Give SlowGauge card
	.dh	0x5F
	.dh	0xAA
	.db	0x01,0x00	:: .align 4

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

	// Set flag 0xF128
	.dh	0x21
	.dh	0xF128

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
	.dw	@npc_01
	.dw	@npc_02
	.dw	@npc_03
	.dw	0x0

@npc_00: // Geo
	// Set sprite to Geo (NPC 0)
	.dh	0x04	:: .dh	0x00			:: .align 4
	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF94,0x0032,0x0000	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_WALKUP	:: .align 4

	// Do movement NPC
	.db	0x1F	:: .db	0x09,0x01,0x00	:: .dh	0x0080,0x0020
	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_WALKUPEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_WALKDOWN	:: .align 4

	// Do movement NPC
	.db	0x1F	:: .db	0x09,0x05,0x00	:: .dh	0x0080,0x0020
	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_WALKDOWNEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_JUMP	:: .align 4

	// Detach shadow
	.dw	0x3A					:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x6,0x1			:: .align 4
	// Attach shadow
	.dw	0x3B					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_GOTITEM	:: .align 4

	// Set animation (item get)
	.db	0x07	:: .db	0x18			:: .align 4
	// Wait for animation
	.dw	0x1E					:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_GOTITEMEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_GEODONE	:: .align 4

	// Set animation (face northeast)
	.db	0x07	:: .db	0x01			:: .align 4

	// Loop forever
	.dw	0x01					:: .align 4

@npc_01: // Famous
	// Set sprite to Mr. Famous (NPC 3)
	.dh	0x04	:: .dh	0x03			:: .align 4
	// Set animation (inactive)
	.db	0x07	:: .db	0x08			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFB4,0x0032,0x0000	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_BOOTUP	:: .align 4

	// Set animation (shake)
	.db	0x07	:: .db	(9)			:: .align 4
	// Wait 30 frames
	.dh	0x0B	:: .db	(30)			:: .align 4
	// Set animation (boot up)
	.db	0x07	:: .db	(10)			:: .align 4
	// Wait for animation
	.db	0x1E					:: .align 4
	// Set animation (face southwest)
	.db	0x07	:: .db	(5)			:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x01,@STATE_BOOTUPEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_FACEUP	:: .align 4

	// Set animation (face northwest)
	.db	0x07	:: .db	0x07			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_FACEDOWN	:: .align 4

	// Set animation (face southwest)
	.db	0x07	:: .db	0x05			:: .align 4

	// Loop forever
	.dw	0x01					:: .align 4

@npc_02: // Ken
	// Set sprite to Ken Suther (NPC 2)
	.dh	0x04	:: .dh	0x02			:: .align 4
	// Set animation (face southeast, no shadow)
	.db	0x07	:: .db	(25)			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFD8,0x0004,0x0000	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_JUMP	:: .align 4

	// Wait 5 frames
	.dh	0x0B	:: .dh	0x5
	// Detach shadow
	.dw	0x3A					:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x6,0x1			:: .align 4
	// Attach shadow
	.dw	0x3B					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_FACEDOWN	:: .align 4

	// Set animation (face southwest)
	.db	0x07	:: .db	0x05			:: .align 4

	// Loop forever
	.dw	0x01					:: .align 4

@npc_03: // Claud
	// Set sprite to Claud Pincer (NPC 11)
	.dh	0x04	:: .dh	0x0B			:: .align 4
	// Set animation (face southwest)
	.db	0x07	:: .db	0x05			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFDC,0x0044,0x0000	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_JUMP	:: .align 4

	// Wait 10 frames
	.dh	0x0B	:: .dh	0xA
	// Detach shadow
	.dw	0x3A					:: .align 4
	// Jump up and down
	.dh	0x1B	:: .dh	0x6,0x1			:: .align 4
	// Attach shadow
	.dw	0x3B					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_LOOKCLAUD	:: .align 4

	// Set animation (face northwest)
	.db	0x07	:: .db	0x07			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x01,@STATE_FACEDOWN	:: .align 4

	// Set animation (face southwest)
	.db	0x07	:: .db	0x05			:: .align 4

	// Loop forever
	.dw	0x01					:: .align 4


.align 4
overlay_0659_sinit_init:
	.dw	0
overlay_0659_sinit_init_end:
	.aligna	32
overlay_0659_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 659 * 0x20
	.dw	659			// Overlay ID (overlay_0659)
	.dw	0x21BE560		// Load address
	.dw	overlay_0659_size	// Uncompressed size
	.dw	0
	.dw	overlay_0659_sinit_init
	.dw	overlay_0659_sinit_init_end
	.dw	659			// File ID
	.skip	4

.close
