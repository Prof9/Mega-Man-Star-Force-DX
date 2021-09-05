@archive mess_0518
@size 256

script 10 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Bzzt!! Bzzzzz!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF026
	callStartBattle
		battle = 0x6D
	end
}
