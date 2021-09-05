// field_100 - Nacys Roof blocks
.nds
.thumb
.create TEMP+"/field/field_100.bin",0
	.dw	@blocks_0
	.dw	@blocks_1
	.dw	@blocks_2
	.dw	@blocks_3
.close

.nds
.thumb
.create TEMP+"/field_100_blocks.dec",0

@blocks_0:
	.import	TEMP+"/field_100_blocks.bak.dec", \
		readu32(TEMP+"/field/field_100.bin", 0*4), \
		readu32(TEMP+"/field/field_100.bin", 1*4) - \
		readu32(TEMP+"/field/field_100.bin", 0*4)
@blocks_1:
	.import	TEMP+"/field_100_blocks.bak.dec", \
		readu32(TEMP+"/field/field_100.bin", 1*4), \
		readu32(TEMP+"/field/field_100.bin", 2*4) - \
		readu32(TEMP+"/field/field_100.bin", 1*4)
@blocks_2:
	.import	TEMP+"/field_100_blocks.bak.dec", \
		readu32(TEMP+"/field/field_100.bin", 2*4), \
		readu32(TEMP+"/field/field_100.bin", 3*4) - \
		readu32(TEMP+"/field/field_100.bin", 2*4)
@blocks_3:
	.dw	(@b3_tbl_end - @b3_tbl) / 4 - 1

@b3_tbl:
	.blk	- 19,	- 31	::	.dh	@b3_00  - @b3_tbl	// Lucian poster
	.blk	  29,	- 31	::	.dh	@b3_01  - @b3_tbl
	.blk	- 19,	- 30	::	.dh	@b3_00  - @b3_tbl	// Lucian poster
	.blk	  29,	- 30	::	.dh	@b3_01  - @b3_tbl
	.blk	- 19,	- 29	::	.dh	@b3_00  - @b3_tbl	// Lucian poster
	.blk	  29,	- 29	::	.dh	@b3_01  - @b3_tbl
	.blk	- 19,	- 28	::	.dh	@b3_00  - @b3_tbl	// Lucian poster
	.blk	  29,	- 28	::	.dh	@b3_01  - @b3_tbl
	.blk	  12,	- 27	::	.dh	@b3_02  - @b3_tbl
	.blk	  13,	- 27	::	.dh	@b3_02  - @b3_tbl
	.blk	  14,	- 27	::	.dh	@b3_02  - @b3_tbl
	.blk	  15,	- 27	::	.dh	@b3_03  - @b3_tbl
	.blk	  29,	- 27	::	.dh	@b3_04  - @b3_tbl
	.blk	  15,	- 26	::	.dh	@b3_02  - @b3_tbl
	.blk	  29,	- 26	::	.dh	@b3_04  - @b3_tbl
	.blk	-  5,	- 25	::	.dh	@b3_05  - @b3_tbl
	.blk	-  4,	- 25	::	.dh	@b3_06  - @b3_tbl
	.blk	-  3,	- 25	::	.dh	@b3_06  - @b3_tbl
	.blk	   0,	- 25	::	.dh	@b3_07  - @b3_tbl
	.blk	   1,	- 25	::	.dh	@b3_07  - @b3_tbl
	.blk	   2,	- 25	::	.dh	@b3_07  - @b3_tbl
	.blk	   4,	- 25	::	.dh	@b3_08  - @b3_tbl
	.blk	   5,	- 25	::	.dh	@b3_08  - @b3_tbl
	.blk	   6,	- 25	::	.dh	@b3_08  - @b3_tbl
	.blk	   7,	- 25	::	.dh	@b3_08  - @b3_tbl
	.blk	  11,	- 25	::	.dh	@b3_02  - @b3_tbl
	.blk	  15,	- 25	::	.dh	@b3_02  - @b3_tbl
	.blk	- 19,	- 24	::	.dh	@b3_09  - @b3_tbl
	.blk	- 18,	- 24	::	.dh	@b3_09  - @b3_tbl
	.blk	- 16,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 15,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 14,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 13,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 12,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 11,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	- 10,	- 24	::	.dh	@b3_10  - @b3_tbl
	.blk	-  8,	- 24	::	.dh	@b3_11  - @b3_tbl
	.blk	-  7,	- 24	::	.dh	@b3_11  - @b3_tbl
	.blk	  11,	- 24	::	.dh	@b3_02  - @b3_tbl
	.blk	  15,	- 24	::	.dh	@b3_02  - @b3_tbl
	.blk	- 19,	- 23	::	.dh	@b3_09  - @b3_tbl
	.blk	- 18,	- 23	::	.dh	@b3_09  - @b3_tbl
	.blk	-  8,	- 23	::	.dh	@b3_11  - @b3_tbl
	.blk	-  7,	- 23	::	.dh	@b3_11  - @b3_tbl
	.blk	  11,	- 23	::	.dh	@b3_12  - @b3_tbl
	.blk	  12,	- 23	::	.dh	@b3_02  - @b3_tbl
	.blk	  13,	- 23	::	.dh	@b3_02  - @b3_tbl
	.blk	  14,	- 23	::	.dh	@b3_02  - @b3_tbl
	.blk	  15,	- 23	::	.dh	@b3_13  - @b3_tbl
	.blk	  29,	- 23	::	.dh	@b3_14  - @b3_tbl
	.blk	- 19,	- 22	::	.dh	@b3_09  - @b3_tbl
	.blk	- 18,	- 22	::	.dh	@b3_09  - @b3_tbl
	.blk	-  8,	- 22	::	.dh	@b3_11  - @b3_tbl
	.blk	-  7,	- 22	::	.dh	@b3_11  - @b3_tbl
	.blk	  29,	- 22	::	.dh	@b3_14  - @b3_tbl
	.blk	- 19,	- 21	::	.dh	@b3_09  - @b3_tbl
	.blk	- 18,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 17,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 16,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 15,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 14,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 13,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 12,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 11,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	- 10,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	-  9,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	-  8,	- 21	::	.dh	@b3_15  - @b3_tbl
	.blk	-  7,	- 21	::	.dh	@b3_11  - @b3_tbl
	.blk	  29,	- 21	::	.dh	@b3_14  - @b3_tbl
	.blk	- 19,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 18,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 17,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 16,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 15,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 14,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 13,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 12,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 11,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	- 10,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	-  9,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	-  8,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	-  7,	- 20	::	.dh	@b3_15  - @b3_tbl
	.blk	  29,	- 20	::	.dh	@b3_14  - @b3_tbl
	.blk	  29,	- 19	::	.dh	@b3_14  - @b3_tbl
	.blk	- 22,	- 18	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 18	::	.dh	@b3_16  - @b3_tbl
	.blk	  29,	- 18	::	.dh	@b3_17  - @b3_tbl
	.blk	- 21,	- 17	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 16	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 15	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 14	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 13	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	- 12	::	.dh	@b3_16  - @b3_tbl
	.blk	  25,	- 12	::	.dh	@b3_18  - @b3_tbl
	.blk	- 21,	- 11	::	.dh	@b3_16  - @b3_tbl
	.blk	  25,	- 11	::	.dh	@b3_18  - @b3_tbl
	.blk	- 21,	- 10	::	.dh	@b3_16  - @b3_tbl
	.blk	  25,	- 10	::	.dh	@b3_18  - @b3_tbl
	.blk	- 21,	-  9	::	.dh	@b3_16  - @b3_tbl
	.blk	  25,	-  9	::	.dh	@b3_18  - @b3_tbl
	.blk	- 22,	-  8	::	.dh	@b3_16  - @b3_tbl
	.blk	- 21,	-  8	::	.dh	@b3_16  - @b3_tbl
	.blk	  25,	-  8	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  7	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  6	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  5	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  4	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  3	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  2	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	-  1	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	   0	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	   1	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	   2	::	.dh	@b3_18  - @b3_tbl
	.blk	  25,	   3	::	.dh	@b3_18  - @b3_tbl
	.blk	  24,	   4	::	.dh	@b3_19  - @b3_tbl
	.blk	-  9,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	-  8,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	-  7,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	-  6,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	-  5,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	-  4,	   5	::	.dh	@b3_20  - @b3_tbl
	.blk	  24,	   5	::	.dh	@b3_19  - @b3_tbl
	.blk	-  9,	   6	::	.dh	@b3_20  - @b3_tbl
	.blk	  24,	   6	::	.dh	@b3_19  - @b3_tbl
	.blk	-  9,	   7	::	.dh	@b3_20  - @b3_tbl
	.blk	  25,	   7	::	.dh	@b3_18  - @b3_tbl
	.blk	- 21,	   8	::	.dh	@b3_21  - @b3_tbl
	.blk	- 20,	   8	::	.dh	@b3_21  - @b3_tbl
	.blk	- 19,	   8	::	.dh	@b3_21  - @b3_tbl
	.blk	-  9,	   8	::	.dh	@b3_22  - @b3_tbl
	.blk	  25,	   8	::	.dh	@b3_18  - @b3_tbl
	.blk	- 19,	   9	::	.dh	@b3_21  - @b3_tbl
	.blk	  25,	   9	::	.dh	@b3_18  - @b3_tbl
	.blk	- 19,	  10	::	.dh	@b3_21  - @b3_tbl
	.blk	-  9,	  10	::	.dh	@b3_23  - @b3_tbl
	.blk	  25,	  10	::	.dh	@b3_18  - @b3_tbl
	.blk	- 19,	  11	::	.dh	@b3_21  - @b3_tbl
	.blk	-  9,	  11	::	.dh	@b3_24  - @b3_tbl
	.blk	- 19,	  12	::	.dh	@b3_21  - @b3_tbl
	.blk	-  9,	  12	::	.dh	@b3_24  - @b3_tbl
	.blk	  34,	  12	::	.dh	@b3_25  - @b3_tbl
	.blk	  35,	  12	::	.dh	@b3_25  - @b3_tbl
	.blk	  36,	  12	::	.dh	@b3_25  - @b3_tbl
	.blk	- 19,	  13	::	.dh	@b3_21  - @b3_tbl
	.blk	-  9,	  13	::	.dh	@b3_24  - @b3_tbl
	.blk	  34,	  13	::	.dh	@b3_25  - @b3_tbl
	.blk	  35,	  13	::	.dh	@b3_25  - @b3_tbl
	.blk	  36,	  13	::	.dh	@b3_25  - @b3_tbl
	.blk	  34,	  14	::	.dh	@b3_25  - @b3_tbl
	.blk	  35,	  14	::	.dh	@b3_25  - @b3_tbl
	.blk	  36,	  14	::	.dh	@b3_25  - @b3_tbl
	.dh	0xFFFF		::	.dh	@b3_end - @b3_tbl
@b3_tbl_end:

@b3_00:	.db	0x00,0xFC,0x08,0x11	// Lucian poster
@b3_01:	.db	0x00,0xF1,0x08,0x11
@b3_02:	.db	0x00,0xF0,0x08,0x11
@b3_03:	.db	0x00,0xF0,0x08,0x0A
@b3_04:	.db	0x00,0xFB,0x08,0x11
@b3_05:	.db	0x00,0xF8,0x08,0x02
@b3_06:	.db	0x00,0xF8,0x08,0x11
@b3_07:	.db	0x00,0xF9,0x08,0x11
@b3_08:	.db	0x00,0xFA,0x08,0x11
@b3_09:	.db	0x00,0x12,0x08,0x11
@b3_10:	.db	0x00,0x01,0x08,0x03
@b3_11:	.db	0x00,0x10,0x08,0x11
@b3_12:	.db	0x00,0xF0,0x08,0x0B
@b3_13:	.db	0x00,0xF0,0x08,0x0C
@b3_14:	.db	0x00,0xF2,0x08,0x11
@b3_15:	.db	0x00,0x11,0x08,0x11
@b3_16:	.db	0x00,0xF7,0x08,0x11
@b3_17:	.db	0x00,0xF2,0x08,0x03
@b3_18:	.db	0x10,0xF3,0x08,0x11
@b3_19:	.db	0x10,0x02,0x08,0x02
@b3_20:	.db	0x00,0xF4,0x08,0x11
@b3_21:	.db	0x00,0xF6,0x08,0x11
@b3_22:	.db	0x00,0xF4,0x08,0x03
@b3_23:	.db	0x00,0xF5,0x08,0x04
@b3_24:	.db	0x00,0xF5,0x08,0x11
@b3_25:	.db	0x00,0xB0,0x08,0x11
@b3_end:.db	0xFF,0xFF,0xFF,0xFF

.close