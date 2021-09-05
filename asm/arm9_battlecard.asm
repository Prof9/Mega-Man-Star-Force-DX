// Modified cards
.org 0x20B8E7C + 0x2C * (252) + 0x20	// Mag'sFreez - flags
	.dw	0x1			// show damage
.org 0x20B8E7C + 0x2C * (253) + 0x20	// AtomcBlazr - flags
	.dw	0x1			// show damage
.org 0x20B8E7C + 0x2C * (254) + 0x6	// ElemCyclne - damage
	.dh	(80)
.org 0x20B8E7C + 0x2C * (254) + 0x20	// ElemCyclne - flags
	.dw	0x1			// show damage

// New cards
// Note: if new cards are added, search+replace: (170)
.org 0x20B8E7C + 0x2C * 169	// QuickGauge
	.db	(0 << 0) | (0 << 2) | (0 << 5)	// color, icon, library
	.db	6				// card lockout time
	.db	0x07				// action state
	.db	(0 << 0) | (2 << 4)		// lock-on type, rarity
	.db	0				// game version
	.db	0				// ? (always 0?)
	.dh	0				// damage
	.dh	0				// 1 Share Stars bonus damage
	.dh	0				// 2 Share Stars bonus damage
	.dh	0				// 3 Share Stars bonus damage
	.dh	0				// 4 Share Stars bonus damage
	.dh	0				// 5 Share Stars bonus damage
	.dh	0				// 6 Share Stars bonus damage
	.dh	(0 << 0) | (0 << 12)		// Wave Scanner bonus damage, multiplier
	.dh	0x0000				// ABCDE sort (filled in later)
	.db	0x3F				// Wave Scanner conversion elements
	.db	0				// ? (always 0?)
	.dh	(1695)				// Wave Scanner ID
	.db	0x13				// behavior parameter 1
	.db	0x1				// behavior parameter 2
	.db	0x0				// behavior parameter 3
	.db	0x0				// behavior parameter 4
	.dw	0xE				// flags
	.dw	battlecard_quickgauge_img	// image offset
	.dw	battlecard_quickgauge_pal	// palette offset
.org 0x20B8E7C + 0x2C * 170	// SlowGauge
	.db	(0 << 0) | (0 << 2) | (0 << 5)	// color, icon, library
	.db	6				// card lockout time
	.db	0x07				// action state
	.db	(0 << 0) | (2 << 4)		// lock-on type, rarity
	.db	0				// game version
	.db	0				// ? (always 0?)
	.dh	0				// damage
	.dh	0				// 1 Share Stars bonus damage
	.dh	0				// 2 Share Stars bonus damage
	.dh	0				// 3 Share Stars bonus damage
	.dh	0				// 4 Share Stars bonus damage
	.dh	0				// 5 Share Stars bonus damage
	.dh	0				// 6 Share Stars bonus damage
	.dh	(0 << 0) | (0 << 12)		// Wave Scanner bonus damage, multiplier
	.dh	0x0000				// ABCDE sort (filled in later)
	.db	0x3F				// Wave Scanner conversion elements
	.db	0				// ? (always 0?)
	.dh	(1706)				// Wave Scanner ID
	.db	0x13				// behavior parameter 1
	.db	0x2				// behavior parameter 2
	.db	0x0				// behavior parameter 3
	.db	0x0				// behavior parameter 4
	.dw	0xE				// flags
	.dw	battlecard_slowgauge_img	// image offset
	.dw	battlecard_slowgauge_pal	// palette offset
.org 0x20B8E7C + 0x2C * 251	// StarTicket
	.db	(0 << 0) | (7 << 2) | (3 << 5)	// color, icon, library
	.db	6				// card lockout time
	.db	0x0C				// action state
	.db	(0 << 0) | (0 << 4)		// lock-on type, rarity
	.db	0				// game version
	.db	0				// ? (always 0?)
	.dh	0				// damage
	.dh	0				// 1 Share Stars bonus damage
	.dh	0				// 2 Share Stars bonus damage
	.dh	0				// 3 Share Stars bonus damage
	.dh	0				// 4 Share Stars bonus damage
	.dh	0				// 5 Share Stars bonus damage
	.dh	0				// 6 Share Stars bonus damage
	.dh	(0 << 0) | (0 << 12)		// Wave Scanner bonus damage, multiplier
	.dh	0x0000				// ABCDE sort (filled in later)
	.db	0x00				// Wave Scanner conversion elements
	.db	0				// ? (always 0?)
	.dh	0xFFFF				// Wave Scanner ID
	.db	0x0				// behavior parameter 1
	.db	0x0				// behavior parameter 2
	.db	0x0				// behavior parameter 3
	.db	0x0				// behavior parameter 4
	.dw	0x10				// flags
	.dw	battlecard_starticket_img	// image offset
	.dw	battlecard_starticket_pal	// palette offset


// Battle Card images
.org 0x20B8E7C + 0x24 + 0x2C * (221)	// unused
	.dw	battlecard_lupavarot_img
	.dw	battlecard_lupavarot_pal
.org 0x20B8E7C + 0x24 + 0x2C * (222)	// unused
	.dw	battlecard_lupbach_img
	.dw	battlecard_lupbach_pal
.org 0x20B8E7C + 0x24 + 0x2C * (223)	// unused
	.dw	battlecard_hollow_img
	.dw	battlecard_hollow_pal
.org 0x20B8E7C + 0x24 + 0x2C * (224)	// unused
	.dw	battlecard_starfrag1_img
	.dw	battlecard_starfrag1_pal
.org 0x20B8E7C + 0x24 + 0x2C * (225)	// unused
	.dw	battlecard_starfrag2_img
	.dw	battlecard_starfrag2_pal
.org 0x20B8E7C + 0x24 + 0x2C * (226)	// unused
	.dw	battlecard_starfrag3_img
	.dw	battlecard_starfrag3_pal
.org 0x20B8E7C + 0x24 + 0x2C * (227)	// unused
	.dw	battlecard_starfrag4_img
	.dw	battlecard_starfrag4_pal


// Battle Card Library flags (remove flag 0x10)
.org 0x20B8E7C + 0x20 + 0x2C * 0x97	:: .dw	0x103	// SolarGun
.org 0x20B8E7C + 0x20 + 0x2C * 0x98	:: .dw	0x103	// SolarGunV2
.org 0x20B8E7C + 0x20 + 0x2C * 0x99	:: .dw	0x103	// SolarGunV3
.org 0x20B8E7C + 0x20 + 0x2C * 0x9A	:: .dw	0x223	// DarkSword
.org 0x20B8E7C + 0x20 + 0x2C * 0x9B	:: .dw	0x223	// DarkSwordV2
.org 0x20B8E7C + 0x20 + 0x2C * 0x9C	:: .dw	0x223	// DarkSwordV3
.org 0x20B8E7C + 0x20 + 0x2C * 0x9D	:: .dw	0x07	// Ursula
.org 0x20B8E7C + 0x20 + 0x2C * 0x9E	:: .dw	0x07	// UrsulaV2
.org 0x20B8E7C + 0x20 + 0x2C * 0x9F	:: .dw	0x07	// UrsulaV3
.org 0x20B8E7C + 0x20 + 0x2C * 0xA0	:: .dw	0x07	// Tove
.org 0x20B8E7C + 0x20 + 0x2C * 0xA1	:: .dw	0x07	// ToveV2
.org 0x20B8E7C + 0x20 + 0x2C * 0xA2	:: .dw	0x07	// ToveV3
.org 0x20B8E7C + 0x20 + 0x2C * 0xA3	:: .dw	0x07	// Alexander
.org 0x20B8E7C + 0x20 + 0x2C * 0xA4	:: .dw	0x07	// AlexandrV2
.org 0x20B8E7C + 0x20 + 0x2C * 0xA5	:: .dw	0x07	// AlexandrV3
.org 0x20B8E7C + 0x20 + 0x2C * 0xA6	:: .dw	0x07	// Ezra
.org 0x20B8E7C + 0x20 + 0x2C * 0xA7	:: .dw	0x07	// EzraV2
.org 0x20B8E7C + 0x20 + 0x2C * 0xA8	:: .dw	0x07	// EzraV3
.org 0x20B8E7C + 0x20 + 0x2C * 0xD0	:: .dw	0x4F	// PegasusMgc
.org 0x20B8E7C + 0x20 + 0x2C * 0xD1	:: .dw	0x4F	// PegasuMgcEX
.org 0x20B8E7C + 0x20 + 0x2C * 0xD2	:: .dw	0x4F	// PegasuMgcSP
.org 0x20B8E7C + 0x20 + 0x2C * 0xD3	:: .dw	0x4F	// LeoKingdom
.org 0x20B8E7C + 0x20 + 0x2C * 0xD4	:: .dw	0x47	// LeoKingdmEX
.org 0x20B8E7C + 0x20 + 0x2C * 0xD5	:: .dw	0x47	// LeoKingdmSP
.org 0x20B8E7C + 0x20 + 0x2C * 0xD6	:: .dw	0x4F	// DragonSky
.org 0x20B8E7C + 0x20 + 0x2C * 0xD7	:: .dw	0x4F	// DragonSkyEX
.org 0x20B8E7C + 0x20 + 0x2C * 0xD8	:: .dw	0x4F	// DragonSkySP
.org 0x20B8E7C + 0x20 + 0x2C * 0xE7	:: .dw	0x4F	// PegasuMgcGX
.org 0x20B8E7C + 0x20 + 0x2C * 0xE8	:: .dw	0x02	// Aqua+50
.org 0x20B8E7C + 0x20 + 0x2C * 0xE9	:: .dw	0x4F	// OxTackle
.org 0x20B8E7C + 0x20 + 0x2C * 0xEA	:: .dw	0x0F	// BrkTmeBmb
.org 0x20B8E7C + 0x20 + 0x2C * 0xEB	:: .dw	0x223	// DarkSword
.org 0x20B8E7C + 0x20 + 0x2C * 0xEC	:: .dw	0x4F	// LeoKingdmGX
.org 0x20B8E7C + 0x20 + 0x2C * 0xED	:: .dw	0x02	// Fire+50
.org 0x20B8E7C + 0x20 + 0x2C * 0xEE	:: .dw	0x4F	// GemniThndr
.org 0x20B8E7C + 0x20 + 0x2C * 0xEF	:: .dw	0x0E	// DrknesHole
.org 0x20B8E7C + 0x20 + 0x2C * 0xF0	:: .dw	0x06	// LifeAura
.org 0x20B8E7C + 0x20 + 0x2C * 0xF1	:: .dw	0x4F	// DragonSkyGX
.org 0x20B8E7C + 0x20 + 0x2C * 0xF2	:: .dw	0x02	// Wood+50
.org 0x20B8E7C + 0x20 + 0x2C * 0xF3	:: .dw	0x4F	// GorgonEye
.org 0x20B8E7C + 0x20 + 0x2C * 0xF4	:: .dw	0x07	// DestrMissl
.org 0x20B8E7C + 0x20 + 0x2C * 0xF5	:: .dw	0x06	// PoisonPhar
.org 0x20B8E7C + 0x20 + 0x2C * 0xF7	:: .dw	0x4F	// Andromeda


// Battle Card ABCDE sort
.org 0x20B8E7C + 0x16 + 0x2C * 10	:: .dh	1	// AirSpread
.org 0x20B8E7C + 0x16 + 0x2C * 163	:: .dh	2	// Alexander
.org 0x20B8E7C + 0x16 + 0x2C * 164	:: .dh	3	// AlexandrV2
.org 0x20B8E7C + 0x16 + 0x2C * 165	:: .dh	4	// AlexandrV3
.org 0x20B8E7C + 0x16 + 0x2C * 247	:: .dh	5	// Andromeda
.org 0x20B8E7C + 0x16 + 0x2C * 126	:: .dh	6	// AntiSword
.org 0x20B8E7C + 0x16 + 0x2C * 232	:: .dh	7	// Aqua+50
.org 0x20B8E7C + 0x16 + 0x2C * 29	:: .dh	8	// ArboEdge
.org 0x20B8E7C + 0x16 + 0x2C * 150	:: .dh	9	// Attack+10
.org 0x20B8E7C + 0x16 + 0x2C * 138	:: .dh	10	// Aura
.org 0x20B8E7C + 0x16 + 0x2C * 135	:: .dh	11	// Barrier
.org 0x20B8E7C + 0x16 + 0x2C * 136	:: .dh	12	// Barrier100
.org 0x20B8E7C + 0x16 + 0x2C * 137	:: .dh	13	// Barrier200
.org 0x20B8E7C + 0x16 + 0x2C * 106	:: .dh	14	// BigAx1
.org 0x20B8E7C + 0x16 + 0x2C * 107	:: .dh	15	// BigAx2
.org 0x20B8E7C + 0x16 + 0x2C * 108	:: .dh	16	// BigAx3
.org 0x20B8E7C + 0x16 + 0x2C * 112	:: .dh	17	// BlackHole1
.org 0x20B8E7C + 0x16 + 0x2C * 113	:: .dh	18	// BlackHole2
.org 0x20B8E7C + 0x16 + 0x2C * 114	:: .dh	19	// BlackHole3
.org 0x20B8E7C + 0x16 + 0x2C * 26	:: .dh	20	// BlazngEdge
.org 0x20B8E7C + 0x16 + 0x2C * 62	:: .dh	21	// BlueInk
.org 0x20B8E7C + 0x16 + 0x2C * 125	:: .dh	22	// Bombalizer
.org 0x20B8E7C + 0x16 + 0x2C * 91	:: .dh	23	// BraveSwrd1
.org 0x20B8E7C + 0x16 + 0x2C * 92	:: .dh	24	// BraveSwrd2
.org 0x20B8E7C + 0x16 + 0x2C * 93	:: .dh	25	// BraveSwrd3
.org 0x20B8E7C + 0x16 + 0x2C * 30	:: .dh	26	// BreakSabre
.org 0x20B8E7C + 0x16 + 0x2C * 234	:: .dh	27	// BrkTmeBmb
.org 0x20B8E7C + 0x16 + 0x2C * 115	:: .dh	28	// BrsrkSwrd1
.org 0x20B8E7C + 0x16 + 0x2C * 116	:: .dh	29	// BrsrkSwrd2
.org 0x20B8E7C + 0x16 + 0x2C * 117	:: .dh	30	// BrsrkSwrd3
.org 0x20B8E7C + 0x16 + 0x2C * 199	:: .dh	31	// CancrBuble
.org 0x20B8E7C + 0x16 + 0x2C * 200	:: .dh	32	// CancrBublEX
.org 0x20B8E7C + 0x16 + 0x2C * 201	:: .dh	33	// CancrBublSP
.org 0x20B8E7C + 0x16 + 0x2C * 1	:: .dh	34	// Cannon
.org 0x20B8E7C + 0x16 + 0x2C * 58	:: .dh	35	// ChainBubl1
.org 0x20B8E7C + 0x16 + 0x2C * 59	:: .dh	36	// ChainBubl2
.org 0x20B8E7C + 0x16 + 0x2C * 60	:: .dh	37	// ChainBubl3
.org 0x20B8E7C + 0x16 + 0x2C * 67	:: .dh	38	// CloudShot1
.org 0x20B8E7C + 0x16 + 0x2C * 68	:: .dh	39	// CloudShot2
.org 0x20B8E7C + 0x16 + 0x2C * 69	:: .dh	40	// CloudShot3
.org 0x20B8E7C + 0x16 + 0x2C * 205	:: .dh	41	// CrwnThundr
.org 0x20B8E7C + 0x16 + 0x2C * 206	:: .dh	42	// CrwnThndrEX
.org 0x20B8E7C + 0x16 + 0x2C * 207	:: .dh	43	// CrwnThndrSP
.org 0x20B8E7C + 0x16 + 0x2C * 184	:: .dh	44	// CygnusWing
.org 0x20B8E7C + 0x16 + 0x2C * 185	:: .dh	45	// CygnsWingEX
.org 0x20B8E7C + 0x16 + 0x2C * 186	:: .dh	46	// CygnsWingSP
.org 0x20B8E7C + 0x16 + 0x2C * 235	:: .dh	47	// DarkSword
.org 0x20B8E7C + 0x16 + 0x2C * 244	:: .dh	48	// DestrMissl
.org 0x20B8E7C + 0x16 + 0x2C * 142	:: .dh	49	// DoublCross
.org 0x20B8E7C + 0x16 + 0x2C * 214	:: .dh	50	// DragonSky
.org 0x20B8E7C + 0x16 + 0x2C * 215	:: .dh	51	// DragonSkyEX
.org 0x20B8E7C + 0x16 + 0x2C * 216	:: .dh	52	// DragonSkySP
.org 0x20B8E7C + 0x16 + 0x2C * 241	:: .dh	53	// DragonSkyGX
.org 0x20B8E7C + 0x16 + 0x2C * 239	:: .dh	54	// DrknesHole
.org 0x20B8E7C + 0x16 + 0x2C * 154	:: .dh	55	// DrknesSwrd
.org 0x20B8E7C + 0x16 + 0x2C * 155	:: .dh	56	// DrknsSrdV2
.org 0x20B8E7C + 0x16 + 0x2C * 156	:: .dh	57	// DrknsSrdV3
.org 0x20B8E7C + 0x16 + 0x2C * 166	:: .dh	58	// Ezra
.org 0x20B8E7C + 0x16 + 0x2C * 167	:: .dh	59	// EzraV2
.org 0x20B8E7C + 0x16 + 0x2C * 168	:: .dh	60	// EzraV3
.org 0x20B8E7C + 0x16 + 0x2C * 237	:: .dh	61	// Fire+50
.org 0x20B8E7C + 0x16 + 0x2C * 49	:: .dh	62	// FireBzook1
.org 0x20B8E7C + 0x16 + 0x2C * 50	:: .dh	63	// FireBzook2
.org 0x20B8E7C + 0x16 + 0x2C * 51	:: .dh	64	// FireBzook3
.org 0x20B8E7C + 0x16 + 0x2C * 43	:: .dh	65	// FireRing1
.org 0x20B8E7C + 0x16 + 0x2C * 44	:: .dh	66	// FireRing2
.org 0x20B8E7C + 0x16 + 0x2C * 45	:: .dh	67	// FireRing3
.org 0x20B8E7C + 0x16 + 0x2C * 76	:: .dh	68	// FlickrKck1
.org 0x20B8E7C + 0x16 + 0x2C * 77	:: .dh	69	// FlickrKck2
.org 0x20B8E7C + 0x16 + 0x2C * 78	:: .dh	70	// FlickrKck3
.org 0x20B8E7C + 0x16 + 0x2C * 85	:: .dh	71	// Fokx-Fu1
.org 0x20B8E7C + 0x16 + 0x2C * 86	:: .dh	72	// Fokx-Fu2
.org 0x20B8E7C + 0x16 + 0x2C * 87	:: .dh	73	// Fokx-Fu3
.org 0x20B8E7C + 0x16 + 0x2C * 22	:: .dh	74	// FreezNukle
.org 0x20B8E7C + 0x16 + 0x2C * 7	:: .dh	75	// Gatling1
.org 0x20B8E7C + 0x16 + 0x2C * 8	:: .dh	76	// Gatling2
.org 0x20B8E7C + 0x16 + 0x2C * 9	:: .dh	77	// Gatling3
.org 0x20B8E7C + 0x16 + 0x2C * 196	:: .dh	78	// GeminSpark
.org 0x20B8E7C + 0x16 + 0x2C * 197	:: .dh	79	// GemnSpkEX
.org 0x20B8E7C + 0x16 + 0x2C * 198	:: .dh	80	// GemnSpkSP
.org 0x20B8E7C + 0x16 + 0x2C * 238	:: .dh	81	// GemniThndr
.org 0x20B8E7C + 0x16 + 0x2C * 40	:: .dh	82	// GhstPulse1
.org 0x20B8E7C + 0x16 + 0x2C * 41	:: .dh	83	// GhstPulse2
.org 0x20B8E7C + 0x16 + 0x2C * 42	:: .dh	84	// GhstPulse3
.org 0x20B8E7C + 0x16 + 0x2C * 143	:: .dh	85	// GigaMine
.org 0x20B8E7C + 0x16 + 0x2C * 147	:: .dh	86	// GNullStage
.org 0x20B8E7C + 0x16 + 0x2C * 243	:: .dh	87	// GorgonEye
.org 0x20B8E7C + 0x16 + 0x2C * 144	:: .dh	88	// GrassStage
.org 0x20B8E7C + 0x16 + 0x2C * 146	:: .dh	89	// GraviStage
.org 0x20B8E7C + 0x16 + 0x2C * 118	:: .dh	90	// GreenBurst
.org 0x20B8E7C + 0x16 + 0x2C * 61	:: .dh	91	// GreenInk
.org 0x20B8E7C + 0x16 + 0x2C * 31	:: .dh	92	// GrndWave1
.org 0x20B8E7C + 0x16 + 0x2C * 32	:: .dh	93	// GrndWave2
.org 0x20B8E7C + 0x16 + 0x2C * 33	:: .dh	94	// GrndWave3
.org 0x20B8E7C + 0x16 + 0x2C * 187	:: .dh	95	// HarpNote
.org 0x20B8E7C + 0x16 + 0x2C * 188	:: .dh	96	// HarpNoteEX
.org 0x20B8E7C + 0x16 + 0x2C * 189	:: .dh	97	// HarpNoteSP
.org 0x20B8E7C + 0x16 + 0x2C * 14	:: .dh	98	// HeatBall1
.org 0x20B8E7C + 0x16 + 0x2C * 15	:: .dh	99	// HeatBall2
.org 0x20B8E7C + 0x16 + 0x2C * 16	:: .dh	100	// HeatBall3
.org 0x20B8E7C + 0x16 + 0x2C * 3	:: .dh	101	// HevyCannon
.org 0x20B8E7C + 0x16 + 0x2C * 148	:: .dh	102	// HolyPanel
.org 0x20B8E7C + 0x16 + 0x2C * 119	:: .dh	103	// IceBurst
.org 0x20B8E7C + 0x16 + 0x2C * 17	:: .dh	104	// IceMeteor1
.org 0x20B8E7C + 0x16 + 0x2C * 18	:: .dh	105	// IceMeteor2
.org 0x20B8E7C + 0x16 + 0x2C * 19	:: .dh	106	// IceMeteor3
.org 0x20B8E7C + 0x16 + 0x2C * 145	:: .dh	107	// IceStage
.org 0x20B8E7C + 0x16 + 0x2C * 139	:: .dh	108	// Invisible
.org 0x20B8E7C + 0x16 + 0x2C * 123	:: .dh	109	// JamMachGun
.org 0x20B8E7C + 0x16 + 0x2C * 122	:: .dh	110	// JamminPnch
.org 0x20B8E7C + 0x16 + 0x2C * 34	:: .dh	111	// JetAttack1
.org 0x20B8E7C + 0x16 + 0x2C * 35	:: .dh	112	// JetAttack2
.org 0x20B8E7C + 0x16 + 0x2C * 36	:: .dh	113	// JetAttack3
.org 0x20B8E7C + 0x16 + 0x2C * 79	:: .dh	114	// JumboHmmr1
.org 0x20B8E7C + 0x16 + 0x2C * 80	:: .dh	115	// JumboHmmr2
.org 0x20B8E7C + 0x16 + 0x2C * 81	:: .dh	116	// JumboHmmr3
.org 0x20B8E7C + 0x16 + 0x2C * 94	:: .dh	117	// JunkCube1
.org 0x20B8E7C + 0x16 + 0x2C * 95	:: .dh	118	// JunkCube2
.org 0x20B8E7C + 0x16 + 0x2C * 96	:: .dh	119	// JunkCube3
.org 0x20B8E7C + 0x16 + 0x2C * 211	:: .dh	120	// LeoKingdom
.org 0x20B8E7C + 0x16 + 0x2C * 212	:: .dh	121	// LeoKingdmEX
.org 0x20B8E7C + 0x16 + 0x2C * 213	:: .dh	122	// LeoKingdmSP
.org 0x20B8E7C + 0x16 + 0x2C * 236	:: .dh	123	// LeoKingdmGX
.org 0x20B8E7C + 0x16 + 0x2C * 190	:: .dh	124	// LibraScals
.org 0x20B8E7C + 0x16 + 0x2C * 191	:: .dh	125	// LibrScalsEX
.org 0x20B8E7C + 0x16 + 0x2C * 192	:: .dh	126	// LibrScalsSP
.org 0x20B8E7C + 0x16 + 0x2C * 240	:: .dh	127	// LifeAura
.org 0x20B8E7C + 0x16 + 0x2C * 25	:: .dh	128	// LongSword
.org 0x20B8E7C + 0x16 + 0x2C * 109	:: .dh	129	// MagiCrysl1
.org 0x20B8E7C + 0x16 + 0x2C * 110	:: .dh	130	// MagiCrysl2
.org 0x20B8E7C + 0x16 + 0x2C * 111	:: .dh	131	// MagiCrysl3
.org 0x20B8E7C + 0x16 + 0x2C * 103	:: .dh	132	// MoaiFall1
.org 0x20B8E7C + 0x16 + 0x2C * 104	:: .dh	133	// MoaiFall2
.org 0x20B8E7C + 0x16 + 0x2C * 105	:: .dh	134	// MoaiFall3
.org 0x20B8E7C + 0x16 + 0x2C * 82	:: .dh	135	// MopLance1
.org 0x20B8E7C + 0x16 + 0x2C * 83	:: .dh	136	// MopLance2
.org 0x20B8E7C + 0x16 + 0x2C * 84	:: .dh	137	// MopLance3
.org 0x20B8E7C + 0x16 + 0x2C * 233	:: .dh	138	// OxTackle
.org 0x20B8E7C + 0x16 + 0x2C * 149	:: .dh	139	// ParlyzPlus
.org 0x20B8E7C + 0x16 + 0x2C * 208	:: .dh	140	// PegasusMgc
.org 0x20B8E7C + 0x16 + 0x2C * 209	:: .dh	141	// PegasuMgcEX
.org 0x20B8E7C + 0x16 + 0x2C * 210	:: .dh	142	// PegasuMgcSP
.org 0x20B8E7C + 0x16 + 0x2C * 231	:: .dh	143	// PegasuMgcGX
.org 0x20B8E7C + 0x16 + 0x2C * 4	:: .dh	144	// PlasmaGun1
.org 0x20B8E7C + 0x16 + 0x2C * 5	:: .dh	145	// PlasmaGun2
.org 0x20B8E7C + 0x16 + 0x2C * 6	:: .dh	146	// PlasmaGun3
.org 0x20B8E7C + 0x16 + 0x2C * 2	:: .dh	147	// PlusCannon
.org 0x20B8E7C + 0x16 + 0x2C * 120	:: .dh	148	// PoisBurst
.org 0x20B8E7C + 0x16 + 0x2C * 141	:: .dh	149	// PoisnApple
.org 0x20B8E7C + 0x16 + 0x2C * 21	:: .dh	150	// PoisNukle
.org 0x20B8E7C + 0x16 + 0x2C * 245	:: .dh	151	// PoisonPhar
.org 0x20B8E7C + 0x16 + 0x2C * 37	:: .dh	152	// PowerBomb1
.org 0x20B8E7C + 0x16 + 0x2C * 38	:: .dh	153	// PowerBomb2
.org 0x20B8E7C + 0x16 + 0x2C * 39	:: .dh	154	// PowerBomb3
.org 0x20B8E7C + 0x16 + 0x2C * 100	:: .dh	155	// PowerSong
.org 0x20B8E7C + 0x16 + 0x2C * 63	:: .dh	156	// PurpleInk
.org 0x20B8E7C + 0x16 + 0x2C * 193	:: .dh	157	// QnOphiuca
.org 0x20B8E7C + 0x16 + 0x2C * 194	:: .dh	158	// QnOphiucaEX
.org 0x20B8E7C + 0x16 + 0x2C * 195	:: .dh	159	// QnOphiucaSP
.org 0x20B8E7C + 0x16 + 0x2C * 101	:: .dh	160	// QuakeSong
.org 0x20B8E7C + 0x16 + 0x2C * 169	:: .dh	161	// QuickGauge
.org 0x20B8E7C + 0x16 + 0x2C * 11	:: .dh	162	// RdrMissil1
.org 0x20B8E7C + 0x16 + 0x2C * 12	:: .dh	163	// RdrMissil2
.org 0x20B8E7C + 0x16 + 0x2C * 13	:: .dh	164	// RdrMissil3
.org 0x20B8E7C + 0x16 + 0x2C * 127	:: .dh	165	// Recover10
.org 0x20B8E7C + 0x16 + 0x2C * 128	:: .dh	166	// Recover30
.org 0x20B8E7C + 0x16 + 0x2C * 129	:: .dh	167	// Recover50
.org 0x20B8E7C + 0x16 + 0x2C * 130	:: .dh	168	// Recover80
.org 0x20B8E7C + 0x16 + 0x2C * 131	:: .dh	169	// Recover120
.org 0x20B8E7C + 0x16 + 0x2C * 132	:: .dh	170	// Recover150
.org 0x20B8E7C + 0x16 + 0x2C * 133	:: .dh	171	// Recover200
.org 0x20B8E7C + 0x16 + 0x2C * 134	:: .dh	172	// Recover300
.org 0x20B8E7C + 0x16 + 0x2C * 170	:: .dh	173	// SlowGauge
.org 0x20B8E7C + 0x16 + 0x2C * 151	:: .dh	174	// SolarGun
.org 0x20B8E7C + 0x16 + 0x2C * 152	:: .dh	175	// SolarGunV2
.org 0x20B8E7C + 0x16 + 0x2C * 153	:: .dh	176	// SolarGunV3
.org 0x20B8E7C + 0x16 + 0x2C * 140	:: .dh	177	// SpiritFury
.org 0x20B8E7C + 0x16 + 0x2C * 251	:: .dh	178	// StarTicket
.org 0x20B8E7C + 0x16 + 0x2C * 64	:: .dh	179	// StikyRain1
.org 0x20B8E7C + 0x16 + 0x2C * 65	:: .dh	180	// StikyRain2
.org 0x20B8E7C + 0x16 + 0x2C * 66	:: .dh	181	// StikyRain3
.org 0x20B8E7C + 0x16 + 0x2C * 28	:: .dh	182	// StrikeEdge
.org 0x20B8E7C + 0x16 + 0x2C * 20	:: .dh	183	// StunNukle
.org 0x20B8E7C + 0x16 + 0x2C * 23	:: .dh	184	// Sword
.org 0x20B8E7C + 0x16 + 0x2C * 97	:: .dh	185	// SyncHook1
.org 0x20B8E7C + 0x16 + 0x2C * 98	:: .dh	186	// SyncHook2
.org 0x20B8E7C + 0x16 + 0x2C * 99	:: .dh	187	// SyncHook3
.org 0x20B8E7C + 0x16 + 0x2C * 52	:: .dh	188	// TailBurnr1
.org 0x20B8E7C + 0x16 + 0x2C * 53	:: .dh	189	// TailBurnr2
.org 0x20B8E7C + 0x16 + 0x2C * 54	:: .dh	190	// TailBurnr3
.org 0x20B8E7C + 0x16 + 0x2C * 181	:: .dh	191	// TaurusFire
.org 0x20B8E7C + 0x16 + 0x2C * 182	:: .dh	192	// TaursFireEX
.org 0x20B8E7C + 0x16 + 0x2C * 183	:: .dh	193	// TaursFireSP
.org 0x20B8E7C + 0x16 + 0x2C * 70	:: .dh	194	// ThndrBall1
.org 0x20B8E7C + 0x16 + 0x2C * 71	:: .dh	195	// ThndrBall2
.org 0x20B8E7C + 0x16 + 0x2C * 72	:: .dh	196	// ThndrBall3
.org 0x20B8E7C + 0x16 + 0x2C * 27	:: .dh	197	// TidalEdge
.org 0x20B8E7C + 0x16 + 0x2C * 46	:: .dh	198	// TimeBomb1
.org 0x20B8E7C + 0x16 + 0x2C * 47	:: .dh	199	// TimeBomb2
.org 0x20B8E7C + 0x16 + 0x2C * 48	:: .dh	200	// TimeBomb3
.org 0x20B8E7C + 0x16 + 0x2C * 160	:: .dh	201	// Tove
.org 0x20B8E7C + 0x16 + 0x2C * 161	:: .dh	202	// ToveV2
.org 0x20B8E7C + 0x16 + 0x2C * 162	:: .dh	203	// ToveV3
.org 0x20B8E7C + 0x16 + 0x2C * 102	:: .dh	204	// TripSong
.org 0x20B8E7C + 0x16 + 0x2C * 121	:: .dh	205	// TyphnDance
.org 0x20B8E7C + 0x16 + 0x2C * 157	:: .dh	206	// Ursula
.org 0x20B8E7C + 0x16 + 0x2C * 158	:: .dh	207	// UrsulaV2
.org 0x20B8E7C + 0x16 + 0x2C * 159	:: .dh	208	// UrsulaV3
.org 0x20B8E7C + 0x16 + 0x2C * 73	:: .dh	209	// VolticEye1
.org 0x20B8E7C + 0x16 + 0x2C * 74	:: .dh	210	// VolticEye2
.org 0x20B8E7C + 0x16 + 0x2C * 75	:: .dh	211	// VolticEye3
.org 0x20B8E7C + 0x16 + 0x2C * 88	:: .dh	212	// VulcnSeed1
.org 0x20B8E7C + 0x16 + 0x2C * 89	:: .dh	213	// VulcnSeed2
.org 0x20B8E7C + 0x16 + 0x2C * 90	:: .dh	214	// VulcnSeed3
.org 0x20B8E7C + 0x16 + 0x2C * 124	:: .dh	215	// Whistle
.org 0x20B8E7C + 0x16 + 0x2C * 24	:: .dh	216	// WideSword
.org 0x20B8E7C + 0x16 + 0x2C * 55	:: .dh	217	// WideWave1
.org 0x20B8E7C + 0x16 + 0x2C * 56	:: .dh	218	// WideWave2
.org 0x20B8E7C + 0x16 + 0x2C * 57	:: .dh	219	// WideWave3
.org 0x20B8E7C + 0x16 + 0x2C * 202	:: .dh	220	// WolfWoods
.org 0x20B8E7C + 0x16 + 0x2C * 203	:: .dh	221	// WolfWoodsEX
.org 0x20B8E7C + 0x16 + 0x2C * 204	:: .dh	222	// WolfWoodsSP
.org 0x20B8E7C + 0x16 + 0x2C * 242	:: .dh	223	// Wood+50
