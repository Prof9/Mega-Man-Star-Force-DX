@archive mess_1265
@size 10

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Piece of cake!
	"""
	keyWait
	clearMsg
	"""
	Hey,he just
	dropped a bunch
	of data.
	"""
	keyWait
	clearMsg
	"""
	That thing we're
	looking for must
	be here somewhere.
	"""
	keyWait
	clearMsg
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Whoa. That guy
	had a ton of
	data on him.
	"""
	keyWait
	clearMsg
	"""
	Let's see...
	Is this it?
	"""
	keyWait
	clearMsg
	mugshotHide
	soundPlay
		sound = 203
	storeOWVar
		variable = 0
		value = 4
	"""
	Mega Man got:
	"
	"""
	printItem
		item = 85
	"\"!!"
	keyWait
	waitOWVar
		variable = 0
		value = 5
	storeOWVar
		variable = 0
		value = 6
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	I'm not sure,but
	I think this is
	the right data...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	We won't know
	until we try,
	right?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	For now,let's
	bring this back
	to Ken.
	"""
	keyWait
	clearMsg
	end
}