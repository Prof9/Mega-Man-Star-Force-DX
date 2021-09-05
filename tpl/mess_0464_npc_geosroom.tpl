@archive mess_0464
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Za... za... zaaaa!!
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF01D
	callStartBattle
		battle = 0x64
	end
}
