// Overlay 480 - Chapter 6 Time Square Pat cutscene

.nds
.thumb
.open TEMP+"/overlay_0480.bin",readu32(TEMP+"/y9.bin", 480 * 0x20 + 0x4)

.org 0x21BE6E4
	// Don't enable Dream Island destination
	.dh	0x21
	.dh	0x713	// Same flag as previous command


.org readu32(TEMP+"/y9.bin", 480 * 0x20 + 0x10)

.align 4
overlay_0480_sinit_init:
	.dw	0
overlay_0480_sinit_init_end:
	.aligna	32
overlay_0480_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 480 * 0x20
	.skip	16
	.dw	overlay_0480_sinit_init
	.dw	overlay_0480_sinit_init_end
	.skip	8

.close
