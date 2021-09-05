@archive mess_0214
@size 14

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"Now what?"
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = PegasusMagicShadow
	"""
	I will be your
	opponent.
	"""
	keyWait
	clearMsg
	"""
	If you can
	defeat me,
	
	"""
	keyWait
	clearMsg
	"""
	then the power
	of the stars is
	yours.
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	We're no
	weaklings. We'll
	win. And then
	"""
	keyWait
	clearMsg
	"""
	you'll see
	what we're 
	really made of.
	"""
	keyWait
	clearMsg
	jump
		target = 9
	end
}
