// Overlay 25 - Transer

.nds
.open TEMP+"/overlay_0025.bin",readu32(TEMP+"/y9.bin", 25 * 0x20 + 0x4)
.thumb


.org 0x21B45F8	// Don't use player last name for Hope Stelar
	b	0x21B464E

.org 0x21B46E8	// Move name to the right
	mov	r0,0xB


.close
