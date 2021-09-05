// Overlay 16 - Save screen

.nds
.open TEMP+"/overlay_0016.bin",readu32(TEMP+"/y9.bin", 16 * 0x20 + 0x4)
.thumb

.org 0x21B1562	// Save screen variables x-position
	mov	r0,0xF	// from 0xE
.org 0x21B169C
	mov	r0,0xF	// from 0xE


.org 0x21B1256	// Increase max game time to 999:59
	sub	sp,0x28		// alloc 0x4 extra
.org 0x21B1266
	bl	common_convertTimeLong
.org 0x21B1276
	ldr	r1,[r1,0xC]	// load long hours
.org 0x21B1588
	add	sp,0x28		// alloc 0x4 extra

.org 0x21B15AA	// Increase max game time to 999:59
	sub	sp,0x20		// alloc 0x4 extra
.org 0x21B15BA
	bl	common_convertTimeLong
.org 0x21B15CA
	ldr	r1,[r1,0x4]	// load long hours
.org 0x21B16C2
	add	sp,0x20		// dealloc 0x4 extra


.org 0x21B114A	// Random mugshot for saving
	bl	save_chooseSaveMugshot1
.org 0x21B116A
	bl	save_chooseSaveMugshot2


.close
