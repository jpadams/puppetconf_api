curl -X GET \
--tlsv1 \
--cert   /etc/puppetlabs/puppet/ssl/certs/lizzi.pem \
--key    /etc/puppetlabs/puppet/ssl/private_keys/lizzi.pem \
--cacert /etc/puppetlabs/puppet/ssl/certs/ca.pem \
https://learning.puppetlabs.vm:4433/status/v1/services | python -m json.tool
