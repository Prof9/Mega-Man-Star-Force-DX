// Overlay 654 - Dragon Shadow post-battle cutscene

.nds
.thumb
.create TEMP+"/overlay_0654.bin",0x21BE560

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_MOVE,		1
.definelabel	@STATE_MOVEEND,		2
.definelabel	@STATE_STARTBEAM,	3
.definelabel	@STATE_ENDBEAM,		4
.definelabel	@STATE_FADEWHITE,	5
.definelabel	@STATE_STAND,		6
.definelabel	@STATE_VANISH,		7
.definelabel	@STATE_CAMERA,		8
.definelabel	@STATE_CAMERAEND,	9
.definelabel	@STATE_LOOKMEGA,	10
.definelabel	@STATE_LOOKAWAY,	11

@camera:
	// Set camera position
	.dw	0x52
	.dw	0x0000005E,0xFFFFFE5A,0x00000120
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_CAMERA

	// Set up camera movement
	.dw	0x06
	.dh	0x0080,0x0040,0x0003
	.dh	0xFFFF
	// Start camera movement
	.dw	0x07
	// Wait for camera movement
	.dw	0x0C

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_CAMERAEND

	// End script
	.dw	0x04

@sound:
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_STARTBEAM

	// Play ping SFX
	.dh	0x41
	.dh	0x00E6
@@loop:
	// Play glow SFX
	.dh	0x41
	.dh	0x020C
	// Wait 35 frames
	.dw	0x50
	.dw	0x23
	// Loop unless next segment
	.dh	0x17
	.db	0x00,@STATE_FADEWHITE
	.dw	@@next-(.-4)
	// Loop
	.dw	0x13
	.dw	@@loop-(.-4)
@@next:
	// Play whiteout SFX
	.dh	0x41
	.dh	0x0076

	// End script
	.dw	0x04

cutscene315_start:
@start:
	// Black out screen
	.dh	0x1F
	.db	0x01,0xFF
	// Stop BGM
	.dw	0x48

	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08

	// Load sprites
	.dh	0x74	:: .db	0x00
	.db	0xFF
	// Load sprite Mega Man special
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x35E
	.dh	0xFFFF
	// Load sprite Dragon Shadow
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x361
	.dh	0xFFFF
	// Load sprite light beam
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x347
	.dh	0xFFFF

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
	// Start sound script
	.dw	0x4E
	.dw	@sound
	.dw	0x00000000
	// Load cutscene text archive
	.dh	0x28
	.dh	0x129

	// Load sound bank
	.dh	0x6E
	.dh	0x17

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
	.db	0x00,@STATE_MOVE
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_MOVEEND
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
	.db	0x00,@STATE_STARTBEAM
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_ENDBEAM

	// Wait 120 frames
	.dw	0x50
	.dw	0x78

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_FADEWHITE
	// Start slow fade out to white
	.dh	0x1F
	.db	0x13,0x04
	// Wait for screen fade
	.dw	0x0B
	// Wait 180 frames
	.dw	0x50
	.dw	0xB4

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_STAND
	// Start slow fade in from white
	.dh	0x1F
	.db	0x12,0x04
	// Wait for screen fade
	.dw	0x0B
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

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_VANISH
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_CAMERA
	// Wait for camera movement
	.dh	0x0D
	.db	0x00,@STATE_CAMERAEND
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
	.db	0x00,@STATE_LOOKMEGA
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

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
	.db	0x00,@STATE_LOOKAWAY
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 4
	.dh	0x26
	.db	0x04,0x04
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
	.db	0x03,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x03,0xFF
	// Set player position
	.dw	0x35
	.dw	0x00000054,0xFFFFFE84,0x00000120

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

	// Set flag 97 (unlocks Dream Island, Star Force)
	.dh	0x21
	.dh	0x0061

	// Receive mail 7
	.dh	0x92
	.dh	0x1607
	.dw	0x0

	// Camera follows player, destroy camera script
	.dw	0x53
	// Destroy sound script
	.dh	0x61
	.dh	0x00

	// Unload extra sprites
	.dh	0x74	:: .db	0x02
	.db	0xFF

	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Play area BGM
	.dw	0x43

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
	.dw	0x0

@npc_00: // Mega Man
	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01			:: .align 4
	// Set animation (battle pose northwest)
	.db	0x07	:: .db	0x1E			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054,0xFE84,0x0120	:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_ENDBEAM	:: .align 4

	// Set sprite to Mega Man special
	.dh	0x22	:: .dh	0x35E			:: .align 4
	// Set animation (struck by light beam)
	.db	0x07	:: .db	0x02			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_STAND	:: .align 4

	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01			:: .align 4
	// Set animation (look northwest)
	.db	0x07	:: .db	0x07			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_LOOKMEGA	:: .align 4

	// Set animation (look south)
	.db	0x07	:: .db	0x04			:: .align 4
	// Wait 30 frames
	.dh	0x0B	:: .dh	(30)			:: .align 4
	// Set animation (look at Mega)
	.db	0x07	:: .db	0x19			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_LOOKAWAY	:: .align 4

	// Set animation (put away Mega)
	.db	0x07	:: .db	0x1A			:: .align 4
	// Wait for animation
	.dw	0x1E					:: .align 4
	// Set animation (look south)
	.db	0x07	:: .db	0x04			:: .align 4
	// Wait 30 frames
	.dh	0x0B	:: .dh	0x1E			:: .align 4
	// Set animation (look southeast)
	.db	0x07	:: .db	0x03			:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


@npc_01: // Dragon Sky
	// Set sprite to Dragon Shadow
	.dh	0x22	:: .dh	0x361			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054,0xFE58,0x0120	:: .align 4
	// Set animation (idle southeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_MOVE	:: .align 4

	// Do movement NPC
	.db	0x1F	:: .db	0x01,0x07,0x00	:: .dh	0x0080,0x0020
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_MOVEEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_VANISH	:: .align 4

	// Set animation (disappear southeast)
	.db	0x07	:: .db	0x04			:: .align 4
	// Play SFX
	.dh	0x1C	:: .dh	0x215			:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


@npc_02: // Light beam
	// Set sprite to light beam
	.dh	0x22	:: .dh	0x347			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054,0xFE84,0x0120	:: .align 4
	// Set animation 0
	.db	0x07	:: .db	0x00			:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Disable object
	.dw	0x03					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_STARTBEAM	:: .align 4

	// Enable object
	.dw	0x02					:: .align 4
	// Restart animation
	.dw	0x2B					:: .align 4
	// Wait for animation
	.dw	0x1E					:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_ENDBEAM	:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


.align 4
overlay_0654_sinit_init:
	.dw	0
overlay_0654_sinit_init_end:
	.aligna	32
overlay_0654_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 654 * 0x20
	.dw	654			// Overlay ID (overlay_0654)
	.dw	0x21BE560		// Load address
	.dw	overlay_0654_size	// Uncompressed size
	.dw	0
	.dw	overlay_0654_sinit_init
	.dw	overlay_0654_sinit_init_end
	.dw	654			// File ID
	.skip	4

.close
