@archive mess_0066
@size 30

script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Woman
	"I have a secret!"
	keyWait
	clearMsg
	"""
	My boyfriend
	doesn't know it,
	but I'm taking
	"""
	keyWait
	clearMsg
	"""
	cooking lessons
	to learn how to
	cook for him!
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
	Mr. Darke.)
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6721
	end
}