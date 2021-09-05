.include "sprite/template.asm"

.gba
.create TEMP+"/mettenna-simple.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/mettenna-front.img.bin",0	//  0
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  1
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  2
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  3
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  4
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  5
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  6
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  7
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  8
	Tileset	TEMP+"/mettenna-front.img.bin",1	//  9
	Tileset	TEMP+"/mettenna-front.img.bin",1	// 10
	Tileset	TEMP+"/mettenna-front.img.bin",1	// 11

	PaletteHeader
	Palette	TEMP+"/mettenna.pal.bin"

	AnimationHeader
	Animation // face southeast
		AnimationFrame	 6,25,ANIM_NEXT,0
		AnimationFrame	 7, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	 9, 3,ANIM_NEXT,0
		AnimationFrame	10, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	11, 3,ANIM_LOOP,0
	Animation // face southwest
		AnimationFrame	 0,25,ANIM_NEXT,0
		AnimationFrame	 1, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 3, 3,ANIM_NEXT,0
		AnimationFrame	 4, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 5, 3,ANIM_LOOP,0

	SpriteHeader
	Sprite	// 0: face southwest, frame 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-21,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-21,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 5,	SIZE_16x8,	FLIP_NONE,	1	// body
	Sprite	// 1: face southwest, frame 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	  6,	-24,	SIZE_16x8,	FLIP_NONE,	1	// antenna
	Sprite	// 2: face southwest, frame 2
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	  8,	-26,	SIZE_16x8,	FLIP_NONE,	0	// antenna
		SpriteObject	 16,	 10,	-33,	SIZE_16x16,	FLIP_NONE,	1	// antenna
	Sprite	// 3: face southwest, frame 3
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-19,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-19,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 3,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 16,	 13,	-36,	SIZE_16x16,	FLIP_NONE,	1	// antenna
	Sprite	// 4: face southwest, frame 4
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-19,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-19,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 3,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	  6,	-24,	SIZE_16x8,	FLIP_NONE,	1	// antenna
	Sprite	// 5: face southwest, frame 5
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 7,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  9,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 7,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 16,	 13,	-36,	SIZE_16x16,	FLIP_NONE,	1	// antenna

	Sprite	// 6: face southeast, frame 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-21,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-21,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 5,	SIZE_16x8,	FLIP_HORI,	1	// body
	Sprite	// 7: face southeast, frame 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	-22,	-24,	SIZE_16x8,	FLIP_HORI,	1	// antenna
	Sprite	// 8: face southeast, frame 2
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	-24,	-26,	SIZE_16x8,	FLIP_HORI,	0	// antenna
		SpriteObject	 16,	-26,	-33,	SIZE_16x16,	FLIP_HORI,	1	// antenna
	Sprite	// 9: face southeast, frame 3
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-19,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-19,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 3,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 16,	-29,	-36,	SIZE_16x16,	FLIP_HORI,	1	// antenna
	Sprite	// 10: face southeast, frame 4
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-19,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-19,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 3,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	-22,	-24,	SIZE_16x8,	FLIP_HORI,	1	// antenna
	Sprite	// 11: face southeast, frame 5
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 9,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-17,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 9,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 16,	-29,	-36,	SIZE_16x16,	FLIP_HORI,	1	// antenna

.close
