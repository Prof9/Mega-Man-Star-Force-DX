@archive mess_0465
@size 110

script 6 mmsf1 {
	msgOpen
	"A small TV..."
	keyWait
	clearMsg
	"""
	Small compared
	to the other TV,
	but still nice.
	"""
	keyWait
	end
	end
}
script 30 mmsf1 {
	callInitSaveSpinner
		vramSettings = 0
	flagNextDay
	callAllocSaveBuffer
	callSaveCompress
	textSpeed
		delay = 0
	flagClear
		flag = 3370
	"""
	Save progress
	this far?
	
	"""
	positionOptionFromCenter
		width = 9
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Save  "
	optionText
		up = 1
		down = 1
		left = 0
		right = 0
	" No"
	selectText
		default = 1
		BContinue = false
		disableB = false
		unused = false
		jump1 = 31
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callAbortSaveCompress
	callFreeSaveBuffer
	end
}
script 31 mmsf1 {
	flagClear
		flag = 3370
	checkSaveAccess
		jumpIfError = 38
	checkSaveExists
		jumpIfExists = continue
		jumpIfNotExists = 37
	textSpeed
		delay = 0
	"""
	Is it OK to
	overwrite?
	
	"""
	positionOptionFromCenter
		width = 13
	optionText
		up = 0
		down = 0
		left = 1
		right = 1
	" Overwrite  "
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
		jump1 = 36
		jump2 = continue
		jump3 = 0
		jump4 = 0
		jump5 = 0
		jump6 = 0
		jump7 = 0
		jump8 = 0
	clearMsg
	callAbortSaveCompress
	callFreeSaveBuffer
	end
}
script 33 mmsf1 {
	flagClear
		flag = 3370
	controlUnlock
	textSpeed
		delay = 0
	soundPlay
		sound = 138
	"Save complete!"
	keyWait
	callAbortSaveCompress
	callFreeSaveBuffer
	end
}
script 34 mmsf1 {
	flagClear
		flag = 3370
	textSpeed
		delay = 0
	"Save failed..."
	keyWait
	callAbortSaveCompress
	callFreeSaveBuffer
	end
}
script 37 mmsf1 {
	flagSet
		flag = 3370
	controlLock
	mugshotAnimation
		animation = 0
	textSpeed
		delay = 0
	"""
	Initializing
	backup data...
	
	"""
	checkSaveInit
		jumpIfFailed = 35
	checkSaveInitFinished
		jumpIfSuccessful = 36
	end
}
script 40 mmsf1 {
	msgOpen
	"Get Boktai items"
	itemGive
		item = 92
		amount = 1
	itemGive
		item = 93
		amount = 1
	itemGive
		item = 94
		amount = 1
	itemGive
		item = 95
		amount = 1
	itemGive
		item = 102
		amount = 1
	itemGive
		item = 103
		amount = 1
	itemGive
		item = 104
		amount = 1
	itemGive
		item = 105
		amount = 1
	itemGive
		item = 106
		amount = 1
	itemGive
		item = 107
		amount = 1
	itemGive
		item = 108
		amount = 1
	itemGive
		item = 109
		amount = 1
	itemGive
		item = 110
		amount = 1
	end
}
script 41 mmsf1 {
	msgOpen
	"Get All Star Cards"
	itemGiveCard
		card = 1
		color = 2
		amount = 9
	itemGiveCard
		card = 2
		color = 2
		amount = 9
	itemGiveCard
		card = 3
		color = 2
		amount = 9
	itemGiveCard
		card = 4
		color = 2
		amount = 9
	itemGiveCard
		card = 5
		color = 2
		amount = 9
	itemGiveCard
		card = 6
		color = 2
		amount = 9
	itemGiveCard
		card = 7
		color = 2
		amount = 9
	itemGiveCard
		card = 8
		color = 2
		amount = 9
	itemGiveCard
		card = 9
		color = 2
		amount = 9
	itemGiveCard
		card = 10
		color = 2
		amount = 9
	itemGiveCard
		card = 11
		color = 2
		amount = 9
	itemGiveCard
		card = 12
		color = 2
		amount = 9
	itemGiveCard
		card = 13
		color = 2
		amount = 9
	itemGiveCard
		card = 14
		color = 2
		amount = 9
	itemGiveCard
		card = 15
		color = 2
		amount = 9
	itemGiveCard
		card = 16
		color = 2
		amount = 9
	itemGiveCard
		card = 17
		color = 2
		amount = 9
	itemGiveCard
		card = 18
		color = 2
		amount = 9
	itemGiveCard
		card = 19
		color = 2
		amount = 9
	itemGiveCard
		card = 20
		color = 2
		amount = 9
	itemGiveCard
		card = 21
		color = 2
		amount = 9
	itemGiveCard
		card = 22
		color = 2
		amount = 9
	itemGiveCard
		card = 23
		color = 2
		amount = 9
	itemGiveCard
		card = 24
		color = 2
		amount = 9
	itemGiveCard
		card = 25
		color = 2
		amount = 9
	itemGiveCard
		card = 26
		color = 2
		amount = 9
	itemGiveCard
		card = 27
		color = 2
		amount = 9
	itemGiveCard
		card = 28
		color = 2
		amount = 9
	itemGiveCard
		card = 29
		color = 2
		amount = 9
	itemGiveCard
		card = 30
		color = 2
		amount = 9
	itemGiveCard
		card = 31
		color = 2
		amount = 9
	itemGiveCard
		card = 32
		color = 2
		amount = 9
	itemGiveCard
		card = 33
		color = 2
		amount = 9
	itemGiveCard
		card = 34
		color = 2
		amount = 9
	itemGiveCard
		card = 35
		color = 2
		amount = 9
	itemGiveCard
		card = 36
		color = 2
		amount = 9
	itemGiveCard
		card = 37
		color = 2
		amount = 9
	itemGiveCard
		card = 38
		color = 2
		amount = 9
	itemGiveCard
		card = 39
		color = 2
		amount = 9
	itemGiveCard
		card = 40
		color = 2
		amount = 9
	itemGiveCard
		card = 41
		color = 2
		amount = 9
	itemGiveCard
		card = 42
		color = 2
		amount = 9
	itemGiveCard
		card = 43
		color = 2
		amount = 9
	itemGiveCard
		card = 44
		color = 2
		amount = 9
	itemGiveCard
		card = 45
		color = 2
		amount = 9
	itemGiveCard
		card = 46
		color = 2
		amount = 9
	itemGiveCard
		card = 47
		color = 2
		amount = 9
	itemGiveCard
		card = 48
		color = 2
		amount = 9
	itemGiveCard
		card = 49
		color = 2
		amount = 9
	itemGiveCard
		card = 50
		color = 2
		amount = 9
	itemGiveCard
		card = 51
		color = 2
		amount = 9
	itemGiveCard
		card = 52
		color = 2
		amount = 9
	itemGiveCard
		card = 53
		color = 2
		amount = 9
	itemGiveCard
		card = 54
		color = 2
		amount = 9
	itemGiveCard
		card = 55
		color = 2
		amount = 9
	itemGiveCard
		card = 56
		color = 2
		amount = 9
	itemGiveCard
		card = 57
		color = 2
		amount = 9
	itemGiveCard
		card = 58
		color = 2
		amount = 9
	itemGiveCard
		card = 59
		color = 2
		amount = 9
	itemGiveCard
		card = 60
		color = 2
		amount = 9
	itemGiveCard
		card = 61
		color = 2
		amount = 9
	itemGiveCard
		card = 62
		color = 2
		amount = 9
	itemGiveCard
		card = 63
		color = 2
		amount = 9
	itemGiveCard
		card = 64
		color = 2
		amount = 9
	itemGiveCard
		card = 65
		color = 2
		amount = 9
	itemGiveCard
		card = 66
		color = 2
		amount = 9
	itemGiveCard
		card = 67
		color = 2
		amount = 9
	itemGiveCard
		card = 68
		color = 2
		amount = 9
	itemGiveCard
		card = 69
		color = 2
		amount = 9
	itemGiveCard
		card = 70
		color = 2
		amount = 9
	itemGiveCard
		card = 71
		color = 2
		amount = 9
	itemGiveCard
		card = 72
		color = 2
		amount = 9
	itemGiveCard
		card = 73
		color = 2
		amount = 9
	itemGiveCard
		card = 74
		color = 2
		amount = 9
	itemGiveCard
		card = 75
		color = 2
		amount = 9
	itemGiveCard
		card = 76
		color = 2
		amount = 9
	itemGiveCard
		card = 77
		color = 2
		amount = 9
	itemGiveCard
		card = 78
		color = 2
		amount = 9
	itemGiveCard
		card = 79
		color = 2
		amount = 9
	itemGiveCard
		card = 80
		color = 2
		amount = 9
	itemGiveCard
		card = 81
		color = 2
		amount = 9
	itemGiveCard
		card = 82
		color = 2
		amount = 9
	itemGiveCard
		card = 83
		color = 2
		amount = 9
	itemGiveCard
		card = 84
		color = 2
		amount = 9
	itemGiveCard
		card = 85
		color = 2
		amount = 9
	itemGiveCard
		card = 86
		color = 2
		amount = 9
	itemGiveCard
		card = 87
		color = 2
		amount = 9
	itemGiveCard
		card = 88
		color = 2
		amount = 9
	itemGiveCard
		card = 89
		color = 2
		amount = 9
	itemGiveCard
		card = 90
		color = 2
		amount = 9
	itemGiveCard
		card = 91
		color = 2
		amount = 9
	itemGiveCard
		card = 92
		color = 2
		amount = 9
	itemGiveCard
		card = 93
		color = 2
		amount = 9
	itemGiveCard
		card = 94
		color = 2
		amount = 9
	itemGiveCard
		card = 95
		color = 2
		amount = 9
	itemGiveCard
		card = 96
		color = 2
		amount = 9
	itemGiveCard
		card = 97
		color = 2
		amount = 9
	itemGiveCard
		card = 98
		color = 2
		amount = 9
	itemGiveCard
		card = 99
		color = 2
		amount = 9
	itemGiveCard
		card = 100
		color = 2
		amount = 9
	itemGiveCard
		card = 101
		color = 2
		amount = 9
	itemGiveCard
		card = 102
		color = 2
		amount = 9
	itemGiveCard
		card = 103
		color = 2
		amount = 9
	itemGiveCard
		card = 104
		color = 2
		amount = 9
	itemGiveCard
		card = 105
		color = 2
		amount = 9
	itemGiveCard
		card = 106
		color = 2
		amount = 9
	itemGiveCard
		card = 107
		color = 2
		amount = 9
	itemGiveCard
		card = 108
		color = 2
		amount = 9
	itemGiveCard
		card = 109
		color = 2
		amount = 9
	itemGiveCard
		card = 110
		color = 2
		amount = 9
	itemGiveCard
		card = 111
		color = 2
		amount = 9
	itemGiveCard
		card = 112
		color = 2
		amount = 9
	itemGiveCard
		card = 113
		color = 2
		amount = 9
	itemGiveCard
		card = 114
		color = 2
		amount = 9
	itemGiveCard
		card = 115
		color = 2
		amount = 9
	itemGiveCard
		card = 116
		color = 2
		amount = 9
	itemGiveCard
		card = 117
		color = 2
		amount = 9
	itemGiveCard
		card = 118
		color = 2
		amount = 9
	itemGiveCard
		card = 119
		color = 2
		amount = 9
	itemGiveCard
		card = 120
		color = 2
		amount = 9
	itemGiveCard
		card = 121
		color = 2
		amount = 9
	itemGiveCard
		card = 122
		color = 2
		amount = 9
	itemGiveCard
		card = 123
		color = 2
		amount = 9
	itemGiveCard
		card = 124
		color = 2
		amount = 9
	itemGiveCard
		card = 125
		color = 2
		amount = 9
	itemGiveCard
		card = 127
		color = 2
		amount = 9
	itemGiveCard
		card = 128
		color = 2
		amount = 9
	itemGiveCard
		card = 129
		color = 2
		amount = 9
	itemGiveCard
		card = 130
		color = 2
		amount = 9
	itemGiveCard
		card = 131
		color = 2
		amount = 9
	itemGiveCard
		card = 132
		color = 2
		amount = 9
	itemGiveCard
		card = 133
		color = 2
		amount = 9
	itemGiveCard
		card = 134
		color = 2
		amount = 9
	itemGiveCard
		card = 138
		color = 2
		amount = 9
	itemGiveCard
		card = 139
		color = 2
		amount = 9
	itemGiveCard
		card = 148
		color = 2
		amount = 9
	itemGiveCard
		card = 149
		color = 2
		amount = 9
	itemGiveCard
		card = 150
		color = 2
		amount = 9
	itemGiveCard
		card = 151
		color = 2
		amount = 9
	itemGiveCard
		card = 152
		color = 2
		amount = 9
	itemGiveCard
		card = 154
		color = 2
		amount = 9
	itemGiveCard
		card = 155
		color = 2
		amount = 9
	itemGiveCard
		card = 157
		color = 2
		amount = 9
	itemGiveCard
		card = 158
		color = 2
		amount = 9
	itemGiveCard
		card = 160
		color = 2
		amount = 9
	itemGiveCard
		card = 161
		color = 2
		amount = 9
	itemGiveCard
		card = 163
		color = 2
		amount = 9
	itemGiveCard
		card = 164
		color = 2
		amount = 9
	itemGiveCard
		card = 166
		color = 2
		amount = 9
	itemGiveCard
		card = 167
		color = 2
		amount = 9
	end
}
script 42 mmsf1 {
	itemGiveCard
		card = 208
		color = 2
		amount = 1
	itemGiveCard
		card = 209
		color = 2
		amount = 1
	itemGiveCard
		card = 210
		color = 2
		amount = 1
	itemGiveCard
		card = 211
		color = 2
		amount = 1
	itemGiveCard
		card = 212
		color = 2
		amount = 1
	itemGiveCard
		card = 213
		color = 2
		amount = 1
	itemGiveCard
		card = 214
		color = 2
		amount = 1
	itemGiveCard
		card = 215
		color = 2
		amount = 1
	itemGiveCard
		card = 216
		color = 2
		amount = 1
	itemGiveCard
		card = 231
		color = 3
		amount = 1
	itemGiveCard
		card = 232
		color = 0
		amount = 1
	itemGiveCard
		card = 233
		color = 3
		amount = 1
	itemGiveCard
		card = 234
		color = 3
		amount = 1
	itemGiveCard
		card = 235
		color = 3
		amount = 1
	itemGiveCard
		card = 236
		color = 3
		amount = 1
	itemGiveCard
		card = 237
		color = 0
		amount = 1
	itemGiveCard
		card = 238
		color = 3
		amount = 1
	itemGiveCard
		card = 239
		color = 3
		amount = 1
	itemGiveCard
		card = 240
		color = 3
		amount = 1
	itemGiveCard
		card = 241
		color = 3
		amount = 1
	itemGiveCard
		card = 242
		color = 0
		amount = 1
	itemGiveCard
		card = 243
		color = 3
		amount = 1
	itemGiveCard
		card = 244
		color = 3
		amount = 1
	itemGiveCard
		card = 245
		color = 3
		amount = 1
	itemGiveCard
		card = 247
		color = 3
		amount = 1
	end
}
script 43 mmsf1 {
	msgOpen
	"Get All Cards"
	itemGiveCard
		card = 1
		color = 1
		amount = 9
	itemGiveCard
		card = 2
		color = 1
		amount = 9
	itemGiveCard
		card = 3
		color = 1
		amount = 9
	itemGiveCard
		card = 4
		color = 1
		amount = 9
	itemGiveCard
		card = 5
		color = 1
		amount = 9
	itemGiveCard
		card = 6
		color = 1
		amount = 9
	itemGiveCard
		card = 7
		color = 1
		amount = 9
	itemGiveCard
		card = 8
		color = 1
		amount = 9
	itemGiveCard
		card = 9
		color = 1
		amount = 9
	itemGiveCard
		card = 10
		color = 1
		amount = 9
	itemGiveCard
		card = 11
		color = 1
		amount = 9
	itemGiveCard
		card = 12
		color = 1
		amount = 9
	itemGiveCard
		card = 13
		color = 1
		amount = 9
	itemGiveCard
		card = 14
		color = 1
		amount = 9
	itemGiveCard
		card = 15
		color = 1
		amount = 9
	itemGiveCard
		card = 16
		color = 1
		amount = 9
	itemGiveCard
		card = 17
		color = 1
		amount = 9
	itemGiveCard
		card = 18
		color = 1
		amount = 9
	itemGiveCard
		card = 19
		color = 1
		amount = 9
	itemGiveCard
		card = 20
		color = 1
		amount = 9
	itemGiveCard
		card = 21
		color = 1
		amount = 9
	itemGiveCard
		card = 22
		color = 1
		amount = 9
	itemGiveCard
		card = 23
		color = 1
		amount = 9
	itemGiveCard
		card = 24
		color = 1
		amount = 9
	itemGiveCard
		card = 25
		color = 1
		amount = 9
	itemGiveCard
		card = 26
		color = 1
		amount = 9
	itemGiveCard
		card = 27
		color = 1
		amount = 9
	itemGiveCard
		card = 28
		color = 1
		amount = 9
	itemGiveCard
		card = 29
		color = 1
		amount = 9
	itemGiveCard
		card = 30
		color = 1
		amount = 9
	itemGiveCard
		card = 31
		color = 1
		amount = 9
	itemGiveCard
		card = 32
		color = 1
		amount = 9
	itemGiveCard
		card = 33
		color = 1
		amount = 9
	itemGiveCard
		card = 34
		color = 1
		amount = 9
	itemGiveCard
		card = 35
		color = 1
		amount = 9
	itemGiveCard
		card = 36
		color = 1
		amount = 9
	itemGiveCard
		card = 37
		color = 1
		amount = 9
	itemGiveCard
		card = 38
		color = 1
		amount = 9
	itemGiveCard
		card = 39
		color = 1
		amount = 9
	itemGiveCard
		card = 40
		color = 1
		amount = 9
	itemGiveCard
		card = 41
		color = 1
		amount = 9
	itemGiveCard
		card = 42
		color = 1
		amount = 9
	itemGiveCard
		card = 43
		color = 1
		amount = 9
	itemGiveCard
		card = 44
		color = 1
		amount = 9
	itemGiveCard
		card = 45
		color = 1
		amount = 9
	itemGiveCard
		card = 46
		color = 1
		amount = 9
	itemGiveCard
		card = 47
		color = 1
		amount = 9
	itemGiveCard
		card = 48
		color = 1
		amount = 9
	itemGiveCard
		card = 49
		color = 1
		amount = 9
	itemGiveCard
		card = 50
		color = 1
		amount = 9
	itemGiveCard
		card = 51
		color = 1
		amount = 9
	itemGiveCard
		card = 52
		color = 1
		amount = 9
	itemGiveCard
		card = 53
		color = 1
		amount = 9
	itemGiveCard
		card = 54
		color = 1
		amount = 9
	itemGiveCard
		card = 55
		color = 1
		amount = 9
	itemGiveCard
		card = 56
		color = 1
		amount = 9
	itemGiveCard
		card = 57
		color = 1
		amount = 9
	itemGiveCard
		card = 58
		color = 1
		amount = 9
	itemGiveCard
		card = 59
		color = 1
		amount = 9
	itemGiveCard
		card = 60
		color = 1
		amount = 9
	itemGiveCard
		card = 61
		color = 1
		amount = 9
	itemGiveCard
		card = 62
		color = 1
		amount = 9
	itemGiveCard
		card = 63
		color = 1
		amount = 9
	itemGiveCard
		card = 64
		color = 1
		amount = 9
	itemGiveCard
		card = 65
		color = 1
		amount = 9
	itemGiveCard
		card = 66
		color = 1
		amount = 9
	itemGiveCard
		card = 67
		color = 1
		amount = 9
	itemGiveCard
		card = 68
		color = 1
		amount = 9
	itemGiveCard
		card = 69
		color = 1
		amount = 9
	itemGiveCard
		card = 70
		color = 1
		amount = 9
	itemGiveCard
		card = 71
		color = 1
		amount = 9
	itemGiveCard
		card = 72
		color = 1
		amount = 9
	itemGiveCard
		card = 73
		color = 1
		amount = 9
	itemGiveCard
		card = 74
		color = 1
		amount = 9
	itemGiveCard
		card = 75
		color = 1
		amount = 9
	itemGiveCard
		card = 76
		color = 1
		amount = 9
	itemGiveCard
		card = 77
		color = 1
		amount = 9
	itemGiveCard
		card = 78
		color = 1
		amount = 9
	itemGiveCard
		card = 79
		color = 1
		amount = 9
	itemGiveCard
		card = 80
		color = 1
		amount = 9
	itemGiveCard
		card = 81
		color = 1
		amount = 9
	itemGiveCard
		card = 82
		color = 1
		amount = 9
	itemGiveCard
		card = 83
		color = 1
		amount = 9
	itemGiveCard
		card = 84
		color = 1
		amount = 9
	itemGiveCard
		card = 85
		color = 1
		amount = 9
	itemGiveCard
		card = 86
		color = 1
		amount = 9
	itemGiveCard
		card = 87
		color = 1
		amount = 9
	itemGiveCard
		card = 88
		color = 1
		amount = 9
	itemGiveCard
		card = 89
		color = 1
		amount = 9
	itemGiveCard
		card = 90
		color = 1
		amount = 9
	itemGiveCard
		card = 91
		color = 1
		amount = 9
	itemGiveCard
		card = 92
		color = 1
		amount = 9
	itemGiveCard
		card = 93
		color = 1
		amount = 9
	itemGiveCard
		card = 94
		color = 1
		amount = 9
	itemGiveCard
		card = 95
		color = 1
		amount = 9
	itemGiveCard
		card = 96
		color = 1
		amount = 9
	itemGiveCard
		card = 97
		color = 1
		amount = 9
	itemGiveCard
		card = 98
		color = 1
		amount = 9
	itemGiveCard
		card = 99
		color = 1
		amount = 9
	itemGiveCard
		card = 100
		color = 1
		amount = 9
	itemGiveCard
		card = 101
		color = 1
		amount = 9
	itemGiveCard
		card = 102
		color = 1
		amount = 9
	itemGiveCard
		card = 103
		color = 1
		amount = 9
	itemGiveCard
		card = 104
		color = 1
		amount = 9
	itemGiveCard
		card = 105
		color = 1
		amount = 9
	itemGiveCard
		card = 106
		color = 1
		amount = 9
	itemGiveCard
		card = 107
		color = 1
		amount = 9
	itemGiveCard
		card = 108
		color = 1
		amount = 9
	itemGiveCard
		card = 109
		color = 1
		amount = 9
	itemGiveCard
		card = 110
		color = 1
		amount = 9
	itemGiveCard
		card = 111
		color = 1
		amount = 9
	itemGiveCard
		card = 112
		color = 1
		amount = 9
	itemGiveCard
		card = 113
		color = 1
		amount = 9
	itemGiveCard
		card = 114
		color = 1
		amount = 9
	itemGiveCard
		card = 115
		color = 1
		amount = 9
	itemGiveCard
		card = 116
		color = 1
		amount = 9
	itemGiveCard
		card = 117
		color = 1
		amount = 9
	itemGiveCard
		card = 118
		color = 1
		amount = 9
	itemGiveCard
		card = 119
		color = 1
		amount = 9
	itemGiveCard
		card = 120
		color = 1
		amount = 9
	itemGiveCard
		card = 121
		color = 1
		amount = 9
	itemGiveCard
		card = 122
		color = 1
		amount = 9
	itemGiveCard
		card = 123
		color = 1
		amount = 9
	itemGiveCard
		card = 124
		color = 1
		amount = 9
	itemGiveCard
		card = 125
		color = 1
		amount = 9
	itemGiveCard
		card = 126
		color = 1
		amount = 9
	itemGiveCard
		card = 127
		color = 1
		amount = 9
	itemGiveCard
		card = 128
		color = 1
		amount = 9
	itemGiveCard
		card = 129
		color = 1
		amount = 9
	itemGiveCard
		card = 130
		color = 1
		amount = 9
	itemGiveCard
		card = 131
		color = 1
		amount = 9
	itemGiveCard
		card = 132
		color = 1
		amount = 9
	itemGiveCard
		card = 133
		color = 1
		amount = 9
	itemGiveCard
		card = 134
		color = 1
		amount = 9
	itemGiveCard
		card = 135
		color = 1
		amount = 9
	itemGiveCard
		card = 136
		color = 1
		amount = 9
	itemGiveCard
		card = 137
		color = 1
		amount = 9
	itemGiveCard
		card = 138
		color = 1
		amount = 9
	itemGiveCard
		card = 139
		color = 0
		amount = 9
	itemGiveCard
		card = 140
		color = 1
		amount = 9
	itemGiveCard
		card = 141
		color = 1
		amount = 9
	itemGiveCard
		card = 142
		color = 1
		amount = 9
	itemGiveCard
		card = 143
		color = 1
		amount = 9
	itemGiveCard
		card = 144
		color = 0
		amount = 9
	itemGiveCard
		card = 145
		color = 0
		amount = 9
	itemGiveCard
		card = 146
		color = 0
		amount = 9
	itemGiveCard
		card = 147
		color = 0
		amount = 9
	itemGiveCard
		card = 148
		color = 0
		amount = 9
	itemGiveCard
		card = 149
		color = 0
		amount = 9
	itemGiveCard
		card = 150
		color = 0
		amount = 9
	itemGiveCard
		card = 151
		color = 1
		amount = 9
	itemGiveCard
		card = 152
		color = 1
		amount = 9
	itemGiveCard
		card = 154
		color = 1
		amount = 9
	itemGiveCard
		card = 155
		color = 1
		amount = 9
	itemGiveCard
		card = 157
		color = 1
		amount = 9
	itemGiveCard
		card = 158
		color = 1
		amount = 9
	itemGiveCard
		card = 160
		color = 1
		amount = 9
	itemGiveCard
		card = 161
		color = 1
		amount = 9
	itemGiveCard
		card = 163
		color = 1
		amount = 9
	itemGiveCard
		card = 164
		color = 1
		amount = 9
	itemGiveCard
		card = 166
		color = 1
		amount = 9
	itemGiveCard
		card = 167
		color = 1
		amount = 9
	end
	itemGiveCard
		card = 181
		color = 2
		amount = 9
	itemGiveCard
		card = 182
		color = 2
		amount = 9
	itemGiveCard
		card = 183
		color = 2
		amount = 9
	itemGiveCard
		card = 184
		color = 2
		amount = 9
	itemGiveCard
		card = 185
		color = 2
		amount = 9
	itemGiveCard
		card = 186
		color = 2
		amount = 9
	itemGiveCard
		card = 187
		color = 2
		amount = 9
	itemGiveCard
		card = 188
		color = 2
		amount = 9
	itemGiveCard
		card = 189
		color = 2
		amount = 9
	itemGiveCard
		card = 190
		color = 2
		amount = 9
	itemGiveCard
		card = 191
		color = 2
		amount = 9
	itemGiveCard
		card = 192
		color = 2
		amount = 9
	itemGiveCard
		card = 193
		color = 2
		amount = 9
	itemGiveCard
		card = 194
		color = 2
		amount = 9
	itemGiveCard
		card = 195
		color = 2
		amount = 9
	itemGiveCard
		card = 196
		color = 2
		amount = 9
	itemGiveCard
		card = 197
		color = 2
		amount = 9
	itemGiveCard
		card = 198
		color = 2
		amount = 9
	itemGiveCard
		card = 199
		color = 2
		amount = 9
	itemGiveCard
		card = 200
		color = 2
		amount = 9
	itemGiveCard
		card = 201
		color = 2
		amount = 9
	itemGiveCard
		card = 202
		color = 2
		amount = 9
	itemGiveCard
		card = 203
		color = 2
		amount = 9
	itemGiveCard
		card = 204
		color = 2
		amount = 9
	itemGiveCard
		card = 205
		color = 2
		amount = 9
	itemGiveCard
		card = 206
		color = 2
		amount = 9
	itemGiveCard
		card = 207
		color = 2
		amount = 9
	itemGiveCard
		card = 208
		color = 2
		amount = 9
	itemGiveCard
		card = 209
		color = 2
		amount = 9
	itemGiveCard
		card = 210
		color = 2
		amount = 9
	itemGiveCard
		card = 211
		color = 2
		amount = 9
	itemGiveCard
		card = 212
		color = 2
		amount = 9
	itemGiveCard
		card = 213
		color = 2
		amount = 9
	itemGiveCard
		card = 214
		color = 2
		amount = 9
	itemGiveCard
		card = 215
		color = 2
		amount = 9
	itemGiveCard
		card = 216
		color = 2
		amount = 9
	itemGiveCard
		card = 231
		color = 3
		amount = 9
	itemGiveCard
		card = 232
		color = 0
		amount = 9
	itemGiveCard
		card = 233
		color = 3
		amount = 9
	itemGiveCard
		card = 234
		color = 3
		amount = 9
	itemGiveCard
		card = 235
		color = 3
		amount = 9
	itemGiveCard
		card = 236
		color = 3
		amount = 9
	itemGiveCard
		card = 237
		color = 0
		amount = 9
	itemGiveCard
		card = 238
		color = 3
		amount = 9
	itemGiveCard
		card = 239
		color = 3
		amount = 9
	itemGiveCard
		card = 240
		color = 3
		amount = 9
	itemGiveCard
		card = 241
		color = 3
		amount = 9
	itemGiveCard
		card = 242
		color = 0
		amount = 9
	itemGiveCard
		card = 243
		color = 3
		amount = 9
	itemGiveCard
		card = 244
		color = 3
		amount = 9
	itemGiveCard
		card = 245
		color = 3
		amount = 9
	itemGiveCard
		card = 247
		color = 3
		amount = 9
}
script 44 mmsf1 {
	msgOpen
	callReadCardID
		buffer = 4
	"ID: "
	printBuffer
		buffer = 4
		minLength = 3
		padMode = leftPadZeroes
	"-"
	printBuffer
		buffer = 5
		minLength = 3
		padMode = leftPadZeroes
	"-"
	printBuffer
		buffer = 6
		minLength = 3
		padMode = leftPadZeroes
	"-"
	printBuffer
		buffer = 7
		minLength = 3
		padMode = leftPadZeroes
	keyWait
	clearMsg
	end
}