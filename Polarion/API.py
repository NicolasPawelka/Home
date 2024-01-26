from polarion import polarion
client = polarion.Polarion('https://polarion-dev2.newtec.zz/polarion','PawelkaN','KORRNiggelus3713.,.,',verify_certificate=False)
project = client.getProject('Spielprojekt_IEC62443')
workitem = project.getWorkitem('SIEC-1899')
print("###############################")
print(workitem)
#run = project.getTestRun('SWQ-0001')
#plan = project.getPlan('00002')