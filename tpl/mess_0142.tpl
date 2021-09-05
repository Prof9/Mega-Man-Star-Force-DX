@archive mess_0142
@size 10

script 8 mmsf1 {
	msgOpen
	mugshotHide
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	"""
	Geo got
	"
	"""
	printCard
		card = 455
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	jump
		target = 9
	end
}