.include "sprite/template.asm"

.gba
.create TEMP+"/musicbox.spr.bin",0

	FileHeader

	TilesetHeader
	Tileset	TEMP+"/musicbox.img.bin",0

	PaletteHeader
	Palette	TEMP+"/musicbox.pal.bin"

	AnimationHeader
	Animation
		AnimationFrame	0,1,ANIM_LOOP,0

	SpriteHeader
	Sprite // 0
		//		tile	x	y	size		flip		last
		SpriteObject	  0,	-16,	-23,	SIZE_32x32,	FLIP_NONE,	1

.close
