@archive mess_1261
@size 4

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LeoKingdomShadow
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
	msgClose
	mugshotHide
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
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Omega-Xis
	"""
	keyWait
	end
}
