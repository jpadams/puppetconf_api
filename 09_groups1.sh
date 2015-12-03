# ./09_groups1.sh > groups.json
# ./then if SOMEONE ruthlessly DELETEs groups, I can restore them all!

curl -X GET \
--tlsv1 \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):4433/classifier-api/v1/groups | python -m json.tool
