# Mega Man Star Force DX

This repository holds the source code for Mega Man Star Force DX.

**Looking for the download link? Grab the patch from [The Rockman EXE Zone](https://forums.therockmanexezone.com/mega-man-star-force-dx-t16546.html)!**

## Reporting Bugs

Please report any bugs and suggestions in the project topic on The Rockman EXE
Zone Forums:

[https://forums.therockmanexezone.com/mega-man-star-force-dx-t16546.html](https://forums.therockmanexezone.com/mega-man-star-force-dx-t16546.html)

## Credits

 *  **[happy man](https://discord.gg/RNmVBkn)** - Textures
 *  **[Jumi](https://twitter.com/JumpKain)** - Translation
 *  **[MegaRockEXE](https://twitter.com/megarock_exe)** - Graphic Design
 *  **[MidniteW](https://twitter.com/MidniteW)** - Sprites, Textures
 *  **[Prof. 9](https://twitter.com/Prof9)** - Planning, Programming, Editing
 *  **[Salad](https://twitter.com/saladdammit)** - Textures

## Setup

Place the following ROM files in the `_rom` folder. See `_rom\roms_go_here.txt`
for details.

* Mega Man Star Force: Pegasus - US version
* Mega Man Star Force: Leo - US version
* Mega Man Star Force: Dragon - US version
* Mega Man Star Force 2: Zerker x Saurian / Zerker x Ninja - JP or US version
* Mega Man Star Force 3: Black Ace / Red Joker - JP or US version

Place the required third-party tools in the `_tools` folder. See
`_tools\tools_go_here.txt` for details.

 *  **[armips](https://github.com/Kingcom/armips/)** by Kingcom. 
    [v0.11.0-140-g87d44e4](https://github.com/Kingcom/armips/tree/87d44e4db7cbdfc99b8808f2c345ffcc3bfd1ecd)
    is used, but any newer version should also work. (v0.11.0 stable does NOT
    work.)
 *  **[Nintendo DS/GBA Compressors](https://www.romhacking.net/utilities/826/)**
    by CUE. Version 1.4 is used, but any newer version should also work.
 *  **ndstool** from devkitPro. Version 2.1.2 is used, but any newer version
    should also work.

Compatible versions of [PixelPet](https://github.com/Prof9/PixelPet), [TextPet](https://github.com/Prof9/TextPet)
and [SFArcTool](https://github.com/Prof9/SFArcTool) are included.

You may also want to use [BNSpriteEditor](https://github.com/brianuuu/BNSpriteEditor)
by brianuuu to modify `.spr.bin` files.

## Building

Building is only supported on Windows 10 and up.

Run the following command:

```
make
```

This will produce the following files:

* `MegaManStarForceDX.nds` - Actual MMSF DX ROM.
* `MegaManStarForceDX.tpl` - Text dump (TextPet format).
* `MegaManStarForceDX.txt` - Text dump (plain text)

## Legal

This project is not endorsed by or affiliated with Capcom in any way. Mega Man
and Mega Man Star Force are registered trademarks of Capcom. All rights belong
to their respective owners.
