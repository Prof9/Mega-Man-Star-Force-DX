@archive mess_1259
@size 5

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSkyShadow
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
script 3 mmsf1 {
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
	clearMsg
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
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 1
	"""
	Mega Man
	"""
	keyWait
	end
}
