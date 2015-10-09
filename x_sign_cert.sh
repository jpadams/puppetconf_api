# create new agent cert
puppet agent -t --certname example1

# check cert signing status 
curl -X GET \
--cert   `puppet config print hostcert` \
--key    `puppet config print hostprivkey` \
--cacert `puppet config print localcacert` \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/example1?environment=production

echo

# sign the cert
curl -X PUT -H 'Content-Type: application/json' \
--data \
'{"desired_state":"signed"}' \
--cert   `puppet config print hostcert` \
--key    `puppet config print hostprivkey` \
--cacert `puppet config print localcacert` \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/example1?environment=production

echo

# check signing status again. Signed! 
curl -X GET \
--cert   `puppet config print hostcert` \
--key    `puppet config print hostprivkey` \
--cacert `puppet config print localcacert` \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/example1?environment=production

echo; echo

# clean up
puppet cert clean example1
