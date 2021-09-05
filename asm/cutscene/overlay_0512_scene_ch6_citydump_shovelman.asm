// Overlay 512 - ShovelMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0512.bin",readu32(TEMP+"/y9.bin", 512 * 0x20 + 0x4)


.org 0x21BE5E0
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE618
	.dw	0x13	:: .dw	@skip1End-(.-4)
	.skip	0x8
@return1End:


.org readu32(TEMP+"/y9.bin", 512 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x8
	// Wait for screen fade
	.dw	0x0B

	// End text script
	.dw	0x27

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npc
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x1
	// Set NPC variable
	.dh	0x25	:: .db	0x1, 0x1

	// Call function
	.dw	0x5C	:: .dw	0x2189D88|1
			:: .dw	0x0
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
@npc:
	.dw	@npc_00		// Geo
	.dw	0x0

.align 4
@npc_00:
	// Set sprite
	.dh	0x22	:: .dh	0x358			:: .align 4
	// Face direction
	.dh	0x07	:: .db	0x0			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0054, 0x00A4, 0x0000	:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21B98F8-(.-4)		:: .align 4


.align 4
overlay_0512_sinit_init:
	.dw	0
overlay_0512_sinit_init_end:
	.aligna	32
overlay_0512_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 512 * 0x20
	.skip	16
	.dw	overlay_0512_sinit_init
	.dw	overlay_0512_sinit_init_end
	.skip	8

.close
