@archive mess_0280
@size 15

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Home sounds
	good right about
	now...
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
	"Hello?"
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	It's the person
	from before!
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
		mugshot = Geo
	"""
	Who in the world
	are you!?
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
		mugshot = Geo
	"He hung up..."
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"No,never."
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Yeah..."
	keyWait
	clearMsg
	"Let's go home."
	keyWait
	clearMsg
	mugshotHide
	end
}
script 13 mmsf1 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		sound = 140
	callTranserNotification
	"*BEEP,BEEP,BEEP*"
	wait
		frames = 46
	"\n"
	soundPlay
		sound = 140
	callTranserNotification
	"*BEEP,BEEP,BEEP*"
	wait
		frames = 46
	keyWait
	clearMsg
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	What now?
	Mail?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey,
	"""
	printPlayerName1
	"""
	...
	Check it out.
	"""
	keyWait
	clearMsg
	"""
	It's from one of
	those Satellite
	admin guys.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DragonSkyShadow
	printPlayerName1
	" "
	printPlayerName2
	"""
	...
	It appears that
	"""
	keyWait
	clearMsg
	"""
	you have formed
	yet another
	BrotherBand.
	"""
	keyWait
	clearMsg
	"""
	Allow me to test
	how much you
	have grown.
	"""
	keyWait
	clearMsg
	"""
	I will be waiting
	for you at the
	AMAKEN rooftop.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"""
	The AMAKEN
	rooftop,huh?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	That's where
	we did those
	Star Trials.
	"""
	keyWait
	clearMsg
	"""
	Alright,no time
	like the present!
	"""
	keyWait
	clearMsg
	end
}
