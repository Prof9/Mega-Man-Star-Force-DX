@archive mess_0750
@size 10

script 0 mmsf1 {
	checkFlag
		flag = 558
		jumpIfTrue = 1
		jumpIfFalse = continue
	checkFlag
		flag = 554
		jumpIfTrue = continue
		jumpIfFalse = 2
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	If I operate
	this control
	panel & block
	"""
	keyWait
	clearMsg
	"""
	the path,I may
	be able to stop
	the truck. It's
	"""
	keyWait
	clearMsg
	"""
	kinda crude,but
	we really don't
	have a choice!
	"""
	keyWait
	clearMsg
	"""
	...Hm?
	Something moved
	just now.
	"""
	keyWait
	clearMsg
	"""
	Whoa!!
	The viruses
	are bolting!!
	"""
	keyWait
	clearMsg
	callReceiveMail
		flag = 0x161B
		markRead = false
	flagSet
		flag = 0xF035
	flagSet
		flag = 607
	end
}
