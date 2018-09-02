'''
Created on Sep 2, 2018

@author: shibi
'''
import winrm

s = winrm.Session('192.168.56.1', auth=())
r = s.run_cmd('ipconfig', ['/all'])