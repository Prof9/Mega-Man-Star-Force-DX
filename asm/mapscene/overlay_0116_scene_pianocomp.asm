// Overlay 116 - Piano Comp map script

.nds
.thumb
.open TEMP+"/overlay_0116.bin",readu32(TEMP+"/y9.bin", 116 * 0x20 + 0x4)
.area 0x21B8E00-.

mapscene_8D09_start:
	// Initialize NPCs (?)
	.dh	0x54	:: .dh	0x0
	.dh	0x54	:: .dh	0x2

@postGauntletRefight:
	// Gauntlet refight post-battle handler
	// Check flag gauntlet refight active
	.dh	0x16	:: .dh	0xF140
			:: .dw	@start_end-(.-4)
	// Check if won the battle
	.dh	0x1A	:: .dh	0x1
			:: .dw	@postGauntletRefightScript-(.-4)
	// Check flag beat gauntlet fight 10
	.dh	0x16	:: .dh	0xF14A
			:: .dw	@start_end-(.-4)

@postGauntletRefightScript:
	// Clear gauntlet refight flags
	.dh	0x22	:: .dh	0xF140
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0xFFFFFFF4, 0xFFFFFFF4+0x20, 0x00000000
	// Set player direction
	.dh	0x33	:: .db	0x07, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 12
//	.dh	0x26	:: .db	0x01, (12)

@start_end:
	// End script
	.dw	0x04

mapscene_8D09_while:
	// Wait for text script to finish
	.dw	0x08

	// Check script queued up
	.dh	0x16	:: .dh	0xF170
			:: .dw	@@checkGauntlet-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 12
	.dh	0x26	:: .db	0x01, (12)
	// Wait for text script to finish
	.dw	0x08

@@checkGauntlet:
	// Unlock player controls
	.dw	0x2A

	// Check if gauntlet refight active
	.dh	0x15	:: .dh	0xF140
			:: .dw	@gauntletRefightHandler-(.-4)
	// Check if gauntlet started
	.dh	0x16	:: .dh	0x1A81
			:: .dw	@end-(.-4)
	// Check if gauntlet finished
	.dh	0x15	:: .dh	0x1A82
			:: .dw	@end-(.-4)
	// Check if beat fight 1
	.dh	0x16	:: .dh	0x1AAD
			:: .dw	@fight1-(.-4)
	// Check if beat fight 2
	.dh	0x16	:: .dh	0x1AAE
			:: .dw	@fight2-(.-4)
	// Check if beat fight 3
	.dh	0x16	:: .dh	0x1AAF
			:: .dw	@fight3-(.-4)
	// Check if beat fight 4
	.dh	0x16	:: .dh	0x1AB0
			:: .dw	@fight4-(.-4)
	// Check if beat fight 5
	.dh	0x16	:: .dh	0x1AB1
			:: .dw	@fight5-(.-4)
	// Check if beat fight 6
	.dh	0x16	:: .dh	0x1AB2
			:: .dw	@fight6-(.-4)
	// Check if beat fight 7
	.dh	0x16	:: .dh	0x1AB3
			:: .dw	@fight7-(.-4)
	// Check if beat fight 8
	.dh	0x16	:: .dh	0x1AB4
			:: .dw	@fight8-(.-4)
	// Check if beat fight 9
	.dh	0x16	:: .dh	0x1AB5
			:: .dw	@fight9-(.-4)
	// Check if beat fight 10
	.dh	0x16	:: .dh	0x1AB6
			:: .dw	@fight10-(.-4)
@fight1:
	// Start fixed fight
	.dw	0x49	:: .dw	0x3B
	// Set flag
	.dh	0x21	:: .dh	0x1AAD
	// End script
	.dw	0x04
@fight2:
	// Start fixed fight
	.dw	0x49	:: .dw	0x3C
	// Set flag
	.dh	0x21	:: .dh	0x1AAE
	// End script
	.dw	0x04
@fight3:
	// Start fixed fight
	.dw	0x49	:: .dw	0x3D
	// Set flag
	.dh	0x21	:: .dh	0x1AAF
	// End script
	.dw	0x04
@fight4:
	// Start fixed fight
	.dw	0x49	:: .dw	0x3E
	// Set flag
	.dh	0x21	:: .dh	0x1AB0
	// End script
	.dw	0x04
@fight5:
	// Start fixed fight
	.dw	0x49	:: .dw	0x3F
	// Set flag
	.dh	0x21	:: .dh	0x1AB1
	// End script
	.dw	0x04
@fight6:
	// Start fixed fight
	.dw	0x49	:: .dw	0x40
	// Set flag
	.dh	0x21	:: .dh	0x1AB2
	// End script
	.dw	0x04
@fight7:
	// Start fixed fight
	.dw	0x49	:: .dw	0x41
	// Set flag
	.dh	0x21	:: .dh	0x1AB3
	// End script
	.dw	0x04
@fight8:
	// Start fixed fight
	.dw	0x49	:: .dw	0x42
	// Set flag
	.dh	0x21	:: .dh	0x1AB4
	// End script
	.dw	0x04
@fight9:
	// Start fixed fight
	.dw	0x49	:: .dw	0x43
	// Set flag
	.dh	0x21	:: .dh	0x1AB5
	// End script
	.dw	0x04
@fight10:
	// Set post-battle position+script loader
	.dh	0x80	:: .db	0x15		:: .align 4
	// Start fixed fight
	.dw	0x49	:: .dw	0x44
	// Set flag
	.dh	0x21	:: .dh	0x1AB6
	// Set flag
	.dh	0x21	:: .dh	0x1A82
	// End script
	.dw	0x04

@gauntletRefightHandler:
	// Check if beat fight 1
	.dh	0x16	:: .dh	0xF141
			:: .dw	@refight1-(.-4)
	// Check if beat fight 2
	.dh	0x16	:: .dh	0xF142
			:: .dw	@refight2-(.-4)
	// Check if beat fight 3
	.dh	0x16	:: .dh	0xF143
			:: .dw	@refight3-(.-4)
	// Check if beat fight 4
	.dh	0x16	:: .dh	0xF144
			:: .dw	@refight4-(.-4)
	// Check if beat fight 5
	.dh	0x16	:: .dh	0xF145
			:: .dw	@refight5-(.-4)
	// Check if beat fight 6
	.dh	0x16	:: .dh	0xF146
			:: .dw	@refight6-(.-4)
	// Check if beat fight 7
	.dh	0x16	:: .dh	0xF147
			:: .dw	@refight7-(.-4)
	// Check if beat fight 8
	.dh	0x16	:: .dh	0xF148
			:: .dw	@refight8-(.-4)
	// Check if beat fight 9
	.dh	0x16	:: .dh	0xF149
			:: .dw	@refight9-(.-4)
	// Check if beat fight 10
	.dh	0x16	:: .dh	0xF14A
			:: .dw	@refight10-(.-4)
@refight1:
	// Start fixed fight
	.dw	0x49	:: .dw	0x86
	// Set flag
	.dh	0x21	:: .dh	0xF141
	// End script
	.dw	0x04
@refight2:
	// Start fixed fight
	.dw	0x49	:: .dw	0x87
	// Set flag
	.dh	0x21	:: .dh	0xF142
	// End script
	.dw	0x04
@refight3:
	// Start fixed fight
	.dw	0x49	:: .dw	0x88
	// Set flag
	.dh	0x21	:: .dh	0xF143
	// End script
	.dw	0x04
@refight4:
	// Start fixed fight
	.dw	0x49	:: .dw	0x89
	// Set flag
	.dh	0x21	:: .dh	0xF144
	// End script
	.dw	0x04
@refight5:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8A
	// Set flag
	.dh	0x21	:: .dh	0xF145
	// End script
	.dw	0x04
@refight6:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8B
	// Set flag
	.dh	0x21	:: .dh	0xF146
	// End script
	.dw	0x04
@refight7:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8C
	// Set flag
	.dh	0x21	:: .dh	0xF147
	// End script
	.dw	0x04
@refight8:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8D
	// Set flag
	.dh	0x21	:: .dh	0xF148
	// End script
	.dw	0x04
@refight9:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8E
	// Set flag
	.dh	0x21	:: .dh	0xF149
	// End script
	.dw	0x04
@refight10:
	// Start fixed fight
	.dw	0x49	:: .dw	0x8F
	// Set flag
	.dh	0x21	:: .dh	0xF14A
	// End script
	.dw	0x04

@end:
	// End script
	.dw	0x04


.align 2
@lockPlayer:
	push	r14
	bl	0x2189424
	mov	r0,0x0
	pop	r15


.align 4
overlay_0116_sinit_init:
	.dw	0
overlay_0116_sinit_init_end:
	.aligna	32

.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 116 * 0x20
	.skip	16
	.dw	overlay_0116_sinit_init
	.dw	overlay_0116_sinit_init_end
	.skip	8

.close