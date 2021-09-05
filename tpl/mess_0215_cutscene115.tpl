@archive mess_0215
@size 31

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"......"
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"Yeah,I can tell."
	keyWait
	clearMsg
	"""
	That wasn't his
	full power.
	
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Where the heck
	is this "Star
	Force"!?
	"""
	keyWait
	clearMsg
	"""
	Were you just
	playing with
	us!?
	"""
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	What does that
	mean?
	"""
	keyWait
	clearMsg
	jump
		target = 19
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"......"
	keyWait
	clearMsg
	jump
		target = 24
	end
}
