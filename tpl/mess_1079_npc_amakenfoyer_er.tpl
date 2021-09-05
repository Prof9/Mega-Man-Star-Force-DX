@archive mess_1079
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
	mugshotShow
		mugshot = CancerBubble
	"""
	C'mon you jellyfish!
	We're not done yet!
	*snip*
	"""
	keyWait
	end
	end
}