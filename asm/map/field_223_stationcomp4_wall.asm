// field_223 - Station Comp 4 blocks
.nds
.thumb
.create TEMP+"/field/field_223.bin",0
	.dw	@blocks_0
	.dw	@blocks_1
	.dw	@blocks_2
	.dw	@blocks_3
.close

.nds
.thumb
.create TEMP+"/field_223_blocks.dec",0


@blocks_0:
	.dw	(@b0_tbl_end - @b0_tbl) / 4 - 1

@b0_tbl:
	.blk	-26,	-52	::	.dh	@b0_00  - @b0_tbl
	.blk	-25,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-24,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-23,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-22,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-21,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-20,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-19,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-18,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-17,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-16,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-15,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-14,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-13,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-12,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-11,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	-10,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 9,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 8,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 7,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 6,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 5,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 4,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 3,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	- 2,	-52	::	.dh	@b0_02  - @b0_tbl
	.blk	 26,	-52	::	.dh	@b0_00  - @b0_tbl
	.blk	 27,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 31,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 32,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 33,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 34,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 35,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 36,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 37,	-52	::	.dh	@b0_01  - @b0_tbl
	.blk	 38,	-52	::	.dh	@b0_02  - @b0_tbl
	.blk	-26,	-51	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	-51	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-51	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-51	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-50	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	-50	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-50	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-50	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-49	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	-49	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-49	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-49	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-48	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-48	::	.dh	@b0_05  - @b0_tbl
	.blk	-21,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-20,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-19,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-18,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-17,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-16,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-15,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	-14,	-48	::	.dh	@b0_07  - @b0_tbl
	.blk	-10,	-48	::	.dh	@b0_05  - @b0_tbl
	.blk	- 9,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 8,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 7,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 6,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 5,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 4,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 3,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	- 2,	-48	::	.dh	@b0_05  - @b0_tbl
	.blk	 26,	-48	::	.dh	@b0_07  - @b0_tbl
	.blk	 27,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 31,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 32,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 33,	-48	::	.dh	@b0_06  - @b0_tbl
	.blk	 34,	-48	::	.dh	@b0_07  - @b0_tbl
	.blk	 38,	-48	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-47	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-47	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-47	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-47	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-47	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-47	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-46	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-46	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-46	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-46	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-46	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-46	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-45	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-45	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-45	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-45	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-45	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-45	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-44	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-44	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-44	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-44	::	.dh	@b0_04  - @b0_tbl
	.blk	- 6,	-44	::	.dh	@b0_00  - @b0_tbl
	.blk	- 5,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	- 4,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	- 3,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	- 2,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	- 1,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  0,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  1,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  2,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  3,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  4,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  5,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  6,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  7,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  8,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	  9,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 10,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 11,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 12,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 13,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 14,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 15,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 16,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 17,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 18,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 19,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 20,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 21,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 22,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 23,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 24,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 25,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 26,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 27,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	-44	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	-44	::	.dh	@b0_02  - @b0_tbl
	.blk	 34,	-44	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-44	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-43	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-43	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-43	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-43	::	.dh	@b0_04  - @b0_tbl
	.blk	- 6,	-43	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-43	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-43	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-43	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-42	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-42	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-42	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-42	::	.dh	@b0_04  - @b0_tbl
	.blk	- 6,	-42	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-42	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-42	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-42	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-41	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	-41	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-41	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-41	::	.dh	@b0_04  - @b0_tbl
	.blk	- 6,	-41	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-41	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-41	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-41	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	-40	::	.dh	@b0_07  - @b0_tbl
	.blk	-25,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-24,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-23,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-22,	-40	::	.dh	@b0_05  - @b0_tbl
	.blk	-14,	-40	::	.dh	@b0_07  - @b0_tbl
	.blk	-13,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-12,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-11,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	-10,	-40	::	.dh	@b0_05  - @b0_tbl
	.blk	- 6,	-40	::	.dh	@b0_07  - @b0_tbl
	.blk	- 5,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	- 4,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	- 3,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	- 2,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	- 1,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  0,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  1,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  2,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  3,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  4,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  5,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	  6,	-40	::	.dh	@b0_07  - @b0_tbl
	.blk	 10,	-40	::	.dh	@b0_05  - @b0_tbl
	.blk	 11,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 12,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 13,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 14,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 15,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 16,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 17,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 18,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 19,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 20,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 21,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 22,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 23,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 24,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 25,	-40	::	.dh	@b0_06  - @b0_tbl
	.blk	 26,	-40	::	.dh	@b0_07  - @b0_tbl
	.blk	 30,	-40	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-40	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-40	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-40	::	.dh	@b0_00  - @b0_tbl
	.blk	 47,	-40	::	.dh	@b0_01  - @b0_tbl
	.blk	 48,	-40	::	.dh	@b0_01  - @b0_tbl
	.blk	 49,	-40	::	.dh	@b0_01  - @b0_tbl
	.blk	 50,	-40	::	.dh	@b0_02  - @b0_tbl
	.blk	  6,	-39	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	-39	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-39	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-39	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-39	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-39	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-39	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-39	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	-38	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	-38	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-38	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-38	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-38	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-38	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-38	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-38	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	-37	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	-37	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	-37	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	-37	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-37	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-37	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-37	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-37	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	-36	::	.dh	@b0_07  - @b0_tbl
	.blk	  7,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	  8,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	  9,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	 10,	-36	::	.dh	@b0_05  - @b0_tbl
	.blk	 26,	-36	::	.dh	@b0_07  - @b0_tbl
	.blk	 27,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	-36	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	-36	::	.dh	@b0_05  - @b0_tbl
	.blk	 34,	-36	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-36	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-36	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-36	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-35	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-35	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-35	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-35	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-34	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-34	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-34	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-34	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-33	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-33	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-33	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-33	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-32	::	.dh	@b0_00  - @b0_tbl
	.blk	-41,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-40,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-39,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-38,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-37,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-36,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-35,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-34,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-33,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-32,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-31,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	-30,	-32	::	.dh	@b0_02  - @b0_tbl
	.blk	 34,	-32	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-32	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-32	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-32	::	.dh	@b0_02  - @b0_tbl
	.blk	 51,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 52,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 53,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 54,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 55,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 56,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 57,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 58,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 59,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 60,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 61,	-32	::	.dh	@b0_01  - @b0_tbl
	.blk	 62,	-32	::	.dh	@b0_02  - @b0_tbl
	.blk	-42,	-31	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-31	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-31	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-31	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-31	::	.dh	@b0_03  - @b0_tbl
	.blk	 62,	-31	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-30	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-30	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-30	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-30	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-30	::	.dh	@b0_03  - @b0_tbl
	.blk	 62,	-30	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-29	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-29	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-29	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-29	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-29	::	.dh	@b0_03  - @b0_tbl
	.blk	 62,	-29	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-28	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-28	::	.dh	@b0_05  - @b0_tbl
	.blk	-37,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	-36,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	-35,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	-34,	-28	::	.dh	@b0_07  - @b0_tbl
	.blk	-30,	-28	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-28	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-28	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-28	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-28	::	.dh	@b0_05  - @b0_tbl
	.blk	 51,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 52,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 53,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 54,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 55,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 56,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 57,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 58,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 59,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 60,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 61,	-28	::	.dh	@b0_06  - @b0_tbl
	.blk	 62,	-28	::	.dh	@b0_05  - @b0_tbl
	.blk	-42,	-27	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-27	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-27	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-27	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-27	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-27	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-27	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-27	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-26	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-26	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-26	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-26	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-26	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-26	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-26	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-26	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-25	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-25	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-25	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-25	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-25	::	.dh	@b0_03  - @b0_tbl
	.blk	 38,	-25	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-25	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-25	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-24	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-24	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-24	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-24	::	.dh	@b0_04  - @b0_tbl
	.blk	 34,	-24	::	.dh	@b0_07  - @b0_tbl
	.blk	 35,	-24	::	.dh	@b0_06  - @b0_tbl
	.blk	 36,	-24	::	.dh	@b0_06  - @b0_tbl
	.blk	 37,	-24	::	.dh	@b0_06  - @b0_tbl
	.blk	 38,	-24	::	.dh	@b0_05  - @b0_tbl
	.blk	 46,	-24	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-24	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-23	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-23	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-23	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-23	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-23	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-23	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-22	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-22	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-22	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-22	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-22	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-22	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-21	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-21	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-21	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	-21	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-21	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-21	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-20	::	.dh	@b0_00  - @b0_tbl
	.blk	-49,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	-48,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	-47,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	-46,	-20	::	.dh	@b0_02  - @b0_tbl
	.blk	-42,	-20	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-20	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-20	::	.dh	@b0_03  - @b0_tbl	// new
//	.blk	-34,	-20	::	.dh	@b0_07  - @b0_tbl	// old
//	.blk	-33,	-20	::	.dh	@b0_06  - @b0_tbl	// old
//	.blk	-32,	-20	::	.dh	@b0_06  - @b0_tbl	// old
//	.blk	-31,	-20	::	.dh	@b0_06  - @b0_tbl	// old
	.blk	-30,	-20	::	.dh	@b0_04  - @b0_tbl	// new
//	.blk	-30,	-20	::	.dh	@b0_05  - @b0_tbl	// old
	.blk	 46,	-20	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-20	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-20	::	.dh	@b0_00  - @b0_tbl
	.blk	 63,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 64,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 65,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 66,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 67,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 68,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 69,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 70,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 71,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 72,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 73,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 74,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 75,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 76,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 77,	-20	::	.dh	@b0_01  - @b0_tbl
	.blk	 78,	-20	::	.dh	@b0_02  - @b0_tbl
	.blk	-50,	-19	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-19	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-19	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-19	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-19	::	.dh	@b0_03  - @b0_tbl	// new
	.blk	-30,	-19	::	.dh	@b0_04  - @b0_tbl	// new
	.blk	 46,	-19	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-19	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-19	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	-19	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-18	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-18	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-18	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-18	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-18	::	.dh	@b0_03  - @b0_tbl	// new
	.blk	-30,	-18	::	.dh	@b0_04  - @b0_tbl	// new
	.blk	 46,	-18	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-18	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-18	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	-18	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-17	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-17	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-17	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-17	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-17	::	.dh	@b0_03  - @b0_tbl	// new
	.blk	-30,	-17	::	.dh	@b0_04  - @b0_tbl	// new
	.blk	 46,	-17	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-17	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-17	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	-17	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-16	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-16	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-16	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-16	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	-16	::	.dh	@b0_07  - @b0_tbl	// new
	.blk	-33,	-16	::	.dh	@b0_06  - @b0_tbl	// new
	.blk	-32,	-16	::	.dh	@b0_06  - @b0_tbl	// new
	.blk	-31,	-16	::	.dh	@b0_06  - @b0_tbl	// new
	.blk	-30,	-16	::	.dh	@b0_05  - @b0_tbl	// new
	.blk	-14,	-16	::	.dh	@b0_00  - @b0_tbl
	.blk	-13,	-16	::	.dh	@b0_01  - @b0_tbl
	.blk	-12,	-16	::	.dh	@b0_01  - @b0_tbl
	.blk	-11,	-16	::	.dh	@b0_01  - @b0_tbl
	.blk	-10,	-16	::	.dh	@b0_02  - @b0_tbl
	.blk	 46,	-16	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-16	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-16	::	.dh	@b0_03  - @b0_tbl
	.blk	 77,	-16	::	.dh	@b0_08  - @b0_tbl
	.blk	 78,	-16	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-15	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-15	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-15	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-15	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-15	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-15	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-15	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-15	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-15	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	-15	::	.dh	@b0_08  - @b0_tbl
	.blk	 77,	-15	::	.dh	@b0_09  - @b0_tbl
	.blk	-50,	-14	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-14	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-14	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-14	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-14	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-14	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-14	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-14	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-14	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	-14	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-13	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-13	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-13	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-13	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-13	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-13	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-13	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-13	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	-13	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	-13	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-12	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-12	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-12	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-12	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-12	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-12	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-12	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-12	::	.dh	@b0_02  - @b0_tbl
	.blk	 51,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 52,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 53,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 54,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 55,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 56,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 57,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 58,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 59,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 60,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 61,	-12	::	.dh	@b0_01  - @b0_tbl
	.blk	 62,	-12	::	.dh	@b0_00  - @b0_tbl
	.blk	 76,	-12	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-11	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-11	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-11	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-11	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-11	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-11	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-11	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-11	::	.dh	@b0_10  - @b0_tbl
	.blk	 76,	-11	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	-10	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	-10	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	-10	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	-10	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	-10	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	-10	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	-10	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	-10	::	.dh	@b0_10  - @b0_tbl
	.blk	 76,	-10	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 9	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 9	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	- 9	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	- 9	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	- 9	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 9	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 9	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 9	::	.dh	@b0_10  - @b0_tbl
	.blk	 76,	- 9	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 8	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 8	::	.dh	@b0_02  - @b0_tbl
	.blk	-45,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-44,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-43,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-42,	- 8	::	.dh	@b0_00  - @b0_tbl
	.blk	-38,	- 8	::	.dh	@b0_02  - @b0_tbl
	.blk	-37,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-36,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-35,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-34,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-33,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-32,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-31,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-30,	- 8	::	.dh	@b0_02  - @b0_tbl
	.blk	-18,	- 8	::	.dh	@b0_00  - @b0_tbl
	.blk	-17,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-16,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-15,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	-14,	- 8	::	.dh	@b0_00  - @b0_tbl
	.blk	-10,	- 8	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 8	::	.dh	@b0_00  - @b0_tbl
	.blk	 39,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	 40,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	 41,	- 8	::	.dh	@b0_01  - @b0_tbl
	.blk	 42,	- 8	::	.dh	@b0_02  - @b0_tbl
	.blk	 46,	- 8	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 8	::	.dh	@b0_05  - @b0_tbl
	.blk	 51,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 52,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 53,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 54,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 55,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 56,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 57,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 58,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 59,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 60,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 61,	- 8	::	.dh	@b0_06  - @b0_tbl
	.blk	 62,	- 8	::	.dh	@b0_07  - @b0_tbl
	.blk	 76,	- 8	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 7	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	- 7	::	.dh	@b0_04  - @b0_tbl
	.blk	-18,	- 7	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 7	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 7	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 7	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 7	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 7	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 7	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	- 7	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 6	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	- 6	::	.dh	@b0_04  - @b0_tbl
	.blk	-18,	- 6	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 6	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 6	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 6	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 6	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 6	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 6	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	- 6	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 5	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	- 5	::	.dh	@b0_04  - @b0_tbl
	.blk	-18,	- 5	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 5	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 5	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 5	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 5	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 5	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 5	::	.dh	@b0_03  - @b0_tbl
	.blk	 76,	- 5	::	.dh	@b0_11  - @b0_tbl
	.blk	 77,	- 5	::	.dh	@b0_12  - @b0_tbl
	.blk	-50,	- 4	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 4	::	.dh	@b0_05  - @b0_tbl
	.blk	-45,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-44,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-43,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-42,	- 4	::	.dh	@b0_07  - @b0_tbl
	.blk	-38,	- 4	::	.dh	@b0_05  - @b0_tbl
	.blk	-37,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-36,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-35,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-34,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-33,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-32,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-31,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-30,	- 4	::	.dh	@b0_05  - @b0_tbl
	.blk	-18,	- 4	::	.dh	@b0_07  - @b0_tbl
	.blk	-17,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-16,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-15,	- 4	::	.dh	@b0_06  - @b0_tbl
	.blk	-14,	- 4	::	.dh	@b0_07  - @b0_tbl
	.blk	-10,	- 4	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 4	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 4	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 4	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 4	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 4	::	.dh	@b0_03  - @b0_tbl
	.blk	 77,	- 4	::	.dh	@b0_11  - @b0_tbl
	.blk	 78,	- 4	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 3	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	- 3	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 2	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	- 2	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	 62,	- 1	::	.dh	@b0_03  - @b0_tbl
	.blk	 78,	- 1	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  0	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  0	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	  0	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	  0	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	  0	::	.dh	@b0_00  - @b0_tbl
	.blk	-25,	  0	::	.dh	@b0_01  - @b0_tbl
	.blk	-24,	  0	::	.dh	@b0_01  - @b0_tbl
	.blk	-23,	  0	::	.dh	@b0_01  - @b0_tbl
	.blk	-22,	  0	::	.dh	@b0_02  - @b0_tbl
	.blk	-14,	  0	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	  0	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  0	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  0	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	  0	::	.dh	@b0_07  - @b0_tbl
	.blk	 47,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 48,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 49,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 50,	  0	::	.dh	@b0_05  - @b0_tbl
	.blk	 62,	  0	::	.dh	@b0_07  - @b0_tbl
	.blk	 63,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 64,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 65,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 66,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 67,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 68,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 69,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 70,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 71,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 72,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 73,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 74,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 75,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 76,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 77,	  0	::	.dh	@b0_06  - @b0_tbl
	.blk	 78,	  0	::	.dh	@b0_05  - @b0_tbl
	.blk	-50,	  1	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  1	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	  1	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	  1	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	  1	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  1	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	  1	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	  1	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  1	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  1	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  2	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  2	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	  2	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	  2	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	  2	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  2	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	  2	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	  2	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  2	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  2	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  3	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  3	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	  3	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	  3	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	  3	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  3	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	  3	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	  3	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  3	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  3	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  4	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  4	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	  4	::	.dh	@b0_07  - @b0_tbl
	.blk	-41,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-40,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-39,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-38,	  4	::	.dh	@b0_05  - @b0_tbl
	.blk	-34,	  4	::	.dh	@b0_00  - @b0_tbl
	.blk	-33,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-32,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-31,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-30,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-29,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-28,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-27,	  4	::	.dh	@b0_01  - @b0_tbl
	.blk	-26,	  4	::	.dh	@b0_00  - @b0_tbl
	.blk	-22,	  4	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	  4	::	.dh	@b0_07  - @b0_tbl
	.blk	-13,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-12,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-11,	  4	::	.dh	@b0_06  - @b0_tbl
	.blk	-10,	  4	::	.dh	@b0_05  - @b0_tbl
	.blk	 38,	  4	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  4	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  5	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  5	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	  5	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  5	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  5	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  5	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  6	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  6	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	  6	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  6	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  6	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  6	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  7	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  7	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	  7	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	  7	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  7	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  7	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  8	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  8	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	  8	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	  8	::	.dh	@b0_05  - @b0_tbl
	.blk	-29,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-28,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-27,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-26,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-25,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-24,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-23,	  8	::	.dh	@b0_06  - @b0_tbl
	.blk	-22,	  8	::	.dh	@b0_05  - @b0_tbl
	.blk	 26,	  8	::	.dh	@b0_00  - @b0_tbl
	.blk	 27,	  8	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	  8	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	  8	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	  8	::	.dh	@b0_02  - @b0_tbl
	.blk	 38,	  8	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  8	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	  9	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	  9	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	  9	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	  9	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	  9	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	  9	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	  9	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	  9	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	 10	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 10	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 10	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 10	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 10	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 10	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 10	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 10	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	 11	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 11	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 11	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 11	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 11	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 11	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 11	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 11	::	.dh	@b0_04  - @b0_tbl
	.blk	-50,	 12	::	.dh	@b0_07  - @b0_tbl
	.blk	-49,	 12	::	.dh	@b0_06  - @b0_tbl
	.blk	-48,	 12	::	.dh	@b0_06  - @b0_tbl
	.blk	-47,	 12	::	.dh	@b0_06  - @b0_tbl
	.blk	-46,	 12	::	.dh	@b0_05  - @b0_tbl
	.blk	-34,	 12	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 12	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 12	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 12	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 12	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 12	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 13	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 13	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 13	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 13	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 13	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 13	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 14	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 14	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 14	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 14	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 14	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 14	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 15	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 15	::	.dh	@b0_04  - @b0_tbl
	.blk	 26,	 15	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 15	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 15	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 15	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 16	::	.dh	@b0_00  - @b0_tbl
	.blk	-41,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-40,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-39,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-38,	 16	::	.dh	@b0_02  - @b0_tbl
	.blk	-34,	 16	::	.dh	@b0_03  - @b0_tbl
	.blk	-30,	 16	::	.dh	@b0_02  - @b0_tbl
	.blk	-29,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-28,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-27,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-26,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-25,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-24,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-23,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-22,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-21,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-20,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-19,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	-18,	 16	::	.dh	@b0_02  - @b0_tbl
	.blk	 18,	 16	::	.dh	@b0_00  - @b0_tbl
	.blk	 19,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 20,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 21,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 22,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 23,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 24,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 25,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 26,	 16	::	.dh	@b0_00  - @b0_tbl
	.blk	 30,	 16	::	.dh	@b0_02  - @b0_tbl
	.blk	 31,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 32,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 33,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 34,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 35,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 36,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 37,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 38,	 16	::	.dh	@b0_00  - @b0_tbl
	.blk	 42,	 16	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 16	::	.dh	@b0_00  - @b0_tbl
	.blk	 47,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 48,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 49,	 16	::	.dh	@b0_01  - @b0_tbl
	.blk	 50,	 16	::	.dh	@b0_02  - @b0_tbl
	.blk	-42,	 17	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 17	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 17	::	.dh	@b0_03  - @b0_tbl
	.blk	-18,	 17	::	.dh	@b0_04  - @b0_tbl
	.blk	 18,	 17	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 17	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 17	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 17	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 18	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 18	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 18	::	.dh	@b0_03  - @b0_tbl
	.blk	-18,	 18	::	.dh	@b0_04  - @b0_tbl
	.blk	 18,	 18	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 18	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 18	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 18	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 19	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 19	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 19	::	.dh	@b0_03  - @b0_tbl
	.blk	-18,	 19	::	.dh	@b0_04  - @b0_tbl
	.blk	 18,	 19	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 19	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 19	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 19	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 20	::	.dh	@b0_00  - @b0_tbl
	.blk	-57,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-56,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-55,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-54,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-53,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-52,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-51,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-50,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-49,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-48,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-47,	 20	::	.dh	@b0_01  - @b0_tbl
	.blk	-46,	 20	::	.dh	@b0_02  - @b0_tbl
	.blk	-42,	 20	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 20	::	.dh	@b0_04  - @b0_tbl
	.blk	-34,	 20	::	.dh	@b0_07  - @b0_tbl
	.blk	-33,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-32,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-31,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-30,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-29,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-28,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-27,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-26,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-25,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-24,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-23,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-22,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-21,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-20,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-19,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	-18,	 20	::	.dh	@b0_05  - @b0_tbl
	.blk	 18,	 20	::	.dh	@b0_07  - @b0_tbl
	.blk	 19,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 20,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 21,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 22,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 23,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 24,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 25,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 26,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 27,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 31,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 32,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 33,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 34,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 35,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 36,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 37,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 38,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 39,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 40,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 41,	 20	::	.dh	@b0_06  - @b0_tbl
	.blk	 42,	 20	::	.dh	@b0_05  - @b0_tbl
	.blk	 46,	 20	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 20	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 21	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 21	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 21	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 21	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 21	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 21	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 22	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 22	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 22	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 22	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 22	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 22	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 23	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 23	::	.dh	@b0_04  - @b0_tbl
	.blk	-42,	 23	::	.dh	@b0_03  - @b0_tbl
	.blk	-38,	 23	::	.dh	@b0_04  - @b0_tbl
	.blk	 46,	 23	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 23	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 24	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 24	::	.dh	@b0_02  - @b0_tbl
	.blk	-45,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-44,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-43,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-42,	 24	::	.dh	@b0_00  - @b0_tbl
	.blk	-38,	 24	::	.dh	@b0_02  - @b0_tbl
	.blk	-37,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-36,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-35,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-34,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-33,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-32,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-31,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-30,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-29,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-28,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-27,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-26,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-25,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-24,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-23,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	-22,	 24	::	.dh	@b0_02  - @b0_tbl
	.blk	 14,	 24	::	.dh	@b0_00  - @b0_tbl
	.blk	 15,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 16,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 17,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 18,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 19,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 20,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 21,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 22,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 23,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 24,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 25,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 26,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 27,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 31,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 32,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 33,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 34,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 35,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 36,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 37,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 38,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 39,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 40,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 41,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 42,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 43,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 44,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 45,	 24	::	.dh	@b0_01  - @b0_tbl
	.blk	 46,	 24	::	.dh	@b0_00  - @b0_tbl
	.blk	 50,	 24	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 25	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 25	::	.dh	@b0_04  - @b0_tbl
	.blk	 14,	 25	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 25	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 26	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 26	::	.dh	@b0_04  - @b0_tbl
	.blk	 14,	 26	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 26	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 27	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 27	::	.dh	@b0_04  - @b0_tbl
	.blk	 14,	 27	::	.dh	@b0_03  - @b0_tbl
	.blk	 50,	 27	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 28	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 28	::	.dh	@b0_05  - @b0_tbl
	.blk	-45,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-44,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-43,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-42,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-41,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-40,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-39,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-38,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-37,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-36,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-35,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-34,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-33,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-32,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-31,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-30,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-29,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-28,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-27,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-26,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-25,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-24,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-23,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	-22,	 28	::	.dh	@b0_05  - @b0_tbl
	.blk	-14,	 28	::	.dh	@b0_00  - @b0_tbl
	.blk	-13,	 28	::	.dh	@b0_01  - @b0_tbl
	.blk	-12,	 28	::	.dh	@b0_01  - @b0_tbl
	.blk	-11,	 28	::	.dh	@b0_01  - @b0_tbl
	.blk	-10,	 28	::	.dh	@b0_02  - @b0_tbl
	.blk	 14,	 28	::	.dh	@b0_07  - @b0_tbl
	.blk	 15,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 16,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 17,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 18,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 19,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 20,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 21,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 22,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 23,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 24,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 25,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 26,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 27,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 31,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 32,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 33,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 34,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 35,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 36,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 37,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 38,	 28	::	.dh	@b0_07  - @b0_tbl
	.blk	 42,	 28	::	.dh	@b0_05  - @b0_tbl
	.blk	 43,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 44,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 45,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 46,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 47,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 48,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 49,	 28	::	.dh	@b0_06  - @b0_tbl
	.blk	 50,	 28	::	.dh	@b0_05  - @b0_tbl
	.blk	-58,	 29	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 29	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	 29	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	 29	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 29	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 29	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 30	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 30	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	 30	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	 30	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 30	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 30	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 31	::	.dh	@b0_03  - @b0_tbl
	.blk	-46,	 31	::	.dh	@b0_04  - @b0_tbl
	.blk	-14,	 31	::	.dh	@b0_03  - @b0_tbl
	.blk	-10,	 31	::	.dh	@b0_04  - @b0_tbl
	.blk	 38,	 31	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 31	::	.dh	@b0_04  - @b0_tbl
	.blk	-58,	 32	::	.dh	@b0_07  - @b0_tbl
	.blk	-57,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-56,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-55,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-54,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-53,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-52,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-51,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-50,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-49,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-48,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-47,	 32	::	.dh	@b0_06  - @b0_tbl
	.blk	-46,	 32	::	.dh	@b0_05  - @b0_tbl
	.blk	-26,	 32	::	.dh	@b0_00  - @b0_tbl
	.blk	-25,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-24,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-23,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-22,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-21,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-20,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-19,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-18,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-17,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-16,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-15,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	-14,	 32	::	.dh	@b0_00  - @b0_tbl
	.blk	-10,	 32	::	.dh	@b0_02  - @b0_tbl
	.blk	- 9,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 8,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 7,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 6,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 5,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 4,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 3,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	- 2,	 32	::	.dh	@b0_02  - @b0_tbl
	.blk	  6,	 32	::	.dh	@b0_00  - @b0_tbl
	.blk	  7,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	  8,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	  9,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 10,	 32	::	.dh	@b0_02  - @b0_tbl
	.blk	 22,	 32	::	.dh	@b0_00  - @b0_tbl
	.blk	 23,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 24,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 25,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 26,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 27,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 31,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 32,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 33,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 34,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 35,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 36,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 37,	 32	::	.dh	@b0_01  - @b0_tbl
	.blk	 38,	 32	::	.dh	@b0_00  - @b0_tbl
	.blk	 42,	 32	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 33	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	 33	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 33	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 33	::	.dh	@b0_04  - @b0_tbl
	.blk	 22,	 33	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 33	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 34	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	 34	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 34	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 34	::	.dh	@b0_04  - @b0_tbl
	.blk	 22,	 34	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 34	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 35	::	.dh	@b0_03  - @b0_tbl
	.blk	- 2,	 35	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 35	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 35	::	.dh	@b0_04  - @b0_tbl
	.blk	 22,	 35	::	.dh	@b0_03  - @b0_tbl
	.blk	 42,	 35	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 36	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 36	::	.dh	@b0_05  - @b0_tbl
	.blk	-21,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-20,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-19,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-18,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-17,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-16,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-15,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-14,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-13,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-12,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-11,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	-10,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 9,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 8,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 7,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 6,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 5,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 4,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 3,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	- 2,	 36	::	.dh	@b0_05  - @b0_tbl
	.blk	  6,	 36	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 36	::	.dh	@b0_04  - @b0_tbl
	.blk	 22,	 36	::	.dh	@b0_07  - @b0_tbl
	.blk	 23,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 24,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 25,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 26,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 27,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 31,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 32,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 33,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 34,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 35,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 36,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 37,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 38,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 39,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 40,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 41,	 36	::	.dh	@b0_06  - @b0_tbl
	.blk	 42,	 36	::	.dh	@b0_05  - @b0_tbl
	.blk	-26,	 37	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 37	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 37	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 37	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 38	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 38	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 38	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 38	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 39	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 39	::	.dh	@b0_04  - @b0_tbl
	.blk	  6,	 39	::	.dh	@b0_03  - @b0_tbl
	.blk	 10,	 39	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 40	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 40	::	.dh	@b0_04  - @b0_tbl
	.blk	-10,	 40	::	.dh	@b0_00  - @b0_tbl
	.blk	- 9,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 8,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 7,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 6,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 5,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 4,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 3,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 2,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	- 1,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  0,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  1,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  2,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  3,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  4,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  5,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	  6,	 40	::	.dh	@b0_00  - @b0_tbl
	.blk	 10,	 40	::	.dh	@b0_02  - @b0_tbl
	.blk	 11,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 12,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 13,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 14,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 15,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 16,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 17,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 18,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 19,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 20,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 21,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 22,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 23,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 24,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 25,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 26,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 27,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 28,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 29,	 40	::	.dh	@b0_01  - @b0_tbl
	.blk	 30,	 40	::	.dh	@b0_02  - @b0_tbl
	.blk	-26,	 41	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 41	::	.dh	@b0_04  - @b0_tbl
	.blk	-10,	 41	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 41	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 42	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 42	::	.dh	@b0_04  - @b0_tbl
	.blk	-10,	 42	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 42	::	.dh	@b0_04  - @b0_tbl
	.blk	-26,	 43	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 43	::	.dh	@b0_04  - @b0_tbl
	.blk	-10,	 43	::	.dh	@b0_03  - @b0_tbl
	.blk	 30,	 43	::	.dh	@b0_04  - @b0_tbl
	.blk	-38,	 44	::	.dh	@b0_00  - @b0_tbl
	.blk	-37,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-36,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-35,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-34,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-33,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-32,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-31,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-30,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-29,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-28,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-27,	 44	::	.dh	@b0_01  - @b0_tbl
	.blk	-26,	 44	::	.dh	@b0_00  - @b0_tbl
	.blk	-22,	 44	::	.dh	@b0_04  - @b0_tbl
	.blk	-10,	 44	::	.dh	@b0_07  - @b0_tbl
	.blk	- 9,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 8,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 7,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 6,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 5,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 4,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 3,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 2,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	- 1,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  0,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  1,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  2,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  3,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  4,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  5,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  6,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  7,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  8,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	  9,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 10,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 11,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 12,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 13,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 14,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 15,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 16,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 17,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 18,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 19,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 20,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 21,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 22,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 23,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 24,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 25,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 26,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 27,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 28,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 29,	 44	::	.dh	@b0_06  - @b0_tbl
	.blk	 30,	 44	::	.dh	@b0_05  - @b0_tbl
	.blk	-38,	 45	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 45	::	.dh	@b0_04  - @b0_tbl
	.blk	-38,	 46	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 46	::	.dh	@b0_04  - @b0_tbl
	.blk	-38,	 47	::	.dh	@b0_03  - @b0_tbl
	.blk	-22,	 47	::	.dh	@b0_04  - @b0_tbl
	.blk	-38,	 48	::	.dh	@b0_07  - @b0_tbl
	.blk	-37,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-36,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-35,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-34,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-33,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-32,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-31,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-30,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-29,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-28,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-27,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-26,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-25,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-24,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-23,	 48	::	.dh	@b0_06  - @b0_tbl
	.blk	-22,	 48	::	.dh	@b0_05  - @b0_tbl
	.dh	0xFFFF		::	.dh	@b0_end - @b0_tbl
@b0_tbl_end:

// z-offset, ID, height, type
@b0_00:	.db	0x00, 0x00, 0x08, 0x08
@b0_01:	.db	0x00, 0x00, 0x08, 0x04
@b0_02:	.db	0x00, 0x00, 0x08, 0x07
@b0_03:	.db	0x00, 0x00, 0x08, 0x02
@b0_04:	.db	0x00, 0x00, 0x08, 0x01
@b0_05:	.db	0x00, 0x00, 0x08, 0x05
@b0_06:	.db	0x00, 0x00, 0x08, 0x03
@b0_07:	.db	0x00, 0x00, 0x08, 0x06
@b0_08:	.db	0x00, 0x00, 0x08, 0x09
@b0_09:	.db	0x00, 0x00, 0x08, 0x0D
@b0_10:	.db	0x00, 0x80, 0x08, 0x01
@b0_11:	.db	0x00, 0x00, 0x08, 0x0B
@b0_12:	.db	0x00, 0x00, 0x08, 0x0F
@b0_end:.db	0xFF, 0xFF, 0xFF, 0xFF


@blocks_1:
	.import	TEMP+"/field_223_blocks.bak.dec", \
		readu32(TEMP+"/field/field_223.bin", 1*4), \
		readu32(TEMP+"/field/field_223.bin", 2*4) - \
		readu32(TEMP+"/field/field_223.bin", 1*4)
@blocks_2:
	.import	TEMP+"/field_223_blocks.bak.dec", \
		readu32(TEMP+"/field/field_223.bin", 2*4), \
		readu32(TEMP+"/field/field_223.bin", 3*4) - \
		readu32(TEMP+"/field/field_223.bin", 2*4)
@blocks_3:
	.import	TEMP+"/field_223_blocks.bak.dec", \
		readu32(TEMP+"/field/field_223.bin", 3*4)

.close
