'''
Created on Sep 8, 2018

@author: shibi
'''
import smtplib
import subprocess
import string
from sys import stdout
p=subprocess.Popen("df -h", shell=True, stdout=subprocess.PIPE)
Msg=p.stdout.read()
From="shibinavin@gmail.com"
To="shibinavin@gmail.com"
Subject="Nightly disk usage report"
msg=string.Join(("From:%s" % From,
                 "To: %s" % To,
                 "Subject: %s" % Subject,
                 "",
                 Msg), "\r\n")
server=smtplib.SMTP('localhost')
server.sendmail(From,To,msg)
server.quit()