@archive mess_1233
@size 9

script 0 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"OK, let's see..."
	keyWait
	end
	end
}
script 1 mmsf1 {
	msgOpen
	callMugshotShowGeoMenu
	"""
	"KeyCard"
	Card In!
	"""
	keyWait
	end
	end
}
