@archive mess_0339
@size 34

script 4 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 16
	mugshotAnimation
		animation = 1
	"...*ba-dump*"
	keyWait
	end
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Is everyone OK?"
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"I-I-I'm sorry!"
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	mugshotAnimation
		animation = 1
	"...*gulp*"
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Luna..."
	keyWait
	end
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 6
	"Um... "
	printPlayerName1
	"..."
	keyWait
	clearMsg
	"""
	Please be my
	Brother!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"HUH!?"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 6
	"""
	I know it might
	seem strange
	because I've
	"""
	keyWait
	clearMsg
	"""
	done nothing but
	pick on you
	until now,but
	"""
	keyWait
	clearMsg
	"""
	I've always
	really looked up
	to MegaMan.
	"""
	keyWait
	clearMsg
	"""
	I really want to
	be like MegaMan!
	
	"""
	keyWait
	clearMsg
	"""
	I'm really sorry
	for everything!
	"""
	keyWait
	clearMsg
	"""
	So please be
	Brothers with
	me!
	"""
	keyWait
	clearMsg
	"...Please?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	Um... sure.
	I'd be happy to
	be Brothers.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 6
	"Really!?"
	keyWait
	clearMsg
	"""
	I'm gonna learn
	how to be a good
	guy from you!
	"""
	keyWait
	end
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	A promise from
	one man to
	another...?
	"""
	keyWait
	clearMsg
	jump
		target = 28
	end
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	But how are we
	supposed to find
	them?
	"""
	keyWait
	clearMsg
	jump
		target = 30
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Get there? But
	they're in outer
	space.
	"""
	keyWait
	clearMsg
	"""
	How are we
	supposed to even
	get into space?
	"""
	keyWait
	clearMsg
	jump
		target = 32
	end
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Ah,good idea!"
	keyWait
	end
	end
}
