// Overlay 28 - Face Pic

.nds
.open TEMP+"/overlay_0028.bin",readu32(TEMP+"/y9.bin", 28 * 0x20 + 0x4)
.thumb

.org 0x21B4460
	bl	face_faceMenuWrapLeft
.org 0x21B449E
	bl	face_faceMenuWrapRight

.org 0x21B4468
	bl	face_colorMenuLeftRight
.org 0x21B44AC
	bl	face_colorMenuLeftRight
.org 0x21B4476
	bl	face_colorMenuWrapLeft
.org 0x21B44B4
	bl	face_colorMenuWrapRight

.org 0x21B44D4
	bl	face_faceMenuNumber
.org 0x21B4514
	bl	face_colorNumber

.org 0x21B61BC
	bl	face_loadSpecialFacePics
.org 0x21B62D2
	bl	face_showSpecialFacePics
.org 0x21B466A
	bl	face_pickSpecialFacePics


// Get palettes dynamically (support more than 3 colors)
.org 0x21B4674
	ldr	r2,[r3,0x4]
	add	r2,0x4
	add	r3,r3,r2
	ldrh	r2,[r4,0x18]

.close
