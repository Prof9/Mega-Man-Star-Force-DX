@archive mess_0251
@size 8

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Sorry,I hope you
	didn't have to
	wait too long...
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
	"O-OK."
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Um,well I don't
	really come here
	all that much,so
	"""
	keyWait
	clearMsg
	"""
	I feel kinda
	lost...
	
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
	"O-OK..."
	keyWait
	end
	end
}
