// Overlay 13 - Post credits

.nds
.open TEMP+"/overlay_0013.bin",readu32(TEMP+"/y9.bin", 13 * 0x20 + 0x4)
.thumb


.org 0x214F856
	bl	postcredits_preLoadSave

.org 0x214F89E
	bl	postcredits_postLoadSave

.org 0x214FA28
	bl	postcredits_drawCard


.close
