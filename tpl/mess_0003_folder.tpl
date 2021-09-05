@archive mess_0003
@size 90

script 0 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Not enough
	Battle Cards in
	your folder.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Quit editing and
	restore folder?
	
	"""
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
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Move all cards
	to the Card Box?
	
	"""
	positionOptionFromCenter
		width = 8
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
	end
}
script 2 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You need to
	choose 6 cards!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Let the Transer
	auto-select?
	
	"""
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
		jump1 = 6
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 4 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can add a
	maximum of 2
	Mega or Giga
	"""
	keyWait
	clearMsg
	"cards to your \nFavorites!\n"
	keyWait
	end
	end
}
script 5 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Add this card
	to Favorites?
	
	"""
	positionOptionFromCenter
		width = 8
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" OK  "
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
	end
}
script 6 mmsf1 {
	msgOpen
	callDisableTextSkip
	textSpeed
		delay = 1
	mugshotHide
	"Auto-selecting."
	wait
		frames = 10
	"."
	wait
		frames = 10
	"."
	wait
		frames = 30
	flagSet
		flag = 0xF17C
	clearMsg
	textSpeed
		delay = 0
	soundPlay
		sound = 203
	"Finished!"
	wait
		frames = 15
	keyWait
	clearMsg
	msgClose
	waitHold
	end
}
script 8 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can add
	up to 6 cards
	to Favorites.
	"""
	keyWait
	end
}
script 9 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't add a
	Mega Class card.
	"""
	keyWait
	end
}
script 10 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't add a
	Giga Class card.
	"""
	keyWait
	end
}
script 11 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't add 2
	of same Mega or
	Giga Cards.
	"""
	keyWait
	end
}
script 12 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Can't add more
	than 3 of same
	Standard cards.
	"""
	keyWait
	end
}
script 13 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't switch
	this card out.
	"""
	keyWait
	end
}
script 14 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't add
	that card to
	your Favorites!
	"""
	keyWait
	end
	end
}
script 15 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't choose
	Favorites with
	less than
	"""
	keyWait
	clearMsg
	"""
	30 cards in your
	folder!
	
	"""
	keyWait
	end
	end
}
script 16 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Legend Force
	can only go on
	the bottom!
	"""
	keyWait
	end
	end
}
script 17 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Can only add
	1 Legend Force
	card.
	"""
	keyWait
	end
}
script 18 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't swap
	Battle Cards
	with
	"""
	keyWait
	clearMsg
	"""
	Legend Force
	cards!
	
	"""
	keyWait
	end
}
script 19 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	That's only for 
	Legend Force
	cards.
	"""
	keyWait
	end
}
script 21 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Un-select all &
	choose again?
	
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
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 25 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't add
	more than 5
	Star Cards.
	"""
	keyWait
	end
}
script 26 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't put
	this card in
	the Folder.
	"""
	keyWait
	end
}
script 30 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Oops...
	Looks like that
	Friend cancelled
	"""
	keyWait
	clearMsg
	"the trade.\n"
	waitHold
	end
}
script 32 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Cancel trade?
	
	
	"""
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Continue"
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Quit  "
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
	end
}
script 33 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Trade
	Cancelled!
	"""
	waitHold
	end
}
script 34 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Trade
	Completed!
	"""
	waitHold
	end
}
script 35 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You have 10
	Legend Force
	cards! To get,
	"""
	keyWait
	clearMsg
	"""
	Legend
	Force,reduce
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	the number of
	cards in your
	card box!
	"""
	keyWait
	end
}
script 36 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like this
	Friend can't
	get this card.
	"""
	keyWait
	end
}
script 60 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	OK to give away
	this card?
	
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
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 61 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Don't send a
	present?
	
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
	end
}
script 62 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Choose present."
	keyWait
	clearMsg
	end
}
script 80 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Which Battle
	Card do you
	wanna add
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"to the trader?"
	keyWait
	clearMsg
	end
}
script 81 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Quit the trader?
	
	
	"""
	positionOptionFromCenter
		width = 14
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
	end
}
script 82 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Put these Battle
	Cards in trader?
	
	"""
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
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 84 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Do you wanna reset the
	cards you've selected?
	
	"""
	positionOptionFromCenter
		width = 63
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
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
	end
}
script 85 mmsf1 {
	checkFlag
		flag = 0xF178
		jumpIfTrue = 86
		jumpIfFalse = continue
	flagSet
		flag = 0xF178
	msgOpen
	callMugshotShowGeoMenu
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"""
	Huh?
	It's not working.
	"""
	keyWait
	clearMsg
	"""
	Maybe I should try
	another set of cards...
	"""
	keyWait
	clearMsg
	end
}
script 86 mmsf1 {
	checkFlag
		flag = 0xF179
		jumpIfTrue = 87
		jumpIfFalse = continue
	flagSet
		flag = 0xF179
	msgOpen
	callMugshotShowGeoMenu
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"""
	Huh?
	It's not working.
	"""
	keyWait
	clearMsg
	"""
	Maybe the cards need
	to have something
	in common...?
	"""
	keyWait
	clearMsg
	end
}
script 87 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"""
	Huh?
	It's not working.
	"""
	keyWait
	clearMsg
	"""
	Hmm... If I try 10 of
	the same card...
	"""
	keyWait
	clearMsg
	end
}
script 88 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"""
	Huh?
	It's not working.
	"""
	keyWait
	clearMsg
	"""
	Seems it doesn't accept
	that kind of card.
	"""
	keyWait
	clearMsg
	end
}