// Overlay 147 - AMAKEN Grounds ER map script

.nds
.thumb
.open TEMP+"/overlay_0147.bin",readu32(TEMP+"/y9.bin", 147 * 0x20 + 0x4)

.org 0x21B8770
	.dw	0x13
	.dw	@brother-(.-4)
	

.org readu32(TEMP+"/y9.bin", 147 * 0x20 + 0x10)

@brother:
	// Check flag 0xF004 set
	.dh	0x16
	.dh	0xF004
	.dw	@jammer1-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	0x134		// Boktai Brother 2
	.dw	0x0
	// End
	.dw	0x04

@jammer1:
	// Check Jammer cutscene active
	.dh	0x16
	.dh	0xF124
	.dw	@dragonSky1-(.-4)

	// Check if cutscene already watched
	.dh	0x15
	.dh	0xF125
	.dw	@dragonSky1-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	0x13E	// Jammer post-battle
	.dw	0x00
	// End
	.dw	0x04

@dragonSky1:
	// Check game progress
	.dh	0x14
	.db	0x50,0x5F
	.dw	@dragonSky2-(.-4)

	.dw	0x13
	.dw	@leoKingdom1-(.-4)

@dragonSky2:
	// Check if cutscene active
	.dh	0x16
	.dh	0x0713
	.dw	@end-(.-4)

	// Check if cutscene already watched
	.dh	0x15
	.dh	0xF036
	.dw	@dragonSky3-(.-4)

	// Check if on map block
	.dw	0x1C
	.dw	0x11
	.dw	@end-(.-8)

	// Start cutscene
	.dw	0x4C
	.dw	0x13A	// Dragon Sky pre-battle
	.dw	0x00
	// End
	.dw	0x04

@dragonSky3:
	// Check if cutscene already watched
	.dh	0x15
	.dh	0x0061
	.dw	@end-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	0x13B	// Dragon Sky post-battle
	.dw	0x00
	// End
	.dw	0x04

@leoKingdom1:
	// Check game progress
	.dh	0x14
	.db	0x60,0x6F
	.dw	@leoKingdom2-(.-4)

	.dw	0x13
	.dw	@end

@leoKingdom2:
	// Check if cutscene active
	.dh	0x16
	.dh	0x081A
	.dw	@end-(.-4)

	// Check if cutscene already watched
	.dh	0x15
	.dh	0xF039
	.dw	@leoKingdom3-(.-4)

	// Check if on map block
	.dw	0x1C
	.dw	0x11
	.dw	@end-(.-8)

	// Start cutscene
	.dw	0x4C
	.dw	0x13C	// Leo Kingdom pre-battle
	.dw	0x00
	// End
	.dw	0x04

@leoKingdom3:
	// Check if cutscene already watched
	.dh	0x15
	.dh	0x081B
	.dw	@end-(.-4)

	// Start cutscene
	.dw	0x4C
	.dw	0x13D	// Leo Kingdom post-battle
	.dw	0x00
	// End
	.dw	0x04

@end:
	.dw	0x04


.align 4
overlay_0147_sinit_init:
	.dw	0
overlay_0147_sinit_init_end:
	.aligna	32
.close



.nds
.open TEMP+"/y9.bin",0

.org 147 * 0x20
	.skip	16
	.dw	overlay_0147_sinit_init
	.dw	overlay_0147_sinit_init_end
	.skip	8

.close
