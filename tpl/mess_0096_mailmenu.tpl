@archive mess_0096
@size 50

script 0 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Hmm,which mail
	should I read?
	"""
	waitHold
	end
}
script 1 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like I got
	new mail...
	"""
	waitHold
	end
}
script 2 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	I don't have a
	single piece of
	mail...
	"""
	waitHold
	end
}
script 3 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like I got
	new mail. Better
	take a look...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"Subject:\n"
	printMailSubjectBuffer
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"Body:"
	keyWait
	clearMsg
	textSpeed
		delay = 3
	printBrotherBuffer1
	"\n"
	printBrotherBuffer2
	"\n"
	printBrotherBuffer3
	keyWait
	clearMsg
	checkFlag
		flag = 3363
		jumpIfTrue = 9
		jumpIfFalse = continue
	checkFlag
		flag = 3364
		jumpIfTrue = 10
		jumpIfFalse = continue
	textSpeed
		delay = 0
	"""
	Should I save
	this e-mail?
	
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
	clearMsg
	end
}
script 4 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Where should I
	save it to?
	"""
	waitHold
	end
}
script 5 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Overwrite other
	saved e-mail?
	
	"""
	positionOptionFromCenter
		width = 16
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
	clearMsg
	end
}
script 6 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Save complete!"
	keyWait
	waitHold
	end
}
script 7 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Saving mail will
	save your game
	as well.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"Continue?\n"
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
	clearMsg
	end
}
script 9 mmsf1 {
	textSpeed
		delay = 3
	flagClear
		flag = 3363
	"""
	Present:
	"
	"""
	printItemBuffered
		buffer = 0
	"\""
	keyWait
	clearMsg
	mugshotHide
	itemGiveBuffered
		buffer = 1
	printPlayerName1
	"""
	 got:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!!\n"
	keyWait
	clearMsg
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Save the e-mail?
	
	
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
	clearMsg
	end
}
script 10 mmsf1 {
	textSpeed
		delay = 3
	flagClear
		flag = 3364
	"""
	Present:
	"
	"""
	printCardBuffered
		buffer = 0
	"\""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCardBuffered
		buffer = 2
	printPlayerName1
	"""
	 got:
	"
	"""
	printCardBuffered
		buffer = 0
	"\"!!\n"
	keyWait
	clearMsg
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Save the e-mail?
	
	
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
	clearMsg
	end
}
script 11 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Cancel the save?
	
	
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
	clearMsg
	end
}
script 12 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	This e-mail will
	disappear if you
	don't save it.
	"""
	keyWait
	clearMsg
	"""
	Delete this
	e-mail?
	
	"""
	positionOptionFromCenter
		width = 16
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
	clearMsg
	end
}
script 13 mmsf1 {
	flagClear
		flag = 3370
	callSaveFieldObjectStates
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Now saving!"
	keyWait
	checkSaveAccess
		jumpIfError = 23
	checkSaveExists
		jumpIfExists = 18
		jumpIfNotExists = 14
	end
}
script 14 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	"""
	checkSaveInit
		jumpIfFailed = 17
	checkSaveInitFinished
		jumpIfSuccessful = 18
	end
}
script 20 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	What should I do
	with this mail?
	
	"""
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Read  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Delete"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 21 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Sure you want
	me to delete it?
	
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
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 22 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Do you want to
	save this?
	
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
	clearMsg
	end
}
script 24 mmsf1 {
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Now saving!"
	keyWait
	checkSaveAccess
		jumpIfError = 23
	checkSaveExists
		jumpIfExists = 18
		jumpIfNotExists = 14
	end
}