.org 0x20FB030
	// Increase sound heap size to keep additional SSEQ and SFX in memory
	// Largest SSEQ is BGM19KAKUSHI (Deep Space) at 0x3164
	.dw	0xD8000		// from 0xC4000
	// This is close to maxing out memory!
	//.dw	0xF3800		// from 0xC4000


.org 0x2002AEE	// Prevent BGM from being overwritten
	bl	bgm_preventBGMOverride


.org 0x200372A
	bl	bgm_saveOriginalVolume
.org 0x2003210
	bl	bgm_resetOriginalVolume

.org 0x200514A
.area 0xC,0x00
	bl	bgm_pauseAfterFadeOut
	b	0x2005156
.endarea

.org 0x20150BC
	bl	bgm_pauseOnBattleStart
.org 0x203ADD8
	bl	bgm_pauseOnBattleStart
.org 0x203AE96
	bl	bgm_pauseOnBattleStart

.org 0x2025514	// Add extra commands to BGM command handler
	bl	bgm_bgmCommandHandler

.org 0x20061D0	// Add extra commands to sound command handler
	bl	bgm_soundCommandHandler

.org 0x2025B32
	bl	bgm_bgmCmdStopSpecificBgm

.org 0x2025A9A
	bl	bgm_startOrResumeBgm
.org 0x2025AB8
	bl	bgm_setActive
.org 0x2025B2E
	bl	bgm_setAllInactive


.org 0x202586C
.area 0x114,0x00
bgm_loadBgm:
	// r0 = this
	// r1 = bgmIdx
	// r2 = bgmSlot
	push	r4-r7,r14
	mov	r4,r0		// this
	mov	r5,r1		// bgmIdx
	mov	r6,r2		// bgmSlot
	lsl	r2,r2,0x4	// bgmSlot*0x10
	add	r7,r4,r2	// this + bgmSlot*0x10
	add	r7,0x2C		// this+0x2C

	mov	r3,0x0		// no SSEQ loaded

	// Check if this BGM is already partially loaded
	ldrb	r0,[r7]		// prevBgmIdx
	cmp	r0,r5		// compare to new bgmIdx
	bne	@@unloadPrevBgm

	// Check if this BGM is already active
	ldrb	r0,[r7,0x1]	// active
	cmp	r0,0x1
	beq	@@end		// already loaded and active

	// Check if SSEQ already loaded
	ldr	r3,[r7,0x4]	// SSEQ

	// Check if SBNK already loaded
	ldr	r0,[r7,0x8]	// SBNK
	cmp	r0,0x0
	bne	@@end		// whole BGM already loaded

@@unloadPrevBgm:
	cmp	r3,0x0
	beq	@@fullUnload

@@partialUnload:
	// Unload SBNK + SWAR
	mov	r0,r4		// this
	mov	r1,r6		// bgmSlot
	bl	bgm_unloadSbnkAndSwar

	// Enable BGM instruments
	mov	r0,r5
	bl	0x20018F8

	b	@@loadSbnk

@@fullUnload:
	// Stop BGM slots playing previous BGM
	ldrb	r0,[r7]		// prevBgmIdx
	mov	r1,0x0
	bl	bgm_fadeOutAllSpecificBgm

	// Clear current BGM number
	ldr	r0,=0xFFFF
	mov	r1,(0x1F4 >> 0x2)
	lsl	r1,r1,0x2
	strh	r0,[r4,r1]	// this+0x1F4

	// Set current BGM slot to inactive
	mov	r0,r4		// this
	ldrb	r1,[r7]		// prevBgmIdx
	mov	r2,0x0		// inactive
	bl	bgm_setSlotsActive

	// Unload SSEQ + SBNK + SWAR
	mov	r0,r4		// this
	mov	r1,r6		// bgmSlot
	bl	0x2025980	// unload SSEQ + SBNK + SWAR

@@loadSseq:
	// Get SSEQ size
	mov	r0,r5		// bgmIdx
	bl	0x2005D38	// get SSEQ size
	cmp	r0,0x0
	blt	@@end

	// Allocate SSEQ
	mov	r2,r0
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x3
	sub	r3,r1,0x7	// -4
	bl	0x20155FC	// Heap_AllocEx
	cmp	r0,0x0
	beq	@@end		// failed to allocate

	// Set SSEQ pointer
	str	r0,[r7,0x4]	// SSEQ

	// Load SSEQ
	bl	0x2005E24	// load SSEQ
	cmp	r0,0x0
	blt	@@end		// failed to load

@@loadSbnk:
	// Get SBNK size
	bl	0x2005D70
	cmp	r0,0x0
	blt	@@end

	// Allocate SBNK
	mov	r2,r0
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x3
	sub	r3,r1,0x7	// -4
	bl	0x20155FC	// Heap_AllocEx
	cmp	r0,0x0
	beq	@@end		// failed to allocate

	// Set SBNK pointer
	str	r0,[r7,0x8]	// SBNK

	// Load SBNK
	bl	0x2005E40	// load SBNK
	cmp	r0,0x0
	blt	@@end		// failed to load

@@loadSwar:
	// Get SWAR size
	bl	0x2005D8C
	cmp	r0,0x0
	blt	@@end

	// Allocate SWAR
	mov	r2,r0
	ldr	r0,=0x211CCFC
	ldr	r0,[r0]
	mov	r1,0x3
	sub	r3,r1,0x7	// -4
	bl	0x20155FC	// Heap_AllocEx
	cmp	r0,0x0
	beq	@@end		// failed to allocate

	// Set SWAR pointer
	str	r0,[r7,0xC]	// SWAR

	// Load SWAR
	bl	0x2005E5C	// load SWAR
	cmp	r0,0x0
	blt	@@end

@@setBgm:
	// Set current bgmIdx
	strb	r5,[r7]

@@end:
	pop	r4-r7,r15

	.pool
.endarea
