#!/usr/bin/python3
import datetime
import json
import os

DATEFORMAT = '%Y%m%dT%H%M%SZ'

data = json.loads(os.popen('timew export today').read())
last = data[-1]

if 'end' in last:
    time = datetime.datetime.strptime(last['end'], DATEFORMAT)
else:
    time = datetime.datetime.strptime(last['start'], DATEFORMAT)

delta = datetime.datetime.utcnow() - time

print(f'{delta.seconds//3600:02d}:{delta.seconds//60 % 60:02d}')
