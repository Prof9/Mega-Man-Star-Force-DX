rem Library controls
tools\PixelPet.exe ^
Import-Bitmap "img\library-controls.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\library-controls2.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\library-controls.img.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\library-controls.map.bin"

rem Science Museum Pegasus Satellite
tools\PixelPet.exe ^
Import-Bitmap "img\museum-satellite.pal.png" Read-Palettes Convert-Palettes GBA ^
Serialize-Palettes Export-Bytes "%_TEMP%\museum-satellite.pal.bin"

rem Library NEW
tools\PixelPet.exe ^
Import-Bitmap "img\cardicons.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\library-new.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\library-new.img.bin"

rem Star Frag counter
tools\PixelPet.exe ^
Import-Bitmap "img\starfrag-counter.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\starfrag-counter.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y  0 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 16 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y 16 -w 32 -h  8 --append ^
Import-Bitmap "img\starfrag-counter-numbers.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  8 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 16 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 24 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 40 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 48 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 56 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 64 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 72 -y  0 -w  8 -h 16 --append ^
Import-Bitmap "img\starfrag-counter.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 24 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\starfrag-counter.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\starfrag-counter.pal.bin"

rem Mail sort menu
tools\PixelPet.exe ^
Import-Bitmap "img\mailsort.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mailsort.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\mailsort.img.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\mailsort.map.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mailsort.pal.bin"

rem NPC Transer Pegasus
tools\PixelPet.exe ^
Import-Bitmap "img\npc-transer-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\npc-transer-pegasus.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\subscreen\subscreen_051.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\subscreen\subscreen_052.bin" ^
Serialize-Palettes  Export-Bytes "%_TEMP%\subscreen\subscreen_053.bin"

rem NPC Transer Leo
tools\PixelPet.exe ^
Import-Bitmap "img\npc-transer-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\npc-transer-leo.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\subscreen\subscreen_054.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\subscreen\subscreen_055.bin" ^
Serialize-Palettes  Export-Bytes "%_TEMP%\subscreen\subscreen_056.bin"

rem NPC Transer Dragon
tools\PixelPet.exe ^
Import-Bitmap "img\npc-transer-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\npc-transer-dragon.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\subscreen\subscreen_057.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\subscreen\subscreen_058.bin" ^
Serialize-Palettes  Export-Bytes "%_TEMP%\subscreen\subscreen_059.bin"

rem NPC Transer Shin
tools\PixelPet.exe ^
Import-Bitmap "img\npc-transer-shin.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\npc-transer-shin.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\subscreen\subscreen_060.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\subscreen\subscreen_061.bin" ^
Serialize-Palettes  Export-Bytes "%_TEMP%\subscreen\subscreen_062.bin"

rem Personal
tools\PixelPet.exe ^
Import-Bitmap "img\personal-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-pegasus.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-pegasus.img.bin" ^
Serialize-Tilemap Export-Bytes "%_TEMP%\personal.map.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\personal-pegasus.pal.bin" ^
Import-Bitmap "img\personal-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-leo.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-leo.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\personal-leo.pal.bin" ^
Import-Bitmap "img\personal-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-dragon.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-dragon.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\personal-dragon.pal.bin"

rem Personal LV
tools\PixelPet.exe ^
Import-Bitmap "img\personal-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-pegasus-lv.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-pegasus-lv.img.bin" ^
Import-Bitmap "img\personal-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-leo-lv.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-leo-lv.img.bin" ^
Import-Bitmap "img\personal-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-dragon-lv.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-dragon-lv.img.bin"

rem Personal HP
tools\PixelPet.exe ^
Import-Bitmap "img\personal-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-pegasus-hp.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-pegasus-hp.img.bin" ^
Import-Bitmap "img\personal-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-leo-hp.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-leo-hp.img.bin" ^
Import-Bitmap "img\personal-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-dragon-hp.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-dragon-hp.img.bin"

rem Personal Favorite
tools\PixelPet.exe ^
Import-Bitmap "img\personal-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-pegasus-favorite.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-pegasus-favorite.img.bin" ^
Import-Bitmap "img\personal-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-leo-favorite.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-leo-favorite.img.bin" ^
Import-Bitmap "img\personal-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\personal-dragon-favorite.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\personal-dragon-favorite.img.bin"

rem Keyboard
tools\PixelPet.exe ^
Import-Bitmap "img\keyboard.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\keyboard-lower.png" Convert-Bitmap GBA ^
Pad-Tileset 4 ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  64 -w 16 -h 16 --append ^
Import-Bitmap "img\keyboard-upper.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  64 -w 16 -h 16 --append ^
Import-Bitmap "img\keyboard-special.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 128 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 144 -y  64 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 160 -y  64 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\keyboard.img.bin"

rem Credits images
tools\PixelPet.exe ^
Import-Bitmap "img\credits.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\credits.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP -x   0 -y   0 -w 320 -h 192 ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits1.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits1.img.bin" ^
Generate-Tilemap GBA-8BPP -x   0 -y 192 -w 320 -h 192 ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits2.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits2.img.bin" ^
Generate-Tilemap GBA-8BPP -x   0 -y 384 -w 320 -h 192 ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits3.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits3.img.bin"

rem Credits images
tools\PixelPet.exe ^
Import-Bitmap "img\credits.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\credits-pegasus.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits-pegasus.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits-pegasus.img.bin" ^
Import-Bitmap "img\credits-leo.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits-leo.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits-leo.img.bin" ^
Import-Bitmap "img\credits-dragon.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\credits-dragon.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\credits-dragon.img.bin"

rem ThermoMan image
tools\PixelPet.exe ^
Import-Bitmap "img\thermoman.png" Convert-Bitmap GBA ^
Extract-Palettes --palette-size 256 Pad-Palettes 256 ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap Export-Bytes "%_TEMP%\thermoman.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\thermoman.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\thermoman.pal.bin"

rem Star Frag card
tools\PixelPet.exe ^
Import-Bitmap "img\card-starfrag1.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-starfrag1.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-starfrag1.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-starfrag1.pal.bin"

rem Star Frag card
tools\PixelPet.exe ^
Import-Bitmap "img\card-starfrag2.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-starfrag2.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-starfrag2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-starfrag2.pal.bin"

rem Star Frag card
tools\PixelPet.exe ^
Import-Bitmap "img\card-starfrag3.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-starfrag3.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-starfrag3.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-starfrag3.pal.bin"

rem Star Frag card
tools\PixelPet.exe ^
Import-Bitmap "img\card-starfrag4.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-starfrag4.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-starfrag4.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-starfrag4.pal.bin"

rem StarTicket card
tools\PixelPet.exe ^
Import-Bitmap "img\card-starticket.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-starticket.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-starticket.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-starticket.pal.bin"

rem Star Frag shop
tools\PixelPet.exe ^
Import-Bitmap "img\starfrag-shop-dedupl.pal.png" Read-Palettes --palette-size 256 Convert-Palettes GBA ^
Import-Bitmap "img\starfrag-shop-dedupl.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\starfrag-shop.img.bin" ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\starfrag-shop.map.bin"

rem Music box
tools\PixelPet.exe ^
Import-Bitmap "img\musicbox.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\musicbox.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Serialize-Tileset Export-Bytes "%_TEMP%\musicbox.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\musicbox.pal.bin"

rem 1000 Note Challenge
tools\PixelPet.exe ^
Import-Bitmap "img\notegame-sprites.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\notegame-sprites.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 160 ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 160 -w 16 -h  16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y 160 -w  8 -h  16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 176 -w 16 -h   8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w 32 -h  16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 32 -h  16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\notegame-sprites.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\notegame-sprites.pal.bin"

rem Mega Screen
tools\PixelPet.exe ^
Import-Bitmap "img\megascreen-pegasus-dedupl.pal.png" Read-Palettes --palette-size 256 Convert-Palettes GBA ^
Import-Bitmap "img\megascreen-pegasus-dedupl.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP -x 0 -y   0 -w 768 -h 192 ^
Serialize-Tilemap Export-Bytes "%_TEMP%\megascreen.map.bin" Clear-Tilemap ^
Generate-Tilemap GBA-8BPP -x 0 -y 192 -w 768 -h 192 --append ^
Serialize-Tilemap Export-Bytes "%_TEMP%\megascreen-empty.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\megascreen-pegasus.img.bin" ^
Import-Bitmap "img\megascreen-leo-dedupl.pal.png" Read-Palettes --palette-size 256 Convert-Palettes GBA ^
Import-Bitmap "img\megascreen-leo-dedupl.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP -x 0 -y   0 -w 768 -h 192 Clear-Tilemap ^
Generate-Tilemap GBA-8BPP -x 0 -y 192 -w 768 -h 192 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\megascreen-leo.img.bin" ^
Clear-Tileset Clear-Tilemap Clear-Palettes ^
Import-Bitmap "img\megascreen-dragon-dedupl.pal.png" Read-Palettes --palette-size 256 Convert-Palettes GBA ^
Import-Bitmap "img\megascreen-dragon-dedupl.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP -x 0 -y   0 -w 768 -h 192 Clear-Tilemap ^
Generate-Tilemap GBA-8BPP -x 0 -y 192 -w 768 -h 192 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\megascreen-dragon.img.bin"

rem Title Screen UI
tools\PixelPet.exe ^
Import-Bitmap "img\titlescreen-ui.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\titlescreen-ui.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-pressstart.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  16 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  16 -w 32 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-newgame.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-continue.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 16 -h 16 ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-cursor1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y  48 -w 16 -h 16 ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-cursor2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 16 -h 16 ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-cursor3.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  48 -w 16 -h 16 ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-cursor4.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  64 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  64 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  64 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  56 -y  64 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-ui-data.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\titlescreen-ui.pal.bin"

rem QuickGauge card
tools\PixelPet.exe ^
Import-Bitmap "img\card-quickgauge.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-quickgauge.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-quickgauge.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-quickgauge.pal.bin"

rem SlowGauge card
tools\PixelPet.exe ^
Import-Bitmap "img\card-slowgauge.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-slowgauge.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-slowgauge.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-slowgauge.pal.bin"

rem LuPavarot card
tools\PixelPet.exe ^
Import-Bitmap "img\card-lupavarot.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-lupavarot.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-lupavarot.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-lupavarot.pal.bin"

rem LupBach card
tools\PixelPet.exe ^
Import-Bitmap "img\card-lupbach.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-lupbach.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-lupbach.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-lupbach.pal.bin"

rem Hollow card
tools\PixelPet.exe ^
Import-Bitmap "img\card-hollow.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\card-hollow.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 64 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w 32 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w  8 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\card-hollow.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\card-hollow.pal.bin"

rem Database label
tools\PixelPet.exe ^
Import-Bitmap "img\record-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\database.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\database.img.bin" ^
Serialize-Tilemap --base-tile 0x47 Export-Bytes "%_TEMP%\database.map.bin"

rem Counter Hit marker
tools\PixelPet.exe ^
Import-Bitmap "img\counter-hit.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\counter-hit.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  48 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  16 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  32 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  48 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\counter-hit.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\counter-hit.pal.bin"

rem Station Comp trail
tools\PixelPet.exe ^
Import-Bitmap "img\stationcomp-cursor.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\stationcomp-cursor.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 16 ^
Import-Bitmap "img\stationcomp-trail.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   8 -y   0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\stationcomp-cursor.img.bin"

rem Station Comp cursor
rem tools\PixelPet.exe ^
rem Import-Bitmap "img\stationcomp-cursor.pal.png" Read-Palettes Convert-Palettes GBA ^
rem Import-Bitmap "img\stationcomp-cursor.png" Convert-Bitmap GBA ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 16 -h 16 ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  16 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  96 -y   0 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w 16 -h 16 --append ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\stationcomp-cursor.img.bin"

rem KeyMan cursor
tools\PixelPet.exe ^
Import-Bitmap "img\keyman-cursor.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\keyman-cursor.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\keyman-cursor.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\keyman-cursor.pal.bin"

rem Transer icon
tools\PixelPet.exe ^
Import-Bitmap "img\transer.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\transer.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  16 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\transer.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\transer.pal.bin"

rem Mr. Famous mugshot
tools\PixelPet.exe ^
Import-Bitmap "img\mrfamous-face.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mrfamous-face.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m0f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m0f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m0f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m1f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m1f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m1f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m2f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m2f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-face-m2f2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mrfamous-face.pal.bin"

rem Mr. Famous field object
rem tools\PixelPet.exe ^
rem Import-Bitmap "img\mrfamous.pal.png" Read-Palettes Convert-Palettes GBA ^
rem Import-Bitmap "img\mrfamous.png" Convert-Bitmap GBA ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y 104 -w 16 -h  8 ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x   8 -y  24 -w 16 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  24 -y  24 -w  8 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  30 -w  8 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x   8 -y   8 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  24 -y   8 -w  8 -h 16 --append ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-front.img.bin" ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y 104 -w 16 -h  8 ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y  24 -w 16 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  56 -y  24 -w  8 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y  32 -w  8 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  64 -y   8 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  56 -y   8 -w  8 -h 16 --append ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-back.img.bin" ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  48 -y 104 -w 16 -h  8 ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x   8 -y  80 -w 16 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  24 -y  80 -w  8 -h 32 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  96 -w  8 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x   8 -y  64 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  24 -y  64 -w  8 -h 16 --append ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\mrfamous-inactive.img.bin" ^
rem Serialize-Palettes Export-Bytes "%_TEMP%\mrfamous.pal.bin"

rem Gold Mr Hertz mugshot
tools\PixelPet.exe ^
Import-Bitmap "img\mrhertz-gold.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mrhertz-gold.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m0f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m0f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m0f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m1f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m1f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m1f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m2f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m2f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-gold-m2f2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mrhertz-gold.pal.bin"

rem Mr Hertz mugshot
tools\PixelPet.exe ^
Import-Bitmap "img\mrhertz.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mrhertz.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m0f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m0f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m0f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m1f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m1f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m1f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m2f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m2f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mrhertz-m2f2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mrhertz.pal.bin"

rem Cepheus mugshot
tools\PixelPet.exe ^
Import-Bitmap "img\cepheus.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\cepheus.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m0f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m0f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y   0 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y   0 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  32 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  32 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m0f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m1f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m1f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  48 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  48 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  80 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  80 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m1f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m2f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m2f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  96 -w 32 -h 32 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  96 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 128 -w 32 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 128 -w  8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cepheus-m2f2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\cepheus.pal.bin"

rem Omega-Xis mugshot
tools\PixelPet.exe ^
Import-Bitmap "img\omegaxis.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\omegaxis.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m0f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m1f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m2f0.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m0f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m1f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m2f1.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x   0 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  32 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m0f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  40 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  72 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m1f2.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y  0 -w 32 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y  0 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  80 -y 16 -w 32 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 112 -y 16 -w  8 -h 32 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\omegaxis-m2f2.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\omegaxis.pal.bin"

rem Save screen
tools\PixelPet.exe ^
Import-Bitmap "img\savescreen.png" Convert-Bitmap GBA ^
Pad-Palettes 1 --color 0x3E0 Extract-Palettes --palette-size 256 --append Pad-Palettes 256 ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tileset Export-Bytes "%_TEMP%\subscreen\subscreen_074.bin" ^
Serialize-Tilemap --base-tile 0x1 Export-Bytes "%_TEMP%\subscreen\subscreen_075.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\subscreen\subscreen_076.bin"

rem Record palettes
tools\PixelPet.exe ^
Import-Bitmap "img\record-pegasus.pal.png" Read-Palettes Convert-Palettes GBA ^
Serialize-Palettes Export-Bytes "%_TEMP%\subscreen_record\subscreen_record_7.bin" ^
Import-Bitmap "img\record-leo.pal.png" Read-Palettes Convert-Palettes GBA ^
Serialize-Palettes Export-Bytes "%_TEMP%\subscreen_record\subscreen_record_8.bin" ^
Import-Bitmap "img\record-dragon.pal.png" Read-Palettes Convert-Palettes GBA ^
Serialize-Palettes Export-Bytes "%_TEMP%\subscreen_record\subscreen_record_9.bin"

rem Mettenna
tools\PixelPet.exe ^
Import-Bitmap "img\mettenna.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mettenna.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x  1 -y 43 -w 16 -h  8 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 26 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y  1 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 18 -y  1 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 17 -w 16 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 19 -y 59 -w 16 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 52 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mettenna-front.img.bin" ^
Generate-Tilemap GBA-4BPP --no-reduce -x 31 -y 43 -w 16 -h  8 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 30 -y 26 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 27 -y  1 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 43 -y  1 -w  8 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 27 -y 17 -w 16 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 19 -y 59 -w 16 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 52 -w 16 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mettenna-back.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mettenna.pal.bin"

rem Mirror
tools\PixelPet.exe ^
Import-Bitmap "img\mirror.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\mirror.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y 58 -w 16 -h  8 ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y  2 -w 16 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 18 -y 10 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 34 -w 16 -h 16 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x  2 -y 50 -w 16 -h  8 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 18 -y 26 -w  8 -h 32 --append ^
Generate-Tilemap GBA-4BPP --no-reduce -x 10 -y 58 -w 16 -h  8 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\mirror.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\mirror.pal.bin"

rem Lunar Knights Brother Screen background
tools\PixelPet.exe ^
Import-Bitmap "img\boktai-brother.pal.dedupl.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\boktai-brother-eng.dedupl.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap --base-tile 1 Export-Bytes "%_TEMP%\boktai-brother-eng.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\boktai-brother-eng.img.bin"

rem Lunar Brother Brother Screen OAMs
rem tools\PixelPet.exe ^
rem Import-Bitmap "img\boktai-brother-oam.pal.dedupl.png" Read-Palettes Convert-Palettes GBA ^
rem Import-Bitmap "img\boktai-brother-eng-oam.dedupl.png" Convert-Bitmap GBA ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y  0 -w 16 -h  8 ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y  8 -w 32 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y  8 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 24 -w 48 -h  8 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 32 -w 32 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y 32 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 48 -w 48 -h  8 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 56 -w 32 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y 56 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 72 -w 48 -h  8 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 80 -w 32 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x 32 -y 80 -w 16 -h 16 --append ^
rem Generate-Tilemap GBA-4BPP --no-reduce -x  0 -y 96 -w 48 -h  8 --append ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\boktai-brother-eng-oam.img.bin"

rem Font
tools\PixelPet.exe ^
Import-Bitmap "img\font01.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\font0.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\font0.img.bin"

rem Font
tools\PixelPet.exe ^
Import-Bitmap "img\font01.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\font1.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\font1.img.bin"

rem Font
tools\PixelPet.exe ^
Import-Bitmap "img\font2.pal.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\font2.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\font2.img.bin"

rem ElemSearch icons
tools\PixelPet.exe ^
Import-Bitmap "img\fieldcockpit-elemsearch.pal.dedupl.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\fieldcockpit-firesearch.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_14.bin" ^
Import-Bitmap "img\fieldcockpit-aquasearch.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_15.bin" ^
Import-Bitmap "img\fieldcockpit-elecsearch.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_16.bin" ^
Import-Bitmap "img\fieldcockpit-woodsearch.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_17.bin" ^
Import-Bitmap "img\fieldcockpit-beam.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_18.bin" ^
Import-Bitmap "img\fieldcockpit-cursor.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\fieldcockpit\fieldcockpit_19.bin"

rem Title Screen
tools\PixelPet.exe ^
Import-Bitmap "img\titlescreen-240.png" Convert-Bitmap GBA ^
Extract-Palettes --palette-size 240 Pad-Palettes 240 ^
Generate-Tilemap GBA-8BPP ^
Serialize-Tilemap --base-tile 1 Export-Bytes "%_TEMP%\titlescreen.map.bin" ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\titlescreen.pal.bin"

rem Title Screen icons Mega Man palette
tools\PixelPet.exe ^
Import-Bitmap "img\titlescreen-megaicon.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Serialize-Palettes Export-Bytes "%_TEMP%\titlescreen-megaicon.pal.bin"

rem Title Screen icons Andromeda icon
tools\PixelPet.exe ^
Import-Bitmap "img\titlescreen-andromedaicon.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\titlescreen-andromedaicon.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-andromedaicon.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\titlescreen-andromedaicon.pal.bin"

rem Title Screen icons Satellite Admins icon
tools\PixelPet.exe ^
Import-Bitmap "img\titlescreen-satelliteicon.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\titlescreen-satelliteicon.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\titlescreen-satelliteicon.img.bin" ^
Serialize-Palettes Export-Bytes "%_TEMP%\titlescreen-satelliteicon.pal.bin"

rem Mega Screen Scanner options
tools\PixelPet.exe ^
Import-Bitmap "img\scanneroptions.pal.dedupl.png" Read-Palettes Convert-Palettes GBA ^
Import-Bitmap "img\scannerdelete.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce -x 0 -y 0 -w 16 -h 16 ^
Generate-Tilemap GBA-4BPP --no-reduce -x 16 -y 0 -w 8 -h 16 --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\scannerdelete.img.bin"

rem Battle Card icons
tools\PixelPet.exe ^
Import-Bitmap "img\cardicons.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\cardicons.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Palettes Export-Bytes "%_TEMP%\cardicons.pal.bin" ^
Import-Bitmap "img\cardicons2.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\cardicons2.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce --append ^
Serialize-Tileset Export-Bytes "%_TEMP%\cardicons.img.bin"

rem Battle Card star icons
tools\PixelPet.exe ^
Import-Bitmap "img\cardicons.pal.png" Read-Palettes --palette-size 16 Convert-Palettes GBA ^
Import-Bitmap "img\cardicons-star.png" Convert-Bitmap GBA ^
Generate-Tilemap GBA-4BPP --no-reduce ^
Serialize-Tileset Export-Bytes "%_TEMP%\cardicons-star.img.bin"

rem Button labels
rem tools\PixelPet.exe ^
rem Import-Bitmap "img\button-labels-folder.pal.png" Read-Palettes Convert-Palettes GBA ^
rem Import-Bitmap "img\button-labels-folder.png" Convert-Bitmap GBA ^
rem Generate-Tilemap GBA-4BPP --no-reduce ^
rem Serialize-Tileset Export-Bytes "%_TEMP%\button-labels-folder.img.bin"
