@archive mess_0007
@size 40

script 21 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Best Combo"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Star Force"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Roulette"
	optionButtonWide
		up = 3
		down = 3
		left = 3
		right = 3
		string = "Cancel"
	"""
	Call a Bro. and
	use a B.Combo?
	"""
	selectButtonColumn3
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
		jump4 = continue
	end
}
script 22 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Star Force"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Roulette"
	optionButtonSmall
		up = 2
		down = 2
		left = 2
		right = 2
		string = "Cancel"
	"""
	Use your Bro.'s
	power and
	transform?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 23 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Best Combo"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Roulette"
	optionButtonSmall
		up = 2
		down = 2
		left = 2
		right = 2
		string = "Cancel"
	"""
	Call a Bro. and
	use a B.Combo?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 24 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
	"""
	You're already
	changing into
	Star Force!
	"""
	keyWait
	end
}
script 25 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
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
	You're already in
	that form...Still
	wanna transform?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 33 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	mugshotShow
		mugshot = OmegaXis
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Activate"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Use normally"
	optionButtonSmall
		up = 2
		down = 2
		left = 2
		right = 2
		string = "Cancel"
	"""
	Activate this
	card's Star
	Power?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}