@archive mess_0428
@size 100

script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I should go
	apologize to
	Luna and try to
	"""
	keyWait
	clearMsg
	"""
	go back to
	being Bros.
	with her again.
	"""
	keyWait
	clearMsg
	"""
	I hope she
	forgives me.
	"""
	keyWait
	end
	end
}
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
		mugshot = MegaMan
	"""
	Let's look for
	Mr.Boreal's old
	boss.
	"""
	keyWait
	clearMsg
	"""
	Where could
	he be?
	"""
	keyWait
	end
	end
}
script 34 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	A challenge from
	Leo Kingdom...
	"""
	keyWait
	clearMsg
	"""
	I'd better make
	sure I'm ready...
	"""
	keyWait
	end
	end
}
