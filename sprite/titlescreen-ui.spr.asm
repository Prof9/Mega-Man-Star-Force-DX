.include "sprite/template.asm"

.gba
.create TEMP+"/titlescreen-ui.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/titlescreen-ui-pressstart.img.bin",0	// 0: Press Start
	Tileset	TEMP+"/titlescreen-ui-newgame.img.bin",0	// 1: New Game
	Tileset	TEMP+"/titlescreen-ui-continue.img.bin",0	// 2: Continue
	Tileset	TEMP+"/titlescreen-ui-cursor1.img.bin",0	// 3: Cursor 1
	Tileset	TEMP+"/titlescreen-ui-cursor2.img.bin",0	// 4: Cursor 2
	Tileset	TEMP+"/titlescreen-ui-cursor3.img.bin",0	// 5: Cursor 3
	Tileset	TEMP+"/titlescreen-ui-cursor4.img.bin",0	// 6: Cursor 4
	Tileset	TEMP+"/titlescreen-ui-data.img.bin",0		// 7: Data 01
	Tileset	TEMP+"/titlescreen-ui-data.img.bin",1		// 8: Data 02

	PaletteHeader
	Palette	TEMP+"/titlescreen-ui.pal.bin"

	AnimationHeader
	Animation // 0: Press Start
		AnimationFrame	0,4,ANIM_LOOP,0
	Animation // 1: New Game
		AnimationFrame	1,4,ANIM_LOOP,0
	Animation // 2: Continue
		AnimationFrame	2,4,ANIM_LOOP,0
	Animation // 3: Cursor
		AnimationFrame	3,64,ANIM_NEXT,0
		AnimationFrame	4,4,ANIM_NEXT,0
		AnimationFrame	5,4,ANIM_NEXT,0
		AnimationFrame	6,2,ANIM_LOOP,0
	Animation // 4: Data 1
		AnimationFrame	7,4,ANIM_LOOP,0
	Animation // 5: Data 2
		AnimationFrame	8,4,ANIM_LOOP,0
	Animation // 6: Cursor frozen
		AnimationFrame	3,4,ANIM_LOOP,0

	SpriteHeader
	Sprite	// 0: Press Start
		//		tile	x	y	size		flip		last
		SpriteObject	 20,	 36,	- 8,	SIZE_8x16,	FLIP_NONE,	0
		SpriteObject	 16,	 20,	- 8,	SIZE_16x16,	FLIP_NONE,	0
		SpriteObject	  8,	-12,	- 8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	  0,	-44,	- 8,	SIZE_32x16,	FLIP_NONE,	1

	Sprite	// 1: New Game
		//		tile	x	y	size		flip		last
		SpriteObject	  8,	  8,	- 8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	  0,	-24,	- 8,	SIZE_32x16,	FLIP_NONE,	1

	Sprite	// 2: Continue
		//		tile	x	y	size		flip		last
		SpriteObject	  8,	  8,	- 8,	SIZE_32x16,	FLIP_NONE,	0
		SpriteObject	  0,	-24,	- 8,	SIZE_32x16,	FLIP_NONE,	1

	Sprite	// 3: Cursor 1
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 8,	SIZE_16x16,	FLIP_NONE,	1

	Sprite	// 4: Cursor 2
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 8,	SIZE_16x16,	FLIP_NONE,	1

	Sprite	// 5: Cursor 3
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 8,	SIZE_16x16,	FLIP_NONE,	1

	Sprite	// 6: Cursor 4
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	- 8,	- 8,	SIZE_16x16,	FLIP_NONE,	1

	Sprite	// 7: Data 1
		//		tile	x	y	size		flip		last
		SpriteObject	 10,	 24,	- 8,	SIZE_8x16,	FLIP_NONE,	0
		SpriteObject	  8,	 16,	- 8,	SIZE_8x16,	FLIP_NONE,	0
		SpriteObject	  0,	-16,	- 8,	SIZE_32x16,	FLIP_NONE,	1

	Sprite	// 8: Data 2
		//		tile	x	y	size		flip		last
		SpriteObject	 12,	 24,	- 8,	SIZE_8x16,	FLIP_NONE,	0
		SpriteObject	  8,	 16,	- 8,	SIZE_8x16,	FLIP_NONE,	0
		SpriteObject	  0,	-16,	- 8,	SIZE_32x16,	FLIP_NONE,	1

.close
