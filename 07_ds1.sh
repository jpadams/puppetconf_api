# ./07_ds1.sh > ds.json

curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://learning.puppetlabs.vm:4433/rbac-api/v1/ds | python -m json.tool
