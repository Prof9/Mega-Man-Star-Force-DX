.nds

.open TEMP+"/arm9.bin",0x02000000
.org 0x02000B64 + 0x14
	.dw filesize(TEMP+"/arm9.bin") + 0x02000000
.close

.open TEMP+"/y9.bin",0
.org 0 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0000.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0000.bin") | (1 << 24)
.org 2 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0002.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0002.bin") | (1 << 24)
.org 3 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0003.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0003.bin") | (1 << 24)
.org 7 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0007.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0007.bin") | (1 << 24)
.org 10 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0010.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0010.bin") | (1 << 24)
.org 12 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0012.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0012.bin") | (1 << 24)
.org 13 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0013.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0013.bin") | (1 << 24)
.org 14 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0014.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0014.bin") | (1 << 24)
.org 15 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0015.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0015.bin") | (1 << 24)
.org 16 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0016.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0016.bin") | (1 << 24)
.org 17 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0017.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0017.bin") | (1 << 24)
.org 18 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0018.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0018.bin") | (1 << 24)
.org 19 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0019.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0019.bin") | (1 << 24)
.org 20 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0020.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0020.bin") | (1 << 24)
.org 21 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0021.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0021.bin") | (1 << 24)
.org 24 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0024.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0024.bin") | (1 << 24)
.org 25 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0025.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0025.bin") | (1 << 24)
.org 27 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0027.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0027.bin") | (1 << 24)
.org 28 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0028.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0028.bin") | (1 << 24)
.org 29 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0029.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0029.bin") | (1 << 24)
.org 36 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0036.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0036.bin") | (1 << 24)
.org 82 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0082.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0082.bin") | (1 << 24)
.org 107 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0107.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0107.bin") | (1 << 24)
.org 116 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0116.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0116.bin") | (1 << 24)
.org 133 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0133.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0133.bin") | (1 << 24)
.org 134 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0134.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0134.bin") | (1 << 24)
.org 139 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0139.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0139.bin") | (1 << 24)
.org 145 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0145.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0145.bin") | (1 << 24)
.org 146 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0146.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0146.bin") | (1 << 24)
.org 147 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0147.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0147.bin") | (1 << 24)
.org 150 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0150.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0150.bin") | (1 << 24)
.org 157 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0157.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0157.bin") | (1 << 24)
.org 159 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0159.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0159.bin") | (1 << 24)
.org 161 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0161.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0161.bin") | (1 << 24)
.org 162 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0162.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0162.bin") | (1 << 24)
.org 167 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0167.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0167.bin") | (1 << 24)
.org 172 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0172.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0172.bin") | (1 << 24)
.org 177 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0177.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0177.bin") | (1 << 24)
.org 178 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0178.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0178.bin") | (1 << 24)
.org 179 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0179.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0179.bin") | (1 << 24)
.org 180 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0180.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0180.bin") | (1 << 24)
.org 181 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0181.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0181.bin") | (1 << 24)
.org 182 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0182.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0182.bin") | (1 << 24)
.org 183 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0183.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0183.bin") | (1 << 24)
.org 184 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0184.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0184.bin") | (1 << 24)
.org 185 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0185.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0185.bin") | (1 << 24)
.org 186 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0186.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0186.bin") | (1 << 24)
.org 187 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0187.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0187.bin") | (1 << 24)
.org 188 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0188.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0188.bin") | (1 << 24)
.org 189 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0189.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0189.bin") | (1 << 24)
.org 190 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0190.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0190.bin") | (1 << 24)
.org 191 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0191.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0191.bin") | (1 << 24)
.org 193 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0193.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0193.bin") | (1 << 24)
.org 197 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0197.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0197.bin") | (1 << 24)
.org 198 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0198.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0198.bin") | (1 << 24)
.org 200 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0200.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0200.bin") | (1 << 24)
.org 201 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0201.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0201.bin") | (1 << 24)
.org 202 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0202.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0202.bin") | (1 << 24)
.org 203 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0203.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0203.bin") | (1 << 24)
.org 204 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0204.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0204.bin") | (1 << 24)
.org 205 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0205.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0205.bin") | (1 << 24)
.org 207 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0207.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0207.bin") | (1 << 24)
.org 208 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0208.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0208.bin") | (1 << 24)
.org 210 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0210.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0210.bin") | (1 << 24)
.org 211 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0211.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0211.bin") | (1 << 24)
.org 213 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0213.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0213.bin") | (1 << 24)
.org 219 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0219.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0219.bin") | (1 << 24)
.org 220 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0220.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0220.bin") | (1 << 24)
.org 221 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0221.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0221.bin") | (1 << 24)
.org 235 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0235.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0235.bin") | (1 << 24)
.org 238 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0238.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0238.bin") | (1 << 24)
.org 260 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0260.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0260.bin") | (1 << 24)
.org 269 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0269.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0269.bin") | (1 << 24)
.org 277 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0277.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0277.bin") | (1 << 24)
.org 286 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0286.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0286.bin") | (1 << 24)
.org 287 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0287.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0287.bin") | (1 << 24)
.org 293 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0293.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0293.bin") | (1 << 24)
.org 298 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0298.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0298.bin") | (1 << 24)
.org 320 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0320.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0320.bin") | (1 << 24)
.org 322 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0322.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0322.bin") | (1 << 24)
.org 333 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0333.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0333.bin") | (1 << 24)
.org 376 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0376.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0376.bin") | (1 << 24)
.org 391 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0391.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0391.bin") | (1 << 24)
.org 426 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0426.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0426.bin") | (1 << 24)
.org 445 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0445.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0445.bin") | (1 << 24)
.org 449 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0449.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0449.bin") | (1 << 24)
.org 453 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0453.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0453.bin") | (1 << 24)
.org 463 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0463.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0463.bin") | (1 << 24)
.org 464 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0464.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0464.bin") | (1 << 24)
.org 465 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0465.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0465.bin") | (1 << 24)
.org 466 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0466.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0466.bin") | (1 << 24)
.org 467 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0467.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0467.bin") | (1 << 24)
.org 468 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0468.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0468.bin") | (1 << 24)
.org 469 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0469.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0469.bin") | (1 << 24)
.org 470 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0470.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0470.bin") | (1 << 24)
.org 471 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0471.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0471.bin") | (1 << 24)
.org 479 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0479.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0479.bin") | (1 << 24)
.org 480 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0480.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0480.bin") | (1 << 24)
.org 511 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0511.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0511.bin") | (1 << 24)
.org 512 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0512.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0512.bin") | (1 << 24)
.org 517 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0517.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0517.bin") | (1 << 24)
.org 518 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0518.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0518.bin") | (1 << 24)
.org 519 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0519.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0519.bin") | (1 << 24)
.org 520 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0520.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0520.bin") | (1 << 24)
.org 521 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0521.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0521.bin") | (1 << 24)
.org 522 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0522.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0522.bin") | (1 << 24)
.org 523 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0523.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0523.bin") | (1 << 24)
.org 524 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0524.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0524.bin") | (1 << 24)
.org 525 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0525.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0525.bin") | (1 << 24)
.org 526 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0526.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0526.bin") | (1 << 24)
.org 527 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0527.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0527.bin") | (1 << 24)
.org 528 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0528.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0528.bin") | (1 << 24)
.org 530 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0530.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0530.bin") | (1 << 24)
.org 535 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0535.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0535.bin") | (1 << 24)
.org 536 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0536.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0536.bin") | (1 << 24)
.org 537 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0537.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0537.bin") | (1 << 24)
.org 538 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0538.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0538.bin") | (1 << 24)
.org 539 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0539.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0539.bin") | (1 << 24)
.org 540 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0540.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0540.bin") | (1 << 24)
.org 541 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0541.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0541.bin") | (1 << 24)
.org 542 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0542.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0542.bin") | (1 << 24)
.org 543 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0543.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0543.bin") | (1 << 24)
.org 544 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0544.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0544.bin") | (1 << 24)
.org 551 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0551.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0551.bin") | (1 << 24)
.org 556 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0556.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0556.bin") | (1 << 24)
.org 559 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0559.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0559.bin") | (1 << 24)
.org 566 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0566.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0566.bin") | (1 << 24)
.org 573 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0573.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0573.bin") | (1 << 24)
.org 577 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0577.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0577.bin") | (1 << 24)
.org 578 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0578.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0578.bin") | (1 << 24)
.org 579 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0579.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0579.bin") | (1 << 24)
.org 580 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0580.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0580.bin") | (1 << 24)
.org 581 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0581.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0581.bin") | (1 << 24)
.org 582 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0582.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0582.bin") | (1 << 24)
.org 599 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0599.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0599.bin") | (1 << 24)
.org 600 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0600.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0600.bin") | (1 << 24)
.org 601 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0601.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0601.bin") | (1 << 24)
.org 602 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0602.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0602.bin") | (1 << 24)
.org 603 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0603.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0603.bin") | (1 << 24)
.org 604 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0604.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0604.bin") | (1 << 24)
.org 605 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0605.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0605.bin") | (1 << 24)
.org 606 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0606.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0606.bin") | (1 << 24)
.org 607 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0607.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0607.bin") | (1 << 24)
.org 608 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0608.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0608.bin") | (1 << 24)
.org 609 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0609.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0609.bin") | (1 << 24)
.org 610 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0610.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0610.bin") | (1 << 24)
.org 611 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0611.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0611.bin") | (1 << 24)
.org 624 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0624.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0624.bin") | (1 << 24)
.org 625 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0625.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0625.bin") | (1 << 24)
.org 627 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0627.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0627.bin") | (1 << 24)
.org 646 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0646.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0646.bin") | (1 << 24)
.org 647 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0647.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0647.bin") | (1 << 24)
.org 648 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0648.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0648.bin") | (1 << 24)
.org 649 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0649.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0649.bin") | (1 << 24)
.org 650 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0650.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0650.bin") | (1 << 24)
.org 651 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0651.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0651.bin") | (1 << 24)
.org 652 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0652.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0652.bin") | (1 << 24)
.org 653 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0653.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0653.bin") | (1 << 24)
.org 654 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0654.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0654.bin") | (1 << 24)
.org 655 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0655.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0655.bin") | (1 << 24)
.org 656 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0656.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0656.bin") | (1 << 24)
.org 657 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0657.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0657.bin") | (1 << 24)
.org 658 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0658.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0658.bin") | (1 << 24)
.org 659 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0659.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0659.bin") | (1 << 24)
.org 660 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0660.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0660.bin") | (1 << 24)
.org 661 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0661.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0661.bin") | (1 << 24)
.org 662 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0662.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0662.bin") | (1 << 24)
.org 663 * 0x20
	.skip	8
	.dw	filesize(TEMP+"/overlay_0663.bin")
	.skip	16
	.dw	filesize(TEMP+"/overlay/overlay_0663.bin") | (1 << 24)
.close

.open TEMP+"/field/field_094.bin",0
	.dw	filesize(TEMP+"/field_094_tiles0.dec"),@@tiles0,0x0
	.dw	filesize(TEMP+"/field_094_tiles1.dec"),@@tiles1,0x10000
	.dw	0,0,0
@@tiles0:
	.import TEMP+"/field_094_tiles0.bin"	:: .align 4
@@tiles1:
	.import TEMP+"/field_094_tiles1.bin"	:: .align 4
.close

.open TEMP+"/field/field_095.bin",0
	.db	128,80	:: .align 4
	.dw	128*80*2,@@layer0
	.dw	128*80*2,@@layer1
	.dw	0,0,0
@@layer0:
	.import TEMP+"/field_095_layer0.dec"	:: .align 4
@@layer1:
	.import TEMP+"/field_095_layer1.bin"	:: .align 4
.close

.open TEMP+"/field/field_096.bin",0
	.import TEMP+"/field/field_096.bin"
	.import TEMP+"/field_096_blocks.dec"
.close

.open TEMP+"/field/field_098.bin",0
	.dw	filesize(TEMP+"/field_098_tiles0.dec"),@@tiles0,0x0
	.dw	filesize(TEMP+"/field_098_tiles1.dec"),@@tiles1,0x10000
	.dw	0,0,0
@@tiles0:
	.import TEMP+"/field_098_tiles0.bin"	:: .align 4
@@tiles1:
	.import TEMP+"/field_098_tiles1.bin"	:: .align 4
.close

.open TEMP+"/field/field_099.bin",0
	.db	120,96	:: .align 4
	.dw	120*96*2,@@layer0
	.dw	120*96*2,@@layer1
	.dw	0,0,0
@@layer0:
	.import TEMP+"/field_099_layer0.dec"	:: .align 4
@@layer1:
	.import TEMP+"/field_099_layer1.bin"	:: .align 4
.close

.open TEMP+"/field/field_100.bin",0
	.import TEMP+"/field/field_100.bin"
	.import TEMP+"/field_100_blocks.dec"
.close

.open TEMP+"/field/field_223.bin",0
	.import TEMP+"/field/field_223.bin"
	.import TEMP+"/field_223_blocks.dec"
.close

.open TEMP+"/field/field_265.bin",0
	.import TEMP+"/field/field_265.bin"
	.import TEMP+"/field_265_blocks.dec"
.close