@archive mess_0100
@size 256

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Luna
	"""
	OK,looks like
	we're all set.
	"""
	keyWait
	clearMsg
	"""
	Now,we're going
	to use this
	program,and
	"""
	keyWait
	clearMsg
	"""
	do your
	homework!
	
	"""
	keyWait
	clearMsg
	"""
	So pay close
	attention,OK?
	"""
	keyWait
	clearMsg
	"""
	This is the
	Brother Screen
	on your Transer.
	"""
	keyWait
	clearMsg
	"""
	It shows you
	info about your
	Brothers.
	"""
	keyWait
	clearMsg
	"""
	You can access
	this screen by
	selecting
	"""
	keyWait
	clearMsg
	"""
	"BROTHR" on
	the Menu Screen.
	
	"""
	keyWait
	clearMsg
	wait
		frames = 16
	"..."
	wait
		frames = 16
	"""
	Ah!
	You don't have a
	single Brother!
	"""
	keyWait
	clearMsg
	"""
	I can't explain
	anything like
	this!
	"""
	keyWait
	clearMsg
	"""
	Alright,I'll
	tell you what.
	"""
	keyWait
	clearMsg
	"""
	Just for now,
	I'll be your
	Brother.
	"""
	keyWait
	clearMsg
	"""
	You'd better
	be thankful!
	
	"""
	keyWait
	clearMsg
	flagSet
		flag = 168
	soundPlay
		sound = 579
	"Here we go!"
	waitFlag
		flag = 169
	flagSet
		flag = 170
	keyWait
	clearMsg
	"""
	Now,you and I
	are Brothers!
	"""
	keyWait
	clearMsg
	"""
	...Actually,do
	you need me to
	
	"""
	keyWait
	clearMsg
	"""
	explain Brother-
	Band to you?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 11
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No "
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 11
		jump2 = 4
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
	mugshotShow
		mugshot = Luna
	"""
	BrotherBand is
	a system that
	"""
	keyWait
	clearMsg
	"""
	connects friends
	together through
	EM waves.
	"""
	keyWait
	clearMsg
	"""
	Once you become
	Brothers,you can
	send mail and
	"""
	keyWait
	clearMsg
	"""
	trade data no
	matter where
	you are!
	"""
	keyWait
	clearMsg
	"""
	You can also see
	each other's
	Personal Page!
	"""
	keyWait
	clearMsg
	"...Huh?"
	wait
		frames = 16
	"""
	
	What's a
	Personal Page?
	"""
	keyWait
	clearMsg
	"""
	Why,your profile
	and Battle Cards
	are shown there!
	"""
	keyWait
	clearMsg
	"""
	If you're going
	to have any
	Brothers,
	"""
	keyWait
	clearMsg
	"""
	you're going to
	need a Personal
	Page!
	"""
	keyWait
	clearMsg
	"""
	I know! Let's
	make you one!
	
	"""
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Luna
	"""
	You do?
	
	"""
	keyWait
	clearMsg
	"""
	I thought every-
	one knew about
	BrotherBands!
	"""
	keyWait
	clearMsg
	"""
	Well,whatever.
	"""
	keyWait
	clearMsg
	jump
		target = 2
}