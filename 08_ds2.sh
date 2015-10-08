curl -X PUT -H 'Content-Type: application/json' \
--data @ds.json \
--cert   `puppet config print hostcert` \
--key    `puppet config print hostprivkey` \
--cacert `puppet config print localcacert` \
https://learning.puppetlabs.demo:4433/rbac-api/v1/ds | python -m json.tool
