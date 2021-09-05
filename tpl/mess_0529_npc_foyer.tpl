@archive mess_0529
@size 256

script 30 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Whoosh... Zap!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF027
	callStartBattle
		battle = 0x6E
	end
}
