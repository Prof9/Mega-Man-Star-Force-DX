@archive mess_0610
@size 255

script 10 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Wee-oooo!!
	Wee-oooo!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF032
	callStartBattle
		battle = 0x79
	end
}
