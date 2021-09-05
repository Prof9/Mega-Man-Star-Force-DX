// Overlay 646 - Boktai brother 1 cutscene

.nds
.thumb
.create TEMP+"/overlay_0646.bin",0x21BE560

	.dw	0x90				// ?? (start cutscene?)
	.dw	0x29				// lock player controls
	.dw	0x50	:: .dw	0x1E		// wait 30 frames
	.dw	0x0A				// wait for special player animation
	.dw	0x08				// wait for text script
	.dh	0x28	:: .dh	0x125		// Load text archive
	.dh	0x21	:: .dh	0xD37		// Set flag: don't update HP
	.dh	0x86	:: .dh	0x81		// Start NPC Brother registration
@@loop:
	.dw	0x50	:: .dw	0x01		// wait for 1 frame
	.dw	0x7E	:: .dw	@@next-(.-4)	// wait for top screen finish
	.dw	0x13	:: .dw	@@loop-(.-4)
@@next:
	.dh	0x22	:: .dh	0xD37		// Clear flag: don't update HP
	.dw	0x50	:: .dw	0x3C		// wait for 60 frames
	.dw	0x27				// unload text script handler
	.dh	0x22	:: .dh	0xF004		// unset flag
	.dw	0x71				// Show area name and help signal
	.dw	0x53				// Set camera to player
	.dw	0x91				// ?? (end cutscene?)
	.dw	0x2A				// unlock player controls
	.dw	0x04				// end script

.align 4
overlay_0646_sinit_init:
	.dw	0
overlay_0646_sinit_init_end:
	.aligna	32
overlay_0646_size:
.close



.nds
.open TEMP+"/y9.bin",0

.org 646 * 0x20
	.dw	646			// Overlay ID (overlay_0646)
	.dw	0x21BE560		// Load address
	.dw	overlay_0646_size	// Uncompressed size
	.dw	0			// BSS size
	.dw	overlay_0646_sinit_init
	.dw	overlay_0646_sinit_init_end
	.dw	646			// File ID
	.skip	4

.close