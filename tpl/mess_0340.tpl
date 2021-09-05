@archive mess_0340
@size 24

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Um,is there any
	way we can
	transmit some-
	"""
	keyWait
	clearMsg
	"""
	thing from here
	up to the space
	station?
	"""
	keyWait
	clearMsg
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Oh..."
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"What is it?"
	keyWait
	clearMsg
	jump
		target = 6
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Really!?"
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"...*gulp*"
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Where is that
	section right
	now!?
	"""
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"What...?"
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Mr.Boreal,
	please tell me
	
	"""
	keyWait
	clearMsg
	"""
	about your old
	boss!
	
	"""
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	I... I want to
	do something
	to help...
	"""
	keyWait
	clearMsg
	jump
		target = 19
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"An old man,huh?"
	keyWait
	clearMsg
	"""
	Thanks,
	Mr.Boreal!
	"""
	keyWait
	clearMsg
	jump
		target = 21
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...I understand."
	keyWait
	end
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Geo
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Omega-Xis
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Geo
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 60
	msgOpen
	mugshotHide
	soundDisableTextSFX
	soundPlay
		sound = 140
	callTranserNotification
	"*BEEP,BEEP,BEEP*"
	wait
		frames = 46
	"\n"
	soundPlay
		sound = 140
	callTranserNotification
	"*BEEP,BEEP,BEEP*"
	wait
		frames = 46
	soundEnableTextSFX
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Geo
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	Leo Kingdom
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Geo
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	OmegaXis
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Geo
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Omega-Xis
	"""
	keyWait
	clearMsg
	end
}
