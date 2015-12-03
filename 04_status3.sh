# original from puppetconf talk
#curl -X GET \
#--tlsv1 \
#--cert   /etc/puppetlabs/puppet/ssl/certs/lizzi.pem \
#--key    /etc/puppetlabs/puppet/ssl/private_keys/lizzi.pem \
#--cacert /etc/puppetlabs/puppet/ssl/certs/ca.pem \
#https://learning.puppetlabs.vm:4433/status/v1/services | python -m json.tool

curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):4433/status/v1/services | python -m json.tool
