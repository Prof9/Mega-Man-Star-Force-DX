@archive mess_0354
@size 7

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	I can't get to
	the other side
	if I don't get
	"""
	keyWait
	clearMsg
	"""
	this pile of
	stuff out of
	the way.
	"""
	keyWait
	clearMsg
	"""
	It looks like a
	lot,but I've
	gotta try...
	"""
	keyWait
	clearMsg
	"Hmm...?"
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	*huff huff* It's
	kinda hard to
	breathe.
	"""
	keyWait
	clearMsg
	"""
	I thought there
	was supposed to
	be air in here.
	"""
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	That's not good.
	What am I
	supposed to do?
	"""
	keyWait
	clearMsg
	jump
		target = 5
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	What am I
	supposed to do?
	"""
	keyWait
	end
	end
}
