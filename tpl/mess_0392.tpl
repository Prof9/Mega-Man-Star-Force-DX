@archive mess_0392
@size 100

script 61 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Head for the
	AMAKEN rooftop
	EM-Road!
	"""
	keyWait
	end
	end
}
script 62 mmsf1 {
	checkFlag
		flag = 97
		jumpIfTrue = continue
		jumpIfFalse = 61
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Aren't we going
	to that Dream
	Island place?
	"""
	keyWait
	end
	end
}
