#!/usr/bin/python

import requests
import json

r = requests.get('http://localhost:8123/status/v1/services')
print json.dumps(json.loads(r.content), indent=2)

