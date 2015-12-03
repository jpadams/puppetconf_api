# create new agent cert
puppet agent -t --certname example1

# check cert signing status 
curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://$(puppet config print server):8140/puppet-ca/v1/certificate_status/example1?environment=production

echo

# sign the cert
curl -X PUT -H 'Content-Type: application/json' \
--tlsv1 \
--data \
'{"desired_state":"signed"}' \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://$(puppet config print server):8140/puppet-ca/v1/certificate_status/example1?environment=production

echo

# check signing status again. Signed! 
curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://$(puppet config print server):8140/puppet-ca/v1/certificate_status/example1?environment=production

echo; echo

# clean up
puppet cert clean example1
