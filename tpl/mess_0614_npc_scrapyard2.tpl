@archive mess_0614
@size 256

script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Sonia
	"""
	I'm tying to
	come up with
	lyrics for a new
	"""
	keyWait
	clearMsg
	"""
	song,but I just
	seem to keep
	running into
	"""
	keyWait
	clearMsg
	"a brick wall."
	keyWait
	clearMsg
	"Hey,"
	printPlayerName1
	"""
	,
	why don't you
	help me write?
	"""
	keyWait
	clearMsg
	"""
	You might be
	able to give me
	a little bit of,
	"""
	keyWait
	clearMsg
	"""
	you know,
	inspration!
	
	"""
	keyWait
	clearMsg
	"Please!!"
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Help  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 12
		jump2 = 13
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Sonia
	"Really!?"
	keyWait
	clearMsg
	"""
	Great! Let's get
	started.
	"""
	keyWait
	clearMsg
	"""
	The title is
	"Bonds"
	"""
	keyWait
	clearMsg
	"""
	...a 1, a 2,
	a 1 2 3 4!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 2
	"""
	"I'm all alone
	in the still
	of the night...
	"""
	keyWait
	clearMsg
	"""
	I open my
	window and I
	look outside...
	"""
	keyWait
	clearMsg
	"""
	And there it is,
	that soft...
	
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
	" moonlight!\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" blue sky!\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" sunshine!"
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
		mugshot = Sonia
	"""
	Twinkling in
	the night sky
	I can see...
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
	" the sun\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" Mars\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" the stars"
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
		mugshot = Sonia
	"""
	And I ask them
	if they are...
	
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 15
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" cold?\n"
	positionOptionFromCenter
		width = 15
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" lonely?\n"
	positionOptionFromCenter
		width = 15
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" having fun?"
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
		mugshot = Sonia
	"""
	They answer back
	to me...
	They say they're
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 13
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" connected.\n"
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" separate.\n"
	positionOptionFromCenter
		width = 13
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" in a row."
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
		mugshot = Sonia
	"""
	Many stars
	shining strong
	
	"""
	keyWait
	clearMsg
	"""
	all thanks to
	their...
	
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
	" night sky\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" shadows\n"
	positionOptionFromCenter
		width = 5
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" bonds"
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
		mugshot = Sonia
	"""
	Together they
	are never...
	
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 8
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" hot\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" happy\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" alone"
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
		mugshot = Sonia
	"""
	Tiny pieces of
	starlight,shine
	together...
	"""
	keyWait
	clearMsg
	"""
	That's how
	you'll become
	even...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 8
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" brighter\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" smaller\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" sadder"
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
		mugshot = Sonia
	"""
	Human beings
	like me and you,
	"""
	keyWait
	clearMsg
	"can combine our"
	keyWait
	clearMsg
	"""
	strength and
	get...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 10
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" sleepy too\n"
	positionOptionFromCenter
		width = 10
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" stronger too\n"
	positionOptionFromCenter
		width = 10
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" wavy too"
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
		mugshot = Sonia
	"""
	The best way
	to strive for
	perfection,
	"""
	keyWait
	clearMsg
	"""
	is to look
	around you and
	find your...
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 8
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	" bonds\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	" song\n"
	positionOptionFromCenter
		width = 8
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	" sun"
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
		mugshot = Sonia
	"No,"
	keyWait
	clearMsg
	"I'm not alone!"
	keyWait
	clearMsg
	textSpeed
		delay = 1
	"La-La-La"
	keyWait
	clearMsg
	textSpeed
		delay = 2
	"Yes! We did it!"
	keyWait
	clearMsg
	"""
	We finished the
	song together!
	"""
	keyWait
	clearMsg
	"""
	Thank you! It's
	all because of
	you,
	"""
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	This is a thank
	you from me.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 69
		amount = 1
	playerAnimate
		animation = 24
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 69
	"\"!!\n"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Sonia
	"""
	A song I wrote
	with you,
	
	"""
	printPlayerName1
	"..."
	keyWait
	clearMsg
	"""
	It's gonna be a
	truly unforget-
	table song!
	"""
	keyWait
	flagSet
		flag = 6266
	flagClear
		flag = 6204
	flagClear
		flag = 6911
	end
}
script 14 mmsf1 {
	msgOpen
	soundPlay
		sound = 105
	mugshotShow
		mugshot = Sonia
	"""
	Umm... That
	doesn't really
	sound right...
	"""
	keyWait
	end
	end
}
script 55 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Sonia
	"""
	It seems you
	already have 6
	Brothers...
	"""
	keyWait
	end
	end
}