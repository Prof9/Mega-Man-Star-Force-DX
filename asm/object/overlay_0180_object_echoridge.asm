// Overlay 180 - Echo Ridge object scripts

.nds
.thumb
.open TEMP+"/overlay_0180.bin",readu32(TEMP+"/y9.bin", 180 * 0x20 + 0x4)
.area 0x5760

.orga 0x4 * 0x17
	.dw	ovl0180_obj_17
.orga 0x4 * 0x18
	.dw	ovl0180_obj_18
.orga 0x4 * 0x19
	.dw	ovl0180_obj_19


.orga 0x2934	// Fix Speed Navi not facing you when talked to
	.dw	0x0E


.org readu32(TEMP+"/y9.bin", 180 * 0x20 + 0x10)

// Can't resize this!!

.align 4
overlay_0180_sinit_init:
	.dw	0
overlay_0180_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 180 * 0x20
	.skip	16
	.dw	overlay_0180_sinit_init
	.dw	overlay_0180_sinit_init_end
	.skip	8

.close