.include "sprite/template.asm"

.gba
.create TEMP+"/mirror.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/mirror.img.bin",0

	PaletteHeader
	Palette	TEMP+"/mirror.pal.bin"

	AnimationHeader
	Animation
		AnimationFrame	0,1,ANIM_LOOP,0

	SpriteHeader
	Sprite // 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0
		SpriteObject	 24,	- 4,	- 4,	SIZE_16x8,	FLIP_NONE,	0
		SpriteObject	 20,	  4,	-36,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	 18,	-12,	-12,	SIZE_16x8,	FLIP_NONE,	0
		SpriteObject	 14,	-12,	-28,	SIZE_16x16,	FLIP_NONE,	0
		SpriteObject	 10,	  4,	-52,	SIZE_16x16,	FLIP_NONE,	0
		SpriteObject	  2,	-12,	-60,	SIZE_16x32,	FLIP_NONE,	1

.close
