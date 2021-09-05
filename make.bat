@echo off
setlocal

set "_TEMP=_temp"
set "_ROM_IN=_rom\pegasus-us.nds"
set "_ROM_PEGASUS=_rom\pegasus-us.nds"
set "_ROM_LEO=_rom\leo-us.nds"
set "_ROM_DRAGON=_rom\dragon-us.nds"
set "_ROM_MMSF2=_rom\mmsf2.nds"
set "_ROM_MMSF3=_rom\mmsf3.nds"
set "_ROM_OUT=_rom\MegaManStarForceDX.nds"
set "_LZSS_FLAGS=-ewn"

for %%f in ("%_ROM_OUT%") do (
	set "_SYM_OUT=%%~dpnf.sym"
	set "_TEMP_OUT=%%~dpnf.temp"
	set "_TPL_OUT=%%~dpnf.tpl"
	set "_TXT_OUT=%%~dpnf.txt"
)

mkdir "%_TEMP%" 2> nul
pushd "%_TEMP%"
rmdir /S /Q . 2> nul
popd

if /I "%1"=="clean" (
	del /Q "%_SYM_OUT%" 2> nul
	del /Q "%_TEMP_OUT%" 2> nul
	del /Q "%_TPL_OUT%" 2> nul
	del /Q "%_TXT_OUT%" 2> nul
	del /Q "%_ROM_OUT%" 2> nul
	goto :done
)

mkdir "%_TEMP%\pegasus" 2> nul
mkdir "%_TEMP%\leo" 2> nul
mkdir "%_TEMP%\dragon" 2> nul
mkdir "%_TEMP%\mmsf2" 2> nul
mkdir "%_TEMP%\mmsf3" 2> nul

if not exist "%_ROM_IN%" (
	echo File not found: "%_ROM_IN%"
	goto :error
)
if not exist "%_ROM_PEGASUS%" (
	echo File not found: "%_ROM_PEGASUS%"
	goto :error
)
if not exist "%_ROM_LEO%" (
	echo File not found: "%_ROM_LEO%"
	goto :error
)
if not exist "%_ROM_DRAGON%" (
	echo File not found: "%_ROM_DRAGON%"
	goto :error
)
if not exist "%_ROM_MMSF2%" (
	echo File not found: "%_ROM_MMSF2%"
	goto :error
)
if not exist "%_ROM_MMSF3%" (
	echo File not found: "%_ROM_MMSF3%"
	goto :error
)

echo Extracting ROMs...
tools\ndstool.exe -x "%_ROM_IN%" ^
	-9  "%_TEMP%\arm9.bin" ^
	-7  "%_TEMP%\arm7.bin" ^
	-d  "%_TEMP%\data" ^
	-y  "%_TEMP%\overlay" ^
	-h  "%_TEMP%\header.bin" ^
	-y9 "%_TEMP%\y9.bin" ^
	-y7 "%_TEMP%\y7.bin" ^
	-t  "%_TEMP%\banner.bin" || goto :error

echo Extracting ROMs...
tools\ndstool.exe -x "%_ROM_PEGASUS%" ^
	-d "%_TEMP%\pegasus\data" || goto :error
tools\ndstool.exe -x "%_ROM_LEO%" ^
	-d "%_TEMP%\leo\data" || goto :error
tools\ndstool.exe -x "%_ROM_DRAGON%" ^
	-d "%_TEMP%\dragon\data" || goto :error
tools\ndstool.exe -x "%_ROM_MMSF2%" ^
	-d "%_TEMP%\mmsf2\data" || goto :error
tools\ndstool.exe -x "%_ROM_MMSF3%" ^
	-d "%_TEMP%\mmsf3\data" || goto :error

echo Extracting archives...
tools\sfarctool.exe -x -i "%_TEMP%\pegasus\data\datbin\com\capcomlogo.bin" -o "%_TEMP%\pegasus\capcomlogo" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\pegasus\data\datbin\com\subscreen.bin" -o "%_TEMP%\pegasus\subscreen" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\pegasus\data\datbin\eng\subscreen_local.bin" -o "%_TEMP%\pegasus\subscreen_local" || goto :error

tools\sfarctool.exe -x -i "%_TEMP%\leo\data\datbin\com\capcomlogo.bin" -o "%_TEMP%\leo\capcomlogo" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\leo\data\datbin\com\subscreen.bin" -o "%_TEMP%\leo\subscreen" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\leo\data\datbin\eng\subscreen_local.bin" -o "%_TEMP%\leo\subscreen_local" || goto :error

tools\sfarctool.exe -x -i "%_TEMP%\dragon\data\datbin\com\capcomlogo.bin" -o "%_TEMP%\dragon\capcomlogo" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\dragon\data\datbin\com\subscreen.bin" -o "%_TEMP%\dragon\subscreen" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\dragon\data\datbin\eng\subscreen_local.bin" -o "%_TEMP%\dragon\subscreen_local" || goto :error

tools\sfarctool.exe -d -x -i "%_TEMP%\mmsf2\data\datbin\com\models.bin" -o "%_TEMP%\mmsf2\models" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\mmsf2\data\datbin\com\motions.bin" -o "%_TEMP%\mmsf2\motions" || goto :error

tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\battlecard.bin" -o "%_TEMP%\battlecard" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\capcomlogo.bin" -o "%_TEMP%\capcomlogo" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\field.bin" -o "%_TEMP%\field" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\fieldcardforce.bin" -o "%_TEMP%\fieldcardforce" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\fieldcockpit.bin" -o "%_TEMP%\fieldcockpit" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\fieldface.bin" -o "%_TEMP%\fieldface" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\fieldminigame.bin" -o "%_TEMP%\fieldminigame" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\fieldobj.bin" -o "%_TEMP%\fieldobj" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\models.bin" -o "%_TEMP%\models" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\motions.bin" -o "%_TEMP%\motions" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\screen_common.bin" -o "%_TEMP%\screen_common" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\stages.bin" -o "%_TEMP%\stages" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\subscreen.bin" -o "%_TEMP%\subscreen" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\subscreen_face.bin" -o "%_TEMP%\subscreen_face" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\com\subscreen_record.bin" -o "%_TEMP%\subscreen_record" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\field_local.bin" -o "%_TEMP%\field_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\fieldcardforce_local.bin" -o "%_TEMP%\fieldcardforce_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\mess.bin" -o "%_TEMP%\mess" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\subscreen_local.bin" -o "%_TEMP%\subscreen_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\subscreen_face_local.bin" -o "%_TEMP%\subscreen_face_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\subscreen_record_local.bin" -o "%_TEMP%\subscreen_record_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\screen_local.bin" -o "%_TEMP%\screen_local" || goto :error
tools\sfarctool.exe -x -i "%_TEMP%\data\datbin\eng\shop_local.bin" -o "%_TEMP%\shop_local" || goto :error

echo Pre-processing files...
tools\armips.exe "src_pre.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error

echo Decompressing files...
rem TODO: Most of these are not needed
tools\lzss.exe -d "%_TEMP%\pegasus\capcomlogo\capcomlogo_01.bin"
tools\lzss.exe -d "%_TEMP%\leo\capcomlogo\capcomlogo_01.bin"
tools\lzss.exe -d "%_TEMP%\dragon\capcomlogo\capcomlogo_01.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\capcomlogo\capcomlogo_02.bin"
tools\lzss.exe -d "%_TEMP%\leo\capcomlogo\capcomlogo_02.bin"
tools\lzss.exe -d "%_TEMP%\dragon\capcomlogo\capcomlogo_02.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\capcomlogo\capcomlogo_03.bin"
tools\lzss.exe -d "%_TEMP%\leo\capcomlogo\capcomlogo_03.bin"
tools\lzss.exe -d "%_TEMP%\dragon\capcomlogo\capcomlogo_03.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_000.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_001.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_003.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_020.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_021.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_022.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_023.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_025.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_030.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen\subscreen_032.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_000.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_006.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_012.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_014.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_016.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_018.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_020.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_022.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_023.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_025.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_027.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_029.bin"
tools\lzss.exe -d "%_TEMP%\pegasus\subscreen_local\subscreen_local_031.bin"

copy /Y "%_TEMP%\overlay\overlay_0000.bin" "%_TEMP%\overlay_0000.bin"
copy /Y "%_TEMP%\overlay\overlay_0002.bin" "%_TEMP%\overlay_0002.bin"
copy /Y "%_TEMP%\overlay\overlay_0003.bin" "%_TEMP%\overlay_0003.bin"
copy /Y "%_TEMP%\overlay\overlay_0007.bin" "%_TEMP%\overlay_0007.bin"
copy /Y "%_TEMP%\overlay\overlay_0010.bin" "%_TEMP%\overlay_0010.bin"
copy /Y "%_TEMP%\overlay\overlay_0012.bin" "%_TEMP%\overlay_0012.bin"
copy /Y "%_TEMP%\overlay\overlay_0013.bin" "%_TEMP%\overlay_0013.bin"
copy /Y "%_TEMP%\overlay\overlay_0014.bin" "%_TEMP%\overlay_0014.bin"
copy /Y "%_TEMP%\overlay\overlay_0015.bin" "%_TEMP%\overlay_0015.bin"
copy /Y "%_TEMP%\overlay\overlay_0016.bin" "%_TEMP%\overlay_0016.bin"
copy /Y "%_TEMP%\overlay\overlay_0017.bin" "%_TEMP%\overlay_0017.bin"
copy /Y "%_TEMP%\overlay\overlay_0018.bin" "%_TEMP%\overlay_0018.bin"
copy /Y "%_TEMP%\overlay\overlay_0019.bin" "%_TEMP%\overlay_0019.bin"
copy /Y "%_TEMP%\overlay\overlay_0020.bin" "%_TEMP%\overlay_0020.bin"
copy /Y "%_TEMP%\overlay\overlay_0021.bin" "%_TEMP%\overlay_0021.bin"
copy /Y "%_TEMP%\overlay\overlay_0024.bin" "%_TEMP%\overlay_0024.bin"
copy /Y "%_TEMP%\overlay\overlay_0025.bin" "%_TEMP%\overlay_0025.bin"
copy /Y "%_TEMP%\overlay\overlay_0027.bin" "%_TEMP%\overlay_0027.bin"
copy /Y "%_TEMP%\overlay\overlay_0028.bin" "%_TEMP%\overlay_0028.bin"
copy /Y "%_TEMP%\overlay\overlay_0029.bin" "%_TEMP%\overlay_0029.bin"
copy /Y "%_TEMP%\overlay\overlay_0036.bin" "%_TEMP%\overlay_0036.bin"
copy /Y "%_TEMP%\overlay\overlay_0082.bin" "%_TEMP%\overlay_0082.bin"
copy /Y "%_TEMP%\overlay\overlay_0107.bin" "%_TEMP%\overlay_0107.bin"
copy /Y "%_TEMP%\overlay\overlay_0116.bin" "%_TEMP%\overlay_0116.bin"
copy /Y "%_TEMP%\overlay\overlay_0133.bin" "%_TEMP%\overlay_0133.bin"
copy /Y "%_TEMP%\overlay\overlay_0134.bin" "%_TEMP%\overlay_0134.bin"
copy /Y "%_TEMP%\overlay\overlay_0139.bin" "%_TEMP%\overlay_0139.bin"
copy /Y "%_TEMP%\overlay\overlay_0145.bin" "%_TEMP%\overlay_0145.bin"
copy /Y "%_TEMP%\overlay\overlay_0146.bin" "%_TEMP%\overlay_0146.bin"
copy /Y "%_TEMP%\overlay\overlay_0147.bin" "%_TEMP%\overlay_0147.bin"
copy /Y "%_TEMP%\overlay\overlay_0150.bin" "%_TEMP%\overlay_0150.bin"
copy /Y "%_TEMP%\overlay\overlay_0157.bin" "%_TEMP%\overlay_0157.bin"
copy /Y "%_TEMP%\overlay\overlay_0159.bin" "%_TEMP%\overlay_0159.bin"
copy /Y "%_TEMP%\overlay\overlay_0161.bin" "%_TEMP%\overlay_0161.bin"
copy /Y "%_TEMP%\overlay\overlay_0162.bin" "%_TEMP%\overlay_0162.bin"
copy /Y "%_TEMP%\overlay\overlay_0167.bin" "%_TEMP%\overlay_0167.bin"
copy /Y "%_TEMP%\overlay\overlay_0172.bin" "%_TEMP%\overlay_0172.bin"
copy /Y "%_TEMP%\overlay\overlay_0177.bin" "%_TEMP%\overlay_0177.bin"
copy /Y "%_TEMP%\overlay\overlay_0178.bin" "%_TEMP%\overlay_0178.bin"
copy /Y "%_TEMP%\overlay\overlay_0179.bin" "%_TEMP%\overlay_0179.bin"
copy /Y "%_TEMP%\overlay\overlay_0180.bin" "%_TEMP%\overlay_0180.bin"
copy /Y "%_TEMP%\overlay\overlay_0181.bin" "%_TEMP%\overlay_0181.bin"
copy /Y "%_TEMP%\overlay\overlay_0182.bin" "%_TEMP%\overlay_0182.bin"
copy /Y "%_TEMP%\overlay\overlay_0183.bin" "%_TEMP%\overlay_0183.bin"
copy /Y "%_TEMP%\overlay\overlay_0184.bin" "%_TEMP%\overlay_0184.bin"
copy /Y "%_TEMP%\overlay\overlay_0185.bin" "%_TEMP%\overlay_0185.bin"
copy /Y "%_TEMP%\overlay\overlay_0186.bin" "%_TEMP%\overlay_0186.bin"
copy /Y "%_TEMP%\overlay\overlay_0187.bin" "%_TEMP%\overlay_0187.bin"
copy /Y "%_TEMP%\overlay\overlay_0188.bin" "%_TEMP%\overlay_0188.bin"
copy /Y "%_TEMP%\overlay\overlay_0189.bin" "%_TEMP%\overlay_0189.bin"
copy /Y "%_TEMP%\overlay\overlay_0190.bin" "%_TEMP%\overlay_0190.bin"
copy /Y "%_TEMP%\overlay\overlay_0191.bin" "%_TEMP%\overlay_0191.bin"
copy /Y "%_TEMP%\overlay\overlay_0193.bin" "%_TEMP%\overlay_0193.bin"
copy /Y "%_TEMP%\overlay\overlay_0197.bin" "%_TEMP%\overlay_0197.bin"
copy /Y "%_TEMP%\overlay\overlay_0198.bin" "%_TEMP%\overlay_0198.bin"
copy /Y "%_TEMP%\overlay\overlay_0200.bin" "%_TEMP%\overlay_0200.bin"
copy /Y "%_TEMP%\overlay\overlay_0201.bin" "%_TEMP%\overlay_0201.bin"
copy /Y "%_TEMP%\overlay\overlay_0202.bin" "%_TEMP%\overlay_0202.bin"
copy /Y "%_TEMP%\overlay\overlay_0203.bin" "%_TEMP%\overlay_0203.bin"
copy /Y "%_TEMP%\overlay\overlay_0204.bin" "%_TEMP%\overlay_0204.bin"
copy /Y "%_TEMP%\overlay\overlay_0205.bin" "%_TEMP%\overlay_0205.bin"
copy /Y "%_TEMP%\overlay\overlay_0207.bin" "%_TEMP%\overlay_0207.bin"
copy /Y "%_TEMP%\overlay\overlay_0208.bin" "%_TEMP%\overlay_0208.bin"
copy /Y "%_TEMP%\overlay\overlay_0210.bin" "%_TEMP%\overlay_0210.bin"
copy /Y "%_TEMP%\overlay\overlay_0211.bin" "%_TEMP%\overlay_0211.bin"
copy /Y "%_TEMP%\overlay\overlay_0213.bin" "%_TEMP%\overlay_0213.bin"
copy /Y "%_TEMP%\overlay\overlay_0219.bin" "%_TEMP%\overlay_0219.bin"
copy /Y "%_TEMP%\overlay\overlay_0220.bin" "%_TEMP%\overlay_0220.bin"
copy /Y "%_TEMP%\overlay\overlay_0221.bin" "%_TEMP%\overlay_0221.bin"
copy /Y "%_TEMP%\overlay\overlay_0235.bin" "%_TEMP%\overlay_0235.bin"
copy /Y "%_TEMP%\overlay\overlay_0238.bin" "%_TEMP%\overlay_0238.bin"
copy /Y "%_TEMP%\overlay\overlay_0260.bin" "%_TEMP%\overlay_0260.bin"
copy /Y "%_TEMP%\overlay\overlay_0269.bin" "%_TEMP%\overlay_0269.bin"
copy /Y "%_TEMP%\overlay\overlay_0277.bin" "%_TEMP%\overlay_0277.bin"
copy /Y "%_TEMP%\overlay\overlay_0286.bin" "%_TEMP%\overlay_0286.bin"
copy /Y "%_TEMP%\overlay\overlay_0287.bin" "%_TEMP%\overlay_0287.bin"
copy /Y "%_TEMP%\overlay\overlay_0293.bin" "%_TEMP%\overlay_0293.bin"
copy /Y "%_TEMP%\overlay\overlay_0298.bin" "%_TEMP%\overlay_0298.bin"
copy /Y "%_TEMP%\overlay\overlay_0320.bin" "%_TEMP%\overlay_0320.bin"
copy /Y "%_TEMP%\overlay\overlay_0322.bin" "%_TEMP%\overlay_0322.bin"
copy /Y "%_TEMP%\overlay\overlay_0333.bin" "%_TEMP%\overlay_0333.bin"
copy /Y "%_TEMP%\overlay\overlay_0376.bin" "%_TEMP%\overlay_0376.bin"
copy /Y "%_TEMP%\overlay\overlay_0391.bin" "%_TEMP%\overlay_0391.bin"
copy /Y "%_TEMP%\overlay\overlay_0426.bin" "%_TEMP%\overlay_0426.bin"
copy /Y "%_TEMP%\overlay\overlay_0445.bin" "%_TEMP%\overlay_0445.bin"
copy /Y "%_TEMP%\overlay\overlay_0449.bin" "%_TEMP%\overlay_0449.bin"
copy /Y "%_TEMP%\overlay\overlay_0453.bin" "%_TEMP%\overlay_0453.bin"
copy /Y "%_TEMP%\overlay\overlay_0463.bin" "%_TEMP%\overlay_0463.bin"
copy /Y "%_TEMP%\overlay\overlay_0464.bin" "%_TEMP%\overlay_0464.bin"
copy /Y "%_TEMP%\overlay\overlay_0465.bin" "%_TEMP%\overlay_0465.bin"
copy /Y "%_TEMP%\overlay\overlay_0466.bin" "%_TEMP%\overlay_0466.bin"
copy /Y "%_TEMP%\overlay\overlay_0467.bin" "%_TEMP%\overlay_0467.bin"
copy /Y "%_TEMP%\overlay\overlay_0468.bin" "%_TEMP%\overlay_0468.bin"
copy /Y "%_TEMP%\overlay\overlay_0469.bin" "%_TEMP%\overlay_0469.bin"
copy /Y "%_TEMP%\overlay\overlay_0470.bin" "%_TEMP%\overlay_0470.bin"
copy /Y "%_TEMP%\overlay\overlay_0471.bin" "%_TEMP%\overlay_0471.bin"
copy /Y "%_TEMP%\overlay\overlay_0480.bin" "%_TEMP%\overlay_0480.bin"
copy /Y "%_TEMP%\overlay\overlay_0511.bin" "%_TEMP%\overlay_0511.bin"
copy /Y "%_TEMP%\overlay\overlay_0512.bin" "%_TEMP%\overlay_0512.bin"
copy /Y "%_TEMP%\overlay\overlay_0517.bin" "%_TEMP%\overlay_0517.bin"
copy /Y "%_TEMP%\overlay\overlay_0518.bin" "%_TEMP%\overlay_0518.bin"
copy /Y "%_TEMP%\overlay\overlay_0519.bin" "%_TEMP%\overlay_0519.bin"
copy /Y "%_TEMP%\overlay\overlay_0520.bin" "%_TEMP%\overlay_0520.bin"
copy /Y "%_TEMP%\overlay\overlay_0521.bin" "%_TEMP%\overlay_0521.bin"
copy /Y "%_TEMP%\overlay\overlay_0522.bin" "%_TEMP%\overlay_0522.bin"
copy /Y "%_TEMP%\overlay\overlay_0523.bin" "%_TEMP%\overlay_0523.bin"
copy /Y "%_TEMP%\overlay\overlay_0524.bin" "%_TEMP%\overlay_0524.bin"
copy /Y "%_TEMP%\overlay\overlay_0525.bin" "%_TEMP%\overlay_0525.bin"
copy /Y "%_TEMP%\overlay\overlay_0526.bin" "%_TEMP%\overlay_0526.bin"
copy /Y "%_TEMP%\overlay\overlay_0527.bin" "%_TEMP%\overlay_0527.bin"
copy /Y "%_TEMP%\overlay\overlay_0528.bin" "%_TEMP%\overlay_0528.bin"
copy /Y "%_TEMP%\overlay\overlay_0530.bin" "%_TEMP%\overlay_0530.bin"
copy /Y "%_TEMP%\overlay\overlay_0535.bin" "%_TEMP%\overlay_0535.bin"
copy /Y "%_TEMP%\overlay\overlay_0536.bin" "%_TEMP%\overlay_0536.bin"
copy /Y "%_TEMP%\overlay\overlay_0537.bin" "%_TEMP%\overlay_0537.bin"
copy /Y "%_TEMP%\overlay\overlay_0538.bin" "%_TEMP%\overlay_0538.bin"
copy /Y "%_TEMP%\overlay\overlay_0539.bin" "%_TEMP%\overlay_0539.bin"
copy /Y "%_TEMP%\overlay\overlay_0540.bin" "%_TEMP%\overlay_0540.bin"
copy /Y "%_TEMP%\overlay\overlay_0541.bin" "%_TEMP%\overlay_0541.bin"
copy /Y "%_TEMP%\overlay\overlay_0542.bin" "%_TEMP%\overlay_0542.bin"
copy /Y "%_TEMP%\overlay\overlay_0543.bin" "%_TEMP%\overlay_0543.bin"
copy /Y "%_TEMP%\overlay\overlay_0544.bin" "%_TEMP%\overlay_0544.bin"
copy /Y "%_TEMP%\overlay\overlay_0551.bin" "%_TEMP%\overlay_0551.bin"
copy /Y "%_TEMP%\overlay\overlay_0556.bin" "%_TEMP%\overlay_0556.bin"
copy /Y "%_TEMP%\overlay\overlay_0559.bin" "%_TEMP%\overlay_0559.bin"
copy /Y "%_TEMP%\overlay\overlay_0566.bin" "%_TEMP%\overlay_0566.bin"
copy /Y "%_TEMP%\overlay\overlay_0573.bin" "%_TEMP%\overlay_0573.bin"
copy /Y "%_TEMP%\overlay\overlay_0577.bin" "%_TEMP%\overlay_0577.bin"
copy /Y "%_TEMP%\overlay\overlay_0578.bin" "%_TEMP%\overlay_0578.bin"
copy /Y "%_TEMP%\overlay\overlay_0579.bin" "%_TEMP%\overlay_0579.bin"
copy /Y "%_TEMP%\overlay\overlay_0580.bin" "%_TEMP%\overlay_0580.bin"
copy /Y "%_TEMP%\overlay\overlay_0581.bin" "%_TEMP%\overlay_0581.bin"
copy /Y "%_TEMP%\overlay\overlay_0582.bin" "%_TEMP%\overlay_0582.bin"
copy /Y "%_TEMP%\overlay\overlay_0599.bin" "%_TEMP%\overlay_0599.bin"
copy /Y "%_TEMP%\overlay\overlay_0600.bin" "%_TEMP%\overlay_0600.bin"
copy /Y "%_TEMP%\overlay\overlay_0601.bin" "%_TEMP%\overlay_0601.bin"
copy /Y "%_TEMP%\overlay\overlay_0602.bin" "%_TEMP%\overlay_0602.bin"
copy /Y "%_TEMP%\overlay\overlay_0603.bin" "%_TEMP%\overlay_0603.bin"
copy /Y "%_TEMP%\overlay\overlay_0604.bin" "%_TEMP%\overlay_0604.bin"
copy /Y "%_TEMP%\overlay\overlay_0605.bin" "%_TEMP%\overlay_0605.bin"
copy /Y "%_TEMP%\overlay\overlay_0606.bin" "%_TEMP%\overlay_0606.bin"
copy /Y "%_TEMP%\overlay\overlay_0607.bin" "%_TEMP%\overlay_0607.bin"
copy /Y "%_TEMP%\overlay\overlay_0608.bin" "%_TEMP%\overlay_0608.bin"
copy /Y "%_TEMP%\overlay\overlay_0609.bin" "%_TEMP%\overlay_0609.bin"
copy /Y "%_TEMP%\overlay\overlay_0610.bin" "%_TEMP%\overlay_0610.bin"
copy /Y "%_TEMP%\overlay\overlay_0611.bin" "%_TEMP%\overlay_0611.bin"
copy /Y "%_TEMP%\overlay\overlay_0624.bin" "%_TEMP%\overlay_0624.bin"
copy /Y "%_TEMP%\overlay\overlay_0625.bin" "%_TEMP%\overlay_0625.bin"
copy /Y "%_TEMP%\overlay\overlay_0627.bin" "%_TEMP%\overlay_0627.bin"
copy /Y "%_TEMP%\field_094_tiles1.bin" "%_TEMP%\field_094_tiles1.dec"
copy /Y "%_TEMP%\field_098_tiles1.bin" "%_TEMP%\field_098_tiles1.dec"
copy /Y "%_TEMP%\models\models_131.bin" "%_TEMP%\models_taurus.nsbmd"
copy /Y "%_TEMP%\models\models_132.bin" "%_TEMP%\models_cygnus.nsbmd"
copy /Y "%_TEMP%\models\models_133.bin" "%_TEMP%\models_harp.nsbmd"
copy /Y "%_TEMP%\models\models_134.bin" "%_TEMP%\models_libra.nsbmd"
copy /Y "%_TEMP%\models\models_135.bin" "%_TEMP%\models_ophiuca.nsbmd"
copy /Y "%_TEMP%\models\models_136.bin" "%_TEMP%\models_gemini_b.nsbmd"
copy /Y "%_TEMP%\models\models_137.bin" "%_TEMP%\models_gemini_w.nsbmd"
copy /Y "%_TEMP%\models\models_140.bin" "%_TEMP%\models_cancer.nsbmd"
copy /Y "%_TEMP%\models\models_141.bin" "%_TEMP%\models_wolf.nsbmd"
copy /Y "%_TEMP%\models\models_142.bin" "%_TEMP%\models_crown.nsbmd"
copy /Y "%_TEMP%\models\models_146.bin" "%_TEMP%\models_leo.nsbmd"
copy /Y "%_TEMP%\models\models_151.bin" "%_TEMP%\models_megaman.nsbmd"
copy /Y "%_TEMP%\models\models_152.bin" "%_TEMP%\models_megaman_charge.nsbmd"
copy /Y "%_TEMP%\models\models_154.bin" "%_TEMP%\models_pegasus_charge.nsbmd"
copy /Y "%_TEMP%\models\models_156.bin" "%_TEMP%\models_leo_charge.nsbmd"
copy /Y "%_TEMP%\models\models_158.bin" "%_TEMP%\models_dragon_charge.nsbmd"
copy /Y "%_TEMP%\models\models_206.bin" "%_TEMP%\models_harp_speaker.nsbmd"
copy /Y "%_TEMP%\models\models_228.bin" "%_TEMP%\models_cancer_claw.nsbmd"
copy /Y "%_TEMP%\models\models_233.bin" "%_TEMP%\models_wolf_claw1.nsbmd"
copy /Y "%_TEMP%\models\models_237.bin" "%_TEMP%\models_wolf_claw2.nsbmd"
copy /Y "%_TEMP%\models\models_240.bin" "%_TEMP%\models_leo_claw.nsbmd"
copy /Y "%_TEMP%\models\models_262.bin" "%_TEMP%\models_cygnus_feather.nsbmd"
copy /Y "%_TEMP%\models\models_290.bin" "%_TEMP%\models_bustercharge1.nsbmd"
copy /Y "%_TEMP%\models\models_291.bin" "%_TEMP%\models_bustercharge2.nsbmd"
copy /Y "%_TEMP%\models\models_287.bin" "%_TEMP%\models_busterchargefire.nsbmd"
copy /Y "%_TEMP%\models\models_311.bin" "%_TEMP%\models_bustershot.nsbmd"
copy /Y "%_TEMP%\models\models_353.bin" "%_TEMP%\models_guard.nsbmd"
tools\blz.exe -d "%_TEMP%\arm9.dec" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0000.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0002.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0003.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0007.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0010.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0012.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0013.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0014.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0015.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0016.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0017.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0018.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0019.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0020.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0021.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0024.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0025.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0027.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0028.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0029.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0036.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0082.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0107.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0116.bin" || goto :error
rem tools\blz.exe -d "%_TEMP%\overlay_0133.bin" || goto :error
rem tools\blz.exe -d "%_TEMP%\overlay_0134.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0139.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0145.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0146.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0147.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0150.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0157.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0159.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0161.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0162.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0167.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0172.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0177.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0178.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0179.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0180.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0181.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0182.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0183.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0184.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0185.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0186.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0187.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0188.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0189.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0190.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0191.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0193.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0197.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0198.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0200.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0201.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0202.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0203.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0204.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0205.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0207.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0208.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0210.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0211.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0213.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0219.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0220.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0221.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0235.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0238.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0260.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0269.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0277.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0286.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0287.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0293.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0298.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0320.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0322.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0333.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0376.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0391.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0426.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0445.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0449.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0453.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0463.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0464.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0465.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0466.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0467.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0468.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0469.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0470.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0471.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0480.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0511.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0512.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0517.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0518.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0519.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0520.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0521.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0522.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0523.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0524.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0525.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0526.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0527.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0528.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0530.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0535.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0536.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0537.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0538.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0539.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0540.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0541.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0542.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0543.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0544.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0551.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0556.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0559.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0566.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0573.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0577.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0578.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0579.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0580.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0581.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0582.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0599.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0600.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0601.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0602.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0603.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0604.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0605.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0606.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0607.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0608.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0609.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0610.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0611.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0624.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0625.bin" || goto :error
tools\blz.exe -d "%_TEMP%\overlay_0627.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\field_094_tiles0.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_094_tiles1.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_095_layer0.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_096_blocks.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_098_tiles0.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_098_tiles1.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_099_layer0.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_100_blocks.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_223_blocks.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\field_265_blocks.dec" || goto :error
tools\lzss.exe -d "%_TEMP%\fieldcardforce\fieldcardforce_13.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\fieldcardforce\fieldcardforce_15.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\fieldcardforce\fieldcardforce_20.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\fieldcardforce_local\fieldcardforce_local_12.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\screen_common\screen_common_18.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\screen_local\screen_local_00.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\subscreen\subscreen_162.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\subscreen_local\subscreen_local_036.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\subscreen_record_local\subscreen_record_local_0.bin" || goto :error
tools\lzss.exe -d "%_TEMP%\models_taurus.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_cygnus.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_harp.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_libra.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_ophiuca.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_gemini_b.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_gemini_w.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_cancer.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_wolf.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_crown.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_leo.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_megaman.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_harp_speaker.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_cancer_claw.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_wolf_claw1.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_wolf_claw2.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_leo_claw.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_cygnus_feather.nsbmd"
tools\lzss.exe -d "%_TEMP%\models_megaman.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_megaman_charge.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_pegasus_charge.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_leo_charge.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_dragon_charge.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_bustercharge1.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_bustercharge2.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_busterchargefire.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_bustershot.nsbmd" || goto :error
tools\lzss.exe -d "%_TEMP%\models_guard.nsbmd" || goto :error
copy /Y "%_TEMP%\field_096_blocks.dec" "%_TEMP%\field_096_blocks.bak.dec"
copy /Y "%_TEMP%\field_100_blocks.dec" "%_TEMP%\field_100_blocks.bak.dec"
copy /Y "%_TEMP%\field_223_blocks.dec" "%_TEMP%\field_223_blocks.bak.dec"
copy /Y "%_TEMP%\field_265_blocks.dec" "%_TEMP%\field_265_blocks.bak.dec"

echo Extracting fonts...
tools\PixelPet.exe Import-Bytes "%_TEMP%\arm9.dec" -o 0xCB608 -l 0x8800 Export-Bytes "%_TEMP%\font0.bin" || goto :error
tools\PixelPet.exe Import-Bytes "%_TEMP%\arm9.dec" -o 0xD3E08 -l 0x8800 Export-Bytes "%_TEMP%\font1.bin" || goto :error
tools\PixelPet.exe Import-Bytes "%_TEMP%\arm9.dec" -o 0xDC608 -l 0xF180 Export-Bytes "%_TEMP%\font2.bin" || goto :error

echo Generating graphics...
call gfx.bat || goto :error

echo Generating sprites...
tools\armips.exe "sprite/mirror.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/mettenna.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/mettenna-simple.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/musicbox.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/omegaxis.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/cepheus.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/mrhertz.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/mrhertz-gold.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
rem tools\armips.exe "sprite/mrfamous.spr.asm" ^
rem 	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/mrfamous-face.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/transer.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error
tools\armips.exe "sprite/titlescreen-ui.spr.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error

echo Importing text...
tools\TextPet.exe ^
	Load-Plugins "tools\plugins" ^
	Game MMSF1 ^
	Read-Text-Archives "%_TEMP%\mess" --format msg ^
	Read-Text-Archives "tpl" --format tpl --patch ^
	Insert-Text-Boxes "txt" --recursive ^
	Write-Text-Archives "%_TPL_OUT%" --format tpl --single ^
	Write-Text-Archives "%_TXT_OUT%" --format txt --single ^
	Write-Text-Archives "%_TEMP%\mess_out" --format msg || goto :error

echo Importing sound...
python sound.py "%_TEMP%" || goto :error

echo Importing textures...
python texture.py "%_TEMP%" || goto :error

echo Importing files...
rem Banner
copy /Y imports\banner.bin "%_TEMP%\banner.bin"
rem Pat mugshot
copy /Y imports\sprites_face_pat.spr.bin "%_TEMP%\subscreen\subscreen_169.bin"
rem Personal Screen tiles
copy /Y "%_TEMP%\personal-pegasus.img.bin" "%_TEMP%\subscreen\subscreen_170.bin"
copy /Y "%_TEMP%\personal-leo.img.bin" "%_TEMP%\subscreen\subscreen_171.bin"
copy /Y "%_TEMP%\personal-dragon.img.bin" "%_TEMP%\subscreen\subscreen_172.bin"
rem Personal Screen tilemap
copy /Y "%_TEMP%\personal.map.bin" "%_TEMP%\subscreen\subscreen_015.bin"
rem Personal Screen palette
copy /Y "%_TEMP%\personal-pegasus.pal.bin" "%_TEMP%\subscreen\subscreen_173.bin"
copy /Y "%_TEMP%\personal-leo.pal.bin" "%_TEMP%\subscreen\subscreen_174.bin"
copy /Y "%_TEMP%\personal-dragon.pal.bin" "%_TEMP%\subscreen\subscreen_175.bin"
rem Personal Screen Geo palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_012.bin" "%_TEMP%\subscreen\subscreen_176.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_012.bin" "%_TEMP%\subscreen\subscreen_177.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_012.bin" "%_TEMP%\subscreen\subscreen_178.bin"
rem Personal Screen Mega Man palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_018.bin" "%_TEMP%\subscreen\subscreen_179.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_018.bin" "%_TEMP%\subscreen\subscreen_180.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_018.bin" "%_TEMP%\subscreen\subscreen_181.bin"
rem Transer Screen admin icon palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_004.bin" "%_TEMP%\subscreen\subscreen_182.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_004.bin" "%_TEMP%\subscreen\subscreen_183.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_004.bin" "%_TEMP%\subscreen\subscreen_184.bin"
rem Transer Screen admin icon tiles
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_003.bin" "%_TEMP%\subscreen\subscreen_185.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_003.bin" "%_TEMP%\subscreen\subscreen_186.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_003.bin" "%_TEMP%\subscreen\subscreen_187.bin"
rem Transer Screen background palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_002.bin" "%_TEMP%\subscreen\subscreen_188.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_002.bin" "%_TEMP%\subscreen\subscreen_189.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_002.bin" "%_TEMP%\subscreen\subscreen_190.bin"
rem Transer Screen background tilemap
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_001.bin" "%_TEMP%\subscreen\subscreen_191.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_001.bin" "%_TEMP%\subscreen\subscreen_192.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_001.bin" "%_TEMP%\subscreen\subscreen_193.bin"
rem Transer Screen background tiles
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_000.bin" "%_TEMP%\subscreen\subscreen_194.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_000.bin" "%_TEMP%\subscreen\subscreen_195.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_000.bin" "%_TEMP%\subscreen\subscreen_196.bin"
rem Transer Screen admin icon tilemap 1
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_005.bin" "%_TEMP%\subscreen\subscreen_197.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_005.bin" "%_TEMP%\subscreen\subscreen_198.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_005.bin" "%_TEMP%\subscreen\subscreen_199.bin"
rem Transer Screen admin icon tilemap 2
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_006.bin" "%_TEMP%\subscreen\subscreen_200.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_006.bin" "%_TEMP%\subscreen\subscreen_201.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_006.bin" "%_TEMP%\subscreen\subscreen_202.bin"
rem Transer Screen admin icon tilemap 3
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_007.bin" "%_TEMP%\subscreen\subscreen_203.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_007.bin" "%_TEMP%\subscreen\subscreen_204.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_007.bin" "%_TEMP%\subscreen\subscreen_205.bin"
rem Transer Screen admin icon tilemap 4
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_008.bin" "%_TEMP%\subscreen\subscreen_206.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_008.bin" "%_TEMP%\subscreen\subscreen_207.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_008.bin" "%_TEMP%\subscreen\subscreen_208.bin"
rem Transer Screen admin icon tilemap 5
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_009.bin" "%_TEMP%\subscreen\subscreen_209.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_009.bin" "%_TEMP%\subscreen\subscreen_210.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_009.bin" "%_TEMP%\subscreen\subscreen_211.bin"
rem Transer Screen admin icon tilemap 6
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_010.bin" "%_TEMP%\subscreen\subscreen_212.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_010.bin" "%_TEMP%\subscreen\subscreen_213.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_010.bin" "%_TEMP%\subscreen\subscreen_214.bin"
rem Mega Screen background tiles
copy /Y "%_TEMP%\megascreen-pegasus.img.bin" "%_TEMP%\subscreen\subscreen_215.bin"
copy /Y "%_TEMP%\megascreen-leo.img.bin" "%_TEMP%\subscreen\subscreen_216.bin"
copy /Y "%_TEMP%\megascreen-dragon.img.bin" "%_TEMP%\subscreen\subscreen_217.bin"
rem Mega Screen background map
copy /Y "%_TEMP%\megascreen.map.bin" "%_TEMP%\subscreen\subscreen_028.bin"
rem Mega Screen background palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_029.bin" "%_TEMP%\subscreen\subscreen_218.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_029.bin" "%_TEMP%\subscreen\subscreen_219.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_029.bin" "%_TEMP%\subscreen\subscreen_220.bin"
rem Mega Screen Transer System tiles
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_030.bin" "%_TEMP%\subscreen\subscreen_221.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_030.bin" "%_TEMP%\subscreen\subscreen_222.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_030.bin" "%_TEMP%\subscreen\subscreen_223.bin"
rem Mega Screen Transer System palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_032.bin" "%_TEMP%\subscreen\subscreen_224.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_032.bin" "%_TEMP%\subscreen\subscreen_225.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_032.bin" "%_TEMP%\subscreen\subscreen_226.bin"
rem Brother Screen buttons 1
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_021.bin" "%_TEMP%\subscreen\subscreen_227.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_021.bin" "%_TEMP%\subscreen\subscreen_228.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_021.bin" "%_TEMP%\subscreen\subscreen_229.bin"
rem Brother Screen buttons 2
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_022.bin" "%_TEMP%\subscreen\subscreen_230.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_022.bin" "%_TEMP%\subscreen\subscreen_231.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_022.bin" "%_TEMP%\subscreen\subscreen_232.bin"
rem Brother Screen background tiles
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_023.bin" "%_TEMP%\subscreen\subscreen_233.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_023.bin" "%_TEMP%\subscreen\subscreen_234.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_023.bin" "%_TEMP%\subscreen\subscreen_235.bin"
rem Brother Screen background palette
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_025.bin" "%_TEMP%\subscreen\subscreen_236.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_025.bin" "%_TEMP%\subscreen\subscreen_237.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_025.bin" "%_TEMP%\subscreen\subscreen_238.bin"
rem Brother Screen admin sprite
copy /Y "%_TEMP%\pegasus\subscreen\subscreen_020.bin" "%_TEMP%\subscreen\subscreen_239.bin"
copy /Y "%_TEMP%\leo\subscreen\subscreen_020.bin" "%_TEMP%\subscreen\subscreen_240.bin"
copy /Y "%_TEMP%\dragon\subscreen\subscreen_020.bin" "%_TEMP%\subscreen\subscreen_241.bin"
rem Mega Screen (empty) background map
copy /Y "%_TEMP%\megascreen-empty.map.bin" "%_TEMP%\subscreen\subscreen_243.bin"
rem Personal Screen Level tiles
copy /Y "%_TEMP%\personal-pegasus-lv.img.bin" "%_TEMP%\subscreen_local\subscreen_local_139.bin"
copy /Y "%_TEMP%\personal-leo-lv.img.bin" "%_TEMP%\subscreen_local\subscreen_local_140.bin"
copy /Y "%_TEMP%\personal-dragon-lv.img.bin" "%_TEMP%\subscreen_local\subscreen_local_141.bin"
rem Personal Screen Exit tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_006.bin" "%_TEMP%\subscreen_local\subscreen_local_142.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_006.bin" "%_TEMP%\subscreen_local\subscreen_local_143.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_006.bin" "%_TEMP%\subscreen_local\subscreen_local_144.bin"
rem Personal Screen HP tiles
copy /Y "%_TEMP%\personal-pegasus-hp.img.bin" "%_TEMP%\subscreen_local\subscreen_local_145.bin"
copy /Y "%_TEMP%\personal-leo-hp.img.bin" "%_TEMP%\subscreen_local\subscreen_local_146.bin"
copy /Y "%_TEMP%\personal-dragon-hp.img.bin" "%_TEMP%\subscreen_local\subscreen_local_147.bin"
rem Personal Screen Favorite tiles
copy /Y "%_TEMP%\personal-pegasus-favorite.img.bin" "%_TEMP%\subscreen_local\subscreen_local_148.bin"
copy /Y "%_TEMP%\personal-leo-favorite.img.bin" "%_TEMP%\subscreen_local\subscreen_local_149.bin"
copy /Y "%_TEMP%\personal-dragon-favorite.img.bin" "%_TEMP%\subscreen_local\subscreen_local_150.bin"
rem Transer Screen Equip 1 tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_012.bin" "%_TEMP%\subscreen_local\subscreen_local_151.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_012.bin" "%_TEMP%\subscreen_local\subscreen_local_152.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_012.bin" "%_TEMP%\subscreen_local\subscreen_local_153.bin"
rem Transer Screen Equip 2 tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_014.bin" "%_TEMP%\subscreen_local\subscreen_local_154.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_014.bin" "%_TEMP%\subscreen_local\subscreen_local_155.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_014.bin" "%_TEMP%\subscreen_local\subscreen_local_156.bin"
rem Transer Screen Equip 3 tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_016.bin" "%_TEMP%\subscreen_local\subscreen_local_157.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_016.bin" "%_TEMP%\subscreen_local\subscreen_local_158.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_016.bin" "%_TEMP%\subscreen_local\subscreen_local_159.bin"
rem Transer Screen HP tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_018.bin" "%_TEMP%\subscreen_local\subscreen_local_160.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_018.bin" "%_TEMP%\subscreen_local\subscreen_local_161.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_018.bin" "%_TEMP%\subscreen_local\subscreen_local_162.bin"
rem Transer Screen Zenny tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_020.bin" "%_TEMP%\subscreen_local\subscreen_local_163.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_020.bin" "%_TEMP%\subscreen_local\subscreen_local_164.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_020.bin" "%_TEMP%\subscreen_local\subscreen_local_165.bin"
rem Transer Screen Buttons
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_022.bin" "%_TEMP%\subscreen_local\subscreen_local_166.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_022.bin" "%_TEMP%\subscreen_local\subscreen_local_167.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_022.bin" "%_TEMP%\subscreen_local\subscreen_local_168.bin"
rem Mega Screen Ability tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_023.bin" "%_TEMP%\subscreen_local\subscreen_local_169.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_023.bin" "%_TEMP%\subscreen_local\subscreen_local_170.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_023.bin" "%_TEMP%\subscreen_local\subscreen_local_171.bin"
rem Mega Screen Exit tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_025.bin" "%_TEMP%\subscreen_local\subscreen_local_172.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_025.bin" "%_TEMP%\subscreen_local\subscreen_local_173.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_025.bin" "%_TEMP%\subscreen_local\subscreen_local_174.bin"
rem Mega Screen Mega Man tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_027.bin" "%_TEMP%\subscreen_local\subscreen_local_175.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_027.bin" "%_TEMP%\subscreen_local\subscreen_local_176.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_027.bin" "%_TEMP%\subscreen_local\subscreen_local_177.bin"
rem Mega Screen Weapon tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_029.bin" "%_TEMP%\subscreen_local\subscreen_local_178.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_029.bin" "%_TEMP%\subscreen_local\subscreen_local_179.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_029.bin" "%_TEMP%\subscreen_local\subscreen_local_180.bin"
rem Mega Screen Mega tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_031.bin" "%_TEMP%\subscreen_local\subscreen_local_181.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_031.bin" "%_TEMP%\subscreen_local\subscreen_local_182.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_031.bin" "%_TEMP%\subscreen_local\subscreen_local_183.bin"
rem Brother Screen Exit tiles
copy /Y "%_TEMP%\pegasus\subscreen_local\subscreen_local_000.bin" "%_TEMP%\subscreen_local\subscreen_local_184.bin"
copy /Y "%_TEMP%\leo\subscreen_local\subscreen_local_000.bin" "%_TEMP%\subscreen_local\subscreen_local_185.bin"
copy /Y "%_TEMP%\dragon\subscreen_local\subscreen_local_000.bin" "%_TEMP%\subscreen_local\subscreen_local_186.bin"
rem Records buttons
copy /Y imports\sprites_record.spr.bin "%_TEMP%\subscreen_record\subscreen_record_4.bin"
rem Title Screen
copy /Y "%_TEMP%\titlescreen.img.bin" "%_TEMP%\screen_common\screen_common_15.bin"
copy /Y "%_TEMP%\titlescreen.map.bin" "%_TEMP%\screen_common\screen_common_16.bin"
rem Mega Screen Scanner options
copy /Y "%_TEMP%\subscreen\subscreen_162.bin" "%_TEMP%\subscreen_local\subscreen_local_187.bin"
rem Battle Card icons
copy /Y "%_TEMP%\cardicons.img.bin" "%_TEMP%\subscreen\subscreen_088.bin"
copy /Y "%_TEMP%\cardicons.pal.bin" "%_TEMP%\subscreen\subscreen_089.bin"
copy /Y "%_TEMP%\cardicons-star.img.bin" "%_TEMP%\subscreen\subscreen_242.bin"
rem Satellite Admin overworld sprites
copy /Y imports\fieldobj_pegasusmagic.spr.bin "%_TEMP%\fieldobj\fieldobj_369.bin"
copy /Y imports\fieldobj_leokingdom.spr.bin "%_TEMP%\fieldobj\fieldobj_370.bin"
copy /Y imports\fieldobj_dragonsky.spr.bin "%_TEMP%\fieldobj\fieldobj_371.bin"
rem Mirror overworld sprite
copy /Y "%_TEMP%\mirror.spr.bin" "%_TEMP%\fieldobj\fieldobj_372.bin"
rem Mettenna overworld sprite
copy /Y "%_TEMP%\mettenna.spr.bin" "%_TEMP%\fieldobj\fieldobj_373.bin"
copy /Y "%_TEMP%\mettenna-simple.spr.bin" "%_TEMP%\fieldobj\fieldobj_114.bin"
rem Brother Data
copy /Y imports\brodata-boktai1-aaron.bin "%_TEMP%\field_local\field_local_09.bin"
copy /Y imports\brodata-boktai2-lucian.bin "%_TEMP%\field_local\field_local_10.bin"
copy /Y imports\brodata-boktai3-toasty.bin "%_TEMP%\field_local\field_local_11.bin"
copy /Y imports\brodata-boktai4-nero.bin "%_TEMP%\field_local\field_local_12.bin"
copy /Y imports\brodata-boktai5-bea.bin "%_TEMP%\field_local\field_local_13.bin"
copy /Y imports\brodata-boktai6-lisbeth.bin "%_TEMP%\field_local\field_local_14.bin"
rem Mega Man mugshot
copy /Y "imports\fieldface_megaman.spr.bin" "%_TEMP%\fieldface\fieldface_061.bin"
rem Omega-Xis mugshot
copy /Y "%_TEMP%\omegaxis.spr.bin" "%_TEMP%\fieldface\fieldface_062.bin"
rem Cepheus mugshot
copy /Y "%_TEMP%\cepheus.spr.bin" "%_TEMP%\fieldface\fieldface_082.bin"
rem Mr. Hertz mugshot
copy /Y "%_TEMP%\mrhertz.spr.bin" "%_TEMP%\fieldface\fieldface_084.bin"
copy /Y "%_TEMP%\mrhertz-gold.spr.bin" "%_TEMP%\fieldface\fieldface_102.bin"
rem Mr. Famous field object
rem copy /Y "%_TEMP%\mrfamous.spr.bin" "%_TEMP%\fieldobj\fieldobj_374.bin"
copy /Y imports\fieldobj_mrfamous.spr.bin "%_TEMP%\fieldobj\fieldobj_374.bin"
rem Mr. Famous mugshot
copy /Y "%_TEMP%\mrfamous-face.spr.bin" "%_TEMP%\fieldface\fieldface_107.bin"
rem Transer field object
copy /Y "%_TEMP%\transer.spr.bin" "%_TEMP%\fieldobj\fieldobj_144.bin"
rem Station Comp cursor
copy /Y "%_TEMP%\stationcomp-cursor.img.bin" "%_TEMP%\fieldminigame\fieldminigame_12.bin"
rem Hollow files
copy /Y "%_TEMP%\models_hollow.nsbmd" "%_TEMP%\models\models_468.bin"
rem Hollow sparks
copy /Y "%_TEMP%\mmsf2\models\models_651.bin" "%_TEMP%\models\models_469.bin"
rem Hollow barrier
copy /Y "%_TEMP%\mmsf2\models\models_653.bin" "%_TEMP%\models\models_470.bin"
rem Hollow magic
copy /Y "%_TEMP%\mmsf2\models\models_654.bin" "%_TEMP%\models\models_471.bin"
rem Hollow bazooka
copy /Y "%_TEMP%\models_hollowbazooka.nsbmd" "%_TEMP%\models\models_472.bin"
rem Hollow charge yellow
copy /Y "%_TEMP%\mmsf2\models\models_658.bin" "%_TEMP%\models\models_473.bin"
rem Hollow charge black
copy /Y "%_TEMP%\mmsf2\models\models_659.bin" "%_TEMP%\models\models_474.bin"
rem Hollow beam black
copy /Y "%_TEMP%\mmsf2\models\models_451.bin" "%_TEMP%\models\models_475.bin"
rem Hollow fan
copy /Y "%_TEMP%\mmsf2\models\models_454.bin" "%_TEMP%\models\models_476.bin"
rem Hollow hands yellow
copy /Y "%_TEMP%\mmsf2\models\models_660.bin" "%_TEMP%\models\models_477.bin"
rem Hollow hands black
copy /Y "%_TEMP%\mmsf2\models\models_661.bin" "%_TEMP%\models\models_478.bin"
rem Hollow bolt black
copy /Y "%_TEMP%\mmsf2\models\models_468.bin" "%_TEMP%\models\models_479.bin"
rem Hollow animations
copy /Y "%_TEMP%\mmsf2\motions\motions_0277.bin" "%_TEMP%\motions\motions_850.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0278.bin" "%_TEMP%\motions\motions_851.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0279.bin" "%_TEMP%\motions\motions_852.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0280.bin" "%_TEMP%\motions\motions_853.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0281.bin" "%_TEMP%\motions\motions_854.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0282.bin" "%_TEMP%\motions\motions_855.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0283.bin" "%_TEMP%\motions\motions_856.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0284.bin" "%_TEMP%\motions\motions_857.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0285.bin" "%_TEMP%\motions\motions_858.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0286.bin" "%_TEMP%\motions\motions_859.bin"
rem Hollow sparks animation
copy /Y "%_TEMP%\mmsf2\motions\motions_1025.bin" "%_TEMP%\motions\motions_860.bin"
rem Hollow barrier animations
copy /Y "%_TEMP%\mmsf2\motions\motions_1026.bin" "%_TEMP%\motions\motions_861.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_1027.bin" "%_TEMP%\motions\motions_862.bin"
rem Hollow magic animation
copy /Y "%_TEMP%\mmsf2\motions\motions_1028.bin" "%_TEMP%\motions\motions_863.bin"
rem Hollow bazooka animations
copy /Y "%_TEMP%\mmsf2\motions\motions_0682.bin" "%_TEMP%\motions\motions_864.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0683.bin" "%_TEMP%\motions\motions_865.bin"
rem Hollow charge animation
copy /Y "%_TEMP%\mmsf2\motions\motions_1034.bin" "%_TEMP%\motions\motions_866.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_1035.bin" "%_TEMP%\motions\motions_867.bin"
rem Hollow hands animation
copy /Y "%_TEMP%\mmsf2\motions\motions_1036.bin" "%_TEMP%\motions\motions_868.bin"
rem Hollow bolt animations
copy /Y "%_TEMP%\mmsf2\motions\motions_0872.bin" "%_TEMP%\motions\motions_869.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0873.bin" "%_TEMP%\motions\motions_870.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0874.bin" "%_TEMP%\motions\motions_871.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0876.bin" "%_TEMP%\motions\motions_872.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0877.bin" "%_TEMP%\motions\motions_873.bin"
copy /Y "%_TEMP%\mmsf2\motions\motions_0878.bin" "%_TEMP%\motions\motions_874.bin"
copy /Y "%_TEMP%\stages_hollow.nsbmd" "%_TEMP%\stages\stages_33.bin"
rem Virus database files
copy /Y "%_TEMP%\counter-hit.pal.bin" "%_TEMP%\subscreen_record_local\subscreen_record_local_6.bin"
copy /Y "%_TEMP%\counter-hit.img.bin" "%_TEMP%\subscreen_record_local\subscreen_record_local_7.bin"
copy /Y "%_TEMP%\database.map.bin" "%_TEMP%\subscreen_record_local\subscreen_record_local_8.bin"
rem Title Screen UI
copy /Y "%_TEMP%\titlescreen-ui.spr.bin" "%_TEMP%\screen_local\screen_local_01.bin"
rem Mega Man model
copy /Y "%_TEMP%\models_megaman_sf3hair.nsbmd" "%_TEMP%\models\models_151.bin"
rem Heat/Aqua Armor
copy /Y "%_TEMP%\models_heatarmor.nsbmd" "%_TEMP%\models\models_480.bin"
copy /Y "%_TEMP%\models_aquaarmor.nsbmd" "%_TEMP%\models\models_481.bin"
copy /Y "%_TEMP%\models_elecarmor.nsbmd" "%_TEMP%\models\models_482.bin"
copy /Y "%_TEMP%\models_woodarmor.nsbmd" "%_TEMP%\models\models_483.bin"
rem Card Trader
copy /Y "imports\fieldobj_cardtrader.spr.bin" "%_TEMP%\fieldobj\fieldobj_254.bin"
rem 1000 Note Challenge
copy /Y "%_TEMP%\notegame-sprites.img.bin" "%_TEMP%\fieldminigame\fieldminigame_13.bin"
copy /Y "%_TEMP%\notegame-sprites.pal.bin" "%_TEMP%\fieldminigame\fieldminigame_14.bin"
rem Music box field object
copy /Y "%_TEMP%\musicbox.spr.bin" "%_TEMP%\fieldobj\fieldobj_375.bin"
rem Star Frag shop
copy /Y "%_TEMP%\starfrag-shop.map.bin" "%_TEMP%\shop_local\shop_local_4.bin"
copy /Y "%_TEMP%\starfrag-shop.img.bin" "%_TEMP%\shop_local\shop_local_5.bin"
rem Mystery Wave
copy /Y "imports\fieldobj_mysterywave.spr.bin" "%_TEMP%\fieldobj\fieldobj_142.bin"
rem Ken Suther
copy /Y imports\fieldobj_kensuther.spr.bin "%_TEMP%\fieldobj\fieldobj_015.bin"
rem Boss panel
copy /Y imports\fieldobj_bosspanel.spr.bin "%_TEMP%\fieldobj\fieldobj_117.bin"
rem Mega Man
copy /Y imports\fieldobj_megaman-full.spr.bin "%_TEMP%\fieldobj\fieldobj_073.bin"
rem Thunderbolt
copy /Y imports\fieldobj_thunderbolt.spr.bin "%_TEMP%\fieldobj\fieldobj_376.bin"
rem Hollow
copy /Y imports\fieldobj_hollow.spr.bin "%_TEMP%\fieldobj\fieldobj_377.bin"
rem Hollow mugshot
copy /Y imports\fieldface_hollow.spr.bin "%_TEMP%\fieldface\fieldface_108.bin"
rem Wave ball
copy /Y imports\fieldobj_waveball.spr.bin "%_TEMP%\fieldobj\fieldobj_125.bin"
rem ThermoMan
copy /Y "%_TEMP%\thermoman.img.bin" "%_TEMP%\fieldcardforce\fieldcardforce_13.bin"
copy /Y "%_TEMP%\thermoman.pal.bin" "%_TEMP%\fieldcardforce\fieldcardforce_14.bin"
copy /Y "%_TEMP%\thermoman.map.bin" "%_TEMP%\fieldcardforce\fieldcardforce_15.bin"
rem Credits
copy /Y "%_TEMP%\credits-pegasus.img.bin" "%_TEMP%\capcomlogo\capcomlogo_96.bin"
copy /Y "%_TEMP%\credits-leo.img.bin" "%_TEMP%\capcomlogo\capcomlogo_97.bin"
copy /Y "%_TEMP%\credits-dragon.img.bin" "%_TEMP%\capcomlogo\capcomlogo_98.bin"
copy /Y "%_TEMP%\credits-pegasus.map.bin" "%_TEMP%\capcomlogo\capcomlogo_99.bin"
copy /Y "%_TEMP%\credits-leo.map.bin" "%_TEMP%\capcomlogo\capcomlogo_100.bin"
copy /Y "%_TEMP%\credits-dragon.map.bin" "%_TEMP%\capcomlogo\capcomlogo_101.bin"
rem Extra premade face pics
copy /Y imports\broface_geohappy.spr.bin "%_TEMP%\subscreen_face\subscreen_face_53.bin"
copy /Y imports\broface_hope.spr.bin "%_TEMP%\subscreen_face\subscreen_face_54.bin"
copy /Y imports\broface_kelvin.spr.bin "%_TEMP%\subscreen_face\subscreen_face_55.bin"
copy /Y imports\broface_boreal.spr.bin "%_TEMP%\subscreen_face\subscreen_face_56.bin"
copy /Y imports\broface_shepar.spr.bin "%_TEMP%\subscreen_face\subscreen_face_57.bin"
copy /Y imports\broface_pat.spr.bin "%_TEMP%\subscreen_face\subscreen_face_58.bin"
copy /Y imports\broface_cepheus.spr.bin "%_TEMP%\subscreen_face\subscreen_face_59.bin"
copy /Y imports\broface_megaman.spr.bin "%_TEMP%\subscreen_face\subscreen_face_60.bin"
copy /Y imports\broface_icepegasus.spr.bin "%_TEMP%\subscreen_face\subscreen_face_61.bin"
copy /Y imports\broface_fireleo.spr.bin "%_TEMP%\subscreen_face\subscreen_face_62.bin"
copy /Y imports\broface_greendragon.spr.bin "%_TEMP%\subscreen_face\subscreen_face_63.bin"
copy /Y imports\broface_spacesuit.spr.bin "%_TEMP%\subscreen_face\subscreen_face_64.bin"
rem SPECIAL name for extra premade face pics
copy /Y imports\sprites_premade_face.spr.bin "%_TEMP%\subscreen_face_local\subscreen_face_local_01.bin"
rem Connect menu sprites
copy /Y imports\sprites_connect.spr.bin "%_TEMP%\screen_local\screen_local_08.bin"
rem On Air menu sprites
copy /Y imports\sprites_onair.spr.bin "%_TEMP%\subscreen_local\subscreen_local_099.bin"
rem Keyboard prerendered tiles
copy /Y "%_TEMP%\keyboard.img.bin" "%_TEMP%\subscreen_local\subscreen_local_188.bin"
rem Mail menu sprites
copy /Y imports\sprites_mail.spr.bin "%_TEMP%\subscreen_local\subscreen_local_101.bin"
rem Mail sort menu
copy /Y "%_TEMP%\mailsort.img.bin" "%_TEMP%\subscreen\subscreen_244.bin"
copy /Y "%_TEMP%\mailsort.map.bin" "%_TEMP%\subscreen\subscreen_245.bin"
copy /Y "%_TEMP%\mailsort.pal.bin" "%_TEMP%\subscreen\subscreen_246.bin"
rem Folder button labels
copy /Y imports\sprites_folder_labels.spr.bin "%_TEMP%\subscreen_local\subscreen_local_036.bin"
rem Boktai Brother page (English)
copy /Y imports\sprites_boktai_brother.spr.bin "%_TEMP%\subscreen_local\subscreen_local_135.bin"
copy /Y "%_TEMP%\boktai-brother-eng.img.bin" "%_TEMP%\subscreen_local\subscreen_local_136.bin"
copy /Y imports\boktai-brother.pal.bin "%_TEMP%\subscreen_local\subscreen_local_137.bin"
copy /Y "%_TEMP%\boktai-brother-eng.map.bin" "%_TEMP%\subscreen_local\subscreen_local_138.bin"
rem Wave Scanner data page sprites (English)
copy /Y imports\sprites_scannerdata.spr.bin "%_TEMP%\subscreen_local\subscreen_local_187.bin"
rem King Hertz
copy /Y imports\fieldobj_kinghertz.spr.bin "%_TEMP%\fieldobj\fieldobj_378.bin"
rem King Hertz mugshot
copy /Y imports\fieldface_kinghertz_blue.spr.bin "%_TEMP%\fieldface\fieldface_109.bin"
copy /Y imports\fieldface_kinghertz_yellow.spr.bin "%_TEMP%\fieldface\fieldface_110.bin"
rem Cygnus
copy /Y imports\fieldobj_cygnus.spr.bin "%_TEMP%\fieldobj\fieldobj_088.bin"
rem Libra
copy /Y imports\fieldobj_libra.spr.bin "%_TEMP%\fieldobj\fieldobj_090.bin"
rem Walking Jammer
copy /Y imports\fieldobj_jammer_walking.spr.bin "%_TEMP%\fieldobj\fieldobj_379.bin"
rem Star Frag counter
copy /Y "%_TEMP%\starfrag-counter.img.bin" "%_TEMP%\fieldcockpit\fieldcockpit_20.bin"
copy /Y "%_TEMP%\starfrag-counter.pal.bin" "%_TEMP%\fieldcockpit\fieldcockpit_21.bin"
rem Version
copy /Y imports\version.spr.bin "%_TEMP%\screen_common\screen_common_18.bin"
rem Gemini sprite
copy /Y imports\fieldobj_gemini.spr.bin "%_TEMP%\fieldobj\fieldobj_092.bin"
copy /Y imports\fieldobj_gemini_dash.spr.bin "%_TEMP%\fieldobj\fieldobj_341.bin"
rem Star Card Trader
copy /Y imports\fieldobj_trader_starcard.spr.bin "%_TEMP%\fieldobj\fieldobj_380.bin"
rem Star Frag Trader
copy /Y imports\fieldobj_trader_starfrag.spr.bin "%_TEMP%\fieldobj\fieldobj_381.bin"
rem Sheridan shadow mugshot
copy /Y imports\fieldface_sheridan_shadow.spr.bin "%_TEMP%\fieldface\fieldface_111.bin"
rem Shin shadow mugshot
copy /Y imports\fieldface_shin_shadow.spr.bin "%_TEMP%\fieldface\fieldface_112.bin"
rem Geo Color Mega Man
copy /Y "%_TEMP%\models_megaman_sf3hair_red.nsbmd" "%_TEMP%\models\models_484.bin"
copy /Y "%_TEMP%\models_megaman_charge_cyan.nsbmd" "%_TEMP%\models\models_485.bin"
copy /Y "%_TEMP%\models_pegasus_charge_cyan.nsbmd" "%_TEMP%\models\models_486.bin"
copy /Y "%_TEMP%\models_leo_charge_cyan.nsbmd" "%_TEMP%\models\models_487.bin"
copy /Y "%_TEMP%\models_dragon_charge_cyan.nsbmd" "%_TEMP%\models\models_488.bin"
copy /Y "%_TEMP%\models_bustercharge1_cyan.nsbmd" "%_TEMP%\models\models_489.bin"
copy /Y "%_TEMP%\models_bustercharge2_cyan.nsbmd" "%_TEMP%\models\models_490.bin"
copy /Y "%_TEMP%\models_busterchargefire_cyan.nsbmd" "%_TEMP%\models\models_491.bin"
copy /Y "%_TEMP%\models_bustershot_cyan.nsbmd" "%_TEMP%\models\models_492.bin"
rem Zack
copy /Y "imports\fieldobj_zack.spr.bin" "%_TEMP%\fieldobj\fieldobj_009.bin"
copy /Y "imports\fieldobj_zack2.spr.bin" "%_TEMP%\fieldobj\fieldobj_062.bin"
copy /Y "imports\fieldobj_zack256.spr.bin" "%_TEMP%\fieldobj\fieldobj_063.bin"
rem DX bosses
copy /Y "%_TEMP%\models_taurus_dx.nsbmd" "%_TEMP%\models\models_493.bin"
copy /Y "%_TEMP%\models_cygnus_dx.nsbmd" "%_TEMP%\models\models_494.bin"
copy /Y "%_TEMP%\models_harp_dx.nsbmd" "%_TEMP%\models\models_495.bin"
copy /Y "%_TEMP%\models_harp_speaker_dx.nsbmd" "%_TEMP%\models\models_496.bin"
copy /Y "%_TEMP%\models_libra_dx.nsbmd" "%_TEMP%\models\models_497.bin"
copy /Y "%_TEMP%\models_ophiuca_dx.nsbmd" "%_TEMP%\models\models_498.bin"
copy /Y "%_TEMP%\models_gemini_b_dx.nsbmd" "%_TEMP%\models\models_499.bin"
copy /Y "%_TEMP%\models_gemini_w_dx.nsbmd" "%_TEMP%\models\models_500.bin"
copy /Y "%_TEMP%\models_cancer_dx.nsbmd" "%_TEMP%\models\models_501.bin"
copy /Y "%_TEMP%\models_cancer_claw_dx.nsbmd" "%_TEMP%\models\models_502.bin"
copy /Y "%_TEMP%\models_wolf_dx.nsbmd" "%_TEMP%\models\models_503.bin"
copy /Y "%_TEMP%\models_wolf_claw1_dx.nsbmd" "%_TEMP%\models\models_504.bin"
copy /Y "%_TEMP%\models_wolf_claw2_dx.nsbmd" "%_TEMP%\models\models_505.bin"
copy /Y "%_TEMP%\models_crown_dx.nsbmd" "%_TEMP%\models\models_506.bin"
copy /Y "imports\texture_cygnus_bird_dx.nsbtx" "%_TEMP%\models\models_507.bin"
copy /Y "%_TEMP%\models_cygnus_feather_dx.nsbmd" "%_TEMP%\models\models_508.bin"
copy /Y "imports\texture_pegasus_dx.nsbtx" "%_TEMP%\models\models_509.bin"
copy /Y "imports\texture_dragon_dx.nsbtx" "%_TEMP%\models\models_510.bin"
copy /Y "imports\texture_andromeda_dx.nsbtx" "%_TEMP%\models\models_511.bin"
copy /Y "%_TEMP%\models_leo_dx.nsbmd" "%_TEMP%\models\models_512.bin"
copy /Y "%_TEMP%\models_leo_claw_dx.nsbmd" "%_TEMP%\models\models_513.bin"
copy /Y "%_TEMP%\models_hollow_dx.nsbmd" "%_TEMP%\models\models_514.bin"
copy /Y "%_TEMP%\models_hollowbazooka_dx.nsbmd" "%_TEMP%\models\models_515.bin"
rem DX Mega Man
copy /Y "%_TEMP%\models_megaman_sf3hair_gold.nsbmd" "%_TEMP%\models\models_516.bin"
copy /Y "%_TEMP%\models_megaman_charge_gold.nsbmd" "%_TEMP%\models\models_517.bin"
copy /Y "%_TEMP%\models_pegasus_charge_gold.nsbmd" "%_TEMP%\models\models_518.bin"
copy /Y "%_TEMP%\models_leo_charge_gold.nsbmd" "%_TEMP%\models\models_519.bin"
copy /Y "%_TEMP%\models_dragon_charge_gold.nsbmd" "%_TEMP%\models\models_520.bin"
copy /Y "%_TEMP%\models_bustercharge1_gold.nsbmd" "%_TEMP%\models\models_521.bin"
copy /Y "%_TEMP%\models_bustercharge2_gold.nsbmd" "%_TEMP%\models\models_522.bin"
copy /Y "%_TEMP%\models_busterchargefire_gold.nsbmd" "%_TEMP%\models\models_523.bin"
copy /Y "%_TEMP%\models_bustershot_gold.nsbmd" "%_TEMP%\models\models_524.bin"
rem Library NEW
copy /Y "%_TEMP%\library-new.img.bin" "%_TEMP%\subscreen\subscreen_148.bin"
rem Library controls
copy /Y "%_TEMP%\library-controls.img.bin" "%_TEMP%\subscreen_local\subscreen_local_103.bin"
copy /Y "%_TEMP%\library-controls.map.bin" "%_TEMP%\subscreen_local\subscreen_local_104.bin"
rem Game Over screen
copy /Y "%_TEMP%\pegasus\capcomlogo\capcomlogo_03.bin" "%_TEMP%\capcomlogo\capcomlogo_102.bin"
copy /Y "%_TEMP%\leo\capcomlogo\capcomlogo_03.bin" "%_TEMP%\capcomlogo\capcomlogo_103.bin"
copy /Y "%_TEMP%\dragon\capcomlogo\capcomlogo_03.bin" "%_TEMP%\capcomlogo\capcomlogo_104.bin"
copy /Y "%_TEMP%\pegasus\capcomlogo\capcomlogo_04.bin" "%_TEMP%\capcomlogo\capcomlogo_105.bin"
copy /Y "%_TEMP%\leo\capcomlogo\capcomlogo_04.bin" "%_TEMP%\capcomlogo\capcomlogo_106.bin"
copy /Y "%_TEMP%\dragon\capcomlogo\capcomlogo_04.bin" "%_TEMP%\capcomlogo\capcomlogo_107.bin"
copy /Y "%_TEMP%\pegasus\capcomlogo\capcomlogo_05.bin" "%_TEMP%\capcomlogo\capcomlogo_108.bin"
copy /Y "%_TEMP%\leo\capcomlogo\capcomlogo_05.bin" "%_TEMP%\capcomlogo\capcomlogo_109.bin"
copy /Y "%_TEMP%\dragon\capcomlogo\capcomlogo_05.bin" "%_TEMP%\capcomlogo\capcomlogo_110.bin"
rem Geo special sprites
copy /Y imports\fieldobj_geospecial_visualizer.spr.bin "%_TEMP%\fieldobj\fieldobj_382.bin"

echo Patching files...
tools\armips.exe "src_patch.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error

echo Compressing files...
copy /Y "%_TEMP%\arm9.dec" "%_TEMP%\arm9.bin"
copy /Y "%_TEMP%\overlay_0000.bin" "%_TEMP%\overlay\overlay_0000.bin"
copy /Y "%_TEMP%\overlay_0002.bin" "%_TEMP%\overlay\overlay_0002.bin"
copy /Y "%_TEMP%\overlay_0003.bin" "%_TEMP%\overlay\overlay_0003.bin"
copy /Y "%_TEMP%\overlay_0007.bin" "%_TEMP%\overlay\overlay_0007.bin"
copy /Y "%_TEMP%\overlay_0010.bin" "%_TEMP%\overlay\overlay_0010.bin"
copy /Y "%_TEMP%\overlay_0012.bin" "%_TEMP%\overlay\overlay_0012.bin"
copy /Y "%_TEMP%\overlay_0013.bin" "%_TEMP%\overlay\overlay_0013.bin"
copy /Y "%_TEMP%\overlay_0014.bin" "%_TEMP%\overlay\overlay_0014.bin"
copy /Y "%_TEMP%\overlay_0015.bin" "%_TEMP%\overlay\overlay_0015.bin"
copy /Y "%_TEMP%\overlay_0016.bin" "%_TEMP%\overlay\overlay_0016.bin"
copy /Y "%_TEMP%\overlay_0017.bin" "%_TEMP%\overlay\overlay_0017.bin"
copy /Y "%_TEMP%\overlay_0018.bin" "%_TEMP%\overlay\overlay_0018.bin"
copy /Y "%_TEMP%\overlay_0019.bin" "%_TEMP%\overlay\overlay_0019.bin"
copy /Y "%_TEMP%\overlay_0020.bin" "%_TEMP%\overlay\overlay_0020.bin"
copy /Y "%_TEMP%\overlay_0021.bin" "%_TEMP%\overlay\overlay_0021.bin"
copy /Y "%_TEMP%\overlay_0024.bin" "%_TEMP%\overlay\overlay_0024.bin"
copy /Y "%_TEMP%\overlay_0025.bin" "%_TEMP%\overlay\overlay_0025.bin"
copy /Y "%_TEMP%\overlay_0027.bin" "%_TEMP%\overlay\overlay_0027.bin"
copy /Y "%_TEMP%\overlay_0028.bin" "%_TEMP%\overlay\overlay_0028.bin"
copy /Y "%_TEMP%\overlay_0029.bin" "%_TEMP%\overlay\overlay_0029.bin"
copy /Y "%_TEMP%\overlay_0036.bin" "%_TEMP%\overlay\overlay_0036.bin"
copy /Y "%_TEMP%\overlay_0082.bin" "%_TEMP%\overlay\overlay_0082.bin"
copy /Y "%_TEMP%\overlay_0107.bin" "%_TEMP%\overlay\overlay_0107.bin"
copy /Y "%_TEMP%\overlay_0116.bin" "%_TEMP%\overlay\overlay_0116.bin"
copy /Y "%_TEMP%\overlay_0133.bin" "%_TEMP%\overlay\overlay_0133.bin"
copy /Y "%_TEMP%\overlay_0134.bin" "%_TEMP%\overlay\overlay_0134.bin"
copy /Y "%_TEMP%\overlay_0139.bin" "%_TEMP%\overlay\overlay_0139.bin"
copy /Y "%_TEMP%\overlay_0145.bin" "%_TEMP%\overlay\overlay_0145.bin"
copy /Y "%_TEMP%\overlay_0146.bin" "%_TEMP%\overlay\overlay_0146.bin"
copy /Y "%_TEMP%\overlay_0147.bin" "%_TEMP%\overlay\overlay_0147.bin"
copy /Y "%_TEMP%\overlay_0150.bin" "%_TEMP%\overlay\overlay_0150.bin"
copy /Y "%_TEMP%\overlay_0157.bin" "%_TEMP%\overlay\overlay_0157.bin"
copy /Y "%_TEMP%\overlay_0159.bin" "%_TEMP%\overlay\overlay_0159.bin"
copy /Y "%_TEMP%\overlay_0161.bin" "%_TEMP%\overlay\overlay_0161.bin"
copy /Y "%_TEMP%\overlay_0162.bin" "%_TEMP%\overlay\overlay_0162.bin"
copy /Y "%_TEMP%\overlay_0167.bin" "%_TEMP%\overlay\overlay_0167.bin"
copy /Y "%_TEMP%\overlay_0172.bin" "%_TEMP%\overlay\overlay_0172.bin"
copy /Y "%_TEMP%\overlay_0177.bin" "%_TEMP%\overlay\overlay_0177.bin"
copy /Y "%_TEMP%\overlay_0178.bin" "%_TEMP%\overlay\overlay_0178.bin"
copy /Y "%_TEMP%\overlay_0179.bin" "%_TEMP%\overlay\overlay_0179.bin"
copy /Y "%_TEMP%\overlay_0180.bin" "%_TEMP%\overlay\overlay_0180.bin"
copy /Y "%_TEMP%\overlay_0181.bin" "%_TEMP%\overlay\overlay_0181.bin"
copy /Y "%_TEMP%\overlay_0182.bin" "%_TEMP%\overlay\overlay_0182.bin"
copy /Y "%_TEMP%\overlay_0183.bin" "%_TEMP%\overlay\overlay_0183.bin"
copy /Y "%_TEMP%\overlay_0184.bin" "%_TEMP%\overlay\overlay_0184.bin"
copy /Y "%_TEMP%\overlay_0185.bin" "%_TEMP%\overlay\overlay_0185.bin"
copy /Y "%_TEMP%\overlay_0186.bin" "%_TEMP%\overlay\overlay_0186.bin"
copy /Y "%_TEMP%\overlay_0187.bin" "%_TEMP%\overlay\overlay_0187.bin"
copy /Y "%_TEMP%\overlay_0188.bin" "%_TEMP%\overlay\overlay_0188.bin"
copy /Y "%_TEMP%\overlay_0189.bin" "%_TEMP%\overlay\overlay_0189.bin"
copy /Y "%_TEMP%\overlay_0190.bin" "%_TEMP%\overlay\overlay_0190.bin"
copy /Y "%_TEMP%\overlay_0191.bin" "%_TEMP%\overlay\overlay_0191.bin"
copy /Y "%_TEMP%\overlay_0193.bin" "%_TEMP%\overlay\overlay_0193.bin"
copy /Y "%_TEMP%\overlay_0197.bin" "%_TEMP%\overlay\overlay_0197.bin"
copy /Y "%_TEMP%\overlay_0198.bin" "%_TEMP%\overlay\overlay_0198.bin"
copy /Y "%_TEMP%\overlay_0200.bin" "%_TEMP%\overlay\overlay_0200.bin"
copy /Y "%_TEMP%\overlay_0201.bin" "%_TEMP%\overlay\overlay_0201.bin"
copy /Y "%_TEMP%\overlay_0202.bin" "%_TEMP%\overlay\overlay_0202.bin"
copy /Y "%_TEMP%\overlay_0203.bin" "%_TEMP%\overlay\overlay_0203.bin"
copy /Y "%_TEMP%\overlay_0204.bin" "%_TEMP%\overlay\overlay_0204.bin"
copy /Y "%_TEMP%\overlay_0205.bin" "%_TEMP%\overlay\overlay_0205.bin"
copy /Y "%_TEMP%\overlay_0207.bin" "%_TEMP%\overlay\overlay_0207.bin"
copy /Y "%_TEMP%\overlay_0208.bin" "%_TEMP%\overlay\overlay_0208.bin"
copy /Y "%_TEMP%\overlay_0210.bin" "%_TEMP%\overlay\overlay_0210.bin"
copy /Y "%_TEMP%\overlay_0211.bin" "%_TEMP%\overlay\overlay_0211.bin"
copy /Y "%_TEMP%\overlay_0213.bin" "%_TEMP%\overlay\overlay_0213.bin"
copy /Y "%_TEMP%\overlay_0219.bin" "%_TEMP%\overlay\overlay_0219.bin"
copy /Y "%_TEMP%\overlay_0220.bin" "%_TEMP%\overlay\overlay_0220.bin"
copy /Y "%_TEMP%\overlay_0221.bin" "%_TEMP%\overlay\overlay_0221.bin"
copy /Y "%_TEMP%\overlay_0235.bin" "%_TEMP%\overlay\overlay_0235.bin"
copy /Y "%_TEMP%\overlay_0238.bin" "%_TEMP%\overlay\overlay_0238.bin"
copy /Y "%_TEMP%\overlay_0260.bin" "%_TEMP%\overlay\overlay_0260.bin"
copy /Y "%_TEMP%\overlay_0269.bin" "%_TEMP%\overlay\overlay_0269.bin"
copy /Y "%_TEMP%\overlay_0277.bin" "%_TEMP%\overlay\overlay_0277.bin"
copy /Y "%_TEMP%\overlay_0286.bin" "%_TEMP%\overlay\overlay_0286.bin"
copy /Y "%_TEMP%\overlay_0287.bin" "%_TEMP%\overlay\overlay_0287.bin"
copy /Y "%_TEMP%\overlay_0293.bin" "%_TEMP%\overlay\overlay_0293.bin"
copy /Y "%_TEMP%\overlay_0298.bin" "%_TEMP%\overlay\overlay_0298.bin"
copy /Y "%_TEMP%\overlay_0320.bin" "%_TEMP%\overlay\overlay_0320.bin"
copy /Y "%_TEMP%\overlay_0322.bin" "%_TEMP%\overlay\overlay_0322.bin"
copy /Y "%_TEMP%\overlay_0333.bin" "%_TEMP%\overlay\overlay_0333.bin"
copy /Y "%_TEMP%\overlay_0376.bin" "%_TEMP%\overlay\overlay_0376.bin"
copy /Y "%_TEMP%\overlay_0391.bin" "%_TEMP%\overlay\overlay_0391.bin"
copy /Y "%_TEMP%\overlay_0426.bin" "%_TEMP%\overlay\overlay_0426.bin"
copy /Y "%_TEMP%\overlay_0445.bin" "%_TEMP%\overlay\overlay_0445.bin"
copy /Y "%_TEMP%\overlay_0449.bin" "%_TEMP%\overlay\overlay_0449.bin"
copy /Y "%_TEMP%\overlay_0453.bin" "%_TEMP%\overlay\overlay_0453.bin"
copy /Y "%_TEMP%\overlay_0463.bin" "%_TEMP%\overlay\overlay_0463.bin"
copy /Y "%_TEMP%\overlay_0464.bin" "%_TEMP%\overlay\overlay_0464.bin"
copy /Y "%_TEMP%\overlay_0465.bin" "%_TEMP%\overlay\overlay_0465.bin"
copy /Y "%_TEMP%\overlay_0466.bin" "%_TEMP%\overlay\overlay_0466.bin"
copy /Y "%_TEMP%\overlay_0467.bin" "%_TEMP%\overlay\overlay_0467.bin"
copy /Y "%_TEMP%\overlay_0468.bin" "%_TEMP%\overlay\overlay_0468.bin"
copy /Y "%_TEMP%\overlay_0469.bin" "%_TEMP%\overlay\overlay_0469.bin"
copy /Y "%_TEMP%\overlay_0470.bin" "%_TEMP%\overlay\overlay_0470.bin"
copy /Y "%_TEMP%\overlay_0471.bin" "%_TEMP%\overlay\overlay_0471.bin"
copy /Y "%_TEMP%\overlay_0479.bin" "%_TEMP%\overlay\overlay_0479.bin"
copy /Y "%_TEMP%\overlay_0480.bin" "%_TEMP%\overlay\overlay_0480.bin"
copy /Y "%_TEMP%\overlay_0511.bin" "%_TEMP%\overlay\overlay_0511.bin"
copy /Y "%_TEMP%\overlay_0512.bin" "%_TEMP%\overlay\overlay_0512.bin"
copy /Y "%_TEMP%\overlay_0517.bin" "%_TEMP%\overlay\overlay_0517.bin"
copy /Y "%_TEMP%\overlay_0518.bin" "%_TEMP%\overlay\overlay_0518.bin"
copy /Y "%_TEMP%\overlay_0519.bin" "%_TEMP%\overlay\overlay_0519.bin"
copy /Y "%_TEMP%\overlay_0520.bin" "%_TEMP%\overlay\overlay_0520.bin"
copy /Y "%_TEMP%\overlay_0521.bin" "%_TEMP%\overlay\overlay_0521.bin"
copy /Y "%_TEMP%\overlay_0522.bin" "%_TEMP%\overlay\overlay_0522.bin"
copy /Y "%_TEMP%\overlay_0523.bin" "%_TEMP%\overlay\overlay_0523.bin"
copy /Y "%_TEMP%\overlay_0524.bin" "%_TEMP%\overlay\overlay_0524.bin"
copy /Y "%_TEMP%\overlay_0525.bin" "%_TEMP%\overlay\overlay_0525.bin"
copy /Y "%_TEMP%\overlay_0526.bin" "%_TEMP%\overlay\overlay_0526.bin"
copy /Y "%_TEMP%\overlay_0527.bin" "%_TEMP%\overlay\overlay_0527.bin"
copy /Y "%_TEMP%\overlay_0528.bin" "%_TEMP%\overlay\overlay_0528.bin"
copy /Y "%_TEMP%\overlay_0530.bin" "%_TEMP%\overlay\overlay_0530.bin"
copy /Y "%_TEMP%\overlay_0535.bin" "%_TEMP%\overlay\overlay_0535.bin"
copy /Y "%_TEMP%\overlay_0536.bin" "%_TEMP%\overlay\overlay_0536.bin"
copy /Y "%_TEMP%\overlay_0537.bin" "%_TEMP%\overlay\overlay_0537.bin"
copy /Y "%_TEMP%\overlay_0538.bin" "%_TEMP%\overlay\overlay_0538.bin"
copy /Y "%_TEMP%\overlay_0539.bin" "%_TEMP%\overlay\overlay_0539.bin"
copy /Y "%_TEMP%\overlay_0540.bin" "%_TEMP%\overlay\overlay_0540.bin"
copy /Y "%_TEMP%\overlay_0541.bin" "%_TEMP%\overlay\overlay_0541.bin"
copy /Y "%_TEMP%\overlay_0542.bin" "%_TEMP%\overlay\overlay_0542.bin"
copy /Y "%_TEMP%\overlay_0543.bin" "%_TEMP%\overlay\overlay_0543.bin"
copy /Y "%_TEMP%\overlay_0544.bin" "%_TEMP%\overlay\overlay_0544.bin"
copy /Y "%_TEMP%\overlay_0551.bin" "%_TEMP%\overlay\overlay_0551.bin"
copy /Y "%_TEMP%\overlay_0556.bin" "%_TEMP%\overlay\overlay_0556.bin"
copy /Y "%_TEMP%\overlay_0559.bin" "%_TEMP%\overlay\overlay_0559.bin"
copy /Y "%_TEMP%\overlay_0566.bin" "%_TEMP%\overlay\overlay_0566.bin"
copy /Y "%_TEMP%\overlay_0573.bin" "%_TEMP%\overlay\overlay_0573.bin"
copy /Y "%_TEMP%\overlay_0577.bin" "%_TEMP%\overlay\overlay_0577.bin"
copy /Y "%_TEMP%\overlay_0578.bin" "%_TEMP%\overlay\overlay_0578.bin"
copy /Y "%_TEMP%\overlay_0579.bin" "%_TEMP%\overlay\overlay_0579.bin"
copy /Y "%_TEMP%\overlay_0580.bin" "%_TEMP%\overlay\overlay_0580.bin"
copy /Y "%_TEMP%\overlay_0581.bin" "%_TEMP%\overlay\overlay_0581.bin"
copy /Y "%_TEMP%\overlay_0582.bin" "%_TEMP%\overlay\overlay_0582.bin"
copy /Y "%_TEMP%\overlay_0599.bin" "%_TEMP%\overlay\overlay_0599.bin"
copy /Y "%_TEMP%\overlay_0600.bin" "%_TEMP%\overlay\overlay_0600.bin"
copy /Y "%_TEMP%\overlay_0601.bin" "%_TEMP%\overlay\overlay_0601.bin"
copy /Y "%_TEMP%\overlay_0602.bin" "%_TEMP%\overlay\overlay_0602.bin"
copy /Y "%_TEMP%\overlay_0603.bin" "%_TEMP%\overlay\overlay_0603.bin"
copy /Y "%_TEMP%\overlay_0604.bin" "%_TEMP%\overlay\overlay_0604.bin"
copy /Y "%_TEMP%\overlay_0605.bin" "%_TEMP%\overlay\overlay_0605.bin"
copy /Y "%_TEMP%\overlay_0606.bin" "%_TEMP%\overlay\overlay_0606.bin"
copy /Y "%_TEMP%\overlay_0607.bin" "%_TEMP%\overlay\overlay_0607.bin"
copy /Y "%_TEMP%\overlay_0608.bin" "%_TEMP%\overlay\overlay_0608.bin"
copy /Y "%_TEMP%\overlay_0609.bin" "%_TEMP%\overlay\overlay_0609.bin"
copy /Y "%_TEMP%\overlay_0610.bin" "%_TEMP%\overlay\overlay_0610.bin"
copy /Y "%_TEMP%\overlay_0611.bin" "%_TEMP%\overlay\overlay_0611.bin"
copy /Y "%_TEMP%\overlay_0624.bin" "%_TEMP%\overlay\overlay_0624.bin"
copy /Y "%_TEMP%\overlay_0625.bin" "%_TEMP%\overlay\overlay_0625.bin"
copy /Y "%_TEMP%\overlay_0627.bin" "%_TEMP%\overlay\overlay_0627.bin"
copy /Y "%_TEMP%\overlay_0646.bin" "%_TEMP%\overlay\overlay_0646.bin"
copy /Y "%_TEMP%\overlay_0647.bin" "%_TEMP%\overlay\overlay_0647.bin"
copy /Y "%_TEMP%\overlay_0648.bin" "%_TEMP%\overlay\overlay_0648.bin"
copy /Y "%_TEMP%\overlay_0649.bin" "%_TEMP%\overlay\overlay_0649.bin"
copy /Y "%_TEMP%\overlay_0650.bin" "%_TEMP%\overlay\overlay_0650.bin"
copy /Y "%_TEMP%\overlay_0651.bin" "%_TEMP%\overlay\overlay_0651.bin"
copy /Y "%_TEMP%\overlay_0652.bin" "%_TEMP%\overlay\overlay_0652.bin"
copy /Y "%_TEMP%\overlay_0653.bin" "%_TEMP%\overlay\overlay_0653.bin"
copy /Y "%_TEMP%\overlay_0654.bin" "%_TEMP%\overlay\overlay_0654.bin"
copy /Y "%_TEMP%\overlay_0655.bin" "%_TEMP%\overlay\overlay_0655.bin"
copy /Y "%_TEMP%\overlay_0656.bin" "%_TEMP%\overlay\overlay_0656.bin"
copy /Y "%_TEMP%\overlay_0657.bin" "%_TEMP%\overlay\overlay_0657.bin"
copy /Y "%_TEMP%\overlay_0658.bin" "%_TEMP%\overlay\overlay_0658.bin"
copy /Y "%_TEMP%\overlay_0659.bin" "%_TEMP%\overlay\overlay_0659.bin"
copy /Y "%_TEMP%\overlay_0660.bin" "%_TEMP%\overlay\overlay_0660.bin"
copy /Y "%_TEMP%\overlay_0661.bin" "%_TEMP%\overlay\overlay_0661.bin"
copy /Y "%_TEMP%\overlay_0662.bin" "%_TEMP%\overlay\overlay_0662.bin"
copy /Y "%_TEMP%\overlay_0663.bin" "%_TEMP%\overlay\overlay_0663.bin"
copy /Y "%_TEMP%\field_094_tiles0.dec" "%_TEMP%\field_094_tiles0.bin"
copy /Y "%_TEMP%\field_098_tiles0.dec" "%_TEMP%\field_098_tiles0.bin"
tools\blz.exe -en9 "%_TEMP%\arm9.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0000.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0002.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0003.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0007.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0010.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0012.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0013.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0014.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0015.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0016.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0017.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0018.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0019.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0020.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0021.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0024.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0025.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0027.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0028.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0029.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0036.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0082.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0107.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0116.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0133.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0134.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0139.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0145.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0146.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0147.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0150.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0157.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0159.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0161.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0162.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0167.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0172.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0177.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0178.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0179.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0180.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0181.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0182.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0183.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0184.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0185.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0186.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0187.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0188.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0189.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0190.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0191.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0193.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0197.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0198.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0200.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0201.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0202.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0203.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0204.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0205.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0207.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0208.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0210.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0211.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0213.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0219.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0220.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0221.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0235.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0238.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0260.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0269.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0277.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0286.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0287.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0293.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0298.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0320.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0322.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0333.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0376.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0391.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0426.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0445.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0449.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0453.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0463.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0464.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0465.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0466.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0467.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0468.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0469.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0470.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0471.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0479.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0480.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0511.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0512.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0517.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0518.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0519.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0520.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0521.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0522.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0523.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0524.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0525.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0526.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0527.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0528.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0530.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0535.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0536.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0537.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0538.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0539.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0540.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0541.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0542.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0543.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0544.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0551.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0556.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0559.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0566.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0573.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0577.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0578.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0579.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0580.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0581.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0582.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0599.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0600.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0601.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0602.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0603.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0604.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0605.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0606.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0607.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0608.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0609.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0610.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0611.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0624.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0625.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0627.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0646.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0647.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0648.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0649.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0650.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0651.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0652.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0653.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0654.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0655.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0656.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0657.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0658.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0659.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0660.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0661.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0662.bin" || goto :error
tools\blz.exe -en "%_TEMP%\overlay\overlay_0663.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\capcomlogo\capcomlogo_102.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\capcomlogo\capcomlogo_103.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\capcomlogo\capcomlogo_104.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_094_tiles0.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_095_layer0.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_096_blocks.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_098_tiles0.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_099_layer0.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_100_blocks.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_223_blocks.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_265_blocks.dec" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_09.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_10.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_11.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_12.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_13.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\field_local\field_local_14.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldcardforce\fieldcardforce_13.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldcardforce\fieldcardforce_15.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldcardforce\fieldcardforce_20.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldcardforce_local\fieldcardforce_local_12.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldcockpit\fieldcockpit_20.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldminigame\fieldminigame_12.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldminigame\fieldminigame_13.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_009.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_062.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_063.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_073.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_088.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_090.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_092.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_254.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_341.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_369.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_370.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_371.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_372.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_373.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_374.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_375.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_376.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_377.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_378.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_379.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_380.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_381.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\fieldobj\fieldobj_382.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_151.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_468.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_469.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_470.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_471.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_472.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_473.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_474.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_475.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_476.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_477.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_478.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_479.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_480.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_481.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_482.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_483.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_484.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_485.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_486.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_487.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_488.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_489.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_490.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_491.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_492.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_493.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_494.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_495.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_496.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_497.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_498.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_499.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_500.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_501.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_502.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_503.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_504.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_505.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_506.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_507.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_508.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_509.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_510.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_511.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_512.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_513.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_514.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_515.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_516.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_517.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_518.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_519.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_520.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_521.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_522.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_523.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\models\models_524.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\screen_common\screen_common_15.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\screen_common\screen_common_16.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\screen_common\screen_common_18.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\screen_local\screen_local_00.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\shop_local\shop_local_4.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\shop_local\shop_local_5.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_028.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_051.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_052.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_053.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_054.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_055.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_056.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_057.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_058.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_059.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_060.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_061.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_062.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_074.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_075.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_215.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_216.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_217.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_243.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_244.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen\subscreen_245.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_local\subscreen_local_036.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_local\subscreen_local_101.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_local\subscreen_local_103.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record\subscreen_record_4.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record\subscreen_record_7.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record\subscreen_record_8.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record\subscreen_record_9.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record_local\subscreen_record_local_0.bin" || goto :error
tools\lzss.exe %_LZSS_FLAGS% "%_TEMP%\subscreen_record_local\subscreen_record_local_7.bin" || goto :error

echo Post-processing files...
tools\armips.exe "src_post.asm" ^
	-strequ TEMP "%_TEMP%" || goto :error

echo Packing archives...
tools\sfarctool.exe -p -i "%_TEMP%\battlecard" -o "%_TEMP%\data\datbin\com\battlecard.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\capcomlogo" -o "%_TEMP%\data\datbin\com\capcomlogo.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\field" -o "%_TEMP%\data\datbin\com\field.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldcardforce" -o "%_TEMP%\data\datbin\com\fieldcardforce.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldcockpit" -o "%_TEMP%\data\datbin\com\fieldcockpit.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldface" -o "%_TEMP%\data\datbin\com\fieldface.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldminigame" -o "%_TEMP%\data\datbin\com\fieldminigame.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldobj" -o "%_TEMP%\data\datbin\com\fieldobj.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\models" -o "%_TEMP%\data\datbin\com\models.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\motions" -o "%_TEMP%\data\datbin\com\motions.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\screen_common" -o "%_TEMP%\data\datbin\com\screen_common.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\stages" -o "%_TEMP%\data\datbin\com\stages.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen" -o "%_TEMP%\data\datbin\com\subscreen.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen_face" -o "%_TEMP%\data\datbin\com\subscreen_face.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen_record" -o "%_TEMP%\data\datbin\com\subscreen_record.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\field_local" -o "%_TEMP%\data\datbin\eng\field_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\fieldcardforce_local" -o "%_TEMP%\data\datbin\eng\fieldcardforce_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\mess_out" -o "%_TEMP%\data\datbin\eng\mess.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen_local" -o "%_TEMP%\data\datbin\eng\subscreen_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen_record_local" -o "%_TEMP%\data\datbin\eng\subscreen_record_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\subscreen_face_local" -o "%_TEMP%\data\datbin\eng\subscreen_face_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\screen_local" -o "%_TEMP%\data\datbin\eng\screen_local.bin" || goto :error
tools\sfarctool.exe -p -i "%_TEMP%\shop_local" -o "%_TEMP%\data\datbin\eng\shop_local.bin" || goto :error

echo Creating ROM...
tools\ndstool.exe -c "%_ROM_OUT%" ^
	-9 "%_TEMP%\arm9.bin" ^
	-7 "%_TEMP%\arm7.bin" ^
	-d "%_TEMP%\data" ^
	-y "%_TEMP%\overlay" ^
	-h "%_TEMP%\header.bin" ^
	-y9 "%_TEMP%\y9.bin" ^
	-y7 "%_TEMP%\y7.bin" ^
	-t "%_TEMP%\banner.bin" || goto :error

echo.
:done
echo Done.
exit /b 0

:error
pause