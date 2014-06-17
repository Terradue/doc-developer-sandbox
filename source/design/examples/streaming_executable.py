#!/usr/bin/env python

# import modules
import os
import sys

# import the cioppy module
sys.path.append('/usr/lib/ciop/python/')
import cioppy as ciop

myparam1 = ciop.getparam("param1")
myparam2 = ciop.getparam("param2")

ciop.log("INFO", "I'm running a job with paramaters " + myparam1 + " " + myparam2)

# input comes from STDIN (standard input)
for line in sys.stdin:
    
    ciop.log('INFO', 'input: ' + line)

    # copy the input to TMPDIR folder (set as an environmental variable)
    res = ciop.copy(line, os.environ['TMPDIR'])

    ciop.log('DEBUG', 'local path:' + res[0].rstrip('\n'))    
  
    # do something with the local path
    
    # publish
    pub = ciop.publish(os.environ['TMPDIR'] + '/myresult')

ciop.log('INFO', 'Done my share of the work!')
