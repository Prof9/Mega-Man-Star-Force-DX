// field_265 - Vista Point EM-Road blocks
.nds
.thumb
.create TEMP+"/field/field_265.bin",0
	.dw	@blocks_0
	.dw	@blocks_1
	.dw	@blocks_2
	.dw	@blocks_3
.close

.nds
.thumb
.create TEMP+"/field_265_blocks.dec",0

@blocks_0:
	.import	TEMP+"/field_265_blocks.bak.dec", \
		readu32(TEMP+"/field/field_265.bin", 0*4), \
		readu32(TEMP+"/field/field_265.bin", 1*4) - \
		readu32(TEMP+"/field/field_265.bin", 0*4)
@blocks_1:
	.import	TEMP+"/field_265_blocks.bak.dec", \
		readu32(TEMP+"/field/field_265.bin", 1*4), \
		readu32(TEMP+"/field/field_265.bin", 2*4) - \
		readu32(TEMP+"/field/field_265.bin", 1*4)
@blocks_2:
	.import	TEMP+"/field_265_blocks.bak.dec", \
		readu32(TEMP+"/field/field_265.bin", 2*4), \
		readu32(TEMP+"/field/field_265.bin", 3*4) - \
		readu32(TEMP+"/field/field_265.bin", 2*4)

@blocks_3:
	.dw	(@b3_tbl_end  - @b3_tbl) / 4 - 1

@b3_tbl:
	.blk	- 29,	-  6	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  6	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	-  5	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  5	::	.dh	@b3_00  - @b3_tbl
	.blk	  25,	-  5	::	.dh	@b3_01  - @b3_tbl
	.blk	  26,	-  5	::	.dh	@b3_01  - @b3_tbl
	.blk	  43,	-  5	::	.dh	@b3_02  - @b3_tbl
	.blk	  44,	-  5	::	.dh	@b3_02  - @b3_tbl
	.blk	  45,	-  5	::	.dh	@b3_02  - @b3_tbl
	.blk	- 29,	-  4	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  4	::	.dh	@b3_00  - @b3_tbl
	.blk	  25,	-  4	::	.dh	@b3_01  - @b3_tbl
	.blk	  26,	-  4	::	.dh	@b3_01  - @b3_tbl
	.blk	  43,	-  4	::	.dh	@b3_02  - @b3_tbl
	.blk	  44,	-  4	::	.dh	@b3_02  - @b3_tbl
	.blk	  45,	-  4	::	.dh	@b3_02  - @b3_tbl
	.blk	- 29,	-  3	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  3	::	.dh	@b3_00  - @b3_tbl
	.blk	  25,	-  3	::	.dh	@b3_01  - @b3_tbl
	.blk	  26,	-  3	::	.dh	@b3_01  - @b3_tbl
	.blk	  43,	-  3	::	.dh	@b3_02  - @b3_tbl
	.blk	  44,	-  3	::	.dh	@b3_02  - @b3_tbl
	.blk	  45,	-  3	::	.dh	@b3_02  - @b3_tbl
	.blk	- 29,	-  2	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  2	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	-  1	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	-  1	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	   0	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   0	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	   1	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   1	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	   2	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   2	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	   2	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 23,	   2	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 29,	   3	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   3	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	   3	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 23,	   3	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 13,	   3	::	.dh	@b3_03  - @b3_tbl
	.blk	- 12,	   3	::	.dh	@b3_03  - @b3_tbl
	.blk	- 11,	   3	::	.dh	@b3_03  - @b3_tbl
	.blk	- 29,	   4	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   4	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	   4	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 23,	   4	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 13,	   4	::	.dh	@b3_03  - @b3_tbl
	.blk	- 12,	   4	::	.dh	@b3_03  - @b3_tbl
	.blk	- 11,	   4	::	.dh	@b3_03  - @b3_tbl
	.blk	- 29,	   5	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   5	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	   5	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 23,	   5	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 13,	   5	::	.dh	@b3_03  - @b3_tbl
	.blk	- 12,	   5	::	.dh	@b3_03  - @b3_tbl
	.blk	- 11,	   5	::	.dh	@b3_03  - @b3_tbl
	.blk	- 29,	   6	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   6	::	.dh	@b3_00  - @b3_tbl
	.blk	- 24,	   6	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 23,	   6	::	.dh	@b3_19  - @b3_tbl	// Hollow cutscene
	.blk	- 29,	   7	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   7	::	.dh	@b3_00  - @b3_tbl
	.blk	  37,	   7	::	.dh	@b3_04  - @b3_tbl
	.blk	  38,	   7	::	.dh	@b3_04  - @b3_tbl
	.blk	- 29,	   8	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   8	::	.dh	@b3_00  - @b3_tbl
	.blk	  37,	   8	::	.dh	@b3_04  - @b3_tbl
	.blk	  38,	   8	::	.dh	@b3_04  - @b3_tbl
	.blk	- 29,	   9	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	   9	::	.dh	@b3_00  - @b3_tbl
	.blk	  37,	   9	::	.dh	@b3_04  - @b3_tbl
	.blk	  38,	   9	::	.dh	@b3_04  - @b3_tbl
	.blk	- 29,	  10	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	  10	::	.dh	@b3_00  - @b3_tbl
	.blk	- 29,	  11	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	  11	::	.dh	@b3_00  - @b3_tbl
	.blk	   3,	  11	::	.dh	@b3_03  - @b3_tbl
	.blk	   4,	  11	::	.dh	@b3_03  - @b3_tbl
	.blk	   5,	  11	::	.dh	@b3_03  - @b3_tbl
	.blk	- 29,	  12	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	  12	::	.dh	@b3_00  - @b3_tbl
	.blk	   3,	  12	::	.dh	@b3_03  - @b3_tbl
	.blk	   4,	  12	::	.dh	@b3_03  - @b3_tbl
	.blk	   5,	  12	::	.dh	@b3_03  - @b3_tbl
	.blk	- 29,	  13	::	.dh	@b3_00  - @b3_tbl
	.blk	- 28,	  13	::	.dh	@b3_00  - @b3_tbl
	.blk	   3,	  13	::	.dh	@b3_03  - @b3_tbl
	.blk	   4,	  13	::	.dh	@b3_03  - @b3_tbl
	.blk	   5,	  13	::	.dh	@b3_03  - @b3_tbl
	.blk	  55,	  15	::	.dh	@b3_05  - @b3_tbl
	.blk	  56,	  15	::	.dh	@b3_06  - @b3_tbl
	.blk	  57,	  15	::	.dh	@b3_07  - @b3_tbl
	.blk	  55,	  16	::	.dh	@b3_06  - @b3_tbl
	.blk	  56,	  16	::	.dh	@b3_06  - @b3_tbl
	.blk	  57,	  16	::	.dh	@b3_06  - @b3_tbl
	.blk	  55,	  17	::	.dh	@b3_08  - @b3_tbl
	.blk	  56,	  17	::	.dh	@b3_06  - @b3_tbl
	.blk	  57,	  17	::	.dh	@b3_09  - @b3_tbl
	.blk	  31,	  27	::	.dh	@b3_10  - @b3_tbl
	.blk	  32,	  27	::	.dh	@b3_11  - @b3_tbl
	.blk	  33,	  27	::	.dh	@b3_12  - @b3_tbl
	.blk	  46,	  27	::	.dh	@b3_13  - @b3_tbl
	.blk	  47,	  27	::	.dh	@b3_13  - @b3_tbl
	.blk	  31,	  28	::	.dh	@b3_11  - @b3_tbl
	.blk	  32,	  28	::	.dh	@b3_11  - @b3_tbl
	.blk	  33,	  28	::	.dh	@b3_11  - @b3_tbl
	.blk	  46,	  28	::	.dh	@b3_13  - @b3_tbl
	.blk	  47,	  28	::	.dh	@b3_13  - @b3_tbl
	.blk	  31,	  29	::	.dh	@b3_14  - @b3_tbl
	.blk	  32,	  29	::	.dh	@b3_11  - @b3_tbl
	.blk	  33,	  29	::	.dh	@b3_15  - @b3_tbl
	.blk	  46,	  29	::	.dh	@b3_13  - @b3_tbl
	.blk	  47,	  29	::	.dh	@b3_13  - @b3_tbl
	.blk	- 17,	  47	::	.dh	@b3_03  - @b3_tbl
	.blk	- 16,	  47	::	.dh	@b3_03  - @b3_tbl
	.blk	- 15,	  47	::	.dh	@b3_03  - @b3_tbl
	.blk	- 17,	  48	::	.dh	@b3_03  - @b3_tbl
	.blk	- 16,	  48	::	.dh	@b3_03  - @b3_tbl
	.blk	- 15,	  48	::	.dh	@b3_03  - @b3_tbl
	.blk	- 17,	  49	::	.dh	@b3_03  - @b3_tbl
	.blk	- 16,	  49	::	.dh	@b3_03  - @b3_tbl
	.blk	- 15,	  49	::	.dh	@b3_03  - @b3_tbl
	.blk	- 17,	  52	::	.dh	@b3_16  - @b3_tbl
	.blk	- 16,	  52	::	.dh	@b3_16  - @b3_tbl
	.blk	- 15,	  52	::	.dh	@b3_16  - @b3_tbl
	.blk	- 17,	  53	::	.dh	@b3_16  - @b3_tbl
	.blk	- 16,	  53	::	.dh	@b3_16  - @b3_tbl
	.blk	- 15,	  53	::	.dh	@b3_16  - @b3_tbl
	.blk	- 60,	  59	::	.dh	@b3_17  - @b3_tbl
	.blk	- 60,	  60	::	.dh	@b3_17  - @b3_tbl
	.blk	- 60,	  61	::	.dh	@b3_17  - @b3_tbl
	.blk	   1,	  75	::	.dh	@b3_18  - @b3_tbl
	.blk	   2,	  75	::	.dh	@b3_18  - @b3_tbl
	.blk	   1,	  76	::	.dh	@b3_18  - @b3_tbl
	.blk	   2,	  76	::	.dh	@b3_18  - @b3_tbl
	.blk	   1,	  77	::	.dh	@b3_18  - @b3_tbl
	.blk	   2,	  77	::	.dh	@b3_18  - @b3_tbl
	.dh	0xFFFF		::	.dh	@b3_end - @b3_tbl
@b3_tbl_end:

// z-offset, ID, height, type
@b3_00:	.db	0x00,0x11,0x08,0x11
@b3_01:	.db	0x00,0x12,0x08,0x11
@b3_02:	.db	0x00,0xC2,0x08,0x11
@b3_03:	.db	0x00,0xB0,0x08,0x11
@b3_04:	.db	0x00,0x10,0x08,0x11
@b3_05:	.db	0x00,0x03,0x08,0x09
@b3_06:	.db	0x00,0x03,0x08,0x11
@b3_07:	.db	0x00,0x03,0x08,0x0A
@b3_08:	.db	0x00,0x03,0x08,0x0B
@b3_09:	.db	0x00,0x03,0x08,0x0C
@b3_10:	.db	0x00,0x02,0x08,0x09
@b3_11:	.db	0x00,0x02,0x08,0x11
@b3_12:	.db	0x00,0x02,0x08,0x0A
@b3_13:	.db	0x00,0x13,0x08,0x11
@b3_14:	.db	0x00,0x02,0x08,0x0B
@b3_15:	.db	0x00,0x02,0x08,0x0C
@b3_16:	.db	0x00,0x15,0x08,0x11
@b3_17:	.db	0x00,0x01,0x08,0x01
@b3_18:	.db	0x00,0x14,0x08,0x11
@b3_19:	.db	0x00,0x16,0x08,0x11	// Hollow cutscene
@b3_end:.db	0xFF,0xFF,0xFF,0xFF

.close
