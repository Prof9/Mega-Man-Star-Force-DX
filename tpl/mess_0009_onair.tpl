@archive mess_0009
@size 47

script 0 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	initialization
	failed.
	"""
	keyWait
	end
}
script 1 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	scan failed.
	"""
	keyWait
	end
}
script 2 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	channel search
	failed.
	"""
	keyWait
	end
}
script 3 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like the
	connection
	failed.
	"""
	keyWait
	end
}
script 4 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looks like we
	couldn't connect
	to the host.
	"""
	keyWait
	end
}
script 5 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Communication
	Error.
	"""
	keyWait
	end
}
script 6 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Connect to
	friends and
	go On Air!
	"""
	waitHold
	end
}
script 7 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Close the
	connection with
	your friends.
	"""
	waitHold
	end
}
script 8 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Update your
	Brothers' data!
	"""
	waitHold
	end
}
script 9 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Host nearby
	friends and go
	On Air!
	"""
	waitHold
	end
}
script 10 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Connect with a
	friend nearby
	and go On Air!
	"""
	waitHold
	end
}
script 11 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Enter a 2-digit
	number to find
	specific people.
	"""
	waitHold
	end
}
script 12 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Connect to
	Nintendo Wi-Fi
	Connection.
	"""
	waitHold
	end
}
script 13 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Enter Nintendo
	Wi-Fi Connection
	setup.
	"""
	waitHold
	end
}
script 14 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Waiting for
	Client to join.
	"""
	waitHold
	end
}
script 15 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	I'm looking for
	a Host now.
	"""
	waitHold
	end
}
script 16 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Which Host are
	you going to
	connect to?
	"""
	waitHold
	end
}
script 17 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Wanna go On Air
	with a friend?
	
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
	clearMsg
	end
}
script 18 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Requesting to go
	On Air with
	Host. Hold on...
	"""
	waitHold
	end
}
script 19 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Stop accepting
	Clients?
	
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
script 20 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	We're not
	connected to
	any Clients.
	"""
	keyWait
	waitHold
	end
}
script 21 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Connected!
	Going On Air for
	data exchange.
	"""
	waitFlag
		flag = 3344
	keyWait
	flagSet
		flag = 3345
	waitFlag
		flag = 3346
	end
}
script 25 mmsf1 {
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
	You'll lose your
	Bros.' powers.
	Discon. anyway?
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
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Waiting for
	Client #
	"""
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"\nto join..."
	waitHold
	end
}
script 27 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Looking for
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
script 28 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	Requesting
	Host #
	"""
	printBuffer
		buffer = 0
		minLength = 2
		padMode = leftPadZeroes
	"""
	.
	Wait a sec,OK?
	"""
	waitHold
	end
}
script 30 mmsf1 {
	callAllocSaveBufferMenu
	callSaveCompress
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 6
	checkSaveAccess
		jumpIfError = 39
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	You must save to
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
	" Exit"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 31
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 31 mmsf1 {
	flagClear
		flag = 3370
	checkSaveAccess
		jumpIfError = 39
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 37
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
		jump1 = 36
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 33 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	soundPlay
		sound = 138
	"Save complete."
	waitSkip
		frames = 120
	flagSet
		flag = 3382
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 34 mmsf1 {
	flagClear
		flag = 3370
	textSpeed
		delay = 0
	"Save failed..."
	waitSkip
		frames = 120
	callAbortSaveCompress
	callFreeSaveBufferMenu
	end
}
script 35 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	"""
	The save failed.
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
		jump1 = 36
		jump2 = 34
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 36 mmsf1 {
	flagSet
		flag = 3370
	checkSaveAccess
		jumpIfError = 39
	checkSaveStartOW
		jumpIfStarted = 32
	end
}
script 37 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	callMugshotShowGeoMenu
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	
	"""
	checkSaveInit
		jumpIfFailed = 35
	checkSaveInitFinished
		jumpIfSuccessful = 36
	end
}
script 38 mmsf1 {
	callAllocSaveBufferMenu
	callSaveCompress
	flagClear
		flag = 3370
	callInitSaveSpinner
		vramSettings = 6
	msgOpen
	textSpeed
		delay = 0
	callMugshotShowGeoMenu
	jump
		target = 31
	end
}
script 46 mmsf1 {
	msgOpenQuick
	msgClose
	waitHold
	end
}