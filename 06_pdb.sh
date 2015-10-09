curl -X GET \
--cert /etc/puppetlabs/puppet/ssl/certs/lizzi.pem \
--key /etc/puppetlabs/puppet/ssl/private_keys/lizzi.pem \
--cacert /etc/puppetlabs/puppet/ssl/ca/ca_crt.pem \
--data-urlencode query='["and", ["=", "name", "osfamily"], ["=", "value", "RedHat"]]' \
https://learning.puppetlabs.vm:8081/pdb/query/v4/facts