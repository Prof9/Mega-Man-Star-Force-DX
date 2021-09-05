@archive mess_0482
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Wooooooo...
	Wooooooo...
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF020
	callStartBattle
		battle = 0x67
	end
}
