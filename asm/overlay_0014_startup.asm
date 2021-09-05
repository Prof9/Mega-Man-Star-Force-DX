// Overlay 14 - Startup

.nds
.open TEMP+"/overlay_0014.bin",readu32(TEMP+"/y9.bin", 14 * 0x20 + 0x4)
.thumb

.org 0x214F894
	bl	startup_canAccess
.org 0x214F8BE
	bl	startup_verifyNotCorrupt

.org 0x214F986
	bl	startup_postText

.close
