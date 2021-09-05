// Overlay 320 - Pulse into train cutscene

.nds
.thumb
.create TEMP+"/overlay_0320.bin",0x21BE560

.definelabel	@STATE_BEAMPRE,		0
.definelabel	@STATE_BEAMBLUE,	1
.definelabel	@STATE_BEAMYELLOW,	2
.definelabel	@STATE_BEAMPOST,	3

// Must be same size as original
@camera:
.area 0x14,0x00
	// Set camera position
	.dw	0x52
	.dw	0xFFFFFF72,0x00000154,0x000000C0

	// End script
	.dw	0x04
.endarea

// .org 0x21BE574
cutscene_13_start:
@start:
	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start screen fade out
	.dh	0x1F
	.db	0x01,0x04
	// Wait for screen fade
	.dw	0x0B
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

	// Start camera script
	.dw	0x4D
	.dw	@camera
	.dw	0x00000000
	// Start wave beam script
	.dh	0x4E
	.dh	0x0	// slot 0+4=4
	.dw	@waveBeam
	.dw	0x00000000
	// Load cutscene text archive
	.dh	0x28
	.dh	0x1C

	// Start NPC objects
	.dw	0x93
	.dw	0x21BA338

	// Clear flag 0x16
	.dh	0x22
	.dh	0x16
	// Set flag 0x17
	.dh	0x21
	.dh	0x17

	// Set player position
	.dw	0x35
	.dw	0xFFFFFF84,0x00000182,0x000000C0

	// Call function
	.dw	0x5C
	.dw	0x218A0F8|1
	.dw	0x0
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start screen fade in
	.dh	0x1F
	.db	0x00,0x04
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
	.db	0x04,0x00
	// Wait for script finish
	.dw	0x08
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Set NPC variable
	.dh	0x25
	.db	0x00,0x01
	// Wait for NPC finish
	.dh	0x0D
	.db	0x00,0x02

	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0xA8,0x48
	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_BEAMBLUE
	// Wait 60 frames
	.dw	0x50
	.dw	0x1E

	// Start script 7
	.dh	0x26
	.db	0x04,0x07
	// Wait for script finish
	.dw	0x08
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0xA4,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0xA0,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x9C,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x98,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x94,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x90,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x8C,0x48
	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_BEAMYELLOW
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x88,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x84,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x80,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x7C,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x78,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x74,0x48
	// Wait 1 frame
	.dw	0x50
	.dw	0x01
	// Set wave beam position
	.dw	0x5C
	.dw	@setWaveBeamPos|1
	.dh	0x70,0x48
	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// Start script 7
	.dh	0x26
	.db	0x04,0x03
	// Wait for script finish
	.dw	0x08
	// Wait 30 frames
	.dw	0x50
	.dw	0x1E

//	// Play SFX
//	.dh	0x41
//	.dh	0x182

	// Set NPC variable
	.dh	0x25
	.db	0x01,@STATE_BEAMPOST

	// Set pulse in "from" position
	.dw	0x76
	.dw	0xFFF84000,0x00182000,0x000C0000	// shifted << 0xC
	// Set pulse in "to" position
	.dw	0x77
	.dw	0x00026000,0x00090000,0x00030000

	// Set NPC variable
	.dh	0x25
	.db	0x00,0x03
	// Play SFX
	.dh	0x41
	.dh	0xB2

	// ???
	.dh	0x67
	.db	0x00,0x06
	.dw	0x00000000,0x00000000,0x00000000
	.dw	0x00000400

	// Wait for NPC finish
	.dh	0x0D
	.db	0x00,0x04

	// Disable cutscene skip
	.dw	0x12
	// Start screen fade out
	.dh	0x1F
	.db	0x13,0x40
	// Wait for screen fade
	.dw	0x0B
	// Set up cutscene skip
	.dw	0x11
	.dw	@@skip-(.-4)
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

	// Disable cutscene skip
	.dw	0x12

	.dw	0x13
	.dw	@@finish-(.-4)

@@skip:
	// Disable cutscene skip
	.dw	0x12

	// Start screen fade out
	.dh	0x1F
	.db	0x13,0x40
	// Wait for screen fade
	.dw	0x0B

@@finish:
	// Set player direction
	.dh	0x33
	.db	0x07,0xFF
	// Set player animation
	.dh	0x3D
	.db	0x07,0xFF
	// Set player position
	.dw	0x35
	.dw	0xFFFFFF84,0x00000182,0x000000C0

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Destroy spawned objects (?)
	.dw	0x6B

	// Set flag 0x23A
	.dh	0x21
	.dh	0x23A
	// Set flag 0x23B
	.dh	0x21
	.dh	0x23B

	// Show player object
	.dw	0x31
	// Show area name and help signal
	.dw	0x71
	// Attach camera to player
	.dw	0x53

	// Wait 60 frames
	.dw	0x50
	.dw	0x3C

	// ???
	.dh	0x58
	.db	0x06,0x00

	// End cutscene
	.dw	0x91
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


@waveBeam:
	// Wait for NPC variable
	.dh	0x0D
	.db	0x01,@STATE_BEAMBLUE

@@inactive:
	// Draw wave beam
	.dw	0x5C
	.dw	@drawWaveBeam|1
	.dw	0x0	// inactive

	// Wait 1 frame
	.dw	0x50
	.dw	0x01

	// Check NPC variable
	.dh	0x17
	.db	0x01,@STATE_BEAMBLUE
	.dw	@@inactive-(.-4)

@@active:
	// Draw wave beam
	.dw	0x5C
	.dw	@drawWaveBeam|1
	.dw	0x1	// active

	// Wait 1 frame
	.dw	0x50
	.dw	0x01

	// Check NPC variable
	.dh	0x17
	.db	0x01,@STATE_BEAMYELLOW
	.dw	@@active-(.-4)

	// End script
	.dw	0x04


.align 2
@drawWaveBeam:
	push	r14

	mov	r1,r0		// active
	add	r0,=@waveBeamData
	ldr	r2,=0x60C0	// origin
	bl	field_drawWaveBeam

	mov	r0,0x0
	pop	r15

.align 2
@setWaveBeamPos:
	asr	r1,r0,0x10
	lsl	r0,r0,0x10
	asr	r0,r0,0x10
	lsl	r0,r0,0xC
	lsl	r1,r1,0xC
	add	r2,=@waveBeamData
	str	r0,[r2,0x4]
	str	r1,[r2,0x8]

	mov	r0,0x0
	bx	r14

	.pool

.align 4
@waveBeamData:
	.dw	0x0	// misc data
	.dw	0x0	// x-position
	.dw	0x0	// y-position


.align 4
overlay_0320_sinit_init:
	.dw	0
overlay_0320_sinit_init_end:
	.aligna	32
overlay_0320_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 320 * 0x20
	.dw	320			// Overlay ID (overlay_0320)
	.dw	0x21BE560		// Load address
	.dw	overlay_0320_size	// Uncompressed size
	.dw	0
	.dw	overlay_0320_sinit_init
	.dw	overlay_0320_sinit_init_end
	.dw	320			// File ID
	.skip	4

.close
