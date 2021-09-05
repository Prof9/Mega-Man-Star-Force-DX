@archive mess_0281
@size 29

script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Um..."
	keyWait
	clearMsg
	"Well,my dad..."
	keyWait
	clearMsg
	"""
	When he dis-
	appeared after
	the accident...
	"""
	keyWait
	clearMsg
	"""
	The shock from
	that was too
	much for me...
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
	"No,it's alright."
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
	"Huh? It is?"
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
	"""
	P-Pat... You
	don't have a
	mom or a dad?
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
