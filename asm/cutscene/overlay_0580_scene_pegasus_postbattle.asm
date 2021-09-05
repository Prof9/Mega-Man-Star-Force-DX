// Overlay 580 - Pegasus Magic post-battle cutscene

.nds
.thumb
.create TEMP+"/overlay_0580.bin",0x21BE560
.area 0x6A0


@camera:
	// Set camera position
	.dw	0x52	:: .dw	0x000001AC, 0xFFFFFF60, 0x00000000
	// End script
	.dw	0x04

cutscene289_start:
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

	// Wait for player animation
	.dw	0x0A
	// Wait for text script
	.dw	0x08
	// Destroy NPCs
	.dw	0x40
	// Hide player
	.dw	0x32
	// Hide area name and help signal
	.dw	0x72

	// Load sound bank
	.dh	0x6E	:: .dh	0x1E
	// Start camera script
	.dw	0x4D	:: .dw	@camera, 0x0
	// Load cutscene text archive
	.dh	0x28	:: .dh	0x116

	// Load sprites
	.dh	0x74	:: .db	0x00			:: .align 4, 0xFF
	// Load sprite Pegasus Magic
	.dh	0x74	:: .db	0x01
			:: .db	0x05
			:: .dh	0x39A			:: .align 4, 0xFF
	// Load sprite Battle Card
	.dh	0x74	:: .db	0x01
			:: .db	0x05
			:: .dh	0x32F			:: .align 4, 0xFF

	// Start NPC objects
	.dw	0x93	:: .dw	0x21B90B0
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Fade in screen
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip-(.-4)

	// Start script 0
	.dh	0x26	:: .db	0x4, (0)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Fade to white
	.dh	0x1F	:: .db	0x3, 0x8
	// Play SFX
	.dh	0x41	:: .dh	0x95
	// Wait for screen fade
	.dw	0x0B

	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x1
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Fade in screen
	.dh	0x1F	:: .db	0x2, 0x2
	// Wait for screen fade
	.dw	0x0B

	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x2
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x2

	// Start script 10
	.dh	0x26	:: .db	0x4, (10)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 20
	.dh	0x26	:: .db	0x4, (20)
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x5
	// Wait for text script
	.dw	0x08
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x5
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 30
	.dh	0x26	:: .db	0x4, (30)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Play SFX
	.dh	0x41	:: .dh	0x202
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x4
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x4
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start script 40
	.dh	0x26	:: .db	0x4, (40)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Fade to black
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Unload text script
	.dw	0x27
	// Set flag 0x909 (post-battle finished)
	.dh	0x21	:: .dh	0x909

	// Check already got Extra Folder
	.dh	0x15	:: .dh	0xF13C
			:: .dw	@checkBeatAll-(.-4)
	// Give Extra Folder
	.dw	0x5C	:: .dw	@giveExtraFolder|1
			:: .dw	0x1

@checkBeatAll:
	// Clear flag: already got Extra Folder
	.dh	0x22	:: .dh	0xF13C
	// Check beat Pegasus Magic
	.dh	0x16	:: .dh	0xF108
			:: .dw	@end-(.-4)
	// Check beat Leo Kingdom
	.dh	0x16	:: .dh	0xF10A
			:: .dw	@end-(.-4)
	// Check beat Dragon Sky
	.dh	0x16	:: .dh	0xF10C
			:: .dw	@end-(.-4)
	// Set title screen mark
	.dw	0x99	:: .dw	0x14
	// Update player stats
	.dw	0xAF
	// Set beat Satellite Admin
	.dh	0x21	:: .dh	0x69

@end:
	// Set player position
	.dw	0x35	:: .dw	0x0000018C, 0xFFFFFF6E, 0x00000000
	// Set player direction
	.dh	0x33	:: .db	0x1, 0xFF
	// Set player animation
	.dh	0x3D	:: .db	0x1, 0xFF

	// Show area name and help signal
	.dw	0x71
	// Show player
	.dw	0x31
	// Clear camera script
	.dw	0x53
	// Destroy NPCs
	.dw	0x40
//	// Initialize NPCs
//	.dw	0x3F
	// Unload extra sprites
	.dh	0x74	:: .db	0x02			:: .align 4, 0xFF
//	// Destroy NPCs
//	.dw	0x40
	// Initialize NPCs
	.dw	0x3F

	// Play BGM
	.dw	0x43
	// End cutscene
	.dw	0x91
	// Clear flag 0xD1B
	.dh	0x22	:: .dh	0xD1B

	// Fade in screen
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 2
@giveExtraFolder:
	// r0 = Extra Folder ID
	push	r14

	// Give Extra Folder
	bl	common_changeExtraFolder

	// Check if Extra Folder is equipped
	bl	0x2007308
	cmp	r1,0x2
	bne	@@end

	// Refresh top screen if necessary
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFB
	ldrb	r0,[r0]		// Personal view
	cmp	r0,0x0
	bne	@@end

	bl	common_refreshTopScreen

@@end:
	mov	r0,0x0
	pop	r15

	.pool


.align 4
overlay_0580_sinit_init:
	.dw	0
overlay_0580_sinit_init_end:
	.aligna	32
overlay_0580_size:

.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 580 * 0x20
	.dw	580			// Overlay ID (overlay_0580)
	.dw	0x21BE560		// Load address
	.dw	overlay_0580_size	// Uncompressed size
	.dw	0
	.dw	overlay_0580_sinit_init
	.dw	overlay_0580_sinit_init_end
	.dw	580			// File ID
	.skip	4

.close
