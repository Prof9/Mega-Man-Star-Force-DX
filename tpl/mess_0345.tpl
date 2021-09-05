@archive mess_0345
@size 13

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"It's time..."
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
	"Yeah."
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
	"What's up?"
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
	"""
	Are you OK?
	This isn't like
	you at all!
	"""
	keyWait
	clearMsg
	"""
	Plus,this isn't
	just your fight
	anymore.
	"""
	keyWait
	clearMsg
	"""
	This is a fight
	for the fate of
	the whole Earth.
	"""
	keyWait
	clearMsg
	"""
	And I went along
	with everything
	because I wanted
	"""
	keyWait
	clearMsg
	"""
	to see with my
	own eyes what
	happened to dad.
	"""
	keyWait
	clearMsg
	"""
	So say some-
	thing happy like
	you always do!
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Yeah!"
	keyWait
	clearMsg
	"""
	Actually,before
	we go into
	space,
	"""
	keyWait
	clearMsg
	"""
	there's some-
	place I want to
	go. Is that OK?
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
		mugshot = GeoHappy
	"Yeah..."
	keyWait
	clearMsg
	"""
	Oh,and we should
	say something to
	mom too.
	"""
	keyWait
	end
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	We've gotta
	hurry...
	"""
	keyWait
	end
	end
}
