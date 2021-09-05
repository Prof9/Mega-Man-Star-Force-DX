.open TEMP+"/battlecard/battlecard_3.bin",0
.org filesize(TEMP+"/battlecard/battlecard_3.bin")

battlecard_quickgauge_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-quickgauge.img.bin"

battlecard_quickgauge_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-quickgauge.pal.bin"

battlecard_slowgauge_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-slowgauge.img.bin"

battlecard_slowgauge_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-slowgauge.pal.bin"

battlecard_lupavarot_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-lupavarot.img.bin"

battlecard_lupavarot_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-lupavarot.pal.bin"

battlecard_lupbach_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-lupbach.img.bin"

battlecard_lupbach_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-lupbach.pal.bin"

battlecard_hollow_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-hollow.img.bin"

battlecard_hollow_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-hollow.pal.bin"

battlecard_starfrag1_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-starfrag1.img.bin"

battlecard_starfrag1_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-starfrag1.pal.bin"

battlecard_starfrag2_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-starfrag2.img.bin"

battlecard_starfrag2_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-starfrag2.pal.bin"

battlecard_starfrag3_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-starfrag3.img.bin"

battlecard_starfrag3_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-starfrag3.pal.bin"

battlecard_starfrag4_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-starfrag4.img.bin"

battlecard_starfrag4_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-starfrag4.pal.bin"

battlecard_starticket_img:
	.dh	0x40, 0x40
	.dw	0xC, 0x40
	.import	TEMP+"/card-starticket.img.bin"

battlecard_starticket_pal:
	.dh	0x5, 0x10
	.import	TEMP+"/card-starticket.pal.bin"

.close
