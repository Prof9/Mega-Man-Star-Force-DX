@archive mess_1224
@size 70

script 0 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Equip"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Name"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Delete"
	"""
	What are you
	gonna do with
	this B.Combo?
	"""
	selectButtonColumn3
		default = 0
		BContinue = true
		disableB = false
		jump1 = 5
		jump2 = continue
		jump3 = 6
		jump4 = continue
	clearMsg
	end
}
script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Really delete
	"
	"""
	printBestComboBuffer
	"\"?\n"
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 8
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	textSpeed
		delay = 0
	"\""
	printBestComboBuffer
	"""
	" has
	been deleted.
	"""
	keyWait
	clearMsg
	end
}
script 5 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"\""
	printBestComboBuffer
	"""
	"
	has been
	equipped!
	"""
	keyWait
	clearMsg
	end
}
script 7 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Really delete
	"
	"""
	printBestComboBuffer
	"\"?\n"
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 8
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	textSpeed
		delay = 0
	"\""
	printBestComboBuffer
	"""
	" has
	been deleted.
	"""
	keyWait
	clearMsg
	end
}
script 10 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"That B.Combo did\n"
	printBuffer
		buffer = 0
		minLength = 4
		padMode = noPad
	"""
	 points
	of damage!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	We should save
	that one!
	"""
	keyWait
	clearMsg
	end
}
script 11 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"That B.Combo did\n"
	printBuffer
		buffer = 0
		minLength = 4
		padMode = noPad
	"""
	 points
	of damage!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	The B.Combo list
	is full. We
	gotta erase 1.
	"""
	keyWait
	clearMsg
	end
}
script 12 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Done editing the
	Best Combo list?
	
	"""
	positionOptionFromCenter
		width = 12
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Not yet"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	waitHold
}
script 13 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Don't save this
	B.Combo & quit?
	
	"""
	positionOptionFromCenter
		width = 12
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	waitHold
}
script 14 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	I'm saving the
	new B.Combo now!
	"""
	keyWait
	clearMsg
	end
}
script 20 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Give the new
	B.Combo a name!
	"""
	keyWait
	clearMsg
	end
}
script 21 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Write your pop-
	up message here!
	"""
	keyWait
	clearMsg
	end
}
script 22 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	The new B.Combo
	has been saved!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Remember,if you
	don't equip a B.
	Combo and make
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	it a P.B.Combo,
	it can't unleash
	its power!
	"""
	keyWait
	clearMsg
	end
}
script 23 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Write a pop-up
	message?
	
	"""
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 22
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
