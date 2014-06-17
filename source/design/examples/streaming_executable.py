#!/usr/bin/env python

# import modules
import os
import sys
import classes.GDALCalcNDVI as ndvi

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
    
    obj = ndvi.GDALCalcNDVI()
  
    obj.calc_ndvi(res[0].rstrip(), '/tmp/result.tif')

    pub = ciop.publish('/tmp/result.tif')

    metadata = [ "ical:dtstart=2001-01-10T14:00:00", 
                "ical:dtend=2001-01-10T14:05:00",
                "dc:identifier=mydataset",
                "dct:spatial=MULTIPOLYGON(((25.55215 36.97701,24.740512 37.091395,24.496927 35.950137,25.284346 35.839142,25.55215 36.97701)))",
                "dclite4g:onlineResource=" + pub[0].rstrip()]
    
    ciop.log('DEBUG', 'Going to register')

    ciop.register('http://localhost/catalogue/sandbox/rdf',
                    'file:///application/pyjob/etc/series.rdf',
                    metadata)

    ciop.publish('/tmp/result.tif', metalink = True)

ciop.log('INFO', 'Done my share of the work!')
