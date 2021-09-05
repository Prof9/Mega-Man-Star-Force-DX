@archive mess_0276
@size 11

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"What's going on?"
	keyWait
	soundFadeOutBGM
		length = 180
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"A fight?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"Hey,"
	printPlayerName1
	"..."
	keyWait
	clearMsg
	"""
	put on your
	Visualizer.
	"""
	keyWait
	clearMsg
	jump
		target = 5
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Oh,yeah."
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"Hm? What's that?"
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	"+"? Is that
	like "positive"?
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
		mugshot = GeoVisualizer
	"""
	You're probably
	right...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	So what are you
	gonna do?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoVisualizer
	"""
	I don't feel
	right about
	leaving it alone
	"""
	keyWait
	clearMsg
	"""
	and I wanna know
	who that was on
	the phone...
	"""
	keyWait
	clearMsg
	"""
	Alright,let's
	pulse in and
	
	"""
	keyWait
	clearMsg
	"""
	find out what
	those waves
	are first.
	"""
	keyWait
	end
	end
}
