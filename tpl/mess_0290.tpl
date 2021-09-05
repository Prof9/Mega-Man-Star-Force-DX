@archive mess_0290
@size 24

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Yeah,me too."
	keyWait
	clearMsg
	"Well,see you..."
	keyWait
	end
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"......"
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Well,I've been
	thinking...
	
	"""
	keyWait
	clearMsg
	"""
	ever since you
	told me your
	story...
	"""
	keyWait
	clearMsg
	"Uh... Um..."
	keyWait
	clearMsg
	"Will..."
	keyWait
	clearMsg
	"""
	Will you become
	Brothers with
	me?
	"""
	soundPlayBGM
		music = 25
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
	"Yeah."
	keyWait
	clearMsg
	"""
	It's like you
	said.
	
	"""
	keyWait
	clearMsg
	"""
	Our situations
	are kinda alike.
	
	"""
	keyWait
	clearMsg
	"""
	We understand
	each other's
	pain,I think...
	"""
	keyWait
	clearMsg
	"So..."
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	We don't have
	to...
	"""
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
	"Then you will?"
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
	"However?"
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
	"Something else?"
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"No way!"
	keyWait
	clearMsg
	"""
	No matter what,
	I won't hate
	you!
	"""
	keyWait
	clearMsg
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Pat..."
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	Yeah,don't worry
	about it. Take
	your time!
	"""
	keyWait
	clearMsg
	jump
		target = 22
	end
}
