@archive mess_0887
@size 256

script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	It's battle image data
	from that virus onslaught.
	"""
	keyWait
	clearMsg
	"""
	Wanna get in there and
	kick some virus tail?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 85
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Fight  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 11
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 11 mmsf1 {
	flagSet
		flag = 0xF140
	flagClear
		flag = 0xF141
	flagClear
		flag = 0xF142
	flagClear
		flag = 0xF143
	flagClear
		flag = 0xF144
	flagClear
		flag = 0xF145
	flagClear
		flag = 0xF146
	flagClear
		flag = 0xF147
	flagClear
		flag = 0xF148
	flagClear
		flag = 0xF149
	flagClear
		flag = 0xF14A
	end
}
script 12 mmsf1 {
	wait
		frames = 15
	checkBattleResult
		jumpIfWon = continue
		jumpIfLost = 13
		jumpIfOther = 14
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Now that's what I call
	a spring cleaning!
	Nice work, kid!
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 30
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Bit off more than
	you could chew, huh?
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 30
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	What's wrong?
	These guys should be
	no trouble for us!
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 30
	end
}