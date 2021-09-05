@archive mess_1222
@size 30

script 0 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Edit an 
	existing
	premade face!
	"""
	waitHold
	end
}
script 1 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Make a brand
	new face icon!
	"""
	waitHold
	end
}
script 10 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes   "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"""
	Saving this icon
	will overwrite
	the old one. OK?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = 11
		jump2 = continue
		jump3 = continue
	end
}
script 20 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes   "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"""
	Revert back to
	your old icon
	and quit?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 22
		jump3 = continue
	clearMsg
	textSpeed
		delay = 0
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes   "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"""
	Are you sure
	you want to
	quit?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 22
		jump3 = continue
	clearMsg
	end
}
script 21 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes   "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"Save face icon?\n"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 22
		jump3 = continue
	clearMsg
	textSpeed
		delay = 0
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes   "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No   "
	"""
	Are you sure
	you want to
	save?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 22
		jump3 = continue
	clearMsg
	textSpeed
		delay = 0
	"Face icon saved!"
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	You'll lose the
	face icon you 
	made if you
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	don't save.
	Always remember
	to save!
	"""
	keyWait
	end
	end
}
