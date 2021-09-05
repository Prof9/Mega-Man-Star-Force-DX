@archive mess_0025
@size 50

script 2 mmsf1 {
	checkFlag
		flag = 6251
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 6189
		jumpIfTrue = 21
		jumpIfFalse = continue
	checkChapter
		lower = 0
		upper = 99
		jumpIfInRange = continue
		jumpIfOutOfRange = 20
	checkChapter
		lower = 96
		upper = 100
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	checkChapter
		lower = 80
		upper = 82
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 68
		jumpIfInRange = 4
		jumpIfOutOfRange = continue
	checkFlag
		flag = 1312
		jumpIfTrue = 3
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Luna
	"""
	The Student Body
	Presidency WILL
	be mine!! And,
	"""
	keyWait
	clearMsg
	"""
	no 6th grader
	is going to take
	it from me!
	"""
	keyWait
	clearMsg
	"""
	To that end,I
	must get that
	"bad egg" to
	"""
	keyWait
	clearMsg
	"come to school."
	keyWait
	end
	end
}
script 20 mmsf1 {
	checkFlag
		flag = 0x800
		jumpIfTrue = continue
		jumpIfFalse = 5
	msgOpen
	mugshotShow
		mugshot = Luna
	"""
	There are some
	cards I really
	need right now,
	"""
	keyWait
	clearMsg
	"""
	but I've no idea
	where to even
	begin looking.
	"""
	keyWait
	clearMsg
	"""
	I can't believe
	someone like me
	"""
	keyWait
	clearMsg
	"""
	is having trouble
	finding recovery
	cards!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	She really needs
	recovery cards?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	You probably know
	where to find
	some,right?
	"""
	keyWait
	clearMsg
	"""
	Then again,I bet
	she doesn't even
	want your help.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	I guess I should
	help her out...
	
	"""
	positionOptionFromCenter
		width = 63
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 22
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	checkFlag
		flag = 6911
		jumpIfTrue = 30
		jumpIfFalse = continue
	mugshotShow
		mugshot = OmegaXis
	"""
	Never one to
	ignore a lady
	in need,are you?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	I'd better write
	myself a memo
	mail...
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6189
	flagSet
		flag = 6911
	jump
		target = 31
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Luna
	"""
	There are some
	cards I really
	need right now,
	"""
	keyWait
	clearMsg
	"""
	but I've no idea
	where to even
	begin looking.
	"""
	keyWait
	clearMsg
	"""
	I can't believe
	someone like me
	"""
	keyWait
	clearMsg
	"""
	is having trouble
	finding recovery
	cards!
	"""
	keyWait
	clearMsg
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Yeah,that girl's
	trouble with a
	capital T.
	"""
	keyWait
	clearMsg
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey,hey!
	Why don't you
	take care of
	"""
	keyWait
	clearMsg
	"""
	your unfinished
	business first!?
	"""
	keyWait
	clearMsg
	end
}
script 31 mmsf1 {
	callReceiveMemo
		flag = 6189
		markRead = false
	end
}