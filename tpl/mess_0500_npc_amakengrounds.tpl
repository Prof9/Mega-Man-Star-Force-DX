@archive mess_0500
@size 256

script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OldWoman
	"""
	So tell me,
	sonny...
	"""
	keyWait
	clearMsg
	"""
	these cards that
	you use to
	
	"""
	keyWait
	clearMsg
	"""
	drive cars and
	turn on the TV
	and such;
	"""
	keyWait
	clearMsg
	"""
	what's that
	whole system
	called again?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Card Force \n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Chip Force "
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = OldWoman
	"Hoh... I see..."
	keyWait
	clearMsg
	"OK,next..."
	keyWait
	clearMsg
	"""
	That special
	connection that
	only truly close
	"""
	keyWait
	clearMsg
	"""
	friends can
	have;
	"""
	keyWait
	clearMsg
	"""
	what do they
	call that?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" MegaBand  \n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" BrotherBand "
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = OldWoman
	"Hoh,now I see."
	keyWait
	clearMsg
	"OK,next..."
	keyWait
	clearMsg
	"""
	And when two
	people want to
	join each
	"""
	keyWait
	clearMsg
	"""
	other's Brother-
	Band,what's the
	thing that they
	"""
	keyWait
	clearMsg
	"tell each other?"
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" a secret\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" their age  "
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = OldWoman
	"Hoh,now I see."
	keyWait
	clearMsg
	"""
	Thank you!
	sonny. Now I
	know a little
	"""
	keyWait
	clearMsg
	"""
	bit more about
	life in the
	big city.
	"""
	keyWait
	clearMsg
	"""
	This is for
	your time.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 124
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
		card = 124
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = OldWoman
	"""
	Maybe you can
	teach me more
	another time.
	"""
	keyWait
	flagSet
		flag = 6213
	flagClear
		flag = 6151
	flagClear
		flag = 6911
	end
}
script 24 mmsf1 {
	msgOpen
	soundPlay
		sound = 105
	mugshotShow
		mugshot = OldWoman
	"""
	Are you trying
	put one over
	on me?
	"""
	keyWait
	end
	end
}
script 50 mmsf1 {
	checkFlag
		flag = 0xF164
		jumpIfTrue = 75
		jumpIfFalse = continue
	checkFlag
		flag = 3372
		jumpIfTrue = 55
		jumpIfFalse = continue
	jump
		target = 51
	end
}
script 65 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LegendaryMasterShin
	"You!"
	keyWait
	clearMsg
	"""
	I can feel your
	Legendary soul!
	"""
	keyWait
	clearMsg
	"""
	But,you'll need
	3,000 Zennys
	to sign up...
	"""
	keyWait
	clearMsg
	positionOptionFromCenter
		width = 10
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Pay 3,000 Zennys"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Legend Force?"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Quit"
	"""
	Why don't you
	change your
	Personal B.Combo
	"""
	keyWait
	clearMsg
	"""
	into a Legend
	Force?
	"""
	keyWait
	selectButtonColumn3
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 70
		jump3 = 66
		jump4 = continue
	clearMsg
	checkZenny
		amount = 3000
		jumpIfEnough = continue
		jumpIfNotEnough = 67
	callGiveLegendForce
		jumpIfSuccessful = continue
		jumpIfNoPBCombo = 68
		jumpIfNoRoom = 69
	itemTakeZenny
		amount = 3000
	mugshotHide
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printBestComboBuffer
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"Legendary!"
	keyWait
	clearMsg
	"""
	Your Personal
	Best Combo has
	been changed
	"""
	keyWait
	clearMsg
	"""
	into a Legend
	Force!
	"""
	keyWait
	clearMsg
	"See you..."
	keyWait
	clearMsg
	"Legendary!"
	keyWait
	end
	end
}
script 75 mmsf1 {
	flagSet
		flag = 3372
	flagClear
		flag = 0xF164
	msgOpen
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	Thanks for coming, Geo!
	"""
	keyWait
	clearMsg
	"""
	I actually have a
	favor to ask...
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"""
	Please become Brothers
	with me!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	I think I could learn a lot
	from you about what it
	means to be Legendary!
	"""
	keyWait
	clearMsg
	"""
	So, what do you think?
	"""
	keyWait
	clearMsg
	mugshotHide
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
	"  No "
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 76
		jump2 = 57
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 76 mmsf1 {
	checkFlag
		flag = 225
		jumpIfTrue = continue
		jumpIfFalse = 56
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	OK! ...But wait!
	We're already Brothers!
	"""
	keyWait
	clearMsg
	"""
	Huh! When did that happen?
	How mysterious...
	"""
	keyWait
	clearMsg
	end
}
script 80 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Gggh...
	Gwaaaaaah!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF022
	callStartBattle
		battle = 0x69
	end
}
script 81 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Gweeeeehhh!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF023
	callStartBattle
		battle = 0x6A
	end
}
script 90 mmsf1 {
	msgOpen
	checkItem
		item = 84
		amount = 1
		jumpIfEqual = 93
		jumpIfGreater = 93
		jumpIfLess = 91
	end
}
script 91 mmsf1 {
	checkFlag
		flag = 0xF121
		jumpIfTrue = 92
		jumpIfFalse = continue
	mugshotShow
		mugshot = Worker
	"""
	Oh,where is it?
	Where is it!?
	"""
	keyWait
	clearMsg
	"""
	Ken is going
	to chew me out
	over this...
	"""
	keyWait
	clearMsg
	mugshotShowGeo
	"""
	Um,excuse me?
	Are you talking
	about Mr.Suther?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Worker
	"""
	...Hm?
	Ken sent you?
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF121
	jump
		target = 92
}
script 92 mmsf1 {
	mugshotShow
		mugshot = Worker
	"""
	I was supposed
	to deliver this
	"
	"""
	printItem
		item = 84
	"""
	",
	"""
	keyWait
	clearMsg
	"""
	but I must
	have dropped
	it somewhere.
	"""
	keyWait
	clearMsg
	"""
	In my haste,
	I took a nasty
	tumble down the
	"""
	keyWait
	clearMsg
	"""
	stairs earlier.
	Maybe you could
	help me look?
	"""
	keyWait
	clearMsg
	end
}
script 93 mmsf1 {
	checkFlag
		flag = 0xF122
		jumpIfTrue = 94
		jumpIfFalse = continue
	mugshotShow
		mugshot = Worker
	"""
	Hey,you found
	the "
	"""
	printItem
		item = 84
	"""
	"!
	"""
	keyWait
	clearMsg
	"""
	Go ahead and
	take it.
	"""
	keyWait
	clearMsg
	"""
	You're going back
	to Echo Ridge
	anyway,right?
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF122
	flagSet
		flag = 0xD2E
	jump
		target = 94
}
script 94 mmsf1 {
	mugshotShow
		mugshot = Worker
	"""
	Tell Ken I said
	hi! Oh,and sorry
	for the wait,too.
	"""
	keyWait
	clearMsg
}
script 101 mmsf1 {
	msgOpen
	"""
	I can't go
	in now.
	"""
	keyWait
	end
	end
}
script 201 mmsf1 {
	clearMsg
	"""
	Please come back
	again sometime!
	"""
	keyWait
	end
	end
}
