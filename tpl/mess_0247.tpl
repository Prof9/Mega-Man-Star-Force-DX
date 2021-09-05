@archive mess_0247
@size 28

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Sorry to keep
	you waiting.
	"""
	keyWait
	clearMsg
	"""
	And thanks
	again for
	back there...
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Um,yeah..."
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	You want to go
	shopping? Just
	the 2 of us...?
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
		mugshot = GeoHappy
	"""
	Ah,that's not
	what I meant!
	I mean,um,I
	"""
	keyWait
	clearMsg
	"""
	don't usually do
	things with just
	1 other person,
	"""
	keyWait
	clearMsg
	"""
	a-and definitely
	not with a girl,
	you know...?
	"""
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"O-OK..."
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Y-Yeah..."
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lyra
	"Great job,Sonia!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Sonia
	"Tee hee!"
	keyWait
	end
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"........."
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Ack!"
	keyWait
	end
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"D-D-Date!?"
	keyWait
	clearMsg
	"""
	It's not like
	that!!
	"""
	keyWait
	clearMsg
	jump
		target = 24
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	......Y-Yeah,
	sure!
	"""
	keyWait
	clearMsg
	"""
	Wow,a lot of
	stuff happened
	today! I'm beat!
	"""
	keyWait
	clearMsg
	jump
		target = 26
	end
}
