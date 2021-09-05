@archive mess_0024
@size 40

script 2 mmsf1 {
	checkFlag
		flag = 6266
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 6204
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
		jumpIfInRange = 4
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 68
		jumpIfInRange = 3
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = Sonia
	"""
	I don't want
	to sing
	anymore...
	"""
	keyWait
	clearMsg
	"""
	...Mama,
	heeelp.
	"""
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
		mugshot = Sonia
	"""
	There's this song
	I've been trying
	to write...
	"""
	keyWait
	clearMsg
	"""
	But I just can't
	seem to find the
	right words.
	"""
	keyWait
	clearMsg
	"""
	I just feel so
	uninspired...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	It looks like
	Sonia is in a
	bind. But I don't
	"""
	keyWait
	clearMsg
	"""
	know the slight-
	est thing about
	songwriting...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Just go talk to
	her. Isn't that
	what Bros. do?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Hmm... Should I
	go talk to Sonia?
	
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
		mugshot = MegaMan
	"""
	Okay,I'll see
	what I can do.
	"""
	keyWait
	clearMsg
	"""
	I'd better write
	myself a memo
	mail...
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6204
	flagSet
		flag = 6911
	jump
		target = 31
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Sonia
	"""
	There's this song
	I've been trying
	to write...
	"""
	keyWait
	clearMsg
	"""
	But I just can't
	seem to find the
	right words.
	"""
	keyWait
	clearMsg
	"""
	I just feel so
	uninspired...
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
	Didn't practice
	your singing
	voice,huh kid?
	"""
	keyWait
	clearMsg
	end
}
script 23 mmsf1 {
	end
}
script 24 mmsf1 {
	end
}
script 25 mmsf1 {
	end
}
script 26 mmsf1 {
	end
}
script 27 mmsf1 {
	end
}
script 28 mmsf1 {
	end
}
script 29 mmsf1 {
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
		flag = 6204
		markRead = false
	end
}
script 32 mmsf1 {
	end
}
script 33 mmsf1 {
	end
}
script 34 mmsf1 {
	end
}
script 35 mmsf1 {
	end
}
script 36 mmsf1 {
	end
}
script 37 mmsf1 {
	end
}
script 38 mmsf1 {
	end
}
script 39 mmsf1 {
	end
}