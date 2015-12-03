# original from puppetconf talk
#curl -X GET \
#--tlsv1 \
#--cert /etc/puppetlabs/puppet/ssl/certs/lizzi.pem \
#--key /etc/puppetlabs/puppet/ssl/private_keys/lizzi.pem \
#--cacert /etc/puppetlabs/puppet/ssl/ca/ca_crt.pem \
#--data-urlencode query='["and", ["=", "name", "osfamily"], ["=", "value", "RedHat"]]' \
#https://learning.puppetlabs.vm:8081/pdb/query/v4/facts

curl -X GET \
--tlsv1 \
--data-urlencode query='["and", ["=", "name", "osfamily"], ["=", "value", "RedHat"]]' \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):8081/pdb/query/v4/facts
