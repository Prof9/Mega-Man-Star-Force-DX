@archive mess_0369
@size 25

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Hmm? We're
	picking up a
	signal...
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Mr.Boreal!!"
	keyWait
	clearMsg
	"""
	The wavehole's
	gone,but we can
	still get
	"""
	keyWait
	clearMsg
	"""
	transmissions,
	it seems!
	
	"""
	keyWait
	clearMsg
	"This is "
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"The Earth is OK!\n"
	keyWait
	clearMsg
	"""
	We're returning
	to Earth in the
	
	"""
	keyWait
	clearMsg
	"""
	emergency
	escape module.
	Over!
	"""
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Yeah,I sort of
	know how to
	fly this.
	"""
	keyWait
	clearMsg
	"""
	Right now,it's
	on auto-pilot.
	"""
	keyWait
	clearMsg
	"""
	So we're moving
	at a good pace
	towards Earth.
	"""
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Aaah!!"
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Aaah!!"
	keyWait
	end
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Oonngh..."
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Nngh... What...
	happened...?
	"""
	keyWait
	clearMsg
	jump
		target = 19
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Problem?"
	keyWait
	clearMsg
	jump
		target = 21
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"WHAT!?"
	keyWait
	clearMsg
	jump
		target = 23
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"N-No..."
	keyWait
	end
	end
}
