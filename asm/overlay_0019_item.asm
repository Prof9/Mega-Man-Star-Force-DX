// Overlay 19 - Item screen

.nds
.open TEMP+"/overlay_0019.bin",readu32(TEMP+"/y9.bin", 19 * 0x20 + 0x4)
.thumb


.org 0x21B127A	// Add menus to key items
	bl	item_useItemMenu


//.org 0x021B1F2A
//	// Exclude ElemSearch from Key Items
//	cmp	r4,0x5C


.org 0x21B1EF6	// Custom sort items
.area 0x38,0x00
	mov	r1,r0
	mov	r0,0xB8
	str	r1,[r5,r0]
	mov	r2,0x80
	mov	r3,0xFF
	bl	0x202DF40

	ldr	r7,=item_itemList
	mov	r0,0xB8
	ldr	r6,[r5,r0]
@@loop:
	ldrb	r0,[r7]
	cmp	r0,0xFF
	beq	0x21B1F2E

	// Check item count
	bl	0x2007BB8
	cmp	r0,0x0
	beq	@@next

	ldrb	r0,[r7]
	strb	r0,[r6]
	add	r6,0x1
@@next:
	add	r7,0x1
	b	@@loop
	.pool
.endarea


.org 0x21B1F80	// Allocate more space for key item names
	mov	r6,0x34
	lsl	r6,r6,0x4
	mov	r7,0xC0
	lsl	r7,r7,0x1
	mov	r4,0x0
.org 0x21B25AC
	mov	r1,0x34
	lsl	r1,r1,0x4
.org 0x21B25C2
	mov	r0,0x34
	lsl	r0,r0,0x4
.org 0x21B25DA
	mov	r2,0x34
.org 0x21B25EA
	mov	r3,0xD
.org 0x21B262E
	mov	r0,0xD
.org 0x21B264C
	mov	r0,0x34
	lsl	r0,r0,0x4


.org 0x21B1420
.area 0x3B8,0x00
	push	r4-r7,r14
	mov	r4,r0

	// Get item ID
	mov	r0,0x14
	ldsh	r0,[r4,r0]
	mov	r1,0x16
	ldsh	r1,[r4,r1]
	add	r0,r0,r1
	lsl	r0,r0,0x1
	ldrb	r1,[r4,0xE]
	add	r0,r0,r1
	mov	r1,0xBC
	ldr	r1,[r4,r1]	// pointer to list
	ldrb	r5,[r1,r0]

	mov	r6,r4
	add	r6,0xC8

	// Check state
	ldrb	r0,[r4,0x4]
	cmp	r0,0x0
	beq	@@state0
	cmp	r0,0x4
	beq	@@state4
	cmp	r0,0x6
	ble	@@state12356
	b	@@end

@@state0:
	// Check if this is an Unlocker or SunKey
	cmp	r5,0x63
	beq	@@useUnlocker
	cmp	r5,0x66
	beq	@@useUnlocker

	// Check if this is a Boktai item
	cmp	r5,0x67
	blt	@@checkStage
	cmp	r5,0x6E
	ble	@@useBoktai

@@checkStage:
	// Get current area
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldrb	r0,[r0]
	cmp	r0,0x80
	bge	@@checkUsedSubcard

@@notWaveChanged:
	mov	r3,0x0		// script
	mov	r7,0x1		// next state
	b	@@bufferItem

@@checkUsedSubcard:
	cmp	r5,0x5C
	blt	@@notNow
	cmp	r5,0x5F
	ble	@@useElemSearch
	cmp	r5,0x62
	ble	@@useEnergy
	cmp	r5,0x63
	beq	@@useUnlocker
	cmp	r5,0x64
	beq	@@useCloaker
	cmp	r5,0x65
	beq	@@useSearchEye
	cmp	r5,0x66
	beq	@@useUnlocker
	b	@@notNow

@@useEnergy:
	// Get current HP
	bl	0x2007CA0
	mov	r7,r0
	// Get max HP
	bl	0x2007CAC
	cmp	r7,r0
	bcc	@@useSubcard

	b	@@notNow

@@useUnlocker:
	mov	r3,0x4		// script
	mov	r7,0x3		// next state
	b	@@bufferItem

@@useCloaker:
	// Check Cloaker active
	bl	0x2007E2C
	cmp	r0,0x1
	bne	@@useSubcard
	b	@@alreadyActive

@@useSearchEye:
	// Check SearchEye active
	bl	0x2007E98
	cmp	r0,0x1
	beq	@@alreadyActive

	// Check have gotten into a battle yet
	ldr	r0,=0x2120588
	ldr	r0,[r0]
	ldr	r0,[r0]
	ldr	r0,[r0,0x64]
	cmp	r0,0x0
	bne	@@useSubcard

@@notNow:
	mov	r3,0x3		// script
	mov	r7,0x2		// next state
	b	@@bufferItem

@@useElemSearch:
	// Check if ElemSearch already active
	bl	common_elemSearchGet
	cmp	r0,0x0
	beq	@@useSubCard

	// Check if we would overwrite
	mov	r1,r5
	sub	r1,0x5B		// r1 = 1 + itemId - 92
	cmp	r0,r1
	beq	@@alreadyActive

	// Buffer the item ID of the active ElemSearch
	mov	r1,r0
	add	r1,0x5B

	mov	r3,0x7
	mov	r7,0x4
	b	@@bufferItemNoId

@@alreadyActive:
	mov	r3,0x5		// script
	mov	r7,0x5		// next state
	b	@@bufferItem

@@useBoktai:
	mov	r3,0x6		// script
	mov	r7,0x1		// next state
	b	@@bufferItem

@@useSubcard:
	mov	r3,0x2
	mov	r7,0x4
	b	@@bufferItem


@@state12356:
	// Check if script finished
	mov	r0,0x1
	lsl	r0,r0,0x14
	bl	0x2008DAC
	cmp	r0,0x1
	bne	@@end

	// Script is finished
	b	@@returnToList


@@state4:
	// Check if waitHold reached
	mov	r0,0x1
	lsl	r0,r0,0x14
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@checkChoice

@@checkPressedB:
	mov	r0,0x1
	lsl	r0,r0,0x12
	bl	0x2008DAC
	cmp	r0,0x1
	beq	@@returnToList
	b	@@end

@@checkChoice:
	// Get last choice
	bl	0x2008DC0
	cmp	r0,0x0
	beq	@@doSubcard

@@returnToList:
	mov	r0,0x1
	str	r0,[r4,0x34]
	mov	r0,r4
	ldr	r1,=0x21B0FC9
	mov	r2,0x0
	bl	0x21B0DD8

	b	@@end

@@doSubcard:
	// Reduce Sub Card count by 1
	mov	r0,r5
	bl	0x2007BAC
	mov	r0,0x1
	str	r0,[r4,0x2C]

	// SearchEye/ElemSearch duration = 2000 (from 768)
	mov	r0,0x7D
	lsl	r0,r0,0x4

	cmp	r5,0x60
	blt	@@doElemSearch
	beq	@@doSmallEnergy
	cmp	r5,0x62
	blt	@@doLargeEnergy
	beq	@@doDeluxeEnergy
	cmp	r5,0x64
	ble	@@doCloaker
	bgt	@@doSearchEye

@@doSmallEnergy:
	// Heal 50 HP
	mov	r0,0x32
	bl	0x2007DBC
	b	@@doEnergy

@@doLargeEnergy:
	// Heal 200 HP
	mov	r0,0xC8
	bl	0x2007DBC
	b	@@doEnergy

@@doDeluxeEnergy:
	// Heal max HP
	bl	0x2007D04

@@doEnergy:
	// Get current HP
	bl	0x2007CA0
	mov	r7,r0
	// Get max HP
	bl	0x2007CAC
	cmp	r7,r0
	bne	@@healedPartial

@@healedAll:
	mov	r3,0xC		// script
	b	@@toState6

@@healedPartial:
	mov	r3,r5
	sub	r3,0x56		// script = 10 + itemId - 96
	b	@@toState6

@@doCloaker:
	// Set Cloaker duration to 2500 (from 768)
	mov	r0,0x9
	lsl	r0,r0,0x8
	add	r0,0xC4
	bl	0x2007E48

	mov	r3,0xD		// script
	b	@@toState6

@@doSearchEye:
	// Set SearchEye duration (in r0)
	bl	0x2007EB4

	mov	r3,0xE
	b	@@toState6

@@doElemSearch:
	// Set element to search (duration in r0)
	mov	r1,r5
	sub	r1,0x5B		// r1 = 1 + itemId - 92
	bl	fieldElemSearchSet

	mov	r3,r5
	sub	r3,(92 - 15)	// script = 15 + element
@@toState6:
	mov	r7,0x6		// next state

@@bufferItem:
	// Set Item ID to buffer
	mov	r1,r5
@@bufferItemNoId:
	mov	r0,0x2
	bl	0x2008DF0

@@startScript:
	// Start script
	mov	r0,0xF0
	lsl	r0,r0,0x8
	mov	r1,0xE
	mov	r2,0xD
	push	r0-r2
	mov	r0,0x1
	lsl	r1,r0,0xB
	push	r0-r1

	ldr	r0,[r4,0x24]
	mov	r1,r3
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470
	add	sp,0x14

	mov	r0,r6
	mov	r1,0x1
	bl	0x2020570

	// Set next state
	mov	r0,r7
	strb	r0,[r4,0x4]


@@end:
	mov	r0,0x1
	pop	r4-r7,r15

	.pool


item_itemList:
	.db	0x00	// Transer
	.db	0x01	// Visualizer

	.db	0x53	// Legend Proof
	.db	0x58	// DX Card
	.db	0x51	// Humor Buster
	.db	0x57	// Color Change R
	.db	0x59	// Color Change G

	.db	0x56	// Star Frag

	.db	0x52	// PropelerCard
	.db	0x3E	// Pitcher Card
	.db	0x0E	// Key Card
	.db	0x3F	// Thermo Card
	.db	0x2A	// Shovel Card

	.db	0x02	// Red Key
	.db	0x03	// Blue Key
	.db	0x04	// Yellow Key
	.db	0x05	// Tetra KeyA
	.db	0x06	// Tetra KeyB
	.db	0x07	// Tetra KeyC
	.db	0x08	// Tetra KeyD
	.db	0x09	// Juice
	.db	0x0A	// RC Chopper
	.db	0x0B	// Entry Pass
	.db	0x0C	// Staff Pass
	.db	0x0D	// Spacesuit
	.db	0x24	// Starlight1
	.db	0x25	// Starlight2
	.db	0x26	// Starlight3
	.db	0x27	// Starlight4
	.db	0x28	// Starlight5
	.db	0x29	// Antidote
	.db	0x2B	// Rescue Sonar
	.db	0x3B	// Tropical Tea
	.db	0x3C	// NAZA Data
	.db	0x4F	// Lonely Heart
	.db	0x50	// KelvinTransr
	.db	0x3A	// Mystery Data

	.db	0x2C	// Sour Soda
	.db	0x2D	// Ham Sandwich
	.db	0x2E	// Lightbulb
	.db	0x2F	// Ring
	.db	0x30	// Floor Guide
	.db	0x31	// BaseballCard
	.db	0x32	// ShotStarCake
	.db	0x33	// ActionFigure
	.db	0x34	// Recipe
	.db	0x35	// Python
	.db	0x36	// King Snake
	.db	0x37	// Corn Snake
	.db	0x38	// Album
	.db	0x39	// Coby Burger
	.db	0x3D	// Note
	.db	0x54	// Navi Chip
	.db	0x55	// Old Data

	.db	0x40	// RC Magazine
	.db	0x41	// ProtectCharm
	.db	0x42	// Invitation
	.db	0x43	// ScienceNotes
	.db	0x44	// Member Card
	.db	0x45	// Music Album (new)
	.db	0x46	// Handbook
	.db	0x47	// RC Scrapbook
	.db	0x48	// Quiz Book
	.db	0x49	// Eraser
	.db	0x4A	// Love Book
	.db	0x4B	// Dept. Flyer
	.db	0x4C	// SnakeOrnamnt
	.db	0x4D	// Gourmet Mag
	.db	0x4E	// Blueprint

	.db	0xFF


.align 2
item_useItemMenu:
	push	r0-r3,r14

	lsr	r2,r1,0x1	// test 0x1
	bcc	@@normal

	// Get item index
	mov	r0,0x18
	ldsh	r0,[r4,r0]
	mov	r1,0x1A
	ldsh	r1,[r4,r1]
	add	r0,r0,r1
	lsl	r0,r0,0x1
	ldrb	r1,[r4,0xF]
	add	r0,r0,r1
	mov	r1,0xB8
	ldr	r1,[r4,r1]
	ldrb	r0,[r1,r0]

	// Check if this is an item with menu
@@checkHumorBuster:
	cmp	r0,0x51		// Humor Buster
	bne	@@checkLegendProof
	mov	r3,(30)		// script 30
	b	@@startScript

@@checkLegendProof:
	cmp	r0,0x53		// Legend Proof
	bne	@@checkColorChangeR
	mov	r3,(40)		// script 40
	b	@@startScript

@@checkColorChangeR:
	cmp	r0,0x57		// Color Change R
	bne	@@checkDXCard
	mov	r3,(60)		// script 60
	b	@@startScript

@@checkDXCard:
	cmp	r0,0x58		// DX Card
	bne	@@checkColorChangeG
	mov	r3,(70)		// script 70
	b	@@startScript

@@checkColorChangeG:
	cmp	r0,0x59		// Color Change G
	bne	@@normal
	mov	r3,(65)		// script 65
//	b	@@startScript

@@startScript:
	mov	r0,0xF0
	lsl	r0,r0,0x8
	mov	r1,0xE
	mov	r2,0xD
	push	r0-r2
	mov	r0,0x1
	lsl	r1,r0,0xB
	push	r0-r1

	ldr	r0,[r4,0x24]
	mov	r1,r3
	mov	r2,0x0
	mov	r3,0x1
	bl	0x2008470
	add	sp,0x14

	// Change state
	mov	r0,r4
	ldr	r1,=item_menu|1
	mov	r2,0x0
	bl	0x21B0DD8

	// Disable cursor blinking
	mov	r2,0xCC
	ldrh	r0,[r4,r2]
	mov	r1,0x1
	lsl	r1,r1,0xC
	orr	r0,r1
	strh	r0,[r4,r2]

	// Exit 2 levels
	add	sp,0x14
	bl	0x21B1416

@@normal:
	pop	r0-r3
	lsl	r3,r3,0x8
	tst	r1,r3
	pop	r15


.align 2
item_menu:
	push	r4,r14
	mov	r4,r0

	// Check if waitHold reached
	mov	r0,1h
	lsl	r0,r0,14h
	bl	0x2008DAC
	cmp	r0,0x1
	bne	@@end

	// Refresh item description
	mov	r0,0x1
	str	r0,[r4,0x38]
	mov	r0,r4
	ldr	r1,=0x21B0FC9
	mov	r2,0x0
	bl	0x21B0DD8

	// Enable cursor blinking
	mov	r2,0xCC
	ldrh	r0,[r4,r2]
	mov	r1,0x1
	lsl	r1,r1,0xC
	bic	r0,r1
	strh	r0,[r4,r2]

@@end:
	mov	r0,0x1
	pop	r4,r15


	.pool

.endarea



.org 0x021B1F64
item_screenMakeList:
.area 0x1C
	// r4 = Current item
	mov	r6,0x0		// index

	// Get list pointer
	mov	r0,0xBC
	ldr	r0,[r5,r0]

@@loop:
	strb	r4,[r0,r6]
	add	r6,0x1

	add	r4,0x1

@@inc1:
	// After SrchEye, wrap to FireSrch
	cmp	r4,0x66
	bne	@@inc2
	mov	r4,0x5C

@@inc2:
	// Ater WoodSrch, wrap to SunKey
	cmp	r4,0x60
	bne	@@inc3
	mov	r4,0x66

@@inc3:
	cmp	r4,0x6E
	ble	@@loop
.endarea



.org 0x21B2764
item_screenSetBounds:
.area 0x58
	push	r4-r6,r14
	mov	r5,r0

	// Set list box count
	mov	r0,0x8
	strb	r0,[r5,0x11]

	ldrb	r0,[r5,0x10]
	cmp	r0,0x0
	bne	@@subcardMailAttach

	ldr	r1,=0xD19
	bl	0x202409C
	cmp	r0,0x1
	bne	@@subcardNormal

@@subcardAll:
	mov	r0,0x13
	b	@@storeSubcard

@@subcardNormal:
	mov	r0,0xA
	b	@@storeSubcard

@@subcardMailAttach:
	mov	r0,0x8

@@storeSubcard:
	strb	r0,[r5,0xC]

@@countKeyItems:
	// Exclude ElemSearch from Key Items
	ldr	r6,=item_itemList
	mov	r4,0x0		// Key Items count

@@countKeyItems_loop:
	// Get item count
	ldrb	r0,[r6]
	cmp	r0,0xFF
	beq	@@countKeyItems_end
	bl	0x2007BB8

	cmp	r0,0x0
	beq	@@countKeyItems_inc
	add	r4,0x1

@@countKeyItems_inc:
	add	r6,0x1
	b	@@countKeyItems_loop

@@countKeyItems_end:
	// Store Key Items count
	strb	r4,[r5,0xD]

	pop	r4-r6,r15

	.pool

.endarea

.close
