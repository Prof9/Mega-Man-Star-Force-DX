.definelabel	COLOR_DEPTH,5
.definelabel	COLOR_SIZE,((3*COLOR_DEPTH+7)/8)
.definelabel	TILE_SHIFT,1
.definelabel	TILE_SIZE,(1<<COLOR_DEPTH)
.definelabel	PAL_SIZE,16

.definelabel	FLIP_NONE,(0b00)
.definelabel	FLIP_HORI,(0b01)
.definelabel	FLIP_VERT,(0b10)
.definelabel	FLIP_BOTH,(0b11)

.definelabel	@SIZE_0,(0<<0)
.definelabel	@SIZE_1,(1<<0)
.definelabel	@SIZE_2,(2<<0)
.definelabel	@SIZE_3,(3<<0)
.definelabel	@SHAPE_0,(0<<8)
.definelabel	@SHAPE_1,(1<<8)
.definelabel	@SHAPE_2,(2<<8)

.definelabel	SIZE_8x8,(@SIZE_0|@SHAPE_0)
.definelabel	SIZE_8x16,(@SIZE_0|@SHAPE_2)
.definelabel	SIZE_8x32,(@SIZE_1|@SHAPE_2)
.definelabel	SIZE_16x8,(@SIZE_0|@SHAPE_1)
.definelabel	SIZE_16x16,(@SIZE_1|@SHAPE_0)
.definelabel	SIZE_16x32,(@SIZE_2|@SHAPE_2)
.definelabel	SIZE_32x8,(@SIZE_1|@SHAPE_1)
.definelabel	SIZE_32x16,(@SIZE_2|@SHAPE_1)
.definelabel	SIZE_32x32,(@SIZE_2|@SHAPE_0)
.definelabel	SIZE_32x64,(@SIZE_3|@SHAPE_2)
.definelabel	SIZE_64x32,(@SIZE_3|@SHAPE_1)
.definelabel	SIZE_64x64,(@SIZE_3|@SHAPE_0)

.definelabel	ANIM_NEXT,0x00
.definelabel	ANIM_LOOP,0x40
.definelabel	ANIM_END,0x80

.definelabel	OBJ_END,0x1

.macro	FileHeader
@s:
	.dw	defined(@TilesetHeader_s_00000000)   ? @TilesetHeader_s_00000000   : 0xFFFFFFFF
	.dw	defined(@PaletteHeader_s_00000000)   ? @PaletteHeader_s_00000000   : 0xFFFFFFFF
	.dw	defined(@AnimationHeader_s_00000000) ? @AnimationHeader_s_00000000 : 0xFFFFFFFF
	.dw	defined(@SpriteHeader_s_00000000)    ? @SpriteHeader_s_00000000    : 0xFFFFFFFF
	.dw	0x1
.endmacro

.macro	TilesetHeader
@s:
	// Max number of tiles
	.dh	max(	defined(@Tileset_s_00000000) ? @Tileset_e_00000000-@Tileset_s_00000000 : 0 \
		,	defined(@Tileset_s_00000001) ? @Tileset_e_00000001-@Tileset_s_00000001 : 0 \
		,	defined(@Tileset_s_00000002) ? @Tileset_e_00000002-@Tileset_s_00000002 : 0 \
		,	defined(@Tileset_s_00000003) ? @Tileset_e_00000003-@Tileset_s_00000003 : 0 \
		,	defined(@Tileset_s_00000004) ? @Tileset_e_00000004-@Tileset_s_00000004 : 0 \
		,	defined(@Tileset_s_00000005) ? @Tileset_e_00000005-@Tileset_s_00000005 : 0 \
		,	defined(@Tileset_s_00000006) ? @Tileset_e_00000006-@Tileset_s_00000006 : 0 \
		,	defined(@Tileset_s_00000007) ? @Tileset_e_00000007-@Tileset_s_00000007 : 0 \
		,	defined(@Tileset_s_00000008) ? @Tileset_e_00000008-@Tileset_s_00000008 : 0 \
		,	defined(@Tileset_s_00000009) ? @Tileset_e_00000009-@Tileset_s_00000009 : 0 \
		,	defined(@Tileset_s_0000000a) ? @Tileset_e_0000000a-@Tileset_s_0000000a : 0 \
		,	defined(@Tileset_s_0000000b) ? @Tileset_e_0000000b-@Tileset_s_0000000b : 0 \
		,	defined(@Tileset_s_0000000c) ? @Tileset_e_0000000c-@Tileset_s_0000000c : 0 \
		,	defined(@Tileset_s_0000000d) ? @Tileset_e_0000000d-@Tileset_s_0000000d : 0 \
		,	defined(@Tileset_s_0000000e) ? @Tileset_e_0000000e-@Tileset_s_0000000e : 0 \
		,	defined(@Tileset_s_0000000f) ? @Tileset_e_0000000f-@Tileset_s_0000000f : 0 \
		,	defined(@Tileset_s_00000010) ? @Tileset_e_00000010-@Tileset_s_00000010 : 0 \
		,	defined(@Tileset_s_00000011) ? @Tileset_e_00000011-@Tileset_s_00000011 : 0 \
		,	defined(@Tileset_s_00000012) ? @Tileset_e_00000012-@Tileset_s_00000012 : 0 \
		,	defined(@Tileset_s_00000013) ? @Tileset_e_00000013-@Tileset_s_00000013 : 0 \
		,	defined(@Tileset_s_00000014) ? @Tileset_e_00000014-@Tileset_s_00000014 : 0 \
		,	defined(@Tileset_s_00000015) ? @Tileset_e_00000015-@Tileset_s_00000015 : 0 \
		,	defined(@Tileset_s_00000016) ? @Tileset_e_00000016-@Tileset_s_00000016 : 0 \
		,	defined(@Tileset_s_00000017) ? @Tileset_e_00000017-@Tileset_s_00000017 : 0 \
		,	defined(@Tileset_s_00000018) ? @Tileset_e_00000018-@Tileset_s_00000018 : 0 \
		,	defined(@Tileset_s_00000019) ? @Tileset_e_00000019-@Tileset_s_00000019 : 0 \
		,	defined(@Tileset_s_0000001a) ? @Tileset_e_0000001a-@Tileset_s_0000001a : 0 \
		,	defined(@Tileset_s_0000001b) ? @Tileset_e_0000001b-@Tileset_s_0000001b : 0 \
		,	defined(@Tileset_s_0000001c) ? @Tileset_e_0000001c-@Tileset_s_0000001c : 0 \
		,	defined(@Tileset_s_0000001d) ? @Tileset_e_0000001d-@Tileset_s_0000001d : 0 \
		,	defined(@Tileset_s_0000001e) ? @Tileset_e_0000001e-@Tileset_s_0000001e : 0 \
		,	defined(@Tileset_s_0000001f) ? @Tileset_e_0000001f-@Tileset_s_0000001f : 0 \
		,	defined(@Tileset_s_00000020) ? @Tileset_e_00000020-@Tileset_s_00000020 : 0 \
		,	defined(@Tileset_s_00000021) ? @Tileset_e_00000021-@Tileset_s_00000021 : 0 \
		,	defined(@Tileset_s_00000022) ? @Tileset_e_00000022-@Tileset_s_00000022 : 0 \
		,	defined(@Tileset_s_00000023) ? @Tileset_e_00000023-@Tileset_s_00000023 : 0 \
		,	defined(@Tileset_s_00000024) ? @Tileset_e_00000024-@Tileset_s_00000024 : 0 \
		,	defined(@Tileset_s_00000025) ? @Tileset_e_00000025-@Tileset_s_00000025 : 0 \
		,	defined(@Tileset_s_00000026) ? @Tileset_e_00000026-@Tileset_s_00000026 : 0 \
		,	defined(@Tileset_s_00000027) ? @Tileset_e_00000027-@Tileset_s_00000027 : 0 \
		,	defined(@Tileset_s_00000028) ? @Tileset_e_00000028-@Tileset_s_00000028 : 0 \
		,	defined(@Tileset_s_00000029) ? @Tileset_e_00000029-@Tileset_s_00000029 : 0 \
		,	defined(@Tileset_s_0000002a) ? @Tileset_e_0000002a-@Tileset_s_0000002a : 0 \
		,	defined(@Tileset_s_0000002b) ? @Tileset_e_0000002b-@Tileset_s_0000002b : 0 \
		,	defined(@Tileset_s_0000002c) ? @Tileset_e_0000002c-@Tileset_s_0000002c : 0 \
		,	defined(@Tileset_s_0000002d) ? @Tileset_e_0000002d-@Tileset_s_0000002d : 0 \
		,	defined(@Tileset_s_0000002e) ? @Tileset_e_0000002e-@Tileset_s_0000002e : 0 \
		,	defined(@Tileset_s_0000002f) ? @Tileset_e_0000002f-@Tileset_s_0000002f : 0 \
		,	defined(@Tileset_s_00000030) ? @Tileset_e_00000030-@Tileset_s_00000030 : 0 \
		,	defined(@Tileset_s_00000031) ? @Tileset_e_00000031-@Tileset_s_00000031 : 0 \
		,	defined(@Tileset_s_00000032) ? @Tileset_e_00000032-@Tileset_s_00000032 : 0 \
		,	defined(@Tileset_s_00000033) ? @Tileset_e_00000033-@Tileset_s_00000033 : 0 \
		,	defined(@Tileset_s_00000034) ? @Tileset_e_00000034-@Tileset_s_00000034 : 0 \
		,	defined(@Tileset_s_00000035) ? @Tileset_e_00000035-@Tileset_s_00000035 : 0 \
		,	defined(@Tileset_s_00000036) ? @Tileset_e_00000036-@Tileset_s_00000036 : 0 \
		,	defined(@Tileset_s_00000037) ? @Tileset_e_00000037-@Tileset_s_00000037 : 0 \
		,	defined(@Tileset_s_00000038) ? @Tileset_e_00000038-@Tileset_s_00000038 : 0 \
		,	defined(@Tileset_s_00000039) ? @Tileset_e_00000039-@Tileset_s_00000039 : 0 \
		,	defined(@Tileset_s_0000003a) ? @Tileset_e_0000003a-@Tileset_s_0000003a : 0 \
		,	defined(@Tileset_s_0000003b) ? @Tileset_e_0000003b-@Tileset_s_0000003b : 0 \
		,	defined(@Tileset_s_0000003c) ? @Tileset_e_0000003c-@Tileset_s_0000003c : 0 \
		,	defined(@Tileset_s_0000003d) ? @Tileset_e_0000003d-@Tileset_s_0000003d : 0 \
		,	defined(@Tileset_s_0000003e) ? @Tileset_e_0000003e-@Tileset_s_0000003e : 0 \
		,	defined(@Tileset_s_0000003f) ? @Tileset_e_0000003f-@Tileset_s_0000003f : 0 \
		)/TILE_SIZE
	// Total number of tiles
	.dh	(	(defined(@Tileset_s_00000000) ? @Tileset_l_00000000-@Tileset_s_00000000 : 0) \
		+	(defined(@Tileset_s_00000001) ? @Tileset_l_00000001-@Tileset_s_00000001 : 0) \
		+	(defined(@Tileset_s_00000002) ? @Tileset_l_00000002-@Tileset_s_00000002 : 0) \
		+	(defined(@Tileset_s_00000003) ? @Tileset_l_00000003-@Tileset_s_00000003 : 0) \
		+	(defined(@Tileset_s_00000004) ? @Tileset_l_00000004-@Tileset_s_00000004 : 0) \
		+	(defined(@Tileset_s_00000005) ? @Tileset_l_00000005-@Tileset_s_00000005 : 0) \
		+	(defined(@Tileset_s_00000006) ? @Tileset_l_00000006-@Tileset_s_00000006 : 0) \
		+	(defined(@Tileset_s_00000007) ? @Tileset_l_00000007-@Tileset_s_00000007 : 0) \
		+	(defined(@Tileset_s_00000008) ? @Tileset_l_00000008-@Tileset_s_00000008 : 0) \
		+	(defined(@Tileset_s_00000009) ? @Tileset_l_00000009-@Tileset_s_00000009 : 0) \
		+	(defined(@Tileset_s_0000000a) ? @Tileset_l_0000000a-@Tileset_s_0000000a : 0) \
		+	(defined(@Tileset_s_0000000b) ? @Tileset_l_0000000b-@Tileset_s_0000000b : 0) \
		+	(defined(@Tileset_s_0000000c) ? @Tileset_l_0000000c-@Tileset_s_0000000c : 0) \
		+	(defined(@Tileset_s_0000000d) ? @Tileset_l_0000000d-@Tileset_s_0000000d : 0) \
		+	(defined(@Tileset_s_0000000e) ? @Tileset_l_0000000e-@Tileset_s_0000000e : 0) \
		+	(defined(@Tileset_s_0000000f) ? @Tileset_l_0000000f-@Tileset_s_0000000f : 0) \
		+	(defined(@Tileset_s_00000010) ? @Tileset_l_00000010-@Tileset_s_00000010 : 0) \
		+	(defined(@Tileset_s_00000011) ? @Tileset_l_00000011-@Tileset_s_00000011 : 0) \
		+	(defined(@Tileset_s_00000012) ? @Tileset_l_00000012-@Tileset_s_00000012 : 0) \
		+	(defined(@Tileset_s_00000013) ? @Tileset_l_00000013-@Tileset_s_00000013 : 0) \
		+	(defined(@Tileset_s_00000014) ? @Tileset_l_00000014-@Tileset_s_00000014 : 0) \
		+	(defined(@Tileset_s_00000015) ? @Tileset_l_00000015-@Tileset_s_00000015 : 0) \
		+	(defined(@Tileset_s_00000016) ? @Tileset_l_00000016-@Tileset_s_00000016 : 0) \
		+	(defined(@Tileset_s_00000017) ? @Tileset_l_00000017-@Tileset_s_00000017 : 0) \
		+	(defined(@Tileset_s_00000018) ? @Tileset_l_00000018-@Tileset_s_00000018 : 0) \
		+	(defined(@Tileset_s_00000019) ? @Tileset_l_00000019-@Tileset_s_00000019 : 0) \
		+	(defined(@Tileset_s_0000001a) ? @Tileset_l_0000001a-@Tileset_s_0000001a : 0) \
		+	(defined(@Tileset_s_0000001b) ? @Tileset_l_0000001b-@Tileset_s_0000001b : 0) \
		+	(defined(@Tileset_s_0000001c) ? @Tileset_l_0000001c-@Tileset_s_0000001c : 0) \
		+	(defined(@Tileset_s_0000001d) ? @Tileset_l_0000001d-@Tileset_s_0000001d : 0) \
		+	(defined(@Tileset_s_0000001e) ? @Tileset_l_0000001e-@Tileset_s_0000001e : 0) \
		+	(defined(@Tileset_s_0000001f) ? @Tileset_l_0000001f-@Tileset_s_0000001f : 0) \
		+	(defined(@Tileset_s_00000020) ? @Tileset_l_00000020-@Tileset_s_00000020 : 0) \
		+	(defined(@Tileset_s_00000021) ? @Tileset_l_00000021-@Tileset_s_00000021 : 0) \
		+	(defined(@Tileset_s_00000022) ? @Tileset_l_00000022-@Tileset_s_00000022 : 0) \
		+	(defined(@Tileset_s_00000023) ? @Tileset_l_00000023-@Tileset_s_00000023 : 0) \
		+	(defined(@Tileset_s_00000024) ? @Tileset_l_00000024-@Tileset_s_00000024 : 0) \
		+	(defined(@Tileset_s_00000025) ? @Tileset_l_00000025-@Tileset_s_00000025 : 0) \
		+	(defined(@Tileset_s_00000026) ? @Tileset_l_00000026-@Tileset_s_00000026 : 0) \
		+	(defined(@Tileset_s_00000027) ? @Tileset_l_00000027-@Tileset_s_00000027 : 0) \
		+	(defined(@Tileset_s_00000028) ? @Tileset_l_00000028-@Tileset_s_00000028 : 0) \
		+	(defined(@Tileset_s_00000029) ? @Tileset_l_00000029-@Tileset_s_00000029 : 0) \
		+	(defined(@Tileset_s_0000002a) ? @Tileset_l_0000002a-@Tileset_s_0000002a : 0) \
		+	(defined(@Tileset_s_0000002b) ? @Tileset_l_0000002b-@Tileset_s_0000002b : 0) \
		+	(defined(@Tileset_s_0000002c) ? @Tileset_l_0000002c-@Tileset_s_0000002c : 0) \
		+	(defined(@Tileset_s_0000002d) ? @Tileset_l_0000002d-@Tileset_s_0000002d : 0) \
		+	(defined(@Tileset_s_0000002e) ? @Tileset_l_0000002e-@Tileset_s_0000002e : 0) \
		+	(defined(@Tileset_s_0000002f) ? @Tileset_l_0000002f-@Tileset_s_0000002f : 0) \
		+	(defined(@Tileset_s_00000030) ? @Tileset_l_00000030-@Tileset_s_00000030 : 0) \
		+	(defined(@Tileset_s_00000031) ? @Tileset_l_00000031-@Tileset_s_00000031 : 0) \
		+	(defined(@Tileset_s_00000032) ? @Tileset_l_00000032-@Tileset_s_00000032 : 0) \
		+	(defined(@Tileset_s_00000033) ? @Tileset_l_00000033-@Tileset_s_00000033 : 0) \
		+	(defined(@Tileset_s_00000034) ? @Tileset_l_00000034-@Tileset_s_00000034 : 0) \
		+	(defined(@Tileset_s_00000035) ? @Tileset_l_00000035-@Tileset_s_00000035 : 0) \
		+	(defined(@Tileset_s_00000036) ? @Tileset_l_00000036-@Tileset_s_00000036 : 0) \
		+	(defined(@Tileset_s_00000037) ? @Tileset_l_00000037-@Tileset_s_00000037 : 0) \
		+	(defined(@Tileset_s_00000038) ? @Tileset_l_00000038-@Tileset_s_00000038 : 0) \
		+	(defined(@Tileset_s_00000039) ? @Tileset_l_00000039-@Tileset_s_00000039 : 0) \
		+	(defined(@Tileset_s_0000003a) ? @Tileset_l_0000003a-@Tileset_s_0000003a : 0) \
		+	(defined(@Tileset_s_0000003b) ? @Tileset_l_0000003b-@Tileset_s_0000003b : 0) \
		+	(defined(@Tileset_s_0000003c) ? @Tileset_l_0000003c-@Tileset_s_0000003c : 0) \
		+	(defined(@Tileset_s_0000003d) ? @Tileset_l_0000003d-@Tileset_s_0000003d : 0) \
		+	(defined(@Tileset_s_0000003e) ? @Tileset_l_0000003e-@Tileset_s_0000003e : 0) \
		+	(defined(@Tileset_s_0000003f) ? @Tileset_l_0000003f-@Tileset_s_0000003f : 0) \
		)/TILE_SIZE
	// TilesetHeader size
	.dh	@TilesetHeader_e_00000000-@TilesetHeader_s_00000000
	.dh	0x00

	// TilesetEntries
	.ifdef @Tileset_s_00000000	:: .dh (@Tileset_e_00000000-@Tileset_s_00000000)/TILE_SIZE	:: .dh (@Tileset_s_00000000-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000001	:: .dh (@Tileset_e_00000001-@Tileset_s_00000001)/TILE_SIZE	:: .dh (@Tileset_s_00000001-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000002	:: .dh (@Tileset_e_00000002-@Tileset_s_00000002)/TILE_SIZE	:: .dh (@Tileset_s_00000002-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000003	:: .dh (@Tileset_e_00000003-@Tileset_s_00000003)/TILE_SIZE	:: .dh (@Tileset_s_00000003-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000004	:: .dh (@Tileset_e_00000004-@Tileset_s_00000004)/TILE_SIZE	:: .dh (@Tileset_s_00000004-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000005	:: .dh (@Tileset_e_00000005-@Tileset_s_00000005)/TILE_SIZE	:: .dh (@Tileset_s_00000005-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000006	:: .dh (@Tileset_e_00000006-@Tileset_s_00000006)/TILE_SIZE	:: .dh (@Tileset_s_00000006-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000007	:: .dh (@Tileset_e_00000007-@Tileset_s_00000007)/TILE_SIZE	:: .dh (@Tileset_s_00000007-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000008	:: .dh (@Tileset_e_00000008-@Tileset_s_00000008)/TILE_SIZE	:: .dh (@Tileset_s_00000008-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000009	:: .dh (@Tileset_e_00000009-@Tileset_s_00000009)/TILE_SIZE	:: .dh (@Tileset_s_00000009-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000a	:: .dh (@Tileset_e_0000000a-@Tileset_s_0000000a)/TILE_SIZE	:: .dh (@Tileset_s_0000000a-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000b	:: .dh (@Tileset_e_0000000b-@Tileset_s_0000000b)/TILE_SIZE	:: .dh (@Tileset_s_0000000b-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000c	:: .dh (@Tileset_e_0000000c-@Tileset_s_0000000c)/TILE_SIZE	:: .dh (@Tileset_s_0000000c-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000d	:: .dh (@Tileset_e_0000000d-@Tileset_s_0000000d)/TILE_SIZE	:: .dh (@Tileset_s_0000000d-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000e	:: .dh (@Tileset_e_0000000e-@Tileset_s_0000000e)/TILE_SIZE	:: .dh (@Tileset_s_0000000e-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000000f	:: .dh (@Tileset_e_0000000f-@Tileset_s_0000000f)/TILE_SIZE	:: .dh (@Tileset_s_0000000f-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000010	:: .dh (@Tileset_e_00000010-@Tileset_s_00000010)/TILE_SIZE	:: .dh (@Tileset_s_00000010-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000011	:: .dh (@Tileset_e_00000011-@Tileset_s_00000011)/TILE_SIZE	:: .dh (@Tileset_s_00000011-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000012	:: .dh (@Tileset_e_00000012-@Tileset_s_00000012)/TILE_SIZE	:: .dh (@Tileset_s_00000012-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000013	:: .dh (@Tileset_e_00000013-@Tileset_s_00000013)/TILE_SIZE	:: .dh (@Tileset_s_00000013-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000014	:: .dh (@Tileset_e_00000014-@Tileset_s_00000014)/TILE_SIZE	:: .dh (@Tileset_s_00000014-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000015	:: .dh (@Tileset_e_00000015-@Tileset_s_00000015)/TILE_SIZE	:: .dh (@Tileset_s_00000015-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000016	:: .dh (@Tileset_e_00000016-@Tileset_s_00000016)/TILE_SIZE	:: .dh (@Tileset_s_00000016-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000017	:: .dh (@Tileset_e_00000017-@Tileset_s_00000017)/TILE_SIZE	:: .dh (@Tileset_s_00000017-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000018	:: .dh (@Tileset_e_00000018-@Tileset_s_00000018)/TILE_SIZE	:: .dh (@Tileset_s_00000018-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000019	:: .dh (@Tileset_e_00000019-@Tileset_s_00000019)/TILE_SIZE	:: .dh (@Tileset_s_00000019-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001a	:: .dh (@Tileset_e_0000001a-@Tileset_s_0000001a)/TILE_SIZE	:: .dh (@Tileset_s_0000001a-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001b	:: .dh (@Tileset_e_0000001b-@Tileset_s_0000001b)/TILE_SIZE	:: .dh (@Tileset_s_0000001b-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001c	:: .dh (@Tileset_e_0000001c-@Tileset_s_0000001c)/TILE_SIZE	:: .dh (@Tileset_s_0000001c-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001d	:: .dh (@Tileset_e_0000001d-@Tileset_s_0000001d)/TILE_SIZE	:: .dh (@Tileset_s_0000001d-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001e	:: .dh (@Tileset_e_0000001e-@Tileset_s_0000001e)/TILE_SIZE	:: .dh (@Tileset_s_0000001e-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000001f	:: .dh (@Tileset_e_0000001f-@Tileset_s_0000001f)/TILE_SIZE	:: .dh (@Tileset_s_0000001f-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000020	:: .dh (@Tileset_e_00000020-@Tileset_s_00000020)/TILE_SIZE	:: .dh (@Tileset_s_00000020-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000021	:: .dh (@Tileset_e_00000021-@Tileset_s_00000021)/TILE_SIZE	:: .dh (@Tileset_s_00000021-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000022	:: .dh (@Tileset_e_00000022-@Tileset_s_00000022)/TILE_SIZE	:: .dh (@Tileset_s_00000022-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000023	:: .dh (@Tileset_e_00000023-@Tileset_s_00000023)/TILE_SIZE	:: .dh (@Tileset_s_00000023-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000024	:: .dh (@Tileset_e_00000024-@Tileset_s_00000024)/TILE_SIZE	:: .dh (@Tileset_s_00000024-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000025	:: .dh (@Tileset_e_00000025-@Tileset_s_00000025)/TILE_SIZE	:: .dh (@Tileset_s_00000025-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000026	:: .dh (@Tileset_e_00000026-@Tileset_s_00000026)/TILE_SIZE	:: .dh (@Tileset_s_00000026-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000027	:: .dh (@Tileset_e_00000027-@Tileset_s_00000027)/TILE_SIZE	:: .dh (@Tileset_s_00000027-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000028	:: .dh (@Tileset_e_00000028-@Tileset_s_00000028)/TILE_SIZE	:: .dh (@Tileset_s_00000028-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000029	:: .dh (@Tileset_e_00000029-@Tileset_s_00000029)/TILE_SIZE	:: .dh (@Tileset_s_00000029-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002a	:: .dh (@Tileset_e_0000002a-@Tileset_s_0000002a)/TILE_SIZE	:: .dh (@Tileset_s_0000002a-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002b	:: .dh (@Tileset_e_0000002b-@Tileset_s_0000002b)/TILE_SIZE	:: .dh (@Tileset_s_0000002b-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002c	:: .dh (@Tileset_e_0000002c-@Tileset_s_0000002c)/TILE_SIZE	:: .dh (@Tileset_s_0000002c-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002d	:: .dh (@Tileset_e_0000002d-@Tileset_s_0000002d)/TILE_SIZE	:: .dh (@Tileset_s_0000002d-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002e	:: .dh (@Tileset_e_0000002e-@Tileset_s_0000002e)/TILE_SIZE	:: .dh (@Tileset_s_0000002e-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000002f	:: .dh (@Tileset_e_0000002f-@Tileset_s_0000002f)/TILE_SIZE	:: .dh (@Tileset_s_0000002f-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000030	:: .dh (@Tileset_e_00000030-@Tileset_s_00000030)/TILE_SIZE	:: .dh (@Tileset_s_00000030-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000031	:: .dh (@Tileset_e_00000031-@Tileset_s_00000031)/TILE_SIZE	:: .dh (@Tileset_s_00000031-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000032	:: .dh (@Tileset_e_00000032-@Tileset_s_00000032)/TILE_SIZE	:: .dh (@Tileset_s_00000032-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000033	:: .dh (@Tileset_e_00000033-@Tileset_s_00000033)/TILE_SIZE	:: .dh (@Tileset_s_00000033-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000034	:: .dh (@Tileset_e_00000034-@Tileset_s_00000034)/TILE_SIZE	:: .dh (@Tileset_s_00000034-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000035	:: .dh (@Tileset_e_00000035-@Tileset_s_00000035)/TILE_SIZE	:: .dh (@Tileset_s_00000035-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000036	:: .dh (@Tileset_e_00000036-@Tileset_s_00000036)/TILE_SIZE	:: .dh (@Tileset_s_00000036-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000037	:: .dh (@Tileset_e_00000037-@Tileset_s_00000037)/TILE_SIZE	:: .dh (@Tileset_s_00000037-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000038	:: .dh (@Tileset_e_00000038-@Tileset_s_00000038)/TILE_SIZE	:: .dh (@Tileset_s_00000038-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_00000039	:: .dh (@Tileset_e_00000039-@Tileset_s_00000039)/TILE_SIZE	:: .dh (@Tileset_s_00000039-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003a	:: .dh (@Tileset_e_0000003a-@Tileset_s_0000003a)/TILE_SIZE	:: .dh (@Tileset_s_0000003a-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003b	:: .dh (@Tileset_e_0000003b-@Tileset_s_0000003b)/TILE_SIZE	:: .dh (@Tileset_s_0000003b-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003c	:: .dh (@Tileset_e_0000003c-@Tileset_s_0000003c)/TILE_SIZE	:: .dh (@Tileset_s_0000003c-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003d	:: .dh (@Tileset_e_0000003d-@Tileset_s_0000003d)/TILE_SIZE	:: .dh (@Tileset_s_0000003d-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003e	:: .dh (@Tileset_e_0000003e-@Tileset_s_0000003e)/TILE_SIZE	:: .dh (@Tileset_s_0000003e-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
	.ifdef @Tileset_s_0000003f	:: .dh (@Tileset_e_0000003f-@Tileset_s_0000003f)/TILE_SIZE	:: .dh (@Tileset_s_0000003f-@TilesetHeader_e_00000000)/TILE_SIZE	:: .endif
@e:
.endmacro

.macro	Tileset,path,dupe
.if dupe == 0
@s:
	.import	path
@l:
@e:
.else
	.org .-filesize(path)
@s:
@l:
	.skip filesize(path)
@e:
.endif
.endmacro

.macro	PaletteHeader
@s:
	.dh	COLOR_DEPTH
	.dh	PAL_SIZE
.endmacro

.macro	Palette,path
	.import	path
	.align	COLOR_SIZE
.endmacro

.macro	AnimationHeader
@s:
	.dh	(@AnimationHeader_e_00000000-@AnimationHeader_d_00000000)/0x4
	.dh	0x0

@d:
	// AnimationEntries
	.ifdef @Animation_s_00000000	:: .dw @Animation_s_00000000-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000001	:: .dw @Animation_s_00000001-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000002	:: .dw @Animation_s_00000002-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000003	:: .dw @Animation_s_00000003-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000004	:: .dw @Animation_s_00000004-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000005	:: .dw @Animation_s_00000005-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000006	:: .dw @Animation_s_00000006-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000007	:: .dw @Animation_s_00000007-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000008	:: .dw @Animation_s_00000008-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000009	:: .dw @Animation_s_00000009-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000a	:: .dw @Animation_s_0000000a-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000b	:: .dw @Animation_s_0000000b-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000c	:: .dw @Animation_s_0000000c-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000d	:: .dw @Animation_s_0000000d-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000e	:: .dw @Animation_s_0000000e-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000000f	:: .dw @Animation_s_0000000f-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000010	:: .dw @Animation_s_00000010-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000011	:: .dw @Animation_s_00000011-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000012	:: .dw @Animation_s_00000012-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000013	:: .dw @Animation_s_00000013-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000014	:: .dw @Animation_s_00000014-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000015	:: .dw @Animation_s_00000015-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000016	:: .dw @Animation_s_00000016-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000017	:: .dw @Animation_s_00000017-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000018	:: .dw @Animation_s_00000018-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000019	:: .dw @Animation_s_00000019-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001a	:: .dw @Animation_s_0000001a-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001b	:: .dw @Animation_s_0000001b-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001c	:: .dw @Animation_s_0000001c-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001d	:: .dw @Animation_s_0000001d-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001e	:: .dw @Animation_s_0000001e-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000001f	:: .dw @Animation_s_0000001f-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000020	:: .dw @Animation_s_00000020-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000021	:: .dw @Animation_s_00000021-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000022	:: .dw @Animation_s_00000022-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000023	:: .dw @Animation_s_00000023-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000024	:: .dw @Animation_s_00000024-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000025	:: .dw @Animation_s_00000025-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000026	:: .dw @Animation_s_00000026-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000027	:: .dw @Animation_s_00000027-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000028	:: .dw @Animation_s_00000028-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000029	:: .dw @Animation_s_00000029-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002a	:: .dw @Animation_s_0000002a-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002b	:: .dw @Animation_s_0000002b-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002c	:: .dw @Animation_s_0000002c-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002d	:: .dw @Animation_s_0000002d-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002e	:: .dw @Animation_s_0000002e-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000002f	:: .dw @Animation_s_0000002f-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000030	:: .dw @Animation_s_00000030-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000031	:: .dw @Animation_s_00000031-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000032	:: .dw @Animation_s_00000032-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000033	:: .dw @Animation_s_00000033-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000034	:: .dw @Animation_s_00000034-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000035	:: .dw @Animation_s_00000035-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000036	:: .dw @Animation_s_00000036-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000037	:: .dw @Animation_s_00000037-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000038	:: .dw @Animation_s_00000038-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_00000039	:: .dw @Animation_s_00000039-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003a	:: .dw @Animation_s_0000003a-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003b	:: .dw @Animation_s_0000003b-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003c	:: .dw @Animation_s_0000003c-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003d	:: .dw @Animation_s_0000003d-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003e	:: .dw @Animation_s_0000003e-@AnimationHeader_s_00000000	:: .endif
	.ifdef @Animation_s_0000003f	:: .dw @Animation_s_0000003f-@AnimationHeader_s_00000000	:: .endif
@e:
.endmacro

.macro	Animation
@s:
.endmacro

.macro	AnimationFrame,sprite,delay,loop,palette
	.db	sprite
	.db	delay
	.db	loop
	.db	palette
.endmacro

.macro	SpriteHeader
@s:
	.dh	(@SpriteHeader_e_00000000-@SpriteHeader_d_00000000)/0x4
	.dh	0x0

@d:
	// SpriteEntries
	.ifdef @Sprite_s_00000000	:: .dw @Sprite_s_00000000-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000001	:: .dw @Sprite_s_00000001-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000002	:: .dw @Sprite_s_00000002-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000003	:: .dw @Sprite_s_00000003-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000004	:: .dw @Sprite_s_00000004-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000005	:: .dw @Sprite_s_00000005-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000006	:: .dw @Sprite_s_00000006-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000007	:: .dw @Sprite_s_00000007-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000008	:: .dw @Sprite_s_00000008-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000009	:: .dw @Sprite_s_00000009-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000a	:: .dw @Sprite_s_0000000a-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000b	:: .dw @Sprite_s_0000000b-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000c	:: .dw @Sprite_s_0000000c-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000d	:: .dw @Sprite_s_0000000d-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000e	:: .dw @Sprite_s_0000000e-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000000f	:: .dw @Sprite_s_0000000f-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000010	:: .dw @Sprite_s_00000010-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000011	:: .dw @Sprite_s_00000011-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000012	:: .dw @Sprite_s_00000012-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000013	:: .dw @Sprite_s_00000013-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000014	:: .dw @Sprite_s_00000014-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000015	:: .dw @Sprite_s_00000015-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000016	:: .dw @Sprite_s_00000016-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000017	:: .dw @Sprite_s_00000017-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000018	:: .dw @Sprite_s_00000018-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000019	:: .dw @Sprite_s_00000019-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001a	:: .dw @Sprite_s_0000001a-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001b	:: .dw @Sprite_s_0000001b-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001c	:: .dw @Sprite_s_0000001c-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001d	:: .dw @Sprite_s_0000001d-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001e	:: .dw @Sprite_s_0000001e-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000001f	:: .dw @Sprite_s_0000001f-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000020	:: .dw @Sprite_s_00000020-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000021	:: .dw @Sprite_s_00000021-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000022	:: .dw @Sprite_s_00000022-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000023	:: .dw @Sprite_s_00000023-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000024	:: .dw @Sprite_s_00000024-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000025	:: .dw @Sprite_s_00000025-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000026	:: .dw @Sprite_s_00000026-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000027	:: .dw @Sprite_s_00000027-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000028	:: .dw @Sprite_s_00000028-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000029	:: .dw @Sprite_s_00000029-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002a	:: .dw @Sprite_s_0000002a-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002b	:: .dw @Sprite_s_0000002b-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002c	:: .dw @Sprite_s_0000002c-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002d	:: .dw @Sprite_s_0000002d-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002e	:: .dw @Sprite_s_0000002e-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000002f	:: .dw @Sprite_s_0000002f-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000030	:: .dw @Sprite_s_00000030-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000031	:: .dw @Sprite_s_00000031-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000032	:: .dw @Sprite_s_00000032-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000033	:: .dw @Sprite_s_00000033-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000034	:: .dw @Sprite_s_00000034-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000035	:: .dw @Sprite_s_00000035-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000036	:: .dw @Sprite_s_00000036-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000037	:: .dw @Sprite_s_00000037-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000038	:: .dw @Sprite_s_00000038-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_00000039	:: .dw @Sprite_s_00000039-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003a	:: .dw @Sprite_s_0000003a-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003b	:: .dw @Sprite_s_0000003b-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003c	:: .dw @Sprite_s_0000003c-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003d	:: .dw @Sprite_s_0000003d-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003e	:: .dw @Sprite_s_0000003e-@SpriteHeader_s_00000000	:: .endif
	.ifdef @Sprite_s_0000003f	:: .dw @Sprite_s_0000003f-@SpriteHeader_s_00000000	:: .endif
@e:
.endmacro

.macro	Sprite
@s:
.endmacro

.macro	SpriteObject,tile,x,y,size,flip,last
	.db	((tile>>(0+TILE_SHIFT)) & 0xFF)
	.db	x
	.db	y
	.db	((size>>0) & 0xFF)
	.db	((size>>8) & 0xFF)
	.db	flip
	.db	last
	.db	((tile>>(8+TILE_SHIFT)) & 0x03)
.endmacro
