@archive mess_0350
@size 7

script 5 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	No good.
	I can't get it
	to open.
	"""
	keyWait
	clearMsg
	"""
	Should I give it
	another try?
	
	"""
	textSpeed
		delay = 0
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
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 6
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
