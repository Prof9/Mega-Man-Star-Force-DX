.nds
.thumb

// screen_local_00 - Title Screen icon sprites
.open TEMP+"/screen_local/screen_local_00.bin",0

.org 0xA70
.area 0x200
	.import TEMP+"/titlescreen-satelliteicon.img.bin"
.endarea

.org 0xE74
.area 0x60
	.import TEMP+"/titlescreen-megaicon.pal.bin"
.endarea

.org 0xF34
.area 0x60
	.import TEMP+"/titlescreen-satelliteicon.pal.bin"
.endarea

.close
