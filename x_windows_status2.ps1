# Install chocolatey on your Windows agent via the Master
# and install curl package with chocolatey
#
# package { 'curl': provider => chocolatey, }

# Similar to Linux invocation. Note '&' to invoke command, 'curl.exe'
# so Invoke-WebRequest is not called with its alias 'curl', and '`'
# backtick characters used as line continuation. I left CR-LF in.
# Cmdlets at end pretty print the JSON. 
# If you don't like progress meter you can use --silent, but errors will be hidden.
 
& curl.exe -X GET `
--cert   $(puppet config print hostcert) `
--key    $(puppet config print hostprivkey) `
--cacert $(puppet config print localcacert) `
 https://$(puppet config print server):4433/status/v1/services | ConvertFrom-Json | ConvertTo-Json
