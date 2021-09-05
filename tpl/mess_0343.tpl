@archive mess_0343
@size 30

script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Pat!"
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
	"Pat!!"
	keyWait
	end
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	I'm OK.
	But Pat...
	We should hurry.
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	We've got to
	hurry!
	"""
	keyWait
	clearMsg
	"""
	If we don't,it
	might be too
	late for us!
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
	"What!?"
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
	"But!!"
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
	"No matter
	how small of a
	chance,as long
	"""
	keyWait
	clearMsg
	"""
	as there is
	hope,then we
	can't give up."
	"""
	keyWait
	clearMsg
	"""
	My dad used to
	say that...
	
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	I'm not who I
	was before.
	
	"""
	keyWait
	clearMsg
	"""
	I'm not afraid
	of losing people
	anymore.
	"""
	keyWait
	clearMsg
	"""
	And I fight so
	I can protect
	those I love.
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Mr.Boreal..."
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
	"Really!?"
	keyWait
	clearMsg
	jump
		target = 23
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"A promise? OK..."
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"I will! Promise!"
	keyWait
	clearMsg
	jump
		target = 27
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"*nod*"
	keyWait
	end
	end
}
