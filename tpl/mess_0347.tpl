@archive mess_0347
@size 24

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Mr.Boreal!
	Mr.Boreal!
	"""
	keyWait
	clearMsg
	"""
	What should I
	do?
	
	"""
	keyWait
	clearMsg
	"""
	What if I asked
	for too much...?
	
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
	"""
	Oh,you were just
	sleeping...
	Phew.
	"""
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"So,is it fixed?"
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Alright!
	It's working!
	"""
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
	"OK."
	keyWait
	end
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizerHappy
	"""
	That's probably
	how I'll get to
	the station.
	"""
	keyWait
	end
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizerHappy
	"OK,let's go!"
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
	"Sonia..."
	keyWait
	end
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Sonia..."
	keyWait
	clearMsg
	"""
	You can't,
	because I need
	you to
	"""
	keyWait
	clearMsg
	"""
	protect everyone
	here on Earth.
	
	"""
	keyWait
	clearMsg
	"""
	After I leave,
	you're the only
	one who can
	"""
	keyWait
	clearMsg
	"""
	fight back
	against any
	FM-ians.
	"""
	keyWait
	clearMsg
	jump
		target = 15
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Don't worry.
	I'll protect the
	Earth.
	"""
	keyWait
	clearMsg
	"""
	So I want you
	to protect all
	the people.
	"""
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
	"""
	Good.
	I'm going now.
	"""
	keyWait
	end
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Mr.Boreal!
	Thank you for
	everything!
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Here I go!"
	keyWait
	clearMsg
	textSpeed
		delay = 1
	"EM Wave Change!"
	wait
		frames = 20
	"\n"
	printPlayerName1
	" "
	printPlayerName2
	","
	wait
		frames = 20
	"\nOn"
	wait
		frames = 16
	" The"
	wait
		frames = 16
	" Air!!"
	keyWait
	end
	end
}
