@archive mess_1025
@size 256

script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = TaurusFire
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 175
	end
}
script 21 mmsf1 {
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
