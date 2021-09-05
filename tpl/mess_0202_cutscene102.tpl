@archive mess_0202
@size 44

script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"I don't know..."
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Aaah!"
	keyWait
	clearMsg
	"What the!?"
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	How do you know
	my name...?
	"""
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	They knew even
	my name... Who
	are these guys!?
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Then,are they
	enemies!?
	FM-ians!?
	"""
	keyWait
	clearMsg
	jump
		target = 26
	end
}
