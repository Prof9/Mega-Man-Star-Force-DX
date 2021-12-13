import os
import sys
import ndspy.soundArchive
import ndspy.soundSequenceArchive
import ndspy.soundWave
from collections import namedtuple

def getInstrument(event):
	return (event.bankID << 7) | event.instrumentID

def setInstrument(event, instrument):
	event.bankID = instrument >> 7
	event.instrumentID = instrument & 0x7F

def initInstrument(instrument):
	event = ndspy.soundSequence.InstrumentSwitchSequenceEvent(0, 0)
	setInstrument(event, instrument)
	return event

temp = sys.argv[1]
sdatPath  = os.path.join(temp, 'data', 'datbin', 'com', 'sound_data.sdat')
varsPath  = os.path.join(temp, 'sound_vars.asm')
mmsf2Path = os.path.join(temp, 'mmsf2', 'data', 'datbin', 'com', 'sound_data.sdat')
mmsf3Path = os.path.join(temp, 'mmsf3', 'data', 'datbin', 'com', 'sound_data.sdat')

vars = open(varsPath, 'w')


# Extract MMSF2 sound effects
with open(mmsf2Path, 'rb') as file:
	sdat = ndspy.soundArchive.SDAT(file.read())

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_CMN')
swar.waves[17].saveToFile(os.path.join(temp, 'sfx_saveslot.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BCMN')
swar.waves[62].saveToFile(os.path.join(temp, 'sfx_humorbuster_shot1.swav'))
swar.waves[77].saveToFile(os.path.join(temp, 'sfx_humorbuster_chrg1.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BS05')
swar.waves[0].saveToFile(os.path.join(temp, 'sfx_hollow_magiccircle.swav'))
swar.waves[1].saveToFile(os.path.join(temp, 'sfx_hollow_summonvirus.swav'))
swar.waves[2].saveToFile(os.path.join(temp, 'sfx_hollow_thunderbazooka1.swav'))
swar.waves[3].saveToFile(os.path.join(temp, 'sfx_hollow_thunderbazooka2.swav'))
swar.waves[4].saveToFile(os.path.join(temp, 'sfx_hollow_thunderbazooka3.swav'))
swar.waves[5].saveToFile(os.path.join(temp, 'sfx_hollow_magicthunder.swav'))
swar.waves[6].saveToFile(os.path.join(temp, 'sfx_hollow_barrier.swav'))
swar.waves[7].saveToFile(os.path.join(temp, 'sfx_hollow_hands.swav'))


# Extract MMSF3 sound effects
with open(mmsf3Path, 'rb') as file:
	sdat = ndspy.soundArchive.SDAT(file.read())

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BCMN')
#swar.waves[29].saveToFile(os.path.join(temp, 'sfx_humorbuster_shot1.swav'))
swar.waves[43].saveToFile(os.path.join(temp, 'sfx_humorbuster_shot2.swav'))
swar.waves[44].saveToFile(os.path.join(temp, 'sfx_humorbuster_chrg2.swav'))
#swar.waves[62].saveToFile(os.path.join(temp, 'sfx_humorbuster_chrg1.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_SUBSE')
swar.waves[1].saveToFile(os.path.join(temp, 'sfx_mega_equip.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_CUS')
swar.waves[13].saveToFile(os.path.join(temp, 'sfx_results_item.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_OP')
#swar.waves[1].saveToFile(os.path.join(temp, 'sfx_saveslot.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BT023')
swar.waves[0].saveToFile(os.path.join(temp, 'sfx_quickgauge.swav'))

swar = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BT025')
swar.waves[0].saveToFile(os.path.join(temp, 'sfx_slowgauge.swav'))


with open(sdatPath, 'rb') as file:
	sdat = ndspy.soundArchive.SDAT(file.read())


# Load SWAVs
with open(os.path.join(temp, 'sfx_humorbuster_shot1.swav'), 'rb') as file:
	swav_humorbuster_shot1 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_humorbuster_chrg1.swav'), 'rb') as file:
	swav_humorbuster_chrg1 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_humorbuster_shot2.swav'), 'rb') as file:
	swav_humorbuster_shot2 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_humorbuster_chrg2.swav'), 'rb') as file:
	swav_humorbuster_chrg2 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_magiccircle.swav'), 'rb') as file:
	swav_hollow_magiccircle = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_summonvirus.swav'), 'rb') as file:
	swav_hollow_summonvirus = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_thunderbazooka1.swav'), 'rb') as file:
	swav_hollow_thunderbazooka1 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_thunderbazooka2.swav'), 'rb') as file:
	swav_hollow_thunderbazooka2 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_thunderbazooka3.swav'), 'rb') as file:
	swav_hollow_thunderbazooka3 = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_magicthunder.swav'), 'rb') as file:
	swav_hollow_magicthunder = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_barrier.swav'), 'rb') as file:
	swav_hollow_barrier = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_hollow_hands.swav'), 'rb') as file:
	swav_hollow_hands = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_saveslot.swav'), 'rb') as file:
	swav_saveslot = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_mega_equip.swav'), 'rb') as file:
	swav_mega_equip = ndspy.soundWave.SWAV(file.read())
with open(os.path.join('imports', 'sfx_quickgauge.swav'), 'rb') as file:
	swav_quickgauge = ndspy.soundWave.SWAV(file.read())
with open(os.path.join('imports', 'sfx_slowgauge.swav'), 'rb') as file:
	swav_slowgauge = ndspy.soundWave.SWAV(file.read())
with open(os.path.join(temp, 'sfx_results_item.swav'), 'rb') as file:
	swav_results_item = ndspy.soundWave.SWAV(file.read())



# Add common SWAVs to SWAR
wave_se_cmn = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_CMN')

saveSlotWaveIdx = len(wave_se_cmn.waves)
wave_se_cmn.waves.append(swav_saveslot)

megaEquipWaveIdx = len(wave_se_cmn.waves)
wave_se_cmn.waves.append(swav_mega_equip)


# Add battle SWAVs to SWAR
wave_se_bcmn = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BCMN')

shot1WaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_humorbuster_shot1)

chrg1WaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_humorbuster_chrg1)

shot2WaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_humorbuster_shot2)

chrg2WaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_humorbuster_chrg2)

quickGaugeWaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_quickgauge)

slowGaugeWaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_slowgauge)

resultsItemWaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_results_item)

# Copy Fall Thunder SWAV to battle SWAR
wave_se_bs0a = ndspy.findInNamedList(sdat.waveArchives, 'WAVE_SE_BS0A')

swav_fallThunder = wave_se_bs0a.waves[5]
fallThunderWaveIdx = len(wave_se_bcmn.waves)
wave_se_bcmn.waves.append(swav_fallThunder)


# Create new SWAR for Hollow
wave_se_bs0e = ndspy.soundWaveArchive.SWAR(unk02=0)
swarBs0eID = len(sdat.waveArchives)
sdat.waveArchives.append(('WAVE_SE_BS0E', wave_se_bs0e))

magicCircleIdx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_magiccircle)

summonVirusIdx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_summonvirus)

thunderBazooka1Idx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_thunderbazooka1)

thunderBazooka2Idx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_thunderbazooka2)

thunderBazooka3Idx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_thunderbazooka3)

magicThunderIdx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_magicthunder)

hollowBarrierIdx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_barrier)

hollowHandsIdx = len(wave_se_bs0e.waves)
wave_se_bs0e.waves.append(swav_hollow_hands)



# Find first free instrument index
instrIdx = 0
for sbnk in sdat.banks:
	instrIdx = max(instrIdx, len(sbnk[1].instruments))


# Add common instruments to SBNK
bankCmnID = ndspy.indexInNamedList(sdat.banks, 'BANK_SE_CMN')
bank_se_cmn = sdat.banks[bankCmnID][1]
swarCmnIdx = bank_se_cmn.waveArchiveIDs.index(bankCmnID)
while len(bank_se_cmn.instruments) < instrIdx:
	bank_se_cmn.instruments.append(None)

saveSlotInstIdx = instrIdx
saveSlotNote = ndspy.soundBank.NoteDefinition(saveSlotWaveIdx, swarCmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
saveSlotInst = ndspy.soundBank.SingleNoteInstrument(saveSlotNote)
bank_se_cmn.instruments.append(saveSlotInst)
instrIdx += 1

megaEquipInstIdx = instrIdx
megaEquipNote = ndspy.soundBank.NoteDefinition(megaEquipWaveIdx, swarCmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
megaEquipInst = ndspy.soundBank.SingleNoteInstrument(megaEquipNote)
bank_se_cmn.instruments.append(megaEquipInst)
instrIdx += 1


# Add battle instruments to SBNK
bankBcmnID = ndspy.indexInNamedList(sdat.banks, 'BANK_SE_BCMN')
bank_se_bcmn = sdat.banks[bankBcmnID][1]
swarBcmnIdx = bank_se_bcmn.waveArchiveIDs.index(bankBcmnID)
while len(bank_se_bcmn.instruments) < instrIdx:
	bank_se_bcmn.instruments.append(None)

shot1InstIdx = instrIdx
shot1Note = ndspy.soundBank.NoteDefinition(shot1WaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
shot1Inst = ndspy.soundBank.SingleNoteInstrument(shot1Note)
bank_se_bcmn.instruments.append(shot1Inst)
instrIdx += 1

chrg1InstIdx = instrIdx
chrg1Note = ndspy.soundBank.NoteDefinition(chrg1WaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
chrg1Inst = ndspy.soundBank.SingleNoteInstrument(chrg1Note)
bank_se_bcmn.instruments.append(chrg1Inst)
instrIdx += 1

shot2InstIdx = instrIdx
shot2Note = ndspy.soundBank.NoteDefinition(shot2WaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
shot2Inst = ndspy.soundBank.SingleNoteInstrument(shot2Note)
bank_se_bcmn.instruments.append(shot2Inst)
instrIdx += 1

chrg2InstIdx = instrIdx
chrg2Note = ndspy.soundBank.NoteDefinition(chrg2WaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
chrg2Inst = ndspy.soundBank.SingleNoteInstrument(chrg2Note)
bank_se_bcmn.instruments.append(chrg2Inst)
instrIdx += 1

quickGaugeInstIdx = instrIdx
quickGaugeNote = ndspy.soundBank.NoteDefinition(quickGaugeWaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
quickGaugeInst = ndspy.soundBank.SingleNoteInstrument(quickGaugeNote)
bank_se_bcmn.instruments.append(quickGaugeInst)
instrIdx += 1

slowGaugeInstIdx = instrIdx
slowGaugeNote = ndspy.soundBank.NoteDefinition(slowGaugeWaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
slowGaugeInst = ndspy.soundBank.SingleNoteInstrument(slowGaugeNote)
bank_se_bcmn.instruments.append(slowGaugeInst)
instrIdx += 1

resultsItemInstIdx = instrIdx
resultsItemNote = ndspy.soundBank.NoteDefinition(resultsItemWaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
resultsItemInst = ndspy.soundBank.SingleNoteInstrument(resultsItemNote)
bank_se_bcmn.instruments.append(resultsItemInst)
instrIdx += 1

# Adjust Fall Thunder instrument
fallThunderInstIdx = 470
fallThunderNote = ndspy.soundBank.NoteDefinition(fallThunderWaveIdx, swarBcmnIdx, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
fallThunderInst = ndspy.soundBank.SingleNoteInstrument(fallThunderNote)
bank_se_bcmn.instruments[fallThunderInstIdx] = fallThunderInst



# Create new SBNK for Hollow
bank_se_bs0e = ndspy.soundBank.SBNK(unk02=0, waveArchiveIDs=[swarBs0eID])
bankBs0eID = len(sdat.banks)
sdat.banks.append(('BANK_SE_BS0E', bank_se_bs0e))
while len(bank_se_bs0e.instruments) < instrIdx:
	bank_se_bs0e.instruments.append(None)

magicCircleInstIdx = instrIdx
magicCircleNote = ndspy.soundBank.NoteDefinition(magicCircleIdx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
magicCircleInst = ndspy.soundBank.SingleNoteInstrument(magicCircleNote)
bank_se_bs0e.instruments.append(magicCircleInst)
instrIdx += 1

summonVirusInstIdx = instrIdx
summonVirusNote = ndspy.soundBank.NoteDefinition(summonVirusIdx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
summonVirusInst = ndspy.soundBank.SingleNoteInstrument(summonVirusNote)
bank_se_bs0e.instruments.append(summonVirusInst)
instrIdx += 1

thunderBazooka1InstIdx = instrIdx
thunderBazooka1Note = ndspy.soundBank.NoteDefinition(thunderBazooka1Idx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
thunderBazooka1Inst = ndspy.soundBank.SingleNoteInstrument(thunderBazooka1Note)
bank_se_bs0e.instruments.append(thunderBazooka1Inst)
instrIdx += 1

thunderBazooka2InstIdx = instrIdx
thunderBazooka2Note = ndspy.soundBank.NoteDefinition(thunderBazooka2Idx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
thunderBazooka2Inst = ndspy.soundBank.SingleNoteInstrument(thunderBazooka2Note)
bank_se_bs0e.instruments.append(thunderBazooka2Inst)
instrIdx += 1

thunderBazooka3InstIdx = instrIdx
thunderBazooka3Note = ndspy.soundBank.NoteDefinition(thunderBazooka3Idx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
thunderBazooka3Inst = ndspy.soundBank.SingleNoteInstrument(thunderBazooka3Note)
bank_se_bs0e.instruments.append(thunderBazooka3Inst)
instrIdx += 1

magicThunderInstIdx = instrIdx
magicThunderNote = ndspy.soundBank.NoteDefinition(magicThunderIdx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
magicThunderInst = ndspy.soundBank.SingleNoteInstrument(magicThunderNote)
bank_se_bs0e.instruments.append(magicThunderInst)
instrIdx += 1

hollowBarrierInstIdx = instrIdx
hollowBarrierNote = ndspy.soundBank.NoteDefinition(hollowBarrierIdx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
hollowBarrierInst = ndspy.soundBank.SingleNoteInstrument(hollowBarrierNote)
bank_se_bs0e.instruments.append(hollowBarrierInst)
instrIdx += 1

hollowHandsInstIdx = instrIdx
hollowHandsNote = ndspy.soundBank.NoteDefinition(hollowHandsIdx, 0, 60, 127, 127, 127, 125, 64, ndspy.soundBank.NoteType.PCM)
hollowHandsInst = ndspy.soundBank.SingleNoteInstrument(hollowHandsNote)
bank_se_bs0e.instruments.append(hollowHandsInst)
instrIdx += 1

# Add group entry for Hollow SBNK
group_se = ndspy.findInNamedList(sdat.groups, 'GROUP_SE')
bankBs0eGroupEntry = ndspy.soundGroup.GroupEntry(ndspy.soundGroup.GroupEntryType.SBNK, (2 | 4), bankBs0eID)
group_se.append(bankBs0eGroupEntry)



# Add sound effects to SSAR
ssar = ndspy.findInNamedList(sdat.sequenceArchives, 'SEQARC_SE')


saveSlotEvntIdx = len(ssar.eventsData)
saveSlotEvnt = bytearray()
saveSlotEvnt.extend(initInstrument(saveSlotInstIdx).save())
saveSlotEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
saveSlotEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += saveSlotEvnt

saveSlotSseqIdx = len(ssar.sequences)
saveSlotSseqName = 'SE' + str(saveSlotInstIdx) + 'SAVESLOT'
saveSlotSseq = ndspy.soundSequenceArchive.SSARSequence(saveSlotEvntIdx, bankCmnID, 110, 96, 64, 1, parsed=False)
ssar.sequences.append((saveSlotSseqName, saveSlotSseq))

vars.write('.definelabel SE_SAVESLOT,%d\n' % saveSlotSseqIdx)
print('Added', saveSlotSseqName)


megaEquipEvntIdx = len(ssar.eventsData)
megaEquipEvnt = bytearray()
megaEquipEvnt.extend(initInstrument(megaEquipInstIdx).save())
megaEquipEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
megaEquipEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += megaEquipEvnt

megaEquipSseqIdx = len(ssar.sequences)
megaEquipSseqName = 'SE' + str(megaEquipInstIdx) + 'MEGAEQUIP'
megaEquipSseq = ndspy.soundSequenceArchive.SSARSequence(megaEquipEvntIdx, bankCmnID, 120, 96, 64, 1, parsed=False)
ssar.sequences.append((megaEquipSseqName, megaEquipSseq))

vars.write('.definelabel SE_MEGAEQUIP,%d\n' % megaEquipSseqIdx)
print('Added', megaEquipSseqName)


shot1EvntIdx = len(ssar.eventsData)
shot1Evnt = bytearray()
shot1Evnt.extend(initInstrument(shot1InstIdx).save())
shot1Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
shot1Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += shot1Evnt

shot1SseqIdx = len(ssar.sequences)
shot1SseqName = 'SE' + str(shot1InstIdx) + 'HUMORSHOT1'
shot1Sseq = ndspy.soundSequenceArchive.SSARSequence(shot1EvntIdx, bankBcmnID, 90, 96, 64, 12, parsed=False)
ssar.sequences.append((shot1SseqName, shot1Sseq))

vars.write('.definelabel SE_HUMORSHOT1,%d\n' % shot1SseqIdx)
print('Added', shot1SseqName)


chrg1EvntIdx = len(ssar.eventsData)
chrg1Evnt = bytearray()
chrg1Evnt.extend(initInstrument(chrg1InstIdx).save())
chrg1Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
chrg1Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += chrg1Evnt

chrg1SseqIdx = len(ssar.sequences)
chrg1SseqName = 'SE' + str(chrg1SseqIdx) + 'HUMORCHRG1'
chrg1Sseq = ndspy.soundSequenceArchive.SSARSequence(chrg1EvntIdx, bankBcmnID, 100, 96, 64, 12, parsed=False)
ssar.sequences.append((chrg1SseqName, chrg1Sseq))

vars.write('.definelabel SE_HUMORCHRG1,%d\n' % chrg1SseqIdx)
print('Added', chrg1SseqName)


shot2EvntIdx = len(ssar.eventsData)
shot2Evnt = bytearray()
shot2Evnt.extend(initInstrument(shot2InstIdx).save())
shot2Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
shot2Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += shot2Evnt

shot2SseqIdx = len(ssar.sequences)
shot2SseqName = 'SE' + str(shot2InstIdx) + 'HUMORSHOT2'
shot2Sseq = ndspy.soundSequenceArchive.SSARSequence(shot2EvntIdx, bankBcmnID, 110, 96, 64, 12, parsed=False)
ssar.sequences.append((shot2SseqName, shot2Sseq))

vars.write('.definelabel SE_HUMORSHOT2,%d\n' % shot2SseqIdx)
print('Added', shot2SseqName)


chrg2EvntIdx = len(ssar.eventsData)
chrg2Evnt = bytearray()
chrg2Evnt.extend(initInstrument(chrg2InstIdx).save())
chrg2Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
chrg2Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += chrg2Evnt

chrg2SseqIdx = len(ssar.sequences)
chrg2SseqName = 'SE' + str(chrg2SseqIdx) + 'HUMORCHRG2'
chrg2Sseq = ndspy.soundSequenceArchive.SSARSequence(chrg2EvntIdx, bankBcmnID, 110, 96, 64, 12, parsed=False)
ssar.sequences.append((chrg2SseqName, chrg2Sseq))

vars.write('.definelabel SE_HUMORCHRG2,%d\n' % chrg2SseqIdx)
print('Added', chrg2SseqName)


quickGaugeEvntIdx = len(ssar.eventsData)
quickGaugeEvnt = bytearray()
quickGaugeEvnt.extend(initInstrument(quickGaugeInstIdx).save())
quickGaugeEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
quickGaugeEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += quickGaugeEvnt

quickGaugeSseqIdx = len(ssar.sequences)
quickGaugeSseqName = 'SE' + str(quickGaugeSseqIdx) + 'QUICKGAUGE'
quickGaugeSseq = ndspy.soundSequenceArchive.SSARSequence(quickGaugeEvntIdx, bankBcmnID, 80, 96, 64, 1, parsed=False)
ssar.sequences.append((quickGaugeSseqName, quickGaugeSseq))

vars.write('.definelabel SE_QUICKGAUGE,%d\n' % quickGaugeSseqIdx)
print('Added', quickGaugeSseqName)


slowGaugeEvntIdx = len(ssar.eventsData)
slowGaugeEvnt = bytearray()
slowGaugeEvnt.extend(initInstrument(slowGaugeInstIdx).save())
slowGaugeEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
slowGaugeEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += slowGaugeEvnt

slowGaugeSseqIdx = len(ssar.sequences)
slowGaugeSseqName = 'SE' + str(slowGaugeSseqIdx) + 'SLOWGAUGE'
slowGaugeSseq = ndspy.soundSequenceArchive.SSARSequence(slowGaugeEvntIdx, bankBcmnID, 80, 96, 64, 1, parsed=False)
ssar.sequences.append((slowGaugeSseqName, slowGaugeSseq))

vars.write('.definelabel SE_SLOWGAUGE,%d\n' % slowGaugeSseqIdx)
print('Added', slowGaugeSseqName)


resultsItemEvntIdx = len(ssar.eventsData)
resultsItemEvnt = bytearray()
resultsItemEvnt.extend(initInstrument(resultsItemInstIdx).save())
resultsItemEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
resultsItemEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += resultsItemEvnt

resultsItemSseqIdx = len(ssar.sequences)
resultsItemSseqName = 'SE' + str(resultsItemSseqIdx) + 'RESCUE'
resultsItemSseq = ndspy.soundSequenceArchive.SSARSequence(resultsItemEvntIdx, bankBcmnID, 125, 96, 64, 1, parsed=False)
ssar.sequences.append((resultsItemSseqName, resultsItemSseq))

vars.write('.definelabel SE_RESCUE,%d\n' % resultsItemSseqIdx)
print('Added', resultsItemSseqName)

# Adjust Fall Thunder bank ID
fallThunderSseqIdx = 470
fallThunderSseqName = ssar.sequences[fallThunderSseqIdx][0]
fallThunderSseq = ssar.sequences[fallThunderSseqIdx][1]
fallThunderSseq.bankID = bankBcmnID
ssar.sequences[fallThunderSseqIdx] = (fallThunderSseqName, fallThunderSseq)


chrgDone2EvntIdx = len(ssar.eventsData)
chrgDone2Evnt = bytearray()
chrgDone2Evnt.extend(initInstrument(202).save())
chrgDone2Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(62, 127, 0).save())
chrgDone2Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += chrgDone2Evnt

chrgDone2SseqIdx = len(ssar.sequences)
chrgDone2SseqName = 'SE' + str(chrgDone2SseqIdx) + 'CHARGEDONE2'
chrgDone2Sseq = ndspy.soundSequenceArchive.SSARSequence(chrgDone2EvntIdx, bankBcmnID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((chrgDone2SseqName, chrgDone2Sseq))

vars.write('.definelabel SE_CHARGEDONE2,%d\n' % chrgDone2SseqIdx)
print('Added', chrgDone2SseqName)


# Add Hollow sound effects to SSAR
magicCircleEvntIdx = len(ssar.eventsData)
magicCircleEvnt = bytearray()
magicCircleEvnt.extend(initInstrument(magicCircleInstIdx).save())
magicCircleEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
magicCircleEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += magicCircleEvnt

magicCircleSseqIdx = len(ssar.sequences)
magicCircleSseqName = 'SE' + str(magicCircleInstIdx) + 'MAGICCIRCLE'
magicCircleSseq = ndspy.soundSequenceArchive.SSARSequence(magicCircleEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((magicCircleSseqName, magicCircleSseq))

vars.write('.definelabel SE_MAGICCIRCLE,%d\n' % magicCircleSseqIdx)
print('Added', magicCircleSseqName)


summonVirusEvntIdx = len(ssar.eventsData)
summonVirusEvnt = bytearray()
summonVirusEvnt.extend(initInstrument(summonVirusInstIdx).save())
summonVirusEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
summonVirusEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += summonVirusEvnt

summonVirusSseqIdx = len(ssar.sequences)
summonVirusSseqName = 'SE' + str(summonVirusInstIdx) + 'SUMMONVIRUS'
summonVirusSseq = ndspy.soundSequenceArchive.SSARSequence(summonVirusEvntIdx, bankBs0eID, 120, 96, 64, 1, parsed=False)
ssar.sequences.append((summonVirusSseqName, summonVirusSseq))

vars.write('.definelabel SE_SUMMONVIRUS,%d\n' % summonVirusSseqIdx)
print('Added', summonVirusSseqName)


thunderBazooka1EvntIdx = len(ssar.eventsData)
thunderBazooka1Evnt = bytearray()
thunderBazooka1Evnt.extend(initInstrument(thunderBazooka1InstIdx).save())
thunderBazooka1Evnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
thunderBazooka1Evnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += thunderBazooka1Evnt

thunderBazooka1SseqIdx = len(ssar.sequences)
thunderBazooka1SseqName = 'SE' + str(thunderBazooka1InstIdx) + 'THUNDERBZ1'
thunderBazooka1Sseq = ndspy.soundSequenceArchive.SSARSequence(thunderBazooka1EvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((thunderBazooka1SseqName, thunderBazooka1Sseq))

vars.write('.definelabel SE_THUNDERBZ1,%d\n' % thunderBazooka1SseqIdx)
print('Added', thunderBazooka1SseqName)


thunderBazooka2AEvntIdx = len(ssar.eventsData)
thunderBazooka2AEvnt = bytearray()
thunderBazooka2AEvnt.extend(initInstrument(thunderBazooka2InstIdx).save())
thunderBazooka2AEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
thunderBazooka2AEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += thunderBazooka2AEvnt

thunderBazooka2ASseqIdx = len(ssar.sequences)
thunderBazooka2ASseqName = 'SE' + str(thunderBazooka2InstIdx) + 'THUNDERBZ2'
thunderBazooka2ASseq = ndspy.soundSequenceArchive.SSARSequence(thunderBazooka2AEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((thunderBazooka2ASseqName, thunderBazooka2ASseq))

vars.write('.definelabel SE_THUNDERBZ2,%d\n' % thunderBazooka2ASseqIdx)
print('Added', thunderBazooka2ASseqName)


thunderBazooka3AEvntIdx = len(ssar.eventsData)
thunderBazooka3AEvnt = bytearray()
thunderBazooka3AEvnt.extend(initInstrument(thunderBazooka3InstIdx).save())
thunderBazooka3AEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
thunderBazooka3AEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += thunderBazooka3AEvnt

thunderBazooka3ASseqIdx = len(ssar.sequences)
thunderBazooka3ASseqName = 'SE' + str(thunderBazooka3InstIdx) + 'THUNDERBZ3'
thunderBazooka3ASseq = ndspy.soundSequenceArchive.SSARSequence(thunderBazooka3AEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((thunderBazooka3ASseqName, thunderBazooka3ASseq))

vars.write('.definelabel SE_THUNDERBZ3,%d\n' % thunderBazooka3ASseqIdx)
print('Added', thunderBazooka3ASseqName)


thunderBazooka2BEvntIdx = len(ssar.eventsData)
thunderBazooka2BEvnt = bytearray()
thunderBazooka2BEvnt.extend(initInstrument(thunderBazooka2InstIdx).save())
thunderBazooka2BEvnt.extend(ndspy.soundSequence.TransposeSequenceEvent(254).save())
thunderBazooka2BEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
thunderBazooka2BEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += thunderBazooka2BEvnt

thunderBazooka2BSseqIdx = len(ssar.sequences)
thunderBazooka2BSseqName = 'SE' + str(thunderBazooka2InstIdx) + 'THUNDERBZ2B'
thunderBazooka2BSseq = ndspy.soundSequenceArchive.SSARSequence(thunderBazooka2BEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((thunderBazooka2BSseqName, thunderBazooka2BSseq))

vars.write('.definelabel SE_THUNDERBZ2B,%d\n' % thunderBazooka2BSseqIdx)
print('Added', thunderBazooka2BSseqName)


thunderBazooka3BEvntIdx = len(ssar.eventsData)
thunderBazooka3BEvnt = bytearray()
thunderBazooka3BEvnt.extend(initInstrument(thunderBazooka3InstIdx).save())
thunderBazooka3BEvnt.extend(ndspy.soundSequence.TransposeSequenceEvent(254).save())
thunderBazooka3BEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
thunderBazooka3BEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += thunderBazooka3BEvnt

thunderBazooka3BSseqIdx = len(ssar.sequences)
thunderBazooka3BSseqName = 'SE' + str(thunderBazooka3InstIdx) + 'THUNDERBZ3B'
thunderBazooka3BSseq = ndspy.soundSequenceArchive.SSARSequence(thunderBazooka3BEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((thunderBazooka3BSseqName, thunderBazooka3BSseq))

vars.write('.definelabel SE_THUNDERBZ3B,%d\n' % thunderBazooka3BSseqIdx)
print('Added', thunderBazooka3BSseqName)


magicThunderAEvntIdx = len(ssar.eventsData)
magicThunderAEvnt = bytearray()
magicThunderAEvnt.extend(initInstrument(magicThunderInstIdx).save())
magicThunderAEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
magicThunderAEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += magicThunderAEvnt

magicThunderASseqIdx = len(ssar.sequences)
magicThunderASseqName = 'SE' + str(magicThunderInstIdx) + 'MGTHUNDER'
magicThunderASseq = ndspy.soundSequenceArchive.SSARSequence(magicThunderAEvntIdx, bankBs0eID, 90, 96, 64, 1, parsed=False)
ssar.sequences.append((magicThunderASseqName, magicThunderASseq))

vars.write('.definelabel SE_MGTHUNDER,%d\n' % magicThunderASseqIdx)
print('Added', magicThunderASseqName)


magicThunderBEvntIdx = len(ssar.eventsData)
magicThunderBEvnt = bytearray()
magicThunderBEvnt.extend(initInstrument(magicThunderInstIdx).save())
magicThunderBEvnt.extend(ndspy.soundSequence.TransposeSequenceEvent(254).save())
magicThunderBEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
magicThunderBEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += magicThunderBEvnt

magicThunderBSseqIdx = len(ssar.sequences)
magicThunderBSseqName = 'SE' + str(magicThunderInstIdx) + 'MGTHUNDERB'
magicThunderBSseq = ndspy.soundSequenceArchive.SSARSequence(magicThunderBEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((magicThunderBSseqName, magicThunderBSseq))

vars.write('.definelabel SE_MGTHUNDERB,%d\n' % magicThunderBSseqIdx)
print('Added', magicThunderBSseqName)


hollowBarrierEvntIdx = len(ssar.eventsData)
hollowBarrierEvnt = bytearray()
hollowBarrierEvnt.extend(initInstrument(hollowBarrierInstIdx).save())
hollowBarrierEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
hollowBarrierEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += hollowBarrierEvnt

hollowBarrierSseqIdx = len(ssar.sequences)
hollowBarrierSseqName = 'SE' + str(hollowBarrierInstIdx) + 'HOLLOWBARRIER'
hollowBarrierSseq = ndspy.soundSequenceArchive.SSARSequence(hollowBarrierEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((hollowBarrierSseqName, hollowBarrierSseq))

vars.write('.definelabel SE_HOLLOWBARRIER,%d\n' % hollowBarrierSseqIdx)
print('Added', hollowBarrierSseqName)


hollowHandsAEvntIdx = len(ssar.eventsData)
hollowHandsAEvnt = bytearray()
hollowHandsAEvnt.extend(initInstrument(hollowHandsInstIdx).save())
hollowHandsAEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
hollowHandsAEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += hollowHandsAEvnt

hollowHandsASseqIdx = len(ssar.sequences)
hollowHandsASseqName = 'SE' + str(hollowHandsInstIdx) + 'HOLLOWHANDS'
hollowHandsASseq = ndspy.soundSequenceArchive.SSARSequence(hollowHandsAEvntIdx, bankBs0eID, 100, 96, 64, 1, parsed=False)
ssar.sequences.append((hollowHandsASseqName, hollowHandsASseq))

vars.write('.definelabel SE_HOLLOWHANDS,%d\n' % hollowHandsASseqIdx)
print('Added', hollowHandsASseqName)


hollowHandsBEvntIdx = len(ssar.eventsData)
hollowHandsBEvnt = bytearray()
hollowHandsBEvnt.extend(initInstrument(hollowHandsInstIdx).save())
hollowHandsBEvnt.extend(ndspy.soundSequence.TransposeSequenceEvent(250).save())
hollowHandsBEvnt.extend(ndspy.soundSequence.NoteSequenceEvent(60, 127, 0).save())
hollowHandsBEvnt.extend(ndspy.soundSequence.EndTrackSequenceEvent().save())
ssar.eventsData += hollowHandsBEvnt

hollowHandsBSseqIdx = len(ssar.sequences)
hollowHandsBSseqName = 'SE' + str(hollowHandsInstIdx) + 'HOLLOWHANDSB'
hollowHandsBSseq = ndspy.soundSequenceArchive.SSARSequence(hollowHandsBEvntIdx, bankBs0eID, 120, 96, 64, 1, parsed=False)
ssar.sequences.append((hollowHandsBSseqName, hollowHandsBSseq))

vars.write('.definelabel SE_HOLLOWHANDSB,%d\n' % hollowHandsBSseqIdx)
print('Added', hollowHandsBSseqName)


vars.write('.definelabel BANK_SE_BS0E,%d\n' % bankBs0eID)

newSeqPlayers = [
	('PLAYER_BGM', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 8000)),
	('PLAYER_BGM2', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 8000)),
	('PLAYER_SE', ndspy.soundSequencePlayer.SequencePlayer(8, set(), 0)),
	('PLAYER_SE03_LALAMUTEKI', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 0)),
	('PLAYER_SE04_LALAIDOFUKA', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 0)),
	('PLAYER_SE05_LALAKONRAN', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 0)),
	('PLAYER_SE06_LALAKAIFUKU', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 0)),
	('PLAYER_SE07_LALABLIND', ndspy.soundSequencePlayer.SequencePlayer(1, set(), 0)),
	('PLAYER_SE08_ERROR', ndspy.soundSequencePlayer.SequencePlayer(2, set(), 0)),
	('PLAYER_SE09_MOJI', ndspy.soundSequencePlayer.SequencePlayer(2, set(), 0)),
	('PLAYER_SE10_CURSOR', ndspy.soundSequencePlayer.SequencePlayer(2, set(), 0)),
	('PLAYER_SE11_KETTEICANCEL', ndspy.soundSequencePlayer.SequencePlayer(2, set(), 0)),
]

if True:
	# Use player ID 1 for battle BGM
	for sseq in sdat.sequences:
		if sseq[0] is None:
			continue
		if sseq[0] in ['BGM27BATTLE', 'BGM28BOSS', 'BGM29LASTBOSS', 'BGM30WIN', 'BGM31WIN2', 'BGM32LOSE']:
			sseq[1].playerID = 1
		# print('SSEQ', sseq[0], sseq[1].playerID)

	# Move SFX player IDs [1..10] to [2..11]
	# KETTEI (confirm) will overlap with CANCEL
	for ssar in sdat.sequenceArchives:
		# print('SSAR', ssar[0])
		for seq in ssar[1].sequences:
			if seq[0] is None:
				continue
			if seq[1].playerID <= 10:
				# Reserve playerID for battle music
				seq[1].playerID += 1
	# Adjust sequence players
	for i in range(0, len(newSeqPlayers)):
		sdat.sequencePlayers[i] = newSeqPlayers[i]

sdat.saveToFile(sdatPath)
vars.close()
