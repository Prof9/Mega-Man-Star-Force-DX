// Overlay 27 - Shop screen

.nds
.open TEMP+"/overlay_0027.bin",readu32(TEMP+"/y9.bin", 27 * 0x20 + 0x4)
.thumb


.org 0x21B4252
	bl	shop_bufferCardPrice


.org 0x21B5528	// Library icon tile
	.dw	0xBC00
.org 0x21B52D4
	mov	r0,((filesize(TEMP+"/cardicons.img.bin") + 0x1F) / 0x20)
	lsl	r0,r0,0x5
.org 0x21B552C
	.dh	0xB200 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)
.org 0x21B5530
	.dh	0xBB00 + ((filesize(TEMP+"/cardicons.img.bin") + 0x1F) & ~0x1F)


.org 0x21B4CF8
	bl	common_getCardCountNotInExtraFolder


.org 0x21B4B80
	mov	r1,0x90
	bl	shop_cardColorIconPosition
.org 0x21B4CD2
	bl	shop_cardNameInList
.org 0x21B4D0C
	bl	shop_cardNew
.org 0x21B4D30
	bl	shop_cardColorIconShow
.org 0x21B4D42
	bl	shop_cardColorIconColor

.org 0x21B53D4
	bl	shop_cardDescription

.org 0x21B43BE
	bl	shop_cardNameInBuffer
.org 0x21B43C8
	bl	shop_cardColorInBuffer
.org 0x21B4488
	bl	shop_cardNameInBuffer
.org 0x21B4492
	bl	shop_cardColorInBuffer


.org 0x21B51CE
	bl	shop_bufferStarFrags

.org 0x21B4416
	bl	shop_checkStarFrags

.org 0x21B4448
	bl	shop_takeStarFrags
.org 0x21B4466
	bl	shop_takeStarFrags


.org 0x21B4746	// Load Star Frag shop background
.area 0xA8,0x00
	// Choose tileset
	ldr	r7,[0x21B49F8]
	ldrb	r0,[r5,0xC]	// shop
	cmp	r0,0x9
	bne	@@loadTileset
	add	r7,(5 - 2)

@@loadTileset:
	// Get tileset file size
	ldr	r0,[0x21B49FC]
	mov	r1,r7
	bl	0x20122F8	// get file size
	mov	r6,r0
	ldr	r0,[r5,0x28]
	ldr	r0,[r0,0xC]
	cmp	r6,r0
	bcs	.

	// Set up tileset buffer (?)
	ldr	r0,[r5,0x28]
	mov	r1,0x19
	bl	0x2015E64	// make buffer with ID
	ldr	r0,[r5,0x28]
	mov	r1,0x19
	bl	0x2015E94	// get buffer with ID
	mov	r4,r0		// buffer

	// Load tileset into buffer
	ldr	r0,[0x21B49FC]
	mov	r1,r4
	mov	r2,r7
	bl	0x201231C	// load file

	// Copy tileset into buffer
	str	r6,[sp]
	ldr	r0,[0x21B4A00]
	mov	r1,0x0
	mov	r2,0x40
	mov	r3,r4
	bl	0x202EEA0

	// Load palette
	mov	r0,(((44 << 0x10) | (0)) >> 0x10)
	lsl	r0,r0,0x10
	str	r0,[sp]
	ldr	r0,[0x21B4A00]
	mov	r1,0x0
	mov	r2,0x0
	mov	r3,0x0
	bl	0x202F238

	// Free tileset buffer (?)
	ldr	r0,[r5,0x28]
	mov	r1,0x19
	bl	0x2015EB0

	// Allocate and load tilemap
	ldr	r0,[0x21B49FC]
	ldr	r1,[0x21B4A04]
	ldrb	r2,[r5,0xC]	// shop
	cmp	r2,0x9
	bne	@@loadTilemap
	add	r1,(4 - 1)
@@loadTilemap:
	bl	0x2012518	// allocate and load
	mov	r4,r0

	// Copy tilemap
	mov	r1,0x0
	str	r1,[sp]
	str	r1,[sp,0x4]
	str	r1,[sp,0x8]
	str	r1,[sp,0xC]
	mov	r0,0x20
	str	r0,[sp,0x10]
	mov	r0,0x18
	str	r0,[sp,0x14]
	ldr	r0,[0x21B4A0C]
	mov	r2,0x0
	mov	r3,r4
	bl	0x200B748

	// Free tilemap
	ldr	r0,[0x21B4A08]
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r4
	bl	0x2015620

	b	0x21B47EE

	.pool
.endarea
	

.close
