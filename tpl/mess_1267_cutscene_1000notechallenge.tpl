@archive mess_1267
@size 11

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	textSpeed
		delay = 0
	"""
	Get ready to rock 'n roll!
	"""
	wait
		frames = 120
	clearMsg
	end
}
script 1 mmsf1 {
	checkFlag
		flag = 0xF131
		jumpIfTrue = continue
		jumpIfFalse = 10
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	"""
	Game over.
	You got 
	"""
	printBuffer
		buffer = 0
		minLength = 4
		padMode = noPad
	"""
	 points!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF12F
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 0xF12D
		jumpIfTrue = 2
		jumpIfFalse = 4
	end
}
script 2 mmsf1 {
	mugshotShow
		mugshot = SpeedNavi
	"""
	Awesome!
	That's your highest
	score yet!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF12E
		jumpIfTrue = 5
		jumpIfFalse = continue
	"""
	...But, y'know...
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 3 mmsf1 {
	mugshotShow
		mugshot = SpeedNavi
	"""
	Wh... Whoa, no way!
	You cleared the whole thing!
	"""
	keyWait
	clearMsg
	"""
	Lemme see here...
	Well, you've earned
	40 Star Frags,
	"""
	keyWait
	clearMsg
	"""
	but since you got the
	max score, I'll throw
	in a few more!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 4 mmsf1 {
	checkFlag
		flag = 0xF12E
		jumpIfTrue = 5
		jumpIfFalse = continue
	mugshotShow
		mugshot = SpeedNavi
	"""
	Sorry, man. You gotta do
	a little better than that if
	you want these Star Frags.
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 5 mmsf1 {
	checkFlag
		flag = 0xF130
		jumpIfTrue = 6
		jumpIfFalse = continue
	mugshotShow
		mugshot = SpeedNavi
	"""
	Lemme see here...
	That means you've
	earned 
	"""
	printBuffer
		buffer = 1
		minLength = 3
		padMode = noPad
	"""
	 Star Frag!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 6 mmsf1 {
	mugshotShow
		mugshot = SpeedNavi
	"""
	Lemme see here...
	That means you've
	earned 
	"""
	printBuffer
		buffer = 1
		minLength = 3
		padMode = noPad
	"""
	 Star Frags!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmsf1 {
	checkFlag
		flag = 0xF130
		jumpIfTrue = 8
		jumpIfFalse = continue
	mugshotHide
	callShowStarFragCounter
	wait
		frames = 5
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printBuffer
		buffer = 1
		minLength = 3
		padMode = noPad
	" Star Frag\"!!"
	playerFinish
	callGiveStarFragsBuffered
		buffer = 1
	keyWait
	wait
		frames = 10
	playerResetScene
	callHideStarFragCounter
	clearMsg
	jump
		target = 9
}
script 8 mmsf1 {
	mugshotHide
	callShowStarFragCounter
	wait
		frames = 5
	soundPlay
		sound = 203
	playerAnimate
		animation = 24
	"""
	Mega Man got:
	"
	"""
	printBuffer
		buffer = 1
		minLength = 3
		padMode = noPad
	" Star Frags\"!!"
	playerFinish
	callGiveStarFragsBuffered
		buffer = 1
	keyWait
	wait
		frames = 10
	playerResetScene
	callHideStarFragCounter
	clearMsg
	jump
		target = 9
}
script 9 mmsf1 {
	mugshotShow
		mugshot = SpeedNavi
	"""
	By the way, if ya
	wanna trade some
	of your Star Frags,
	"""
	keyWait
	clearMsg
	"""
	just hit up my Hertz
	pal over there.
	"""
	keyWait
	clearMsg
	"""
	Come play again when
	the mood strikes ya!
	"""
	keyWait
	clearMsg
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = SpeedNavi
	"""
	Game over.
	You got 
	"""
	printBuffer
		buffer = 0
		minLength = 4
		padMode = noPad
	"""
	 point!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 0xF12F
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 0xF12D
		jumpIfTrue = 2
		jumpIfFalse = 4
	end
}