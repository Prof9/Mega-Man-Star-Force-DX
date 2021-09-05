@archive mess_0488
@size 256

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Boy
	"Oh? Ohh!!"
	keyWait
	clearMsg
	"""
	You have the
	card I'm looking
	for!?
	"""
	keyWait
	clearMsg
	"""
	Gimmie! Please!
	I'll give you
	something good!
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Give  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 13
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	itemTakeCard
		card = 100
		color = yellow
		amount = 1
	printPlayerName1
	"""
	 gave
	"
	"""
	printCard
		card = 100
	"""
	"
	to the boy!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Boy
	"""
	Yes!
	Thanks man!
	"""
	keyWait
	clearMsg
	"""
	Here's what
	I promised you!
	"""
	keyWait
	clearMsg
	mugshotHide
	playerAnimate
		animation = 24
	itemGiveCard
		card = 32
		color = yellow
		amount = 1
	printPlayerName1
	"""
	 got:
	"
	"""
	printCard
		card = 32
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	clearMsg
	mugshotShow
		mugshot = Boy
	"""
	Thanks to you
	my collection is
	even better!
	"""
	keyWait
	flagSet
		flag = 6211
	flagClear
		flag = 6149
	flagClear
		flag = 6911
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Th-That card!
	Is that...?
	It is!!
	"""
	keyWait
	clearMsg
	"\""
	printCard
		card = 57
	"\"!!"
	keyWait
	clearMsg
	"""
	Please say
	you're gonna
	give it to me!
	"""
	keyWait
	clearMsg
	mugshotHide
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 23
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	itemTakeCard
		card = 57
		color = yellow
		amount = 1
	mugshotShowNPC
		npc = 2
	"""
	Ohh,dude!
	Thanks!
	"""
	keyWait
	clearMsg
	"""
	Here,let me give
	you this!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 112
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 112
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShowNPC
		npc = 2
	"""
	Now every day is
	gonna be summer
	for me! Thanks!
	"""
	keyWait
	flagSet
		flag = 6250
	flagClear
		flag = 6188
	flagClear
		flag = 6911
	end
}
script 53 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 11
	"""
	I'm Claud
	Pincer and I'm
	in 3rd grade!
	"""
	keyWait
	clearMsg
	"""
	...Hey,you,
	over there!
	"""
	keyWait
	clearMsg
	"""
	Don't think that
	just 'cause I'm
	3rd grade,
	"""
	keyWait
	clearMsg
	"""
	you can treat me
	like a kid!
	"""
	keyWait
	end
	end
}
script 60 mmsf1 {
	checkFlag
		flag = 0xF128
		jumpIfTrue = 90
		jumpIfFalse = continue
	checkFlag
		flag = 0xF125
		jumpIfTrue = 81
		jumpIfFalse = continue
	checkFlag
		flag = 0xF123
		jumpIfTrue = 79
		jumpIfFalse = continue
	checkItem
		item = 84
		amount = 1
		jumpIfGreater = 75
		jumpIfEqual = 75
		jumpIfLess = continue
	checkFlag
		flag = 0xF120
		jumpIfTrue = 74
		jumpIfFalse = continue
	checkFlag
		flag = 0xF126
		jumpIfTrue = 80
		jumpIfFalse = 70
}
script 70 mmsf1 {
	flagSet
		flag = 0xF126
	msgOpen
	"""
	It's some kind
	of robot...
	I think?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Hey,Mr.Suther,
	what's this
	robot?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	Caught your eye,
	did it? That,
	my friend,is a
	"""
	keyWait
	clearMsg
	"""
	store assistant
	robot. Totally
	rad,right?
	"""
	keyWait
	clearMsg
	"""
	I was driftin'
	around town the
	other day when
	"""
	keyWait
	clearMsg
	"""
	I saw it at the
	junk shop. It was
	destiny,I think!
	"""
	keyWait
	clearMsg
	"""
	Doesn't it
	just scream
	"vintage"?
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 85
		jumpIfTrue = 72
		jumpIfFalse = 71
}
script 71 mmsf1 {
	mugshotShow
		mugshot = OmegaXis
	"""
	("Vintage"?
	Looks more like
	"junk" to me.)
	"""
	keyWait
	clearMsg
	jump
		target = 72
}
script 72 mmsf1 {
	mugshotShowGeo
	"""
	It doesn't seem
	like it's working
	right now...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	Yeah... That's
	just it,man.
	Thing is,
	"""
	keyWait
	clearMsg
	"""
	this puppy needs
	a "
	"""
	printItem
		item = 84
	"""
	"
	to come alive.
	"""
	keyWait
	clearMsg
	"""
	I ordered one a
	while ago,but it
	hasn't arrived.
	"""
	keyWait
	clearMsg
	"""
	Maybe the guy
	got swept away
	in the current...
	"""
	keyWait
	clearMsg
	"""
	But I can't just
	leave the store
	and look for him,
	"""
	keyWait
	clearMsg
	"""
	ya dig? And leave
	all my customers
	stranded here?
	"""
	keyWait
	clearMsg
	"""
	Actually...
	You wanna do me
	a solid,dude?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	mugshotAnimation
		animation = 1
	"""
	(Hmm... Should I
	help Ken?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
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
		jump1 = 73
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	I feel you,man.
	Got places to
	be,right?
	"""
	keyWait
	clearMsg
	"""
	I'll just be
	here singing
	the blues...
	"""
	keyWait
	clearMsg
	end
}
script 73 mmsf1 {
	mugshotShow
		mugshot = KenSuther
	"""
	Far out!
	You're the bomb!
	"""
	keyWait
	clearMsg
	"""
	Delivery man said
	he was gonna
	surf on over
	"""
	keyWait
	clearMsg
	"""
	to AMAKEN first
	to offload some
	stuff.
	"""
	keyWait
	clearMsg
	"""
	Might be a good
	place to have a
	look-see,yeah?
	"""
	keyWait
	clearMsg
	"""
	I'll be here if
	you need me. I'm
	countin' on you!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF120
	end
}
script 74 mmsf1 {
	msgOpen
	"""
	It's the store
	assistant robot,
	"""
	keyWait
	clearMsg
	"""
	but it's not doing
	much assisting
	right now.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	Delivery man said
	he was gonna
	surf on over
	"""
	keyWait
	clearMsg
	"""
	to AMAKEN first
	to offload some
	stuff.
	"""
	keyWait
	clearMsg
	"""
	Might be a good
	place to have a
	look-see,yeah?
	"""
	keyWait
	clearMsg
	end
}
script 75 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KenSuther
	"""
	Hey,isn't that?
	"""
	keyWait
	clearMsg
	"""
	Cowabunga!
	You got the
	"
	"""
	printItem
		item = 84
	"""
	"!
	"""
	keyWait
	clearMsg
	"""
	Can you install
	it for me? Me
	and machines,
	"""
	keyWait
	clearMsg
	"""
	we don't speak
	the same
	language,man.
	"""
	keyWait
	clearMsg
	"""
	You're good with
	gadgets,right?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	OK,just gotta
	put this right
	around.
	"""
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"""
	 here.
	"""
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	keyWait
	clearMsg
	"""
	And.
	"""
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"""
	 there!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemTake
		item = 84
		amount = 1
	"""
	Geo installed:
	"
	"""
	printItem
		item = 84
	"""
	"!!
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
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
		mugshot = Geo
	"""
	Well...
	Not much is
	happening...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	Guess it was a
	dud,after all.
	"""
	keyWait
	clearMsg
	"""
	That "
	"""
	printItem
		item = 84
	"""
	"
	is really hard to
	find these days.
	"""
	keyWait
	clearMsg
	"""
	Man...big time
	bummer,dude!
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Let me take a
	look again...
	"""
	keyWait
	clearMsg
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
	checkFlag
		flag = 85
		jumpIfTrue = 77
		jumpIfFalse = 76
}
script 76 mmsf1 {
	mugshotShow
		mugshot = OmegaXis
	"""
	(Hey,check it...
	The data on this
	chip was wiped.)
	"""
	keyWait
	clearMsg
	"""
	(It must've been
	lying in the open
	for a while.)
	"""
	keyWait
	clearMsg
	"""
	(You don't
	think...)
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	(Maybe someone
	came by and stole
	the data?)
	"""
	keyWait
	clearMsg
	"""
	(I guess I'd
	better check at
	AMAKEN again...)
	"""
	keyWait
	clearMsg
	jump
		target = 78
}
script 77 mmsf1 {
	mugshotShowGeo
	mugshotAnimation
		animation = 1
	"""
	(Strange...
	There's no data
	on it.
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(It was probably
	lying in the open
	for a while.)
	"""
	keyWait
	clearMsg
	"""
	(Maybe someone
	came by and stole
	the data?)
	"""
	keyWait
	clearMsg
	"""
	(I guess I'd
	better check at
	AMAKEN again...)
	"""
	keyWait
	clearMsg
	jump
		target = 78
}
script 78 mmsf1 {
	flagSet
		flag = 0xF123
	end
}
script 79 mmsf1 {
	msgOpen
	"""
	It's the store
	assistant robot,
	"""
	keyWait
	clearMsg
	"""
	but it's not doing
	much assisting
	right now.
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	mugshotAnimation
		animation = 1
	"""
	(Someone might've
	stolen the "Navi
	Chip" data.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(I guess I'd
	better check at
	AMAKEN again...)
	"""
	keyWait
	clearMsg
	end
}
script 80 mmsf1 {
	msgOpen
	"""
	It's the store
	assistant robot,
	"""
	keyWait
	clearMsg
	"""
	but it's not doing
	much assisting
	right now.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	This puppy needs
	a "
	"""
	printItem
		item = 84
	"""
	"
	to come alive.
	"""
	keyWait
	clearMsg
	"""
	I ordered one a
	while ago,but it
	hasn't arrived.
	"""
	keyWait
	clearMsg
	"""
	Maybe the guy
	got swept away
	in the current...
	"""
	keyWait
	clearMsg
	"""
	But I can't just
	leave the store
	and look for him,
	"""
	keyWait
	clearMsg
	"""
	ya dig? And leave
	all my customers
	stranded here?
	"""
	keyWait
	clearMsg
	"""
	So...
	You wanna do me
	a solid,dude?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	mugshotAnimation
		animation = 1
	"""
	(Hmm... Should I
	help Ken?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 63
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
		jump1 = 73
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	I feel you,man.
	Got places to
	be,right?
	"""
	keyWait
	clearMsg
	"""
	I'll just be
	here singing
	the blues...
	"""
	keyWait
	clearMsg
	end
}
script 81 mmsf1 {
	flagSet
		flag = 0xF127
	end
}
script 90 mmsf1 {
	itemTake
		item = 85
		amount = 1
	checkFlag
		flag = 0xF194
		jumpIfTrue = 134
		jumpIfFalse = continue
	checkFlag
		flag = 0xF12A
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 0x1620
		jumpIfTrue = continue
		jumpIfFalse = 133
	msgOpen
	mugshotShow
		mugshot = MrFamous
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Battle tips"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Power Up data"
	"""
	Hey there,Geo!
	What can I do
	for you?
	"""
	selectButtonColumn2
		default = 0
		BContinue = true
		disableB = false
		jump1 = 100
		jump2 = 94
		jump3 = continue
	clearMsg
	callEnableTextSkip
	"""
	See you around,
	then!
	"""
	keyWait
	clearMsg
	end
}
script 91 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Hey there,Geo!
	"""
	keyWait
	clearMsg
	"""
	What's my favorite
	Blue Bomber
	up to today?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"""
	...!?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MrFamous
	"""
	Heh heh. I AM
	an electronic
	now,after all.
	"""
	keyWait
	clearMsg
	"""
	Don't worry,
	your secret's
	safe with me!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 85
		jumpIfTrue = 93
		jumpIfFalse = 92
}
script 92 mmsf1 {
	mugshotShow
		mugshot = OmegaXis
	"""
	(Wh-Who IS
	this guy!?)
	"""
	keyWait
	clearMsg
	jump
		target = 93
}
script 93 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Let me properly
	thank you for
	helping earlier.
	"""
	keyWait
	clearMsg
	"""
	Here's an item
	that should be
	pretty useful.
	"""
	keyWait
	clearMsg
	mugshotHide
	soundPlay
		sound = 203
	callReceiveMail
		flag = 0x1620
		markRead = false
	playerAnimate
		animation = 24
	"""
	Geo got:
	"Power Up"!!
	"""
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = MrFamous
	"""
	Power Up data
	boosts your stats
	and abilities.
	"""
	keyWait
	clearMsg
	"""
	Plus,you'll start
	battles in Star
	Force! You can
	"""
	keyWait
	clearMsg
	"""
	turn your Power Up
	data ON/OFF from
	the Mega screen.
	"""
	keyWait
	clearMsg
	"""
	Say,have you
	been working on
	your Database?
	"""
	keyWait
	clearMsg
	"""
	As you record
	more Counter
	Hits in it,
	"""
	keyWait
	clearMsg
	"""
	I'll be able to
	increase your
	Power Up level.
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF12A
	jump
		target = 94
}
script 94 mmsf1 {
	callBufferDatabaseCounts
		deleteBuffer = 0
		counterHitBuffer = 1
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Let's see...
	You've deleted
	
	"""
	printBuffer
		buffer = 0
		minLength = 3
		padMode = noPad
	" enemies,"
	keyWait
	clearMsg
	"""
	and landed a
	Counter Hit on
	
	"""
	printBuffer
		buffer = 1
		minLength = 3
		padMode = noPad
	" enemies."
	keyWait
	clearMsg
	checkFlag
		flag = 0xF192
		jumpIfTrue = 138
		jumpIfFalse = continue
	callCheckWaveScannerUpdated
		levelBuffer = 2
		jumpIfNoChange = 98
	checkGameVersion
		jumpIfPegasus = 95
		jumpIfLeo = 96
		jumpIfDragon = 97
}
script 95 mmsf1 {
	"""
	OK! I'll set your
	Power Up data to
	Pegasus Lv. 
	"""
	printBuffer
		buffer = 2
		minLength = 3
		padMode = noPad
	"!"
	keyWait
	clearMsg
	jump
		target = 99
}
script 96 mmsf1 {
	"""
	OK! I'll set your
	Power Up data to
	Leo Lv. 
	"""
	printBuffer
		buffer = 2
		minLength = 3
		padMode = noPad
	"!"
	keyWait
	clearMsg
	jump
		target = 99
}
script 97 mmsf1 {
	"""
	OK! I'll set your
	Power Up data to
	Dragon Lv. 
	"""
	printBuffer
		buffer = 2
		minLength = 3
		padMode = noPad
	"!"
	keyWait
	clearMsg
	jump
		target = 99
}
script 98 mmsf1 {
	checkFlag
		flag = 0xF17E
		jumpIfTrue = continue
		jumpIfFalse = 130
	callCheckBuffer
		buffer = 1
		value = 104
		jumpIfLess = continue
		jumpIfEqual = 136
		jumpIfGreater = 136
	"""
	Nice job!
	Keep filling up
	that Database!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 99 mmsf1 {
	callUpdateWaveScanner
	flagSet
		flag = 0xF196
	soundPlay
		sound = 204
	mugshotHide
	"""
	Power Up data
	has been updated!
	"""
	wait
		frames = 30
	keyWait
	clearMsg
	checkFlag
		flag = 0xF17E
		jumpIfTrue = continue
		jumpIfFalse = 131
	callCheckBuffer
		buffer = 1
		value = 104
		jumpIfLess = continue
		jumpIfEqual = 137
		jumpIfGreater = 137
	mugshotShow
		mugshot = MrFamous
	"""
	Keep filling up
	that Database!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 100 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Are you keeping
	your battling
	skills sharp?
	"""
	keyWait
	clearMsg
	"""
	Let me give you
	some useful info!
	"""
	keyWait
	clearMsg
	callRandom
		id = 0
		start = 101
		count = 25
}
script 101 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 1
	"""
	keyWait
	clearMsg
	end
}
script 102 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 2
	"""
	keyWait
	clearMsg
	end
}
script 103 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 3
	"""
	keyWait
	clearMsg
	end
}
script 104 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 4
	"""
	keyWait
	clearMsg
	end
}
script 105 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 5
	"""
	keyWait
	clearMsg
	end
}
script 106 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 6
	"""
	keyWait
	clearMsg
	end
}
script 107 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 7
	"""
	keyWait
	clearMsg
	end
}
script 108 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 8
	"""
	keyWait
	clearMsg
	end
}
script 109 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 9
	"""
	keyWait
	clearMsg
	end
}
script 110 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 10
	"""
	keyWait
	clearMsg
	end
}
script 111 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 11
	"""
	keyWait
	clearMsg
	end
}
script 112 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 12
	"""
	keyWait
	clearMsg
	end
}
script 113 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 13
	"""
	keyWait
	clearMsg
	end
}
script 114 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 14
	"""
	keyWait
	clearMsg
	end
}
script 115 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 15
	"""
	keyWait
	clearMsg
	end
}
script 116 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 16
	"""
	keyWait
	clearMsg
	end
}
script 117 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 17
	"""
	keyWait
	clearMsg
	end
}
script 118 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 18
	"""
	keyWait
	clearMsg
	end
}
script 119 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 19
	"""
	keyWait
	clearMsg
	end
}
script 120 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 20
	"""
	keyWait
	clearMsg
	end
}
script 121 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 21
	"""
	keyWait
	clearMsg
	end
}
script 122 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 22
	"""
	keyWait
	clearMsg
	end
}
script 123 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 23
	"""
	keyWait
	clearMsg
	end
}
script 124 mmsf1 {
	flagSet
		flag = 0xF12B
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 24
	(Cipher)
	"""
	keyWait
	clearMsg
	end
}
script 125 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Battle Tip 25
	"""
	keyWait
	clearMsg
	end
}
script 130 mmsf1 {
	callCheckBuffer
		buffer = 1
		value = 69
		jumpIfLess = continue
		jumpIfEqual = continue
		jumpIfGreater = 132
	mugshotShow
		mugshot = MrFamous
	"""
	Nice job!
	Keep filling up that
	Database!
	"""
	keyWait
	clearMsg
	"""
	By the way, once you get
	at least 70 Counters,
	come see me.
	"""
	keyWait
	clearMsg
	"""
	I'll have something
	special for you.
	Bye for now!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 131 mmsf1 {
	callCheckBuffer
		buffer = 1
		value = 69
		jumpIfLess = continue
		jumpIfEqual = continue
		jumpIfGreater = 132
	mugshotShow
		mugshot = MrFamous
	"""
	Keep filling up that
	Database!
	"""
	keyWait
	clearMsg
	"""
	By the way, once you get
	at least 70 Counters,
	come see me.
	"""
	keyWait
	clearMsg
	"""
	I'll have something
	special for you.
	Bye for now!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 132 mmsf1 {
	flagSet
		flag = 0xF17E
	mugshotShow
		mugshot = MrFamous
	"""
	...Brilliant!
	You've Countered more
	than 69 different enemies!
	"""
	keyWait
	clearMsg
	"""
	That's some impressive
	virus busting! You've
	surpassed even myself!
	"""
	keyWait
	clearMsg
	"""
	...Maybe it's time.
	I think you're strong
	enough to handle it...
	"""
	keyWait
	clearMsg
	"""
	Geo, let me give you
	something very special.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 88
		amount = 1
	playerAnimate
		animation = 24
	"""
	Geo got:
	"
	"""
	printItem
		item = 88
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = MrFamous
	"""
	This "DX Card" is
	something I've been
	working on in secret.
	"""
	keyWait
	clearMsg
	"""
	If you swipe this card
	in your Transer,
	"""
	keyWait
	clearMsg
	"""
	you'll be able to test
	your skills against super
	powerful DX Bosses!
	"""
	keyWait
	clearMsg
	"""
	Once you've defeated
	all of the regular
	forms of a boss,
	"""
	keyWait
	clearMsg
	"""
	activate the DX Card
	from Key Items,
	"""
	keyWait
	clearMsg
	"""
	and seek out the
	strongest form of
	that boss again.
	"""
	keyWait
	clearMsg
	"""
	If you do, a DX Boss will
	appear to challenge you!
	"""
	keyWait
	clearMsg
	"""
	Be careful! They won't
	hold anything back.
	"""
	keyWait
	clearMsg
	"""
	I have faith in you two.
	Blow 'em away!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 133 mmsf1 {
	callReceiveMail
		flag = 0x1620
		markRead = false
	jump
		target = 90
}
script 134 mmsf1 {
	flagClear
		flag = 0xF194
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Hey there, Geo!
	"""
	keyWait
	clearMsg
	"""
	Now that you've
	beaten all DX Bosses,
	"""
	keyWait
	clearMsg
	"""
	I'll let you set up your
	Power Up data so that
	"""
	keyWait
	clearMsg
	"""
	you won't start battles
	in Star Force form.
	"""
	keyWait
	clearMsg
	"""
	It might be useful if
	you like to use certain
	Mega Weapons.
	"""
	keyWait
	clearMsg
	"""
	Just give me the word
	when you want to change!
	"""
	keyWait
	clearMsg
	jump
		target = 135
}
script 135 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Battle tips"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Power Up data"
	"""
	Now, what can I
	do for you?
	"""
	selectButtonColumn2
		default = 0
		BContinue = true
		disableB = false
		jump1 = 100
		jump2 = 94
		jump3 = continue
	clearMsg
	callEnableTextSkip
	"""
	See you around,
	then!
	"""
	keyWait
	clearMsg
	end
}
script 136 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Nice job!
	Keep up the good work!
	"""
	keyWait
	clearMsg
	end
}
script 137 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Keep up the good work!
	"""
	keyWait
	clearMsg
	jump
		target = 144
}
script 138 mmsf1 {
	mugshotShow
		mugshot = MrFamous
	"""
	Do you want to start
	battles in Star Force?
	
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
		unused = true
		jump1 = 140
		jump2 = 139
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
}
script 139 mmsf1 {
	checkFlag
		flag = 0xF193
		jumpIfTrue = 141
		jumpIfFalse = continue
	callCheckWaveScannerUpdated
		levelBuffer = 2
		jumpIfNoChange = continue
	flagSet
		flag = 0xF193
	jump
		target = 143
}
script 140 mmsf1 {
	checkFlag
		flag = 0xF193
		jumpIfTrue = continue
		jumpIfFalse = 142
	flagClear
		flag = 0xF193
	callCheckWaveScannerUpdated
		levelBuffer = 2
		jumpIfNoChange = continue
	checkGameVersion
		jumpIfPegasus = 95
		jumpIfLeo = 96
		jumpIfDragon = 97
}
script 141 mmsf1 {
	callCheckWaveScannerUpdated
		levelBuffer = 2
		jumpIfNoChange = 98
	jump
		target = 143
}
script 142 mmsf1 {
	callCheckWaveScannerUpdated
		levelBuffer = 2
		jumpIfNoChange = 98
	checkGameVersion
		jumpIfPegasus = 95
		jumpIfLeo = 96
		jumpIfDragon = 97
}
script 143 mmsf1 {
	"""
	OK!
	I'll set your Power Up data
	to Neutral Lv. 
	"""
	printBuffer
		buffer = 2
		minLength = 3
		padMode = noPad
	"!"
	keyWait
	clearMsg
	jump
		target = 99
}
script 144 mmsf1 {
	checkFlag
		flag = 0xF196
		jumpIfTrue = continue
		jumpIfFalse = 145
	flagClear
		flag = 0xF196
	callRefreshTopScreen
		type = 1
	end
}
script 145 mmsf1 {
	end
}