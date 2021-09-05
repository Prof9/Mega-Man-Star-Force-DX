@archive mess_0238
@size 29

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"E-Excuse me..."
	keyWait
	end
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Grk!!"
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Y-Yes,sir."
	keyWait
	clearMsg
	"""
	And what can I
	help you with?
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Y-Yes..."
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Um,I have no
	idea what you're
	talking about...
	"""
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	But that doesn't
	mean I know
	anything...
	"""
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	mugshotAnimation
		animation = 1
	"""
	(H-How does he
	know that!? This
	is bad...)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Just how much
	does this old
	man know!?)
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	mugshotAnimation
		animation = 1
	"""
	(Somehow,I think
	it's already too
	late for me...)
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Aha ha ha..."
	keyWait
	clearMsg
	jump
		target = 22
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = BobCopper
	"""
	Mr.Shepar,
	I must insist...
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Wait,it'd be a
	bad idea to get
	on the teacher's
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	bad side. Better
	play it safe...)
	
	"""
	keyWait
	clearMsg
	"""
	...OK,I suppose
	that's enough
	for today.
	"""
	keyWait
	end
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...Um,bye!!"
	keyWait
	end
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	And just when I
	had made some
	friends too.
	"""
	keyWait
	clearMsg
	"""
	Talk about
	things I could
	do without...
	"""
	keyWait
	clearMsg
	"""
	Well,at least we
	can go home for
	today...
	"""
	keyWait
	end
	end
}
