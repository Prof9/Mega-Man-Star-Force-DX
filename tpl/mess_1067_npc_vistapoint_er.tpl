@archive mess_1067
@size 256

script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = HarpNote
	callScreenShake
		intensity = 2
		length = 20
	"...!"
	wait
		frames = 30
	clearMsg
	flagSet
		flag = 179
	end
}
script 11 mmsf1 {
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
script 20 mmsf1 {
	checkFlag
		flag = 0xF133
		jumpIfTrue = 21
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	"""
	What's good, brother?
	I'm usin' these speakers
	here for a jam session.
	"""
	keyWait
	clearMsg
	"""
	Just found 'em lying by the
	side of the Wave Road.
	"""
	keyWait
	clearMsg
	"""
	Can you believe what people
	throw away these days?
	"""
	keyWait
	clearMsg
	"""
	Whenever I rock out
	with these beauties,
	"""
	keyWait
	clearMsg
	"""
	it feels like I can see
	the music takin' shape
	before my eyes...
	"""
	keyWait
	clearMsg
	"""
	But hey, don't just
	take it from me.
	See for yourself!
	"""
	keyWait
	clearMsg
	"""
	Tell ya what, I'll even
	share some Star Frags
	if I like your vibe.
	"""
	keyWait
	clearMsg
	"""
	Normally I'd charge 2000z,
	but first time's on me.
	"""
	keyWait
	clearMsg
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Play"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Don't"
	"""
	How about it?
	Feel like makin' some noise?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = 22
		jump2 = 23
		jump3 = continue
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	callBufferNoteGameHighScore
		buffer = 0
	"""
	What's good, brother?
	Came here to jam out?
	"""
	keyWait
	clearMsg
	"""
	Your current best
	score is 
	"""
	printBuffer
		buffer = 0
		minLength = 4
		padMode = noPad
	"""
	 pts.
	"""
	keyWait
	clearMsg
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Play"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Don't"
	"""
	Rock till you drop
	for just 2000z!
	How about it?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = 24
		jump2 = 23
		jump3 = continue
	end
}
script 22 mmsf1 {
	flagSet
		flag = 0xF133
	flagSet
		flag = 0xF12C
	clearMsg
	msgClose
	wait
		frames = 120
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	"""
	Oh? Not feeling it today?
	Well, drop by anytime.
	"""
	keyWait
	clearMsg
	end
}
script 24 mmsf1 {
	checkZenny
		amount = 2000
		jumpIfEnough = continue
		jumpIfNotEnough = 25
	itemTakeZenny
		amount = 2000
	jump
		target = 22
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	"""
	Sorry, man... You don't
	got enough Zennys.
	"""
	keyWait
	clearMsg
	"""
	I got bills to pay too,
	y'know?
	"""
	keyWait
	clearMsg
	end
}
script 30 mmsf1 {
	checkShopStock
		shop = 9
		jumpIfStocked = continue
		jumpIfSoldOut = 32
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	optionButtonSmall
		up = 0
		down = 0
		left = 1
		right = 1
		string = "Look"
	optionButtonSmall
		up = 1
		down = 1
		left = 0
		right = 0
		string = "Don't"
	"""
	*BEEP BEEP*
	WANT TO EXCHANGE
	YOUR STAR FRAGS?
	"""
	selectButtonRow2
		default = 0
		BContinue = false
		disableB = false
		jump1 = continue
		jump2 = 31
		jump3 = continue
	clearMsg
	callShop
		shop = 9
	end
}
script 31 mmsf1 {
	clearMsg
	"""
	PLEASE COME BACK
	AGAIN SOMETIME!
	*BEEP BEEP*
	"""
	keyWait
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrHertzGold
	"""
	SORRY, I'M ALL SOLD OUT.
	*BEEP BEEP*
	"""
	keyWait
	clearMsg
}
script 40 mmsf1 {
	msgOpen
	mugshotHide
	"""
	Funny... it feels like
	you've seen this speaker
	somewhere before...
	"""
	keyWait
	clearMsg
	end
}
script 50 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	It's battle image data
	from that mysterious
	shadowy guy.
	"""
	keyWait
	clearMsg
	"""
	Wanna get in some
	target practice?
	"""
	keyWait
	clearMsg
	mugshotHide
	textSpeed
		delay = 0
	positionOptionFromCenter
		width = 85
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Fight  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Don't"
	selectText
		default = 0
		BContinue = false
		disableB = false
		unused = false
		jump1 = 51
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	end
}
script 51 mmsf1 {
	flagSet
		flag = 0xF137
	callStartBattle
		battle = 0x81
	end
}
script 52 mmsf1 {
	wait
		frames = 15
	checkBattleResult
		jumpIfWon = continue
		jumpIfLost = 53
		jumpIfOther = 54
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Easy peasy!
	No way we're losing to
	a grunt like that.
	"""
	keyWait
	clearMsg
	"""
	Feels good to go buck wild
	once in a while! Eh, Geo?
	"""
	keyWait
	clearMsg
	end
}
script 53 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	H...Hey, what are you doing?
	Focus, Geo!
	"""
	keyWait
	clearMsg
	"""
	We can't let him get
	the drop on us!
	"""
	keyWait
	clearMsg
	end
}
script 54 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	T-This isn't looking good...
	Better retreat for now!
	"""
	keyWait
	clearMsg
	end
}
script 60 mmsf1 {
	wait
		frames = 30
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Geo, wait.
	"""
	keyWait
	clearMsg
	"""
	I can feel the presence of
	an immensely strong being
	somewhere in this area.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Don't tell me...
	An FM-ian!?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	This wave is unlike
	anything I've ever felt.
	"""
	keyWait
	clearMsg
	"""
	But whether it's friend
	or foe... I'm not sure.
	"""
	keyWait
	clearMsg
	"""
	Anyway,
	just be careful, kid.
	"""
	keyWait
	clearMsg
	"""
	And there's something
	else in this area too...
	"""
	keyWait
	clearMsg
	"""
	Something which wasn't
	here before.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Guess we better take
	a look around...
	"""
	keyWait
	clearMsg
	msgClose
	wait
		frames = 30
	controlUnlock
	end
}