@archive mess_0253
@size 38

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Yes,let's!"
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"A café?"
	keyWait
	clearMsg
	"""
	I-I've never
	been to one...
	"""
	keyWait
	clearMsg
	"""
	Will they let
	two kids in
	there?
	"""
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"If you say so..."
	keyWait
	end
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	H-Huh? What are
	you doing here,
	Luna!?
	"""
	keyWait
	end
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Transfer!?"
	keyWait
	clearMsg
	"""
	What are you
	talking about!?
	"""
	keyWait
	end
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"........."
	keyWait
	clearMsg
	jump
		target = 33
	end
}
script 34 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	No...
	It's just...
	"""
	keyWait
	clearMsg
	"""
	I've never seen
	Luna look that
	stressed before.
	"""
	keyWait
	clearMsg
	"""
	I was wondering
	if she's OK...
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 37 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"A bad feeling?"
	keyWait
	clearMsg
	storeOWVar
		variable = 0
		value = 26
	"""
	Sonia! We've
	gotta hurry!!
	
	"""
	keyWait
	end
	end
}
