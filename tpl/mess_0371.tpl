@archive mess_0371
@size 16

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Dad..."
	keyWait
	clearMsg
	"""
	I don't think
	I'll ever see
	the Earth again.
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Dad!!
	Wait! Dad!!
	"""
	keyWait
	clearMsg
	"Dad..."
	keyWait
	end
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"It was a dream."
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	I saw my dad in
	my dream... He
	told me to not
	"""
	keyWait
	clearMsg
	"""
	give up... that
	I have strong
	bonds to the
	"""
	keyWait
	clearMsg
	"""
	Earth... and to
	believe in my
	Brothers...
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	What's my
	Transer doing?
	"""
	keyWait
	end
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"This light..."
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Aah!!"
	keyWait
	end
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	It's the
	BrotherBand...
	"""
	keyWait
	clearMsg
	"""
	They were
	looking for me!
	"""
	keyWait
	clearMsg
	jump
		target = 15
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Looks like they
	were really
	trying too.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	mugshotAnimation
		animation = 1
	"(Dad...)"
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Now I see why
	you valued the
	
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	bonds between
	people so much.)
	
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(No matter how
	far apart we
	are,
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	no one can erase
	the power of
	this bond...)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Dad,I think I
	can be strong
	and move on.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Because I'm not
	alone now.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(And I have you,
	wherever you
	are...)
	"""
	keyWait
	clearMsg
	mugshotAnimationReset
	"""
	Let's go home
	to everyone.
	"""
	keyWait
	end
	end
}
