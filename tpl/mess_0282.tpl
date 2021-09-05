@archive mess_0282
@size 15

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	What is this
	place...?
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
	"It's beautiful."
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	It really is a
	wonderful place.
	"""
	keyWait
	end
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	My dad moved
	into outer
	space.
	"""
	keyWait
	end
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	And then the
	space station my
	dad was on had
	"""
	keyWait
	clearMsg
	"""
	that accident...
	And...
	
	"""
	keyWait
	clearMsg
	"""
	He's still out
	there...
	Somewhere...
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
	"Yeah."
	keyWait
	clearMsg
	"""
	After that,I was
	afraid of
	getting close
	"""
	keyWait
	clearMsg
	"""
	to other people.
	I kept saying
	things like,
	"""
	keyWait
	clearMsg
	"""
	"The pain of
	losing someone
	is too much,"and
	"""
	keyWait
	clearMsg
	"""
	"I should just
	be alone so I
	won't get hurt."
	"""
	keyWait
	clearMsg
	"""
	That's why I
	didn't want to
	go to school.
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
		mugshot = Geo
	"......"
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
	"""
	Aww,you don't
	need to thank
	me or anything.
	"""
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Yeah,of course!"
	keyWait
	clearMsg
	jump
		target = 14
	end
}
