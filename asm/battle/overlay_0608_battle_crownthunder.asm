// Overlay 608 - Crown Thunder

.nds
.open TEMP+"/overlay_0608.bin",readu32(TEMP+"/y9.bin", 608 * 0x20 + 0x4)
.thumb


.org 0x21C0EF6	// HP
	.dh	2000, 2300, 3000
.org 0x21C0EFC	// Contact damage
	.dh	50, 90, 150
.org 0x21C0F54	// Menacing Bowgun damage
	.db	80, 120, 200
.org 0x21C0F80	// Assault Lance damage
	.dh	80, 120, 200
.org 0x21C0F48	// Wavy Hammer damage
	.db	80, 120, 200
.org 0x21C0F38	// Fall Thunder damage
	.db	50, 90, 150

.org 0x21C0F28	// Move lag
	.db	10, 8, 5, 3
.org 0x21C0F78	// Fall Thunder pre lag
	.db	11-1, 6-1, 1-1, 1-1
.org 0x21C0F20	// Fall Thunder mid lag
	.db	4, 4, 4, 2
.org 0x21C0F6C	// Fall Thunder post lag
	.db	60, 60, 60, 10


.org 0x21BEC30
	bl	crown_dxHP
.org 0x21BECA0
	bl	crown_dxModel
.org 0x21BEC80
	bl	crown_dxContactDamage
.org 0x21C0DC4
	bl	crown_dxMenacingBowgun
.org 0x21C0B46
	bl	crown_dxAssaultLance
.org 0x21C0B9E
	bl	crown_dxWavyHammer
.org 0x21BFFAA
	bl	crown_dxFallThunder
	ldr	r0,[0x21C0004]


.org 0x21BEDE2
	bl	crown_advanceAnimation
.org 0x21BF430
	bl	crown_lowHpMoveCount
//.org 0x21BF460
//	bl	crown_moveCountFallThunder
.org 0x21BF46C
	bl	crown_attackCountFallThunder
.org 0x21BF47C
	bl	crown_doubleAttackThreshold
.org 0x21BFBD2
	bl	crown_moveLag
.org 0x21BEFD4
	ldr	r1,[0x21BF088]
	bl	crown_ghostAttackCounterFrames
.org 0x21BF11C
	ldr	r1,[0x21BF1D0]
	bl	crown_ghostAttackCounterFrames
.org 0x21BF21C
	bl	crown_fallThunderPreLag1
.org 0x21BF26E
	bl	crown_fallThunderPreLag2
.org 0x21BF2BC
	bl	crown_fallThunderMidLag
.org 0x21BF27C
	bl	crown_fallThunderCount
.org 0x21BF3D0
	bl	crown_fallThunderPostLag
.org 0x21BF3E4
	bl	crown_fallThunderPostLag
.org 0x21BF3D6
	bl	crown_fallThunderConfuseBlindLag
.org 0x21C0BC0
	bl	crown_waveHammerGravity

.org 0x21BF504
	bl	crown_setupMenacingBowgunSingle
.org 0x21BF50C
	bl	crown_setupAssaultLanceSingle
.org 0x21BF512
	bl	crown_setupWavyHammerSingle
.org 0x21BF536
	bl	crown_setupMenacingBowgunSingle
.org 0x21BF540
	bl	crown_setupWavyHammerDouble
.org 0x21BF546
	bl	crown_setupMenacingBowgunDouble
.org 0x21BF552
	bl	crown_setupAssaultLanceSingle
.org 0x21BF558
	bl	crown_setupWavyHammerSingle
.org 0x21BF564
	bl	crown_setupAssaultLanceDouble
.org 0x21BF65C
	bl	crown_targetMenacingBowgun
.org 0x21BF742
	bl	crown_targetAssaultLance
.org 0x21BF88C
	bl	crown_targetWavyHammer


.org 0x21BF2FE	// Adjust Fall Thunder animation
.area 0x22,0x00
	cmp	r1,0x0
	bne	@@nextBolt

	mov	r0,0x8
	strb	r0,[r4,0x1D]

	mov	r0,0x8A		// recover animation
	mov	r1,0x31
	strb	r0,[r4,r1]
	b	@@end

@@nextBolt:
	mov	r1,0x3
	strb	r1,[r4,0x1D]
	mov	r1,0xA
	sub	r0,0x4
	strh	r1,[r4,r0]
	mov	r0,r4
	bl	0x21BFE08
@@end:
	pop	r4,r15
.endarea


.orga readu32(TEMP+"/y9.bin", 608 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.aligna 32
.endarea
.close
