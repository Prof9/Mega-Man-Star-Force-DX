@archive mess_1227
@size 10

script 1 mmsf1 {
	msgOpenQuick
	mugshotShow
		mugshot = Geo
	"""
	Save data is
	corrupt and
	will be deleted.
	"""
	keyWait
	clearMsg
	"""
	Now deleting
	corrupted
	data...
	"""
	checkSaveInit
		jumpIfFailed = 2
	checkSaveInitFinished
		jumpIfSuccessful = 3
	jump
		target = 2
}
