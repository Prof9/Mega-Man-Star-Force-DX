// Overlay 566 - Final wavehole cutscene

.nds
.thumb
.open TEMP+"/overlay_0566.bin",readu32(TEMP+"/y9.bin", 566 * 0x20 + 0x4)


.org 0x21BE598	// Fix fade in effect
	.dh	0x1F	:: .db	0x0, 0x4


.org readu32(TEMP+"/y9.bin", 566 * 0x20 + 0x10)


.align 4
overlay_0566_sinit_init:
	.dw	0
overlay_0566_sinit_init_end:
	.aligna	32
overlay_0566_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 566 * 0x20
	.skip	16
	.dw	overlay_0566_sinit_init
	.dw	overlay_0566_sinit_init_end
	.skip	8

.close
