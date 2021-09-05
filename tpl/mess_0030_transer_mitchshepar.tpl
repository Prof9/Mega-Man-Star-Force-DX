@archive mess_0030
@size 30

script 2 mmsf1 {
	checkFlag
		flag = 6227
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 6697
		jumpIfTrue = 6
		jumpIfFalse = continue
	jump
		target = 3
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MitchShepar
	flagSet
		flag = 6698
	"""
	I've been work-
	ing with kids
	for many years
	"""
	keyWait
	clearMsg
	"""
	now,and I can
	say that it's
	important to
	"""
	keyWait
	clearMsg
	"""
	try to see the
	world from their
	perspective.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	mugshotAnimation
		animation = 1
	"""
	(I should
	report back to
	Mr. Square.)
	"""
	keyWait
	end
	end
}