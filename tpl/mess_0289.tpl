@archive mess_0289
@size 8

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Oh,shoot!"
	keyWait
	clearMsg
	"""
	What happened to
	Pat!?
	"""
	keyWait
	jump
		target = 1
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Pat!"
	keyWait
	end
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	I'm fine. What
	about you?
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
		mugshot = GeoHappy
	"""
	Aww,don't blame
	yourself,Pat.
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
