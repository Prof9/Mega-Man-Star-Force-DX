@archive mess_1174
@size 256

script 60 mmsf1 {
	checkFlag
		flag = 6816
		jumpIfTrue = 61
		jumpIfFalse = continue
	flagSet
		flag = 6816
	msgOpen
	mugshotShowNPC
		npc = 12
	"You there!!"
	keyWait
	clearMsg
	"""
	I,Couronne the
	XIV,master of
	the Jour
	"""
	keyWait
	clearMsg
	"""
	Jovonne family
	desire to engage
	in spirited
	"""
	keyWait
	clearMsg
	"""
	battle with you.
	Face me now!
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Fight  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 62
		jump2 = 69
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 61 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 12
	"You there!!"
	keyWait
	clearMsg
	"""
	Have ye come
	to duel with me,
	Couronne the
	"""
	keyWait
	clearMsg
	"""
	XIV,master of
	the Jour Jovonne
	family?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Fight  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 62
		jump2 = 69
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
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
		npc = 12
	"""
	I will not tolerate
	such cowardice!
	Fight me like a man!
	"""
	keyWait
	end
	end
}