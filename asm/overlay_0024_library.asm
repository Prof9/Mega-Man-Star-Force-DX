// Overlay 24 - Data Library

.nds
.open TEMP+"/overlay_0024.bin",readu32(TEMP+"/y9.bin", 24 * 0x20 + 0x4)
.thumb


.org 0x21B1B00
	.dw	arm9_font1


.org 0x21B2638	// Fix Giga Library not writing empty spaces to name while scrolling
	mov	r0,0x40
	add	r2,0x4A


.org 0x21B2C44	// Show Library icons in Library
	mov	r3,0x14
	bl	library_icon
.org 0x21B2C56
	mov	r0,0x14
.org 0x21B2EA0
	mov	r3,0x15
	bl	library_icon
.org 0x21B2EB2
	mov	r0,0x15
.org 0x21B30FC
	mov	r3,0x16
	bl	library_icon
.org 0x21B310E
	mov	r0,0x16


.org 0x21B1F48	// Exclude Andromeda from total Giga count unless player has it
	add	r5,0x1
	bl	library_skipAndromedaForGigaCount


.org 0x21B2C7A	// Gray frame on empty slots
	mov	r2,0x4
.org 0x21B2ED6
	mov	r2,0x4
.org 0x21B3132
	mov	r2,0x4


.org 0x21B2C4E	// Gray frame on Library compare cards
	mov	r2,0x4
.org 0x21B2EAA
	mov	r2,0x4
.org 0x21B3106
	mov	r2,0x4


.org 0x21B256E	// Gray labels on empty slots
	bl	library_drawLabelMegaEmpty
.org 0x21B2744
	bl	library_drawLabelGigaEmpty


// Gray labels on Library compare cards
.org 0x21B2360
	bl	library_drawLabelStandard
.org 0x21B2512
	bl	library_drawLabelMega
.org 0x21B26E6
	bl	library_drawLabelGiga


.org 0x21B1B4A
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5
.org 0x21B1B92
	mov	r2,((0xC200 + filesize(TEMP+"/cardicons.img.bin") + 0xFF) / 0x100)
.org 0x21B3D70	// Standard card image
	.dh	(0xC300 + filesize(TEMP+"/cardicons.img.bin") + 0xFF) & ~0xFF
.org 0x21B3D88	// Mega card image
	.dh	(0xCC00 + filesize(TEMP+"/cardicons.img.bin") + 0xFF) & ~0xFF
.org 0x21B3DA0	// Giga card image
	.dh	(0xD500 + filesize(TEMP+"/cardicons.img.bin") + 0xFF) & ~0xFF

// NEW icon
.org 0x21B29C0
	.dw	0xB000 | (((0xC200 + filesize(TEMP+"/cardicons.img.bin") + 0xFF) / 0x100) << 0x2)

.org 0x21B0F68	// Set up transparency
	bl	library_setTransparency

.org 0x21B1B6A	// Load extra sprites
.area 0x42,0x00
	// Alloc file
	ldr	r0,[0x21B1C9C]	// 0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,(filesize(TEMP+"/library-new.img.bin") >> 0x5)
	lsl	r2,r2,0x5
	bl	0x20155DC	// Heap_Alloc
	mov	r4,r0

	// Load file
	ldr	r0,[0x21B1C90]	// 0x211C998
	mov	r1,r4
	ldr	r2,[0x21B1CA4]	// ((7 << 0x10) | (148))
	bl	0x201231C	// SFArc_LoadFile

	// Copy to VRAM
	mov	r0,(filesize(TEMP+"/library-new.img.bin") >> 0x5)
	lsl	r0,r0,0x5
	str	r0,[sp]
//	ldr	r0,[0x21B1C98]	// 0x21239A4
	mov	r1,0x1
	mov	r2,(0xCE00 >> 0x8)
	lsl	r2,r2,0x8
	mov	r3,r4
	bl	0x202F0F4	// VRAM_CopyTileOBJ

	// Free from heap
	ldr	r0,[0x21B1C9C]	// 0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x1
	mov	r2,r4
	bl	0x2015620	// Heap_Free

	b	0x21B1BAC
.endarea

.org 0x21B21DC
	bl	library_drawStar
	add	r5,0x1

.org 0x21B2C64
	bl	library_drawStarOnCard
.org 0x21B10B4
	bl	library_viewStarCard
.org 0x21B32FA
	bl	library_toggleStarCard
.org 0x21B2A7C
	bl	library_refreshStandardDescription
.org 0x21B2ABC
	bl	library_getStandardDescription


// Adjust controls
.org 0x21B3D34
	.dw	(1)	// x
.org 0x21B3D54
	.dw	(14)	// width


// Move attack value on card
.org 0x21B2B7E
	mov	r2,0x5
.org 0x21B2DDA
	mov	r2,0x5
.org 0x21B3036
	mov	r2,0x5
.org 0x21B2BCC
	strh	r1,[r3,(0x5 * 0x2)]
.org 0x21B2BD0
	strh	r0,[r3,(0x5 * 0x2 + 0x18)]
.org 0x21B3084
	strh	r1,[r3,(0x5 * 0x2)]
.org 0x21B3088
	strh	r0,[r3,(0x5 * 0x2 + 0x18)]


.close
