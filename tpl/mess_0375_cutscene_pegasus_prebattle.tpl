@archive mess_0375
@size 33

script 0 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 1
		jumpIfFalse = continue
	checkFlag
		flag = 0xF112
		jumpIfTrue = 21
		jumpIfFalse = 20
}
script 1 mmsf1 {
	checkFlag
		flag = 0xF112
		jumpIfTrue = 22
		jumpIfFalse = 21
}
script 10 mmsf1 {
	checkFlag
		flag = 0xF111
		jumpIfTrue = 11
		jumpIfFalse = continue
	checkFlag
		flag = 0xF112
		jumpIfTrue = 31
		jumpIfFalse = 30
}
script 11 mmsf1 {
	checkFlag
		flag = 0xF112
		jumpIfTrue = 32
		jumpIfFalse = 31
}
script 20 mmsf1 {
	msgOpen
	"""
	You have done
	well to come
	this far.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	It's that voice
	again!
	"""
	keyWait
	clearMsg
	mugshotHide
	"""
	Now,you shall
	face the greatest
	challenge yet.
	"""
	keyWait
	end
}
script 21 mmsf1 {
	msgOpen
	"""
	I have been
	expecting you.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	That voice!
	It must be...
	"""
	keyWait
	clearMsg
	mugshotHide
	"""
	I,too,shall
	test your might.
	"""
	keyWait
	end
}
script 22 mmsf1 {
	msgOpen
	"""
	At last,the
	moment draws
	near.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	You're...
	"""
	keyWait
	clearMsg
	mugshotHide
	"""
	This will be the
	final test.
	"""
	keyWait
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Pegasus Magic!?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagic
	"""
	We shall begin
	the final tests.
	"""
	keyWait
	clearMsg
	"""
	Show me your
	true power
	"""
	keyWait
	clearMsg
	"""
	and defeat me
	in battle.
	"""
	keyWait
	clearMsg
	"Let us begin."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	He's serious!
	Don't let your
	guard down!
	"""
	keyWait
	clearMsg
	"""
	Let's face him
	head on,
	"""
	printPlayerName1
	"!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Gotcha!"
	keyWait
	clearMsg
	"""
	Wave Battle!
	Ride On!!
	"""
	keyWait
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Pegasus Magic!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagic
	"""
	Can you triumph
	over me as well?
	"""
	keyWait
	clearMsg
	"""
	Show me your
	true power
	"""
	keyWait
	clearMsg
	"""
	and defeat me
	in battle.
	"""
	keyWait
	clearMsg
	"Let us begin."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Keep your head
	in the game,
	!
	"""
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	We beat the last
	one,we can beat
	this guy too!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Roger!"
	keyWait
	clearMsg
	"""
	Wave Battle!
	Ride On!!
	"""
	keyWait
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Pegasus Magic!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagic
	"""
	Let us see if
	the others were
	right about you.
	"""
	keyWait
	clearMsg
	"""
	Show me your
	true power
	"""
	keyWait
	clearMsg
	"""
	and defeat me
	in battle.
	"""
	keyWait
	clearMsg
	"Let us begin."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Here he comes!
	You know what
	to do,
	"""
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	Let's finish
	this!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Here we go!"
	keyWait
	clearMsg
	"""
	Wave Battle!
	Ride On!!
	"""
	keyWait
	end
}
