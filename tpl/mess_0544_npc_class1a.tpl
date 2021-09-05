@archive mess_0544
@size 256

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LittleBoy
	"""
	OK,here
	we go with
	Question #1.
	"""
	keyWait
	clearMsg
	"""
	Which shoes
	would you wear
	in the rain?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 7
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Sandals\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Slippers\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Galoshes"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = 14
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
		mugshot = LittleBoy
	"Correct!!"
	keyWait
	clearMsg
	"""
	And now on to
	Question #2.
	"""
	keyWait
	clearMsg
	"""
	What is the
	attack power of
	PlasmaGun1?
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
	" 20\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 30\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 40"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = continue
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = LittleBoy
	"Correct!!"
	keyWait
	clearMsg
	"""
	And now for
	Question #3.
	"""
	keyWait
	clearMsg
	"""
	Where are we
	right now?
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
	" 1-A\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 1-B\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 5-A"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 14
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = LittleBoy
	"Correct!!"
	keyWait
	clearMsg
	"""
	An now for
	Question #4.
	"""
	keyWait
	clearMsg
	"The \""
	printItem
		item = 96
	"""
	"
	SubCard recovers
	how many HPs?
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
	" 10\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 50\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 150"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = continue
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = LittleBoy
	"Correct!!"
	keyWait
	clearMsg
	"""
	And here's the
	final question,
	Question #5.
	"""
	keyWait
	clearMsg
	"""
	What does a
	snake do?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 10
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Purr\n"
	positionOptionFromCenter
		width = 10
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Growl\n"
	positionOptionFromCenter
		width = 10
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Hiss"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = 14
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
		mugshot = LittleBoy
	"""
	Wow! I didn't
	think you'd get
	them ALL right!
	"""
	keyWait
	clearMsg
	"""
	Y-You're pretty
	amazing.
	"""
	keyWait
	clearMsg
	"""
	Well,here's
	your prize.
	"""
	keyWait
	clearMsg
	itemGive
		item = 72
		amount = 1
	mugshotHide
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 72
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = LittleBoy
	"""
	I'll have to
	think up some
	new questions.
	"""
	keyWait
	flagSet
		flag = 6228
	flagClear
		flag = 6166
	flagClear
		flag = 6911
	end
}
script 14 mmsf1 {
	msgOpen
	soundPlay
		sound = 105
	mugshotShow
		mugshot = LittleBoy
	"Nope! I'm sorry!"
	keyWait
	clearMsg
	"""
	That was an
	incorrect
	answer!
	"""
	keyWait
	end
	end
}