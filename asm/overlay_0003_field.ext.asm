.align 2
field_schoolCompSaveStepCounter:
	push	r14
	ldrb	r0,[r1]
	cmp	r0,0x1
	beq	@@end
	mov	r0,0x1
	strb	r0,[r1]

	// Save step counter
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldr	r1,[r1,0x68]	// step counter

	mov	r0,((0xF238 & 0xFFF) / 8 + 1)
	bl	common_set32BitExVar

@@end:
	pop	r15


.align 2
field_schoolCompRestoreStepCounter:
	push	r14
	ldrb	r0,[r1]
	cmp	r0,0x2
	beq	@@end
	mov	r0,0x2
	strb	r0,[r1]

	// Restore step counter
	mov	r0,((0xF238 & 0xFFF) / 8 + 1)
	bl	common_get32BitExVar

	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	str	r0,[r1,0x68]

@@end:
	pop	r15


.align 2
field_roboSnakeCompSaveStepCounter:
	push	r14
	bl	0x2024018	// set flag

	// Save step counter
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldr	r1,[r1,0x68]	// step counter

	mov	r0,((0xF238 & 0xFFF) / 8 + 1)
	bl	common_set32BitExVar

	pop	r15


.align 2
field_roboSnakeCompRestoreStepCounter:
	push	r0,r14

	// Get step counter
	mov	r0,((0xF238 & 0xFFF) / 8 + 1)
	bl	common_get32BitExVar
	mov	r2,r0

	pop	r0,r15


.align 2
field_prefillBoktaiMail:
	push	r7

	// Check if sending to Boktai Brother
	ldr	r0,=0xB08
	ldr	r0,[r4,r0]
	ldr	r1,=0x573
	ldrb	r0,[r0,r1]	// Brother Satellite
	cmp	r0,0x81
	bne	@@end

	// Check if has attachment
	ldr	r0,[r4,0x18]
	mov	r1,0x44
	ldrh	r7,[r0,r1]
	cmp	r7,0x0
	beq	@@noAttachment

	ldr	r3,=0x1028
	add	r3,r4,r3

@@hasAttachment:
	// Set subject entered
	mov	r0,0x1
	strb	r0,[r3,0x14]	// skip going to enter subject
	strb	r0,[r3,0x1C]	// skip going to enter body

	// Set Brother, subject, body and icon entered flags
	ldrb	r0,[r3,0x15]
	mov	r1,0xF
	orr	r0,r1
	strb	r0,[r3,0x15]

	// Set cursor to Send
	mov	r0,0x5
	strb	r0,[r3,0x10]

	// Set mail subject pointer
	ldr	r0,[r4,0x1C]
	str	r0,[r3,0x18]

	// Set mail subject to "Present"
	ldr	r1,=0x53455230
	ldr	r2,=0x544E45
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

	ldr	r3,=0x1028
	add	r3,r4,r3

	// Set mail body pointer
	ldr	r2,[r4,0x20]	// destination
	str	r2,[r3,0x18]

	// Get mail body
	sub	r1,r7,0x1
	mov	r3,0x2A		// size
	mul	r1,r3
	add	r0,=(@boktaiMailItem)
	add	r7,r0,r1
	// Copy mail body
	mov	r1,r7		// source
	bl	0x202DF90	// copy bytes

	// Store mail body
	ldr	r2,[r4,0x18]
	add	r2,0x19
	mov	r1,r7		// source
	mov	r3,0x2A		// size
	bl	0x202DF90

	// Display mail body
	mov	r0,0x1
	push	r0
	mov	r0,r4
	mov	r1,0x2B
	mov	r2,0xB
	lsl	r2,r2,0x8
	mov	r3,0x32
	lsl	r3,r3,0x4
	bl	0x2184D78
	add	sp,0x4

	// Skip to done state
	ldr	r0,=0x1028
	mov	r1,0x16
	strb	r1,[r4,r0]

	b	@@end

@@noAttachment:

@@end:
	pop	r7
	bl	0x2183434

	.pool

.align 4
@boktaiMailItem:
	// PMegaHed
	.db	0x26,0x4F,0x55,0x4E,0x44,0xE4,0x41,0xE4,0x52,0x41,0x52,0x45,0xE4,0xE4
	.db	0x02,0x30,0x2D,0x45,0x47,0x41,0x28,0x44,0x02,0x0E,0xE4,0xE4,0xE4,0xE4
	.db	0x27,0x4F,0xE4,0x47,0x45,0x54,0xE4,0x07,0x45,0x4D,0x01,0x00,0x00,0x00
	// DMegaBod
	.db	0x26,0x4F,0x55,0x4E,0x44,0xE4,0x41,0xE4,0x52,0x41,0x52,0x45,0xE4,0xE4
	.db	0x02,0x24,0x2D,0x45,0x47,0x41,0x22,0x4F,0x44,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x27,0x4F,0xE4,0x47,0x45,0x54,0xE4,0x07,0x45,0x4D,0x01,0x00,0x00,0x00
	// LMegaLeg
	.db	0x26,0x4F,0x55,0x4E,0x44,0xE4,0x41,0xE4,0x52,0x41,0x52,0x45,0xE4,0xE4
	.db	0x02,0x2C,0x2D,0x45,0x47,0x41,0x2C,0x45,0x47,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x27,0x4F,0xE4,0x47,0x45,0x54,0xE4,0x07,0x45,0x4D,0x01,0x00,0x00,0x00
	// LEmblem
	.db	0x26,0x4F,0x55,0x4E,0x44,0xE4,0x41,0xE4,0x52,0x41,0x52,0x45,0xE4,0xE4
	.db	0x02,0x2C,0x25,0x4D,0x42,0x4C,0x45,0x4D,0x02,0x0E,0xE4,0xE4,0xE4,0xE4
	.db	0x27,0x4F,0xE4,0x47,0x45,0x54,0xE4,0x07,0x45,0x4D,0x01,0x00,0x00,0x00
	// Resurctv
	.db	0x29,0xE4,0x46,0x4F,0x55,0x4E,0x44,0xE4,0x54,0x48,0x49,0x53,0xE4,0xE4
	.db	0x02,0x32,0x45,0x53,0x55,0x52,0x43,0x54,0x56,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x28,0x4F,0x50,0x45,0xE4,0x49,0x54,0xE4,0x48,0x45,0x4C,0x50,0x53,0x01
	// EndurFrt
	.db	0x29,0xE4,0x46,0x4F,0x55,0x4E,0x44,0xE4,0x54,0x48,0x49,0x53,0xE4,0xE4
	.db	0x02,0x25,0x4E,0x44,0x55,0x52,0x26,0x52,0x54,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x28,0x4F,0x50,0x45,0xE4,0x49,0x54,0xE4,0x48,0x45,0x4C,0x50,0x53,0x01
	// Meteorit
	.db	0x29,0xE4,0x46,0x4F,0x55,0x4E,0x44,0xE4,0x54,0x48,0x49,0x53,0xE4,0xE4
	.db	0x02,0x2D,0x45,0x54,0x45,0x4F,0x52,0x49,0x54,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x28,0x4F,0x50,0x45,0xE4,0x49,0x54,0xE4,0x48,0x45,0x4C,0x50,0x53,0x01
	// Lunastel
	.db	0x29,0xE4,0x46,0x4F,0x55,0x4E,0x44,0xE4,0x54,0x48,0x49,0x53,0xE4,0xE4
	.db	0x02,0x2C,0x55,0x4E,0x41,0x53,0x54,0x45,0x4C,0x02,0x0E,0xE4,0xE4,0xE4
	.db	0x28,0x4F,0x50,0x45,0xE4,0x49,0x54,0xE4,0x48,0x45,0x4C,0x50,0x53,0x01


.align 4
field_megaScreenScrollFileSizes:
	.dw	0x5400, 0x200, 0x380, 0x140, 0x180


.align 2
field_skipSnakeCompGateSFX:
	push	r0-r1,r14

	// Check flag
	ldr	r1,=0xF18D
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r1
	bne	@@end

	// Play SFX
	bl	0x2025574
@@end:
	// Clear flag
	ldr	r1,=0xF18D
	bl	0x202405C

	pop	r15


.align 2
field_hazardBulls:
	// Old: 10-25
	// New: 25-40 (+15)
	push	r14
	bl	common_isLegendMode
	beq	@@end
	add	r0,(15)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15

.align 2
field_hazardStars:
	// Old: 5
	// New: 20 (+15)
	push	r14
	bl	common_isLegendMode
	beq	@@end
	add	r0,(15)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15

.align 2
field_hazardNotes:
	// Old: 20-40
	// New: 40-60 (+20)
	push	r14
	cmp	r0,0x0
	beq	@@end
	bl	common_isLegendMode
	beq	@@end
	add	r0,(20)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15

.align 2
field_hazardQuizzes:
	// Old: 10
	// New: 50 (+40)
	push	r14
	bl	common_isLegendMode
	beq	@@end
	add	r0,(40)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15

.align 2
field_hazardSnakes:
	// Old: 20
	// New: 50 (+30)
	push	r14
	bl	common_isLegendMode
	beq	@@end
	add	r0,(30)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15

.align 2
field_hazardPoison:
	// Old: 240 frames
	// New: 120 frames
	push	r14
	bl	common_isLegendMode
	beq	@@end
	mov	r1,(120)
@@end:
	// Calculate
	blx	0x20AEF8C
	pop	r15

.align 2
field_hazardBulldozers:
	// Old: 30
	// New: 100 (+70)
	push	r14
	bl	common_isLegendMode
	beq	@@end
	add	r0,(70)
@@end:
	// Take damage
	bl	0x2007E14
	pop	r15


.align 2
field_checkOverwriteBoktaiBrotherWithMail:
	push	r14
	add	r0,0x1
	strb	r1,[r4,r0]

	ldr	r1,=0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	bl	0x200BDC8	// get Boktai Brother type
	cmp	r0,0x81
	bne	@@end

	// Check if Cipher/Boktai mail sent
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFC
	ldrb	r1,[r0]
	cmp	r1,0x0
	beq	@@end		// delete OK

	// Check if sent to this Brother
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = Boktai Brother ID for mail
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1C

	ldr	r1,=0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	cmp	r0,r1
	bne	@@end

	// Start script
	mov	r0,r4
	mov	r1,(13)
	bl	0x2151ED4

	// Go to wait state
	ldr	r0,=0xAE5
	mov	r1,0x39
	strb	r1,[r4,r0]
	add	r0,0x1		// 0xAE6
	mov	r1,0x13
	strb	r1,[r4,r0]

@@end:
	pop	r15


.align 2
field_overwriteBoktaiBrotherWithRealBrother:
	push	r14
	ldr	r1,=0xAD8
	ldrb	r1,[r4,r1]	// Brother index
	add	r1,0x1
	bl	0x200BDC8	// get Boktai Brother type
	cmp	r0,0x81
	bne	@@normal

	mov	r1,(40)		// script 38 (no space)
	b	@@end

@@normal:
	mov	r1,(102)	// script 102

@@end:
	mov	r0,r4
	pop	r15


	.pool


.align 2
field_spawnBoktaiMysteryWave:
	ldr	r0,[r0]
	ldrb	r7,[r0]

	// Set active
	mov	r1,0x1
	strb	r1,[r4,0x4]

	bx	r14


.align 2
field_removeMailAttachment:
	push	r0,r14

	// Check if Cipher/Boktai mail sent
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	add	r0,0xFC
	ldrb	r1,[r0]
	cmp	r1,0x0
	beq	@@normal

	// Check if sent to Boktai Brother
	mov	r0,((0xF258 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0	// r0 = Boktai Brother ID for mail
	cmp	r0,0x0
	beq	@@normal

	// Don't remove attachment
	add	sp,0x8
	pop	r3,r15

@@normal:
	pop	r0
	ldr	r1,[r0,0x18]
	add	r1,0x44
	pop	r15


.align 2
field_emailSortMenuBackgroundCursor:
	ldr	r0,[r5,r0]
	cmp	r0,0x6
	beq	@@end

	// Inactive cursor while in sort menu
	add	r0,=@emailSortMenuState
	ldr	r0,[r0]
	cmp	r0,0x1
@@end:
	bx	r14

.align 2
field_emailSortMenuInit:
	push	r0,r14

	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	cmp	r0,0x0
	bne	@@end

	mov	r0,r4
	bl	field_emailSortMenuAllocSprite

@@end:
	pop	r0
	bl	0x2011C50
	pop	r15

.align 2
field_emailSortMenuAllocSprite:
	push	r4-r5,r14
	sub	sp,0xC
	mov	r4,r0

	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	cmp	r0,0x0
	bne	@@end

	// Initialize variables
	mov	r1,0x0
	add	r2,=@emailSortMenuState
	str	r1,[r2]
	add	r2,=@emailSortMenuCursorPosition
	str	r1,[r2]
	mov	r1,0xFF
	add	r2,=@emailSortMenuLastSort
	str	r1,[r2]

	// Set BG2 scroll
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x0
	mov	r3,0x4
	bl	0x200B5A8

	// Allocate Sort button sprite
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x4C
	bl	0x20155DC	// alloc on heap
	mov	r5,r0
	beq	@@end
	add	r1,=@emailSortMenuButtonSprite
	str	r5,[r1]

	// Get sprite file
	ldr	r0,[r4,0x10]
	mov	r1,0x3
	bl	0x2015E94	// buffer get
	mov	r3,r0

	// Init sprite
	ldr	r0,=0x4500	// VRAM OBJ tile offset
	str	r0,[sp]
	mov	r0,0x8		// palette
	str	r0,[sp,0x4]
	ldr	r0,=0x4000	// ???
	str	r0,[sp,0x8]
	mov	r0,r5
	mov	r1,0x1		// screen
	mov	r2,0x5		// color mode = 4BPP
	bl	0x202042C	// init sprite

	// Set sprite animation
	mov	r0,r5
	mov	r1,(30)
	bl	0x2020570	// set animation

	// Set sprite priority
	mov	r0,r5
	mov	r1,0x2
	bl	0x202072C	// set priority

	// Show sprite
	mov	r0,r5
	bl	0x202067C	// show sprite

@@end:
	add	sp,0xC
	pop	r4-r5,r15

.align 2
field_emailSortMenuClose:
	// Free sort button sprite from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	add	r2,=@emailSortMenuButtonSprite
	ldr	r2,[r2]
	cmp	r2,0x0
	beq	@@end
	bl	0x2015620	// free from heap

@@end:
	add	r1,=@emailSortMenuButtonSprite
	mov	r0,0x0
	str	r0,[r1]

	mov	r0,0x0
	pop	r4,r15

.align 2
field_emailSortMenuCompose:
	push	r14

	mov	r1,0xB
	str	r1,[r4,r0]

	// Free sort button sprite from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	add	r2,=@emailSortMenuButtonSprite
	ldr	r2,[r2]
	cmp	r2,0x0
	beq	@@end
	bl	0x2015620	// free from heap

@@end:
	add	r1,=@emailSortMenuButtonSprite
	mov	r0,0x0
	str	r0,[r1]
	pop	r15

.align 2
field_emailSortMenuDrawSprites:
	add	sp,0x18

	// Set position
	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end
	ldr	r1,=0x6AE
	ldsh	r1,[r4,r1]	// scroll offset
	lsl	r1,r1,0x3
	add	r1,0x80
	mov	r2,0x78
	bl	0x2020780	// set position

	// Update sprites
	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	bl	0x20205F8	// advance animation
	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	bl	0x2020654
	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	bl	0x1FF930C
	add	r0,=@emailSortMenuButtonSprite
	ldr	r0,[r0]
	bl	0x1FF978C

@@end:
	pop	r4,r15

.align 2
field_emailSortMenuHandler:
	// r0 = 0x6A2
	sub	r2,r0,0x4
	ldrh	r2,[r4,r2]	// button down
	push	r0-r2,r14

	add	r1,=@emailSortMenuState
	ldr	r1,[r1]
	cmp	r1,0x0
	bne	@@state1

@@state0:
	// Check on left page
	add	r0,(0x6B8 - 0x6A2)
	ldr	r1,[r4,r0]
	cmp	r1,0x0
	bne	@@end

	// Check X Button pressed
	lsr	r2,r2,0xB	// test 0x400
	bcc	@@end

	// Load menu
	bl	@emailSortMenuLoad

	b	@@selectSFX

@@state1:
	// r0 = 0x6A2
	// r2 = button down
	// Check B Button
	lsr	r1,r2,0x2	// test 0x2
	bcs	@@doUnload

@@checkA:
	lsr	r1,r2,0x1	// test 0x1
	bcc	@@checkDpad

	add	r0,=@emailSortMenuCursorPosition
	ldr	r0,[r0]
	cmp	r0,0x4
	beq	@@doUnload

@@doSort:
	mov	r1,0x0		// ascending
	add	r3,=@emailSortMenuLastSort
	ldr	r2,[r3]
	str	r0,[r3]
	cmp	r0,r2
	bne	@@callSort

	// Descending
	mov	r1,0x1
	mov	r2,0xFF
	str	r2,[r3]

@@callSort:
	add	r3,=@emailSorts
	lsl	r0,r0,0x7	// sort * 0x80
	add	r0,r3,r0
	bl	@emailDoSort

	// Update list
	mov	r0,r4
	ldr	r1,=0x211CD4C
	ldr	r1,[r1]
	ldr	r1,[r1,0x4]
	bl	0x2180A1C

	mov	r0,r4
	ldr	r1,=0x211CD4C
	ldr	r1,[r1]
	ldr	r1,[r1,0x4]
	bl	0x2180D1C	

	b	@@selectSFX

@@doUnload:
	// Unload menu
	bl	@emailSortMenuUnload

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x8B
	bl	0x2025574	// play SFX

	b	@@exit

@@checkDpad:
	sub	r0,0x2		// 0x6A0
	ldrh	r0,[r4,r0]	// button slow
	add	r3,=@emailSortMenuCursorPosition
	ldr	r2,[r3]
@@checkDown:
	lsr	r1,r0,0x8	// test 0x80
	bcc	@@checkUp

	add	r2,0x1
	cmp	r2,0x4
	ble	@@setCursorPosition
	mov	r2,0x0
	b	@@setCursorPosition

@@checkUp:
	lsr	r1,r0,0x7	// test 0x40
	bcc	@@sprites

	sub	r2,0x1
	bpl	@@setCursorPosition
	mov	r2,0x4
//	b	@@setCursorPosition

@@setCursorPosition:
	str	r2,[r3]

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x88
	bl	0x2025574	// play SFX

	b	@@sprites

@@selectSFX:
	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x89
	bl	0x2025574	// play SFX

@@sprites:
	add	r0,=@emailSortMenuCursorSprite
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@exit

//	add	r0,=@emailSortMenuCursorSprite
//	ldr	r0,[r0]
	mov	r1,0x83
	add	r2,=@emailSortMenuCursorPosition
	ldr	r2,[r2]
	lsl	r2,r2,0x4
	add	r2,(44)
	bl	0x2020780	// set position

	// Update sprites
	add	r0,=@emailSortMenuCursorSprite
	ldr	r0,[r0]
	bl	0x20205F8	// advance animation
	add	r0,=@emailSortMenuCursorSprite
	ldr	r0,[r0]
	bl	0x2020654
	add	r0,=@emailSortMenuCursorSprite
	ldr	r0,[r0]
	bl	0x1FF930C
	add	r0,=@emailSortMenuCursorSprite
	ldr	r0,[r0]
	bl	0x1FF978C

	b	@@exit

@@exit:
	// Draw and exit
//	pop	r0-r2
//	add	sp,0x4
	add	sp,(0xC+0x4)
	bl	0x21801F0

@@end:
	pop	r0-r2,r15

@emailSortMenuLoad:
	push	r7,r14
	sub	sp,0x18

	// Go to sort menu state
	add	r1,=@emailSortMenuState
	mov	r0,0x1
	str	r0,[r1]

	// Clear cursor
	mov	r0,0x0
	add	r1,=@emailSortMenuCursorPosition
	str	r0,[r1]

	// Load mail sort menu palette
	ldr	r0,=((7 << 0x10) | (244))
	add	r0,0x2
	str	r0,[sp]		// file
	ldr	r0,=0x21239A4
	mov	r1,0x1		// engine
	mov	r2,0xB		// palette
	mov	r3,0x1		// heap
	bl	0x202F1A4	// load BG palette from file

	// Load mail sort menu tiles
	ldr	r0,=((7 << 0x10) | (244))
	str	r0,[sp]		// file
	ldr	r0,=0x21239A4
	mov	r1,0x1		// engine
	mov	r2,0x20		// destination
	mov	r3,0x1		// heap
	bl	0x202F000	// load BG2 tiles from file

	// Load mail sort menu tilemap
	ldr	r0,=0x211C998
	ldr	r1,=((7 << 0x10) | (244))
	add	r1,0x1
	bl	0x2012518	// alloc and load file
	mov	r7,r0
	beq	@@end

	// Copy tilemap
	mov	r0,0x1		// base tile
	str	r0,[sp]
	mov	r0,0xB		// palette
	str	r0,[sp,0x4]
	mov	r0,(11)		// x
	str	r0,[sp,0x8]
	mov	r0,(1)		// y
	str	r0,[sp,0xC]
	mov	r0,(11)		// width
	str	r0,[sp,0x10]
	mov	r0,(15)		// height
	str	r0,[sp,0x14]
	ldr	r0,=0x210F350
	mov	r1,0x1		// engine
	mov	r2,0x2		// bg
	mov	r3,r7		// src
	bl	0x200B748	// copy tilemap

	// Free tilemap from heap
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r7
	bl	0x2015620	// free from heap

	// Get cursor sprite file size
	ldr	r0,=0x211C998
	ldr	r1,=((31 << 0x10) | (90))
	bl	0x20122F8	// get file size

	// Allocate cursor sprite file
	mov	r2,r0
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x20155DC	// alloc on heap
	add	r1,=@emailSortMenuCursorSpriteFile
	str	r0,[r1]

	// Load cursor sprite file
	mov	r1,r0
	ldr	r0,=0x211C998
	ldr	r2,=((31 << 0x10) | (90))
	bl	0x201231C

	// Allocate cursor sprite
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x4C
	bl	0x20155DC	// alloc on heap
	mov	r7,r0
	beq	@@end
	add	r1,=@emailSortMenuCursorSprite
	str	r7,[r1]

	// Init sprite
	ldr	r0,=0x4000	// VRAM OBJ tile offset
	str	r0,[sp]
	mov	r0,0xB		// palette
	str	r0,[sp,0x4]
	ldr	r0,=0x4000	// ???
	str	r0,[sp,0x8]
	mov	r0,r7
	mov	r1,0x1		// screen
	mov	r2,0x5		// color mode = 4BPP
	add	r3,=@emailSortMenuCursorSpriteFile
	ldr	r3,[r3]
	bl	0x202042C	// init sprite

	// Set sprite animation
	mov	r0,r7
	mov	r1,0x3
	bl	0x2020570	// set animation

	// Show sprite
	mov	r0,r7
	bl	0x202067C

@@end:
	add	sp,0x18
	pop	r7,r15

@emailSortMenuUnload:
	push	r14
	sub	sp,0x10

	// Clear sort menu state
	add	r1,=@emailSortMenuState
	mov	r0,0x0
	str	r0,[r1]

	// Clear tilemap
	mov	r0,(11)		// x
	str	r0,[sp]
	mov	r0,(1)		// y
	str	r0,[sp,0x4]
	mov	r0,(11)		// width
	str	r0,[sp,0x8]
	mov	r0,(15)		// height
	str	r0,[sp,0xC]
	ldr	r0,=0x210F350
	mov	r1,0x1		// engine
	mov	r2,0x2		// bg
	mov	r3,0x0		// tile
	bl	0x200B900	// fill tilemap

	// Unload sprite
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	add	r2,=@emailSortMenuCursorSprite
	ldr	r2,[r2]
	bl	0x2015620	// free from heap

	// Unload sprite file
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	add	r2,=@emailSortMenuCursorSpriteFile
	ldr	r2,[r2]
	bl	0x2015620	// free from heap

	// Clear pointers
	mov	r0,0x0
	add	r1,=@emailSortMenuCursorSprite
	str	r0,[r1]
	add	r1,=@emailSortMenuCursorSpriteFile
	str	r0,[r1]

@@end:
	add	sp,0x10
	pop	r15

@emailDoSort:
	// r0 = sort list
	// r1 = direction (0 = ascending, 1 = descending)
	push	r1,r4-r7,r14
	mov	r4,r0		// sort list
	ldr	r5,=0x2120588
	ldr	r5,[r5]
	ldr	r5,[r5,0x24]	// mail list
	mov	r6,0x0		// sort index
	mov	r7,0x0		// mail index

	cmp	r1,0x0
	beq	@@loop

	// Descending
	mov	r6,(128-1)	// sort index

@@loop:
	ldrb	r0,[r4,r6]
	mov	r1,(0x1600 >> 0x8)
	lsl	r1,r1,0x8
	add	r1,r1,r0
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@next

	// Set mail
	ldrb	r0,[r4,r6]
	strb	r0,[r5,r7]
	add	r7,0x1

@@next:
	ldr	r0,[sp]		// direction
	cmp	r0,0x0
	bne	@@descending
@@ascending:
	add	r6,0x1
	cmp	r6,(128)
	blt	@@loop
	b	@@end
@@descending:
	sub	r6,0x1
	bpl	@@loop
//	b	@@end

@@end:
	pop	r1,r4-r7,r15

	.pool

.align 4
@emailSortMenuState:
	.dw	0x0
@emailSortMenuCursorPosition:
	.dw	0x0
@emailSortMenuCursorSpriteFile:
	.dw	0x0
@emailSortMenuCursorSprite:
	.dw	0x0
@emailSortMenuButtonSprite:
	.dw	0x0
@emailSortMenuLastSort:
	.dw	0xFF
@emailSorts:
@emailSortByID:
	.db	0	// M	Class Review	Echo Elem
	.db	1	// !	BrotherBand	Luna Platz
	.db	20	// M	E-mail,huh?	Omega-Xis
	.db	21	// M	Custm Screen	Omega-Xis
	.db	22	// M	Battling	Omega-Xis
	.db	23	// M	Shield		Omega-Xis
	.db	24	// M	Mega Attack!	Omega-Xis
	.db	25	// M	Countering	Omega-Xis
	.db	30	// M	Cipher Mail	Omega-Xis
	.db	3	// !	Red Wreckage	E-News
	.db	27	// M	Star Cards	Omega-Xis
	.db	29	// M	NONE		Anonymous	(Taurus Fire rematch)
	.db	4	// M	BIG WAVE!	Ken Suther
	.db	8	// M	Good Luck!	Sonia Strumm
	.db	5	// !	Star Force	PegasusMagic
	.db	9	// M	Are you OK?	Sonia Strumm
	.db	17	// !	Best Combo	PegasusMagic
	.db	32	// !	PowerUp data	Famous Mk.II
	.db	10	// M	Too bad,huh?	Sonia Strumm
	.db	11	// M	Be careful!	Luna Platz
	.db	19	// M	Next test	Dragon Sky
	.db	7	// !	Star Force	Dragon Sky
	.db	13	// M	Odd signal	AMAKEN News
	.db	33	// !	LunarKnights	Anonymous
	.db	12	// M	Come to lab?	Aaron Boreal
	.db	18	// M	My power	Leo Kingdom
	.db	6	// !	Star Force	Leo Kingdom
	.db	2	// !	Caution!	NAZA
	.db	14	// M	Make it home	Luna Platz
	.db	15	// M	Go for it!!	Bud Bison
	.db	16	// M	Good luck!!	Zack Temple
	.db	28	// M	Extra Folder	Omega-Xis
	.db	26	// !@	NONE		Anonymous	(Got all S Frags)
	.db	35	// -	-		-
	.db	36	// -	-		-
	.db	37	// -	-		-
	.db	38	// -	-		-
	.db	39	// -	-		-
	.db	40	// -	-		-
	.db	41	// -	-		-
	.db	42	// -	-		-
	.db	43	// -	-		-
	.db	44	// -	-		-
	.db	45	// -	-		-
	.db	46	// -	-		-
	.db	47	// -	-		-
	.db	48	// -	-		-
	.db	49	// -	-		-
	.db	50	// -	-		-
	.db	51	// -	-		-
	.db	52	// -	-		-
	.db	53	// -	-		-
	.db	54	// -	-		-
	.db	55	// -	-		-
	.db	56	// -	-		-
	.db	57	// P	Cindy White	Transer Memo
	.db	58	// P	QuieroMocard	Transer Memo
	.db	60	// P	Iver Gatte	Transer Memo
	.db	63	// P	Chatty Ditz	Transer Memo
	.db	64	// P	MillieBooney	Transer Memo
	.db	65	// P	Sumar Guy	Transer Memo
	.db	66	// P	Grace Fulle	Transer Memo
	.db	67	// P	Leroy Mann	Transer Memo
	.db	68	// P	Swill Waters	Transer Memo
	.db	69	// P	Polly Reade	Transer Memo
	.db	70	// P	Edgar Knight	Transer Memo
	.db	61	// P	Chase Winde	Transer Memo
	.db	71	// P	Tuggy McGrav	Transer Memo
	.db	108	// P	Tom Dubius	Transer Memo
	.db	62	// P	Juan Mocard	Transer Memo
	.db	72	// P	Mira Lookes	Transer Memo
	.db	59	// P	Joe Hawnt	Transer Memo
	.db	73	// P	SavoryDelejo	Transer Memo
	.db	74	// P	Holly Wacher	Transer Memo
	.db	76	// P	Job Goode	Transer Memo
	.db	77	// P	Rad Contre	Transer Memo
	.db	79	// P	Triv Query	Transer Memo
	.db	81	// P	Ema Nesia	Transer Memo
	.db	84	// P	Lei Zeek	Transer Memo
	.db	106	// P	Chrys Golds	Transer Memo
	.db	75	// P	Blair Loude	Transer Memo
	.db	78	// P	Barry Square	Transer Memo
	.db	80	// P	Teresa Tudor	Transer Memo
	.db	110	// P	Mitch Shepar	Transer Memo
	.db	82	// P	Will Knappe	Transer Memo
	.db	86	// P	CollinWaytin	Transer Memo
	.db	88	// P	Heidi Rune	Transer Memo
	.db	90	// P	RheemaDeller	Transer Memo
	.db	91	// P	Annie Olde	Transer Memo
	.db	92	// P	Kurt Taylor	Transer Memo
	.db	93	// P	Homer Park	Transer Memo
	.db	94	// P	Sluger Park	Transer Memo
	.db	85	// P	Dee Jay		Transer Memo
	.db	87	// P	Indy Darke	Transer Memo
	.db	89	// P	Donna Query	Transer Memo
	.db	112	// P	Veil Platz	Transer Memo
	.db	113	// P	Vaughn Platz	Transer Memo
	.db	114	// P	Prof. Snake	Transer Memo
	.db	95	// P	Meala DeVour	Transer Memo
	.db	96	// P	Selah Agane	Transer Memo
	.db	97	// P	Roy Query	Transer Memo
	.db	83	// P	Nadia Kleen	Transer Memo
	.db	98	// P	Mead Greene	Transer Memo
	.db	99	// P	John Forman	Transer Memo
	.db	100	// P	Hope Stelar	Transer Memo
	.db	101	// P	Ken Suther	Transer Memo
	.db	117	// P	Sonia Strumm	Transer Memo
	.db	102	// P	Luna Platz	Transer Memo
	.db	103	// P	Bud Bison	Transer Memo
	.db	104	// P	Zack Temple	Transer Memo
	.db	109	// P	Pat Sprigs	Transer Memo
	.db	111	// P	Bob Copper	Transer Memo
	.db	118	// P	Aaron Boreal	Transer Memo
	.db	105	// P	Dummy		Transer Memo
	.db	107	// P	Dummy		Transer Memo
	.db	115	// P	Dummy		Transer Memo
	.db	116	// P	Dummy		Transer Memo
	.db	120	// -	-		-
	.db	121	// -	-		-
	.db	122	// -	-		-
	.db	123	// -	-		-
	.db	124	// -	-		-
	.db	125	// -	-		-
	.db	126	// -	-		-
	.db	127	// -	-		-
	.db	119	// !@	Congrats!	L.M.Shin
	.db	31	// M	Legendary!!	L.M.Shin
	.db	34	// !@	DX Complete!	Famous Mk.II
@emailSortByIcon:
	.db	0	// M	Class Review	Echo Elem
	.db	20	// M	E-mail,huh?	Omega-Xis
	.db	21	// M	Custm Screen	Omega-Xis
	.db	22	// M	Battling	Omega-Xis
	.db	23	// M	Shield		Omega-Xis
	.db	24	// M	Mega Attack!	Omega-Xis
	.db	25	// M	Countering	Omega-Xis
	.db	30	// M	Cipher Mail	Omega-Xis
	.db	27	// M	Star Cards	Omega-Xis
	.db	29	// M	NONE		Anonymous	(Taurus Fire rematch)
	.db	4	// M	BIG WAVE!	Ken Suther
	.db	8	// M	Good Luck!	Sonia Strumm
	.db	9	// M	Are you OK?	Sonia Strumm
	.db	10	// M	Too bad,huh?	Sonia Strumm
	.db	11	// M	Be careful!	Luna Platz
	.db	19	// M	Next test	Dragon Sky
	.db	13	// M	Odd signal	AMAKEN News
	.db	12	// M	Come to lab?	Aaron Boreal
	.db	18	// M	My power	Leo Kingdom
	.db	14	// M	Make it home	Luna Platz
	.db	15	// M	Go for it!!	Bud Bison
	.db	16	// M	Good luck!!	Zack Temple
	.db	28	// M	Extra Folder	Omega-Xis
	.db	31	// M	Legendary!!	L.M.Shin
	.db	1	// !	BrotherBand	Luna Platz
	.db	3	// !	Red Wreckage	E-News
	.db	5	// !	Star Force	PegasusMagic
	.db	17	// !	Best Combo	PegasusMagic
	.db	32	// !	PowerUp data	Famous Mk.II
	.db	7	// !	Star Force	Dragon Sky
	.db	33	// !	LunarKnights	Anonymous
	.db	6	// !	Star Force	Leo Kingdom
	.db	2	// !	Caution!	NAZA
	.db	26	// !@	NONE		Anonymous	(Got all S Frags)
	.db	119	// !@	Congrats!	L.M.Shin
	.db	34	// !@	DX Complete!	Famous Mk.II
	.db	35	// -	-		-
	.db	36	// -	-		-
	.db	37	// -	-		-
	.db	38	// -	-		-
	.db	39	// -	-		-
	.db	40	// -	-		-
	.db	41	// -	-		-
	.db	42	// -	-		-
	.db	43	// -	-		-
	.db	44	// -	-		-
	.db	45	// -	-		-
	.db	46	// -	-		-
	.db	47	// -	-		-
	.db	48	// -	-		-
	.db	49	// -	-		-
	.db	50	// -	-		-
	.db	51	// -	-		-
	.db	52	// -	-		-
	.db	53	// -	-		-
	.db	54	// -	-		-
	.db	55	// -	-		-
	.db	56	// -	-		-
	.db	57	// P	Cindy White	Transer Memo
	.db	58	// P	QuieroMocard	Transer Memo
	.db	60	// P	Iver Gatte	Transer Memo
	.db	63	// P	Chatty Ditz	Transer Memo
	.db	64	// P	MillieBooney	Transer Memo
	.db	65	// P	Sumar Guy	Transer Memo
	.db	66	// P	Grace Fulle	Transer Memo
	.db	67	// P	Leroy Mann	Transer Memo
	.db	68	// P	Swill Waters	Transer Memo
	.db	69	// P	Polly Reade	Transer Memo
	.db	70	// P	Edgar Knight	Transer Memo
	.db	61	// P	Chase Winde	Transer Memo
	.db	71	// P	Tuggy McGrav	Transer Memo
	.db	108	// P	Tom Dubius	Transer Memo
	.db	62	// P	Juan Mocard	Transer Memo
	.db	72	// P	Mira Lookes	Transer Memo
	.db	59	// P	Joe Hawnt	Transer Memo
	.db	73	// P	SavoryDelejo	Transer Memo
	.db	74	// P	Holly Wacher	Transer Memo
	.db	76	// P	Job Goode	Transer Memo
	.db	77	// P	Rad Contre	Transer Memo
	.db	79	// P	Triv Query	Transer Memo
	.db	81	// P	Ema Nesia	Transer Memo
	.db	84	// P	Lei Zeek	Transer Memo
	.db	106	// P	Chrys Golds	Transer Memo
	.db	75	// P	Blair Loude	Transer Memo
	.db	78	// P	Barry Square	Transer Memo
	.db	80	// P	Teresa Tudor	Transer Memo
	.db	110	// P	Mitch Shepar	Transer Memo
	.db	82	// P	Will Knappe	Transer Memo
	.db	86	// P	CollinWaytin	Transer Memo
	.db	88	// P	Heidi Rune	Transer Memo
	.db	90	// P	RheemaDeller	Transer Memo
	.db	91	// P	Annie Olde	Transer Memo
	.db	92	// P	Kurt Taylor	Transer Memo
	.db	93	// P	Homer Park	Transer Memo
	.db	94	// P	Sluger Park	Transer Memo
	.db	85	// P	Dee Jay		Transer Memo
	.db	87	// P	Indy Darke	Transer Memo
	.db	89	// P	Donna Query	Transer Memo
	.db	112	// P	Veil Platz	Transer Memo
	.db	113	// P	Vaughn Platz	Transer Memo
	.db	114	// P	Prof. Snake	Transer Memo
	.db	95	// P	Meala DeVour	Transer Memo
	.db	96	// P	Selah Agane	Transer Memo
	.db	97	// P	Roy Query	Transer Memo
	.db	83	// P	Nadia Kleen	Transer Memo
	.db	98	// P	Mead Greene	Transer Memo
	.db	99	// P	John Forman	Transer Memo
	.db	100	// P	Hope Stelar	Transer Memo
	.db	101	// P	Ken Suther	Transer Memo
	.db	117	// P	Sonia Strumm	Transer Memo
	.db	102	// P	Luna Platz	Transer Memo
	.db	103	// P	Bud Bison	Transer Memo
	.db	104	// P	Zack Temple	Transer Memo
	.db	109	// P	Pat Sprigs	Transer Memo
	.db	111	// P	Bob Copper	Transer Memo
	.db	118	// P	Aaron Boreal	Transer Memo
	.db	105	// P	Dummy		Transer Memo
	.db	107	// P	Dummy		Transer Memo
	.db	115	// P	Dummy		Transer Memo
	.db	116	// P	Dummy		Transer Memo
	.db	120	// -	-		-
	.db	121	// -	-		-
	.db	122	// -	-		-
	.db	123	// -	-		-
	.db	124	// -	-		-
	.db	125	// -	-		-
	.db	126	// -	-		-
	.db	127	// -	-		-
@emailSortBySubject:
	.db	118	// P	Aaron Boreal	Transer Memo
	.db	91	// P	Annie Olde	Transer Memo
	.db	9	// M	Are you OK?	Sonia Strumm
	.db	78	// P	Barry Square	Transer Memo
	.db	22	// M	Battling	Omega-Xis
	.db	11	// M	Be careful!	Luna Platz
	.db	17	// !	Best Combo	PegasusMagic
	.db	4	// M	BIG WAVE!	Ken Suther
	.db	75	// P	Blair Loude	Transer Memo
	.db	111	// P	Bob Copper	Transer Memo
	.db	1	// !	BrotherBand	Luna Platz
	.db	103	// P	Bud Bison	Transer Memo
	.db	2	// !	Caution!	NAZA
	.db	61	// P	Chase Winde	Transer Memo
	.db	63	// P	Chatty Ditz	Transer Memo
	.db	106	// P	Chrys Golds	Transer Memo
	.db	57	// P	Cindy White	Transer Memo
	.db	30	// M	Cipher Mail	Omega-Xis
	.db	0	// M	Class Review	Echo Elem
	.db	86	// P	CollinWaytin	Transer Memo
	.db	12	// M	Come to lab?	Aaron Boreal
	.db	119	// !@	Congrats!	L.M.Shin
	.db	25	// M	Countering	Omega-Xis
	.db	21	// M	Custm Screen	Omega-Xis
	.db	85	// P	Dee Jay		Transer Memo
	.db	89	// P	Donna Query	Transer Memo
	.db	20	// M	E-mail,huh?	Omega-Xis
	.db	70	// P	Edgar Knight	Transer Memo
	.db	81	// P	Ema Nesia	Transer Memo
	.db	28	// M	Extra Folder	Omega-Xis
	.db	105	// P	Dummy		Transer Memo
	.db	107	// P	Dummy		Transer Memo
	.db	115	// P	Dummy		Transer Memo
	.db	116	// P	Dummy		Transer Memo
	.db	34	// !@	DX Complete!	Famous Mk.II
	.db	120	// -	-		-
	.db	121	// -	-		-
	.db	122	// -	-		-
	.db	123	// -	-		-
	.db	124	// -	-		-
	.db	125	// -	-		-
	.db	126	// -	-		-
	.db	127	// -	-		-
	.db	15	// M	Go for it!!	Bud Bison
	.db	8	// M	Good Luck!	Sonia Strumm
	.db	16	// M	Good luck!!	Zack Temple
	.db	66	// P	Grace Fulle	Transer Memo
	.db	88	// P	Heidi Rune	Transer Memo
	.db	74	// P	Holly Wacher	Transer Memo
	.db	93	// P	Homer Park	Transer Memo
	.db	100	// P	Hope Stelar	Transer Memo
	.db	87	// P	Indy Darke	Transer Memo
	.db	60	// P	Iver Gatte	Transer Memo
	.db	76	// P	Job Goode	Transer Memo
	.db	59	// P	Joe Hawnt	Transer Memo
	.db	99	// P	John Forman	Transer Memo
	.db	62	// P	Juan Mocard	Transer Memo
	.db	101	// P	Ken Suther	Transer Memo
	.db	92	// P	Kurt Taylor	Transer Memo
	.db	31	// M	Legendary!!	L.M.Shin
	.db	84	// P	Lei Zeek	Transer Memo
	.db	67	// P	Leroy Mann	Transer Memo
	.db	102	// P	Luna Platz	Transer Memo
	.db	33	// !	LunarKnights	Anonymous
	.db	14	// M	Make it home	Luna Platz
	.db	98	// P	Mead Greene	Transer Memo
	.db	95	// P	Meala DeVour	Transer Memo
	.db	24	// M	Mega Attack!	Omega-Xis
	.db	64	// P	MillieBooney	Transer Memo
	.db	72	// P	Mira Lookes	Transer Memo
	.db	110	// P	Mitch Shepar	Transer Memo
	.db	18	// M	My power	Leo Kingdom
	.db	83	// P	Nadia Kleen	Transer Memo
	.db	19	// M	Next test	Dragon Sky
	.db	29	// M	NONE		Anonymous	(Taurus Fire rematch)
	.db	26	// !@	NONE		Anonymous	(Got all S Frags)
	.db	13	// M	Odd signal	AMAKEN News
	.db	109	// P	Pat Sprigs	Transer Memo
	.db	69	// P	Polly Reade	Transer Memo
	.db	32	// !	PowerUp data	Famous Mk.II
	.db	114	// P	Prof. Snake	Transer Memo
	.db	58	// P	QuieroMocard	Transer Memo
	.db	77	// P	Rad Contre	Transer Memo
	.db	3	// !	Red Wreckage	E-News
	.db	90	// P	RheemaDeller	Transer Memo
	.db	97	// P	Roy Query	Transer Memo
	.db	73	// P	SavoryDelejo	Transer Memo
	.db	96	// P	Selah Agane	Transer Memo
	.db	23	// M	Shield		Omega-Xis
	.db	94	// P	Sluger Park	Transer Memo
	.db	117	// P	Sonia Strumm	Transer Memo
	.db	27	// M	Star Cards	Omega-Xis
	.db	7	// !	Star Force	Dragon Sky
	.db	6	// !	Star Force	Leo Kingdom
	.db	5	// !	Star Force	PegasusMagic
	.db	65	// P	Sumar Guy	Transer Memo
	.db	68	// P	Swill Waters	Transer Memo
	.db	80	// P	Teresa Tudor	Transer Memo
	.db	108	// P	Tom Dubius	Transer Memo
	.db	10	// M	Too bad,huh?	Sonia Strumm
	.db	79	// P	Triv Query	Transer Memo
	.db	71	// P	Tuggy McGrav	Transer Memo
	.db	113	// P	Vaughn Platz	Transer Memo
	.db	112	// P	Veil Platz	Transer Memo
	.db	82	// P	Will Knappe	Transer Memo
	.db	104	// P	Zack Temple	Transer Memo
	.db	35	// -	-		-
	.db	36	// -	-		-
	.db	37	// -	-		-
	.db	38	// -	-		-
	.db	39	// -	-		-
	.db	40	// -	-		-
	.db	41	// -	-		-
	.db	42	// -	-		-
	.db	43	// -	-		-
	.db	44	// -	-		-
	.db	45	// -	-		-
	.db	46	// -	-		-
	.db	47	// -	-		-
	.db	48	// -	-		-
	.db	49	// -	-		-
	.db	50	// -	-		-
	.db	51	// -	-		-
	.db	52	// -	-		-
	.db	53	// -	-		-
	.db	54	// -	-		-
	.db	55	// -	-		-
	.db	56	// -	-		-
@emailSortBySender:
	.db	12	// M	Come to lab?	Aaron Boreal
	.db	13	// M	Odd signal	AMAKEN News
	.db	33	// !	LunarKnights	Anonymous
	.db	29	// M	NONE		Anonymous	(Taurus Fire rematch)
	.db	26	// !@	NONE		Anonymous	(Got all S Frags)
	.db	15	// M	Go for it!!	Bud Bison
	.db	19	// M	Next test	Dragon Sky
	.db	7	// !	Star Force	Dragon Sky
	.db	3	// !	Red Wreckage	E-News
	.db	0	// M	Class Review	Echo Elem
	.db	34	// !@	DX Complete!	Famous Mk.II
	.db	32	// !	PowerUp data	Famous Mk.II
	.db	4	// M	BIG WAVE!	Ken Suther
	.db	119	// !@	Congrats!	L.M.Shin
	.db	31	// M	Legendary!!	L.M.Shin
	.db	18	// M	My power	Leo Kingdom
	.db	6	// !	Star Force	Leo Kingdom
	.db	11	// M	Be careful!	Luna Platz
	.db	1	// !	BrotherBand	Luna Platz
	.db	14	// M	Make it home	Luna Platz
	.db	2	// !	Caution!	NAZA
	.db	17	// !	Best Combo	PegasusMagic
	.db	5	// !	Star Force	PegasusMagic
	.db	22	// M	Battling	Omega-Xis
	.db	30	// M	Cipher Mail	Omega-Xis
	.db	25	// M	Countering	Omega-Xis
	.db	21	// M	Custm Screen	Omega-Xis
	.db	20	// M	E-mail,huh?	Omega-Xis
	.db	28	// M	Extra Folder	Omega-Xis
	.db	24	// M	Mega Attack!	Omega-Xis
	.db	23	// M	Shield		Omega-Xis
	.db	27	// M	Star Cards	Omega-Xis
	.db	9	// M	Are you OK?	Sonia Strumm
	.db	8	// M	Good Luck!	Sonia Strumm
	.db	10	// M	Too bad,huh?	Sonia Strumm
	.db	118	// P	Aaron Boreal	Transer Memo
	.db	91	// P	Annie Olde	Transer Memo
	.db	78	// P	Barry Square	Transer Memo
	.db	75	// P	Blair Loude	Transer Memo
	.db	111	// P	Bob Copper	Transer Memo
	.db	103	// P	Bud Bison	Transer Memo
	.db	61	// P	Chase Winde	Transer Memo
	.db	63	// P	Chatty Ditz	Transer Memo
	.db	106	// P	Chrys Golds	Transer Memo
	.db	57	// P	Cindy White	Transer Memo
	.db	86	// P	CollinWaytin	Transer Memo
	.db	85	// P	Dee Jay		Transer Memo
	.db	89	// P	Donna Query	Transer Memo
	.db	70	// P	Edgar Knight	Transer Memo
	.db	81	// P	Ema Nesia	Transer Memo
	.db	105	// P	Dummy		Transer Memo
	.db	107	// P	Dummy		Transer Memo
	.db	115	// P	Dummy		Transer Memo
	.db	116	// P	Dummy		Transer Memo
	.db	120	// -	-		-
	.db	121	// -	-		-
	.db	122	// -	-		-
	.db	123	// -	-		-
	.db	124	// -	-		-
	.db	125	// -	-		-
	.db	126	// -	-		-
	.db	127	// -	-		-
	.db	66	// P	Grace Fulle	Transer Memo
	.db	88	// P	Heidi Rune	Transer Memo
	.db	74	// P	Holly Wacher	Transer Memo
	.db	93	// P	Homer Park	Transer Memo
	.db	100	// P	Hope Stelar	Transer Memo
	.db	87	// P	Indy Darke	Transer Memo
	.db	60	// P	Iver Gatte	Transer Memo
	.db	76	// P	Job Goode	Transer Memo
	.db	59	// P	Joe Hawnt	Transer Memo
	.db	99	// P	John Forman	Transer Memo
	.db	62	// P	Juan Mocard	Transer Memo
	.db	101	// P	Ken Suther	Transer Memo
	.db	92	// P	Kurt Taylor	Transer Memo
	.db	84	// P	Lei Zeek	Transer Memo
	.db	67	// P	Leroy Mann	Transer Memo
	.db	102	// P	Luna Platz	Transer Memo
	.db	98	// P	Mead Greene	Transer Memo
	.db	95	// P	Meala DeVour	Transer Memo
	.db	64	// P	MillieBooney	Transer Memo
	.db	72	// P	Mira Lookes	Transer Memo
	.db	110	// P	Mitch Shepar	Transer Memo
	.db	83	// P	Nadia Kleen	Transer Memo
	.db	109	// P	Pat Sprigs	Transer Memo
	.db	69	// P	Polly Reade	Transer Memo
	.db	114	// P	Prof. Snake	Transer Memo
	.db	58	// P	QuieroMocard	Transer Memo
	.db	77	// P	Rad Contre	Transer Memo
	.db	90	// P	RheemaDeller	Transer Memo
	.db	97	// P	Roy Query	Transer Memo
	.db	73	// P	SavoryDelejo	Transer Memo
	.db	96	// P	Selah Agane	Transer Memo
	.db	94	// P	Sluger Park	Transer Memo
	.db	117	// P	Sonia Strumm	Transer Memo
	.db	65	// P	Sumar Guy	Transer Memo
	.db	68	// P	Swill Waters	Transer Memo
	.db	80	// P	Teresa Tudor	Transer Memo
	.db	108	// P	Tom Dubius	Transer Memo
	.db	79	// P	Triv Query	Transer Memo
	.db	71	// P	Tuggy McGrav	Transer Memo
	.db	113	// P	Vaughn Platz	Transer Memo
	.db	112	// P	Veil Platz	Transer Memo
	.db	82	// P	Will Knappe	Transer Memo
	.db	104	// P	Zack Temple	Transer Memo
	.db	16	// M	Good luck!!	Zack Temple
	.db	35	// -	-		-
	.db	36	// -	-		-
	.db	37	// -	-		-
	.db	38	// -	-		-
	.db	39	// -	-		-
	.db	40	// -	-		-
	.db	41	// -	-		-
	.db	42	// -	-		-
	.db	43	// -	-		-
	.db	44	// -	-		-
	.db	45	// -	-		-
	.db	46	// -	-		-
	.db	47	// -	-		-
	.db	48	// -	-		-
	.db	49	// -	-		-
	.db	50	// -	-		-
	.db	51	// -	-		-
	.db	52	// -	-		-
	.db	53	// -	-		-
	.db	54	// -	-		-
	.db	55	// -	-		-
	.db	56	// -	-		-

.align 2
field_emailCheckmark:
	push	r1,r14
	add	r3,r0,0x2
	ldrh	r0,[r2,r0]	// attachment value

	ldrb	r3,[r2,r3]	// mail icon (base sprite)
	cmp	r3,0x10		// question mark icon
	bne	@@end

	mov	r1,r0		// flag
	bl	0x202409C	// check flag

@@end:
	cmp	r0,0x0
	pop	r1,r15


.align 2
field_keyboardCaretNextName:
	// Check type is name
	mov	r0,0x78
	ldrb	r0,[r5,r0]	// type
	cmp	r0,0x0		// name
	bne	@@normal

	// Check first line
	mov	r0,0x75
	ldrb	r0,[r5,r0]	// line
	cmp	r0,0x0
	bne	@@normal

	// Check end of line
	mov	r0,0x74
	ldrb	r0,[r5,r0]	// charpos
	mov	r1,0x7A
	ldrb	r1,[r5,r1]	// linelen
	cmp	r0,r1
	blt	@@normal

	// Increment line
	mov	r0,0x75
	ldrb	r1,[r5,r0]
	add	r1,0x1
	strb	r1,[r5,r0]

//	// Set to end of line
//	mov	r0,0x7B
//	ldrb	r1,[r5,r0]
//	mov	r0,0x74
//	strb	r1,[r5,r0]

	// Set to start of line
	mov	r1,0x0
	mov	r0,0x74
	strb	r1,[r5,r0]

	// Go to play SFX
//	bl	0x21720E0
	bl	0x21720F6

@@normal:
	mov	r0,r5
	mov	r1,0xA
	bx	r14

.align 2
field_keyboardCaretPrevName:
	mov	r3,0x79
	ldrb	r3,[r0,r3]	// insert
	add	r2,r2,r3

	add	r0,0x74
	strb	r2,[r0]
	bx	r14

.align 2
field_keyboardNewLine:
	push	r4,r6-r7,r14

//	add	r0,0x74
//	strb	r1,[r0]

	// Check type is name
	mov	r0,0x78
	ldrb	r0,[r5,r0]	// type
	cmp	r0,0x0		// name
	bne	@@notName

	// Set to end of line
	mov	r0,0x7B
	ldrb	r1,[r5,r0]
	mov	r0,0x74
	strb	r1,[r5,r0]

	b	@@end

@@notName:
	// Check last line empty
	mov	r0,0x8A
	ldrb	r0,[r5,r0]
	sub	r0,0x1
	add	r0,0x7A
	ldrb	r0,[r5,r0]
	cmp	r0,0x0
	beq	@@canNewline

	// Can't newline; go back 1 line
	mov	r0,0x75
	ldrb	r1,[r5,r0]
	sub	r1,0x1
	strb	r1,[r5,r0]

	// Can't newline
	add	sp,0x10
	bl	0x2172102

@@canNewline:
	// Get line max length
	mov	r0,0x89
	ldrb	r0,[r5,r0]	// max length

	// Get x
	mov	r1,0x74
	ldrb	r1,[r5,r1]	// x

	// Number of spaces to insert
	sub	r4,r0,r1
	mov	r7,r4
	cmp	r7,0x0
	ble	@@end

	// Get length of next line
	mov	r0,0x75
	ldrb	r1,[r5,r0]
	mov	r0,0x7A
	add	r0,r0,r1
	ldrb	r6,[r5,r0]

	// Go back 1 line
	mov	r0,0x75
	ldrb	r1,[r5,r0]
	sub	r1,0x1
	strb	r1,[r5,r0]

@@loop:
	// Insert spaces
	mov	r0,r5
	mov	r1,0x37
	bl	0x2172BE8

	sub	r4,0x1
	cmp	r4,0x0
	bgt	@@loop

	// Next line empty?
	cmp	r6,0x0
	beq	@@end

	mov	r0,0x74
	ldrb	r1,[r5,r0]
	add	r1,r1,r7
	strb	r1,[r5,r0]

	// Get line max length
	mov	r0,0x89
	ldrb	r0,[r5,r0]	// max length

	// Number of spaces to insert
	sub	r4,r0,r7

@@loop2:
	// Insert spaces
	mov	r0,r5
	mov	r1,0x37
	bl	0x2172BE8

	sub	r4,0x1
	cmp	r4,0x0
	bgt	@@loop2

	// Go back 1 line
	mov	r0,0x75
	ldrb	r1,[r5,r0]
	sub	r1,0x1
	strb	r1,[r5,r0]

@@end:
	pop	r4,r6-r7,r15

.align 2
field_prefillNumbers:
	ldr	r1,[sp]
	ldr	r2,[sp,0x4]
	orr	r1,r2
	beq	@@end		// fills space

	mov	r1,0x10
	add	r2,r0,r1
@@end:
	bx	r14

.align 2
field_prefillFriendCode:
	ldr	r1,[r4,0x14]
	ldr	r1,[r1]
	ldr	r0,[r1]
	ldr	r1,[r1,0x4]
	orr	r0,r1
	beq	@@end		// fills length 0

	mov	r1,0xC
@@end:
	mov	r0,r4
	bx	r14

.align 2
field_prefillConnectNumber:
	ldr	r1,[r4,0x14]
	ldr	r1,[r1]
	ldrb	r1,[r1]
	cmp	r1,0x0
	beq	@@end		// fills length 0

	mov	r1,0x2
@@end:
	mov	r0,r4
	bx	r14

.align 2
field_checkTwoDigitNumber:
	cmp	r6,0x2		// 2 digits
	bne	@@normal
	cmp	r5,0x1		// 1 digit entered
	blt	@@normal

	// Allow one digit
	mov	r2,0x0

@@normal:
	cmp	r2,0x0
	bne	@@failure
@@success:
	bl	0x2174746
@@failure:
	bl	0x2174756

.align 2
field_convertConnectNumber:
	push	r4,r14

	ldrh	r4,[r1,0x2]
	cmp	r4,0x0
	bne	@@end

	// Zero pad
	ldrh	r4,[r1]
	strh	r4,[r1,0x2]
	mov	r4,0x10
	strh	r4,[r1]

@@end:
	bl	0x2173E5C
	pop	r4,r15

.align 2
field_keyboardStartTutorial:
	add	r0,0x55
	strb	r1,[r0]

	// Partially fade out top screen
	mov	r0,0x20
	push	r0,r14
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4
	add	sp,0x4

	pop	r15

.align 2
field_keyboardStartFolder:
	ldr	r0,[r0]
	mov	r1,0x89
	push	r0-r1,r14

	// Set index of folder that was selected
	mov	r0,(0x200 >> 0x8)
	lsl	r0,r0,0x8
	ldrb	r0,[r4,r0]
	ldr	r1,=field_selectedFolder
	add	r0,0x1
	str	r0,[r1]

	// Partially fade out top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4
	add	sp,0x4

	pop	r0-r1,r15

.align 2
field_keyboardStartBestCombo:
	push	r14

	// Partially fade out top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4

	mov	r0,0x1
	strb	r0,[r4,0x4]
	pop	r0,r15		// pop extra for deallocation


	.pool


.align 2
field_keyboardRenderText:
	// r0 = keyboard tiles
	// r1 = tile buffer
	// r2 = text buffer
	push	r4-r6,r14
	mov	r4,r0		// keyboard tiles
	mov	r5,r1		// tile buffer
	mov	r6,r2		// text buffer

@@loop:
	ldrb	r0,[r6]
	add	r6,0x1
	cmp	r0,0xE6
	beq	@@end

	add	r1,=@charToKeyboard
	ldrb	r0,[r1,r0]
	lsl	r0,r0,0x7

	// Copy tile
	add	r1,r4,r0
	mov	r2,r5
	mov	r3,0x80
	bl	0x202E010	// copy fast

	add	r5,0x80
	b	@@loop

@@end:
	pop	r4-r6,r15

.align 4
@charToKeyboard:
	.db	(0)			// 00 = ' '
	.db	(1 + 5*11*(1) + ( 0))	// 01 = '!'
	.db	(1 + 5*11*(1) + ( 1))	// 02 = '"'
	.db	(1 + 5*11*(1) + ( 2))	// 03 = '#'
	.db	(1 + 5*11*(1) + ( 3))	// 04 = '$'
	.db	(1 + 5*11*(1) + ( 4))	// 05 = '%'
	.db	(1 + 5*11*(1) + ( 5))	// 06 = '&'
	.db	(1 + 5*11*(1) + ( 6))	// 07 = '''
	.db	(1 + 5*11*(1) + ( 7))	// 08 = '('
	.db	(1 + 5*11*(1) + ( 8))	// 09 = ')'
	.db	(1 + 5*11*(0) + (49))	// 0A = '*'
	.db	(1 + 5*11*(0) + (44))	// 0B = '+'
	.db	(1 + 5*11*(0) + (37))	// 0C = ','
	.db	(1 + 5*11*(0) + (45))	// 0D = '-'
	.db	(1 + 5*11*(0) + (38))	// 0E = '.'
	.db	(1 + 5*11*(0) + (39))	// 0F = '/'
	.db	(1 + 5*11*(0) + ( 9))	// 10 = '0'
	.db	(1 + 5*11*(0) + ( 0))	// 11 = '1'
	.db	(1 + 5*11*(0) + ( 1))	// 12 = '2'
	.db	(1 + 5*11*(0) + ( 2))	// 13 = '3'
	.db	(1 + 5*11*(0) + ( 3))	// 14 = '4'
	.db	(1 + 5*11*(0) + ( 4))	// 15 = '5'
	.db	(1 + 5*11*(0) + ( 5))	// 16 = '6'
	.db	(1 + 5*11*(0) + ( 6))	// 17 = '7'
	.db	(1 + 5*11*(0) + ( 7))	// 18 = '8'
	.db	(1 + 5*11*(0) + ( 8))	// 19 = '9'
	.db	(1 + 5*11*(0) + (41))	// 1A = ':'
	.db	(1 + 5*11*(0) + (40))	// 1B = ';'
	.db	(1 + 5*11*(0) + (51))	// 1C = '<'
	.db	(1 + 5*11*(0) + (48))	// 1D = '='
	.db	(1 + 5*11*(0) + (52))	// 1E = '>'
	.db	(1 + 5*11*(1) + ( 9))	// 1F = '?'
	.db	(1 + 5*11*(0) + (50))	// 20 = '@'
	.db	(1 + 5*11*(1) + (11))	// 21 = 'A'
	.db	(1 + 5*11*(1) + (12))	// 22 = 'B'
	.db	(1 + 5*11*(1) + (13))	// 23 = 'C'
	.db	(1 + 5*11*(1) + (14))	// 24 = 'D'
	.db	(1 + 5*11*(1) + (15))	// 25 = 'E'
	.db	(1 + 5*11*(1) + (16))	// 26 = 'F'
	.db	(1 + 5*11*(1) + (17))	// 27 = 'G'
	.db	(1 + 5*11*(1) + (18))	// 28 = 'H'
	.db	(1 + 5*11*(1) + (19))	// 29 = 'I'
	.db	(1 + 5*11*(1) + (20))	// 2A = 'J'
	.db	(1 + 5*11*(1) + (21))	// 2B = 'K'
	.db	(1 + 5*11*(1) + (22))	// 2C = 'L'
	.db	(1 + 5*11*(1) + (23))	// 2D = 'M'
	.db	(1 + 5*11*(1) + (24))	// 2E = 'N'
	.db	(1 + 5*11*(1) + (25))	// 2F = 'O'
	.db	(1 + 5*11*(1) + (26))	// 30 = 'P'
	.db	(1 + 5*11*(1) + (27))	// 31 = 'Q'
	.db	(1 + 5*11*(1) + (28))	// 32 = 'R'
	.db	(1 + 5*11*(1) + (29))	// 33 = 'S'
	.db	(1 + 5*11*(1) + (30))	// 34 = 'T'
	.db	(1 + 5*11*(1) + (31))	// 35 = 'U'
	.db	(1 + 5*11*(1) + (32))	// 36 = 'V'
	.db	(1 + 5*11*(1) + (33))	// 37 = 'W'
	.db	(1 + 5*11*(1) + (34))	// 38 = 'X'
	.db	(1 + 5*11*(1) + (35))	// 39 = 'Y'
	.db	(1 + 5*11*(1) + (36))	// 3A = 'Z'
	.db	(1 + 5*11*(0) + (42))	// 3B = '['
	.db	(0)			// 3C = ''
	.db	(1 + 5*11*(0) + (43))	// 3D = ']'
	.db	(0)			// 3E = ''
	.db	(1 + 5*11*(2) + (54))	// 3F = '_'
	.db	(0)			// 40 = ''
	.db	(1 + 5*11*(0) + (11))	// 41 = 'a'
	.db	(1 + 5*11*(0) + (12))	// 42 = 'b'
	.db	(1 + 5*11*(0) + (13))	// 43 = 'c'
	.db	(1 + 5*11*(0) + (14))	// 44 = 'd'
	.db	(1 + 5*11*(0) + (15))	// 45 = 'e'
	.db	(1 + 5*11*(0) + (16))	// 46 = 'f'
	.db	(1 + 5*11*(0) + (17))	// 47 = 'g'
	.db	(1 + 5*11*(0) + (18))	// 48 = 'h'
	.db	(1 + 5*11*(0) + (19))	// 49 = 'i'
	.db	(1 + 5*11*(0) + (20))	// 4A = 'j'
	.db	(1 + 5*11*(0) + (21))	// 4B = 'k'
	.db	(1 + 5*11*(0) + (22))	// 4C = 'l'
	.db	(1 + 5*11*(0) + (23))	// 4D = 'm'
	.db	(1 + 5*11*(0) + (24))	// 4E = 'n'
	.db	(1 + 5*11*(0) + (25))	// 4F = 'o'
	.db	(1 + 5*11*(0) + (26))	// 50 = 'p'
	.db	(1 + 5*11*(0) + (27))	// 51 = 'q'
	.db	(1 + 5*11*(0) + (28))	// 52 = 'r'
	.db	(1 + 5*11*(0) + (29))	// 53 = 's'
	.db	(1 + 5*11*(0) + (30))	// 54 = 't'
	.db	(1 + 5*11*(0) + (31))	// 55 = 'u'
	.db	(1 + 5*11*(0) + (32))	// 56 = 'v'
	.db	(1 + 5*11*(0) + (33))	// 57 = 'w'
	.db	(1 + 5*11*(0) + (34))	// 58 = 'x'
	.db	(1 + 5*11*(0) + (35))	// 59 = 'y'
	.db	(1 + 5*11*(0) + (36))	// 5A = 'z'
	.db	(0)			// 5B = ''
	.db	(0)			// 5C = ''
	.db	(0)			// 5D = ''
	.db	(0)			// 5E = ''
	.db	(1 + 5*11*(2) + (47))	// 5F = '¡'
	.db	(1 + 5*11*(2) + (50))	// 60 = '¢'
	.db	(1 + 5*11*(2) + (51))	// 61 = '£'
	.db	(0)			// 62 = ''
	.db	(0)			// 63 = ''
	.db	(0)			// 64 = ''
	.db	(0)			// 65 = ''
	.db	(0)			// 66 = ''
	.db	(0)			// 67 = ''
	.db	(0)			// 68 = ''
	.db	(1 + 5*11*(0) + (53))	// 69 = '«'
	.db	(0)			// 6A = ''
	.db	(0)			// 6B = ''
	.db	(0)			// 6C = ''
	.db	(0)			// 6D = ''
	.db	(0)			// 6E = ''
	.db	(0)			// 6F = ''
	.db	(0)			// 70 = ''
	.db	(0)			// 71 = ''
	.db	(0)			// 72 = ''
	.db	(0)			// 73 = ''
	.db	(0)			// 74 = ''
	.db	(0)			// 75 = ''
	.db	(0)			// 76 = ''
	.db	(0)			// 77 = ''
	.db	(0)			// 78 = ''
	.db	(1 + 5*11*(0) + (54))	// 79 = '»'
	.db	(0)			// 7A = ''
	.db	(0)			// 7B = ''
	.db	(0)			// 7C = ''
	.db	(1 + 5*11*(2) + (48))	// 7D = '¿'
	.db	(1 + 5*11*(2) + (24))	// 7E = 'À'
	.db	(1 + 5*11*(2) + (25))	// 7F = 'Á'
	.db	(1 + 5*11*(2) + (26))	// 80 = 'Â'
	.db	(0)			// 81 = ''
	.db	(1 + 5*11*(2) + (27))	// 82 = 'Ä'
	.db	(0)			// 83 = ''
	.db	(1 + 5*11*(2) + (40))	// 84 = 'Œ'
	.db	(1 + 5*11*(2) + (45))	// 85 = 'Ç'
	.db	(1 + 5*11*(2) + (28))	// 86 = 'È'
	.db	(1 + 5*11*(2) + (29))	// 87 = 'É'
	.db	(1 + 5*11*(2) + (30))	// 88 = 'Ê'
	.db	(1 + 5*11*(2) + (31))	// 89 = 'Ë'
	.db	(1 + 5*11*(2) + (32))	// 8A = 'Ì'
	.db	(1 + 5*11*(2) + (33))	// 8B = 'Í'
	.db	(1 + 5*11*(2) + (34))	// 8C = 'Î'
	.db	(1 + 5*11*(2) + (35))	// 8D = 'Ï'
	.db	(0)			// 8E = ''
	.db	(1 + 5*11*(2) + (46))	// 8F = 'Ñ'
	.db	(1 + 5*11*(2) + (36))	// 90 = 'Ò'
	.db	(1 + 5*11*(2) + (37))	// 91 = 'Ó'
	.db	(1 + 5*11*(2) + (38))	// 92 = 'Ô'
	.db	(0)			// 93 = ''
	.db	(1 + 5*11*(2) + (39))	// 94 = 'Ö'
	.db	(0)			// 95 = ''
	.db	(0)			// 96 = ''
	.db	(1 + 5*11*(2) + (41))	// 97 = 'Ù'
	.db	(1 + 5*11*(2) + (42))	// 98 = 'Ú'
	.db	(1 + 5*11*(2) + (43))	// 99 = 'Û'
	.db	(1 + 5*11*(2) + (44))	// 9A = 'Ü'
	.db	(0)			// 9B = ''
	.db	(0)			// 9C = ''
	.db	(1 + 5*11*(2) + (23))	// 9D = 'ß'
	.db	(1 + 5*11*(2) + ( 0))	// 9E = 'à'
	.db	(1 + 5*11*(2) + ( 1))	// 9F = 'á'
	.db	(1 + 5*11*(2) + ( 2))	// A0 = 'â'
	.db	(0)			// A1 = ''
	.db	(1 + 5*11*(2) + ( 3))	// A2 = 'ä'
	.db	(0)			// A3 = ''
	.db	(1 + 5*11*(2) + (16))	// A4 = 'œ'
	.db	(1 + 5*11*(2) + (21))	// A5 = 'ç'
	.db	(1 + 5*11*(2) + ( 4))	// A6 = 'è'
	.db	(1 + 5*11*(2) + ( 5))	// A7 = 'é'
	.db	(1 + 5*11*(2) + ( 6))	// A8 = 'ê'
	.db	(1 + 5*11*(2) + ( 7))	// A9 = 'ë'
	.db	(1 + 5*11*(2) + ( 8))	// AA = 'ì'
	.db	(1 + 5*11*(2) + ( 9))	// AB = 'í'
	.db	(1 + 5*11*(2) + (10))	// AC = 'î'
	.db	(1 + 5*11*(2) + (11))	// AD = 'ï'
	.db	(0)			// AE = ''
	.db	(1 + 5*11*(2) + (22))	// AF = 'ñ'
	.db	(1 + 5*11*(2) + (12))	// B0 = 'ò'
	.db	(1 + 5*11*(2) + (13))	// B1 = 'ó'
	.db	(1 + 5*11*(2) + (14))	// B2 = 'ô'
	.db	(0)			// B3 = ''
	.db	(1 + 5*11*(2) + (15))	// B4 = 'ö'
	.db	(1 + 5*11*(0) + (47))	// B5 = '÷'
	.db	(0)			// B6 = ''
	.db	(1 + 5*11*(2) + (17))	// B7 = 'ù'
	.db	(1 + 5*11*(2) + (18))	// B8 = 'ú'
	.db	(1 + 5*11*(2) + (19))	// B9 = 'û'
	.db	(1 + 5*11*(2) + (20))	// BA = 'ü'
	.db	(0)			// BB = ''
	.db	(0)			// BC = ''
	.db	(0)			// BD = ''
	.db	(0)			// BE = ''
	.db	(0)			// BF = ''
	.db	(1 + 5*11*(0) + (46))	// C0 = '×'
	.db	(0)			// C1 = ''
	.db	(0)			// C2 = ''
	.db	(0)			// C3 = ''
	.db	(0)			// C4 = ''
	.db	(0)			// C5 = ''
	.db	(0)			// C6 = ''
	.db	(0)			// C7 = ''
	.db	(0)			// C8 = ''
	.db	(0)			// C9 = ''
	.db	(0)			// CA = ''
	.db	(0)			// CB = ''
	.db	(0)			// CC = ''
	.db	(0)			// CD = ''
	.db	(0)			// CE = ''
	.db	(0)			// CF = ''
	.db	(0)			// D0 = ''
	.db	(0)			// D1 = ''
	.db	(0)			// D2 = ''
	.db	(0)			// D3 = ''
	.db	(0)			// D4 = ''
	.db	(0)			// D5 = ''
	.db	(0)			// D6 = ''
	.db	(0)			// D7 = ''
	.db	(0)			// D8 = ''
	.db	(0)			// D9 = ''
	.db	(0)			// DA = ''
	.db	(0)			// DB = ''
	.db	(0)			// DC = ''
	.db	(0)			// DD = ''
	.db	(0)			// DE = ''
	.db	(0)			// DF = ''
	.db	(0)			// E0 = ''
	.db	(0)			// E1 = ''
	.db	(0)			// E2 = ''
	.db	(1 + 5*11*(2) + (49))	// E3 = '€'

.align 2
field_keyboardEnterRun1:
	str	r1,[r4,0x4]
	str	r0,[r4,0x8]
	b	field_keyboardEnterRunCommon

field_keyboardEnterRun2:
	str	r3,[r0,0x4]
	str	r2,[r0,0x8]
//	b	field_keyboardEnterRunCommon

field_keyboardEnterRunCommon:
	push	r0-r1
	add	r1,=@keyboardCurrentZone
	mov	r0,0xFF
	str	r0,[r1]
	pop	r0-r1
	bx	r14

.align 2
field_keyboardDrawCaretFadeIn:
	push	r7,r14

	// Adjust caret x, y
	mov	r3,0x74
	ldrb	r3,[r4,r3]	// x
	lsl	r3,r3,0x4	// x * 16
	add	r1,r1,r3

	mov	r3,0x75
	ldrb	r3,[r4,r3]	// y
	lsl	r3,r3,0x3	// y * 8
	add	r2,r2,r3
	lsl	r3,r3,0x1	// y * 16
	add	r2,r2,r3

	// Draw caret
	bl	0x2172D88

	pop	r7,r15

.align 2
field_keyboardInitCursor:
	mov	r0,r4
	add	r0,0x82
	strb	r1,[r0]

	// Separate processing for name
	mov	r0,0x78
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@setLine	// r0 = 0

	mov	r0,0x0		// line number
@@lineLoop:
	// Stop at last line
	mov	r1,0x8A
	ldrb	r1,[r4,r1]	// lines
	sub	r1,0x1		// lines - 1
	cmp	r0,r1
	beq	@@setLine

	// Check if next line is empty
	mov	r1,0x7A
	add	r2,r1,r0
	add	r1,r2,0x1
	ldrb	r1,[r4,r1]	// next line length
	cmp	r1,0x0
	bne	@@nextLine

	// Check if this line is full
	ldrb	r1,[r4,r2]	// this line length
	mov	r2,0x89
	ldrb	r2,[r4,r2]	// max line length
	cmp	r1,r2
	blt	@@setLine

@@nextLine:
	add	r0,0x1
	b	@@lineLoop

@@setLine:
	// Set line
	mov	r1,0x75
	strb	r0,[r4,r1]
	mov	r1,0x77
	strb	r0,[r4,r1]

	// Set character position
	add	r0,0x7A
	ldrb	r0,[r4,r0]	// line length
	mov	r1,0x74
	strb	r0,[r4,r1]
	mov	r1,0x76
	strb	r0,[r4,r1]

@@end:
	mov	r0,r4
	bx	r14

.align 2
field_keyboardInsertBackspace:
	// r0 = this
	push	r4,r14
	mov	r4,r0

	// Check if keyboard in insert mode
	mov	r0,0x79
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	beq	@@erase

	// Check if this is the first char
	mov	r0,0x74
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	bgt	@@prev

	// Check if this is the first line
	mov	r0,0x75
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	bgt	@@checkName

	// Play error SFX
//	ldr	r0,=0x21206CC
//	ldr	r0,[r0]
//	mov	r1,0x69
//	bl	0x2025574
	b	@@end

@@checkName:
	// Check if type is name
	mov	r0,0x78
	ldrb	r0,[r4,r0]
	cmp	r0,0x0
	bne	@@prev		// r0 = 0

	// Go to previous char
	mov	r0,r4
	mov	r1,0x0
	mov	r2,0x0
	bl	0x2174760
	b	@@end

@@prev:
	// Go to previous char
	mov	r0,r4
	mov	r1,0x0
	mov	r2,0x0
	bl	0x2174760

@@erase:
	// Erase char
	mov	r0,r4
	bl	0x2173578

@@end:
	pop	r4,r15

	.pool

.align 2
field_keyboardLoadKeys:
	push	r14
	bl	0x2015E1C	// alloc buffer

	// Load the keys
	ldr	r0,[r4,0x10]
	mov	r1,0x2
	bl	0x2015E94	// get buffer
	mov	r1,r0
	ldr	r0,=0x211C998
	ldr	r2,=((31) << 0x10 | (188))	// subscreen_local_188
	bl	0x201231C

	pop	r15

.align 2
field_keyboardAddChar:
	mov	r3,0x0
	cmp	r5,0x37
	bge	@@end

	// Get page
	mov	r0,0x8D
	ldrb	r0,[r4,r0]
	mov	r1,(5 * 11)
	lsl	r1,r1,0x7
	mul	r0,r1
	add	r7,r7,r0
	add	r7,0x80

	lsl	r3,r5,0x7

@@end:
	mov	r0,r4
	bx	r14

.align 2
field_keyboardPreCheckTouch:
	push	r0-r2,r14

	// Check keyboard touched
	mov	r0,r5
	mov	r1,0x0
	bl	field_keyboardCheckKeyWithTouch
	cmp	r0,0xFF
	beq	@@noTouch

	// Skip buttons check
	mov	r0,0x0
	b	@@checkButtons

@@noTouch:
	mov	r0,0x1
@@checkButtons:
	pop	r0-r2
	beq	@@end		// jump if touch active

	// Check buttons pressed
	ldrh	r1,[r2,0x8]
	tst	r0,r1
@@end:
	pop	r15

.align 2
field_keyboardCheckKeyWithTouch:
	// r0 = keyboard data
	// r1 = expected key
	push	r4-r6,r14
	mov	r4,r0
	mov	r5,r1

//	mov	r0,r4
	bl	field_keyboardGetTouchKey
	cmp	r0,0x0
	beq	@@checkButtons
	mov	r5,r0

	// Set cursor
	ldrb	r0,[r5,0x5]	// cursor position
	lsl	r1,r0,0x1C
	lsr	r1,r1,0x14
	lsr	r0,r0,0x4
	orr	r0,r1
	mov	r1,0x84
	strh	r0,[r4,r1]

	ldrb	r0,[r5]
	lsl	r0,r0,0x19
	lsr	r0,r0,0x19
	b	@@end

@@checkButtons:
	// Check with buttons
	mov	r0,r4
	mov	r1,r5
	bl	0x2173DE0

	ldr	r2,=0x211DD1C
	ldrh	r2,[r2,0x2]

	// Don't repeat for page, cap, enter, exit, ok
	cmp	r0,0x39		// enter
	beq	@@checkEnterKey
	cmp	r0,0x3C		// page 1
	beq	@@checkSingle
	cmp	r0,0x3D		// page 2
	beq	@@checkSingle
	cmp	r0,0x40		// caps
	beq	@@checkSingle
	cmp	r0,0x44		// exit
	beq	@@checkSingle
	cmp	r0,0x45		// OK
	beq	@@checkSingle
	b	@@end

@@checkEnterKey:
	// A Button has priority, we need to check it first
	// Check A Button is actually pressed down this frame
	lsr	r1,r2,0x1
	bcc	@@checkEnterSelect

	// Check cursor is on Enter
	mov	r1,0x84
	ldrb	r1,[r4,r1]
	cmp	r1,0xC
	bne	@@none
	mov	r1,0x85
	ldrb	r1,[r4,r1]
	cmp	r1,0x2
	bne	@@none

	// Pressed A on Enter, this is OK
	b	@@end

@@checkEnterSelect:
	// Check Select is actually pressed down this frame
	lsr	r1,r2,0x3	// test 0x3
	bcc	@@none

	// Pressed Select and not A, this is OK
	b	@@end

@@checkSingle:
	// Check A Button is actually pressed down this frame
	lsr	r1,r2,0x1
	bcs	@@end

@@none:
	mov	r0,0xFF
	b	@@end

@@end:
	pop	r4-r6,r15

.align 2
field_keyboardGetTouchKey:
	// r0 = keyboard data
	push	r14

	// Get key being touched
	// r0 = keyboard data
	bl	field_keyboardFindTouchKey

@@checkTouchDown:
	ldr	r2,=(0x2121040+0x8)
	add	r3,=@keyboardCurrentZone
	ldrb	r1,[r2,0xC]	// touch down
	cmp	r1,0x0
	beq	@@checkTouchUp

	// Set current key
	str	r0,[r3]
	b	@@end

@@checkTouchUp:
	ldrb	r1,[r2,0xD]	// touch up
	cmp	r1,0x0
	bne	@@clearKey

@@checkTouchRepeat:
	// Don't repeat for page, cap, enter, exit, ok
	cmp	r0,0x0
	beq	@@clearKey
	ldrb	r1,[r0]
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x39		// enter
	beq	@@clearKey
	cmp	r1,0x3C		// page 1
	beq	@@clearKey
	cmp	r1,0x3D		// page 2
	beq	@@clearKey
	cmp	r1,0x40		// caps
	beq	@@clearKey
	cmp	r1,0x44		// exit
	beq	@@clearKey
	cmp	r1,0x45		// OK
	beq	@@clearKey

	ldrb	r1,[r2,0x11]	// touch repeat
	cmp	r1,0x0
	beq	@@none

	// Check key being touched is active key
	ldr	r1,[r3]
	cmp	r0,r1
	beq	@@end

@@clearKey:
	// Clear key being touched
	mov	r0,0x0
	str	r0,[r3]
	b	@@end
@@none:
	// Return empty key
	mov	r0,0x0
@@end:
	pop	r15

.align 2
field_keyboardFindTouchKey:
	// r0 = keyboard data
	push	r4-r5,r14
	mov	r4,0x78
	ldrb	r4,[r0,r4]	// keyboard type

	// Check touch screen being touched
	ldr	r1,=(0x2121040+0x8)
	ldrh	r0,[r1,0x4]
	cmp	r0,0x0
	beq	@@none
	// Check touch screen valid
	ldrh	r0,[r1,0x6]
	cmp	r0,0x0
	bne	@@none

	// Get touch screen x, y
	mov	r2,0x0
	ldsh	r0,[r1,r2]
	mov	r2,0x2
	ldsh	r1,[r1,r2]

	// Check buttons
	add	r5,=@keyboardTouchZones
@@loop:
	ldrb	r2,[r5]		// key
	cmp	r2,0xFF
	beq	@@none

	// Check in numpad
	lsl	r2,r2,0x19
	bcs	@@checkX
	cmp	r4,0x1		// Friend Code
	beq	@@next
	cmp	r4,0xA		// Number
	beq	@@next

@@checkX:
	ldrb	r2,[r5,0x1]	// x
	cmp	r0,r2
	blt	@@next
@@checkW:
	ldrb	r3,[r5,0x3]	// w
	add	r2,r2,r3
	cmp	r0,r2
	bge	@@next
@@checkY:
	ldrb	r2,[r5,0x2]	// y
	cmp	r1,r2
	blt	@@next
@@checkH:
	ldrb	r3,[r5,0x4]	// h
	add	r2,r2,r3
	cmp	r1,r2
	bge	@@next

	// Found key
	mov	r0,r5
	b	@@end

@@next:
	add	r5,0x6
	b	@@loop

@@none:
	mov	r0,0x0
//	b	@@end
@@end:
	pop	r4-r5,r15

	.pool

.align 4
@keyboardCurrentZone:
	.dw	0x0
.align 4
@keyboardTouchZones:
	// key, x, y, w, h, pos (XY)
	// key & 0x80 = visible in numpad
	.db	(0x00 | 0x80), ( 13), (102), (16), (16), (( 0) << 0x4 | ( 0))
	.db	(0x01 | 0x80), ( 29), (102), (16), (16), (( 1) << 0x4 | ( 0))
	.db	(0x02 | 0x80), ( 45), (102), (16), (16), (( 2) << 0x4 | ( 0))
	.db	(0x03 | 0x80), ( 61), (102), (16), (16), (( 3) << 0x4 | ( 0))
	.db	(0x04 | 0x80), ( 77), (102), (16), (16), (( 4) << 0x4 | ( 0))
	.db	(0x05 | 0x80), ( 93), (102), (16), (16), (( 5) << 0x4 | ( 0))
	.db	(0x06 | 0x80), (109), (102), (16), (16), (( 6) << 0x4 | ( 0))
	.db	(0x07 | 0x80), (125), (102), (16), (16), (( 7) << 0x4 | ( 0))
	.db	(0x08 | 0x80), (141), (102), (16), (16), (( 8) << 0x4 | ( 0))
	.db	(0x09 | 0x80), (157), (102), (16), (16), (( 9) << 0x4 | ( 0))
	.db	(0x0A | 0x00), (173), (102), (16), (16), ((10) << 0x4 | ( 0))
	.db	(0x0B | 0x00), ( 13), (118), (16), (16), (( 0) << 0x4 | ( 1))
	.db	(0x0C | 0x00), ( 29), (118), (16), (16), (( 1) << 0x4 | ( 1))
	.db	(0x0D | 0x00), ( 45), (118), (16), (16), (( 2) << 0x4 | ( 1))
	.db	(0x0E | 0x00), ( 61), (118), (16), (16), (( 3) << 0x4 | ( 1))
	.db	(0x0F | 0x00), ( 77), (118), (16), (16), (( 4) << 0x4 | ( 1))
	.db	(0x10 | 0x00), ( 93), (118), (16), (16), (( 5) << 0x4 | ( 1))
	.db	(0x11 | 0x00), (109), (118), (16), (16), (( 6) << 0x4 | ( 1))
	.db	(0x12 | 0x00), (125), (118), (16), (16), (( 7) << 0x4 | ( 1))
	.db	(0x13 | 0x00), (141), (118), (16), (16), (( 8) << 0x4 | ( 1))
	.db	(0x14 | 0x00), (157), (118), (16), (16), (( 9) << 0x4 | ( 1))
	.db	(0x15 | 0x00), (173), (118), (16), (16), ((10) << 0x4 | ( 1))
	.db	(0x16 | 0x00), ( 13), (134), (16), (16), (( 0) << 0x4 | ( 2))
	.db	(0x17 | 0x00), ( 29), (134), (16), (16), (( 1) << 0x4 | ( 2))
	.db	(0x18 | 0x00), ( 45), (134), (16), (16), (( 2) << 0x4 | ( 2))
	.db	(0x19 | 0x00), ( 61), (134), (16), (16), (( 3) << 0x4 | ( 2))
	.db	(0x1A | 0x00), ( 77), (134), (16), (16), (( 4) << 0x4 | ( 2))
	.db	(0x1B | 0x00), ( 93), (134), (16), (16), (( 5) << 0x4 | ( 2))
	.db	(0x1C | 0x00), (109), (134), (16), (16), (( 6) << 0x4 | ( 2))
	.db	(0x1D | 0x00), (125), (134), (16), (16), (( 7) << 0x4 | ( 2))
	.db	(0x1E | 0x00), (141), (134), (16), (16), (( 8) << 0x4 | ( 2))
	.db	(0x1F | 0x00), (157), (134), (16), (16), (( 9) << 0x4 | ( 2))
	.db	(0x20 | 0x00), (173), (134), (16), (16), ((10) << 0x4 | ( 2))
	.db	(0x21 | 0x00), ( 13), (150), (16), (16), (( 0) << 0x4 | ( 3))
	.db	(0x22 | 0x00), ( 29), (150), (16), (16), (( 1) << 0x4 | ( 3))
	.db	(0x23 | 0x00), ( 45), (150), (16), (16), (( 2) << 0x4 | ( 3))
	.db	(0x24 | 0x00), ( 61), (150), (16), (16), (( 3) << 0x4 | ( 3))
	.db	(0x25 | 0x00), ( 77), (150), (16), (16), (( 4) << 0x4 | ( 3))
	.db	(0x26 | 0x00), ( 93), (150), (16), (16), (( 5) << 0x4 | ( 3))
	.db	(0x27 | 0x00), (109), (150), (16), (16), (( 6) << 0x4 | ( 3))
	.db	(0x28 | 0x00), (125), (150), (16), (16), (( 7) << 0x4 | ( 3))
	.db	(0x29 | 0x00), (141), (150), (16), (16), (( 8) << 0x4 | ( 3))
	.db	(0x2A | 0x00), (157), (150), (16), (16), (( 9) << 0x4 | ( 3))
	.db	(0x2B | 0x00), (173), (150), (16), (16), ((10) << 0x4 | ( 3))
	.db	(0x2C | 0x00), ( 13), (166), (16), (16), (( 0) << 0x4 | ( 4))
	.db	(0x2D | 0x00), ( 29), (166), (16), (16), (( 1) << 0x4 | ( 4))
	.db	(0x2E | 0x00), ( 45), (166), (16), (16), (( 2) << 0x4 | ( 4))
	.db	(0x2F | 0x00), ( 61), (166), (16), (16), (( 3) << 0x4 | ( 4))
	.db	(0x30 | 0x00), ( 77), (166), (16), (16), (( 4) << 0x4 | ( 4))
	.db	(0x31 | 0x00), ( 93), (166), (16), (16), (( 5) << 0x4 | ( 4))
	.db	(0x32 | 0x00), (109), (166), (16), (16), (( 6) << 0x4 | ( 4))
	.db	(0x33 | 0x00), (125), (166), (16), (16), (( 7) << 0x4 | ( 4))
	.db	(0x34 | 0x00), (141), (166), (16), (16), (( 8) << 0x4 | ( 4))
	.db	(0x35 | 0x00), (157), (166), (16), (16), (( 9) << 0x4 | ( 4))
	.db	(0x36 | 0x00), (173), (166), (16), (16), ((10) << 0x4 | ( 4))
	.db	(0x39 | 0x80), (215), (139), (27), (16), ((12) << 0x4 | ( 2))	// Enter
	.db	(0x3C | 0x80), (193), (119), (18), (17), ((11) << 0x4 | ( 1))	// Page 1
	.db	(0x3D | 0x80), (193), (136), (18), (17), ((11) << 0x4 | ( 2))	// Page 2
	.db	(0x40 | 0x80), (212), (119), (18), (18), ((12) << 0x4 | ( 1))	// Caps
	.db	(0x42 | 0x80), (231), (119), (18), (18), ((13) << 0x4 | ( 1))	// Backspace
	.db	(0x44 | 0x80), (199), (167), (24), (16), ((11) << 0x4 | ( 4))	// Exit
	.db	(0x45 | 0x80), (223), (167), (24), (16), ((12) << 0x4 | ( 4))	// OK
	.db	0xFF


.align 2
field_keyboardBestComboStoreBuffers:
	push	r14
	bl	0x2020570

	ldr	r0,[r5,0x38]
	add	r1,=@keyboardBestComboBuffers
	ldr	r2,[r1]
	str	r0,[r1]
	cmp	r2,0x0
	beq	@@end

	mov	r0,r2
	bl	0x2015DEC

@@end:
	pop	r15


.align 2
field_keyboardTutorialLoad:
	push	r14

	add	r1,=@keyboardTutorialBuffers
	str	r0,[r1]

	// Set palette hack (avoid letters palette being overwritten)
	ldr	r0,=(0x21AC7F8 + 0x3C)
	mov	r1,0x1
	strb	r1,[r0]

	// Set NPC variable to 1
	ldr	r0,=0x21AC1D8
	mov	r1,0x2
	mov	r2,0x1
	mov	r3,0x1
	bl	0x216492C

	pop	r15

.align 2
field_keyboardTutorialClose:
	push	r14

	// Draw sprites
	add	r0,=@keyboardTutorialBuffers
	ldr	r0,[r0]
	bl	0x217D074

	// Unset palette hack
	ldr	r0,=(0x21AC7F8 + 0x3C)
	mov	r1,0x0
	strb	r1,[r0]

	// Set NPC variable to 0
	ldr	r0,=0x21AC1D8
	mov	r1,0x2
	mov	r2,0x1
	mov	r3,0x0
	bl	0x216492C

	// Fade in top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x19
	bl	0x2011BA4

	// Fade in bottom screen
//	mov	r0,0x20
//	str	r0,[sp]
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2011BA4
	add	sp,0x4

	add	r0,=@keyboardTutorialBuffers
	ldr	r0,[r0]
	pop	r15

.align 2
field_keyboardTutorialState14:
field_keyboardTutorialState20:
	push	r14
	mov	r1,0x55
	strb	r0,[r4,r1]

	// Draw sprites
	add	r0,=@keyboardTutorialBuffers
	ldr	r0,[r0]
	bl	0x217D074

	pop	r15

.align 2
field_keyboardRunTutorial:
	push	r14
	bl	0x21716C4
	push	r0

	// Draw sprites
	add	r0,=@keyboardTutorialBuffers
	ldr	r0,[r0]
	bl	0x217D074

	pop	r0,r15

.align 2
field_keyboardOverworldBG3:
	push	r7,r14
	bl	0x200B04C
	mov	r7,r1

	// Check flag for BG3 hack
	ldr	r1,=0xF14E
	bl	0x202409C
	cmp	r0,0x0
	beq	@@end

	// Override BG3 settings
	ldr	r0,=0x438
	strh	r0,[r7,0xE]

	// Clear flag for BG3 hack
	ldr	r1,=0xF14E
	bl	0x202405C

@@end:
	pop	r7,r15

.align 2
field_keyboardRunOnAir:
	push	r14
	bl	0x21716C4
	push	r0

	// Draw sprites
	mov	r0,r4
	bl	0x20370F8
	mov	r0,r4
	bl	0x2036E10
	mov	r0,r4
	bl	0x2037028

	pop	r0,r14

.align 2
field_keyboardFriendCodeRun:
	push	r14
	bl	0x21716C4
	push	r0
	cmp	r0,0x0
	bne	@@end

	// Unload buffers (to be reloaded)
	ldr	r0,[r4,0x18]
	bl	0x2015DEC

@@end:
	pop	r0,r15

.align 2
field_keyboardFriendCodeDrawSprites:
	mov	r0,r4
	bl	0x21502E8

	bl	0x21543F6

.align 2
field_keyboardFolderClearFirstTileBG3:
	push	r14
	bl	0x202E4CC

	// Clear only first tile (not second tile)
	mov	r1,0x1
	bl	0x202EDBC	// get address
	mov	r1,r0
	mov	r2,0x20
	bl	0x202DF14

	pop	r15

.align 2
field_keyboardEmailClearFirstTileBG1:
	push	r14
	bl	0x202E4CC

	// Clear only first tile (not second tile)
	mov	r1,0x1
	bl	0x202ED34	// get address
	mov	r1,r0
	mov	r2,0x20
	bl	0x202DF14

	pop	r15

.align 2
field_keyboardFolderInitScroll:
	sub	r0,0x18
	str	r1,[r4,r0]

	// Restore scroll position
	add	r2,=@keyboardFolderScroll
	ldr	r0,[r2]
	mov	r1,0x0
	str	r1,[r2]
	mov	r1,(0x1FA >> 0x1)
	lsl	r1,r1,0x1
	strh	r0,[r4,r1]

	bx	r14

.align 2
field_keyboardStartFreeFolder:
	push	r14

	mov	r0,0x49
	ldrb	r0,[r4,r0]
	cmp	r0,0x9		// change name
	beq	@@saveBuffer

	// Free buffers
	mov	r0,r5
	bl	0x21B0E5C
	mov	r0,r5
	bl	0x21B0DD8

	b	@@end

@@saveBuffer:
	add	r1,=@keyboardFolderBuffers
	str	r5,[r1]

	// Save scroll position
	mov	r0,(0x1FA >> 0x1)
	lsl	r0,r0,0x1
	ldsh	r0,[r5,r0]
	add	r1,=@keyboardFolderScroll
	str	r0,[r1]

@@end:
	pop	r15

.align 2
field_keyboardRunFolder:
	push	r14

	// Run keyboard
	bl	0x21716C4
	push	r0

	// Update top screen graphics
//	add	r0,=@keyboardFolderBuffers
//	ldr	r0,[r0]
//	bl	0x21B1F40	// Edit/Equip/Chg Name arrow
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1EEC	// folder selection
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1A08	// card icons
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B2074	// EQUIP label
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B20B4	// controls
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B20E4	// menu header
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1F68	// Edit/Equip/Chg Name text
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B2114	// scroll bar

	pop	r0,r15

.align 2
field_keyboardRunBrother:
	push	r14

	// Run keyboard
	bl	0x21716C4
	push	r0

	// Update top screen graphics
	mov	r0,r4
	bl	0x217E730
	mov	r0,r4
	bl	0x217E2B8

	pop	r0,r15

.align 2
field_keyboardConnectFadeOutEnable:
	push	r14
	bl	0x2039810

	add	r1,=@keyboardFadeOutEnable
	mov	r0,0x1
	str	r0,[r1]
	pop	r15

.align 2
field_keyboardConnectFadeOutDisable:
	push	r14
	bl	0x2039810

	add	r1,=@keyboardFadeOutEnable
	mov	r0,0x0
	str	r0,[r1]
	pop	r15

.align 2
field_keyboardStartConnect:
	add	r0,=@keyboardFadeOutEnable
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@normal

	ldr	r0,=0x718
	ldrb	r0,[r4,r0]
	cmp	r0,0x2
	bne	@@normal

	// Fade out bottom screen
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,0x0
	mov	r3,0x2
	bl	0x2011BA4

	// Partially fade out top screen
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4

	// Set cursor animation
	mov	r0,(0x430 >> 0x4)
	lsl	r0,r0,0x4
	add	r0,r4,r0
	mov	r1,(21)
	bl	0x2020570

	// Close text box (jump to close script)
	sub	sp,0x14
	mov	r0,0x1
	str	r0,[sp]
	lsl	r0,r0,0x8
	str	r0,[sp,0x4]
	mov	r0,0xC0
	str	r0,[sp,0x8]
	mov	r0,0xE
	str	r0,[sp,0xC]
	mov	r0,0xD
	str	r0,[sp,0x10]
	ldr	r0,[r4,0x48]
	mov	r1,(75)		// close script
	mov	r2,0x0
	mov	r3,0x1
	bl	0x20086BC
	add	sp,0x14

	bl	0x20397B6

@@normal:
	mov	r0,0x20
	str	r0,[sp]
	bl	0x20397A8

.align 2
field_keyboardStartMail:
	mov	r1,0x2
	str	r1,[r4,r0]
	push	r14

	// Partially fade out top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4

	pop	r0,r15		// pop extra for deallocation

.align 2
field_keyboardStartFriendCode:
	mov	r1,0x1
	strb	r1,[r4,r0]
	push	r14

	// Partially fade out top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4

	pop	r0,r15		// pop extra for deallocation

.align 2
field_keyboardStartOnAir:
	mov	r1,0x1
	strb	r1,[r4,r0]
	push	r14

	// Partially fade out top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x1A
	bl	0x2011BA4

	// Set cursor animation
	mov	r0,0x70
	add	r0,r4,r0
	mov	r1,(3)		// duplicate, doesn't get unset like 2
	bl	0x2020570

	// Close text box (jump to close script)
	sub	sp,0x14
	mov	r0,0x1
	str	r0,[sp]
	lsl	r0,r0,0xB
	str	r0,[sp,0x4]
	mov	r0,(0x7400 >> 0x8)
	lsl	r0,r0,0x8
	str	r0,[sp,0x8]
	mov	r0,0xF
	str	r0,[sp,0xC]
	mov	r0,0xD
	str	r0,[sp,0x10]
	ldr	r0,[r4,0x14]
	mov	r1,0x0
	bl	0x2015E94	// get buffer
	mov	r1,(46)		// close script
	mov	r2,0x0
	mov	r3,0x1
	bl	0x20086BC
	add	sp,0x14

	pop	r0,r15		// pop extra for deallocation

.align 2
field_keyboardLoadGraphics:
	// Disable bottom screen
	ldr	r0,=0x2120928
	ldr	r0,[r0]
	bl	0x202CBB4

	// Allocate touch targets
	ldr	r0,=0x2121090
	ldr	r0,[r0]
	mov	r1,0x64
	mov	r2,0x0
	bl	0x202DAE4

	pop	r3-r5,r15


.align 2
field_keyboardClosedReloadFolder:
	push	r14

	bl	field_keyboardClosedReloadTranser

	ldr	r5,[r4,0xC]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardClosedReloadFolder2:
	push	r14
	mov	r4,r0

	// Unload sprites (to be reloaded)
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end

	// Update top screen graphics
//	add	r0,=@keyboardFolderBuffers
//	ldr	r0,[r0]
//	bl	0x21B1F40	// Edit/Equip/Chg Name arrow
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1EEC	// folder selection
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1A08	// card icons
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B2074	// EQUIP label
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B20B4	// controls
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B20E4	// menu header
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B1F68	// Edit/Equip/Chg Name text
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B2114	// scroll bar

	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B0E5C
	add	r0,=@keyboardFolderBuffers
	ldr	r0,[r0]
	bl	0x21B0DD8

	mov	r0,0x0
	add	r1,=@keyboardFolderBuffers
	str	r0,[r1]

@@end:
	mov	r1,0x1
	pop	r15

.align 2
field_keyboardClosedReloadMail2:
	push	r14
	mov	r4,r0

	// Unload sprites (to be reloaded)
	ldr	r2,=0x1018
	ldr	r0,[r4,r2]
	cmp	r0,0x0
	beq	@@end

	// Draw sprites
	mov	r0,r4
	bl	0x2184420

	ldr	r2,=0x1018
	ldr	r0,[r4,r2]
	mov	r1,0x0
	str	r1,[r4,r2]
	bl	0x2015DEC

@@end:
	mov	r1,0x1
	pop	r15

.align 2
field_keyboardClosedReloadBrother:
	push	r14

	bl	field_keyboardClosedReloadTranser

	// Unload sprites (to be reloaded)
	mov	r0,r4
	bl	0x217D05C

	ldr	r5,[r4,0x14]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardClosedReloadBestCombo:
	push	r14

	// Check if this is post-battle
	ldrb	r0,[r4,0x10]
	cmp	r0,0x0
	beq	@@transer

@@postBattle:
	// Fade in top screen
	mov	r0,0x20
	push	r0
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x19
	bl	0x2011BA4
	add	sp,0x4
	b	@@unload

@@transer:
	bl	field_keyboardClosedReloadTranser
	b	@@unload

@@unload:
	// Unload sprites (to be reloaded)
	mov	r0,0x0
	str	r0,[r4,0x44]

	add	r1,=@keyboardBestComboBuffers
	ldr	r0,[r1]
	cmp	r0,0x0
	beq	@@end
	mov	r2,0x0
	str	r2,[r1]
	bl	0x2015DEC

@@end:
	ldr	r5,[r4,0x60]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardBestComboClose:
	push	r14

	add	r1,=@keyboardBestComboBuffers
	ldr	r0,[r1]
	cmp	r0,0x0
	beq	@@end
	mov	r2,0x0
	str	r2,[r1]
	bl	0x2015DEC

@@end:
	bl	0x2008DD0

	pop	r15

	.pool

.align 4
@keyboardFadeOutEnable:
	.dw	0x0
@keyboardFolderScroll:
	.dw	0x0
@keyboardFolderBuffers:
	.dw	0x0
@keyboardTutorialBuffers:
	.dw	0x0
@keyboardBestComboBuffers:
	.dw	0x0


.align 2
field_keyboardClosedReloadOnAir:
	push	r14

	bl	field_keyboardClosedReloadTranser

	// Unload sprites (to be reloaded)
	ldr	r0,[r4,0x14]
	bl	0x2015DEC

	ldr	r5,[r4,0x20]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardClosedReloadConnect:
field_keyboardClosedReloadFriendCode:
	push	r0,r14

	bl	field_keyboardClosedReloadTranser

	pop	r0
	ldr	r5,[r4,r0]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardClosedReloadMail:
	push	r14

	bl	field_keyboardClosedReloadTranser

@@end:
	ldr	r5,[r4,0x10]
	cmp	r5,0x0
	pop	r15

.align 2
field_keyboardClosedReloadTranser:
	push	r0,r14		// push extra for allocation

	// Re-enable bottom screen
	ldr	r0,=0x2120928
	ldr	r0,[r0]
	bl	0x202CB58

	// Fade in top screen
	mov	r0,0x20
	str	r0,[sp]
	ldr	r0,=0x211C964
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,0x1
	mov	r3,0x19
	bl	0x2011BA4

	pop	r0,r15

	.pool




.align 2
field_openMailBrotherSelection:
	// Default on Satellite
	ldr	r1,=0xAD8
	add	r1,r5,r1
	mov	r0,0x6
	strh	r0,[r1]
	mov	r0,0x1
	strh	r0,[r1,0x2]
	strh	r0,[r1,0x4]

	mov	r0,r5
	pop	r3-r7,r15

	.pool

.align 2
field_drawBrotherNameOrder:
	push	r14
	// Check if this is last-first order
	ldr	r1,[sp,0x8+0x4]	// Brother index
	bl	0x200BDC8
	cmp	r0,0x81
	beq	@@firstLast
	// Get Brother type
	ldr	r1,[sp,0x8+0x4]
	bl	0x200D04C
	ldr	r1,=0x820D	// L.M. Shin
	cmp	r0,r1
	beq	@@firstLast
	lsr	r0,r0,0x9	// test 0x100 (Real Brother)
	bcc	@@lastFirst
@@firstLast:
	add	r5,0xE
	b	@@setNextNamePart
@@lastFirst:
	add	r4,0xE
//	b	@@setNextNamePart
@@setNextNamePart:
	str	r5,[sp,0xC+0x4]
	pop	r15


.align 2
field_bufferMysteryWaveCard:
	lsl	r1,r1,0x2
	add	r1,r4,r1
	ldrb	r2,[r1,0x4]	// color
	ldr	r1,[r1]		// card ID

	// Check if Star Card
	cmp	r1,(170)
	bgt	@@end
	cmp	r2,0x2		// mega
	bne	@@end

	// Change to Star Card name
	add	r1,(0x100 + 50 - 1 - 0xFF)
	add	r1,0xFF
@@end:
	bx	r14


.align 2
field_initFolderSelectOption:
	// r1 in use
	add	r2,=field_selectedFolder
	ldr	r3,[r2]
	cmp	r3,0x0
	beq	@@end
	sub	r0,r3,0x1	// set to previously selected folder
	mov	r3,0x0
	str	r3,[r2]		// clear previously selected folder
@@end:
	sub	r1,0x9
	bx	r14

.align 2
field_returnToFolderSelect:
	push	r14
	add	r1,0x49
	strb	r0,[r1]

	// Set index of folder we were editing
	ldrb	r0,[r1,0x7]
	add	r0,0x1
	add	r1,=field_selectedFolder
	str	r0,[r1]

	pop	r15

.align 4
field_selectedFolder:
	// 0 = not set, otherwise index of folder +1
	.dw	0x0


.align 4
field_pulseInScript:
	// Check Mega is here
	.dh	0x15	:: .dh	0x55
			:: .dw	0x21A2C0C-(.-4)
	// Check area is Living Module
	.dw	0x5C	:: .dw	field_jumpIfAreaNotEqual|1
			:: .db	0x05, 0x04		:: .align 4
			:: .dw	0x21A2BCC-(.-12)
//	// Check story progress is last
//	.dh	0x14	:: .db	0x00, 0x63
//			:: .dw	0x21A2BCC-(.-4)
	// Check on last wavehole
	.dw	0x1C	:: .dw	0xB1
			:: .dw	0x21A2BCC-(.-8)
	// Check saved before final boss
	.dh	0x15	:: .dh	0xF13A
			:: .dw	0x21A2BCC-(.-4)
	// Set flag
	.dh	0x21	:: .dh	0xF13A
	// Cancel pulse in
	.dw	0x13	:: .dw	0x21A2C0C-(.-4)


.align 2
field_jumpIfAreaNotEqual:
	// r0 = area+subarea
	push	r3,r5,r15
	ldr	r5,[r4,0x10]	// script pointer

	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrh	r1,[r1]		// area+subarea
	cmp	r1,r0
	beq	@@continue

	// Do jump
	ldrb	r0,[r5,0xC]
	ldrb	r1,[r5,0xD]
	ldrb	r2,[r5,0xE]
	ldrb	r3,[r5,0xF]
	lsl	r1,r1,0x8
	lsl	r2,r2,0x10
	lsl	r3,r3,0x18
	orr	r0,r1
	orr	r0,r2
	orr	r0,r3
	add	r5,r5,r0
	sub	r5,0xC
	b	@@end

@@continue:
	add	r5,(0x10-0xC)
@@end:
	str	r5,[r4,0x10]
	mov	r0,0x0
	pop	r3,r5,r15


	.pool


.align 2
field_exObjectTypes:
	cmp	r0,0x85
	blt	@@end
	add	r1,=@exObjectTypes
	sub	r0,0x85
@@end:
	lsl	r0,r0,0x4
	add	r1,r1,r0
	bx	r14

.align 4
@exObjectTypes:
	// 0x85 - Boss panel southwest
	.db	0x02,0x00,0xFF,0x00
	.dw	0x21990E4, 0x2198E48, 0x219933C


.align 2
field_satelliteTranserIcon:
	// from 02158D08
	ldr	r0,[r0]
	push	r0,r14

	// Calc palette offset
	bl	common_getPlayerSatellite
	mov	r1,0x20
	mul	r0,r1

	add	r1,r5,r0

	pop	r0,r15


.align 2
field_scrollScannerSatellite:
	push	r14
	sub	sp,0x18

	// Get small tilemap buffer
	ldr	r0,[r5,0xC]
	mov	r1,0xF		// buffer 0xF
	bl	0x2015E94
	mov	r3,r0

	// Copy to big tilemap
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	mov	r0,0x6A
	ldsh	r0,[r5,r0]	// scroll position
	add	r0,0x40+0x8	// scroll offset
	str	r0,[sp,0x8]
	mov	r0,0xD		// y-position
	str	r0,[sp,0xC]
	mov	r0,(10)		// width
	str	r0,[sp,0x10]
	mov	r0,(2)		// height
	str	r0,[sp,0x14]
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x2
	bl	0x200B748

	// Set scroll
	mov	r0,0x6A
	ldsh	r0,[r5,r0]	// scroll position
	add	r0,0x40+0x8+0xA	// scroll offset
	str	r0,[sp]
	mov	r0,0xD
	str	r0,[sp,0x4]
	mov	r2,0x2
	str	r2,[sp,0x8]
	mov	r0,0xA
	str	r0,[sp,0xC]
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x2
	mov	r3,0x0
	bl	0x200B900

	mov	r0,0x6A
	ldsh	r0,[r5,r0]	// scroll position
	add	r0,0x40+0x8-0x2	// scroll offset
	str	r0,[sp]
	// Rest of the variables already set
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x2
	mov	r3,0x0
	bl	0x200B900

@@end:
	ldr	r0,[r5,0xC]
	mov	r1,0x9
	add	sp,0x18
	pop	r15


.align 2
field_drawScannerSatellite:
	push	r14
	// r4, r6, r7 free (no need to (de-)allocate)
	sub	sp,0x18

	// Alloc temp buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	ldr	r2,=(10 * 0x20 * 2)
	bl	0x20155DC
	mov	r4,r0		// buffer

	// Clear temp buffer
//	ldr	r0,=0x2122A34
//	ldr	r0,[r0]
	mov	r1,r4
	ldr	r2,=(10 * 0x20 * 2)
	bl	0x202DEE8

	// Get buffer 0 (message file)
	ldr	r0,[r5,0xC]
	mov	r1,0x0
	bl	0x2015E94
	mov	r6,r0

	// Check Scanner active
	bl	0x20228D4
	cmp	r0,0x0
	beq	@@copyTiles

	// Get Wave Scanner satellite
	bl	0x2022940
	mov	r1,(65)		// script 65+
	add	r7,r1,r0

	// Check neutral satellite
	ldr	r0,=0x213BB58
	ldrb	r0,[r0,0x3]
	lsr	r0,r0,0x5	// test 0x10
	bcc	@@drawText

	mov	r7,(68)		// script 68

@@drawText:
	// Draw text
	ldr	r0,=(10 * 0x20 * 2)
	str	r0,[sp]
	mov	r0,0x0
	str	r0,[sp,0x4]
	mov	r0,r6		// buffer 0
	mov	r1,r7
	mov	r2,0x2
	mov	r3,r4		// temp buffer
	bl	0x2008804

@@copyTiles:
	// Copy to tileset
	ldr	r0,=(10 * 0x20 * 2)
	str	r0,[sp]
//	ldr	r0,=0x21239A4
	mov	r1,0x1
	ldr	r2,=0x44A0
	mov	r3,r4		// temp buffer
	bl	0x202EEE8

	// Free temp buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,r4		// temp buffer
	bl	0x2015620	// free from heap

	// Get small tilemap buffer
	ldr	r0,[r5,0xC]
	mov	r1,0xF		// buffer 0xF
	bl	0x2015E94
	mov	r4,r0		// small tilemap

	// Generate small tilemap
	mov	r1,(2)		// height
	str	r1,[sp]
//	mov	r0,r4
	ldr	r1,=0x44A0
	mov	r2,0x0		// start
	mov	r3,(10)		// width
	bl	0x2009FA8

	// Copy to big tilemap
	mov	r0,0x0
	str	r0,[sp]
	str	r0,[sp,0x4]
	mov	r0,0x6A
	ldsh	r0,[r5,r0]	// scroll position
	add	r0,0x40+0x8	// scroll offset
	str	r0,[sp,0x8]
	mov	r0,0xD		// y-position
	str	r0,[sp,0xC]
	mov	r0,(10)		// width
	str	r0,[sp,0x10]
	mov	r0,(2)		// height
	str	r0,[sp,0x14]
	ldr	r0,=0x210F350
	mov	r1,0x1
	mov	r2,0x2
	mov	r3,r4		// small tilemap
	bl	0x200B748

@@end:
	mov	r0,r5
	mov	r1,0x0
	add	sp,0x18
	pop	r15


.align 2
field_mysteryWaveSpin:
	push	r0-r1,r14
	bl	0x2020728	// set palette
	pop	r0-r1
	cmp	r1,0x3		// gold
	bne	@@end
	mov	r1,0x3		// animation 3 (spin backwards)
	strb	r1,[r4,0x10]	// set direction
	bl	0x2020570	// change animation
@@end:
	pop	r15


.align 2
field_changeNpcSpriteBuffered:
	push	r14

	// Get value
	bl	0x215CEE8

	// Load from buffer if bit 0x8000 set
	lsl	r1,r0,0x11	// test 0x8000
	bcc	@@end

	lsr	r0,r1,0x11
	bl	field_getNpcSpriteBuffer
@@end:
	pop	r15

.align 2
field_getNpcSpriteBuffer:
	// r0 = buffer
	add	r1,=field_npcSpriteBuffers
	lsl	r0,r0,0x1
	ldrh	r0,[r1,r0]
	bx	r14

.align 2
field_setNpcSpriteBuffer:
	// r0 = buffer
	// r1 = sprite
	add	r2,=field_npcSpriteBuffers
	lsl	r0,r0,0x1
	strh	r1,[r2,r0]
	bx	r14

.align 4
field_npcSpriteBuffers:
	.fill	(8 * 0x2)


.align 2
field_twoWayCollision:
	push	r0-r3,r14
	
	// Trigger collision normally
	bl	0x215D5F8

	// Trigger collision in reverse
	ldr	r0,[sp]
	ldr	r1,[sp,0x8]
	ldr	r2,[sp,0x4]
	bl	0x215D5F8

	// Check in Harp Note minigame
	mov	r1,(0x460 >> 0x4)
	lsl	r1,r1,0x4
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Remove hitscan collision to avoid 2 notes
	// being hit, but only 1 point being counted
@@checkObj1Hitscan:
	// If object 1 is hitscan, remove its collision
	ldr	r0,[sp,0x4]
	ldr	r1,[r0,0x28]	// object
	ldr	r1,[r1]		// object vtable
	ldr	r2,=0x21A662C	// hitscan vtable
	cmp	r1,r2
	bne	@@checkObj2Hitscan

	mov	r1,0x0
	str	r1,[r0,0x20]
	str	r1,[r0,0x24]

@@checkObj2Hitscan:
	// If object 2 is hitscan, remove its collision
	ldr	r0,[sp,0x8]
	ldr	r1,[r0,0x28]	// object
	ldr	r1,[r1]		// object vtable
	ldr	r2,=0x21A662C	// hitscan vtable
	cmp	r1,r2
	bne	@@end

	mov	r1,0x0
	str	r1,[r0,0x20]
	str	r1,[r0,0x24]

@@end:
	pop	r0-r3,r15


.align 2
field_hideOmegaXisFromMegaScreen:
	mov	r1,(43)		// script 43
	mov	r2,0x0
	push	r0-r3,r14
	ldr	r1,=0xF129
	bl	0x202409C	// check flag
	cmp	r0,0x0
	pop	r0-r3
	beq	@@end
	mov	r1,(64)		// script 64
@@end:
	pop	r15


.align 2
field_traderStarDescription:
	lsr	r3,r3,0x18
	push	r0,r2-r4,r14
	mov	r4,r1
	ldrh	r1,[r4,0x2]	// card ID
	cmp	r1,(170)
	bgt	@@end
	ldrb	r0,[r4,0xC]	// color flags
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
	add	r1,r0,0x1

	// Pack into 32 bit with original card ID
	lsl	r1,r1,0x10
	ldrh	r0,[r4,0x2]
	add	r1,r1,r0

@@end:
	pop	r0,r2-r4,r15


.align 2
field_starTraderConfirmCards:
	push	r0,r14

	// Check if Star Trader
	ldr	r0,=0x577
	ldrb	r0,[r4,r0]
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1C
	cmp	r0,0x4
	bne	@@normal

	// Get cards being put in trader
	ldr	r0,[r4,0x14]
	mov	r1,0x4
	bl	0x2015E94	// get buffer by ID

	// Get total number of cards
	ldr	r3,=0x54A
	ldsh	r3,[r4,r3]

@@getFirst:
	// Get first card
	ldrh	r1,[r0]
	cmp	r1,0x00
	beq	@@giveNothing
	cmp	r1,(251)	// Star Ticket
	bne	@@loop
	sub	r3,0x1
	add	r0,0x4
	b	@@getFirst

	// Check all the same card
@@loop:
	sub	r3,0x1
	beq	@@giveStarCard
	add	r0,0x4
	ldrh	r2,[r0]
	cmp	r2,0x0
	beq	@@giveStarCard
	cmp	r2,(251)	// Star Ticket
	beq	@@loop
	cmp	r1,r2
	beq	@@loop

@@giveNothing:
	mov	r1,(85)		// script 85
	mov	r2,0x17
	b	@@end

@@noStarCard:
	mov	r1,(88)		// script 88
	mov	r2,0x17
	b	@@end

@@giveStarCard:
	// Check if card has a star card
	ldr	r0,=data_extraCardInfo
	lsl	r2,r1,0x1
	ldrh	r0,[r0,r2]		// &FF00 = flags
	lsr	r0,r0,(0x8 + 0x4)	// check flag 0x8
	bcc	@@giveNothing

@@normal:
	mov	r1,0x52
	mov	r2,0x10
@@end:
	pop	r0,r15


.align 2
field_startRemoveAllCardTrader:
	push	r14
	mov	r1,0x4
	tst	r0,r1
	beq	@@checkRight

	// Check if there are any cards to remove
	mov	r0,r4
	ldr	r1,=0x54A
	ldrb	r1,[r4,r1]
	bl	0x217A28C
	cmp	r0,0x0
	beq	@@end

	// Start script 84
	mov	r0,r4
	mov	r1,(84)		// script 84
	mov	r2,0x16		// go to state 0x16
	bl	0x217A254	// start text

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x89		// "select" SFX
	bl	0x2025574	// play SFX
@@end:
	add	sp,0x4
	bl	0x217C2C2

@@checkRight:
	mov	r1,0x10
	tst	r0,r1
	pop	r15


.align 2
field_handleCardTraderStates:
	push	r7,r14
	cmp	r0,0x16
	beq	@@removeAll
	cmp	r0,0x17
	beq	@@starTraderFail
	b	@@normal

@@starTraderFail:
	// Check if script finished
	bl	0x2008D9C
	cmp	r0,0x1
	beq	@@end

	// Get card count
	mov	r0,r4
	ldr	r1,=0x54A
	ldrb	r1,[r4,r1]
	bl	0x217A28C

	// Remove last card
	sub	r0,0x1
	mov	r1,(0x548 >> 0x3)
	lsl	r1,r1,0x3
	strh	r0,[r4,r1]

	mov	r0,0x14
	b	@@setState

@@removeAll:
	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@cancel

	// Check confirm
	mov	r0,0x2
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	bne	@@end

	// Check choice
	bl	0x2008DC0
	cmp	r0,0x0
	bne	@@cancel

	// Get card count
	mov	r0,r4
	ldr	r1,=0x54A
	ldrb	r1,[r4,r1]
	bl	0x217A28C
	mov	r7,r0
	beq	@@cancel

@@loop:
	// Get card data
	sub	r1,r7,0x1
	mov	r0,0x12
	mul	r1,r0
	ldr	r0,[r4,0x1C]
	add	r1,r0,r1

	// Push card data on stack
	sub	sp,0x14
	mov	r0,sp
	bl	0x2176F4C

	// Add to card box
	pop	r1-r3
	mov	r0,r4
	bl	0x217909C
	add	sp,0x8

	// Remove from trader
	mov	r0,r4
	mov	r1,0x0
	sub	r2,r7,0x1
	bl	0x2179568

	sub	r7,0x1
	bne	@@loop

	// Set list update
	mov	r0,0x1
	ldr	r1,=0x56A
	strb	r0,[r4,r1]
	add	r1,0x1
	strb	r0,[r4,r1]

	// Do list update
	mov	r0,r4
	bl	0x217CAAC

@@cancel:
	mov	r0,0xC
@@setState:
	ldr	r1,=0x571
	strb	r0,[r4,r1]
@@end:
	pop	r7
	add	sp,0x4
	bl	0x217C2C2

@@normal:
	sub	r0,0xA
	cmp	r0,0xB
	pop	r7,r15


.align 2
field_canEmptyFolder:
	push	r0-r1,r3-r4,r14
	bl	0x217A2C0	// get normal cards
	mov	r4,r0

	// Check if Legend Card in folder
	pop	r0
	ldr	r0,[r0,0x14]
	mov	r1,0x4
	bl	0x2015E94	// get buffer with ID

	pop	r1
	mov	r2,0x0
@@loop:
	cmp	r2,r1
	bge	@@end

	ldrh	r3,[r0]
	cmp	r3,0xFF
	ble	@@next
	sub	r3,0xFF
	cmp	r3,0xA
	bgt	@@next		// 0x100 - 0x109
	add	r4,0x1

@@next:
	add	r0,0x4
	add	r2,0x1
	b	@@loop

@@end:
	mov	r0,r4
	pop	r3-r4,r15


.align 2
field_sanitizePack:
	push	r4-r7,r14
	mov	r4,r0
	mov	r7,(0x550 >> 0x4)
	lsl	r7,r7,0x4
	ldsh	r5,[r4,r7]	// old pack size

	// Perform folder/pack action
//	mov	r0,r4
	bl	0x217A2F8

	// Check if card removed from pack
	ldsh	r0,[r4,r7]	// new pack size
	cmp	r5,r0
	ble	@@end

	ldr	r6,[r4,0x20]	// pack data
	mov	r7,0x0		// current index
	b	@@endsPackData
@@loopPackData:
	ldrh	r0,[r6,0x2]
	cmp	r0,0x0
	bne	@@nextPackData

	// Found empty slot, move everything after it up
	sub	r2,r5,r7
	sub	r2,0x1
	mov	r0,0x12
	mul	r2,r0
	cmp	r2,0x0
	ble	@@end		// nothing to copy
	mov	r0,r6
	add	r0,0x12
	mov	r1,r6
	blx	0x2090818

	// Clear last slot
	sub	r1,r5,0x1
	mov	r0,0x12
	mul	r1,r0
	ldr	r6,[r4,0x20]	// pack data
	add	r1,r6,r1
	mov	r0,0x0
	mov	r2,0x12
	blx	0x2090800

	b	@@adjustSlots

@@nextPackData:
	add	r6,0x12
	add	r7,0x1
@@endsPackData:
	cmp	r7,r5
	blt	@@loopPackData
	b	@@end

@@adjustSlots:
	// -1 to everything higher than r7
	ldr	r0,[r4,0x14]
	mov	r1,0x3
	bl	0x2015E94

	mov	r6,0x0
	b	@@endsSlots
@@loopSlots:
	ldr	r1,[r0]
	cmp	r1,r7
	ble	@@nextSlots
	sub	r1,0x1
	str	r1,[r0]
@@nextSlots:
	add	r0,0x4
	add	r6,0x1
@@endsSlots:
	cmp	r6,r5
	blt	@@loopSlots

@@end:
	pop	r4-r7,r15


.align 2
field_checkLegendModeCipherMail:
	ldr	r1,[sp]
	ldr	r0,[r0]
	push	r0-r1,r6-r7,r14

	// Check Legend Mode active
	ldr	r1,=0xF03D
	bl	0x202409C	// check flag
	beq	@@end

	// Check game not cleared
	mov	r6,(0x800 >> 0x8)
	lsl	r1,r6,0x8
	bl	0x202409C	// check flag
	bne	@@end

	add	r0,=field_cipherMailUnlockFlags
	lsl	r1,r4,0x1
	ldrh	r0,[r0,r1]	// get flag
	ldr	r1,=0xFFFF	// always available
	cmp	r0,r1
	beq	@@end

	// Game clear flag
	lsl	r1,r6,0x8
	ldr	r7,=0xF11F	// need to reach credits
	cmp	r0,0x0
	beq	@@checkFlag

	// Specific flag
	sub	r7,0x1		// need to find hint
	mov	r1,r0

@@checkFlag:
	bl	0x202409C	// check flag
	bne	@@end

	// Set message flag
	mov	r1,r7
	bl	0x2024018	// set flag

	// Go to "invalid" message
	pop	r0-r1,r6-r7
	add	sp,0x4
	bl	0x2184032

@@end:
	pop	r0-r1,r6-r7,r15

	.pool

.align 4
field_cipherMailUnlockFlags:
	.dh	0xF12B	// 00	NGAMEMA RESCAFROT
	.dh	0x1869	// 01	OSLEGRATE
	.dh	0x1851	// 02	SIXGAME-O
	.dh	0x1842	// 03	NROSIMAMSTU
	.dh	0x1856	// 04	ALPTUNZLA
	.dh	0x1861	// 05	ISNBDUBO
	.dh	0x0000	// 06	KMALEETZCP
	.dh	0x1854	// 07	PREOBCOPB
	.dh	0x184A	// 08	LAREBARAON
	.dh	0x1847	// 09	AURIEFRUTS
	.dh	0x1871	// 0A	NGYNGIWCUS
	.dh	0x185C	// 0B	ROHNATPE
	.dh	0x1852	// 0C	ILABCLERSAS
	.dh	0x1877	// 0D	IPHAUEOEUNQC
	.dh	0x1875	// 0E	KNIGSPIAREM
	.dh	0xF11D	// 0F	CENCARLEBBUB
	.dh	0x187A	// 10	DWOWOOLFS
	.dh	0x0000	// 11	I love Battle Network!
	.dh	0x1864	// 12	ALIVURISZE
	.dh	0x0000	//	Ride On the Wave Road!
	.dh	0x0000	//	Time to bust some EM viruses!
	.dh	0x0000	//	Win big with a Star Force Big Bang!
	.dh	0x0000	//	Let's combine our strength!
	.dh	0x0000	//	Store info in your Transer!
	.dh	0x0000	//	Go On Air to trade info with friends.
	.dh	0x0000	//	Transers are really useful!
	.dh	0x0000	//	Let's send some e-mail!
	.dh	0x0000	//	Battle your friend On Air!
	.dh	0x0000	//	How many more until you have all the cards?
	.dh	0x0000	//	Wave Battle with your rare cards!
	.dh	0x0000	//	Time to go On Air!
	.dh	0x0000	//	Pegasus, Leo, Dragon - which is for you?
	.dh	0x0000	//	Get stronger through BrotherBands!
	.dh	0x0000	//	Wave Change! Geo Stelar, On The Air!!
	.dh	0x0000	//	Ride On! Wave Battle!
	.dh	0x0000	//	Let's form a BrotherBand!
	.dh	0x0000	//	Beat viruses with Battle Cards!
	.dh	0x0000	//	Only you can protect the Wave Road!
	.dh	0x0000	//	Fuse with Mega to Wave Change!
	.dh	0x0000	//	Transform with Star Force power!
	.dh	0x0000	//	Power up with pals through BrotherBands.
	.dh	0x0000	//	Show off your skills in hot Wave Battles!
	.dh	0x0000	//	Fly away for skies unknown!
	.dh	0x0000	//	Legendary Master Shin
	.dh	0x0000	//	Brother Action RPG
	.dh	0x0000	//	Taurus Fire
	.dh	0x0000	//	Dec. 17, 1986
	.dh	0x0000	//	The internet connects the world.
	.dh	0x0000	//	Check out the Mega Man website!
	.dh	0x0000	//	Search for info on the web!
	.dh	0x0000	//	Our BrotherBands make us strong!
	.dh	0x0000	//	Awaken the Wave Battler inside!
	.dh	0x0000	//	Visualizer: Glasses of Mystery
	.dh	0x0000	//	Wave Battle in the Wave World!
	.dh	0x0000	//	A. Boreal's AMAKEN
	.dh	0x0000	//	Star Force, the ultimate power!
	.dh	0x0000	//	Wave Battling is wild!
	.dh	0x0000	//	3 different powers can be yours!
	.dh	0x0000	//	Proof of Friendship - BrotherBand!
	.dh	0x0000	//	Mega Man 20th Anniversary Game
	.dh	0xFFFF	//	NERYEDGLA
	.dh	0x0000	//	SNULTHGIARNK
	.dh	0x0000	//	May the Sun shine forever in our hearts!
	.dh	0x0000	//	Up your game with Mega Man Star Force DX!
	.dh	0x0000	//	Go beyond your limit with the Wave Scanner!
	.dh	0xFFFF	//	MegaMan Unity April Fools!


.align 2
field_checkBoktaiGMWPickup:
	push	r14

	// Check if player has Boktai Brother
	bl	0x215AE9C
	cmp	r0,0x0
	beq	@@end

	// Check if this is Boktai GMW
	ldrb	r1,[r4]
	mov	r2,r7
	bl	0x215AB24

@@end:
	pop	r15


.align 2
field_mailComposePressStart:
	// Load continued down (override single down)
	ldrh	r2,[r4,r0]

	mov	r3,r0
	add	r3,0x14
	ldrb	r3,[r4,r3]

	lsr	r5,r2,0x4	// test 0x8
	bcs	@@pressStart

	bx	r14

@@pressStart:
	add	r0,0x14
	mov	r1,0x5
	strb	r1,[r4,r0]
	bl	0x21851BA	// jump to end


.align 2
field_megaEquipWeapon:
	push	r14

	ldr	r0,=0x21206CC
	ldr	r0,[r0]	
	ldr	r1,=SE_MEGAEQUIP
	bl	0x2025574

	bl	0x20332C4
	pop	r15


.align 2
field_megaMenu1:
	cmp	r1,0x1
	blt	@@script0
	beq	@@script1
	cmp	r1,0x32
	beq	@@script50

@@end:
	bx	r14

@@script0:
	cmp	r0,0x0
	beq	@@weapon

	// Update script number
	mov	r0,0x32
	mov	r1,0xA0
	strb	r0,[r4,r1]	// current script

	b	@@end

@@script1:
	cmp	r0,0x0
	beq	@@weapon
	b	@@viruses

@@weapon:
	bl	0x2185958	// choose weapon

@@script50:
	cmp	r0,0x1
	beq	@@records

@@viruses:
	ldr	r1,=0xF10E
	bl	0x2024018	// set flag
	b	@@loadMenu

@@records:
	ldr	r1,=0xF10E
	bl	0x202405C	// clear flag
//	b	@@loadMenu

@@loadMenu:
	// Reset script number
	mov	r0,0x9C
	mov	r1,0xA0
	ldrb	r0,[r4,r0]	// original script
	strb	r0,[r4,r1]	// current script

	bl	0x218592A	// load menu

.align 2
field_megaMenu2:
	push	r14
	mov	r0,0xA0
	ldrb	r0,[r4,r0]	// current script
	cmp	r0,0x32
	bne	@@end

	// Reload script
	mov	r0,0xFF
	mov	r1,0x9C
	strb	r0,[r4,r1]
	mov	r0,r4
	bl	0x218830C
	mov	r1,0xA0
	strb	r0,[r4,r1]

	// Abort rest of function
	add	sp,0x4
	bl	0x2185A92

@@end:
	pop	r15

.align 2
field_megaMenu3:
	cmp	r0,0x2
	beq	@@script2
	cmp	r0,0x3
	beq	@@viruses
	cmp	r0,0x33
	beq	@@script51
@@end:
	bx	r14

@@script2:
	// Update script number
	mov	r0,0x33
	mov	r1,0xA0
	strb	r0,[r4,r1]	// current script
	b	@@end

@@script51:
	bl	0x2008DC0
	cmp	r0,0x0
	bne	@@records

@@viruses:
	ldr	r1,=0xF10E
	bl	0x2024018	// set flag
	b	@@loadMenu

@@records:
	ldr	r1,=0xF10E
	bl	0x202405C	// clear flag
//	b	@@loadMenu

@@loadMenu:
	// Reset script number
	mov	r0,0x9C
	mov	r1,0xA0
	ldrb	r0,[r4,r0]	// original script
	strb	r0,[r4,r1]	// current script

//	bl	0x2185EDA
	bl	0x2185EE4	// skip SFX

.align 2
field_megaMenu4:
	push	r14
	mov	r0,0xA0
	ldrb	r0,[r4,r0]	// current script
	cmp	r0,0x33
	bne	@@end

	// Reload script
	mov	r0,0xFF
	mov	r1,0x9C
	strb	r0,[r4,r1]
	mov	r0,r4
	bl	0x218830C
	mov	r1,0xA0
	strb	r0,[r4,r1]

	// Abort rest of function
	add	sp,0x4
	bl	0x2185FD0

@@end:
	pop	r15


.align 2
field_transerIcons:
	push	r4-r7,r14
	mov	r4,r0
	mov	r7,0x0

	// Get NPC data
	ldr	r2,[r4,0x30]
	mov	r0,0xD4
	ldrh	r2,[r2,r0]
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrb	r5,[r1,0x2]	// get chapter
	ldrb	r0,[r1]		// get area
	ldrb	r1,[r1,0x1]	// get subarea
	bl	0x21891E0

	// Get Transer ID
	ldrh	r0,[r0,0x4]
	cmp	r0,0x47		// max Transer ID
	bgt	@@end

	add	r6,=@@transerQuestData
	lsl	r0,r0,0x3	// * 8
	add	r6,r6,r0

@@checkHasQuest:
	ldrb	r0,[r6]
	cmp	r0,0x0
	beq	@@end

@@checkComplete:
	ldrh	r1,[r6,0x6]
	bl	0x202409C	// check flag
	bne	@@end

@@checkChapter:
	ldrb	r1,[r6,0x1]
	cmp	r5,r1
	blt	@@end

@@checkPrerequisite:
	ldrh	r1,[r6,0x2]
	cmp	r1,0x0
	beq	@@setAvailable
	bl	0x202409C	// check flag
	beq	@@end
@@setAvailable:
	mov	r7,0x1

@@checkInProgress:
	ldrh	r1,[r6,0x4]
	bl	0x202409C	// check flag
	beq	@@end
@@setInProgress:
	mov	r7,0x2

@@end:
	mov	r0,r4
	add	r0,0x40
	mov	r1,r7
	bl	0x2020570	// change animation

	mov	r0,r4
	bl	0x216C648	// original function
	pop	r4-r7,r14

	.pool

.align 4
@@transerQuestData:
	// +0x00 = Exists
	// +0x01 = Minimum chapter
	// +0x02 = Prerequisite flag
	// +0x04 = In progress flag
	// +0x06 = Completed flag
	// 00 Geo Stelar
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 01 Kelvin Stelar
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 02 Hope Stelar
	.db	0x01, 0x64
	.dh	0x0000, 0x182B, 0x1869
	// 03 Aaron Boreal
	.db	0x01, 0x64
	.dh	0x0000, 0x183D, 0x187B
	// 04 Sonia Strumm
	.db	0x01, 0x64
	.dh	0x0800, 0x183C, 0x187A
	// 05 Luna Platz
	.db	0x01, 0x64
	.dh	0x0800, 0x182D, 0x186B
	// 06 Bud Bison
	.db	0x01, 0x64
	.dh	0x0800, 0x182E, 0x186C
	// 07 Zack Temple
	.db	0x01, 0x64
	.dh	0x0800, 0x182F, 0x186D
	// 08 Bob Copper
	.db	0x01, 0x64
	.dh	0x0800, 0x1836, 0x1874
	// 09 Tom Dubius
	.db	0x01, 0x13
	.dh	0x0000, 0x1833, 0x1871
	// 0A Mitch Shepar
	.db	0x01, 0x34
	.dh	0x0000, 0x1835, 0x1873
	// 0B Ken Suther
	.db	0x01, 0x64
	.dh	0x0800, 0x182C, 0x186A
	// 0C Pat Sprigs
	.db	0x01, 0x64
	.dh	0x0800, 0x1834, 0x1872
	// 0D L.M. Shin
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 0E Chrys Golds
	.db	0x01, 0x34
	.dh	0x0000, 0x1831, 0x186F
	// 0F Cindy White
	.db	0x01, 0x03
	.dh	0x0000, 0x1800, 0x183E
	// 10 Quiero Mocard
	.db	0x01, 0x03
	.dh	0x0000, 0x1801, 0x183F
	// 11 Joe Hawnt
	.db	0x01, 0x22
	.dh	0x0000, 0x1802, 0x1840
	// 12 Iver Gatte
	.db	0x01, 0x03
	.dh	0x0000, 0x1803, 0x1841
	// 13 Chase Winde
	.db	0x01, 0x12
	.dh	0x0000, 0x1804, 0x1842
	// 14 Juan Mocard
	.db	0x01, 0x12
	.dh	0x0000, 0x1805, 0x1843
	// 15 Chatty Ditz
	.db	0x01, 0x05
	.dh	0x0000, 0x1806, 0x1844
	// 16 Millie Booney
	.db	0x01, 0x05
	.dh	0x0000, 0x1807, 0x1845
	// 17 Sumar Guy
	.db	0x01, 0x05
	.dh	0x0000, 0x1808, 0x1846
	// 18 Grace Fulle
	.db	0x01, 0x05
	.dh	0x0000, 0x1809, 0x1847
	// 19 Leroy Mann
	.db	0x01, 0x05
	.dh	0x0000, 0x180A, 0x1848
	// 1A Swill Waters
	.db	0x01, 0x05
	.dh	0x0000, 0x180B, 0x1849
	// 1B Polly Reade
	.db	0x01, 0x05
	.dh	0x0000, 0x180C, 0x184A
	// 1C Edgar Knight
	.db	0x01, 0x11
	.dh	0x1848, 0x180D, 0x184B
	// 1D Tuggy McGrav
	.db	0x01, 0x13
	.dh	0x0000, 0x180E, 0x184C
	// 1E Mira Lookes
	.db	0x01, 0x13
	.dh	0x0000, 0x180F, 0x184D
	// 1F Savory Delejo
	.db	0x01, 0x25
	.dh	0x0000, 0x1810, 0x184E
	// 20 Holly Wacher
	.db	0x01, 0x25
	.dh	0x0000, 0x1811, 0x184F
	// 21 Blair Loude
	.db	0x01, 0x25
	.dh	0x0000, 0x1812, 0x1850
	// 22 Job Goode
	.db	0x01, 0x25
	.dh	0x0000, 0x1813, 0x1851
	// 23 Rad Contre
	.db	0x01, 0x25
	.dh	0x0000, 0x1814, 0x1852
	// 24 Barry Square
	.db	0x01, 0x34
	.dh	0x0000, 0x1815, 0x1853
	// 25 Triv Query
	.db	0x01, 0x25
	.dh	0x0000, 0x1816, 0x1854
	// 26 Teresa Tudor
	.db	0x01, 0x45	// from 0x34
	.dh	0x0000, 0x1817, 0x1855
	// 27 Ema Nesia
	.db	0x01, 0x25
	.dh	0x0000, 0x1818, 0x1856
	// 28 Will Knappe
	.db	0x01, 0x26
	.dh	0x0000, 0x1819, 0x1857
	// 29 Nadia Kleen
	.db	0x01, 0x53
	.dh	0x0000, 0x181A, 0x1858
	// 2A Lei Zeek
	.db	0x01, 0x25
	.dh	0x0000, 0x181B, 0x1859
	// 2B Dee Jay
	.db	0x01, 0x34
	.dh	0x0000, 0x181C, 0x185A
	// 2C Collin Waytin
	.db	0x01, 0x34
	.dh	0x0000, 0x181D, 0x185B
	// 2D Indy Darke
	.db	0x01, 0x34
	.dh	0x0000, 0x181E, 0x185C
	// 2E Heidi Rune
	.db	0x01, 0x34
	.dh	0x0000, 0x181F, 0x185D
	// 2F Donna Query
	.db	0x01, 0x00
	.dh	0x1854, 0x1820, 0x185E
	// 30 Rheema Deller
	.db	0x01, 0x34
	.dh	0x0000, 0x1821, 0x185F
	// 31 Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 32 Annie Olde
	.db	0x01, 0x34
	.dh	0x0000, 0x1822, 0x1860
	// 33 Kurt Taylor
	.db	0x01, 0x34
	.dh	0x0000, 0x1823, 0x1861
	// 34 Homer Park
	.db	0x01, 0x34
	.dh	0x0000, 0x1824, 0x1862
	// 35 Sluger Park
	.db	0x01, 0x34
	.dh	0x0000, 0x1825, 0x1863
	// 36 Meala DeVour
	.db	0x01, 0x45
	.dh	0x0000, 0x1826, 0x1864
	// 37 Selah Agane
	.db	0x01, 0x45
	.dh	0x0000, 0x1827, 0x1865
	// 38 Roy Query
	.db	0x01, 0x00
	.dh	0x185E, 0x1828, 0x1866
	// 39 Mead Greene
	.db	0x01, 0x53
	.dh	0x0000, 0x1829, 0x1867
	// 3A John Forman
	.db	0x01, 0x53
	.dh	0x0000, 0x182A, 0x1868
	// 3B Claud Pincer
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 3C Mr. Famous
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 3D Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 3E Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 3F Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 40 Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 41 Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 42 Veil Platz
	.db	0x01, 0x45
	.dh	0x0000, 0x1837, 0x1875
	// 43 Vaughn Platz
	.db	0x01, 0x45
	.dh	0x0000, 0x1838, 0x1876
	// 44 Dummy
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 45 Prof. Snake
	.db	0x01, 0x45
	.dh	0x0000, 0x1839, 0x1877
	// 46 Damian Wolfe
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000
	// 47 Jean Couronne XIV
	.db	0x00, 0x00
	.dh	0x0000, 0x0000, 0x0000


.align 2
field_getOpacityForArea:
	push	r14

	// Check area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r1,[r0,0x1]	// sub area
	ldrb	r0,[r0]		// area

	cmp	r0,0x80
	blt	@@realWorld
	cmp	r0,0x90
	blt	@@compSpace
	cmp	r0,0x95
	beq	@@labModule
	cmp	r0,0x96
	blt	@@waveRoad
	beq	@@deepSpace

	b	@@default

@@realWorld:
	mov	r0,0xD
	mov	r1,0x3

	// Adjust based on global timer
	ldr	r2,=0x212E428
	ldr	r2,[r2]
	lsr	r2,r2,0x3
	lsl	r2,r2,0x1D
	lsr	r2,r2,0x1D
	add	r3,=@@opacityCurve
	ldrb	r2,[r3,r2]
	sub	r0,r0,r2
	add	r1,r1,r2

	b	@@end

@@compSpace:
@@deepSpace:
@@default:
	mov	r0,0xE
	mov	r1,0x2
	b	@@end

@@labModule:
	cmp	r1,0x5
	bne	@@waveRoad

	mov	r0,0x6
	mov	r1,0xA
	b	@@end

@@waveRoad:
	mov	r0,0xE
	mov	r1,0x2
	b	@@end

@@end:
	pop	r15

.align 4
@@opacityCurve:
	.db	0, 1, 2, 3, 4, 3, 2, 1


/*
.align 2
field_showWaveRoadObject:
	push	r14

	// Check if object has "only visible in Wave World" flag
	mov	r0,0xD4
	ldr	r0,[r4,r0]
	ldr	r0,[r0,0x8]
	ldrh	r0,[r0]
	ldr	r1,=0xD08
	cmp	r0,r1
	bne	@@show

	// Check area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	cmp	r0,0x90
	bge	@@show

	// 2 frame show, 1 frame hide
	ldr	r0,=0x212E428
	ldr	r0,[r0]
	lsl	r0,r0,0x1
	lsr	r0,r0,0x1
	mov	r1,0x3
	blx	0x208985C	// mod s32
	cmp	r0,0x2
	bge	@@hide

@@show:
	mov	r0,r4
	add	r0,0x40
	bl	0x202067C	// show sprite
	b	@@end
@@hide:
	mov	r0,r4
	add	r0,0x40
	bl	0x2020688
//	b	@@end
@@end:
	pop	r15
*/


.align 2
field_showWaveRoadNPC:
	push	r14

	// Check if NPC has "on Wave Road" flag
	mov	r0,r5
	mov	r1,0x40
	bl	0x215CD48
	cmp	r0,0x0
	beq	@@show

	// Check area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	cmp	r0,0x90
	bge	@@show

//	b	@@hide

	// 2 frame show, 1 frame hide
	ldr	r0,=0x212E428
	ldr	r0,[r0]
	lsl	r0,r0,0x1
	lsr	r0,r0,0x1
	mov	r1,0x3
	blx	0x208985C	// mod s32
	cmp	r0,0x2
	bge	@@hide

@@show:
//	mov	r0,r4
//	bl	0x2020718	// clear semi-transparent
//	mov	r0,r4
//	bl	0x202070C	// set semi-transparent
	mov	r0,r4
	bl	0x202067C	// show sprite
	b	@@end

@@hide:
//	mov	r0,r4
//	bl	0x202070C	// set semi-transparent
	mov	r0,r4
	bl	0x2020688	// hide sprite
//	b	@@end

@@end:
//	mov	r0,r4
//	bl	0x202067C	// show sprite
	pop	r15


.align 2
field_waveRoadIncreaseOpacity:
	push	r0,r6-r7,r14
	mov	r4,r0

	// Set default target opacity
	bl	field_getOpacityForArea
	mov	r6,r0
	mov	r7,r1

	// Check wave beam active
	ldr	r1,=0xF038
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@end

@@opacity1:
	ldr	r0,=(0x2117B34+0x52)
	ldrb	r1,[r0]
	cmp	r1,r6
	bgt	@@decrease1
	beq	@@opacity2
//	blt	@@increase1
@@increase1:
	add	r1,0x1
	b	@@set1
@@decrease1:
	sub	r1,0x1
//	b	@@set1
@@set1:
	strb	r1,[r0]

@@opacity2:
	ldrb	r1,[r0,0x1]
	cmp	r1,r7
	bgt	@@decrease2
	beq	@@end
//	blt	@@increase2
@@increase2:
	add	r1,0x1
	b	@@set2
@@decrease2:
	sub	r1,0x1
//	b	@@set2
@@set2:
	strb	r1,[r0,0x1]

@@end:
	mov	r1,0x0
	pop	r0,r6-r7,r15


.align 2
field_waveBeamHeld:
	push	r14

	// Clear wave beam active
	ldr	r1,=0xF038
	bl	0x202405C	// clear flag

	// Check not waiting to receive e-mail
	ldr	r1,=0xD27
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkArea

	// Skip movement, too
	add	sp,0x4
	bl	0x2170EDA

@@checkArea:
	mov	r0,r4

	// Check area
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	ldrb	r2,[r1,0x1]
	ldrb	r1,[r1]

	// Check if we are on an EM-Road
	cmp	r1,0x96
	beq	@@doWaveBeam	// area 96 is OK
	cmp	r1,0x90
	blt	@@checkMovement
	cmp	r1,0x95
	blt	@@doWaveBeam	// area 90-94 are OK
	bgt	@@checkMovement
	cmp	r2,0x5
	beq	@@checkMovement	// area 95 is OK if subarea not 05

@@doWaveBeam:
	// Check watched pulse in tutorial
	ldr	r1,=0x23A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@checkMovement

	// Check Y Button held
	ldr	r1,=0x211DD1C
	ldrh	r1,[r1]
	lsr	r1,r1,0xC
	bcc	@@checkMovement

	// Change to wave beam state
	mov	r0,r4
	ldr	r1,=field_waveBeamState|1
	mov	r2,0x0
	bl	0x2170838
	mov	r0,0x40
	add	sp,0x4
	pop	r4,r15

@@checkMovement:
	mov	r0,r4
	bl	0x2170F20
	pop	r15


.align 2
field_waveBeamNoInteraction:
	push	r4,r14
	ldrh	r4,[r0]

	// Check wave beam active
	ldr	r1,=0xF038
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// Ignore button press
	mov	r4,0x0
@@end:
	mov	r1,r4
	mov	r0,0x1
	pop	r4,r15


.align 2
field_drawWaveBeam:
	push	r4-r7,r14
	sub	sp,0x14
	mov	r4,r2		// origin (0x5280 = center)
	mov	r5,r0		// wave beam info
	str	r1,[sp,0x10]	// active

//	// Decrease Wave Road opacity
//	ldr	r0,=(0x2117B34+0x52)
//	ldrb	r1,[r0]
//	sub	r1,0x1
//	cmp	r1,0x9
//	bge	@@setOpacity1
//	mov	r1,0x9
//@@setOpacity1:
//	strb	r1,[r0]
//
//	ldrb	r1,[r0,0x1]
//	add	r1,0x1
//	cmp	r1,0x7
//	ble	@@setOpacity2
//	mov	r1,0x7
//@@setOpacity2:
//	strb	r1,[r0,0x1]

@@drawCursor:
	// Draw cursor
	ldr	r3,=0xC700
	ldr	r2,=0x40001000

	// Increment cursor animation
	ldrb	r0,[r5,0x2]
	add	r0,0x1
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1C
	strb	r0,[r5,0x2]

	// Add cursor active
	ldr	r1,[sp,0x10]
	cmp	r1,0x0
	beq	@@cursorInactive
@@cursorActive:
	add	r3,0x4
	lsr	r0,r0,0x2
	lsl	r0,r0,0x1F
	lsr	r0,r0,0x1E
	add	r3,r3,r0
	b	@@setCursorPos
@@cursorInactive:
	lsr	r0,r0,0x3
	lsl	r0,r0,0x1
	add	r3,r3,r0

@@setCursorPos:
	ldr	r0,[r5,0x4]	// x-position
	asr	r0,r0,0xC
	sub	r0,0x8
	lsl	r0,r0,0x17
	lsr	r0,r0,0x7
	add	r2,r2,r0

	ldr	r1,[r5,0x8]	// y-position
	asr	r1,r1,0xC
	sub	r1,0x8
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	add	r2,r2,r1

	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	bl	0x1FF8F40

@@drawLine:
	// Calculate distance to cursor
	ldr	r0,[r5,0x8]	// cursor y
	ldr	r1,[r5,0x4]	// cursor x
	asr	r0,r0,0xC
	asr	r1,r1,0xC
	lsr	r2,r4,0x8	// player y
	sub	r0,r0,r2
	lsl	r2,r4,0x18
	lsr	r2,r2,0x18	// player x
	sub	r1,r1,r2
	push	r0-r1		// save dx, dy
	mul	r0,r0
	mul	r1,r1
	add	r0,r0,r1
	lsl	r0,r0,0xC

	// floor(sqrt(dx² + dy²))
	blx	0x208970C	// FX_Sqrt
	mov	r7,r0

	// Calculate a = atan2(dy, dx)
	pop	r0-r1
	blx	0x2089C10	// FX_Atan2Idx

	// Calc sin(a) and cos(a)
	ldr	r3,=0x20F0C98	// FX_SinCosTable
	lsr	r1,r0,0x4
	lsl	r1,r1,0x2
	add	r0,r1,0x2
	ldsh	r2,[r3,r0]	// FX_CosIdx
	ldsh	r3,[r3,r1]	// FX_SinIdx

	// Start drawing line
	str	r2,[sp,0x8]	// cos(a)
	str	r3,[sp,0xC]	// sin(a)

	// Get and increment line offset
	ldrb	r6,[r5,0x1]
	add	r6,0x2
	cmp	r6,0xA		// dot interval
	blt	@@setLineOffset
	sub	r6,0xA

@@setLineOffset:
	strb	r6,[r5,0x1]

@@lineLoop:
	lsl	r0,r6,0xC
	cmp	r0,r7
	bge	@@end

	// Translate player coordinates along line
	ldr	r0,[sp,0x8]	// cos(a)
	ldr	r1,[sp,0xC]	// sin(a)
	mul	r0,r6		// dz * cos(a)
	mul	r1,r6		// dz * sin(a)
	asr	r0,r0,0xC
	asr	r1,r1,0xC
	lsl	r2,r4,0x18
	lsr	r2,r2,0x18	// player x
	add	r0,r0,r2
	lsr	r2,r4,0x8	// player y
	add	r1,r1,r2

	// Draw line dot
	ldr	r3,=0xC6FE
//	mov	r2,0x0

	sub	r0,0x4
	lsl	r0,r0,0x17
	lsr	r2,r0,0x7
//	add	r2,r2,r0

	sub	r1,0x4
	lsl	r1,r1,0x18
	lsr	r1,r1,0x18
	add	r2,r2,r1

	// Change color if active
	ldr	r0,[sp,0x10]
	cmp	r0,0x0
	beq	@@drawDot
	add	r3,0x1

@@drawDot:
	ldr	r0,=0x211CDC0
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	bl	0x1FF8F40

	add	r6,0xA		// dot interval
	mov	r0,0x1
	eor	r6,r0
	b	@@lineLoop

@@end:
	add	sp,0x14
	pop	r4-r7,r15


	.pool


.align 2
field_waveBeamState:
	push	r4-r7,r14
	sub	sp,0x28
	mov	r4,r0		// player object
	mov	r5,r0		// state variables
	add	r5,0x50

	// Lock player controls
	ldr	r0,[r4,0x4]
	mov	r1,0x20
	orr	r0,r1
	str	r0,[r4,0x4]

	// Check current substate
	ldrb	r0,[r5]
	cmp	r0,0x0
	bne	@@state1

@@state0:
	// Initialize position
	mov	r0,(256/2)
	mov	r1,(192/2)

	ldrh	r2,[r4,0xC]	// player direction
	cmp	r2,0x7
	bgt	@@initPos
	lsl	r2,r2,0x1
	add	r3,=@@startOffsets
	add	r3,r3,r2

	ldrb	r2,[r3]
	lsl	r2,r2,0x18
	asr	r2,r2,0x18
	add	r0,r0,r2

	ldrb	r2,[r3,0x1]
	lsl	r2,r2,0x18
	asr	r2,r2,0x18
	add	r1,r1,r2

@@initPos:
	lsl	r0,r0,0xC
	lsl	r1,r1,0xC
	str	r0,[r5,0x4]	// cursor x
	str	r1,[r5,0x8]	// cursor y

	mov	r0,0x1
	strb	r0,[r5]		// substate

@@state1:
	// Set animation
	ldr	r0,[r5,0x4]	// cursor x
	ldr	r1,[r5,0x8]	// cursor y
	str	r0,[sp,0x20]	// previous cursor x
	str	r1,[sp,0x24]	// previous cursor y

	asr	r0,r0,0xC
	asr	r1,r1,0xC
	cmp	r0,(256/2)
	bge	@@faceEast
@@faceWest:
	cmp	r1,(192/2)
	bge	@@faceSW
@@faceNW:
	mov	r0,0x1E
	mov	r1,0x7
	b	@@setAnim
@@faceSW:
	mov	r0,0x1D
	mov	r1,0x5
	b	@@setAnim
@@faceEast:
	cmp	r1,(192/2)
	bge	@@faceSE
@@faceNE:
	mov	r0,0x1B
	mov	r1,0x1
	b	@@setAnim
@@faceSE:
	mov	r0,0x1C
	mov	r1,0x3
//	b	@@setAnim
@@setAnim:
	strb	r0,[r4,0x1]
	strh	r1,[r4,0xC]


	// Initialize touch targets
	ldr	r0,=0x212E2C0
	mov	r1,0x0
	bl	0x2032D4C

	ldr	r0,=common_skipObjectInitForOneFrame
	mov	r1,0x1
	str	r1,[r0]


	// Check snapping timer
	ldrb	r0,[r5,0x3]	// snapping timer
	cmp	r0,0x0		// free movement
	beq	@@findTouchTarget

	sub	r0,0x1
	strb	r0,[r5,0x3]	// snapping timer

	// Check if already snapping to a target
	ldr	r0,[r5,0xC]	// current target
	cmp	r0,0x0
	beq	@@findTouchTarget

	// Check if D-pad not already pressed down
	ldr	r2,=0x211DD1C
	ldrb	r1,[r2,0xC]	// buttons held in previous frame - only read lower 8 bits
	lsr	r1,r1,0x4
	bne	@@continueSnap
	// Check new D-pad direction pressed down
	ldrb	r1,[r2,0x2]	// new buttons held down - only read lower 8 bits
	lsr	r1,r1,0x4
	beq	@@continueSnap

	mov	r0,0x0
	strb	r0,[r5,0x3]	// snapping timer
	b	@@findTouchTarget

@@continueSnap:
	// Snap to target
	str	r0,[sp,0x8]	// current target
	mov	r1,0x0
	str	r1,[sp,0xC]	// distance (shouldn't be used)
	add	r0,0x22
	mov	r1,0x0
	ldsh	r1,[r0,r1]	// target x
	ldrh	r2,[r0,0x4]	// width
	asr	r2,r2,0x1
	add	r1,r1,r2	// center x
	str	r1,[sp,0x10]
	mov	r1,0x2
	ldsh	r1,[r0,r1]	// target y
	ldrh	r2,[r0,0x6]	// height
	asr	r2,r2,0x1
	add	r1,r1,r2	// center y
	str	r1,[sp,0x14]

	// Skip D-pad
	b	@@snapToTouchTarget


@@findTouchTarget:
	// Go through touch targets
	ldr	r6,=0x2121090
	ldr	r6,[r6]
	ldr	r7,[r6,0x14]	// end pointer
	ldr	r6,[r6,0x8]	// current pointer

	// Find closest touch target
	mov	r0,0x0
	str	r0,[sp,0x8]	// closest touch target
	mov	r0,0x20		// distance threshold
	str	r0,[sp,0xC]	// minimum distance

@@loopTouchTargets:
	cmp	r6,r7
	bge	@@checkDpad

	// Check if target should be active
	ldr	r0,[r6]
	ldrh	r0,[r0,0x10]	// ID
/*	mov	r1,(0x148 >> 0x1)
	lsl	r1,r1,0x1
	cmp	r0,r1
	ble	@@checkTouchTargetPosition
	add	r1,(0x155 - 0x148)
	cmp	r0,r1
	bgt	@@checkTouchTargetPosition*/

	bl	common_isPulseInPointActive
	cmp	r0,0x0
	beq	@@nextTarget

@@checkTouchTargetPosition:
	// Get center of touch target
	ldr	r3,[r6]
	add	r3,0x22
	mov	r0,0x0
	mov	r1,0x2

	ldsh	r0,[r3,r0]	// left x
	cmp	r0,0xFF
	bgt	@@nextTarget

	ldsh	r1,[r3,r1]	// top y
	cmp	r1,0xBF
	bgt	@@nextTarget

	ldrh	r2,[r3,0x4]	// width
	add	r2,r0,r2	// right x
	bmi	@@nextTarget
	ldrh	r2,[r3,0x4]	// width
	asr	r2,r2,0x1
	add	r0,r0,r2	// center x

	ldrh	r2,[r3,0x6]	// height
	add	r2,r1,r2	// bottom y
	bmi	@@nextTarget
	ldrh	r2,[r3,0x6]	// height
	asr	r2,r2,0x1
	add	r1,r1,r2

	// Save center x, y
	push	r0-r1

	// Get distance to cursor position
	ldr	r2,[r5,0x4]	// x-position
	ldr	r3,[r5,0x8]	// y-position
	asr	r2,r2,0xC
	asr	r3,r3,0xC

	// Calculate round(sqrt(dx² + dy²))
	sub	r0,r0,r2
	sub	r1,r1,r3
	mul	r0,r0
	mul	r1,r1
	add	r0,r0,r1
	lsl	r0,r0,0xC
	blx	0x208970C	// FX_Sqrt
	asr	r0,r0,0xB
	add	r0,0x1
	asr	r2,r0,0x1

	// Restore center x, y
	pop	r0-r1

	// Compare to previous distance
	ldr	r3,[sp,0xC]
	cmp	r2,r3
	bcs	@@nextTarget	// unsigned greater or equal

	// Set as closest touch target
	ldr	r3,[r6]
	str	r3,[sp,0x8]	// touch target
	str	r2,[sp,0xC]	// distance
	str	r0,[sp,0x10]	// center x
	str	r1,[sp,0x14]	// center y

@@nextTarget:
	add	r6,0x8
	b	@@loopTouchTargets


@@checkDpad:
	// Get D-pad input
	ldr	r2,=0x211DD1C
	ldrb	r2,[r2]		// Only read lower 8 bits
	lsr	r2,r2,0x4
	lsl	r2,r2,0x1
	beq	@@noDpad

@@moveCursor:
	// Get position
	ldr	r0,[r5,0x4]	// cursor x
	ldr	r1,[r5,0x8]	// cursor y

	// Get movement delta
	add	r3,=@@moveSpeeds
	add	r3,r3,r2

	// Update x-position
	ldrb	r2,[r3]		// x-delta
	lsl	r2,r2,0x18
	asr	r2,r2,0xC
	add	r0,r0,r2

	// Update y-position
	ldrb	r2,[r3,0x1]	// y-delta
	lsl	r2,r2,0x18
	asr	r2,r2,0xC
	add	r1,r1,r2

	// Set new position
	str	r0,[r5,0x4]	// cursor x
	str	r1,[r5,0x8]	// cursor y
	b	@@snapToTouchTarget

@@noDpad:
	// Clear last snap target and snapping timer
	mov	r0,0x0
	strb	r0,[r5,0x3]	// snapping timer
	str	r0,[r5,0xC]	// snapping target


@@snapToTouchTarget:
	// Check if there is a touch target
	ldr	r2,[sp,0x8]	// closest target
	cmp	r2,0x0
	beq	@@noSnap

	// Check snapping timer
	ldrb	r0,[r5,0x3]	// snapping timer
	cmp	r0,0x0		// free movement
	bne	@@setSnapTarget

	// Check same as last target
	ldr	r0,[r5,0xC]	// snapping target
	cmp	r0,r2
	beq	@@checkBounds

@@setSnapTarget:
	// Set snap target
	str	r2,[r5,0xC]	// snapping target

	ldr	r0,[sp,0x14]	// target y
	ldr	r1,[sp,0x10]	// target x

@@snapTargetMinY:
	cmp	r0,0x0
	bge	@@snapTargetMaxY
	mov	r0,0x0
@@snapTargetMaxY:
	cmp	r0,0xBF
	ble	@@snapTargetMinX
	mov	r0,0xBF
@@snapTargetMinX:
	cmp	r1,0x0
	bge	@@snapTargetMaxX
	mov	r1,0x0
@@snapTargetMaxX:
	cmp	r1,0xFF
	ble	@@moveToTouchTarget
	mov	r1,0xFF

@@moveToTouchTarget:
	str	r0,[sp,0x14]	// target y
	str	r1,[sp,0x10]	// target x
	lsl	r0,r0,0xC
	lsl	r1,r1,0xC

	// Calculate a = atan2(dy, dx)
	ldr	r2,[r5,0x8]	// cursor y
	ldr	r3,[r5,0x4]	// cursor x
	sub	r0,r0,r2
	sub	r1,r1,r3

	// Check if close to target
	asr	r2,r0,0xC	// dx
	asr	r3,r1,0xC	// dy
	mov	r7,0x2		// +2
	sub	r6,r7,0x4	// -2

	cmp	r2,r6
	blt	@@setSnapDelay
	cmp	r2,r7
	bgt	@@setSnapDelay
	cmp	r3,r6
	blt	@@setSnapDelay
	cmp	r3,r7
	ble	@@checkAlreadyOnTarget

@@setSnapDelay:
	mov	r2,0x14		// snapping timer
	strb	r2,[r5,0x3]

@@checkAlreadyOnTarget:
	// Check if already on target
	cmp	r0,0x0
	bne	@@calcTouchTargetAngle
	cmp	r1,0x0
	beq	@@checkBounds
	
@@calcTouchTargetAngle:
	blx	0x2089C10	// FX_Atan2Idx

	// Calc sin(a) and cos(a)
	ldr	r2,=0x20F0C98	// FX_SinCosTable_
	lsr	r1,r0,0x4
	lsl	r1,r1,0x2
	add	r0,r1,0x2
	ldsh	r0,[r2,r0]	// FX_CosIdx
	ldsh	r1,[r2,r1]	// FX_SinIdx

	// Calculate dx = dz * cos(a) and dy = dz * sin(a)
	mov	r2,0x4		// snapping speed (TODO can be lsl)
	mul	r0,r2
	mul	r1,r2

	// Adjust cursor
	ldr	r2,[r5,0x4]	// cursor x
	ldr	r3,[r5,0x8]	// cursor y
	add	r2,r2,r0	// x += dx
	add	r3,r3,r1	// y += dy

	// Make sure we don't go beyond the touch target
	ldr	r6,[sp,0x10]	// target x
	ldr	r7,[sp,0x14]	// target y
	lsl	r6,r6,0xC
	lsl	r7,r7,0xC

@@snapBoundX:
	cmp	r0,0x0
	bge	@@snapToRight
@@snapToLeft:
	cmp	r2,r6
	bge	@@snapBoundY
	b	@@snapX
@@snapToRight:
	cmp	r2,r6
	ble	@@snapBoundY
@@snapX:
	mov	r2,r6

@@snapBoundY:
	cmp	r1,0x0
	bge	@@snapToDown
@@snapToUp:
	cmp	r3,r7
	bge	@@setSnapPos
	b	@@snapY
@@snapToDown:
	cmp	r3,r7
	ble	@@setSnapPos
@@snapY:
	mov	r3,r7

@@setSnapPos:
	str	r2,[r5,0x4]	// cursor x
	str	r3,[r5,0x8]	// cursor y
	b	@@checkBounds

@@noSnap:
	// Clear snapping timer and target
	mov	r0,0x0		// free movement
	str	r0,[r5,0xC]	// snapping target
	strb	r0,[r5,0x3]	// snapping timer


@@checkBounds:
	// Get position
	ldr	r0,[r5,0x4]	// cursor x
	ldr	r1,[r5,0x8]	// cursor y
	asr	r0,r0,0xC
	asr	r1,r1,0xC

@@checkMinX:
	cmp	r0,0x0
	bge	@@checkMaxX
	mov	r0,0x0
	str	r0,[r5,0x4]

@@checkMaxX:
	cmp	r0,0xFF
	ble	@@checkMinY
	mov	r0,(0x100000 >> 16)
	lsl	r0,r0,0x10
	sub	r0,0x1
	str	r0,[r5,0x4]

@@checkMinY:
	cmp	r1,0x0
	bge	@@checkMaxY
	mov	r1,0x0
	str	r1,[r5,0x8]

@@checkMaxY:
	cmp	r1,0xBF
	ble	@@drawBeam
	mov	r1,(0xC0000 >> 16)
	lsl	r1,r1,0x10
	sub	r1,0x1
	str	r1,[r5,0x8]

@@drawBeam:
	// Draw wave beam
	mov	r0,r5		// wave beam info
	ldr	r1,[sp,0x8]	// active
	ldr	r2,=0x5280	// origin
	bl	field_drawWaveBeam

@@checkState:
	// Check Y Button not held
	ldr	r1,=0x211DD1C
	ldrh	r1,[r1]
	lsr	r1,r1,0xC
	bcs	@@end

//	mov	r0,r4
//	bl	0x2170E4C
//	cmp	r0,0x40
//	beq	@@end

	// Unlock player controls
	ldr	r0,[r4,0x4]
	mov	r1,0x20
	bic	r0,r1
	str	r0,[r4,0x4]

	// Check if near touch target
	ldr	r0,[sp,0x8]
	cmp	r0,0x0
	beq	@@clear

	// Set up simulated touch
	ldr	r1,=common_simulatedTouchObject
	str	r0,[r1]

	ldr	r1,=0xF037
	bl	0x2024018	// set flag

	// Store x-position
	mov	r0,((0xF2E0 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// r0 = ptr to x coordinate
	ldr	r1,[sp,0x10]	// target x
//	lsl	r1,r1,0x10
//	asr	r1,r1,0x10

@@checkTouchMinX:
	cmp	r1,0x0
	bge	@@checkTouchMaxX
	mov	r1,0x0
@@checkTouchMaxX:
	cmp	r1,0xFF
	ble	@@storeTouchX
	mov	r1,0xFF
@@storeTouchX:
	strb	r1,[r0]

	// Store y-position
	mov	r0,((0xF2E8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070FC	// r0 = ptr to y coordinate
	ldr	r1,[sp,0x14]	// target y
//	lsl	r1,r1,0x10
//	asr	r1,r1,0x10

@@checkTouchMinY:
	cmp	r1,0x0
	bge	@@checkTouchMaxY
	mov	r1,0x0
@@checkTouchMaxY:
	cmp	r1,0xBF
	ble	@@storeTouchY
	mov	r1,0xBF
@@storeTouchY:
	strb	r1,[r0]

@@clear:
	// Clear state variables
	mov	r1,r4
	add	r1,0x50
	mov	r2,0x14
	bl	0x202DEE8	// memory clear

	// Return to normal state
	ldr	r3,=0x21A722C
	mov	r0,r4
	ldmia	[r3]!,r1,r2
	bl	0x2170838

	// Clear wave beam active flag
	ldr	r1,=0xF038
	bl	0x202405C	// clear flag

	b	@@end2

@@end:
	// Set wave beam active flag
	ldr	r1,=0xF038
	bl	0x2024018	// set flag

@@end2:
	add	sp,0x28
	pop	r4-r7,r15

	.pool

.align 4
@@startOffsets:
	.db	0x00,0xE0	// Up
	.db	0x18,0xE8	// Up+Right
	.db	0x20,0x00	// Right
	.db	0x18,0x18	// Down+Right
	.db	0x00,0x20	// Down
	.db	0xE8,0x18	// Down+Left
	.db	0xE0,0x00	// Left
	.db	0xE8,0xE8	// Up+Left

.align 4
@@moveSpeeds:
	.db	0x00,0x00
	.db	0x04,0x00	// Right
	.db	0xFC,0x00	// Left
	.db	0x00,0x00
	.db	0x00,0xFC	// Up
	.db	0x03,0xFD	// Up+Right
	.db	0xFD,0xFD	// Up+Left
	.db	0x00,0xFC	// Up
	.db	0x00,0x04	// Down
	.db	0x03,0x03	// Down+Right
	.db	0xFD,0x03	// Down+Left
	.db	0x00,0x04	// Down
	.db	0x00,0x00
	.db	0x04,0x00	// Right
	.db	0xFC,0x00	// Left
	.db	0x00,0x00


.align 2
field_starTraderChooseCard:
	push	r4,r14
	mov	r4,r0

	// Check if Star Trader
	ldr	r0,=0x577
	ldrb	r0,[r4,r0]
	lsl	r0,r0,0x1C
	lsr	r0,r0,0x1C
	cmp	r0,0x4
	bne	@@normal

	// Get cards being put in trader
	ldr	r0,[r4,0x14]
	mov	r1,0x4
	bl	0x2015E94

	// Get total number of cards
	ldr	r3,=0x54A
	ldsh	r3,[r4,r3]

	// Get first card
@@getFirst:
	ldrh	r1,[r0]
	cmp	r1,0x0
	beq	@@giveNothing
	cmp	r1,(251)	// Star Ticket
	bne	@@loop
	sub	r3,0x1
	add	r0,0x4
	b	@@getFirst

	// Check all the same card
@@loop:
	sub	r3,0x1
	beq	@@giveStarCard
	add	r0,0x4
	ldrh	r2,[r0]
	cmp	r2,0x0
	beq	@@giveStarCard
	cmp	r2,(251)	// Star Ticket
	beq	@@loop
	cmp	r1,r2
	beq	@@loop

@@giveNothing:
	ldr	r0,=0xFFFF
	b	@@setCard

@@giveStarCard:
	// Check if card has a star card
	ldr	r0,=data_extraCardInfo
	lsl	r2,r1,0x1
	ldrh	r0,[r0,r2]		// &FF00 = flags
	lsr	r0,r0,(0x8 + 0x4)	// check flag 0x8
	bcc	@@giveNothing

	// Set return script to 120
	ldr	r2,=(0x21AC1D8 + (0x2 * 0xC0) + 0x20 + 0x50)
	mov	r0,0x78
	str	r0,[r2]

	// Set star card
	mov	r0,0x2
	lsl	r0,r0,0x9
	orr	r0,r1

@@setCard:
	ldr	r1,=0x2120588
	ldr	r1,[r1]
	ldr	r1,[r1]
	add	r1,(0x108 - 0xC)
	str	r0,[r1,0xC]

	b	@@end

@@normal:
	// Call normal Card Trader
	mov	r0,r4
	bl	0x217CB6C

@@end:
	pop	r4,r15


.align 2
field_starTraderHandleNothing:
	ldsh	r0,[r0,r2]
	cmp	r0,0x0
	bge	@@end

	// Jump to special script
	ldr	r0,=field_starTraderScene
	mov	r1,r14
	add	r1,(0x7 * 0x2)	// skip 7 instructions
	bx	r1

@@end:
	bx	r14


.align 2
field_packFlagCards:
	cmp	r6,0x3
	bne	@@normal
	ldr	r1,[sp,0x8]
	cmp	r1,0xE7
	bge	@@normal

	// Skip all this
	bl	0x2179C0A

@@normal:
	ldrb	r0,[r0,0x8]
	str	r0,[sp,0xC]
	bx	r14


.align 2
field_startBroRegistration:
	sub	r2,r1,0x3
	ldrh	r2,[r0,r2]	// brother ID
	cmp	r2,0xD		// L.M. Shin
	beq	@@end
	cmp	r2,0x80		// special bro
	bge	@@end
	mov	r2,0x0
@@end:
	bx	r14

.align 2
field_chooseBroLocation:
	sub	r1,0x5
	ldrh	r1,[r4,r1]	// brother ID
	cmp	r1,0xD		// L.M. Shin
	beq	@@end
	cmp	r1,0x80		// special bro
	bge	@@end
	mov	r1,0x0
@@end:
	bx	r14

.align 2
field_cancelBroRegistration:
	sub	r0,0x3
	ldrh	r0,[r4,r0]	// Brother ID
	cmp	r0,0xD		// L.M. Shin
	beq	@@end
	cmp	r0,0x80		// special bro
	bge	@@end
	mov	r0,0x0
@@end:
	bx	r14


//.align 2
//field_overwriteNpcBro:
//	// Both flags 0xA7 and 0x800 must be set
//	push	r14
//	bl	0x202409C	// check flag 0xA7
//	beq	@@end
//
//	mov	r1,0x8
//	lsl	r1,r1,0x8
//	bl	0x202409C	// check flag 0x800
//@@end:
//	pop	r15

.align 2
field_overwriteBoktaiBro:
	mov	r0,r4
	mov	r1,0x66		// script 102
	ldr	r2,=0x573
	ldrb	r2,[r5,r2]
	cmp	r2,0x81
	bne	@@end
	mov	r1,0x26		// script 38
@@end:
	bx	r14

.align 2
field_sendMailToBoktaiBro:
	push	r14
	bl	0x200BDC8	// get Boktai Brother type
	cmp	r0,0x81
	beq	@@boktai
@@normal:
	mov	r0,r4
	mov	r1,0x90		// script 144
	b	@@end
@@boktai:
	mov	r0,r4
	mov	r1,0x27		// script 39
@@end:
	pop	r15


.align 2
field_avoidGmwPosition:
	add	r1,sp,0x0

	// Get GMW data pointer from stack
	ldr	r0,[sp,0x44]

	push	r1-r2,r14

	// Set first chance to 0
	mov	r2,0x0
	strb	r2,[r1]

@@checkTaurus:
	// Check if this is the GMW that overlaps with Taurus Fire EX
	ldrh	r0,[r0,0x2]		// get flag
	ldr	r1,=0xA02
	cmp	r0,r1
	bne	@@checkLeo

	// Check Taurus Fire defeated
	mov	r1,0x62
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@normal
	// Check Taurus Fire EX not defeated
	mov	r1,0xB0
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@normal

	b	@@avoid

@@checkLeo:
	// Check if this is the YMW that overlaps with Leo Kingdom EX
	ldr	r1,=0xC8C
	cmp	r0,r1
	bne	@@normal

	// Check Leo Kingdom defeated
	ldr	r1,=0xF10A
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@normal
	// Check Leo Kingdom EX not defeated
	ldr	r1,=0xF10B
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@normal

//	b	@@avoid

@@avoid:
	// Avoid first position
	pop	r1-r2
	add	r2,0x8
	mov	r3,0x1
	pop	r15

@@normal:
	mov	r3,0x0
@@end:
	pop	r1-r2,r15


.align 2
field_bullMinigame:
	push	r14

	bl	0x2159040
	bne	@@true

	// Get current balance direction
	ldr	r0,=0x21AB894
	ldr	r0,[r0]
	ldrb	r0,[r0,0x5]

	// Get required button
	add	r1,=@@buttons
	lsl	r0,r0,0x1
	ldrh	r0,[r1,r0]

	// Check new button press
	ldr	r1,=0x211DD1C
	ldrh	r2,[r1,0x2]
	mov	r3,0xF0		// D-pad
	tst	r2,r3
	beq	@@false

	// Check wrong button held
	ldrh	r2,[r1]
	bic	r2,r0
	bne	@@mistake

	// Check right buttons held
	ldrh	r2,[r1]
	cmp	r2,r0
	bne	@@false
	b	@@true

@@mistake:
	// Trigger mistake
	mov	r0,0x0
	strb	r0,[r5,0x15]

@@false:
	mov	r0,0x0
	b	@@end
@@true:
	mov	r0,0x1
@@end:
	pop	r15

.align 4
@@buttons:
	.dh	0x0060	// Top Left
	.dh	0x0050	// Top Right
	.dh	0x00A0	// Bottom Left
	.dh	0x0090	// Bottom Right


field_rocketGame1:
	push	r14

	// Check rocket is touched
	bl	0x215F480
	cmp	r0,0x0
	beq	@@end

	// Check A Button is held
	ldr	r0,=0x211DD1C
	ldrh	r0,[r0]
	lsr	r0,r0,0x1
	bcc	@@returnTrue

	// Hold down rocket
	mov	r0,0x0
	b	@@end

@@returnTrue:
	mov	r0,0x1
@@end:
	pop	r15

field_rocketGame2:
	// Check Up is pressed
	ldr	r1,=0x211DD1C
	ldrh	r0,[r1,0x2]
	lsr	r0,r0,0x7	// test 0x40
	bcc	@@checkA

	// Fire rocket up
	mov	r6,0x1
	str	r6,[sp]

@@checkA:
	// Check A Button is held
	ldrh	r0,[r1]
	lsr	r0,r0,0x1
	bcc	@@end

	// Keep rocket held down
	mov	r6,0x1

@@end:
	mov	r0,r5
	mov	r1,r4
	bx	r14


.align 2
field_sonarGame:
	ldr	r2,[r2]
	cmp	r2,0x0
	bne	@@normal

	// No touch; search at player coordinates
	mov	r1,0x80
	mov	r2,0x60
	strh	r1,[r0,0x18]
	strh	r2,[r0,0x1A]
	mov	r0,0x1
	pop	r15

@@normal:
	bx	r14


.align 2
field_sonarGame2:
	// Call part of idle function that does the item check
	bl	@@call

	// Check if item found
	cmp	r1,0xFF
	bgt	@@end

	// Clear the sonar
	mov	r0,r4
	mov	r1,0x4
	bl	0x2162BF8

@@end:
	mov	r0,0x1
	pop	r4,r15
@@call:
	push	r3-r7,r14
	sub	sp,0x8
	bl	0x2162354


.align 2
field_stationCompSwoosh:
	push	r14
	ldrb	r0,[r0,0x1]
	strb	r0,[r4,0x1]

	// Play swoosh SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0xB2		// swoosh
	bl	0x2025574

	pop	r15


.align 2
field_noteGameFastNoteRandom:
	push	r6-r7,r14
	mov	r7,r0		// note object
	mov	r6,0x0		// slow note

	// If this is 1000 Note Challenge
	ldr	r1,=0xF12C
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@end

	// If not 4 notes
	ldrb	r0,[r5,0x6]
	cmp	r0,0x4
	beq	@@end

	// If at least 15 notes spawned
	ldrb	r0,[r5,0x7]
	cmp	r0,(15)
	blt	@@end

	// If this is the second note
	cmp	r4,0x1
	bne	@@end

	// Check 1-in-3 chance
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x1
	mov	r1,0x3
	blx	0x208985C
	cmp	r0,0x0
	bne	@@end

	// Set fast note
	mov	r6,0xA		// +10 speed

@@end:
	// Set note speed
	mov	r0,0xE8
	str	r6,[r7,r0]
	pop	r6-r7,r15

.align 2
field_noteGameFastNoteSpeedXY:
	ldrb	r1,[r0,0x6]	// base speed
	mov	r3,0xE8
	ldr	r3,[r5,r3]	// extra speed
	add	r1,r1,r3
	cmp	r1,(45)
	ble	@@end
	mov	r1,(45)

@@end:
	mul	r1,r2
	bx	r14


	.pool


.align 2
field_subcardIcons:
	// from 02158C54
	// r6 = icon x-position
	push	r0-r1,r14	// push extra for allocation

	// Check Cloaker active
	bl	0x2007E2C
	cmp	r0,0x1
	bne	@@elemSearch

	// Execute part of original routine
	bl	0x2158C5A
	add	r6,0x12

@@elemSearch:
	bl	common_elemSearchGet
	cmp	r0,0x0
	beq	@@end

	// Add OAM
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	ldr	r3,=0xC6F4
	lsl	r0,r0,0x1
	add	r3,r3,r0

	lsl	r0,r6,0x17
	lsr	r0,r0,0x7
	ldr	r2,=0x40001000
	orr	r2,r0
	ldr	r0,=0x211CDC0

	bl	0x1FF8F40

@@end:
	pop	r0-r1,r15


.align 2
field_traderLoadStarIcon:
	mov	r1,r0
	push	r0,r1,r14	// push extra for allocation

	mov	r0,0x4		// 4 tiles
	lsl	r0,r0,0x5
	str	r0,[sp]

	ldr	r0,=0x211C998
	ldr	r2,=0x700F2	// subscreen_242 = card icons tiles
	mov	r3,0x0		// star icon

	bl	0x2012354	// read part of file, may not be compressed!

	// [sp] already contains size
	mov	r1,0x0
	mov	r2,(0xC800 >> 8)
	lsl	r2,r2,0x8
	ldr	r3,[sp,0x4]

	bl	0x202F0F4	// copy to OBJ VRAM

	mov	r0,r4
	mov	r1,0x6D
	pop	r2-r3,r15	// pop whatever


.align 2
field_traderLoadStarPalette:
	mov	r1,r0
	push	r0,r1,r14	// push extra for allocation
	mov	r4,r0

	mov	r0,0x20		// 1 palette
	str	r0,[sp]

	ldr	r0,=0x211C998
	ldr	r2,=0x70058
	add	r2,0x1		// subscreen_089 = card icons palette
	mov	r3,0x0

	bl	0x2012354	// read part of file, may not be compressed!

	// [sp] already contains size
	ldr	r0,=0x21239A4
	mov	r1,0x0
	mov	r2,0xB
	ldr	r3,[sp,0x4]

	bl	0x202F338	// copy palette to VRAM

	mov	r0,0x1
	pop	r2,r3,r15


.align 2
field_drawStarOnTraderCard:
	push	r0-r1,r14	// push extra for allocation
	bl	0x2009D30

	// Check card ID
	ldr	r1,[sp,0x4]
	cmp	r1,(170)
	bgt	@@end

	// Check library
	mov	r0,0x2
	bl	0x2009170
	cmp	r0,0x2
	bne	@@end

	// Draw star
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]

	ldr	r3,=0xB320
	ldr	r2,=0x4095005B
	ldr	r0,=0x211CDC0

	bl	0x1FF8F40

@@end:
	pop	r0-r1,r15


.align 2
field_folderDrawSwapIconFolder:
	mov	r6,0x88
	b	field_folderDrawSwapIcon

field_folderDrawSwapIconPack:
	mov	r6,(0x118 >> 0x1)
	lsl	r6,r6,0x1

field_folderDrawSwapIcon:
	push	r2-r3,r14

	mov	r2,0x4		// size
	lsl	r2,r2,0xC
	sub	r1,0x2F
	ldsh	r1,[r4,r1]
	push	r1
	lsl	r1,r1,0x3
	add	r1,r1,r6	// x
	add	r2,r2,r1
	lsl	r2,r2,0x10
	lsl	r0,r0,0x5	// r0 = slot on screen
	add	r0,0x26		// y
	add	r2,r2,r0

	mov	r0,0x0
	push	r0
	push	r0
	ldr	r0,=0x211CDC0
	ldr	r3,=0xBAEE
	mov	r1,0x1
	bl	0x1FF8F40
	add	sp,0x8

	pop	r1-r3,r15


.align 2
field_folderDrawStarFolder:
	push	r0,r14

	ldrh	r1,[r0,0x2]	// card ID
	cmp	r1,(170)
	bgt	@@end
	ldrb	r1,[r0,0xC]	// color flags
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	// Draw star
	ldr	r2,[sp,0x28+0x8]
	lsr	r2,r2,0x10
	add	r2,0x31	// sub	r2,0x1
	lsl	r2,r2,0x10
	add	r2,0x27	// add	r2,0x25
	lsl	r0,r4,0x5
	add	r2,r2,r0
	mov	r0,0x0
	push	r0
	push	r0
	ldr	r0,=0x211CDC0
	ldr	r3,=0xB6E4
	mov	r1,0x1
	bl	0x1FF8F40
	add	sp,0x8

@@end:
	pop	r0
	ldrb	r0,[r0,0xF]
	cmp	r0,0x0
	pop	r15


.align 2
field_folderDrawStarPack:
	push	r0,r2,r14

	ldrh	r1,[r0,0x2]	// card ID
	cmp	r1,(170)
	bgt	@@end
	ldrb	r1,[r0,0xC]	// color flags
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	// Draw star
	mov	r0,r7
	lsr	r0,r0,0x10
	add	r0,0x31 // sub	r0,0x1
	lsl	r0,r0,0x10
	add	r0,0xF	// add	r0,0xD
	add	r2,r2,r0
	mov	r0,0x0
	push	r0
	push	r0
	ldr	r0,=0x211CDC0
	ldr	r3,=0xB6E4
	mov	r1,0x1
	bl	0x1FF8F40
	add	sp,0x8

@@end:
	pop	r0,r2
	ldrb	r3,[r0,0xD]
	cmp	r3,0x0
	pop	r15


.align 2
field_folderDrawLabelFolder:
	push	r0,r14

	ldrb	r2,[r1,0xC]	// color flags

	cmp	r6,(170)	// card ID
	bgt	@@end
	lsr	r0,r2,0x3	// test 0x4
	bcc	@@end

	mov	r2,0x2		// Set yellow
	mov	r0,r6
	bl	common_isWhiteCardID
	beq	@@end
	mov	r2,0x1		// Set white

@@end:
	str	r2,[sp,0x34+8]
	cmp	r6,0x0
	pop	r0,r15


.align 2
field_folderDrawLabelPack:
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
	str	r2,[sp,0x28+8]
	cmp	r7,0x0
	pop	r0,r15


.align 2
field_folderPrintCardDesc:
	// Save real ID for later
	add	r0,r2,r0
	ldrh	r6,[r0,0x2]	// card ID
	ldr	r1,=commonVars
	strh	r6,[r1,(var_fieldCardDesc - commonVars)]

	cmp	r6,(170)
	bgt	@@end
	ldrb	r1,[r0,0xC]	// color flags
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	ldr	r1,=data_extraCardInfo
	lsl	r0,r6,0x1
	ldrb	r1,[r1,r0]
	cmp	r1,0x0
	beq	@@end
	add	r1,0xFF
	add	r6,r1,0x1	// set ID to desc ID

@@end:
	bx	r14

.align 2
field_folderPrintCardDescReal:
	ldr	r1,[sp,0x24]
	ldr	r0,=commonVars
	ldrh	r0,[r0,(var_fieldCardDesc - commonVars)]
	bx	r14


.align 2
field_waveWorldBossPanel:
	sub	r4,0xD4

	// Check if this is a boss panel
	ldr	r0,[r4,0x30]
	cmp	r0,0x78
	beq	@@checkWaveWorld
	cmp	r0,0x79
	beq	@@checkWaveWorld
	cmp	r0,0x85
	bne	@@end

@@checkWaveWorld:
	// Check Wave World visible
	ldr	r0,=0x2120070
	ldr	r0,[r0]
	ldr	r1,=0xD08
	bl	0x202409C
	beq	@@hide

	// Get area and chapter
	ldr	r3,=0x2120588
	ldr	r3,[r3]
	ldr	r3,[r3]
	ldrb	r1,[r3]		// Area
	ldrb	r2,[r3,0x2]	// Chapter
	cmp	r1,0x90
	blt	@@checkArea
	sub	r1,0x90

@@checkArea:
	cmp	r1,0x80
	bge	@@end

	ldr	r3,=field_bossPanelChapters

@@loop:
	ldrb	r0,[r3]
	cmp	r0,0xFF
	beq	@@hide
	cmp	r0,r1
	bne	@@next
	ldrb	r0,[r3,0x1]
	cmp	r0,0xFF
	beq	@@checkFlagSet
	cmp	r0,r2
	beq	@@checkFlagSet
@@next:
	add	r3,0x6
	b	@@loop

@@checkFlagSet:
	ldrh	r1,[r3,0x2]
	cmp	r1,0x0
	beq	@@checkFlagCleared

	// Check flag is set
	ldr	r0,=0x2120070
	ldr	r0,[r0]
	push	r3
	bl	0x202409C
	pop	r3
	beq	@@hide

@@checkFlagCleared:
	// Check flag is cleared
	ldrh	r1,[r3,0x4]
	cmp	r1,0x0
	beq	@@end

	ldr	r0,=0x2120070
	ldr	r0,[r0]
	bl	0x202409C
	beq	@@end

@@hide:
	// Hide sprite
	mov	r0,r4
	add	r0,0x40
	bl	0x2020688

@@end:
	pop	r4,r15

.align 2
field_waveRoadBossPanel:
	// Check if this is a boss panel
	ldr	r0,[r5,0x30]
	cmp	r0,0x78
	beq	@@checkArea
	cmp	r0,0x79
	beq	@@checkArea
	cmp	r0,0x85
	bne	@@end

@@checkArea:
	mov	r1,0x0		// Not on Wave Road

	// Check area is Real World
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	lsr	r0,r0,0x4
	cmp	r0,0x8		// Not on Wave Road in Comps
	beq	@@store

	mov	r1,0x1		// On Wave Road
@@store:
	strb	r1,[r2,0x6]

@@end:
	ldrb	r1,[r2,0x6]
	mov	r2,r5
	bx	r14


field_extraObjects:
@@loop:
	ldrh	r0,[r4]
	cmp	r0,0xFE
	bne	@@end

	ldrh	r0,[r4,0x2]
	add	r4,=field_exObjects
	add	r4,r4,r0
	b	@@loop

@@end:
	cmp	r0,0xFF
	bx	r14


	.pool


.align 4
field_exObjects:

.align 4
field_exObjectsVistaPoint:
	.dh	0x0000			// Type
	.dh	0xFF64,0x0024,0x00C0	// Position
	.dw	0x85			// Boss panel northwest

	.dh	0x00FF

.align 4
field_exObjectsAmakenGrounds:
	.dh	0x0000			// Type
	.dh	0x0054,0xFEB4,0x0120	// Position
	.dw	0x78			// Boss panel northwest

	.dh	0x00FF

.align 4
field_exObjectsClass5A:
//	.dh	0x0000			// Type
//	.dh	0xFFFC,0xFFCC,0x00C0	// Position
//	.dw	0x78			// Boss panel northwest

	.dh	0x00FF

.align 4
field_exObjectsDeepSpace3:
	.dh	0x0000			// Type
	.dh	0x00DC,0xFF8C,0xFFC0	// Position
	.dw	0x78			// Boss panel northwest

	.dh	0x00FF

field_bossPanelChapters:
//	.db	0x80,0x04	:: .dh	0x0000,0x0000	// Taurus Fire
//	.db	0x81,0x12	:: .dh	0x0000,0x0000	// Cygnus Wing
	.db	0x01,0x24	:: .dh	0x0000,0x0000	// Harp Note
	.db	0x01,0x31	:: .dh	0x0519,0x051C	// Pegasus Shadow
	.db	0x02,0x33	:: .dh	0x052F,0x0534	// JammerG
	.db	0x01,0x51	:: .dh	0x0713,0x0061	// Dragon Shadow
	.db	0x01,0x62	:: .dh	0x081A,0x081B	// Leo Shadow
	.db	0x00,0x64	:: .dh	0xF139,0xF135	// Hollow
	.db	0x06,0xFF	:: .dh	0x0906,0x0909	// Satellite Admin
	.db	0xFF


.align 4
field_exSpritesBase:

field_exSpritesEchoRidge:
	.dh	0x05,0x0034	// Taurus Fire
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesGeosLivingRoom:
field_exSpritesGeosRoom:
field_exSpritesLunasRoom:
field_exSpritesBudsRoom:
field_exSpritesZacksRoom:
field_exSpritesAmakenFoyer:
field_exSpritesScienceMuseum:
field_exSpritesFoyer:
field_exSpritesClass1B:
field_exSpritesStudio:
field_exSpritesNacysRoof:
field_exSpritesDreamIsland:
field_exSpritesScrapyard1:
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesBigWave:
	.dh	0x05,0x0019	// Space Suit
	.dh	0x05,0x0041	// Mr. Famous
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0336

field_exSpritesVistaPoint:
	.dh	0x05,0x02C2	// Boss panel
	.dh	0x05,0x0332	// Card Trader
	.dh	0x05,0x0055	// Star Card Trader
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0048	// Music box
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0336

field_exSpritesAmakenGrounds:
	.dh	0x05,0x02C2	// Boss panel
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0017	// Worker
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x004A	// Jammer
	.dh	0x05,0x0336

field_exSpritesLab:
	.dh	0x05,0x0035	// Cygnus Wing
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesClass5A:		// Libra Scales already hear
	.dh	0x05,0x02C2	// Boss panel
	.dh	0x05,0x0336

field_exSpritesGym:
field_exSpritesNacys1F:
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesTimeSquare:
	.dh	0x05,0x0038	// Queen Ophiuca
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesDreamPark:
	.dh	0x05,0x0039	// Gemini Spark W
	.dh	0x05,0x003A	// Gemini Spark B
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0040	// Mettenna
	.dh	0x05,0x0336

field_exSpritesDeepSpace1:
	.dh	0x05,0x004A	// Jammer
	.dh	0x05,0x039A	// Pegasus Magic
	.dh	0x05,0x0336

field_exSpritesDeepSpace2:
	.dh	0x05,0x0056	// Info Navi
	.dh	0x05,0x0053	// Walking Jammer
	.dh	0x05,0x039B	// Leo Kingdom
	.dh	0x05,0x0332	// Card Trader
	.dh	0x05,0x0057	// Star Frag Trader
	.dh	0x05,0x0336

field_exSpritesDeepSpace3:
	.dh	0x05,0x004A	// Jammer
	.dh	0x05,0x02C2	// Boss panel
	.dh	0x05,0x039C	// Dragon Sky
	.dh	0x05,0x0052	// King Hertz
	.dh	0x05,0x0336

field_exSpritesPianoComp:
field_exSpritesAmakenTowerComp:
field_exSpritesMowaMowaComp:
field_exSpritesServiceModule:
	.dh	0x05,0x02C8	// Wave ball
	.dh	0x05,0x0336

field_exSpritesMirrorComp:
	.dh	0x05,0x003F	// Mirror
	.dh	0x05,0x0336


.align 4
field_cockpitLoads:
	dw	(20 << 16) |  2	// Transer
	dw	(20 << 16) |  0	// SearchEye
	dw	(20 << 16) |  1	// Cloaker
	dw	(20 << 16) |  3	// Omega-Xis
	dw	(20 << 16) |  4	// PropellerMan
	dw	(20 << 16) |  5	// KeyMan
	dw	(20 << 16) |  6	// PitcherMan
	dw	(20 << 16) |  7	// ThermoMan
	dw	(20 << 16) |  8	// ShovelMan
	dw	(20 << 16) |  9	// Signal 1
	dw	(20 << 16) | 10	// Signal 2
	dw	(20 << 16) | 11	// Signal 3
	dw	(20 << 16) | 12	// Wave In
	dw	(20 << 16) | 14	// FireSearch
	dw	(20 << 16) | 15	// AquaSearch
	dw	(20 << 16) | 16	// ElecSearch
	dw	(20 << 16) | 17	// WoodSearch
	dw	(20 << 16) | 18	// Wave beam
	dw	(20 << 16) | 19	// Cursor
	dw	0


.align 2
field_boktaiBrotherScreenBuffers:
	.dh	0x1200,0x1800,0x1400,0x1000
	.dh	 0x400, 0x200,  0xE0,  0x20
	.dh	 0x900, 0x80C,  0x24, 0x80C
	.dh	  0x24, 0x80C,  0x24, 0x80C
	.dh	  0x24, 0x80C,  0x24, 0x80C
	.dh	  0x24,0x1000, 0x800, 0x100
	.dh	 0x800,  0x80,   0x0


.align 4
field_starTraderScene:
	// Set flag 0xA5
	.dh	0x21	:: .dh	0xA5
	// Wait for flag 0xA6
	.dh	0x0F	:: .dh	0xA6
	// Clear flag 0xA5
	.dh	0x22	:: .dh	0xA5
	// Clear flag 0xA6
	.dh	0x22	:: .dh	0xA6
	// Start script 122
	.dh	0x26	:: .db	0x06,0x7A
	// Wait for script to finish
	.dw	0x08
	// Clear flag 0xA4
	.dh	0x22	:: .dh	0xA4
	// Unlocks player controls
	.dw	0x2A
	// End script
	.dw	0x04
