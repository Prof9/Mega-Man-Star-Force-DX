// Overlay 578 - Leo Kingdom pre-battle cutscene

.nds
.thumb
.create TEMP+"/overlay_0578.bin",0x21BE560
.area 0x6A0


@camera1:
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFE28, 0xFFFFFFFC, 0x00000000
	// End script
	.dw	0x04

@camera2:
	// Set up camera movement
	.dw	0x06	:: .dh	0x40, (90), 0x1		:: .align 4
	// Start camera movement
	.dw	0x07
	// Set up camera movement
	.dw	0x06	:: .dh	0x40, (60), 0x0		:: .align 4
	// Start camera movement
	.dw	0x07
	// End script
	.dw	0x04

cutscene287_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start screen fade out
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Destroy NPCs
	.dw	0x40
	// Wait for player animation
	.dw	0x0A
	// Wait for text script
	.dw	0x08
	// Hide player
	.dw	0x32
	// Hide area name and help signal
	.dw	0x72

	// Load sound bank
	.dh	0x6E	:: .dh	0x1E
	// Start camera script
	.dw	0x4D	:: .dw	@camera1, 0x0
	// Load cutscene text archive
	.dh	0x28	:: .dh	0x114

	// Load sprites
	.dh	0x74	:: .db	0x00			:: .align 4, 0xFF
	// Load sprite Leo Kingdom
	.dh	0x74	:: .db	0x01
			:: .db	0x05
			:: .dh	0x39B			:: .align 4, 0xFF

	// Start NPC objects
	.dw	0x93	:: .dw	0x21B8FC8
	// Set camera mode to follow NPC 0
	.dh	0x75	:: .db	0x0			:: .align 4
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Fade in screen
	.dh	0x1F	:: .db	0x0, 0x4
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x1
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x1

	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 0
	.dh	0x26	:: .db	0x4, (0)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start camera script
	.dw	0x4D	:: .dw	@camera2, 0x0
	// Wait for camera movement
	.dw	0x0C
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Play SFX (admin appear)
	.dh	0x41	:: .dh	0x19D
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x2
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x2
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start script 10
	.dh	0x26	:: .db	0x4, (10)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Unload text script
	.dw	0x27
	// Set flag 0x907 (pre-battle finished)
	.dh	0x21	:: .dh	0x907
	// Set flag 0x908 (post-battle active)
	.dh	0x21	:: .dh	0x908

	// Start fixed battle
	.dw	0x49	:: .dw	0x84

	// Unload extra sprites
	.dh	0x74	:: .db	0x02			:: .align 4, 0xFF
	// End cutscene
	.dw	0x91
	// Destroy NPCs
	.dw	0x40
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 4
overlay_0578_sinit_init:
	.dw	0
overlay_0578_sinit_init_end:
	.aligna	32
overlay_0578_size:

.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 578 * 0x20
	.dw	578			// Overlay ID (overlay_0578)
	.dw	0x21BE560		// Load address
	.dw	overlay_0578_size	// Uncompressed size
	.dw	0
	.dw	overlay_0578_sinit_init
	.dw	overlay_0578_sinit_init_end
	.dw	578			// File ID
	.skip	4

.close
