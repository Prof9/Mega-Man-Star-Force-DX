// Overlay 625 - Pegasus Freeze

.nds
.open TEMP+"/overlay_0625.bin",readu32(TEMP+"/y9.bin", 625 * 0x20 + 0x4)
.thumb


.org 0x21C16B4
	bl	@dxTexturePegasusFreeze


.orga readu32(TEMP+"/y9.bin", 625 * 0x20 + 0x8)
.area 0xEE0-orga()
@free:


.align 2
@dxTexturePegasusFreeze:
	push	r4,r14
	add	r4,0xB0
	ldr	r4,[r4]
	cmp	r4,0x0
	beq	@@end
	bl	battle_isDXBoss_r4obj
	beq	@@end
	ldr	r4,[sp]
	mov	r2,0xB0
	str	r4,[r5,r2]
	ldr	r2,=((1 << 0x10) | (509))
@@end:
	bl	0x2010EB8
	pop	r4,r15

	.pool


.aligna 32
.endarea
.close
