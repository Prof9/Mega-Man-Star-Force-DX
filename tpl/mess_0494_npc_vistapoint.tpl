@archive mess_0494
@size 256

script 15 mmsf1 {
	checkFlag
		flag = 6251
		jumpIfTrue = 18
		jumpIfFalse = continue
	checkFlag
		flag = 6783
		jumpIfTrue = 17
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Luna
	"...Uh?"
	keyWait
	clearMsg
	"""
	Am I looking for
	recovery cards?
	"""
	keyWait
	clearMsg
	"""
	H-How did you
	know that?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Tell you what,
	I'll even look for
	them for you.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"I'm looking for..."
	keyWait
	clearMsg
	"\""
	printCard
		card = 129
	"""
	" and
	"
	"""
	printCard
		card = 130
	"""
	" and
	"
	"""
	printCard
		card = 131
	"\"."
	keyWait
	clearMsg
	"""
	But,really... I
	can find them
	by myself!!
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Uh? But you need
	them,right?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	I said I can
	find them
	myself!
	"""
	keyWait
	clearMsg
	"""
	I don't need
	your help,OK!?
	"""
	keyWait
	flagSet
		flag = 6783
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Luna
	"I'm looking for..."
	keyWait
	clearMsg
	"\""
	printCard
		card = 129
	"""
	" and
	"
	"""
	printCard
		card = 130
	"""
	" and
	"
	"""
	printCard
		card = 131
	"\"."
	keyWait
	clearMsg
	"""
	But,really... I
	can find them
	by myself!!
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Uh? But you need
	them,right?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	I said I can
	find them
	myself!
	"""
	keyWait
	clearMsg
	"""
	I don't need
	your help,OK!?
	"""
	keyWait
	end
}
script 17 mmsf1 {
	checkBoxBattleCard
		card = 129
		color = yellow
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 16
	checkBoxBattleCard
		card = 130
		color = yellow
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 16
	checkBoxBattleCard
		card = 131
		color = yellow
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 16
	msgOpen
	mugshotShow
		mugshot = Luna
	"...Ah!"
	keyWait
	clearMsg
	"T-Those are...!!"
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	The recovery
	cards you
	wanted.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	Wha-Why did you
	do that!
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"What!?"
	keyWait
	clearMsg
	"""
	But,you said
	that you
	wanted them.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	T-Those were
	supposed to be
	a present...
	"""
	keyWait
	clearMsg
	"""
	I was going to
	give them
	to you.
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"Wha!?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	You're always
	getting into
	trouble.
	"""
	keyWait
	clearMsg
	"""
	I was worried,
	so I wanted you
	to have them...
	"""
	keyWait
	clearMsg
	"""
	Now you've gone
	and messed it
	all up!!
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"I-I'm sorry."
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	Oh,well,since
	you've already
	ruined the
	"""
	keyWait
	clearMsg
	"""
	surprise...
	Take this,
	"""
	keyWait
	clearMsg
	"""
	it might do you
	some good.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 132
		color = yellow
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printCard
		card = 132
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	Take care of
	yourself.
	"""
	keyWait
	flagSet
		flag = 6251
	flagClear
		flag = 6189
	flagClear
		flag = 6911
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Bud
	"Oh! That smell!"
	keyWait
	clearMsg
	mugshotHide
	itemTake
		item = 57
		amount = 1
	"""
	Geo gave
	"
	"""
	printItem
		item = 57
	"""
	"
	to Bud!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Bud
	"Oh yeah!!"
	keyWait
	clearMsg
	"""
	A Coby
	Burger!
	"""
	keyWait
	clearMsg
	"Here's goes!!"
	keyWait
	clearMsg
	"*munch* *munch*"
	keyWait
	clearMsg
	"Deeelicious!"
	keyWait
	clearMsg
	"""
	Thanks for the
	great burger!
	"""
	keyWait
	clearMsg
	"Take this."
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 112
		amount = 1
	playerAnimate
		animation = 24
	"""
	Geo got:
	"
	"""
	printItem
		item = 112
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Bud
	"Deeelicious!"
	keyWait
	flagSet
		flag = 6252
	flagClear
		flag = 6190
	flagClear
		flag = 6911
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Zack
	flagClear
		flag = 6911
	"...Uh?"
	keyWait
	clearMsg
	"""
	I helped save
	Echo Ridge?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	If it weren't
	for you,
	
	"""
	keyWait
	clearMsg
	"""
	we'd all be in
	serious trouble.
	
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"I did...?"
	keyWait
	clearMsg
	mugshotShowGeo
	"Yes,you did!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"...Really?"
	keyWait
	clearMsg
	"""
	I did something
	useful?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Have a little
	more faith
	in yourself.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	Faith... You're
	right.
	"""
	keyWait
	clearMsg
	"""
	Thanks,I feel
	better now.
	"""
	keyWait
	clearMsg
	"...Oh yeah."
	keyWait
	clearMsg
	"""
	Um,up until now,
	I've never had
	the courage to
	"""
	keyWait
	clearMsg
	"""
	ask because I
	didn't have the
	confidence,
	"""
	keyWait
	clearMsg
	"""
	but will you be
	Brothers with
	me?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
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
		jump1 = 28
		jump2 = 29
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 28 mmsf1 {
	flagSet
		flag = 6253
	flagClear
		flag = 6191
	flagSet
		flag = 167
	flagSet
		flag = 6787
	flagSet
		flag = 6823
	end
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Zack
	"Oh..."
	keyWait
	clearMsg
	flagSet
		flag = 6253
	flagClear
		flag = 6191
	end
}
script 50 mmsf1 {
	checkFlag
		flag = 6189
		jumpIfTrue = 15
		jumpIfFalse = continue
	checkFlag
		flag = 222
		jumpIfTrue = continue
		jumpIfFalse = 52
	jump
		target = 51
	end
}
script 60 mmsf1 {
	checkFlag
		flag = 6190
		jumpIfTrue = 20
		jumpIfFalse = continue
	checkFlag
		flag = 223
		jumpIfTrue = continue
		jumpIfFalse = 62
	jump
		target = 61
	end
}
script 70 mmsf1 {
	checkFlag
		flag = 224
		jumpIfTrue = 71
		jumpIfFalse = continue
	checkFlag
		flag = 6253
		jumpIfTrue = 72
		jumpIfFalse = continue
	checkFlag
		flag = 6191
		jumpIfTrue = continue
		jumpIfFalse = 71
	jump
		target = 72
	end
}
script 110 mmsf1 {
	jump
		target = 111
	checkFlag
		flag = 0xA4
		jumpIfTrue = 115
		jumpIfFalse = continue
	checkFlag
		flag = 61442
		jumpIfTrue = 111
		jumpIfFalse = continue
	msgOpen
	mugshotShowGeo
	"""
	That's strange...
	Was this here
	before?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Well,all you do
	here is stare
	at the sky...
	"""
	keyWait
	clearMsg
	"""
	Wouldn't be
	surprised if you
	just missed it.
	"""
	keyWait
	clearMsg
	"""
	Anyway... aren't
	you going to
	try it out,kid?
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	A Card Trader ★.
	Put in 10 cards?
	
	"""
	positionOptionFromCenter
		width = 65
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes!  "
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
		jump2 = 112
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	flagSet
		flag = 61442
	checkBoxCards
		amount = 10
		jumpIfEnough = continue
		jumpIfNotEnough = 114
	callCardTrader
		trader = 4
		isCardTrader5 = false
		isCardTraderSP = true
	end
}
script 111 mmsf1 {
	checkFlag
		flag = 0xA4
		jumpIfTrue = 115
		jumpIfFalse = continue
	msgOpen
	mugshotShowGeo
	textSpeed
		delay = 0
	"""
	A Card Trader ★.
	Put in 10 cards?
	
	"""
	positionOptionFromCenter
		width = 65
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes!  "
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
		jump2 = 112
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	flagSet
		flag = 61442
	checkBoxCards
		amount = 10
		jumpIfEnough = continue
		jumpIfNotEnough = 114
	callCardTrader
		trader = 4
		isCardTrader5 = false
		isCardTraderSP = true
	end
}
script 112 mmsf1 {
	checkFlag
		flag = 61442
		jumpIfTrue = continue
		jumpIfFalse = continue
	end
}
script 113 mmsf1 {
	flagSet
		flag = 61442
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	C'mon! Sometimes
	you gotta take
	risks in life!
	"""
	keyWait
	clearMsg
	end
}
script 114 mmsf1 {
	msgOpen
	mugshotShowGeo
	"""
	Looks like we
	don't have
	enough cards.
	"""
	keyWait
	end
}
script 115 mmsf1 {
	end
}
script 130 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"Ker-clunk!!"
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 61473
	callStartBattle
		battle = 104
	end
}
