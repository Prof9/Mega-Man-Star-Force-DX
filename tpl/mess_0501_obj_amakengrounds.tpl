@archive mess_0501
@size 40

script 0 mmsf1 {
	checkFlag
		flag = 3365
		jumpIfTrue = 13
		jumpIfFalse = continue
	checkChapter
		lower = 17
		upper = 18
		jumpIfInRange = 14
		jumpIfOutOfRange = continue
	checkFlag
		flag = 2074
		jumpIfTrue = continue
		jumpIfFalse = 13
	checkFlag
		flag = 2075
		jumpIfTrue = 13
		jumpIfFalse = 14
	end
}
script 7 mmsf1 {
	msgOpen
	"""
	Might that an-
	tenna be able to
	catch waves
	"""
	keyWait
	clearMsg
	"from space?"
	keyWait
	clearMsg
	checkItem
		item = 84
		amount = 1
		jumpIfGreater = continue
		jumpIfEqual = continue
		jumpIfLess = 30
	end
}
script 30 mmsf1 {
	checkFlag
		flag = 0xF123
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkFlag
		flag = 0xF121
		jumpIfTrue = continue
		jumpIfFalse = 31
	"""
	...Hm? You spot
	something in the
	bushes...
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 84
		amount = 1
	playerAnimate
		animation = 24
	"""
	Geo got:
	"
	"""
	printItem
		item = 84
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 31 mmsf1 {
	end
}