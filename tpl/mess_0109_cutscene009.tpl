@archive mess_0109
@size 11

script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Save your
	whining for
	afterwards!!
	"""
	keyWait
	clearMsg
	"""
	Now listen up.
	I can give you
	a quick rundown,
	"""
	keyWait
	clearMsg
	"""
	or you can try
	it for yourself.
	What'll it be?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Explain it\n"
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  I'm good"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 10
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	OK,then just do
	exactly what I
	tell you & fight!
	"""
	keyWait
	clearMsg
	"""
	Let's go!!
	"""
	keyWait
	clearMsg
	end
}
script 10 mmsf1 {
	flagSet
		flag = 0xF034
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Learn on the fly,
	huh? Maybe you're
	not so bad,kid.
	"""
	keyWait
	clearMsg
	"""
	Let's go!!
	"""
	keyWait
	clearMsg
	end
}