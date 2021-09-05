// Overlay 601 - Harp Note

.nds
.open TEMP+"/overlay_0601.bin",readu32(TEMP+"/y9.bin", 601 * 0x20 + 0x4)
.thumb


// Stats
.org 0x21BFD32	// Pulse Song damage
	// Old: 30, 60, 120
	.dh	30, 90, 150, 500, 150, 150
.org 0x21BFD4A	// Contact damage
	// Old: 30, 60, 120
	.dh	30, 90, 150, 500, 150, 150
.org 0x21BFD56	// HP
	// Old: 700, 1200, 1600
	.dh	700, 1600, 1900, 4000, 1900, 1900
.org 0x21BFD70	// Machine Gun Strings damage
	// Old: 5, 10, 20
	.dh	5, 15, 25, 75, 25, 25
.org 0x21BFD88	// Shock Note damage
	// Old: 30, 60, 120
	.dh	30, 90, 150, 500, 150, 150

.org 0x21BFCE0	// Move lag
	.db	13, 10, 8, 4, 8, 8
.org 0x21BFD00	// Shock Note pre lag
	.db	10, 8, 6, 1, 6, 6
.org 0x21BFCE8	// Shock Note post lag
	.db	10, 8, 6, 4, 6, 6
.org 0x21BFCF8	// Machine Gun Strings pre lag
	.db	10, 9, 6, 1, 6, 6
.org 0x21BFD08	// Machine Gun Strings post lag
	.db	10, 9, 4, 2, 4, 4
.org 0x21BFCF0	// Pulse Song post lag
	.db	10, 8, 4, 2, 4, 4


.org 0x21BEC8C
	bl	@dxModel
.org 0x21BECCC
	bl	@dxHP
.org 0x21BEC7E
	bl	@dxContactDamage
.org 0x21BF89A
	bl	@dxPulseSong
.org 0x21BF636
	bl	@dxMachineGunStrings
.org 0x21BF4FE
	bl	@dxShockNote


.org 0x21BFE64 + 0x10
	.dw	@update|1

.org 0x21BED86
	bl	@ai
.org 0x21BEE36
	bl	@restoreShockNoteBoxes
.org 0x21BED5A
	bl	@advanceAnimation

.org 0x21BEDE0
	bl	@moveCount
.org 0x21BF3AA
	bl	@moveLag
.org 0x21BF3FC
	bl	@moveConfuseBlindLag
.org 0x21BF4F4
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF50E
	bl	@shockNotePreLag
.org 0x21BF51E
	bl	@shockNotePostLag
.org 0x21BF530
	bl	@shockNoteCounterFrames
.org 0x21BF54C
	bl	@shockNoteConfuseBlindLag
.org 0x21BF552
	pop	r15
.org 0x21BF62C
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF646
	bl	@machineGunStringsPreLag
.org 0x21BF656
	bl	@machineGunStringsPostLag
.org 0x21BF668
	bl	@machineGunStringsCounterFrames
.org 0x21BF696
	bl	@machineGunStringsConfuseBlindLag
.org 0x21BF69C
	pop	r15
.org 0x21BF890
	push	r14
	mov	r1,0x34
	ldrb	r1,[r0,r1]
.org 0x21BF8BA
	bl	@pulseSongLength
.org 0x21BF8CA
	bl	@pulseSongPostLag
.org 0x21BF8DC
	bl	@pulseSongCounterFrames
.org 0x21BF8F8
	bl	@pulseSongConfuseBlindLag
.org 0x21BF8FE
	pop	r15
.org 0x21BFB0A
	ldr	r3,[0x21BFB20]
	bl	@pulseSongConfuse


.orga readu32(TEMP+"/y9.bin", 601 * 0x20 + 0x8)
.area 0x29C0-orga()
@free:


.align 2
@dxModel:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (495))
@@end:
	bl	0x21745FC
	pop	r15
.align 2
@dxHP:
@dxContactDamage:
	push	r14
	bl	battle_isDXBoss_r5obj
	beq	@@end
	add	r1,0x2
@@end:
	ldsh	r1,[r0,r1]
	mov	r0,r5
	pop	r15
.align 2
@dxPulseSong:
@dxMachineGunStrings:
@dxShockNote:
	push	r14
	bl	battle_isDXBoss
	beq	@@end
	add	r2,0x2
@@end:
	ldsh	r1,[r1,r2]
	mov	r2,0x4E
	pop	r15


.align 2
@moveCount:
	// Old: 2, 2, 2
	// New: 2/3, 2/3, 2/3
	push	r14
	ldrb	r1,[r4,r2]
	bl	battle_isLegendMode
	beq	@@end
	push	r0-r3
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsr	r0,r0,0x6	// test 0x20
	pop	r0-r3
	bcc	@@end
	add	r3,=@@data
@@end:
	ldrb	r3,[r3,r5]
	pop	r15
.align 4
@@data:
	.db	3, 3, 3, 3, 3, 3
.align 2
@moveLag:
	// Old: 13, 10, 8
	// New: 8, 6, 5
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r1,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r0,=@@data
@@end:
	ldrb	r1,[r0,r1]
	mov	r0,r2
	pop	r15
.align 4
@@data:
	.db	8, 6, 5, 2, 5, 5
.align 2
@moveConfuseBlindLag:
	// Old: +15
	// New: +8
	push	r14
	add	r2,0xA
	bl	battle_isLegendMode
	beq	@@normal
	add	r0,(8)
	b	@@end
@@normal:
	add	r0,(15)
@@end:
	pop	r15
.align 2
@pulseSongConfuse:
	// Old: 1, 2, 3
	// New: 2, 3, 3
	push	r14
	lsl	r2,r2,0x2
	bl	battle_isLegendMode
	beq	@@end
	add	r3,=@@data
@@end:
	ldr	r2,[r3,r2]
	pop	r15
.align 4
@@data:
	.dw	2, 3, 3, 3, 3, 3
.align 2
@pulseSongConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x1C
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15
.align 2
@pulseSongCounterFrames:
	// Old: 8, 8, 8
	// New: 6, 6, 6
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dh	6, 6, 6, 6, 6, 6
.align 2
@pulseSongLength:
	// Old: 30, 30, 30
	// New: 17, 17, 17
	push	r14
	bl	battle_isLegendMode
	beq	@@normal
	add	r1,=@@data
	bl	battle_isDXBoss
	beq	@@end
	add	r3,0x1
	b	@@end
@@normal:
	bl	battle_isDXBoss
	beq	@@end
	mov	r3,(23)
	b	@@end2
@@end:
	ldrb	r3,[r1,r3]
@@end2:
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	17, 17, 17, 17, 17, 17
.align 2
@pulseSongPostLag:
	// Old: 10, 8, 4
	// New: 5, 4, 2
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	5, 4, 2, 1, 2, 2
.align 2
@machineGunStringsConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x18
	bl	battle_isLegendmode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15
.align 2
@machineGunStringsCounterFrames:
	// Old: 6, 6, 6
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldsh	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dh	4, 4, 4, 4, 4, 4
.align 2
@machineGunStringsPreLag:
	// Old: 10, 9, 6
	// New: 6, 5, 3
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	6, 5, 3, 1, 3, 3
.align 2
@machineGunStringsPostLag:
	// Old: 10, 9, 4
	// New: 5, 4, 2
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	5, 4, 2, 1, 2, 2
.align 2
@shockNotePreLag:
	// Old: 10, 8, 6
	// New: 9, 6, 3
	// Make sure to line up with Shock Note boxes
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	9, 8, 7, 6, 7, 7
.align 2
@shockNotePostLag:
	// Old: 10, 8, 6
	// New: 6, 4, 2
	push	r14
	bl	battle_isDXBoss
	beq	@@checkLegend
	add	r3,0x1
@@checkLegend:
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldrb	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.db	6, 4, 2, 1, 2, 2
.align 2
@shockNoteCounterFrames:
	// Old: 6, 6, 6
	// New: 4, 4, 4
	push	r14
	bl	battle_isLegendMode
	beq	@@end
	add	r1,=@@data
@@end:
	ldr	r3,[r1,r3]
	mov	r1,r2
	pop	r15
.align 4
@@data:
	.dw	4, 4, 4, 4, 4, 4
.align 2
@shockNoteConfuseBlindLag:
	// Old: +30
	// New: +15
	push	r14
	add	r2,0x18
	bl	battle_isLegendmode
	beq	@@normal
	add	r1,(15)
	b	@@end
@@normal:
	add	r1,(30)
@@end:
	pop	r15

.align 2
@advanceAnimation:
	push	r0,r14
	bl	0x217466C	// advance animation
	pop	r0

	bl	battle_isLegendMode
	beq	@@end

	// Make Shock Note animation twice as fast
	mov	r1,0x31
	ldrb	r1,[r0,r1]	// animation
	lsl	r1,r1,0x19
	lsr	r1,r1,0x19
	cmp	r1,0x4
	bne	@@end
	ldrb	r1,[r0,0x1C]	// action state
	cmp	r1,0xC		// Shock Note
	bne	@@end
	bl	0x217466C	// advance animation
@@end:
	pop	r15


.align 2
@restoreShockNoteBoxes:
	mov	r1,0xC
	mov	r2,0xFF
	push	r0-r2,r14

	bl	battle_isLegendMode
	beq	@@end

	// Restore Shock Note boxes
	bl	0x21BFC78

@@end:
	pop	r0-r2,r15


.align 2
@update:
	push	r4,r14
	mov	r4,r0

	// Call normal update
//	mov	r0,r4
	bl	0x21BED50

	bl	battle_isLegendMode
	beq	@@end

	// Exit if paused
	ldr	r1,=0x21ACC6C
	ldr	r1,[r1,0x30]
	lsr	r1,r1,0x1	// test 0x1
	bcc	@@end
	lsr	r1,r1,0x2	// test 0x4
	bcs	@@end

	// Check LuPelvis exists
	mov	r2,0xB4
	ldr	r1,[r4,r2]
	cmp	r1,0x0
	beq	@@checkDeath

	// Check LuPelvis is dead
	mov	r2,0x4C
	ldsh	r1,[r1,r2]	// HP
	cmp	r1,0x0
	bgt	@@checkDeath

	// Remove green invis from self
	mov	r1,0xAC
	ldr	r1,[r4,r1]
	cmp	r1,0x0
	beq	@@checkDeath

	ldr	r2,[r1,0x2C]
	mov	r3,(0x200 >> 0x8)
	lsl	r3,r3,0x8
	bic	r2,r3
	str	r2,[r1,0x2C]

@@checkDeath:
	// Check own HP 0
	mov	r3,0x4C
	ldrh	r1,[r4,r3]
	cmp	r1,0x0
	ble	@@killLuPelvis

	// Check LuPelvis exists
	mov	r2,0xB4
	ldr	r1,[r4,r2]
	cmp	r1,0x0
	bne	@@end

	// LuPelvis timer
	mov	r2,0xB8
	mov	r3,0xBA
	ldrb	r1,[r4,r2]	// started
	cmp	r1,0x1
	beq	@@doTimer
	bgt	@@restartTimer

@@initTimer:
	// Initialize timer
	mov	r1,0x1
	strb	r1,[r4,r2]

	mov	r1,(30)
	b	@@setTimer

@@restartTimer:
	mov	r1,0x1
	strb	r1,[r4,r2]

	// Restart timer
	mov	r1,0x34
	ldrb	r1,[r4,r1]	// level
	ldr	r2,=@luPelvisRespawnTime
	lsl	r1,r1,0x1
	ldrh	r1,[r2,r1]

@@setTimer:
	strh	r1,[r4,r3]

@@doTimer:
	ldrh	r1,[r4,r3]
	cmp	r1,0x0
	ble	@@end
	sub	r1,0x1
	strh	r1,[r4,r3]

	b	@@end	

@@killLuPelvis:
	// Check LuPelvis exists
	mov	r2,0xB4
	ldr	r2,[r4,r2]	// child 1
	cmp	r2,0x0
	beq	@@end

	// Set LuPelvis HP to 0
	mov	r1,0x0
	strh	r1,[r2,r3]

	// Remove from child
	mov	r3,0xB0
	str	r1,[r2,r3]
	// Remove from self
	mov	r3,0xB4
	str	r1,[r2,r3]

//	b	@@end

@@end:
	mov	r0,0x1
	pop	r4,r15


@ai:
	push	r4,r14
	mov	r4,r0

	// Call normal AI
//	mov	r0,r4
	bl	0x21BEDB4

	bl	battle_isLegendMode
	beq	@@end

	// Update LuPelvis
	mov	r0,r4
	bl	@summonLuPelvis

@@end:
	pop	r4,r15
	
.align 2
@summonLuPelvis:
	// r0 = this
	// r1 = x
	push	r4-r6,r14
	mov	r5,r0		// parent object
//	mov	r6,r1		// x

	// Check already spawned
	mov	r0,0xB4
	ldr	r0,[r5,r0]	// child 1
	cmp	r0,0x0
	bne	@@end

	// Check timer
	mov	r0,0xB8
	ldrb	r0,[r5,r0]	// started
	cmp	r0,0x1		// running
	bne	@@end

	mov	r0,0xBA
	ldrh	r0,[r5,r0]	// timer
	cmp	r0,0x0
	bgt	@@end

	// Set LuPelvis deleted temp flag
	ldr	r1,=0xF19A
	bl	0x2024018	// set flag

	// Choose random other column
	ldr	r0,=0x211F6A8
	bl	0x20069E0	// random
	lsl	r6,r0,0x1F
	lsr	r6,r6,0x1F	// 0 or 1
	add	r6,0x1		// 1 or 2
	mov	r1,0x68
	ldsb	r1,[r5,r1]	// parent x
	cmp	r6,r1
	blt	@@spawn
	add	r6,0x1		// 1 or 2 or 3 not parent x

@@spawn:
	// Allocate object
	mov	r0,(0x1D0 >> 0x4)
	lsl	r0,r0,0x4
	bl	0x21743C0
	mov	r4,r0
	beq	@@end

	// Set actions
	ldr	r0,=0x21A9770	// LuPelvis actions
	str	r0,[r4]

	// Add to linked list
	ldr	r0,=0x212E2C0
	add	r1,r4,0x4
	mov	r2,r4
	mov	r3,0x1
	bl	0x2032BF0

	// Initialize
	mov	r0,r4
	mov	r1,0x5		// y
	lsl	r1,r1,0x8
	add	r1,r1,r6	// x,y
	mov	r2,0x30
	ldrb	r2,[r5,r2]	// alignment?
	mov	r3,0x0		// level?
	bl	0x2167428

	// Set parent object
	mov	r0,0xB0
	str	r5,[r4,r0]
	// Set child object
	mov	r0,0xB4
	str	r4,[r5,r0]

	// Play appear SFX
	ldr	r0,=0x21206CC
	ldr	r0,[r0]
	mov	r1,0xC6		// appear SFX
	bl	0x2025574	// play SFX

	// Override HP
	ldr	r1,=@luPelvisHP
	mov	r0,0x34
	ldrb	r0,[r5,r0]	// level
	bl	battle_isDXBoss
	beq	@@setHP
	add	r0,0x1
@@setHP:
	lsl	r0,r0,0x1
	ldrh	r0,[r1,r0]	// HP
	mov	r1,0x4C
	strh	r0,[r4,r1]
	mov	r1,0x4E
	strh	r0,[r4,r1]

	// Increment enemy count
	ldr	r1,=0x21ACC6C
	add	r1,0x18
	mov	r2,0x30
	ldrb	r2,[r5,r2]	// alignment
	ldrb	r0,[r1,r2]	// enemy count
	add	r3,r0,0x1
	strb	r3,[r1,r2]

	// Add to lock-on
	ldr	r3,=0x21ACC6C
	ldrb	r1,[r3,0x10]
	cmp	r1,r2
	bne	@@opposite

	cmp	r1,0x0
	beq	@@player
	b	@@enemy
@@opposite:
	cmp	r1,0x0
	beq	@@enemy
//	b	@@player

@@player:
	add	r3,0x70
	b	@@addLockOn
@@enemy:
	add	r3,0x80
//	b	@@addLockOn

@@addLockOn:
	lsl	r0,r0,0x2
	str	r4,[r3,r0]

@@end:
	mov	r0,r4
	pop	r4-r6,r15

	.pool

@luPelvisHP:
	.dh	50, 75, 100, 200, 100, 100
@luPelvisRespawnTime:
	.dh	240, 180, 120, 120, 120, 120


.aligna 32
.endarea
.close
