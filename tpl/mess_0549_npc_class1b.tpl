@archive mess_0549
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	*ding dong!!*
	*ding dong!!*
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF028
	callStartBattle
		battle = 0x6F
	end
}
