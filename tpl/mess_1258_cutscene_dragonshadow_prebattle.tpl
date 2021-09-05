@archive mess_1258
@size 4

script 0 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 60
	msgOpen
	mugshotHide
	"""
	Dragon Sky
	"""
	keyWait
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSkyShadow
	"""
	Dragon Sky
	"""
	keyWait
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSkyShadow
	"""
	Dragon Sky
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
script 3 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	end
}
