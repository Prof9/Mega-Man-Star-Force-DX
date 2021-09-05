@archive mess_1260
@size 3

script 0 mmsf1 {
	msgOpen
	mugshotHide
	"""
	Leo Kingdom
	"""
	keyWait
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	Leo Kingdom
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
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
	mugshotHide
	msgClose
	wait
		frames = 60
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Omega-Xis
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	Leo Kingdom
	"""
	keyWait
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Omega-Xis
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	end
}
