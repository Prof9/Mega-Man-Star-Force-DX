.nds

// Trim ARM9 binary
.create TEMP+"/arm9.dec",0
.import TEMP+"/arm9.bin",0,readu32(TEMP+"/header.bin",0x2C)
.close

.create TEMP+"/field_094_tiles0.dec",0
.import TEMP+"/field/field_094.bin", \
	readu32(TEMP+"/field/field_094.bin", 0x4), \
	readu32(TEMP+"/field/field_094.bin", 0x10) - \
	readu32(TEMP+"/field/field_094.bin", 0x4)
.close
.create TEMP+"/field_094_tiles1.bin",0
.import TEMP+"/field/field_094.bin", \
	readu32(TEMP+"/field/field_094.bin", 0x10)
.close

.create TEMP+"/field_095_layer0.dec",0
.import TEMP+"/field/field_095.bin", \
	readu32(TEMP+"/field/field_095.bin", 0x8), \
	readu32(TEMP+"/field/field_095.bin", 0x10) - \
	readu32(TEMP+"/field/field_095.bin", 0x8)
.close
.create TEMP+"/field_095_layer1.bin",0
.import TEMP+"/field/field_095.bin", \
	readu32(TEMP+"/field/field_095.bin", 0x10)
.close

.create TEMP+"/field_096_blocks.dec",0
.import TEMP+"/field/field_096.bin",0x10
.close

.create TEMP+"/field_098_tiles0.dec",0
.import TEMP+"/field/field_098.bin", \
	readu32(TEMP+"/field/field_098.bin", 0x4), \
	readu32(TEMP+"/field/field_098.bin", 0x10) - \
	readu32(TEMP+"/field/field_098.bin", 0x4)
.close
.create TEMP+"/field_098_tiles1.bin",0
.import TEMP+"/field/field_098.bin", \
	readu32(TEMP+"/field/field_098.bin", 0x10)
.close

.create TEMP+"/field_099_layer0.dec",0
.import TEMP+"/field/field_099.bin", \
	readu32(TEMP+"/field/field_099.bin", 0x8), \
	readu32(TEMP+"/field/field_099.bin", 0x10) - \
	readu32(TEMP+"/field/field_099.bin", 0x8)
.close
.create TEMP+"/field_099_layer1.bin",0
.import TEMP+"/field/field_099.bin", \
	readu32(TEMP+"/field/field_099.bin", 0x10)
.close

.create TEMP+"/field_100_blocks.dec",0
.import TEMP+"/field/field_100.bin",0x10
.close

.create TEMP+"/field_223_blocks.dec",0
.import TEMP+"/field/field_223.bin",0x10
.close

.create TEMP+"/field_265_blocks.dec",0
.import TEMP+"/field/field_265.bin",0x10
.close
