@archive mess_0451
@size 256

script 31 mmsf1 {
	checkFlag
		flag = 2149
		jumpIfTrue = 32
		jumpIfFalse = continue
	flagSet
		flag = 2149
	msgOpen
	mugshotShowNPC
		npc = 4
	"Yes...?"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Um... I sort of
	have something
	I want to ask...
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	Sorry,sonny,but
	I don't want to
	talk right now.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"........."
	keyWait
	clearMsg
	mugshotHide
	printPlayerName1
	"""
	 showed:
	"
	"""
	printItem
		item = 59
	"""
	" to
	Mr.Gatte.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"Th-That's..."
	keyWait
	clearMsg
	"""
	That's Tropical
	Tea,isn't it!?
	"""
	keyWait
	clearMsg
	"""
	Oh,please let me
	have it! It's my
	favorite!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Um,well,can you
	answer my
	question first?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	If it's just a
	question,then
	sure!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"Well,you see..."
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	So you are
	Kelvin's son...
	"""
	keyWait
	clearMsg
	"""
	...Yes,I was the
	one in charge of
	that tragic
	"""
	keyWait
	clearMsg
	"""
	space station
	mission...
	"""
	keyWait
	clearMsg
	"""
	I have wronged
	him in the worst
	way possible...
	"""
	keyWait
	clearMsg
	"""
	And no matter
	how much I want
	to apologize,
	"""
	keyWait
	clearMsg
	"""
	I don't expect
	I'll ever be
	forgiven.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	But you can make
	up for what you
	did,sir.
	"""
	keyWait
	clearMsg
	"""
	There was a
	piece of the
	station that
	"""
	keyWait
	clearMsg
	"""
	fell back to
	Earth after the
	incident,right?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	A-Are you
	thinking of
	using it to
	"""
	keyWait
	clearMsg
	"""
	communicate with
	the station's
	main section?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"...Yes."
	keyWait
	clearMsg
	"""
	If I don't,the
	whole world will
	be in danger!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	That look in
	your eyes...
	"""
	keyWait
	clearMsg
	"""
	You remind me
	so much of your
	father...
	"""
	keyWait
	clearMsg
	"""
	Alright. I'll
	tell you where
	"""
	keyWait
	clearMsg
	"""
	I hid that piece
	of the space
	station.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"Really!?"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"Yeah..."
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"So where is it?"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	Where is it...?
	Hmm... Where did
	I hide it...?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"What!?"
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	Well,see... In
	order to stop
	myself from ever
	"""
	keyWait
	clearMsg
	"""
	telling someone
	where I'd hidden
	it by accident,
	"""
	keyWait
	clearMsg
	"""
	I used an
	ancient secret
	technique to
	"""
	keyWait
	clearMsg
	"""
	wipe that
	knowledge from
	my mind.
	"""
	keyWait
	clearMsg
	"""
	But ever since I
	did that,
	"""
	keyWait
	clearMsg
	"""
	my memory's just
	gotten worse and
	worse. Ha ha.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Geo
	"""
	Th-Then,you have
	no idea where it
	is...?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	Oh,nothing of
	the sort,sonny.
	I figured that
	"""
	keyWait
	clearMsg
	"""
	someone would
	ask me someday,
	so I hid the
	"""
	keyWait
	clearMsg
	"""
	location in a
	piece of data
	somewhere.
	"""
	keyWait
	clearMsg
	"""
	I'm pretty sure
	it's in the
	research
	"""
	keyWait
	clearMsg
	"""
	facility of one
	of my past
	subordinates.
	"""
	keyWait
	clearMsg
	"""
	I hid it with a
	program in
	something that
	"""
	keyWait
	clearMsg
	"""
	has to do with
	the space
	station.
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Subordinate...?
	Are you talking
	about Mr.Boreal?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	Oh! Yes,that's
	the fellow!
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	Who would've
	thought it would
	be at AMAKEN?
	"""
	keyWait
	clearMsg
	"""
	If it's with a
	program...
	Sounds like we
	"""
	keyWait
	clearMsg
	"""
	should check out
	some Comp
	Spaces.
	"""
	keyWait
	clearMsg
	"""
	And something
	related to the
	space station...
	"""
	keyWait
	clearMsg
	"""
	OK,let's try to
	find this thing!
	"""
	keyWait
	clearMsg
	"""
	Thanks a lot,
	Mr.Gatte!
	"""
	keyWait
	clearMsg
	mugshotHide
	printPlayerName1
	"""
	 gave:
	"Tropical Tea"
	to Mr.Gatte!
	"""
	keyWait
	clearMsg
	itemTake
		item = 59
		amount = 1
	mugshotShowNPC
		npc = 0
	"""
	Hmm,but why did
	you want to hide
	it anyway?
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"........."
	keyWait
	clearMsg
	"""
	I heard a piece
	of the message
	that the station
	"""
	keyWait
	clearMsg
	"""
	was broadcasting
	at the time of
	the incident.
	"""
	keyWait
	clearMsg
	"""
	When I heard
	that the FM-ians
	were coming to
	"""
	keyWait
	clearMsg
	"""
	Earth,I was
	scared out of
	my wits.
	"""
	keyWait
	clearMsg
	"""
	And then,a piece
	of the station
	fell to Earth.
	"""
	keyWait
	clearMsg
	"""
	When we examined
	it,we found the
	station's
	"""
	keyWait
	clearMsg
	"""
	communication
	equipment was
	still onboard.
	"""
	keyWait
	clearMsg
	"""
	It was broken,
	but from that,
	we could get an
	"""
	keyWait
	clearMsg
	"""
	idea of where
	the space
	station was.
	"""
	keyWait
	clearMsg
	"""
	However,by the
	same logic,the
	FM-ians could
	"""
	keyWait
	clearMsg
	"""
	find out where
	Earth was.
	So in order to
	"""
	keyWait
	clearMsg
	"""
	prevent that,I
	tried to isolate
	the piece in a
	"""
	keyWait
	clearMsg
	"""
	place where no
	one would ever
	find it.
	"""
	keyWait
	clearMsg
	"""
	I'm really sorry
	for cutting the
	crew of the
	"""
	keyWait
	clearMsg
	"""
	space station
	off like that,
	and I did fix
	"""
	keyWait
	clearMsg
	"""
	the transmitter
	in case we ever
	needed to use
	"""
	keyWait
	clearMsg
	"""
	it to make
	contact,but as
	the one who was
	"""
	keyWait
	clearMsg
	"""
	responsible for
	the mission,I
	had to do what I
	"""
	keyWait
	clearMsg
	"""
	did to protect
	the Earth from
	the invaders...
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	......I see.
	So NAZA...
	"""
	keyWait
	clearMsg
	"""
	didn't really
	abandon my
	dad...
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 4
	"""
	But in essence,
	we did...
	"""
	keyWait
	clearMsg
	"""
	I'm really sorry
	for what I've
	done...
	"""
	keyWait
	clearMsg
	mugshotShowNPC
		npc = 0
	"""
	...No,I think
	my dad would
	understand.
	"""
	keyWait
	clearMsg
	"""
	Thank you very
	much.
	"""
	keyWait
	end
	end
}