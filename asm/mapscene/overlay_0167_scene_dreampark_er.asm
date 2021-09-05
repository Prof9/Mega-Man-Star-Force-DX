// Overlay 167 - Dream Park ER map script

@OVL	equ	readu32(TEMP+"/y9.bin", 167 * 0x20 + 0x4)

.nds
.thumb
.open TEMP+"/overlay_0167.bin",@OVL

.orga 0x14
.area 0xC,0x00
@postBattle_start:
	// Hook
	.dw	0x13
	.dw	@postBattle-(.-4)
.endarea


.orga 0x90
.area 0x40,0x00
@checkBrother:
	// If flag 0xF004 not set, skip to @startBattle
	.dh	0x16	:: .dh	0xF004
			:: .dw	@startBattle-(.-4)

@brother:
	// Start cutscene
	.dw	0x4C	:: .dw	0x135		// Boktai Brother 3
			:: .dw	0x0

@startBattle:
	// Wait for text script to finish
	.dw	0x08

	// Check script queued up
	.dh	0x15	:: .dh	0xF170
			:: .dw	@startPostGeminiScript-(.-4)

@while2:
	// Unlock player controls
	.dw	0x2A

	// Clear flag "boss tile inactive"
	.dh	0x22
	.dh	0x00BD

	// Check flag "Gemini Spark EX battle started"
	.dh	0x16
	.dh	0x00B9
	.dw	0xD0-(.-4-@OVL)

	// Start battle Gemini Spark EX
	.dw	0x49
	.dw	0x4B

	// End script
	.dw	0x04
.endarea


.org readu32(TEMP+"/y9.bin", 167 * 0x20 + 0x10)


.align 4
@startPostGeminiScript:
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 12 from mess_1170
	.dh	0x26	:: .db	0x01, (12)
	// Wait for text script to finish
	.dw	0x08

	.dw	0x13	:: .dw	@while2-(.-4)


.align 4
@postBattle:
	// Check if won the battle
	.dh	0x1A
	.dh	0x01
	.dw	@@lost-(.-4)

	// Set Gemini Spark EX defeated flag
	.dh	0x21
	.dh	0x00BA

	// Return
	.dw	0x13
	.dw	0x20-(.-4-@OVL)

@@lost:
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x00000000
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFF74, 0x000001F4-0x20, 0x00000100
	// Set player direction
	.dh	0x33	:: .db	0x03, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 12 from mess_1170
//	.dh	0x26	:: .db	0x01, (12)

	// Return
	.dw	0x13
	.dw	0x20-(.-4-@OVL)


.align 2
@lockPlayer:
	push	r14
	bl	0x2189424
	mov	r0,0x0
	pop	r15


.align 4
overlay_0167_sinit_init:
	.dw	0
overlay_0167_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 167 * 0x20
	.skip	16
	.dw	overlay_0167_sinit_init
	.dw	overlay_0167_sinit_init_end
	.skip	8

.close