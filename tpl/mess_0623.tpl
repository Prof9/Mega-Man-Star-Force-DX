@archive mess_0623
@size 256

script 10 mmsf1 {
	checkFlag
		flag = 2104
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Geo
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
	mugshotShow
		mugshot = GeoHappy
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