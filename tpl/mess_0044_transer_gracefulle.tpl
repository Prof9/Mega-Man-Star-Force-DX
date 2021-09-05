@archive mess_0044
@size 30

script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Woman
	"""
	My hobby ever
	since I was a
	little girl has
	"""
	keyWait
	clearMsg
	"""
	been cooking.
	but I'm a little
	sad that I don't
	"""
	keyWait
	clearMsg
	"""
	have anyone to
	cook for.
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
	Mr. Mann.)
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6673
	end
}