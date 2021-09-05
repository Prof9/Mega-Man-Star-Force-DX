// Overlay 662 - Hollow post-battle

.nds
.thumb
.create TEMP+"/overlay_0662.bin",0x21BE560
.area 0x6A0

.definelabel	@STATE_INITIAL,		0
.definelabel	@STATE_BOLT,		1
.definelabel	@STATE_HOLLOWVANISH,	2
.definelabel	@STATE_MEGAWALKUP,	3
.definelabel	@STATE_MEGAWALKEND,	4
.definelabel	@STATE_LOOKMEGA,	5

@camera:
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFEFC, 0x0000002C, 0x000000C0

	// End script
	.dw	0x04

cutscene322_start:
@start:
	// Black out screen
	.dh	0x1F	:: .db	0x1, 0xFF
	// Stop BGM
	.dw	0x48

	// Start cutscene
	.dw	0x90
	// Lock player controls
	.dw	0x29
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Skip fade reset (keep screen blacked out)
	.dw	0x5C	:: .dw	@setSkipFadeReset|1
			:: .dw	0x1
	// Set overworld palettes to dimmed
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x2A, 0x100
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Wait for player animation
	.dw	0x0A
	// Wait for script finish
	.dw	0x08

	// Load sprites
	.dh	0x74	:: .db	0x00
	.db	0xFF
	// Load sprite Hollow
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x51
	.dh	0xFFFF
	// Load sprite thunderbolt
	.dh	0x74	:: .db	0x01
	.db	0x05
	.dh	0x50
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
			:: .dw	0x00000000
	// Load cutscene text archive
	.dh	0x28	:: .dh	0x130
	// Start NPC objects
	.dw	0x93	:: .dw	@npc


	// Skip fade reset (keep palettes dimmed)
	.dw	0x5C	:: .dw	@setSkipFadeReset|1
			:: .dw	0x1
	// Set fade timer (start from 100%)
	.dw	0x5C	:: .dw	@setSkipFadeTimer|1
			:: .dw	0x100
	// Fade in screen
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait 64 frames
	.dw	0x50	:: .dw	(64)
	// Fade in
	.dw	0x5C	:: .dw	@startSpecialFade|1
			:: .dh	0x2A, 0x100

	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 0
	.dh	0x26	:: .db	0x04, (0)
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Skip fade reset (keep palettes dimmed)
	.dw	0x5C	:: .dw	@setSkipFadeReset|1
			:: .dw	0x1
	// Set fade timer (start from 0%)
	.dw	0x5C	:: .dw	@setSkipFadeTimer|1
			:: .dw	0x0
	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_BOLT
	// Wait 4 frames
	.dw	0x50	:: .dw	(4)
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip2-(.-4)
	// Fade to white
	.dh	0x1F	:: .db	0x3, 0x10
	// Wait for screen fade
	.dw	0x0B
	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_HOLLOWVANISH
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Fade in
	.dh	0x1F	:: .db	0x2, 0x2
	// Wait for screen fade
	.dw	0x0B

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_MEGAWALKUP
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x00, @STATE_MEGAWALKEND
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 1
	.dh	0x26	:: .db	0x04, (1)
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Set NPC variable
	.dh	0x25	:: .db	0x00, @STATE_LOOKMEGA
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Start script 2
	.dh	0x26	:: .db	0x04, (2)
	// Wait for script finish
	.dw	0x08
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Jump to skip 2
	.dw	0x13	:: .dw	@skip2-(.-4)

@skip1:
	// Skip fade reset (keep palettes dimmed)
	.dw	0x5C	:: .dw	@setSkipFadeReset|1
			:: .dw	0x1
	// Set fade timer (start from 0%)
	.dw	0x5C	:: .dw	@setSkipFadeTimer|1
			:: .dw	0x0

@skip2:
	// Disable cutscene skip
	.dw	0x12

	// Start fade out
	.dh	0x1F	:: .db	0x01,0x04
	// Wait for screen fade
	.dw	0x0B

//	// Jump to end
//	.dw	0x13	:: .dw	@end-(.-4)

@end:
	// Set player direction
	.dh	0x33	:: .db	0x04, 0xFF
	// Set player animation
	.dh	0x3D	:: .db	0x04, 0xFF
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFF04, 0x00000024, 0x000000C0

	// Unload text script
	.dw	0x27
	// Destroy NPCs
	.dw	0x40
	// Initialize NPCs
	.dw	0x3F
	// Show area name and help signal
	.dw	0x71
	// Show player object
	.dw	0x31

	// Set flag 0xF135
	.dh	0x21
	.dh	0xF135

	// Camera follows player, destroy camera script
	.dw	0x53
	// Unload extra sprites
	.dh	0x74	:: .db	0x02
	.db	0xFF
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)

	// Play area BGM
	.dw	0x43
	// End cutscene
	.dw	0x91
	// Clear flag 0xD1B
	.dh	0x22	:: .dh	0xD1B

	// Start fade in
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)

	// Unlock player controls
	.dw	0x2A
	// End script
	.dw	0x04


@npc:
	.dw	@npc_00
	.dw	@npc_01
	.dw	@npc_02
	.dw	0x0

@npc_00: // Hollow
	// Set sprite to Hollow
	.dh	0x22	:: .dh	0x51				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x02				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0004, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_HOLLOWVANISH	:: .align 4

	// Set animation (invisible)
	.db	0x07	:: .db	0x00				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_01: // Mega Man
	// Set sprite to NPC 1
	.dh	0x04	:: .dh	0x01				:: .align 4
	// Set animation (stance northwest)
	.db	0x07	:: .db	0x1E				:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF04, 0x0048, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_MEGAWALKUP		:: .align 4

	// Run northwest
	.db	0x1F	:: .db	0x17, 0x07			:: .align 4
			:: .dh	0x100, (3*12)			:: .align 4
	// Set animation (stance northwest)
	.db	0x07	:: .db	0x1E				:: .align 4
	// Wait 60 frames
	.dh	0x0B	:: .dh	(60)				:: .align 4
	// Set animation (idle northwest)
	.db	0x07	:: .db	0x07				:: .align 4
	// Set NPC variable
	.db	0x17	:: .db	0x00, @STATE_MEGAWALKEND	:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_LOOKMEGA		:: .align 4

	// Set animation (look south)
	.db	0x07	:: .db	0x04				:: .align 4
	// Wait 30 frames
	.dh	0x0B	:: .dh	(30)				:: .align 4
	// Set animation (look at Mega)
	.db	0x07	:: .db	0x19				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4

@npc_02: // Thunderbolt
	// Set sprite to thunderbolt
	.dh	0x22	:: .dh	0x50				:: .align 4
	// Set animation (idle)
	.db	0x07	:: .db	0x00				:: .align 4
	// Set position
//	.dh	0x05	:: .dh	0xFF04, 0x0024, 0x00C0		:: .align 4
	.dh	0x05	:: .dh	0xFF04, 0x0004, 0x00C0		:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Wait for NPC variable
	.db	0x18	:: .db	0x00, @STATE_BOLT		:: .align 4

	// Play SFX
	.dh	0x1C	:: .dh	SE_MGTHUNDER			:: .align 4
	// Set animation (strike)
	.db	0x07	:: .db	0x01				:: .align 4

	// Loop forever
	.dw	0x01						:: .align 4


.align 2
@setSkipFadeReset:
	// r0 = skip (0 = no, 1 = yes)
	ldr	r1,=common_fadeReset
	str	r0,[r1]

	mov	r0,0x0
	bx	r14


.align 2
@setSkipFadeTimer:
	// r0 = timer
	ldr	r1,=0x211C964
	ldr	r1,[r1]
	strh	r0,[r1,0x6]

	mov	r0,0x0
	bx	r14


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
overlay_0662_sinit_init:
	.dw	0
overlay_0662_sinit_init_end:
	.aligna	32
overlay_0662_size:
.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 662 * 0x20
	.dw	662			// Overlay ID (overlay_0662)
	.dw	0x21BE560		// Load address
	.dw	overlay_0662_size	// Uncompressed size
	.dw	0
	.dw	overlay_0662_sinit_init
	.dw	overlay_0662_sinit_init_end
	.dw	662			// File ID
	.skip	4

.close
