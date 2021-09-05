@archive mess_0275
@size 32

script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Huh?"
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"What!?"
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	What was that
	all about?
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"OK!"
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Well..."
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
	"""
	I don't know
	yet.
	"""
	keyWait
	clearMsg
	"""
	But for now,I'm
	gonna go check
	out Time Square.
	"""
	keyWait
	end
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"What...?"
	keyWait
	clearMsg
	jump
		target = 27
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Ha ha,you don't
	have to worry
	about me.
	"""
	keyWait
	end
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...Thanks."
	keyWait
	clearMsg
	"I'll be back."
	keyWait
	end
	end
}
