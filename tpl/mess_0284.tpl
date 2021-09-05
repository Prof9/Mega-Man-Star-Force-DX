@archive mess_0284
@size 16

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	What is this
	place?
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
	"What!?"
	keyWait
	end
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Abandoned..."
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
	"Pat..."
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Yeah,I am...
	Hey,Pat...?
	"""
	keyWait
	clearMsg
	"""
	Do you hate your
	parents for what
	they did?
	"""
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	You're really
	strong...
	"""
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Really?"
	keyWait
	clearMsg
	jump
		target = 13
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Pat..."
	keyWait
	clearMsg
	jump
		target = 15
	end
}
