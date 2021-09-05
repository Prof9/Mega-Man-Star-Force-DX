@archive mess_0341
@size 8

script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	On the other
	side of this
	door...
	"""
	keyWait
	clearMsg
	jump
		target = 6
	end
}
