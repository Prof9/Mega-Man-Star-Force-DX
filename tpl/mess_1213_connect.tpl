@archive mess_1213
@size 256

script 0 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	flagClear
		flag = 3338
	flagClear
		flag = 3339
	textSpeed
		delay = 0
	"""
	Waiting for
	Client to join.
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
	Client wants
	to connect...
	
	"""
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Connect  "
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
	msgOpenQuick
	callMugshotShowGeoMenu
	flagClear
		flag = 3338
	flagClear
		flag = 3339
	textSpeed
		delay = 0
	"""
	Waiting for
	Client #
	"""
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"\nto join."
	waitHold
	end
}
script 3 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Client #"
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"\nwants to connect\n"
	positionOptionFromCenter
		width = 14
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Connect  "
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
script 4 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Client cancelled
	connection!
	"""
	keyWait
	end
}
script 10 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looking for
	Host...
	"""
	waitHold
	end
}
script 11 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Hold on...
	Requesting
	connection!
	"""
	waitHold
	end
}
script 12 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looking for Host
	#
	"""
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"."
	waitHold
	end
}
script 13 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Now requesting
	connection w/
	Host #
	"""
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"."
	waitHold
	end
}
script 14 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	No good...
	Host refused
	the connection.
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	Oh well... Going
	back to the
	connect screen.
	"""
	keyWait
	end
}
script 15 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	They're already
	a Bro.
	"""
	keyWait
	end
}
script 16 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Already
	received.
	"""
	keyWait
	end
}
script 17 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Get Giga Class
	card Andromeda?
	
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
script 18 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Disconnecting..."
	keyWait
	end
}
script 19 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Disconnecting..."
	keyWait
	end
}
script 20 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Communication
	error...
	"""
	keyWait
	end
}
script 30 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	What the!?
	What's this wave
	hole doing here?
	"""
	keyWait
	clearMsg
	"!"
	wait
		frames = 10
	keyWait
	clearMsg
	"""
	It's to another
	dimension!
	
	"""
	waitHold
	end
}
script 31 mmsf1 {
	msgOpenQuick
	"."
	wait
		frames = 5
	"."
	wait
		frames = 5
	"."
	keyWait
	clearMsg
	"."
	wait
		frames = 3
	"."
	wait
		frames = 3
	"."
	wait
		frames = 3
	"H"
	wait
		frames = 3
	"e"
	wait
		frames = 3
	"l"
	wait
		frames = 3
	"l"
	wait
		frames = 3
	"o!"
	keyWait
	clearMsg
	"""
	OK! I'm
	connected!
	"""
	keyWait
	clearMsg
	"""
	Hello!
	I'm 
	"""
	printNameBuffer1
	"\n"
	printNameBuffer2
	"!"
	keyWait
	clearMsg
	"""
	I crossed over
	from another
	dimension to
	"""
	keyWait
	clearMsg
	"""
	get here!
	Let's be Bros.!
	
	"""
	keyWait
	clearMsg
	callMugshotShowGeoMenu
	"Should I...?\n"
	textSpeed
		delay = 0
	" "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Of course!\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  ...No thanks."
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
	jump
		target = 32
}
script 32 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Waiting for
	a response...
	"""
	waitHold
	end
}
script 33 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 579
	"""
	Yes! Now
	we're Brothers!
	"""
	keyWait
	waitHold
}
script 34 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	I'm getting a
	transmission
	from a Brother.
	"""
	waitHold
	end
}
script 35 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	OK,transmission
	complete! Good-
	bye for now!
	"""
	keyWait
	waitHold
}
script 36 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Sorry,we didn't
	become Brothers.
	
	"""
	keyWait
	waitHold
}
script 38 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	optionButtonWide16
		up = 1
		down = 2
		left = 2
		right = 2
		string = "____メールのかくにん____"
	optionButtonWide16
		up = 0
		down = 2
		left = 1
		right = 1
		string = "      Quit      "
	" "
	optionButtonWide16
		up = 1
		down = 2
		left = 2
		right = 2
		string = "    Checkmail   "
	" "
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	I've got unsent
	mail. I guess
	I'll send it.
	"""
	selectButtonColumn3
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
		jump4 = continue
	waitHold
}
script 39 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	OK! Our data
	has finished
	updating!
	"""
	keyWait
	clearMsg
	waitHold
}
script 40 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 3
	callMugshotShowGeoMenu
	"""
	Oh...
	This wave...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"""
	I was once
	Brothers with
	this person...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"""
	I wonder if
	they still think
	we're Bros?
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"""
	Hold on...
	...They're auto-
	deleting me from
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"their Transer..."
	waitHold
}
script 41 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Oops...
	There's
	something wrong.
	"""
	keyWait
	waitHold
}
script 42 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 3
	callMugshotShowGeoMenu
	"""
	They're breaking
	up...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"Aww..."
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"It seems "
	printNameBuffer1
	"\n"
	printNameBuffer2
	"""
	 cut our
	BrotherBand...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"""
	...Transer is
	auto-deleting
	
	"""
	printNameBuffer1
	printNameBuffer2
	"..."
	keyWait
	waitHold
}
script 45 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Cancel becoming
	Brothers?
	
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
	waitHold
}
script 46 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	OK! Wave
	update complete!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	I deleted the
	Friend Codes
	that were
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 0
	"""
	 on standby who
	have already
	become Bros.
	"""
	keyWait
	clearMsg
	waitHold
}
script 70 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Trade and battle
	w/people nearby
	as a Host.
	"""
	waitHold
	end
}
script 71 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Trade and battle
	w/people nearby
	as a Client.
	"""
	waitHold
	end
}
script 72 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Enter a 2-digit
	number to find
	specific people.
	"""
	waitHold
	end
}
script 73 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Register
	Brothers to your
	Friend Roster.
	"""
	waitHold
	end
}
script 74 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Enter Nintendo
	Wi-Fi Connection
	setup.
	"""
	waitHold
	end
}
script 75 mmsf1 {
	msgOpenQuick
	msgClose
	waitHold
	end
}
script 79 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Enter Nintendo
	Wi-Fi Connection
	setup.
	"""
	waitHold
	end
}
script 80 mmsf1 {
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Wanna save
	your progress?
	
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
script 81 mmsf1 {
	msgOpen
	checkSaveAccess
		jumpIfError = 169
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Is it OK to
	overwrite?
	
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
script 87 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	checkSaveExists
		jumpIfExists = 86
		jumpIfNotExists = continue
	mugshotAnimation
		animation = 0
	controlLock
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	"""
	checkSaveInit
		jumpIfFailed = 85
	checkSaveInitFinished
		jumpIfSuccessful = 86
	end
}
script 90 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	One time
	showdown!
	"""
	waitHold
}
script 91 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Best 2 out of 3,
	wins!
	"""
	waitHold
}
script 92 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	1 battle show
	down! Lose...
	and lose a card!
	"""
	waitHold
}
script 93 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Best 2 out of 3,
	wins! Lose...
	and lose a card!
	"""
	waitHold
}
script 94 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"Got pwned huh...\n"
	waitHold
}
script 95 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Set to ON to ask
	opponent to be
	Bro after match.
	"""
	waitHold
}
script 96 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can trade
	Battle Cards
	with friends.
	"""
	waitHold
}
script 97 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Ending
	Wireless
	Connection...
	"""
	keyWait
	end
}
script 98 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Practice,
	1 round match!
	
	"""
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Start  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Cancel"
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
script 99 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Practice,3
	round match!
	
	"""
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Start  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Cancel"
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
script 100 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Real match!
	1 round...
	
	"""
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Start  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Cancel"
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
script 101 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Real match!
	3 rounds...
	
	"""
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Start  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Cancel"
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
script 104 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Start trade?
	
	
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
	end
}
script 105 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	End Wireless
	Connection?
	
	"""
	positionOptionFromCenter
		width = 15
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Not now!"
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Yes  "
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
script 106 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Waiting for
	response from
	friend...
	"""
	waitHold
}
script 107 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Cancelled!"
	keyWait
	end
}
script 108 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Oops,looks like
	you chose
	different modes.
	"""
	keyWait
	end
}
script 109 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Executing the
	selected mode...
	"""
	waitHold
}
script 110 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Battle a
	friend.
	"""
	waitHold
}
script 111 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Trade Battle
	Cards.
	"""
	waitHold
}
script 112 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	End Wireless
	Connection?
	
	"""
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
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Ending
	Connection!
	"""
	keyWait
	end
}
script 114 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't choose
	to have a Real
	match cause your
	"""
	keyWait
	clearMsg
	"""
	friend only has
	Giga class cards
	in their box.
	"""
	keyWait
	end
}
script 115 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You can't choose
	to have a Real
	match cause you
	"""
	keyWait
	clearMsg
	"""
	only have Giga
	class cards in
	your box.
	"""
	keyWait
	end
}
script 120 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Upload data to
	the server?
	
	"""
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"_Yes__"
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"_No"
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
	waitHold
}
script 121 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Uploading data
	to the server...
	
	"""
	waitHold
}
script 122 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"Data uploaded \nto the server."
	keyWait
	end
}
script 130 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	" "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No  S"
	"tart!?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 131 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	" "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No  S"
	"tart!?"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 132 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"Just a taste...\n"
	waitHold
}
script 133 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"Found\n"
	printNameBuffer1
	" "
	printNameBuffer2
	"!"
	keyWait
	clearMsg
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Yes  "
	" "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   No  B"
	"attle?\n"
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	end
}
script 134 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"Connecting..."
	waitHold
}
script 135 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"No good!\n"
	end
}
script 136 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	optionButtonSmall8
		up = 0
		down = 0
		left = 1
		right = 1
		string = "   Searc"
	"h  "
	optionButtonSmall8
		up = 1
		down = 1
		left = 0
		right = 0
		string = "   Quit "
	"""
	 Look for
	opponent?
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
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You're already
	Legend Master
	Shin's Bro.!
	"""
	keyWait
	end
}
script 141 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You've already
	received the
	Andromeda card!
	"""
	keyWait
	end
}
script 142 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Rcve Giga class
	card Andromeda?
	
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
script 143 mmsf1 {
	msgOpenQuick
	mugshotHide
	"""
	3 missl atk,
	laser down
	center row
	"""
	keyWait
	clearMsg
	itemGiveCard
		card = 247
		color = red
		amount = 1
	printPlayerName1
	"""
	
	has gotten the
	Andromeda card!!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoMenu
	"""
	Yes! Receive
	successful!
	"""
	keyWait
	clearMsg
	"""
	Alright,
	disconnecting...
	"""
	keyWait
	end
}
script 144 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Receive
	cancelled.
	Disconnecting...
	"""
	keyWait
	end
}
script 150 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Connect to
	Host?
	
	"""
	positionOptionFromCenter
		width = 15
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
script 160 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 2
	msgOpen
	textSpeed
		delay = 0
	checkSaveAccess
		jumpIfError = 169
	callMugshotShowGeoMenu
	jump
		target = 161
}
script 161 mmsf1 {
	flagClear
		flag = 3370
	checkSaveAccess
		jumpIfError = 169
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 167
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	jump
		target = 166
}
script 163 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 138
	"Save complete!"
	waitSkip
		frames = 120
	end
}
script 165 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Saved failed...
	Try again?
	
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
		jump1 = 166
		jump2 = 164
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 167 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	mugshotAnimation
		animation = 0
	"""
	Deleting backup
	data...
	
	"""
	checkSaveInit
		jumpIfFailed = 165
	checkSaveInitFinished
		jumpIfSuccessful = 166
	end
}
script 168 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 3
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	jump
		target = 161
	end
}
script 172 mmsf1 {
	flagClear
		flag = 3370
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Gotta save to
	enter this menu!
	
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
	" Save  "
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
		jump1 = 179
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 179 mmsf1 {
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 2
	checkSaveAccess
		jumpIfError = 171
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 3
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Is it OK to
	overwrite?
	
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
		jump1 = 177
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
