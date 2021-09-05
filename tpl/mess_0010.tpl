@archive mess_0010
@size 246

script 1 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Is it really OK
	to delete?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 15
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
		jump1 = 2
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
	"Delete complete."
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"Register here?\n \n"
	positionOptionFromCenter
		width = 10
	textSpeed
		delay = 0
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
script 4 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Updating data."
	waitFlag
		flag = 3344
	waitHold
	end
}
script 5 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Update complete."
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	 is
	On Air!
	"""
	keyWait
	waitHold
	end
}
script 7 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Looks like\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	's
	level went up.
	"""
	keyWait
	waitHold
	end
}
script 8 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	's
	B.Combo has
	been updated!
	"""
	keyWait
	waitHold
	end
}
script 9 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	
	has completed
	Std.Class cards.
	"""
	keyWait
	waitHold
	end
}
script 10 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	
	has completed
	MegaClass cards.
	"""
	keyWait
	waitHold
	end
}
script 11 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	
	has completed
	GigaClass cards.
	"""
	keyWait
	waitHold
	end
}
script 12 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	
	has cut our
	BrotherBand...
	"""
	keyWait
	clearMsg
	"""
	Oh,well. I'll go
	ahead and delete
	them as well.
	"""
	keyWait
	waitHold
	end
}
script 13 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Let's hold off 
	on deleting that
	Brother.
	"""
	keyWait
	end
}
script 14 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	's
	Data downloaded!
	"""
	keyWait
	waitHold
	end
}
script 15 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Looks like\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"\ndisconnected!"
	keyWait
	waitHold
	end
}
script 17 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	library info's
	been updated.
	"""
	keyWait
	waitHold
	end
}
script 18 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	record info's
	been updated.
	"""
	keyWait
	waitHold
	end
}
script 19 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	What about the
	READY icon?
	
	"""
	positionOptionFromCenter
		width = 15
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Delete  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Quit"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 1
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
script 20 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Choose where to
	register your
	Brother and
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	ent. Friend Code
	to be Bros. w/a
	faraway friend.
	"""
	keyWait
	end
}
script 21 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	All full.
	Need to delete
	a Bro...
	"""
	keyWait
	end
}
script 22 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	There is already
	a Bro. there.
	"""
	keyWait
	end
}
script 23 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide
		up = 2
		down = 1
		left = 0
		right = 0
		string = "Connect"
	optionButtonWide
		up = 0
		down = 2
		left = 1
		right = 1
		string = "Code correction"
	optionButtonWide
		up = 1
		down = 0
		left = 2
		right = 2
		string = "Quit"
	textSpeed
		delay = 0
	"""
	Connect and
	Update data? 
	Or correct code?
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
script 24 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	The Friend Code
	you entered is
	incorrect.
	"""
	keyWait
	end
}
script 25 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	That person is
	already a Bro.
	"""
	keyWait
	end
}
script 26 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Downloading
	Bro. data.
	"""
	waitHold
	end
}
script 27 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Friend isn't
	ready. Retry?
	
	"""
	positionOptionFromCenter
		width = 15
	textSpeed
		delay = 0
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
script 28 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Connecting
	to Friend.
	"""
	waitHold
	end
}
script 29 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Downloading
	Friend's info.
	"""
	waitHold
	end
}
script 30 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	To search,
	again choose
	a Friend Code.
	"""
	keyWait
	end
}
script 31 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	"""
	Yeah!
	A new Bro.
	is born!
	"""
	keyWait
	end
}
script 32 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"It looks like\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"\nis the same"
	keyWait
	clearMsg
	"""
	person.
	Duplicate will
	be deleted.
	"""
	keyWait
	end
}
script 33 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	We got some new
	data for
	
	"""
	printNameBuffer1
	" "
	printNameBuffer2
	","
	keyWait
	clearMsg
	"""
	so make sure you
	delete their old
	data,OK?
	"""
	keyWait
	end
}
script 34 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	This Friend Code
	has already
	been entered.
	"""
	keyWait
	end
}
script 35 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	There are no
	Friends to
	connect to.
	"""
	keyWait
	end
}
script 36 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	There are no
	Friends to
	connect to.
	"""
	keyWait
	clearMsg
	end
}
script 37 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Multiple Friends
	with same data
	"""
	keyWait
	clearMsg
	"""
	were on standby.
	Extras deleted!
	"""
	keyWait
	end
}
script 38 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"Delete\n"
	printNameBuffer1
	printNameBuffer2
	"?\n"
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes "
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
		unused = true
		jump1 = 103
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 39 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Send mail to \n"
	printBrotherNameBuffered
		buffer = 0
		part = 0
	printBrotherNameBuffered
		buffer = 0
		part = 1
	"?\n"
	positionOptionFromCenter
		width = 9
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Send  "
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
script 40 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"Delete "
	printNameBuffer2
	printNameBuffer1
	"?\n\n"
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes "
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
		unused = true
		jump1 = 103
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 62 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	My Friend Code
	is 
	"""
	printBrotherBuffer1
	"!"
	keyWait
	end
	end
}
script 63 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	You don't have a
	Friend Code yet.
	To get one,go to
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Nintendo WFC
	under the
	On Air menu.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Connect to
	Nintendo Wi-Fi
	Connection
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	once to get
	your code.
	
	"""
	keyWait
	end
	end
}
script 80 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Oops,
	communication
	error...
	"""
	keyWait
	end
	end
}
script 100 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Register where?"
	keyWait
	end
}
script 101 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Register here?
	
	
	"""
	positionOptionFromCenter
		width = 9
	textSpeed
		delay = 0
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
		unused = true
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
script 102 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"Delete\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"?\n"
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes "
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
		unused = true
		jump1 = 103
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 103 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Once deleted, a
	Bro.'s gone till
	re-registered.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Really delete?
	
	
	"""
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
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
		unused = true
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
script 104 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Cancel Bro.
	registration?
	
	"""
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
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
script 105 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	"""
	Now you're
	Bros. with
	
	"""
	printNameBuffer1
	" "
	printNameBuffer2
	"!"
	keyWait
	end
}
script 106 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	It didn't
	work out.
	"""
	keyWait
	end
}
script 107 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Waiting for
	an answer...
	"""
	waitHold
	end
}
script 108 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Registering
	as a Bro.
	"""
	waitHold
	end
}
script 109 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	A secret they
	can't tell
	anyone...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 4
	printBrotherBuffer1
	"\n"
	printBrotherBuffer2
	"\n"
	printBrotherBuffer3
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Become Bros.
	w/this secret?
	
	"""
	positionOptionFromCenter
		width = 11
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes!  "
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
script 110 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Try it one more
	time?
	
	"""
	positionOptionFromCenter
		width = 12
	textSpeed
		delay = 0
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
script 111 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You don't have
	a secret.
	"""
	keyWait
	end
}
script 112 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	That secret
	was no good.
	
	"""
	positionOptionFromCenter
		width = 14
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Rewrite  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Quit"
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
script 113 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Tell your
	secret?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 14
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
	" Check"
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
script 114 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	OK to overwrite?
	
	
	"""
	positionOptionFromCenter
		width = 11
	textSpeed
		delay = 0
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
		jump1 = 103
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 115 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	"""
	Now you're
	Bros. with
	
	"""
	printNameBuffer1
	" "
	printNameBuffer2
	"!"
	keyWait
	clearMsg
	"""
	Multiple Friends
	with same data
	"""
	keyWait
	clearMsg
	"as "
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	
	were on standby.
	Extras deleted!
	"""
	keyWait
	end
}
script 120 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Choose a Bro."
	keyWait
	end
}
script 121 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "  No  As"
	"k\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"\nto be Bros."
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 122 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "  No  "
	printNameBuffer1
	" "
	printNameBuffer2
	"""
	's
	modifications 
	are ON.
	"""
	keyWait
	clearMsg
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 123 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"\nwants to chat.\n"
	waitHold
	end
}
script 124 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You got
	cancelled on!
	"""
	keyWait
	end
}
script 125 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = " Chat "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = " Don't c"
	"hat "
	printNameBuffer1
	" "
	printNameBuffer2
	"\nwants to chat.\n"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 126 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = " Chat "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = " Don't c"
	"hat "
	printNameBuffer1
	" "
	printNameBuffer2
	"\nwants to chat."
	keyWait
	clearMsg
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 127 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Chat request
	was cancelled!
	"""
	keyWait
	end
}
script 128 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	printNameBuffer1
	" "
	printNameBuffer2
	"\nis offline."
	keyWait
	end
}
script 129 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	There are no
	Bros. in there.
	"""
	keyWait
	end
}
script 130 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Connecting to\n"
	printNameBuffer1
	" "
	printNameBuffer2
	".\n"
	waitHold
}
script 131 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "  Yes "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "  No  Do"
	"""
	 you wanna
	disconnect?
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
script 140 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Choose whom
	to send mail to.
	"""
	keyWait
	end
}
script 141 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Send here?
	
	
	"""
	positionOptionFromCenter
		width = 11
	textSpeed
		delay = 0
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
script 142 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Cancel?
	
	
	"""
	positionOptionFromCenter
		width = 9
	textSpeed
		delay = 0
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
script 143 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You've got
	mail!
	"""
	keyWait
	end
}
script 144 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Send mail to \n"
	printBrotherNameBuffered
		buffer = 0
		part = 0
	" "
	printBrotherNameBuffered
		buffer = 0
		part = 1
	"?\n"
	positionOptionFromCenter
		width = 9
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Send  "
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
script 145 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	That Bro.
	isn't On Air.
	"""
	keyWait
	end
}
script 146 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Cipher Mail
	has already
	been sent to
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	the Satellite.
	Let's close the
	Transer & wait.
	"""
	keyWait
	end
}
script 147 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Mail has already
	been sent to
	Lunar Knights
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Brother.
	Let's close the
	Transer & wait.
	"""
	keyWait
	end
	end
}
script 160 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"Wanna send \nunsent mail?\n"
	positionOptionFromCenter
		width = 14
	textSpeed
		delay = 0
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
script 161 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Uploading mail
	Data...
	"""
	waitHold
	end
}
script 162 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	The mail that
	you sent wasn't
	received.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	If you send this
	mail,the old one
	will be deleted.
	"""
	keyWait
	clearMsg
	"""
	Do you still
	want to send?
	
	"""
	positionOptionFromCenter
		width = 9
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Send  "
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
script 163 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Send complete!"
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 2
	checkSaveAccess
		jumpIfError = 173
	checkSaveExists
		jumpIfExists = 172
		jumpIfNotExists = 166
	end
}
script 164 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like mail
	failed to send.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Try again?
	
	
	"""
	positionOptionFromCenter
		width = 11
	textSpeed
		delay = 0
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
script 166 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	msgOpen
	callMugshotShowGeoMenu
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	data backup...
	
	"""
	checkSaveInit
		jumpIfFailed = 169
	checkSaveInitFinished
		jumpIfSuccessful = 170
	end
}
script 167 mmsf1 {
	flagSet
		flag = 3370
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Saving... Don't
	turn off power!
	"""
	checkSaveFinished
		jumpIfSuccessful = 168
		jumpIfFailed = 169
	end
}
script 170 mmsf1 {
	flagSet
		flag = 3370
	checkSaveAccess
		jumpIfError = 173
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	checkSaveStart
		jumpIfStarted = 167
	end
}
script 180 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Sorry!
	Can't cancel!
	"""
	keyWait
	end
}
script 181 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Uhh,let's not
	switch with that
	Brother...
	"""
	keyWait
	end
}
script 182 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
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
	Someone might
	go in there...OK
	to overwrite?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = 103
		jump2 = continue
		jump3 = continue
	end
}
script 183 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"OK to switch w/\n"
	printBrotherBuffer1
	printBrotherBuffer2
	"?\n"
	positionOptionFromCenter
		width = 13
	textSpeed
		delay = 0
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
	" No!"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 103
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 185 mmsf1 {
	checkFlag
		flag = 0xF006
		jumpIfTrue = 198
		jumpIfFalse = continue
	checkFlag
		flag = 0xF004
		jumpIfTrue = 197
		jumpIfFalse = continue
	checkFlag
		flag = 6828
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 6826
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 6825
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 6824
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 6827
		jumpIfTrue = 191
		jumpIfFalse = continue
	checkFlag
		flag = 6823
		jumpIfTrue = 189
		jumpIfFalse = continue
	checkFlag
		flag = 2071
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 2067
		jumpIfTrue = 191
		jumpIfFalse = continue
	checkFlag
		flag = 1589
		jumpIfTrue = 187
		jumpIfFalse = continue
	checkFlag
		flag = 1067
		jumpIfTrue = 186
		jumpIfFalse = continue
	end
}
script 186 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Sonia
	"Hey,"
	printPlayerName1
	"""
	!
	I'm glad we can
	be Brothers!
	"""
	keyWait
	clearMsg
	"""
	My Link
	Abilities are
	"""
	keyWait
	clearMsg
	"""
	First Barrier
	and Undershirt!
	"""
	keyWait
	clearMsg
	"""
	First Barrier is
	an ability that
	surrounds you
	"""
	keyWait
	clearMsg
	"""
	in a barrier at
	the start of a
	battle. As for
	"""
	keyWait
	clearMsg
	"""
	Undershirt,as
	long as you have
	at least 2 HPs,
	"""
	keyWait
	clearMsg
	"""
	a hit that would
	normally take
	you down to 0
	"""
	keyWait
	clearMsg
	"""
	will only take
	you down to
	1 HP instead.
	"""
	keyWait
	clearMsg
	"""
	My Link
	Abilities will
	definitely keep
	"""
	keyWait
	clearMsg
	"""
	you safe.
	See you!
	"""
	keyWait
	end
	end
}
script 187 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"""
	It's good to be
	Brothers,
	
	"""
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	My Link Ability
	is Float!
	"""
	keyWait
	clearMsg
	"""
	Float nullifies
	all panel
	effects.
	"""
	keyWait
	clearMsg
	"""
	Even poison
	panels are not
	a problem.
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	will definitely
	protect you!
	"""
	keyWait
	clearMsg
	"""
	Anyway,here's to
	being Brothers!
	
	"""
	keyWait
	end
	end
}
script 188 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Bud
	"Yo,"
	printPlayerName1
	"""
	!
	What's up?
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Super Armor.
	"""
	keyWait
	clearMsg
	"""
	It's tough under
	any attack!
	Cool,huh.
	"""
	keyWait
	clearMsg
	"""
	Forget dodging,
	just go in hard
	and kick some 
	"""
	keyWait
	clearMsg
	"""
	alien butt!
	Go get 'em.
	"""
	keyWait
	end
	end
}
script 189 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"Hi,"
	printPlayerName1
	"""
	!
	It's a pleasure
	to be Brothers!
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Mega Class+2!
	It allows you to
	"""
	keyWait
	clearMsg
	"""
	put 2 more Mega
	Class cards into
	your folder.
	"""
	keyWait
	clearMsg
	"""
	It's the perfect
	ability for
	brainy people!
	"""
	keyWait
	clearMsg
	"""
	Now,you too,
	can fight smart
	like I do!
	"""
	keyWait
	clearMsg
	"See you later!\n"
	keyWait
	end
	end
}
script 191 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Sonia
	"..."
	wait
		frames = 10
	"Um,hi"
	wait
		frames = 10
	"\n"
	printPlayerName1
	"."
	keyWait
	clearMsg
	"""
	My Link
	Abilities are
	"""
	keyWait
	clearMsg
	"""
	First Barrier
	and Undershirt!
	"""
	keyWait
	clearMsg
	"""
	First Barrier is
	an ability that
	surrounds you
	"""
	keyWait
	clearMsg
	"""
	in a barrier at
	the start of a
	battle. As for
	"""
	keyWait
	clearMsg
	"""
	Undershirt,as
	long as you have
	at least 2 HPs,
	"""
	keyWait
	clearMsg
	"""
	a hit that would
	normally take
	you down to 0
	"""
	keyWait
	clearMsg
	"""
	will only take
	you down to
	1 HP instead.
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	will definitely
	keep you safe.
	"""
	keyWait
	clearMsg
	"..."
	wait
		frames = 10
	keyWait
	clearMsg
	"...Hey!"
	wait
		frames = 10
	"""
	
	Better not cut
	Bros. with me!
	"""
	keyWait
	clearMsg
	"""
	Well,bye
	for now!
	"""
	keyWait
	end
	end
}
script 192 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"Hmph!"
	keyWait
	clearMsg
	"""
	I guess I can
	let you be my
	Brother again...
	"""
	keyWait
	clearMsg
	"""
	But just this
	once,OK!?
	
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Float!
	"""
	keyWait
	clearMsg
	"""
	Float nullifies
	all panel
	effects.
	"""
	keyWait
	clearMsg
	"""
	Even poison
	panels are not
	a problem.
	"""
	keyWait
	clearMsg
	"""
	It'll protect
	even a Brother-
	Band cutter
	"""
	keyWait
	clearMsg
	"like you,"
	printPlayerName1
	"""
	!
	But don't ever
	do that again!
	"""
	keyWait
	clearMsg
	"""
	Anyway,here's to
	being Brothers
	again!
	"""
	keyWait
	end
	end
}
script 193 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Bud
	"""
	I can't believe
	you cut our
	BrotherBand!
	"""
	keyWait
	clearMsg
	"""
	I'll pwn you
	if you try that
	again,got it?
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Super Armor.
	"""
	keyWait
	clearMsg
	"""
	It's tough under
	any attack!
	Cool,huh.
	"""
	keyWait
	clearMsg
	"""
	Forget dodging,
	just go in hard
	and kick some 
	"""
	keyWait
	clearMsg
	"""
	alien butt!
	Go get 'em.
	"""
	keyWait
	end
	end
}
script 194 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"Hi,"
	printPlayerName1
	"""
	! Thank
	you for being my
	Brother again!
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Mega Class+2!
	It allows you to
	"""
	keyWait
	clearMsg
	"""
	put 2 more Mega
	Class cards into
	your folder.
	"""
	keyWait
	clearMsg
	"""
	It's the perfect
	ability for
	brainy people!
	"""
	keyWait
	clearMsg
	"""
	Now,you too,
	can fight smart
	like I do!
	"""
	keyWait
	clearMsg
	"See you later!\n"
	keyWait
	end
	end
}
script 195 mmsf1 {
	flagClear
		flag = 6828
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	"""
	Legendary Master
	Shin is now your
	Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"It's the Legend!"
	keyWait
	clearMsg
	"Right,now then,\n"
	printPlayerName1
	","
	keyWait
	clearMsg
	"""
	My Link Ability
	is Giga Class+1!
	It lets you put
	"""
	keyWait
	clearMsg
	"""
	1 more GigaClass
	Battle Card in
	your folder.
	"""
	keyWait
	clearMsg
	"""
	Pretty
	legendary eh?
	"""
	keyWait
	clearMsg
	"""
	Use this and
	make yourself
	a legend!
	"""
	keyWait
	clearMsg
	"Cheerio."
	keyWait
	clearMsg
	"Too legendary!"
	keyWait
	end
	end
}
script 196 mmsf1 {
	checkFlag
		flag = 223
		jumpIfTrue = 188
		jumpIfFalse = continue
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherBuffer2
	" "
	printBrotherBuffer1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Luna
	"Hmph!"
	keyWait
	clearMsg
	"""
	I guess I can
	let you be my
	Brother again...
	"""
	keyWait
	clearMsg
	"""
	But just this
	once,OK!?
	"""
	keyWait
	clearMsg
	"""
	My Link Ability
	is Float!
	"""
	keyWait
	clearMsg
	"""
	Float nullifies
	all panel
	effects.
	"""
	keyWait
	clearMsg
	"""
	Even poison
	panels are not
	a problem.
	"""
	keyWait
	clearMsg
	"""
	It'll protect
	even a Brother-
	Band cutter
	"""
	keyWait
	clearMsg
	"like you,"
	printPlayerName1
	"""
	!
	But don't ever
	do that again!
	"""
	keyWait
	clearMsg
	"""
	Anyway,here's to
	being Brothers
	again!
	"""
	keyWait
	end
	end
}
script 197 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherNameBuffered
		buffer = 1
		part = 0
	printBrotherNameBuffered
		buffer = 1
		part = 1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	mugshotShowBrotherBuffered
		buffer = 1
	"""
	I'm connecting
	from the world
	of Lunar Knights!
	"""
	keyWait
	clearMsg
	"""
	Why don't we help
	each other out?
	"""
	keyWait
	clearMsg
	"""
	When you find
	something that
	you think
	"""
	keyWait
	clearMsg
	"""
	might be useful
	to me, send me
	a mail.
	"""
	keyWait
	clearMsg
	"""
	In return, I'll
	send you rare
	things I found.
	"""
	keyWait
	clearMsg
	"""
	I've got a few
	Battle Cards
	"""
	keyWait
	clearMsg
	"""
	that you can't
	find in your
	world.
	"""
	keyWait
	clearMsg
	"""
	And if you know
	any tips for
	Lunar Knights,
	"""
	keyWait
	clearMsg
	"""
	let me know as
	well. I could use
	some help here!
	"""
	keyWait
	clearMsg
	"""
	May the Sun
	be with you!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0x1621
		jumpIfTrue = continue
		jumpIfFalse = 245
	end
}
script 198 mmsf1 {
	checkFlag
		flag = 0xF007
		jumpIfTrue = 199
		jumpIfFalse = continue
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherNameBuffered
		buffer = 1
		part = 0
	" "
	printBrotherNameBuffered
		buffer = 1
		part = 1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoMenu
	"""
	Wait. I formed
	a BrotherBand...
	with myself!?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	I'm not sure
	what just
	happened,but...
	"""
	keyWait
	clearMsg
	"""
	Well,they say you
	know yourself
	better than
	"""
	keyWait
	clearMsg
	"""
	anyone,right?
	This could be
	pretty useful.
	"""
	keyWait
	clearMsg
	"""
	I assume you
	don't need me
	to tell you
	"""
	keyWait
	clearMsg
	"""
	your own Link
	Ability,do you?
	"""
	keyWait
	clearMsg
	"""
	It seems like
	this Brother is
	a copy of your
	"""
	keyWait
	clearMsg
	"""
	current data.
	So if you want
	to update it,
	"""
	keyWait
	clearMsg
	"""
	come back and
	check the mirror
	again.
	"""
	keyWait
	flagSet
		flag = 0xF007
	end
}
script 199 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	printBrotherNameBuffered
		buffer = 1
		part = 0
	" "
	printBrotherNameBuffered
		buffer = 1
		part = 1
	"""
	 is
	now your Bro.!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoMenu
	"""
	...No matter how
	many times I
	see it happen,
	"""
	keyWait
	clearMsg
	"""
	I just can't
	get used to
	"""
	keyWait
	clearMsg
	"""
	seeing my own
	name pop up on
	the Transer.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	It seems like
	this Brother is
	a copy of your
	"""
	keyWait
	clearMsg
	"""
	current data.
	So if you want
	to update it,
	"""
	keyWait
	clearMsg
	"""
	come back and
	check the mirror
	again.
	"""
	keyWait
	end
}
script 245 mmsf1 {
	callReceiveMail
		flag = 0x1621
		markRead = false
	end
}