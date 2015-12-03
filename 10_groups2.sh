# This one won't work at all w/o content type header

curl -X POST -H "Content-type: application/json" \
--tlsv1 \
--data @groups.json \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):4433/classifier-api/v1/import-hierarchy
