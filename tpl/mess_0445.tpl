@archive mess_0445
@size 100

script 34 mmsf1 {
	checkSubArea
		lower = 0
		upper = 0
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Looks like
	there's one more
	wavehole!
	"""
	keyWait
	clearMsg
	"Gotta find it!"
	keyWait
	end
	end
}
