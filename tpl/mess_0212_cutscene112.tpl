@archive mess_0212
@size 55

script 16 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	They're the dark
	shadows I saw in
	my dream!
	"""
	keyWait
	clearMsg
	"""
	What are they
	doing here!?
	"""
	keyWait
	clearMsg
	jump
		target = 19
	end
}
