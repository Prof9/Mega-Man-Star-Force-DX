.open TEMP+"/fieldcardforce/fieldcardforce_20.bin",0
.orga filesize(TEMP+"/fieldcardforce/fieldcardforce_20.bin")
	.import TEMP+"/keyman-cursor.img.bin"
.close

.open TEMP+"/fieldcardforce_local/fieldcardforce_local_12.bin",0
.orga 0x1B0C
	.import TEMP+"/keyman-cursor.pal.bin"
.close
