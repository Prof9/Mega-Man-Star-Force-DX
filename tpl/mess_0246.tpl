@archive mess_0246
@size 32

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Phew,I'm beat."
	keyWait
	end
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Oh,yeah. Thanks
	for the save
	today,Sonia.
	"""
	keyWait
	clearMsg
	"""
	If you hadn't
	shown up...
	"""
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Sonia..."
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	OK,got it.
	I'll see you
	later,then.
	"""
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
	"I won't!!"
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
	"Yeah."
	keyWait
	end
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Did I disturb
	you?
	"""
	keyWait
	clearMsg
	"""
	Are you OK?
	Are you hurt
	anywhere?
	"""
	keyWait
	clearMsg
	"""
	Ah,you probably
	shouldn't try to
	sit up yet.
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
		mugshot = Geo
	"""
	Um,well,you see,
	please don't get
	angry,but...
	"""
	keyWait
	clearMsg
	"""
	well,you were
	unconscious,and
	I had to take
	"""
	keyWait
	clearMsg
	"""
	you home... so I
	kinda looked in
	your Transer...
	"""
	keyWait
	jump
		target = 16
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	No,please! I
	only looked up
	your address!!
	"""
	keyWait
	clearMsg
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	I didn't see him
	or anything,but
	"""
	keyWait
	clearMsg
	"""
	I think he's
	probably OK.
	"""
	keyWait
	clearMsg
	"""
	I mean,we're OK,
	so he must be
	too,right?
	"""
	keyWait
	clearMsg
	"Aha ha ha..."
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Didn't mean to
	offend you...
	"""
	keyWait
	clearMsg
	"""
	I guess I should
	get home...
	"""
	keyWait
	clearMsg
	soundFadeOutBGM
		length = 30
	"""
	Is your mom
	gonna be home
	soon?
	"""
	keyWait
	clearMsg
	jump
		target = 22
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Oh..."
	keyWait
	clearMsg
	"""
	Then maybe I
	should wait
	until someone...
	"""
	keyWait
	clearMsg
	jump
		target = 24
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"...O-OK..."
	keyWait
	clearMsg
	"""
	Well,take it
	easy,OK?
	"""
	keyWait
	end
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...No prob."
	keyWait
	clearMsg
	jump
		target = 29
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Yeah,well,see
	you.
	"""
	keyWait
	end
	end
}
