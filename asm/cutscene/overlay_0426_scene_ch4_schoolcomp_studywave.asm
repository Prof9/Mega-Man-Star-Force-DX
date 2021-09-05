// Overlay 426 - School Comp Study Wave cutscene

.nds
.thumb
.open TEMP+"/overlay_0426.bin",readu32(TEMP+"/y9.bin", 426 * 0x20 + 0x4)


.org 0x21BE69C
	// Set flag for this Study Wave and reload text archive for questions
	.dw	0x5C	:: .dw	0x21899CC|1
			:: .dw	0x0
	// Check all Study Waves in the area cleared
@@area1:
	.dh	0x16	:: .dh	(47)		// area 1 gate
			:: .dw	@@area2-(.-4)
	.dh	0x8D	:: .dh	(50), (3)	:: .align 4
			:: .dw	@@area2-(.-8)
	// Set camera position
	.dw	0x52	:: .dw	0x00000024, 0xFFFFFE74, 0x00000000
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start script
	.dh	0x26	:: .db	0x4, (30)
	// Wait for script
	.dw	0x08
	// Clear flag
	.dh	0x22	:: .dh	(47)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Go to end
	.dw	0x13	:: .dw	@@end-(.-4)
@@area2:
	.dh	0x16	:: .dh	(48)
			:: .dw	@@area3-(.-4)
	.dh	0x8D	:: .dh	(53), (3)	:: .align 4
			:: .dw	@@area3-(.-8)
	// Set camera position
	.dw	0x52	:: .dw	0x0000009C, 0xFFFFFE4C, 0x00000000
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start script
	.dh	0x26	:: .db	0x4, (30)
	// Wait for script
	.dw	0x08
	// Clear flag
	.dh	0x22	:: .dh	(48)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
	// Go to end
	.dw	0x13	:: .dw	@@end-(.-4)
@@area3:
	.dh	0x16	:: .dh	(49)
			:: .dw	@@end
	.dh	0x8D	:: .dh	(56), (4)	:: .align 4
			:: .dw	@@end-(.-8)
	// Set camera position
	.dw	0x52	:: .dw	0xFFFFFFE4, 0x00000064, 0x00000040
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start script
	.dh	0x26	:: .db	0x4, (30)
	// Wait for script
	.dw	0x08
	// Clear flag
	.dh	0x22	:: .dh	(49)
	// Wait 60 frames
	.dw	0x50	:: .dw	(60)
//	// Go to end
//	.dw	0x13	:: .dw	@@end-(.-4)
@@end:
//	// End cutscene skip
//	.dw	0x12
	// Start screen fade
	.dh	0x1F	:: .db	0x1, 0x8
	// Wait for screen fade
	.dw	0x0B
	// Clear flags
	.dh	0x22	:: .dh	0x594
	.dh	0x22	:: .dh	0xD07
	// Reset camera
	.dw	0x53
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Start screen fade
	.dh	0x1F	:: .db	0x0, 0x8
	// Wait for screen fade
	.dw	0x0B
	// Wait 30 frames
	.dw	0x50	:: .dw	(30)
	// Unlock controls
	.dw	0x2A
	// End script
	.dw	0x04


.align 4
overlay_0426_sinit_init:
	.dw	0
overlay_0426_sinit_init_end:
	.aligna	32
overlay_0426_size:
.close


.nds
.open TEMP+"/y9.bin",0

.org 426 * 0x20
	.skip	16
	.dw	overlay_0426_sinit_init
	.dw	overlay_0426_sinit_init_end
	.skip	8

.close
