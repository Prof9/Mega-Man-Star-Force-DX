@archive mess_0355
@size 7

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	ThermoMan,
	I'm counting
	on you...
	"""
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = GeoHappy
	"Much better."
	keyWait
	clearMsg
	"""
	Thanks,
	ThermoMan!
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
		mugshot = GeoHappy
	"""
	The air's pretty
	stable,so back
	to the pile!
	"""
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Geo
	"""
	No good... It's
	not responding.
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
