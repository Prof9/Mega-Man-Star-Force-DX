@archive mess_0101
@size 69

script 0 mmsf1 {
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF129
		jumpIfTrue = 60
		jumpIfFalse = continue
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" Here's my stats.\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Equip Weapon\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 50
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 1 mmsf1 {
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF129
		jumpIfTrue = 61
		jumpIfFalse = continue
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" Here's my stats.\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Equip Weapon\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 2 mmsf1 {
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF129
		jumpIfTrue = 62
		jumpIfFalse = continue
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" Here's my stats.\n "
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 51
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 3 mmsf1 {
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkFlag
		flag = 0xF129
		jumpIfTrue = 63
		jumpIfFalse = continue
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" Here's my stats.\n "
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 12 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data,so
	hold on a sec...
	"""
	checkSaveInit
		jumpIfFailed = 10
	checkSaveInitFinished
		jumpIfSuccessful = 11
	end
}
script 43 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" Here's my stats."
	waitHold
	end
}
script 50 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" Which file?\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Viruses\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Records"
	selectText
		default = 0
		BContinue = true
		disableB = true
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 51 mmsf1 {
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" Which file?\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	"  Viruses\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	"  Records"
	selectText
		default = 0
		BContinue = true
		disableB = true
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 52 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" Here's my stats.\n "
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	" Equip Weapon"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 53 mmsf1 {
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" Here's my stats."
	waitHold
	end
}
script 60 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" ......\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Equip Weapon\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 50
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 61 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" ......\n "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" Equip Weapon\n "
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 62 mmsf1 {
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" ......\n "
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = 51
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 63 mmsf1 {
	positionText
		left = 4
		top = 15
	textSpeed
		delay = 0
	" ......\n "
	optionText
		up = 0
		down = 0
		left = 0
		right = 0
	" Check Database"
	selectText
		default = 0
		BContinue = false
		disableB = true
		unused = false
		jump1 = continue
		jump2 = 0
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	end
}
script 64 mmsf1 {
	positionText
		left = 7
		top = 15
	textSpeed
		delay = 0
	" ......"
	waitHold
	end
}
script 65 mmsf1 {
	"SF Pegasus"
	end
}
script 66 mmsf1 {
	"SF Leo"
	end
}
script 67 mmsf1 {
	"SF Dragon"
	end
}
script 68 mmsf1 {
	"SF None"
	end
}