// Overlay 21 - Best Combo

.nds
.open TEMP+"/overlay_0021.bin",readu32(TEMP+"/y9.bin", 21 * 0x20 + 0x4)
.thumb


.org 0x21B0F6C
	// Partially fade in top screen
	mov	r3,0x19
.org 0x21B1292
	// Partially fade out top screen
	mov	r3,0x1A
.org 0x21B13C8
	// Partially fade out top screen
	mov	r3,0x1A
.org 0x21B13E8
	ldrh	r5,[r4,0x16]	// load current position
	ldrb	r0,[r4,0x10]
	add	r0,0x7
	strh	r0,[r4,0x16]
	bl	bestCombo_keepPopUpCursor
.org 0x21B1418
	bl	bestCombo_reloadPopUpCursor
.org 0x21B2824
	// Set selection to inactive instead of unloading sprites
	mov	r0,r5
	add	r0,0xE8
	mov	r1,0x5
	bl	field_keyboardBestComboStoreBuffers
.org 0x21B164A
	mov	r1,0x0
.org 0x21B1656
	bl	field_keyboardStartBestCombo
.org 0x21B1680
	bl	field_keyboardClosedReloadBestCombo
//.org 0x21B2778
//	bl	field_keyboardBestComboUnload
.org 0x21B1A26
	bl	field_keyboardBestComboClose

.org 0x21B2088	// Hide damage counter for empty spots
	ldrh	r1,[r0]	// number of cards
	cmp	r1,0x0
	beq	0x21B20FC
	bl	bestCombo_drawTotalDamage

.close
