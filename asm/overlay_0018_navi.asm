// Overlay 18 - NaviCards

.nds
.open TEMP+"/overlay_0018.bin",readu32(TEMP+"/y9.bin", 18 * 0x20 + 0x4)
.thumb

.org 0x21B25D8
	bl	navi_thermoShow
.org 0x21B25F4
	bl	navi_thermoCursor
.org 0x21B2604
	bl	navi_thermoChoose
.org 0x21B2622	// Stop after one choice
.area 0x8,0x00
	bl	0x21898F0
	b	0x21B2642
.endarea

.org 0x21B1C72
	bl	navi_keyInit

.org 0x21B1F84
	bcs	0x21B1FA2
.org 0x21B1F90
	lsr	r0,r3,0x6
	mov	r3,0xA
	add	r0,0xA
	lsl	r3,r3,0xC
	orr	r3,r0
	ldr	r0,[0x21B1FB8]
.org 0x21B1F9C
	ldr	r2,[0x21B1FC0]
	bl	0x1FF8F40
.org 0x21B1FA2
	bl	navi_keyCursor

.org 0x21B1D6C
	bl	navi_keyPress


.org 0x21B2100
	bl	navi_pitcherButton


.org 0x21B2284	// Fix controls active after hide in first ShovelMan event
	strh	r0,[r5,0xE]	// Unset both controls visible and active

.org 0x21B22AC
	bl	navi_shovelButton1
.org 0x21B22E4
	bl	navi_shovelButton2
.org 0x21B2312
	bl	navi_shovelButton3

.close
