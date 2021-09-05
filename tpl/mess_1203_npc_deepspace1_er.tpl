@archive mess_1203
@size 256

script 0 mmsf1 {
	checkFlag
		flag = 0xF001
		jumpIfTrue = 1
		jumpIfFalse = continue
	flagSet
		flag = 0xF001
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	*snicker!*
	"""
	keyWait
	clearMsg
	"""
	It's not often
	I get visitors
	up here.
	"""
	keyWait
	clearMsg
	"""
	And what's this?
	You have a
	Transer on you.
	"""
	keyWait
	clearMsg
	"""
	Well,you've
	come to the
	right Jammer.
	"""
	keyWait
	clearMsg
	"""
	If you want...
	I could change
	which Satellite
	"""
	keyWait
	clearMsg
	"""
	your Transer is
	registered to.
	"""
	keyWait
	clearMsg
	"""
	Normally,you
	can't change
	a Transer's
	"""
	keyWait
	clearMsg
	"""
	Satellite
	after you've
	registered it.
	"""
	keyWait
	clearMsg
	"""
	But I know a
	few tricks...
	"""
	keyWait
	clearMsg
	"""
	Look,I'll even
	cut you a nice
	deal. It's not
	"""
	keyWait
	clearMsg
	"""
	every day I get
	to do business
	up here.
	"""
	keyWait
	clearMsg
	"""
	What do you say?
	"""
	keyWait
	clearMsg
	"""
	You wanna change
	your Transer's
	Satellite?
	"""
	keyWait
	clearMsg
	"""
	It'll cost you
	1000z...
	"""
	keyWait
	clearMsg
	mugshotHide
	positionOptionFromCenter
		width = 14
	positionOptionFromCenter
		width = 63
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 7
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	checkZenny
		amount = 1000
		jumpIfEnough = continue
		jumpIfNotEnough = 2
	clearMsg
	mugshotShow
		mugshot = Jammer
	"""
	Great! Which
	Satellite
	will it be?
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	You wanna change
	your Transer's
	Satellite?
	"""
	keyWait
	clearMsg
	"""
	It'll cost you
	1000z...
	"""
	keyWait
	clearMsg
	mugshotHide
	positionOptionFromCenter
		width = 14
	positionOptionFromCenter
		width = 63
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = continue
		jump2 = 7
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	checkZenny
		amount = 1000
		jumpIfEnough = continue
		jumpIfNotEnough = 2
	clearMsg
	mugshotShow
		mugshot = Jammer
	"""
	Great! Which
	Satellite
	will it be?
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 2 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Yeah... I don't
	think so,pal.
	"""
	keyWait
	clearMsg
	"""
	Why don't you come
	back once you've
	saved up 1000z?
	"""
	keyWait
	end
}
script 3 mmsf1 {
	checkGameVersion
		jumpIfPegasus = 4
		jumpIfLeo = 5
		jumpIfDragon = 6
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Pegasus\n"
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Leo\n"
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Dragon"
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 8
		jump2 = 9
		jump3 = 10
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 7
}
script 4 mmsf1 {
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Pegasus\n"
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Leo\n"
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Dragon"
	selectText
		default = 0
		BContinue = true
		disableB = false
		unused = false
		jump1 = 7
		jump2 = 9
		jump3 = 10
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 7
}
script 5 mmsf1 {
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Pegasus\n"
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Leo\n"
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Dragon"
	selectText
		default = 1
		BContinue = true
		disableB = false
		unused = false
		jump1 = 8
		jump2 = 7
		jump3 = 10
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 7
}
script 6 mmsf1 {
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	optionText
		up = 2
		down = 1
		left = 0
		right = 0
	"  Pegasus\n"
	optionText
		up = 0
		down = 2
		left = 1
		right = 1
	"  Leo\n"
	optionText
		up = 1
		down = 0
		left = 2
		right = 2
	"  Dragon"
	selectText
		default = 2
		BContinue = true
		disableB = false
		unused = false
		jump1 = 8
		jump2 = 9
		jump3 = 7
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	callEnableTextSkip
	jump
		target = 7
}
script 7 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Don't want to
	change? That's
	fine too...
	"""
	keyWait
	end
}
script 8 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Pegasus it is,
	then! Gimme that
	Transer for a sec.
	"""
	keyWait
	clearMsg
	"..."
	wait
		frames = 30
	callSetPlayerSatellite
		satellite = 1
	callBackupStarForceCardEquipped
	itemStarForceCard
		card = 280
		unused = 0
	callRestoreStarForceCardEquipped
	itemTakeZenny
		amount = 1000
	mugshotShow
		mugshot = Jammer
	"""
	Done! Enjoy
	your new life
	as a Pegasus!
	"""
	keyWait
	clearMsg
	"""
	Come back anytime
	you want your
	Satellite changed.
	"""
	keyWait
	callRefreshTopScreen
		type = 0
	callRefreshTopScreen
		type = 1
	callRefreshTopScreen
		type = 2
	end
}
script 9 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Leo it is,
	then! Gimme that
	Transer for a sec.
	"""
	keyWait
	clearMsg
	"..."
	wait
		frames = 30
	callSetPlayerSatellite
		satellite = 2
	callBackupStarForceCardEquipped
	itemStarForceCard
		card = 281
		unused = 0
	callRestoreStarForceCardEquipped
	itemTakeZenny
		amount = 1000
	mugshotShow
		mugshot = Jammer
	"""
	Done! Enjoy
	your new life
	as a Leo!
	"""
	keyWait
	clearMsg
	"""
	Come back anytime
	you want your
	Satellite changed.
	"""
	keyWait
	callRefreshTopScreen
		type = 0
	callRefreshTopScreen
		type = 1
	callRefreshTopScreen
		type = 2
	end
}
script 10 mmsf1 {
	mugshotShow
		mugshot = Jammer
	"""
	Dragon it is,
	then! Gimme that
	Transer for a sec.
	"""
	keyWait
	clearMsg
	"..."
	wait
		frames = 30
	callSetPlayerSatellite
		satellite = 3
	callBackupStarForceCardEquipped
	itemStarForceCard
		card = 282
		unused = 0
	callRestoreStarForceCardEquipped
	itemTakeZenny
		amount = 1000
	mugshotShow
		mugshot = Jammer
	"""
	Done! Enjoy
	your new life
	as a Dragon!
	"""
	keyWait
	clearMsg
	"""
	Come back anytime
	you want your
	Satellite changed.
	"""
	keyWait
	callRefreshTopScreen
		type = 0
	callRefreshTopScreen
		type = 1
	callRefreshTopScreen
		type = 2
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = PegasusMagic
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 187
	end
}
script 21 mmsf1 {
	wait
		frames = 15
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Get outta here for now!
	"""
	keyWait
	clearMsg
	end
}