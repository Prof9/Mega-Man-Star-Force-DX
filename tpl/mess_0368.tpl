@archive mess_0368
@size 12

script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"I know!"
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
	"\n......"
	keyWait
	end
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"Aah!"
	keyWait
	soundPlayBGM
		music = 22
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	No!! The
	wavehole is...!!
	"""
	keyWait
	clearMsg
	"""
	I can't go back
	to Earth now...
	"""
	keyWait
	clearMsg
	"Wh-What now...?"
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	I thought I
	heard my dad's
	voice just now.
	"""
	keyWait
	clearMsg
	"""
	He said to go
	over here...
	"""
	keyWait
	end
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"This switch..."
	keyWait
	clearMsg
	mugshotShow
		mugshot = GeoHappy
	"""
	I think I can
	disconnect this
	module!
	"""
	keyWait
	clearMsg
	"""
	Maybe we can
	get back to
	Earth,Mega!!
	"""
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
	My dad showed
	me this space
	station's
	"""
	keyWait
	clearMsg
	"""
	control panel
	once a long time
	ago...
	"""
	keyWait
	clearMsg
	"""
	so I think I
	can...
	
	"""
	keyWait
	clearMsg
	"Closing hatch..."
	keyWait
	end
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Now launching
	the emergency
	escape module!
	"""
	keyWait
	end
	end
}
