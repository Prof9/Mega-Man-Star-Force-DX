@archive mess_0623
@size 256

script 10 mmsf1 {
	checkFlag
		flag = 2104
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	callMugshotShowGeoOrMegaManSad
	"""
	It looks like
	this door can
	only be opened
	"""
	keyWait
	clearMsg
	"""
	from the Wave
	World...
	"""
	keyWait
	end
	end
}
script 11 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	It looks like
	this door can
	only be opened
	"""
	keyWait
	clearMsg
	"""
	from the Wave
	World...
	"""
	keyWait
	end
	end
}