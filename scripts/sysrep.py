'''
Created on Sep 7, 2018

@author: shibi
'''
import platform
profile=[platform.architecture(),
         platform.dist(),
         platform.libc_ver(),
         platform.mac_ver(),
         platform.machine(),
         platform.node(),
         platform.platform(),
         platform.processor(),
         platform.python_build(),
         platform.python_compiler(),
         platform.python_version(),
         platform.version(),
         platform.system(),
         platform.uname(),]
for item in profile:
    print (item)