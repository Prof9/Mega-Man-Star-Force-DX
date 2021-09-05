@archive mess_0124
@size 1

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Look at you,kid!
	You got yourself
	a Star Card.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	A Star Card?
	What's that?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Never mind that
	now. I'll send
	an e-mail later.
	"""
	keyWait
	clearMsg
	"""
	Right now we need
	to focus on stop-
	ping that car!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Right...
	Well,now the car
	should work.
	"""
	keyWait
	clearMsg
	"""
	Initializing
	Axel Program...
	"""
	keyWait
	end
}
