@archive mess_0008
@size 27

script 3 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"""
	Can't equip.
	Re-edit and then
	try again.
	"""
	keyWait
	end
}
script 4 mmsf1 {	
	"Change  "
	end
}
script 10 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 0
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 11 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 0
	"  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 1
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 16
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 12 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 2
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 0
	"  "
	optionText
		up = 2
		down = 2
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 1
	"\n"
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 2
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 16
		jump3 = 16
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 13 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 2
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 0
	"  "
	optionText
		up = 3
		down = 3
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 1
	"\n"
	optionText
		up = 0
		down = 0
		left = 3
		right = 3
	"  "
	printItemBuffered
		buffer = 2
	"  "
	optionText
		up = 1
		down = 1
		left = 2
		right = 2
	"  "
	printItemBuffered
		buffer = 3
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 16
		jump3 = 16
		jump4 = 16
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 14 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 4
		down = 2
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 0
	"  "
	optionText
		up = 4
		down = 3
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 1
	"\n"
	optionText
		up = 0
		down = 4
		left = 3
		right = 3
	"  "
	printItemBuffered
		buffer = 2
	"  "
	optionText
		up = 1
		down = 4
		left = 2
		right = 2
	"  "
	printItemBuffered
		buffer = 3
	"\n"
	optionText
		up = 2
		down = 0
		left = 3
		right = 3
	"  "
	printItemBuffered
		buffer = 4
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 16
		jump3 = 16
		jump4 = 16
		jump5 = 16
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 15 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	optionText
		up = 4
		down = 2
		left = 1
		right = 1
	"  "
	printItemBuffered
		buffer = 0
	"  "
	optionText
		up = 5
		down = 3
		left = 0
		right = 0
	"  "
	printItemBuffered
		buffer = 1
	"\n"
	optionText
		up = 0
		down = 4
		left = 3
		right = 3
	"  "
	printItemBuffered
		buffer = 2
	"  "
	optionText
		up = 1
		down = 5
		left = 2
		right = 2
	"  "
	printItemBuffered
		buffer = 3
	"\n"
	optionText
		up = 2
		down = 0
		left = 5
		right = 5
	"  "
	printItemBuffered
		buffer = 4
	"  "
	optionText
		up = 3
		down = 1
		left = 4
		right = 4
	"  "
	printItemBuffered
		buffer = 5
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 16
		jump2 = 16
		jump3 = 16
		jump4 = 16
		jump5 = 16
		jump6 = 16
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	end
}
script 16 mmsf1 {
	waitHold
}
script 20 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 0
	end
}
script 21 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 1
	end
}
script 22 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 2
	end
}
script 23 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 3
	end
}
script 24 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 4
	end
}
script 25 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 5
	end
}
script 26 mmsf1 {
	callEnableTextSkip
	callGiveExtraFolder
		folder = 6
	end
}