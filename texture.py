import struct
import sys

def splitBmd(bmdPath, mdlPath, texPath):
	"""Split NSBMD (model+texture) into separate NSBMD (model) and NSBTX (texture)."""
	with open(bmdPath, 'rb') as f:
		bmd = f.read()
	
	[magic, bmdSize, mdlOffs, texOffs] = struct.unpack_from('<4xII4xII', bmd, 0)
	mdl = bmd[mdlOffs:texOffs]
	tex = bmd[texOffs:bmdSize]
	mdlHdr = struct.pack('<4sIIHHI', b'BMD0', magic, len(mdl)+0x14, 0x10, 1, 0x14)
	texHdr = struct.pack('<4sIIHHI', b'BTX0', magic, len(tex)+0x14, 0x10, 1, 0x14)
	
	if mdlPath is not None:
		with open(mdlPath, 'wb') as f:
			f.write(mdlHdr + mdl)
	if texPath is not None:
		with open(texPath, 'wb') as f:
			f.write(texHdr + tex)

def mergeBmd(bmdPath, mdlPath, texPath):
	"""Merge NSBMD (model) and NSBTX (texture) into single NSBMD (model+texture)."""
	with open(mdlPath, 'rb') as f:
		mdl = f.read()
	with open(texPath, 'rb') as f:
		tex = f.read()
	
	[magic]   = struct.unpack_from('<4xI', mdl, 0)
	[mdlOffs] = struct.unpack_from('<I',   mdl, 0x10)
	[texOffs] = struct.unpack_from('<I',   tex, 0x10)
	mdl = mdl[mdlOffs:]
	tex = tex[texOffs:]
	bmdHdr = struct.pack('<4sIIHHII', b'BMD0', magic, len(mdl)+len(tex)+0x18, 0x10, 2, 0x18, len(mdl)+0x18)
	
	if bmdPath is not None:
		with open(bmdPath, 'wb') as f:
			f.write(bmdHdr + mdl + tex)

def replText(inFile, outFile, fromText, toText):
	"""Replace text in file and write to other file."""
	with open(inFile, 'rb') as f:
		file = f.read()
	
	file = file.replace(fromText, toText)
	
	with open(outFile, 'wb') as f:
		f.write(file)

# Merge new textures into existing model files
temp = sys.argv[1]
splitBmd(temp+'/mmsf2/models/models_299.bin',			temp+'/models_hollowbazooka.mdl.nsbmd',		None)
splitBmd(temp+'/mmsf2/models/models_786.bin',			None,										temp+'/models_harp_speaker_dx.nsbtx')
splitBmd(temp+'/models_guard.nsbmd',					temp+'/models_guard.mdl.nsbmd',				None)
splitBmd(temp+'/models_megaman.nsbmd',					None,										temp+'/models_megaman.nsbtx')
splitBmd(temp+'/models_bustercharge1.nsbmd',			temp+'/models_bustercharge1.mdl.nsbmd',		None)
splitBmd(temp+'/models_bustercharge2.nsbmd',			temp+'/models_bustercharge2.mdl.nsbmd',		None)
splitBmd(temp+'/models_busterchargefire.nsbmd',			temp+'/models_busterchargefire.mdl.nsbmd',	None)
splitBmd(temp+'/models_bustershot.nsbmd',				temp+'/models_bustershot.mdl.nsbmd',		None)
splitBmd(temp+'/models_dragon_charge.nsbmd',			temp+'/models_dragon_charge.mdl.nsbmd',		None)
splitBmd(temp+'/models_leo_charge.nsbmd',				temp+'/models_leo_charge.mdl.nsbmd',		None)
splitBmd(temp+'/models_megaman_charge.nsbmd',			temp+'/models_megaman_charge.mdl.nsbmd',	None)
splitBmd(temp+'/models_pegasus_charge.nsbmd',			temp+'/models_pegasus_charge.mdl.nsbmd',	None)
splitBmd(temp+'/models_cancer.nsbmd',					temp+'/models_cancer.mdl.nsbmd',			None)
splitBmd(temp+'/models_cancer_claw.nsbmd',				temp+'/models_cancer_claw.mdl.nsbmd',		None)
splitBmd(temp+'/models_gemini_b.nsbmd',					temp+'/models_gemini_b.mdl.nsbmd',			None)
splitBmd(temp+'/models_gemini_w.nsbmd',					temp+'/models_gemini_w.mdl.nsbmd',			None)
splitBmd(temp+'/models_harp.nsbmd',						temp+'/models_harp.mdl.nsbmd',				None)
splitBmd(temp+'/models_harp_speaker.nsbmd',				temp+'/models_harp_speaker.mdl.nsbmd',		None)
splitBmd(temp+'/models_ophiuca.nsbmd',					temp+'/models_ophiuca.mdl.nsbmd',			None)
splitBmd(temp+'/models_taurus.nsbmd',					temp+'/models_taurus.mdl.nsbmd',			None)
splitBmd(temp+'/models_crown.nsbmd',					temp+'/models_crown.mdl.nsbmd',				None)
splitBmd(temp+'/models_cygnus.nsbmd',					temp+'/models_cygnus.mdl.nsbmd',			None)
splitBmd(temp+'/models_cygnus_feather.nsbmd',			temp+'/models_cygnus_feather.mdl.nsbmd',	None)
splitBmd(temp+'/models_leo.nsbmd',						temp+'/models_leo.mdl.nsbmd',				None)
splitBmd(temp+'/models_leo_claw.nsbmd',					temp+'/models_leo_claw.mdl.nsbmd',			None)
splitBmd(temp+'/models_libra.nsbmd',					temp+'/models_libra.mdl.nsbmd',				None)
splitBmd(temp+'/models_wolf.nsbmd',						temp+'/models_wolf.mdl.nsbmd',				None)
splitBmd(temp+'/models_wolf_claw1.nsbmd',				temp+'/models_wolf_claw1.mdl.nsbmd',		None)
splitBmd(temp+'/models_wolf_claw2.nsbmd',				temp+'/models_wolf_claw2.mdl.nsbmd',		None)
splitBmd(temp+'/stages/stages_06.bin',					temp+'/stages_hollow.mdl.nsbmd',			None)
replText(temp+'/mmsf2/models/models_763.bin',			temp+'/models_taurus_dx.nsbtx',				b'bs007', b'bs001')
replText(temp+'/mmsf2/models/models_765.bin',			temp+'/models_harp_dx.nsbtx',				b'bs009', b'bs003')
replText(temp+'/mmsf2/models/models_766.bin',			temp+'/models_cancer_dx.nsbtx',				b'bs00a', b'bs008')
replText(temp+'/stages_hollow.mdl.nsbmd',				temp+'/stages_hollow.mdl.nsbmd',			b'holly', b'empty')
mergeBmd(temp+'/models_hollow.nsbmd',					temp+'/mmsf2/models/models_146.bin',		'imports/texture_hollow.nsbtx')
mergeBmd(temp+'/models_hollow_dx.nsbmd',				temp+'/mmsf2/models/models_146.bin',		'imports/texture_hollow_dx.nsbtx')
mergeBmd(temp+'/models_hollowbazooka.nsbmd',			temp+'/models_hollowbazooka.mdl.nsbmd',		'imports/texture_hollowbazooka.nsbtx')
mergeBmd(temp+'/models_hollowbazooka_dx.nsbmd',			temp+'/models_hollowbazooka.mdl.nsbmd',		'imports/texture_hollowbazooka_dx.nsbtx')
mergeBmd(temp+'/models_heatarmor.nsbmd',				temp+'/models_guard.mdl.nsbmd',				'imports/texture_heatarmor.nsbtx')
mergeBmd(temp+'/models_aquaarmor.nsbmd',				temp+'/models_guard.mdl.nsbmd',				'imports/texture_aquaarmor.nsbtx')
mergeBmd(temp+'/models_elecarmor.nsbmd',				temp+'/models_guard.mdl.nsbmd',				'imports/texture_elecarmor.nsbtx')
mergeBmd(temp+'/models_woodarmor.nsbmd',				temp+'/models_guard.mdl.nsbmd',				'imports/texture_woodarmor.nsbtx')
mergeBmd(temp+'/models_megaman_sf3hair.nsbmd',			'imports/models_megaman_sf3hair.mdl.nsbmd',	temp+'/models_megaman.nsbtx')
mergeBmd(temp+'/models_megaman_sf3hair_red.nsbmd',		'imports/models_megaman_sf3hair.mdl.nsbmd',	'imports/texture_megaman_red.nsbtx')
mergeBmd(temp+'/models_megaman_sf3hair_gold.nsbmd',		'imports/models_megaman_sf3hair.mdl.nsbmd',	'imports/texture_megaman_gold.nsbtx')
mergeBmd(temp+'/models_bustercharge1_cyan.nsbmd',		temp+'/models_bustercharge1.mdl.nsbmd',		'imports/texture_bustercharge1_cyan.nsbtx')
mergeBmd(temp+'/models_bustercharge1_gold.nsbmd',		temp+'/models_bustercharge1.mdl.nsbmd',		'imports/texture_bustercharge1_gold.nsbtx')
mergeBmd(temp+'/models_bustercharge2_cyan.nsbmd',		temp+'/models_bustercharge2.mdl.nsbmd',		'imports/texture_bustercharge2_cyan.nsbtx')
mergeBmd(temp+'/models_bustercharge2_gold.nsbmd',		temp+'/models_bustercharge2.mdl.nsbmd',		'imports/texture_bustercharge2_gold.nsbtx')
mergeBmd(temp+'/models_busterchargefire_cyan.nsbmd',	temp+'/models_busterchargefire.mdl.nsbmd',	'imports/texture_busterchargefire_cyan.nsbtx')
mergeBmd(temp+'/models_busterchargefire_gold.nsbmd',	temp+'/models_busterchargefire.mdl.nsbmd',	'imports/texture_busterchargefire_gold.nsbtx')
mergeBmd(temp+'/models_bustershot_cyan.nsbmd',			temp+'/models_bustershot.mdl.nsbmd',		'imports/texture_bustershot_cyan.nsbtx')
mergeBmd(temp+'/models_bustershot_gold.nsbmd',			temp+'/models_bustershot.mdl.nsbmd',		'imports/texture_bustershot_gold.nsbtx')
mergeBmd(temp+'/models_dragon_charge_cyan.nsbmd',		temp+'/models_dragon_charge.mdl.nsbmd',		'imports/texture_dragon_charge_cyan.nsbtx')
mergeBmd(temp+'/models_dragon_charge_gold.nsbmd',		temp+'/models_dragon_charge.mdl.nsbmd',		'imports/texture_dragon_charge_gold.nsbtx')
mergeBmd(temp+'/models_leo_charge_cyan.nsbmd',			temp+'/models_leo_charge.mdl.nsbmd',		'imports/texture_leo_charge_cyan.nsbtx')
mergeBmd(temp+'/models_leo_charge_gold.nsbmd',			temp+'/models_leo_charge.mdl.nsbmd',		'imports/texture_leo_charge_gold.nsbtx')
mergeBmd(temp+'/models_megaman_charge_cyan.nsbmd',		temp+'/models_megaman_charge.mdl.nsbmd',	'imports/texture_megaman_charge_cyan.nsbtx')
mergeBmd(temp+'/models_megaman_charge_gold.nsbmd',		temp+'/models_megaman_charge.mdl.nsbmd',	'imports/texture_megaman_charge_gold.nsbtx')
mergeBmd(temp+'/models_pegasus_charge_cyan.nsbmd',		temp+'/models_pegasus_charge.mdl.nsbmd',	'imports/texture_pegasus_charge_cyan.nsbtx')
mergeBmd(temp+'/models_pegasus_charge_gold.nsbmd',		temp+'/models_pegasus_charge.mdl.nsbmd',	'imports/texture_pegasus_charge_gold.nsbtx')
mergeBmd(temp+'/models_cancer_dx.nsbmd',				temp+'/models_cancer.mdl.nsbmd',			temp+'/models_cancer_dx.nsbtx')
mergeBmd(temp+'/models_cancer_claw_dx.nsbmd',			temp+'/models_cancer_claw.mdl.nsbmd',		temp+'/models_cancer_dx.nsbtx')
mergeBmd(temp+'/models_gemini_b_dx.nsbmd',				temp+'/models_gemini_b.mdl.nsbmd',			temp+'/mmsf2/models/models_767.bin')
mergeBmd(temp+'/models_gemini_w_dx.nsbmd',				temp+'/models_gemini_w.mdl.nsbmd',			temp+'/mmsf2/models/models_768.bin')
mergeBmd(temp+'/models_harp_dx.nsbmd',					temp+'/models_harp.mdl.nsbmd',				temp+'/models_harp_dx.nsbtx')
mergeBmd(temp+'/models_harp_speaker_dx.nsbmd',			temp+'/models_harp_speaker.mdl.nsbmd',		temp+'/models_harp_speaker_dx.nsbtx')
mergeBmd(temp+'/models_ophiuca_dx.nsbmd',				temp+'/models_ophiuca.mdl.nsbmd',			temp+'/mmsf2/models/models_764.bin')
mergeBmd(temp+'/models_taurus_dx.nsbmd',				temp+'/models_taurus.mdl.nsbmd',			temp+'/models_taurus_dx.nsbtx')
mergeBmd(temp+'/models_crown_dx.nsbmd',					temp+'/models_crown.mdl.nsbmd',				'imports/texture_crown_dx.nsbtx')
mergeBmd(temp+'/models_cygnus_dx.nsbmd',				temp+'/models_cygnus.mdl.nsbmd',			'imports/texture_cygnus_dx.nsbtx')
mergeBmd(temp+'/models_cygnus_feather_dx.nsbmd',		temp+'/models_cygnus_feather.mdl.nsbmd',	'imports/texture_cygnus_feather_dx.nsbtx')
mergeBmd(temp+'/models_leo_dx.nsbmd',					temp+'/models_leo.mdl.nsbmd',				'imports/texture_leo_dx.nsbtx')
mergeBmd(temp+'/models_leo_claw_dx.nsbmd',				temp+'/models_leo_claw.mdl.nsbmd',			'imports/texture_leo_dx.nsbtx')
mergeBmd(temp+'/models_libra_dx.nsbmd',					temp+'/models_libra.mdl.nsbmd',				'imports/texture_libra_dx.nsbtx')
mergeBmd(temp+'/models_wolf_dx.nsbmd',					temp+'/models_wolf.mdl.nsbmd',				'imports/texture_wolf_dx.nsbtx')
mergeBmd(temp+'/models_wolf_claw1_dx.nsbmd',			temp+'/models_wolf_claw1.mdl.nsbmd',		'imports/texture_wolf_claw1_dx.nsbtx')
mergeBmd(temp+'/models_wolf_claw2_dx.nsbmd',			temp+'/models_wolf_claw2.mdl.nsbmd',		'imports/texture_wolf_claw2_dx.nsbtx')
mergeBmd(temp+'/stages_hollow.nsbmd',					temp+'/stages_hollow.mdl.nsbmd',			'imports/texture_stages_hollow.nsbtx')
