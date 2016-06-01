import winrm

s = winrm.Session('192.168.1.171', auth=('Ansible', '540T6un!'))
r = s.run_cmd('ipconfig', ['/all'])

