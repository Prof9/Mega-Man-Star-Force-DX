@archive mess_1220
@size 256

script 60 mmsf1 {
	checkFlag
		flag = 2177
		jumpIfTrue = 120
		jumpIfFalse = continue
	flagSet
		flag = 2177
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	I've buried it
	underneath
	Dream Island...
	"""
	keyWait
	clearMsg
	"""
	The entrance to
	it is hidden
	under rubbish,
	"""
	keyWait
	clearMsg
	"""
	but remove the
	trash and you
	can get to it.
	"""
	waitHold
	end
}
script 69 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	An album full of
	songs performed
	by Sonia.
	"""
	keyWait
	clearMsg
	"""
	This is written
	on a leaflet
	inside the case:
	"""
	keyWait
	clearMsg
	"\"DWOWOOLFS\""
	waitHold
	end
}
script 81 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Equip and the
	Buster will...
	"""
	keyWait
	waitHold
	end
}
script 82 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	PropellerMan's
	Navi Card.
	"""
	keyWait
	clearMsg
	"""
	Use this card to
	have PropellerMan
	fly RC choppers.
	"""
	waitHold
	end
}
script 83 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Turn Legend Mode
	ON/OFF. Enemies
	power up and...
	"""
	keyWait
	waitHold
	end
}
script 84 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	A chip that holds
	Navi data. Needed
	to operate robots.
	"""
	waitHold
	end
}
script 85 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Mystery data full
	of wisdom from a
	bygone era.
	"""
	waitHold
	end
}
script 86 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	callBufferStarFrags
		buffer = 4
	"""
	Rare star pieces.
	Maybe someone
	collects them?
	"""
	keyWait
	clearMsg
	"""
	(You have:
	
	"""
	printBuffer
		buffer = 4
		minLength = 6
		padMode = noPad
	"""
	)
	"""
	waitHold
	end
}
script 87 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Equip for a look
	that is somehow
	familiar...
	"""
	keyWait
	waitHold
	end
}
script 88 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	A brilliant golden
	Card Force that
	powers up bosses.
	"""
	keyWait
	waitHold
	end
}
script 89 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Equip for a look
	that is sure to
	dazzle everyone.
	"""
	keyWait
	waitHold
	end
}
script 90 mmsf1 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	Data that improves
	MegaMan's stats
	and abilities.
	"""
	keyWait
	waitHold
	end
}
script 92 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Increases chance
	of meeting Fire
	elemental enemy.
	"""
	waitHold
	end
}
script 93 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Increases chance
	of meeting Aqua
	elemental enemy.
	"""
	waitHold
	end
}
script 94 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Increases chance
	of meeting Elec
	elemental enemy.
	"""
	waitHold
	end
}
script 95 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Increases chance
	of meeting Wood
	elemental enemy.
	"""
	waitHold
	end
}
script 96 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	A small energy
	boost that
	restores 50 HP.
	"""
	waitHold
	end
}
script 97 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	A large energy
	boost that
	restores 200 HP.
	"""
	waitHold
	end
}
script 98 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	A deluxe energy
	boost that
	restores all HP.
	"""
	waitHold
	end
}
script 99 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Item that auto-
	unlocks purple
	mystery waves.
	"""
	waitHold
	end
}
script 100 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Makes your body
	invisible for a
	little while.
	"""
	waitHold
	end
}
script 101 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Increases chance
	of meeting the
	previous enemy.
	"""
	waitHold
	end
}
script 102 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Item that auto-
	unlocks red
	mystery waves.
	"""
	waitHold
	end
}
script 103 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Equip
	on your head.
	"""
	waitHold
	end
}
script 104 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Equip
	on your torso.
	"""
	waitHold
	end
}
script 105 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Equip
	on your legs.
	"""
	waitHold
	end
}
script 106 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Rare item
	enhances shields.
	"""
	waitHold
	end
}
script 107 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Fully
	revives an ally.
	"""
	waitHold
	end
}
script 108 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Grants
	temp. invincible.
	"""
	waitHold
	end
}
script 109 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Dark
	Sword Junk Parts.
	"""
	waitHold
	end
}
script 110 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	For use w/Lunar
	Knights. Solar
	Gun Junk Parts.
	"""
	waitHold
	end
}
script 112 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Item that makes
	your max HP go
	up by 10.
	"""
	waitHold
	end
}
script 113 mmsf1 {
	msgOpenQuick
	callMugshotShowGeoMenu
	textSpeed
		delay = 0
	"""
	Item that makes
	your max HP go
	up by 20.
	"""
	waitHold
	end
}
