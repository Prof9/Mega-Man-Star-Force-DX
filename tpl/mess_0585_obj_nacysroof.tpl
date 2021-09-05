@archive mess_0585
@size 50

script 6 mmsf1 {
	checkChapter
		lower = 0x00
		upper = 0x0F
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF02E
		jumpIfTrue = 40
		jumpIfFalse = continue
	checkFlag
		flag = 3336
		jumpIfTrue = continue
		jumpIfFalse = 40
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Ka-BOOOOOM!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02E
	callStartBattle
		battle = 0x75
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = PitcherMan
	"Wait!!"
	keyWait
	clearMsg
	"""
	When it comes
	to baseball
	leave it to me.
	"""
	keyWait
	clearMsg
	mugshotHide
	"\"Play ball!!\""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PitcherMan
	"""
	It'll do exactly
	what we say!
	"""
	keyWait
	clearMsg
	mugshotHide
	"5 minutes later."
	keyWait
	clearMsg
	"\"Game set!!\""
	keyWait
	clearMsg
	mugshotShowGeo
	"We won!!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = PitcherMan
	"Easy as pie!"
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Oh,a card
	came out.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 49
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got
	"
	"""
	printItem
		item = 49
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	flagSet
		flag = 6733
	end
}
script 20 mmsf1 {
	msgOpen
	"""
	A burger shop.
	Their most
	popular item...
	"""
	keyWait
	clearMsg
	"""
	Is the Mowai
	Galaxy Burger
	"""
	keyWait
	clearMsg
	"......"
	keyWait
	end
	end
}
script 21 mmsf1 {
	msgOpen
	"""
	A burger shop.
	Their most
	popular item...
	"""
	keyWait
	clearMsg
	"""
	Is the Mowai
	Galaxy Burger
	"""
	keyWait
	clearMsg
	"......"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Hi, do you have
	Coby Burgers?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OldMan
	"""
	D-Did you
	just say...
	Coby Burger?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Y-Yes...?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OldMan
	"""
	...Long has it
	been since I last
	heard that name...
	"""
	keyWait
	clearMsg
	"""
	When I took over
	this shop many
	decades ago,
	"""
	keyWait
	clearMsg
	"""
	that burger was
	so popular that
	we were running
	"""
	keyWait
	clearMsg
	"""
	out of the meat
	quicker than we
	could order it.
	"""
	keyWait
	clearMsg
	"""
	In the end,I
	had to take it
	off the menu.
	"""
	keyWait
	clearMsg
	"""
	Even then,I could
	barely keep up
	with the demand.
	"""
	keyWait
	clearMsg
	"""
	But after months,
	the legend slowly
	began to fade.
	"""
	keyWait
	clearMsg
	"""
	It had seemed as
	though people had
	finally forgotten.
	"""
	keyWait
	clearMsg
	"""
	Or so I thought...
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Well,a friend of
	mine has been
	dying to eat one.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OldMan
	"""
	It sounds like
	there are still
	"""
	keyWait
	clearMsg
	"""
	burger fans out
	there who crave
	Coby Burgers.
	"""
	keyWait
	clearMsg
	"""
	Actually,I was
	getting nostalgic
	myself,so
	"""
	keyWait
	clearMsg
	"""
	I just so happen
	to have the
	meat in stock...
	"""
	keyWait
	clearMsg
	"""
	...Very well.
	Just this once,
	"""
	keyWait
	clearMsg
	"""
	I'll make that
	legendary burger
	one more time.
	"""
	keyWait
	clearMsg
	"""
	Give me just
	a second!
	"""
	keyWait
	clearMsg
	mugshotHide
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	keyWait
	clearMsg
	mugshotShow
		mugshot = OldMan
	"""
	Here you are.
	One piping hot
	Coby Burger!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 57
		amount = 1
	playerAnimate
		animation = 24
	"""
	Geo got:
	"
	"""
	printItem
		item = 57
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = OldMan
	"""
	Don't go telling
	everybody,now!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 6781
	end
}
script 40 mmsf1 {
	msgOpen
	"""
	A cat ride.
	It's really too
	big to be a cat.
	"""
	keyWait
	end
	end
}
