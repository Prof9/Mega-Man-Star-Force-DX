@archive mess_0380
@size 93

script 0 mmsf1 {
	checkFlag
		flag = 0xF110
		jumpIfTrue = 1
		jumpIfFalse = continue
	checkFlag
		flag = 0xF111
		jumpIfTrue = 51
		jumpIfFalse = 50
}
script 1 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 52
		jumpIfFalse = 51
}
script 10 mmsf1 {
	checkFlag
		flag = 0xF110
		jumpIfTrue = 11
		jumpIfFalse = continue
	checkFlag
		flag = 0xF111
		jumpIfTrue = 61
		jumpIfFalse = 60
}
script 11 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 62
		jumpIfFalse = 61
}
script 20 mmsf1 {
	jump
		target = 70
}
script 30 mmsf1 {
	checkFlag
		flag = 0xF110
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkFlag
		flag = 0xF111
		jumpIfTrue = 81
		jumpIfFalse = 80
}
script 31 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 82
		jumpIfFalse = 81
}
script 40 mmsf1 {
	checkFlag
		flag = 0xF110
		jumpIfTrue = 41
		jumpIfFalse = continue
	checkFlag
		flag = 0xF111
		jumpIfTrue = 91
		jumpIfFalse = 90
}
script 41 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 92
		jumpIfFalse = 91
}
script 50 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	Well done.
	You have become
	quite skillful,
	"""
	keyWait
	clearMsg
	"chosen one."
	keyWait
	clearMsg
	"""
	To you I bestow
	a fragment of
	my power.
	"""
	keyWait
	end
}
script 51 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	Splendid.
	I see that
	your power
	"""
	keyWait
	clearMsg
	"""
	is true,
	chosen one.
	"""
	keyWait
	clearMsg
	"""
	To you I bestow
	a fragment of
	my power.
	"""
	keyWait
	end
}
script 52 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	Excellent. You
	have passed all
	the tests,
	"""
	keyWait
	clearMsg
	"""
	chosen one.
	"""
	keyWait
	clearMsg
	"""
	To you I bestow
	a fragment of
	my power.
	"""
	keyWait
	end
}
script 60 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"What is this...?"
	keyWait
	end
}
script 61 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"This is..."
	keyWait
	end
}
script 62 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"This is..."
	keyWait
	end
}
script 70 mmsf1 {
	msgOpen
	mugshotHide
	callGiveExtraFolder
		folder = 3
	soundPlay
		sound = 203
	callRefreshTopScreenIfExtraFolder
		type = 0
	flagSet
		flag = 0xF13C
	"""
	MegaMan got:
	"DrgnFldr"!!
	"""
	waitOWVar
		variable = 1
		value = 5
	keyWait
	end
}
script 80 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	This folder con-
	tains the essence
	of my power.
	"""
	keyWait
	clearMsg
	"""
	You may find it
	useful in the
	battles to come.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	The battles to
	come...?
	There's more?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DragonSky
	"""
	Indeed.
	I am not the
	only one who
	"""
	keyWait
	clearMsg
	"""
	wishes to do
	battle with you.
	"""
	keyWait
	clearMsg
	"""
	Return here
	with another
	power in hand,
	"""
	keyWait
	clearMsg
	"""
	and the next
	admin shall
	face you.
	"""
	keyWait
	end
}
script 81 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	This folder con-
	tains the essence
	of my power.
	"""
	keyWait
	clearMsg
	"""
	Use it however
	you see fit.
	"""
	keyWait
	clearMsg
	"""
	Now,one more
	admin remains.
	"""
	keyWait
	clearMsg
	"""
	Return here
	with the final
	power in hand,
	"""
	keyWait
	clearMsg
	"""
	and the last
	test shall begin.
	"""
	keyWait
	end
}
script 82 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSky
	"""
	You who now
	holds our power,
	"""
	keyWait
	clearMsg
	"""
	use it to kindle
	the 6 stars and
	"""
	keyWait
	clearMsg
	"""
	conquer the
	truly lonely
	evil giant.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Six stars...?"
	keyWait
	clearMsg
	"""
	...Truly evil
	giant...?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DragonSky
	"""
	Chosen one,
	even now...
	"""
	keyWait
	clearMsg
	"""
	we will continue
	to watch over
	you.
	"""
	keyWait
	end
}
script 90 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"He's gone!"
	keyWait
	clearMsg
	mugshotSHow
		mugshot = OmegaXis
	"""
	Heh,so the other
	admins want a
	fight too,huh?
	"""
	keyWait
	clearMsg
	"""
	But what did he
	mean by "another
	power in hand"?
	"""
	keyWait
	clearMsg
	"""
	Guess we should
	figure it out and
	come back here.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Alright.
	We'll definitely
	pass those tests!
	"""
	keyWait
	end
}
script 91 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	There he goes.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	We just gotta
	beat one more
	admin.
	"""
	keyWait
	clearMsg
	"""
	Should be a piece
	of cake for us!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Yeah!
	Let's do it!
	"""
	keyWait
	end
}
script 92 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"He's gone."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Heh,and he left
	us with some
	gibberish.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Six stars... and
	a truly
	evil giant...
	"""
	keyWait
	clearMsg
	"""
	What in the
	world is that
	all about?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hmph,
	somehow I just
	don't get it.
	"""
	keyWait
	clearMsg
	"""
	But I'm sure
	we'll figure it
	out eventually.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Yeah... Not much
	point in trying
	"""
	keyWait
	clearMsg
	"""
	to figure it out
	right now,
	I guess.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"Besides,"
	keyWait
	clearMsg
	"""
	it looks like we
	passed all the
	tests,so let's
	"""
	keyWait
	clearMsg
	"""
	go home and
	get some well
	deserved rest!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	I'm with you
	on that one!
	"""
	keyWait
	end
}
