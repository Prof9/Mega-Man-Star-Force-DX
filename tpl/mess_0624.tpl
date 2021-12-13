@archive mess_0624
@size 20

script 13 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManSad
	"""
	*gasp* *gasp*
	It's getting
	hard to breathe.
	"""
	keyWait
	clearMsg
	"""
	I've got to get
	some air quick.
	"""
	keyWait
	end
	end
}
script 14 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	OK,gotta move
	this trash out
	of the way!!
	"""
	keyWait
	flagClear
		flag = 162
	end
}