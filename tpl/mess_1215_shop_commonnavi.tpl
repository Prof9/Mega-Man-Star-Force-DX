@archive mess_1215
@size 40

script 25 mmsf1 {
	msgOpenQuick
	mugshotHide
	textSpeed
		delay = 0
	"\n\n"
	spacePx
		count = 82
	printBuffer
		buffer = 4
		minLength = 5
		padMode = noPad
	"[z]"
	waitHold
	end
}