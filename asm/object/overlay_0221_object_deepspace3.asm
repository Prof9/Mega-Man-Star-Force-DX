// Overlay 221 - Deep Space 3 object scripts

.nds
.thumb
.open TEMP+"/overlay_0221.bin",readu32(TEMP+"/y9.bin", 221 * 0x20 + 0x4)
.area 0x5760

.orga 0x4 * 0x01
	.dw	@obj_01
.orga 0x4 * 0x02
	.dw	@obj_02
.orga 0x4 * 0x03
	.dw	@obj_03
.orga 0x4 * 0x04
	.dw	@obj_04
.orga 0x4 * 0x05
	.dw	@obj_05
.orga 0x4 * 0x06
	.dw	@obj_06
.orga 0x4 * 0x07
	.dw	@obj_07
.orga 0x4 * 0x08
	.dw	@obj_08
.orga 0x4 * 0x09
	.dw	@obj_09
.orga 0x4 * 0x0A
	.dw	@obj_0A
.orga 0x4 * 0x0B
	.dw	@obj_0B
.orga 0x4 * 0x0C
	.dw	@obj_0C

.org readu32(TEMP+"/y9.bin", 221 * 0x20 + 0x10)

// Dragon Sky object
@obj_01:
	// Check Dragon Sky EX should spawn
	.dh	0x14	:: .dh	0xF13E	:: .dw	@@end-(.-4)	:: .align 4
	// Check Dragon Sky EX not defeated
	.dh	0x13	:: .dh	0xF10D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Dragon Sky
	.dh	0x22	:: .dh	0x39C				:: .align 4
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x003C,0xFF6C,0xFFC0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(10)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Disable face player
	.db	0x0F						:: .align 4
@@loop:
	// Check Dragon Sky EX defeated
	.dh	0x14	:: .dh	0xF10D	:: .dw	@@loop-(.-4)	:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Taurus Fire
@obj_02:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF80,0xFFEA,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(20)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Cygnus Wing
@obj_03:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF5E,0xFFC8,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(21)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Harp Note
@obj_04:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF80,0xFF6A,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(22)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Libra Scales
@obj_05:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF5E,0xFF10,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x07				:: .align 4
	// Set text script
	.db	0x25	:: .db	(23)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Queen Ophiuca
@obj_06:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF5E,0xFEC6,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(24)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Gemini Spark
@obj_07:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0020,0xFEEA,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(25)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Cancer Bubble
@obj_08:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x0020,0xFE4A,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(26)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Wolf Woods
@obj_09:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x009E,0xFECA,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(27)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Time Trial: Crown Thunder
@obj_0A:
	// Check Time Trials should spawn
	.dh	0x14	:: .dh	0xF13D	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to Mr. Hertz
	.dh	0x22	:: .dh	0x4B				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.db	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x007E,0xFE26,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x03				:: .align 4
	// Set text script
	.db	0x25	:: .db	(28)				:: .align 4
	// Set on Wave Road
	.db	0x29						:: .align 4
	// Enable interactible
	.db	0x0C						:: .align 4
	// Enable face player
	.db	0x0E						:: .align 4
	// Enable collision
	.db	0x10						:: .align 4
	// Loop forever
	.db	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Final Boss Rush
@obj_0B:
	// Check Final Boss Rush should spawn
	.dh	0x14	:: .dh	0xF150	:: .dw	@@end-(.-4)	:: .align 4
	// Set sprite to King Hertz
	.dh	0x22	:: .dh	0x52				:: .align 4
	// Set sprite palette to Gold Hertz
	.db	0x30	:: .db	0x01				:: .align 4
@@loop:
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0x01BC,0xFF6E,0x0000		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x00				:: .align 4
	// Set text script
	.db	0x25	:: .db	(100)				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Disable face player
	.dw	0x0F						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


// Giga Card Jammer
@obj_0C:
	// Set sprite to Jammer
	.dh	0x22	:: .dh	0x4A				:: .align 4
@@loop:
	// Enable NPC
	.dw	0x02						:: .align 4
	// Set position
	.dh	0x05	:: .dh	0xFF1C, 0x002C, 0xFFC0		:: .align 4
	// Set direction
	.db	0x07	:: .db	0x05				:: .align 4
	// Set text script
	.db	0x25	:: .db	(120)				:: .align 4
	// Set on Wave Road
	.dw	0x29						:: .align 4
	// Enable interactible
	.dw	0x0C						:: .align 4
	// Enable face player
	.dw	0x0E						:: .align 4
	// Enable collision
	.dw	0x10						:: .align 4
	// Loop forever
	.dw	0x01						:: .align 4
@@end:
	// Kill NPC
	.dw	0x00						:: .align 4


.align 4
overlay_0221_sinit_init:
	.dw	0
overlay_0221_sinit_init_end:
	.aligna	32

.endarea
.close



.nds
.open TEMP+"/y9.bin",0

.org 221 * 0x20
	.skip	16
	.dw	overlay_0221_sinit_init
	.dw	overlay_0221_sinit_init_end
	.skip	8

.close