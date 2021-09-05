.include "sprite/template.asm"

.gba
.create TEMP+"/mrfamous-face.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset TEMP+"/mrfamous-face-m0f0.img.bin",0	// 0
	Tileset TEMP+"/mrfamous-face-m0f1.img.bin",0	// 1
	Tileset TEMP+"/mrfamous-face-m0f2.img.bin",0	// 2
	Tileset TEMP+"/mrfamous-face-m1f0.img.bin",0	// 3
	Tileset TEMP+"/mrfamous-face-m1f1.img.bin",0	// 4
	Tileset TEMP+"/mrfamous-face-m1f2.img.bin",0	// 5
	Tileset TEMP+"/mrfamous-face-m2f0.img.bin",0	// 6
	Tileset TEMP+"/mrfamous-face-m2f1.img.bin",0	// 7
	Tileset TEMP+"/mrfamous-face-m2f2.img.bin",0	// 8

	PaletteHeader
	Palette	TEMP+"/mrfamous-face.pal.bin"

	AnimationHeader
	Animation // 0: default
		AnimationFrame	0,4,ANIM_LOOP,0		// Mouth closed, fur 1
	Animation // 1: idle
		AnimationFrame	0,4,ANIM_NEXT,0		// Mouth closed, fur 1
		AnimationFrame	1,4,ANIM_NEXT,0		// Mouth closed, fur 2
		AnimationFrame	2,4,ANIM_LOOP,0		// Mouth closed, fur 3
	Animation // 2: talking
		AnimationFrame	3,4,ANIM_NEXT,0		// Mouth big,    fur 1
		AnimationFrame	4,4,ANIM_NEXT,0		// Mouth big,    fur 2
		AnimationFrame	2,4,ANIM_NEXT,0		// Mouth closed, fur 3
		AnimationFrame	0,4,ANIM_NEXT,0		// Mouth closed, fur 1
		AnimationFrame	7,4,ANIM_NEXT,0		// Mouth small,  fur 2
		AnimationFrame	8,4,ANIM_NEXT,0		// Mouth small,  fur 3
		AnimationFrame	0,4,ANIM_NEXT,0		// Mouth closed, fur 1
		AnimationFrame	1,4,ANIM_NEXT,0		// Mouth closed, fur 2
		AnimationFrame	8,4,ANIM_NEXT,0		// Mouth small,  fur 3
		AnimationFrame	6,4,ANIM_NEXT,0		// Mouth small,  fur 1
		AnimationFrame	1,4,ANIM_NEXT,0		// Mouth closed, fur 2
		AnimationFrame	2,4,ANIM_LOOP,0		// Mouth closed, fur 3
	Animation // 3: fur 1 talking
		AnimationFrame	3,2,(ANIM_NEXT|0|0),0	// Mouth big,    fur 1
		AnimationFrame	4,2,(ANIM_NEXT|1|4),0	// Mouth big,    fur 2
		AnimationFrame	4,2,(ANIM_NEXT|1|0),0	// Mouth big,    fur 2
		AnimationFrame	5,2,(ANIM_NEXT|2|4),0	// Mouth big,    fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_NEXT|0|4),0	// Mouth closed, fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_NEXT|1|4),0	// Mouth closed, fur 2
		AnimationFrame	7,2,(ANIM_NEXT|1|0),0	// Mouth small,  fur 2
		AnimationFrame	8,2,(ANIM_NEXT|2|4),0	// Mouth small,  fur 3
		AnimationFrame	8,2,(ANIM_NEXT|2|0),0	// Mouth small,  fur 3
		AnimationFrame	6,2,(ANIM_NEXT|0|4),0	// Mouth small,  fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_NEXT|1|4),0	// Mouth closed, fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_NEXT|2|4),0	// Mouth closed, fur 3
		AnimationFrame	8,2,(ANIM_NEXT|2|0),0	// Mouth small,  fur 3
		AnimationFrame	6,2,(ANIM_NEXT|0|4),0	// Mouth small,  fur 1
		AnimationFrame	6,2,(ANIM_NEXT|0|0),0	// Mouth small,  fur 1
		AnimationFrame	7,2,(ANIM_NEXT|1|4),0	// Mouth small,  fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_NEXT|2|4),0	// Mouth closed, fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_LOOP|0|4),0	// Mouth closed, fur 1
	Animation // 4: fur 2 talking
		AnimationFrame	4,2,(ANIM_NEXT|1|0),0	// Mouth big,    fur 2
		AnimationFrame	5,2,(ANIM_NEXT|2|4),0	// Mouth big,    fur 3
		AnimationFrame	5,2,(ANIM_NEXT|2|0),0	// Mouth big,    fur 3
		AnimationFrame	3,2,(ANIM_NEXT|0|4),0	// Mouth big,    fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_NEXT|1|4),0	// Mouth closed, fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_NEXT|2|4),0	// Mouth closed, fur 3
		AnimationFrame	8,2,(ANIM_NEXT|2|0),0	// Mouth small,  fur 3
		AnimationFrame	6,2,(ANIM_NEXT|0|4),0	// Mouth small,  fur 1
		AnimationFrame	6,2,(ANIM_NEXT|0|0),0	// Mouth small,  fur 1
		AnimationFrame	7,2,(ANIM_NEXT|1|4),0	// Mouth small,  fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_NEXT|2|4),0	// Mouth closed, fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_NEXT|0|4),0	// Mouth closed, fur 1
		AnimationFrame	6,2,(ANIM_NEXT|0|0),0	// Mouth small,  fur 1
		AnimationFrame	7,2,(ANIM_NEXT|1|4),0	// Mouth small,  fur 2
		AnimationFrame	7,2,(ANIM_NEXT|1|0),0	// Mouth small,  fur 2
		AnimationFrame	8,2,(ANIM_NEXT|2|4),0	// Mouth small,  fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_NEXT|0|4),0	// Mouth closed, fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_LOOP|1|4),0	// Mouth closed, fur 2
	Animation // 5: fur 3 talking
		AnimationFrame	5,2,(ANIM_NEXT|2|0),0	// Mouth big,    fur 3
		AnimationFrame	3,2,(ANIM_NEXT|0|4),0	// Mouth big,    fur 1
		AnimationFrame	3,2,(ANIM_NEXT|0|0),0	// Mouth big,    fur 1
		AnimationFrame	4,2,(ANIM_NEXT|1|4),0	// Mouth big,    fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_NEXT|2|4),0	// Mouth closed, fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_NEXT|0|4),0	// Mouth closed, fur 1
		AnimationFrame	6,2,(ANIM_NEXT|0|0),0	// Mouth small,  fur 1
		AnimationFrame	7,2,(ANIM_NEXT|1|4),0	// Mouth small,  fur 2
		AnimationFrame	7,2,(ANIM_NEXT|1|0),0	// Mouth small,  fur 2
		AnimationFrame	8,2,(ANIM_NEXT|2|4),0	// Mouth small,  fur 3
		AnimationFrame	2,2,(ANIM_NEXT|2|0),0	// Mouth closed, fur 3
		AnimationFrame	0,2,(ANIM_NEXT|0|4),0	// Mouth closed, fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_NEXT|1|4),0	// Mouth closed, fur 2
		AnimationFrame	7,2,(ANIM_NEXT|1|0),0	// Mouth small,  fur 2
		AnimationFrame	8,2,(ANIM_NEXT|2|4),0	// Mouth small,  fur 3
		AnimationFrame	8,2,(ANIM_NEXT|2|0),0	// Mouth small,  fur 3
		AnimationFrame	6,2,(ANIM_NEXT|0|4),0	// Mouth small,  fur 1
		AnimationFrame	0,2,(ANIM_NEXT|0|0),0	// Mouth closed, fur 1
		AnimationFrame	1,2,(ANIM_NEXT|1|4),0	// Mouth closed, fur 2
		AnimationFrame	1,2,(ANIM_NEXT|1|0),0	// Mouth closed, fur 2
		AnimationFrame	2,2,(ANIM_LOOP|2|4),0	// Mouth closed, fur 3

	SpriteHeader
	Sprite	// 0: Mouth closed, fur 1
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 1: Mouth closed, fur 2
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 2: Mouth closed, fur 3
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 3: Mouth big, fur 1
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 4: Mouth big, fur 2
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 5: Mouth big, fur 3
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 6: Mouth small, fur 1
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 7: Mouth small, fur 2
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1
	Sprite	// 8: Mouth small, fur 3
		//		tile	x	y	size		flip		last
		SpriteObject	 0,	-20,	-24,	SIZE_32x32,	FLIP_NONE,	0
		SpriteObject	16,	 12,	-24,	SIZE_8x32,	FLIP_NONE,	0
		SpriteObject	20,	-20,	  8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	28,	 12,	  8,	SIZE_8x16,	FLIP_NONE,	1

	// Put extra data in animation header
	.org @AnimationHeader_s_00000000 + 0x2
		.dh	0x1

.close
