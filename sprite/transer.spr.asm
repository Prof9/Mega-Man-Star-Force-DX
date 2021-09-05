.include "sprite/template.asm"

.gba
.create TEMP+"/transer.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/transer.img.bin",0
	Tileset	TEMP+"/transer.img.bin",1
	Tileset	TEMP+"/transer.img.bin",1

	PaletteHeader
	Palette	TEMP+"/transer.pal.bin"

	AnimationHeader
	Animation // 0: normal
		AnimationFrame	0,4,ANIM_LOOP,0
	Animation // 1: request
		AnimationFrame	1,4,ANIM_LOOP,0
	Animation // 2: in progress
		AnimationFrame	2,4,ANIM_LOOP,0

	SpriteHeader
	Sprite // 0: normal
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	-12,	-12,	SIZE_32x32,	FLIP_NONE,	1

	Sprite // 1: request
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	-12,	-12,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	 16,	  4,	- 3,	SIZE_16x16,	FLIP_NONE,	1

	Sprite // 2: in progress
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	-12,	-12,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	 20,	  4,	- 3,	SIZE_16x16,	FLIP_NONE,	1

.close
