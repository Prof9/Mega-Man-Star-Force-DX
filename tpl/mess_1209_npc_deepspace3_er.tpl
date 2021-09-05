@archive mess_1209
@size 256

script 0 mmsf1 {
	checkFlag
		flag = 313
		jumpIfTrue = 1
		jumpIfFalse = continue
	msgOpen
	mugshotShowNPC
		npc = 0
	"W-What's this?"
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 80
		amount = 1
	playerAnimate
		animation = 24
	"""
	MegaMan got:
	"
	"""
	printItem
		item = 80
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	flagSet
		flag = 313
	callHideNPC
		npc = 0
	mugshotShowNPC
		npc = 0
	"Dad's Transer..."
	keyWait
	clearMsg
	"""
	Hm? There's
	something still
	on it...
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 31
		amount = 1
	playerAnimate
		animation = 24
	"""
	MegaMan got
	Mega weapon:
	"
	"""
	printItem
		item = 31
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 1 mmsf1 {
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 187
	end
}
script 11 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Get outta here for now!
	"""
	keyWait
	clearMsg
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	TAURUS FIRE
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 0
	callBufferExVar
		flag = 0xF300
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF300
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF308
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00A
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF300
		value = 20
	callSetExVar
		flag = 0xF308
		value = 0
	callBufferExVar
		flag = 0xF300
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF300
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF308
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	CYGNUS WING
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 1
	callBufferExVar
		flag = 0xF310
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF310
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF318
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00B
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF310
		value = 25
	callSetExVar
		flag = 0xF318
		value = 0
	callBufferExVar
		flag = 0xF310
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF310
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF318
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	HARP NOTE
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 2
	callBufferExVar
		flag = 0xF320
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF320
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF328
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00C
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF320
		value = 25
	callSetExVar
		flag = 0xF328
		value = 0
	callBufferExVar
		flag = 0xF320
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF320
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF328
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	LIBRA SCALES
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 3
	callBufferExVar
		flag = 0xF330
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF330
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF338
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00D
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF330
		value = 20
	callSetExVar
		flag = 0xF338
		value = 0
	callBufferExVar
		flag = 0xF330
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF330
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF338
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	QUEEN OPHIUCA
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 4
	callBufferExVar
		flag = 0xF340
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF340
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF348
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00E
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF340
		value = 20
	callSetExVar
		flag = 0xF348
		value = 0
	callBufferExVar
		flag = 0xF340
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF340
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF348
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	GEMINI SPARK
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 5
	callBufferExVar
		flag = 0xF350
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF350
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF358
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF00F
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF350
		value = 25
	callSetExVar
		flag = 0xF358
		value = 0
	callBufferExVar
		flag = 0xF350
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF350
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF358
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	CANCER BUBBLE
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 6
	callBufferExVar
		flag = 0xF360
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF360
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF368
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF010
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF360
		value = 25
	callSetExVar
		flag = 0xF368
		value = 0
	callBufferExVar
		flag = 0xF360
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF360
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF368
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	WOLF WOODS
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 7
	callBufferExVar
		flag = 0xF370
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF370
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF378
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF011
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF370
		value = 25
	callSetExVar
		flag = 0xF378
		value = 0
	callBufferExVar
		flag = 0xF370
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF370
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF378
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	CROWN THUNDER
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 8
	callBufferExVar
		flag = 0xF380
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF380
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF388
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF012
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF380
		value = 30
	callSetExVar
		flag = 0xF388
		value = 0
	callBufferExVar
		flag = 0xF380
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF380
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF388
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	PEGASUS MAGIC
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 9
	callBufferExVar
		flag = 0xF390
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF390
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF398
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF013
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF390
		value = 239
	callSetExVar
		flag = 0xF398
		value = 99
	callBufferExVar
		flag = 0xF390
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF390
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF398
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	LEO KINGDOM
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 10
	callBufferExVar
		flag = 0xF3A0
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF3A0
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF3A8
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF014
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF3A0
		value = 239
	callSetExVar
		flag = 0xF3A8
		value = 99
	callBufferExVar
		flag = 0xF3A0
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF3A0
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF3A8
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	A TIMED BATTLE VS.
	DRAGON SKY
	IS AVAILABLE...
	"""
	keyWait
	clearMsg
	callSetExVar
		flag = 0xF2F8
		value = 11
	callBufferExVar
		flag = 0xF3B0
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF3B0
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF3B8
		buffer = 3
		div = 1
		mod = 255
	checkFlag
		flag = 0xF015
		jumpIfTrue = 41
		jumpIfFalse = continue
	callSetExVar
		flag = 0xF3B0
		value = 239
	callSetExVar
		flag = 0xF3B8
		value = 99
	callBufferExVar
		flag = 0xF3B0
		buffer = 1
		div = 60
		mod = 255
	callBufferExVar
		flag = 0xF3B0
		buffer = 2
		div = 1
		mod = 60
	callBufferExVar
		flag = 0xF3B8
		buffer = 3
		div = 1
		mod = 255
	jump
		target = 40
}
script 40 mmsf1 {
	"""
	THE TARGET TIME
	IS 
	"""
	printBuffer
		buffer = 1
		minLength = 1
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 2
		minLength = 2
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 3
		minLength = 2
		padMode = leftPadZeroes
	"""
	.
	"""
	keyWait
	clearMsg
	jump
		target = 42
}
script 41 mmsf1 {
	"""
	THE CURRENT RECORD
	IS 
	"""
	printBuffer
		buffer = 1
		minLength = 1
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 2
		minLength = 2
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 3
		minLength = 2
		padMode = leftPadZeroes
	"""
	
	BY MEGA MAN.
	"""
	keyWait
	clearMsg
	jump
		target = 42
}
script 42 mmsf1 {
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Challenge\n"
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Explain\n"
	textSpeed
		delay = 0
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Quit"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 50
		jump2 = 43
		jump3 = 91
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 43 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	A SERIES OF TIMED
	CHALLENGES AWAITS
	THOSE WHO HAVE
	"""
	keyWait
	clearMsg
	"""
	PROVEN THEMSELVES
	TO BE AMONG THE
	GALAXY'S GREATEST.
	"""
	keyWait
	clearMsg
	"""
	YOU MUST TAKE ON
	THIS BATTLE USING
	YOUR EXTRA FOLDER.
	"""
	keyWait
	clearMsg
	"""
	ALSO, YOU WON'T BE
	ABLE TO USE YOUR
	BROTHERS' CARDS,
	"""
	keyWait
	clearMsg
	"""
	POWER UP DATA WILL
	BE DISABLED,
	"""
	keyWait
	clearMsg
	"""
	AND THE CUSTOM
	GAUGE WILL BE SET
	TO NORMAL SPEED.
	"""
	keyWait
	clearMsg
	"""
	THIS BATTLE WILL
	TRULY TEST YOUR
	OWN CAPABILITIES!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF14C
		jumpIfTrue = 42
		jumpIfFalse = continue
	"""
	A HANDSOME REWARD
	AWAITS THOSE
	"""
	keyWait
	clearMsg
	"""
	WHO MANAGE TO SET
	A NEW RECORD FOR
	EVERY ENEMY...
	"""
	keyWait
	clearMsg
	jump
		target = 42
}
script 50 mmsf1 {
	flagSet
		flag = 0xF008
	flagSet
		flag = 0xF14D
	flagClear
		flag = 0xF009
	callCheckExVar
		flag = 0xF2F8
		value = 1
		jumpIfEqual = 51
	callCheckExVar
		flag = 0xF2F8
		value = 2
		jumpIfEqual = 52
	callCheckExVar
		flag = 0xF2F8
		value = 3
		jumpIfEqual = 53
	callCheckExVar
		flag = 0xF2F8
		value = 4
		jumpIfEqual = 54
	callCheckExVar
		flag = 0xF2F8
		value = 5
		jumpIfEqual = 55
	callCheckExVar
		flag = 0xF2F8
		value = 6
		jumpIfEqual = 56
	callCheckExVar
		flag = 0xF2F8
		value = 7
		jumpIfEqual = 57
	callCheckExVar
		flag = 0xF2F8
		value = 8
		jumpIfEqual = 58
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"TAURUS "
	waitSkip
		frames = 10
	"FIRE!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x58
	end
}
script 51 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"CYGNUS "
	waitSkip
		frames = 10
	"WING!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x59
	end
}
script 52 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"HARP "
	waitSkip
		frames = 10
	"NOTE!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5A
	end
}
script 53 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"LIBRA "
	waitSkip
		frames = 10
	"SCALES!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5B
	end
}
script 54 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"QUEEN "
	waitSkip
		frames = 10
	"OPHIUCA!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5C
	end
}
script 55 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"GEMINI "
	waitSkip
		frames = 10
	"SPARK!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5D
	end
}
script 56 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"CANCER "
	waitSkip
		frames = 10
	"BUBBLE!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5E
	end
}
script 57 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"WOLF "
	waitSkip
		frames = 10
	"WOODS!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x5F
	end
}
script 58 mmsf1 {
	mugshotShow
		mugshot = MrHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"CROWN "
	waitSkip
		frames = 10
	"THUNDER!!"
	keyWait
	clearMsg
	callStartBattle
		battle = 0x60
	end
}
script 70 mmsf1 {
	flagClear
		flag = 0xF008
	checkBattleResult
		jumpIfWon = continue
		jumpIfLost = 71
		jumpIfOther = 72
	checkFlag
		flag = 0xF009
		jumpIfTrue = 73
		jumpIfFalse = 74
	end
}
script 71 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	WEAKLINGS HAVE NO PLACE
	AMONG THE STARS...
	"""
	keyWait
	clearMsg
	end
}
script 72 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	COWARDS HAVE NO PLACE
	AMONG THE STARS...
	"""
	keyWait
	clearMsg
	end
}
script 73 mmsf1 {
	flagClear
		flag = 0xF009
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	DELETE TIME:
	   
	"""
	waitSkip
		frames = 20
	textSpeed
		delay = 0
	printBuffer
		buffer = 1
		minLength = 1
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 2
		minLength = 2
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 3
		minLength = 2
		padMode = leftPadZeroes
	"\n"
	waitSkip
		frames = 20
	textSpeed
		delay = 0
	"NEW RECORD!!"
	keyWait
	clearMsg
	jump
		target = 80
}
script 74 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	DELETE TIME:
	   
	"""
	waitSkip
		frames = 20
	textSpeed
		delay = 0
	printBuffer
		buffer = 1
		minLength = 1
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 2
		minLength = 2
		padMode = leftPadZeroes
	":"
	printBuffer
		buffer = 3
		minLength = 2
		padMode = leftPadZeroes
	keyWait
	clearMsg
	"""
	NO RECORDS BROKEN.
	TRY AGAIN?
	
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
		jump1 = 50
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 80 mmsf1 {
	callCheckExVar
		flag = 0xF2F8
		value = 1
		jumpIfEqual = 81
	callCheckExVar
		flag = 0xF2F8
		value = 2
		jumpIfEqual = 82
	callCheckExVar
		flag = 0xF2F8
		value = 3
		jumpIfEqual = 83
	callCheckExVar
		flag = 0xF2F8
		value = 4
		jumpIfEqual = 84
	callCheckExVar
		flag = 0xF2F8
		value = 5
		jumpIfEqual = 85
	callCheckExVar
		flag = 0xF2F8
		value = 6
		jumpIfEqual = 86
	callCheckExVar
		flag = 0xF2F8
		value = 7
		jumpIfEqual = 87
	callCheckExVar
		flag = 0xF2F8
		value = 8
		jumpIfEqual = 88
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR TAURUS FIRE!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 81 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR CYGNUS WING!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 82 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR HARP NOTE!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 83 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR LIBRA SCALES!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 84 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR QUEEN OPHIUCA!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 85 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR GEMINI SPARK!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 86 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR CANCER BUBBLE!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 87 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR WOLF WOODS!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 88 mmsf1 {
	"""
	WELL DONE!
	YOU SET A NEW RECORD
	FOR CROWN THUNDER!
	"""
	keyWait
	clearMsg
	jump
		target = 90
}
script 90 mmsf1 {
	checkFlag
		flag = 0xF14C
		jumpIfTrue = 91
		jumpIfFalse = continue
	checkFlag
		flag = 0xF00A
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF00B
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF00C
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF00D
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF00E
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF00F
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF010
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF011
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0xF012
		jumpIfTrue = continue
		jumpIfFalse = 91
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	YOU, WHO HAVE SET
	A NEW RECORD FOR
	EVERY ENEMY...
	"""
	keyWait
	clearMsg
	"""
	YOUR GREATNESS HAS
	BEEN RECOGNIZED.
	"""
	keyWait
	clearMsg
	"""
	WE AWARD YOU THIS...
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 240
		color = red
		amount = 1
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printCard
		card = 240
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	flagSet
		flag = 0xF14C
	jump
		target = 91
}
script 91 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	WE AWAIT YOUR NEXT
	CHALLENGE...
	"""
	keyWait
	clearMsg
	end
}
script 100 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KingHertzGold
	"""
	YOU, WHO HAVE OVERCOME
	ALL OBSTACLES...
	"""
	keyWait
	clearMsg
	"""
	TO YOU WE OFFER A
	SPECIAL CHALLENGE...
	"""
	keyWait
	clearMsg
	"""
	IN THIS GAUNTLET, YOU
	WILL FACE EVERY ENEMY
	"""
	keyWait
	clearMsg
	"""
	YOU HAVE CONQUERED
	ON YOUR JOURNEY.
	"""
	keyWait
	clearMsg
	"""
	WILL YOU ATTEMPT IT?
	
	
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
		jump1 = 102
		jump2 = 101
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	jump
		target = 101
}
script 101 mmsf1 {
	clearMsg
	mugshotShow
		mugshot = KingHertzGold
	"""
	WE EAGERLY AWAIT
	YOUR CHALLENGE...
	"""
	keyWait
	clearMsg
	end
}
script 102 mmsf1 {
	mugshotShow
		mugshot = KingHertzGold
	"""
	PREPARE YOURSELF!
	
	"""
	waitSkip
		frames = 20
	"""
	EM WAVE MORPH...
	
	"""
	waitSkip
		frames = 20
	"FINAL "
	waitSkip
		frames = 10
	"BOSS "
	waitSkip
		frames = 10
	"RUSH!!"
	keyWait
	clearMsg
	flagSet
		flag = 0xF151
	flagClear
		flag = 0xF152
	flagClear
		flag = 0xF153
	flagClear
		flag = 0xF154
	flagClear
		flag = 0xF155
	flagClear
		flag = 0xF156
	flagClear
		flag = 0xF157
	flagClear
		flag = 0xF158
	flagClear
		flag = 0xF159
	flagClear
		flag = 0xF15A
	flagClear
		flag = 0xF15B
	flagClear
		flag = 0xF15C
	flagClear
		flag = 0xF15D
	flagClear
		flag = 0xF15E
	flagClear
		flag = 0xF15F
	end
}
script 110 mmsf1 {
	wait
		frames = 15
	checkBattleResult
		jumpIfWon = continue
		jumpIfLost = 111
		jumpIfOther = 112
	msgOpen
	mugshotShow
		mugshot = KingHertzGold
	"""
	INCREDIBLE!
	YOUR POWER TRULY
	IS UNMATCHED.
	"""
	keyWait
	clearMsg
	"""
	TO YOU, THE GREATEST
	WARRIOR IN THE GALAXY,
	WE HUMBLY OFFER THIS...
	"""
	keyWait
	clearMsg
	mugshotHide
	callShowStarFragCounter
	wait
		frames = 5
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"1000 Star Frags"!!
	"""
	playerFinish
	callGiveStarFrags
		count = 250
	callGiveStarFrags
		count = 250
	callGiveStarFrags
		count = 250
	callGiveStarFrags
		count = 250
	keyWait
	wait
		frames = 10
	playerResetScene
	callHideStarFragCounter
	wait
		frames = 5
	clearMsg
	mugshotShow
		mugshot = KingHertzGold
	"""
	WE EAGERLY AWAIT
	YOUR NEXT CHALLENGE...
	"""
	keyWait
	clearMsg
	end
}
script 111 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KingHertzGold
	"""
	YOUR VALIANT EFFORTS
	ARE APPLAUDED.
	"""
	keyWait
	clearMsg
	"""
	WE EAGERLY AWAIT
	YOUR NEXT CHALLENGE...
	"""
	keyWait
	clearMsg
	end
}
script 112 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KingHertzGold
	"""
	WE EAGERLY AWAIT
	YOUR NEXT CHALLENGE...
	"""
	keyWait
	clearMsg
	end
}
script 120 mmsf1 {
	callBufferDailyGigaCard
		bufferName = 1
		bufferData = 2
	checkFlag
		flag = 0xF160
		jumpIfTrue = continue
		jumpIfFalse = 124
	callShowStarFragCounter
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	S...Star Frags...
	I-I need...
	"""
	keyWait
	clearMsg
	"""
	Y-You... You have...
	Star Frags?
	"""
	keyWait
	clearMsg
	"""
	I'll give you...
	A rare card...
	"""
	keyWait
	clearMsg
	"\""
	printCardBuffered
		buffer = 1
	"""
	"...
	F-For... 100 Star Frags...
	"""
	keyWait
	clearMsg
	"""
	H-How about it...?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 91
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Trade  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 121
		jump2 = 122
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	jump
		target = 122
}
script 121 mmsf1 {
	callCheckStarFrags
		count = 100
		jumpIfEnough = continue
		jumpIfNotEnough = 123
	callTakeStarFrags
		count = 100
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	H-Here... Take it...
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCardBuffered
		buffer = 2
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printCardBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	flagClear
		flag = 0xF160
	mugshotShow
		mugshot = Jammer
	"""
	H...Heh...
	Heh heh heh...
	"""
	keyWait
	clearMsg
	"""
	L-Let's trade again...
	Tomorrow...
	"""
	keyWait
	clearMsg
	callHideStarFragCounter
	end
}
script 122 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	O-Okay...
	"""
	keyWait
	clearMsg
	"""
	But... M-Maybe we can
	trade... tomorrow...?
	"""
	keyWait
	clearMsg
	callHideStarFragCounter
	end
}
script 123 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	Y-You don't have...
	enough Star Frags...
	"""
	keyWait
	clearMsg
	"""
	J-Just like me...
	Ah-hah... Hah hah hah...
	"""
	keyWait
	clearMsg
	callHideStarFragCounter
	end
}
script 124 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	H...Heh...
	Heh heh heh...
	"""
	keyWait
	clearMsg
	"""
	L-Let's trade again...
	Tomorrow...
	"""
	keyWait
	clearMsg
	end
}