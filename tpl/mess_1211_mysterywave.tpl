@archive mess_1211
@size 82

script 7 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 9
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 9
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 17 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 19
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 19
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 27 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 29
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 29
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 28
	end
}
script 37 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 39
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 39
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 38
	end
}
script 57 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 59
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 59
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 58
	end
}
script 67 mmsf1 {
	msgOpen
	"""
	It's locked! You
	can open it with
	a "
	"""
	printItem
		item = 102
	"\"."
	keyWait
	clearMsg
	checkItem
		item = 102
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 69
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
	"""
	Do you want
	to use a
	"
	"""
	printItem
		item = 102
	"\"?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 69
		jump3 = continue
	clearMsg
	itemTake
		item = 102
		amount = 1
	"""
	Used SubCard:
	"
	"""
	printItem
		item = 102
	"""
	" to
	unlock the wave!
	"""
	keyWait
	clearMsg
	jump
		target = 68
	end
}