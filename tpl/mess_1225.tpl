@archive mess_1225
@size 256

script 40 mmsf1 {
	msgOpen
	"""
	Could not access
	the data. Turn
	the power off
	"""
	keyWait
	clearMsg
	"""
	and reinsert the
	Game Card?
	"""
	waitHold
	end
}
script 67 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	callMugshotShowGeoMenu
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	
	"""
	checkSaveInit
		jumpIfFailed = 65
	checkSaveInitFinished
		jumpIfSuccessful = 66
	end
}
script 68 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 3
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	jump
		target = 61
	end
}
