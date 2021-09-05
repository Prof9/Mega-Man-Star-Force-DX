// Overlay 146 - Vista Point ER map script

@OVL	equ	readu32(TEMP+"/y9.bin", 146 * 0x20 + 0x4)

.nds
.thumb
.open TEMP+"/overlay_0146.bin",@OVL

.orga 0x0
.area 0x20,0x00
	.dh	0x15	:: .dh	0xB4
			:: .dw	@postBattleHollowFree_start-(.-4)
	.dh	0x16	:: .dh	0xB3
			:: .dw	@postBattleHollowFree_start-(.-4)
@postBattle_start:
	// Hook
	.dw	0x13
	.dw	@postBattle-(.-4)

@postBattleHollowFree_start:
	// Hook	
	.dw	0x13
	.dw	@postBattleHollowFree-(.-4)
.endarea


.orga 0x138
.area 0x40,0x00
	// Wait for text script to finish
	.dw	0x08

	// Check script queued up
	.dh	0x15	:: .dh	0xF170
			:: .dw	@startPostHarpNoteScript-(.-4)
	.dh	0x15	:: .dh	0xF171
			:: .dw	@startPostHollowScript-(.-4)

@while2:
	// Check chapter end of game
	.dh	0x14	:: .db	0x00, 0x63
			:: .dw	@checkNoteGame-(.-4)

	// Check cutscene active
	.dh	0x16	:: .dh	0xF139
			:: .dw	@checkNoteGame-(.-4)

	.dw	0x13	:: .dw	@checkHollowCutscenes-(.-4)

@checkNoteGame:
	// Check 1000 Note Challenge active
	.dh	0x15	:: .dh	0xF12C
			:: .dw	@startNoteGame-(.-4)

	.dw	0x13	:: .dw	@checkHarpNoteEX-(.-4)
.endarea


.org readu32(TEMP+"/y9.bin", 146 * 0x20 + 0x10)
.area 0x21B8E00-.


.align 4
@startPostHarpNoteScript:
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 11 from mess_1067
	.dh	0x26	:: .db	0x01, (11)
	// Wait for text script to finish
	.dw	0x08

	.dw	0x13	:: .dw	@while2-(.-4)

.align 4
@startPostHollowScript:
	// Clear script queue
	.dh	0x22	:: .dh	0xF171
	// Start text script 52 from mess_1067
	.dh	0x26	:: .db	0x01, (52)
	// Wait for text script to finish
	.dw	0x08

	.dw	0x13	:: .dw	@while2-(.-4)


.align 4
@checkHollowCutscenes:
	// Check got warning from Omega-Xis
	.dh	0x15	:: .dh	0xF13F
			:: .dw	@checkHollowPreBattle-(.-4)
	// Set flag got warning from Omega-Xis
	.dh	0x21	:: .dh	0xF13F
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Start text script 60 from mess_1067
	.dh	0x26	:: .db	0x01, (60)

@checkHollowPreBattle:
	// Check Hollow pre-battle cutscene
	.dh	0x15	:: .dh	0xF134
			:: .dw	@checkHollowPostBattle-(.-4)

	// Check on trigger
	.dw	0x1B	:: .dw	0x16
			:: .dw	@startHollowPreBattle-(.-8)

	.dw	0x13	:: .dw	@checkNoteGame-(.-4)

@checkHollowPostBattle:
	// Check Hollow post-battle cutscene
	.dh	0x16	:: .dh	0xF135
			:: .dw	@startHollowPostBattle-(.-4)

	.dw	0x13	:: .dw	@checkNoteGame-(.-4)

.align 4
@postBattle:
	// Clear Harp Note EX battle flag
	.dh	0x22	:: .dh	0xB3

	// Check if won the battle
	.dh	0x1A	:: .dh	0x01
			:: .dw	@@lost-(.-4)

	// Set Harp Note EX defeated flag
	.dh	0x21	:: .dh	0x00B4

	// Return
	.dw	0x13	:: .dw	@postBattleHollowFree_start-(.-4)

@@lost:
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0x00000164-0x20, 0xFFFFFFE4, 0x000000C0
	// Set player direction
	.dh	0x33	:: .db	0x01, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 11 from mess_1067
//	.dh	0x26	:: .db	0x01, (11)

	// Return
	.dw	0x13	:: .dw	@postBattleHollowFree_start-(.-4)

.align 4
@postBattleHollowFree:
	// Check Hollow freefight flag active
	.dh	0x16	:: .dh	0xF137
			:: .dw	0x20-(.-4-@OVL)
	// Clear Hollow freefight flag
	.dh	0x22	:: .dh	0xF137
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFF04, 0x00000004+0x20, 0x000000C0
	// Set player direction
	.dh	0x33	:: .db	0x07, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF171
//	// Start text script 52 from mess_1067
//	.dh	0x26	:: .db	0x01, (52)

	// Return
	.dw	0x13	:: .dw	0x20-(.-4-@OVL)


.align 4
@checkHarpNoteEX:
	// Wait for text script to finish
	.dw	0x08

	// Unlock player controls
	.dw	0x2A

	// Clear flag "boss tile inactive"
	.dh	0x22
	.dh	0x00BD

	// Check flag "Harp Note EX battle started"
	.dh	0x16
	.dh	0x00B3
	.dw	0x178-(.-4-@OVL)

	// Start battle Harp Note EX
	.dw	0x49
	.dw	0x48

	// End script
	.dw	0x04


.align 4
@startNoteGame:
	// Start cutscene
	.dw	0x4C
	.dw	0x140	// 1000 Note Challenge
	.dw	0x0

	// End script
	.dw	0x04


.align 4
@startHollowPreBattle:
	// Start cutscene
	.dw	0x4C
	.dw	0x141	// Hollow pre-battle
	.dw	0x0

	// End script
	.dw	0x04


.align 4
@startHollowPostBattle:
	// Start cutscene
	.dw	0x4C
	.dw	0x142	// Hollow post-battle
	.dw	0x0

	// End script
	.dw	0x04


.align 2
@lockPlayer:
	push	r14
	bl	0x2189424
	mov	r0,0x0
	pop	r15


.align 4
overlay_0146_sinit_init:
	.dw	0
overlay_0146_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 146 * 0x20
	.skip	16
	.dw	overlay_0146_sinit_init
	.dw	overlay_0146_sinit_init_end
	.skip	8

.close