// Overlay 376 - PitcherMan cutscene

.nds
.thumb
.open TEMP+"/overlay_0376.bin",readu32(TEMP+"/y9.bin", 376 * 0x20 + 0x4)


.org 0x21BE5C4
	// Load sprite: Geo Special w/ Visualizer
	.dh	0x74	:: .db	0x01,0x05
			:: .dh	0x58, 0xFFFF


.org 0x21BE600
	// Set flag: Wave World visible
	.dh	0x21	:: .dh	0xD08
	// Visualizer state: Visualizer on
	.dh	0x62	:: .dh	0x2

.org 0x21BE790
	.dw	0x13	:: .dw	@skip2Start-(.-4)
@return2Start:


.org readu32(TEMP+"/y9.bin", 376 * 0x20 + 0x10)


.align 4
@skip2Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	0x21BE7D8-(.-4)
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Jump back
	.dw	0x13	:: .dw	@return2Start-(.-4)


.align 4
overlay_0376_sinit_init:
	.dw	0
overlay_0376_sinit_init_end:
	.aligna	32
overlay_0376_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 376 * 0x20
	.skip	16
	.dw	overlay_0376_sinit_init
	.dw	overlay_0376_sinit_init_end
	.skip	8

.close
