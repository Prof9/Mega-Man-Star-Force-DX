@archive mess_0506
@size 256

script 30 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Blub, blub, blub!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF024
	callStartBattle
		battle = 0x6B
	end
}
