@archive mess_1271
@size 256

script 0 mmsf1 {
	checkFlag
		flag = 0xF12A
		jumpIfTrue = continue
		jumpIfFalse = 30
	checkFlag
		flag = 0x90B
		jumpIfTrue = continue
		jumpIfFalse = 32
	checkFlag
		flag = 0x982
		jumpIfTrue = continue
		jumpIfFalse = 34
	checkFlag
		flag = 0x90D
		jumpIfTrue = continue
		jumpIfFalse = 36
	checkFlag
		flag = 0x1621
		jumpIfTrue = continue
		jumpIfFalse = 40
	checkFlag
		flag = 0xF13F
		jumpIfTrue = continue
		jumpIfFalse = 42
	callRandom
		id = 1
		start = 1
		count = 15
	end
}
script 1 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	Bud's birthday is coming
	up, and I want to get
	him a present...
	"""
	keyWait
	clearMsg
	"""
	Any ideas, Mega?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hmm...
	If it was me, I'd--
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PropellerMan
	"""
	Can't go wrong with
	an RC helicopter!
	"""
	keyWait
	clearMsg
	"""
	It's all the rage among
	kids these days!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	keyWait
	clearMsg
	"""
	If it was me, I'd get--
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PitcherMan
	"""
	A brand-new baseball bat!
	"""
	keyWait
	clearMsg
	"""
	That Bud kid's strong,
	right? Imagine the
	home-runs he could hit!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	keyWait
	clearMsg
	"""
	I'd get a--
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = ThermoMan
	"""
	A handheld fan!
	Gotta keep cool!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = KeyMan
	"""
	A new padlock for
	his bicycle!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = ShovelMan
	"""
	A power drill for
	all his DIY needs!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Oh, these ideas sound
	pretty good...
	"""
	keyWait
	clearMsg
	"""
	I'll have to choose one
	carefully... Thanks, guys!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	keyWait
	clearMsg
	"""
	...Sometimes I feel like
	this Transer is a little
	TOO crowded...
	"""
	keyWait
	clearMsg
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey, Geo! What's this
	hidden file on your
	Transer?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	N-No, wait, Mega!
	Don't open that...!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	"Geo's Report Card -
	Year 3"
	"""
	keyWait
	clearMsg
	"""
	Wow, these grades are
	pretty good!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	mugshotAnimation
		animation = 1
	"""
	(...Phew. I almost thought
	it was...)
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Oh, hey? What's this?
	Another file?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	N-Now hold on a--
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	"Stelar Family Photo Album"
	"""
	keyWait
	clearMsg
	"""
	Aw, weren't you a
	cute lil' tyke!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	mugshotAnimation
		animation = 1
	"""
	......
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	(Thank goodness he
	didn't find "that"...)
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hm? This photo...
	"""
	keyWait
	clearMsg
	"""
	Geo, isn't this you?
	And you're wearing...!?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	Agh! Stop! Stop!
	Enough peeking!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hehehe. You're NEVER
	gonna live this one down.
	"""
	keyWait
	clearMsg
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Argh! I'm sick of being
	the arm all the time!
	"""
	keyWait
	clearMsg
	"""
	You know how nauseating
	it is when you run around,
	"""
	keyWait
	clearMsg
	"""
	arms swinging every
	which a way?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	OK, how about this?
	Next time you be the
	head, and I'll be the arm.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Now that's an idea!
	I can picture it now...
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 1
	"EM Wave Change!"
	waitSkip
		frames = 20
	"\nOmega-Xis,"
	waitSkip
		frames = 20
	"\nOn"
	waitSkip
		frames = 10
	" The"
	waitSkip
		frames = 10
	" Air!!"
	keyWait
	clearMsg
	textSpeed
		delay = 2
	"""
	Take this, virus scum!
	Geo Buster!!
	"""
	keyWait
	clearMsg
	"""
	...Wait, can you even
	shoot anything?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	I dunno... Maybe I can
	fire off clever remarks?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	...Something tells me this
	isn't gonna work out...
	"""
	keyWait
	clearMsg
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey, isn't that...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Gemini
	"""
	What? Who made YOU
	the leader? Huh?
	"""
	keyWait
	clearMsg
	"""
	Hmph! That's no way
	to talk to your senior!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Ugh. It's that creep Gemini.
	"""
	keyWait
	clearMsg
	"""
	And from the looks of
	it, he's having one of
	those moments...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Gemini
	"""
	What? I'll have you know,
	I'm the older one here!
	"""
	keyWait
	clearMsg
	"""
	Hah, you wish! We both
	know I'm the older one!
	"""
	keyWait
	clearMsg
	"""
	Ah, Omega-Xis!
	Ah, Omega-Xis!
	"""
	keyWait
	clearMsg
	"""
	Are you hearing this?
	Lefty here thinks he's
	the boss of me!
	"""
	keyWait
	clearMsg
	"""
	Hmph. Righty here has his
	head stuck in the clouds.
	"""
	keyWait
	clearMsg
	"""
	What are you talking
	about! Our heads are
	on the same level!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Calm down, you two...
	"""
	keyWait
	clearMsg
	"""
	Aren't you twins?
	That means you're
	the same age, right?
	"""
	keyWait
	clearMsg
	"""
	Why don't you make
	decisions together?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Gemini
	"""
	Hm, I see! Two minds
	are better than one...
	"""
	keyWait
	clearMsg
	"""
	Yes! I'll be the brains,
	and you'll be the brawn!
	"""
	keyWait
	clearMsg
	"""
	What? Who made YOU
	the brains!?
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	*bicker, bicker...*
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	I can't even tell
	which is which anymore...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Now you know my pain,
	kid...
	"""
	keyWait
	clearMsg
	end
}
script 5 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	...Ah! I'm getting a
	transmission from
	the Satellite admins!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DragonSkyShadow
	"""
	Geo Stelar and Omega-Xis...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagicShadow
	"""
	You must save this planet
	from the FM-ian threat.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	We have a message
	for you...
	"""
	keyWait
	clearMsg
	"""
	...Wait.
	"""
	keyWait
	clearMsg
	"""
	I was supposed to go
	first, Pegasus.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagicShadow
	"""
	I see.
	My apologies, Leo.
	"""
	keyWait
	clearMsg
	"""
	Let us continue.
	"""
	keyWait
	clearMsg
	"""
	You must find a way
	to the space station
	that looms in the sky...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	If you trust in the
	power of your bonds...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DragonSkyShadow
	"""
	Seek out the one known
	as Boreal. He can...
	"""
	keyWait
	clearMsg
	"""
	...A moment, Leo.
	That part comes later.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LeoKingdomShadow
	"""
	Oh, I see.
	Very well.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = PegasusMagicShadow
	"""
	Next, add two teaspoons
	of sugar...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	...Why don't you three
	come back once you
	have your act together?
	"""
	keyWait
	clearMsg
	end
}
script 6 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	So, Mega.
	What's the deal with
	you and Lyra, anyway?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hmph. I don't want
	to talk about it.
	"""
	keyWait
	clearMsg
	"""
	All you need to know is,
	that woman is trouble.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lyra
	"""
	Oh...? I'm trouble, am I?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	L-Lyra!? What are you
	doing here?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lyra
	"""
	Oh, I just happened
	to overhear an
	interesting conversation.
	"""
	keyWait
	clearMsg
	"""
	Well, boy, if you must
	know, Omega-Xis here
	was BAD back then...
	"""
	keyWait
	clearMsg
	"""
	Why, one time when we...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	...Grnk!
	"""
	keyWait
	clearMsg
	"""
	T-That's enough out
	of you! Don't you have
	somewhere to be?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lyra
	"""
	Ho ho ho! I'll spare
	you the details, then.
	"""
	keyWait
	clearMsg
	"""
	But you know where to
	find me, tiger. I'm always
	ready for a rematch.
	"""
	keyWait
	clearMsg
	"""
	Well, ta-ta... *mwah*
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	...Mega?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	...Not a word, kid.
	"""
	keyWait
	clearMsg
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = QuizSheet
	"""
	Question #1!
	How do you measure the
	circumference of a circle?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	W-What the!? A virus
	got in the Transer?
	"""
	keyWait
	clearMsg
	"""
	Take this!
	
	"""
	callScreenShake
		intensity = 1
		length = 10
	"""
	GROOOOAAR!!
	"""
	callScreenShake
		intensity = 1
		length = 10
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	M-Mega, stop!
	That's my Math homework!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Your homework looks
	like THAT?
	"""
	keyWait
	clearMsg
	"""
	Man. I really don't get
	Earthlings sometimes.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = QuizSheet
	"""
	Question #2!
	When was the Statue
	of Liberty built?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Wh-Who's there!?
	
	"""
	callScreenShake
		intensity = 1
		length = 10
	"""
	GRAAAAAAAWR!!
	"""
	callScreenShake
		intensity = 1
		length = 10
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	No! ...Ahhh, there goes
	my History homework...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Sorry, kid.
	Force of habit!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	*sigh*
	"""
	keyWait
	clearMsg
	"""
	I guess I have to tell
	Mr. Shepar that the
	dog ate my homework...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey! Who're you calling
	a dog!?
	"""
	keyWait
	clearMsg
	end
}
script 8 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	I can't believe Earth
	was almost destroyed...
	"""
	keyWait
	clearMsg
	"""
	We really stepped in it,
	didn't we, Mega?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Yeah. I thought for sure
	our goose was cooked.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Cygnus
	"""
	...Hm?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	What? No, I wasn't talking
	about you, Cygnus!
	"""
	keyWait
	clearMsg
	"""
	Ahem. What I meant to
	say is, our fate was
	hanging in the balance.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Libra
	"""
	You rang?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	What? No, no! Um...
	"""
	keyWait
	clearMsg
	"""
	Basically, we came up
	snake eyes.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Ophiuca
	"""
	Is that so?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Aaaaargh!!
	I can't take this anymore!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Oh, c'mon Mega...
	Don't be so crabby.
	"""
	keyWait
	clearMsg
	mugshotHide
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	keyWait
	clearMsg
	mugshotShow
		mugshot = CancerBubble
	mugshotAnimation
		animation = 1
	"""
	*snip snip!*
	"""
	keyWait
	clearMsg
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Geo! I found a secret
	function in the Visualizer!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappyVisualizerUp
	"""
	Huh, really?
	What does it do?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	I'm not sure... Here,
	let me turn it on.
	"""
	keyWait
	clearMsg
	soundPlay
		sound = 382
	callMugshotShowGeoOrMegaManSadVisualizer
	mugshotAnimation
		animation = 1
	"""
	......
	"""
	waitSkip
		frames = 30
	mugshotAnimationReset
	callScreenShake
		intensity = 1
		length = 10
	"""
	WHOA!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = DeliveryNavi
	"""
	Huh? What's wrong, kid?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSadVisualizer
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 10
	"."
	waitSkip
		frames = 10
	"."
	keyWait
	clearMsg
	soundPlay
		sound = 383
	callMugshotShowGeoOrMegaManSadVisualizerUp
	"""
	...Let's not use that
	function anymore.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"""
	...?
	
	"""
	mugshotAnimationReset
	"""
	It can't be THAT bad.
	Let me see...
	"""
	keyWait
	clearMsg
	soundPlay
		sound = 383
	callMugshotShowGeoOrMegaManSadNoVisualizer
	"""
	Hey, give it back!
	"""
	keyWait
	clearMsg
	soundPlay
		sound = 382
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"""
	......
	"""
	waitSkip
		frames = 30
	mugshotAnimationReset
	callScreenShake
		intensity = 1
		length = 10
	"""
	WHOA!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LittleBoy
	"""
	See? I told you!
	"""
	keyWait
	clearMsg
	soundPlay
		sound = 383
	mugshotShow
		mugshot = OmegaXis
	"""
	...Yeah. Let's not.
	"""
	keyWait
	clearMsg
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Geo, you've got a call.
	It's your mom.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	Hi, Geo!
	"""
	keyWait
	clearMsg
	"""
	I've got a late shift
	tonight, so dinner's
	in the fridge.
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Alright, mom.
	See you late--
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	Make sure you heat
	it up thoroughly!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Okay.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	And don't go to bed too
	late now, young man!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	Okay...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	And make sure to lock
	the doors!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	Okaaaay...
	I get it, mom. Really.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	Oh, my little boy is
	growing up so fast...
	"""
	keyWait
	clearMsg
	"""
	Why, remember that time
	at the mall, when you
	were still young?
	"""
	keyWait
	clearMsg
	"""
	In your red little booties,
	arms spread, zooming
	around like a plane...
	"""
	keyWait
	clearMsg
	"""
	"I'm Geo, the #1 astronaut
	in the universe! Woooo!!"
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	M-Mom...!
	Don't talk about that...!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Hope
	"""
	What's the matter?
	It's just us two, isn't it?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	(Heh heh heh...
	I'm taking notes!)
	"""
	keyWait
	clearMsg
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Huh? You've got a call
	from... I don't believe it!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Cepheus
	"""
	Greetings, Earthling!!
	"""
	keyWait
	clearMsg
	"Um,"
	waitSkip
		frames = 20
	" I mean..."
	waitSkip
		frames = 20
	"\nHi, Geo."
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	It's you, Cepheus!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Cepheus
	"""
	I demand to hear of
	your recent activities!
	"""
	keyWait
	clearMsg
	"Er,"
	waitSkip
		frames = 20
	" I mean..."
	waitSkip
		frames = 20
	"\nHow's it going?"
	keyWait
	clearMsg
	"""
	Sorry... I guess I'm not
	used to this whole
	"Brother" thing yet.
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Don't worry about it.
	What have you been
	up to, Cepheus?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Cepheus
	"""
	Yes... My plans have
	been progressing smoothly.
	"""
	keyWait
	clearMsg
	"""
	And soon, your puny
	planet will be buried!
	"""
	keyWait
	clearMsg
	"...In..."
	waitSkip
		frames = 20
	" trust and friendship?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Sure... we'll go with that.
	"""
	keyWait
	clearMsg
	end
}
script 12 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	I can't stop thinking
	about that baseball
	match the other day...
	"""
	keyWait
	clearMsg
	"""
	Down to the last inning,
	2 strikes, bases loaded...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Then that guy was down
	to his last swing and
	hit a moon shot!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Words can't describe it...
	It was incredible!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Amazing!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Magnificent!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Stupendous!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Unbelievable!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Marvelous!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	...Legendary!!
	"""
	waitSkip
		frames = 10
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Yeah, that's it!
	"""
	keyWait
	clearMsg
	"""
	Wait, who said that!?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	I don't know!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = LegendaryMasterShin
	"""
	It's a Legendary mystery!
	"""
	keyWait
	clearMsg
	end
}
script 13 mmsf1 {
	msgOpen
	"*riiiiiiing!*"
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Hey, I've got a call
	from Zack. What's up?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	Hi, Geo. I wanted to
	ask you something.
	"""
	keyWait
	clearMsg
	"""
	...Don't think I haven't
	noticed.
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Huh? Noticed what?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	I saw it, you know...
	"""
	keyWait
	clearMsg
	"""
	When you changed
	into Mega Man...
	"""
	keyWait
	clearMsg
	"""
	...your height grew by
	0.01 inches!!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	It... it did?
	"""
	keyWait
	clearMsg
	"""
	(Mega, is that true?)
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	(Oh, uh... maybe??)
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	Tell me your secret!
	Please!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Well, I don't really know
	how it works...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	Hmmmmm... Hm!
	I see how it is!
	"""
	keyWait
	clearMsg
	"""
	It's because of that
	blue alien you merged
	with, isn't it?
	"""
	keyWait
	clearMsg
	"""
	In that case, all I need
	to do is find an FM-ian
	friend of my own!
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	H-Hold on, Zack...
	I don't think that's
	a good...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Zack
	"""
	Hee hee hee.
	Thanks for the
	information, Geo.
	"""
	keyWait
	clearMsg
	mugshotHide
	soundDisableTextSFX
	soundPlay
		sound = 299
	"""
	*click*
	"""
	soundEnableTextSFX
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManSad
	"""
	Oh boy...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Sure hope this isn't going
	to come back and bite us
	in the next game...
	"""
	keyWait
	clearMsg
	end
}
script 14 mmsf1 {
	msgOpen
	callMugshotShowGeoOrMegaManHappy
	"""
	Whenever I'm feeling
	down, I think back to
	what dad used to say.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Kelvin
	mugshotAnimation
		animation = 1
	"""
	Geo, the future is what
	you make of it.
	Keep a positive outlook!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Kelvin said that?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Yeah... Dad was always
	full of good advice.
	"""
	keyWait
	clearMsg
	"""
	Another time, he told me...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Kelvin
	mugshotAnimation
		animation = 1
	"""
	Geo, always be sure to
	clean up after yourself.
	Nobody likes a mess.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Maybe I should've gotten to
	know the guy a bit better.
	"""
	keyWait
	clearMsg
	"""
	Got any more?
	"""
	keyWait
	clearMsg
	callMugshotShowGeoOrMegaManHappy
	"""
	Hmm, let me think...
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Kelvin
	mugshotAnimation
		animation = 1
	"""
	Listen carefully, son.
	I'm going to tell you
	something very important.
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"""
	If there ever was anything
	I want you to remember,
	it's this...
	"""
	keyWait
	clearMsg
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 20
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 20
	mugshotAnimation
		animation = 1
	"."
	waitSkip
		frames = 20
	mugshotAnimation
		animation = 1
	"""
	Pineapple does not
	belong on pizza. Period.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"""
	(D-Did Kelvin really
	say that...?)
	"""
	keyWait
	clearMsg
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Geo, I have to ask...
	"""
	keyWait
	clearMsg
	"""
	Do Earthlings really
	entrust all of their
	important messages
	"""
	keyWait
	clearMsg
	"""
	to these feeble-looking
	Hertzes?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MrHertz
	"""
	OH, YOU THINK WE'RE
	FEEBLE, DO YOU?
	"""
	keyWait
	clearMsg
	"""
	THEN, LET ME SHOW
	YOU MY TRUE POWER...!
	"""
	keyWait
	clearMsg
	callScreenShake
		intensity = 1
		length = 20
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	callScreenShake
		intensity = 1
		length = 20
	"."
	waitSkip
		frames = 20
	keyWait
	clearMsg
	mugshotShow
		mugshot = MrHertzGold
	"""
	FWAAAAH!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	mugshotAnimation
		animation = 1
	"""
	*yawn*
	
	"""
	mugshotAnimationReset
	"""
	That all you've got?
	"""
	keyWait
	clearMsg
	"""
	The Wave Road's a
	dangerous place, little guy.
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MrHertzGold
	"""
	HMPH. THIS IS NOT
	EVEN MY FINAL FORM.
	"""
	keyWait
	clearMsg
	callScreenShake
		intensity = 1
		length = 20
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	callScreenShake
		intensity = 1
		length = 20
	"."
	waitSkip
		frames = 20
	keyWait
	clearMsg
	callScreenShake
		intensity = 2
		length = 40
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	callScreenShake
		intensity = 2
		length = 40
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	"."
	waitSkip
		frames = 20
	keyWait
	clearMsg
	mugshotShow
		mugshot = KingHertzGold
	callScreenShake
		intensity = 2
		length = 30
	"""
	BWAAAAAAAAAH!!!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Y-Yikes!
	"""
	keyWait
	clearMsg
	end
}
script 30 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 31
		jumpIfComp = 31
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	What's with that hunk
	of junk at BIG WAVE?
	Suspicious...
	"""
	keyWait
	clearMsg
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I wonder what the
	deal with that robot
	at BIG WAVE is.
	"""
	keyWait
	clearMsg
	end
}
script 32 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 33
		jumpIfComp = 33
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	That e-mail said something
	about the AMAKEN Tower,
	right?
	"""
	keyWait
	clearMsg
	end
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I think that e-mail said
	something about the
	AMAKEN Tower.
	"""
	keyWait
	clearMsg
	end
}
script 34 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 35
		jumpIfComp = 35
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Don't you have to go
	find that Aaron guy?
	He's on a rooftop, right?
	"""
	keyWait
	clearMsg
	end
}
script 35 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Lucian said I'd find
	Aaron on a rooftop
	somewhere...
	"""
	keyWait
	clearMsg
	end
}
script 36 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 38
		jumpIfComp = 38
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	An antenna near the sea?
	Beats me!
	"""
	keyWait
	clearMsg
	end
}
script 37 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	An antenna near the sea...
	I think I know where that is.
	"""
	keyWait
	clearMsg
	end
}
script 38 mmsf1 {
	checkArea
		lower = 0x84
		upper = 0x84
		jumpIfInRange = continue
		jumpIfOutOfRange = 37
	checkSubArea
		lower = 0x2
		upper = 0x2
		jumpIfInRange = continue
		jumpIfOutOfRange = 37
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	An antenna near the sea...
	This must be the place!
	"""
	keyWait
	clearMsg
	end
}
script 40 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 41
		jumpIfComp = 41
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Where'd those vampire
	hunters go? Pulse in
	and let's look around!
	"""
	keyWait
	clearMsg
	end
}
script 41 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I wonder if I'll meet
	Aaron and Lucian again?
	Let's have a look around.
	"""
	keyWait
	clearMsg
	end
}
script 42 mmsf1 {
	checkAreaType
		jumpIfRealWorld = continue
		jumpIfWaveRoad = 43
		jumpIfComp = 43
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	You going to your
	usual spot again, kid?
	"""
	keyWait
	clearMsg
	end
}
script 43 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Maybe I'll stop by
	Vista Point...
	It's been a while.
	"""
	keyWait
	clearMsg
	end
}