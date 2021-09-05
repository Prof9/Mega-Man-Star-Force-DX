// field_096 - Nacys 1F blocks
.nds
.thumb
.create TEMP+"/field/field_096.bin",0
	.dw	@blocks_0
	.dw	@blocks_1
	.dw	@blocks_2
	.dw	@blocks_3
.close

.nds
.thumb
.create TEMP+"/field_096_blocks.dec",0

@blocks_0:
	.import	TEMP+"/field_096_blocks.bak.dec", \
		readu32(TEMP+"/field/field_096.bin", 0*4), \
		readu32(TEMP+"/field/field_096.bin", 1*4) - \
		readu32(TEMP+"/field/field_096.bin", 0*4)
@blocks_1:
	.import	TEMP+"/field_096_blocks.bak.dec", \
		readu32(TEMP+"/field/field_096.bin", 1*4), \
		readu32(TEMP+"/field/field_096.bin", 2*4) - \
		readu32(TEMP+"/field/field_096.bin", 1*4)
@blocks_2:
	.import	TEMP+"/field_096_blocks.bak.dec", \
		readu32(TEMP+"/field/field_096.bin", 2*4), \
		readu32(TEMP+"/field/field_096.bin", 3*4) - \
		readu32(TEMP+"/field/field_096.bin", 2*4)
@blocks_3:
	.dw	(@b3_tbl_end - @b3_tbl) / 4 - 1

@b3_tbl:
	.blk	- 25,	- 22	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	- 22	::	.dh	@b3_00  - @b3_tbl
	.blk	- 23,	- 22	::	.dh	@b3_01  - @b3_tbl
	.blk	- 21,	- 22	::	.dh	@b3_01  - @b3_tbl
	.blk	- 20,	- 22	::	.dh	@b3_02  - @b3_tbl
	.blk	- 19,	- 22	::	.dh	@b3_02  - @b3_tbl
	.blk	- 26,	- 21	::	.dh	@b3_03  - @b3_tbl
	.blk	- 23,	- 21	::	.dh	@b3_01  - @b3_tbl
	.blk	- 21,	- 21	::	.dh	@b3_01  - @b3_tbl
	.blk	- 17,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 16,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 15,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 14,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 13,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 12,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	- 11,	- 21	::	.dh	@b3_04  - @b3_tbl
	.blk	-  8,	- 21	::	.dh	@b3_05  - @b3_tbl
	.blk	- 26,	- 20	::	.dh	@b3_03  - @b3_tbl
	.blk	- 23,	- 20	::	.dh	@b3_01  - @b3_tbl
	.blk	- 22,	- 20	::	.dh	@b3_01  - @b3_tbl
	.blk	- 21,	- 20	::	.dh	@b3_01  - @b3_tbl
	.blk	-  8,	- 20	::	.dh	@b3_06  - @b3_tbl
	.blk	-  7,	- 20	::	.dh	@b3_05  - @b3_tbl
	.blk	-  6,	- 19	::	.dh	@b3_07  - @b3_tbl	// Aaron poster
	.blk	-  6,	- 18	::	.dh	@b3_07  - @b3_tbl	// Aaron poster
	.blk	-  6,	- 17	::	.dh	@b3_07  - @b3_tbl	// Aaron poster
	.blk	- 32,	- 16	::	.dh	@b3_08  - @b3_tbl
	.blk	- 31,	- 16	::	.dh	@b3_08  - @b3_tbl
	.blk	- 30,	- 16	::	.dh	@b3_08  - @b3_tbl
	.blk	-  6,	- 13	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	- 13	::	.dh	@b3_09  - @b3_tbl
	.blk	-  6,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	-  5,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	-  4,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	-  3,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	-  2,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	   0,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	   4,	- 12	::	.dh	@b3_10  - @b3_tbl
	.blk	   5,	- 12	::	.dh	@b3_10  - @b3_tbl
	.blk	   6,	- 12	::	.dh	@b3_11  - @b3_tbl
	.blk	   8,	- 12	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	- 11	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	- 10	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	-  9	::	.dh	@b3_09  - @b3_tbl
	.blk	- 29,	-  8	::	.dh	@b3_12  - @b3_tbl
	.blk	- 28,	-  8	::	.dh	@b3_12  - @b3_tbl
	.blk	   8,	-  8	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  7	::	.dh	@b3_12  - @b3_tbl
	.blk	   8,	-  7	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  6	::	.dh	@b3_12  - @b3_tbl
	.blk	   8,	-  6	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  5	::	.dh	@b3_12  - @b3_tbl
	.blk	   8,	-  5	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  4	::	.dh	@b3_12  - @b3_tbl
	.blk	   8,	-  4	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  3	::	.dh	@b3_12  - @b3_tbl
	.blk	-  6,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	-  5,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	-  4,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	-  3,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	-  2,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	-  3	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  2	::	.dh	@b3_12  - @b3_tbl
	.blk	-  6,	-  2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	-  2	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	-  2	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	-  1	::	.dh	@b3_12  - @b3_tbl
	.blk	-  6,	-  1	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	-  1	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	-  1	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	   0	::	.dh	@b3_12  - @b3_tbl
	.blk	-  6,	   0	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	   0	::	.dh	@b3_09  - @b3_tbl
	.blk	   8,	   0	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	   1	::	.dh	@b3_12  - @b3_tbl
	.blk	-  6,	   1	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	   1	::	.dh	@b3_09  - @b3_tbl
	.blk	- 28,	   2	::	.dh	@b3_13  - @b3_tbl
	.blk	-  6,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  5,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  4,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  3,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  2,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	-  1,	   2	::	.dh	@b3_09  - @b3_tbl
	.blk	  11,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  13,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  14,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  15,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  16,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	  17,	   4	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	   5	::	.dh	@b3_15  - @b3_tbl
	.blk	- 28,	   6	::	.dh	@b3_15  - @b3_tbl
	.blk	- 28,	   7	::	.dh	@b3_15  - @b3_tbl
	.blk	  18,	   7	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	   8	::	.dh	@b3_15  - @b3_tbl
	.blk	  18,	   8	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	   9	::	.dh	@b3_15  - @b3_tbl
	.blk	  18,	   9	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	  10	::	.dh	@b3_15  - @b3_tbl
	.blk	  10,	  10	::	.dh	@b3_14  - @b3_tbl
	.blk	  11,	  10	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  10	::	.dh	@b3_14  - @b3_tbl
	.blk	  18,	  10	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	  11	::	.dh	@b3_15  - @b3_tbl
	.blk	  10,	  11	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  11	::	.dh	@b3_14  - @b3_tbl
	.blk	  18,	  11	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	  12	::	.dh	@b3_16  - @b3_tbl
	.blk	  10,	  12	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  12	::	.dh	@b3_14  - @b3_tbl
	.blk	  18,	  12	::	.dh	@b3_14  - @b3_tbl
	.blk	- 27,	  13	::	.dh	@b3_17  - @b3_tbl
	.blk	  10,	  13	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  13	::	.dh	@b3_14  - @b3_tbl
	.blk	  18,	  13	::	.dh	@b3_14  - @b3_tbl
	.blk	- 27,	  14	::	.dh	@b3_18  - @b3_tbl
	.blk	  10,	  14	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  14	::	.dh	@b3_14  - @b3_tbl
	.blk	- 27,	  15	::	.dh	@b3_18  - @b3_tbl
	.blk	  10,	  15	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  15	::	.dh	@b3_14  - @b3_tbl
	.blk	- 27,	  16	::	.dh	@b3_18  - @b3_tbl
	.blk	  10,	  16	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  16	::	.dh	@b3_14  - @b3_tbl
	.blk	- 28,	  17	::	.dh	@b3_18  - @b3_tbl
	.blk	- 27,	  17	::	.dh	@b3_19  - @b3_tbl
	.blk	  10,	  17	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  17	::	.dh	@b3_14  - @b3_tbl
	.blk	- 20,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 19,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 18,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 17,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 16,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 15,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 14,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 13,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 12,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 11,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	- 10,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	-  9,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	-  8,	  18	::	.dh	@b3_20  - @b3_tbl
	.blk	  10,	  18	::	.dh	@b3_14  - @b3_tbl
	.blk	  11,	  18	::	.dh	@b3_14  - @b3_tbl
	.blk	  12,	  18	::	.dh	@b3_14  - @b3_tbl
	.blk	-  6,	  20	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	  21	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	  22	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	  23	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	  24	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	  25	::	.dh	@b3_20  - @b3_tbl
	.blk	- 20,	  26	::	.dh	@b3_21  - @b3_tbl
	.blk	- 19,	  26	::	.dh	@b3_21  - @b3_tbl
	.blk	- 18,	  26	::	.dh	@b3_21  - @b3_tbl
	.blk	-  6,	  26	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  26	::	.dh	@b3_22  - @b3_tbl
	.blk	- 20,	  27	::	.dh	@b3_21  - @b3_tbl
	.blk	- 19,	  27	::	.dh	@b3_21  - @b3_tbl
	.blk	- 18,	  27	::	.dh	@b3_21  - @b3_tbl
	.blk	-  6,	  27	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  27	::	.dh	@b3_23  - @b3_tbl
	.blk	- 20,	  28	::	.dh	@b3_21  - @b3_tbl
	.blk	- 19,	  28	::	.dh	@b3_21  - @b3_tbl
	.blk	- 18,	  28	::	.dh	@b3_21  - @b3_tbl
	.blk	-  6,	  28	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  28	::	.dh	@b3_23  - @b3_tbl
	.blk	- 15,	  29	::	.dh	@b3_24  - @b3_tbl
	.blk	- 14,	  29	::	.dh	@b3_25  - @b3_tbl
	.blk	- 13,	  29	::	.dh	@b3_25  - @b3_tbl
	.blk	-  6,	  29	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  29	::	.dh	@b3_23  - @b3_tbl
	.blk	-  6,	  30	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  30	::	.dh	@b3_23  - @b3_tbl
	.blk	-  6,	  31	::	.dh	@b3_20  - @b3_tbl
	.blk	  18,	  31	::	.dh	@b3_23  - @b3_tbl
	.blk	-  6,	  32	::	.dh	@b3_20  - @b3_tbl
	.blk	  16,	  32	::	.dh	@b3_26  - @b3_tbl
	.blk	  17,	  32	::	.dh	@b3_05  - @b3_tbl
	.blk	  16,	  33	::	.dh	@b3_05  - @b3_tbl
	.blk	-  1,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   0,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   1,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   2,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   3,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   4,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	   5,	  34	::	.dh	@b3_27  - @b3_tbl
	.blk	-  1,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   0,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   1,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   2,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   3,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   4,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	   5,	  35	::	.dh	@b3_27  - @b3_tbl
	.blk	-  1,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   0,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   1,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   2,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   3,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   4,	  49	::	.dh	@b3_28  - @b3_tbl
	.blk	   5,	  49	::	.dh	@b3_28  - @b3_tbl
	.dh	0xFFFF		::	.dh	@b3_end - @b3_tbl
@b3_tbl_end:

// z-offset, ID, height, type
@b3_00:	.db	0x00,0xF6,0x08,0x11
@b3_01:	.db	0x00,0xFB,0x08,0x11
@b3_02:	.db	0x00,0xF7,0x08,0x11
@b3_03:	.db	0x00,0xF5,0x08,0x11
@b3_04:	.db	0x00,0x02,0x08,0x03
@b3_05:	.db	0x00,0xF8,0x08,0x11
@b3_06:	.db	0x00,0xF8,0x08,0x0B
@b3_07:	.db	0x00,0xF9,0x08,0x11	// Aaron poster
@b3_08:	.db	0x00,0xFF,0x08,0x11
@b3_09:	.db	0x00,0xFA,0x08,0x11
@b3_10:	.db	0x00,0xFC,0x08,0x11
@b3_11:	.db	0x00,0xFC,0x08,0x01
@b3_12:	.db	0x00,0xF4,0x08,0x11
@b3_13:	.db	0x00,0xF4,0x08,0x03
@b3_14:	.db	0x00,0xFD,0x08,0x11
@b3_15:	.db	0x00,0xF3,0x08,0x11
@b3_16:	.db	0x00,0xF3,0x08,0x03
@b3_17:	.db	0x00,0xF2,0x08,0x0A
@b3_18:	.db	0x00,0xF2,0x08,0x11
@b3_19:	.db	0x00,0xF2,0x08,0x0C
@b3_20:	.db	0x00,0xF1,0x08,0x11
@b3_21:	.db	0x00,0xB0,0x08,0x11
@b3_22:	.db	0x00,0xFE,0x08,0x04
@b3_23:	.db	0x00,0xFE,0x08,0x11
@b3_24:	.db	0x00,0xF0,0x08,0x02
@b3_25:	.db	0x00,0xF0,0x08,0x11
@b3_26:	.db	0x00,0xF8,0x08,0x09
@b3_27:	.db	0x00,0x10,0x08,0x11
@b3_28:	.db	0xE0,0x01,0x08,0x04
@b3_end:.db	0xFF,0xFF,0xFF,0xFF

.close