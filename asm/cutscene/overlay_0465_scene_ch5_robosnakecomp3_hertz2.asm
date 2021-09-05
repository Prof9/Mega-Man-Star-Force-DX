// Overlay 465 - Robo Snake Comp Mr. Hertz cutscene

.nds
.thumb
.open TEMP+"/overlay_0465.bin",readu32(TEMP+"/y9.bin", 465 * 0x20 + 0x4)


.org 0x21BE5D8
	.dw	0x13	:: .dw	@skip1Start-(.-4)
@return1Start:

.org 0x21BE698
	.dw	0x13	:: .dw	@skip1End-(.-4)
@return1End:


.org readu32(TEMP+"/y9.bin", 465 * 0x20 + 0x10)


.align 4
@skip1Start:
	// Set up cutscene skip
	.dw	0x11	:: .dw	@skip1End-(.-4)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Jump back
	.dw	0x13	:: .dw	@return1Start-(.-4)

.align 4
@skip1End:
	// Clear cutscene skip
	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x4
	// Wait for screen fade
	.dw	0x0B

@@poison:
//	// Check if poisoned
//	.dh	0x16	:: .dh	0x691	:: .dw	@@gate-(.-4)
	// Clear flag: poisoned
	.dh	0x22	:: .dh	0x691
	// Remove poisoned sprite
	.dw	0x5C	:: .dw	0x218A0D0|1
			:: .dw	0x0
@@gate:
	// Check if gate closed
	.dh	0x16	:: .dh	0x27	:: .dw	@@end-(.-4)
	// Set flag: suppress SFX
	.dh	0x21	:: .dh	0xF18D
	// Clear flag: gate
	.dh	0x22	:: .dh	0x27
@@end:
	// Jump back
	.dw	0x13	:: .dw	@return1End-(.-4)


.align 4
overlay_0465_sinit_init:
	.dw	0
overlay_0465_sinit_init_end:
	.aligna	32
overlay_0465_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 465 * 0x20
	.skip	16
	.dw	overlay_0465_sinit_init
	.dw	overlay_0465_sinit_init_end
	.skip	8

.close
