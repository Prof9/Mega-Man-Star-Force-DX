@archive mess_0489
@size 50

script 20 mmsf1 {
	checkFlag
		flag = 2166
		jumpIfTrue = 23
		jumpIfFalse = continue
	checkFlag
		flag = 2171
		jumpIfTrue = continue
		jumpIfFalse = 23
	checkFlag
		flag = 2170
		jumpIfTrue = 24
		jumpIfFalse = continue
	flagSet
		flag = 2170
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Surf's up! Got
	some good stuff,
	so take a look!
	"""
	keyWait
	clearMsg
	"""
	Huh?
	"Tropical Tea"?
	"""
	keyWait
	clearMsg
	"""
	Oh! You want
	that!?
	"""
	keyWait
	clearMsg
	"""
	A single sip
	whisks you away
	to a tropical
	"""
	keyWait
	clearMsg
	"""
	paradise. It's
	happiness in
	liquid form,
	"""
	keyWait
	clearMsg
	"""
	sparkling like
	the sun on the
	ocean waves.
	"""
	keyWait
	clearMsg
	"""
	That's the tea
	you're looking
	for,right?
	"""
	keyWait
	clearMsg
	"""
	What? I don't
	have any in the
	store?
	"""
	keyWait
	clearMsg
	"""
	Well,I'm all out
	today,but I've
	some of my own.
	"""
	keyWait
	clearMsg
	"""
	Huh? You want
	me to give you
	my stash?
	"""
	keyWait
	clearMsg
	"""
	Aw,come on,dude!
	I was gonna save
	it for tonight.
	"""
	keyWait
	clearMsg
	"""
	...You're giving
	it as a present
	to an old man?
	"""
	keyWait
	clearMsg
	"""
	Oh,alright. I'll
	cut you a deal,
	man.
	"""
	keyWait
	clearMsg
	"""
	3,000 Zennys.
	How about it?
	"""
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 21 mmsf1 {
	clearMsg
	mugshotShowNPC
		npc = 2
	"""
	Remember to
	come back,OK
	dude?
	"""
	keyWait
	end
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Sorry,but I ran
	out of those,
	man.
	"""
	keyWait
	end
	end
}
script 23 mmsf1 {
	checkShopStock
		shop = 0
		jumpIfStocked = continue
		jumpIfSoldOut = 22
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Surf's up! Got
	some good stuff,
	so take a look!
	"""
	keyWait
	clearMsg
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
	" Look  "
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
		jump2 = 21
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callShop
		shop = 0
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	I'll sell you my
	Tropical Tea for
	3,000 Zennys.
	"""
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 25 mmsf1 {
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Buy  "
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
		jump2 = 26
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	checkZenny
		amount = 3000
		jumpIfEnough = continue
		jumpIfNotEnough = 27
	itemTakeZenny
		amount = 3000
	"""
	OK,enjoy the
	tea!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 59
		amount = 1
	flagSet
		flag = 2166
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 59
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShowNPC
		npc = 2
	"Enjoy that tea!"
	keyWait
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	No problem,dude.
	Maybe later?
	"""
	keyWait
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Sorry,but you
	don't have
	moola,man.
	"""
	keyWait
	end
}
