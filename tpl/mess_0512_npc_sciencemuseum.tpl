@archive mess_0512
@size 256

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LittleGirl
	"""
	OK,can you help
	me with these
	questions?
	"""
	keyWait
	clearMsg
	"""
	What's that
	thing in space
	that sucks in
	"""
	keyWait
	clearMsg
	"""
	everything
	around it?
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
	" A manhole  \n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" A white hole\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 13
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" A black hole"
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
		mugshot = LittleGirl
	"""
	Wow!
	That's great!
	"""
	keyWait
	clearMsg
	"""
	OK,how many of
	those special
	Satellites are
	"""
	keyWait
	clearMsg
	"""
	there orbiting
	the Earth?
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
	" 2\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" 3\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 2
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" 4"
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
		mugshot = LittleGirl
	"""
	Wow!
	That's great!
	"""
	keyWait
	clearMsg
	"""
	OK,I know two of
	them are called
	Dragon and 
	"""
	keyWait
	clearMsg
	"""
	Pegasus. What is
	the third one
	called?
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
	" Taurus\n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 6
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Leo  \n"
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 6
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Lupus"
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
		mugshot = LittleGirl
	"""
	Wow!
	That's great!
	"""
	keyWait
	clearMsg
	"""
	Now I should
	get an A on
	my homework!
	"""
	keyWait
	clearMsg
	"""
	Thanks for the
	help. Take this.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 67
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 67
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = LittleGirl
	"""
	If I get more
	homework,I'll
	call on you!
	"""
	keyWait
	flagSet
		flag = 6218
	flagClear
		flag = 6156
	flagClear
		flag = 6911
	end
}
script 14 mmsf1 {
	msgOpen
	soundPlay
		sound = 105
	mugshotShow
		mugshot = LittleGirl
	"""
	...Hmmm?
	That seems
	wrong to me,
	"""
	keyWait
	clearMsg
	"""
	and I don't even
	know much about
	space.
	"""
	keyWait
	end
	end
}
script 40 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Doooooohh!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF025
	callStartBattle
		battle = 0x6C
	end
}
