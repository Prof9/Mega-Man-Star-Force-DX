.align 2
bgm_preventBGMOverride:
	cmp	r0,0xFF
	beq	@@checkBgm
	bx	r14

@@checkBgm:
	ldrb	r6,[r4,0x11]	// player ID
	cmp	r6,(2)		// SFX slot
	blt	@@skip

	// slot to clear is 0xFF, so skip the slot check
	bl	0x2002AF8
@@skip:
	bl	0x2002B08


.align 2
bgm_saveOriginalVolume:
	str	r0,[r5,0x38]

	ldrb	r0,[r4,0x6]	// SSEQ volume
	mov	r1,0x31
	strb	r0,[r5,r1]	// original volume

	mov	r0,0x3
	bx	r14


.align 2
bgm_resetOriginalVolume:
	mov	r2,0x0
	strh	r2,[r3,0x32]
	mov	r0,0x31
	strb	r2,[r3,r0]
	bx	r14


.align 2
bgm_startOrResumeBgm:
	push	r6-r7,r14
	mov	r6,0x0		// i
	mov	r7,r5
	add	r7,0x2C		// bgmSlot

@@loop:
	// Check if slot is paused
	ldrb	r0,[r7,0x1]
	cmp	r0,0x2
	bne	@@next

	// Check if slot is playing this BGM
	ldrb	r0,[r7]
	ldrh	r1,[r4,0x2]
	cmp	r0,r1
	bne	@@next

	// Set current BGM
	// Maybe not needed?
	mov	r0,(0x1F4 >> 0x2)
	lsl	r0,r0,0x2
	strh	r1,[r5,r0]

	// Start sound fade in
	mov	r0,r5		// this
	mov	r1,r6		// bgmSlot
	mov	r2,(90)		// fade length
	bl	bgm_fadeInAndResume

	// Return 2 levels
	pop	r6-r7
	add	sp,0x4
	bl	0x2025AC0

@@next:
	add	r6,0x1
	add	r7,0x10
	cmp	r6,0x2
	blt	@@loop

	mov	r1,0x0
	str	r1,[sp,0xC]
	pop	r6-r7,r15


.align 2
bgm_pauseOnBattleStart:
	// SF2: 0x2010DEC, also does a flag check?
	ldr	r0,[r0]
	mov	r1,0x71
	push	r0-r1,r14

	// Start pause BGM
	// r0 already correct
	mov	r1,0x0
	mov	r2,0x14
	bl	bgm_fadeOutAndPause

	pop	r0-r1,r15


.align 2
battle_stopBattleBgm:
	push	r0,r14

	// Stop SFX
	// r0 already correct
	mov	r1,0x0		// bgm slot (not used)
	mov	r2,0x0		// fade length
	mov	r3,0x5		// stop SFX and ???
	bl	bgm_stopBgmSfxEx

	// Fade out battle BGM
	pop	r0
	mov	r1,0x1		// bgm slot
	mov	r2,0x5		// fade length
	mov	r3,0x8		// stop specific BGM
	bl	bgm_stopBgmSfxEx

	pop	r15


.align 2
bgm_stopBgmSfxEx:
	// r0 = this
	// r1 = bgmSlot
	// r2 = fade length
	// r3 = options
	push	r0,r3-r7,r14	// push extra for allocation
	mov	r4,r0		// this
	mov	r5,r1		// bgm slot
	mov	r6,r2		// fade length
	mov	r7,r3		// options

	// Check if command can be added
//	mov	r0,r4
	mov	r1,0x2		// stop BGM/SFX command
	mov	r2,r5		// BGM slot
	mov	r3,r6		// fade length
	str	r7,[sp]		// options
	bl	0x2025B58
	cmp	r0,0x0
	beq	@@end

	// Add command
	mov	r0,r4
	mov	r1,0x2
	mov	r2,r5
	mov	r3,r6
	str	r7,[sp]
	bl	0x2025BA8

@@end:
	pop	r0,r3-r7,r15	// pop extra for deallocation


.align 2
bgm_fadeOutAndPause:
	// r0 = this
	// r1 = ?
	// r2 = fade length
	push	r0,r3-r6,r14	// push extra for allocation
	mov	r4,r0		// this
	mov	r5,r1		// bgmSlot
	mov	r6,r2		// fade length

	// Check if command can be added
//	mov	r0,r4
	mov	r1,0x6		// fade out and pause command
	mov	r2,0x0
	mov	r3,0x0
	str	r3,[sp]
	bl	0x2025B58
	cmp	r0,0x0
	beq	@@end

	// Add command
	mov	r0,r4
	mov	r1,0x6
	mov	r2,0x0
	mov	r3,r5
	str	r6,[sp]
	bl	0x2025BA8

@@end:
	pop	r0,r3-r6,r15	// pop extra for deallocation


.align 2
bgm_fadeInAndResume:
	// r0 = this
	// r1 = bgmSlot
	// r2 = fade length
	push	r0,r3-r6,r14	// push extra for allocation
	mov	r4,r0		// this
	mov	r5,r1		// bgmSlot
	mov	r6,r2		// fade length

	// Check if command can be added
//	mov	r0,r4
	mov	r1,0x7		// fade in and resume command
	mov	r2,0x0
	mov	r3,0x0
	str	r3,[sp]
	bl	0x2025B58
	cmp	r0,0x0
	beq	@@end

	// Add command
	mov	r0,r4
	mov	r1,0x7
	mov	r2,0x0
	mov	r3,r5
	str	r6,[sp]
	bl	0x2025BA8

@@end:
	pop	r0,r3-r6,r15	// pop extra for deallocation


.align 2
bgm_bgmCommandHandler:
	add	r0,0x74
	ldrb	r0,[r0]
	cmp	r0,0x6
	beq	@@startFadeOutAndPause
	cmp	r0,0x7
	beq	@@startResumeAndFadeIn
	bx	r14

@@startFadeOutAndPause:
	mov	r0,r4
	add	r1,r5,r1
	bl	bgm_startFadeOutAndPause
	b	@@end

@@startResumeAndFadeIn:
	mov	r0,r4
	add	r1,r5,r1
	bl	bgm_startResumeAndFadeIn
//	b	@@end

@@end:
	// Go to next command
	bl	0x2025556


.align 2
bgm_bgmCmdStopSpecificBgm:
	push	r6,r14
	ldr	r0,[r4,0x8]
	lsr	r0,r0,0x4	// test 0x8
	bcc	@@end

	// Get BGM index
	ldrh	r0,[r4,0x2]	// bgmSlot
	lsl	r0,r0,0x4	// bgmSlot*0x10
	add	r0,0x2C
	ldrb	r6,[r5,r0]	// bgmIdx

	// Fade out/stop BGM in specific slot
	mov	r0,r6		// bgmIdx
	ldr	r1,[r4,0x4]	// fade length
	bl	bgm_fadeOutAllSpecificBgm

	// Clear current BGM
	mov	r0,(0x1F4 >> 0x2)
	lsl	r0,r0,0x2
	ldr	r1,=0xFFFF
	strh	r1,[r5,r0]

	// Set BGM slot to inactive
	mov	r0,r5		// this
	mov	r1,r6		// bgmIdx
	mov	r2,0x0		// inactive
	bl	bgm_setSlotsActive

@@end:
	ldr	r1,[r4,0x8]
	mov	r0,0x4
	pop	r6,r15


.align 2
bgm_soundCommandHandler:
	ldrb	r0,[r3]
	cmp	r0,0x18
	beq	@@startPauseOrUnpause
	cmp	r0,0x17
	bx	r14

@@startPauseOrUnpause:
	ldr	r0,[r3,0x4]	// bgmIdx
	ldr	r1,[r3,0x8]	// fade length
	bl	bgm_PauseOrUnpauseAllSpecificBgm
//	b	@@end

@@end:
	// Go to next command
	bl	0x200645C


.align 2
bgm_startResumeAndFadeIn:
	// r0 = this
	// r1 = command params
	push	r3-r6,r14
	mov	r4,r0		// this
	mov	r5,r1		// command params
	ldr	r6,[r5,0x4]	// bgmSlot
	lsl	r6,r6,0x4	// bgmSlot*0x10
	add	r6,r4,r6
	add	r6,0x2C		// slot

	// Check BGM paused in slot
	ldrb	r0,[r6,0x1]
	cmp	r0,0x2
	bne	@@end

	// Set current BGM
	ldrb	r0,[r6]		// bgmIdx
	mov	r1,(0x1F4 >> 0x2)
	lsl	r1,r1,0x2
	strh	r0,[r4,r1]

	// Unpause BGM
//	ldrb	r0,[r6]		// bgmIdx
	ldr	r1,[r5,0x8]	// fade length
	bl	bgm_enqueueCommandFadeOutAndPause

	// Set BGM slot to playing
	mov	r0,0x1
	strb	r0,[r6,0x1]

@@end:
	pop	r3-r6,r15

.align 2
bgm_startFadeOutAndPause:
	// r0 = this
	// r1 = command params
	push	r3-r6,r14
	mov	r4,r0		// this
	mov	r5,r1		// command params
	ldr	r6,[r5,0x4]	// bgmSlot
	lsl	r6,r6,0x4	// bgmSlot*0x10
	add	r6,r4,r6
	add	r6,0x2C		// slot

	// Check current BGM exists
	mov	r0,(0x1F4 >> 0x2)
	lsl	r0,r0,0x2
	ldrh	r1,[r4,r0]	// current BGM
	ldr	r2,=0xFFFF
	cmp	r1,r2
	beq	@@end

	// Check BGM playing in slot
	ldrb	r1,[r6,0x1]
	cmp	r1,0x1
	bne	@@end

	// Clear current BGM
	str	r2,[r4,r0]

	// Pause BGM
	ldrb	r0,[r6]		// bgmIdx
	ldr	r1,[r5,0x8]	// fade length
	bl	bgm_enqueueCommandFadeOutAndPause

	// Set BGM slots playing this BGM to paused
	mov	r0,r4		// this
	ldrb	r1,[r6]		// bgmIdx
	mov	r2,0x2		// paused
	bl	bgm_setSlotsActive

@@end:
	pop	r3-r6,r15


.align 2
bgm_enqueueCommandFadeOutAndPause:
	push	r4,r14
	ldr	r4,=0x2103098

	// Store params
	str	r0,[r4,0x4]	// bgmIdx
	str	r1,[r4,0x8]	// fade length

	// Set rest of command
	mov	r0,0x18		// pause/unpause command
	str	r0,[r4]
	mov	r0,0x0
	str	r0,[r4,0xC]
	str	r0,[r4,0x10]
	str	r0,[r4,0x14]
	str	r0,[r4,0x18]

	// Enqueue command
	mov	r0,r4
	bl	0x2006110

	pop	r4,r15


.align 2
bgm_pauseAfterFadeOut:
	push	r14

	ldr	r0,[r6,0x10]	// fade resumable
	cmp	r0,0x0
	bne	@@pause

@@stop:
	mov	r0,r5
	bl	0x20031D8	// free sound slot
	mov	r0,r5
	bl	0x2006594	// stop sequence
	b	@@end

@@pause:
	mov	r0,r4
	bl	bgm_pauseBgm

@@end:
	// Flush sound commands
	bl	0x2006538

	pop	r15

.align 2
battle_unloadOverworldBgm:
	push	r0,r14

	// Unload SBNK + SWAR for overworld
	ldr	r0,[r0]
	mov	r1,0x0
	bl	bgm_unloadSbnkAndSwar

	// Disable overworld BGM instruments
	ldr	r1,=0x2103060
	ldr	r1,[r1,0x8]
	mov	r0,(0x13E0 >> 5)
	lsl	r0,r0,0x5
	add	r1,r1,r0
	mov	r0,0x0
	mov	r2,0x10
	push	r0-r2
	blx	0x2090878	// clear memory
	pop	r0-r2

	// Disable overworld BGM
	add	r1,(0x1414 - 0x13E0)
	blx	0x2090878

	mov	r1,r4
	add	r1,0xDA
	pop	r0,r15

.align 2
battle_unloadBattleBgm:
	push	r14

	// Unload SSEQ + SBNK + SWAR for battle
	ldr	r0,[r0]
	mov	r1,0x1
	bl	0x2025980

	bl	0x2153958
	cmp	r0,0x0
	pop	r15

.align 2
bgm_setActive:
	push	r14

	// Set BGM slot active
	mov	r0,r5
	ldrb	r1,[r4,0x2]
	mov	r2,0x1
	bl	bgm_setSlotsActive

	ldrh	r1,[r4,0x2]
	mov	r0,0x7D
	pop	r15

.align 2
bgm_setAllInactive:
	push	r14
	lsl	r0,r0,0x2
	strh	r1,[r5,r0]

	// Set all BGM slots inactive
	mov	r0,r5
	mov	r1,0x0
	mvn	r1,r1
	mov	r2,0x0
	bl	bgm_setSlotsActive

	pop	r15

.align 2
bgm_PauseOrUnpauseAllSpecificBgm:
	// r0 = bgm
	// r1 = fade length
	push	r4-r7,r14
	mov	r4,r0		// bgm
	mov	r5,r1		// fade length
	mov	r6,0x0		// i
	ldr	r0,=0x2103060
	ldr	r0,[r0,0x8]
	ldr	r1,=0x1490
	add	r7,r0,r1	// slot 0 address

@@loop:
	cmp	r4,0x0
	blt	@@checkPaused

	ldrh	r0,[r7]
	cmp	r0,r4
	bne	@@next

@@checkPaused:
	ldr	r0,[r7,0x3C]
	lsr	r0,r0,0x3	// test 0x4
	bcc	@@fadeout

@@fadein:
	// Unpause
	mov	r0,r7		// slot
	bl	bgm_unpauseBgm

	// Fade in
	mov	r0,r7		// slot
	mov	r1,r5		// fade length
	bl	bgm_fadeInSpecificSlot
	b	@@next

@@fadeout:
	mov	r0,r7
	mov	r1,r5
	mov	r2,0x1
	bl	bgm_fadeOutSpecificSlot
//	b	@@next

@@next:
	add	r6,0x1
	add	r7,0x44
	cmp	r6,0x10
	blt	@@loop

	pop	r4-r7,r15

.align 2
bgm_fadeOutAllSpecificBgm:
	// r0 = bgm
	// r1 = fade length
	push	r4-r7,r14
	mov	r4,r0		// bgm
	mov	r5,r1		// fade length
	mov	r6,0x0		// i
	ldr	r0,=0x2103060
	ldr	r0,[r0,0x8]
	ldr	r1,=0x1490
	add	r7,r0,r1	// slot 0 address

@@loop:
	cmp	r4,0x0
	blt	@@fadeout

	ldr	r0,[r7,0x4]	// type
	cmp	r0,0x0		// bgm
	bne	@@next

	ldrh	r0,[r7]		// bgm index
	cmp	r0,r4
	bne	@@next

@@fadeout:
	mov	r0,r7
	mov	r1,r5
	mov	r2,0x0
	bl	bgm_fadeOutSpecificSlot

@@next:
	add	r6,0x1
	add	r7,0x44
	cmp	r6,0x10
	blt	@@loop

	pop	r4-r7,r15

.align 2
bgm_fadeInAllSpecificBgm: // maybe not needed
	// r0 = bgm
	// r1 = fade length
	push	r4-r7,r14
	mov	r4,r0		// bgm
	mov	r5,r1		// fade length
	mov	r6,0x0		// i
	ldr	r0,=0x2103060
	ldr	r0,[r0,0x8]
	ldr	r1,=0x1490
	add	r7,r0,r1	// slot 0 address

@@loop:
	cmp	r4,0x0
	blt	@@fadein

	ldrh	r0,[r7]
	cmp	r0,r4
	bne	@@next

@@fadein:
	mov	r0,r7
	mov	r1,r5
	bl	bgm_fadeInSpecificSlot

@@next:
	add	r6,0x1
	add	r7,0x44
	cmp	r6,0x10
	blt	@@loop

	pop	r4-r7,r15

.align 2
bgm_fadeInSpecificSlot:
	// r0 = slot
	// r1 = fade length
	push	r4-r6,r14
	mov	r4,r0		// slot
	mov	r5,r1		// fade length

	// Disable fader
	ldr	r0,[r4,0x3C]	// control
	mov	r1,0x8		// fade flag
	bic	r0,r1
	str	r0,[r4,0x3C]	// control
	mov	r1,0x3		// finished
	str	r0,[r4,0x2C]	// fade state

	cmp	r5,0x0
	beq	@@instant

@@startFade:
	// Activate fader
	ldr	r0,[r4,0x3C]	// control
	add	r0,0x8		// fade flag
	str	r0,[r4,0x3C]	// control

	// Configure fader
	str	r5,[r4,0x18]	// fade length
	mov	r0,0x0
	strh	r0,[r4,0xE]	// volume
	str	r0,[r4,0x1C]	// fade volume
	mov	r0,0x31
	ldrb	r0,[r4,r0]	// original volume
	str	r0,[r4,0x24]	// fade target
	blx	0x20AE67C	// _ffltu
	mov	r6,r0		// (float) original volume
	mov	r0,r5		// fade length
	blx	0x20AE67C	// _ffltu
	mov	r1,r6
	blx	0x20AE178	// _frdiv
	str	r0,[r4,0x20]	// fade delta
	mov	r0,0x1
	str	r0,[r4,0x28]	// fade resumable
	mov	r0,0x0
	str	r0,[r4,0x2C]	// fade mode = fade in

	b	@@end

@@instant:
	// Calculate volume
	mov	r0,0x64
	mov	r0,0x31
	ldrb	r0,[r4,r0]	// original volume
	blx	0x20AE67C	// _ffltu
	mov	r6,r0		// (float) original volume
	ldr	r0,=0x2103060
	ldr	r0,[r0,0x8]
	ldr	r1,=0x18D0
	add	r0,r0,r1
	ldrb	r1,[r4,0x11]	// player ID
	lsl	r1,r1,0x3
	add	r0,r0,r1	// player info
	ldrh	r0,[r0,0x6]	// volume 0..127?
	blx	0x20AE67C	// _ffltu
	mov	r1,r6		// (float) original volume
	blx	0x20AE6C4	// _fmul
	ldr	r1,=0x42FE0000	// (float) 127
	blx	0x20AE184	// _fdiv
	mov	r1,(0x3F000000 >> 0x18)
	lsl	r1,r1,0x18	// (float) 0.5
	blx	0x20ADBAC	// _fadd
	blx	0x20AE5C0	// _ffiv

	// Set volume
	mov	r1,r0		// volume
	mov	r0,0x30
	ldrb	r0,[r4,r0]	// player number
	bl	0x20065B4	// set volume

@@end:
	pop	r4-r6,r15


.align 2
bgm_fadeOutSpecificSlot:
	// r0 = slot
	// r1 = fade length
	// r2 = pause
	push	r4-r7,r14
	mov	r4,r0		// slot
	mov	r5,r1		// fade length
	mov	r6,r2		// pause

	// Disable fader
	ldr	r0,[r4,0x3C]	// control
	mov	r1,0x8		// fade flag
	bic	r0,r1
	str	r0,[r4,0x3C]	// control
	mov	r1,0x3		// finished
	str	r0,[r4,0x2C]	// fade state

	cmp	r5,0x0
	beq	@@instant

@@startFade:
	// Activate fader
	ldr	r0,[r4,0x3C]	// control
	add	r0,0x8		// fade flag
	str	r0,[r4,0x3C]	// control

	// Configure fader
	str	r5,[r4,0x18]	// fade length
	ldrb	r7,[r4,0xE]	// volume
	mov	r0,r7
	blx	0x20AE67C	// _ffltu
	str	r0,[r4,0x1C]	// fade volume
	mov	r0,0x0
	str	r0,[r4,0x24]	// fade target
	sub	r0,r0,r7	// -volume
	blx	0x20AE634	// _fflt
	mov	r7,r0		// (float)-volume
	mov	r0,r5		// fade length
	blx	0x20AE67C	// _ffltu
	mov	r1,r7
	blx	0x20AE178	// _frdiv
	str	r0,[r4,0x20]	// fade delta
	str	r6,[r4,0x28]	// fade resumable
	mov	r0,0x1
	str	r0,[r4,0x2C]	// fade mode = fade out

	cmp	r6,0x0
	bne	@@end
	mov	r0,0x0
	strb	r0,[r4,0x10]	// poly pressure
	b	@@end

@@instant:
	mov	r0,0x30
	ldrb	r7,[r4,r0]	// player number

	cmp	r6,0x0
	bne	@@pause

@@stop:
	mov	r0,r7
	bl	0x20031D8	// free sound slot
	mov	r0,r7
	bl	0x2006594	// stop sequence
	b	@@end

@@pause:
	mov	r0,r4
	bl	bgm_pauseBgm

@@end:
	// Flush sound commands
	bl	0x2006538

	pop	r4-r7,r15

.align 2
bgm_pauseBgm:
	// r0 = slot
	push	r14

	ldr	r1,[r0,0x3C]	// control
	mov	r2,0x4		// paused flag
	orr	r1,r2
	str	r1,[r0,0x3C]	// control
	mov	r1,0x1		// paused and TRUE
	str	r1,[r0,0x40]	// paused state

	add	r0,0x30
	ldrb	r0,[r0]		// player number
//	mov	r1,0x1
	bl	0x20065AC	// (un)pause sequence

	pop	r15

.align 2
bgm_unpauseBgm:
	// r0 = slot
	push	r14

	ldr	r1,[r0,0x3C]	// control
	mov	r2,0x4		// paused flag
	bic	r1,r2
	str	r1,[r0,0x3C]	// control
	mov	r1,0x0		// not paused and FALSE
	str	r1,[r0,0x40]	// paused state

	add	r0,0x30
	ldrb	r0,[r0]		// player number
//	mov	r1,0x0
	bl	0x20065AC	// (un)pause sequence

	pop	r15

.align 2
bgm_setSlotsActive:
	// r0 = this
	// r1 = bgmIdx
	// r2 = active
	push	r4,r14
	add	r0,0x2C		// r0 = this+0x2C
	mov	r4,0x0		// r4 = i
@@loop:
	cmp	r1,0x0
	blt	@@setActive
	ldrb	r3,[r0]		// BGM index of slot
	cmp	r3,r1
	bne	@@next
@@setActive:
	strb	r2,[r0,0x1]	// set active
@@next:
	add	r4,0x1
	add	r0,0x10
	cmp	r4,0x2
	blt	@@loop
@@end:
	pop	r4,r15

.align 2
bgm_unloadSbnkAndSwar:
	// r0 = this
	// r1 = bgmSlot
	push	r4,r7,r14
	lsl	r1,r1,0x4	// BGM slot * 0x10
	add	r4,r0,r1

	// Get SSEQ INFO record
	ldr	r0,=0x2103060
	ldr	r0,[r0,0x8]
	ldr	r2,=0x1464
	ldr	r0,[r0,r2]	// SDAT
	mov	r2,0x8C
	ldr	r2,[r0,r2]	// SDAT INFO section
	ldr	r2,[r2,0x8]	// SDAT INFO SSEQ section offset
	mov	r1,0x2C
	ldrb	r1,[r4,r1]	// BGM index
	bl	0x2000E80	// get record
	cmp	r0,0x0
	beq	@@free

	// Unload SBNK and SWARs
	ldrh	r0,[r0,0x4]	// SBNK index
	mov	r1,0x4		// unload SWARs too
	bl	0x2002930	// unload SBNK+SWARs

@@free:
	ldr	r7,=0x211CCFC
	ldr	r0,[r7]
	mov	r1,0x3
	ldr	r2,[r4,0x38]	// SWAR
	bl	0x2015620	// heap free
	ldr	r0,[r7]
	mov	r1,0x3
	ldr	r2,[r4,0x34]	// SBNK
	bl	0x2015620

	// Clear pointers
	mov	r0,0x0
	str	r0,[r4,0x34]
	str	r0,[r4,0x38]

@@end:
	pop	r4,r7,r15

	.pool