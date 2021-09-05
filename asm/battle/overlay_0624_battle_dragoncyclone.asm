// Overlay 624 - Dragon Cyclone

.nds
.open TEMP+"/overlay_0624.bin",readu32(TEMP+"/y9.bin", 624 * 0x20 + 0x4)
.thumb


.org 0x21C171E
	bl	@dxTextureDragonCyclone


.orga readu32(TEMP+"/y9.bin", 624 * 0x20 + 0x8)
.area 0xEE0-orga()
@free:


.align 2
@dxTextureDragonCyclone:
	push	r4,r14
	mov	r4,0xB0
	ldr	r4,[r5,r4]
	cmp	r4,0x0
	beq	@@end
	add	r4,0xB0
	ldr	r4,[r4]
	bl	battle_isDXBoss_r4obj
	beq	@@end
	ldr	r2,=((1 << 0x10) | (510))
@@end:
	bl	0x2010EB8
	pop	r4,r15

	.pool


.aligna 32
.endarea
.close
