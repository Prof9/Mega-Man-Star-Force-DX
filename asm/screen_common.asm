.nds
.thumb

// screen_common_17 - Title Screen palette
.open TEMP+"/screen_common/screen_common_17.bin",0

.org 0x0
.area 0x1E0
	.import TEMP+"/titlescreen.pal.bin"
.endarea

.close
