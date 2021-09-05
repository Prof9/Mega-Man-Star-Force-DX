// Overlay 391 - Sonia Brother Band cutscene

.nds
.thumb
.open TEMP+"/overlay_0391.bin",readu32(TEMP+"/y9.bin", 391 * 0x20 + 0x4)


.org 0x21BE6B0
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE6C0
//	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:

.org 0x21BE6C8
//	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:

.org 0x21BE748
//	.dw	0x13	:: .dw	@skip2End-(.-4)
//	.skip	0x4
@return2End:

.org 0x21BE758
//	.dw	0x13	:: .dw	@skip3Start-(.-4)
@return3Start:

.org 0x21BE774
//	.dw	0x13	:: .dw	@skip3End-(.-4)
//	.skip	0x4
@return3End:

.org 0x21BE78C
//	.dw	0x13	:: .dw	@skip4Start-(.-4)
@return4Start:

.org 0x21BE7C4
	.dw	0x13	:: .dw	@skip4End-(.-4)
@return4End:

.org 0x21BE804
	.dw	0x13	:: .dw	@skip5Start-(.-4)
@return5Start:


.org readu32(TEMP+"/y9.bin", 391 * 0x20 + 0x10)


.align 4
@skip5Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE97C-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return5Start-(.-4)

.align 4
@skip4Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip4End-(.-4)
	// Wait 90 frames
	.dw	0x50	:: .dw	(90)
	// Jump back
	.dw	0x13	:: .dw	@return4Start-(.-4)

.align 4
@skip4End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x2
	// Wait for screen fade
	.dw	0x0B

	// End text script
	.dw	0x27

	// Start camera script
	.dw	0x4D	:: .dw	0x21BE588
			:: .dw	0x0

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npc
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x7

	// Jump back
	.dw	0x13	:: .dw	@return4End-(.-4)

.align 4
@skip3Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip4End-(.-4)
	// Wait 90 frames
	.dw	0x50	:: .dw	(90)
	// Jump back
	.dw	0x13	:: .dw	@return3Start-(.-4)

.align 4
@skip3End:
	// Clear cutscene skip
	.dw	0x12
	// Start camera script
	.dw	0x4D	:: .dw	0x21BE588
			:: .dw	0x0
	// Jump back
	.dw	0x13	:: .dw	@return3End-(.-4)

.align 4
@skip2Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip4End-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip2End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x11, 0x2
	// Fade out BGM
	.dw	0x46	:: .dw	(120)
	// Jump back
	.dw	0x13	:: .dw	@return2End-(.-4)

.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip4End-(.-4)
	// Start text script 0
	.dh	0x26	:: .db	0x4, (0)
	// Wait for text script
	.dw	0x08
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1End:	
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade in
	.dh	0x1F	:: .db	0x10, 0x2
	// Wait for screen fade in
	.dw	0xB
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
@npc:
	.dw	@npc_00		// Geo
	.dw	@npc_01		// Sonia
	.dw	0x21BAFC4	// Bob Copper
	.dw	0x0

.align 4
@npc_00: // Geo
	// Set sprite to NPC 0
	.dh	0x04	:: .dh	0x0			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x7			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0104, 0x0070, 0x0020	:: .align 4
	// Enable object
	.dw	0x02					:: .align 4
	// Enable ???
	.dw	0x20					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BADFC-(.-4)		:: .align 4
.align 4
@npc_01: // Sonia
	// Set sprite
	.dh	0x22	:: .dh	0x34B			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x6			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0104, 0x0058, 0x0020	:: .align 4
	// Enable object
	.dw	0x02					:: .align 4
	// Enable ???
	.dw	0x20					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21BAED0-(.-4)		:: .align 4


.align 4
overlay_0391_sinit_init:
	.dw	0
overlay_0391_sinit_init_end:
	.aligna	32
overlay_0391_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 391 * 0x20
	.skip	16
	.dw	overlay_0391_sinit_init
	.dw	overlay_0391_sinit_init_end
	.skip	8

.close
