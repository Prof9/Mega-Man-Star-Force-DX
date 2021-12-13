.nds
.erroronwarning on

.open ROM_OUT,0x0

.if PASS == 1
// Match from original ROM
.org 0x60	::	.dw	readu32(ROM_IN, .)
.org 0x64	::	.dw	readu32(ROM_IN, .)
.org 0x6C	::	.dh	readu16(ROM_IN, .)
.endif

.if PASS == 2
.org 0x160	::	.import	ROM_IN, 0x160, (0x4000-0x160)
.endif

.close
