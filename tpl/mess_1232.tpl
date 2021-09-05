@archive mess_1232
@size 7

script 1 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"""
	"PropellerCard"
	Card In!
	"""
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"""
	Here we go,
	PropellerMan!!
	"""
	keyWait
	clearMsg
	"""
	Let's find the 3
	balls and knock
	them down!
	"""
	keyWait
	end
	end
}
