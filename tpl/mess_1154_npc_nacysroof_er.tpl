@archive mess_1154
@size 256

script 100 mmsf1 {
	checkFlag
		flag = 0x0982
		jumpIfTrue = 101
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Excuse me...
	Are you Aaron?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	Huh? ...Yeah,
	are you a human
	from this world?
	"""
	keyWait
	clearMsg
	"""
	Why do you know
	about me?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Um,I'm MegaMan...
	"""
	keyWait
	clearMsg
	"""
	Actually,Lucian
	asked me to look
	for you.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	Huh!?
	Lucian did?
	"""
	keyWait
	clearMsg
	"""
	...Oh yeah,wonder
	what happened
	with Rymer...?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Well,about
	that...
	"""
	keyWait
	clearMsg
	"""
	That Rymer guy
	got away. That
	was my fault...
	"""
	keyWait
	clearMsg
	"""
	After that,Lucian
	said he was going
	to follow him.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	And then you
	came looking
	for me.
	"""
	keyWait
	clearMsg
	"""
	.........
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	...What's the
	matter?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	The truth is...
	my weapon,the
	Solar Gun,
	"""
	keyWait
	clearMsg
	"""
	is pretty much
	out of energy.
	"""
	keyWait
	clearMsg
	"""
	It'll take a
	bit more time
	to charge.
	"""
	keyWait
	clearMsg
	"""
	......Ah!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	W-What's wrong!?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	I can feel
	Rymer's presence!
	"""
	keyWait
	clearMsg
	"""
	...Near the
	sea... I see a
	large antenna...
	"""
	keyWait
	clearMsg
	"""
	Darn it,I still
	can't use my
	Solar Gun...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Leave it to me,
	Aaron!
	"""
	keyWait
	clearMsg
	"""
	I've got a good
	idea of where
	Rymer is,
	"""
	keyWait
	clearMsg
	"""
	so I'll take him
	down for you!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Aaron
	"""
	Sorry! I'll catch
	up to you as soon
	"""
	keyWait
	clearMsg
	"""
	as my Solar Gun
	is done charging!
	"""
	keyWait
	flagSet
		flag = 0x0982
	end
}
script 101 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"""
	I'll be right
	there as soon
	"""
	keyWait
	clearMsg
	"""
	as my Solar Gun
	is done charging!
	"""
	keyWait
	end
	end
}