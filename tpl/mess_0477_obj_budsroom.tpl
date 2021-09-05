@archive mess_0477
@size 30

script 2 mmsf1 {
	checkChapter
		lower = 0x00
		upper = 0x0F
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF01F
		jumpIfTrue = 10
		jumpIfFalse = continue
	checkFlag
		flag = 3336
		jumpIfTrue = continue
		jumpIfFalse = 10
	flagClear
		flag = 0xF033
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Ka-kraaaa!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF01F
	callStartBattle
		battle = 0x66
	end
}
script 10 mmsf1 {
	msgOpen
	"""
	I don't think
	anyone's made
	the bed in ages.
	"""
	keyWait
	end
	end
}
