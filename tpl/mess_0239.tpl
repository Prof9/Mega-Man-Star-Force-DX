@archive mess_0239
@size 40

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	Everything's all
	packed and I'm
	ready to go...
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	It's none of
	your business...
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
	"Friends?"
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
	"""
	Me,join your
	group?
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
		mugshot = Geo
	"...I'm happy,but"
	keyWait
	clearMsg
	"""
	I don't really
	know if I can
	be a good friend
	"""
	keyWait
	clearMsg
	"""
	to anyone yet...
	So...
	
	"""
	keyWait
	clearMsg
	"I'm sorry."
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"""
	You mean the
	Prez's goon
	squad?
	"""
	keyWait
	clearMsg
	"""
	I don't even
	know where to
	begin...
	"""
	keyWait
	clearMsg
	jump
		target = 21
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Then what!?"
	keyWait
	clearMsg
	jump
		target = 23
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = EMHuman
	"JammmJammmm!!"
	keyWait
	clearMsg
	jump
		target = 29
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	Luna! Get back!
	Those 2 are
	imposters!!
	"""
	keyWait
	clearMsg
	mugshotHide
	"Heh heh heh!!"
	keyWait
	clearMsg
	"""
	You're in quite
	the dilemma,
	
	"""
	printPlayerName1
	" "
	printPlayerName2
	"!!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"Wh-Who's there!?"
	keyWait
	end
	end
}
script 34 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	mugshotAnimation
		animation = 1
	"(Argh!!)"
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(I can't change
	into MegaMan in
	front of Luna!)
	"""
	keyWait
	clearMsg
	jump
		target = 35
	end
}
script 38 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoVisualizer
	"""
	All we can do
	right now is
	retreat!
	"""
	keyWait
	clearMsg
	"""
	So first,let's
	get out of the
	school!!
	"""
	keyWait
	clearMsg
	"""
	Come on,Luna!
	RUN!!
	"""
	keyWait
	clearMsg
	jump
		target = 39
	end
}
