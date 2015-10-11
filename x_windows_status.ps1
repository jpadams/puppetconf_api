# Plain HTTP
Invoke-WebRequest -Uri http://learning.puppetlabs.vm:8123/status/v1/services

# Work in Progress: HTTPS using agent cert on Windows server
#Invoke-WebRequest -Uri https://learning.puppetlabs.vm:4433/status/v1/services -Certificate $(puppet config print hostcert)
