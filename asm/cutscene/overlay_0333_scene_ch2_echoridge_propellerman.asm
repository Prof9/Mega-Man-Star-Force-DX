// Overlay 333 - PropellerMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0333.bin",readu32(TEMP+"/y9.bin", 333 * 0x20 + 0x4)


.org 0x21BE5F4
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE62C
	.dw	0x13	:: .dw	@skip1End-(.-4)
	.skip	0xC
@return1End:

.org 0x21BE718
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:

.org 0x21BE740
	.dw	0x13	:: .dw	@skip2End-(.-4)
@return2End:


.org readu32(TEMP+"/y9.bin", 333 * 0x20 + 0x10)


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
	// Call function
	.dw	0x5C	:: .dw	0x2189740|1
			:: .dw	0x0
	// Wait for screen fade
	.dw	0x0B

	// Check NPC variable
	.dh	0x17	:: .db	0x1, 0x1	:: .dw	@@next-(.-4)
	// Set NPC variable
	.dh	0x25	:: .db	0x0, 0x1
	// Wait for NPC variable
	.dh	0x0D	:: .db	0x1, 0x1
@@next:
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
@skip2Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip2End-(.-4)
	// Start text script 7
	.dh	0x26	:: .db	0x4, (7)
	// Wait for text script
	.dw	0x08
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)

.align 4
@skip2End:
	// Clear cutscene skip
	.dw	0x12
	// Give card Attack+10 *
	.dh	0x5F	:: .dh	(150)	:: .db	(1), 0x2	:: .align 4
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x4
	// Jump back
	.dw	0x13	:: .dw	@return2End-(.-4)


.align 4
overlay_0333_sinit_init:
	.dw	0
overlay_0333_sinit_init_end:
	.aligna	32
overlay_0333_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 333 * 0x20
	.skip	16
	.dw	overlay_0333_sinit_init
	.dw	overlay_0333_sinit_init_end
	.skip	8

.close
