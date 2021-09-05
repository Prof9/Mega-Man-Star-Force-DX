@archive mess_0140
@size 45

script 44 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	mugshotAnimation
		animation = 1
	"""
	(If we stay here
	any longer,we'll
	get in his way.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Let's go home,
	OK?)
	"""
	keyWait
	end
	end
}
