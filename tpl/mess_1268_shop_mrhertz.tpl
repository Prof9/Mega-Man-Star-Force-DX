@archive mess_1268
@size 40

script 0 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	"Welcome!"
	waitHold
	end
}
script 1 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	textSpeed
		delay = 0
	"""
	So what'll it
	be?
	"""
	waitHold
	end
}
script 2 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"All done?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	waitHold
	end
}
script 3 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	"""
	Come back any
	time,alright?
	
	"""
	waitHold
	end
}
script 4 mmsf1 {
	end
}
script 5 mmsf1 {
	end
}
script 6 mmsf1 {
	end
}
script 7 mmsf1 {
	end
}
script 8 mmsf1 {
	end
}
script 10 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"\""
	printCardBuffered
		buffer = 0
	"""
	"
	OK with you?
	
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	waitHold
	end
}
script 11 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"\""
	printItemBuffered
		buffer = 0
	"""
	"
	OK with you?
	
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	waitHold
	end
}
script 12 mmsf1 {
	end
}
script 13 mmsf1 {
	end
}
script 14 mmsf1 {
	end
}
script 15 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	"""
	You bought:
	"
	"""
	printCardBuffered
		buffer = 0
	"\"!!"
	keyWait
	waitHold
	end
}
script 16 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	"""
	You bought:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!!"
	keyWait
	waitHold
	end
}
script 17 mmsf1 {
	end
}
script 18 mmsf1 {
	end
}
script 20 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	"""
	Oops. Looks like
	I don't have
	enough Zennys.
	"""
	keyWait
	waitHold
	end
}
script 21 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	"""
	Hmm,looks like I
	can't carry any
	more of those.
	"""
	keyWait
	waitHold
	end
}
script 22 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = MrHertzGold
	"""
	I'm all out,but
	thanks for your
	patronage!
	"""
	keyWait
	waitHold
	end
}
script 23 mmsf1 {
	end
}
script 24 mmsf1 {
	end
}
script 25 mmsf1 {
	msgOpenQuick
	mugshotHide
	textSpeed
		delay = 0
	"\n\n"
	spacePx
		count = 82
	printBuffer
		buffer = 4
		minLength = 5
		padMode = noPad
	waitHold
	end
}
script 26 mmsf1 {
	end
}
script 27 mmsf1 {
	end
}
script 28 mmsf1 {
	end
}
script 29 mmsf1 {
	end
}
script 30 mmsf1 {
	printBuffer
		buffer = 0
		minLength = 7
		padMode = leftPadSpaces
	end
}
script 31 mmsf1 {
	printBuffer
		buffer = 0
		minLength = 5
		padMode = leftPadSpaces
	" "
	end
}
script 32 mmsf1 {
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadSpaces
	end
}
script 33 mmsf1 {
	end
}
script 34 mmsf1 {
	end
}
script 35 mmsf1 {
	end
}
script 36 mmsf1 {
	end
}
script 37 mmsf1 {
	end
}
script 38 mmsf1 {
	end
}
script 39 mmsf1 {
	end
}
