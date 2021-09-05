@archive mess_0381
@size 21

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	This is as far
	as as you go,
	Rymer...
	"""
	keyWait
	clearMsg
	jump
		target = 1
	end
}
script 1 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"Bwah hah hah..."
	keyWait
	end
	end
}
script 2 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"An FM-ian!?"
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"Y-You're human?"
	keyWait
	clearMsg
	jump
		target = 4
	end
}
script 4 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MargraveRymer
	"""
	There's my
	chance!!
	"""
	keyWait
	soundStop
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"H-He's gone..."
	keyWait
	end
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	You're a human
	from this world?
	"""
	keyWait
	clearMsg
	jump
		target = 7
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"Y-Yeah..."
	keyWait
	clearMsg
	jump
		target = 8
	end
}
script 8 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	You really got in
	my way there...
	......
	"""
	keyWait
	clearMsg
	jump
		target = 9
	end
}
script 9 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"Ah..."
	keyWait
	end
	end
}
script 10 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	So you're a
	vampire hunter
	from another
	"""
	keyWait
	clearMsg
	"""
	world,who came
	here chasing that
	guy from earlier.
	"""
	keyWait
	clearMsg
	"""
	And that guy
	was a dangerous
	vampire,
	"""
	keyWait
	clearMsg
	"""
	who only thinks
	of humans as
	food...
	"""
	keyWait
	clearMsg
	jump
		target = 11
	end
}
script 11 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	I would've taken
	him down if you
	hadn't shown up.
	"""
	keyWait
	clearMsg
	jump
		target = 12
	end
}
script 12 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	S-Sorry... I
	really messed up.
	"""
	keyWait
	clearMsg
	"""
	Lucian,let me
	help you out!
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
	Hmph,that's what
	I was thinking.
	"""
	keyWait
	clearMsg
	"""
	If we don't find
	Rymer before he
	gains too much
	"""
	keyWait
	clearMsg
	"""
	power,we're
	going to have
	a big problem.
	"""
	keyWait
	clearMsg
	jump
		target = 14
	end
}
script 14 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	So,what should
	I do?
	"""
	keyWait
	clearMsg
	jump
		target = 15
	end
}
script 15 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"""
	I'll take care
	of tracking down
	Rymer.
	"""
	keyWait
	clearMsg
	"""
	I want you to
	look for a
	certain someone.
	"""
	keyWait
	clearMsg
	jump
		target = 16
	end
}
script 16 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"""
	A certain
	someone?
	"""
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
	"""
	One who wields
	the Solar Gun
	"""
	keyWait
	clearMsg
	"""
	that can wipe
	out vampires...
	"""
	keyWait
	clearMsg
	"""
	...His name
	is Aaron.
	"""
	keyWait
	clearMsg
	jump
		target = 18
	end
}
script 18 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"Aaron,huh..."
	keyWait
	clearMsg
	jump
		target = 19
	end
}
script 19 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = Lucian
	"As for Aaron..."
	keyWait
	clearMsg
	"""
	He's probably in
	a place where
	people gather,
	"""
	keyWait
	clearMsg
	"""
	where the sun
	shines down the
	strongest.
	"""
	keyWait
	clearMsg
	"""
	Like on a rooftop
	or something.
	"""
	keyWait
	clearMsg
	"""
	I'm counting
	on you...
	"""
	keyWait
	clearMsg
	jump
		target = 20
	end
}
script 20 mmsf1 {
	msgOpen
	mugshotShowNPC
		npc = 0
	"I-I got it!"
	keyWait
	end
	end
}
