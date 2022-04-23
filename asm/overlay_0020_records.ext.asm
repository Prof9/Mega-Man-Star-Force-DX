.align 2
records_initDatabase:
	// Can use: r4, r6, r7
	push	r14

	// Check database flag
	ldr	r1,=0xF10E
	bl	0x202409C	// check flag
	beq	@@normal

	ldr	r6,=records_indexList
	ldr	r7,=records_databaseEntries
	mov	r4,0x0
	strb	r4,[r5,0xC]

	// Set flag for Mettenna (safety)
	ldrh	r1,[r7,0x4]
	bl	0x2024018	// set flag

	// Check enemies defeated
@@loop:
	cmp	r4,0x58
	bgt	@@checkDeleted

	ldr	r1,=0xF174
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@addToList

@@checkDeleted:
	lsl	r0,r4,0x3
	add	r0,0x4
	ldrh	r1,[r7,r0]
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@next

@@addToList:
	ldrb	r0,[r5,0xC]
	strb	r4,[r6,r0]
	add	r0,0x1
	strb	r0,[r5,0xC]
@@next:
	add	r4,0x1
	cmp	r4,(104)
	blt	@@loop

	mov	r6,0x0		// no stars

	// Check all enemies defeated
	ldrb	r0,[r5,0xC]
	cmp	r0,(104)
	bne	@@setStars
	mov	r6,0x1		// silver star

	// Check all enemies counter hit
	mov	r4,0x0
@@counterLoop:
	lsl	r0,r4,0x3
	add	r0,0x6
	ldrh	r1,[r7,r0]	// counter flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@setStars
@@counterNext:
	add	r4,0x1
	cmp	r4,(104)
	blt	@@counterLoop

	mov	r6,0x2		// silver and gold star

@@setStars:
	add	r1,=records_stars
	str	r6,[r1]
	add	r1,=records_starsTimer
	mov	r0,0x0
	str	r0,[r1]

@@settings:
	// Disable view ranks
	mov	r0,0x0
	str	r0,[r5,0x2C]
	// Initialize text archive
//	mov	r0,0x0
	str	r0,[r5,0x34]
	str	r0,[r5,0x38]

	// Set Database mode
	mov	r0,0x1
	strh	r0,[r5,0x30]
	// Enable refresh
//	mov	r0,0x1
	str	r0,[r5,0x24]
	// Enable small cards
//	mov	r0,0x1
	str	r0,[r5,0x28]

//	mov	r0,0x1
	pop	r15

@@normal:
	mov	r4,0x0
	mov	r6,r5
	strb	r4,[r5,0xC]
	mov	r0,0x0
	pop	r15


.align 2
records_loadGfx:
	push	r0,r4-r6,r14	// push extra for allocation
	mov	r5,r0

//	mov	r0,r5
	bl	0x21B155C

	ldr	r4,[r5,0x14]	// free OAM
	strh	r4,[r5,0x32]	// start of own tiles

	ldrh	r0,[r5,0x30]
	cmp	r0,0x0
	beq	@@end

	// Load palette file
	ldr	r0,=0x211C998
	ldr	r1,=((34 << 16) | (6))	// subscreen_record_local_6
	bl	0x2012518	// allocate and load file
	mov	r6,r0

	// Copy palette to VRAM
	mov	r0,(filesize(TEMP+"/counter-hit.pal.bin"))
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r2,0x6
	mov	r3,r6
	bl	0x202F338

	// Unload palette file
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r6
	bl	0x2015620

	// Load tiles file
	ldr	r0,=0x211C998
	ldr	r1,=((34 << 16) | (7))	// subscreen_record_local_7
	bl	0x2012518	// allocate and load file
	mov	r6,r0

	// Copy tiles to VRAM
	mov	r2,r4
	mov	r0,(filesize(TEMP+"/counter-hit.img.bin") >> 0x5)
	lsl	r0,r0,0x5
	add	r4,r4,r0
	str	r0,[sp]
	ldr	r0,=0x21239A4
	mov	r1,0x1
	mov	r3,r6
	bl	0x202F0F4

	// Unload tiles file
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r6
	bl	0x2015620

	// Store new free VRAM offset
	str	r4,[r5,0x14]

@@end:
	pop	r0,r4-r6,r15


	.pool


.align 2
records_drawLabels:
	ldrh	r2,[r5,0x30]
	cmp	r2,0x0
	bne	@@database
	mov	r1,0x0
	ldr	r0,[r0]
	bx	r14

@@database:
	bl	0x21B17CC


.align 2
records_drawStars:
	push	r7,r14
	sub	sp,0x8

	ldrh	r0,[r5,0x30]
	cmp	r0,0x0
	beq	@@end

	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]

	// Animation frame
	mov	r7,0x0
	add	r0,=records_starsTimer
	ldr	r0,[r0]
	cmp	r0,0x20
	blt	@@checkStars
	cmp	r0,0x26
	bge	@@checkStars
	sub	r0,0x1E
	lsr	r7,r0,0x1
	lsl	r7,r7,0x1

@@checkStars:
	add	r0,=records_stars
	ldr	r0,[r0]
	cmp	r0,0x1
	blt	@@end
	bgt	@@twoStars

@@oneStar:
	ldr	r2,=0x40E30003	// position, shape
	ldrh	r3,[r5,0x32]	// start of own tiles
	lsr	r3,r3,0x6
	add	r3,0x6
	add	r3,r3,r7
	mov	r0,((0x6 << 0x2) | (2))	// palette, priority
	lsl	r0,r0,0xA
	orr	r3,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40
	b	@@timer

@@twoStars:
	ldr	r2,=0x40D90003	// position, shape
	ldrh	r3,[r5,0x32]	// start of own tiles
	lsr	r3,r3,0x6
	add	r3,0x6
	add	r3,r3,r7
	mov	r0,((0x6 << 0x2) | (2))	// palette, priority
	lsl	r0,r0,0xA
	orr	r3,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

	ldr	r2,=0x40EC0003	// position, shape
	ldrh	r3,[r5,0x32]	// start of own tiles
	lsr	r3,r3,0x6
	add	r3,0xE
	add	r3,r3,r7
	mov	r0,((0x6 << 0x2) | (2))	// palette, priority
	lsl	r0,r0,0xA
	orr	r3,r0
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

@@timer:
	add	r1,=records_starsTimer
	ldr	r0,[r1]
	add	r0,0x1
	lsl	r0,r0,0x19
	lsr	r0,r0,0x19
	str	r0,[r1]

@@end:
	ldr	r0,[r5,0x14]
	mov	r4,0x40
	add	sp,0x8
	pop	r7,r15


.align 2
records_drawDatabase:
	lsl	r1,r7,0x1
	ldrh	r0,[r0,r1]

	ldrh	r2,[r5,0x30]
	cmp	r2,0x0
	bne	@@database
	bl	0x21B1B9E

@@database:
	// Check if enemy deleted
	ldr	r1,=records_databaseEntries
	lsl	r0,r7,0x3
	add	r0,0x4
	ldrh	r1,[r1,r0]
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Check if enemy countered
	ldr	r1,=records_databaseEntries
	lsl	r0,r7,0x3
	add	r0,0x6
	ldrh	r1,[r1,r0]
	bl	0x202409C	// check flag
	beq	@@end

	// Draw Counter Hit
	sub	sp,0x8

	ldr	r2,=0x80B54022	// base position, shape
	mov	r0,0x28
	mul	r0,r6		// y * 40
	add	r2,r2,r0
	ldrh	r3,[r5,0x32]	// start of own tiles
	lsr	r3,r3,0x6
	mov	r0,((0x6 << 0x2) | (2))	// palette, priority
	lsl	r0,r0,0xA
	orr	r3,r0

	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

	ldr	r2,=0x40D50022	// base position, shape
	mov	r0,0x28
	mul	r0,r6		// y * 40
	add	r2,r2,r0
	ldrh	r3,[r5,0x32]	// start of own tiles
	lsr	r3,r3,0x6
	add	r3,0x4
	mov	r0,((0x6 << 0x2) | (2))	// palette, priority
	lsl	r0,r0,0xA
	orr	r3,r0

	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	ldr	r0,=0x211CDC0
	mov	r1,0x1
	bl	0x1FF8F40

	// Go to draw card
	add	sp,0x8
@@end:
	bl	0x21B1BF6


.align 2
records_selectEnemy:
	ldrh	r3,[r0,0x30]
	cmp	r3,0x0
	beq	@@end
	ldr	r1,=records_databaseTextHandler|1
//	mov	r2,0x0

@@end:
	ldr	r3,=0x21B0DD9
	bx	r3


.align 2
records_databaseTextHandler:
	push	r4-r7,r14
	sub	sp,0x24
	mov	r4,r0		// this

	// Set up start script call
	mov	r0,0x1
	str	r0,[sp]
	lsl	r0,r0,0xB	// 0x800
	str	r0,[sp,0x4]
	mov	r0,(0xF000 >> 0xC)
	lsl	r0,r0,0xC
	str	r0,[sp,0x8]
	mov	r0,0xE
	str	r0,[sp,0xC]
	mov	r0,0xD
	str	r0,[sp,0x10]

	// Get enemy data
	mov	r0,0x10
	mov	r1,0x12
	ldsh	r0,[r4,r0]	// cursor position
	ldsh	r1,[r4,r1]	// scroll position
	add	r0,r0,r1
	add	r1,=records_indexList
	ldrb	r5,[r1,r0]	// enemy index
	lsl	r0,r5,0x3
	add	r6,=records_databaseEntries
	add	r6,r6,r0	// enemy data

	// Handle state
	ldrb	r0,[r4,0x4]	// state
	cmp	r0,0x1
	beq	@@state1
	bgt	@@state2

@@state0:
	// Set cursor animation
	mov	r0,r4
	add	r0,0x48
	mov	r1,0x1
	bl	0x2020570

	ldrh	r1,[r6,0x4]	// delete flag
	bl	0x202409C
	cmp	r0,0x0
	bne	@@showEnemyMenu

	// Start script 42
	ldr	r0,[r4,0x18]
	mov	r1,(42)
	strb	r1,[r4,0xE]	// script
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470

	// Set state
	mov	r0,0x2
	strb	r0,[r4,0x4]	// state
	b	@@end

@@showEnemyMenu:
	// Buffer enemy name (buffer 0)
	mov	r0,0x0
	ldrh	r1,[r6]		// enemy ID
	ldr	r2,=0x11F	// Gemini Spark
	cmp	r1,r2
	bne	@@bufferName
	ldr	r1,=0x1FF	// full name
@@bufferName:
	bl	0x2008DF0

	// Start script 40
	ldr	r0,[r4,0x18]
	mov	r1,(40)
	strb	r1,[r4,0xE]	// script
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470

	// Set state
	mov	r0,0x1
	strb	r0,[r4,0x4]	// state
	b	@@end

@@state2:
	// Check if waitHold reached
	mov	r0,(0x100000 >> 0x14)
	lsl	r0,r0,0x14
	bl	0x2008DAC
	beq	@@end

	// Set state
	mov	r0,0x1
	strb	r0,[r4,0x4]	// state

	// Base text archive
	ldr	r7,=((29 << 0x10) | (1262))

	b	@@areaInfo

@@state1:
	// Check if waitHold reached
	mov	r0,(0x100000 >> 0x14)
	lsl	r0,r0,0x14
	bl	0x2008DAC
	beq	@@checkEnd

	// Base text archive
	ldr	r7,=((29 << 0x10) | (1262))

	// Get choice
	bl	0x2008DC0
	cmp	r0,0x1
//	blt	@@battleInfo
	beq	@@rewardInfo
	bgt	@@areaInfo

@@battleInfo:
//	add	r7,0x0		// mess_1262

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@unloadInfoText

	// Legend Mode text archive
	add	r7,(1272 - 1262)// mess_1272
	b	@@unloadInfoText

@@rewardInfo:
	add	r7,0x1		// mess_1263

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@unloadInfoText

	add	r7,(1273 - 1263)// mess_1273
	b	@@unloadInfoText

@@areaInfo:
	add	r7,0x2		// mess_1264
//	b	@@unloadInfoTest

@@unloadInfoText:
	// Load correct text archive if different
	ldr	r0,[r4,0x34]
	cmp	r0,r7
	beq	@@startInfoText

	// Unlock current text archive
	cmp	r0,0x0
	beq	@@loadInfoText

	// Free from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	ldr	r2,[r4,0x38]	// text archive buffer
	bl	0x2015620

@@loadInfoText:
	str	r7,[r4,0x34]	// text archive file
	ldr	r0,=0x211C998
	mov	r1,r7
	bl	0x2012518	// allocate and load file
	str	r0,[r4,0x38]	// text archive buffer

@@startInfoText:
	ldr	r0,[r4,0x38]	// text archive buffer
	mov	r1,r5		// enemy index
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470

	b	@@end

@@checkEnd:
	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@close

	// Check if end reached
	bl	0x2008D9C
	bne	@@end

@@abort:
	// Set cursor animation
	mov	r0,r4
	add	r0,0x48
	mov	r1,0x1
	bl	0x2020570

	// Change to different state function
	mov	r0,r4
	ldr	r1,=0x21B0FF9
	mov	r2,0x0
	bl	0x21B0DD8

	// Unload text archive
	ldr	r0,[r4,0x34]
	cmp	r0,0x0
	beq	@@end

	// Free from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	ldr	r2,[r4,0x38]	// text archive buffer
	bl	0x2015620

	mov	r0,0x0
	str	r0,[r4,0x34]	// text archive file
	str	r0,[r4,0x38]	// text archive buffer

	b	@@end

@@close:
	ldr	r0,[r4,0x38]	// text archive buffer
	cmp	r0,0x0
	beq	@@end
	mov	r1,(253)
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470

@@end:
	mov	r0,0x1
	add	sp,0x24
	pop	r4-r7,r15


.align 2
records_getName:
	push	r14
	ldr	r2,[sp,0x1C]	// original r0
	ldrh	r2,[r2,0x30]
	cmp	r2,0x0
	bne	@@database
	lsl	r2,r4,0x1
	ldrh	r1,[r1,r2]
	b	@@end

@@database:
	add	r1,=records_databaseEntries
	lsl	r2,r4,0x3
	add	r2,0x4
	ldrh	r1,[r1,r2]	// delete flag
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@getActualName

	// Get boss names
	bl	0x2009700	// r0 = boss names

	// Load name from boss names
	mov	r1,(252)
	b	@@end

@@getActualName:
	// Get boss names
	bl	0x2009700	// r0 = boss names

	add	r1,=records_databaseEntries
	lsl	r2,r4,0x3
	ldrh	r1,[r1,r2]

	cmp	r1,0xFF
	bgt	@@checkBoss	// will be & 0xFF later

	// Get normal virus names
	push	r1
	bl	0x20096EC	// r0 = virus names
	pop	r1
	b	@@end

@@checkBoss:
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	cmp	r1,0x1F		// Gemini Spark
	bne	@@end
	mov	r1,0xFF		// Full name

@@end:
	pop	r15


.align 2
records_getNameY:
	add	r0,0x3
	ldr	r1,[sp,0x18]	// original r0
	ldrh	r1,[r1,0x30]
	cmp	r1,0x0
	beq	@@end

	add	r0,0x1
@@end:
	str	r0,[sp,0xC]
	bx	r14


.align 2
records_getCard:
	// r0 = entry ID
	ldrh	r2,[r6,0x30]
	cmp	r2,0x0
	bne	@@database

	lsl	r0,r0,0x1
	b	@@end

@@database:
	add	r1,=records_databaseEntries
	lsl	r0,r0,0x3
	add	r0,0x2
@@end:
	ldrh	r0,[r1,r0]
	bx	r14


.align 2
records_showHideCard:
	push	r14
	bl	0x20207EC

	ldrh	r2,[r6,0x30]
	cmp	r2,0x0
	beq	@@end

@@database:
	ldr	r0,[sp,(0x1C+0x4)]
	add	r1,=records_databaseEntries
	lsl	r0,r0,0x3
	add	r0,0x4
	ldrh	r1,[r1,r0]
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

	// Hide sprite
	add	r0,r5,r4
	bl	0x2020688

@@end:
	pop	r15


.align 2
records_getIndexes:
	// r0 = offset
	push	r4,r14
	add	r4,=records_indexList
	add	r0,r4,r0
	pop	r4,r15


	.pool


.align 4
records_stars:
	.dw	0x0
records_starsTimer:
	.dw	0x0
records_indexList:
	.fill	(104)


.align 4
records_databaseEntries:
	// Enemy ID, card ID, entry flag, counter flag
	.dh	0x0001, 0x001F, 0xF040, 0xF09A	// 00	Mettenna
	.dh	0x0002, 0x0020, 0xF041, 0xF09B	// 01	Mettenna2
	.dh	0x0003, 0x0021, 0xF042, 0xF09C	// 02	Mettenna3
	.dh	0x0007, 0x0025, 0xF043, 0xF09D	// 03	CannonBase
	.dh	0x0008, 0x0026, 0xF044, 0xF09E	// 04	MegaBase
	.dh	0x0009, 0x0027, 0xF045, 0xF09F	// 05	GigaBase
	.dh	0x008F, 0x0034, 0xF046, 0xF0A0	// 06	Melamander
	.dh	0x0090, 0x0035, 0xF047, 0xF0A1	// 07	Melalizard
	.dh	0x0091, 0x0036, 0xF048, 0xF0A2	// 08	Melaleon
	.dh	0x0019, 0x002B, 0xF049, 0xF0A3	// 09	HotRoader
	.dh	0x001A, 0x002C, 0xF04A, 0xF0A4	// 0A	HotMotor
	.dh	0x001B, 0x002D, 0xF04B, 0xF0A5	// 0B	HotBiker
	.dh	0x0013, 0x0028, 0xF04C, 0xF0A6	// 0C	Peekaboo
	.dh	0x0014, 0x0029, 0xF04D, 0xF0A7	// 0D	Wavyboo
	.dh	0x0015, 0x002A, 0xF04E, 0xF0A8	// 0E	Shakyboo
	.dh	0x0047, 0x0046, 0xF04F, 0xF0A9	// 0F	ZapAce
	.dh	0x0048, 0x0047, 0xF050, 0xF0AA	// 10	ZapKing
	.dh	0x0049, 0x0048, 0xF051, 0xF0AB	// 11	ZapJoker
	.dh	0x001F, 0x0037, 0xF052, 0xF0AC	// 12	Wibbledee
	.dh	0x0020, 0x0038, 0xF053, 0xF0AD	// 13	Wibbledoo
	.dh	0x0021, 0x0039, 0xF054, 0xF0AE	// 14	Wibbledum
	.dh	0x000D, 0x0022, 0xF055, 0xF0AF	// 15	Crowcar
	.dh	0x000E, 0x0023, 0xF056, 0xF0B0	// 16	Crowket
	.dh	0x000F, 0x0024, 0xF057, 0xF0B1	// 17	Crowbus
	.dh	0x0025, 0x005B, 0xF058, 0xF0B2	// 18	MonoSword
	.dh	0x0026, 0x005C, 0xF059, 0xF0B3	// 19	MonoSwordin
	.dh	0x0027, 0x005D, 0xF05A, 0xF0B4	// 1A	MonoSwordil
	.dh	0x0031, 0x0064, 0xF05B, 0xF0B5	// 1B	LuPelvis
	.dh	0x0032, 0x0065, 0xF05C, 0xF0B6	// 1C	LupiNatra
	.dh	0x0033, 0x0066, 0xF05D, 0xF0B7	// 1D	LupaDonna
	.dh	0x0034, 0x00DD, 0xF05E, 0xF0B8	// 1E	LuPavarot
	.dh	0x0035, 0x00DE, 0xF05F, 0xF0B9	// 1F	LupBach
	.dh	0x003B, 0x002E, 0xF060, 0xF0BA	// 20	DoomCount
	.dh	0x003C, 0x002F, 0xF061, 0xF0BB	// 21	DoomBomber
	.dh	0x003D, 0x0030, 0xF062, 0xF0BC	// 22	DoomPlosion
	.dh	0x004D, 0x0061, 0xF063, 0xF0BD	// 23	BellGong
	.dh	0x004E, 0x0062, 0xF064, 0xF0BE	// 24	BellRef
	.dh	0x004F, 0x0063, 0xF065, 0xF0BF	// 25	BellBoxer
	.dh	0x0083, 0x003D, 0xF066, 0xF0C0	// 26	OctoNinja
	.dh	0x0084, 0x003E, 0xF067, 0xF0C1	// 27	OctoIcer
	.dh	0x0085, 0x003F, 0xF068, 0xF0C2	// 28	OctoPoison
	.dh	0x0041, 0x0043, 0xF069, 0xF0C3	// 29	BoomBolt
	.dh	0x0042, 0x0044, 0xF06A, 0xF0C4	// 2A	BoomSpark
	.dh	0x0043, 0x0045, 0xF06B, 0xF0C5	// 2B	BoomThunder
	.dh	0x007D, 0x0031, 0xF06C, 0xF0C6	// 2C	Rocky
	.dh	0x007E, 0x0032, 0xF06D, 0xF0C7	// 2D	Craggy
	.dh	0x007F, 0x0033, 0xF06E, 0xF0C8	// 2E	Cliffy
	.dh	0x002B, 0x003A, 0xF06F, 0xF0C9	// 2F	StreamCancro
	.dh	0x002C, 0x003B, 0xF070, 0xF0CA	// 30	RiverCancro
	.dh	0x002D, 0x003C, 0xF071, 0xF0CB	// 31	SeaCancro
	.dh	0x009B, 0x0067, 0xF072, 0xF0CC	// 32	Moaian
	.dh	0x009C, 0x0068, 0xF073, 0xF0CD	// 33	Stonehead
	.dh	0x009D, 0x0069, 0xF074, 0xF0CE	// 34	GiantFace
	.dh	0x005F, 0x0040, 0xF075, 0xF0CF	// 35	Gooey
	.dh	0x0060, 0x0041, 0xF076, 0xF0D0	// 36	Goopy
	.dh	0x0061, 0x0042, 0xF077, 0xF0D1	// 37	Gloppy
	.dh	0x0095, 0x004C, 0xF078, 0xF0D2	// 38	Lampis
	.dh	0x0096, 0x004D, 0xF079, 0xF0D3	// 39	Lucis
	.dh	0x0097, 0x004E, 0xF07A, 0xF0D4	// 3A	Lumis
	.dh	0x006B, 0x0052, 0xF07B, 0xF0D5	// 3B	PrivateMop
	.dh	0x006C, 0x0053, 0xF07C, 0xF0D6	// 3C	ColonelMop
	.dh	0x006D, 0x0054, 0xF07D, 0xF0D7	// 3D	GeneralMop
	.dh	0x0065, 0x004F, 0xF07E, 0xF0D8	// 3E	RhinoHorn
	.dh	0x0066, 0x0050, 0xF07F, 0xF0D9	// 3F	RhinoHammer
	.dh	0x0067, 0x0051, 0xF080, 0xF0DA	// 40	RhinoDrill
	.dh	0x00A1, 0x0058, 0xF081, 0xF0DB	// 41	TropiConga
	.dh	0x00A2, 0x0059, 0xF082, 0xF0DC	// 42	TropiCoppa
	.dh	0x00A3, 0x005A, 0xF083, 0xF0DD	// 43	TropiCoola
	.dh	0x00A7, 0x005E, 0xF084, 0xF0DE	// 44	Junk-O
	.dh	0x00A8, 0x005F, 0xF085, 0xF0DF	// 45	Junk-O2
	.dh	0x00A9, 0x0060, 0xF086, 0xF0E0	// 46	Junk-O3
	.dh	0x0071, 0x0055, 0xF087, 0xF0E1	// 47	Fokx
	.dh	0x0072, 0x0056, 0xF088, 0xF0E2	// 48	CopyFokx
	.dh	0x0073, 0x0057, 0xF089, 0xF0E3	// 49	GuiseFokx
	.dh	0x0053, 0x006A, 0xF08A, 0xF0E4	// 4A	GreatAx
	.dh	0x0054, 0x006B, 0xF08B, 0xF0E5	// 4B	MagnaAx
	.dh	0x0055, 0x006C, 0xF08C, 0xF0E6	// 4C	KaiserAx
	.dh	0x0089, 0x0049, 0xF08D, 0xF0E7	// 4D	Eyez
	.dh	0x008A, 0x004A, 0xF08E, 0xF0E8	// 4E	GuardEyez
	.dh	0x008B, 0x004B, 0xF08F, 0xF0E9	// 4F	ProtectEyez
	.dh	0x00AD, 0x006D, 0xF090, 0xF0EA	// 50	Magera
	.dh	0x00AE, 0x006E, 0xF091, 0xF0EB	// 51	Mageri
	.dh	0x00AF, 0x006F, 0xF092, 0xF0EC	// 52	Magero
	.dh	0x0077, 0x0073, 0xF093, 0xF0ED	// 53	McCleaver
	.dh	0x0078, 0x0074, 0xF094, 0xF0EE	// 54	McDicer
	.dh	0x0079, 0x0075, 0xF095, 0xF0EF	// 55	McLopper
	.dh	0x00B3, 0x0070, 0xF096, 0xF0F0	// 56	Grabity
	.dh	0x00B4, 0x0071, 0xF097, 0xF0F1	// 57	Grabotron
	.dh	0x00B5, 0x0072, 0xF098, 0xF0F2	// 58	Grabaklone
	.dh	0x0059, 0x007A, 0xF099, 0xF0F3	// 59	Jammer
	.dh	0x0101, 0x00B5, 0x0062, 0xF0F4	// 5A	TaurusFire
	.dh	0x0107, 0x00B8, 0x0063, 0xF0F5	// 5B	CygnusWing
	.dh	0x010D, 0x00BB, 0x0064, 0xF0F6	// 5C	HarpNote
	.dh	0x0113, 0x00BE, 0x0065, 0xF0F7	// 5D	LibraScales
	.dh	0x0119, 0x00C1, 0x0066, 0xF0F8	// 5E	QueenOphiuca
	.dh	0x011F, 0x00C4, 0x0067, 0xF0F9	// 5F	GeminiSpark
	.dh	0x012B, 0x00C7, 0x1A8C, 0xF0FA	// 60	CancerBubble
	.dh	0x0131, 0x00CA, 0x1A97, 0xF0FB	// 61	WolfWoods
	.dh	0x0137, 0x00CD, 0x1AA2, 0xF0FC	// 62	CrownThunder
	.dh	0x0125, 0x00F7, 0xF173, 0xF0FD	// 63	Andromeda
	.dh	0x013D, 0x00D0, 0xF108, 0xF0FE	// 64	PegasusMagic
	.dh	0x0143, 0x00D3, 0xF10A, 0xF0FF	// 65	LeoKingdom
	.dh	0x0149, 0x00D6, 0xF10C, 0xF100	// 66	DragonSky
	.dh	0x014F, 0x00DF, 0xF136, 0xF101	// 67	Hollow
	.dh	0x0000