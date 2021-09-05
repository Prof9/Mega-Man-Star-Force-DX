// Overlay 0 - CAPCOM Logo

.nds
.open TEMP+"/overlay_0000.bin",readu32(TEMP+"/y9.bin", 0 * 0x20 + 0x4)
.thumb

//.org 0x214F852
//.area 0x114,0x00
//	// Skip Licensed by Nintendo load
//	// Skip ESRB notice load
//	b	0x214F966
//.endarea

.org 0x214F8DC
.area 0x8A,0x00
	// Skip ESRB notice load
	b	0x214F966
.endarea

.close
