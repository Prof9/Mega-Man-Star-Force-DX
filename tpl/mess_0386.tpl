@archive mess_0386
@size 100

script 20 mmsf1 {
	checkFlag
		flag = 2080
		jumpIfTrue = 27
		jumpIfFalse = continue
	checkFlag
		flag = 2076
		jumpIfTrue = 26
		jumpIfFalse = continue
	checkFlag
		flag = 2177
		jumpIfTrue = 25
		jumpIfFalse = continue
	checkFlag
		flag = 2150
		jumpIfTrue = 24
		jumpIfFalse = continue
	checkFlag
		flag = 2149
		jumpIfTrue = 23
		jumpIfFalse = continue
	checkFlag
		flag = 2166
		jumpIfTrue = 22
		jumpIfFalse = continue
	checkFlag
		flag = 2171
		jumpIfTrue = 21
		jumpIfFalse = continue
	checkFlag
		flag = 2075
		jumpIfTrue = continue
		jumpIfFalse = 34
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	We're gonna look
	for Boreal's old
	boss,right?
	"""
	keyWait
	clearMsg
	"""
	Where'ndaheck
	could he be?
	"""
	keyWait
	end
	end
}
script 34 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	A challenge from
	Leo Kingdom,huh?
	"""
	keyWait
	clearMsg
	"""
	Let's go show
	him what we're
	made of!
	"""
	keyWait
	end
	end
}
