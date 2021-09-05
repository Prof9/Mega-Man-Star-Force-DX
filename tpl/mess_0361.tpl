@archive mess_0361
@size 5

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"......"
	keyWait
	end
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Mega...
	Is he...?
	"""
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Behind here..."
	keyWait
	clearMsg
	"""
	But first,we
	have to get this
	door open...
	"""
	keyWait
	clearMsg
	jump
		target = 4
	end
}