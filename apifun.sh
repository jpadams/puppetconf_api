## DEMOS!

# Try this:
telnet localhost 80
GET /

# https://docs.puppetlabs.com/pe/latest/status_api.html#get-statusv1services

telnet localhost 8123 
GET /status/v1/services HTTP/1.1
host: localhost

curl -X GET http://localhost:8123/status/v1/services

# Put this in your browser (I like the JSONview plugin):
http://learning.puppetlabs.vm:8123/status/v1/services

# Super-simple data example
curl -X GET http://localhost:8123/status/v1/services --data-urlencode 'level=debug'
# Read up on curl flags with the man page!
curl -s -D - -X GET http://localhost:8123/status/v1/services --data 'level=debug' -o /dev/null

# lots of folks start out with using localhost, but you should get in the habit
# of using a certificate name or DNS alternative name. Basically a name on the cert
# of the server you're trying to connect to. You'll need that once we start using SSL either
# from the host where the service is running or if you're using the API from another host.
# SSL works that way so you can't have a man in the middle
# intercept your secrets or send you bogus info.
# (here we're using puppet config print to get the location of the local certs for this master. easy) 
# Usually, when you try to make an SSL GET to localhost, you'll get an error, because the CN (common name)
# on the cert is not "localhost". With the Learning VM, you see that a lot of DNS alternative names
# were also put into the cert.

curl -X GET \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://localhost:4433/status/v1/services

# openssl x509 -in $(puppet config print hostcert) -inform pem -text | grep learning

curl -X GET \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://learning.puppetlabs.vm:4433/status/v1/services

curl -X GET \
--cert   /etc/puppetlabs/puppet/ssl/certs/foobar.pem \
--key    /etc/puppetlabs/puppet/ssl/private_keys/foobar.pem \
--cacert /etc/puppetlabs/puppet/ssl/ca/ca_crt.pem \
https://learning.puppetlabs.vm:4433/status/v1/services

## TOOLS!

# we use curl throughout. Other tools work, but most of our docs examples are curl. You might use curl or the friendly
# httpie in your scripts, but you may also use a python or ruby library, or a GUI tool like postman. Here I'll
# show a couple of examples using other tools. It should be clear that the basic idea is the same, once you know the basics
# of VERB, URL, DATA, and AUTH.
# (these examples will work if $(puppet config print server) has been added to the CA's client_whitelist in the console)

curl -X GET \
--cert   $(puppet config print hostcert) \
--key    $(puppet config print hostprivkey) \
--cacert $(puppet config print localcacert) \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/learning.puppetlabs.vm?environment=production

## WGET 
wget \
--quiet \
--output-document=- \
--certificate=$(puppet config print hostcert) \
--private-key=$(puppet config print hostprivkey) \
--ca-certificate=$(puppet config print localcacert) \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/learning.puppetlabs.vm?environment=production

## HTTPIE
http \
--body \
--cert=$(puppet config print hostcert) \
--cert-key=$(puppet config print hostprivkey) \
--verify=$(puppet config print localcacert) \
https://learning.puppetlabs.vm:8140/puppet-ca/v1/certificate_status/learning.puppetlabs.vm?environment=production
