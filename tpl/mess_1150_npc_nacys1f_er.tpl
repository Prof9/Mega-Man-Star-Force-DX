@archive mess_1150
@size 256

script 10 mmsf1 {
	checkFlag
		flag = 0xF005
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = MegaMan
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
	keyWait
	clearMsg
	flagSet
		flag = 0xF005
	jump
		target = 11
}
script 11 mmsf1 {
	callCheckBoktaiBrotherType
		type = 0
		jumpIfRegistered = 13
	msgOpen
	mugshotHide
	"""
	A voice echoes
	from beyond the
	wavehole...
	"""
	keyWait
	clearMsg
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
	I'm Aaron!
	"""
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
	mugshotShow
		mugshot = MegaMan
	"""
	Should I?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 68
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Of course!\n"
	positionOptionFromCenter
		width = 68
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
		jump1 = 12
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 12 mmsf1 {
	flagSet
		flag = 167
	flagSet
		flag = 0xF004
	end
}
script 13 mmsf1 {
	msgOpen
	"""
	A voice echoes
	from beyond the
	wavehole...
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 5
	"."
	wait
		frames = 5
	"."
	keyWait
	clearMsg
	"""
	But,it's too
	faint to make
	out the words.
	"""
	keyWait
	clearMsg
	end
}
