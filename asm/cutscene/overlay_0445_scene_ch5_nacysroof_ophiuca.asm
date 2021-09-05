// Overlay 445 - Nacys Roof Ophiuca cutscene

.nds
.thumb
.open TEMP+"/overlay_0445.bin",readu32(TEMP+"/y9.bin", 445 * 0x20 + 0x4)


.org 0x21BE608	// Visualizer off
	.dh	0x62	:: .dh	0x1
.org 0x21BE8A8	// Visualizer off
	// Clear flag 0xD08
	.dh	0x22	:: .dh	0xD08

.close
