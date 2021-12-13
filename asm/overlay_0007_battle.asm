// Overlay 7 - Battle

.nds
.open TEMP+"/overlay_0007.bin",readu32(TEMP+"/y9.bin", 7 * 0x20 + 0x4)
.thumb


// Two music slots
.if OPT_RESUME_MUSIC
// Use BGM slot 1 for battle
.org 0x2150148
	mov	r2,0x1
.org 0x2150A98
	mov	r2,0x1
.org 0x2150AB0
	mov	r2,0x1
.org 0x2150ACE
	mov	r2,0x1
.org 0x2150AEA
	mov	r2,0x1
.org 0x2150CDC
	mov	r2,0x1
.org 0x2150CF8
	mov	r2,0x1

.org 0x215013E
	ldr	r0,[0x21501C8]
	bl	battle_unloadOverworldBgm

.org 0x2150E02
	bl	battle_stopBattleBgm

.org 0x2150EBC
	ldr	r0,[0x2150F24]
	bl	battle_unloadBattleBgm
// End two music slots
.endif


.org 0x217F52C	// Buster overcharge enable
.area 0xE,0x00
	ldr	r0,[0x217F5D4]	// 0x21AF018
	bl	battle_overChargeEnable
	bhi	0x217F53A
	ldrh	r1,[r0,r3]
	add	r1,0x1
	strh	r1,[r0,r3]
.endarea

.org 0x2157374	// Buster overcharge model update
.area 0x74,0x00
	push	r14
	bl	battle_overChargeModel
	pop	r15
.endarea


.org 0x2180080	// Clip charge when card used
	bl	battle_overChargeUseCard


.org 0x215CD12	// Wolf Woods command code init
	str	r0,[r4,0x1C]	// clear all 4 bytes
.org 0x215CD80
	bl	battle_wolfWoodsCommandCheck
.org 0x215CD8C
	bl	battle_wolfWoodsCommandTransform
.org 0x215CDD2
	bl	battle_wolfWoodsCommandTransformEnd

.org 0x215D25A	// Wolf Woods card spawn first slash
	push	r0
	add	r1,sp,0x8
	mov	r2,0x1
	bl	0x2183564
	bl	battle_wolfWoodsCommandSlash1
.org 0x215D2DC	// Wolf Woods card spawn second slash
	bl	battle_wolfWoodsCommandSlash2


.org 0x219FED0	// Fix JunkCube random position
	.db	(2), (3)	// left
	.db	(1), (3)	// middle
	.db	(1), (2)	// right


// Name stretch effect
// SF1:
// - appear: start at 6.25%, add 12.5% every frame, end on 93.75% then go to 100%
// - wait 30 frames
// - disappear: start at 100%, sub 12.5% every frame, end on 6.25% then go to 0%
// SF2:
// - appear: start at 6.25%, add 25% every frame, end on 125% then go to 100%
// - disappear: start at 125%, sub 25% every frame, end on 0%
// SF3:
// - appear: start at 60%, add 20% every frame, end on 120% then go to 100%
// - wait 20 frames for card, 40 frames for battle start
// - disappear: start at 140%, sub 20% every frame, end on 60% then go to 0%
// DX:
// - appear: start at 40%, add 20% every frame, end on 120% then go to 100%
// - disappear: start at 140%, sub 20% every frame, end on 20%
.org 0x219530A
	bl	battle_nameStretchAppearStart
.org 0x2195D60
	push	r14
	mov	r1,0xF0
	ldr	r2,[r0,r1]
.org 0x2195D66
	bl	battle_nameStretchAppearAdd
.org 0x2195D78
	bl	battle_nameStretchAppearEnd
.org 0x2195D94
	pop	r15
.org 0x2195D98
	push	r14
	mov	r1,0xDE
	ldrb	r1,[r0,r1]
.org 0x2195DBA
	bl	battle_nameStretchWait
.org 0x2195DCA
	bl	battle_nameStretchWaitEnd
	pop	r15
.org 0x2195DD0
	push	r14
	mov	r1,0xF0
	ldr	r1,[r0,r1]
	bl	battle_nameStretchDisappearSub
	nop
.org 0x2195E00
	pop	r15

// All dimming card text at top of screen (MMSF3)
.org 0x21A3928+0x1
	.db	(32)	// from 90

// Match turn counter
.org 0x215036C
	bl	battle_matchTurnCounter
.org 0x2196A30	// Dummy out the original FINAL TURN
.area 0x60,0x00
	bx	r14
.endarea

.org 0x219051C
	bl	battle_checkFinalTurnSub1
.org 0x21539F4
	bl	battle_checkFinalTurn

// Battle message scroll
.org 0x2195566
	bl	battle_counterScrollIn
//.org 0x2195714
//	bl	battle_counterScrollIn
.org 0x2195E2A
	bl	battle_counterScrollWait
.org 0x2196B44
	bl	battle_counterScrollHideVS

// Counter hit message: "GOT <card>!"
.org 0x2195594
.area 0x1A4,0x00
	push	r4-r7,r14
	sub	sp,0x18
	mov	r4,r0		// this
	mov	r5,r1		// card
	mov	r6,0x0		// length

	mov	r0,(0x114 >> 0x2)
	lsl	r0,r0,0x2
	add	r4,r4,r0

	// Copy palette to VRAM
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,0x3
	ldr	r3,=0x20CB364
	bl	0x202F170	// VRAM_CopyPaletteBG

	// Alloc tile buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	ldr	r2,=0x480
	bl	0x20155DC	// heap alloc
	mov	r7,r0		// buffer
	beq	@@end

	// Render "GOT "
	ldr	r0,=0x480
	str	r0,[sp]
	mov	r0,0x0
	str	r0,[sp,0x4]
	ldr	r0,=((29 << 0x10) | (6))
	mov	r1,0x6
	mov	r2,0x2
	mov	r3,r7
	bl	0x20088EC	// render text, returns length
	add	r6,r6,r0

	// Render card name
	ldr	r0,=0x480
	lsl	r1,r6,0x6
	sub	r0,r0,r1
	str	r0,[sp]
	mov	r0,0x0
	str	r0,[sp,0x4]
	cmp	r5,0xFF
	bge	@@cardB

@@cardA:
	bl	0x2009688	// r0 = cards A
	mov	r1,r5
	b	@@renderCardName
@@cardB:
	bl	0x200969C	// r0 = cards B
	sub	r1,r5,0x1
	sub	r1,0xFF
//	b	@@renderCardName
@@renderCardName:
	mov	r2,0x2
	lsl	r3,r6,0x6
	add	r3,r7,r3
	bl	0x2008804	// render text, returns length
	add	r6,r6,r0

	// Render "!"
	mov	r0,0x0
	str	r0,[sp]
	add	r0,=@@exclamationScript
	mov	r1,0x2
	ldr	r3,=0x480
	lsl	r2,r6,0x6
	sub	r3,r3,r2
	add	r2,r7,r2
	bl	0x20089AC	// render text, returns length
	add	r6,r6,r0

	// Copy to VRAM
	lsl	r0,r6,0x6
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	ldr	r2,=0x740
	mov	r3,r7
	bl	0x202EF0C	// VRAM_CopyTileBG3

	// Free tile buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r7
	bl	0x2015620	// heap free

	// Build tilemap
	mov	r0,0x0		// i
@@loop:
	lsl	r1,r0,0x1	// i*2
	add	r2,r1,0x1	// i*2 + 1
	lsl	r3,r6,0x1	// len*2
	add	r3,r1,r3	// i*2 + len*2
	strh	r1,[r4,r1]
	strh	r2,[r4,r3]
@@next:
	add	r0,0x1
	cmp	r0,r6
	blt	@@loop

	// Draw tilemap
	mov	r0,0x3A
	str	r0,[sp]
	mov	r0,0x3
	str	r0,[sp,0x4]
	add	r0,(0x100 - 0x3)
	lsl	r1,r6,0x3
	sub	r0,r0,r1
	asr	r0,r0,0x4
	str	r0,[sp,0x8]
	mov	r0,0x1
	str	r0,[sp,0xC]
	str	r6,[sp,0x10]
	mov	r0,0x2
	str	r0,[sp,0x14]
	ldr	r0,=0x210F350
	mov	r1,0x0
	mov	r2,0x3
	mov	r3,r4
//	bl	0x200B748
	bl	battle_counterScrollIn

@@end:
	add	sp,0x18
	pop	r4-r7,r15

	.pool

.align 4
@@exclamationScript:
	.db	0x01,0xE6,0x00	// "!"
.endarea


// Fix Migratory Birds pause glitch
.org 0x21841FA
	bl	battle_migratoryBirdsSetInitialPosition


.org 0x2158D52	// Retain invisible on Star Force
.area 0x1A,0x00
	// Player
	b	0x2158D6C
.endarea
.org 0x2158D96
.area 0x1A,0x00
	// Opponent
	b	0x2158DB0
.endarea
.org 0x217E03E
.area 0x6,0x00
	b	0x217E044
.endarea


// DX bosses
.org 0x2195490
	bl	battle_printMegaManName
.org 0x2195496
	bl	battle_printBossNameDX
.org 0x21A26F0	// Migratory Birds speed
	.dh	9, 16, 17, 20, 17, 17
.org 0x21841D0
	bl	battle_dxTextureCygnusBird
.org 0x2184B04
	bl	battle_dxModelCygnusFeather
.org 0x218573C
	bl	battle_dxModelHarpNoteSpeaker
.org 0x21A27E0	// Harp Note speaker HP
	.dh	10, 20, 30, 100, 30, 30
.org 0x21A27F8	// Shock Note speed
	.dw	21, 24, 34, 40, 30, 30
.org 0x215C9E2
	bl	battle_dxModelWolfClaws
.org 0x218B11C
	bl	battle_dxWideClaw
.org 0x215E5FE
	bl	battle_dxTextureSubObject


.org 0x2197724
	bl	battle_beatDXBoss_scriptStart
.org 0x21976FA
	bl	battle_beatDXBoss_scriptWait


.org 0x2174EE8
	bl	battle_enemyDeleted


// Geo Color Mega Man
.org 0x21745FE
	bl	battle_loadModelSwap1
.org 0x2174636
	bl	battle_loadModelSwap2


// Extra battlefields
.org 0x2190060
.area 0x10,0x00
	push	r14
	ldr	r2,=0x21A2D38
	bl	battle_extraBattleFields
	add	r0,r2,r1
	pop	r15
	.pool
.endarea


.org 0x217F7F0
	bl	battle_grassHeal


.org 0x21756D8
	bl	battle_capMegaManHP


.org 0x2195224
.area 0x8
	push	r14
	bl	battle_timeTrialGaugeSpeed
	pop	r15
.endarea


// Also apply paralysis effect VFX to child objects (e.g. Pegasus wings)
.org 0x2181216
.area 0xE,0x00
	mov	r0,r4
	mov	r1,0x2
	bl	battle_applyModelEffect
	b	0x2181224
.endarea


// Also apply invulnerable effect VFX to child objects
.org 0x2175444
	mov	r0,r4
	mov	r1,0x1
	bl	battle_applyModelEffect
.org 0x217544E
	mov	r0,r4
	mov	r1,0x1
	bl	battle_clearModelEffect
.org 0x217FB4E
.area 0xE,0x00
	mov	r0,r4
	mov	r1,0x23
	bl	battle_clearModelEffect
	pop	r4,r15
.endarea
.org 0x217FDD8
.area 0xE,0x00
	mov	r0,r5
	mov	r1,0x23
	bl	battle_clearModelEffect
	b	0x217FDE6
.endarea

// Also apply Gravity effect VFX to child objects
.org 0x217546A
.area 0xE,0x00
	mov	r0,r4
	mov	r1,0x20
	bl	battle_applyModelEffect
	pop	r4,r15
.endarea
.org 0x2175478
.area 0xC,0x00
	mov	r0,r4
	mov	r1,0x23
	bl	battle_clearModelEffect
	pop	r4,r15
.endarea


// Remove Float Shoes immunity to Gravity
.org 0x217ED6C
.area 0xA,0x00
	b	0x217ED80
.endarea


// Remove Whistle immunity to Paralyze
.org 0x217E162
.area 0x6,0x00
	b	0x217E168
.endarea


.org 0x217A15C
	bl	battle_fixBestComboStatusGuard


.org 0x214FDC0
	bl	battle_onEnter
.org 0x2150E3E
	bl	battle_onExit


.org 0x217F490
	.dw	common_spBossRecordFlags


.org 0x21804A6
	bl	battle_jammerMultiDelete

.org 0x21804AE
	bl	battle_dragonDeleteAnimation


.org 0x2157A88
	bl	battle_cardSummonGauge

.org 0x21751DE	// Global timer for invisible
.area 0x12
	// Use global timer and don't check pause state
	mov	r2,0x1
	ldr	r1,=0x212E428
	ldr	r1,[r1]
	tst	r1,r2
	beq	0x21751F0	// swap even/odd frames so invis doesn't overlap with green invuln
	bl	battle_invisStarForce
	.pool
.endarea


// Remove virus gone from field for 1 frame during movement
.org 0x2180CC8
.area 0xCC,0x0
	// Next parent state
	mov	r0,0x1
	strb	r0,[r4,0x1D]
	// Clear state variables
	mov	r0,0x0
	strh	r0,[r4,0x1E]

	// Skip scaling/hiding
	mov	r0,(0x150 >> 0x2)
	b	0x2180D94
.endarea
.org 0x2180D94
	lsl	r0,r0,0x2

// PrivateMop movement
.org 0x216CD34
	// Skip unhide object
	.dh	(0x216CF62 - 0x216CD26 - 0x2)
.org 0x216CF0A
.area 0x12,0x00
	// Don't hide object
	b	0x216CF1C
.endarea
.org 0x216CF20
	mov	r3,r4
.org 0x216CF28
	add	r3,0x90
.org 0x216CF2E
	// Change panels immediately
	nop
.org 0x216CF50
.area 0x12,0x00
	// Don't unhide object
	// Wait 1 frame here
	pop	r4,r15
.endarea

// McCleaver movement
.org 0x216DF56
.area 0x12,0x00
	// Set next animation early
	mov	r0,0x81
	mov	r1,0x31
	strb	r0,[r4,r1]

	// Skip hide
	b	0x216DF68
.endarea


// Add Hollow panel
.org 0x218FC98
	.dw	battle_panelFlags
.org 0x218FCA0
	.dw	battle_panelGraphics
.org 0x218FE4C
	.dw	battle_panelGraphics
.org 0x2190058
	.dw	battle_panelGraphics
.org 0x218FCA4
	.dw	battle_panelAnimations
.org 0x218FE50
	.dw	battle_panelAnimations
.org 0x219005C
	.dw	battle_panelAnimations


// Extra enemies
.org 0x2153E38
	bl	battle_getBossDimensions


// Extra camera intros
.org 0x21515CA
	bl	battle_startCameraIntro

// Animate Mega Man during camera intros
.org 0x219045C
	bl	battle_openCustomScreenUpdateMegaMan
.org 0x21801BE
	bl	battle_animateMegaManDuringCameraIntro


// Make Grabity take 1/4th damage from non-sword attacks
.org 0x21545E0
	b	0x21545F0
//.org 0x215463A
//	bl	battle_grabityDamage
.org 0x21546AE
	bl	battle_grabityDamage
.org 0x219F718
	.dw	0x350024

// Make Grabity's Black Hole not counter hit you
.org 0x21547F8
	bl	battle_blackHoleCounterHit

// Disable Counter Hit when Shield Counter is active
.org 0x2154812
	bl	battle_counterHitShieldCounter

// Don't show Battle Card icon when you get Counter Hit on Legend Mode
.org 0x2154834
	bl	battle_counterHitBonusCardCheck

// Also show COUNTER HIT! when you get countered
.org 0x215484C	// Normal
	bl	battle_counterHitAlignNormal
.org 0x2154896
	bl	battle_counterHitAlignBonus
/*.org 0x2154890	// Bonus Card
.area 0x18,0x00
	ldr	r0,[0x2154984]	// 0x21B01D0
	mov	r3,0x0
	mov	r1,0x3		// COUNTER HIT!
	mov	r2,0x1
	str	r3,[sp]
	bl	0x21953EC	// start pop-up message

	ldr	r0,[0x2154980]	// 0x21ACC6C
	ldrb	r1,[r5,0xA]
	ldrb	r0,[r0,0x10]
	cmp	r1,r0
	bne	0x21548B2
.endarea*/


// Apply Holy Panel damage reduction to base damage
.org 0x21546DE
	bl	battle_holyPanelUpdateBaseDamage
// Remove weakness check on Freeze Break
.org 0x2154B62
	mov	r0,0x1
// Disable element multiplier on Barrier/Aura
.org 0x2154718
	mov	r1,r0
.org 0x2154728
	mov	r1,r0


// Record Grass panels in Best Combo
.org 0x2154AA4
	bl	battle_burnGrassPanel
.org 0x21545B6
	bl	battle_startCollision
.org 0x21548D4
	bl	battle_reloadOriginalBaseDamage
.org 0x2154970
	bl	battle_endCollision


// Legend Mode
.org 0x2152386	// Increase enemy HP
	bl	battle_legendModeHP


.org 0x21546EC	// Increase enemy damage
	bl	battle_legendModeDamage


//.org 0x218116C	// Break out of aback more quickly
//	bl	battle_legendModeExitStatusAback
//.org 0x218161A	// Break out of whistle more quickly
//	bl	battle_legendModeExitStatusAback
.org 0x21812F4	// Break out of stun more quickly
	bl	battle_legendModeExitStatusStun
.org 0x2181980
	bl	battle_legendModeExitStatusStun
.org 0x2181B74
	bl	battle_legendModeExitStatusStun


// Always play stunned animation on status (ignore Super Armor)
.org 0x21811D6	// paralysis start
.area 0x2A,0x00
	ldrh	r0,[r4,0x36]
	bl	battle_shouldRecoilOnParalyze
	cmp	r0,0x0
	bne	@@recoilAnimation

@@normal:
	mov	r1,0x2
	bl	battle_dragonDeleteAnimation
	b	@@end

@@recoilAnimation:
	mov	r0,0x2
@@setAnimation:
	mov	r1,0x31
	strb	r0,[r4,r1]
@@end:
	b	0x2181200
.endarea
.org 0x218129A	// paralysis end
	bl	battle_paralysisEnd
.org 0x21819DE	// bubble start
.area 0x2C,0x00
	mov	r1,0x2
	bl	battle_dragonDeleteAnimation
	b	0x2181A0A
.endarea
.org 0x2181AF6	// bubble end
.area 0x18,0x00
	ldrh	r0,[r4,0x36]
	bl	battle_shouldRecoilOnParalyze
	bne	@@end
	// Set animation finished
	mov	r3,(0x12C >> 0x2)
	lsl	r3,r3,0x2
	mov	r0,0x1
	str	r0,[r4,r3]

	bl	battle_bubbleEnd
@@end:
	b	0x2181B0E
.endarea
.org 0x2181864	// freeze start
.area 0x2C,0x00
	mov	r1,0x2
	bl	battle_dragonDeleteAnimation
	b	0x2181890
.endarea
.org 0x2181916	// freeze end
.area 0x18,0x00
	ldrh	r0,[r4,0x36]
	bl	battle_shouldRecoilOnParalyze
	bne	@@end
	// Set animation finished
	mov	r3,(0x12C >> 0x2)
	lsl	r3,r3,0x2
	mov	r0,0x1
	str	r0,[r4,r3]

	// Does not do recover animation
	mov	r0,r4
	bl	0x218197A	// call next state immediately
@@end:
	b	0x218192E
.endarea


.org 0x217DEB8	// Prevent status chaining on bosses
	bl	battle_legendModeStatusChain
.area 0x8,0x00
	b	0x217DEC4
.endarea


.org 0x217F760	// Apply Counter Hit paralysis to status immune bosses
	mov	r2,0x94
	bl	battle_counterParalyzeNoParalyze
.org 0x217F774
	mov	r2,0x98
	bl	battle_counterParalyzeNoBubble


.org 0x21504D0	// Prevent RNG reseed at start of turn
	bl	battle_legendModeRNG


.org 0x2181B90	// Remove snapback when certain enemy attacks interrupted
	bl	battle_removeSnapback
.org 0x217DFF6
	bl	battle_preserveLastStateOnInterrupt1
.org 0x217E660
	bl	battle_preserveLastStateOnInterrupt2


// Remove all status on Star Force
.org 0x217E016
	bl	battle_starForceRemoveStatus


// Mettenna
.org 0x21637EE
	bl	battle_lmMettennaStartLag
.org 0x216393E
	bl	battle_lmMettennaAttackPostLag
.org 0x21638E6
	bl	battle_lmMettennaMovePostLag
.org 0x2163962
	bl	battle_lmMettennaAttackSpeed
.org 0x2163976
	bl	battle_lmMettennaAttackLength
.org 0x216398C
	// Mettenna V1 shields
	//b	0x2163994
.org 0x2163A38
	bl	battle_lmMettennaAttackPreLag

// CannonBase
.org 0x216419A
	bl	battle_lmCannonBaseTurnSpeed
.org 0x21641B4
	bl	battle_lmCannonBaseTurnSpeed
.org 0x2163FBE
	bl	battle_lmCannonBaseAttackPostLag
.org 0x2163FAC
	bl	battle_lmCannonBaseAimTime
.org 0x2164226
	bl	battle_lmCannonBaseAttackPreLag
.org 0x216417E
	bl	battle_lmCannonBaseCounterWindow

// Crowcar
.org 0x2164746
	bl	battle_lmCrowcarInitialSpeed
.org 0x2164B6A
	bl	battle_lmCrowcarMoveCount
.org 0x21647CE
	bl	battle_lmCrowcarMovePostLag
.org 0x2164768
	bl	battle_lmCrowcarAttackPostLag

// Peekaboo
.org 0x2164F8E
	bl	battle_lmPeekabooMoveSpeed
.org 0x2165378
	bl	battle_lmPeekabooMoveCount
.org 0x2165112
	bl	battle_lmPeekabooAttackPreLag
.org 0x216517C
	bl	battle_lmPeekabooAttackPostLag

// HotRoader
.org 0x216580E
	bl	battle_lmHotRoaderMoveLength
.org 0x21658DC
	bl	battle_lmHotRoaderMoveSpeed

// Wibbledee
.org 0x2166292
	bl	battle_lmWibbledeeMoveLag1
.org 0x216618A
	bl	battle_lmWibbledeeMoveLag2
.org 0x2166382
	bl	battle_lmWibbledeeMoveCount

// MonoSword
.org 0x2166938
	bl	battle_lmMonoSwordAttackPreLag
.org 0x2166814
	bl	battle_lmMonoSwordAttackInterval
.org 0x21669DA
	bl	battle_lmMonoSwordAttackPostLag

// StreamCancro
.org 0x2167204
	bl	battle_lmStreamCancroAttackPreLag
.org 0x2167144
	bl	battle_lmStreamCancroAttackPostLag
.org 0x2167084
	bl	battle_lmStreamCancroAttackBubble

// LuPelvis
.org 0x2167816
	bl	battle_lmLuPelvisAttackLength
.org 0x21676D6
	bl	battle_lmLuPelvisMoveLag

// DoomCount
.org 0x2167F0E
	bl	battle_lmDoomCountMoveLag
//.org 0x2167F86
//	bl	battle_lmDoomCountMakeBombPreLag
.org 0x2168022
	bl	battle_lmDoomCountAttackPreLag
.org 0x2184E1E
	bl	battle_lmDoomCountPlacePreLag
.org 0x2184F04
	bl	battle_lmDoomCountBombTimer
.org 0x2184E1E
	bl	battle_lmDoomCountBombHP

// BoomBolt
.org 0x2168B38
	bl	battle_lmBoomBoltSpeed
.org 0x2168CCA
	bl	battle_lmBoomBoltRetreatDelay
.org 0x2168AB6
	push	r14
	bl	battle_lmBoomBoltAttackPreLag
.org 0x2168996
	bl	battle_lmBoomBoltAttackPostLag

// ZapAce
.org 0x2169328
	bl	battle_lmZapAceSpeed
.org 0x21693CA
	bl	battle_lmZapAceAttackPreLag
.org 0x216942A
	bl	battle_lmZapAceAttackPostLag

// BellGong
//.org 0x2169AC6
//	bl	battle_lmBellGongSpeed
//	ldr	r0,[0x2169BB0]
.org 0x2169CD6
	bl	battle_lmBellGongAttackPreLag
.org 0x2169D7E
	bl	battle_lmBellGongAttackPostLag
.org 0x2169C08
	bl	battle_lmBellGongGongPreLag

// GreatAx
.org 0x216A50C
	bl	battle_lmGreatAxMoveLag1
.org 0x216A2F8
	bl	battle_lmGreatAxMoveLag2
.org 0x216A452
	bl	battle_lmGreatAxAttackPostLag

// Jammer
.org 0x216AB9E
	bl	battle_lmJammerStartLag
.org 0x216AC46
	bl	battle_lmJammerMoveLag
.org 0x216B0BE
	mov	r0,0x34
	ldrb	r1,[r4,r0]
	ldr	r0,[0x216B264]
	bl	battle_lmJammerShootPreLag
.org 0x216B236
	mov	r0,0x34
	ldrb	r1,[r4,r0]
	ldr	r0,[0x216B274]
	bl	battle_lmJammerShootPostLag
.org 0x216B442
	mov	r0,0x34
	ldrb	r1,[r4,r0]
	ldr	r0,[0x216B5E8]
	bl	battle_lmJammerPunchPreLag
.org 0x216B58E
	bl	battle_lmJammerPunchPostLag

// Gooey
.org 0x216BCBC
	bl	battle_lmGooeyStartLag
.org 0x216BD70
	bl	battle_lmGooeyMoveSpeed
.org 0x216C1D4
	bl	battle_lmGooeyMoveCount
.org 0x216BE46
	bl	battle_lmGooeyMovePreLag
.org 0x216BEF8
	bl	battle_lmGooeyAttackPreLag
.org 0x216BF20
	mov	r0,0x34
	ldrb	r2,[r4,r0]
	ldr	r0,[0x216BF98]
	bl	battle_lmGooeyAttackPostLag

// RhinoHorn
.org 0x216C894
	bl	battle_lmCommonMoveCount
.org 0x216C4DC
	bl	battle_lmRhinoHornMoveLag1
.org 0x216C55A
	bl	battle_lmRhinoHornMoveLag2
.org 0x216C724
	bl	battle_lmRhinoHornAttackPostLag

// PrivateMop
.org 0x216CD84
	bl	battle_lmPrivateMopMoveSpeed
.org 0x216CE62
	bl	battle_lmPrivateMopAttackPreLag
.org 0x216CCEA
	bl	battle_lmPrivateMopAttackPostLag

// Fokx
.org 0x216D4BC
	bl	battle_lmFokxMoveLag
.org 0x216D6D0
	bl	battle_lmFokxAttackPreLag
.org 0x216D490
	bl	battle_lmFokxAttackPostLag
.org 0x216D728
	bl	battle_lmFokxCounterFrames

// McCleaver
.org 0x216E452
	bl	battle_lmMcCleaverAttack1PreLag
.org 0x216E4B0
	bl	battle_lmMcCleaverAttack2PreLag
.org 0x216DE80
	bl	battle_lmMcCleaverCheckHit
.org 0x218EE50
	bl	battle_lmMcCleaverHitFlags

// Craggy
.org 0x215FD6C
	bl	battle_lmCraggyAttack

// OctoNinja
.org 0x216EE90
	bl	battle_lmOctoNinjaJumpSpeed
.org 0x216EF3A
	bl	battle_lmOctoNinjaJumpLag
.org 0x216F0C6
	bl	battle_lmOctoNinjaAttackPostLag

// Eyez
.org 0x216FA82
	bl	battle_lmEyezMoveSpeed
.org 0x216FAA4
	mov	r0,0x1
	lsl	r0,r0,0x10
	bl	battle_lmEyezMoveCount
.org 0x216F6D8
	bl	battle_lmEyezAttackPreLag
.org 0x216F850
	bl	battle_lmEyezAttackPostLag

// Melamander
.org 0x216FEFC
	bl	battle_lmCommonStartLag
.org 0x216FF68
	bl	battle_lmMelamanderMoveLag
.org 0x216FF2E
	bl	battle_lmMelamanderAttackPreLag
.org 0x2170440
	bl	battle_lmMelamanderAttackSpeed1
.org 0x21700E2
	bl	battle_lmMelamanderAttackSpeed2
.org 0x217027E
	bl	battle_lmCommonMoveCount

// Lampis
.org 0x2170780
	bl	battle_lmCommonStartLag
.org 0x21707EA
	bl	battle_lmLampisMoveLag
.org 0x2170CFE
	bl	battle_lmLampisMoveCount
.org 0x2170F14
	bl	battle_lmLampisKickPreLag
.org 0x2170A78
	bl	battle_lmLampisKickLength
.org 0x2170AA6
	bl	battle_lmLampisKickPostLag
.org 0x2170D7E
	bl	battle_lmLampisFlashPreLag
.org 0x21708FA
	bl	battle_lmLampisFlashLength
.org 0x2170926
	bl	battle_lmLampisFlashPostLag

// Moaian
.org 0x2171828
	bl	battle_lmMoaianAttackSpeed1
.org 0x2171BBE
	bl	battle_lmMoaianAttackSpeed2
.org 0x21716C6
	bl	battle_lmMoaianAttackPostLag

// TropiConga
.org 0x21AA3D0+0x34
	.dw	battle_lmTropiCongaUpdate|1
.org 0x2171E68
	bl	battle_lmTropiCongaAnimInit
//.org 0x217213C
//	bl	battle_lmTropiCongaAnimReset
//.org 0x2171FFE
//	bl	battle_lmTropiCongaAnimStart
//.org 0x2172026
//	bl	battle_lmTropiCongaAttackPreLag

// Junk-O
.org 0x2172570
	bl	battle_lmJunkOMoveLag
.org 0x2172644
	bl	battle_lmJunkOAttackPreLag
.org 0x21726BC
	bl	battle_lmJunkOAttackPostLag
.org 0x2172D72
	bl	battle_lmJunkOTimeBombHP
.org 0x2172D78
	bl	battle_lmJunkOTimeBombTimer

// Magera
.org 0x21730E4
	bl	battle_lmCommonStartLag
.org 0x2173186
	bl	battle_lmMageraMoveLag
.org 0x21731F8
	bl	battle_lmMageraSupportChargeLength
.org 0x217333E
	bl	battle_lmMageraAttackChargeLength
.org 0x21732D0
	bl	battle_lmMageraSupportPostLag
.org 0x2173448
	bl	battle_lmMageraAttackPostLag

// Grabity
.org 0x2173CC8
	bl	battle_lmCommonStartLag
.org 0x2173E02
	bl	battle_lmGrabitySuckPreLag
.org 0x2173D10
	bl	battle_lmGrabitySuckPostLag
.org 0x2173F76
	bl	battle_lmGrabityShootPreLag
.org 0x2173D32
	bl	battle_lmGrabityShootPostLag

// Cygnus Feather hitscan
.org 0x2184D84
	.dw	battle_cygnusFeatherHitscanFunctions
.org 0x2184D76
	bl	battle_lmCygnusFeatherNoFlash
.org 0x2184D80
	bl	battle_lmCygnusFeatherConfuse
// Migratory Birds speed
.org 0x218430A
	mov	r1,0x34
	ldrb	r1,[r4,r1]
	lsl	r2,r1,0x1
	ldr	r1,[0x2184508]
	bl	battle_lmMigratoryBirdsSpeed1
.org 0x2184334
	mov	r0,0x34
	ldrb	r0,[r4,r0]
	lsl	r1,r0,0x1
	ldr	r0,[0x2184508]
	bl	battle_lmMigratoryBirdsSpeed2

// LuPelvis destructor
.org 0x21A9770 + 0x1C
	.dw	battle_luPelvisDestruct|1

.org 0x2185726
	bl	battle_lmShockNoteHP
.org 0x2185830
	bl	battle_lmShockNoteLag
.org 0x2185868
	bl	battle_lmShockNoteLinger
.org 0x2185AF8
	bl	battle_lmShockNoteSpeed
//.org 0x2185A32
//	bl	battle_lmShockNoteBreaking
//.org 0x2185E16
//	bl	battle_lmMachineGunStringsNotesBreaking

.org 0x218BDCE
	bl	battle_tidalWaveIcePanels

.org 0x2154AAE
	bl	battle_starRoadContactNoFreeze
//	bl	battle_starRoadContactFreeze

// Boss loading
.org 0x2152D70
	bl	battle_bossLoad

// Poison panel handler for certain entities (e.g. Queen Ophiuca)
.org 0x217FC98
	bl	battle_lmPoisonPanel

// Gemini Spark heal mechanic
.org 0x217DC60
	nop
.org 0x217DC8E
	bl	battle_geminiSparkHeal

// Hollow panels in Legend Mode
.org 0x218FBF4
	bl	battle_overwriteHollowPanel

.org 0x2154012
	bl	battle_addExtraHitType1

.org 0x215D2C4
	bl	battle_wolfWoodsUpperClawPierceInvis

.org 0x21AC0F4+0x10
	.dw	battle_frostMissilesRefreshShield|1
.org 0x218B816
	bl	battle_frostMissilesCheckHit
	cmp	r0,0x0
	beq	0x218B82C


// Humor Buster
.org 0x2176B7C
	bl	battle_humorBusterShot
.org 0x2176B88
	bl	battle_humorBusterCharge


.org 0x217E64A	// Can get Counter Hit by viruses in Legend Mode
	bl	battle_legendModeCounter


// Cut-in chains
.org 0x2162AD8	// Allow cut-in into cut-in
	nop
.org 0x2162B9A	// Destroy 3rd card in queue
	bl	battle_cutinProcess


.org 0x21ACAA0	// Adjust tutorial 1 for side select
	.dw	battle_tutorial1Script1
.org 0x2193758
	bl	battle_checkTutorial1CardSelect

.org 0x21939E2	// Adjust tutorial 2 for side select
	ble	0x21939EC	// Disallow HeatBall1 for 2nd card
.org 0x21939FE
.area 0xE
	cmp	r1,0x6
	beq	0x2193A1E
	cmp	r1,0x2		// Disallow HeatBall1 or GrassStage for 3rd card
	bge	0x2193A28
	b	0x2193A1E
.endarea


.org 0x2190704	// Enable both R and Y Buttons to show card description
	mov	r2,0x9


.org 0x21A307A	// Extra battle types
	.db	0xFF	// type 0x6: no tutorial

.org 0x217878A	// Disable Brother Cards in time trial
	bl	battle_disableBrotherCardsForTimeTrial
	beq	0x21787F4	// skip Brother cards
.org 0x2178858	// Disable Legend Card in time trial
	bl	battle_disableLegendCardForTimeTrial
	beq	0x21788AA

.org 0x2151994
	bl	battle_loadFolder

.org 0x219254C
	bl	battle_shuffleStarForceToTop
	ldr	r0,[0x219256C]
	ldr	r0,[r0]

.org 0x2150A86
	bl	battle_saveRecordAfterTimeTrial


.org 0x214F9DA	// Don't spawn random G viruses until Star Cards intro
	ldr	r1,[0x214FA70]	// 0x882
	bl	battle_spawnGVirus

.org 0x214F9EA	// Increase G virus chance
	mov	r1,0xE	// 1-in-14


.org 0x2197238	// Mark enemies as defeated
	bl	battle_markEnemiesDeletedCounteredNormal

.org 0x2154820	// Mark enemies as countered
	bl	battle_markEnemyCountered


// 5 digit Zenny counts
.org 0x21986CE
	lsl	r0,r0,0xC
	lsr	r0,r0,0xC
.org 0x21987D4
	add	r2,0xA
	mov	r4,0x4
.org 0x21987F8
	cmp	r1,0x5
.org 0x2198804
	mov	r0,0x12
.org 0x219880C
	mov	r4,0x5
	str	r4,[sp,0x10]
	mov	r0,0x2
	mov	r4,r7


.org 0x2198E6E
	bl	battle_dxBossReward

.org 0x2198BC8
	bl	battle_dxBossRewardZenny

.org 0x2198B32	// No HP rewards in Legend Mode
	bl	battle_hpRewards

.org 0x2151786	// Bonus Busting Level in Legend Mode
	bl	battle_lmBustingLevel

.org 0x21994F4	// Rewards for extra enemies
.area 0x28,0x00
	push	r14
	cmp	r0,0xFF
	bgt	@@boss

@@virus:
	ldr	r2,=0x21A48D0
	b	@@compute
@@boss:
	ldr	r2,=(0x21A3C78 - 0x100*0x28)
	bl	battle_extraEnemiesRewards

@@compute:
	mov	r1,0x28
	mul	r0,r1
	add	r0,r2,r0
	pop	r15

	.pool
.endarea
.org 0x2198AF0
	bl	battle_realWorldVirusReward

.org 0x219906A
	bl	battle_waveBattleRewardGetCardCount

.org 0x21975F8
	bl	battle_rewardImage

.org 0x219760A
	bl	battle_rewardName

.org 0x2197666	// Fix multi-reward results
	bl	battle_fixMultiReward
.org 0x219764C	// Fix both SFX playing
.area 0x14,0x00
	mov	r0,0x31
	ldrb	r0,[r4,r0]
	lsl	r0,r0,0x1
	add	r0,0x8
	ldrh	r1,[r4,r0]
	ldrb	r2,[r4]
	mov	r0,r4
	bl	battle_rewardGet
.endarea

.align 2
.org 0x2162A72
	bl	battle_showDamageForAdminGiga


// Adjust boss rewards
// Story boss: drop V1/EX card at 9-S
// Admin shadow: drop Zennys
.org 0x21A3C78 + 0x28 * 0x1	// Taurus Fire
	.dh	0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x04B5, 0x04B5
	.dh	0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x43E8, 0x04B5, 0x04B5
.org 0x21A3C78 + 0x28 * 0x2	// Taurus Fire EX
	.dh	0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B6,	0x04B6
	.dh	0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B5, 0x04B6,	0x04B6
.org 0x21A3C78 + 0x28 * 0x7	// Cygnus Wing
	.dh	0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x04B8, 0x04B8
	.dh	0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x47D0, 0x04B8, 0x04B8
.org 0x21A3C78 + 0x28 * 0x8	// Cygnus Wing EX
	.dh	0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B9,	0x04B9
	.dh	0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B8, 0x04B9,	0x04B9
.org 0x21A3C78 + 0x28 * 0xD	// Harp Note
	.dh	0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x04BB, 0x04BB
	.dh	0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x4BB8, 0x04BB, 0x04BB
.org 0x21A3C78 + 0x28 * 0xE	// Harp Note EX
	.dh	0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BC, 0x04BC
	.dh	0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BB, 0x04BC, 0x04BC
.org 0x21A3C78 + 0x28 * 0x13	// Libra Scales
	.dh	0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x04BE, 0x04BE
	.dh	0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x4FA0, 0x04BE, 0x04BE
.org 0x21A3C78 + 0x28 * 0x14	// Libra Scales EX
	.dh	0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BF, 0x04BF
	.dh	0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BE, 0x04BF, 0x04BF
.org 0x21A3C78 + 0x28 * 0x19	// Queen Ophiuca
	.dh	0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x04C1, 0x04C1
	.dh	0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x5388, 0x04C1, 0x04C1
.org 0x21A3C78 + 0x28 * 0x1A	// Queen Ophiuca EX
	.dh	0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C2, 0x04C2
	.dh	0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C1, 0x04C2, 0x04C2
.org 0x21A3C78 + 0x28 * 0x1F	// Gemini Spark B
	.dh	0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x04C4, 0x04C4
	.dh	0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x04C4, 0x04C4
.org 0x21A3C78 + 0x28 * 0x20	// Gemini Spark EX B
	.dh	0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C5,	0x04C5
	.dh	0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C5,	0x04C5
.org 0x21A3C78 + 0x28 * 0x22	// Gemini Spark W
	.dh	0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x04C4, 0x04C4
	.dh	0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x5770, 0x04C4, 0x04C4
.org 0x21A3C78 + 0x28 * 0x23	// Gemini Spark EX W
	.dh	0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C5,	0x04C5
	.dh	0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C4, 0x04C5,	0x04C5
.org 0x21A3C78 + 0x28 * 0x40	// Pegasus Shadow - 3500z
	.dh	0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC
	.dh	0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC, 0x4DAC
.org 0x21A3C78 + 0x28 * 0x46	// Leo Shadow - 6500z
	.dh	0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964
	.dh	0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964, 0x5964
.org 0x21A3C78 + 0x28 * 0x4C	// Dragon Shadow - 5500z
	.dh	0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C
	.dh	0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C, 0x557C


.org 0x217FE96	// Fix buster charge depleting when pressing B during a screen dim
	bl	battle_chargeShotDuringDim
.org 0x217FEE2	// Fix animation reset when holding D-pad at edge of field
	bl	battle_moveEdgeCheck
.org 0x217FE68	// Fix Charge Shot being eaten when moving and shooting at the same time
	mov	r1,0x0
	push	r1-r7,r14	// push extra for allocation
	mov	r4,r0
	ldr	r0,[0x2180090]
	ldr	r2,[r0,0x30]
	lsr	r1,r2,0x1
	bcc	0x217FE7E
.org 0x217FECC
	bl	battle_fixMoveChargeShot
.org 0x218008E
	pop	r1-r7,r14	// pop extra for allocation
.org 0x2180960
	bl	battle_fixMoveChargeShot2

.org 0x2151032
	bl	battle_quickStep1
.org 0x218091E
	bl	battle_quickStep2

.org 0x2154650
	bl	battle_leafShield

.org 0x217E5F8
	bl	battle_doubleBuster
.org 0x217E522
	bl	battle_doubleFlameBurner
.org 0x217E528
	bl	battle_flameBurnerOverChargedPower
.org 0x2178DBE
	bl	battle_flameBurnerOverChargedSize1
.org 0x2188AD8
	bl	battle_flameBurnerOverChargedSize2
.org 0x2178CA6
	bl	battle_flameBurnerOverChargedSFX
.org 0x2176B0E
	bl	battle_breakBuster
.org 0x2188982	// Make Flame Burner breaking
	mov	r2,0x4
.org 0x2188988
	mov	r3,0x2

// Reduce Flame Burner lag
.org 0x2178D5E
	mov	r0,(15)		// from 30
	bl	battle_flameBurnerDuration
.org 0x2178D9C
	mov	r0,(2)		// from 4
.org 0x2178DA0
	mov	r0,(15)		// from 30


// Remove Hollow's barrier on breaking hit
.org 0x215467A
	bl	battle_hollowBreak


// Remove 2x damage on weakness hit for Mega Man
.org 0x2154700
	bl	battle_removeWeaknessDamage


// Make Elemental Cyclone not cause flashing
.org 0x2179BCE
	mov	r1,0x1


// Extra hit effects
.org 0x21567E8
	.dw	battle_hitEffects+0xC
.org 0x21567F0
	.dw	battle_hitEffects
	.dw	battle_hitEffects+0x4
.org 0x215680C
	.dw	battle_hitEffects+0x8
.org 0x21566A2
	// 0xF, 0x10, 0x11, 0x12: element armor (use shield)
	bhi	0x215673E

.org 0x217E294
	ldr	r3,[r4,r0]
	cmp	r3,0x0
	beq	0x217E2C0
.org 0x217E29E
	ldr	r2,[0x217E378]	// = 0x10058
	tst	r2,r1
.org 0x217E2A4
	bl	battle_retaliate


.org 0x21548D6	// Add extra green invis status effect flag
	.skip	2 //	ldr	r1,[r4,0x2C]	// already done in battle_reloadOriginalBaseDamage
	bl	battle_getGreenInvisMask
.org 0x217515A
	ldr	r1,[r4,0x20]
	bl	battle_getGreenInvisMask
.org 0x217543C
	bl	battle_getGreenInvisMaskStarForce
.org 0x217DB14
	bl	battle_getGreenInvisMask
.org 0x217F882
	bl	battle_getGreenInvisMask2
.org 0x217F920
	ldr	r1,[r2,0x2C]
	bl	battle_getGreenInvisMask
.org 0x217EBD2	// Add timer for green invis
	bl	battle_greenInvisTimer

.org 0x217FBFA	// Mega Man updates model effects during Battle Start
.area 0x10,0x00
	mov	r0,r4
	bl	0x2175424	// Update model effects
	mov	r0,r4
	bl	0x2174E58
	cmp	r0,0x0
	beq	0x217FC24
.endarea


.org 0x217E63C	// Don't remove charge for most actions
	bl	battle_removeChargeOnAction
	tst	r0,r0
	beq	0x217E64A
.org 0x217F638	// Remove charge keeps charge counter
	nop
.org 0x217863C
	bl	battle_removeChargeOnBusterChange
.org 0x218002C	// Remove charge for lock-on
	bl	battle_removeChargeOnLockOn
.org 0x217F522	// Charge during AutoLock
	cmp	r0,0x1
	bne	0x217F528
.org 0x21765D4
	bl	battle_removeChargeOnMegaAttack
.org 0x217F4E4	// Fix SFX overlap
	ldrh	r1,[r0,r2]		// keep r0
	cmp	r4,r1
	bne	0x217F4F6 // 0x217F4F4
	ldr	r3,[0x217F5D8]		// keep r0
	bl	battle_keepChargeAvoidSFXOverlap

.org 0x217F4F4	// Buster overcharge SFX
	b	@@next
//0x217F4F6
	ldr	r3,[0x217F5D8]	// 0x21206CC
	bl	battle_overChargeSFX
@@next:
	bl	battle_overChargeSFXPost


// Always have Side Select
.org 0x21904A4
	mov	r1,0x1


.org 0x219167C
	bl	battle_customScreenBeforeSuper

.org 0x21917C6
	bl	battle_customScreenAfterSuper

.org 0x2193724
	bl	battle_customScreenChooseCard

.org 0x219181C
	bl	battle_customScreenDoStarForce

.org 0x2191938
	bl	battle_customScreenScanSuccess

.org 0x21924C4
	bl	battle_customScreenMarkCardAsFavorite

.org 0x2191B3C
	bl	battle_customScreenProcessCard

.org 0x2191FAC
	bl	battle_customScreenUpdateCardStates

.org 0x21943FE
	bl	battle_customScreenDrawLabel
.org 0x2194480
	.dw	0x120

.org 0x2194740
	push	r0,r3-r6,r14
.org 0x2194794
	bl	battle_customScreenShowStar

.org 0x219084A
	bl	battle_starCardDescription

.org 0x2191F00
	bl	battle_customScreenSelectUnselectCard

.org 0x2191FF4
	bl	battle_customScreenSelectUnselectCard


.org 0x21975EC
	bl	battle_rewardLoadStar
.org 0x21975BC
	bl	battle_rewardDrawStarOnCard1
.org 0x2197686
	bl	battle_rewardDrawStarOnCard2
.org 0x2198580
	bl	battle_rewardPrintStarCard



// Set card icons size
.org 0x2190944
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2190AC0
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2190B30
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2190BE4
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2190D94
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x219109C
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x219125C
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2191888
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2191AAC
	.dw	0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x2192D04
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5


.org 0x214F9F4	// Fix G virus check reading past end of list
.area 0x1C,0x00
	mov	r5,0x0
	mov	r2,0x0
	mov	r1,r4
	add	r1,0xE4
@@loop:
	ldrb	r0,[r1]
	cmp	r0,0x3
	beq	@@end
	cmp	r0,0x1
	bne	@@next
	add	r5,0x1
@@next:
	add	r2,0x1
	add	r1,0x6
	cmp	r2,0x8
	blt	@@loop
@@end:
.endarea


.org 0x218003C
	bl	battle_removeLockOnImmediately
.org 0x2158EAE
	bl	battle_changeFormRemoveAutoLock


// AutoLock
//.org 0x2176156
//	// Swap the function calls to evaluate lock-on before card action
//	// Note: adds 1 frame delay between lock on start and lock on
//	mov	r0,r4
//	bl	0x2175A68	// lock on
//	mov	r0,r4
//	bl	0x217FB30	// card action
.org 0x2180074	// Evaluate lock-on just-in-time for frame perfect attack
	bl	battle_autoLockUseCard
.org 0x217A536	// Remove auto-lock when you lose Pegasus
	bl	battle_deformRemoveAutoLock

.org 0x217FF8C
.area 0x1A,0x00
	mov	r2,0x1		// normal lock-on
	ldr	r0,[0x21800AC]

	// Check Star Force, part 1
	mov	r3,r4
	add	r3,0x30
	ldrb	r3,[r3]
	bl	battle_autoLock1

	lsr	r3,r3,0x1C
	beq	@@noLock

	cmp	r2,0x1
	beq	@@end

@@noLock:
	mov	r2,0x0		// no lock-on

@@store:
	strb	r2,[r0,r1]
@@end:
.endarea

.org 0x2175A96
	bl	battle_autoLock2

.org 0x2175A9C
	bl	battle_autoLock3
	nop

// Remove Mega Attack delay for Ice Pegasus
.org 0x21765FC	// Lag before
	bl	battle_megaAttackDelay1
.org 0x21766DA	// Lag before
	bl	battle_megaAttackDelay2
.org 0x21766F8	// Lag before
	bl	battle_megaAttackDelay3
.org 0x2176808	// Lag after
	bl	battle_megaAttackDelay4


.org 0x21916FC
	bl	battle_starForceWildcardOptions


.org 0x21910EC
.area 0x180
customScreenChooseBrother:
	push	r0,r3-r7,r14

	// Prep some common pointers
	ldr	r6,=0x6DC
	add	r6,r0,r6
	ldr	r7,=0x9B8
	add	r7,0x30
	add	r7,r0,r7

@@loadSubstate:
	// Load Brother index into r5
	ldrb	r5,[r7,0x2]
	sub	r5,0x10

	// Load substate
	ldrb	r4,[r6,0x3]
	cmp	r4,0x0
	bne	@@substate1

	// Check card is selectable
	ldrb	r1,[r7,0x4]
	mov	r2,0x24
	mul	r1,r2
	add	r1,0x2
	ldrb	r1,[r0,r1]
	cmp	r1,0x1
	beq	@@substate0

	// Play error SFX and cancel
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x69
	bl	0x2025574
	b	@@doCancel

@@substate0:
	// Store Brother index
	strb	r5,[r7,0x8]

	// Unset var_broStarForce if it matches this Brother index
	add	r2,=var_broStarForce
	ldr	r0,[r2]
	add	r1,r5,0x1
	cmp	r0,r1
	bne	@@doChecks

	mov	r0,0x0
	str	r0,[r2]

@@doChecks:
	// Get Brother type
	// r1 = r5+1h at this point
	bl	0x200D04C
	lsr	r0,r0,0xA	// test 0x200
	bcs	@@startRoulette

	// Check if in multiplayer battle
	bl	0x2153958
	cmp	r0,1h
	bne	@@isSinglePlayer

@@isMultiPlayer:
	// Check if this Brother Card is already selected for B. Combo
	ldrh	r0,[r7]
	ldrh	r1,[r7,0x2]
	cmp	r0,r1
	beq	@@startBestCombo
	// Check if B. Combo already used
	cmp	r0,0x0
	bne	@@startRoulette

	// Get Brother Best Combo data
	add	r1,r5,0x1
	bl	0x200CC70
	add	r0,0xD2
	ldrb	r0,[r0]
	cmp	r0,0xFF
	beq	@@startRoulette

	// Check if a Best Combo is already queued
	ldr	r4,[sp]
	bl	battle_haveQueuedBestCombo
	cmp	r0,0x0
	bne	@@startRoulette

	b	@@startBestCombo

@@isSinglePlayer:
	// Check if Brother is On Air?
	add	r1,r5,0x1
	bl	0x200CA9C
	cmp	r0,0x0
	bne	@@startRoulette

	// Get Brother Best Combo data
	add	r1,r5,0x1
	bl	0x200CC70
	add	r0,0xD2
	ldrb	r0,[r0]
	cmp	r0,0xFF
	beq	@@startRoulette

@@startBestCombo:
	// Check Brother Satellite
	add	r1,r5,0x1
	bl	0x200BDC8
	cmp	r0,0x4
	bgt	@@startBestComboNoStarForce

	mov	r4,(21)		// call script 21

	// Increment state
	mov	r0,0x1
	strb	r0,[r6,0x3]

	b	@@doScript

@@startBestComboNoStarForce:
	mov	r4,(23)		// call script 23

	// Increment state
	mov	r0,0x3
	strb	r0,[r6,0x3]

	b	@@doScript

@@startRoulette:
	// Check Star Force available
	bl	battle_checkStarForceAvailable
	beq	@@doRoulette

	mov	r4,(22)		// call script 22

	// Increment state
	mov	r0,0x2
	strb	r0,[r6,0x3]

//	b	@@doScript

@@doScript:
	// Start script in r4
	mov	r0,0x1
	ldr	r1,=0x17E0
	ldr	r2,=(0x5680 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F))
	mov	r3,0xE
	push	r0-r4		// Push extra register for allocation
	str	r3,[sp,0x10]

	mov	r0,0x1D		// mess.bin
	lsl	r0,r0,0x10
	add	r0,0x7		// mess_0007
	mov	r1,r4
	mov	r2,0x0
	mov	r3,0x1

	bl	0x2008754
	add	sp,0x14

	b	@@end

@@substate1:
	// Check if script finished
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

	// Get last choice
	bl	0x2008DC0

	cmp	r4,0x1
	beq	@@menu1
	cmp	r4,0x2
	beq	@@menu2
	cmp	r4,0x3
	beq	@@menu3
	b	@@doCancel

@@menu1:
	// Best Combo, Star Force, Roulette
	cmp	r0,0x0
	beq	@@doBestCombo
	cmp	r0,0x1
	beq	@@doStarForce
	cmp	r0,0x2
	beq	@@doRoulette
	b	@@doCancel

@@menu2:
	// Star Force, Roulette
	cmp	r0,0x0
	beq	@@doStarForce
	cmp	r0,0x1
	beq	@@doRoulette
	b	@@doCancel

@@menu3:
	// Best Combo, Roulette
	cmp	r0,0x0
	beq	@@doBestCombo
	cmp	r0,0x1
	beq	@@doRoulette

@@doCancel:
	// Change main state to Custom Screen idle
	mov	r0,0x3
	strb	r0,[r6,0x1]
	mov	r0,0x0
	b	@@doStateChange

@@doStarForce:
	// Check if a Star Force is already queued
	ldr	r4,[sp]
	bl	battle_haveQueuedStarForce
	cmp	r0,0x0
	bne	@@doAlreadyStarForce

	add	r1,=var_broStarForce
	add	r0,r5,0x1
	str	r0,[r1]

	// Change main state to Star Force
	mov	r0,0xC
	strb	r0,[r6,0x1]

	// Set selected card index
	ldrb	r0,[r7,0x4]
	str	r0,[r6,0x10]

	// Check Brother Satellite
	add	r1,r5,0x1
	bl	0x200BDC8
	cmp	r0,0x1
	blt	@@doStarForceAny
	cmp	r0,0x3
	bgt	@@doStarForceAny

@@doStarForceSpecific:
	sub	r0,0x1
	strb	r0,[r7,0xC]

	mov	r0,0x3
	b	@@doStateChange

@@doStarForceAny:
	mov	r0,0x0
	b	@@doStateChange

@@doAlreadyStarForce:
	mov	r0,0x4
	strb	r0,[r6,0x3]

	mov	r4,0x18
	b	@@doScript

@@doRoulette:
	mov	r0,0x1
	b	@@doStateChange

@@doBestCombo:
	mov	r0,0x2

@@doStateChange:
	strh	r0,[r6,0x2]	// update state and substate

@@end:
	pop	r0,r3-r7,r15



	.pool

var_broStarForce:
	dw	0

.endarea



.close
