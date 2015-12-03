# --dump-header (-D) dumps headers to a file, in this case STDOUT (-)
# --location (-L) follows the location in 3XX redirects. In this case to the
# location of a newly created node groups with its unique group id. 

# uses immutable trusted facts and structured facts in the matching rule.
# currently API-only features!

curl -X POST -H "Content-type: application/json" \
--tlsv1 \
--dump-header - \
--location \
--data \
'{
    "name": "A RHEL Tomcat group",
    "classes": {},
    "environment": "production",
    "environment_trumps": false,
    "parent": "00000000-0000-4000-8000-000000000000",
    "rule": [
      "and",
        [ "=",
          [ "trusted", "extensions", "pp_role" ],
          "tomcat"
        ],
        [ "=",
          [ "fact", "os", "family" ],
          "RedHat"
        ]
    ],
    "variables": {}
}' \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
 https://$(puppet config print server):4433/classifier-api/v1/groups
