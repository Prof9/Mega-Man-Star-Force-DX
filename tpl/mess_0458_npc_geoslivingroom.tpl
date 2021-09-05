@archive mess_0458
@size 256

script 30 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Vroom!! Vroom!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF01C
	callStartBattle
		battle = 0x63
	end
}
