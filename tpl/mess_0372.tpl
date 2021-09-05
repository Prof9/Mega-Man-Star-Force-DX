@archive mess_0372
@size 40

script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Okay!!"
	keyWait
	end
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	Thank you,
	everyone...
	"""
	keyWait
	clearMsg
	"""
	If you guys...
	weren't there
	for me *sniffle*
	"""
	keyWait
	clearMsg
	"""
	I... I wouldn't
	be here... right
	now... *sniffle*
	"""
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"...OK!"
	keyWait
	end
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Mr.Boreal,Mr.
	Copper,thank
	you very much!
	"""
	keyWait
	clearMsg
	jump
		target = 24
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"OK,I'm coming!!"
	keyWait
	end
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Well,bye,mom!"
	keyWait
	clearMsg
	jump
		target = 28
	end
}
script 38 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Where did you
	wander off to,
	Mega!?
	"""
	keyWait
	clearMsg
	jump
		target = 39
	end
}