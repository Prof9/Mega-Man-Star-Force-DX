@archive mess_1219
@size 40

script 15 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	You bought:
	"
	"""
	printCardBuffered
		buffer = 0
	"\"!!"
	keyWait
	waitHold
	end
}
script 16 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	You bought:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!!"
	keyWait
	waitHold
	end
}
script 20 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	Oops. Looks like I don't
	have enough Zennys.
	"""
	keyWait
	waitHold
	end
}
script 21 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	"""
	Hmm, looks like I can't
	carry any more of those.
	"""
	keyWait
	waitHold
	end
}
script 25 mmsf1 {
	msgOpenQuick
	mugshotHide
	textSpeed
		delay = 0
	"\n\n"
	spacePx
		count = 82
	printBuffer
		buffer = 4
		minLength = 5
		padMode = noPad
	"[z]"
	waitHold
	end
}