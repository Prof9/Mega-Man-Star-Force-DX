// Overlay 540 - Echo Ridge Luna and Bud Brother Band cutscene

.nds
.thumb
.open TEMP+"/overlay_0540.bin",readu32(TEMP+"/y9.bin", 540 * 0x20 + 0x4)


.org 0x21BE574
	.dw	0x13	:: .dw	@setMegaManPortrait-(.-4)
.org 0x21BE7BC
	.dw	0x13	:: .dw	@setGeoPortrait-(.-4)

.org 0x21BE670
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE68C
	.dw	0x13	:: .dw	@skip1Disable1-(.-4)
@return1Disable1:

.org 0x21BE6A8
	.dw	0x13	:: .dw	@skip1Enable1-(.-4)
@return1Enable1:

.org 0x21BE778
	.dw	0x13	:: .dw	@skip1Disable2-(.-4)
@return1Disable2:

.org 0x21BE78C
	.dw	0x13	:: .dw	@skip1Enable2-(.-4)
@return1Enable2:

.org 0x21BE800
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
@return1End:

.org 0x21BE824
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:

.org 0x21BE884
	.dw	0x13	:: .dw	@skip2Normal-(.-4)
@return2End:

.org 0x21BE8A8
	.dw	0x13	:: .dw	@skip3Start-(.-4)
@return3Start:


.org readu32(TEMP+"/y9.bin", 540 * 0x20 + 0x10)


.align 4
@setMegaManPortrait:
	// Start cutscene
	.dw	0x90
	// Lock controls
	.dw	0x29
	// Set top screen portrait to Mega Man
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x32
	// Return
	.dw	0x13	:: .dw	0x21BE57C-(.-4)
.align 4
@setGeoPortrait:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Return
	.dw	0x13	:: .dw	0x21BE7C4-(.-4)


.align 4
@skip3Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE900-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return3Start-(.-4)

.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip2End-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip2Normal:
	// Clear cutscene skip
	.dw	0x12
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return2End-(.-4)

@skip2End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x2
	// Wait for screen fade
	.dw	0x0B

	// End text script
	.dw	0x27

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npcB
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x16
	// Set NPC variable
	.dh	0x25	:: .db	0x2, 0x2

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start screen fade
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait for 30 frames
	.dw	0x50	:: .dw	(30)

	// Jump back
	.dw	0x13	:: .dw	@return2End-(.-4)

.align 4
@skip1Disable1:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x3, 0x2
	// Wait for screen fade
	.dw	0x0B
	// Jump back
	.dw	0x13	:: .dw	@return1Disable1-(.-4)

.align 4
@skip1Enable1:
	// Start screen fade
	.dh	0x1F	:: .db	0x2, 0x2
	// Wait for screen fade
	.dw	0x0B
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Jump back
	.dw	0x13	:: .dw	@return1Enable1-(.-4)

.align 4
@skip1Disable2:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x3, 0x2
	// Wait for screen fade
	.dw	0x0B
	// Jump back
	.dw	0x13	:: .dw	@return1Disable2-(.-4)

.align 4
@skip1Enable2:
	// Start screen fade
	.dh	0x1F	:: .db	0x2, 0x2
	// Wait for screen fade
	.dw	0x0B
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Jump back
	.dw	0x13	:: .dw	@return1Enable2-(.-4)

.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 120 frames
	.dw	0x50	:: .dw	(120)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1Normal:
	// Clear cutscene skip
	.dw	0x12
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)

@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x2
	// Wait for screen fade
	.dw	0x0B

	// Clear flag
	.dh	0x22	:: .dh	0xD08
	// Destroy spawned object
	.dw	0x6B
	// End text script
	.dw	0x27

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npcA
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x12
	// Set NPC variable
	.dh	0x25	:: .db	0x1, 0x1

	// Camera follows object 0
	.dh	0x75	:: .dh	0x0

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
	// Start screen fade
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Play BGM
	.dh	0x42	:: .dh	0x3
	// Wait for 30 frames
	.dw	0x50	:: .dw	(30)

	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
@npcA:
	.dw	@npcA_00	// Geo
	.dw	@npcA_01	// Luna
	.dw	@npcA_02	// Bud
	.dw	@npcA_03	// Zack
	.dw	0x0

.align 4
@npcA_00: // Geo
	// Enable ???
	.dw	0x20					:: .align 4
	// Disable priority
	.dw	0x35					:: .align 4
	// Jump	
	.dw	0x12	:: .dw	0x21BDEF8-(.-4)		:: .align 4
.align 4
@npcA_01: // Luna
	// Set sprite
	.dh	0x22	:: .dh	0x5			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x3			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0002, 0x0084, 0x0000	:: .align 4
	// Disable priority
	.dw	0x35					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BDF5C-(.-4)		:: .align 4
.align 4
@npcA_02: // Bud
	// Set sprite
	.dh	0x22	:: .dh	0x6			:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BDF94-(.-4)		:: .align 4
.align 4
@npcA_03: // Zack
	// Set sprite
	.dh	0x22	:: .dh	0x7			:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BE00C-(.-4)		:: .align 4


.align 4
@npcB:
	.dw	@npcB_00	// Geo
	.dw	@npcB_01	// Bud
	.dw	@npcB_02	// Zack
	.dw	0x0

.align 4
@npcB_00: // Geo
	// Enable ???
	.dw	0x20					:: .align 4
	// Disable priority
	.dw	0x35					:: .align 4
	// Jump	
	.dw	0x12	:: .dw	0x21BDEF8-(.-4)		:: .align 4
.align 4
@npcB_01: // Bud
	// Set sprite
	.dh	0x22	:: .dh	0x6			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x3			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0004, 0x007E, 0x0000	:: .align 4
	// Disable priority
	.dw	0x35					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BDFE0-(.-4)		:: .align 4
.align 4
@npcB_02: // Zack
	// Set sprite
	.dh	0x22	:: .dh	0x7			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFF2, 0x004A, 0x0000	:: .align 4
	// Disable priority
	.dw	0x35					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BE030-(.-4)		:: .align 4


.align 4
overlay_0540_sinit_init:
	.dw	0
overlay_0540_sinit_init_end:
	.aligna	32
overlay_0540_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 540 * 0x20
	.skip	16
	.dw	overlay_0540_sinit_init
	.dw	overlay_0540_sinit_init_end
	.skip	8

.close
