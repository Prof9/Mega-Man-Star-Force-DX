@archive mess_0285
@size 28

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"I've got a call."
	keyWait
	clearMsg
	"Hello?"
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	You're that guy
	from before!
	"""
	keyWait
	clearMsg
	"""
	What do you want
	now!?
	"""
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"He hung up."
	keyWait
	clearMsg
	"""
	What the heck is
	that supposed to
	mean? "Trashed"?
	"""
	keyWait
	clearMsg
	jump
		target = 6
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Yeah..."
	keyWait
	end
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"What's going on?"
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Intruder?"
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
	Disposal? They
	don't mean...
	"""
	keyWait
	end
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Me!?"
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	They're over
	here too!
	"""
	keyWait
	clearMsg
	"""
	I must be the
	one they're
	after...
	"""
	keyWait
	clearMsg
	"But why?"
	keyWait
	clearMsg
	"""
	Ack! And Pat!
	
	"""
	keyWait
	end
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Where is he!?"
	keyWait
	clearMsg
	"""
	No... They
	didn't "dispose"
	him,did they!?
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"Gotcha!"
	keyWait
	end
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"Ah!"
	keyWait
	end
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"A wavehole!"
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"Roger!"
	keyWait
	end
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
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
	end
	end
}
