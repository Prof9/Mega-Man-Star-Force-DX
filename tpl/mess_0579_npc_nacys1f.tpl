@archive mess_0579
@size 256

script 30 mmsf1 {
	checkFlag
		flag = 6765
		jumpIfTrue = 31
		jumpIfFalse = continue
	msgOpen
	itemGive
		item = 54
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 54
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	flagSet
		flag = 6765
	end
}
script 31 mmsf1 {
	end
}
script 40 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	*shiver...*
	*shiver...*
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02C
	callStartBattle
		battle = 0x73
	end
}
