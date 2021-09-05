// Overlay 238 - Station Comp 3 object scripts

.nds
.thumb
.open TEMP+"/overlay_0238.bin",readu32(TEMP+"/y9.bin", 238 * 0x20 + 0x4)


// Change Libra direction
.org 0x21B8E9C
	.db	0x07	:: .db	0x03		:: .align 4
.org 0x21B8F70
	.db	0x07	:: .db	0x03		:: .align 4


.org readu32(TEMP+"/y9.bin", 238 * 0x20 + 0x10)


.align 4
overlay_0238_sinit_init:
	.dw	0
overlay_0238_sinit_init_end:
	.aligna	32

.close



.nds
.open TEMP+"/y9.bin",0

.org 238 * 0x20
	.skip	16
	.dw	overlay_0238_sinit_init
	.dw	overlay_0238_sinit_init_end
	.skip	8

.close