@archive mess_0240
@size 9

script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	We can't get
	outside with
	that guy there.
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(If only I could
	find a safe
	place to stash
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	Luna,I could
	pulse in...)
	"""
	keyWait
	clearMsg
	"""
	Well,we can't go
	forward,so we've
	gotta turn back.
	"""
	keyWait
	clearMsg
	jump
		target = 4
	end
}
