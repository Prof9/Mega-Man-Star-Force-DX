@archive mess_0358
@size 14

script 6 mmsf1 {
	checkFlag
		flag = 0x87C
		jumpIfTrue = 11
		jumpIfFalse = continue
	checkFlag
		flag = 0x87D
		jumpIfTrue = continue
		jumpIfFalse = 13
	checkFlag
		flag = 0x87E
		jumpIfTrue = 12
		jumpIfFalse = 13
}
script 11 mmsf1 {
	checkFlag
		flag = 0x87D
		jumpIfTrue = 12
		jumpIfFalse = continue
	checkFlag
		flag = 0x87E
		jumpIftrue = 12
		jumpIfFalse = 13
}
script 12 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	OK,one last
	spot! Let's go!
	"""
	keyWait
	end
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	OK,two more
	spots! Let's go!
	"""
	keyWait
	end
	end
}