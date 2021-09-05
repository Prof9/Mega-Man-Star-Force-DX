@archive mess_0382
@size 48

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Lucian!!"
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	*huff,huff*
	MegaMan...
	"""
	keyWait
	clearMsg
	jump
		target = 2
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"A-Are you okay!?"
	keyWait
	clearMsg
	jump
		target = 3
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"Who are you...?"
	keyWait
	clearMsg
	"""
	A greenhorn
	vampire hunter?
	"""
	keyWait
	clearMsg
	"""
	Hmph. It doesn't
	matter how many
	flies you gather.
	"""
	keyWait
	clearMsg
	"""
	There's no way
	I can be defeated
	in this state!
	"""
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	That must be
	Margrave Rymer...
	Looks like he's
	"""
	keyWait
	clearMsg
	"""
	sucking up this
	area's flame
	power.
	"""
	keyWait
	end
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	I see... It does
	seem like he's
	getting stronger.
	"""
	keyWait
	clearMsg
	"""
	MegaMan,did you
	find Aaron...?
	"""
	keyWait
	clearMsg
	jump
		target = 6
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Yeah,I found
	him,but...
	"""
	keyWait
	clearMsg
	"""
	It sounds like
	it'll take some
	time for his
	"""
	keyWait
	clearMsg
	"""
	Solar Gun to
	charge its
	energy.
	"""
	keyWait
	clearMsg
	"""
	We've got to hold
	him back until
	Aaron comes...
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	There's no way
	around it...
	"""
	keyWait
	clearMsg
	"""
	MegaMan,when I
	give the signal,
	"""
	keyWait
	clearMsg
	"""
	make a brief
	opening for me
	to attack.
	"""
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"...Okay!"
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	What are you
	muttering about!?
	"""
	keyWait
	clearMsg
	"""
	No matter what
	sort of plan you
	may conceive,
	"""
	keyWait
	clearMsg
	"""
	you cannot hope
	to defeat me!
	"""
	keyWait
	clearMsg
	jump
		target = 10
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"Now!!"
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Got it!"
	keyWait
	end
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	Bah! Such
	impertinence!
	"""
	keyWait
	clearMsg
	jump
		target = 13
	end
}
script 13 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	Dark Sword,
	Vanargand!
	"""
	keyWait
	clearMsg
	"Haaaahh!!"
	keyWait
	soundStop
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"W-What...?"
	keyWait
	end
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"That tickles..."
	keyWait
	clearMsg
	"""
	Watch! I'll
	show you a
	real attack!
	"""
	keyWait
	end
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"S-Such power..."
	keyWait
	clearMsg
	jump
		target = 17
	end
}
script 17 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"Dang it..."
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	You vampire
	hunters that dare
	to oppose me...!
	"""
	keyWait
	clearMsg
	"""
	Prepare to be
	skewered!
	"""
	keyWait
	end
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	I-I can't
	move...!
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	Farewell,Lucian!
	And you as well,
	blue warrior!
	"""
	keyWait
	end
	end
}
script 21 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"Hm!?"
	keyWait
	end
	end
}
script 22 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	soundPlayBGM
		music = 24
	"""
	Sorry to keep
	you waiting!!
	"""
	keyWait
	clearMsg
	jump
		target = 23
	end
}
script 23 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"Bah!"
	keyWait
	end
	end
}
script 24 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"What took you...?"
	keyWait
	clearMsg
	jump
		target = 25
	end
}
script 25 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"Sorry!"
	keyWait
	clearMsg
	"""
	It took some time
	to charge using
	the sunlight!
	"""
	keyWait
	clearMsg
	"""
	The real sun is
	pretty different!
	"""
	keyWait
	clearMsg
	jump
		target = 26
	end
}
script 26 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"S-Sunlight...!?"
	keyWait
	clearMsg
	jump
		target = 27
	end
}
script 27 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"""
	Here we go,
	everyone!!
	"""
	keyWait
	end
	end
}
script 28 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	Even with
	sunlight,
	"""
	keyWait
	clearMsg
	"""
	the likes of you
	cannot beat me!
	"""
	keyWait
	end
	end
}
script 29 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	Return to the
	dust from whence
	you came,fools!!
	"""
	keyWait
	clearMsg
	"Hraaaahh!"
	keyWait
	clearMsg
	jump
		target = 30
	end
}
script 30 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"Take this!"
	keyWait
	end
	end
}
script 31 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"Gwaaaaaah!!"
	keyWait
	clearMsg
	"""
	M-My Casket
	Armor...
	Hrrrrgh...
	"""
	keyWait
	clearMsg
	jump
		target = 32
	end
}
script 32 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"MegaBuster!!"
	keyWait
	end
	end
}
script 33 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	M-My armor...
	It's falling
	off...
	"""
	keyWait
	clearMsg
	jump
		target = 34
	end
}
script 34 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"Margrave Rymer..."
	keyWait
	clearMsg
	"""
	Looks like you're
	the one returning
	to dust.
	"""
	keyWait
	end
	end
}
script 35 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	So this...
	is the end...
	"""
	keyWait
	clearMsg
	"N-Noooooo!!"
	keyWait
	soundFadeOutBGM
		length = 120
	end
}
script 36 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	Thanks for the
	help,MegaMan.
	"""
	keyWait
	clearMsg
	jump
		target = 37
	end
}
script 37 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	It's fine...
	You two helped
	me out,too.
	"""
	keyWait
	clearMsg
	"""
	More importantly,
	are you leaving
	already?
	"""
	keyWait
	clearMsg
	jump
		target = 38
	end
}
script 38 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	Yes,we still have
	business to take
	care of...
	"""
	keyWait
	clearMsg
	jump
		target = 39
	end
}
script 39 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"""
	I kinda want to
	relax in this
	"""
	keyWait
	clearMsg
	"""
	world a bit
	longer,though...
	"""
	keyWait
	clearMsg
	"""
	It's been so long
	since I've seen
	the real sun!
	"""
	keyWait
	clearMsg
	jump
		target = 40
	end
}
script 40 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Yeah,we only just
	met... You should
	take it easy...
	"""
	keyWait
	clearMsg
	jump
		target = 41
	end
}
script 41 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"Right!?"
	keyWait
	clearMsg
	"""
	Lucian,let's
	take MegaMan
	up on that.
	"""
	keyWait
	end
	end
}
script 42 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	MegaMan,if fate
	allows us...
	Let's meet again.
	"""
	keyWait
	clearMsg
	"Let's go,Aaron."
	keyWait
	end
	end
}
script 43 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"""
	H-Hey,Lucian!
	Hold on!
	"""
	keyWait
	end
	end
}
script 44 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"""
	Let's meet again
	somewhere,
	MegaMan!
	"""
	keyWait
	clearMsg
	jump
		target = 45
	end
}
script 45 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"You got it!"
	keyWait
	clearMsg
	jump
		target = 46
	end
}
script 46 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Aaron
	"See ya!"
	keyWait
	clearMsg
	"""
	Keep the sun
	always in your
	heart!
	"""
	keyWait
	end
	end
}
script 47 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Lucian,Aaron...
	I'm sure...we'll
	meet again!
	"""
	keyWait
	end
	end
}
