.align 2
folder_listDrawBonusAttack:
	push	r7,r14
	sub	sp,0x4

	// Get card data address
	ldr	r0,[sp,(0x20+0xC)]	// list index
	lsl	r0,r0,0x2
	ldr	r1,[sp,(0x30+0xC)]	// folder order
	ldr	r0,[r1,r0]		// folder index
	mov	r1,0x12
	mul	r0,r1
	ldr	r7,[r4,0x24]		// folder data
	add	r7,r7,r0		// card data

	// Get color
	ldrb	r0,[r7,0xC]		// color flags
	mov	r2,0x0			// color
@@colorLoop:
	mov	r1,0x1
	lsl	r1,r2
	tst	r0,r1
	bne	@@getShareStars
	add	r2,0x1
	cmp	r2,0x5
	blt	@@colorLoop

@@getShareStars:
	// r2 = color
	ldrh	r1,[r7,0x2]		// card ID
	bl	0x200BD60		// r0 = share stars
	cmp	r0,0x0
	beq	@@hideBonus

	// Get bonus attack power
	mov	r1,r0			// share stars
	ldrh	r0,[r7,0x2]		// card ID
	bl	0x2006C4C		// r0 = bonus attack power

	cmp	r0,0x0
	beq	@@hideBonus

@@drawBonus:
	// Draw +
	mov	r2,r5
	add	r2,0x30			// start of numbers
	mov	r1,0x17
	strh	r1,[r2,0x6]
	mov	r1,0x18
	strh	r1,[r2,0x1E]
	b	@@drawAttack

@@hideBonus:
	// Hide +
	mov	r2,r5
	add	r2,0x30			// start of numbers
	mov	r1,0x0
	strh	r1,[r2,0x6]
	strh	r1,[r2,0x1E]

@@drawAttack:
	str	r0,[sp]
	mov	r0,r4
	mov	r1,r5
	mov	r2,0x1C
	mov	r3,0xC
	bl	0x21B1D80

@@end:
	ldr	r1,[sp,(0x20+0xC)]
	ldr	r2,[sp,(0x24+0xC)]
	add	sp,0x4
	pop	r7,r15


.align 2
folder_playEquipSFX:
	ldr	r1,=SE_MEGAEQUIP
	ldr	r0,[r0]
	bx	r14


.align 2
folder_scrollFolderInSubMenu:
	// Check L/R fired
	lsl	r0,r0,0x8	// r0 = 0x200
	sub	r1,r0,0x7	// r0 = 0x1F9
	ldrb	r1,[r4,r1]
	lsl	r1,r1,0x1E
	beq	@@normal

	// Process L/R input
	mov	r0,r4
	bl	0x21B17B0	// folder scroll handler

	// Go to end
	bl	0x21B175A

@@normal:
	ldrb	r0,[r4,r0]
	bx	r14


.align 2
folder_haveMultipleExtraFolders:
	push	r14

	// Check if player owns any of the new Extra Folders
//	ldr	r0,=0x2120070
//	ldr	r0,[r0]
	ldr	r1,=0xF110
	mov	r2,0x6
	bl	0x20240EC

	pop	r15

.align 2
folder_printChangeLabel:
	mov	r1,r4
	cmp	r1,0x3
	bne	@@end
	mov	r1,0x4		// script ID
@@end:
	mov	r2,0x1
	bx	r14

.align 2
folder_showChangeLabel:
	push	r14

	cmp	r7,0x0
	bne	@@normal

	bl	folder_haveMultipleExtraFolders
	cmp	r0,0x0
	beq	@@normal

	sub	r5,0x1
	mov	r0,0x3		// option index
	lsl	r0,r0,0x9
	b	@@end

@@normal:
	lsl	r0,r5,0x9
//	b	@@end

@@end:
	str	r0,[sp,(0x8+0x4)]
	pop	r15

.align 2
folder_getExtraFolderChoice:
	push	r4,r14
	ldsh	r4,[r4,r0]

	bl	folder_haveMultipleExtraFolders
	cmp	r0,0x0
	beq	@@normal

	cmp	r4,0x0
	bne	@@end

	// Set swap action
	mov	r4,0x3
	b	@@end

@@normal:
	add	r4,0x1
//	b	@@end

@@end:
	mov	r0,r4
	pop	r4,r15


.align 2
folder_startSwapExtraFolder:
	// r4 = this
	push	r14
	sub	sp,0x14

	bl	folder_initExtraFolderMenu
	cmp	r0,0x0
	ble	@@end

	// Set script index
	mov	r1,r0
	add	r1,(10 - 1)

	// Start text script
	mov	r0,(0x620 >> 0x4)
	lsl	r0,r0,0x4
	str	r0,[sp,0x4]
	mov	r0,(0x3780 >> 0x6)
	lsl	r0,r0,0x6
	str	r0,[sp,0x8]
	mov	r0,0xF
	str	r0,[sp,0xC]
	mov	r0,0xC
	str	r0,[sp,0x10]
	ldr	r0,=(((29) << 0x10) | (8))	// mess_0008
	mov	r2,0x0
	mov	r3,0x1
	str	r3,[sp]
	bl	0x20084F0	// load and start text

	mov	r0,0x0
	add	r1,=folder_varChangedExtraFolder
	str	r0,[r1]

	// Set text handler
	ldr	r0,=folder_menuExtraFolderHandler|1
	mov	r1,0x0
	str	r0,[r4,0xC]
	str	r1,[r4,0x10]

	// Play SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0x89
	bl	0x2025574

@@end:
	add	sp,0x14
	pop	r15

.align 2
folder_menuExtraFolderHandler:
	push	r4,r14
	mov	r4,r0

	// Check cancel
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x0
	bne	@@startWaitEnd

	// Check confirm
	mov	r0,0x2
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x0
	beq	@@end

	bl	0x2008DC0	// get choice
	bl	0x2009170	// get text buffer value
	sub	r0,(120 - 20)	// base 120 to base 20

//	// Set current Extra Folder
//	mov	r0,((0xF2D8 & 0xFFF) / 8 + 1)
//	mov	r1,0x3
//	bl	0x20070FC
//	strb	r3,[r0]

	// Jump to Extra Folder change script
	mov	r1,r0
	ldr	r0,=0x211CD78
	ldr	r0,[r0]
	ldr	r0,[r0,0x4]	// r0 = script handler
	bl	0x201DD08

	mov	r0,0x1
	add	r1,=folder_varChangedExtraFolder
	str	r0,[r1]

@@startWaitEnd:
	// Set text handler
	ldr	r0,=folder_waitExtraFolderHandler|1
	mov	r1,0x0
	str	r0,[r4,0xC]
	str	r1,[r4,0x10]

@@end:
	// Jump into "can't equip" handler
	bl	0x21B1824
//	pop	r4,r15

.align 2
folder_waitExtraFolderHandler:
	push	r4,r14
	mov	r4,r0

	// Wait until script finished
	bl	0x2008D9C
	cmp	r0,0x0
	bne	@@end

	ldr	r0,[folder_varChangedExtraFolder]
	cmp	r0,0x0
	beq	@@refresh

	// Reset scroll position
	mov	r0,0x0
	mov	r1,(0x1FA >> 0x1)
	lsl	r1,r1,0x1
	strh	r0,[r4,r1]	// scroll position

	// Exit submenu
	ldr	r0,=0x21B1480|1
	mov	r1,0x0
	str	r0,[r4,0xC]
	str	r1,[r4,0x10]

@@refresh:
	// Refresh
	mov	r0,0x1
	mov	r1,(0x208 >> 0x2)
	lsl	r1,r1,0x2
	strb	r0,[r4,r1]	// enable refresh

	mov	r0,r4
	bl	0x21B2240	// reload folder

	mov	r0,r4
	bl	folder_refreshFolderNames

	// Reload folder names tilemap just in case
	mov	r0,r4
	bl	0x21B21A0

	ldr	r0,[folder_varChangedExtraFolder]
	cmp	r0,0x0
	bne	@@end

	// Return to submenu
	// Jump into "can't equip" handler
	bl	0x21B181C

@@end:
	// Jump into "can't equip" handler
	bl	0x21B1824
//	pop	r4,r15


.align 2
folder_refreshFolderNames:
	push	r0,r4-r7,r14	// push extra for allocation
	mov	r4,r0

	// Allocate buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,(0x200 >> 0x8)
	lsl	r2,r2,0x8
	bl	0x20155DC	// heap alloc
	mov	r5,r0		// buffer

	mov	r6,0x0		// index
@@loop:
	// Clear buffer
//	ldr	r0,=0x2122A34
//	ldr	r0,[r0]
	mov	r1,r5
	mov	r2,(0x200 >> 0x8)
	lsl	r2,r2,0x8
	bl	0x202DF14	// mem clear fast

	// Get folder index
	mov	r0,r6
	bl	0x2007358

	// Get folder name
	lsr	r1,r0,0x4
//	ldr	r0,=0x211CCB0
//	ldr	r0,[r0]
	bl	0x20151A8

	// Print folder name
	mov	r1,0x0
	str	r1,[sp]
	mov	r1,0x2
	mov	r2,r5
	lsl	r3,r1,0x8
	bl	0x20089AC

	// Copy into tileset
	mov	r0,(0x200 >> 0x8)
	lsl	r0,r0,0x8
	str	r0,[sp]
//	ldr	r0,=0x21239A4
	mov	r1,0x1
	lsl	r2,r6,0x9
	add	r2,0x20
	mov	r3,r5		// buffer
	bl	0x202EF0C

	// Go to next folder
	add	r6,0x1
	ldr	r0,=0x202
	ldsh	r0,[r4,r0]	// folder count
	cmp	r6,r0
	blt	@@loop

	// Free buffer
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r5
	bl	0x2015620

	pop	r0,r4-r7,r15


.align 2
folder_initExtraFolderMenu:
	// ret= number of extra folders in menu
	push	r5-r7,r14
	mov	r7,0x0		// number of Extra Folders

	// Get current Extra Folder
	mov	r0,((0xF2D8 & 0xFFF) / 8 + 1)
	mov	r1,0x3
	bl	0x20070F0
	mov	r5,r0		// r5 = current Extra Folder

	mov	r6,0x0		// r6 = i
@@loop:
	cmp	r6,r5
	beq	@@next		// skip current Extra Folder

	cmp	r6,0x0
	beq	@@addToMenu	// skip owned check for XtraFldr

	// Check Extra Folder owned
	ldr	r1,=(0xF110 - 0x1)
	add	r1,r1,r6
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@next

@@addToMenu:
	// Buffer folder item ID
	mov	r0,r7		// buffer
	mov	r1,r6
	add	r1,(120)
	bl	0x2008DF0

	add	r7,0x1

@@next:
	add	r6,0x1
	cmp	r6,0x7
	blt	@@loop

@@end:
	mov	r0,r7
	pop	r5-r7,r15

	.pool


.align 2
folder_listDrawStar:
	push	r0,r14

	ldrh	r1,[r0,0x2]	// card ID
	cmp	r1,0xA8
	bgt	@@end
	ldrb	r1,[r0,0xC]	// color flags
	lsr	r1,r1,0x3	// test 0x4
	bcc	@@end

	// Draw star
	ldr	r2,=0x40B90027	// r2,=0x40870025
	lsl	r0,r5,0x5
	add	r2,r2,r0
	mov	r0,0x0
	push	r0
	push	r0
	ldr	r0,=0x211CDC0
	ldr	r3,=0x242A
	mov	r1,0x1
	bl	0x1FF8F40
	add	sp,0x8

@@end:
	pop	r0
	ldrb	r0,[r0,0xF]
	cmp	r0,0x0
	pop	r15


.align 2
folder_listDrawLabel:
	push	r14

	ldrb	r3,[r2,0xC]	// color flags

	ldrh	r0,[r2,0x2]	// card ID
	cmp	r0,0xA8
	bgt	@@end
	lsr	r0,r3,0x3	// test 0x4
	bcc	@@end

	mov	r3,0x2		// Set yellow
	ldrh	r0,[r2,0x2]
	bl	common_isWhiteCardID
	beq	@@end
	mov	r3,0x1		// Set white

@@end:
	str	r3,[sp,0x24+0x4]
	cmp	r6,0x0
	pop	r15

	.pool

.align 4
folder_varChangedExtraFolder:
	.dw	0x0