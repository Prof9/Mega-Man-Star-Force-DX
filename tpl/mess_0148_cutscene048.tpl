@archive mess_0148
@size 17

script 1 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Over there is
	the Science
	Museum.
	"""
	keyWait
	clearMsg
	"""
	It's where
	various exhibits
	are displayed.
	"""
	keyWait
	end
	end
}
