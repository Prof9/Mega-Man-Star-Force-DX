// Overlay 29 - Minigame

.nds
.open TEMP+"/overlay_0029.bin",readu32(TEMP+"/y9.bin", 29 * 0x20 + 0x4)
.thumb

.org 0x21B3FB6
	bl	minigame_stationInit

.org 0x21B51C0
	.dw	minigame_stationCursor|1

.org 0x21B4050
	bl	minigame_stationButtons

.close
