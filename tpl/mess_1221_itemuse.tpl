@archive mess_1221
@size 110

script 0 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You don't need
	to use a SubCard
	right now.
	"""
	keyWait
	waitHold
	end
}
script 2 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to
	use "
	"""
	printItemBuffered
		buffer = 2
	"""
	"?
	
	"""
	positionOptionFromCenter
		width = 12
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 3 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You don't need
	that card right
	now!
	"""
	keyWait
	waitHold
	end
}
script 4 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	This card is
	used
	automatically.
	"""
	keyWait
	waitHold
	end
}
script 5 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	It's used. Plus,
	you don't need
	that card now!
	"""
	keyWait
	waitHold
	end
}
script 6 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	This enhancement
	item is for use
	w/Lunar Knights.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Try sending it
	to a Lunar
	Knights Brother.
	"""
	keyWait
	waitHold
	end
}
script 7 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to overwrite
	"
	"""
	printItemBuffered
		buffer = 2
	"""
	"?
	
	"""
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 15 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	mugshotHide
	"""
	Mega's waves glow
	red,attracting
	Fire enemies.
	"""
	keyWait
	waitHold
	end
}
script 16 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	mugshotHide
	"""
	Mega's waves glow
	blue,attracting
	Aqua enemies.
	"""
	keyWait
	waitHold
	end
}
script 17 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	mugshotHide
	"""
	Mega's waves glow
	yellow,attracting
	Elec enemies.
	"""
	keyWait
	waitHold
	end
}
script 18 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	mugshotHide
	"""
	Mega's waves glow
	green,attracting
	Wood enemies.
	"""
	keyWait
	waitHold
	end
}
script 19 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 2
	"\"!"
	keyWait
	waitHold
	end
}
script 20 mmsf1 {
	"  ×"
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadSpaces
	end
}
script 25 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Please choose
	your gift to
	your Brother.
	"""
	keyWait
	waitHold
	end
}
script 26 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Really don't
	give anything?
	
	"""
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 27 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Give \""
	printItemBuffered
		buffer = 0
	"""
	"
	to your Brother?
	
	"""
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 30 mmsf1 {
	soundPlay
		sound = 137
	checkFlag
		flag = 0xF03A
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkFlag
		flag = 0xF03B
		jumpIfTrue = 32
		jumpIfFalse = continue
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Want to equip
	the "
	"""
	printItem
		item = 81
	"""
	"?
	
	"""
	positionOptionFromCenter
		width = 147
	optionText
		up = 0
		down = 0
		left = 2
		right = 1
	"  Off "
	optionText
		up = 1
		down = 1
		left = 0
		right = 2
	"  Type 1 "
	optionText
		up = 2
		down = 2
		left = 1
		right = 0
	"  Type 2"
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 33
		jump2 = 34
		jump3 = 35
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 31 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Want to equip
	the "
	"""
	printItem
		item = 81
	"""
	"?
	
	"""
	positionOptionFromCenter
		width = 147
	optionText
		up = 0
		down = 0
		left = 2
		right = 1
	"  Off "
	optionText
		up = 1
		down = 1
		left = 0
		right = 2
	"  Type 1 "
	optionText
		up = 2
		down = 2
		left = 1
		right = 0
	"  Type 2"
	selectText
		default = 1
		BContinue = true
		disableB = false
		unused = false
		jump1 = 33
		jump2 = 34
		jump3 = 35
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 32 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Want to equip
	the "
	"""
	printItem
		item = 81
	"""
	"?
	
	"""
	positionOptionFromCenter
		width = 147
	optionText
		up = 0
		down = 0
		left = 2
		right = 1
	"  Off "
	optionText
		up = 1
		down = 1
		left = 0
		right = 2
	"  Type 1 "
	optionText
		up = 2
		down = 2
		left = 1
		right = 0
	"  Type 2"
	selectText
		default = 2
		BContinue = true
		disableB = false
		unused = false
		jump1 = 33
		jump2 = 34
		jump3 = 35
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 33 mmsf1 {
	clearMsg
	flagClear
		flag = 0xF03A
	flagClear
		flag = 0xF03B
	callMugshotShowGeoMenu
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Turned the
	"
	"""
	printItem
		item = 81
	"""
	" off!
	"""
	keyWait
	waitHold
	end
}
script 34 mmsf1 {
	clearMsg
	flagSet
		flag = 0xF03A
	flagClear
		flag = 0xF03B
	callMugshotShowGeoMenu
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Set the
	"
	"""
	printItem
		item = 81
	"""
	" to
	Type 1!
	"""
	keyWait
	waitHold
	end
}
script 35 mmsf1 {
	clearMsg
	flagClear
		flag = 0xF03A
	flagSet
		flag = 0xF03B
	callMugshotShowGeoMenu
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Set the
	"
	"""
	printItem
		item = 81
	"""
	" to
	Type 2!
	"""
	keyWait
	waitHold
	end
}
script 40 mmsf1 {
	soundPlay
		sound = 137
	msgOpenQuick
	"""
	Connecting.
	"""
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 30
	clearMsg
	callMugshotShowShinNormalOrShadow
	"""
	It's Legendary!
	Hi there, Geo!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF03D
		jumpIfTrue = 42
		jumpIfFalse = 41
	waitHold
	end
}
script 41 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	You're playing Normal Mode
	now. Want to switch?
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 42 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	You're playing Legend Mode
	now. Want to switch?
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 43 mmsf1 {
	checkFlag
		flag = 0xF03D
		jumpIfTrue = 44
		jumpIfFalse = continue
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 75
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Normal Mode\n"
	positionOptionFromCenter
		width = 75
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Legend Mode\n"
	positionOptionFromCenter
		width = 75
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Explain"
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 46
		jump2 = 49
		jump3 = 50
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 45
}
script 44 mmsf1 {
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 75
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Normal Mode\n"
	positionOptionFromCenter
		width = 75
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Legend Mode\n"
	positionOptionFromCenter
		width = 75
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Explain"
	selectText
		default = 1
		BContinue = true
		disableB = false
		unused = false
		jump1 = 48
		jump2 = 47
		jump3 = 50
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 45
}
script 45 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	Keep it Legendary!
	Bye!
	"""
	keyWait
	waitHold
	end
}
script 46 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	OK, let's keep playing
	on Normal Mode!
	"""
	keyWait
	clearMsg
	jump
		target = 45
}
script 47 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	OK, let's keep playing
	on Legend Mode!
	"""
	keyWait
	clearMsg
	jump
		target = 45
}
script 48 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	Do you want to change
	to Normal Mode?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 1
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 43
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	flagClear
		flag = 0xF03D
	flagSet
		flag = 0xF03E
	clearMsg
	soundPlay
		sound = 204
	wait
		frames = 15
	"""
	OK, switched to
	Normal Mode!
	"""
	keyWait
	clearMsg
	jump
		target = 45
}
script 49 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	Do you want to change
	to Legend Mode?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 1
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 43
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	flagSet
		flag = 0xF03D
	soundPlay
		sound = 204
	wait
		frames = 15
	"""
	OK, switched to
	Legend Mode!
	"""
	keyWait
	clearMsg
	"""
	Good luck, and
	keep it Legendary!
	Bye!
	"""
	keyWait
	waitHold
	end
}
script 50 mmsf1 {
	callMugshotShowShinNormalOrShadow
	"""
	Normal Mode is recommended
	for most players.
	"""
	keyWait
	clearMsg
	"""
	In this mode, enemies will
	have their usual stats.
	"""
	keyWait
	clearMsg
	"""
	Legend Mode is a mode for
	truly 
	"""
	wait
		frames = 20
	"""
	Legendary players!
	"""
	keyWait
	clearMsg
	"""
	In Legend Mode, all
	enemies' HP, speed and
	Attack Power increase!
	"""
	keyWait
	clearMsg
	"""
	Some enemies' behavior
	will also change...
	"""
	keyWait
	clearMsg
	"""
	You can change modes at
	any time from Key Items!
	"""
	keyWait
	clearMsg
	"""
	Legendary!
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 60 mmsf1 {
	soundPlay
		sound = 137
	msgOpenQuick
	checkFlag
		flag = 0xF17A
		jumpIfTrue = 62
		jumpIfFalse = continue
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to change
	into Mega Man Geo?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 61
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 61 mmsf1 {
	clearMsg
	callMugshotShowGeoMenu
	flagSet
		flag = 0xF17A
	flagClear
		flag = 0xF197
	callReloadColorChangeHumorBuster
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Mega Man Geo has
	been turned ON!
	"""
	keyWait
	waitHold
	end
}
script 62 mmsf1 {
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to return
	to your original look?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 63
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 63 mmsf1 {
	clearMsg
	callMugshotShowGeoMenu
	flagClear
		flag = 0xF17A
	flagClear
		flag = 0xF197
	callReloadColorChangeHumorBuster
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Mega Man Geo has
	been turned OFF!
	"""
	keyWait
	waitHold
	end
}
script 65 mmsf1 {
	soundPlay
		sound = 137
	msgOpenQuick
	checkFlag
		flag = 0xF197
		jumpIfTrue = 67
		jumpIfFalse = continue
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to change
	into Mega Man DX?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 66
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 66 mmsf1 {
	clearMsg
	callMugshotShowGeoMenu
	flagSet
		flag = 0xF197
	flagClear
		flag = 0xF17A
	callReloadColorChangeHumorBuster
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Mega Man DX has
	been turned ON!
	"""
	keyWait
	waitHold
	end
}
script 67 mmsf1 {
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Do you want to return
	to your original look?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 68
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 68 mmsf1 {
	clearMsg
	callMugshotShowGeoMenu
	flagClear
		flag = 0xF17A
	flagClear
		flag = 0xF197
	callReloadColorChangeHumorBuster
	soundPlay
		sound = 204
	wait
		frames = 15
	textSpeed
		delay = 0
	"""
	Mega Man DX has
	been turned OFF!
	"""
	keyWait
	waitHold
	end
}
script 70 mmsf1 {
	soundPlay
		sound = 137
	msgOpenQuick
	"""
	Connecting.
	"""
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 30
	clearMsg
	mugshotShow
		mugshot = MrFamous
	"""
	Hey there, Geo!
	"""
	keyWait
	clearMsg
	callBufferNumberDXBossesDefeated
		bufferDefeated = 5
		bufferLeft = 6
	callCheckBuffer
		buffer = 5
		value = 0
		jumpIfLess = 71
		jumpIfEqual = 71
		jumpIfGreater = 72
	end
}
script 71 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	You haven't defeated any
	of the DX Bosses yet.
	"""
	keyWait
	clearMsg
	jump
		target = 95
}
script 72 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	So far, you've defeated
	these DX Bosses:
	"""
	keyWait
	clearMsg
	jump
		target = 75
}
script 75 mmsf1 {
	checkFlag
		flag = 0xF17F
		jumpIfTrue = continue
		jumpIfFalse = 76
	mugshotShow
		mugshot = MrFamous
	"""
	The blazing bull,
	Taurus Fire DX!
	"""
	keyWait
	clearMsg
	jump
		target = 76
}
script 76 mmsf1 {
	checkFlag
		flag = 0xF180
		jumpIfTrue = continue
		jumpIfFalse = 77
	mugshotShow
		mugshot = MrFamous
	"""
	The graceful swan,
	Cygnus Wing DX!
	"""
	keyWait
	clearMsg
	jump
		target = 77
}
script 77 mmsf1 {
	checkFlag
		flag = 0xF181
		jumpIfTrue = continue
		jumpIfFalse = 78
	mugshotShow
		mugshot = MrFamous
	"""
	The melodious muse,
	Harp Note DX!
	"""
	keyWait
	clearMsg
	jump
		target = 78
}
script 78 mmsf1 {
	checkFlag
		flag = 0xF182
		jumpIfTrue = continue
		jumpIfFalse = 79
	mugshotShow
		mugshot = MrFamous
	"""
	The balanced master,
	Libra Scales DX!
	"""
	keyWait
	clearMsg
	jump
		target = 79
}
script 79 mmsf1 {
	checkFlag
		flag = 0xF183
		jumpIfTrue = continue
		jumpIfFalse = 80
	mugshotShow
		mugshot = MrFamous
	"""
	The snake empress,
	Queen Ophiuca DX!
	"""
	keyWait
	clearMsg
	jump
		target = 80
}
script 80 mmsf1 {
	checkFlag
		flag = 0xF184
		jumpIfTrue = continue
		jumpIfFalse = 81
	mugshotShow
		mugshot = MrFamous
	"""
	The thunder twins,
	Gemini Spark DX!
	"""
	keyWait
	clearMsg
	jump
		target = 81
}
script 81 mmsf1 {
	checkFlag
		flag = 0xF186
		jumpIfTrue = continue
		jumpIfFalse = 82
	mugshotShow
		mugshot = MrFamous
	"""
	The crabby crustacean,
	Cancer Bubble DX!
	"""
	keyWait
	clearMsg
	jump
		target = 82
}
script 82 mmsf1 {
	checkFlag
		flag = 0xF187
		jumpIfTrue = continue
		jumpIfFalse = 83
	mugshotShow
		mugshot = MrFamous
	"""
	The frenzied beast,
	Wolf Woods DX!
	"""
	keyWait
	clearMsg
	jump
		target = 83
}
script 83 mmsf1 {
	checkFlag
		flag = 0xF188
		jumpIfTrue = continue
		jumpIfFalse = 84
	mugshotShow
		mugshot = MrFamous
	"""
	The electric lord,
	Crown Thunder DX!
	"""
	keyWait
	clearMsg
	jump
		target = 84
}
script 84 mmsf1 {
	checkFlag
		flag = 0xF189
		jumpIfTrue = continue
		jumpIfFalse = 85
	mugshotShow
		mugshot = MrFamous
	"""
	The frigid equine,
	Pegasus Magic DX!
	"""
	keyWait
	clearMsg
	jump
		target = 85
}
script 85 mmsf1 {
	checkFlag
		flag = 0xF18A
		jumpIfTrue = continue
		jumpIfFalse = 86
	mugshotShow
		mugshot = MrFamous
	"""
	The burning lion,
	Leo Kingdom DX!
	"""
	keyWait
	clearMsg
	jump
		target = 86
}
script 86 mmsf1 {
	checkFlag
		flag = 0xF18B
		jumpIfTrue = continue
		jumpIfFalse = 87
	mugshotShow
		mugshot = MrFamous
	"""
	The verdant drake,
	Dragon Sky DX!
	"""
	keyWait
	clearMsg
	jump
		target = 87
}
script 87 mmsf1 {
	checkFlag
		flag = 0xF18C
		jumpIfTrue = continue
		jumpIfFalse = 88
	mugshotShow
		mugshot = MrFamous
	"""
	The bolt from the blue,
	???? DX!
	"""
	keyWait
	clearMsg
	jump
		target = 88
}
script 88 mmsf1 {
	checkFlag
		flag = 0xF185
		jumpIfTrue = continue
		jumpIfFalse = 90
	mugshotShow
		mugshot = MrFamous
	"""
	The cosmic ruiner,
	Andromeda DX!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 90 mmsf1 {
	callCheckBuffer
		buffer = 5
		value = 13
		jumpIfLess = continue
		jumpIfEqual = 92
		jumpIfGreater = 93
	callCheckBuffer
		buffer = 5
		value = 12
		jumpIfLess = continue
		jumpIfEqual = 91
		jumpIfGreater = 91
	mugshotShow
		mugshot = MrFamous
	"""
	There are still
	
	"""
	printBuffer
		buffer = 6
		minLength = 2
		padMode = noPad
	"""
	 DX Bosses left!
	"""
	keyWait
	clearMsg
	jump
		target = 95
}
script 91 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	There is still
	
	"""
	printBuffer
		buffer = 6
		minLength = 2
		padMode = noPad
	"""
	 DX Boss left!
	"""
	keyWait
	clearMsg
	jump
		target = 95
}
script 92 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	One final DX Boss awaits...
	This will be an epic battle!
	"""
	keyWait
	clearMsg
	jump
		target = 95
}
script 93 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	You've defeated every
	single DX Boss!
	"""
	keyWait
	clearMsg
	jump
		target = 95
}
script 95 mmsf1 {
	checkFlag
		flag = 0xF17D
		jumpIfTrue = 97
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrFamous
	"""
	Do you want to
	activate the DX Card?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 96
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 96 mmsf1 {
	clearMsg
	mugshotShow
		mugshot = MrFamous
	flagSet
		flag = 0xF17D
	soundPlay
		sound = 204
	wait
		frames = 15
	"""
	...OK! DX Bosses will
	now appear. Good luck!
	"""
	keyWait
	waitHold
	end
}
script 97 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Do you want to
	deactivate the DX Card?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 98
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	waitHold
	end
}
script 98 mmsf1 {
	clearMsg
	mugshotShow
		mugshot = MrFamous
	flagClear
		flag = 0xF17D
	soundPlay
		sound = 204
	wait
		frames = 15
	"""
	...OK! DX Bosses will
	no longer appear.
	Bye!
	"""
	keyWait
	waitHold
	end
}
script 100 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	Power Up Data can be
	edited on the third page
	of the Mega Screen.
	"""
	keyWait
	waitHold
	end
}