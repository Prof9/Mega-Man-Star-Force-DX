@archive mess_0027
@size 50

script 2 mmsf1 {
	checkFlag
		flag = 6253
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 6191
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
		mugshot = Zack
	"""
	That incident
	with Bud turning
	into that beast,
	"""
	keyWait
	clearMsg
	"""
	what could have
	caused that?
	Could there be
	"""
	keyWait
	clearMsg
	"""
	some kind of
	scientific
	explanation?
	"""
	keyWait
	clearMsg
	"""
	My height today
	is 3 feet 10.47
	inches.
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
		mugshot = Zack
	"""
	All this time,
	Geo has been
	protecting us
	"""
	keyWait
	clearMsg
	"""
	from danger
	during those
	incidents...
	"""
	keyWait
	clearMsg
	"""
	But I can't
	do anything
	to help him.
	"""
	keyWait
	clearMsg
	"""
	I'm just comple-
	tely useless,
	aren't I?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Kid's got some
	serious self-
	esteem issues.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	mugshotAnimation
		animation = 1
	"""
	(Zack...)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(I'm sure you
	tried really hard
	in your own way.)
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Maybe I should
	go cheer him up.
	
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
	Yeah,wouldn't
	want some FM-ian
	to get him.
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
		flag = 6191
	flagSet
		flag = 6911
	jump
		target = 31
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Zack
	"""
	All this time,
	Geo has been
	protecting us
	"""
	keyWait
	clearMsg
	"""
	from danger
	during those
	incidents...
	"""
	keyWait
	clearMsg
	"""
	But I can't
	do anything
	to help him.
	"""
	keyWait
	clearMsg
	"""
	I'm just comple-
	tely useless,
	aren't I?
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
	...You're just
	going to leave
	him like that?
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
		flag = 6191
		markRead = false
	end
}