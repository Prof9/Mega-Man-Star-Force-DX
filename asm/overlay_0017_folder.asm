// Overlay 17 - Folder editor

.nds
.open TEMP+"/overlay_0017.bin",readu32(TEMP+"/y9.bin", 17 * 0x20 + 0x4)
.thumb



// Keyboard on touch screen
.org 0x21B16F4
	mov	r1,0x0
.org 0x21B16FE
	bl	field_keyboardStartFolder
.org 0x21B0EFE	// Don't clear second tile in BG3
	mov	r2,0x7
	bl	field_keyboardFolderClearFirstTileBG3
.org 0x21B0EC8
	bl	field_keyboardClosedReloadFolder2
	ldr	r0,[0x21B1080]
	ldr	r2,[0x21B1084]
.org 0x21B0FF8
	bl	field_keyboardFolderInitScroll



.org 0x21B140C
	.dw	arm9_font1


.org 0x21B100C	// Init cursor on folder you were editing
	ldr	r1,[0x21B1098]		// 0x202
	add	r1,(0x209 - 0x202)
	strb	r0,[r4,r1]
	bl	field_initFolderSelectOption
	strh	r0,[r4,r1]

.org 0x21B182C	// Fix folder cursor flashing during "can't equip"
	bl	0x21B1EEC

.org 0x21B1824	// Hide "Change" cursor during text menu
	nop :: nop :: nop

.org 0x21B16D6	// Play "equip" SFX on Folder equip
	bl	folder_playEquipSFX

.org 0x21B13C4	// Add "Change" choice to Extra Folder
	bl	folder_printChangeLabel
.org 0x21B13E8
	cmp	r4,0x4
.org 0x21B2004
	bl	folder_showChangeLabel
.org 0x21B1726
.area 0x18,0x00
	bl	folder_scrollFolderInSubMenu
	bl	0x2007358
	mov	r1,0x20
	tst	r0,r1
	beq	@@has3

	bl	folder_haveMultipleExtraFolders
	add	r2,r0,0x2
	b	@@end
@@has3:
	mov	r2,0x3
@@end:
.endarea

.org 0x21B25B8	// Move (B) Exit around in VRAM
	mov	r0,(0x2580 >> 0x6)
	lsl	r0,r0,0x6

.org 0x21B15D2	// Handle choice on Extra Folder
	bl	folder_getExtraFolderChoice
.org 0x21B15E2
.area 0x18
	cmp	r0,0x1
	blo	@@edit
	beq	0x21B1636
	cmp	r0,0x3
	blo	0x21B16E0
	bhi	0x21B160E	// jumps to 0x21B175A

	bl	folder_startSwapExtraFolder
	b	0x21B175A

@@edit:
	mov	r0,(0x200 >> 0x8)
	lsl	r0,r0,0x8
	ldrb	r0,[r4,r0]
.endarea


// Draw color in folder list
.org 0x21B1A5E
	bl	folder_listDrawLabel

// Draw star in folder list
.org 0x21B1C1E
	bl	folder_listDrawStar

// Draw bonus attack in folder list
.org 0x21B1B36
	bl	folder_listDrawBonusAttack


// Load full card icons
.org 0x21B12B2	// Card icons in folder select
	mov	r2,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r2,r2,0x5
	str	r2,[sp]
	// Remove unused r0 load
	mov	r1,0x1
	mov	r2,0x7
	lsl	r2,r2,0x7

.org 0x21B1306	// FAV in folder select
	mov	r2,((0x380 + (filesize(TEMP+"/cardicons.img.bin") + 0x1F)) / 0x20)
.org 0x21B130C
	lsl	r2,r2,0x5

.org 0x21B1D60
	.dw	0x440E + ((filesize(TEMP+"/cardicons.img.bin") + 0x3F) / 0x40)

.org 0x21B2548	// EQUIP in folder select
	mov	r0,((0x480 + (filesize(TEMP+"/cardicons.img.bin") + 0x1F)) / 0x20)
	lsl	r0,r0,0x5


.close
