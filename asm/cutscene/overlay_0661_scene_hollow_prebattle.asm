// Overlay 661 - Hollow pre-battle

.nds
.thumb
.create TEMP+"/overlay_0661.bin",0x21BE560
.area 0x6A0

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_MEGAWALKIN,	1
.definelabel	@STATE_MEGADODGE,	2
.definelabel	@STATE_CAMERA,		3
.definelabel	@STATE_BOLTS,		4
.definelabel	@STATE_BIGBOLT,		5

@camera:
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFEF4, 0x00000034, 0x000000C0

	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00, @STATE_CAMERA
	// Set up camera movement
	.dw	0x06	:: .dh	0x0080, 0x0020, 0x0007
			:: .dh	0xFFFF
	// Start camera movement
	.dw	0x07
	// Wait for camera movement
	.dw	0x0C

	// End script
	.dw	0x04

cutscene321_start:
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

	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08

	// Load sprites
	.dh	0x74	:: .db	0x00
	.db	0xFF
	// Load sprite thunderbolt
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x50
	.dh	0xFFFF
	// Load sprite Hollow
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x51
	.dh	0xFFFF

	// Hide player
	.dw	0x32
	// Destroy NPCs
	.dw	0x40
	// Hide area name and help signal
	.dw	0x72

	// Load sound bank
	.dh	0x6E
	.dh	0x29

	// Start camera script
	.dw	0x4D	:: .dw	@camera
			:: .dw	0x0
	// Load cutscene text archive
	.dh	0x28	:: .dh	0x12F
	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_MEGAWALKIN
	// Start NPC objects
	.dw	0x93	:: .dw	@npc

	// Start screen fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B

	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip-(.-4)
	// Wait 34 frames
	.dw	0x50	:: .dw	(34)

	// Fade out BGM
	.dw	0x46	:: .dw	(60)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Partial fade out
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x2A, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait 64+60 frames
	.dw	0x50	:: .dw	(60+64)

	// Start script 0
	.dh	0x26	:: .db	0x04, (0)
	// Wait for script finish
	.dw	0x08
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_MEGADODGE
	// Wait 12+4+30+60 frames
	.dw	0x50	:: .dw	(12+4+30+60)

	// Start script 1
	.dh	0x26	:: .db	0x04, (1)
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_CAMERA
	// Full fade out
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x2B, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_BOLTS
	// Wait 120 frames
	.dw	0x50	:: .dw	(120)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_BIGBOLT
	// Start screen shake
	.dw	0x65	:: .dh	0x1, (20)
	// Wait 20 frames
	.dw	0x50	:: .dw	(20)
	// Play SFX
	.dh	0x41	:: .dh	SE_MAGICCIRCLE
	// Start screen shake
	.dw	0x65	:: .dh	0x0, (60)
	// Wait 40 frames
	.dw	0x50	:: .dw	(60)

	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Play BGM: confrontation
	.dh	0x42	:: .dh	0x22
	// Fade in BGM
//	.dh	0x44	:: .dh	0x22
//			:: .dw	(30)
	// Fade in
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x29, 0x4
//	// Wait for screen fade
//	.dw	0x0B
	// Wait 32 frames
	.dw	0x50	:: .dw	(32)
	// Fade in
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x2A, 0x100
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 2
	.dh	0x26	:: .db	0x04, (2)
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

@skip:
	// Disable cutscene skip
	.dw	0x12

	// Unload text script
	.dw	0x27

	// Set flag 0xF134
	.dh	0x21
	.dh	0xF134

	// Unload extra sprites
	.dh	0x74	:: .db	0x02
	.db	0xFF

	// Start fixed battle
	.dw	0x49
	.dw	0x80

	// End cutscene
	.dw	0x91

	// Destroy NPCs
	.dw	0x40
	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


@npc:
	.dw	@npc_00
	.dw	@npc_01
	.dw	@npc_02
	.dw	@npc_03
	.dw	@npc_04
	.dw	@npc_05
	.dw	@npc_06
	.dw	0x0

@npc_00: // Mega Man
	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01				:: .align 4
	// Set animation (idle southwest)
	.db	0x07	:: .db	0x05				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0xFF04, 0x0024, 0x00C0		:: .align 4
	.dh	0x05	:: .dh	0xFF64, 0x0024, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4

	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_MEGAWALKIN		:: .align 4
	// Run southwest
	.db	0x1F	:: .db	0x15, 0x05			:: .align 4
			:: .dh	0x80, (64+64+32)		:: .align 4
	// Walk southwest
	.db	0x1F	:: .db	0x0D, 0x05			:: .align 4
			:: .dh	0x40, (64)			:: .align 4
	// Set direction (face southwest)
	.db	0x07	:: .db	0x05				:: .align 4

	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_MEGADODGE		:: .align 4
	// Dodge southeast
	.db	0x1F	:: .db	0x36, 0x03			:: .align 4
			:: .dh	0x300, (12)			:: .align 4
	// Wait 4 frames
	.dh	0x0B	:: .dh	(4)				:: .align 4
	// Set direction (stance southeast)
	.db	0x07	:: .db	0x1C				:: .align 4
	// Wait 30 frames
	.dh	0x0B	:: .dh	(30)				:: .align 4
	// Set direction (stance northwest)
	.db	0x07	:: .db	0x1E				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_01: // Thunderbolt 1
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0024, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_MEGADODGE		:: .align 4

	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDER			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_02: // Thunderbolt 2A
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFEDC, 0x0024, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BOLTS		:: .align 4

	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDER			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_03: // Thunderbolt 2B
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF34, 0x0014, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BOLTS		:: .align 4

	// Wait 20 frames
	.dh	0x0B	:: .dh	(20)				:: .align 4
	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDER			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_04: // Thunderbolt 2C
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFED4, 0xFFEC, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BOLTS		:: .align 4

	// Wait 40 frames
	.dh	0x0B	:: .dh	(40)				:: .align 4
	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDER			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_05: // Thunderbolt 3
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0004, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BIGBOLT		:: .align 4

	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDERB			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_06: // Hollow
	// Set sprite to Hollow
	.dh	0x22	:: .dh	0x51				:: .align 4
	// Set animation (hidden)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0004, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BIGBOLT		:: .align 4

	// Wait 20 frames
	.dh	0x0B	:: .dh	(20)				:: .align 4
	// Set animation (appear)
	.db	0x07	:: .db	0x01				:: .align 4
	// Wait for animation
	.dw	0x1E						:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x02				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

.align 2
@startSpecialFade:
	// 0000xxxx = type
	// xxxx0000 = speed
	push	r14

	lsl	r3,r0,0x10
	lsr	r3,r3,0x10	// type
	lsr	r0,r0,0x10	// speed
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,0x0
	bl	0x2011BA4

	mov	r0,0x0
	pop	r1,r15		// pop extra for deallocation


	.pool


.align 4
overlay_0661_sinit_init:
	.dw	0
overlay_0661_sinit_init_end:
	.aligna	32
overlay_0661_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 661 * 0x20
	.dw	661			// Overlay ID (overlay_0661)
	.dw	0x21BE560		// Load address
	.dw	overlay_0661_size	// Uncompressed size
	.dw	0
	.dw	overlay_0661_sinit_init
	.dw	overlay_0661_sinit_init_end
	.dw	661			// File ID
	.skip	4

.close
