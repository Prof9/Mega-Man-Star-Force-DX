@archive mess_0574
@size 256

script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Girl
	"""
	Here we go!
	Question 1:
	"""
	keyWait
	clearMsg
	"""
	The attack power
	of a Cannon and
	a HeatBall1 is?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 4
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 80\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 90\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 100"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 29
		jump2 = 29
		jump3 = continue
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"That's right!"
	keyWait
	clearMsg
	"OK,question 2!"
	keyWait
	clearMsg
	"""
	AMAKEN has
	which one of
	the following?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 11
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" a museum\n"
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" a library\n"
	positionOptionFromCenter
		width = 11
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" a launch pad"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 29
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Yup!"
	keyWait
	clearMsg
	"""
	Time for
	question 3!
	"""
	keyWait
	clearMsg
	"""
	How many tele-
	scopes do they
	have at AMAKEN?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 4
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 3\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 4\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 5"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 29
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Nice one!"
	keyWait
	clearMsg
	"""
	On to
	question 4!
	"""
	keyWait
	clearMsg
	"""
	Bud's last name,
	Bison,is related
	to what animal?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 3
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" pig\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" cow\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" chicken"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 29
		jump2 = continue
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Perfect!"
	keyWait
	clearMsg
	"Question 5!"
	keyWait
	clearMsg
	"""
	Who's the owner
	of the card
	shop,Big Wave?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 12
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Ken Suther\n"
	positionOptionFromCenter
		width = 12
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Ken South\n"
	positionOptionFromCenter
		width = 12
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Kan Suthern"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 29
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Cool!"
	keyWait
	clearMsg
	"""
	Next one coming
	at you!
	"""
	keyWait
	clearMsg
	"""
	What number
	question is
	this?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 5\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 6\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 7"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 29
		jump2 = continue
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Very good!"
	keyWait
	clearMsg
	"""
	Here's question
	7 for you!
	"""
	keyWait
	clearMsg
	"3+4-5+1=?"
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 1\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 2\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 3"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 29
		jump2 = 29
		jump3 = continue
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Yeah!"
	keyWait
	clearMsg
	"""
	Question 8 is
	ready to go!
	"""
	keyWait
	clearMsg
	"1+1+2+1-3+1..."
	keyWait
	clearMsg
	"""
	How many 1's
	did I say just
	now?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 3\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 4\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 5"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 29
		jump2 = continue
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"Awesome!"
	keyWait
	clearMsg
	"""
	Question 9,on
	the line!
	"""
	keyWait
	clearMsg
	"""
	Class 5-A has
	how many
	students in all?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 9\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 10\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 11"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 29
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"OK!"
	keyWait
	clearMsg
	"""
	Last one!
	Here we go!
	Question 10:
	"""
	keyWait
	clearMsg
	"""
	Which card has
	the highest
	attack power?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 11
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" JetAttack1\n"
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" PowerBomb1\n"
	positionOptionFromCenter
		width = 10
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" WideSword"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 29
		jump3 = 29
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Girl
	"N-No way!"
	keyWait
	clearMsg
	"""
	I can't believe
	you got them
	all right...
	"""
	keyWait
	clearMsg
	"I... lost."
	keyWait
	clearMsg
	"""
	Well,this is for
	you,the winner.
	"""
	keyWait
	clearMsg
	mugshotHide
	playerAnimate
		animation = 24
	itemGive
		item = 112
		amount = 1
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 112
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Girl
	"""
	I bet you have
	more brain power
	than just that!
	"""
	keyWait
	flagSet
		flag = 6238
	flagClear
		flag = 6176
	flagClear
		flag = 6911
	end
}
script 29 mmsf1 {
	msgOpen
	soundPlay
		sound = 0x69
	mugshotShow
		mugshot = Girl
	"""
	Buzz!
	Nope!
	"""
	keyWait
	clearMsg
	"""
	Ha ha,you've
	got a long way
	to go,buddy!
	"""
	keyWait
	end
	end
}
script 40 mmsf1 {
	checkFlag
		flag = 6764
		jumpIfTrue = 41
		jumpIfFalse = continue
	msgOpen
	itemGive
		item = 53
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 53
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	flagSet
		flag = 6764
	end
}
script 41 mmsf1 {
	end
}
script 50 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Whirl, whirl...
	Bonk!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02B
	callStartBattle
		battle = 0x72
	end
}
script 51 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	Nyuk nyuk nyuk!
	"""
	keyWait
	clearMsg
	"""
	Now, where should I
	plant some voiruses next...?
	"""
	keyWait
	clearMsg
	"""
	Dose humans won't
	know what hit 'em!
	Nyuk nyuk nyuk!
	"""
	keyWait
	clearMsg
	end
}
script 52 mmsf1 {
	checkFlag
		flag = 85
		jumpIfTrue = 53
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	Y-Youuuuu!!
	"""
	keyWait
	clearMsg
	"""
	You're the wise guy that's
	been going around deleting
	my precious voiruses!
	"""
	keyWait
	clearMsg
	"""
	D'you have any idea how
	long it took me to plant
	those everywhere? Huh!?
	"""
	keyWait
	clearMsg
	"""
	Well, I hope you're ready,
	'cause now I'm gonna
	pay you back thoity-fold!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	C'mon, let's teach
	him a lesson!
	
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
		jump1 = 54
		jump2 = 55
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 53 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	mugshotAnimation
		animation = 1
	"""
	(I-Is he staring at me?)
	"""
	keyWait
	clearMsg
	"""
	(I'd better keep my
	distance for now...)
	"""
	keyWait
	clearMsg
	end
}
script 54 mmsf1 {
	mugshotShow
		mugshot = Jammer
	callScreenShake
		intensity = 2
		length = 20
	"""
	Nyuk nyuk nyuk!!
	Get 'im, boys!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF14F
	callStartBattle
		battle = 0x90
	end
}
script 55 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Hmph! Running like
	a coward, are ya?
	"""
	keyWait
	clearMsg
	end
}