@archive mess_0213
@size 9

script 0 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	Alright,that's
	all of them!
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
