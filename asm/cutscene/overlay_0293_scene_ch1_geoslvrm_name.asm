// Overlay 293 - Geo's name cutscene

.nds
.thumb
.create TEMP+"/overlay_0293.bin",0x21BE560
.area 0x6A0

@camera1:
	// Set camera position
	.dw	0x52	:: .dw	0x0000000C, 0x00000060, 0x00000000
	// End script
	.dw	0x04
@camera2:
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x00C8, 0x0007	:: .align 4
	// Start camera movement
	.dw	0x07
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x0038, 0x0001	:: .align 4
	// Start camera movement
	.dw	0x07
	// End script
	.dw	0x04
@camera3:
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x012C, 0x0005	:: .align 4
	// Start camera movement
	.dw	0x07
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x00B8, 0x0003	:: .align 4
	// Start camera movement
	.dw	0x07
	// End script
	.dw	0x04
@camera4:
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x00B4, 0x0001	:: .align 4
	// Start camera movement
	.dw	0x07
	// End script
	.dw	0x04
@camera5:
	// Set camera position
	.dw	0x52	:: .dw	0x00000000, 0x00000000, 0x00000000
	// End script
	.dw	0x04

cutscene1_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Wait for player animation
	.dw	0x0A
	// Wait for text script
	.dw	0x08

	// Hide player
	.dw	0x32
	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72

	// Start camera script
	.dw	0x4D	:: .dw	@camera1
			:: .dw	0x0
	// Load cutscene text archive
	.dh	0x28	:: .dh	0x1
	// Start NPC objects
	.dw	0x93	:: .dw	0x21B9298

	// Start screen fade in
	.dh	0x1F	:: .db	0x0, 0x2
	// Wait for screen fade
	.dw	0x0B

	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start text script 0
	.dh	0x26	:: .db	0x04, (0)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, 0x01
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start text script 2
	.dh	0x26	:: .db	0x04, (2)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start camera script
	.dw	0x4D	:: .dw	@camera2
			:: .dw	0x0
	// Wait for camera movement
	.dw	0x0C
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, 0x02
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start camera script
	.dw	0x4D	:: .dw	@camera3
			:: .dw	0x0
	// Set NPC variable
	.dh	0x25	:: .db	0x00, 0x03
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00, 0x04

	// Start text script 7
	.dh	0x26	:: .db	0x04, (7)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start text script 8
	.dh	0x26	:: .db	0x04, (8)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start camera script
	.dw	0x4D	:: .dw	@camera4
			:: .dw	0x0
	// Set NPC variable
	.dh	0x25	:: .db	0x00, 0x05
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00, 0x06
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start text script 9
	.dh	0x26	:: .db	0x04, (9)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Start fade out
	.dh	0x1F	:: .db	0x1, 0x8
	// Wait for fade out
	.dw	0x0B

	// Set player direction
	.dh	0x33	:: .db	0x01, 0xFF
	// Set player animation
	.dh	0x3D	:: .db	0x01, 0xFF
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFFE4, 0x00000062, 0x00000000

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40

	// Start camera script (set BG scroll to 0, 0)
	.dw	0x4D	:: .dw	@camera5
			:: .dw	0x0

	// Set flag 0x204
	.dh	0x21	:: .dh	0x204
	// Set flag 0x205
	.dh	0x21	:: .dh	0x205
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Save overworld state
	.dw	0x5C	:: .dw	@saveOverworld|1
			:: .dw	0x0
	// Enable skip touch screen init (...?)
	.dh	0x21	:: .dh	0xF038
	// Hide Transer/HP + icons
	.dw	0x9C
	// Load keyboard for name
	.dh	0x57	:: .db	0x0A, 0x00
	// Enable BG3 hack for overworld keyboard
	.dh	0x21	:: .dh	0xF14E
	// Start top screen
	.dw	0x7D
@keyboardLoop:
	// Wait 1 frame
	.dw	0x50	:: .dw	(1)
	// Jump if top screen finished
	.dw	0x7E	:: .dw	@keyboardEnd-(.-4)
	// Loop
	.dw	0x13	:: .dw	@keyboardLoop-(.-4)
@keyboardEnd:
	// Disable skip touch screen init (...?)
	.dh	0x22	:: .dh	0xF038
	// Disable BG3 hack for overworld keyboard
	.dh	0x22	:: .dh	0xF14E
	// Reload overworld state
	.dw	0x5C	:: .dw	@reloadOverworld|1
			:: .dw	0x0
	// Show Transer/HP + icons
	.dw	0x9B

	// Show player object
	.dw	0x31
	// Camera follows player, destroy camera script
	.dw	0x53
	// Show area name and help signal
	.dw	0x71

	// End cutscene
	.dw	0x91
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 2
@saveOverworld:
	push	r14

	ldr	r0,=0x2117B3C
	add	r1,=@overworldSettings
	ldmia	[r0]!,r2-r3
	stmia	[r1]!,r2-r3

	mov	r0,0x0
	pop	r15

.align 2
@reloadOverworld:
	push	r14

	add	r0,=@overworldSettings
	ldr	r1,=0x2117B3C
	ldmia	[r0]!,r2-r3
	stmia	[r1]!,r2-r3

	mov	r0,0x0
	pop	r15


	.pool

.align 4
@overworldSettings:
	.fill	4 * 0x2


.align 4
overlay_0293_sinit_init:
	.dw	0
overlay_0293_sinit_init_end:
	.aligna	32
overlay_0293_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 293 * 0x20
	.dw	293			// Overlay ID (overlay_0293)
	.dw	0x21BE560		// Load address
	.dw	overlay_0293_size	// Uncompressed size
	.dw	0
	.dw	overlay_0293_sinit_init
	.dw	overlay_0293_sinit_init_end
	.dw	293			// File ID
	.skip	4

.close
