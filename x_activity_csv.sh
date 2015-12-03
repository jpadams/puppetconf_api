# example of using the activity service API to pull CSV report

curl -X GET \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://$(puppet config print server):4433/activity-api/v1/events.csv?service_id=classifier

# 1) run this as ./get_classifier_csv.sh > out.csv
# 2) open in excel or similar
# 3) sort as needed
