@archive mess_0073
@size 30

script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LittleBoy
	"""
	My birthday
	is coming up.
	"""
	keyWait
	clearMsg
	"""
	I really want a
	baseball glove.
	"""
	keyWait
	clearMsg
	"""
	I wonder if
	Grandpa will get
	me one?
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
	Mr. Park.)
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6731
	end
}