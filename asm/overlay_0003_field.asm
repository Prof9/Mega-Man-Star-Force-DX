// Overlay 3 - Field

.nds
.open TEMP+"/overlay_0003.bin",readu32(TEMP+"/y9.bin", 3 * 0x20 + 0x4)
.thumb


// Fix Robo Snake Comp step counter reset
.org 0x216187C
	bl	field_roboSnakeCompSaveStepCounter
.org 0x2161CEC
	push	r14
	bl	field_roboSnakeCompRestoreStepCounter
.org 0x2161D04
	pop	r15


// Add encounter reset to School Comp
.org 0x215FFF6
	bl	field_schoolCompSaveStepCounter
.org 0x2160012
	bl	field_schoolCompRestoreStepCounter


// Fix Sub Cards flashing in Scrap Comp
.org 0x2162C70
.area 0xC,0x00
	mov	r3,0x1
	str	r3,[sp,0x8]
	mov	r3,0x2
	bl	0x202F750
	pop	r0-r2,r4-r5,r15		// pop extra for deallocation
.endarea


// Fix Lunar Knights Brother message buffer not deallocated
.org 0x217F2A2
.area 0x3C,0x00
	// No need to allocate a buffer
	ldr	r0,[0x217F368]	// 0x2117A70
	mov	r1,(0x470 >> 0x4)
	lsl	r1,r1,0x4
	add	r1,r7,r1
	mov	r2,r4
	mov	r3,0x2A
	bl	0x20102D0	// mail to message

	b	0x217F2EA
	.pool
.endarea


// Suppress Snake Comp gate SFX in cutscene skip
.org 0x216A682
	bl	field_skipSnakeCompGateSFX


.org 0x2187F6E	// Fix laggy Mega Screen scroll
.area 0xE
	ldr	r0,=field_megaScreenScrollFileSizes
	lsl	r1,r4,0x2
	ldr	r0,[r0,r1]
	str	r0,[sp,0x44]
	b	0x2187F7C

	.pool
.endarea


// Mail sort
.org 0x218024C
	bl	field_emailSortMenuCompose
.org 0x217FC52
	bl	field_emailSortMenuClose
.org 0x217FD4A
	bl	field_emailSortMenuInit
.org 0x21819A6
	bl	field_emailSortMenuInit
.org 0x217FD5C
	bl	field_emailSortMenuHandler
.org 0x217FD60	// Change Compose to Y Button
	lsl	r1,r1,0xB
.org 0x218081C
	bl	field_emailSortMenuDrawSprites
.org 0x21812B8	// Set all menu sprites to priority 2
	mov	r1,0x2
.org 0x2181772
	bl	field_emailSortMenuBackgroundCursor


// Allocate more memory for E-mail text
.org 0x2180570	// Total buffers size
	.dw	0xE720			// from 0xDB20
.org 0x218036A	// E-mail body text
	mov	r1,(0x8000 >> 0xA)	// from 0x7400
.org 0x21803CC
	mov	r1,(0x8000 >> 0xA)


// Keyboard insert mode
.org 0x21717DA
	mov	r0,0x79
	mov	r1,0x1
	strb	r1,[r4,r0]
// Fix keyboard insert mode
.org 0x2172A10
	ldrb	r3,[r1]
	sub	r1,r3,0x1	// hack for name
.org 0x2172A94
	bge	0x2172A72	// end of last line, go to next char
.org 0x217226A
.area 0x18,0x00
	cmp	r0,0xFF
	beq	0x2172282
	// Add char
	mov	r1,r0
	mov	r0,r5
	bl	0x2172BE8
	// Check char added
	mov	r1,0x69		// error SFX
	cmp	r0,0xFF
	beq	@@jumpToPlaySFX
	mov	r1,0x89		// enter SFX
@@jumpToPlaySFX:
	ldr	r0,[0x21722E4]
	b	0x2172106
.endarea
.org 0x2171A94
	bl	field_keyboardDrawCaretFadeIn
.org 0x2174444
	bl	field_keyboardInitCursor
	bl	0x2172D10
	add	sp,0x8
	pop	r3-r7,r15
.org 0x21721DC
	bl	field_keyboardInsertBackspace
.org 0x217207E
	bl	field_keyboardCaretNextName
.org 0x21747C8
	bl	field_keyboardCaretPrevName
.org 0x21720DE	// Don't insert spaces to go to next line
	nop
.org 0x21720F2
	bl	field_keyboardNewLine
.org 0x2173EEE
	bl	field_prefillNumbers
.org 0x21741B6
	bl	field_prefillFriendCode
.org 0x2174438
	bl	field_prefillConnectNumber
.org 0x2174742
	bl	field_checkTwoDigitNumber
.org 0x2172940
	bl	field_convertConnectNumber
// Read prerendered keyboard graphics
.org 0x2171668
	.dw	(0x1E0 + 0x300 + 0x1400 + (5 * 11 * 3 + 1)*0x80)
.org 0x21716B0
	.dw	(0x1E0 + 0x300 + 0x1400 + (5 * 11 * 3 + 1)*0x80)
.org 0x217176C
	ldr	r0,[r4,0x10]
	mov	r1,(5 * 11 * 3 + 1)
	lsl	r1,r1,0x7
	mov	r2,0x2
	bl	field_keyboardLoadKeys
.org 0x2172C7A
	bl	field_keyboardAddChar
.org 0x2172AD8
.area 0x2A,0x00
	// Copy tiles to VRAM from buffer
	mov	r0,(5 * 11)
	lsl	r0,r0,0x7
	str	r0,[sp]
	mov	r3,0x8D
	ldrb	r3,[r5,r3]
	mul	r3,r0
	add	r3,r4,r3
	add	r3,0x80
	ldr	r0,[0x2172B54]	// 0x21239A4
	mov	r1,0x0
	mov	r2,0x80
	bl	0x202EEC4

	b	0x2172B02

	.pool
.endarea
.org 0x2172D10
	push	r3-r6,r14
.org 0x2172D3E
	mov	r6,r0
	ldr	r0,[r4,0x10]
	mov	r1,0x2
	bl	0x2015E94		// keyboard tiles
	mov	r1,r6			// tile buffer
	mov	r2,r5			// text buffer
	bl	field_keyboardRenderText
.org 0x2172D5E
	mov	r3,r6
.org 0x2172D6A
	mov	r2,r6
.org 0x2172D7C
	pop	r3-r6,r15
// Touch input
.org 0x2173DE6
	ldrh	r2,[r4,0x8]		// enable hold down A Button
.org 0x2171AC6
	bl	field_keyboardEnterRun1
.org 0x217241E
	bl	field_keyboardEnterRun1
.org 0x2173CCA
	bl	field_keyboardEnterRun2
.org 0x2171AFC
	bl	field_keyboardPreCheckTouch
.org 0x217204E
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172096
	bl	field_keyboardCheckKeyWithTouch
.org 0x21720AE
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172112
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172150
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172188
	bl	field_keyboardCheckKeyWithTouch
.org 0x21721D2
	bl	field_keyboardCheckKeyWithTouch
.org 0x21721E6
	bl	field_keyboardCheckKeyWithTouch
.org 0x217221E
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172242
	bl	field_keyboardCheckKeyWithTouch
.org 0x2172266
	bl	field_keyboardCheckKeyWithTouch
// Run
.org 0x21536AC	// Friend Code screen
	bl	field_keyboardFriendCodeDrawSprites
.org 0x21536BC
	bl	field_keyboardFriendCodeDrawSprites
.org 0x214FE26
	// Don't clear tile 0 of BG0
	mov	r2,0xE
.org 0x215366A
.area 0x6,0x00
	b	0x2153670
.endarea
.org 0x21536B4
	bl	field_keyboardFriendCodeRun
.org 0x217D6C0	// Brother screen
	bl	field_keyboardRunBrother
.org 0x217D596	// Name
	// Update sprites instead of unloading
	mov	r0,r4
	bl	0x217E730
.org 0x217D5EE	// Message
	// Update sprites instead of unloading
	mov	r0,r4
	bl	0x217E730
.org 0x217D60E
	// Update sprites instead of unloading
	mov	r0,r4
	bl	0x217E730
.org 0x2182B48	// E-mail (Name)
.area 0x14,0x00
	// Skip unloading sprites
	ldr	r1,[0x2182BE0]
	b	0x2182B5C
.endarea
.org 0x2182DE0	// E-mail (Subject)
.area 0x14,0x00
	// Skip unloading sprites
	ldr	r1,[0x2182F7C]
	mov	r3,0x0
	b	0x2182DF4
.endarea
.org 0x218419A
	mov	r2,0xD
	bl	field_keyboardEmailClearFirstTileBG1
.org 0x2184164
	bl	field_keyboardClosedReloadMail2
	ldr	r0,[0x21843D4]
	ldr	r2,[0x21843D8]
.org 0x218BA92
.area 0x18,0x00
	// Skip unloading sprites
	b	0x218BAAA
.endarea
.org 0x218BAC2
.area 0x14,0x00
	// Keep displaying sprites
	b	0x218BAD6
.endarea
// Close
.org 0x217D6CA
	bl	field_keyboardClosedReloadBrother
//.org 0x21716EC
//	bl	field_keyboardClosed
// Init
.org 0x21716F8
	mov	r1,0x0
.org 0x2171700
	mov	r1,0x0
.org 0x2171708
	mov	r1,0x0
.org 0x2171710
	mov	r1,0x0
	mov	r2,0x5		// equivalent to screen 0x1 type 0xC
	bl	field_keyboardOverworldBG3
.org 0x217171A
	mov	r1,0x0
.org 0x2171722
	mov	r1,0x0
.org 0x217172A
	mov	r1,0x0
.org 0x2171734
	mov	r1,0x0
.org 0x217173C
	mov	r1,0x0
.org 0x2171744
	mov	r1,0x0
// Screen fade
.org 0x217D412
	cmp	r0,0x3
	bgt	0x217D43C
.org 0x217D552
	cmp	r0,0x3
	bgt	0x217D560
.org 0x2171A10
	mov	r1,0x0
.org 0x2171A16
	mov	r3,0x1
.org 0x2172438
	mov	r1,0x0
.org 0x215363C
	mov	r1,0x0
.org 0x215364A
	bl	field_keyboardStartFriendCode
.org 0x215365E
	bl	0x2011C28	// both screens finished fading
.org 0x21536C2
	bl	field_keyboardClosedReloadFriendCode
.org 0x2182B24	// Subject
	mov	r1,0x0
.org 0x2182B32
	bl	field_keyboardStartMail
.org 0x2182B3C
	mov	r1,0x0
.org 0x2182B40
	bl	0x2011C28	// both screens finished fading
.org 0x2182DBC	// Body
	mov	r1,0x0
.org 0x2182DCA
	bl	field_keyboardStartMail
.org 0x2182DD2
	mov	r1,0x0
.org 0x2182DD6
	bl	0x2011C28	// both screens finished fading
.org 0x2182B9A
	bl	field_keyboardClosedReloadMail
.org 0x2182E32
	bl	field_keyboardClosedReloadMail
.org 0x218BA02
	bl	field_keyboardClosedReloadConnect
// Graphics
.org 0x2171A28
	bl	field_keyboardLoadGraphics
.org 0x217184A
	mov	r1,0x0
.org 0x217186E
	mov	r1,0x0
.org 0x2171872
	mov	r2,0x1
.org 0x217189A
	mov	r1,0x0
.org 0x21718C0
	mov	r1,0x0
.org 0x2171900
	mov	r1,0x0
.org 0x217191E
	mov	r1,0x0
.org 0x2171938
	mov	r1,0x0
.org 0x217195E
	mov	r1,0x0
.org 0x2171992
	mov	r1,0x0
.org 0x21719F0
	mov	r1,0x0
	mov	r2,0x1
//.org 0x2172AF8
//	mov	r1,0x0
.org 0x2172B3E
	mov	r1,0x0
.org 0x2172B44
	mov	r2,0x1
.org 0x2172CA0
	mov	r1,0x0
.org 0x2172CE2
	mov	r1,0x0
	mov	r2,0x1
.org 0x2172D5A
	mov	r1,0x0
.org 0x2173708
	mov	r1,0x0
.org 0x2173712
	mov	r2,0x1
.org 0x2173844
	mov	r1,0x0
.org 0x2173F4C
	mov	r1,0x0
// Sprites
.org 0x2172DD0
	mov	r1,0x0
.org 0x2172DF2
	mov	r1,0x0
.org 0x2172E28
	mov	r1,0x0
.org 0x2172E4A
	mov	r1,0x0
.org 0x2172E7E
	mov	r1,0x0
.org 0x2172E90
	mov	r1,0x0
.org 0x2172EB0
	mov	r1,0x0
.org 0x2172ED4
	mov	r1,0x0
.org 0x2172EE6
	mov	r1,0x0
.org 0x2172EF8
	mov	r1,0x0
.org 0x2172F24
	mov	r1,0x0
.org 0x2172F3A
	mov	r1,0x0
.org 0x2172F4C
	mov	r1,0x0
.org 0x2172F5E
	mov	r1,0x0
.org 0x2172F86
	mov	r1,0x0
.org 0x2172FA2
	mov	r1,0x0
.org 0x2172FB6
	mov	r1,0x0
.org 0x2173056
	mov	r1,0x0
.org 0x217307C
	mov	r1,0x0
.org 0x2173144
	mov	r1,0x0
.org 0x217316A
	mov	r1,0x0
.org 0x21731AC
	mov	r1,0x0
.org 0x21731D2
	mov	r1,0x0
.org 0x2173204
	mov	r1,0x0
.org 0x217322A
	mov	r1,0x0
// Message box
.org 0x2173CE0
	str	r2,[sp]


.org 0x2175150
	.dw	arm9_font1
.org 0x217BA60
	.dw	arm9_font1
.org 0x217C764
	.dw	arm9_font1


// Check Andromeda Library flag instead of event flag for event receive
.org 0x218AD2C
.area 0x8,0x00
	nop
	ldr	r1,[0x218AEBC]	// 0xEF7
	bl	0x202409C	// check flag
.endarea
.org 0x218AEBC
	.dw	0xEF7


.org 0x215C762
	bl	field_bufferMysteryWaveCard


.org 0x21770F4
	bl	field_returnToFolderSelect


// Increase damage for dungeon hazards
.org 0x215DF08
	bl	field_hazardBulls
.org 0x215ED0E
	bl	field_hazardStars
.org 0x216036C
	bl	field_hazardSnakes
.org 0x2161CCE
	bl	field_hazardPoison
.org 0x216212E
	bl	field_hazardBulldozers
.org 0x2162BB6
	bl	field_hazardBulldozers
.org 0x216B704
	bl	field_hazardNotes
.org 0x216D3F2
	bl	field_hazardStars


// Make Truck Comp bulls a bit easier
.org 0x218C4FA
	// ?, icons per wave, frames to react, damage
	.db	0x20, (5), (45), (10)	// from 0x20, (5), (45), (10)
	.db	0x20, (6), (42), (10)	// from 0x20, (6), (40), (15)
	.db	0x20, (6), (39), (10)	// from 0x20, (7), (35), (20)
	.db	0x20, (7), (36), (10)	// from 0x20, (8), (30), (25)


// Change cutscene command - get version to actually get version
.org 0x216515C
.area 0x30,0x00
	push	r4,r14
	mov	r4,r0

	bl	common_getPlayerSatellite
	lsl	r0,r0,0x2
	ldr	r2,[r4,0x10]
	add	r3,r2,r0

	// Load offset for version
	ldrh	r0,[r3,0x4]
	ldrh	r1,[r3,0x6]
	lsl	r1,r1,0x10
	orr	r0,r1

	add	r2,r2,r0
	str	r2,[r4,0x10]

	add	r4,0xAC
	mov	r0,0x0
	str	r0,[r4]
	str	r0,[r4,0x4]
	str	r0,[r4,0x8]
	str	r0,[r4,0xC]
	str	r0,[r4,0x10]
	pop	r4,r15
.endarea


// Prompt to save before final boss
.org 0x21A2BC4
	// Intercept pulse in
	.dw	0x13	:: .dw	field_pulseInScript-(.-4)


// Preloaded sprites
.org 0x219470C
	.dh	0x01,(field_exSpritesEchoRidge-field_exSpritesBase)
.org 0x2192D28
	.dh	0x01,(field_exSpritesGeosLivingRoom-field_exSpritesBase)
.org 0x219268C
	.dh	0x01,(field_exSpritesGeosRoom-field_exSpritesBase)
.org 0x2192A7C
	.dh	0x01,(field_exSpritesLunasRoom-field_exSpritesBase)
.org 0x21926C0
	.dh	0x01,(field_exSpritesBudsRoom-field_exSpritesBase)
.org 0x21926F4
	.dh	0x01,(field_exSpritesZacksRoom-field_exSpritesBase)
.org 0x2192F44
	.dh	0x01,(field_exSpritesBigWave-field_exSpritesBase)
.org 0x2193924
	.dh	0x01,(field_exSpritesVistaPoint-field_exSpritesBase)
.org 0x2193EEC
	.dh	0x01,(field_exSpritesAmakenGrounds-field_exSpritesBase)
.org 0x2193D88
	.dh	0x01,(field_exSpritesAmakenFoyer-field_exSpritesBase)
.org 0x21936B0
	.dh	0x01,(field_exSpritesScienceMuseum-field_exSpritesBase)
.org 0x2193704
	.dh	0x01,(field_exSpritesLab-field_exSpritesBase)
.org 0x2193984
	.dh	0x01,(field_exSpritesFoyer-field_exSpritesBase)
.org 0x2193384
	.dh	0x01,(field_exSpritesClass1B-field_exSpritesBase)
.org 0x2193B70
	.dh	0x01,(field_exSpritesClass5A-field_exSpritesBase)
.org 0x2193DFC
	.dh	0x01,(field_exSpritesGym-field_exSpritesBase)
.org 0x2193B08
	.dh	0x01,(field_exSpritesStudio-field_exSpritesBase)
.org 0x2194680
	.dh	0x01,(field_exSpritesTimeSquare-field_exSpritesBase)
.org 0x2193BD8
	.dh	0x01,(field_exSpritesNacys1F-field_exSpritesBase)
.org 0x2193C40
	.dh	0x01,(field_exSpritesNacysRoof-field_exSpritesBase)
.org 0x219301C
	.dh	0x01,(field_exSpritesDreamIsland-field_exSpritesBase)
.org 0x2192D68
	.dh	0x01,(field_exSpritesDreamPark-field_exSpritesBase)
.org 0x2193804
	.dh	0x01,(field_exSpritesScrapyard1-field_exSpritesBase)
.org 0x21912D4
	.dh	0x01,(field_exSpritesServiceModule-field_exSpritesBase)
.org 0x2190E90
	.dh	0x01,(field_exSpritesDeepSpace1-field_exSpritesBase)
.org 0x2191354
	.dh	0x01,(field_exSpritesDeepSpace2-field_exSpritesBase)
.org 0x2191254
	.dh	0x01,(field_exSpritesDeepSpace3-field_exSpritesBase)
.org 0x21921D8
	.dh	0x01,(field_exSpritesAmakenTowerComp-field_exSpritesBase)
.org 0x2191F18
	.dh	0x01,(field_exSpritesPianoComp-field_exSpritesBase)
.org 0x2191AEC
	.dh	0x01,(field_exSpritesMirrorComp-field_exSpritesBase)
.org 0x2191B10
	.dh	0x01,(field_exSpritesMowaMowaComp-field_exSpritesBase)


// NPC data
.org 0x219DC80	// BIG WAVE NPC 3
	.dh	0x41		// Overworld sprite
	.dh	0x14F		// Mugshot
	.dh	0x3C		// Transer ID


// E-mail icons: checkmarks
.org 0x2181576
	bl	field_emailCheckmark

// E-mail icons
.org 0x219C588 + 0x4 * (18)
	.dh	0x0		// No attachment
	.db	0x0		// Normal icon
.org 0x219C588 + 0x4 * (19)
	.dh	0x0		// No attachment
	.db	0x0		// Normal icon
.org 0x219C588 + 0x4 * (27)
	.dh	0x0		// No attachment
	.db	0x0		// Normal icon
.org 0x219C588 + 0x4 * (28)
	.dh	0x0		// No attachment
	.db	0x0		// Normal icon
.org 0x219C588 + 0x4 * (32)
	.dh	0x0		// No attachment
	.db	0xC		// /!\ icon
.org 0x219C588 + 0x4 * (33)
	.dh	0x0		// No attachment
	.db	0xC		// /!\ icon
.org 0x219C588 + 0x4 * (34)
	.dh	0x1		// Has attachment
	.db	0xC		// /!\ icon
.org 0x219C588 + 0x4 * (57)	// Cindy White
	.dh	0x183E
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (58)	// Quiero Mocard
	.dh	0x183F
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (59)	// Joe Hawnt
	.dh	0x1840
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (60)	// Iver Gatte
	.dh	0x1841
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (61)	// Chase Winde
	.dh	0x1842
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (62)	// Juan Mocard
	.dh	0x1843
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (63)	// Chatty Ditz
	.dh	0x1844
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (64)	// Millie Booney
	.dh	0x1845
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (65)	// Sumar Guy
	.dh	0x1846
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (66)	// Grace Fulle
	.dh	0x1847
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (67)	// Leroy Mann
	.dh	0x1848
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (68)	// Swill Waters
	.dh	0x1849
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (69)	// Polly Reade
	.dh	0x184A
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (70)	// Edgar Knight
	.dh	0x184B
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (71)	// Tuggy McGrav
	.dh	0x184C
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (72)	// Mira Lookes
	.dh	0x184D
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (73)	// Savory Delejo
	.dh	0x184E
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (74)	// Holly Wacher
	.dh	0x184F
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (75)	// Blair Loude
	.dh	0x1850
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (76)	// Job Goode
	.dh	0x1851
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (77)	// Rad Contre
	.dh	0x1852
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (78)	// Barry Square
	.dh	0x1853
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (79)	// Triv Query
	.dh	0x1854
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (80)	// Teresa Tudor
	.dh	0x1855
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (81)	// Ema Nesia
	.dh	0x1856
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (82)	// Will Knappe
	.dh	0x1857
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (83)	// Nadia Kleen
	.dh	0x1858
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (84)	// Lei Zeek
	.dh	0x1859
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (85)	// Dee Jay
	.dh	0x185A
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (86)	// Collin Waytin
	.dh	0x185B
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (87)	// Indy Darke
	.dh	0x185C
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (88)	// Heidi Rune
	.dh	0x185D
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (89)	// Donna Query
	.dh	0x185E
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (90)	// Rheema Deller
	.dh	0x185F
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (91)	// Annie Olde
	.dh	0x1860
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (92)	// Kurt Taylor
	.dh	0x1861
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (93)	// Homer Park
	.dh	0x1862
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (94)	// Sluger Park
	.dh	0x1863
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (95)	// Meala DeVour
	.dh	0x1864
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (96)	// Selah Agane
	.dh	0x1865
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (97)	// Roy Query
	.dh	0x1866
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (98)	// Mead Greene
	.dh	0x1867
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (99)	// John Forman
	.dh	0x1868
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (100)	// Hope Stelar
	.dh	0x1869
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (101)	// Ken Suther
	.dh	0x186A
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (102)	// Luna Platz
	.dh	0x186B
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (103)	// Bud Bison
	.dh	0x186C
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (104)	// Zack Temple
	.dh	0x186D
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (105)	// Dummy
	.dh	0x0
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (106)	// Chrys Golds
	.dh	0x186F
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (107)	// Dummy
	.dh	0x0
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (108)	// Tom Dubius
	.dh	0x1871
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (109)	// Pat Sprigs
	.dh	0x1872
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (110)	// Mitch Shepar
	.dh	0x1873
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (111)	// Bob Copper
	.dh	0x1874
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (112)	// Veil Platz
	.dh	0x1875
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (113)	// Vaughn Platz
	.dh	0x1876
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (114)	// Prof. Snake
	.dh	0x1877
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (115)	// Dummy
	.dh	0x0
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (116)	// Dummy
	.dh	0x0
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (117)	// Sonia Strumm
	.dh	0x187A
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (118)	// Aaron Boreal
	.dh	0x187B
	.db	0x10		// Question icon
.org 0x219C588 + 0x4 * (119)
	.dh	0x1		// Has attachment
	.db	0xC		// /!\ icon


// Default mail recipient is Satellite
.org 0x21531FC
.area 0x12,0x00
	sub	r1,0xB
	add	r1,r0,r1
	mov	r0,0x6
	strh	r0,[r1]
	mov	r0,0x1
	strh	r0,[r1,0x2]
	strh	r0,[r1,0x4]
	pop	r4,r15
.endarea


// Avoid EX boss overlap with GMWs
.org 0x215A948
	bl	field_avoidGmwPosition


// Increase chance of Boktai GMWs
.org 0x215AE9C	// Count number of Boktai Brothers
	push	r3-r6,r14
.org 0x215AEA2
	mov	r6,0x0
.org 0x215AEB2
	add	r6,0x1
	nop
.org 0x215AEBC
	mov	r0,r6
	pop	r3-r6,r15
.org 0x215A7CE	// Adjust calls
	cmp	r0,0x0
	.skip	0x2
	beq	0x215A7DE
.org 0x215A9D4	// Increase chance of Boktai GMW
	mov	r4,r0	// Save number of Boktai Brothers
.org 0x215A9DA
	mov	r1,0x4	// 1-in-4 base chance
.org 0x215A9E0
	cmp	r0,r4	// Increase with Boktai Brothers

// Check if you have Boktai Brother when picking up Boktai GMW
.org 0x215ADE0
	bl	field_checkBoktaiGMWPickup

.org 0x215A9EE
	bl	field_spawnBoktaiMysteryWave

// Always show Red Mystery Waves
.org 0x215ACC0
.area 0x10,0x00
	b	0x215ACD0
.endarea
// Don't check for Boktai Brother flag on picking up Red Mystery Wave
.org 0x215ADCE
.area 0xC,0x00
	b	0x215ADDA
.endarea


// Increase chance of Gold Mystery Wave
.org 0x215A8F0	// Increase spawn rate
	mov	r1,0x2	// from 1/64 to 1/2
.org 0x215A87A	// Skip area check
	b	0x215A89A

// Gold Mystery Wave spins backwards
.org 0x215BBF8
	bl	field_mysteryWaveSpin


// Load extra icons into VRAM
.org 0x2158B6C
	.dw	field_cockpitLoads


// Show icons on Transers indicating quest status
.org 0x21A68A8
	.dw	field_transerIcons|1


.org 0x2185914	// Add Database to Mega screen
	bl	field_megaMenu1
	b	0x2185A92
.org 0x21859A0
	mov	r0,0x66
	ldrh	r1,[r4,r0]
	lsr	r0,r1,0x2	// test 0x2
	bcc	0x2185A92
	bl	field_megaMenu2
.org 0x2185ED0
	mov	r0,0xA0
	ldrb	r0,[r4,r0]
	bl	field_megaMenu3
	b	0x2185FD0
.org 0x2185F0E
	mov	r0,0x66
	ldrh	r2,[r4,r0]
	lsr	r0,r2,0x2	// test 0x2
	bcc	0x2185F42
	bl	field_megaMenu4


// Hide Omega-Xis from Mega screen
.org 0x2188292
	bl	field_hideOmegaXisFromMegaScreen
.org 0x21857C2
	bl	field_hideOmegaXisFromMegaScreen


.org 0x2185C5E	// Play "equip" SFX from SF3
	bl	field_megaEquipWeapon

.org 0x2185C6E
	bl	common_reloadBusterStats


// Adjust wave road opacity
.org 0x21689E4
	mov	r2,0xE
	mov	r3,0x2

.org 0x215CBE6
	bl	field_showWaveRoadNPC
.org 0x2169D2E
//	bl	field_showWaveRoadObject


// Y = wave beam
.org 0x217084E
	bl	field_waveRoadIncreaseOpacity
.org 0x2170EBA	// Movement state check
	bl	field_waveBeamHeld
.org 0x2171268	// Disable interaction
	bl	field_waveBeamNoInteraction


// Fix touch warp size in Scrapyard 1
.org 0x2199400
	.dh	0x40, 0x30


.org 0x21649C8	// Hold Start to auto-skip cutscenes
	ldrh	r1,[r0]		// Load button held instead of button down


.org 0x21524C4
	bl	field_brotherLoadLeoWindow


.org 0x217AA20	// Fix pack sorting bug after removing cards from pack
	bl	field_sanitizePack


.org 0x21591F4	// Make bull minigame controllable with buttons
	bl	field_bullMinigame

.org 0x215F2A6	// Make rocket minigame controllable with buttons
	bl	field_rocketGame1
.org 0x215F518
	bl	field_rocketGame2

.org 0x21632A8	// Make sonar minigame auto-search when touch screen not held
.area 0x18,0x00
	push	r14
	lsl	r2,r1,0x2
	add	r2,r0,r2
	ldr	r2,[r2,0x78]
	cmp	r2,0x0
	beq	0x21632D4
	ldr	r2,[0x21632D8]
	ldr	r3,[r2]
	mov	r2,r3
	add	r2,0x98
	bl	field_sonarGame
.endarea
.org 0x21632D2
	pop	r15
.org 0x21632D6
	pop	r15

.org 0x2162422	// Allow item search during sonar
	bl	field_sonarGame2
.org 0x21624A2
	bl	field_sonarGame2

.org 0x2162404	// No message after finding all items
	b	0x2162418

.org 0x216B860	// Make Harp Note minigame controllable with D-pad
.area 0xA8,0x00
	push	r4-r5,r14
	mov	r5,r0
	add	r5,0xD4

	// Check cooldown timer
	ldrb	r0,[r5,0x1]
	cmp	r0,0x0
	beq	@@checkTouch

	sub	r0,0x1
	strb	r0,[r5,0x1]
	b	@@returnFalse

@@checkTouch:
	mov	r4,0x3
@@touchLoop:
	// Check button touched
	ldr	r0,=0x21ABCF8
	ldr	r0,[r0]
	mov	r1,r4
	bl	0x215FEE4
	cmp	r0,0x1
	beq	@@setDirection

@@touchNext:
	sub	r4,0x1
	bpl	@@touchLoop

@@checkButtons:
	// Get buttons held
	ldr	r4,=0x211DD1C
	ldrh	r4,[r4]

	mov	r0,0xF0
	and	r0,r4
	ldr	r1,=0xC03
	and	r1,r4

	mov	r4,0x0

	// Check D-pad first
	cmp	r0,0x50		// Up + Right
	beq	@@topRight
	cmp	r0,0x90		// Down + Right
	beq	@@bottomRight
	cmp	r0,0xA0		// Down + Left
	beq	@@bottomLeft
	cmp	r0,0x60		// Up + Left
	beq	@@topLeft

	// Don't check face buttons if D-pad held
	cmp	r0,0x0
	bne	@@returnFalse

	// Check face buttons
	cmp	r1,0x1		// A
	beq	@@topRight
	cmp	r1,0x2		// B
	beq	@@bottomRight
	mov	r0,0x8
	lsl	r0,r0,0x8	// Y
	cmp	r1,r0
	beq	@@bottomLeft
	lsr	r0,r0,0x1	// X
	cmp	r1,r0
	bne	@@returnFalse	// top left

@@topLeft:
	add	r4,0x1
@@bottomLeft:
	add	r4,0x1
@@bottomRight:
	add	r4,0x1
@@topRight:

@@setDirection:
	strb	r4,[r5]
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r4-r5,r15

	.pool
.endarea


.org 0x218680C // Allocate extra buffer for scanner Satellite
.area 0xB4,0x00
	mov	r0,0x20
	bl	0x2015C70	// alloc buffers list
	ldr	r1,[0x2186B80]
	mov	r2,(15+1)
	bl	0x2015D4C	// alloc buffers
	str	r0,[r5,0xC]

	mov	r4,0x0
@@loop:
	add	r1,=@@bufferSizes
	lsl	r0,r4,0x1
	ldrh	r1,[r1,r0]
	cmp	r1,0x1
	beq	@@end

	ldr	r0,[r5,0xC]
	mov	r2,r4
	bl	0x2015E1C	// alloc buffer with ID

	add	r4,0x1
	b	@@loop

@@end:
	b	0x21868C0

.align 4
@@bufferSizes:
	.dh	0x1000, 0x1800, 0x2800, 0xF0
	.dh	0x130, 0x80, 0xC8, 0x60
	.dh	0x800, 0x80, 0x240, 0x30
	.dh	0x30, 0x30, 0x30
	// New buffers
	.dh	0x28		// buffer 0xF: 10 * 4 * 1
	// End
	.dh	0x1
.endarea
.org 0x2186B80
	.dw	(0x5F48 + 0x28)


.org 0x2187EDE	// Draw Wave Scanner satellite
	bl	field_drawScannerSatellite
.org 0x21881C2	// Scroll Wave Scanner satellite
	bl	field_scrollScannerSatellite


.org 0x215B810	// Add NPC sprite buffers
	bl	field_changeNpcSpriteBuffered


.org 0x2158914	// Fix object allocation bug
	mov	r1,0x8


.org 0x215FB56	// Random fast note for 1000 Note Challenge
	bl	field_noteGameFastNoteRandom
	add	r4,0x1
.org 0x216BA3E
	bl	field_noteGameFastNoteSpeedXY
.org 0x216BA4A
	ldr	r2,[r4,0x10]
	bl	field_noteGameFastNoteSpeedXY

.org 0x2159438	// Avoid overriding cockpit loads for note game buttons
	mov	r0,0x74
	strb	r1,[r5,r0]
	mov	r0,(0xC400 >> 0x8)
	lsl	r0,r0,0x8
.org 0x2159442	// Use different palette for note game buttons
	mov	r0,0xF


.org 0x2170D86
	bl	field_stationCompSwoosh


.org 0x215D554	// Trigger object collision both ways
		// Fixes (?) glitch where sometimes one object collides
		// with the other, but not the other way around
	bl	field_twoWayCollision


.org 0x2194A7C	// Vista Point
	.dh	0xFE, (field_exObjectsVistaPoint - field_exObjects)
.org 0x2193750	// AMAKEN Grounds
	.dh	0xFE, (field_exObjectsAmakenGrounds - field_exObjects)
.org 0x2194C80	// Class 5-A
	.dh	0xFE, (field_exObjectsClass5A - field_exObjects)
.org 0x2192230	// Deep Space 3
	.dh	0xFE, (field_exObjectsDeepSpace3 - field_exObjects)

.org 0x2169AB0	// Add extra object types
	bl	field_exObjectTypes

.org 0x216FFFC	// Add extra objects (boss panels)
	bl	field_extraObjects

.org 0x2169D5C
	bl	field_waveWorldBossPanel
.org 0x2169AFE
	bl	field_waveRoadBossPanel


.org 0x2179A92
	bl	field_packFlagCards


.org 0x217BF44
	bl	field_starTraderConfirmCards
.org 0x217C1B0
	bl	field_starTraderChooseCard
.org 0x2167A44
	bl	field_starTraderHandleNothing
.org 0x2167B1C
	bl	field_traderLoadStarIcon
.org 0x2167B24
	bl	field_traderLoadStarPalette
.org 0x2167BB6
	bl	field_drawStarOnTraderCard
.org 0x217CC78
	bl	field_traderStarDescription

.org 0x217CB40	// Don't replay trader text on cancel exit
.area 0x8,0x00
	mov	r2,0xC
	strb	r2,[r4,r1]
.endarea
.org 0x217BED6
	bl	field_handleCardTraderStates
.org 0x217C0BC
	bl	field_startRemoveAllCardTrader


//.org 0x2158454	// Extra check to prevent NPC bro overwrite before game clear
//	bl	field_overwriteNpcBro
.org 0x21584B2	// Different script for overwriting Boktai Brother
	bl	field_overwriteBoktaiBro
.org 0x2158186	// Different script for sending mail to Boktai Brother
	bl	field_sendMailToBoktaiBro
.org 0x215322A	// Treat Boktai/Copy Bro as event NPC Brother
	bl	field_startBroRegistration
	cmp	r2,0x0
	beq	0x2153246
.org 0x215838E
	bl	field_chooseBroLocation
	cmp	r1,0x0
	beq	0x215839C
.org 0x21583E6
	bl	field_cancelBroRegistration
	cmp	r0,0x0
	bne	0x21583FE


.org 0x21717EE	// Default keyboard cursor position in top left
	mov	r1,0x0
.org 0x21717F6
	mov	r1,0x0
.org 0x2171804
	sub	r1,r1,0x1

.org 0x21810B6	// Change "read mail" to single press A rather than repeat press
	sub	r0,r1,0x4
	ldrh	r2,[r4,r0]
	lsr	r0,r2,0x1	// test 0x1
	bcc	@@doMenu
	mov	r0,0x3
	add	r1,0x12
	str	r0,[r4,r1]
	ldr	r0,[0x2181130]
	ldr	r0,[r0]
	mov	r1,0x89
	bl	0x2025574	// play SFX
	pop	r3-r5,r15
@@doMenu:
	sub	r2,r1,0x2
	ldrh	r2,[r4,r2]	// get repeat press for menu
	add	r0,r4,r1
	add	r1,r1,0x4
	str	r3,[sp]
	add	r1,r4,r1
	mov	r3,0x4
	bl	0x2009908
	beq	0x2181124

.org 0x21851D0	// Change compose options to single press A/B rather than repeat press
	.dw	0x1022
.org 0x2185012
	add	r1,r0,0x6
.org 0x2185018
	sub	r0,0xA
.org 0x2185086
	add	r0,0x2

.org 0x2183106	// Don't go to "do want to quit writing?" if you reject "autosave after sending mail?"
.area 0x2C,0x00
	mov	r1,0x16
	str	r1,[r4,r0]
	b	0x2183434
.endarea

.org 0x2185088	// Press Start in mail compose to move cursor to Send
	bl	field_mailComposePressStart


.org 0x2186D52	// Long names for Mega weapons
	add	r1,0xE6

.org 0x21872D0	// Move LV back to original spot on Mega screen
	mov	r1,0xA0
.org 0x21872DA
	mov	r1,0xA0
.org 0x21872E4
	mov	r1,0xA0
.org 0x2187BD0
	mov	r1,0x15
.org 0x2187BDC
	mov	r1,0x15
.org 0x2187BE8
	mov	r1,0x15

.org 0x2186F0A	// Print Wave Scanner Attack bonus as bonus level
.area 0x52,0x00
	// Print Attack weapon level
	ldrb	r0,[r4]		// Attack weapon level
	add	r0,0x10
	mov	r1,0x1
	bl	0x20093DC	// get tiles

	mov	r3,r0
	mov	r0,0x40
	str	r0,[sp]
	ldr	r0,[0x21870A8]
	mov	r1,0x1
	mov	r2,(0x660 >> 0x4)
	lsl	r2,r2,0x4
	bl	0x202EEE8	// draw tiles

	// Print Attack bonus level
	mov	r0,0x6
	bl	0x20335D4
	ldrb	r1,[r6]		// Attack min level
	sub	r7,r0,r1

//	ldr	r0,[0x21870AC]
//	ldr	r0,[r0]
	bl	0x20228D4	// check Wave Scanner active
	cmp	r0,0x0
	beq	0x2186F5C

	mov	r0,0x12
	bl	0x20335D4
	add	r7,r7,r0
	b	0x2186F5C
.endarea

.org 0x2186FD2	// Print Wave Scanner Rapid bonus as bonus level
.area 0x52,0x00
	ldrb	r0,[r4,0x1]	// Rapid weapon level
	add	r0,0x10
	mov	r1,0x1
	bl	0x20093DC

	mov	r3,r0
	mov	r0,0x40
	str	r0,[sp]
	ldr	r0,[0x21870A8]
	mov	r1,0x1
	mov	r2,(0xA20 >> 0x4)
	lsl	r2,r2,0x4
	bl	0x202EEE8	// draw tiles

	// Print Rapid bonus level
	mov	r0,0x7
	bl	0x20335D4
	ldrb	r1,[r6,0x1]	// Rapid min level
	sub	r7,r0,r1

//	ldr	r0,[0x21870AC]
//	ldr	r0,[r0]
	bl	0x20228D4	// check Wave Scanner active
	cmp	r0,0x0
	beq	0x2187024

	mov	r0,0x13
	bl	0x20335D4
	add	r7,r7,r0
	b	0x2187024
.endarea

.org 0x218709A	// Print Wave Scanner Charge bonus as bonus level
.area 0x6,0x00
	ldrb	r0,[r4,0x2]	// Charge weapon level
	add	r0,0x10
	b	0x21870B0
.endarea
.org 0x21870B0
.area 0x50,0x00
	mov	r1,0x1
	bl	0x20093DC

	mov	r3,r0
	mov	r0,0x40
	str	r0,[sp]
	ldr	r0,[0x218744C]
	mov	r1,0x1
	mov	r2,(0xDE0 >> 0x4)
	lsl	r2,r2,0x4
	bl	0x202EEE8	// draw tiles

	// Print Charge bonus level
	mov	r0,0x8
	bl	0x20335D4
	ldrb	r1,[r6,0x2]	// Charge min level
	sub	r4,r0,r1

//	ldr	r0,[0x21870AC]
//	ldr	r0,[r0]
	bl	0x20228D4	// check Wave Scanner active
	cmp	r0,0x0
	beq	0x2187100

	mov	r0,0x14
	bl	0x20335D4
	add	r4,r4,r0
	b	0x2187100
.endarea

.org 0x2187446	// Print Wave Scanner HP bonus as bonus HP
.area 0x6,0x00
	mov	r0,0x70
	mov	r4,0xA
	b	0x2187474
.endarea
.org 0x2187474
.area 0xB2,0x00
	bl	0x2007BB8	// get HPMem10
	mul	r4,r0
	mov	r0,0x71
	bl	0x2007BB8	// get HPMem20
	mov	r1,0x14
	mul	r1,r0
	add	r1,r4,r1
	add	r1,0x64
	mov	r0,0x0
	bl	0x2008DF0	// store in buffer 0

	ldr	r0,[0x2187834]
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,(0x100 >> 0x8)
	lsl	r2,r2,0x8
	bl	0x20155DC	// Heap_Alloc
	mov	r4,r0

//	ldr	r0,[0x2187838]
//	ldr	r0,[r0]
	mov	r1,r4
	mov	r2,(0x100 >> 0x8)
	lsl	r2,r2,0x8
	bl	0x202DF14	// Mem_ClearFast

	ldr	r0,[r5,0xC]
	mov	r1,0x0
	bl	0x2015E94	// Buffer_GetBufferWithId
	mov	r1,(0x100 >> 0x8)
	lsl	r1,r1,0x8
	str	r1,[sp]
	mov	r1,0x0
	str	r1,[sp,0x4]
	mov	r1,0x22
	mov	r2,0x1
	mov	r3,r4
	bl	0x2008804

	mov	r0,(0x100 >> 0x8)
	lsl	r0,r0,0x8
	str	r0,[sp]
//	ldr	r0,[0x218783C]
	mov	r1,0x1
	ldr	r2,[0x2187840]
	mov	r3,r4
	bl	0x202EEE8

	ldr	r0,[0x2187834]
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,r4
	bl	0x2015620	// Heap_Free

	mov	r0,0x1
	bl	0x20335D4	// get HP boost from Brothers
	mov	r4,r0

//	ldr	r0,[0x21870AC]
//	ldr	r0,[r0]
	bl	0x20228D4	// check Wave Scanner active
	cmp	r0,0x0
	beq	0x2187526

	mov	r0,0xD
	bl	0x20335D4	// get HP boost from Wave Scanner
	add	r4,r4,r0
	b	0x2187526
.endarea
.org 0x2187526
	mov	r1,r4

.org 0x21875A2	// Print Wave Scanner Gauge, Mega, Giga bonus as bonus level
.area 0xBA,0x00
	mov	r0,0x9
	bl	0x20335D4	// get Gauge level from Brothers
	mov	r7,r0

	mov	r0,0xA
	bl	0x20335D4	// get Mega level from Brothers
	mov	r6,r0

	mov	r0,0xB
	bl	0x20335D4	// get Giga level from Brothers
	mov	r4,r0

//	ldr	r0,[0x21870AC]
//	ldr	r0,[r0]
	bl	0x20228D4	// check Wave Scanner active
	cmp	r0,0x0
	beq	@@limitGauge

	mov	r0,0x15
	bl	0x20335D4	// get Gauge boost from Wave Scanner
	add	r7,r7,r0

	mov	r0,0x16
	bl	0x20335D4	// get Mega boost from Wave Scanner
	add	r6,r6,r0

	mov	r0,0x17
	bl	0x20335D4	// get Giga boost from Wave Scanner
	add	r4,r4,r0

@@limitGauge:
	add	r1,r7,0x1
	cmp	r1,0x5
	bls	@@bufferGauge
	mov	r1,0x5
@@bufferGauge:
	mov	r0,0x1
	bl	0x2008DF0	// store in buffer 1

@@limitMega:
	add	r1,r6,0x5
	cmp	r1,0xA
	bls	@@bufferMega
	mov	r1,0xA
@@bufferMega:
	mov	r0,0x2
	bl	0x2008DF0	// store in buffer 2

@@limitGiga:
	add	r1,r4,0x1
	cmp	r1,0x5
	bls	@@bufferGiga
	mov	r1,0x5
@@bufferGiga:
	mov	r0,0x3
	bl	0x2008DF0	// store in buffer 3

	b	0x218765C
.endarea

.org 0x21876B4	// Print Wave Scanner Gauge bonus as bonus level
.area 0x5C,0x00
	mov	r0,0x11
	b	0x2187710
.endarea
.org 0x2187726
.area 0x8,0x00
	mov	r0,r7		// needed for division later
	b	0x218772E
.endarea
.org 0x218772E	// Fix printing for level = 10
	cmp	r7,(9)	// from 10

.org 0x2187796	// Print Wave Scanner Mega bonus as bonus level
.area 0x5C,0x00
	mov	r0,0x15
	b	0x21877F2
.endarea
.org 0x2187808
.area 0x8,0x00
	mov	r0,r6		// needed for division later
	b	0x2187810
.endarea
.org 0x2187810	// Fix printing for level = 10
	cmp	r6,(9)	// from 10

.org 0x21878B4	// Print Wave Scanner Giga bonus as bonus level
.area 0x5C,0x00
	mov	r0,0x11
	b	0x2187910
.endarea
.org 0x2187926
.area 0x8,0x00
	mov	r0,r4		// needed for division later
	b	0x218792E
.endarea
.org 0x218792E	// Fix printing for level = 10
	cmp	r4,(9)	// from 10


// Proper widths on names in Brother screen
.org 0x217E914
.area 0x8C,0x00
	ldr	r2,=0x77D
	ldrb	r2,[r0,r2]	// Brother index
	mov	r0,0x0
	mov	r1,0x0
	push	r0-r7,r14	// push 2 extra for allocation, push Brother index, alloc 1

	// Get Brother name
	mov	r1,r2
	bl	0x200C92C
	mov	r4,r0		// name
	mov	r5,r0		// temporary

	bl	field_drawBrotherNameOrder

@@drawName:
	mov	r5,(59)		// x
	mov	r6,0x0		// name part
	mov	r7,0x0		// char index
@@drawPart:

@@loop:
	ldrb	r0,[r4,r7]
	cmp	r0,0xE6
	beq	@@nameEnd

	// Center character
	ldr	r1,=0x20CB424	// font width table
	ldrb	r0,[r1,r0]
	mov	r1,0x9		// bias towards right; makes uppercase look better
	sub	r0,r1,r0
	lsr	r0,r0,0x1

	// Draw character
	ldr	r2,=0x40000026
	add	r0,r5,r0
	lsl	r0,r0,0x10
	orr	r2,r0
	mov	r3,(0x4800 >> 0x8)
	lsl	r3,r3,0x8
	mov	r0,0x61
	mov	r1,0x30
	mul	r1,r6
	add	r0,r0,r1
	lsl	r1,r7,0x1
	add	r0,r0,r1
	orr	r3,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

	// Increment x
	add	r5,0x8

	// Next char
	add	r7,0x1
	b	@@loop

@@nameEnd:
	// Skip space for Boktai Brother
	ldr	r1,[sp,0x8]	// Brother index
	bl	0x200BDC8
	cmp	r0,0x81
	beq	@@nextPart
@@addSpace:
	add	r5,0x8
@@nextPart:
	ldr	r4,[sp,0xC]	// go to next name part
	mov	r7,0x0		// char index
	add	r6,0x1		// name part
	cmp	r6,0x2
	blt	@@drawPart

	pop	r0-r7,r15	// dealloc 2 extra

	.pool
.endarea


// Walk through NPCs
.org 0x2170A2A
	bl	field_walkThroughNPC
.org 0x21709B4
	bl	field_walkThroughNPCStop
.org 0x2171120
	bx	r14
.area 0x8E,0x00
field_walkThroughNPC:
	push	r14

	mov	r1,0x2
	bl	0x21713A4
	cmp	r0,0x1
	bne	@@canWalk

	ldrb	r0,[r4,0xF]
	cmp	r0,0x28
	bge	@@passThrough

	add	r0,0x1
	strb	r0,[r4,0xF]

@@cannotWalk:
	mov	r0,0x1
	b	@@end

@@canWalk:
	mov	r0,0x0
	strb	r0,[r4,0xF]
	b	@@end

@@passThrough:
	mov	r0,0x0

@@end:
	pop	r15

field_walkThroughNPCStop:
	push	r0,r14

	// Check if inside NPC
	// r0 already set
	mov	r1,0x2
	bl	0x217121C
	cmp	r0,0x0
	bne	@@end

	// Reset walk through NPC counter
	mov	r0,0x0
	strb	r0,[r4,0xF]

@@end:
	ldrh	r1,[r4,0xC]
	strb	r1,[r4,0x1]
	pop	r0,r15
.endarea


// Change auto-favorites timing
.org 0x2176AC2
	mov	r1,0x0
.org 0x2176C2C
.area 0x18
	ldr	r1,=0xF17C
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	0x2176C16	// jumps to 0x2176E74
	ldr	r1,=0xF17C
	bl	0x202405C	// clear flag
	ldr	r0,[0x2176F30]
	b	0x2176C44
	.pool
.endarea


// Y = (un)mark as fav, Select = remove all
.org 0x217571C
.area 0x24,0x00
	// r0 = 0x53A
	ldrh	r1,[r5,r0]
	lsr	r2,r1,0xC
	bcc	@@checkSelect

	// (Un)mark as favorite
	mov	r0,r5
	bl	0x217A7D0

	// Set up button press stuff
	b	0x2175790

@@checkSelect:
	lsr	r2,r1,0x3
	bcc	0x217579C

	// Check amount of cards
	add	r0,0x10
	ldrb	r1,[r5,r0]
	mov	r0,r5
	bl	field_canEmptyFolder
	cmp	r0,0x0
	beq	0x2175772	// error

	// Start Favorites menu
	b	0x2175740
.endarea

.org 0x2175772
.area 0x1E,0x00
	// Play error SFX
	ldr	r0,[0x2175940]
	ldr	r0,[r0]
	mov	r1,0x69
	bl	0x2025574

	// Go to end
	b	0x2175E68
.endarea

// No "can't fav this card" message on empty slot
.org 0x217A834
	beq	0x217A886

// Don't go into Enter Fav mode on exit without 6 favs
.org 0x2176A52	// pressed B
	b	0x2176AD0
.org 0x2176AD0
.area 0x1E,0x00
	ldr	r0,[0x2176C00]	// 0x21A744C
	ldr	r1,[r0,0x18]
	ldr	r0,[r0,0x1C]
	str	r1,[r4,0xC]
	str	r0,[r4,0x10]
	ldr	r0,[0x2176BF8]	// 0x572
	mov	r1,0x0
	strb	r1,[r4,r0]
	b	0x2176B34
.endarea


// Handle Remove All
.org 0x217676C
.area 0xD6,0x00
	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@end

	// Check confirm
	mov	r0,0x2
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	bne	@@wait

	// Check choice
	bl	0x2008DC0
	cmp	r0,0x0
	bne	@@end

	// Remove all cards
	mov	r5,0x0
@@loop:
	// Get card index
	ldr	r0,[r4,0x14]
	mov	r1,0x2
	bl	0x2015E94
	lsl	r1,r5,0x2
	ldr	r2,[r0,r1]

	// Get card data
	ldr	r1,[r4,0x1C]
	mov	r0,0x12
	mul	r0,r2
	add	r1,r1,r0
	ldrh	r0,[r1,0x2]	// card ID
	cmp	r0,0x0
	beq	@@next

	// Check Legend Card
	cmp	r0,0xFF
	ble	@@removeCard
	sub	r0,0xFF
	cmp	r0,0xA		// 0x100 - 0x109
	bgt	@@next

@@removeCard:
	// Push card data on stack
	sub	sp,0x14
	mov	r0,sp
	bl	0x2176F4C

	// Add to card box
	pop	r1-r3
	mov	r0,r4
	bl	0x217909C
	add	sp,0x8

	// Remove from folder
	mov	r0,r4
	mov	r1,0x0
	mov	r2,r5
	bl	0x2179568

@@next:
	add	r5,0x1
	cmp	r5,0x26
	blt	@@loop

	// Set list update
	mov	r0,0x1
	ldr	r1,=0x56A
	strb	r0,[r4,r1]

@@end:
	ldr	r0,=0x21A744C
	ldr	r1,[r0,0x18]
	ldr	r0,[r0,0x1C]
	str	r1,[r4,0xC]
	str	r0,[r4,0x10]
	ldr	r0,=0x572
	mov	r1,0x0
	strb	r1,[r4,r0]
@@wait:
	bl	0x2176B34	// may be out of range for short jump

	.pool
.endarea

//.org 0x2178938
//	nop	::	nop
//.org 0x217893E
//	nop	::	nop


.org 0x2186BAC
	// Mega Screen Scanner options
	// Load subscreen_local_187.bin instead of subscreen_162.bin
	dw	((31 << 16) | (187))


.org 0x2158C54
	bl	field_subcardIcons
	b	0x2158D40
// Turn remainder of routine into standalone routine
.org 0x2158C5A
	push	r0-r1,r14	// push extra from allocation
.org 0x2158C72
	pop	r0-r1,r15


.org 0x217D990
	bl	field_boktaiBrotherScreenExit

.org 0x2182FFC
	bl	field_sendingToNpcPress
.org 0x2184BF4
	bl	field_sendingToNpcHighlight
.org 0x218315E
	bl	field_composeSendMail
.org 0x2185422
	bl	field_removeMailAttachment

.org 0x21580BE
	bl	field_composeChooseBrother
.org 0x21580EC
	bl	field_composeChooseBrotherAlreadySent

.org 0x2182360
	bl	field_composeGotoIcon
.org 0x2182A86
	bl	field_prefillBoktaiMail
.org 0x2182838
	bl	field_prefillBoktaiMail	// TODO check if you don't have a present

.org 0x2158D08
	bl	field_satelliteTranserIcon
	add	r1,0x94


.org 0x217531A
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5

.org 0x21771E6
	bl	field_folderDrawLabelFolder

.org 0x21774B4
	bl	field_folderDrawStarFolder

.org 0x2177690
	bl	field_folderDrawLabelPack

.org 0x21779B8
	bl	field_folderDrawStarPack

.org 0x217799E
	add	r0,0x1B		// Fix icon alignment for Card Trader


.org 0x2177E02
	bl	field_folderDrawSwapIconFolder
.org 0x2177E7A
	bl	field_folderDrawSwapIconPack


.org 0x21780FE	// Folder
	bl	field_folderPrintCardDesc
.org 0x2178264
	bl	field_folderPrintCardDescReal
.org 0x21784F0	// Pack
	bl	field_folderPrintCardDesc
.org 0x2178646
	bl	field_folderPrintCardDescReal


.org 0x217BBB4
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5
.org 0x217C928
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5

.org 0x219C05C
	.dh	0xB200 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x219C074
	.dh	0xBA00 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)


.org 0x219C058	// Library icon tile
	.dw	0xBC00
.org 0x219C070
	.dw	0xBC00
.org 0x219C088	// Used in Card Trader
	.dw	0xBC00


// Move attack value on card
.org 0x2178242
	mov	r2,0x5
.org 0x21782AA
	strh	r0,[r4,0x10]
.org 0x21782AE
	strh	r0,[r4,0x28]
.org 0x21782BA
	strh	r2,[r0,0x12]
.org 0x21782BC
	strh	r1,[r0,0x2A]
.org 0x2178632
	mov	r2,0x5
.org 0x217868C
	strh	r0,[r5,0x10]
.org 0x2178690
	strh	r0,[r5,0x28]
.org 0x217869E
	strh	r1,[r3,0x12]
.org 0x21786A2
	strh	r0,[r3,0x2A]
.org 0x21786F2	// new
	strh	r1,[r3,(0x5 * 0x2)]
.org 0x21786F6	// new
	strh	r0,[r3,(0x5 * 0x2 + 0x18)]

// Move bonus attack value on card
.org 0x2178654
	strh	r1,[r5,0x10]
.org 0x2178658
	strh	r1,[r5,0x28]
.org 0x2178664
	mov	r2,0x9
.org 0x2178272
	strh	r1,[r4,0x10]
.org 0x2178276
	strh	r1,[r4,0x28]
.org 0x2178282
	mov	r2,0x9


// Add Cipher mails
.org 0x2183E96	// Calculate body script ID
.area 0x8,0x00
	lsl	r1,r4,0x1
	add	r1,0x1
.endarea
.org 0x2183F06	// Calculate subject script ID
.area 0x8,0x00
	lsl	r1,r4,0x1
.endarea
.org 0x2184020	// Get next Cipher mail data
.area 0x12,0x00
	add	r4,0x1
	mov	r0,r4
	bl	0x2008160	// get Cipher mail data
	cmp	r0,0x0
	beq	0x2184032
	b	0x2183E74
.endarea
.org 0x2183F56	// Get Cipher mail flag
.area 0x8,0x00
	mov	r0,r4
	bl	common_getCipherMailFlag
	str	r0,[sp]
.endarea
.org 0x2183F60
	bl	field_checkLegendModeCipherMail


.org 0x21555DA	// Prevent deleting Boktai Brother if mail to them
.area 0x82,0x00
	// Check if this is a Boktai Brother
	ldr	r1,[0x2155734]	// 0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	bl	0x200BDC8	// get Boktai Brother type
	cmp	r0,0x81
	beq	@@boktai

	// Check game clear
	mov	r1,(0x800 >> 0xA)
	lsl	r1,r1,0xA
	bl	0x202409C	// check flag 0x800
	bne	0x215565C	// delete OK

	// Check if this is L.M. Shin or Real Brother
	ldr	r1,[0x2155734]	// 0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	bl	0x200D04C	// get Brother type
	lsl	r0,r0,0x18	// test 0x100
	bcs	0x215565C	// delete OK
	lsr	r0,r0,0x18
	cmp	r0,0xD
	beq	0x215565C	// delete OK
	b	@@noDelete

@@boktai:
	// Check if Cipher/Boktai mail sent
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFC
	ldrb	r1,[r0]
	cmp	r1,0x0
	beq	0x215565C	// delete OK

	// Check if sent to this Brother
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = Boktai Brother ID for mail
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1C

	ldr	r1,[0x2155734]	// 0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	cmp	r0,r1
	bne	0x215565C

@@noDelete:
	// Can't delete
	mov	r0,r4
	mov	r1,0xD		// script 13
	bl	0x2151ED4	// start text script

	ldr	r0,[0x215571C]	// 0xAE5
	mov	r1,0x37
	strb	r1,[r4,r0]
	b	0x215575E

	.pool
.endarea


.org 0x2155E90
	bl	field_overwriteBoktaiBrotherWithRealBrother

.org 0x2155DBC
	bl	field_checkOverwriteBoktaiBrotherWithMail


// Brother Screen load function.
// Adds Boktai Bros. compatibility.
.org 0x217DA54
.area 0x5A4,0x00
	push	r4-r7,r14
	mov	r5,r0

	ldr	r0,=0x2117B34
	mov	r1,0x1
	ldr	r2,=0x111F10
	bl	0x201069C

	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x13
	bl	0x200B04C
	ldr	r0,=0x210F350
	mov	r1,0x1
	bl	0x200B0DC
	ldr	r0,=0x210F350
	mov	r1,0x1
	bl	0x200B550
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r2,0xF
	bl	0x202E4CC
	ldr	r0,=0x21239A4
	mov	r1,0x1
	bl	0x202E588
	ldr	r0,=0x2117B34
	mov	r1,0x1
	bl	0x2010708
	ldr	r0,=0x2117B34
	mov	r1,0x1
	bl	0x20106CC

	mov	r0,0x20
	bl	0x2015C70
	cmp	r0,0x0
	beq	@@alloc
	ldr	r1,=0xDDA0
	mov	r2,0x1A
	bl	0x2015D4C
@@alloc:
	str	r0,[r5,0xC]

	// Allocate the buffers, short version by looping
	ldr	r6,=field_boktaiBrotherScreenBuffers
	mov	r4,0x0		// i * 2
	b	@@alloc_start
@@alloc_loop:
	ldr	r0,[r5,0xC]
	lsr	r2,r4,0x1	// get i
	bl	0x2015E1C
	add	r4,0x2
@@alloc_start:
	ldrh	r1,[r6,r4]
	cmp	r1,0x0
	bne	@@alloc_loop
@@alloc_end:

	// Load message files into the buffers.
	ldr	r0,=((29 << 16) | (11))
	mov	r1,0x0
	bl	@loadFileToBuffer
	add	r0,0x1		// get (29, 12)
	mov	r1,0x16
	bl	@loadFileToBuffer
	// Load Battle Card data.
	ldr	r0,[r5,0xC]
	mov	r1,0x8
	bl	0x2015E94
	mov	r1,r0
	ldrh	r0,[r6,0x8*0x2]	// get buffer 8 size
	push	r0		// alloc 1 int on stack
	ldr	r0,=0x211C998
	ldr	r2,=0x160003
	mov	r3,0x0
	bl	0x2012354

	// Load some more data into the buffers.
	// Moved to earlier spot compared to original function.
	ldr	r0,=((31 << 16) | (40))
	mov	r1,0x18
	bl	@loadFileToBuffer
	add	r0,0x32		// get (31, 90)
	mov	r1,0x2
	bl	@loadFileToBuffer
	add	r0,0x5		// get (31, 95)
	mov	r1,0x4
	bl	@loadFileToBuffer

	// Get Brother specific data.
	ldr	r0,=0x2117354
	ldr	r0,[r0]
	ldr	r1,=0x779
	add	r1,0x4
	ldrb	r1,[r5,r1]	// get brother index
	push	r0-r1		// need these for several routines
	// Get Brother type
	bl	0x200D04C
	mov	r4,r0		// r4 = brother type
	ldr	r0,[sp]
	ldr	r1,[sp,0x4]
	// Get Brother Satellite
	bl	0x200BDC8
	mov	r6,r0		// r6 = brother satellite

@@face:
	// Get Brother face pic.
	lsr	r0,r4,0x9	// carry = type & 0x100
	bcs	@@face_end
	lsl	r0,r4,0x18
	lsr	r0,r0,0x18	// r0 = type & 0xFF = NPC ID
	cmp	r6,0x81
	bne	@@faceNpc
@@faceBoktai:
	ldr	r0,[sp]
	ldr	r1,[sp,0x4]
	// Get Brother data pointer
	bl	0x200C93C
	mov	r1,0x3E
	lsl	r1,r1,0x4
	ldrb	r0,[r0,r1]	// get Boktai face pic index
	add	r0,0x80		// r0 = Boktai NPC ID
@@faceNpc:
	// Get NPC pointer
	bl	0x2007F0C
	mov	r7,r0
	ldr	r0,[r7,0x4]
	mov	r1,0x1
	bl	@loadFileToBuffer
	ldr	r0,[r7,0x8]
	mov	r1,0x15
	bl	@loadFileToBuffer
@@face_end:

	mov	r0,0x20
	push	r0
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r2,0x4
	ldr	r3,=0x20CB364
	bl	0x202F338
	add	sp,0x4
	mov	r0,r5
	bl	0x217DFF8

	// Load the Brother name.
	pop	r0-r1		// don't need these anymore
	// Get Brother name
	bl	0x200C92C
	mov	r1,r0
	mov	r2,(0x1840 >> 0x6)

	lsr	r0,r4,0x9	// carry = type & 0x100
	bcs	@@nameFirstLast
	cmp	r6,0x81		// Lunar Knights
	beq	@@nameFirstLast	// new
	ldr	r0,=0x820D	// new
	cmp	r4,r0		// new
	bne	@@nameLastFirst
@@nameFirstLast:
	bl	@loadName
	add	r1,0xE
	b	@@namePart2
@@nameLastFirst:
	add	r1,0xE
	bl	@loadName
	sub	r1,0xE
@@namePart2:
	mov	r2,(0x2440 >> 0x6)
	bl	@loadName

	mov	r7,0x20		// ok look, just trust me on this one
	ldr	r0,=0x21239A4
	mov	r1,0x1
	ldr	r3,=0x20CB364
	str	r7,[sp]		// for 3rd call
	push	r0-r1		// need these for 3 calls
	push	r0-r1,r3,r7	// need these for 2 calls
	push	r7		// for 1st call
	mov	r2,0x0
	bl	0x202F170
	add	sp,0x4
	pop	r0-r1,r3	// fetch for 2nd call
	mov	r2,0x3
	add	r3,0x20
	bl	0x202F170
	add	sp,0x4

	ldr	r1,=((7 << 16) | (108))
	bl	@loadFileToHeap
	mov	r3,r1
	pop	r0,r1,r2	// fetch for 3rd call
	push	r2,r3		// move r2 (0x20) to bottom of stack, push r3
	mov	r2,0x1
	bl	0x202F170
	add	sp,0x4

	pop	r2		// pop r2, free the allocated space
	bl	@freeFromHeap

	push	r7		// r7 = total size = 0x20, r7 is still 0x20
	mov	r7,0x0		// r7 = i
@@load_loop:
	ldr	r0,=0x219C2D8
	lsl	r1,r7,0x3
	add	r0,r0,r1
	ldr	r1,[r0,0x4]	// needed for next file load
	push	r1		// push next file ID
	ldr	r1,[r0]
	bl	@loadFileToHeap
	push	r0,r1		// push size for call; save buffer pointer
	mov	r3,r1
	ldr	r0,=0x21239A4
	mov	r1,0x1
	ldr	r2,[sp,0xC]	// get total size
	bl	0x202EEE8
	pop	r0-r3		// r0 = size, r1 = buffer ptr, r2 = next id, r3 = total size
	add	r3,r3,r0	// increment total size
	push	r2,r3		// push next ID, new total size
	mov	r2,r1
	bl	@freeFromHeap

	pop	r0		// pop next ID
	add	r1,r7,0x5
	bl	@loadFileToBuffer

	add	r7,0x1
	cmp	r7,0x3
	blt	@@load_loop
	add	sp,0x4

@@screen:
	lsr	r0,r4,0x9	// carry = type & 0x100
	bcs	@@screenNormal
	cmp	r6,0x81
	bne	@@screenNormal
@@screenBoktai:
	// Load sprites.
	ldr	r0,=((31 << 16) | (135))
	mov	r1,0x3
	bl	@loadFileToBuffer

	// Load palette.
	ldr	r1,=((31 << 16) | (135))
	add	r1,0x2		// get (31, 137)
	bl	@loadFileToHeap
	mov	r4,r1
	mov	r0,0x2
	lsl	r0,r0,0x8
	push	r0
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r2,0x0
	mov	r3,r4
	bl	0x202F1FC
	mov	r2,r4
	bl	@freeFromHeap

	// Load tileset.
	ldr	r1,=((31 << 16) | (135))
	add	r1,0x1		// get (31, 136)
	bl	@loadFileToHeap
	mov	r4,r1
	mov	r0,0x70
	lsl	r0,r0,0x8
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r2,0x40
	mov	r3,r4
	bl	0x202EEA0
	mov	r2,r4
	bl	@freeFromHeap

	// Load tilemap.
	ldr	r1,=((31 << 16) | (135))
	add	r1,0x3		// get (32, 138)
	bl	@loadFiletoHeap
	mov	r4,r1
	mov	r0,0x20
	mov	r1,0x18
	push	r0,r1
	mov	r0,0x0
	mov	r2,0x0
	push	r0,r2
	push	r0,r2
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r3,r4
	bl	0x200B748
	mov	r2,r4
	bl	@freeFromHeap
	add	sp,0x1C

	// Enable Boktai Brother Screen
	ldr	r1,=0x779
	mov	r0,0x1
	strb	r0,[r5,r1]

	b	@@screen_end

@@screenNormal:
	mov	r0,r5
	bl	0x217F37C

@@screen_end:
	mov	r0,r5
	bl	0x217EBEC
	mov	r0,r5
	bl	0x217E304
	mov	r0,r5
	bl	0x217E43C
	mov	r0,r5
	bl	0x217E914
	mov	r0,r5
	bl	0x217E9A0

	ldr	r0,=0x779
	ldrb	r0,[r5,r0]
	cmp	r0,0x0
	bne	@@end
	mov	r0,r5
	bl	0x217EC9C
@@end:
	mov	r0,r5
	bl	0x217EEEC

	pop	r4-r7,r15


@loadFileToBuffer:
	// in:  r0 = archive, subfile indexes, r1 = buffer index
	// out: r0 = archive, subfile indexes
	push	r0,r14		// save r0 for caller and self

	ldr	r0,[r5,0xC]
	bl	0x2015E94
	mov	r1,r0
	ldr	r0,=0x211C998
	ldr	r2,[sp]
	bl	0x201231C

	pop	r0,r15

@loadFileToHeap:
	// in:  r1 = archive, subfile indexes
	// out: r0 = size, r1 = buffer pointer
	push	r0-r1,r14	// save r1 for self, alloc 1 on stack (r0)

	ldr	r0,=0x211C998
	// Get file size
	bl	0x20122F8
	str	r0,[sp]		// save size for return
	mov	r2,r0
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1		// heap 1
	// Alloc on heap
	bl	0x20155DC
	mov	r1,r0
	ldr	r0,=0x211C998
	ldr	r2,[sp,0x4]	// get original r1
	str	r1,[sp,0x4]	// save buffer pointer for return
	// Load file
	bl	0x201231C

	pop	r0-r1,r15	// return saved vars

@freeFromHeap:
	// in:  r2 = buffer pointer
	push	r14
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x2015620
	pop	r15

@loadName:
	// r0 = discard, r1 = name ptr, r2 = p2 for sub_2F0F4 >> 6
	push	r0-r2,r4-r5,r14	// save r1 for caller and self, alloc 1 on stack (r0)

	ldr	r4,=0x211CCFC
	ldr	r0,[r4]
	mov	r1,0x0
	ldr	r2,=0xC00
	// Allocate 0xC00 bytes on heap
	bl	0x20155DC
	mov	r5,r0		// r4 = heap buffer

	ldr	r0,=0x2122A34
	ldr	r0,[r0]
	mov	r1,r5
	ldr	r2,=0xC00
	// Clear buffer
	bl	0x202DF14

	ldr	r0,[sp,0x4]	// get name ptr
	mov	r1,0x0
	str	r1,[sp]
	mov	r2,r5
	ldr	r3,=0xC00
	bl	0x20089AC

	ldr	r0,=0xC00
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x1
	ldr	r2,[sp,0x8]	// get p2 for sub_2F0F4
	lsl	r2,r2,0x6
	mov	r3,r5
	bl	0x202F0F4

	ldr	r0,[r4]
	mov	r1,0x0
	mov	r2,r5
	// Free buffer
	bl	0x2015620

	pop	r0-r2,r4-r5,r15



field_boktaiBrotherScreenExit:
	push	r14

	// Play exit SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x8B
	bl	0x2025574

	// Exit screen
	mov	r0,r4
	bl	0x217E1B8

	pop	r15

	.pool


field_sendingToNpcPress:
	push	r1,r14

	// Compare to own address (Cipher)
	bl	0x200DA70
	pop	r1
	cmp	r0,0x0
	bne	@@end

	// r0 = 0
	sub	r1,0x5
	ldrb	r1,[r1]		// brother version
	cmp	r1,0x81		// Boktai brother
	bne	@@end
	mov	r0,0x1		// Boktai is NPC

@@end:
	pop	r15


field_sendingToNpcHighlight:
	push	r4,r14

	// Compare to own address (Cipher)
	bl	0x200DA70
	mov	r4,r0
	bne	@@end

	// Check Boktai brother
	ldr	r1,=0x103F
	ldrb	r1,[r5,r1]
	bl	0x200BDC8	// get Brother Satellite
	cmp	r0,0x81		// Boktai brother

	mov	r4,0x1		// Boktai is NPC

@@end:
	mov	r0,r4
	pop	r4,r15


field_composeSendMail:
	push	r14

	// Check Boktai brother
	sub	r3,r1,0x5
	ldrb	r3,[r3]		// brother version
	cmp	r3,0x81
	bne	@@normal

	// Clear Boktai Brother mail variables
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer to Boktai Brother ID for mail
	mov	r1,0x0
	strb	r1,[r0]

	// Set function to be called
	ldr	r1,=processBoktaiMail|1
	mov	r0,0x0

	add	sp,0x4
	bl	0x218316C

@@normal:
	// Compare to own address (Cipher)
	bl	0x200DA70
	pop	r15


field_composeChooseBrother:
	// from 021580BE
	push	r5-r7,r14

	ldsh	r5,[r4,r0]	// get selected Brother
	cmp	r5,0x6
	beq	@@end

	// Convert to Brother ID
	add	r6,r5,0x1	// convert to Brother ID
	cmp	r6,0x7
	blt	@@checkAddress
	mov	r6,0x0

@@checkAddress:
	// Get player address
	mov	r1,0x0
	bl	0x200C610
	mov	r7,r0

	// Get Brother address
	mov	r1,r6
	bl	0x200C610

	// Check same
	mov	r1,r0
	mov	r2,r7
	bl	0x200DA70
	cmp	r0,0x0
	beq	@@getSatellite

	// Block from selecting entirely
	pop	r5-r7
	add	sp,0x4
	bl	0x21581A0

@@getSatellite:
	// Get Brother's Satellite
	mov	r1,r6
	bl	0x200BDC8

	// Check if this is a Boktai Brother
	cmp	r0,0x81
	bne	@@end

	// Check if already sent to Satellite or Boktai brother
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFC
	ldrb	r0,[r0]
	cmp	r0,0x0
	bne	@@alreadySent

	// Buffer Brother index
	mov	r0,0x0
	mov	r1,r6
	bl	0x2008DF0

	// Start script 39
	mov	r0,r4
	mov	r1,(39)
	bl	0x2151ED4

	// Skip ahead a bit
	pop	r5-r7
	add	sp,0x4
	bl	0x21580DA

@@alreadySent:
	// Block from sending (treat as Cipher for now)
	mov	r5,0x6

@@end:
	mov	r1,r5
	cmp	r1,0x6
	pop	r5-r7,r15


field_composeChooseBrotherAlreadySent:
	// from 021580EC
	// r4 = struct
	push	r14
	mov	r0,r4
	mov	r1,0x92		// script 146

	// Check if Boktai mail sent
	push	r0-r3
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = Boktai Brother ID for mail
	cmp	r0,0x0
	pop	r0-r3
	beq	@@end

	mov	r1,0x93		// script 147

@@end:
	pop	r15


field_composeGotoIcon:
	// from 0218235C
	push	r14

	// Check if Cipher
	ldr	r3,=0x103F
	ldrb	r3,[r4,r3]
	cmp	r3,0x0
	beq	@@isCipher

	push	r0-r3
	// Get Brother's Satellite
	mov	r1,r3
	bl	0x200BDC8

	// Check if this is a Boktai Brother
	cmp	r0,0x81
	pop	r0-r3
	beq	@@isBoktai

	b	@@normal

@@isBoktai:
	push	r0-r1
	add	r3,r4,r1

	// Set mail icon
	mov	r0,0x0
	strb	r0,[r3,0x11]	// envelope icon
	strb	r0,[r3,0x12]	// must be set to 0
	mov	r0,0x1
	strb	r0,[r3,0x13]	// icon cursor not blinking

	// Set Brother and icon entered flags
	ldrb	r0,[r3,0x15]
	mov	r1,0x3
	orr	r0,r1
	strb	r0,[r3,0x15]

	pop	r0-r1

	// Skip to choose present state
	mov	r2,0x7
	b	@@setReturn

@@isCipher:
	push	r0-r1
	add	r3,r4,r1

	// Set mail icon
	mov	r0,0x0
	strb	r0,[r3,0x11]	// envelope icon
	strb	r0,[r3,0x12]	// must be set to 0
	mov	r0,0x1
	strb	r0,[r3,0x13]	// icon cursor not blinking
//	strb	r0,[r3,0x14]	// skip going to enter subject

	// Set Brother, subject and icon entered flags
	ldrb	r0,[r3,0x15]
	mov	r1,0x7
	orr	r0,r1
	strb	r0,[r3,0x15]

	// Set mail subject pointer
	ldr	r0,[r4,0x1C]
	str	r0,[r3,0x18]

	// Set mail subject to "Cipher"
	ldr	r1,=0x48504923
	ldr	r2,=0x5245
	mov	r3,0x0
	stmia	[r0]!,r1-r3

	// Store mail subject
	ldr	r0,[r4,0x18]
	add	r0,0xC
	stmia	[r0]!,r1-r3

	// Display mail subject
	mov	r0,0x0
	push	r0
	mov	r0,r4
	mov	r1,0xD
	mov	r2,0x3
	lsl	r2,r2,0x8
	mov	r3,0x20
	bl	0x2184D78
	add	sp,0x4

	pop	r0-r1

	// Skip to write body state
	mov	r2,0xC

@@setReturn:
	// Modify return address
	ldr	r3,[sp]
	add	r3,0xA
	str	r3,[sp]

@@normal:
	str	r2,[r4,r1]
	mov	r2,0x0

	pop	r15


processBoktaiMail:
	// r0 = mail data pointer
	push	r5-r7,r14

	mov	r5,r0		// r5 = mail data pointer
	ldr	r6,=0x2120588
	ldr	r6,[r6]
	ldr	r6,[r6]
	add	r6,0xFC		// r6 = Cipher data pointer

	// Get temp storage for Boktai mail
	mov	r0,((0xF2B0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer to Boktai difficulty
	mov	r4,r0

	// Try to decode as password and store flags
	mov	r0,r5
	bl	common_getFlagsFromBoktaiPasswordMail

	// Write to temp storage
	strb	r1,[r4]		// 0xF2B0
	add	r4,0x10
	strb	r0,[r4]		// 0xF2B8
	lsr	r0,r0,0x8
	strb	r0,[r4,0x10]	// 0xF2C0
	add	r4,0x20
	lsr	r0,r0,0x8
	strb	r0,[r4]		// 0xF2C8
	lsr	r0,r0,0x8
	strb	r0,[r4,0x10]	// 0xF2D0

	// Get mail contents
	ldr	r4,[r5,0x18]

	// Check attached Sub Card
	mov	r0,0x44
	ldrb	r7,[r4,r0]	// r7 = attached Sub Card
	cmp	r7,0x0
	beq	@@setItem

//	// Reduce Sub Card count
//	mov	r0,r7
//	add	r0,0x66
//	bl	0x2007BAC

@@setItem:
	// Set Boktai Cipher mail Brother and item
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer to Boktai Brother ID for mail
	ldr	r1,=0x103F
	ldrb	r1,[r5,r1]	// Brother ID
	lsl	r2,r7,0x4	// item
	orr	r1,r2
	strb	r1,[r0]

	// Set Cipher mail value
	mov	r0,0x80
	strb	r0,[r6]

	// Set next function
	ldr	r1,=0x21A770C
	ldr	r0,[r1,0x48]
	ldr	r1,[r1,0x4C]
	str	r0,[r5,0x4]
	str	r1,[r5,0x8]

	// Start script 45
	mov	r0,r5
	mov	r1,0x2D
	mov	r2,0x18
	bl	0x2184E8C

	// Set some value
	ldr	r1,=0x104A
	mov	r0,0x1
	strb	r0,[r5,r1]

	// Update display
	sub	r1,0xC		// r1 = 0x103E
	ldrb	r0,[r5,r1]
	cmp	r0,0x0
	bne	@@end

	mov	r0,r5
	bl	0x2184420

@@end:
	pop	r5-r7,r15



field_brotherLoadLeoWindow:
	push	r14
	bl	common_getPlayerSatellite
	cmp	r0,0x1
	ldr	r0,[r5,0x18]
	beq	@@leo

@@normal:
	mov	r1,0x8
	pop	r15

@@leo:
	add	sp,0x4		// undo push

	// For some reason this is different for Leo only...
	mov	r1,0x9
	bl	0x2015E94
	mov	r3,r0
	mov	r0,0x76
	lsl	r0,r0,0x8
	str	r0,[sp]
	mov	r0,0x8
	str	r0,[sp,0x4]
	lsl	r0,r0,0xC
	ldr	r1,=0x21524DD
	bx	r1



	.pool
.endarea


.org 0x217AB18	// Extend Folder Edit checks
.area 0x4E0,0x00
	push	r4-r7,r14
	sub	sp,0x14
	mov	r5,r0
	mov	r4,r1

	// Folder buffer
	ldr	r0,[r5,0x14]
	mov	r1,0x2
	bl	0x2015E94	// get buffer with ID
	mov	r6,r0

	// Card Box buffer
	ldr	r0,[r5,0x14]
	mov	r1,0x3
	bl	0x2015E94	// get buffer with ID
	mov	r7,r0

	ldr	r3,=0x546
	add	r3,r5,r3

	// Seek to the right slots
	cmp	r4,0x1
	beq	@@toCardBox

@@toFolder:
	mov	r0,(0x552-0x546)
	mov	r1,(0x546-0x546)
	b	@@seekBuffers

@@toCardBox:
	mov	r0,(0x54C-0x546)
	mov	r1,(0x552-0x546)

@@seekBuffers:
	// Set Card Box
	ldsh	r2,[r3,r0]
	add	r0,0x2
	ldsh	r0,[r3,r0]
	add	r0,r0,r2
	lsl	r0,r0,0x2
	add	r7,r7,r0

	// Seek Folder
	ldsh	r2,[r3,r1]
	add	r1,0x2
	ldsh	r1,[r3,r1]
	add	r1,r1,r2
	lsl	r0,r1,0x2
	add	r6,r6,r0

	// Set Legend Card slot
	cmp	r4,0x2
	bne	@@setLegendCardSlot

	mov	r0,(0x54A-0x546)
	ldrh	r1,[r3,r0]
	sub	r1,0x1

@@setLegendCardSlot:
	lsl	r3,r1,0x18
	lsr	r3,r3,0x18
	str	r3,[sp]		// Legend Card slot

	// Get card data
	ldr	r6,[r6]
	ldr	r7,[r7]
	mov	r0,0x12
	mul	r6,r0
	mul	r7,r0
	mul	r3,r0
	ldr	r0,[r5,0x1C]	// Folder
	ldr	r1,[r5,0x20]	// Card Box
	add	r6,r0,r6	// Card data going to Card Box
	add	r7,r1,r7	// Card data going to Folder
	add	r3,r0,r3	// Card data for Legend Card slot

	str	r3,[sp,0x4]	// Card data for Legend Card slot

	ldrh	r2,[r6,0x2]	// Card going to Card Box
	ldrh	r3,[r7,0x2]	// Card going to Folder

@@checkTakeOutOfFolder:
	// No card going to Folder is always OK
	cmp	r3,0x0
	beq	@@returnTrueFwd

@@checkSwapWithSame:
	// Not valid if adding from pack
	cmp	r4,0x2
	beq	@@checkStarTicket

	// Check cards have same ID
	cmp	r2,r3
	bne	@@checkStarTicket

	ldrb	r0,[r7,0xE]	// Card color going to Folder
	cmp	r0,0x2
	bge	@@checkMegaGigaMax
	b	@@checkStarCards

// START STAR TICKET
@@checkStarTicket:
	// Check if card is Star Ticket
	cmp	r3,(251)
	bne	@@checkLegendCard

	mov	r1,(26)		// Putting Star Ticket in Folder
	b	@@showError
// END STAR TICKET

// START LEGEND CARDS
@@checkLegendCard:		
	// Check if card going to Folder is a Legend Card
	cmp	r3,0xFF
	ble	@@checkBattleCardIntoWrongSlot

@@checkSwapBattleCardWithLegendCard:
	// Not valid if adding from pack
	cmp	r4,0x2
	beq	@@checkTooManyLegendCards

	// Check if card going to Card Box is a Legend Card
	cmp	r2,0xFF
	bgt	@@returnTrueFwd

	// Check if card going to Card Box is a Battle Card
	cmp	r2,0x0
	beq	@@checkLegendCardIntoWrongSlot

	mov	r1,0x12		// Swapping Battle Card with Legend Card
	b	@@showError

@@checkLegendCardIntoWrongSlot:
	// Get Legend Card slot
	ldr	r0,[sp]
	cmp	r0,0x1E
	bge	@@checkTooManyLegendCards

	mov	r1,0x10		// Moving Legend Card into wrong slot
	b	@@showError

@@checkTooManyLegendCards:
	// Check already a Legend Card in the slot
	ldr	r0,[sp,0x4]
	ldrh	r0,[r0,0x2]
	cmp	r0,0xFF
	blt	@@returnTrueFwd

	mov	r1,0x11		// Too many Legend Cards
	b	@@showError
// END LEGEND CARDS

// START BATTLE CARDS
@@checkBattleCardIntoWrongSlot:
	// Not valid if adding from pack
	cmp	r4,0x2
	beq	@@checkSameCardCount

	// Get Legend Card slot
	ldr	r0,[sp]
	cmp	r0,0x1E
	blt	@@checkSameCardCount

	mov	r1,0x13		// Moving Battle Card into wrong slot
	b	@@showError

@@checkSameCardCount:
	// Get number of times card is in Folder
	mov	r0,r5
	mov	r1,r3		// Card going to Folder
	bl	0x217B044	// r0 = card count

	ldrb	r1,[r7,0xE]	// Card color going to Folder
	cmp	r1,0x2
	bge	@@checkSameMegaGigaCount

@@checkSameStandardCount:
	cmp	r0,0x4		// Max number of same Standard
	blt	@@checkStarCards

	mov	r1,0xC		// Adding more than 4 same Standard
	b	@@showError
// END STANDARD CARDS

@@returnTrueFwd:
	b	@@returnTrue	// Branch target too far away for above code

// START MEGA/GIGA CARDS
@@checkSameMegaGigaCount:
	cmp	r0,0x1
	blt	@@checkSameColorSwap

	mov	r1,0xB		// Adding more than 1 same Mega/Giga
	b	@@showError

@@checkSameColorSwap:
	cmp	r4,0x2
	beq	@@checkMegaGigaMax

	// r1 = card color going to Folder
	ldrb	r0,[r6,0xE]	// Card color going to Card Box
	cmp	r0,r1
	beq	@@returnTrue

@@checkMegaGigaMax:
	// r1 = card color going to Folder
	cmp	r1,0x3
	beq	@@getGigaMax

@@getMegaMax:
	mov	r0,0xA
	bl	0x20335D4	// Get Mega Class+ from Brothers
	add	r3,r0,0x5	// Base = 5

	bl	0x20228D4	// Check Wave Scanner active
	cmp	r0,0x0
	beq	@@capMegaMax

	mov	r0,0x16
	bl	0x20335D4	// Get Mega Class+ from Wave Scanner
	add	r3,r3,r0

@@capMegaMax:
	mov	r2,0x1		// Library = Mega
	cmp	r3,0xA
	ble	@@getMegaGigaCount
	mov	r3,0xA
	b	@@getMegaGigaCount

@@getGigaMax:
	mov	r0,0xB
	bl	0x20335D4	// Get Giga Class+ from Brothers
	add	r3,r0,0x1	// Base = 1

	bl	0x20228D4	// Check Wave Scanner active
	cmp	r0,0x0
	beq	@@capGigaMax

	mov	r0,0x17
	bl	0x20335D4	// Get Giga Class+ from Wave Scanner
	add	r3,r3,r0

@@capGigaMax:
	mov	r2,0x2		// Library = Giga
	cmp	r3,0x5
	ble	@@getMegaGigaCount
	mov	r3,0x5

@@getMegaGigaCount:
	// r2 = library
	mov	r0,r5
	ldrh	r1,[r7,0x2]	// Card going to Folder
	bl	0x217AFF8	// Get number of cards with library in Folder
	cmp	r0,r3
	blt	@@returnTrue

	// Buffer max count
	mov	r0,0x0
	mov	r1,r3
	bl	0x2008DF0

	ldrb	r1,[r7,0xE]	// Card color going to Folder
	add	r1,(0x9-0x2)	// Script 9, color 0x2
	b	@@showError
// END MEGA/GIGA CARDS

// START STAR CARDS
@@checkStarCards:
	// Check card going to Folder is Star Card
	ldrb	r0,[r7,0xC]	// Color flags going to Folder
	lsr	r0,r0,0x3	// test 0x4
	bcc	@@returnTrue

	// Check card going to Card Box is Star Card
	cmp	r4,0x2
	beq	@@countStarCards

	ldrb	r0,[r6,0xC]	// Color flags going to Card Box
	lsr	r0,r0,0x3	// test 0x4
	bcc	@@countStarCards

	ldrb	r0,[r6,0xE]	// Library going to Card Box
	cmp	r0,0x1
	beq	@@returnTrue

@@countStarCards:
	// Get pointer to Folder
	ldr	r0,[r5,0x14]
	mov	r1,0x4
	bl	0x2015E94	// get buffer with ID

	mov	r4,0x0		// Star Card count, redefines r4!!!

@@loopCountStarCards:
	ldrh	r1,[r0]		// card ID
	ldrb	r2,[r0,0x2]	// color flags
	ldrb	r3,[r0,0x3]	// count
	add	r0,0x4

	cmp	r1,0x0
	beq	@@returnTrue	// End of Folder reached without hitting max

	cmp	r1,0xA8
	bgt	@@loopCountStarCards
	lsr	r2,r2,0x3	// test 0x4
	bcc	@@loopCountStarCards

	add	r4,r4,r3
	cmp	r4,0x5		// 5 is max
	blt	@@loopCountStarCards

	mov	r1,0x19		// Too many Star Cards
	b	@@showError
// END STAR CARDS

@@showError:
	// r1 already set
	mov	r3,0x1
	str	r3,[sp]
	mov	r0,0x20
	str	r0,[sp,0x4]
	mov	r0,0xE
	lsl	r0,r0,0xC
	str	r0,[sp,0x8]
	mov	r0,0xF
	str	r0,[sp,0xC]
	mov	r0,0xD
	str	r0,[sp,0x10]
	ldr	r0,=0x1D0003
	mov	r2,0x0
	bl	0x20084F0	// start message

@@undoMove:
	ldr	r1,=0x21A73CC
	ldr	r0,[r1,0x40]
	ldr	r1,[r1,0x44]
	str	r0,[r5,0xC]
	str	r1,[r5,0x10]

@@returnFalse:
	mov	r0,0x0
	b	@@end

@@returnTrue:
	mov	r0,0x1
@@end:
	add	sp,0x14
	pop	r4-r7,r15

	.pool
.endarea


// Adjust Gold Mystery Wave contents to have Star Cards
.org 0x21A0728	// Echo Ridge (ID 0xA03)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(24)		// WideSword *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(14)		// HeatBall1 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(131)		// Recover120 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(183)		// TaursFireSP
	.db	0x00
.org 0x21A0810	// Geo's Living Room (ID 0xA0A)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(10)		// AirSpread *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(14)		// HeatBall1 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(131)		// Recover120 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(8)		// Gatling2 *
	.db	0x00
.org 0x21A08F8	// Geo's Room (ID 0xA12)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(23)		// Sword *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(24)		// WideSword *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(131)		// Recover120 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(10)		// AirSpread *
	.db	0x00
.org 0x21A0E60	// AMAKEN Grounds (ID 0xA43)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(21)		// PoisNukle *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(5)		// PlasmaGun2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(57)		// WideWave3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(12)		// RdrMissil2 *
	.db	0x00
.org 0x21A0F30	// AMAKEN Foyer (ID 0xA4A)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(21)		// PoisNukle *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(23)		// Sword *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(2)		// PlusCannon *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(18)		// IceMeteor2 *
	.db	0x00
.org 0x21A1000	// Science Museum (ID 0xA52)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(10000)		// 10000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(5)		// PlasmaGun2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(12)		// RdrMissil2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(18)		// IceMeteor2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(186)		// CygnsWingSP
	.db	0x00
.org 0x21A1268	// Foyer (ID 0xA83)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(133)		// Recover200 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(118)		// GreenBurst *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(20)		// StunNukle *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(189)		// HarpNoteSP
	.db	0x00
.org 0x21A1344	// 1F Hallway (ID 0xA8A)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(133)		// Recover200 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(118)		// GreenBurst *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(20)		// StunNukle *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(15)		// HeatBall2 *
	.db	0x00
.org 0x21A1414	// 2F Hallway (ID 0xA92)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(133)		// Recover200 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(18)		// IceMeteor2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(15)		// HeatBall2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(192)		// LibrScalsSP
	.db	0x00
.org 0x21A1964	// Time Square (ID 0xAE3)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(84)		// MopLance3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(119)		// IceBurst *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(13)		// RdrMissil3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(195)		// QnOphiucaSP
	.db	0x00
.org 0x21A1A58	// Nacys 1F (ID 0xAEB)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(93)		// BraveSwrd3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(119)		// IceBurst *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(13)		// RdrMissil3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(149)		// ParlyzPlus *
	.db	0x00
.org 0x21A1D3C	// Dream Island (ID 0xB22)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(90)		// VulcnSeed3 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(120)		// PoisBurst *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(22)		// FreezNukle *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(148)		// HolyPanel *
	.db	0x00
.org 0x21A2230	// Power Module (ID 0xB7A)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 15000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(122)		// JamminPnch *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(198)		// GemnSpkSP
	.db	0x01,0x20,0xFF,0x02	:: .dw	(134)		// Recover300 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(30)		// BreakSabre *
	.db	0x00
.org 0x21A2494	// Deep Space 1 (ID 0xC84)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 20000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(152)		// SolarGunV2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(154)		// DrknesSwrd *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(158)		// UrsulaV2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(161)		// ToveV2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(163)		// Alexander *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(166)		// Ezra *
	.db	0x00
.org 0x21A2610	// Deep Space 2 (ID 0xC8C)
	.db	0x03,0x20,0xFF,0xFF	:: .dw	(15000)		// 20000z
	.db	0x01,0x20,0xFF,0x02	:: .dw	(151)		// SolarGun *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(155)		// DrknsSrdV2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(157)		// Ursula *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(160)		// Tove *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(164)		// AlexandrV2 *
	.db	0x01,0x20,0xFF,0x02	:: .dw	(167)		// EzraV2 *
	.db	0x00


// Adjust Purple Mystery Waves
.org 0x21A26D4	// Deep Space 3 (ID 0xC91)
	.db	0x01,0x20,0xFF,0x03	:: .dw	(243)		// GorgonEye


// Move Blue Mystery Wave in Dream Park
.org 0x21A1D94
	.dh	0x1B4	// from 0x1F4


// Set mapscene pointers
// Breakpoint: 0x2023236, 0x202324A
.org 0x2190F7C
	.dw	mapscene_9602_start
	.dw	mapscene_9602_while
.org 0x21942B0
	.dw	mapscene_8D09_start
	.dw	mapscene_8D09_while


// Allocate more cutscenes
.org 0x215D6AC
	ldrh	r2,[r2,(0x6*0x2)]
.org 0x215D8CC
	ldrh	r2,[r2,(0x7*0x2)]
.org 0x215FE80
	ldrh	r2,[r2,(0x5*0x2)]
.org 0x215D870
	.dw	field_cutsceneOverlays+(0x20*0x2)
.org 0x215D878
	.dw	field_cutscenePointers+(0x20*0x4)
.org 0x215D900
	.dw	field_cutsceneOverlays+(0x20*0x2)
.org 0x215D908
	.dw	field_cutscenePointers+(0x20*0x4)
.org 0x215FE9C
	.dw	field_cutsceneOverlays+(0x60*0x2)
.org 0x215FEA4
	.dw	field_cutscenePointers+(0x60*0x4)

.org 0x215EEA6
	lsl	r3,r2,0x1
.org 0x2162E38
	lsl	r4,r1,0x1
.org 0x2162E90
	lsl	r4,r0,0x1
.org 0x2165EAA
	lsl	r4,r0,0x1
.org 0x215EEAC
	ldrh	r2,[r2,r3]
.org 0x2162E3C
	ldrh	r2,[r2,r4]
.org 0x2162E94
	ldrh	r2,[r2,r4]
.org 0x2165EAE
	ldrh	r2,[r2,r4]
.org 0x215EEE8
	.dw	field_cutscenePointers
.org 0x2162E5C
	.dw	field_cutscenePointers
.org 0x2162EC4
	.dw	field_cutscenePointers
.org 0x2165EF4
	.dw	field_cutscenePointers
.org 0x2162E48
	bl	field_extraCutscenes
.org 0x2162E9E
	bl	field_extraCutscenes
.org 0x2165EBA
.area 0x32,0x00
	lsl	r4,r4,0x1
	ldr	r1,[r1,r4]
	mov	r2,r6
	bl	0x2164810
	ldr	r0,[r5,0x10]
	mov	r1,0x0
	add	r0,0xC
	str	r0,[r5,0x10]
	mov	r0,r5
	add	r0,0xAC
	str	r1,[r0]
	str	r1,[r0,0x4]
	str	r1,[r0,0x8]
	str	r1,[r0,0xC]
	str	r1,[r0,0x10]
	mov	r0,0x1
	pop	r4-r6,r15

field_extraCutscenes:
	lsl	r4,r4,0x1
	ldr	r2,[r2,r4]
	mov	r1,0x2
	bx	r14
.endarea

// Allocate more cutscene text archives
.org 0x216543E
.area 0x10,0x00
	lsl	r1,r0,0x1
	ldr	r0,[0x2165478]	// 0x20F8FA4
	ldrh	r0,[r0,r1]
	mov	r1,0x1D
	lsl	r1,r1,0x10
	orr	r0,r1
	str	r0,[r4,0x40]
	mov	r1,0x4
.endarea

// Fix Scrap Comp text archive loads
.org 0x216240C
	nop
.org 0x21624E0
	nop
.org 0x2163020
	nop
.org 0x2162EF4
	nop
.org 0x21624A8
	.dw	0x1D013D
.org 0x21625DC
	.dw	0x1D013D
.org 0x216305C
	.dw	0x1D013D
.org 0x2162F48
	.dw	0x1D0147

.org 0x2195CDC
.area 0x998
field_cutsceneOverlays:
// Existing cutscenes
	.dh	0x133, 0x134, 0x135, 0x136, 0x137, 0x138, 0x139, 0x13A, 0x13B, 0x13C, 0x13D, 0x13E, 0x13F, 0x140
	.dh	0x141, 0x142, 0x143, 0x144, 0x145, 0x146, 0x147, 0x148, 0x149, 0x14A, 0x14B, 0x14C, 0x14D, 0x14E
	.dh	0x14F, 0x150, 0x151, 0x152, 0x153, 0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x159, 0x15A, 0x15B
	.dh	0x15C, 0x15D, 0x15E, 0x15F, 0x160, 0x161, 0x162, 0x163, 0x164, 0x165, 0x166, 0x167, 0x168, 0x169
	.dh	0x16A, 0x16B, 0x16C, 0x16D, 0x16E, 0x16F, 0x170, 0x171, 0x172, 0x173, 0x174, 0x175, 0x176, 0x177
	.dh	0x178, 0x179, 0x17A, 0x17B, 0x17C, 0x17D, 0x17E, 0x17F, 0x180, 0x181, 0x182, 0x183, 0x184, 0x185
	.dh	0x186, 0x187, 0x188, 0x189, 0x18A, 0x18B, 0x18C, 0x18D, 0x18E, 0x18F, 0x190, 0x191, 0x192, 0x193
	.dh	0x194, 0x195, 0x196, 0x197, 0x198, 0x199, 0x19A, 0x19B, 0x19C, 0x19D, 0x19E, 0x19F, 0x1A0, 0x1A1
	.dh	0x1A2, 0x1A3, 0x1A4, 0x1A5, 0x1A6, 0x1A7, 0x1A8, 0x1A9, 0x1AA, 0x1AB, 0x1AC, 0x1AD, 0x1AE, 0x1AF
	.dh	0x1B0, 0x1B1, 0x1B2, 0x1B3, 0x1B4, 0x1B5, 0x1B6, 0x1B7, 0x1B8, 0x1B9, 0x1BA, 0x1BB, 0x1BC, 0x1BD
	.dh	0x1BE, 0x1BF, 0x1C0, 0x1C1, 0x1C2, 0x1C3, 0x1C4, 0x1C5, 0x1C6, 0x1C7, 0x1C8, 0x1C9, 0x1CA, 0x1CB
	.dh	0x1CC, 0x1CD, 0x1CE, 0x1CF, 0x1D0, 0x1D1, 0x1D2, 0x1D3, 0x1D4, 0x1D5, 0x1D6, 0x1D7, 0x1D8, 0x1D9
	.dh	0x1DA, 0x1DB, 0x1DC, 0x1DD, 0x1DE, 0x1DF, 0x1E0, 0x1E1, 0x1E2, 0x1E3, 0x1E4, 0x1E5, 0x1E6, 0x1E7
	.dh	0x1E8, 0x1E9, 0x1EA, 0x1EB, 0x1EC, 0x1ED, 0x1EE, 0x1EF, 0x1F0, 0x1F1, 0x1F2, 0x1F3, 0x1F4, 0x1F5
	.dh	0x1F6, 0x1F7, 0x1F8, 0x1F9, 0x1FA, 0x1FB, 0x1FC, 0x1FD, 0x1FE, 0x1FF, 0x200, 0x201, 0x202, 0x203
	.dh	0x204, 0x205, 0x206, 0x207, 0x208, 0x209, 0x20A, 0x20B, 0x20C, 0x20D, 0x20E, 0x20F, 0x210, 0x211
	.dh	0x212, 0x213, 0x214, 0x215, 0x216, 0x217, 0x218, 0x219, 0x21A, 0x21B, 0x21C, 0x21D, 0x21E, 0x21F
	.dh	0x220, 0x221, 0x222, 0x223, 0x224, 0x225, 0x226, 0x227, 0x228, 0x229, 0x22A, 0x22B, 0x22C, 0x22D
	.dh	0x22E, 0x22F, 0x230, 0x231, 0x232, 0x233, 0x234, 0x235, 0x236, 0x237, 0x238, 0x239, 0x23A, 0x23B
	.dh	0x23C, 0x23D, 0x23E, 0x23F, 0x240, 0x241, 0x242, 0x243, 0x244, 0x245, 0x246, 0x247, 0x248, 0x249
	.dh	0x24A, 0x24B, 0x24C, 0x24D, 0x24E, 0x24F, 0x250, 0x251, 0x252, 0x253, 0x254, 0x255, 0x256, 0x257
	.dh	0x258, 0x259, 0x25A, 0x25B, 0x25C, 0x25D, 0x25E, 0x25F, 0x260, 0x261, 0x262, 0x263, 0x264
// New cutscenes
	.dh	0x286		// 0x133 - overlay_0646
	.dh	0x287		// 0x134 - overlay_0647
	.dh	0x288		// 0x135 - overlay_0648
	.dh	0x289		// 0x136 - overlay_0649
	.dh	0x28A		// 0x137 - overlay_0650
	.dh	0x28B		// 0x138 - overlay_0651
	.dh	0x28C		// 0x139 - overlay_0652
	.dh	0x28D		// 0x13A - overlay_0653
	.dh	0x28E		// 0x13B - overlay_0654
	.dh	0x28F		// 0x13C - overlay_0655
	.dh	0x290		// 0x13D - overlay_0656
	.dh	0x292		// 0x13E - overlay_0658
	.dh	0x293		// 0x13F - overlay_0659
	.dh	0x294		// 0x140 - overlay_0660
	.dh	0x295		// 0x141 - overlay_0661
	.dh	0x296		// 0x142 - overlay_0662
	.dh	0x297		// 0x143 - overlay_0663
.align 4
field_cutscenePointers:
// Existing cutscenes
	.dw	0x21BE574
	.dw	cutscene1_start
	.dw	                      0x21BE574, 0x21BE59C, 0x21BE62C, 0x21BE588, 0x21BE5B0, 0x21BE574
	.dw	0x21BE59C, 0x21BE560, 0x21BE588, 0x21BE560, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE734, 0x21BE588, 0x21BE574, 0x21BE5C0, 0x21BE588
	.dw	0x21BE588, 0x21BE574, 0x21BE59C, 0x21BE588, 0x21BE574, 0x21BE574
	.dw	cutscene30_start
	.dw	                                                                             0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE564
	.dw	0x21BE5C0, 0x21BE574, 0x21BE574, 0x21BE598, 0x21BE614, 0x21BE588, 0x21BE574, 0x21BE574
	.dw	0x21BE5F8, 0x21BE5D0, 0x21BE588, 0x21BE5C4, 0x21BE574, 0x21BE64C, 0x21BE5C4, 0x21BE588
	.dw	0x21BE5C4, 0x21BE560, 0x21BE588, 0x21BE574, 0x21BE59C, 0x21BE574, 0x21BE574, 0x21BE5B0
	.dw	0x21BE574, 0x21BE598, 0x21BE598, 0x21BE560, 0x21BE560, 0x21BE574, 0x21BE574, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE59C, 0x21BE588
	.dw	0x21BE59C, 0x21BE574, 0x21BE59C, 0x21BE574, 0x21BE574, 0x21BE5AC, 0x21BE574, 0x21BE560
	.dw	0x21BE59C, 0x21BE588, 0x21BE574, 0x21BE560, 0x21BE588, 0x21BE574, 0x21BE588, 0x21BE59C
	.dw	0x21BE59C, 0x21BE5AC, 0x21BE560, 0x21BE560, 0x21BE5EC, 0x21BE560, 0x21BE5D8, 0x21BE574
	.dw	0x21BE574, 0x21BE588, 0x21BE59C, 0x21BE5C0, 0x21BE574, 0x21BE588, 0x21BE5B0, 0x21BE574
	.dw	0x21BE648, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE5EC, 0x21BE610, 0x21BE574, 0x21BE610
	.dw	0x21BE574, 0x21BE688, 0x21BE588, 0x21BE610, 0x21BE5E4, 0x21BE5B0, 0x21BE600, 0x21BE5AC
	.dw	0x21BE560, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE5FC, 0x21BE560
	.dw	0x21BE574, 0x21BE5C4, 0x21BE59C, 0x21BE634, 0x21BE588, 0x21BE588, 0x21BE574, 0x21BE574
	.dw	0x21BE620, 0x21BE560, 0x21BE588, 0x21BE574, 0x21BE588, 0x21BE574, 0x21BE588, 0x21BE588
	.dw	0x21BE5BC, 0x21BE588, 0x21BE5C0, 0x21BE5C0, 0x21BE598, 0x21BE560, 0x21BE5C0, 0x21BE560
	.dw	0x21BE588, 0x21BE574, 0x21BE5B0, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE574
	.dw	0x21BE588, 0x21BE5AC, 0x21BE574, 0x21BE59C, 0x21BE560, 0x21BE574, 0x21BE588, 0x21BE588
	.dw	0x21BE574, 0x21BE588, 0x21BE560, 0x21BE574, 0x21BE574, 0x21BE560, 0x21BE574, 0x21BE574
	.dw	0x21BE59C, 0x21BE560, 0x21BE574, 0x21BE59C, 0x21BE5BC, 0x21BE598, 0x21BE59C, 0x21BE574
	.dw	0x21BE574, 0x21BE588, 0x21BE598, 0x21BE584, 0x21BE574, 0x21BE588, 0x21BE5B0, 0x21BE574
	.dw	0x21BE560, 0x21BE560, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE574, 0x21BE574, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE560, 0x21BE5D0
	.dw	0x21BE588, 0x21BE588, 0x21BE588, 0x21BE5EC, 0x21BE5E4, 0x21BE588, 0x21BE588, 0x21BE588
	.dw	0x21BE610, 0x21BE574, 0x21BE574, 0x21BE59C, 0x21BE5E0, 0x21BE588, 0x21BE574, 0x21BE560
	.dw	0x21BE574, 0x21BE598, 0x21BE574, 0x21BE574, 0x21BE588, 0x21BE560, 0x21BE574, 0x21BE574
	.dw	0x21BE560, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE5AC, 0x21BE574, 0x21BE574, 0x21BE560
	.dw	0x21BE574, 0x21BE574, 0x21BE574, 0x21BE560, 0x21BE574, 0x21BE5B0, 0x21BE588, 0x21BE574
	.dw	0x21BE574, 0x21BE5B0, 0x21BE5B0, 0x21BE560, 0x21BE560, 0x21BE598
	.dw	cutscene286_start
	.dw	cutscene287_start
	.dw	cutscene288_start
	.dw	cutscene289_start
	.dw	cutscene290_start
	.dw	cutscene291_start
	.dw	                                            0x21BE574, 0x21BE588, 0x21BE574, 0x21BE588
	.dw	0x21BE5AC, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE574, 0x21BE560, 0x21BE560, 0x21BE560
	.dw	0x21BE560, 0x21BE560, 0x21BE560
// New cutscenes
	.dw	0x21BE560		// 0x133 - overlay_0646
	.dw	0x21BE560		// 0x134 - overlay_0647
	.dw	0x21BE560		// 0x135 - overlay_0648
	.dw	0x21BE560		// 0x136 - overlay_0649
	.dw	0x21BE560		// 0x137 - overlay_0650
	.dw	0x21BE560		// 0x138 - overlay_0651
	.dw	0x21BE560		// 0x139 - overlay_0652
	.dw	cutscene314_start	// 0x13A - overlay_0653
	.dw	cutscene315_start	// 0x13B - overlay_0654
	.dw	cutscene316_start	// 0x13C - overlay_0655
	.dw	cutscene317_start	// 0x13D - overlay_0656
	.dw	cutscene318_start	// 0x13E - overlay_0658
	.dw	cutscene319_start	// 0x13F - overlay_0659
	.dw	cutscene320_start	// 0x140 - overlay_0660
	.dw	cutscene321_start	// 0x141 - overlay_0661
	.dw	cutscene322_start	// 0x142 - overlay_0662
	.dw	cutscene323_start	// 0x143 - overlay_0663
.endarea


.close
