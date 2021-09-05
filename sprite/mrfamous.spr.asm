.include "sprite/template.asm"

.gba
.create TEMP+"/mrfamous.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/mrfamous-front.img.bin",    0	// 0
	Tileset	TEMP+"/mrfamous-front.img.bin",    1	// 1
	Tileset	TEMP+"/mrfamous-back.img.bin",     0	// 2
	Tileset	TEMP+"/mrfamous-back.img.bin",     1	// 3
	Tileset TEMP+"/mrfamous-inactive.img.bin", 0	// 4

	PaletteHeader
	Palette	TEMP+"/mrfamous.pal.bin"

	AnimationHeader
	Animation // 0: face north
		AnimationFrame	 3, 4,ANIM_LOOP,0
	Animation // 1: face northeast
		AnimationFrame	 3, 4,ANIM_LOOP,0
	Animation // 2: face east
		AnimationFrame	 0, 4,ANIM_LOOP,0
	Animation // 3: face southeast
		AnimationFrame	 0, 4,ANIM_LOOP,0
	Animation // 4: face south
		AnimationFrame	 1, 4,ANIM_LOOP,0
	Animation // 5: face southwest
		AnimationFrame	 1, 4,ANIM_LOOP,0
	Animation // 6: face west
		AnimationFrame	 2, 4,ANIM_LOOP,0
	Animation // 7: face northwest
		AnimationFrame	 2, 4,ANIM_LOOP,0
	Animation // 8: inactive
		AnimationFrame	 4, 4,ANIM_LOOP,0

	SpriteHeader
	Sprite	// 0: face southeast
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	-12,	-27,	SIZE_16x32,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-27,	SIZE_8x32,	FLIP_NONE,	0	// body
		SpriteObject	 14,	 12,	-21,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 16,	-12,	-43,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 20,	  4,	-43,	SIZE_8x16,	FLIP_NONE,	1	// body
	Sprite	// 1: face southwest
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 4,	-27,	SIZE_16x32,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-27,	SIZE_8x32,	FLIP_HORI,	0	// body
		SpriteObject	 14,	-20,	-21,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 16,	- 4,	-43,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 20,	-12,	-43,	SIZE_8x16,	FLIP_HORI,	1	// body
	Sprite	// 2: face northwest
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 4,	-27,	SIZE_16x32,	FLIP_NONE,	0	// body
		SpriteObject	 10,	-12,	-27,	SIZE_8x32,	FLIP_NONE,	0	// body
		SpriteObject	 14,	-20,	-19,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 16,	- 4,	-43,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 20,	-12,	-43,	SIZE_8x16,	FLIP_NONE,	1	// body
	Sprite	// 3: face northeast
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	-12,	-27,	SIZE_16x32,	FLIP_HORI,	0	// body
		SpriteObject	 10,	  4,	-27,	SIZE_8x32,	FLIP_HORI,	0	// body
		SpriteObject	 14,	 12,	-19,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 16,	-12,	-43,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 20,	  4,	-43,	SIZE_8x16,	FLIP_HORI,	1	// body
	Sprite	// 4: inactive
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 3,	-27,	SIZE_16x32,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-11,	-27,	SIZE_8x32,	FLIP_HORI,	0	// body
		SpriteObject	 14,	-19,	-11,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 16,	- 3,	-43,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 20,	-11,	-43,	SIZE_8x16,	FLIP_HORI,	1	// body

.close
