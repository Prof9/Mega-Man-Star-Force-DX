@archive mess_0293
@size 12

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Hello?"
	keyWait
	end
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...Oh,hi Pat!"
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Pat
	"Hi "
	printPlayerName1
	"."
	keyWait
	clearMsg
	"Um..."
	keyWait
	clearMsg
	"""
	About what we
	were talking
	about yesterday,
	"""
	keyWait
	clearMsg
	"""
	I want to ask
	you if...
	
	"""
	keyWait
	clearMsg
	"um..."
	keyWait
	clearMsg
	soundPlayBGM
		music = 36
	"""
	Will you be
	Brothers
	with me?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"W-Wow! Really?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Pat
	"Yeah..."
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"I'd love to,Pat!"
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
	"""
	We should meet
	up and form our
	BrotherBand!
	"""
	keyWait
	clearMsg
	"""
	Where do you
	want to meet?
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
	clearMsg
	"""
	I'll see you
	there!
	"""
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Sweet! I'm going
	to be Brothers
	with Pat.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"Hey,"
	printPlayerName1
	"."
	keyWait
	clearMsg
	"""
	I noticed you're
	much more
	positive about
	"""
	keyWait
	clearMsg
	"""
	being Brothers
	with someone
	now than before.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Yeah,I guess I
	feel like I can
	move forward
	"""
	keyWait
	clearMsg
	"""
	now more than
	I used to...
	
	"""
	keyWait
	clearMsg
	"""
	And I have more
	friends now...
	"""
	keyWait
	clearMsg
	"""
	I wonder if my
	dad's watching
	me.
	"""
	keyWait
	clearMsg
	"""
	I hope he's
	proud.
	
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"""
	(Somehow,I still
	can't shake the
	feeling though.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(That Pat guy's
	got some strange
	
	"""
	keyWait
	clearMsg
	"""
	waves coming
	off of him...)
	
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(I hope it's
	just my
	imagination...)
	"""
	keyWait
	end
	end
}
