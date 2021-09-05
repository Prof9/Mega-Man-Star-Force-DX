@archive mess_0602
@size 255

script 20 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	...Waaah...
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF031
	callStartBattle
		battle = 0x78
	end
}
