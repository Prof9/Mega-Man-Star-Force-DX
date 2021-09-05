@archive mess_0584
@size 256

script 10 mmsf1 {
	checkFlag
		flag = 6759
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = BusinessMan
	"""
	How about a
	Nacys limited
	Mowa Mowa
	"""
	keyWait
	clearMsg
	"""
	figure for only
	500 Zennys?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 10
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Buy  "
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
		jump1 = continue
		jump2 = 13
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	checkZenny
		amount = 500
		jumpIfEnough = continue
		jumpIfNotEnough = 12
	itemTakeZenny
		amount = 500
	itemGive
		item = 51
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 51
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	flagSet
		flag = 6759
	end
}
script 30 mmsf1 {
	checkFlag
		flag = 6766
		jumpIfTrue = 31
		jumpIfFalse = continue
	itemGive
		item = 55
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 55
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	flagSet
		flag = 6766
	end
}
script 31 mmsf1 {
	end
}
script 35 mmsf1 {
	msgOpen
	"""
	There's a
	SorterBot!
	"""
	keyWait
	clearMsg
	"""
	It looks pretty
	old,and has lots
	of scratches.
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	What's a
	SorterBot
	doing here?
	"""
	keyWait
	clearMsg
	"""
	I'd better let
	Pat know...
	"""
	keyWait
	flagSet
		flag = 6778
	end
}
script 40 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Fsssshhhhhh!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02D
	callStartBattle
		battle = 0x74
	end
}
