# puppetconf_api

#####Recent changes:
I changed (most of) the examples to use $(puppet config print hostcert) instead of \`puppet config print hostcert\` for [command substitution](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_03) since that syntax works on Windows as well as *nix.

I also added "--tlsv1" to all of the `curl` commands because I realized that some people's `curl` might be trying to use SSLv2 or SSLv3 which are disabled in Puppet services because of vulnerabilities like POODLE. This forces `curl` to use a protocol in the TLS 1.x family. PE 2015.2.x uses TLS 1.2 by default. You can check this out with `curl` by trying to use a different explicit protocol like "--sslv3" with the "-v" verbose option and watching it fail. You can also use these fun `openssl` commands:

```
openssl s_client -ssl3 -connect learning.puppetlabs.vm:8140
openssl s_client -tls1 -connect learning.puppetlabs.vm:8140
```

The presentation we used is available on SlideShare at
<http://www.slideshare.net/JeremyAdams2/puppetconf-2015-puppet-api-roundup>

These examples were done on the Learning VM that you can find at <http://learn.puppetlabs.com>.

If you want to set up your Learning VM to be able to hit the Console Services
'status' API via HTTP on port 8123 like I do in my first example, see the docs here:
<https://docs.puppetlabs.com/pe/latest/status_api.html#authenticating-requests>


I installed a couple of python things for these examples.

```
pip install httpie
pip install requests
```

#####If you are going to try to manage the CA API for cert signing from a machine other than the master:
**Warning**: If you are running PE 2015.2 or 2015.2.1, you will need to fix a
`puppet_enterprise` profile class before you can manage the `client_whitelist`.
This only affects the Puppet Server's CA whitelist, not PuppetDB or Console.
This is so you don't get frustrated when it doesn't work when you try this
at home. This is patched in the `2015.2.2` release that probably came
out as you're reading this.

1. Edit `/opt/puppetlabs/puppet/modules/puppet_enterprise/manifests/profile/certificate_authority.pp`
1. Change line #37
    * From: `value   => pe_join($_client_whitelist, ', '),`
    * To: `value   => [$puppet_enterprise::params::console_client_certname] + $client_whitelist,`
