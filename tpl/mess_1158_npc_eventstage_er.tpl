@archive mess_1158
@size 256

script 66 mmsf1 {
	checkBattleResult
		jumpIfWon = 67
		jumpIfLost = 68
		jumpIfOther = 70
	end
}
script 70 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 19
	"""
	Grr!! What's the matter?
	Getting cold feet!?
	"""
	keyWait
	end
	end
}