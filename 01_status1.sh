# puppet_enterprise::profile::console::console_services_plaintext_status_enabled must be set to true
# in console, PE Console group, puppet_enterprise::profile::console class, console_services_plaintext_status_enabled

curl -X GET http://localhost:8123/status/v1/services
