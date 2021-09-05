@archive mess_1246
@size 12

script 0 mmsf1 {
	checkFlag
		flag = 0xF161
		jumpIfTrue = continue
		jumpIfFalse = 10
	checkFlag
		flag = 0xF163
		jumpIfTrue = 11
		jumpIfFalse = continue
	callAllocSaveBufferMenu
	callSaveCompress
	callInitSaveSpinner
		vramSettings = 1
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = GeoHappy
	"Save clear data?\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
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
		jump1 = 1
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 2 mmsf1 {
	flagSet
		flag = 3370
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Now saving...
	Don't turn off
	the power!
	"""
	checkSaveFinished
		jumpIfSuccessful = 3
		jumpIfFailed = 5
	end
}
script 3 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	mugshotShow
		mugshot = GeoHappy
	soundPlay
		sound = 138
	"Save complete."
	keyWait
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 4 mmsf1 {
	flagClear
		flag = 3370
	textSpeed
		delay = 0
	"Save failed..."
	keyWait
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 5 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	mugshotShow
		mugshot = GeoHappy
	"""
	The save failed,
	Try again?
	
	"""
	positionOptionFromCenter
		width = 13
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
		jump1 = 6
		jump2 = 4
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 6 mmsf1 {
	flagSet
		flag = 3370
	checkSaveAccess
		jumpIfError = 8
	checkSaveStartOW
		jumpIfStarted = 2
	end
}
script 7 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotShow
		mugshot = GeoHappy
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	
	"""
	checkSaveInit
		jumpIfFailed = 5
	checkSaveInitFinished
		jumpIfSuccessful = 6
	end
}
script 10 mmsf1 {
	flagSet
		flag = 0xF161
	msgOpen
	soundPlay
		sound = 203
	"""
	New premade Face Pics
	have been added!
	"""
	wait
		frames = 60
	keyWait
	clearMsg
	msgClose
	wait
		frames = 60
	checkFlag
		flag = 0xF03D
		jumpIfTrue = continue
		jumpIfFalse = 0
	checkFlag
		flag = 0xF03E
		jumpIfTrue = 0
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	It's legendary!!
	"""
	keyWait
	clearMsg
	"""
	You! You've beaten the
	whole game without ever
	turning Legend Mode off!
	"""
	keyWait
	clearMsg
	"""
	That's... That's...
	"""
	keyWait
	clearMsg
	"...Truly "
	waitSkip
		frames = 20
	"legendarily\n"
	waitSkip
		frames = 20
	"incredible!!"
	keyWait
	clearMsg
	"""
	I'm in awe at your
	legendary feat!
	"""
	keyWait
	clearMsg
	"""
	As a reward, I'm going
	to tell you a very
	special Cipher Mail!
	"""
	keyWait
	clearMsg
	"""
	Listen closely now!
	I'll only say it once...
	"""
	keyWait
	clearMsg
	"""
	"NERYEDGLA"
	"""
	wait
		frames = 60
	keyWait
	clearMsg
	"""
	Did you get that?
	I'll say it one more time,
	just to be sure!
	"""
	keyWait
	clearMsg
	"""
	"NERYEDGLA"
	"""
	wait
		frames = 60
	keyWait
	clearMsg
	"""
	Well, that's all from me.
	Enjoy the rest of the game!
	"""
	keyWait
	clearMsg
	"""
	Legendary!
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 60
	jump
		target = 0
}
script 11 mmsf1 {
	flagClear
		flag = 0xF163
	callReceiveMail
		flag = 0x161F
		markRead = false
	flagSet
		flag = 0xF164
	msgOpen
	callSetBuffer
		buffer = 1
		value = 247
	callShowBattleCardBufferedMenu
		buffer = 1
	itemGiveCard
		card = 247
		color = red
		amount = 1
	"""
	Received Giga Class card:
	"
	"""
	printCard
		card = 247
	"\"!!"
	wait
		frames = 60
	keyWait
	callHideBattleCardMenu
	clearMsg
	msgClose
	wait
		frames = 60
	jump
		target = 0
}