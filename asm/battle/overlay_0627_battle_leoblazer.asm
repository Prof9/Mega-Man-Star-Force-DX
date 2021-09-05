// Overlay 627 - Leo Blazer

.nds
.open TEMP+"/overlay_0627.bin",readu32(TEMP+"/y9.bin", 627 * 0x20 + 0x4)
.thumb


.org 0x21C16AE
	bl	@dxModelLeoBlazer


.orga readu32(TEMP+"/y9.bin", 627 * 0x20 + 0x8)
.area 0xEE0-orga()
@free:


.align 2
@dxModelLeoBlazer:
	push	r14
	mov	r3,0xB0
	ldr	r3,[r4,r3]
	cmp	r3,0x0
	beq	@@end
	bl	battle_isDXBoss_r3obj
	beq	@@end
	ldr	r1,=((1 << 0x10) | (512))
@@end:
	bl	0x21745FC
	pop	r15

	.pool


.aligna 32
.endarea
.close
