@archive mess_1206
@size 256

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LeoKingdom
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
script 1 mmsf1 {
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
script 10 mmsf1 {
	checkFlag
		flag = 0xF115
		jumpIfTrue = 14
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	Now, what's a pipsqueak
	like you doing in a place
	like this?
	"""
	keyWait
	clearMsg
	"""
	Think you're a hotshot?
	Show me your Personal
	Best Combo.
	"""
	keyWait
	clearMsg
	"""
	A strong fighter has to
	have an awesome Personal
	Best Combo, right?
	"""
	keyWait
	clearMsg
	"""
	So, let's see yours.
	"""
	keyWait
	clearMsg
	callCheckPersonalBestComboDamage
		value = 1000
		buffer = 1
		jumpIfGreaterOrEqual = 11
		jumpIfLower = 12
		jumpIfNone = 13
	end
}
script 11 mmsf1 {
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"""
	WHAT!?
	Your "
	"""
	printBestComboBuffer
	"""
	" has
	
	"""
	printBuffer
		buffer = 1
		minLength = 4
		padMode = noPad
	"""
	 Attack Power!?
	"""
	keyWait
	clearMsg
	"""
	W-Wow. You're no
	ordinary pipsqueak.
	"""
	keyWait
	clearMsg
	"""
	I know. Since you were
	able to impress me, let
	me give you this.
	"""
	keyWait
	clearMsg
	mugshotHide
	callGiveExtraFolder
		folder = 6
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	callRefreshTopScreenIfExtraFolder
		type = 0
	"""
	Mega Man got:
	"LgndFldr"!!
	"""
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = Jammer
	"""
	Someone like you should
	be able to make good
	use of this.
	"""
	keyWait
	clearMsg
	"""
	Apparently it's quite...
	legendary. Or something
	like that.
	"""
	keyWait
	clearMsg
	"""
	Heh, heh.
	See you around.
	"""
	keyWait
	clearMsg
	end
}
script 12 mmsf1 {
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"""
	Hmph.
	Your "
	"""
	printBestComboBuffer
	"""
	" has
	only 
	"""
	printBuffer
		buffer = 1
		minLength = 4
		padMode = noPad
	"""
	 Attack Power?
	"""
	keyWait
	clearMsg
	"""
	Tsk! You don't have
	any business here.
	Go home!
	"""
	keyWait
	clearMsg
	end
}
script 13 mmsf1 {
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"""
	Huh?
	You don't even have
	a Personal Best Combo!
	"""
	keyWait
	clearMsg
	"""
	Tsk! You don't have
	any business here.
	Go home!
	"""
	keyWait
	clearMsg
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Jammer
	"""
	How's that "LgndFldr"
	working for you?
	"""
	keyWait
	clearMsg
	"""
	I think you'll find it pretty
	useful around here.
	"""
	keyWait
	clearMsg
	end
}
script 19 mmsf1 {
	flagClear
		flag = 0xF176
	flagSet
		flag = 0xF171
	end
}
script 20 mmsf1 {
	callShowStarFragCounter
	msgOpen
	mugshotShowNPC
		npc = 0
	textSpeed
		delay = 0
	"""
	A Star Frag Trader.
	Put in 10 Star Frags?
	
	"""
	positionOptionFromCenter
		width = 65
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes!  "
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
		jump1 = 21
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callHideStarFragCounter
	end
}
script 21 mmsf1 {
	callCheckStarFrags
		count = 10
		jumpIfEnough = 22
		jumpIfNotEnough = continue
	mugshotShowNPC
		npc = 0
	"""
	Looks like we don't
	have enough Star Frags.
	"""
	keyWait
	clearMsg
	callHideStarFragCounter
	end
}
script 22 mmsf1 {
	mugshotHide
	clearMsg
	"""
	Mega Man put in
	the Star Frags!
	"""
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	callTakeStarFrags
		count = 1
	wait
		frames = 3
	keyWait
	clearMsg
	flagSet
		flag = 0xF175
	soundPlay
		sound = 580
	"""
	With a bright flash,
	a Battle Card appeared!
	"""
	keyWait
	waitFlag
		flag = 0xF176
	flagClear
		flag = 0xF176
	clearMsg
	callStarFragTrader
	callShowBattleCardBuffered
		buffer = 1
	itemGiveCardBuffered
		buffer = 0
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printCardBuffered
		buffer = 3
	"""
	"!!
	"""
	keyWait
	playerFinish
	playerResetScene
	callHideBattleCard
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Should I try again?
	
	
	"""
	positionOptionFromCenter
		width = 65
	textSpeed
		delay = 0
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Yes!  "
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
		jump1 = 21
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callHideStarFragCounter
	end
}
script 30 mmsf1 {
	checkFlag
		flag = 0xF162
		jumpIfTrue = 33
		jumpIfFalse = continue
	checkFlag
		flag = 0xF174
		jumpIfTrue = 31
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = InfoNavi
	"""
	I'm out here collecting
	battle data on viruses.
	"""
	keyWait
	clearMsg
	"""
	But the viruses on this
	Wave Road are so strong...
	"""
	keyWait
	clearMsg
	"""
	You seem capable.
	Can I take a look at
	your EM Database?
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	keyWait
	clearMsg
	checkMultiFlag
		flag = 0xF040
		count = 89
		jumpIfAllSet = 32
		jumpIfNotAllSet = continue
	"""
	Hmm... I'm still missing
	some virus data.
	"""
	keyWait
	clearMsg
	"""
	I'll add the area data
	for the missing viruses
	to your Database.
	"""
	keyWait
	clearMsg
	mugshotHide
	flagSet
		flag = 0xF174
	playerAnimate
		animation = 24
	soundPlay
		sound = 204
	"""
	Virus data in the
	Database has been
	updated!
	"""
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	mugshotShow
		mugshot = InfoNavi
	"""
	If you could find and
	delete them for me, that
	would be much appreciated.
	"""
	keyWait
	clearMsg
	"""
	I'll be counting on you!
	"""
	keyWait
	clearMsg
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = InfoNavi
	"""
	I'm still out here collecting
	battle data on viruses...
	"""
	keyWait
	clearMsg
	"""
	Mind if I take a look
	at your EM Database?
	"""
	keyWait
	clearMsg
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	"."
	wait
		frames = 20
	keyWait
	clearMsg
	checkMultiFlag
		flag = 0xF040
		count = 89
		jumpIfAllSet = 32
		jumpIfNotAllSet = continue
	"""
	Hmm... I'm still missing
	some virus data.
	"""
	keyWait
	clearMsg
	"""
	If you could find and
	delete them for me, that
	would be much appreciated.
	"""
	keyWait
	clearMsg
	"""
	I'll be counting on you!
	"""
	keyWait
	clearMsg
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = InfoNavi
	"""
	Wow! You've deleted
	every kind of virus!
	"""
	keyWait
	clearMsg
	"""
	This is invaluable to
	my research.
	Thank you!
	"""
	keyWait
	clearMsg
	"""
	Let me give you this
	rare card. Don't be shy!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = OxTackle
		color = red
		amount = 1
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printCard
		card = OxTackle
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	clearMsg
	flagSet
		flag = 0xF162
	jump
		target = 33
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = InfoNavi
	"""
	I should be getting
	out of here soon...
	"""
	keyWait
	clearMsg
	end
}