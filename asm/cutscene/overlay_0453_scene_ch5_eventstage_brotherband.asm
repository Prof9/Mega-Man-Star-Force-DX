// Overlay 453 - ThermoMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0453.bin",readu32(TEMP+"/y9.bin", 453 * 0x20 + 0x4)


.org 0x21BE640
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:


.org 0x21BE7A4
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
@return1End:


.org 0x21BE7C8
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 453 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE820-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

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

	// End text script
	.dw	0x27

	// Start camera script
	.dw	0x4D	:: .dw	0x21BE59C
			:: .dw	0x0

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npc
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0xD

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start screen fade
	.dh	0x1F	:: .db	0x0, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Wait for 30 frames
	.dw	0x50	:: .dw	(30)

	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
@npc:
	.dw	@npc_00		// Geo
	.dw	@npc_01		// Luna
	.dw	0x21BA2BC	// Sonia
	.dw	0x0

.align 4
@npc_00: // Geo
	// Set sprite to NPC 0
	.dh	0x04	:: .dh	0x0			:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BA210-(.-4)		:: .align 4
.align 4
@npc_01: // Luna
	// Set sprite
	.dh	0x22	:: .dh	0x5			:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BA29C-(.-4)		:: .align 4
.align 4


.align 4
overlay_0453_sinit_init:
	.dw	0
overlay_0453_sinit_init_end:
	.aligna	32
overlay_0453_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 453 * 0x20
	.skip	16
	.dw	overlay_0453_sinit_init
	.dw	overlay_0453_sinit_init_end
	.skip	8

.close
