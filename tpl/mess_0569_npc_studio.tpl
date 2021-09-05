@archive mess_0569
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Bzzoooooh!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF02A
	callStartBattle
		battle = 0x71
	end
}
