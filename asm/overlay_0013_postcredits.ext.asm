.align 2
postcredits_drawCard:
	push	r14

	// Show Battle Card sprite
	bl	common_drawBattleCard

	bl	0x2008D9C
	pop	r15


.align 2
postcredits_preLoadSave:
	mov	r0,0x0
	str	r0,[r5,0x8]
	push	r7,r14
	add	r7,=postcredits_vars

	// Store play time
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldr	r0,[r0,0x14]	// play time
	str	r0,[r7]		// play time

	// Store Andromeda counter flag
//	ldr	r0,=0x2120070
//	ldr	r0,[r0]
	ldr	r1,=0xF0FD	// Andromeda counter hit flag
	bl	0x202409C	// check flag
	str	r0,[r7,0x4]

	// Store Andromeda DX flag
	ldr	r1,=0xF185	// Andromeda DX flag
	bl	0x202409C	// check flag
	str	r0,[r7,0x8]

	// Store Legend Mode turned off flag
	ldr	r1,=0xF03E	// Legend Mode turned off
	bl	0x202409C	// check flag
	str	r0,[r7,0xC]

	pop	r7,r15


.align 2
postcredits_postLoadSave:
	push	r1,r14	// uses r0,r4-r5

	// Restore play time
	add	r1,=postcredits_vars
	ldr	r1,[r1]
	str	r1,[r0,0x14]
	str	r1,[r5,0x8]

	// Restore Andromeda defeated flag
	ldr	r1,=0xF173	// Andromeda deleted flag
	bl	0x2024018	// set flag

	// Restore Andromeda counter flag
	add	r0,=postcredits_vars+0x4
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@andromedaDX

	ldr	r1,=0xF0FD	// Andromeda counter hit flag
	bl	0x2024018	// set flag

@@andromedaDX:
	// Restore Andromeda DX flag
	add	r0,=postcredits_vars+0x8
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@sendDXCompleteMail

	ldr	r1,=0xF195	// Did post credits DX unlocks
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@sendDXCompleteMail

	// Set all DX boss defeated flags
	ldr	r1,=0xF17F
	mov	r2,(14)
	bl	0x202403C	// set flag range

	ldr	r1,=0xF192	// Beat all DX bosses
	bl	0x2024018	// set flag

	ldr	r1,=0xF194	// Receive neutral Satellite for Power Up data
	bl	0x2024018	// set flag

	ldr	r1,=0xF195	// Did post credits DX unlocks
	bl	0x2024018	// set flag

@@sendDXCompleteMail:
	// Check beat all DX bosses
	ldr	r1,=0xF192
	bl	0x202409C	// check flag
	cmp	r0,0x0
	beq	@@giveAndromedaCard

	// Check got the mail already
	ldr	r1,=0x1622
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@giveAndromedaCard

	// Receive mail 34
	ldr	r0,=0x211CD4C
	ldr	r0,[r0]
	ldr	r1,=0x1622
	bl	0x2015A08

	// Set mail received flag
	ldr	r1,=0xD27
	bl	0x2024018

@@giveAndromedaCard:
	// Give Andromeda card if player has all title screen stars
	cmp	r4,0x0
	beq	@@legendModeOff

	// Check beat Andromeda Infinity flag
	ldr	r1,=0xF10F	// beat Andromeda Infinity
	bl	0x202409C	// check flag
	cmp	r0,0x0
	bne	@@legendModeOff	// already set

	// Set beat Andromeda Infinity flag
	ldr	r1,=0xF10F	// beat Andromeda Infinity
	bl	0x2024018	// set flag

	// Activate Andromeda card receive
	ldr	r1,=0xF163
	bl	0x2024018	// set flag

	// Give Andromeda card
//	mov	r0,0xF7		// Andromeda
//	mov	r1,0x3		// red
//	mov	r2,0x1		// x1
//	bl	0x2006E9C	// give card

@@legendModeOff:
	// Restore Legend Mode turned off flag
	add	r0,=postcredits_vars+0xC
	ldr	r0,[r0]
	cmp	r0,0x0
	beq	@@end

	ldr	r1,=0xF03E	// Legend Mode turned off at some point
	bl	0x2024018	// set flag

@@end:
	pop	r1,r15


	.pool


.align 4
postcredits_vars:
	.dw	0x0	// +0x0 = play time
	.dw	0x0	// +0x4 = counter hit Andromeda
	.dw	0x0	// +0x8 = defeated Andromeda DX
	.dw	0x0	// +0xC = Legend Mode turned off at some point
