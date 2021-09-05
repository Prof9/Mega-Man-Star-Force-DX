@archive mess_0185
@size 12

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	So I'm supposed
	to wait while
	Mega lures 
	"""
	keyWait
	clearMsg
	"""
	Mr.Copper here.
	He sure is
	taking a while.
	"""
	keyWait
	clearMsg
	"""
	I wonder if he's
	OK? He didn't
	get caught on
	"""
	keyWait
	clearMsg
	"""
	the way here,
	did he...?
	
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
		mugshot = GeoVisualizer
	"He's coming!!"
	keyWait
	clearMsg
	soundFadeOutBGM
		length = 120
	jump
		target = 3
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	PitcherMan Card,
	Card In!
	"""
	keyWait
	end
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	Wh-Wh-What!?
	Is he OK!?
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"Ah,um... Yeah..."
	keyWait
	end
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = PitcherMan
	"""
	One hot pitch
	comin' right up!
	"""
	keyWait
	end
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = PitcherMan
	"""
	STRIIIIIIIKE!!
	Batter out!!
	"""
	keyWait
	clearMsg
	end
}
