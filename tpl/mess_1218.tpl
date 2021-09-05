@archive mess_1218
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
