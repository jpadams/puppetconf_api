# puppetconf_api

These examples were done on the Learning VM that you can find at <http://learn.puppetlabs.com>.

If you want to set up your Learning VM to be able to hit the Console Services
'status' API via HTTP on port 8123 like I do in my first example, see the docs here:
<https://docs.puppetlabs.com/pe/latest/status_api.html#authenticating-requests>


I installed a couple of python things for these examples.

```
pip install httpie
pip install requests
```

###If you are going to try to manage the CA API for cert signing from a machine other than the master:
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
