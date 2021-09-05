@archive mess_0150
@size 3

script 1 mmsf1 {
	mugshotHide
	msgOpen
	storeOWVar
		variable = 0
		value = 1
	soundPlay
		sound = 203
	printPlayerName1
	"""
	 got:
	"
	"""
	printItem
		item = 13
	"\"!!\n"
	keyWait
	waitOWVar
		variable = 1
		value = 1
	clearMsg
	end
}
