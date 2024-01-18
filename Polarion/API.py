from polarion import polarion
client = polarion.Polarion('https://polarion-dev2.newtec.zz/polarion','PawelkaN','KORRNiggelus3713.,.,',verify_certificate=False)
project = client.getProject('Python')
#workitem = project.getWorkitem('PYTH-510')
#run = project.getTestRun('SWQ-0001')
#plan = project.getPlan('00002')