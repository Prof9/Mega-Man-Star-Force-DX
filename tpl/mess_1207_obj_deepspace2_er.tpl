@archive mess_1207
@size 20

script 4 mmsf1 {
	checkLibrary
		library = 0
		amount = 150
		jumpIfEnough = 9
		jumpIfNotEnough = continue
	msgOpen
	"""
	This door only opens
	for he who obtains
	150 Standard Class cards...
	"""
	keyWait
	end
	end
}
script 9 mmsf1 {
	msgOpen
	"""
	You, who has obtained
	150 Standard Class
	cards may pass.
	"""
	keyWait
	flagClear
		flag = 195
	callReceiveMail
		flag = 5658
		markRead = false
	end
}
script 10 mmsf1 {
	end
}
script 11 mmsf1 {
	end
}
script 12 mmsf1 {
	end
}