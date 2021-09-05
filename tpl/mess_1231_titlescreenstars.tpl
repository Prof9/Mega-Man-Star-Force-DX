@archive mess_1231
@size 23

script 10 mmsf1 {
	"Text"
	end
}
script 20 mmsf1 {
	flagClear
		flag = 0xF11B
	flagClear
		flag = 0xF11C
	msgOpen
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Normal Mode"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Legend Mode"
	textSpeed
		delay = 0
	"""
	Choose your difficulty.
	(You can change at any
	time from Key Items.)
	"""
	wait
		frames = 10
	selectButtonColumn2
		default = 0
		BContinue = true
		disableB = false
		jump1 = 21
		jump2 = 22
		jump3 = continue
	end
}
script 21 mmsf1 {
	textSpeed
		delay = 0
	"""
	Play on the original
	difficulty from
	Mega Man Star Force.
	"""
	wait
		frames = 10
	keyWait
	clearMsg
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Yes"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "No"
	textSpeed
		delay = 0
	"""
	Start the game in
	Normal Mode?
	"""
	wait
		frames = 10
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 20
		jump3 = 20
	flagSet
		flag = 0xF11B
	end
}
script 22 mmsf1 {
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Yes"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "No"
	textSpeed
		delay = 0
	"""
	A mode for truly
	Legendary players!
	Enemies power up and... 
	"""
	wait
		frames = 10
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Start the game in
	Legend Mode?
	"""
	wait
		frames = 10
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 20
		jump3 = 20
	flagSet
		flag = 0xF11C
	end
}