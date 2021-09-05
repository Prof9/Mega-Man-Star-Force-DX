@archive mess_0069
@size 30

script 4 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	There's this
	one card that
	I want.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	This guy looks
	like he needs
	"""
	keyWait
	clearMsg
	"""
	help...Should we
	give him a hand?
	
	"""
	positionOptionFromCenter
		width = 8
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 5
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	checkFlag
		flag = 6911
		jumpIfTrue = 20
		jumpIfFalse = continue
	mugshotShow
		mugshot = OmegaXis
	"""
	OK.
	Let's go get the
	scoop.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	I'd better write
	myself a memo
	mail...
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6145
	flagSet
		flag = 6911
	jump
		target = 21
	end
}