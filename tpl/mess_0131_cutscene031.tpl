@archive mess_0131
@size 8

script 0 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"""
	Well,this is as
	close as I can
	get,so now what?
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
		mugshot = OmegaXis
	"Touch the train!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Huh?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Touch the
	screen... er,I
	mean train!
	"""
	keyWait
	clearMsg
	"""
	Our body is a
	bunch of waves.
	"""
	keyWait
	clearMsg
	"""
	If there's a
	Comp Space that
	is receptive
	"""
	keyWait
	clearMsg
	"""
	to EM waves,
	then we can
	go into it.
	"""
	keyWait
	clearMsg
	"""
	You see that
	wavehole above
	the train?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"Yeah..."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	If it's
	flashing,that
	means the Comp
	"""
	keyWait
	clearMsg
	"""
	Space will
	accept outside
	EM waves.
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
	"Oh..."
	keyWait
	clearMsg
	mugshotShow
		mugshot = OmegaXis
	"""
	Text
	"""
	keyWait
	end
	end
}
script 3 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Text
	"""
	keyWait
	clearMsg
	soundPlay
		sound = 0x182
	"""
	Looks like this
	train accepts
	EM waves!
	"""
	keyWait
	clearMsg
	"""
	Time to hop
	onboard!
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
		mugshot = MegaMan
	"Hop...?"
	keyWait
	end
	end
}
script 5 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"Waaaaaaah!!"
	keyWait
	clearMsg
	jump
		target = 6
	end
}
script 6 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Always
	remember this,
	kid:
	"""
	keyWait
	clearMsg
	"""
	This is how we
	FM-ians jump in-
	to Comp Spaces!
	"""
	keyWait
	clearMsg
	"OK,almost there!"
	keyWait
	end
	end
}
script 7 mmsf1 {
	msgOpen
	mugshotShow
		mugshot = OmegaXis
	"""
	Hey,hurry up
	and touch the
	train,kid!
	"""
	keyWait
	end
	end
}
