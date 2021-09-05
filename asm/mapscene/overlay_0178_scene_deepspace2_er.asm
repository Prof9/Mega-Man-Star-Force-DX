// Overlay 178 - Deep Space 2 ER map script

@OVL	equ	readu32(TEMP+"/y9.bin", 178 * 0x20 + 0x4)

.nds
.thumb
.open TEMP+"/overlay_0178.bin",@OVL

.orga 0x0
	// Hook
	.dw	0x13
	.dw	@postBattle-(.-4)


.orga 0x24
	// Wait for text script to finish
	.dw	0x08

	// Check script queued up
	.dh	0x16	:: .dh	0xF171
			:: .dw	@@postLeoScript-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF171
	// Start cutscene 323
	.dw	0x4C	:: .dw	(323)
			:: .dw	0x0
	// End script
	.dw	0x04

@@postLeoScript:
	// Check script queued up
	.dh	0x16	:: .dh	0xF170
			:: .dw	@@next-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 1 from mess_1206
	.dh	0x26	:: .db	0x01, (1)
	// Wait for text script to finish
	.dw	0x08

@@next:
	// Unlock player controls
	.dw	0x2A

	// Clear flag "boss tile inactive"
	.dh	0x22
	.dh	0x00BD

	// Check flag "Satellite Admin EX battle started"
	.dh	0x16
	.dh	0x00BB
	.dw	@@end-(.-4)

	// Start battle Leo Kingdom EX
	.dw	0x49
	.dw	0x56

@@end:
	// End script
	.dw	0x04

.align 4
@postBattle:

	// Check flag "Leo Kingdom EX defeated"
	.dh	0x15
	.dh	0xF10B
	.dw	@@return-(.-4)

	// Check flag "Satellite Admin EX battle started"
	.dh	0x16
	.dh	0x00BB
	.dw	@@return-(.-4)

	// Clear flag "Satellite Admin EX battle started"
	.dh	0x22
	.dh	0x00BB

	// Check if won the battle
	.dh	0x1A
	.dh	0x01
	.dw	@@lost-(.-4)

	// Set Leo Kingdom EX defeated flag
	.dh	0x21
	.dh	0xF10B

	// Return
	.dw	0x13
	.dw	@@return-(.-4)

@@lost:
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFFD4-0x20, 0xFFFFFEF4, 0x00000000
	// Set player direction
	.dh	0x33	:: .db	0x01, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 1 from mess_1206
//	.dh	0x26	:: .db	0x01, (1)

@@return:
	// Return
	.dh	0x54
	.dh	0x0000
	.dh	0x54
	.dh	0x0001

	.dw	0x13
	.dw	0x8-(.-4-@OVL)


.align 2
@lockPlayer:
	push	r14
	bl	0x2189424
	mov	r0,0x0
	pop	r15


.align 4
overlay_0178_sinit_init:
	.dw	0
overlay_0178_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 178 * 0x20
	.skip	16
	.dw	overlay_0178_sinit_init
	.dw	overlay_0178_sinit_init_end
	.skip	8

.close