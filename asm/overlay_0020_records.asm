// Overlay 20 - Records screen

.nds
.open TEMP+"/overlay_0020.bin",readu32(TEMP+"/y9.bin", 20 * 0x20 + 0x4)
.thumb


.org 0x21B0EB6	// Skip Brother admin record check
	b	0x21B0EF4


.org 0x21B1134	// Records text opens 1 frame faster
	nop


.org 0x21B19F6	// 16 char text for Brother Rankings
	mov	r1,0x10
.org 0x21B1A0C
	mov	r0,0x10
.org 0x21B1A22
	mov	r0,0x10
.org 0x21B1A34
	mov	r0,0x10
.org 0x21B1C1E
	mov	r1,0x10
.org 0x21B2228
	add	r2,0x40		// x-position
.org 0x21B224A
	cmp	r4,0x10


.org 0x21B0F50	// Virus database
	bl	records_initDatabase
	bne	0x21B0F86
.org 0x21B0F74
	bl	records_getIndexes
.org 0x21B0F94
	bl	records_loadGfx
.org 0x21B105E
	bl	records_selectEnemy
.org 0x21B10C0
	bl	records_getIndexes
.org 0x21B16A6
	bl	records_drawLabels
.org 0x21B17D8
.area 0x50,0x00
	ldr	r0,[0x21B18F8]
	ldr	r1,[0x21B1928]
	ldrh	r2,[r5,0x30]
	cmp	r2,0x0
	beq	@@load
	add	r1,(8 - 4)
@@load:
	bl	0x2012518	// alloc and load file
	mov	r4,r0

	mov	r0,0x1
	lsl	r0,r0,0x8
	str	r0,[sp]
	mov	r2,0x0
	str	r2,[sp,0x4]
	mov	r0,0xC
	str	r0,[sp,0x8]
	str	r2,[sp,0xC]
	mov	r0,0x9
	str	r0,[sp,0x10]
	mov	r0,0x2
	str	r0,[sp,0x14]

	ldrh	r1,[r5,0x30]
	cmp	r1,0x0
	beq	@@copy
	mov	r1,0xA		// x-position
	str	r1,[sp,0x8]
	mov	r1,0xD		// width
	str	r1,[sp,0x10]

@@copy:
	ldr	r0,[0x21B1914]
	mov	r1,0x1
	mov	r3,r4
	bl	0x200B748

	ldr	r0,[0x21B1910]
	ldr	r0,[r0]
	mov	r1,0x0
	mov	r2,r4
	bl	0x2015620	// free from heap
.endarea
.org 0x21B1B70
	bl	records_drawStars
.org 0x21B1B82
	bl	records_getIndexes
	add	r0,r6,r0
.org 0x21B1B9A
	bl	records_drawDatabase
.org 0x21B1C20
	ldrh	r2,[r5,0x32]	// start of own tiles
.org 0x21B1C78
	push	r0,r3-r7,r14	// push r0 too
.org 0x21B1C90
	ldr	r0,[sp,0x34]
.org 0x21B1CA6
	bl	records_getName
.org 0x21B1CF4
	bl	records_getNameY
.org 0x21B1D1C
	add	sp,0x1C		// for r0
	pop	r3-r7,r15
.org 0x21B1F94
	ldr	r1,[0x21B2000]
	bl	records_getCard
	ldr	r2,[sp,0x28]
.org 0x21B1FBE
	bl	records_showHideCard

.close
