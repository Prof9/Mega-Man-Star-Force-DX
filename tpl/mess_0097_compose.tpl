@archive mess_0097
@size 50

script 0 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Choose a Brother
	to write to.
	"""
	keyWait
	end
	end
}
script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Do you want to
	quit writing?
	
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
script 2 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Choose an icon."
	keyWait
	end
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
		left = 1
		right = 1
		string = "Send"
	optionButtonWide
		up = 0
		down = 2
		left = 2
		right = 2
		string = "Don't send"
	optionButtonWide
		up = 1
		down = 0
		left = 0
		right = 0
		string = "Change icon"
	"""
	Send a present
	with the mail?
	
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
script 4 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Write a subject
	for the mail.
	"""
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
	Write the body
	of the mail.
	"""
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Send the mail?\n"
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
script 7 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Time to get
	writing!
	"""
	keyWait
	end
	end
}
script 8 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You didn't
	choose a Brother
	to write to yet!
	"""
	keyWait
	end
	end
}
script 9 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You didn't
	choose an icon!
	"""
	keyWait
	end
	end
}
script 10 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You didn't write
	a subject yet!
	"""
	keyWait
	end
	end
}
script 11 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You didn't write
	anything yet!
	"""
	keyWait
	end
	end
}
script 12 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Hey,looks like
	you forgot
	something!
	"""
	keyWait
	end
	end
}
script 13 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't send
	mail when you're
	not connected.
	"""
	keyWait
	end
	end
}
script 14 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"""
	Can't send to
	a stranger.
	Cancelling...
	"""
	keyWait
	end
	end
}
script 15 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Sending the
	mail now!
	
	"""
	waitHold
	end
}
script 16 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Oops. There
	was a communi-
	cation error...
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
	"Mail sent!"
	keyWait
	end
	end
}
script 18 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Guess the other
	person didn't
	get our mail.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	If we send
	another one,
	this one will be
	"""
	keyWait
	clearMsg
	"""
	overwritten.
	Is that OK?
	
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
	" No!"
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
script 19 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	The mailing has
	been cancelled.
	"""
	keyWait
	end
}
script 20 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You don't have
	the card you
	want to send!
	"""
	keyWait
	end
}
script 21 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Choose a Brother"
	optionButtonWide
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Exit Compose  "
	"""
	You didn't
	choose a Brother
	to write to yet!
	"""
	keyWait
	selectButtonColumn2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 22 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide16
		up = 2
		down = 1
		left = 0
		right = 0
		string = " Choose an icon "
	optionButtonWide16
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Choose a Brother"
	optionButtonWide16
		up = 1
		down = 0
		left = 2
		right = 2
		string = "  Exit Compose  "
	"""
	You didn't
	choose an icon!
	"""
	keyWait
	textSpeed
		delay = 0
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
script 23 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide16
		up = 2
		down = 1
		left = 0
		right = 0
		string = " Write a subject"
	optionButtonWide16
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Choose a present"
	optionButtonWide16
		up = 1
		down = 0
		left = 2
		right = 2
		string = "  Exit Compose  "
	"""
	You didn't write
	a subject yet!
	"""
	keyWait
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
script 24 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide16
		up = 2
		down = 1
		left = 0
		right = 0
		string = " Write something"
	optionButtonWide16
		up = 0
		down = 2
		left = 1
		right = 1
		string = " Rewrite subject"
	optionButtonWide16
		up = 1
		down = 0
		left = 2
		right = 2
		string = "  Exit Compose  "
	"""
	You didn't write
	anything yet!
	"""
	keyWait
	textSpeed
		delay = 0
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
script 25 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Rewrite!"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Hold it!"
	"""
	Rewrite the
	whole mail?
	"""
	keyWait
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 26 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = " Yes  "
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "  No  "
	"Save the mail?"
	keyWait
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 27 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Mail saved!"
	keyWait
	end
}
script 28 mmsf1 {
	msgOpen
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
	Cancel icon
	selection?
	"""
	keyWait
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 29 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Mail sent to
	the Satellite!
	"""
	keyWait
	end
}
script 30 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 4
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	mugshotAnimation
		animation = 0
	checkSaveAccess
		jumpIfError = 44
	checkSaveExists
		jumpIfExists = 35
		jumpIfNotExists = 31
	end
}
script 31 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data.
	Hang on a sec...
	"""
	checkSaveInit
		jumpIfFailed = 34
	checkSaveInitFinished
		jumpIfSuccessful = 35
	end
}
script 37 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide16
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Choose a present"
	optionButtonWide16
		up = 0
		down = 2
		left = 1
		right = 1
		string = " Choose an icon "
	optionButtonWide16
		up = 1
		down = 0
		left = 2
		right = 2
		string = "  Exit Compose  "
	"""
	Pick a different
	present?
	"""
	keyWait
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
script 38 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	That person can
	not get mail.
	Retry later.
	"""
	keyWait
	end
}
script 39 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 4
	msgOpen
	callMugshotShowGeoMenu
	checkSaveAccess
		jumpIfError = 44
	checkSaveExists
		jumpIfExists = 40
		jumpIfNotExists = 31
	end
}
script 43 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Autosave after
	sending mail?
	
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
script 45 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Mail sent to
	your Lunar
	Knights Bro.!
	"""
	keyWait
	end
}
