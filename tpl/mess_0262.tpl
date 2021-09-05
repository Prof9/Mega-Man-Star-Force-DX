@archive mess_0262
@size 42

script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Looks like
	everything's
	gonna be OK,
	"""
	keyWait
	clearMsg
	"""
	so if you all
	will excuse
	me...
	"""
	keyWait
	end
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Y-Yes,madam."
	keyWait
	end
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	S-So how are
	your mom and
	dad?
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
	"Yeah."
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Got it!"
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
	Wh-What!? I'm
	not thinking
	anything!!
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
	"Become a what?"
	keyWait
	clearMsg
	jump
		target = 24
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"I-I understand."
	keyWait
	clearMsg
	"""
	You know my
	secret too,
	after all...
	"""
	keyWait
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Going out??"
	keyWait
	clearMsg
	"""
	Ah,no! We're
	just friends,
	that's all!
	"""
	keyWait
	clearMsg
	jump
		target = 29
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Wh-What!?"
	keyWait
	clearMsg
	"""
	And anyway,
	why did you come
	here,Luna!?
	"""
	keyWait
	clearMsg
	jump
		target = 31
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"I know already!"
	keyWait
	clearMsg
	jump
		target = 33
	end
}
script 35 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Sonia!"
	keyWait
	clearMsg
	"""
	Are you OK?
	What happened to
	the poison!?
	"""
	keyWait
	jump
		target = 36
	end
}
script 37 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"S-Sorry!!"
	keyWait
	clearMsg
	jump
		target = 38
	end
}
script 39 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Well,I didn't
	forget about
	you. I just...
	"""
	keyWait
	clearMsg
	"""
	I'm sorry! I'm
	really sorry!!
	"""
	keyWait
	clearMsg
	"""
	Please forgive
	me!!
	"""
	keyWait
	clearMsg
	jump
		target = 40
	end
}
script 41 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Whaaaa...?"
	keyWait
	end
	end
}
