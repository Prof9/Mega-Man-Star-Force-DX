// Overlay 157 - Class 5-A ER map script

@OVL	equ	readu32(TEMP+"/y9.bin", 157 * 0x20 + 0x4)

.nds
.thumb
.open TEMP+"/overlay_0157.bin",@OVL

.orga 0x14
.area 0xC,0x00
@postBattle_start:
	// Hook
	.dw	0x13
	.dw	@postBattle-(.-4)
.endarea


.orga 0xD0
.area 0x40,0x00
	// Wait for text script to finish
	.dw	0x08

	// Check script queued up
	.dh	0x16	:: .dh	0xF170
			:: .dw	@@next-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 11 from mess_1127
	.dh	0x26	:: .db	0x01, (11)
	// Wait for text script to finish
	.dw	0x08

@@next:
	// Unlock player controls
	.dw	0x2A

	// Clear flag "boss tile inactive"
	.dh	0x22
	.dh	0x00BD

	// Check flag "Libra Scales EX battle started"
	.dh	0x16
	.dh	0x00B5
	.dw	0x110-(.-4-@OVL)

	// Start battle Libra Scales EX
	.dw	0x49
	.dw	0x49

	// End script
	.dw	0x04
.endarea


.org readu32(TEMP+"/y9.bin", 157 * 0x20 + 0x10)

.align 4
@postBattle:

	// Check if won the battle
	.dh	0x1A
	.dh	0x01
	.dw	@@lost-(.-4)

	// Set Libra Scales EX defeated flag
	.dh	0x21
	.dh	0x00B6

	// Return
	.dw	0x13
	.dw	0x20-(.-4-@OVL)

@@lost:
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFF9C, 0xFFFFFF0C+0x20, 0x000000C0
	// Set player direction
	.dh	0x33	:: .db	0x07, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 11 from mess_1127
//	.dh	0x26	:: .db	0x01, (11)

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
overlay_0157_sinit_init:
	.dw	0
overlay_0157_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 157 * 0x20
	.skip	16
	.dw	overlay_0157_sinit_init
	.dw	overlay_0157_sinit_init_end
	.skip	8

.close