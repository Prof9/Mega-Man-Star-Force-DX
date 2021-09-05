@archive mess_0105
@size 16

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoNoVisualizer
	"My name is\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	.
	......
	"""
	keyWait
	clearMsg
	callCheckPlayerNameDefault
		jumpIfDefault = 15
	msgClose
	wait
		frames = 60
	msgOpen
	mugshotShowNPC
		npc = 2
	"""
	Now,young man.
	Your real name,
	if you please.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoNoVisualizer
	"""
	......
	My name is
	Geo Stelar.
	"""
	keyWait
	end
}
script 15 mmsf1 {
	end
}