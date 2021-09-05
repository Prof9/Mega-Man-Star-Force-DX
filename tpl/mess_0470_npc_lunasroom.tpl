@archive mess_0470
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Ssssssss...
	Zan!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF01E
	callStartBattle
		battle = 0x65
	end
}
