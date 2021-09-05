@archive mess_0039
@size 30

script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Man
	"""
	I've loved RCs
	ever since I was
	a kid! Now
	"""
	keyWait
	clearMsg
	"""
	I'm in my 30s
	and love them
	more than ever.
	"""
	keyWait
	clearMsg
	"""
	I wish I had a
	friend to play
	RCs with.
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
	Ms. White.)
	"""
	keyWait
	flagSet
		flag = 6657
	end
}