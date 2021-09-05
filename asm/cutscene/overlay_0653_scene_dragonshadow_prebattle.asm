// Overlay 653 - Dragon Shadow pre-battle cutscene

.nds
.thumb
.create TEMP+"/overlay_0653.bin",0x21BE560

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_CAMERA,		1
.definelabel	@STATE_CAMERAEND,	2
.definelabel	@STATE_APPEAR,		3
.definelabel	@STATE_STARTMOVE,	4
.definelabel	@STATE_ENDMOVE,		5
.definelabel	@STATE_POSE,		6

@camera:
	// Set camera position
	.dw	0x52
	.dw	0x0000005E,0xFFFFFE7A,0x00000120
	// Wait for NPC variable
	.dh	0x0D
	.db	0x00,@STATE_CAMERA

	// Set up camera movement
	.dw	0x06
	.dh	0x0080,0x0040,0x0007
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

cutscene314_start:
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
	// Fade out BGM
	.dw	0x46
	.dw	0x3C
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
	// Load sprite Dragon Shadow
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x361
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
	// Load cutscene text archive
	.dh	0x28
	.dh	0x128

	// Load sound bank?
	.dh	0x6E
	.dh	0x17

	// Start NPC objects
	.dw	0x93
	.dw	@npc

	// Start screen fade
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
	.db	0x00,@STATE_CAMERA
	// Wait for camera finish
	.dh	0x0D
	.db	0x00,@STATE_CAMERAEND
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00,@STATE_APPEAR
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Play ominous music
	.dh	0x42
	.dh	0x17

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
	.db	0x00,@STATE_STARTMOVE
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Wait for movement finish
	.dh	0x0D
	.db	0x00,@STATE_ENDMOVE
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
	.db	0x00,@STATE_POSE
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

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Unload text script
	.dw	0x27

	// Set flag 0xF036
	.dh	0x21
	.dh	0xF036

	// Unload extra sprites
	.dh	0x74	:: .db	0x02
	.db	0xFF

	// Start fixed battle
	.dw	0x49
	.dw	0x7D

	// End cutscene
	.dw	0x91

	// Destroy NPCs
	.dw	0x40
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


@npc: // 0x21BB098
	.dw	@npc_00
	.dw	@npc_01
	.dw	0x0

@npc_00: // Mega Man
	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01			:: .align 4
	// Set animation (idle northwest)
	.db	0x07	:: .db	0x07			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054,0xFE84,0x0120	:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_POSE	:: .align 4

	// Set animation (battle pose northwest)
	.db	0x07	:: .db	0x1E			:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


@npc_01: // Dragon Sky
	// Set sprite to Dragon Shadow
	.dh	0x22	:: .dh	0x361			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054,0xFE48,0x0120	:: .align 4
	// Set animation (appear southeast)
	.db	0x07	:: .db	0x00			:: .align 4
	// Set on Wave Road
	.dw	0x29					:: .align 4
	// Disable object
	.dw	0x03					:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_APPEAR	:: .align 4

	// Enable object
	.dw	0x02					:: .align 4
	// Play SFX
	.dh	0x1C	:: .dh	0x215			:: .align 4
	// Restart animation
	.dw	0x2B					:: .align 4
	// Wait for animation
	.dw	0x1E					:: .align 4
	// Set animation (idle southeast)
	.db	0x07	:: .db	0x01			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,@STATE_STARTMOVE	:: .align 4

	// Do movement NPC
	.db	0x1F	:: .db	0x01,0x03,0x00	:: .dh	0x0080,0x0020
	// Set NPC variable
	.db	0x17	:: .db	0x00,@STATE_ENDMOVE	:: .align 4

	// Loop forever
	.dw	0x01


.align 4
overlay_0653_sinit_init:
	.dw	0
overlay_0653_sinit_init_end:
	.aligna	32
overlay_0653_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 653 * 0x20
	.dw	653			// Overlay ID (overlay_0653)
	.dw	0x21BE560		// Load address
	.dw	overlay_0653_size	// Uncompressed size
	.dw	0
	.dw	overlay_0653_sinit_init
	.dw	overlay_0653_sinit_init_end
	.dw	653			// File ID
	.skip	4

.close
