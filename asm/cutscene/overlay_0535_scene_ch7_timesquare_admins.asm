// Overlay 535 - Chapter 7 Time Square Satellite admins cutscene

.nds
.thumb
.open TEMP+"/overlay_0535.bin",readu32(TEMP+"/y9.bin", 535 * 0x20 + 0x4)

.org 0x21BEB78
.area 0x38,0x00
	// Give all three Satellite admin Giga Cards
	.dh	0x5F
	.dh	0xE7
	.db	0x01,0x03
	.align 4
	.dh	0x5F
	.dh	0xEC
	.db	0x01,0x03
	.align 4
	.dh	0x5F
	.dh	0xF1
	.db	0x01,0x03
	.align 4

	.dw	0x13
	.dw	@@end-(.-4)
.endarea
@@end:


.org readu32(TEMP+"/y9.bin", 535 * 0x20 + 0x10)

.align 4
overlay_0535_sinit_init:
	.dw	0
overlay_0535_sinit_init_end:
	.aligna	32
overlay_0535_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 535 * 0x20
	.skip	16
	.dw	overlay_0535_sinit_init
	.dw	overlay_0535_sinit_init_end
	.skip	8

.close
