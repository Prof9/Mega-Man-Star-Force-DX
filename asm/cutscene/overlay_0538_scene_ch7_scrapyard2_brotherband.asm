// Overlay 538 - Scrapyard 2 Sonia Brother Band cutscene

.nds
.thumb
.open TEMP+"/overlay_0538.bin",readu32(TEMP+"/y9.bin", 538 * 0x20 + 0x4)

.org 0x21BE588
	.dw	0x13	:: .dw	@setMegaManPortrait-(.-0x4)
.org 0x21BE670
	.dw	0x13	:: .dw	@setGeoPortrait-(.-4)

.org 0x21BE638
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE65C
	.dw	0x13	:: .dw	@skip1Disable-(.-4)
@return1Disable:

.org 0x21BE678
	.dw	0x13	:: .dw	@skip1Enable-(.-4)
@return1Enable:

.org 0x21BE750
	.dw	0x13	:: .dw	@skip1Normal-(.-4)
@return1End:

.org 0x21BE774
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 538 * 0x20 + 0x10)


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
	.dw	0x13	:: .dw	0x21BE590-(.-4)

.align 4
@setGeoPortrait:
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Return
	.dw	0x13	:: .dw	0x21BE678-(.-4)


.align 4
@skip2Start:
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE78C-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip1Disable:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x3, 0x10
	// Wait for screen fade
	.dw	0x0B
	// Jump back
	.dw	0x13	:: .dw	@return1Disable-(.-4)

.align 4
@skip1Enable:
	// Start screen fade
	.dh	0x1F	:: .db	0x2, 0x2
	// Wait for screen fade
	.dw	0x0B
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Jump back
	.dw	0x13	:: .dw	@return1Enable-(.-4)

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

	// Destroy spawned object
	.dw	0x6B
	// End text script
	.dw	0x27

	// Start camera script
	.dw	0x4D	:: .dw	0x21BE574
			:: .dw	0x0

	// Destroy NPCs
	.dw	0x40
	// Start NPC objects
	.dw	0x93	:: .dw	@npc
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0xE

	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Set top screen portrait to Geo
	.dw	0x5C	:: .dw	0x21892F4|1
			:: .dw	0x0
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
	.dw	@npc_01		// Sonia
	.dw	0x0

.align 4
@npc_00: // Geo
	// Set sprite to NPC 0
	.dh	0x04	:: .dh	0x0			:: .align 4
	// Face direction
	.db	0x07	:: .db	0x01			:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFFCC, 0x002E, 0x0020	:: .align 4
	// Enable ???
	.dw	0x20					:: .align 4
	// Loop forever
	.dw	0x01					:: .align 4
.align 4
@npc_01: // Sonia
	// Enable ???
	.dw	0x20					:: .align 4
	// Jump
	.dw	0x12	:: .dw	0x21B97C8-(.-4)		:: .align 4
.align 4


.align 4
overlay_0538_sinit_init:
	.dw	0
overlay_0538_sinit_init_end:
	.aligna	32
overlay_0538_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 538 * 0x20
	.skip	16
	.dw	overlay_0538_sinit_init
	.dw	overlay_0538_sinit_init_end
	.skip	8

.close
