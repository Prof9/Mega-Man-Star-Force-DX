@archive mess_0058
@size 30

script 2 mmsf1 {
	checkFlag
		flag = 6229
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 6167
		jumpIfTrue = 6
		jumpIfFalse = continue
	checkChapter
		lower = 0
		upper = 68
		jumpIfInRange = 3
		jumpIfOutOfRange = 4
	jump
		target = 3
	end
}