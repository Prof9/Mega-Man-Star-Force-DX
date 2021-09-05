@archive mess_1266
@size 10

script 0 mmsf1 {
	msgOpen
	mugshotShowGeo
	"""
	Alright,let's
	try restoring
	the data...
	"""
	keyWait
	clearMsg
	"""
	Uploading...
	"""
	keyWait
	clearMsg
	mugshotHide
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	"."
	wait
		frames = 30
	keyWait
	clearMsg
	"""
	Initializing
	Personality
	Program...
	"""
	keyWait
	clearMsg
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Greetings!
	I am the world-
	renowned
	"""
	keyWait
	clearMsg
	"""
	authority on
	all things
	NetBattling...
	"""
	keyWait
	clearMsg
	"""
	They call me...
	Mr.Famous,
	Mark II!
	"""
	keyWait
	clearMsg
	"""
	But you can just
	call me Mark II!
	"""
	keyWait
	clearMsg
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KenSuther
	"""
	Whoa... Time out.
	Did you just say
	"NetBattling"?
	"""
	keyWait
	clearMsg
	"""
	You mean,like...
	That thing people
	used to do with
	"""
	keyWait
	clearMsg
	"""
	their Navis in
	order to delete
	EM viruses?
	"""
	keyWait
	clearMsg
	"""
	These days,we
	just use Battle
	Cards directly,
	"""
	keyWait
	clearMsg
	"""
	so NetBattling
	is totally washed
	up,y'know?
	"""
	keyWait
	clearMsg
	"""
	Well,one thing's
	for sure. Guess
	this won't be
	"""
	keyWait
	clearMsg
	"""
	much use as a
	store assistant,
	after all...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MrFamous
	"""
	Not so fast!
	"""
	keyWait
	clearMsg
	"""
	BattleChips and
	Battle Cards...
	"""
	keyWait
	clearMsg
	"""
	They're not so
	different as you
	might think!
	"""
	keyWait
	clearMsg
	"""
	There's no one
	who knows more
	about battling
	"""
	keyWait
	clearMsg
	"""
	than me. And I'd
	be happy to help
	with the store!
	"""
	keyWait
	clearMsg
	"""
	I look forward
	to raising a
	new generation
	"""
	keyWait
	clearMsg
	"""
	of promising
	young Wave
	Battlers!
	"""
	keyWait
	clearMsg
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = ClaudPincer
	"""
	You know
	Mr.Suther...
	"""
	keyWait
	clearMsg
	"""
	This guy might
	not be half bad!
	Snippidy-snap!
	"""
	keyWait
	clearMsg
	"""
	Heh heh! In fact,
	he might just come
	in real handy!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	You think?
	Hmmm...
	"""
	keyWait
	clearMsg
	"""
	Oh,what the heck!
	Welcome aboard,
	Famous-dude!
	"""
	keyWait
	clearMsg
	"""
	You and I are
	going to make
	some waves!
	"""
	keyWait
	clearMsg
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MrFamous
	"""
	Glad to be
	of service!
	"""
	keyWait
	clearMsg
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = KenSuther
	"""
	And Geo,my man!
	Thanks a bunch
	for your help!
	"""
	keyWait
	clearMsg
	"""
	Here. Why don't
	you take this
	ultra-rare card?
	"""
	keyWait
	clearMsg
	mugshotHide
	soundPlay
		sound = 203
	storeOWVar
		variable = 0
		value = 5
	"""
	Geo got:
	"
	"""
	printCard
		card = 170
	"""
	"!!
	"""
	keyWait
	waitOWVar
		variable = 0
		value = 6
	storeOWVar
		variable = 0
		value = 7
	clearMsg
	mugshotShow
		mugshot = KenSuther
	"""
	And uh...
	I dunno how much
	it's worth yet,
	"""
	keyWait
	clearMsg
	"""
	but feel free to
	use Mark II here
	anytime you want.
	"""
	keyWait
	clearMsg
	end
}