#!/usr/bin/python

import sys
import requests
import json

group_name = sys.argv[1]
url = "https://learning.puppetlabs.vm:4433/classifier-api/v1/groups"
r = requests.get(url,
      verify='/etc/puppetlabs/puppet/ssl/certs/ca.pem',
      cert=('/etc/puppetlabs/puppet/ssl/certs/learning.puppetlabs.vm.pem',
            '/etc/puppetlabs/puppet/ssl/private_keys/learning.puppetlabs.vm.pem'))
json_groups = json.loads(r.content)
my_group = next((group for group in json_groups if group['name'] == group_name), None)
print my_group['id']
print json.dumps(my_group, indent=2)

# example usage
# ./x_show_group.py "PE Master"
