@archive mess_0989
@size 256

script 10 mmsf1 {
	checkFlag
		flag = 0xF007
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = MrHertz
	"""
	*BEEP BEEP*
	"""
	keyWait
	clearMsg
	"""
	THEY SAY THERE'S
	A MAGIC MIRROR
	SOMEWHERE,
	"""
	keyWait
	clearMsg
	"""
	THAT GRANTS YOU
	YOUR DEEPEST
	WISHES
	"""
	keyWait
	clearMsg
	"""
	WHEN YOU PEER
	INTO IT AND LAY
	YOUR HEART BARE.
	"""
	keyWait
	clearMsg
	"""
	...WILL IT WORK
	FOR A MR.HERTZ
	LIKE ME,TOO?
	"""
	keyWait
	clearMsg
	"""
	*BEEP BEEP*
	"""
	keyWait
	clearMsg
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertz
	"""
	*BEEP BEEP*
	"""
	keyWait
	clearMsg
	"""
	I NEVER COULD
	HAVE IMAGINED
	THE MAGIC MIRROR
	"""
	keyWait
	clearMsg
	"""
	WAS RIGHT IN
	FRONT OF ME
	THIS WHOLE TIME!
	"""
	keyWait
	clearMsg
	"""
	MAYBE I JUST
	WASN'T SAYING
	THE RIGHT WORDS.
	"""
	keyWait
	clearMsg
	"""
	MIRROR MIRROR
	ON THE WALL,
	"""
	keyWait
	clearMsg
	"""
	WHO IS THE
	BRAWNIEST HERTZ
	OF THEM ALL?
	"""
	keyWait
	clearMsg
	"""
	...*BEEP BEEP*
	"""
	keyWait
	clearMsg
	end
}
script 20 mmsf1 {
	checkItem
		item = 79
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 22
	msgOpen
	mugshotHide
	"""
	It's a mirror.
	You can see your
	own reflection.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"."
	wait
		frames = 5
	"."
	wait
		frames = 5
	"."
	wait
		frames = 5
	"Huh?"
	keyWait
	clearMsg
	mugshotHide
	"""
	The "
	"""
	printItem
		item = 79
	"""
	"
	is responding
	to the mirror!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Some kind of data
	is being sent to
	my Transer!
	"""
	keyWait
	clearMsg
	"""
	Should I accept
	the transmission?
	
	"""
	positionOptionFromCenter
		width = 63
	textSpeed
		delay = 0
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
		jump1 = 21
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 21 mmsf1 {
	flagSet
		flag = 0xF006
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotHide
	"""
	It's a mirror.
	You can see your
	own reflection.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Lookin' good,
	kid!
	"""
	keyWait
	clearMsg
	end
}
