@archive mess_0254
@size 34

script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Stop! Don't let
	her in,Luna!!
	"""
	keyWait
	soundStop
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Luna! Stop!!"
	keyWait
	clearMsg
	"""
	She just wants
	to use you!!
	"""
	keyWait
	end
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Luna!!"
	keyWait
	clearMsg
	jump
		target = 21
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Nooo!!"
	keyWait
	end
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Luna!!"
	keyWait
	clearMsg
	"Where'd she go!?"
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Luna!!"
	keyWait
	clearMsg
	"""
	She's in the
	Wave World,
	inside the
	"""
	keyWait
	clearMsg
	"""
	exhibit! We've
	gotta hurry!!
	"""
	keyWait
	clearMsg
	jump
		target = 28
	end
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	A bad spot? What
	do you mean?
	"""
	keyWait
	clearMsg
	jump
		target = 30
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Gotcha. I'll be
	careful.
	"""
	keyWait
	clearMsg
	jump
		target = 32
	end
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	soundPlayBGM
		music = 22
	storeOWVar
		variable = 0
		value = 18
	"""
	Sounds like
	something's
	happening!
	"""
	keyWait
	clearMsg
	"""
	We'll be too
	late if we don't
	get in there!!
	"""
	keyWait
	end
	end
}
