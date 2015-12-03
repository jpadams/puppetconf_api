# Plain HTTP
# puppet_enterprise::profile::console::console_services_plaintext_status_enabled must be set to true
# in console, PE Console group, puppet_enterprise::profile::console class, console_services_plaintext_status_enabled
Invoke-WebRequest -Uri http://$(puppet config print server):8123/status/v1/services
