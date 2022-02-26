// ARM9 binary

.nds
.thumb
.open TEMP+"/arm9.dec",0x02000000


.definelabel	VERSION, (1 << 0x10) | (2 << 0x8) | (2 << 0x0)

.include "asm/arm9_battlecard.asm"
.if OPT_RESUME_MUSIC
.include "asm/arm9_bgm.asm"
.endif


.org 0x203AF24	// "Cancelled" message when canceling on "waiting for response from friend"
.area 0xE,0x00
	// Send cancel to other player
	mov	r0,r4
	bl	common_connectSendCancel
	b	0x203B0AE
.endarea

.org 0x203A9BC	// Turn selection menu
	bl	common_connectTurnsMenu

.org 0x203AD66	// Open turn selection menu
.area 0x16,0x00
	mov	r0,r4		// passed to function

	// Check if we are the host
	ldr	r1,[0x203B074]	// 0x20E4
	ldrb	r1,[r4,r1]	// 0 = host, 1 = client
	cmp	r1,0x0
	bne	@@client
@@host:
	bl	common_connectOpenTurnsMenu
	b	0x203B0AE	// end
@@client:
	bl	common_connectConfirmResponse
	b	0x203B0AE	// end
.endarea

.org 0x203AB6E	// Skip text for confirm multiplayer battle mode
.area 0xC
	b	0x203AB7A
.endarea
.org 0x203AD52	// Auto-confirm multiplayer battle mode
.area 0x14,0x00
	b	0x203AD66
.endarea
.org 0x203AD7C
.area 0x8,0x00
.endarea


.org 0x202BCAE
	bl	common_transerEquipTouch


.org 0x202203E	// Brother tutorial
	bl	field_keyboardStartTutorial
.org 0x2022048
	mov	r1,0x0
.org 0x2022096
	bl	0x2011C28	// check both screens faded
.org 0x20220A6
.area 0xA,0x00
	bl	field_keyboardTutorialLoad
	b	0x20220B0
.endarea
.org 0x20220B6
	sub	r4,0x55
.org 0x20220DE
	bl	field_keyboardTutorialState14
.org 0x20220E6
	bl	field_keyboardRunTutorial
.org 0x202210A
.area 0x14,0x00
	bl	field_keyboardTutorialClose
	b	0x202211E
.endarea
.org 0x2022134
	bl	0x2011C28	// check both screens faded
.org 0x202218A
	bl	field_keyboardStartTutorial
.org 0x2022194
	mov	r1,0x0
.org 0x20221AE
	bl	0x2011C28	// check both screens faded
.org 0x20221BE
.area 0xA,0x00
	bl	field_keyboardTutorialLoad
	b	0x20221C8
.endarea
.org 0x20221CE
	sub	r4,0x55
.org 0x20221EC
	bl	field_keyboardTutorialState20
.org 0x20221F4
	bl	field_keyboardRunTutorial
.org 0x2022218
.area 0x14,0x00
	bl	field_keyboardTutorialClose
	b	0x202222C
.endarea
.org 0x2022242
	bl	0x2011C28	// check both screens faded
.org 0x2034D1C	// On Air
.area 0xE,0x00
	// Skip unloading sprites
	mov	r1,(0x3B8 >> 0x2)
	lsl	r1,r1,0x2
	b	0x2034D2A
.endarea
.org 0x2034D54
	nop
.org 0x2034D6C
	bl	field_keyboardRunOnAir
.org 0x2021A4C
.area 0xC,0x00
	bl	field_keyboardStartFreeFolder
	b	0x2021A58
.endarea
.org 0x2021AB6
	bl	field_keyboardRunFolder
.org 0x2021ABE
	bl	field_keyboardClosedReloadFolder
.org 0x20397A4
	bl	field_keyboardStartConnect
.org 0x20397DA
	bl	0x2011C28	// check both screens faded
.org 0x20378B6
	mov	r1,0x0
.org 0x20378CC
	bl	field_keyboardStartOnAir
.org 0x2034D0C
	mov	r1,0x0
.org 0x2034D10
	bl	0x2011C28	// check both screens faded
.org 0x2034D74
	bl	field_keyboardClosedReloadOnAir
.org 0x2038DDA
	bl	field_keyboardConnectFadeOutEnable
.org 0x2038E02
	bl	field_keyboardConnectFadeOutDisable

.org 0x2038C92	// Fix black fade in on exiting WFC settings in Connect
	bl	common_connectFadeIn


.org 0x203694E
.area 0x40,0x00
	// Skip wrong tileset load
	b	0x203698E
.endarea



// New save strings
.org 0x20FA2AC
	.asciiz	"mmsf1dx",0,0,0,0,0


// Allocate more object memory
.org 0x201376E
	bl	common_allocObjectMemory
// Allocate more memory for mess_1212 (field common)
.org 0x201E9C0
	mov	r1,(0x2800 >> 0x8)	// from 0x2000
	.skip 0x2
	lsl	r1,r1,0x8
// Allocate more memory for NPC mess (needed for BIG WAVE NPC text)
.org 0x201E8CC
	mov	r1,(0x3E00 >> 0x8)	// from 0x2000
	.skip 0x2
	lsl	r1,r1,0x8


// Two save slots
// 0x00000-0x00FFF = header 1
// 0x01000-0x011FF = small block 1 A
// 0x01200-0x013FF = small block 1 B
// 0x04000-0x0FFFF = big block 1 A
// 0x10000-0x1BFFF = big block 1 B
// 0x20000-0x20FFF = header 2
// 0x21000-0x211FF = small block 2 A
// 0x21200-0x213FF = small block 2 B
// 0x24000-0x2FFFF = big block 2 A
// 0x30000-0x3BFFF = big block 2 B
// Allocate persistent blocks on heap for save data
.if OPT_SAVE_PERSIST_BUFFERS
.org 0x20155D4
	bl	common_saveAllocPersistent
.org 0x200A74A	// Save_AllocSaveAsync
.area 0xE,0x00
	ldr	r0,=common_savePersistBufferUncompress
	ldr	r0,[r0]
	b	0x200A758
	.pool
.endarea
.org 0x200A75A	// Save_AllocSaveAsync
.area 0xE,0x00
	ldr	r0,=common_savePersistBufferCompress
	ldr	r0,[r0]
	b	0x200A768
	.pool
.endarea
.org 0x200A9E0	// Save_SaveWorker
	nop :: nop	// no need to free buffer
.org 0x200A9F4	// Save_SaveWorker
	nop :: nop	// no need to free buffer
.endif
.org 0x200A5D4	// Save_InitHeader
	mov	r2,0x3C
.org 0x200A5E6
.area 0x1A,0x00
	// r4 = dst
	mov	r3,0x0
	mov	r2,r4
	mov	r1,0x40
@@loop:
	lsl	r0,r1,0x8
	str	r0,[r2,0x14]

	add	r1,0xC0
	add	r2,0x14
	add	r3,0x1
	cmp	r3,0x2
	bcc	@@loop
	b	0x200A600
.endarea
.org 0x200A608
	mov	r2,0x3C
.org 0x200A65C	// Save_Write
	bl	common_saveWrite	// adjust r1
.org 0x200A6BC	// Save_WriteAsync
	bl	common_saveWrite	// adjust r1
.org 0x200A912
	mov	r4,0x14
	mul	r0,r4
	str	r0,[sp,0x4]
	add	r4,r7,r0
.org 0x200A942	// Save_SaveWorker
	cmp	r0,0x2
.org 0x200AA6C	// Save_WriteHeader
	mov	r2,0x3C
.org 0x200AA7E
	mov	r3,0x3C
.org 0x200AAE8	// Save_Read
	bl	common_saveRead		// adjust r0
.org 0x200AB1C	// Save_ReadAndVerifyHeader
	mov	r3,0x3C
.org 0x200AB48
	bne	0x200AB8E
.org 0x200AB54	// Save_VerifyHeader
	mov	r2,0x3C
.org 0x200AB64
	lsl	r0,r4,0xE
	mov	r2,0x14
	mul	r2,r3
.org 0x200AB7A
	mov	r4,0x0
.org 0x200AB7E
	cmp	r3,0x2
	bcc	0x200AB66
.org 0x200ABDC	// Save_Load
	mov	r2,0x14
	mul	r2,r0
	add	r4,r1,r2
	ldr	r1,[r1,r2]
	ldr	r3,[r4,0x4]
.org 0x200AC10
	bl	common_saveLoadPlayTimeCopy
.org 0x200AC1A
	bl	common_saveLoadPlayTimeUncompress
.org 0x200AC64	// Save_VerifySlot
	mov	r0,0x14
	mul	r0,r6
	add	r4,r1,r0
	ldr	r2,[r4,0x4]
	cmp	r2,0x0
	beq	0x200ACD8
	ldr	r0,[0x200ACE0]
	mov	r1,0x1
	ldr	r0,[r0]
	bl	0x20155DC
.org 0x200AD18	// Save_VerifyExists
	beq	0x200AD1E
	mov	r0,0x1
	b	0x200AD96
	mov	r6,0x0	// 0x200AD1E
	mov	r7,0xFF
	str	r6,[sp]
	mov	r0,0x14	// 0x200AD24
	mul	r0,r6
.org 0x200AD6E
	cmp	r6,0x2
	bcc	0x200AD24
.org 0x200AD82
	cmp	r1,0x2
.org 0x200ADDC	// Save_VerifyNotCorrupt
	beq	0x200ADE2
	mov	r0,0x1
	b	0x200AE66
	mov	r4,0x0	// 0x200ADE2
	mov	r0,0xFF
	str	r0,[sp,0x4]
	str	r4,[sp]
	mov	r7,r4
	mov	r0,0x14	// 0x200ADEC
	mul	r0,r4
.org 0x200AE38	// Save_VerifyNotCorrupt
	cmp	r4,0x2
	bcc	0x200ADEC
.org 0x200AE52
	cmp	r0,0x2
.org 0x200A94C	// Use total save count of both slots
	bl	common_saveCountAndStorePlayTime
.org 0x2032E82
	bl	common_saveLoadDisablePlayTimer


// Fast saving
.org 0x200A830	// Split Save_SaveAsync function in two
	nop
.org 0x200A87A
	b	0x200A89E
	ldr	r3,[0x200A8A4]
	// Second half = common_saveStartFast
.org 0x2018BB8
	bl	common_saveStartFast
.org 0x200AF7A
	bl	common_saveAllocCompressWorkBuffer
.org 0x200AF96
	bl	common_saveFreeCompressWorkBuffer
.org 0x200AEC4
	.dw	common_saveCompressCallback|1
.org 0x202B9A6	// Load into Transer
	bl	common_savePreStart
.org 0x202C8C8	// Return to Transer from submenu
	bl	common_savePreStart
.org 0x202C166	// Open PERSONAL
	bl	common_savePreAbort
.org 0x202C1C0	// Open MEGA
	bl	common_savePreAbort
.org 0x202C22E	// Open BROTHER
	bl	common_savePreAbort
.org 0x202BF52	// Open BATTLE CARD
	bl	common_savePreAbort
.org 0x202BF66	// Open ITEM
	bl	common_savePreAbort
.org 0x202BF7A	// Open LIBRARY
	bl	common_savePreAbort
.org 0x202C150	// Open E-MAIL
	bl	common_savePreAbort
.org 0x202BEC2	// Exit Transer
	bl	common_savePreAbort


// Expanded save data
.definelabel	EXSAVE_START,		0xAF8C
.definelabel	EXSAVE_BOKTAI,		0x0
.definelabel	EXSAVE_BOKTAI_SIZE,	(6) * 0x84
.definelabel	EXSAVE_FLAG,		(EXSAVE_BOKTAI + EXSAVE_BOKTAI_SIZE)
.definelabel	EXSAVE_FLAG_SIZE,	0x80
.definelabel	EXSAVE_VERSION,		(EXSAVE_FLAG + EXSAVE_FLAG_SIZE)
.definelabel	EXSAVE_VERSION_SIZE,	0x4
.definelabel	EXSAVE_SIZE,		(EXSAVE_VERSION + EXSAVE_VERSION_SIZE)
.definelabel	EXSAVE_TOTALSIZE,	(EXSAVE_START + EXSAVE_SIZE)

.org 0x200A774	// Save_AllocSaveAsync
	bl	common_saveAppendExData
.org 0x200A856	// Save_SaveAsync
	bl	common_saveAppendExData
.org 0x200ABA0	// Save_Load
	bl	common_saveLoadExtended


// Safeguard for bad all cards cheat that writes into DX flags
.org 0x2000CF4
	bl	common_checkAllCardsCheat


// Draw Star Frag counter
.org 0x2013CB8
	bl	common_drawStarFragCounter


.org 0x2012B0C
	bl	common_softResetClear
.org 0x201315E
	bl	common_softResetToTitleScreen


// Prevent Star Cards from getting Share Stars
.org 0x200BD62
	bl	common_getShareStars
// Treat Star Cards as normal cards for Share Stars
.org 0x200BD92
	bl	common_compareCardsForShareStars


// New overworld sprites
.org 0x20ECA0C + 0x8 * 0x3F	// Mirror
	.dw	(0x10<<16)|(372),0	// fieldobj_372
.org 0x20ECA0C + 0x8 * 0x40	// Mettenna
	.dw	(0x10<<16)|(373),0	// fieldobj_373
.org 0x20ECA0C + 0x8 * 0x41	// Mr. Famous
	.dw	(0x10<<16)|(374),0	// fieldobj_374
.org 0x20ECA0C + 0x8 * 0x48	// Music box
	.dw	(0x10<<16)|(375),0	// fieldobj_375
.org 0x20ECA0C + 0x8 * 0x50	// Thunderbolt
	.dw	(0x10<<16)|(376),0	// fieldobj_376
.org 0x20ECA0C + 0x8 * 0x51	// Hollow
	.dw	(0x10<<16)|(377),0	// fieldobj_377
.org 0x20ECA0C + 0x8 * 0x52	// King Hertz
	.dw	(0x10<<16)|(378),0	// fieldobj_378
.org 0x20ECA0C + 0x8 * 0x53	// Walking Jammer
	.dw	(0x10<<16)|(379),0	// fieldobj_379
.org 0x20ECA0C + 0x8 * 0x55	// Star Card Trader
	.dw	(0x10<<16)|(380),0	// fieldobj_380
.org 0x20ECA0C + 0x8 * 0x57	// Star Frag Trader
	.dw	(0x10<<16)|(381),0	// fieldobj_381
.org 0x20ECA0C + 0x8 * 0x58	// Geo Special w/ Visualizer
	.dw	(0x10<<16)|(382),0	// fieldobj_382

// New mugshots
.org 0x20ECA0C + 0x8 * 0x14F	// Mr. Famous
	.dw	(0x11<<16)|(107),0
	.dw	(0x11<<16)|(107),0
	.dw	(0x11<<16)|(107),0
	.dw	(0x11<<16)|(107),0
	.dw	(0x11<<16)|(107),0
.org 0x20ECA0C + 0x8 * 0x154	// Hollow
	.dw	(0x11<<16)|(108),0
	.dw	(0x11<<16)|(108),0
	.dw	(0x11<<16)|(108),0
	.dw	(0x11<<16)|(108),0
	.dw	(0x11<<16)|(108),0
.org 0x20ECA0C + 0x8 * 0x159	// King Hertz (blue)
	.dw	(0x11<<16)|(109),0
	.dw	(0x11<<16)|(109),0
	.dw	(0x11<<16)|(109),0
	.dw	(0x11<<16)|(109),0
	.dw	(0x11<<16)|(109),0
.org 0x20ECA0C + 0x8 * 0x15E	// King Hertz (gold)
	.dw	(0x11<<16)|(110),0
	.dw	(0x11<<16)|(110),0
	.dw	(0x11<<16)|(110),0
	.dw	(0x11<<16)|(110),0
	.dw	(0x11<<16)|(110),0
.org 0x20ECA0C + 0x8 * 0x163	// Sheridan (shadow)
	.dw	(0x11<<16)|(111),0
	.dw	(0x11<<16)|(111),0
	.dw	(0x11<<16)|(111),0
	.dw	(0x11<<16)|(111),0
	.dw	(0x11<<16)|(111),0
.org 0x20ECA0C + 0x8 * 0x168	// Shin (shadow)
	.dw	(0x11<<16)|(112),0
	.dw	(0x11<<16)|(112),0
	.dw	(0x11<<16)|(112),0
	.dw	(0x11<<16)|(112),0
	.dw	(0x11<<16)|(112),0


// Transers
.org 0x20CA4D8	// Transer 0x3C
	.dw	0x20CA2FC		// Brother data
	.dh	0xCD			// Mugshot
	.skip	2			// ???
	.dw	((0x1D << 16) | (1257))	// Message file
	.dh	0x18			// ???
	.db	0xFF			// ???
	.db	0x0A			// ???
	.db	0x2			// Satellite

.org 0x20CA2FC	// Transer 0x3C Brother data
	.dw	0x20F7044		// Favorites
	.db	0xB			// ???
	.db	0xC			// ???
	.dh	0xFFFF

.thumb
.org 0x20B4FDA	// Transer 0x3C Favorites, written to 0x20F7044
	mov	r0,0x7E		// AntiSword
	mov	r1,0x1		// Yellow
.org 0x20B4FE6
	mov	r0,0x8C		// SpiritFury
	mov	r1,0x1		// Yellow
.org 0x20B4FF2
	mov	r0,0x8D		// PoisonApple
	mov	r1,0x1		// Yellow
.org 0x20B4FFE
	mov	r0,0x8E		// DoubleCross
	mov	r1,0x1		// Yellow
.org 0x20B500A
	mov	r0,0x8F		// GigaMine
	mov	r1,0x1		// Yellow
.org 0x20B5016
	mov	r0,0xF0		// LifeAura
	mov	r1,0x3		// Red


// Change Zack's Link Ability from MegaClass+1 to MegaClass+2
.org 0x20EE898
	.dh	0x0A	:: .dh	(2)


// Always enable Fake Slot In
.thumb
.org 0x020066E0
.area 0x10,0x00
	ldr	r1,=common_checkGBASlotIn|1
	bx	r1
	.pool
.endarea


.org 0x2007BB8	// Fake some item counts
	push	r14
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1,0x8]
	bl	common_fakeItemCounts
	.pool


// Don't include Extra Folder in total card count
.org 0x20073F6
.area 0xE,0x00
	add	r6,0x1
	cmp	r6,r7
	bcc	0x20073DA
	mov	r0,r4
	sub	r0,(30)
	pop	r3-r7,r15
.endarea


// Require all 3 admins beaten for SP star
.org 0x2010336
	cmp	r4,(12)		// from 10
.org 0x201033A
	cmp	r5,(12)		// from 10
.org 0x2010344
	.dw	common_spBossBeatFlags


// Patch out Andromeda card checks
.org 0x20103C4
.area 0x40,0x00
	// Andromeda check also sets the flag
	push	r14
	bl	0x2010404
	mov	r0,0x1
	pop	r15
.endarea
.org 0x201042C
.area 0x8,0x00
	// Set Andromeda flag on New Game
	push	r14
	bl	0x2010404
	pop	r15
.endarea


.org 0x2012CF4	// Restore unused Transer quests
.area 0x28,0x00
	// Skip setting Luna and Bud's Transer quests
	b	0x2012D18
.endarea
.org 0x2012D6C
.area 0x14,0x00
	// Skip setting Sonia's Transer quest
	b	0x2012D80
.endarea


.org 0x200CE80	// Set Legend Card Satellite to player satellite
	mov	r7,r5
	mul	r7,r3
	add	r1,r4,r1
	add	r2,r6,r7
	bl	0x202DFD8
	bl	common_getPlayerSatellite
	add	r1,r0,0x1
	add	r0,r6,r7


.org 0x2032EB4	// Increase max play time to 999:59
	.dw	0xCDFE5FF	// 999:59


.org 0x2016422	// Hyper speed text when Start held
	bl	common_hyperSpeedText
.org 0x201649A
	bl	common_hyperSpeedText
.org 0x2016512
	bl	common_hyperSpeedText
.org 0x2018382
	bl	common_hyperSpeedText
.org 0x201E27A
	mov	r0,0x78
	ldrh	r1,[r4,r0]
	bl	common_hyperSpeedText


// Adjust game log entries for new Library
.org 0x2006FCA
	cmp	r7,0xF7		// Exclude Andromeda
.org 0x2006FCE
	cmp	r6,(170)	// Standard count
	blt	0x2006FF8
.org 0x2006FF8
	cmp	r4,(36)		// Mega count
	blt	0x2007022
.org 0x2007022
	cmp	r5,(15)		// Giga count (excluding Andromeda)
	blt	0x200704C
	bl	common_addGigaCardEventsToGameLog
	mov	r1,0x1D

// Delay adding some Giga Card game log events
.org 0x200705C
.area 0x50,0x00
	// Only add Giga 1 (admin GX) and Giga 2 (elem+50) events here
	push	r4,r14

	mov	r4,0x18		// Giga 1 event
	cmp	r0,(231)	// PegasuMgcGX
	beq	@@addEvent
	cmp	r0,(236)	// LeoKingdmGX
	beq	@@addEvent
	cmp	r0,(241)	// DragonSkyGX
	beq	@@addEvent

	mov	r4,0x19		// Giga 2 event
	cmp	r0,(232)	// Aqua+50
	beq	@@addEvent
	cmp	r0,(237)	// Fire+50
	beq	@@addEvent
	cmp	r0,(242)	// Wood+50
	bne	@@end

@@addEvent:
	// Check already in log
	mov	r1,r4
	bl	0x200DAF4
	cmp	r0,0x0
	bne	@@end

	// Add to log
	mov	r1,r4
	bl	0x200DA98
@@end:
	pop	r4,r15

.align 2
common_addGigaCardEventsToGameLog:
	// Add all Giga events
	push	r4,r14

	mov	r4,0x18
@@loop:
	// Check already in log
	mov	r1,r4
	bl	0x200DAF4
	cmp	r0,0x0
	bne	@@next

	// Add to log
	mov	r1,r4
	bl	0x200DA98
@@next:
	add	r4,0x1
	cmp	r4,0x1C
	ble	@@loop

	pop	r4,r15
.endarea


// Add more text buffers
.org 0x2008DF0	// Set text buffer
.area 0x18,0x00
	push	r14
	cmp	r0,0x4
	bcc	@@normal
	bl	common_textBufferSetExtra
@@normal:
	lsl	r2,r0,0x2
	ldr	r0,=0x21035F8
	str	r1,[r0,r2]
	mov	r0,0x1
	pop	r15

	.pool
.endarea
.org 0x2009170	// Get text buffer
.area 0xC,0x00
	push	r14
	ldr	r1,=0x21035F8
	bl	common_textBufferGetExtra
	.pool
.endarea
.org 0x201E4CA	// Get string buffer
	cmp	r1,0xC
.org 0x201A368
	bl	common_textBufferGetString
.org 0x201BF74
	bl	common_textBufferGetString
.org 0x201E4EE
	bl	common_textBufferGetString
.org 0x201F130
	bl	common_textBufferGetString
.org 0x201F70C
	bl	common_textBufferGetString


.org 0x2013CF4	// Allocate more NPC palettes for 1000 Note Challenge
//	bl	common_noteGameNpcPalettes
.org 0x2013CF4	// Allocate more NPC palettes
	mov	r2,0xB	// from 0x9
	mov	r3,0x1


// Special Brothers
.org 0x200D0E8
	bl	common_setSpecialBrother

.org 0x2033D86	// Reset WFC info doesn't clear Copy Brothers
.area 0xA,0x00
	bl	common_resetWfcDeleteCopyBrother
	b	0x2033DBE
.endarea

.org 0x2033D98	// Reset WFC info doesn't clear Boktai Brothers
.area 0x12,0x00
	b	0x2033DBE
.endarea


// Add more fixed battles
.org 0x20079EE
.area 0x6
	push	r14
	bl	common_getFixedBattle
.endarea


// Adjust immobilized/invulnerable VFX
.org 0x2011468	// Immobilized emission color
	.dw	0x0000		// (0, 0, 0); from 0x842 (2, 2, 2)
.org 0x2011A04
	.dh	0x03A0		// (0, 29, 0); from 0x300 (0, 24, 0)


// Heap logging functions
.org 0x20155DC
	push	r3,r14
	mov	r3,0x4
	bl	filterHeapAllocEx
	pop	r3,r15
.org 0x20155FC
	push	r14
	bl	filterHeapAllocEx
	pop	r15
.org 0x2015620
	push	r14
	bl	filterHeapFree
	pop	r15


// File filter functions
.org 0x201221A
	bl	filterFileIdMsg
	mov	r5,r0
	lsr	r4,r1,0x10
	b	0x2012226
.org 0x201228E
	bl	filterFileFunc1228C
.org 0x20122FA
	bl	filterFileFunc122F8
.org 0x2012320
	bl	filterFileFunc1231C
.org 0x2012356
	bl	filterFileFunc12354
.org 0x201240E
	bl	filterFileFunc1240C
.org 0x201244A
	bl	filterFileFunc12448
.org 0x201251A
	bl	filterFileFunc1251A
.org 0x2012546
	bl	filterFileFunc12544


.org 0x202022A
	bl	common_handleExpandedSpritesList


.org 0x020184A4
	bl	common_checkGameVersion


.org 0x2027902	// Load card icons for multiplayer trade menu
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5

.org 0x2025E2C
	bl	common_drawCardBorder
.org 0x2026190
	bl	common_drawStarOnCard
.org 0x2026530
	bl	common_drawStarOnCardTradeBefore
.org 0x2026DF8
	bl	common_drawStarOnCardTradeAfter
.org 0x2026EC4
	bl	common_traderDescription1
.org 0x2026F10
	bl	common_traderDescription2
.org 0x2026F20
	lsl	r1,r4,0x8
	.skip	0x2
	lsr	r1,r1,0x18
.org 0x2026F44
	lsl	r0,r4,0x10
	bl	common_traderCardAttack
.org 0x2026F90
	nop
	.skip	0x2
	lsl	r1,r4,0x8
	.skip	0x2
	lsr	r1,r1,0x18
.org 0x2026FB8
	lsl	r0,r4,0x10
	bl	common_traderCardAttack
.org 0x2029542
	bl	common_starCardDescriptionTradeList
.org 0x20297C6
	bl	common_tradeDescription
.org 0x202985A
	cmp	r7,r0
.org 0x2029868
	lsl	r1,r7,0x18
.org 0x2029882
	lsl	r1,r7,0x18
.org 0x202A430
	bl	common_starCardDescriptionTrade
.org 0x202A478
	bl	common_starCardDescriptionTrade
.org 0x202A4B8
	bl	common_starCardDescriptionTrade
.org 0x202A502
	bl	common_starCardDescriptionTrade


// Card label for multiplayer trade menu
.org 0x2028F94
	bl	common_drawCardLabelColorTrade
// Card label star 
.org 0x202915C
	bl	common_drawCardLabelStarTrade


// Respawn Mystery Waves on pulse out rather than pulse in
.org 0x20241AC	// On pulse in
	// Respawn Boktai Mystery Waves
	ldr	r0,[0x2024208]	// 0x21A7D6C
	ldr	r0,[r0]
	bl	common_respawnBoktaiMysteryWave
.org 0x2024250	// On pulse out
	// Respawn everything
	bl	common_respawnMysteryWavesOnPulseOut


// New battle selection functions
.org 0x02006AAC	// getBattle
	push	r14
	bl	common_getBattleCount
	mov	r0,r1
	pop	r15

.org 0x02006ABC	// getBattleCount
	push	r14
	bl	common_getBattleCount
	pop	r15

// Include r5 in SP boss selection push/pop
.org 0x2006B2C
	push	r4-r5,r14
.org 0x2006B54
	pop	r4-r5,r15
.org 0x2006B68
	pop	r4-r5,r15
.org 0x2006BB4
	pop	r4-r5,r15
.org 0x2006BBC
	pop	r4-r5,r15


.org 0x2013B76
	bl	common_onAreaChange


// No need to pulse out after beating EX to encounter SP boss
.org 0x20C8BD8
	.dh	0xB0	// Beat Taurus Fire EX
	.dh	0xB2	// Beat Cygnus Wing EX
	.dh	0xB4	// Beat Harp Note EX
	.dh	0xB6	// Beat Libra Scales EX
	.dh	0xB8	// Beat Queen Ophiuca EX
	.dh	0xBA	// Beat Gemini Spark EX
	.dh	0xBC	// Beat Admin EX


// Fix generic shuffle algorithms
.org 0x20069B6	// shuffle 8-bit
	sub	r4,r6,0x1
.org 0x20069D2
	sub	r4,0x1
	cmp	r4,0x0
	bhi	0x20069BC
.org 0x2006A2E	// shuffle 32-bit
	sub	r4,r6,0x1
.org 0x2006A4A
	sub	r4,0x1
.org 0x2006A50
	cmp	r4,0x0
	bhi	0x2006A34


// Extend SP boss selection with Cloaker rate
.org 0x2006B6A
.area 0x56,0x00
	// Set default SP boss rate (1-in-16)
	mov	r5,0x10

	// Check Cloaker active
	bl	0x2007E2C
	cmp	r0,0x1
	bne	@@random
	// Set Cloaker SP boss rate (1-in-10)
	mov	r5,0xA

	// Set Cloaker + Search SP boss rate in Deep Space
	bl	common_deepSpaceSPBossRate

@@random:
	// Get random int
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	lsr	r0,r0,0x1

	// Compare to rate
	mov	r1,r5
	blx	0x208985C	// r0 = r0 mod r1
	cmp	r0,0x0
	beq	@@select

@@returnNull:
	mov	r0,0x0
	pop	r4-r5,r15

@@select:
	ldr	r0,=0x20F6B2C
	cmp	r4,0x7
	blt	@@end
	add	r0,=@exSpBattles
	sub	r4,0x7
@@end:
	lsl	r1,r4,0x2
	ldr	r0,[r0,r1]
	pop	r4-r5,r15

	.pool

@exSpBattles:
	.dw	common_battle82	// Leo Kingdom SP
	.dw	common_battle83	// Dragon Sky SP
.endarea


// Add SP boss battles
.org 0x2006BC0
	.dw	common_spBossAreas
	.dw	common_spBossAppearFlags


// Include r7 in battle selection push/pop
.org 0x2007888
	push	r4-r7,r14
.org 0x200789E
	pop	r4-r7,r15
.org 0x20078B2
	pop	r4-r7,r15
.org 0x20078C2
	pop	r4-r7,r15
.org 0x20078CE
	pop	r4-r7,r15
.org 0x20078E0
	pop	r4-r7,r15
.org 0x2007928
	pop	r4-r7,r15
.org 0x20079C8
	pop	r4-r7,r15

// Extend battle selection with Cloaker/Search encounter rate
.org 0x020078F4
.area 0x36
	mov	r7,0x19		// Encounter interval = 30

@@checkCloaker:
	// Check if Cloaker active
	bl	0x2007E2C
	cmp	r0,0x0
	beq	@@checkSearchEye
@@doubleInterval:
	// Double encounter check interval
	mov	r7,0x4B		// Cloaker interval = 75

@@checkSearchEye:
	// Check if SearchEye active
	bl	2007E98h
	cmp	r0,0h
	bne	@@halveInterval
	// Check if ElemSearch active
	bl	common_elemSearchGet
	cmp	r0,0h
	beq	@@store
@@halveInterval:
	mov	r7,0x5		// Search interval = 5

@@store:
	ldr	r1,[r5]
	add	r1,6Ch
	ldr	r0,[r1]		// next check
	add	r0,r0,r7
	str	r0,[r1]		// next check
	ldrb	r0,[r1,4h]	// chance
	add	r0,1h
	strb	r0,[r1,4h]	// chance
	mov	r0,0h
	pop	r4-r7,r15

	.pool
.endarea

// Extend battle selection with ElemSearch
.org 0x200795C
.area 0x70,0x00
	cmp	r5,0x0
	bne	@@end
	mov	r0,r4
	mov	r1,r6
	bl	0x2006B2C
	mov	r5,r0
	bne	@@end

	// Get ElemSearch element
	bl	common_elemSearchGet
	mov	r7,r0

@@getBattleCount:
	// Get battle count with element filter
	mov	r0,r4		// stage
	mov	r1,r6		// area
	mov	r2,r7		// elem
	bl	2006ABCh
	cmp	r0,0h
	bne	@@random
	cmp	r7,0h
	// Abort battle selection
	beq	@@checkSearch

	// Clear element filter and try again
	mov	r7,0h
	b	@@getBattleCount

@@checkSearch:
	bl	0x2007E98	// check SearchEye active
	cmp	r0,0x0
	bne	@@setSearchEncounterRate
	bl	common_elemSearchGet
	cmp	r0,0x0
	beq	@@end

@@setSearchEncounterRate:
	bl	common_startSearchEncounterRate
	b	@@end

@@random:
	mov	r5,r0

	// Get random int
	ldr	r0,=211F6A8h
	bl	0x20069E0	// random
	lsr	r0,r0,1h

	// Choose battle index
	mov	r1,r5
	blx	0x208985C	// FX_ModS32

	// Get battle
	mov	r3,r0		// index
	mov	r0,r4		// stage
	mov	r1,r6		// area
	mov	r2,r7		// elem
	bl	0x2006AAC
	mov	r5,r0

@@end:
	mov	r0,r5
	pop	r4-r7,r15

	.pool
.endarea


.org 0x2007850	// Adjust encounter rate
.area 0x24,0x00
	ldr	r0,[0x2007884]	// 0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]

	mov	r1,0x0
	str	r1,[r0,0x68]
	mov	r1,0xB0		// Initial encounter check = 352 frames
	lsl	r1,r1,0x1
	str	r1,[r0,0x6C]

	// Increase encounter chance for small comps
	mov	r1,0x5		// Base encounter chance = 5+1%
	ldrb	r2,[r0]
	sub	r2,0x8C
	cmp	r2,0x4
	bcs	@@setChance
	mov	r1,0xA		// High encounter chance = 10+1%
@@setChance:
	add	r0,0x70
	strb	r1,[r0]

	bx	r14

	.pool
.endarea



.org 0x20B1DAA	// Tutorial 2 folder
	// Replace the HeatBall1 in top left with Barrier
	// Otherwise, no reason to pick Sword over HeatBall...
	mov	r0,0x87
	mov	r1,0x1

// Change tutorial 3 folder
// Add Attack+10 and remove AirSpread in first draw so it can't be cheesed with Side Select
// Don't put ParalyzPlus, player might confuse the paralysis with a counter!
// Also add Sword for variety
.org 0x20B1F26
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1F32
	mov	r0,0xE	// HeatBall
	mov	r1,0x1
.org 0x20B1F3E
	mov	r0,0x96	// Attack+10
	mov	r1,0x0
.org 0x20B1F4A
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1F56
	mov	r0,0xE	// HeatBall
	mov	r1,0x1
.org 0x20B1F62
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B1F6E
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1F7A
	mov	r0,0xE	// HeatBall
	mov	r1,0x1
.org 0x20B1F86
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B1F92
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1F9E
	mov	r0,0xE	// HeatBall
	mov	r1,0x1
.org 0x20B1FAA
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B1FB6
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1FC2
	mov	r0,0xE	// HeatBall
	mov	r1,0x1
.org 0x20B1FCE
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B1FDA
	mov	r0,0x96	// Attack+10
	mov	r1,0x0
.org 0x20B1FE6
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B1FF2
	mov	r0,0x17	// Sword
	mov	r1,0x1
.org 0x20B1FFE
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B200A
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B2016
	mov	r0,0x17	// Sword
	mov	r1,0x1
.org 0x20B2022
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B202E
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B203A
	mov	r0,0x17	// Sword
	mov	r1,0x1
.org 0x20B2046
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B2052
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B205E
	mov	r0,0x17	// Sword
	mov	r1,0x1
.org 0x20B206A
	mov	r0,0xA	// AirSpread
	mov	r1,0x1
.org 0x20B2076
	mov	r0,0x1	// Cannon
	mov	r1,0x1
.org 0x20B2082
	mov	r0,0x17	// Sword
	mov	r1,0x1


.org 0x2006A84	// Add extra enemies
.area 0x28
	lsl	r1,r0,0x18
	bcs	@@boss
@@virus:
	ldr	r2,=0x20B880E
	b	@@calc
@@boss:
	lsr	r0,r1,0x18
	ldr	r2,=0x20B8634
	cmp	r0,0x4F
	blt	@@calc
	ldr	r2,=(common_extraEnemies - 0x4F*0x6)
@@calc:
	mov	r1,0x6
	mul	r0,r1
	add	r0,r2,r0
	bx	r14

	.pool
.endarea


// Add camera intros to all boss battles
.org 0x20C8C48 + 0x4	// Taurus Fire SP
	.db	0x20
.org 0x20C8C38 + 0x4	// Cygnus Wing SP
	.db	0x30
.org 0x20C8BF8 + 0x4	// Harp Note SP
	.db	0x40
.org 0x20C8C08 + 0x4	// Libra Scales SP
	.db	0x50
.org 0x20C8C28 + 0x4	// Queen Ophiuca SP
	.db	0x60
.org 0x20C8BE8 + 0x4	// Gemini Spark SP
	.db	0x70
.org 0x20C8C18 + 0x4	// Pegasus Magic SP
	.db	0xC0

.org 0x20C9544 + 0x10*0x03 + 0x4	// Taurus Fire
	.db	0x20
.org 0x20C9544 + 0x10*0x08 + 0x4	// Cygnus Wing
	.db	0x30
.org 0x20C9544 + 0x10*0x0F + 0x4	// Harp Note
	.db	0x40
.org 0x20C9544 + 0x10*0x16 + 0x4	// Pegasus Shadow
	.db	0xC0
.org 0x20C9544 + 0x10*0x18 + 0x4	// Libra Scales
	.db	0x50
.org 0x20C9544 + 0x10*0x1A + 0x4	// Queen Ophiuca
	.db	0x60
.org 0x20C9544 + 0x10*0x22 + 0x4	// Gemini Spark
	.db	0x70
.org 0x20C9544 + 0x10*0x25 + 0x4	// Gemini Spark (story)
	.db	0x70
.org 0x20C9544 + 0x10*0x26 + 0x4	// Cygnus Wing EX (story)
	.db	0x30
.org 0x20C9544 + 0x10*0x27 + 0x4	// Taurus Fire EX (story)
	.db	0x20
.org 0x20C9544 + 0x10*0x28 + 0x4	// Libra Scales EX (story)
	.db	0x50
.org 0x20C9544 + 0x10*0x29 + 0x4	// Queen Ophiuca EX (story)
	.db	0x60
.org 0x20C9544 + 0x10*0x2A + 0x4	// Andromeda
	.db	0x80
.org 0x20C9544 + 0x10*0x2B + 0x4	// Andromeda Infinity
	.db	0x80
.org 0x20C9544 + 0x10*0x46 + 0x4	// Taurus Fire EX (ghost)
	.db	0x20
.org 0x20C9544 + 0x10*0x47 + 0x4	// Cygnus Wing EX (ghost)
	.db	0x30
.org 0x20C9544 + 0x10*0x48 + 0x4	// Harp Note EX (ghost)
	.db	0x40
.org 0x20C9544 + 0x10*0x49 + 0x4	// Libra Scales EX (ghost)
	.db	0x50
.org 0x20C9544 + 0x10*0x4A + 0x4	// Queen Ophiuca EX (ghost)
	.db	0x60
.org 0x20C9544 + 0x10*0x4B + 0x4	// Gemini Spark EX (ghost)
	.db	0x70
.org 0x20C9544 + 0x10*0x4C + 0x4	// Cancer Bubble
	.db	0x90
.org 0x20C9544 + 0x10*0x4D + 0x4	// Cancer Bubble EX
	.db	0x90
.org 0x20C9544 + 0x10*0x4E + 0x4	// Cancer Bubble SP
	.db	0x90
.org 0x20C9544 + 0x10*0x4F + 0x4	// Wolf Woods
	.db	0xA0
.org 0x20C9544 + 0x10*0x50 + 0x4	// Wolf Woods EX
	.db	0xA0
.org 0x20C9544 + 0x10*0x51 + 0x4	// Wolf Woods SP
	.db	0xA0
.org 0x20C9544 + 0x10*0x52 + 0x4	// Crown Thunder
	.db	0xB0
.org 0x20C9544 + 0x10*0x53 + 0x4	// Crown Thunder EX
	.db	0xB0
.org 0x20C9544 + 0x10*0x54 + 0x4	// Crown Thunder SP
	.db	0xB0
.org 0x20C9544 + 0x10*0x55 + 0x4	// Pegasus Magic EX (ghost)
	.db	0xC0

// Enable running from freefights
.org 0x20C9544 + 0x10*0x4C		// Cancer Bubble
	.dw	0xA84
.org 0x20C9544 + 0x10*0x4D		// Cancer Bubble EX
	.dw	0xE84
.org 0x20C9544 + 0x10*0x4E		// Cancer Bubble SP
	.dw	0xE84
.org 0x20C9544 + 0x10*0x4F		// Wolf Woods
	.dw	0xA84
.org 0x20C9544 + 0x10*0x50		// Wolf Woods EX
	.dw	0xE84
.org 0x20C9544 + 0x10*0x51		// Wolf Woods SP
	.dw	0xE84
.org 0x20C9544 + 0x10*0x52		// Crown Thunder
	.dw	0xA84
.org 0x20C9544 + 0x10*0x53		// Crown Thunder EX
	.dw	0xE84
.org 0x20C9544 + 0x10*0x54		// Crown Thunder SP
	.dw	0xE84

// Add reward screens to certain fixed fights
.org 0x20C9544 + 0x10*0x01		// Jammer
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x10		// Jammer G
	.dw	0x80C			// No game over, no escape, no G virus
.org 0x20C9544 + 0x10*0x16		// Pegasus Shadow
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x17		// Jammer G (Star Force tutorial)
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x19
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x1E
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x1F
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x20
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x21
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x23
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x24
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x25		// Gemini Spark refight (story)
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x26		// Station Comp 1 - Cygnus Wing EX
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x27		// Station Comp 2 - Taurus Fire EX
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x28		// Station Comp 3 - Libra Scales EX
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x29		// Station Comp 4 - Queen Ophiuca EX
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x2C
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x2D		// Pegasus Magic
	.dw	0x888			// No escape, boss battle, no G virus
.org 0x20C9544 + 0x10*0x2E		// Sumar Guy quest battle
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x2F		// Tuggy McGrav quest battle
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x30		// Job Goode quest battle
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x31		// Collin Waytin quest battle 1
	.dw	0x848			// No escape, no reward, no G virus
.org 0x20C9544 + 0x10*0x32		// Collin Waytin quest battle 2
	.dw	0x848			// No escape, no reward, no G virus
.org 0x20C9544 + 0x10*0x33		// Collin Waytin quest battle 3
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x34		// Dee Jay quest battle 1
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x35		// Dee Jay quest battle 2
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x36		// Dee Jay quest battle 3
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x37		// Bob Copper quest battle 1
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x38		// Bob Copper quest battle 2
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x39		// Bob Copper quest battle 3
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x3A		// Hope Stelar quest battle
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x44		// Zack Temple quest battle 10
	.dw	0x808			// No escape, no G virus
.org 0x20C9544 + 0x10*0x45		// MegaMan.EXE quest battle
	.dw	0x808			// No escape, no G virus

// Gemini Spark story refight to EX
.org 0x20C8FC0
	.dh	0x120	// Black EX
.org 0x20C8FC6
	.dh	0x123	// White EX


// Change Cloaker/SearchEye duration to unsigned 16-bit
.org 0x02007E36
	ldrh	r0,[r1,r0]	// Cloaker
.org 0x02007E52
	strh	r0,[r2,r1]	// Cloaker
.org 0x02007E68
	ldrh	r3,[r4,r1]	// Cloaker
.org 0x02007E6C
	strh	r0,[r4,r1]	// Cloaker
.org 0x02007E70
	ldrh	r0,[r0,r1]	// Cloaker
.org 0x02007E7C
	strh	r3,[r0,r1]	// Cloaker
.org 0x02007E90
	strh	r2,[r1,r0]	// Cloaker
.org 0x02007EA2
	ldrh	r0,[r1,r0]	// SearchEye
.org 0x02007EBE
	strh	r0,[r2,r1]	// SearchEye
.org 0x02007ED4
	strh	r3,[r2,r0]	// SearchEye



// Decrement SearchEye and ElemSearch duration along with Cloaker
.org 0x02007E5C
.area 0x28
fieldCloakerDecrement:
	push	r3,r14
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFC		// r1 address will be modified
	mov	r2,r1		// r2 address will not
	mov	r3,0x4		// flag and loop counter

@@loop:
	// Decrement duration
	ldrh	r0,[r1,0x8]
	sub	r0,0x1
	bmi	@@next
	strh	r0,[r1,0x8]
	bne	@@next

	// Set expired flag
	ldrb	r0,[r2,0xB]
	orr	r0,r3
	strb	r0,[r2,0xB]

@@next:
	sub	r1,0x2
	lsr	r3,r3,0x1
	bne	@@loop
	pop	r3,r15

	// pool in fieldCloakerClear
.endarea



// Clear ElemSearch duration along with Cloaker
.org 0x02007E84
.area 0x14
fieldCloakerClear:
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFC
	mov	r0,0x0
	str	r0,[r1,0x4]	// Cloaker and ElemSearch duration
	strh	r0,[r1,0xA]	// ElemSearch element and expire flags
	bx	r14

	.pool
.endarea



// Check for expired Sub Cards
.org 0x020233EE
	bl	common_subcardExpireMessage



// Set SearchEye proc rate to 75%
.org 0x02007946
	mov	r1,0x10
.org 0x0200794C
	cmp	r0,0xC

// Don't expire SearchEye on successful proc
.org 0x02007958
	nop
	nop

// Don't update last battle if SearchEye active
.org 0x02015080
	bl	common_setLastBattle


// Add Cipher mails
.org 0x2008160
.area 0x10,0x00
	push	r14
	ldr	r1,=0x20F7A78
	bl	common_getCipherMail
	ldr	r0,[r1,r0]
	pop	r15
	.pool
.endarea


// Hijack Cipher mail system for Boktai Brother mail
.org 0x2023C94
	bl	common_cipherBoktai


// Fix Shin e-mail glitch
.org 0x2015B2C
	.dw	0x1678		// from 0x1677


// Adjust positionOptionFromCenter to use text width in pixels directly
.org 0x0201A164
.area 0x58
positionOptionFromCenter_Text:
	mov	r2,0x4E
	b	positionOptionFromCenter

positionOptionFromCenter_Credits:
	mov	r2,0x60

positionOptionFromCenter:
	push	r14

	// Get width parameter
	ldr	r1,[r0,0x10]
	ldrb	r1,[r1,0x2]
	lsr	r1,r1,0x1
	lsl	r1,r1,0x2

	lsl	r2,r2,0x2
	sub	r1,r2,r1

	// Store new x-position
	mov	r2,0x44
	strh	r1,[r0,r2]

	// Exit
	mov	r1,0x3
	bl	0x201E6C8
	mov	r0,0x0
	pop	r15
.endarea

// Also use above positionOptionFromCenter implementation for credits
.org 0x020FC3D8
	dw	positionOptionFromCenter_Credits|1b
	// This creates 0x58 bytes of free space at 0x0201EF9C



// Use full 16px height of font character
.org 0x0201DEBE
	cmp	r1,0x10
// Decrease tile lookahead for font
// (prevents some text from running off the screen)
.org 0x0201DF76
	nop



// Don't expire Cloakers when pulsing in
.org 0x020241E2
	nop
	nop

// Don't expire Cloakers when pulsing out
.org 0x020243AE
	bl	common_pulseOutExpireCloaker


.org 0x20193D2	// Show happy Geo in menus
	bl	common_mugshotShow
	ldr	r0,[0x2019478]

.org 0x2009614	// Show happy Geo in final stretch of game (after unlocking FM King door)
	mov	r0,0x5B
.org 0x2009628	// Show happy Geo before Time Square cutscene on Gemini Spark Day 2
	.dw	0x72C

.org 0x2020412	// Legendary Master Shin shadow mugshot
.area 0xA
	push	r14
	ldr	r1,=common_getSpriteFile|1
	bx	r1
	.pool
.endarea


.org 0x201BD88	// Treat space char as spoken
	nop	// r0 = 0 if space, != 0 if not space
.org 0x201B08C	// Improve Omega-Xis talking animation
	bl	common_faceTalkExtra


// Remove same color check for card display, use white border for white cards
.org 0x2025E0E
	sub	r0,0x3		// r0 = 0x16A
	ldrh	r0,[r4,r0]
	bl	common_cardFrame



// Change library icon
.org 0x2026102	// Common
	bl	common_getLibraryIcon
.org 0x20264CC	// Trade screen (before)
	bl	common_getLibraryIcon
.org 0x2026BA6	// Trade screen (after 1)
	bl	common_getLibraryIcon
.org 0x2026D94	// Trade screen (after 2)
	bl	common_getLibraryIcon
.org 0x2026126	// X common
	sub	r2,0x2D
.org 0x20264F0	// X trade screen (before)
	sub	r2,0x2D
.org 0x2026BCA	// X trade screen (after 1)
	sub	r2,0x2D
.org 0x2026DB8	// X trade screen (after 2)
	sub	r2,0x2D
.org 0x202612C	// Shape common
	bl	common_drawLibraryIcon
.org 0x20264F6	// Shape trade screen (before)
	bl	common_drawLibraryIcon
.org 0x2026BD0	// Shape trade screen (after 1)
	bl	common_drawLibraryIcon
.org 0x2026DBE	// Shape trade screen (after 2)
	bl	common_drawLibraryIcon
.org 0x2026164	// Y common
	sub	r5,0x29
.org 0x2026504	// Y trade screen (before)
	sub	r5,0x29
.org 0x2026BDE	// Y trade screen (after 1)
	sub	r5,0x29
.org 0x2026DCC	// Y trade screen (after 2)
	sub	r5,0x29
.org 0x2026176	// Palette common
	ldrh	r5,[r4,0x20]
.org 0x2026516	// Palette trade screen (before)
	ldrh	r5,[r4,0x20]
.org 0x2026BF0	// Palette trade screen (after 1)
	ldrh	r5,[r4,0x20]
.org 0x2026DDE	// Palette trade screen (after 2)
	ldrh	r5,[r4,0x20]
.org 0x202617A	// Palette common
	lsr	r5,r5,0xC
.org 0x202651A	// Palette trade screen (before)
	lsr	r5,r5,0xC
.org 0x2026BF4	// Palette trade screen (after 1)
	lsr	r5,r5,0xC
.org 0x2026DE2	// Palette trade screen (after 2)
	lsr	r5,r5,0xC

.org 0x20EF09C	// Base tile for multiplayer trade menu
	.dw	0xCC00
.org 0x20EF0B4	// Base tile for multiplayer trade confirm
	.dw	0xCC00
.org 0x20EF0B8	// Free VRAM base for multiplayer trade confirm (card image 2)
	.dw	0xDD00

// Keep Library icon during trade animation
.org 0x2029A46
	bl	common_keepLibraryIconDuringTrade
.org 0x2026678
	bl	common_drawLibraryIconTradeState2
.org 0x2026740
	bl	common_drawLibraryIconTradeState3
.org 0x20267DE
	bl	common_drawLibraryIconTradeState4
.org 0x202688A
	bl	common_drawLibraryIconTradeState5
.org 0x202696A
	bl	common_drawLibraryIconTradeState6
.org 0x2026A5C
	bl	common_drawLibraryIconTradeState7


// Move card attack value
.org 0x2026262
	sub	r3,0x8
.org 0x2029640	// Multiplayer trade menu - draw
	mov	r2,0x5
.org 0x202968E	// Multiplayer trade menu - clear
	mov	r2,0x5
.org 0x20298FA	// Multiplayer trade confirm - draw
	mov	r2,0x5
.org 0x202998E	// Multiplayer trade confirm - clear
	mov	r2,0x5


// Hide invalid element icon
.org 0x202609E
	cmp	r6,0x4
	bgt	0x2026100


.org 0x20068E4	// Prevent recording Hollow panels in Best Combo
	bl	common_recordBestComboPanel

.org 0x200689A	// Fix add-on card bug in Best Combo
	bl	common_bestComboFixPowerUpCardCheck


// Button controls for PropellerMan
.org 0x2022A38
	bl	common_propellerInit
.org 0x2022A40
	bl	common_propeller

// Wave beam
.org 0x2013D10
	bl	common_waveBeamSkipObjectInit
.org 0x202D332
	bl	common_simulateTouch
.org 0x202D360	// Fix touch hitbox overlap on Bob Copper's Transer in Chapter 3
	bl	common_fixTouchHitboxOverlap


// Brother Satellites
.org 0x020CA3F8
	// Sonia: Pegasus
	db	0x01
.org 0x020CABB4
	// Luna: Dragon
	db	0x03
.org 0x020CA524
	// Bud: Leo
	db	0x02
.org 0x020CA5D8
	// Zack: Pegasus
	db	0x01


// Use some card counts as flags
.org 0x202401C
	bl	common_flagSetHook
.org 0x2024060
	bl	common_flagClearHook
.org 0x202409C
	push	r14
	bl	common_flagCheckHook
.org 0x20240B6
	pop	r15
.org 0x20240BA
	pop	r15
.org 0x2006EAA
	bl	common_giveCardHook
.org 0x2018EF4
	bl	common_textItemGiveCardSFX
.org 0x20073DC	// Exclude flag cards from total card count
	cmp	r5,0x3
	bne	@@normal
	cmp	r6,0xE7
	blt	@@next
@@normal:
	mov	r0,r6
	mov	r1,r5
	bl	0x20070FC
	ldrb	r0,[r0]
	add	r4,r4,r0
@@next:
	add	r5,0x1
.org 0x20075E4	// Exclude flag cards from card box list
	cmp	r5,0x3
	bne	@@normal
	cmp	r4,0xE7
	blt	@@next
@@normal:
	add	r7,r0,r5
	ldrb	r0,[r7,0x8]
	cmp	r0,0x0
	beq	@@next
	mov	r0,r4
	bl	0x2006D1C
	ldrb	r0,[r0]
	lsl	r0,r0,0x18
	lsr	r0,r0,0x1D
	cmp	r0,0x2
	beq	@@next
	ldrb	r0,[r7,0x8]
	add	r6,r6,r0
@@next:
	add	r5,0x1
	cmp	r5,0x4
	bcc	0x20075E2
	add	r4,0x1
	cmp	r4,0xFB
.org 0x2007152	// Don't clear flag card counts on exiting Folder editor
	cmp	r5,0x3
	bne	@@normal
	cmp	r4,(0x160-0xE7)
	bgt	@@next
@@normal:
	add	r0,r3,r5
	strb	r1,[r0,0x8]
@@next:
	add	r5,0x1
	cmp	r5,0x4
	bcc	0x2007152
	add	r3,0x10
	sub	r4,0x1
.org 0x2029D4E	// Exclude flag cards and other cards from multiplayer trade menu
	bl	common_excludeCardsFromTrade


.org 0x2006ED4
	bl	common_moveCardToTopOfCardBox

.org 0x2012E14
	bl	common_clearFlagsOnNewGame


.org 0x2033252
	bl	common_disablePowerUpForTimeTrial


// Extra fade in/out types
.org 0x2011BDE
	ldr	r3,[0x2011BF4]
	bl	common_exFadeTypes1
	add	r3,0x1
	ldrb	r1,[r3,r2]
	strb	r1,[r0,0x9]
	add	r3,0x1
	ldrh	r1,[r3,r2]
.org 0x2012104
	str	r3,[sp]		// free up r5, [sp] shouldn't be modified
.org 0x201211A
	ldrb	r6,[r6,0x1]	// free up r6, don't need original anymore
.org 0x201211E
	ldr	r5,[0x20121B4]	// persists
	bl	common_exFadeTypes2
	ldrb	r2,[r5,r0]
.org 0x2012128
	add	r5,0x1
	ldrb	r0,[r5,r0]
.org 0x201213E
	mov	r1,r6
.org 0x2012146
	add	r5,0x1
.org 0x201214C
	ldrb	r1,[r5,r0]
	nop
.org 0x2012154
	add	r5,0x1
	ldrb	r0,[r5,r0]
.org 0x2012164
	mov	r1,r6
.org 0x201216C
	add	r5,0x1
.org 0x2012172
	ldrb	r1,[r5,r0]
	nop
.org 0x201217A
	add	r5,0x1
	ldrb	r0,[r5,r0]
.org 0x201218A
	mov	r1,r6
.org 0x2012192
	add	r5,0x1
.org 0x2012198
	ldrb	r1,[r5,r0]
	nop
.org 0x20121A0
	add	r5,0x1
	ldrb	r0,[r5,r0]

// Possibility to skip fade reset
.org 0x2011BB8
	bl	common_skipFadeReset


// Allocate more overlays
.org 0x2020956
	lsl	r2,r1,0x1
.org 0x202095C
	ldrh	r1,[r1,r2]
.org 0x2020970
	lsl	r2,r4,0x1
	ldrh	r1,[r1,r2]
.org 0x202099A
	lsl	r2,r2,0x1
	ldrh	r1,[r1,r2]

.org 0x20FCBA0
.area 0xA18
// Existing overlays
	.dh	0x010, 0x011, 0x00F, 0x012, 0x013, 0x014, 0x015, 0x017, 0x016, 0x018, 0x019, 0x01A, 0x01B, 0x01C
	.dh	0x01D, 0x000, 0x002, 0x003, 0x007, 0x008, 0x009, 0x00A, 0x004, 0x005, 0x006, 0x00B, 0x00C, 0x00D
	.dh	0x00E, 0x001, 0x277, 0x278, 0x279, 0x27A, 0x27B, 0x27C, 0x27D, 0x27E, 0x27F, 0x280, 0x281, 0x282
	.dh	0x283, 0x284, 0x285, 0x01E, 0x01F, 0x020, 0x021, 0x022, 0x023, 0x024, 0x025, 0x026, 0x027, 0x028
	.dh	0x029, 0x02A, 0x02B, 0x02C, 0x02D, 0x02E, 0x02F, 0x030, 0x031, 0x032, 0x033, 0x034, 0x035, 0x036
	.dh	0x037, 0x038, 0x039, 0x03A, 0x03B, 0x03C, 0x03D, 0x03E, 0x03F, 0x040, 0x041, 0x042, 0x043, 0x044
	.dh	0x045, 0x046, 0x047, 0x048, 0x049, 0x04A, 0x04B, 0x04C, 0x04D, 0x04E, 0x04F, 0x050, 0x051, 0x052
	.dh	0x053, 0x054, 0x055, 0x056, 0x057, 0x058, 0x059, 0x05A, 0x05B, 0x05C, 0x05D, 0x05E, 0x05F, 0x060
	.dh	0x061, 0x062, 0x063, 0x064, 0x065, 0x066, 0x067, 0x068, 0x069, 0x06A, 0x06B, 0x06C, 0x06D, 0x06E
	.dh	0x06F, 0x070, 0x071, 0x072, 0x073, 0x074, 0x075, 0x076, 0x077, 0x078, 0x079, 0x07A, 0x07B, 0x07C
	.dh	0x07D, 0x07E, 0x07F, 0x080, 0x081, 0x082, 0x083, 0x084, 0x085, 0x086, 0x087, 0x088, 0x089, 0x08A
	.dh	0x08B, 0x08C, 0x08D, 0x08E, 0x08F, 0x090, 0x091, 0x092, 0x093, 0x094, 0x095, 0x096, 0x097, 0x098
	.dh	0x099, 0x09A, 0x09B, 0x09C, 0x09D, 0x09E, 0x09F, 0x0A0, 0x0A1, 0x0A2, 0x0A3, 0x0A4, 0x0A5, 0x0A6
	.dh	0x0A7, 0x0A8, 0x0A9, 0x0AA, 0x0AB, 0x0AC, 0x0AD, 0x0AE, 0x0AF, 0x0B0, 0x0B1, 0x0B2, 0x0B3, 0x0B4
	.dh	0x0B5, 0x0B6, 0x0B7, 0x0B8, 0x0B9, 0x0BA, 0x0BB, 0x0BC, 0x0BD, 0x0BE, 0x0BF, 0x0C0, 0x0C1, 0x0C2
	.dh	0x0C3, 0x0C4, 0x0C5, 0x0C6, 0x0C7, 0x0C8, 0x0C9, 0x0CA, 0x0CB, 0x0CC, 0x0CD, 0x0CE, 0x0CF, 0x0D0
	.dh	0x0D1, 0x0D2, 0x0D3, 0x0D4, 0x0D5, 0x0D6, 0x0D7, 0x0D8, 0x0D9, 0x0DA, 0x0DB, 0x0DC, 0x0DD, 0x0DE
	.dh	0x0DF, 0x0E0, 0x0E1, 0x0E2, 0x0E3, 0x0E4, 0x0E5, 0x0E6, 0x0E7, 0x0E8, 0x0E9, 0x0EA, 0x0EB, 0x0EC
	.dh	0x0ED, 0x0EE, 0x0EF, 0x0F0, 0x0F1, 0x0F2, 0x0F3, 0x0F4, 0x0F5, 0x0F6, 0x0F7, 0x0F8, 0x0F9, 0x0FA
	.dh	0x0FB, 0x0FC, 0x0FD, 0x0FE, 0x0FF, 0x100, 0x101, 0x102, 0x103, 0x104, 0x105, 0x106, 0x107, 0x108
	.dh	0x109, 0x10A, 0x10B, 0x10C, 0x10D, 0x10E, 0x10F, 0x110, 0x111, 0x112, 0x113, 0x114, 0x115, 0x116
	.dh	0x117, 0x118, 0x119, 0x11A, 0x11B, 0x11C, 0x11D, 0x11E, 0x11F, 0x120, 0x121, 0x122, 0x123, 0x124
	.dh	0x125, 0x126, 0x127, 0x128, 0x129, 0x12A, 0x12B, 0x12C, 0x12D, 0x12E, 0x12F, 0x130, 0x131, 0x132
	.dh	0x133, 0x134, 0x135, 0x136, 0x137, 0x138, 0x139, 0x13A, 0x13B, 0x13C, 0x13D, 0x13E, 0x13F, 0x140
	.dh	0x141, 0x142, 0x143, 0x144, 0x145, 0x146, 0x147, 0x148, 0x149, 0x14A, 0x14B, 0x14C, 0x14D, 0x14E
	.dh	0x14F, 0x150, 0x151, 0x152, 0x153, 0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x15A, 0x15B, 0x15C
	.dh	0x15D, 0x15E, 0x15F, 0x160, 0x161, 0x162, 0x163, 0x164, 0x165, 0x166, 0x167, 0x168, 0x169, 0x16A
	.dh	0x16B, 0x16C, 0x16D, 0x16E, 0x16F, 0x170, 0x171, 0x172, 0x173, 0x174, 0x175, 0x176, 0x177, 0x178
	.dh	0x179, 0x17A, 0x17B, 0x17C, 0x17D, 0x17E, 0x17F, 0x180, 0x181, 0x182, 0x183, 0x184, 0x185, 0x186
	.dh	0x187, 0x188, 0x189, 0x18A, 0x18B, 0x18C, 0x18D, 0x18E, 0x18F, 0x190, 0x191, 0x192, 0x193, 0x194
	.dh	0x195, 0x196, 0x197, 0x198, 0x199, 0x19A, 0x19B, 0x19C, 0x19D, 0x19E, 0x19F, 0x1A0, 0x1A1, 0x1A2
	.dh	0x1A3, 0x1A4, 0x1A5, 0x1A6, 0x1A7, 0x1A8, 0x1A9, 0x1AA, 0x1AB, 0x1AC, 0x1AD, 0x1AE, 0x1AF, 0x1B0
	.dh	0x1B1, 0x1B2, 0x1B3, 0x1B4, 0x1B5, 0x1B6, 0x1B7, 0x1B8, 0x1B9, 0x1BA, 0x1BB, 0x1BC, 0x1BD, 0x1BE
	.dh	0x1BF, 0x1C0, 0x1C1, 0x1C2, 0x1C3, 0x1C4, 0x1C5, 0x1C7, 0x1C6, 0x1C8, 0x1C9, 0x1CA, 0x1CB, 0x1CC
	.dh	0x1CD, 0x1CE, 0x1CF, 0x1D0, 0x1D1, 0x1D2, 0x1D3, 0x1D4, 0x1D5, 0x1D6, 0x1D7, 0x1D8, 0x1D9, 0x1DA
	.dh	0x1DB, 0x1DC, 0x1DD, 0x1DE, 0x1DF, 0x1E0, 0x1E1, 0x1E2, 0x1E3, 0x1E4, 0x1E5, 0x1E6, 0x1E7, 0x1E8
	.dh	0x1E9, 0x1EA, 0x1EB, 0x1EC, 0x1ED, 0x1EE, 0x1EF, 0x1F0, 0x1F1, 0x1F2, 0x1F3, 0x1F4, 0x1F5, 0x1F6
	.dh	0x1F7, 0x1F8, 0x1F9, 0x1FA, 0x1FB, 0x1FC, 0x1FD, 0x1FE, 0x1FF, 0x200, 0x201, 0x202, 0x203, 0x204
	.dh	0x205, 0x206, 0x207, 0x208, 0x209, 0x20A, 0x20B, 0x20C, 0x20D, 0x20E, 0x20F, 0x210, 0x211, 0x212
	.dh	0x213, 0x214, 0x215, 0x216, 0x217, 0x218, 0x219, 0x21A, 0x21B, 0x21C, 0x21D, 0x21E, 0x21F, 0x220
	.dh	0x221, 0x222, 0x223, 0x224, 0x225, 0x226, 0x227, 0x228, 0x229, 0x22A, 0x22B, 0x22C, 0x22D, 0x22E
	.dh	0x22F, 0x230, 0x231, 0x232, 0x233, 0x234, 0x235, 0x236, 0x237, 0x238, 0x239, 0x23A, 0x23B, 0x23C
	.dh	0x23D, 0x23E, 0x23F, 0x240, 0x241, 0x242, 0x243, 0x244, 0x245, 0x246, 0x247, 0x248, 0x249, 0x24A
	.dh	0x24B, 0x24C, 0x24D, 0x24E, 0x24F, 0x250, 0x251, 0x252, 0x253, 0x254, 0x255, 0x256, 0x257, 0x258
	.dh	0x259, 0x25A, 0x25B, 0x25D, 0x25C, 0x25E, 0x25F, 0x260, 0x261, 0x263, 0x262, 0x264, 0x265, 0x266
	.dh	0x267, 0x268, 0x269, 0x26A, 0x26B, 0x26C, 0x26D, 0x26E, 0x26F, 0x270, 0x271, 0x272, 0x273, 0x274
	.dh	0x275, 0x276
// New overlays
	.dh	0x286	// overlay_0646
	.dh	0x287	// overlay_0647
	.dh	0x288	// overlay_0648
	.dh	0x289	// overlay_0649
	.dh	0x28A	// overlay_0650
	.dh	0x28B	// overlay_0651
	.dh	0x28C	// overlay_0652
	.dh	0x28D	// overlay_0653
	.dh	0x28E	// overlay_0654
	.dh	0x28F	// overlay_0655
	.dh	0x290	// overlay_0656
	.dh	0x291	// overlay_0657
	.dh	0x292	// overlay_0658
	.dh	0x293	// overlay_0659
	.dh	0x294	// overlay_0660
	.dh	0x295	// overlay_0661
	.dh	0x296	// overlay_0662
	.dh	0x297	// overlay_0663
.endarea


// Allocate more cutscene text archives
.org 0x20F8FA4
.area 0x4A0,0x00
	.dh	0x067, 0x068, 0x069, 0x06A, 0x06B, 0x06C, 0x06D, 0x06E, 0x06F, 0x070, 0x071, 0x072, 0x073, 0x074
	.dh	0x075, 0x076, 0x077, 0x078, 0x079, 0x07A, 0x07B, 0x07C, 0x07D, 0x07E, 0x07F, 0x080, 0x081, 0x082
	.dh	0x083, 0x084, 0x085, 0x086, 0x087, 0x088, 0x089, 0x08A, 0x067, 0x067, 0x08B, 0x08C, 0x08D, 0x08E
	.dh	0x08F, 0x090, 0x091, 0x092, 0x093, 0x094, 0x095, 0x096, 0x097, 0x098, 0x099, 0x09A, 0x09B, 0x09C
	.dh	0x09D, 0x09E, 0x09F, 0x0A0, 0x0A1, 0x0A2, 0x0A3, 0x0A4, 0x0A5, 0x0A6, 0x0A7, 0x0A8, 0x0A9, 0x0AA
	.dh	0x0AB, 0x0AC, 0x0AD, 0x0AE, 0x0AF, 0x0B0, 0x0B1, 0x0B2, 0x0B3, 0x0B4, 0x0B5, 0x0B6, 0x0B7, 0x0B8
	.dh	0x0B9, 0x0BA, 0x0BB, 0x0BC, 0x0BD, 0x0BE, 0x0BF, 0x0C0, 0x0C1, 0x0C2, 0x0C3, 0x0C4, 0x0C5, 0x0C6
	.dh	0x0C7, 0x0C8, 0x0C9, 0x0CA, 0x0CB, 0x0CC, 0x0CD, 0x0CE, 0x0CF, 0x0D0, 0x0D1, 0x0D2, 0x0D3, 0x0D4
	.dh	0x0D5, 0x0D6, 0x0D7, 0x0D8, 0x0D9, 0x0DA, 0x0DB, 0x0DC, 0x0DD, 0x0DE, 0x0DF, 0x0E0, 0x0E1, 0x0E2
	.dh	0x0E3, 0x0E4, 0x0E5, 0x0E6, 0x0E7, 0x0E8, 0x0E9, 0x0EA, 0x0EB, 0x0EC, 0x0ED, 0x0EE, 0x0EF, 0x0F0
	.dh	0x0F1, 0x0F2, 0x0F3, 0x0F4, 0x0F5, 0x0F6, 0x0F7, 0x0F8, 0x0F9, 0x0FA, 0x0FB, 0x0FC, 0x0FD, 0x0FE
	.dh	0x0FF, 0x100, 0x101, 0x102, 0x103, 0x104, 0x105, 0x106, 0x107, 0x108, 0x109, 0x10A, 0x10B, 0x10C
	.dh	0x10D, 0x10E, 0x10F, 0x110, 0x111, 0x112, 0x113, 0x114, 0x115, 0x116, 0x117, 0x118, 0x119, 0x11A
	.dh	0x11B, 0x11C, 0x11D, 0x11E, 0x11F, 0x120, 0x121, 0x122, 0x123, 0x124, 0x125, 0x126, 0x127, 0x128
	.dh	0x129, 0x12A, 0x12B, 0x12C, 0x12D, 0x12E, 0x12F, 0x130, 0x131, 0x132, 0x133, 0x134, 0x135, 0x136
	.dh	0x137, 0x138, 0x139, 0x13A, 0x13B, 0x13C, 0x13D, 0x13E, 0x13F, 0x140, 0x141, 0x142, 0x143, 0x144
	.dh	0x145, 0x146, 0x147, 0x148, 0x149, 0x14A, 0x14B, 0x14C, 0x14D, 0x14E, 0x14F, 0x150, 0x151, 0x152
	.dh	0x153, 0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x15A, 0x15B, 0x15C, 0x15D, 0x15E, 0x15F, 0x160
	.dh	0x161, 0x162, 0x163, 0x164, 0x165, 0x166, 0x167, 0x168, 0x169, 0x16A, 0x16B, 0x16C, 0x16D, 0x16E
	.dh	0x16F, 0x170, 0x171, 0x172, 0x173, 0x174, 0x15B, 0x175, 0x176, 0x177, 0x178, 0x179, 0x17A, 0x17B
	.dh	0x17C, 0x17D, 0x17E, 0x4D0, 0x4D1, 0x4D2, 0x4D3, 0x4D4, 0x4D5, 0x4D6, 0x4D7, 0x4D8, 0x4D9, 0x4DA
	.dh	0x4DB, 0x4DC
// New cutscene text archives
	.dh	0x4EA	// mess_1258
	.dh	0x4EB	// mess_1259
	.dh	0x4EC	// mess_1260
	.dh	0x4ED	// mess_1261
	.dh	0x4F1	// mess_1265
	.dh	0x4F2	// mess_1266
	.dh	0x4F3	// mess_1267
	.dh	0x4F5	// mess_1269
	.dh	0x4F6	// mess_1270
.endarea


// Insert font
.org 0x20CB424
	.include "asm/font.asm"
.org 0x2009128
	.dw	arm9_font2
	.dw	arm9_font0
	.dw	arm9_font1
.org 0x2009404
	.dw	arm9_font2
	.dw	arm9_font0
	.dw	arm9_font1
.org 0x2027A04
	.dw	arm9_font1
.org 0x203972C
	.dw	arm9_font1


// Extra text commands
.org 0x201A5B0
	.dw	common_textCall


// Humor
.org 0x201E938
	bl	common_humor
.org 0x201E940	// Increase buffer size
	mov	r1,(0x3000 >> 0xC)


// Fix msgClose
.org 0x20165E8
	bl	common_textMsgClose1
.org 0x2016604
	bl	common_textMsgClose2

// Fix checkArea
.org 0x201848A
	cmp	r0,0x0


// Extend Buster stats
.org 0x203323E
	bl	common_reloadBusterStats

.org 0x203373A
	bl	common_overrideScannerSatellite


// Add shop
.org 0x2009904
	.dw	common_extraShopText
.org 0x2009888
	.dw	common_extraShopContents
.org 0x20098F8
	.dw	common_extraShopContents

.org 0x20097E4	// Get special shop counts
	push	r0,r3-r7,r14
.org 0x2009834
	bl	common_getExtraShopCount1
.org 0x2009880
	pop	r1,r3-r7,r15
.org 0x2009890
	push	r0,r3-r7,r14
.org 0x20098C8
	bl	common_getExtraShopCount2
.org 0x20098F2
	pop	r1,r3-r7,r15
.org 0x2009788
	bl	common_reduceShopCount

// Updated shops
.org 0x20EB9EC	// Echo Ridge
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(1000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(2000)	// HPMem20
	.db	0x01,0xFF	:: .dh	(37)	:: .dw	0xFFFFFF01,(400)	// PowerBomb1
	.db	0x01,0xFF	:: .dh	(10)	:: .dw	0xFFFFFF01,(500)	// AirSpread
	.db	0x01,0xFF	:: .dh	(128)	:: .dw	0xFFFFFF01,(600)	// Recover30
	.db	0x01,0xFF	:: .dh	(43)	:: .dw	0xFFFFFF01,(800)	// FireRing1
	.db	0x01,0xFF	:: .dh	(23)	:: .dw	0xFFFFFF01,(1000)	// Sword
	.db	0x01,0xFF	:: .dh	(34)	:: .dw	0xFFFFFF01,(1700)	// JetAttack1
.org 0x20EB98C	// Sign Comp
	.db	0x02,0xFF	:: .dh	(96)	:: .dw	0xFFFFFFFF,(100)	// SmEnrgy
	.db	0x02,0xFF	:: .dh	(99)	:: .dw	0xFFFFFFFF,(4000)	// Unlocker
	.db	0x02,0xFF	:: .dh	(100)	:: .dw	0xFFFFFFFF,(500)	// Cloaker
	.db	0x02,0xFF	:: .dh	(92)	:: .dw	0xFFFFFFFF,(500)	// FireSrch
	.db	0x02,0xFF	:: .dh	(93)	:: .dw	0xFFFFFFFF,(500)	// AquaSrch
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
.org 0x20EB92C	// AMAKEN Grounds
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(2000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(3000)	// HPMem20
	.db	0x01,0xFF	:: .dh	(24)	:: .dw	0xFFFFFF01,(1200)	// WideSword
	.db	0x01,0xFF	:: .dh	(7)	:: .dw	0xFFFFFF01,(1500)	// Gatling1
	.db	0x01,0xFF	:: .dh	(58)	:: .dw	0xFFFFFF01,(2000)	// ChainBubl1
	.db	0x01,0xFF	:: .dh	(49)	:: .dw	0xFFFFFF01,(2400)	// FireBzook1
	.db	0x01,0xFF	:: .dh	(82)	:: .dw	0xFFFFFF01,(3000)	// MopLance1
	.db	0x01,0xFF	:: .dh	(21)	:: .dw	0xFFFFFF01,(4500)	// PoisNukle
.org 0x20EB8CC	// AMAKEN Foyer
	.db	0x02,0xFF	:: .dh	(97)	:: .dw	0xFFFFFFFF,(200)	// LrgEnrgy
	.db	0x02,0xFF	:: .dh	(100)	:: .dw	0xFFFFFFFF,(500)	// Cloaker
	.db	0x02,0xFF	:: .dh	(101)	:: .dw	0xFFFFFFFF,(3000)	// SrchEye
	.db	0x02,0xFF	:: .dh	(94)	:: .dw	0xFFFFFFFF,(500)	// ElecSrch
	.db	0x02,0xFF	:: .dh	(95)	:: .dw	0xFFFFFFFF,(500)	// WoodSrch
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
	.db	0x00,0xFF	:: .dh	0xFFFF	:: .dw	0xFFFFFFFF,0xFFFFFFFF
.org 0x20EBA4C	// BIG WAVE
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(3000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(5000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(7000)	// HPMem20
	.db	0x01,0xFF	:: .dh	(130)	:: .dw	0xFFFFFF01,(1500)	// Recover80
	.db	0x01,0xFF	:: .dh	(20)	:: .dw	0xFFFFFF01,(3500)	// StunNukle
	.db	0x01,0xFF	:: .dh	(126)	:: .dw	0xFFFFFF01,(4000)	// AntiSword
	.db	0x01,0xFF	:: .dh	(26)	:: .dw	0xFFFFFF01,(6500)	// BlazngEdge
	.db	0x01,0x01	:: .dh	(245)	:: .dw	0xFFFFFF03,(35000)	// PoisonPhar
.org 0x20EB86C	// Class 5-B
	.db	0x02,0xFF	:: .dh	(98)	:: .dw	0xFFFFFFFF,(800)	// D.Enrgy
	.db	0x02,0xFF	:: .dh	(99)	:: .dw	0xFFFFFFFF,(4000)	// Unlocker
	.db	0x02,0xFF	:: .dh	(100)	:: .dw	0xFFFFFFFF,(500)	// Cloaker
	.db	0x01,0xFF	:: .dh	(131)	:: .dw	0xFFFFFF01,(2400)	// Recover120
	.db	0x01,0xFF	:: .dh	(136)	:: .dw	0xFFFFFF01,(3000)	// Barrier100
	.db	0x01,0xFF	:: .dh	(118)	:: .dw	0xFFFFFF01,(4600)	// GreenBurst
	.db	0x01,0xFF	:: .dh	(28)	:: .dw	0xFFFFFF01,(6500)	// StrikeEdge
	.db	0x01,0xFF	:: .dh	(125)	:: .dw	0xFFFFFF01,(8000)	// Bombalizer
.org 0x20EB80C	// City Dump
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(5000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(7500)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(10000)	// HPMem20
	.db	0x01,0xFF	:: .dh	(132)	:: .dw	0xFFFFFF01,(3000)	// Recover150
	.db	0x01,0xFF	:: .dh	(170)	:: .dw	0xFFFFFF00,(3500)	// SlowGauge
	.db	0x01,0xFF	:: .dh	(141)	:: .dw	0xFFFFFF01,(4000)	// PoisnApple
	.db	0x01,0xFF	:: .dh	(119)	:: .dw	0xFFFFFF01,(4900)	// IceBurst
	.db	0x01,0xFF	:: .dh	(27)	:: .dw	0xFFFFFF01,(6500)	// TidalEdge
.org 0x20EB7AC	// Island Underground
	.db	0x02,0xFF	:: .dh	(98)	:: .dw	0xFFFFFFFF,(800)	// D.Enrgy
	.db	0x02,0xFF	:: .dh	(99)	:: .dw	0xFFFFFFFF,(4000)	// Unlocker
	.db	0x02,0xFF	:: .dh	(101)	:: .dw	0xFFFFFFFF,(3000)	// SrchEye
	.db	0x01,0xFF	:: .dh	(22)	:: .dw	0xFFFFFF01,(4000)	// FreezNukle
	.db	0x01,0xFF	:: .dh	(120)	:: .dw	0xFFFFFF01,(5200)	// PoisBurst
	.db	0x01,0xFF	:: .dh	(121)	:: .dw	0xFFFFFF01,(6000)	// TyphnDance
	.db	0x01,0xFF	:: .dh	(29)	:: .dw	0xFFFFFF01,(6500)	// ArboEdge
	.db	0x01,0xFF	:: .dh	(140)	:: .dw	0xFFFFFF01,(8000)	// SpiritFury
.org 0x20EBAAC	// Deep Space 2
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(8000)	// HPMem20
	.db	0x02,0x01	:: .dh	(113)	:: .dw	0xFFFFFFFF,(12000)	// HPMem20
	.db	0x01,0xFF	:: .dh	(148)	:: .dw	0xFFFFFF00,(6800)	// HolyPanel
	.db	0x01,0xFF	:: .dh	(30)	:: .dw	0xFFFFFF01,(7500)	// BreakSabre
	.db	0x01,0xFF	:: .dh	(142)	:: .dw	0xFFFFFF01,(8000)	// DoublCross
	.db	0x01,0xFF	:: .dh	(143)	:: .dw	0xFFFFFF01,(10000)	// GigaMine
	.db	0x01,0xFF	:: .dh	(169)	:: .dw	0xFFFFFF00,(12000)	// QuickGauge
	.db	0x01,0x01	:: .dh	(235)	:: .dw	0xFFFFFF03,(25000)	// DarkSword


.org 0x20CB608
arm9free:
.area 0x20180,0x00

// Remove Japanese symbols from the fonts
arm9_font0:
	.import TEMP+"/font0.img.bin",0,(0xED * 0x40)
arm9_font1:
	.import TEMP+"/font1.img.bin",0,(0xED * 0x40)
arm9_font2:
	.import TEMP+"/font2.img.bin",0,(0xED * 0x80)


.align 2
common_connectTurnsMenu:
	// r0 = state
	// r4 = this
	cmp	r0,0x13
	beq	@@stateTurnsMenu
	bhi	@@end
	bx	r14

@@stateTurnsMenu:
	// If either player exits
	ldr	r0,=0x2117790
	ldr	r1,=0x21177B0
	ldrb	r0,[r0,0x5]
	ldrb	r1,[r1,0x1]
	cmp	r0,0x82
	beq	@@exit
	cmp	r1,0x82
//	beq	@@exit
	bne	@@checkCancel

@@exit:
	// Exit menu
	mov	r0,r4
	ldr	r1,=0x203A2C8|1
	mov	r2,0x0
	bl	0x2039810
	b	@@end

@@checkCancel:
	ldr	r3,=0x20E4
	add	r3,r4,r3
	cmp	r0,0x81
	beq	@@cancel
	cmp	r1,0x81
	beq	@@cancel
	ldr	r0,[r3,(0x20FC-0x20E4)]	// host ready
	ldr	r1,[r3,(0x2100-0x20E4)]	// client ready
	cmp	r0,0x0
	beq	@@cancel
	cmp	r1,0x0
//	beq	@@cancel
	bne	@@checkOption

@@cancel:
	ldr	r3,=0x20E4
	add	r3,r4,r3
	mov	r0,0x0
	str	r0,[r3,(0x20F4-0x20E4)]	// disable selection

	// Change state to cancelled
	mov	r0,0x7
	str	r0,[r3,(0x20E8-0x20E4)]	// state

	// Start cancelled text script
	mov	r0,r4
	mov	r1,(107)	// mess_1213, script 107
	bl	0x2039BE0

	// Process action
	mov	r0,r4
	bl	0x203B990
	ldr	r1,=0x2117770
	strb	r0,[r1,0x2]
	b	@@end

@@checkOption:
	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@sendCancel

	// Check script finished
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

	// Get last choice
	bl	0x2008DC0
	// Store number of turns
	add	r1,=common_connectNumberOfTurns
	str	r0,[r1]

	// This also reloads Humor Buster and Geo/DX name
	bl	0x20080FC	// reload stats

	mov	r0,r4
	bl	common_connectConfirmResponse

	b	@@end

@@sendCancel:
	mov	r0,r4
	bl	common_connectSendCancel

//	b	@@end

@@end:
	// jump to end of function
	ldr	r0,=0x203B0AE|1
	bx	r0

.align 2
common_connectSendCancel:
	push	r4,r14
	mov	r4,r0		// this

	// Play cancel SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x8B
	bl	0x2025574

	// Start cancelled text script
	mov	r0,r4
	mov	r1,(107)
	bl	0x2039BE0

	// Set state to cancelled
	ldr	r0,=0x20E8
	mov	r1,0x7
	str	r1,[r4,r0]

	// Send cancel to other player
	mov	r0,0x81
	ldr	r1,=0x2117770
	strb	r0,[r1,0x2]

	pop	r4,r15

.align 2
common_connectOpenTurnsMenu:
	push	r4,r14
	mov	r4,r0		// this

	// Start turns menu text script
	mov	r0,r4
	mov	r1,(116)	// mess_1213, script 116
	bl	0x2039BE0

	// Change state to choosing turns
	ldr	r0,=0x20E8
	mov	r1,0x13
	str	r1,[r4,r0]

	// Clear number of turns
	add	r1,=common_connectNumberOfTurns
	str	r0,[r1]

	// This also reloads Humor Buster and Geo/DX name
	bl	0x20080FC	// reload stats

	pop	r4,r15

.align 4
common_connectNumberOfTurns:
	.dw	0x0

.align 2
common_connectConfirmResponse:
	push	r4,r14
	mov	r4,r0		// this

	// Send confirm response to other player
	ldr	r0,=0x2117770
	mov	r1,0x80
	strb	r1,[r0,0x2]

	// Start waiting for response text script
	mov	r0,r4
	mov	r1,(106)	// mess_1213, script 106
	bl	0x2039BE0

	// Change state to waiting for response
	ldr	r0,=0x20E8
	mov	r1,0xB
	str	r1,[r4,r0]

	pop	r4,r15


.align 2
common_connectFadeIn:
	mov	r0,(0x718 >> 0x3)
	lsl	r0,r0,0x3
	ldrb	r0,[r4,r0]
	cmp	r0,0x4
	beq	@@skip

@@normal:
	mov	r0,0x20
	str	r0,[sp]
	bx	r14
@@skip:
	// Skip the fade in (already started)
	bl	0x2038CA4


.align 2
common_get32BitExVar:
	// r0 = chip ID
	push	r14
	mov	r1,0x3
	bl	0x20070FC	// pointer

	// Read variable
	ldrb	r1,[r0]
	ldrb	r2,[r0,0x10]
	lsl	r2,r2,0x8
	orr	r1,r2
	add	r0,0x20
	ldrb	r2,[r0]
	lsl	r2,r2,0x10
	orr	r1,r2
	ldrb	r0,[r0,0x10]
	lsl	r0,r0,0x18
	orr	r0,r1

	pop	r15


.align 2
common_set32BitExVar:
	// r0 = chip ID, r1 = value
	push	r4,r14
	mov	r4,r1
	mov	r1,0x3
	bl	0x20070FC	// pointer

	// Write variable
	strb	r4,[r0]
	lsr	r1,r4,0x8
	strb	r1,[r0,0x10]
	lsr	r1,r1,0x8
	add	r0,0x20
	strb	r1,[r0]
	lsr	r1,r1,0x8
	strb	r1,[r0,0x10]

	pop	r4,r15


.align 2
common_transerEquipTouch:
	cmp	r0,0x0
	beq	@@checkTouch
	bx	r14

@@checkTouch:
	push	r6-r7

	// Check touch screen being touched
	ldr	r1,=(0x2121040+0x8)
	ldrh	r0,[r1,0x4]	// touched
	cmp	r0,0x0
	beq	@@end
	// Check touch screen valid
	ldrh	r0,[r1,0x6]	// error
	cmp	r0,0x0
	bne	@@end

	// Get touch screen x, y
	mov	r2,0x0
	ldsh	r0,[r1,r2]	// x
	mov	r2,0x2
	ldsh	r1,[r1,r2]	// y

	// Check button touched
	add	r7,=@@equipButtons
	mov	r6,0x0
@@loop:
@@checkX:
	ldrb	r2,[r7]		// x
	cmp	r0,r2
	blt	@@next
@@checkW:
	ldrb	r3,[r7,0x2]	// w
	add	r2,r2,r3
	cmp	r0,r2
	bge	@@next
@@checkY:
	ldrb	r2,[r7,0x1]	// y
	cmp	r1,r2
	blt	@@next
@@checkH:
	ldrb	r3,[r7,0x3]	// h
	add	r2,r2,r3
	cmp	r1,r2
	bge	@@next

	// Found button
	// Check flag
	ldrh	r1,[r7,0x4]
	cmp	r1,0x0
	beq	@@trigger
	bl	0x202409C	// check flag	
	cmp	r0,0x0
	beq	@@end

@@trigger:
	// Clear Navi flags
	mov	r1,0x40
	mov	r2,0x5
	bl	0x202407C	// clear flag range

	// Set top screen
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0xFB
	strb	r6,[r0,r1]

	// Change state
	ldr	r2,=0x20FD7A4
	mov	r3,r4
	ldmia	[r2]!,r0-r1
	stmia	[r3]!,r0-r1

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x88
	bl	0x2025574

	pop	r6-r7
	bl	0x202C24E

@@next:
	add	r7,0x6
	add	r6,0x1
	cmp	r6,0x3
	blt	@@loop

@@end:
	pop	r6-r7
	bl	0x202BD00

.align 4
@@equipButtons:
	// x, y, w, h, flag
	.db	 (15), (47), (42), (17)	:: .dh	0x0000
	.db	 (77), (47), (42), (17)	:: .dh	0x020C
	.db	(139), (47), (42), (17)	:: .dw	0x0208

	.pool


.align 2
common_getShareStars:
	push	r14

	// Check Time Trial active
	push	r0-r3
	ldr	r1,=0xF008
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	bne	@@noShareStars

	// Check if this is a Star Card
	cmp	r1,(170)
	bgt	@@end
	cmp	r2,0x2		// blue
	bne	@@end

@@noShareStars:
	// Always 0 share stars
	mov	r0,0x0
	add	sp,0x4
	pop	r3-r7,r15

@@end:
	lsl	r0,r2,0x9
	orr	r0,r1
	pop	r15

.align 2
common_compareCardsForShareStars:
	push	r4-r5,r14

	lsl	r7,r4,0x2
	ldrh	r7,[r5,r7]	// card value

	lsl	r4,r7,0x17
	lsr	r4,r4,0x17	// card ID
	lsr	r5,r7,0x9	// card color

	// Check if this is a Star Card
	cmp	r4,(170)
	bgt	@@end
	cmp	r5,0x2		// blue
	bne	@@end

	// Change to yellow
	mov	r5,0x1
	lsl	r5,r5,0x9
	mov	r7,r4
	orr	r7,r5

@@end:
	pop	r4-r5,r15


.align 2
common_getNumberOfDXBossesDefeated:
	push	r6-r7,r14
	mov	r6,0x0
	mov	r7,0x0

@@checkDXLoop:
	// Skip Andromeda
	cmp	r6,0x6		// Andromeda
	beq	@@checkDXNext

	ldr	r1,=0xF17F
	add	r1,r1,r6
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkDXNext
	add	r7,0x1

@@checkDXNext:
	add	r6,0x1
	cmp	r6,(14)
	blt	@@checkDXLoop

	// If beat all but Andromeda, set Andromeda DX active flag
	cmp	r7,(13)
	blt	@@end

	ldr	r1,=0xF191	// Andromeda DX active
	bl	0x2024018	// set flag

@@end:
	mov	r0,r7
	pop	r6-r7,r15


.align 2
common_reloadBusterStats:
	push	r14
	bl	0x203328C

	bl	common_reloadColorChangeHumorBuster
	pop	r15

.align 2
common_reloadColorChangeHumorBuster:
	push	r4-r5,r14
	mov	r4,0x1		// 0x01 = MMSF DX
	mov	r5,0x0

@@checkColorChange:
	// Check Geo Color Mega Man
	ldr	r1,=0xF17A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHumorBusterType1

	mov	r0,0x2
	orr	r4,r0

@@checkHumorBusterType1:
	ldr	r1,=0xF03A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHumorBusterType2

	mov	r0,0x4
	orr	r4,r0

@@checkHumorBusterType2:
	ldr	r1,=0xF03B
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkNeutralPowerUpData

	mov	r0,0x8
	orr	r4,r0

@@checkNeutralPowerUpData:
	ldr	r1,=0xF193
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkDXColor

	mov	r0,0x10
	orr	r4,r0

@@checkDXColor:
	ldr	r1,=0xF197
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkNumberOfTurns

	mov	r0,0x20
	orr	r4,r0

	// 0x40 reserved for AutoLock off

@@checkNumberOfTurns:
	ldr	r0,=common_connectNumberOfTurns
	ldr	r0,[r0]
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1E
	orr	r5,r0

@@setExtraStats:
	ldr	r0,=0x213BB58
	strb	r4,[r0,0x3]	// extra data 1
	strb	r5,[r0,0x7]	// extra data 2

	pop	r4-r5,r15


.align 2
common_overrideScannerSatellite:
	// reserved: r0, r1, r3
	ldr	r2,=0x213BB58
	ldrb	r2,[r2,0x3]
	lsr	r2,r2,0x5	// test 0x10
	bcc	@@end

	mov	r1,0x0

@@end:
	strb	r1,[r3,0xB]
	ldrb	r1,[r0,0xA]
	bx	r14

	.pool


.align 2
common_bestComboFixPowerUpCardCheck:
	// r0 = 0x21AF18C
	// r7 = card index
	// free: r1, r2, r3
	// Account for attached cards (Attack+10, ParlyzPlus)
	mov	r1,0x0	// index
	mov	r2,0x0	// offset
@@loop:
	cmp	r1,r7
	bge	@@end
	// Get number of attached cards
	ldrb	r3,[r0,r1]
	lsl	r3,r3,0x1C	// probably enough?
	lsr	r3,r3,0x1C
	add	r2,r2,r3

	add	r1,0x1
	b	@@loop

@@end:
	// Offset by number of attached cards before
	add	r0,r0,r2

	ldrb	r2,[r0,r7]
	mov	r0,0xC0
	bx	r14


.align 2
common_getSpriteFile:
	push	r0
	// Check Legendary Master Shin
	ldr	r1,=((17 << 0x10) | (17))	// fieldface_017
	cmp	r0,r1
	bne	@@end

	// Set flag met Legendary Master Shin
	ldr	r1,=0xF177
	bl	0x2024018	// set flag

@@end:
	pop	r0,r15


.align 2
common_isLegendMode:
	push	r0-r3,r14

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag

	pop	r0-r3,r15


.align 2
common_getCardCountNotInExtraFolder:
	// r0 = card
	// r1 = color
	push	r4,r14
	lsl	r4,r1,0x9
	orr	r4,r0

	// Get total count
	bl	0x20070F0	// r0 = count

	// Get Extra Folder
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1,0xC]
	add	r1,0x78

	mov	r2,0x0
@@loop:
	lsl	r3,r2,0x1
	ldrh	r3,[r1,r3]	// card in Extra Folder
	cmp	r3,r4
	bne	@@next
	sub	r0,0x1
@@next:
	add	r2,0x1
	cmp	r2,(30)
	blt	@@loop

	pop	r4,r15


.align 2
common_resetWfcDeleteCopyBrother:
	push	r4,r14
	add	r4,r0,r7
	add	r4,0x8		// Brother ID

	// Get own Brother data
	mov	r1,0x0
	bl	0x200C93C
	add	r0,r0,r7
	add	r0,0x8		// own Brother ID

	// Compare Brother ID
	mov	r3,0x0
@@loop:
	ldrb	r1,[r0,r3]
	ldrb	r2,[r4,r3]
	cmp	r1,r2
	bne	@@delete
	add	r3,0x1
	cmp	r3,0xC
	blt	@@loop

	// Same Brother ID, skip delete
	b	@@end

@@delete:
	mov	r1,r5
	bl	0x200C664

@@end:
	pop	r4,r15


.align 2
common_deepSpaceSPBossRate:
	// Already checked Cloaker active at this point
	push	r14

	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	cmp	r0,0x96		// Deep Space
	bne	@@end

	// Check if SearchEye active
	bl	0x2007E98
	cmp	r0,0x0
	bne	@@highRate
	// Check if ElemSearch active
	bl	common_elemSearchGet
	cmp	r0,0h
	beq	@@end

@@highRate:
	mov	r5,0x4		// 1-in-4

@@end:
	pop	r15


common_startSearchEncounterRate:
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]

	mov	r1,0x3C		// Initial encounter check = 60 frames
	str	r1,[r0,0x6C]

	mov	r1,0xF		// Encounter chance = 15+1%
	add	r0,0x70
	strb	r1,[r0]

	bx	r14


.if OPT_SAVE_PERSIST_BUFFERS
.align 2
common_saveAllocPersistent:
	// Allocate save buffers
	mov	r0,0x0
	ldr	r1,=(EXSAVE_START + EXSAVE_SIZE)
	mov	r2,0x4
	blx	0x208F14C	// arena alloc
	cmp	r0,0x0
	beq	.
	add	r1,=common_savePersistBufferUncompress
	str	r0,[r1]

	mov	r0,0x0
	ldr	r1,=(EXSAVE_START + EXSAVE_SIZE)
	mov	r2,0x4
	blx	0x208F14C	// arena alloc
	cmp	r0,0x0
	beq	.
	add	r1,=common_savePersistBufferCompress
	str	r0,[r1]

	mov	r0,0x0
	mov	r1,(0x2400 >> 0x8)
	lsl	r1,r1,0x8
	mov	r2,0x4
	blx	0x208F14C	// arena alloc
	cmp	r0,0x0
	beq	.
	add	r1,=common_savePersistBufferWork
	str	r0,[r1]

	mov	r0,0x0
	ldr	r1,=EXSAVE_SIZE
	mov	r2,0x4
	blx	0x208F14C	// arena alloc
	cmp	r0,0x0
	beq	.
	add	r1,=common_saveExData
	str	r0,[r1]

	pop	r3-r7,r15

	.pool

.align 4
common_savePersistBufferUncompress:
	.dw	0x0
common_savePersistBufferCompress:
	.dw	0x0
common_savePersistBufferWork:
	.dw	0x0
common_saveExData:
	.dw	0x0
.endif


.align 2
common_respawnBoktaiMysteryWave:
	push	r4,r14
	mov	r4,r0

	// Select a Boktai Mystery Wave
//	mov	r0,r4
	bl	0x215A9B8

	// Activate Boktai Mystery Wave
	mov	r0,r4
	bl	0x215AAA4

	pop	r4,r15


.align 2
common_starCardDescriptionTrade:
	ldsh	r3,[r4,r3]
	push	r2-r3,r14
	ldrh	r1,[r5]		// card ID

	// Check if this is a Star Card
	cmp	r1,(170)
	bgt	@@end
	ldrb	r0,[r5,0x2]	// color flags
	lsr	r0,r0,0x3	// test 0x4
	bcc	@@end

	// Get description
	ldr	r0,=data_extraCardInfo
	lsl	r2,r1,0x1
	ldrh	r3,[r0,r2]		// &FF00 = flags
	lsr	r3,r3,(0x8 + 0x4)	// check flag 0x8
	bcc	@@end

	ldrb	r0,[r0,r2]
	cmp	r0,0x0
	beq	@@end
	add	r0,0xFF
	add	r0,0x1

	// Pack into 32 bit with original card ID
	lsl	r0,r0,0x10
	add	r1,r1,r0

@@end:
	pop	r2-r3,r15


.align 2
common_starCardDescriptionTradeList:
	add	r0,r2,r0
	ldrh	r6,[r0,0x2]	// card ID

	// Check if this is a Star Card
	cmp	r6,(170)
	bgt	@@end
	ldrb	r0,[r0,0xC]	// color flags
	lsr	r0,r0,0x3	// test 0x4
	bcc	@@end

	// Get description
	ldr	r0,=data_extraCardInfo
	lsl	r1,r6,0x1
	ldrh	r2,[r0,r1]		// &FF00 = flags
	lsr	r2,r2,(0x8 + 0x4)	// check flag 0x8
	bcc	@@end

	ldrb	r0,[r0,r1]
	cmp	r0,0x0
	beq	@@end
	add	r0,0xFF
	add	r6,r0,0x1

@@end:
	bx	r14


.align 2
common_drawLibraryIconTradeState2:
	strb	r1,[r4,r0]

	mov	r0,r4
	bl	common_drawLibraryIconStandalone

	// Clear star
	ldr	r0,=0x16D
	ldrb	r1,[r4,r0]
	mov	r2,0x80
	orr	r1,r2
	strb	r1,[r4,r0]	// color

@@drawIcons:
	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

@@end:
	add	sp,0x8
	pop	r3-r7,r15


.align 2
common_drawLibraryIconTradeState3:
common_drawLibraryIconTradeState5:
	strb	r1,[r4,r0]

	mov	r0,r4
	bl	common_drawLibraryIconStandalone

	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	add	sp,0x8
	pop	r3-r7,r15

.align 4
common_drawLibraryIconTradeState4:
common_drawLibraryIconTradeState6:
	push	r0,r14

	mov	r0,r4
	bl	common_drawLibraryIconStandalone

	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	pop	r0
	ldsh	r1,[r4,r0]
	cmp	r1,0x0
	pop	r15

.align 2
common_drawLibraryIconTradeState7:
	strb	r1,[r4,r0]

	mov	r0,r4
	bl	common_drawLibraryIconStandalone

	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	// Re-add star
	ldr	r0,=0x16D
	ldrb	r1,[r4,r0]
	cmp	r1,0xFF
	beq	@@end
	mov	r2,0x80
	bic	r1,r2
	strb	r1,[r4,r0]
@@end:
	add	sp,0x8
	pop	r3-r7,r15



.align 2
common_drawLibraryIconStandalone:
	push	r4-r7,r14
	sub	sp,0x8
	mov	r4,r0

	ldr	r3,=0x16F
	bl	common_getLibraryIcon
	beq	@@end

	// Draw Library icon
	mov	r0,r3
	sub	r0,0xF
	ldrh	r0,[r4,r0]
	mov	r2,r3
	mov	r1,r3
	str	r0,[sp]
	mov	r0,r3
	sub	r0,0xD
	ldrh	r0,[r4,r0]
	sub	r2,0xB
	lsl	r6,r6,0x7
	str	r0,[sp,0x4]
	ldsh	r2,[r4,r2]
	add	r1,0x13
	ldrb	r1,[r4,r1]
	sub	r2,0x2D
	lsl	r2,r2,0x17
	lsr	r5,r2,0x7
	bl	common_drawLibraryIcon
	orr	r2,r5
	mov	r5,r3
	sub	r5,0x9
	ldsh	r5,[r4,r5]
	ldr	r0,=0x211CDC0
	sub	r5,0x29
	lsl	r5,r5,0x18
	lsr	r5,r5,0x18
	orr	r2,r5
	mov	r5,r3
	sub	r5,0x2B
	ldr	r5,[r4,r5]
	lsl	r7,r5,0xA
	mov	r5,r3
	ldrh	r5,[r4,0x20]
	sub	r3,0x1F
	lsr	r5,r5,0xC
	ldr	r3,[r4,r3]
	add	r3,r3,r6
	lsl	r5,r5,0xC
	lsr	r3,r3,0x6
	orr	r3,r5
	orr	r3,r7
	lsl	r3,r3,0x10
	lsr	r3,r3,0x10
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r4-r7,r15


.align 2
common_keepLibraryIconDuringTrade:
	ldr	r0,[r1,r0]

	cmp	r2,0x4
	bne	@@getLibrary
	ldr	r1,=0x16D
	ldrb	r1,[r0,r1]	// current color
	orr	r2,r1

@@getLibrary:
	ldr	r1,=0x16F
	ldrb	r1,[r0,r1]	// current library
	str	r1,[sp]

	mov	r1,r4
	bx	r14

	.pool


.align 2
common_drawCardLabelColorTrade:
	push	r0,r14

	ldrb	r2,[r1,0xC]	// color flags

	cmp	r7,(170)	// card ID
	bgt	@@end
	lsr	r0,r2,0x3	// test 0x4
	bcc	@@end

	mov	r2,0x2		// Set yellow
	mov	r0,r7
	bl	common_isWhiteCardID
	beq	@@end
	mov	r2,0x1		// Set white

@@end:
	str	r2,[sp,0x1C+8]
	cmp	r7,0x0
	pop	r0,r15


.align 2
common_drawCardLabelStarTrade:
	push	r6,r14
	sub	sp,0x8
	mov	r6,0x0
	str	r6,[sp]
	str	r6,[sp,0x4]
	bl	0x1FF8F40

	// Get card data
	ldr	r0,[sp,0x28+0x8+(2*0x4)]
	lsl	r1,r5,0x2
	ldr	r0,[r0,r1]
	mov	r1,0x12
	mul	r0,r1
	ldr	r1,[r4,0x1C]
	add	r0,r1,r0

	ldrh	r1,[r0,0x2]	// card ID
	cmp	r1,(170)
	bgt	@@end
	ldrb	r1,[r0,0xC]	// color flags
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	// Draw star
	// [sp], [sp+0x4] = 0
	mov	r2,r7
	lsr	r2,r2,0x10
	add	r2,0x31	// sub	r0,0x1
	lsl	r2,r2,0x10
	lsl	r0,r5,0x5
	add	r0,(0x18+0xF)
	orr	r2,r0
	ldr	r0,=0x211CDC0
	ldr	r3,=0xBB24
	mov	r1,0x1
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r6,r15


.align 2
common_excludeCardsFromTrade:
	add	r0,r0,r7
	ldrb	r0,[r0,0x8]

	// Check if Standard or Mega Card
	cmp	r4,0xE7
	bge	@@end
	// Check if red card
	cmp	r7,0x3
	blt	@@end

	// Hide the card from the list
	mov	r0,0x0

@@end:
	bx	r14


.align 2
common_checkGBASlotIn:
	// Check GBA cart inserted
	ldr	r0,[r0]
	cmp	r0,0x0
	bne	@@returnTrue

	// Check completed Chapter 1
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrb	r1,[r1,0x2]
	cmp	r1,0x10
	blt	@@end

@@returnTrue:
	mov	r0,0x1
@@end:
	bx	r14


.align 2
common_openGbaAccess:
	push	r14

	add	r0,=@common_gbaIsOpen
	ldr	r1,[r0]
	cmp	r1,0x0
	bne	@@end

	// Set open
	mov	r1,0x1
	str	r1,[r0]

	// Get lock ID
	blx	0x208D1E0	// get lock ID
	add	r1,=@common_gbaLockId
	str	r0,[r1]

	// Try lock cartridge
//	ldr	r0,[@common_gbaLockId]
	blx	0x208D120	// try lock cartridge

/*	// Get current RAM cycle
	ldr	r0,=0x4000204
	ldrh	r1,[r0]
	lsl	r2,r1,0x1E
	lsr	r2,r2,0x1E
	add	r3,=@common_gbaRamCycle
	str	r2,[r1]

	// Set RAM cycle
	lsr	r1,r1,0x2
	lsl	r1,r1,0x2
	add	r1,0x3
	strh	r1,[r0]*/

@@end:
	pop	r15

.align 2
common_closeGbaAccess:
	push	r14

	add	r0,=@common_gbaIsOpen
	ldr	r1,[r0]
	cmp	r1,0x0
	beq	@@end

	// Set closed
	mov	r1,0x0
	str	r1,[r0]

/*	// Reset RAM cycle
	ldr	r0,=0x4000204
	ldrh	r1,[r0]
	lsr	r1,r1,0x2
	lsl	r1,r1,0x2
	ldr	r2,[@common_gbaRamCycle]
	add	r1,r1,r2
	strh	r1,[r0]*/

	// Unlock cartridge
	ldr	r0,[@common_gbaLockId]
	blx	0x208D0F4

	// Release lock ID
	ldr	r0,[@common_gbaLockId]
	blx	0x208D238

@@end:
	pop	r15

.align 4
@common_gbaIsOpen:
	.dw	0x0
.align 4
@common_gbaLockId:
	.dw	0x0
.align 4
@common_gbaRamCycle:
	.dw	0x0

.align 2
common_exceptionHandler:
	// r0 = ptr to context
	push	r4,r14
	sub	sp,0x74		// size
	mov	r4,r0

	// Disable watchdog
	ldr	r0,=@watchdog_fired
	mov	r1,0x1
	str	r1,[r0]

	// Write to save 0
	ldr	r0,=common_currentSaveFile
	mov	r1,0x0
	str	r1,[r0]

	// Prepare context
	mov	r0,r4
	mov	r1,sp
	mov	r2,0x70
	blx	0x2090848

	// Set version number
	ldr	r0,=VERSION
	mov	r1,sp
	add	r1,0x70
	str	r0,[r1]

	// Write context
	mov	r1,0x80
	mov	r2,sp		// exception context
	mov	r3,0x74		// size
	bl	0x200A620

	// Write stack dump
	mov	r1,(0x100 >> 0x8)
	lsl	r1,r1,0x8
	ldr	r2,[r4,0x38]	// r13 from context
	sub	r2,0x10
	mov	r3,(0x200 >> 0x8)
	lsl	r3,r3,0x8
	bl	0x200A620

	add	sp,0x74
	pop	r4,r15


.align 2
common_checkAllCardsCheat:
	push	r4,r14

	// Reset watchdog
	mov	r1,0x0
	add	r0,=@watchdog_counter
	str	r1,[r0]
//	add	r0,=@watchdog_address
//	str	r1,[r0]

	// Setup watchdog
	add	r0,=@watchdog_active
	ldr	r1,[r0]
	cmp	r1,0x0
	bne	@@setupException
	mov	r1,0x1
	str	r1,[r0]

	// Disable interrupts
	blx	0x208FB5C	// disable interrupts
	mov	r4,r0

	// Initialize alarm
	add	r0,=@watchdog_alarm
	blx	0x208F7D0	// create alarm

	// Get current tick
	blx	0x208F644	// get tick (u64)

	// Set as alarm start
	add	r2,=@watchdog_alarm
	str	r0,[r2,0x24]
	str	r1,[r2,0x28]

	// Set period
	ldr	r0,[@watchdog_period]
	ldr	r1,[@watchdog_period+0x4]
	str	r0,[r2,0x1C]
	str	r1,[r2,0x20]

	// Set handler
	ldr	r0,=common_watchdog
	str	r0,[r2]

	// Get current thread
	ldr	r0,=0x2145C04
	ldr	r0,[r0,0x4]
	// Set as argument
	str	r0,[r2,0x4]

	// Set alarm
	add	r0,=@watchdog_alarm
	mov	r1,0x0
	mov	r2,0x0
	blx	0x208F7E0

	// Restore interrupts
	mov	r0,r4
	blx	0x208FB70	// restore interrupts

@@setupException:
	// Setup exception handler
	ldr	r0,=common_exceptionHandler|1
	ldr	r1,=0x2145E88
	str	r0,[r1]

@@checkSaveCorruption:
	ldr	r0,=common_saveIsLoaded
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end

@@checkAllCardsCorruption:
	// Check safeguard flag
	ldr	r1,=0xF168
	mov	r2,0x8
	bl	0x20240EC	// check flag range
	cmp	r0,0x0
	beq	@@checkFolderCorruption

	.msg	"bad all cards cheat!"
	b	.

@@checkFolderCorruption:
@@checkFolder1:
	mov	r0,0x0
	bl	0x2007358
	cmp	r0,0x0
	bne	@@folderIsCorrupt

@@checkFolder2:
	mov	r0,0x1
	bl	0x2007358
	cmp	r0,0x0
	beq	@@checkFolder3
	cmp	r0,0x11
	beq	@@checkFolder3
	cmp	r0,0x22
	bne	@@folderIsCorrupt

@@checkFolder3:
	mov	r0,0x2
	bl	0x2007358
	cmp	r0,0x0
	beq	@@checkCardBoxCorruption
	cmp	r0,0x22
	beq	@@checkCardBoxCorruption
	cmp	r0,0xFF
	beq	@@checkCardBoxCorruption

@@folderIsCorrupt:
	.msg	"folder corrupted!"
	b	.

@@checkCardBoxCorruption:
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0,0x14]

	mov	r2,0x0
@@checkCardBoxLoop:
	ldr	r1,[r0,r2]
	cmp	r1,0x0
	beq	@@checkCardBoxNext

@@cardBoxIsCorrupt:
	.msg	"card box corrupted!"
	b	.

@@checkCardBoxNext:
	add	r2,0x4
	cmp	r2,0x10
	blt	@@checkCardBoxLoop

@@checkHeapCorruption:
	bl	common_checkHeapCorruption

@@end:
	bl	0x2032DD4
	pop	r4,r15


.align 4
.arm
common_watchdog:
	push	r4,r14

	// Check watchdog fired
	ldr	r0,[@watchdog_fired]
	cmp	r0,0x0
	bne	@@end

	// Check if we're in the thread being watched
	ldr	r0,=0x2145C04	// current thread info
	ldr	r0,[r0,0x4]
	ldr	r1,=0x2145CD4	// launcher thread
	cmp	r0,r1
	bne	@@end

	// Get PC
	ldr	r0,[sp,(0x8+0x40)]

	// Check not in wait for interrupt
	ldr	r1,=0x2090034
	cmp	r0,r1
	beq	@@reset

	// Check same address
	add	r1,=@watchdog_address
	ldr	r2,[r1]
	cmp	r0,r2
	beq	@@counter

@@reset:
	// Store address
	ldr	r0,[sp,(0x8+0x40)]
	add	r1,=@watchdog_address
	str	r0,[r1]

	// Reset watchdog
	mov	r1,0x0
	add	r0,=@watchdog_counter
	str	r1,[r0]

	b	@@end

@@counter:
	// Store address
	ldr	r0,[sp,(0x8+0x40)]
	add	r1,=@watchdog_address
	str	r0,[r1]

	add	r0,=@watchdog_counter
	ldr	r1,[r0]
	add	r1,0x1
	str	r1,[r0]

	// Dump registers after 3 seconds
	cmp	r1,(300)
	blt	@@end

@@dumpRegisters:
	// Disable interrupts
	bl	0x208FB5C	// disable interrupts
	mov	r4,r0

	// Dump context
	mvn	r0,0x0
	add	r1,=@watchdog_context
	mov	r2,0x80
	bl	0x2090834	// mem clear 32-bit

	add	r1,=@watchdog_context

	// Get CPSR
	mov	r0,spsr
	str	r0,[r1]
	// Get r0
	ldr	r0,[sp,(0x8+0x2C)]
	str	r0,[r1,0x4]
	// Get r1
	ldr	r0,[sp,(0x8+0x30)]
	str	r0,[r1,0x8]
	// Get r2
	ldr	r0,[sp,(0x8+0x34)]
	str	r0,[r1,0xC]
	// Get r3
	ldr	r0,[sp,(0x8+0x38)]
	str	r0,[r1,0x10]
	// Get r4
	ldr	r0,[sp,(0x8+0x1C)]
	str	r0,[r1,0x14]
	// Get r5
	ldr	r0,[sp,(0x8+0x20)]
	str	r0,[r1,0x18]
	// Store r6-r11
	str	r6,[r1,0x1C]
	str	r7,[r1,0x20]
	str	r8,[r1,0x24]
	str	r9,[r1,0x28]
	str	r10,[r1,0x2C]
	str	r11,[r1,0x30]
	// Get r12
	ldr	r0,[sp,(0x8+0x3C)]
	str	r0,[r1,0x34]
	// Get pc
	ldr	r0,[sp,(0x8+0x40)]
	str	r0,[r1,0x40]

	// Set version number
	ldr	r0,=VERSION
	str	r0,[r1,0x70]

	// Write to save 0
	ldr	r0,=common_currentSaveFile
	mov	r1,0x0
	str	r1,[r0]

	// Get PC
	ldr	r1,[sp,(0x8+0x40)]
	// NOP around the current opcode
	mov	r0,0x0
	strh	r0,[r1,-0x8]
	strh	r0,[r1,-0x6]
	strh	r0,[r1,-0x4]
	strh	r0,[r1,-0x2]
	strh	r0,[r1]
	strh	r0,[r1,0x2]
	strh	r0,[r1,0x4]	
	str	r0,[r1,0x6]

@@checkArmThumb:
	// Check if in ARM or THUMB mode
	mov	r0,spsr
	tst	r0,0x20
	beq	@@isArm

@@isThumb:
	add	r0,=common_watchdogTriggerExceptionThumb
	mov	r2,(common_watchdogTriggerExceptionThumb_end - common_watchdogTriggerExceptionThumb)
	b	@@triggerException

@@isArm:
	add	r0,=common_watchdogTriggerExceptionArm
	mov	r2,(common_watchdogTriggerExceptionArm_end - common_watchdogTriggerExceptionArm)

@@triggerException:
	// Get PC
	ldr	r1,[sp,(0x8+0x40)]
	bl	0x2090818	// copy 16-bit

	// Set watchdog fired
	add	r0,=@watchdog_fired
	mov	r1,0x1
	str	r1,[r0]

	// Flush data cache
	bl	0x208ECD4
	// Invalidate instruction cache
	bl	0x208ED70

	// Restore interrupts
	mov	r0,r4
	bl	0x208FB70	// restore interrupts

@@end:
	pop	r4,r15
.thumb

	// Need to flush pool here, next functions are copied
	.pool

.align 4
.thumb
common_watchdogTriggerExceptionThumb:
	// Write context
	mov	r1,(0x400 >> 0x8)	// save offset
	lsl	r1,r1,0x8
	ldr	r2,=@watchdog_context	// exception context
	mov	r3,0x74			// size
	ldr	r0,=0x200A621
	blx	r0

@@getPC:
	mov	r1,pc
	sub	r1,(0x4+(@@getPC-common_watchdogTriggerExceptionThumb))

	// Trigger exception
	mov	r0,0x0
	str	r0,[r0]

	// Trigger another exception (invalid opcode)
	.dh	0xEFFF
	b	.

	.pool
.align 2
common_watchdogTriggerExceptionThumb_end:
.thumb

.align 4
.arm
common_watchdogTriggerExceptionArm:
	// Write context
	mov	r1,0x400		// save offset
	ldr	r2,=@watchdog_context	// exception context
	mov	r3,0x74			// size
	ldr	r0,=0x200A621
	blx	r0

@@getPC:
	mov	r1,pc
	sub	r1,(0x8+(@@getPC-common_watchdogTriggerExceptionArm))

	// Trigger exception
	mov	r0,0x0
	str	r0,[r0]

	// Trigger another exception (invalid opcode)
	.dw	0xF7FFFFFF
	b	.

	.pool
.align 4
common_watchdogTriggerExceptionArm_end:
.thumb

.align 4
@watchdog_active:
	.dw	0x0
@watchdog_period:
	// 10 ms
	.dd	(10 * 33514 / 64)
@watchdog_counter:
	.dw	0x0
@watchdog_address:
	.dw	0x0
@watchdog_fired:
	.dw	0x0
@watchdog_alarm:
	.fill	0x2C
@watchdog_context:
	.fill	0x80


.align 2
common_humor:
	push	r4-r5,r14
	mov	r4,r0		// area
	bl	0x2009294	// get normal L Button message
	mov	r5,r0

	// Check not in Deep Space
	cmp	r4,0x96
	beq	@@end

	// Check end of story
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0,0x2]
	cmp	r0,0x64
	blt	@@end

	// Check Game Clear star
	mov	r1,(0x800 >> 0x8)
	lsl	r1,r1,0x8
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Load mess_1271
	ldr	r5,=((29 << 0x10) | (1271))

@@end:
	mov	r0,r5
	pop	r4-r5,r15


.align 2
common_chooseGigaTradeToday:
	push	r4-r7,r14
	sub	sp,0x10		// allocate RTCDate struct and cards buffer (both 16)

	// Get last Giga trade date
	mov	r0,((0xF278 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// day
	lsl	r4,r0,0x10
	mov	r0,((0xF270 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// month
	lsl	r0,r0,0x8
	orr	r4,r0
	mov	r0,((0xF268 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// year
	orr	r4,r0

	// Get today's date
	mov	r5,0x0		// date = null
	mov	r1,sp
	bl	0x2010508	// get date
	cmp	r0,0x0
	beq	@@disableTrade

	// Convert date to u32
	ldr	r5,[sp]		// year
	ldr	r0,[sp,0x4]	// month
	lsl	r0,r0,0x8
	orr	r5,r0
	ldr	r0,[sp,0x8]	// day
	lsl	r0,r0,0x10
	orr	r5,r0

	// Compare date
	cmp	r4,r5
	beq	@@end

	// Set the new date
	mov	r0,((0xF268 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// year
	strb	r5,[r0]
	mov	r0,((0xF270 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// month
	lsr	r1,r5,0x8
	strb	r1,[r0]
	mov	r0,((0xF278 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// day
	lsr	r1,r5,0x10
	strb	r1,[r0]

	// Get player ID
	mov	r1,0x0
	bl	0x200C93C	// player Brother data
	mov	r1,(0x578 >> 0x3)
	lsl	r1,r1,0x3
	add	r1,r0,r1

	// XOR with current date to get seed
	ldr	r0,[r1]
	eor	r5,r0
	ldr	r0,[r1,0x4]
	eor	r5,r0
	ldr	r0,[r1,0x8]
	eor	r5,r0

	// Do simple RNG a few times
	ldr	r0,=(1103515245)
	ldr	r1,=(12345)
	mov	r2,(10-1)
@@rngLoop:
	mul	r5,r0
	add	r5,r5,r1
	sub	r2,0x1
	bpl	@@rngLoop

	// Enumerate possible cards
	mov	r4,sp
	mov	r6,(231)	// first Giga card
	mov	r7,0x0		// number of Giga cards
@@cardLoop:
	// Always allow the GX cards and +50 cards
	cmp	r6,(231)	// PegasuMgcGX
	beq	@@addCard
	cmp	r6,(232)	// Aqua+50
	beq	@@addCard
	cmp	r6,(236)	// LeoKingdmGX
	beq	@@addCard
	cmp	r6,(237)	// Fire+50
	beq	@@addCard
	cmp	r6,(241)	// DragonSkyGX
	beq	@@addCard
	cmp	r6,(242)	// Wood+50
	beq	@@addCard

	// Check if Giga owned
	mov	r1,(0xE00 >> 0x8)
	lsl	r1,r1,0x8
	add	r1,r1,r6
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@nextCard

@@addCard:
	// Add to list
	strb	r6,[r4,r7]
	add	r7,0x1

@@nextCard:
	// Adjust for Andromeda
	add	r6,0x1
	cmp	r6,(246)
	blt	@@cardLoop
	add	r6,0x1
	cmp	r6,(248)
	blt	@@cardLoop

	cmp	r7,0x0
	beq	@@disableTrade

	// Choose random index
	lsr	r0,r5,0x10
	mov	r1,r7
	blx	0x208985C	// mod s32

	// Choose Giga card
	ldrb	r4,[r4,r0]

	// Set the Giga card
	mov	r0,((0xF260 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer
	strb	r4,[r0]

@@enableTrade:
	ldr	r1,=0xF160
	bl	0x2024018	// set flag
	b	@@end

@@disableTrade:
	ldr	r1,=0xF160
	bl	0x202405C	// clear flag
	b	@@end

@@end:
	add	sp,0x10
	pop	r4-r7,r15


.align 2
common_disablePowerUpForTimeTrial:
	push	r4,r14
	bl	0x20228D4	// is enabled
	cmp	r0,0x0
	beq	@@end

	// Check disable for next fight flag
	ldr	r1,=0xF14D
	bl	0x202409C	// check flag
	mov	r1,0x1
	eor	r0,r1

@@end:
	pop	r4,r15


.align 2
common_onAreaChange:
	push	r14

	// Reset encounter rate
	bl	0x2007850

	// DX bosses update
	bl	common_getNumberOfDXBossesDefeated

@@checkGBASlotIn:
	// Check GBA slot in
	ldr	r0,=0x2103510
	ldr	r0,[r0]
	bl	0x20066E0	// check GBA slot in
	cmp	r0,0x0
	beq	@@noSlotIn
@@slotIn:
	ldr	r1,=0x900
	bl	0x2024018	// set flag
	b	@@checkBossRushActive
@@noSlotIn:
	ldr	r1,=0x901
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkBossRushActive

	ldr	r1,=0x900
	bl	0x202405C	// clear flag

@@checkBossRushActive:
	// Check beat Pegasus Magic
	ldr	r1,=0xF108
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHollowActive

	// Check beat Leo Kingdom
	ldr	r1,=0xF10A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHollowActive

	// Check beat Dragon Sky
	ldr	r1,=0xF10C
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHollowActive

	// Check beat Andromeda Infinity
	ldr	r1,=0xF10F
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkHollowActive

	// Set Final Boss Rush active
	ldr	r1,=0xF150
	bl	0x2024018	// set flag

@@checkHollowActive:
	// Check chapter
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0,0x2]	// chapter
	cmp	r0,0x64
	blt	@@checkTimeTrialsActive

	// Check game cleared
	mov	r1,(0x800 >> 0x8)
	lsl	r1,r1,0x8
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkTimeTrialsActive

	// Set Hollow event active
	ldr	r1,=0xF139
	bl	0x2024018	// set flag

@@checkHollowRefight:
	ldr	r1,=0xF135
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkTimeTrialsActive

	// Set Hollow refight active
	ldr	r1,=0xF13B
	bl	0x2024018	// set flag

@@checkTimeTrialsActive:
	// Check have Pegasus, Leo or Dragon Folder
	ldr	r1,=0xF110
	mov	r2,0x3
	bl	0x20240EC	// check one of multiple flags
	cmp	r0,0x0
	beq	@@checkDragonSkyEXActive

	// Set Time Trials active
	ldr	r1,=0xF13D
	bl	0x2024018	// set flag

@@checkDragonSkyEXActive:
	// Check have Dragon Folder
	ldr	r1,=0xF112
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkShinMail

	// Set Dragon Sky EX active
	ldr	r1,=0xF13E
	bl	0x2024018	// set flag

@@checkShinMail:
	// Check got Shin mail
	ldr	r1,=0x18B9
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@checkFinalWaveholeSave

	// Check all Transer quests finished
	ldr	r1,=0x183E
	mov	r2,0x3E
	bl	0x20240C0	// check flag all
	cmp	r0,0x0
	beq	@@checkFinalWaveholeSave

	// Receive mail 119
	ldr	r0,=0x211CD4C
	ldr	r0,[r0]
	ldr	r1,=0x1677
	bl	0x2015A08	// receive mail

	// Set mail received flag
	ldr	r1,=0xD27
	bl	0x2024018	// set flag

	// Set received Shin mail flag
	ldr	r1,=0x18B9
	bl	0x2024018	// set flag

@@checkFinalWaveholeSave:
	// Check area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r1,[r0,0x1]	// subarea
	ldrb	r0,[r0]		// area

	// Check Living Module (Real World)
	cmp	r0,0x5		// Peace
	bne	@@clearFinalWaveholeSave
	cmp	r1,0x4		// Living Module
	beq	@@end

@@clearFinalWaveholeSave:
	// Clear saved on final wavehole flag
	ldr	r1,=0xF13A
	bl	0x202405C	// clear flag

@@end:
	pop	r15

	.pool


.align 2
common_exFadeTypes1:
	cmp	r4,0x29
	blt	@@end
	add	r3,=@extraFadeTypes
	sub	r4,0x29
	mov	r2,0xC
	mul	r2,r4
@@end:
	ldrb	r1,[r3,r2]
	strb	r1,[r0,0x8]
	bx	r14

.align 2
common_exFadeTypes2:
	cmp	r6,0x29
	blt	@@end
	add	r5,=@extraFadeTypes+4
	sub	r6,0x29
@@end:
	mul	r0,r6
	bx	r14


.align 2
common_skipFadeReset:
	push	r4,r14

	add	r4,=common_fadeReset
	ldr	r3,[r4]
	cmp	r3,0x0
	bne	@@end

	// Do fade reset
	bl	0x2011CBC

@@end:
	mov	r3,0x0
	str	r3,[r4]

	pop	r4,r15


.align 4
common_fadeReset:
	.dw	0x0


.align 4
@extraFadeTypes:
	//	0x00	u8	type (0 = custom fade in, 1 = custom fade out, 2 = standard fade in, 3 = standard fade out)
	//	0x01	u8	color (for custom: 2 = white, 3 = black) (for standard: 2 = black, 1 = white)
	//	0x02	u16	target (0x100 = complete fade out, 0x0 = complete fade in, 0x80 = fade halfway)
	//	0x04	u8	background palette start
	//	0x05	u8	background palette count
	//	0x06	u8	palettes block? (0, 1 or 2)
	//	0x07	u8	layers? (10 = Real World?, 20 = Wave World?)
	//	0x08	u8	foreground palette start
	//	0x09	u8	foreground palette count
	//	0x0A	u8	palettes block? (0 or 1)
	//	0x0B	u8	layers? (20 = ???)
	// 0x29 - partial fade in from black except HUD and OAM
	.db	0x00, 0x03	:: .dh	0x80
	.db	0x0, 0xC, 0x0, 0x30
	.db	0x0, 0x1, 0x0, 0x20
	// 0x2A - partial fade out to black except HUD and OAM
	.db	0x01, 0x03	:: .dh	0x80
	.db	0x0, 0xC, 0x0, 0x30
	.db	0x0, 0x1, 0x0, 0x20
	// 0x2B - full fade out to black except HUD and OAM
	.db	0x01, 0x03	:: .dh	0x100
	.db	0x0, 0xC, 0x0, 0x30
	.db	0x0, 0x1, 0x0, 0x20
	// 0x2C - full fade in from black except HUD and OAM
	.db	0x00, 0x03	:: .dh	0x0
	.db	0x0, 0xC, 0x0, 0x30
	.db	0x0, 0x1, 0x0, 0x20


.align 2
common_getExtraShopCount1:
	push	r14

	// Check Star Frag shop
	ldr	r3,[sp,(0x8 + 1*0x4)]	// pushed r0 in called
	cmp	r3,0x9
	bne	@@normal

	// Check limited quantity
	ldrb	r3,[r4,0x1]
	cmp	r3,0xFF
	beq	@@end

	// Check if already bought
	push	r0-r3
	ldr	r1,=0xF14B
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	beq	@@end

	// Already bought
	mov	r3,0x0
	b	@@end

@@normal:
	ldr	r3,[sp,(0x4 + 1*0x4)]	// sp+0x4 in caller
	ldrb	r3,[r3,r0]
@@end:
	pop	r15

.align 2
common_getExtraShopCount2:
	push	r14

	// Check Star Frag shop
	ldr	r6,[sp,(0x0 + 1*0x4)]	// pushed r0 in caller
	cmp	r6,0x9
	bne	@@normal

	// Check limited quantity
	ldrb	r6,[r0,0x1]
	cmp	r6,0xFF
	beq	@@end

	// Check if already bought
	push	r0-r3
	ldr	r1,=0xF14B
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	beq	@@end

	// Already bought
	mov	r6,0x0
	b	@@end

@@normal:
	mov	r6,r12
	ldrb	r6,[r6,r1]
@@end:
	pop	r15

.align 2
common_reduceShopCount:
	// Check Star Frag shop
	cmp	r0,0x9
	bne	@@normal

	// Get item info
	ldrh	r0,[r4,0x10]
	ldrh	r1,[r4,0x12]
	add	r0,r0,r1
	mov	r1,0xC
	mul	r0,r1
	ldr	r1,=common_starFragShop
	add	r0,r1,r0

	// Check limited quantity
	ldrb	r0,[r0,0x1]
	cmp	r0,0xFF
	beq	@@end

	// Set bought
	ldr	r1,=0xF14B
	bl	0x2024018	// set flag

@@end:
	pop	r3-r5,r15

@@normal:
	ldr	r2,[r2]
	ldr	r3,[r2,0x20]
	bx	r14


.align 2
common_noteGameNpcPalettes:
	mov	r2,0x9		// maximum palette for NPCs
	mov	r3,0x1
	push	r0-r3,r14

	// If this is 1000 Note Challenge
	ldr	r1,=0xF12C
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	beq	@@end

	mov	r2,0xB		// use 2 more NPC palettes
@@end:
	pop	r15


.align 2
common_softResetClear:
	// r0 = 0
	str	r0,[r4,0xC]
	// Clear soft reset started param
	add	r1,=@isSoftResetStarted
	str	r0,[r1]
	mov	r0,r4
	bx	r14

common_softResetToTitleScreen:
	ldr	r1,=0x27FFC20
	ldr	r1,[r1]		// reset parameter
	ldr	r2,=0x54464F53	// "SOFT"
	cmp	r1,r2
	bne	@@end

	// Check soft reset already started
	ldr	r1,[@isSoftResetStarted]
	cmp	r1,0x0
	bne	@@end

	// Initialize audio
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	bl	0x20259DC

	// Start title screen music
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x0
	bl	0x20255F4	// play STRM

	// Skip to title screen
	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	mov	r1,0x3
	mov	r2,0x3
	bl	0x20145CC

	pop	r4,r15

@@end:
	bx	r14

.align 4
@isSoftResetStarted:
	.dw	0x0


.align 2
common_recordBestComboPanel:
	ldr	r3,[sp]		// get panel
	cmp	r3,0xB
	blt	@@end
	mov	r3,0x1		// normal panel
@@end:
	strb	r3,[r6,r0]
	bx	r14


.align 2
common_respawnMysteryWavesOnPulseOut:
	push	r14

	ldr	r0,=0x21A7D6C
	ldr	r0,[r0]		// not actually used...
	bl	0x215A7C4	// respawn Mystery Waves

	bl	0x2007D04
	pop	r15

	.pool


.align 2
common_savePreStart:
	push	r4,r14
	ldr	r4,[sp,0x8]
	push	r4
	bl	0x2011BA4	// start screen fade in

	// Allocate buffers and start compress
	bl	common_textCallAllocSaveBufferMenu
	mov	r0,0x1
	mov	r4,0x0
	bl	common_textCallSaveCompress

	pop	r0,r4,r15	// pop extra for deallocation


.align 2
common_savePreAbort:
	push	r14
	bl	0x2025574	// play SFX

	// Abort compress and free buffers
	bl	common_textCallAbortSaveCompress
	bl	common_textCallFreeSaveBufferMenu

	pop	r15


.align 2
common_saveStartFast:
	push	r4-r7,r14
	sub	sp,0xC
	mov	r5,r0

	mov	r0,0x1
	strb	r0,[r5,0x1]
	lsl	r0,r0,0xC
	str	r0,[sp]
	bl	0x200A87C	// Go to second half of Save_SaveAsync


.align 2
common_saveEnterMenu:
	push	r14	// uses r4

	// Make sure this doesn't use r4
	bl	common_textCallAllocSaveBufferMenu

	mov	r0,0x1
	bl	common_textCallSaveCompress

	mov	r0,r4
	mov	r1,0x5
	pop	r15


.align 2
common_saveLoadDisablePlayTimer:
	ldr	r0,[@isSaveLoadingAsync]
	cmp	r0,0x0
	bne	@@end

	// Increment Play Time
	add	r0,r1,0x1
	str	r0,[r2,0x14]

@@end:
	bx	r14


.align 2
common_saveLoadAsync:
	push	r4-r5,r14
	mov	r4,r0

	ldr	r5,=0x210CCF0
	ldr	r5,[r5]

	// Just skip all the checks

	// Create thread
	mov	r0,0x1
	lsl	r0,r0,0xC	// stack size
//	mov	r1,0x5		// priority (causes audio stutter?)
	mov	r1,0x11		// priority
	add	r3,r5,r0	// this+0x1000
	push	r0-r1
	mov	r0,r5
	add	r0,0x1C		// thread struct
	ldr	r1,=common_saveLoadWorker|1
	mov	r2,r4		// callback arg
	add	r3,0xDC		// stack location
	blx	0x208E038	// create thread

	// Wakeup thread
	mov	r0,r5
	add	r0,0x1C
	blx	0x208E3D4

	pop	r0-r1,r4-r5,r15	// pop extra for deallocation


.align 2
common_saveLoadWorker:
	push	r4,r14
	mov	r4,r0

	add	r0,=@isSaveLoadingAsync
	mov	r1,0x1
	str	r1,[r0]

	// Check if there is a save file
	ldr	r0,=0x210CCF0
	ldr	r0,[r0]
	bl	0x200ACEC	// save exists
	cmp	r0,0x0
	beq	@@unloadSave

@@loadSave:
	// Load small block
	ldr	r0,=0x2127390
	ldr	r0,[r0]
	ldr	r1,=0x212E31C
	bl	0x202FAFC
	cmp	r0,0x0
	beq	@@unloadSave

	// Load big block
	// Make sure nothing is writing while we're decompressing!!!
	ldr	r0,=0x210CCF0
	ldr	r0,[r0]
	ldr	r1,=0x2130BCC
	ldr	r2,=0xAF8C
	bl	0x200AB9C	// load save
	cmp	r0,0x0
	beq	@@unloadSave

	mov	r0,0x1
	str	r0,[r4,0x20]	// has save

	// Anticheat check
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	bl	0x2024724
	cmp	r0,0x0
	bne	@@exit

	ldr	r1,=0x210CCF0
	ldr	r1,[r1]
	ldr	r2,=0x25CC
	mov	r0,0x1
	str	r0,[r1,r2]

	b	@@exit

@@unloadSave:
	mov	r0,0x0
	str	r0,[r4,0x20]	// has save

	// Clear small block
	ldr	r1,=0x212E31C
	mov	r2,0xFF
	add	r2,(0x104-0xFF)
	bl	0x202DEE8	// Mem_Clear32

	// Clear big block
	ldr	r1,=0x2130BCC
	ldr	r2,=0xAF8C
	bl	0x202DEE8	// Mem_Clear32

@@exit:
	add	r0,=@isSaveLoadingAsync
	mov	r1,0x0
	str	r1,[r0]

	// Exit thread
	blx	0x208E134

	pop	r4,r15


.align 2
common_saveRead:
	push	r4,r14

	// Adjust r0 for save slot
	ldr	r4,[common_currentSaveFile]
	lsl	r4,r4,0x11
	add	r0,r0,r4

	b	common_saveCommand

.align 2
common_saveWrite:
	push	r4,r14

	// Adjust r1 for save slot
	ldr	r4,[common_currentSaveFile]
	lsl	r4,r4,0x11
	add	r1,r1,r4

common_saveCommand:
	ldr	r4,=0x2098B44	// request stream command
	str	r4,[sp,0x4]	// override return address

	pop	r4,r15


.align 2
common_saveLoadExtended:
	ldr	r2,=EXSAVE_TOTALSIZE
	str	r1,[r5,0x8]
	str	r2,[r5,0xC]
	bx	r14


.align 2
common_saveLoadAllocExtended:
	push	r1,r14
	mov	r6,r0

	// Clear save load buffer
	mov	r1,r6		// buffer
	ldr	r2,=EXSAVE_TOTALSIZE
	bl	0x202DEE8	// Mem_Clear32

	mov	r0,r5
	pop	r1,r15


.align 2
common_saveAppendExData:
	push	r14
	// r0 = unused
	// r1 = source
	// r2 = destination
	// r3 = size
	ldr	r0,=0x2130BCC
	cmp	r0,r1
	beq	@@loadMain

	// Copy the whole thing
	ldr	r3,=EXSAVE_TOTALSIZE
	bl	0x202DFD8	// Mem_Copy32
	b	@@end

@@loadMain:
	// Copy main part
	ldr	r3,=0xAF8C
	bl	0x202DFD8	// Mem_Copy32

	// Copy ex data
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r2,[r5,0x18]
	ldr	r0,=0xAF8C
	add	r2,r2,r0
	ldr	r3,=EXSAVE_SIZE
	bl	0x202DFD8	// Mem_Copy32

@@end:
	// Override save size
	ldr	r3,=EXSAVE_TOTALSIZE
	str	r3,[r5,0xC]
	pop	r15
	


.align 2
common_saveLoadPlayTimeCopy:
	push	r7,r14
	// r0 = unused
	// r1 = source (allocated) (also in r6)
	// r2 = destination
	// r3 = size
	mov	r7,r2

	// Clear temp buffer
	ldr	r1,=common_savePersistBufferCompress	// Use as temp buffer (ignore the name)
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_TOTALSIZE
	bl	0x202DEE8	// Mem_Clear32

	// Copy into temp buffer
	mov	r1,r6
	ldr	r2,=common_savePersistBufferCompress	// Use as temp buffer (ignore the name)
	ldr	r2,[r2]
	ldr	r3,=EXSAVE_TOTALSIZE
	bl	0x202DFD8	// Mem_Copy32
	b	common_saveLoadExData

common_saveLoadPlayTimeUncompress:
	push	r7,r14
	// r0 = source (allocated) (also in r6)
	// r1 = destination
	mov	r7,r1

	// Clear temp buffer
	ldr	r1,=common_savePersistBufferCompress	// Use as temp buffer (ignore the name)
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_TOTALSIZE
	bl	0x202DEE8	// Mem_Clear32

	// Decompress into temp buffer
	mov	r0,r6
	ldr	r1,=common_savePersistBufferCompress	// Use as temp buffer (ignore the name)
	ldr	r1,[r1]
	blx	0x2090B60	// 8-bit LZ uncompress

common_saveLoadExData:
	ldr	r0,=0x2130BCC
	cmp	r0,r7
	bne	@@copyFromTemp

	// Copy main part
	ldr	r1,=common_savePersistBufferCompress
	ldr	r1,[r1]
	ldr	r2,=0x2130BCC
	ldr	r3,=0xAF8C
	bl	0x202DFD8	// Mem_Copy32

	// Copy extra part
	ldr	r1,=common_savePersistBufferCompress
	ldr	r1,[r1]
	ldr	r0,=0xAF8C
	add	r1,r1,r0
	ldr	r2,=common_saveExData
	ldr	r2,[r2]
	ldr	r3,=EXSAVE_SIZE
	bl	0x202DFD8

@@loadPlayTime:
	// Get play time and top screen from header
	ldr	r0,[r4,0x10]
	lsr	r2,r0,0x1F	// saved before last boss
	lsl	r1,r0,0x1
	lsr	r1,r1,0x1D	// top screen
	lsl	r0,r0,0x4
	lsr	r0,r0,0x4	// play time

	// Store play time and top screen in save file
	ldr	r3,=0x2120588
	ldr	r3,[r3]
	ldr	r3,[r3]
	str	r0,[r3,0x14]	// play time
	add	r3,0xFB
	strb	r1,[r3]		// top screen

	// Set save loaded
	add	r0,=common_saveIsLoaded
	mov	r1,0x1
	str	r1,[r0]

	// Set flag saved before last boss
	cmp	r2,0x0
	beq	@@chooseDailyGiga
	ldr	r1,=0xF13A
	bl	0x2024018	// set flag

@@chooseDailyGiga:
	// Choose a Giga card for the daily trade
	bl	common_chooseGigaTradeToday

	// Update Navi screen flags
	mov	r1,0x40
	mov	r2,0x5
	bl	0x202407C

	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFB
	ldrb	r0,[r0]		// top screen
	sub	r0,0x3
	bmi	@@checkDX
	cmp	r0,0x5
	bhi	@@checkDX
	lsl	r0,r0,0x1
	add	r1,=@naviScreenFlags
	ldrh	r1,[r1,r0]
	bl	0x2024018	// set flag

//	// Clear DX bosses active flag
//	ldr	r1,=0xF17D
//	bl	0x202405C	// clear flag

@@checkDX:
	// Update DX bosses
	bl	common_getNumberOfDXBossesDefeated

	// Upgrade from previous version: set Star Card flags
	bl	common_upgradeSetStarCardFlags

	// Upgrade from previous version: remove Copy Brother SP records
	bl	common_upgradeRemoveCopyBrotherSPRecords

	// Upgrade from previous version: version check
	bl	common_upgradeVersionCheck

	b	@@end

@@copyFromTemp:
	// Copy from temp buffer
	ldr	r1,=common_savePersistBufferCompress	// Use as temp buffer (ignore the name)
	ldr	r1,[r1]
	mov	r2,r7
	ldr	r3,=EXSAVE_TOTALSIZE
	bl	0x202DFD8	// Mem_Copy32

@@end:
	pop	r7,r15

.align 4
common_saveIsLoaded:
	.dw	0x0
@isSaveLoadingAsync:
	.dw	0x0
@naviScreenFlags:
	.dh	0x40, 0x42, 0x41, 0x43, 0x44


.align 2
common_upgradeRemoveCopyBrotherSPRecords:
	push	r4-r7,r14

	// Get own Brother data
	mov	r1,0x0
	bl	0x200C93C
	mov	r4,r0

	mov	r5,0x1
@@brotherLoop:
	// Get Brother data
	mov	r1,r5
	bl	0x200C93C

	// Compare Brother IDs
	mov	r2,(0x578 >> 0x3)
	lsl	r2,r2,0x3
	add	r1,r4,r2	// own Brother ID
	add	r2,r0,r2	// other Brother ID
	mov	r3,0x0
@@compareLoop:
	ldrb	r6,[r1,r3]
	ldrb	r7,[r2,r3]
	cmp	r6,r7
	bne	@@nextBrother
	add	r3,0x1
	cmp	r3,0xC
	blt	@@compareLoop

	// Same Brother ID, remove records
	mov	r1,(0x6A8 >> 0x3)
	lsl	r1,r1,0x3
	add	r1,r0,r1
	mov	r2,0x0
	mvn	r2,r2
	mov	r3,(14)
@@deleteRecordsLoop:
	stmia	[r1]!,r2
	sub	r3,0x1
	bne	@@deleteRecordsLoop

@@nextBrother:
	add	r5,0x1
	cmp	r5,0x7
	blt	@@brotherLoop

	pop	r4-r7,r15


.align 2
common_upgradeVersionCheck:
	push	r7,r14

	// Get save version
	ldr	r0,=common_saveExData
	ldr	r0,[r0]
	ldr	r1,=EXSAVE_VERSION
	ldr	r2,[r0,r1]

	// Check if this is a different version
	ldr	r3,=VERSION
	cmp	r2,r3
	beq	@@end

	// Set version
	str	r3,[r0,r1]

	// Remove SearchEye
	bl	0x2007EC8

	// Check if finished Famous quest
	ldr	r1,=0xF128
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkKelvinTranserCount

	// Remove Old Data item
	mov	r0,(85)
	mov	r1,0x1
	bl	0x2007B84	// take item

@@checkKelvinTranserCount:
	// Get number of Kelvin Transer
	mov	r0,(80)
	bl	0x2007BB8	// get item count
	cmp	r0,0x1
	ble	@@checkKaiserKnuckleCount

	// Have 2 or more; set to 1
	mov	r0,(80)
	bl	0x2007AC8	// set count to 1

@@checkKaiserKnuckleCount:
	// Get number of Kaiser Knuckle
	mov	r0,(31)
	bl	0x2007BB8	// get item count
	cmp	r0,0x1
	ble	@@checkPythonCount

	// Have 2 or more; set to 1
	mov	r0,(31)
	bl	0x2007AC8	// set count to 1

@@checkPythonCount:
	// Get number of Python
	mov	r0,(53)
	bl	0x2007BB8	// get item count
	cmp	r0,0x1
	ble	@@checkKingSnakeCount

	// Have 2 or more; set to 1
	mov	r0,(53)
	bl	0x2007AC8	// set count to 1

@@checkKingSnakeCount:
	// Get number of King Snake
	mov	r0,(54)
	bl	0x2007BB8	// get item count
	cmp	r0,0x1
	ble	@@checkCornSnakeCount

	// Have 2 or more; set to 1
	mov	r0,(54)
	bl	0x2007AC8	// set count to 1

@@checkCornSnakeCount:
	// Get number of Corn Snake
	mov	r0,(55)
	bl	0x2007BB8	// get item count
	cmp	r0,0x1
	ble	@@checkProfSnakeQuest

	// Have 2 or more; set to 1
	mov	r0,(55)
	bl	0x2007AC8	// set count to 1

@@checkProfSnakeQuest:
	// Check if finished Prof. Snake quest
	ldr	r1,=0x1877
	bl	0x202409C
	cmp	r0,0x0
	beq	@@end

	// Remove Python, King Snake and Corn Snake items
	mov	r0,(53)
	mov	r1,0x1
	bl	0x2007B84	// take item
	mov	r0,(54)
	mov	r1,0x1
	bl	0x2007B84	// take item
	mov	r0,(55)
	mov	r1,0x1
	bl	0x2007B84	// take item

@@end:
	pop	r7,r15


.align 2
common_upgradeSetStarCardFlags:
	push	r4,r14
	mov	r4,0x0

@@loop:
	// Check if this card can be a Star Card
	ldr	r1,=data_extraCardInfo
	lsl	r0,r4,0x1
	ldrb	r0,[r1,r0]	// power up description
	cmp	r0,0x0
	beq	@@next

	// Check if Star Card owned
	mov	r0,r4
	mov	r1,0x2
	bl	0x20070F0
	cmp	r0,0x0
	beq	@@next

	// Set Star Card flag
	mov	r1,(0xE000 >> 0xC)
	lsl	r1,r1,0xC
	add	r1,r1,r4
	bl	0x2024018	// set flag

@@next:
	add	r4,0x1
	cmp	r4,(170)
	ble	@@loop

@@end:
	pop	r4,r15


.align 2
common_saveCountAndStorePlayTime:
	push	r0,r6-r7,r14	// uses r4,r5
	ldr	r6,[r5,r0]	// save count of current slot

	// Store play time, top screen and saved before last boss
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrb	r2,[r1,0x2]	// chapter
	ldr	r0,[r1,0x14]	// play time  (&0FFFFFFF)
	add	r1,0xFB
	ldrb	r1,[r1]		// top screen (&70000000)
	lsl	r0,r0,0x4
	lsr	r0,r0,0x4
	lsl	r1,r1,0x1C
	orr	r0,r1

	// Check at final boss
	cmp	r2,0x64
	blt	@@setHeaderVars
	mov	r2,0x1
	lsl	r2,r2,0x1F
	orr	r0,r2

	// Set flag saved before last boss
	push	r0-r3
	ldr	r1,=0xF13A
	bl	0x2024018	// set flag
	pop	r0-r3

@@setHeaderVars:
	str	r0,[r4,0x10]	// store in header

	// Allocate heap for other slot header
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x3C		// header size
	bl	0x20155DC	// alloc on heap
	mov	r7,r0
	beq	@@end

	// Switch save slot
	add	r2,=common_currentSaveFile
	ldr	r0,[r2]
	mov	r1,0x1
	eor	r0,r1
	str	r0,[r2]

	// Read header of other file
	mov	r0,r4
	mov	r1,r7
	bl	0x200AB14	// read and verify header
	cmp	r0,0x0
	bne	@@free

	// Compare save count of other slot
	ldr	r0,[r7,0x10]	// save count of other slot
	cmp	r0,r6
	ble	@@free

	// Set save count
	mov	r6,r0

@@free:
	// Switch save slot
	add	r2,=common_currentSaveFile
	ldr	r0,[r2]
	mov	r1,0x1
	eor	r0,r1
	str	r0,[r2]

	// Free from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,r7
	bl	0x2015620

@@end:
	add	r1,r6,0x1	// increment save count
	pop	r0,r6-r7,r15

.align 4
common_currentSaveFile:
	.dw	0x0

	.pool


common_clearFlagsOnNewGame:
	push	r14

	bl	0x2007140

	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0,0x14]
	add	r0,(0x8+0x3)

	mov	r1,0x0
	mov	r2,0x16
	lsl	r2,r2,0x4
@@loop:
	strb	r1,[r0]
	add	r0,0x10
	sub	r2,0x1
	bne	@@loop

	// Clear extended save data
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_SIZE
	bl	0x202DEE8	// Mem_Clear32

	// Set save version
	ldr	r0,=common_saveExData
	ldr	r0,[r0]
	ldr	r1,=EXSAVE_VERSION
	ldr	r2,=VERSION
	str	r2,[r0,r1]

	// Set save loaded
	ldr	r0,=common_saveIsLoaded
	mov	r1,0x1
	str	r1,[r0]

	// Set starting difficulty flag
	ldr	r0,=title_startingDifficulty
	ldr	r0,[r0]
	cmp	r0,0x1
	bne	@@normalMode

@@legendMode:
	// Set Legend Mode flag
	ldr	r1,=0xF03D
	bl	0x2024018	// set flag
	b	@@chooseDailyGiga

@@normalMode:
	// Set Legend Mode turned off flag
	ldr	r1,=0xF03E
	bl	0x2024018	// set flag
//	b	@@chooseDailyGiga

@@chooseDailyGiga:
	bl	common_chooseGigaTradeToday

@@end:
	pop	r15

.align 2
common_flagSetHook:
	push	r14

	// Don't set quest active flag
	ldr	r2,=0x1AFF
	cmp	r1,r2
	beq	@@end

	ldr	r2,=0xEF7
	cmp	r1,r2
	bne	@@setCardFlag

	// Set Andromeda flag
	push	r0-r1
	bl	0x2010404
	pop	r0-r1

@@setCardFlag:
	lsr	r2,r1,0xC
	cmp	r2,0xF
	bne	@@setExFlag
	bne	@@normal

	// Fxxx = card xxx red count
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070FC	// r0 = card count ptr
	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r1,[r0]
	orr	r1,r3
	strb	r1,[r0]
	b	@@end

@@setExFlag:
//	lsr	r2,r1,0xC
	cmp	r2,0xE
	bne	@@normal

	// Exxx = extra flags region
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_FLAG
	add	r1,r1,r2
	add	r0,r1,r0

	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r1,[r0]
	orr	r1,r3
	strb	r1,[r0]
//	b	@@end

@@end:
	add	sp,0x4
	pop	r3-r5,r15

@@normal:
	mov	r4,0x80
	ldr	r0,[r0]
	pop	r15

.align 2
common_flagClearHook:
	lsr	r2,r1,0xC
	cmp	r2,0xF
	bne	@@clearExFlag

	// Fxxx = card xxx red count
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070FC	// r0 = card count ptr
	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r1,[r0]
	bic	r1,r3
	strb	r1,[r0]
	b	@@end

@@clearExFlag:
//	lsr	r2,r1,0xC
	cmp	r2,0xE
	bne	@@normal

	// Exxx = extra flags region
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_FLAG
	add	r1,r1,r2
	add	r0,r1,r0

	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r1,[r0]
	bic	r1,r3
	strb	r1,[r0]
//	b	@@end

@@end:
	pop	r3-r5,r15

@@normal:
	asr	r2,r1,0x3
	ldr	r0,[r0]
	bx	r14

.align 2
common_flagCheckHook:
	push	r14

	// Don't set quest active flag
	ldr	r2,=0x1AFF
	cmp	r1,r2
	beq	@@false

	// Disable game clear flag during 1000 Note Challenge
	mov	r2,(0x800 >> 0x8)
	lsl	r2,r2,0x8
	cmp	r1,r2
	bne	@@checkCardFlag

	push	r1
	ldr	r1,=0xF12C
	bl	0x202409C
	pop	r1
	cmp	r0,0x0
	bne	@@false

@@checkCardFlag:
	lsr	r2,r1,0xC
	cmp	r2,0xF
	bne	@@checkExFlag

	// Fxxx = card xxx red count
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070FC	// r0 = card count ptr
	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r0,[r0]
	tst	r0,r3
	beq	@@false

	b	@@true

@@checkExFlag:
//	lsr	r2,r1,0xC
	cmp	r2,0xE
	bne	@@normal

	// Exxx = extra flags region
	lsl	r3,r1,0x14
	lsr	r0,r3,0x17	// r0 = xxx / 8
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r2,=EXSAVE_FLAG
	add	r1,r1,r2
	add	r0,r1,r0

	lsl	r1,r3,0x9
	lsr	r1,r1,0x1D	// r1 = xxx % 8
	mov	r3,0x80
	asr	r3,r1
	ldrb	r0,[r0]
	tst	r0,r3
	beq	@@false

//	b	@@true

@@true:
	mov	r0,0x1
	b	@@exit
@@false:
	mov	r0,0x0
@@exit:
	add	sp,0x4
	pop	r15

@@normal:
	mov	r2,0x80
	mov	r0,0x7
	and	r0,r1
	pop	r15

.align 2
common_giveCardHook:
	// Don't do extra stuff for flag cards
	cmp	r4,0x3
	bne	@@normal
	cmp	r5,0xE7
	bge	@@normal

	// Get data address for card
	mov	r0,r5
	mov	r1,r4
	bl	0x20070FC
	// Store value as-is
	strb	r6,[r0]

	// Exit
	bl	0x2006EE4

@@normal:
	// Do normal stuff
	bl	0x2024768	// mark card unlocked

	// Check if this is a Star Card
	cmp	r5,(170)
	bgt	@@end
	cmp	r4,0x2
	bne	@@end

	// Set got Star Card flag
	mov	r1,(0xE000 >> 0xC)
	lsl	r1,r1,0xC
	add	r1,r1,r5	// Star Card flag
	bl	0x2024018	// set flag

@@end:
	bl	0x2006EAE


common_textItemGiveCardSFX:
	push	r14

	// Don't play SFX for flag cards
	cmp	r6,0x3
	bne	@@sfx
	cmp	r4,0xE7
	blt	@@end

@@sfx:
	bl	0x2025574

@@end:
	pop	r15


common_handleExpandedSpritesList:
	ldrh	r2,[r5]
	ldrh	r1,[r5,0x2]
	cmp	r2,0x1		// jump to extended sprites list
	bne	@@end

@@gotoExtended:
	ldr	r5,=field_exSpritesBase
	add	r5,r5,r1
	b	common_handleExpandedSpritesList

@@end:
	bx	r14

	.pool


.align 2
common_textBufferGetExtra:
	cmp	r0,0x4
	bcc	@@normal

@@extra:
	sub	r0,0x4
	add	r1,=common_extraTextBuffers

@@normal:
	lsl	r0,r0,0x2
	ldr	r0,[r1,r0]
	pop	r15

.align 2
common_textBufferSetExtra:
	cmp	r0,0xC
	bcc	@@extra
	mov	r0,0x0
	pop	r15

@@extra:
	sub	r0,0x4
	lsl	r2,r0,0x2
	add	r0,=common_extraTextBuffers
	str	r1,[r0,r2]
	mov	r0,0x1
	pop	r15

.align 2
common_textBufferGetString:
	push	r14
	// & 0x3
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1E
	bl	0x200917C
	pop	r15

.align 4
common_extraTextBuffers:
	.dw	0x0	// buffer 4
	.dw	0x0	// buffer 5
	.dw	0x0	// buffer 6
	.dw	0x0	// buffer 7
	.dw	0x0	// buffer 8
	.dw	0x0	// buffer 9
	.dw	0x0	// buffer 10
	.dw	0x0	// buffer 11


.align 2
common_drawBattleCard:
	push	r14
	sub	sp,0x8

	// Show Battle Card sprite
	ldr	r0,=(0x21AC1D8 + 0x80 + 0x2*0xC0)
//	ldr	r0,=0x21AC1D8
//	mov	r1,0x2
//	bl	0x21649B0

	ldr	r1,=common_showBattleCardID
	ldr	r1,[r1]
	cmp	r1,0x0
	beq	@@end
	mov	r2,0x5C		// x
	mov	r3,0x34		// y
	bl	0x2009D30

	ldr	r0,=common_showBattleCardStar
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end

	// Draw star
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	ldr	r3,=0xB336
	ldr	r2,=0x4095005B
	ldr	r0,=0x211CDC0
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r15


.align 2
common_drawStarFragCounter:
	push	r4-r6,r14
	sub	sp,0x8
	bl	0x2158B84

	bl	common_drawBattleCard

@@checkStarFragCounter:
	mov	r2,(72)		// max scroll
	mov	r3,(16)		// scroll delta

	ldr	r1,=@starFragCounterScroll
	ldr	r0,=@starFragCounterShow
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@hide

@@show:
	ldr	r0,[r1]
	cmp	r0,r2
	bgt	@@draw
	add	r0,r0,r3
	cmp	r0,r2
	blt	@@showSetScroll
	mov	r0,r2
@@showSetScroll:
	str	r0,[r1]
	b	@@draw

@@hide:
	ldr	r0,[r1]		// scroll offset
	cmp	r0,0x0
	ble	@@end
	sub	r0,r0,r3
	cmp	r0,0x0
	bge	@@hideSetScroll
	mov	r0,0x0
@@hideSetScroll:
	str	r0,[r1]		// scroll offset
//	b	@@draw

@@draw:
	// Set x-position
	mov	r4,(72)		// max scroll
	sub	r4,r4,r0
	add	r4,(188)	// base x-position
	lsl	r4,r4,0x10

	// Draw Star Frag box
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	ldr	r2,=0x80004003
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
//	mov	r1,0x0
	ldr	r3,=0xB320
	bl	0x1FF8F40

	ldr	r2,=0x80204003
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r3,=0xB320
	add	r3,0x4
	bl	0x1FF8F40

	ldr	r2,=0x40004013
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r3,=0xB320
	add	r3,0x8
	bl	0x1FF8F40

	ldr	r2,=0x40204013
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	ldr	r3,=0xB320
	add	r3,0xA
	bl	0x1FF8F40

	// Draw numbers
	bl	common_getStarFrags
	mov	r5,r0
	mov	r6,0x0		// drew first number

@@checkDigit1:
//	mov	r0,r5
	ldr	r1,=(1000)
	blx	0x20AED80	// div, rem
	mov	r5,r1

	cmp	r6,0x0
	bne	@@drawDigit1

	cmp	r0,0x0
	beq	@@checkDigit2

	mov	r6,0x1

@@drawDigit1:
	ldr	r3,=0xB32C
	add	r3,r3,r0

	ldr	r2,=0x001C800C
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	bl	0x1FF8F40

@@checkDigit2:
	mov	r0,r5
	mov	r1,(100)
	blx	0x20AED80	// div, rem
	mov	r5,r1

	cmp	r6,0x0
	bne	@@drawDigit2

	cmp	r0,0x0
	beq	@@checkDigit3

	mov	r6,0x1

@@drawDigit2:
	ldr	r3,=0xB32C
	add	r3,r3,r0

	ldr	r2,=0x0024800C
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	bl	0x1FF8F40

@@checkDigit3:
	mov	r0,r5
	mov	r1,(10)
	blx	0x20AED80	// div, rem
	mov	r5,r1

	cmp	r6,0x0
	bne	@@drawDigit3

	cmp	r0,0x0
	beq	@@checkDigit4

	mov	r6,0x1

@@drawDigit3:
	ldr	r3,=0xB32C
	add	r3,r3,r0

	ldr	r2,=0x002C800C
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	bl	0x1FF8F40

@@checkDigit4:
@@drawDigit4:
	ldr	r3,=0xB32C
	add	r3,r3,r5

	ldr	r2,=0x0034800C
	add	r2,r2,r4
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r4-r6,r15


	.pool


.align 4
common_textCall:
	.dw	0x2009729	// callEnableVisualizer
	.dw	common_textCallScreenShake|1
	.dw	common_textCallStartBattle|1
	.dw	common_textCallEnableTextSkip|1
	.dw	common_textCallSetPlayerSatellite|1
	.dw	common_textCallGiveExtraFolder|1
	.dw	common_textCallCheckBoktaiBrother|1
	.dw	common_textCallCheckExVar|1
	.dw	common_textCallSetExVar|1
	.dw	common_textCallBufferExVar|1
	.dw	common_textCallCommonText|1
	.dw	common_textCallReturn|1
	.dw	common_textCallCheckPlayerNameDefault|1
	.dw	common_textCallMugshotShowGeoMenu|1
	.dw	common_textCallSaveCompress|1
	.dw	common_textCallAbortSaveCompress|1
	.dw	common_textCallAllocSaveBufferMenu|1
	.dw	common_textCallFreeSaveBufferMenu|1
	.dw	common_textCallSetBrotherLevelBuffered|1
	.dw	common_textCallRefreshTopScreen|1
	.dw	common_textCallRefreshTopScreenIfExtraFolder|1
	.dw	common_textCallBufferDatabaseCounts|1
	.dw	common_textCallCheckWaveScannerUpdated|1
	.dw	common_textCallUpdateWaveScanner|1
	.dw	common_textCallRandom|1
	.dw	common_textCallBufferNoteGameHighScore|1
	.dw	common_textCallBufferStarFrags|1
	.dw	common_textCallGiveStarFragsBuffered|1
	.dw	common_textCallCheckMapBlock|1
	.dw	common_textCallGiveStarFrags|1
	.dw	common_textCallCheckStarFrags|1
	.dw	common_textCallTakeStarFrags|1
	.dw	common_textCallBufferDailyGigaCard|1
	.dw	common_textCallCheckPersonalBestComboDamage|1
	.dw	common_textCallShowHideStarFragCounter|1
	.dw	common_textCallStarFragTrader|1
	.dw	common_textCallShowBattleCardBuffered|1
	.dw	common_textCallHideBattleCard|1
	.dw	common_textCallCheckBuffer|1
	.dw	common_textCallSetBuffer|1
	.dw	common_textCallReadCardID|1
	.dw	common_textCallMugshotShowGeoOrMegaMan|1
	.dw	common_textCallTestException|1
	.dw	common_textCallBufferGeoOrMegaManName|1
	.dw	common_textCallBackupStarForceCardEquipped|1
	.dw	common_textCallRestoreStarForceCardEquipped|1
	.dw	common_textCallMugshotShowShinNormalOrShadow|1
	.dw	common_textCallReloadColorChangeHumorBuster|1
	.dw	common_textCallBufferNumberDXBossesDefeated|1
	.dw	common_textCallBufferQuizAnswers|1
	.dw	common_textCallHideNPC|1


.align 2
common_textCallHideNPC:
	// r0 = NPC ID
	push	r14

	// Get NPC
	ldr	r1,=0x21A7D70
	ldr	r1,[r1]
	lsl	r0,r0,0x3
	add	r0,r1,r0
	ldr	r0,[r0,0x4]	// NPC data

	// Remove flags:
	// 0x01 = can interact
	// 0x02 = face player
	// 0x04 = has collision
	// 0x20 = has text script
	// 0x40 = on Wave Road
	mov	r1,0xD8
	ldr	r2,[r0,r1]
	mov	r3,0x67
	bic	r2,r3
	str	r2,[r0,r1]

	// Hide NPC sprite
	add	r0,0x40
	bl	0x2020688	// hide sprite

	pop	r15


.align 2
common_textCallReloadColorChangeHumorBuster:
	push	r14
	bl	common_reloadColorChangeHumorBuster
	pop	r15


.align 2
common_textCallBackupStarForceCardEquipped:
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0,0x10]
	ldrb	r0,[r0,0x1A]
	add	r1,=@backupStarForceEquipState
	str	r0,[r1]

	bx	r14

.align 2
common_textCallRestoreStarForceCardEquipped:
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0,0x10]
	ldr	r1,[@backupStarForceEquipState]
	strb	r1,[r0,0x1A]

	bx	r14

.align 4
@backupStarForceEquipState:
	.dw	0x0


.align 2
common_textCallBufferQuizAnswers:
	push	r4,r14
	mov	r4,r0

	ldr	r1,=0xF03D	// Legend Mode active
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@legend

@@normal:
	mov	r0,r4
	mov	r1,(100)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x1
	mov	r1,(110)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x2
	mov	r1,(120)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x3
	mov	r1,(150)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x4
	mov	r1,(160)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x5
	mov	r1,(170)
	bl	0x2008DF0	// store in buffer

	b	@@end

@@legend:
	mov	r0,r4
	mov	r1,(150)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x1
	mov	r1,(160)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x2
	mov	r1,(170)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x3
	mov	r1,(230)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x4
	mov	r1,(240)
	bl	0x2008DF0	// store in buffer
	add	r0,r4,0x5
	mov	r1,(250)
	bl	0x2008DF0	// store in buffer

//	b	@@end

@@end:
	pop	r4,r15


.align 2
common_textCallBufferGeoOrMegaManName:
	push	r14

	// r0 = buffer
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrb	r1,[r1]		// current area
	cmp	r1,0x80
	bge	@@megaMan

@@geo:
	mov	r1,(253+1)
	b	@@buffer

@@megaMan:
	mov	r1,(254+1)
//	b	@@buffer

@@buffer:
	// r0 = buffer
	add	r1,0xFF
	bl	0x2008DF0	// store in buffer

	pop	r15


	.pool


.align 2
common_textCallBufferNumberDXBossesDefeated:
	// r0 = buffer
	push	r4-r5,r14
	mov	r4,r0

	bl	common_getNumberOfDXBossesDefeated
	mov	r5,r0

	// Check Andromeda DX defeated
	ldr	r1,=0xF185
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@setBufferDefeated
	add	r5,0x1

@@setBufferDefeated:
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C
	mov	r1,r5
	bl	0x2008DF0	// store in buffer

	mov	r1,(13)
	sub	r1,r1,r5
	bpl	@@setBufferLeft
	mov	r1,0x0
@@setBufferLeft:
	lsr	r0,r4,0x4
	bl	0x2008DF0	// store in buffer

	pop	r4-r5,r15


	.pool


.align 2
common_textCallTestException:
	push	r14
	bl	common_exceptionHandler
	pop	r15


.align 2
common_textCallMugshotShowShinNormalOrShadow:
	// Set/clear script flags
	mov	r0,r4
	mov	r1,0x2
	lsl	r1,r1,0xE
	bl	0x201E5FC	// set script flags
	mov	r0,r4
	mov	r1,0x11
	lsl	r1,r1,0x16
	bl	0x201E604	// clear script flags

	// Free previous mugshot
	ldr	r2,[r4,0x68]
	cmp	r2,0x0
	beq	@@checkFlag
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x2015620	// free from heap
	mov	r0,0x0
	str	r0,[r4,0x68]

@@checkFlag:
	ldr	r1,=0xF177	// met LM Shin
	bl	0x202409C	// check flag
	mov	r1,0x9B		// normal mugshot
	cmp	r0,0x0
	bne	@@showFace
	add	r1,(0x168 - 0x9B)	// shadow mugshot

@@showFace:
	// Call mugshotShowGeo (partial)
	mov	r0,r1
	bl	@@mugshotShowGeo

	// Advance message pointer (remainder)
	mov	r0,r4
	mov	r1,0x2
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15

@@mugshotShowGeo:
	// Call partial function
	push	r3-r6,r14
	sub	sp,0xC
	mov	r5,r4
	mov	r4,r0
	bl	0x201995C


.align 2
common_textCallMugshotShowGeoOrMegaMan:
	push	r7
	mov	r7,r0

	// Set/clear script flags
	mov	r0,r4
	mov	r1,0x2
	lsl	r1,r1,0xE
	bl	0x201E5FC	// set script flags
	mov	r0,r4
	mov	r1,0x11
	lsl	r1,r1,0x16
	bl	0x201E604	// clear script flags

	// Free previous mugshot
	ldr	r2,[r4,0x68]
	cmp	r2,0x0
	beq	@@getArea
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x2015620	// free from heap
	mov	r0,0x0
	str	r0,[r4,0x68]

@@getArea:
	// Get current area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]		// area
	cmp	r0,0x80
	blt	@@checkVisualizer

	// Mega Man mugshot
	mov	r0,(0x1A9 - 0xFF)
	add	r0,0xFF
	b	@@showFace

@@checkVisualizer:
	ldr	r1,=0xD08
	bl	0x202409C	// check flag

	lsl	r1,r7,0x1
	add	r0,r1,r0
	lsl	r0,r0,0x1
	add	r1,=@@types
	ldrh	r0,[r1,r0]

@@showFace:
	// Call mugshotShowGeo (partial)
	bl	@@mugshotShowGeo

	// Advance message pointer (remainder)
	mov	r0,r4
	mov	r1,0x2
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r7
	pop	r4,r15

@@mugshotShowGeo:
	// Call partial function
	push	r3-r6,r14
	sub	sp,0xC
	mov	r5,r4
	mov	r4,r0
	bl	0x201995C

.align 4
@@types:
	// Geo sad, Geo Visualizer sad
	.dh	0x5A, 0xF0
	// Geo happy, Geo Visualizer happy
	.dh	0x5B, 0xF1
	// Geo no Visualizer sad, Geo no Visualizer sad
	.dh	0xF5, 0xF5
	// Geo no Visualizer happy, Geo no Visualizer happy
	.dh	0xF6, 0xF6
	// Geo Visualizer sad, Geo Visualizer sad
	.dh	0xF0, 0xF0
	// Geo Visualizer happy, Geo Visualizer happy
	.dh	0xF1, 0xF1
	// Geo sad, Geo sad
	.dh	0x5A, 0x5A
	// Geo happy, Geo happy
	.dh	0x5B, 0x5B


.align 2
common_textCallReadCardID:
	push	r6-r7,r14
	mov	r6,r0		// buffer

	// Get card ID at boot
	ldr	r1,=0x27FFC10
	ldr	r0,[r1]
	cmp	r0,0x0
	bne	@@isNormal
@@isDebugger:
	mov	r0,(0x400 >> 0x8)
	lsl	r0,r0,0x8
	sub	r1,r1,r0
@@isNormal:
	sub	r1,0x10

	ldr	r0,[r1]
	mov	r7,r0

	lsr	r1,r7,0x18
	mov	r0,r6		// buffer
	bl	0x2008DF0	// store in buffer

	lsl	r1,r7,0x8
	lsr	r1,r1,0x18
	add	r0,r6,0x1	// buffer+1
	bl	0x2008DF0	// store in buffer

	lsl	r1,r7,0x10
	lsr	r1,r1,0x18
	add	r0,r6,0x2	// buffer+2
	bl	0x2008DF0	// store in buffer

	lsl	r1,r7,0x18
	lsr	r1,r1,0x18
	add	r0,r6,0x3	// buffer+3
	bl	0x2008DF0	// store in buffer

	pop	r6-r7,r15


.align 2
common_textCallSetBuffer:
	push	r0	// buffer

	// Get value
	ldr	r1,[r4,0x10]
	add	r1,0x4
	bl	0x201E6B8	// get u16

	// Set in buffer
	mov	r1,r0
	pop	r0
	bl	0x2008DF0	// set buffer

	// Advance message pointer
	mov	r0,r4
	mov	r1,0x6
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallCheckBuffer:
	push	r6-r7

	// Get buffer value
	bl	0x2009170
	mov	r7,r0

	// Get compare value
	ldr	r6,[r4,0x10]
	add	r1,r6,0x4
	bl	0x201E6B8	// get u16

	// Compare
	cmp	r7,r0
	beq	@@equal
	bgt	@@greater
@@less:
	ldrb	r1,[r6,0x6]
	b	@@doJump
@@equal:
	ldrb	r1,[r6,0x7]
	b	@@doJump
@@greater:
	ldrb	r1,[r6,0x8]
//	b	@@doJump

@@doJump:
	// Do jump
	mov	r0,r4
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@end

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x9
	bl	0x201E6C8

@@end:
	pop	r6-r7
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallHideBattleCard:
	push	r14

	cmp	r0,0x1
	beq	@@menu

	// Free buffers
	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6D
	bl	0x2015EB0	// free buffer with ID

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6C
	bl	0x2015EB0	// free buffer with ID

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6B
	bl	0x2015EB0	// free buffer with ID

	b	@@clearVars

@@menu:
	// Free buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,[@showBattleCardBuffer]
	bl	0x2015620	// free on heap

@@clearVars:
	mov	r0,0x0
	add	r1,=common_showBattleCardID
	str	r0,[r1]
	add	r1,=common_showBattleCardStar
	str	r0,[r1]
	add	r1,=@showBattleCardBuffer
	str	r0,[r1]

	pop	r15


.align 2
common_textCallShowBattleCardBuffered:
	push	r4-r7
	sub	sp,0x20
	str	r0,[sp,0x1C]	// mode

	ldr	r0,[r4,0x10]
	ldrb	r0,[r0,0x4]
	bl	0x2009170	// get buffer
	mov	r4,r0		// card

	ldr	r0,[sp,0x1C]	// mode
	cmp	r0,0x1
	beq	@@menu

	// Allocate buffers
	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x68
	mov	r2,0x6B
	bl	0x2015E1C	// alloc buffer with ID

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldr	r1,=0x80C
	mov	r2,0x6C
	bl	0x2015E1C	// alloc buffer with ID

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x24
	mov	r2,0x6D
	bl	0x2015E1C	// alloc buffer with ID

	// Get buffers
	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6B
	bl	0x2015E94	// get buffer with ID
	mov	r5,r0

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6C
	bl	0x2015E94	// get buffer with ID
	mov	r6,r0

	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	ldr	r0,[r0]
	mov	r1,0x6D
	bl	0x2015E94	// get buffer with ID
	mov	r7,r0
	b	@@loadSprite

@@menu:
	// Allocate buffers
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,=0x80C
	add	r2,(0x68 + 0x24)
	bl	0x20155DC	// alloc on heap
	add	r1,=@showBattleCardBuffer
	str	r0,[r1]
	mov	r5,r0
	mov	r6,r5
	add	r6,0x68
	mov	r7,r6
	ldr	r0,=0x80C
	add	r7,r7,r0

@@loadSprite:
	// Load Battle Card sprite file
	mov	r0,0x68
	str	r0,[sp]
	ldr	r0,=0x211C998
	mov	r1,r5
	ldr	r2,=((22 << 0x10) | (3))	// battlecard_3.bin
	mov	r3,0x0
	bl	0x2012354	// read file

	// Load card sprite
	ldr	r0,=(0x21AC1D8 + 0x80 + 0x2*0xC0)
//	ldr	r0,=0x21AC1D8
//	mov	r1,0x2
//	bl	0x21649B0

	mov	r1,0x5C		// x
	str	r1,[sp]
	mov	r1,0x34		// y
	str	r1,[sp,0x4]
	str	r4,[sp,0x8]	// card ID
	mov	r1,(0xC200 >> 0x8)
	lsl	r1,r1,0xE
	str	r1,[sp,0xC]
	mov	r1,0xA		// palette
	str	r1,[sp,0x10]
	ldr	r1,[sp,0x1C]	// mode (0 = screen 0, 1 = screen 1)
	str	r1,[sp,0x14]
	mov	r1,0x0
	str	r1,[sp,0x18]

	mov	r1,r5
	mov	r2,r6
	mov	r3,r7
	bl	0x2009B30

	// Show card sprite
	ldr	r0,=(0x21AC1D8 + 0x80 + 0x2*0xC0)
//	ldr	r0,=0x21AC1D8
//	mov	r1,0x2
//	bl	0x21649B0

	mov	r1,r4		// card ID
	mov	r2,0x5C		// x
	mov	r3,0x34		// y
	bl	0x2009D30

	ldr	r0,=common_showBattleCardStar
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@setCardID

	// Draw star (requires Star Frag counter to be loaded)
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	ldr	r3,=0xB336
	ldr	r2,=0x4095005B
	ldr	r0,=0x211CDC0
	bl	0x1FF8F40

@@setCardID:
	add	r0,=common_showBattleCardID
	str	r4,[r0]

	add	sp,0x20
	pop	r4-r7

	// Advance message pointer
	mov	r0,r4
	mov	r1,0x5
	bl	0x201E6C8

	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallStarFragTrader:
	push	r4-r7,r14

	// Seed Card Trader RNG
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFC
	ldr	r1,[r1,(0x134 - 0xFC)]	// Trader seed
	ldr	r0,=0x211F6A8
	bl	0x2022C88

	// RNG call for card
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	mov	r6,r0

	ldr	r4,=@starFragTraderLists

	// RNG call for rarity and Star Card
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	mov	r7,r0
	mov	r0,0x3F
	and	r0,r7

@@listA:
//	cmp	r0,(0)
	bne	@@listB
	ldr	r4,[r4]
	b	@@count
@@listB:
	cmp	r0,(6)
	bhi	@@listC
	ldr	r4,[r4,0x4]
	b	@@count
@@listC:
	cmp	r0,(14)
	bhi	@@listD
	ldr	r4,[r4,0x8]
	b	@@count
@@listD:
	cmp	r0,(24)
	bhi	@@listE
	ldr	r4,[r4,0xC]
	b	@@count
@@listE:
	cmp	r0,(40)
	bhi	@@listF
	ldr	r4,[r4,0x10]
	b	@@count
@@listF:
	ldr	r4,[r4,0x14]

@@count:
	mov	r5,0x0
	ldr	r1,=0xFFFF
@@loop:
	lsl	r0,r5,0x1
	ldrh	r0,[r4,r0]
	cmp	r0,r1
	beq	@@chooseCard
	add	r5,0x1
	b	@@loop

@@chooseCard:
	sub	r5,0x1
	and	r5,r6
	lsl	r0,r5,0x1
	ldrh	r5,[r4,r0]	// card

	// Check if this should be a Star Card
	mov	r6,0x0		// don't upgrade
	lsr	r0,r7,0x10
	mov	r1,(12)
	blx	0x208985C	// mod s32
	cmp	r0,0x0
	bne	@@nextSeed

	// Check if this card can be a Star Card
	ldr	r1,=data_extraCardInfo
	lsl	r0,r5,0x17
	lsr	r0,r0,0x16
	ldrb	r0,[r1,r0]	// power up description
	cmp	r0,0x0
	beq	@@nextSeed

	// Upgrade to Star Card
	lsl	r5,r5,0x17
	lsr	r5,r5,0x17
	mov	r0,0x2
	lsl	r0,r0,0x9
	orr	r5,r0
	mov	r6,0x1

@@nextSeed:
	add	r0,=common_showBattleCardStar
	str	r6,[r0]

	// RNG call for next seed
	ldr	r0,=0x211F6A8
	bl	0x20069E0

	// Store
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFC

	str	r5,[r1,(0x108 - 0xFC)]	// card
	str	r0,[r1,(0x134 - 0xFC)]	// Trader seed

	// Buffer card data
	lsl	r1,r5,0x17
	lsr	r1,r1,0x17	// card ID
	lsr	r0,r5,0x9	// card color
	lsl	r0,r0,0x10
	orr	r1,r0
	mov	r0,0x1
	lsl	r0,r0,0x18
	orr	r1,r0		// card drop data
	mov	r0,0x0		// buffer 0
	bl	0x2008DF0	// store in buffer

	lsl	r1,r5,0x17
	lsr	r1,r1,0x17	// card ID
	mov	r0,0x1		// buffer 1
	bl	0x2008DF0	// store in buffer

	lsr	r1,r5,0x9	// card color
	mov	r0,0x2		// buffer 2
	bl	0x2008DF0	// store in buffer

	lsl	r1,r5,0x17
	lsr	r1,r1,0x17	// card ID
	cmp	r6,0x0
	beq	@@setCardName
	// Change to Star Card name
	add	r1,(0x100 + 50 - 1 - 0xFF)
	add	r1,0xFF
@@setCardName:
	mov	r0,0x3		// buffer 3
	bl	0x2008DF0	// store in buffer
	pop	r4-r7,r15

	.pool


.align 2
common_textCallShowHideStarFragCounter:
	push	r14
	sub	sp,0x4

	add	r2,=@starFragCounterShow
	ldrb	r1,[r2]
	cmp	r0,r1
	beq	@@end
	str	r0,[r2]

	cmp	r0,0x0
	beq	@@end

@@show:
	// Load Star Frag counter palette
	ldr	r0,=((20 << 0x10) | (21))
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,0xB
	mov	r3,0x0
	bl	0x202F370	// load OBJ palette from file

	// Load Star Frag counter graphics
	ldr	r0,=((20 << 0x10) | (20))
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,(0xC800 >> 0x8)
	lsl	r2,r2,0x8
	mov	r3,0x0
	bl	0x202F118	// load OBJ tiles from file

@@end:
	add	sp,0x4
	pop	r15


.align 4
@starFragCounterShow:
	.dw	0x0
@starFragCounterScroll:
	.dw	0x0
@showBattleCardBuffer:
	.dw	0x0
common_showBattleCardID:
	.dw	0x0
common_showBattleCardStar:
	.dw	0x0

.align 2
common_textCallCheckPersonalBestComboDamage:
	push	r5-r7
	mov	r7,0x0		// actual damage

	// Get compare value
	ldr	r5,[r4,0x10]
	add	r1,r5,0x3
	bl	0x201E6B8	// get u16
	mov	r6,r0		// compare damage

	// Get player Best Combo data
	mov	r1,0x0
	bl	0x200CC70
	mov	r1,0xD2
	ldrb	r1,[r0,r1]	// Best Combo ID
	cmp	r1,0xFF
	beq	@@none

	// Get Best Combo damage
	ldr	r7,[r0,0x4]

	// Write to Best Combo name buffer
	mov	r1,r0
	add	r1,0x68
	ldr	r2,=0x21036C8
	mov	r3,0x12
	bl	0x202DFA0	// copy 16-bit

	// Compare damage
	cmp	r7,r6
	blt	@@lower

@@greaterOrEqual:
	ldrb	r1,[r5,0x6]
	b	@@doJump
@@lower:
	ldrb	r1,[r5,0x7]
	b	@@doJump
@@none:
	ldrb	r1,[r5,0x8]
//	b	@@doJump

@@doJump:
	// Do jump
	mov	r0,r4
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@bufferDamage

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x6
	bl	0x201E6C8

@@bufferDamage:
	ldrb	r0,[r5,0x5]	// buffer
	mov	r1,r7
	bl	0x2008DF0	// set buffer

@@end:
	pop	r5-r7
	mov	r0,0x0
	pop	r4,r15


	.pool


.align 2
common_textCallBufferDailyGigaCard:
	push	r4-r5,r14
	mov	r4,r0		// buffer

	// Choose new Giga trade (if applicable)
	bl	common_chooseGigaTradeToday

	// Get Giga Card
	mov	r0,((0xF260 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// card
	mov	r5,r0
	mov	r1,r5

	// Color
	bl	common_isWhiteCardID
	bne	@@white
@@red:
	mov	r0,0x3
	lsl	r0,r0,0x10
	orr	r1,r0
@@white:

	// Amount
	mov	r0,0x1
	lsl	r0,r0,0x18
	orr	r1,r0

	// Store in buffer
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C
	bl	0x2008DF0	// store in buffer

	lsr	r0,r4,0x4
	mov	r1,r5
	bl	0x2008DF0	// store in buffer

	pop	r4-r5,r15


.align 2
common_textCallTakeStarFrags:
	push	r4,r14
	mov	r4,r0		// amount

	bl	common_getStarFrags
	sub	r0,r0,r4
	bpl	@@set
	mov	r0,0x0
@@set:
	bl	common_setStarFrags

	pop	r4,r15


.align 2
common_textCallCheckStarFrags:
	push	r0		// amount

	bl	common_getStarFrags
	pop	r1

	cmp	r0,r1
	ldr	r0,[r4,0x10]
	blt	@@notEnough
@@enough:
	ldrb	r1,[r0,0x4]
	b	@@doJump
@@notEnough:
	ldrb	r1,[r0,0x5]
//	b	@@doJump

@@doJump:
	// Do jump
	mov	r0,r4
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@end

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x6
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallCheckMapBlock:
	push	r0	// r0 = value

	// Get map block
	bl	0x218949C

	pop	r1
	cmp	r0,r1
	ldr	r0,[r4,0x10]
	bne	@@false
@@true:
	ldrb	r1,[r0,0x4]
	b	@@doJump
@@false:
	ldrb	r1,[r0,0x5]
//	b	@@doJump

@@doJump:
	// Do jump
	mov	r0,r4
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@end

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x6
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallGiveStarFrags:
	// r0 = Star Frags
	push	r14
	bl	common_addStarFrags
	pop	r15


.align 2
common_textCallGiveStarFragsBuffered:
	push	r14

	// Get buffered Star Frags
	bl	0x2009170	// read from buffer

	// Add Star Frags (r0 = count)
	bl	common_addStarFrags

	pop	r15

.align 2
common_textCallBufferStarFrags:
	push	r4,r14
	mov	r4,r0		// buffer

	bl	common_getStarFrags
	mov	r1,r0
	mov	r0,r4
	bl	0x2008DF0	// store in buffer

	pop	r4,r15

.align 2
common_addStarFrags:
	push	r4,r14
	mov	r4,r0

	bl	common_getStarFrags
	add	r0,r0,r4
	ldr	r1,=(9999)
	cmp	r0,r1
	ble	@@set
	mov	r0,r1
@@set:
	bl	common_setStarFrags

	pop	r4,r15

.align 2
common_getStarFrags:
	push	r4,r14

	// Get Star Frags
	mov	r0,((0xF298 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0
	lsl	r4,r0,0x18

	mov	r0,((0xF290 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0
	lsl	r0,r0,0x10
	add	r4,r4,r0

	mov	r0,((0xF288 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0
	lsl	r0,r0,0x8
	add	r4,r4,r0

	mov	r0,((0xF280 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0
	add	r4,r4,r0

	mov	r0,r4
	pop	r4,r15

.align 2
common_setStarFrags:
	push	r4,r14
	mov	r4,r0

	// Set Star Frags
	mov	r0,((0xF298 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC
	lsr	r1,r4,0x18
	strb	r1,[r0]

	mov	r0,((0xF290 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC
	lsr	r1,r4,0x10
	strb	r1,[r0]

	mov	r0,((0xF288 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC
	lsr	r1,r4,0x8
	strb	r1,[r0]

	mov	r0,((0xF280 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC
	strb	r4,[r0]

	pop	r4,r15

.align 2
common_textCallBufferNoteGameHighScore:
	push	r4-r5,r14
	mov	r5,r0		// buffer

	// Get high score
	mov	r0,((0xF2A8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// high score HI
	lsl	r4,r0,0x8

	mov	r0,((0xF2A0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// high score LO
	add	r1,r4,r0

	// Buffer score
	mov	r0,r5
	bl	0x2008DF0	// store in text buffer

	pop	r4-r5,r15


.align 2
common_textCallRandom:
	push	r5-r6,r14
	ldr	r5,[r4,0x10]

	// Get random table
	add	r1,=@callRandomTables
	ldrb	r0,[r5,0x3]	// id
	cmp	r0,0x1
	bhi	.
	lsl	r0,r0,0x2
	ldr	r6,[r1,r0]

	// Check initialized
	ldrb	r0,[r6]		// table index
	ldrb	r1,[r6,0x1]	// table count
	cmp	r0,r1
	blt	@@pickRandom

	// Initialize table
	add	r0,r6,0x2	// table
	ldrb	r1,[r5,0x5]	// count
	mov	r2,0x0		// index
	strb	r2,[r6]		// table index
	strb	r1,[r6,0x1]	// table count
	b	@@initLoopEnd
@@initLoop:
	strb	r2,[r0,r2]
	add	r2,0x1
@@initLoopEnd:
	cmp	r2,r1
	blo	@@initLoop

	// Shuffle table
	// r0 = table
	// r1 = count
	bl	0x20069B0

@@pickRandom:
	// Get random value
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x6	// test 0x20
	bcs	@@pickRandomIndex

	// Get next index from table
	ldrb	r0,[r6]		// table index
	add	r1,r0,0x1
	strb	r1,[r6]		// table index

	add	r0,0x2
	ldrb	r0,[r6,r0]
	b	@@doJump

@@pickRandomIndex:
	// Get random value
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	ldrb	r1,[r5,0x5]	// count
	blx	0x208985C	// mod s32

//	b	@@doJump

@@doJump:
	// Get script to jump to
	ldrb	r1,[r5,0x4]	// start
	add	r1,r1,r0

	// Jump to script
	mov	r0,r4
	bl	0x201DD08	// jump to script
	cmp	r0,0x0
	beq	@@end		// advance normally

	// Exit command
	pop	r5-r6
	add	sp,0x4
	mov	r0,0x0
	pop	r4,r15

@@end:
	pop	r5-r6,r15

.align 4
@callRandomTables:
	.dw	@callRandomTableId0
	.dw	@callRandomTableId1

.align 4
@callRandomTableId0:
	.db	0x0, 0x0	// index, count
	.fill	32
.align 4
@callRandomTableId1:
	.db	0x0, 0x0	// index, count
	.fill	32


.align 2
common_textCallCheckWaveScannerUpdated:
	push	r5-r7,r14
	mov	r7,0x0		// changed

	// Get player satellite
	bl	common_getPlayerSatellite
	mov	r6,r0		// Satellite

	// Get number of Counter Hits
	bl	common_getDatabaseCounts
	mov	r5,r1		// level
@@checkMin:
	cmp	r5,(1)
	bgt	@@checkMax
	mov	r5,(1)
@@checkMax:
	cmp	r5,(99)
	ble	@@checkLevel
	mov	r5,(99)

@@checkEnabled:
	// Get Wave Scanner enabled
	bl	0x20228FC

	cmp	r0,0x0
	bne	@@checkLevel
	mov	r7,0x1

@@checkLevel:
	// Get Wave Scanner level
	bl	0x202291C

	cmp	r0,r5
	beq	@@checkSatellite
	mov	r7,0x1		// changed

@@checkSatellite:
	// Get Wave Scanner Satellite
	bl	0x2022940

	cmp	r0,r6
	beq	@@bufferLevel
	mov	r7,0x1

@@bufferLevel:
	// Buffer new level
	ldr	r0,[r4,0x10]
	ldrb	r0,[r0,0x3]
	mov	r1,r5
	bl	0x2008DF0	// store in text buffer

@@checkChanged:
	cmp	r7,0x0
	bne	@@end

@@doJump:
	mov	r0,r4
	ldr	r1,[r4,0x10]
	ldrb	r1,[r1,0x4]
	bl	0x201DD08	// jump to script
	cmp	r0,0x0
	beq	@@end		// advance normally

	// Exit command
	pop	r5-r7
	add	sp,0x4
	mov	r0,0x0
	pop	r4,r15

@@end:
	// Advance message pointer
	mov	r0,r4
	mov	r1,(5 - 4)
	bl	0x201E6C8
	pop	r5-r7,r15


.align 2
common_textCallUpdateWaveScanner:
	push	r5-r6,r14

	// Get player satellite
	bl	common_getPlayerSatellite
	mov	r6,r0		// Satellite

	// Get number of Counter Hits
	bl	common_getDatabaseCounts
	mov	r5,r1		// level
@@checkMin:
	cmp	r5,(1)
	bgt	@@checkMax
	mov	r5,(1)
@@checkMax:
	cmp	r5,(99)
	ble	@@updateStats
	mov	r5,(99)

@@updateStats:
	// Check if stat boosts were enabled
	bl	0x20228D4
	cmp	r0,0x0
	beq	@@setNewStats

	// Disable current stat boosts
	mov	r1,0x0
	bl	0x20228C8
	bl	0x218898C

@@setNewStats:
	// Clear enabled and Satellite
	bl	0x20228E0

	// Set enabled
	mov	r1,0x1
	bl	0x20228EC

	// Set Satellite
	lsl	r1,r6,0x4
	bl	0x20228EC

	// Set level
	mov	r1,r5
	bl	0x2022910

	// Enable stats
	mov	r1,0x1
	bl	0x20228C8
	bl	0x2188964

	// Recover HP
	bl	0x2007D04

	bl	common_reloadColorChangeHumorBuster

	pop	r5-r6,r15


.align 2
common_textCallBufferDatabaseCounts:
	push	r4-r6,r14

	ldr	r0,[r4,0x10]	// text pointer
	ldrb	r0,[r0,0x3]
	lsl	r5,r0,0x1C
	lsr	r5,r5,0x1C	// delete buffer
	lsr	r6,r0,0x4	// counter hit buffer

	bl	common_getDatabaseCounts
	mov	r4,r0

	// Buffer counter hit count
	mov	r0,r6
	bl	0x2008DF0	// store in text buffer

	// Buffer delete count
	mov	r0,r5
	mov	r1,r4
	bl	0x2008DF0	// store in text buffer

	pop	r4-r6,r15


.align 2
common_getDatabaseCounts:
	push	r4-r6,r14
	ldr	r4,=records_databaseEntries
	mov	r5,0x0		// delete count
	mov	r6,0x0		// counter hit count

@@loop:
	ldrh	r0,[r4]		// enemy ID
	cmp	r0,0x0
	beq	@@end
@@checkDelete:
	ldrh	r1,[r4,0x4]	// entry flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkCounterHit
	add	r5,0x1
@@checkCounterHit:
	ldrh	r1,[r4,0x6]	// counter flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@next
	add	r6,0x1
@@next:
	add	r4,0x8
	b	@@loop

@@end:
	mov	r0,r5
	mov	r1,r6
	pop	r4-r6,r15


.align 2
common_textCallRefreshTopScreenIfExtraFolder:
	push	r4,r14
	mov	r4,r0

	// Check if Extra Folder is equipped
	bl	0x2007308
	cmp	r1,0x2
	bne	@@end

	mov	r0,r4
	bl	common_textCallRefreshTopScreen

@@end:
	pop	r4,r15


.align 2
common_textCallRefreshTopScreen:
	push	r14

	// Refresh top screen if necessary
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFB
	ldrb	r1,[r1]
	cmp	r1,r0
	bne	@@end

	bl	common_refreshTopScreen

@@end:
	pop	r15


.align 2
common_textCallSetBrotherLevelBuffered:
	push	r4-r7

	// Get Brother ID
	ldr	r3,[r4,0x10]
	ldrb	r0,[r3,0x3]	// brother ID buffer
	bl	0x2009170	// get buffer value
	mov	r4,r0		// brother ID

	// Get Brother level
	ldrb	r0,[r3,0x4]	// brother level buffer
	bl	0x2009170	// get buffer value
	mov	r5,r0		// brother level

	// Get Brother data
	mov	r1,r4
	bl	0x200C93C	// get brother data
	mov	r6,r0		// brother data

	// Get Brother type
	mov	r1,r4
	bl	0x200D04C

	lsl	r1,r0,0x18	// test 0x100
	bcc	@@realBro

@@npcBro:
	mov	r1,r4
	bl	0x200BDC8	// get is Lunar Knights
	mov	r1,r0
	bl	0x2022620	// get all stats
	b	@@removeStats

@@realBro:
	lsr	r1,r1,0x18
	bl	0x2022610	// get all stats

@@removeStats:
	mov	r7,r0		// all stats
	ldr	r0,=0x211F658
	ldr	r0,[r0]
	mov	r1,r7
	mov	r2,r6
	bl	0x2022758

	// Set new level
	ldr	r0,=0x56D
	strb	r5,[r6,r0]

	// Reapply Brother stats
	ldr	r0,=0x211F658
	ldr	r0,[r0]
	mov	r1,r7
	mov	r2,r6
	bl	0x20226C0

	pop	r4-r7

	// Restore Geo's HP
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	cmp	r0,0x80
	bcs	@@end

	bl	0x2007D04

@@end:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x5
	bl	0x201E6C8

	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallSaveCompress:
.if OPT_SAVE_PERSIST_BUFFERS
	push	r14
	sub	sp,0x4

	ldr	r0,=common_savePersistBufferCompress
	ldr	r0,[r0]
	str	r0,[sp]
	
	ldr	r0,=0x210CCF0
	ldr	r0,[r0]
	ldr	r1,=0x2130BCC
	ldr	r2,=0xAF8C
	ldr	r3,=common_savePersistBufferUncompress
	ldr	r3,[r3]

	bl	0x200A7EC	// Save_SaveAsync

	add	sp,0x4
	pop	r15
.else
	// r0 = 0 = check script buffers, 1 = ignore script buffers
	push	r4-r5,r14	// uses r4
	mov	r5,r0
	bne	@@customBuffers

	// Use buffer allocated by script first
	add	r4,0xF8
	ldr	r3,[r4]		// uncompressed buffer
	ldr	r0,[r4,0x4]	// compressed buffer
	cmp	r3,0x0
	bne	@@setBuffers

@@customBuffers:
	ldr	r0,[var_textSaveCompressBuffer]
	ldr	r3,[var_textSaveUncompressBuffer]

	cmp	r4,0x0
	beq	@@setBuffers
	str	r0,[r4,0x4]
	str	r3,[r4]

@@setBuffers:
	push	r0

	ldr	r0,=0x210CCF0
	ldr	r0,[r0]
	ldr	r1,=0x2130BCC
	ldr	r2,=0xAF8C
	bl	0x200A7EC	// Save_SaveAsync

	pop	r0,r4-r5,r15	// pop extra for allocation
.endif


.align 2
common_textCallAbortSaveCompress:
	push	r5-r6,r14

	// Disable interrupts
	blx	0x208FB5C	// disable interrupts
	mov	r6,r0

	// Get compression thread info
	ldr	r0,=0x210CCF0
	ldr	r0,[r0]
	ldr	r1,=0x14E4
	add	r5,r0,r1

	// Check if thread ended
	ldr	r0,[r5,0xC]
	cmp	r0,0x0
	beq	@@end

	mov	r0,r5
	add	r0,0x14
	blx	0x208E244	// destroy thread

	// Set thread not started
	mov	r0,0x0
	str	r0,[r5,0xC]

.if !OPT_SAVE_PERSIST_BUFFERS
	// Free compression work buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,[var_textSaveCompressWorkBuffer]
	cmp	r2,0x0
	beq	@@end
	bl	0x2015620	// free on heap
.endif

@@end:
	// Restore interrupts
	mov	r0,r6
	blx	0x208FB70	// restore interrupts

	pop	r5-r6,r15

.align 2
common_saveAllocCompressWorkBuffer:
.if OPT_SAVE_PERSIST_BUFFERS
	ldr	r0,=common_savePersistBufferWork
	ldr	r0,[r0]
	bx	r14
.else
	push	r0-r3,r7,r14	// uses r6

	// Disable interrupts
	blx	0x208FB5C	// disable interrupts
	mov	r7,r0

	// Allocate on heap
	pop	r0-r3
	bl	0x20155FC

	ldr	r1,=var_textSaveCompressWorkBuffer
	str	r0,[r1]
	mov	r6,r0

	// Restore interrupts
	mov	r0,r7
	blx	0x208FB70	// restore interrupts

	mov	r0,r6
	pop	r7,r15
.endif

.align 2
common_saveFreeCompressWorkBuffer:
.if OPT_SAVE_PERSIST_BUFFERS
	bx	r14
.else
	push	r0-r2,r7,r14

	// Disable interrupts
	blx	0x208FB5C	// disable interrupts
	mov	r7,r0

	// Free on heap
	pop	r0-r2
	bl	0x2015620

	ldr	r1,=var_textSaveCompressWorkBuffer
	mov	r0,0x0
	str	r0,[r1]

	// Restore interrupts
	mov	r0,r7
	blx	0x208FB70	// restore interrupts

	pop	r7,r15
.endif

.align 2
common_saveCompressCallback:
	push	r4-r5,r14
	mov	r4,r0

//	// Disable interrupts
//	blx	0x208FB5C	// disable interrupts
//	mov	r5,r0

	// Check if save worker thread is waiting
	ldr	r0,[r4,0x64]	// thread state
	cmp	r0,0x0		// thread waiting
	bne	@@end

	mov	r0,r4
	blx	0x208E3D4	// wakeup thread direct

@@end:
//	// Restore interrupts
//	mov	r0,r5
//	blx	0x208FB70	// restore interrupts

	pop	r4-r5,r15


.align 2
common_textCallAllocSaveBufferMenu:
.if OPT_SAVE_PERSIST_BUFFERS
	bx	r14
.else
	push	r14

	// Check if already allocated
	ldr	r0,[var_textSaveUncompressBuffer]
	cmp	r0,0x0
	bne	@@end

	// Allocate uncompressed buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,=0xAF8C
	sub	r3,r1,0x5	// -4
	bl	0x20155FC	// alloc on heap

//	mov	r1,0xF8
//	str	r0,[r4,r1]
	add	r1,=var_textSaveUncompressBuffer
	str	r0,[r1]

	// Allocate compressed buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,=0xAF8C
	sub	r3,r1,0x5	// -4
	bl	0x20155FC	// alloc on heap

//	mov	r1,0xFC
//	str	r0,[r4,r1]
	add	r1,=var_textSaveCompressBuffer
	str	r0,[r1]

@@end:
	pop	r15
.endif


.align 2
common_textCallFreeSaveBufferMenu:
.if OPT_SAVE_PERSIST_BUFFERS
	bx	r14
.else
	push	r14	// uses r4

	// Free compressed buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
//	mov	r2,0xFC
//	ldr	r2,[r4,r2]
	ldr	r2,[var_textSaveCompressBuffer]
	bl	0x2015620	// free on heap

	// Free uncompressed buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
//	mov	r2,0xF8
//	ldr	r2,[r4,r2]
	ldr	r2,[var_textSaveUncompressBuffer]
	bl	0x2015620	// free on heap

	mov	r0,0x0
	add	r2,=var_textSaveUncompressBuffer
	str	r0,[r2]
	str	r0,[r2,0x4]	// compress buffer

	pop	r15
.endif


	.pool


.align 2
common_textCallMugshotShowGeoMenu:
	// Set/clear script flags
	mov	r0,r4
	mov	r1,0x2
	lsl	r1,r1,0xE
	bl	0x201E5FC	// set script flags
	mov	r0,r4
	mov	r1,0x11
	lsl	r1,r1,0x16
	bl	0x201E604	// clear script flags

	// Free previous mugshot
	ldr	r2,[r4,0x68]
	cmp	r2,0x0
	beq	@@getFace
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x2015620	// free from heap
	mov	r0,0x0
	str	r0,[r4,0x68]

@@getFace:
	// Check got Visualizer
	mov	r0,0x1
	bl	0x2007BB8
	cmp	r0,0x0
	bne	@@getGeoFace

	mov	r0,0xF5		// no Visualizer
	b	@@showFace

@@getGeoFace:
	// Get Geo mugshot
	bl	0x2009504

@@showFace:
	// Call mugshotShowGeo (partial)
	bl	@@mugshotShowGeo

	// Advance message pointer (remainder)
	mov	r0,r4
	mov	r1,0x2
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15

@@mugshotShowGeo:
	// Call partial function
	push	r3-r6,r14
	sub	sp,0xC
	mov	r5,r4
	mov	r4,r0
	bl	0x201995C


.align 2
common_textMsgClose1:
	push	r14
	bl	0x201E5FC

	// Set 0xA001
	ldr	r1,=0xA001
	bl	0x201E604

	pop	r15

common_textMsgClose2:
	push	r14
	bl	0x201E604

	// Clear text box tilemap
	mov	r0,0x0
	mov	r1,0xF
	mov	r2,0x20
	mov	r3,0x9
	push	r0-r3
	ldr	r0,=0x210F350
	mov	r1,0x54
	ldrb	r1,[r4,r1]
	mov	r2,0x60
	ldrb	r2,[r4,r2]
	mov	r3,0x0
	bl	0x200B900
	add	sp,0x10

	pop	r15


.align 2
common_textCallCheckPlayerNameDefault:
	push	r0,r14

	// Player default name part 1
	bl	0x20096C4	// get NPC names text archive
	mov	r1,0x1		// first name
	bl	0x200927C	// get script pointer
	mov	r2,r0

	// Player entered name part 1
	ldr	r1,=0x20F8E78
	ldr	r1,[r1]
	bl	0x218529C	// check strings equal
	cmp	r0,0x0
	beq	@@end		// skip if not equal

	// Player default name part 2
	bl	0x20096C4	// get NPC names text archive
	mov	r1,0x0		// last name
	bl	0x200927C	// get script pointer
	mov	r2,r0

	// Player entered name part 2
	ldr	r1,=0x20F8E78
	ldr	r1,[r1,0x4]
	bl	0x218529C	// check strings equal
	cmp	r0,0x0
	beq	@@end		// skip if not equal

	mov	r0,r4
	ldr	r1,[sp]		// pushed r0
	bl	0x201DD08	// jump to script
	cmp	r0,0x0
	beq	@@end		// advance normally

	add	sp,0x8
	mov	r0,0x0
	pop	r4,r15

@@end:
	pop	r0,r15


.align 2
common_textCallCommonText:
	// Store return pointer
	ldr	r2,=var_textReturnMsg
	ldr	r1,[r4,0xC]
	str	r1,[r2]		// stores in var_textReturnMsg
	ldr	r1,[r4,0x10]
	add	r1,0x4		// return after this command
	str	r1,[r2,0x4]	// stores in var_textReturnPtr

	// Get fieldcommon text file
	ldr	r3,=0x211CD78
	ldr	r3,[r3]
	ldr	r3,[r3,0x20]
	// Get text address
	lsl	r0,r0,0x1
	add	r1,r3,r0
	bl	0x201E6B8	// load 16-bit
	add	r0,r3,r0

	// Set new text pointer
	str	r3,[r4,0xC]
	str	r0,[r4,0x10]

	// "Advance" message pointer
	mov	r0,r4
	mov	r1,0x0
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallReturn:
	// Reload previous text pointer
	ldr	r0,[var_textReturnMsg]
	str	r0,[r4,0xC]
	ldr	r0,[var_textReturnPtr]
	str	r0,[r4,0x10]

	// "Advance" message pointer
	mov	r0,r4
	mov	r1,0x0
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


	.pool


.align 4
var_textReturnMsg:
	.dw	0x0
var_textReturnPtr:
	.dw	0x0
.if !OPT_SAVE_PERSIST_BUFFERS
var_textSaveCompressWorkBuffer:
	.dw	0x0
var_textSaveUncompressBuffer:
	.dw	0x0
var_textSaveCompressBuffer:
	.dw	0x0
.endif


.align 2
common_textCallBufferExVar:
	push	r0,r5	// r0 = buffer

	// Get var parameter
	ldr	r1,[r4,0x10]
	add	r1,0x4
	bl	0x201E6B8

	// r0 = Fxxx
	lsl	r0,r0,0x14
	lsr	r0,r0,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070F0	// r0 = card count

	ldr	r2,[r4,0x10]
	ldrb	r1,[r2,0x6]	// r1 = div
	ldrb	r5,[r2,0x7]	// r2 = mod

	blx	0x2089820	// r0 = r0 / r1

	mov	r1,r5
	blx	0x208985C	// r0 = r0 % r1
	mov	r1,r0

	pop	r0,r5
	bl	0x2008DF0	// set to buffer

	// Advance message pointer
	mov	r0,r4
	mov	r1,0x8
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallSetExVar:
	push	r0	// r0 = value

	// Get var parameter
	ldr	r1,[r4,0x10]
	add	r1,0x4
	bl	0x201E6B8

	// r0 = Fxxx
	lsl	r0,r0,0x14
	lsr	r0,r0,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070FC	// r0 = card count pointer

	pop	r1
	strb	r1,[r0]

	// Advance message pointer
	mov	r0,r4
	mov	r1,0x6
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallCheckExVar:
	push	r0	// r0 = value

	// Get var parameter
	ldr	r1,[r4,0x10]
	add	r1,0x4
	bl	0x201E6B8

	// r0 = Fxxx
	lsl	r0,r0,0x14
	lsr	r0,r0,0x17	// r0 = xxx / 8
	add	r0,0x1
	mov	r1,0x3
	bl	0x20070F0	// r0 = card count

	pop	r1
	cmp	r0,r1
	bne	@@continueScript

	// Equals, do jump
	mov	r0,r4
	ldr	r1,[r4,0x10]
	ldrb	r1,[r1,0x6]
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@end

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x7
	bl	0x201E6C8

@@end:
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallCheckBoktaiBrother:
	push	r0,r5		// r0 = Boktai Brother type

	mov	r5,0x1

@@loop:
	// Check Brother ID
	mov	r1,r5
	bl	0x200BDC8	// Brother ID
	cmp	r0,0x81		// Boktai Brother ID
	bne	@@next

	// Check Boktai Brother type
	mov	r1,r5
	bl	0x200C93C	// Brother data
	mov	r1,0x3E
	lsl	r1,r1,0x4
	ldrb	r0,[r0,r1]	// Boktai Brother type
	ldr	r1,[sp]
	cmp	r0,r1
	bne	@@next

	// Match found, do jump
	mov	r0,r4
	ldr	r1,[r4,0x10]
	ldrb	r1,[r1,0x4]
	bl	0x201DD08
	cmp	r0,0x0
	bne	@@end
	b	@@continueScript

@@next:
	add	r5,0x1
	cmp	r5,0x6
	ble	@@loop

@@continueScript:
	// Advance message pointer
	mov	r0,r4
	mov	r1,0x5
	bl	0x201E6C8

@@end:
	pop	r0,r5
	mov	r0,0x0
	pop	r4,r15


.align 2
common_textCallGiveExtraFolder:
	push	r14

	// r0 = Extra Folder ID
	bl	common_changeExtraFolder

@@end:
	pop	r15


	.pool


.align 2
common_changeExtraFolder:
	// r0 = Extra Folder index
	push	r4-r7,r14
	mov	r7,r0
	mov	r1,0x44
	mul	r0,r1
	ldr	r1,=common_extraFolders
	add	r5,r1,r0	// pointer to folder name
	mov	r4,r5
	add	r4,0x8		// pointer to cards list
	mov	r6,0x8		// max name length

	// Check if this is the first new Extra Folder we get
	bl	folder_haveMultipleExtraFolders
	cmp	r0,0x0
	bne	@@setFolder

	// Receive mail 28
	ldr	r0,=0x211CD4C
	ldr	r0,[r0]
	ldr	r1,=0x161C
	bl	0x2015A08

	// Set mail received flag
	ldr	r1,=0xD27
	bl	0x2024018

@@setFolder:
	// Disable Card Box reordering
	add	r1,=@preventCardBoxReordering
	mov	r0,0x1
	str	r0,[r1]

	// Set current Extra Folder
	mov	r0,((0xF2D8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC
	strb	r7,[r0]

	// Set Extra Folder unlock flag
	cmp	r7,0x0
	beq	@@copyName
	ldr	r1,=(0xF110 - 0x1)
	add	r1,r1,r7
	bl	0x2024018	// set flag

@@copyName:
	// Get pointer to XtraFldr name
	mov	r1,0x2
	bl	0x20151A8

	// Set new name
	mov	r1,0x0
@@nameLoop1:
	cmp	r1,0x12
	bge	@@nameEnd2
	ldrb	r2,[r5,r1]
	cmp	r2,0xE6
	beq	@@nameEnd1
	strb	r2,[r0,r1]
	add	r1,0x1
	sub	r6,0x1
	bgt	@@nameLoop1
@@nameEnd1:
	mov	r2,0xE6		// end
@@nameLoop2:
	cmp	r1,0x12
	bge	@@nameEnd2
	strb	r2,[r0,r1]
	mov	r2,0x00		// fill rest with 0
	add	r1,0x1
	b	@@nameLoop2
@@nameEnd2:
	// No longer need r5, r6

	// Get pointer to Extra Folder favorites
	ldr	r7,=0x2120588
	ldr	r7,[r7]
	ldr	r7,[r7,0xC]
	add	r7,0xFF
	add	r7,((0x102+0xA)-0xFF)	// last favorite

	// Get pointer to Extra Folder cards
	mov	r0,0x2
	bl	0x2007324
	mov	r5,r0
	mov	r6,0x3A		// index of last card

@@cardLoop:
	ldrh	r0,[r5,r6]	// packed card value
	lsl	r2,r0,0x1F
	lsr	r2,r2,0x1F	// favorite
	lsl	r1,r0,0x11
	lsr	r1,r1,0x1A	// card color
	lsl	r0,r0,0x17
	lsr	r0,r0,0x17	// card index

	mov	r2,0x1		// amount
	bl	0x20070AC	// take 1 card

	add	r1,r4,r6
	ldrb	r0,[r1]
	ldrb	r1,[r1,0x1]
	lsl	r1,r1,0x8
	orr	r0,r1		// new card
	lsl	r1,r0,0x11
	lsr	r1,r1,0x11
	strh	r1,[r5,r6]	// store in Extra Folder

	lsr	r2,r0,0xF	// favorite
	lsl	r1,r0,0x11
	lsr	r1,r1,0x1A	// card color
	lsl	r0,r0,0x17
	lsr	r0,r0,0x17	// card index

	cmp	r2,0x0
	beq	@@giveCard
	lsr	r2,r6,0x1
	strh	r2,[r7]
	sub	r7,0x2

@@giveCard:
	mov	r2,0x1		// amount
	bl	0x2006E9C	// give 1 card

	sub	r6,0x2
	bpl	@@cardLoop

	// Get equipped folder
	bl	0x2007308
	cmp	r1,0x2
	bne	@@end

	// Update Favorites
	mov	r0,r1
	bl	0x200746C

@@end:
	// Re-enable Card Box reordering
	add	r1,=@preventCardBoxReordering
	mov	r0,0x0
	str	r0,[r1]
	pop	r4-r7,r15


.align 2
common_moveCardToTopOfCardBox:
	push	r14
	ldr	r2,[@preventCardBoxReordering]
	cmp	r2,0x0
	bne	@@end

	bl	0x2007110

@@end:
	pop	r15

.align 4
@preventCardBoxReordering:
	.dw	0x0


.align 2
common_textCallEnableTextSkip:
	push	r14

	mov	r1,0x10		// Skip disabled flag

	tst	r0,r0
	beq	@@disable

	mov	r0,r4
	bl	0x201E604	// Clear script flags
	b	@@end

@@disable:
	mov	r0,r4
	bl	0x201E5FC	// Set script flags

@@end:
	pop	r15


.align 2
common_textCallStartBattle:
	push	r14

	// Get battle pointer
	bl	0x20079EC
	mov	r1,r0

	// Start battle
	ldr	r0,=0x211CCB0
	ldr	r0,[r0]
	bl	0x2015068

	pop	r15


.align 2
common_textCallScreenShake:
	push	r0,r14

	// Get length
	ldr	r1,[r4,0x10]
	add	r1,0x4
	bl	0x201E6B8

	// Do screen shake
	pop	r1
	mov	r2,r0
	ldr	r0,=0x21AC7F8
	bl	0x21682D4

	// Advance message pointer
	mov	r0,r4
	mov	r1,(0x6-0x4)
	bl	0x201E6C8

	pop	r15


.align 2
common_textCallSetPlayerSatellite:
	push	r14

	// Set the Satellite
	ldr	r1,=(0x2130BDC+0x573)
	strb	r0,[r1]

@@end:
	pop	r15


.align 2
common_refreshTopScreen:
	push	r14

	// Do refresh
	ldr	r0,=0x2120928
	ldr	r0,[r0]

	ldr	r1,=0x211CCB0
	ldr	r1,[r1]
	ldr	r1,[r1,0x14]
	bl	0x202D0EC

	ldr	r0,[r0,0x1C]
	bl	0x2022500

	pop	r15


.align 2
common_getPlayerSatellite:
	push	r1,r2,r14
	mov	r1,0x0
	bl	0x200BDC8
	sub	r0,0x1
	pop	r1,r2,r15


.align 2
common_checkGameVersion:
	push	r14

	// Actually check player Satellite
	bl	common_getPlayerSatellite
	ldr	r1,[r4,10h]
	add	r1,2h
	add	r1,r1,r0

	pop	r15


.align 2
common_isWhiteCardID:
	cmp	r0,0xE8		// Aqua+50
	beq	@@end
	cmp	r0,0xED		// Fire+50
	beq	@@end
	cmp	r0,0xF2		// Wood+50
	beq	@@end
	cmp	r0,0x8B		// Invisible
	beq	@@end
	cmp	r0,0xA9		// QuickGauge
	beq	@@end
	cmp	r0,0xAA		// SlowGauge
	beq	@@end
	cmp	r0,0x90		// GrassStage ...
	blt	@@false
	cmp	r0,0x96		// ... Attack+10
	ble	@@end

@@false:
	mov	r0,0x0
@@end:
	tst	r0,r0
	bx	r14

.align 2
common_setSpecialBrother:
	// r5 = special Brother type
	// r6 = Brother ID
	cmp	r5,0x80
	beq	@@copyBrother
	bgt	@@specialBrother

@@normal:
	mov	r0,0x82
	lsl	r0,r0,0x8
	bx	r14

@@copyBrother:
	// Get own Brother data
	mov	r1,0x0
	bl	0x200C93C

	// Copy own Brother data
	mov	r1,r0
	mov	r2,r4		// destination
	mov	r3,(0x790 >> 0x4)
	lsl	r3,r3,0x4
	bl	0x202E010

	// Remove SP boss records
	mov	r0,(0x6A8 >> 0x3)
	lsl	r0,r0,0x3
	add	r0,r4,r0
	mov	r1,0x0
	mvn	r1,r1
	mov	r2,(14)
@@deleteRecordsLoop:
	stmia	[r0]!,r1
	sub	r2,0x1
	bne	@@deleteRecordsLoop

	// Check if player is LV 100
	mov	r1,0x0
	bl	0x200CF9C
	cmp	r0,(100)
	bge	@@getCopyBrotherStats

	// Make face pic grayscale
	mov	r0,r4
	bl	common_makePaletteGrayscale

@@getCopyBrotherStats:
	// Get Brother stats
	bl	common_getPlayerSatellite
	add	r1,r0,0x1
	ldr	r0,=0x211F658
	ldr	r0,[r0]
	bl	0x2022620	// get Brother stats

	b	@@setStats

@@specialBrother:
	// Load field_local_09 + special brother ID
	mov	r2,0x24		// field_local
	lsl	r2,r2,0x10
	mov	r0,r5
	sub	r0,(0x81-0x9)	// field_local_09...
	add	r2,r2,r0
	mov	r1,r4
	ldr	r0,=0x211C998
	bl	0x201231C	// load file

	// Load game log
	mov	r0,r6
	bl	common_boktaiBrotherLoadGameLog

	// Get Brother stats
	ldr	r0,=0x211F658
	ldr	r0,[r0]
	mov	r1,0x80		// Lunar Knights Brother stats
	bl	0x2022610	// get Brother stats

@@setStats:
	// Update Brother stats
	mov	r1,r0
	mov	r2,r4
	bl	0x20226C0	// apply Brother stats

	// Clear "don't update HP" flag
	ldr	r1,=0xD37
	bl	0x202405C

	// Update HP
	bl	0x2007D48

	// Set Brother Card
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1,0x10]
	sub	r0,r6,0x1
	lsl	r0,r0,0x2
	add	r1,r1,r0
	ldr	r0,=(0x90F)
	add	r0,r0,r6	// Brother Card ID
	strh	r0,[r1]
	mov	r0,0x1
	strh	r0,[r1,0x2]

	// Update Brother face pics
	bl	0x2032F74

	// Buffer Brother index
	mov	r0,0x1		// buffer 1
	mov	r1,r6
	bl	0x2008DF0

	// Return
	bl	0x200D1F2


common_makePaletteGrayscale:
	push	r4-r5,r14
	mov	r4,r0		// palette
	mov	r5,0x4		// color index
	// Skip first two colors (transparent and bordere)

@@loop:
	ldrh	r2,[r4,r5]	// old color

	// Compute R
	lsl	r3,r2,0x1B
	lsr	r3,r3,0x1B	// R
	ldr	r1,=0x2781AF4	// round(0.299 * 0xFFFFFFFF / 31)
	mul	r3,r1

	// Compute G
	lsr	r2,r2,0x5
	lsl	r0,r2,0x1B
	lsr	r0,r0,0x1B	// G
	ldr	r1,=0x4D8F4B4	// round(0.587 * 0xFFFFFFFF / 31)
	mul	r0,r1
	add	r3,r3,r0

	// Compute B
	lsr	r2,r2,0x5
	lsl	r0,r2,0x1B
	lsr	r0,r0,0x1B	// B
	ldr	r1,=0xF100DC	// round(0.114 * 0xFFFFFFFF / 31)
	mul	r0,r1
	add	r3,r3,r0

	// Set color
	lsr	r3,r3,0x1B
	lsl	r0,r3,0x5
	lsl	r1,r3,0xA
	add	r3,r3,r0
	add	r3,r3,r1
	strh	r3,[r4,r5]	// new color

	add	r5,0x2
	cmp	r5,0x20
	blt	@@loop

	pop	r4-r5,r15


	.pool


.align 2
common_getLibraryIcon:
	ldrb	r6,[r4,r3]
	cmp	r6,0x3
	bne	@@end
	mov	r6,0xFF
@@end:
	cmp	r6,0xFF
	bx	r14


.align 2
common_drawLibraryIcon:
	ldr	r2,=0x40004000
	orr	r2,r5
	bx	r14


.align 2
common_cardFrame:
	push	r14

	cmp	r0,0x0
	beq	@@checkNone

	bl	common_isWhiteCardID
	beq	@@checkNone

	mov	r1,0x0		// White frame

@@checkNone:
	cmp	r1,0xFF
	bne	@@end
	mov	r1,0x4

@@end:
	pop	r15


.align 2
filterHeapAlloc:
	push	r3,r14
	mov	r3,0x4
	bl	filterHeapAllocEx
	pop	r3,r15
filterHeapAllocEx:
	push	r3-r7,r14
	bl	common_checkHeapCorruption
	mov	r5,r0
	lsl	r4,r1,0x2
	mov	r6,r2
	mov	r7,r3
	ldr	r0,[r5,r4]
	blx	0x207BFC0	// get heap size before
	push	r0
	ldr	r0,[r5,r4]
	mov	r1,r6
	mov	r2,r7
	blx	0x207BDF4	// allocate on heap
	push	r0
	ldr	r0,[r5,r4]
	blx	0x207BFC0	// get heap size after
	pop	r1-r2
	// r0 = after, r1 = addr, r2 = before
	lsr	r3,r4,0x2
	cmp	r3,0x1
	bne	@@end

	.msg	"alloc heap=%r3% size=%r6% align=%r7% : addr=%r1% : %r2% -> %r0%"
@@end:
	cmp	r2,0x0
	beq	.
	mov	r0,r1
	beq	.
	bl	common_checkHeapCorruption
	pop	r3-r7,r15
filterHeapFree:
	push	r4-r7,r14
	bl	common_checkHeapCorruption
	mov	r5,r0
	lsl	r4,r1,0x2
	mov	r6,r2
	beq	@@skipFree

	ldr	r0,[r5,r4]
	blx	0x207BFC0	// get heap size before
	mov	r7,r0
	ldr	r0,[r5,r4]
	mov	r1,r6
	blx	0x207BF84	// free from heap
	ldr	r0,[r5,r4]
	blx	0x207BFC0	// get heap size after
	// r0 = after, r6 = addr, r7 = before
	lsr	r1,r4,0x2
	cmp	r1,0x1
	bne	@@end

	.msg	"free heap=%r1% addr=%r6% : %r7% -> %r0%"
@@end:
	cmp	r7,0x0		// size before
	beq	.
	cmp	r0,0x0		// size after
	beq	.
@@skipFree:
	bl	common_checkHeapCorruption
	pop	r4-r7,r15


.align 2
common_checkHeapCorruption:	
	push	r0-r7,r14
	// r4 = heap start
	// r5 = heap end
	// r6 = heap
	// r7 = heap index
	mov	r7,0x0		// heap index

@@heapLoop:
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	lsl	r1,r7,0x2
	ldr	r6,[r0,r1]	// heap

	ldr	r0,[r6]
	ldr	r1,=0x45585048
	cmp	r0,r1
	bne	.		// signature invalid

	mov	r4,r6
	add	r4,0x38		// heap start

	ldr	r0,[r6,0x18]	// heap start
	cmp	r4,r0
	bne	.		// heap start invalid

	ldr	r0,=0x20FB024
	lsl	r1,r7,0x2
	ldr	r0,[r0,r1]	// heap size
	add	r5,r6,r0	// heap end

	ldr	r0,[r6,0x1C]	// heap end
	cmp	r5,r0
	bne	.		// heap end invalid

/*// / *
	ldr	r2,=0x5544	// DU
	ldr	r3,=0x4652	// RF
@@blockLoop:
	cmp	r4,r5
	bgt	.		// past end of heap
	beq	@@checkLists

	ldrh	r0,[r4]
	cmp	r0,r2
	beq	@@blockNext
	cmp	r0,r3
	bne	.		// not DU or RF

@@blockNext:
	ldr	r0,[r4,0x4]	// block size
	add	r4,0x10
	add	r4,r4,r0
	b	@@blockLoop
// * /*/

@@checkLists:
/*// / *
	ldr	r4,[r6,0x18]	// heap start

	ldr	r0,[r6,0x24]	// free list head
	cmp	r0,r4
	blt	.		// free list head out of range
	cmp	r0,r5
	bgt	.		// free list head out of range
	ldr	r0,[r6,0x28]	// free list tail
	cmp	r0,r4
	blt	.		// free list tail out of range
	cmp	r0,r5
	bgt	.		// free list tail out of range

	ldr	r0,[r6,0x2C]	// used list head
	cmp	r0,0x0
	bne	@@checkUsedListHeadTail
	ldr	r0,[r6,0x30]	// used list tail
	cmp	r0,0x0
	bne	.		// used list = 0 but tail != 0
	b	@@checkFree

@@checkUsedListHeadTail:
	cmp	r0,r4
	blt	.		// used list head out of range
	cmp	r0,r5
	bgt	.		// used list head out of range
	ldr	r0,[r6,0x30]	// used list tail
	cmp	r0,r4
	blt	.		// used list tail out of range
	cmp	r0,r5
	bgt	.		// used list tail out of range

@@checkFree:
	ldr	r3,[r6,0x24]	// current free block
	cmp	r3,0x0
	beq	@@checkUsed
@@freeLoop:
	ldrh	r0,[r3]
	ldr	r1,=0x4652	// RF
	cmp	r0,r1
	bne	.		// not RF

	ldr	r0,[r3,0x8]	// prev
	cmp	r0,0x0
	bne	@@freePrevRange
	ldr	r0,[r6,0x24]	// free block head
	cmp	r0,r3
	bne	.		// no prev but not head

	b	@@freeBlockNext

@@freePrevRange:
	ldr	r0,[r3,0x8]	// prev
	cmp	r0,r4
	blt	.		// prev out of range
	cmp	r0,r5
	bgt	.		// prev out of range
	ldr	r0,[r0,0xC]	// prev's next
	cmp	r0,r3
	bne	.

@@freeBlockNext:
	ldr	r0,[r3,0xC]	// next
	cmp	r0,0x0
	bne	@@freeNextRange
	ldr	r0,[r6,0x28]	// free block tail
	cmp	r0,r3
	bne	.		// no next but not tail

	// End of list reached
	b	@@checkUsed

@@freeNextRange:
	ldr	r0,[r3,0xC]	// next
	cmp	r0,r4
	blt	.		// next out of range
	cmp	r0,r5
	bgt	.		// next out of range
	ldr	r0,[r0,0x8]	// next's prev
	cmp	r0,r3
	bne	.

@@freeNext:
	ldr	r3,[r3,0xC]	// next
	b	@@freeLoop

@@checkUsed:
	ldr	r3,[r6,0x2C]	// current used block
	cmp	r3,0x0
	beq	@@heapNext
@@usedLoop:
	ldrh	r0,[r3]
	ldr	r1,=0x5544	// DU
	cmp	r0,r1
	bne	.		// not DU

	ldr	r0,[r3,0x8]	// prev
	cmp	r0,0x0
	bne	@@usedPrevRange
	ldr	r0,[r6,0x2C]	// used block head
	cmp	r0,r3
	bne	.		// no prev but not head

	b	@@usedBlockNext

@@usedPrevRange:
	ldr	r0,[r3,0x8]	// prev
	cmp	r0,r4
	blt	.		// prev out of range
	cmp	r0,r5
	bgt	.		// prev out of range
	ldr	r0,[r0,0xC]	// prev's next
	cmp	r0,r3
	bne	.

@@usedBlockNext:
	ldr	r0,[r3,0xC]	// next
	cmp	r0,0x0
	bne	@@usedNextRange
	ldr	r0,[r6,0x30]	// used block tail
	cmp	r0,r3
	bne	.		// no next but not tail

	// End of list reached
	b	@@heapNext

@@usedNextRange:
	ldr	r0,[r3,0xC]	// next
	cmp	r0,r4
	blt	.		// next out of range
	cmp	r0,r5
	bgt	.		// next out of range
	ldr	r0,[r0,0x8]	// next's prev
	cmp	r0,r3
	bne	.

@@usedNext:
	ldr	r3,[r3,0xC]	// next
	b	@@usedLoop

@@heapNext:
	add	r7,0x1
	cmp	r7,0x4
	bge	@@end
	b	@@heapLoop
// * /*/

@@end:
	pop	r0-r7,r15


	.pool


.align 2
filterFileIdMsg:
//	.msg	"load %r1%"
filterFileId:
	push	r0,r2,r3,r14

	bl	common_getPlayerSatellite
	mov	r3,r0			// r3 = Brother Satellite

	lsr	r0,r1,0x10		// r0 = file index
	lsl	r2,r1,0x10
	lsr	r2,r2,0x10		// r2 = subfile index
	cmp	r0,0x7
	beq	@@filterSubscreen
	cmp	r0,0xA
	beq	@@filterSubscreenRecord
	cmp	r0,0x18
	beq	@@filterCapcomLogo
	cmp	r0,0x1F
	beq	@@filterSubscreenLocal
	b	@@end

@@filterSubscreen:
	cmp	r2,0x0
	beq	@@filterSubscreenTranserBackgroundTileset
	cmp	r2,0x1
	beq	@@filterSubscreenTranserBackgroundTilemap
	cmp	r2,0x2
	beq	@@filterSubscreenTranserBackgroundPalette
	cmp	r2,0x3
	beq	@@filterSubscreenTranserAdminIcon
	cmp	r2,0x4
	beq	@@filterSubscreenTranserAdminPalette
	cmp	r2,0x5
	beq	@@filterSubscreenTranserAdminTilemap1
	cmp	r2,0x6
	beq	@@filterSubscreenTranserAdminTilemap2
	cmp	r2,0x7
	beq	@@filterSubscreenTranserAdminTilemap3
	cmp	r2,0x8
	beq	@@filterSubscreenTranserAdminTilemap4
	cmp	r2,0x9
	beq	@@filterSubscreenTranserAdminTilemap5
	cmp	r2,0xA
	beq	@@filterSubscreenTranserAdminTilemap6
	cmp	r2,0xC
	beq	@@filterSubscreenPersonalGeoPalette
	cmp	r2,0xE
	beq	@@filterSubscreenPersonalTileset
	cmp	r2,0x10
	beq	@@filterSubscreenPersonalPalette
	cmp	r2,0x12
	beq	@@filterSubscreenPersonalMegaManPalette
	cmp	r2,0x14
	beq	@@filterSubscreenBrotherAdminSprite
	cmp	r2,0x15
	beq	@@filterSubscreenBrotherButtons1
	cmp	r2,0x16
	beq	@@filterSubscreenBrotherButtons2
	cmp	r2,0x17
	beq	@@filterSubscreenBrotherBackgroundTileset
	cmp	r2,0x19
	beq	@@filterSubscreenBrotherBackgroundPalette
	cmp	r2,0x1B
	beq	@@filterSubscreenMegaBackgroundTileset
	cmp	r2,0x1C
	beq	@@filterSubscreenMegaBackgroundTilemap
	cmp	r2,0x1D
	beq	@@filterSubscreenMegaBackgroundPalette
	cmp	r2,0x1E
	beq	@@filterSubscreenMegaTranserSystemTileset
	cmp	r2,0x20
	beq	@@filterSubscreenMegaTranserSystemPalette
	b	@@end
@@filterSubscreenTranserBackgroundTileset:
	add	r3,0xC2			// subscreen_194+
	b	@@doFilter
@@filterSubscreenTranserBackgroundTilemap:
	add	r3,0xBF			// subscreen_191+
	b	@@doFilter
@@filterSubscreenTranserBackgroundPalette:
	add	r3,0xBC			// subscreen_188+
	b	@@doFilter
@@filterSubscreenTranserAdminIcon:
	add	r3,0xB9			// subscreen_185+
	b	@@doFilter
@@filterSubscreenTranserAdminPalette:
	add	r3,0xB6			// subscreen_182+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap1:
	add	r3,0xC5			// subscreen_197+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap2:
	add	r3,0xC8			// subscreen_200+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap3:
	add	r3,0xCB			// subscreen_203+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap4:
	add	r3,0xCE			// subscreen_206+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap5:
	add	r3,0xD1			// subscreen_209+
	b	@@doFilter
@@filterSubscreenTranserAdminTilemap6:
	add	r3,0xD4			// subscreen_212+
	b	@@doFilter
@@filterSubscreenPersonalGeoPalette:
	add	r3,0xB0			// subscreen_176+
	b	@@doFilter
@@filterSubscreenPersonalTileset:
	add	r3,0xAA			// subscreen_170+
	b	@@doFilter
@@filterSubscreenPersonalPalette:
	add	r3,0xAD			// subscreen_173+
	b	@@doFilter
@@filterSubscreenPersonalMegaManPalette:
	add	r3,0xB3			// subscreen_179+
	b	@@doFilter
@@filterSubscreenBrotherAdminSprite:
	add	r3,0xEF			// subscreen_239+
	b	@@doFilter
@@filterSubscreenBrotherButtons1:
	add	r3,0xE3			// subscreen_227+
	b	@@doFilter
@@filterSubscreenBrotherButtons2:
	add	r3,0xE6			// subscreen_230+
	b	@@doFilter
@@filterSubscreenBrotherBackgroundTileset:
	add	r3,0xE9			// subscreen_233+
	b	@@doFilter
@@filterSubscreenBrotherBackgroundPalette:
	add	r3,0xEC			// subscreen_236+
	b	@@doFilter
@@filterSubscreenMegaBackgroundTileset:
	add	r3,0xD7			// subscreen_215+
	b	@@doFilter
@@filterSubscreenMegaBackgroundTilemap:
	mov	r3,r2
	push	r0
	bl	common_isMegaPresent
	pop	r0
	bne	@@filterSubscreenMegaBackgroundTilemapEnd
	mov	r3,0xF3			// subscreen_243
@@filterSubscreenMegaBackgroundTilemapEnd:
	b	@@doFilter
@@filterSubscreenMegaBackgroundPalette:
	add	r3,0xDA			// subscreen_218+
	b	@@doFilter
@@filterSubscreenMegaTranserSystemTileset:
	add	r3,0xDD			// subscreen_221+
	b	@@doFilter
@@filterSubscreenMegaTranserSystemPalette:
	add	r3,0xE0			// subscreen_224+
	b	@@doFilter

@@filterSubscreenRecord:
	cmp	r2,0x5
	beq	@@filterSubscreenRecordPalette
	b	@@end
@@filterSubscreenRecordPalette:
	add	r3,0x7			// subscreen_record_7+
	b	@@doFilter

@@filterCapcomLogo:
	cmp	r2,0x3
	beq	@@filterCapcomLogoGameOverTileset
	cmp	r2,0x4
	beq	@@filterCapcomLogoGameOverPalette
	cmp	r2,0x5
	beq	@@filterCapcomLogoGameOverTilemap
	b	@@end

@@filterCapcomLogoGameOverTileset:
	add	r3,(102)		// capcomlogo_102+
	b	@@doFilter
@@filterCapcomLogoGameOverPalette:
	add	r3,(105)		// capcomlogo_105+
	b	@@doFilter
@@filterCapcomLogoGameOverTilemap:
	add	r3,(108)		// capcomlogo_108+
	b	@@doFilter

@@filterSubscreenLocal:
	cmp	r2,0x0
	beq	@@filterSubscreenLocalBrotherExitTileset
	cmp	r2,0x4
	beq	@@filterSubscreenLocalPersonalLevelTileset
	cmp	r2,0x6
	beq	@@filterSubscreenLocalPersonalExitTileset
	cmp	r2,0x8
	beq	@@filterSubscreenLocalPersonalHPTileset
	cmp	r2,0xA
	beq	@@filterSubscreenLocalPersonalFavoriteTileset
	cmp	r2,0xC
	beq	@@filterSubscreenLocalTranserEquip1Tileset
	cmp	r2,0xE
	beq	@@filterSubscreenLocalTranserEquip2Tileset
	cmp	r2,0x10
	beq	@@filterSubscreenLocalTranserEquip3Tileset
	cmp	r2,0x12
	beq	@@filterSubscreenLocalTranserHPTileset
	cmp	r2,0x14
	beq	@@filterSubscreenLocalTranserZennyTileset
	cmp	r2,0x16
	beq	@@filterSubscreenLocalTranserButtons
	cmp	r2,0x17
	beq	@@filterSubscreenLocalMegaAbilityTileset
	cmp	r2,0x19
	beq	@@filterSubscreenLocalMegaExitTileset
	cmp	r2,0x1B
	beq	@@filterSubscreenLocalMegaMegaManTileset
	cmp	r2,0x1D
	beq	@@filterSubscreenLocalMegaWeaponTileset
	cmp	r2,0x1F
	beq	@@filterSubscreenLocalMegaTileset
	b	@@end
@@filterSubscreenLocalBrotherExitTileset:
	add	r3,0xB8			// subscreen_local_184+
	b	@@doFilter
@@filterSubscreenLocalPersonalLevelTileset:
	add	r3,0x8B			// subscreen_local_139+
	b	@@doFilter
@@filterSubscreenLocalPersonalExitTileset:
	add	r3,0x8E			// subscreen_local_142+
	b	@@doFilter
@@filterSubscreenLocalPersonalHPTileset:
	add	r3,0x91			// subscreen_local_145+
	b	@@doFilter
@@filterSubscreenLocalPersonalFavoriteTileset:
	add	r3,0x94			// subscreen_local_148+
	b	@@doFilter
@@filterSubscreenLocalTranserEquip1Tileset:
	add	r3,0x97			// subscreen_local_151+
	b	@@doFilter
@@filterSubscreenLocalTranserEquip2Tileset:
	add	r3,0x9A			// subscreen_local_154+
	b	@@doFilter
@@filterSubscreenLocalTranserEquip3Tileset:
	add	r3,0x9D			// subscreen_local_157+
	b	@@doFilter
@@filterSubscreenLocalTranserHPTileset:
	add	r3,0xA0			// subscreen_local_160+
	b	@@doFilter
@@filterSubscreenLocalTranserZennyTileset:
	add	r3,0xA3			// subscreen_local_163+
	b	@@doFilter
@@filterSubscreenLocalTranserButtons:
	add	r3,0xA6			// subscreen_local_166+
	b	@@doFilter
@@filterSubscreenLocalMegaAbilityTileset:
	add	r3,0xA9			// subscreen_local_169+
	b	@@doFilter
@@filterSubscreenLocalMegaExitTileset:
	add	r3,0xAC			// subscreen_local_172+
	b	@@doFilter
@@filterSubscreenLocalMegaMegaManTileset:
	add	r3,0xAF			// subscreen_local_175+
	b	@@doFilter
@@filterSubscreenLocalMegaWeaponTileset:
	add	r3,0xB2			// subscreen_local_178+
	b	@@doFilter
@@filterSubscreenLocalMegaTileset:
	add	r3,0xB5			// subscreen_local_181+
	b	@@doFilter

@@doFilter:
	// overrides subfile with r3
	lsl	r1,r0,0x10
	add	r1,r1,r3

@@end:
	pop	r0,r2,r3,r15

filterFileIdR2:
	push	r1,r14
	mov	r1,r2
	bl	filterFileId
	mov	r2,r1
	pop	r1,r15



filterFileFunc1228C:
	add	sp,-0x48
	mov	r5,r0
	b	filterFileId

filterFileFunc122F8:
filterFileFunc1251A: // same signature
	push	r14
	mov	r5,r0
	bl	filterFileId
	mov	r4,r1
	pop	r15

filterFileFunc1231C:
	push	r1,r14
	mov	r1,r2
	bl	filterFileId
	mov	r6,r1
	pop	r4,r15

filterFileFunc12354:
	add	sp,-0x50
	mov	r5,r0
	b	filterFileIdR2

filterFileFunc1240C:
	add	sp,-0x8
	push	r14
	bl	filterFileIdR2
	mov	r4,r2
	pop	r15

filterFileFunc12448:
	add	sp,-0x60
	mov	r5,r0
	b	filterFileId

filterFileFunc12544:
	add	sp,-0x8
	mov	r6,r0
	b	filterFileId


common_isMegaPresent:
	push	r1-r3,r14

	// Check flag
	ldr	r1,=0xF129
	bl	0x202409C
	cmp	r0,0x0
	bne	@@returnFalse

@@returnTrue:
	mov	r0,0x1
	b	@@end
@@returnFalse:
	mov	r0,0x0
@@end:
	pop	r1-r3,r15


	.pool


common_elemSearchGet:
	// Returns the current searched element in r0
	// 0 = None
	// 1 = Fire
	// 2 = Aqua
	// 3 = Elec
	// 4 = Wood
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,0xFC
	ldrh	r0,[r1,0x6]	// duration
	cmp	r0,0x0
	ble	@@end
	ldrb	r0,[r1,0xA]	// element

@@end:
	bx	r14


fieldElemSearchSet:
	// Sets searched element
	// r0 = frame count
	// r1 = element
	ldr	r2,=0x2120588
	ldr	r2,[r2]
	ldr	r2,[r2]
	add	r2,0xFC
	strh	r0,[r2,0x6]	// duration
	strb	r1,[r2,0xA]	// element

	bx	r14


common_fakeItemCounts:
@@checkPropellerCard:
	// Link Propeller Card to RC Chopper
	cmp	r0,0x52		// Propeller Card
	bne	@@checkLegendProof
	mov	r0,0xA		// RC Chopper

@@checkLegendProof:
	cmp	r0,0x53		// Legend Proof
	beq	@@return1

@@checkStarFrag:
	cmp	r0,0x56
	bne	@@checkPowerUpData
	push	r1-r3
	bl	common_getStarFrags
	pop	r1-r3
	cmp	r0,0x0
	beq	@@return0
	b	@@return1

@@checkPowerUpData:
	cmp	r0,(90)		// Power Up Data
	bne	@@checkCount
	push	r0-r3
	ldr	r1,=0xF12A	// got Power Up Data from Famous
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	beq	@@return0
	b	@@return1

@@checkCount:
	ldrb	r0,[r1,r0]
	b	@@end

@@return0:
	mov	r0,0x0
	b	@@end
@@return1:
	mov	r0,0x1
@@end:
	pop	r15


common_pulseOutExpireCloaker:
	// from 020243AE
	push	r14

	// Get current area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]

	// Only expire Cloaker if moving to a Real World area
	cmp	r0,0x80
	bge	@@end

	// Expire Cloaker
	bl	0x2007E84

@@end:
	pop	r15


.align 2
common_subcardExpireMessage:
	// from 020233EE
	// r4 = data pointer
	push	r14

	// Check if ongoing script
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

	// Get expire flags
	ldr	r2,=0x2120588
	ldr	r2,[r2]
	ldr	r2,[r2]
	add	r2,0xFC
	ldrb	r1,[r2,0xB]

@@checkCloaker:
	lsr	r0,r1,0x1
	bcc	@@checkSearchEye

	// Remove flag
	sub	r1,0x1
	strb	r1,[r2,0xB]

	mov	r1,(100)	// itemId = 100
	b	@@bufferItem

@@checkSearchEye:
	lsr	r0,r1,0x3
	bcc	@@checkElemSearch

	// Remove flag
	sub	r1,0x4
	strb	r1,[r2,0xB]

	mov	r1,(101)	// itemId = 101
	b	@@bufferItem

@@checkElemSearch:
	lsr	r0,r1,0x2
	bcc	@@end

	// Remove flag
	sub	r1,0x2
	strb	r1,[r2,0xB]

	ldrb	r1,[r2,0xA]	// last element
	add	r1,0x5B		// itemId = 92 + (element - 1)

@@bufferItem:
	// Buffer item ID
	mov	r0,0x0		// buffer 0
	bl	0x2008DF0

	mov	r3,(40)		// script 40

	// Get item count
	mov	r0,r1
	bl	0x2007BB8
	cmp	r0,0x0
	ble	@@bufferItemCount

	mov	r3,(41)		// script 41

@@bufferItemCount:
	// Buffer item count
	mov	r1,r0
	mov	r0,0x1		// buffer 1
	bl	0x2008DF0

@@startScript:
	// Start script
	ldr	r0,=0x21AC1D8
	mov	r1,0x2
	ldr	r2,=script_subcardExpired
	bl	0x21647E4

@@end:
	mov	r0,r4
	bl	0x2023C70

	pop	r15


.align 2
common_subcardExpirePost:
	push	r4,r5,r14

	ldr	r0,=0x211CD78
	ldr	r0,[r0]
	ldr	r4,[r0,0x4]

	// Check if end reached
	bl	0x2008D9C
	cmp	r0,0x0
	beq	@@returnFalse

	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@choseNo

	// Check confirm
	mov	r0,0x2
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	bne	@@returnTrue

	// Get last choice
	bl	0x2008DC0
	cmp	r0,0x0
	bne	@@choseNo

@@choseYes:
	// Get the item ID
	mov	r0,0x0
	bl	0x2009170
	mov	r5,r0

	// Reduce Sub Card count by 1
	// r0 = itemId
	bl	0x2007BAC

	// SearchEye/ElemSearch duration = 2000 (from 768)
	mov	r0,0x7D
	lsl	r0,r0,0x4

	cmp	r5,0x5C
	blt	@@doScriptGeneric
	cmp	r5,0x5F
	ble	@@doElemSearch
	cmp	r5,0x64
	beq	@@doCloaker
	cmp	r5,0x65
	beq	@@doSearchEye
	b	@@doScriptGeneric

@@doCloaker:
	// Set Cloaker duration to 2500 (from 768)
	ldr	r0,=(2500)
	bl	0x2007E48

	mov	r1,(42)		// script 42
	b	@@doScript

@@doSearchEye:
	// Set SearchEye duration (in r0)
	bl	0x2007EB4

	mov	r1,(43)
	b	@@doScript

@@doElemSearch:
	// Set element to search (duration in r0)
	mov	r1,r5
	sub	r1,(92 - 1)	// r1 = 1 + itemId - 92
	bl	fieldElemSearchSet

	mov	r1,r5
	sub	r1,(92 - 44)	// script 44 + element
	b	@@doScript

@@doScriptGeneric:
	mov	r1,(48)		// script 48
@@doScript:
	// Jump to different script (in r1)
	mov	r0,r4
	bl	0x201DD08

	b	@@returnFalse

@@returnTrue:
	// Don't continue with script
	mov	r0,0x1
	b	@@end

@@choseNo:
@@returnFalse:
	// Continue with script
	mov	r0,0x0
@@end:
	pop	r4,r5,r15



common_setLastBattle:
	// Check if SearchEye active
	push	r0-r2,r14
	bl	2007E98h
	cmp	r0,0h
	pop	r0-r2
	bne	@@end

	// Set last battle only if SearchEye not active
	ldr	r0,[r0]
	str	r1,[r0,64h]

@@end:
	pop	r15



common_getBattleCount:
	// r0 = stage
	// r1 = area
	// r2 = searchElem
	// r3 = index to extract
	// returns: r0 = count, r1 = battle
	push	r3-r7,r14
	mov	r7,r2		// r7 = searchElem

	// Get battle set
	bl	2006ADCh
	mov	r5,r0		// r5 = battle

	// Get filter level
	bl	2007E2Ch
	cmp	r0,1h
	bne	@@noCloaker

	// Get base HP
	ldr	r0,=213110Ch
	ldrh	r0,[r0,22h]
	// Divide by 10
	mov	r1,0Ah
	blx	20AED80h
	mov	r6,r0		// r6 = level
	b	@@count

@@noCloaker:
	mov	r6,0h		// r6 = level

@@count:
	mov	r4,0h		// r4 = count
	ldr	r3,[sp]		// r3 = extract index
	str	r4,[sp]		// set battle to NULL
	b	@@count_bound

@@count_loop:
	// Check element filter
	mov	r0,r5
	mov	r1,r7
	bl	battleContainsElem
	cmp	r0,0h
	beq	@@count_next

	// Check level filter
	ldrb	r0,[r5,8h]
	add	r0,0Bh
	cmp	r6,r0
	bge	@@count_next

	// Check if this is the battle to extract
	cmp	r4,r3
	bne	@@count_inc

	// Extract this battle
	str	r5,[sp]

@@count_inc:
	// Increment battle count
	add	r4,1h

@@count_next:
	add	r5,10h

@@count_bound:
	ldr	r0,[r5,0Ch]
	cmp	r0,0h
	bne	@@count_loop

	// Return count and extracted battle
	mov	r0,r4
	pop	r1,r4-r7,r15



battleContainsElem:
	// r0 = battle
	// r1 = elem
	push	r3-r5,r14

	cmp	r1,0h
	beq	@@returnTrue

	// Get battle objects
	ldr	r4,[r0,0Ch]
	mov	r5,r1

@@loop:
	// Check if end of objects
	ldrb	r0,[r4]
	cmp	r0,3h
	beq	@@returnFalse
	cmp	r0,1h
	bne	@@inc

	// Get object data
	ldrh	r0,[r4,4h]
	bl	2006A84h
	ldrh	r0,[r0,4h]	// Get object family

	// Check if boss
	ldrh	r1,[r4,4h]
	lsr	r1,r1,8h
	beq	@@checkElem
	add	r0,(data_bossElems - data_virusElems)

@@checkElem:
	add	r1,=data_virusElems
	ldrb	r0,[r1,r0]
	cmp	r0,r5
	bne	@@inc

@@returnTrue:
	mov	r0,1h
	b	@@end

@@inc:
	add	r4,6h
	b	@@loop

@@returnFalse:
	mov	r0,0h
@@end:
	pop	r3-r5,r15

	.pool

data_virusElems:
	db	0, 0, 0, 0, 0, 1, 2, 0, 2, 0, 1, 3, 3, 0, 0, 0
	db	2, 4, 4, 4, 0, 1, 2, 3, 1, 3, 0, 4, 0, 0, 0

data_bossElems:
	db	0, 1, 0, 0, 0, 4, 3, 0, 2, 4, 3, 2, 1, 4


	.pool


.align 2
common_drawCardBorder:
	push	r0,r14

	cmp	r1,0x4
	ble	@@checkStarCard
	mov	r1,0x4
	b	@@end

@@checkStarCard:
	cmp	r1,0x2		// color
	bne	@@end
	mov	r0,(0x16A >> 0x1)
	lsl	r0,r0,0x1
	ldrh	r0,[r4,r0]	// card ID
	cmp	r0,0x0
	beq	@@end
	cmp	r0,(170)
	bgt	@@end

	mov	r1,0x1		// yellow
	bl	common_isWhiteCardID
	beq	@@end
	mov	r1,0x0		// white

@@end:
	pop	r0
	bl	0x2020728
	pop	r15


.align 2
common_drawStarAndExtraIconsOnCardStandalone:
	push	r4-r7,r14
	sub	sp,0x8
	mov	r4,r0

	mov	r0,(0x168 >> 0x2)
	lsl	r0,r0,0x2
	ldrh	r1,[r4,r0]	// card ID

	mov	r6,0x0
	cmp	r1,0x0
	beq	@@end
	cmp	r1,0xF7
	bgt	@@end

	// Check if icons should be drawn
	add	r0,0x6		// 0x16E
	ldrb	r2,[r4,r0]	// primary element
	cmp	r2,0xFF
	beq	@@drawIcons

@@loadCardInfo:
	ldr	r6,=data_extraCardInfo
	lsl	r1,r1,0x1
	add	r1,0x1
	ldrb	r6,[r6,r1]
	lsl	r6,r6,0x1D
	lsr	r6,r6,0x1D

@@drawIcons:
	mov	r5,0x0
	mov	r7,0x20

@@drawIconLoop:
	lsr	r6,r6,0x1
	bcc	@@nextIcon

	mov	r2,0x4
	lsl	r2,r2,0x1C
	mov	r0,(0x164 >> 0x2)
	lsl	r0,r0,0x2
	ldsh	r1,[r4,r0]	// x
	sub	r1,0x24
	add	r1,r1,r5
	lsl	r1,r1,0x17
	lsr	r1,r1,0x7
	orr	r2,r1
	add	r0,0x2
	ldsh	r1,[r4,r0]	// y
	add	r1,0x1C
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	orr	r2,r1

	sub	r0,0xB
	ldrb	r3,[r4,r0]	// palette
	lsl	r3,r3,0xC
	sub	r0,0xF
	ldr	r1,[r4,r0]	// base tile
	lsr	r1,r1,0x6
	add	r1,r1,r7
	orr	r3,r1
	sub	r0,0x8
	ldr	r1,[r4,r0]	// priority
	lsl	r1,r1,0xA
	orr	r3,r1

	add	r0,0x3E
	ldrb	r1,[r4,r0]	// screen
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	ldr	r0,=0x211CDC0
	bl	0x1FF8F40

	add	r5,0xC

@@nextIcon:
	add	r7,0x2
	cmp	r6,0x0
	bne	@@drawIconLoop

@@drawStar:
	mov	r0,(0x168 >> 0x2)
	lsl	r0,r0,0x2
	ldrh	r1,[r4,r0]	// card ID
	cmp	r1,(170)
	bgt	@@end

	add	r0,0x5		// 0x16D
	ldrb	r1,[r4,r0]	// color
	cmp	r1,0x2
	beq	@@checkOpened
	cmp	r1,0x6
	bne	@@end

@@checkOpened:
	add	r0,0x4		// 0x171
	ldrh	r1,[r4,r0]	// card fully opened
	cmp	r1,0x0
	bne	@@end

	// Draw star
	mov	r2,0x4
	lsl	r2,r2,0x1C
	sub	r0,0xD
	ldsh	r1,[r4,r0]	// x
	add	r1,0x9
	lsl	r1,r1,0x17
	lsr	r1,r1,0x7
	orr	r2,r1
	add	r0,0x2
	ldsh	r1,[r4,r0]	// y
	add	r1,0x7
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	orr	r2,r1

	sub	r0,0xB
	ldrb	r3,[r4,r0]	// palette
	lsl	r3,r3,0xC
	sub	r0,0xF
	ldr	r1,[r4,r0]	// base tile
	lsr	r1,r1,0x6
	add	r1,0x1E
	orr	r3,r1
	sub	r0,0x8
	ldr	r1,[r4,r0]	// priority
	lsl	r1,r1,0xA
	orr	r3,r1

	add	r0,0x3E
	ldrb	r1,[r4,r0]	// screen
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	ldr	r0,=0x211CDC0
	bl	0x1FF8F40

@@end:
	add	sp,0x8
	pop	r4-r7,r15


.align 2
common_drawStarOnCard:
	push	r14

	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	mov	r0,(0x168 >> 0x2)
	lsl	r0,r0,0x2
	pop	r15

.align 2
common_drawStarOnCardTradeBefore:
	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	mov	r5,0x0
	bl	0x2026592

.align 2
common_drawStarOnCardTradeAfter:
	mov	r0,r4
	bl	common_drawStarAndExtraIconsOnCardStandalone

	mov	r5,0x0
	bl	0x2026E5A


.align 2
common_tradeDescription:
	// Check if there is a description override
	lsl	r4,r1,0x10
	lsr	r4,r4,0x10	// card ID
	lsr	r7,r1,0x10	// description
	bne	@@end
	mov	r7,r4
@@end:
	str	r0,[sp,0x58]
	bx	r14


.align 2
common_traderDescription1:
	// Check if there is a description override
	mov	r4,r1
	lsr	r6,r4,0x10	// description
	bne	@@end

	// Set description in value
	lsl	r6,r4,0x10
	orr	r4,r6
@@end:
	strh	r4,[r5,r0]	// store card ID
	bx	r14

.align 2
common_traderDescription2:
	lsl	r1,r1,0x8
	lsr	r0,r4,0x10	// description
	cmp	r0,r1
	bx	r14

.align 2
common_traderCardAttack:
	push	r14
	lsr	r0,r0,0x10
	bl	0x2006BE0
	pop	r15

	.pool


.if OPT_RESUME_MUSIC
.include "asm/arm9_bgm.ext.asm"
.endif
.include "asm/overlay_0002_title.ext.asm"
.include "asm/overlay_0003_field.ext.asm"
.include "asm/overlay_0007_battle.ext.asm"
.include "asm/overlay_0010_transform.ext.asm"
.include "asm/overlay_0012_credits.ext.asm"
.include "asm/overlay_0013_postcredits.ext.asm"
.include "asm/overlay_0014_startup.ext.asm"
.include "asm/overlay_0016_save.ext.asm"
.include "asm/overlay_0017_folder.ext.asm"
.include "asm/overlay_0018_navi.ext.asm"
.include "asm/overlay_0019_item.ext.asm"
.include "asm/overlay_0020_records.ext.asm"
.include "asm/overlay_0021_bestcombo.ext.asm"
.include "asm/overlay_0024_library.ext.asm"
.include "asm/overlay_0027_shop.ext.asm"
.include "asm/overlay_0028_face.ext.asm"
.include "asm/overlay_0029_minigame.ext.asm"
.include "asm/object/overlay_0180_object_echoridge.ext.asm"
.include "asm/battle/battleobj_gaugecard.asm"
.include "asm/battle/battleobj_cygnusfeatherhitscan.asm"
.include "asm/battle/overlay_0604_battle_andromeda.ext.asm"
.include "asm/battle/overlay_0608_battle_crownthunder.ext.asm"
.include "asm/battle/overlay_0611_battle_leokingdom.ext.asm"
.include "asm/cutscene/overlay_0660_scene_1000notechallenge.ext.asm"


.align 2
common_cipherBoktai:
	// from 02023C94
	// r4 = Brother ID and mail present
	// r5 = today's date
	// r6 = events to add
	// sp+0x0 = script 1
	// sp+0x4 = script 2
	// sp+0x8 = script 3
	// sp+0xC = level before
	mov	r1,0x2
	push	r0-r2,r4-r7,r14
	sub	sp,0x14		// allocate RTCDate struct and some more

	// Get and clear Brother ID and mail present
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer to Boktai Brother ID for mail
	ldrb	r4,[r0]
	mov	r1,0x0
	strb	r1,[r0]

	// Check if this is a Boktai mail
	cmp	r4,0x0
	bne	@@boktai

@@normal:
	mov	r3,(78)
	b	@@end

@@boktai:
	// Get today's date
	mov	r5,0x0		// date = null
	mov	r1,sp
	bl	0x2010508	// get date
	cmp	r0,0x0		// success
	beq	@@postGetDate

	// Convert date to u32
	ldr	r5,[sp]		// year
	ldr	r0,[sp,0x4]	// month
	lsl	r0,r0,0x8
	orr	r5,r0
	ldr	r0,[sp,0x8]	// day
	lsl	r0,r0,0x10
	orr	r5,r0
	ldr	r0,[sp,0xC]	// weekday
	lsl	r0,r0,0x18
	orr	r5,r0
@@postGetDate:

	// Set default scripts
	mov	r0,(140)	// sent nothing
	str	r0,[sp]
	mov	r0,0xFF
	str	r0,[sp,0x4]	// script 2
	mov	r0,(150)	// None
	str	r0,[sp,0x8]	// script 3

	// Get level before
	lsl	r1,r4,0x1C
	lsr	r1,r1,0x1C	// Brother ID
	bl	0x200C93C	// get Brother data
	bl	0x200809C	// get Brother level
	str	r0,[sp,0xC]	// level before
	str	r0,[sp,0x10]	// level before (current)

	// Get password flags
	mov	r0,((0xF2B8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// pointer to Boktai flags
	ldrb	r1,[r0]		// 0xF2B8
	ldrb	r2,[r0,0x10]	// 0xF2C0
	lsl	r2,r2,0x8
	add	r0,0x20
	ldrb	r3,[r0]		// 0xF2C8
	lsl	r3,r3,0x10
	ldrb	r0,[r0,0x10]	// 0xF2D0
	lsl	r0,r0,0x18
	orr	r1,r2
	orr	r0,r3
	orr	r1,r0

	// Check if password entered and new events added
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	mov	r2,r5		// data
	bl	common_mergeBoktaiFlags
	mov	r6,r0		// new events
	beq	@@nonPasswordReply

@@passwordReply:
	// Get password difficulty
	mov	r0,((0xF2B0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// difficulty
	add	r0,(143)
	str	r0,[sp]		// script 1
	mov	r0,(149)
	str	r0,[sp,0x4]	// script 2

	b	@@chooseItem

@@nonPasswordReply:
	// Check events added today
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	mov	r1,r5		// date
	bl	common_boktaiEventsAddedToday
	cmp	r0,0x0
	bne	@@nonPasswordCheckItem
	mov	r6,0x1		// add 1 new event

@@nonPasswordCheckItem:
	lsr	r0,r4,0x4	// item
	cmp	r0,0x0
	beq	@@nonPasswordNoItem
	cmp	r0,0x4
	ble	@@nonPasswordArmor

@@nonPasswordItem:
	mov	r0,(141)
	str	r0,[sp]		// script 1
//	add	r6,0x1		// +1 event
//	mov	r0,(1 << 6)
//	orr	r6,r0		// +1 level
	mov	r6,(1 << 6)	// +1 level
	b	@@addLevels

@@nonPasswordArmor:
	mov	r0,(142)
	str	r0,[sp]		// script 1
//	mov	r0,(2 << 6)
//	orr	r6,r0		// +2 levels
	mov	r6,(2 << 6)	// +2 levels
	b	@@addLevels

@@nonPasswordNoItem:
	mov	r0,(140)
	str	r0,[sp]		// script 1
//	b	@@addLevels

@@addLevels:
	ldr	r0,[sp,0xC]	// level before
	cmp	r0,(100)
	bge	@@levelScriptNone

	lsr	r7,r6,0x6	// level ups left

@@addLevelLoop:
	cmp	r7,0x0
	beq	@@addEvents

@@addLevelLoop2:
	// Add events until levelup
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	mov	r1,r5
	bl	common_boktaiAddEvent
	cmp	r0,0x0
	beq	@@checkLevelUpOccurred

	// Get new level
	lsl	r1,r4,0x1C
	lsr	r1,r1,0x1C	// Brother ID
	bl	0x200C93C	// get Brother data
	bl	0x200809C	// get Brother level

	// Check if level up occurred
	ldr	r1,[sp,0x10]	// level before (current)
	cmp	r0,r1
	beq	@@addLevelLoop2

	str	r0,[sp,0x10]
	sub	r7,0x1
	b	@@addLevelLoop

@@addEvents:
	lsl	r7,r6,0x1A
	lsr	r7,r7,0x1A	// events left
@@addEventLoop:
	cmp	r7,0x0
	beq	@@checkLevelUpOccurred

	// Add an event
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	mov	r1,r5
	bl	common_boktaiAddEvent
	cmp	r0,0x0
	beq	@@checkLevelUpOccurred

	sub	r7,0x1
	b	@@addEventLoop

@@checkLevelUpOccurred:
	// Get new level
	lsl	r1,r4,0x1C
	lsr	r1,r1,0x1C	// Brother ID
	bl	0x200C93C	// get Brother data
	bl	0x200809C	// get Brother level

	// Check if level up occurred
	ldr	r1,[sp,0xC]	// level before
	cmp	r0,r1
	bne	@@levelScriptLevel

	// Check if events added
	cmp	r6,0x0
	beq	@@levelScriptNone

//	b	@@levelScriptEvent

@@levelScriptEvent:
	mov	r0,(147)
	str	r0,[sp,0x4]	// script 2
	b	@@chooseItem

@@levelScriptLevel:
	mov	r0,(148)
	str	r0,[sp,0x4]	// script 2
	b	@@chooseItem

@@levelScriptNone:
	mov	r0,0xFF
	str	r0,[sp,0x4]	// script 2
//	b	@@chooseItem

@@chooseItem:
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	lsr	r1,r4,0x4
	bl	common_chooseBoktaiMailReward
	str	r0,[sp,0x8]	// script 3

@@chooseDeluxeEnergy:
	// Check 25% chance
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r0,r0,0x1E	// 1-in-4 check
	bne	@@setBuffers

	// Check if no reward
	ldr	r0,[sp,0x8]	// script 3
	cmp	r0,(150)	// None
	bne	@@setBuffers

	// Check if events added
	cmp	r6,0x0
	beq	@@setBuffers

	mov	r0,(155)	// Deluxe Energy
	str	r0,[sp,0x8]

@@setBuffers:
	// Write Brother game log to save file
	lsl	r0,r4,0x1C
	lsr	r0,r0,0x1C	// Brother ID
	bl	common_boktaiBrotherSaveGameLog

	// Buffer Brother ID
	lsl	r1,r4,0x1C
	lsr	r1,r1,0x1C	// Brother ID
	mov	r0,0x4		// buffer 4
	bl	0x2008DF0	// store in text buffer

	// Buffer sent item
	lsr	r1,r4,0x4	// sent item
	add	r1,(103-1)
	mov	r0,0x5		// buffer 5
	bl	0x2008DF0	// store in text buffer

	// Buffer script 2
	ldr	r1,[sp,0x4]	// script 2
	mov	r0,0x6		// buffer 6
	bl	0x2008DF0	// store in text buffer

	// Buffer script 3
	ldr	r1,[sp,0x8]	// script 3
	mov	r0,0x7		// buffer 7
	bl	0x2008DF0	// store in text buffer

	// Buffer Brother level
	lsl	r1,r4,0x1C
	lsr	r1,r1,0x1C	// Brother ID
	bl	0x200C93C	// get Brother data
	bl	0x200809C	// get Brother level
	mov	r1,r0
	mov	r0,0x8		// buffer 8
	bl	0x2008DF0	// store in text buffer

	// Start script 1
	ldr	r3,[sp]		// script 1
//	b	@@end

@@end:
	add	sp,0x14
	pop	r0-r2,r4-r7,r15


.align 2
common_chooseBoktaiMailReward:
	// r0 = Brother ID
	// r1 = mail present
	// ret= reward script
	// r4 = Lunar Knights character data
	// r5 = Brother level
	// r6 = Sun Key chance
	// r7 = reward script (return value)
	push	r4-r7,r14
	mov	r6,r1		// r6 = item sent
	mov	r7,(150)	// None

	// Get Lunar Knights character data
	mov	r1,r0
	bl	0x200C93C	// get Brother data
	mov	r1,(0x3E0 >> 0x2)
	lsl	r1,r1,0x2
	ldrb	r1,[r0,r1]
	lsl	r4,r1,0x3	// r4 = character data offset

	// Get Brother level
	// r0 = Brother data
	bl	0x200809C	// get Brother level
	mov	r5,r0		// r5 = Brother level

	// Check item sent
	ldr	r0,=common_boktaiRewardsArmor
	cmp	r6,0x0
	beq	@@sentNone
	cmp	r6,0x4
	ble	@@sentArmor
	b	@@sentItem

@@sentNone:
	mov	r6,0x0		// Sun Key chance = 0-in-4 and no reward
	b	@@getCharacterData

@@sentItem:
	mov	r6,0x1		// Sun Key chance = 1-in-4
	add	r0,(common_boktaiRewardsItem - common_boktaiRewardsArmor)
	b	@@getCharacterData
@@sentArmor:
	mov	r6,0x2		// Sun Key chance = 2-in-4

@@getCharacterData:
	add	r4,r4,r0	// r4 = character data

	cmp	r6,0x0		// check if item/armor sent
	beq	@@checkExtraFolderOther

	// Get RNG for drop table
	ldr	r0,=0x211F6A8
	bl	0x20069E0
	lsr	r0,r0,0x1
	mov	r1,0x64
	blx	0x208985C	// mod s32

	// Go through drop table
	mov	r1,0x0
@@dropTableLoop:
	ldrb	r2,[r4,r1]	// percentage for this item
	sub	r0,r0,r2
	bpl	@@dropTableNext

	// Set normal reward
	add	r1,(151)
	mov	r7,r1
	b	@@specialRewards

@@dropTableNext:
	add	r1,0x1
	cmp	r1,0x6
	blt	@@dropTableLoop

@@specialRewards:
@@checkSunKeyChance:
	// Check chance for Sun Key (25% for item, 50% for armor)
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r0,r0,0x1E
	lsr	r0,r0,0x1E
	cmp	r0,r6
	bge	@@checkMegaWeaponChance

	// Check already got 4 Sun Keys
	bl	common_boktaiGetNumberOfRedMysteryWavesUnlocked
	mov	r3,r0
	mov	r0,0x66		// SunKey ID
	bl	0x2007BB8	// get item count
	add	r0,r0,r3
	cmp	r0,0x4
	bge	@@checkMegaWeaponChance

	mov	r7,(156)	// Sun Key script

@@checkMegaWeaponChance:
	// Check 25% chance for Mega Weapon
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	mov	r6,r0		// random chance
	lsl	r0,r6,0x1E	// 1-in-4 check
	bne	@@checkExtraFolderOther

	// Check at least Lv. 60
	cmp	r5,(60)
	bge	@@checkCanSendMegaWeapon

	// 1-in-16 chance
	lsl	r0,r6,0x1C
	bne	@@checkExtraFolderOther

@@checkCanSendMegaWeapon:
	// Check if Mega Weapon can be sent
	ldrb	r0,[r4,0x7]
	cmp	r0,0xFF
	beq	@@checkExtraFolderOther

	// Check if Mega Weapon already owned
	add	r0,0x21		// SF Power or FM Bracelet ID
	bl	0x2007BB8	// get item count
	cmp	r0,0x0
	bne	@@checkMegaWeaponOther

	ldrb	r0,[r4,0x7]
	add	r0,(157)
	mov	r7,r0		// Mega Weapon script
	b	@@checkExtraFolderOther

@@checkMegaWeaponOther:
	lsl	r0,r6,0x1D	// 1-in-8 check
	bne	@@checkExtraFolderOther

	// Check at least Lv. 60
	cmp	r5,(60)
	bge	@@checkExtraFolderOther

	// 1-in-32 chance
	lsl	r0,r6,0x1B
	bne	@@checkExtraFolderOther

	// Check if Mega Weapon already owned
	ldrb	r0,[r4,0x7]
	mov	r1,0x1
	eor	r0,r1
	add	r0,0x21		// SF Power or FM Bracelet ID
	bl	0x2007BB8	// get item count
	cmp	r0,0x0
	bne	@@checkExtraFolderOther

	ldrb	r0,[r4,0x7]
	mov	r1,0x1
	eor	r0,r1
	add	r0,(157)
	mov	r7,r0		// Mega Weapon script
//	b	@@checkExtraFolderOther

@@checkExtraFolderOther:
	// Check at least Lv. 60
	cmp	r5,(60)
	blt	@@checkExtraFolder

	// Check other Extra Folder already owned
	ldrb	r0,[r4,0x6]
	mov	r1,0x1
	eor	r0,r1
	ldr	r1,=0xF113
	add	r1,r1,r0
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@checkExtraFolder

	// Set other Extra Folder script
	ldrb	r0,[r4,0x6]
	mov	r1,0x1
	eor	r0,r1
	add	r0,(159)
	mov	r7,r0

@@checkExtraFolder:
	// Check at least Lv. 30
	cmp	r5,(30)
	blt	@@end

	// Check Extra Folder already owned
	ldrb	r0,[r4,0x6]
	ldr	r1,=0xF113
	add	r1,r1,r0
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	// Set Extra Folder script
	ldrb	r0,[r4,0x6]
	add	r0,(159)
	mov	r7,r0

@@end:
	mov	r0,r7
	pop	r4-r7,r15


.align 4
common_boktaiGetNumberOfRedMysteryWavesUnlocked:
	push	r4-r6,r14
	mov	r4,0x0
	add	r5,=common_boktaiRedMysteryWaveFlags
	mov	r6,0x4

@@loop:
	ldrh	r1,[r5]
	bl	0x202409C
	add	r4,r4,r0

	add	r5,0x2
	sub	r6,0x1
	bne	@@loop

	mov	r0,r4
	pop	r4-r6,r15

	.pool


.align 4
common_boktaiRedMysteryWaveFlags:
	.dh	0xB72, 0xB82, 0xC85, 0xC94


.align 4
common_boktaiRewardsArmor:
	// SolarGun, SolarGunV2, DarknessSword, DarknessSwordV2, Deluxe Energy, Sun Key
	// Aaron
	.db	15, 60,  5, 20,  0,  0
	.db	0	// SunFolder
	.db	1	// SF Power
	// Lucian
	.db	 5, 20, 15, 60,  0,  0
	.db	1	// DarkFolder
	.db	0	// FM Bracelet
	// Toasty
	.db	13, 53,  7, 27,  0,  0
	.db	0	// SunFolder
	.db	1	// SF Power
	// Nero
	.db	 7, 27, 13, 53,  0,  0
	.db	1	// DarkFolder
	.db	0	// FM Bracelet
	// Bea
	.db	10, 40, 10, 40,  0,  0
	.db	1	// DarkFolder
	.db	0	// FM Bracelet
	// Lisbeth
	.db	10, 40, 10, 40,  0,  0
	.db	0	// SunFolder
	.db	1	// SF Power

.align 4
common_boktaiRewardsItem:
	// SolarGun, SolarGunV2, DarknessSword, DarknessSwordV2, Deluxe Energy, Sun Key
	// Aaron
	.db	48, 12, 16,  4, 16,  4
	.db	0	// SunFolder
	.db	0xFF	// SF Power
	// Lucian
	.db	16,  4, 48, 12, 16,  4
	.db	1	// DarkFolder
	.db	0xFF	// FM Bracelet
	// Toasty
	.db	43, 11, 21,  5, 16,  4
	.db	0	// SunFolder
	.db	0xFF	// SF Power
	// Nero
	.db	21,  5, 43, 11, 16,  4
	.db	1	// DarkFolder
	.db	0xFF	// FM Bracelet
	// Bea
	.db	32,  8, 32,  8, 16,  4
	.db	1	// DarkFolder
	.db	0xFF	// FM Bracelet
	// Lisbeth
	.db	32,  8, 32,  8, 16,  4
	.db	0	// SunFolder
	.db	0xFF	// SF Power


.align 2
common_boktaiEventsAddedToday:
	// r0 = Brother ID
	// r1 = date
	// ret= number of events added
	push	r4,r14
	mov	r4,r1

	// Get Brother game log flags
	mov	r1,r0
	bl	0x200C93C
	mov	r1,(0x3EC >> 0x2)
	lsl	r1,r1,0x2
	add	r3,r0,r1	// r3 = pointer to Brother game log
	ldr	r2,[r3]		// r2 = flags

	mov	r0,0x0		// number of events
@@loop:
	add	r3,0x4
	cmp	r2,0x0
	beq	@@end
	lsr	r2,r2,0x1	// check next bit
	bcc	@@loop

	// Compare date
	ldr	r1,[r3]
	cmp	r1,r4
	bne	@@loop
	add	r0,0x1
	b	@@loop

@@end:
	pop	r4,r15


.align 2
common_boktaiBrotherSaveGameLog:
	// r0 = Brother ID
	push	r14
	// Get Brother data
	mov	r1,r0
	bl	0x200C93C	// r0 = Brother data
	mov	r1,(0x3E0 >> 0x2)
	lsl	r1,r1,0x2
	add	r1,r0,r1

	// Offset in extended save data
	ldr	r2,=common_saveExData
	ldr	r2,[r2]
	ldr	r0,=EXSAVE_BOKTAI
	add	r2,r2,r0

	ldrb	r0,[r1]		// Boktai Brother NPC
	mov	r3,0x84
	mul	r0,r3
	add	r2,r2,r0

	// Copy to extended save data
	// r1 = source
	// r2 = destination
	// r3 = size
	add	r1,0xC
	bl	0x202DFD8	// Mem_Copy32		

	pop	r15


.align 2
common_boktaiBrotherLoadGameLog:
	// r0 = Brother ID
	push	r4,r14
	// Get Brother data
	mov	r1,r0
	bl	0x200C93C	// r0 = Brother data
	mov	r4,r0
	mov	r2,(0x3E0 >> 0x2)
	lsl	r2,r2,0x2
	add	r2,r0,r2

	// Offset in extended save data
	ldr	r1,=common_saveExData
	ldr	r1,[r1]
	ldr	r0,=EXSAVE_BOKTAI
	add	r1,r1,r0

	ldrb	r0,[r2]		// Boktai Brother NPC
	mov	r3,0x84
	mul	r0,r3
	add	r1,r1,r0

	// Copy from extended save data
	// r1 = source
	// r2 = destination
	// r3 = size
	add	r2,0xC
	bl	0x202DFD8	// Mem_Copy32

	mov	r0,r4
	bl	0x200809C	// get Brother level
	ldr	r1,=0x56D
	strb	r0,[r4,r1]

	pop	r4,r15


.align 2
common_boktaiAddEvent:
	// r0 = Brother ID
	// r1 = date
	// ret= number of events added today
	push	r4,r14
	mov	r4,r1		// date
	bne	@@postDefaultDate
	ldr	r4,=0x6010100	// default date: 1/1/2000 (Sat)
@@postDefaultDate:

	// Get Brother game log flags
	mov	r1,r0
	// Get Brother data
	bl	0x200C93C
	mov	r1,(0x3EC >> 0x2)
	lsl	r1,r1,0x2
	add	r3,r0,r1	// r3 = pointer to Brother game log
	ldr	r2,[r3]		// r2 = flags

	mov	r1,0x0		// flag index
@@loop:
	mov	r0,0x1
	lsl	r0,r1
	tst	r2,r0
	bne	@@next

	// Set flag
	orr	r2,r0		// set flag
	str	r2,[r3]

	// Set date
	lsl	r0,r1,0x2
	add	r0,0x4
	str	r4,[r3,r0]
	b	@@return1

@@next:
	add	r1,0x1
	cmp	r1,0x20
	blt	@@loop

@@return0:
	mov	r0,0x0
	b	@@end
@@return1:
	mov	r0,0x1
@@end:
	pop	r4,r15


.align 2
common_mergeBoktaiFlags:
	// r0 = Brother ID
	// r1 = flags
	// r2 = date
	// ret= number of events added
	push	r4-r7,r14
	mov	r7,0x0		// r7 = added flags (return value)
	mov	r5,r0		// r5 = Brother ID
	mov	r4,r1		// r4 = new flags
	mov	r6,r2		// r6 = date
	bne	@@postDefaultDate
	ldr	r6,=0x6010100	// default date: 1/1/2000 (Sat)
@@postDefaultDate:

	// Get Brother data
	mov	r1,r5
	bl	0x200C93C
	mov	r1,(0x3EC >> 0x2)
	lsl	r1,r1,0x2	// r1 = 0x3EC
	add	r5,r0,r1	// r5 = pointer to Brother game log flags
	ldr	r2,[r5]		// r2 = Brother game log flags

	mov	r3,0x0		// flag index

@@loop:
	// Check if we should set this flag
	mov	r0,0x1
	lsl	r0,r3
	tst	r4,r0
	beq	@@next
	// Check if this flag is already set
	tst	r2,r0
	bne	@@next

	// Set the flag
	orr	r2,r0

	// Fill in the game log date
	lsl	r0,r3,0x2
	add	r0,0x4
	str	r6,[r5,r0]

	add	r7,0x1

@@next:
	add	r3,0x1
	cmp	r3,0x20
	blt	@@loop

	str	r2,[r5]		// save flags

	mov	r0,r7
	pop	r4-r7,r15


.align 2
common_getFlagsFromBoktaiPasswordMail:
	// r0 = mail data
	push	r4-r7,r14	// uses r4
	ldr	r4,[r0,0x20]	// mail body
	mov	r7,0x0		// 0 = normal, 1 = hard, 2 = nightmare, 3 = all titles

	// Base-64 decode password
	mov	r5,0x0		// i = 0
@@decodeLoop:
	ldrb	r0,[r4,r5]
	bl	common_mailCharToBase64
	bmi	@@invalid
	strb	r0,[r4,r5]
	add	r5,0x1
	cmp	r5,0x28
	blt	@@decodeLoop

	// Length must be exactly 40
	ldrb	r0,[r4,r5]
	cmp	r0,0x0
	bne	@@invalid

	// Compute checksum
	mov	r5,0x3		// i = 3
	ldr	r6,=0xFFFF	// checksum = 0xFFFF
	ldr	r1,=(0x180D << 0x10)	// polynomial

@@checksumLoop:
	ldrb	r0,[r4,r5]
	lsl	r0,r0,0x8
	eor	r6,r0		// checksum ^= b << 8

	mov	r0,0x8		// j = 8
@@checksumLoopInner:
	lsl	r6,r6,0x11	// test MSB
	bcc	@@skipXor
	eor	r6,r1		// (checksum << 0x11) ^ (poly << 0x11)
@@skipXor:
	lsr	r6,r6,0x10	// (checksum << 1) ^ (MSB * poly)
	sub	r0,0x1
	bne	@@checksumLoopInner

	add	r5,0x1
	cmp	r5,0x28
	blt	@@checksumLoop
	mvn	r6,r6
	lsl	r6,r6,0x10
	lsr	r6,r6,0x10

	// Load checksum
	mov	r0,(0 / 6)
	mov	r1,(0 % 6)
	mov	r2,(16)
	bl	common_readBoktaiPasswordBits
	cmp	r0,r6
	bne	@@invalid	// checksum mismatch

	// Decrypt bytes
	// Get offset
	mov	r0,(21 / 6)
	mov	r1,(21 / 6)
	mov	r2,(3)
	bl	common_readBoktaiPasswordBits
	neg	r5,r0		// i = -offset

	ldr	r1,=0x5BB15	// key1
	ldr	r2,=0xFFFF	// key2
	ldr	r3,=0x6262C05D	// poly
@@decryptLoop:
	mul	r1,r3		// key1 *= poly
	add	r1,0x1		// key1 += 1

	cmp	r5,0x4
	blt	@@decryptNext

	ldrb	r0,[r4,r5]
	eor	r0,r2		// b ^= key2
	lsl	r0,r0,0x1A
	lsr	r0,r0,0x1A
	strb	r0,[r4,r5]

@@decryptNext:
	eor	r2,r1		// key2 ^= key1

	add	r5,0x1
	cmp	r5,0x28
	blt	@@decryptLoop

	// Get difficulty
	mov	r0,(38 / 6)
	mov	r1,(38 % 6)
	mov	r2,(2)
	bl	common_readBoktaiPasswordBits
	cmp	r0,0x2
	bgt	@@invalid
	mov	r7,r0		// difficulty

	// Get base flags for difficulty
	add	r1,=common_boktaiDifficultyMasks
	lsl	r0,r0,0x2
	ldr	r6,[r1,r0]	// difficulty base flags

	// Check titles
	mov	r0,(24 / 6)
	mov	r1,(24 % 6)
	mov	r2,(14)
	bl	common_readBoktaiPasswordBits
	ldr	r1,=0x3FFF
	cmp	r0,r1
	bne	@@getTitleFlags
	mov	r7,0x3		// all titles

@@getTitleFlags:
	// Get extra flags for titles
	add	r1,=common_boktaiTitleMasks
	mov	r5,0x1
	lsl	r5,r5,0x18	// flag

@@titleLoop:
	ldrh	r2,[r1]
	mov	r3,r0
	and	r3,r2
	cmp	r2,r3
	bne	@@titleNext

	orr	r6,r5		// set flag

@@titleNext:
	add	r1,0x2
	lsl	r5,r5,0x1
	bne	@@titleLoop

	b	@@end

@@invalid:
	mov	r6,0x0
//	b	@@end

@@end:
	mov	r0,r6
	mov	r1,r7
	pop	r4-r7,r15


.align 2
common_readBoktaiPasswordBits:
	// r0 = byte offset, r1 = bit offset, r2 = bit count
	// r4 = mail body
	push	r4-r6,r14

	mov	r3,0x0	// value
	mov	r6,0x0	// bit index
@@loop:
	sub	r2,0x1
	bmi	@@end

	ldrb	r5,[r4,r0]	// temp
	lsr	r5,r1
	lsl	r5,r5,0x1F
	lsr	r5,r5,0x1F
	lsl	r5,r6
	orr	r3,r5

	add	r6,0x1		// bit index + 1
	add	r1,0x1		// bit offset + 1
	cmp	r1,0x6
	blt	@@loop
	// Go to next byte
	add	r0,0x1
	mov	r1,0x0
	b	@@loop

@@end:
	mov	r0,r3
	pop	r4-r6,r15


.align 2
common_mailCharToBase64:
@@check10:
	cmp	r0,0x10
	bne	@@check11_19
	mov	r0,0x3D
	bx	r14
@@check11_19:
	cmp	r0,0x11
	blt	@@invalid
	cmp	r0,0x19
	bgt	@@check1D
	add	r0,(0x34-0x11)	// 0x11 -> 0x34
	bx	r14
@@check1D:
	cmp	r0,0x1D
	bne	@@check1F
	mov	r0,0x3F		// 0x1D -> 0x3F
	bx	r14
@@check1F:
	cmp	r0,0x1F
	bne	@@check21_3A
	mov	r0,0x3E		// 0x1F -> 0x3E
	bx	r14
@@check21_3A:
	cmp	r0,0x21
	blt	@@invalid
	cmp	r0,0x3A
	bgt	@@check41_5A
	sub	r0,(0x21-0x00)	// 0x21 -> 0x00
	bx	r14
@@check41_5A:
	cmp	r0,0x41
	blt	@@invalid
	cmp	r0,0x5A
	bgt	@@invalid
	sub	r0,(0x41-0x1A)	// 0x41 -> 0x1A
	bx	r14
@@invalid:
	neg	r0,r0
	bx	r14


	.pool


.align 4
common_boktaiDifficultyMasks:
	.dw	0x000001FF	// Normal
	.dw	0x0001FFFF	// Hard
	.dw	0x00FFFFFF	// Nightmare
.align 4
common_boktaiTitleMasks:
	.dh	0x0200		// Gladiator
	.dh	0x1000		// Adventurer
	.dh	0x000C		// Swordmaster + Gunmaster
	.dh	0x0020		// Treasure Hunter
	.dh	0x0080		// Huntmaster
	.dh	0x0100		// Shooting Star
	.dh	0x0400		// Special Agent
	.dh	0x0040		// Collector


.align 2
common_getCipherMail:
	// r0 = Cipher mail ID + 1
	sub	r0,r0,0x1
	cmp	r0,0x3C
	blt	@@end

	sub	r0,0x3C
	add	r1,=common_newCipherMail

@@end:
	lsl	r0,r0,0x2
	bx	r14


.align 2
common_getCipherMailFlag:
	// r0 = Cipher mail ID
	push	r14
	cmp	r0,0x3C
	blt	@@normal

	add	r0,0x1
	bl	0x2008160	// get Cipher mail data
	ldrh	r0,[r0,0x8]
	b	@@end

@@normal:
	add	r0,0xE4
@@end:
	pop	r15

	.pool

.align 4
common_newCipherMail:
	.dw	@@cipher60
	.dw	@@cipher61
	.dw	@@cipher62
	.dw	@@cipher63
	.dw	@@cipher64
	.dw	@@cipher65
	.dw	0x0

@@cipher60:
	.dh	(81)	// Humor Buster
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(121)	// body script ID
	.db	0x1	// item
	.dh	0xF116

@@cipher61:
	.dh	(92)	// FireSrch
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(123)	// body script ID
	.db	0x1	// item
	.dh	0xF117

@@cipher62:
	.dh	(93)	// AquaSrch
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(125)	// body script ID
	.db	0x1	// item
	.dh	0xF118

@@cipher63:
	.dh	(94)	// ElecSrch
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(127)	// body script ID
	.db	0x1	// item
	.dh	0xF119

@@cipher64:
	.dh	(95)	// WoodSrch
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(129)	// body script ID
	.db	0x1	// item
	.dh	0xF11A

@@cipher65:
	.dh	(87)	// Color Change
	.fill	0x3
	.db	(0)	// subj script ID
	.db	(131)	// body script ID
	.db	0x1	// item
	.dh	0xF17B


.align 2
common_convertTimeLong:
	// r0 = dummy
	// r1 = time in frames
	// r2 = destination
	push	r2,r14

	// Calculate hours
	mov	r0,r1
	ldr	r1,=0x34BC0
	blx	0x20AEF8C	// r0 = r0 / r1, r1 = r0 % r1
	pop	r2
	str	r0,[r2,0x4]

	// Calculate rest of time
	// r1 = remainder
	bl	0x200FE5C

	pop	r15


.align 2
common_allocObjectMemory:
	// Allocate more object memory
	// Needed for Echo Ridge (initial Harp Note cutscene)
	// Also needed for AMAKEN Grounds pulse in (large Mega Man sprite)
	ldr	r1,=0xCC000
	bx	r14


.align 2
common_mugshotShow:
	push	r14

//	// Check if this is Geo's mugshot
//	cmp	r0,0x5A
//	bne	@@end
//
//	// Get Geo mugshot based on mood
//	bl	0x2009504

@@end:
	mov	r1,r0
	mov	r2,0x5
	pop	r15


.align 2
common_faceTalkExtra:
	push	r4-r7,r14
	add	r4,0x70
	mov	r5,r0
	mov	r6,r1

	// Check mugshot animation type
	ldr	r0,[r5,0x24]
	ldr	r7,[r0,0x8]
	add	r7,r0,r7	// Animation header
	ldrh	r0,[r7,0x2]
	cmp	r0,0x2		// Static animation
	beq	@@end
	cmp	r0,0x1		// Secondary animation
	bne	@@changeAnimationNormal

	ldrb	r0,[r4]		// New animation
	ldrb	r1,[r4,0x1]	// Old animation

@@talkToTalk:
	cmp	r0,0x2		// New = talking
	bne	@@idleToTalk
	cmp	r1,0x3		// Old = special talking
	blt	@@idleToTalk

@@keepSame:
	// Changing to talk animation, don't need to do anything
	strb	r1,[r4]
	b	@@end

@@idleToTalk:
	cmp	r1,0x1		// Old = idle
	bgt	@@talkToIdle
	cmp	r0,0x2		// New = talking
	bne	@@talkToIdle

	// Figure out the current frame
	lsl	r1,r1,0x2
	add	r1,r7,r1
	ldr	r1,[r1,0x4]
	add	r1,r7,r1	// Start of animation pointer
	ldr	r0,[r5,0x28]	// Current animation pointer
	sub	r1,r0,r1
	lsr	r1,r1,0x2	// Calculate frame
	// Change to different talking animation
	add	r6,r1,0x3	// 3 = fur 1 talking
	strb	r6,[r4]

	// Save current frame counter
	ldrb	r0,[r5,0x1]
	push	r0

	// Change animation
	mov	r0,r5
	mov	r1,r6
	bl	0x2020570

	// Set old frame counter
	pop	r0
	strb	r0,[r5,0x1]

	b	@@end

@@talkToIdle:
	cmp	r1,0x3		// Old = special talking
	blt	@@changeAnimationNormal
	cmp	r0,0x1		// New = idle
	bgt	@@changeAnimationNormal

	// Save current frame counter and new frame index
	ldrb	r0,[r5,0x1]
	ldrb	r1,[r5,0x2]
	lsl	r2,r1,0x1C
	lsr	r2,r2,0x1E
	lsl	r2,r2,0x1	// *4
	add	r0,r0,r2
	lsl	r1,r1,0x1E
	lsr	r1,r1,0x1C	// *4
	push	r0-r1

	// Change animation
	mov	r0,r5
	mov	r1,r6
	bl	0x2020570

	// Set old frame counter
	pop	r0-r1
	strb	r0,[r5,0x1]

	// Change frame
	ldr	r0,[r5,0x28]
	add	r0,r0,r1
	str	r0,[r5,0x28]
	// Don't need to change [r5,0x2C] due to sprite file layout

	// Set new frame flags
	ldrb	r1,[r0,0x2]
	strb	r1,[r5,0x2]
	// Don't need to copy palette due to sprite file layout

	b	@@end

@@changeAnimationNormal:
	mov	r0,r5
	mov	r1,r6
	bl	0x2020570

@@end:
	pop	r4-r7,r15


.align 2
common_propellerInit:
	add	r0,0x1
	strb	r0,[r4]

	add	r1,=@propeller_button
	mov	r0,0x0
	str	r0,[r1]

	bx	r14

.align 2
common_propeller:
	push	r5-r7,r14	// retain r4
	mov	r6,r1		// touch screen button

	// Check touch screen held
	cmp	r6,0xFF
	bne	@@touchScreen

	// Get buttons held
	ldr	r7,=0x211DD1C
	ldrb	r5,[r7]

	// Clear direction if no longer held
	add	r1,=@propeller_button
	ldr	r0,[r1]
	and	r0,r5
	str	r0,[r1]

	lsr	r0,r5,0x4
	bne	@@buttons

@@touchScreen:
	// Handle touch screen button
	ldr	r0,[r4,0x34]
	mov	r1,r6
	bl	0x216B2CC

	b	@@end

@@buttons:
	// Check if direction is still held
	add	r1,=@propeller_button
	ldr	r0,[r1]
	cmp	r0,0x0
	bne	@@doDirection

	// Get direction of single button being held
	lsr	r0,r5,0x4
	add	r2,=@propeller_directions
	ldrb	r3,[r2,r0]
	cmp	r3,0xFF
	beq	@@doDirection

	// Set button mask for direction
	lsl	r0,r0,0x4
	str	r0,[r1]

@@doDirection:
	ldr	r0,[@propeller_button]
	lsr	r0,r0,0x4
	ldr	r1,=@propeller_directions
	ldrb	r1,[r1,r0]
	ldr	r0,[r4,0x34]
	bl	0x216B2CC

@@end:
	pop	r5-r7,r15

.align 4
@propeller_button:
	.dw	0x0
.align 4
@propeller_directions:
	.db	0xFF, 0x02, 0x04, 0xFF
	.db	0x01, 0xFF, 0xFF, 0xFF
	.db	0x03, 0xFF, 0xFF, 0xFF
	.db	0xFF, 0xFF, 0xFF, 0xFF


.align 2
common_waveBeamSkipObjectInit:
	push	r14
	cmp	r1,0x0
	bne	@@normal

	// Check objects already initialized
	push	r0-r1
	ldr	r1,=0xF038
	bl	0x202409C	// check flag
	pop	r0-r1
	bne	@@end

	ldr	r2,[common_skipObjectInitForOneFrame]
	cmp	r2,0x0
	bne	@@end

@@normal:
	bl	0x2032D4C
@@end:
	add	r0,=common_skipObjectInitForOneFrame
	mov	r1,0x0
	str	r1,[r0]
	pop	r15
.align 4
common_skipObjectInitForOneFrame:
	.dw	0x0


.align 2
common_simulateTouch:
	push	r0,r7,r14
	ldr	r7,=0x2121040

	// Simulated touch overrides real touch
	ldr	r1,=0xF037
	bl	0x202409C	// check flag
	beq	@@checkTouch

	// Check exact object being touched
	add	r1,=common_simulatedTouchObject
	ldr	r0,[r1]
	cmp	r0,0x0
	beq	@@doTouch
	cmp	r0,r4
	bne	@@checkTouch
	mov	r0,0x0
	str	r0,[r1]

@@doTouch:
	mov	r0,0x1
	strb	r0,[r7,0xC]	// set touch held
	strb	r0,[r7,0x14]	// set touch down

	// Set touch state
	mov	r0,((0xF2E0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x020070F0	// get x-position
	strh	r0,[r7,0x8]
	strh	r0,[r7,0x10]

	mov	r0,((0xF2E8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x020070F0	// get y-position
	strh	r0,[r7,0xA]
	strh	r0,[r7,0x12]

	// Clear simulated touch flags
	ldr	r1,=0xF037
	bl	0x202405C	// clear flag

@@checkTouch:
	pop	r0
	bl	0x202D384
	pop	r7,r15

.align 4
common_simulatedTouchObject:
	.dw	0x0


.align 2
common_fixTouchHitboxOverlap:
	push	r0-r1,r14

	// Check if this is a deactivated pulse in point
	ldrh	r0,[r1,0x4]
	bl	common_isPulseInPointActive
	mov	r2,r0
	pop	r0-r1
	beq	@@false		// Ignore it

	// Check touch hitbox
	bl	0x202DB30
	b	@@end

@@false:
	mov	r0,0x0
@@end:
	pop	r15


.align 2
common_isPulseInPointActive:
	// r0 = ID
	push	r14
	add	r3,=@@pulseInPointFlags

	// Get area
	ldr	r2,=0x2120588
	ldr	r2,[r2]
	ldr	r2,[r2]
	ldrh	r2,[r2]		// area+subarea

	// Scrapyard 1 touch warp check
	mov	r1,(0x394 >> 0x2)
	lsl	r1,r1,0x2
	cmp	r2,r1		// Scrapyard 1
	bne	@@loop
	mov	r1,(0x140 >> 0x4)
	lsl	r1,r1,0x4
	cmp	r0,r1
	bne	@@loop

	// Check Mega Man's position
	ldr	r1,=0x21ACA08
	ldr	r1,[r1]
	cmp	r1,0x0
	beq	@@loop
	ldr	r1,[r1,(0x14+0x4)]
	mov	r2,(0x180000 >> 0x10)
	lsl	r2,r2,0x10
	cmp	r1,r2
	blt	@@loop

	// Not allowed
	mov	r0,0x0
	b	@@end

@@loop:
	ldrh	r1,[r3]		// area
	cmp	r1,0xFF
	beq	@@notFound
	cmp	r1,r2
	bne	@@next
	ldrh	r1,[r3,0x2]	// ID
	cmp	r1,r0
	bne	@@next

	ldrh	r1,[r3,0x4]
	bl	0x202409C	// check flag
	b	@@end

@@next:
	add	r3,0x6
	b	@@loop
@@notFound:
	mov	r0,0x1
@@end:
	pop	r15

	.pool

.align 4
@@pulseInPointFlags:
	// area+subarea, ID, flag
	.dh	0x0090, 0x0140, 0x0019	// Car Comp
	.dh	0x0090, 0x0142, 0x0082	// Sign Comp
	.dh	0x0090, 0x0143, 0x0073	// Doghouse Comp
	.dh	0x0090, 0x0145, 0x0300	// Bud's Room
	.dh	0x0090, 0x0146, 0x0300	// Zack's Room
	.dh	0x0090, 0x0147, 0x0500	// Luna's Room
	.dh	0x0090, 0x0148, 0x0300	// BIG WAVE
	.dh	0x0090, 0x0149, 0x001A	// Truck Comp 1
	.dh	0x0090, 0x014A, 0x002A	// Truck Comp 1
	.dh	0x0090, 0x014B, 0x002B	// Truck Comp 1
	.dh	0x0190, 0x0140, 0x0074	// Fridge Comp
	.dh	0x0290, 0x0140, 0x0083	// Desk Comp
	.dh	0x0390, 0x0140, 0x0087	// Vanity Comp
	.dh	0x0490, 0x0140, 0x0075	// Video Game Comp
	.dh	0x0590, 0x0140, 0x0086	// Exerciser Comp
	.dh	0x0790, 0x0140, 0x0016	// Train Comp
	.dh	0x0790, 0x0141, 0x0017	// Train Comp
	.dh	0x0790, 0x0142, 0x0021	// Pitcher Comp
	.dh	0x0790, 0x0143, 0x00CE	// Pitcher Comp
	.dh	0x0790, 0x0144, 0x0212	// Statue Comp
	.dh	0x0091, 0x0142, 0x0072	// Telescope Comp
	.dh	0x0191, 0x0140, 0x0076	// Ticket Machine Comp
	.dh	0x0291, 0x0141, 0x0077	// Space Colony Comp
	.dh	0x0391, 0x0141, 0x0089	// Display Comp
	.dh	0x0092, 0x0140, 0x008A	// Principal Comp
	.dh	0x0792, 0x0140, 0x008B	// Piano Comp
	.dh	0x0792, 0x0141, 0x0079	// Light Comp
	.dh	0x0892, 0x0140, 0x007A	// VCR Comp
	.dh	0x0093, 0x0140, 0x008C	// Mowai Comp
	.dh	0x0093, 0x0142, 0x007B	// Cake Shop Comp
	.dh	0x0193, 0x0142, 0x008D	// Tailor's Comp
	.dh	0x0193, 0x0143, 0x007C	// Mirror Comp
	.dh	0x0293, 0x0143, 0x0085	// Panda Comp
	.dh	0x0293, 0x0144, 0x007D	// Mowa Mowa Comp
	.dh	0x0094, 0x0141, 0x007E	// Recycled Item Comp
	.dh	0x0294, 0x0140, 0x007F	// Crane Comp
	.dh	0x0394, 0x0144, 0x0097	// Pitcher Comp
	.dh	0x0394, 0x0145, 0x0098	// Pitcher Comp
	.dh	0x0295, 0x0140, 0x0088	// AC Module Comp
	.dh	0x0495, 0x0145, 0x0081	// Test Monitor Comp
	.dh	0xFF


.align 2
common_getFixedBattle:
	push	r0-r3

	// Update DX bosses
	bl	common_getNumberOfDXBossesDefeated

	ldr	r1,=0xF034	// skip tutorial flag
	bl	0x202409C	// check flag
	pop	r0-r3
	beq	@@checkNewBattle

	cmp	r0,0x0
	beq	@@tutorial1
	cmp	r0,0x4
	beq	@@tutorial2
	cmp	r0,0x5
	beq	@@tutorial3
	b	@@checkNewBattle

@@tutorial1:
	mov	r0,0x7A
	b	@@checkNewBattle
@@tutorial2:
	mov	r0,0x7B
	b	@@checkNewBattle
@@tutorial3:
	mov	r0,0x7C
	b	@@checkNewBattle

@@checkNewBattle:
	cmp	r0,0x56
	blt	@@end

	sub	r0,0x56
	ldr	r1,=data_newFixedBattles
	b	@@end

@@end:
	lsl	r0,r0,0x4
	add	r0,r1,r0

	// Check if this is Time Trial
	ldrb	r1,[r0,0x4]
	lsl	r1,r1,0x1C
	lsr	r1,r1,0x1C
	cmp	r1,0x6		// Time Trial
	beq	@@end2

	push	r0
	// Reset encounter rate
	bl	0x2007850
	pop	r0

@@end2:
	pop	r15


.align 2
common_hyperSpeedText:
	mov	r0,0x2
	tst	r0,r1
	bne	@@end

	mov	r0,0x7A
	ldrh	r1,[r4,r0]
	mov	r0,0x8
	tst	r0,r1

@@end:
	bx	r14


	.pool

commonVars:

.include "asm/overlay_0003_field.var.asm"
.include "asm/overlay_0007_battle.var.asm"

.align 2
script_subcardExpired:
	.dw	0x29	// Lock controls
	.dh	0x26	// Set up script
		.db	0x06,0xFF
	.dw	0x5C	// Call function with argument
		.dw	common_subcardExpirePost|1b
		.dw	0
	.dw	0x08	// Wait for text script
	.dw	0x2A	// Unlock controls
	.dw	0x04	// Exit

// 0x0F = Wait for flag set
// 0x10 = Wait for flag unset
// 0x14 = Checks story progress
// 0x15 = Jumps if flag set
// 0x16 = Jumps if flag unset
// 0x21 = Sets flag
// 0x22 = Unsets flag
// 0x28 = Starts cutscene text?

.align 2
data_extraCardInfo:
// +0x0 = power up description
// +0x1 = elem flags (1 = sword, 2 = break, 4 = wind, 8 = star)
	.db	  0, (0 | 0 | 0 | 0)	// MegaBuster
	.db	153, (0 | 0 | 0 | 8)	// Cannon
	.db	154, (0 | 0 | 0 | 8)	// PlusCannon
	.db	155, (0 | 0 | 0 | 8)	// HevyCannon
	.db	156, (0 | 0 | 0 | 8)	// PlasmaGun1
	.db	157, (0 | 0 | 0 | 8)	// PlasmaGun2
	.db	182, (0 | 0 | 0 | 8)	// PlasmaGun3
	.db	110, (0 | 0 | 0 | 8)	// Gatling1
	.db	111, (0 | 0 | 0 | 8)	// Gatling2
	.db	112, (0 | 0 | 0 | 8)	// Gatling3
	.db	109, (0 | 0 | 4 | 8)	// AirSpread
	.db	 96, (0 | 0 | 0 | 8)	// RdrMissil1
	.db	 97, (0 | 0 | 0 | 8)	// RdrMissil2
	.db	 98, (0 | 0 | 0 | 8)	// RdrMissil3
	.db	 97, (0 | 0 | 0 | 8)	// HeatBall1
	.db	100, (0 | 0 | 0 | 8)	// HeatBall2
	.db	127, (0 | 0 | 0 | 8)	// HeatBall3
	.db	158, (0 | 0 | 0 | 8)	// IceMeteor1
	.db	158, (0 | 0 | 0 | 8)	// IceMeteor2
	.db	158, (0 | 0 | 0 | 8)	// IceMeteor3
	.db	107, (0 | 0 | 0 | 8)	// StunNukle
	.db	107, (0 | 0 | 0 | 8)	// PoisNukle
	.db	107, (0 | 0 | 0 | 8)	// FreezNukle
	.db	100, (1 | 0 | 0 | 8)	// Sword
	.db	101, (1 | 0 | 0 | 8)	// WideSword
	.db	102, (1 | 0 | 0 | 8)	// LongSword
	.db	122, (1 | 0 | 0 | 8)	// BlazngEdge
	.db	142, (1 | 0 | 0 | 8)	// TidalEdge
	.db	100, (1 | 0 | 0 | 8)	// StrikeEdge
	.db	135, (1 | 0 | 0 | 8)	// ArboEdge
	.db	103, (1 | 2 | 0 | 8)	// BreakSabre
	.db	129, (0 | 0 | 0 | 8)	// GrndWave1
	.db	130, (0 | 0 | 0 | 8)	// GrndWave2
	.db	131, (0 | 0 | 0 | 8)	// GrndWave3
	.db	107, (0 | 2 | 4 | 8)	// JetAttack1
	.db	107, (0 | 2 | 4 | 8)	// JetAttack2
	.db	107, (0 | 2 | 4 | 8)	// JetAttack3
	.db	134, (0 | 0 | 0 | 8)	// PowerBomb1
	.db	135, (0 | 0 | 0 | 8)	// PowerBomb2
	.db	136, (0 | 0 | 0 | 8)	// PowerBomb3
	.db	107, (0 | 0 | 0 | 8)	// GhstPulse1
	.db	107, (0 | 0 | 0 | 8)	// GhstPulse2
	.db	107, (0 | 0 | 0 | 8)	// GhstPulse3
	.db	107, (0 | 0 | 0 | 8)	// FireRing1
	.db	107, (0 | 0 | 0 | 8)	// FireRing2
	.db	108, (0 | 0 | 0 | 8)	// FireRing3
	.db	159, (0 | 0 | 0 | 8)	// TimeBomb1
	.db	160, (0 | 0 | 0 | 8)	// TimeBomb2
	.db	160, (0 | 0 | 0 | 8)	// TimeBomb3
	.db	 99, (0 | 0 | 0 | 8)	// FireBzook1
	.db	100, (0 | 0 | 0 | 8)	// FireBzook2
	.db	101, (0 | 0 | 0 | 8)	// FireBzook3
	.db	124, (0 | 0 | 0 | 8)	// TailBurnr1
	.db	125, (0 | 0 | 0 | 8)	// TailBurnr2
	.db	126, (0 | 0 | 0 | 8)	// TailBurnr3
	.db	140, (0 | 0 | 0 | 8)	// WideWave1
	.db	140, (0 | 0 | 0 | 8)	// WideWave2
	.db	140, (0 | 0 | 0 | 8)	// WideWave3
	.db	107, (0 | 0 | 0 | 8)	// ChainBubl1
	.db	107, (0 | 0 | 0 | 8)	// ChainBubl2
	.db	108, (0 | 0 | 0 | 8)	// ChainBubl3
	.db	133, (0 | 0 | 0 | 8)	// GreenInk
	.db	141, (0 | 0 | 0 | 8)	// BlueInk
	.db	123, (0 | 0 | 0 | 8)	// PurpleInk
	.db	107, (0 | 0 | 0 | 8)	// StikyRain1
	.db	107, (0 | 0 | 0 | 8)	// StikyRain2
	.db	107, (0 | 0 | 0 | 8)	// StikyRain3
	.db	118, (0 | 0 | 0 | 8)	// CloudShot1
	.db	119, (0 | 0 | 0 | 8)	// CloudShot2
	.db	120, (0 | 0 | 0 | 8)	// CloudShot3
	.db	107, (0 | 0 | 0 | 8)	// ThndrBall1
	.db	108, (0 | 0 | 0 | 8)	// ThndrBall2
	.db	108, (0 | 0 | 0 | 8)	// ThndrBall3
	.db	132, (0 | 0 | 0 | 8)	// VolticEye1
	.db	132, (0 | 0 | 0 | 8)	// VolticEye2
	.db	183, (0 | 0 | 0 | 8)	// VolticEye3
	.db	113, (0 | 0 | 0 | 8)	// FlickrKck1
	.db	113, (0 | 0 | 0 | 8)	// FlickrKck2
	.db	114, (0 | 0 | 0 | 8)	// FlickrKck3
	.db	 98, (0 | 0 | 0 | 8)	// JumboHmmr1
	.db	 99, (0 | 0 | 0 | 8)	// JumboHmmr2
	.db	100, (0 | 0 | 0 | 8)	// JumboHmmr3
	.db	 99, (1 | 0 | 0 | 8)	// MopLance1
	.db	103, (1 | 0 | 0 | 8)	// MopLance2
	.db	106, (1 | 0 | 0 | 8)	// MopLance3
	.db	107, (1 | 0 | 0 | 8)	// Fokx-Fu1
	.db	107, (1 | 0 | 0 | 8)	// Fokx-Fu2
	.db	107, (1 | 0 | 0 | 8)	// Fokx-Fu3
	.db	115, (0 | 0 | 0 | 8)	// VulcnSeed1
	.db	116, (0 | 0 | 0 | 8)	// VulcnSeed2
	.db	117, (0 | 0 | 0 | 8)	// VulcnSeed3
	.db	137, (1 | 2 | 0 | 8)	// BraveSwrd1
	.db	137, (1 | 2 | 0 | 8)	// BraveSwrd2
	.db	138, (1 | 2 | 0 | 8)	// BraveSwrd3
	.db	161, (0 | 2 | 0 | 8)	// JunkCube1
	.db	162, (0 | 2 | 0 | 8)	// JunkCube2
	.db	163, (0 | 2 | 0 | 8)	// JunkCube3
	.db	100, (0 | 0 | 0 | 8)	// SyncHook1
	.db	101, (0 | 0 | 0 | 8)	// SyncHook2
	.db	102, (0 | 0 | 0 | 8)	// SyncHook3
	.db	164, (0 | 0 | 0 | 8)	// PowerSong
	.db	165, (0 | 0 | 0 | 8)	// QuakeSong
	.db	166, (0 | 0 | 0 | 8)	// TripSong
	.db	134, (0 | 2 | 0 | 8)	// MoaiFall1
	.db	135, (0 | 2 | 0 | 8)	// MoaiFall2
	.db	136, (0 | 2 | 0 | 8)	// MoaiFall3
	.db	103, (1 | 0 | 0 | 8)	// BigAx1
	.db	104, (1 | 0 | 0 | 8)	// BigAx2
	.db	105, (1 | 0 | 0 | 8)	// BigAx3
	.db	167, (0 | 0 | 0 | 8)	// MagiCrysl1
	.db	167, (0 | 0 | 0 | 8)	// MagiCrysl2
	.db	168, (0 | 0 | 0 | 8)	// MagiCrysl3
	.db	169, (0 | 0 | 0 | 8)	// BlackHole1
	.db	170, (0 | 0 | 0 | 8)	// BlackHole2
	.db	171, (0 | 0 | 0 | 8)	// BlackHole3
	.db	121, (1 | 0 | 0 | 8)	// BrsrkSwrd1
	.db	121, (1 | 0 | 0 | 8)	// BrsrkSwrd2
	.db	121, (1 | 0 | 0 | 8)	// BrsrkSwrd3
	.db	 96, (0 | 0 | 0 | 8)	// GreenBurst
	.db	 96, (0 | 0 | 0 | 8)	// IceBurst
	.db	 96, (0 | 0 | 0 | 8)	// PoisBurst
	.db	 99, (0 | 0 | 4 | 8)	// TyphnDance
	.db	107, (0 | 2 | 0 | 8)	// JamminPnch
	.db	 96, (0 | 0 | 0 | 8)	// JamMachGun
	.db	128, (0 | 2 | 4 | 8)	// Whistle
	.db	103, (0 | 0 | 0 | 8)	// Bombalizer
	.db	  0, (0 | 0 | 0 | 0)	// AntiSword
	.db	143, (0 | 0 | 0 | 8)	// Recover10
	.db	144, (0 | 0 | 0 | 8)	// Recover30
	.db	145, (0 | 0 | 0 | 8)	// Recover50
	.db	146, (0 | 0 | 0 | 8)	// Recover80
	.db	147, (0 | 0 | 0 | 8)	// Recover120
	.db	148, (0 | 0 | 0 | 8)	// Recover150
	.db	149, (0 | 0 | 0 | 8)	// Recover200
	.db	150, (0 | 0 | 0 | 8)	// Recover300
	.db	  0, (0 | 0 | 0 | 0)	// Barrier
	.db	  0, (0 | 0 | 0 | 0)	// Barrier100
	.db	  0, (0 | 0 | 0 | 0)	// Barrier200
	.db	152, (0 | 0 | 0 | 8)	// Aura
	.db	151, (0 | 0 | 0 | 8)	// Invisible
	.db	  0, (0 | 0 | 0 | 0)	// SpiritFury
	.db	  0, (0 | 0 | 0 | 0)	// PoisnApple
	.db	  0, (0 | 0 | 0 | 0)	// DoublCross
	.db	  0, (0 | 0 | 0 | 0)	// GigaMine
	.db	  0, (0 | 0 | 0 | 0)	// GrassStage
	.db	  0, (0 | 0 | 0 | 0)	// IceStage
	.db	  0, (0 | 0 | 0 | 0)	// GraviStage
	.db	  0, (0 | 0 | 0 | 0)	// GNullStage
	.db	172, (0 | 0 | 0 | 8)	// HolyPanel
	.db	173, (0 | 0 | 0 | 8)	// ParlyzPlus
	.db	174, (0 | 0 | 0 | 8)	// Attack+10
	.db	175, (0 | 0 | 0 | 8)	// SolarGun
	.db	110, (0 | 0 | 0 | 8)	// SolarGunV2
	.db	111, (0 | 0 | 0 | 8)	// SolarGunV3
	.db	 99, (1 | 0 | 0 | 8)	// DarknsSwrd
	.db	100, (1 | 0 | 0 | 8)	// DrknsSrdV2
	.db	101, (1 | 0 | 0 | 8)	// DrknsSrdV3
	.db	100, (0 | 0 | 0 | 8)	// Ursula
	.db	102, (0 | 0 | 0 | 8)	// UrsulaV2
	.db	103, (0 | 0 | 0 | 8)	// UrsulaV3
	.db	 96, (0 | 2 | 0 | 8)	// Tove
	.db	 96, (0 | 2 | 0 | 8)	// ToveV2
	.db	 97, (0 | 2 | 0 | 8)	// ToveV3
	.db	176, (0 | 0 | 4 | 8)	// Alexander
	.db	177, (0 | 0 | 4 | 8)	// AlexandrV2
	.db	178, (0 | 0 | 4 | 8)	// AlexandrV3
	.db	179, (0 | 0 | 0 | 8)	// Ezra
	.db	180, (0 | 0 | 0 | 8)	// EzraV2
	.db	181, (0 | 0 | 0 | 8)	// EzraV3
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)	// TaurusFire
	.db	  0, (0 | 0 | 0 | 0)	// TaursFireEX
	.db	  0, (0 | 0 | 0 | 0)	// TaursFireSP
	.db	  0, (0 | 2 | 4 | 0)	// CygnusWing
	.db	  0, (0 | 2 | 4 | 0)	// CygnsWingEX
	.db	  0, (0 | 2 | 4 | 0)	// CygnsWingSP
	.db	  0, (0 | 2 | 0 | 0)	// HarpNote
	.db	  0, (0 | 2 | 0 | 0)	// HarpNoteEX
	.db	  0, (0 | 2 | 0 | 0)	// HarpNoteSP
	.db	  0, (0 | 0 | 0 | 0)	// LibraScals
	.db	  0, (0 | 0 | 0 | 0)	// LibrScalsEX
	.db	  0, (0 | 0 | 0 | 0)	// LibrScalsSP
	.db	  0, (0 | 2 | 0 | 0)	// QnOphiuca
	.db	  0, (0 | 2 | 0 | 0)	// QnOphiucaEX
	.db	  0, (0 | 2 | 0 | 0)	// QnOphiucaSP
	.db	  0, (1 | 2 | 0 | 0)	// GeminSpark
	.db	  0, (1 | 2 | 0 | 0)	// GemnSpkEX
	.db	  0, (1 | 2 | 0 | 0)	// GemnSpkSP
	.db	  0, (0 | 0 | 0 | 0)	// CancrBuble
	.db	  0, (0 | 0 | 0 | 0)	// CancrBublEX
	.db	  0, (0 | 0 | 0 | 0)	// CancrBublSP
	.db	  0, (1 | 0 | 0 | 0)	// WolfWoods
	.db	  0, (1 | 0 | 0 | 0)	// WolfWoodsEX
	.db	  0, (1 | 0 | 0 | 0)	// WolfWoodsSP
	.db	  0, (0 | 0 | 0 | 0)	// CrwnThundr
	.db	  0, (0 | 0 | 0 | 0)	// CrwnThndrEX
	.db	  0, (0 | 0 | 0 | 0)	// CrwnThndrSP
	.db	  0, (0 | 0 | 0 | 0)	// PegasusMgc
	.db	  0, (0 | 0 | 0 | 0)	// PegasuMgcEX
	.db	  0, (0 | 0 | 0 | 0)	// PegasuMgcSP
	.db	  0, (0 | 0 | 0 | 0)	// LeoKingdom
	.db	  0, (0 | 0 | 0 | 0)	// LeoKingdmEX
	.db	  0, (0 | 0 | 0 | 0)	// LeoKingdmSP
	.db	  0, (0 | 0 | 4 | 0)	// DragonSky
	.db	  0, (0 | 0 | 4 | 0)	// DragonSkyEX
	.db	  0, (0 | 0 | 4 | 0)	// DragonSkySP
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)	// PegasuMgcGX
	.db	  0, (0 | 0 | 0 | 0)	// Aqua+50
	.db	  0, (0 | 2 | 0 | 0)	// OxTackle
	.db	  0, (0 | 2 | 0 | 0)	// BrkTmeBmb
	.db	  0, (1 | 0 | 0 | 0)	// DarkSword
	.db	  0, (0 | 0 | 0 | 0)	// LeoKingdmGX
	.db	  0, (0 | 0 | 0 | 0)	// Fire+50
	.db	  0, (0 | 0 | 0 | 0)	// GemniThndr
	.db	  0, (0 | 0 | 0 | 0)	// DrknesHole
	.db	  0, (0 | 0 | 0 | 0)	// LifeAura
	.db	  0, (0 | 0 | 4 | 0)	// DragonSkyGX
	.db	  0, (0 | 0 | 0 | 0)	// Wood+50
	.db	  0, (0 | 0 | 0 | 0)	// GorgonEye
	.db	  0, (0 | 0 | 0 | 0)	// DestrMissl
	.db	  0, (0 | 0 | 0 | 0)	// PoisonPhar
	.db	  0, (0 | 0 | 0 | 0)
	.db	  0, (0 | 0 | 0 | 0)	// Andromeda


.align 4
data_newFixedBattles:
	// Leo Kingdom EX
	.dw	0xC80		// flags: boss, allow Best Combo, no G virus
	.db	0xD0		// intro: Leo Kingdom
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle56_objects

	/// Dragon Sky EX
	.dw	0xC80		// flags: boss, allow Best Combo, no G virus
	.db	0xE0		// intro: Dragon Sky
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle57_objects

	// Time Trial - Taurus Fire
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x26		// intro: Taurus Fire; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle58_objects

	// Time Trial - Cygnus Wing
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x36		// intro: Cygnus Wing; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle59_objects

	// Time Trial - Harp Note
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x46		// intro: Harp Note; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5A_objects

	// Time Trial - Libra Scales
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x56		// intro: Libra Scales; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5B_objects

	// Time Trial - Queen Ophiuca
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x66		// intro: Queen Ophiuca; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5C_objects

	// Time Trial - Gemini Spark
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x76		// intro: Gemini Spark; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5D_objects

	// Time Trial - Cancer Bubble
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0x96		// intro: Cancer Bubble; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5E_objects

	// Time Trial - Wolf Woods
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0xA6		// intro: Wolf Woods; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle5F_objects

	// Time Trial - Crown Thunder
	.dw	0x1AC4		// flags: no game over, no results, boss, no update HP, no G virus, start with full HP
	.db	0xB6		// intro: Crown Thunder; type: time trial
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle60_objects

	// OW virus - Echo Ridge (vending machine)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x00		// OW virus ID
	.dw	@battle61_objects

	// OW virus - Echo Ridge (school)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x01		// OW virus ID
	.dw	@battle62_objects

	// OW virus - Geo's Living Room
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x02		// battlefield: ice stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x02		// OW virus ID
	.dw	@battle63_objects

	// OW virus - Geo's Room
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x03		// OW virus ID
	.dw	@battle64_objects

	// OW virus - Luna's Room
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x04		// OW virus ID
	.dw	@battle65_objects

	// OW virus - Bud's Room
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x05		// OW virus ID
	.dw	@battle66_objects

	// OW virus - Zack's Room
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x06		// OW virus ID
	.dw	@battle67_objects

	// OW virus - Vista Point
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x0F		// battlefield: holy stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x07		// OW virus ID
	.dw	@battle68_objects

	// OW virus - AMAKEN Grounds (staircase)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x08		// OW virus ID
	.dw	@battle69_objects

	// OW virus - AMAKEN Grounds (rooftop)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x09		// OW virus ID
	.dw	@battle6A_objects

	// OW virus - AMAKEN Foyer
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x02		// battlefield: ice stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0A		// OW virus ID
	.dw	@battle6B_objects

	// OW virus - Science Museum
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x10		// battlefield: gravity stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0B		// OW virus ID
	.dw	@battle6C_objects

	// OW virus - Lab
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0C		// OW virus ID
	.dw	@battle6D_objects

	// OW virus - Foyer
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0D		// OW virus ID
	.dw	@battle6E_objects

	// OW virus - Class 1-A
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0E		// OW virus ID
	.dw	@battle6F_objects

	// OW virus - Gym
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x11		// battlefield: Guard Null stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x0F		// OW virus ID
	.dw	@battle70_objects

	// OW virus - Studio
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x10		// battlefield: gravity stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x10		// OW virus ID
	.dw	@battle71_objects

	// OW virus - Time Square
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x11		// OW virus ID
	.dw	@battle72_objects

	// OW virus - Nacys 1F
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x02		// battlefield: ice stage
	.db	0x1B		// music: virus
	.db	0x02		// background: indoors
	.dw	0x12		// OW virus ID
	.dw	@battle73_objects

	// OW virus - Nacys Roof (Mowa Mowa)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x13		// OW virus ID
	.dw	@battle74_objects

	// OW virus - Nacys Roof (cat ride)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x14		// OW virus ID
	.dw	@battle75_objects

	// OW virus - Dream Island (bus stop)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x15		// OW virus ID
	.dw	@battle76_objects

	// OW virus - Dream Island (logs)
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x16		// OW virus ID
	.dw	@battle77_objects

	// OW virus - Dream Park
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x01		// battlefield: grass stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x17		// OW virus ID
	.dw	@battle78_objects

	// OW virus - Scrapyard 1
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x11		// battlefield: Guard Null stage
	.db	0x1B		// music: virus
	.db	0x00		// background: sky
	.dw	0x18		// OW virus ID
	.dw	@battle79_objects

	// Tutorial 1
	.dw	0xA4C		// flags: no game over, no escape, no results, reset HP, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0xA		// level: 10
	.dw	0x20C8FFE	// battle 7A

	// Tutorial 2
	.dw	0xA4C		// flags: no game over, no escape, no results, reset HP, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0xA		// level: 10
	.dw	0x20C9448	// battle 7B

	// Tutorial 3
	.dw	0xA4C		// flags: no game over, no escape, no results, reset HP, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0xA		// level: 10
	.dw	0x20C9466	// battle 7C

	// Dragon Shadow
	.dw	0x888		// flags: no escape, boss, no G virus
	.db	0xE0		// intro: Dragon Sky; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x00		// background: sky
	.dw	0x0		// level: 0
	.dw	@battle7D_objects

	// Leo Shadow
	.dw	0x888		// flags: no escape, boss, no G virus
	.db	0xD0		// intro: Leo Kingdom; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x00		// background: sky
	.dw	0x0		// level: 0
	.dw	@battle7E_objects

	// Jammer (Famous quest)
	.dw	0x808		// flags: no escape, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x00		// background: sky
	.dw	0x0		// level: 0
	.dw	@battle7F_objects

	// Hollow
	.dw	0xC88		// flags: no escape, boss, allow Best Combo, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x0		// level: 0
	.dw	@battle80_objects

	// Hollow
	.dw	0xE84		// flags: no game over, boss, allow Best Combo, reset HP, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x0		// level: 0
	.dw	@battle81_objects

common_battle82:
	// Leo Kingdom SP
	.dw	0xC81		// flags: allow SearchEye, boss, allow Best Combo, no G virus
	.db	0xD0		// intro: Leo Kingdom
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// level: 0
	.dw	@battle82_objects

common_battle83:
	// Dragon Sky SP
	.dw	0xC81		// flags: allow SearchEye, boss, allow Best Combo, no G virus
	.db	0xE0		// intro: Dragon Sky
	.db	0x00		// battlefield: standard
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// level: 0
	.dw	@battle83_objects

common_battle84:
	// Leo Kingdom V1
	.dw	0x888		// flags: no escape, boss, no G virus
	.db	0xD0		// intro: Leo Kingdom
	.db	0x00		// battlefield: standaerd
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// level: 0
	.dw	@battle84_objects

common_battle85:
	// Dragon Sky V1
	.dw	0x888		// flags: no escape, boss, no G virus
	.db	0xE0		// intro: Dragon Sky
	.db	0x00		// battlefield: standaerd
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// level: 0
	.dw	@battle85_objects

common_battle86:
	// Gauntlet 1 refight
	.dw	0x1844		// flags: no game over, no results, no G virus, start with full HP
	.db	0x00		// intro: none
	.db	0x05		// battlefield: 5
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C9088

common_battle87:
	// Gauntlet 2 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x06		// battlefield: 6
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C90A6

common_battle88:
	// Gauntlet 3 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x07		// battlefield: 7
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C90C4

common_battle89:
	// Gauntlet 4 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x08		// battlefield: 8
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C9100

common_battle8A:
	// Gauntlet 5 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x09		// battlefield: 9
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C94F0

common_battle8B:
	// Gauntlet 6 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x0A		// battlefield: 10
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C911E

common_battle8C:
	// Gauntlet 7 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x0B		// battlefield: 11
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C9484

common_battle8D:
	// Gauntlet 8 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x0C		// battlefield: 12
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C9178

common_battle8E:
	// Gauntlet 9 refight
	.dw	0x844		// flags: no game over, no results, no G virus
	.db	0x00		// intro: none
	.db	0x0D		// battlefield: 13
	.db	0x1B		// music: virus
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C951A

common_battle8F:
	// Gauntlet 10 refight
	.dw	0x804		// flags: no game over, no G virus
	.db	0x00		// intro: none
	.db	0x0E		// battlefield: 14
	.db	0x1C		// music: boss
	.db	0x03		// background: comp
	.dw	0x00		// level: 0
	.dw	0x20C924A

common_battle90:
	// OW virus - Final
	.dw	0x80001A08	// flags: no escape, no G virus, no update HP, start with full HP, real world virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x02		// background: indoors
	.dw	0x19		// OW virus ID
	.dw	@battle90_objects

common_battle91:
	// Final Boss Rush - Taurus Fire SP
	.dw	0x18C4		// flags: no game over, no results, is boss battle, no G virus, start with full HP
	.db	0x20		// intro: Taurus Fire; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle91_objects

common_battle92:
	// Final Boss Rush - Cygnus Wing SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x30		// intro: Cygnus Wing; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle92_objects

common_battle93:
	// Final Boss Rush - Harp Note SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x40		// intro: Harp Note; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle93_objects

common_battle94:
	// Final Boss Rush - Libra Scales SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x50		// intro: Libra Scales; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle94_objects

common_battle95:
	// Final Boss Rush - Queen Ophiuca SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x60		// intro: Queen Ophiuca; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle95_objects

common_battle96:
	// Final Boss Rush - Gemini Spark SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x70		// intro: Gemini Spark; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle96_objects

common_battle97:
	// Final Boss Rush - Cancer Bubble SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x90		// intro: Cancer Bubble; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle97_objects

common_battle98:
	// Final Boss Rush - Wolf Woods SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0xA0		// intro: Wolf Woods; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle98_objects

common_battle99:
	// Final Boss Rush - Crown Thunder SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0xB0		// intro: Crown Thunder; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle99_objects

common_battle9A:
	// Final Boss Rush - Hollow
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0x00		// intro: none; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle9A_objects

common_battle9B:
	// Final Boss Rush - Pegasus Magic SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0xC0		// intro: Pegasus Magic; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle9B_objects

common_battle9C:
	// Final Boss Rush - Leo Kingdom SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0xD0		// intro: Leo Kingdom; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle9C_objects

common_battle9D:
	// Final Boss Rush - Dragon Sky SP
	.dw	0x8C4		// flags: no game over, no results, is boss battle, no G virus
	.db	0xE0		// intro: Dragon Sky; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1C		// music: boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle9D_objects

common_battle9E:
	// Final Boss Rush - Andromeda Infinity
	.dw	0x9C4		// flags: no game over, no results, is boss battle, Andromeda field, no G virus
	.db	0x80		// intro: Andromeda; type: normal
	.db	0x00		// battlefield: normal
	.db	0x1D		// music: final boss
	.db	0x01		// background: space
	.dw	0x00		// unknown: 0
	.dw	@battle9E_objects

@battle56_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0144	// Leo Kingdom EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle57_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x05	:: .dh	0x014A	// Dragon Sky EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle58_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0102	// Taurus Fire EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle59_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0108	// Cygnus Wing EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5A_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x010E	// Harp Note EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5B_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0114	// Libra Scales EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5C_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x011A	// Queen Ophiuca EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5D_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0120	// Gemini Spark EX B
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0123	// Gemini Spark EX W
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5E_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x012C	// Cancer Bubble EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle5F_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0132	// Wolf Woods EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle60_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0138	// Crown Thunder EX
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle61_objects:	// OW virus - Echo Ridge (vending machine)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0004	// MettennaG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0004	// MettennaG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0004	// MettennaG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle62_objects:	// OW virus - Echo Ridge (school)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x03	:: .dh	0x0092	// MelamanderG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0092	// MelamanderG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0092	// MelamanderG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle63_objects:	// OW virus - Geo's Living Room
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x03	:: .dh	0x001C	// HotRoaderG
	.db	0x01,0x01,0x03,0x03	:: .dh	0x001C	// HotRoaderG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0004	// MettennaG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle64_objects:	// OW virus - Geo's Room
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x000A	// CannonBaseG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x001C	// HotRoaderG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0004	// MettennaG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle65_objects:	// OW virus - Luna's Room
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0092	// MelamanderG
	.db	0x01,0x01,0x01,0x05	:: .dh	0x0028	// MonoswordG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0028	// MonoswordG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle66_objects:	// OW virus - Bud's Room
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x0010	// CrowcarG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0010	// CrowcarG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0010	// CrowcarG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle67_objects:	// OW virus - Zack's Room
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0016	// PeekabooG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0016	// PeekabooG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x000A	// CannonBaseG
	.db	0x02,0x00,0x02,0x04	:: .dh	0x0000	// RockCube
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle68_objects:	// OW virus - Vista Point
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x000A	// CannonBaseG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x000A	// CannonBaseG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x000A	// CannonBaseG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle69_objects:	// OW virus - AMAKEN Grounds (staircase)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x03	:: .dh	0x0092	// MelamanderG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0016	// PeekabooG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x000A	// CannonBaseG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6A_objects:	// OW virus - AMAKEN Grounds (rooftop)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x03	:: .dh	0x004A	// ZapAceG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0022	// WibbledeeG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0004	// MettennaG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6B_objects:	// OW virus - AMAKEN Foyer
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x004A	// ZapAceG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0022	// WibbledeeG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0022	// WibbledeeG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6C_objects:	// OW virus - Science Museum
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x0022	// WibbledeeG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0016	// PeekabooG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0016	// PeekabooG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6D_objects:	// OW virus - Lab
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x03,0x03	:: .dh	0x004A	// ZapAceG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x004A	// ZapAceG
	.db	0x01,0x01,0x01,0x05	:: .dh	0x004A	// ZapAceG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6E_objects:	// OW virus - Foyer
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x000B	// MegaBaseG
	.db	0x01,0x01,0x01,0x05	:: .dh	0x0044	// BoomBoltG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0044	// BoomBoltG
	.db	0x02,0x00,0x02,0x03	:: .dh	0x0000	// RockCube
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle6F_objects:	// OW virus - Class 1-A
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x003E	// DoomCountG
	.db	0x01,0x01,0x01,0x05	:: .dh	0x003E	// DoomCountG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x003E	// DoomCountG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle70_objects:	// OW virus - Gym
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x0005	// Mettenna2G
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0005	// Mettenna2G
	.db	0x01,0x01,0x01,0x05	:: .dh	0x0038	// LupaDonnaG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle71_objects:	// OW virus - Studio
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x004B	// ZapKingG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x004B	// ZapKingG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0051	// BellRefG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle72_objects:	// OW virus - Time Square
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x009E	// MoaianG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x009E	// MoaianG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0029	// MonoswordinG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle73_objects:	// OW virus - Nacys 1F
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x03	:: .dh	0x002E	// StreamCancrG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x002E	// StreamCancrG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0011	// CrowketG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle74_objects:	// OW virus - Nacys Roof (Mowa Mowa)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x0093	// MelalizardG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0023	// WibbledooG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0062	// GooeyG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle75_objects:	// OW virus - Nacys Roof (cat ride)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0080	// RockyG
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0080	// RockyG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0039	// LuPavarotG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle76_objects:	// OW virus - Dream Island (bus stop)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x0011	// CrowketG
	.db	0x01,0x01,0x01,0x05	:: .dh	0x0098	// LampisG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0098	// LampisG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle77_objects:	// OW virus - Dream Island (logs)
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x006F	// ColonelMopG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x002F	// RiverCancroG
	.db	0x01,0x01,0x03,0x05	:: .dh	0x0068	// RhinoHornG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle78_objects:	// OW virus - Dream Park
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x00A4	// TropiCongaG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x00A4	// TropiCongaG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0081	// CraggyG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle79_objects:	// OW virus - Scrapyard 1
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x03,0x03	:: .dh	0x003F	// DoomBomberG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x00AA	// Junk-OG
	.db	0x01,0x01,0x02,0x05	:: .dh	0x000C	// GigaBaseG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle7D_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x05	:: .dh	0x014C	// Dragon Shadow
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle7E_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0146	// Leo Shadow
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle7F_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x03,0x03	:: .dh	0x0023	// WibbledooG
	.db	0x01,0x01,0x02,0x04	:: .dh	0x005A	// Jammer2
	.db	0x01,0x01,0x01,0x05	:: .dh	0x0037	// LupiNatraG
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle80_objects:
@battle81_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x014F	// Hollow
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle82_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0145	// Leo Kingdom SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle83_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x05	:: .dh	0x014B	// Dragon Sky SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle84_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0143	// Leo Kingdom
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle85_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x05	:: .dh	0x0149	// Dragon Sky
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle90_objects:	// OW virus - Power Module
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x03	:: .dh	0x005C	// JammerG
	.db	0x01,0x01,0x01,0x04	:: .dh	0x005D	// Jammer2G
	.db	0x01,0x01,0x03,0x05	:: .dh	0x005E	// Jammer3G
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle91_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0103	// Taurus Fire SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle92_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0109	// Cygnus Wing SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle93_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x010F	// Harp Note SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle94_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0115	// Libra Scales SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle95_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x011B	// Queen Ophiuca SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle96_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x01,0x04	:: .dh	0x0121	// Gemini Spark SP B
	.db	0x01,0x01,0x03,0x04	:: .dh	0x0124	// Gemini Spark SP W
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle97_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x012D	// Cancer Bubble SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle98_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0133	// Wolf Woods SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle99_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0139	// Crown Thunder SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle9A_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x014F	// Hollow
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle9B_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x013F	// Pegasus Magic SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle9C_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0145	// Leo Kingdom SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle9D_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x05	:: .dh	0x014B	// Dragon Sky SP
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000

@battle9E_objects:
	.db	0x00,0x00,0x02,0x01	:: .dh	0x0000	// Mega Man
	.db	0x01,0x01,0x02,0x04	:: .dh	0x0127	// Andromeda Infinity
	.db	0x03,0x00,0x00,0x00	:: .dh	0x0000


common_extraEnemies:
	// Version, boss, ???, G size, family
	// Hollow
	.db	0x0, 0x1, 0x2, 0x0	:: .dh	0xE
	.db	0x1, 0x1, 0x2, 0x0	:: .dh  0xE
	.db	0x2, 0x1, 0x2, 0x0	:: .dh	0xE
	.db	0x3, 0x1, 0x2, 0x1	:: .dh	0xE
	.db	0x4, 0x1, 0x2, 0x1	:: .dh	0xE
	.db	0x5, 0x1, 0x2, 0x1	:: .dh	0xE


.align 2
common_spBossAreas:
	.dh	0x9000	// Taurus Fire
	.dh	0x9103	// Cygnus Wing
	.dh	0x9007	// Harp Note
	.dh	0x9205	// Libra Scales
	.dh	0x9300	// Queen Ophiuca
	.dh	0x9401	// Gemini Spark
	.dh	0x9600	// Pegasus Magic
	.dh	0x9601	// Leo Kingdom
	.dh	0x9602	// Dragon Sky
	.dh	0x0000	// end

.align 2
common_spBossAppearFlags:
	.dh	0xB0	// Beat Taurus Fire EX
	.dh	0xB2	// Beat Cygnus Wing EX
	.dh	0xB4	// Beat Harp Note EX
	.dh	0xB6	// Beat Libra Scales EX
	.dh	0xB8	// Beat Queen Ophiuca EX
	.dh	0xBA	// Beat Gemini Spark EX
	.dh	0xF109	// Beat Pegasus Magic EX
	.dh	0xF10B	// Beat Leo Kingdom EX
	.dh	0xF10D	// Beat Dragon Sky EX

.align 2
common_spBossBeatFlags:
	.dh	0x48	// Beat Taurus Fire SP
	.dh	0x49	// Beat Cygnus Wing SP
	.dh	0x4A	// Beat Harp Note SP
	.dh	0x4B	// Beat Libra Scales SP
	.dh	0x4C	// Beat Queen Ophiuca SP
	.dh	0x4D	// Beat Gemini Spark SP
	.dh	0x4F	// Beat Cancer Bubble SP
	.dh	0x50	// Beat Wolf Woods SP
	.dh	0x51	// Beat Crown Thunder SP
	.dh	0x52	// Beat Pegasus Magic SP
	.dh	0x53	// Beat Leo Kingdom SP
	.dh	0x54	// Beat Dragon Sky SP

.align 4
common_spBossRecordFlags:
	.dh	0x103, 0x48	// Taurus Fire SP
	.dh	0x109, 0x49	// Cygnus Wing SP
	.dh	0x10F, 0x4A	// Harp Note SP
	.dh	0x115, 0x4B	// Libra Scales SP
	.dh	0x11B, 0x4C	// Queen Ophiuca SP
	.dh	0x121, 0x4D	// Gemini Spark SP
	.dh	0x12D, 0x4F	// Cancer Bubble SP
	.dh	0x133, 0x50	// Wolf Woods SP
	.dh	0x139, 0x51	// Crown Thunder SP
	.dh	0x13F, 0x52	// Pegasus Magic SP
	.dh	0x145, 0x53	// Leo Kingdom SP
	.dh	0x14B, 0x54	// Dragon Sky SP
	.dh	0x0, 0x0


.align 4
common_extraShopText:
	.dw	((29 << 0x10) | (1218))		// mess_1218 (Ken Suther)
	.dw	((29 << 0x10) | (1215))		// mess_1215 (Common Navi)
	.dw	((29 << 0x10) | (1215))		// mess_1215 (Common Navi)
	.dw	((29 << 0x10) | (1216))		// mess_1216 (Speed Navi)
	.dw	((29 << 0x10) | (1216))		// mess_1216 (Speed Navi)
	.dw	((29 << 0x10) | (1216))		// mess_1216 (Speed Navi)
	.dw	((29 << 0x10) | (1215))		// mess_1215 (Common Navi)
	.dw	((29 << 0x10) | (1217))		// mess_1217 (Jammer)
	.dw	((29 << 0x10) | (1216))		// mess_1216 (Speed Navi)
	.dw	((29 << 0x10) | (1268))		// mess_1268 (Mr. Hertz)

.align 4
common_extraShopContents:
	.dw	0x20EBA4C
	.dw	0x20EB9EC
	.dw	0x20EB92C
	.dw	0x20EB98C
	.dw	0x20EB8CC
	.dw	0x20EB86C
	.dw	0x20EB80C
	.dw	0x20EBAAC
	.dw	0x20EB7AC
	.dw	common_starFragShop

.align 4
common_starFragShop:
	.db	0x01,0xFF	:: .dh	(251)	:: .dw	0xFFFFFF00,(10)		// StarTicket
	.db	0x01,0xFF	:: .dh	(3)	:: .dw	0xFFFFFF02,(20)		// HevyCannon *
	.db	0x01,0xFF	:: .dh	(9)	:: .dw	0xFFFFFF02,(35)		// Gatling3 *
	.db	0x01,0xFF	:: .dh	(99)	:: .dw	0xFFFFFF02,(45)		// SyncHook3 *
	.db	0x01,0xFF	:: .dh	(139)	:: .dw	0xFFFFFF02,(55)		// Invisible *
	.db	0x01,0xFF	:: .dh	(19)	:: .dw	0xFFFFFF02,(70)		// IceMeteor3 *
	.db	0x01,0xFF	:: .dh	(123)	:: .dw	0xFFFFFF02,(85)		// JamMachGun *
	.db	0x01,0x01	:: .dh	(239)	:: .dw	0xFFFFFF03,(150)	// DrknesHole


common_extraFolders:
	// 0x44 bytes per Extra Folder
	.db	0x38,0x54,0x52,0x41,0x26,0x4C,0x44,0x52	// "XtraFldr"
	.dh	(001) | (1 << 9) | 0x8000	// Cannon	[FAV]
	.dh	(001) | (1 << 9)		// Cannon
	.dh	(001) | (1 << 9)		// Cannon
	.dh	(004) | (1 << 9) | 0x8000	// PlasmaGun1	[FAV]
	.dh	(004) | (1 << 9)		// PlasmaGun1
	.dh	(004) | (1 << 9)		// PlasmaGun1
	.dh	(010) | (1 << 9) | 0x8000	// AirSpread	[FAV]
	.dh	(010) | (1 << 9)		// AirSpread
	.dh	(010) | (1 << 9)		// AirSpread
	.dh	(014) | (1 << 9) | 0x8000	// HeatBall	[FAV]
	.dh	(014) | (1 << 9)		// HeatBall
	.dh	(014) | (1 << 9)		// HeatBall
	.dh	(023) | (1 << 9)		// Sword
	.dh	(023) | (1 << 9)		// Sword
	.dh	(023) | (1 << 9)		// Sword
	.dh	(024) | (1 << 9)		// WideSword
	.dh	(024) | (1 << 9)		// WideSword
	.dh	(024) | (1 << 9)		// WideSword
	.dh	(025) | (1 << 9)		// LongSword
	.dh	(025) | (1 << 9)		// LongSword
	.dh	(025) | (1 << 9)		// LongSword
	.dh	(127) | (1 << 9)		// Recover10
	.dh	(127) | (1 << 9)		// Recover10
	.dh	(128) | (1 << 9)		// Recover30
	.dh	(128) | (1 << 9)		// Recover30
	.dh	(135) | (1 << 9)		// Barrier
	.dh	(135) | (1 << 9)		// Barrier
	.dh	(149) | (0 << 9) | 0x8000	// ParlyzPlus	[FAV]
	.dh	(150) | (0 << 9) | 0x8000	// Attack+10	[FAV]
	.dh	(150) | (0 << 9)		// Attack+10

	.db	0x30,0x45,0x47,0x41,0x26,0x4C,0x44,0x52	// "PegaFldr"
	.dh	(018) | (1 << 9)		// IceMeteor2
	.dh	(018) | (1 << 9)		// IceMeteor2
	.dh	(018) | (2 << 9)		// IceMeteor2 *
	.dh	(022) | (1 << 9)		// FreezNukle
	.dh	(022) | (1 << 9)		// FreezNukle
	.dh	(022) | (2 << 9)		// FreezNukle *
	.dh	(027) | (1 << 9) | 0x8000	// TidalEdge	[FAV]
	.dh	(027) | (1 << 9)		// TidalEdge
	.dh	(027) | (1 << 9)		// TidalEdge
	.dh	(035) | (1 << 9)		// JetAttack2
	.dh	(035) | (1 << 9)		// JetAttack2
	.dh	(055) | (1 << 9) | 0x8000	// WideWave1	[FAV]
	.dh	(055) | (1 << 9)		// WideWave1
	.dh	(055) | (1 << 9)		// WideWave1
	.dh	(064) | (1 << 9) | 0x8000	// StikyRain1	[FAV]
	.dh	(064) | (1 << 9)		// StikyRain1
	.dh	(092) | (1 << 9)		// BraveSwrd2
	.dh	(092) | (1 << 9)		// BraveSwrd2
	.dh	(092) | (1 << 9)		// BraveSwrd2
	.dh	(093) | (1 << 9) | 0x8000	// BraveSwrd3	[FAV]
	.dh	(093) | (1 << 9)		// BraveSwrd3
	.dh	(119) | (1 << 9)		// IceBurst
	.dh	(139) | (0 << 9)		// Invisible
	.dh	(139) | (2 << 9)		// Invisible *
	.dh	(145) | (0 << 9) | 0x8000	// IceStage	[FAV]
	.dh	(145) | (0 << 9)		// IceStage
	.dh	(145) | (0 << 9)		// IceStage
	.dh	(184) | (2 << 9)		// CygnusWing
	.dh	(185) | (2 << 9)		// CygnsWingEX
	.dh	(208) | (2 << 9) | 0x8000	// PegasusMgc	[FAV]

	.db	0x2C,0x45,0x4F,0x26,0x4C,0x44,0x52,0xE6	// "LeoFldr"
	.dh	(007) | (1 << 9) | 0x8000	// Gatling1	[FAV]
	.dh	(007) | (1 << 9)		// Gatling1
	.dh	(007) | (1 << 9)		// Gatling1
	.dh	(016) | (1 << 9) | 0x8000	// HeatBall3	[FAV]
	.dh	(016) | (1 << 9)		// HeatBall3
	.dh	(016) | (1 << 9)		// HeatBall3
	.dh	(026) | (1 << 9) | 0x8000	// BlazngEdge	[FAV]
	.dh	(026) | (1 << 9)		// BlazngEdge
	.dh	(026) | (1 << 9)		// BlazngEdge
	.dh	(044) | (1 << 9) | 0x8000	// FireRing2	[FAV]
	.dh	(044) | (1 << 9)		// FireRing2
	.dh	(044) | (1 << 9)		// FireRing2
	.dh	(051) | (1 << 9)		// FireBzook3
	.dh	(051) | (1 << 9)		// FireBzook3
	.dh	(051) | (2 << 9)		// FireBzook3 *
	.dh	(054) | (1 << 9)		// TailBurnr3
	.dh	(054) | (1 << 9)		// TailBurnr3
	.dh	(054) | (2 << 9)		// TailBurnr3 *
	.dh	(061) | (1 << 9) | 0x8000	// GreenInk	[FAV]
	.dh	(061) | (1 << 9)		// GreenInk
	.dh	(061) | (1 << 9)		// GreenInk
	.dh	(144) | (0 << 9)		// GrassStage
	.dh	(144) | (0 << 9)		// GrassStage
	.dh	(144) | (0 << 9)		// GrassStage
	.dh	(149) | (0 << 9)		// ParlyzPlus
	.dh	(149) | (0 << 9)		// ParlyzPlus
	.dh	(149) | (2 << 9)		// ParlyzPlus *
	.dh	(181) | (2 << 9)		// TaurusFire
	.dh	(182) | (2 << 9)		// TaursFireEX
	.dh	(211) | (2 << 9) | 0x8000	// LeoKingdom	[FAV]

	.db	0x24,0x52,0x47,0x4E,0x26,0x4C,0x44,0x52	// "DrgnFldr"
	.dh	(029) | (1 << 9) | 0x8000	// ArboEdge	[FAV]
	.dh	(029) | (1 << 9)		// ArboEdge
	.dh	(029) | (1 << 9)		// ArboEdge
	.dh	(063) | (1 << 9) | 0x8000	// PurpleInk	[FAV]
	.dh	(063) | (1 << 9)		// PurpleInk
	.dh	(063) | (1 << 9)		// PurpleInk
	.dh	(083) | (1 << 9)		// MopLance2
	.dh	(083) | (1 << 9)		// MopLance2
	.dh	(083) | (2 << 9)		// MopLance2 *
	.dh	(086) | (1 << 9)		// Fokx-Fu2
	.dh	(086) | (1 << 9)		// Fokx-Fu2
	.dh	(086) | (2 << 9)		// Fokx-Fu2 *
	.dh	(090) | (1 << 9) | 0x8000	// VulcnSeed3	[FAV]
	.dh	(090) | (1 << 9)		// VulcnSeed3
	.dh	(090) | (1 << 9)		// VulcnSeed3
	.dh	(120) | (1 << 9)		// PoisBurst
	.dh	(120) | (1 << 9)		// PoisBurst
	.dh	(121) | (1 << 9) | 0x8000	// TyphnDance	[FAV]
	.dh	(121) | (1 << 9)		// TyphnDance
	.dh	(121) | (1 << 9)		// TyphnDance
	.dh	(124) | (1 << 9)		// Whistle
	.dh	(124) | (2 << 9)		// Whistle *
	.dh	(133) | (1 << 9)		// Recover300
	.dh	(133) | (1 << 9)		// Recover300
	.dh	(133) | (2 << 9)		// Recover300 *
	.dh	(148) | (0 << 9) | 0x8000	// HolyPanel	[FAV]
	.dh	(148) | (0 << 9)		// HolyPanel
	.dh	(193) | (2 << 9)		// QnOphiuca
	.dh	(194) | (2 << 9)		// QnOphiucaEX
	.dh	(214) | (2 << 9) | 0x8000	// DragonSky	[FAV]

	.db	0x33,0x55,0x4E,0x26,0x4C,0x44,0x52,0xE6	// "SunFldr"
	.dh	(009) | (1 << 9)		// Gatling3
	.dh	(009) | (1 << 9)		// Gatling3
	.dh	(009) | (2 << 9)		// Gatling3 *
	.dh	(065) | (1 << 9)		// StikyRain2
	.dh	(065) | (1 << 9)		// StikyRain2
	.dh	(065) | (1 << 9)		// StikyRain2
	.dh	(077) | (1 << 9)		// FlickrKck2
	.dh	(077) | (1 << 9)		// FlickrKck2
	.dh	(077) | (1 << 9)		// FlickrKck2
	.dh	(089) | (1 << 9)		// VulcnSeed2
	.dh	(089) | (1 << 9)		// VulcnSeed2
	.dh	(089) | (1 << 9)		// VulcnSeed2
	.dh	(137) | (1 << 9) | 0x8000	// Barrier200	[FAV]
	.dh	(137) | (1 << 9)		// Barrier200
	.dh	(150) | (0 << 9)		// Attack+10
	.dh	(150) | (0 << 9)		// Attack+10
	.dh	(150) | (2 << 9)		// Attack+10 *
	.dh	(151) | (1 << 9) | 0x8000	// SolarGun	[FAV]
	.dh	(151) | (1 << 9)		// SolarGun
	.dh	(152) | (1 << 9) | 0x8000	// SolarGunV2	[FAV]
	.dh	(152) | (1 << 9)		// SolarGunV2
	.dh	(153) | (1 << 9) | 0x8000	// SolarGunV3	[FAV]
	.dh	(153) | (2 << 9)		// SolarGunV3 *
	.dh	(157) | (1 << 9) | 0x8000	// Ursula	[FAV]
	.dh	(158) | (1 << 9)		// UrsulaV2
	.dh	(159) | (2 << 9)		// UrsulaV3 *
	.dh	(160) | (1 << 9) | 0x8000	// Tove		[FAV]
	.dh	(161) | (1 << 9)		// ToveV2
	.dh	(162) | (2 << 9)		// ToveV3 *
	.dh	(188) | (2 << 9)		// HarpNoteEX

	.db	0x24,0x41,0x52,0x4B,0x26,0x4C,0x44,0x52	// "DarkFldr"
	.dh	(013) | (1 << 9) | 0x8000	// RdrMissil3	[FAV]
	.dh	(013) | (1 << 9)		// RdrMissil3
	.dh	(013) | (1 << 9)		// RdrMissil3
	.dh	(021) | (1 << 9)		// PoisNukle
	.dh	(021) | (1 << 9)		// PoisNukle
	.dh	(021) | (1 << 9)		// PoisNukle
	.dh	(030) | (1 << 9)		// BreakSabre
	.dh	(030) | (1 << 9)		// BreakSabre
	.dh	(041) | (1 << 9)		// GhstPulse2
	.dh	(041) | (1 << 9)		// GhstPulse2
	.dh	(041) | (1 << 9)		// GhstPulse2
	.dh	(063) | (1 << 9)		// PurpleInk
	.dh	(063) | (1 << 9)		// PurpleInk
	.dh	(063) | (2 << 9)		// PurpleInk *
	.dh	(117) | (1 << 9)		// BrsrkSwrd3
	.dh	(117) | (1 << 9)		// BrsrkSwrd3
	.dh	(117) | (2 << 9)		// BrsrkSwrd3 *
	.dh	(154) | (1 << 9) | 0x8000	// DrknesSwrd	[FAV]
	.dh	(154) | (1 << 9)		// DrknesSwrd
	.dh	(155) | (1 << 9) | 0x8000	// DrknsSrdV2	[FAV]
	.dh	(155) | (1 << 9)		// DrknsSrdV2
	.dh	(156) | (1 << 9) | 0x8000	// DrknsSrdV3	[FAV]
	.dh	(156) | (2 << 9)		// DrknsSrdV3 *
	.dh	(166) | (1 << 9) | 0x8000	// Ezra		[FAV]
	.dh	(167) | (1 << 9)		// EzraV2
	.dh	(168) | (2 << 9)		// EzraV3 *
	.dh	(163) | (1 << 9) | 0x8000	// Alexander	[FAV]
	.dh	(164) | (1 << 9)		// AlexandrV2
	.dh	(165) | (2 << 9)		// AlexandrV3 *
	.dh	(197) | (2 << 9)		// GemnSpkEX

	.db	0x2C,0x47,0x4E,0x44,0x26,0x4C,0x44,0x52	// "LgndFldr"
	.dh	(020) | (1 << 9)		// StunNukle
	.dh	(021) | (1 << 9)		// PoisNukle
	.dh	(022) | (1 << 9)		// FreezNukle
	.dh	(026) | (2 << 9)		// BlazngEdge *
	.dh	(027) | (2 << 9)		// TidalEdge *
	.dh	(028) | (2 << 9)		// StrikeEdge *
	.dh	(029) | (2 << 9)		// ArboEdge *
	.dh	(054) | (1 << 9)		// TailBurnr3
	.dh	(054) | (1 << 9)		// TailBurnr3
	.dh	(054) | (1 << 9)		// TailBurnr3
	.dh	(057) | (1 << 9)		// WideWave3
	.dh	(057) | (1 << 9)		// WideWave3
	.dh	(057) | (1 << 9)		// WideWave3
	.dh	(075) | (1 << 9)		// VolticEye3
	.dh	(075) | (1 << 9)		// VolticEye3
	.dh	(075) | (1 << 9)		// VolticEye3
	.dh	(084) | (1 << 9)		// MopLance3
	.dh	(084) | (1 << 9)		// MopLance3
	.dh	(084) | (1 << 9)		// MopLance3
	.dh	(122) | (1 << 9)		// JamminPnch
	.dh	(123) | (1 << 9)		// JamMachGun
	.dh	(124) | (1 << 9)		// Whistle
	.dh	(134) | (1 << 9) | 0x8000	// Recover300	[FAV]
	.dh	(134) | (1 << 9)		// Recover300
	.dh	(139) | (0 << 9) | 0x8000	// Invisible	[FAV]
	.dh	(139) | (0 << 9)		// Invisible
	.dh	(148) | (2 << 9) | 0x8000	// HolyPanel *	[FAV]
	.dh	(200) | (2 << 9) | 0x8000	// CancrBublEX	[FAV]
	.dh	(203) | (2 << 9) | 0x8000	// WolfWoodsEX	[FAV]
	.dh	(206) | (2 << 9) | 0x8000	// CrwnThndrEX	[FAV]


.align 4
@starFragTraderLists:
	.dw	@starFragTraderListA
	.dw	@starFragTraderListB
	.dw	@starFragTraderListC
	.dw	0x20F976E		// AMAKEN Foyer Card Trader SP
	.dw	0x20F97B0
	.dw	0x20F97F2

.align 2
@starFragTraderListA:
	.dh	(152) | (1 << 9)	// SolarGunV2
	.dh	(155) | (1 << 9)	// DarkSwrdV2
	.dh	(158) | (1 << 9)	// UrsulaV2
	.dh	(161) | (1 << 9)	// ToveV2
	.dh	(164) | (1 << 9)	// AlexandrV2
	.dh	(167) | (1 << 9)	// EzraV2
	.dh	(169) | (0 << 9)	// QuickGauge
	.dh	( 30) | (1 << 9)	// BreakSabre
	.dh	0xFFFF

.align 2
@starFragTraderListB:
	.dh	(152) | (1 << 9)	// SolarGunV2
	.dh	(155) | (1 << 9)	// DarkSwrdV2
	.dh	(158) | (1 << 9)	// UrsulaV2
	.dh	(161) | (1 << 9)	// ToveV2
	.dh	(164) | (1 << 9)	// AlexandrV2
	.dh	(167) | (1 << 9)	// EzraV2
	.dh	(121) | (1 << 9)	// TyphnDance
	.dh	(121) | (1 << 9)	// TyphnDance
	.dh	(122) | (1 << 9)	// JamminPnch
	.dh	(123) | (1 << 9)	// JamMachGun
	.dh	(148) | (0 << 9)	// HolyPanel
	.dh	(148) | (0 << 9)	// HolyPanel
	.dh	(138) | (1 << 9)	// Aura
	.dh	(138) | (1 << 9)	// Aura
	.dh	(137) | (1 << 9)	// Barrier200
	.dh	(137) | (1 << 9)	// Barrier200
	.dh	0xFFFF

.align 2
@starFragTraderListC:
	.dh	(151) | (1 << 9)	// SolarGunV2
	.dh	(154) | (1 << 9)	// DarkSwrdV2
	.dh	(157) | (1 << 9)	// UrsulaV2
	.dh	(160) | (1 << 9)	// ToveV2
	.dh	(163) | (1 << 9)	// AlexandrV2
	.dh	(166) | (1 << 9)	// EzraV2
	.dh	(170) | (0 << 9)	// SlowGauge
	.dh	(134) | (1 << 9)	// Recover300
	.dh	(136) | (1 << 9)	// Barrier100
	.dh	(118) | (1 << 9)	// GreenBurst
	.dh	(118) | (1 << 9)	// GreenBurst
	.dh	(119) | (1 << 9)	// IceBurst
	.dh	(119) | (1 << 9)	// IceBurst
	.dh	(120) | (1 << 9)	// PoisBurst
	.dh	(140) | (1 << 9)	// SpiritFury
	.dh	(141) | (1 << 9)	// PoisnApple
	.dh	0xFFFF


.endarea


.close
