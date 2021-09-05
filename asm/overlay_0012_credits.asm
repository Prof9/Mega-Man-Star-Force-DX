// Overlay 12 - Credits

.nds
.open TEMP+"/overlay_0012.bin",readu32(TEMP+"/y9.bin", 12 * 0x20 + 0x4)
.thumb


.org 0x2150A8E	// Increase max game time to 999:59 (credits)
	sub	sp,0x28		// alloc 0x4 extra
.org 0x2150AE2
	bl	common_convertTimeLong
.org 0x2150AF2
	ldr	r1,[r1,0xC]	// load long hours
.org 0x2150BBA
	add	sp,0x28		// alloc 0x4 extra


.org 0x214FED8
	.dw	credits_sequence
.org 0x2150130
	.dw	credits_sequence


// Scroll credits at 5x speed (up from 3x)
.org 0x2150A4A
	lsl	r1,r2,0x2
.org 0x2150A56
	lsl	r1,r2,0x2
.org 0x2150A62
	lsl	r1,r2,0x2


// New names
.org 0x21506A2
	mov	r0,(122)	// Mega Man Star Force
.org 0x21507F2
	mov	r0,(123)	// DX (not used)
.org 0x2150842
	mov	r0,(124)	// Credits
.org 0x21508D2
	mov	r0,(140)	// empty

.org 0x2150AC8
	mov	r1,(130)	// Time

.org 0x21508EC
	.dw	credits_segments
	.dw	credits_segments+0x1
	.dw	credits_segments+0x2


// Allocate extra credits pictures and palette animations
.org 0x214F85C
	mov	r2,(12*2+6+5)
.org 0x214F9A4
	cmp	r4,(12)
.org 0x214F9A8
	mov	r6,(12)
.org 0x214F9F6
	cmp	r4,(12)
.org 0x214FA6C
	mov	r1,(12*2+6+4)
.org 0x214FA78
	mov	r1,(12*2+6+4)
.org 0x214FAB0
	mov	r1,(12*2+6+4)
.org 0x214FAC4
	mov	r1,(12*2+6+4)
.org 0x214FAD0
	mov	r1,(12*2+6+4)
.org 0x214FB24
	mov	r1,(12*2+6+4)
.org 0x214FB3A
	mov	r2,(12*2+6+0)
.org 0x214FB46
	mov	r1,(12*2+6+0)
.org 0x214FB60
	mov	r2,(12*2+6+1)
.org 0x214FB6C
	mov	r1,(12*2+6+1)
.org 0x214FBB6
	mov	r7,(12*2)
.org 0x214FC5A
	mov	r2,(12*2+6+2)
.org 0x214FC66
	mov	r1,(12*2+6+2)
.org 0x214FC86
	mov	r2,(12*2+6+3)
.org 0x214FC92
	mov	r1,(12*2+6+3)
.org 0x214FEF6
	mov	r0,(12*2)
.org 0x2150382
	add	r1,(12)
.org 0x21503DC
	add	r1,(12)
.org 0x2150442
	add	r1,(12)
.org 0x2150492
	add	r1,(12)
.org 0x2150502
	add	r1,(12)
.org 0x215055C
	add	r1,(12)
.org 0x21505C6
	add	r1,(12)
.org 0x2150616
	add	r1,(12)
.org 0x2150906
	mov	r1,(12*2+6+0)
.org 0x2150918
	mov	r1,(12*2+6+1)
.org 0x2150B6C
	mov	r1,(12*2+6+2)
.org 0x2150B86
	mov	r1,(12*2+6+3)

.org 0x214FCA8
	.dw	credits_pictures
.org 0x2150420
	.dw	credits_picWidths
	.dw	credits_picOffsets
.org 0x21504E0
	.dw	credits_picOffsets
	.dw	credits_picWidths
.org 0x21505A4
	.dw	credits_picWidths
	.dw	credits_picOffsets
.org 0x2150668
	.dw	credits_picOffsets
	.dw	credits_picWidths

.org 0x214FC46
	cmp	r4,(6)
.org 0x214FFD8
	cmp	r4,(6)
.org 0x214FCCC
	.dw	credits_paletteAnimations
.org 0x214FFE0
	.dw	credits_paletteAnimations

.org 0x214F962
	bl	credits_pictureSizes1
.org 0x214F96E
	bl	credits_pictureSizes1
.org 0x21501CC
	bl	credits_pictureSizes2
.org 0x21501F8
	bl	credits_pictureSizes2
.org 0x2150234
	bl	credits_pictureSizes2
.org 0x2150270
	bl	credits_pictureSizes2
.org 0x21502AC
	bl	credits_pictureSizes2
.org 0x21502D8
	bl	credits_pictureSizes2
.org 0x2150314
	bl	credits_pictureSizes2
.org 0x2150350
	bl	credits_pictureSizes2

.org 0x214FC1A
	bl	credits_getPaletteAnimations1
.org 0x214FF46
	bl	credits_getPaletteAnimations2
.org 0x214FC2C
	bl	credits_getPaletteAnimations3
.org 0x214FF22
	bl	credits_getPaletteAnimations4
.org 0x214FF2A
	bl	credits_getPaletteAnimations4
.org 0x214FF30
	bl	credits_getPaletteAnimations4
.org 0x214FF4E
	bl	credits_getPaletteAnimations4
.org 0x214FF56
	bl	credits_getPaletteAnimations5
.org 0x214FF74
	bl	credits_getPaletteAnimations6
.org 0x214FFA0
	bl	credits_getPaletteAnimations6
.org 0x214FF7A
	bl	credits_getPaletteAnimations7
.org 0x214FFA6
	bl	credits_getPaletteAnimations7
.org 0x214FC00
	bl	credits_getPaletteAnimations8
.org 0x214FC12
	bl	credits_getPaletteAnimations9
.org 0x214FC3C
	bl	credits_getPaletteAnimations10
.org 0x214FF0E
	bl	credits_getPaletteAnimations11
.org 0x214FF38
	bl	credits_getPaletteAnimations12

.close
