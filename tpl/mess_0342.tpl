@archive mess_0342
@size 41

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	So... This is
	the piece of my
	dad's station...
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	It doesn't look
	too bad,
	so I think the
	"""
	keyWait
	clearMsg
	"""
	main system is
	probably still
	intact. But I
	"""
	keyWait
	clearMsg
	"""
	may not know
	enough to fix
	it...
	"""
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Who's there!?"
	keyWait
	end
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"M-Mr.Boreal?"
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Why are you
	here?
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Mr.Gatte..."
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Wait! Please!
	Don't tell NAZA,
	Mr.Boreal!
	"""
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"I... Well..."
	keyWait
	soundStop
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Another
	earthquake!?
	"""
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	It was able to
	make it down
	here!?
	"""
	keyWait
	end
	jump
		target = 16
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Gemini!!"
	keyWait
	clearMsg
	soundPlayBGM
		music = 22
	jump
		target = 18
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Aaaaaaaaah!!"
	keyWait
	clearMsg
	jump
		target = 21
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Nngh..."
	keyWait
	clearMsg
	jump
		target = 24
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	mugshotAnimation
		animation = 1
	"""
	(If I transform,
	it would leave
	me wide open.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(My only option
	is to somehow
	slow him down.)
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Even just a
	little...)
	
	"""
	keyWait
	clearMsg
	jump
		target = 26
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"*gasp!*"
	keyWait
	end
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"P-Pat!"
	keyWait
	clearMsg
	jump
		target = 31
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Gotcha!"
	keyWait
	clearMsg
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
	keyWait
	end
	end
}