// Overlay 541 - Mr. Boreal cutscene (after Bud BrotherBand)

.nds
.thumb
.create TEMP+"/overlay_0541.bin",readu32(TEMP+"/y9.bin", 541 * 0x20 + 0x4)

@camera:
	// Set camera position
	.dw	0x52
	.dw	0xFFFFFFF0,0xFFFFFF90,0x00000000

	// End script
	.dw	0x04

cutscene541_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C
	// Start black out
	.dh	0x1F
	.db	0x01,0x04
	// Wait for black out
	.dw	0x0B
	// Wait for script
	.dw	0x08

	// Hide player
	.dw	0x32
	// Set Visualizer state: Visualizer off
	.dh	0x62
	.dh	0x01
	// Clear flag 0xD08
	.dh	0x22
	.dh	0xD08
	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72

	// Start camera script
	.dw	0x4D
	.dw	@camera
	.dw	0x0
	// Load cutscene text archive
	.dh	0x28
	.dh	0xEF
	// Start NPC objects
	.dw	0x93
	.dw	0x21BA350

	// Wait 60 frames
	.dw	0x50
	.dw	0x3C
	// Start black in
	.dh	0x1F
	.db	0x00,0x04
	// Wait for black in
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
	// Wait for script
	.dw	0x08
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Start script 2
	.dh	0x26
	.db	0x04,0x02
	// Wait for script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 16
	.dh	0x26
	.db	0x04,0x10
	// Wait for script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start black out
	.dh	0x1F
	.db	0x01,0x04
	// Wait for black out
	.dw	0x0B

	// Set player direction
	.dh	0x33
	.db	0x04,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x1B,0xFF
	// Set player position
	.dw	0x35
	.dw	0xFFFFFF8B,0x00000044,0x00000000
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F
	// Show player object
	.dw	0x31
	// Make camera follow player
	.dw	0x53

	// Start black in
	.dh	0x1F
	.db	0x00,0x04
	// Wait for black in
	.dw	0x0B
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 23
	.dh	0x26
	.db	0x04,0x17
	// Wait for script
	.dw	0x08
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

@skip:
	// Disable cutscene skip
	.dw	0x12
	// Start black out
	.dh	0x1F
	.db	0x01,0x04
	// Wait for black out
	.dw	0x0B

	// Set player direction
	.dh	0x33
	.db	0x04,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x04,0xFF
	// Set player position
	.dw	0x35
	.dw	0xFFFFFF8B,0x00000044,0x00000000
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Unload text archive
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F

	// Set flag 0x81A
	.dh	0x21
	.dh	0x81A
//	// Set flag 0x81B
//	.dh	0x21
//	.dh	0x81B

	// Receive mail 18
	.dh	0x92
	.dh	0x1612
	.dw	0x0

	// Set story progress
	.dh	0x23
	.dh	0x62
	// Show player object
	.dw	0x31
	// Show area name and help signal
	.dw	0x71
	// Make camera follow player
	.dw	0x53

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

	// Start black in
	.dh	0x1F
	.db	0x00,0x4
	// Wait for black in
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 4
overlay_0541_sinit_init:
	.dw	0
overlay_0541_sinit_init_end:
	.aligna	32
overlay_0541_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 541 * 0x20
	.skip	16
	.dw	overlay_0541_sinit_init
	.dw	overlay_0541_sinit_init_end
	.skip	8

.close
