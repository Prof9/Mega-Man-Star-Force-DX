.include "sprite/template.asm"

.gba
.create TEMP+"/mettenna.spr.bin",0

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
	Tileset	TEMP+"/mettenna-back.img.bin",0		// 12
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 13
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 14
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 15
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 16
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 17
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 18
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 19
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 20
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 21
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 22
	Tileset	TEMP+"/mettenna-back.img.bin",1		// 23
	Tileset	TEMP+"/mettenna-front.img.bin",0	// 24
	Tileset	TEMP+"/mettenna-front.img.bin",1	// 25

	PaletteHeader
	Palette	TEMP+"/mettenna.pal.bin"

	AnimationHeader
	Animation // face north
		AnimationFrame	12,25,ANIM_NEXT,0
		AnimationFrame	13, 8,ANIM_NEXT,0
		AnimationFrame	14, 5,ANIM_NEXT,0
		AnimationFrame	15, 3,ANIM_NEXT,0
		AnimationFrame	16, 8,ANIM_NEXT,0
		AnimationFrame	14, 5,ANIM_NEXT,0
		AnimationFrame	17, 3,ANIM_LOOP,0
	Animation // face northeast
		AnimationFrame	12,25,ANIM_NEXT,0
		AnimationFrame	13, 8,ANIM_NEXT,0
		AnimationFrame	14, 5,ANIM_NEXT,0
		AnimationFrame	15, 3,ANIM_NEXT,0
		AnimationFrame	16, 8,ANIM_NEXT,0
		AnimationFrame	14, 5,ANIM_NEXT,0
		AnimationFrame	17, 3,ANIM_LOOP,0
	Animation // face east
		AnimationFrame	 6,25,ANIM_NEXT,0
		AnimationFrame	 7, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	 9, 3,ANIM_NEXT,0
		AnimationFrame	10, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	11, 3,ANIM_LOOP,0
	Animation // face southeast
		AnimationFrame	 6,25,ANIM_NEXT,0
		AnimationFrame	 7, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	 9, 3,ANIM_NEXT,0
		AnimationFrame	10, 8,ANIM_NEXT,0
		AnimationFrame	 8, 5,ANIM_NEXT,0
		AnimationFrame	11, 3,ANIM_LOOP,0
	Animation // face south
		AnimationFrame	 0,25,ANIM_NEXT,0
		AnimationFrame	 1, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 3, 3,ANIM_NEXT,0
		AnimationFrame	 4, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 5, 3,ANIM_LOOP,0
	Animation // face southwest
		AnimationFrame	 0,25,ANIM_NEXT,0
		AnimationFrame	 1, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 3, 3,ANIM_NEXT,0
		AnimationFrame	 4, 8,ANIM_NEXT,0
		AnimationFrame	 2, 5,ANIM_NEXT,0
		AnimationFrame	 5, 3,ANIM_LOOP,0
	Animation // face west
		AnimationFrame	18,25,ANIM_NEXT,0
		AnimationFrame	19, 8,ANIM_NEXT,0
		AnimationFrame	20, 5,ANIM_NEXT,0
		AnimationFrame	21, 3,ANIM_NEXT,0
		AnimationFrame	22, 8,ANIM_NEXT,0
		AnimationFrame	20, 5,ANIM_NEXT,0
		AnimationFrame	23, 3,ANIM_LOOP,0
	Animation // face northwest
		AnimationFrame	18,25,ANIM_NEXT,0
		AnimationFrame	19, 8,ANIM_NEXT,0
		AnimationFrame	20, 5,ANIM_NEXT,0
		AnimationFrame	21, 3,ANIM_NEXT,0
		AnimationFrame	22, 8,ANIM_NEXT,0
		AnimationFrame	20, 5,ANIM_NEXT,0
		AnimationFrame	23, 3,ANIM_LOOP,0
	Animation // shiver southwest
		AnimationFrame	 0, 2,ANIM_NEXT,0
		AnimationFrame	24, 2,ANIM_LOOP,0

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

	Sprite	// 12: face northeast, frame 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-21,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-21,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 5,	SIZE_16x8,	FLIP_NONE,	1	// body
	Sprite	// 13: face northeast, frame 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	-22,	-23,	SIZE_16x8,	FLIP_HORI,	1	// antenna
	Sprite	// 14: face northeast, frame 2
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	-24,	-25,	SIZE_16x8,	FLIP_HORI,	0	// antenna
		SpriteObject	 16,	-26,	-32,	SIZE_16x16,	FLIP_HORI,	1	// antenna
	Sprite	// 15: face northeast, frame 3
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-19,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-19,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 3,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 16,	-29,	-35,	SIZE_16x16,	FLIP_HORI,	1	// antenna
	Sprite	// 16: face northeast, frame 4
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-19,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-19,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 3,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 14,	-22,	-23,	SIZE_16x8,	FLIP_HORI,	1	// antenna
	Sprite	// 17: face northeast, frame 5
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 9,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	-12,	-20,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  4,	-20,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	-12,	- 4,	SIZE_16x8,	FLIP_NONE,	0	// body
		SpriteObject	 16,	-29,	-35,	SIZE_16x16,	FLIP_HORI,	1	// antenna

	Sprite	// 18: face northwest, frame 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-21,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-21,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 5,	SIZE_16x8,	FLIP_HORI,	1	// body
	Sprite	// 19: face northwest, frame 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	  6,	-23,	SIZE_16x8,	FLIP_NONE,	1	// antenna
	Sprite	// 20: face northwest, frame 2
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	  8,	-25,	SIZE_16x8,	FLIP_NONE,	0	// antenna
		SpriteObject	 16,	 10,	-32,	SIZE_16x16,	FLIP_NONE,	1	// antenna
	Sprite	// 21: face northwest, frame 3
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-19,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-19,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 3,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 16,	 13,	-35,	SIZE_16x16,	FLIP_NONE,	1	// antenna
	Sprite	// 22: face northwest, frame 4
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-19,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-19,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 3,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 14,	  6,	-23,	SIZE_16x8,	FLIP_NONE,	1	// antenna
	Sprite	// 23: face northwest, frame 5
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 7,	- 7,	SIZE_16x16,	FLIP_HORI,	0	// feet
		SpriteObject	  6,	- 4,	-20,	SIZE_16x16,	FLIP_HORI,	0	// body
		SpriteObject	 10,	-12,	-20,	SIZE_8x16,	FLIP_HORI,	0	// body
		SpriteObject	 12,	- 4,	- 4,	SIZE_16x8,	FLIP_HORI,	0	// body
		SpriteObject	 16,	 13,	-35,	SIZE_16x16,	FLIP_NONE,	1	// antenna

	Sprite	// 24: shiver southwest, frame 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	0	// shadow
		SpriteObject	  2,	- 8,	- 7,	SIZE_16x16,	FLIP_NONE,	0	// feet
		SpriteObject	  6,	- 8,	-21,	SIZE_16x16,	FLIP_NONE,	0	// body
		SpriteObject	 10,	  8,	-21,	SIZE_8x16,	FLIP_NONE,	0	// body
		SpriteObject	 12,	- 8,	- 5,	SIZE_16x8,	FLIP_NONE,	1	// body

.close
