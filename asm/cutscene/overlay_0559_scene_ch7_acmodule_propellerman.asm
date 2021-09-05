// Overlay 559 - PropellerMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0559.bin",readu32(TEMP+"/y9.bin", 559 * 0x20 + 0x4)


.org 0x21BE628
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE684
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
@return1End:

.org 0x21BE6A0
	.dw	0x13	:: .dw	@skip1Fade-(.-4)
	.skip	0x4
@return1Fade:

.org 0x21BE7B0
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:

.org 0x21BE804
	.dw	0x13	:: .dw	@skip2End-(.-4)
@return2End:


.org readu32(TEMP+"/y9.bin", 559 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE800-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip2End:
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B
	// Check if gate closed
	.dh	0x16	:: .dh	0xA3	:: .dw	@@end-(.-4)
	// Set flag: suppress SFX
	.dh	0x21	:: .dh	0xF18D
	// Clear flag: gate
	.dh	0x22	:: .dh	0xA3
@@end:
	// Jump back
	.dw	0x13	:: .dw	@return2End-(.-4)

.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1Normal:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12

	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)

.align 4
@skip1Fade:
	// Clear sound script
	.dh	0x61	:: .db	0x0	:: .align 4
	// Start camera script
	.dw	0x4D	:: .dw	@camera
			:: .dw	0x0
	// Clear text script
	.dw	0x27

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npc
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x2
	// Call function
	.dw	0x5C	:: .dw	0x2189754|1
			:: .dw	0x0
	// Jump back
	.dw	0x13	:: .dw	@return1Fade-(.-4)


.align 4
@camera:
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFF22, 0x00000098, 0x00000000
	// End script
	.dw	0x04


.align 4
@npc:
	.dw	0x21B8F1C	// Geo
	.dw	@npc_01		// Drone
	.dw	0x0

.align 4
@npc_01: // Drone
	// Set sprite
	.dh	0x22	:: .dh	0x325			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x2			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF22, 0x0098, 0x0000	:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21B8F68-(.-4)		:: .align 4


.align 4
overlay_0559_sinit_init:
	.dw	0
overlay_0559_sinit_init_end:
	.aligna	32
overlay_0559_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 559 * 0x20
	.skip	16
	.dw	overlay_0559_sinit_init
	.dw	overlay_0559_sinit_init_end
	.skip	8

.close
