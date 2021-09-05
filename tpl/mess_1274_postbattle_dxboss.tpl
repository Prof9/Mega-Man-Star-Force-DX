@archive mess_1274
@size 10

script 0 mmsf1 {
	flagClear
		flag = 0xF18F
	callCheckBuffer
		buffer = 4
		value = 1
		jumpIfLess = 2
		jumpIfEqual = 1
		jumpIfGreater = continue
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"That was a "
	wait
		frames = 5
	"""
	phenomenal
	Wave Battle!
	"""
	keyWait
	clearMsg
	"""
	Very impressive!
	You've managed to
	beat a DX Boss!
	"""
	keyWait
	clearMsg
	"""
	But, you know...
	There are still 
	"""
	printBuffer
		buffer = 4
		minLength = 2
		padMode = noPad
	"""
	
	DX Bosses left!
	"""
	keyWait
	clearMsg
	"""
	Keep going until you've
	defeated them all!
	I know you can do it!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF190
		jumpIfTrue = 3
		jumpIfFalse = continue
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"That was a "
	wait
		frames = 5
	"""
	phenomenal
	Wave Battle!
	"""
	keyWait
	clearMsg
	"""
	Very impressive!
	You've managed to
	beat a DX Boss!
	"""
	keyWait
	clearMsg
	"""
	But, you know...
	There is still 
	"""
	printBuffer
		buffer = 4
		minLength = 2
		padMode = noPad
	"""
	
	DX Boss left!
	"""
	keyWait
	clearMsg
	"""
	Keep going until you've
	defeated them all!
	I know you can do it!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF190
		jumpIfTrue = 3
		jumpIfFalse = continue
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Incredible!!
	Truly incredible!
	"""
	wait
		frames = 5
	keyWait
	clearMsg
	"""
	You've beaten every
	single DX Boss!
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"""
	Is what I would say.
	
	"""
	wait
		frames = 5
	"Actually, "
	wait
		frames = 5
	"""
	there's one more...
	"""
	keyWait
	clearMsg
	"""
	One more DX Boss
	for you to face.
	"""
	keyWait
	clearMsg
	"""
	...Have you figured out
	who it is?
	"""
	keyWait
	clearMsg
	"""
	All I'll say is...
	It's sure to be a battle
	of galactic proportions!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF190
		jumpIfTrue = 3
		jumpIfFalse = continue
	end
}
script 3 mmsf1 {
	flagClear
		flag = 0xF190
	msgClose
	wait
		frames = 15
	end
}