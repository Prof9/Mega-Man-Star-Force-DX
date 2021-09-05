@archive mess_1212
@size 190

script 0 mmsf1 {
	checkFlag
		flag = 3356
		jumpIfTrue = 1
		jumpIfFalse = continue
	checkFlag
		flag = 85
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkArea
		lower = 5
		upper = 5
		jumpIfInRange = continue
		jumpIfOutOfRange = 10
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = continue
		jumpIfOutOfRange = 10
	callCheckMapBlock
		block = 0xB1
		jumpIfEqual = continue
		jumpIfNotEqual = 10
	checkFlag
		flag = 0xF13A
		jumpIfTrue = 10
		jumpIfFalse = 11
}
script 10 mmsf1 {
	controlLock
	msgOpen
	mugshotShowGeo
	textSpeed
		delay = 1
	"EM Wave Change!"
	wait
		frames = 20
	"\n"
	printPlayerName1
	" "
	printPlayerName2
	","
	wait
		frames = 20
	"\nOn"
	wait
		frames = 16
	" The"
	wait
		frames = 16
	" Air!!"
	controlUnlock
	wait
		frames = 20
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	...Hold on,
	
	"""
	printPlayerName1
	"."
	keyWait
	clearMsg
	"""
	Don't you think
	it'd be a good
	idea to save now?
	"""
	keyWait
	clearMsg
	"""
	The EM waves are
	getting really
	intense,
	"""
	keyWait
	clearMsg
	"""
	so you won't be
	able to save
	past this point.
	"""
	keyWait
	clearMsg
	"""
	Well,if you really
	want to go full
	steam ahead,
	"""
	keyWait
	clearMsg
	"""
	I won't stop
	you...
	"""
	keyWait
	end
}
script 40 mmsf1 {
	playerAnimate
		animation = 4
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"Hey! "
	printItemBuffered
		buffer = 0
	"""
	's
	effect has
	worn off!
	"""
	keyWait
	end
}
script 41 mmsf1 {
	playerAnimate
		animation = 4
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"Hey! "
	printItemBuffered
		buffer = 0
	"""
	's
	effect has
	worn off!
	"""
	keyWait
	clearMsg
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Yes"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "No"
	"""
	Want to use
	another?
	(You have: 
	"""
	printBuffer
		buffer = 1
		minLength = 2
		padMode = noPad
	")"
	selectButtonRow2
		default = 0
		BContinue = true
		disableB = false
		jump1 = continue
		jump2 = continue
		jump3 = continue
	callEnableTextSkip
	end
}
script 42 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	Mega has disap-
	peared! No one
	will find him!
	"""
	keyWait
	end
}
script 43 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	With his eyes
	glowing,foes can
	easily see Mega.
	"""
	keyWait
	end
}
script 44 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	Mega's waves glow
	red,attracting
	Fire enemies.
	"""
	keyWait
	end
}
script 45 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	Mega's waves glow
	blue,attracting
	Aqua enemies.
	"""
	keyWait
	end
}
script 46 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	Mega's waves glow
	yellow,attracting
	Elec enemies.
	"""
	keyWait
	end
}
script 47 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	clearMsg
	"""
	Mega's waves glow
	green,attracting
	Wood enemies.
	"""
	keyWait
	end
}
script 48 mmsf1 {
	callEnableTextSkip
	msgOpen
	mugshotHide
	"""
	You used:
	"
	"""
	printItemBuffered
		buffer = 0
	"\"!"
	keyWait
	end
}
script 76 mmsf1 {
	checkGameVersion
		jumpIfPegasus = continue
		jumpIfLeo = 81
		jumpIfDragon = 82
	msgOpen
	mugshotShow
		mugshot = PegasusMagicShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCardBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printCardBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 77 mmsf1 {
	checkGameVersion
		jumpIfPegasus = continue
		jumpIfLeo = 83
		jumpIfDragon = 84
	msgOpen
	mugshotShow
		mugshot = PegasusMagicShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printItemBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	callCheckBuffer
		buffer = 1
		value = 81
		jumpIfLess = continue
		jumpIfEqual = 88
		jumpIfGreater = continue
	callCheckBuffer
		buffer = 1
		value = 87
		jumpIfLess = continue
		jumpIfEqual = 89
		jumpIfGreater = continue
	playerResetScene
	end
}
script 78 mmsf1 {
	checkFlag
		flag = 0xF11E
		jumpIfTrue = 85
		jumpIfFalse = continue
	checkFlag
		flag = 0xF11F
		jumpIfTrue = 86
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = MrHertz
	"*BEEP,BEEP!*"
	keyWait
	clearMsg
	"""
	THE CIPHER YOU
	HAVE ENTERED
	IS NOT VALID!
	"""
	keyWait
	clearMsg
	"""
	PLEASE TRY
	AGAIN!
	"""
	keyWait
	clearMsg
	"""
	CARE HEAR ABOUT
	CIPHER MAIL?
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 10
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 87
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	"""
	AWW...
	OK,BYE-BEEP!
	"""
	keyWait
	end
}
script 79 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertz
	"*BEEP,BEEP!*"
	keyWait
	clearMsg
	"""
	THE CIPHER YOU
	ENTERED HAS BEEN
	USED ALREADY.
	"""
	keyWait
	clearMsg
	"""
	CIPHERS CAN
	BE USED ONCE
	AND ONLY ONCE.
	"""
	keyWait
	clearMsg
	"OK,BYE-BEEP!"
	keyWait
	end
}
script 81 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LeoKingdomShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCardBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printCardBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 82 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSkyShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCardBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printCardBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 83 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = LeoKingdomShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printItemBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	callCheckBuffer
		buffer = 1
		value = 81
		jumpIfLess = continue
		jumpIfEqual = 88
		jumpIfGreater = continue
	playerResetScene
	end
}
script 84 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = DragonSkyShadow
	"You,\n"
	printPlayerName1
	" "
	printPlayerName2
	"""
	,
	who have broken
	"""
	keyWait
	clearMsg
	"""
	the code,
	I bestow this
	upon thee.
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveBuffered
		buffer = 0
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 4
	printEnemyBuffered
		buffer = 4
	"""
	 got:
	"
	"""
	printItemBuffered
		buffer = 1
	"\"!!"
	keyWait
	playerFinish
	callCheckBuffer
		buffer = 1
		value = 81
		jumpIfLess = continue
		jumpIfEqual = 88
		jumpIfGreater = continue
	playerResetScene
	end
}
script 85 mmsf1 {
	flagClear
		flag = 0xF11E
	msgOpen
	callMugshotShowShinNormalOrShadow
	"""
	Text
	"""
	keyWait
	end
}
script 86 mmsf1 {
	flagClear
		flag = 0xF11F
	msgOpen
	callMugshotShowShinNormalOrShadow
	"""
	Text
	"""
	keyWait
	end
}
script 87 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertz
	"""
	CIPHER MAIL IS
	A COOL SYSTEM
	WHERE YOU GET AN
	"""
	keyWait
	clearMsg
	"""
	"ITEM" WHEN YOU
	ENTER "Cipher"
	IN THE "SUBJECT"
	"""
	keyWait
	clearMsg
	"""
	AND THE ACTUAL
	CIPHER WORD OR
	MESSAGE IN THE
	"""
	keyWait
	clearMsg
	"""
	"BODY" FIELD!
	"CIPHERS" CAN BE
	"""
	keyWait
	clearMsg
	"""
	FOUND ALL OVER.
	ALL YOU HAVE TO
	DO IS LOOK!
	"""
	keyWait
	clearMsg
	"OK,BYE-BEEP!"
	keyWait
	end
}
script 88 mmsf1 {
	clearMsg
	"""
	You can change the
	Humor Buster setting
	from Key Items.
	"""
	wait
		frames = 60
	keyWait
	playerResetScene
	end
}
script 89 mmsf1 {
	clearMsg
	"""
	You can enable the
	Color Change from
	Key Items.
	"""
	wait
		frames = 60
	keyWait
	playerResetScene
	end
}
script 120 mmsf1 {
	msgOpen
	itemGiveCardBuffered
		buffer = 0
	playerAnimate
		animation = 24
	"""
	Geo got:
	"
	"""
	printCardBuffered
		buffer = 1
	"★\"!!"
	keyWait
	playerFinish
	checkFlag
		flag = 0xF003
		jumpIfTrue = continue
		jumpIfFalse = continue
	playerResetScene
	end
}
script 121 mmsf1 {
	flagSet
		flag = 0xF003
	mugshotShowNPC
		npc = 0
	"""
	Huh? It gave me
	the same card I
	just put in.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	No,wait... Some-
	thing's different
	about this one.
	"""
	keyWait
	clearMsg
	"""
	Try putting it
	in your folder!
	"""
	keyWait
	playerResetScene
	end
}
script 122 mmsf1 {
	msgOpen
	playerAnimate
		animation = 24
	"""
	Geo got:
	.
	"""
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	playerFinish
	playerAnimate
		animation = 4
	"Nothing?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	What gives!?
	This thing's
	busted!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	I'm not detecting
	any viruses,
	though...
	"""
	keyWait
	clearMsg
	"""
	Maybe the trader
	has some kind
	of trick to it.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Just watch out
	you don't lose
	all your cards!
	"""
	keyWait
	playerResetScene
	end
}
script 140 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	Thanks for
	the words of
	encouragement!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 141 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	Thanks for the
	"
	"""
	printItemBuffered
		buffer = 5
	"\"!"
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 142 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	Thanks for the
	"
	"""
	printItemBuffered
		buffer = 5
	"""
	"!
	It's perfect!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 143 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	You play Lunar
	Knights too?
	"""
	keyWait
	clearMsg
	"""
	So,you've beaten
	Lunar Knights on
	Normal Mode?
	"""
	keyWait
	clearMsg
	"""
	Not bad! But
	can you handle
	Hard Mode?
	"""
	keyWait
	clearMsg
	"""
	I feel inspired
	by your efforts!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 144 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	You play Lunar
	Knights too?
	"""
	keyWait
	clearMsg
	"""
	So,you've beaten
	Lunar Knights on
	Hard Mode?
	"""
	keyWait
	clearMsg
	"""
	Nice going!
	Keep it up for
	Nightmare Mode!
	"""
	keyWait
	clearMsg
	"""
	I feel inspired
	by your efforts!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 145 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	You play Lunar
	Knights too?
	"""
	keyWait
	clearMsg
	"""
	So,you've beaten
	Lunar Knights on
	Nightmare Mode?
	"""
	keyWait
	clearMsg
	"""
	Awesome!
	You sent those
	vampires packing!
	"""
	keyWait
	clearMsg
	"""
	I feel inspired
	by your efforts!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 146 mmsf1 {
	msgOpen
	mugshotShowBrotherBuffered
		buffer = 4
	"Hey,"
	printPlayerName1
	"!"
	keyWait
	clearMsg
	"""
	You play Lunar
	Knights too?
	"""
	keyWait
	clearMsg
	"""
	So,you've gotten
	all the titles
	in Lunar Knights?
	"""
	keyWait
	clearMsg
	"""
	Incredible!
	That's a truly
	impressive feat!
	"""
	keyWait
	clearMsg
	"""
	I feel inspired
	by your efforts!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 6
	jumpBuffered
		buffer = 7
}
script 147 mmsf1 {
	"""
	I feel a little
	stronger now!
	"""
	keyWait
	clearMsg
	jumpBuffered
		buffer = 7
}
script 148 mmsf1 {
	"""
	I feel a lot
	stronger now!
	"""
	keyWait
	clearMsg
	jump
		target = 149
}
script 149 mmsf1 {
	callSetBrotherLevelBuffered
		brotherBuffer = 4
		levelBuffer = 8
	callRefreshTopScreen
		type = 2
	soundPlay
		sound = 204
	mugshotHide
	printBrotherNameBuffered
		buffer = 4
		part = 0
	printBrotherNameBuffered
		buffer = 4
		part = 1
	"""
	's level
	has increased
	to 
	"""
	printBuffer
		buffer = 8
		minLength = 3
		padMode = noPad
	"!!"
	wait
		frames = 10
	keyWait
	jumpBuffered
		buffer = 7
}
script 150 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Keep up the
	good work!
	See you!
	"""
	keyWait
	end
}
script 151 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 151
		color = yellow
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"
	"""
	printCard
		card = 151
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 152 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 152
		color = yellow
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"
	"""
	printCard
		card = 152
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 153 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 154
		color = yellow
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"
	"""
	printCard
		card = 154
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 154 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGiveCard
		card = 155
		color = yellow
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"
	"""
	printCard
		card = 155
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 155 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 98
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got a Sub Card:
	"
	"""
	printItem
		item = 98
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 156 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	Here's something
	in return!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 102
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got a Sub Card:
	"
	"""
	printItem
		item = 102
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 157 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	This is one of my
	rarest treasures!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 33
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got a
	Mega Weapon:
	"
	"""
	printItem
		item = 33
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 158 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	This is one of my
	rarest treasures!
	See you!
	"""
	keyWait
	clearMsg
	mugshotHide
	itemGive
		item = 34
		amount = 1
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got a
	Mega Weapon:
	"
	"""
	printItem
		item = 34
	"\"!!"
	keyWait
	playerFinish
	playerResetScene
	end
}
script 159 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	I think you'll
	be able to make
	good use of this!
	"""
	keyWait
	clearMsg
	mugshotHide
	callGiveExtraFolder
		folder = 4
	callRefreshTopScreenIfExtraFolder
		type = 0
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"SunFldr"!!
	"""
	keyWait
	playerFinish
	playerResetScene
	end
}
script 160 mmsf1 {
	mugshotShowBrotherBuffered
		buffer = 4
	"""
	I think you'll
	be able to make
	good use of this!
	"""
	keyWait
	clearMsg
	mugshotHide
	callGiveExtraFolder
		folder = 5
	callRefreshTopScreenIfExtraFolder
		type = 0
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	callBufferGeoOrMegaManName
		buffer = 1
	printEnemyBuffered
		buffer = 1
	"""
	 got:
	"DarkFldr"!!
	"""
	keyWait
	playerFinish
	playerResetScene
	end
}
script 180 mmsf1 {
	checkFlag
		flag = 85
		jumpIfTrue = 182
		jumpIfFalse = continue
	checkFlag
		flag = 0xF019
		jumpIfTrue = 183
		jumpIfFalse = 181
	callReturn
}
script 181 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	Oh no! There's
	a virus in the
	Real World!
	"""
	keyWait
	clearMsg
	"""
	I don't see
	a wavehole
	nearby...
	"""
	keyWait
	clearMsg
	"""
	How are we going
	to fight it?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Must be one of
	Planet FM's
	lackeys...
	"""
	keyWait
	clearMsg
	"""
	It looks like the
	virus is warping
	space around it.
	"""
	keyWait
	clearMsg
	"""
	We should be able
	to transform and
	take it on!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 0xF019
	jump
		target = 183
}
script 182 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	Mega's not here,
	so I can't
	transform...
	"""
	keyWait
	clearMsg
	"""
	Better steer
	clear of viruses
	for now.
	"""
	keyWait
	end
}
script 183 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Let's show this
	virus who's boss!
	
	"""
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 10
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Yes  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 184
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	flagSet
		flag = 0xF033
	end
}
script 184 mmsf1 {
	callReturn
}