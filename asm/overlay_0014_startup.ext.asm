.align 2
startup_canAccess:
	push	r14

	// Skip access check for slot 2
	ldr	r1,=common_currentSaveFile
	ldr	r1,[r1]
	cmp	r1,0x0
	bne	@@returnTrue

	bl	0x200AEE8	// check can access save
	b	@@end

@@returnTrue:
	mov	r0,0x1
@@end:
	pop	r15


.align 2
startup_verifyNotCorrupt:
	bl	0x200ADB0	// verify save not corrupt

	ldr	r1,=common_currentSaveFile
	ldr	r2,[r1]
	cmp	r2,0x0
	bne	@@secondSlot

@@firstSlot:
	// Change to slot 2
	mov	r2,0x1
	str	r2,[r1]

	// Set save count to 0
	add	r1,=startup_saveCount
	mov	r2,0x0
	str	r2,[r1]

	// If corrupt, don't store save count
	mov	r3,0x1		// for buffer
	cmp	r0,0x0
	beq	@@corrupt

	// Store save count for slot 1
	ldr	r2,=0x210CCF0
	ldr	r2,[r2]
	ldr	r3,=(0x25EC+0x10)
	ldr	r2,[r2,r3]
	str	r2,[r1]

	// Also check other slot
	pop	r4,r15

@@secondSlot:
	// Change to slot 1
	mov	r2,0x0
	str	r2,[r1]

	// Check corrupt
	mov	r3,0x2		// for buffer
	cmp	r0,0x0
	beq	@@corrupt

	// Compare save counts
	add	r0,=startup_saveCount
	ldr	r0,[r0]

	// Get save count for slot 2
	ldr	r2,=0x210CCF0
	ldr	r2,[r2]
	ldr	r3,=(0x25EC+0x10)
	ldr	r2,[r2,r3]

	cmp	r2,r0
	ble	@@endCheck

	// Slot 2 save count higher, switch to slot 2
	mov	r0,0x1
	str	r0,[r1]

@@endCheck:
	// End save check
	bl	0x214F8E4

@@corrupt:
	// Set to buffer 0
	mov	r0,0x0
	mov	r1,r3
	bl	0x2008DF0	// set to buffer

	// Start save corrupt script
	bl	0x214F8C6


.align 2
startup_postText:
	push	r14		// uses r4
	bl	0x214FA30

	ldr	r0,=common_currentSaveFile
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@secondSlot	// inverted

@@firstSlot:
	// Free text stuff
	mov	r0,r4
	bl	0x214F9C4

	// Back to initial state
	mov	r0,r4
	bl	0x214F928

	b	@@end

@@secondSlot:
@@end:
	pop	r15


	.pool

.align 4
startup_saveCount:
	.dw	0x0
