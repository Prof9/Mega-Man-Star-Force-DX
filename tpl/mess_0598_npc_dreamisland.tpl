@archive mess_0598
@size 255

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LittleGirl
	"No way!"
	keyWait
	clearMsg
	"""
	Is that Shooting
	Star Cake!?
	"""
	keyWait
	clearMsg
	"For me!?"
	keyWait
	clearMsg
	mugshotHide
	itemTake
		item = 50
		amount = 1
	printPlayerName1
	"""
	 gave
	"
	"""
	printItem
		item = 50
	"""
	"
	to the girl!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LittleGirl
	"Thank you!"
	keyWait
	clearMsg
	"*munch* *munch*"
	keyWait
	clearMsg
	"*munch* *munch*"
	keyWait
	clearMsg
	"""
	Oh,this is so
	good!
	
	"""
	keyWait
	clearMsg
	"""
	It tastes like
	stars falling
	from the sky!
	"""
	keyWait
	clearMsg
	"""
	Thanks a lot!
	Please,
	have this.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 77
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 77
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = LittleGirl
	"""
	It's as good as
	they say!
	"""
	keyWait
	flagSet
		flag = 6244
	flagClear
		flag = 6182
	flagClear
		flag = 6911
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OldWoman
	"""
	Bring your
	unwanted goods
	here anytime!
	"""
	keyWait
	end
	end
}
script 22 mmsf1 {
	callBufferQuizAnswers
		firstBuffer = 2
	msgOpen
	mugshotShow
		mugshot = BusinessMan
	"""
	OK.
	Question #1:
	"""
	keyWait
	clearMsg
	"""
	The doghouse in
	Echo Ridge is
	actually a...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 16
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" A/C unit\n"
	positionOptionFromCenter
		width = 16
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Security System\n"
	positionOptionFromCenter
		width = 16
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" just a doghouse"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	Now,for
	Question #2:
	"""
	keyWait
	clearMsg
	"""
	"Luna" means
	which of the
	following?
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
	" moon\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" star\n"
	positionOptionFromCenter
		width = 2
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" sun"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #3:
	"""
	keyWait
	clearMsg
	"""
	Name the coffee
	in the AMAKEN
	vending machine.
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
	" MoonFace Coffee\n"
	positionOptionFromCenter
		width = 12
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" BigBang Coffee\n"
	positionOptionFromCenter
		width = 12
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Gravity Coffee"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #4:
	"""
	keyWait
	clearMsg
	"""
	Which of these
	cards is the 2nd
	most powerful?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" BraveSwd1\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Mopulance2\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" FireBzook2"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = 24
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
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #5:
	"""
	keyWait
	clearMsg
	"""
	How many basket-
	ball courts are
	there in the
	"""
	keyWait
	clearMsg
	"school Gym?"
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 8
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" 3\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 1\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 2"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = 24
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
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #6:
	"""
	keyWait
	clearMsg
	"""
	Mettenna and
	HotRoader's HP
	totalled equals
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
	" 100\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 110\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 120"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"""
	Now add a
	CannonBase's HP
	into the total.
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
	" 150\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 160\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 170"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #8:
	"""
	keyWait
	clearMsg
	"I am the Quiz..."
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 5
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" God\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" King\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Queen"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #9:
	"""
	keyWait
	clearMsg
	"""
	Name the statue
	of a dog in
	Time Square.
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 5
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Rover\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Robber\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Roger"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #10:
	"""
	keyWait
	clearMsg
	"""
	Which of these
	isn't at Echo
	Elementary?
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
	" a studio\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" a Gym\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" a chem lab"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = 24
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
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #11:
	"""
	keyWait
	clearMsg
	"Uwaaa!"
	keyWait
	clearMsg
	"""
	Tell me what
	I just said!
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
	" Uwa!\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Uwaaa!\n"
	positionOptionFromCenter
		width = 7
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Ooh"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #12
	"""
	keyWait
	clearMsg
	"Gwhoa!"
	keyWait
	clearMsg
	"""
	Pysch! Tell me
	what # question
	this is.
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
	" 12\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 13\n"
	positionOptionFromCenter
		width = 3
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 14"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #13:
	"""
	keyWait
	clearMsg
	"""
	Name the
	department store
	at Time Square.
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
	" Nakys\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Nasys\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Nacys"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = 24
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
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK.
	Question #14:
	"""
	keyWait
	clearMsg
	"""
	Which of these
	is on the roof
	Nacys?
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
	" a giraffe\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" a dog\n"
	positionOptionFromCenter
		width = 4
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" a fox"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 24
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Correct!"
	keyWait
	clearMsg
	"""
	OK. Last one.
	Question #15:
	"""
	keyWait
	clearMsg
	"""
	What kind of
	person works at
	"""
	keyWait
	clearMsg
	"""
	the second-hand
	shop on Dream
	Island?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 6
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" an old man\n"
	positionOptionFromCenter
		width = 6
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" an old lady\n"
	positionOptionFromCenter
		width = 6
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" a young girl"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 24
		jump2 = continue
		jump3 = 24
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = BusinessMan
	"Flabbergast me!!"
	keyWait
	clearMsg
	"""
	You answered all
	of my ingenious
	questions!!
	"""
	keyWait
	clearMsg
	"""
	I admit that
	you're the man.
	"""
	keyWait
	clearMsg
	"""
	Here's what
	you've won.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 113
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 113
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = BusinessMan
	"""
	They should call
	YOU the
	Quiz King.
	"""
	keyWait
	flagSet
		flag = 6246
	flagClear
		flag = 6184
	flagClear
		flag = 6911
	end
}
script 24 mmsf1 {
	msgOpen
	soundPlay
		sound = 0x69
	mugshotShow
		mugshot = BusinessMan
	"""
	I'm sorry! That
	is incorrect!
	"""
	keyWait
	clearMsg
	"Try again!"
	keyWait
	end
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Honk, honk!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02F
	callStartBattle
		battle = 0x76
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Chop, chop, chop!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF030
	callStartBattle
		battle = 0x77
	end
}
