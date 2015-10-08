curl -X GET \
--data-urlencode 'level=debug' \
http://localhost:8123/status/v1/services | python -m json.tool
