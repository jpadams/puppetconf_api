#!/usr/bin/python

import requests
import json

r = requests.get('http://localhost:8123/status/v1/services')
j = json.loads(r.content)
print j['rbac-service']['state']

