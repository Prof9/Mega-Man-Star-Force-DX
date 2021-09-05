@archive mess_0365
@size 8

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	No turning
	back...
	"""
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	...To beat the
	FM King,right?
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
	"Thanks,Mega..."
	keyWait
	clearMsg
	"""
	But I'm going
	forward!
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
		mugshot = GeoHappy
	"Yeah!"
	keyWait
	end
	end
}
