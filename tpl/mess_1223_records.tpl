@archive mess_1223
@size 43

script 0 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 0
		down = 0
		left = 0
		right = 0
		string = "See Bros. Ranks"
	"Pick option for\n"
	printEnemyBuffered
		buffer = 0
	"""
	's
	record.
	"""
	selectButtonSingle
		default = 0
		BContinue = true
		disableB = false
		jump1 = continue
	end
}
script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "See Bro's Ranks"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Delete My Record"
	"Pick option for\n"
	printEnemyBuffered
		buffer = 0
	"""
	's
	record.
	"""
	selectButtonColumn2
		default = 0
		BContinue = true
		disableB = false
		jump1 = continue
		jump2 = 4
		jump3 = continue
	end
}
script 2 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "See Bros. Ranks"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Del Friend's Rec"
	"Pick option for\n"
	printEnemyBuffered
		buffer = 0
	"""
	's
	record.
	"""
	selectButtonColumn2
		default = 0
		BContinue = true
		disableB = false
		jump1 = continue
		jump2 = 4
		jump3 = continue
	end
}
script 3 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "See Bros. Ranks"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Delete My Record"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Del Friend's Rec"
	"Pick option for\n"
	printEnemyBuffered
		buffer = 0
	"""
	's
	record.
	"""
	selectButtonColumn3
		default = 0
		BContinue = true
		disableB = false
		jump1 = continue
		jump2 = 4
		jump3 = 4
		jump4 = continue
	end
}
script 10 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
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
	"""
	Delete your
	own record?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 12
		jump3 = 0
	clearMsg
	textSpeed
		delay = 0
	"""
	Your own record
	has been
	deleted.
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
	"""
	Delete your
	friend's record?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 12
		jump3 = 0
	clearMsg
	textSpeed
		delay = 0
	"""
	Your friend's
	record has been
	deleted.
	"""
	keyWait
	clearMsg
	end
}
script 40 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Battle info"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Reward info"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Area info"
	"Pick option for\n"
	printEnemyBuffered
		buffer = 0
	"""
	's data.
	"""
	selectButtonColumn3
		default = 0
		BContinue = true
		disableB = false
		jump1 = 41
		jump2 = 41
		jump3 = 41
		jump4 = continue
	end
}
script 41 mmsf1 {
	waitHold
	end
}
script 42 mmsf1 {
	msgOpen
	waitHold
	end
}