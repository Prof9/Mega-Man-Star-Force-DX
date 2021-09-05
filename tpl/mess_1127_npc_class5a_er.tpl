@archive mess_1127
@size 256

script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LibraScales
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 181
	end
}
script 11 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Get outta here for now!
	"""
	keyWait
	clearMsg
	end
}
