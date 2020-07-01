#!/usr/bin/python
import sys,os
for l in sys.stdin:   
    print l.strip("\n").replace("!!FORMULA!!",os.environ["FORMULA"])
