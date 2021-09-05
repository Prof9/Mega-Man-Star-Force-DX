@archive mess_0534
@size 256

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Principal
	"""
	OK,I'll sing it,
	and you can help
	me choose the
	"""
	keyWait
	clearMsg
	"""
	right words...
	Ah... *ahem*
	"""
	keyWait
	clearMsg
	"Here I go..."
	keyWait
	clearMsg
	"""
	In the town of
	Echo Ridge sits
	"""
	keyWait
	clearMsg
	"""
	a school house
	that's...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" White\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Yellow\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Black"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 14
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Principal
	"""
	That's our
	school!
	"""
	keyWait
	clearMsg
	"""
	The students
	are all so...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 5
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Grown up\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Cheerful\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Pitiful"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = continue
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Principal
	"""
	And the teachers
	are all so...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 5
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Naive\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Scary\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" Kind"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 14
		jump2 = 14
		jump3 = continue
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Principal
	"""
	That's our
	school!
	"""
	keyWait
	clearMsg
	"""
	Echo...
	Echo...
	Echo...
	"""
	keyWait
	clearMsg
	"""
	We love you
	Echo...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" Elementary\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Junior High\n"
	positionOptionFromCenter
		width = 9
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" High School"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 14
		jump3 = 14
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	soundPlay
		sound = 0xCC
	mugshotShow
		mugshot = Principal
	"...Oh"
	keyWait
	clearMsg
	"Ohhhh!"
	keyWait
	clearMsg
	"""
	That wasn't
	bad at all!
	"""
	keyWait
	clearMsg
	"""
	I think I can
	work with that!
	"""
	keyWait
	clearMsg
	"""
	I really
	appreciate this.
	"""
	keyWait
	clearMsg
	"""
	Thanks to you,
	our new school
	song is going
	"""
	keyWait
	clearMsg
	"""
	to be dynamite!
	And we just may
	attract some
	"""
	keyWait
	clearMsg
	"""
	more students!
	Ha ha ha.
	"""
	keyWait
	clearMsg
	"""
	But,let's keep
	that between me
	and you. *wink*
	"""
	keyWait
	clearMsg
	"This is for you."
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	mugshotHide
	itemGiveCard
		card = 17
		color = yellow
		amount = 1
	printPlayerName1
	"""
	 got:
	"
	"""
	printCard
		card = 17
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Principal
	"""
	This will bring
	more students
	in for sure!
	"""
	keyWait
	flagSet
		flag = 6224
	flagClear
		flag = 6162
	flagClear
		flag = 6911
	end
}
script 14 mmsf1 {
	msgOpen
	soundPlay
		sound = 105
	mugshotShow
		mugshot = Principal
	"""
	For some reason
	it just doesn't
	sound right...
	"""
	keyWait
	end
	end
}