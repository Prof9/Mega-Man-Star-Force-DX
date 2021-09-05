// Overlay 179 - Deep Space 3 ER map script

.nds
.thumb
.open TEMP+"/overlay_0179.bin",readu32(TEMP+"/y9.bin", 179 * 0x20 + 0x4)
.area 0x21B8E00-.

mapscene_9602_start:
@@postFinalBossRush:
	// Final Boss Rush post-battle handler
	// Check flag Final Boss Rush active
	.dh	0x16	:: .dh	0xF151
			:: .dw	@@postDragonEX-(.-4)
	// Check if won the battle
	.dh	0x1A	:: .dh	0x1
			:: .dw	@@postFinalBossRushRefightScript-(.-4)
	// Check flag beat battle 14
	.dh	0x16	:: .dh	0xF15F
			:: .dw	@@postDragonEX-(.-4)

@@postFinalBossRushRefightScript:
	// Clear Final Boss Rush active flag
	.dh	0x22	:: .dh	0xF151
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0x000001BC-0x20, 0xFFFFFF6E, 0x00000000
	// Set player direction
	.dh	0x33	:: .db	0x01, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF172
//	// Start text script 110 from mess_1209
//	.dh	0x26	:: .db	0x01, (110)

@@postDragonEX:
	// Dragon Sky EX post-battle handler
	// Check flag beat Dragon Sky EX
	.dh	0x15	:: .dh	0xF10D
			:: .dw	@@postTimeTrial-(.-4)
	// Check Admin EX fight active
	.dh	0x16	:: .dh	0xBB
			:: .dw	@@postTimeTrial-(.-4)
	// Unset Admin EX fight active flag
	.dh	0x22	:: .dh	0xBB
	// Check if won the battle
	.dh	0x1A	:: .dh	0x1
			:: .dw	@@lost-(.-4)
	// Set flag beat Dragon Sky EX
	.dh	0x21	:: .dh	0xF10D
	// Jump to init
	.dw	0x13	:: .dw	@@postTimeTrial-(.-4)
@@lost:
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Set player position
	.dw	0x35	:: .dw	0x0000003C, 0xFFFFFF6C+0x20, 0xFFFFFFC0
	// Set player direction
	.dh	0x33	:: .db	0x07, 0x00
	// Queue up script start
	.dh	0x21	:: .dh	0xF170
//	// Start text script 11 from mess_1209
//	.dh	0x26	:: .db	0x01, (11)

@@postTimeTrial:
	// Time trial post-battle handler
	// Check if was in a time trial
	.dh	0x16	:: .dh	0xF008
			:: .dw	@@init-(.-4)
	// Set player position
	.dw	0x5C	:: .dw	@setPostTimeTrialPosition|1
			:: .dw	0x0
	// Lock player controls
	.dw	0x5C	:: .dw	@lockPlayer|1
			:: .dw	0x0
	// Queue up script start
	.dh	0x21	:: .dh	0xF171
//	// Start text script 70 from mess_1209
//	.dh	0x26	:: .db	0x01, (70)

@@init:
	// Initialize stuff
	.dh	0x54	:: .dh	0x0
	.dh	0x54	:: .dh	0x1
	.dh	0x54	:: .dh	0x2
	.dh	0x54	:: .dh	0x3
	.dh	0x54	:: .dh	0x4
	.dh	0x54	:: .dh	0x5
	.dh	0x54	:: .dh	0x6
	.dh	0x54	:: .dh	0x7
	.dh	0x54	:: .dh	0x8
	.dh	0x54	:: .dh	0x9
	.dh	0x54	:: .dh	0xA
	.dh	0x54	:: .dh	0xB

	// Start post-battle cutscene
	// Check Admin post-battle cutscene active
	.dh	0x16	:: .dh	0x908
			:: .dw	@@end-(.-4)
	// Check Admin post-battle cutscene not finished
	.dh	0x15	:: .dh	0x909
			:: .dw	@@end-(.-4)
	// Set screen fade for map reload
	.dh	0x20	:: .db	0x2, 0xFF
	// Jump based on Satellite
	.dw	0xA8	:: .dw	@@pegasus-(.-4)
			:: .dw	@@leo-(.-8)
			:: .dw	@@dragon-(.-12)
@@pegasus:
	// Start post-battle cutscene
	.dw	0x4C	:: .dw	0x121, 0x0
	// Jump to end
	.dw	0x13	:: .dw	@@end
@@leo:
	// Start post-battle cutscene
	.dw	0x4C	:: .dw	0x122, 0x0
	// Jump to end
	.dw	0x13	:: .dw	@@end
@@dragon:
	// Start post-battle cutscene
	.dw	0x4C	:: .dw	0x123, 0x0
//	// Jump to end
//	.dw	0x13	:: .dw	@@end
@@end:
	// End script
	.dw	0x04


mapscene_9602_while:
	// Wait for text script to finish
	.dw	0x08

@@checkPostScriptDragon:
	// Check script queued up
	.dh	0x16	:: .dh	0xF170
			:: .dw	@@checkPostScriptTimeTrial-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF170
	// Start text script 11 from mess_1209
	.dh	0x26	:: .db	0x01, (11)
	// Wait for text script to finish
	.dw	0x08

@@checkPostScriptTimeTrial:
	// Check script queued up
	.dh	0x16	:: .dh	0xF171
			:: .dw	@@checkPostScriptBossRush-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF171
	// Start text script 70 from mess_1209
	.dh	0x26	:: .db	0x01, (70)
	// Wait for text script to finish
	.dw	0x08

@@checkPostScriptBossRush:
	// Check script queued up
	.dh	0x16	:: .dh	0xF172
			:: .dw	@@next-(.-4)
	// Clear script queue
	.dh	0x22	:: .dh	0xF172
	// Start text script 110 from mess_1209
	.dh	0x26	:: .db	0x01, (110)
	// Wait for text script to finish
	.dw	0x08

@@next:
	// Unlock player controls
	.dw	0x2A

@@startFinalBossRush:
	// Check if Final Boss Rush active
	.dh	0x16	:: .dh	0xF151
			:: .dw	@@startDragonEX-(.-4)
	// Check if beat fight 1
	.dh	0x16	:: .dh	0xF152
			:: .dw	@@fight1-(.-4)
	// Check if beat fight 2
	.dh	0x16	:: .dh	0xF153
			:: .dw	@@fight2-(.-4)
	// Check if beat fight 3
	.dh	0x16	:: .dh	0xF154
			:: .dw	@@fight3-(.-4)
	// Check if beat fight 4
	.dh	0x16	:: .dh	0xF155
			:: .dw	@@fight4-(.-4)
	// Check if beat fight 5
	.dh	0x16	:: .dh	0xF156
			:: .dw	@@fight5-(.-4)
	// Check if beat fight 6
	.dh	0x16	:: .dh	0xF157
			:: .dw	@@fight6-(.-4)
	// Check if beat fight 7
	.dh	0x16	:: .dh	0xF158
			:: .dw	@@fight7-(.-4)
	// Check if beat fight 8
	.dh	0x16	:: .dh	0xF159
			:: .dw	@@fight8-(.-4)
	// Check if beat fight 9
	.dh	0x16	:: .dh	0xF15A
			:: .dw	@@fight9-(.-4)
	// Check if beat fight 10
	.dh	0x16	:: .dh	0xF15B
			:: .dw	@@fight10-(.-4)
	// Check if beat fight 11
	.dh	0x16	:: .dh	0xF15C
			:: .dw	@@fight11-(.-4)
	// Check if beat fight 12
	.dh	0x16	:: .dh	0xF15D
			:: .dw	@@fight12-(.-4)
	// Check if beat fight 13
	.dh	0x16	:: .dh	0xF15E
			:: .dw	@@fight13-(.-4)
	// Check if beat fight 14
	.dh	0x16	:: .dh	0xF15F
			:: .dw	@@fight14-(.-4)
@@fight1:
	// Start fixed fight
	.dw	0x49	:: .dw	0x91
	// Set flag
	.dh	0x21	:: .dh	0xF152
	// End script
	.dw	0x04
@@fight2:
	// Start fixed fight
	.dw	0x49	:: .dw	0x92
	// Set flag
	.dh	0x21	:: .dh	0xF153
	// End script
	.dw	0x04
@@fight3:
	// Start fixed fight
	.dw	0x49	:: .dw	0x93
	// Set flag
	.dh	0x21	:: .dh	0xF154
	// End script
	.dw	0x04
@@fight4:
	// Start fixed fight
	.dw	0x49	:: .dw	0x94
	// Set flag
	.dh	0x21	:: .dh	0xF155
	// End script
	.dw	0x04
@@fight5:
	// Start fixed fight
	.dw	0x49	:: .dw	0x95
	// Set flag
	.dh	0x21	:: .dh	0xF156
	// End script
	.dw	0x04
@@fight6:
	// Start fixed fight
	.dw	0x49	:: .dw	0x96
	// Set flag
	.dh	0x21	:: .dh	0xF157
	// End script
	.dw	0x04
@@fight7:
	// Start fixed fight
	.dw	0x49	:: .dw	0x97
	// Set flag
	.dh	0x21	:: .dh	0xF158
	// End script
	.dw	0x04
@@fight8:
	// Start fixed fight
	.dw	0x49	:: .dw	0x98
	// Set flag
	.dh	0x21	:: .dh	0xF159
	// End script
	.dw	0x04
@@fight9:
	// Start fixed fight
	.dw	0x49	:: .dw	0x99
	// Set flag
	.dh	0x21	:: .dh	0xF15A
	// End script
	.dw	0x04
@@fight10:
	// Start fixed fight
	.dw	0x49	:: .dw	0x9A
	// Set flag
	.dh	0x21	:: .dh	0xF15B
	// End script
	.dw	0x04
@@fight11:
	// Start fixed fight
	.dw	0x49	:: .dw	0x9B
	// Set flag
	.dh	0x21	:: .dh	0xF15C
	// End script
	.dw	0x04
@@fight12:
	// Start fixed fight
	.dw	0x49	:: .dw	0x9C
	// Set flag
	.dh	0x21	:: .dh	0xF15D
	// End script
	.dw	0x04
@@fight13:
	// Start fixed fight
	.dw	0x49	:: .dw	0x9D
	// Set flag
	.dh	0x21	:: .dh	0xF15E
	// End script
	.dw	0x04
@@fight14:
	// Start fixed fight
	.dw	0x49	:: .dw	0x9E
	// Set flag
	.dh	0x21	:: .dh	0xF15F
	// End script
	.dw	0x04

@@startDragonEX:
	// Dragon EX battle starter
	// Clear flag "boss tile inactive"
	.dh	0x22	:: .dh	0xBD
	// Check flag "Satellite Admin EX battle started"
	.dh	0x16	:: .dh	0xBB
			:: .dw	@@startAdminPreBattle-(.-4)
	// Start battle Dragon Sky EX
	.dw	0x49	:: .dw	0x57

@@startAdminPreBattle:
	// Admin pre-battle cutscene starter
	// Check Admin pre-battle cutscene active
	.dh	0x16	:: .dh	0x906
			:: .dw	@@end-(.-4)
	// Jump based on Satellite
	.dw	0xA8	:: .dw	@@pegasus-(.-4)
			:: .dw	@@leo-(.-8)
			:: .dw	@@dragon-(.-12)
@@pegasus:
	// Check not beat Pegasus Magic
	.dh	0x15	:: .dh	0xF108
			:: .dw	@@disableCutscene-(.-4)
	// Unset pre-battle finished and post-battle active + finished
	.dh	0x5B	:: .dh	0x907	:: .dw	0x3
	// Check if on map block
	.dw	0x1C	:: .dw	0x10
			:: .dw	@@end-(.-4)
	// Start cutscene
	.dw	0x4C	:: .dw	0x11E, 0x0
	// Jump to end
	.dw	0x13	:: .dw	@@end-(.-4)
@@leo:
	// Check not beat Leo Kingdom
	.dh	0x15	:: .dh	0xF10A
			:: .dw	@@disableCutscene-(.-4)
	// Unset pre-battle finished and post-battle active + finished
	.dh	0x5B	:: .dh	0x907	:: .dw	0x3
	// Check if on map block
	.dw	0x1C	:: .dw	0x10
			:: .dw	@@end-(.-4)
	// Start cutscene
	.dw	0x4C	:: .dw	0x11F, 0x0
	// Jump to end
	.dw	0x13	:: .dw	@@end-(.-4)
@@dragon:
	// Check not beat Dragon Sky
	.dh	0x15	:: .dh	0xF10C
			:: .dw	@@disableCutscene-(.-4)
	// Unset pre-battle finished and post-battle active + finished
	.dh	0x5B	:: .dh	0x907	:: .dw	0x3
	// Check if on map block
	.dw	0x1C	:: .dw	0x10
			:: .dw	@@end-(.-4)
	// Start cutscene
	.dw	0x4C	:: .dw	0x120, 0x0
	// Jump to end
	.dw	0x13	:: .dw	@@end-(.-4)
@@disableCutscene:
	// Set pre-battle finished and post-battle active + finished
	.dh	0x5A	:: .dh	0x907	:: .dw	0x3
//	// Jump to end
//	.dw	0x13	:: .dw	@@end-(.-4)
@@end:
	// End script
	.dw	0x04


.align 2
@lockPlayer:
	push	r14
	bl	0x2189424
	mov	r0,0x0
	pop	r15


.align 2
@setPostTimeTrialPosition:
	push	r4,r14

	// Get current Time Trial
	mov	r0,((0xF2F8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = time trial idx

	// Get position data
	lsl	r0,r0,0x3	// r3 = time trial idx * 8
	add	r4,=@postTimeTrialPositions
	add	r4,r4,r0

	// Set position
	ldrh	r0,[r4]
	ldrh	r1,[r4,0x2]
	ldrh	r2,[r4,0x4]
	lsl	r0,r0,0x10
	lsl	r1,r1,0x10
	lsl	r2,r2,0x10
	asr	r0,r0,0x4
	asr	r1,r1,0x4
	asr	r2,r2,0x4

	push	r0-r2
	ldr	r0,=0x21ACA08
	ldr	r0,[r0]
	mov	r1,sp
	bl	0x21713CC
	add	sp,0xC

	// Set direction
	ldr	r0,=0x21ACA08
	ldr	r0,[r0]
	ldrb	r1,[r4,0x6]
	bl	0x2171468

	// Set animation
	ldr	r0,=0x21ACA08
	ldr	r0,[r0]
	ldrb	r1,[r4,0x6]
	bl	0x2171418

	mov	r0,0x0
	pop	r4,r15

	.pool


.align 4
@postTimeTrialPositions:
	.dh	0xFF80 - 0x10,	0xFFEA,		0x0000,		0x1	// Taurus Fire
	.dh	0xFF5E,		0xFFC8 + 0x10,	0x0000,		0x7	// Cygnus Wing
	.dh	0xFF80 - 0x10,	0xFF6A,		0x0000,		0x1	// Harp Note
	.dh	0xFF5E,		0xFF10 - 0x10,	0x0000,		0x3	// Libra Scales
	.dh	0xFF5E,		0xFEC6 + 0x10,	0x0000,		0x7	// Queen Ophiuca
	.dh	0x0020 - 0x10,	0xFEEA,		0x0000,		0x1	// Gemini Spark
	.dh	0x0020 - 0x10,	0xFE4A,		0x0000,		0x1	// Cancer Bubble
	.dh	0x009E,		0xFECA + 0x10,	0x0000,		0x7	// Wolf Woods
	.dh	0x007E,		0xFE26 + 0x10,	0x0000,		0x7	// Crown Thunder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder
	.dh	0x0000,		0x0000,		0x0000,		0x0	// Placeholder


.align 4
overlay_0179_sinit_init:
	.dw	0
overlay_0179_sinit_init_end:
	.aligna	32

.endarea
.close


.nds
.open TEMP+"/y9.bin",0

.org 179 * 0x20
	.skip	16
	.dw	overlay_0179_sinit_init
	.dw	overlay_0179_sinit_init_end
	.skip	8

.close