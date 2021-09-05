// Overlay 479 - Dragon Mail cutscene (after Time Square +/-)

.nds
.thumb
.create TEMP+"/overlay_0479.bin",readu32(TEMP+"/y9.bin", 479 * 0x20 + 0x4)

.org 0x21BE560
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

	// Hide player
	.dw	0x32
	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72
	// Set Visualizer state: Visualizer off
	.dh	0x62
	.dh	0x01

	// Clear flag 0x0D08
	.dh	0x22
	.dh	0x0D08
	// Load cutscene text archive
	.dh	0x28
	.dh	0xB3
	// Something sound related?
	.dh	0x6E
	.dh	0x1A

	// Start NPC objects
	.dw	0x93
	.dw	@npc
	// Attach camera to NPC 0
	.dh	0x75
	.dh	0x00

	// Start screen fade
	.dh	0x1F
	.db	0x02
	.db	0x04
	// Wait for screen fade
	.dw	0x0B

	// Set up cutscene skip
	.dw	0x11
	.dw	@@skip-(.-4)
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 0
	.dh	0x26
	.db	0x04
	.db	0x00
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00
	.db	0x01
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 2
	.dh	0x26
	.db	0x04
	.db	0x02
	// Wait for script finish
	.dw	0x08

	// Set NPC variable
	.dh	0x25
	.db	0x00
	.db	0x02
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 13
	.dh	0x26
	.db	0x04
	.db	0x0D
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Set NPC variable
	.dh	0x25
	.db	0x00
	.db	0x03
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 14
	.dh	0x26
	.db	0x04
	.db	0x0E
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

@@skip:
	// Disable cutscene skip
	.dw	0x12

	// Start screen fade
	.dh	0x1F
	.db	0x01
	.db	0x04
	// Wait for screen fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Set player direction
	.dh	0x33
	.db	0x04
	.db	0xFF
	// Set player animation
	.dh	0x3D
	.db	0x04
	.db	0xFF
	// Set player position
	.dw	0x35
	.dw	0x000000A4
	.dw	0x000000C4
	.dw	0x00000020

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F

	// Set flag 0x710
	.dh	0x21
	.dh	0x0710
	// Set flag 0x711
	.dh	0x21
	.dh	0x0711

	// Receive mail 19
	.dh	0x92
	.dh	0x1613
	.dw	0x0

	// Show area name and help signal
	.dw	0x71
	// Show player object
	.dw	0x31
	// Make camera follow player
	.dw	0x53
	// Wait 1 second
	.dw	0x50
	.dw	0x3C

	// Play area BGM
	.dw	0x43
	// End cutscene
	.dw	0x91
	// Clear flag 0xD1B
	.dh	0x22
	.dh	0x0D1B

	// Start screen fade
	.dh	0x1F
	.db	0x00
	.db	0x04
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
	.dw	0


@npc_00:
	// Set sprite to NPC 0
	.dh	0x04	:: .dh	0x00			:: .align 4
	// Set animation
	.db	0x07	:: .db	0x04			:: .align 4
	// Set position
	.dh	0x05	:: dh	0x00A4,0x00C4,0x0020	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,0x01		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x1B			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,0x02		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x1C			:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00,0x03		:: .align 4
	// Set animation
	.db	0x07	:: .db	0x1B			:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4


.align 4
overlay_0479_sinit_init:
	.dw	0
overlay_0479_sinit_init_end:
	.aligna	32
overlay_0479_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 479 * 0x20
	.skip	16
	.dw	overlay_0479_sinit_init
	.dw	overlay_0479_sinit_init_end
	.skip	8

.close
