// Overlay 322 - Brother intro cutscene

.nds
.thumb
.create TEMP+"/overlay_0322.bin",0x21BE560
.area 0x6A0

@camera1:
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFF90, 0x00000074, 0xFFFFFFC0
	// End script
	.dw	0x04
@camera2:
	// Set camera position
	.dw	0x52	:: .dw	0x00000000, 0x00000000, 0x00000000
	// End script
	.dw	0x04

cutscene30_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
//	// Wait 60 frames
//	.dw	0x50	:: .dw	(60)

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

	// Load cutscene text archive
	.dh	0x28	:: .dh	0x1E
	// Start NPC objects
	.dw	0x93	:: .dw	0x21B9DB0
	// Start camera script
	.dw	0x4D	:: .dw	@camera1
			:: .dw	0x0
//	// Camera follows object
//	.dh	0x75	:: .db	0x00	:: .align 4
//	// Wait 60 frames
//	.dw	0x50	:: .dw	(60)

	// Start screen fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B

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
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00, 0x02
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Start text script 2
	.dh	0x26	:: .db	0x04, (2)
	// Wait for text script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start Brother tutorial
	.dw	0xA4

	// Wait for NPC variable
	.dh	0x0D	:: .db	0x01, 0x01
	// Save overworld state
	.dw	0x5C	:: .dw	@saveOverworld|1
			:: .dw	0x0
	// Enable skip touch screen init (...?)
	.dh	0x21	:: .dh	0xF038
	// Hide Transer/HP + icons
	.dw	0x9C
	// Enable BG3 hack for overworld keyboard
	.dh	0x21	:: .dh	0xF14E
	// Start camera script
	.dw	0x4D	:: .dw	@camera2
			:: .dw	0x0

	// Wait for NPC variable
	.dh	0x0D	:: .db	0x01, 0x00
	// Start camera script
	.dw	0x4D	:: .dw	@camera1
			:: .dw	0x0
	// Disable skip touch screen init (...?)
	.dh	0x22	:: .dh	0xF038
	// Disable BG3 hack for overworld keyboard
	.dh	0x22	:: .dh	0xF14E
	// Reload overworld state
	.dw	0x5C	:: .dw	@reloadOverworld|1
			:: .dw	0x0
	// Show Transer/HP + icons
	.dw	0x9B

	// Wait for NPC variable
	.dh	0x0D	:: .db	0x01, 0x01
	// Save overworld state
	.dw	0x5C	:: .dw	@saveOverworld|1
			:: .dw	0x0
	// Enable skip touch screen init (...?)
	.dh	0x21	:: .dh	0xF038
	// Hide Transer/HP + icons
	.dw	0x9C
	// Enable BG3 hack for overworld keyboard
	.dh	0x21	:: .dh	0xF14E
	// Start camera script
	.dw	0x4D	:: .dw	@camera2
			:: .dw	0x0

	// Wait for NPC variable
	.dh	0x0D	:: .db	0x01, 0x00
	// Start camera script
	.dw	0x4D	:: .dw	@camera1
			:: .dw	0x0
	// Disable skip touch screen init (...?)
	.dh	0x22	:: .dh	0xF038
	// Disable BG3 hack for overworld keyboard
	.dh	0x22	:: .dh	0xF14E
	// Reload overworld state
	.dw	0x5C	:: .dw	@reloadOverworld|1
			:: .dw	0x0
	// Show Transer/HP + icons
	.dw	0x9B

@tutorialLoop:
	// Wait 1 frame
	.dw	0x50	:: .dw	(1)
	// Jump if top screen finished
	.dw	0x7E	:: .dw	@tutorialEnd-(.-4)
	// Loop
	.dw	0x13	:: .dw	@tutorialLoop-(.-4)
@tutorialEnd:

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Disable cutscene skip
	.dw	0x12
	// Start fade out
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Set player direction
	.dh	0x33	:: .db	0x04, 0xFF
	// Set player animation
	.dh	0x3D	:: .db	0x04, 0xFF
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFF90, 0x00000074, 0xFFFFFFC0

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Reload area NPCs
	.dw	0x3F

	// Set flag 0x23E
	.dh	0x21	:: .dh	0x23E
	// Receive e-mail 0x1601
	.dh	0x92	:: .dh	0x1601
			:: .dw	0x0

	// Show player object
	.dw	0x31
	// Show area name and help signal
	.dw	0x71
	// Camera follows player, destroy camera script
	.dw	0x53

	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Play area BGM
	.dw	0x43
	// End cutscene
	.dw	0x91

	// Clear flag 0xD1B
	.dh	0x22	:: .dh	0xD1B

	// Fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

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
	add	r0,(0x48-0x8)
	ldmia	[r0]!,r2
	stmia	[r1]!,r2

	// Allocate buffer to store tiles temporarily
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,=(0x2000 + 0x1FE0 + 0x14C0)
	bl	0x20155DC
	add	r1,=@overworldTileBuffer
	str	r0,[r1]

	// Copy tiles to buffer
	ldr	r1,=0x6000800
	add	r2,=@overworldTileBuffer
	ldr	r2,[r2]
	ldr	r3,=0x2000
	bl	0x202E010

	ldr	r1,=0x6004000
	add	r2,=@overworldTileBuffer
	ldr	r2,[r2]
	ldr	r3,=0x2000
	add	r2,r2,r3
	ldr	r3,=0x1FE0
	bl	0x202E010

	ldr	r1,=0x6038800
	add	r2,=@overworldTileBuffer
	ldr	r2,[r2]
	ldr	r3,=(0x2000 + 0x1FE0)
	add	r2,r2,r3
	ldr	r3,=0x14C0
	bl	0x202E010

	mov	r0,0x0
	pop	r15

.align 2
@reloadOverworld:
	push	r14

	add	r0,=@overworldSettings
	ldr	r1,=0x2117B3C
	ldmia	[r0]!,r2-r3
	stmia	[r1]!,r2-r3
	add	r1,(0x48-0x8)
	ldmia	[r0]!,r2
	stmia	[r1]!,r2

	// Copy tiles back to VRAM
	add	r1,=@overworldTileBuffer
	ldr	r1,[r1]
	ldr	r2,=0x6000800
	ldr	r3,=0x2000
	bl	0x202E010

	add	r1,=@overworldTileBuffer
	ldr	r1,[r1]
	ldr	r2,=0x2000
	add	r1,r1,r2
	ldr	r2,=0x6004000
	ldr	r3,=0x1FE0
	bl	0x202E010

	add	r1,=@overworldTileBuffer
	ldr	r1,[r1]
	ldr	r2,=(0x2000 + 0x1FE0)
	add	r1,r1,r2
	ldr	r2,=0x6038800
	ldr	r3,=0x14C0
	bl	0x202E010

	// Free buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	add	r2,=@overworldTileBuffer
	ldr	r2,[r2]
	mov	r3,0x0
	str	r3,[r2]
	bl	0x2015620

	mov	r0,0x0
	pop	r15


	.pool

.align 4
@overworldTileBuffer:
	.dw	0x0
.align 4
@overworldSettings:
	.fill	0x4 * 0x3


.align 4
overlay_0322_sinit_init:
	.dw	0
overlay_0322_sinit_init_end:
	.aligna	32
overlay_0322_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 322 * 0x20
	.dw	322			// Overlay ID (overlay_0322)
	.dw	0x21BE560		// Load address
	.dw	overlay_0322_size	// Uncompressed size
	.dw	0
	.dw	overlay_0322_sinit_init
	.dw	overlay_0322_sinit_init_end
	.dw	322			// File ID
	.skip	4

.close
