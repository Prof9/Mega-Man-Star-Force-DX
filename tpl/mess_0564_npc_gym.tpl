@archive mess_0564
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Go after that
	creep!
	"""
	keyWait
	clearMsg
	"""
	Find a
	wavehole!
	"""
	keyWait
	end
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotHide
	callScreenShake
		intensity = 2
		length = 20
	"""
	Do re mi fa so...
	"""
	keyWait
	clearMsg
	callCommonText
		script = 180
	flagSet
		flag = 0xF029
	callStartBattle
		battle = 0x70
	end
}
