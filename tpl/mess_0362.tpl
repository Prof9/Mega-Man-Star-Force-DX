@archive mess_0362
@size 34

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Where are we...?
	Are we...?
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
		mugshot = Geo
	"Ah! That's...!!"
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	It's... a
	picture...
	of me...
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
		mugshot = Geo
	"""
	This is where
	dad...
	"""
	keyWait
	clearMsg
	jump
		target = 6
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"........."
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	He sentenced
	them to...
	"""
	keyWait
	clearMsg
	"No..."
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Dad... What
	happened to
	him...?
	"""
	keyWait
	clearMsg
	jump
		target = 28
	end
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	But if they're
	in wave form...
	"""
	keyWait
	clearMsg
	"""
	then that means
	they might still
	be alive...
	"""
	keyWait
	clearMsg
	jump
		target = 30
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"I know..."
	keyWait
	clearMsg
	"""
	But if there's
	even a sliver of
	a chance,then
	"""
	keyWait
	clearMsg
	"""
	I'll keep the
	hope alive.
	
	"""
	keyWait
	clearMsg
	"""
	Come on,Mega.
	Let's go.
	"""
	keyWait
	clearMsg
	"""
	We've gotta go
	protect the
	Earth
	"""
	keyWait
	clearMsg
	"""
	so there'll be
	one when dad
	comes back!
	"""
	keyWait
	clearMsg
	jump
		target = 32
	end
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Yeah!"
	keyWait
	end
	end
}
