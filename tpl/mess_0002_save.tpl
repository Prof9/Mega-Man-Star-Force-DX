@archive mess_0002
@size 20

script 0 mmsf1 {
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	mugshotShowBuffered
		buffer = 4
	"""
	Do you want to
	save the game?
	
	"""
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
script 1 mmsf1 {
	flagClear
		flag = 3370
	checkSaveAccess
		jumpIfError = 14
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 7
	textSpeed
		delay = 0
	mugshotShowBuffered
		buffer = 4
	"""
	Is it ok to
	overwrite?
	
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
	" Quit"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 6
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 3 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	mugshotShowBuffered
		buffer = 4
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
	mugshotShowBuffered
		buffer = 4
	"""
	The save failed.
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
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 6 mmsf1 {
	flagSet
		flag = 3370
	checkSaveAccess
		jumpIfError = 14
	checkSaveStartOW
		jumpIfStarted = 2
	end
}
script 7 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotShowBuffered
		buffer = 4
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
script 8 mmsf1 {
	"Time    Library BtlCardsCredits "
	end
}
script 9 mmsf1 {
	"     "
	printBuffer
		buffer = 0
		minLength = 3
		padMode = leftPadZeroes
	"[:]"
	printBuffer
		buffer = 1
		minLength = 2
		padMode = leftPadZeroes
	end
}
script 10 mmsf1 {
	printBuffer
		buffer = 0
		minLength = 3
		padMode = leftPadSpaces
	"  "
	printBuffer
		buffer = 1
		minLength = 2
		padMode = leftPadSpaces
	"  "
	printBuffer
		buffer = 2
		minLength = 2
		padMode = leftPadSpaces
	end
}
script 11 mmsf1 {
	"      "
	printBuffer
		buffer = 0
		minLength = 5
		padMode = leftPadSpaces
	end
}
script 12 mmsf1 {
	"    "
	printBuffer
		buffer = 0
		minLength = 6
		padMode = leftPadSpaces
	"[z]"
	end
}
script 13 mmsf1 {
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	mugshotShowBuffered
		buffer = 4
	"""
	Do you want to
	save the game?
	
	"""
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
