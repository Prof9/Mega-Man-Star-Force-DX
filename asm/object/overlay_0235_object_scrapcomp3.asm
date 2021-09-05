// Overlay 235 - Scrap Comp 3 object scripts

.nds
.thumb
.open TEMP+"/overlay_0235.bin",readu32(TEMP+"/y9.bin", 235 * 0x20 + 0x4)

// Restore Lucian and Rymer objects
.orga 0x4 * 5
	// Skip exit for Lucian
	.dw	readu32(TEMP+"/overlay_0235.bin", 0x4 * 5) + 4
.orga 0x4 * 6
	// Skip exit for Rymer
	.dw	readu32(TEMP+"/overlay_0235.bin", 0x4 * 6) + 4

.close