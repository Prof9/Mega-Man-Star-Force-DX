@archive mess_0026
@size 50

script 2 mmsf1 {
	checkFlag
		flag = 6252
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 6190
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
		jumpIfInRange = 7
		jumpIfOutOfRange = continue
	checkChapter
		lower = 80
		upper = 82
		jumpIfInRange = 6
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 68
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 50
		jumpIfInRange = 4
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 36
		jumpIfInRange = 3
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = Bud
	"""
	Who the heck
	was that cow-
	looking dude...?
	"""
	keyWait
	clearMsg
	"""
	If I see him
	again,I'll make
	steak outta him!
	"""
	keyWait
	end
	end
}
script 20 mmsf1 {
	checkFlag
		flag = 0x800
		jumpIfTrue = continue
		jumpIfFalse = 7
	msgOpen
	mugshotShow
		mugshot = Bud
	"""
	There's this
	legendary burger
	"""
	keyWait
	clearMsg
	"""
	I've never been
	able to get my
	hands on...
	"""
	keyWait
	clearMsg
	"""
	Aaaargh,just
	thinking about
	it is enough
	"""
	keyWait
	clearMsg
	"""
	to keep me up
	at night!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Can this guy go
	a minute without
	thinking of food?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	It seems like
	he really needs
	that burger.
	"""
	keyWait
	clearMsg
	"""
	Should I help
	him look for it?
	
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
	I guess it
	sounds kinda
	interesting.
	"""
	keyWait
	clearMsg
	"""
	OK. But leave
	some for me!
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
		flag = 6190
	flagSet
		flag = 6911
	jump
		target = 31
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Bud
	"""
	There's this
	legendary burger
	"""
	keyWait
	clearMsg
	"""
	I've never been
	able to get my
	hands on...
	"""
	keyWait
	clearMsg
	"""
	Aaaargh,just
	thinking about
	it is enough
	"""
	keyWait
	clearMsg
	"""
	to keep me up
	at night!!
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
	What,so you're
	just going to
	let him starve?
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
		flag = 6190
		markRead = false
	end
}