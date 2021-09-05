// Overlay 10 - Transform

.nds
.open TEMP+"/overlay_0010.bin",readu32(TEMP+"/y9.bin", 10 * 0x20 + 0x4)
.thumb


// Speed up transform
//.org 0x214F7A8	// Geo moving up
//	mov	r0,0xB	// from 0xA
//.org 0x214FA5C	// Omega-Xis moving down
//	mov	r0,0x39
//	mov	r1,0x2
//	strb	r1,[r4,r0]
//	mov	r2,0x9	// from 0x8
.org 0x214FB4C	// Fade to white speed
	mov	r0,0x10
//.org 0x214FDCA	// Mega Man display length
//	cmp	r0,(40)	// from 60
.org 0x214FE0A	// White fade length
	cmp	r0,0	// from 20


.close
