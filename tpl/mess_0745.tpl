@archive mess_0745
@size 256

script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = TaurusFire
	"""
	Mmmrrrrgh...
	Who are you...?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	M-Mega... Y-You
	didn't tell me
	"""
	keyWait
	clearMsg
	"""
	there'd be some-
	one THIS huge!!
	"""
	mugshotShow
		mugshot = OmegaXis
	keyWait
	clearMsg
	"""
	That's Taurus
	Fire! He's an
	FM-ian with a
	"""
	keyWait
	clearMsg
	"""
	powerful tackle
	who controls
	fierce flames!
	"""
	mugshotShow
		mugshot = TaurusFire
	keyWait
	clearMsg
	"""
	That voice...
	Is that you,
	Omega-Xis!?
	"""
	keyWait
	clearMsg
	"""
	How lucky for me
	that you'd come
	right to me!!
	"""
	keyWait
	clearMsg
	"""
	I'm going to mow
	you down and
	"""
	keyWait
	clearMsg
	"""
	take back the
	Andromeda Key!!
	"""
	keyWait
	clearMsg
	"""
	MMMRRRRGH!!
	"""
	mugshotShow
		mugshot = OmegaXis
	"""
	...Here he
	comes! Don't
	get careless!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Wave Battle!
	Ride On!!
	"""
	keyWait
	flagSet
		flag = 598
	end
}