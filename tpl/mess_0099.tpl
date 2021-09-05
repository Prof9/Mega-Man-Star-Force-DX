@archive mess_0099
@size 20

script 0 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't use
	that menu while
	we're On Air.
	"""
	keyWait
	end
}
script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't use
	that menu yet.
	"""
	keyWait
	end
}
script 2 mmsf1 {
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You have to save
	before you can
	enter this menu.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Do you want
	to save?
	
	"""
	positionOptionFromCenter
		width = 12
	textSpeed
		delay = 0
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
		jump1 = 9
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 5 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	soundPlay
		sound = 138
	"Save complete."
	keyWait
	flagSet
		flag = 3382
	callFreeSaveBufferMenu
	end
}
script 7 mmsf1 {
	flagSet
		flag = 3370
	checkSaveAccess
		jumpIfError = 11
	checkSaveStartOW
		jumpIfStarted = 4
	end
}
script 8 mmsf1 {
	flagClear
		flag = 3370
	textSpeed
		delay = 0
	"Save failed..."
	keyWait
	end
}
script 9 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 5
	checkSaveAccess
		jumpIfError = 11
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 3
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Is it OK for me
	to overwrite?
	
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
		jump1 = 7
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 10 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Can't use that
	folder. I will
	switch to spare.
	"""
	keyWait
	end
}
