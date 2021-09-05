@archive mess_1091
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = CygnusWing
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 177
	end
}
script 1 mmsf1 {
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
