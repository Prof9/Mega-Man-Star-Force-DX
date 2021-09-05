@archive mess_0603
@size 255

script 4 mmsf1 {
	checkChapter
		lower = 0x00
		upper = 0x0F
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF031
		jumpIfTrue = 20
		jumpIfFalse = continue
	checkFlag
		flag = 3336
		jumpIfTrue = continue
		jumpIfFalse = 20
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	...Waaah...
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF031
	callStartBattle
		battle = 0x78
	end
}
script 20 mmsf1 {
	msgOpen
	"""
	A see-saw made
	out of wooden
	poles.
	"""
	keyWait
	clearMsg
	"""
	But it's kinda
	tough without
	another person.
	"""
	keyWait
	end
	end
}