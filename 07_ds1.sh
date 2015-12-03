# ./07_ds1.sh > ds.json

curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):4433/rbac-api/v1/ds | python -m json.tool

# This backticks syntax also works on *nix.
# Run the `puppet config print` commands on the
# command line to see the output.
#curl -X GET \
#--tlsv1 \
#--cert   `puppet config print hostcert` \
#--key    `puppet config print hostprivkey` \
#--cacert `puppet config print localcacert` \
#https://learning.puppetlabs.vm:4433/rbac-api/v1/ds | python -m json.tool
