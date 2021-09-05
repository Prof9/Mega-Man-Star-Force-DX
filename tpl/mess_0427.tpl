@archive mess_0427
@size 100

script 61 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I should head
	for the AMAKEN
	rooftop EM-Road.
	"""
	keyWait
	end
	end
}
script 62 mmsf1 {
	checkFlag
		flag = 97
		jumpIfTrue = continue
		jumpIfFalse = 61
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I've gotta get
	to Dream Island.
	"""
	keyWait
	clearMsg
	"""
	I'd better
	pulse out.
	"""
	keyWait
	end
	end
}
